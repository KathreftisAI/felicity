# --
# Author : Geeta Suryawanshi ~GS
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::Ticket::ListOfCIs;

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
	
	my $SQL = "(select lr.target_key as ticket_id,lr.source_key as ci_id,lr.type_id as type_id from link_relation lr where lr.source_object_id = 5 and lr.target_object_id = 1 and lr.target_key = ?)Union(select lr.source_key as ticket_id,lr.target_key as ci_id,lr.type_id as type_id from link_relation lr where lr.source_object_id = 1 and lr.target_object_id = 5 and lr.source_key = ?)";
	
	return if !$DBObject->Prepare(
	SQL => $SQL,
	Bind  => [ \$TicketID,\$TicketID ]
	);
	
	my %Item;
	my $i = 0;	
	
	while ( my @Row = $DBObject->FetchrowArray() ) 
	{	
		%Item->{$i} = 
		{
		'ticket_id' => $Row[0],
		'ci_id' => $Row[1],
		'type_id'=>$Row[2],
		};
		
		$i++;		
	}
	
	my $outer_count = $i-1;
	
	while($outer_count >= 0)
	{
		my $SQL1 = "select cv.name as Name, ci.class_id as class_id, (select gc.name from general_catalog gc where gc.id = cv.depl_state_id) as DeplState, (select gc.name from general_catalog gc where gc.id = cv.inci_state_id) as InciState from configitem_version cv join configitem ci on cv.id = ci.last_version_id where configitem_id = ?";
		
		my $ci_id = %Item->{$outer_count}{'ci_id'};
	
		return if !$DBObject->Prepare(
			SQL => $SQL1,
			Bind  => [ \$ci_id ],
		);
	
		while ( my @Row1 = $DBObject->FetchrowArray() ) 
		{
		
			%Item->{$outer_count}{'Name'} = $Row1[0];
			%Item->{$outer_count}{'class_id'} = $Row1[1];
			%Item->{$outer_count}{'DeplState'} = $Row1[2];
			%Item->{$outer_count}{'InciState'} = $Row1[3];
			
		}
		
		$outer_count--;
	}
	
	my $json_str = encode_json(\%Item);
	
	print $json_str;
	
	return $json_str;
	
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
