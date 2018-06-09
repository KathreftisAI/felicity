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

        # get survey object
        my $SurveyObject = $Kernel::OM->Get('Kernel::System::Survey');

        # create test survey
        my $SurveyTitle = 'Survey ' . $Helper->GetRandomID();
        my $SurveyID    = $SurveyObject->SurveyAdd(
            UserID              => 1,
            Title               => $SurveyTitle,
            Introduction        => 'Survey Introduction',
            Description         => 'Survey Description',
            NotificationSender  => 'quality@unittest.com',
            NotificationSubject => 'Survey Notification Subject',
            NotificationBody    => 'Survey Notification Body',
            Queues              => [2],
        );
        $Self->True(
            $SurveyID,
            "Survey ID $SurveyID is created",
        );

        # add question to test survey
        my $QuestionName = 'Question ' . $Helper->GetRandomID();
        $SurveyObject->QuestionAdd(
            UserID         => 1,
            SurveyID       => $SurveyID,
            Question       => $QuestionName,
            AnswerRequired => 1,
            Type           => 'YesNo',
        );

        # set test survey on master status
        my $StatusSet = $SurveyObject->SurveyStatusSet(
            SurveyID  => $SurveyID,
            NewStatus => 'Master'
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

        # get DB object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

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

        # select yes as answer
        $Selenium->find_element("//input[\@value='Yes'][\@type='radio']")->VerifiedClick();
        $Selenium->find_element("//button[\@value='Finish'][\@type='submit']")->VerifiedClick();

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

        # check screen
        $Selenium->find_element( "table",             'css' );
        $Selenium->find_element( "table thead tr th", 'css' );
        $Selenium->find_element( "table tbody tr td", 'css' );

        # verify stats are for right ticket
        $Self->True(
            index( $Selenium->get_page_source(), $TicketNumber ) > -1,
            "Ticket number $TicketNumber is found",
        );

        # click to see details of stats
        $Selenium->find_element( ".SeeDetails", 'css' )->VerifiedClick();

        # verify question values
        $Self->True(
            index( $Selenium->get_page_source(), $QuestionName ) > -1,
            "$QuestionName is found",
        );
        $Self->True(
            index( $Selenium->get_page_source(), 'Yes' ) > -1,
            "Answer 'Yes' is found",
        );

        # get test question ID
        $DBObject->Prepare(
            SQL  => "SELECT id FROM survey_question WHERE survey_id = ?",
            Bind => [ \$SurveyID ],
        );
        my $QuestionID;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $QuestionID = $Row[0];
        }

        # get clean-up data
        my @CleanData = (
            {
                Name  => 'Queue',
                Table => 'survey_queue',
                SQLID => 'survey_id',
                ID    => $SurveyID,
            },
            {
                Name  => 'Answer',
                Table => 'survey_answer',
                SQLID => 'question_id',
                ID    => $QuestionID,
            },
            {
                Name  => 'Question',
                Table => 'survey_question',
                SQLID => 'survey_id',
                ID    => $SurveyID,
            },
            {
                Name  => 'Request',
                Table => 'survey_request',
                SQLID => 'survey_id',
                ID    => $SurveyID,
            },
            {
                Name  => 'Vote',
                Table => 'survey_vote',
                SQLID => 'question_id',
                ID    => $QuestionID,
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

            $Success = $DBObject->Do(
                SQL  => "DELETE FROM $Delete->{Table} WHERE $Delete->{SQLID} = ?",
                Bind => [ \"$Delete->{ID}" ],
            );
            $Self->True(
                $Success,
                "$Delete->{Name} for $SurveyTitle is deleted",
            );
        }
    }
);

1;
