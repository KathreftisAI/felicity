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

        $Helper->ConfigSettingChange(
            Key   => 'CheckEmailAddresses',
            Value => 0,
        );

        # do not check RichText
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Frontend::RichText',
            Value => 0
        );

        # do not check service and type
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Ticket::Service',
            Value => 0
        );
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Ticket::Type',
            Value => 0
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

        # get test user ID
        my $TestUserID = $Kernel::OM->Get('Kernel::System::User')->UserLookup(
            UserLogin => $TestUserLogin,
        );

        # add test customer users for testing
        my @TestCustomers;
        for ( 1 .. 2 )
        {
            my $TestCustomer = 'CustomerUser' . $Helper->GetRandomID();
            my $UserLogin    = $Kernel::OM->Get('Kernel::System::CustomerUser')->CustomerUserAdd(
                Source         => 'CustomerUser',
                UserFirstname  => $TestCustomer,
                UserLastname   => $TestCustomer,
                UserCustomerID => $TestCustomer,
                UserLogin      => $TestCustomer,
                UserEmail      => "$TestCustomer\@localhost.com",
                ValidID        => 1,
                UserID         => $TestUserID,
            );

            $Self->True(
                $UserLogin,
                "Test customer user is created - $UserLogin",
            );

            push @TestCustomers, $TestCustomer;

        }

        # get ticket object
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

        my $TicketNumber = $TicketObject->TicketCreateNumber();
        my $TicketID     = $TicketObject->TicketCreate(
            TN           => $TicketNumber,
            Title        => 'Selenium Test Ticket',
            Queue        => 'Raw',
            Lock         => 'unlock',
            Priority     => '3 normal',
            State        => 'open',
            CustomerID   => 'TestCustomer',
            CustomerUser => $TestCustomers[0],
            OwnerID      => $TestUserID,
            UserID       => $TestUserID,
        );
        $Self->True(
            $TicketID,
            "Ticket is created - $TicketID",
        );

        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketZoom;TicketID=$TicketID");

        # wait for displaying submenu items for 'People' ticket menu item
        $Selenium->WaitFor(
            JavaScript =>
                'return typeof($) === "function" && $("#nav-People ul").css({ "height": "auto", "opacity": "100" });'
        );

        # go to AgentTicketCustomer, it causes open popup screen, wait will be done by WaitFor
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentTicketCustomer' )]")->VerifiedClick();

        # switch to another window
        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # set size for small screens, because of sidebar with customer info overflow form for customer data
        $Selenium->set_window_size( 1000, 700 );

        # check AgentTicketCustomer screen
        for my $ID (
            qw(CustomerAutoComplete CustomerID Submit CustomerInfo CustomerTickets)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        my $AutoCompleteString
            = "\"$TestCustomers[1] $TestCustomers[1]\" <$TestCustomers[1]\@localhost.com> ($TestCustomers[1])";
        $Selenium->find_element( "#CustomerAutoComplete", 'css' )->clear();
        $Selenium->find_element( "#CustomerAutoComplete", 'css' )->send_keys( $TestCustomers[1] );
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("li.ui-menu-item:visible").length' );
        $Selenium->find_element("//*[text()='$AutoCompleteString']")->VerifiedClick();

        # wait until customer data is loading (CustomerID is filled after CustomerAutoComplete)
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#CustomerID").val().length' );

        # submit customer data, it causes close popup screen, wait will be done by WaitFor
        $Selenium->find_element( "#CustomerAutoComplete", 'css' )->submit();

        # wait for update
        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketHistory;TicketID=$TicketID");

        # verify that action worked as expected
        my $HistoryText = "CustomerID=$TestCustomers[1];CustomerUser=$TestCustomers[1]";

        $Self->True(
            index( $Selenium->get_page_source(), 'CustomerUpdate' ) > -1,
            "Action AgentTicketCustomer executed correctly",
        );

        # delete created test ticket
        my $Success = $TicketObject->TicketDelete(
            TicketID => $TicketID,
            UserID   => 1,
        );
        $Self->True(
            $Success,
            "Ticket with ticket id $TicketID is deleted"
        );

        # delete created test customer users
        for my $TestCustomer (@TestCustomers) {
            my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
            $TestCustomer = $DBObject->Quote($TestCustomer);
            $Success      = $DBObject->Do(
                SQL  => "DELETE FROM customer_user WHERE login = ?",
                Bind => [ \$TestCustomer ],
            );
            $Self->True(
                $Success,
                "Delete customer user - $TestCustomer",
            );
        }

        # make sure the cache is correct.
        for my $Cache (
            qw (Ticket CustomerUser)
            )
        {
            $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
                Type => $Cache,
            );
        }

    }
);

1;
