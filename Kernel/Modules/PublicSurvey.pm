# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::PublicSurvey;

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

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Output;

    my %Answers;
    my %Errors;
    my @QuestionList;

    # get needed object
    my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # ------------------------------------------------------------ #
    # public survey vote
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'PublicSurveyVote' ) {
        my $PublicSurveyKey = $ParamObject->GetParam( Param => 'PublicSurveyKey' );

        # get survey from public key
        my %Survey = $SurveyObject->PublicSurveyGet(
            PublicSurveyKey => $PublicSurveyKey,
        );
        if ( $Survey{SurveyID} ) {
            @QuestionList = $SurveyObject->QuestionList(
                SurveyID => $Survey{SurveyID},
            );

            for my $Question (@QuestionList) {
                if ( $Question->{Type} eq 'YesNo' ) {
                    my $PublicSurveyVote1 = $ParamObject->GetParam(
                        Param => "PublicSurveyVote1[$Question->{QuestionID}]"
                    );

                    if (
                        $Question->{AnswerRequired}
                        && ( !$PublicSurveyVote1 || !length $PublicSurveyVote1 )
                        )
                    {
                        $Errors{ $Question->{QuestionID} }{'Answer required'} = 1;
                    }

                    $Answers{ $Question->{QuestionID} } = $PublicSurveyVote1;
                }
                elsif ( $Question->{Type} eq 'Radio' ) {
                    my $PublicSurveyVote2 = $ParamObject->GetParam(
                        Param => "PublicSurveyVote2[$Question->{QuestionID}]"
                    );

                    if (
                        $Question->{AnswerRequired}
                        && ( !$PublicSurveyVote2 || !length $PublicSurveyVote2 )
                        )
                    {
                        $Errors{ $Question->{QuestionID} }{'Answer required'} = 1;
                    }

                    $Answers{ $Question->{QuestionID} } = $PublicSurveyVote2;
                }
                elsif ( $Question->{Type} eq 'Checkbox' ) {
                    my @AnswerList = $SurveyObject->AnswerList(
                        QuestionID => $Question->{QuestionID}
                    );

                    for my $Answer (@AnswerList) {
                        my $PublicSurveyVote3 = $ParamObject->GetParam(
                            Param => "PublicSurveyVote3[$Answer->{AnswerID}]"
                        );
                        if ( $PublicSurveyVote3 && $PublicSurveyVote3 eq 'Yes' ) {
                            push @{ $Answers{ $Question->{QuestionID} } }, $Answer->{AnswerID};
                        }
                    }
                    if (
                        $Question->{AnswerRequired}
                        && (
                            !defined $Answers{ $Question->{QuestionID} }
                            || (
                                ref $Answers{ $Question->{QuestionID} } ne 'ARRAY'
                                && !@{ $Answers{ $Question->{QuestionID} } }
                            )
                        )
                        )
                    {
                        $Errors{ $Question->{QuestionID} }{'Answer required'} = 1;
                    }
                }
                elsif ( $Question->{Type} eq 'Textarea' ) {
                    my $PublicSurveyVote4 = $ParamObject->GetParam(
                        Param => "PublicSurveyVote4[$Question->{QuestionID}]"
                    );

                    # check if rich text is enabled
                    if ( $LayoutObject->{BrowserRichText} ) {
                        $PublicSurveyVote4 = ( length $PublicSurveyVote4 )
                            ? "\$html/text\$ $PublicSurveyVote4"
                            : '';
                    }
                    if (
                        $Question->{AnswerRequired}
                        &&
                        ( !$PublicSurveyVote4 || !length $PublicSurveyVote4 )
                        )
                    {
                        $Errors{ $Question->{QuestionID} }{'Answer required'} = 1;
                    }
                    $Answers{ $Question->{QuestionID} } = $PublicSurveyVote4;
                }
            }

            # If we didn't have errors, just save the answers
            if ( !scalar keys %Errors ) {
                for my $Question (@QuestionList) {
                    if ( $Question->{Type} eq 'YesNo' ) {
                        $SurveyObject->PublicAnswerSet(
                            PublicSurveyKey => $PublicSurveyKey,
                            QuestionID      => $Question->{QuestionID},
                            VoteValue       => $Answers{ $Question->{QuestionID} },
                        );
                    }
                    elsif ( $Question->{Type} eq 'Radio' ) {
                        $SurveyObject->PublicAnswerSet(
                            PublicSurveyKey => $PublicSurveyKey,
                            QuestionID      => $Question->{QuestionID},
                            VoteValue       => $Answers{ $Question->{QuestionID} },
                        );
                    }
                    elsif ( $Question->{Type} eq 'Checkbox' ) {
                        my @AnswerList = $SurveyObject->AnswerList(
                            QuestionID => $Question->{QuestionID}
                        );
                        if (
                            $Answers{ $Question->{QuestionID} }
                            && ref $Answers{ $Question->{QuestionID} } eq 'ARRAY'
                            && @{ $Answers{ $Question->{QuestionID} } }
                            )
                        {
                            for my $Answer ( @{ $Answers{ $Question->{QuestionID} } } ) {
                                $SurveyObject->PublicAnswerSet(
                                    PublicSurveyKey => $PublicSurveyKey,
                                    QuestionID      => $Question->{QuestionID},
                                    VoteValue       => $Answer,
                                );
                            }
                        }
                    }
                    elsif ( $Question->{Type} eq 'Textarea' ) {
                        $SurveyObject->PublicAnswerSet(
                            PublicSurveyKey => $PublicSurveyKey,
                            QuestionID      => $Question->{QuestionID},
                            VoteValue       => $Answers{ $Question->{QuestionID} },
                        );
                    }
                }

                # set survey request as invalid
                $SurveyObject->PublicSurveyInvalidSet(
                    PublicSurveyKey => $PublicSurveyKey,
                );
                $Output = $LayoutObject->CustomerHeader(
                    Title => 'Survey',
                );

                # print the main table.
                $LayoutObject->Block(
                    Name => 'PublicSurveyMessage',
                    Data => {
                        MessageType   => Translatable('Survey Information'),
                        MessageHeader => Translatable('Thank you for your feedback.'),
                        Message       => Translatable('The survey is finished.'),
                    },
                );

                $Output .= $LayoutObject->Output(
                    TemplateFile => 'PublicSurvey',
                    Data         => {%Param},
                );
                $Output .= $LayoutObject->CustomerFooter();

                return $Output;
            }
        }
    }

    # ------------------------------------------------------------ #
    # show survey vote data
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ShowVoteData' ) {
        my $PublicSurveyKey = $ParamObject->GetParam( Param => 'PublicSurveyKey' );

        # return if feature not enabled
        if ( !$ConfigObject->Get("Survey::ShowVoteData") ) {
            $Output = $LayoutObject->CustomerHeader();

            $LayoutObject->Block(
                Name => 'PublicSurveyMessage',
                Data => {
                    MessageType   => Translatable('Survey Message!'),
                    MessageHeader => Translatable('Module not enabled.'),
                    Message       => Translatable(
                        'This functionality is not enabled, please contact your administrator.'
                    ),
                },
            );

            $Output .= $LayoutObject->Output(
                TemplateFile => 'PublicSurvey',
            );

            $Output .= $LayoutObject->CustomerFooter();

            return $Output;
        }

        # Get the request data and start showing the data
        my %RequestData = $SurveyObject->RequestGet(
            PublicSurveyKey => $PublicSurveyKey,
        );

        my $SurveyID  = $RequestData{SurveyID};
        my $TicketID  = $RequestData{TicketID};
        my $RequestID = $RequestData{RequestID};

        # check if survey exists
        my $SurveyExists = $SurveyObject->ElementExists(
            ElementID => $SurveyID,
            Element   => 'Survey'
        );
        my $RequestExists = $SurveyObject->ElementExists(
            ElementID => $RequestID,
            Element   => 'Request'
        );
        if ( $SurveyExists ne 'Yes' || $RequestExists ne 'Yes' ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Message  => "Wrong public survey key: $PublicSurveyKey!",
                Priority => 'info',
            );

            $Output = $LayoutObject->CustomerHeader(
                Title => 'Survey',
            );

            $LayoutObject->Block(
                Name => 'PublicSurveyMessage',
                Data => {
                    MessageType   => Translatable('Survey Error!'),
                    MessageHeader => Translatable('Invalid survey key.'),
                    Message       => Translatable(
                        'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'
                    ),
                },
            );

            $Output .= $LayoutObject->Output(
                TemplateFile => 'PublicSurvey',
            );

            $Output .= $LayoutObject->CustomerFooter();
            return $Output;
        }

        $Output = $LayoutObject->CustomerHeader(
            Title => Translatable('Survey Vote'),
        );

        my %Survey = $SurveyObject->SurveyGet(
            SurveyID => $SurveyID,
            Public   => 1,
        );

        # clean HTML
        if ( $Survey{Introduction} ) {
            $Survey{Introduction} =~ s{\A\$html\/text\$\s(.*)}{$1}xms;

            my $HTMLContent = $1;
            if ( !$HTMLContent ) {
                $Survey{Introduction} = $LayoutObject->Ascii2Html(
                    Text           => $Survey{Introduction},
                    HTMLResultMode => 1,
                );
            }
        }

        # print the main table.
        $LayoutObject->Block(
            Name => 'PublicSurveyVoteData',
            Data => {
                %Survey,
                MessageType => Translatable('Survey Vote Data'),
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
                Name => 'PublicSurveyVoteQuestion',
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

                    if ($1) {
                        $Data{Answer} = $Kernel::OM->Get('Kernel::System::HTMLUtils')->ToAscii(
                            String => $Data{Answer},
                        );
                    }
                }
                push( @Answers, \%Data );
            }
            for my $Row (@Answers) {
                $LayoutObject->Block(
                    Name => 'PublicSurveyVoteAnswer',
                    Data => {
                        %{$Row},
                        Class => $Class,
                    },
                );
            }
        }
        $Output .= $LayoutObject->Output(
            TemplateFile => 'PublicSurvey',
        );
        $Output .= $LayoutObject->CustomerFooter();

        return $Output;
    }

    # ------------------------------------------------------------ #
    # show survey
    # ------------------------------------------------------------ #
    my $PublicSurveyKey = $ParamObject->GetParam( Param => 'PublicSurveyKey' );
    $Output = $LayoutObject->CustomerHeader(
        Title => Translatable('Survey'),
    );

    my $UsedSurveyKey = $SurveyObject->PublicSurveyGet(
        PublicSurveyKey => $PublicSurveyKey,
        Invalid         => 1,
    );

    my %Survey = $SurveyObject->PublicSurveyGet(
        PublicSurveyKey => $PublicSurveyKey,
    );

    $Survey{PublicSurveyKey} = $PublicSurveyKey;

    if ($UsedSurveyKey) {
        $LayoutObject->Block(
            Name => 'PublicSurveyMessage',
            Data => {
                MessageType   => Translatable('Survey Information'),
                MessageHeader => Translatable('Thank you for your feedback.'),
                Message       => Translatable('You have already answered the survey.'),
            },
        );

        if ( $ConfigObject->Get("Survey::ShowVoteData") ) {
            $LayoutObject->Block(
                Name => 'ShowAnswersButton',
                Data => {
                    PublicSurveyKey => $PublicSurveyKey,
                },
            );
        }
    }
    elsif ( $Survey{SurveyID} ) {

        # clean HTML and process introduction text
        $Survey{Introduction} =~ s{\A\$html\/text\$\s(.*)}{$1}xms;
        my $HTMLContent = $1;
        if ( !$HTMLContent ) {
            $Survey{Introduction} = $LayoutObject->Ascii2Html(
                Text           => $Survey{Introduction},
                HTMLResultMode => 1,
            );
        }
        $LayoutObject->Block(
            Name => 'PublicSurvey',
            Data => {
                %Survey,
            },
        );

        # get ticket
        my %RequestData = $SurveyObject->RequestGet(
            PublicSurveyKey => $PublicSurveyKey,
        );
        my %Ticket = $Kernel::OM->Get('Kernel::System::Ticket')->TicketGet(
            TicketID => $RequestData{TicketID},
        );

        $LayoutObject->Block(
            Name => 'PublicTicket',
            Data => {%Ticket},
        );

        # If we had errors, @QuestionList is already filled, so let's save a SQL query
        if ( !@QuestionList ) {
            @QuestionList = $SurveyObject->QuestionList(
                SurveyID => $Survey{SurveyID},
            );
        }

        for my $Question (@QuestionList) {

            $LayoutObject->Block(
                Name => 'PublicQuestions',
                Data => {},
            );

            my $Class        = '';
            my $RequiredText = '';
            my $ErrorText;
            if ( $Question->{AnswerRequired} ) {
                $Class .= 'Mandatory';
                $RequiredText = '* ';

            }
            if (
                $Errors{ $Question->{QuestionID} }
                && ref $Errors{ $Question->{QuestionID} } eq 'HASH'
                )
            {

                # %Errors holds a key for each QuestionID that had errors.
                # The value is a hash reference who's keys are the ErrorType
                # The value is set to 1
                # Reason for this is, that the value may be used to display
                # a more specific Error Message containing text question specific error messages
                # or similar. So a type specific error message treatment would be possible here.

                # At the time of creation the only error type was 'Answer required'.
                # So a data structure looks like this:
                # %Errors = (
                #   1 => {
                #        'Answer required' => 1,
                #   },
                #   2 => {
                #        'Answer required' => 1,
                #    },
                # );

                # Later on a Data structure like the following would be possible:
                # %Errors = (
                #   1 => {
                #        'Invalid text' => 'Your Text did not contain the Order number',
                #   },
                #   2 => {
                #        'Answer required' => 1,
                #    },
                # );
                # As soon as this is needed, the following $ErrorText string building has to be
                # changed.

                # The string building works at the moment this way:
                # 1. Go through all keys of the %{ $Errors{ $Question->{QuestionID} } } hash
                # 2. Do a translation for each key (inside the "map {}"-clause)
                # 3. join the resulting Array by putting "</p>\n</p>" in between the Array keys
                # 4. add '<p>' at the beginning and '</p>' at the end.

                $ErrorText = '<p>'
                    . (
                    join "</p>\n<p>",
                    map { $LayoutObject->{LanguageObject}->Translate($_) }
                        keys %{ $Errors{ $Question->{QuestionID} } }
                    )
                    . '</p>';

                $ErrorText = <<END;
                <div class="TooltipError">
                <div class="Tooltip TongueLeft">
                    <div class="Tongue" ></div>
                    <div class="Content" role="tooltip" style="word-wrap: break-word;">
                            $ErrorText
                    </div>
                </div>
                </div>
END
                $Class .= ' Error';
            }

            if ( $Question->{Type} eq 'YesNo' ) {

                my %Selected = (
                    YesSelected => (
                        defined $Answers{ $Question->{QuestionID} }
                            && $Answers{ $Question->{QuestionID} } eq 'Yes'
                        )
                    ? 'checked="checked"'
                    : '',
                    NoSelected => (
                        defined $Answers{ $Question->{QuestionID} }
                            && $Answers{ $Question->{QuestionID} } eq 'No'
                        )
                    ? 'checked="checked"'
                    : '',
                );

                $LayoutObject->Block(
                    Name => 'PublicAnswerYesNo',
                    Data => {
                        %{$Question},
                        %Selected,
                        ErrorText => $ErrorText || '',
                        Class => $Class,
                        RequiredText => $RequiredText,
                    },
                );
            }
            elsif ( $Question->{Type} eq 'Radio' ) {
                $LayoutObject->Block(
                    Name => 'PublicAnswerRadio',
                    Data => {
                        %{$Question},
                        ErrorText => $ErrorText || '',
                        Class => $Class,
                        RequiredText => $RequiredText,
                    },
                );
                my @AnswerList = $SurveyObject->AnswerList(
                    QuestionID => $Question->{QuestionID},
                );
                for my $Answer (@AnswerList) {

                    my $Selected = '';
                    if (
                        defined $Answers{ $Question->{QuestionID} }
                        && $Answers{ $Question->{QuestionID} } eq $Answer->{AnswerID}
                        )
                    {
                        $Selected = 'checked="checked"';
                    }
                    $LayoutObject->Block(
                        Name => 'PublicAnswerRadiob',
                        Data => {
                            %{$Answer},
                            AnswerSelected => $Selected,
                        },
                    );
                }
            }
            elsif ( $Question->{Type} eq 'Checkbox' ) {
                $LayoutObject->Block(
                    Name => 'PublicAnswerCheckbox',
                    Data => {
                        %{$Question},
                        ErrorText => $ErrorText || '',
                        Class => $Class,
                        RequiredText => $RequiredText,
                    },
                );
                my @AnswerList = $SurveyObject->AnswerList(
                    QuestionID => $Question->{QuestionID},
                );
                for my $Answer (@AnswerList) {
                    my $Selected = '';
                    if (
                        defined $Answers{ $Question->{QuestionID} }
                        && ref $Answers{ $Question->{QuestionID} } eq 'ARRAY'
                        && @{ $Answers{ $Question->{QuestionID} } }
                        && scalar grep { $_ eq $Answer->{AnswerID} }
                        @{ $Answers{ $Question->{QuestionID} } }
                        )
                    {
                        $Selected = 'checked="checked"';
                    }
                    $LayoutObject->Block(
                        Name => 'PublicAnswerCheckboxb',
                        Data => {
                            %{$Answer},
                            AnswerSelected => $Selected,
                        },
                    );
                }
            }
            elsif ( $Question->{Type} eq 'Textarea' ) {
                my $Value = $Answers{ $Question->{QuestionID} } || '';
                $Value =~ s/^\$html\/text\$\s//;
                $LayoutObject->Block(
                    Name => 'PublicAnswerTextarea',
                    Data => {
                        %{$Question},
                        ErrorText => $ErrorText || '',
                        Class => $Class,
                        RequiredText => $RequiredText,
                        Value        => $Value,
                    },
                );

                # check if rich text is enabled
                if ( $LayoutObject->{BrowserRichText} ) {
                    $LayoutObject->Block( Name => 'RichText' );
                }
            }
        }
    }
    else {
        $LayoutObject->Block(
            Name => 'PublicSurveyMessage',
            Data => {
                MessageType   => Translatable('Survey Error!'),
                MessageHeader => Translatable('Invalid survey key.'),
                Message       => Translatable(
                    'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'
                ),
            },
        );
    }
    $Output .= $LayoutObject->Output(
        TemplateFile => 'PublicSurvey',
        Data         => {
            %Param,
        },
    );
    $Output .= $LayoutObject->CustomerFooter();

    return $Output;
}

1;
