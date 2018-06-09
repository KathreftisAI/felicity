# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars qw($Self);

# ------------------------------------------------------------ #
# make preparations
# ------------------------------------------------------------ #

my $TestCount = 1;

# create common objects
my $StateMachineObject   = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMStateMachine');
my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

# test if statemachine object was created successfully
$Self->True(
    $StateMachineObject,
    'Test ' . $TestCount++ . ' - construction of statemachine object',
);
$Self->Is(
    ref $StateMachineObject,
    'Kernel::System::ITSMChange::ITSMStateMachine',
    'Test ' . $TestCount++ . ' - class of statemachine object',
);

# ------------------------------------------------------------ #
# test StateMachine API
# ------------------------------------------------------------ #
{

    # define public interface (in alphabetical order)
    my @ObjectMethods = qw(
        StateList
        StateLookup
        StateTransitionAdd
        StateTransitionDelete
        StateTransitionDeleteAll
        StateTransitionGet
        StateTransitionGetEndStates
        StateTransitionList
        StateTransitionUpdate
    );

    # check if subs are available
    for my $ObjectMethod (@ObjectMethods) {
        $Self->True(
            $StateMachineObject->can($ObjectMethod),
            'Test ' . $TestCount++ . " - check 'can $ObjectMethod'",
        );
    }
}

# ------------------------------------------------------------ #
# define default transitions for change states
# ------------------------------------------------------------ #

# get the change states from the general catalog
my %Name2ChangeStateID = reverse %{
    $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ChangeManagement::Change::State',
        )
};

# add zero entry for the initial state
$Name2ChangeStateID{0} = 0;

# build reverse lookup hash
my %ChangeStateID2Name = reverse %Name2ChangeStateID;

# default ChangeState Transitions
my %DefaultChangeStateTransitions = (
    0           => ['requested'],
    'requested' => [ 'rejected', 'retracted', 'pending approval', 'in progress' ],
    'pending approval' => [ 'rejected',  'retracted', 'approved' ],
    'approved'         => [ 'retracted', 'in progress' ],
    'in progress' => [ 'pending pir', 'retracted', 'failed', 'successful', 'canceled' ],
    'pending pir' => [ 'failed',      'successful' ],
    'rejected'    => [0],
    'retracted'   => [0],
    'failed'      => [0],
    'successful'  => [0],
    'canceled'    => [0],
);

# ------------------------------------------------------------ #
# define default transitions for workorder states
# ------------------------------------------------------------ #

# get the workorder states from the general catalog
my %Name2WorkOrderStateID = reverse %{
    $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ChangeManagement::WorkOrder::State',
        )
};

# add zero entry for the initial state
$Name2WorkOrderStateID{0} = 0;

# build reverse lookup hash
my %WorkOrderStateID2Name = reverse %Name2WorkOrderStateID;

# default WorkOrderState Transitions
my %DefaultWorkOrderStateTransitions = (
    0             => ['created'],
    'created'     => [ 'accepted', 'canceled' ],
    'accepted'    => [ 'ready', 'canceled' ],
    'ready'       => [ 'in progress', 'canceled' ],
    'in progress' => [ 'closed', 'canceled' ],
    'canceled'    => [0],
    'closed'      => [0],
);

# ------------------------------------------------------------ #
# state transition get end states tests
# ------------------------------------------------------------ #

