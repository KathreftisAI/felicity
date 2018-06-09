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

        # do not check RichText
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Frontend::RichText',
            Value => 0,
        );

        # create test survey
        my $SurveyTitle         = 'Survey ' . $Helper->GetRandomID();
        my $Introduction        = 'Survey Introduction';
        my $Description         = 'Survey Description';
        my $NotificationSender  = 'quality@example.com';
        my $NotificationSubject = 'Survey Notification Subject';
        my $NotificationBody    = 'Survey Notification Body';

        my $SurveyID = $Kernel::OM->Get('Kernel::System::Survey')->SurveyAdd(
            UserID              => 1,
            Title               => $SurveyTitle,
            Introduction        => $Introduction,
            Description         => $Description,
            NotificationSender  => $NotificationSender,
            NotificationSubject => $NotificationSubject,
            NotificationBody    => $NotificationBody,
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

        # navigate to AgentSurveyZoom of created test survey
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentSurveyZoom;SurveyID=$SurveyID");

        # check page
        for my $ID (
            qw(Menu000-Back Menu010-EditGeneralInfo Menu020-EditQuestions NewStatus)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # check test created survey values
        my @Values = ( $SurveyTitle, $Introduction, $Description );
        for my $SurveyCheck (@Values) {
            $Self->True(
                index( $Selenium->get_page_source(), "$SurveyCheck" ) > -1,
                "$SurveyCheck is found",
            );
        }

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
