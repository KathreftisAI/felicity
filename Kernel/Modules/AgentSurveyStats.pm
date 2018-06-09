# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentSurveyStats;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get common objects
    %{$Self} = %Param;

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("Survey::Frontend::$Self->{Action}");

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Output;

    # get needed object
    my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $SurveyID  = $ParamObject->GetParam( Param => "SurveyID" )  || '';
    my $RequestID = $ParamObject->GetParam( Param => "RequestID" ) || '';

    my $SurveyExists = 'no';
    if ($SurveyID) {
        $SurveyExists = $SurveyObject->ElementExists(
            ElementID => $SurveyID,
            Element   => 'Survey'
        );
    }

    my $RequestExists = 'no';
    if ($RequestID) {
        $RequestExists = $SurveyObject->ElementExists(
            ElementID => $RequestID,
            Element   => 'Request'
        );
    }

    # ------------------------------------------------------------ #
    # stats
    # ------------------------------------------------------------ #
    if ( !$Self->{Subaction} ) {

        # check if survey exists
        if ( $SurveyExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey!'),
                WithHeader => 'yes',
            );
        }
        $Output = $LayoutObject->Header(
            Title     => Translatable('Stats Overview'),
            Type      => 'Small',
            BodyClass => 'Popup',
        );

        my %Survey = $SurveyObject->SurveyGet(
            SurveyID => $SurveyID,
        );

        # print the main table.
        $LayoutObject->Block(
            Name => 'Stats',
            Data => {%Survey},
        );
        my @List = $SurveyObject->VoteList(
            SurveyID => $SurveyID,
        );

        # get ticket object
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

        for my $Vote (@List) {
            $Vote->{SurveyID} = $SurveyID;
            my %Ticket = $TicketObject->TicketGet(
                TicketID => $Vote->{TicketID},
            );
            $Vote->{TicketNumber} = $Ticket{TicketNumber};
            $LayoutObject->Block(
                Name => 'StatsVote',
                Data => $Vote,
            );
        }
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentSurveyStats',
            Data         => {%Param},
        );

        $Output .= $LayoutObject->Footer(
            Type => 'Small',
        );

        return $Output;
    }

    # ------------------------------------------------------------ #
    # stats details
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'StatsDetail' ) {
        my $TicketNumber = $ParamObject->GetParam( Param => "TicketNumber" );

        # check if survey exists
        if ( $SurveyExists ne 'Yes' || $RequestExists ne 'Yes' ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey or stats detail!'),
                WithHeader => 'yes',
            );
        }
        $Output = $LayoutObject->Header(
            Title     => Translatable('Stats Detail'),
            Type      => 'Small',
            BodyClass => 'Popup',
        );

        my %Survey = $SurveyObject->SurveyGet(
            SurveyID => $SurveyID,
        );

        # print the main table.
        $LayoutObject->Block(
            Name => 'StatsDetail',
            Data => {
                %Survey,
                TicketNumber => $TicketNumber,
            },
        );
        my @QuestionList = $SurveyObject->QuestionList(
            SurveyID => $SurveyID,
        );
        for my $Question (@QuestionList) {

            my $Class = '';
            if ( $Question->{Type} eq 'Textarea' ) {
                $Class = 'Textarea';
            }

            my $RequiredText = '';
            if ( $Question->{AnswerRequired} ) {
                $Class .= ' Mandatory';
                $RequiredText = '* ';
            }

            $LayoutObject->Block(
                Name => 'StatsDetailQuestion',
                Data => {
                    %{$Question},
                    Class        => $Class,
                    RequiredText => $RequiredText,
                },
            );
            my @Answers;
            if ( $Question->{Type} eq 'Radio' || $Question->{Type} eq 'Checkbox' ) {
                my @AnswerList;
                @AnswerList = $SurveyObject->VoteGet(
                    RequestID  => $RequestID,
                    QuestionID => $Question->{QuestionID},
                );
                for my $Row (@AnswerList) {
                    my %Answer = $SurveyObject->AnswerGet(
                        AnswerID => $Row->{VoteValue},
                    );
                    my %Data;
                    $Data{Answer} = $Answer{Answer};
                    push( @Answers, \%Data );
                }
            }
            elsif ( $Question->{Type} eq 'YesNo' || $Question->{Type} eq 'Textarea' ) {
                my @List = $SurveyObject->VoteGet(
                    RequestID  => $RequestID,
                    QuestionID => $Question->{QuestionID},
                );

                my %Data;
                $Data{Answer} = $List[0]->{VoteValue};

                # clean HTML
                if ( $Question->{Type} eq 'Textarea' && $Data{Answer} ) {
                    $Data{Answer} =~ s{\A\$html\/text\$\s(.*)}{$1}xms;
                    $Data{Answer} = $LayoutObject->Ascii2Html(
                        Text           => $Data{Answer},
                        HTMLResultMode => 1,
                    );
                    $Data{Answer} = $Kernel::OM->Get('Kernel::System::HTMLUtils')->ToAscii(
                        String => $Data{Answer},
                    );
                }
                push( @Answers, \%Data );
            }
            for my $Row (@Answers) {
                $LayoutObject->Block(
                    Name => 'StatsDetailAnswer',
                    Data => {
                        %{$Row},
                        Class => $Class,
                    },
                );
            }
        }
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AgentSurveyStats',
            Data         => {%Param},
        );
        $Output .= $LayoutObject->Footer(
            Type => 'Small',
        );

        return $Output;
    }
}

1;
