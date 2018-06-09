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

use Storable;

use Kernel::System::AuthSession;

# get needed objects
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# get home directory
my $HomeDir = $ConfigObject->Get('Home');

# get all available backend modules
my @BackendModuleFiles = $MainObject->DirectoryRead(
    Directory => $HomeDir . '/Kernel/System/AuthSession/',
    Filter    => '*.pm',
    Silent    => 1,
);

# read sample data
my @SampleSessionFiles = $MainObject->DirectoryRead(
    Directory => $HomeDir . '/scripts/test/sample/AuthSession/',
    Filter    => '*',
);

my @SampleSessionData;
SESSIONFILE:
for my $SessionFile (@SampleSessionFiles) {

    # read data
    my $Content = $MainObject->FileRead(
        Location        => $SessionFile,
        Type            => 'Local',
        Mode            => 'binmode',
        DisableWarnings => 1,
    );

    next SESSIONFILE if !$Content;
    next SESSIONFILE if ref $Content ne 'SCALAR';

    # read data structure back from file dump, use block eval for safety reasons
    my $Session = eval { Storable::thaw( ${$Content} ) };
    delete $Session->{UserLastRequest};

    push @SampleSessionData, $Session;
}

MODULEFILE:
for my $ModuleFile (@BackendModuleFiles) {

    next MODULEFILE if !$ModuleFile;

    # extract module name
    my ($Module) = $ModuleFile =~ m{ \/+ ([a-zA-Z0-9]+) \.pm $ }xms;

    next MODULEFILE if !$Module;

    # Reset the AgentSessionLimitPriorWarning, AgentSessionLimit
    #   and AgentSessionPerUserLimit at the beginning for the different backend modules.
    $ConfigObject->Set(
        Key => 'AgentSessionLimitPriorWarning',
    );
    $ConfigObject->Set(
        Key   => 'AgentSessionLimit',
        Value => 100,
    );
    $ConfigObject->Set(
        Key   => 'AgentSessionPerUserLimit',
        Value => 20,
    );

    $ConfigObject->Set(
        Key   => 'SessionModule',
        Value => "Kernel::System::AuthSession::$Module",
    );

    my $SessionObject = Kernel::System::AuthSession->new();

    my $LongString = '';
    for my $Count ( 1 .. 2 ) {
        for ( 1 .. 5 ) {
            $LongString .= $LongString . " $_ abcdefghijklmnopqrstuvwxy1234567890äöüß\n";
        }
        my $Length = length($LongString);
        my $Size   = $Length;
        if ( $Size > ( 1024 * 1024 ) ) {
            $Size = sprintf "%.1f MBytes", ( $Size / ( 1024 * 1024 ) );
        }
        elsif ( $Size > 1024 ) {
            $Size = sprintf "%.1f KBytes", ( ( $Size / 1024 ) );
        }
        else {
            $Size = $Size . ' Bytes';
        }

        my %NewSessionData = (
            UserLogin                => 'root',
            UserEmail                => 'root@example.com',
            'LongStringNew' . $Count => $LongString,
            UserTest                 => 'SomeÄÖÜß.',
            UserType                 => 'User',
            SomeComplexData          => {                     # verify that complex data can be stored too
                'CaseSensitive' => 1,
            },
        );

        my $SessionID = $SessionObject->CreateSessionID(%NewSessionData);

        # tests
        $Self->True(
            $SessionID,
            "#$Module - CreateSessionID()",
        );

        my %NewSessionDataCheck = $SessionObject->GetSessionIDData( SessionID => $SessionID );
        delete $NewSessionDataCheck{UserChallengeToken};
        delete $NewSessionDataCheck{UserRemoteAddr};
        delete $NewSessionDataCheck{UserRemoteUserAgent};
        delete $NewSessionDataCheck{UserSessionStart};

        $Self->IsDeeply(
            \%NewSessionDataCheck,
            \%NewSessionData,
            "Initial session data",
        );

        my @Sessions = $SessionObject->GetAllSessionIDs();
        my %SessionList = map { $_ => 1 } @Sessions;
        $Self->True(
            $SessionList{$SessionID},
            "#$Module - SessionList - new session in list",
        );

        my %Data = $SessionObject->GetSessionIDData( SessionID => $SessionID );

        $Self->Is(
            $Data{UserLogin} || 0,
            'root',
            "#$Module - GetSessionIDData()",
        );

        my $Update = $SessionObject->UpdateSessionID(
            SessionID => $SessionID,
            Key       => 'LastScreenOverview',
            Value     => 'SomeInfo1234',
        );

        $Self->True(
            $Update,
            "#$Module - UpdateSessionID() - #1",
        );

        $Update = $SessionObject->UpdateSessionID(
            SessionID => $SessionID,
            Key       => 'Value0',
            Value     => 0,
        );

        $Self->True(
            $Update,
            "#$Module - UpdateSessionID() - Value0",
        );

        $Update = $SessionObject->UpdateSessionID(
            SessionID => $SessionID,
            Key       => 'Value1',
            Value     => 1,
        );

        $Self->True(
            $Update,
            "#$Module - UpdateSessionID() - Value1",
        );

        $Update = $SessionObject->UpdateSessionID(
            SessionID => $SessionID,
            Key       => "Value''",
            Value     => '',
        );

        $Self->True(
            $Update,
            "#$Module - UpdateSessionID() - Value''",
        );

        $Update = $SessionObject->UpdateSessionID(
            SessionID => $SessionID,
            Key       => "Value-undef",
            Value     => 'SomeValue',
        );

        $Self->True(
            $Update,
            "#$Module - UpdateSessionID() - Value-undef",
        );

        $Update = $SessionObject->UpdateSessionID(
            SessionID => $SessionID,
            Key       => 'LongString',
            Value     => "Some string with dyn. content: $Count",
        );

        $Self->True(
            $Update,
            "#$Module - UpdateSessionID() - Long dyn.",
        );

        $Update = $SessionObject->UpdateSessionID(
            SessionID => $SessionID,
            Key       => 'LongString' . $Count,
            Value     => $LongString,
        );

        $Self->True(
            $Update,
            "#$Module - UpdateSessionID() - Long ($Size)",
        );

        %Data = $SessionObject->GetSessionIDData( SessionID => $SessionID );

        $Self->Is(
            $Data{"UserTest"},
            'SomeÄÖÜß.',
            "#$Module - GetSessionIDData() - utf8",
        );

        $Self->Is(
            $Data{"Value0"},
            0,
            "#$Module - GetSessionIDData() - Value0 ($Data{ 'Value0' })",
        );

        $Self->Is(
            $Data{"Value1"},
            1,
            "#$Module - GetSessionIDData() - Value1 ($Data{ 'Value1' })",
        );

        $Self->Is(
            $Data{"Value''"},
            '',
            "#$Module - GetSessionIDData() - Value'' (" . $Data{"Value''"} . ")",
        );

        $Self->True(
            $Data{ "LongString" . $Count } eq $LongString,
            "#$Module - GetSessionIDData() - Long ($Size)",
        );

        $Self->True(
            $Data{ "LongStringNew" . $Count } eq $LongString,
            "#$Module - GetSessionIDData() - Long ($Size)",
        );

        $Self->Is(
            $Data{"LongString"},
            "Some string with dyn. content: $Count",
            "#$Module - GetSessionIDData() - Long dyn.",
        );

        $Update = $SessionObject->UpdateSessionID(
            SessionID => $SessionID,
            Key       => 'UserTest',
            Value     => 'カスタ äüöß.',
        );

        $Self->True(
            $Update,
            "#$Module - UpdateSessionID() - utf8",
        );

        %Data = $SessionObject->GetSessionIDData( SessionID => $SessionID );

        $Self->Is(
            $Data{"UserTest"} || '',
            'カスタ äüöß.',
            "#$Module - GetSessionIDData() - utf8",
        );

        # session reconnect 1
        $SessionObject = Kernel::System::AuthSession->new();

        %Data = $SessionObject->GetSessionIDData( SessionID => $SessionID );

        $Self->Is(
            $Data{"UserTest"},
            'カスタ äüöß.',
            "#$Module - GetSessionIDData() - reconnect 1 - utf8",
        );

        $Self->Is(
            $Data{"Value0"},
            0,
            "#$Module - GetSessionIDData() - reconnect 1 - Value0 ($Data{ 'Value0' })",
        );

        $Self->Is(
            $Data{"Value1"},
            1,
            "#$Module - GetSessionIDData() - reconnect 1 - Value1 ($Data{ 'Value1' })",
        );

        $Self->Is(
            $Data{"Value''"},
            '',
            "#$Module - GetSessionIDData() - reconnect 1 - Value'' (" . $Data{"Value''"} . ")",
        );

        $Update = $SessionObject->UpdateSessionID(
            SessionID => $SessionID,
            Key       => "Value-undef",
            Value     => undef,
        );

        # session reconnect 2
        $SessionObject = Kernel::System::AuthSession->new();

        %Data = $SessionObject->GetSessionIDData( SessionID => $SessionID );

        $Self->Is(
            $Data{"UserTest"},
            'カスタ äüöß.',
            "#$Module - GetSessionIDData() - reconnect 2 - utf8",
        );

        $Self->Is(
            $Data{"Value0"},
            0,
            "#$Module - GetSessionIDData() - reconnect 2 - Value0 ($Data{ 'Value0' })",
        );

        $Self->Is(
            $Data{"Value1"},
            1,
            "#$Module - GetSessionIDData() - reconnect 2 - Value1 ($Data{ 'Value1' })",
        );

        $Self->Is(
            $Data{"Value''"},
            '',
            "#$Module - GetSessionIDData() - reconnect 2 - Value'' (" . $Data{"Value''"} . ")",
        );

        $Self->Is(
            $Data{"Value-undef"},
            undef,
            "#$Module - GetSessionIDData() - reconnect 2 - Value-undef (undef)",
        );

        my $Remove = $SessionObject->RemoveSessionID( SessionID => $SessionID );

        $Self->True(
            $Remove,
            "#$Module - RemoveSessionID()",
        );
    }

    my $CleanUp = $SessionObject->CleanUp();

    $Self->True(
        $CleanUp,
        "#$Module - CleanUp()",
    );

    my @Session = $SessionObject->GetAllSessionIDs();

    $Self->Is(
        scalar @Session,
        0,
        "#$Module - SessionList() no sessions left",
    );

    SESSION:
    for my $Session (@SampleSessionData) {

        next SESSION if !$Session;
        next SESSION if ref $Session ne 'HASH';
        next SESSION if !%{$Session};

        # create session
        my $RealSessionID = $SessionObject->CreateSessionID( %{$Session} );

        # test if session was successfully created
        $Self->True(
            $RealSessionID,
            "#$Module - CreateSessionID()",
        );

        my %RealSessionData = $SessionObject->GetSessionIDData( SessionID => $RealSessionID );

        for my $Key (qw(UserChallengeToken UserRemoteAddr UserRemoteUserAgent UserSessionStart)) {
            delete $RealSessionData{$Key};
            delete $Session->{$Key};
        }

        $Self->IsDeeply(
            \%RealSessionData,
            $Session,
            "Real session data check",
        );
    }

    my @ExpiredSessionIDs = $SessionObject->GetExpiredSessionIDs();
    $Self->Is(
        scalar @{ $ExpiredSessionIDs[0] },
        0,
        'No expired Session IDs',
    );

    $Self->Is(
        scalar @{ $ExpiredSessionIDs[1] },
        0,
        'No Session IDs idle for too long',
    );

    $CleanUp = $SessionObject->CleanUp();

    $Self->True(
        $CleanUp,
        "#$Module - CleanUp()",
    );

    @Session = $SessionObject->GetAllSessionIDs();

    $Self->Is(
        scalar @Session,
        0,
        "#$Module - SessionList() no sessions left",
    );

    # Some special tests for the possible agent session limits.
    my $AgentSessionLimitPriorWarningMessage = $SessionObject->CheckAgentSessionLimitPriorWarning();

    $Self->False(
        $AgentSessionLimitPriorWarningMessage,
        "#$Module - CheckAgentSessionLimitPriorWarning() - AgentSessionLimitPriorWarning not active",
    );

    for my $Count ( 1 .. 2 ) {

        my %NewSessionData = (
            UserLogin => 'root' . $Count,
            UserType  => 'User',
        );

        my $SessionID = $SessionObject->CreateSessionID(%NewSessionData);

        $Self->True(
            $SessionID,
            "#$Module - CreateSessionID()",
        );
    }

    $ConfigObject->Set(
        Key   => 'AgentSessionPerUserLimit',
        Value => 1,
    );
    $ConfigObject->Set(
        Key   => 'AgentSessionLimitPriorWarning',
        Value => 1,
    );

    # Reset the session object, to get the new config settings.
    $SessionObject = Kernel::System::AuthSession->new();

    $AgentSessionLimitPriorWarningMessage = $SessionObject->CheckAgentSessionLimitPriorWarning();

    $Self->True(
        $AgentSessionLimitPriorWarningMessage,
        "#$Module - CheckAgentSessionLimitPriorWarning() - AgentSessionLimitPriorWarning reached",
    );

    my $SessionID = $SessionObject->CreateSessionID(
        UserLogin => 'root1',
        UserType  => 'User',
    );

    $Self->False(
        $SessionID,
        "#$Module - CreateSessionID() - AgentSessionPerUserLimit reached",
    );

    my $CreateSessionIDErrorMessage = $SessionObject->SessionIDErrorMessage();

    $Self->Is(
        $CreateSessionIDErrorMessage,
        'Session per user limit reached!',
        "#$Module - CreateSessionID() - AgentSessionLimit error message",
    );

    $ConfigObject->Set(
        Key   => 'AgentSessionLimit',
        Value => 2,
    );

    # Reset the session object, to get the new config settings.
    $SessionObject = Kernel::System::AuthSession->new();

    $SessionID = $SessionObject->CreateSessionID(
        UserLogin => 'limit-reached',
        UserType  => 'User',
    );

    $Self->False(
        $SessionID,
        "#$Module - CreateSessionID() - AgentSessionLimit reached",
    );

    $CreateSessionIDErrorMessage = $SessionObject->SessionIDErrorMessage();

    $Self->Is(
        $CreateSessionIDErrorMessage,
        'Session limit reached! Please try again later.',
        "#$Module - CreateSessionID() - AgentSessionLimit error message",
    );

    $CleanUp = $SessionObject->CleanUp();

    $Self->True(
        $CleanUp,
        "#$Module - CleanUp after session limit tests()",
    );

    # Test the speical otrs business values from the cloudservice.
    # First reset the config and session object
    #   and generate some dummy data in the system data.
    $ConfigObject->Set(
        Key => 'AgentSessionLimitPriorWarning',
    );
    $ConfigObject->Set(
        Key   => 'AgentSessionLimit',
        Value => 100,
    );
    $ConfigObject->Set(
        Key   => 'AgentSessionPerUserLimit',
        Value => 20,
    );
    $SessionObject = Kernel::System::AuthSession->new();

    my $SystemDataObject = $Kernel::OM->Get('Kernel::System::SystemData');

    my %OTRSBusinessAgentSessionLimits = (
        AgentSessionLimit             => 3,
        AgentSessionLimitPriorWarning => 1,
    );

    for my $Key ( sort keys %OTRSBusinessAgentSessionLimits ) {
        my $FullKey = 'OTRSBusiness::' . $Key;

        if ( defined $SystemDataObject->SystemDataGet( Key => $FullKey ) ) {
            $SystemDataObject->SystemDataUpdate(
                Key    => $FullKey,
                Value  => $OTRSBusinessAgentSessionLimits{$Key},
                UserID => 1,
            );
        }
        else {
            $SystemDataObject->SystemDataAdd(
                Key    => $FullKey,
                Value  => $OTRSBusinessAgentSessionLimits{$Key},
                UserID => 1,
            );
        }
    }

    $SessionID = $SessionObject->CreateSessionID(
        UserLogin => 'root',
        UserType  => 'User',
    );

    $Self->True(
        $SessionID,
        "#$Module - CreateSessionID()",
    );

    $AgentSessionLimitPriorWarningMessage = $SessionObject->CheckAgentSessionLimitPriorWarning();

    $Self->False(
        $AgentSessionLimitPriorWarningMessage,
        "#$Module - CheckAgentSessionLimitPriorWarning() - OTRSBusiness - AgentSessionLimitPriorWarning not reached",
    );

    for my $Count ( 1 .. 2 ) {

        my %NewSessionData = (
            UserLogin => 'root' . $Count,
            UserType  => 'User',
        );

        my $SessionID = $SessionObject->CreateSessionID(%NewSessionData);

        $Self->True(
            $SessionID,
            "#$Module - CreateSessionID()",
        );
    }

    $AgentSessionLimitPriorWarningMessage = $SessionObject->CheckAgentSessionLimitPriorWarning();

    $Self->True(
        $AgentSessionLimitPriorWarningMessage,
        "#$Module - CheckAgentSessionLimitPriorWarning() - OTRSBusiness - AgentSessionLimitPriorWarning reached",
    );

    $SessionID = $SessionObject->CreateSessionID(
        UserLogin => 'limit-reached',
        UserType  => 'User',
    );

    $Self->False(
        $SessionID,
        "#$Module - CreateSessionID() - OTRSBusiness - AgentSessionLimit reached",
    );

    $CleanUp = $SessionObject->CleanUp();

    $Self->True(
        $CleanUp,
        "#$Module - CleanUp after normal session limit tests()",
    );

    %OTRSBusinessAgentSessionLimits = (
        AgentSessionLimit             => 0,
        AgentSessionLimitPriorWarning => 0,
    );

    for my $Key ( sort keys %OTRSBusinessAgentSessionLimits ) {
        my $FullKey = 'OTRSBusiness::' . $Key;

        $SystemDataObject->SystemDataUpdate(
            Key    => $FullKey,
            Value  => $OTRSBusinessAgentSessionLimits{$Key},
            UserID => 1,
        );
    }

    for my $Count ( 1 .. 2 ) {

        my %NewSessionData = (
            UserLogin => 'root' . $Count,
            UserType  => 'User',
        );

        my $SessionID = $SessionObject->CreateSessionID(%NewSessionData);

        $Self->True(
            $SessionID,
            "#$Module - CreateSessionID() - with emptry OTRSBusiness session limit values.",
        );
    }

    $AgentSessionLimitPriorWarningMessage = $SessionObject->CheckAgentSessionLimitPriorWarning();

    $Self->False(
        $AgentSessionLimitPriorWarningMessage,
        "#$Module - CheckAgentSessionLimitPriorWarning() - with emptry OTRSBusiness session limit values.",
    );

    $CleanUp = $SessionObject->CleanUp();

    $Self->True(
        $CleanUp,
        "#$Module - CleanUp after normal session limit tests()",
    );

    for my $Key ( sort keys %OTRSBusinessAgentSessionLimits ) {
        $SystemDataObject->SystemDataDelete(
            Key    => 'OTRSBusiness::' . $Key,
            UserID => 1,
        );
    }
}

# restore to the previous state is done by RestoreDatabase

1;
