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

        # create test customer user and login
        my $TestCustomerUserLogin = $Helper->TestCustomerUserCreate(
        ) || die "Did not get test customer user";

        $Selenium->Login(
            Type     => 'Customer',
            User     => $TestCustomerUserLogin,
            Password => $TestCustomerUserLogin,
        );

        # get needed data
        my @User = $Kernel::OM->Get('Kernel::System::CustomerUser')->CustomerIDs(
            User => $TestCustomerUserLogin,
        );
        my $TestCustomerID = $User[0];

        my $TypeID = $Kernel::OM->Get('Kernel::System::Type')->TypeLookup( Type => 'Incident' );

        # create test service
        my $ServiceName     = "Service" . $Helper->GetRandomID();
        my $ITSMCriticality = '5 very high';
        my $ServiceID       = $Kernel::OM->Get('Kernel::System::Service')->ServiceAdd(
            Name        => $ServiceName,
            ValidID     => 1,
            Comment     => 'Selenium Test Service',
            TypeID      => $TypeID,
            Criticality => $ITSMCriticality,
            UserID      => 1,
        );
        $Self->True(
            $ServiceID,
            "Service is created - ID $ServiceID",
        );

        # set ITSMImpact to '3 normal' and get priority
        # expected value is '4 high', it will be checked in AgentTicketPrint screen
        my $ITSMImpact = '3 normal';
        my $PriorityID = $Kernel::OM->Get('Kernel::System::ITSMCIPAllocate')->PriorityAllocationGet(
            Criticality => $ITSMCriticality,
            Impact      => $ITSMImpact,
        );

        # get Ticket object
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

        # create test customer
        my $TicketNumber = $TicketObject->TicketCreateNumber();
        my $TicketID     = $TicketObject->TicketCreate(
            TN           => $TicketNumber,
            Title        => 'Selenium Test Ticket',
            Queue        => 'Raw',
            PriorityID   => $PriorityID,
            Lock         => 'unlock',
            State        => 'open',
            TypeID       => $TypeID,
            ServiceID    => $ServiceID,
            CustomerID   => $TestCustomerID,
            CustomerUser => "$TestCustomerUserLogin\@localhost.com",
            OwnerID      => 1,
            UserID       => 1,
        );
        $Self->True(
            $TicketID,
            "Ticket is created - ID $TicketID",
        );

        # get needed objects
        my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
        my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

        my $ITSMCriticalityConfig = $DynamicFieldObject->DynamicFieldGet(
            Name => "ITSMCriticality",
        );
        my $ITSMImpactConfig = $DynamicFieldObject->DynamicFieldGet(
            Name => "ITSMImpact",
        );

        # set dynamic field value for Criticality and Impact
        $DynamicFieldBackendObject->ValueSet(
            DynamicFieldConfig => $ITSMCriticalityConfig,
            ObjectID           => $TicketID,
            Value              => $ITSMCriticality,
            UserID             => 1,
        );
        $DynamicFieldBackendObject->ValueSet(
            DynamicFieldConfig => $ITSMImpactConfig,
            ObjectID           => $TicketID,
            Value              => $ITSMImpact,
            UserID             => 1,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to CustomerTicketZoom screen
        $Selenium->VerifiedGet("${ScriptAlias}customer.pl?Action=CustomerTicketZoom;TicketNumber=$TicketNumber");

        # click on print menu item
        $Selenium->find_element("//a[contains(\@href, \'Action=CustomerTicketPrint;TicketID=$TicketID\' )]")->click();

        # switch to another window
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until print screen is loaded
        ACTIVESLEEP:
        for my $Second ( 1 .. 20 ) {
            if ( index( $Selenium->get_page_source(), "Priority" ) > -1, ) {
                last ACTIVESLEEP;
            }
            sleep 1;
        }

        # check for printed values of test ticket
        $Self->True(
            index( $Selenium->get_page_source(), "Priority:" ) > -1
                && index( $Selenium->get_page_source(), "4 high" ) > -1,
            "Priority: 4 high - found on print screen",
        );
        $Self->True(
            index( $Selenium->get_page_source(), "Impact:" ) > -1
                && index( $Selenium->get_page_source(), "3 normal" ) > -1,
            "Impact: 3 normal - found on print screen",
        );
        $Self->True(
            index( $Selenium->get_page_source(), "Criticality:" ) > -1
                && index( $Selenium->get_page_source(), "5 very high" ) > -1,
            "Criticality: 5 very high - found on print screen",
        );

        # clean up test data from the DB
        # delete test ticket
        my $Success = $TicketObject->TicketDelete(
            TicketID => $TicketID,
            UserID   => 1,
        );
        $Self->True(
            $Success,
            "Ticket is deleted - $TicketID"
        );

        # delete test service
        $Success = $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL => "DELETE FROM service WHERE id = $ServiceID",
        );
        $Self->True(
            $Success,
            "Service is deleted - ID $ServiceID",
        );

        # make sure the cache is correct
        for my $Cache (qw (Ticket Service)) {
            $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
                Type => $Cache,
            );
        }
    }
);

1;
