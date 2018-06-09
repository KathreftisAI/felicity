# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMWorkOrder::Event::WorkOrderNumberCalc;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange::ITSMWorkOrder',
    'Kernel::System::Log',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Data Event Config UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # check if recalculation of workorder numbers is needed
    return 1 if $Param{Data}->{NoNumberCalc};

    # handle WorkOrderUpdate and WorkOrderDeletePost events
    if ( $Param{Event} =~ m{ \A ( WorkOrderUpdatePost | WorkOrderDeletePost ) \z }xms ) {

        # recalculate WorkOrder numbers
        # the ChangeID is in the OldWorkOrderData so we do not need to make a WorkOrderGet() here
        return if !$Self->_WorkOrderNumberCalc(
            ChangeID => $Param{Data}->{OldWorkOrderData}->{ChangeID},
            UserID   => $Param{UserID},
        );
    }

    # error
    else {

        # an unknown event
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "$Param{Event} is an unknown event for this eventhandler!",
        );

        return;
    }

    return 1;
}

=begin Internal:

=item _WorkOrderNumberCalc()

This method actually recalculates the WorkOrderNumbers for the workorders of
the given change.
It returns 1 on success, C<undef> otherwise.

    my $Success = $EventObject->_WorkOrderNumberCalc(
        ChangeID => 123,
        UserID   => 1,
    );

=cut

sub _WorkOrderNumberCalc {
    my ( $Self, %Param ) = @_;

    # check for needed stuff - ChangeID and UserID
    for my $Needed (qw(ChangeID UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # define the order direction for each attribute
    my %OrderDirection = (
        PlannedStartTime => 'Up',
        PlannedEndTime   => 'Down',
        WorkOrderID      => 'Up',
    );

    # define the OrderBy array
    my @OrderBy = (
        'PlannedStartTime',
        'PlannedEndTime',
        'WorkOrderID',
    );

    # define the OrderByDirection array
    my @OrderByDirection = map { $OrderDirection{$_} } @OrderBy;

    # use WorkOrderSearch: Search for given IDs, ordered by:
    # PlannedStartTime, PlannedEndTime, WorOrderID
    my $SortedWorkOrderIDs = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderSearch(
        ChangeIDs        => [ $Param{ChangeID} ],
        OrderBy          => \@OrderBy,
        OrderByDirection => \@OrderByDirection,
        UserID           => $Param{UserID},
    ) || [];

    # counter - used as WorkOrderNumber
    my $Counter = 0;

    # to store the WorkOrderIDs and their new WorkOrderNumbers
    my %NewWorkOrderNumber;

    # set new WorkOrderNumber
    WORKORDERID:
    for my $WorkOrderID ( @{$SortedWorkOrderIDs} ) {

        # increment Counter to get new WorkOrderNumber
        $Counter++;

        # get WorkOrder
        my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
            WorkOrderID => $WorkOrderID,
            UserID      => $Param{UserID},
        );

        # update only when Number changed - to avoid infinit loops
        next WORKORDERID if $Counter == $WorkOrder->{WorkOrderNumber};

        # store the new WorkOrderNumber for this WorkOrderID
        $NewWorkOrderNumber{$WorkOrderID} = $Counter;
    }

    # update the workorders that need a new WorkOrderNumber
    for my $WorkOrderID ( sort keys %NewWorkOrderNumber ) {

        # update each workorder, prevent recalculation of the WorkOrderNumber again
        my $CouldUpdateWorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderUpdate(
            WorkOrderID     => $WorkOrderID,
            WorkOrderNumber => $NewWorkOrderNumber{$WorkOrderID},
            NoNumberCalc    => 1,
            UserID          => $Param{UserID},
        );
    }

    return 1;
}

1;

=end Internal:
