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

# get selenium object
my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

$Selenium->RunTest(
    sub {

        # get helper object
        my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => ['admin'],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get test user ID
        my $TestUserID = $Kernel::OM->Get('Kernel::System::User')->UserLookup(
            UserLogin => $TestUserLogin,
        );

        # define needed variables
        my $ProcessRandom  = 'Process' . $Helper->GetRandomID();
        my $ActivityRandom = 'Activity' . $Helper->GetRandomID();

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AdminProcessManagement screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminProcessManagement");

        # create new test Process
        $Selenium->find_element("//a[contains(\@href, \'Subaction=ProcessNew' )]")->VerifiedClick();
        $Selenium->find_element( "#Name",        'css' )->send_keys($ProcessRandom);
        $Selenium->find_element( "#Description", 'css' )->send_keys("Selenium Test Process");
        $Selenium->find_element( "#Name",        'css' )->VerifiedSubmit();

        # create new test Activity
        $Selenium->find_element("//a[contains(\@href, \'Subaction=ActivityNew' )]")->VerifiedClick();

        # switch to pop up window
        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#Name').length" );

        # check AdminProcessManagementActivity screen
        for my $ID (
            qw(Name FilterAvailableActivityDialogs AvailableActivityDialogs AssignedActivityDialogs)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # check client side validation
        $Selenium->find_element( "#Name", 'css' )->clear();
        $Selenium->find_element( "#Name", 'css' )->VerifiedSubmit();
        $Self->Is(
            $Selenium->execute_script(
                "return \$('#Name').hasClass('Error')"
            ),
            '1',
            'Client side validation correctly detected missing input value',
        );

        # input name field and submit
        $Selenium->find_element( "#Name", 'css' )->send_keys($ActivityRandom);
        $Selenium->find_element( "#Name", 'css' )->submit();

        # switch back to main window
        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        # check for created test activity using filter on AdminProcessManagement screen
        $Selenium->WaitFor(
            JavaScript =>
                "return typeof(\$) === 'function' && \$('ul#Activities li:contains($ActivityRandom)').length"
        );
        $Selenium->find_element( "#ActivityFilter", 'css' )->send_keys($ActivityRandom);

        # wait for filter to kick in
        sleep 1;

        $Self->True(
            $Selenium->find_element("//*[text()=\"$ActivityRandom\"]")->is_displayed(),
            "$ActivityRandom activity found on page",
        );

        # get test ActivityID
        my $DBObject       = $Kernel::OM->Get('Kernel::System::DB');
        my $ActivityQuoted = $DBObject->Quote($ActivityRandom);
        $DBObject->Prepare(
            SQL  => "SELECT id FROM pm_activity WHERE name = ?",
            Bind => [ \$ActivityQuoted ]
        );
        my $ActivityID;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $ActivityID = $Row[0];
        }

        # check for stored value and edit test Activity
        $Selenium->find_element("//a[contains(\@href, \'Subaction=ActivityEdit;ID=$ActivityID' )]")->VerifiedClick();
        $Selenium->WaitFor( WindowCount => 2 );
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#Name').length" );

        $Self->Is(
            $Selenium->find_element( '#Name', 'css' )->get_value(),
            $ActivityRandom,
            "#Name stored value",
        );

        $Selenium->find_element( "#Name", 'css' )->send_keys("edit");
        $Selenium->find_element( "#Name", 'css' )->submit();

        # return to main window after the popup is closed, as the popup sends commands to the main window.
        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        # get process id
        my $ProcessID = $Selenium->execute_script('return $("#ProcessDelete").data("id")') || undef;

        # navigate to AdminProcessManagement screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminProcessManagement");

        # set process to inactive
        $Selenium->find_element( $ProcessRandom, 'link_text' )->VerifiedClick();
        $Selenium->execute_script("\$('#StateEntityID').val('S2').trigger('redraw.InputField').trigger('change');");
        $Selenium->find_element( "#Submit", 'css' )->VerifiedClick();

        # test search filter
        $Selenium->find_element( "#Filter", 'css' )->clear();
        $Selenium->find_element( "#Filter", 'css' )->send_keys($ProcessRandom);

        # check class of invalid Process in the overview table
        $Self->True(
            $Selenium->execute_script(
                "return \$('tr.Invalid td:contains($ProcessRandom)').length"
            ),
            "There is a class 'Invalid' for test Process",
        );

        # delete test activity
        my $Success = $Kernel::OM->Get('Kernel::System::ProcessManagement::DB::Activity')->ActivityDelete(
            ID     => $ActivityID,
            UserID => $TestUserID,
        );

        $Self->True(
            $Success,
            "Activity is deleted - $ActivityID",
        );

        # delete test process
        $Success = $Kernel::OM->Get('Kernel::System::ProcessManagement::DB::Process')->ProcessDelete(
            ID     => $ProcessID,
            UserID => $TestUserID,
        );

        $Self->True(
            $Success,
            "Process is deleted - $ProcessID",
        );

        # synchronize process after deleting test process
        $Selenium->find_element("//a[contains(\@href, \'Subaction=ProcessSync' )]")->VerifiedClick();

        # make sure cache is correct
        for my $Cache (
            qw(ProcessManagement_Activity ProcessManagement_Process )
            )
        {
            $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => $Cache );
        }

    }
);

1;
