# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::GenericAgent::SLAStepWise;

use strict;
use warnings;

use Kernel::GenericInterface::Operation::Ticket::Common 'SetDynamicFieldValue';
use Data::Dumper;
use Time::Piece;
use Date::Parse;
our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Priority',
    'Kernel::System::Ticket',
    'Kernel::System::Time',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # 0=off; 1=on;
    $Self->{Debug} = $Param{Debug} || 0;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;
    


	my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    # get the Dynamic Field Backends configuration
    # my $DynamicFieldsConfig = $ConfigObject->Get('DynamicFields::Driver');
    #
    my $Update             = 0;
    my $LastStateUpdate = 0;
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
    # check needed param
    if ( !$Param{New}->{'TimeInterval'} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need TimeInterval param for GenericAgent module!',
        );
        return;
    }

    $Param{New}->{TimeInterval} = $Param{New}->{TimeInterval} * 60;

    # get ticket object
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # get ticket data
    my %Ticket = $TicketObject->TicketGet(
        %Param,
        DynamicFields => 1,
    );
    my @HistoryLines = $TicketObject->HistoryGet( %Param, UserID => 1 );
    my @revHistoryLines = reverse @HistoryLines;
    # find latest auto priority update
   


    





    my $startString = "^%%FieldName%%SRState%%Value%%";
    my $startSearchStrg =  $startString;
    my $startTime;
    my $startCount = 0;
    my $collectedHistory; 
    for my $History (@revHistoryLines) {
     if($startCount > 0){
 		last;
      } 
        if ( $History->{HistoryType} = 'TicketDynamicFieldUpdate' ) {
            if ( $History->{Name} =~ /$startSearchStrg/){
               if($startCount == 0){
            		$startTime = $History->{CreateTime};
               		$startString = $History->{Name};
                	$startCount++;
                        $collectedHistory = $History;
               }
	    }
        }
    }
 
     my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

     my $dynafield = $DynamicFieldObject->DynamicFieldGet(Name => 'StepWiseCreateTime');

     

     my $SuccessVal = $Kernel::OM->Get('Kernel::System::DynamicField::Backend')->ValueSet( 
             DynamicFieldConfig => $dynafield,
             ObjectID => $Param{TicketID},
             Value => $startTime,
             UserID => 1,
      );



	
       $dynafield = $DynamicFieldObject->DynamicFieldGet(Name => 'StepWiseSLA');

my $format = '%Y-%m-%d %H:%M:%S';

my $currentTime = localtime();

my $currentTimeStrg = $currentTime->strftime($format);


my $startFormatTime = $startTime;#->strftime($format);
my $timeStartVal = str2time($startFormatTime);
my $timeCurrentVal = str2time($currentTimeStrg);


$startFormatTime = $timeStartVal;
$currentTimeStrg = $timeCurrentVal;




my $TimeSinceLastEvent = $currentTimeStrg - $startFormatTime;



 my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    #my $SQL ="SELECT escalation_solution_time FROM felicity_service_state_SLA WHERE service_state LIKE '%".$Ticket{DynamicField_SRState}."%'";
    my $SQL = "select solution_time from sla where id in (select sla_id from felicity_sla_master where field_value like '%".$Ticket{DynamicField_SRState}."%')";
    my $est="";
    return if !$DBObject->Prepare(SQL => $SQL);
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $est = $Data[0];
    }


 


   my $TimeLeft = ($est*60) - $TimeSinceLastEvent;






 my $DynamicFieldObject1 = $Kernel::OM->Get('Kernel::System::DynamicField');

     my $dynafield1 = $DynamicFieldObject1->DynamicFieldGet(Name => 'CallNotificationStepSLA');



   if($TimeLeft < 0){
      my $SuccessVal = $Kernel::OM->Get('Kernel::System::DynamicField::Backend')->ValueSet(
             DynamicFieldConfig => $dynafield1,
             ObjectID => $Param{TicketID},
             Value => "Yes",
             UserID => 1,
      );    
   }

  if($TimeLeft > 0){
         my $SuccessVal = $Kernel::OM->Get('Kernel::System::DynamicField::Backend')->ValueSet(
             DynamicFieldConfig => $dynafield1,
             ObjectID => $Param{TicketID},
             Value => "No",
             UserID => 1,
      );
      
   }

my $TimeModulo = $TimeLeft%60;
$TimeLeft = $TimeLeft - $TimeModulo;
$TimeLeft = $TimeLeft/60;
        

     if($TimeLeft < 0){
        my $SuccessVal = $Kernel::OM->Get('Kernel::System::DynamicField::Backend')->ValueSet(
             DynamicFieldConfig => $dynafield,
             ObjectID => $Param{TicketID},
             Value => "Ticket Escalated ".(-1)*$TimeLeft." minutes ".$TimeModulo." seconds ago.",
             UserID => 1,
          );
     }
     else{
      my $SuccessVal = $Kernel::OM->Get('Kernel::System::DynamicField::Backend')->ValueSet(
             DynamicFieldConfig => $dynafield,
             ObjectID => $Param{TicketID},
             Value => $TimeLeft." minutes ".$TimeModulo." seconds.",
             UserID => 1,
      );
     }

    if($startCount == 0){
        my $SuccessVal = $Kernel::OM->Get('Kernel::System::DynamicField::Backend')->ValueSet(
             DynamicFieldConfig => $dynafield,
             ObjectID => $Param{TicketID},
             Value => "No Step Defined Yet",
             UserID => 1,
      );
    }


%Ticket = $TicketObject->TicketGet(
        %Param,
        DynamicFields => 1,
    );


    return 1;
}

1;
