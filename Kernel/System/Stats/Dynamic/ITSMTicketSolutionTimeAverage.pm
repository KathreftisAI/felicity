# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Stats::Dynamic::ITSMTicketSolutionTimeAverage;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::Priority',
    'Kernel::System::Queue',
    'Kernel::System::SLA',
    'Kernel::System::Service',
    'Kernel::System::State',
    'Kernel::System::Ticket',
    'Kernel::System::Time',
    'Kernel::System::Type',
    'Kernel::System::User',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    $Self->{DBSlaveObject} = $Param{DBSlaveObject} || $Kernel::OM->Get('Kernel::System::DB');

    # get the dynamic fields for ticket object
    $Self->{DynamicField} = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid      => 1,
        ObjectType => ['Ticket'],
    );

    return $Self;
}

sub GetObjectName {
    my ( $Self, %Param ) = @_;

    return 'ITSMTicketSolutionTimeAverage';
}

sub GetObjectAttributes {
    my ( $Self, %Param ) = @_;

    # get user list
    my %UserList = $Kernel::OM->Get('Kernel::System::User')->UserList(
        Type  => 'Long',
        Valid => 0,
    );

    # get state list
    my %StateList = $Kernel::OM->Get('Kernel::System::State')->StateGetStatesByType(
        StateType => ['closed'],
        Result    => 'HASH',
        UserID    => 1,
    );

    # get queue list
    my %QueueList = $Kernel::OM->Get('Kernel::System::Queue')->GetAllQueues();

    # get priority list
    my %PriorityList = $Kernel::OM->Get('Kernel::System::Priority')->PriorityList(
        UserID => 1,
    );

    # get current time to fix bug#3830
    my $TimeStamp = $Kernel::OM->Get('Kernel::System::Time')->CurrentTimestamp();
    my ($Date) = split /\s+/, $TimeStamp;
    my $Today = sprintf "%s 23:59:59", $Date;

    my @ObjectAttributes = (
        {
            Name             => 'Queue',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'QueueIDs',
            Block            => 'MultiSelectField',
            Translation      => 0,
            Values           => \%QueueList,
        },
        {
            Name             => 'State',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'StateIDs',
            Block            => 'MultiSelectField',
            Values           => \%StateList,
        },
        {
            Name             => 'Priority',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'PriorityIDs',
            Block            => 'MultiSelectField',
            Values           => \%PriorityList,
        },
        {
            Name             => 'Created in Queue',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'CreatedQueueIDs',
            Block            => 'MultiSelectField',
            Translation      => 0,
            Values           => \%QueueList,
        },
        {
            Name             => 'Created Priority',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'CreatedPriorityIDs',
            Block            => 'MultiSelectField',
            Values           => \%PriorityList,
        },
        {
            Name             => 'Created State',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'CreatedStateIDs',
            Block            => 'MultiSelectField',
            Values           => \%StateList,
        },
        {
            Name             => 'Title',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => 'Title',
            Block            => 'InputField',
        },
        {
            Name             => 'CustomerUserLogin',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => 'CustomerUserLogin',
            Block            => 'InputField',
        },
        {
            Name             => 'From',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => 'From',
            Block            => 'InputField',
        },
        {
            Name             => 'To',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => 'To',
            Block            => 'InputField',
        },
        {
            Name             => 'Cc',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => 'Cc',
            Block            => 'InputField',
        },
        {
            Name             => 'Subject',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => 'Subject',
            Block            => 'InputField',
        },
        {
            Name             => 'Text',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => 'Body',
            Block            => 'InputField',
        },
        {
            Name             => 'Create Time',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'CreateTime',
            TimePeriodFormat => 'DateInputFormat',    # 'DateInputFormatLong',
            Block            => 'Time',
            TimeStop         => $Today,
            Values           => {
                TimeStart => 'TicketCreateTimeNewerDate',
                TimeStop  => 'TicketCreateTimeOlderDate',
            },
        },
    );

    if ( $Kernel::OM->Get('Kernel::Config')->Get('Ticket::Service') ) {

        # get service list
        my %Service = $Kernel::OM->Get('Kernel::System::Service')->ServiceList(
            UserID => 1,
        );

        # get sla list
        my %SLA = $Kernel::OM->Get('Kernel::System::SLA')->SLAList(
            UserID => 1,
        );

        my @ObjectAttributeAdd = (
            {
                Name             => 'Service',
                UseAsXvalue      => 1,
                UseAsValueSeries => 1,
                UseAsRestriction => 1,
                Element          => 'ServiceIDs',
                Block            => 'MultiSelectField',
                Translation      => 0,
                Values           => \%Service,
            },
            {
                Name             => 'SLA',
                UseAsXvalue      => 1,
                UseAsValueSeries => 1,
                UseAsRestriction => 1,
                Element          => 'SLAIDs',
                Block            => 'MultiSelectField',
                Translation      => 0,
                Values           => \%SLA,
            },
        );

        unshift @ObjectAttributes, @ObjectAttributeAdd;
    }

    if ( $Kernel::OM->Get('Kernel::Config')->Get('Ticket::Type') ) {

        # get ticket type list
        my %Type = $Kernel::OM->Get('Kernel::System::Type')->TypeList(
            UserID => 1,
        );

        my %ObjectAttribute1 = (
            Name             => 'Type',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'TypeIDs',
            Block            => 'MultiSelectField',
            Translation      => 0,
            Values           => \%Type,
        );

        unshift @ObjectAttributes, \%ObjectAttribute1;
    }

    if ( $Kernel::OM->Get('Kernel::Config')->Get('Stats::UseAgentElementInStats') ) {

        my @ObjectAttributeAdd = (
            {
                Name             => 'Agent/Owner',
                UseAsXvalue      => 1,
                UseAsValueSeries => 1,
                UseAsRestriction => 1,
                Element          => 'OwnerIDs',
                Block            => 'MultiSelectField',
                Translation      => 0,
                Values           => \%UserList,
            },
            {
                Name             => 'Created by Agent/Owner',
                UseAsXvalue      => 1,
                UseAsValueSeries => 1,
                UseAsRestriction => 1,
                Element          => 'CreatedUserIDs',
                Block            => 'MultiSelectField',
                Translation      => 0,
                Values           => \%UserList,
            },
            {
                Name             => 'Responsible',
                UseAsXvalue      => 1,
                UseAsValueSeries => 1,
                UseAsRestriction => 1,
                Element          => 'ResponsibleIDs',
                Block            => 'MultiSelectField',
                Translation      => 0,
                Values           => \%UserList,
            },
        );

        push @ObjectAttributes, @ObjectAttributeAdd;
    }

    if ( $Kernel::OM->Get('Kernel::Config')->Get('Stats::CustomerIDAsMultiSelect') ) {

        # Get CustomerID
        # (This way also can be the solution for the CustomerUserID)
        $Self->{DBSlaveObject}->Prepare(
            SQL => 'SELECT DISTINCT customer_id FROM ticket',
        );

        # fetch the result
        my %CustomerID;
        while ( my @Row = $Self->{DBSlaveObject}->FetchrowArray() ) {
            if ( $Row[0] ) {
                $CustomerID{ $Row[0] } = $Row[0];
            }
        }

        my %ObjectAttribute = (
            Name             => 'CustomerID',
            UseAsXvalue      => 1,
            UseAsValueSeries => 1,
            UseAsRestriction => 1,
            Element          => 'CustomerID',
            Block            => 'MultiSelectField',
            Values           => \%CustomerID,
        );

        push @ObjectAttributes, \%ObjectAttribute;
    }
    else {

        my %ObjectAttribute = (
            Name             => 'CustomerID',
            UseAsXvalue      => 0,
            UseAsValueSeries => 0,
            UseAsRestriction => 1,
            Element          => 'CustomerID',
            Block            => 'InputField',
        );

        push @ObjectAttributes, \%ObjectAttribute;
    }

    # cycle trough the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        my $PossibleValuesFilter;

        # set possible values filter from ACLs
        my $ACL = $Kernel::OM->Get('Kernel::System::Ticket')->TicketAcl(
            Action        => 'AgentStats',
            Type          => 'DynamicField_' . $DynamicFieldConfig->{Name},
            ReturnType    => 'Ticket',
            ReturnSubType => 'DynamicField_' . $DynamicFieldConfig->{Name},
            Data          => $DynamicFieldConfig->{Config}->{PossibleValues} || {},
            UserID        => 1,
        );
        if ($ACL) {
            my %Filter = $Kernel::OM->Get('Kernel::System::Ticket')->TicketAclData();
            $PossibleValuesFilter = \%Filter;
        }

        # get field html
        my $DynamicFieldStatsParameter
            = $Kernel::OM->Get('Kernel::System::DynamicField::Backend')->StatsFieldParameterBuild(
            DynamicFieldConfig   => $DynamicFieldConfig,
            PossibleValuesFilter => $PossibleValuesFilter,
            );

        if ( IsHashRefWithData($DynamicFieldStatsParameter) ) {
            if ( IsHashRefWithData( $DynamicFieldStatsParameter->{Values} ) ) {

                my %ObjectAttribute = (
                    Name             => $DynamicFieldStatsParameter->{Name},
                    UseAsXvalue      => 1,
                    UseAsValueSeries => 1,
                    UseAsRestriction => 1,
                    Element          => $DynamicFieldStatsParameter->{Element},
                    Block            => 'MultiSelectField',
                    Values           => $DynamicFieldStatsParameter->{Values},
                    Translation      => 0,
                );
                push @ObjectAttributes, \%ObjectAttribute;
            }
            else {
                my %ObjectAttribute = (
                    Name             => $DynamicFieldStatsParameter->{Name},
                    UseAsXvalue      => 0,
                    UseAsValueSeries => 0,
                    UseAsRestriction => 1,
                    Element          => $DynamicFieldStatsParameter->{Element},
                    Block            => 'InputField',
                );
                push @ObjectAttributes, \%ObjectAttribute;
            }
        }
    }
    return @ObjectAttributes;
}

