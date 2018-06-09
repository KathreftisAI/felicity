# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMCondition::Operator;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::System::ITSMChange::ITSMCondition::Operator - condition operator lib

=head1 SYNOPSIS

All functions for condition operators in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=item OperatorAdd()

Add a new condition operator.

    my $OperatorID = $ConditionObject->OperatorAdd(
        Name   => 'OperatorName',
        UserID => 1,
    );

=cut

sub OperatorAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Name UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # make lookup with given name for checks
    my $OperatorID = $Self->OperatorLookup( Name => $Param{Name} );

    # check if operator name already exists
    if ($OperatorID) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Condition operator ($Param{Name}) already exists!",
        );
        return;
    }

    # add new operator name to database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'INSERT INTO condition_operator '
            . '(name) '
            . 'VALUES (?)',
        Bind => [ \$Param{Name} ],
    );

    # get id of created operator
    $OperatorID = $Self->OperatorLookup(
        Name => $Param{Name},
    );

    # check if operator could be added
    if ( !$OperatorID ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "OperatorAdd() failed!",
        );
        return;
    }

    # delete cache
    $Kernel::OM->Get('Kernel::System::Cache')->Delete(
        Type => $Self->{CacheType},
        Key  => 'OperatorList',
    );

    return $OperatorID;
}

=item OperatorUpdate()

Update a condition operator.

    my $Success = $ConditionObject->OperatorUpdate(
        OperatorID => 1234,
        Name       => 'NewOperatorName',
        UserID     => 1,
    );

=cut

sub OperatorUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(OperatorID Name UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get operator data
    my $OperatorData = $Self->OperatorGet(
        OperatorID => $Param{OperatorID},
        UserID     => $Param{UserID},
    );

    # check operator data
    if ( !$OperatorData ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "OperatorUpdate of $Param{OperatorID} failed!",
        );
        return;
    }

    # update operator in database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE condition_operator '
            . 'SET name = ? '
            . 'WHERE id = ?',
        Bind => [
            \$Param{Name},
            \$Param{OperatorID},
        ],
    );

    # delete cache
    for my $Key (
        'OperatorList',
        'OperatorGet::OperatorID::' . $Param{OperatorID},
        'OperatorLookup::OperatorID::' . $Param{OperatorID},
        'OperatorLookup::Name::' . $OperatorData->{Name},    # use the old name
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    return 1;
}

=item OperatorGet()

Get a condition operator for a given operator id.
Returns a hash reference of the operator data.

    my $ConditionOperatorRef = $ConditionObject->OperatorGet(
        OperatorID => 1234,
        UserID     => 1,
    );

The returned hash reference contains following elements:

    $ConditionOperator{OperatorID}
    $ConditionOperator{Name}

=cut

sub OperatorGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(OperatorID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check cache
    my $CacheKey = 'OperatorGet::OperatorID::' . $Param{OperatorID};
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # prepare SQL statement
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL   => 'SELECT id, name FROM condition_operator WHERE id = ?',
        Bind  => [ \$Param{OperatorID} ],
        Limit => 1,
    );

    # fetch the result
    my %OperatorData;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $OperatorData{OperatorID} = $Row[0];
        $OperatorData{Name}       = $Row[1];
    }

    # check error
    if ( !%OperatorData ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "OperatorID $Param{OperatorID} does not exist!",
        );
        return;
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \%OperatorData,
        TTL   => $Self->{CacheTTL},
    );

    return \%OperatorData;
}

=item OperatorLookup()

This method does a lookup for a condition operator. If an operator
id is given, it returns the name of the operator. If the name of the
operator is given, the appropriate id is returned.

    my $OperatorName = $ConditionObject->OperatorLookup(
        OperatorID => 4321,
    );

    my $OperatorID = $ConditionObject->OperatorLookup(
        Name   => 'OperatorName',
    );

=cut

