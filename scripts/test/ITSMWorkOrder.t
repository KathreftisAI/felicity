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

use vars qw($Self);

use Data::Dumper;
use List::Util qw(max);

# ------------------------------------------------------------ #
# make preparations
# ------------------------------------------------------------ #
my $TestCount = 1;

# create common objects
my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');
my $DynamicFieldObject   = $Kernel::OM->Get('Kernel::System::DynamicField');
my $UserObject           = $Kernel::OM->Get('Kernel::System::User');
my $GroupObject          = $Kernel::OM->Get('Kernel::System::Group');
my $ValidObject          = $Kernel::OM->Get('Kernel::System::Valid');
my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
my $ChangeObject         = $Kernel::OM->Get('Kernel::System::ITSMChange');
my $WorkOrderObject      = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

# test if workorder object was created successfully
$Self->True(
    $WorkOrderObject,
    "Test " . $TestCount++ . ' - construction of workorder object',
);
$Self->Is(
    ref $WorkOrderObject,
    'Kernel::System::ITSMChange::ITSMWorkOrder',
    "Test " . $TestCount++ . ' - class of workorder object',
);

# test if change object was created successfully
$Self->True(
    $ChangeObject,
    "Test " . $TestCount++ . ' - construction of change object',
);
$Self->Is(
    ref $ChangeObject,
    'Kernel::System::ITSMChange',
    "Test " . $TestCount++ . ' - class of change object',
);

# ------------------------------------------------------------ #
# create needed users
# ------------------------------------------------------------ #
my @UserIDs;               # a list of existing and valid user ids
my @InvalidUserIDs;        # a list of existing but invalid user ids
my @NonExistingUserIDs;    # a list of non-existion user ids

# disable email checks to create new user
my $CheckEmailAddressesOrg = $ConfigObject->Get('CheckEmailAddresses');
if ( !defined $CheckEmailAddressesOrg ) {
    $CheckEmailAddressesOrg = 1;
}
$ConfigObject->Set(
    Key   => 'CheckEmailAddresses',
    Value => 0,
);

for my $Counter ( 1 .. 3 ) {

    # create new users for the tests
    my $UserID = $UserObject->UserAdd(
        UserFirstname => 'ITSMChange::ITSMWorkOrder' . $Counter,
        UserLastname  => 'UnitTest',
        UserLogin     => 'UnitTest-ITSMChange::ITSMWorkOrder-' . $Counter . int rand 1_000_000,
        UserEmail     => 'UnitTest-ITSMChange::ITSMWorkOrder-' . $Counter . '@localhost',
        ValidID       => $ValidObject->ValidLookup( Valid => 'valid' ),
        ChangeUserID  => 1,
    );
    push @UserIDs, $UserID;
}

# sort the user and customer user arrays
@UserIDs = sort @UserIDs;

# create non existing user IDs
for ( 1 .. 2 ) {
    LPC:
    for my $LoopProtectionCounter ( 1 .. 100 ) {

        # create a random user id
        my $TempNonExistingUserID = int rand 1_000_000;

        # check if random user id exists already
        my %UserData = $UserObject->GetUserData(
            UserID => $TempNonExistingUserID,
        );
        next LPC if %UserData;

        # we got an unused user ID
        push @NonExistingUserIDs, $TempNonExistingUserID;
        last LPC;
    }
}

# set 3rd user invalid
$UserObject->UserUpdate(
    $UserObject->GetUserData(
        UserID => $UserIDs[2],
    ),
    ValidID      => $ValidObject->ValidLookup( Valid => 'invalid' ),
    ChangeUserID => 1,
);
push @InvalidUserIDs, pop @UserIDs;

# restore original email check param
$ConfigObject->Set(
    Key   => 'CheckEmailAddresses',
    Value => $CheckEmailAddressesOrg,
);

# turn off SendNotifications, in order to avoid a lot of useless mails
my $SendNotificationsOrg = $ConfigObject->Get('ITSMChange::SendNotifcations');
$ConfigObject->Set(
    Key   => 'ITSMChange::SendNotifications',
    Value => 0,
);

# save original dynamic field configuration
my $OriginalDynamicFields = $DynamicFieldObject->DynamicFieldListGet(
    Valid => 0,
);

my $UniqueNamePrefix = 'UnitTestWorkorder' . int rand 1_000_000;

# create some dynamic fields for workorders
my @DynamicFields = (
    {
        Name       => $UniqueNamePrefix . 'Test1',
        Label      => $UniqueNamePrefix . 'Test1',
        FieldOrder => 10000,
        FieldType  => 'Text',
        ObjectType => 'ITSMWorkOrder',
        ValidID    => 1,
        UserID     => 1,
        Config     => {
            Name        => $UniqueNamePrefix . 'Test1',
            Description => 'Description for Dynamic Field.',
        },
    },
    {
        Name       => $UniqueNamePrefix . 'Test2',
        Label      => $UniqueNamePrefix . 'Test2',
        FieldOrder => 10000,
        FieldType  => 'Text',
        ObjectType => 'ITSMWorkOrder',
        ValidID    => 1,
        UserID     => 1,
        Config     => {
            Name        => $UniqueNamePrefix . 'Test2',
            Description => 'Description for Dynamic Field.',
        },
    },
    {
        Name       => $UniqueNamePrefix . 'Test3',
        Label      => $UniqueNamePrefix . 'Test3',
        FieldOrder => 10000,
        FieldType  => 'Text',
        ObjectType => 'ITSMWorkOrder',
        ValidID    => 1,
        UserID     => 1,
        Config     => {
            Name        => $UniqueNamePrefix . 'Test3',
            Description => 'Description for Dynamic Field.',
        },
    },
    {
        Name       => $UniqueNamePrefix . 'Test4',
        Label      => $UniqueNamePrefix . 'Test4',
        FieldOrder => 10000,
        FieldType  => 'Text',
        ObjectType => 'ITSMWorkOrder',
        ValidID    => 1,
        UserID     => 1,
        Config     => {
            Name        => $UniqueNamePrefix . 'Test4',
            Description => 'Description for Dynamic Field.',
        },
    },
);

my @DynamicFieldIDs;
for my $Test (@DynamicFields) {

    # add dynamic field
    my $DynamicFieldID = $DynamicFieldObject->DynamicFieldAdd(
        %{$Test},
    );

    $Self->True(
        $DynamicFieldID,
        "$Test->{Name} - DynamicFieldAdd()",
    );

    # remember id to delete it later
    push @DynamicFieldIDs, $DynamicFieldID;
}

# ------------------------------------------------------------ #
# test ITSMWorkOrder API
# ------------------------------------------------------------ #

# define public interface (in alphabetical order)
my @ObjectMethods = qw(
    Permission
    WorkOrderAdd
    WorkOrderAttachmentAdd
    WorkOrderAttachmentDelete
    WorkOrderAttachmentExists
    WorkOrderAttachmentGet
    WorkOrderAttachmentList
    WorkOrderChangeEffortsGet
    WorkOrderChangeTimeGet
    WorkOrderDelete
    WorkOrderGet
    WorkOrderList
    WorkOrderPossibleStatesGet
    WorkOrderSearch
    WorkOrderStateIDsCheck
    WorkOrderStateLookup
    WorkOrderTypeList
    WorkOrderTypeLookup
    WorkOrderUpdate
);

# check if subs are available
for my $ObjectMethod (@ObjectMethods) {
    $Self->True(
        $WorkOrderObject->can($ObjectMethod),
        "Test " . $TestCount++ . " - check 'can $ObjectMethod'"
    );
}

# ------------------------------------------------------------ #
# search for default ITSMWorkOrder States
# ------------------------------------------------------------ #
# define default ITSMWorkOrder States
# can't use qw due to spaces in states
my @DefaultWorkOrderStates = (
    'created',
    'accepted',
    'ready',
    'in progress',
    'closed',
    'canceled',
);

# get item list of the workorder states with swapped keys and values
my %WorkOrderStateID2Name = %{
    $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ChangeManagement::WorkOrder::State',
        ) || {}
};
my %WorkOrderStateName2ID   = reverse %WorkOrderStateID2Name;
my @SortedWorkOrderStateIDs = sort keys %WorkOrderStateID2Name;

# check if states are in GeneralCatalog
for my $DefaultWorkOrderState (@DefaultWorkOrderStates) {
    $Self->True(
        $WorkOrderStateName2ID{$DefaultWorkOrderState},
        "Test " . $TestCount++ . " - check state '$DefaultWorkOrderState'"
    );
}

# ------------------------------------------------------------ #
# test the state lookup method
# ------------------------------------------------------------ #

# investigate the default states
for my $State (@DefaultWorkOrderStates) {

    # look up the state name
    my $LookedUpStateID = $WorkOrderObject->WorkOrderStateLookup(
        WorkOrderState => $State,
    );

    $Self->Is(
        $LookedUpStateID,
        $WorkOrderStateName2ID{$State},
        "Look up state '$State'",
    );

    # do the reverse lookup
    my $LookedUpState = $WorkOrderObject->WorkOrderStateLookup(
        WorkOrderStateID => $LookedUpStateID,
    );

    $Self->Is(
        $LookedUpState,
        $State,
        "Look up state id '$LookedUpStateID'",
    );
}

# now some param checks
my $LookupOK = $WorkOrderObject->WorkOrderStateLookup();

$Self->False(
    $LookupOK,
    'No params passed to WorkOrderStateLookup()',
);

$LookupOK = $WorkOrderObject->WorkOrderStateLookup(
    WorkOrderState   => 'approved',
    WorkOrderStateID => 2,
);

$Self->False(
    $LookupOK,
    'Exclusive params passed to WorkOrderStateLookup()',
);

$LookupOK = $WorkOrderObject->WorkOrderStateLookup(
    State => 'approved',
);

$Self->False(
    $LookupOK,
    "Incorrect param 'State' passed to WorkOrderStateLookup()",
);

$LookupOK = $WorkOrderObject->WorkOrderStateLookup(
    StateID => 2,
);

$Self->False(
    $LookupOK,
    "Incorrect param 'StateID' passed to WorkOrderStateLookup()",
);

# ------------------------------------------------------------ #
# search for default ITSMWorkOrder-types
# ------------------------------------------------------------ #
# define default ITSMWorkOrder-states
# can't use qw due to spaces in types
my @DefaultWorkOrderTypes = (
    'approval',
    'workorder',
    'backout',
    'decision',
    'pir',
);

# get class list with swapped keys and values
my %WorkOrderTypeID2Name = %{
    $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ChangeManagement::WorkOrder::Type',
        ) || {}
};
my %WorkOrderTypeName2ID = reverse %WorkOrderTypeID2Name;
my @SortedTypeIDs        = sort keys %WorkOrderTypeID2Name;

# check if types are in GeneralCatalog
for my $DefaultWorkOrderType (@DefaultWorkOrderTypes) {
    $Self->True(
        $WorkOrderTypeName2ID{$DefaultWorkOrderType},
        "Test " . $TestCount++ . " - check type '$DefaultWorkOrderType'"
    );
}

# test lookup method
for my $DefaultWorkOrderType (@DefaultWorkOrderTypes) {
    my $TypeID = $WorkOrderObject->WorkOrderTypeLookup(
        WorkOrderType => $DefaultWorkOrderType,
    );

    $Self->Is(
        $TypeID,
        $WorkOrderTypeName2ID{$DefaultWorkOrderType},
        "Lookup $DefaultWorkOrderType",
    );

    my $TypeName = $WorkOrderObject->WorkOrderTypeLookup(
        WorkOrderTypeID => $TypeID,
    );

    $Self->Is(
        $TypeName,
        $DefaultWorkOrderType,
        "Lookup $TypeID",
    );
}

# test the method WorkOrderTypeList(). It should return a list of all types.
my $TypesListUnderTest = $WorkOrderObject->WorkOrderTypeList(
    UserID => 1,
) || {};

# do the checks
for my $TypeID (@SortedTypeIDs) {
    my ( $FirstHashRef, $SecondHashRef ) = grep { $_->{Key} == $TypeID } @{$TypesListUnderTest};

    # a match is expected
    $Self->True(
        $FirstHashRef,
        "Check for type id $TypeID",
    );

    # the name should also match
    $FirstHashRef ||= {};
    my $TypeName = $WorkOrderTypeID2Name{$TypeID};
    $Self->Is(
        $FirstHashRef->{Value},
        $TypeName,
        "Check for type name $TypeID",
    );

    # only one match is expected
    $Self->False(
        $SecondHashRef,
        "Check that the type id $TypeID is returned only once.",
    );

}

# ------------------------------------------------------------ #
# Define the changes that are needed for testing workorders
# ------------------------------------------------------------ #

# store current TestCount for better test case recognition
my $TestCountMisc = $TestCount;

# An unique indentifier, so that data from different test runs
# won't be mixed up. The string is formated to a constant length,
# as the conversion to plain text with ToAscii() depends on the string length.
my $UniqueSignature = sprintf 'UnitTest-ITSMChange::ITSMWorkOrder-%06d-%010d',
    int( rand 1_000_000 ),
    time();

my @ChangeTests = (

    # a change for general workorder testing
    {
        Description => 'Change for general testing of workorders.',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle => 'Change 1 - Title - ' . $UniqueSignature,
                UserID      => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle => 'Change 1 - Title - ' . $UniqueSignature,
            },
        },
    },

    # a change for OrderBy workorder searches
    {
        Description => 'Change for testing OrderBy workorder searches.',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle => 'Change 2 - Title - ' . $UniqueSignature,
                UserID      => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle => 'Change 2 - Title - ' . $UniqueSignature,
            },
        },
    },

    # a change for testing string searches in the associated change
    {
        Description => 'Change for testing string searches in change.',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle   => 'Change 3 - Title - ' . $UniqueSignature,
                Description   => 'Change 3 - Description - ' . $UniqueSignature,
                Justification => 'Change 3 - Justification - ' . $UniqueSignature,
                UserID        => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle   => 'Change 3 - Title - ' . $UniqueSignature,
                Description   => 'Change 3 - Description - ' . $UniqueSignature,
                Justification => 'Change 3 - Justification - ' . $UniqueSignature,
            },
        },
    },

    # a change for testing time searches in workorders
    {
        Description => 'Change for testing time searches in workorders .',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle => 'Change 4 for testing time searches in workorder - Title - '
                    . $UniqueSignature,
                UserID => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle => 'Change 4 for testing time searches in workorder - Title - '
                    . $UniqueSignature,
            },
        },
    },

    # a change for testing the Permission() method
    {
        Description => 'Change for testing the Permission() method',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle => 'Change 5 for testing the Permission() method' . $UniqueSignature,
                UserID      => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle => 'Change 5 for testing the Permission() method' . $UniqueSignature,
            },
            ChangeCABGet => {
                CABAgents => [
                ],
                CABCustomers => [
                ],
            },
        },
    },
);

# ------------------------------------------------------------ #
# Create the changes that are needed for testing workorders
# ------------------------------------------------------------ #

# change ids of created changes
my %TestedChangeID;

