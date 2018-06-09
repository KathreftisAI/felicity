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

        # get catalog class IDs
        my @ConfigItemClassIDs;
        my @ConfigItemClassNames;
        for my $ConfigItemClass (qw(Computer Hardware Location Network Software)) {
            my $ConfigItemDataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
                Class => 'ITSM::ConfigItem::Class',
                Name  => $ConfigItemClass,
            );
            push @ConfigItemClassIDs,   $ConfigItemDataRef->{ItemID};
            push @ConfigItemClassNames, $ConfigItemDataRef->{Name};
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
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentITSMConfigItemAdd
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMConfigItemAdd");

        # check for ITSMConfigItem classes
        for my $ConfigItemClassName (@ConfigItemClassNames) {
            $Self->True(
                index( $Selenium->get_page_source(), $ConfigItemClassName ) > -1,
                "ConfigItem class $ConfigItemClassName - found",
            );
        }

        # check for links to 'Add' new item for each class
        for my $ConfigItemClassAdd (@ConfigItemClassIDs) {
            my $Success = $Selenium->find_element(
                "//a[contains(\@href, \'AgentITSMConfigItemEdit;ClassID=$ConfigItemClassAdd' )]"
            );
            $Self->True(
                $Success,
                "ConfigItem ID $ConfigItemClassAdd add link - found",
            );
        }
    }
);

1;
