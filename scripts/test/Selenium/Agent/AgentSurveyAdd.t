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

        # navigate to AgentSurveyAdd
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentSurveyAdd");

        # check page
        for my $ID (
            qw(Title Introduction NotificationSender NotificationSubject NotificationBody Queues Description)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # create test survey
        my $SurveyTitle = 'Survey ' . $Helper->GetRandomID();
        $Selenium->find_element( "#Title",        'css' )->send_keys($SurveyTitle);
        $Selenium->find_element( "#Introduction", 'css' )->send_keys('Selenium Introduction');
        $Selenium->execute_script("\$('#CustomerUserConditions').val('UserLogin').change();");
        $Selenium->find_element( "#Description", 'css' )->send_keys('Selenium Description');
        $Selenium->find_element("//button[\@value='Create'][\@type='submit']")->VerifiedClick();

        # check for test created survey values
        $Self->True(
            index( $Selenium->get_page_source(), $SurveyTitle ) > -1,
            "$SurveyTitle title is found"
        );

        # delete test created survey
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        my $SurveyTitleQuoted = $DBObject->Quote($SurveyTitle);
        $DBObject->Prepare(
            SQL  => "SELECT id FROM survey WHERE title = ?",
            Bind => [ \$SurveyTitleQuoted ]
        );
        my $SurveyID;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $SurveyID = $Row[0];
        }

        # clean-up test created survey data
        my $Success = $DBObject->Do(
            SQL  => "DELETE FROM survey_queue WHERE survey_id = ?",
            Bind => [ \$SurveyID ],
        );
        $Self->True(
            $Success,
            "Survey-Queue for $SurveyTitle is deleted",
        );

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
