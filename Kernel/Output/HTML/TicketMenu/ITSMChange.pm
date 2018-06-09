# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::TicketMenu::ITSMChange;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Group',
    'Kernel::System::ITSMChange',
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
    if ( !$Param{Ticket} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Ticket!',
        );
        return;
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # if an action parameter was given
    if ( $Param{Config}->{Action} ) {

        # check if frontend module is registered, if not, do not show action
        my $Module = $ConfigObject->Get('Frontend::Module')->{ $Param{Config}->{Action} };
        return if !$Module;

        # check if current user has the permission for the given action
        if ( $Module->{GroupRo} && ref $Module->{GroupRo} eq 'ARRAY' && @{ $Module->{GroupRo} } ) {

            my $Access;

            GROUP:
            for my $Group ( @{ $Module->{GroupRo} } ) {

                # get group object
                my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

                # lookup the group id
                my $GroupID = $GroupObject->GroupLookup(
                    Group => $Group,
                );

                # do not grant access, when the group is not found
                next GROUP if !$GroupID;

                # get user groups, where the user has the 'ro' privilege
                my %Groups = $GroupObject->GroupMemberList(
                    UserID => $Self->{UserID},
                    Type   => 'ro',
                    Result => 'HASH',
                );

                # remember that the user has access
                if ( $Groups{$GroupID} ) {
                    $Access = 1;
                }
            }

            # do not grant access if the agent doesn't have the 'ro' rights in the group
            return if !$Access;
        }
    }

    # the link is shown only for the configured ticket types,
    # so the ticket needs to have a type.
    return if !$Param{Ticket}->{Type};

    # get and check the list of relevant ticket types
    my $AddChangeLinkTicketTypes = $ConfigObject->Get('ITSMChange::AddChangeLinkTicketTypes');

    return if !$AddChangeLinkTicketTypes;
    return if ref $AddChangeLinkTicketTypes ne 'ARRAY';
    return if !@{$AddChangeLinkTicketTypes};

    # check whether the ticket's type is relevant
    my %IsRelevant = map { $_ => 1 } @{$AddChangeLinkTicketTypes};

    return if !$IsRelevant{ $Param{Ticket}->{Type} };

    # check permission
    my $FrontendConfig = $ConfigObject->Get("ITSMChange::Frontend::$Param{Config}->{Action}");

    if ( $FrontendConfig && $FrontendConfig->{Permission} ) {

        my $Access = $Kernel::OM->Get('Kernel::System::ITSMChange')->Permission(
            Type   => $FrontendConfig->{Permission},
            Action => $Param{Config}->{Action},
            UserID => $Self->{UserID},
            LogNo  => 1,
        );

        return if !$Access;
    }

    return { %{ $Param{Config} }, %{ $Param{Ticket} }, %Param, };
}

1;
