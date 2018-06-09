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

        # get work order empty agent default config
        my %WorkOrderEmptyAgent = $Kernel::OM->Get('Kernel::System::SysConfig')->ConfigItemGet(
            Name    => 'ITSMWorkOrder::TakePermission###10-EmptyAgent',
            Default => 1,
        );

        # set work order empty agent to valid
        my %WorkOrderEmptyAgentUpdate = map { $_->{Key} => $_->{Content} }
            grep { defined $_->{Key} } @{ $WorkOrderEmptyAgent{Setting}->[1]->{Hash}->[1]->{Item} };

        $Helper->ConfigSettingChange(
            Key   => 'ITSMWorkOrder::TakePermission###10-EmptyAgent',
            Value => \%WorkOrderEmptyAgentUpdate,
            Valid => 1,
        );

        # get work order list agent default sysconfig
        my %WorkOrderListAgent = $Kernel::OM->Get('Kernel::System::SysConfig')->ConfigItemGet(
            Name    => 'ITSMWorkOrder::TakePermission###20-ListAgent',
            Default => 1,
        );

        # set work order list agent to valid
        my %WorkOrderListAgentUpdate = map { $_->{Key} => $_->{Content} }
            grep { defined $_->{Key} } @{ $WorkOrderListAgent{Setting}->[1]->{Hash}->[1]->{Item} };

        $Helper->ConfigSettingChange(
            Key   => 'ITSMWorkOrder::TakePermission###20-ListAgent',
            Value => \%WorkOrderListAgentUpdate,
            Valid => 1,
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
            Description   => 'Selenium Test Description',
            Justification => 'Seleniun Test Justification',
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
        my $WorkOrderID          = $WorkOrderObject->WorkOrderAdd(
            ChangeID       => $ChangeID,
            WorkOrderTitle => $WorkOrderTitleRandom,
            Instruction    => 'Selenium Test Work Order',
            PlannedEffort  => 10,
            UserID         => 1,
        );
        $Self->True(
            $ChangeID,
            "$WorkOrderTitleRandom is created",
        );

        # create and log in test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-builder', 'itsm-change-manager' ]
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

        # click on 'Take Workorder'
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMWorkOrderTake;WorkOrderID=$WorkOrderID')]")
            ->click();

        # wait for confirm button to show up and confirm delete action
        $Selenium->WaitFor( JavaScript => "return \$('#DialogButton1').length;" );
        $Selenium->find_element( "#DialogButton1", 'css' )->VerifiedClick();

        # click on 'History' and switch window
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMWorkOrderHistory;WorkOrderID=$WorkOrderID' )]")
            ->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $(".CancelClosePopup").length' );

        # check for take work order history message
        my $ExpectedTakeWorkOrderMessage = "Workorder Agent: New: $TestUserLogin";

        $Self->True(
            index( $Selenium->get_page_source(), $ExpectedTakeWorkOrderMessage ) > -1,
            "$ExpectedTakeWorkOrderMessage is found",
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
