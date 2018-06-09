# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

## no critic (Modules::RequireExplicitPackage)
use strict;
use warnings;
use utf8;
use vars (qw($Self));

use Kernel::GenericInterface::Debugger;
use Kernel::GenericInterface::Operation::Session::SessionCreate;
use Kernel::GenericInterface::Operation::Ticket::TicketUpdate;
use Kernel::GenericInterface::Requester;

use Kernel::System::VariableCheck qw(:all);

# get helper object
# skip SSL certificate verification
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {

        SkipSSLVerify => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# get a random number
my $RandomID = $Helper->GetRandomNumber();

# create a new user for current test
my $UserLogin = $Helper->TestUserCreate(
    Groups => ['users'],
);
my $Password = $UserLogin;

# new user object
my $UserObject = $Kernel::OM->Get('Kernel::System::User');

$Self->{UserID} = $UserObject->UserLookup(
    UserLogin => $UserLogin,
);

# create a new user without permissions for current test
my $UserLogin2 = $Helper->TestUserCreate();
my $Password2  = $UserLogin2;

# create a customer where a ticket will use and will have permissions
my $CustomerUserLogin = $Helper->TestCustomerUserCreate();
my $CustomerPassword  = $CustomerUserLogin;

# create a customer that will not have permissions
my $CustomerUserLogin2 = $Helper->TestCustomerUserCreate();
my $CustomerPassword2  = $CustomerUserLogin2;

# create dynamic field object
my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

# add text dynamic field
my %DynamicFieldTextConfig = (
    Name       => "Unittest1$RandomID",
    FieldOrder => 9991,
    FieldType  => 'Text',
    ObjectType => 'Ticket',
    Label      => 'Description',
    ValidID    => 1,
    Config     => {
        DefaultValue => '',
    },
);
my $FieldTextID = $DynamicFieldObject->DynamicFieldAdd(
    %DynamicFieldTextConfig,
    UserID  => 1,
    Reorder => 0,
);
$Self->True(
    $FieldTextID,
    "Dynamic Field $FieldTextID",
);

# add ID
$DynamicFieldTextConfig{ID} = $FieldTextID;

# add dropdown dynamic field
my %DynamicFieldDropdownConfig = (
    Name       => "Unittest2$RandomID",
    FieldOrder => 9992,
    FieldType  => 'Dropdown',
    ObjectType => 'Ticket',
    Label      => 'Description',
    ValidID    => 1,
    Config     => {
        PossibleValues => [
            1 => 'One',
            2 => 'Two',
            3 => 'Three',
        ],
    },
);
my $FieldDropdownID = $DynamicFieldObject->DynamicFieldAdd(
    %DynamicFieldDropdownConfig,
    UserID  => 1,
    Reorder => 0,
);
$Self->True(
    $FieldDropdownID,
    "Dynamic Field $FieldDropdownID",
);

# add ID
$DynamicFieldDropdownConfig{ID} = $FieldDropdownID;

# add multiselect dynamic field
my %DynamicFieldMultiselectConfig = (
    Name       => "Unittest3$RandomID",
    FieldOrder => 9993,
    FieldType  => 'Multiselect',
    ObjectType => 'Ticket',
    Label      => 'Multiselect label',
    ValidID    => 1,
    Config     => {
        PossibleValues => [
            1 => 'Value9ßüß',
            2 => 'DifferentValue',
            3 => '1234567',
        ],
    },
);
my $FieldMultiselectID = $DynamicFieldObject->DynamicFieldAdd(
    %DynamicFieldMultiselectConfig,
    UserID  => 1,
    Reorder => 0,
);
$Self->True(
    $FieldMultiselectID,
    "Dynamic Field $FieldMultiselectID",
);

# add ID
$DynamicFieldMultiselectConfig{ID} = $FieldMultiselectID;

# create ticket object
my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

#ticket id container
my @TicketIDs;

# create ticket 1
my $TicketID1 = $TicketObject->TicketCreate(
    Title        => 'Ticket One Title',
    Queue        => 'Raw',
    Lock         => 'unlock',
    Priority     => '3 normal',
    State        => 'new',
    CustomerID   => $CustomerUserLogin,
    CustomerUser => 'unittest@otrs.com',
    OwnerID      => 1,
    UserID       => 1,
);

# sanity check
$Self->True(
    $TicketID1,
    "TicketCreate() successful for Ticket One ID $TicketID1",
);

my %Ticket = $TicketObject->TicketGet(
    TicketID => $TicketID1,
    UserID   => 1,
);

# remember ticket id
push @TicketIDs, $TicketID1;

# create backed object
my $BackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
$Self->Is(
    ref $BackendObject,
    'Kernel::System::DynamicField::Backend',
    'Backend object was created successfully',
);

# set text field value
my $Result = $BackendObject->ValueSet(
    DynamicFieldConfig => \%DynamicFieldTextConfig,
    ObjectID           => $TicketID1,
    Value              => 'ticket1_field1',
    UserID             => 1,
);

# sanity check
$Self->True(
    $Result,
    "Text ValueSet() for Ticket $TicketID1",
);

# set dropdown field value
$Result = $BackendObject->ValueSet(
    DynamicFieldConfig => \%DynamicFieldDropdownConfig,
    ObjectID           => $TicketID1,
    Value              => 1,
    UserID             => 1,
);

# sanity check
$Self->True(
    $Result,
    "Multiselect ValueSet() for Ticket $TicketID1",
);

# set multiselect field value
$Result = $BackendObject->ValueSet(
    DynamicFieldConfig => \%DynamicFieldMultiselectConfig,
    ObjectID           => $TicketID1,
    Value              => [ 2, 3 ],
    UserID             => 1,
);

# sanity check
$Self->True(
    $Result,
    "Dropdown ValueSet() for Ticket $TicketID1",
);

# set webservice name
my $WebserviceName = $Helper->GetRandomID();

# create web-service object
my $WebserviceObject = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');

$Self->Is(
    'Kernel::System::GenericInterface::Webservice',
    ref $WebserviceObject,
    "Create webservice object",
);

my $WebserviceID = $WebserviceObject->WebserviceAdd(
    Name   => $WebserviceName,
    Config => {
        Debugger => {
            DebugThreshold => 'debug',
        },
        Provider => {
            Transport => {
                Type => '',
            },
        },
    },
    ValidID => 1,
    UserID  => 1,
);
$Self->True(
    $WebserviceID,
    "Added Webservice",
);

# get config object
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

# get remote host with some precautions for certain unit test systems
my $Host = $Helper->GetTestHTTPHostname();

# prepare web-service config
my $RemoteSystem =
    $ConfigObject->Get('HttpType')
    . '://'
    . $Host
    . '/'
    . $ConfigObject->Get('ScriptAlias')
    . '/nph-genericinterface.pl/WebserviceID/'
    . $WebserviceID;

my $WebserviceConfig = {

    #    Name => '',
    Description =>
        'Test for Ticket Connector using SOAP transport backend.',
    Debugger => {
        DebugThreshold => 'debug',
        TestMode       => 1,
    },
    Provider => {
        Transport => {
            Type   => 'HTTP::SOAP',
            Config => {
                MaxLength => 10000000,
                NameSpace => 'http://otrs.org/SoapTestInterface/',
                Endpoint  => $RemoteSystem,
            },
        },
        Operation => {
            TicketUpdate => {
                Type => 'Ticket::TicketUpdate',
            },
            SessionCreate => {
                Type => 'Session::SessionCreate',
            },
        },
    },
    Requester => {
        Transport => {
            Type   => 'HTTP::SOAP',
            Config => {
                NameSpace => 'http://otrs.org/SoapTestInterface/',
                Encoding  => 'UTF-8',
                Endpoint  => $RemoteSystem,
            },
        },
        Invoker => {
            TicketUpdate => {
                Type => 'Test::TestSimple',
            },
            SessionCreate => {
                Type => 'Test::TestSimple',
            },
        },
    },
};

# update web-service with real config
# the update is needed because we are using
# the WebserviceID for the Endpoint in config
my $WebserviceUpdate = $WebserviceObject->WebserviceUpdate(
    ID      => $WebserviceID,
    Name    => $WebserviceName,
    Config  => $WebserviceConfig,
    ValidID => 1,
    UserID  => $Self->{UserID},
);
$Self->True(
    $WebserviceUpdate,
    "Updated Webservice $WebserviceID - $WebserviceName",
);

# disable SessionCheckRemoteIP setting
$ConfigObject->Set(
    Key   => 'SessionCheckRemoteIP',
    Value => 0,
);

# Get SessionID
# create requester object
my $RequesterSessionObject = $Kernel::OM->Get('Kernel::GenericInterface::Requester');

$Self->Is(
    'Kernel::GenericInterface::Requester',
    ref $RequesterSessionObject,
    "SessionID - Create requester object",
);

# start requester with our web-service
my $RequesterSessionResult = $RequesterSessionObject->Run(
    WebserviceID => $WebserviceID,
    Invoker      => 'SessionCreate',
    Data         => {
        UserLogin => $UserLogin,
        Password  => $Password,
    },
);

my $NewSessionID = $RequesterSessionResult->{Data}->{SessionID};

my @Tests = (
    {
        Name           => 'Update Agent (With Permissions)',
        SuccessRequest => '1',
        RequestData    => {
            TicketID => $TicketID1,
            Ticket   => {
                Title => 'Updated',
            },
        },
        ExpectedReturnRemoteData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        ExpectedReturnLocalData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        Operation => 'TicketUpdate',
    },
    {
        Name           => 'Update Agent (With SessionID)',
        SuccessRequest => '1',
        RequestData    => {
            TicketID => $TicketID1,
            Ticket   => {
                Title => 'Updated',
            },
        },
        Auth => {
            SessionID => $NewSessionID,
        },
        ExpectedReturnRemoteData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        ExpectedReturnLocalData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        Operation => 'TicketUpdate',
    },
    {
        Name           => 'Update Agent (No Permission)',
        SuccessRequest => '1',
        RequestData    => {
            TicketID => $TicketID1,
            Ticket   => {
                Title => 'Updated',
            },
        },
        Auth => {
            UserLogin => $UserLogin2,
            Password  => $Password2,
        },
        ExpectedReturnLocalData => {
            Data => {
                Error => {
                    ErrorCode => 'TicketUpdate.AccessDenied',
                    ErrorMessage =>
                        'TicketUpdate: User does not have access to the ticket!'
                },
            },
            Success => 1
        },
        ExpectedReturnRemoteData => {
            Data => {
                Error => {
                    ErrorCode => 'TicketUpdate.AccessDenied',
                    ErrorMessage =>
                        'TicketUpdate: User does not have access to the ticket!'
                },
            },
            Success => 1
        },
        Operation => 'TicketUpdate',
    },
    {
        Name           => 'Update Customer (With Permissions)',
        SuccessRequest => '1',
        RequestData    => {
            TicketID => $TicketID1,
            Ticket   => {
                Title => 'Updated',
            },
        },
        Auth => {
            CustomerUserLogin => $CustomerUserLogin,
            Password          => $CustomerPassword,
        },
        ExpectedReturnRemoteData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        ExpectedReturnLocalData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        Operation => 'TicketUpdate',
    },
    {
        Name           => 'Update Customer (No Permission)',
        SuccessRequest => '1',
        RequestData    => {
            TicketID => $TicketID1,
            Ticket   => {
                Title => 'Updated',
            },
        },
        Auth => {
            CustomerUserLogin => $CustomerUserLogin2,
            Password          => $CustomerPassword2,
        },
        ExpectedReturnLocalData => {
            Data => {
                Error => {
                    ErrorCode => 'TicketUpdate.AccessDenied',
                    ErrorMessage =>
                        'TicketUpdate: User does not have access to the ticket!'
                },
            },
            Success => 1
        },
        ExpectedReturnRemoteData => {
            Data => {
                Error => {
                    ErrorCode => 'TicketUpdate.AccessDenied',
                    ErrorMessage =>
                        'TicketUpdate: User does not have access to the ticket!'
                },
            },
            Success => 1
        },
        Operation => 'TicketUpdate',
    },

    {
        Name           => 'Update Text DynamicField (with empty value)',
        SuccessRequest => '1',
        RequestData    => {
            TicketID     => $TicketID1,
            DynamicField => [
                {
                    Name  => "Unittest1$RandomID",
                    Value => '',
                },
                {
                    Name  => "Unittest2$RandomID",
                    Value => '',
                },
                {
                    Name  => "Unittest3$RandomID",
                    Value => '',
                },
            ],
        },
        Auth => {
            SessionID => $NewSessionID,
        },
        ExpectedReturnRemoteData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        ExpectedReturnLocalData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        Operation => 'TicketUpdate',
    },

    {
        Name           => 'Update Text DynamicField (with not empty value)',
        SuccessRequest => '1',
        RequestData    => {
            TicketID     => $TicketID1,
            DynamicField => [
                {
                    Name  => "Unittest1$RandomID",
                    Value => 'Value9ßüß-カスタ1234',
                },
                {
                    Name  => "Unittest2$RandomID",
                    Value => '2',
                },
                {
                    Name  => "Unittest3$RandomID",
                    Value => [ 1, 2 ],
                },
            ],
        },
        Auth => {
            SessionID => $NewSessionID,
        },
        ExpectedReturnRemoteData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        ExpectedReturnLocalData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        Operation => 'TicketUpdate',
    },

    {
        Name           => 'Update Text DynamicField (with wrong value)',
        SuccessRequest => '1',
        RequestData    => {
            TicketID     => $TicketID1,
            DynamicField => [
                {
                    Name  => "Unittest1$RandomID",
                    Value => { Wrong => 'Value' },    # value type depends on the dynamic field
                },
                {
                    Name  => "Unittest2$RandomID",
                    Value => { Wrong => 'Value' },    # value type depends on the dynamic field
                },
            ],
        },
        Auth => {
            SessionID => $NewSessionID,
        },
        ExpectedReturnRemoteData => {
            Success => 1,
            Data    => {
                Error => {
                    ErrorCode    => 'TicketUpdate.MissingParameter',
                    ErrorMessage => 'TicketUpdate: DynamicField->Value parameter is missing!'
                },
            },
        },
        ExpectedReturnLocalData => {
            Success => 1,
            Data    => {
                Error => {
                    ErrorCode    => 'TicketUpdate.MissingParameter',
                    ErrorMessage => 'TicketUpdate: DynamicField->Value parameter is missing!'
                },
            },
        },
        Operation => 'TicketUpdate',
    },
);

# debugger object
my $DebuggerObject = Kernel::GenericInterface::Debugger->new(
    %{$Self},
    DebuggerConfig => {
        DebugThreshold => 'debug',
        TestMode       => 1,
    },
    WebserviceID      => $WebserviceID,
    CommunicationType => 'Provider',
);
$Self->Is(
    ref $DebuggerObject,
    'Kernel::GenericInterface::Debugger',
    'DebuggerObject instantiate correctly',
);

for my $Test (@Tests) {

    # create local object
    my $LocalObject = "Kernel::GenericInterface::Operation::Ticket::$Test->{Operation}"->new(
        %{$Self},
        DebuggerObject => $DebuggerObject,
        WebserviceID   => $WebserviceID,
        ConfigObject   => $ConfigObject,
    );

    $Self->Is(
        "Kernel::GenericInterface::Operation::Ticket::$Test->{Operation}",
        ref $LocalObject,
        "$Test->{Name} - Create local object",
    );

    my %Auth = (
        UserLogin => $UserLogin,
        Password  => $Password,
    );
    if ( IsHashRefWithData( $Test->{Auth} ) ) {
        %Auth = %{ $Test->{Auth} };
    }

    # start requester with our web-service
    my $LocalResult = $LocalObject->Run(
        WebserviceID => $WebserviceID,
        Invoker      => $Test->{Operation},
        Data         => {
            %Auth,
            %{ $Test->{RequestData} },
        },
    );

    # check result
    $Self->Is(
        'HASH',
        ref $LocalResult,
        "$Test->{Name} - Local result structure is valid",
    );

    # create requester object
    my $RequesterObject = Kernel::GenericInterface::Requester->new(
        %{$Self},
        ConfigObject => $ConfigObject,
    );
    $Self->Is(
        'Kernel::GenericInterface::Requester',
        ref $RequesterObject,
        "$Test->{Name} - Create requester object",
    );

    # start requester with our web-service
    my $RequesterResult = $RequesterObject->Run(
        WebserviceID => $WebserviceID,
        Invoker      => $Test->{Operation},
        Data         => {
            %Auth,
            %{ $Test->{RequestData} },
        },
    );

    # check result
    $Self->Is(
        'HASH',
        ref $RequesterResult,
        "$Test->{Name} - Requester result structure is valid",
    );

    $Self->Is(
        $RequesterResult->{Success},
        $Test->{SuccessRequest},
        "$Test->{Name} - Requester successful result",
    );

    # remove ErrorMessage parameter from direct call
    # result to be consistent with SOAP call result
    if ( $LocalResult->{ErrorMessage} ) {
        delete $LocalResult->{ErrorMessage};
    }

    $Self->IsDeeply(
        $RequesterResult,
        $Test->{ExpectedReturnRemoteData},
        "$Test->{Name} - Requester success status (needs configured and running webserver)",
    );

    if ( $Test->{ExpectedReturnLocalData} ) {
        $Self->IsDeeply(
            $LocalResult,
            $Test->{ExpectedReturnLocalData},
            "$Test->{Name} - Local result matched with expected local call result.",
        );
    }
    else {
        $Self->IsDeeply(
            $LocalResult,
            $Test->{ExpectedReturnRemoteData},
            "$Test->{Name} - Local result matched with remote result.",
        );
    }
}

# UnlockOnAway tests
$ConfigObject->Set(
    Key   => 'Ticket::UnlockOnAway',
    Value => 1,
);

my $UserLoginOutOfOffice = $Helper->TestUserCreate(
    Groups => ['users'],
);
my $UserIDOutOfOffice = $UserObject->UserLookup(
    UserLogin => $UserLoginOutOfOffice,
);
my $UserIDNoOutOfOffice = $UserObject->UserLookup(
    UserLogin => $UserLogin,
);

# set a user out of office
my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');
my ( $SSec, $SMin, $SHour, $SDay, $SMonth, $SYear, $SWeekDay ) = $TimeObject->SystemTime2Date(
    SystemTime => $TimeObject->SystemTime() - ( 24 * 60 * 60 ),
);
my ( $ESec, $EMin, $EHour, $EDay, $EMonth, $EYear, $EWeekDay ) = $TimeObject->SystemTime2Date(
    SystemTime => $TimeObject->SystemTime() + ( 24 * 60 * 60 ),
);
my %OutOfOfficeParams = (
    OutOfOffice           => 1,
    OutOfOfficeStartYear  => $SYear,
    OutOfOfficeStartMonth => $SMonth,
    OutOfOfficeStartDay   => $SDay,
    OutOfOfficeEndYear    => $EYear,
    OutOfOfficeEndMonth   => $EMonth,
    OutOfOfficeEndDay     => $EDay,
);
for my $Key ( sort keys %OutOfOfficeParams ) {
    $UserObject->SetPreferences(
        UserID => $UserIDOutOfOffice,
        Key    => $Key,
        Value  => $OutOfOfficeParams{$Key},
    );
}

my $TicketIDNoOutOfOffice = $TicketObject->TicketCreate(
    Title        => 'Ticket One Title',
    Queue        => 'Raw',
    Lock         => 'lock',
    Priority     => '3 normal',
    State        => 'new',
    CustomerID   => $CustomerUserLogin,
    CustomerUser => 'unittest@otrs.com',
    OwnerID      => $UserIDNoOutOfOffice,
    UserID       => 1,
);
push @TicketIDs, $TicketIDNoOutOfOffice;

my $TicketIDOutOfOffice = $TicketObject->TicketCreate(
    Title        => 'Ticket One Title',
    Queue        => 'Raw',
    Lock         => 'lock',
    Priority     => '3 normal',
    State        => 'new',
    CustomerID   => $CustomerUserLogin,
    CustomerUser => 'unittest@otrs.com',
    OwnerID      => $UserIDOutOfOffice,
    UserID       => 1,
);
push @TicketIDs, $TicketIDOutOfOffice;

@Tests = (
    {
        Name        => 'Add Article, Ticket NoOutOfOffice',
        RequestData => {
            TicketID => $TicketIDNoOutOfOffice,
            Article  => {
                Subject     => 'some subject',
                Body        => 'some body',
                ContentType => 'text/plain; charset=UTF8',
            },

        },
        Lock => 'lock',
    },
    {
        Name        => 'Add Article, Ticket OutOfOffice',
        RequestData => {
            TicketID => $TicketIDOutOfOffice,
            Article  => {
                Subject     => 'some subject',
                Body        => 'some body',
                ContentType => 'text/plain; charset=UTF8',
            },
        },
        Lock => 'unlock',
    },

    {
        Name        => 'Add Article / Change Owner, Ticket NoOutOfOffice',
        RequestData => {
            TicketID => $TicketIDNoOutOfOffice,
            Ticket   => {
                OwnerID => $UserIDOutOfOffice,
            },
            Article => {
                Subject     => 'some subject',
                Body        => 'some body',
                ContentType => 'text/plain; charset=UTF8',
            },
        },
        Lock => 'lock',
    },
    {
        Name        => 'Add Article / Change Owner, Ticket OutOfOffice',
        RequestData => {
            TicketID => $TicketIDOutOfOffice,
            Ticket   => {
                OwnerID => $UserIDNoOutOfOffice,
            },
            Article => {
                Subject     => 'some subject',
                Body        => 'some body',
                ContentType => 'text/plain; charset=UTF8',
            },
        },
        Lock => 'lock',
    },
);

for my $Test (@Tests) {

    # create local object
    my $LocalObject = "Kernel::GenericInterface::Operation::Ticket::TicketUpdate"->new(
        %{$Self},
        DebuggerObject => $DebuggerObject,
        WebserviceID   => $WebserviceID,
        ConfigObject   => $ConfigObject,
    );

    my %Auth = (
        UserLogin => $UserLogin,
        Password  => $Password,
    );

    # start requester with our web-service
    my $LocalResult = $LocalObject->Run(
        WebserviceID => $WebserviceID,
        Invoker      => 'TicketUpdate',
        Data         => {
            %Auth,
            %{ $Test->{RequestData} },
        },
    );

    my %Ticket = $TicketObject->TicketGet(
        TicketID => $Test->{RequestData}->{TicketID},
        UserID   => 1,
    );

    $Self->Is(
        $Ticket{Lock},
        $Test->{Lock},
        "$Test->{Name} Lock attribute",
    );

    my $Success = $TicketObject->TicketLockSet(
        Lock     => 'lock',
        TicketID => $Test->{RequestData}->{TicketID},
        UserID   => 1,
    );
}

# cleanup

# delete web-service
my $WebserviceDelete = $WebserviceObject->WebserviceDelete(
    ID     => $WebserviceID,
    UserID => $Self->{UserID},
);
$Self->True(
    $WebserviceDelete,
    "Deleted Webservice $WebserviceID",
);

# delete tickets
for my $TicketID (@TicketIDs) {
    my $TicketDelete = $TicketObject->TicketDelete(
        TicketID => $TicketID,
        UserID   => $Self->{UserID},
    );

    # sanity check
    $Self->True(
        $TicketDelete,
        "TicketDelete() successful for Ticket ID $TicketID",
    );
}

# delete dynamic fields
my $DeleteFieldList = $DynamicFieldObject->DynamicFieldList(
    ResultType => 'HASH',
    ObjectType => 'Ticket',
);

DYNAMICFIELD:
for my $DynamicFieldID ( sort keys %{$DeleteFieldList} ) {

    next DYNAMICFIELD if !$DynamicFieldID;
    next DYNAMICFIELD if !$DeleteFieldList->{$DynamicFieldID};

    next DYNAMICFIELD if $DeleteFieldList->{$DynamicFieldID} !~ m{ ^Unittest }xms;

    $DynamicFieldObject->DynamicFieldDelete(
        ID     => $DynamicFieldID,
        UserID => 1,
    );
}

# cleanup cache
$Kernel::OM->Get('Kernel::System::Cache')->CleanUp();

1;
