# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ProcessManagement::Transition;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
    'Kernel::System::Main',
);

=head1 NAME

Kernel::System::ProcessManagement::Transition - Transition lib

=head1 SYNOPSIS

All Process Management Transition functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $TransitionObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::Transition');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get the debug parameters
    $Self->{TransitionDebug} = $ConfigObject->Get('ProcessManagement::Transition::Debug::Enabled') || 0;
    $Self->{TransitionDebugLogPriority}
        = $ConfigObject->Get('ProcessManagement::Transition::Debug::LogPriority') || 'debug';

    my $TransitionDebugConfigFilters = $ConfigObject->Get('ProcessManagement::Transition::Debug::Filter') || {};

    for my $FilterName ( sort keys %{$TransitionDebugConfigFilters} ) {

        my %Filter = %{ $TransitionDebugConfigFilters->{$FilterName} };

        for my $FilterItem ( sort keys %Filter ) {
            $Self->{TransitionDebugFilters}->{$FilterItem} = $Filter{$FilterItem};
        }
    }

    return $Self;
}

=item TransitionGet()

    Get Transition info

    my $Transition = $TransitionObject->TransitionGet(
        TransitionEntityID => 'T1',
    );

    Returns:

    $Transition = {
        Name       => 'Transition 1',
        CreateTime => '08-02-2012 13:37:00',
        ChangeBy   => '2',
        ChangeTime => '09-02-2012 13:37:00',
        CreateBy   => '3',
        Condition  => {
            Type   => 'and',
            Cond1  => {
                Type   => 'and',
                Fields => {
                    DynamicField_Make    => [ '2' ],
                    DynamicField_VWModel => {
                        Type  => 'String',
                        Match => 'Golf',
                    },
                    DynamicField_A => {
                        Type  => 'Hash',
                        Match => {
                            Value  => 1,
                        },
                    },
                    DynamicField_B => {
                        Type  => 'Regexp',
                        Match => qr{ [\n\r\f] }xms
                    },
                    DynamicField_C => {
                        Type  => 'Module',
                        Match =>
                            'Kernel::System::ProcessManagement::TransitionValidation::MyModule',
                    },
                    Queue =>  {
                        Type  => 'Array',
                        Match => [ 'Raw' ],
                    },
                    # ...
                }
            }
            # ...
        },
    };

=cut

sub TransitionGet {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(TransitionEntityID)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    my $Transition = $Kernel::OM->Get('Kernel::Config')->Get('Process::Transition');

    if ( !IsHashRefWithData($Transition) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Transition config!',
        );
        return;
    }

    if ( !IsHashRefWithData( $Transition->{ $Param{TransitionEntityID} } ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No data for Transition '$Param{TransitionEntityID}' found!",
        );
        return;
    }

    return $Transition->{ $Param{TransitionEntityID} };
}

=item TransitionCheck()

    Checks if one or more Transition Conditions are true

    my $TransitionCheck = $TransitionObject->TransitionCheck(
        TransitionEntityID => 'T1',
        or
        TransitionEntityID => ['T1', 'T2', 'T3'],
        Data       => {
            Queue         => 'Raw',
            DynamicField1 => 'Value',
            Subject       => 'Testsubject',
            ...
        },
    );

    If called on a single TransitionEntityID
    Returns:
    $Checked = 1; # 0

    If called on an array of TransitionEntityIDs
    Returns:
    $Checked = 'T1' # 0 if no Transition was true

=cut

