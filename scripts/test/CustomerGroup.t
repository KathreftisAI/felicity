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

use Kernel::System::VariableCheck qw(:all);

# get config object
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

$ConfigObject->Set(
    Key   => 'CustomerGroupAlwaysGroups',
    Value => [],
);
$ConfigObject->Set(
    Key   => 'CustomerGroupSupport',
    Value => 1,
);

# create local objects
my $CustomerGroupObject = $Kernel::OM->Get('Kernel::System::CustomerGroup');
my $CustomerUserObject  = $Kernel::OM->Get('Kernel::System::CustomerUser');
my $GroupObject         = $Kernel::OM->Get('Kernel::System::Group');

my $RandomID = $Helper->GetRandomID();
my $UserID   = 1;
my $UID      = $RandomID;
my $GID1     = 1;
my $GID2     = 2;
my $GID3     = 3;

#
# Tests for GroupMemberAdd()
#
my @Tests = (
    {
        Name    => 'Empty params',
        Config  => {},
        Success => 0,
    },
    {
        Name   => 'No GID',
        Config => {
            GID        => undef,
            UID        => $UID,
            Permission => {
                ro => 1,
            },
            UserID => $UserID,
        },
        Success => 0,
    },
    {
        Name   => 'No UID',
        Config => {
            GID        => $GID1,
            UID        => undef,
            Permission => {
                ro => 1,
            },
            UserID => $UserID,
        },
        Success => 0,
    },
    {
        Name   => 'No permission',
        Config => {
            GID        => $GID1,
            UID        => $UID,
            Permission => undef,
            UserID     => $UserID,
        },
        Success => 0,
    },
    {
        Name   => 'Empty permission',
        Config => {
            GID        => $GID1,
            UID        => $UID,
            Permission => {},
            UserID     => $UserID,
        },
        Success => 1,
    },
    {
        Name   => 'ro permission',
        Config => {
            GID        => $GID1,
            UID        => $UID,
            Permission => {
                ro => 1,
            },
            UserID => $UserID,
        },
        Success => 1,
    },
    {
        Name   => 'ro move_into permission',
        Config => {
            GID        => $GID1,
            UID        => $UID,
            Permission => {
                ro        => 1,
                move_into => 1,
            },
            UserID => $UserID,
        },
        Success => 1,
    },
    {
        Name   => 'ro move_into rw permission',
        Config => {
            GID        => $GID1,
            UID        => $UID,
            Permission => {
                ro        => 1,
                move_into => 1,
                rw        => 1,
            },
            UserID => $UserID,
        },
        Success => 1,
    },
);

for my $Test (@Tests) {

    my $MemberAddSuccess = $CustomerGroupObject->GroupMemberAdd( %{ $Test->{Config} } );

    if ( $Test->{Success} ) {

        # create permission string
        my @Permissions;

        PERMISSION:
        for my $Permission ( sort keys %{ $Test->{Config}->{Permission} } ) {
            next PERMISSION if !$Test->{Config}->{Permission}->{$Permission};

            push @Permissions, $Permission;
        }
        my $PermissionsStrg = join ',', @Permissions;

        $Self->True(
            $MemberAddSuccess,
            "GroupMemberAdd() Test: $Test->{Name} - User: $Test->{Config}->{UID}, Group: $Test->{Config}->{GID}, Permissions:[$PermissionsStrg] with true",
        );

        PERMISSION:
        for my $Permission ( sort keys %{ $Test->{Config}->{Permission} } ) {

            next PERMISSION if !$Test->{Config}->{Permission}->{$Permission};

            # check results
            my @MemberList = $CustomerGroupObject->GroupMemberList(
                UserID => $Test->{Config}->{UID},
                Type   => $Permission,
                Result => 'ID',
            );

            $Self->IsDeeply(
                \@MemberList,
                [$GID1],
                "GroupMemberList() for GroupMemberAdd() $Test->{Name} - User: $Test->{Config}->{UID}",
            );
        }
    }
    else {
        $Self->False(
            $MemberAddSuccess,
            "GroupMemberAdd() Test: $Test->{Name} - with false",
        );
    }
}