{

    # get next end states for 'approved'
    my $NextEndStateIDsRef = $StateMachineObject->StateTransitionGetEndStates(
        StateID => $Name2ChangeStateID{approved},
        Class   => 'ITSM::ChangeManagement::Change::State',
    );
    my %NextEndStateLookup = map { $_ => 1 } @{$NextEndStateIDsRef};

    # 'retracted' is a next end state
    $Self->True(
        $NextEndStateLookup{ $Name2ChangeStateID{retracted} },
        'Test '
            . $TestCount++
            . ": StateTransitionGetEndStates() - Get the next end states.",
    );

    # 'in progress' is not a next end state
    $Self->False(
        $NextEndStateLookup{ $Name2ChangeStateID{'in progress'} },
        'Test '
            . $TestCount++
            . ": StateTransitionGetEndStates() - Get the next end states.",
    );

    # ---------------------------------------------------------------------------------- #

    # get next end states for 'requested'
    $NextEndStateIDsRef = $StateMachineObject->StateTransitionGetEndStates(
        StateID => $Name2ChangeStateID{requested},
        Class   => 'ITSM::ChangeManagement::Change::State',
    );
    %NextEndStateLookup = map { $_ => 1 } @{$NextEndStateIDsRef};

    # 'rejected' is a next end state
    $Self->True(
        $NextEndStateLookup{ $Name2ChangeStateID{rejected} },
        'Test '
            . $TestCount++
            . ": StateTransitionGetEndStates() - Get the next end states.",
    );

    # 'retracted' is a next end state
    $Self->True(
        $NextEndStateLookup{ $Name2ChangeStateID{retracted} },
        'Test '
            . $TestCount++
            . ": StateTransitionGetEndStates() - Get the next end states.",
    );

    # 'pending approval' is not a next end state
    $Self->False(
        $NextEndStateLookup{ $Name2ChangeStateID{'pending approval'} },
        'Test '
            . $TestCount++
            . ": StateTransitionGetEndStates() - Get the next end states.",
    );

    # 'in progress' is not a next end state
    $Self->False(
        $NextEndStateLookup{ $Name2ChangeStateID{'in progress'} },
        'Test '
            . $TestCount++
            . ": StateTransitionGetEndStates() - Get the next end states.",
    );

    # ---------------------------------------------------------------------------------- #

    # get next end states for 'retracted'
    $NextEndStateIDsRef = $StateMachineObject->StateTransitionGetEndStates(
        StateID => $Name2ChangeStateID{retracted},
        Class   => 'ITSM::ChangeManagement::Change::State',
    );

    # 'retracted' has no next end states, because it is an end state itself
    $Self->False(
        scalar @{$NextEndStateIDsRef},
        'Test '
            . $TestCount++
            . ": StateTransitionGetEndStates() - Get the next end states.",
    );
}

# ------------------------------------------------------------ #
# state transition add, update and delete tests
# ------------------------------------------------------------ #

