# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

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

        # get change state data
        my $ChangeStateDataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
            Class => 'ITSM::ChangeManagement::Change::State',
            Name  => 'requested',
        );

        # get change object
        my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

        # create test change
        my $ChangeTitleRandom = 'ITSMChange Requested ' . $Helper->GetRandomID();
        my $ChangeID          = $ChangeObject->ChangeAdd(
            ChangeTitle   => $ChangeTitleRandom,
            Description   => "Test Description",
            Justification => "Test Justification",
            ChangeStateID => $ChangeStateDataRef->{ItemID},
            UserID        => 1,
        );
        $Self->True(
            $ChangeID,
            "$ChangeTitleRandom is created",
        );

        # get template object
        my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');

        # create simple change template
        my $TemplateNameRandom = 'CAB Template ' . $Helper->GetRandomID();
        my $ChangeContent      = $TemplateObject->TemplateSerialize(
            Name         => $TemplateNameRandom,
            TemplateType => 'CAB',
            ChangeID     => $ChangeID,
            Comment      => 'Selenium Test Comment',
            ValidID      => 1,
            UserID       => 1,
        );

        # create test template from test change
        my $TemplateID = $TemplateObject->TemplateAdd(
            Name         => $TemplateNameRandom,
            TemplateType => 'CAB',
            ChangeID     => $ChangeID,
            Content      => $ChangeContent,
            Comment      => 'Selenium Test Comment',
            ValidID      => 1,
            UserID       => 1,
        );
        $Self->True(
            $TemplateID,
            "Change Template ID $TemplateID is created",
        );

        # create test CAB user
        my $TestUserCAB = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-manager' ],
        );

        # get user object
        my $UserObject = $Kernel::OM->Get('Kernel::System::User');

        # get test CAB user ID
        my $TestUserCABID = $UserObject->UserLookup(
            UserLogin => $TestUserCAB,
        );

        # create test CAB customer user
        my $TestCustomerCAB = $Helper->TestCustomerUserCreate();

        # create and log in test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-manager' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get test user ID
        my $TestUserID = $UserObject->UserLookup(
            UserLogin => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentITSMTemplateOverview screen
        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AgentITSMTemplateOverview;SortBy=TemplateID;OrderBy=Down;Filter=CAB"
        );

        # click on 'Edit Content' for test created CAB template and switch window
        $Selenium->find_element("//a[contains(\@href, \'AgentITSMTemplateEditCAB;TemplateID=$TemplateID' )]")->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#NewCABMember").length' );

        # add test created CAB user to test CAB template
        my $AutoCompleteStringCABUser
            = "\"$TestUserCAB $TestUserCAB\" <$TestUserCAB\@localunittest.com> ($TestUserCABID)";
        $Selenium->execute_script("\$('#NewCABMember').autocomplete('search', '$TestUserCAB') ");
        $Selenium->WaitFor( JavaScript => 'return $("li.ui-menu-item:visible").length' );
        $Selenium->find_element("//*[text()='$AutoCompleteStringCABUser']")->click();
        $Selenium->find_element("//button[\@type='submit'][\@name='AddCABMember']")->click();

        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#CABAgents$TestUserCABID').length" );

        # add test created CAB customer to test CAB template
        my $AutoCompleteStringCABCustomer
            = "\"$TestCustomerCAB $TestCustomerCAB\" <$TestCustomerCAB\@localunittest.com> ($TestCustomerCAB)";
        $Selenium->execute_script("\$('#NewCABMember').autocomplete('search', '$TestCustomerCAB') ");
        $Selenium->WaitFor( JavaScript => 'return $("li.ui-menu-item:visible").length' );
        $Selenium->find_element("//*[text()='$AutoCompleteStringCABCustomer']")->click();
        $Selenium->find_element("//button[\@type='submit'][\@name='AddCABMember']")->click();

        $Selenium->WaitFor(
            JavaScript => "return typeof(\$) === 'function' && \$('#CABCustomers$TestCustomerCAB').length"
        );

        # save edited CAB template and switch window
        $Selenium->find_element("//button[\@type='submit'][\@name='Submit']")->click();

        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        sleep(1);

        # navigate to created test change
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMChangeZoom;ChangeID=$ChangeID");

        # click on 'Involed Persons' and switch window
        $Selenium->find_element("//a[contains(\@href, \'AgentITSMChangeInvolvedPersons;ChangeID=$ChangeID' )]")
            ->click();

        $Selenium->WaitFor( WindowCount => 2 );
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#ChangeManager").length' );

        # input change manager
        my $AutoCompleteStringManager
            = "\"$TestUserLogin $TestUserLogin\" <$TestUserLogin\@localunittest.com> ($TestUserID)";
        $Selenium->execute_script("\$('#ChangeManager').autocomplete('search', '$TestUserLogin') ");
        $Selenium->WaitFor( JavaScript => 'return $("li.ui-menu-item:visible").length' );
        $Selenium->find_element("//*[text()='$AutoCompleteStringManager']")->click();

        # test edited CAB template
        $Selenium->execute_script(
            "\$('#TemplateID').val('$TemplateID').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element("//button[\@type='submit'][\@name='AddCABTemplateButton']")->click();

        # verify that both user and customer are loaded from edited test CAB template
        $Self->True(
            index( $Selenium->get_page_source(), "$TestUserCAB" ) > -1,
            "CAB user loaded from edited template - success",
        );
        $Self->True(
            index( $Selenium->get_page_source(), "$TestCustomerCAB" ) > -1,
            "CAB customer user loaded from edited template - success",
        );

        # delete test template
        my $Success = $TemplateObject->TemplateDelete(
            TemplateID => $TemplateID,
            UserID     => 1,
        );
        $Self->True(
            $Success,
            "$TemplateNameRandom edit is deleted",
        );

        # delete test created change
        $Success = $ChangeObject->ChangeDelete(
            ChangeID => $ChangeID,
            UserID   => 1,
        );
        $Self->True(
            $Success,
            "$ChangeTitleRandom is deleted",
        );

        # make sure cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );
    }
);

1;
