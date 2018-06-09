# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Maint::Ticket::UnoSLAEscalationNotification;

use strict;
use warnings;

use List::Util qw(first);
use HTML::Entities;


use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Ticket',
    'Kernel::System::Time',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Triggers ticket escalation events and notification events for escalation.');

    return;
}


sub Run {
    my ( $Self, %Param ) = @_;

    #get needed objects
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $TimeObject   = $Kernel::OM->Get('Kernel::System::Time');
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
    my $SendmailObject = $Kernel::OM->Get('Kernel::System::Email');
    # get template
    my $TemplateGenerator = $Kernel::OM->Get('Kernel::System::TemplateGenerator');
	my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');
																									  

	# get all escalated tickets
    my @TicketIDs = $TicketObject->TicketSearch(
		Result => 'ARRAY',
		Limit      => 100_000_000,
	    UserID     => 1,
		Permission => 'ro',
		TicketEscalationTimeOlderMinutes => -(2 * 24 * 60),
    );

    for my $TicketID (@TicketIDs) 
    {	#Get Ticket Info
		my %Ticket = $TicketObject->TicketGet(
				TicketID      => $TicketID,
				UserID        => 1,
				Silent        => 0,         # Optional, default 0. To suppress the warning if the ticket does not exist.
		);

		my $SystemTime = $TimeObject->SystemTime();
		my $Difference = ($SystemTime - $Ticket{SolutionTimeDestinationTime});
		my $Name = $UserObject->UserName(UserID => $Ticket{OwnerID},);

		#Get Dyanmic Field value SLAEscalation of ticket 
		my $EscalationMatrixIDs = '0';
	  	my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(Name => 'SLAEscalation');   
	    my $SLAEscalationValGet = $DynamicFieldBackendObject->ValueGet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $TicketID,
            UserID             => 1,
	    );
	    #SLAEscalation has value of EscalationMatrix id job run on ticket
		if($SLAEscalationValGet){
	        $EscalationMatrixIDs = $SLAEscalationValGet;
	     }
	    #Get Details of Escalation matrixs to run job
		return if !$DBObject->Prepare(
			SQL   => "select user_emails,id,Type,Type_value from felicity_escalation_matrix where queue=? and valid_id=1 and time < ? and id NOT IN($EscalationMatrixIDs) order by time asc",
			Bind  => [ \$Ticket{QueueID}, \$Difference],
		);

		#Get email id to send mails
		my @IDs;
		while ( my @Row = $DBObject->FetchrowArray() ) 
		{
			my $email_id;

		    if($Row[2] eq '1'){

		       	$email_id = $Self->GetUserEmailList( Group => $Row[3] );
		    }
		   	elsif($Row[2] eq '2'){

		       	$email_id = $Self->GetUserEmailList( User => $Row[3] );
		   	}
		   	elsif($Row[2] eq '3'){

		       	$email_id = $Self->GetUserEmailList( Customer => $Row[3] );
		   	}
		   	else{

				$email_id = $Row[0];
		   	}

		   	#add Job run message to history
			my @historyname = split(',',$email_id);
			for my $Keys (0 .. $#historyname){
				$TicketObject->HistoryAdd(
						Name         =>"Ticket escalation Matrix notification was sent to $historyname[$Keys]",
						HistoryType  => 'SendAgentNotification', # see system tables
						TicketID     => $TicketID,
						CreateUserID => 1,
				);
			}

			push(@IDs,$Row[1]);
		       
			#Get mail subject and body template
			my $subject = $TemplateGenerator->Template(
				TicketID   => $TicketID,
				TemplateID => '4',
				UserID     => '1',
			);

			
			my $message = $TemplateGenerator->Template(
				TicketID   => $TicketID,
				TemplateID => '5',
				UserID     => '1',
			);

			$subject =$HTMLUtilsObject->ToAscii( String => $subject );
			
			#send mail
		    $SendmailObject->Send(
				To         => $email_id,
				Subject    => $subject,
				Charset    => "UTF-8",
				MimeType   => 'text/html',
				Type       => 'text/html',            
				Body       => $message,
				Loop       => 1            
			);	

		}
	    #Set Dynamic field value on ticket (Escalation Matrix IDs)
	    my $SLAEscalationValSet = join(',',@IDs);
		if($EscalationMatrixIDs)
		{
	        push(@IDs,$EscalationMatrixIDs);
		 	$SLAEscalationValSet = join(',',@IDs);
		}

		if($SLAEscalationValSet ne "")
		{   
		    my $Success = $DynamicFieldBackendObject->ValueSet(
				DynamicFieldConfig => $DynamicFieldConfig,
				ObjectID           => $TicketID,
				Value              => $SLAEscalationValSet,
				UserID             => 1,
		    );
		}
    }


    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

sub GetUserEmailList{

   my ( $Self, %Param ) = @_;
   my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
   my $UserEmailList = '';

   if( $Param{User} ){
    
	    my $Sql = "SELECT preferences_value FROM user_preferences WHERE preferences_key = 'UserEmail' AND user_id = ?";

	    return if !$DBObject->Prepare(
           SQL => $Sql,
           Bind => [ \$Param{User} ],
	    );
	    
	    my @Data = $DBObject->FetchrowArray();
	    $UserEmailList = $Data[0];
        
   }
   elsif( $Param{Group}){

	    my $Sql = "SELECT preferences_value FROM user_preferences WHERE preferences_key = 'UserEmail' AND user_id IN (SELECT user_id FROM group_user WHERE group_id = ?)";

	    return if !$DBObject->Prepare(
	        SQL => $Sql,
	        Bind => [ \$Param{Group} ],
	    );
	    my @emails;
	    my $counter = 0;
	    while ( my @Data = $DBObject->FetchrowArray() ) {
	        $emails[$counter] = $Data[0];
	        $counter++;
	    }
	    $UserEmailList = join(',', @emails);

   }
   elsif( $Param{Customer}){

	    my $Sql = "SELECT email FROM customer_user WHERE id = ?";

		return if !$DBObject->Prepare(
		   SQL => $Sql,
		   Bind => [ \$Param{Customer} ],
		);

	    my @Data = $DBObject->FetchrowArray();
	       $UserEmailList = $Data[0];
	           
	}
	
	return $UserEmailList;
}

1;
