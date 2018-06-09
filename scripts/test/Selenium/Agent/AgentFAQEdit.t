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

        # get test params
        my $FAQTitle = 'FAQ ' . $Helper->GetRandomID();
        my %Test     = (
            Stored => {
                Title       => $FAQTitle,
                CategoryID  => 1,
                StateID     => 1,
                LanguageID  => 1,
                Keywords    => 'Selenium Keywords',
                Field1      => 'Selenium Symptom',
                Field2      => 'Selenium Problem',
                Field3      => 'Selenium Solution',
                Field6      => 'Selenium Comment',
                ContentType => 'text/html',
                ValidID     => 1,
            },
            Edited => {
                Title       => $FAQTitle . ' Edit',
                CategoryID  => 1,
                StateID     => 2,
                LanguageID  => 2,
                Keywords    => 'Selenium Keywords Edit',
                Field1      => 'Selenium Symptom Edit',
                Field2      => 'Selenium Problem Edit',
                Field3      => 'Selenium Solution Edit',
                Field6      => 'Selenium Comment Edit',
                ContentType => 'text/html',
                ValidID     => 2,
            },
        );

        # get FAQ object
        my $FAQObject = $Kernel::OM->Get('Kernel::System::FAQ');

        # create test FAQ
        my $FAQID = $FAQObject->FAQAdd(
            %{ $Test{Stored} },
            UserID => 1,
        );

        $Self->True(
            $FAQID,
            "FAQ is created - ID $FAQID",
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

        # navigate to AgentFAQZoom of created test FAQ
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentFAQZoom;ItemID=$FAQID;Nav=");

        # verify its right screen
        $Self->True(
            index( $Selenium->get_page_source(), $FAQTitle ) > -1,
            "$FAQTitle is found",
        );

        # click on 'Edit' and switch window
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentFAQEdit;ItemID=$FAQID' )]")->VerifiedClick();

        $Selenium->WaitFor( WindowCount => 2 ) || die "Popup window not created (first time).";
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#Title").length' );

        # verify stored values
        for my $Stored ( sort keys %{ $Test{Stored} } ) {
            if ( $Stored ne 'ContentType' ) {
                $Self->Is(
                    $Selenium->find_element( '#' . $Stored, 'css' )->get_value(),
                    "$Test{Stored}->{$Stored}",
                    "#$Stored stored value",
                );
            }
        }

        # edit test FAQ
        $Selenium->find_element( "#Title", 'css' )->send_keys(' Edit');
        $Selenium->execute_script("\$('#StateID').val('2').trigger('redraw.InputField').trigger('change');");
        $Selenium->execute_script("\$('#LanguageID').val('2').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element( "#Keywords", 'css' )->send_keys(' Edit');
        $Selenium->find_element( "#Field1",   'css' )->send_keys(' Edit');
        $Selenium->find_element( "#Field2",   'css' )->send_keys(' Edit');
        $Selenium->find_element( "#Field3",   'css' )->send_keys(' Edit');
        $Selenium->find_element( "#Field6",   'css' )->send_keys(' Edit');
        $Selenium->execute_script("\$('#ValidID').val('2').trigger('redraw.InputField').trigger('change');");

        # submit and switch back window
        $Selenium->find_element( "#FAQSubmit", 'css' )->VerifiedClick();
        $Selenium->WaitFor( WindowCount => 1 ) || die "Popup window not closed.";
        $Selenium->switch_to_window( $Handles->[0] );

        # wait for reload to kick in
        sleep 1;

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#FAQBody").length' );

        # click on 'Edit' and switch window
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentFAQEdit;ItemID=$FAQID' )]")->VerifiedClick();

        $Selenium->WaitFor( WindowCount => 2 ) || die "Popup window not created (second time).";
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#Title").length' );

        # verify edited values
        for my $Edited ( sort keys %{ $Test{Edited} } ) {
            if ( $Edited ne 'ContentType' ) {
                $Self->Is(
                    $Selenium->find_element( '#' . $Edited, 'css' )->get_value(),
                    "$Test{Edited}->{$Edited}",
                    "#$Edited stored value",
                );
            }
        }

        # close 'Edit' pop-up window
        $Selenium->close();

        # delete test created FAQ
        my $Success = $FAQObject->FAQDelete(
            ItemID => $FAQID,
            UserID => 1,
        );
        $Self->True(
            $Success,
            "FAQ item is deleted - ID $FAQID",
        );

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => "FAQ" );
    }
);

1;
