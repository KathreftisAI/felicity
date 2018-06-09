# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket::TicketSearch;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::System::Ticket::TicketSearch - ticket search lib

=head1 SYNOPSIS

All ticket search functions.

=over 4

=cut

=item TicketSearch()

To find tickets in your system.

    my @TicketIDs = $TicketObject->TicketSearch(
        # result (required)
        Result => 'ARRAY' || 'HASH' || 'COUNT',

        # result limit
        Limit => 100,

        # Use TicketSearch as a ticket filter on a single ticket,
        # or a predefined ticket list
        TicketID     => 1234,
        TicketID     => [1234, 1235],

        # ticket number (optional) as STRING or as ARRAYREF
        TicketNumber => '%123546%',
        TicketNumber => ['%123546%', '%123666%'],

        # ticket title (optional) as STRING or as ARRAYREF
        Title => '%SomeText%',
        Title => ['%SomeTest1%', '%SomeTest2%'],

        Queues   => ['system queue', 'other queue'],
        QueueIDs => [1, 42, 512],

        # use also sub queues of Queue|Queues in search
        UseSubQueues => 0,

        # You can use types like normal, ...
        Types   => ['normal', 'change', 'incident'],
        TypeIDs => [3, 4],

        # You can use states like new, open, pending reminder, ...
        States   => ['new', 'open'],
        StateIDs => [3, 4],

        # (Open|Closed) tickets for all closed or open tickets.
        StateType => 'Open',

        # You also can use real state types like new, open, closed,
        # pending reminder, pending auto, removed and merged.
        StateType    => ['open', 'new'],
        StateTypeIDs => [1, 2, 3],

        Priorities  => ['1 very low', '2 low', '3 normal'],
        PriorityIDs => [1, 2, 3],

        Services   => ['Service A', 'Service B'],
        ServiceIDs => [1, 2, 3],

        SLAs   => ['SLA A', 'SLA B'],
        SLAIDs => [1, 2, 3],

        Locks   => ['unlock'],
        LockIDs => [1, 2, 3],

        OwnerIDs => [1, 12, 455, 32]

        ResponsibleIDs => [1, 12, 455, 32]

        WatchUserIDs => [1, 12, 455, 32]

        # CustomerID (optional) as STRING or as ARRAYREF
        CustomerID => '123',
        CustomerID => ['123', 'ABC'],

        # CustomerIDRaw (optional) as STRING or as ARRAYREF
        # CustomerID without QueryCondition checking
        #The raw value will be used if is set this parameter
        CustomerIDRaw => '123 + 345',
        CustomerIDRaw => ['123', 'ABC','123 && 456','ABC % efg'],

        # CustomerUserLogin (optional) as STRING as ARRAYREF
        CustomerUserLogin => 'uid123',
        CustomerUserLogin => ['uid123', 'uid777'],

        # CustomerUserLoginRaw (optional) as STRING as ARRAYREF
        #The raw value will be used if is set this parameter
        CustomerUserLoginRaw => 'uid',
        CustomerUserLoginRaw => 'uid + 123',
        CustomerUserLoginRaw => ['uid  -  123', 'uid # 777 + 321'],

        # create ticket properties (optional)
        CreatedUserIDs     => [1, 12, 455, 32]
        CreatedTypes       => ['normal', 'change', 'incident'],
        CreatedTypeIDs     => [1, 2, 3],
        CreatedPriorities  => ['1 very low', '2 low', '3 normal'],
        CreatedPriorityIDs => [1, 2, 3],
        CreatedStates      => ['new', 'open'],
        CreatedStateIDs    => [3, 4],
        CreatedQueues      => ['system queue', 'other queue'],
        CreatedQueueIDs    => [1, 42, 512],

        # DynamicFields
        #   At least one operator must be specified. Operators will be connected with AND,
        #       values in an operator with OR.
        #   You can also pass more than one argument to an operator: ['value1', 'value2']
        DynamicField_FieldNameX => {
            Equals            => 123,
            Like              => 'value*',                # "equals" operator with wildcard support
            GreaterThan       => '2001-01-01 01:01:01',
            GreaterThanEquals => '2001-01-01 01:01:01',
            SmallerThan       => '2002-02-02 02:02:02',
            SmallerThanEquals => '2002-02-02 02:02:02',
        }

        # User ID for searching tickets by ticket flags (defaults to UserID)
        TicketFlagUserID => 1,

        # search for ticket flags
        TicketFlag => {
            Seen => 1,
        }

        # search for ticket flag that is absent, or a different value than the
        # one given:
        NotTicketFlag => {
            Seen => 1,
        },

        # User ID for searching tickets by article flags (defaults to UserID)
        ArticleFlagUserID => 1,


        # search for tickets by the presence of flags on articles
        ArticleFlag => {
            Important => 1,
        },

        # article stuff (optional)
        From    => '%spam@example.com%',
        To      => '%service@example.com%',
        Cc      => '%client@example.com%',
        Subject => '%VIRUS 32%',
        Body    => '%VIRUS 32%',

        # attachment stuff (optional, applies only for ArticleStorageDB)
        AttachmentName => '%anyfile.txt%',

        # use full article text index if configured (optional, default off)
        FullTextIndex => 1,

        # article content search (AND or OR for From, To, Cc, Subject and Body) (optional)
        ContentSearch => 'AND',

        # article content search prefix (for From, To, Cc, Subject and Body) (optional)
        ContentSearchPrefix => '*',

        # article content search suffix (for From, To, Cc, Subject and Body) (optional)
        ContentSearchSuffix => '*',

        # content conditions for From,To,Cc,Subject,Body
        # Title,CustomerID and CustomerUserLogin (all optional)
        ConditionInline => 1,

        # articles created more than 60 minutes ago (article older than 60 minutes) (optional)
        ArticleCreateTimeOlderMinutes => 60,
        # articles created less than 120 minutes ago (article newer than 60 minutes) (optional)
        ArticleCreateTimeNewerMinutes => 120,

        # articles with create time after ... (article newer than this date) (optional)
        ArticleCreateTimeNewerDate => '2006-01-09 00:00:01',
        # articles with created time before ... (article older than this date) (optional)
        ArticleCreateTimeOlderDate => '2006-01-19 23:59:59',

        # tickets created more than 60 minutes ago (ticket older than 60 minutes)  (optional)
        TicketCreateTimeOlderMinutes => 60,
        # tickets created less than 120 minutes ago (ticket newer than 120 minutes) (optional)
        TicketCreateTimeNewerMinutes => 120,

        # tickets with create time after ... (ticket newer than this date) (optional)
        TicketCreateTimeNewerDate => '2006-01-09 00:00:01',
        # tickets with created time before ... (ticket older than this date) (optional)
        TicketCreateTimeOlderDate => '2006-01-19 23:59:59',

        # ticket history entries that created more than 60 minutes ago (optional)
        TicketChangeTimeOlderMinutes => 60,
        # ticket history entries that created less than 120 minutes ago (optional)
        TicketChangeTimeNewerMinutes => 120,

        # tickets changed more than 60 minutes ago (optional)
        TicketLastChangeTimeOlderMinutes => 60,
        # tickets changed less than 120 minutes ago (optional)
        TicketLastChangeTimeNewerMinutes => 120,

        # tickets with changed time after ... (ticket changed newer than this date) (optional)
        TicketLastChangeTimeNewerDate => '2006-01-09 00:00:01',
        # tickets with changed time before ... (ticket changed older than this date) (optional)
        TicketLastChangeTimeOlderDate => '2006-01-19 23:59:59',

        # ticket history entry create time after ... (ticket history entries newer than this date) (optional)
        TicketChangeTimeNewerDate => '2006-01-09 00:00:01',
        # ticket history entry create time before ... (ticket history entries older than this date) (optional)
        TicketChangeTimeOlderDate => '2006-01-19 23:59:59',

        # tickets closed more than 60 minutes ago (optional)
        TicketCloseTimeOlderMinutes => 60,
        # tickets closed less than 120 minutes ago (optional)
        TicketCloseTimeNewerMinutes => 120,

        # tickets with closed time after ... (ticket closed newer than this date) (optional)
        TicketCloseTimeNewerDate => '2006-01-09 00:00:01',
        # tickets with closed time before ... (ticket closed older than this date) (optional)
        TicketCloseTimeOlderDate => '2006-01-19 23:59:59',

        # tickets with pending time of more than 60 minutes ago (optional)
        TicketPendingTimeOlderMinutes => 60,
        # tickets with pending time of less than 120 minutes ago (optional)
        TicketPendingTimeNewerMinutes => 120,

        # tickets with pending time after ... (optional)
        TicketPendingTimeNewerDate => '2006-01-09 00:00:01',
        # tickets with pending time before ... (optional)
        TicketPendingTimeOlderDate => '2006-01-19 23:59:59',

        # you can use all following escalation options with this four different ways of escalations
        # TicketEscalationTime...
        # TicketEscalationUpdateTime...
        # TicketEscalationResponseTime...
        # TicketEscalationSolutionTime...

        # ticket escalation time of more than 60 minutes ago (optional)
        TicketEscalationTimeOlderMinutes => -60,
        # ticket escalation time of less than 120 minutes ago (optional)
        TicketEscalationTimeNewerMinutes => -120,

        # tickets with escalation time after ... (optional)
        TicketEscalationTimeNewerDate => '2006-01-09 00:00:01',
        # tickets with escalation time before ... (optional)
        TicketEscalationTimeOlderDate => '2006-01-09 23:59:59',

        # search in archive (optional)
        # if archiving is on, if not specified the search processes unarchived only
        # 'y' searches archived tickets, 'n' searches unarchived tickets
        # if specified together all tickets are searched
        ArchiveFlags => ['y', 'n'],

        # OrderBy and SortBy (optional)
        OrderBy => 'Down',  # Down|Up
        SortBy  => 'Age',   # Created|Owner|Responsible|CustomerID|State|TicketNumber|Queue|Priority|Age|Type|Lock
                            # Changed|Title|Service|SLA|PendingTime|EscalationTime
                            # EscalationUpdateTime|EscalationResponseTime|EscalationSolutionTime
                            # DynamicField_FieldNameX

        # OrderBy and SortBy as ARRAY for sub sorting (optional)
        OrderBy => ['Down', 'Up'],
        SortBy  => ['Priority', 'Age'],

        # user search (UserID is required)
        UserID     => 123,
        Permission => 'ro' || 'rw',

        # customer search (CustomerUserID is required)
        CustomerUserID => 123,
        Permission     => 'ro' || 'rw',

        # CacheTTL, cache search result in seconds (optional)
        CacheTTL => 60 * 15,
    );

