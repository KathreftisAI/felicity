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

        # get change delete menu module default config
        my %ChangeDeleteMenu = $Kernel::OM->Get('Kernel::System::SysConfig')->ConfigItemGet(
            Name    => 'ITSMChange::Frontend::MenuModule###100-ChangeDelete',
            Default => 1,
        );

        # set change delete menu module to valid
        my %ChangeDeleteMenuUpdate = map { $_->{Key} => $_->{Content} }
            grep { defined $_->{Key} } @{ $ChangeDeleteMenu{Setting}->[1]->{Hash}->[1]->{Item} };

        $Helper->ConfigSettingChange(
            Key   => 'ITSMChange::Frontend::MenuModule###100-ChangeDelete',
            Value => \%ChangeDeleteMenuUpdate,
            Valid => 1,
        );

        # get AgentITSMChangeDelete frontend module sysconfig
        my %ChangeDeleteFrontendUpdate = (
            'Description' => 'Delete a change',
            'GroupRo'     => [
                'itsm-change-manager'
            ],
            'NavBarName' => 'ITSM Change',
            'Title'      => 'Delete'
        );

        # set AgentITSMChangeDelete frontend module on valid
        $Helper->ConfigSettingChange(
            Key   => 'Frontend::Module###AgentITSMChangeDelete',
            Value => \%ChangeDeleteFrontendUpdate,
            Valid => 1,
        );

        # get general catalog object
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
            Description   => "Test Description",
            Justification => "Test Justification",
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

        # navigate to AgentITSMChange screen with requested filter and ordered down
        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AgentITSMChange;SortBy=ChangeNumber;OrderBy=Down;View=;Filter=requested"
        );

        # verify that test created change is present
        $Self->True(
            index( $Selenium->get_page_source(), $ChangeTitleRandom ) > -1,
            "$ChangeTitleRandom is found",
        );

        # click on test created change
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMChangeZoom;ChangeID=$ChangeID')]")
            ->VerifiedClick();

        # click on 'Delete'
        $Selenium->find_element("//a[contains(\@href, \'Action=AgentITSMChangeDelete;ChangeID=$ChangeID')]")->click();

        sleep 2;

        # wait for confirm button to show up and confirm delete action
        $Selenium->WaitFor(
            JavaScript =>
                "return (\$('.Dialog button.Primary.CallForAction:visible').length && \$('fieldset.TableLike').length);"
        );

        # waiting for javascript bindings
        sleep 1;

        $Selenium->find_element( ".Dialog button.Primary.CallForAction", 'css' )->VerifiedClick();

        # get the change number of the deleted change (must not exist)
        my $ChangeNumber = $ChangeObject->ChangeLookup(
            ChangeID => $ChangeID,
        );

        # verify that test created change is deleted
        $Self->False(
            $ChangeNumber,
            "$ChangeTitleRandom successfully deleted",
        );

        # make sure cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );
    }
);

1;