TEST:
for my $Test (@ChangeTests) {

    # check SourceData attribute
    if ( !$Test->{SourceData} || ref $Test->{SourceData} ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: No SourceData found for this test (test case: "
                . ( $TestCount - $TestCountMisc ) . ").",
        );

        next TEST;
    }

    # print test case description
    if ( $Test->{Description} ) {
        $Self->True(
            1,
            "Test $TestCount: $Test->{Description} (test case: "
                . ( $TestCount - $TestCountMisc ) . ").",
        );
    }

    # extract test data
    my $SourceData    = $Test->{SourceData};
    my $ReferenceData = $Test->{ReferenceData};

    # the change id will be used for several calls
    my $ChangeID;

    # add a new change
    if ( $SourceData->{ChangeAdd} ) {

        # add the change
        $ChangeID = $ChangeObject->ChangeAdd(
            %{ $SourceData->{ChangeAdd} }
        );

        # remember current ChangeID
        if ($ChangeID) {
            $TestedChangeID{$ChangeID} = 1;
        }

        $Self->True(
            $ChangeID,
            "Test $TestCount: ChangeAdd() - Add change.",
        );
    }

    # get a change and compare the retrieved data with the reference
    if ( exists $ReferenceData->{ChangeGet} ) {

        my $ChangeGetReferenceData = $ReferenceData->{ChangeGet};

        my $ChangeData = $ChangeObject->ChangeGet(
            ChangeID => $ChangeID,
            UserID   => 1,
        );

        # ChangeGet should not return anything
        if ( !defined $ReferenceData->{ChangeGet} ) {
            $Self->False(
                $ChangeData,
                "Test $TestCount: |- Get change returns undef.",
            );

            # check if we excpected to fail
            if ( $Test->{Fails} ) {
                $Self->Is(
                    !defined $ChangeData,
                    !defined $ReferenceData->{ChangeData},
                    "Test $TestCount: |- Should fail.",
                );
            }
            next TEST;
        }

        # check for always existing attributes
        for my $ChangeAttributes (
            qw(ChangeID ChangeNumber ChangeBuilderID CreateTime ChangeTime)
            )
        {
            $Self->True(
                $ChangeData->{$ChangeAttributes},
                "Test $TestCount: |- has $ChangeAttributes.",
            );
        }

        for my $RequestedAttribute ( sort keys %{ $ReferenceData->{ChangeGet} } ) {

            # turn off all pretty print
            local $Data::Dumper::Indent = 0;
            local $Data::Dumper::Useqq  = 1;

            # dump the attribute from ChangeGet() and the reference attribute
            ## no critic
            my $ChangeAttribute = Data::Dumper::Dumper( $ChangeData->{$RequestedAttribute} );    ## no critic
            my $ReferenceAttribute = Data::Dumper::Dumper( $ReferenceData->{ChangeGet}->{$RequestedAttribute} )
                ;                                                                                ## no critic
                                                                                                 # use critic

            $Self->Is(
                $ChangeAttribute,
                $ReferenceAttribute,
                "Test $TestCount: |- $ReferenceAttribute",
            );
        }
    }    # end if 'ChangeGet'
}
continue {

    # increase the test count, even on next
    $TestCount++;
}

# ------------------------------------------------------------ #
# Define the workorder tests
# ------------------------------------------------------------ #
my (
    $WorkOrderAddTestID, $OrderByTestID, $StringSearchTestID,
    $TimeSearchTestID, $PermissionTestID
) = sort keys %TestedChangeID;

# tests with only WorkOrderAdd();
my @WorkOrderTests = (

    # Tests where the workorder doesn't contain all data (required attributes)
    {
        Description => 'Test contains no params for WorkOrderAdd().',
        Fails       => 1,                                               # we expect this test to fail
        SourceData  => {
            WorkOrderAdd => {},                                         # UserID and ChangeID are missing
        },
        ReferenceData => {
            WorkOrderGet => undef,
        },
    },
    {
        Description => 'Test contains no UserID for WorkOrderAdd().',
        Fails       => 1,                                               # we expect this test to fail
        SourceData  => {
            WorkOrderAdd => {                                           # UserID is missing
                ChangeID => $WorkOrderAddTestID,
            },
        },
        ReferenceData => {
            WorkOrderGet => undef,
        },
    },
    {
        Description => 'Test contains no ChangeID for WorkOrderAdd().',
        Fails       => 1,                                                 # we expect this test to fail
        SourceData  => {
            WorkOrderAdd => {                                             # ChangeID is missing
                UserID => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => undef,
        },
    },

    # First test of WorkOrderAdd() with all required arguments.
    {
        Description => 'Test contains ChangeID and ChangeID for WorkOrderAdd().',
        SourceData  => {
            WorkOrderAdd => {
                UserID   => 1,
                ChangeID => $WorkOrderAddTestID,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID => $WorkOrderAddTestID,
            },
        },
        SearchTest => [ 2, 8 ],
    },

    # First test of WorkOrderAdd() with all required arguments, not UserID => 1.
    {
        Description =>
            'Test contains ChangeID and ChangeID for WorkOrderAdd(), other user than UserID => 1.',
        SourceData => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID => $WorkOrderAddTestID,
                CreateBy => $UserIDs[0],
                ChangeBy => $UserIDs[0]
            },
        },
        SearchTest => [ 2, 8 ],
    },

    {
        Description => 'WorkOrderAdd() with string parameters.',
        SourceData  => {
            WorkOrderAdd => {
                UserID         => 1,
                ChangeID       => $WorkOrderAddTestID,
                WorkOrderTitle => 'WorkOrder 1 - Title - ' . $UniqueSignature,
                Instruction    => 'WorkOrder 1 - Instruction - ' . $UniqueSignature,
                Report         => 'WorkOrder 1 - Report - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID         => $WorkOrderAddTestID,
                WorkOrderTitle   => 'WorkOrder 1 - Title - ' . $UniqueSignature,
                Instruction      => 'WorkOrder 1 - Instruction - ' . $UniqueSignature,
                InstructionPlain => "WorkOrder 1 - Instruction -\n$UniqueSignature\n",
                Report           => 'WorkOrder 1 - Report - ' . $UniqueSignature,
                ReportPlain      => 'WorkOrder 1 - Report - ' . $UniqueSignature,
            },
        },
        SearchTest => [ 2, 3, 4, 5, 6, 8, 11 ],
    },

    {
        Description => 'Workorder contains HTML instruction and report',
        SourceData  => {
            WorkOrderAdd => {
                UserID      => 1,
                ChangeID    => $WorkOrderAddTestID,
                Instruction => '<b>This instruction <u>is</u> bold</b> - ' . $UniqueSignature,
                Report      => '<b>This report <u>is</u> bold</b> - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle   => '',
                Instruction      => '<b>This instruction <u>is</u> bold</b> - ' . $UniqueSignature,
                InstructionPlain => "This instruction is bold -\n$UniqueSignature\n",
                Report           => '<b>This report <u>is</u> bold</b> - ' . $UniqueSignature,
                ReportPlain      => 'This report is bold - ' . $UniqueSignature,
            },
        },
        SearchTest => [2],
    },

    {
        Description => 'WorkOrderAdd() with WorkOrderStateID.',
        SourceData  => {
            WorkOrderAdd => {
                UserID           => 1,
                ChangeID         => $WorkOrderAddTestID,
                WorkOrderStateID => $WorkOrderStateName2ID{ready},
                WorkOrderTitle   => 'WorkOrderAdd with WorkOrderStateID - Title - '
                    . $UniqueSignature,
                Instruction => 'WorkOrderAdd with WorkOrderStateID - Instruction - '
                    . $UniqueSignature,
                Report => 'WorkOrderAdd with WorkOrderStateID - Report - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID         => $WorkOrderAddTestID,
                WorkOrderStateID => $WorkOrderStateName2ID{ready},
                WorkOrderTitle   => 'WorkOrderAdd with WorkOrderStateID - Title - '
                    . $UniqueSignature,
                Instruction => 'WorkOrderAdd with WorkOrderStateID - Instruction - '
                    . $UniqueSignature,
                Report => 'WorkOrderAdd with WorkOrderStateID - Report - ' . $UniqueSignature,
            },
        },
        SearchTest => [ 2, 8, 27, 28 ],
    },
    {
        Description => 'WorkOrderAdd() with WorkOrderTypeID.',
        SourceData  => {
            WorkOrderAdd => {
                UserID          => 1,
                ChangeID        => $WorkOrderAddTestID,
                WorkOrderTypeID => $WorkOrderTypeName2ID{approval},
                WorkOrderTitle  => 'WorkOrderAdd with WorkOrderTypeID - Title - ' . $UniqueSignature,
                Instruction     => 'WorkOrderAdd with WorkOrderTypeID - Instruction - '
                    . $UniqueSignature,
                Report => 'WorkOrderAdd with WorkOrderTypeID - Report - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID        => $WorkOrderAddTestID,
                WorkOrderTypeID => $WorkOrderTypeName2ID{approval},
                WorkOrderTitle  => 'WorkOrderAdd with WorkOrderTypeID - Title - ' . $UniqueSignature,
                Instruction     => 'WorkOrderAdd with WorkOrderTypeID - Instruction - '
                    . $UniqueSignature,
                Report => 'WorkOrderAdd with WorkOrderTypeID - Report - ' . $UniqueSignature,
            },
        },
        SearchTest => [ 2, 8, 13, 23, 24 ],
    },
    {
        Description => 'WorkOrderAdd() with WorkOrderTypeID and WorkOrderStateID.',
        SourceData  => {
            WorkOrderAdd => {
                UserID           => 1,
                ChangeID         => $WorkOrderAddTestID,
                WorkOrderTypeID  => $WorkOrderTypeName2ID{pir},
                WorkOrderStateID => $WorkOrderStateName2ID{closed},
                WorkOrderTitle =>
                    'WorkOrderAdd with WorkOrderTypeID and WorkOrderStateID - Title - '
                    . $UniqueSignature,
                Instruction =>
                    'WorkOrderAdd with WorkOrderTypeID and WorkOrderStateID - Instruction - '
                    . $UniqueSignature,
                Report => 'WorkOrderAdd with WorkOrderTypeID and WorkOrderStateID - Report - '
                    . $UniqueSignature,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID         => $WorkOrderAddTestID,
                WorkOrderTypeID  => $WorkOrderTypeName2ID{pir},
                WorkOrderStateID => $WorkOrderStateName2ID{closed},
                WorkOrderTitle =>
                    'WorkOrderAdd with WorkOrderTypeID and WorkOrderStateID - Title - '
                    . $UniqueSignature,
                Instruction =>
                    'WorkOrderAdd with WorkOrderTypeID and WorkOrderStateID - Instruction - '
                    . $UniqueSignature,
                Report => 'WorkOrderAdd with WorkOrderTypeID and WorkOrderStateID - Report - '
                    . $UniqueSignature,
            },
        },
        SearchTest => [ 2, 8, 13, 23, 24, 27, 28 ],
    },
    {
        Description =>
            'WorkOrderAdd() and WorkOrderUpdate() with WorkOrderTypeID and WorkOrderStateID.',
        SourceData => {
            WorkOrderAdd => {
                UserID           => 1,
                ChangeID         => $WorkOrderAddTestID,
                WorkOrderTypeID  => $WorkOrderTypeName2ID{pir},
                WorkOrderStateID => $WorkOrderStateName2ID{'in progress'},
                WorkOrderTitle   => 'WorkOrderAdd with WorkOrderStateID - Title - '
                    . $UniqueSignature,
                Instruction => 'WorkOrderAdd with WorkOrderStateID - Instruction - '
                    . $UniqueSignature,
                Report => 'WorkOrderAdd with WorkOrderStateID - Report - ' . $UniqueSignature,
            },
            WorkOrderUpdate => {
                UserID           => 1,
                WorkOrderTypeID  => $WorkOrderTypeName2ID{decision},
                WorkOrderStateID => $WorkOrderStateName2ID{canceled},
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID         => $WorkOrderAddTestID,
                WorkOrderTypeID  => $WorkOrderTypeName2ID{decision},
                WorkOrderStateID => $WorkOrderStateName2ID{canceled},
                WorkOrderTitle   => 'WorkOrderAdd with WorkOrderStateID - Title - '
                    . $UniqueSignature,
                Instruction => 'WorkOrderAdd with WorkOrderStateID - Instruction - '
                    . $UniqueSignature,
                Report => 'WorkOrderAdd with WorkOrderStateID - Report - ' . $UniqueSignature,
            },
        },
        SearchTest => [ 2, 8 ],
    },

    {
        Description => 'WorkOrderAdd() with empty string parameters.',
        SourceData  => {
            WorkOrderAdd => {
                UserID         => 1,
                ChangeID       => $WorkOrderAddTestID,
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => '',
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID       => $WorkOrderAddTestID,
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => '',
            },
        },
        SearchTest => [ 2, 8 ],
    },

    {
        Description => 'Test for States (no ids) in WOAdd()',
        SourceData  => {
            WorkOrderAdd => {
                UserID         => 1,
                ChangeID       => $WorkOrderAddTestID,
                WorkOrderTitle => 'WorkOrderState - ' . $UniqueSignature,
                WorkOrderState => 'closed',
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID         => $WorkOrderAddTestID,
                CreateBy         => 1,
                WorkOrderTitle   => 'WorkOrderState - ' . $UniqueSignature,
                WorkOrderState   => 'closed',
                WorkOrderStateID => $WorkOrderStateName2ID{closed},
            },
        },
        SearchTest => [ 27, 28 ],
    },

    {
        Description => 'Test for invalid state names in WOAdd() and WOUpdate()',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID         => 1,
                ChangeID       => $WorkOrderAddTestID,
                WorkOrderTitle => 'WorkOrderState - ' . $UniqueSignature,
                WorkOrderState => 'closed',
            },
            WorkOrderUpdate => {
                WorkOrderState => 'canceled',
                UserID         => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID         => $WorkOrderAddTestID,
                CreateBy         => 1,
                ChangeBy         => 1,
                WorkOrderTitle   => 'WorkOrderState - ' . $UniqueSignature,
                WorkOrderState   => 'closed',
                WorkOrderStateID => $WorkOrderStateName2ID{closed},
            },
        },
        SearchTest => [ 27, 28 ],
    },

    {
        Description => 'Test for valid state names in WOAdd() and WOUpdate()',
        SourceData  => {
            WorkOrderAdd => {
                UserID         => 1,
                ChangeID       => $WorkOrderAddTestID,
                WorkOrderTitle => 'WorkOrderState - ' . $UniqueSignature,
                WorkOrderState => 'in progress',
            },
            WorkOrderUpdate => {
                WorkOrderState => 'canceled',
                UserID         => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID         => $WorkOrderAddTestID,
                CreateBy         => 1,
                ChangeBy         => 1,
                WorkOrderTitle   => 'WorkOrderState - ' . $UniqueSignature,
                WorkOrderState   => 'canceled',
                WorkOrderStateID => $WorkOrderStateName2ID{canceled},
            },
        },
    },

    {
        Description => 'Test for Types (no ids) in WOAdd()',
        SourceData  => {
            WorkOrderAdd => {
                UserID         => 1,
                ChangeID       => $WorkOrderAddTestID,
                WorkOrderTitle => 'WorkOrderType - ' . $UniqueSignature,
                WorkOrderType  => 'pir',
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                CreateBy        => 1,
                ChangeID        => $WorkOrderAddTestID,
                WorkOrderTitle  => 'WorkOrderType - ' . $UniqueSignature,
                WorkOrderType   => 'pir',
                WorkOrderTypeID => $WorkOrderTypeName2ID{pir},
            },
        },
        SearchTest => [ 13, 23, 24 ],
    },

    {
        Description => 'Test for Types (no ids) in WOAdd() and WOUpdate()',
        SourceData  => {
            WorkOrderAdd => {
                ChangeID       => $WorkOrderAddTestID,
                UserID         => 1,
                WorkOrderTitle => 'WorkOrderType - ' . $UniqueSignature,
                WorkOrderType  => 'pir',
            },
            WorkOrderUpdate => {
                WorkOrderType => 'decision',
                UserID        => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID        => $WorkOrderAddTestID,
                CreateBy        => 1,
                ChangeBy        => 1,
                WorkOrderTitle  => 'WorkOrderType - ' . $UniqueSignature,
                WorkOrderType   => 'decision',
                WorkOrderTypeID => $WorkOrderTypeName2ID{decision},
            },
        },
    },

    {
        Description => 'Test for WorkOrderUpdate() with not allowed workorder state',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                ChangeID       => $WorkOrderAddTestID,
                UserID         => 1,
                WorkOrderTitle => 'WorkOrderUpdate() - ' . $UniqueSignature,
            },
            WorkOrderUpdate => {
                WorkOrderState => 'in progress',
                UserID         => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID       => $WorkOrderAddTestID,
                CreateBy       => 1,
                ChangeBy       => 1,
                WorkOrderTitle => 'WorkOrderUpdate() - ' . $UniqueSignature,
                WorkOrderState => 'created',
            },
        },
    },

    {
        Description =>
            'Test for WorkOrderUpdate() with not allowed workorder state but BypassStateMachine parameter.',
        SourceData => {
            WorkOrderAdd => {
                ChangeID       => $WorkOrderAddTestID,
                UserID         => 1,
                WorkOrderTitle => 'WorkOrderUpdate() BypassStateMachine - ' . $UniqueSignature,
            },
            WorkOrderUpdate => {
                WorkOrderState     => 'in progress',
                BypassStateMachine => 1,
                UserID             => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID       => $WorkOrderAddTestID,
                WorkOrderTitle => 'WorkOrderUpdate() BypassStateMachine - ' . $UniqueSignature,
                WorkOrderState => 'in progress',
            },
        },
    },

);

