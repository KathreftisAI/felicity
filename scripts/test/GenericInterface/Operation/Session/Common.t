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
use Kernel::GenericInterface::Operation::Session::SessionCreate;

# get helper object
# skip SSL certificate verification
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        SkipSSLVerify   => 1,
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

my $RandomID = $Helper->GetRandomID();

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
    'DebuggerObject instantiate correctly',
);

# set user details
my $UserLogin    = $Helper->TestUserCreate();
my $UserPassword = $UserLogin;
my $UserID       = $Kernel::OM->Get('Kernel::System::User')->UserLookup(
    UserLogin => $UserLogin,
);

# set customer user details
my $CustomerUserLogin    = $Helper->TestCustomerUserCreate();
my $CustomerUserPassword = $CustomerUserLogin;
my $CustomerUserID       = $CustomerUserLogin;

# Tests for CreateSessionID
my @Tests = (
    {
        Name    => 'Empty',
        Data    => {},
        Success => 0,
    },
    {
        Name => 'UserLogin No Password',
        Data => {
            UserLogin => $UserLogin,
        },
        Success => 0,
    },
    {
        Name => 'CustomerUserLogin No Password',
        Data => {
            CustomerUserLogin => $CustomerUserLogin,
        },
        Success => 0,
    },
    {
        Name => 'Password No UserLogin',
        Data => {
            Password => $UserPassword,
        },
        Success => 0,
    },
    {
        Name => 'UserLogin Invalid Password',
        Data => {
            UserLogin => $UserLogin,
            Password  => $RandomID,
        },
        Success => 0,
    },
    {
        Name => 'CustomerUserLogin Invalid Password',
        Data => {
            CustomerUserLogin => $CustomerUserLogin,
            Password          => $RandomID,
        },
        Success => 0,
    },
    {
        Name => 'Invalid UserLogin Correct Password',
        Data => {
            UserLogin => $RandomID,
            Password  => $UserPassword,
        },
        Success => 0,
    },
    {
        Name => 'Invalid CustomerUserLogin Correct Password',
        Data => {
            CustomerUserLogin => $RandomID,
            Password          => $CustomerUserPassword,
        },
        Success => 0,
    },
    {
        Name => 'Correct UserLogin and Password',
        Data => {
            UserLogin => $UserLogin,
            Password  => $UserPassword,
        },
        Success => 1,
    },
    {
        Name => 'Correct CustomerUserLogin and Password',
        Data => {
            CustomerUserLogin => $CustomerUserLogin,
            Password          => $CustomerUserPassword,
        },
        Success => 1,
    },
);

# use a session operation instance to get access to the common functions
my $OperationObject = Kernel::GenericInterface::Operation::Session::SessionCreate->new(
    DebuggerObject => $DebuggerObject,
    WebserviceID   => $WebserviceID,
);
$Self->Is(
    ref $OperationObject,
    'Kernel::GenericInterface::Operation::Session::SessionCreate',
    'CommonObject instantiate correctly',
);

for my $Test (@Tests) {
    my $SessionID = $OperationObject->CreateSessionID(
        Data => $Test->{Data},
    );

    if ( $Test->{Success} ) {
        $Self->IsNot(
            $SessionID,
            undef,
            "GerSessionID() - $Test->{Name}",
        );
    }

    else {
        $Self->Is(
            $SessionID,
            undef,
            "GerSessionID() - $Test->{Name}",
        );
    }
}

# cleanup is done by RestoreDatabase.

1;
