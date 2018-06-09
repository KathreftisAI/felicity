# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeHistoryZoom;

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
                'HistoryEntry "%s" not found in database!', $HistoryEntryID
            ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $ChangeObject->Permission(
        Type     => $Self->{Config}->{Permission},
        Action   => $Self->{Action},
        ChangeID => $HistoryEntry->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    # get change information
    my $Change = $ChangeObject->ChangeGet(
        ChangeID => $HistoryEntry->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # check error
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'Change "%s" not found in the database!', $HistoryEntry->{ChangeID}
            ),
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
        Title => 'ChangeHistoryZoom',
    );

    # handle condition update
    if ( $HistoryEntry->{HistoryType} eq 'ConditionUpdate' ) {
        $HistoryEntry->{ContentNew} =~ s{ \A \d+ %% (.+) \z }{$1}xms;
        $HistoryEntry->{ContentOld} =~ s{ \A \d+ %% (.+) \z }{$1}xms;
    }

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeHistoryZoom',
        Data         => {
            %Param,
            %{$Change},
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
