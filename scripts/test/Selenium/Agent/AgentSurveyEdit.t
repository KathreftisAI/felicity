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

        # click on 'Edit General Info' and switch screen
        $Selenium->find_element( "#Menu010-EditGeneralInfo", 'css' )->VerifiedClick();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#Title").length' );

        # get test params
        my @Test = (
            {
                ID     => 'Title',
                Stored => $SurveyTitle,
                Edited => $SurveyTitle . ' edited',
            },
            {
                ID     => 'Introduction',
                Stored => $Introduction,
                Edited => $Introduction . ' edited',
            },
            {
                ID     => 'Description',
                Stored => $Description,
                Edited => $Description . ' edited',
            },
            {
                ID     => 'NotificationSender',
                Stored => $NotificationSender,
                Edited => $NotificationSender . ' edited',
            },
            {
                ID     => 'NotificationSubject',
                Stored => $NotificationSubject,
                Edited => $NotificationSubject . ' edited',
            },
            {
                ID     => 'NotificationBody',
                Stored => $NotificationBody,
                Edited => $NotificationBody . ' edited',
            },
        );

        # check test survey values and edit them
        for my $SurveyStored (@Test) {

            $Self->Is(
                $Selenium->find_element( "#$SurveyStored->{ID}", 'css' )->get_value(),
                $SurveyStored->{Stored},
                "#$SurveyStored->{ID} stored value",
            );

            # edit value
            $Selenium->find_element( "#$SurveyStored->{ID}", 'css' )->send_keys(' edited');
        }

        # submit updates and switch back window
        $Selenium->find_element("//button[\@value='Update'][\@type='submit']")->click();

        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        # click on 'Edit General Info' again and switch window
        $Selenium->find_element( "#Menu010-EditGeneralInfo", 'css' )->VerifiedClick();

        $Selenium->WaitFor( WindowCount => 2 );
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#Title").length' );

        # check edited values
        for my $SurveryEdited (@Test) {

            $Self->Is(
                $Selenium->find_element( "#$SurveryEdited->{ID}", 'css' )->get_value(),
                $SurveryEdited->{Edited},
                "#$SurveryEdited->{ID} stored value",
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
