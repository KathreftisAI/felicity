# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMWorkOrder::MenuWithTakePermission;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::ITSMChange::ITSMWorkOrder',
    'Kernel::System::Log',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get UserID param
    $Self->{UserID} = $Param{UserID} || die "Got no UserID!";

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{WorkOrder} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need WorkOrder!',
        );
        return;
    }

    # get config for the relevant action
    my $FrontendConfig = $Kernel::OM->Get('Kernel::Config')->Get("ITSMWorkOrder::Frontend::$Param{Config}->{Action}");

    # get the required privilege, 'ro' or 'rw'
    my $RequiredPriv;
    if ( $FrontendConfig && $FrontendConfig->{Permission} ) {

        # get the required priv from the frontend configuration
        $RequiredPriv = $FrontendConfig->{Permission};
    }

    my $Access;
    if ( !$RequiredPriv ) {

        # Display the menu-link, when no privilege is required
        $Access = 1;
    }
    else {

        # check permissions, based on the required privilege
        # query the permission modules registered in 'ITSMWorkOrder::TakePermission'
        $Access = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->Permission(
            Type               => $RequiredPriv,
            Action             => $Param{Config}->{Action},
            PermissionRegistry => 'ITSMWorkOrder::TakePermission',
            WorkOrderID        => $Param{WorkOrder}->{WorkOrderID},
            UserID             => $Self->{UserID},
            LogNo              => 1,
        );
    }

    return $Param{Counter} if !$Access;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # output menu block
    $LayoutObject->Block( Name => 'Menu' );

    # output menu item
    $LayoutObject->Block(
        Name => 'MenuItem',
        Data => {
            %Param,
            %{ $Param{WorkOrder} },
            %{ $Param{Config} },
        },
    );

    # output confirmation dialog
    $LayoutObject->Block(
        Name => 'ShowConfirmDialog',
        Data => {
            %Param,
            %{ $Param{WorkOrder} },
            %{ $Param{Config} },
        },
    );

    $Param{Counter}++;

    return $Param{Counter};
}

1;
