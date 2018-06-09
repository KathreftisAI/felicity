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

        $Selenium->set_window_size( 600, 400 );

        my $Language      = 'de';
        my $TestUserLogin = $Helper->TestUserCreate(
            Language => $Language,
            Groups   => [ 'admin', 'users' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get ticket object
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

        # create test ticket
        my $TitleRandom  = "Title" . $Helper->GetRandomID();
        my $TicketNumber = $TicketObject->TicketCreateNumber();
        my $TicketID     = $TicketObject->TicketCreate(
            TN         => $TicketNumber,
            Title      => $TitleRandom,
            Queue      => 'Raw',
            Lock       => 'unlock',
            Priority   => '3 normal',
            State      => 'open',
            CustomerID => 'SeleniumCustomer',
            OwnerID    => 1,
            UserID     => 1,
        );
        $Self->True(
            $TicketID,
            "Ticket is created - ID $TicketID",
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentTicketZoom for test created ticket
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketZoom;TicketID=$TicketID");

        # verify its right screen
        $Self->True(
            index( $Selenium->get_page_source(), $TitleRandom ) > -1,
            "Ticket $TitleRandom found on page",
        );

        my $Element = $Selenium->find_element("//a[contains(\@href, \'Action=AgentTicketPriority')]");
        $Self->True(
            $Element->is_enabled() && $Element->is_displayed(),
            "Link for priority popup is displayed and enabled",
        );

        $Selenium->find_element("//a[contains(\@href, \'Action=AgentTicketPriority')]")->VerifiedClick();

        # wait for popup iframe to show
        $Selenium->WaitFor(
            JavaScript => "return typeof(\$) === 'function' && \$('.PopupIframe:visible').length == 1"
        );

        # wait for the priority search in the iframe to show up
        $Selenium->WaitFor(
            JavaScript =>
                "return typeof(\$) === 'function' && \$('#NewPriorityID_Search:visible', \$('.PopupIframe').contents()).length == 1"
        );

        # as long as the overlay is opened, elements below it should not be usable, e.g. the mobile navigation toggle
        my $Success;
        eval {
            $Success = $Selenium->find_element( "#ResponsiveNavigationHandle", "css" )->VerifiedClick();
        };

        $Self->False(
            $Success,
            "Mobile navigation button should not be clickable.",
        );

        # clean up test data from the DB
        $Success = $TicketObject->TicketDelete(
            TicketID => $TicketID,
            UserID   => 1,
        );
        $Self->True(
            $Success,
            "Ticket is deleted - ID $TicketID"
        );

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'Ticket' );

    }
);

1;
