# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMCondition::Expression;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::System::ITSMChange::ITSMCondition::Expression - condition expression lib

=head1 SYNOPSIS

All functions for condition expressions in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=item ExpressionAdd()

Add a new condition expression.

    my $ExpressionID = $ConditionObject->ExpressionAdd(
        ConditionID  => 123,
        ObjectID     => 234,
        AttributeID  => 345,
        OperatorID   => 456,
        Selector     => 1234,
        CompareValue => 'rejected',
        UserID       => 1,
    );

=cut

sub ExpressionAdd {
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

    # handle 'CompareValue' in a special way
    if ( !exists $Param{CompareValue} || !defined $Param{CompareValue} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need CompareValue!',
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

    # trigger ExpressionAddPre-Event
    $Self->EventHandler(
        Event => 'ExpressionAddPre',
        Data  => {
            %Param,
            ChangeID => $Condition->{ChangeID},
        },
        UserID => $Param{UserID},
    );

    # add new expression name to database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'INSERT INTO condition_expression '
            . '(condition_id, object_id, attribute_id, '
            . 'operator_id, selector, compare_value) '
            . 'VALUES (?, ?, ?, ?, ?, ?)',
        Bind => [
            \$Param{ConditionID}, \$Param{ObjectID}, \$Param{AttributeID},
            \$Param{OperatorID},  \$Param{Selector}, \$Param{CompareValue},
        ],
    );

    # prepare SQL statement
    my $ExpressionID;

    # this is important for oracle for which an empty string and NULL is the same!
    if ( $Self->{DBType} eq 'oracle' && $Param{CompareValue} eq '' ) {

        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => 'SELECT id FROM condition_expression '
                . 'WHERE condition_id = ? AND object_id = ? AND attribute_id = ? '
                . 'AND operator_id = ? AND selector = ? AND compare_value IS NULL',
            Bind => [
                \$Param{ConditionID}, \$Param{ObjectID}, \$Param{AttributeID},
                \$Param{OperatorID}, \$Param{Selector},
            ],
            Limit => 1,
        );
    }

    # for all other databases AND for oracle IF the compare value is NOT an empty string
    else {
        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => 'SELECT id FROM condition_expression '
                . 'WHERE condition_id = ? AND object_id = ? AND attribute_id = ? '
                . 'AND operator_id = ? AND selector = ? AND compare_value = ?',
            Bind => [
                \$Param{ConditionID}, \$Param{ObjectID}, \$Param{AttributeID},
                \$Param{OperatorID},  \$Param{Selector}, \$Param{CompareValue},
            ],
            Limit => 1,
        );
    }

    # get id of created expression
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ExpressionID = $Row[0];
    }

    # check if expression could be added
    if ( !$ExpressionID ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ExpressionAdd() failed!",
        );
        return;
    }

    # delete cache
    $Kernel::OM->Get('Kernel::System::Cache')->Delete(
        Type => $Self->{CacheType},
        Key  => 'ExpressionList::ConditionID::' . $Param{ConditionID},
    );

    # trigger ExpressionAddPost-Event
    $Self->EventHandler(
        Event => 'ExpressionAddPost',
        Data  => {
            %Param,
            ChangeID     => $Condition->{ChangeID},
            ExpressionID => $ExpressionID,
        },
        UserID => $Param{UserID},
    );

    return $ExpressionID;
}

=item ExpressionUpdate()

Update a condition expression.

    my $Success = $ConditionObject->ExpressionUpdate(
        ExpressionID => 1234,
        ObjectID     => 234,        # (optional)
        AttributeID  => 345,        # (optional)
        OperatorID   => 456,        # (optional)
        Selector     => 1234,       # (optional)
        CompareValue => 'rejected', # (optional)
        UserID       => 1,
    );

=cut

