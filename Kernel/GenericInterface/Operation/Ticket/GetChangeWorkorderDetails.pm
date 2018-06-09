# --
# Author : Geeta Suryawanshi ~GS
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::Ticket::GetChangeWorkorderDetails;

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
    for my $Needed (qw(ChangeID)) {
        if ( !$Param{Data}->{$Needed} ) {
            return $Self->ReturnError(
                ErrorCode    => "$Self->{OperationName}.MissingParameter",
                ErrorMessage => "$Self->{OperationName}: $Needed parameter is missing!",
            );
        }
    }
    my $ErrorMessage = '';
	
    my $ChangeID = $Param{Data}->{ChangeID};
    my $Filter = $Param{Data}->{Filter};
	
    my $ReturnData = {
        Success => 1,
    };
	

	my $SQL = "select ch_wo.workorder_number,ch_wo.create_time,ch_wo.title,ch_wo.planned_start_time,u.id as user_id, concat(u.first_name ,' ', u.last_name) as wo_agent, concat(wc.first_name, ' ', wc.last_name) as creator_name, gc.name as state, gcs.name as type from change_workorder ch_wo left join users u on ch_wo.workorder_agent_id = u.id join users wc on wc.id = ch_wo.create_by left join general_catalog gc on gc.id = ch_wo.workorder_state_id left join general_catalog gcs on gcs.id = ch_wo.workorder_type_id where change_id=? and gcs.name !='Execution'";
        if($Filter eq "plan")
        {
	 $SQL.=" order by ch_wo.planned_start_time DESC";
	} 
	else
	{
	 $SQL .=" order by wo_agent";
	}
	my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
	$DBObject->Prepare(
	SQL => $SQL,
	Bind  => [ \$ChangeID ]
	);

        my %Result;
	my $i=0;
        while ( my @Row = $DBObject->FetchrowArray() )
        {
               
                $Result{$i}= {"workorder_number" => $Row[0],"create_time" => $Row[1],"title" => $Row[2],"planned_start_time" => $Row[3],"wo_agent" => $Row[5],"creator_name" => $Row[6],"state" => $Row[7],"type" => $Row[8]};
		$i++;
        }
        my %FinalResult;
        $FinalResult{data}= \%Result;
        $FinalResult{msg}="success";
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
