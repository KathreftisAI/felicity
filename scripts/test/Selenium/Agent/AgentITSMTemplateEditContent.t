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
        my $TemplateComment = 'Selenium Test Comment';
        my $TemplateID      = $TemplateObject->TemplateAdd(
            Name         => $TemplateNameRandom,
            TemplateType => 'ITSMChange',
            ChangeID     => $ChangeID,
            Content      => $ChangeContent,
            Comment      => $TemplateComment,
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

        # click on 'Edit Content' for test created change template
        $Selenium->find_element( "#EditContentTemplateID$TemplateID", 'css' )->click();

        # wait for dialog window to load, if necessary
        $Selenium->WaitFor( JavaScript => "return \$('#DialogButton1').length;" );

        # verify edit content values
        $Self->True(
            index( $Selenium->get_page_source(), "$TemplateNameRandom" ) > -1,
            "$TemplateNameRandom is found",
        );
        $Self->True(
            index( $Selenium->get_page_source(), "$TemplateComment" ) > -1,
            "$TemplateComment is found",
        );
        $Self->True(
            index(
                $Selenium->get_page_source(),
                "This will create a new change from this template, so you can edit and save it."
                ) > -1,
            "'This will create a new change from this template, so you can edit and save it.' is found",
        );
        $Self->True(
            index(
                $Selenium->get_page_source(),
                "The new change will be deleted automatically after it has been saved as template."
                ) > -1,
            "'The new change will be deleted automatically after it has been saved as template.' is found",
        );

        # create new change from test template
        $Selenium->find_element( "#DialogButton1", 'css' )->VerifiedClick();

        # get new change ID created from test template
        my $ChangeFromTemplateID = $ChangeID++;

        # get new change data created from test template
        my $ChangeFromTemplate = $ChangeObject->ChangeGet(
            ChangeID => $ChangeFromTemplateID,
            UserID   => 1,
        );

        # verify new change values
        $Self->True(
            index( $Selenium->get_page_source(), $ChangeFromTemplate->{ChangeTitle} ) > -1,
            "$ChangeFromTemplate->{ChangeTitle} is found",
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

        # delete test created changes
        for my $ChangeDelete ( $ChangeID, $ChangeFromTemplateID ) {
            $Success = $ChangeObject->ChangeDelete(
                ChangeID => $ChangeDelete,
                UserID   => 1,
            );
            $Self->True(
                $Success,
                "$ChangeTitleRandom is deleted",
            );
        }

        # make sure cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );
    }
);

1;
