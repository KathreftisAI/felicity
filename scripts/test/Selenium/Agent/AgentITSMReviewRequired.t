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

        # do not check RichText
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Frontend::RichText',
            Value => 0,
        );

        # create and log in test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users', 'itsm-service' ],
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

        # create two test tickets
        my @TicketIDs;
        my @TicketNumbers;
        my $TicketTitle = "Selenium Ticket" . $Helper->GetRandomID();
        for my $Ticket ( 1 .. 2 ) {
            my $TicketNumber = $TicketObject->TicketCreateNumber();
            my $TicketID     = $TicketObject->TicketCreate(
                TN           => $TicketNumber,
                Title        => $TicketTitle,
                Queue        => 'Raw',
                Lock         => 'unlock',
                Priority     => '3 normal',
                State        => 'new',
                CustomerID   => 'SeleniumCustomer',
                CustomerUser => "SeleniumCustomer\@localhost.com",
                OwnerID      => $TestUserID,
                UserID       => $TestUserID,
            );
            $Self->True(
                $TicketID,
                "Ticket is created - ID $TicketID",
            );
            push @TicketIDs,     $TicketID;
            push @TicketNumbers, $TicketNumber;
        }

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to zoom view of first created test ticket
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketZoom;TicketID=$TicketIDs[0]");

        # set review required via Close menu
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentTicketClose;TicketID=$TicketIDs[0]' )]")->click();

        # switch to Close window
        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#Subject").length' );

        # close ticket and set review required
        $Selenium->execute_script(
            "\$('#DynamicField_ITSMReviewRequired').val('Yes').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element( "#Subject",  'css' )->send_keys('Selenium Test');
        $Selenium->find_element( "#RichText", 'css' )->send_keys('ReviewRequired');
        $Selenium->find_element("//button[\@type='submit']")->click();

        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        sleep 2;

        # navigate to zoom view of second created test ticket
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketZoom;TicketID=$TicketIDs[1]");

        # set review required via Close menu
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentTicketClose;TicketID=$TicketIDs[1]' )]")->click();

        $Selenium->WaitFor( WindowCount => 2 );
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#Subject").length' );

        # close ticket and set review required
        $Selenium->execute_script(
            "\$('#DynamicField_ITSMReviewRequired').val('Yes').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element( "#Subject",  'css' )->send_keys('Selenium Test');
        $Selenium->find_element( "#RichText", 'css' )->send_keys('ReviewRequired');
        $Selenium->find_element("//button[\@type='submit']")->click();

        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        sleep 2;

        # click on search
        $Selenium->find_element( "#GlobalSearchNav", 'css' )->click();
        $Selenium->WaitFor( JavaScript => 'return $("#SearchProfileNew").length' );

        # select review required and title search field
        my $ReviewRequiredID = "Search_DynamicField_ITSMReviewRequired";
        $Selenium->execute_script(
            "\$('#Attribute').val('$ReviewRequiredID').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element( ".AddButton", 'css' )->click();
        $Selenium->execute_script("\$('#Attribute').val('Title').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element( ".AddButton", 'css' )->click();

        # search tickets by review required and ticket title
        $Selenium->find_element("//input[\@name='Title']")->send_keys($TicketTitle);
        $Selenium->execute_script(
            "\$('#$ReviewRequiredID').val('Yes').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element( "#SearchFormSubmit", 'css' )->VerifiedClick();

        # check for test created tickets on screen
        for my $Ticket (@TicketNumbers) {
            $Self->True(
                index( $Selenium->get_page_source(), $Ticket ) > -1,
                "Test ticket number $Ticket - found",
            );
        }

        # delete created test tickets
        for my $TicketDelete (@TicketIDs) {
            my $Success = $TicketObject->TicketDelete(
                TicketID => $TicketDelete,
                UserID   => $TestUserID,
            );
            $Self->True(
                $Success,
                "Ticket is deleted - ID $TicketDelete"
            );
        }

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
            Type => 'Ticket',
        );
    }
);

1;
