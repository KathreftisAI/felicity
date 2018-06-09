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

        # create and log in test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # navigate to AdminITSMChangeCIPAllocate screen
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminITSMChangeCIPAllocate");

        # get general catalog object
        my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

        # get Category and Impact IDs
        my @Value = ( '1 very low', '2 low', '3 normal', '4 high', '5 very high' );
        my @ImpactIDs;
        my @CategoryIDs;
        for my $CategoryName (@Value) {
            my $CategoryDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ChangeManagement::Category',
                Name  => $CategoryName,
            );
            push @CategoryIDs, $CategoryDataRef->{ItemID};
        }
        for my $ImpactName (@Value) {
            my $ImpactDataRef = $GeneralCatalogObject->ItemGet(
                Class => 'ITSM::ChangeManagement::Impact',
                Name  => $ImpactName,
            );
            push @ImpactIDs, $ImpactDataRef->{ItemID};
        }

        # check for Category <-> Impact fields
        for my $Impact (@ImpactIDs) {
            for my $Category (@CategoryIDs) {
                my $Element = $Selenium->find_element( "#PriorityID$Impact-$Category", 'css' );
                $Element->is_enabled();
                $Element->is_displayed();
            }
        }
    }
);

1;
