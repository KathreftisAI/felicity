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

        # create test FAQ
        my $FAQTitle = 'FAQ ' . $Helper->GetRandomID();
        my $FAQID    = $FAQObject->FAQAdd(
            Title       => $FAQTitle,
            CategoryID  => 1,
            StateID     => 3,
            LanguageID  => 1,
            Approved    => 1,
            ValidID     => 1,
            UserID      => 1,
            ContentType => 'text/html',
        );
        $Self->True(
            $FAQID,
            "FAQ is created - $FAQID",
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to PublicFAQRSS created screen
        $Selenium->get("${ScriptAlias}public.pl?Action=PublicFAQRSS;Type=Created");

        # verify FAQRSS created screen
        $Self->True(
            index( $Selenium->get_page_source(), 'FAQ Articles (new created)' ) > -1,
            "FAQRSS created title found - found",
        );

        $Self->True(
            index( $Selenium->get_page_source(), $FAQTitle ) > -1,
            "$FAQTitle - found",
        );
        $Self->True(
            index( $Selenium->get_page_source(), "Action=PublicFAQZoom;ItemID=$FAQID" ) > -1,
            "FAQ link - found",
        );

        # navigate to PublicFAQRSS changed screen
        $Selenium->get("${ScriptAlias}public.pl?Action=PublicFAQRSS;Type=Changed");

        # verify FAQRSS changed screen
        $Self->True(
            index( $Selenium->get_page_source(), 'FAQ Articles (recently changed)' ) > -1,
            "FAQRSS changed title found - found",
        );
        $Self->True(
            index( $Selenium->get_page_source(), $FAQTitle ) > -1,
            "$FAQTitle - found",
        );
        $Self->True(
            index( $Selenium->get_page_source(), "Action=PublicFAQZoom;ItemID=$FAQID" ) > -1,
            "FAQ link - found",
        );

        # delete test created FAQ
        my $Success = $FAQObject->FAQDelete(
            ItemID => $FAQID,
            UserID => 1,
        );
        $Self->True(
            $Success,
            "FAQ is deleted - $FAQID",
        );

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => "FAQ" );
    }
);

1;
