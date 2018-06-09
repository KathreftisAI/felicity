# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMStateMachine;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::ITSMChange::ITSMStateMachine - statemachine lib

=head1 SYNOPSIS

All functions for statemachine in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $StateMachineObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMStateMachine');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # set the debug flag
    $Self->{Debug} = $Param{Debug} || 0;

    # get the cache type and TTL (in seconds)
    $Self->{CacheType} = 'ITSMStateMachine';
    $Self->{CacheTTL}  = $Kernel::OM->Get('Kernel::Config')->Get('ITSMChange::CacheTTL') * 60;

    return $Self;
}

=item StateTransitionAdd()

Add a new state transition. Returns the transition id on success.

    my $TransitionID = $StateMachineObject->StateTransitionAdd(
        StateID     => 1,                                       # id within the given class, or 0 to indicate the start state
        NextStateID => 2,                                       # id within the given class, or 0 to indicate an end state
        Class       => 'ITSM::ChangeManagement::Change::State', # the name of a general catalog class
    );

=cut

sub StateTransitionAdd {
    my ( $Self, %Param ) = @_;

    # check if StateID and NextStateID are given (they can be 0)
    for my $Argument (qw(StateID NextStateID)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check that class is given
    if ( !$Param{Class} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Class!',
        );
        return;
    }

    # check that not both StateID and NextStateID are zero
    if ( !$Param{StateID} && !$Param{NextStateID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "StateID and NextStateID can't both be zero!",
        );
        return;
    }

    # define lookup hash for state name
    my %StateID2State;

    # check if StateID and NextStateID belong to the given class
    ARGUMENT:
    for my $Argument (qw(StateID NextStateID)) {

        $StateID2State{ $Param{$Argument} } = $Self->StateLookup(
            StateID => $Param{$Argument},
            Class   => $Param{Class},
        );

        # dont check zero values
        next ARGUMENT if !$Param{$Argument};

        # get class
        my $DataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
            ItemID => $Param{$Argument},
        );

        # check if id belongs to given class
        if ( !$DataRef || !%{$DataRef} || $DataRef->{Class} ne $Param{Class} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Argument $Param{$Argument} is not in the class $Param{Class}!",
            );
            return;
        }
    }

    # check if a state transition with the StateID and NextStateID exists already
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id FROM change_state_machine '
            . 'WHERE state_id = ? '
            . 'AND next_state_id = ?',
        Bind  => [ \$Param{StateID}, \$Param{NextStateID} ],
        Limit => 1,
    );

    # fetch the result
    my $TransitionID;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $TransitionID = $Row[0];
    }

    # do not insert this transition twice
    return $TransitionID if $TransitionID;

    # check if StateID is a start state (=0) and another start state already exists
    if ( !$Param{StateID} ) {

        # count the number of exsting start states in the given class
        # ( the state_id 0 indicates that the next_state_id is a start state )
        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => 'SELECT count(s.id) '
                . 'FROM change_state_machine s, general_catalog g '
                . 'WHERE g.general_catalog_class = ? '
                . 'AND s.next_state_id = g.id '
                . 'AND s.state_id = 0',
            Bind  => [ \$Param{Class} ],
            Limit => 1,
        );

        # fetch the result
        my $Count;
        while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
            $Count = $Row[0];
        }

        # if there is already a start state
        if ($Count) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Can not add state '$StateID2State{$Param{NextStateID}}' "
                    . "(ID: $Param{NextStateID}) as start state. "
                    . "There is already a start state defined for class '$Param{Class}'!",
            );
            return;
        }
    }

    # prevent setting an end state transition, if other state transistions exist already
    if ( $Param{StateID} && !$Param{NextStateID} ) {

        # check if other state transistions exist for the given StateID
        my $NextStateIDs = $Self->StateTransitionGet(
            StateID => $Param{StateID},
            Class   => $Param{Class},
        );

        # check if any next states are defined for this start state
        if ( $NextStateIDs && @{$NextStateIDs} && scalar @{$NextStateIDs} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Can not set state "
                    . "'$StateID2State{$Param{StateID}}' (ID: $Param{StateID}) as end state, "
                    . "because other following states exist, which must be deleted first!",
            );
            return;
        }
    }

    # prevent the adding of other next states if an end state is already defined
    # for this start state
    elsif ( $Param{StateID} && $Param{NextStateID} ) {

        # check if other state transistions exist for the given StateID
        my $NextStateIDs = $Self->StateTransitionGet(
            StateID => $Param{StateID},
            Class   => $Param{Class},
        );

        # check if there is an end state (=0) defined for this start state
        if ( $NextStateIDs && @{$NextStateIDs} && !$NextStateIDs->[0] ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "State '$StateID2State{$Param{StateID}}' "
                    . "(ID: $Param{StateID}) is defined as an end state, "
                    . "it must be deleted first, before new following states can be added!",
            );
            return;
        }
    }

    # add state transition to database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'INSERT INTO change_state_machine '
            . '(state_id, next_state_id) '
            . 'VALUES (?, ?)',
        Bind => [
            \$Param{StateID}, \$Param{NextStateID},
        ],
    );

    # get TransitionID
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id FROM change_state_machine '
            . 'WHERE state_id = ? '
            . 'AND next_state_id = ?',
        Bind  => [ \$Param{StateID}, \$Param{NextStateID} ],
        Limit => 1,
    );

    # fetch the result
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $TransitionID = $Row[0];
    }

    # check if state transition could be added
    if ( !$TransitionID ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "StateTransitionAdd() failed!",
        );
        return;
    }

    # cleanup statemachine cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => $Self->{CacheType},
    );

    return $TransitionID;
}