Returns:

Result: 'ARRAY'

    @TicketIDs = ( 1, 2, 3 );

Result: 'HASH'

    %TicketIDs = (
        1 => '2010102700001',
        2 => '2010102700002',
        3 => '2010102700003',
    );

Result: 'COUNT'

    $TicketIDs = 123;

=cut

sub TicketSearch {
    my ( $Self, %Param ) = @_;

    my $Result  = $Param{Result}  || 'HASH';
    my $OrderBy = $Param{OrderBy} || 'Down';
    my $SortBy  = $Param{SortBy}  || 'Age';
    my $Limit   = $Param{Limit}   || 10000;

    if ( !$Param{ContentSearch} ) {
        $Param{ContentSearch} = 'AND';
    }

    my %SortOptions = (
        Owner                  => 'st.user_id',
        Responsible            => 'st.responsible_user_id',
        CustomerID             => 'st.customer_id',
        State                  => 'st.ticket_state_id',
        Lock                   => 'st.ticket_lock_id',
        Ticket                 => 'st.tn',
        TicketNumber           => 'st.tn',
        Title                  => 'st.title',
        Queue                  => 'sq.name',
        Type                   => 'st.type_id',
        Priority               => 'st.ticket_priority_id',
        Age                    => 'st.create_time_unix',
        Created                => 'st.create_time',
        Changed                => 'st.change_time',
        Service                => 'st.service_id',
        SLA                    => 'st.sla_id',
        PendingTime            => 'st.until_time',
        TicketEscalation       => 'st.escalation_time',
        EscalationTime         => 'st.escalation_time',
        EscalationUpdateTime   => 'st.escalation_update_time',
        EscalationResponseTime => 'st.escalation_response_time',
        EscalationSolutionTime => 'st.escalation_solution_time',
    );

    # check required params
    if ( !$Param{UserID} && !$Param{CustomerUserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID or CustomerUserID params for permission check!',
        );
        return;
    }

    # check types of given arguments
    ARGUMENT:
    for my $Key (
        qw(
        Types TypeIDs CreatedTypes CreatedTypeIDs States StateIDs CreatedStates CreatedStateIDs StateTypeIDs
        Locks LockIDs OwnerIDs ResponsibleIDs CreatedUserIDs Queues QueueIDs CreatedQueues CreatedQueueIDs
        Priorities PriorityIDs CreatedPriorities CreatedPriorityIDs Services ServiceIDs SLAs SLAIDs WatchUserIDs
        )
        )
    {
        next ARGUMENT if !$Param{$Key};
        next ARGUMENT if ref $Param{$Key} eq 'ARRAY' && @{ $Param{$Key} };

        # log error
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "The given param '$Key' is invalid or an empty array reference!",
        );
        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # quote id array elements
    ARGUMENT:
    for my $Key (
        qw(
        TypeIDs CreatedTypeIDs StateIDs CreatedStateIDs StateTypeIDs LockIDs OwnerIDs ResponsibleIDs CreatedUserIDs
        QueueIDs CreatedQueueIDs PriorityIDs CreatedPriorityIDs ServiceIDs SLAIDs WatchUserIDs
        )
        )
    {
        next ARGUMENT if !$Param{$Key};

        # quote elements
        for my $Element ( @{ $Param{$Key} } ) {
            if ( !defined $DBObject->Quote( $Element, 'Integer' ) ) {

                # log error
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "The given param '$Element' in '$Key' is invalid!",
                );
                return;
            }
        }
    }

    my $TicketDynamicFields  = [];
    my $ArticleDynamicFields = [];
    my %ValidDynamicFieldParams;
    my %TicketDynamicFieldName2Config;
    my %ArticleDynamicFieldName2Config;

    # Only fetch DynamicField data if a field was requested for searching or sorting
    my $ParamCheckString = ( join '', keys %Param ) || '';

    if ( ref $Param{SortBy} eq 'ARRAY' ) {
        $ParamCheckString .= ( join '', @{ $Param{SortBy} } );
    }
    elsif ( ref $Param{SortBy} ne 'HASH' ) {
        $ParamCheckString .= $Param{SortBy} || '';
    }

    if ( $ParamCheckString =~ m/DynamicField_/smx ) {

        # get dynamic field object
        my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

        # Check all configured ticket dynamic fields
        $TicketDynamicFields = $DynamicFieldObject->DynamicFieldListGet(
            ObjectType => 'Ticket',
        );

        for my $DynamicField ( @{$TicketDynamicFields} ) {
            $ValidDynamicFieldParams{ "DynamicField_" . $DynamicField->{Name} } = 1;
            $TicketDynamicFieldName2Config{ $DynamicField->{Name} } = $DynamicField;
        }

        # Check all configured article dynamic fields
        $ArticleDynamicFields = $DynamicFieldObject->DynamicFieldListGet(
            ObjectType => 'Article',
        );

        for my $DynamicField ( @{$ArticleDynamicFields} ) {
            $ValidDynamicFieldParams{ "DynamicField_" . $DynamicField->{Name} } = 1;
            $ArticleDynamicFieldName2Config{ $DynamicField->{Name} } = $DynamicField;
        }
    }

    # check sort/order by options
    my @SortByArray = ( ref $SortBy eq 'ARRAY' ? @{$SortBy} : ($SortBy) );
    my %LookupSortByArray = map { $_ => 1 } @SortByArray;
    my @OrderByArray = ( ref $OrderBy eq 'ARRAY' ? @{$OrderBy} : ($OrderBy) );

    for my $Count ( 0 .. $#SortByArray ) {
        if (
            !$SortOptions{ $SortByArray[$Count] }
            && !$ValidDynamicFieldParams{ $SortByArray[$Count] }
            )
        {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => 'Need valid SortBy (' . $SortByArray[$Count] . ')!',
            );
            return;
        }
        if ( $OrderByArray[$Count] ne 'Down' && $OrderByArray[$Count] ne 'Up' ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => 'Need valid OrderBy (' . $OrderByArray[$Count] . ')!',
            );
            return;
        }
    }

    # create sql
    my $SQLSelect;
    if ( $Result eq 'COUNT' ) {
        $SQLSelect = 'SELECT COUNT(DISTINCT(st.id))';
    }
    else {
        $SQLSelect = 'SELECT DISTINCT st.id, st.tn';
    }

    my $SQLFrom = ' FROM ticket st ';

    my $ArticleJoinSQL = $Self->_ArticleIndexQuerySQL( Data => \%Param ) || '';

    # sql, use also article table if needed
    $SQLFrom .= $ArticleJoinSQL;

    # only search for attachment name if Article Storage is set to DB
    if (
        $Param{AttachmentName}
        && (
            $Kernel::OM->Get('Kernel::Config')->Get('Ticket::StorageModule') eq
            'Kernel::System::Ticket::ArticleStorageDB'
        )
        )
    {

        # joins to article and article_attachments are needed, it can not use existing article joins
        # otherwise the search will be limited to already matching articles
        my $AttachmentJoinSQL = '
        INNER JOIN article art_for_att ON st.id = art_for_att.ticket_id
        INNER JOIN article_attachment att ON att.article_id = art_for_att.id ';

        # SQL, use also article_attachment table if needed
        $SQLFrom .= $AttachmentJoinSQL;
    }

    # use also history table if required
    ARGUMENT:
    for my $Key ( sort keys %Param ) {
        if ( $Param{$Key} && $Key =~ /^(Ticket(Close|Change)Time(Newer|Older)(Date|Minutes)|Created.+?)/ ) {
            $SQLFrom .= 'INNER JOIN ticket_history th ON st.id = th.ticket_id ';
            last ARGUMENT;
        }
    }

    # add ticket watcher table
    if ( $Param{WatchUserIDs} ) {
        $SQLFrom .= 'INNER JOIN ticket_watcher tw ON st.id = tw.ticket_id ';
    }

    my $SQLExt = ' WHERE 1=1';

    # Limit the search to just one (or a list) TicketID (used by the GenericAgent
    #   to filter for events on single tickets with the job's ticket filter).
    if ( $Param{TicketID} ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'st.id',
            IDRef       => ref( $Param{TicketID} ) && ref( $Param{TicketID} ) eq 'ARRAY'
            ? $Param{TicketID}
            : [ $DBObject->Quote( $Param{TicketID}, 'Integer' ) ],
        );
    }

    # add ticket flag table
    if ( $Param{TicketFlag} ) {
        my $Index = 1;
        for my $Key ( sort keys %{ $Param{TicketFlag} } ) {
            $SQLFrom .= "INNER JOIN ticket_flag tf$Index ON st.id = tf$Index.ticket_id ";
            $Index++;
        }
    }

    # add article and article_flag tables
    if ( $Param{ArticleFlag} ) {
        my $Index = 1;
        for my $Key ( sort keys %{ $Param{ArticleFlag} } ) {
            $SQLFrom .= "INNER JOIN article ataf$Index ON st.id = ataf$Index.ticket_id ";
            $SQLFrom .=
                "INNER JOIN article_flag taf$Index ON ataf$Index.id = taf$Index.article_id ";
            $Index++;
        }
    }

    if ( $Param{NotTicketFlag} ) {
        my $TicketFlagUserID = $Param{TicketFlagUserID} || $Param{UserID};
        return if !defined $TicketFlagUserID;

        my $Index = 1;
        for my $Key ( sort keys %{ $Param{NotTicketFlag} } ) {
            $SQLFrom .= "LEFT JOIN ticket_flag ntf$Index ON st.id = ntf$Index.ticket_id  "
                . " AND ntf$Index.ticket_key = '" . $DBObject->Quote($Key) . "'"
                . " AND ntf$Index.create_by = "
                . $DBObject->Quote( $TicketFlagUserID, 'Integer' )
                . ' ';
            $Index++;
        }
    }

    # current type lookup
    if ( $Param{Types} ) {

        # get type object
        my $TypeObject = $Kernel::OM->Get('Kernel::System::Type');

        for my $Type ( @{ $Param{Types} } ) {

            # lookup type id
            my $TypeID = $TypeObject->TypeLookup(
                Type => $Type,
            );
            return if !$TypeID;
            push @{ $Param{TypeIDs} }, $TypeID;
        }
    }

    # type ids
    if ( $Param{TypeIDs} ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'st.type_id',
            IDRef       => $Param{TypeIDs},
        );
    }

    # created types lookup
    if ( $Param{CreatedTypes} ) {

        # get type object
        my $TypeObject = $Kernel::OM->Get('Kernel::System::Type');

        for my $Type ( @{ $Param{CreatedTypes} } ) {

            # lookup type id
            my $TypeID = $TypeObject->TypeLookup(
                Type => $Type,
            );

            return if !$TypeID;

            push @{ $Param{CreatedTypeIDs} }, $TypeID;
        }
    }

    # created type ids
    if ( $Param{CreatedTypeIDs} ) {

        # lookup history type id
        my $HistoryTypeID = $Self->HistoryTypeLookup(
            Type => 'NewTicket',
        );

        if ($HistoryTypeID) {

            # create sql part
            $SQLExt .= $Self->_InConditionGet(
                TableColumn => 'th.type_id',
                IDRef       => $Param{CreatedTypeIDs},
            );
            $SQLExt .= " AND th.history_type_id = $HistoryTypeID ";
        }
    }

    # current state lookup
    if ( $Param{States} ) {

        # get state object
        my $StateObject = $Kernel::OM->Get('Kernel::System::State');

        for my $State ( @{ $Param{States} } ) {

            # get state data
            my %StateData = $StateObject->StateGet(
                Name => $State,
            );

            return if !%StateData;

            push @{ $Param{StateIDs} }, $StateData{ID};
        }
    }

    # state ids
    if ( $Param{StateIDs} ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'st.ticket_state_id',
            IDRef       => $Param{StateIDs},
        );
    }

    # created states lookup
    if ( $Param{CreatedStates} ) {

        # get state object
        my $StateObject = $Kernel::OM->Get('Kernel::System::State');

        for my $State ( @{ $Param{CreatedStates} } ) {

            # get state data
            my %StateData = $StateObject->StateGet(
                Name => $State,
            );

            return if !%StateData;

            push @{ $Param{CreatedStateIDs} }, $StateData{ID};
        }
    }

    # created state ids
    if ( $Param{CreatedStateIDs} ) {

        # lookup history type id
        my $HistoryTypeID = $Self->HistoryTypeLookup(
            Type => 'NewTicket',
        );

        if ($HistoryTypeID) {

            # create sql part
            $SQLExt .= $Self->_InConditionGet(
                TableColumn => 'th.state_id',
                IDRef       => $Param{CreatedStateIDs},
            );
            $SQLExt .= " AND th.history_type_id = $HistoryTypeID ";
        }
    }

    # current ticket state type
    # NOTE: Open and Closed are not valid state types. It's for compat.
    # Open   -> All states which are grouped as open (new, open, pending, ...)
    # Closed -> All states which are grouped as closed (closed successful, closed unsuccessful)
    if ( $Param{StateType} && $Param{StateType} eq 'Open' ) {
        my @ViewableStateIDs = $Kernel::OM->Get('Kernel::System::State')->StateGetStatesByType(
            Type   => 'Viewable',
            Result => 'ID',
        );
        $SQLExt .= " AND st.ticket_state_id IN ( ${\(join ', ', sort @ViewableStateIDs)} ) ";
    }
    elsif ( $Param{StateType} && $Param{StateType} eq 'Closed' ) {
        my @ViewableStateIDs = $Kernel::OM->Get('Kernel::System::State')->StateGetStatesByType(
            Type   => 'Viewable',
            Result => 'ID',
        );
        $SQLExt .= " AND st.ticket_state_id NOT IN ( ${\(join ', ', sort @ViewableStateIDs)} ) ";
    }

    # current ticket state type
    elsif ( $Param{StateType} ) {
        my @StateIDs = $Kernel::OM->Get('Kernel::System::State')->StateGetStatesByType(
            StateType => $Param{StateType},
            Result    => 'ID',
        );
        return if !$StateIDs[0];
        $SQLExt .= " AND st.ticket_state_id IN ( ${\(join ', ', sort {$a <=> $b} @StateIDs)} ) ";
    }

    if ( $Param{StateTypeIDs} ) {

        # get state object
        my $StateObject = $Kernel::OM->Get('Kernel::System::State');

        my %StateTypeList = $StateObject->StateTypeList(
            UserID => $Param{UserID} || 1,
        );
        my @StateTypes = map { $StateTypeList{$_} } @{ $Param{StateTypeIDs} };
        my @StateIDs = $StateObject->StateGetStatesByType(
            StateType => \@StateTypes,
            Result    => 'ID',
        );

        return if !$StateIDs[0];

        $SQLExt .= " AND st.ticket_state_id IN ( ${\(join ', ', sort {$a <=> $b} @StateIDs)} ) ";
    }

    # current lock lookup
    if ( $Param{Locks} ) {

        for my $Lock ( @{ $Param{Locks} } ) {

            # lookup lock id
            my $LockID = $Kernel::OM->Get('Kernel::System::Lock')->LockLookup(
                Lock => $Lock,
            );

            return if !$LockID;

            push @{ $Param{LockIDs} }, $LockID;
        }
    }

    # lock ids
    if ( $Param{LockIDs} ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'st.ticket_lock_id',
            IDRef       => $Param{LockIDs},
        );
    }

    # current owner user ids
    if ( $Param{OwnerIDs} ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'st.user_id',
            IDRef       => $Param{OwnerIDs},
        );
    }

    # current responsible user ids
    if ( $Param{ResponsibleIDs} ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'st.responsible_user_id',
            IDRef       => $Param{ResponsibleIDs},
        );
    }

    # created user ids
    if ( $Param{CreatedUserIDs} ) {

        # lookup history type id
        my $HistoryTypeID = $Self->HistoryTypeLookup(
            Type => 'NewTicket',
        );

        if ($HistoryTypeID) {

            # create sql part
            $SQLExt .= $Self->_InConditionGet(
                TableColumn => 'th.create_by',
                IDRef       => $Param{CreatedUserIDs},
            );
            $SQLExt .= " AND th.history_type_id = $HistoryTypeID ";
        }
    }

    # current queue lookup
    if ( $Param{Queues} ) {

        # get queue object
        my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');

        for my $Queue ( @{ $Param{Queues} } ) {

            # lookup queue id
            my $QueueID = $QueueObject->QueueLookup(
                Queue => $Queue,
            );

            return if !$QueueID;

            push @{ $Param{QueueIDs} }, $QueueID;
        }
    }

    # current sub queue ids
    if ( $Param{UseSubQueues} && $Param{QueueIDs} ) {

        # get queue object
        my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');

        my @SubQueueIDs;
        my %Queues = $QueueObject->GetAllQueues();

        for my $QueueID ( @{ $Param{QueueIDs} } ) {

            my $Queue = $QueueObject->QueueLookup( QueueID => $QueueID );

            for my $QueuesID ( sort keys %Queues ) {
                if ( $Queues{$QueuesID} =~ /^\Q$Queue\E::/i ) {
                    push @SubQueueIDs, $QueuesID;
                }
            }
        }

        push @{ $Param{QueueIDs} }, @SubQueueIDs;
    }

    # current queue ids
    if ( $Param{QueueIDs} ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'st.queue_id',
            IDRef       => $Param{QueueIDs},
        );
    }

    # created queue lookup
    if ( $Param{CreatedQueues} ) {

        # get queue object
        my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');

        for my $Queue ( @{ $Param{CreatedQueues} } ) {

            # lookup queue id
            my $QueueID = $QueueObject->QueueLookup(
                Queue => $Queue,
            );

            return if !$QueueID;

            push @{ $Param{CreatedQueueIDs} }, $QueueID;
        }
    }

    # created queue ids
    if ( $Param{CreatedQueueIDs} ) {

        # lookup history type id
        my $HistoryTypeID = $Self->HistoryTypeLookup(
            Type => 'NewTicket',
        );

        if ($HistoryTypeID) {

            # create sql part
            $SQLExt .= $Self->_InConditionGet(
                TableColumn => 'th.queue_id',
                IDRef       => $Param{CreatedQueueIDs},
            );
            $SQLExt .= " AND th.history_type_id = $HistoryTypeID ";
        }
    }

    my %GroupList;

    # user groups
    if ( $Param{UserID} && $Param{UserID} != 1 ) {

        # get users groups
        %GroupList = $Kernel::OM->Get('Kernel::System::Group')->PermissionUserGet(
            UserID => $Param{UserID},
            Type   => $Param{Permission} || 'ro',
        );

        # return if we have no permissions
        return if !%GroupList;
    }

    # customer groups
    elsif ( $Param{CustomerUserID} ) {

        %GroupList = $Kernel::OM->Get('Kernel::System::CustomerGroup')->GroupMemberList(
            UserID => $Param{CustomerUserID},
            Type   => $Param{Permission} || 'ro',
            Result => 'HASH',
        );

        # return if we have no permissions
        return if !%GroupList;

        # get all customer ids
        $SQLExt .= ' AND (';
        my @CustomerIDs = $Kernel::OM->Get('Kernel::System::CustomerUser')->CustomerIDs(
            User => $Param{CustomerUserID},
        );

        if (@CustomerIDs) {

            my $Lower = '';
            if ( $DBObject->GetDatabaseFunction('CaseSensitive') ) {
                $Lower = 'LOWER';
            }

            $SQLExt .= "$Lower(st.customer_id) IN (";
            my $Exists = 0;

            for (@CustomerIDs) {

                if ($Exists) {
                    $SQLExt .= ', ';
                }
                else {
                    $Exists = 1;
                }
                $SQLExt .= "$Lower('" . $DBObject->Quote($_) . "')";
            }
            $SQLExt .= ') OR ';
        }

        # get all own tickets
        my $CustomerUserIDQuoted = $DBObject->Quote( $Param{CustomerUserID} );
        $SQLExt .= "st.customer_user_id = '$CustomerUserIDQuoted') ";
    }

    # add group ids to sql string
    if (%GroupList) {

        my $GroupIDString = join ',', sort keys %GroupList;

        $SQLExt .= " AND sq.group_id IN ($GroupIDString) ";
    }

    # current priority lookup
    if ( $Param{Priorities} ) {

        # get priority object
        my $PriorityObject = $Kernel::OM->Get('Kernel::System::Priority');

        for my $Priority ( @{ $Param{Priorities} } ) {

            # lookup priority id
            my $PriorityID = $PriorityObject->PriorityLookup(
                Priority => $Priority,
            );

            return if !$PriorityID;

            push @{ $Param{PriorityIDs} }, $PriorityID;
        }
    }

    # priority ids
    if ( $Param{PriorityIDs} ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'st.ticket_priority_id',
            IDRef       => $Param{PriorityIDs},
        );
    }

    # created priority lookup
    if ( $Param{CreatedPriorities} ) {

        # get priority object
        my $PriorityObject = $Kernel::OM->Get('Kernel::System::Priority');

        for my $Priority ( @{ $Param{CreatedPriorities} } ) {

            # lookup priority id
            my $PriorityID = $PriorityObject->PriorityLookup(
                Priority => $Priority,
            );

            return if !$PriorityID;

            push @{ $Param{CreatedPriorityIDs} }, $PriorityID;
        }
    }

    # created priority ids
    if ( $Param{CreatedPriorityIDs} ) {

        # lookup history type id
        my $HistoryTypeID = $Self->HistoryTypeLookup(
            Type => 'NewTicket',
        );

        if ($HistoryTypeID) {

            # create sql part
            $SQLExt .= $Self->_InConditionGet(
                TableColumn => 'th.priority_id',
                IDRef       => $Param{CreatedPriorityIDs},
            );
            $SQLExt .= " AND th.history_type_id = $HistoryTypeID ";
        }
    }

    # current service lookup
    if ( $Param{Services} ) {

        # get service object
        my $ServiceObject = $Kernel::OM->Get('Kernel::System::Service');

        for my $Service ( @{ $Param{Services} } ) {

            # lookup service id
            my $ServiceID = $ServiceObject->ServiceLookup(
                Name => $Service,
            );

            return if !$ServiceID;

            push @{ $Param{ServiceIDs} }, $ServiceID;
        }
    }

    # service ids
    if ( $Param{ServiceIDs} ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'st.service_id',
            IDRef       => $Param{ServiceIDs},
        );
    }

    # current sla lookup
    if ( $Param{SLAs} ) {

        # get sla object
        my $SLAObject = $Kernel::OM->Get('Kernel::System::SLA');

        for my $SLA ( @{ $Param{SLAs} } ) {

            # lookup sla id
            my $SLAID = $SLAObject->SLALookup(
                Name => $SLA,
            );

            return if !$SLAID;

            push @{ $Param{SLAIDs} }, $SLAID;
        }
    }

    # sla ids
    if ( $Param{SLAIDs} ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'st.sla_id',
            IDRef       => $Param{SLAIDs},
        );
    }

    # watch user ids
    if ( $Param{WatchUserIDs} ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'tw.user_id',
            IDRef       => $Param{WatchUserIDs},
        );
    }

    # add ticket flag extension
    if ( $Param{TicketFlag} ) {

        my $TicketFlagUserID = $Param{TicketFlagUserID} || $Param{UserID};
        return if !defined $TicketFlagUserID;

        my $Index = 1;
        for my $Key ( sort keys %{ $Param{TicketFlag} } ) {
            my $Value = $Param{TicketFlag}->{$Key};
            return if !defined $Value;

            $SQLExt .= " AND tf$Index.ticket_key = '" . $DBObject->Quote($Key) . "'";
            $SQLExt .= " AND tf$Index.ticket_value = '" . $DBObject->Quote($Value) . "'";
            $SQLExt .= " AND tf$Index.create_by = "
                . $DBObject->Quote( $TicketFlagUserID, 'Integer' );

            $Index++;
        }
    }

    # add article flag extension
    if ( $Param{ArticleFlag} ) {
        my $ArticleFlagUserID = $Param{ArticleFlagUserID} || $Param{UserID};
        return if !defined $ArticleFlagUserID;

        my $Index = 1;
        for my $Key ( sort keys %{ $Param{ArticleFlag} } ) {
            my $Value = $Param{ArticleFlag}->{$Key};
            return if !defined $Value;

            $SQLExt .= " AND taf$Index.article_key = '" . $DBObject->Quote($Key) . "'";
            $SQLExt .= " AND taf$Index.article_value = '" . $DBObject->Quote($Value) . "'";
            $SQLExt .= " AND taf$Index.create_by = "
                . $DBObject->Quote( $ArticleFlagUserID, 'Integer' );

            $Index++;
        }
    }

    if ( $Param{NotTicketFlag} ) {
        my $Index = 1;
        for my $Key ( sort keys %{ $Param{NotTicketFlag} } ) {
            my $Value = $Param{NotTicketFlag}->{$Key};
            return if !defined $Value;

            $SQLExt .= " AND (ntf$Index.ticket_value IS NULL "
                . "OR ntf$Index.ticket_value <> '" . $DBObject->Quote($Value) . "')";

            $Index++;
        }
    }

    # other ticket stuff
    my %FieldSQLMap = (
        TicketNumber         => 'st.tn',
        Title                => 'st.title',
        CustomerID           => 'st.customer_id',
        CustomerIDRaw        => 'st.customer_id',
        CustomerUserLogin    => 'st.customer_user_id',
        CustomerUserLoginRaw => 'st.customer_user_id',
    );

    ATTRIBUTE:
    for my $Key ( sort keys %FieldSQLMap ) {

        next ATTRIBUTE if !defined $Param{$Key};

        next ATTRIBUTE if ( ( $Key eq 'CustomerID' ) && ( defined $Param{CustomerIDRaw} ) );
        next ATTRIBUTE
            if ( ( $Key eq 'CustomerUserLogin' ) && ( defined $Param{CustomerUserLoginRaw} ) );

        # if it's no ref, put it to array ref
        if ( ref $Param{$Key} eq '' ) {
            $Param{$Key} = [ $Param{$Key} ];
        }

        # proccess array ref
        my $Used = 0;

        VALUE:
        for my $Value ( @{ $Param{$Key} } ) {

            next VALUE if !$Value;

            # replace wild card search
            if (
                $Key ne 'CustomerIDRaw'
                && $Key ne 'CustomerUserLoginRaw'
                )
            {
                $Value =~ s/\*/%/gi;
            }

            # check search attribute, we do not need to search for *
            next VALUE if $Value =~ /^\%{1,3}$/;

            if ( !$Used ) {
                $SQLExt .= ' AND (';
                $Used = 1;
            }
            else {
                $SQLExt .= ' OR ';
            }

            # add * to prefix/suffix on title search
            my %ConditionFocus;
            if ( $Param{ConditionInline} && $Key eq 'Title' ) {
                $ConditionFocus{Extended} = 1;
                if ( $Param{ContentSearchPrefix} ) {
                    $ConditionFocus{SearchPrefix} = $Param{ContentSearchPrefix};
                }
                if ( $Param{ContentSearchSuffix} ) {
                    $ConditionFocus{SearchSuffix} = $Param{ContentSearchSuffix};
                }
            }

            if ( $Key eq 'CustomerIDRaw' || $Key eq 'CustomerUserLoginRaw' ) {
                $SQLExt .= " $FieldSQLMap{$Key}= '" . $DBObject->Quote($Value) . "'";
            }
            else {

                # use search condition extension
                $SQLExt .= $DBObject->QueryCondition(
                    Key   => $FieldSQLMap{$Key},
                    Value => $Value,
                    %ConditionFocus,
                );
            }
        }
        if ($Used) {
            $SQLExt .= ')';
        }
    }

    # search article attributes
    my $ArticleIndexSQLExt = $Self->_ArticleIndexQuerySQLExt( Data => \%Param );
    $SQLExt .= $ArticleIndexSQLExt;

    my %CustomerArticleTypes;
    my @CustomerArticleTypeIDs;
    if ( $Param{CustomerUserID} ) {
        %CustomerArticleTypes = $Self->ArticleTypeList(
            Result => 'HASH',
            Type   => 'Customer',
        );
        @CustomerArticleTypeIDs = keys %CustomerArticleTypes;
    }

    # restrict search from customers to only customer articles
    if ( $Param{CustomerUserID} && $ArticleIndexSQLExt ) {
        $SQLExt .= $Self->_InConditionGet(
            TableColumn => 'art.article_type_id',
            IDRef       => \@CustomerArticleTypeIDs,
        );
    }

    # only search for attachment name if Article Storage is set to DB
    if (
        $Param{AttachmentName}
        && (
            $Kernel::OM->Get('Kernel::Config')->Get('Ticket::StorageModule') eq
            'Kernel::System::Ticket::ArticleStorageDB'
        )
        )
    {
        $SQLExt .= ' AND ';

        # replace wild card search
        my $Key   = 'att.filename';
        my $Value = $Param{AttachmentName};
        $Value =~ s/\*/%/gi;

        # use search condition extension
        $SQLExt .= $DBObject->QueryCondition(
            Key          => $Key,
            Value        => $Value,
            SearchPrefix => $Param{ContentSearchPrefix},
            SearchSuffix => $Param{ContentSearchSuffix},
        );

        # restrict search from customers to only customer articles
        if ( $Param{CustomerUserID} ) {
            $SQLExt .= $Self->_InConditionGet(
                TableColumn => 'art_for_att.article_type_id',
                IDRef       => \@CustomerArticleTypeIDs,
            );
        }
    }

    # Remember already joined tables for sorting.
    my %DynamicFieldJoinTables;
    my $DynamicFieldJoinCounter = 1;

    # get dynamic field backend object
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    DYNAMIC_FIELD:
    for my $DynamicField ( @{$TicketDynamicFields}, @{$ArticleDynamicFields} ) {
        my $SearchParam = $Param{ "DynamicField_" . $DynamicField->{Name} };

        next DYNAMIC_FIELD if ( !$SearchParam );
        next DYNAMIC_FIELD if ( ref $SearchParam ne 'HASH' );

        my $NeedJoin;

        for my $Operator ( sort keys %{$SearchParam} ) {

            my @SearchParams = ( ref $SearchParam->{$Operator} eq 'ARRAY' )
                ? @{ $SearchParam->{$Operator} }
                : ( $SearchParam->{$Operator} );

            my $SQLExtSub = ' AND (';
            my $Counter   = 0;
            TEXT:
            for my $Text (@SearchParams) {
                next TEXT if ( !defined $Text || $Text eq '' );

                $Text =~ s/\*/%/gi;

                # check search attribute, we do not need to search for *
                next TEXT if $Text =~ /^\%{1,3}$/;

                # validate data type
                my $ValidateSuccess = $DynamicFieldBackendObject->ValueValidate(
                    DynamicFieldConfig => $DynamicField,
                    Value              => $Text,
                    UserID             => $Param{UserID} || 1,
                );
                if ( !$ValidateSuccess ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message =>
                            "Search not executed due to invalid value '"
                            . $Text
                            . "' on field '"
                            . $DynamicField->{Name}
                            . "'!",
                    );
                    return;
                }

                if ($Counter) {
                    $SQLExtSub .= ' OR ';
                }
                $SQLExtSub .= $DynamicFieldBackendObject->SearchSQLGet(
                    DynamicFieldConfig => $DynamicField,
                    TableAlias         => "dfv$DynamicFieldJoinCounter",
                    Operator           => $Operator,
                    SearchTerm         => $Text,
                );

                $Counter++;
            }
            $SQLExtSub .= ')';
            if ($Counter) {
                $SQLExt .= $SQLExtSub;
                $NeedJoin = 1;
            }
        }

        if ($NeedJoin) {

            if ( $DynamicField->{ObjectType} eq 'Ticket' ) {

                # Join the table for this dynamic field
                $SQLFrom .= "INNER JOIN dynamic_field_value dfv$DynamicFieldJoinCounter
                    ON (st.id = dfv$DynamicFieldJoinCounter.object_id
                        AND dfv$DynamicFieldJoinCounter.field_id = " .
                    $DBObject->Quote( $DynamicField->{ID}, 'Integer' ) . ") ";
            }
            elsif ( $DynamicField->{ObjectType} eq 'Article' ) {
                if ( !$ArticleJoinSQL ) {
                    $ArticleJoinSQL = ' INNER JOIN article art ON st.id = art.ticket_id ';
                    $SQLFrom .= $ArticleJoinSQL;
                }

                $SQLFrom .= "INNER JOIN dynamic_field_value dfv$DynamicFieldJoinCounter
                    ON (art.id = dfv$DynamicFieldJoinCounter.object_id
                        AND dfv$DynamicFieldJoinCounter.field_id = " .
                    $DBObject->Quote( $DynamicField->{ID}, 'Integer' ) . ") ";

            }

            $DynamicFieldJoinTables{ $DynamicField->{Name} } = "dfv$DynamicFieldJoinCounter";

            $DynamicFieldJoinCounter++;
        }
    }

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    # remember current time to prevent searches for future timestamps
    my $CurrentSystemTime = $TimeObject->SystemTime();

    # get articles created older/newer than x minutes or older/newer than a date
    my %ArticleTime = (
        ArticleCreateTime => 'art.incoming_time',
    );
    for my $Key ( sort keys %ArticleTime ) {

        # get articles created older than x minutes
        if ( defined $Param{ $Key . 'OlderMinutes' } ) {

            $Param{ $Key . 'OlderMinutes' } ||= 0;

            my $Time = $TimeObject->SystemTime()
                - ( $Param{ $Key . 'OlderMinutes' } * 60 );

            $SQLExt .= " AND $ArticleTime{$Key} <= '$Time'";
        }

        # get articles created newer than x minutes
        if ( defined $Param{ $Key . 'NewerMinutes' } ) {

            $Param{ $Key . 'NewerMinutes' } ||= 0;

            my $Time = $TimeObject->SystemTime()
                - ( $Param{ $Key . 'NewerMinutes' } * 60 );

            $SQLExt .= " AND $ArticleTime{$Key} >= '$Time'";
        }

        # get articles created older than xxxx-xx-xx xx:xx date
        my $CompareOlderNewerDate;
        if ( $Param{ $Key . 'OlderDate' } ) {
            if (
                $Param{ $Key . 'OlderDate' }
                !~ /(\d\d\d\d)-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
                )
            {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Invalid time format '" . $Param{ $Key . 'OlderDate' } . "'!",
                );
                return;
            }

            # convert param date to system time
            my $SystemTime = $TimeObject->Date2SystemTime(
                Year   => $1,
                Month  => $2,
                Day    => $3,
                Hour   => $4,
                Minute => $5,
                Second => $6,
            );
            if ( !$SystemTime ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message =>
                        "Search not executed due to invalid time '"
                        . $Param{ $Key . 'OlderDate' } . "'!",
                );
                return;
            }
            $CompareOlderNewerDate = $SystemTime;

            $SQLExt .= " AND $ArticleTime{$Key} <= '" . $SystemTime . "'";

        }

        # get articles created newer than xxxx-xx-xx xx:xx date
        if ( $Param{ $Key . 'NewerDate' } ) {
            if (
                $Param{ $Key . 'NewerDate' }
                !~ /(\d\d\d\d)-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
                )
            {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Invalid time format '" . $Param{ $Key . 'NewerDate' } . "'!",
                );
                return;
            }

            # convert param date to system time
            my $SystemTime = $TimeObject->Date2SystemTime(
                Year   => $1,
                Month  => $2,
                Day    => $3,
                Hour   => $4,
                Minute => $5,
                Second => $6,
            );
            if ( !$SystemTime ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message =>
                        "Search not executed due to invalid time '"
                        . $Param{ $Key . 'NewerDate' } . "'!",
                );
                return;
            }

            # don't execute queries if newer date is after current date
            return if $SystemTime > $CurrentSystemTime;

            # don't execute queries if older/newer date restriction show now valid timeframe
            return if $CompareOlderNewerDate && $SystemTime > $CompareOlderNewerDate;

            $SQLExt .= " AND $ArticleTime{$Key} >= '" . $SystemTime . "'";
        }
    }

    # get tickets created/escalated older/newer than x minutes
    my %TicketTime = (
        TicketCreateTime             => 'st.create_time_unix',
        TicketEscalationTime         => 'st.escalation_time',
        TicketEscalationUpdateTime   => 'st.escalation_update_time',
        TicketEscalationResponseTime => 'st.escalation_response_time',
        TicketEscalationSolutionTime => 'st.escalation_solution_time',
    );
    for my $Key ( sort keys %TicketTime ) {

        # get tickets created or escalated older than x minutes
        if ( defined $Param{ $Key . 'OlderMinutes' } ) {

            $Param{ $Key . 'OlderMinutes' } ||= 0;

            # exclude tickets with no escalation
            if ( $Key =~ m{ \A TicketEscalation }xms ) {
                $SQLExt .= " AND $TicketTime{$Key} != 0";
            }

            my $Time = $TimeObject->SystemTime();
            $Time -= ( $Param{ $Key . 'OlderMinutes' } * 60 );

            $SQLExt .= " AND $TicketTime{$Key} <= $Time";
        }

        # get tickets created or escalated newer than x minutes
        if ( defined $Param{ $Key . 'NewerMinutes' } ) {

            $Param{ $Key . 'NewerMinutes' } ||= 0;

            # exclude tickets with no escalation
            if ( $Key =~ m{ \A TicketEscalation }xms ) {
                $SQLExt .= " AND $TicketTime{$Key} != 0";
            }

            my $Time = $TimeObject->SystemTime();
            $Time -= ( $Param{ $Key . 'NewerMinutes' } * 60 );

            $SQLExt .= " AND $TicketTime{$Key} >= $Time";
        }
    }

    # get tickets created/escalated older/newer than xxxx-xx-xx xx:xx date
    for my $Key ( sort keys %TicketTime ) {

        # get tickets created/escalated older than xxxx-xx-xx xx:xx date
        my $CompareOlderNewerDate;
        if ( $Param{ $Key . 'OlderDate' } ) {

            # check time format
            if (
                $Param{ $Key . 'OlderDate' }
                !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
                )
            {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Invalid time format '" . $Param{ $Key . 'OlderDate' } . "'!",
                );
                return;
            }

            # exclude tickets with no escalation
            if ( $Key =~ m{ \A TicketEscalation }xms ) {
                $SQLExt .= " AND $TicketTime{$Key} != 0";
            }
            my $Time = $TimeObject->TimeStamp2SystemTime(
                String => $Param{ $Key . 'OlderDate' },
            );
            if ( !$Time ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message =>
                        "Search not executed due to invalid time '"
                        . $Param{ $Key . 'OlderDate' } . "'!",
                );
                return;
            }
            $CompareOlderNewerDate = $Time;

            $SQLExt .= " AND $TicketTime{$Key} <= $Time";
        }

        # get tickets created/escalated newer than xxxx-xx-xx xx:xx date
        if ( $Param{ $Key . 'NewerDate' } ) {
            if (
                $Param{ $Key . 'NewerDate' }
                !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
                )
            {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Invalid time format '" . $Param{ $Key . 'NewerDate' } . "'!",
                );
                return;
            }

            # exclude tickets with no escalation
            if ( $Key =~ m{ \A TicketEscalation }xms ) {
                $SQLExt .= " AND $TicketTime{$Key} != 0";
            }
            my $Time = $TimeObject->TimeStamp2SystemTime(
                String => $Param{ $Key . 'NewerDate' },
            );
            if ( !$Time ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message =>
                        "Search not executed due to invalid time '"
                        . $Param{ $Key . 'NewerDate' } . "'!",
                );
                return;
            }

            # don't execute queries if newer date is after current date
            return if $Time > $CurrentSystemTime;

            # don't execute queries if older/newer date restriction show now valid timeframe
            return if $CompareOlderNewerDate && $Time > $CompareOlderNewerDate;

            $SQLExt .= " AND $TicketTime{$Key} >= $Time";
        }
    }

    # get tickets changed older than x minutes
    if ( defined $Param{TicketChangeTimeOlderMinutes} ) {

        $Param{TicketChangeTimeOlderMinutes} ||= 0;

        my $TimeStamp = $TimeObject->SystemTime();
        $TimeStamp -= ( $Param{TicketChangeTimeOlderMinutes} * 60 );

        $Param{TicketChangeTimeOlderDate} = $TimeObject->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets changed newer than x minutes
    if ( defined $Param{TicketChangeTimeNewerMinutes} ) {

        $Param{TicketChangeTimeNewerMinutes} ||= 0;

        my $TimeStamp = $TimeObject->SystemTime();
        $TimeStamp -= ( $Param{TicketChangeTimeNewerMinutes} * 60 );

        $Param{TicketChangeTimeNewerDate} = $TimeObject->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets based on ticket history changed older than xxxx-xx-xx xx:xx date
    my $CompareChangeTimeOlderNewerDate;
    if ( $Param{TicketChangeTimeOlderDate} ) {

        # check time format
        if (
            $Param{TicketChangeTimeOlderDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid time format '$Param{TicketChangeTimeOlderDate}'!",
            );
            return;
        }
        my $Time = $TimeObject->TimeStamp2SystemTime(
            String => $Param{TicketChangeTimeOlderDate},
        );
        if ( !$Time ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Search not executed due to invalid time '"
                    . $Param{TicketChangeTimeOlderDate} . "'!",
            );
            return;
        }
        $CompareChangeTimeOlderNewerDate = $Time;

        $SQLExt .= " AND th.create_time <= '"
            . $DBObject->Quote( $Param{TicketChangeTimeOlderDate} ) . "'";
    }

    # get tickets based on ticket history changed newer than xxxx-xx-xx xx:xx date
    if ( $Param{TicketChangeTimeNewerDate} ) {
        if (
            $Param{TicketChangeTimeNewerDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid time format '$Param{TicketChangeTimeNewerDate}'!",
            );
            return;
        }
        my $Time = $TimeObject->TimeStamp2SystemTime(
            String => $Param{TicketChangeTimeNewerDate},
        );
        if ( !$Time ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Search not executed due to invalid time '"
                    . $Param{TicketChangeTimeNewerDate} . "'!",
            );
            return;
        }

        # don't execute queries if newer date is after current date
        return if $Time > $CurrentSystemTime;

        # don't execute queries if older/newer date restriction show now valid timeframe
        return if $CompareChangeTimeOlderNewerDate && $Time > $CompareChangeTimeOlderNewerDate;

        $SQLExt .= " AND th.create_time >= '"
            . $DBObject->Quote( $Param{TicketChangeTimeNewerDate} ) . "'";
    }

    # get tickets changed older than x minutes
    if ( defined $Param{TicketLastChangeTimeOlderMinutes} ) {

        $Param{TicketLastChangeTimeOlderMinutes} ||= 0;

        my $TimeStamp = $TimeObject->SystemTime();
        $TimeStamp -= ( $Param{TicketLastChangeTimeOlderMinutes} * 60 );

        $Param{TicketLastChangeTimeOlderDate} = $TimeObject->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets changed newer than x minutes
    if ( defined $Param{TicketLastChangeTimeNewerMinutes} ) {

        $Param{TicketLastChangeTimeNewerMinutes} ||= 0;

        my $TimeStamp = $TimeObject->SystemTime();
        $TimeStamp -= ( $Param{TicketLastChangeTimeNewerMinutes} * 60 );

        $Param{TicketLastChangeTimeNewerDate} = $TimeObject->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets changed older than xxxx-xx-xx xx:xx date
    my $CompareLastChangeTimeOlderNewerDate;
    if ( $Param{TicketLastChangeTimeOlderDate} ) {

        # check time format
        if (
            $Param{TicketLastChangeTimeOlderDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid time format '$Param{TicketLastChangeTimeOlderDate}'!",
            );
            return;
        }
        my $Time = $TimeObject->TimeStamp2SystemTime(
            String => $Param{TicketLastChangeTimeOlderDate},
        );
        if ( !$Time ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Search not executed due to invalid time '"
                    . $Param{TicketLastChangeTimeOlderDate} . "'!",
            );
            return;
        }
        $CompareLastChangeTimeOlderNewerDate = $Time;

        $SQLExt .= " AND st.change_time <= '"
            . $DBObject->Quote( $Param{TicketLastChangeTimeOlderDate} ) . "'";
    }

    # get tickets changed newer than xxxx-xx-xx xx:xx date
    if ( $Param{TicketLastChangeTimeNewerDate} ) {
        if (
            $Param{TicketLastChangeTimeNewerDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid time format '$Param{TicketLastChangeTimeNewerDate}'!",
            );
            return;
        }
        my $Time = $TimeObject->TimeStamp2SystemTime(
            String => $Param{TicketLastChangeTimeNewerDate},
        );
        if ( !$Time ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Search not executed due to invalid time '"
                    . $Param{TicketLastChangeTimeNewerDate} . "'!",
            );
            return;
        }

        # don't execute queries if newer date is after current date
        return if $Time > $CurrentSystemTime;

        # don't execute queries if older/newer date restriction show now valid timeframe
        return
            if $CompareLastChangeTimeOlderNewerDate && $Time > $CompareLastChangeTimeOlderNewerDate;

        $SQLExt .= " AND st.change_time >= '"
            . $DBObject->Quote( $Param{TicketLastChangeTimeNewerDate} ) . "'";
    }

    # get tickets closed older than x minutes
    if ( defined $Param{TicketCloseTimeOlderMinutes} ) {

        $Param{TicketCloseTimeOlderMinutes} ||= 0;

        my $TimeStamp = $TimeObject->SystemTime();
        $TimeStamp -= ( $Param{TicketCloseTimeOlderMinutes} * 60 );

        $Param{TicketCloseTimeOlderDate} = $TimeObject->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets closed newer than x minutes
    if ( defined $Param{TicketCloseTimeNewerMinutes} ) {

        $Param{TicketCloseTimeNewerMinutes} ||= 0;

        my $TimeStamp = $TimeObject->SystemTime();
        $TimeStamp -= ( $Param{TicketCloseTimeNewerMinutes} * 60 );

        $Param{TicketCloseTimeNewerDate} = $TimeObject->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets closed older than xxxx-xx-xx xx:xx date
    my $CompareCloseTimeOlderNewerDate;
    if ( $Param{TicketCloseTimeOlderDate} ) {

        # check time format
        if (
            $Param{TicketCloseTimeOlderDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid time format '$Param{TicketCloseTimeOlderDate}'!",
            );
            return;
        }
        my $Time = $TimeObject->TimeStamp2SystemTime(
            String => $Param{TicketCloseTimeOlderDate},
        );
        if ( !$Time ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Search not executed due to invalid time '"
                    . $Param{TicketCloseTimeOlderDate} . "'!",
            );
            return;
        }
        $CompareCloseTimeOlderNewerDate = $Time;

        # get close state ids
        my @List = $Kernel::OM->Get('Kernel::System::State')->StateGetStatesByType(
            StateType => ['closed'],
            Result    => 'ID',
        );
        my @StateID = ( $Self->HistoryTypeLookup( Type => 'NewTicket' ) );
        push( @StateID, $Self->HistoryTypeLookup( Type => 'StateUpdate' ) );
        if (@StateID) {
            $SQLExt .= " AND th.history_type_id IN  (${\(join ', ', sort @StateID)}) AND "
                . " th.state_id IN (${\(join ', ', sort @List)}) AND "
                . "th.create_time <= '"
                . $DBObject->Quote( $Param{TicketCloseTimeOlderDate} ) . "'";
        }
    }

    # get tickets closed newer than xxxx-xx-xx xx:xx date
    if ( $Param{TicketCloseTimeNewerDate} ) {
        if (
            $Param{TicketCloseTimeNewerDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid time format '$Param{TicketCloseTimeNewerDate}'!",
            );
            return;
        }
        my $Time = $TimeObject->TimeStamp2SystemTime(
            String => $Param{TicketCloseTimeNewerDate},
        );
        if ( !$Time ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Search not executed due to invalid time '"
                    . $Param{TicketCloseTimeNewerDate} . "'!",
            );
            return;
        }

        # don't execute queries if newer date is after current date
        return if $Time > $CurrentSystemTime;

        # don't execute queries if older/newer date restriction show now valid timeframe
        return if $CompareCloseTimeOlderNewerDate && $Time > $CompareCloseTimeOlderNewerDate;

        # get close state ids
        my @List = $Kernel::OM->Get('Kernel::System::State')->StateGetStatesByType(
            StateType => ['closed'],
            Result    => 'ID',
        );
        my @StateID = ( $Self->HistoryTypeLookup( Type => 'NewTicket' ) );
        push( @StateID, $Self->HistoryTypeLookup( Type => 'StateUpdate' ) );
        if (@StateID) {
            $SQLExt .= " AND th.history_type_id IN  (${\(join ', ', sort @StateID)}) AND "
                . " th.state_id IN (${\(join ', ', sort @List)}) AND "
                . " th.create_time >= '"
                . $DBObject->Quote( $Param{TicketCloseTimeNewerDate} ) . "'";
        }
    }

    # check if only pending states are used
    if (
        defined $Param{TicketPendingTimeOlderMinutes}
        || defined $Param{TicketPendingTimeNewerMinutes}
        || $Param{TicketPendingTimeOlderDate}
        || $Param{TicketPendingTimeNewerDate}
        )
    {

        # get close state ids
        my @List = $Kernel::OM->Get('Kernel::System::State')->StateGetStatesByType(
            StateType => [ 'pending reminder', 'pending auto' ],
            Result    => 'ID',
        );
        if (@List) {
            $SQLExt .= " AND st.ticket_state_id IN (${\(join ', ', sort @List)}) ";
        }
    }

    # get tickets pending older than x minutes
    if ( defined $Param{TicketPendingTimeOlderMinutes} ) {

        $Param{TicketPendingTimeOlderMinutes} ||= 0;

        my $TimeStamp = $TimeObject->SystemTime();
        $TimeStamp -= ( $Param{TicketPendingTimeOlderMinutes} * 60 );

        $Param{TicketPendingTimeOlderDate} = $TimeObject->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get tickets pending newer than x minutes
    if ( defined $Param{TicketPendingTimeNewerMinutes} ) {

        $Param{TicketPendingTimeNewerMinutes} ||= 0;

        my $TimeStamp = $TimeObject->SystemTime();
        $TimeStamp -= ( $Param{TicketPendingTimeNewerMinutes} * 60 );

        $Param{TicketPendingTimeNewerDate} = $TimeObject->SystemTime2TimeStamp(
            SystemTime => $TimeStamp,
        );
    }

    # get pending tickets older than xxxx-xx-xx xx:xx date
    my $ComparePendingTimeOlderNewerDate;
    if ( $Param{TicketPendingTimeOlderDate} ) {

        # check time format
        if (
            $Param{TicketPendingTimeOlderDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid time format '$Param{TicketPendingTimeOlderDate}'!",
            );
            return;
        }
        my $TimeStamp = $TimeObject->TimeStamp2SystemTime(
            String => $Param{TicketPendingTimeOlderDate},
        );
        if ( !$TimeStamp ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Search not executed due to invalid time '"
                    . $Param{TicketPendingTimeOlderDate} . "'!",
            );
            return;
        }
        $ComparePendingTimeOlderNewerDate = $TimeStamp;

        $SQLExt .= " AND st.until_time <= $TimeStamp";
    }

    # get pending tickets newer than xxxx-xx-xx xx:xx date
    if ( $Param{TicketPendingTimeNewerDate} ) {
        if (
            $Param{TicketPendingTimeNewerDate}
            !~ /\d\d\d\d-(\d\d|\d)-(\d\d|\d) (\d\d|\d):(\d\d|\d):(\d\d|\d)/
            )
        {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid time format '$Param{TicketPendingTimeNewerDate}'!",
            );
            return;
        }
        my $TimeStamp = $TimeObject->TimeStamp2SystemTime(
            String => $Param{TicketPendingTimeNewerDate},
        );
        if ( !$TimeStamp ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Search not executed due to invalid time '"
                    . $Param{TicketPendingTimeNewerDate} . "'!",
            );
            return;
        }

        # don't execute queries if newer date is after current date
        return if $TimeStamp > $CurrentSystemTime;

        # don't execute queries if older/newer date restriction show now valid timeframe
        return
            if $ComparePendingTimeOlderNewerDate && $TimeStamp > $ComparePendingTimeOlderNewerDate;

        $SQLExt .= " AND st.until_time >= $TimeStamp";
    }

    # archive flag
    if ( $Kernel::OM->Get('Kernel::Config')->Get('Ticket::ArchiveSystem') ) {

        # if no flag is given, only search for not archived ticket
        if ( !$Param{ArchiveFlags} ) {
            $Param{ArchiveFlags} = ['n'];
        }

        # prepare search with archive flags, check arguments
        if ( ref $Param{ArchiveFlags} ne 'ARRAY' ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid attribute ArchiveFlags '$Param{ArchiveFlags}'!",
            );
            return;
        }

        # prepare options
        my %Options;
        for my $Key ( @{ $Param{ArchiveFlags} } ) {
            $Options{$Key} = 1;
        }

        # search for archived
        if ( $Options{y} && !$Options{n} ) {
            $SQLExt .= ' AND archive_flag = 1';
        }

        # search for not archived
        elsif ( !$Options{y} && $Options{n} ) {
            $SQLExt .= ' AND archive_flag = 0';
        }
    }

    # database query for sort/order by option
    if ( $Result ne 'COUNT' ) {
        $SQLExt .= ' ORDER BY';
        for my $Count ( 0 .. $#SortByArray ) {
            if ( $Count > 0 ) {
                $SQLExt .= ',';
            }

            # sort by dynamic field
            if ( $ValidDynamicFieldParams{ $SortByArray[$Count] } ) {
                my ($DynamicFieldName) = $SortByArray[$Count] =~ m/^DynamicField_(.*)$/smx;

                my $DynamicField = $TicketDynamicFieldName2Config{$DynamicFieldName} ||
                    $ArticleDynamicFieldName2Config{$DynamicFieldName};

                # If the table was already joined for searching, we reuse it.
                if ( !$DynamicFieldJoinTables{$DynamicFieldName} ) {

                    if ( $TicketDynamicFieldName2Config{$DynamicFieldName} ) {

                        # Join the table for this dynamic field; use a left outer join in this case.
                        # With an INNER JOIN we'd limit the result set to tickets which have an entry
                        #   for the DF which is used for sorting.
                        $SQLFrom
                            .= " LEFT OUTER JOIN dynamic_field_value dfv$DynamicFieldJoinCounter
                            ON (st.id = dfv$DynamicFieldJoinCounter.object_id
                                AND dfv$DynamicFieldJoinCounter.field_id = " .
                            $DBObject->Quote( $DynamicField->{ID}, 'Integer' ) . ") ";
                    }
                    elsif ( $ArticleDynamicFieldName2Config{$DynamicFieldName} ) {
                        if ( !$ArticleJoinSQL ) {
                            $ArticleJoinSQL = ' INNER JOIN article art ON st.id = art.ticket_id ';
                            $SQLFrom .= $ArticleJoinSQL;
                        }

                        $SQLFrom
                            .= " LEFT OUTER JOIN dynamic_field_value dfv$DynamicFieldJoinCounter
                            ON (art.id = dfv$DynamicFieldJoinCounter.object_id
                                AND dfv$DynamicFieldJoinCounter.field_id = " .
                            $DBObject->Quote( $DynamicField->{ID}, 'Integer' ) . ") ";
                    }

                    $DynamicFieldJoinTables{ $DynamicField->{Name} } = "dfv$DynamicFieldJoinCounter";

                    $DynamicFieldJoinCounter++;
                }

                my $SQLOrderField = $DynamicFieldBackendObject->SearchSQLOrderFieldGet(
                    DynamicFieldConfig => $DynamicField,
                    TableAlias         => $DynamicFieldJoinTables{$DynamicFieldName},
                );

                $SQLSelect .= ", $SQLOrderField ";
                $SQLExt    .= " $SQLOrderField ";
            }
            elsif (
                $SortByArray[$Count] eq 'Owner'
                || $SortByArray[$Count] eq 'Responsible'
                )
            {
                # Include first name, last name and login in select.
                $SQLSelect
                    .= ', ' . $SortOptions{ $SortByArray[$Count] }
                    . ', u.first_name, u.last_name, u.login ';

                # Join the users table on user's ID.
                $SQLFrom
                    .= ' JOIN users u '
                    . ' ON ' . $SortOptions{ $SortByArray[$Count] } . ' = u.id ';

                my $FirstnameLastNameOrder = $Kernel::OM->Get('Kernel::Config')->Get('FirstnameLastnameOrder') || 0;
                my $OrderBySuffix = $OrderByArray[$Count] eq 'Up' ? 'ASC' : 'DESC';

                # Sort by configured first and last name order.
                if ( $FirstnameLastNameOrder eq '1' || $FirstnameLastNameOrder eq '6' ) {
                    $SQLExt .= " u.last_name $OrderBySuffix, u.first_name ";
                }
                elsif ( $FirstnameLastNameOrder eq '2' ) {
                    $SQLExt .= " u.first_name $OrderBySuffix, u.last_name $OrderBySuffix, u.login ";
                }
                elsif ( $FirstnameLastNameOrder eq '3' || $FirstnameLastNameOrder eq '7' ) {
                    $SQLExt .= " u.last_name $OrderBySuffix, u.first_name $OrderBySuffix, u.login ";
                }
                elsif ( $FirstnameLastNameOrder eq '4' ) {
                    $SQLExt .= " u.login $OrderBySuffix, u.first_name $OrderBySuffix, u.last_name ";
                }
                elsif ( $FirstnameLastNameOrder eq '5' || $FirstnameLastNameOrder eq '8' ) {
                    $SQLExt .= " u.login $OrderBySuffix, u.last_name $OrderBySuffix, u.first_name ";
                }
                else {
                    $SQLExt .= " u.first_name $OrderBySuffix, u.last_name ";
                }
            }
            else {

                # regular sort
                $SQLSelect .= ', ' . $SortOptions{ $SortByArray[$Count] };
                $SQLExt    .= ' ' . $SortOptions{ $SortByArray[$Count] };
            }

            if ( $OrderByArray[$Count] eq 'Up' ) {
                $SQLExt .= ' ASC';
            }
            else {
                $SQLExt .= ' DESC';
            }
        }
    }

    # Add only the sql join for the queue table, if columns from the queue table exists in the sql statement.
    if ( %GroupList || $LookupSortByArray{Queue} ) {
        $SQLFrom .= ' INNER JOIN queue sq ON sq.id = st.queue_id ';
    }

    # check cache
    my $CacheObject;
    if ( ( $ArticleIndexSQLExt && $Param{FullTextIndex} ) || $Param{CacheTTL} ) {
        $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
        my $CacheData = $CacheObject->Get(
            Type => 'TicketSearch',
            Key  => $SQLSelect . $SQLFrom . $SQLExt . $Result . $Limit,
        );

        if ( defined $CacheData ) {
            if ( ref $CacheData eq 'HASH' ) {
                return %{$CacheData};
            }
            elsif ( ref $CacheData eq 'ARRAY' ) {
                return @{$CacheData};
            }
            elsif ( ref $CacheData eq '' ) {
                return $CacheData;
            }
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => 'Invalid ref ' . ref($CacheData) . '!'
            );
            return;
        }
    }

    # database query
    my %Tickets;
    my @TicketIDs;
    my $Count;
    return
        if !$DBObject->Prepare(
        SQL   => $SQLSelect . $SQLFrom . $SQLExt,
        Limit => $Limit
        );
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Count = $Row[0];
        $Tickets{ $Row[0] } = $Row[1];
        push @TicketIDs, $Row[0];
    }

    # return COUNT
    if ( $Result eq 'COUNT' ) {
        if ($CacheObject) {
            $CacheObject->Set(
                Type  => 'TicketSearch',
                Key   => $SQLSelect . $SQLFrom . $SQLExt . $Result . $Limit,
                Value => $Count,
                TTL   => $Param{CacheTTL} || 60 * 4,
            );
        }
        return $Count;
    }

    # return HASH
    elsif ( $Result eq 'HASH' ) {
        if ($CacheObject) {
            $CacheObject->Set(
                Type  => 'TicketSearch',
                Key   => $SQLSelect . $SQLFrom . $SQLExt . $Result . $Limit,
                Value => \%Tickets,
                TTL   => $Param{CacheTTL} || 60 * 4,
            );
        }
        return %Tickets;
    }

    # return ARRAY
    else {
        if ($CacheObject) {
            $CacheObject->Set(
                Type  => 'TicketSearch',
                Key   => $SQLSelect . $SQLFrom . $SQLExt . $Result . $Limit,
                Value => \@TicketIDs,
                TTL   => $Param{CacheTTL} || 60 * 4,
            );
        }
        return @TicketIDs;
    }
}

