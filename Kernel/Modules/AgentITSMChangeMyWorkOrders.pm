# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentITSMChangeMyWorkOrders;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

    # check permissions
    my $Access = $Kernel::OM->Get('Kernel::System::ITSMChange')->Permission(
        Type   => $Self->{Config}->{Permission},
        Action => $Self->{Action},
        UserID => $Self->{UserID},
    );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # error screen
    if ( !$Access ) {
        return $LayoutObject->NoPermission(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'You need %s permissions!', $Self->{Config}->{Permission} ),
            WithHeader => 'yes',
        );
    }

    # store last screen, used for backlinks
    $Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenWorkOrders',
        Value     => $Self->{RequestedURL},
    );

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get sorting parameters
    my $SortBy = $ParamObject->GetParam( Param => 'SortBy' )
        || $Self->{Config}->{'SortBy::Default'}
        || 'PlannedStartTime';

    # get ordering parameters
    my $OrderBy = $ParamObject->GetParam( Param => 'OrderBy' )
        || $Self->{Config}->{'Order::Default'}
        || 'Up';

    my @SortByArray  = ($SortBy);
    my @OrderByArray = ($OrderBy);

    # sort by change number first if user wants to sort by workorder number
    if ( $SortBy eq 'WorkOrderNumber' ) {
        @SortByArray = ( 'ChangeNumber', 'WorkOrderNumber' );
        @OrderByArray = ( $OrderBy, $OrderBy );
    }

    # investigate refresh
    my $Refresh = $Self->{UserRefreshTime} ? 60 * $Self->{UserRefreshTime} : undef;

    # starting with page ...
    my $Output = $LayoutObject->Header( Refresh => $Refresh );
    $Output .= $LayoutObject->NavigationBar();
    $LayoutObject->Print( Output => \$Output );
    $Output = '';

    # find out which columns should be shown
    my @ShowColumns;
    if ( $Self->{Config}->{ShowColumns} ) {

        # get all possible columns from config
        my %PossibleColumn = %{ $Self->{Config}->{ShowColumns} };

        # get the column names that should be shown
        COLUMNNAME:
        for my $Name ( sort keys %PossibleColumn ) {
            next COLUMNNAME if !$PossibleColumn{$Name};
            push @ShowColumns, $Name;
        }
    }

    # to store the filters
    my %Filters;

    # get work order object
    my $WorkOrderObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder');

    # set other filters based on workorder state
    if ( $Self->{Config}->{'Filter::WorkOrderStates'} ) {

        # define position of the filter in the frontend
        my $PrioCounter = 1000;

        # get all workorder states that should be used as filters
        WORKORDERSTATE:
        for my $WorkOrderState ( @{ $Self->{Config}->{'Filter::WorkOrderStates'} } ) {

            # do not use empty workorder states
            next WORKORDERSTATE if !$WorkOrderState;

            # check if state is valid by looking up the state id
            my $WorkOrderStateID = $WorkOrderObject->WorkOrderStateLookup(
                WorkOrderState => $WorkOrderState,
            );

            # do not use invalid workorder states
            next WORKORDERSTATE if !$WorkOrderStateID;

            # increase the PrioCounter
            $PrioCounter++;

            # add filter for the current workorder state
            $Filters{$WorkOrderState} = {
                Name   => $WorkOrderState,
                Prio   => $PrioCounter,
                Search => {
                    WorkOrderAgentIDs => [ $Self->{UserID} ],
                    WorkOrderStates   => [$WorkOrderState],
                    OrderBy           => \@SortByArray,
                    OrderByDirection  => \@OrderByArray,
                    Limit             => 1000,
                    UserID            => $Self->{UserID},
                },
            };
        }
    }

    # get filter and view params
    $Self->{Filter} = $ParamObject->GetParam( Param => 'Filter' ) || 'All';
    $Self->{View}   = $ParamObject->GetParam( Param => 'View' )   || '';

    # if only one filter exists
    if ( scalar keys %Filters == 1 ) {

        # get the name of the only filter
        my ($FilterName) = keys %Filters;

        # activate this filter
        $Self->{Filter} = $FilterName;
    }
    else {

        # add default filter
        $Filters{All} = {
            Name   => 'All',
            Prio   => 1000,
            Search => {
                WorkOrderAgentIDs => [ $Self->{UserID} ],
                WorkOrderStates   => $Self->{Config}->{'Filter::WorkOrderStates'},
                OrderBy           => \@SortByArray,
                OrderByDirection  => \@OrderByArray,
                Limit             => 1000,
                UserID            => $Self->{UserID},
            },
        };
    }

    # check if filter is valid
    if ( !$Filters{ $Self->{Filter} } ) {
        $LayoutObject->FatalError(
            Message => $LayoutObject->{LanguageObject}->Translate( 'Invalid Filter: %s!', $Self->{Filter} ),
        );
    }

    # search workorders which match the selected filter
    my $WorkOrderIDsRef = $WorkOrderObject->WorkOrderSearch(
        %{ $Filters{ $Self->{Filter} }->{Search} },
    );

    # display all navbar filters
    my %NavBarFilter;
    for my $Filter ( sort keys %Filters ) {

        # count the number of workorders for each filter
        my $Count = $WorkOrderObject->WorkOrderSearch(
            %{ $Filters{$Filter}->{Search} },
            Result => 'COUNT',
        );

        # display the navbar filter
        $NavBarFilter{ $Filters{$Filter}->{Prio} } = {
            Count  => $Count,
            Filter => $Filter,
            %{ $Filters{$Filter} },
        };
    }

    # show changes
    my $LinkPage = 'Filter='
        . $LayoutObject->Ascii2Html( Text => $Self->{Filter} )
        . ';View=' . $LayoutObject->Ascii2Html( Text => $Self->{View} )
        . ';SortBy=' . $LayoutObject->Ascii2Html( Text => $SortBy )
        . ';OrderBy=' . $LayoutObject->Ascii2Html( Text => $OrderBy )
        . ';';
    my $LinkSort = 'Filter='
        . $LayoutObject->Ascii2Html( Text => $Self->{Filter} )
        . ';View=' . $LayoutObject->Ascii2Html( Text => $Self->{View} )
        . ';';
    my $LinkFilter = 'SortBy=' . $LayoutObject->Ascii2Html( Text => $SortBy )
        . ';OrderBy=' . $LayoutObject->Ascii2Html( Text => $OrderBy )
        . ';View=' . $LayoutObject->Ascii2Html( Text => $Self->{View} )
        . ';';
    $Output .= $LayoutObject->ITSMChangeListShow(

        WorkOrderIDs => $WorkOrderIDsRef,
        Total        => scalar @{$WorkOrderIDsRef},

        View => $Self->{View},

        Filter     => $Self->{Filter},
        Filters    => \%NavBarFilter,
        FilterLink => $LinkFilter,

        TitleName => $LayoutObject->{LanguageObject}->Translate('Overview: My Workorders'),

        TitleValue => $Self->{Filter},

        Env      => $Self,
        LinkPage => $LinkPage,
        LinkSort => $LinkSort,

        ShowColumns => \@ShowColumns,
        SortBy      => $LayoutObject->Ascii2Html( Text => $SortBy ),
        OrderBy     => $LayoutObject->Ascii2Html( Text => $OrderBy ),
    );

    $Output .= $LayoutObject->Footer();
    return $Output;
}

1;
