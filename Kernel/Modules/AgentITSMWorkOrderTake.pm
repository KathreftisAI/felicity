# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMWorkOrderTake;

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

    # get needed WorkOrderID
    my $WorkOrderID = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'WorkOrderID' );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

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

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMWorkOrder::Frontend::$Self->{Action}");

    # check permissions
    # query the permission modules registered in 'ITSMWorkOrder::TakePermission'
    my $Access = $WorkOrderObject->Permission(
        Type               => $Self->{Config}->{Permission},
        Action             => $Self->{Action},
        PermissionRegistry => 'ITSMWorkOrder::TakePermission',
        WorkOrderID        => $WorkOrderID,
        UserID             => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    if ( $Self->{Subaction} eq 'WorkOrderTake' ) {

        # set the current user as the workorder agent
        my $CouldUpdateWorkOrder = $WorkOrderObject->WorkOrderUpdate(
            WorkOrderID      => $WorkOrderID,
            WorkOrderAgentID => $Self->{UserID},
            UserID           => $Self->{UserID},
        );

        if ($CouldUpdateWorkOrder) {

            # redirect to workorder, when the update was successful
            return $LayoutObject->Redirect(
                OP => "Action=AgentITSMWorkOrderZoom;WorkOrderID=$WorkOrderID",
            );
        }
        else {

            # show error message
            return $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}
                    ->Translate( 'Was not able to take the workorder %s!', $WorkOrderID ),
                Comment => Translatable('Please contact the admin.'),
            );
        }
    }

    # Login name of the current workorder agent
    my $WorkOrderAgent = '-';
    if ( $WorkOrder->{WorkOrderAgentID} ) {
        $WorkOrderAgent = $Kernel::OM->Get('Kernel::System::User')->UserLookup(
            UserID => $WorkOrder->{WorkOrderAgentID},
        );
    }

    # get change that workorder belongs to
    my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $WorkOrder->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # check if change is found
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'Could not find Change for WorkOrder %s!', $WorkOrderID ),
            Comment => Translatable('Please contact the admin.'),
        );
    }

    # output content
    my $Output = $LayoutObject->Output(
        TemplateFile => 'AgentITSMWorkOrderTake',
        Data         => {
            %Param,
            %{$Change},
            %{$WorkOrder},
            WorkOrderAgent => $WorkOrderAgent,
        },
    );

    # build the returned data structure
    my %Data = (
        HTML       => $Output,
        DialogType => 'Confirmation',
    );

    # return JSON-String because of AJAX-Mode
    my $OutputJSON = $LayoutObject->JSONEncode( Data => \%Data );

    return $LayoutObject->Attachment(
        ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
        Content     => $OutputJSON,
        Type        => 'inline',
        NoCache     => 1,
    );
}

1;
