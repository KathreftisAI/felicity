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

        # navigate to AdminITSMStateMachine screen
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminITSMStateMachine");

        # check screen
        $Selenium->find_element( "table",             'css' );
        $Selenium->find_element( "table thead tr th", 'css' );
        $Selenium->find_element( "table tbody tr td", 'css' );

        # get state machine object
        my $StateMachineObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMStateMachine');

        # check for default class state machine
        for my $StateMachine (qw(Change WorkOrder)) {

            my $Element = $Selenium->find_element(
                "//a[contains(\@href, \'Class=ITSM%3A%3AChangeManagement%3A%3A$StateMachine%3A%3AState' )]"
            );
            $Element->is_enabled();
            $Element->is_displayed();
            $Element->click();

            # check screen
            $Selenium->find_element( "table",             'css' );
            $Selenium->find_element( "table thead tr th", 'css' );
            $Selenium->find_element( "table tbody tr td", 'css' );

            my $StateTransitionsRef = $StateMachineObject->StateTransitionList(
                Class => 'ITSM::ChangeManagement::' . $StateMachine . '::State',
            );

            # check default states and there links
            for my $StateID ( sort keys %{$StateTransitionsRef} ) {
                for my $NextStateID ( @{ $StateTransitionsRef->{$StateID} } ) {

                    $Element = $Selenium->find_element(
                        "//a[contains(\@href, \'StateID=$StateID;NextStateID=$NextStateID' )]"
                    );
                    $Element->is_enabled();
                    $Element->is_displayed();
                }
            }

            # return back to AdminITSMStateMachine overview scrreen
            $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminITSMStateMachine");
        }
    }
);

1;
