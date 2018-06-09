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

my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

$Selenium->RunTest(
    sub {

        # Don't run the test, if the feature is disabled (can be removed after the next package release).
        return 1 if !$Kernel::OM->Get('Kernel::Config')->Get('FAQ::Customer::RelatedArticles::Enabled');

        my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Frontend::RichText',
            Value => 1,
        );
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Ticket::Service',
            Value => 0,
        );
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Ticket::Type',
            Value => 0,
        );

        # Create test customer user and login.
        my $TestCustomerUserLogin = $Helper->TestCustomerUserCreate(
        ) || die "Did not get test customer user";

        $Selenium->Login(
            Type     => 'Customer',
            User     => $TestCustomerUserLogin,
            Password => $TestCustomerUserLogin,
        );

        my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

        my %Category = $FAQObject->CategoryGet(
            CategoryID => 1,
            UserID     => 1,
        );

        my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

        # add FAQ articles
        my @FAQArticles;
        for my $Item (qw(subject body)) {
            my $Title   = 'title' . $Helper->GetRandomID();
            my $Keyword = $Item . $Helper->GetRandomID();
            my $FAQID   = $FAQObject->FAQAdd(
                Title       => $Title,
                CategoryID  => 1,
                StateID     => 1,
                LanguageID  => 1,
                Keywords    => $Keyword,
                Field1      => 'Symptom...',
                Field2      => 'Problem...',
                Field3      => 'Solution...',
                ContentType => 'text/html',
                UserID      => 1,
            );

            $Self->True(
                $FAQID,
                "FAQ article is created - $FAQID",
            );

            my %FAQ;
            $FAQ{ID}      = $FAQID;
            $FAQ{Keyword} = $Keyword;
            $FAQ{Title}   = $Title . " ($Category{Name})";

            push @FAQArticles, \%FAQ;
        }

        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        $Selenium->VerifiedGet("${ScriptAlias}customer.pl?Action=CustomerTicketMessage");

        # Check CustomerTicketMessage overview screen.
        for my $ID (qw(Dest Subject RichText Attachment PriorityID submitRichText)) {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # Check if until RelatedFAQArticles box is displayed
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $("#FAQRelatedArticles:visible").length'
        );

        $Self->True(
            index( $Selenium->get_page_source(), 'Type a subject or text to get a list of helpful resources.' ) > -1,
            "Found initial message for related FAQ article",
        );

        my $SubjectRandom = "Subject" . $Helper->GetRandomID();
        my $TextRandom    = "Text" . $Helper->GetRandomID();
        $Selenium->execute_script("\$('#Dest').val('2||Raw').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element( "#Subject", 'css' )->send_keys($SubjectRandom);

        # Set body text and add a whitespace at the end to trigger the ajay request for the related faq article.
        $Selenium->find_element( "#Subject", 'css' )->send_keys( "\N{U+E004}", $FAQArticles[1]->{Keyword}, " " );

        # Wait that the hint is no longer visible.
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && !$("#FAQRelatedArticles .Hint").length'
        );

        # Wait for ajax call after customer user selection.
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
        );

        # Check if there is the related FAQ article for the insert text in the body.
        $Self->True(
            $Selenium->find_element("//a[\@title='$FAQArticles[1]->{Title}']"),
            "Related FAQ article for body '$FAQArticles[1]->{Keyword}' is found - $FAQArticles[1]->{Title}"
        );
        $Self->True(
            $Selenium->find_element("//a[contains(\@href, 'Action=CustomerFAQZoom;ItemID=$FAQArticles[1]->{ID}')]"),
            "Link for related FAQ article is found - $FAQArticles[0]->{Title}"
        );

        # Change the body, to have a text which should not return some related faq article.
        $Selenium->execute_script('CKEDITOR.instances.RichText.setData();');
        $Selenium->find_element( "#Subject", 'css' )->send_keys( "\N{U+E004}", 'Nothing', " " );

        # Wait for ajax call after customer user selection.
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
        );
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $("#FAQRelatedArticles .Hint").length'
        );

        $Self->True(
            index( $Selenium->get_page_source(), 'Found no helpful resources for the subject and text.' ) > -1,
            "Found message for no related FAQ article",
        );

        for my $FAQ (@FAQArticles) {

            my $Success = $FAQObject->FAQDelete(
                ItemID => $FAQ->{ID},
                UserID => 1,
            );
            $Self->True(
                $Success,
                "FAQ is deleted - $FAQ->{ID}",
            );
        }

        for my $Cache (qw(FAQ FAQKeywordArticleList)) {
            $CacheObject->CleanUp(
                Type => $Cache,
            );
        }
    }
);

1;
