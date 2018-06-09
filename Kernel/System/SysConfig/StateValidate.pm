# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::SysConfig::StateValidate;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::State',
);

=head1 NAME

Kernel::System::SysConfig::StateValidate - StateValidate lib

=head1 SYNOPSIS

All functions for the StateValidate checks.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $StateValidateObject = $Kernel::OM->Get('Kernel::System::SysConfig::StateValidate');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # set the debug flag
    $Self->{Debug} = $Param{Debug} || 0;

    return $Self;
}

=item Validate()

Validates the given data, checks if the given state exists and if it is valid.

    my $Success = $StateValidateObject->Validate(
        Data => 'open',
    );

=cut

sub Validate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Data} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need Data!",
        );
        return;
    }

    # get list of all valid states
    my %States = $Kernel::OM->Get('Kernel::System::State')->StateList(
        UserID => 1,
        Valid  => 1,
    );

    # build lookup hash for state names
    my %State2ID = reverse %States;

    # data is a not a scalar
    if ( ref $Param{Data} ) {

        # data is an array (coming from the config item, needs to be converted to a hash)
        if ( ref $Param{Data} eq 'ARRAY' ) {

            # to store the converted data
            my %Data;

            ITEM:
            for my $Item ( @{ $Param{Data} } ) {
                next ITEM if ref $Item ne 'HASH';

                # convert into hash entry
                $Data{ $Item->{Key} } = $Item->{Content};
            }

            # assign to $Param{Data}
            $Param{Data} = \%Data;
        }

        # data is a hash (data is coming from AdminSysConfig frontend)
        if ( ref $Param{Data} eq 'HASH' ) {

            for my $State ( sort keys %{ $Param{Data} } ) {

                # check the key
                return if !$State2ID{$State};

                # check the value
                return if !$State2ID{ $Param{Data}->{$State} };
            }

            return 1;
        }

        # log error
        else {

            # get the reference type
            my $RefType = ref $Param{Data};

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Data must be a scalar or a hash, but it is a $RefType!",
            );
            return;
        }
    }

    # state does not exist or is invalid
    return if !$State2ID{ $Param{Data} };

    return 1;
}

=item GetAutoCorrectValue()

Without the parameter Data, this function returns a valid state name,
which can be used to auto-correct a sysconfig option with an invalid state name.
If the parameter Data is given, and it is a hash reference, then all keys and values of the
hash will be checked, and corrected if necessary.

    my $Value = $StateValidateObject->GetAutoCorrectValue(
        Data => {                                            # (optional)
            'pending auto close+' => 'closed successful',
            'pending auto close-' => 'closed unsuccessful',
        },
    );

=cut

sub GetAutoCorrectValue {
    my ( $Self, %Param ) = @_;

    # no data param is given, or data is a scalar
    if ( !$Param{Data} || !ref $Param{Data} ) {

        # return an auto correct value for a state
        return $Self->_GetAutoCorrectValue();
    }

    # get list of all valid states
    my %States = $Kernel::OM->Get('Kernel::System::State')->StateList(
        UserID => 1,
        Valid  => 1,
    );

    # build lookup hash for state names
    my %State2ID = reverse %States;

    # data is an array (coming from the config item, needs to be converted to a hash)
    if ( ref $Param{Data} eq 'ARRAY' ) {

        # to store the converted data
        my %Data;

        ITEM:
        for my $Item ( @{ $Param{Data} } ) {
            next ITEM if ref $Item ne 'HASH';

            # convert into hash entry
            $Data{ $Item->{Key} } = $Item->{Content};
        }

        # assign to $Param{Data}
        $Param{Data} = \%Data;
    }

    # data is a hash
    if ( ref $Param{Data} eq 'HASH' ) {

        # to store the new state hash
        my %NewStates;

        # check each state (in keys and values)
        for my $State ( sort keys %{ $Param{Data} } ) {

            # store the state (key and value)
            my $Key   = $State;
            my $Value = $Param{Data}->{$State};

            # check the key
            if ( !$State2ID{$Key} ) {

                # auto-correct the key
                $Key = $Self->_GetAutoCorrectValue();
            }

            # check the value
            if ( !$State2ID{$Value} ) {

                # auto-correct the value
                $Value = $Self->_GetAutoCorrectValue();
            }

            # add to new state hash
            $NewStates{$Key} = $Value;
        }

        # return the new state hash
        return \%NewStates;
    }

    # log error
    else {

        # get the reference type
        my $RefType = ref $Param{Data};

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Data must be a scalar or a hash, but it is a $RefType!",
        );
        return;
    }

}

=begin Internal:

=item _GetAutoCorrectValue()

Returns a valid state name which can be used to auto-correct
a sysconfig option with an invalid state name.

    my $Value = $StateValidateObject->_GetAutoCorrectValue();

=cut

sub _GetAutoCorrectValue {
    my ( $Self, %Param ) = @_;

    # get list of all valid states
    my %States = $Kernel::OM->Get('Kernel::System::State')->StateList(
        UserID => 1,
        Valid  => 1,
    );

    # build lookup hash for state names
    my %State2ID = reverse %States;

    # try to find the state 'open'
    if ( $State2ID{'open'} ) {
        return 'open';
    }

    # try to find the first state containing 'open'
    elsif ( my ($State) = grep { $_ =~ m{ open }xms } sort keys %State2ID ) {
        return $State;
    }

    # try to find the state 'new'
    elsif ( $State2ID{new} ) {
        return 'new';
    }

    # return the first valid state in the list
    else {
        my @SortedStates = sort keys %State2ID;
        return $SortedStates[0];
    }

    # return undef if no state could be found
    return;
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
