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
            Name  => 'requested',
        );

        # get change object
        my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

        # create test change
        my $ChangeTitleRandom = 'ITSMChange Requested ' . $Helper->GetRandomID();
        my $ChangeID          = $ChangeObject->ChangeAdd(
            ChangeTitle   => $ChangeTitleRandom,
            Description   => "Test Description",
            Justification => "Test Justification",
            ChangeStateID => $ChangeStateDataRef->{ItemID},
            UserID        => 1,
        );
        $Self->True(
            $ChangeID,
            "$ChangeTitleRandom is created",
        );

        # get work order object
        my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

        # create test work order
        my $WorkOrderTitleRandom = 'Selenium Work Order ' . $Helper->GetRandomID();
        my $WorkOrderInstruction = 'Selenium Test Work Order';
        my $WorkOrderID          = $WorkOrderObject->WorkOrderAdd(
            ChangeID       => $ChangeID,
            WorkOrderTitle => $WorkOrderTitleRandom,
            Instruction    => $WorkOrderInstruction,
            PlannedEffort  => 10,
            UserID         => 1,
        );
        $Self->True(
            $ChangeID,
            "$WorkOrderTitleRandom is created",
        );

        # create and log in test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-manager' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentITSMWorkOrderZoom for test created work order
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMWorkOrderZoom;WorkOrderID=$WorkOrderID");

        # click on 'History' and switch window
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMWorkOrderHistory;WorkOrderID=$WorkOrderID')]")
            ->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $(".CancelClosePopup").length' );

        # check screen
        $Selenium->find_element( "table",             'css' );
        $Selenium->find_element( "table thead tr th", 'css' );
        $Selenium->find_element( "table tbody tr td", 'css' );

        # check for history values upon test change creation
        $Self->True(
            index( $Selenium->get_page_source(), "New Workorder (ID=$WorkOrderID)" ) > -1,
            "New Workorder (ID=$WorkOrderID) is found",
        );
        $Self->True(
            index( $Selenium->get_page_source(), "Instruction: New: $WorkOrderInstruction &lt;- Old: -" ) > -1,
            "Instruction: New: $WorkOrderInstruction &lt;- Old: is found",
        );
        $Self->True(
            index( $Selenium->get_page_source(), "Planned Effort: New: 10 &lt;- Old: 0.00" ) > -1,
            "Planned Effort: New: 10 &lt;- Old: 0.00 is found",
        );

        # cut off the workorder title after 30 characters and add [...]
        my $WorkOrderTitleTruncated = substr( $WorkOrderTitleRandom, 0, 30 ) . '[...]';

        $Self->True(
            index( $Selenium->get_page_source(), "Workorder Title: New: $WorkOrderTitleTruncated &lt;- Old: -" ) > -1,
            "Workorder Title: New: $WorkOrderTitleTruncated &lt;- Old: is found",
        );

        # delete test created work order
        my $Success = $WorkOrderObject->WorkOrderDelete(
            WorkOrderID => $WorkOrderID,
            UserID      => 1,
        );
        $Self->True(
            $Success,
            "$WorkOrderTitleRandom is deleted",
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

        # make sure cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );
    }
);

1;
