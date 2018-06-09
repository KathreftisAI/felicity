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

## nofilter(TidyAll::Plugin::OTRS::Perl::TestSubs)

# ------------------------------------------------------------ #
# make preparations
# ------------------------------------------------------------ #
my $TestCount = 1;

# create common objects
my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');
my $DynamicFieldObject   = $Kernel::OM->Get('Kernel::System::DynamicField');
my $UserObject           = $Kernel::OM->Get('Kernel::System::User');
my $GroupObject          = $Kernel::OM->Get('Kernel::System::Group');
my $CustomerUserObject   = $Kernel::OM->Get('Kernel::System::CustomerUser');
my $ValidObject          = $Kernel::OM->Get('Kernel::System::Valid');
my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
my $CIPAllocateObject    = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMChangeCIPAllocate');
my $HistoryObject        = $Kernel::OM->Get('Kernel::System::ITSMChange::History');
my $CacheObject          = $Kernel::OM->Get('Kernel::System::Cache');
my $TimeObject           = $Kernel::OM->Get('Kernel::System::Time');
my $LogObject            = $Kernel::OM->Get('Kernel::System::Log');
my $DBObject             = $Kernel::OM->Get('Kernel::System::DB');
my $WorkOrderObject      = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');
my $ChangeObject         = $Kernel::OM->Get('Kernel::System::ITSMChange');

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
# create needed users and customer users
# ------------------------------------------------------------ #
my @UserIDs;               # a list of existing and valid user ids
my @InvalidUserIDs;        # a list of existing but invalid user ids
my @NonExistingUserIDs;    # a list of non-existion user ids
my @CustomerUserIDs;       # a list of existing and valid customer user ids, a list of strings

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
        UserFirstname => 'ITSMChange' . $Counter,
        UserLastname  => 'UnitTest',
        UserLogin     => 'UnitTest-ITSMChange-' . $Counter . int rand 1_000_000,
        UserEmail     => 'UnitTest-ITSMChange-' . $Counter . '@localhost',
        ValidID       => $ValidObject->ValidLookup( Valid => 'valid' ),
        ChangeUserID  => 1,
    );
    push @UserIDs, $UserID;

    # create new customers for the tests
    my $CustomerUserID = $CustomerUserObject->CustomerUserAdd(
        Source         => 'CustomerUser',
        UserFirstname  => 'ITSMChangeCustomer' . $Counter,
        UserLastname   => 'UnitTestCustomer',
        UserCustomerID => 'UCT' . $Counter . int rand 1_000_000,
        UserLogin      => 'UnitTest-ITSMChange-Customer-' . $Counter . int rand 1_000_000,
        UserEmail      => 'UnitTest-ITSMChange-Customer-'
            . $Counter
            . int( rand 1_000_000 )
            . '@localhost',
        ValidID => $ValidObject->ValidLookup( Valid => 'valid' ),
        UserID  => 1,
    );
    push @CustomerUserIDs, $CustomerUserID;
}

# sort the user and customer user arrays
@UserIDs         = sort @UserIDs;
@CustomerUserIDs = sort @CustomerUserIDs;

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

my $UniqueNamePrefix = 'UnitTestChange' . int rand 1_000_000;

# create some dynamic fields for changes (and for workorders)
my @DynamicFields = (
    {
        Name       => $UniqueNamePrefix . 'Test1',
        Label      => $UniqueNamePrefix . 'Test1',
        FieldOrder => 10000,
        FieldType  => 'Text',
        ObjectType => 'ITSMChange',
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
        ObjectType => 'ITSMChange',
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
        ObjectType => 'ITSMChange',
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
        ObjectType => 'ITSMChange',
        ValidID    => 1,
        UserID     => 1,
        Config     => {
            Name        => $UniqueNamePrefix . 'Test4',
            Description => 'Description for Dynamic Field.',
        },
    },
    {
        Name       => $UniqueNamePrefix . 'WorkorderTest1',
        Label      => $UniqueNamePrefix . 'WorkorderTest1',
        FieldOrder => 10000,
        FieldType  => 'Text',
        ObjectType => 'ITSMWorkOrder',
        ValidID    => 1,
        UserID     => 1,
        Config     => {
            Name        => $UniqueNamePrefix . 'WorkorderTest1',
            Description => 'Description for Dynamic Field.',
        },
    },
    {
        Name       => $UniqueNamePrefix . 'WorkorderTest2',
        Label      => $UniqueNamePrefix . 'WorkorderTest2',
        FieldOrder => 10000,
        FieldType  => 'Text',
        ObjectType => 'ITSMWorkOrder',
        ValidID    => 1,
        UserID     => 1,
        Config     => {
            Name        => $UniqueNamePrefix . 'WorkorderTest2',
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
# test ITSMChange API
# ------------------------------------------------------------ #

# define public interface (in alphabetical order)
my @ObjectMethods = qw(
    ChangeAdd
    ChangeAttachmentAdd
    ChangeAttachmentDelete
    ChangeAttachmentExists
    ChangeAttachmentGet
    ChangeAttachmentList
    ChangeCABDelete
    ChangeCABGet
    ChangeCABUpdate
    ChangeCIPLookup
    ChangeDelete
    ChangeGet
    ChangeList
    ChangeLookup
    ChangePossibleCIPGet
    ChangePossibleStatesGet
    ChangeSearch
    ChangeStateLookup
    ChangeUpdate
    Permission
);

# check if subs are available
for my $ObjectMethod (@ObjectMethods) {
    $Self->True(
        $ChangeObject->can($ObjectMethod),
        "Test " . $TestCount++ . " - check 'can $ObjectMethod'",
    );
}

# ------------------------------------------------------------ #
# search for default ITSMChange-states
# ------------------------------------------------------------ #

# define default ITSMChange-states
# can't use qw due to spaces in states
my @DefaultChangeStates = (
    'requested',
    'pending approval',
    'rejected',
    'approved',
    'in progress',
    'pending pir',
    'successful',
    'failed',
    'canceled',
    'retracted',
);

# get item list of the change states with swapped keys and values
my %ChangeStateID2Name = %{
    $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ChangeManagement::Change::State',
        ) || {}
};
my %ChangeStateName2ID   = reverse %ChangeStateID2Name;
my @SortedChangeStateIDs = sort keys %ChangeStateID2Name;

# check if states are in GeneralCatalog
for my $DefaultChangeState (@DefaultChangeStates) {
    $Self->True(
        $ChangeStateName2ID{$DefaultChangeState},
        "Test " . $TestCount++ . " - check state '$DefaultChangeState'",
    );
}

# ------------------------------------------------------------ #
# test the state lookup method
# ------------------------------------------------------------ #

# investigate the default states
for my $State (@DefaultChangeStates) {

    # look up the state name
    my $LookedUpStateID = $ChangeObject->ChangeStateLookup(
        ChangeState => $State,
    );

    $Self->Is(
        $LookedUpStateID,
        $ChangeStateName2ID{$State},
        "Look up state '$State'",
    );

    # do the reverse lookup
    my $LookedUpState = $ChangeObject->ChangeStateLookup(
        ChangeStateID => $LookedUpStateID,
    );

    $Self->Is(
        $LookedUpState,
        $State,
        "Look up state id '$LookedUpStateID'",
    );
}

# now some param checks for ChangeStateLookup
my $LookupOk = $ChangeObject->ChangeStateLookup();

$Self->False(
    $LookupOk,
    'No params passed to ChangeStateLookup()',
);

$LookupOk = $ChangeObject->ChangeStateLookup(
    ChangeState   => 'approved',
    ChangeStateID => 2,
);

$Self->False(
    $LookupOk,
    'Exclusive params passed to ChangeStateLookup()',
);

$LookupOk = $ChangeObject->ChangeStateLookup(
    State => 'approved',
);

$Self->False(
    $LookupOk,
    "Incorrect param 'State' passed to ChangeStateLookup()",
);

$LookupOk = $ChangeObject->ChangeStateLookup(
    StateID => 2,
);

$Self->False(
    $LookupOk,
    "Incorrect param 'StateID' passed to ChangeStateLookup()",
);

# ------------------------------------------------------------ #
# check existence of the default history types
# ------------------------------------------------------------ #

my @DefaultHistoryTypes = qw(
    ChangeAdd
    ChangeUpdate
    ChangeDelete
    ChangeCABUpdate
    ChangeCABDelete
    ChangeLinkAdd
    ChangeLinkDelete
    ChangeAttachmentAdd
    ChangeAttachmentDelete
    WorkOrderAdd
    WorkOrderUpdate
    WorkOrderDelete
    WorkOrderLinkAdd
    WorkOrderLinkDelete
    WorkOrderAttachmentAdd
    WorkOrderAttachmentDelete
    WorkOrderReportAttachmentAdd
    WorkOrderReportAttachmentDelete
    ChangePlannedStartTimeReached
    ChangePlannedEndTimeReached
    ChangeActualStartTimeReached
    ChangeActualEndTimeReached
    WorkOrderPlannedStartTimeReached
    WorkOrderPlannedEndTimeReached
    WorkOrderActualStartTimeReached
    WorkOrderActualEndTimeReached
    ChangeRequestedTimeReached
    ConditionAdd
    ConditionUpdate
    ConditionDelete
    ConditionDeleteAll
    ExpressionAdd
    ExpressionUpdate
    ExpressionDelete
    ExpressionDeleteAll
    ActionAdd
    ActionUpdate
    ActionDelete
    ActionDeleteAll
    ActionExecute
    ChangeNotificationSent
    WorkOrderNotificationSent
);

# investigate the default history types
for my $HistoryType (@DefaultHistoryTypes) {

    # look up the name
    my $LookedUpHistoryTypeID = $HistoryObject->HistoryTypeLookup(
        HistoryType => $HistoryType,
    );

    $Self->True(
        $LookedUpHistoryTypeID,
        "Look up history type '$HistoryType'",
    );

    # do the reverse lookup
    my $LookedUpHistoryType = $HistoryObject->HistoryTypeLookup(
        HistoryTypeID => $LookedUpHistoryTypeID,
    );

    $Self->Is(
        $LookedUpHistoryType,
        $HistoryType,
        "Look up history type id '$LookedUpHistoryTypeID'",
    );
}

# ------------------------------------------------------------ #
# check existence of the default CIP
# ------------------------------------------------------------ #

my @CIPValues = ( '1 very low', '2 low', '3 normal', '4 high', '5 very high' );

# get list of the categories with swapped keys and values
my %ChangeCategoryID2Name = %{
    $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ChangeManagement::Category',
        ) || {}
};
my %ChangeCategoryName2ID   = reverse %ChangeCategoryID2Name;
my @SortedChangeCategoryIDs = sort keys %ChangeCategoryID2Name;

# get list of the impacts with swapped keys and values
my %ChangeImpactID2Name = %{
    $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ChangeManagement::Impact',
        ) || {}
};
my %ChangeImpactName2ID   = reverse %ChangeImpactID2Name;
my @SortedChangeImpactIDs = sort keys %ChangeImpactID2Name;

# get list of the priorities with swapped keys and values
my %ChangePriorityID2Name = %{
    $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ChangeManagement::Priority',
        ) || {}
};
my %ChangePriorityName2ID   = reverse %ChangePriorityID2Name;
my @SortedChangePriorityIDs = sort keys %ChangePriorityID2Name;

# check if CIP values are in GeneralCatalog
for my $CIPValue (@CIPValues) {

    # test category
    $Self->True(
        $ChangeCategoryName2ID{$CIPValue},
        "Test " . $TestCount++ . " - check category '$CIPValue' (general catalog)"
    );

    my $CategoryID = $ChangeObject->ChangeCIPLookup(
        Type => 'Category',
        CIP  => $CIPValue,
    );
    $Self->True(
        $CategoryID,
        "Test " . $TestCount . " - check category '$CIPValue' (ChangeCIPLookup)"
    );

    # test impact
    $Self->True(
        $ChangeImpactName2ID{$CIPValue},
        "Test " . $TestCount++ . " - check impact '$CIPValue' (general catalog)"
    );

    my $ImpactID = $ChangeObject->ChangeCIPLookup(
        Type => 'Impact',
        CIP  => $CIPValue,
    );
    $Self->True(
        $ImpactID,
        "Test " . $TestCount . " - check impact '$CIPValue' (ChangeCIPLookup)"
    );

    # test priority
    $Self->True(
        $ChangePriorityName2ID{$CIPValue},
        "Test " . $TestCount++ . " - check priority '$CIPValue' (general catalog)"
    );

    my $PriorityID = $ChangeObject->ChangeCIPLookup(
        Type => 'Priority',
        CIP  => $CIPValue,
    );
    $Self->True(
        $PriorityID,
        "Test " . $TestCount . " - check priority '$CIPValue' (ChangeCIPLookup)"
    );

}

# ------------------------------------------------------------ #
# check existence of the groups that are used for Permission
# ------------------------------------------------------------ #

# get mapping of the group name to the group id
my %GroupName2ID = reverse $GroupObject->GroupList( Valid => 1 );

# check if the groups were found
for my $Group (qw( itsm-change itsm-change-builder itsm-change-manager )) {
    $Self->True(
        $GroupName2ID{$Group},
        "Test " . $TestCount++ . " - check group '$Group'"
    );
}

# ------------------------------------------------------------ #
# get variables for test
# ------------------------------------------------------------ #
my $DefaultCategory = $ConfigObject->Get('ITSMChange::Category::Default');
my $DefaultImpact   = $ConfigObject->Get('ITSMChange::Impact::Default');
my $DefaultPriority = $CIPAllocateObject->PriorityAllocationGet(
    CategoryID => $ChangeCategoryName2ID{$DefaultCategory},
    ImpactID   => $ChangeImpactName2ID{$DefaultImpact},
);

# ------------------------------------------------------------ #
# define general change tests
# ------------------------------------------------------------ #

# store current TestCount for better test case recognition
my $TestCountMisc = $TestCount;

# An unique indentifier, so that data from different test runs
# won't be mixed up. The string is formated to a constant length,
# as the conversion to plain text with ToAscii() depends on the string length.
my $UniqueSignature = sprintf 'UnitTest-ITSMChange-%06d-%010d',
    int( rand 1_000_000 ),
    time();
my $NoWildcardsTestTitle = sprintf 'UnitTest-ITSMChange-NoWildcards-%06d-%010d',
    int( rand 1_000_000 ),
    time();

