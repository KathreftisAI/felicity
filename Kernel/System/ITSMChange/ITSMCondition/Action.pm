# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMCondition::Action;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::System::ITSMChange::ITSMCondition::Action - condition action lib

=head1 SYNOPSIS

All functions for condition actions in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=item ActionAdd()

Add a new condition action.

    my $ActionID = $ConditionObject->ActionAdd(
        ConditionID  => 123,
        ActionNumber => 5,
        ObjectID     => 234,
        AttributeID  => 345,
        OperatorID   => 456,
        Selector     => 1234,
        ActionValue  => 'rejected',
        UserID       => 1,
    );

=cut

sub ActionAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ConditionID ObjectID AttributeID OperatorID Selector UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # handle 'ActionValue' in a special way
    if ( !exists $Param{ActionValue} || !defined $Param{ActionValue} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ActionValue!',
        );
        return;
    }

    # get condition for event handler
    my $Condition = $Self->ConditionGet(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # check condition
    return if !$Condition;

    # trigger ActionAddPre-Event
    $Self->EventHandler(
        Event => 'ActionAddPre',
        Data  => {
            %Param,
            ChangeID => $Condition->{ChangeID},
        },
        UserID => $Param{UserID},
    );

    # get default action number if not given
    my $ActionNumber = delete $Param{ActionNumber};
    if ( !$ActionNumber ) {
        $ActionNumber = $Self->_CreateNewActionNumber(%Param);
    }

    # add new action name to database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'INSERT INTO condition_action '
            . '(condition_id, action_number, object_id, '
            . 'attribute_id, operator_id, selector, '
            . ' action_value) '
            . 'VALUES (?, ?, ?, ?, ?, ?, ?)',
        Bind => [
            \$Param{ConditionID}, \$ActionNumber, \$Param{ObjectID},
            \$Param{AttributeID}, \$Param{OperatorID}, \$Param{Selector},
            \$Param{ActionValue},
        ],
    );

    # prepare SQL statement
    my $ActionID;

    # this is important for oracle for which an empty string and NULL is the same!
    if ( $Self->{DBType} eq 'oracle' && $Param{ActionValue} eq '' ) {

        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => 'SELECT id FROM condition_action '
                . 'WHERE condition_id = ? AND action_number = ? AND object_id = ? '
                . 'AND attribute_id = ? AND operator_id = ? AND selector = ? '
                . 'AND action_value IS NULL',
            Bind => [
                \$Param{ConditionID}, \$ActionNumber, \$Param{ObjectID},
                \$Param{AttributeID}, \$Param{OperatorID}, \$Param{Selector},
            ],
            Limit => 1,
        );
    }

    # for all other databases AND for oracle IF the action value is NOT an empty string
    else {
        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => 'SELECT id FROM condition_action '
                . 'WHERE condition_id = ? AND action_number = ? AND object_id = ? '
                . 'AND attribute_id = ? AND operator_id = ? AND selector = ? '
                . 'AND action_value = ?',
            Bind => [
                \$Param{ConditionID}, \$ActionNumber, \$Param{ObjectID},
                \$Param{AttributeID}, \$Param{OperatorID}, \$Param{Selector},
                \$Param{ActionValue},
            ],
            Limit => 1,
        );
    }

    # get id of created action
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ActionID = $Row[0];
    }

    # check if action could be added
    if ( !$ActionID ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ActionAdd() failed!",
        );
        return;
    }

    # delete cache
    $Kernel::OM->Get('Kernel::System::Cache')->Delete(
        Type => $Self->{CacheType},
        Key  => 'ActionList::ConditionID::' . $Param{ConditionID},
    );

    # trigger ActionAddPost-Event
    $Self->EventHandler(
        Event => 'ActionAddPost',
        Data  => {
            %Param,
            ChangeID => $Condition->{ChangeID},
            ActionID => $ActionID,
        },
        UserID => $Param{UserID},
    );

    return $ActionID;
}

=item ActionUpdate()

Update a condition action.

    my $Success = $ConditionObject->ActionUpdate(
        ActionID     => 1234,
        ActionNumber => 1,          # (optional)
        ObjectID     => 234,        # (optional)
        AttributeID  => 345,        # (optional)
        OperatorID   => 456,        # (optional)
        Selector     => 1234',      # (optional)
        ActionValue  => 'rejected', # (optional)
        UserID       => 1,
    );

=cut

