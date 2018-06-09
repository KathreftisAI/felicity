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

        # get needed objects
        my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

        # create test CAB user and test customer user and get there IDs
        my $TestUserCAB = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-manager' ],
        );
        my $TestUserCABID = $Kernel::OM->Get('Kernel::System::User')->UserLookup(
            UserLogin => $TestUserCAB,
        );
        my $TestCustomerCAB    = $Helper->TestCustomerUserCreate();
        my @TestCustomerCABIDs = $Kernel::OM->Get('Kernel::System::CustomerUser')->CustomerIDs(
            User => $TestCustomerCAB,
        );

        # get change state data
        my $ChangeDataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
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
            Justification => 'Selenium Test Justification',
            ChangeStateID => $ChangeDataRef->{ItemID},
            CABAgents     => [$TestUserCABID],
            CABCustomers  => [ $TestCustomerCABIDs[0] ],
            UserID        => 1,
        );
        $Self->True(
            $ChangeID,
            "$ChangeTitleRandom is created",
        );

        # get template object
        my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');

        # create change and CAB template
        my @TemplateIDs;
        my @TemplateNames;
        for my $Template (qw(ITSMChange CAB)) {

            # create simple template change and CAB
            my $TemplateNameRandom = 'Template ' . $Template . ' ' . $Helper->GetRandomID();
            my $Content            = $TemplateObject->TemplateSerialize(
                Name         => $TemplateNameRandom,
                TemplateType => $Template,
                ChangeID     => $ChangeID,
                Comment      => 'Selenium Test Comment',
                ValidID      => 1,
                UserID       => 1
            );

            # create test template from test change and CAB
            my $TemplateID = $TemplateObject->TemplateAdd(
                Name         => $TemplateNameRandom,
                TemplateType => $Template,
                ChangeID     => $ChangeID,
                Content      => $Content,
                Comment      => 'Selenium Test Comment',
                ValidID      => 1,
                UserID       => 1,
            );
            $Self->True(
                $TemplateID,
                "Change Template ID $TemplateID is created",
            );

            push @TemplateIDs,   $TemplateID;
            push @TemplateNames, $TemplateNameRandom;
        }

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
            $WorkOrderID,
            "$WorkOrderTitleRandom is created",
        );

        my $TemplateNameRandom = 'Template ITSMWorkOrder ' . $Helper->GetRandomID();
        my $Content            = $TemplateObject->TemplateSerialize(
            Name         => $TemplateNameRandom,
            TemplateType => 'ITSMWorkOrder',
            WorkOrderID  => $WorkOrderID,
            Comment      => 'Selenium Test Comment',
            ValidID      => 1,
            UserID       => 1
        );

        # create test template from test work order
        my $TemplateID = $TemplateObject->TemplateAdd(
            Name         => $TemplateNameRandom,
            TemplateType => 'ITSMWorkOrder',
            WorkOrderID  => $WorkOrderID,
            Content      => $Content,
            Comment      => 'Selenium Test Comment',
            ValidID      => 1,
            UserID       => 1,
        );
        $Self->True(
            $TemplateID,
            "Change Template ID $TemplateID is created",
        );

        push @TemplateIDs,   $TemplateID;
        push @TemplateNames, $TemplateNameRandom;

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

        my $Index = 0;
        for my $TemplateCheck (qw(ITSMChange CAB ITSMWorkOrder)) {

            # navigate to AgentITSMTemplateOverview order down with appropriate filter
            $Selenium->VerifiedGet(
                "${ScriptAlias}index.pl?Action=AgentITSMTemplateOverview;SortBy=TemplateID;OrderBy=Down;Filter=$TemplateCheck"
            );

            # check overview screen
            $Selenium->find_element( "table",             'css' );
            $Selenium->find_element( "table thead tr th", 'css' );
            $Selenium->find_element( "table tbody tr td", 'css' );

            # check for expected test template
            $Self->True(
                index( $Selenium->get_page_source(), $TemplateNames[$Index] ) > -1,
                "$TemplateNames[$Index] is found",
            );

            # check for edit template link
            my $TemplateEdit;
            if ( $TemplateCheck eq 'CAB' ) {
                $TemplateEdit = $Selenium->find_element(
                    "//a[contains(\@href, \'Action=AgentITSMTemplateEditCAB;TemplateID=$TemplateIDs[$Index]')]"
                );
            }
            else {
                $TemplateEdit = $Selenium->find_element( "#EditContentTemplateID$TemplateIDs[$Index]", 'css' );
            }
            $TemplateEdit->is_enabled();
            $TemplateEdit->is_displayed();

            # click to delete test template
            $Selenium->find_element( "#DeleteTemplateID$TemplateIDs[$Index]", 'css' )->click();

            # wait for confirm button to show up and confirm delete action
            $Selenium->WaitFor( JavaScript => "return \$('#DialogButton1').length;" );
            $Selenium->find_element( "#DialogButton1", 'css' )->VerifiedClick();

            $Index++;
        }

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

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );
    }
);

1;
