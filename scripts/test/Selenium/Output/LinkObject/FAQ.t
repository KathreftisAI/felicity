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

        # create two test FAQ
        my @FAQIDs;
        my @FAQTitles;
        for my $FAQ ( 1 .. 2 ) {
            my $FAQTitle = 'FAQ ' . $Helper->GetRandomID();
            my $FAQID    = $FAQObject->FAQAdd(
                Title       => $FAQTitle,
                CategoryID  => 1,
                StateID     => 2,
                LanguageID  => 1,
                ValidID     => 1,
                UserID      => 1,
                ContentType => 'text/html',
            );

            $Self->True(
                $FAQID,
                "Test FAQ item is created - ID $FAQID",
            );

            push @FAQIDs,    $FAQID;
            push @FAQTitles, $FAQTitle;
        }

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

        # navigate to AgentFAQZoom of created FAQ
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentFAQZoom;ItemID=$FAQIDs[0]");

        # click on 'Link'
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentLinkObject;SourceObject=FAQ' )]")->VerifiedClick();

        # switch to link object window
        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("body").length' );

        # link two test created FAQs
        $Selenium->find_element("//input[\@name='SEARCH::Title']")->send_keys( $FAQTitles[1] );
        $Selenium->find_element("//button[\@value='Search'][\@type='submit']")->VerifiedClick();

        $Selenium->find_element("//input[\@id='LinkTargetKeys']")->VerifiedClick();
        $Selenium->find_element("//button[\@id='AddLinks'][\@type='submit']")->VerifiedClick();
        $Selenium->close();

        # back to AgentFAQZoom
        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        # verify FAQ link
        $Selenium->VerifiedRefresh();
        $Self->True(
            index( $Selenium->get_page_source(), $FAQTitles[1] ) > -1,
            "Test ticket title $FAQTitles[1] is found",
        );

        # click on 'Link' and switch screens
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentLinkObject;SourceObject=FAQ' )]")->VerifiedClick();

        # switch to link object window
        $Selenium->WaitFor( WindowCount => 2 );
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("body").length' );

        # delete link relation
        $Selenium->find_element("//a[contains(\@href, \'Subaction=LinkDelete' )]")->VerifiedClick();
        $Selenium->find_element("//input[\@id='SelectAllLinks0']")->VerifiedClick();
        $Selenium->find_element("//button[\@type='submit']")->VerifiedClick();
        $Selenium->close();

        # back to AgentFAQZoom
        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        # verify that link has been removed
        $Selenium->VerifiedRefresh();
        $Self->True(
            index( $Selenium->get_page_source(), $FAQTitles[1] ) == -1,
            "$FAQTitles[1] is not found",
        );

        # delete test created FAQs
        my $Success;
        for my $FAQID (@FAQIDs) {
            $Success = $FAQObject->FAQDelete(
                ItemID => $FAQID,
                UserID => 1,
            );
            $Self->True(
                $Success,
                "Test FAQ item is deleted - ID $FAQID",
            );
        }

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => "FAQ" );

    }
);

1;