# tests for WorkOrderUpdate();
push @WorkOrderTests, (
    {
        Description => 'Test contains no params for WorkOrderUpdate().',
        Fails       => 1,                                                  # we expect this test to fail
        SourceData  => {
            WorkOrderUpdate => {},
        },
        ReferenceData => {
            WorkOrderUpdate => undef,
        },
    },

    {
        Description => 'Test for max string length for WorkOrderUpdate.',
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => 'T' x 250,
                Instruction    => 'I' x 1799999,
                Report         => 'R' x 1799999,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle   => 'T' x 250,
                Instruction      => 'I' x 1799999,
                InstructionPlain => 'I' x 1799999 . "\n",
                Report           => 'R' x 1799999,
                ReportPlain      => 'R' x 1799999 . "\n",
                CreateBy         => $UserIDs[0],
                ChangeBy         => 1,
            },
        },
        SearchTest => [ 1, 8 ],
    },

    {
        Description => 'Test for max+1 string length for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => 'T' x 251,
                Instruction    => 'I' x 1800000,
                Report         => 'R' x 1800000,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => '',
                CreateBy       => $UserIDs[0],
                ChangeBy       => $UserIDs[0],
            },
        },
        SearchTest => [ 1, 8 ],
    },

    {
        Description => 'Test for max+2 string length for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => 'T' x 252,
                Instruction    => 'I' x 1800000,
                Report         => 'R' x 1800000,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => '',
                CreateBy       => $UserIDs[0],
                ChangeBy       => $UserIDs[0],
            },
        },
        SearchTest => [8],
    },

    {
        Description => 'Test create_by and change_by for WorkOrderUpdate.',
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => 'T' x 25,
                Instruction    => 'I' x 38,
                Report         => 'R' x 38,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => 'T' x 25,
                Instruction    => 'I' x 38,
                Report         => 'R' x 38,
                CreateBy       => $UserIDs[0],
                ChangeBy       => 1,
            },
        },
        SearchTest => [ 2, 8 ],
    },

    {
        Description => 'Test create_by and change_by for WorkOrderUpdate.',
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => 'T' x 25,
                Instruction    => 'I' x 38,
                Report         => 'R' x 38,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => 'T' x 25,
                Instruction    => 'I' x 38,
                Report         => 'R' x 38,
                CreateBy       => $UserIDs[0],
                ChangeBy       => 1,
            },
        },
        SearchTest => [ 2, 8 ],
    },

    {
        Description => 'Test for max+1 string length - title - for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => 'T' x 251,
                Instruction    => 'I',
                Report         => 'R',
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => '',
            },
        },
        SearchTest => [8],
    },

    {
        Description => 'Test for max+1 string length - Instruction - for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => 'T',
                Instruction    => 'I' x 1800000,
                Report         => 'R',
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => '',
            },
        },
        SearchTest => [8],
    },

    {
        Description => 'Test for max+1 string length - Report - for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => 'T',
                Instruction    => 'I',
                Report         => 'R' x 1800000,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => '',
            },
        },
        SearchTest => [8],
    },

    {
        Description => 'Test for undef param - Title - for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => undef,
                Instruction    => 'I',
                Report         => 'R',
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => '',
            },
        },
        SearchTest => [8],
    },

    {
        Description => 'Test for undef param - Instruction - for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => 'T',
                Instruction    => undef,
                Report         => 'R',
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => '',
            },
        },
        SearchTest => [8],
    },

    {
        Description => 'Test for undef param - Report - for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => 'T',
                Instruction    => 'I',
                Report         => undef,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => '',
            },
        },
        SearchTest => [8],
    },

    {
        Description => 'Test for TimeChanges - just PlannedStartTime - for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
                Report   => 'Report - just PlannedStartTime',
            },
            WorkOrderUpdate => {
                PlannedStartTime => '2009-03-20 13:25:09',
                WorkOrderTitle   => 'Test',
                UserID           => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => 'Report - just PlannedStartTime',
                ChangeBy       => $UserIDs[0],
                CreateBy       => $UserIDs[0],
            },
        },
        SearchTest => [8],
    },

    {
        Description => 'Test for TimeChanges - just PlannedEndTime - for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
                Report   => 'Report - just PlannedEndTime',
            },
            WorkOrderUpdate => {
                PlannedEndTime => '2009-03-20 13:25:09',
                WorkOrderTitle => 'Test',
                UserID         => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => 'Report - just PlannedEndTime',
                ChangeBy       => $UserIDs[0],
                CreateBy       => $UserIDs[0],
            },
        },
        SearchTest => [8],
    },

    {
        Description => 'Test for TimeChanges - just ActualStartTime - for WorkOrderUpdate.',
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
                Report   => 'Report - just ActualStartTime',
            },
            WorkOrderUpdate => {
                ActualStartTime => '2009-03-20 13:25:09',
                WorkOrderTitle  => 'Test',
                UserID          => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle  => 'Test',
                Instruction     => '',
                Report          => 'Report - just ActualStartTime',
                ActualStartTime => '2009-03-20 13:25:09',
                ChangeBy        => 1,
                CreateBy        => $UserIDs[0],
            },
        },
        SearchTest => [8],
    },

    {
        Description => 'Test for TimeChanges - just ActualEndTime - for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
                Report   => 'Report - just ActualEndTime',
            },
            WorkOrderUpdate => {
                ActualEndTime  => '2009-03-20 13:25:09',
                WorkOrderTitle => 'Test',
                UserID         => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => 'Report - just ActualEndTime',
                ChangeBy       => $UserIDs[0],
                CreateBy       => $UserIDs[0],
            },
        },
        SearchTest => [8],
    },

    {
        Description =>
            'Test for TimeChanges - ActualStartTime > ActualEndTime - for WorkOrderUpdate.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
                Report   => 'Report - ActualStartTime > ActualEndTime',
            },
            WorkOrderUpdate => {
                ActualEndTime   => '2009-03-20 13:25:09',
                ActualStartTime => '2009-03-21 13:25:09',
                WorkOrderTitle  => 'Test',
                UserID          => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
                Instruction    => '',
                Report         => 'Report - ActualStartTime > ActualEndTime',
                ChangeBy       => $UserIDs[0],
                CreateBy       => $UserIDs[0],
            },
        },
        SearchTest => [8],
    },

    {
        Description =>
            'Test for TimeChanges - ActualStartTime < ActualEndTime - for WorkOrderUpdate.',
        SourceData => {
            WorkOrderAdd => {
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
                Report   => 'Report - ActualStartTime < ActualEndTime',
            },
            WorkOrderUpdate => {
                ActualEndTime   => '2009-03-22 13:25:09',
                ActualStartTime => '2009-03-21 13:25:09',
                WorkOrderTitle  => 'Test',
                UserID          => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle  => 'Test',
                Instruction     => '',
                Report          => 'Report - ActualStartTime < ActualEndTime',
                ChangeBy        => 1,
                CreateBy        => $UserIDs[0],
                ActualEndTime   => '2009-03-22 13:25:09',
                ActualStartTime => '2009-03-21 13:25:09',
            },
        },
        SearchTest => [8],
    },

    {
        Description => "Test for '0' string handling for WorkOrderUpdate.",
        SourceData  => {
            WorkOrderAdd => {
                UserID   => 1,
                ChangeID => $WorkOrderAddTestID,
            },
            WorkOrderUpdate => {
                UserID         => 1,
                WorkOrderTitle => '0',
                Instruction    => '0',
                Report         => '0',
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '0',
                Instruction    => '0',
                Report         => '0',
            },
        },
        SearchTest => [8],
    },

    # Test title with leading whitespace
    {
        Description => 'Test for title with leading whitespace',
        SourceData  => {
            WorkOrderAdd => {
                UserID         => $UserIDs[0],
                WorkOrderTitle => "  \t \n  Title with leading whitespace - " . $UniqueSignature,
                ChangeID       => $WorkOrderAddTestID,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => "Title with leading whitespace - " . $UniqueSignature,
            },
        },
        SearchTest => [32],
    },

    # Test title with trailing whitespace
    {
        Description => 'Test for title with trailing whitespace',
        SourceData  => {
            WorkOrderAdd => {
                WorkOrderTitle => "Title with trailing whitespace - "
                    . $UniqueSignature
                    . "  \t \n  ",
                UserID   => $UserIDs[0],
                ChangeID => $WorkOrderAddTestID,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => "Title with trailing whitespace - " . $UniqueSignature,
            },
        },
        SearchTest => [33],
    },

    # Test title with leading and trailing whitespace
    {
        Description => 'Test for title with leading and trailing whitespace',
        SourceData  => {
            WorkOrderAdd => {
                UserID         => $UserIDs[0],
                WorkOrderTitle => "  \t \n  Title with leading and trailing whitespace - "
                    . $UniqueSignature
                    . "  \t \n  ",
                ChangeID => $WorkOrderAddTestID,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => "Title with leading and trailing whitespace - "
                    . $UniqueSignature,
            },
        },
        SearchTest => [34],
    },

    # Test title with only whitespace
    {
        Description => 'Test for title with only whitespace',
        SourceData  => {
            WorkOrderAdd => {
                UserID         => $UserIDs[0],
                WorkOrderTitle => "  \t \n  ",
                ChangeID       => $WorkOrderAddTestID,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => '',
            },
        },
        SearchTest => [],
    },

    # test for accounted time and planned effort
    {
        Description => 'Test 1 for AccountedTime and PlannedEffort',
        SourceData  => {
            WorkOrderAdd => {
                WorkOrderTitle => 'Test 1 for AccountedTime and PlannedEffort',
                ChangeID       => $WorkOrderAddTestID,
                UserID         => 1,
            },
            WorkOrderUpdate => {
                PlannedEffort => '5.5',
                AccountedTime => '1.5',
                UserID        => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                PlannedEffort => '5.50',    # output is always formatted with 2 decimal places
                AccountedTime => '1.50',    # output is always formatted with 2 decimal places
            },
        },
    },

    #-------------------------------------#
    # Tests for Workorder Dynamic fields
    #-------------------------------------#

    # test some workorder dynamic fields WorkOrderAdd and WorkOrderUpdate
    {
        Description => 'Test WorkOrderAdd and WorkOrderUpdate with workorder dynamic fields.',
        SourceData  => {
            WorkOrderAdd => {
                WorkOrderTitle => 'Test add workorder with dynamic fields - ' . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'AAAA',
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'BBBB',
                'DynamicField_' . $UniqueNamePrefix . 'Test3' => 'CCCC',
                'DynamicField_' . $UniqueNamePrefix . 'Test4' => 'DDDD',
                ChangeID                                      => $WorkOrderAddTestID,
                UserID                                        => 1,
            },
            WorkOrderUpdate => {
                'DynamicField_' . $UniqueNamePrefix . 'Test3' => 'GGGG',
                'DynamicField_' . $UniqueNamePrefix . 'Test4' => 'HHHH',
                UserID                                        => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => 'Test add workorder with dynamic fields - ' . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'AAAA',
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'BBBB',
                'DynamicField_' . $UniqueNamePrefix . 'Test3' => 'GGGG',
                'DynamicField_' . $UniqueNamePrefix . 'Test4' => 'HHHH',
            },
        },

        SearchTest => [ 8, 35 ],
    },

    # test some workorder dynamic fields WorkOrderAdd
    {
        Description => 'Test WorkOrderAdd and WorkOrderUpdate with workorder dynamic fields.',
        SourceData  => {
            WorkOrderAdd => {
                WorkOrderTitle => 'Test add workorder with dynamic fields - ' . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'AAAA',
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'BBBB',
                'DynamicField_' . $UniqueNamePrefix . 'Test3' => 'XXXX',
                'DynamicField_' . $UniqueNamePrefix . 'Test4' => 'YYYY',
                ChangeID                                      => $WorkOrderAddTestID,
                UserID                                        => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                WorkOrderTitle => 'Test add workorder with dynamic fields - ' . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'AAAA',
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'BBBB',
                'DynamicField_' . $UniqueNamePrefix . 'Test3' => 'XXXX',
                'DynamicField_' . $UniqueNamePrefix . 'Test4' => 'YYYY',
            },
        },

        SearchTest => [ 8, 35, 36 ],
    },

    # test workorder dynamic fields with maximum length
    {
        Description => 'Test WorkOrderAdd dynamic fields with 3800 characters.',
        SourceData  => {
            WorkOrderAdd => {
                WorkOrderTitle => 'Test add workorder dynamic fields with 3800 characters - '
                    . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'A' x 3800,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'B' x 3800,
                ChangeID                                      => $WorkOrderAddTestID,
                UserID                                        => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'A' x 3800,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'B' x 3800,
            },
        },

        SearchTest => [8],
    },

    # test workorder dynamic fields larger than maximum length in WorkOrderAdd
    {
        Description => 'Test WorkOrderAdd dynamic fields with 3801 characters.',
        Fails       => 1,
        SourceData  => {
            WorkOrderAdd => {
                WorkOrderTitle => 'Test add workorder dynamic fields with 251 characters - '
                    . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'A' x 3801,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'B' x 3801,
                ChangeID                                      => $WorkOrderAddTestID,
                UserID                                        => $UserIDs[0],
            },
        },
        ReferenceData => {
            WorkOrderGet => undef,
        },
    },

    # test workorder dynamic fields larger than maximum length in WorkOrderUpdate
    {
        Description => 'Test WorkOrderUpdate dynamic fields with 3801 characters.',
        UpdateFails => 1,
        SourceData  => {
            WorkOrderAdd => {
                WorkOrderTitle => 'Test update workorder dynamic fields with 3801 characters - '
                    . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'A' x 3800,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'B' x 3800,
                ChangeID                                      => $WorkOrderAddTestID,
                UserID                                        => 1,
            },
            WorkOrderUpdate => {
                'DynamicField_' . $UniqueNamePrefix . 'Test3' => 'C' x 3801,
                UserID                                        => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'A' x 3800,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'B' x 3800,
            },
        },

        SearchTest => [8],
    },

    # test workorder dynamic fields with zero and empty strings
    {
        Description => 'Test WorkOrderUpdate with zero and empty string.',
        SourceData  => {
            WorkOrderAdd => {
                WorkOrderTitle =>
                    'Test update workorder dynamic fields with zero and empty string - '
                    . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'AAAA',
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'BBBB',
                ChangeID                                      => $WorkOrderAddTestID,
                UserID                                        => 1,
            },
            WorkOrderUpdate => {
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 0,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => '',
                UserID                                        => 1,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 0,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => '',
            },
        },

        SearchTest => [8],
    },

);

