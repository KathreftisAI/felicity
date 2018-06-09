# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Stats::Dynamic::ITSMTicketFirstLevelSolutionRate;

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

    return 'ITSMTicketFirstLevelSolutionRate';
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

    return 0 if !@TicketSearchIDs;

    my $FirstLevelSolutionTickets = 0;
    TICKETID:
    for my $TicketID (@TicketSearchIDs) {

        # get article data list
        my $ArticleDataList = $Self->_ArticleDataGet(
            TicketID => $TicketID,
        );

        return 'ERROR' if !$ArticleDataList;

        next TICKETID if !@{$ArticleDataList};
        next TICKETID if @{$ArticleDataList} > 2;

        # first article is a phone article
        if ( $ArticleDataList->[0]->{ArticleTypeID} eq $Self->{PhoneTypeID} ) {

            if ( !$ArticleDataList->[1] ) {
                $FirstLevelSolutionTickets++;
            }

            next TICKETID;
        }

        # first article is an external email article
        if ( $ArticleDataList->[0]->{ArticleTypeID} eq $Self->{EmailExternalTypeID} ) {

            # first article comes from an agent (Email-Ticket)
            if (
                $ArticleDataList->[0]->{ArticleSenderTypeID}
                &&
                $ArticleDataList->[0]->{ArticleSenderTypeID} eq $Self->{AgentSenderTypeID}
                && !$ArticleDataList->[1]
                )
            {
                $FirstLevelSolutionTickets++;
                next TICKETID;
            }

            # first article comes from customer and the second one from an agent
            if (
                $ArticleDataList->[0]->{ArticleSenderTypeID}
                &&
                $ArticleDataList->[0]->{ArticleSenderTypeID} eq $Self->{CustomerSenderTypeID}
                && $ArticleDataList->[1]
                && $ArticleDataList->[1]->{ArticleSenderTypeID} eq $Self->{AgentSenderTypeID}
                )
            {
                $FirstLevelSolutionTickets++;
                next TICKETID;
            }
        }
    }

    return $FirstLevelSolutionTickets;
}

sub _ArticleDataGet {
    my ( $Self, %Param ) = @_;

    return if !$Param{TicketID};

    # get id of article type 'phone'
    if ( !$Self->{PhoneTypeID} ) {
        $Self->{PhoneTypeID} = $Kernel::OM->Get('Kernel::System::Ticket')->ArticleTypeLookup(
            ArticleType => 'phone',
        );
    }

    # get id of article type 'email-external'
    if ( !$Self->{EmailExternalTypeID} ) {
        $Self->{EmailExternalTypeID} = $Kernel::OM->Get('Kernel::System::Ticket')->ArticleTypeLookup(
            ArticleType => 'email-external',
        );
    }

    # get id of article sender type 'agent'
    if ( !$Self->{AgentSenderTypeID} ) {
        $Self->{AgentSenderTypeID} = $Kernel::OM->Get('Kernel::System::Ticket')->ArticleSenderTypeLookup(
            SenderType => 'agent',
        );
    }

    # get id of article sender type 'customer'
    if ( !$Self->{CustomerSenderTypeID} ) {
        $Self->{CustomerSenderTypeID} = $Kernel::OM->Get('Kernel::System::Ticket')->ArticleSenderTypeLookup(
            SenderType => 'customer',
        );
    }

    # ask database
    $Self->{DBSlaveObject}->Prepare(
        SQL => 'SELECT article_type_id, article_sender_type_id FROM article '
            . 'WHERE ticket_id = ? AND article_type_id IN ( ?, ? ) AND '
            . 'article_sender_type_id IN ( ?, ? ) '
            . 'ORDER BY create_time',
        Bind => [
            \$Param{TicketID},
            \$Self->{PhoneTypeID},
            \$Self->{EmailExternalTypeID},
            \$Self->{AgentSenderTypeID},
            \$Self->{CustomerSenderTypeID},
        ],
        Limit => 3,
    );

    # fetch the result
    my @ArticleDataList;
    while ( my @Row = $Self->{DBSlaveObject}->FetchrowArray() ) {

        my %ArticleData;
        $ArticleData{ArticleTypeID}       = $Row[0];
        $ArticleData{ArticleSenderTypeID} = $Row[1];

        push @ArticleDataList, \%ArticleData;
    }

    return \@ArticleDataList;
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
