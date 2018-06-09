# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMCondition::Object;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::System::ITSMChange::ITSMCondition::Object - condition object lib

=head1 SYNOPSIS

All functions for condition objects in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=item ObjectAdd()

Add a new condition object.

    my $ConditionID = $ConditionObject->ObjectAdd(
        Name   => 'ObjectName',
        UserID => 1,
    );

=cut

sub ObjectAdd {
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
    my $ObjectID = $Self->ObjectLookup(
        Name => $Param{Name},
    );

    # check if object name already exists
    if ($ObjectID) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Condition object ($Param{Name}) already exists!",
        );
        return;
    }

    # add new object name to database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'INSERT INTO condition_object '
            . '(name) '
            . 'VALUES (?)',
        Bind => [ \$Param{Name} ],
    );

    # get id of created object
    $ObjectID = $Self->ObjectLookup(
        Name => $Param{Name},
    );

    # check if object could be added
    if ( !$ObjectID ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ObjectAdd() failed!",
        );
        return;
    }

    # delete cache
    $Kernel::OM->Get('Kernel::System::Cache')->Delete(
        Type => $Self->{CacheType},
        Key  => 'ObjectList',
    );

    return $ObjectID;
}

=item ObjectUpdate()

Update a condition object.

    my $Success = $ConditionObject->ObjectUpdate(
        ObjectID => 1234,
        Name     => 'NewObjectName',
        UserID   => 1,
    );

=cut

sub ObjectUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ObjectID Name UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get object data
    my $ObjectData = $Self->ObjectGet(
        ObjectID => $Param{ObjectID},
        UserID   => $Param{UserID},
    );

    # check object data
    if ( !$ObjectData ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ObjectUpdate of $Param{ObjectID} failed!",
        );
        return;
    }

    # update object in database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE condition_object '
            . 'SET name = ? '
            . 'WHERE id = ?',
        Bind => [
            \$Param{Name},
            \$Param{ObjectID},
        ],
    );

    # delete cache
    for my $Key (
        'ObjectList',
        'ObjectGet::ObjectID::' . $Param{ObjectID},
        'ObjectLookup::ObjectID::' . $Param{ObjectID},
        'ObjectLookup::Name::' . $ObjectData->{Name},    # use the old name
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    return 1;
}

=item ObjectGet()

Get a condition object for a given object id.
Returns a hash reference of the object data.

    my $ConditionObjectRef = $ConditionObject->ObjectGet(
        ObjectID => 1234,
        UserID   => 1,
    );

The returned hash reference contains following elements:

    $ConditionObject{ObjectID}
    $ConditionObject{Name}

=cut

sub ObjectGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ObjectID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check cache
    my $CacheKey = 'ObjectGet::ObjectID::' . $Param{ObjectID};
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # prepare SQL statement
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL   => 'SELECT id, name FROM condition_object WHERE id = ?',
        Bind  => [ \$Param{ObjectID} ],
        Limit => 1,
    );

    # fetch the result
    my %ObjectData;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ObjectData{ObjectID} = $Row[0];
        $ObjectData{Name}     = $Row[1];
    }

    # check error
    if ( !%ObjectData ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ObjectID $Param{ObjectID} does not exist!",
        );
        return;
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \%ObjectData,
        TTL   => $Self->{CacheTTL},
    );

    return \%ObjectData;
}

=item ObjectLookup()

This method does a lookup for a condition object. If an object
id is given, it returns the name of the object. If the name of the
object is given, the appropriate id is returned.

    my $ObjectName = $ConditionObject->ObjectLookup(
        ObjectID => 4321,
    );

    my $ObjectID = $ConditionObject->ObjectLookup(
        Name   => 'ObjectName',
    );

=cut

