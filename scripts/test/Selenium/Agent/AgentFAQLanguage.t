# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

## no critic (Modules::RequireExplicitPackage)
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

        # get FAQ object
        my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users', 'faq', 'faq_admin' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentFAQLanguage screen of created test FAQ
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentFAQLanguage");

        # check add button
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentFAQLanguage;Subaction=Add' )]");

        # check AgentFAQLanguage screen
        $Selenium->find_element( "table",             'css' );
        $Selenium->find_element( "table thead tr th", 'css' );
        $Selenium->find_element( "table tbody tr td", 'css' );

        # check English language - 'en'
        $Selenium->find_element( 'en', 'link_text' );

        # check German Language - 'de'
        $Selenium->find_element( 'de', 'link_text' );

        # add test language - Spanish (es)
        my $FAQLanguage = 'es';

        # check if there is 'es - Language' has been added before
        my $Exists = $FAQObject->LanguageDuplicateCheck(
            Name   => $FAQLanguage,
            UserID => 1,
        );

        $Selenium->find_element("//a[contains(\@href, \'Action=AgentFAQLanguage;Subaction=Add' )]")->VerifiedClick();

        if ($Exists) {
            $Selenium->find_element( "#Name", 'css' )->send_keys($FAQLanguage);

            # close Error dialog block
            my $CheckConfirmJS = <<"JAVASCRIPT";
(function () {
    var lastConfirm = undefined;
    window.confirm = function (message) {
        return true;
    };
}());
JAVASCRIPT
            $Selenium->execute_script($CheckConfirmJS);

            $Selenium->find_element( "#Name", 'css' )->VerifiedSubmit();
            $Self->Is(
                $Selenium->execute_script(
                    "return \$('#Name').hasClass('ServerError')"
                ),
                '1',
                'This language already exists!',
            );

            # go back on Language overview screen
            $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentFAQLanguage");

        }
        else {
            $Selenium->find_element( "#Name", 'css' )->send_keys($FAQLanguage);
            $Selenium->find_element( "#Name", 'css' )->VerifiedSubmit();
        }

        $Selenium->WaitFor( JavaScript => 'return $(".DataTable").length' );

        # get ID for test language
        my $LanguageID = $FAQObject->LanguageLookup(
            Name => $FAQLanguage,
        );

        # verify test FAQ has been created
        $Self->True(
            index( $Selenium->get_page_source(), "AgentFAQLanguage;Subaction=Change;LanguageID=$LanguageID" ) > -1,
            "Test language is created - $FAQLanguage",
        );

        # check added 'test' language
        $Selenium->find_element( "$FAQLanguage", 'link_text' )->VerifiedClick();

        $Self->Is(
            $Selenium->find_element( '#Name', 'css' )->get_value(),
            $FAQLanguage,
            "Stored language name $FAQLanguage - found",
        );

        # go back on Language overview screen
        $Selenium->find_element( 'Cancel', 'link_text' )->VerifiedClick();

        # if case test language was created in the test, delete it
        if ( !$Exists ) {

            # delete 'test' language
            $Selenium->find_element( "#DeleteLanguageID$LanguageID", 'css' )->VerifiedClick();

            $Selenium->WaitFor( JavaScript => 'return $("#DialogButton1").length' );

            # verify delete message
            $Self->True(
                index( $Selenium->get_page_source(), 'Do you really want to delete this language?' ) > -1,
                "Delete message - found",
            );

            # execute delete
            $Selenium->find_element( "#DialogButton1", 'css' )->VerifiedClick();

            # verify test FAQ has been deleted
            $Self->True(
                index( $Selenium->get_page_source(), "AgentFAQLanguage;Subaction=Change;LanguageID=$LanguageID" ) == -1,
                "Test language is deleted - $FAQLanguage",
            );
        }

    }

);

1;
