# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
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

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users', 'faq', 'faq_admin' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentFAQCategory
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentFAQCategory");

        # check AgentFAQCategory screen
        $Selenium->find_element( "table",             'css' );
        $Selenium->find_element( "table thead tr th", 'css' );
        $Selenium->find_element( "table tbody tr td", 'css' );

        # click on 'Add category'
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentFAQCategory;Subaction=Add' )]")->VerifiedClick();

        # check page
        for my $ID (
            qw(Name ParentID PermissionGroups ValidID Comment)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # create test category
        my $CategoryName = 'Category ' . $Helper->GetRandomID();
        $Selenium->find_element( "#Name", 'css' )->send_keys($CategoryName);
        $Selenium->execute_script(
            "\$('#PermissionGroups').val(\$('#PermissionGroups option').filter(function () { return \$(this).html() == 'faq'; } ).val() ).trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->execute_script("\$('#ValidID').val('1').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element( "#Comment", 'css' )->send_keys('Selenium Category');
        $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

        # verify test category is created
        $Self->True(
            index( $Selenium->get_page_source(), $CategoryName ) > -1,
            "$CategoryName is found",
        );

        # get DB object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # get test created category ID
        my $Category = $DBObject->Quote($CategoryName);
        $DBObject->Prepare(
            SQL  => "SELECT id FROM faq_category WHERE name = ?",
            Bind => [ \$CategoryName ]
        );
        my $CategoryID;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $CategoryID = $Row[0];
        }

        # click on delete icon
        $Selenium->find_element( "#DeleteCategoryID$CategoryID", 'css' )->VerifiedClick();
        $Selenium->WaitFor( JavaScript => 'return $("#DialogButton1").length' );
        $Selenium->find_element( "#DialogButton1", 'css' )->VerifiedClick();

        # wait until delete dialog has closed
        $Selenium->WaitFor( JavaScript => "return !\$('#DialogButton1').length" );

        # verify test created category is deleted
        $Self->True(
            index( $Selenium->get_page_source(), $CategoryName ) == -1,
            "$CategoryName is not found",
        );

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => "FAQ" );
    }
);

1;
