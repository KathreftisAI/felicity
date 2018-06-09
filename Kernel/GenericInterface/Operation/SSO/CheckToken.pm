package Kernel::GenericInterface::Operation::SSO::CheckToken;

use strict;
use warnings;
use JSON;
use Crypt::Rijndael;
use MIME::Base64;
use Kernel::System::ObjectManager;
use Kernel::System::VariableCheck qw(:all);
use base qw(
    Kernel::GenericInterface::Operation::Common
    Kernel::GenericInterface::Operation::ConfigItem::Common
);


sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Needed (qw( DebuggerObject WebserviceID )) {
        if ( !$Param{$Needed} ) {
            return {
                Success      => 0,
                ErrorMessage => "Got no $Needed!",
            };
        }
        $Self->{$Needed} = $Param{$Needed};
    }
    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Result = $Self->Init(
        WebserviceID => $Self->{WebserviceID},
    );

    if ( !$Result->{Success} ) {
        $Self->ReturnError(
            ErrorCode    => 'Webservice.InvalidConfiguration',
            ErrorMessage => $Result->{ErrorMessage},
        );
    }

    # check for needed params
    for my $Needed (qw(token)) {
        if ( !$Param{Data}->{$Needed} ) {
            return $Self->ReturnError(
                ErrorCode    => "$Self->{OperationName}.MissingParameter",
                ErrorMessage => "$Self->{OperationName}: $Needed parameter is missing!",
            );
        }
    }

    # Needed Objects
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $remote_addr;
    # users data

    # Fix for Machines which are behind a proxy or load balancers
    if( $ENV{HTTP_X_FORWARDED_FOR} ){
        $remote_addr = $ENV{HTTP_X_FORWARDED_FOR};
    }
    else{
        $remote_addr = $ENV{REMOTE_ADDR};
    }

    # start Decoding the token received
    my $key = pack('H*', "bcb04b7e103a0cd8b54763051cef08bc55abe029fdebae5e1d417e2ffb2a00a3");
    my $crypt = Crypt::Rijndael->new($key, Crypt::Rijndael::MODE_CBC);
    my $base64_text = $Param{Data}->{token};
    my $ciphertext = decode_base64($base64_text);
    my $iv = substr($ciphertext, 0, 16);
    $ciphertext = substr($ciphertext, 16);
    $crypt->set_iv($iv);
    my $decdata = $crypt->decrypt($ciphertext);
    $decdata =~ s/\0+$//;
    $decdata = substr( $decdata, 0, 12 );

    # Get ServerID from table and then get the token from the tokens table
    my $SQL = "SELECT id FROM sso_servers where server_ip = ?";
    $DBObject->Prepare(
        SQL => $SQL,
        Bind => [\$remote_addr],
        Limit => 1,
	);

    my $serverID ;
    while (my @Row = $DBObject->FetchrowArray()) {
        $serverID = $Row[0];
    }

    if( !$serverID ){
        return {
            Success => 1,
            Data    => {
                Error => "Server Not Found",
            },
        };
    }

    my $query = "Select id,session_id FROM sso_servers_tokens WHERE token LIKE ?";
    $DBObject->Prepare(
        SQL => $query,
        Bind => [\$decdata],
        Limit => 1,
	);
    my %TokenData;
    while (my @Row = $DBObject->FetchrowArray()) {
        $TokenData{'ID'} = $Row[0],
        $TokenData{'SessionID'} = $Row[1],
        $TokenData{'Token'} = $decdata,
    }

    # If session is invalide send success code = 0
    my %Ok =
      $SessionObject->GetSessionIDData( SessionID => $TokenData{SessionID}, );
    if ( !($Ok{GLPI_Session} == $decdata) ) {
        return {
            Success => 1,
            Data    => { Error => "Session Invald", },
        };
    }
    # Retuprn data if the Session is valid
    return {
        Success => 1,
        Data    => {
            id => $TokenData{ID},
            token => $TokenData{Token},
        },
    };
}
1;