sub GetStatElementPreview {
    my ( $Self, %Param ) = @_;

    return int rand 50;
}

sub GetStatElement {
    my ( $Self, %Param ) = @_;

    # use all closed stats if no states are given
    if ( !$Param{StateIDs} ) {
        $Param{StateType} = ['closed'];
    }

    # start ticket search
    my @TicketSearchIDs = $Kernel::OM->Get('Kernel::System::Ticket')->TicketSearch(
        %Param,
        Result     => 'ARRAY',
        Limit      => 100_000_000,
        UserID     => 1,
        Permission => 'ro',
    );

    return '-' if !@TicketSearchIDs;

    my $Time = 0;

    TICKETID:
    for my $TicketID (@TicketSearchIDs) {

        # get ticket data
        my $TicketData = $Self->_TicketDataGet(
            TicketID => $TicketID,
        );

        return 'ERROR' if !%{$TicketData};

        # get relevant ticket history
        my $HistoryData = $Self->_TicketHistoryDataGet(
            TicketID => $TicketID,
        );

        return 'ERROR' if !$HistoryData;

        # if ticket is closed in the ticket create mask
        if ( @{$HistoryData} == 1 ) {
            $Time += ( 3 * 60 );
            next TICKETID;
        }

        my %Timespans;
        my $Counter = 0;

        ENTRY:
        for my $Entry ( @{$HistoryData} ) {

            if ( $Timespans{$Counter} ) {

                next ENTRY if $Entry->{Viewable};

                # set stop time
                $Timespans{$Counter}->{StopTime} = $Kernel::OM->Get('Kernel::System::Time')->TimeStamp2SystemTime(
                    String => $Entry->{CreateTime},
                );

                $Counter++;
            }
            else {

                next ENTRY if !$Entry->{Viewable};

                # set start time
                $Timespans{$Counter}->{StartTime} = $Kernel::OM->Get('Kernel::System::Time')->TimeStamp2SystemTime(
                    String => $Entry->{CreateTime},
                );
            }
        }

        # get calendar
        my $Calendar = $Self->_CalendarGet(
            TicketData => $TicketData,
        );

        for my $Count ( sort keys %Timespans ) {

            # extract timestamp
            my $Timespan = $Timespans{$Count};

            $Timespan->{StopTime} ||= $Timespan->{StartTime} + ( 3 * 60 );

            # calculate working time
            my $WorkingTimePart = $Kernel::OM->Get('Kernel::System::Time')->WorkingTime(
                %{$Timespan},
                Calendar => $Calendar,
            );

            $Time += $WorkingTimePart;
        }
    }

    my $TicketCount = @TicketSearchIDs;
    my $AverageTime = $Time / $TicketCount;

    # translate seconds in a readable format
    my $Value = $Self->_SecondeToString(
        Seconds => int $AverageTime,
    );

    return $Value;
}