=item StateTransitionDelete()

Delete a state transition. Returns true on success.

    my $Success = $StateMachineObject->StateTransitionDelete(
        StateID     => 1,  # id within the given class, or 0 to indicate the start state
        NextStateID => 2,  # id within the given class, or 0 to indicate an end state
    );

=cut

sub StateTransitionDelete {
    my ( $Self, %Param ) = @_;

    # check if StateID and NextStateID are given (they can be 0)
    for my $Argument (qw(StateID NextStateID)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # delete state transition from database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'DELETE FROM change_state_machine '
            . 'WHERE state_id = ? AND next_state_id = ?',
        Bind => [
            \$Param{StateID}, \$Param{NextStateID},
        ],
    );

    # cleanup statemachine cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => $Self->{CacheType},
    );

    return 1;
}

=item StateTransitionDeleteAll()

Delete all state transitions of a class. Returns true on success.

    my $Success = $StateMachineObject->StateTransitionDeleteAll(
        Class => 'ITSM::ChangeManagement::Change::State', # the name of a general catalog class
    );

=cut

sub StateTransitionDeleteAll {
    my ( $Self, %Param ) = @_;

    # check needed parameter
    if ( $Param{Class} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Class!',
        );
        return;
    }

    # find all state ids and next_state ids which belong to the given class
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id '
            . 'FROM general_catalog '
            . 'WHERE general_catalog_class = ?',
        Bind => [ \$Param{Class} ],
    );

    my @IDs;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @IDs, $Row[0];
    }

    # return if no state transitions exist for the given class
    return 1 if !@IDs;

    # build id string
    my $IDString = join ', ', @IDs;

    # delete state transition from database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => "DELETE FROM change_state_machine "
            . "WHERE state_id IN ( $IDString ) "
            . "OR next_state_id IN ( $IDString )",
    );

    # cleanup statemachine cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => $Self->{CacheType},
    );

    return 1;

}

=item StateTransitionGet()

Get a state transition for a given state id.
Returns an array reference of the next state ids.

    my $NextStateIDsRef = $StateMachineObject->StateTransitionGet(
        StateID => 1,                                       # id within the given class, or 0 to indicate the start state
        Class   => 'ITSM::ChangeManagement::Change::State', # the name of a general catalog class
    );

=cut

