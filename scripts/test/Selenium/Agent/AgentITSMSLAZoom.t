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
            Groups => [ 'admin', 'itsm-service' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # create test SLA
        my $SLAName = "SLA" . $Helper->GetRandomID();
        my $SLAID   = $Kernel::OM->Get('Kernel::System::SLA')->SLAAdd(
            Name              => $SLAName,
            ValidID           => 1,
            FirstResponseTime => 120,
            UpdateTime        => 180,
            SolutionTime      => 580,
            Comment           => 'Selenium test SLA',
            TypeID            => 2,
            UserID            => 1,
        );
        $Self->True(
            $SLAID,
            "SLA is created - ID $SLAID",
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentITSMSLAZoom screen with no SLAID, expecting error message screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMSLAZoom;SLAID=");
        $Self->True(
            index( $Selenium->get_page_source(), 'No SLAID is given!' ) > -1,
            "Error message without SLA ID - found",
        );

        # navigate to AgentITSMSLAZoom screen with wrong SLAID, expecting error message screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMSLAZoom;SLAID=asd");
        $Self->True(
            index( $Selenium->get_page_source(), 'SLAID asd not found in database!' ) > -1,
            "Error message with wrong SLA ID - found",
        );

        # navigate to AgentITSMSLAZoom screen with correct SLAID
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMSLAZoom;SLAID=$SLAID");

        # check for AgentITSMSLAZoom fields
        my @ElementList = ( 'ContentColumn', 'SidebarColumn' );
        for my $ElementCheck (@ElementList) {
            my $Element = $Selenium->find_element( ".$ElementCheck", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }
        $Self->True(
            index( $Selenium->get_page_source(), "SLA: $SLAName" ) > -1,
            "SLA: $SLAName - found",
        );

        # check for respond times
        my @RespondTime = ( 120, 180, 580 );
        for my $Time (@RespondTime) {
            $Self->True(
                index( $Selenium->get_page_source(), $Time . " minutes" ) > -1,
                "Respond $Time minutes - found",
            );
        }

        # delete test SLA
        my $Success = $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL => "DELETE FROM sla WHERE id = $SLAID",
        );
        $Self->True(
            $Success,
            "SLA is deleted - ID $SLAID",
        );

        # make sure cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
            Type => 'SLA'
        );
    }
);

1;
