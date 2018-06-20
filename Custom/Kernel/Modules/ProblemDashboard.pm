# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::ProblemDashboard;

use strict;
use warnings;
use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(:all);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # set debug
    $Self->{Debug} = 0;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;
    # get needed objects
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

#-----------------------------------------------------------------------------------------#
    #query for ticket state type
#-----------------------------------------------------------------------------------------#

    return if !$DBObject->Prepare(
        SQL  => "SELECT ts.id as ID,ts.name as State, Count(*) as Count
        FROM ticket t
        LEFT JOIN ticket_state ts
        ON t.ticket_state_id = ts.id
        WHERE t.type_id = 7
        GROUP BY t.ticket_state_id",
    );
    my %StateList;
    my @StateData;
    while ( my @Row = $DBObject->FetchrowArray() ) {
       push @StateData   , {name => "$Row[1]" , y => $Row[2] } ;
       $StateList{"$Row[1]"}=$Row[0];
    }
    $Param{ticket_state_list}  = \%StateList;
    $Param{ticket_state}  = \@StateData;

#-----------------------------------------------------------------------------------------#
    #for ticket create and close
#-----------------------------------------------------------------------------------------#
    my ($Sec, $Min, $Hour, $Day, $Month, $Year, $WeekDay) = $TimeObject->SystemTime2Date(
        SystemTime => $TimeObject->SystemTime(),
    );
    my %Days = (
        1 => 'Mon',
        2 => 'Tue',
        3 => 'Wed',
        4 => 'Thu',
        5 => 'Fri',
        6 => 'Sat',
        0 => 'Sun',
    );

    $Param{WeekDay}=$Days{$WeekDay};

    #query for ticket created
    return if !$DBObject->Prepare(
        SQL  => "select count(*) as open_count, DATE_FORMAT(cast(t.create_time as date),'%a') as week_day from ticket t join ticket_state ts on t.ticket_state_id = ts.id where t.type_id = 7 AND cast(t.create_time as date) >= date_sub(curdate(),interval 6 day) group by cast(t.create_time as date),DATE_FORMAT(cast(t.create_time as date),'%a')",
    );

    my %OpenStatsData;
    while ( my @Row = $DBObject->FetchrowArray() ) {
       $OpenStatsData{"$Row[1]"}= $Row[0]  ;
    }
    $Param{ticket_OpenStatsData}  = \%OpenStatsData;


    #query for ticket closed
    return if !$DBObject->Prepare(
        SQL  => "select count(*) as close_TicketCount,Date_Format(cast(t.create_time as date),'%a')Closecreate_time  from  ticket t join ticket_state ts on ts.id=t.ticket_state_id where t.ticket_state_id=7 and t.type_id=2 and t.create_time >= date_sub(curdate(), interval 6 day) group by Date_Format(cast(t.create_time as date),'%a')",
    );

    my %CloseStatsData;
    while ( my @Row = $DBObject->FetchrowArray() ) {
       $CloseStatsData{"$Row[1]"}= $Row[0]  ;
    }
    $Param{ticket_CloseStatsData}  = \%CloseStatsData;


#-----------------------------------------------------------------------------------------#
    #query for count state and priority for matrix dashboard
