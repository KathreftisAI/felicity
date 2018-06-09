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
        my $TestUserLogin = $Helper->TestCustomerUserCreate(
            Groups => ['admin'],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Customer',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # go to customer preferences
        $Selenium->VerifiedGet("${ScriptAlias}customer.pl?Action=CustomerPreferences");

        # create test params
        my @Tests = (
            {
                Name  => 'Ticket Overview',
                ID    => 'UserRefreshTime',
                Value => '5',
            },
            {
                Name  => 'Number of displayed tickets',
                ID    => 'UserShowTickets',
                Value => '30',
            },
        );

        my $UpdateMessage = "Preferences updated successfully!";

        # update generic preferences
        for my $Test (@Tests) {

            $Selenium->execute_script(
                "\$('#$Test->{ID}').val('$Test->{Value}').trigger('redraw.InputField').trigger('change');"
            );
            $Selenium->find_element( "#$Test->{ID} option[value='$Test->{Value}']", 'css' )->VerifiedSubmit();

            $Self->True(
                index( $Selenium->get_page_source(), $UpdateMessage ) > -1,
                "Customer preference $Test->{Name} - updated"
            );
        }
    }
);

1;