sub TransitionCheck {
    my ( $Self, %Param ) = @_;

    # Check if we have TransitionEntityID and Data
    for my $Needed (qw(TransitionEntityID Data)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # Check if TransitionEntityID is not empty (either Array or String with length)
    if ( !length $Param{TransitionEntityID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need TransitionEntityID or TransitionEntityID array!",
        );
        return;
    }

    # check if debug filters apply (ticket)
    if ( $Self->{TransitionDebug} ) {

        DEBUGFILTER:
        for my $DebugFilter ( sort keys %{ $Self->{TransitionDebugFilters} } ) {
            next DEBUGFILTER if $DebugFilter eq 'TransitionEntityID';
            next DEBUGFILTER if !$Self->{TransitionDebugFilters}->{$DebugFilter};
            next DEBUGFILTER if ref $Param{Data} ne 'HASH';

            if ( $DebugFilter =~ m{<OTRS_TICKET_([^>]+)>}msx ) {
                my $TicketParam = $1;

                if (
                    defined $Param{Data}->{$TicketParam}
                    && $Param{Data}->{$TicketParam}
                    )
                {
                    if ( ref $Param{Data}->{$TicketParam} eq 'ARRAY' ) {
                        for my $Item ( @{ $Param{Data}->{$TicketParam} } ) {

                            # if matches for one item go to next filter (debug keeps active)
                            if ( $Self->{TransitionDebugFilters}->{$DebugFilter} eq $Item ) {
                                next DEBUGFILTER
                            }
                        }

                        # if no matches then deactivate debug
                        $Self->{TransitionDebug} = 0;
                        last DEBUGFILTER;
                    }

                    elsif (
                        $Self->{TransitionDebugFilters}->{$DebugFilter} ne
                        $Param{Data}->{$TicketParam}
                        )
                    {
                        $Self->{TransitionDebug} = 0;
                        last DEBUGFILTER;
                    }

                    elsif ( !defined $Param{Data}->{$TicketParam} ) {
                        $Self->{TransitionDebug} = 0;
                        last DEBUGFILTER;
                    }
                }
            }
        }
    }

    # If we got just a string, make $Param{TransitionEntityID} an Array
    # with the string on position 0 to facilitate handling
    if ( !IsArrayRefWithData( $Param{TransitionEntityID} ) ) {
        $Param{TransitionEntityID} = [ $Param{TransitionEntityID} ];
    }

    # Check if we have Data to check against transitions conditions
    if ( !IsHashRefWithData( $Param{Data} ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Data has no values!",
        );
        return;
    }

    # Get all transitions
    my $Transitions = $Kernel::OM->Get('Kernel::Config')->Get('Process::Transition');

    # Check if there are Transitions
    if ( !IsHashRefWithData($Transitions) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need transition config!',
        );
        return;
    }

    $Self->{TransitionDebugOrig} = $Self->{TransitionDebug};

    # Loop through all submitted TransitionEntityID's
    TRANSITIONLOOP:
    for my $TransitionEntityID ( @{ $Param{TransitionEntityID} } ) {

        $Self->{TransitionDebug} = $Self->{TransitionDebugOrig};

        # check if debug filters apply (Transition) (only if TransitionDebug is active)
        if (
            $Self->{TransitionDebug}
            && defined $Self->{TransitionDebugFilters}->{'TransitionEntityID'}
            && $Self->{TransitionDebugFilters}->{'TransitionEntityID'} ne $TransitionEntityID
            )
        {
            $Self->{TransitionDebug} = 0;
        }

        # Check if the submitted TransitionEntityID has a config
        if ( !IsHashRefWithData( $Transitions->{$TransitionEntityID} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "No config data for transition $TransitionEntityID found!",
            );
            return;
        }

        # Check if we have TransitionConditions
        if ( !IsHashRefWithData( $Transitions->{$TransitionEntityID}->{Condition} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "No conditions for transition $TransitionEntityID found!",
            );
            return;
        }

        my $ConditionLinking = $Transitions->{$TransitionEntityID}->{ConditionLinking} || '';

        # If we don't have a ConditionLinking
        # set it to 'and' by default
        # compatibility with OTRS 3.3.x
        if ( !$ConditionLinking ) {
            $ConditionLinking = $Transitions->{$TransitionEntityID}->{Condition}->{Type} || 'and';
        }
        if (
            !$Transitions->{$TransitionEntityID}->{Condition}->{ConditionLinking}
            && !$Transitions->{$TransitionEntityID}->{Condition}->{Type}
            )
        {

            $Self->DebugLog(
                MessageType => 'Custom',
                Message =>
                    "Transition:'$Transitions->{$TransitionEntityID}->{Name}' No Condition Linking"
                    . " as Condition->Type or Condition->ConditionLinking was found, using 'and' as"
                    . " default!",
            );
        }

        # If there is something else than 'and', 'or', 'xor'
        # log defect Transition Config
        if (
            $ConditionLinking ne 'and'
            && $ConditionLinking ne 'or'
            && $ConditionLinking ne 'xor'
            )
        {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid Condition->Type in $TransitionEntityID!",
            );
            return;
        }
        my ( $ConditionSuccess, $ConditionFail ) = ( 0, 0 );

        CONDITIONLOOP:
        for my $Cond (
            sort { $a cmp $b }
            keys %{ $Transitions->{$TransitionEntityID}->{Condition} }
            )
        {

            next CONDITIONLOOP if $Cond eq 'Type' || $Cond eq 'ConditionLinking';

            # get the condition
            my $ActualCondition = $Transitions->{$TransitionEntityID}->{Condition}->{$Cond};

            # Check if we have Fields in our Cond
            if ( !IsHashRefWithData( $ActualCondition->{Fields} ) )
            {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "No Fields in Transition $TransitionEntityID->Condition->$Cond"
                        . " found!",
                );
                return;
            }

            # If we don't have a Condition->$Cond->Type, set it to 'and' by default
            my $CondType = $ActualCondition->{Type} || 'and';
            if ( !$ActualCondition->{Type} ) {
                $Self->DebugLog(
                    MessageType => 'Custom',
                    Message =>
                        "Transition:'$Transitions->{$TransitionEntityID}->{Name}' Condition:'$Cond'"
                        . " No Condition Type found, using 'and' as default",
                );
            }

            # If there is something else than 'and', 'or', 'xor'
            # log defect Transition Config
            if ( $CondType ne 'and' && $CondType ne 'or' && $CondType ne 'xor' ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Invalid Condition->$Cond->Type in $TransitionEntityID!",
                );
                return;
            }

            my ( $FieldSuccess, $FieldFail ) = ( 0, 0 );

            FIELDLOOP:
            for my $Field ( sort keys %{ $ActualCondition->{Fields} } ) {

                # If we have just a String transform it into string check condition
                if ( ref $ActualCondition->{Fields}->{$Field} eq '' ) {
                    $ActualCondition->{Fields}->{$Field} = {
                        Type  => 'String',
                        Match => $ActualCondition->{Fields}->{$Field},
                    };
                }

                # If we have an Arrayref in "Fields" we deal with just values
                # -> transform it into a { Type => 'Array', Match => [1,2,3,4] } structure
                # to unify testing later on
                if ( ref $ActualCondition->{Fields}->{$Field} eq 'ARRAY' ) {
                    $ActualCondition->{Fields}->{$Field} = {
                        Type  => 'Array',
                        Match => $ActualCondition->{Fields}->{$Field},
                    };
                }

                # If we don't have a Condition->$Cond->Fields->Field->Type
                # set it to 'String' by default
                my $FieldType = $ActualCondition->{Fields}->{$Field}->{Type} || 'String';
                if ( !$ActualCondition->{Fields}->{$Field}->{Type} ) {
                    $Self->DebugLog(
                        MessageType => 'Custom',
                        Message =>
                            "Transition:'$Transitions->{$TransitionEntityID}->{Name}'"
                            . " Condition:'$Cond' Field:'$Field'"
                            . " No Field Type found, using 'String' as default",
                    );
                }

                # If there is something else than 'String', 'Regexp', 'Hash', 'Array', 'Module'
                # log defect Transition Config
                if (
                    $FieldType ne 'String'
                    && $FieldType ne 'Hash'
                    && $FieldType ne 'Array'
                    && $FieldType ne 'Regexp'
                    && $FieldType ne 'Module'
                    )
                {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message  => "Invalid Condition->Type in $TransitionEntityID!",
                    );
                    return;
                }

                if ( $ActualCondition->{Fields}->{$Field}->{Type} eq 'String' ) {

                    # if our Check contains anything else than a string we can't check
                    # Special Condition: if Match contains '0' we can check
                    #
                    if (
                        (
                            !$ActualCondition->{Fields}->{$Field}->{Match}
                            && $ActualCondition->{Fields}->{$Field}->{Match} ne '0'
                        )
                        || ref $ActualCondition->{Fields}->{$Field}->{Match}
                        )
                    {
                        $Kernel::OM->Get('Kernel::System::Log')->Log(
                            Priority => 'error',
                            Message =>
                                "$TransitionEntityID->Condition->$Cond->Fields->$Field Match must"
                                . " be a String if Type is set to String!",
                        );
                        return;
                    }

                    my $Match;
                    my $MatchValue;

                    # make sure there is data to compare
                    if (
                        defined $Param{Data}->{$Field}
                        && defined $ActualCondition->{Fields}->{$Field}->{Match}
                        )
                    {

                        # check if field data is a string and compare directly
                        if (
                            ref $Param{Data}->{$Field} eq ''
                            && $ActualCondition->{Fields}->{$Field}->{Match} eq $Param{Data}->{$Field}
                            )
                        {
                            $Match      = 1;
                            $MatchValue = $Param{Data}->{$Field};
                        }

                        # otherwise check if field data is and array and compare each element until
                        # one match
                        elsif ( ref $Param{Data}->{$Field} eq 'ARRAY' ) {

                            ITEM:
                            for my $Item ( @{ $Param{Data}->{$Field} } ) {
                                if ( $ActualCondition->{Fields}->{$Field}->{Match} eq $Item ) {
                                    $Match      = 1;
                                    $MatchValue = "Item: [$Item]";
                                    last ITEM;
                                }
                            }
                        }
                    }
                    if ($Match) {
                        $FieldSuccess++;

                        $Self->DebugLog(
                            MessageType    => 'Match',
                            TransitionName => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName  => $Cond,
                            FieldName      => $Field,
                            MatchType      => 'String',
                            MatchValue     => $MatchValue,
                            MatchCondition => $ActualCondition->{Fields}->{$Field}->{Match}
                        );

                        # Successful check if we just need one matching Condition
                        # to make this Transition valid
                        if ( $ConditionLinking eq 'or' && $CondType eq 'or' ) {

                            $Self->DebugLog(
                                MessageType      => 'Success',
                                TransitionName   => $Transitions->{$TransitionEntityID}->{Name},
                                ConditionName    => $Cond,
                                ConditionType    => $CondType,
                                ConditionLinking => $ConditionLinking,
                            );

                            return $TransitionEntityID;
                        }

                        next CONDITIONLOOP if $ConditionLinking ne 'or' && $CondType eq 'or';
                    }
                    else {
                        $FieldFail++;

                        my $UnmatchedValue = $Param{Data}->{$Field};
                        if ( ref $Param{Data}->{$Field} eq 'ARRAY' ) {
                            $UnmatchedValue = 'Any of [' . join( ', ', @{ $Param{Data}->{$Field} } ) . ']';
                        }

                        $Self->DebugLog(
                            MessageType    => 'NoMatch',
                            TransitionName => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName  => $Cond,
                            FieldName      => $Field,
                            MatchType      => 'String',
                            MatchValue     => $UnmatchedValue,
                            MatchCondition => $ActualCondition->{Fields}->{$Field}->{Match}
                        );

                        # Failed check if we have all 'and' conditions
                        next TRANSITIONLOOP if $ConditionLinking eq 'and' && $CondType eq 'and';

                        # Try next Cond if all Cond Fields have to be true
                        next CONDITIONLOOP if $CondType eq 'and';
                    }
                    next FIELDLOOP;
                }
                elsif ( $ActualCondition->{Fields}->{$Field}->{Type} eq 'Array' ) {

                    # 1. go through each Condition->$Cond->Fields->$Field->Value (map)
                    # 2. assign the value to $CheckValue
                    # 3. grep through $Data->{$Field}
                    #   to find the "toCheck" value inside the Data->{$Field} Array
                    # 4. Assign all found Values to @CheckResults
                    my $CheckValue;
                    my @CheckResults = map {
                        $CheckValue = $_;
                        grep { $CheckValue eq $_ } @{ $Param{Data}->{$Field} }
                        }
                        @{ $ActualCondition->{Fields}->{$Field}->{Match} };

                    # if the found amount is the same as the "toCheck" amount we succeeded
                    if (
                        scalar @CheckResults
                        == scalar @{ $ActualCondition->{Fields}->{$Field}->{Match} }
                        )
                    {
                        $FieldSuccess++;

                        $Self->DebugLog(
                            MessageType    => 'Match',
                            TransitionName => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName  => $Cond,
                            FieldName      => $Field,
                            MatchType      => 'Array',
                        );

                        # Successful check if we just need one matching Condition
                        # to make this Transition valid
                        if ( $ConditionLinking eq 'or' && $CondType eq 'or' ) {

                            $Self->DebugLog(
                                MessageType      => 'Success',
                                TransitionName   => $Transitions->{$TransitionEntityID}->{Name},
                                ConditionName    => $Cond,
                                ConditionType    => $CondType,
                                ConditionLinking => $ConditionLinking,

                            );

                            return $TransitionEntityID;
                        }

                        next CONDITIONLOOP if $ConditionLinking ne 'or' && $CondType eq 'or';
                    }
                    else {
                        $FieldFail++;

                        $Self->DebugLog(
                            MessageType    => 'NoMatch',
                            TransitionName => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName  => $Cond,
                            FieldName      => $Field,
                            MatchType      => 'Array',
                        );

                        # Failed check if we have all 'and' conditions
                        next TRANSITIONLOOP if $ConditionLinking eq 'and' && $CondType eq 'and';

                        # Try next Cond if all Cond Fields have to be true
                        next CONDITIONLOOP if $CondType eq 'and';
                    }
                    next FIELDLOOP;
                }
                elsif ( $ActualCondition->{Fields}->{$Field}->{Type} eq 'Hash' ) {

                    # if our Check doesn't contain a hash
                    if ( ref $ActualCondition->{Fields}->{$Field}->{Match} ne 'HASH' ) {
                        $Kernel::OM->Get('Kernel::System::Log')->Log(
                            Priority => 'error',
                            Message =>
                                "$TransitionEntityID->Condition->$Cond->Fields->$Field Match must"
                                . " be a Hash!",
                        );
                        return;
                    }

                    # If we have no data or Data isn't a hash, test failed
                    if (
                        !$Param{Data}->{$Field}
                        || ref $Param{Data}->{$Field} ne 'HASH'
                        )
                    {
                        $FieldFail++;
                        next FIELDLOOP;
                    }

                    # Find all Data Hash values that equal to the Condition Match Values
                    my @CheckResults = grep {
                        $Param{Data}->{$Field}->{$_} eq
                            $ActualCondition->{Fields}->{$Field}->{Match}->{$_}
                    } keys %{ $ActualCondition->{Fields}->{$Field}->{Match} };

                    # If the amount of Results equals the amount of Keys in our hash
                    # this part matched
                    if (
                        scalar @CheckResults
                        == scalar keys %{ $ActualCondition->{Fields}->{$Field}->{Match} }
                        )
                    {

                        $FieldSuccess++;

                        $Self->DebugLog(
                            MessageType    => 'Match',
                            TransitionName => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName  => $Cond,
                            FieldName      => $Field,
                            MatchType      => 'Hash',
                        );

                        # Successful check if we just need one matching Condition
                        # to make this Transition valid
                        if ( $ConditionLinking eq 'or' && $CondType eq 'or' ) {

                            $Self->DebugLog(
                                MessageType      => 'Success',
                                TransitionName   => $Transitions->{$TransitionEntityID}->{Name},
                                ConditionName    => $Cond,
                                ConditionType    => $CondType,
                                ConditionLinking => $ConditionLinking,
                            );

                            return $TransitionEntityID;
                        }

                        next CONDITIONLOOP if $ConditionLinking ne 'or' && $CondType eq 'or';

                    }
                    else {
                        $FieldFail++;

                        $Self->DebugLog(
                            MessageType    => 'NoMatch',
                            TransitionName => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName  => $Cond,
                            FieldName      => $Field,
                            MatchType      => 'Hash',
                        );

                        # Failed check if we have all 'and' conditions
                        next TRANSITIONLOOP if $ConditionLinking eq 'and' && $CondType eq 'and';

                        # Try next Cond if all Cond Fields have to be true
                        next CONDITIONLOOP if $CondType eq 'and';
                    }
                    next FIELDLOOP;
                }
                elsif ( $ActualCondition->{Fields}->{$Field}->{Type} eq 'Regexp' )
                {

                    # if our Check contains anything else then a string we can't check
                    if (
                        !$ActualCondition->{Fields}->{$Field}->{Match}
                        ||
                        (
                            ref $ActualCondition->{Fields}->{$Field}->{Match} ne 'Regexp'
                            && ref $ActualCondition->{Fields}->{$Field}->{Match} ne ''
                        )
                        )
                    {
                        $Kernel::OM->Get('Kernel::System::Log')->Log(
                            Priority => 'error',
                            Message =>
                                "$TransitionEntityID->Condition->$Cond->Fields->$Field Match must"
                                . " be a Regular expression if Type is set to Regexp!",
                        );
                        return;
                    }

                    # pre-compile Regexp if is a string
                    if ( ref $ActualCondition->{Fields}->{$Field}->{Match} eq '' ) {
                        my $Match = $ActualCondition->{Fields}->{$Field}->{Match};

                        eval {
                            $ActualCondition->{Fields}->{$Field}->{Match} = qr{$Match};
                        };
                        if ($@) {
                            $Kernel::OM->Get('Kernel::System::Log')->Log(
                                Priority => 'error',
                                Message  => $@,
                            );
                            return;
                        }
                    }

                    my $Match;
                    my $MatchValue;

                    # make sure there is data to compare
                    if ( $Param{Data}->{$Field} ) {

                        # check if field data is a string and compare directly
                        if (
                            ref $Param{Data}->{$Field} eq ''
                            && $Param{Data}->{$Field} =~ $ActualCondition->{Fields}->{$Field}->{Match}
                            )
                        {
                            $Match      = 1;
                            $MatchValue = $Param{Data}->{$Field};
                        }

                        # otherwise check if field data is and array and compare each element until
                        # one match
                        elsif ( ref $Param{Data}->{$Field} eq 'ARRAY' ) {

                            ITEM:
                            for my $Item ( @{ $Param{Data}->{$Field} } ) {
                                if ( $Item =~ $ActualCondition->{Fields}->{$Field}->{Match} ) {
                                    $Match      = 1;
                                    $MatchValue = "Item: [$Item]";
                                    last ITEM;
                                }
                            }
                        }
                    }

                    if ($Match) {
                        $FieldSuccess++;

                        $Self->DebugLog(
                            MessageType    => 'Match',
                            TransitionName => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName  => $Cond,
                            FieldName      => $Field,
                            MatchType      => 'Regexp',
                            MatchValue     => $MatchValue,
                            MatchCondition => $ActualCondition->{Fields}->{$Field}->{Match}
                        );

                        # Successful check if we just need one matching Condition
                        # to make this Transition valid
                        if ( $ConditionLinking eq 'or' && $CondType eq 'or' ) {

                            $Self->DebugLog(
                                MessageType      => 'Success',
                                TransitionName   => $Transitions->{$TransitionEntityID}->{Name},
                                ConditionName    => $Cond,
                                ConditionType    => $CondType,
                                ConditionLinking => $ConditionLinking,
                            );

                            return $TransitionEntityID;
                        }

                        next CONDITIONLOOP if $ConditionLinking ne 'or' && $CondType eq 'or';
                    }
                    else {
                        $FieldFail++;

                        my $UnmatchedValue = $Param{Data}->{$Field};
                        if ( ref $Param{Data}->{$Field} eq 'ARRAY' ) {
                            $UnmatchedValue = 'Any of [' . join( ', ', @{ $Param{Data}->{$Field} } ) . ']';
                        }

                        $Self->DebugLog(
                            MessageType    => 'NoMatch',
                            TransitionName => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName  => $Cond,
                            FieldName      => $Field,
                            MatchType      => 'Regexp',
                            MatchValue     => $UnmatchedValue,
                            MatchCondition => $ActualCondition->{Fields}->{$Field}->{Match}
                        );

                        # Failed check if we have all 'and' conditions
                        next TRANSITIONLOOP if $ConditionLinking eq 'and' && $CondType eq 'and';

                        # Try next Cond if all Cond Fields have to be true
                        next CONDITIONLOOP if $CondType eq 'and';
                    }
                    next FIELDLOOP;
                }
                elsif ( $ActualCondition->{Fields}->{$Field}->{Type} eq 'Module' ) {

                    # Load Validation Modules
                    # Default location for validation modules:
                    # Kernel/System/ProcessManagement/TransitionValidation/
                    if (
                        !$Kernel::OM->Get('Kernel::System::Main')
                        ->Require( $ActualCondition->{Fields}->{$Field}->{Match} )
                        )
                    {
                        $Kernel::OM->Get('Kernel::System::Log')->Log(
                            Priority => 'error',
                            Message  => "Can't load "
                                . $ActualCondition->{Fields}->{$Field}->{Type}
                                . "Module for Transition->$TransitionEntityID->Condition->$Cond->"
                                . "Fields->$Field validation!",
                        );
                        return;
                    }

                    # create new ValidateModuleObject
                    my $ValidateModuleObject = $ActualCondition->{Fields}->{$Field}->{Match}->new();

                    # handle "Data" Param to ValidateModule's "Validate" subroutine
                    if ( $ValidateModuleObject->Validate( Data => $Param{Data} ) ) {
                        $FieldSuccess++;

                        $Self->DebugLog(
                            MessageType    => 'Match',
                            TransitionName => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName  => $Cond,
                            FieldName      => $Field,
                            MatchType      => 'Module',
                            Module         => $ActualCondition->{Fields}->{$Field}->{Type}
                        );

                        # Successful check if we just need one matching Condition
                        # to make this Transition valid
                        if ( $ConditionLinking eq 'or' && $CondType eq 'or' ) {

                            $Self->DebugLog(
                                MessageType      => 'Success',
                                TransitionName   => $Transitions->{$TransitionEntityID}->{Name},
                                ConditionName    => $Cond,
                                ConditionType    => $CondType,
                                ConditionLinking => $ConditionLinking,
                            );

                            return $TransitionEntityID;
                        }

                        next CONDITIONLOOP if $ConditionLinking ne 'or' && $CondType eq 'or';
                    }
                    else {
                        $FieldFail++;

                        $Self->DebugLog(
                            MessageType    => 'NoMatch',
                            TransitionName => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName  => $Cond,
                            FieldName      => $Field,
                            MatchType      => 'Module',
                            Module         => $ActualCondition->{Fields}->{$Field}->{Type}
                        );

                        # Failed check if we have all 'and' conditions
                        next TRANSITIONLOOP if $ConditionLinking eq 'and' && $CondType eq 'and';

                        # Try next Cond if all Cond Fields have to be true
                        next CONDITIONLOOP if $CondType eq 'and';
                    }
                    next FIELDLOOP;
                }
            }

            # FIELDLOOP END
            if ( $CondType eq 'and' ) {

                # if we had no failing check this condition matched
                if ( !$FieldFail ) {

                    # Successful check if we just need one matching Condition
                    # to make this Transition valid
                    if ( $ConditionLinking eq 'or' ) {

                        $Self->DebugLog(
                            MessageType      => 'Success',
                            TransitionName   => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName    => $Cond,
                            ConditionType    => $CondType,
                            ConditionLinking => $ConditionLinking,
                        );

                        return $TransitionEntityID;
                    }
                    $ConditionSuccess++;
                }
                else {
                    $ConditionFail++;

                    # Failed check if we have all 'and' conditions
                    next TRANSITIONLOOP if $ConditionLinking eq 'and';
                }
            }
            elsif ( $CondType eq 'or' )
            {

                # if we had at least one successful check, this condition matched
                if ( $FieldSuccess > 0 ) {

                    # Successful check if we just need one matching Condition
                    # to make this Transition valid
                    if ( $ConditionLinking eq 'or' ) {

                        $Self->DebugLog(
                            MessageType      => 'Success',
                            TransitionName   => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName    => $Cond,
                            ConditionType    => $CondType,
                            ConditionLinking => $ConditionLinking,
                        );

                        return $TransitionEntityID;
                    }
                    $ConditionSuccess++;
                }
                else {
                    $ConditionFail++;

                    # Failed check if we have all 'and' conditions
                    next TRANSITIONLOOP if $ConditionLinking eq 'and';
                }
            }
            elsif ( $CondType eq 'xor' )
            {

                # if we had exactly one successful check, this condition matched
                if ( $FieldSuccess == 1 ) {

                    # Successful check if we just need one matching Condition
                    # to make this Transition valid
                    if ( $ConditionLinking eq 'or' ) {

                        $Self->DebugLog(
                            MessageType      => 'Success',
                            TransitionName   => $Transitions->{$TransitionEntityID}->{Name},
                            ConditionName    => $Cond,
                            ConditionType    => $CondType,
                            ConditionLinking => $ConditionLinking,
                        );

                        return $TransitionEntityID;
                    }
                    $ConditionSuccess++;
                }
                else {
                    $ConditionFail++;
                }
            }
        }

        # CONDITIONLOOP END
        if ( $ConditionLinking eq 'and' ) {

            # if we had no failing conditions this transition matched
            if ( !$ConditionFail ) {

                $Self->DebugLog(
                    MessageType      => 'Success',
                    TransitionName   => $Transitions->{$TransitionEntityID}->{Name},
                    ConditionLinking => $ConditionLinking,
                );

                return $TransitionEntityID;
            }
        }
        elsif ( $ConditionLinking eq 'or' )
        {

            # if we had at least one successful condition, this transition matched
            if ( $ConditionSuccess > 0 ) {

                $Self->DebugLog(
                    MessageType      => 'Success',
                    TransitionName   => $Transitions->{$TransitionEntityID}->{Name},
                    ConditionLinking => $ConditionLinking,
                );

                return $TransitionEntityID;
            }
        }
        elsif ( $ConditionLinking eq 'xor' )
        {

            # if we had exactly one successful condition, this transition matched
            if ( $ConditionSuccess == 1 ) {

                $Self->DebugLog(
                    MessageType      => 'Success',
                    TransitionName   => $Transitions->{$TransitionEntityID}->{Name},
                    ConditionLinking => $ConditionLinking,
                );

                return $TransitionEntityID;
            }
        }
    }

    # TRANSITIONLOOP END
    # If no transition matched till here, we failed
    return;

}