#-----------------------------------------------------------------------------------------#

    return if !$DBObject->Prepare(
        SQL  => "select  b.name as State,c.name as Priority, count(a.id) AS Count
        from ticket a , ticket_state b ,  ticket_priority c
        where a.ticket_state_id = b.id and a.ticket_priority_id = c.id and a.type_id=7
        group by b.name ,c.name order by b.name ,c.name",
    );

    my %StateMatrixList;
    my %PriorityMatrixList;
    my @StatesMatrixList;
    my @PrioritysMatrixList;
    my %MatrixHashData;
    my @MatrixData;
    my %StateIndex;
    my %PriorityIndex;


    while ( my @Row = $DBObject->FetchrowArray() ) {
       $StateMatrixList{$Row[0]}='';
       $PriorityMatrixList{$Row[1]}='';
       $MatrixHashData{$Row[0]}{$Row[1]}= $Row[2];
    }

    #state column for chart
    @StatesMatrixList = keys %StateMatrixList;
    $Param{StatesMatrixList}  = \@StatesMatrixList;

    #priorit row for chart
    @PrioritysMatrixList = keys %PriorityMatrixList;
    $Param{PrioritysMatrixList}  = \@PrioritysMatrixList;

    #indexing of state
    my $CountState=0;
    for my $Key (keys %StateMatrixList){
        $StateIndex{$CountState}=$Key;
        $CountState++;
    }

    #indexing of priority
    my $CountPriority=0;
    for my $Key (keys %PriorityMatrixList){
        ${PriorityIndex}{$CountPriority}=$Key;
        $CountPriority++;
    }
        

    #converting priority(x-axis) and state(y-axis) into two dimensional data
    my $v2 =0;
    for (my $var = 0; $var < $CountPriority; $var++) {
        for (my $var2 = 0; $var2 < $CountState; $var2++) {
            if ($MatrixHashData{$StateIndex{$var2}}{$PriorityIndex{$var}}) {
                push @MatrixData , [$var ,$var2, $MatrixHashData{$StateIndex{$var2}}{$PriorityIndex{$var}}];
            }else{
                push @MatrixData , [$var ,$var2, 0];
            }               
        }
    }

    $Param{ticket_matrix}  = \@MatrixData;


#-----------------------------------------------------------------------------------------#
    #query for open Problem group dashboard
#-----------------------------------------------------------------------------------------#

    return if !$DBObject->Prepare(
        SQL  => "select  b.name as State,c.name as Priority, count(a.id) AS Count
        from ticket a , ticket_state b ,  ticket_priority c
        where a.ticket_state_id = b.id and a.ticket_priority_id = c.id and a.type_id=7
        and b.name = 'open'
        group by b.name ,c.name
        order by b.name ,c.name ",
    );
    my @PriorityData;
    while ( my @Row = $DBObject->FetchrowArray() ) {
       push @PriorityData   , {name => "$Row[1]" , data => [$Row[2]] } ;
       # $StateList{"$Row[1]"}=$Row[0];
    }
    $Param{open_problemGroup}  = \@PriorityData;
    

