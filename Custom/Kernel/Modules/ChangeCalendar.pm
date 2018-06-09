# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::ChangeCalendar;

use DateTime;
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
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    my $CurrentTime = $TimeObject->CurrentTimestamp();
    my ($Sec, $Min, $Hour, $Day, $Month, $Year, $WeekDay) = $TimeObject->SystemTime2Date(
        SystemTime => $TimeObject->SystemTime(),
    );
   
    #converts a structured date array to local system time

    my $dt = DateTime->new(
          year       => $Year,
          month      => $Month,
          day        => $Day,
          hour       => $Hour,
          minute     => $Min,
          second     => $Sec,
    );

    $dt->set_day(1);  

    #get previous five years Date

    my $date=$dt->subtract(years => 5);

    #converts a structured date array to local system time

    my $lt = DateTime->new(
        year       => $Year,
        month      => $Month,
        day        => $Day,
        hour       => $Hour,
        minute     => $Min,
        second     => $Sec,
    );

    #get next five years Date
    
    my $lastdate=$lt->add(years => 5);
   
    #Prefix zero with day month and time for startDate

    my $PrefixZero = 10;
    for my $key (qw(month day hour minute second)){ 
       if( $date->{local_c}->{$key} < 10 ) {
            $date->{local_c}->{$key} = sprintf("%02d",$date->{local_c}->{$key});
        }
    }

    my $StartDate = "$date->{local_c}->{year}-$date->{local_c}->{month}-$date->{local_c}->{day} $date->{local_c}->{hour}:$date->{local_c}->{minute}:$date->{local_c}->{second}";

    #Prefix zero with day month and time for endDate

    my $PrefixZeroEndDate = 10;
    for my $key (qw(month day hour minute second)){ 
       if( $lastdate->{local_c}->{$key} < 10 ) {
            $lastdate->{local_c}->{$key} = sprintf("%02d",$lastdate->{local_c}->{$key});
        }
    }

    my $EndDate ="$lastdate->{local_c}->{year}-$lastdate->{local_c}->{month}-$lastdate->{local_c}->{day} $lastdate->{local_c}->{hour}:$lastdate->{local_c}->{minute}:$lastdate->{local_c}->{second}";

    my @ChangeList;

    my $ChangeIDsRef = $ChangeObject->ChangeSearch(
        PlannedStartTimeNewerDate => $StartDate,
        PlannedEndTimeOlderDate   => $EndDate, 
        UserID                    => $Self->{UserID}
    );
 
    my %ChangeLabel = (
        ChangeID        => 'ID',
        ChangeTitle     => 'title',
        PlannedStartTime => 'start',
        PlannedEndTime  => 'end'
    );

    for my $ChangeID (@{$ChangeIDsRef}) {

        my $Change = $ChangeObject->ChangeGet(
            ChangeID => $ChangeID,
            UserID   => $Self->{UserID},
        );

        my %ChangeData;

        for my $key (qw(ChangeID ChangeTitle PlannedStartTime PlannedEndTime)){            
            $ChangeData{$ChangeLabel{$key}} = $Change->{$key};          
        }

        push @ChangeList, \%ChangeData;
    }

    $Param{ChangeList} = \@ChangeList;

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $LayoutObject->Output(
        TemplateFile =>'ChangeCalendar',
        Data         => \%Param
    );
    $Output .= $LayoutObject->Footer();
    return $Output;
    
} 

1;

