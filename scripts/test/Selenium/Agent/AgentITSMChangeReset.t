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

        # get change reset menu module default config
        my %ChangeResetMenu = $Kernel::OM->Get('Kernel::System::SysConfig')->ConfigItemGet(
            Name    => 'ITSMChange::Frontend::MenuModule###110-ChangeReset',
            Default => 1,
        );

        # set change reset menu module to valid
        my %ChangeResetMenuUpdate = map { $_->{Key} => $_->{Content} }
            grep { defined $_->{Key} } @{ $ChangeResetMenu{Setting}->[1]->{Hash}->[1]->{Item} };

        $Helper->ConfigSettingChange(
            Key   => 'ITSMChange::Frontend::MenuModule###110-ChangeReset',
            Value => \%ChangeResetMenuUpdate,
            Valid => 1,
        );

        # get AgemtITSMChangeReset frontend module sysconfig
        my %ChangeResetFrontendUpdate = (
            'Description' => 'Reset a change and its workorders',
            'GroupRo'     => [
                'itsm-change-builder'
            ],
            'NavBarName' => 'ITSM Change',
            'Title'      => 'Reset',
        );

        # set AgemtITSMChangeReset frontend module on valid
        $Helper->ConfigSettingChange(
            Key   => 'Frontend::Module###AgentITSMChangeReset',
            Value => \%ChangeResetFrontendUpdate,
            Valid => 1,
        );

        # get general catalog object
        my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

        # get change state data
        my @ChangeStateIDs;
        for my $ChangeState (qw(requested approved)) {
            my $ChangeStateDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ChangeManagement::Change::State',
                Name  => $ChangeState,
            );
            push @ChangeStateIDs, $ChangeStateDataRef->{ItemID};
        }

        # get change object
        my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

        # create test change
        my $ChangeTitleRandom = 'ITSMChange Approved ' . $Helper->GetRandomID();
        my $ChangeID          = $ChangeObject->ChangeAdd(
            ChangeTitle   => $ChangeTitleRandom,
            Description   => "Test Description",
            Justification => "Test Justification",
            ChangeStateID => $ChangeStateIDs[1],
            UserID        => 1,
        );
        $Self->True(
            $ChangeID,
            "$ChangeTitleRandom is created",
        );

        # get work order state data
        my @WorkOrderStateIDs;
        for my $WorkOrderState (qw(created accepted)) {
            my $WorkOrderStateDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ChangeManagement::WorkOrder::State',
                Name  => $WorkOrderState,
            );
            push @WorkOrderStateIDs, $WorkOrderStateDataRef->{ItemID};
        }

        # get work order object
        my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

        # create test work order
        my $WorkOrderTitleRandom = 'Selenium Work Order ' . $Helper->GetRandomID();
        my $WorkOrderID          = $WorkOrderObject->WorkOrderAdd(
            ChangeID         => $ChangeID,
            WorkOrderTitle   => $WorkOrderTitleRandom,
            Instruction      => 'Selenium Test Work Order',
            WorkOrderStateID => $WorkOrderStateIDs[1],
            PlannedStartTime => '2027-10-12 00:00:01',
            PlannedEndTime   => '2027-10-15 15:00:00',
            PlannedEffort    => 10,
            UserID           => 1,
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

        # navigate to AgentITSMChangeZoom of created test change
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMChangeZoom;ChangeID=$ChangeID");

        # click on 'Reset'
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMChangeReset;ChangeID=$ChangeID')]")->click();

        # wait for confirm button to show up and confirm reset action
        $Selenium->WaitFor( JavaScript => "return \$('.Dialog button.Primary.CallForAction:visible').length;" );
        $Selenium->find_element( ".Dialog button.Primary.CallForAction", 'css' )->VerifiedClick();

        sleep(1);

        # # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("body").length' );

        # click on 'History' and switch window
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMChangeHistory;ChangeID=$ChangeID')]")->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $(".CancelClosePopup").length' );

        # verify that change state is reseted
        my $WorkOrderResetMessage
            = "(ID=$WorkOrderID) Workorder State: New: Created (ID=$WorkOrderStateIDs[0]) &lt;- Old: Accepted (ID=$WorkOrderStateIDs[1])";
        my $ChangeResetMessage
            = "Change State: New: Requested (ID=$ChangeStateIDs[0]) &lt;- Old: Approved (ID=$ChangeStateIDs[1])";
        $Self->True(
            index( $Selenium->get_page_source(), $WorkOrderResetMessage ) > -1,
            "$WorkOrderResetMessage is found",
        );
        $Self->True(
            index( $Selenium->get_page_source(), $ChangeResetMessage ) > -1,
            "$ChangeResetMessage is found",
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