my @ChangeTests = (

    #------------------------------#
    # Tests on ChangeAdd
    #------------------------------#

    # Change doesn't contain all data (required attributes)
    {
        Description => 'Test contains no params for ChangeAdd.',
        Fails       => 1,                                          # we expect this test to fail
        SourceData  => {
            ChangeAdd => {},
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # Change contains only required data - default user (required attributes)
    {
        Description => 'Test only needed params (UserID = 1) for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle        => '',
                Description        => '',
                DescriptionPlain   => '',
                Justification      => '',
                JustificationPlain => '',
                ChangeManagerID    => undef,
                ChangeBuilderID    => 1,
                WorkOrderIDs       => [],
                WorkOrderCount     => 0,
                CABAgents          => [],
                CABCustomers       => [],
                CreateBy           => 1,
                ChangeBy           => 1,
            },
            HistoryGet => {
                ChangeAdd => '',
            },
        },
        SearchTest => [ 25, 26 ],
        Label => 'ChangeLookupTest',    # this change will be used for testing ChangeLookup().
    },

    # Change contains only required data - default user (required attributes)
    {
        Description => 'Test only needed params (UserID != 1) for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => '',
                Description     => '',
                Justification   => '',
                ChangeManagerID => undef,
                ChangeBuilderID => $UserIDs[0],
                WorkOrderIDs    => [],
                WorkOrderCount  => 0,
                CABAgents       => [],
                CABCustomers    => [],
                CreateBy        => $UserIDs[0],
                ChangeBy        => $UserIDs[0],
            },
        },
        SearchTest => [ 4, 25, 26 ],
    },

    # Change contains HTML description and justification
    {
        Description => 'Test only needed params (UserID != 1) for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                Description   => '<b>This <u>is</u> bold</b> - ' . $UniqueSignature,
                Justification => '<b>This <u>is</u> bold</b> - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle        => '',
                Description        => '<b>This <u>is</u> bold</b> - ' . $UniqueSignature,
                DescriptionPlain   => 'This is bold - ' . $UniqueSignature,
                Justification      => '<b>This <u>is</u> bold</b> - ' . $UniqueSignature,
                JustificationPlain => 'This is bold - ' . $UniqueSignature,
                ChangeManagerID    => undef,
                ChangeBuilderID    => $UserIDs[0],
                WorkOrderIDs       => [],
                WorkOrderCount     => 0,
                CABAgents          => [],
                CABCustomers       => [],
                CreateBy           => $UserIDs[0],
                ChangeBy           => $UserIDs[0],
            },
        },
        SearchTest => [ 4, 25, 26, 48, 49, 50 ],
    },

    # Change with named ChangeState
    {
        Description => 'Test for Statenames - ' . $UniqueSignature,
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                Description => 'ChangeStates - ' . $UniqueSignature,
                ChangeState => 'requested',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle      => '',
                Description      => 'ChangeStates - ' . $UniqueSignature,
                DescriptionPlain => 'ChangeStates - ' . $UniqueSignature,
                Justification    => '',
                ChangeManagerID  => undef,
                ChangeBuilderID  => $UserIDs[0],
                ChangeStateID    => $ChangeStateName2ID{requested},
                ChangeState      => 'requested',
                WorkOrderIDs     => [],
                WorkOrderCount   => 0,
                CABAgents        => [],
                CABCustomers     => [],
                CreateBy         => $UserIDs[0],
                ChangeBy         => $UserIDs[0],
            },
            HistoryGet => {
                ChangeAdd    => '',
                ChangeUpdate => {
                    Description => [
                        [ '', 'ChangeStates - ' . $UniqueSignature ],
                    ],
                    ChangeBuilderID => [
                        [ undef, $UserIDs[0] ],
                    ],
                    ChangeStateID => [
                        [ undef, $ChangeStateName2ID{requested} ],
                    ],
                },
            },
        },
        SearchTest => [ 4, 25, 26, 33, 37 ],
    },

    # ChangeUpdate() with valid named ChangeState
    {
        Description => 'ChangeUpdate() with valid named ChangeState - ' . $UniqueSignature,
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                Description => 'ChangeStates - ' . $UniqueSignature,
                ChangeState => 'requested',
            },
            ChangeUpdate => {
                UserID      => $UserIDs[0],
                ChangeState => 'pending approval',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => '',
                Description     => 'ChangeStates - ' . $UniqueSignature,
                Justification   => '',
                ChangeManagerID => undef,
                ChangeBuilderID => $UserIDs[0],
                ChangeStateID   => $ChangeStateName2ID{'pending approval'},
                ChangeState     => 'pending approval',
                WorkOrderIDs    => [],
                WorkOrderCount  => 0,
                CABAgents       => [],
                CABCustomers    => [],
                CreateBy        => $UserIDs[0],
                ChangeBy        => $UserIDs[0],
            },
        },
        SearchTest => [ 4, 25, 26, 38 ],
    },

    # ChangeUpdate() with invalid named ChangeState
    {
        Description => 'ChangeUpdate() with invalid named ChangeState - ' . $UniqueSignature,
        UpdateFails => 1,
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                Description => 'ChangeStates - ' . $UniqueSignature,
                ChangeState => 'requested',
            },
            ChangeUpdate => {
                UserID      => $UserIDs[0],
                ChangeState => 'failed',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => '',
                Description     => 'ChangeStates - ' . $UniqueSignature,
                Justification   => '',
                ChangeManagerID => undef,
                ChangeBuilderID => $UserIDs[0],
                ChangeStateID   => $ChangeStateName2ID{requested},
                ChangeState     => 'requested',
                WorkOrderIDs    => [],
                WorkOrderCount  => 0,
                CABAgents       => [],
                CABCustomers    => [],
                CreateBy        => $UserIDs[0],
                ChangeBy        => $UserIDs[0],
            },
        },
        SearchTest => [ 4, 25, 26, 37 ],
    },

    # ChangeUpdate() with not allowed next ChangeState
    {
        Description => 'ChangeUpdate() with not allowed next ChangeState - ' . $UniqueSignature,
        UpdateFails => 1,
        SourceData  => {
            ChangeAdd => {
                UserID      => 1,
                Description => 'ChangeStates - ' . $UniqueSignature,
                ChangeState => 'pending approval',
            },
            ChangeUpdate => {
                UserID      => 1,
                ChangeState => 'successful',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeState => 'pending approval',
            },
        },
        SearchTest => [38],
    },

    # ChangeUpdate() with not allowed next ChangeState but BypassStateMachine parameter
    {
        Description =>
            'ChangeUpdate() with not allowed next ChangeState but BypassStateMachine parameter - '
            . $UniqueSignature,
        SourceData => {
            ChangeAdd => {
                UserID      => 1,
                Description => 'ChangeStates - ' . $UniqueSignature,
                ChangeState => 'pending approval',
            },
            ChangeUpdate => {
                UserID             => 1,
                BypassStateMachine => 1,
                ChangeState        => 'successful',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeState => 'successful',
            },
        },
    },

    # change contains all data - (all attributes)
    {
        Description => 'Test contains all possible params for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle     => 'Change 1 - Title - ' . $UniqueSignature,
                Description     => 'Change 1 - Description - ' . $UniqueSignature,
                Justification   => 'Change 1 - Justification - ' . $UniqueSignature,
                ChangeManagerID => $UserIDs[0],
                ChangeBuilderID => $UserIDs[0],
                CABAgents       => [
                    $UserIDs[0],
                    $UserIDs[1],
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
                UserID => $UserIDs[1],
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Change 1 - Title - ' . $UniqueSignature,
                Description     => 'Change 1 - Description - ' . $UniqueSignature,
                Justification   => 'Change 1 - Justification - ' . $UniqueSignature,
                ChangeManagerID => $UserIDs[0],
                ChangeBuilderID => $UserIDs[0],
                CABAgents       => [
                    $UserIDs[0],
                    $UserIDs[1],
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
        },
        SearchTest => [ 2, 3, 4, 5, 6, 8, 9, 10, 12, 13, 23, 24, 27 ],
        Label => 'SearchTest',    # this test will be used for search tests
    },

    # change contains title, description, justification, changemanagerid and changebuilderid
    {
        Description => 'Test contains all possible params for ChangeAdd (Second try).',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle     => 'Change 2 - Title - ' . $UniqueSignature,
                Description     => 'Change 2 - Description - ' . $UniqueSignature,
                Justification   => 'Change 2 - Justification - ' . $UniqueSignature,
                ChangeManagerID => $UserIDs[1],
                ChangeBuilderID => $UserIDs[1],
                CABAgents       => [
                    $UserIDs[1],
                ],
                CABCustomers => [
                    $CustomerUserIDs[1],
                ],
                UserID => $UserIDs[1],
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Change 2 - Title - ' . $UniqueSignature,
                Description     => 'Change 2 - Description - ' . $UniqueSignature,
                Justification   => 'Change 2 - Justification - ' . $UniqueSignature,
                ChangeManagerID => $UserIDs[1],
                ChangeBuilderID => $UserIDs[1],
                CABAgents       => [ $UserIDs[1] ],
                CABCustomers    => [ $CustomerUserIDs[1] ],
                CreateBy        => $UserIDs[1]
            },
        },
        SearchTest => [ 23, 24 ],
    },

    # change contains all data - wrong CAB - (wrong CAB attributes)
    {
        Description => 'Test contains invalid CAB members for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle     => 'Change 3 - Title - ' . $UniqueSignature,
                Description     => 'Change 3 - Description - ' . $UniqueSignature,
                Justification   => 'Change 3 - Justification - ' . $UniqueSignature,
                ChangeManagerID => $UserIDs[0],
                ChangeBuilderID => $UserIDs[0],
                CABAgents       => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
                CABCustomers => [
                    $UserIDs[0],
                    $UserIDs[1],
                ],
                UserID => $UserIDs[1],
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
        Fails => 1,
    },

    # change contains required data - duplicate CAB entries - (duplicate CAB entries)
    {
        Description => 'Test contains duplicate CAB members for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[1],
                    $UserIDs[0],
                    $UserIDs[1],
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
                UserID => 1,
            },
        },
        ReferenceData => {
            ChangeGet => {
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[1],
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
                CreateBy => 1,
                ChangeBy => 1,
            },
        },
    },

    # test on max long params  (required attributes)
    # The max plain string is only 1799999, because ToAscii() adds a newline
    {
        Description => 'Test for max string length for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                ChangeTitle   => 'T' x 250,
                Description   => 'D' x 1799999,
                Justification => 'J' x 1799999,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle        => 'T' x 250,
                Description        => 'D' x 1799999,
                DescriptionPlain   => 'D' x 1799999 . "\n",
                Justification      => 'J' x 1799999,
                JustificationPlain => 'J' x 1799999 . "\n",
                ChangeManagerID    => undef,
                ChangeBuilderID    => $UserIDs[0],
                WorkOrderIDs       => [],
                WorkOrderCount     => 0,
                CABAgents          => [],
                CABCustomers       => [],
                CreateBy           => $UserIDs[0],
                ChangeBy           => $UserIDs[0],
            },
        },
        SearchTest => [ 11, 12, 13 ],
    },

    # test on max+1 long params  (required attributes)
    {
        Description => 'Test for max+1 string length for ChangeAdd.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                ChangeTitle   => 'T' x 251,
                Description   => 'D' x 1800000,
                Justification => 'J' x 1800000,
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on max+2 long params  (required attributes)
    {
        Description => 'Test for max+2 string length for ChangeAdd.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                ChangeTitle   => 'T' x 252,
                Description   => 'D' x 1800001,
                Justification => 'J' x 1800001,
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on max+1 long params - title  (required attributes)
    {
        Description => 'Test for max+1 string - title - length for ChangeAdd.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                ChangeTitle   => 'T' x 251,
                Description   => 'D',
                Justification => 'J',
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on max+1 long params - description (required attributes)
    {
        Description => 'Test for max+1 string - description - length for ChangeAdd.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                ChangeTitle   => 'T',
                Description   => 'D' x 1800000,
                Justification => 'J',
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on max+1 long params - justification (required attributes)
    {
        Description => 'Test for max+1 string - justification - length for ChangeAdd.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                ChangeTitle   => 'T',
                Description   => 'D',
                Justification => 'J' x 1800000,
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on undef params - title  (required attributes)
    {
        Description => 'Test for undef - title',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                ChangeTitle   => undef,
                Description   => 'D',
                Justification => 'J',
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on undef params - description (required attributes)
    {
        Description => 'Test for undef - description',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                ChangeTitle   => 'T',
                Description   => undef,
                Justification => 'J',
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on undef params - justification (required attributes)
    {
        Description => 'Test for undef - justification',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                ChangeTitle   => 'T',
                Description   => 'D',
                Justification => undef,
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on '0' strings - default user  (required attributes)
    {
        Description => "Test for '0' string handling for ChangeAdd.",
        SourceData  => {
            ChangeAdd => {
                UserID        => 1,
                ChangeTitle   => '0',
                Description   => '0',
                Justification => '0',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle   => '0',
                Description   => '0',
                Justification => '0',
            },
        },
        SearchTest => [ 18, 19, 20, 21 ],
    },

    # Test title with leading whitespace
    {
        Description => 'Test for title with leading whitespace',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => "  \t \n  Title with leading whitespace - " . $UniqueSignature,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => "Title with leading whitespace - " . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
            },
        },
        SearchTest => [ 6, 45 ],
    },

    # Test title with trailing whitespace
    {
        Description => 'Test for title with trailing whitespace',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => "Title with trailing whitespace - " . $UniqueSignature . "  \t \n  ",
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => "Title with trailing whitespace - " . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
            },
        },
        SearchTest => [ 6, 46 ],
    },

    # Test title with leading and trailing whitespace
    {
        Description => 'Test for title with leading and trailing whitespace',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => "  \t \n  Title with leading and trailing whitespace - "
                    . $UniqueSignature
                    . "  \t \n  ",
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => "Title with leading and trailing whitespace - " . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
            },
        },
        SearchTest => [ 6, 47 ],
    },

    # Test title with only whitespace
    {
        Description => 'Test for title with only whitespace',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => "  \t \n  ",
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => '',
                ChangeBuilderID => $UserIDs[0],
            },
        },
        SearchTest => [],
    },

    # a change for the 'UsingWildcards => 0' test
    {
        Description => "A change for the 'UsingWildcards => 0' test.",
        SourceData  => {
            ChangeAdd => {
                UserID        => 1,
                ChangeTitle   => $NoWildcardsTestTitle,
                Description   => $NoWildcardsTestTitle,
                Justification => $NoWildcardsTestTitle,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle   => $NoWildcardsTestTitle,
                Description   => $NoWildcardsTestTitle,
                Justification => $NoWildcardsTestTitle,
            },
        },
    },

    # test on mixed valid and invalid CABAgents  (required attributes)
    {
        Description => 'Test on mixed valid and invalid CABAgents for ChangeAdd.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID    => 1,
                CABAgents => [
                    $UserIDs[0],
                    $NonExistingUserIDs[1],
                    $UserIDs[1],
                    $NonExistingUserIDs[0],
                ],
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on mixed valid and invalid CABCustomers  (required attributes)
    {
        Description => 'Test on mixed valid and invalid CABCustomers for ChangeAdd.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID       => 1,
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                    'ThisIsAnInvalidCustomerUserId',
                ],
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on invalid IDs for ChangeManagerID and ChangeBuilderID
    {
        Description => 'Test on invalid IDs for ChangeManagerID and ChangeBuilderID for ChangeAdd.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID          => 1,
                ChangeManagerID => $NonExistingUserIDs[0],
                ChangeBuilderID => $NonExistingUserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on invalid IDs for ChangeManagerID
    {
        Description => 'Test on invalid ID for ChangeManagerID for ChangeAdd.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID          => 1,
                ChangeManagerID => $NonExistingUserIDs[0],
                ChangeBuilderID => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on invalid IDs for ChangeBuilderID
    {
        Description => 'Test on invalid ID for ChangeBuilderID for ChangeAdd.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID          => 1,
                ChangeManagerID => $UserIDs[0],
                ChangeBuilderID => $NonExistingUserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on invalid RequestedTime
    {
        Description => 'Test on invalid RequestedTime for ChangeAdd.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID        => 1,
                RequestedTime => 'anything invalid',
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test on valid RequestedTime
    {
        Description => 'Test on valid RequestedTime for ChangeAdd.',
        SourceData  => {
            ChangeAdd => {
                UserID        => 1,
                RequestedTime => '2009-10-29 13:33:33',
                Description   => 'RequestedTime - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            ChangeGet => {
                CreateBy      => 1,
                ChangeBy      => 1,
                ChangeTitle   => '',
                RequestedTime => '2009-10-29 13:33:33',
                Description   => 'RequestedTime - ' . $UniqueSignature,
            },
        },
        SearchTest => [ 42, 43 ],
    },

    # Test default CIP values
    {
        Description => 'Test default CIP values',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test default CIP - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Test default CIP - ' . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
                Category        => $DefaultCategory,
                CategoryID      => $ChangeCategoryName2ID{$DefaultCategory},
                Impact          => $DefaultImpact,
                ImpactID        => $ChangeImpactName2ID{$DefaultImpact},
                PriorityID      => $DefaultPriority,
                Priority        => $ChangePriorityID2Name{$DefaultPriority},

            },
        },
        SearchTest => [6],
        Label      => 'OrderByCIPTests',    # this change will be used in order by search tests
    },

    # Test category
    {
        Description => 'Test category "1 very low"',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test CIP (Category) - ' . $UniqueSignature,
                Category    => '1 very low',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Test CIP (Category) - ' . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
                Category        => '1 very low',
                CategoryID      => $ChangeCategoryName2ID{'1 very low'},
            },
        },
        SearchTest => [ 6, 51, 54, 57, 60, 63, 64 ],
        Label => 'OrderByCIPTests',    # this change will be used in order by search tests
    },

    # Test invalid category
    {
        Description => 'Test invalid category "18 super high"',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test CIP (Category) - ' . $UniqueSignature,
                Category    => '18 super high',
            },
        },
        SearchTest => [],
    },

    # Test impact
    {
        Description => 'Test impact "1 very low"',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test CIP (Impact) - ' . $UniqueSignature,
                Impact      => '1 very low',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Test CIP (Impact) - ' . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
                Impact          => '1 very low',
                ImpactID        => $ChangeImpactName2ID{'1 very low'},
            },
        },
        SearchTest => [ 6, 52, 55, 58, 61 ],
        Label => 'OrderByCIPTests',    # this change will be used in order by search tests
    },

    # Test invalid impact
    {
        Description => 'Test invalid impact "18 super high"',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test CIP (Impact) - ' . $UniqueSignature,
                Impact      => '18 super high',
            },
        },
        SearchTest => [],
    },

    # Test priority
    {
        Description => 'Test priority "1 very low"',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test CIP (Priority) - ' . $UniqueSignature,
                Priority    => '1 very low',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Test CIP (Priority) - ' . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
                Priority        => '1 very low',
                PriorityID      => $ChangePriorityName2ID{'1 very low'},
            },
        },
        SearchTest => [ 6, 53, 56, 59, 62 ],
        Label => 'OrderByCIPTests',    # this change will be used in order by search tests
    },

    # Test invalid priority
    {
        Description => 'Test invalid priority "18 super high"',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test CIP (Priority) - ' . $UniqueSignature,
                Priority    => '18 super high',
            },
        },
        SearchTest => [],
    },

    #------------------------------#
    # Tests on ChangeUpdate
    #------------------------------#

    # Update change without required params (required attributes)
    {
        Description => 'Test contains no params for ChangeUpdate().',
        Fails       => 1,                                               # we expect this test to fail
        SourceData  => {
            ChangeUpdate => {},
        },
        ReferenceData => {
            ChangeUpdate => undef,
        },
    },

    # test on max long params  (required attributes)
    {
        Description => 'Test for max string length for ChangeUpdate.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeUpdate => {
                UserID        => 1,
                ChangeTitle   => 'T' x 250,
                Description   => 'D' x 1799999,
                Justification => 'J' x 1799999,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle        => 'T' x 250,
                Description        => 'D' x 1799999,
                DescriptionPlain   => 'D' x 1799999 . "\n",
                Justification      => 'J' x 1799999,
                JustificationPlain => 'J' x 1799999 . "\n",
                ChangeManagerID    => undef,
                ChangeBuilderID    => $UserIDs[0],
                WorkOrderIDs       => [],
                WorkOrderCount     => 0,
                CABAgents          => [],
                CABCustomers       => [],
                CreateBy           => $UserIDs[0],
                ChangeBy           => 1,
            },
        },
        SearchTest => [ 11, 14, 15, 16, 17 ],
    },

    # test on max+1 long params  (required attributes)
    {
        Description => 'Test for max+1 string length for ChangeUpdate.',
        UpdateFails => 1,
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeUpdate => {
                UserID        => 1,
                ChangeTitle   => 'T' x 251,
                Description   => 'D' x 1800000,
                Justification => 'J' x 1800000,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle   => '',
                Description   => '',
                Justification => '',
            },
        },
    },

    # test on max+1 long params - title  (required attributes)
    {
        Description => 'Test for max+1 string length - title - for ChangeUpdate.',
        UpdateFails => 1,
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeUpdate => {
                UserID        => 1,
                ChangeTitle   => 'T' x 251,
                Description   => 'D',
                Justification => 'J',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle   => '',
                Description   => '',
                Justification => '',
            },
        },
    },    # test on max+1 long params - description  (required attributes)
    {
        Description => 'Test for max+1 string length - description - for ChangeUpdate.',
        UpdateFails => 1,
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeUpdate => {
                UserID        => 1,
                ChangeTitle   => 'T',
                Description   => 'D' x 1800000,
                Justification => 'J',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle   => '',
                Description   => '',
                Justification => '',
            },
        },
    },    # test on max+1 long params  - justification - (required attributes)
    {
        Description => 'Test for max+1 string length - justification - for ChangeUpdate.',
        UpdateFails => 1,
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeUpdate => {
                UserID        => 1,
                ChangeTitle   => 'T',
                Description   => 'D',
                Justification => 'J' x 1800000,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle   => '',
                Description   => '',
                Justification => '',
            },
        },
    },

    # test on '0' strings - default user  (required attributes)
    {
        Description => "Test for '0' string handling for ChangeUpdate.",
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            ChangeUpdate => {
                UserID        => 1,
                ChangeTitle   => '0',
                Description   => '0',
                Justification => '0',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle   => '0',
                Description   => '0',
                Justification => '0',
            },
        },
    },

    # test on valid RequestedTime
    {
        Description => 'Test on valid RequestedTime for ChangeUpdate.',
        SourceData  => {
            ChangeAdd => {
                UserID        => 1,
                RequestedTime => '2009-10-29 13:33:33',
                Description   => 'RequestedTime - ' . $UniqueSignature,
            },
            ChangeUpdate => {
                RequestedTime => '2009-11-06 08:15:22',
                UserID        => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => {
                CreateBy      => 1,
                ChangeBy      => $UserIDs[0],
                ChangeTitle   => '',
                RequestedTime => '2009-11-06 08:15:22',
                Description   => 'RequestedTime - ' . $UniqueSignature,
            },
        },
        SearchTest => [43],
    },

    # test on invalid RequestedTime
    {
        Description => 'Test on invalid RequestedTime for ChangeUpdate.',
        UpdateFails => 1,
        SourceData  => {
            ChangeAdd => {
                UserID        => 1,
                RequestedTime => '2009-10-29 13:33:33',
                Description   => 'RequestedTime - ' . $UniqueSignature,
            },
            ChangeUpdate => {
                RequestedTime => 'anything',
                UserID        => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeGet => {
                CreateBy      => 1,
                ChangeBy      => 1,
                ChangeTitle   => '',
                RequestedTime => '2009-10-29 13:33:33',
                Description   => 'RequestedTime - ' . $UniqueSignature,
            },
        },
        SearchTest => [ 42, 43 ],
    },

    # Test category
    {
        Description => 'Test category update "5 very high"',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test CIP (Category) - ' . $UniqueSignature,
                Category    => '2 low',
            },
            ChangeUpdate => {
                UserID   => 1,
                Category => '5 very high',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Test CIP (Category) - ' . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
                Category        => '5 very high',
                CategoryID      => $ChangeCategoryName2ID{'5 very high'},
                CreateBy        => $UserIDs[0],
                ChangeBy        => 1,
            },
        },
        SearchTest => [ 6, 54, 60 ],
        Label => 'OrderByCIPTests',    # this change will be used in order by search tests
    },

    # Test invalid category
    {
        Description => 'Test invalid category update "18 super high"',
        UpdateFails => 1,
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test invalid update CIP (Category) - ' . $UniqueSignature,
                Category    => '2 low',
            },
            ChangeUpdate => {
                UserID   => 1,
                Category => '18 super high',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Test invalid update CIP (Category) - ' . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
                Category        => '2 low',
                CategoryID      => $ChangeCategoryName2ID{'2 low'},
                CreateBy        => $UserIDs[0],
                ChangeBy        => $UserIDs[0],
            },
        },
        SearchTest => [ 6, 54, 60, 63, 64 ],
        Label => 'OrderByCIPTests',    # this change will be used in order by search tests
    },

    # Test impact
    {
        Description => 'Test impact update "5 very high"',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test update CIP (Impact) - ' . $UniqueSignature,
                Impact      => '2 low',
            },
            ChangeUpdate => {
                UserID => 1,
                Impact => '5 very high',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Test update CIP (Impact) - ' . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
                Impact          => '5 very high',
                ImpactID        => $ChangeImpactName2ID{'5 very high'},
                CreateBy        => $UserIDs[0],
                ChangeBy        => 1,
            },
        },
        SearchTest => [ 6, 55, 61 ],
        Label => 'OrderByCIPTests',    # this change will be used in order by search tests
    },

    # Test invalid impact
    {
        Description => 'Test invalid impact update "18 super high"',
        UpdateFails => 1,
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test update invalid CIP (Impact) - ' . $UniqueSignature,
                Impact      => '2 low',
            },
            ChangeUpdate => {
                UserID => 1,
                Impact => '18 super high',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Test update invalid CIP (Impact) - ' . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
                Impact          => '2 low',
                ImpactID        => $ChangeImpactName2ID{'2 low'},
                CreateBy        => $UserIDs[0],
                ChangeBy        => $UserIDs[0],
            },
        },
        SearchTest => [ 6, 55, 61 ],
        Label => 'OrderByCIPTests',    # this change will be used in order by search tests
    },

    # Test priority
    {
        Description => 'Test priority update "5 very high"',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test update CIP (Priority) - ' . $UniqueSignature,
                Priority    => '2 low',
            },
            ChangeUpdate => {
                UserID   => 1,
                Priority => '5 very high',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Test update CIP (Priority) - ' . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
                Priority        => '5 very high',
                PriorityID      => $ChangePriorityName2ID{'5 very high'},
                CreateBy        => $UserIDs[0],
                ChangeBy        => 1,
            },
        },
        SearchTest => [ 6, 56, 62 ],
        Label => 'OrderByCIPTests',    # this change will be used in order by search tests
    },

    # Test invalid priority
    {
        Description => 'Test invalid priority update "18 super high"',
        UpdateFails => 1,
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test invalid update CIP (Priority) - ' . $UniqueSignature,
                Priority    => '2 low',
            },
            ChangeUpdate => {
                UserID   => 1,
                Priority => '18 super high',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Test invalid update CIP (Priority) - ' . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
                Priority        => '2 low',
                PriorityID      => $ChangePriorityName2ID{'2 low'},
                CreateBy        => $UserIDs[0],
                ChangeBy        => $UserIDs[0],
            },
        },
        SearchTest => [ 6, 56, 62 ],
        Label => 'OrderByCIPTests',    # this change will be used in order by search tests
    },

    #----------------------------------#
    # Tests for Change Dynamic fields
    #----------------------------------#

    # test some change dynamic fields ChangeAdd and ChangeUpdate
    {
        Description => 'Test ChangeAdd and ChangeUpdate with change dynamic fields.',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test add change with dynamic fields - ' . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'AAAA',
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'BBBB',
                'DynamicField_' . $UniqueNamePrefix . 'Test3' => 'CCCC',
                'DynamicField_' . $UniqueNamePrefix . 'Test4' => 'DDDD',
            },
            ChangeUpdate => {
                UserID                                        => 1,
                'DynamicField_' . $UniqueNamePrefix . 'Test3' => 'GGGG',
                'DynamicField_' . $UniqueNamePrefix . 'Test4' => 'HHHH',
            },
            WorkOrderAdd => {
                UserID                                                 => $UserIDs[0],
                'DynamicField_' . $UniqueNamePrefix . 'WorkorderTest1' => 'W-AAAA',
                'DynamicField_' . $UniqueNamePrefix . 'WorkorderTest2' => 'W-BBBB',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle     => 'Test add change with dynamic fields - ' . $UniqueSignature,
                ChangeBuilderID => $UserIDs[0],
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'AAAA',
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'BBBB',
                'DynamicField_' . $UniqueNamePrefix . 'Test3' => 'GGGG',
                'DynamicField_' . $UniqueNamePrefix . 'Test4' => 'HHHH',
                CreateBy                                      => $UserIDs[0],
            },
        },

        SearchTest => [ 6, 69, 70, 71, 72 ],
    },

    # test change dynamic fields with maximum length
    {
        Description => 'Test ChangeAdd dynamic fields with 3800 characters.',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test add change dynamic fields with 3800 characters - '
                    . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'A' x 3800,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'B' x 3800,
            },
        },
        ReferenceData => {
            ChangeGet => {
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'A' x 3800,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'B' x 3800,
            },
        },

        SearchTest => [6],
    },

    # test change dynamic fields larger than maximum length
    {
        Description => 'Test ChangeAdd dynamic fields with 3801 characters.',
        Fails       => 1,
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test add change dynamic fields with 3801 characters - '
                    . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'A' x 3801,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'B' x 3801,
            },
        },
        ReferenceData => {
            ChangeGet => undef,
        },
    },

    # test change dynamic fields larger than maximum length
    {
        Description => 'Test ChangeUpdate dynamic fields with 3801 characters.',
        UpdateFails => 1,
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test update change dynamic fields with 3801 characters - '
                    . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'A' x 3800,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'B' x 3800,
            },
            ChangeUpdate => {
                UserID                                        => 1,
                'DynamicField_' . $UniqueNamePrefix . 'Test3' => 'C' x 3801,
            },
        },
        ReferenceData => {
            ChangeGet => {
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'A' x 3800,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'B' x 3800,
            },
        },

        SearchTest => [6],
    },

    # test change dynamic fields with zero and empty strings
    {
        Description => 'Test ChangeUpdate with zero and empty string.',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Test update change dynamic fields with zero and empty string - '
                    . $UniqueSignature,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 'AAAA',
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => 'BBBB',
            },
            ChangeUpdate => {
                UserID                                        => 1,
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 0,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => '',
            },
        },
        ReferenceData => {
            ChangeGet => {
                'DynamicField_' . $UniqueNamePrefix . 'Test1' => 0,
                'DynamicField_' . $UniqueNamePrefix . 'Test2' => '',
            },
        },

        SearchTest => [6],
    },

    #------------------------------#
    # Tests on ChangeCAB*
    #------------------------------#

    # Test for ChangeCABGet
    {
        Description =>
            'Test checks empty ARRAY-ref on ChangeCABGet with no given CAB for ChangeCABGet.',
        SourceData => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents    => [],
                CABCustomers => [],
            },
        },
        SearchTest => [ 4, 12, 13 ],
    },

    # Test for ChangeCABUpdate and ChangeCABGet
    {
        Description => 'Test checks removal of duplicate CAB members for ChangeCABUpdate',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'CABUpdate and CABGet - Title - ' . $UniqueSignature,
            },
            ChangeCABUpdate => {
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[0],
                    $UserIDs[0],
                    $UserIDs[1],
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                    $CustomerUserIDs[1],
                    $CustomerUserIDs[1],
                    $CustomerUserIDs[1],
                    $CustomerUserIDs[1],
                ],
            },
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[1],
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
            HistoryGet => {
                ChangeAdd       => '',
                ChangeCABUpdate => {
                    ChangeCABCustomers => [
                        [ undef, join '%%', $CustomerUserIDs[0], $CustomerUserIDs[1] ]
                    ],
                    ChangeCABAgents => [
                        [ undef, join '%%', $UserIDs[0], $UserIDs[1] ]
                    ],
                },
            },
        },
        SearchTest => [ 6, 8, 9, 10, 22, 28, 29, 33, 34, 35 ],
    },

    # Test for ChangeCABUpdate and ChangeCABGet
    {
        Description => 'Test checks invalid CABAgents param for ChangeCABUpdate.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeCABUpdate => {
                CABAgents => [
                    $CustomerUserIDs[0],
                ],
            },
            ChangeCABUpdateFail => 1,
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents    => [],
                CABCustomers => [],
            },
        },
    },

    # Test for ChangeCABUpdate and ChangeCABGet
    {
        Description => 'Passing an integer as CABAgents to ChangeCABUpdate.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeCABUpdate => {
                CABAgents => $UserIDs[0],
            },
            ChangeCABUpdateFail => 1,
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents    => [],
                CABCustomers => [],
            },
        },
    },

    # Test for ChangeCABUpdate and ChangeCABGet
    {
        Description => 'Neither CABAgents nor CABCustomers is passed.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeCABUpdate => {
            },
            ChangeCABUpdateFail => 1,
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents    => [],
                CABCustomers => [],
            },
        },
    },

    # Test for ChangeCABUpdate and ChangeCABGet
    {
        Description => 'Test checks deaktivated CABAgents param for ChangeCABUpdate.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeCABUpdate => {
                CABAgents => [
                    $InvalidUserIDs[0],
                ],
            },
            ChangeCABUpdateFail => 1,
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents    => [],
                CABCustomers => [],
            },
        },
    },

    # Test for ChangeCABUpdate and ChangeCABGet
    {
        Description => 'Test checks invalid CABCustomers param for ChangeCABUpdate.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeCABUpdate => {
                CABCustomers => [
                    $UserIDs[0],
                ],
            },
            ChangeCABUpdateFail => 1,
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents    => [],
                CABCustomers => [],
            },
        },
    },

    # Test for ChangeCABUpdate and ChangeCABGet
    {
        Description => 'A valid CABCustomer is passed to ChangeCABUpdate, no CABAgents.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeCABUpdate => {
                CABCustomers => [
                    $CustomerUserIDs[0],
                ],
            },
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents    => [],
                CABCustomers => [
                    $CustomerUserIDs[0],
                ],
            },
        },
    },

    # Test for ChangeCABUpdate and ChangeCABGet
    {
        Description => 'A valid CABAgent is passed to ChangeCABUpdate, no CABCustomers.',
        SourceData  => {
            ChangeAdd => {
                UserID => $UserIDs[0],
            },
            ChangeCABUpdate => {
                CABAgents => [
                    $UserIDs[0],
                ],
            },
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents => [
                    $UserIDs[0],
                ],
                CABCustomers => [],
            },
        },
    },

    # Test for ChangeCABUpdate and ChangeCABGet
    {
        Description => 'Test checks valid ChangeAdd and ChangeCABUpdate.',
        SourceData  => {
            ChangeAdd => {
                UserID    => $UserIDs[0],
                CABAgents => [
                    $UserIDs[0],
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                ],
            },
            ChangeCABUpdate => {
                CABCustomers => [
                    $UserIDs[0],
                ],
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[1],
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[1],
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
        },
    },

    # Test for ChangeCABDelete
    {
        Description => 'Test checks ChangeCABDelete with valid params.',
        SourceData  => {
            ChangeAdd => {
                UserID    => $UserIDs[0],
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[1]
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
            ChangeCABDelete => 1,
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents    => [],
                CABCustomers => [],
            },
        },
    },

    # Test for ChangeCABDelete - in the executiion of the, no ChangeID will be given
    {
        Description => 'Test checks ChangeCABDelete with invalid params.',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'CABDelete (invalid params) - Title - ' . $UniqueSignature,
                CABAgents   => [
                    $UserIDs[0],
                    $UserIDs[1]
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
            ChangeCABDelete     => 1,
            ChangeCABDeleteFail => 1,
        },
        ReferenceData => {
            ChangeCABGet => {
                CABAgents => [
                    $UserIDs[0],
                    $UserIDs[1]
                ],
                CABCustomers => [
                    $CustomerUserIDs[0],
                    $CustomerUserIDs[1],
                ],
            },
        },
        SearchTest => [ 6, 8, 9, 10 ],
    },

    # add change and update changestateid
    {
        Description => 'Test setting new ChangeStateID in ChangeUpdate.',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            ChangeUpdate => {
                UserID        => 1,
                ChangeStateID => $ChangeStateName2ID{rejected},
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeStateID => $ChangeStateName2ID{rejected},
            },
        },
        SearchTest => [ 29, 35 ],
    },

    #----------------------------------------#
    # Changes for 'OrderBy' search tests
    #----------------------------------------#

    #
    {
        Description => "Change for 'OrderBy' tests (1).",
        SourceData  => {
            ChangeAdd => {
                UserID        => 1,
                ChangeTitle   => 'OrderByChange - Title - ' . $UniqueSignature,
                ChangeStateID => $ChangeStateName2ID{successful},
            },
            ChangeUpdate => {
                UserID          => $UserIDs[0],
                ChangeManagerID => $UserIDs[1],
            },
            ChangeAddChangeTime => {
                CreateTime => '2009-10-01 01:00:00',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeStateID => $ChangeStateName2ID{successful},
            },
        },
        Label => 'OrderBySearchTest',    # this change will be used in order by search tests
    },

    #
    {
        Description => "Change for 'OrderBy' tests (2).",
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[1],
                ChangeTitle => 'OrderByChange - Title - ' . $UniqueSignature,
            },
            ChangeUpdate => {
                UserID          => $UserIDs[1],
                ChangeStateID   => $ChangeStateName2ID{rejected},
                ChangeManagerID => 1,
            },
            ChangeAddChangeTime => {
                CreateTime => '2009-10-30 01:00:00',
            },
            ChangeUpdateChangeTime => {
                ChangeTime => '2009-10-30 01:00:15',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeStateID => $ChangeStateName2ID{rejected},
            },
        },
        Label => 'OrderBySearchTest',    # this change will be used in order by search tests
    },

    #
    {
        Description => "Change for 'OrderBy' tests (3).",
        SourceData  => {
            ChangeAdd => {
                UserID        => $UserIDs[0],
                ChangeStateID => $ChangeStateName2ID{failed},
                ChangeTitle   => 'OrderByChange - Title - ' . $UniqueSignature,
            },
            ChangeUpdate => {
                UserID          => 1,
                ChangeManagerID => $UserIDs[0],
            },
            ChangeAddChangeTime => {
                CreateTime => '2009-01-30 00:00:00',
            },
            ChangeUpdateChangeTime => {
                ChangeTime => '2009-01-30 23:59:59',
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeStateID => $ChangeStateName2ID{failed},
            },
        },
        SearchTest => [6],
        Label      => 'OrderBySearchTest',    # this change will be used in order by search tests
    },

    # Change for Permission tests.
    {
        Description => "Change for 'Permission' tests.",
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Permission - Title - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle => 'Permission - Title - ' . $UniqueSignature,
            },
            ChangeCABGet => {
                CABAgents => [
                ],
                CABCustomers => [
                ],
            },
        },
        SearchTest => [6],
        Label      => 'PermissionTest',    # this change will be used in permission tests
    },

    # Change for ChangePossibleStatesGet tests.
    {
        Description => "Change for 'ChangePossibleStatesGet' tests.",
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'ChangePossibleStatesGet - Title - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle => 'ChangePossibleStatesGet - Title - ' . $UniqueSignature,
            },
        },
        SearchTest => [6],
        Label      => 'PossibleStatesTest',    # change for testing ChangePossibleStatesGet()
    },

    # Change for attachment tests
    {
        Description => 'Change for attachment tests',
        SourceData  => {
            ChangeAdd => {
                UserID      => $UserIDs[0],
                ChangeTitle => 'Attachments - Title - ' . $UniqueSignature,
            },
        },
        ReferenceData => {
            ChangeGet => {
                ChangeTitle => 'Attachments - Title - ' . $UniqueSignature,
            },
        },
        SearchTest => [6],
        Label      => 'Attachment',
    },
);

