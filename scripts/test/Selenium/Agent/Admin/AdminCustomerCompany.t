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

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => ['admin'],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AdminCustomerCompany screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminCustomerCompany");

        # check overview AdminCustomerCompany
        $Selenium->find_element( "table",             'css' );
        $Selenium->find_element( "table thead tr th", 'css' );
        $Selenium->find_element( "table tbody tr td", 'css' );
        $Selenium->find_element( "#Source",           'css' );
        $Selenium->find_element( "#Search",           'css' );

        # click 'Add customer' link
        $Selenium->find_element( "button.CallForAction", 'css' )->VerifiedClick();

        # check add customer screen
        for my $ID (
            qw(CustomerID CustomerCompanyName CustomerCompanyComment ValidID)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # check client side validation
        $Selenium->find_element( "#CustomerID", 'css' )->clear();
        $Selenium->find_element( "#CustomerID", 'css' )->VerifiedSubmit();
        $Self->Is(
            $Selenium->execute_script(
                "return \$('#CustomerID').hasClass('Error')"
            ),
            '1',
            'Client side validation correctly detected missing input value',
        );

        # create a real test customer company
        my $RandomID = 'TestCustomerCompany' . $Helper->GetRandomID();
        $Selenium->find_element( "#CustomerID",          'css' )->send_keys($RandomID);
        $Selenium->find_element( "#CustomerCompanyName", 'css' )->send_keys($RandomID);
        $Selenium->execute_script("\$('#ValidID').val('1').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element( "#CustomerCompanyComment", 'css' )->send_keys('Selenium test customer company');
        $Selenium->find_element( "#CustomerCompanyZIP",     'css' )->send_keys('0');
        $Selenium->find_element( "#CustomerID",             'css' )->VerifiedSubmit();

        # check overview page
        $Self->True(
            index( $Selenium->get_page_source(), $RandomID ) > -1,
            "$RandomID found on page",
        );

        # create another test customer company for filter search test
        my $RandomID2 = 'TestCustomerCompany' . $Helper->GetRandomID();
        $Selenium->find_element("//button[\@type='submit']")->VerifiedClick();
        $Selenium->find_element( "button.CallForAction", 'css' )->VerifiedClick();
        $Selenium->find_element( "#CustomerID",          'css' )->send_keys($RandomID2);
        $Selenium->find_element( "#CustomerCompanyName", 'css' )->send_keys($RandomID2);
        $Selenium->find_element( "#CustomerID",          'css' )->VerifiedSubmit();

        # test search filter only for test Customer companies
        $Selenium->find_element( "#Search", 'css' )->clear();
        $Selenium->find_element( "#Search", 'css' )->send_keys('TestCustomerCompany');
        $Selenium->find_element( "#Search", 'css' )->VerifiedSubmit();

        # check for another customer company
        $Self->True(
            index( $Selenium->get_page_source(), $RandomID2 ) > -1,
            "$RandomID2 found on page",
        );

        # test search filter by test customers $RandomID
        $Selenium->find_element( "#Search", 'css' )->clear();
        $Selenium->find_element( "#Search", 'css' )->send_keys($RandomID);
        $Selenium->find_element( "#Search", 'css' )->VerifiedSubmit();

        $Self->True(
            index( $Selenium->get_page_source(), $RandomID ) > -1,
            "$RandomID found on page",
        );
        $Self->False(
            index( $Selenium->get_page_source(), $RandomID2 ) > -1,
            "$RandomID2 not found on page",
        );

        # check and edit new customer company
        my $LinkText = substr( $RandomID, 0, 17 ) . '...';
        $Selenium->find_element( $LinkText, 'link_text' )->VerifiedClick();

        $Self->Is(
            $Selenium->find_element( '#CustomerID', 'css' )->get_value(),
            $RandomID,
            "#CustomerID updated value",
        );
        $Self->Is(
            $Selenium->find_element( '#CustomerCompanyName', 'css' )->get_value(),
            $RandomID,
            "#CustomerCompanyName updated value",
        );
        $Self->Is(
            $Selenium->find_element( '#ValidID', 'css' )->get_value(),
            1,
            "#ValidID updated value",
        );
        $Self->Is(
            $Selenium->find_element( '#CustomerCompanyZIP', 'css' )->get_value(),
            '0',
            "#CustomerCompanyComment updated value",
        );

        $Self->Is(
            $Selenium->find_element( '#CustomerCompanyComment', 'css' )->get_value(),
            'Selenium test customer company',
            "#CustomerCompanyComment updated value",
        );

        # set test customer company to invalid and clear comment
        $Selenium->execute_script("\$('#ValidID').val('2').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element( "#CustomerCompanyComment", 'css' )->clear();
        $Selenium->find_element( "#CustomerID",             'css' )->VerifiedSubmit();

        # test search filter
        $Selenium->find_element( "#Search", 'css' )->clear();
        $Selenium->find_element( "#Search", 'css' )->send_keys($RandomID);
        $Selenium->find_element( "#Search", 'css' )->VerifiedSubmit();

        # check class of invalid customer user in the overview table
        $Self->True(
            $Selenium->find_element( "tr.Invalid", 'css' ),
            "There is a class 'Invalid' for test Customer Company",
        );

        # delete created test customer companies
        for my $CustomerID ( $RandomID, $RandomID2 ) {
            my $Success = $Kernel::OM->Get('Kernel::System::DB')->Do(
                SQL  => "DELETE FROM customer_company WHERE customer_id = ?",
                Bind => [ \$CustomerID ],
            );
            $Self->True(
                $Success,
                "Deleted CustomerCompany - $CustomerID",
            );
        }

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
            Type => 'CustomerCompany',
        );

    }
);

1;