sub ActionUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ActionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get action
    my $Action = $Self->ActionGet(
        ActionID => $Param{ActionID},
        UserID   => $Param{UserID},
    );

    # check action
    return if !$Action;

    # get condition for event handler
    my $Condition = $Self->ConditionGet(
        ConditionID => $Action->{ConditionID},
        UserID      => $Param{UserID},
    );

    # check condition
    return if !$Condition;

    # trigger ActionUpdatePre-Event
    $Self->EventHandler(
        Event => 'ActionUpdatePre',
        Data  => {
            %Param,
            ChangeID => $Condition->{ChangeID},
        },
        UserID => $Param{UserID},
    );

    # map update attributes to column names
    my %Attribute = (
        ActionNumber => 'action_number',
        ObjectID     => 'object_id',
        AttributeID  => 'attribute_id',
        OperatorID   => 'operator_id',
        Selector     => 'selector',
        ActionValue  => 'action_value',
    );

    # build SQL to update action
    my $SQL = 'UPDATE condition_action SET ';
    my @Bind;

    ATTRIBUTE:
    for my $Attribute ( sort keys %Attribute ) {

        # preserve the old value, when the column isn't in function parameters
        next ATTRIBUTE if !exists $Param{$Attribute};
        next ATTRIBUTE if !defined $Param{$Attribute};

        # param checking has already been done, so this is safe
        $SQL .= "$Attribute{$Attribute} = ?, ";
        push @Bind, \$Param{$Attribute};
    }

    # set condition ID to allow trailing comma of previous loop
    $SQL .= ' condition_id = condition_id ';

    # set matching of SQL statement
    $SQL .= 'WHERE id = ?';
    push @Bind, \$Param{ActionID};

    # update action
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => $SQL,
        Bind => \@Bind,
    );

    # delete cache
    for my $Key (
        'ActionList::ConditionID::' . $Action->{ConditionID},
        'ActionGet::' . $Param{ActionID},
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    # trigger ActionUpdatePost-Event
    $Self->EventHandler(
        Event => 'ActionUpdatePost',
        Data  => {
            %Param,
            ChangeID      => $Condition->{ChangeID},
            OldActionData => $Action,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ActionGet()

Get a condition action for a given action id.
Returns a hash reference of the action data.

    my $ConditionActionRef = $ConditionObject->ActionGet(
        ActionID => 1234,
        UserID   => 1,
    );

The returned hash reference contains following elements:

    $ConditionAction{ActionID}
    $ConditionAction{ConditionID}
    $ConditionAction{ActionNumber}
    $ConditionAction{ObjectID}
    $ConditionAction{AttributeID}
    $ConditionAction{OperatorID}
    $ConditionAction{Selector}
    $ConditionAction{ActionValue}

=cut

sub ActionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ActionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check cache
    my $CacheKey = 'ActionGet::' . $Param{ActionID};
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # prepare SQL statement
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id, condition_id, action_number, object_id, '
            . 'attribute_id, operator_id, selector, action_value '
            . 'FROM condition_action WHERE id = ?',
        Bind  => [ \$Param{ActionID} ],
        Limit => 1,
    );

    # fetch the result
    my %ActionData;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ActionData{ActionID}     = $Row[0];
        $ActionData{ConditionID}  = $Row[1];
        $ActionData{ActionNumber} = $Row[2];
        $ActionData{ObjectID}     = $Row[3];
        $ActionData{AttributeID}  = $Row[4];
        $ActionData{OperatorID}   = $Row[5];
        $ActionData{Selector}     = $Row[6];

        # this is important for oracle for which an empty string and NULL is the same!
        $ActionData{ActionValue} = $Row[7] // '';
    }

    # check error
    if ( !%ActionData ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ActionID $Param{ActionID} does not exist!",
        );
        return;
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \%ActionData,
        TTL   => $Self->{CacheTTL},
    );

    return \%ActionData;
}

=item ActionList()

Returns a sorted list of all condition action
ids for a given ConditionID as array reference.

    my $ConditionActionIDsRef = $ConditionObject->ActionList(
        ConditionID => 1234,
        UserID      => 1,
    );

=cut

sub ActionList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ConditionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check cache
    my $CacheKey = 'ActionList::ConditionID::' . $Param{ConditionID};
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # prepare SQL statement
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id FROM condition_action '
            . 'WHERE condition_id = ? '
            . 'ORDER BY action_number ASC',
        Bind => [ \$Param{ConditionID} ],
    );

    # fetch the result
    my @ActionList;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @ActionList, $Row[0];
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \@ActionList,
        TTL   => $Self->{CacheTTL},
    );

    return \@ActionList;
}

