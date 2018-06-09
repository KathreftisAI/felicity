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

        # navigate to AdminITSMConfigItem
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminITSMConfigItem");

        # test default ITSMConfigItem class
        for my $Item (qw( Computer Hardware Location Network Software )) {
            my $Element = $Selenium->find_element( $Item, 'link_text' );
            $Element->is_enabled();
            $Element->is_displayed();
            $Element->VerifiedClick();

            # check for table structure
            $Selenium->find_element( "table",             'css' );
            $Selenium->find_element( "table thead tr th", 'css' );
            $Selenium->find_element( "table tbody tr td", 'css' );

            # click on 'Change class definition'
            $Selenium->find_element("//button[\@value='Add'][\@type='submit']")->VerifiedClick();

            # check for input area
            my $InputField = $Selenium->find_element( "#Definition", 'css' );
            $InputField->is_enabled();
            $InputField->is_displayed();

            # return back to overview screen
            $Selenium->find_element("//a[contains(\@href, \'Action=AdminITSMConfigItem' )]")->VerifiedClick();
        }
    }
);

1;
