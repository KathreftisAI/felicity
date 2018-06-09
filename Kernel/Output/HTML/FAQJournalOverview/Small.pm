# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::FAQJournalOverview::Small;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Output::HTML::Layout',
    'Kernel::System::FAQ',
    'Kernel::System::Log',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # get UserID param
    $Self->{UserID} = $Param{UserID} || die "Got no UserID!";

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(PageShown StartHit)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # need Journal
    if ( !$Param{Journal} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need the Journal!',
        );
        return;
    }

    # store the journal locally
    my @JournalEntries;
    if ( $Param{Journal} && ref $Param{Journal} eq 'ARRAY' ) {
        @JournalEntries = @{ $Param{Journal} };
    }

    my @ShowColumns;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # show Journal Entries as rows
    if (@JournalEntries) {

        # check ShowColumns parameter
        if ( $Param{ShowColumns} && ref $Param{ShowColumns} eq 'ARRAY' ) {
            @ShowColumns = @{ $Param{ShowColumns} };
        }

        # build column header blocks
        if (@ShowColumns) {

            # call main block
            $LayoutObject->Block( Name => 'RecordForm' );

            for my $Column (@ShowColumns) {

                # call header specific block
                $LayoutObject->Block(
                    Name => 'Record' . $Column . 'Header',
                    Data => {
                        %Param,
                    },
                );
            }
        }

        my $Counter = 0;

        # get FAQ object
        my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

        JOURNALENTRY:
        for my $JournalEntry (@JournalEntries) {
            $Counter++;
            if (
                $Counter >= $Param{StartHit}
                && $Counter < ( $Param{PageShown} + $Param{StartHit} )
                )
            {

                # get FAQ data for corruption check
                my %FAQ = $FAQObject->FAQGet(
                    ItemID     => $JournalEntry->{ItemID},
                    ItemFields => 0,
                    UserID     => $Self->{UserID},
                );

                $JournalEntry->{CleanSubject} = $FAQObject->FAQArticleTitleClean(
                    Title => $FAQ{Title},
                    Size  => $Param{TitleSize},
                );

                next JOURNALENTRY if !%FAQ;

                # build record block
                $LayoutObject->Block(
                    Name => 'Record',
                    Data => {
                        %Param,
                        %{$JournalEntry},
                        Counter => $Counter,
                    },
                );

                # build column record blocks
                if (@ShowColumns) {

                    COLUMN:
                    for my $Column (@ShowColumns) {
                        $LayoutObject->Block(
                            Name => 'Record' . $Column,
                            Data => {
                                %Param,
                                %{$JournalEntry},
                            },
                        );

                        # show links if available
                        $LayoutObject->Block(
                            Name => 'Record' . $Column . 'LinkStart',
                            Data => {
                                %Param,
                                %{$JournalEntry},
                            },
                        );
                        $LayoutObject->Block(
                            Name => 'Record' . $Column . 'LinkEnd',
                            Data => {
                                %Param,
                                %{$JournalEntry},
                            },
                        );
                    }
                }
            }
        }
    }

    # otherwise set an No FAQ Journal message
    else {
        $LayoutObject->Block( Name => 'NoFAQFound' );
    }

    # use template
    my $Output = $LayoutObject->Output(
        TemplateFile => 'AgentFAQJournalOverviewSmall',
        Data         => {
            %Param,
            Type        => $Self->{ViewType},
            ColumnCount => scalar @ShowColumns,
        },
    );

    return $Output;
}

1;