# reset membership
my $ResetMembership = sub {
    my %Param = @_;

    $Param{UID} = $Param{UID} || $UID;

    my $Success = $CustomerGroupObject->GroupMemberAdd(
        GID        => $GID1,
        UID        => $Param{UID},
        Permission => {
            ro        => 0,
            move_into => 0,
            create    => 0,
            owner     => 0,
            priority  => 0,
            rw        => 0,
        },
        UserID => $UserID,
    );
    $Self->True(
        $Success,
        "GroupMemberAdd() reset for User: $Param{UID} Group: $GID1 - with true",
    );

    $Success = $CustomerGroupObject->GroupMemberAdd(
        GID        => $GID2,
        UID        => $Param{UID},
        Permission => {
            ro        => 0,
            move_into => 0,
            create    => 0,
            owner     => 0,
            priority  => 0,
            rw        => 0,
        },
        UserID => $UserID,
    );
    $Self->True(
        $Success,
        "GroupMemberAdd() reset for User: $Param{UID} Group: $GID2 - with true",
    );

    $Success = $CustomerGroupObject->GroupMemberAdd(
        GID        => $GID3,
        UID        => $Param{UID},
        Permission => {
            ro        => 0,
            move_into => 0,
            create    => 0,
            owner     => 0,
            priority  => 0,
            rw        => 0,
        },
        UserID => $UserID,
    );
    $Self->True(
        $Success,
        "GroupMemberAdd() reset for User: $Param{UID}, Group: $GID3 - with true",
    );

    for my $Permission (qw(ro move_into create owner priority rw)) {

        # check results
        my @MemberList = $CustomerGroupObject->GroupMemberList(
            UserID => $Param{UID},
            Type   => $Permission,
            Result => 'ID',
        );

        my @ExpectedResult;
        if ( IsArrayRefWithData( $Param{AlwaysGroups} ) ) {
            @ExpectedResult = ( $Param{GID} ),
        }

        $Self->IsDeeply(
            \@MemberList,
            \@ExpectedResult,
            "GroupMemberList() for GroupMemberAdd() reset for User: $Param{UID}",
        );
    }
};

# reset membership
$ResetMembership->(
    AlwaysGroups => $ConfigObject->Get('CustomerGroupAlwaysGroups'),
    GID          => $GID1,
);

# set AlwaysGroups
$ConfigObject->Set(
    Key   => 'CustomerGroupAlwaysGroups',
    Value => [ $GroupObject->GroupLookup( GroupID => $GID1 ) ],
);

# reset membership with AlwaysGroups
$ResetMembership->(
    AlwaysGroups => $ConfigObject->Get('CustomerGroupAlwaysGroups'),
    GID          => $GID1,
);

# remove AlwaysGroups
$ConfigObject->Set(
    Key   => 'CustomerGroupAlwaysGroups',
    Value => [],
);

# reset membership
$ResetMembership->(
    AlwaysGroups => $ConfigObject->Get('CustomerGroupAlwaysGroups'),
    GID          => $GID1,
);

