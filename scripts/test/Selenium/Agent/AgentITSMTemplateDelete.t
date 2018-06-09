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
            Name  => 'successful',
        );

        # get change object
        my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

        # create test change
        my $ChangeTitleRandom = 'ITSMChange ' . $Helper->GetRandomID();
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
            ValidID      => 1,
            UserID       => 1
        );

        # create test template from test change
        my $TemplateID = $TemplateObject->TemplateAdd(
            Name         => $TemplateNameRandom,
            TemplateType => 'ITSMChange',
            ChangeID     => $ChangeID,
            Content      => $ChangeContent,
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

        # navigate to AgentITSMChangeAddFromTemplate screen
        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AgentITSMTemplateOverview;SortBy=TemplateID;OrderBy=Down;Filter=ITSMChange"
        );

        # check for created test template
        $Self->True(
            index( $Selenium->get_page_source(), $TemplateNameRandom ) > -1,
            "$TemplateNameRandom is found",
        );

        # click to delete test template
        $Selenium->find_element( "#DeleteTemplateID$TemplateID", 'css' )->click();

        # wait for confirm button to show up and confirm delete action
        $Selenium->WaitFor( JavaScript => "return \$('#DialogButton1').length;" );
        $Selenium->find_element( "#DialogButton1", 'css' )->VerifiedClick();

        # navigate to AgentITSMChangeAddFromTemplate screen
        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AgentITSMTemplateOverview;SortBy=TemplateID;OrderBy=Down;Filter=ITSMChange"
        );

        # verify delete action for test created template
        $Self->True(
            index( $Selenium->get_page_source(), $TemplateNameRandom ) == -1,
            "$TemplateNameRandom is not found",
        );

        # delete created test change
        my $Success = $ChangeObject->ChangeDelete(
            ChangeID => $ChangeID,
            UserID   => 1,
        );
        $Self->True(
            $Success,
            "$ChangeTitleRandom is deleted",
        );

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );
    }
);

1;
