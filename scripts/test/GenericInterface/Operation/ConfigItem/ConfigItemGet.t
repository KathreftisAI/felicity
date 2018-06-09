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

use Kernel::GenericInterface::Debugger;
use Kernel::GenericInterface::Operation::ConfigItem::ConfigItemCreate;
use Kernel::GenericInterface::Operation::ConfigItem::ConfigItemGet;
use Kernel::System::VariableCheck qw(:all);

# set UserID to root
$Self->{UserID} = 1;

# helper object
# skip SSL certiciate verification
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreSystemConfiguration => 1,
        SkipSSLVerify              => 1,
    },
);
my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

my $RandomID = $HelperObject->GetRandomID();

my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

# check if SSL Certificate verification is disabled
$Self->Is(
    $ENV{PERL_LWP_SSL_VERIFY_HOSTNAME},
    0,
    'Disabled SSL certiticates verification in environment',
);

# create ConfigItem object
my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');

my $TestCustomerUserLogin = $HelperObject->TestCustomerUserCreate();

# create webservice object
my $WebserviceObject = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');
$Self->Is(
    'Kernel::System::GenericInterface::Webservice',
    ref $WebserviceObject,
    "Create webservice object",
);

# set webservice name
my $WebserviceName = '-Test-' . $RandomID;

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

# get remote host with some precautions for certain unit test systems
my $Host;
my $FQDN = $ConfigObject->Get('FQDN');

# try to resolve fqdn host
if ( $FQDN ne 'yourhost.example.com' && gethostbyname($FQDN) ) {
    $Host = $FQDN;
}

# try to resolve localhost instead
if ( !$Host && gethostbyname('localhost') ) {
    $Host = 'localhost';
}

# use hardcoded localhost ip address
if ( !$Host ) {
    $Host = '127.0.0.1';
}

# prepare webservice config
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
        'Test for ConfigItem Connector using SOAP transport backend.',
    Debugger => {
        DebugThreshold => 'debug',
        TestMode       => 1,
    },
    Provider => {
        Transport => {
            Type   => 'HTTP::SOAP',
            Config => {
                MaxLength => 10_000_000,
                NameSpace => 'http://otrs.org/SoapTestInterface/',
                Endpoint  => $RemoteSystem,
            },
        },
        Operation => {
            ConfigItemGet => {
                Type => 'ConfigItem::ConfigItemGet',
            },
            ConfigItemCreate => {
                Type => 'ConfigItem::ConfigItemCreate',
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
            ConfigItemGet => {
                Type => 'Test::TestSimple',
            },
            ConfigItemCreate => {
                Type => 'Test::TestSimple',
            },
            SessionCreate => {
                Type => 'Test::TestSimple',
            },
        },
    },
};

# update webservice with real config
my $WebserviceUpdate = $WebserviceObject->WebserviceUpdate(
    ID      => $WebserviceID,
    Name    => $WebserviceName,
    Config  => $WebserviceConfig,
    ValidID => 1,
    UserID  => 1,
);
$Self->True(
    $WebserviceUpdate,
    "Updated Webservice $WebserviceID - $WebserviceName",
);

# debugger object
my $DebuggerObject = Kernel::GenericInterface::Debugger->new(
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
    'DebuggerObject instanciate correctly',
);

# Get SessionID
# create requester object
my $RequesterSessionObject = $Kernel::OM->Get('Kernel::GenericInterface::Requester');
$Self->Is(
    'Kernel::GenericInterface::Requester',
    ref $RequesterSessionObject,
    "SessionID - Create requester object",
);

# create a new user for current test
my $UserLogin = $HelperObject->TestUserCreate(
    Groups => [ 'admin', 'users', 'itsm-configitem' ],
);

my $Password = $UserLogin;

# start requester with our webservice
my $RequesterSessionResult = $RequesterSessionObject->Run(
    WebserviceID => $WebserviceID,
    Invoker      => 'SessionCreate',
    Data         => {
        UserLogin => $UserLogin,
        Password  => $Password,
    },
);

my $NewSessionID = $RequesterSessionResult->{Data}->{SessionID};

#ConfigItemts container (usefull for lookup compare)
my %AddedConfigItems;
my @AddedConfigItemIDs;