#
# Tests for GroupMemberList()
#
@Tests = (
    {
        Name    => 'Empty params',
        Config  => {},
        Success => 0,
    },
    {
        Name   => 'No Type',
        Config => {
            Type    => undef,
            Result  => 'HASH',
            UserID  => $UID,
            GroupID => $GID1,
        },
        Success => 0,
    },
    {
        Name   => 'No Result',
        Config => {
            Type    => 'ro',
            Result  => undef,
            UserID  => $UID,
            GroupID => $GID1,
        },
        Success => 0,
    },
    {
        Name   => 'No UserID and GroupID',
        Config => {
            Type    => 'ro',
            Result  => 'Name',
            UserID  => undef,
            GroupID => undef,
        },
        Success => 0,
    },
    {
        Name   => 'Wrong UserID Array',
        Config => {
            Type    => 'ro',
            Result  => 'Name',
            UserID  => 'Nonexistent' . $RandomID,
            GroupID => undef,
        },
        ExpectedResult => [],
        Success        => 1,
    },
    {
        Name   => 'Wrong UserID Hash',
        Config => {
            Type    => 'ro',
            Result  => 'HASH',
            UserID  => 'Nonexistent' . $RandomID,
            GroupID => undef,
        },
        ExpectedResult => {},
        Success        => 1,
    },
    {
        Name   => 'Wrong GroupID Array',
        Config => {
            Type    => 'ro',
            Result  => 'ID',
            UserID  => undef,
            GroupID => 99999999,
        },
        ExpectedResult => [],
        Success        => 1,
    },
    {
        Name   => 'Wrong GroupID Hash',
        Config => {
            Type    => 'ro',
            Result  => 'HASH',
            UserID  => undef,
            GroupID => 99999999,
        },
        ExpectedResult => {},
        Success        => 1,
    },
    {
        Name   => 'Wrong Type Array',
        Config => {
            Type    => 'ro',
            Result  => 'Name',
            UserID  => $UID,
            GroupID => undef,
        },
        AddConfig => [
            {
                GID        => $GID1,
                UID        => $UID,
                Permission => {
                    ro        => 0,
                    move_into => 1,
                    create    => 0,
                    owner     => 0,
                    priority  => 0,
                    rw        => 0,
                },
                UserID => $UserID,
            },
        ],
        ExpectedResult  => [],
        Success         => 1,
        ResetMembership => 0,
    },
    {
        Name   => 'Wrong Type Hash',
        Config => {
            Type    => 'ro',
            Result  => 'HASH',
            UserID  => $UID,
            GroupID => undef,
        },
        ExpectedResult  => {},
        Success         => 1,
        ResetMembership => 1,
    },
    {
        Name   => '1 With UserID - Result Name',
        Config => {
            Type    => 'ro',
            Result  => 'Name',
            UserID  => $UID,
            GroupID => undef,
        },
        AddConfig => [
            {
                GID        => $GID1,
                UID        => $UID,
                Permission => {
                    ro        => 1,
                    move_into => 0,
                    create    => 0,
                    owner     => 0,
                    priority  => 0,
                    rw        => 0,
                },
                UserID => $UserID,
            },
        ],
        ExpectedResult  => [ $GroupObject->GroupLookup( GroupID => $GID1 ) ],
        Success         => 1,
        ResetMembership => 0,
    },
    {
        Name   => '1 With UserID - Result ID',
        Config => {
            Type    => 'ro',
            Result  => 'ID',
            UserID  => $UID,
            GroupID => undef,
        },
        ExpectedResult  => [$GID1],
        Success         => 1,
        ResetMembership => 0,
    },
    {
        Name   => '1 With UserID - Result HASH',
        Config => {
            Type    => 'ro',
            Result  => 'HASH',
            UserID  => $UID,
            GroupID => undef,
        },
        ExpectedResult => {
            $GID1 => $GroupObject->GroupLookup( GroupID => $GID1 ),
        },
        Success         => 1,
        ResetMembership => 1,
    },
    {
        Name   => '1 With GroupID - Result Name',
        Config => {
            Type    => 'ro',
            Result  => 'Name',
            UserID  => undef,
            GroupID => $GID1,
        },
        AddConfig => [
            {
                GID        => $GID1,
                UID        => $UID,
                Permission => {
                    ro        => 1,
                    move_into => 0,
                    create    => 0,
                    owner     => 0,
                    priority  => 0,
                    rw        => 0,
                },
                UserID => $UserID,
            },
        ],
        ExpectedResult  => [ $GroupObject->GroupLookup( GroupID => $GID1 ) ],
        Success         => 1,
        ResetMembership => 0,
    },
    {
        Name   => '1 With GroupID - Result ID',
        Config => {
            Type    => 'ro',
            Result  => 'ID',
            UserID  => undef,
            GroupID => $GID1,
        },
        ExpectedResult  => [$UID],
        Success         => 1,
        ResetMembership => 0,
    },
    {
        Name   => '1 With GroupID - Result HASH',
        Config => {
            Type    => 'ro',
            Result  => 'HASH',
            UserID  => undef,
            GroupID => $GID1,
        },
        ExpectedResult => {
            $UID => $GroupObject->GroupLookup( GroupID => $GID1 ),
        },
        Success         => 1,
        ResetMembership => 1,
    },
    {
        Name   => 'Multiple With UserID - Result Name',
        Config => {
            Type    => 'ro',
            Result  => 'Name',
            UserID  => $UID,
            GroupID => undef,
        },
        AddConfig => [
            {
                GID        => $GID1,
                UID        => $UID,
                Permission => {
                    ro        => 1,
                    move_into => 0,
                    create    => 0,
                    owner     => 0,
                    priority  => 0,
                    rw        => 0,
                },
                UserID => $UserID,
            },
            {
                GID        => $GID2,
                UID        => $UID,
                Permission => {
                    ro        => 1,
                    move_into => 0,
                    create    => 0,
                    owner     => 0,
                    priority  => 0,
                    rw        => 0,
                },
                UserID => $UserID,
            },
            {
                GID        => $GID3,
                UID        => $UID,
                Permission => {
                    ro        => 1,
                    move_into => 0,
                    create    => 0,
                    owner     => 0,
                    priority  => 0,
                    rw        => 0,
                },
                UserID => $UserID,
            },
        ],
        ExpectedResult => [
            $GroupObject->GroupLookup( GroupID => $GID1 ),
            $GroupObject->GroupLookup( GroupID => $GID2 ),
            $GroupObject->GroupLookup( GroupID => $GID3 ),
        ],
        Success         => 1,
        ResetMembership => 0,
    },
    {
        Name   => 'Multiple With UserID - Result ID',
        Config => {
            Type    => 'ro',
            Result  => 'ID',
            UserID  => $UID,
            GroupID => undef,
        },
        ExpectedResult => [
            $GID1,
            $GID2,
            $GID3,
        ],
        Success         => 1,
        ResetMembership => 0,
    },
    {
        Name   => 'Multiple With UserID - Result HASH',
        Config => {
            Type    => 'ro',
            Result  => 'HASH',
            UserID  => $UID,
            GroupID => undef,
        },
        ExpectedResult => {
            $GID1 => $GroupObject->GroupLookup( GroupID => $GID1 ),
            $GID2 => $GroupObject->GroupLookup( GroupID => $GID2 ),
            $GID3 => $GroupObject->GroupLookup( GroupID => $GID3 ),
        },
        Success         => 1,
        ResetMembership => 1,
    },
    {
        Name   => 'Multiple With GroupID - Result Name',
        Config => {
            Type    => 'ro',
            Result  => 'Name',
            UserID  => undef,
            GroupID => $GID1,
        },
        AddConfig => [
            {
                GID        => $GID1,
                UID        => $UID . '-1',
                Permission => {
                    ro        => 1,
                    move_into => 0,
                    create    => 0,
                    owner     => 0,
                    priority  => 0,
                    rw        => 0,
                },
                UserID => $UserID,
            },
            {
                GID        => $GID1,
                UID        => $UID . '-2',
                Permission => {
                    ro        => 1,
                    move_into => 0,
                    create    => 0,
                    owner     => 0,
                    priority  => 0,
                    rw        => 0,
                },
                UserID => $UserID,
            },
            {
                GID        => $GID1,
                UID        => $UID . '-3',
                Permission => {
                    ro        => 1,
                    move_into => 0,
                    create    => 0,
                    owner     => 0,
                    priority  => 0,
                    rw        => 0,
                },
                UserID => $UserID,
            },
        ],
        ExpectedResult => [
            $GroupObject->GroupLookup( GroupID => $GID1 ),
            $GroupObject->GroupLookup( GroupID => $GID1 ),
            $GroupObject->GroupLookup( GroupID => $GID1 ),
        ],
        Success         => 1,
        ResetMembership => 0,
    },
    {
        Name   => 'Multiple With GroupID - Result ID',
        Config => {
            Type    => 'ro',
            Result  => 'ID',
            UserID  => undef,
            GroupID => $GID1,
        },
        ExpectedResult => [
            $UID . '-1',
            $UID . '-2',
            $UID . '-3',
        ],
        Success         => 1,
        ResetMembership => 0,
    },
    {
        Name   => 'Multiple With GroupID - Result HASH',
        Config => {
            Type    => 'ro',
            Result  => 'HASH',
            UserID  => undef,
            GroupID => $GID1,
        },
        ExpectedResult => {
            $UID . '-1' => $GroupObject->GroupLookup( GroupID => $GID1 ),
            $UID . '-2' => $GroupObject->GroupLookup( GroupID => $GID1 ),
            $UID . '-3' => $GroupObject->GroupLookup( GroupID => $GID1 ),
        },
        Success         => 1,
        ResetMembership => 1,
        ResetAllUsers   => 1,
    },
);

