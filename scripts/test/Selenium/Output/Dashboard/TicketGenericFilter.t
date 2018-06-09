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

        # get needed objects
        my $Helper       = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

        # create test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users' ],
        ) || die "Did not get test user";

        # get test user ID
        my $TestUserID = $Kernel::OM->Get('Kernel::System::User')->UserLookup(
            UserLogin => $TestUserLogin,
        );

        my @Tests = (
            {
                TN           => $TicketObject->TicketCreateNumber(),
                CustomerUser => $Helper->GetRandomID() . '@first.com',
            },
            {
                TN           => $TicketObject->TicketCreateNumber(),
                CustomerUser => $Helper->GetRandomID() . '@second.com',
            },
            {
                TN           => $TicketObject->TicketCreateNumber(),
                CustomerUser => $Helper->GetRandomID() . '@third.com',
                CustomerID   => 'CustomerCompany' . $Helper->GetRandomID() . '(#)',
            },
        );

        # create test tickets
        my @Tickets;
        for my $Test (@Tests) {
            my $TicketID = $TicketObject->TicketCreate(
                TN           => $Test->{TN},
                Title        => 'Selenium Test Ticket',
                Queue        => 'Raw',
                Lock         => 'unlock',
                Priority     => '3 normal',
                State        => 'new',
                CustomerID   => $Test->{CustomerID} || 'SomeCustomer',
                CustomerUser => $Test->{CustomerUser},
                OwnerID      => $TestUserID,
                UserID       => $TestUserID,
            );
            $Self->True(
                $TicketID,
                "Ticket ID $TicketID - created"
            );

            push @Tickets, {
                TicketID     => $TicketID,
                TN           => $Test->{TN},
                CustomerUser => $Test->{CustomerUser},
                CustomerID   => $Test->{CustomerID}
            };
        }

        # login test user
        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # get config objects
        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

        # turn on the CustomerUserID column by default
        my $Config = $ConfigObject->Get('DashboardBackend')->{'0120-TicketNew'};
        $Config->{DefaultColumns}->{CustomerUserID} = '2';
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'DashboardBackend###0120-TicketNew',
            Value => $Config,
        );

        # refresh dashboard screen and clean it's cache
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
            Type => 'Dashboard',
        );

        $Selenium->VerifiedRefresh();

        # navigate to dashboard screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?");

        # check if 'CustomerUserID' filter for TicketNew dashboard is set
        eval {
            $Self->True(
                $Selenium->find_element("//a[contains(\@title, \'CustomerUserID\' )]"),
                "'CustomerUserID' filter for TicketNew dashboard is set",
            );
        };
        if ($@) {
            $Self->True(
                $@,
                "'CustomerUserID' filter for TicketNew dashboard is not set",
            );
        }
        else {

            # click on column setting filter for the first customer in TicketNew generic dashboard overview
            $Selenium->find_element("//a[contains(\@title, \'CustomerUserID\' )]")->VerifiedClick();

            # select the first test CustomerUserID as filter for TicketNew generic dashboard overview
            my $ParentElement = $Selenium->find_element( "div.ColumnSettingsBox", 'css' );
            $Selenium->find_child_element( $ParentElement, "./input" )->send_keys( $Tickets[0]->{CustomerUser} );
            sleep 1;

            # wait for AJAX to finish
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # choose the value
            $Selenium->execute_script(
                "\$('#ColumnFilterCustomerUserID0120-TicketNew').val('$Tickets[0]->{CustomerUser}').trigger('change');"
            );

            # wait for auto-complete action
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("a[href*=\'TicketID='
                    . $Tickets[1]->{TicketID}
                    . '\']").length'
            );

            # verify the first test ticket is found  by filtering with the second customer that is not in DB
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[0]->{TN} ) > -1,
                "Test ticket with TN $Tickets[0]->{TN} - found on screen after filtering with customer - $Tickets[0]->{CustomerUser}",
            );

            # verify the second test ticket is not found by filtering with the first customer that is not in DB
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[1]->{TN} ) == -1,
                "Test ticket with TN $Tickets[1]->{TN} - not found on screen after filtering with customer - $Tickets[0]->{CustomerUser}",
            );

            # click on column setting filter for CustomerUserID in TicketNew generic dashboard overview
            $Selenium->find_element("//a[contains(\@title, \'CustomerUserID\' )]")->VerifiedClick();
            sleep 1;

            # wait for AJAX to finish
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # delete the current filter
            $Selenium->find_element( "a.DeleteFilter", 'css' )->VerifiedClick();

            # wait for AJAX to finish
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );

            # click on column setting filter for CustomerUserID in TicketNew generic dashboard overview
            $Selenium->find_element("//a[contains(\@title, \'CustomerUserID\' )]")->VerifiedClick();

            # select test CustomerUserID as filter for TicketNew generic dashboard overview
            $ParentElement = $Selenium->find_element( "div.ColumnSettingsBox", 'css' );
            $Selenium->find_child_element( $ParentElement, "./input" )->send_keys( $Tickets[1]->{CustomerUser} );
            sleep 1;

            # wait for AJAX to finish
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # choose the value
            $Selenium->execute_script(
                "\$('#ColumnFilterCustomerUserID0120-TicketNew').val('$Tickets[1]->{CustomerUser}').trigger('change');"
            );

            # wait for auto-complete action
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("a[href*=\'TicketID='
                    . $Tickets[0]->{TicketID}
                    . '\']").length'
            );

            # verify the second test ticket is found by filtering with the second customer that is not in DB
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[1]->{TN} ) > -1,
                "Test ticket TN $Tickets[1]->{TN} - found on screen after filtering with the customer - $Tickets[1]->{CustomerUser}",
            );

            # verify the first test ticket is not found by filtering with the second customer that is not in DB
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[0]->{TN} ) == -1,
                "Test ticket TN $Tickets[0]->{TN} - not found on screen after filtering with customer - $Tickets[1]->{CustomerUser}",
            );

            # cleanup
            # click on column setting filter for CustomerUserID in TicketNew generic dashboard overview
            $Selenium->find_element("//a[contains(\@title, \'CustomerUserID\' )]")->VerifiedClick();
            sleep 1;

            # wait for AJAX to finish
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # delete the current filter
            $Selenium->find_element( "a.DeleteFilter", 'css' )->VerifiedClick();

            # wait for AJAX to finish
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );
        }

        # update configuration
        $Config                                     = $ConfigObject->Get('DashboardBackend')->{'0120-TicketNew'};
        $Config->{DefaultColumns}->{CustomerUserID} = '0';
        $Config->{DefaultColumns}->{CustomerID}     = '2';
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'DashboardBackend###0120-TicketNew',
            Value => $Config,
        );

        # refresh dashboard screen and clean it's cache
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
            Type => 'Dashboard',
        );

        $Selenium->VerifiedRefresh();

        # navigate to dashboard screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?");

        # check if 'CustomerID' filter for TicketNew dashboard is set
        eval {
            $Self->True(
                $Selenium->find_element("//a[contains(\@title, \'CustomerID\' )]"),
                "'CustomerID' filter for TicketNew dashboard is set",
            );
        };
        if ($@) {
            $Self->True(
                $@,
                "'CustomerID' filter for TicketNew dashboard is not set",
            );
        }
        else {

            # click on column setting filter for the first customer in TicketNew generic dashboard overview
            $Selenium->find_element("//a[contains(\@title, \'CustomerID\' )]")->VerifiedClick();

            # select the third test CustomerID as filter for TicketNew generic dashboard overview
            my $ParentElement = $Selenium->find_element( "div.ColumnSettingsBox", 'css' );
            $Selenium->find_child_element( $ParentElement, "./input" )->send_keys( $Tickets[2]->{CustomerID} );
            sleep 1;

            # wait for AJAX to finish
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # choose the value
            $Selenium->execute_script(
                "\$('#ColumnFilterCustomerID0120-TicketNew').val('$Tickets[2]->{CustomerID}').trigger('change');"
            );

            # wait for auto-complete action
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("a[href*=\'TicketID='
                    . $Tickets[1]->{TicketID}
                    . '\']").length'
            );

            # verify the third test ticket is found  by filtering with the second customer that is not in DB
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[2]->{TN} ) > -1,
                "Test ticket with TN $Tickets[2]->{TN} - found on screen after filtering with customer - $Tickets[2]->{CustomerID}",
            );

            # verify the second test ticket is not found by filtering with the first customer that is not in DB
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[1]->{TN} ) == -1,
                "Test ticket with TN $Tickets[1]->{TN} - not found on screen after filtering with customer - $Tickets[1]->{CustomerID}",
            );

            # click on column setting filter for CustomerID in TicketNew generic dashboard overview
            $Selenium->find_element("//a[contains(\@title, \'CustomerID\' )]")->VerifiedClick();
            sleep 1;

            # wait for AJAX to finish
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # delete the current filter
            $Selenium->find_element( "a.DeleteFilter", 'css' )->VerifiedClick();

            # wait for AJAX to finish
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );

        }

        # delete test tickets
        for my $Ticket (@Tickets) {
            my $Success = $TicketObject->TicketDelete(
                TicketID => $Ticket->{TicketID},
                UserID   => 1,
            );
            $Self->True(
                $Success,
                "Ticket ID $Ticket->{TicketID} - deleted"
            );
        }

        # make sure cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
            Type => 'Ticket',
        );
    }
);

1;
