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
        # test params
        my $FAQTitle    = 'FAQ ' . $Helper->GetRandomID();
        my $FAQSymptom  = 'Selenium Symptom';
        my $FAQProblem  = 'Selenium Problem';
        my $FAQSolution = 'Selenium Solution';

        my $FAQID = $FAQObject->FAQAdd(
            Title       => $FAQTitle,
            CategoryID  => 1,
            StateID     => 3,
            LanguageID  => 1,
            Keywords    => 'SeleniumKeywords',
            Field1      => $FAQSymptom,
            Field2      => $FAQProblem,
            Field3      => $FAQSolution,
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

        # navigate to PublicFAQZoom screen of created test FAQ
        $Selenium->VerifiedGet("${ScriptAlias}public.pl?Action=PublicFAQZoom;ItemID=$FAQID");

        # check page
        $Self->True(
            index( $Selenium->get_page_source(), 'FAQ Information' ) > -1,
            "FAQ data is found on screen - FAQ Information",
        );

        # verify test FAQ is created
        $Self->True(
            index( $Selenium->get_page_source(), $FAQTitle ) > -1,
            "$FAQTitle - found",
        );

        my @Tests = (
            {
                Iframe  => 'IframeFAQField1',
                FAQData => $FAQSymptom,
            },
            {
                Iframe  => 'IframeFAQField2',
                FAQData => $FAQProblem,
            },
            {
                Iframe  => 'IframeFAQField3',
                FAQData => $FAQSolution,
            },
        );

        # get window handles
        my $Handles = $Selenium->get_window_handles();

        # check test created FAQ values
        for my $Test (@Tests) {

            # switch to FAQ symptom iframe and verify its values
            $Selenium->switch_to_frame( $Test->{Iframe} );

            # wait to switch on iframe
            sleep 2;

            $Self->True(
                index( $Selenium->get_page_source(), $Test->{FAQData} ) > -1,
                "$Test->{FAQData} - found",
            );
            $Selenium->switch_to_window( $Handles->[0] );
        }

        $Self->True(
            index( $Selenium->get_page_source(), 'SeleniumKeywords' ) > -1,
            "FAQ 'SeleniumKeywords' value - found",
        );
        $Self->True(
            index( $Selenium->get_page_source(), 'public (all)' ) > -1,
            "FAQ state value - found",
        );
        $Self->True(
            index( $Selenium->get_page_source(), '0 out of 5' ) > -1,
            "FAQ default vote value - found",
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
