# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMWorkOrderAgent;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get needed object
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get needed WorkOrderID
    my $WorkOrderID = $ParamObject->GetParam( Param => 'WorkOrderID' );

    # check needed stuff
    if ( !$WorkOrderID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No WorkOrderID is given!'),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get workorder object
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

    # get workorder data
    my $WorkOrder = $WorkOrderObject->WorkOrderGet(
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # check error
    if ( !$WorkOrder ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'WorkOrder "%s" not found in database!', $WorkOrderID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # get config for frontend
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMWorkOrder::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $ChangeObject->Permission(
        Type        => $Self->{Config}->{Permission},
        Action      => $Self->{Action},
        ChangeID    => $WorkOrder->{ChangeID},
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'You need %s permissions on the change!', $Self->{Config}->{Permission}
            ),
            WithHeader => 'yes',
        );
    }

    my %GetParam;
    for my $ParamName (qw(User UserSelected)) {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    my $UserServerError = '';

    # handle the 'Save' subaction
    if ( $Self->{Subaction} eq 'Save' ) {

        # workorder agent is empty and no button but the 'Save' button is clicked
        if ( !$GetParam{User} ) {

            # setting workorder agent to empty
            my $CouldUpdateWorkOrder = $WorkOrderObject->WorkOrderUpdate(
                WorkOrderID      => $WorkOrder->{WorkOrderID},
                WorkOrderAgentID => undef,
                UserID           => $Self->{UserID},
            );

            if ($CouldUpdateWorkOrder) {

                # load new URL in parent window and close popup
                return $LayoutObject->PopupClose(
                    URL => $Self->{LastWorkOrderView},
                );

            }
            else {

                # show error message
                return $LayoutObject->ErrorScreen(
                    Message => $LayoutObject->{LanguageObject}->Translate(
                        'Was not able to set the workorder agent of the workorder "%s" to empty!',
                        $WorkOrder->{WorkOrderID}
                    ),
                    Comment => Translatable('Please contact the admin.'),
                );
            }
        }

        # if a workorder agent is selected and no button but the 'Save' button is clicked
        elsif ( $GetParam{UserSelected} ) {

            # workorder agent is required for an update
            my %ErrorAllRequired = $Self->_CheckWorkOrderAgent(%GetParam);

            # if everything is fine
            if ( !%ErrorAllRequired ) {

                my $CouldUpdateWorkOrder = $WorkOrderObject->WorkOrderUpdate(
                    WorkOrderID      => $WorkOrder->{WorkOrderID},
                    WorkOrderAgentID => $GetParam{UserSelected},
                    UserID           => $Self->{UserID},
                );

                if ($CouldUpdateWorkOrder) {

                    # load new URL in parent window and close popup
                    return $LayoutObject->PopupClose(
                        URL =>
                            "Action=AgentITSMWorkOrderZoom;WorkOrderID=$WorkOrder->{WorkOrderID}",
                    );
                }
                else {

                    # show error message
                    return $LayoutObject->ErrorScreen(
                        Message => $LayoutObject->{LanguageObject}->Translate(
                            'Was not able to update the workorder "%s"!', $WorkOrder->{WorkOrderID}
                        ),
                        Comment => Translatable('Please contact the admin.'),
                    );
                }
            }
            else {
                if ( $ErrorAllRequired{User} ) {
                    $UserServerError = 'ServerError';
                }
            }
        }
        elsif ( !$GetParam{UserSelected} ) {
            $UserServerError = 'ServerError';
        }
    }

    # show current workorder agent
    if ( $WorkOrder->{WorkOrderAgentID} ) {
        my %UserData = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
            UserID => $WorkOrder->{WorkOrderAgentID},
        );

        $Param{UserID} = $UserData{UserID};
        $Param{User}   = sprintf '"%s %s" <%s>',
            $UserData{UserFirstname},
            $UserData{UserLastname},
            $UserData{UserEmail};
    }

    # get change that workorder belongs to
    my $Change = $ChangeObject->ChangeGet(
        ChangeID => $WorkOrder->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # check whether change was found
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'Could not find Change for WorkOrder %s!', $WorkOrderID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    $LayoutObject->Block(
        Name => 'UserSearchInit',
        Data => {
            ItemID => 'User',
        },
    );

    # output header
    my $Output = $LayoutObject->Header(
        Title => $WorkOrder->{WorkOrderTitle},
        Type  => 'Small',
    );

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMWorkOrderAgent',
        Data         => {
            UserServerError => $UserServerError,
            %Param,
            %{$Change},
            %{$WorkOrder},
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer( Type => 'Small' );

    return $Output;
}

sub _CheckWorkOrderAgent {
    my ( $Self, %Param ) = @_;

    # hash for error info
    my %Errors;

    # check workorder agent
    if ( !$Param{User} || !$Param{UserSelected} ) {
        $Errors{User} = 1;
    }
    else {

        # get workorder agent data
        my %User = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
            UserID => $Param{UserSelected},
        );

        # show error if user not exists
        if ( !%User ) {
            $Errors{User} = 1;
        }
        else {

            # compare input value with user data
            my $CheckString = sprintf '"%s %s" <%s>',
                $User{UserFirstname},
                $User{UserLastname},
                $User{UserEmail};

            # show error
            if ( $CheckString ne $Param{User} ) {
                $Errors{User} = 1;
            }
        }
    }

    return %Errors;
}

1;