# workorders tests for WorkOrderSearch() with OrderBy
push @WorkOrderTests, (

    {
        Description =>
            'WorkOrderAdd() for OrderBy with WorkOrderTypeID and WorkOrderStateID.',
        SourceData => {
            WorkOrderAdd => {
                UserID           => 1,
                ChangeID         => $OrderByTestID,
                WorkOrderTypeID  => $SortedTypeIDs[2],
                WorkOrderStateID => $SortedWorkOrderStateIDs[0],
                WorkOrderTitle   => 'AAA WorkOrderAdd() for OrderBy - Title - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID         => $OrderByTestID,
                WorkOrderTypeID  => $SortedTypeIDs[2],
                WorkOrderStateID => $SortedWorkOrderStateIDs[0],
                WorkOrderTitle   => 'AAA WorkOrderAdd() for OrderBy - Title - ' . $UniqueSignature,
            },
        },

        # 999999 is a special test case.
        # Workorders with searchtest 999999 are used in 'OrderBy' search tests.
        SearchTest => [999999],
    },

    {
        Description =>
            'WorkOrderAdd() for OrderBy with WorkOrderTypeID and WorkOrderStateID.',
        SourceData => {
            WorkOrderAdd => {
                UserID           => 1,
                ChangeID         => $OrderByTestID,
                WorkOrderTypeID  => $SortedTypeIDs[1],
                WorkOrderStateID => $SortedWorkOrderStateIDs[1],
                WorkOrderTitle   => 'BBB WorkOrderAdd() for OrderBy - Title - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID         => $OrderByTestID,
                WorkOrderTypeID  => $SortedTypeIDs[1],
                WorkOrderStateID => $SortedWorkOrderStateIDs[1],
                WorkOrderTitle   => 'BBB WorkOrderAdd() for OrderBy - Title - ' . $UniqueSignature,
            },
        },
        SearchTest => [999999],
    },

    {
        Description =>
            'WorkOrderAdd() for OrderBy with WorkOrderTypeID and WorkOrderStateID.',
        SourceData => {
            WorkOrderAdd => {
                UserID           => 1,
                ChangeID         => $OrderByTestID,
                WorkOrderTypeID  => $SortedTypeIDs[0],
                WorkOrderStateID => $SortedWorkOrderStateIDs[2],
                WorkOrderTitle   => 'CCC WorkOrderAdd() for OrderBy - Title - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID         => $OrderByTestID,
                WorkOrderTypeID  => $SortedTypeIDs[0],
                WorkOrderStateID => $SortedWorkOrderStateIDs[2],
                WorkOrderTitle   => 'CCC WorkOrderAdd() for OrderBy - Title - ' . $UniqueSignature,
            },
        },
        SearchTest => [999999],
    },
);

# workorders tests for WorkOrderSearch() with string searches in change
push @WorkOrderTests, (

    {
        Description =>
            'WorkOrderAdd() for string search in change.',
        SourceData => {
            WorkOrderAdd => {
                UserID         => 1,
                ChangeID       => $StringSearchTestID,
                WorkOrderTitle => 'WorkOrderAdd() for string search in change - Title - '
                    . $UniqueSignature,
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID       => $StringSearchTestID,
                WorkOrderTitle => 'WorkOrderAdd() for string search in change - Title - '
                    . $UniqueSignature,
            },
        },
        SearchTest => [ 15, 17, 19, 21, 22 ],
    },
);

# workorders tests for testing the Permission() method
push @WorkOrderTests, (

    {
        Description =>
            'WorkOrderAdd() for testing the Permission() method',
        SourceData => {
            WorkOrderAdd => {
                UserID           => 1,
                ChangeID         => $PermissionTestID,
                WorkOrderTitle   => 'WorkOrderAdd() for Permission()  - Title - ' . $UniqueSignature,
                WorkOrderAgentID => $UserIDs[0],
            },
        },
        ReferenceData => {
            WorkOrderGet => {
                ChangeID         => $PermissionTestID,
                WorkOrderTitle   => 'WorkOrderAdd() for Permission()  - Title - ' . $UniqueSignature,
                WorkOrderAgentID => $UserIDs[0],
            },
        },
    },
);

# ------------------------------------------------------------ #
# execute the workorder tests
# ------------------------------------------------------------ #

my %TestedWorkOrderID;           # ids of all created workorders
my %WorkOrderIDForChangeID;      # keep track of the workorders that are attached to a change
my %WorkOrderIDForSearchTest;    # workorder ids that are expected to be found in a search

TEST:
for my $Test (@WorkOrderTests) {

    # check SourceData attribute
    if ( !$Test->{SourceData} || ref $Test->{SourceData} ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: No SourceData found for this test (test case: "
                . ( $TestCount - $TestCountMisc ) . ").",
        );

        next TEST;
    }

    # print test case description
    if ( $Test->{Description} ) {
        $Self->True(
            1,
            "Test $TestCount: $Test->{Description} (test case: "
                . ( $TestCount - $TestCountMisc ) . ").",
        );
    }

    # extract test data
    my $SourceData    = $Test->{SourceData};
    my $ReferenceData = $Test->{ReferenceData};

    # the change id will be used for several calls
    my $WorkOrderID;

    # add a new Change
    if ( $SourceData->{WorkOrderAdd} ) {

        # add the workorder
        $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
            %{ $SourceData->{WorkOrderAdd} },
        );

        # remember current WorkOrderID
        if ($WorkOrderID) {
            my $ChangeID = $SourceData->{WorkOrderAdd}->{ChangeID};

            # keep track of all created workorders
            $TestedWorkOrderID{$WorkOrderID} = 1;

            # keep track of the workorders attached to a change
            $WorkOrderIDForChangeID{$ChangeID} ||= {};
            $WorkOrderIDForChangeID{$ChangeID}->{$WorkOrderID} = 1;

            # save workorder id for use in search tests
            if ( exists $Test->{SearchTest} ) {
                my @SearchTests = @{ $Test->{SearchTest} };

                for my $SearchTestNr (@SearchTests) {
                    $WorkOrderIDForSearchTest{$SearchTestNr}->{$WorkOrderID} = 1;
                }
            }
        }

        if ( $Test->{Fails} ) {
            $Self->False(
                $WorkOrderID,
                "Test $TestCount: WorkOrderAdd() - Add workorder should fail.",
            );
        }
        else {
            $Self->True(
                $WorkOrderID,
                "Test $TestCount: WorkOrderAdd() - Add workorder.",
            );
        }
    }    # end if 'WorkOrderAdd'

    if ( $SourceData->{WorkOrderUpdate} ) {

        # update the workorder
        my $WorkOrderUpdateSuccess = $WorkOrderObject->WorkOrderUpdate(
            WorkOrderID => $WorkOrderID,
            %{ $SourceData->{WorkOrderUpdate} },
        );

        if (
            $Test->{Fails}
            || $Test->{UpdateFails}
            )
        {
            $Self->False(
                $WorkOrderUpdateSuccess,
                "Test $TestCount: WorkOrderUpdate() is expected to fail",
            );
        }
        else {
            $Self->True(
                $WorkOrderUpdateSuccess,
                "Test $TestCount: WorkOrderUpdate()",
            );
        }
    }

    # get a workorder and compare the retrieved data with the reference
    if ( exists $ReferenceData->{WorkOrderGet} ) {

        my $WorkOrderGetReferenceData = $ReferenceData->{WorkOrderGet};

        my $WorkOrderData = $WorkOrderObject->WorkOrderGet(
            WorkOrderID => $WorkOrderID,
            UserID      => 1,
        );

        # WorkOrderGet should not return anything
        if ( !defined $ReferenceData->{WorkOrderGet} ) {
            $Self->False(
                $WorkOrderData,
                "Test $TestCount: |- Get change returns undef.",
            );

            # check if we excpected to fail
            if ( $Test->{Fails} ) {
                $Self->Is(
                    !defined $WorkOrderData,
                    !defined $ReferenceData->{WorkOrderData},
                    "Test $TestCount: |- Should fail.",
                );
            }
            next TEST;
        }

        # check for always existing attributes
        for my $WorkOrderAttributes (
            qw(WorkOrderID WorkOrderNumber CreateTime ChangeTime)
            )
        {
            $Self->True(
                $WorkOrderData->{$WorkOrderAttributes},
                "Test $TestCount: |- has $WorkOrderAttributes.",
            );
        }

        for my $RequestedAttribute ( sort keys %{ $ReferenceData->{WorkOrderGet} } ) {

            # turn off all pretty print
            local $Data::Dumper::Indent = 0;
            local $Data::Dumper::Useqq  = 1;

            # dump the attribute from WorkOrderGet() and the reference attribute
            ## no critic
            my $WorkOrderAttribute = Data::Dumper::Dumper( $WorkOrderData->{$RequestedAttribute} );    ## no critic
            my $ReferenceAttribute = Data::Dumper::Dumper( $ReferenceData->{WorkOrderGet}->{$RequestedAttribute} )
                ;                                                                                      ## no critic
            ## use critic

            $Self->Is(
                $WorkOrderAttribute,
                $ReferenceAttribute,
                "Test $TestCount: |- $RequestedAttribute (WorkOrderID: $WorkOrderID)",
            );
        }
    }    # end if 'WorkOrderGet'
}
continue {

    # increase the test count, even on next
    $TestCount++;
}

# ------------------------------------------------------------ #
# test WorkOrderList() and ChangeGet()
# ------------------------------------------------------------ #

# Test whether WorkOrderList() and ChangeGet() return the same workorders as we created.
for my $ChangeID ( sort keys %WorkOrderIDForChangeID ) {

    # ask the WorkOrder object for a list of workorders
    my $ListFromWorkOrderObject = $WorkOrderObject->WorkOrderList(
        UserID   => 1,
        ChangeID => $ChangeID,
    ) || [];
    my %MapFromWorkOrderObject = map { $_ => 1 } @{$ListFromWorkOrderObject};

    # ask the Change object for a list of workorders
    my $Change = $ChangeObject->ChangeGet(
        UserID   => 1,
        ChangeID => $ChangeID,
    ) || {};
    my $ListFromChangeObject = $Change->{WorkOrderIDs} || [];
    my %MapFromChangeObject = map { $_ => 1 } @{$ListFromChangeObject};

    # check whether the created workorders were found by WorkOrderList()
    for my $WorkOrderID ( sort keys %{ $WorkOrderIDForChangeID{$ChangeID} } ) {
        $Self->True(
            $MapFromWorkOrderObject{$WorkOrderID},
            'Test '
                . $TestCount++
                . ": WorkOrderList() - WorkOrderID $WorkOrderID in list from WorkOrder object.",
        );
        $Self->True(
            $MapFromChangeObject{$WorkOrderID},
            'Test '
                . $TestCount++
                . ": ChangeGet() - WorkOrderID $WorkOrderID in list from Change object.",
        );
    }

    # check the number of workorders for a change
    $Self->Is(
        scalar @{$ListFromWorkOrderObject},
        scalar keys %{ $WorkOrderIDForChangeID{$ChangeID} },
        'Test ' . $TestCount++ . ": WorkOrderList() - number of workorders for a change.",
    );
    $Self->Is(
        scalar @{$ListFromChangeObject},
        scalar keys %{ $WorkOrderIDForChangeID{$ChangeID} },
        'Test ' . $TestCount++ . ": ChangeGet() - number of workorders for a change.",
    );

    # set efforts test...
    my $EffortsFromWorkOrderObject = $WorkOrderObject->WorkOrderChangeEffortsGet(
        UserID   => 1,
        ChangeID => $ChangeID,
    );

    for my $EffortKey ( sort keys %{$EffortsFromWorkOrderObject} ) {
        $Self->Is(
            $Change->{$EffortKey},
            $EffortsFromWorkOrderObject->{$EffortKey},
            'Test '
                . $TestCount++
                . ": WorkOrderChangeEffortsGet() and ChangeGet() - $EffortKey match",
        );
    }

    # set time test...
    my $TimeFromWorkOrderObject = $WorkOrderObject->WorkOrderChangeTimeGet(
        UserID   => 1,
        ChangeID => $ChangeID,
    );

    for my $TimeKey ( sort keys %{$TimeFromWorkOrderObject} ) {
        $Self->Is(
            $Change->{$TimeKey},
            $TimeFromWorkOrderObject->{$TimeKey},
            'Test '
                . $TestCount++
                . ": WorkOrderChangeTimeGet() and ChangeGet() - $TimeKey match",
        );
    }

}

# count all tests that are required to and planned for fail
my $Fails = scalar grep { $_->{Fails} } @WorkOrderTests;
my $NrCreateWorkOrders = ( scalar @WorkOrderTests ) - $Fails;

# test if the workorders were created
$Self->Is(
    scalar keys %TestedWorkOrderID || 0,
    $NrCreateWorkOrders,
    'Test ' . $TestCount++ . ': amount of workorder objects and test cases.',
);

# ------------------------------------------------------------ #
# define general workorder search tests
# ------------------------------------------------------------ #

my $StringSearchTestChange = $ChangeObject->ChangeGet(
    ChangeID => $StringSearchTestID,
    UserID   => 1,
);

