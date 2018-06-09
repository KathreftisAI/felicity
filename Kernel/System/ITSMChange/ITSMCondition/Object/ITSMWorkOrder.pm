# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMCondition::Object::ITSMWorkOrder;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange::ITSMCondition',
    'Kernel::System::ITSMChange::ITSMWorkOrder',
    'Kernel::System::Log',
    'Kernel::System::User',
);

=head1 NAME

Kernel::System::ITSMChange::ITSMCondition::Object::ITSMWorkOrder - condition itsm workorder object lib

=head1 SYNOPSIS

All ITSMWorkOrder object functions for conditions in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $ConditionObjectITSMWorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition::Object::ITSMWorkOrder');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item DataGet()

Returns workorder data in an array reference.

    my $WorkOrderDataRef = $ConditionObjectITSMWorkOrder->DataGet(
        Selector => 1234,
        UserID   => 2345,
    );

=cut

sub DataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Selector UserID)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # handle 'any' or 'all' in a special case
    return $Self->_DataGetAll(%Param) if $Param{Selector} eq 'any';
    return $Self->_DataGetAll(%Param) if $Param{Selector} eq 'all';

    # remap params
    my %WorkOrderGet = (
        WorkOrderID => $Param{Selector},
        UserID      => $Param{UserID},
    );

    # get workorder as anon hash ref
    my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(%WorkOrderGet);

    # check for workorder
    return if !$WorkOrder;

    # build array ref
    my $WorkOrderData = [$WorkOrder];

    return $WorkOrderData;
}

=item CompareValueList()

Returns a list of available CompareValues for the given attribute id of a workorder object as hash reference.

    my $CompareValueList = $ConditionObjectITSMWorkOrder->CompareValueList(
        AttributeName => 'WorkOrderStateID',
        UserID        => 1,
    );

Returns a hash reference like this, for the workorder attribute 'WorkOrderStateID':

    $CompareValueList = {
        10    => 'created',
        12    => 'accepted',
        13    => 'ready',
        14    => 'in progress',
        15    => 'closed',
        16    => 'canceled',
    }

=cut

sub CompareValueList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(AttributeName UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # to store the list
    my $CompareValueList = {};

    # WorkOrderStateID
    if ( $Param{AttributeName} eq 'WorkOrderStateID' ) {

        # get workorder state list
        $CompareValueList = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderPossibleStatesGet(
            UserID => $Param{UserID},
        );
    }

    # WorkOrderTypeID
    elsif ( $Param{AttributeName} eq 'WorkOrderTypeID' ) {

        # get workorder type list
        $CompareValueList = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderTypeList(
            UserID => $Param{UserID},
        );
    }
    elsif ( $Param{AttributeName} eq 'WorkOrderAgentID' ) {

        # get a complete list of users
        my %Users = $Kernel::OM->Get('Kernel::System::User')->UserList(
            Type  => 'Long',
            Valid => 1,
        );

        $CompareValueList = \%Users;
    }

    return $CompareValueList;
}

=item SelectorList()

Returns a list of all selectors available for the given workorder object id and condition id as hash reference

    my $SelectorList = $ConditionObjectITSMWorkOrder->SelectorList(
        ObjectID    => 1234,
        ConditionID => 5,
        UserID      => 1,
    );

Returns a hash reference like this:

    $SelectorList = {
        10    => '1 - WorkorderTitle of Workorder 1',
        12    => '2 - WorkorderTitle of Workorder 2',
        34    => '3 - WorkorderTitle of Workorder 3',
        'any' => 'any',
        'all' => 'all',
    }

=cut

sub SelectorList {
    my ( $Self, %Param ) = @_;

    # get all workorder ids of change
    my $WorkOrderIDs = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderList(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
    );

    # check for workorder ids
    return if !$WorkOrderIDs;
    return if ref $WorkOrderIDs ne 'ARRAY';

    # build selector list
    my %SelectorList;
    for my $WorkOrderID ( @{$WorkOrderIDs} ) {

        # get workorder data
        my $WorkOrderData = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
            WorkOrderID => $WorkOrderID,
            UserID      => $Param{UserID},
        );

        $SelectorList{ $WorkOrderData->{WorkOrderID} }
            = $WorkOrderData->{WorkOrderNumber} . ' - ' . $WorkOrderData->{WorkOrderTitle};
    }

    # add 'all' selector (for expressions and actions)
    $SelectorList{'all'} = 'all';

    # add 'any' selector only for expressions
    if ( $Param{ExpressionID} ) {
        $SelectorList{'any'} = 'any';
    }

    return \%SelectorList;
}

=begin Internal:

=item _DataGetAll()

    my $WorkOrderDataArrayRef = $ConditionObjectITSMWorkOrder->_DataGetAll(
        ConditionID => 123,
        UserID      => 1,
    );

=cut

sub _DataGetAll {
    my ( $Self, %Param ) = @_;

    # get condition
    my $ConditionData = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ConditionGet(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # check for condition
    return if !$ConditionData;

    # get all workorder ids of change
    my $WorkOrderIDs = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderList(
        ChangeID => $ConditionData->{ChangeID},
        UserID   => $Param{UserID},
    );

    # check for workorder ids
    return if !$WorkOrderIDs;
    return if ref $WorkOrderIDs ne 'ARRAY';
    return if !@{$WorkOrderIDs};

    # get workorder data
    my @WorkOrderData;
    WORKORDERID:
    for my $WorkOrderID ( @{$WorkOrderIDs} ) {
        my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
            WorkOrderID => $WorkOrderID,
            UserID      => $Param{UserID},
        );

        # check workorder
        next WORKORDERID if !$WorkOrder;

        # add workorder to return array
        push @WorkOrderData, $WorkOrder;
    }

    # return workorder data
    return \@WorkOrderData;
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
