# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::ChangesDashboard;

use strict;
use warnings;
use Data::Dumper;
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
    #query for change state type
#-----------------------------------------------------------------------------------------#

    return if !$DBObject->Prepare(
        SQL  => "SELECT a.id as ID,a.name as State, Count(*) as Count
        FROM change_item c
        LEFT JOIN general_catalog a
        ON c.change_state_id = a.id
        GROUP BY c.change_state_id",
    );
    my %StateList;
    my @StateData;
    while ( my @Row = $DBObject->FetchrowArray() ) {
       push @StateData   , {name => "$Row[1]" , y => $Row[2] } ;
       $StateList{"$Row[1]"}=$Row[1];
    }
    $Param{change_state_list}  = \%StateList;
    $Param{change_state}  = \@StateData;


#-----------------------------------------------------------------------------------------#
    #query for open change group dashboard
#-----------------------------------------------------------------------------------------#

    return if !$DBObject->Prepare(
        SQL  => "select b.name,c.name,count(*) as count from change_item a
    left join general_catalog b on a.change_state_id = b.id
    left join general_catalog c on a.priority_id = c.id
    group by a.change_state_id,a.priority_id
    having b.name != 'closed'",
    );
    my @PriorityData;
    while ( my @Row = $DBObject->FetchrowArray() ) {
       push @PriorityData   , {name => "$Row[1]" , data => [$Row[2]] } ;
       # $StateList{"$Row[1]"}=$Row[0];
    }
    $Param{open_changesGroup}  = \@PriorityData;

#-----------------------------------------------------------------------------------------#
    #query for workorder aproval dashboard
#-----------------------------------------------------------------------------------------#
    #query for all created workworder where type Aproval

    return if !$DBObject->Prepare(
        SQL  => "select 'Week 1' as week, count(a.workorder_state_id) as count  from change_workorder a
    where a.create_time > current_timestamp - interval 7 day
    union all
    select 'Week 2' as week, count(a.workorder_state_id) as count  from change_workorder a
    where a.create_time between (current_timestamp - interval 14 day)
    and (current_timestamp - interval 7 day )
    union all
    select 'Week 3' as week, count(a.workorder_state_id) as count  from change_workorder a
    where a.create_time between (current_timestamp - interval 21 day)
    and (current_timestamp - interval 14 day )
    union all
    select 'Week 4' as week, count(a.workorder_state_id) as count  from change_workorder a
    where a.create_time between (current_timestamp - interval 28 day)
    and (current_timestamp - interval 21 day ) ;",
    );
    my @WorkorderCreatedData;
    while ( my @Row = $DBObject->FetchrowArray() ) {
         push @WorkorderCreatedData   , {data => [$Row[1]] } ;
       #$WorkorderCreatedData[0]=$Row[1]; 
    }
    $Param{Workorder_created}  = \@WorkorderCreatedData;

    #query for all created workworder where type Aproval

    return if !$DBObject->Prepare(
        SQL  => "select 'Week 1' as week, count(a.workorder_type_id) as count from change_workorder a
    where a.create_time > current_timestamp - interval 7 day        
    and workorder_type_id = 130
    union all
    select 'Week 2' as week, count(a.workorder_type_id) as count from change_workorder a
    where a.create_time between (current_timestamp - interval 14 day)
    and (current_timestamp - interval 7 day )       
    and workorder_type_id = 130
    union all
    select 'Week 3' as week, count(a.workorder_type_id) as count from change_workorder a
    where a.create_time between (current_timestamp - interval 21 day)
    and (current_timestamp - interval 14 day )       
    and workorder_type_id = 130
    union all
    select 'Week 4' as week, count(a.workorder_type_id) as count from change_workorder a
    where a.create_time between (current_timestamp - interval 28 day)
    and (current_timestamp - interval 21 day )       
    and workorder_type_id = 130;",
    );
    my @WorkorderAprovalData;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @WorkorderAprovalData   , {data => [$Row[1]] } ;
       #$WorkorderAprovalData[0]=$Row[0];
    }
    $Param{Workorder_WeekAproval}  = \@WorkorderAprovalData;
    

#-----------------------------------------------------------------------------------------#
    #query for number dashboard
#-----------------------------------------------------------------------------------------#
    #Total No. of changes
    return if !$DBObject->Prepare(
        SQL  => "select count(*) as changescount from change_item where 
    change_time BETWEEN DATE_FORMAT(current_date,'%Y-01-01') AND DATE_FORMAT(current_date,'%Y-12-31')",
    );
   
    while ( my @Row = $DBObject->FetchrowArray() ) {
       $Param{total_changes} = $Row[0];
    }
    
    #Changes for the month
    return if !$DBObject->Prepare(
        SQL  => "SELECT count(*) as COUNT
    FROM change_item 
    WHERE MONTH(change_time)= MONTH(CURDATE())",
    );

    while ( my @Row = $DBObject->FetchrowArray() ) {
       $Param{changes_month} = $Row[0];
    }
   
    #Changes schedule for the current month
    return if !$DBObject->Prepare(
        SQL  => "select count(*) as COUNT from change_item
    where create_time between DATE_FORMAT(current_date,'%Y-%m-01') AND  current_date",
    );
    while ( my @Row = $DBObject->FetchrowArray() ) {
       $Param{changes_schedule} =$Row[0] ;  
    }

    #Total No. of workorder
    return if !$DBObject->Prepare(
        SQL  => "select count(*) as COUNT from change_workorder where change_time
    BETWEEN DATE_FORMAT(current_date,'%Y-01-01') AND DATE_FORMAT(current_date,'%Y-12-31')",
    );
    while ( my @Row = $DBObject->FetchrowArray() ) {
      $Param{total_workorder} =  $Row[0]  ;
    }

    #Workorder for the month
    return if !$DBObject->Prepare(
        SQL  => "SELECT count(*) as COUNT
    FROM change_workorder 
    WHERE MONTH(change_time)= MONTH(CURDATE())",
    );
    while ( my @Row = $DBObject->FetchrowArray() ) {
      $Param{month_workorder} =  $Row[0]  ;
    }


    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $LayoutObject->Output(
        TemplateFile =>'ChangesDashboard',
        Data         => \%Param
    );
    $Output .= $LayoutObject->Footer();
    return $Output;
    
} 

1;