sub StateTransitionGet {
    my ( $Self, %Param ) = @_;

    # check if StateID are given (they can be 0)
    for my $Argument (qw(StateID)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check that class is given
    if ( !$Param{Class} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Class!',
        );
        return;
    }

    # check the cache
    my $CacheKey = 'StateTransitionGet::StateID::' . $Param{StateID} . '::Class::' . $Param{Class};
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # check if StateID belongs to the given class, but only if state id is not a start state (=0)
    if ( $Param{StateID} ) {

        # get class of given StateID
        my $DataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
            ItemID => $Param{StateID},
        );

        # check if StateID belongs to given class
        if ( !$DataRef || !%{$DataRef} || $DataRef->{Class} ne $Param{Class} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "StateID $Param{StateID} is not in the class '$Param{Class}'!",
            );
            return;
        }
    }

    # find all state ids and next_state ids which belong to the given class
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT DISTINCT s.next_state_id '
            . 'FROM change_state_machine s '
            . 'LEFT OUTER JOIN general_catalog g '
            . 'ON ( (s.state_id = g.id ) OR (s.next_state_id = g.id) ) '
            . 'WHERE s.state_id = ? AND g.general_catalog_class = ?',
        Bind => [ \$Param{StateID}, \$Param{Class} ],
    );

    my @NextStateIDs;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @NextStateIDs, $Row[0];
    }

    # if the start state was requested and more than one start state was found
    if ( !$Param{StateID} ) {

        if ( !@NextStateIDs ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Can not get initial state for '$Param{Class}' "
                    . "No initial state was found!",
            );
            return;
        }
        if ( scalar @NextStateIDs > 1 ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Can not get initial state for '$Param{Class}' "
                    . "More than one initial state was found!",
            );
            return;
        }
    }

    # save values in cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \@NextStateIDs,
        TTL   => $Self->{CacheTTL},
    );

    return \@NextStateIDs;
}

=item StateTransitionGetEndStates()

Get a state transition for a given state id, but only show the possible next end states.
Returns an array reference of the next end state ids.

    my $NextStateIDsRef = $StateMachineObject->StateTransitionGetEndStates(
        StateID => 1,                                       # id within the given class, or 0 to indicate the start state
        Class   => 'ITSM::ChangeManagement::Change::State', # the name of a general catalog class
    );

=cut

sub StateTransitionGetEndStates {
    my ( $Self, %Param ) = @_;

    # check if StateID are given (they can be 0)
    for my $Argument (qw(StateID)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check that class is given
    if ( !$Param{Class} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Class!',
        );
        return;
    }

    # check the cache
    my $CacheKey = 'StateTransitionGetEndStates::StateID::' . $Param{StateID} . '::Class::' . $Param{Class};
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # check if StateID belongs to the given class, but only if state id is not a start state (=0)
    if ( $Param{StateID} ) {

        # get class of given StateID
        my $DataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
            ItemID => $Param{StateID},
        );

        # check if StateID belongs to given class
        if ( !$DataRef || !%{$DataRef} || $DataRef->{Class} ne $Param{Class} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "StateID $Param{StateID} is not in the class '$Param{Class}'!",
            );
            return;
        }
    }

    # find all state ids and next_state ids which belong to the given class
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT DISTINCT s.next_state_id '
            . 'FROM change_state_machine s '
            . 'LEFT OUTER JOIN general_catalog g '
            . 'ON ( (s.state_id = g.id ) OR (s.next_state_id = g.id) ) '
            . 'WHERE s.state_id = ? AND g.general_catalog_class = ?',
        Bind => [ \$Param{StateID}, \$Param{Class} ],
    );

    my @NextStateIDs;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @NextStateIDs, $Row[0];
    }

    # if the start state was requested and more than one start state was found
    if ( !$Param{StateID} ) {

        if ( !@NextStateIDs ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Can not get initial state for '$Param{Class}' "
                    . "No initial state was found!",
            );
            return;
        }
        if ( scalar @NextStateIDs > 1 ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Can not get initial state for '$Param{Class}' "
                    . "More than one initial state was found!",
            );
            return;
        }
    }

    # build next state ids string
    my $NextStateIDsString = join ', ', @NextStateIDs;

    # find all next state ids which are end states
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT DISTINCT s.state_id '
            . 'FROM change_state_machine s '
            . "WHERE s.state_id IN ( $NextStateIDsString ) "
            . 'AND s.next_state_id = 0',
    );

    my @NextEndStateIDs;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @NextEndStateIDs, $Row[0];
    }

    # save values in cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \@NextEndStateIDs,
        TTL   => $Self->{CacheTTL},
    );

    return \@NextEndStateIDs;
}

=item StateTransitionList()

