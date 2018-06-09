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

        # get needed objects
        my $Helper               = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

        # get change state data
        my $ChangeStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ChangeManagement::Change::State',
            Name  => 'requested',
        );

        # get change object
        my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

        # create test change
        my $ChangeTitleRandom = 'ITSMChange Requested ' . $Helper->GetRandomID();
        my $ChangeID          = $ChangeObject->ChangeAdd(
            ChangeTitle   => $ChangeTitleRandom,
            Description   => 'Selenium Test Description',
            Justification => 'Seleniun Test Justification',
            ChangeStateID => $ChangeStateDataRef->{ItemID},
            UserID        => 1,
        );
        $Self->True(
            $ChangeID,
            "$ChangeTitleRandom is created",
        );

        # create and log in test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-builder', 'itsm-change-manager' ]
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentITSMChangeZoom of created test change
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMChangeZoom;ChangeID=$ChangeID");

        # click on 'Conditions' and switch screens
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMChangeCondition;ChangeID=$ChangeID' )]")
            ->click();

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        # wait until page has loaded, if necessary
        $Selenium->WaitFor( JavaScript => 'return typeof($) === "function" && $(".CancelClosePopup").length' );

        # click 'Add new condition'
        $Selenium->find_element("//button[\@name='AddCondition'][\@type='submit']")->VerifiedClick();

        # create test condition
        my $ConditionNameRandom = "Condition " . $Helper->GetRandomID();
        $Selenium->find_element( "#Name",    'css' )->send_keys($ConditionNameRandom);
        $Selenium->find_element( "#Comment", 'css' )->send_keys("SeleniumCondition");

        # get condition object
        my $ConditionObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition');

        # get needed IDs
        my $ExpresionAttributeID = $ConditionObject->AttributeLookup(
            Name => 'PriorityID',
        );
        my $PriorityDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ChangeManagement::Priority',
            Name  => '2 low',
        );
        my $ActionAttributeID = $ConditionObject->AttributeLookup(
            Name => 'ChangeStateID'
        );
        my $ActionOperatorID = $ConditionObject->OperatorLookup(
            Name => 'set',
        );
        my $ConditionChangeStateDataRef = $GeneralCatalogObject->ItemGet(
            Class => 'ITSM::ChangeManagement::Change::State',
            Name  => 'approved',
        );

        # add new expression
        # in change object for test change, look for priority value of '2 low'
        $Selenium->find_element("//button[\@name='AddExpressionButton'][\@type='submit']")->click();
        $Selenium->find_element( "#ExpressionID-NEW-ObjectID option[value='1']", 'css' )->click();

        # wait for ajax response to fill next dropdown list with more than 1 value
        $Selenium->WaitFor( JavaScript => "return \$('#ExpressionID-NEW-Selector option').length > 1;" );
        $Selenium->find_element( "#ExpressionID-NEW-Selector option[value='$ChangeID']", 'css' )->click();

        # wait for ajax response to fill next dropdown list with more than 1 value
        $Selenium->WaitFor( JavaScript => "return \$('#ExpressionID-NEW-AttributeID option').length > 1;" );
        $Selenium->find_element( "#ExpressionID-NEW-AttributeID option[value='$ExpresionAttributeID']", 'css' )
            ->click();

        # wait for ajax response to fill next dropdown list with more than 1 value
        $Selenium->WaitFor( JavaScript => "return \$('#ExpressionID-NEW-OperatorID option').length > 1;" );
        $Selenium->find_element( "#ExpressionID-NEW-OperatorID option[value='1']", 'css' )->click();

        # wait for ajax response to fill next dropdown list with more than 1 value
        $Selenium->WaitFor( JavaScript => "return \$('#ExpressionID-NEW-CompareValue option').length > 1;" );
        $Selenium->find_element( "#ExpressionID-NEW-CompareValue option[value='$PriorityDataRef->{ItemID}']", 'css' )
            ->click();

        # add new action in change object for test change, set change state on 'Approved'
        $Selenium->find_element("//button[\@name='AddActionButton'][\@type='submit']")->VerifiedClick();
        $Selenium->find_element( "#ActionID-NEW-ObjectID option[value='1']", 'css' )->click();

        # wait for ajax response to fill next dropdown list with more than 1 value
        $Selenium->WaitFor( JavaScript => "return \$('#ActionID-NEW-Selector option').length > 1;" );
        $Selenium->find_element( "#ActionID-NEW-Selector option[value='$ChangeID']", 'css' )->click();

        # wait for ajax response to fill next dropdown list with more than 1 value
        $Selenium->WaitFor( JavaScript => "return \$('#ActionID-NEW-AttributeID option').length > 1;" );
        $Selenium->find_element( "#ActionID-NEW-AttributeID option[value='$ActionAttributeID']", 'css' )->click();

        # wait for ajax response to fill next dropdown list with more than 1 value
        $Selenium->WaitFor( JavaScript => "return \$('#ActionID-NEW-OperatorID option').length > 1;" );
        $Selenium->find_element( "#ActionID-NEW-OperatorID option[value='$ActionOperatorID']", 'css' )->click();

        # wait for ajax response to fill next dropdown list with more than 1 value
        $Selenium->WaitFor( JavaScript => "return \$('#ActionID-NEW-ActionValue option').length > 1;" );
        $Selenium->find_element(
            "#ActionID-NEW-ActionValue option[value='$ConditionChangeStateDataRef->{ItemID}']",
            'css'
        )->click();

        $Selenium->find_element( "#SaveButton", 'css' )->VerifiedClick();

        # verify created condition name value
        $Self->True(
            index( $Selenium->get_page_source(), $ConditionNameRandom ) > -1,
            "$ConditionNameRandom is found",
        );

        # delete test created change
        my $Success = $ChangeObject->ChangeDelete(
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