# ConfigItem settings
my @ConfigItems = (
    {
        Class     => 'Computer',
        Name      => 'TestCI-1-' . $RandomID,
        DeplState => 'Production',
        InciState => 'Incident',
        CIXMLData => {
            NIC => {
                NIC        => 'Lo0',
                IPoverDHCP => 'No',
            },
        },
    },
    {
        Class     => 'Computer',
        Name      => 'TestCI-2-' . $RandomID,
        DeplState => 'Repair',
        InciState => 'Warning',
        CIXMLData => {
            Vendor          => 'Lenovo',
            Model           => 'Thinkpad',
            Description     => 'Thinkpad X300',
            Type            => 'Desktop',
            Owner           => $TestCustomerUserLogin,
            SerialNumber    => 'abc12345abc',
            OperatingSystem => 'CentOS 6.0',
            CPU             => 'Intel Core i3',
            Ram             => [
                4000,
                2000,
            ],
            HardDisk => {
                HardDisk => '/dev',
                Capacity => 50000,
            },
            FQDN => 'hots.example.com',
            NIC  => [
                {
                    NIC        => 'Eth0',
                    IPoverDHCP => 'No',
                    IPAddress  => '192.168.30.1',
                },
                {
                    NIC        => 'Eth1',
                    IPoverDHCP => 'Yes',
                    IPAddress  => '200.34.56.78',
                },
            ],
            GraphicAdapter => 'ATI Radeon 300',
            InstallDate    => '1977-12-12',
            Note           => 'This is a Demo CI',
        },
        Attachment => [
            {
                Content     => 'VGhpcyBpcyBhbiBlbmNvZGVkIHRleHQ=',
                ContentType => 'text/plain',
                Filename    => 'My Text.txt',
            },
            {
                Content     => 'VGhpcyBpcyBhbiBlbmNvZGVkIHRleHQ=',
                ContentType => 'text/plain; charset=ISO-8859-1',
                Filename    => 'My Text2.txt',
            },
        ],
    },
    {
        Class     => 'Hardware',
        Name      => 'TestCI-3-' . $RandomID,
        DeplState => 'Production',
        InciState => 'Operational',
        CIXMLData => {
            Vendor       => 'Hardware Vendor',
            Model        => 'Hardware Model',
            Description  => 'Tesitng Hanrdware',
            Type         => 'Camera',
            Owner        => $TestCustomerUserLogin,
            SerialNumber => '123amc456',
        },
    },
    {
        Class     => 'Location',
        Name      => 'TestCI-4-' . $RandomID,
        DeplState => 'Production',
        InciState => 'Operational',
        CIXMLData => {
            Type     => 'Building',
            Phone1   => '123',
            Phone2   => '456',
            Fax      => '789',
            'E-Mail' => 'soemone@example.com',
            Address  => 'Some address',
            Note     => 'This is a test location',
        },
    },
    {
        Class     => 'Network',
        Name      => 'TestCI-5-' . $RandomID,
        DeplState => 'Production',
        InciState => 'Operational',
        CIXMLData => {
            Description    => 'Network CI for testing',
            Type           => 'LAN',
            NetworkAddress => [
                {
                    NetworkAddress => '192.1.1.1',
                    SubnetMask     => '255.255.255.0',
                    Gateway        => '192.1.1.254',
                },
                {
                    NetworkAddress => '192.1.50.1',
                    SubnetMask     => '255.255.255.0',
                    Gateway        => '192.1.50.254',
                },
            ],
            Note => 'This is a test CI',
        },
    },
    {
        Class     => 'Software',
        Name      => 'TestCI-6-' . $RandomID,
        DeplState => 'Production',
        InciState => 'Operational',
        CIXMLData => {
            Vendor       => 'Some software vendor',
            Version      => '1.1.1',
            Description  => 'Some software description',
            Type         => 'Admin Tool',
            Owner        => $TestCustomerUserLogin,
            SerialNumber => '123ABC456',
            LicenceType  => 'Open Source',
            LicenceKey   => [
                {
                    LicenceKey     => '1234',
                    Quantity       => '1',
                    ExpirationDate => '1977-12-12',
                },
                {
                    LicenceKey     => '4567',
                    Quantity       => '3',
                    ExpirationDate => '1977-12-25',
                },
            ],
            Media => 'Download',
            Note  => 'This is a test CI',
        },
    },
);