sub _TicketDataGet {
    my ( $Self, %Param ) = @_;

    return {} if !$Param{TicketID};

    # ask database
    $Self->{DBSlaveObject}->Prepare(
        SQL => 'SELECT queue_id, sla_id, create_time_unix '
            . 'FROM ticket WHERE id = ?',
        Bind  => [ \$Param{TicketID} ],
        Limit => 1,
    );

    # fetch the result
    my %TicketData;
    while ( my @Row = $Self->{DBSlaveObject}->FetchrowArray() ) {
        $TicketData{QueueID}    = $Row[0];
        $TicketData{SLAID}      = $Row[1];
        $TicketData{CreateTime} = $Row[2];
    }

    return \%TicketData;
}

sub _CalendarGet {
    my ( $Self, %Param ) = @_;

    # get config option
    $Self->{TicketServiceFeature} ||= $Kernel::OM->Get('Kernel::Config')->Get('Ticket::Service');

    my %EscalationData;
    if ( $Self->{TicketServiceFeature} && $Param{TicketData}->{SLAID} ) {
        %EscalationData = $Kernel::OM->Get('Kernel::System::SLA')->SLAGet(
            SLAID  => $Param{TicketData}->{SLAID},
            UserID => 1,
            Cache  => 1,
        );
    }
    else {
        %EscalationData = $Kernel::OM->Get('Kernel::System::Queue')->QueueGet(
            ID     => $Param{TicketData}->{QueueID},
            UserID => 1,
            Cache  => 1,
        );
    }

    return $EscalationData{Calendar} || undef;
}