=item SearchStringStopWordsFind()

Find stop words within given search string.

    my $StopWords = $TicketObject->SearchStringStopWordsFind(
        SearchStrings => {
            'Fulltext' => '(this AND is) OR test',
            'From'     => 'myself',
        },
    );

    Returns Hashref with found stop words.

=cut

sub SearchStringStopWordsFind {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Key (qw(SearchStrings)) {
        if ( !$Param{$Key} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Key!",
            );
            return;
        }
    }

    my $StopWordRaw = $Kernel::OM->Get('Kernel::Config')->Get('Ticket::SearchIndex::StopWords') || {};
    if ( !$StopWordRaw || ref $StopWordRaw ne 'HASH' ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Invalid config option Ticket::SearchIndex::StopWords! "
                . "Please reset the search index options to reactivate the factory defaults.",
        );

        return;
    }

    my %StopWord;
    LANGUAGE:
    for my $Language ( sort keys %{$StopWordRaw} ) {

        if ( !$Language || !$StopWordRaw->{$Language} || ref $StopWordRaw->{$Language} ne 'ARRAY' ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid config option Ticket::SearchIndex::StopWords###$Language! "
                    . "Please reset this option to reactivate the factory defaults.",
            );

            next LANGUAGE;
        }

        WORD:
        for my $Word ( @{ $StopWordRaw->{$Language} } ) {

            next WORD if !defined $Word || !length $Word;

            $Word = lc $Word;

            $StopWord{$Word} = 1;
        }
    }

    my $SearchIndexAttributes = $Kernel::OM->Get('Kernel::Config')->Get('Ticket::SearchIndex::Attribute');
    my $WordLengthMin         = $SearchIndexAttributes->{WordLengthMin} || 3;
    my $WordLengthMax         = $SearchIndexAttributes->{WordLengthMax} || 30;

    my %StopWordsFound;
    SEARCHSTRING:
    for my $Key ( sort keys %{ $Param{SearchStrings} } ) {
        my $SearchString = $Param{SearchStrings}->{$Key};
        my %Result       = $Kernel::OM->Get('Kernel::System::DB')->QueryCondition(
            'Key'      => '.',             # resulting SQL is irrelevant
            'Value'    => $SearchString,
            'BindMode' => 1,
        );

        next SEARCHSTRING if !%Result || ref $Result{Values} ne 'ARRAY' || !@{ $Result{Values} };

        my %Words;
        for my $Value ( @{ $Result{Values} } ) {
            my @Words = split '\s+', $$Value;
            for my $Word (@Words) {
                $Words{ lc $Word } = 1;
            }
        }

        @{ $StopWordsFound{$Key} }
            = grep { $StopWord{$_} || length $_ < $WordLengthMin || length $_ > $WordLengthMax } sort keys %Words;
    }

    return \%StopWordsFound;
}

