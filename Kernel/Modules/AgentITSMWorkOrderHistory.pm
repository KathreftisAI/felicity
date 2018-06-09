# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMWorkOrderHistory;

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

    # get needed workorder id
    my $WorkOrderID = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'WorkOrderID' );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$WorkOrderID ) {

        # error page
        return $LayoutObject->ErrorScreen(
            Message => Translatable('Can\'t show history, as no WorkOrderID is given!'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get needed objects
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    # get config of frontend module
    $Self->{Config} = $ConfigObject->Get("ITSMWorkOrder::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $WorkOrderObject->Permission(
        Type        => $Self->{Config}->{Permission},
        Action      => $Self->{Action},
        WorkOrderID => $WorkOrderID,
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
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    );

    # check error
    if ( !$WorkOrder ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'WorkOrder "%s" not found in the database!', $WorkOrderID ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get change information
    my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
        ChangeID => $WorkOrder->{ChangeID},
        UserID   => $Self->{UserID},
    );

    # check error
    if ( !$Change ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}
                ->Translate( 'Change "%s" not found in the database!', $WorkOrder->{ChangeID} ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get history entries
    my $HistoryEntriesRef = $Kernel::OM->Get('Kernel::System::ITSMChange::History')->WorkOrderHistoryGet(
        WorkOrderID => $WorkOrderID,
        UserID      => $Self->{UserID},
    ) || [];

    # get order direction
    my @HistoryLines = @{$HistoryEntriesRef};
    if ( $ConfigObject->Get('ITSMChange::Frontend::HistoryOrder') eq 'reverse' ) {
        @HistoryLines = reverse @{$HistoryEntriesRef};
    }

    # max length of strings
    my $MaxLength = 30;

    # create table
    my $Counter = 1;
    for my $HistoryEntry (@HistoryLines) {
        $Counter++;

        # data for a single row, will be passed to the dtl
        my %Data = %{$HistoryEntry};

        # determine what should be shown
        my $HistoryType = $HistoryEntry->{HistoryType};
        if ( $HistoryType eq 'WorkOrderUpdate' ) {

            # The displayed fieldname might be changed in the following loop
            my $DisplayedFieldname = $HistoryEntry->{Fieldname};

            # set default values for some keys
            for my $ContentNewOrOld (qw(ContentNew ContentOld)) {
                if ( !defined $HistoryEntry->{$ContentNewOrOld} ) {
                    $HistoryEntry->{$ContentNewOrOld} = '-';
                }
                else {

                    # for the ID fields, we replace ID with its textual value
                    if (
                        my ($Type) = $HistoryEntry->{Fieldname} =~ m{
                            \A          # string start
                            (           # start capture of $Type
                                WorkOrderState | WorkOrderType
                                | WorkOrderAgent
                            )           # end capture of $Type
                            ID          # processing only for the 'ID' fields
                        }xms
                        )
                    {
                        if ( $HistoryEntry->{$ContentNewOrOld} ) {
                            my $Value;
                            my $TranslationNeeded = 1;
                            if ( $Type eq 'WorkOrderState' ) {
                                $Value = $WorkOrderObject->WorkOrderStateLookup(
                                    WorkOrderStateID => $HistoryEntry->{$ContentNewOrOld},
                                );
                            }
                            elsif ( $Type eq 'WorkOrderType' ) {
                                $Value = $WorkOrderObject->WorkOrderTypeLookup(
                                    WorkOrderTypeID => $HistoryEntry->{$ContentNewOrOld},
                                );
                            }
                            elsif ( $Type eq 'WorkOrderAgent' ) {
                                $Value = $Kernel::OM->Get('Kernel::System::User')->UserLookup(
                                    UserID => $HistoryEntry->{$ContentNewOrOld},
                                );

                                # the login names are not to be translated
                                $TranslationNeeded = 0;
                            }
                            else {
                                return $LayoutObject->ErrorScreen(
                                    Message => $LayoutObject->{LanguageObject}
                                        ->Translate( 'Unknown type "%s" encountered!', $Type ),
                                    Comment => Translatable('Please contact the administrator.'),
                                );
                            }

                            # E.g. the usernames should not be translated
                            my $TranslatedValue = $TranslationNeeded
                                ?
                                $LayoutObject->{LanguageObject}->Translate($Value)
                                :
                                $Value;

                            $HistoryEntry->{$ContentNewOrOld} = sprintf '%s (ID=%s)',
                                $TranslatedValue, $HistoryEntry->{$ContentNewOrOld};
                        }
                        else {
                            $HistoryEntry->{$ContentNewOrOld} = '-';
                        }

                        # The content has changed, so change the displayed fieldname as well
                        $DisplayedFieldname = $Type;
                    }

                    # replace HTML breaks with single space
                    $HistoryEntry->{$ContentNewOrOld} =~ s{ < br \s* /? > }{ }xmsg;
                }
            }

            # translate fieldname for display
            $DisplayedFieldname = $LayoutObject->{LanguageObject}->Translate(
                $DisplayedFieldname,
            );

            # get HTML utils object
            my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

            # trim strings to a max length of $MaxLength
            my $ContentNew = $HTMLUtilsObject->ToAscii(
                String => $HistoryEntry->{ContentNew} || '-',
            );
            my $ContentOld = $HTMLUtilsObject->ToAscii(
                String => $HistoryEntry->{ContentOld} || '-',
            );

            # show [...] for too long strings
            for my $Content ( $ContentNew, $ContentOld ) {
                if ( $Content && ( length $Content > $MaxLength ) ) {
                    $Content = substr( $Content, 0, $MaxLength ) . '[...]';
                }
            }

            # set description
            $Data{Content} = join '%%', $DisplayedFieldname, $ContentNew, $ContentOld;
        }
        else {
            $Data{Content} = $HistoryEntry->{ContentNew};
        }

        # replace text
        if ( $Data{Content} ) {

            # remove leading %%
            $Data{Content} =~ s{ \A %% }{}xmsg;

            # split the content by %%
            my @Values = split( /%%/, $Data{Content} );

            # show 'nice' output with variable substitution
            # sample input:
            # ChangeHistory::ChangeLinkAdd", "Ticket", "1
            $Data{Content} = $LayoutObject->{LanguageObject}->Translate(
                'WorkOrderHistory::' . $Data{HistoryType},
                @Values,
            );

            # remove not needed place holder
            $Data{Content} =~ s{ % s }{}xmsg;
        }

        $LayoutObject->Block(
            Name => 'Row',
            Data => {%Data},
        );

        # show a 'more info' link
        if (
            (
                $HistoryEntry->{ContentNew}
                && length( $HistoryEntry->{ContentNew} ) > $MaxLength
            )
            ||
            (
                $HistoryEntry->{ContentOld}
                && length( $HistoryEntry->{ContentOld} ) > $MaxLength
            )
            )
        {

            # show historyzoom block
            $LayoutObject->Block(
                Name => 'ShowHistoryZoom',
                Data => {%Data},
            );
        }

        # don't show a link
        else {
            $LayoutObject->Block(
                Name => 'NoHistoryZoom',
            );
        }

        $LayoutObject->Block(
            Name => 'ShowWorkOrderZoom',
            Data => {%Data},
        );

    }

    # output header
    my $Output = $LayoutObject->Header(
        Type  => 'Small',
        Title => Translatable('WorkOrder History'),
    );

    # start template output
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMWorkOrderHistory',
        Data         => {
            %Param,
            %{$Change},
            %{$WorkOrder},
        },
    );

    # add footer
    $Output .= $LayoutObject->Footer(
        Type => 'Small',
    );

    return $Output;
}

1;