sub DebugLog {
    my ( $Self, %Param ) = @_;

    return 1 if !$Self->{TransitionDebug};

    my $Message = "Transition:'$Param{TransitionName}'";

    if ( $Param{MessageType} eq 'Match' || $Param{MessageType} eq 'NoMatch' ) {

        my $MatchedString = $Param{MessageType} eq 'Match' ? 'Matched' : 'Not matched';

        $Message = " Condition:'$Param{ConditionName}' $MatchedString Field:'$Param{FieldName}'";

        if ( $Param{MatchType} eq 'Module' ) {
            $Message .= " with Transition Validation Module: '$Param{Module}'";
        }
        else {
            $Message .= " as $Param{MatchType}";
        }

        if ( $Param{MatchValue} && $Param{MatchCondition} ) {
            $Message .= " ($Param{MatchValue} matches $Param{MatchCondition})";
        }
    }
    elsif ( $Param{MessageType} eq 'Success' ) {

        if ( $Param{ConditionName} && $Param{ConditionType} ) {
            $Message = " Condition:'$Param{ConditionName}' Success on Condition Linking:'$Param{ConditionLinking}'"
                . "  and Condition Type:'$Param{ConditionType}'";
        }
        else {
            $Message = " Success on Condition Linking:'$Param{ConditionLinking}'";
        }
    }

    # for MessageType 'Custom' or any other, use the given message
    else {
        return if !$Param{Message};
        $Message = $Param{Message};
    }

    $Kernel::OM->Get('Kernel::System::Log')->Log(
        Priority => $Self->{TransitionDebugLogPriority},
        Message  => $Message,
    );

    return 1;
}
1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
