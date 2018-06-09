# --
# Author : Geeta Suryawanshi ~GS
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::Ticket::GetTicketDetails;

use strict;
use warnings;
use JSON;
use Kernel::System::DB;
use MIME::Base64;
use Kernel::System::VariableCheck qw(:all);
use Data::Dumper;

use base qw(
    Kernel::GenericInterface::Operation::Common
    Kernel::GenericInterface::Operation::ConfigItem::Common
);

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::GenericInterface::Operation::Ticket::ListOfCIs - GenericInterface Ticket Get Operation backend

=head1 SYNOPSIS

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

usually, you want to create an instance of this
by using Kernel::GenericInterface::Operation->new();

=cut

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

    my ( $UserID, $UserType ) = $Self->Auth(
        %Param
    );

    if ( !$UserID ) {
        return $Self->ReturnError(
            ErrorCode    => '$Self->{OperationName}.AuthFail',
            ErrorMessage => "$Self->{OperationName}: Authorization failing!",
        );
    }

   # check needed stuff
    for my $Needed (qw(TicketID)) {
        if ( !$Param{Data}->{$Needed} ) {
            return $Self->ReturnError(
                ErrorCode    => "$Self->{OperationName}.MissingParameter",
                ErrorMessage => "$Self->{OperationName}: $Needed parameter is missing!",
            );
        }
    }
    my $ErrorMessage = '';
	
	my $TicketID = $Param{Data}->{TicketID};
	
    my $ReturnData = {
        Success => 1,
    };
	
	my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
	my $SQL = "select usr.first_name, usr.last_name, usr.login, usr.id from ticket tkt left join users usr on tkt.user_id = usr.id where tn=?";
	$DBObject->Prepare(
	SQL => $SQL,
	Bind  => [ \$TicketID ]
	);
	
	my %FinalResult;
	while ( my @Row = $DBObject->FetchrowArray() ) 
	{
		%FinalResult->{owner}= {'name' => $Row[0].' '.$Row[1],'login' => $Row[2],'id' => $Row[3]};
	}

	$SQL = "select usr.first_name, usr.last_name, usr.login, usr.id, tkt.id as ticket_id from ticket tkt left join users usr on tkt.create_by = usr.id where tn=?";
        $DBObject->Prepare(
        SQL => $SQL,
        Bind  => [ \$TicketID ]
        );

        while ( my @Row = $DBObject->FetchrowArray() )
        {
                %FinalResult->{create_by}= {'name' => $Row[0].' '.$Row[1],'login' => $Row[2],'id' => $Row[3],'ticket_id' => $Row[4]};
        }
       
	$SQL = "SELECT  tkt.id, tkt.tn, tkt.create_time, art.a_from, art.a_to, art.a_subject, art_type.name  FROM ticket tkt left join article art on tkt.id = art.ticket_id left join article_type art_type on art_type.id = art.article_type_id  where tkt.tn=?";
        $DBObject->Prepare(
        SQL => $SQL, 
        Bind  => [ \$TicketID ]
        );

        my %Result;
	my $i=0;
        while ( my @Row = $DBObject->FetchrowArray() )
        {
                %Result->{$i}= {'from' => $Row[3],'to' => $Row[4],'subject' => $Row[5],'created_time' => $Row[2],'type' => $Row[6]};
		$i++;
        }
        %FinalResult->{correspondance} = \%Result;
	my $json_str = encode_json(\%FinalResult);
	print $json_str;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
