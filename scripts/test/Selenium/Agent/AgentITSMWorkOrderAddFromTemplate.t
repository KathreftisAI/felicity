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
        my $ChangeDataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
            Class => 'ITSM::ChangeManagement::Change::State',
            Name  => 'requested',
        );

        # get change object
        my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

        # create two test changes
        my @ChangeIDs;
        for my $ChangeCreate ( 1 .. 2 ) {
            my $ChangeTitleRandom = 'ITSMChange ' . $Helper->GetRandomID();
            my $ChangeID          = $ChangeObject->ChangeAdd(
                ChangeTitle   => $ChangeTitleRandom,
                Description   => 'Selenium Test Description',
                Justification => 'Selenium Test Justification',
                ChangeStateID => $ChangeDataRef->{ItemID},
                UserID        => 1,
            );
            $Self->True(
                $ChangeID,
                "$ChangeTitleRandom is created",
            );
            push @ChangeIDs, $ChangeID;
        }

        # get work order object
        my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

        # create test work order
        my $WorkOrderTitleRandom = 'Selenium Work Order ' . $Helper->GetRandomID();
        my $WorkOrderID          = $WorkOrderObject->WorkOrderAdd(
            ChangeID         => $ChangeIDs[0],
            WorkOrderTitle   => $WorkOrderTitleRandom,
            Instruction      => 'Selenium Test Work Order',
            PlannedStartTime => '2027-10-12 00:00:01',
            PlannedEndTime   => '2027-10-15 15:00:00',
            PlannedEffort    => 10,
            UserID           => 1,
        );
        $Self->True(
            $WorkOrderID,
            "$WorkOrderTitleRandom ID $WorkOrderID is created",
        );

        # get template object
        my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');

        # create simple change template
        my $TemplateNameRandom = 'Template ' . $Helper->GetRandomID();
        my $WorkOrderContent   = $TemplateObject->TemplateSerialize(
            Name         => $TemplateNameRandom,
            TemplateType => 'ITSMWorkOrder',
            WorkOrderID  => $WorkOrderID,
            ValidID      => 1,
            UserID       => 1,
        );

        # create test template from test work order
        my $TemplateID = $TemplateObject->TemplateAdd(
            Name         => $TemplateNameRandom,
            TemplateType => 'ITSMWorkOrder',
            WorkOrderID  => $WorkOrderID,
            Content      => $WorkOrderContent,
            ValidID      => 1,
            UserID       => 1,
        );
        $Self->True(
            $TemplateID,
            "Work Order Template ID $TemplateID is created",
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

        # navigate to AgentITSMChangeZoom for second test created change
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMChangeZoom;ChangeID=$ChangeIDs[1]");

        # click on 'Add Workorder (from template)' and switch window
        $Selenium->find_element(
            "//a[contains(\@href, \'Action=AgentITSMWorkOrderAddFromTemplate;ChangeID=$ChangeIDs[1]')]"
        )->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#TemplateID").length' );

        # check page
        for my $ID (
            qw(TemplateID MoveTimeType MoveTimeMonth MoveTimeDay MoveTimeYear MoveTimeHour MoveTimeMinute SubmitTemplate)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # select test created work order template and submit
        $Selenium->execute_script(
            "\$('#TemplateID').val('$TemplateID').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element( "#SubmitTemplate", 'css' )->click();

        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        sleep(1);

        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("body").length' );

        # check work order values created from test template
        $Self->True(
            index( $Selenium->get_page_source(), $WorkOrderTitleRandom ) > -1,
            "$WorkOrderTitleRandom is found",
        );

        # delete test created work orders
        my $Success;
        for my $WorkOrderDelete ( $WorkOrderID, $WorkOrderID++ ) {
            $Success = $WorkOrderObject->WorkOrderDelete(
                WorkOrderID => $WorkOrderDelete,
                UserID      => 1,
            );
            $Self->True(
                $Success,
                "Work Order ID $WorkOrderDelete is deleted",
            );
        }

        # delete test created change
        for my $ChangeDelete (@ChangeIDs) {
            $Success = $ChangeObject->ChangeDelete(
                ChangeID => $ChangeDelete,
                UserID   => 1,
            );
            $Self->True(
                $Success,
                "Change ID $ChangeDelete is deleted",
            );
        }

        # delete test created template
        $Success = $TemplateObject->TemplateDelete(
            TemplateID => $TemplateID,
            UserID     => 1,
        );
        $Self->True(
            $Success,
            "Template ID $TemplateID is deleted",
        );

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );
    }
);

1;
