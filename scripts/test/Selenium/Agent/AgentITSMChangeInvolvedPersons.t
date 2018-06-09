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

        # create and log in builder user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-manager' ],
        ) || die "Did not get test builder user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get user object
        my $UserObject = $Kernel::OM->Get('Kernel::System::User');

        # get test user ID
        my $TestUserID = $UserObject->UserLookup(
            UserLogin => $TestUserLogin,
        );

        # create test CAB user
        my $TestUserCAB = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-manager' ],
        ) || die "Did not get test builder user";

        # get test CAB user ID
        my $TestUserCABID = $UserObject->UserLookup(
            UserLogin => $TestUserCAB,
        );

        # get change state data
        my $ChangeDataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
            Class => 'ITSM::ChangeManagement::Change::State',
            Name  => 'requested',
        );

        # get change object
        my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

        # create test change
        my $ChangeTitleRandom = 'ITSMChange Requested ' . $Helper->GetRandomID();
        my $ChangeID          = $ChangeObject->ChangeAdd(
            ChangeTitle   => $ChangeTitleRandom,
            Description   => 'Selenium Test Description',
            Justification => 'Selenium Test Justification',
            ChangeStateID => $ChangeDataRef->{ItemID},
            UserID        => $TestUserID,
        );
        $Self->True(
            $ChangeID,
            "$ChangeTitleRandom is created",
        );

        # create test customer user
        my $TestCustomer = $Helper->TestCustomerUserCreate();

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentITSMChangeZoom screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMChangeZoom;ChangeID=$ChangeID");

        # click on 'Involved Persons' and switch window
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMChangeInvolvedPersons;ChangeID=$ChangeID')]")
            ->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#ChangeManager").length' );

        # check page
        for my $ID (
            qw( ChangeManager ChangeBuilder TemplateID NewCABMember )
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        for my $Button (
            qw ( AddCABMemberButton SubmitButton AddCABTemplateButton )
            )
        {
            my $Element = $Selenium->find_element("//button[\@name='$Button']");
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # check client validation
        $Selenium->find_element( "#ChangeManager", 'css' )->clear();
        $Selenium->find_element( "#ChangeManager", 'css' )->VerifiedSubmit();
        $Self->Is(
            $Selenium->execute_script(
                "return \$('#ChangeManager').hasClass('Error')"
            ),
            '1',
            'Validation correctly detected missing input value',
        );

        # input change manager
        my $AutoCompleteStringManager
            = "\"$TestUserLogin $TestUserLogin\" <$TestUserLogin\@localunittest.com> ($TestUserID)";
        $Selenium->execute_script("\$('#ChangeManager').autocomplete('search', '$TestUserLogin') ");
        $Selenium->WaitFor( JavaScript => 'return $("li.ui-menu-item:visible").length' );
        $Selenium->find_element("//*[text()='$AutoCompleteStringManager']")->click();

        # input change agent CAB
        my $AutoCompleteStringCAB = "\"$TestUserCAB $TestUserCAB\" <$TestUserCAB\@localunittest.com> ($TestUserCABID)";
        $Selenium->execute_script("\$('#NewCABMember').autocomplete('search', '$TestUserCAB') ");
        $Selenium->WaitFor( JavaScript => 'return $("li.ui-menu-item:visible").length' );
        $Selenium->find_element("//*[text()='$AutoCompleteStringCAB']")->click();
        $Selenium->find_element("//button[\@type='submit'][\@name='AddCABMemberButton']")->VerifiedClick();

        # input change customer CAB
        my $AutoCompleteStringCustomer
            = "\"$TestCustomer $TestCustomer\" <$TestCustomer\@localunittest.com> ($TestCustomer)";
        $Selenium->execute_script("\$('#NewCABMember').autocomplete('search', '$TestCustomer') ");
        $Selenium->WaitFor( JavaScript => 'return $("li.ui-menu-item:visible").length' );
        $Selenium->find_element("//*[text()='$AutoCompleteStringCustomer']")->click();
        $Selenium->find_element("//button[\@type='submit'][\@name='AddCABMemberButton']")->VerifiedClick();

        # search if data is in the table
        $Self->True(
            $Selenium->execute_script(
                "return \$('table.DataTable tr td:contains($TestUserCAB)').length"
            ),
            "$TestUserCAB is found",
        );
        $Self->True(
            $Selenium->execute_script(
                "return \$('table.DataTable tr td:contains($TestCustomer)').length"
            ),
            "$TestCustomer is found",
        );

        # test delete CAB button
        $Selenium->find_element( "#CABAgents$TestUserCABID", 'css' )->VerifiedClick();
        $Self->False(
            $Selenium->execute_script(
                "return \$('table.DataTable tr td:contains($TestUserCAB)').length"
            ),
            "$TestUserCAB is not found",
        );

        # press button submit
        $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->click();

        # back to previous window
        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        sleep(1);

        # click on 'History'
        $Selenium->find_element(
            "//a[contains(\@href, \'Action=AgentITSMChangeHistory;ChangeID=$ChangeID' )]"
        )->click();

        $Selenium->WaitFor( WindowCount => 2 );
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $(".CancelClosePopup").length' );

        # check history log to verify change involved persons
        $Self->True(
            index( $Selenium->get_page_source(), "CAB Agents: New: $TestUserCAB &lt;- Old: -" ) > -1,
            "Change in agent CAB - success",
        );
        $Self->True(
            index( $Selenium->get_page_source(), "CAB Customers: New: $TestCustomer &lt;- Old: -" ) > -1,
            "Change in customer CAB - success",
        );
        $Self->True(
            index( $Selenium->get_page_source(), "Change Manager: New: $TestUserLogin" ) > -1,
            "Change in manager - success",
        );

        # delete created test change
        my $Success = $ChangeObject->ChangeDelete(
            ChangeID => $ChangeID,
            UserID   => 1,
        );
        $Self->True(
            $Success,
            "$ChangeTitleRandom is deleted",
        );

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );
    }

);

1;
