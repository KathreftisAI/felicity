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

        # create test FAQ
        my $FAQTitle = 'FAQ ' . $Helper->GetRandomID();
        my $FAQID    = $Kernel::OM->Get('Kernel::System::FAQ')->FAQAdd(
            Title       => $FAQTitle,
            CategoryID  => 1,
            StateID     => 1,
            LanguageID  => 1,
            ValidID     => 1,
            UserID      => 1,
            ContentType => 'text/plain',
        );

        $Self->True(
            $FAQID,
            "FAQ item is created - ID $FAQID",
        );

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

        # navigate to AgentFAQZoom screen of created test FAQ
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentFAQZoom;ItemID=$FAQID;Nav=");

        # verify its right screen
        $Self->True(
            index( $Selenium->get_page_source(), $FAQTitle ) > -1,
            "$FAQTitle is found",
        );

        # click on 'Delete'
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentFAQDelete;ItemID=$FAQID' )]")->VerifiedClick();
        $Selenium->WaitFor( JavaScript => 'return $("#DialogButton1").length' );

        # verify delete message
        $Self->True(
            index( $Selenium->get_page_source(), 'Do you really want to delete this FAQ article?' ) > -1,
            "Delete message is found",
        );

        # execute delete
        $Selenium->find_element( "#DialogButton1", 'css' )->VerifiedClick();

        # verify delete action
        # try to navigate to the AgetnFAQZoom of deleted test FAQ
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentFAQZoom;ItemID=$FAQID;Nav=");
        $Self->True(
            index( $Selenium->get_page_source(), "No such ItemID $FAQID!" ) > -1,
            "Delete action - success",
        );

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => "FAQ" );
    }
);

1;
