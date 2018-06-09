# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::Layout::ITSMChange;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

=over 4

=item ITSMChangeBuildWorkOrderGraph()

returns a output string for WorkOrder graph

    my $String = $LayoutObject->ITSMChangeBuildWorkOrderGraph(
        Change             => $ChangeRef,
        WorkOrderObject    => $WorkOrderObject,
        DynamicFieldObject => $DynamicFieldObject,
        BackendObject      => $BackendObject,
    );

=cut

sub ITSMChangeBuildWorkOrderGraph {
    my ( $Self, %Param ) = @_;

    # get log object
    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    # check for change
    my $Change = $Param{Change};
    if ( !$Change ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need Change!',
        );
        return;
    }

    # check workorder object
    if ( !$Param{WorkOrderObject} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need WorkOrderObject!',
        );
        return;
    }

    # store workorder object locally
    my $WorkOrderObject = $Param{WorkOrderObject};

    # check if workorders are available
    return if !$Change->{WorkOrderCount};

    # extra check for ARRAY-ref
    return if ref $Change->{WorkOrderIDs} ne 'ARRAY';

    # hash for smallest time
    my %Time;

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    TIMETYPE:
    for my $TimeType (qw(Start End)) {

        # actual time not set, so we can use planned
        if ( !$Change->{"Actual${TimeType}Time"} ) {

            # check if time is set
            next TIMETYPE if !$Change->{"Planned${TimeType}Time"};

            # translate to timestamp
            $Time{"${TimeType}Time"} = $TimeObject->TimeStamp2SystemTime(
                String => $Change->{"Planned${TimeType}Time"},
            );

            # jump to next type
            next TIMETYPE;
        }

        # translate planned time to timestamp for equation
        $Time{"Planned${TimeType}Time"} = $TimeObject->TimeStamp2SystemTime(
            String => $Change->{"Planned${TimeType}Time"},
        );

        # translate actual time to timestamp for equation
        $Time{"Actual${TimeType}Time"} = $TimeObject->TimeStamp2SystemTime(
            String => $Change->{"Actual${TimeType}Time"},
        );
    }

    # set time attributes to empty string if not defined
    for my $TimeAttribute (qw(PlannedStartTime PlannedEndTime ActualStartTime ActualEndTime)) {
        $Time{$TimeAttribute} //= '';
    }

    # get smallest start time
    if ( !$Time{StartTime} ) {
        $Time{StartTime} = ( $Time{PlannedStartTime} lt $Time{ActualStartTime} )
            ? $Time{PlannedStartTime}
            : $Time{ActualStartTime};
    }

    # get highest end time
    if ( !$Time{EndTime} ) {
        $Time{EndTime} = ( $Time{PlannedEndTime} gt $Time{ActualEndTime} )
            ? $Time{PlannedEndTime}
            : $Time{ActualEndTime};
    }

    # check for real end of end time for scale and graph items
    # only if ActualStartTime is set
    if (
        $Time{ActualStartTime}
        && !$Time{ActualEndTime}
        && ( $Time{EndTime} lt $TimeObject->SystemTime() )
        )
    {
        $Time{EndTime} = $TimeObject->SystemTime();
    }

    # calculate ticks for change
    my $ChangeTicks = $Self->_ITSMChangeGetChangeTicks(
        Start => $Time{StartTime},
        End   => $Time{EndTime},
    );

    # check for valid ticks
    if ( !$ChangeTicks ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Unable to calculate time scale.',
        );
    }

    # get workorders of change
    my @WorkOrders;
    WORKORDERID:
    for my $WorkOrderID ( @{ $Change->{WorkOrderIDs} } ) {
        my $WorkOrder = $WorkOrderObject->WorkOrderGet(
            WorkOrderID => $WorkOrderID,
            UserID      => $Self->{UserID},
        );
        next WORKORDERID if !$WorkOrder;

        push @WorkOrders, $WorkOrder;
    }

    # get config settings
    my $ChangeZoomConfig = $Kernel::OM->Get('Kernel::Config')->Get('ITSMChange::Frontend::AgentITSMChangeZoom');

    # check config setting
    if ( !$ChangeZoomConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need SysConfig settings for ITSMChange::Frontend::AgentITSMChangeZoom!',
        );
        return;
    }

    # check graph config setting
    if ( !$ChangeZoomConfig->{WorkOrderGraph} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need SysConfig settings for '
                . 'ITSMChange::Frontend::AgentITSMChangeZoom###WorkOrderGraph!',
        );
        return;
    }

    # validity settings of graph settings
    my %WorkOrderGraphCheck = (
        TimeLineColor           => '#[a-fA-F\d]{6}',
        TimeLineWidth           => '\d{1,2}',
        undefined_planned_color => '#[a-fA-F\d]{6}',
        undefined_actual_color  => '#[a-fA-F\d]{6}',
    );

    # check validity of graph settings
    my $WorkOrderGraphConfig = $ChangeZoomConfig->{WorkOrderGraph};
    for my $GraphSetting ( sort keys %WorkOrderGraphCheck ) {

        # check existense of config setting
        if ( !$WorkOrderGraphConfig->{$GraphSetting} ) {

            # display error and return
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need SysConfig setting '$GraphSetting' in "
                    . "ITSMChange::Frontend::AgentITSMChangeZoom###WorkOrderGraph!",
            );
            return;
        }

        # check validity of config setting
        if (
            $WorkOrderGraphConfig->{$GraphSetting}
            !~ m{ \A $WorkOrderGraphCheck{$GraphSetting} \z }xms
            )
        {

            # display error and return
            $LogObject->Log(
                Priority => 'error',
                Message  => "SysConfig setting '$GraphSetting' is invalid in "
                    . "ITSMChange::Frontend::AgentITSMChangeZoom###WorkOrderGraph!",
            );
            return;
        }
    }

    # compute effecive label width
    my $LabelWidth = 60;
    if ( $ChangeZoomConfig->{WorkOrderState} && $ChangeZoomConfig->{WorkOrderTitle} ) {
        $LabelWidth += 180;
    }
    elsif ( $ChangeZoomConfig->{WorkOrderState} ) {
        $LabelWidth += 70;
    }
    elsif ( $ChangeZoomConfig->{WorkOrderTitle} ) {
        $LabelWidth += 125;
    }

    # load graph skeleton
    $Self->Block(
        Name => 'WorkOrderGraph',
        Data => {
            LabelWidth  => $LabelWidth,
            LabelMargin => $LabelWidth + 2,
        },
    );

    # create color definitions for all configured workorder types
    my $WorkOrderTypes = $WorkOrderObject->WorkOrderTypeList(
        UserID => $Self->{UserID},
    ) || [];

    # create css definitions for workorder types
    WORKORDERTYPE:
    for my $WorkOrderType ( @{$WorkOrderTypes} ) {

        # check workorder type
        next WORKORDERTYPE if !$WorkOrderType;
        next WORKORDERTYPE if !$WorkOrderType->{Value};

        # get name of workorder type
        my $WorkOrderTypeName = $WorkOrderType->{Value};

        # check contents of name
        next WORKORDERTYPE if !$WorkOrderTypeName;

        for my $WorkOrderColor (qw( _planned _actual )) {

            # get configured or fallback planned color for workorder
            my $WorkOrderTypeColor = $WorkOrderGraphConfig->{"${WorkOrderTypeName}${WorkOrderColor}_color"};

            # set default color if no color is found
            $WorkOrderTypeColor ||= $WorkOrderGraphConfig->{"undefined${WorkOrderColor}_color"};

            # check validity of workorder color
            if ( $WorkOrderTypeColor !~ m{ \A # [A-Za-z\d]{6} \z }xms ) {
                $WorkOrderTypeColor = $WorkOrderGraphConfig->{"undefined${WorkOrderColor}_color"};
            }

            # display css definitions for planned
            $Self->Block(
                Name => 'CSSWorkOrderType',
                Data => {
                    WorkOrderTypeName  => $WorkOrderTypeName . $WorkOrderColor,
                    WorkOrderTypeColor => $WorkOrderTypeColor,
                },
            );
        }
    }

    # calculate time line parameter
    my $TimeLine = $Self->_ITSMChangeGetTimeLine(
        StartTime => $Time{StartTime},
        EndTime   => $Time{EndTime},
        Ticks     => $ChangeTicks,
    );

    if ( $TimeLine && defined $TimeLine->{TimeLineLeft} ) {

        # calculate height of time line
        my $WorkOrderHeight = 16;
        my $ScaleMargin     = 11;
        $TimeLine->{TimeLineHeight} = ( ( scalar @WorkOrders ) * $WorkOrderHeight ) + $ScaleMargin;

        # display css of timeline
        $Self->Block(
            Name => 'CSSTimeLine',
            Data => {
                %{$TimeLine},
                %{$WorkOrderGraphConfig},
            },
        );

        # display timeline container
        $Self->Block(
            Name => 'TimeLine',
            Data => {},
        );
    }

    # sort workorder ascending to WorkOrderNumber
    @WorkOrders = sort { $a->{WorkOrderNumber} <=> $b->{WorkOrderNumber} } @WorkOrders;

    # build graph of each workorder
    WORKORDER:
    for my $WorkOrder (@WorkOrders) {
        next WORKORDER if !$WorkOrder;

        $Self->_ITSMChangeGetWorkOrderGraph(
            WorkOrder          => $WorkOrder,
            DynamicFieldObject => $Param{DynamicFieldObject},
            BackendObject      => $Param{BackendObject},
            StartTime          => $Time{StartTime},
            EndTime            => $Time{EndTime},
            Ticks              => $ChangeTicks,
        );
    }

    # build scale of graph
    $Self->_ITSMChangeGetChangeScale(
        StartTime   => $Time{StartTime},
        EndTime     => $Time{EndTime},
        Ticks       => $ChangeTicks,
        LabelMargin => $LabelWidth + 2,
    );

    # render graph and return HTML with ITSMChange.dtl template
    return $Self->Output(
        TemplateFile => 'ITSMChange',
        Data         => {%Param},
    );
}