Return a state transition list hash-array reference.
The hash key is the StateID, the hash value is an array reference of NextStateIDs.

    my $StateTransitionsRef = $StateMachineObject->StateTransitionList(
        Class => 'ITSM::ChangeManagement::Change::State', # the name of a general catalog class
    );

Return example:

    $StateTransitionsRef = {
        0 => [ 1 ],
        1 => [ 2, 3, 4 ],
        2 => [ 5 ],
        3 => [ 6, 7 ],
        4 => [ 0 ],
        5 => [ 0 ],
        6 => [ 0 ],
        7 => [ 0 ],
    };

=cut

sub StateTransitionList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Class} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Class!',
        );
        return;
    }

    # check the cache
    my $CacheKey = 'StateTransitionList::Class::' . $Param{Class};
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # get state transitions
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT DISTINCT s.id , s.state_id , s.next_state_id , g.general_catalog_class '
            . 'FROM change_state_machine s '
            . 'LEFT OUTER JOIN general_catalog g '
            . 'ON ( (s.state_id = g.id ) OR (s.next_state_id = g.id) ) '
            . 'WHERE g.general_catalog_class = ?',
        Bind => [ \$Param{Class} ],
    );

    my %StateTransition;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @{ $StateTransition{ $Row[1] } }, $Row[2];
    }

    # save values in cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \%StateTransition,
        TTL   => $Self->{CacheTTL},
    );

    return \%StateTransition;
}

=item StateTransitionUpdate()

Update the next state of an existing new state transition.
Returns the transition id on success.

    my $UpdateSuccess = $StateMachineObject->StateTransitionUpdate(
        StateID        => 1,                                       # id within the given class, or 0 to indicate the start state
        NextStateID    => 2,                                       # id within the given class, or 0 to indicate an end state
        NewNextStateID => 3,                                       # id within the given class, or 0 to indicate an end state
        Class          => 'ITSM::ChangeManagement::Change::State', # the name of a general catalog class
    );

=cut

sub StateTransitionUpdate {
    my ( $Self, %Param ) = @_;

    # check if StateID, NextStateID and NewNextStateID are given (they can be 0)
    for my $Argument (qw(StateID NextStateID NewNextStateID)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check that class is given
    if ( !$Param{Class} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Class!',
        );
        return;
    }

    # check that not both StateID and NextStateID are zero
    if ( !$Param{StateID} && !$Param{NextStateID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "StateID and NextStateID can't both be zero!",
        );
        return;
    }

    # check that not both StateID and NewNextStateID are zero
    if ( !$Param{StateID} && !$Param{NewNextStateID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "StateID and NewNextStateID can't both be zero!",
        );
        return;
    }

    # define lookup hash for state name
    my %StateID2State;

    # check if StateID, NextStateID and NewNextStateID belong to the given class
    ARGUMENT:
    for my $Argument (qw(StateID NextStateID NewNextStateID)) {

        $StateID2State{ $Param{$Argument} } = $Self->StateLookup(
            StateID => $Param{$Argument},
            Class   => $Param{Class},
        );

        # dont check zero values
        next ARGUMENT if !$Param{$Argument};

        # get class
        my $DataRef = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
            ItemID => $Param{$Argument},
        );

        # check if id belongs to given class
        if ( !$DataRef || !%{$DataRef} || $DataRef->{Class} ne $Param{Class} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Argument $Param{$Argument} is not in the class '$Param{Class}'!",
            );
            return;
        }
    }

    # do not update if the new next state is the same
    return 1 if $Param{NextStateID} == $Param{NewNextStateID};

    # get the existing state transition id that should be updated
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT DISTINCT s.id '
            . 'FROM change_state_machine s '
            . 'LEFT OUTER JOIN general_catalog g '
            . 'ON ( (s.state_id = g.id ) OR (s.next_state_id = g.id) ) '
            . 'WHERE s.state_id = ? AND s.next_state_id = ? '
            . 'AND g.general_catalog_class = ?',
        Bind  => [ \$Param{StateID}, \$Param{NextStateID}, \$Param{Class} ],
        Limit => 1,
    );

    my $TransitionID;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $TransitionID = $Row[0];
    }

    # check that the state transition that should be updated exists
    if ( !$TransitionID ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can not update state transition! A state transition with "
                . "StateID $Param{StateID} and NextStateID $Param{NextStateID} does not exist!",
        );
        return;
    }

    # prevent setting an end state transition, if other state transistions exist already
    if ( !$Param{NewNextStateID} ) {

        # check if other state transistions exist for the given StateID
        my $NextStateIDs = $Self->StateTransitionGet(
            StateID => $Param{StateID},
            Class   => $Param{Class},
        );

        # The old state transition, which is verified to exist, does not count in this check
        if ( $NextStateIDs && scalar @{$NextStateIDs} > 1 ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Can not set state "
                    . "'$StateID2State{$Param{StateID}}' (ID: $Param{StateID}) as end state, "
                    . "because other following states exist, which must be deleted first!",
            );
            return;
        }
    }

    # update state transition
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE change_state_machine '
            . 'SET next_state_id = ? '
            . 'WHERE id = ?',
        Bind => [ \$Param{NewNextStateID}, \$TransitionID ],
    );

    # cleanup statemachine cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => $Self->{CacheType},
    );

    return 1;
}