sub ExpressionUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ExpressionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get expression
    my $Expression = $Self->ExpressionGet(
        ExpressionID => $Param{ExpressionID},
        UserID       => $Param{UserID},
    );

    # check expression
    return if !$Expression;

    # get condition for event handler
    my $Condition = $Self->ConditionGet(
        ConditionID => $Expression->{ConditionID},
        UserID      => $Param{UserID},
    );

    # check condition
    return if !$Condition;

    # trigger ExpressionUpdatePre-Event
    $Self->EventHandler(
        Event => 'ExpressionUpdatePre',
        Data  => {
            %Param,
            ChangeID => $Condition->{ChangeID},
        },
        UserID => $Param{UserID},
    );

    # map update attributes to column names
    my %Attribute = (
        ObjectID     => 'object_id',
        AttributeID  => 'attribute_id',
        OperatorID   => 'operator_id',
        Selector     => 'selector',
        CompareValue => 'compare_value',
    );

    # build SQL to update expression
    my $SQL = 'UPDATE condition_expression SET ';
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
    push @Bind, \$Param{ExpressionID};

    # update expression
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => $SQL,
        Bind => \@Bind,
    );

    # delete cache
    for my $Key (
        'ExpressionList::ConditionID::' . $Expression->{ConditionID},
        'ExpressionGet::' . $Param{ExpressionID},
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    # trigger ExpressionUpdatePost-Event
    $Self->EventHandler(
        Event => 'ExpressionUpdatePost',
        Data  => {
            %Param,
            ChangeID          => $Condition->{ChangeID},
            OldExpressionData => $Expression,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ExpressionGet()

Get a condition expression for a given expression id.
Returns a hash reference of the expression data.

    my $ConditionExpressionRef = $ConditionObject->ExpressionGet(
        ExpressionID => 1234,
        UserID       => 1,
    );

The returned hash reference contains following elements:

    $ConditionExpression{ExpressionID}
    $ConditionExpression{ConditionID}
    $ConditionExpression{ObjectID}
    $ConditionExpression{AttributeID}
    $ConditionExpression{OperatorID}
    $ConditionExpression{Selector}
    $ConditionExpression{CompareValue}

=cut

sub ExpressionGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ExpressionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check cache
    my $CacheKey = 'ExpressionGet::' . $Param{ExpressionID};
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # prepare SQL statement
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id, condition_id, object_id, attribute_id, '
            . 'operator_id, selector, compare_value '
            . 'FROM condition_expression WHERE id = ?',
        Bind  => [ \$Param{ExpressionID} ],
        Limit => 1,
    );

    # fetch the result
    my %ExpressionData;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ExpressionData{ExpressionID} = $Row[0];
        $ExpressionData{ConditionID}  = $Row[1];
        $ExpressionData{ObjectID}     = $Row[2];
        $ExpressionData{AttributeID}  = $Row[3];
        $ExpressionData{OperatorID}   = $Row[4];
        $ExpressionData{Selector}     = $Row[5];

        # this is important for oracle for which an empty string and NULL is the same!
        $ExpressionData{CompareValue} = $Row[6] // '';
    }

    # check error
    if ( !%ExpressionData ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ExpressionID $Param{ExpressionID} does not exist!",
        );
        return;
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \%ExpressionData,
        TTL   => $Self->{CacheTTL},
    );

    return \%ExpressionData;
}

=item ExpressionList()

Returns a list of all condition expression ids for
a given ConditionID as array reference.

    my $ConditionExpressionIDsRef = $ConditionObject->ExpressionList(
        ConditionID => 1234,
        UserID      => 1,
    );

=cut

sub ExpressionList {
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
    my $CacheKey = 'ExpressionList::ConditionID::' . $Param{ConditionID};
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # prepare SQL statement
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id FROM condition_expression '
            . 'WHERE condition_id = ?',
        Bind => [ \$Param{ConditionID} ],
    );

    # fetch the result
    my @ExpressionList;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @ExpressionList, $Row[0];
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \@ExpressionList,
        TTL   => $Self->{CacheTTL},
    );

    return \@ExpressionList;
}

=item ExpressionDelete()

Deletes a condition expression.

    my $Success = $ConditionObject->ExpressionDelete(
        ExpressionID => 123,
        UserID       => 1,
    );

