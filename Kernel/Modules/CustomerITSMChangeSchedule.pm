# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::CustomerITSMChangeSchedule;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

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

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # store last screen
    if (
        !$Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => 'LastChangeView',
            Value     => $Self->{RequestedURL},
        )
        )
    {
        my $Output = $LayoutObject->CustomerHeader(
            Title => Translatable('Error'),
        );
        $Output .= $LayoutObject->CustomerError();
        $Output .= $LayoutObject->CustomerFooter();
        return $Output;
    }

    # check needed CustomerID
    if ( !$Self->{UserCustomerID} ) {
        my $Output = $LayoutObject->CustomerHeader(
            Title => Translatable('Error'),
        );
        $Output .= $LayoutObject->CustomerError(
            Message => Translatable('Need CustomerID!'),
        );
        $Output .= $LayoutObject->CustomerFooter();
        return $Output;
    }

    # get config of frontend module
    $Self->{Config} = $Kernel::OM->Get('Kernel::Config')->Get("ITSMChange::Frontend::$Self->{Action}");

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

    # investigate refresh
    my $Refresh = $Self->{UserRefreshTime} ? 60 * $Self->{UserRefreshTime} : undef;

    # starting with page ...
    my $Output = $LayoutObject->CustomerHeader(
        Refresh => $Refresh,
        Title   => '',
    );

    # build NavigationBar
    $Output .= $LayoutObject->CustomerNavigationBar();

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

    # get change object
    my $ChangeObject = $Kernel::OM->Get('Kernel::System::ITSMChange');

    # set other filters based on change state
    if ( $Self->{Config}->{'Filter::ChangeStates'} ) {

        # define position of the filter in the frontend
        my $PrioCounter = 1000;

        # get all change states that should be used as filters
        CHANGESTATE:
        for my $ChangeState ( @{ $Self->{Config}->{'Filter::ChangeStates'} } ) {

            # do not use empty change states
            next CHANGESTATE if !$ChangeState;

            # check if state is valid by looking up the state id
            my $ChangeStateID = $ChangeObject->ChangeStateLookup(
                ChangeState => $ChangeState,
            );

            # do not use invalid change states
            next CHANGESTATE if !$ChangeStateID;

            # increase the PrioCounter
            $PrioCounter++;

            # add filter for the current change state
            $Filters{$ChangeState} = {
                Name   => $ChangeState,
                Prio   => $PrioCounter,
                Search => {
                    ChangeStates     => [$ChangeState],
                    OrderBy          => \@SortByArray,
                    OrderByDirection => \@OrderByArray,
                    Limit            => 1000,
                    UserID           => 1,
                },
            };
        }
    }

    # get filter and view params
    $Self->{Filter} = $ParamObject->GetParam( Param => 'Filter' ) || 'All';
    $Self->{View}   = $ParamObject->GetParam( Param => 'View' )   || '';
    $Self->{StartHit} = int( $ParamObject->GetParam( Param => 'StartHit' ) || 1 );
    $Self->{PageShown} = $Self->{UserShowTickets} || 1;

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
                ChangeStates     => $Self->{Config}->{'Filter::ChangeStates'},
                OrderBy          => \@SortByArray,
                OrderByDirection => \@OrderByArray,
                Limit            => 1000,
                UserID           => 1,
            },
        };
    }

    # check if filter is valid
    if ( !$Filters{ $Self->{Filter} } ) {
        $LayoutObject->FatalError(
            Message => $LayoutObject->{LanguageObject}->Translate( 'Invalid Filter: %s!', $Self->{Filter} ),
        );
    }

    # search changes which match the selected filter
    my $ChangeIDsRef = $ChangeObject->ChangeSearch(
        %{ $Filters{ $Self->{Filter} }->{Search} },
    );
    my @ChangeIDs = @{$ChangeIDsRef};

    my %CustomerUserServices;
    my %CountByChangeState;

    # get needed objects
    my $LinkObject    = $Kernel::OM->Get('Kernel::System::LinkObject');
    my $ServiceObject = $Kernel::OM->Get('Kernel::System::Service');

    # if configured, get only changes which have workorders that are linked with a service
    if ( $Self->{Config}->{ShowOnlyChangesWithAllowedServices} ) {

        # get all services the customer user is allowed to use
        %CustomerUserServices = $ServiceObject->CustomerUserServiceMemberList(
            CustomerUserLogin => $Self->{UserID},
            Result            => 'HASH',
            DefaultServices   => 1,
        );

        my %UniqueChangeIDs;
        CHANGEID:
        for my $ChangeID (@ChangeIDs) {

            # get change data
            my $Change = $ChangeObject->ChangeGet(
                UserID   => $Self->{UserID},
                ChangeID => $ChangeID,
            );

            # get workorder ids
            my @WorkOrderIDs = @{ $Change->{WorkOrderIDs} };

            # don't show changes with no workorders (as they can not be linked with a service)
            next CHANGEID if !@WorkOrderIDs;

            WORKORDERID:
            for my $WorkOrderID (@WorkOrderIDs) {

                # get the list of linked services
                my %LinkKeyList = $LinkObject->LinkKeyList(
                    Object1 => 'ITSMWorkOrder',
                    Key1    => $WorkOrderID,
                    Object2 => 'Service',
                    State   => 'Valid',
                    UserID  => 1,
                );

                # workorder has no linked service
                next WORKORDERID if !%LinkKeyList;

                SERVICEID:
                for my $ServiceID ( sort keys %LinkKeyList ) {

                    # only use services where the customer is allowed to use the service
                    next SERVICEID if !$CustomerUserServices{$ServiceID};

                    # add change id to list of visible changes for the customer
                    $UniqueChangeIDs{$ChangeID}++;

                    # count the visible changes per state
                    $CountByChangeState{ $Change->{ChangeState} }++;
                }
            }
        }

        @ChangeIDs = keys %UniqueChangeIDs;

        # add the all count
        $CountByChangeState{All} = scalar @ChangeIDs;
    }

    # display all navbar filters
    my %NavBarFilter;
    my $Counter;
    my $AllChanges;
    my $AllChangesTotal;

    # store the number of filters
    my $NumberOfFilters = keys %Filters;

    # array to sort the filters by its priority
    my @NavBarFilters = sort { $Filters{$a}->{Prio} <=> $Filters{$b}->{Prio} } keys %Filters;

    FILTER:
    for my $FilterName (@NavBarFilters) {
        $Counter++;

        # due to service restrictions for customer users
        # we need to count differently if the feature "ShowOnlyChangesWithAllowedServices"
        # is activated
        my $Count;
        if ( $Self->{Config}->{ShowOnlyChangesWithAllowedServices} ) {
            $Count = $CountByChangeState{$FilterName} || 0;
        }
        else {

            # count the number of changes for each filter
            $Count = $ChangeObject->ChangeSearch(
                %{ $Filters{$FilterName}->{Search} },
                Result => 'COUNT',
            );
        }

        if ( $FilterName ne 'All' && !$Count ) {
            next FILTER;
        }

        my $ClassLI = '';
        my $ClassA  = '';
        if ( $FilterName eq $Self->{Filter} ) {
            $ClassA = 'Selected';
            $AllChanges = $Count || 0;
        }
        if ( $NumberOfFilters == $Counter ) {
            $ClassLI = 'Last';
        }
        if ( $FilterName eq 'All' ) {
            $AllChangesTotal = $Count;
        }

        # set counter string (emty string if Count is undefined)
        my $CountStrg;
        if ( defined $Count ) {
            $CountStrg = '(' . $Count . ')';
        }

        # display the navbar filter
        $NavBarFilter{ $Filters{$FilterName}->{Prio} } = {
            CountStrg => $CountStrg,
            Filter    => $FilterName,
            ClassLI   => $ClassLI,
            ClassA    => $ClassA,
            %{ $Filters{$FilterName} },
        };
    }

    # set meta-link for pagination
    my $Link = 'SortBy=' . $LayoutObject->Ascii2Html( Text => $SortBy )
        . ';OrderBy=' . $LayoutObject->Ascii2Html( Text => $OrderBy )
        . ';Filter=' . $LayoutObject->Ascii2Html( Text => $Self->{Filter} )
        . ';Subaction=' . $LayoutObject->Ascii2Html( Text => $Self->{Subaction} )
        . ';';

    # create pagination
    my %PageNav = $LayoutObject->PageNavBar(
        Limit     => 10000,
        StartHit  => $Self->{StartHit},
        PageShown => $Self->{PageShown},
        AllHits   => scalar(@ChangeIDs),                    #$AllChanges,
        Action    => 'Action=CustomerITSMChangeSchedule',
        Link      => $Link,
        IDPrefix  => 'CustomerITSMChangeSchedule',
    );

    # show changes is data if any
    if ( scalar @ChangeIDs ) {

        # show header filter
        for my $Key ( sort keys %NavBarFilter ) {
            $LayoutObject->Block(
                Name => 'FilterHeader',
                Data => {
                    %{ $NavBarFilter{$Key} },
                },
            );
        }

        if ( scalar @ShowColumns ) {

            # set headers
            for my $ColumnName (@ShowColumns) {

                # create needed veriables
                my $CSS = '';
                my $SetOrderBy;

                # remove ID if necesary
                if ($SortBy) {
                    $SortBy = ( $SortBy eq 'PriorityID' )
                        ? 'Priority'
                        : ( $SortBy eq 'CategoryID' )       ? 'Category'
                        : ( $SortBy eq 'ChangeBuilderID' )  ? 'ChangeBuilder'
                        : ( $SortBy eq 'ChangeManagerID' )  ? 'ChangeManager'
                        : ( $SortBy eq 'ChangeStateID' )    ? 'ChangeState'
                        : ( $SortBy eq 'ImpactID' )         ? 'Impact'
                        : ( $SortBy eq 'WorkOrderAgentID' ) ? 'WorkOrderAgent'
                        : ( $SortBy eq 'WorkOrderStateID' ) ? 'WorkOrderState'
                        : ( $SortBy eq 'WorkOrderTypeID' )  ? 'WorkOrderType'
                        :                                     $SortBy;
                }

                # set the correct Set CSS class and order by link
                if ( $SortBy && ( $SortBy eq $ColumnName ) ) {
                    if ( $OrderBy && ( $OrderBy eq 'Up' ) ) {
                        $SetOrderBy = 'Down';
                        $CSS .= ' SortDescending';
                    }
                    else {
                        $SetOrderBy = 'Up';
                        $CSS .= ' SortAscending';
                    }
                }
                else {
                    $SetOrderBy = 'Up';
                }

                $LayoutObject->Block(
                    Name => 'Record' . $ColumnName . 'Header',
                    Data => {
                        CSS     => $CSS,
                        OrderBy => $SetOrderBy,
                    },
                );
            }
        }

        # define incident signals, needed for services
        my %InciSignals = (
            operational => 'greenled',
            warning     => 'yellowled',
            incident    => 'redled',
        );

        # show changes's
        $Counter = 0;

        ID:
        for my $ChangeID (@ChangeIDs) {
            $Counter++;
            if (
                $Counter >= $Self->{StartHit}
                && $Counter < ( $Self->{PageShown} + $Self->{StartHit} )
                )
            {

                # to store all data
                my %Data;

                # to store data of sub-elements
                my %SubElementData;

                my $Change = $ChangeObject->ChangeGet(
                    ChangeID => $ChangeID,
                    UserID   => $Self->{UserID},
                );

                next ID if !$Change;

                # add change data,
                # ( let workorder data overwrite
                # some change attributes, i.e. PlannedStartTime, etc... )
                %Data = ( %{$Change}, %Data );

                # get user data for needed user types
                USERTYPE:
                for my $UserType (qw(ChangeBuilder ChangeManager WorkOrderAgent)) {

                    # check if UserType attribute exists either in change or workorder
                    if ( !$Change->{ $UserType . 'ID' } && !$Data{ $UserType . 'ID' } ) {
                        next USERTYPE;
                    }

                    # get user data
                    my %User = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
                        UserID => $Change->{ $UserType . 'ID' } || $Data{ $UserType . 'ID' },
                        Cached => 1,
                    );

                    # set user data
                    $Data{ $UserType . 'UserLogin' }        = $User{UserLogin};
                    $Data{ $UserType . 'UserFirstname' }    = $User{UserFirstname};
                    $Data{ $UserType . 'UserLastname' }     = $User{UserLastname};
                    $Data{ $UserType . 'LeftParenthesis' }  = '(';
                    $Data{ $UserType . 'RightParenthesis' } = ')';
                }

                # to store the linked service data
                my $LinkListWithData = {};

                my @WorkOrderIDs;

                # store the combined linked services data from all workorders of this change
                @WorkOrderIDs = @{ $Change->{WorkOrderIDs} };

                # store the combined linked services data
                for my $WorkOrderID (@WorkOrderIDs) {

                    # get linked objects of this workorder
                    my $LinkListWithDataWorkOrder = $LinkObject->LinkListWithData(
                        Object => 'ITSMWorkOrder',
                        Key    => $WorkOrderID,
                        State  => 'Valid',
                        UserID => $Self->{UserID},
                    );

                    OBJECT:
                    for my $Object ( sort keys %{$LinkListWithDataWorkOrder} ) {

                        # only show linked services of workorder
                        if ( $Object ne 'Service' ) {
                            next OBJECT;
                        }

                        LINKTYPE:
                        for my $LinkType ( sort keys %{ $LinkListWithDataWorkOrder->{$Object} } ) {

                            DIRECTION:
                            for my $Direction (
                                sort keys %{ $LinkListWithDataWorkOrder->{$Object}->{$LinkType} }
                                )
                            {

                                ID:
                                for my $ID (
                                    sort keys %{
                                        $LinkListWithDataWorkOrder->{$Object}->{$LinkType}
                                            ->{$Direction}
                                    }
                                    )
                                {

                                    # combine the linked object data from all workorders
                                    $LinkListWithData->{$Object}->{$LinkType}->{$Direction}->{$ID}
                                        = $LinkListWithDataWorkOrder->{$Object}->{$LinkType}
                                        ->{$Direction}->{$ID};
                                }
                            }
                        }
                    }
                }

                # get unique service ids
                my %UniqueServiceIDs;
                my $ServicesRef = $LinkListWithData->{Service} || {};
                for my $LinkType ( sort keys %{$ServicesRef} ) {

                    # extract link type List
                    my $LinkTypeList = $ServicesRef->{$LinkType};

                    for my $Direction ( sort keys %{$LinkTypeList} ) {

                        # extract direction list
                        my $DirectionList = $ServicesRef->{$LinkType}->{$Direction};

                        # collect unique service ids
                        for my $ServiceID ( sort keys %{$DirectionList} ) {
                            $UniqueServiceIDs{$ServiceID}++;
                        }
                    }
                }

                # get the data for each service
                my @ServicesData;
                SERVICEID:
                for my $ServiceID ( sort keys %UniqueServiceIDs ) {

                    if ( $Self->{Config}->{ShowOnlyChangesWithAllowedServices} ) {

                        # do not show this service if customer is not allowed to use it
                        next SERVICEID if !$CustomerUserServices{$ServiceID};
                    }

                    # get service data
                    my %ServiceData = $ServiceObject->ServiceGet(
                        ServiceID     => $ServiceID,
                        IncidentState => 1,
                        UserID        => $Self->{UserID},
                    );

                    # add current incident signal
                    $ServiceData{CurInciSignal} = $InciSignals{ $ServiceData{CurInciStateType} || '' } || '';

                    # store service data
                    push @ServicesData, \%ServiceData;
                }

                # sort services data by service name
                @ServicesData = sort { $a->{Name} cmp $b->{Name} } @ServicesData;

                # do not show the change if it has no services
                next ID if !@ServicesData;

                # store services data
                $SubElementData{Services} = \@ServicesData;

                # add block
                $LayoutObject->Block(
                    Name => 'Record',
                    Data => {},
                );

                if (@ShowColumns) {
                    COLUMN:
                    for my $ColumnName (@ShowColumns) {
                        $LayoutObject->Block(
                            Name => 'Record' . $ColumnName,
                            Data => {
                                %Data,
                            },
                        );

                        # check if this column contains sub-elements
                        if (
                            $SubElementData{$ColumnName}
                            && ref $SubElementData{$ColumnName} eq 'ARRAY'
                            )
                        {

                            for my $SubElement ( @{ $SubElementData{$ColumnName} } ) {

                                # show sub-elements of column
                                $LayoutObject->Block(
                                    Name => 'Record' . $ColumnName . 'SubElement',
                                    Data => {
                                        %Param,
                                        %Data,
                                        %{$SubElement},
                                    },
                                );
                            }
                        }

                        if ( !@ServicesData ) {
                            $LayoutObject->Block(
                                Name => 'Record' . $ColumnName . 'SubElementEmpty',
                                Data => {},
                            );
                        }
                    }
                }
            }
        }
    }

    # otherwise show no data found message
    else {
        $LayoutObject->Block(
            Name => 'NoDataFoundMsg',
            Data => {},
        );
    }

    $Output .= $LayoutObject->Output(
        TemplateFile => 'CustomerITSMChangeOverview',
        Data         => \%Param,
    );

    # get page footer
    $Output .= $LayoutObject->CustomerFooter();

    return $Output;
}

1;