sub _TicketHistoryDataGet {
    my ( $Self, %Param ) = @_;

    return if !$Param{TicketID};

    # get id of histoy type StateUpdate
    if ( !$Self->{StateUpdateID} ) {
        $Self->{StateUpdateID} = $Kernel::OM->Get('Kernel::System::Ticket')->HistoryTypeLookup(
            Type => 'StateUpdate',
        );
    }

    # get id of histoy type NewTicket
    if ( !$Self->{NewTicketID} ) {
        $Self->{NewTicketID} = $Kernel::OM->Get('Kernel::System::Ticket')->HistoryTypeLookup(
            Type => 'NewTicket',
        );
    }

    # get viewable state ids
    if ( !$Self->{ViewableStateIDs} ) {
        my @ViewableStateIDs = $Kernel::OM->Get('Kernel::System::State')->StateGetStatesByType(
            Type   => 'Viewable',
            Result => 'ID',
        );

        my %ViewableStateIDList;
        for my $StateID (@ViewableStateIDs) {
            $ViewableStateIDList{$StateID} = 1;
        }

        $Self->{ViewableStateIDs} = \%ViewableStateIDList;
    }

    # ask database
    $Self->{DBSlaveObject}->Prepare(
        SQL => 'SELECT state_id, create_time FROM ticket_history '
            . 'WHERE ticket_id = ? AND history_type_id IN ( ?, ? ) '
            . 'ORDER BY create_time',
        Bind => [ \$Param{TicketID}, \$Self->{StateUpdateID}, \$Self->{NewTicketID} ],
    );

    # fetch the result
    my @TicketHistoryList;
    while ( my @Row = $Self->{DBSlaveObject}->FetchrowArray() ) {

        my %HistoryData;
        $HistoryData{StateID}    = $Row[0];
        $HistoryData{CreateTime} = $Row[1];

        push @TicketHistoryList, \%HistoryData;
    }

    ENTRY:
    for my $Entry (@TicketHistoryList) {

        $Entry->{Viewable} = 0;
        next ENTRY if !$Self->{ViewableStateIDs}->{ $Entry->{StateID} };
        $Entry->{Viewable} = 1;
    }

    return \@TicketHistoryList;
}

sub _SecondeToString {
    my ( $Self, %Param ) = @_;

    return '' if !defined $Param{Seconds};

    # calculate the seconds
    my $Seconds = $Param{Seconds} % 60;
    $Param{Seconds} = ( $Param{Seconds} - $Seconds ) / 60;

    # calculate the minutes
    my $Minutes = $Param{Seconds} % 60;

    # calculate the hours
    my $Hours = ( $Param{Seconds} - $Minutes ) / 60;

    # set default value
    $Hours   ||= 0;
    $Minutes ||= 0;
    $Seconds ||= 0;

    if ( $Seconds >= 30 ) {
        $Minutes++;
    }

    $Minutes = sprintf "%02d", $Minutes;

    my $HoursString   = 'Hours';
    my $MinutesString = 'Minutes';

    return "$Hours $HoursString $Minutes $MinutesString";
}

sub ExportWrapper {
    my ( $Self, %Param ) = @_;

    return \%Param;
}

sub ImportWrapper {
    my ( $Self, %Param ) = @_;

    return \%Param;
}

1;