my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
my $ClassList            = $GeneralCatalogObject->ItemList(
    Class => 'ITSM::ConfigItem::Class',
);
my %ReverseClassList = reverse %{$ClassList};
my $InciStateList    = $GeneralCatalogObject->ItemList(
    Class => 'ITSM::Core::IncidentState',
);
my %ReverseInciStateList = reverse %{$InciStateList};
my $DeplStateList        = $GeneralCatalogObject->ItemList(
    Class => 'ITSM::ConfigItem::DeploymentState',
);
my %ReverseDeplStateList = reverse %{$DeplStateList};
for my $ConfigItem (@ConfigItems) {

    # make a deep copy to avoid changing the definition
    my $ClonedConfigItem = Storable::dclone($ConfigItem);

    # create new config item
    my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
        ClassID => $ReverseClassList{ $ConfigItem->{Class} },
        UserID  => $Self->{UserID},
    );

    # sanity checks
    $Self->True(
        $ConfigItemID,
        "Added ConfigItem $ConfigItemID",
    );

    my $DefinitionData = $ConfigItemObject->DefinitionGet(
        ClassID => $ReverseClassList{ $ConfigItem->{Class} },
    );

    my $LocalObject = Kernel::GenericInterface::Operation::ConfigItem::ConfigItemCreate->new(
        DebuggerObject => $DebuggerObject,
        WebserviceID   => $WebserviceID,
    );

    my $ReplacedXMLData = $LocalObject->ReplaceXMLData(
        XMLData    => $ConfigItem->{CIXMLData},
        Definition => $DefinitionData->{DefinitionRef},
    );

    my $XMLData = $LocalObject->FormatXMLData(
        XMLData => $ReplacedXMLData,
    );

    my $VersionID = $ConfigItemObject->VersionAdd(
        ConfigItemID => $ConfigItemID,
        Name         => $ConfigItem->{Name},
        DefinitionID => $DefinitionData->{DefinitionID},
        DeplStateID  => $ReverseDeplStateList{ $ConfigItem->{DeplState} },
        InciStateID  => $ReverseInciStateList{ $ConfigItem->{InciState} },
        XMLData      => $XMLData,
        UserID       => $Self->{UserID},
    );

    # sanity checks
    $Self->True(
        $ConfigItemID,
        "Added ConfigItem $ConfigItemID",
    );

    my $VersionInfo = $ConfigItemObject->VersionGet(
        ConfigItemID => $ConfigItemID,
    );

    $Self->IsNotDeeply(
        $VersionInfo,
        {},
        "Added ConfigItem $ConfigItemID - Version is not an empty hash",
    );

    # remember the config item
    if ($ConfigItemID) {
        $AddedConfigItems{$ConfigItemID} = $ClonedConfigItem;
        push @AddedConfigItemIDs, $ConfigItemID;
    }
}

