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

        # create test user and login
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => ['admin'],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        #add test role
        my $RoleName = $Helper->GetRandomID();
        my $RoleID   = $Kernel::OM->Get('Kernel::System::Group')->RoleAdd(
            Name    => $RoleName,
            ValidID => 1,
            UserID  => 1,
        );
        $Self->True(
            $RoleID,
            "Created Role - $RoleName",
        );

        # add test group
        my $GroupName = $Helper->GetRandomID();
        my $GroupID   = $Kernel::OM->Get('Kernel::System::Group')->GroupAdd(
            Name    => $GroupName,
            ValidID => 1,
            UserID  => 1,
        );
        $Self->True(
            $GroupID,
            "Created Group - $RoleName",
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AdminRoleGroup screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminRoleGroup");

        # check overview AdminRoleGroup
        $Selenium->find_element( "#Roles",  'css' );
        $Selenium->find_element( "#Groups", 'css' );

        $Self->True(
            index( $Selenium->get_page_source(), $RoleName ) > -1,
            "$RoleName role found on page",
        );

        $Self->True(
            index( $Selenium->get_page_source(), $GroupName ) > -1,
            "$GroupName group found on page",
        );

        # test filter for Roles
        $Selenium->find_element( "#FilterRoles", 'css' )->send_keys($RoleName);
        sleep 1;
        $Self->True(
            $Selenium->find_element( "$RoleName", 'link_text' )->is_displayed(),
            "$RoleName role found on page",
        );

        # test filter for Groups
        $Selenium->find_element( "#FilterGroups", 'css' )->send_keys($GroupName);
        sleep 1;
        $Self->True(
            $Selenium->find_element( "$GroupName", 'link_text' )->is_displayed(),
            "$GroupName group found on page",
        );

        # clear test filter for Roles and Groups
        $Selenium->find_element( "#FilterRoles",  'css' )->clear();
        $Selenium->find_element( "#FilterGroups", 'css' )->clear();
        sleep 1;

        # edit group relations for test role
        $Selenium->find_element( $RoleName, 'link_text' )->VerifiedClick();

        # set permissions
        for my $Permission (qw(ro note owner)) {
            $Selenium->find_element("//input[\@value='$GroupID'][\@name='$Permission']")->VerifiedClick();
        }

        $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

        my %TestFirst = (
            'ro'        => 1,
            'move_into' => 0,
            'create'    => 0,
            'note'      => 1,
            'owner'     => 1,
            'priority'  => 0,
            'rw'        => 0,
        );

        my %TestSecond = (
            'ro'        => 1,
            'move_into' => 1,
            'create'    => 1,
            'note'      => 0,
            'owner'     => 1,
            'priority'  => 1,
            'rw'        => 0,
        );

        # check edited test group permissions
        $Selenium->find_element( $RoleName, 'link_text' )->VerifiedClick();

        # check permissions
        for my $Permission ( sort keys %TestFirst ) {
            my $Enabled = $TestFirst{$Permission} ? 'enabled' : 'disabled';
            $Self->Is(
                $Selenium->find_element("//input[\@value='$GroupID'][\@name='$Permission']")->is_selected(),
                $TestFirst{$Permission},
                "$Permission permission for group $GroupName and role $RoleName is $Enabled",
            );
        }

        # test checked and unchecked values while filter by group is used
        # test filter with "WrongFilterGroup" to uncheck all values
        $Selenium->find_element( "#Filter", 'css' )->clear();
        $Selenium->find_element( "#Filter", 'css' )->send_keys("WrongFilterGroup");
        sleep 1;

        # test if no data is matches
        $Self->True(
            $Selenium->find_element( ".FilterMessage.Hidden>td", 'css' )->is_displayed(),
            "'No data matches' is displayed'"
        );
        $Selenium->find_element( "#Filter", 'css' )->clear();

        # check permissions
        for my $Permission ( sort keys %TestFirst ) {
            my $Enabled = $TestFirst{$Permission} ? 'enabled' : 'disabled';
            $Self->Is(
                $Selenium->find_element("//input[\@value='$GroupID'][\@name='$Permission']")->is_selected(),
                $TestFirst{$Permission},
                "$Permission permission for group $GroupName and role $RoleName is $Enabled",
            );
        }

        # navigate to AdminRoleGroup screen again
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminRoleGroup");

        # edit role relations for test group

        $Selenium->find_element( $GroupName, 'link_text' )->VerifiedClick();

        # set permissions
        for my $Permission (qw(note move_into priority create)) {
            $Selenium->find_element("//input[\@value='$RoleID'][\@name='$Permission']")->VerifiedClick();
        }
        $Selenium->find_element("//button[\@value='Submit'][\@type='submit']")->VerifiedClick();

        # check edited test group permissions
        $Selenium->find_element( $GroupName, 'link_text' )->VerifiedClick();

        # check permissions
        for my $Permission ( sort keys %TestSecond ) {
            my $Enabled = $TestSecond{$Permission} ? 'enabled' : 'disabled';
            $Self->Is(
                $Selenium->find_element("//input[\@value='$RoleID'][\@name='$Permission']")->is_selected(),
                $TestSecond{$Permission},
                "$Permission permission for group $GroupName and role $RoleName is $Enabled",
            );
        }

        # test checked and unchecked values while filter is used for Role
        # test filter with "WrongFilterRole" to uncheck all values
        $Selenium->find_element( "#Filter", 'css' )->clear();
        $Selenium->find_element( "#Filter", 'css' )->send_keys("WrongFilterRole");
        sleep 1;

        # test is no data matches
        $Self->True(
            $Selenium->find_element( ".FilterMessage.Hidden>td", 'css' )->is_displayed(),
            "'No data matches' is displayed'"
        );
        $Selenium->find_element( "#Filter", 'css' )->clear();

        # check role relations for group after using filter by role
        # check permissions
        for my $Permission ( sort keys %TestSecond ) {
            my $Enabled = $TestSecond{$Permission} ? 'enabled' : 'disabled';
            $Self->Is(
                $Selenium->find_element("//input[\@value='$RoleID'][\@name='$Permission']")->is_selected(),
                $TestSecond{$Permission},
                "$Permission permission for group $GroupName and role $RoleName is $Enabled",
            );
        }

        # since there are no tickets that rely on our test group and role, we can remove them again
        # from the DB
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
        if ($GroupID) {
            my $Success = $DBObject->Do(
                SQL => "DELETE FROM group_role WHERE group_id = $GroupID",
            );

            $Self->True(
                $Success,
                "GroupRoleDelete - for $GroupName",
            );

            $Success = $DBObject->Do(
                SQL => "DELETE FROM groups WHERE id = $GroupID",
            );

            $Self->True(
                $Success,
                "GroupDelete - $GroupName",
            );
        }

        if ($RoleID) {

            my $Success = $DBObject->Do(
                SQL => "DELETE FROM roles WHERE id = $RoleID",
            );

            $Self->True(
                $Success,
                "RoleDelete - $RoleName",
            );
        }

        # make sure the cache is correct.
        for my $Cache (
            qw (Group Role)
            )
        {
            $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
                Type => $Cache,
            );
        }
    }
);

1;
