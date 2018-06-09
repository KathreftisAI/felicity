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

use MIME::Base64;

use Kernel::GenericInterface::Debugger;
use Kernel::GenericInterface::Operation::ConfigItem::ConfigItemCreate;
use Kernel::GenericInterface::Operation::ConfigItem::ConfigItemUpdate;
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
            ConfigItemUpdate => {
                Type => 'ConfigItem::ConfigItemUpdate',
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
            ConfigItemCreate => {
                Type => 'Test::TestSimple',
            },
            ConfigItemUpdate => {
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

# create a new config item with the basic options
my $ConfigItem = {
    Class     => 'Computer',
    Name      => 'TestCI' . $RandomID,
    DeplState => 'Production',
    InciState => 'Incident',
    CIXMLData => {
        NIC => {
            NIC        => 'Lo0',
            IPoverDHCP => 'No',
        },
    },
};

# create local object
my $ConfigItemCreateObject = Kernel::GenericInterface::Operation::ConfigItem::ConfigItemCreate->new(
    DebuggerObject => $DebuggerObject,
    WebserviceID   => $WebserviceID,
);

# start requester with our webservice
my $CreateResult = $ConfigItemCreateObject->Run(
    WebserviceID => $WebserviceID,
    Invoker      => 'ConfigItemCreate',
    Data         => {
        UserLogin  => $UserLogin,
        Password   => $Password,
        ConfigItem => $ConfigItem,
    },
);

my $ConfigItemID = $CreateResult->{Data}->{ConfigItemID} || '';

$Self->True(
    $ConfigItemID,
    "Added ConfigItem $ConfigItemID - $CreateResult->{Data}->{Number}",
);

# actual tests
my @Tests = (
    {
        Name           => 'Empty Request',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {},
        ExpectedData   => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Invalid ConfigItem',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItem => 1,
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing ConfigItemID',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItem => {
                Test => 1,
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Invalid ConfigItemID',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => 'NotExisitng' . $RandomID,
            ConfigItem   => {
                Test => 1,
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing CIXMLData',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Test => 1,
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Invalid CIXMLData',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                CIXMLData => 1,
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing Class',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                CIXMLData => {
                    Test => 1,
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing Name',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                CIXMLData => {
                    Test => 1,
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing DeplState',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                CIXMLData => {
                    Test => 1,
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing InciState',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                CIXMLData => {
                    Test => 1,
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Wrong Class',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'NotExisitng' . $RandomID,
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    Test => 1,
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Wrong DeplState',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production' . $RandomID,
                InciState => 'Incident',
                CIXMLData => {
                    Test => 1,
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Wrong InciState',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident' . $RandomID,
                CIXMLData => {
                    Test => 1,
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing NIC->NIC',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    NIC => {
                        Test => 1,
                        }
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing NIC->IpOverDHCP',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    NIC => {
                        NIC => 'Eth0',
                        }
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing NIC->NIC in array',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    NIC => [
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No',
                        },
                        {
                            IPoverDHCP => 'No',
                        },
                    ],
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing NIC->IpOverDHCP in array',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    NIC => [
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No',
                        },
                        {
                            NIC => 'Eth0',
                        },
                    ],
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Wrong NIC->IpOverDHCP General Catalog in Hash',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    NIC => {
                        NIC        => 'Eth0',
                        IPoverDHCP => 'No' . $RandomID,
                    },
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Wrong NIC->IpOverDHCP General Catalog in Array Hash',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    NIC => [
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No',
                        },
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No' . $RandomID,
                        },
                    ],
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Wrong Vendor Long Text ',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    Vendor => 'a' x 51,
                    NIC    => [
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No',
                        },
                        {
                            NIC        => 'Eth1',
                            IPoverDHCP => 'Yes',
                        },
                    ],
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Wrong WarrantyExpirationDate Date',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    Vendor => 'Torero Chips',
                    NIC    => [
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No',
                        },
                        {
                            NIC        => 'Eth1',
                            IPoverDHCP => 'Yes',
                        },
                    ],
                    WarrantyExpirationDate => '1930-30-30',
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Wrong Owner Customer',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    Vendor => 'Torero Chips',
                    NIC    => [
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No',
                        },
                        {
                            NIC        => 'Eth1',
                            IPoverDHCP => 'Yes',
                        },
                    ],
                    WarrantyExpirationDate => '1977-12-12',
                    Owner                  => $TestCustomerUserLogin . $RandomID,
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Wrong Ram Too Many',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    Vendor => 'Torero Chips',
                    NIC    => [
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No',
                        },
                        {
                            NIC        => 'Eth1',
                            IPoverDHCP => 'Yes',
                        },
                    ],
                    WarrantyExpirationDate => '1977-12-12',
                    Owner                  => $TestCustomerUserLogin,
                    Ram                    => [
                        1,
                        2,
                        3,
                        4,
                        5,
                        6,
                        7,
                        8,
                        9,
                        10,
                        11,
                    ],
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Wrong Attachment',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    Vendor => 'Torero Chips',
                    NIC    => [
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No',
                        },
                        {
                            NIC        => 'Eth1',
                            IPoverDHCP => 'Yes',
                        },
                    ],
                    WarrantyExpirationDate => '1977-12-12',
                    Owner                  => $TestCustomerUserLogin,
                    Ram                    => [
                        4000,
                        4000,
                    ],
                },
                Attachment => 1,
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing Attachment->Content',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    Vendor => 'Torero Chips',
                    NIC    => [
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No',
                        },
                        {
                            NIC        => 'Eth1',
                            IPoverDHCP => 'Yes',
                        },
                    ],
                    WarrantyExpirationDate => '1977-12-12',
                    Owner                  => $TestCustomerUserLogin,
                    Ram                    => [
                        4000,
                        4000,
                    ],
                },
                Attachment => [
                    {
                        Test => 1,
                    },
                ],
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing Attachment->ContentType',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    Vendor => 'Torero Chips',
                    NIC    => [
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No',
                        },
                        {
                            NIC        => 'Eth1',
                            IPoverDHCP => 'Yes',
                        },
                    ],
                    WarrantyExpirationDate => '1977-12-12',
                    Owner                  => $TestCustomerUserLogin,
                    Ram                    => [
                        4000,
                        4000,
                    ],
                },
                Attachment => [
                    {
                        Content => 'VGhpcyBpcyBhbiBlbmNvZGVkIHRleHQ=',
                    },
                ],
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Missing Attachment->Filename',
        SuccessRequest => 1,
        SuccessUpdate  => 0,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'TestCI' . $RandomID,
                DeplState => 'Production',
                InciState => 'Incident',
                CIXMLData => {
                    Vendor => 'Torero Chips',
                    NIC    => [
                        {
                            NIC        => 'Eth0',
                            IPoverDHCP => 'No',
                        },
                        {
                            NIC        => 'Eth1',
                            IPoverDHCP => 'Yes',
                        },
                    ],
                    WarrantyExpirationDate => '1977-12-12',
                    Owner                  => $TestCustomerUserLogin,
                    Ram                    => [
                        4000,
                        4000,
                    ],
                },
                Attachment => [
                    {
                        Content     => 'VGhpcyBpcyBhbiBlbmNvZGVkIHRleHQ=',
                        ContentType => 'text/plain',
                    },
                ],
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemUpdate.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemUpdate',
    },
    {
        Name           => 'Correct ConfigItem',
        SuccessRequest => 1,
        SuccessUpdate  => 1,
        RequestData    => {
            ConfigItemID => $ConfigItemID,
            ConfigItem   => {
                Class     => 'Computer',
                Name      => 'Test' . $RandomID,
                DeplState => 'Production',
                InciState => 'Operational',
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
                        '4000',
                        '2000',
                    ],
                    HardDisk => {
                        HardDisk => '/dev',
                        Capacity => '50000',
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
                    GraphicAdapter         => 'ATI Radeon 300',
                    WarrantyExpirationDate => '1977-12-12',
                    InstallDate            => '1977-12-12',
                    Note                   => 'This is a Demo CI',
                },
            },
        },
        ExpectedData => {},
        Operation    => 'ConfigItemUpdate',
    },
);

