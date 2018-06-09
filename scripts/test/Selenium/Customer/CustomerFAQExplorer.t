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

        my @FAQIDs;

        # create test FAQs
        for ( 1 .. 5 ) {
            my $FAQTitle = 'FAQ ' . $Helper->GetRandomID();
            my $FAQID    = $FAQObject->FAQAdd(
                Title       => $FAQTitle,
                CategoryID  => 1,
                StateID     => 1,
                LanguageID  => 1,
                ValidID     => 1,
                UserID      => 1,
                Approved    => 1,
                ContentType => 'text/html',
            );

            $Self->True(
                $FAQID,
                "FAQ is created - $FAQID",
            );

            my %FAQ = (
                FAQID    => $FAQID,
                FAQTitle => $FAQTitle,
            );

            push @FAQIDs, \%FAQ;
        }

        # create and login test customer
        my $TestCustomerUserLogin = $Helper->TestCustomerUserCreate() || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Customer',
            User     => $TestCustomerUserLogin,
            Password => $TestCustomerUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to CustomerFAQExplorer screen of created test FAQ
        $Selenium->VerifiedGet("${ScriptAlias}customer.pl?Action=CustomerFAQExplorer");

        # check CustomerFAQExplorer screen
        $Selenium->find_element( "table",             'css' );
        $Selenium->find_element( "table thead tr th", 'css' );
        $Selenium->find_element( "table tbody tr td", 'css' );

        # test data for explorer screen
        my @Tests = (
            {
                ScreenData => 'FAQ Explorer',
            },
            {
                ScreenData => 'Latest created FAQ articles',
            },
            {
                ScreenData => 'Latest updated FAQ articles',
            },
        );

        for my $Test (@Tests) {
            $Self->True(
                index( $Selenium->get_page_source(), $Test->{ScreenData} ) > -1,
                "$Test->{ScreenData} is found",
            );
        }

        # click on 'Misc', go on subcategory screen
        $Selenium->find_element( 'Misc', 'link_text' )->VerifiedClick();

        # order FAQ item per FAQID by Down
        $Selenium->VerifiedGet(
            "${ScriptAlias}customer.pl?Action=CustomerFAQExplorer;CategoryID=1;SortBy=FAQID;OrderBy=Down"
        );

        # check and delete test created FAQs
        for my $FAQ (@FAQIDs) {

            # check if there is test FAQ on screen
            $Self->True(
                index( $Selenium->get_page_source(), $FAQ->{FAQTitle} ) > -1,
                "$FAQ->{FAQTitle} is found",
            );

            my $Success = $FAQObject->FAQDelete(
                ItemID => $FAQ->{FAQID},
                UserID => 1,
            );
            $Self->True(
                $Success,
                "FAQ is deleted - ID $FAQ->{FAQID}",
            );
        }

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => "FAQ" );
    }
);

1;