# actual tests for ConfigItemGet operation
my @Tests = (
    {
        Name           => 'Empty Request',
        SuccessRequest => 1,
        SuccessGet     => 0,
        RequestData    => {},
        ExpectedData   => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemGet.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemGet',
    },
    {
        Name           => 'Wrong ConfigItemID format',
        SuccessRequest => 1,
        SuccessGet     => 0,
        RequestData    => {
            ConfigItemID => {
                Test1 => 1,
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemGet.WrongStructure',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemGet',
    },
    {
        Name           => 'Wrong ConfigItemID',
        SuccessRequest => 1,
        SuccessGet     => 0,
        RequestData    => {
            ConfigItemID => 'NotExistent' . $RandomID,
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemGet.AccessDenied',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemGet',
    },
    {
        Name           => 'Wrong ConfigItemID Array',
        SuccessRequest => 1,
        SuccessGet     => 0,
        RequestData    => {
            ConfigItemID => [ 'NotExistent' . $RandomID, ],
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemGet.AccessDenied',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemGet',
    },
    {
        Name           => 'Correct ConfigItemID 1',
        SuccessRequest => 1,
        SuccessGet     => 1,
        RequestData    => {
            ConfigItemID => $AddedConfigItemIDs[0],
        },
        ExpectedData => {},
        Operation    => 'ConfigItemGet',
    },
    {
        Name           => 'Correct ConfigItemID 2',
        SuccessRequest => 1,
        SuccessGet     => 1,
        RequestData    => {
            ConfigItemID => $AddedConfigItemIDs[1],
        },
        ExpectedData => {},
        Operation    => 'ConfigItemGet',
    },
    {
        Name           => 'Correct ConfigItemID 3',
        SuccessRequest => 1,
        SuccessGet     => 1,
        RequestData    => {
            ConfigItemID => $AddedConfigItemIDs[2],
        },
        ExpectedData => {},
        Operation    => 'ConfigItemGet',
    },
    {
        Name           => 'Correct ConfigItemID 4',
        SuccessRequest => 1,
        SuccessGet     => 1,
        RequestData    => {
            ConfigItemID => $AddedConfigItemIDs[3],
        },
        ExpectedData => {},
        Operation    => 'ConfigItemGet',
    },
    {
        Name           => 'Correct ConfigItemID 5',
        SuccessRequest => 1,
        SuccessGet     => 1,
        RequestData    => {
            ConfigItemID => $AddedConfigItemIDs[4],
        },
        ExpectedData => {},
        Operation    => 'ConfigItemGet',
    },
    {
        Name           => 'Correct ConfigItemID 6',
        SuccessRequest => 1,
        SuccessGet     => 1,
        RequestData    => {
            ConfigItemID => $AddedConfigItemIDs[5],
        },
        ExpectedData => {},
        Operation    => 'ConfigItemGet',
    },
    {
        Name           => 'Correct ConfigItemID 1-6',
        SuccessRequest => 1,
        SuccessGet     => 1,
        RequestData    => {
            ConfigItemID => \@AddedConfigItemIDs,
        },
        ExpectedData => {},
        Operation    => 'ConfigItemGet',
    },
);

for my $Test (@Tests) {

    # create local object
    my $LocalObject = "Kernel::GenericInterface::Operation::ConfigItem::$Test->{Operation}"->new(
        DebuggerObject => $DebuggerObject,
        WebserviceID   => $WebserviceID,
    );

    $Self->Is(
        "Kernel::GenericInterface::Operation::ConfigItem::$Test->{Operation}",
        ref $LocalObject,
        "$Test->{Name} - Create local object",
    );

    # start requester with our webservice
    my $LocalResult = $LocalObject->Run(
        WebserviceID => $WebserviceID,
        Invoker      => $Test->{Operation},
        Data         => {
            UserLogin => $UserLogin,
            Password  => $Password,
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
    my $RequesterObject = $Kernel::OM->Get('Kernel::GenericInterface::Requester');
    $Self->Is(
        'Kernel::GenericInterface::Requester',
        ref $RequesterObject,
        "$Test->{Name} - Create requester object",
    );

    # start requester with our webservice
    my $RequesterResult = $RequesterObject->Run(
        WebserviceID => $WebserviceID,
        Invoker      => $Test->{Operation},
        Data         => {
            SessionID => $NewSessionID,
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

    if ( $Test->{SuccessGet} ) {

        # local results
        $Self->IsNot(
            $LocalResult->{Data}->{ConfigItem},
            undef,
            "$Test->{Name} - Local result ConfigItem is not undefined.",
        );
        $Self->Is(
            ref $LocalResult->{Data}->{ConfigItem},
            'ARRAY',
            "$Test->{Name} - Local result ConfigItem reference.",
        );
        $Self->True(
            IsArrayRefWithData( $LocalResult->{Data}->{ConfigItem} ),
            "$Test->{Name} - Local result ConfigItem reference is not empty.",
        );
        $Self->Is(
            $LocalResult->{Data}->{Error},
            undef,
            "$Test->{Name} - Local result Error is undefined.",
        );

        # requester results
        $Self->IsNot(
            $RequesterResult->{Data}->{ConfigItem},
            undef,
            "$Test->{Name} - Requester result ConfigItem is not undefined.",
        );

        my $ExpectedResultType = ref $Test->{RequestData}->{ConfigItemID} || 'HASH';

        $Self->Is(
            ref $RequesterResult->{Data}->{ConfigItem},
            $ExpectedResultType,
            "$Test->{Name} - Requester result ConfigItem reference.",
        );

        if ( $ExpectedResultType eq 'ARRAY' ) {
            $Self->True(
                IsArrayRefWithData( $RequesterResult->{Data}->{ConfigItem} ),
                "$Test->{Name} - Requester result ConfigItem reference is not empty.",
            );
        }
        else {
            $Self->True(
                IsHashRefWithData( $RequesterResult->{Data}->{ConfigItem} ),
                "$Test->{Name} - Requester result ConfigItem reference is not empty.",
            );
        }
        $Self->Is(
            $RequesterResult->{Data}->{Error},
            undef,
            "$Test->{Name} - Requester result Error is undefined.",
        );

        if ( $ExpectedResultType eq 'ARRAY' ) {

            # loop all ConfigItemIDs in the response
            for my $Counter ( 0 .. scalar @{ $Test->{RequestData}->{ConfigItemID} } - 1 ) {

                # check specific attributes
                for my $Attribute (qw(CIXMLData Class DeplState InciState Name)) {
                    $Self->IsDeeply(
                        $LocalResult->{Data}->{ConfigItem}->[$Counter]->{$Attribute},
                        $AddedConfigItems{ $Test->{RequestData}->{ConfigItemID}->[$Counter] }
                            ->{$Attribute},
                        "$Test->{Name} - Local result match ConfigItem->[$Counter] $Attribute create"
                            . " data."
                    );
                }
            }
        }
        else {

            # check specific attributes for the only 1 result
            for my $Attribute (qw(CIXMLData Class DeplState InciState Name)) {
                $Self->IsDeeply(
                    $LocalResult->{Data}->{ConfigItem}->[0]->{$Attribute},
                    $AddedConfigItems{ $Test->{RequestData}->{ConfigItemID} }->{$Attribute},
                    "$Test->{Name} - Local result match ConfigItem $Attribute create data."
                );
            }

            # make Requester result an array for easy compare
            my $RequesterConfigItem = delete $RequesterResult->{Data}->{ConfigItem};
            $RequesterResult->{Data}->{ConfigItem} = [$RequesterConfigItem];
        }

        $Self->IsDeeply(
            $LocalResult,
            $RequesterResult,
            "$Test->{Name} - Local config item result matched with remote result.",
        );
    }

    # tests supposed to fail
    else {
        $Self->False(
            $LocalResult->{ConfigItem},
            "$Test->{Name} - Local result ConfigItemID with false.",
        );
        $Self->False(
            $LocalResult->{Number},
            "$Test->{Name} - Local result Number with false.",
        );
        $Self->Is(
            $LocalResult->{Data}->{Error}->{ErrorCode},
            $Test->{ExpectedData}->{Data}->{Error}->{ErrorCode},
            "$Test->{Name} - Local result ErrorCode matched with expected local call result.",
        );
        $Self->True(
            $LocalResult->{Data}->{Error}->{ErrorMessage},
            "$Test->{Name} - Local result ErrorMessage with true.",
        );
        $Self->IsNot(
            $LocalResult->{Data}->{Error}->{ErrorMessage},
            '',
            "$Test->{Name} - Local result ErrorMessage is not empty.",
        );
        $Self->Is(
            $LocalResult->{ErrorMessage},
            $LocalResult->{Data}->{Error}->{ErrorCode}
                . ': '
                . $LocalResult->{Data}->{Error}->{ErrorMessage},
            "$Test->{Name} - Local result ErrorMessage (outside Data hash) matched with concatenation"
                . " of ErrorCode and ErrorMessage within Data hash.",
        );

        # remove ErrorMessage parameter from direct call
        # result to be consistent with SOAP call result
        if ( $LocalResult->{ErrorMessage} ) {
            delete $LocalResult->{ErrorMessage};
        }

        # sanity check
        $Self->False(
            $LocalResult->{ErrorMessage},
            "$Test->{Name} - Local result ErroMessage (outsise Data hash) got removed to compare"
                . " local and remote tests.",
        );

        $Self->IsDeeply(
            $LocalResult,
            $RequesterResult,
            "$Test->{Name} - Local result matched with remote result.",
        );
    }
}    #end loop

# clean up

# clean up webservice
my $WebserviceDelete = $WebserviceObject->WebserviceDelete(
    ID     => $WebserviceID,
    UserID => $Self->{UserID},
);
$Self->True(
    $WebserviceDelete,
    "Deleted Webservice $WebserviceID",
);

for my $ConfigItemID ( sort keys %AddedConfigItems ) {

    # delete the ConfigItems
    my $SuccessDelete = $ConfigItemObject->ConfigItemDelete(
        ConfigItemID => $ConfigItemID,
        UserID       => $Self->{UserID},
    );

    # sanity check
    $Self->True(
        $SuccessDelete,
        "SuccessDelete() successful for ConfigItem ID $ConfigItemID",
    );
}

1;
