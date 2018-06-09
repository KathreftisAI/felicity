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

use Kernel::Language;

# get selenium object
my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

$Selenium->RunTest(
    sub {

        # get helper object
        my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

        # create test customer user and login
        my $TestCustomerUserLogin = $Helper->TestCustomerUserCreate(
        ) || die "Did not get test customer user";

        $Selenium->Login(
            Type     => 'Customer',
            User     => $TestCustomerUserLogin,
            Password => $TestCustomerUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to CustomerPreference screen
        $Selenium->VerifiedGet("${ScriptAlias}customer.pl?Action=CustomerPreferences");

        # check CustomerPreferences screen
        for my $ID (
            qw(UserLanguage UserShowTickets UserRefreshTime CurPw NewPw NewPw1)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # check CustomerPreferences default values
        $Self->Is(
            $Selenium->find_element( '#UserLanguage', 'css' )->get_value(),
            "en",
            "#UserLanguage stored value",
        );
        $Self->Is(
            $Selenium->find_element( '#UserRefreshTime', 'css' )->get_value(),
            "0",
            "#UserRefreshTime stored value",
        );
        $Self->Is(
            $Selenium->find_element( '#UserShowTickets', 'css' )->get_value(),
            "25",
            "#UserShowTickets stored value",
        );

        # edit checked stored values
        $Selenium->execute_script("\$('#UserRefreshTime').val('2').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element( "#UserRefreshTime", 'css' )->VerifiedSubmit();

        $Selenium->execute_script("\$('#UserShowTickets').val('20').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element( "#UserShowTickets", 'css' )->VerifiedSubmit();

        # check edited values
        $Self->Is(
            $Selenium->find_element( '#UserRefreshTime', 'css' )->get_value(),
            "2",
            "#UserRefreshTime updated value",
        );
        $Self->Is(
            $Selenium->find_element( '#UserShowTickets', 'css' )->get_value(),
            "20",
            "#UserShowTickets updated value",
        );

        # test different language scenarios
        for my $Language (
            qw(de es ru zh_CN sr_Cyrl en)
            )
        {
            # change CustomerPreference language
            $Selenium->execute_script(
                "\$('#UserLanguage').val('$Language').trigger('redraw.InputField').trigger('change');"
            );
            $Selenium->find_element( "#UserLanguage option[value='$Language']", 'css' )->VerifiedSubmit();

            # check edited language value
            $Self->Is(
                $Selenium->find_element( '#UserLanguage', 'css' )->get_value(),
                "$Language",
                "#UserLanguage updated value",
            );

            # create language object
            my $LanguageObject = Kernel::Language->new(
                UserLanguage => "$Language",
            );

            # check for correct translation
            $Self->True(
                index( $Selenium->get_page_source(), $LanguageObject->Translate('Interface language') ) > -1,
                "Test widget 'Interface language' found on screen"
            );
            $Self->True(
                index( $Selenium->get_page_source(), $LanguageObject->Translate('Number of displayed tickets') ) > -1,
                "Test widget 'Number of displayed tickets' found on screen"
            );
            $Self->True(
                index( $Selenium->get_page_source(), $LanguageObject->Translate('Ticket overview') ) > -1,
                "Test widget 'Ticket overview' found on screen"
            );
        }
    }

);

1;