sub ObjectLookup {
    my ( $Self, %Param ) = @_;

    # check if both parameters are given
    if ( $Param{ObjectID} && $Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ObjectID or Name - not both!',
        );
        return;
    }

    # check if both parameters are not given
    if ( !$Param{ObjectID} && !$Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ObjectID or Name - none is given!',
        );
        return;
    }

    # check if ObjectID is a number
    if ( $Param{ObjectID} && $Param{ObjectID} !~ m{ \A \d+ \z }xms ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ObjectID must be a number! (ObjectID: $Param{ObjectID})",
        );
        return;
    }

    my $CacheKey;

    # prepare SQL statements
    if ( $Param{ObjectID} ) {

        # check cache
        $CacheKey = 'ObjectLookup::ObjectID::' . $Param{ObjectID};
        my $Cache = $Kernel::OM->Get('Kernel::System::Cache')->Get(
            Type => $Self->{CacheType},
            Key  => $CacheKey,
        );
        return $Cache if $Cache;

        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL   => 'SELECT name FROM condition_object WHERE id = ?',
            Bind  => [ \$Param{ObjectID} ],
            Limit => 1,
        );
    }
    elsif ( $Param{Name} ) {

        # check cache
        $CacheKey = 'ObjectLookup::Name::' . $Param{Name};
        my $Cache = $Kernel::OM->Get('Kernel::System::Cache')->Get(
            Type => $Self->{CacheType},
            Key  => $CacheKey,
        );
        return $Cache if $Cache;

        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL   => 'SELECT id FROM condition_object WHERE name = ?',
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

=item ObjectList()

Returns a list of all condition objects as hash reference

    my $ConditionObjectsRef = $ConditionObject->ObjectList(
        UserID => 1,
    );

The returned hash reference contains entries like this:

    $ConditionObject{ObjectID} = 'ObjectName'

=cut

sub ObjectList {
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
    my $CacheKey = 'ObjectList';
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # prepare SQL statement
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id, name FROM condition_object',
    );

    # fetch the result
    my %ObjectList;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ObjectList{ $Row[0] } = $Row[1];
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \%ObjectList,
        TTL   => $Self->{CacheTTL},
    );

    return \%ObjectList;
}

=item ObjectDelete()

Deletes a condition object.

    my $Success = $ConditionObject->ObjectDelete(
        ObjectID => 123,
        UserID   => 1,
    );

=cut

sub ObjectDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ObjectID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # lookup object name
    my $ObjectName = $Self->ObjectLookup(
        ObjectID => $Param{ObjectID},
    );

    # delete condition object from database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'DELETE FROM condition_object '
            . 'WHERE id = ?',
        Bind => [ \$Param{ObjectID} ],
    );

    # delete cache
    for my $Key (
        'ObjectList',
        'ObjectGet::ObjectID::' . $Param{ObjectID},
        'ObjectLookup::ObjectID::' . $Param{ObjectID},
        'ObjectLookup::Name::' . $ObjectName,
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    return 1;
}

=item ObjectSelectorList()

Returns a list of all selectors available for the given object id and condition id as hash reference

    my $SelectorList = $ConditionObject->ObjectSelectorList(
        ObjectID    => 1234,
        ConditionID => 5,
        UserID      => 1,
    );

Returns a hash reference like this (for workorder objects)

    $SelectorList = {
        10    => '1 - WorkorderTitle of Workorder 1',
        12    => '2 - WorkorderTitle of Workorder 2',
        34    => '3 - WorkorderTitle of Workorder 3',
        'any' => 'any',
        'all' => 'all',
    }

or for change objects:

    $SelectorList = {
        456 => 'Change# 2010011610000618',
    }

=cut

