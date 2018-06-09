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

        # create and log in test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-change' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # create and test change for each state in AgentITSMChange screen
        for my $ChangeState (
            'requested',   'pending approval', 'rejected', 'approved', 'in progress',
            'pending pir', 'successful',       'failed',   'canceled', 'retracted'
            )
        {

            # get change state data
            my $ChangeStateDataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
                Class => 'ITSM::ChangeManagement::Change::State',
                Name  => $ChangeState,
            );

            # get change object
            my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

            # create test change
            my $ChangeTitleRandom = 'ITSMChange ' . $ChangeState . ' ' . $Helper->GetRandomID();
            my $ChangeID          = $ChangeObject->ChangeAdd(
                ChangeTitle   => $ChangeTitleRandom,
                Description   => 'Selenium Test Description',
                Justification => 'Selenium Test Justification',
                ChangeStateID => $ChangeStateDataRef->{ItemID},
                UserID        => 1,
            );
            $Self->True(
                $ChangeID,
                "Change in $ChangeState state is created",
            );

            # navigate to AgentITSMChange screen
            $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMChange;SortBy=ChangeNumber;OrderBy=Down");

            if ( $ChangeState eq 'pending approval' ) {

                # click on appropriate filter
                $Selenium->find_element("//a[contains(\@href, \'Filter=pending%20approval' )]")->VerifiedClick();

            }
            elsif ( $ChangeState eq 'in progress' ) {

                # click on appropriate filter
                $Selenium->find_element("//a[contains(\@href, \'Filter=in%20progress' )]")->VerifiedClick();

            }
            elsif ( $ChangeState eq 'pending pir' ) {

                # click on appropriate filter
                $Selenium->find_element("//a[contains(\@href, \'Filter=pending%20pir' )]")->VerifiedClick();

            }
            else {

                # click on appropriate filter
                $Selenium->find_element("//a[contains(\@href, \'Filter=$ChangeState' )]")->VerifiedClick();
            }

            # check screen
            $Selenium->find_element( "table",             'css' );
            $Selenium->find_element( "table thead tr th", 'css' );
            $Selenium->find_element( "table tbody tr td", 'css' );

            # check for test created change
            $Self->True(
                index( $Selenium->get_page_source(), $ChangeTitleRandom ) > -1,
                "$ChangeTitleRandom is found",
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
        }

        # make sure the cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp( Type => 'ITSMChange*' );
    }
);

1;