=cut

sub ExpressionDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ExpressionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get expression
    my $Expression = $Self->ExpressionGet(
        ExpressionID => $Param{ExpressionID},
        UserID       => $Param{UserID},
    );

    # check expression
    return if !$Expression;

    # get condition for event handler
    my $Condition = $Self->ConditionGet(
        ConditionID => $Expression->{ConditionID},
        UserID      => $Param{UserID},
    );

    # check condition
    return if !$Condition;

    # trigger ExpressionDeletePre-Event
    $Self->EventHandler(
        Event => 'ExpressionDeletePre',
        Data  => {
            %Param,
            ChangeID => $Condition->{ChangeID},
        },
        UserID => $Param{UserID},
    );

    # delete condition expression from database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'DELETE FROM condition_expression '
            . 'WHERE id = ?',
        Bind => [ \$Param{ExpressionID} ],
    );

    # delete cache
    for my $Key (
        'ExpressionList::ConditionID::' . $Expression->{ConditionID},
        'ExpressionGet::' . $Param{ExpressionID},
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    # trigger ExpressionDeletePost-Event
    $Self->EventHandler(
        Event => 'ExpressionDeletePost',
        Data  => {
            %Param,
            ChangeID => $Condition->{ChangeID},
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ExpressionDeleteAll()

Deletes all condition expressions for a given condition id.

    my $Success = $ConditionObject->ExpressionDeleteAll(
        ConditionID => 123,
        UserID      => 1,
    );

=cut

sub ExpressionDeleteAll {
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

    # get all expressions for the given condition id
    my $ExpressionIDsRef = $Self->ExpressionList(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # trigger ExpressionDeleteAllPre-Event
    $Self->EventHandler(
        Event => 'ExpressionDeleteAllPre',
        Data  => {
            %Param,
            ChangeID    => $Condition->{ChangeID},
            ConditionID => $Param{ConditionID},
        },
        UserID => $Param{UserID},
    );

    # delete condition expressions from database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'DELETE FROM condition_expression '
            . 'WHERE condition_id = ?',
        Bind => [ \$Param{ConditionID} ],
    );

    # delete cache
    $Kernel::OM->Get('Kernel::System::Cache')->Delete(
        Type => $Self->{CacheType},
        Key  => 'ExpressionList::ConditionID::' . $Param{ConditionID},
    );

    # delete cache
    if ( $ExpressionIDsRef && @{$ExpressionIDsRef} ) {
        for my $ExpressionID ( @{$ExpressionIDsRef} ) {
            $Kernel::OM->Get('Kernel::System::Cache')->Delete(
                Type => $Self->{CacheType},
                Key  => 'ExpressionGet::' . $ExpressionID,
            );
        }
    }

    # trigger ExpressionDeleteAllPost-Event
    $Self->EventHandler(
        Event => 'ExpressionDeleteAllPost',
        Data  => {
            %Param,
            ChangeID    => $Condition->{ChangeID},
            ConditionID => $Param{ConditionID},
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ExpressionMatch()

Returns the boolean value of an expression.

    my $Match = $ConditionObject->ExpressionMatch(
        ExpressionID      => 123,
        AttributesChanged => { ITSMChange => [ ChangeTitle, ChangeDescription ] },  # (optional)
        UserID            => 1,
    );

=cut

sub ExpressionMatch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ExpressionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get expression content
    my $Expression = $Self->ExpressionGet(
        ExpressionID => $Param{ExpressionID},
        UserID       => $Param{UserID},
    );

    # check expression content
    return if !$Expression;

    # get expression attributes
    my $ExpressionData = $Self->_ExpressionMatchInit(
        Expression => $Expression,
        UserID     => $Param{UserID},
    );

    # check expression attributes
    return if !$ExpressionData;

    # get changed attributes
    my $AttributesChangedType;
    my @AttributesChanged;
    if ( exists $Param{AttributesChanged} && defined $Param{AttributesChanged} ) {

        # changed attributes
        my %AttributeChanged;

        # check for reference type
        if ( ref $Param{AttributesChanged} eq 'HASH' ) {
            %AttributeChanged = %{ $Param{AttributesChanged} };

            # get attribute type
            $AttributesChangedType = ( keys %AttributeChanged )[0];
        }

        # check for reference type
        if ( $AttributesChangedType && ref $AttributeChanged{$AttributesChangedType} eq 'ARRAY' ) {

            # get list of changed attributes
            @AttributesChanged = @{ $AttributeChanged{$AttributesChangedType} };
        }
    }

    # get object name
    my $ObjectName = $ExpressionData->{Object}->{Name};

    # check for changed attributes types
    if ( $AttributesChangedType && $AttributesChangedType ne $ObjectName ) {

        # this expression does not match requested type
        return;
    }

    # get attribute type
    my $AttributeType = $ExpressionData->{Attribute}->{Name};

    # check for changed attributes and available attributes of expression
    if ( $AttributeType && @AttributesChanged ) {

        # check for our attribute in changed attribute list
        my @AttributeFound = grep { $_ eq $AttributeType } @AttributesChanged;

        # this expression does not have the requested attribute
        return if !@AttributeFound;
    }

    # get object data
    my $ExpressionObjectData = $Self->ObjectDataGet(
        ConditionID => $Expression->{ConditionID},
        ObjectName  => $ObjectName,
        Selector    => $Expression->{Selector},
        UserID      => $Param{UserID},
    );

    # check for expression object data
    # no need to execute operator if it is an empty array ref
    if (
        !$ExpressionObjectData
        || ref $ExpressionObjectData ne 'ARRAY'
        || ref $ExpressionObjectData eq 'ARRAY' && !@{$ExpressionObjectData}
        )
    {
        return;
    }

    # check attribute type
    if ( !$AttributeType ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No attribute $ObjectName ($Expression->{Selector}) found!",
        );
        return;
    }

    # check for object attribute
    for my $ExpressionObject ( @{$ExpressionObjectData} ) {
        if ( !exists $ExpressionObject->{$AttributeType} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "No object attribute for $ObjectName ($AttributeType) found!",
            );
            return;
        }
    }

    # return result of the expressions execution
    my $Result = $Self->OperatorExecute(
        OperatorName => $ExpressionData->{Operator}->{Name},
        Attribute    => $AttributeType,
        Selector     => $Expression->{Selector},
        ObjectData   => $ExpressionObjectData,
        CompareValue => $Expression->{CompareValue},
        UserID       => $Param{UserID},
    );

    # return result of the expressions execution
    return $Result;
}

=item _ExpressionMatchInit()

Returns object, attribute and operator of a given expression.

    my $ExpressionData = $ConditionObject->_ExpressionMatchInit(
        Expression => $ExpressionRef,
        UserID     => 1,
    );

=cut

sub _ExpressionMatchInit {
    my ( $Self, %Param ) = @_;

    # extract expression
    my $Expression = $Param{Expression};

    # declare expression data
    my %ExpressionData;

    # get object data
    $ExpressionData{Object} = $Self->ObjectGet(
        ObjectID => $Expression->{ObjectID},
        UserID   => $Param{UserID},
    );

    # check for object data
    if ( !$ExpressionData{Object} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No value for 'Object' with ID '$Expression->{ObjectID}'!",
        );
        return;
    }

    # get attribute data
    $ExpressionData{Attribute} = $Self->AttributeGet(
        AttributeID => $Expression->{AttributeID},
        UserID      => $Param{UserID},
    );

    # check for attribute data
    if ( !$ExpressionData{Attribute} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No value for 'Attribute' with ID '$Expression->{AttributeID}'!",
        );
        return;
    }

    # get operator data
    $ExpressionData{Operator} = $Self->OperatorGet(
        OperatorID => $Expression->{OperatorID},
        UserID     => $Param{UserID},
    );

    # check for operator data
    if ( !$ExpressionData{Operator} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No value for 'Operator' with ID '$Expression->{OperatorID}'!",
        );
        return;
    }

    return \%ExpressionData;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