=item ITSMChangeListShow()

Returns a list of changes as sortable list with pagination.

This function is similar to L<Kernel::Output::HTML::LayoutTicket::TicketListShow()>
in F<Kernel/Output/HTML/LayoutTicket.pm>.

    my $Output = $LayoutObject->ITSMChangeListShow(
        ChangeIDs  => $ChangeIDsRef,                      # total list of change ids, that can be listed
        Total      => scalar @{ $ChangeIDsRef },          # total number of list items, changes in this case
        View       => $Self->{View},                      # optional, the default value is 'Small'
        Filter     => 'All',
        Filters    => \%NavBarFilter,
        FilterLink => $LinkFilter,
        TitleName  => 'Overview: Changes',
        TitleValue => $Self->{Filter},
        Env        => $Self,
        LinkPage   => $LinkPage,
        LinkSort   => $LinkSort,
        Frontend   => 'Agent',                           # optional (Agent|Customer), default: Agent, indicates from which frontend this function was called
    );

=cut

sub ITSMChangeListShow {
    my ( $Self, %Param ) = @_;

    # take object ref to local, remove it from %Param (prevent memory leak)
    my $Env = delete $Param{Env};

    # lookup latest used view mode
    if ( !$Param{View} && $Self->{ 'UserITSMChangeOverview' . $Env->{Action} } ) {
        $Param{View} = $Self->{ 'UserITSMChangeOverview' . $Env->{Action} };
    }

    # set frontend
    my $Frontend = $Param{Frontend} || 'Agent';

    # set defaut view mode to 'small'
    my $View = $Param{View} || 'Small';

    # store latest view mode
    $Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'UserITSMChangeOverview' . $Env->{Action},
        Value     => $View,
    );

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get backend from config
    my $Backends = $ConfigObject->Get('ITSMChange::Frontend::Overview');
    if ( !$Backends ) {
        return $LayoutObject->FatalError(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'Need config option %s!',
                'ITSMChange::Frontend::Overview',
            ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # check for hash-ref
    if ( ref $Backends ne 'HASH' ) {
        return $LayoutObject->FatalError(
            Message => $LayoutObject->{LanguageObject}->Translate(
                'Config option %s needs to be a HASH ref!',
                'ITSMChange::Frontend::Overview',
            ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # check for config key
    if ( !$Backends->{$View} ) {
        return $LayoutObject->FatalError(
            Message => $LayoutObject->{LanguageObject}->Translate( 'No config option found for the view "%s"!', $View ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # nav bar
    my $StartHit = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam(
        Param => 'StartHit',
    ) || 1;

    # get personal page shown count
    my $PageShownPreferencesKey = 'UserChangeOverview' . $View . 'PageShown';
    my $PageShown               = $Self->{$PageShownPreferencesKey} || 10;
    my $Group                   = 'ChangeOverview' . $View . 'PageShown';

    # check start option, if higher then elements available, set
    # it to the last overview page (Thanks to Stefan Schmidt!)
    if ( $StartHit > $Param{Total} ) {
        my $Pages = int( ( $Param{Total} / $PageShown ) + 0.99999 );
        $StartHit = ( ( $Pages - 1 ) * $PageShown ) + 1;
    }

    # get data selection
    my %Data;
    my $Config = $ConfigObject->Get('PreferencesGroups');
    if ( $Config && $Config->{$Group} && $Config->{$Group}->{Data} ) {
        %Data = %{ $Config->{$Group}->{Data} };
    }

    # set page limit and build page nav
    my $Limit = $Param{Limit} || 20_000;
    my %PageNav = $LayoutObject->PageNavBar(
        Limit     => $Limit,
        StartHit  => $StartHit,
        PageShown => $PageShown,
        AllHits   => $Param{Total} || 0,
        Action    => 'Action=' . $LayoutObject->{Action},
        Link      => $Param{LinkPage},
    );

    # build shown ticket a page
    $Param{RequestedURL}    = $Param{RequestedURL} || "Action=$Self->{Action}";
    $Param{Group}           = $Group;
    $Param{PreferencesKey}  = $PageShownPreferencesKey;
    $Param{PageShownString} = $Self->BuildSelection(
        Name        => $PageShownPreferencesKey,
        SelectedID  => $PageShown,
        Data        => \%Data,
        Translation => 0,
    );

    # build navbar content
    $LayoutObject->Block(
        Name => 'OverviewNavBar',
        Data => \%Param,
    );

    # back link
    if ( $Param{LinkBack} ) {
        $LayoutObject->Block(
            Name => 'OverviewNavBarPageBack',
            Data => \%Param,
        );
    }

    # get filters
    if ( $Param{Filters} ) {

        # get given filters
        my @NavBarFilters;
        for my $Prio ( sort keys %{ $Param{Filters} } ) {
            push @NavBarFilters, $Param{Filters}->{$Prio};
        }

        # build filter content
        $LayoutObject->Block(
            Name => 'OverviewNavBarFilter',
            Data => {
                %Param,
            },
        );

        # loop over filters
        my $Count = 0;
        for my $Filter (@NavBarFilters) {

            # increment filter count and build filter item
            $Count++;
            $LayoutObject->Block(
                Name => 'OverviewNavBarFilterItem',
                Data => {
                    %Param,
                    %{$Filter},
                },
            );

            # filter is selected
            if ( $Filter->{Filter} eq $Param{Filter} ) {
                $LayoutObject->Block(
                    Name => 'OverviewNavBarFilterItemSelected',
                    Data => {
                        %Param,
                        %{$Filter},
                    },
                );

            }
            else {
                $LayoutObject->Block(
                    Name => 'OverviewNavBarFilterItemSelectedNot',
                    Data => {
                        %Param,
                        %{$Filter},
                    },
                );

            }
        }
    }

    # loop over configured backends
    for my $Backend ( sort keys %{$Backends} ) {

        # build navbar view mode
        $LayoutObject->Block(
            Name => 'OverviewNavBarViewMode',
            Data => {
                %Param,
                %{ $Backends->{$Backend} },
                Filter => $Param{Filter},
                View   => $Backend,
            },
        );

        # current view is configured in backend
        if ( $View eq $Backend ) {
            $LayoutObject->Block(
                Name => 'OverviewNavBarViewModeSelected',
                Data => {
                    %Param,
                    %{ $Backends->{$Backend} },
                    Filter => $Param{Filter},
                    View   => $Backend,
                },
            );
        }
        else {
            $LayoutObject->Block(
                Name => 'OverviewNavBarViewModeNotSelected',
                Data => {
                    %Param,
                    %{ $Backends->{$Backend} },
                    Filter => $Param{Filter},
                    View   => $Backend,
                },
            );
        }
    }

    # check if page nav is available
    if (%PageNav) {
        $LayoutObject->Block(
            Name => 'OverviewNavBarPageNavBar',
            Data => \%PageNav,
        );

        # don't show context settings in AJAX case (e. g. in customer ticket history),
        #   because the submit with page reload will not work there
        if ( !$Param{AJAX} ) {
            $LayoutObject->Block(
                Name => 'ContextSettings',
                Data => {
                    %PageNav,
                    %Param,
                },
            );
        }
    }

    # build html content
    my $OutputNavBar = $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeOverviewNavBar',
        Data         => {%Param},
    );

    # create output
    my $OutputRaw = '';
    if ( !$Param{Output} ) {
        $LayoutObject->Print(
            Output => \$OutputNavBar,
        );
    }
    else {
        $OutputRaw .= $OutputNavBar;
    }

    # load module
    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require( $Backends->{$View}->{Module} ) ) {
        return $LayoutObject->FatalError();
    }

    # check for backend object
    my $Object = $Backends->{$View}->{Module}->new( %{$Env} );
    return if !$Object;

    # run module
    my $Output = $Object->Run(
        %Param,
        Limit     => $Limit,
        StartHit  => $StartHit,
        PageShown => $PageShown,
        AllHits   => $Param{Total} || 0,
        Frontend  => $Frontend,
    );

    # create output
    if ( !$Param{Output} ) {
        $LayoutObject->Print(
            Output => \$Output,
        );
    }
    else {
        $OutputRaw .= $Output;
    }

    # create overview nav bar
    $LayoutObject->Block(
        Name => 'OverviewNavBar',
        Data => {%Param},
    );

    # return content if available
    return $OutputRaw;
}

=begin Internal:

=item _ITSMChangeGetChangeTicks()

a helper method for the workorder graph of a change

=cut

sub _ITSMChangeGetChangeTicks {
    my ( $Self, %Param ) = @_;

    # check for start and end
    return if !$Param{Start} || !$Param{End};

    # make sure we got integers
    return if $Param{Start} !~ m{ \A \d+ \z }xms;
    return if $Param{End} !~ m{ \A \d+ \z }xms;

    # calculate time span in sec
    my $Ticks = $Param{End} - $Param{Start};

    # check for computing error
    return if $Ticks <= 0;

    # get seconds per percent and round down
    $Ticks = sprintf( "%.f", $Ticks / 100 );

    return $Ticks;
}

=item _ITSMChangeGetChangeScale()

a helper method for the workorder graph of a change

=cut

sub _ITSMChangeGetChangeScale {
    my ( $Self, %Param ) = @_;

    # check for start time
    return if !$Param{StartTime};

    # check for start time is an integer value
    return if $Param{StartTime} !~ m{ \A \d+ \z }xms;

    # add start and end time and calculate scale naming
    my %ScaleName = (
        StartTime => $Param{StartTime},
        EndTime   => $Param{EndTime},
        Scale15   => ( $Param{StartTime} + 20 * $Param{Ticks} ),
        Scale35   => ( $Param{StartTime} + 40 * $Param{Ticks} ),
        Scale55   => ( $Param{StartTime} + 60 * $Param{Ticks} ),
        Scale75   => ( $Param{StartTime} + 80 * $Param{Ticks} ),
    );

    # translate timestamps in date format
    map {
        $ScaleName{$_} = $Kernel::OM->Get('Kernel::System::Time')->SystemTime2TimeStamp(
            SystemTime => $ScaleName{$_}
            )
    } keys %ScaleName;

    # create scale block
    $Self->Block(
        Name => 'Scale',
        Data => {
            %ScaleName,
            LabelMargin => $Param{LabelMargin},
        },
    );

    INTERVAL:
    for my $Interval ( sort keys %ScaleName ) {

        # do not display scale if translating failed
        next INTERVAL if !$ScaleName{$Interval};

        # do not display start or end
        next INTERVAL if $Interval =~ m{ \A ( Start | End ) Time \z }xms;

        # build scale label block
        $Self->Block(
            Name => 'ScaleLabel',
            Data => {
                ScaleLabel => $ScaleName{$Interval},
                ScaleClass => $Interval,
            },
        );
    }
}

=item _ITSMChangeGetWorkOrderGraph()

a helper method for the workorder graph of a change

=cut

sub _ITSMChangeGetWorkOrderGraph {
    my ( $Self, %Param ) = @_;

    # check for workorder
    return if !$Param{WorkOrder};

    # extract workorder
    my $WorkOrder = $Param{WorkOrder};

    # save orig workorder for workorder information
    my %WorkOrderInformation = %{$WorkOrder};

    # translate workorder type
    $WorkOrder->{TranslatedWorkOrderType} = $Self->{LanguageObject}->Translate( $WorkOrder->{WorkOrderType} );

    # build label for link in graph
    $WorkOrder->{WorkOrderLabel} = $Self->{LanguageObject}->Translate(
        'Title: %s | Type: %s',
        $WorkOrder->{WorkOrderTitle},
        $WorkOrder->{TranslatedWorkOrderType},
    );

    # create workorder item
    $Self->Block(
        Name => 'WorkOrderItem',
        Data => {
            %{$WorkOrder},
        },
    );

    # get config settings
    my $ChangeZoomConfig = $Kernel::OM->Get('Kernel::Config')->Get('ITSMChange::Frontend::AgentITSMChangeZoom');

    # add workorder state
    if ( $ChangeZoomConfig->{WorkOrderState} ) {
        $Self->Block(
            Name => 'WorkOrderItemState',
            Data => {
                %{$WorkOrder},
            },
        );
    }

    # add workorder title
    if ( $ChangeZoomConfig->{WorkOrderTitle} ) {
        $Self->Block(
            Name => 'WorkOrderItemTitle',
            Data => {
                %{$WorkOrder},
            },
        );
    }

    # check if ticks are calculated
    return if !$Param{Ticks};

    # set planned if no actual time is set
    if ( !$WorkOrder->{ActualStartTime} ) {
        $WorkOrder->{ActualStartTime} = $WorkOrder->{PlannedStartTime};
        $WorkOrder->{ActualEndTime}   = $WorkOrder->{PlannedEndTime};
    }

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    # set current time if no actual end time is set
    if ( $WorkOrder->{ActualStartTime} && !$WorkOrder->{ActualEndTime} ) {
        $WorkOrder->{ActualEndTime} = $TimeObject->CurrentTimestamp();
    }

    # set nice display of undef actual times
    for my $TimeType (qw(ActualStartTime ActualEndTime)) {
        if ( !$WorkOrderInformation{$TimeType} ) {
            $WorkOrderInformation{"Empty${TimeType}"} = '-';
        }
    }

    # hash for time values
    my %Time;

    for my $TimeType (qw(PlannedStartTime PlannedEndTime ActualStartTime ActualEndTime)) {

        # translate time
        $Time{$TimeType} = $TimeObject->TimeStamp2SystemTime(
            String => $WorkOrder->{$TimeType},
        );
    }

    # determine length of workorder
    my %TickValue;

    for my $TimeType (qw( Planned Actual )) {

        # get values for padding span
        my $StartPadding = sprintf(
            "%.1f",
            ( $Time{"${TimeType}StartTime"} - $Param{StartTime} ) / $Param{Ticks}
        );
        $StartPadding = ( $StartPadding <= 0 )   ? 0    : $StartPadding;
        $StartPadding = ( $StartPadding >= 100 ) ? 99.9 : $StartPadding;
        $TickValue{"${TimeType}Padding"} = $StartPadding;

        # get values for trailing span
        my $EndTrailing = sprintf( "%.1f", ( $Param{EndTime} - $Time{"${TimeType}EndTime"} ) / $Param{Ticks} );
        $EndTrailing = ( $EndTrailing <= 0 )   ? 0    : $EndTrailing;
        $EndTrailing = ( $EndTrailing >= 100 ) ? 99.9 : $EndTrailing;
        $TickValue{"${TimeType}Trailing"} = $EndTrailing;

        # get values for display span
        my $TimeTicks = 100 - ( $TickValue{"${TimeType}Padding"} + $TickValue{"${TimeType}Trailing"} );
        $TimeTicks = ( $TimeTicks <= 0 )   ? 0.1  : $TimeTicks;
        $TimeTicks = ( $TimeTicks >= 100 ) ? 99.9 : $TimeTicks;
        $TickValue{"${TimeType}Ticks"} = sprintf( "%.1f", $TimeTicks );
    }

    # set workorder as inactive if it is not started jet
    if ( !$WorkOrderInformation{ActualStartTime} ) {
        $WorkOrderInformation{WorkOrderOpacity} = 'WorkorderInactive';
    }

    # set workorder agent
    if ( $WorkOrderInformation{WorkOrderAgentID} ) {
        my %WorkOrderAgentData = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
            UserID => $WorkOrderInformation{WorkOrderAgentID},
            Cached => 1,
        );

        if (%WorkOrderAgentData) {

            # get WorkOrderAgent information
            for my $Postfix (qw(UserLogin UserFirstname UserLastname)) {
                $WorkOrderInformation{"WorkOrderAgent$Postfix"} = $WorkOrderAgentData{$Postfix}
                    || '';
            }
        }
    }

    # set the graph direction (LTR: left, RTL: right)
    if ( $Self->{TextDirection} && $Self->{TextDirection} eq 'rtl' ) {
        $WorkOrderInformation{"GraphDirection"} = 'right';
    }
    else {
        $WorkOrderInformation{"GraphDirection"} = 'left';
    }

    # create graph of workorder item
    $Self->Block(
        Name => 'WorkOrderItemGraph',
        Data => {
            %WorkOrderInformation,
            %TickValue,
        },
    );

    # get the workorder attribute names that should be shown in the tooltip
    my %TooltipAttributes = %{ $ChangeZoomConfig->{'Tooltip::WorkOrderAttributes'} };
    my @ShowAttributes = grep { $TooltipAttributes{$_} } keys %TooltipAttributes;

    # build attribut blocks
    if (@ShowAttributes) {

        ATTRIBUTE:
        for my $Attribute ( sort @ShowAttributes ) {

            # special handling for workorder agent
            if ( $Attribute eq 'WorkOrderAgent' ) {

                $Self->Block(
                    Name => 'WorkOrderAgentBlock',
                    Data => {
                        %WorkOrderInformation,
                    },
                );

                # check the last thing: UserLogin
                if ( $WorkOrderInformation{WorkOrderAgentUserLogin} ) {
                    $Self->Block(
                        Name => 'WorkOrderAgent',
                        Data => {
                            %WorkOrderInformation,
                        },
                    );
                }
                else {
                    $Self->Block(
                        Name => 'EmptyWorkOrderAgent',
                        Data => {
                            %WorkOrderInformation,
                        },
                    );
                }
            }

            # handle workorder dynamic fields
            elsif ( $Attribute =~ m{ \A DynamicField_ (.+) }xms ) {

                my $DynamicFieldName = $1;

                # only if the workorder dynamic field contains something
                next ATTRIBUTE if !$WorkOrderInformation{ 'DynamicField_' . $DynamicFieldName };

                # get config for this dynamic field
                my $DynamicFieldConfig = $Param{DynamicFieldObject}->DynamicFieldGet(
                    Name => $DynamicFieldName,
                );

                next ATTRIBUTE if !$DynamicFieldConfig;

                # get print string for this dynamic field
                my $ValueStrg = $Param{BackendObject}->DisplayValueRender(
                    DynamicFieldConfig => $DynamicFieldConfig,
                    Value              => $WorkOrderInformation{ 'DynamicField_' . $DynamicFieldName },
                    ValueMaxChars      => 50,
                    LayoutObject       => $Self,
                );

                $Self->Block(
                    Name => 'DynamicField',
                    Data => {
                        Label => $DynamicFieldConfig->{Label},
                        Value => $ValueStrg->{Value},
                    },
                );
            }

            # all other attributes
            else {
                $Self->Block(
                    Name => $Attribute,
                    Data => {
                        %WorkOrderInformation,
                    },
                );
            }
        }
    }
}

=item _ITSMChangeGetTimeLine()

a helper method for the workorder graph of a change

=cut

sub _ITSMChangeGetTimeLine {
    my ( $Self, %Param ) = @_;

    # check for start time
    return if !$Param{StartTime};

    # check for start time is an integer value
    return if $Param{StartTime} !~ m{ \A \d+ \z }xms;

    # check for end time
    return if !$Param{EndTime};

    # check for end time is an integer value
    return if $Param{EndTime} !~ m{ \A \d+ \z }xms;

    # check for ticks
    return if !$Param{Ticks};

    # check for ticks is an integer value
    return if $Param{Ticks} !~ m{ \A \d+ \z }xms;

    # get current system time
    my $CurrentTime = $Kernel::OM->Get('Kernel::System::Time')->SystemTime();

    # check for system time
    return if !$CurrentTime;

    # check if current time is in change time interval
    return if $CurrentTime < $Param{StartTime};
    return if $CurrentTime > $Param{EndTime};

    # time line data
    my %TimeLine;

    # calculate percent of timeline
    my $RelativeEnd   = $Param{EndTime} - $Param{StartTime};
    my $RelativeStart = $CurrentTime - $Param{StartTime};

    # get timeline indent with 1 digit after decimal point
    $TimeLine{TimeLineLeft} = sprintf( "%.1f", ( $RelativeStart / $RelativeEnd ) * 100 );

    # verify percent values
    if ( $TimeLine{TimeLineLeft} <= 0 ) {
        $TimeLine{TimeLineLeft} = 0;
    }
    if ( $TimeLine{TimeLineLeft} >= 100 ) {
        $TimeLine{TimeLineLeft} = 99.9;
    }

    return \%TimeLine;
}

=end Internal:

=back

=cut

1;
