# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminITSMStateMachine;

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

    my %Error;

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # store commonly needed parameters in %GetParam
    my %GetParam;
    for my $ParamName (qw(StateID NextStateID Class)) {
        $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    # read the config,
    my $Config = $Kernel::OM->Get('Kernel::Config')->Get("ITSMStateMachine::Object") || {};

    # prepare the config for lookup by class
    # the hash keys of $Config are not significant
    $Self->{ConfigByClass} = {};
    for my $HashRef ( values %{$Config} ) {
        $Self->{ConfigByClass}->{ $HashRef->{Class} } = $HashRef;
    }

    # translate from name to class and vice versa
    if ( $GetParam{Class} ) {
        $GetParam{ClassShortName} = $Self->{ConfigByClass}->{ $GetParam{Class} }->{Name};
    }

    # error messages are added to this variable
    my $Note = '';

    if ( $Self->{Subaction} eq 'StateTransitionUpdate' ) {

        # provide form for changing the next state
        return $Self->_StateTransitionUpdatePageGet(
            Action => 'StateTransitionUpdate',
            %GetParam,
        );
    }
    elsif ( $Self->{Subaction} eq 'StateTransitionAdd' ) {
        if ( !$GetParam{Class} ) {
            $Error{'ClassInvalid'} = 'ServerError';
        }
        else {

            # provide form for adding a state transition
            return $Self->_StateTransitionAddPageGet(
                Action => 'StateTransitionAdd',
                %GetParam,
            );
        }
    }
    elsif ( $Self->{Subaction} eq 'StateTransitionDelete' ) {

        # show confirmation page for state deletion
        return $Self->_StateTransitionDeletePageGet(
            Action => 'StateTransitionDelete',
            %GetParam,
        );
    }

    # Build drop-down for the class selection on the left side.
    my @ArrHashRef;
    for my $Class ( sort keys %{ $Self->{ConfigByClass} } ) {
        push @ArrHashRef, {
            Key   => $Class,
            Value => $Class,
        };
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    $GetParam{ClassSelectionString} = $LayoutObject->BuildSelection(
        Name         => 'Class',
        Data         => \@ArrHashRef,
        SelectedID   => $GetParam{Class},
        Class        => 'Modernize Validate_Required W100pc ' . ( $Error{ClassInvalid} || '' ),
        PossibleNone => 1,
        Translation  => 0,
    );

    # perform actions
    my $ActionIsOk = 1;

    # get state machine object
    my $StateMachineObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMStateMachine');

    # update the next state of a state transition
    if ( $Self->{Subaction} eq 'StateTransitionUpdateAction' ) {

        # params specific to StateTransitionUpdate
        for my $ParamName (qw(NewNextStateID)) {
            $GetParam{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
        }

        # Update the state transition
        $ActionIsOk = $StateMachineObject->StateTransitionUpdate(
            Class          => $GetParam{Class},
            StateID        => $GetParam{StateID},
            NextStateID    => $GetParam{NextStateID},
            NewNextStateID => $GetParam{NewNextStateID},
        );
    }
    elsif ( $Self->{Subaction} eq 'StateTransitionAddAction' ) {

        my $IsValid = 1;
        %Error = ();

        # we need to distinguish between empty string '' and the string '0'.
        # '' indicates that no value was selected, which is invalid
        # '0' indicated '*START*' or '*END*'
        if ( $GetParam{StateID} eq '' ) {
            $IsValid = 0;
            $Error{'StateInvalid'} = 'ServerError';
        }

        if ( $GetParam{NextStateID} eq '' ) {
            $IsValid = 0;
            $Error{'NextStateInvalid'} = 'ServerError';
        }

        if ( !$IsValid ) {
            return $Self->_StateTransitionAddPageGet(
                %GetParam,
                %Error,
                Action => 'StateTransitionAdd',
                Note   => $Note,
            );
        }

        # Add the state transition
        $ActionIsOk = $StateMachineObject->StateTransitionAdd(
            Class       => $GetParam{Class},
            StateID     => $GetParam{StateID},
            NextStateID => $GetParam{NextStateID},
        );
    }
    elsif ( $Self->{Subaction} eq 'StateTransitionDeleteAction' ) {

        # Delete the state transition
        $ActionIsOk = $StateMachineObject->StateTransitionDelete(
            StateID     => $GetParam{StateID},
            NextStateID => $GetParam{NextStateID},
        );
    }

    # Show list of state transitions for the class
    if ( $GetParam{Class} ) {
        $Note .= $ActionIsOk ? '' : $LayoutObject->Notify( Priority => 'Error' );

        return $Self->_OverviewStateTransitionsPageGet(
            %GetParam,
            Note => $Note,
        );
    }

    # present a list of all configured classes, as the class is not known yet
    return $Self->_OverviewClassesPageGet(
        %GetParam,
        Note => $Note,
    );
}

# provide a form for changing the next state of a transition
sub _StateTransitionUpdatePageGet {
    my ( $Self, %Param ) = @_;

    # get state machine object
    my $StateMachineObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMStateMachine');

    $Param{StateName} = $StateMachineObject->StateLookup(
        Class   => $Param{Class},
        StateID => $Param{StateID},
    ) || '*START*';

    # ArrayHashRef with all states for a catalog class
    my $AllStatesArrayHashRef = $StateMachineObject->StateList(
        Class  => $Param{Class},
        UserID => $Self->{UserID},
    );

    # Add the special final state
    push @{$AllStatesArrayHashRef},
        {
        Key   => '0',
        Value => '*END*'
        };

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    $Param{NextStateSelectionString} = $LayoutObject->BuildSelection(
        Data       => $AllStatesArrayHashRef,
        Name       => 'NewNextStateID',
        SelectedID => $Param{NextStateID},
        Class      => 'Modernize',
    );

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    $LayoutObject->Block(
        Name => 'ActionOverview',
    );

    $LayoutObject->Block(
        Name => 'StateTransitionUpdate',
        Data => \%Param,
    );

    # generate HTML
    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $Param{Note} || '';
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminITSMStateMachine',
        Data         => \%Param,
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

# provide a form for adding a new state transition
sub _StateTransitionAddPageGet {
    my ( $Self, %Param ) = @_;

    # ArrayHashRef with all states for a catalog class
    my $AllStatesArrayHashRef = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMStateMachine')->StateList(
        Class  => $Param{Class},
        UserID => $Self->{UserID},
    );

    # Add the special final state
    push @{$AllStatesArrayHashRef}, {
        Key   => '0',
        Value => '*START*',
    };

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # dropdown menu, where the state can be selected for addition
    $Param{StateSelectionString} = $LayoutObject->BuildSelection(
        Data         => $AllStatesArrayHashRef,
        Name         => 'StateID',
        SelectedID   => $Param{StateID},
        PossibleNone => 1,
        Class        => 'Modernize Validate_Required ' . ( $Param{StateInvalid} || '' ),
    );

    # dropdown menu, where the next state can be selected for addition
    $AllStatesArrayHashRef->[-1] = {
        Key   => '0',
        Value => '*END*',
    };
    $Param{NextStateSelectionString} = $LayoutObject->BuildSelection(
        Data         => $AllStatesArrayHashRef,
        Name         => 'NextStateID',
        SelectedID   => $Param{NextStateID},
        PossibleNone => 1,
        Class        => 'Modernize Validate_Required ' . ( $Param{NextStateInvalid} || '' ),
    );

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    $LayoutObject->Block( Name => 'ActionOverview' );

    $LayoutObject->Block(
        Name => 'StateTransitionAdd',
        Data => \%Param,
    );

    # generate HTML
    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $Param{Note} || '';
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminITSMStateMachine',
        Data         => \%Param,
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

# provide a form for confirming the deletion of a state transition
sub _StateTransitionDeletePageGet {
    my ( $Self, %Param ) = @_;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    $LayoutObject->Block(
        Name => 'ActionOverview',
    );

    # get state machine object
    my $StateMachineObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMStateMachine');

    $Param{StateName} = $StateMachineObject->StateLookup(
        Class   => $Param{Class},
        StateID => $Param{StateID},
    ) || '*START*';

    $Param{NextStateName} = $StateMachineObject->StateLookup(
        Class   => $Param{Class},
        StateID => $Param{NextStateID},
    ) || '*END*';

    $LayoutObject->Block(
        Name => 'StateTransitionDelete',
        Data => \%Param,
    );

    # generate HTML
    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $Param{Note} || '';
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminITSMStateMachine',
        Data         => \%Param,
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

# Show a table of all state transitions
sub _OverviewStateTransitionsPageGet {
    my ( $Self, %Param ) = @_;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    $LayoutObject->Block(
        Name => 'ActionOverview',
    );

    $LayoutObject->Block(
        Name => 'OverviewStateTransitions',
        Data => \%Param,
    );

    # get state machine object
    my $StateMachineObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMStateMachine');

    # lookup for state names
    my %NextStateIDs = %{ $StateMachineObject->StateTransitionList( Class => $Param{Class} ) || {} };

    # loop over all 'State' and 'NextState' pairs for the catalog class
    for my $StateID ( sort keys %NextStateIDs ) {

        for my $NextStateID ( @{ $NextStateIDs{$StateID} } ) {

            # state names
            my $StateName = $StateMachineObject->StateLookup(
                Class   => $Param{Class},
                StateID => $StateID,
            ) || '*START*';
            my $NextStateName = $StateMachineObject->StateLookup(
                Class   => $Param{Class},
                StateID => $NextStateID,
            ) || '*END*';

            $LayoutObject->Block(
                Name => 'StateTransitionRow',
                Data => {
                    %Param,
                    StateID       => $StateID,
                    StateName     => $StateName,
                    NextStateID   => $NextStateID,
                    NextStateName => $NextStateName,
                },
            );

            # only show the delete link if it is not the start state
            if ( $StateName ne '*START*' ) {
                $LayoutObject->Block(
                    Name => 'StateTransitionDeleteButton',
                    Data => {
                        %Param,
                        StateID       => $StateID,
                        StateName     => $StateName,
                        NextStateID   => $NextStateID,
                        NextStateName => $NextStateName,
                    },
                );
            }
        }
    }

    # generate HTML
    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $Param{Note} || '';
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminITSMStateMachine',
        Data         => \%Param,
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

# Show a list of relevant object types
sub _OverviewClassesPageGet {
    my ( $Self, %Param ) = @_;

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    $LayoutObject->Block(
        Name => 'Overview',
        Data => \%Param,
    );

    $LayoutObject->Block(
        Name => 'ActionAddState',
        Data => \%Param,
    );

    $LayoutObject->Block(
        Name => 'OverviewClasses',
        Data => \%Param,
    );

    # read the config,
    my $Config = $Kernel::OM->Get('Kernel::Config')->Get("ITSMStateMachine::Object") || {};

    # prepare the config for lookup by class
    # the hash keys of $Config are not significant
    $Self->{ConfigByClass} = {};
    for my $HashRef ( values %{$Config} ) {
        $Self->{ConfigByClass}->{ $HashRef->{Class} } = $HashRef;
    }

    for my $Class ( sort keys %{ $Self->{ConfigByClass} } ) {
        $LayoutObject->Block(
            Name => 'OverviewClassesRow',
            Data => {
                ClassShortName => $Self->{ConfigByClass}->{$Class}->{Name},
                Class          => $Class,
            },
        );
    }

    # generate HTML
    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $Param{Note} || '';
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminITSMStateMachine',
        Data         => \%Param,
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

1;
