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

        # do not check RichText
        $Helper->ConfigSettingChange(
            Valid => 1,
            Key   => 'Frontend::RichText',
            Value => 0,
        );

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'users', 'faq' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentFAQAdd
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentFAQAdd");

        # check page
        for my $ID (
            qw(Title Keywords CategoryID StateID ValidID LanguageID FileUpload
            Field1 Field2 Field3 Field6 FAQSubmit)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # test params
        my $FAQTitle    = 'FAQ ' . $Helper->GetRandomID();
        my $FAQSymptom  = 'Selenium Symptom';
        my $FAQProblem  = 'Selenium Problem';
        my $FAQSolution = 'Selenium Solution';
        my $FAQComment  = 'Selenium Comment';

        # create test FAQ
        $Selenium->find_element( "#Title",    'css' )->send_keys($FAQTitle);
        $Selenium->find_element( "#Keywords", 'css' )->send_keys('Selenium');
        $Selenium->execute_script("\$('#CategoryID').val('1').trigger('redraw.InputField').trigger('change');");
        $Selenium->execute_script("\$('#StateID').val('2').trigger('redraw.InputField').trigger('change');");
        $Selenium->execute_script("\$('#ValidID').val('1').trigger('redraw.InputField').trigger('change');");
        $Selenium->execute_script("\$('#LanguageID').val('1').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element( "#Field1", 'css' )->send_keys($FAQSymptom);
        $Selenium->find_element( "#Field2", 'css' )->send_keys($FAQProblem);
        $Selenium->find_element( "#Field3", 'css' )->send_keys($FAQSolution);
        $Selenium->find_element( "#Field6", 'css' )->send_keys($FAQComment);
        $Selenium->find_element( "#Title",  'css' )->VerifiedSubmit();

        # verify test FAQ is created
        $Self->True(
            index( $Selenium->get_page_source(), $FAQTitle ) > -1,
            "$FAQTitle is found",
        );

        for my $Test ( $FAQSymptom, $FAQProblem, $FAQSolution, $FAQComment ) {
            $Self->True(
                index( $Selenium->get_page_source(), $Test ) > -1,
                "$Test is found",
            );
        }

        # get DB object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # get test created FAQ ID
        my $FAQItem = $DBObject->Quote($FAQTitle);
        $DBObject->Prepare(
            SQL  => "SELECT id FROM faq_item WHERE f_subject = ?",
            Bind => [ \$FAQTitle ]
        );
        my $FAQID;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $FAQID = $Row[0];
        }

        # delete test created FAQ
        my $Success = $Kernel::OM->Get('Kernel::System::FAQ')->FAQDelete(
            ItemID => $FAQID,
            UserID => 1,
        );
        $Self->True(
            $Success,
            "$FAQID is deleted - ID $FAQID",
        );

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => "FAQ" );
    }
);

1;
