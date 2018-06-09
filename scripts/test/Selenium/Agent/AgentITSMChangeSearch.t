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
        my $ChangeDataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
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
            Justification => 'Selenium Test Justification',
            ChangeStateID => $ChangeDataRef->{ItemID},
            UserID        => 1,
        );
        $Self->True(
            $ChangeID,
            "$ChangeTitleRandom is created",
        );

        # get test created change data
        my $ChangeData = $ChangeObject->ChangeGet(
            ChangeID => $ChangeID,
            UserID   => 1,
        );

        # create and log in builder user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change', 'itsm-change-manager' ],
        ) || die "Did not get test builder user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # click on AgentITSMChangeSearch
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMChangeSearch");

        # wait until form and overlay has loaded, if necessary
        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#SearchProfile').length" );

        # check change search page
        for my $ID (
            qw(SearchProfile SearchProfileNew Attribute ResultForm SearchFormSubmit)
            )
        {
            my $Element = $Selenium->find_element( "#$ID", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }

        # input change title and number as search param and run it
        $Selenium->find_element("//a[\@class='AddButton']")->click();
        $Selenium->find_element( "ChangeNumber", 'name' )->send_keys( $ChangeData->{ChangeNumber} );
        $Selenium->find_element( "ChangeTitle",  'name' )->send_keys( $ChangeData->{ChangeTitle} );
        $Selenium->find_element( "ChangeTitle",  'name' )->VerifiedSubmit();

        # check for expected result
        $Self->True(
            index( $Selenium->get_page_source(), $ChangeTitleRandom ) > -1,
            "$ChangeTitleRandom is found",
        );

        # input wrong search parameters, result should be 'No data found'
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMChangeSearch");

        # wait until form and overlay has loaded, if necessary
        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function' && \$('#SearchProfile').length" );

        $Selenium->find_element( "ChangeNumber", 'name' )->send_keys("123455678");
        $Selenium->find_element( "ChangeNumber", 'name' )->VerifiedSubmit();

        # check for expected result
        $Self->True(
            index( $Selenium->get_page_source(), "No data found." ) > -1,
            "Change is not found",
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
