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

        # create test FAQ category
        my $CategoryID = $FAQObject->CategoryAdd(
            Name     => 'Category ' . $Helper->GetRandomID(),
            Comment  => 'Selenium Category',
            ParentID => 0,
            ValidID  => 1,
            UserID   => 1,
        );
        $Self->True(
            $CategoryID,
            "FAQ category is created - $CategoryID",
        );

        # set test FAQ category permission
        my $GroupID = $Kernel::OM->Get('Kernel::System::Group')->GroupLookup(
            Group => 'faq',
        );

        $FAQObject->SetCategoryGroup(
            CategoryID => $CategoryID,
            GroupIDs   => [$GroupID],
            UserID     => 1,
        );

        # create test FAQs
        my @FAQSearch;
        for my $Title (qw( FAQSearch FAQChangeSearch )) {
            for ( 1 .. 5 ) {

                # add test FAQ
                my $FAQTitle = $Title . $Helper->GetRandomID();
                my $FAQID    = $FAQObject->FAQAdd(
                    Title       => $FAQTitle,
                    CategoryID  => $CategoryID,
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
                    Type     => $Title,
                );

                push @FAQSearch, \%FAQ;
            }

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

        # navigate to CustomerFAQSearch form
        $Selenium->VerifiedGet("${ScriptAlias}customer.pl?Action=CustomerFAQSearch");

        # check ticket search page
        for my $ID (
            qw(Profile Number FullText Title Keyword LanguageIDs CategoryIDs NoVoteSet VotePoint
            VoteSearchType NoRateSet RatePoint RateSearchType RateSearch NoTimeSet Date DateRange
            ItemCreateTimePointStart ItemCreateTimePoint ItemCreateTimePointFormat ItemCreateTimeStartMonth
            ItemCreateTimeStartDay ItemCreateTimeStartYear ItemCreateTimeStopMonth ItemCreateTimeStopDay
            ItemCreateTimeStopYear SaveProfile Profil Submit ResultForm)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # search FAQ by title and run it
        $Selenium->find_element( "#Title",  'css' )->send_keys('FAQ*');
        $Selenium->find_element( "#Submit", 'css' )->VerifiedClick();

        # check CustomerFAQSearch result screen
        $Selenium->find_element( "table",             'css' );
        $Selenium->find_element( "table thead tr th", 'css' );
        $Selenium->find_element( "table tbody tr td", 'css' );

        # check test FAQs searched by 'FAQ*'
        # all FAQs will be in a search result
        for my $FAQ (@FAQSearch) {

            # check if there is test FAQ on screen
            $Self->True(
                index( $Selenium->get_page_source(), $FAQ->{FAQTitle} ) > -1,
                "$FAQ->{FAQTitle} is found",
            );
        }

        # check 'Change search options' screen
        $Selenium->find_element("//a[contains(\@href, \'Action=CustomerFAQSearch;Subaction=LoadProfile' )]")
            ->VerifiedClick();

        $Selenium->find_element( "#Title", 'css' )->clear();
        $Selenium->find_element( "#Title", 'css' )->send_keys('FAQChangeSearch*');
        $Selenium->execute_script(
            "\$('#CategoryIDs').val('$CategoryID').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element( "#Submit", 'css' )->VerifiedClick();

        # check test FAQs searched by 'FAQChangeSearch*'
        # delete test FAQs after checking
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
                    "$FAQ->{FAQTitle} is not found",
                );
            }

            my $Success = $FAQObject->FAQDelete(
                ItemID => $FAQ->{FAQID},
                UserID => 1,
            );
            $Self->True(
                $Success,
                "FAQ is deleted - ID $FAQ->{FAQID}",
            );

        }

        # check 'Change search options' button again
        $Selenium->find_element("//a[contains(\@href, \'Action=CustomerFAQSearch;Subaction=LoadProfile' )]")
            ->VerifiedClick();

        $Selenium->find_element( "#Title",  'css' )->clear();
        $Selenium->find_element( "#Title",  'css' )->send_keys( $Helper->GetRandomID() );
        $Selenium->find_element( "#Submit", 'css' )->VerifiedClick();

        # check no data message
        $Selenium->find_element( "#EmptyMessage", 'css' );
        $Self->True(
            index( $Selenium->get_page_source(), 'No FAQ data found.' ) > -1,
            "No FAQ data found.",
        );

        # delete test created FAQ category
        my $Success = $FAQObject->CategoryDelete(
            CategoryID => $CategoryID,
            UserID     => 1,
        );
        $Self->True(
            $Success,
            "FAQ category is deleted - ID $CategoryID",
        );

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => "FAQ" );
    }
);

1;
