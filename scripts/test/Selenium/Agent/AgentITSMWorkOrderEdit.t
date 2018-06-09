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

        # click on 'Edit' and switch window
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMWorkOrderEdit;WorkOrderID=$WorkOrderID')]")
            ->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#WorkOrderTitle").length' );

        # check stored values
        $Self->Is(
            $Selenium->find_element( '#WorkOrderTitle', 'css' )->get_value(),
            $WorkOrderTitleRandom,
            "#WorkOrderTitle stored value",
        );
        $Self->Is(
            $Selenium->find_element( '#RichText', 'css' )->get_value(),
            $WorkOrderInstruction,
            "#Instruction stored value",
        );
        $Self->Is(
            $Selenium->find_element( '#PlannedEffort', 'css' )->get_value(),
            '10.00',
            "#PlannedEffort stored value",
        );

        # edit work order and submit
        $Selenium->find_element( "#WorkOrderTitle",      'css' )->send_keys(" Edit");
        $Selenium->find_element( "#RichText",            'css' )->send_keys(" Edit");
        $Selenium->find_element( "#PlannedEffort",       'css' )->clear();
        $Selenium->find_element( "#PlannedEffort",       'css' )->send_keys("11.00");
        $Selenium->find_element( "#SubmitWorkOrderEdit", 'css' )->click();

        # switch back window
        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        sleep(1);

        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("body").length' );

        # click on 'Edit' and switch window
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMWorkOrderEdit;WorkOrderID=$WorkOrderID')]")
            ->click();

        $Selenium->WaitFor( WindowCount => 2 );
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#WorkOrderTitle").length' );

        sleep 1;

        # check edited values
        $Self->Is(
            $Selenium->find_element( '#WorkOrderTitle', 'css' )->get_value(),
            $WorkOrderTitleRandom . ' Edit',
            "#WorkOrderTitle edited value",
        );
        $Self->Is(
            $Selenium->find_element( '#RichText', 'css' )->get_value(),
            $WorkOrderInstruction . ' Edit',
            "#Instruction edited value",
        );
        $Self->Is(
            $Selenium->find_element( '#PlannedEffort', 'css' )->get_value(),
            '11.00',
            "#PlannedEffort edited value",
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
