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
            Name  => 'successful',
        );

        # get change object
        my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

        # create test change
        my $ChangeTitleRandom = 'ITSMChange ' . $Helper->GetRandomID();
        my $ChangeID          = $ChangeObject->ChangeAdd(
            ChangeTitle   => $ChangeTitleRandom,
            Description   => "Test Description",
            Justification => "Test Justification",
            ChangeStateID => $ChangeStateDataRef->{ItemID},
            UserID        => 1,
        );
        $Self->True(
            $ChangeID,
            "Change in successful state is created",
        );

        # create and log in test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-builder', 'itsm-change-manager' ]
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get test user ID
        my $TestUserLoginID = $Kernel::OM->Get('Kernel::System::User')->UserLookup(
            UserLogin => $TestUserLogin,
        );

        # create new test CAB users
        my $TestCABUser = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-builder' ],
        ) || die "Did not get test user";

        # get CAB user ID
        my $TestCABUserID = $Kernel::OM->Get('Kernel::System::User')->UserLookup(
            UserLogin => $TestCABUser,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentITSMChangeZoom of created test change
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMChangeZoom;ChangeID=$ChangeID");

        # click on 'Involved Persons' and switch screens
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMChangeInvolvedPersons;ChangeID=$ChangeID' )]")
            ->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#ChangeManager").length' );

        # prepare CAB for test template
        my $AutoCompleteManagerUser
            = "\"$TestUserLogin $TestUserLogin\" <$TestUserLogin\@localunittest.com> ($TestUserLoginID)";
        $Selenium->execute_script("\$('#ChangeManager').autocomplete('search', '$TestUserLogin') ");
        $Selenium->WaitFor( JavaScript => 'return $("li.ui-menu-item:visible").length' );
        $Selenium->find_element("//*[text()='$AutoCompleteManagerUser']")->click();

        my $AutoCompleteCABUser = "\"$TestCABUser $TestCABUser\" <$TestCABUser\@localunittest.com> ($TestCABUserID)";
        $Selenium->execute_script("\$('#NewCABMember').autocomplete('search', '$TestCABUser') ");
        $Selenium->WaitFor( JavaScript => 'return $("li.ui-menu-item:visible").length' );
        $Selenium->find_element("//*[text()='$AutoCompleteCABUser']")->click();
        $Selenium->find_element( "#AddCABMemberButton", 'css' )->click();

        # verify CAB user
        $Self->True(
            index( $Selenium->get_page_source(), $TestCABUser ) > -1,
            "$TestCABUser is found",
        );

        # click 'Save this CAB as template'
        $Selenium->find_element("//button[\@value='NewTemplate'][\@type='submit']")->VerifiedClick();

        # check page
        for my $ID (qw(TemplateName Comment ValidID SubmitAddTemplate))
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # check client side validation
        my $Element = $Selenium->find_element( "#TemplateName", 'css' );
        $Element->send_keys("");
        $Element->submit();

        $Self->Is(
            $Selenium->execute_script(
                "return \$('#TemplateName').hasClass('Error')"
            ),
            '1',
            'Client side validation correctly detected missing input value',
        );

        # create test CAB template
        my $CABTemplateName = "CAB Template " . $Helper->GetRandomID();
        $Selenium->find_element( "#TemplateName",      'css' )->send_keys($CABTemplateName);
        $Selenium->find_element( "#Comment",           'css' )->send_keys("SeleniumTest");
        $Selenium->find_element( "#SubmitAddTemplate", 'css' )->VerifiedClick();

        # delete previous CAB user first
        $Selenium->find_element( "#ChangeManager", 'css' )->send_keys($TestUserLogin);
        $Selenium->WaitFor( JavaScript => 'return $("li.ui-menu-item:visible").length' );
        $Selenium->find_element("//*[text()='$AutoCompleteManagerUser']")->click();
        $Selenium->find_element( "#CABAgents$TestCABUserID", 'css' )->click();

        # verify CAB user deletion
        $Self->True(
            index( $Selenium->get_page_source(), $TestCABUser ) == -1,
            "$TestCABUser is not found",
        );

        # get DB object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # get test CAB template ID
        my $CABTemplateQuoted = $DBObject->Quote($CABTemplateName);
        $DBObject->Prepare(
            SQL  => "SELECT id FROM change_template WHERE name = ?",
            Bind => [ \$CABTemplateQuoted ]
        );
        my $CABTemplateID;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $CABTemplateID = $Row[0];
        }

        # import CAB from template
        $Selenium->execute_script(
            "\$('#TemplateID').val('$CABTemplateID').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element("//button[\@value='Apply Template'][\@type='submit']")->click();

        # verify CAB user applied from template
        $Self->True(
            index( $Selenium->get_page_source(), $TestCABUser ) > -1,
            "$TestCABUser is found",
        );

        # delete test created template
        my $Success = $Kernel::OM->Get('Kernel::System::ITSMChange::Template')->TemplateDelete(
            TemplateID => $CABTemplateID,
            UserID     => 1,
        );
        $Self->True(
            $Success,
            "$CABTemplateName is deleted",
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

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );
    }

);

1;
