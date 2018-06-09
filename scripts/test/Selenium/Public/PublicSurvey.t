# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

## no critic (Modules::RequireExplicitPackage)
use strict;
use warnings;
use utf8;

use vars (qw($Self));
use Kernel::System::VariableCheck qw(IsArrayRefWithData);

# get selenium object
my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

$Selenium->RunTest(
    sub {

        # get helper object
        my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

        # set send period to always send survey
        $Helper->ConfigSettingChange(
            Key   => 'Survey::SendPeriod',
            Value => 0,
        );

        # set no send condition check in normal tests
        $Helper->ConfigSettingChange(
            Key   => 'Survey::CheckSendConditionTicketType',
            Value => 0,
        );

        # do not check RichText
        $Helper->ConfigSettingChange(
            Key   => 'Frontend::RichText',
            Value => 0,
        );

        # get survey object
        my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');

        # create test survey
        my $SurveryIntroduction    = 'Survey Introduction',
            my $SurveryDescription = 'Survey Description',
            my $SurveyTitle        = 'Survey ' . $Helper->GetRandomID();
        my $SurveyID = $SurveyObject->SurveyAdd(
            UserID              => 1,
            Title               => $SurveyTitle,
            Introduction        => $SurveryIntroduction,
            Description         => $SurveryDescription,
            NotificationSender  => 'quality@unittest.com',
            NotificationSubject => 'Survey Notification Subject',
            NotificationBody    => 'Survey Notification Body',
            Queues              => [2],
        );
        $Self->True(
            $SurveyID,
            "Survey ID $SurveyID is created",
        );

        # get question data
        my @QuestionData = (
            {
                Type => 'YesNo',
            },
            {
                Type   => 'Radio',
                Answer => [ "RadioOne", "RadioTwo" ],
            },
            {
                Type   => 'Checkbox',
                Answer => [ "CheckBoxOne", "CheckBoxTwo" ],
            },
            {
                Type => 'Textarea',
            },
        );

        # get DB object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # add question and answers to test survey
        my @QuestionNames;
        my @QuestionIDs;
        my @AnswerNames;
        my @AnswerIDs;
        for my $Questions (@QuestionData) {
            my $QuestionName = $Questions->{Type} . $Helper->GetRandomID();
            $SurveyObject->QuestionAdd(
                UserID         => 1,
                SurveyID       => $SurveyID,
                Question       => $QuestionName,
                AnswerRequired => 1,
                Type           => $Questions->{Type},
            );

            # get test question ID
            my $QuestionQuoted = $DBObject->Quote($QuestionName);
            $DBObject->Prepare(
                SQL  => "SELECT id FROM survey_question WHERE question = ?",
                Bind => [ \$QuestionQuoted ]
            );
            my $QuestionID;
            while ( my @Row = $DBObject->FetchrowArray() ) {
                $QuestionID = $Row[0];
            }
            push @QuestionIDs, $QuestionID;

            # add answer for radio and check-box questions
            if (
                $Questions->{Type} eq 'Radio'
                || $Questions->{Type} eq 'Checkbox'
                )
            {

                for my $Answers ( @{ $Questions->{Answer} } ) {
                    $SurveyObject->AnswerAdd(
                        SurveyID       => $SurveyID,
                        UserID         => 1,
                        QuestionID     => $QuestionID,
                        Answer         => $Answers,
                        AnswerRequired => 1,
                    );

                    # get test answer ID
                    my $AnswerQuoted = $DBObject->Quote($Answers);
                    $DBObject->Prepare(
                        SQL  => "SELECT id FROM survey_answer WHERE answer = ? AND question_id = ?",
                        Bind => [ \$AnswerQuoted, \$QuestionID ]
                    );
                    my $AnswerID;
                    while ( my @Row = $DBObject->FetchrowArray() ) {
                        $AnswerID = $Row[0];
                    }
                    push @AnswerIDs,   $AnswerID;
                    push @AnswerNames, $Answers;
                }
            }
            push @QuestionNames, $QuestionName;
        }

        # set test survey on master status
        my $StatusSet = $SurveyObject->SurveyStatusSet(
            SurveyID  => $SurveyID,
            NewStatus => 'Master'
        );
        $Self->True(
            $StatusSet,
            "Survey master status is set",
        );

        # get ticket object
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

        # create test ticket
        my $TicketNumber = $TicketObject->TicketCreateNumber();
        my $TicketID     = $TicketObject->TicketCreate(
            TN           => $TicketNumber,
            Title        => "Selenium Test Ticket",
            Queue        => 'Raw',
            Lock         => 'unlock',
            Priority     => '3 normal',
            State        => 'new',
            CustomerID   => 'SeleniumCustomer',
            CustomerUser => 'test@localhost.com',
            OwnerID      => 1,
            UserID       => 1,
        );
        $Self->True(
            $TicketID,
            "Ticket ID $TicketID is created",
        );

        # add article to test created ticket
        my $ArticleID = $TicketObject->ArticleCreate(
            TicketID       => $TicketID,
            ArticleType    => 'note-internal',
            SenderType     => 'agent',
            From           => 'Some Agent <email@example.com>',
            To             => 'Customer A <customer-a@example.com>',
            Cc             => 'Customer B <customer-b@example.com>',
            ReplyTo        => 'Customer B <customer-b@example.com>',
            Subject        => 'some short description',
            Body           => 'the message text Perl modules provide a range of',
            ContentType    => 'text/plain; charset=ISO-8859-15',
            HistoryType    => 'OwnerUpdate',
            HistoryComment => 'Some free text!',
            UserID         => 1,
            NoAgentNotify  => 1,
        );
        $Self->True(
            $TicketID,
            "Article ID $ArticleID is created",
        );

        # send survey request
        my $Request = $SurveyObject->RequestSend(
            TicketID => $TicketID,
        );
        $Self->True(
            $Request,
            "Survey request is sent",
        );

        # get public survey key from test survey request
        $DBObject->Prepare(
            SQL  => "SELECT public_survey_key FROM survey_request WHERE survey_id = ?",
            Bind => [ \$SurveyID ],
        );
        my $PublicSurveyKey;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $PublicSurveyKey = $Row[0];
        }

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to PublicSurvey of created test survey
        $Selenium->VerifiedGet("${ScriptAlias}public.pl?Action=PublicSurvey;PublicSurveyKey=$PublicSurveyKey");

        # get test data
        my @Test = (
            {
                Name  => 'Title',
                Value => $SurveyTitle,
            },
            {
                Name  => 'Ticket Number',
                Value => $TicketNumber,
            },
            {
                Name  => '',
                Value => $SurveryIntroduction,
            },
            {
                Name  => 'Question',
                Value => [@QuestionNames],
            },
            {
                Name  => 'Answer',
                Value => [@AnswerNames],
            },

        );

        # check test survey values
        for my $CheckValue (@Test) {
            if ( IsArrayRefWithData( $CheckValue->{Value} ) ) {
                for ( @{ $CheckValue->{Value} } ) {
                    $Self->True(
                        index( $Selenium->get_page_source(), $_ ) > -1,
                        "$CheckValue->{Name} $_ is found",
                    );
                }
            }
            else {
                $Self->True(
                    index( $Selenium->get_page_source(), $CheckValue->{Value} ) > -1,
                    "$CheckValue->{Name} $CheckValue->{Value} is found",
                );
            }
        }

        # get vote data
        my @VoteData = (
            {
                ID    => "1$QuestionIDs[0]Yes",
                Check => 'Yes'
            },
            {
                ID    => "2$QuestionIDs[1]$AnswerIDs[0]",
                Check => 'RadioOne'
            },
            {
                ID    => "3$AnswerIDs[2]",
                Check => "CheckBoxOne"
            },
            {
                ID     => "$QuestionIDs[3]",
                Answer => 'Selenium Survey Answer',
                Check  => 'Selenium Survey Answer',
            },
        );

        # fill in survey questions
        for my $SurveyVote (@VoteData) {
            if ( $SurveyVote->{Answer} ) {
                $Selenium->find_element( "#RichText$SurveyVote->{ID}", 'css' )->send_keys( $SurveyVote->{Answer} );
            }
            else {
                $Selenium->find_element("//input[\@id='PublicSurveyVote$SurveyVote->{ID}']")->VerifiedClick();
            }
        }

        # submit vote
        $Selenium->find_element("//button[\@value='Finish'][\@type='submit']")->VerifiedClick();

        # verify post vote messages
        my $PostVote = [ "Survey Information", "Thank you for your feedback.", "The survey is finished." ];
        for my $PostVoteMessage ( @{$PostVote} ) {
            $Self->True(
                index( $Selenium->get_page_source(), $PostVoteMessage ) > -1,
                "'$PostVoteMessage' message is found",
            );
        }

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # navigate to AgentSurveyZoom of created test survey
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentSurveyZoom;SurveyID=$SurveyID");

        # click on 'Stats Details' and switch window
        $Selenium->find_element( "#Menu030-StatsDetails", 'css' )->VerifiedClick();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $(".SeeDetails").length' );

        # click to see details of stats
        $Selenium->find_element( ".SeeDetails", 'css' )->VerifiedClick();

        # verify vote details
        for my $VoteDetails (@VoteData) {
            $Self->True(
                index( $Selenium->get_page_source(), $VoteDetails->{Check} ) > -1,
                "Vote $VoteDetails->{Check} is found",
            );
        }

        # get clean-up data
        my @CleanData = (
            {
                Name  => 'Queues',
                Table => 'survey_queue',
                SQLID => 'survey_id',
                ID    => $SurveyID,
            },
            {
                Name  => 'Answers',
                Table => 'survey_answer',
                SQLID => 'id',
                ID    => [@AnswerIDs],
            },
            {
                Name  => 'Questions',
                Table => 'survey_question',
                SQLID => 'survey_id',
                ID    => $SurveyID,
            },
            {
                Name  => 'Requests',
                Table => 'survey_request',
                SQLID => 'survey_id',
                ID    => $SurveyID,
            },
            {
                Name  => 'Votes',
                Table => 'survey_vote',
                SQLID => 'id',
                ID    => [@QuestionIDs],
            },
            {
                Name  => 'Survey',
                Table => 'survey',
                SQLID => 'id',
                ID    => $SurveyID,
            },
        );

        my $Success;

        # delete test data from DB
        for my $Delete (@CleanData) {
            if ( IsArrayRefWithData( $Delete->{ID} ) ) {

                my $IDs = join ', ', @{ $Delete->{ID} };
                my $SQLWhere = "WHERE $Delete->{SQLID} IN ( $IDs )";

                $Success = $DBObject->Do(
                    SQL => "DELETE FROM $Delete->{Table} $SQLWhere",
                );
                $Self->True(
                    $Success,
                    "$Delete->{Name} for $SurveyTitle is deleted",
                );

            }
            else {
                $Success = $DBObject->Do(
                    SQL  => "DELETE FROM $Delete->{Table} WHERE $Delete->{SQLID} = ?",
                    Bind => [ \$Delete->{ID} ],
                );
                $Self->True(
                    $Success,
                    "$Delete->{Name} for $SurveyTitle is deleted",
                );
            }
        }

        # delete test ticket
        $Success = $TicketObject->TicketDelete(
            TicketID => $TicketID,
            UserID   => 1,
        );
        $Self->True(
            $Success,
            "Ticket ID $TicketID is deleted",
        );
    }
);

1;
