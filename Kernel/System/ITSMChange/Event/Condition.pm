# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::Event::Condition;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::ITSMChange::ITSMCondition',
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
    for my $Argument (qw(Data Event Config UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # to store the change id
    my $ChangeID;

    # to store the object were the data comes from
    my $Object;

    # handle change events
    if ( $Param{Event} =~ m{ \A Change }xms ) {

        # set the change id
        $ChangeID = $Param{Data}->{ChangeID};

        # set the object
        $Object = 'ITSMChange';
    }

    # handle workorder events
    elsif ( $Param{Event} =~ m{ \A WorkOrder }xms ) {

        # get workorder
        my $WorkOrder = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMWorkOrder')->WorkOrderGet(
            WorkOrderID => $Param{Data}->{WorkOrderID},
            UserID      => $Param{UserID},
        );

        # set the change id from workorder data
        $ChangeID = $WorkOrder->{ChangeID};

        # set the object
        $Object = 'ITSMWorkOrder';
    }

    # show error for unknown events
    else {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can not handle event '$Param{Event}'!",
        );
        return;
    }

    # in case of an update event or a time reached event, store the updated attributes
    my @AttributesChanged;
    if ( $Param{Event} eq 'ChangeUpdatePost' ) {

        # get old data
        my $OldData = $Param{Data}->{OldChangeData};

        FIELD:
        for my $Field ( sort keys %{ $Param{Data} } ) {

            # avoid recursion
            next FIELD if $Field eq 'OldChangeData';

            # we do not track the user id and "plain" columns
            next FIELD if $Field eq 'UserID';
            next FIELD if $Field eq 'JustificationPlain';
            next FIELD if $Field eq 'DescriptionPlain';

            # check if field has changed
            my $FieldHasChanged = $Self->_HasFieldChanged(
                New => $Param{Data}->{$Field},
                Old => $OldData->{$Field},
            );

            next FIELD if !$FieldHasChanged;

            # remember changed field name
            push @AttributesChanged, $Field;
        }
    }
    elsif ( $Param{Event} eq 'WorkOrderUpdatePost' ) {

        # get old data
        my $OldData = $Param{Data}->{OldWorkOrderData};

        FIELD:
        for my $Field ( sort keys %{ $Param{Data} } ) {

            # avoid recursion
            next FIELD if $Field eq 'OldWorkOrderData';

            # we do not track the user id and "plain" columns
            next FIELD if $Field eq 'UserID';
            next FIELD if $Field eq 'ReportPlain';
            next FIELD if $Field eq 'InstructionPlain';

            # special handling for accounted time
            if ( $Field eq 'AccountedTime' ) {

                # we do not track if accounted time was empty or zero
                next FIELD if !$Param{Data}->{AccountedTime};

                # remember changed field name
                push @AttributesChanged, $Field;

                next FIELD;
            }

            # check if field has changed
            my $FieldHasChanged = $Self->_HasFieldChanged(
                New => $Param{Data}->{$Field},
                Old => $OldData->{$Field},
            );

            next FIELD if !$FieldHasChanged;

            # remember changed field name
            push @AttributesChanged, $Field;
        }
    }

    # all kind of change and workorder time reached events
    elsif ( $Param{Event} =~ m{ \A (?: Change | WorkOrder ) ( .+ Time ) ReachedPost \z }xms ) {

        # get the name of the reached time field
        my $Field = $1;

        # remember changed field name
        push @AttributesChanged, $Field;
    }

    # match all conditions for this change and execute all actions
    my $Success = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition')->ConditionMatchExecuteAll(
        ChangeID          => $ChangeID,
        AttributesChanged => { $Object => \@AttributesChanged },
        Event             => $Param{Event},
        UserID            => $Param{UserID},
    );

    # check errors
    if ( !$Success ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ConditionMatchExecuteAll could not be "
                . "executed successfully for event '$Param{Event}' on ChangeID '$ChangeID'!",
        );
        return;
    }

    return 1;
}

=begin Internal:

=item _HasFieldChanged()

This method checks whether a field was changed or not. It returns 1 when field
was changed, 0 otherwise

    my $FieldHasChanged = $ConditionObject->_HasFieldChanged(
        Old => 'old value', # can be array reference or hash reference as well
        New => 'new value', # can be array reference or hash reference as well
    );

=cut

sub _HasFieldChanged {
    my ( $Self, %Param ) = @_;

    # field has changed when either 'new' or 'old is not set
    return 1 if !( $Param{New} && $Param{Old} ) && ( $Param{New} || $Param{Old} );

    # field has not changed when both values are empty
    return if !$Param{New} && !$Param{Old};

    # return result of 'eq' when both params are scalars
    return $Param{New} ne $Param{Old} if !ref( $Param{New} ) && !ref( $Param{Old} );

    # a field has changed when 'ref' is different
    return 1 if ref( $Param{New} ) ne ref( $Param{Old} );

    # check hashes
    if ( ref $Param{New} eq 'HASH' ) {

        # field has changed when number of keys are different
        return 1 if scalar keys %{ $Param{New} } != scalar keys %{ $Param{Old} };

        # check the values for each key
        for my $Key ( sort keys %{ $Param{New} } ) {
            return 1 if $Param{New}->{$Key} ne $Param{Old}->{$Key};
        }
    }

    # check arrays
    if ( ref $Param{New} eq 'ARRAY' ) {

        # changed when number of elements differ
        return 1 if scalar @{ $Param{New} } != scalar @{ $Param{Old} };

        # check each element
        for my $Index ( 0 .. $#{ $Param{New} } ) {
            return 1 if $Param{New}->[$Index] ne $Param{Old}->[$Index];
        }
    }

    # field has not been changed
    return 0;
}

1;