# ------------------------------------------------------------ #
# execute the general change tests
# ------------------------------------------------------------ #

my %TestedChangeID;           # change ids of created changes
my %ChangeIDForSearchTest;    # change ids that are expected to be found by a search test
my %Label2ChangeIDs;          # change ids that are used for special tests

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

    # add a new Change
    if ( $SourceData->{ChangeAdd} ) {

        # add the change
        $ChangeID = $ChangeObject->ChangeAdd(
            %{ $SourceData->{ChangeAdd} }
        );

        # remember current ChangeID
        if ($ChangeID) {

            $TestedChangeID{$ChangeID} = 1;

            # save changeid for use in search tests
            if ( exists $Test->{SearchTest} ) {
                my @SearchTests = @{ $Test->{SearchTest} };

                for my $SearchTestNr (@SearchTests) {
                    $ChangeIDForSearchTest{$SearchTestNr}->{$ChangeID} = 1;
                }
            }

            # save changeid for special tests
            if ( exists $Test->{Label} ) {
                $Label2ChangeIDs{ $Test->{Label} } ||= [];
                push @{ $Label2ChangeIDs{ $Test->{Label} } }, $ChangeID;
            }
        }

        # change CreateTime
        if ( $ChangeID && $SourceData->{ChangeAddChangeTime} ) {
            SetTimes(
                ChangeID   => $ChangeID,
                CreateTime => $SourceData->{ChangeAddChangeTime}->{CreateTime},
            );
        }

        # UserID is the only required parameter
        if ( !$SourceData->{ChangeAdd}->{UserID} ) {
            $Self->False(
                $ChangeID,
                "Test $TestCount: ChangeAdd() - Don't add change without given UserID.",
            );
        }

        if ( $SourceData->{ChangeAdd}->{UserID} ) {
            if ( $Test->{Fails} ) {
                $Self->False(
                    $ChangeID,
                    "Test $TestCount: ChangeAdd() - Add change should fail.",
                );
            }
            else {
                $Self->True(
                    $ChangeID,
                    "Test $TestCount: ChangeAdd() - Add change.",
                );
            }
        }
    }    # end if 'ChangeAdd'

    if ( exists $SourceData->{ChangeUpdate} ) {

        # update the change
        my $ChangeUpdateSuccess = $ChangeObject->ChangeUpdate(
            ChangeID => $ChangeID,
            %{ $SourceData->{ChangeUpdate} },
        );

        # change ChangeTime
        if ( $ChangeID && $SourceData->{ChangeUpdateChangeTime} ) {
            SetTimes(
                ChangeID   => $ChangeID,
                ChangeTime => $SourceData->{ChangeUpdateChangeTime}->{ChangeTime},
            );
        }

        if (
            $Test->{Fails}
            || $Test->{UpdateFails}
            )
        {
            $Self->False(
                $ChangeUpdateSuccess,
                "Test $TestCount: ChangeUpdate()",
            );
        }
        else {
            $Self->True(
                $ChangeUpdateSuccess,
                "Test $TestCount: ChangeUpdate()",
            );
        }
    }    # end if ChangeUpdate

    if ( $SourceData->{ChangeCABUpdate} && $ChangeID ) {
        my $CABUpdateSuccess = $ChangeObject->ChangeCABUpdate(
            %{ $SourceData->{ChangeCABUpdate} },
            ChangeID => $ChangeID,
            UserID   => 1,
        );

        if ( $SourceData->{ChangeCABUpdateFail} ) {
            $Self->False(
                $CABUpdateSuccess,
                "Test $TestCount: |- ChangeCABUpdate",
                )
        }
        else {
            $Self->True(
                $CABUpdateSuccess,
                "Test $TestCount: |- ChangeCABUpdate",
            );
        }
    }    # end if 'ChangeCABUpdate'

    if ( $SourceData->{ChangeCABDelete} && $ChangeID ) {
        my %CABDeleteParams = (
            UserID   => 1,
            ChangeID => $ChangeID,
        );

        # special handling for fail tests
        if ( $SourceData->{ChangeCABDeleteFail} ) {

            # test void context
            $Self->False(
                $ChangeObject->ChangeCABDelete() || 0,
                "Test $TestCount: |- ChangeCABDelete",
            );

            my @DeleteTests = (
                { UserID   => 1 },
                { ChangeID => $ChangeID },
            );
            for my $FailTest (@DeleteTests) {
                $Self->False(
                    $ChangeObject->ChangeCABDelete( %{$FailTest} ) || 0,
                    "Test $TestCount: |- ChangeCABDelete",
                );
            }
        }
        else {

            # Delete with all params
            $Self->True(
                $ChangeObject->ChangeCABDelete(%CABDeleteParams),
                "Test $TestCount: |- ChangeCABDelete",
            );
        }
    }    # end if 'ChangeCABDelete'

    # add a workorder
    if ( $SourceData->{WorkOrderAdd} ) {
        my $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
            %{ $SourceData->{WorkOrderAdd} },
            ChangeID => $ChangeID,
        );

        $Self->True(
            $WorkOrderID,
            "Test $TestCount: |- WorkOrderAdd",
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
        for my $ChangeAttributes (qw(ChangeID ChangeNumber ChangeBuilderID CreateTime ChangeTime)) {
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
            my $ChangeAttribute    = Data::Dumper::Dumper( $ChangeData->{$RequestedAttribute} );
            my $ReferenceAttribute = Data::Dumper::Dumper( $ReferenceData->{ChangeGet}->{$RequestedAttribute} );
            ## use critic

            $Self->Is(
                $ChangeAttribute,
                $ReferenceAttribute,
                "Test $TestCount: |- $RequestedAttribute (ChangeID: $ChangeID)",
            );
        }
    }    # end if 'ChangeGet'

    if ( $ReferenceData->{ChangeCABGet} ) {
        my $CABData = $ChangeObject->ChangeCABGet(
            %{ $ReferenceData->{ChangeCABGet} },
            UserID   => 1,
            ChangeID => $ChangeID,
        );

        for my $RequestedAttribute ( sort keys %{ $ReferenceData->{ChangeCABGet} } ) {

            # turn off all pretty print
            local $Data::Dumper::Indent = 0;
            local $Data::Dumper::Useqq  = 1;

            # dump the attribute from ChangeGet() and the reference attribute
            ## no critic
            my $ChangeAttribute    = Data::Dumper::Dumper( $CABData->{$RequestedAttribute} );
            my $ReferenceAttribute = Data::Dumper::Dumper( $ReferenceData->{ChangeCABGet}->{$RequestedAttribute} );
            ## use critic

            $Self->Is(
                $ChangeAttribute,
                $ReferenceAttribute,
                "Test $TestCount: |- ChangeCABGet ( $RequestedAttribute )",
            );
        }
    }    # end if 'ChangeCABGet'

    # test history entries
    if ( $ReferenceData->{HistoryGet} ) {

        # get subtree
        my $CheckData = $ReferenceData->{HistoryGet};

        # get all history entries
        my $HistoryEntries = $HistoryObject->ChangeHistoryGet(
            ChangeID => $ChangeID,
            UserID   => 1,
        );

        my %HistoryType2CheckIndex;

        # check history entries
        HISTORYENTRY:
        for my $HistoryEntry ( @{$HistoryEntries} ) {
            my $HistoryType = $HistoryEntry->{HistoryType};
            my $DataForType = $CheckData->{$HistoryType};

            if ( $HistoryType eq 'ChangeAdd' ) {
                $Self->Is(
                    $HistoryEntry->{ContentNew},
                    $ChangeID,
                    "Test $TestCount: |- Check ChangeAdd history entry ",
                );
            }
            elsif ( $HistoryType eq 'ChangeUpdate' || $HistoryType eq 'ChangeCABUpdate' ) {

                my $Index     = $HistoryType2CheckIndex{$HistoryType}++;
                my $Fieldname = $HistoryEntry->{Fieldname};

                next HISTORYENTRY if !$DataForType->{$Fieldname};

                $Self->Is(
                    $HistoryEntry->{ContentOld},
                    $DataForType->{$Fieldname}->[$Index]->[0],
                    "Test $TestCount: |- Check ChangeUpdate -> ContentOld ",
                );

                $Self->Is(
                    $HistoryEntry->{ContentNew},
                    $DataForType->{$Fieldname}->[$Index]->[1],
                    "Test $TestCount: |- Check ChangeUpdate -> ContentNew for $Fieldname",
                );
            }
        }
    }
}

