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

        # create test service
        my $ServiceName = "Service" . $Helper->GetRandomID();
        my $ServiceID   = $Kernel::OM->Get('Kernel::System::Service')->ServiceAdd(
            Name        => $ServiceName,
            ValidID     => 1,
            Comment     => 'Selenium Test Service',
            UserID      => 1,
            TypeID      => 2,
            Criticality => '3 normal',
        );
        $Self->True(
            $ServiceID,
            "Service is created - ID $ServiceID",
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentITSMServiceZoom screen with no ServiceID, expecting error message screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMServiceZoom;ServiceID=");
        $Self->True(
            index( $Selenium->get_page_source(), 'No ServiceID is given!' ) > -1,
            "Error message without service ID - found",
        );

        # navigate to AgentITSMServiceZoom screen with wrong ServiceID, expecting error message screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMServiceZoom;ServiceID=asd");
        $Self->True(
            index( $Selenium->get_page_source(), 'ServiceID asd not found in database!' ) > -1,
            "Error message with wrong service ID - found",
        );

        # navigate to AgentITSMServiceZoom screen with correct ServiceID
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMServiceZoom;ServiceID=$ServiceID");

        # check for AgentITSMServiceZoom fields
        my @ElementList = ( 'ContentColumn', 'SidebarColumn' );
        for my $ElementCheck (@ElementList) {
            my $Element = $Selenium->find_element( ".$ElementCheck", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }
        $Self->True(
            index( $Selenium->get_page_source(), "Service: $ServiceName" ) > -1,
            "Service: $ServiceName - found",
        );

        # get DB object
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        # delete test service preferences
        my $Success = $DBObject->Do(
            SQL => "DELETE FROM service_preferences WHERE service_id = $ServiceID",
        );
        $Self->True(
            $Success,
            "Service preferences is deleted - ID $ServiceID",
        );

        # delete test service
        $Success = $DBObject->Do(
            SQL => "DELETE FROM service WHERE id = $ServiceID",
        );
        $Self->True(
            $Success,
            "Service is deleted - ID $ServiceID",
        );

        # make sure cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
            Type => 'Service'
        );
    }
);

1;
