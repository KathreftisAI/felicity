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
            Name    => $SLAName,
            ValidID => 1,
            Comment => 'Selenium test SLA',
            TypeID  => 2,
            UserID  => 1,
        );
        $Self->True(
            $SLAID,
            "SLA is created - ID $SLAID",
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentITSMSLA screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMSLA");

        # check overview screen
        $Selenium->find_element( "table",             'css' );
        $Selenium->find_element( "table thead tr th", 'css' );
        $Selenium->find_element( "table tbody tr td", 'css' );

        # check for link to AgentITSMSLAZoom screen
        $Self->True(
            index( $Selenium->get_page_source(), "Action=AgentITSMSLAZoom;SLAID=$SLAID" ) > -1,
            "Link to AgentITSMSLAZoom for SLA ID $SLAID - found",
        );

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