=item StateLookup()

This method does a lookup for a state. If a state id is given,
it returns the name of the state. If a state name is given,
the appropriate id is returned.

    my $State = $StateMachineObject->StateLookup(
        StateID => 1234,
        Class   => 'ITSM::ChangeManagement::Change::State',
    );

    my $StateID = $StateMachineObject->StateLookup(
        State   => 'accepted',
        Class   => 'ITSM::ChangeManagement::Change::State',
    );

=cut

sub StateLookup {
    my ( $Self, %Param ) = @_;

    # check Class parameter
    if ( !$Param{Class} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Class!',
        );
        return;
    }

    # The StateID '0' is a special case. Depending on the context it
    # can indicate '*START*' or '*END*'. So return '0' in that case,
    # and do not flood the error log.
    if (
        defined $Param{StateID}
        && $Param{StateID} eq '0'
        && !defined $Param{State}
        )
    {
        return '0';
    }

    # The State '0' is a special case. Depending on the context it
    # can indicate '*START*' or '*END*'. So return '0' in that case,
    # and do not flood the error log.
    if (
        defined $Param{State}
        && $Param{State} eq '0'
        && !defined $Param{StateID}
        )
    {
        return '0';
    }

    # either StateID or State must be passed
    if ( !$Param{StateID} && !$Param{State} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need StateID or State!',
        );
        return;
    }

    # only one parameter State or StateID is allowed
    if ( $Param{StateID} && $Param{State} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need StateID OR State - not both!',
        );
        return;
    }

    # get the change states from the general catalog
    my $StateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => $Param{Class},
    );

    # convert state list into a lookup hash
    my %StateID2Name;
    if ( $StateList && ref $StateList eq 'HASH' && %{$StateList} ) {
        %StateID2Name = %{$StateList};
    }

    # check the state hash
    if ( !%StateID2Name ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Could not retrieve change states from the general catalog.',
        );
        return;
    }
    if ( $Param{StateID} ) {
        return $StateID2Name{ $Param{StateID} };
    }
    else {

        # reverse key - value pairs to have the name as keys
        my %StateName2ID = reverse %StateID2Name;

        return $StateName2ID{ $Param{State} };
    }
}

=item StateList()

This method returns a list of states for a catalog class.

    my $StateList = $StateMachineObject->StateList(
        Class  => 'ITSM::ChangeManagement::Change::State',
        UserID => 1,
    );

The return value is a reference to an array of hashrefs. The element 'Key' is then
the state id and the element 'Value' is the name of the state. The array elements
are sorted by state id.

    my $StateList = [
        {
            Key   => 156,
            Value => 'approved',
        },
        {
            Key   => 157,
            Value => 'in progress',
        },
    ];

=cut

sub StateList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Attribute (qw(Class UserID)) {
        if ( !$Param{$Attribute} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # get change state list
    my $StateList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => $Param{Class},
    ) || {};

    # to store an array of hash refs
    my @ArrayHashRef;

    # assemble the array of hash refs with all states
    for my $StateID ( sort keys %{$StateList} ) {
        push @ArrayHashRef, {
            Key   => $StateID,
            Value => $StateList->{$StateID},
        };
    }

    return \@ArrayHashRef;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