sub OperatorLookup {
    my ( $Self, %Param ) = @_;

    # check if both parameters are given
    if ( $Param{OperatorID} && $Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need OperatorID or Name - not both!',
        );
        return;
    }

    # check if both parameters are not given
    if ( !$Param{OperatorID} && !$Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need OperatorID or Name - none is given!',
        );
        return;
    }

    # check if OperatorID is a number
    if ( $Param{OperatorID} && $Param{OperatorID} !~ m{ \A \d+ \z }xms ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "OperatorID must be a number! (OperatorID: $Param{OperatorID})",
        );
        return;
    }

    my $CacheKey;

    # prepare SQL statements
    if ( $Param{OperatorID} ) {

        # check cache
        $CacheKey = 'OperatorLookup::OperatorID::' . $Param{OperatorID};
        my $Cache = $Kernel::OM->Get('Kernel::System::Cache')->Get(
            Type => $Self->{CacheType},
            Key  => $CacheKey,
        );
        return $Cache if $Cache;

        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL   => 'SELECT name FROM condition_operator WHERE id = ?',
            Bind  => [ \$Param{OperatorID} ],
            Limit => 1,
        );
    }
    elsif ( $Param{Name} ) {

        # check cache
        $CacheKey = 'OperatorLookup::Name::' . $Param{Name};
        my $Cache = $Kernel::OM->Get('Kernel::System::Cache')->Get(
            Type => $Self->{CacheType},
            Key  => $CacheKey,
        );
        return $Cache if $Cache;

        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL   => 'SELECT id FROM condition_operator WHERE name = ?',
            Bind  => [ \$Param{Name} ],
            Limit => 1,
        );
    }

    # fetch the result
    my $Lookup;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $Lookup = $Row[0];
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => $Lookup,
        TTL   => $Self->{CacheTTL},
    );

    return $Lookup;
}

=item OperatorList()

Returns a list of all condition operators as hash reference

    my $ConditionOperatorsRef = $ConditionObject->OperatorList(
        UserID => 1,
    );

The returned hash reference contains entries like this:

    $ConditionOperator{ObjectID} = 'ObjectName'

=cut

sub OperatorList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );
        return;
    }

    # check cache
    my $CacheKey = 'OperatorList';
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # prepare SQL statement
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id, name FROM condition_operator',
    );

    # fetch the result
    my %OperatorList;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $OperatorList{ $Row[0] } = $Row[1];
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \%OperatorList,
        TTL   => $Self->{CacheTTL},
    );

    return \%OperatorList;
}

=item OperatorDelete()

Deletes a condition operator.

    my $Success = $ConditionObject->OperatorDelete(
        OperatorID => 123,
        UserID      => 1,
    );

=cut

sub OperatorDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(OperatorID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # lookup operator name
    my $OperatorName = $Self->OperatorLookup(
        OperatorID => $Param{OperatorID},
    );

    # delete condition operator from database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'DELETE FROM condition_operator '
            . 'WHERE id = ?',
        Bind => [ \$Param{OperatorID} ],
    );

    # delete cache
    for my $Key (
        'OperatorList',
        'OperatorGet::OperatorID::' . $Param{OperatorID},
        'OperatorLookup::OperatorID::' . $Param{OperatorID},
        'OperatorLookup::Name::' . $OperatorName,
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    return 1;
}

=item OperatorExecute()

Executes the operator and returns true on success.

    my $Result = $ConditionObject->OperatorExecute(
        OperatorName => 'is',
        Attribute    => 'WorkOrderStateID',
        Selector     => '1234,                                 #  ( ObjectKey | any | all )
        ObjectData   => [ $WorkOrderData1, $WorkOrderData2 ],
        CompareValue => 'SomeValue',                           # or ActionValue
        ObjectName   => 'ITSMWorkOrder',                       # needed for ActionValue
        ActionID     => 1234,                                  # needed for ActionValue
        ActionValue  => 'SomeValue',                           # or CompareValue
        UserID       => 1234,
    );

=cut

sub OperatorExecute {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(OperatorName Attribute Selector ObjectData UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # handle 'CompareValue' and 'ActionValue' in a special way
    if (
        ( !exists $Param{CompareValue} || !defined $Param{CompareValue} )
        && ( !exists $Param{ActionValue} || !defined $Param{ActionValue} )
        )
    {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need either CompareValue or ActionValue!',
        );
        return;
    }

    # check needed params for actions
    return if exists $Param{ActionValue} && !$Param{ObjectName};

    # get object data
    my $ObjectData = $Param{ObjectData};

    # check ObjectData
    if ( ref $ObjectData ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'ObjectData is not an array reference!',
        );
        return;
    }

    # for actions 'any' is not allowed
    return if exists $Param{ActionValue} && $Param{Selector} eq 'any';

    # execute operator for actions here
    # no need to iterate over object in this case
    if ( exists $Param{ActionValue} ) {
        return $Self->_OperatorActionExecute(
            Operator    => $Param{OperatorName},
            ObjectName  => $Param{ObjectName},
            Selector    => $Param{Selector},
            Attribute   => $Param{Attribute},
            ActionID    => $Param{ActionID},
            ActionValue => $Param{ActionValue},
            UserID      => $Param{UserID},
        );
    }

    # return false if no object data is given
    return if !@{$ObjectData};

    # execute operator for each object
    my @OperatorExecuteResult;
    for my $Object ( @{$ObjectData} ) {

        # get equation result for object
        my $Result = $Self->_OperatorExecute(
            OperatorName => $Param{OperatorName},
            Value1       => $Object->{ $Param{Attribute} } || '',
            Value2       => $Param{CompareValue},
            UserID       => $Param{UserID},
        ) || 0;

        # return true if result is positive and 'any' is requested
        if ( $Param{Selector} eq 'any' && $Result ) {
            return 1;
        }

        # return false if result is negative and 'all' is requested
        if ( $Param{Selector} eq 'all' && !$Result ) {
            return;
        }

        # save current result for coming checks
        push @OperatorExecuteResult, $Result;
    }

    # count all results which have a true value
    my $TrueCount = scalar grep { $_ == 1 } @OperatorExecuteResult;

    # return false if not all results are true
    return if $TrueCount != scalar @{$ObjectData};

    return 1;
}

