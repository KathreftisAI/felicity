# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMCondition::Operator::ITSMWorkOrder;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange::ITSMWorkOrder',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::ITSMChange::ITSMCondition::Operator::ITSMWorkOrder - condition itsm workorder operator lib

=head1 SYNOPSIS

All ITSMWorkOrder operator functions for conditions in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $ConditionOperatorITSMWorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition::Operator::ITSMWorkOrder');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=item Set()

Updates a workorder with the given data.

    my $Success = $ITSMWorkOrderOperator->Set(
        Selector    => 1234,
        Attribute   => 'WorkOrderStateID',
        ActionValue => 2345,
        UserID      => 1234,
    );

=cut

sub Set {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Selector Attribute ActionValue UserID)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get workorder
    my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
        WorkOrderID => $Param{Selector},
        UserID      => $Param{UserID},
    );

    # check error
    return if !$WorkOrder;
    return if ref $WorkOrder ne 'HASH';

    # set workorder attribute to empty string if it is not true
    $WorkOrder->{ $Param{Attribute} } ||= '';

    # do not update the attribute if it already has this value
    # ( this will prevent infinite event looping! )
    return 1 if $WorkOrder->{ $Param{Attribute} } eq $Param{ActionValue};

    # if the workorder agent should be deleted it has to be undefined
    if ( $Param{Attribute} eq 'WorkOrderAgentID' && !$Param{ActionValue} ) {
        $Param{ActionValue} = undef;
    }

    # update workorder and return update result
    return $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderUpdate(
        WorkOrderID       => $Param{Selector},
        $Param{Attribute} => $Param{ActionValue},
        UserID            => $Param{UserID},
    );
}

=item SetAll()

Updates a set of workorders with the given data.

    my $Success = $ITSMWorkOrderOperator->SetAll(
        Objects     => [ {...}, {...}, ],  # data of ITSMWorkOrders
        Attribute   => 'WorkOrderStateID',
        ActionValue => 2345,
        UserID      => 1234,
    );

=cut

sub SetAll {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Objects Attribute ActionValue UserID)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check objects
    return if ref $Param{Objects} ne 'ARRAY';

    # this will be set to zero if any of the Set-Operations fails
    my $SetAllSuccess = 1;

    # update each workorder object
    WORKORDEROBJECT:
    for my $WorkOrderObject ( @{ $Param{Objects} } ) {

        # check workorder object
        next WORKORDEROBJECT if !$WorkOrderObject;
        next WORKORDEROBJECT if ref $WorkOrderObject ne 'HASH';

        # update workorder object
        my $Result = $Self->Set(
            Selector    => $WorkOrderObject->{WorkOrderID},
            Attribute   => $Param{Attribute},
            ActionValue => $Param{ActionValue},
            UserID      => $Param{UserID},
        );

        # if a set operation was not successful,
        # then the complete SetAll operation will not be successful
        if ( !$Result ) {
            $SetAllSuccess = 0;
        }
    }

    return $SetAllSuccess;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
