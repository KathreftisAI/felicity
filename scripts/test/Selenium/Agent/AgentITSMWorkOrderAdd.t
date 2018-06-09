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
            Key   => 'Frontend::RichText',
            Value => 0,
        );

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

        # navigate to AgentITSMChangeZoom for test created change
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMChangeZoom;ChangeID=$ChangeID");

        # click 'Add WorkOrder' and switch window
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMWorkOrderAdd;ChangeID=$ChangeID')]")->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#WorkOrderTitle").length' );

        # check page
        for my $ID (
            qw(WorkOrderTitle RichText WorkOrderTypeID PlannedStartTimeMonth PlannedStartTimeDay PlannedStartTimeYear PlannedStartTimeHour PlannedStartTimeMinute
            PlannedEndTimeMonth PlannedEndTimeDay PlannedEndTimeYear PlannedEndTimeHour PlannedEndTimeMinute PlannedEffort FileUpload SubmitWorkOrderAdd)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # create test work order
        my $WorkOrderTitleRandom = 'Work Order ' . $Helper->GetRandomID();
        $Selenium->find_element( "#WorkOrderTitle",     'css' )->send_keys($WorkOrderTitleRandom);
        $Selenium->find_element( "#RichText",           'css' )->send_keys('Selenium WorkOrder Instructions');
        $Selenium->find_element( "#SubmitWorkOrderAdd", 'css' )->click();

        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        sleep(1);

        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("body").length' );

        # check created test work order values
        $Self->True(
            index( $Selenium->get_page_source(), $WorkOrderTitleRandom ) > -1,
            "$WorkOrderTitleRandom is found",
        );
        $Self->True(
            index( $Selenium->get_page_source(), $ChangeTitleRandom ) > -1,
            "$ChangeTitleRandom is found",
        );

        # get DB object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # get test work order ID
        my $WorkOrderQuoted = $DBObject->Quote($WorkOrderTitleRandom);
        $DBObject->Prepare(
            SQL  => "SELECT id FROM change_workorder WHERE title = ?",
            Bind => [ \$WorkOrderQuoted ]
        );
        my $WorkOrderID;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $WorkOrderID = $Row[0];
        }

        # delete test created work order
        my $Success = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderDelete(
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