#----------------------function show count of ticket for login user-----------------------#

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    my ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = $TimeObject->SystemTime2Date(
        SystemTime => $TimeObject->SystemTime(),
    );
    my $TimeStampToday = "$Year-$Month-$Day 23:59:59";

    my %Filters=(
            CriticalOpen => {
                Result => 'COUNT',
                Types   => ['Problem'],
                States   => ['open'],
                Priorities  => ['P1'],
                UserID     => $Self->{UserID},
                Permission => 'ro',
                OwnerIDs=> [$Self->{UserID}],
            },
            criticalproblem=>{
                Result => 'COUNT',
                Types   => ['Problem'],
                States   => ['open'],
                Priorities  => ['P1'],
                UserID     => $Self->{UserID},
                },
            Open => {
                Result => 'COUNT',
                Types   => ['Problem'],
                States   => ['open'],
                UserID     => $Self->{UserID},
                Permission => 'ro',
                OwnerIDs=> [$Self->{UserID}],
            },
            Openproblem=>{
                Result => 'COUNT',
                Types   => ['Problem'],
                States   => ['open'],
                UserID     => $Self->{UserID},
            },
            Unassigned => {
                Result => 'COUNT',
                Types   => ['Problem'],
                States   => ['new', 'closed unsuccessful', 'open', 'removed', 'pending reminder', 'resolved', 'Pending for appoval', 'Pending for business', 'Pending with IT team', 'Pending with vendor', 'Under observation', 'Pending With Customer', 'Awaiting Response', 'ReOpen'],
                Locks         => ['unlock'],
                UserID     => $Self->{UserID},
                Permission => 'ro',
                OwnerIDs=> [$Self->{UserID}],
            },
            UnassignedProblems=>{
                Result => 'COUNT',
                Types   => ['Problem'],
                States   => ['new', 'closed unsuccessful', 'open', 'removed', 'pending reminder', 'resolved', 'Pending for appoval', 'Pending for business', 'Pending with IT team', 'Pending with vendor', 'Under observation', 'Pending With Customer', 'Awaiting Response', 'ReOpen'],
                Locks         => ['unlock'],
                UserID     => $Self->{UserID},
            },
            Overdue => {
                Result => 'COUNT',
                Types => ['Problem'],
                UserID     => $Self->{UserID},
                Permission => 'ro',
                TicketEscalationTimeOlderDate => $TimeStampToday,
                OwnerIDs=> [$Self->{UserID}],
            },
            OverdueProblems=>{
                Result => 'COUNT',
                Types => ['Problem'],
                UserID     => $Self->{UserID},
                TicketEscalationTimeOlderDate => $TimeStampToday,
            },
            SevenDayUpdate => {
                Result => 'COUNT',
                Types => ['Problem'],
                States   => ['new', 'closed unsuccessful', 'open', 'removed', 'pending reminder', 'resolved', 'Pending for appoval', 'Pending for business', 'Pending with IT team', 'Pending with vendor', 'Under observation', 'Pending With Customer', 'Awaiting Response', 'ReOpen'],
                TicketLastChangeTimeOlderMinutes => 7*60*24,
                UserID     => $Self->{UserID},
                Permission => 'ro',
                OwnerIDs=> [$Self->{UserID}],
            },
            sevendayproblemticket=>{
                Result => 'COUNT',
                Types => ['Problem'],
                States   => ['new', 'closed unsuccessful', 'open', 'removed', 'pending reminder', 'resolved', 'Pending for appoval', 'Pending for business', 'Pending with IT team', 'Pending with vendor', 'Under observation', 'Pending With Customer', 'Awaiting Response', 'ReOpen'],
                TicketLastChangeTimeOlderMinutes => 7*60*24,
                UserID     => $Self->{UserID},
            },
            ThirtyDayUpdate => {
                Result => 'COUNT',
                Types => ['Problem'],
                States   => ['new', 'closed unsuccessful', 'open', 'removed', 'pending reminder', 'resolved', 'Pending for appoval', 'Pending for business', 'Pending with IT team', 'Pending with vendor', 'Under observation', 'Pending With Customer', 'Awaiting Response', 'ReOpen'],
                TicketCreateTimeOlderMinutes => 30*24*60,
                UserID     => $Self->{UserID},
                Permission => 'ro',
                OwnerIDs=> [$Self->{UserID}],
            },
            ThirtyDaysproblemticket=>{
                Result => 'COUNT',
                Types => ['Problem'],
                States   => ['new', 'closed unsuccessful', 'open', 'removed', 'pending reminder', 'resolved', 'Pending for appoval', 'Pending for business', 'Pending with IT team', 'Pending with vendor', 'Under observation', 'Pending With Customer', 'Awaiting Response', 'ReOpen'],
                TicketCreateTimeOlderMinutes => 30*24*60,
                UserID     => $Self->{UserID},
            },

        );


    my %TicketCounts;

    for my $keys (qw(CriticalOpen criticalproblem Open Openproblem Unassigned UnassignedProblems Overdue OverdueProblems SevenDayUpdate sevendayproblemticket ThirtyDayUpdate ThirtyDaysproblemticket)) {
        $TicketCounts{$keys} = $TicketObject->TicketSearch(
           %{$Filters{$keys}}
        );
    }

     $Param{TicketCounts} = \%TicketCounts;
      $Param{OwnerID} = $Self->{UserID};

#----------------------------END----------------------------------------------------------#

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $LayoutObject->Output(
        TemplateFile =>'ProblemDashboard',
        Data         => \%Param
    );
    $Output .= $LayoutObject->Footer();
    return $Output;
    
} 

1;

