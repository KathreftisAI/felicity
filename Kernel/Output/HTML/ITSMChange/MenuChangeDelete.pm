# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMChange::MenuChangeDelete;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Group',
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
    if ( !$Param{Change} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Change!',
        );
        return;
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get config for the relevant action
    my $FrontendConfig = $ConfigObject->Get("ITSMChange::Frontend::$Param{Config}->{Action}");

    # get the required privilege, 'ro' or 'rw'
    my $RequiredPriv;
    if ($FrontendConfig) {

        # get the required priv from the frontend configuration
        $RequiredPriv = $FrontendConfig->{Permission};
    }

    my $Access;
    if ( !$RequiredPriv ) {

        # Display the menu-link, when no privilege is required
        $Access = 1;
    }
    else {

        # get the required group for the frontend module
        my $Group = $ConfigObject->Get('Frontend::Module')->{ $Param{Config}->{Action} }
            ->{GroupRo}->[0];

        # deny access, when the group is not found
        return $Param{Counter} if !$Group;

        # get group object
        my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

        # get the group id
        my $GroupID = $GroupObject->GroupLookup( Group => $Group );

        # deny access, when the group is not found
        return $Param{Counter} if !$GroupID;

        # get user groups, where the user has the appropriate privilege
        my %Groups = $GroupObject->GroupMemberList(
            UserID => $Self->{UserID},
            Type   => $RequiredPriv,
            Result => 'HASH',
        );

        # grant access if the agent has the appropriate type in the appropriate group
        if ( $Groups{$GroupID} ) {
            $Access = 1;
        }
    }

    return $Param{Counter} if !$Access;

    # build a lookup hash for the allowed change states
    my %AllowedChangeStates = map { $_ => 1 } @{ $FrontendConfig->{ChangeStates} };

    # only show the delete link for changes in the allowed change states
    return $Param{Counter} if !$AllowedChangeStates{ $Param{Change}->{ChangeState} };

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # output menu block
    $LayoutObject->Block( Name => 'Menu' );

    # output seperator, when this is not the first menu item
    if ( $Param{Counter} ) {
        $LayoutObject->Block( Name => 'MenuItemSplit' );
    }

    # output menu item
    $LayoutObject->Block(
        Name => 'MenuItem',
        Data => {
            %Param,
            %{ $Param{Change} },
            %{ $Param{Config} },
        },
    );

    # check if a dialog has to be shown
    if ( $Param{Config}->{DialogTitle} ) {

        # output confirmation dialog
        $LayoutObject->Block(
            Name => 'ShowConfirmDialog',
            Data => {
                %Param,
                %{ $Param{Change} },
                %{ $Param{Config} },
            },
        );
    }

    $Param{Counter}++;

    return $Param{Counter};
}

1;