for my $Test (@Tests) {

    for my $AddConfig ( @{ $Test->{AddConfig} } ) {
        my $Success = $CustomerGroupObject->GroupMemberAdd( %{$AddConfig} );

        $Self->True(
            $Success,
            "GroupMemberAdd() for GroupMemberList() Test:$Test->{Name}",
        );
    }

    my $MemberList;
    if ( $Test->{Config}->{Result} && $Test->{Config}->{Result} eq 'HASH' ) {
        %{$MemberList} = $CustomerGroupObject->GroupMemberList( %{ $Test->{Config} } );
    }
    elsif (
        $Test->{Config}->{Result}
        && ( $Test->{Config}->{Result} eq 'Name' || $Test->{Config}->{Result} eq 'ID' )
        )
    {
        @{$MemberList} = $CustomerGroupObject->GroupMemberList( %{ $Test->{Config} } );
    }
    else {
        $MemberList = $CustomerGroupObject->GroupMemberList( %{ $Test->{Config} } );
    }

    if ( $Test->{Success} ) {

        if ( ref $MemberList eq 'ARRAY' ) {
            my @SortedExpected   = sort @{ $Test->{ExpectedResult} };
            my @SortedMemberList = sort @{$MemberList};
            $Self->IsDeeply(
                \@SortedMemberList,
                \@SortedExpected,
                "GroupMemberList() $Test->{Name} for User: $UID",
            );
        }
        else {
            $Self->IsDeeply(
                $MemberList,
                $Test->{ExpectedResult},
                "GroupMemberList() $Test->{Name} for User: $UID",
            );

        }

        # reset membership if needed
        if ( $Test->{ResetMembership} && $Test->{ResetAllUsers} ) {
            $ResetMembership->();
            $ResetMembership->( UID => $UID . '-1' );
            $ResetMembership->( UID => $UID . '-2' );
            $ResetMembership->( UID => $UID . '-3' );
        }
        elsif ( $Test->{ResetMembership} ) {
            $ResetMembership->();
        }
    }
    else {
        if ( ref $MemberList eq 'HASH' ) {
            $Self->IsDeeply(
                $MemberList,
                {},
                "GroupMemberList() Test: $Test->{Name}",
            );
        }
        elsif ( ref $MemberList eq 'ARRAY' ) {
            $Self->IsDeeply(
                $MemberList,
                [],
                "GroupMemberList() Test: $Test->{Name}",
            );
        }
        else {
            $Self->Is(
                $MemberList,
                undef,
                "GroupMemberList() Test: $Test->{Name}",
            );
        }
    }
}