sub ObjectSelectorList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ObjectID ConditionID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # lookup object name
    my $ObjectName = $Self->ObjectLookup(
        ObjectID => $Param{ObjectID},
    );

    # get condition data
    my $ConditionData = $Self->ConditionGet(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # check for error
    return if !$ConditionData;

    # get object backend
    my $BackendObject = $Kernel::OM->Get( 'Kernel::System::ITSMChange::ITSMCondition::Object::' . $ObjectName );

    # check for error
    return if !$BackendObject;

    # define default functions for backend
    my $Sub = 'SelectorList';

    # check for available function
    if ( !$BackendObject->can($Sub) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No function '$Sub' available for backend '$ObjectName'!",
        );
        return;
    }

    # execute the action subroutine
    my $SelectorList = $BackendObject->$Sub(
        ConditionID  => $Param{ConditionID},
        ChangeID     => $ConditionData->{ChangeID},
        UserID       => $Param{UserID},
        ExpressionID => $Param{ExpressionID},
        ActionID     => $Param{ActionID},
    ) || {};

    return $SelectorList;
}

=item ObjectCompareValueList()

Returns a list of available CompareValues for the given object id and attribute id as hash reference.

    my $CompareValueList = $ConditionObject->ObjectCompareValueList(
        ObjectID      => 1234,
        AttributeName => 'WorkOrderStateID',
        UserID        => 1,
    );

Returns a hash reference like this, for a workorder object and the attribute 'WorkOrderStateID':

    $CompareValueList = {
        10    => 'created',
        12    => 'accepted',
        13    => 'ready',
        14    => 'in progress',
        15    => 'closed',
        16    => 'canceled',
    }

=cut

sub ObjectCompareValueList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ObjectID AttributeName UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # set object name
    my $ObjectName = $Param{ObjectName};
    if ( $Param{ObjectID} ) {
        $ObjectName = $Self->ObjectLookup(
            ObjectID => $Param{ObjectID},
        );
    }

    # get object type
    my $ObjectType = $ObjectName;

    # get object backend
    my $BackendObject = $Kernel::OM->Get( 'Kernel::System::ITSMChange::ITSMCondition::Object::' . $ObjectType );

    return if !$BackendObject;

    # define default functions for backend
    my $Sub = 'CompareValueList';

    # check for available function
    if ( !$BackendObject->can($Sub) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No function '$Sub' available for backend '$ObjectType'!",
        );
        return;
    }

    # execute the action subroutine
    my $CompareValueList = $BackendObject->$Sub(
        AttributeName => $Param{AttributeName},
        UserID        => $Param{UserID},
    ) || {};

    return $CompareValueList;
}

=item ObjectDataGet()

Return the data of a given type and selector of a certain object.

    my $ObjectDataRef = $ConditionObject->ObjectDataGet(
        ConditionID => 1234,
        ObjectName  => 'ITSMChange',    # or ObjectID
        ObjectID    => 1,               # or ObjectName
        Selector    => '123',           #  ( ObjectKey | any | all )
        UserID      => 1,
    );

=cut

sub ObjectDataGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ConditionID Selector UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # either ObjectName or ObjectID must be passed
    if ( !$Param{ObjectName} && !$Param{ObjectID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'ObjectName ID or ObjectID!',
        );
        return;
    }

    # check that not both ObjectName and ObjectID are given
    if ( $Param{ObjectName} && $Param{ObjectID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need either ObjectName OR ObjectID - not both!',
        );
        return;
    }

    # set object name
    my $ObjectName = $Param{ObjectName};
    if ( $Param{ObjectID} ) {
        $ObjectName = $Self->ObjectLookup(
            ObjectID => $Param{ObjectID},
        );
    }

    # get object type
    my $ObjectType = $ObjectName;

    # get object backend
    my $BackendObject = $Kernel::OM->Get( 'Kernel::System::ITSMChange::ITSMCondition::Object::' . $ObjectType );

    return if !$BackendObject;

    # define default functions for backend
    my $Sub = 'DataGet';

    # check for available function
    if ( !$BackendObject->can($Sub) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No function '$Sub' available for backend '$ObjectType'!",
        );
        return;
    }

    # get object data
    my $ObjectData = $BackendObject->$Sub(
        ConditionID => $Param{ConditionID},
        Selector    => $Param{Selector},
        UserID      => $Param{UserID},
    ) || [];

    return $ObjectData;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