# get executed each loop, even on next
continue {
    $TestCount++;
}

# ------------------------------------------------------------ #
# test for special ChangeSearch (with order by ChangeNumber)
# bug# 5825 http://bugs.otrs.org/show_bug.cgi?id=5825
# ------------------------------------------------------------ #
{

    # add a new change with CABCustomer $CustomerUserIDs[2]
    my $ChangeID = $ChangeObject->ChangeAdd(
        ChangeTitle     => 'ABC',
        Description     => 'DEF',
        Justification   => 'XYZ',
        ChangeManagerID => $UserIDs[0],
        ChangeBuilderID => $UserIDs[0],
        CABCustomers    => [
            $CustomerUserIDs[2],
        ],
        UserID => $UserIDs[1],
    );

    # test if change was added successfully
    $Self->True(
        $ChangeID,
        "Test "
            . $TestCount++
            . ' - adding of change for special search test (with order by ChangeNumber)',
    );

    # search for the change ids
    my $ChangeIDs = $ChangeObject->ChangeSearch(
        CABCustomers     => [ $CustomerUserIDs[2] ],
        OrderByDirection => ['Up'],
        OrderBy          => ['ChangeNumber'],
        Limit            => 1000,
        ChangeStates     => [
            'requested',
            'pending approval',
            'approved',
            'in progress',
            'pending pir'
        ],
        UserID => 1,
    );

    # check if search returned a result
    $Self->True(
        $ChangeIDs && ref $ChangeIDs eq 'ARRAY' && @{$ChangeIDs},
        "Test "
            . $TestCount++
            . ' - search for CABCustomers, special search test (with order by ChangeNumber)',
    );

    # check if change was found
    $Self->Is(
        $ChangeIDs->[0],
        $ChangeID,
        'Test '
            . $TestCount++
            . ' - search for CABCustomers, special search test (with order by ChangeNumber) ',
    );

    # delete the Change
    my $DeleteSuccess = $ChangeObject->ChangeDelete(
        ChangeID => $ChangeID,
        UserID   => 1,
    );

    # check for successful deleting
    $Self->True(
        $DeleteSuccess,
        "Test "
            . $TestCount++
            . ' - deleting of ChangeID '
            . $ChangeID
            . ' for special search test (with order by ChangeNumber)',
    );
}

# ------------------------------------------------------------ #
# test for ChangeLookup
# ------------------------------------------------------------ #

my ($ChangeLookupTestChangeID) = @{ $Label2ChangeIDs{ChangeLookupTest} || [] };

if ($ChangeLookupTestChangeID) {
    my $ChangeData = $ChangeObject->ChangeGet(
        ChangeID => $ChangeLookupTestChangeID,
        UserID   => 1,
    );

    my $ChangeID = $ChangeObject->ChangeLookup(
        ChangeNumber => $ChangeData->{ChangeNumber},
    );

    $Self->Is(
        $ChangeID,
        $ChangeData->{ChangeID},
        'Test ' . $TestCount++ . ': ChangeLookup with ChangeNumber '
            . $ChangeData->{ChangeNumber} . ' successful.',
    );

    my $ChangeNumber = $ChangeObject->ChangeLookup(
        ChangeID => $ChangeLookupTestChangeID,
    );

    $Self->Is(
        $ChangeNumber,
        $ChangeData->{ChangeNumber},
        'Test '
            . $TestCount++
            . ": ChangeLookup with ChangeID $ChangeLookupTestChangeID successful.",
    );

    # now some param checks for ChangeLookup()
    my $LookupOk = $ChangeObject->ChangeLookup( UserID => 1 );

    $Self->False(
        $LookupOk,
        'Only an unused param passed to ChangeLookup()',
    );

    $LookupOk = $ChangeObject->ChangeLookup();

    $Self->False(
        $LookupOk,
        'No param passed to ChangeLookup()',
    );

    $LookupOk = $ChangeObject->ChangeLookup(
        ChangeID     => $ChangeLookupTestChangeID,
        ChangeNumber => $ChangeData->{ChangeNumber},
        UserID       => 1,
    );

    $Self->False(
        $LookupOk,
        'Exclusive params passed to ChangeLookup()',
    );
}

# test if ChangeList returns at least as many changes as we created
# we cannot test for a specific number as these tests can be run in existing environments
# where other changes already exist
my $ChangeList = $ChangeObject->ChangeList( UserID => 1 ) || [];
my %ChangeListMap = map { $_ => 1 } @{$ChangeList};

# check whether the created changes were found by ChangeList()
for my $KeyTestedChangeID ( sort keys %TestedChangeID ) {
    $Self->True(
        $ChangeListMap{$KeyTestedChangeID},
        'Test ' . $TestCount++ . ": ChangeList() - ChangeID $KeyTestedChangeID in list.",
    );
}

# count all tests that are required to and planned for fail
my $Fails = scalar grep { $_->{Fails} } @ChangeTests;
my $NrCreateChanges = ( scalar @ChangeTests ) - $Fails;

# test if the changes were created
$Self->Is(
    scalar keys %TestedChangeID || 0,
    $NrCreateChanges,
    'Test ' . $TestCount++ . ': amount of change objects and test cases.',
);

# ------------------------------------------------------------ #
# define general change search tests
# ------------------------------------------------------------ #
my $SystemTime = $TimeObject->SystemTime();

