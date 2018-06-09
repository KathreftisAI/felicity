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

        # get change state data
        my $ChangeStateDataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
            Class => 'ITSM::ChangeManagement::Change::State',
            Name  => 'requested',
        );

        # get change object
        my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

        # create test change
        my $ChangeTitleRandom = 'ITSMChange Requested ' . $Helper->GetRandomID();
        my $ChangeID          = $ChangeObject->ChangeAdd(
            ChangeTitle   => $ChangeTitleRandom,
            Description   => "Test Description",
            Justification => "Test Justification",
            ChangeStateID => $ChangeStateDataRef->{ItemID},
            UserID        => 1,
        );
        $Self->True(
            $ChangeID,
            "$ChangeTitleRandom is created",
        );

        # get template object
        my $TemplateObject = $Kernel::OM->Get('Kernel::System::ITSMChange::Template');

        # create simple change template
        my $TemplateNameRandom = 'Template ' . $Helper->GetRandomID();
        my $ChangeContent      = $TemplateObject->TemplateSerialize(
            Name         => $TemplateNameRandom,
            TemplateType => 'ITSMChange',
            ChangeID     => $ChangeID,
            Comment      => 'Selenium Test Comment',
            ValidID      => 1,
            UserID       => 1
        );

        # create test template from test change
        my $TemplateID = $TemplateObject->TemplateAdd(
            Name         => $TemplateNameRandom,
            TemplateType => 'ITSMChange',
            ChangeID     => $ChangeID,
            Content      => $ChangeContent,
            Comment      => 'Selenium Test Comment',
            ValidID      => 1,
            UserID       => 1,
        );
        $Self->True(
            $TemplateID,
            "Change Template ID $TemplateID is created",
        );

        # create and log in test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-manager' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentITSMTemplateOverview screen
        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AgentITSMTemplateOverview;SortBy=TemplateID;OrderBy=Down;Filter=ITSMChange"
        );

        # click on test template and switch window
        $Selenium->find_element("//a[contains(\@href, \'AgentITSMTemplateEdit;TemplateID=$TemplateID' )]")->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#TemplateName").length' );

        # check stored values
        $Self->Is(
            $Selenium->find_element( '#TemplateName', 'css' )->get_value(),
            $TemplateNameRandom,
            "#TemplateName stored value",
        );
        $Self->Is(
            $Selenium->find_element( '#Comment', 'css' )->get_value(),
            'Selenium Test Comment',
            "#Comment stored value",
        );

        # edit values and submit
        $Selenium->find_element( "#TemplateName", 'css' )->send_keys(" Edit");
        $Selenium->find_element( "#Comment",      'css' )->send_keys(" Edit");
        $Selenium->find_element("//button[\@id='submitEditTemplate'][\@type='submit']")->click();

        $Selenium->WaitFor( WindowCount => 1 );
        $Selenium->switch_to_window( $Handles->[0] );

        sleep(1);

        # click on edited test template and switch window
        $Selenium->find_element("//a[contains(\@href, \'AgentITSMTemplateEdit;TemplateID=$TemplateID' )]")->click();

        $Selenium->WaitFor( WindowCount => 2 );
        $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $("#TemplateName").length' );

        # check edited values
        $Self->Is(
            $Selenium->find_element( '#TemplateName', 'css' )->get_value(),
            $TemplateNameRandom . ' Edit',
            "#TemplateName edited value",
        );
        $Self->Is(
            $Selenium->find_element( '#Comment', 'css' )->get_value(),
            'Selenium Test Comment Edit',
            "#Comment edited value",
        );

        # delete test template
        my $Success = $TemplateObject->TemplateDelete(
            TemplateID => $TemplateID,
            UserID     => 1,
        );
        $Self->True(
            $Success,
            "$TemplateNameRandom edit is deleted",
        );

        # delete test created change
        $Success = $ChangeObject->ChangeDelete(
            ChangeID => $ChangeID,
            UserID   => 1,
        );
        $Self->True(
            $Success,
            "$ChangeTitleRandom is deleted",
        );

        # make sure cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );
    }
);

1;