=begin Internal:

=item _OperatorExecute()

Returns true or false (1/undef).

    my $Result = $ConditionObject->_OperatorExecute(
        OperatorName => 'is',
        Value1       => 'SomeValue',
        Value2       => 'SomeOtherValue',
        UserID       => 1234,
    );

=cut

sub _OperatorExecute {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(OperatorName UserID)) {
        if ( !exists $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # map for operator action
    my %OperatorAction = (

        # common matching
        'is'           => '_OperatorEqual',
        'is not'       => '_OperatorNotEqual',
        'is empty'     => '_OperatorIsEmpty',
        'is not empty' => '_OperatorIsNotEmpty',

        # digit matching
        'is greater than' => '_OperatorIsGreaterThan',
        'is less than'    => '_OperatorIsLessThan',

        # date matching
        'is before' => '_OperatorIsBefore',
        'is after'  => '_OperatorIsAfter',

        # string matching
        'contains'     => '_OperatorContains',
        'not contains' => '_OperatorNotContains',
        'begins with'  => '_OperatorBeginsWith',
        'ends with'    => '_OperatorEndsWith',
    );

    # get operator name
    my $OperatorName = $Param{OperatorName};

    # check for matching operator
    if ( !exists $OperatorAction{$OperatorName} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No matching operator for '$OperatorName' found!",
        );
        return;
    }

    # extract operator sub
    my $Sub = $OperatorAction{$OperatorName};

    # check for available function
    if ( !$Self->can($Sub) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No function '$Sub' available for '$OperatorName'!",
        );
        return;
    }

    # execute extracted match
    my $Result = $Self->$Sub(
        Value1 => $Param{Value1},
        Value2 => $Param{Value2},
    );

    return $Result;
}

=item _OperatorActionExecute()

Returns true or false (1/undef) if given action could be
executed successfully.

    my $Result = $ConditionObject->_OperatorActionExecute(
        Operator    => 'set',
        ObjectName  => 'ITSMChange',
        Selector    => '1234'
        Attribute   => 'ChangeStateID',
        ActionID    => 2345,
        ActionValue => '13',
        UserID      => 1234,
    );

=cut

sub _OperatorActionExecute {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Operator ObjectName Selector Attribute ActionID ActionValue UserID)) {
        if ( !exists $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check needed stuff in a special way
    for my $Argument (qw(ActionValue)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # map for operator action
    my %OperatorAction = (
        'set' => '_OperatorSet',
    );

    # get operator name
    my $OperatorName = $Param{Operator};

    # check for matching operator
    if ( !exists $OperatorAction{$OperatorName} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No matching operator for '$OperatorName' found!",
        );
        return;
    }

    # extract operator sub
    my $Sub = $OperatorAction{$OperatorName};

    # check for available function
    if ( !$Self->can($Sub) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No function '$Sub' available for '$OperatorName'!",
        );
        return;
    }

    # execute extracted action
    my $Result = $Self->$Sub(
        Operator    => $Param{Operator},
        ObjectName  => $Param{ObjectName},
        Selector    => $Param{Selector},
        Attribute   => $Param{Attribute},
        ActionID    => $Param{ActionID},
        ActionValue => $Param{ActionValue},
        UserID      => $Param{UserID},
    );

    return $Result;
}

=item _OperatorEqual()

Returns true or false (1/undef) if given values are equal.

    my $Result = $ConditionObject->_OperatorEqual(
        Value1 => 'SomeValue',
        Value2 => 'SomeOtherValue',
    );

=cut

sub _OperatorEqual {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # return result of equation
    return $Param{Value1} eq $Param{Value2};
}

=item _OperatorNotEqual()

