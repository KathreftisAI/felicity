# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::CMDBInformationLogs;

use strict;
use warnings;
use Data::Dumper;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get needed object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # build output
    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();

    # OCSNG SSO Begin

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # check if the token is generated
    my $Token;
    my %TokenData;
    my %mydata;
    my %ServerData;

    my $query =
"Select id,session_id,token FROM sso_servers_tokens WHERE session_id LIKE ?";
    $DBObject->Prepare(
        SQL   => $query,
        Bind  => [ \$Self->{SessionID} ],
        Limit => 1,
    );

    while ( my @Row = $DBObject->FetchrowArray() ) {
        $TokenData{'ID'}          = $Row[0],
          $TokenData{'SessionID'} = $Row[1],
          $TokenData{'Token'}     = $Row[2],
          $Token                  = $Row[2],
          ;
    }
    if ( !$TokenData{Token} ) {

        # Generate Token
        $Token = $Kernel::OM->Get('Kernel::System::Main')
          ->GenerateRandomString( Length => 12, );

        my $query =
"Select id,server_ip FROM sso_servers WHERE server_name LIKE 'ocsngurl'";
        $DBObject->Prepare(
            SQL   => $query,
            Limit => 1,
        );

        while ( my @Row = $DBObject->FetchrowArray() ) {
            $ServerData{'ID'} = $Row[0], $ServerData{'ServerIP'} = $Row[1],;
        }

        # Save Token with SessionID
        $DBObject->Do(
            SQL => 'INSERT INTO sso_servers_tokens '
              . '(sso_server_id,session_id,token,create_time)'
              . 'VALUES (?, ?, ?, current_timestamp)',
            Bind => [ \$ServerData{ID}, \$Self->{SessionID}, \$Token ]
        );
    }

    # OCSNG SSO End

    my %Data;
    my $ocsngurl = $ConfigObject->Get('ocsngurl');
    $Data{'url'}   = $ocsngurl . "admin_logs&token=" . $Token;
    $Data{'title'} = "CMDB Information Logs";
    $Output .= $LayoutObject->Output(
        TemplateFile => 'CMDB',
        Data         => \%Data,
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

1;
