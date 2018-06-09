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

        # do not check email addresses
        $Helper->ConfigSettingChange(
            Key   => 'CheckEmailAddresses',
            Value => 0,
        );

        # enable ticket responsible feature
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Ticket::Responsible',
            Value => 1
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

        # get ticket object
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

        # create test tickets
        my @TicketIDs;
        for ( 1 .. 3 ) {
            my $TicketID = $TicketObject->TicketCreate(
                Title         => 'Selenium Test Ticket',
                Queue         => 'Raw',
                Lock          => 'unlock',
                Priority      => '3 normal',
                State         => 'open',
                CustomerID    => 'SeleniumCustomer',
                CustomerUser  => 'SeleniumCustomer@localhost.com',
                OwnerID       => $TestUserID,
                UserID        => $TestUserID,
                ResponsibleID => $TestUserID,
            );
            $Self->True(
                $TicketID,
                "Ticket is created - ID $TicketID",
            );

            push @TicketIDs, $TicketID;

        }

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentTicketResponsibleView screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketResponsibleView");

        # test if tickets show with appropriate filters
        FILTER:
        for my $Filter (qw(All New Reminder ReminderReached)) {

            # check for control button (All / New Article / Pending / Reminder Reached)
            my $Element = $Selenium->find_element(
                "//a[contains(\@href, \'Action=AgentTicketResponsibleView;SortBy=Age;OrderBy=Up;View=;Filter=$Filter\' )]"
            );
            $Element->is_enabled();
            $Element->is_displayed();
            $Element->VerifiedClick();

            # expect to find no tickets for Reminder Reached filter
            if ( $Filter eq 'ReminderReached' ) {
                $Self->True(
                    index( $Selenium->get_page_source(), 'No ticket data found.' ) > -1,
                    "No tickets found with Reminder Reached filter ",
                ) || die "No ticket data message";
                last FILTER;
            }

            # check different views for filters
            for my $View (qw(Small Medium Preview)) {

                # click on viewer controller
                $Selenium->find_element(
                    "//a[contains(\@href, \'Action=AgentTicketResponsibleView;Filter=$Filter;View=$View;\' )]"
                )->VerifiedClick();

                # check screen output
                $Selenium->find_element( "table",             'css' );
                $Selenium->find_element( "table tbody tr td", 'css' );

                # verify that all tickets are present
                for my $TicketID (@TicketIDs) {

                    my $TicketNumber = $TicketObject->TicketNumberLookup(
                        TicketID => $TicketID,
                        UserID   => $TestUserID,
                    );

                    $Self->True(
                        index( $Selenium->get_page_source(), $TicketNumber ) > -1,
                        "Ticket found on page - $TicketNumber ",
                    ) || die "Ticket $TicketNumber not found on page";
                }
            }

            # change status for test tickets with bulk action
            if ( $Filter eq 'New' ) {
                for my $TicketID (@TicketIDs) {

                    # select all created test tickets
                    $Selenium->find_element("//input[\@type='checkbox'][\@value='$TicketID']")->VerifiedClick();
                }

                # click on bulk action and switch window
                $Selenium->find_element("//*[text()='Bulk']")->VerifiedClick();
                $Selenium->WaitFor( WindowCount => 2 );
                my $Handles = $Selenium->get_window_handles();
                $Selenium->switch_to_window( $Handles->[1] );

                # wait until page has loaded, if necessary
                $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#StateID").length' );

                # change state to 'pending reminder'
                $Selenium->execute_script("\$('#StateID').val('6').trigger('redraw.InputField').trigger('change');");
                $Selenium->find_element( "#submitRichText", 'css' )->click();

                # switch back to AgentTicketResponsibleView
                $Selenium->WaitFor( WindowCount => 1 );
                $Selenium->switch_to_window( $Handles->[0] );

            }

            # switch back to AgentTicketResponsibleView
            $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketResponsibleView");

        }

        # delete created test tickets
        my $Success;
        for my $TicketID (@TicketIDs) {
            $Success = $TicketObject->TicketDelete(
                TicketID => $TicketID,
                UserID   => $TestUserID,
            );
            $Self->True(
                $Success,
                "Delete ticket - ID $TicketID"
            );
        }

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'Ticket' );

    }
);

1;