my @WorkOrderSearchTests = (

    # Nr 1 - a simple check if the search functions takes care of "Limit"
    {
        Description => 'Limit',
        SearchData  => {
            Limit => 3,    # expect only 3 results
        },
        ResultData => {
            TestCount => 1,    # flag for check result amount
            Count     => 3,    # check on 3 results
        },
    },

    # Nr 2 - a simple check that should find all workorders
    {
        Description => 'Limit',
        SearchData  => {
        },
        ResultData => {
            TestExistence => 1,    # flag for check results that were marked with 'SearchTest'
        },
    },

    # Nr 3 - search for title
    {
        Description => 'WorkOrderTitle',
        SearchData  => {
            WorkOrderTitle => 'WorkOrder 1 - Title - ' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 4 - search for instruction
    # Note the extra newlines injected by ToAscii()
    {
        Description => 'Instruction',
        SearchData  => {
            Instruction => "WorkOrder 1 - Instruction -\n$UniqueSignature\n",
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 5 - search for report
    # ToAscii() adds no newlines, as the string length is less than 78.
    {
        Description => 'Report',
        SearchData  => {
            Report => 'WorkOrder 1 - Report - ' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 6 - search for title, instruction and report
    # Note the extra newlines injected by ToAscii().
    {
        Description => 'WorkOrderTitle, Instruction, Report',
        SearchData  => {
            WorkOrderTitle => 'WorkOrder 1 - Title - ' . $UniqueSignature,
            Instruction    => "WorkOrder 1 - Instruction -\n$UniqueSignature\n",
            Report         => "WorkOrder 1 - Report - $UniqueSignature",
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 7 - search for title, which is not in database
    {
        Description => 'WorkOrderTitle does not exist',
        SearchData  => {
            WorkOrderTitle => 'NOT IN DATABASE ' . $UniqueSignature,
        },
        ResultData => {
            TestCount => 1,
            Count     => 0,
        },
    },

    # Nr 8 - search for ChangeID
    {
        Description => 'ChangeID does exist',
        SearchData  => {
            ChangeIDs => [$WorkOrderAddTestID],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 9 - search for change id, which is not in database
    {
        Description => 'All WorkOrders for Change 1_000_000',
        SearchData  => {
            ChangeIDs => [1_000_000],
        },
        ResultData => {
            TestCount => 1,
            Count     => 0,
        },
    },

    # Nr 10 - search for non-existing change id and existing title which is not in database
    {
        Description => 'All WorkOrders for Change 1_000_000 and an existing title',
        SearchData  => {
            ChangeIDs      => [1_000_000],
            WorkOrderTitle => 'WorkOrder 1 - Title - ' . $UniqueSignature,
        },
        ResultData => {
            TestCount => 1,
            Count     => 0,
        },
    },

    # Nr 11 - search for existing ChangeID and existing WorkOrderTitle
    {
        Description => 'ChangeID does exist, WorkOrderTitle does exist',
        SearchData  => {
            ChangeIDs      => [$WorkOrderAddTestID],
            WorkOrderTitle => 'WorkOrder 1 - Title - ' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 12 - search for existing change id and for title, which is not in database
    {
        Description => 'ChangeID does exist, WorkOrderTitle does not exist',
        SearchData  => {
            ChangeIDs      => [$WorkOrderAddTestID],
            WorkOrderTitle => 'NOT IN DATABASE ' . $UniqueSignature,
        },
        ResultData => {
            TestCount => 1,
            Count     => 0,
        },
    },

    # Nr 13 - search for workorder types
    {
        Description => 'Search for WorkOrder type',
        SearchData  => {
            ChangeIDs        => [$WorkOrderAddTestID],
            WorkOrderTypeIDs => [
                $WorkOrderTypeName2ID{approval},
                $WorkOrderTypeName2ID{pir},
            ],
            WorkOrderTitle => '%' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 14 - search for nonexistent change title
    {
        Description => 'Search for nonexistent change title',
        SearchData  => {
            ChangeIDs   => [$StringSearchTestID],
            ChangeTitle => 'NONEXISTENT Change 3 - Title - ' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 15 - search for change title
    {
        Description => 'Search for change title',
        SearchData  => {
            ChangeIDs   => [$StringSearchTestID],
            ChangeTitle => 'Change 3 - Title - ' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 16 - search for nonexistent change description
    {
        Description => 'Search for nonexistent change description',
        SearchData  => {
            ChangeIDs         => [$StringSearchTestID],
            ChangeDescription => 'NONEXISTENT Change 3 - Description - ' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 17 - search for change description
    {
        Description => 'Search for change description',
        SearchData  => {
            ChangeIDs         => [$StringSearchTestID],
            ChangeDescription => 'Change 3 - Description - ' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 18 - search for nonexistent change justification
    {
        Description => 'Search for nonexistent change justification',
        SearchData  => {
            ChangeIDs           => [$StringSearchTestID],
            ChangeJustification => 'NONEXISTENT Change 3 - Justification - ' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 19 - search for change justification
    {
        Description => 'Search for change justification',
        SearchData  => {
            ChangeIDs           => [$StringSearchTestID],
            ChangeJustification => "Change 3 - Justification -\n$UniqueSignature\n",
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 20 - search for nonexistent change number
    {
        Description => 'Search for nonexistent change number',
        SearchData  => {
            ChangeIDs    => [$StringSearchTestID],
            ChangeNumber => 'NONEXISTENT ' . $StringSearchTestChange->{ChangeNumber},
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 21 - search for change number
    {
        Description => 'Search for change number',
        SearchData  => {
            ChangeIDs    => [$StringSearchTestID],
            ChangeNumber => $StringSearchTestChange->{ChangeNumber},
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 22 - search for change title, change number, description and justification
    {
        Description => 'Search for change title, change number, description and justification',
        SearchData  => {
            ChangeIDs           => [$StringSearchTestID],
            ChangeNumber        => $StringSearchTestChange->{ChangeNumber},
            ChangeTitle         => 'Change 3 - Title - ' . $UniqueSignature,
            ChangeDescription   => "Change 3 - Description - $UniqueSignature",
            ChangeJustification => "Change 3 - Justification -\n$UniqueSignature\n",
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 23 - search for workorder types "approval" and "pir"',
    {
        Description => 'Search for WorkOrder types "approval" and "pir"',
        SearchData  => {
            ChangeIDs      => [$WorkOrderAddTestID],
            WorkOrderTypes => [ 'approval', 'pir' ],
            WorkOrderTitle => '%' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 24 - search for workorder types (same types several times)
    {
        Description => 'Search for WorkOrder types (same types several times)',
        SearchData  => {
            ChangeIDs      => [$WorkOrderAddTestID],
            WorkOrderTypes => [ 'approval', 'pir', 'approval', 'pir' ],
            WorkOrderTitle => '%' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 25 - search for workorder types
    {
        Description => 'Search for WorkOrder type (non-existent type)',
        SearchData  => {
            ChangeIDs      => [$WorkOrderAddTestID],
            WorkOrderTypes => [ 'approval', 'pir', 'non-existent' ],
            WorkOrderTitle => '%' . $UniqueSignature,
        },
        SearchFails => 1,
    },

    # Nr 26 - search for workorder state (non-existent state)
    {
        Description => 'Search for WorkOrder state (non-existent state)',
        SearchData  => {
            ChangeIDs       => [$WorkOrderAddTestID],
            WorkOrderStates => ['non-existent'],
            WorkOrderTitle  => '%' . $UniqueSignature,
        },
        SearchFails => 1,
    },

    # Nr 27 - search for workorder states
    {
        Description => 'Search for WorkOrder states "closed" and "ready"',
        SearchData  => {
            ChangeIDs       => [$WorkOrderAddTestID],
            WorkOrderStates => [ 'closed', 'ready' ],
            WorkOrderTitle  => '%' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 28 - Search for WorkOrder states "closed" and "ready" (two times)
    {
        Description => 'Search for WorkOrder states "closed" and "ready" (two times)',
        SearchData  => {
            ChangeIDs       => [$WorkOrderAddTestID],
            WorkOrderStates => [ 'closed', 'ready', 'closed', 'ready' ],
            WorkOrderTitle  => '%' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 29 - Search for WorkOrder states "closed", "ready" and "non-existent"
    {
        Description => 'Search for WorkOrder states "closed", "ready" and "non-existent"',
        SearchData  => {
            ChangeIDs       => [$WorkOrderAddTestID],
            WorkOrderStates => [ 'closed', 'ready', 'non-existent' ],
            WorkOrderTitle  => '%' . $UniqueSignature,
        },
        SearchFails => 1,
    },

    # Nr 30 - Search for an invalid WorkOrder state id
    {
        Description => 'Search for an invalid WorkOrder state id',
        SearchData  => {
            ChangeIDs         => [$WorkOrderAddTestID],
            WorkOrderStateIDs => [-11],
            WorkOrderTitle    => '%' . $UniqueSignature,
        },
        SearchFails => 1,
    },

    # Nr 31 - Search for an invalid WorkOrder type id
    {
        Description => 'Search for an invalid WorkOrder type id',
        SearchData  => {
            ChangeIDs        => [$WorkOrderAddTestID],
            WorkOrderTypeIDs => [-11],
            WorkOrderTitle   => '%' . $UniqueSignature,
        },
        SearchFails => 1,
    },

    # Nr 32 - Search for normalized title, leading whitespace
    {
        Description => 'Search for normalized title, leading whitespace',
        SearchData  => {
            WorkOrderTitle => "Title with leading whitespace - " . $UniqueSignature,
            UsingWildcards => 0,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 33 - Search for normalized title, trailing whitespace
    {
        Description => 'Search for normalized title, trailing whitespace',
        SearchData  => {
            WorkOrderTitle => "Title with trailing whitespace - " . $UniqueSignature,
            UsingWildcards => 0,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 34 - Search for normalized title, leading and trailing whitespace
    {
        Description => 'Search for normalized title, leading and trailing whitespace',
        SearchData  => {
            WorkOrderTitle => "Title with leading and trailing whitespace - " . $UniqueSignature,
            UsingWildcards => 0,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 35 - Search for workorder dynamic fields
    {
        Description => 'Search for workorder dynamic fields',
        SearchData  => {
            'DynamicField_' . $UniqueNamePrefix . 'Test1' => {
                Equals => 'AAAA',
            },
            'DynamicField_' . $UniqueNamePrefix . 'Test2' => {
                Equals => 'BBBB',
            },
            UsingWildcards => 0,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 2,
        },
    },

    # Nr 36 - Search for workorder dynamic fields
    {
        Description => 'Search for workorder dynamic fields',
        SearchData  => {
            WorkOrderTitle => 'Test add workorder with dynamic fields - ' . $UniqueSignature,
            'DynamicField_' . $UniqueNamePrefix . 'Test1' => {
                Equals => 'AAAA',
            },
            'DynamicField_' . $UniqueNamePrefix . 'Test2' => {
                Equals => 'BBBB',
            },
            'DynamicField_' . $UniqueNamePrefix . 'Test3' => {
                Equals => 'XXXX',
            },
            'DynamicField_' . $UniqueNamePrefix . 'Test4' => {
                Equals => 'YYYY',
            },
            UsingWildcards => 1,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

);

my $SearchTestCount = 1;

TEST:
for my $Test (@WorkOrderSearchTests) {

    # check SearchData attribute
    if ( !$Test->{SearchData} || ref( $Test->{SearchData} ) ne 'HASH' ) {

        $Self->True(
            0,
            "Test $TestCount: SearchData found for this test.",
        );

        next TEST;
    }

    $Self->True(
        1,
        'call WorkOrderSearch with params: '
            . $Test->{Description}
            . " (SearchTestCase: $SearchTestCount)",
    );

    # get a ref to an array of found ids
    my $WorkOrderIDs = $WorkOrderObject->WorkOrderSearch(
        %{ $Test->{SearchData} },
        Result   => 'ARRAY',
        UserID   => 1,
        ChangeID => $WorkOrderAddTestID,
    );

    # get a count of found ids
    my $CountWorkOrderIDs = $WorkOrderObject->WorkOrderSearch(
        %{ $Test->{SearchData} },
        Result   => 'COUNT',
        UserID   => 1,
        ChangeID => $WorkOrderAddTestID,
    );

    if ( $Test->{SearchFails} ) {
        $Self->True(
            !defined($WorkOrderIDs),
            "Test $TestCount: WorkOrderSearch() is expected to fail (Result => 'ARRAY')",
        );
        $Self->True(
            !defined($CountWorkOrderIDs),
            "Test $TestCount: WorkOrderSearch() is expected to fail (Result => 'COUNT')",
        );
    }
    else {
        $Self->True(
            defined($WorkOrderIDs) && ref($WorkOrderIDs) eq 'ARRAY',
            "Test $TestCount: |- array reference for WorkOrderIDs.",
        );
        $Self->True(
            defined($CountWorkOrderIDs) && ref $CountWorkOrderIDs eq '',
            "Test $TestCount: |- scalar for CountWorkOrderIDs.",
        );
    }

    $WorkOrderIDs ||= [];
    $CountWorkOrderIDs ||= 0;

    if ( $Test->{ResultData}->{TestCount} ) {

        # get number of workorder ids WorkOrderSearch should return
        my $ExpectedCount = scalar keys %{ $WorkOrderIDForSearchTest{$SearchTestCount} };

        # get defined expected result count (defined in search test case!)
        if ( exists $Test->{ResultData}->{Count} ) {
            $ExpectedCount = $Test->{ResultData}->{Count}
        }

        # check the number of IDs in the returned arrayref
        $Self->Is(
            scalar @{$WorkOrderIDs},
            $ExpectedCount,
            "Test $TestCount: |- Number of found workorders.",
        );

        # When a 'Limit' has been passed, then the returned count not necessarily matches
        # the number of IDs in the returned array. In that case testing is futile.
        if ( !$Test->{SearchData}->{Limit} ) {
            $Self->Is(
                $CountWorkOrderIDs,
                $ExpectedCount,
                "Test $TestCount: |- Number of found workorders (Result => 'COUNT').",
            );
        }
    }

    if ( $Test->{ResultData}->{TestExistence} ) {

        # check if all ids that belongs to this searchtest are returned
        my @WorkOrderIDs = keys %{ $WorkOrderIDForSearchTest{$SearchTestCount} };

        my %ReturnedWorkOrderID = map { $_ => 1 } @{$WorkOrderIDs};
        for my $WorkOrderID (@WorkOrderIDs) {
            $Self->True(
                $ReturnedWorkOrderID{$WorkOrderID},
                "Test $TestCount: |- WorkOrderID $WorkOrderID found in returned list.",
            );
        }
    }
}
continue {
    $TestCount++;
    $SearchTestCount++;
}

# ------------------------------------------------------------ #
# define workorder search tests for 'OrderBy' searches
# ------------------------------------------------------------ #

# get three change ids. Then get the data. That is needed for sorting
my @WorkOrderIDsForOrderByTests = keys %{ $WorkOrderIDForSearchTest{999999} };
my @WorkOrdersForOrderByTests;

for my $WorkOrderIDForOrderByTests (@WorkOrderIDsForOrderByTests) {
    my $WorkOrderData = $WorkOrderObject->WorkOrderGet(
        WorkOrderID => $WorkOrderIDForOrderByTests,
        UserID      => 1,
    );

    # convert time string to numbers - that's better for the comparisons
    for my $TimeColumn (qw(CreateTime ChangeTime)) {
        $WorkOrderData->{$TimeColumn} =~ s{ \D }{}xmsg;
    }

    push @WorkOrdersForOrderByTests, $WorkOrderData;
}

my @OrderByColumns = qw(
    WorkOrderID
    WorkOrderNumber
    WorkOrderTitle
    WorkOrderStateID
    WorkOrderTypeID
    CreateBy
    ChangeBy
    CreateTime
    ChangeTime
);

for my $OrderByColumn (@OrderByColumns) {

    # turn off all pretty print
    local $Data::Dumper::Indent = 0;
    local $Data::Dumper::Useqq  = 1;

    # WorkOrderSearch() sorts the ID-Fields numerically, the string fields alphabetically.
    # the sorting is completely determined by the second comparison
    my @SortedWorkOrders;
    if ( $OrderByColumn eq 'WorkOrderTitle' ) {
        @SortedWorkOrders = sort {
            $a->{$OrderByColumn} cmp $b->{$OrderByColumn}
                || $b->{WorkOrderID} <=> $a->{WorkOrderID}
        } @WorkOrdersForOrderByTests;
    }
    else {
        @SortedWorkOrders = sort {
            $a->{$OrderByColumn} <=> $b->{$OrderByColumn}
                || $b->{WorkOrderID} <=> $a->{WorkOrderID}
        } @WorkOrdersForOrderByTests;
    }
    my @SortedIDs = map { $_->{WorkOrderID} } @SortedWorkOrders;

    # dump the reference attribute
    my $ReferenceList = Data::Dumper::Dumper( \@SortedIDs );    ## no critic

    my $SearchResult = $WorkOrderObject->WorkOrderSearch(
        ChangeIDs        => [$OrderByTestID],
        OrderBy          => [$OrderByColumn],
        OrderByDirection => ['Up'],
        UserID           => 1,
    );

    # dump the attribute from WorkOrderGet()
    my $SearchList = Data::Dumper::Dumper($SearchResult);       ## no critic

    $Self->Is(
        $SearchList,
        $ReferenceList,
        'Test ' . $TestCount++ . ": WorkOrderSearch() OrderBy $OrderByColumn (Up)."
    );

    # sort in the other direction

    # WorkOrderSearch() sorts the ID-Fields numerically, the string fields alphabetically.
    # the sorting is completely determined by the second comparison
    if ( $OrderByColumn eq 'WorkOrderTitle' ) {
        @SortedWorkOrders = sort {
            $b->{$OrderByColumn} cmp $a->{$OrderByColumn}
                || $b->{WorkOrderID} <=> $a->{WorkOrderID}
        } @WorkOrdersForOrderByTests;
    }
    else {
        @SortedWorkOrders = sort {
            $b->{$OrderByColumn} <=> $a->{$OrderByColumn}
                || $b->{WorkOrderID} <=> $a->{WorkOrderID}
        } @WorkOrdersForOrderByTests;
    }
    my @SortedIDsDown = map { $_->{WorkOrderID} } @SortedWorkOrders;

    # dump the reference attribute
    my $ReferenceListDown = Data::Dumper::Dumper( \@SortedIDsDown );    ## no critic

    my $SearchResultDown = $WorkOrderObject->WorkOrderSearch(
        ChangeIDs => [$OrderByTestID],
        OrderBy   => [$OrderByColumn],
        UserID    => 1,
    );

    # dump the attribute from WorkOrderGet()
    my $SearchListDown = Data::Dumper::Dumper($SearchResultDown);       ## no critic

    $Self->Is(
        $SearchListDown,
        $ReferenceListDown,
        'Test ' . $TestCount++ . ": WorkOrderSearch() OrderBy $OrderByColumn (Down)."
    );

    # check if WorkOrder.pm handles non-existent OrderByDirection criteria correct
    my $SearchResultSideways = $WorkOrderObject->WorkOrderSearch(
        WorkOrderTitle   => 'WorkOrderAdd() for OrderBy - Title - ' . $UniqueSignature,
        OrderBy          => [$OrderByColumn],
        OrderByDirection => ['Sideways'],
        UserID           => 1,
    );

    $Self->Is(
        $SearchResultSideways,
        undef,
        'Test ' . $TestCount++ . ": WorkOrderSearch() OrderBy $OrderByColumn (Sideways)."
    );
}

# --------------------------------------------------------------------------------------- #
# test sorting of changes (some have no workorder, others have several workorders)
# --------------------------------------------------------------------------------------- #
my %IDsToDelete = (
    Change    => [],
    WorkOrder => [],
);
my $ChangesTitle       = 'ChangeSearchOrderByTimes - ' . $UniqueSignature;
my @ChangesForSortTest = (
    {
        Change => {
            ChangeTitle => $ChangesTitle,
            UserID      => 1,
        },
        Workorders => [
            {
                ActualStartTime => '2009-06-30 09:33:12',
                ActualEndTime   => '2009-09-01 01:12:55',
                UserID          => 1,
            },
        ],
    },
    {
        Change => {
            ChangeTitle => $ChangesTitle,
            UserID      => 1,
        },
        Workorders => [
            {
                PlannedStartTime => '2009-02-21 13:25:09',
                PlannedEndTime   => '2009-10-13 22:15:56',
                ActualStartTime  => '2009-05-31 09:33:12',
                ActualEndTime    => '2009-10-01 01:12:55',
                UserID           => 1,
            },
            {
                PlannedStartTime => '2009-03-25 13:25:09',
                PlannedEndTime   => '2009-09-13 22:15:56',
                ActualStartTime  => '2009-06-01 09:33:12',
                ActualEndTime    => '2009-11-01 01:12:55',
                UserID           => 1,
            },
        ],
    },
    {
        Change => {
            ChangeTitle => $ChangesTitle,
            UserID      => 1,
        },
        Workorders => [],
    },
    {
        Change => {
            ChangeTitle => $ChangesTitle,
            UserID      => 1,
        },
        Workorders => [
            {
                PlannedStartTime => '2009-03-21 13:25:09',
                PlannedEndTime   => '2009-10-13 22:15:56',
                ActualStartTime  => '2009-06-30 09:33:12',
                ActualEndTime    => '2009-09-01 01:12:55',
                UserID           => 1,
            },
            {
                PlannedStartTime => '2009-03-20 13:25:09',
                PlannedEndTime   => '2009-10-12 22:15:56',
                UserID           => 1,
            },
            {
                PlannedStartTime => '2009-03-22 13:25:09',
                PlannedEndTime   => '2009-10-11 22:15:56',
                UserID           => 1,
            },
        ],
    },
);

my @ChangeIDsForSortTest;
for my $Change (@ChangesForSortTest) {

    # create change
    my $ChangeID = $ChangeObject->ChangeAdd( %{ $Change->{Change} } );

    $Self->True(
        $ChangeID,
        "Test $TestCount: Change for sort test created",
    );

    # store ChangeID
    push @ChangeIDsForSortTest, $ChangeID;
    push @{ $IDsToDelete{Change} }, $ChangeID;

    # add the workorders for the change
    my $WorkOrderCount = 1;
    for my $WorkOrder ( @{ $Change->{Workorders} } ) {
        my $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
            ChangeID => $ChangeID,
            %{$WorkOrder},
        );

        $Self->True(
            $WorkOrderID,
            "Test $TestCount: WorkOrder $WorkOrderCount for Change created",
        );

        push @{ $IDsToDelete{WorkOrder} }, $WorkOrderID;

        $WorkOrderCount++;
    }

    # check whether the workorders were added
    my $ChangeData = $ChangeObject->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => 1,
    );
    $Self->Is(
        $ChangeData->{WorkOrderCount},
        scalar @{ $Change->{Workorders} },
        "Test $TestCount: |- ChangeGet(): workorders were added"
    );
}
continue {
    $TestCount++;
}

my @Testplan = (
    [ 0, 3, 1, 2 ],    # index of changes in @ChangeIDsForSortTest
    [ 0, 1, 3, 2 ],
    [ 0, 3, 1, 2 ],
    [ 3, 1, 0, 2 ],
);

# Do the testing
my $OrderByTestCount = 0;
for my $OrderByColumn (qw(PlannedStartTime PlannedEndTime ActualStartTime ActualEndTime)) {

    # turn off all pretty print
    local $Data::Dumper::Indent = 0;
    local $Data::Dumper::Useqq  = 1;

    # get the current reference array
    my @TestplanAlternative = @{ $Testplan[$OrderByTestCount] };

    # place the last element at front of the array
    # some DBs sort the NULLs values at front of the result set
    my $Last = pop @TestplanAlternative;
    unshift @TestplanAlternative, $Last;

    # result what we expect
    my @ResultReference            = map { $ChangeIDsForSortTest[$_] } @{ $Testplan[$OrderByTestCount] };
    my @ResultReferenceAlternative = map { $ChangeIDsForSortTest[$_] } @TestplanAlternative;

    # search with direction 'DOWN'
    my $SearchResult = $ChangeObject->ChangeSearch(
        ChangeTitle      => $ChangesTitle,
        OrderBy          => [ $OrderByColumn, 'ChangeID' ],
        OrderByDirection => [ 'Down', 'Up' ],
        UserID           => 1,
    );

    if (
        Data::Dumper::Dumper($SearchResult)             ## no critic
        eq Data::Dumper::Dumper( \@ResultReference )    ## no critic
        )
    {
        $Self->Is(
            Data::Dumper::Dumper($SearchResult),          ## no critic
            Data::Dumper::Dumper( \@ResultReference ),    ## no critic
            "Test $TestCount: ChangeSearch OrderBy $OrderByColumn (Down)",
        );
    }
    elsif (
        Data::Dumper::Dumper($SearchResult)                        ## no critic
        eq Data::Dumper::Dumper( \@ResultReferenceAlternative )    ## no critic
        )
    {
        $Self->Is(
            Data::Dumper::Dumper($SearchResult),                     ## no critic
            Data::Dumper::Dumper( \@ResultReferenceAlternative ),    ## no critic
            "Test $TestCount: ChangeSearch OrderBy $OrderByColumn (Down)",
        );
    }
    else {
        $Self->Is(
            Data::Dumper::Dumper($SearchResult),                     ## no critic
            undef,
            "Test $TestCount: ChangeSearch OrderBy $OrderByColumn (Down)",
        );
    }

    # search with direction 'UP'
    my $SearchResultUp = $ChangeObject->ChangeSearch(
        ChangeTitle      => $ChangesTitle,
        OrderBy          => [ $OrderByColumn, 'ChangeID' ],
        OrderByDirection => [ 'Up', 'Down' ],
        UserID           => 1,
    );

    if (
        Data::Dumper::Dumper($SearchResultUp)    ## no critic
        eq Data::Dumper::Dumper( [ reverse @ResultReference ] )    ## no critic
        )
    {
        $Self->Is(
            Data::Dumper::Dumper($SearchResultUp),                 ## no critic
            Data::Dumper::Dumper( [ reverse @ResultReference ] ),  ## no critic
            "Test $TestCount: ChangeSearch OrderBy $OrderByColumn (Up)",
        );
    }
    elsif (
        Data::Dumper::Dumper($SearchResultUp)                      ## no critic
        eq Data::Dumper::Dumper( [ reverse @ResultReferenceAlternative ] )    ## no critic
        )
    {
        $Self->Is(
            Data::Dumper::Dumper($SearchResultUp),                            ## no critic
            Data::Dumper::Dumper( [ reverse @ResultReferenceAlternative ] ),  ## no critic
            "Test $TestCount: ChangeSearch OrderBy $OrderByColumn (Up)",
        );
    }
    else {
        $Self->Is(
            Data::Dumper::Dumper($SearchResultUp),                            ## no critic
            undef,
            "Test $TestCount: ChangeSearch OrderBy $OrderByColumn (Up)",
        );
    }

    $OrderByTestCount++;
    $TestCount++;
}

# ------------------------------------------------------------ #
# advanced search by tests for times
# ------------------------------------------------------------ #

my @TimeSearchTests = (
    {
        Description => 'First workorder in the 19th century.',
        SourceData  => {
            WorkOrderAdd => {
                UserID           => 1,
                PlannedStartTime => '1909-01-01 00:00:00',
                PlannedEndTime   => '1909-01-30 00:00:00',
                ActualStartTime  => '1909-01-02 00:00:00',
                ActualEndTime    => '1909-01-29 00:00:00',
            },
        },
    },
    {
        Description => 'Second workorder in the 19th century.',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID           => 1,
                PlannedStartTime => '1909-01-10 00:00:00',
                PlannedEndTime   => '1909-01-20 00:00:00',
                ActualStartTime  => '1909-01-11 00:00:00',
                ActualEndTime    => '1909-01-19 00:00:00',
            },
        },
    },
    {
        Description => 'Third change with one workorder in the 19th century.',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID           => 1,
                PlannedStartTime => '1909-02-01 00:00:00',
                PlannedEndTime   => '1909-02-27 00:00:00',
                ActualStartTime  => '1909-02-02 00:00:00',
                ActualEndTime    => '1909-02-26 00:00:00',
            },
        },
    },
    {
        Description => 'Fourth workorder in the 19th century.',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID           => 1,
                PlannedStartTime => '1909-03-01 00:00:00',
                PlannedEndTime   => '1909-04-07 00:00:00',
                ActualStartTime  => '1909-02-20 00:00:00',
                ActualEndTime    => '1909-05-01 00:00:00',
            },
        },
    },

    #---------------------------------#
    # test for planned start time
    #---------------------------------#
    {
        Description => 'Search for PlannedStartTimeNewerDate and PlannedStartTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                    => 1,
                PlannedStartTimeNewerDate => '1909-01-01 00:00:00',
                PlannedStartTimeOlderDate => '1909-01-02 00:00:00',
            },
        },
        ReferenceData => [
            0,
        ],
    },
    {
        Description => 'Search for PlannedStartTimeNewerDate and PlannedStartTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                    => 1,
                PlannedStartTimeNewerDate => '1908-12-01 00:00:00',
                PlannedStartTimeOlderDate => '1908-12-31 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for PlannedStartTimeNewerDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                    => 1,
                PlannedStartTimeNewerDate => '1909-02-01 00:00:00',
            },
        },
        ReferenceData => [ 2, 3, ],
    },
    {
        Description => 'Search for PlannedStartTimeNewerDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                    => 1,
                PlannedStartTimeNewerDate => '1909-12-01 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for PlannedStartTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                    => 1,
                PlannedStartTimeOlderDate => '1909-01-10 00:00:00',
            },
        },
        ReferenceData => [ 0, 1, ],
    },
    {
        Description => 'Search for PlannedStartTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                    => 1,
                PlannedStartTimeOlderDate => '1908-01-31 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for PlannedStartTimeNewerDate and PlannedStartTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                    => 1,
                PlannedStartTimeNewerDate => '1909-12-01 00:00:00',
                PlannedStartTimeOlderDate => '1908-12-01 00:00:00',
            },
        },
        ReferenceData => [],
    },

    #---------------------------------#
    # test for planned end time
    #---------------------------------#
    {
        Description => 'Search for PlannedEndTimeNewerDate and PlannedEndTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                  => 1,
                PlannedEndTimeNewerDate => '1909-01-30 00:00:00',
                PlannedEndTimeOlderDate => '1909-01-31 00:00:00',
            },
        },
        ReferenceData => [
            0,
        ],
    },
    {
        Description => 'Search for PlannedEndTimeNewerDate and PlannedEndTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                  => 1,
                PlannedEndTimeNewerDate => '1908-12-01 00:00:00',
                PlannedEndTimeOlderDate => '1908-12-31 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for PlannedEndTimeNewerDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                  => 1,
                PlannedEndTimeNewerDate => '1909-02-27 00:00:00',
            },
        },
        ReferenceData => [ 2, 3, ],
    },
    {
        Description => 'Search for PlannedEndTimeNewerDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                  => 1,
                PlannedEndTimeNewerDate => '1909-05-01 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for PlannedEndTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                  => 1,
                PlannedEndTimeOlderDate => '1909-01-25 00:00:00',
            },
        },
        ReferenceData => [ 1, ],
    },
    {
        Description => 'Search for PlannedEndTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                  => 1,
                PlannedEndTimeOlderDate => '1908-01-31 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for PlannedEndTimeNewerDate and PlannedEndTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                  => 1,
                PlannedEndTimeNewerDate => '1909-05-01 00:00:00',
                PlannedEndTimeOlderDate => '1908-12-01 00:00:00',
            },
        },
        ReferenceData => [],
    },

    #---------------------------------#
    # test for actual start time
    #---------------------------------#
    {
        Description => 'Search for ActualStartTimeNewerDate and ActualStartTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                   => 1,
                ActualStartTimeNewerDate => '1909-01-02 00:00:00',
                ActualStartTimeOlderDate => '1909-01-02 00:00:00',
            },
        },
        ReferenceData => [
            0,
        ],
    },
    {
        Description => 'Search for ActualStartTimeNewerDate and ActualStartTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                   => 1,
                ActualStartTimeNewerDate => '1908-12-01 00:00:00',
                ActualStartTimeOlderDate => '1908-12-31 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for ActualStartTimeNewerDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                   => 1,
                ActualStartTimeNewerDate => '1909-02-01 00:00:00',
            },
        },
        ReferenceData => [ 2, 3, ],
    },
    {
        Description => 'Search for ActualStartTimeNewerDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                   => 1,
                ActualStartTimeNewerDate => '1909-12-30 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for ActualStartTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                   => 1,
                ActualStartTimeOlderDate => '1909-01-12 00:00:00',
            },
        },
        ReferenceData => [ 0, 1, ],
    },
    {
        Description => 'Search for ActualStartTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                   => 1,
                ActualStartTimeOlderDate => '1908-01-31 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for ActualStartTimeNewerDate and ActualStartTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                   => 1,
                ActualStartTimeNewerDate => '1909-12-01 00:00:00',
                ActualStartTimeOlderDate => '1908-12-01 00:00:00',
            },
        },
        ReferenceData => [],
    },

    #---------------------------------#
    # test for actual end time
    #---------------------------------#
    {
        Description => 'Search for ActualEndTimeNewerDate and ActualEndTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                 => 1,
                ActualEndTimeNewerDate => '1909-01-28 00:00:00',
                ActualEndTimeOlderDate => '1909-01-29 00:00:00',
            },
        },
        ReferenceData => [
            0,
        ],
    },
    {
        Description => 'Search for ActualEndTimeNewerDate and ActualEndTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                 => 1,
                ActualEndTimeNewerDate => '1908-12-01 00:00:00',
                ActualEndTimeOlderDate => '1908-12-31 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for ActualEndTimeNewerDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                 => 1,
                ActualEndTimeNewerDate => '1909-02-26 00:00:00',
            },
        },
        ReferenceData => [ 2, 3, ],
    },
    {
        Description => 'Search for ActualEndTimeNewerDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                 => 1,
                ActualEndTimeNewerDate => '1909-12-01 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for ActualEndTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                 => 1,
                ActualEndTimeOlderDate => '1909-01-29 00:00:00',
            },
        },
        ReferenceData => [ 0, 1, ],
    },
    {
        Description => 'Search for ActualEndTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                 => 1,
                ActualEndTimeOlderDate => '1908-12-01 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for ActualEndTimeNewerDate and ActualEndTimeOlderDate.',
        SourceData  => {
            WorkOrderSearch => {
                UserID                 => 1,
                ActualEndTimeNewerDate => '1909-12-01 00:00:00',
                ActualEndTimeOlderDate => '1908-12-31 00:00:00',
            },
        },
        ReferenceData => [],
    },

);

my $TSTCounter = 1;
my @TSTWorkOrderIDs;
TSTEST:
for my $TSTest (@TimeSearchTests) {
    my $SourceData    = $TSTest->{SourceData};
    my $ReferenceData = $TSTest->{ReferenceData};

    my $WorkOrderID;

    $Self->True(
        1,
        "Test $TestCount: $TSTest->{Description} (TSTest case: $TSTCounter)",
    );

    if ( $SourceData->{WorkOrderAdd} ) {
        $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
            %{ $SourceData->{WorkOrderAdd} },
            ChangeID => $TimeSearchTestID,
        );

        $Self->True(
            $WorkOrderID,
            "Test $TestCount: |- WorkOrderAdd",
        );

        push @TSTWorkOrderIDs, $WorkOrderID;
        push @{ $IDsToDelete{WorkOrder} }, $WorkOrderID;
    }

    my $SearchResult;
    if ( $SourceData->{WorkOrderSearch} ) {
        $SearchResult = $WorkOrderObject->WorkOrderSearch(
            %{ $SourceData->{WorkOrderSearch} },
            ChangeIDs => [$TimeSearchTestID],
        );

        $Self->True(
            $SearchResult && ref $SearchResult eq 'ARRAY',
            "Test $TestCount: WorkOrderSearch() - List is an array reference.",
        );

        next TSTEST if !$SearchResult;

        # check number of founded change
        $Self->Is(
            scalar @{$SearchResult},
            scalar @{$ReferenceData},
            "Test $TestCount: WorkOrderSearch() - correct number of found changes",
        );

        # map array index to WorkOrderID
        my @ResultWorkOrderIDs;
        for my $ResultWorkOrderID ( @{$ReferenceData} ) {
            push @ResultWorkOrderIDs, $TSTWorkOrderIDs[$ResultWorkOrderID];
        }

        # turn off all pretty print
        local $Data::Dumper::Indent = 0;
        local $Data::Dumper::Useqq  = 1;

        # dump the attribute from WorkOrderSearch()
        my $SearchResultDump = Data::Dumper::Dumper( sort @{$SearchResult} );    ## no critic

        # dump the reference attribute
        my $ReferenceDump = Data::Dumper::Dumper( sort @ResultWorkOrderIDs );    ## no critic

        $Self->Is(
            $SearchResultDump,
            $ReferenceDump,
            "Test $TestCount: |- WorkOrderSearch(): "
                . Data::Dumper::Dumper( $SourceData->{WorkOrderSearch} )         ## no critic
                . $SearchResultDump,
        );
    }

    $TestCount++;
    $TSTCounter++;
}

# ------------------------------------------------------------ #
# test WorkOrderChangeTimeGet
# ------------------------------------------------------------ #
my @WOCTGTests = (
    {
        Description => 'test for WorkOrderChangeTimeGet without times.',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID => 1,
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description => 'test for WorkOrderChangeTimeGet with all times',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID           => 1,
                PlannedStartTime => '2009-10-01 00:00:00',
                PlannedEndTime   => '2009-10-02 23:59:59',
                ActualStartTime  => '2009-10-01 00:08:00',
                ActualEndTime    => '2009-10-02 00:18:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '2009-10-01 00:00:00',
                    'PlannedEndTime'   => '2009-10-02 23:59:59',
                    'ActualStartTime'  => '2009-10-01 00:08:00',
                    'ActualEndTime'    => '2009-10-02 00:18:00',
                },
            },
        },
    },
    {
        Description => 'test for WorkOrderChangeTimeGet only with planned times',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID           => 1,
                PlannedStartTime => '2009-10-01 00:00:00',
                PlannedEndTime   => '2009-10-02 23:59:59',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '2009-10-01 00:00:00',
                    'PlannedEndTime'   => '2009-10-02 23:59:59',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description =>
            'test for WorkOrderChangeTimeGet only with planned times PlannedStartTime = PlannedEndTime',
        SourceData => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAddFails => 1,
            WorkOrderAdd      => {
                UserID           => 1,
                PlannedStartTime => '2009-10-01 00:00:00',
                PlannedEndTime   => '2009-10-01 00:00:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description =>
            'test for WorkOrderChangeTimeGet only with planned times PlannedStartTime > PlannedEndTime',
        SourceData => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAddFails => 1,
            WorkOrderAdd      => {
                UserID           => 1,
                PlannedStartTime => '2009-10-01 00:00:01',
                PlannedEndTime   => '2009-10-01 00:00:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description => 'test for WorkOrderChangeTimeGet only with PlannedStartTime',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAddFails => 1,
            WorkOrderAdd      => {
                UserID           => 1,
                PlannedStartTime => '2009-10-01 00:00:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description => 'test for WorkOrderChangeTimeGet only with PlannedEndTime',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAddFails => 1,
            WorkOrderAdd      => {
                UserID         => 1,
                PlannedEndTime => '2009-10-02 23:59:59',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description => 'test for WorkOrderChangeTimeGet only with ActualStartTime',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID          => 1,
                ActualStartTime => '2009-10-01 00:08:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '2009-10-01 00:08:00',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description => 'test for WorkOrderChangeTimeGet only with ActualEndTime',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAddFails => 1,
            WorkOrderAdd      => {
                UserID        => 1,
                ActualEndTime => '2009-10-01 00:08:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description => 'test for WorkOrderChangeTimeGet only with actual times',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID          => 1,
                ActualStartTime => '2009-10-01 00:00:00',
                ActualEndTime   => '2009-10-02 23:59:59',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '2009-10-01 00:00:00',
                    'ActualEndTime'    => '2009-10-02 23:59:59',
                },
            },
        },
    },
    {
        Description => 'test for WorkOrderChangeTimeGet only with ActualStartTime = ActualEndTime',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAddFails => 1,
            WorkOrderAdd      => {
                UserID          => 1,
                ActualStartTime => '2009-10-01 00:00:00',
                ActualEndTime   => '2009-10-01 00:00:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description => 'test for WorkOrderChangeTimeGet only with ActualStartTime > ActualEndTime',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAddFails => 1,
            WorkOrderAdd      => {
                UserID          => 1,
                ActualStartTime => '2009-10-01 00:00:01',
                ActualEndTime   => '2009-10-01 00:00:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description =>
            'test for WorkOrderChangeTimeGet with all times (with reserved time PlannedStartTime)',
        SourceData => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAddFails => 1,
            WorkOrderAdd      => {
                UserID           => 1,
                PlannedStartTime => '9999-01-01 00:00:00',
                PlannedStartTime => '9999-01-01 00:00:01',
                ActualStartTime  => '2009-10-01 00:08:00',
                ActualEndTime    => '2009-10-02 00:18:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description =>
            'test for WorkOrderChangeTimeGet with all times (with reserved time PlannedEndTime)',
        SourceData => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAddFails => 1,
            WorkOrderAdd      => {
                UserID           => 1,
                PlannedStartTime => '2009-10-01 01:01:00',
                PlannedStartTime => '9999-01-01 00:00:00',
                ActualStartTime  => '2009-10-01 00:08:00',
                ActualEndTime    => '2009-10-02 00:18:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description =>
            'test for WorkOrderChangeTimeGet with all times (with reserved time ActualStartTime)',
        SourceData => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAddFails => 1,
            WorkOrderAdd      => {
                UserID           => 1,
                PlannedStartTime => '2009-10-01 01:01:00',
                PlannedEndTime   => '2009-10-01 01:01:01',
                ActualStartTime  => '9999-01-01 00:00:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
    {
        Description =>
            'est for WorkOrderChangeTimeGet with all times (with reserved time ActualEndTime)',
        SourceData => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAddFails => 1,
            WorkOrderAdd      => {
                UserID           => 1,
                PlannedStartTime => '2009-10-01 01:01:00',
                PlannedEndTime   => '2009-10-01 01:01:01',
                ActualStartTime  => '2009-10-01 01:01:00',
                ActualEndTime    => '9999-01-01 00:00:00',
            },
        },
        ReferenceData => {
            WorkOrderChangeTimeGet => {
                UserID     => 1,
                ResultData => {
                    'PlannedStartTime' => '',
                    'PlannedEndTime'   => '',
                    'ActualStartTime'  => '',
                    'ActualEndTime'    => '',
                },
            },
        },
    },
);

my $WOCTGTestCount = 1;
for my $WOCTGTest (@WOCTGTests) {
    my $SourceData    = $WOCTGTest->{SourceData};
    my $ReferenceData = $WOCTGTest->{ReferenceData};

    my $ChangeID;
    my $WorkOrderID;

    $Self->True(
        1,
        "Test $TestCount: $WOCTGTest->{Description} (WOCTGTest case: $WOCTGTestCount)",
    );

    if ( $SourceData->{ChangeAdd} ) {
        $ChangeID = $ChangeObject->ChangeAdd(
            %{ $SourceData->{ChangeAdd} },
        );

        $Self->True(
            $ChangeID,
            "Test $TestCount: |- ChangeAdd",
        );

        if ($ChangeID) {
            $TestedChangeID{$ChangeID} = 1;
        }
    }

    if ( $SourceData->{WorkOrderAdd} ) {
        $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
            %{ $SourceData->{WorkOrderAdd} },
            ChangeID => $ChangeID,
        );

        if ( $SourceData->{WorkOrderAddFails} ) {
            $Self->False(
                $WorkOrderID,
                "Test $TestCount: |- WorkOrderAdd",
            );
        }
        else {
            $Self->True(
                $WorkOrderID,
                "Test $TestCount: |- WorkOrderAdd",
            );
            push @{ $IDsToDelete{WorkOrder} }, $WorkOrderID;
        }
    }

    if ( $ReferenceData->{WorkOrderChangeTimeGet} ) {
        my $Time = $WorkOrderObject->WorkOrderChangeTimeGet(
            %{ $ReferenceData->{WorkOrderChangeTimeGet} },
            ChangeID => $ChangeID,
        );

        $Self->Is(
            ref $Time,
            'HASH',
            "Test $TestCount: |- WorkOrderChangeTimeGet()",
        );

        $Self->True(
            (
                ref $Time eq 'HASH'
                    && %{$Time}
            )
                || 0,
            "Test $TestCount: |- WorkOrderChangeTimeGet() - HashRef with content",
        );

        if (
            ref $Time eq 'HASH'
            && %{$Time}
            )
        {

            # Test for right values in result
            TIMEVALUE:
            for my $TimeType ( sort keys %{$Time} ) {
                $Self->Is(
                    $Time->{$TimeType},
                    $ReferenceData->{WorkOrderChangeTimeGet}->{ResultData}->{$TimeType},
                    "Test $TestCount: |- check TimeResult ($TimeType)",
                );
            }
        }
    }

    $TestCount++;
    $WOCTGTestCount++;
}

# ------------------------------------------------------------ #
# testing the method Permission()
# ------------------------------------------------------------ #

my ($PermissionTestWorkOrderID) = keys %{ $WorkOrderIDForChangeID{$PermissionTestID} };

# get mapping of the group name to the group id
my %GroupName2ID = reverse $GroupObject->GroupList( Valid => 1 );

my @PermissionTests = (

    # Permission test No. 1
    {
        Description => 'Initially no priv in any group',
        SourceData  => {
        },
        ReferenceData => {
            Permissions => {
                0 => {
                    ro => 0,
                    rw => 0
                },
                1 => {
                    ro => 0,
                    rw => 0
                },
            },
        },
    },

    # Permission test No. 2
    {
        Description => 'ro in itsm-change',
        SourceData  => {
            GroupMemberAdd => [
                {
                    GID        => $GroupName2ID{'itsm-change'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 1,
                        rw => 0,
                    },
                },
            ],
        },
        ReferenceData => {
            Permissions => {
                0 => {
                    ro => 1,
                    rw => 0,
                },
                1 => {
                    ro => 0,
                    rw => 0,
                },
            },
        },
    },

    # Permission test No. 3
    # The type 'rw' implies all other types. See Kernel::System::Group_GetTypeString()
    # Therefore User1 effectively has 'ro' in 'itsm-change' and
    # the ChangeAgentCheck Permission module gives 'ro' access.
    # Note that WorkOrderAgentCheck gives 'rw' access only to the workorder agent.
    {

        Description => 'rw in itsm-change grants ro, grants rw to workorder agent',
        SourceData  => {
            GroupMemberAdd => [
                {
                    GID        => $GroupName2ID{'itsm-change'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 1,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change'},
                    UID        => $UserIDs[1],
                    Permission => {
                        ro => 0,
                        rw => 1,
                    },
                },
            ],
        },
        ReferenceData => {
            Permissions => {
                0 => {
                    ro => 1,
                    rw => 1,
                },
                1 => {
                    ro => 1,
                    rw => 0,
                },
            },
        },
    },

    # Permission test No. 4
    # reset User1 after the previous test
    {
        Description => 'revoke privs for user 1',
        SourceData  => {
            GroupMemberAdd => [
                {
                    GID        => $GroupName2ID{'itsm-change'},
                    UID        => $UserIDs[1],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
            ],
        },
    },

    # Permission test No. 5
    {
        Description => 'ro in itsm-change-manager',
        SourceData  => {
            GroupMemberAdd => [
                {
                    GID        => $GroupName2ID{'itsm-change'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-manager'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 1,
                        rw => 0,
                    },
                },
            ],
        },
        ReferenceData => {
            Permissions => {
                0 => {
                    ro => 1,
                    rw => 0,
                },
                1 => {
                    ro => 0,
                    rw => 0,
                },
            },
        },
    },

    # Permission test No. 6
    {
        Description => 'rw in itsm-change-manager',
        SourceData  => {
            GroupMemberAdd => [
                {
                    GID        => $GroupName2ID{'itsm-change'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-manager'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 1,
                        rw => 1,
                    },
                },
            ],
        },
        ReferenceData => {
            Permissions => {
                0 => {
                    ro => 1,
                    rw => 1,
                },
                1 => {
                    ro => 0,
                    rw => 0,
                },
            },
        },
    },

    # Permission test No. 7
    {
        Description => 'ro in itsm-change-builder, User 0 is the builder',
        SourceData  => {
            GroupMemberAdd => [
                {
                    GID        => $GroupName2ID{'itsm-change'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-manager'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-builder'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 1,
                        rw => 0,
                    },
                },
            ],
        },
        ReferenceData => {
            Permissions => {
                0 => {
                    ro => 1,
                    rw => 0,
                },
                1 => {
                    ro => 0,
                    rw => 0,
                },
            },
        },
    },

    # Permission test No. 8
    {
        Description => 'rw in itsm-change-builder, Agent is the builder',
        SourceData  => {
            GroupMemberAdd => [
                {
                    GID        => $GroupName2ID{'itsm-change'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-manager'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-builder'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 1,
                    },
                },
            ],
        },
        ReferenceData => {
            Permissions => {
                0 => {
                    ro => 1,
                    rw => 1,
                },
                1 => {
                    ro => 0,
                    rw => 0,
                },
            },
        },
    },

    # Permission test No. 9
    {
        Description => "ro in itsm-change-builder, user 1 isn't the builder",
        SourceData  => {
            GroupMemberAdd => [
                {
                    GID        => $GroupName2ID{'itsm-change'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-manager'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-builder'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-builder'},
                    UID        => $UserIDs[1],
                    Permission => {
                        ro => 1,
                        rw => 0,
                    },
                },
            ],
        },
        ReferenceData => {
            Permissions => {
                0 => {
                    ro => 0,
                    rw => 0,
                },
                1 => {
                    ro => 0,
                    rw => 0,
                },
            },
        },
    },

    # Permission test No. 10
    {
        Description => "rw in itsm-change-builder, user 1 isn't the builder",
        SourceData  => {
            GroupMemberAdd => [
                {
                    GID        => $GroupName2ID{'itsm-change'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-manager'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-builder'},
                    UID        => $UserIDs[0],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
                {
                    GID        => $GroupName2ID{'itsm-change-builder'},
                    UID        => $UserIDs[1],
                    Permission => {
                        ro => 0,
                        rw => 0,
                    },
                },
            ],
        },
        ReferenceData => {
            Permissions => {
                0 => {
                    ro => 0,
                    rw => 0,
                },
                1 => {
                    ro => 0,
                    rw => 0,
                },
            },
        },
    },
);

my $PermissionTestCounter = 1;
for my $Test (@PermissionTests) {

    my $SourceData    = $Test->{SourceData};
    my $ReferenceData = $Test->{ReferenceData};

    $Self->True(
        1,
        "Test $TestCount: $Test->{Description} (Permission Test case: $PermissionTestCounter)",
    );

    # execute the source modifications
    $SourceData->{GroupMemberAdd} ||= [];
    for my $Params ( @{ $SourceData->{GroupMemberAdd} } ) {

        # modify the group membership
        my $Success = $GroupObject->GroupMemberAdd(
            %{$Params},
            UserID => 1,
        );
        $Self->True(
            $Success,
            "Permission test $PermissionTestCounter: GroupMemberAdd()",
        );
    }

    # check the result
    if ( $ReferenceData->{Permissions} ) {
        for my $UserIndex ( sort keys %{ $ReferenceData->{Permissions} } ) {
            my $Privs = $ReferenceData->{Permissions}->{$UserIndex};
            for my $Type ( sort keys %{$Privs} ) {
                $WorkOrderObject->{Debug} = 10;
                my $Access = $WorkOrderObject->Permission(
                    Type        => $Type,
                    WorkOrderID => $PermissionTestWorkOrderID,
                    UserID      => $UserIDs[$UserIndex],
                    Cached      => 0,
                );
                if ( $Privs->{$Type} ) {
                    $Self->True(
                        $Access,
                        "Permission test $PermissionTestCounter: User $UserIndex, with UserID $UserIDs[$UserIndex], has $Type access",
                    );
                }
                else {
                    $Self->False(
                        $Access,
                        "Permission test $PermissionTestCounter: User $UserIndex, with UserID $UserIDs[$UserIndex], has no $Type access",
                    );
                }
            }
        }
    }
}
continue {
    $PermissionTestCounter++;
    $TestCount++;
}

# ------------------------------------------------------------ #
# testing the method WorkOrderPossibleStatesGet()
# ------------------------------------------------------------ #

# create change for this test
my $ChangeIDForPossibleStatesTest = $ChangeObject->ChangeAdd(
    UserID => 1,
);

# create workorder for this test
my $WorkOrderIDForPossibleStatesTest = $WorkOrderObject->WorkOrderAdd(
    ChangeID       => $ChangeIDForPossibleStatesTest,
    UserID         => 1,
    WorkOrderState => 'accepted',
);

# When no WorkOrderID is given WorkOrderPossibleStatesGet() returns a list of all states.
my $PossibleStates = $WorkOrderObject->WorkOrderPossibleStatesGet(

    #    WorkOrderID => $WorkOrderIDForPossibleStatesTest,
    UserID => 1,
) || {};

# do the checks
my @PossibleStateIDsReference = @SortedWorkOrderStateIDs;
for my $PossibleStateID (@PossibleStateIDsReference) {
    my ( $FirstHashRef, $SecondHashRef ) = grep { $_->{Key} == $PossibleStateID } @{$PossibleStates};

    # a match is expected
    $Self->True(
        $FirstHashRef,
        "Check for possible state id $PossibleStateID",
    );

    # the name should also match
    $FirstHashRef ||= {};
    my $PossibleStateName = $WorkOrderStateID2Name{$PossibleStateID};
    $Self->Is(
        $FirstHashRef->{Value},
        $PossibleStateName,
        "Check for possible state name $PossibleStateID",
    );

    # only one match is expected
    $Self->False(
        $SecondHashRef,
        "Check that the state id $PossibleStateID is returned only once.",
    );

}

# these objects should be deleted
push @{ $IDsToDelete{Change} },    $ChangeIDForPossibleStatesTest;
push @{ $IDsToDelete{WorkOrder} }, $WorkOrderIDForPossibleStatesTest;

# TODO: add tests for WorkOrderPossibleStatesGet() with a WorkOrderID as argument

# ------------------------------------------------------------ #
# testing support for attachments
# ------------------------------------------------------------ #

# create change for this test
my $ChangeIDForAttachmentTest = $ChangeObject->ChangeAdd(
    UserID => 1,
);

# create workorder for this test
my $WorkOrderIDForAttachmentTest = $WorkOrderObject->WorkOrderAdd(
    ChangeID       => $ChangeIDForAttachmentTest,
    UserID         => 1,
    WorkOrderState => 'accepted',
);

# these objects should be deleted later on
push @{ $IDsToDelete{Change} },    $ChangeIDForAttachmentTest;
push @{ $IDsToDelete{WorkOrder} }, $WorkOrderIDForAttachmentTest;

# verify that initialy no attachment exists
my @AttachmentList = $WorkOrderObject->WorkOrderAttachmentList(
    WorkOrderID => $WorkOrderIDForAttachmentTest,
    UserID      => 1,
);

$Self->Is(
    scalar @AttachmentList,
    0,
    'No attachments initially',
);

# define list of test attachments
my @TestFileList = (
    {
        Filename       => 'first attachment',
        Content        => 'First attachment from ITSMWorkOrder.t',
        ContentType    => 'text/plain',
        AttachmentType => 'WorkOrder',
    },
    {
        Filename       => 'second attachment',
        Content        => 'Second attachment from ITSMWorkOrder.t',
        ContentType    => 'text/plain',
        AttachmentType => 'WorkOrder',
    },
    {
        Filename       => 'first report attachment',
        Content        => 'First report attachment from ITSMWorkOrder.t',
        ContentType    => 'text/plain',
        AttachmentType => 'WorkOrderReport',
    },
    {
        Filename       => 'second report attachment',
        Content        => 'Second report attachment from ITSMWorkOrder.t',
        ContentType    => 'text/plain',
        AttachmentType => 'WorkOrderReport',
    },
);

my %FileCount;
for my $TestFile (@TestFileList) {

    $FileCount{ $TestFile->{AttachmentType} }++;

    # add the attachment
    my $AddOk = $WorkOrderObject->WorkOrderAttachmentAdd(
        %{$TestFile},
        ChangeID    => $ChangeIDForAttachmentTest,
        WorkOrderID => $WorkOrderIDForAttachmentTest,
        UserID      => 1,
    );
    $Self->True(
        $AddOk,
        "Attachment ($TestFile->{AttachmentType}) $FileCount{ $TestFile->{AttachmentType} }: attachment added",
    );

    my @AttachmentList;
    if ( $TestFile->{AttachmentType} eq 'WorkOrder' ) {

        # get attachment list
        @AttachmentList = $WorkOrderObject->WorkOrderAttachmentList(
            WorkOrderID => $WorkOrderIDForAttachmentTest,
            UserID      => 1,
        );
    }
    elsif ( $TestFile->{AttachmentType} eq 'WorkOrderReport' ) {

        # get attachment list
        @AttachmentList = $WorkOrderObject->WorkOrderReportAttachmentList(
            WorkOrderID => $WorkOrderIDForAttachmentTest,
            UserID      => 1,
        );
    }

    $Self->Is(
        scalar @AttachmentList,
        $FileCount{ $TestFile->{AttachmentType} },
        "Attachment ($TestFile->{AttachmentType}) $FileCount{ $TestFile->{AttachmentType} }: number of attachments after adding",
    );

    # get the last added attachment file name
    my %AttachmentLookup = map { $_ => 1 } @AttachmentList;

    $Self->True(
        $AttachmentLookup{ $TestFile->{Filename} },
        "Attachment ($TestFile->{AttachmentType}) $FileCount{ $TestFile->{AttachmentType} }: filename from WorkOrderAttachmentList() / WorkOrderReportAttachmentList()",
    );

    # get the attachment
    my $Attachment = $WorkOrderObject->WorkOrderAttachmentGet(
        WorkOrderID    => $WorkOrderIDForAttachmentTest,
        Filename       => $TestFile->{Filename},
        AttachmentType => $TestFile->{AttachmentType},
    );
    $Self->True(
        $Attachment,
        "Attachment ($TestFile->{AttachmentType}) $FileCount{ $TestFile->{AttachmentType} }: WorkOrderAttachmentGet() returned true",
    );

    # check attachment file attributes
    for my $Attribute (qw(Filename Content ContentType AttachmentType)) {
        $Self->Is(
            $Attachment->{$Attribute},
            $TestFile->{$Attribute},
            "Attachment ($TestFile->{AttachmentType}) $FileCount{ $TestFile->{AttachmentType} }: $Attribute from WorkOrderAttachmentGet",
        );
    }

    # check existence of attachment
    my $AttachmentExists = $WorkOrderObject->WorkOrderAttachmentExists(
        ChangeID       => $ChangeIDForAttachmentTest,
        WorkOrderID    => $WorkOrderIDForAttachmentTest,
        AttachmentType => $TestFile->{AttachmentType},
        Filename       => $TestFile->{Filename},
        UserID         => 1,
    );
    $Self->True(
        $AttachmentExists,
        "Attachment ($TestFile->{AttachmentType}) $FileCount{ $TestFile->{AttachmentType} }: attachment exists",
    );
}

# now delete the attachments
my %MaxTestFiles = %FileCount;
%FileCount = ();
for my $TestFile (@TestFileList) {

    $FileCount{ $TestFile->{AttachmentType} }++;

    my $DeleteOk = $WorkOrderObject->WorkOrderAttachmentDelete(
        ChangeID       => $ChangeIDForAttachmentTest,
        WorkOrderID    => $WorkOrderIDForAttachmentTest,
        AttachmentType => $TestFile->{AttachmentType},
        Filename       => $TestFile->{Filename},
        UserID         => 1,
    );
    $Self->True(
        $DeleteOk,
        "Attachment ($TestFile->{AttachmentType}) $FileCount{ $TestFile->{AttachmentType} }: attachment deleted",
    );

    my @AttachmentList;
    if ( $TestFile->{AttachmentType} eq 'WorkOrder' ) {

        # get attachment list
        @AttachmentList = $WorkOrderObject->WorkOrderAttachmentList(
            WorkOrderID => $WorkOrderIDForAttachmentTest,
            UserID      => 1,
        );
    }
    elsif ( $TestFile->{AttachmentType} eq 'WorkOrderReport' ) {

        # get attachment list
        @AttachmentList = $WorkOrderObject->WorkOrderReportAttachmentList(
            WorkOrderID => $WorkOrderIDForAttachmentTest,
            UserID      => 1,
        );
    }

    $Self->Is(
        scalar @AttachmentList,
        $MaxTestFiles{ $TestFile->{AttachmentType} } - $FileCount{ $TestFile->{AttachmentType} },
        "Attachment ($TestFile->{AttachmentType}) $FileCount{ $TestFile->{AttachmentType} }: number of attachments after deletion",
    );

    my $AttachmentExists = $WorkOrderObject->WorkOrderAttachmentExists(
        ChangeID    => $ChangeIDForAttachmentTest,
        WorkOrderID => $WorkOrderIDForAttachmentTest,
        Filename    => $TestFile->{Filename},
        UserID      => 1,
    );
    $Self->False(
        $AttachmentExists,
        "Attachment ($TestFile->{AttachmentType}) $FileCount{ $TestFile->{AttachmentType} }: attachment is gone",
    );
}

# ------------------------------------------------------------ #
# clean the system
# ------------------------------------------------------------ #

# disable email checks to change the newly added users
$CheckEmailAddressesOrg = $ConfigObject->Get('CheckEmailAddresses');
if ( !defined $CheckEmailAddressesOrg ) {
    $CheckEmailAddressesOrg = 1;
}
$ConfigObject->Set(
    Key   => 'CheckEmailAddresses',
    Value => 0,
);

# set unittest users invalid
for my $UnittestUserID (@UserIDs) {

    # get user data
    my %User = $UserObject->GetUserData(
        UserID => $UnittestUserID,
    );

    # update user
    $UserObject->UserUpdate(
        %User,
        ValidID      => $ValidObject->ValidLookup( Valid => 'invalid' ),
        ChangeUserID => 1,
    );
}

# restore original email check param
$ConfigObject->Set(
    Key   => 'CheckEmailAddresses',
    Value => $CheckEmailAddressesOrg,
);

# delete the test workorders
my $DeleteTestCount = 1;
for my $WorkOrderID ( @{ $IDsToDelete{WorkOrder} }, keys %TestedWorkOrderID ) {
    my $Success = $WorkOrderObject->WorkOrderDelete(
        WorkOrderID => $WorkOrderID,
        UserID      => 1,
    );
    $Self->True(
        $Success,
        "DeleteTest $DeleteTestCount - WorkOrderDelete() (WorkOrderID=$WorkOrderID)",
    );

    # double check WorkOrder it is really deleted
    my $WorkOrderData = $WorkOrderObject->WorkOrderGet(
        WorkOrderID => $WorkOrderID,
        UserID      => 1,
    );

    $Self->Is(
        undef,
        $WorkOrderData->{WorkOrderID},
        "Test $TestCount: WorkOrderDelete() - double check",
        "DeleteTest $DeleteTestCount - double check (WorkOrderID=$WorkOrderID)",
    );
}
continue {
    $DeleteTestCount++;
}

# delete the test changes
for my $ChangeID ( @{ $IDsToDelete{Change} }, keys %TestedChangeID ) {
    my $DeleteOk = $ChangeObject->ChangeDelete(
        ChangeID => $ChangeID,
        UserID   => 1,
    );
    $Self->True(
        $DeleteOk,
        "DeleteTest $DeleteTestCount - ChangeDelete() (ChangeID=$ChangeID)",
    );

    # double check if change is really deleted
    my $ChangeData = $ChangeObject->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => 1,
        Cache    => 0,
    );

    $Self->False(
        $ChangeData->{ChangeID},
        "DeleteTest $DeleteTestCount - double check (ChangeID=$ChangeID)",
    );
}
continue {
    $DeleteTestCount++;
}

# delete dynamic fields that have been created for this test
for my $DynamicFieldID (@DynamicFieldIDs) {

    my $Success = $DynamicFieldObject->DynamicFieldDelete(
        ID     => $DynamicFieldID,
        UserID => 1,
    );

    $Self->True(
        $Success,
        "DynamicFieldDelete() deleted DynamicField $DynamicFieldID",
    );
}

# restore original dynamic fields order
for my $DynamicField ( @{$OriginalDynamicFields} ) {

    my $Success = $DynamicFieldObject->DynamicFieldUpdate(
        %{$DynamicField},
        Reorder => 0,
        UserID  => 1,
    );

    # check if update (restore) was successful
    $Self->True(
        $Success,
        "Restored Original Dynamic Field  - for FieldID $DynamicField->{ID}",
    );
}

# set SendNotifications to it's original value
$ConfigObject->Set(
    Key   => 'ITSMChange::SendNotifications',
    Value => $SendNotificationsOrg,
);

1;
