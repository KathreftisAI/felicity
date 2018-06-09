# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentSurveyZoom;

use strict;
use warnings;

use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(:all);

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

    # get needed objects
    my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $SurveyID = $ParamObject->GetParam( Param => "SurveyID" ) || '';

    my $SurveyExists = 'no';
    if ($SurveyID) {
        $SurveyExists = $SurveyObject->ElementExists(
            ElementID => $SurveyID,
            Element   => 'Survey'
        );
    }

    # view attachment for HTML email
    if ( $Self->{Subaction} eq 'HTMLView' ) {

        # get params
        my $SurveyField = $ParamObject->GetParam( Param => "SurveyField" );

        # needed params
        for my $Needed (qw( SurveyID SurveyField )) {
            if ( !$Needed ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Message  => "Needed Param: $Needed!",
                    Priority => 'error',
                );

                return;
            }
        }

        if ( $SurveyField ne 'Introduction' && $SurveyField ne 'Description' ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Message  => "Invalid SurveyField Param: $SurveyField!",
                Priority => 'error',
            );

            return;
        }

        # check if survey exists
        if ( $SurveyExists ne 'Yes' ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Message  => "Invalid SurveyID: $SurveyID!",
                Priority => 'error',
            );

            return;
        }

        # get all attributes of the survey
        my %Survey = $SurveyObject->SurveyGet(
            SurveyID => $SurveyID,
        );

        if ( $Survey{$SurveyField} ) {

            # clean HTML and convert the Field in HTML (\n --><br>)
            $Survey{$SurveyField} =~ s{\A\$html\/text\$\s(.*)}{$1}xms;
            $Survey{$SurveyField} = $LayoutObject->Ascii2Html(
                Text           => $Survey{$SurveyField},
                HTMLResultMode => 1,
            );
        }
        else {

            return;
        }

        # get HTML utils object
        my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

        # convert text area fields to ASCII
        $Survey{$SurveyField} = $HTMLUtilsObject->ToAscii(
            String => $Survey{$SurveyField},
        );

        $Survey{$SurveyField} = $HTMLUtilsObject->DocumentComplete(
            String  => $Survey{$SurveyField},
            Charset => 'utf-8',
        );

        return $LayoutObject->Attachment(
            Type        => 'inline',
            ContentType => 'text/html',
            Content     => $Survey{$SurveyField},
        );
    }

    # ------------------------------------------------------------ #
    # survey status
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'SurveyStatus' ) {

        # Challenge token check for write action.
        $LayoutObject->ChallengeTokenCheck();

        my $NewStatus = $ParamObject->GetParam( Param => "NewStatus" );

        my $Access = 0;
        my $GroupsForChangeStatus
            = $Kernel::OM->Get('Kernel::Config')->Get('Survey::Frontend::ChangeSurveyStatusGroups');
        my %UserGroups = $Kernel::OM->Get('Kernel::System::Group')->PermissionUserGet(
            UserID => $Self->{UserID},
            Type   => 'rw',
        );
        %UserGroups = reverse %UserGroups;

        # If config array is empty, group can change survey status. Otherwise, checking permissions.
        if ( !IsArrayRefWithData($GroupsForChangeStatus) ) {
            $Access = 1;
        }
        else {

            GROUPS:
            for my $SurveyGroup ( @{$GroupsForChangeStatus} ) {
                if ( $UserGroups{$SurveyGroup} ) {
                    $Access = 1;
                    last GROUPS;
                }
            }
        }

        # check if survey exists
        if ( $SurveyExists ne 'Yes' || $Access == 0 ) {

            return $LayoutObject->NoPermission(
                Message    => Translatable('You have no permission for this survey!'),
                WithHeader => 'yes',
            );
        }

        # set a new status
        my $StatusSet = $SurveyObject->SurveyStatusSet(
            SurveyID  => $SurveyID,
            NewStatus => $NewStatus,
        );
        my $Message = '';
        if ( defined($StatusSet) && $StatusSet eq 'NoQuestion' ) {
            $Message = ';Message=NoQuestion';
        }
        elsif ( defined($StatusSet) && $StatusSet eq 'IncompleteQuestion' ) {
            $Message = ';Message=IncompleteQuestion';
        }
        elsif ( defined($StatusSet) && $StatusSet eq 'StatusSet' ) {
            $Message = ';Message=StatusSet';
        }

        return $LayoutObject->Redirect(
            OP => "Action=AgentSurveyZoom;SurveyID=$SurveyID$Message",
        );
    }

    # ------------------------------------------------------------ #
    # survey zoom
    # ------------------------------------------------------------ #

    # get params
    my $Message = $ParamObject->GetParam( Param => "Message" );

    # check if survey exists
    if ( !$SurveyID || $SurveyExists ne 'Yes' ) {
        $Message = ';Message=NoSurveyID';

        return $LayoutObject->Redirect(
            OP => "Action=AgentSurveyOverview$Message",
        );
    }

    # output header
    $Output = $LayoutObject->Header(
        Title => 'Survey',
    );
    $Output .= $LayoutObject->NavigationBar();

    # output messages if status was changed
    if ( defined($Message) && $Message eq 'NoQuestion' ) {
        $Output .= $LayoutObject->Notify(
            Priority => 'Error',
            Info     => Translatable('Can\'t set new status! No questions defined.'),
        );
    }
    elsif ( defined($Message) && $Message eq 'IncompleteQuestion' ) {
        $Output .= $LayoutObject->Notify(
            Priority => 'Error',
            Info     => Translatable('Can\'t set new status! Questions incomplete.'),
        );
    }
    elsif ( defined($Message) && $Message eq 'StatusSet' ) {
        $Output .= $LayoutObject->Notify(
            Priority => 'Notice',
            Info     => Translatable('Status changed.'),
        );
    }

    # get all attributes of the survey
    my %Survey = $SurveyObject->SurveyGet( SurveyID => $SurveyID );
    my %HTML;

    # clean HTML and convert the text-areas in HTML (\n --><br>)
    FIELD:
    for my $SurveyField (qw( Introduction Description )) {
        next FIELD if !$Survey{$SurveyField};

        $Survey{$SurveyField} =~ s{\A\$html\/text\$\s(.*)}{$1}xms;

        if ($1) {
            $HTML{$SurveyField} = 1;
        }

        $Survey{$SurveyField} = $LayoutObject->Ascii2Html(
            Text           => $Survey{$SurveyField},
            HTMLResultMode => 1,
        );
    }

    # get numbers of requests and votes
    my $SendRequest = $SurveyObject->RequestCount(
        SurveyID => $SurveyID,
        ValidID  => 'all',
    );
    my $RequestComplete = $SurveyObject->RequestCount(
        SurveyID => $SurveyID,
        ValidID  => 0,
    );
    $Survey{SendRequest}     = $SendRequest;
    $Survey{RequestComplete} = $RequestComplete;

    # get selected queues
    my %Queues = $Kernel::OM->Get('Kernel::System::Queue')->GetAllQueues();
    my @QueueList = map { $Queues{$_} } @{ $Survey{Queues} };
    @QueueList = sort { lc $a cmp lc $b } @QueueList;
    my $QueueListString = join q{, }, @QueueList;

    my $NoQueueMessage = '';
    if ( !$QueueListString ) {
        $QueueListString = $LayoutObject->{LanguageObject}->Translate('- No queue selected -');
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # print the main table.
    $LayoutObject->Block(
        Name => 'SurveyZoom',
        Data => {
            %Survey,
            NoQueueMessage  => $NoQueueMessage,
            QueueListString => $QueueListString,
            HTMLRichTextHeightDefault =>
                $ConfigObject->Get('Survey::Frontend::HTMLRichTextHeightDefault') || 80,
            HTMLRichTextHeightMax =>
                $ConfigObject->Get('Survey::Frontend::HTMLRichTextHeightMax') || 2500,
        },
    );

    # check if the send condition ticket type check is enabled
    if ( $ConfigObject->Get('Survey::CheckSendConditionTicketType') ) {

        # get selected ticket types
        my %TicketTypes = $Kernel::OM->Get('Kernel::System::Type')->TypeList();
        my @TicketTypeList = map { $TicketTypes{$_} ? $TicketTypes{$_} : () } @{ $Survey{TicketTypeIDs} };
        @TicketTypeList = sort { lc $a cmp lc $b } @TicketTypeList;
        my $TicketTypeListString = join q{, }, @TicketTypeList;

        if ( !$TicketTypeListString ) {
            $TicketTypeListString = $LayoutObject->{LanguageObject}->Translate('- No ticket type selected -');
        }

        $LayoutObject->Block(
            Name => 'TicketTypes',
            Data => {
                TicketTypeListString => $TicketTypeListString,
            },
        );
    }

    # check if the send condition service check is enabled
    if ( $ConfigObject->Get('Survey::CheckSendConditionService') ) {

        # get selected ticket types
        my %Services = $Kernel::OM->Get('Kernel::System::Service')->ServiceList(
            UserID => $Self->{UserID},
        );
        my @ServiceList = map { $Services{$_} ? $Services{$_} : () } @{ $Survey{ServiceIDs} };
        @ServiceList = sort { lc $a cmp lc $b } @ServiceList;
        my $ServiceListString = join q{, }, @ServiceList;

        if ( !$ServiceListString ) {
            $ServiceListString = $LayoutObject->{LanguageObject}->Translate('- No ticket service selected -');
        }

        $LayoutObject->Block(
            Name => 'TicketServices',
            Data => {
                ServiceListString => $ServiceListString,
            },
        );
    }

    # run survey menu modules
    my $MenuModuleConfig = $ConfigObject->Get('Survey::Frontend::MenuModule');
    if ( IsHashRefWithData($MenuModuleConfig) ) {
        my %Menus   = %{$MenuModuleConfig};
        my $Counter = 0;
        MENU:
        for my $Menu ( sort keys %Menus ) {

            # menu SatsDetails needs to have a complete request
            if (
                defined $Menus{$Menu}->{Action}
                && $Menus{$Menu}->{Action} eq 'AgentSurveyStats'
                && !$RequestComplete
                )
            {
                next MENU;
            }

            # load module
            if ( $Kernel::OM->Get('Kernel::System::Main')->Require( $Menus{$Menu}->{Module} ) ) {
                my $Object = $Menus{$Menu}->{Module}->new(
                    UserID => $Self->{UserID},
                );

                # set classes
                if ( $Menus{$Menu}->{Target} ) {

                    if ( $Menus{$Menu}->{Target} eq 'PopUp' ) {
                        $Menus{$Menu}->{Class} = 'AsPopup';
                    }
                    elsif ( $Menus{$Menu}->{Target} eq 'Back' ) {
                        $Menus{$Menu}->{Class} = 'HistoryBack';
                    }
                }

                # run module
                $Counter = $Object->Run(
                    %Param,
                    Survey  => {%Survey},
                    Counter => $Counter,
                    Config  => $Menus{$Menu},
                    MenuID  => 'Menu' . $Menu,
                );
            }
            else {

                return $LayoutObject->FatalError();
            }
        }
    }

    # output the possible status menu
    my %NewStatus = (
        ChangeStatus => Translatable('- Change Status -'),
        Master       => Translatable('master'),
        Valid        => Translatable('valid'),
        Invalid      => Translatable('invalid'),

    );

    if ( $Survey{Status} eq 'New' ) {
        delete $NewStatus{Invalid};
    }
    else {
        delete $NewStatus{ $Survey{Status} };
    }

    my $NewStatusStr = $LayoutObject->BuildSelection(
        Name       => 'NewStatus',
        ID         => 'NewStatus',
        Data       => \%NewStatus,
        SelectedID => 'ChangeStatus',
        Title      => $LayoutObject->{LanguageObject}->Translate('New Status'),
        Class      => 'Modernize',
    );

    $LayoutObject->Block(
        Name => 'SurveyStatus',
        Data => {
            NewStatusStr => $NewStatusStr,
            SurveyID     => $SurveyID,
        },
    );

    # output the survey common blocks
    my %TranslatedTitles = (
        Introduction => $LayoutObject->{LanguageObject}->Translate('Survey Introduction'),
        Description  => $LayoutObject->{LanguageObject}->Translate('Survey Description'),
    );
    for my $Field (qw( Introduction Description)) {
        $LayoutObject->Block(
            Name => 'SurveyBlock',
            Data => {
                Title       => $TranslatedTitles{$Field},
                SurveyField => $Field,
            },
        );
        if ( $HTML{$Field} ) {
            $LayoutObject->Block(
                Name => 'BodyHTML',
                Data => {
                    SurveyField => $Field,
                    SurveyID    => $SurveyID,
                },
            );
        }
        else {
            $LayoutObject->Block(
                Name => 'BodyPlain',
                Data => {
                    Label   => $Field,
                    Content => $Survey{$Field},
                },
            );
        }
    }

    # display stats if status Master, Valid or Invalid
    if ( $Survey{Status} eq 'New' ) {
        $LayoutObject->Block(
            Name => 'NoStatResults',
            Data => {},
        );
    }
    elsif (
        $Survey{Status} eq 'Master'
        || $Survey{Status} eq 'Valid'
        || $Survey{Status} eq 'Invalid'
        )
    {
        $LayoutObject->Block(
            Name => 'SurveyEditStats',
            Data => {
                SurveyID => $SurveyID,
            },
        );

        # get all questions of the survey
        my @QuestionList = $SurveyObject->QuestionList(
            SurveyID => $SurveyID,
        );
        for my $Question (@QuestionList) {
            $LayoutObject->Block(
                Name => 'SurveyEditStatsQuestion',
                Data => $Question,
            );
            my @Answers;

            # generate the answers of the question
            if (
                $Question->{Type} eq 'YesNo'
                || $Question->{Type} eq 'Radio'
                || $Question->{Type} eq 'Checkbox'
                )
            {
                my @AnswerList;

                # set answers to Yes and No if type was YesNo
                if ( $Question->{Type} eq 'YesNo' ) {
                    my %Data;
                    $Data{Answer}   = "Yes";
                    $Data{AnswerID} = "Yes";
                    push( @AnswerList, \%Data );
                    my %Data2;
                    $Data2{Answer}   = "No";
                    $Data2{AnswerID} = "No";
                    push( @AnswerList, \%Data2 );
                }
                else {

                    # get all answers of a question
                    @AnswerList = $SurveyObject->AnswerList(
                        QuestionID => $Question->{QuestionID},
                    );
                }
                for my $Row (@AnswerList) {
                    my $VoteCount = $SurveyObject->VoteCount(
                        QuestionID => $Question->{QuestionID},
                        VoteValue  => $Row->{AnswerID},
                    );
                    my $Percent = 0;

                    # calculate the percents
                    if ($RequestComplete) {
                        $Percent = 100 / $RequestComplete * $VoteCount;
                        $Percent = sprintf( "%.2f", $Percent );
                    }
                    my %Data;
                    $Data{Answer}        = $Row->{Answer};
                    $Data{AnswerPercent} = $Percent;
                    push( @Answers, \%Data );
                }
            }
            elsif ( $Question->{Type} eq 'Textarea' ) {

                my $VoteValue = '';
                if ( $Kernel::OM->Get('Kernel::System::DB')->{'DB::Type'} eq 'oracle' ) {
                    $VoteValue = 0;
                }
                my $AnswerNo = $SurveyObject->VoteCount(
                    QuestionID => $Question->{QuestionID},
                    VoteValue  => $VoteValue,
                );
                my $Percent = 0;

                # calculate the percents
                if ($RequestComplete) {
                    $Percent = 100 / $RequestComplete * $AnswerNo;
                    $Percent = sprintf( "%.2f", $Percent );
                }
                my %Data;
                $Data{Answer} = $LayoutObject->{LanguageObject}->Translate('answered');
                if ( !$RequestComplete ) {
                    $Data{AnswerPercent} = 0;
                }
                else {
                    $Data{AnswerPercent} = sprintf( "%.2f", 100 - $Percent );
                }
                push( @Answers, \%Data );
                my %Data2;
                $Data2{Answer}        = $LayoutObject->{LanguageObject}->Translate('not answered');
                $Data2{AnswerPercent} = $Percent;
                push( @Answers, \%Data2 );
            }

            # output all answers of the survey
            for my $Row (@Answers) {
                $Row->{AnswerPercentTable} = $Row->{AnswerPercent};
                if ( !$Row->{AnswerPercent} ) {
                    $Row->{AnswerPercentTable} = 1;
                }
                $LayoutObject->Block(
                    Name => 'SurveyEditStatsAnswer',
                    Data => $Row,
                );
            }
        }
    }

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentSurveyZoom',
        Data         => {%Param},
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

1;
