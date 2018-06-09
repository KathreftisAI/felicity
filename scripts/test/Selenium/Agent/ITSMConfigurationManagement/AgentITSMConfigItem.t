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

        # get catalog class IDs
        my @ConfigItemClassIDs;
        for my $ConfigItemClass (qw(Computer Hardware Location Network Software)) {
            my $ConfigItemDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ConfigItem::Class',
                Name  => $ConfigItemClass,
            );
            push @ConfigItemClassIDs, $ConfigItemDataRef->{ItemID};
        }

        # get 'Production' deployment state ID
        my $DeplStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ConfigItem::DeploymentState',
            Name  => 'Production',
        );
        my $DeplStateID = $DeplStateDataRef->{ItemID};

        # get needed objects
        my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
        my $ConfigObject     = $Kernel::OM->Get('Kernel::Config');

        # create ConfigItem for each ConfigItem class
        my @ConfigItemNumbers;
        my @ConfigItemIDs;
        for my $ITSMConfigItem (@ConfigItemClassIDs) {

            # create ConfigItem number
            my $ConfigItemNumber = $ConfigItemObject->ConfigItemNumberCreate(
                Type    => $ConfigObject->Get('ITSMConfigItem::NumberGenerator'),
                ClassID => $ITSMConfigItem,
            );
            $Self->True(
                $ConfigItemNumber,
                "ConfigItem number is created - $ConfigItemNumber"
            );
            push @ConfigItemNumbers, $ConfigItemNumber;

            # add the new ConfigItem
            my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
                Number  => $ConfigItemNumber,
                ClassID => $ITSMConfigItem,
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
                DeplStateID  => $DeplStateID,
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

        # check for created test ConfigItems with 'All' filter active
        for my $AllConfigItem (@ConfigItemNumbers) {
            $Self->True(
                index( $Selenium->get_page_source(), $AllConfigItem ) > -1,
                "Test ConfigItem number $AllConfigItem - found",
            );
        }

        # check each of ConfigItem class filters for there respective test ConfigItem
        my $Count = 0;
        for my $CheckConfigItem (@ConfigItemIDs) {

            # click on ConfigItem class
            $Selenium->find_element(
                "//a[contains(\@href, \'Action=AgentITSMConfigItem;SortBy=ChangeTime;OrderBy=Down;View=;Filter=$ConfigItemClassIDs[$Count]' )]"
            )->VerifiedClick();

            # check for table structure
            $Selenium->find_element( "table",             'css' );
            $Selenium->find_element( "table thead tr th", 'css' );
            $Selenium->find_element( "table tbody tr td", 'css' );

            # check for ConfigItem number
            $Self->True(
                index( $Selenium->get_page_source(), $ConfigItemNumbers[$Count] ) > -1,
                "Test ConfigItem number $ConfigItemNumbers[$Count] - found",
            );
            $Count++;
        }

        # delete created test ConfigItems
        for my $ConfigItemDelete (@ConfigItemIDs) {
            my $Success = $ConfigItemObject->ConfigItemDelete(
                ConfigItemID => $ConfigItemDelete,
                UserID       => 1,
            );
            $Self->True(
                $Success,
                "ConfigItem is deleted - ID $ConfigItemDelete",
            );
        }
    }
);

1;
