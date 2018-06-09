# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::GenericAgent::SLAMaster;
use strict;
use warnings;
use Kernel::GenericInterface::Operation::Ticket::Common 'SetDynamicFieldValue';
use Data::Dumper;
use Time::Piece;

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
    my $DynamicFieldsConfig = $ConfigObject->Get('DynamicFields::Driver');
    #
    my $Update             = 0;
    my $LastStateUpdate = 0;
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
    my $LatestAutoIncrease = 0;

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
   

    my $startString = "^%%FieldName%%SRState%%Value%%".$Ticket{DynamicField_SRState};
    my $endString = "".$Ticket{DynamicField_SRState};
    my $startSearchStrg =  $startString;
    my $endSearchStrg =  $endString; 
    my $startTime;
    my $endTime;
    my $startCount = 0;
    my $endCount = 0;
    
    for my $History (@revHistoryLines) {
     if(($startCount > 0) && ($endCount > 0)){

 		last;
      } 
        if ( $History->{HistoryType} = 'TicketDynamicFieldUpdate' ) {
            if ( $History->{Name} =~ /$startSearchStrg/){
               if($startCount == 0){
            		$startTime = $History->{CreateTime};
               		$startString = $History->{Name};
                	$startCount++;
               }
	    }
            if ( $History->{Name} =~ /$endSearchStrg$/){
                 if($endCount == 0){	
			$endTime = $History->{CreateTime};
                 	$endString = $History->{Name};
                 	$endCount++;
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


my $startFormatTime = Time::Piece->strptime($startTime, $format);
my $endFormatTime = Time::Piece->strptime($endTime, $format);

my $TimeCounted = Time::Piece->strptime($startTime, $format)
         - Time::Piece->strptime($endTime, $format);




 my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $SQL ="SELECT escalation_solution_time FROM felicity_service_state_SLA WHERE service_state LIKE '%".$Ticket{DynamicField_SRState}."%'";
 my $est="";
    return if !$DBObject->Prepare(SQL => $SQL);
    while ( my @Data = $DBObject->FetchrowArray() ) {
        $est = $Data[0];
    }




    $TimeCounted = $est - $TimeCounted;



#    my $dir='./printfoler';
#       mkdir $dir unless -d $dir;
#       open my $fh,">>","$dir/DetailsSLAStepWise.txt" or die
#       "Can't open '$dir/check.txt\n'";
#        print $fh "Time Counted".Dumper(\$TimeCounted)."Escalation SOlution Time".$est."SR STATE".$Ticket{DynamicField_SRState};
#        print $fh "\nending\n";
#        close $fh;

      
      my $SuccessVal = $Kernel::OM->Get('Kernel::System::DynamicField::Backend')->ValueSet(
             DynamicFieldConfig => $dynafield,
             ObjectID => $Param{TicketID},
             Value => $TimeCounted." seconds ",
             UserID => 1,
      );


%Ticket = $TicketObject->TicketGet(
        %Param,
        DynamicFields => 1,
    );
    my @HistoryLines = $TicketObject->HistoryGet( %Param, UserID => 1 );

    # find latest auto priority update
    for my $History (@HistoryLines) {
        if ( $History->{Name} =~ /^AutoPriorityIncrease/ ) {
            $LatestAutoIncrease = $History->{CreateTime};
        }
    }
    if ( !$LatestAutoIncrease ) {
        $LatestAutoIncrease = $Ticket{Created};
    }

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    $LatestAutoIncrease = $TimeObject->TimeStamp2SystemTime(
        String => $LatestAutoIncrease,
    );

    if (
        ( $TimeObject->SystemTime() - $LatestAutoIncrease )
        > $Param{New}->{TimeInterval}
        )
    {
        $Update = 1;
    }

    # check if priority needs to be increased
    if ( !$Update ) {

        # do nothing
        if ( $Self->{Debug} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'debug',
                Message =>
                    "Nothing to do on (Ticket=$Ticket{TicketNumber}/TicketID=$Ticket{TicketID})!",
            );
        }
        return 1;
    }

    # increase priority
    my $Priority = $Kernel::OM->Get('Kernel::System::Priority')->PriorityLookup(
        PriorityID => ( $Ticket{PriorityID} + 1 ),
    );

    # do nothing if already highest priority
    if ( !$Priority ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'notice',
            Message =>
                "Ticket=$Ticket{TicketNumber}/TicketID=$Ticket{TicketID} already set to higest priority! Can't increase priority!",
        );
        return 1;
    }

    # increase priority
    $Kernel::OM->Get('Kernel::System::Log')->Log(
        Priority => 'notice',
        Message =>
            "Increase priority of (Ticket=$Ticket{TicketNumber}/TicketID=$Ticket{TicketID}) to $Priority!",
    );

    $TicketObject->TicketPrioritySet(
        TicketID   => $Param{TicketID},
        PriorityID => ( $Ticket{PriorityID} + 1 ),
        UserID     => 1,
    );

    $TicketObject->HistoryAdd(
        Name => "AutoPriorityIncrease (Priority=$Priority/PriorityID="
            . ( $Ticket{PriorityID} + 1 ) . ")",
        HistoryType  => 'Misc',
        TicketID     => $Param{TicketID},
        UserID       => 1,
        CreateUserID => 1,
    );

    return 1;
}

1;