Returns true or false (1/undef) if given values are not equal.

    my $Result = $ConditionObject->_OperatorNotEqual(
        Value1 => 'SomeValue',
        Value2 => 'SomeOtherValue',
    );

=cut

sub _OperatorNotEqual {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # return result of negated equation
    return !$Self->_OperatorEqual(%Param);
}

=item _OperatorIsEmpty()

Returns true or false (1/undef) if given value is empty.

    my $Result = $ConditionObject->_OperatorIsEmpty(
        Value1 => '',
    );

=cut

sub _OperatorIsEmpty {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check length of value
    my $ValueLength = length $Param{Value1};

    # return result of length check
    return $ValueLength == 0;
}

=item _OperatorIsNotEmpty()

Returns true or false (1/undef) if given value is not empty.

    my $Result = $ConditionObject->_OperatorIsNotEmpty(
        Value1 => 'SomeValue',
    );

=cut

sub _OperatorIsNotEmpty {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # return result of negated equation
    return !$Self->_OperatorIsEmpty(%Param);
}

=item _OperatorIsGreaterThan()

Returns true or false (1/undef) if Value1 is greater than
the compare Value2.

    my $Result = $ConditionObject->_OperatorIsGreaterThan(
        Value1 => 2345,
        Value2 => 1234,
    );

=cut

sub _OperatorIsGreaterThan {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }

        # set default to number 0 (zero)
        if ( !$Param{$Argument} ) {
            $Param{$Argument} = 0;
        }
    }

    # check for digits, allow decimal point, allow negative numbers
    return if $Param{Value1} !~ m{ \A [+-]? \d+ ( \. \d+ )? \z }xms;
    return if $Param{Value2} !~ m{ \A [+-]? \d+ ( \. \d+ )? \z }xms;

    # return result of greater than check
    return $Param{Value1} > $Param{Value2};
}

=item _OperatorIsLessThan()

Returns true or false (1/undef) if Value1 is less than
the compare Value2.

    my $Result = $ConditionObject->_OperatorIsLessThan(
        Value1 => 2345,
        Value2 => 1234,
    );

=cut

sub _OperatorIsLessThan {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }

        # set default to number 0 (zero)
        if ( !$Param{$Argument} ) {
            $Param{$Argument} = 0;
        }
    }

    # check for digits, allow decimal point, allow negative numbers
    return if $Param{Value1} !~ m{ \A [+-]? \d+ ( \. \d+ )? \z }xms;
    return if $Param{Value2} !~ m{ \A [+-]? \d+ ( \. \d+ )? \z }xms;

    # return result of less than check
    return $Param{Value1} < $Param{Value2};
}

=item _OperatorIsBefore()

Returns true or false (1/undef) if Value1 is before the compare Value2.

    my $Result = $ConditionObject->_OperatorIsBefore(
        Value1 => '2010-01-01 01:01:01',
        Value2 => '2010-01-01 10:01:01',
    );

=cut

sub _OperatorIsBefore {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check for date format
    return if $Param{Value1} !~ m{ \A \d{4}-\d{2}-\d{2} \s \d{2}:\d{2}:\d{2} \z }xms;
    return if $Param{Value2} !~ m{ \A \d{4}-\d{2}-\d{2} \s \d{2}:\d{2}:\d{2} \z }xms;

    # get timestamps
    my %Timestamp;
    for my $Date (qw(Value1 Value2)) {

        # convert time
        $Timestamp{$Date} = $Kernel::OM->Get('Kernel::System::Time')->TimeStamp2SystemTime(
            String => $Param{$Date},
        );

        # check for time
        return if !$Timestamp{$Date};
    }

    # return result of lower than check
    return $Timestamp{Value1} < $Timestamp{Value2};
}

=item _OperatorIsAfter()

Returns true or false (1/undef) if Value1 is after the compare Value2.

    my $Result = $ConditionObject->_OperatorIsAfter(
        Value1 => '2010-01-01 10:01:01',
        Value2 => '2010-01-01 01:01:01',
    );

=cut

sub _OperatorIsAfter {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check for date format
    return if $Param{Value1} !~ m{ \A \d{4}-\d{2}-\d{2} \s \d{2}:\d{2}:\d{2}  \z }xms;
    return if $Param{Value2} !~ m{ \A \d{4}-\d{2}-\d{2} \s \d{2}:\d{2}:\d{2}  \z }xms;

    # return result of negated equation
    return !$Self->_OperatorIsBefore(%Param);
}

=item _OperatorContains()

Returns true or false (1/undef) if value1 contains value2.

    my $Result = $ConditionObject->_OperatorContains(
        Value1 => 'SomeValue',
        Value2 => 'Value',
    );