=item SearchStringStopWordsUsageWarningActive()

Checks if warnings for stop words in search strings are active or not.

    my $WarningActive = $TicketObject->SearchStringStopWordsUsageWarningActive();

=cut

sub SearchStringStopWordsUsageWarningActive {
    my ( $Self, %Param ) = @_;

    my $ConfigObject        = $Kernel::OM->Get('Kernel::Config');
    my $SearchIndexModule   = $ConfigObject->Get('Ticket::SearchIndexModule');
    my $WarnOnStopWordUsage = $ConfigObject->Get('Ticket::SearchIndex::WarnOnStopWordUsage') || 0;
    if (
        $SearchIndexModule eq 'Kernel::System::Ticket::ArticleSearchIndex::StaticDB'
        && $WarnOnStopWordUsage
        )
    {
        return 1;
    }

    return 0;
}

=begin Internal:

=cut

=item _InConditionGet()

internal function to create an

    AND table.column IN (values)

condition string from an array.

    my $SQLPart = $TicketObject->_InConditionGet(
        TableColumn => 'table.column',
        IDRef       => $ArrayRef,
    );

=cut

sub _InConditionGet {
    my ( $Self, %Param ) = @_;

    if ( !$Param{TableColumn} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need TableColumn!",
        );
        return;
    }

    if ( !$Param{IDRef} || ref $Param{IDRef} ne 'ARRAY' || !@{ $Param{IDRef} } ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need IDRef!",
        );
        return;
    }

    # sort ids to cache the SQL query
    my @SortedIDs = sort { $a <=> $b } @{ $Param{IDRef} };

    # Error out if some values were not integers.
    @SortedIDs = map { $Kernel::OM->Get('Kernel::System::DB')->Quote( $_, 'Integer' ) } @SortedIDs;
    return if scalar @SortedIDs != scalar @{ $Param{IDRef} };

    # split IN statement with more than 900 elements in more statements combined with OR
    # because Oracle doesn't support more than 1000 elements for one IN statement.
    my @SQLStrings;
    while ( scalar @SortedIDs ) {

        # remove section in the array
        my @SortedIDsPart = splice @SortedIDs, 0, 900;

        # link together IDs
        my $IDString = join ', ', @SortedIDsPart;

        # add new statement
        push @SQLStrings, " $Param{TableColumn} IN ($IDString) ";
    }

    my $SQL = '';
    if (@SQLStrings) {

        # combine statements
        $SQL = join ' OR ', @SQLStrings;

        # encapsulate conditions
        $SQL = ' AND ( ' . $SQL . ' ) ';
    }
    return $SQL;
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
