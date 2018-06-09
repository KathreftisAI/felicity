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

        # create test survey
        my $SurveyTitle = 'Survey ' . $Helper->GetRandomID();
        my $SurveyID    = $Kernel::OM->Get('Kernel::System::Survey')->SurveyAdd(
            UserID              => 1,
            Title               => $SurveyTitle,
            Introduction        => 'Survey Introduction',
            Description         => 'Survey Description',
            NotificationSender  => 'quality@example.com',
            NotificationSubject => 'Survey Notification Subject',
            NotificationBody    => 'Survey Notification Body',
            Queues              => [2],
        );
        $Self->True(
            $SurveyID,
            "Survey ID $SurveyID is created",
        );

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentSurveyOverview of created test survey
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentSurveyOverview");

        # check screen
        $Selenium->find_element( "table",             'css' );
        $Selenium->find_element( "table thead tr th", 'css' );
        $Selenium->find_element( "table tbody tr td", 'css' );

        # check for test created survey
        $Self->True(
            index( $Selenium->get_page_source(), "$SurveyTitle" ) > -1,
            "$SurveyTitle is found",
        );

        # click on test created survey
        $Selenium->find_element("//div[\@title='$SurveyTitle']")->VerifiedClick();

        # verify we are in AgentSurveyZoom screen
        my $URLAction = $Selenium->get_current_url();
        $Self->Is(
            index( $URLAction, "Action=AgentSurveyZoom;SurveyID=$SurveyID" ) > -1,
            1,
            "Link from Overview to Zoom view - success",
        );

        # get DB object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # clean-up test created survey data
        my $Success = $DBObject->Do(
            SQL  => "DELETE FROM survey_queue WHERE survey_id = ?",
            Bind => [ \$SurveyID ],
        );
        $Self->True(
            $Success,
            "Survey-Queue for $SurveyTitle is deleted",
        );

        # delete test created survey
        $Success = $DBObject->Do(
            SQL  => "DELETE FROM survey WHERE id = ?",
            Bind => [ \$SurveyID ],
        );
        $Self->True(
            $Success,
            "$SurveyTitle is deleted",
        );
    }
);

1;