=cut

sub _OperatorContains {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get lower case, for performance issues
    my $LowerValue1 = lc $Param{Value1};
    my $LowerValue2 = lc $Param{Value2};

    # check embedded string
    my $Contains = $LowerValue1 =~ m{ \A .* $LowerValue2 .* \z }xms;

    # return result of equation
    return $Contains;
}

=item _OperatorNotContains()

Returns true or false (1/undef) if value1 not contains value2.

    my $Result = $ConditionObject->_OperatorNotContains(
        Value1 => 'SomeValue',
        Value2 => 'SomeOtherValue',
    );

=cut

sub _OperatorNotContains {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # return result of negated equation
    return !$Self->_OperatorContains(%Param);
}

=item _OperatorBeginsWith()

Returns true or false (1/undef) if value1 begins with value2.

    my $Result = $ConditionObject->_OperatorBeginsWith(
        Value1 => 'SomeValue',
        Value2 => 'Some',
    );

=cut

sub _OperatorBeginsWith {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get lower case, for performance issues
    my $LowerValue1 = lc $Param{Value1};
    my $LowerValue2 = lc $Param{Value2};

    # check embedded string
    my $BeginsWith = $LowerValue1 =~ m{ \A $LowerValue2 .* \z }xms;

    # return result of equation
    return $BeginsWith;
}

=item _OperatorEndsWith()

Returns true or false (1/undef) if value1 ends with value2.

    my $Result = $ConditionObject->_OperatorEndsWith(
        Value1 => 'SomeValue',
        Value2 => 'Value',
    );

=cut

sub _OperatorEndsWith {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Value1 Value2)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get lower case, for performance issues
    my $LowerValue1 = lc $Param{Value1};
    my $LowerValue2 = lc $Param{Value2};

    # check embedded string
    my $EndsWith = $LowerValue1 =~ m{ \A .* $LowerValue2 \z }xms;

    # return result of equation
    return $EndsWith;
}

=item _OperatorSet()

Returns the success of setting a new value.

    my $Result = $ConditionObject->_OperatorSet(
        Operator    => 'set',
        ObjectName  => 'ITSMChange',
        Selector    => '1234'
        Attribute   => 'ChangeStateID',
        ActionID    => 'ChangeStateID',
        ActionValue => '13',
        UserID      => 1234,
    );

=cut

sub _OperatorSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Operator ObjectName Selector Attribute ActionID ActionValue UserID)) {
        if ( !exists $Param{$Argument} || !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get operator name
    my $OperatorName = $Param{ObjectName};

    # get operator backend
    my $BackendObject = $Kernel::OM->Get(
        'Kernel::System::ITSMChange::ITSMCondition::Operator::' . $OperatorName
    );

    return if !$BackendObject;

    # define default functions for backend
    my $Sub = 'Set';

    # check for available function
    if ( !$BackendObject->can($Sub) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No function '$Sub' available for backend '$OperatorName'!",
        );
        return;
    }

    # result value
    my $Result;

    # execute extracted action with selector 'all'
    if ( $Param{Selector} eq 'all' ) {

        # define 'all' function for backend
        $Sub = 'SetAll';

        # check for available function
        if ( !$BackendObject->can($Sub) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "No function '$Sub' available for backend '$OperatorName'!",
            );
            return;
        }

        # get action
        my $Action = $Self->ActionGet(
            ActionID => $Param{ActionID},
            UserID   => $Param{UserID},
        );

        # check action
        return if !$Action;

        # get objects for 'all'
        my $ActionObjects = $Self->ObjectDataGet(
            ConditionID => $Action->{ConditionID},
            ObjectName  => $Param{ObjectName},
            Selector    => $Param{Selector},
            UserID      => $Param{UserID},
        );

        # check objects
        return 1 if !$ActionObjects;
        return   if ref $ActionObjects ne 'ARRAY';

        # execute actions for all objects
        $Result = $BackendObject->$Sub(
            Operator    => $Param{Operator},
            ObjectName  => $Param{ObjectName},
            Objects     => $ActionObjects,
            Attribute   => $Param{Attribute},
            ActionValue => $Param{ActionValue},
            UserID      => $Param{UserID},
        );
    }
    else {

        # execute extracted action with single selector
        $Result = $BackendObject->$Sub(
            Operator    => $Param{Operator},
            ObjectName  => $Param{ObjectName},
            Selector    => $Param{Selector},
            Attribute   => $Param{Attribute},
            ActionValue => $Param{ActionValue},
            UserID      => $Param{UserID},
        );
    }

    return $Result;
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