my @ChangeSearchTests = (

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

    # Nr 2 - search for all changes created by our first user
    {
        Description => 'ChangeTitle, Justification',
        SearchData  => {
            ChangeTitle   => 'Change 1 - Title - ' . $UniqueSignature,
            Justification => 'Change 1 - Justification - ' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 3 - test createtimenewerdate
    {
        Description => 'CreateTimeNewerDate',
        SearchData  => {
            CreateTimeNewerDate => $TimeObject->SystemTime2TimeStamp(
                SystemTime => $SystemTime - ( 60 * 60 ),
            ),
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 4 - test createtimeolderdate
    {
        Description => 'CreateTimeOlderDate',
        SearchData  => {
            CreateTimeOlderDate => $TimeObject->SystemTime2TimeStamp(
                SystemTime => $SystemTime + ( 60 * 60 ),
            ),
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 5 - test ChangeManagerID
    {
        Description => 'ChangeManagerID',
        SearchData  => {
            ChangeManagerIDs => [ $UserIDs[0] ],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 6 - test ChangeBuilderID and ChangeTitle with wildcard
    {
        Description => 'ChangeBuilderID',
        SearchData  => {
            ChangeBuilderIDs => [ $UserIDs[0] ],
            ChangeTitle      => '%' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 7 - test ChangeManagerID and ChangeBuilderID
    {
        Description => 'ChangeBuilderID, ChangeManagerID',
        SearchData  => {
            ChangeBuilderIDs => [ $UserIDs[0] ],
            ChangeManagerIDs => [ $InvalidUserIDs[0] ],
            ChangeTitle      => '%' . $UniqueSignature,
        },
        ResultData => {
            TestCount => 1,
            Count     => 0,
        },
    },

    # Nr 8 - test CABAgent
    {
        Description => 'CABAgent',
        SearchData  => {
            CABAgents   => [ $UserIDs[0] ],
            ChangeTitle => '%' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 9 - test CABCustomer
    {
        Description => 'CABCustomer',
        SearchData  => {
            CABCustomers => [ $CustomerUserIDs[0] ],
            ChangeTitle  => '%' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 10 - test CABAgent and CABCustomer
    {
        Description => 'CABAgent, CABCustomer',
        SearchData  => {
            CABAgents    => [ $UserIDs[0] ],
            CABCustomers => [ $CustomerUserIDs[1] ],
            ChangeTitle  => '%' . $UniqueSignature,
        },
        ResultData => {
            TestCount     => 1,
            TestExistence => 1,
        },
    },

    # Nr 11 - test Justification
    # ToAscii() adds an extra newline
    {
        Description => 'Justification',
        SearchData  => {
            Justification => 'JJ' . '%' . "\n",
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 12 - test changetimenewerdate
    {
        Description => 'ChangeTimeNewerDate',
        SearchData  => {
            ChangeTimeNewerDate => $TimeObject->SystemTime2TimeStamp(
                SystemTime => $SystemTime - ( 60 * 60 ),
            ),
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 13 - test changetimeolderdate
    {
        Description => 'ChangeTimeOlderDate',
        SearchData  => {
            ChangeTimeOlderDate => $TimeObject->SystemTime2TimeStamp(
                SystemTime => $SystemTime + ( 60 * 60 ),
            ),
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 14 - ChangeTitle with wildcard
    {
        Description => 'ChangeTitle with wildcard',
        SearchData  => {
            ChangeTitle => ( 'T' x 250 ) . '%',
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 15 - Description with wildcard
    {
        Description => 'Description with wildcard',
        SearchData  => {
            Description => ( 'D' x 250 ) . '%',
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 16 - Justification with wildcard
    {
        Description => 'Justification with wildcard',
        SearchData  => {
            Justification => ( 'J' x 250 ) . '%',
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 17 - ChangeTitle, Description, Justification with wildcard
    {
        Description => 'ChangeTitle, Description, Justification with wildcard',
        SearchData  => {
            ChangeTitle   => ( 'T' x 250 ) . '%',
            Description   => ( 'D' x 250 ) . '%',
            Justification => ( 'J' x 250 ) . '%',
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 18 - ChangeTitle with '0'
    {
        Description => "ChangeTitle with '0'",
        SearchData  => {
            ChangeTitle => '0',
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 19 - Description with '0'
    {
        Description => "Description with '0'",
        SearchData  => {
            Description => '0',
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 20 - Justification with '0'
    {
        Description => "Justification with '0'",
        SearchData  => {
            Justification => '0',
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 21 - ChangeTitle, Description, Justification with '0'
    {
        Description => "ChangeTitle, Description, Justification with '0'",
        SearchData  => {
            ChangeTitle   => '0',
            Description   => '0',
            Justification => '0',
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 22 - ChangeStateID
    {
        Description => 'ChangeStateID',
        SearchData  => {
            ChangeStateIDs => [ $ChangeStateName2ID{requested} ],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 23 - ChangeBuilderID
    {
        Description => 'ChangeBuilderID (two builders)',
        SearchData  => {
            ChangeBuilderIDs => [ $UserIDs[0], $UserIDs[1] ],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 24 - ChangeManagerID
    {
        Description => 'ChangeManagerID (two manager)',
        SearchData  => {
            ChangeManagerIDs => [ $UserIDs[0], $UserIDs[1] ],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 25 - CreateBy
    {
        Description => 'CreateBy (two creators)',
        SearchData  => {
            CreateBy => [ 1, $UserIDs[0] ],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 26 - ChangeBy
    {
        Description => 'ChangeBy (two creators)',
        SearchData  => {
            ChangeBy => [ 1, $UserIDs[0] ],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 27 - test changetimenewerdate and changetimeolderdate
    {
        Description => 'ChangeTimeNewerDate, ChangeTimeOlderDate',
        SearchData  => {
            ChangeTimeNewerDate => $TimeObject->SystemTime2TimeStamp(
                SystemTime => $SystemTime - ( 60 * 60 ),
            ),
            ChangeTimeOlderDate => $TimeObject->SystemTime2TimeStamp(
                SystemTime => $SystemTime + ( 60 * 60 ),
            ),
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 28 - ChangeStateID (same ID three times)
    {
        Description => 'ChangeStateID (same ID three times)',
        SearchData  => {
            ChangeStateIDs => [
                $ChangeStateName2ID{requested},
                $ChangeStateName2ID{requested},
                $ChangeStateName2ID{requested},
            ],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 29 - ChangeStateID (three different IDs)
    {
        Description => 'ChangeStateID (three different IDs)',
        SearchData  => {
            ChangeStateIDs => [
                $ChangeStateName2ID{requested},
                $ChangeStateName2ID{approved},
                $ChangeStateName2ID{rejected},
            ],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 30 - UsingWildcards => 0, ChangeTitle
    {
        Description => 'UsingWildcards => 0, ChangeTitle',
        SearchData  => {
            UsingWildcards => 0,
            ChangeTitle    => 'UnitTest-ITSMChange-NoWildcards-',
        },
        ResultData => {
            TestCount => 1,
            Count     => 0,
        },
    },

    # Nr 31 - UsingWildcards => 0, Description
    {
        Description => 'UsingWildcards => 0, Description',
        SearchData  => {
            UsingWildcards => 0,
            Description    => 'UnitTest-ITSMChange-NoWildcards-',
        },
        ResultData => {
            TestCount => 1,
            Count     => 0,
        },
    },

    # Nr 32 - UsingWildcards => 0, Description
    {
        Description => 'UsingWildcards => 0, Description',
        SearchData  => {
            UsingWildcards => 0,
            Description    => $NoWildcardsTestTitle,
        },
        ResultData => {
            TestCount => 1,
            Count     => 1,
        },
    },

    # Nr 33 - ChangeState (names, not IDs)
    {
        Description => 'ChangeState (names, not IDs)',
        SearchData  => {
            ChangeStates => ['requested'],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 34 - ChangeState (same name three times)
    {
        Description => 'ChangeState (same name three times)',
        SearchData  => {
            ChangeStates => [qw(requested requested requested)],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 35 - ChangeState (three different names)
    {
        Description => 'ChangeState (three different names)',
        SearchData  => {
            ChangeStates => [qw(requested approved rejected)],
        },
        ResultData => {
            TestExistence => 1,
        },
    },

    # Nr 36 - ChangeState (non-existent state)
    {
        Description => 'ChangeState (non-existent state)',
        SearchData  => {
            ChangeStates => [qw(requested approved rejected non-existent)],
        },
        SearchFails => 1,
    },

    # Nr 37 - ChangeStates (names not ids)
    {
        Description => 'ChangeStates (names not ids) - failed + requested',
        SearchData  => {
            Description  => 'ChangeStates - ' . $UniqueSignature,
            ChangeStates => [qw(requested failed)],
        },
        ResultData => {
            TestCount => 1,
        },
    },

    # Nr 38 - ChangeStates (names not ids)
    {
        Description => 'ChangeStates (names not ids) - pending approval',
        SearchData  => {
            Description  => 'ChangeStates - ' . $UniqueSignature,
            ChangeStates => ['pending approval'],
        },
        ResultData => {
            TestCount => 1,
        },
    },

    # Nr 39 - ChangeState (non-existent state only)
    {
        Description => 'ChangeState (non-existent state)',
        SearchData  => {
            ChangeStates => ['non-existent'],
        },
        SearchFails => 1,
    },

    # Nr 40 - Search for an invalid change state id
    {
        Description => 'Search for an invalid change state id',
        SearchData  => {
            ChangeStateIDs => [-11],
            Description    => 'ChangeStates - ' . $UniqueSignature,
        },
        SearchFails => 1,
    },

    # Nr 41 - Search for an invalid change RequestedTimeOlderDate
    {
        Description => 'Search for an invalid RequestedTime',
        SearchData  => {
            RequestedTimeOlderDate => 'anything',
        },
        SearchFails => 1,
    },

    # Nr 42 - Search for an valid change RequestedTimeOlderDate
    {
        Description => 'Search for an valid RequestedTime',
        SearchData  => {
            RequestedTimeOlderDate => '2009-10-29 13:33:33',
            Description            => 'RequestedTime - ' . $UniqueSignature,
        },
        ResultData => {
            TestCount => 1,
        },
    },

    # Nr 43 - Search for an valid change RequestedTimeNewerDate
    {
        Description => 'Search for an valid RequestedTime',
        SearchData  => {
            RequestedTimeNewerDate => '2009-10-29 13:33:33',
            Description            => 'RequestedTime - ' . $UniqueSignature,
        },
        ResultData => {
            TestCount => 1,
        },
    },

    # Nr 44 - Search for an invalid change RequestedTimeNewerDate
    {
        Description => 'Search for an invalid RequestedTime',
        SearchData  => {
            RequestedTimeNewerDate => 'anything',
        },
        SearchFails => 1,
    },

    # Nr 45 - Search for normalized title, leading whitespace
    {
        Description => 'Search for normalized title, leading whitespace',
        SearchData  => {
            ChangeTitle    => "Title with leading whitespace - " . $UniqueSignature,
            UsingWildcards => 0,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 46 - Search for normalized title, trailing whitespace
    {
        Description => 'Search for normalized title, trailing whitespace',
        SearchData  => {
            ChangeTitle    => "Title with trailing whitespace - " . $UniqueSignature,
            UsingWildcards => 0,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 47 - Search for normalized title, leading and trailing whitespace
    {
        Description => 'Search for normalized title, leading and trailing whitespace',
        SearchData  => {
            ChangeTitle    => "Title with leading and trailing whitespace - " . $UniqueSignature,
            UsingWildcards => 0,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 48 - Search for plain description
    {
        Description => 'Search for plain description',
        SearchData  => {
            Description    => 'This is bold - ' . $UniqueSignature,
            UsingWildcards => 0,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 49 - Search for plain justification
    {
        Description => 'Search for plain description',
        SearchData  => {
            Justification  => 'This is bold - ' . $UniqueSignature,
            UsingWildcards => 0,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 50 - Search for plain justification
    {
        Description => 'Search for plain description',
        SearchData  => {
            Description    => 'This is bold - ' . $UniqueSignature,
            Justification  => 'This is bold - ' . $UniqueSignature,
            UsingWildcards => 0,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 51 - Search for category
    {
        Description => 'Search for category',
        SearchData  => {
            Categories  => ['1 very low'],
            ChangeTitle => 'Test CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 52 - Search for impact
    {
        Description => 'Search for impact',
        SearchData  => {
            Impacts     => ['1 very low'],
            ChangeTitle => 'Test CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 53 - Search for priority
    {
        Description => 'Search for priority',
        SearchData  => {
            Priorities  => ['1 very low'],
            ChangeTitle => 'Test CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 54 - Search for categories
    {
        Description => 'Search for categories',
        SearchData  => {
            Categories  => [ '1 very low', '2 low', '5 very high' ],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 55 - Search for impacts
    {
        Description => 'Search for impacts',
        SearchData  => {
            Impacts     => [ '1 very low', '2 low', '5 very high' ],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 56 - Search for priorities
    {
        Description => 'Search for priorities',
        SearchData  => {
            Priorities  => [ '1 very low', '2 low', '5 very high' ],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 57 - Search for category id
    {
        Description => 'Search for category id',
        SearchData  => {
            CategoryIDs => [ $ChangeCategoryName2ID{'1 very low'} ],
            ChangeTitle => 'Test CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 58 - Search for impact id
    {
        Description => 'Search for impact id',
        SearchData  => {
            ImpactIDs   => [ $ChangeImpactName2ID{'1 very low'} ],
            ChangeTitle => 'Test CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 59 - Search for priority id
    {
        Description => 'Search for priority id',
        SearchData  => {
            PriorityIDs => [ $ChangePriorityName2ID{'1 very low'} ],
            ChangeTitle => 'Test CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 60 - Search for category ids
    {
        Description => 'Search for category ids',
        SearchData  => {
            CategoryIDs => [
                $ChangeCategoryName2ID{'1 very low'},
                $ChangeCategoryName2ID{'2 low'},
                $ChangeCategoryName2ID{'5 very high'},
            ],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 61 - Search for impacts
    {
        Description => 'Search for impacts',
        SearchData  => {
            ImpactIDs => [
                $ChangeImpactName2ID{'1 very low'},
                $ChangeImpactName2ID{'2 low'},
                $ChangeImpactName2ID{'5 very high'},
            ],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 62 - Search for priority ids
    {
        Description => 'Search for priority ids',
        SearchData  => {
            PriorityIDs => [
                $ChangePriorityName2ID{'1 very low'},
                $ChangePriorityName2ID{'2 low'},
                $ChangePriorityName2ID{'5 very high'},
            ],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 63 - Search for CIPs
    {
        Description => 'Search for all CIP columns',
        SearchData  => {
            Categories  => [ '1 very low', '2 low' ],
            Impacts     => ['3 normal'],
            Priorities  => ['3 normal'],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 64 - Search for CIP ids
    {
        Description => 'Search for all CIP id columns',
        SearchData  => {
            CategoryIDs => [
                $ChangeCategoryName2ID{'1 very low'},
                $ChangeCategoryName2ID{'2 low'},
            ],
            ImpactIDs => [
                $ChangeImpactName2ID{'3 normal'},
            ],
            PriorityIDs => [
                $ChangePriorityName2ID{'3 normal'},
            ],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 65 - Search for invalid CIPs
    {
        Description => 'Search for invalid CIPs',
        SearchData  => {
            Categories  => ['FooBar'],
            Impacts     => ['FooBar'],
            Priorities  => ['FooBar'],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        SearchFails => 1,
    },

    # Nr 66 - Search for invalid Categories
    {
        Description => 'Search for invalid Categories',
        SearchData  => {
            Categories  => ['FooBar'],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        SearchFails => 1,
    },

    # Nr 67 - Search for invalid CIPs
    {
        Description => 'Search for invalid Impacts',
        SearchData  => {
            Impacts     => ['FooBar'],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        SearchFails => 1,
    },

    # Nr 68 - Search for invalid Priorities
    {
        Description => 'Search for invalid CIPs',
        SearchData  => {
            Priorities  => ['FooBar'],
            ChangeTitle => 'Test%CIP%' . $UniqueSignature,
        },
        SearchFails => 1,
    },

    # Nr 69 - Search for change dynamic fields
    {
        Description => 'Search for change dynamic fields',
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
            TestCount     => 1,
        },
    },

    # Nr 70 - Search for change dynamic fields
    {
        Description => 'Search for change dynamic fields',
        SearchData  => {
            'DynamicField_' . $UniqueNamePrefix . 'Test3' => {
                Equals => 'GGGG',
            },
            'DynamicField_' . $UniqueNamePrefix . 'Test4' => {
                Equals => 'HHHH',
            },
            UsingWildcards => 1,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 71 - Search for change dynamic fields
    {
        Description => 'Search for change dynamic fields',
        SearchData  => {
            ChangeTitle => 'Test add change with dynamic fields - ' . $UniqueSignature,
            'DynamicField_' . $UniqueNamePrefix . 'Test1' => {
                Equals => 'AAAA',
            },
            'DynamicField_' . $UniqueNamePrefix . 'Test2' => {
                Equals => 'BBBB',
            },
            UsingWildcards => 1,
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },

    # Nr 72 - Search for change and workorder dynamic fields
    {
        Description => 'Search for change and workorder dynamic fields',
        SearchData  => {
            'DynamicField_' . $UniqueNamePrefix . 'Test1' => {
                Equals => 'AAAA',
            },
            'DynamicField_' . $UniqueNamePrefix . 'Test2' => {
                Equals => 'BBBB',
            },
            'DynamicField_' . $UniqueNamePrefix . 'WorkorderTest1' => {
                Equals => 'W-AAAA',
            },
            'DynamicField_' . $UniqueNamePrefix . 'WorkorderTest2' => {
                Equals => 'W-BBBB',
            },
        },
        ResultData => {
            TestExistence => 1,
            TestCount     => 1,
        },
    },
);

# get a sample change we created above for some 'special' test cases
my ($SearchTestChangeID) = @{ $Label2ChangeIDs{SearchTest} };
my $NrOfGeneralSearchTests = scalar @ChangeSearchTests;

if ($SearchTestChangeID) {
    my $SearchTestChange = $ChangeObject->ChangeGet(
        ChangeID => $SearchTestChangeID,
        UserID   => 1,
    );

    push @ChangeSearchTests, (
        {
            Description => 'ChangeNumber',
            SearchData  => {
                ChangeNumber => $SearchTestChange->{ChangeNumber},
            },
            ResultData => {
                TestCount => 1,
                Count     => 1,
            },
        },
        {
            Description => 'ChangeNumber, PlannedStartTimeNewerDate',
            SearchData  => {
                ChangeNumber              => $SearchTestChange->{ChangeNumber},
                PlannedStartTimeNewerDate => $SearchTestChange->{PlannedStartTime},
            },
            ResultData => {
                TestCount => 1,
                Count     => 1,
            },
        },
        {
            Description => 'ChangeNumber, PlannedStartTimeOlderDate',
            SearchData  => {
                ChangeNumber              => $SearchTestChange->{ChangeNumber},
                PlannedStartTimeOlderDate => $SearchTestChange->{PlannedStartTime},
            },
            ResultData => {
                TestCount => 1,
                Count     => 1,
            },
        },
        {
            Description => 'ChangeNumber, PlannedEndTimeNewerDate',
            SearchData  => {
                ChangeNumber            => $SearchTestChange->{ChangeNumber},
                PlannedEndTimeNewerDate => $SearchTestChange->{PlannedEndTime},
            },
            ResultData => {
                TestCount => 1,
                Count     => 1,
            },
        },
        {
            Description => 'ChangeNumber, PlannedEndTimeOlderDate',
            SearchData  => {
                ChangeNumber            => $SearchTestChange->{ChangeNumber},
                PlannedEndTimeOlderDate => $SearchTestChange->{PlannedEndTime},
            },
            ResultData => {
                TestCount => 1,
                Count     => 1,
            },
        },
        {
            Description => 'ChangeNumber, PlannedEndTimeOlderDate, PlannedEndTimeNewerDate',
            SearchData  => {
                ChangeNumber            => $SearchTestChange->{ChangeNumber},
                PlannedEndTimeOlderDate => $SearchTestChange->{PlannedEndTime},
                PlannedEndTimeNewerDate => $SearchTestChange->{PlannedEndTime},
            },
            ResultData => {
                TestCount => 1,
                Count     => 1,
            },
        },
        {
            Description => 'ChangeNumber, PlannedEndTimeOlderDate, PlannedEndTimeNewerDate'
                . ', PlannedStartTimeNewerDate, PlannedStartTimeOlderDate',
            SearchData => {
                ChangeNumber              => $SearchTestChange->{ChangeNumber},
                PlannedEndTimeOlderDate   => $SearchTestChange->{PlannedEndTime},
                PlannedEndTimeNewerDate   => $SearchTestChange->{PlannedEndTime},
                PlannedStartTimeOlderDate => $SearchTestChange->{PlannedStartTime},
                PlannedStartTimeNewerDate => $SearchTestChange->{PlannedStartTime},
                PlannedStartTimeOlderDate => $SearchTestChange->{PlannedStartTime},
            },
            ResultData => {
                TestCount => 1,
                Count     => 1,
            },
        },
        {
            Description => 'ChangeNumber with wildcard',
            SearchData  => {
                ChangeNumber => substr( $SearchTestChange->{ChangeNumber}, 0, 10 ) . '%',
            },
            ResultData => {
                TestExistence => 1,
            },
        },
        {
            Description => 'ChangeNumber, ChangeTitle with wildcard',
            SearchData  => {
                ChangeNumber => substr( $SearchTestChange->{ChangeNumber}, 0, 10 ) . '%',
                ChangeTitle  => substr( $SearchTestChange->{Title},        0, 1 ) . '%',
            },
            ResultData => {
                TestExistence => 1,
            },
        },
        {
            Description => 'ChangeNumber, two creators',
            SearchData  => {
                ChangeNumber => $SearchTestChange->{ChangeNumber},
                CreateBy     => [ $SearchTestChange->{CreateBy}, $SearchTestChange->{CreateBy} + 1 ],
            },
            ResultData => {
                TestCount => 1,
                Count     => 1,
            },
        },
        {
            Description => 'ChangeNumber (with wildcard), two creators',
            SearchData  => {
                ChangeNumber => substr( $SearchTestChange->{ChangeNumber}, 0, 10 ) . '%',
                CreateBy => [ $SearchTestChange->{CreateBy}, $SearchTestChange->{CreateBy} + 1 ],
            },
            ResultData => {
                TestExistence => 1,
            },
        },
        {
            Description => 'ChangeTitle, ChangeNumber, two creators',
            SearchData  => {
                ChangeNumber => $SearchTestChange->{ChangeNumber},
                CreateBy     => [ $SearchTestChange->{CreateBy}, $SearchTestChange->{CreateBy} + 1 ],
                ChangeTitle  => substr( $SearchTestChange->{ChangeTitle}, 0, 1 ) . '%',
            },
            ResultData => {
                TestCount => 1,
                Count     => 1,
            },
        },
        {
            Description => 'ChangeNumber, ActualEndTimeNewerDate',
            SearchData  => {
                ChangeNumber           => $SearchTestChange->{ChangeNumber},
                ActualEndTimeNewerDate => $SearchTestChange->{ActualEndTime},
            },
            ResultData => {
                TestCount => 1,
                Count     => 1,
            },
        },
        {
            Description => 'ChangeNumber, ActualEndTimeOlderDate',
            SearchData  => {
                ChangeNumber           => $SearchTestChange->{ChangeNumber},
                ActualEndTimeOlderDate => $SearchTestChange->{ActualEndTime},
            },
            ResultData => {
                TestExistence => 1,
            },
        },
        {
            Description => 'ChangeNumber, ActualEndTimeNewerDate, ActualEndTimeOlderDate',
            SearchData  => {
                ActualEndTimeNewerDate => $SearchTestChange->{ActualEndTime},
                ActualEndTimeOlderDate => $SearchTestChange->{ActualEndTime},
            },
            ResultData => {
                TestExistence => 1,
            },
        },
        {
            Description => 'ChangeNumber, ActualStartTimeNewerDate',
            SearchData  => {
                ActualStartTimeNewerDate => $SearchTestChange->{ActualStartTime},
            },
            ResultData => {
                TestExistence => 1,
            },
        },
        {
            Description => 'ChangeNumber, ActualStartTimeOlderDate',
            SearchData  => {
                ActualStartTimeOlderDate => $SearchTestChange->{ActualStartTime},
            },
            ResultData => {
                TestExistence => 1,
            },
        },
        {
            Description => 'ChangeNumber, ActualStartTimeNewerDate, ActualStartTimeOlderDate',
            SearchData  => {
                ActualStartTimeNewerDate => $SearchTestChange->{ActualStartTime},
                ActualStartTimeOlderDate => $SearchTestChange->{ActualStartTime},
            },
            ResultData => {
                TestExistence => 1,
            },
        },
    );

    my $NrOfAllSearchTests = scalar @ChangeSearchTests;

    for my $TestNumber ( ( $NrOfGeneralSearchTests + 1 ) .. $NrOfAllSearchTests ) {
        $ChangeIDForSearchTest{$TestNumber}->{ $SearchTestChange->{ChangeID} } = 1;
    }
}

my $SearchTestCount = 1;

SEARCHTEST:
for my $Test (@ChangeSearchTests) {

    # check SearchData attribute
    if ( !$Test->{SearchData} || ref( $Test->{SearchData} ) ne 'HASH' ) {
        $Self->True(
            0,
            "Test $TestCount: SearchData found for this test.",
        );

        next SEARCHTEST;
    }

    $Self->True(
        1,
        "ChangeSearch() with params: $Test->{Description} (SearchTestCase: $SearchTestCount)",
    );

    # get a ref to an array of found ids
    my $ChangeIDs = $ChangeObject->ChangeSearch(
        %{ $Test->{SearchData} },
        Result => 'ARRAY',
        UserID => 1,
    );

    # get a count of found ids
    my $CountChangeIDs = $ChangeObject->ChangeSearch(
        %{ $Test->{SearchData} },
        Result => 'COUNT',
        UserID => 1,
    );

    if ( $Test->{SearchFails} ) {
        $Self->True(
            !defined($ChangeIDs),
            "Test $TestCount: ChangeSearch() is expected to fail (Result => 'ARRAY')",
        );
        $Self->True(
            !defined($CountChangeIDs),
            "Test $TestCount: ChangeSearch() is expected to fail (Result => 'COUNT')",
        );
    }
    else {
        $Self->True(
            defined($ChangeIDs) && ref $ChangeIDs eq 'ARRAY',
            "Test $TestCount: |- array reference for ChangeIDs.",
        );
        $Self->True(
            defined($CountChangeIDs) && ref $CountChangeIDs eq '',
            "Test $TestCount: |- scalar for CountChangeIDs.",
        );
    }

    $ChangeIDs ||= [];
    $CountChangeIDs ||= 0;

    if ( $Test->{ResultData}->{TestCount} ) {

        # get number of change ids ChangeSearch should return
        my $ExpectedCount = scalar keys %{ $ChangeIDForSearchTest{$SearchTestCount} };

        # get defined expected result count (defined in search test case!)
        if ( exists $Test->{ResultData}->{Count} ) {
            $ExpectedCount = $Test->{ResultData}->{Count}
        }

        # check the number of IDs in the returned arrayref
        $Self->Is(
            scalar @{$ChangeIDs},
            $ExpectedCount,
            "Test $TestCount: |- Number of found changes (Result => 'ARRAY').",
        );

        # When a 'Limit' has been passed, then the returned count not necessarily matches
        # the number of IDs in the returned array. In that case testing is futile.
        if ( !$Test->{SearchData}->{Limit} ) {
            $Self->Is(
                $CountChangeIDs,
                $ExpectedCount,
                "Test $TestCount: |- Number of found changes (Result => 'COUNT').",
            );
        }
    }

    if ( $Test->{ResultData}->{TestExistence} ) {

        # check if all ids that belongs to this searchtest are returned
        my @ChangeIDs = keys %{ $ChangeIDForSearchTest{$SearchTestCount} };
        my %ReturnedChangeID = map { $_ => 1 } @{$ChangeIDs};
        for my $ChangeID (@ChangeIDs) {
            $Self->True(
                $ReturnedChangeID{$ChangeID},
                "Test $TestCount: |- ChangeID $ChangeID found in returned list.",
            );
        }
    }
}
continue {
    $TestCount++;
    $SearchTestCount++;
}

# ------------------------------------------------------------ #
# define change search tests for 'OrderBy' searches
# ------------------------------------------------------------ #

# get three change ids. Then get the data. That is needed for sorting
my @OrderBySearchTestChangeIDs = @{ $Label2ChangeIDs{OrderBySearchTest} };
my @OrderBySearchTestChanges;

for my $ChangeIDForOrderByTests (@OrderBySearchTestChangeIDs) {
    my $ChangeData = $ChangeObject->ChangeGet(
        ChangeID => $ChangeIDForOrderByTests,
        UserID   => 1,
    );

    # convert time string to numbers - that's better for the comparisons
    for my $TimeColumn (qw(CreateTime ChangeTime)) {
        $ChangeData->{$TimeColumn} =~ s{ \D }{}xmsg;
    }

    push @OrderBySearchTestChanges, $ChangeData;
}

my @OrderByColumns = qw(
    ChangeID
    ChangeNumber
    ChangeTitle
    ChangeStateID
    ChangeManagerID
    ChangeBuilderID
    CreateBy
    ChangeBy
    CreateTime
    ChangeTime
    PlannedStartTime
    PlannedEndTime
    ActualStartTime
    ActualEndTime
);

for my $OrderByColumn (@OrderByColumns) {

    # turn off all pretty print
    local $Data::Dumper::Indent = 0;
    local $Data::Dumper::Useqq  = 1;

    my @SortedChanges;
    if ( $OrderByColumn =~ m{ \A ( ChangeTitle | .+ Time ) \z }xms ) {
        @SortedChanges = sort {
            $a->{$OrderByColumn} cmp $b->{$OrderByColumn}
                || $b->{ChangeID} <=> $a->{ChangeID}
        } @OrderBySearchTestChanges;
    }
    else {
        @SortedChanges = sort {
            $a->{$OrderByColumn} <=> $b->{$OrderByColumn}
                || $b->{ChangeID} <=> $a->{ChangeID}
        } @OrderBySearchTestChanges;
    }
    my @SortedIDs = map { $_->{ChangeID} } @SortedChanges;

    # dump the reference attribute
    my $ReferenceList = Data::Dumper::Dumper( \@SortedIDs );    ## no critic

    my $SearchResult = $ChangeObject->ChangeSearch(
        ChangeTitle      => 'OrderByChange - Title - ' . $UniqueSignature,
        OrderBy          => [$OrderByColumn],
        OrderByDirection => ['Up'],
        UserID           => 1,
    );

    # dump the attribute from ChangeGet()
    my $SearchList = Data::Dumper::Dumper($SearchResult);       ## no critic

    $Self->Is(
        $SearchList,
        $ReferenceList,
        'Test ' . $TestCount++ . ": ChangeSearch() OrderBy $OrderByColumn (Up)."
    );

    my @SortedChangesDown;
    if ( $OrderByColumn =~ m{ \A ( ChangeTitle | .+ Time ) \z }xms ) {
        @SortedChangesDown = sort {
            $b->{$OrderByColumn} cmp $a->{$OrderByColumn}
                || $b->{ChangeID} <=> $a->{ChangeID}
        } @OrderBySearchTestChanges;
    }
    else {
        @SortedChangesDown = sort {
            $b->{$OrderByColumn} <=> $a->{$OrderByColumn}
                || $b->{ChangeID} <=> $a->{ChangeID}
        } @OrderBySearchTestChanges;
    }
    my @SortedIDsDown = map { $_->{ChangeID} } @SortedChangesDown;

    # dump the reference attribute
    my $ReferenceListDown = Data::Dumper::Dumper( \@SortedIDsDown );    ## no critic

    my $SearchResultDown = $ChangeObject->ChangeSearch(
        ChangeTitle => 'OrderByChange - Title - ' . $UniqueSignature,
        OrderBy     => [$OrderByColumn],
        UserID      => 1,
    );

    # dump the attribute from ChangeGet()
    my $SearchListDown = Data::Dumper::Dumper($SearchResultDown);       ## no critic

    $Self->Is(
        $SearchListDown,
        $ReferenceListDown,
        'Test ' . $TestCount++ . ": ChangeSearch() OrderBy $OrderByColumn (Down)."
    );

    # check if ITSMChange.pm handles non-existent OrderByDirection criteria correct
    my $SearchResultSideways = $ChangeObject->ChangeSearch(
        ChangeTitle      => 'OrderByChange - Title - ' . $UniqueSignature,
        OrderBy          => [$OrderByColumn],
        OrderByDirection => ['Sideways'],
        UserID           => 1,
    );

    $Self->Is(
        $SearchResultSideways,
        undef,
        'Test ' . $TestCount++ . ": ChangeSearch() OrderBy $OrderByColumn (Sideways)."
    );
}

# create an extra block, in order to limit scope of lexicals
{

    # check for 'OrderBy' with non-existent column
    my $SearchResultFooBarColumn = $ChangeObject->ChangeSearch(
        ChangeTitle => 'OrderByChange - Title - ' . $UniqueSignature,
        OrderBy     => ['FooBar'],
        UserID      => 1,
    );

    $Self->Is(
        $SearchResultFooBarColumn,
        undef,
        'Test ' . $TestCount++ . ": ChangeSearch() OrderBy FooBar (Down)."
    );

    # check for 'OrderBy' with non-existent column
    my $SearchResultFooBarColumnDirection = $ChangeObject->ChangeSearch(
        ChangeTitle      => 'OrderByChange - Title - ' . $UniqueSignature,
        OrderBy          => ['FooBar'],
        OrderByDirection => ['FooBar'],
        UserID           => 1,
    );

    $Self->Is(
        $SearchResultFooBarColumnDirection,
        undef,
        'Test ' . $TestCount++ . ": ChangeSearch() OrderBy FooBar (FooBar)."
    );

    # check for 'OrderBy' with non-existent column
    my $SearchResultFooBarDoubleColumn = $ChangeObject->ChangeSearch(
        ChangeTitle => 'OrderByChange - Title - ' . $UniqueSignature,
        OrderBy     => [ 'ChangeID', 'ChangeID' ],
        UserID      => 1,
    );

    $Self->Is(
        $SearchResultFooBarDoubleColumn,
        undef,
        'Test ' . $TestCount++ . ": ChangeSearch() Doubled OrderBy FooBar."
    );
}

# change the create time for the second test case we defined above for the orderby tests
# we do this to have two changes with the same create time. this is needed to test
# the 'orderby' with two columns
SetTimes(
    ChangeID   => ( sort @OrderBySearchTestChangeIDs )[1],
    CreateTime => '2009-10-01 01:00:00',
);

my @ChangesForSecondOrderByTests;
for my $ChangeIDForSecondOrderByTests (@OrderBySearchTestChangeIDs) {
    my $ChangeData = $ChangeObject->ChangeGet(
        ChangeID => $ChangeIDForSecondOrderByTests,
        UserID   => 1,
    );

    # convert time string to numbers - that's better for the comparisons
    for my $TimeColumn (qw(CreateTime ChangeTime)) {
        $ChangeData->{$TimeColumn} =~ s{ \D }{}xmsg;
    }

    push @ChangesForSecondOrderByTests, $ChangeData;
}

# create an extra block as we use "local"
{
    my @SortedChanges = sort {
        $a->{CreateTime} <=> $b->{CreateTime}       # createtime is sorted ascending
            || $a->{ChangeID} <=> $b->{ChangeID}    # changeid is sorted ascending
    } @ChangesForSecondOrderByTests;
    my @SortedIDs = map { $_->{ChangeID} } @SortedChanges;

    # turn off all pretty print
    local $Data::Dumper::Indent = 0;
    local $Data::Dumper::Useqq  = 1;

    my $SearchResult = $ChangeObject->ChangeSearch(
        ChangeTitle      => 'OrderByChange - Title - ' . $UniqueSignature,
        OrderBy          => [ 'CreateTime', 'ChangeID' ],
        OrderByDirection => [ 'Up', 'Up' ],
        UserID           => 1,
    );

    # dump the attribute from ChangeGet()
    my $SearchList = Data::Dumper::Dumper($SearchResult);    ## no critic

    # dump the reference attribute
    my $ReferenceList = Data::Dumper::Dumper( \@SortedIDs );    ## no critic

    $Self->Is(
        $SearchList,
        $ReferenceList,
        'Test ' . $TestCount++ . ": ChangeSearch() OrderBy CreateTime (Down) and ChangeID (Up)."
    );
}

# ------------------------------------------------------------ #
# advanced search by tests for times
# ------------------------------------------------------------ #
my $TSTChangeTitle = 'TimeSearchTest - Title - ' . $UniqueSignature;
my @TSTChangeIDs;
my @TimeSearchTests = (
    {
        Description => 'Insert change with one workorder in the 19th century.',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle => $TSTChangeTitle,
                UserID      => 1,
            },
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
        Description => 'Insert change with one workorder in the 19th century.',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle => $TSTChangeTitle,
                UserID      => 1,
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
        Description => 'Insert change with one workorder in the 19th century.',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle => $TSTChangeTitle,
                UserID      => 1,
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
        Description => 'Insert change with one workorder in the 19th century.',
        SourceData  => {
            ChangeAdd => {
                ChangeTitle => $TSTChangeTitle,
                UserID      => 1,
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
            ChangeSearch => {
                ChangeTitle               => $TSTChangeTitle,
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
            ChangeSearch => {
                ChangeTitle               => $TSTChangeTitle,
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
            ChangeSearch => {
                ChangeTitle               => $TSTChangeTitle,
                UserID                    => 1,
                PlannedStartTimeNewerDate => '1909-02-01 00:00:00',
            },
        },
        ReferenceData => [ 2, 3, ],
    },
    {
        Description => 'Search for PlannedStartTimeNewerDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle               => $TSTChangeTitle,
                UserID                    => 1,
                PlannedStartTimeNewerDate => '1909-12-01 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for PlannedStartTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle               => $TSTChangeTitle,
                UserID                    => 1,
                PlannedStartTimeOlderDate => '1909-01-10 00:00:00',
            },
        },
        ReferenceData => [ 0, 1, ],
    },
    {
        Description => 'Search for PlannedStartTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle               => $TSTChangeTitle,
                UserID                    => 1,
                PlannedStartTimeOlderDate => '1908-01-31 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for PlannedStartTimeNewerDate and PlannedStartTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle               => $TSTChangeTitle,
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
            ChangeSearch => {
                ChangeTitle             => $TSTChangeTitle,
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
            ChangeSearch => {
                ChangeTitle             => $TSTChangeTitle,
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
            ChangeSearch => {
                ChangeTitle             => $TSTChangeTitle,
                UserID                  => 1,
                PlannedEndTimeNewerDate => '1909-02-27 00:00:00',
            },
        },
        ReferenceData => [ 2, 3, ],
    },
    {
        Description => 'Search for PlannedEndTimeNewerDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle             => $TSTChangeTitle,
                UserID                  => 1,
                PlannedEndTimeNewerDate => '1909-05-01 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for PlannedEndTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle             => $TSTChangeTitle,
                UserID                  => 1,
                PlannedEndTimeOlderDate => '1909-01-25 00:00:00',
            },
        },
        ReferenceData => [ 1, ],
    },
    {
        Description => 'Search for PlannedEndTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle             => $TSTChangeTitle,
                UserID                  => 1,
                PlannedEndTimeOlderDate => '1908-01-31 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for PlannedEndTimeNewerDate and PlannedEndTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle             => $TSTChangeTitle,
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
            ChangeSearch => {
                ChangeTitle              => $TSTChangeTitle,
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
            ChangeSearch => {
                ChangeTitle              => $TSTChangeTitle,
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
            ChangeSearch => {
                ChangeTitle              => $TSTChangeTitle,
                UserID                   => 1,
                ActualStartTimeNewerDate => '1909-02-01 00:00:00',
            },
        },
        ReferenceData => [ 2, 3, ],
    },
    {
        Description => 'Search for ActualStartTimeNewerDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle              => $TSTChangeTitle,
                UserID                   => 1,
                ActualStartTimeNewerDate => '1909-12-30 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for ActualStartTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle              => $TSTChangeTitle,
                UserID                   => 1,
                ActualStartTimeOlderDate => '1909-01-12 00:00:00',
            },
        },
        ReferenceData => [ 0, 1, ],
    },
    {
        Description => 'Search for ActualStartTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle              => $TSTChangeTitle,
                UserID                   => 1,
                ActualStartTimeOlderDate => '1908-01-31 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for ActualStartTimeNewerDate and ActualStartTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle              => $TSTChangeTitle,
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
            ChangeSearch => {
                ChangeTitle            => $TSTChangeTitle,
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
            ChangeSearch => {
                ChangeTitle            => $TSTChangeTitle,
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
            ChangeSearch => {
                ChangeTitle            => $TSTChangeTitle,
                UserID                 => 1,
                ActualEndTimeNewerDate => '1909-02-26 00:00:00',
            },
        },
        ReferenceData => [ 2, 3, ],
    },
    {
        Description => 'Search for ActualEndTimeNewerDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle            => $TSTChangeTitle,
                UserID                 => 1,
                ActualEndTimeNewerDate => '1909-12-01 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for ActualEndTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle            => $TSTChangeTitle,
                UserID                 => 1,
                ActualEndTimeOlderDate => '1909-01-29 00:00:00',
            },
        },
        ReferenceData => [ 0, 1, ],
    },
    {
        Description => 'Search for ActualEndTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle            => $TSTChangeTitle,
                UserID                 => 1,
                ActualEndTimeOlderDate => '1908-12-01 00:00:00',
            },
        },
        ReferenceData => [],
    },
    {
        Description => 'Search for ActualEndTimeNewerDate and ActualEndTimeOlderDate.',
        SourceData  => {
            ChangeSearch => {
                ChangeTitle            => $TSTChangeTitle,
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
for my $Test (@TimeSearchTests) {
    my $SourceData    = $Test->{SourceData};
    my $ReferenceData = $Test->{ReferenceData};

    my $ChangeID;
    my $WorkOrderID;

    $Self->True(
        1,
        "Test $TestCount: $Test->{Description} (TSTest case: $TSTCounter)",
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
            push @TSTChangeIDs, $ChangeID;
        }
    }

    if ( $SourceData->{WorkOrderAdd} ) {
        $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
            %{ $SourceData->{WorkOrderAdd} },
            ChangeID => $ChangeID,
        );

        $Self->True(
            $WorkOrderID,
            "Test $TestCount: |- WorkOrderAdd",
        );

        push @TSTWorkOrderIDs, $WorkOrderID;
    }

    my $SearchResult;
    if ( $SourceData->{ChangeSearch} ) {
        $SearchResult = $ChangeObject->ChangeSearch(
            %{ $SourceData->{ChangeSearch} },
        );

        $Self->True(
            $SearchResult && ref $SearchResult eq 'ARRAY',
            "Test $TestCount: ChangeSearch() - List is an array reference.",
        );

        next TSTEST if !$SearchResult;

        # check number of founded change
        $Self->Is(
            scalar @{$SearchResult},
            scalar @{$ReferenceData},
            "Test $TestCount: ChangeSearch() - correct number of found changes",
        );

        # map array index to ChangeID
        my @ResultChangeIDs;
        for my $ResultChangeID ( @{$ReferenceData} ) {
            push @ResultChangeIDs, $TSTChangeIDs[$ResultChangeID];
        }

        # turn off all pretty print
        local $Data::Dumper::Indent = 0;
        local $Data::Dumper::Useqq  = 1;

        # dump the attribute from ChangeSearch() and the reference attribute
        ## no critic
        my $SearchResultDump = Data::Dumper::Dumper( sort @{$SearchResult} );
        my $ReferenceDump    = Data::Dumper::Dumper( sort @ResultChangeIDs );
        ## use critic

        $Self->Is(
            $SearchResultDump,
            $ReferenceDump,
            "Test $TestCount: |- ChangeSearch(): "
                . Data::Dumper::Dumper( $SourceData->{ChangeSearch} )    ## no critic
                . $SearchResultDump,
        );
    }

    $TestCount++;
    $TSTCounter++;
}

# ------------------------------------------------------------ #
# 'OrderBy' tests for CIP columns
# ------------------------------------------------------------ #

# get three change ids. Then get the data. That is needed for sorting
my @OrderByCIPChangeIDs = @{ $Label2ChangeIDs{OrderByCIPTests} };
my @OrderByCIPChanges;

for my $ChangeIDForOrderByCIPTests (@OrderByCIPChangeIDs) {
    my $ChangeData = $ChangeObject->ChangeGet(
        ChangeID => $ChangeIDForOrderByCIPTests,
        UserID   => 1,
    );

    push @OrderByCIPChanges, $ChangeData;
}

my @OrderByCIPColumns = qw(
    CategoryID
    ImpactID
    PriorityID
);

for my $CIPColumn (@OrderByCIPColumns) {

    # turn off all pretty print
    local $Data::Dumper::Indent = 0;
    local $Data::Dumper::Useqq  = 1;

    my @SortedChanges = sort {
        $a->{$CIPColumn} <=> $b->{$CIPColumn}
            || $b->{ChangeID} <=> $a->{ChangeID}
    } @OrderByCIPChanges;

    my @SortedIDs = map { $_->{ChangeID} } @SortedChanges;

    # dump the reference attribute
    my $ReferenceList = Data::Dumper::Dumper( \@SortedIDs );    ## no critic

    my $SearchResult = $ChangeObject->ChangeSearch(
        ChangeTitle      => '%CIP%' . $UniqueSignature,
        OrderBy          => [$CIPColumn],
        OrderByDirection => ['Up'],
        UserID           => 1,
    );

    # dump the attribute from ChangeGet()
    my $SearchList = Data::Dumper::Dumper($SearchResult);       ## no critic

    $Self->Is(
        $SearchList,
        $ReferenceList,
        'Test ' . $TestCount++ . ": ChangeSearch() OrderBy $CIPColumn (Up)."
    );

    my @SortedChangesDown = sort {
        $b->{$CIPColumn} <=> $a->{$CIPColumn}
            || $b->{ChangeID} <=> $a->{ChangeID}
    } @OrderByCIPChanges;

    my @SortedIDsDown = map { $_->{ChangeID} } @SortedChangesDown;

    # dump the reference attribute
    my $ReferenceListDown = Data::Dumper::Dumper( \@SortedIDsDown );    ## no critic

    my $SearchResultDown = $ChangeObject->ChangeSearch(
        ChangeTitle => '%CIP%' . $UniqueSignature,
        OrderBy     => [$CIPColumn],
        UserID      => 1,
    );

    # dump the attribute from ChangeGet()
    my $SearchListDown = Data::Dumper::Dumper($SearchResultDown);       ## no critic

    $Self->Is(
        $SearchListDown,
        $ReferenceListDown,
        'Test ' . $TestCount++ . ": ChangeSearch() OrderBy $CIPColumn (Down)."
    );

    # check if ITSMChange.pm handles non-existent OrderByDirection criteria correct
    my $SearchResultSideways = $ChangeObject->ChangeSearch(
        ChangeTitle      => '%CIP%' . $UniqueSignature,
        OrderBy          => [$CIPColumn],
        OrderByDirection => ['Sideways'],
        UserID           => 1,
    );

    $Self->Is(
        $SearchResultSideways,
        undef,
        'Test ' . $TestCount++ . ": ChangeSearch() OrderBy $CIPColumn (Sideways)."
    );
}

# ------------------------------------------------------------ #
# advanced search by tests for workorder strings and agent id
# ------------------------------------------------------------ #
my @WOStringAndAgentSearchTests = (

    {
        Description => 'Insert change with one workorder and with set string fields.',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID           => 1,
                WorkOrderTitle   => 'String Test 1 - Title - ' . $UniqueSignature,
                Instruction      => 'String Test 1 - Instruction - ' . $UniqueSignature,
                Report           => 'String Test 1 - Report - ' . $UniqueSignature,
                WorkOrderAgentID => $UserIDs[1],
            },
        },
    },

    {
        Description => 'Search for WorkOrderTitle',
        SourceData  => {
            ChangeSearch => {
                UserID         => 1,
                WorkOrderTitle => 'String Test 1 - Title - ' . $UniqueSignature,
            },
        },
        ReferenceData => [0],
    },

    {
        Description => 'Search for non-existing WorkOrderTitle',
        SourceData  => {
            ChangeSearch => {
                UserID         => 1,
                WorkOrderTitle => 'NONEXISTENT String Test 1 - Title - ' . $UniqueSignature,
            },
        },
        ReferenceData => [],
    },

    {
        Description => 'Search for WorkOrder Instruction',
        SourceData  => {
            ChangeSearch => {
                UserID               => 1,
                WorkOrderInstruction => 'String Test 1 - Instruction - ' . $UniqueSignature,
            },
        },
        ReferenceData => [0],
    },

    {
        Description => 'Search for non-existing WorkOrder Instruction',
        SourceData  => {
            ChangeSearch => {
                UserID               => 1,
                WorkOrderInstruction => 'NONEXISTENT String Test 1 - Instruction - '
                    . $UniqueSignature,
            },
        },
        ReferenceData => [],
    },

    {
        Description => 'Search for WorkOrder Report',
        SourceData  => {
            ChangeSearch => {
                UserID          => 1,
                WorkOrderReport => 'String Test 1 - Report - ' . $UniqueSignature,
            },
        },
        ReferenceData => [0],
    },

    {
        Description => 'Search for non-existing WorkOrder Report',
        SourceData  => {
            ChangeSearch => {
                UserID          => 1,
                WorkOrderReport => 'NONEXISTENT String Test 1 - Report - ' . $UniqueSignature,
            },
        },
        ReferenceData => [],
    },

    {
        Description => 'Search for existing WorkOrderAgentID',
        SourceData  => {
            ChangeSearch => {
                UserID            => 1,
                WorkOrderAgentIDs => [ $UserIDs[1] ],
            },
        },
        ReferenceData => [0],
    },

    {
        Description => 'Search for existing and non-existing WorkOrderAgentID',
        SourceData  => {
            ChangeSearch => {
                UserID            => 1,
                WorkOrderAgentIDs => [ @UserIDs[ 0, 1 ] ],
            },
        },
        ReferenceData => [0],
    },

    {
        Description => 'Search for non-existing WorkOrderAgentID',
        SourceData  => {
            ChangeSearch => {
                UserID            => 1,
                WorkOrderAgentIDs => [ $UserIDs[0] ],
            },
        },
        ReferenceData => [],
    },
);

my $WOSTCounter = 1;
my @WOSTChangeIDs;       # search in workorder test change ids
my @WOSTWorkOrderIDs;    # search in workorder test workorder ids
WOSTEST:
for my $Test (@WOStringAndAgentSearchTests) {
    my $SourceData    = $Test->{SourceData};
    my $ReferenceData = $Test->{ReferenceData};

    my $ChangeID;
    my $WorkOrderID;

    $Self->True(
        1,
        "Test $TestCount: $Test->{Description} (WOSTest case: $WOSTCounter)",
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
            push @WOSTChangeIDs, $ChangeID;
        }
    }

    if ( $SourceData->{WorkOrderAdd} ) {
        $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
            %{ $SourceData->{WorkOrderAdd} },
            ChangeID => $ChangeID,
        );

        $Self->True(
            $WorkOrderID,
            "Test $TestCount: |- WorkOrderAdd",
        );

        push @WOSTWorkOrderIDs, $WorkOrderID;
    }

    my $SearchResult;
    if ( $SourceData->{ChangeSearch} ) {
        $SearchResult = $ChangeObject->ChangeSearch(
            %{ $SourceData->{ChangeSearch} },
        );

        $Self->True(
            $SearchResult && ref $SearchResult eq 'ARRAY',
            "Test $TestCount: ChangeSearch() - List is an array reference.",
        );

        next WOSTEST if !$SearchResult;

        # check number of found changes
        $Self->Is(
            scalar @{$SearchResult},
            scalar @{$ReferenceData},
            "Test $TestCount: ChangeSearch() - correct number of found changes",
        );

        # map array index to ChangeID
        my @ResultChangeIDs;
        for my $ResultChangeID ( @{$ReferenceData} ) {
            push @ResultChangeIDs, $WOSTChangeIDs[$ResultChangeID];
        }

        # turn off all pretty print
        local $Data::Dumper::Indent = 0;
        local $Data::Dumper::Useqq  = 1;

        # dump the attribute from ChangeSearch()
        my $SearchResultDump = Data::Dumper::Dumper( sort @{$SearchResult} );    ## no critic

        # dump the reference attribute
        my $ReferenceDump = Data::Dumper::Dumper( sort @ResultChangeIDs );       ## no critic

        $Self->Is(
            $SearchResultDump,
            $ReferenceDump,
            "Test $TestCount: |- ChangeSearch(): "
                . Data::Dumper::Dumper( $SourceData->{ChangeSearch} )            ## no critic
                . $SearchResultDump,
        );
    }

    $TestCount++;
    $WOSTCounter++;
}

# each of the changes should have one workorder
for my $ChangeID (@WOSTChangeIDs) {
    my $ChangeData = $ChangeObject->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => 1,
    );
    $Self->Is(
        $ChangeData->{WorkOrderCount},
        1,
        "Test $TestCount: |- ChangeGet(): one workorder was added"
    );
}

# ------------------------------------------------------------ #
# advanced search by tests for workorder strings and agent id
# ------------------------------------------------------------ #
# get item list of the workorder states with swapped keys and values
my %WorkOrderStateID2Name = %{
    $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ChangeManagement::WorkOrder::State',
        ) || {}
};
my %WorkOrderStateName2ID = reverse %WorkOrderStateID2Name;

my @WOStateTests = (

    {
        Description => 'Insert change with one workorder and with WorkOrderState set.',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID           => 1,
                WorkOrderTitle   => 'WorkOrderStateID in ChangeSearch - Title - ' . $UniqueSignature,
                WorkOrderStateID => $WorkOrderStateName2ID{ready},
            },
            ChangeSearch => {
                UserID            => 1,
                WorkOrderTitle    => 'WorkOrderStateID in ChangeSearch - Title - ' . $UniqueSignature,
                WorkOrderStateIDs => [ $WorkOrderStateName2ID{ready} ],
            },
        },
        ReferenceData => [1],
    },

    {
        Description => 'Insert change with one workorder and with WorkOrderState set.',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID           => 1,
                WorkOrderTitle   => 'WorkOrderStateID in ChangeSearch - Title - ' . $UniqueSignature,
                WorkOrderStateID => $WorkOrderStateName2ID{canceled},
            },
            ChangeSearch => {
                UserID            => 1,
                WorkOrderTitle    => 'WorkOrderStateID in ChangeSearch - Title - ' . $UniqueSignature,
                WorkOrderStateIDs => [ $WorkOrderStateName2ID{canceled} ],
            },
        },
        ReferenceData => [2],
    },

    {
        Description => 'Insert change with one workorder and with WorkOrderState set.',
        SourceData  => {
            ChangeAdd => {
                UserID => 1,
            },
            WorkOrderAdd => {
                UserID           => 1,
                WorkOrderTitle   => 'WorkOrderStateID in ChangeSearch - Title - ' . $UniqueSignature,
                WorkOrderStateID => $WorkOrderStateName2ID{closed},
            },
            ChangeSearch => {
                UserID          => 1,
                WorkOrderTitle  => 'WorkOrderStateID in ChangeSearch - Title - ' . $UniqueSignature,
                WorkOrderStates => [ 'ready', 'closed' ],
            },
        },
        ReferenceData => [ 1, 3 ],
    },
);

my $WOStateTestCounter = 1;
my @WOStateTestChangeIDs;       # search in workorder test change ids
my @WOStateTestWorkOrderIDs;    # search in workorder test workorder ids
my %WorkOrderStateTestMap;

WOSTATETEST:
for my $WorkOrderStateTest (@WOStateTests) {
    my $SourceData = $WorkOrderStateTest->{SourceData};
    my $ReferenceData = $WorkOrderStateTest->{ReferenceData} || [];

    my $ChangeID;
    my $WorkOrderID;

    $Self->True(
        1,
        "Test $TestCount: $WorkOrderStateTest->{Description} (WOStateTest case: $WOStateTestCounter)",
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
            push @WOStateTestChangeIDs, $ChangeID;
            $WorkOrderStateTestMap{$WOStateTestCounter} = $ChangeID;
        }
    }

    if ( $SourceData->{WorkOrderAdd} ) {
        $WorkOrderID = $WorkOrderObject->WorkOrderAdd(
            %{ $SourceData->{WorkOrderAdd} },
            ChangeID => $ChangeID,
        );

        $Self->True(
            $WorkOrderID,
            "Test $TestCount: |- WorkOrderAdd",
        );

        push @WOStateTestWorkOrderIDs, $WorkOrderID;
    }

    my $SearchResult;
    if ( $SourceData->{ChangeSearch} ) {
        $SearchResult = $ChangeObject->ChangeSearch(
            %{ $SourceData->{ChangeSearch} },
        );

        $Self->True(
            $SearchResult && ref $SearchResult eq 'ARRAY',
            "Test $TestCount: ChangeSearch() - List is an array reference.",
        );

        next WOSTATETEST if !$SearchResult;

        # check number of found changes
        $Self->Is(
            scalar @{$SearchResult},
            scalar @{$ReferenceData},
            "Test $TestCount: ChangeSearch() - correct number of found changes",
        );

        # save returned ids in hash for easier checks
        my %ResultIDs = map { $_ => 1 } @{$SearchResult};

        # check returned ChangeIDs
        for my $TestNr ( @{$ReferenceData} ) {
            my $ChangeID = $WorkOrderStateTestMap{$TestNr};
            $Self->True(
                $ResultIDs{$ChangeID},
                "Test $TestCount: ChangeSearch() - $ChangeID (from test $TestNr) in result set found",
            );
        }

    }

    $TestCount++;
    $WOStateTestCounter++;
}

# each of the changes should have one workorder
for my $ChangeID (@WOStateTestChangeIDs) {
    my $ChangeData = $ChangeObject->ChangeGet(
        ChangeID => $ChangeID,
        UserID   => 1,
    );
    $Self->Is(
        $ChangeData->{WorkOrderCount},
        1,
        "Test $TestCount: |- ChangeGet(): one workorder was added"
    );
}

# ------------------------------------------------------------ #
# testing the method Permission()
# ------------------------------------------------------------ #

my ($PermissionTestChangeID) = @{ $Label2ChangeIDs{PermissionTest} };
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
    {

        # The type 'rw' implies all other types. See Kernel::System::Group_GetTypeString()
        # Therefore User1 effectively has 'ro' in 'itsm-change' and
        # the ChangeAgentCheck Permission module gives 'ro' access.
        # Note that the ChangeAgentCheck Permission module never gives 'rw' access.
        Description => 'rw in itsm-change only grants ro',
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

    # Permission test No. 4
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

    # Permission test No. 5
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

    # Permission test No. 6
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

    # Permission test No. 7
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

    # Permission test No. 8
    {
        Description => 'ro in itsm-change-builder, user 1 is not the builder',
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

    # Permission test No. 9
    {
        Description => 'rw in itsm-change-builder, user 1 is not the builder',
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
        $Self->True( $Success, "Permission test $PermissionTestCounter: GroupMemberAdd()", );
    }

    # check the result
    if ( $ReferenceData->{Permissions} ) {
        for my $UserIndex ( sort keys %{ $ReferenceData->{Permissions} } ) {
            my $Privs = $ReferenceData->{Permissions}->{$UserIndex};
            for my $Type ( sort keys %{$Privs} ) {
                $ChangeObject->{Debug} = 10;
                my $Access = $ChangeObject->Permission(
                    Type     => $Type,
                    ChangeID => $PermissionTestChangeID,
                    UserID   => $UserIDs[$UserIndex],
                    Cached   => 0,
                );
                if ( $Privs->{$Type} ) {
                    $Self->True(
                        $Access,
                        "Permission test $PermissionTestCounter: User $UserIndex, with UserUD $UserIDs[$UserIndex], has $Type access",
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
# testing the method ChangePossibleStatesGet()
# ------------------------------------------------------------ #

my ($PossibleStatesTestChangeID) = @{ $Label2ChangeIDs{PossibleStatesTest} };

# When no ChangeID is given ChangePossibleStatesGet() returns a list of all states.
my $PossibleStates = $ChangeObject->ChangePossibleStatesGet(

    #    ChangeID => $PossibleStatesTestChangeID,
    UserID => 1,
) || {};

# do the checks
my @PossibleStateIDsReference = @SortedChangeStateIDs;
for my $PossibleStateID (@PossibleStateIDsReference) {
    my ( $FirstHashRef, $SecondHashRef ) = grep { $_->{Key} == $PossibleStateID } @{$PossibleStates};

    # a match is expected
    $Self->True(
        $FirstHashRef,
        "Check for possible state id $PossibleStateID",
    );

    # the name should also match
    $FirstHashRef ||= {};
    my $PossibleStateName = $ChangeStateID2Name{$PossibleStateID};
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

# ------------------------------------------------------------ #
# testing the method ChangePossibleStatesGet() with ChangeID argument
# ------------------------------------------------------------ #

# Set the default values...
my $TestNumber = 0;

my @PossibleStatesForRequested = (
    'requested',
    'in progress',
    'pending approval',
    'rejected',
    'retracted',
);

my @PossibleStatesForPendigApproval = (
    'pending approval',
    'approved',
    'rejected',
    'retracted',
);

my @PossibleStatesForApproved = (
    'approved',
    'retracted',
    'in progress',
);

my @PossibleStatesForInProgress = (
    'in progress',
    'canceled',
    'failed',
    'pending pir',
    'retracted',
    'successful',
);

# Test logic starts...

# Create a change object...
my $ChangeIDForChangePossibleStateGet = $ChangeObject->ChangeAdd(
    UserID => 1,
);

# Get posssible states...
my $PossibleStatesUsingChangeID = $ChangeObject->ChangePossibleStatesGet(
    ChangeID => $ChangeIDForChangePossibleStateGet,
    UserID   => 1,
);

$TestNumber++;

_TestPossibleStates(
    State                 => 'Requested',
    PossibleStates        => $PossibleStatesUsingChangeID,
    PossibleDefaultStates => \@PossibleStatesForRequested,
    TestNumber            => $TestNumber,
);

# Change the state
my $ChangeUpdateSuccess = $ChangeObject->ChangeUpdate(
    ChangeID    => $ChangeIDForChangePossibleStateGet,
    ChangeState => 'pending approval',
    UserID      => 1,
);

$TestNumber++;

$Self->True(
    $ChangeUpdateSuccess,
    "Test $TestNumber State change"
);

# Get posssible states...
$PossibleStatesUsingChangeID = $ChangeObject->ChangePossibleStatesGet(
    ChangeID => $ChangeIDForChangePossibleStateGet,
    UserID   => 1,
);

_TestPossibleStates(
    State                 => 'Approved',
    PossibleStates        => $PossibleStatesUsingChangeID,
    PossibleDefaultStates => \@PossibleStatesForPendigApproval,
    TestNumber            => $TestNumber,
);

# Change the state
$ChangeUpdateSuccess = $ChangeObject->ChangeUpdate(
    ChangeID    => $ChangeIDForChangePossibleStateGet,
    ChangeState => 'approved',
    UserID      => 1,
);

$TestNumber++;

$Self->True(
    $ChangeUpdateSuccess,
    "Test $TestNumber State change"
);

# Get posssible states...
$PossibleStatesUsingChangeID = $ChangeObject->ChangePossibleStatesGet(
    ChangeID => $ChangeIDForChangePossibleStateGet,
    UserID   => 1,
);

_TestPossibleStates(
    State                 => 'Approved',
    PossibleStates        => $PossibleStatesUsingChangeID,
    PossibleDefaultStates => \@PossibleStatesForApproved,
    TestNumber            => $TestNumber,
);

# Change the state
$ChangeUpdateSuccess = $ChangeObject->ChangeUpdate(
    ChangeID    => $ChangeIDForChangePossibleStateGet,
    ChangeState => 'in progress',
    UserID      => 1,
);

$TestNumber++;

$Self->True(
    $ChangeUpdateSuccess,
    "Test $TestNumber State change"
);

# Get posssible states...
$PossibleStatesUsingChangeID = $ChangeObject->ChangePossibleStatesGet(
    ChangeID => $ChangeIDForChangePossibleStateGet,
    UserID   => 1,
);

_TestPossibleStates(
    State                 => 'In Progress',
    PossibleStates        => $PossibleStatesUsingChangeID,
    PossibleDefaultStates => \@PossibleStatesForInProgress,
    TestNumber            => $TestNumber,
);

# Delete the Change
$ChangeObject->ChangeDelete(
    ChangeID => $ChangeIDForChangePossibleStateGet,
    UserID   => 1,
);

# ------------------------------------------------------------ #
# CIP allocate tests
# ------------------------------------------------------------ #

# get current allocation list (UserID is needed)
my $EmptyAllocateData = $CIPAllocateObject->AllocateList();

# check the result
$Self->False(
    $EmptyAllocateData,
    'Test ' . $TestCount++ . ': AllocateList()',
);

# get current allocation list
my $CurrentAllocateData = $CIPAllocateObject->AllocateList(
    UserID => 1,
);

# check the result
$Self->True(
    $CurrentAllocateData,
    'Test ' . $TestCount++ . ': AllocateList()',
);

# check the allocation hash
my $HashIsOK = 1;
if ( ref $CurrentAllocateData ne 'HASH' ) {
    $HashIsOK = 0;
}

# check the allocation 2d hash
if ($HashIsOK) {

    IMPACTID:
    for my $ImpactID ( sort keys %{$CurrentAllocateData} ) {

        if ( ref $CurrentAllocateData->{$ImpactID} ne 'HASH' ) {
            $HashIsOK = 0;
            last IMPACTID;
        }

        CATEGORYID:
        for my $CategoryID ( sort keys %{ $CurrentAllocateData->{$ImpactID} } ) {

            if ( !$CategoryID || !$CurrentAllocateData->{$ImpactID}->{$CategoryID} ) {
                $HashIsOK = 0;
                last IMPACTID;
            }
        }
    }
}

# check HashOK
$Self->True(
    $HashIsOK,
    'Test ' . $TestCount++ . ': AllocateList()',
);

# update the allocation hash (not all needed arguments given)
my $CIPAllocationUpdated = $CIPAllocateObject->AllocateUpdate(
    UserID => 1,
);

# check the result
$Self->False(
    $CIPAllocationUpdated,
    'Test ' . $TestCount++ . ': AllocateUpdate()',
);

# update the allocation hash (not all needed arguments given)
my $CIPAllocationIsUpdated = $CIPAllocateObject->AllocateUpdate(
    AllocateData => $CurrentAllocateData,
);

# check the result
$Self->False(
    $CIPAllocationIsUpdated,
    'Test ' . $TestCount++ . ': AllocateUpdate()',
);

# update the allocation hash (allocation hash)
my $CIPAllocationIsUpdatedNrThree = $CIPAllocateObject->AllocateUpdate(
    AllocateData => {
        Test  => 'aaa',
        Test2 => 'bbb',
    },
    UserID => 1,
);

# check the result
$Self->False(
    $CIPAllocationIsUpdatedNrThree,
    'Test ' . $TestCount++ . ': AllocateUpdate()',
);

# update the allocation hash
my $Success = $CIPAllocateObject->AllocateUpdate(
    AllocateData => $CurrentAllocateData,
    UserID       => 1,
);

# check the result
$Self->True(
    $Success,
    'Test ' . $TestCount++ . ': AllocateUpdate()',
);

# ------------------------------------------------------------ #
# CIP lookup tests
# ------------------------------------------------------------ #

$LookupOk = $ChangeObject->ChangeCIPLookup(
    CIP  => '1 very high',
    Type => 'non-existent',
);

$Self->False(
    $LookupOk,
    'Invalid type passed to ChangeCIPLookup()',
);

$LookupOk = $ChangeObject->ChangeCIPLookup(
    CIP => '1 very high',
);

$Self->False(
    $LookupOk,
    'Parameter Type not passed to ChangeCIPLookup()',
);

$LookupOk = $ChangeObject->ChangeCIPLookup(
    Type => 'Priority',
);

$Self->False(
    $LookupOk,
    'Parameter ID or CIP not passed to ChangeCIPLookup()',
);

$LookupOk = $ChangeObject->ChangeCIPLookup(
    Type => 'Priority',
    CIP  => '1 very high',
    ID   => 123,
);

$Self->False(
    $LookupOk,
    'Exclusive parameters ID and CIP passed to ChangeCIPLookup()',
);

# ------------------------------------------------------------ #
# ChangePossibleCIPGet() tests
# ------------------------------------------------------------ #

my $PossibleCIPGetOk = $ChangeObject->ChangePossibleCIPGet(
    Type   => 'non-existent',
    UserID => 1,
);

$Self->False(
    $PossibleCIPGetOk,
    'Invalid type passed to ChangePossibleCIPGet()',
);

$PossibleCIPGetOk = $ChangeObject->ChangePossibleCIPGet(
    UserID => 1,
);

$Self->False(
    $PossibleCIPGetOk,
    'Parameter Type not passed to ChangePossibleCIPGet()',
);

# The possible values are the same for all three types.
my $PossibleCIPReference = join ', ', @CIPValues;
for my $Type (qw(Category Impact Priority)) {
    my $PossibleCIPs = $ChangeObject->ChangePossibleCIPGet(
        Type   => $Type,
        UserID => 1,
    );

    $Self->Is(
        ref $PossibleCIPs,
        'ARRAY',
        'Test ' . $TestCount++ . " - ChangePossibleCIPGet() returned array ref for '$Type'",
    );

    $Self->Is(
        join( ', ', map { $_->{Value} } @{$PossibleCIPs} ),
        $PossibleCIPReference,
        "Test $TestCount - ChangePossibleCIPGet() returned expected values for '$Type'",
    );
}

# ------------------------------------------------------------ #
# testing support for attachments
# ------------------------------------------------------------ #

my ($AttachmentTestChangeID) = @{ $Label2ChangeIDs{Attachment} };

# verify that initialy no attachment exists
my @AttachmentList = $ChangeObject->ChangeAttachmentList(
    ChangeID => $AttachmentTestChangeID,
);

$Self->Is(
    scalar @AttachmentList,
    0,
    'No attachments initially',
);

my @TestFileList = (
    {
        Filename    => 'first attachment',
        Content     => 'First attachment from ITSMChange.t',
        ContentType => 'text/plain',
    },
    {
        Filename    => 'second attachment',
        Content     => 'Second attachment from ITSMChange.t',
        ContentType => 'text/plain',
    },
);

my $FileCount;
for my $TestFile (@TestFileList) {

    $FileCount++;

    my $AddOk = $ChangeObject->ChangeAttachmentAdd(
        %{$TestFile},
        ChangeID => $AttachmentTestChangeID,
        UserID   => 1,
    );
    $Self->True(
        $AddOk,
        "Attachment $FileCount: attachment added",
    );

    my @AttachmentList = $ChangeObject->ChangeAttachmentList(
        ChangeID => $AttachmentTestChangeID,
        UserID   => 1,
    );
    $Self->Is(
        scalar @AttachmentList,
        $FileCount,
        "Attachment $FileCount: number of attachments after adding",
    );

    # check whether the last added attachment is in the list
    my %AttachmentLookup = map { $_ => 1 } @AttachmentList;
    $Self->True(
        $AttachmentLookup{ $TestFile->{Filename} },
        "Attachment $FileCount: filename from ChangeAttachmentList()",
    );

    # get the attachment
    my $Attachment = $ChangeObject->ChangeAttachmentGet(
        ChangeID => $AttachmentTestChangeID,
        Filename => $TestFile->{Filename},
    );
    $Self->True(
        $Attachment,
        "Attachment $FileCount: ChangeAttachmentGet() returned true",
    );

    # check attachment file attributes
    for my $Attribute (qw(Filename Content ContentType)) {
        $Self->Is(
            $Attachment->{$Attribute},
            $TestFile->{$Attribute},
            "Attachment $FileCount: $Attribute from ChangeAttachmentGet",
        );
    }

    # check existence of attachment
    my $AttachmentExists = $ChangeObject->ChangeAttachmentExists(
        ChangeID => $AttachmentTestChangeID,
        Filename => $TestFile->{Filename},
        UserID   => 1,
    );
    $Self->True(
        $AttachmentExists,
        "Attachment $FileCount: attachment exists",
    );

}

# now delete the attachments
$FileCount = 0;
my $MaxTestFiles = scalar @TestFileList;
for my $TestFile (@TestFileList) {

    $FileCount++;

    my $DeleteOk = $ChangeObject->ChangeAttachmentDelete(
        ChangeID => $AttachmentTestChangeID,
        Filename => $TestFile->{Filename},
        UserID   => 1,
    );
    $Self->True(
        $DeleteOk,
        "Attachment $FileCount: attachment deleted",
    );

    my @AttachmentList = $ChangeObject->ChangeAttachmentList(
        ChangeID => $AttachmentTestChangeID,
        UserID   => 1,
    );

    $Self->Is(
        scalar @AttachmentList,
        $MaxTestFiles - $FileCount,
        "Attachment $FileCount: number of attachments after deletion",
    );

    my $AttachmentExists = $ChangeObject->ChangeAttachmentExists(
        Filename => $TestFile->{Filename},
        ChangeID => $AttachmentTestChangeID,
        UserID   => 1,
    );
    $Self->False(
        $AttachmentExists,
        "Attachment $FileCount: attachment is gone",
    );
}

# ------------------------------------------------------------ #
# test HistoryAddMultiple() function
# ------------------------------------------------------------ #

{

    # define old values for change
    my %OldValues = (
        ChangeTitle   => 'AAA',
        Description   => 'BBB',
        Justification => 'CCC',
    );

    # add a new test change
    my $ChangeID = $ChangeObject->ChangeAdd(
        %OldValues,
        UserID => 1,
    );

    # remember change id for automatic deletion
    $TestedChangeID{$ChangeID} = 1;

    # define new values for change update
    my %NewValues = (
        ChangeTitle   => 'XXX',
        Description   => 'YYY',
        Justification => 'ZZZ',
    );

    # update the change
    my $Success = $ChangeObject->ChangeUpdate(
        %NewValues,
        ChangeID => $ChangeID,
        UserID   => 1,
    );

    # get the change history
    my $HistoryEntries = $HistoryObject->ChangeHistoryGet(
        ChangeID => $ChangeID,
        UserID   => 1,
    );

    # get reverse history entries
    my @ReverseHistory = reverse @{$HistoryEntries};

    # get the last 3 history entries and put them in a hash
    # key is the fieldname, value is the complete history data of that line
    my %HistoryLookupByFieldname = map { $_->{Fieldname} => $_ } @ReverseHistory[ 0, 1, 2 ];

    for my $Fieldname ( sort keys %NewValues ) {

        $Self->Is(
            $HistoryLookupByFieldname{$Fieldname}->{ContentOld},
            $OldValues{$Fieldname},
            "Checking History for Field: $Fieldname, ContentOld: $OldValues{$Fieldname}",
        );

        $Self->Is(
            $HistoryLookupByFieldname{$Fieldname}->{ContentNew},
            $NewValues{$Fieldname},
            "Checking History for Field: $Fieldname, ContentNew: $NewValues{$Fieldname}",
        );
    }
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

# delete the test changes
my $DeleteTestCount = 1;
for my $ChangeID ( sort keys %TestedChangeID ) {

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

# restore original email check param
$ConfigObject->Set(
    Key   => 'CheckEmailAddresses',
    Value => $CheckEmailAddressesOrg,
);

=over 4

=item SetTimes()

Set new values for CreateTime and ChangeTime for a given ChangeID.

    my $UpdateSuccess = SetTimes(
        ChangeID => 123,
        CreateTime => '2009-10-30 01:00:15',
        ChangeTime => '2009-10-30 01:00:15',
    );

=back

=cut

sub SetTimes {
    my (%Param) = @_;

    # check change id
    if ( !$Param{ChangeID} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need ChangeID!',
        );
        return;
    }

    # check parameters
    if ( !$Param{CreateTime} && !$Param{ChangeTime} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need parameter CreateTime or ChangeTime!',
        );
        return;
    }

    my @Bind;
    my $SQL = 'UPDATE change_item SET ';

    if ( $Param{CreateTime} ) {
        $SQL .= 'create_time = ? ';
        push @Bind, \$Param{CreateTime};
    }

    if ( $Param{CreateTime} && $Param{ChangeTime} ) {
        $SQL .= ', ';
    }

    if ( $Param{ChangeTime} ) {
        $SQL .= 'change_time = ? ';
        push @Bind, \$Param{ChangeTime};
    }

    $SQL .= 'WHERE id = ? ';
    push @Bind, \$Param{ChangeID};

    return if !$DBObject->Do(
        SQL  => $SQL,
        Bind => \@Bind,
    );

    # cleanup the cache
    $CacheObject->CleanUp(
        Type => 'ITSMChangeManagement',
    );

    return 1;
}

# set SendNotifications to it's original value
$ConfigObject->Set(
    Key   => 'ITSMChange::SendNotifications',
    Value => $SendNotificationsOrg,
);

=over 4

=item _TestPossibleStates()

Internal use only!
Runs a series of tests for ChangePossibleStatesGet() by using a ChangeID as argument

    _TestPosssibleStates(
        State                 => 'In Progress',                 # State name to be displayed on the tests
        PossibleStates        => $PossibleStates,               # The result from ChangePossibleStatesGet()
        PossibleDefaultStates => \@PossibleStatesForInProgress, # Array to possible state to compare
        TestNumber            => 1,                             # Testnumber

    );

=back

=cut

sub _TestPossibleStates {
    my (%Param) = @_;

    my $State                 = $Param{State};
    my $PossibleStates        = $Param{PossibleStates};
    my @PossibleDefaultStates = @{ $Param{PossibleDefaultStates} };
    my $TestNumber            = $Param{TestNumber};

    # Check if return...
    $Self->True(
        $PossibleStates,
        "Possible States Test $TestNumber: ChangePossibleStatesGet() - "
            . "returns a list of posible states from $State State.",
    );

    # Check if returning the same number of states...
    $Self->Is(
        scalar @{$PossibleStatesUsingChangeID},
        scalar @PossibleDefaultStates,
        "Possible States Test $TestNumber: |-"
            . "returns the same number of elements as the $State State default.",
    );

    for my $PossibleStateHash ( @{$PossibleStates} ) {
        my ( $FirstHashRef, $SecondHashRef ) = grep { $_ eq $PossibleStateHash->{Value} } @PossibleDefaultStates;

        # Check if the state names are correct...
        $Self->Is(
            $FirstHashRef,
            $PossibleStateHash->{Value},
            "Possible States Test $TestNumber: |- match default states from $State State.",
        );

        # Check if the state name is not repeted
        $Self->False(
            $SecondHashRef,
            "Possible States Test $TestNumber: |- states form $State match only once"
        );
    }
}

1;
