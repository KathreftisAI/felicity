# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMWorkOrderHistoryZoom;

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

    # get needed change id
    my $HistoryEntryID = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'HistoryEntryID' );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$HistoryEntryID ) {

        # error page
        return $LayoutObject->ErrorScreen(
            Message => Translatable('Can\'t show history zoom, no HistoryEntryID is given!'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get history entries
    my $HistoryEntry = $Kernel::OM->Get('Kernel::System::ITSMChange::History')->HistoryEntryGet(
        HistoryEntryID => $HistoryEntryID,
        UserID         => $Self->{UserID},
    );

    if ( !$HistoryEntry ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'History entry "%s" not found in the database!', $HistoryEntryID
            ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get workorder object
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMWorkOrder::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $WorkOrderObject->Permission(
        Type        => $Self->{Config}->{Permission},
        Action      => $Self->{Action},
        WorkOrderID => $HistoryEntry->{WorkOrderID},
        UserID      => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    # get workorder information
    my $WorkOrder = $WorkOrderObject->WorkOrderGet(
        WorkOrderID => $HistoryEntry->{WorkOrderID},
        UserID      => $Self->{UserID},
    );

    # check error
    if ( !$WorkOrder ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'WorkOrder "%s" not found in the database!', $HistoryEntry->{WorkOrderID}
            ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get change information
    my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $HistoryEntry->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # check error
    if ( !$WorkOrder ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}
                ->Translate( 'Change "%s" not found in the database!', $HistoryEntry->{ChangeID} ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # show dash ('-') when the field is empty
    for my $Field (qw(ContentNew ContentOld)) {
        $HistoryEntry->{$Field} ||= '-'
    }

    # output header
    my $Output = $LayoutObject->Header(
        Type  => 'Small',
        Title => Translatable('WorkOrder History Zoom'),
    );

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMWorkOrderHistoryZoom',
        Data         => {
            %Param,
            %{$Change},
            %{$WorkOrder},
            %{$HistoryEntry},
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer(
        Type => 'Small',
    );

    return $Output;
}

1;
