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
            "Change in successful state is created",
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
            "Change Template $TemplateID is created",
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
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMChangeAddFromTemplate");

        # check page
        for my $ID (
            qw(TemplateID MoveTimeType MoveTimeMonth MoveTimeDay MoveTimeYear MoveTimeHour MoveTimeMinute SubmitAddTemplate)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # create new change from test template
        $Selenium->execute_script(
            "\$('#TemplateID').val('$TemplateID').trigger('redraw.InputField').trigger('change');"
        );
        $Selenium->find_element( "#SubmitAddTemplate", 'css' )->VerifiedClick();

        # check change values created from test template
        $Self->True(
            index( $Selenium->get_page_source(), $ChangeTitleRandom ) > -1,
            "$ChangeTitleRandom is found",
        );

        # get DB object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # get created test change ID
        my $ChangeQuoted = $DBObject->Quote($ChangeTitleRandom);
        $DBObject->Prepare(
            SQL => "SELECT id
                FROM change_item
                WHERE title = ?
                AND id != $ChangeID",
            Bind => [ \$ChangeQuoted ]
        );
        my $CreatedChangeID;
        while ( my @Row = $DBObject->FetchrowArray() ) {
            $CreatedChangeID = $Row[0];
        }

        # delete test template
        my $Success = $TemplateObject->TemplateDelete(
            TemplateID => $TemplateID,
            UserID     => 1,
        );
        $Self->True(
            $Success,
            "$TemplateNameRandom is deleted"
        );

        # delete test changes
        for my $ChangeDelete ( $ChangeID, $CreatedChangeID ) {
            $Success = $ChangeObject->ChangeDelete(
                ChangeID => $ChangeDelete,
                UserID   => 1,
            );
            $Self->True(
                $Success,
                "ITSMChange $ChangeDelete is deleted",
            );
        }

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );

    }
);

1;
