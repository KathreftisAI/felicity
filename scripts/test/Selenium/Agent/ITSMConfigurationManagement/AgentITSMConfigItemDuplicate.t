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

        # get 'Hardware' catalog class IDs
        my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::Class',
            Name  => 'Hardware',
        );
        my $HardwareConfigItemID = $ConfigItemDataRef->{ItemID};

        # get 'Production' deployment state IDs
        my $ProductionDeplStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::DeploymentState',
            Name  => 'Production',
        );
        my $ProductionDeplStateID = $ProductionDeplStateDataRef->{ItemID};

        # get needed objects
        my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
        my $ConfigObject     = $Kernel::OM->Get('Kernel::Config');

        # create ConfigItem number
        my $ConfigItemNumber = $ConfigItemObject->ConfigItemNumberCreate(
            Type    => $ConfigObject->Get('ITSMConfigItem::NumberGenerator'),
            ClassID => $HardwareConfigItemID,
        );
        $Self->True(
            $ConfigItemNumber,
            "ConfigItem number is created - $ConfigItemNumber"
        );

        # add the new ConfigItem
        my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
            Number  => $ConfigItemNumber,
            ClassID => $HardwareConfigItemID,
            UserID  => 1,
        );
        $Self->True(
            $ConfigItemID,
            "ConfigItem is created - ID $ConfigItemID"
        );

        # add a new version
        my $ConfigItemName = 'Hardware' . $Helper->GetRandomID();
        my $VersionID      = $ConfigItemObject->VersionAdd(
            Name         => $ConfigItemName,
            DefinitionID => 1,
            DeplStateID  => $ProductionDeplStateID,
            InciStateID  => 1,
            UserID       => 1,
            ConfigItemID => $ConfigItemID,
        );
        $Self->True(
            $VersionID,
            "Version is created - ID $VersionID"
        );

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

        # navigate to AgentITSMConfigItemZoom screen
        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AgentITSMConfigItemZoom;ConfigItemID=$ConfigItemID;Version=$VersionID"
        );

        # get ConfigItem value params
        my @ConfigItemValues = (
            {
                Value => 'Hardware',
                Check => 'p.Value:contains(Hardware)',
            },
            {
                Value => $ConfigItemName,
                Check => "h1:contains($ConfigItemName)",
            },
        );

        # check ConfigItem values on screen
        for my $CheckConfigItemValue (@ConfigItemValues) {
            $Self->True(
                $Selenium->execute_script(
                    "return \$('$CheckConfigItemValue->{Check}').length"
                ),
                "Test ConfigItem value $CheckConfigItemValue->{Value} - found",
            );
        }

        # click on 'Duplicate' menu item and switch window
        $Selenium->find_element(
            "//a[contains(\@href, \'Action=AgentITSMConfigItemEdit;DuplicateID=$ConfigItemID;VersionID=$VersionID\' )]"
        )->click();

        # switch window
        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#DeplStateID").length' );

        # check for created ConfigItem values
        $Self->Is(
            $Selenium->find_element( '#Name', 'css' )->get_value(),
            $ConfigItemName,
            "#Name stored value",
        );
        $Self->Is(
            $Selenium->find_element( '#DeplStateID', 'css' )->get_value(),
            $ProductionDeplStateID,
            "#DeplStateID stored value",
        );
        $Self->Is(
            $Selenium->find_element( '#InciStateID', 'css' )->get_value(),
            1,
            "#InciStateID stored value",
        );

        # edit name for duplicate test ConfigItem
        my $DuplicateConfigItemName = "Duplicate" . $ConfigItemName;
        $Selenium->find_element( "#Name", 'css' )->clear();
        $Selenium->find_element( "#Name", 'css' )->send_keys($DuplicateConfigItemName);
        $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->click();

        # switch back to zoom view
        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("body").length' );

        # refresh screen
        $Selenium->VerifiedRefresh();

        # check for duplicated ConfigItem value
        $Self->True(
            $Selenium->execute_script(
                "return \$('h1:contains($DuplicateConfigItemName)').length"
            ),
            "Test ConfigItem value $DuplicateConfigItemName - found",
        );

        # delete created test ConfigItems
        for my $DeleteConfigItem ( 1 .. 2 ) {
            my $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemID,
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "ConfigItem is deleted - ID $ConfigItemID",
            );
            $ConfigItemID++;
        }
    }
);

1;