# start testing
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

    # make a deep copy to avoid changing the definition
    my $ClonedRequestData = Storable::dclone( $Test->{RequestData} );

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

    # restore cloned data
    $Test->{RequestData} = $ClonedRequestData;

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
        "$Test->{Name} - Update requester object",
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

    # tests supposed to succeed
    if ( $Test->{SuccessUpdate} ) {

        # local results
        $Self->True(
            $LocalResult->{Data}->{ConfigItemID},
            "$Test->{Name} - Local result ConfigItemID with True.",
        );
        $Self->True(
            $LocalResult->{Data}->{Number},
            "$Test->{Name} - Local result Number with True.",
        );
        $Self->Is(
            $LocalResult->{Data}->{Error},
            undef,
            "$Test->{Name} - Local result Error is undefined.",
        );

        # requester results
        $Self->True(
            $RequesterResult->{Data}->{ConfigItemID},
            "$Test->{Name} - Requester result ConfigItemID with True.",
        );
        $Self->True(
            $RequesterResult->{Data}->{Number},
            "$Test->{Name} - Requester result Number with True.",
        );
        $Self->Is(
            $RequesterResult->{Data}->{Error},
            undef,
            "$Test->{Name} - Requester result Error is undefined.",
        );

        # get the ConfigItem entry (from local result)
        my $LocalVersionData = $ConfigItemObject->VersionGet(
            ConfigItemID => $LocalResult->{Data}->{ConfigItemID},
            UserID       => 1,
        );

        $Self->True(
            IsHashRefWithData($LocalVersionData),
            "$Test->{Name} - created local version strcture with True.",
        );

        # get the config item entry (from requester result)
        my $RequesterVersionData = $ConfigItemObject->VersionGet(
            ConfigItemID => $RequesterResult->{Data}->{ConfigItemID},
            UserID       => 1,
        );

        $Self->True(
            IsHashRefWithData($RequesterVersionData),
            "$Test->{Name} - created requester config item strcture with True.",
        );

        # check config item attributes as defined in the test
        for my $Attribute (qw(Number Class Name InciState DeplState DeplStateType)) {
            if ( $Test->{RequestData}->{ConfigItem}->{$Attribute} ) {
                $Self->Is(
                    $LocalVersionData->{$Attribute},
                    $Test->{RequestData}->{ConfigItem}->{$Attribute},
                    "$Test->{Name} - local ConfigItem->$Attribute" . " match test definition.",
                );
            }
        }

        # transform XML data to a comparable format
        my $Definition = $LocalVersionData->{XMLDefinition};

        # make a deep copy to avoid changing the result
        my $ClonedXMLData = Storable::dclone( $LocalVersionData->{XMLData} );

        my $FormatedXMLData = $LocalObject->InvertFormatXMLData(
            XMLData => $ClonedXMLData->[1]->{Version},
        );

        my $ReplacedXMLData = $LocalObject->InvertReplaceXMLData(
            XMLData    => $FormatedXMLData,
            Definition => $Definition,
        );

        # compare XML data
        $Self->IsDeeply(
            $ReplacedXMLData,
            $Test->{RequestData}->{ConfigItem}->{CIXMLData},
            "$Test->{Name} - local ConfigItem->CIXMLData match test definition.",
        );

        # check attachments
        if ( defined $Test->{RequestData}->{Attachment} ) {
            my @AttachmentList = $ConfigItemObject->ConfigItemAttachmentList(
                ConfigItemID => $RequesterResult->{Data}->{ConfigItemID},
            );

            my @Attachments;
            ATTACHMENT:
            for my $FileName (@AttachmentList) {
                next ATTACHMENT if !$FileName;

                my $Attachment = $ConfigItemObject->ConfigItemAttachmentGet(
                    ConfigItemID => $RequesterResult->{Data}->{ConfigItemID},
                    Filename     => $FileName,
                );

                # next if not attachment
                next ATTACHMENT if !IsHashRefWithData($Attachment);

                # convert content to base64
                $Attachment->{Content} = encode_base64( $Attachment->{Content}, '' );

                # delete not needed attibutes
                for my $Attribute (qw(Preferences Filesize Type)) {
                    delete $Attachment->{$Attribute};
                }
                push @Attachments, $Attachment;
            }

            my @RequestedAttachments;
            if ( ref $Test->{RequestData}->{Attachment} eq 'HASH' ) {
                push @RequestedAttachments, $Test->{RequestData}->{ConfigItem}->{Attachment};
            }
            else {
                @RequestedAttachments = @{ $Test->{RequestData}->{ConfigItem}->{Attachment} };
            }

            $Self->IsDeeply(
                \@Attachments,
                \@RequestedAttachments,
                "$Test->{Name} - local ConfigItem->Attachment match test definition.",
            );
        }

        $Self->IsDeeply(
            $LocalVersionData,
            $RequesterVersionData,
            "$Test->{Name} - Local config item result matched with remote result.",
        );
    }

    # tests supposed to fail
    else {
        $Self->False(
            $LocalResult->{ConfigItemID},
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
}

# clean up config items
my $ConfigItemDelete = $ConfigItemObject->ConfigItemDelete(
    ConfigItemID => $ConfigItemID,
    UserID       => 1,
);

# sanity check
$Self->True(
    $ConfigItemDelete,
    "ConfigItemDelete() successful for ConfigItem ID $ConfigItemID",
);

# clean up webservice
my $WebserviceDelete = $WebserviceObject->WebserviceDelete(
    ID     => $WebserviceID,
    UserID => 1,
);
$Self->True(
    $WebserviceDelete,
    "Deleted Webservice $WebserviceID",
);

1;
