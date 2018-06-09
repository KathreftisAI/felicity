# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ITSMChange::OverviewSmall;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Output::HTML::Layout',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::ITSMChange',
    'Kernel::System::ITSMChange::ITSMWorkOrder',
    'Kernel::System::LinkObject',
    'Kernel::System::Log',
    'Kernel::System::Service',
    'Kernel::System::User',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # get UserID param
    $Self->{UserID} = $Param{UserID} || die "Got no UserID!";

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get log object
    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    # check needed stuff
    for my $Needed (qw(PageShown StartHit)) {
        if ( !$Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # need ChangeIDs or WorkOrderIDs
    if ( !$Param{ChangeIDs} && !$Param{WorkOrderIDs} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need the ChangeIDs or the WorkOrderIDs!',
        );
        return;
    }

    # only one of ChangeIDs or WorkOrderIDs can be used
    if ( $Param{ChangeIDs} && $Param{WorkOrderIDs} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need either the ChangeIDs or the WorkOrderIDs, not both!',
        );
        return;
    }

    # get service object
    my $ServiceObject = $Kernel::OM->Get('Kernel::System::Service');

    # in the customer frontend
    my %CustomerUserServices;
    if ( $Param{Frontend} eq 'Customer' && $Self->{Config}->{ShowOnlyChangesWithAllowedServices} ) {

        # get all services the customer user is allowed to use
        %CustomerUserServices = $ServiceObject->CustomerUserServiceMemberList(
            CustomerUserLogin => $Self->{UserID},
            Result            => 'HASH',
            DefaultServices   => 1,
        );
    }

    # define incident signals, needed for services
    my %InciSignals = (
        operational => 'greenled',
        warning     => 'yellowled',
        incident    => 'redled',
    );

    # store either the ChangeIDs or the WorkOrderIDs
    my @IDs;
    if ( $Param{ChangeIDs} && ref $Param{ChangeIDs} eq 'ARRAY' ) {
        @IDs = @{ $Param{ChangeIDs} };
    }
    elsif ( $Param{WorkOrderIDs} && ref $Param{WorkOrderIDs} eq 'ARRAY' ) {
        @IDs = @{ $Param{WorkOrderIDs} };
    }

    # check ShowColumns parameter
    my @ShowColumns;
    my %DynamicFieldColumns;
    if ( $Param{ShowColumns} && ref $Param{ShowColumns} eq 'ARRAY' ) {

        for my $Column ( sort @{ $Param{ShowColumns} } ) {

            # remember the dynamic field name
            if ( $Column =~ m{ \A DynamicField_ (.+) \z }xms ) {
                $DynamicFieldColumns{$1} = 1;
            }

            # remember normal fields
            else {
                push @ShowColumns, $Column;
            }
        }
    }

    # get dynamic field object
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    # get the dynamic field list of change and workorder dynamic fields
    my $DynamicFieldList = $DynamicFieldObject->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => [ 'ITSMChange', 'ITSMWorkOrder' ],
        FieldFilter => \%DynamicFieldColumns,
    );

    # add the already sorted dynamic fields
    for my $DynamicField ( @{$DynamicFieldList} ) {
        push @ShowColumns, 'DynamicField_' . $DynamicField->{Name};
    }

    # build lookup hash for ShowColumns
    my %ShowColumnsLookup = map { $_ => 1 } @ShowColumns;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # build column header blocks
    if (@ShowColumns) {

        COLUMN:
        for my $Column (@ShowColumns) {

            # create needed veriables
            my $CSS = 'OverviewHeader';
            my $OrderBy;

            # remove ID if necesary
            if ( $Param{SortBy} ) {
                $Param{SortBy} = ( $Param{SortBy} eq 'PriorityID' )
                    ? 'Priority'
                    : ( $Param{SortBy} eq 'CategoryID' )       ? 'Category'
                    : ( $Param{SortBy} eq 'ChangeBuilderID' )  ? 'ChangeBuilder'
                    : ( $Param{SortBy} eq 'ChangeManagerID' )  ? 'ChangeManager'
                    : ( $Param{SortBy} eq 'ChangeStateID' )    ? 'ChangeState'
                    : ( $Param{SortBy} eq 'ImpactID' )         ? 'Impact'
                    : ( $Param{SortBy} eq 'WorkOrderAgentID' ) ? 'WorkOrderAgent'
                    : ( $Param{SortBy} eq 'WorkOrderStateID' ) ? 'WorkOrderState'
                    : ( $Param{SortBy} eq 'WorkOrderTypeID' )  ? 'WorkOrderType'
                    :                                            $Param{SortBy};
            }

            # set the correct Set CSS class and order by link
            if ( $Param{SortBy} && ( $Param{SortBy} eq $Column ) ) {
                if ( $Param{OrderBy} && ( $Param{OrderBy} eq 'Up' ) ) {
                    $OrderBy = 'Down';
                    $CSS .= ' SortDescendingLarge';
                }
                else {
                    $OrderBy = 'Up';
                    $CSS .= ' SortAscendingLarge';
                }
            }
            else {
                $OrderBy = 'Up';
            }

            # handle dynamic fields
            if ( $Column =~ m{ \A DynamicField_ (.+) \z }xms ) {

                # get dynamic field data
                my $DynamicField = $DynamicFieldObject->DynamicFieldGet(
                    Name => $1,
                );

                $LayoutObject->Block(
                    Name => 'RecordDynamicFieldHeader',
                    Data => {
                        %{$DynamicField},
                    },
                );

                next COLUMN;
            }

            # handle "normal" fields
            else {
                $LayoutObject->Block(
                    Name => 'Record' . $Column . 'Header',
                    Data => {
                        %Param,
                        CSS     => $CSS,
                        OrderBy => $OrderBy,
                    },
                );
            }
        }
    }

    my $Output  = '';
    my $Counter = 0;

    # show changes if there are some
    if (@IDs) {

        ID:
        for my $ID (@IDs) {
            $Counter++;
            if (
                $Counter >= $Param{StartHit}
                && $Counter < ( $Param{PageShown} + $Param{StartHit} )
                )
            {

                # to store all data
                my %Data;

                # to store data of sub-elements
                my %SubElementData;

                my $ChangeID;
                if ( $Param{ChangeIDs} ) {

                    # set change id
                    $ChangeID = $ID;
                }
                elsif ( $Param{WorkOrderIDs} ) {

                    # get workorder data
                    my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
                        WorkOrderID => $ID,
                        UserID      => $Self->{UserID},
                    );

                    next ID if !$WorkOrder;

                    # add workorder data
                    %Data = ( %Data, %{$WorkOrder} );

                    # set change id from workorder data
                    $ChangeID = $WorkOrder->{ChangeID};
                }

                # get change data
                my $Change = $Kernel::OM->Get('Kernel::System::ITSMChange')->ChangeGet(
                    UserID   => $Self->{UserID},
                    ChangeID => $ChangeID,
                );

                next ID if !$Change;

                # add change data,
                # ( let workorder data overwrite
                # some change attributes, i.e. PlannedStartTime, etc... )
                %Data = ( %{$Change}, %Data );

                # get user data for needed user types
                USERTYPE:
                for my $UserType (qw(ChangeBuilder ChangeManager WorkOrderAgent)) {

                    # only show the data if enabled in ShowColumns config
                    next USERTYPE if !$ShowColumnsLookup{$UserType};

                    # check if UserType attribute exists either in change or workorder
                    if ( !$Change->{ $UserType . 'ID' } && !$Data{ $UserType . 'ID' } ) {
                        next USERTYPE;
                    }

                    # get user object
                    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

                    # when called from the customer interface
                    if ( !$UserObject->can('GetUserData') ) {

                        # workaround for customer interface
                        # in the customer interface the UserObject is in fact the CustomerUserObject
                        # so we need to correct this here by creating a new UserObject
                        $Self->{CustomerUserObject} = $UserObject;
                        $UserObject = $Kernel::OM->Get('Kernel::System::User');
                    }

                    # get user data
                    my %User = $UserObject->GetUserData(
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

                # if the services column should be shown
                if ( $ShowColumnsLookup{Services} ) {

                    # to store the linked service data
                    my $LinkListWithData = {};

                    my @WorkOrderIDs;

                    # store the combined linked services data from all workorders of this change
                    if ( $Param{ChangeIDs} ) {
                        @WorkOrderIDs = @{ $Change->{WorkOrderIDs} };
                    }

                    # store only the linked services for this workorder
                    elsif ( $Param{WorkOrderIDs} ) {
                        @WorkOrderIDs = ($ID);
                    }

                    # store the combined linked services data
                    for my $WorkOrderID (@WorkOrderIDs) {

                        # get linked objects of this workorder
                        my $LinkListWithDataWorkOrder
                            = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkListWithData(
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
                            for my $LinkType (
                                sort keys %{ $LinkListWithDataWorkOrder->{$Object} }
                                )
                            {

                                DIRECTION:
                                for my $Direction (
                                    sort
                                    keys %{ $LinkListWithDataWorkOrder->{$Object}->{$LinkType} }
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
                                        $LinkListWithData->{$Object}->{$LinkType}->{$Direction}
                                            ->{$ID} = $LinkListWithDataWorkOrder->{$Object}->{$LinkType}
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

                        # in the customer frontend
                        if (
                            $Param{Frontend} eq 'Customer'
                            && $Self->{Config}->{ShowOnlyChangesWithAllowedServices}
                            )
                        {

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
                        $ServiceData{CurInciSignal} = $InciSignals{ $ServiceData{CurInciStateType} };

                        # store service data
                        push @ServicesData, \%ServiceData;
                    }

                    # sort services data by service name
                    @ServicesData = sort { $a->{Name} cmp $b->{Name} } @ServicesData;

                    # in the customer frontend
                    if (
                        $Param{Frontend} eq 'Customer'
                        && $Self->{Config}->{ShowOnlyChangesWithAllowedServices}
                        )
                    {

                        # do not show the change if it has no services
                        next ID if !@ServicesData;
                    }

                    # store services data
                    $SubElementData{Services} = \@ServicesData;
                }

                # build record block
                $LayoutObject->Block(
                    Name => 'Record',
                    Data => {
                        %Param,
                        %Data,
                    },
                );

                # build column record blocks
                if (@ShowColumns) {

                    COLUMN:
                    for my $Column (@ShowColumns) {

                        # handle dynamic fields
                        if ( $Column =~ m{ \A DynamicField_ (.+) \z }xms ) {

                            # get dynamic field data
                            my $DynamicField = $DynamicFieldObject->DynamicFieldGet(
                                Name => $1,
                            );

                            # get dynamic field backend object
                            my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

                            # get field value
                            my $Value = $DynamicFieldBackendObject->ValueGet(
                                DynamicFieldConfig => $DynamicField,
                                ObjectID           => $ID,
                            );

                            my $ValueStrg = $DynamicFieldBackendObject->DisplayValueRender(
                                DynamicFieldConfig => $DynamicField,
                                Value              => $Value,
                                ValueMaxChars      => 20,
                                LayoutObject       => $LayoutObject,
                            );

                            $LayoutObject->Block(
                                Name => 'RecordDynamicField',
                                Data => {
                                    Value => $ValueStrg->{Value},
                                    Title => $ValueStrg->{Title},
                                },
                            );

                            $LayoutObject->Block(
                                Name => 'RecordDynamicFieldPlain',
                                Data => {
                                    Value => $ValueStrg->{Value},
                                    Title => $ValueStrg->{Title},
                                },
                            );
                        }

                        # handle "normal" fields
                        else {

                            $LayoutObject->Block(
                                Name => 'Record' . $Column,
                                Data => {
                                    %Param,
                                    %Data,
                                },
                            );
                        }

                        # check if this column contains sub-elements
                        if ( $SubElementData{$Column} && ref $SubElementData{$Column} eq 'ARRAY' ) {

                            for my $SubElement ( @{ $SubElementData{$Column} } ) {

                                # show sub-elements of column
                                $LayoutObject->Block(
                                    Name => 'Record' . $Column . 'SubElement',
                                    Data => {
                                        %Param,
                                        %Data,
                                        %{$SubElement},
                                    },
                                );
                            }
                        }

                        if ( !$SubElementData{Services} ) {
                            $LayoutObject->Block(
                                Name => 'Record' . $Column . 'SubElementEmpty',
                                Data => {},
                            );
                        }

                        # do not display columns as links in the customer frontend
                        next COLUMN if $Param{Frontend} eq 'Customer';

                        # show links if available
                        $LayoutObject->Block(
                            Name => 'Record' . $Column . 'LinkStart',
                            Data => {
                                %Param,
                                %Data,
                            },
                        );
                        $LayoutObject->Block(
                            Name => 'Record' . $Column . 'LinkEnd',
                            Data => {
                                %Param,
                                %Data,
                            },
                        );
                    }
                }
            }
        }
    }

    # if there are no changes to show, a no data found message is displayed in the table
    else {
        $LayoutObject->Block(
            Name => 'NoDataFoundMsg',
            Data => {
                TotalColumns => scalar @ShowColumns,
            },
        );
    }

    # use template
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AgentITSMChangeOverviewSmall',
        Data         => {
            %Param,
            Type        => $Self->{ViewType},
            ColumnCount => scalar @ShowColumns,
        },
    );

    return $Output;
}

1;