#
# Tests for GroupLookup()
#
@Tests = (
    {
        Name    => 'Empty params',
        Config  => {},
        Success => 0,
    },
    {
        Name   => 'No Group and GroupID',
        Config => {
            Group   => undef,
            GroupID => undef,
        },
        Success => 0,
    },
    {
        Name   => 'Wrong Group',
        Config => {
            Group   => 'Nonexistent' . $RandomID,
            GroupID => undef,
        },
        ExpectedResults => '',
        Success         => 1,
    },
    {
        Name   => 'Wrong GroupID',
        Config => {
            Group   => undef,
            GroupID => 99999999,
        },
        ExpectedResults => '',
        Success         => 1,
    },
    {
        Name   => 'Correct Group',
        Config => {
            Group   => $GroupObject->GroupLookup( GroupID => $GID1 ),
            GroupID => undef,
        },
        ExpectedResult => $GID1,
        Success        => 1,
    },
    {
        Name   => 'Correct GroupID',
        Config => {
            Group   => undef,
            GroupID => $GID1,
        },
        ExpectedResult => $GroupObject->GroupLookup( GroupID => $GID1 ),
        Success        => 1,
    },
);

for my $Test (@Tests) {

    my $Result = $CustomerGroupObject->GroupLookup( %{ $Test->{Config} } );

    if ( $Test->{Success} ) {

        $Self->Is(
            $Result,
            $Test->{ExpectedResult},
            "GroupLookup() Test:$Test->{Name}",
        );
    }
    else {
        $Self->Is(
            $Result,
            undef,
            "GroupLookup() Test:$Test->{Name}",
        );
    }
}

