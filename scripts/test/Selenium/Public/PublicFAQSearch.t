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

        # create test FAQs
        my @FAQSearch;
        for my $Title (qw( FAQSearch FAQChangeSearch )) {

            # add test FAQ
            my $FAQTitle = $Title . $Helper->GetRandomID();
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

            my %FAQ = (
                FAQID    => $FAQID,
                FAQTitle => $FAQTitle,
                Type     => $Title,
            );

            push @FAQSearch, \%FAQ;
        }

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to PublicFAQSearch form
        $Selenium->VerifiedGet("${ScriptAlias}public.pl?Action=PublicFAQSearch");

        # check ticket search page
        for my $ID (
            qw(Number FullText Title Keyword LanguageIDs CategoryIDs NoVoteSet VotePoint
            VoteSearchType NoRateSet RatePoint RateSearchType RateSearch NoTimeSet Date DateRange
            ItemCreateTimePointStart ItemCreateTimePoint ItemCreateTimePointFormat ItemCreateTimeStartMonth
            ItemCreateTimeStartDay ItemCreateTimeStartYear ItemCreateTimeStopMonth ItemCreateTimeStopDay
            ItemCreateTimeStopYear Submit ResultForm)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # search FAQ by title and run it
        $Selenium->find_element( "#Title",  'css' )->send_keys('FAQ*');
        $Selenium->find_element( "#Submit", 'css' )->VerifiedClick();

        # check PublicFAQSearch result screen
        $Selenium->find_element( "table",             'css' );
        $Selenium->find_element( "table thead tr th", 'css' );
        $Selenium->find_element( "table tbody tr td", 'css' );

        # check test FAQs searched by 'FAQ*'
        # all FAQs will be in a search result
        for my $FAQ (@FAQSearch) {

            # check if there is test FAQ on screen
            $Self->True(
                index( $Selenium->get_page_source(), $FAQ->{FAQTitle} ) > -1,
                "$FAQ->{FAQTitle} - found",
            );
        }

        # check 'Change search options' screen
        $Selenium->find_element("//a[contains(\@href, \'public.pl?Action=PublicFAQSearch' )]")->VerifiedClick();
        $Selenium->find_element( "#Title",  'css' )->clear();
        $Selenium->find_element( "#Title",  'css' )->send_keys('FAQChangeSearch*');
        $Selenium->find_element( "#Submit", 'css' )->VerifiedClick();

        # check test FAQs searched by 'FAQChangeSearch*'
        for my $FAQ (@FAQSearch) {

            if ( $FAQ->{Type} eq 'FAQChangeSearch' ) {

                # check if there is test FAQChangeSearch* on screen
                $Self->True(
                    index( $Selenium->get_page_source(), $FAQ->{FAQTitle} ) > -1,
                    "$FAQ->{FAQTitle} - found",
                );
            }
            else {

                # check if there is no test FAQSearch* on screen
                $Self->True(
                    index( $Selenium->get_page_source(), $FAQ->{FAQTitle} ) == -1,
                    "$FAQ->{FAQTitle} - not found",
                );
            }
        }

        # check 'Change search options' button again
        $Selenium->find_element("//a[contains(\@href, \'public.pl?Action=PublicFAQSearch' )]")->VerifiedClick();
        $Selenium->find_element( "#Title",  'css' )->clear();
        $Selenium->find_element( "#Title",  'css' )->send_keys( $Helper->GetRandomID() );
        $Selenium->find_element( "#Submit", 'css' )->VerifiedClick();

        # check no data message
        $Selenium->find_element( "#EmptyMessage", 'css' );
        $Self->True(
            index( $Selenium->get_page_source(), 'No FAQ data found.' ) > -1,
            "No FAQ data found.",
        );

        # delete test created FAQs
        for my $Delete (@FAQSearch) {
            my $Success = $FAQObject->FAQDelete(
                ItemID => $Delete->{FAQID},
                UserID => 1,
            );
            $Self->True(
                $Success,
                "FAQ is deleted - $Delete->{FAQTitle}",
            );
        }

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => "FAQ" );
    }
);

1;