{

    # add a second start transition ( must fail )
    my $TransitionID = $StateMachineObject->StateTransitionAdd(
        StateID     => 0,
        NextStateID => $Name2ChangeStateID{approved},
        Class       => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->False(
        $TransitionID,
        'Test ' . $TestCount++ . ": StateTransitionAdd() - Add another start state transition.",
    );

    # add a new change state transition
    $TransitionID = $StateMachineObject->StateTransitionAdd(
        StateID     => $Name2ChangeStateID{approved},
        NextStateID => $Name2ChangeStateID{approved},
        Class       => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->True(
        $TransitionID,
        'Test ' . $TestCount++ . ": StateTransitionAdd() - Add a new change state transition.",
    );

    # try to set the state to be an end state (must fail, because other following states exist)
    $TransitionID = $StateMachineObject->StateTransitionAdd(
        StateID     => $Name2ChangeStateID{approved},
        NextStateID => 0,
        Class       => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->False(
        $TransitionID,
        'Test '
            . $TestCount++
            . ": StateTransitionAdd() - Add a new change state transition must fail, because of existing following states.",
    );

    # update a state transition
    my $Success = $StateMachineObject->StateTransitionUpdate(
        StateID        => $Name2ChangeStateID{approved},
        NextStateID    => $Name2ChangeStateID{approved},
        NewNextStateID => $Name2ChangeStateID{failed},
        Class          => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->True(
        $Success,
        'Test ' . $TestCount++ . ": StateTransitionUpdate() - Update change state transition.",
    );

    # get the updated state transition
    my $NextStateIDsRef = $StateMachineObject->StateTransitionGet(
        StateID => $Name2ChangeStateID{approved},
        Class   => 'ITSM::ChangeManagement::Change::State',
    );
    my %NextStateLookup = map { $_ => 1 } @{$NextStateIDsRef};
    $Self->True(
        $NextStateLookup{ $Name2ChangeStateID{failed} },
        'Test '
            . $TestCount++
            . ": StateTransitionGet() - Get the updated change state transition.",
    );

    # update a state transition
    # (must fail, because new next state is an end state and other following states already exists)
    $Success = $StateMachineObject->StateTransitionUpdate(
        StateID        => $Name2ChangeStateID{requested},
        NextStateID    => $Name2ChangeStateID{rejected},
        NewNextStateID => 0,
        Class          => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->False(
        $Success,
        'Test '
            . $TestCount++
            . ": StateTransitionUpdate() - Update change state transition (set end state must fail).",
    );

    # update a state transition (must fail, because both states are zero)
    $Success = $StateMachineObject->StateTransitionUpdate(
        StateID        => 0,
        NextStateID    => 0,
        NewNextStateID => 0,
        Class          => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->False(
        $Success,
        'Test '
            . $TestCount++
            . ": StateTransitionUpdate() - Update change state transition (both states zero test).",
    );

    # delete the transition that was added before
    my $DeleteSuccess = $StateMachineObject->StateTransitionDelete(
        StateID     => $Name2ChangeStateID{approved},
        NextStateID => $Name2ChangeStateID{failed},
    );
    $Self->True(
        $DeleteSuccess,
        'Test ' . $TestCount++ . ": StateTransitionDelete() - Delete a change state transition.",
    );
}

# ------------------------------------------------------------ #
# check the default StateMachine transitions for change states
# ------------------------------------------------------------ #

# get default change state transitions from database
my $ChangeStateTransitions = $StateMachineObject->StateTransitionList(
    Class => 'ITSM::ChangeManagement::Change::State',
);

# check StateTransitionList for change states
$Self->Is(
    scalar keys %{$ChangeStateTransitions} || 0,
    scalar keys %DefaultChangeStateTransitions,
    'Test '
        . $TestCount++
        . ": StateTransitionList() - number of default start states for change states.",
);

for my $DefaultState ( sort keys %DefaultChangeStateTransitions ) {

    # convert the default state to a stateID
    my $DefaultStateID = $Name2ChangeStateID{$DefaultState};

    # check if all start states are the same as the default
    # and have the same number of next states
    $Self->Is(
        scalar @{ $ChangeStateTransitions->{ $Name2ChangeStateID{$DefaultState} } },
        scalar @{ $DefaultChangeStateTransitions{$DefaultState} },
        'Test '
            . $TestCount++
            . ": StateTransitionList() - number of default next states for change state '$DefaultState'.",
    );

    # get lookup hash of actual next states
    my @NextStates = sort map { $ChangeStateID2Name{$_} } @{ $ChangeStateTransitions->{$DefaultStateID} };

    my $Index = 0;
    for my $DefaultNextState ( sort @{ $DefaultChangeStateTransitions{$DefaultState} } ) {

        # check if next state is the the same as the default
        $Self->Is(
            $NextStates[ $Index++ ],
            $DefaultNextState,
            'Test '
                . $TestCount
                . ": StateTransitionList() - default next state for change state '$DefaultState'.",
        );
    }

    # test the state lookup function for the state
    my $LookedUpStateID = $StateMachineObject->StateLookup(
        State => $DefaultState,
        Class => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->Is(
        $LookedUpStateID,
        $DefaultStateID,
        "Test $TestCount: StateLookup() for change state '$DefaultState'.",
    );

    # test the state lookup function for the state id
    my $LookedUpState = $StateMachineObject->StateLookup(
        StateID => $DefaultStateID,
        Class   => 'ITSM::ChangeManagement::Change::State',
    );
    $Self->Is(
        $LookedUpState,
        $DefaultState,
        "Test $TestCount: StateLookup() for change state id '$DefaultStateID'.",
    );
}

# ------------------------------------------------------------ #
# check the default StateMachine transitions for workorder states
# ------------------------------------------------------------ #

# get default workorder state transitions from database
my $WorkOrderStateTransitions = $StateMachineObject->StateTransitionList(
    Class => 'ITSM::ChangeManagement::WorkOrder::State',
);

# check StateTransitionList for workorder states
$Self->Is(
    scalar keys %{$WorkOrderStateTransitions} || 0,
    scalar keys %DefaultWorkOrderStateTransitions,
    'Test '
        . $TestCount++
        . ": StateTransitionList() - Number of default start states for workorder states.",
);

for my $DefaultState ( sort keys %DefaultWorkOrderStateTransitions ) {

    # convert the default state to a stateID
    my $DefaultStateID = $Name2WorkOrderStateID{$DefaultState};

    # check if all start states are the same as the default
    # and have the same number of next states
    $Self->Is(
        scalar @{ $WorkOrderStateTransitions->{ $Name2WorkOrderStateID{$DefaultState} } },
        scalar @{ $DefaultWorkOrderStateTransitions{$DefaultState} },
        'Test '
            . $TestCount++
            . ": StateTransitionList() - Number of default next states for workorder state '$DefaultState'.",
    );

    # get lookup hash of actual next states
    my @NextStates = sort map { $WorkOrderStateID2Name{$_} }
        @{ $WorkOrderStateTransitions->{$DefaultStateID} };

    my $Index = 0;
    for my $DefaultNextState ( sort @{ $DefaultWorkOrderStateTransitions{$DefaultState} } ) {

        # check if next state is the the same as the default
        $Self->Is(
            $NextStates[ $Index++ ],
            $DefaultNextState,
            'Test '
                . $TestCount
                . ": StateTransitionList() - Default next state for workorder state '$DefaultState'.",
        );
    }

    # test the state lookup function for the state
    my $LookedUpStateID = $StateMachineObject->StateLookup(
        State => $DefaultState,
        Class => 'ITSM::ChangeManagement::WorkOrder::State',
    );
    $Self->Is(
        $LookedUpStateID,
        $DefaultStateID,
        "Test $TestCount: StateLookup() for workorder state '$DefaultState'.",
    );

    # test the state lookup function for the state id
    my $LookedUpState = $StateMachineObject->StateLookup(
        StateID => $DefaultStateID,
        Class   => 'ITSM::ChangeManagement::WorkOrder::State',
    );
    $Self->Is(
        $LookedUpState,
        $DefaultState,
        "Test $TestCount: StateLookup() for workorder state id '$DefaultStateID'.",
    );
}

# ------------------------------------------------------------ #
# state transition get tests
# ------------------------------------------------------------ #

# compare the results from StateTransitionList() and StateTransitionGet()
for my $StateID ( sort keys %{$ChangeStateTransitions} ) {

    # get the next state ids from StateTransitionList()
    my @NextStateIDsFromList = sort @{ $ChangeStateTransitions->{$StateID} };

    # get the next state ids from StateTransitionGet()
    my $NextStateIDsRef = $StateMachineObject->StateTransitionGet(
        StateID => $StateID,
        Class   => 'ITSM::ChangeManagement::Change::State',
    );
    my @NextStateIDsFromGet = sort @{$NextStateIDsRef};

    # check if the number of next states is the same
    $Self->Is(
        scalar @NextStateIDsFromGet,
        scalar @NextStateIDsFromList,
        'Test '
            . $TestCount++
            . ": StateTransitionGet() - Number of next states for change state '$ChangeStateID2Name{$StateID}'.",
    );

    my $Index = 0;
    for my $NextState (@NextStateIDsFromGet) {

        # check if the next states are all the same
        $Self->Is(
            $ChangeStateID2Name{$NextState},
            $ChangeStateID2Name{ $NextStateIDsFromList[ $Index++ ] },
            'Test '
                . $TestCount++
                . ": StateTransitionGet() - Next state for change state '$ChangeStateID2Name{$StateID}'.",
        );
    }
}

# ------------------------------------------------------------ #
# check StateList() for change states
# ------------------------------------------------------------ #

{
    my $StateList = $StateMachineObject->StateList(
        Class  => 'ITSM::ChangeManagement::Change::State',
        UserID => 1,
    ) || [];

    # Check the number of change states. The start state is not returned by StateList().
    $Self->Is(
        scalar( @{$StateList} ),
        scalar( keys %DefaultChangeStateTransitions ) - 1,
        'StateList() - Change - number of states',
    );

    # check whether the default states are in the StateList
    DEFAULT_STATE:
    for my $DefaultState ( sort keys %DefaultChangeStateTransitions ) {

        # skip the default state '0'
        next DEFAULT_STATE if !$DefaultState;

        my @Matches = grep { $_->{Value} eq $DefaultState } @{$StateList};
        $Self->Is(
            scalar(@Matches),
            1,
            "StateList() - Change - found $DefaultState",
        );
    }
}

# ------------------------------------------------------------ #
# check StateList() for workorder states
# ------------------------------------------------------------ #

{
    my $StateList = $StateMachineObject->StateList(
        Class  => 'ITSM::ChangeManagement::WorkOrder::State',
        UserID => 1,
    ) || [];

    # Check the number of states. The start state is not returned by StateList().
    $Self->Is(
        scalar( @{$StateList} ),
        scalar( keys %DefaultWorkOrderStateTransitions ) - 1,
        'StateList() - WorkOrder - number of states',
    );

    # check whether the default states are in the StateList
    DEFAULT_STATE:
    for my $DefaultState ( sort keys %DefaultWorkOrderStateTransitions ) {

        # skip the default state '0'
        next DEFAULT_STATE if !$DefaultState;

        my @Matches = grep { $_->{Value} eq $DefaultState } @{$StateList};
        $Self->Is(
            scalar(@Matches),
            1,
            "StateList() - WorkOrder - found $DefaultState",
        );
    }
}

1;