# Disable email checks
$ConfigObject->Set(
    Key   => 'CheckEmailAddresses',
    Value => 0,
);
$ConfigObject->Set(
    Key   => 'CheckMXRecord',
    Value => 0,
);

# create 2 customer users
my $CustomerUser1 = $CustomerUserObject->CustomerUserAdd(
    Source         => 'CustomerUser',
    UserFirstname  => 'John 1',
    UserLastname   => 'Doe',
    UserCustomerID => 'jdoe1',
    UserLogin      => 'jdoe1',
    UserEmail      => 'jdoe1@example.com',
    ValidID        => 1,
    UserID         => 1,
);
$Self->True(
    $CustomerUser1,
    "Customer user #1 created."
);
my $CustomerUser2 = $CustomerUserObject->CustomerUserAdd(
    Source         => 'CustomerUser',
    UserFirstname  => 'John 2',
    UserLastname   => 'Doe',
    UserCustomerID => 'jdoe2',
    UserLogin      => 'jdoe2',
    UserEmail      => 'jdoe2@example.com',
    ValidID        => 1,
    UserID         => 1,
);
$Self->True(
    $CustomerUser2,
    "Customer user #2 created."
);
my $GroupID2 = $GroupObject->GroupAdd(
    Name    => 'Test_customer_group_#1',
    ValidID => 1,
    UserID  => 1,
);
$Self->True(
    $GroupID2,
    "Customer Group created."
);
my $SuccessGroupMemberAdd1 = $CustomerGroupObject->GroupMemberAdd(
    GID        => $GroupID2,
    UID        => $CustomerUser1,
    Permission => {
        ro        => 1,
        move_into => 1,
        create    => 1,
        owner     => 1,
        priority  => 0,
        rw        => 0,
    },
    UserID => 1,
);
$Self->True(
    $SuccessGroupMemberAdd1,
    "Customer #1 added to the group."
);
my $SuccessGroupMemberAdd2 = $CustomerGroupObject->GroupMemberAdd(
    GID        => $GroupID2,
    UID        => $CustomerUser2,
    Permission => {
        ro        => 1,
        move_into => 1,
        create    => 1,
        owner     => 1,
        priority  => 0,
        rw        => 0,
    },
    UserID => 1,
);
$Self->True(
    $SuccessGroupMemberAdd2,
    "Customer #2 added to the group."
);

# First get members while both users are Valid
my @Members1 = $CustomerGroupObject->GroupMemberList(
    GroupID => $GroupID2,
    Result  => 'ID',
    Type    => 'ro',
);

@Members1 = sort { $a cmp $b } @Members1;

$Self->IsDeeply(
    \@Members1,
    [
        'jdoe1',
        'jdoe2'
    ],
    "GroupMemberList() - 2 Customer users."
);

# set 2nd user to invalid state
my $CustomerUserInvalid = $CustomerUserObject->CustomerUserUpdate(
    Source         => 'CustomerUser',
    ID             => $CustomerUser2,
    UserCustomerID => $CustomerUser2,
    UserLogin      => 'jdoe2',               # new user login
    UserFirstname  => 'John 2',
    UserLastname   => 'Doe',
    UserEmail      => 'jdoe2@example.com',
    ValidID        => 2,
    UserID         => 1,
);
$Self->True(
    $CustomerUserInvalid,
    "Set 2nd Customer user to invalid",
);

# Get group members again
my @Members2 = $CustomerGroupObject->GroupMemberList(
    GroupID => $GroupID2,
    Result  => 'ID',
    Type    => 'ro',
);

$Self->IsDeeply(
    \@Members2,
    [
        'jdoe1',
    ],
    "GroupMemberList() - 2 Customer users."
);

# cleanup is done by RestoreDatabase

1;
