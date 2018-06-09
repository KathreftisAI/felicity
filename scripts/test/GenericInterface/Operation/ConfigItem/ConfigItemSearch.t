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
use Kernel::GenericInterface::Operation::ConfigItem::ConfigItemSearch;
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
            ConfigItemSearch => {
                Type => 'ConfigItem::ConfigItemSearch',
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
            ConfigItemSearch => {
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
my @AddedConfigItemIDs;

# ConfigItem settings
my @ConfigItems = (
    {
        Class     => 'Computer',
        Name      => 'TestCI-1-' . $RandomID,
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
            CPU             => 'Intel Core i3' . $RandomID,
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
        Class     => 'Computer',
        Name      => 'TestCI-2-' . $RandomID,
        DeplState => 'Repair',
        InciState => 'Incident',
        CIXMLData => {
            Vendor          => 'Apple',
            Model           => 'iMac',
            Description     => 'Apple Computer',
            Type            => 'Desktop',
            Owner           => $TestCustomerUserLogin,
            SerialNumber    => 'abc12345abc',
            OperatingSystem => 'OSX 10.8.3',
            CPU             => 'Intel Core i3' . $RandomID,
            Ram             => [
                4000,
                2000,
            ],
            HardDisk => {
                HardDisk => '/dev',
                Capacity => 80000,
            },
            FQDN => 'hots.example.com',
            NIC  => [
                {
                    NIC        => 'En0',
                    IPoverDHCP => 'Yes',
                    IPAddress  => '192.168.30.1',
                },
                {
                    NIC        => 'En1',
                    IPoverDHCP => 'Yes',
                    IPAddress  => '200.34.56.78',
                },
            ],
            GraphicAdapter => 'nvidia',
            InstallDate    => '2012-12-12',
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
        Class     => 'Software',
        Name      => 'TestCI-3-' . $RandomID,
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
    {
        Class     => 'Software',
        Name      => 'TestCI-4-' . $RandomID,
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
                    Quantity       => '4',
                    ExpirationDate => '1977-12-12',
                },
                {
                    LicenceKey     => '4567',
                    Quantity       => '3',
                    ExpirationDate => '1977-12-25',
                },
            ],
            Media => 'CD-ROM',
            Note  => 'This is a test CI',
        },
    },
);

# create local object
my $ConfigItemCreateObject = Kernel::GenericInterface::Operation::ConfigItem::ConfigItemCreate->new(
    DebuggerObject => $DebuggerObject,
    WebserviceID   => $WebserviceID,
);

for my $ConfigItem (@ConfigItems) {

    # make a deep copy to avoid changing the definition
    my $ClonedConfigItem = Storable::dclone($ConfigItem);

    # start requester with our webservice
    # add new ConfigItems
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

    # sanity checks
    $Self->True(
        $ConfigItemID,
        "Added ConfigItem $ConfigItemID - $CreateResult->{Data}->{Number}",
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
        push @AddedConfigItemIDs, $ConfigItemID;
    }
}

# actual tests for ConfigItemSearch operation
my @Tests = (
    {
        Name           => 'Empty Request',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {},
        ExpectedData   => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Missing ConfigItem',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            Test => 1
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Wrong ConfigItem format',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => 1
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Missing ConfigItem->Class',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Test => 1,
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.MissingParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->Class',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class => 'NonExisting' . $RandomID,
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->CIXMLData',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class     => 'Computer',
                CIXMLData => 1,
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->InciStates',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class      => 'Computer',
                InciStates => 'NotExistsning' . $RandomID,
                CIXMLData  => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->InciStates HASH',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class      => 'Computer',
                InciStates => {
                    Test => 1,
                },
                CIXMLData => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.WrongStructure',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->InciStates ARRAY',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class      => 'Computer',
                InciStates => [ 'Incident', 'NotExistsning' . $RandomID ],
                CIXMLData  => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->DeplStates',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class      => 'Computer',
                InciStates => [ 'Incident', 'Warning' ],
                DeplStates => 'NotExistsning' . $RandomID,
                CIXMLData  => {
                    'NotExistsning' . $RandomID => 1,
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->DeplStates HASH',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class      => 'Computer',
                InciStates => [ 'Incident', 'Warning' ],
                DeplStates => {
                    Test => 1,
                },
                CIXMLData => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.WrongStructure',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->DeplStates ARRAY',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class      => 'Computer',
                InciStates => [ 'Incident', 'Warning' ],
                DeplStates => [ 'Production', 'NotExistsning' . $RandomID ],
                CIXMLData  => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->OrderBy HASH',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class      => 'Computer',
                InciStates => [ 'Incident', 'Warning' ],
                DeplStates => [ 'Production', 'Retired' ],
                OrderBy    => {
                    Test => 1,
                },
                CIXMLData => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.WrongStructure',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->OrderByDirection HASH',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class            => 'Computer',
                InciStates       => [ 'Incident', 'Warning' ],
                DeplStates       => [ 'Production', 'Retired' ],
                OrderBy          => ['Number'],
                OrderByDirection => {
                    Test => 1,
                },
                CIXMLData => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.WrongStructure',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->CreateTimeNewerDate',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class                         => 'Computer',
                InciStates                    => [ 'Incident', 'Warning' ],
                DeplStates                    => [ 'Production', 'Retired' ],
                OrderBy                       => ['Number'],
                OrderByDirection              => ['Down'],
                ConfigItemCreateTimeNewerDate => '2012-02-30',
                CIXMLData                     => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->CreateTimeOlderDate',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class                         => 'Computer',
                InciStates                    => [ 'Incident', 'Warning' ],
                DeplStates                    => [ 'Production', 'Retired' ],
                OrderBy                       => ['Number'],
                OrderByDirection              => ['Down'],
                ConfigItemCreateTimeNewerDate => '2012-12-12',
                ConfigItemCreateTimeOlderDate => '2012-02-30',
                CIXMLData                     => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->ChangeTimeNewerDate',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class                         => 'Computer',
                InciStates                    => [ 'Incident', 'Warning' ],
                DeplStates                    => [ 'Production', 'Retired' ],
                OrderBy                       => ['Number'],
                OrderByDirection              => ['Down'],
                ConfigItemCreateTimeNewerDate => '2012-12-12',
                ConfigItemCreateTimeOlderDate => '2012-12-12',
                ConfigItemChangeTimeNewerDate => '2012-02-30',
                CIXMLData                     => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->ChangeTimeOlderDate',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class                         => 'Computer',
                InciStates                    => [ 'Incident', 'Warning' ],
                DeplStates                    => [ 'Production', 'Retired' ],
                OrderBy                       => ['Number'],
                OrderByDirection              => ['Down'],
                ConfigItemCreateTimeNewerDate => '2012-12-12',
                ConfigItemCreateTimeOlderDate => '2012-12-12',
                ConfigItemChangeTimeNewerDate => '2012-12-12',
                ConfigItemChangeTimeOlderDate => '2012-02-30',
                CIXMLData                     => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid ConfigItem->Limit',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class                         => 'Computer',
                InciStates                    => [ 'Incident', 'Warning' ],
                DeplStates                    => [ 'Production', 'Retired' ],
                OrderBy                       => ['Number'],
                OrderByDirection              => ['Down'],
                ConfigItemCreateTimeNewerDate => '2012-12-12',
                ConfigItemCreateTimeOlderDate => '2012-12-12',
                ConfigItemChangeTimeNewerDate => '2012-12-12',
                ConfigItemChangeTimeOlderDate => '2012-12-12',
                Limit                         => 'Unlimited',
                CIXMLData                     => {
                    'NotExistsning' . $RandomID => 1
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid CIXMLData General Catalog',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class                         => 'Computer',
                InciStates                    => [ 'Incident', 'Warning' ],
                DeplStates                    => [ 'Production', 'Retired' ],
                OrderBy                       => ['Number'],
                OrderByDirection              => ['Down'],
                ConfigItemCreateTimeNewerDate => '2012-12-12',
                ConfigItemCreateTimeOlderDate => '2012-12-12',
                ConfigItemChangeTimeNewerDate => '2012-12-12',
                ConfigItemChangeTimeOlderDate => '2012-12-12',
                Limit                         => 1,
                CIXMLData                     => {
                    NIC => {
                        IPoverDHCP => 1,
                    },
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid CIXMLData Date',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class                         => 'Computer',
                InciStates                    => [ 'Incident', 'Warning' ],
                DeplStates                    => [ 'Production', 'Retired' ],
                OrderBy                       => ['Number'],
                OrderByDirection              => ['Down'],
                ConfigItemCreateTimeNewerDate => '2012-12-12',
                ConfigItemCreateTimeOlderDate => '2012-12-12',
                ConfigItemChangeTimeNewerDate => '2012-12-12',
                ConfigItemChangeTimeOlderDate => '2012-12-12',
                Limit                         => 1,
                CIXMLData                     => {
                    NIC => {
                        IPoverDHCP => 'Yes',
                    },
                    InstallDate => '2012-02-30',
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid CIXMLData Text',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class                         => 'Software',
                InciStates                    => [ 'Incident', 'Warning' ],
                DeplStates                    => [ 'Production', 'Retired' ],
                OrderBy                       => ['Number'],
                OrderByDirection              => ['Down'],
                ConfigItemCreateTimeNewerDate => '2012-12-12',
                ConfigItemCreateTimeOlderDate => '2012-12-12',
                ConfigItemChangeTimeNewerDate => '2012-12-12',
                ConfigItemChangeTimeOlderDate => '2012-12-12',
                Limit                         => 1,
                CIXMLData                     => {
                    Vendor => 'a' x 51,
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Invalid CIXMLData Number',
        SuccessRequest => 1,
        SuccessSearch  => 0,
        RequestData    => {
            ConfigItem => {
                Class                         => 'Software',
                InciStates                    => [ 'Incident', 'Warning' ],
                DeplStates                    => [ 'Production', 'Retired' ],
                OrderBy                       => ['Number'],
                OrderByDirection              => ['Down'],
                ConfigItemCreateTimeNewerDate => '2012-12-12',
                ConfigItemCreateTimeOlderDate => '2012-12-12',
                ConfigItemChangeTimeNewerDate => '2012-12-12',
                ConfigItemChangeTimeOlderDate => '2012-12-12',
                Limit                         => 1,
                CIXMLData                     => {
                    Vendor     => 'a' x 50,
                    LicenceKey => {
                        Quantity => 'NotExisting' . $RandomID,
                    },
                },
            },
        },
        ExpectedData => {
            Data => {
                Error => {
                    ErrorCode => 'ConfigItemSearch.InvalidParameter',
                },
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Correct Computer No Limit',
        SuccessRequest => 1,
        SuccessSearch  => 1,
        RequestData    => {
            ConfigItem => {
                Class            => 'Computer',
                InciStates       => [ 'Incident', 'Warning' ],
                DeplStates       => [ 'Production', 'Retired', 'Repair' ],
                OrderBy          => ['Number'],
                OrderByDirection => ['Up'],
                CIXMLData        => {
                    CPU => 'Intel Core i3' . $RandomID,
                    NIC => {
                        IPoverDHCP => 'Yes',
                    },
                },
            },
        },
        ExpectedData => {
            Data => {
                ConfigItemIDs => [ $AddedConfigItemIDs[0], $AddedConfigItemIDs[1] ],
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Correct Computer Limit',
        SuccessRequest => 1,
        SuccessSearch  => 1,
        RequestData    => {
            ConfigItem => {
                Class            => 'Computer',
                InciStates       => [ 'Incident', 'Warning' ],
                DeplStates       => [ 'Production', 'Retired', 'Repair' ],
                OrderBy          => ['Number'],
                OrderByDirection => ['Up'],
                Limit            => 1,
                CIXMLData        => {
                    CPU => 'Intel Core i3' . $RandomID,
                    NIC => {
                        IPoverDHCP => 'Yes',
                    },
                },
            },
        },
        ExpectedData => {
            Data => {
                ConfigItemIDs => [ $AddedConfigItemIDs[0] ],
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
    },
    {
        Name           => 'Correct Software',
        SuccessRequest => 1,
        SuccessSearch  => 1,
        RequestData    => {
            ConfigItem => {
                Class            => 'Software',
                InciStates       => 'Operational',
                DeplStates       => 'Production',
                OrderBy          => ['Number'],
                OrderByDirection => ['Up'],
                CIXMLData        => {
                    Owner      => $TestCustomerUserLogin,
                    LicenceKey => {
                        Quantity => [ '3', '4' ],
                    },
                },
            },
        },
        ExpectedData => {
            Data => {
                ConfigItemIDs => [ $AddedConfigItemIDs[2], $AddedConfigItemIDs[3] ],
            },
            Success => 1,
        },
        Operation => 'ConfigItemSearch',
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

    if ( $Test->{SuccessSearch} ) {

        # local results
        $Self->IsNot(
            $LocalResult->{Data}->{ConfigItemIDs},
            undef,
            "$Test->{Name} - Local result ConfigItemIDs is not undefined.",
        );
        $Self->Is(
            ref $LocalResult->{Data}->{ConfigItemIDs},
            'ARRAY',
            "$Test->{Name} - Local result ConfigItemIDs reference.",
        );
        $Self->True(
            IsArrayRefWithData( $LocalResult->{Data}->{ConfigItemIDs} ),
            "$Test->{Name} - Local result ConfigItem is a non emptry array with true.",
        );
        $Self->Is(
            $LocalResult->{Data}->{Error},
            undef,
            "$Test->{Name} - Local result Error is undefined.",
        );

        # requester results
        $Self->IsNot(
            $RequesterResult->{Data}->{ConfigItemIDs},
            undef,
            "$Test->{Name} - Requester result ConfigItemIDs is not undefined.",
        );

        if ( ref $RequesterResult->{Data}->{ConfigItemIDs} eq 'ARRAY' ) {
            $Self->True(
                IsArrayRefWithData( $RequesterResult->{Data}->{ConfigItemIDs} ),
                "$Test->{Name} - Requester result ConfigItemIDs is a non emptry array with true.",
            );
        }
        else {
            $Self->True(
                IsNumber( $RequesterResult->{Data}->{ConfigItemIDs} ),
                "$Test->{Name} - Requester result ConfigItemIDs is number with true.",
            );

            # make Requester result an array for easy compare
            my $RequesterConfigItemIDs = delete $RequesterResult->{Data}->{ConfigItemIDs};
            $RequesterResult->{Data}->{ConfigItemIDs} = [$RequesterConfigItemIDs];
        }

        $Self->IsDeeply(
            $LocalResult,
            $Test->{ExpectedData},
            "$Test->{Name} - Local result match expected data.",
        );

        $Self->IsDeeply(
            $LocalResult,
            $RequesterResult,
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

for my $ConfigItemID ( sort @AddedConfigItemIDs ) {

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
