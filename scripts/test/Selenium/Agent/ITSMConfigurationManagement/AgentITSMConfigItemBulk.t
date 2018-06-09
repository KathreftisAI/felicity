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
        my $Helper               = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

        # get 'Computer' catalog class IDs
        my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::Class',
            Name  => 'Computer',
        );
        my $ComputerConfigItemID = $ConfigItemDataRef->{ItemID};

        # get 'Production' and 'Repair' deployment state IDs
        my @DeplStateIDs;
        for my $DeplState (qw (Production Repair)) {
            my $DeplStateDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ConfigItem::DeploymentState',
                Name  => $DeplState,
            );
            push @DeplStateIDs, $DeplStateDataRef->{ItemID}
        }

        # get needed objects
        my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
        my $ConfigObject     = $Kernel::OM->Get('Kernel::Config');

        # create three test ConfigItems for 'Computer' ConfigItem class
        my @ConfigItemNumbers;
        my @ConfigItemIDs;
        for my $ITSMConfigItem ( 1 .. 3 ) {

            # create ConfigItem number
            my $ConfigItemNumber = $ConfigItemObject->ConfigItemNumberCreate(
                Type    => $ConfigObject->Get('ITSMConfigItem::NumberGenerator'),
                ClassID => $ComputerConfigItemID,
            );
            $Self->True(
                $ConfigItemNumber,
                "ConfigItem number is created - $ConfigItemNumber",
            );
            push @ConfigItemNumbers, $ConfigItemNumber;

            # add the new ConfigItem
            my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
                Number  => $ConfigItemNumber,
                ClassID => $ComputerConfigItemID,
                UserID  => 1,
            );
            $Self->True(
                $ConfigItemID,
                "ConfigItem is created - ID $ConfigItemID"
            );

            # add a new version
            my $VersionID = $ConfigItemObject->VersionAdd(
                Name         => 'SeleniumTest',
                DefinitionID => 1,
                DeplStateID  => $DeplStateIDs[0],
                InciStateID  => 1,
                UserID       => 1,
                ConfigItemID => $ConfigItemID,
            );
            $Self->True(
                $VersionID,
                "Version is created - ID $VersionID"
            );
            push @ConfigItemIDs, $ConfigItemID;
        }

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-configitem' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

        # navigate to AgentITSMConfigItem, sorted by created time
        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AgentITSMConfigItem;Filter=All;View=;;SortBy=ChangeTime;OrderBy=Down"
        );

        # select two created test ConfigItems
        for my $SelectConfigItem (@ConfigItemIDs) {

            # don't click on third test ConfigItem
            if ( $SelectConfigItem ne $ConfigItemIDs[2] ) {
                $Selenium->find_element("//input[\@value='$SelectConfigItem']")->click();
            }
        }

        # click on bulk action
        $Selenium->find_element("//*[text()='Bulk']")->click();

        # switch to 'Bulk' window
        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#DeplStateID").length' );

        # check screen
        for my $ID (
            qw(DeplStateID InciStateID LinkTogether LinkTogetherLinkType LinkTogetherAnother LinkType submitRichText)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # change deployment state to 'Repair' for test ConfigItems
        $Selenium->find_element( "#DeplStateID option[value='$DeplStateIDs[1]']", 'css' )->click();

        # link 'Alternative to' test ConfigItems together
        $Selenium->find_element( "#LinkTogether option[value='1']",                           'css' )->click();
        $Selenium->find_element( "#LinkTogetherLinkType option[value='ConnectedTo::Source']", 'css' )->click();

        # link third test ConfigItem as part of first two
        $Selenium->find_element( "#LinkTogetherAnother", 'css' )->send_keys( $ConfigItemNumbers[2] );
        $Selenium->find_element( "#LinkType option[value='Includes::Target']", 'css' )->click();

        # submit bulk changes
        $Selenium->find_element( "#submitRichText", 'css' )->click();

        # switch window
        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        # Wait for reload to kick in.
        sleep 1;
        $Selenium->WaitFor(
            JavaScript =>
                'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete'
        );

        # click on first created test ConfigItems to enter zoom view
        $Selenium->find_element( "#ConfigItemID_$ConfigItemIDs[1]", 'css' )->VerifiedClick();

        sleep 1;

        # check for other two created test ConfigItems
        # verify that link action in bulk screen was success
        for my $CheckConfigItem (@ConfigItemNumbers) {
            $Self->True(
                index( $Selenium->get_page_source(), $CheckConfigItem ) > -1,
                "Test ConfigItem number $CheckConfigItem - found",
            );
        }

        # click on history and change window
        $Selenium->find_element( "#Menu200-History", 'css' )->click();
        $Selenium->WaitFor( WindowCount => 2 );
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $(".CancelClosePopup").length' );

        # check state deployment change of test ConfigItem
        my $CheckHistory = 'Deployment state updated (new=Repair; old=Production)';
        $Self->True(
            index( $Selenium->get_page_source(), $CheckHistory ) > -1,
            "$CheckHistory - found",
        );

        # delete created test ConfigItems
        for my $ConfigItemDelete (@ConfigItemIDs) {
            my $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemDelete,
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "Config item is deleted - ID $ConfigItemDelete",
            );
        }
    }
);

1;
