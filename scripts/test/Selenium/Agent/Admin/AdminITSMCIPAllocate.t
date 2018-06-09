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
            Groups => ['admin'],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AdminITSMCIPAllocate screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminITSMCIPAllocate");

        # check for Criticality <-> Impact fields
        my @Priority = (qw(1verylow 2low 3normal 4high 5veryhigh));
        for my $Impact (@Priority) {
            for my $Criticality (@Priority) {
                my $Element = $Selenium->find_element( "#PriorityID$Impact-$Criticality", 'css' );
                $Element->is_enabled();
                $Element->is_displayed();
            }
        }
    }
);

1;