=item ActionDelete()

Deletes a condition action.

    my $Success = $ConditionObject->ActionDelete(
        ActionID => 123,
        UserID   => 1,
    );

=cut

sub ActionDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ActionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get action
    my $Action = $Self->ActionGet(
        ActionID => $Param{ActionID},
        UserID   => $Param{UserID},
    );

    # check action
    return if !$Action;

    # get condition for event handler
    my $Condition = $Self->ConditionGet(
        ConditionID => $Action->{ConditionID},
        UserID      => $Param{UserID},
    );

    # check condition
    return if !$Condition;

    # trigger ActionDeletePre-Event
    $Self->EventHandler(
        Event => 'ActionDeletePre',
        Data  => {
            %Param,
            ChangeID => $Condition->{ChangeID},
        },
        UserID => $Param{UserID},
    );

    # delete condition action from database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'DELETE FROM condition_action '
            . 'WHERE id = ?',
        Bind => [ \$Param{ActionID} ],
    );

    # delete cache
    for my $Key (
        'ActionList::ConditionID::' . $Action->{ConditionID},
        'ActionGet::' . $Param{ActionID},
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    # trigger ActionDeletePost-Event
    $Self->EventHandler(
        Event => 'ActionDeletePost',
        Data  => {
            %Param,
            ChangeID => $Condition->{ChangeID},
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ActionDeleteAll()

Deletes all condition actions for a given condition id.

    my $Success = $ConditionObject->ActionDeleteAll(
        ConditionID => 123,
        UserID      => 1,
    );

=cut

sub ActionDeleteAll {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ConditionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get condition for event handler
    my $Condition = $Self->ConditionGet(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # check condition
    return if !$Condition;

    # get all actions for the given condition id
    my $ActionIDsRef = $Self->ActionList(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # trigger ActionDeleteAllPre-Event
    $Self->EventHandler(
        Event => 'ActionDeleteAllPre',
        Data  => {
            %Param,
            ChangeID    => $Condition->{ChangeID},
            ConditionID => $Param{ConditionID},
        },
        UserID => $Param{UserID},
    );

    # delete condition actions from database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'DELETE FROM condition_action '
            . 'WHERE condition_id = ?',
        Bind => [ \$Param{ConditionID} ],
    );

    # delete cache
    $Kernel::OM->Get('Kernel::System::Cache')->Delete(
        Type => $Self->{CacheType},
        Key  => 'ActionList::ConditionID::' . $Param{ConditionID},
    );

    # delete cache
    if ( $ActionIDsRef && @{$ActionIDsRef} ) {
        for my $ActionID ( @{$ActionIDsRef} ) {
            $Kernel::OM->Get('Kernel::System::Cache')->Delete(
                Type => $Self->{CacheType},
                Key  => 'ActionGet::' . $ActionID,
            );
        }
    }

    # trigger ActionDeleteAllPost-Event
    $Self->EventHandler(
        Event => 'ActionDeleteAllPost',
        Data  => {
            %Param,
            ChangeID    => $Condition->{ChangeID},
            ConditionID => $Param{ConditionID},
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ActionExecute()

Returns the success value of the execution of an action.

    my $Success = $ConditionObject->ActionExecute(
        ActionID => 123,
        UserID   => 1,
    );

=cut

sub ActionExecute {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ActionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get action content
    my $Action = $Self->ActionGet(
        ActionID => $Param{ActionID},
        UserID   => $Param{UserID},
    );

    # check action content
    return if !$Action;

    # get condition for event handler
    my $Condition = $Self->ConditionGet(
        ConditionID => $Action->{ConditionID},
        UserID      => $Param{UserID},
    );

    # check condition
    return if !$Condition;

    # get action attributes
    my $ActionData = $Self->_ActionExecuteInit(
        Action => $Action,
        UserID => $Param{UserID},
    );

    # check action attributes
    return if !$ActionData;

    # do not execute 'lock' actions, they are passive!
    my @OmitActions = qw( lock );
    return 0 if grep { $ActionData->{Operator}->{Name} eq $_ } @OmitActions;

    # trigger ActionExecutePre-Event
    $Self->EventHandler(
        Event => 'ActionExecutePre',
        Data  => {
            %Param,
            %{$Condition},
            ConditionName => $Condition->{Name},
            ChangeID      => $Condition->{ChangeID},
        },
        UserID => $Param{UserID},
    );

    # get object name
    my $ObjectName = $ActionData->{Object}->{Name};

    # get object data
    my $ActionObjectData = $Self->ObjectDataGet(
        ConditionID => $Action->{ConditionID},
        ObjectName  => $ObjectName,
        Selector    => $Action->{Selector},
        UserID      => $Param{UserID},
    );

    # check for action object data
    # no need to execute operator if it is an empty array ref
    if (
        !$ActionObjectData
        || ref $ActionObjectData ne 'ARRAY'
        || ref $ActionObjectData eq 'ARRAY' && !@{$ActionObjectData}
        )
    {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No object data for $ObjectName ($Action->{Selector}) found!",
        );
        return;
    }

    # get attribute type
    my $AttributeType = $ActionData->{Attribute}->{Name};

    # check attribute type
    if ( !$AttributeType ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No attribute $ObjectName ($Action->{Selector}) found!",
        );
        return;
    }

    # check for object attribute
    for my $ActionObject ( @{$ActionObjectData} ) {
        if ( !exists $ActionObject->{$AttributeType} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "No object attribute for $ObjectName ($AttributeType) found!",
            );
            return;
        }
    }

    # define operator values
    my %OperatorExecute = (
        OperatorName => $ActionData->{Operator}->{Name},
        ObjectData   => $ActionObjectData,
        ObjectName   => $ObjectName,
        Selector     => $Action->{Selector},
        Attribute    => $AttributeType,
        ActionValue  => $Action->{ActionValue},
        ActionID     => $Action->{ActionID},
    );

    # return result of the actions execution
    my $Result = $Self->OperatorExecute(
        %OperatorExecute,
        UserID => $Param{UserID},
    );

    # get nice action result
    my $ActionResult = ($Result) ? 'successfully' : 'unsuccessfully';

    # trigger ActionExecutePost-Event
    $Self->EventHandler(
        Event => 'ActionExecutePost',
        Data  => {
            %Param,
            %{$Condition},
            ConditionName => $Condition->{Name},
            %OperatorExecute,
            ChangeID     => $Condition->{ChangeID},
            ActionResult => $ActionResult,
        },
        UserID => $Param{UserID},
    );

    # return result of the actions execution
    return $Result;
}

=item _ActionExecuteInit()

Returns object, attribute and operator of a given action.

    my $ActionData = $ConditionObject->_ActionExecuteInit(
        Action => $ActionRef,
        UserID => 1,
    );

=cut

sub _ActionExecuteInit {
    my ( $Self, %Param ) = @_;

    # extract action
    my $Action = $Param{Action};

    # declare action data
    my %ActionData;

    # get object data
    $ActionData{Object} = $Self->ObjectGet(
        ObjectID => $Action->{ObjectID},
        UserID   => $Param{UserID},
    );

    # check for object data
    if ( !$ActionData{Object} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No value for 'Object' with ID '$Action->{ObjectID}'!",
        );
        return;
    }

    # get attribute data
    $ActionData{Attribute} = $Self->AttributeGet(
        AttributeID => $Action->{AttributeID},
        UserID      => $Param{UserID},
    );

    # check for attribute data
    if ( !$ActionData{Attribute} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No value for 'Attribute' with ID '$Action->{AttributeID}'!",
        );
        return;
    }

    # get operator data
    $ActionData{Operator} = $Self->OperatorGet(
        OperatorID => $Action->{OperatorID},
        UserID     => $Param{UserID},
    );

    # check for operator data
    if ( !$ActionData{Operator} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No value for 'Operator' with ID '$Action->{OperatorID}'!",
        );
        return;
    }

    return \%ActionData;
}

=item _CreateNewActionNumber()

Create a new unused action number for the given condition.
The highest current action number for the given condition is
looked up and incremented by one.

    my $ActionNumber = $ConditionObject->_CreateNewActionNumber(
        ConditionID => 123,
    );

=cut

sub _CreateNewActionNumber {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ConditionID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ConditionID!',
        );
        return;
    }

    # get the largest action number
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT MAX(action_number) '
            . 'FROM condition_action '
            . 'WHERE condition_id = ?',
        Bind  => [ \$Param{ConditionID} ],
        Limit => 1,
    );

    # fetch the result, default to 0 when there are no actions yet
    my $ActionNumber;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ActionNumber = $Row[0];
    }
    $ActionNumber ||= 0;

    # increment number to get a non-existent action number
    $ActionNumber++;

    return $ActionNumber;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
