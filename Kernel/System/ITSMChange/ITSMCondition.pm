# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::ITSMCondition;

use strict;
use warnings;

use Kernel::System::EventHandler;
use Kernel::System::ITSMChange::ITSMCondition::Object;
use Kernel::System::ITSMChange::ITSMCondition::Attribute;
use Kernel::System::ITSMChange::ITSMCondition::Operator;
use Kernel::System::ITSMChange::ITSMCondition::Expression;
use Kernel::System::ITSMChange::ITSMCondition::Action;

use vars qw(@ISA);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::Log',
    'Kernel::System::Valid',
    'Kernel::System::Time',
    'Kernel::System::ITSMChange::ITSMCondition::Object::ITSMWorkOrder',
);

=head1 NAME

Kernel::System::ITSMChange::ITSMCondition - condition lib

=head1 SYNOPSIS

All functions for conditions in ITSMChangeManagement.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $ConditionObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # set the debug flag
    $Self->{Debug} = $Param{Debug} || 0;

    # get the cache type and TTL (in seconds)
    $Self->{CacheType} = 'ITSMChangeManagement';
    $Self->{CacheTTL}  = $Kernel::OM->Get('Kernel::Config')->Get('ITSMChange::CacheTTL') * 60;

    # get the database type
    $Self->{DBType} = $Kernel::OM->Get('Kernel::System::DB')->{'DB::Type'} || '';
    $Self->{DBType} = lc $Self->{DBType};

    @ISA = qw(
        Kernel::System::EventHandler
        Kernel::System::ITSMChange::ITSMCondition::Object
        Kernel::System::ITSMChange::ITSMCondition::Attribute
        Kernel::System::ITSMChange::ITSMCondition::Operator
        Kernel::System::ITSMChange::ITSMCondition::Expression
        Kernel::System::ITSMChange::ITSMCondition::Action
    );

    # init of event handler
    $Self->EventHandlerInit(
        Config => 'ITSMCondition::EventModule',
    );

    return $Self;
}

=item ConditionAdd()

Add a new condition.

    my $ConditionID = $ConditionObject->ConditionAdd(
        ChangeID              => 123,
        Name                  => 'The condition name',
        ExpressionConjunction => 'any',                 # (any|all)
        Comment               => 'A comment',           # (optional)
        ValidID               => 1,
        UserID                => 1,
    );

=cut

sub ConditionAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ChangeID Name ExpressionConjunction ValidID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check if a condition with this name and change id exist already
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id FROM change_condition '
            . 'WHERE change_id = ? AND name = ?',
        Bind => [
            \$Param{ChangeID}, \$Param{Name},
        ],
        Limit => 1,
    );

    # fetch the result
    my $ConditionID;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ConditionID = $Row[0];
    }

    # a condition with this name and change id exists already
    if ($ConditionID) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "A condition with the name $Param{Name} "
                . "exists already for ChangeID $Param{ChangeID}!",
        );
        return;
    }

    # trigger ConditionAddPre-Event
    $Self->EventHandler(
        Event => 'ConditionAddPre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    # add new condition to database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'INSERT INTO change_condition '
            . '(change_id, name, expression_conjunction, comments, valid_id, '
            . 'create_time, create_by, change_time, change_by) '
            . 'VALUES (?, ?, ?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{ChangeID}, \$Param{Name}, \$Param{ExpressionConjunction},
            \$Param{Comment}, \$Param{ValidID}, \$Param{UserID}, \$Param{UserID},
        ],
    );

    # prepare SQL statement
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id FROM change_condition '
            . 'WHERE change_id = ? AND name = ?',
        Bind => [
            \$Param{ChangeID}, \$Param{Name},
        ],
        Limit => 1,
    );

    # fetch the result
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ConditionID = $Row[0];
    }

    # check if condition could be added
    if ( !$ConditionID ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ConditionAdd() failed!",
        );
        return;
    }

    # delete cache
    for my $Key (
        'ConditionList::ChangeID::' . $Param{ChangeID} . '::Valid::0',
        'ConditionList::ChangeID::' . $Param{ChangeID} . '::Valid::1',
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    # trigger ConditionAddPost-Event
    $Self->EventHandler(
        Event => 'ConditionAddPost',
        Data  => {
            %Param,
            ConditionID => $ConditionID,
        },
        UserID => $Param{UserID},
    );

    return $ConditionID;
}

=item ConditionUpdate()

Update a condition.

    my $Success = $ConditionObject->ConditionUpdate(
        ConditionID           => 1234,
        Name                  => 'The condition name',  # (optional)
        ExpressionConjunction => 'any',                 # (optional) (any|all)
        Comment               => 'A comment',           # (optional)
        ValidID               => 1,                     # (optional)
        UserID                => 1,
    );

=cut

sub ConditionUpdate {
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

    # get current condition data for event handler
    my $ConditionData = $Self->ConditionGet(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # check condition
    return if !$ConditionData;

    # trigger ConditionUpdatePre-Event
    $Self->EventHandler(
        Event => 'ConditionUpdatePre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    # map update attributes to column names
    my %Attribute = (
        Name                  => 'name',
        ExpressionConjunction => 'expression_conjunction',
        Comment               => 'comments',
        ValidID               => 'valid_id',
    );

    # build SQL to update condition
    my $SQL = 'UPDATE change_condition SET ';
    my @Bind;

    ATTRIBUTE:
    for my $Attribute ( sort keys %Attribute ) {

        # preserve the old value, when the column isn't in function parameters
        next ATTRIBUTE if !exists $Param{$Attribute};

        # param checking has already been done, so this is safe
        $SQL .= "$Attribute{$Attribute} = ?, ";
        push @Bind, \$Param{$Attribute};
    }

    # add change time and change user
    $SQL .= 'change_time = current_timestamp, change_by = ? ';
    push @Bind, \$Param{UserID};

    # set matching of SQL statement
    $SQL .= 'WHERE id = ?';
    push @Bind, \$Param{ConditionID};

    # update condition
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => $SQL,
        Bind => \@Bind,
    );

    # delete cache
    for my $Key (
        'ConditionList::ChangeID::' . $ConditionData->{ChangeID} . '::Valid::0',
        'ConditionList::ChangeID::' . $ConditionData->{ChangeID} . '::Valid::1',
        'ConditionGet::ConditionID::' . $Param{ConditionID},
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    # trigger ConditionUpdatePost-Event
    $Self->EventHandler(
        Event => 'ConditionUpdatePost',
        Data  => {
            %Param,
            OldConditionData => $ConditionData,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ConditionLookup()

Return the condition id when the condition name is passed.
Return the condition name when the condition id is passed.
When no condition id or condition name is found, then the undefined value is returned.
The ChangeID is always required as condition names are only unique within the same change.

    my $ConditionID = $ConditionObject->ConditionLookup(
        Name     => 'ABC',
        ChangeID => 2,
    );

    my $Name = $ConditionObject->ConditionLookup(
        ConditionID => 42,
        ChangeID    => 2,
    );

=cut

sub ConditionLookup {
    my ( $Self, %Param ) = @_;

    # the change id must be passed
    if ( !$Param{ChangeID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need the ChangeID!',
        );
        return;
    }

    # the condition id or the condition name must be passed
    if ( !$Param{ConditionID} && !$Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need the ConditionID or the Name!',
        );
        return;
    }

    # only one of condition id and condition name can be passed
    if ( $Param{ConditionID} && $Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need either the ConditionID or the Name, not both!',
        );
        return;
    }

    # check if ConditionID is a number
    if ( $Param{ConditionID} && $Param{ConditionID} !~ m{ \A \d+ \z }xms ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ConditionID must be a number! (ConditionID: $Param{ConditionID})",
        );
        return;
    }

    # get condition id
    if ( $Param{Name} ) {

        my $ConditionID;

        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => '
                SELECT id
                FROM change_condition
                WHERE change_id = ?
                AND name = ?
            ',
            Bind => [
                \$Param{ChangeID},
                \$Param{Name},
            ],
            Limit => 1,
        );

        while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
            $ConditionID = $Row[0];
        }

        return $ConditionID;
    }

    # get condition name
    elsif ( $Param{ConditionID} ) {

        my $Name;

        return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
            SQL => '
                SELECT name
                FROM change_condition
                WHERE change_id = ?
                AND id = ?
            ',
            Bind => [
                \$Param{ChangeID},
                \$Param{ConditionID},
            ],
            Limit => 1,
        );

        while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
            $Name = $Row[0];
        }

        return $Name;
    }

    return;
}

=item ConditionGet()

Returns a hash reference of the condition data for a given ConditionID.

    my $ConditionData = $ConditionObject->ConditionGet(
        ConditionID => 123,
        UserID      => 1,
    );

The returned hash reference contains following elements:

    $ConditionData{ConditionID}
    $ConditionData{ChangeID}
    $ConditionData{Name}
    $ConditionData{ExpressionConjunction}
    $ConditionData{Comment}
    $ConditionData{ValidID}
    $ConditionData{CreateTime}
    $ConditionData{CreateBy}
    $ConditionData{ChangeTime}
    $ConditionData{ChangeBy}

=cut

sub ConditionGet {
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
    my $CacheKey = 'ConditionGet::ConditionID::' . $Param{ConditionID};
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # prepare SQL statement
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id, change_id, name, expression_conjunction, comments, '
            . 'valid_id, create_time, create_by, change_time, change_by '
            . 'FROM change_condition '
            . 'WHERE id = ?',
        Bind  => [ \$Param{ConditionID} ],
        Limit => 1,
    );

    # fetch the result
    my %ConditionData;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ConditionData{ConditionID}           = $Row[0];
        $ConditionData{ChangeID}              = $Row[1];
        $ConditionData{Name}                  = $Row[2];
        $ConditionData{ExpressionConjunction} = $Row[3];
        $ConditionData{Comment}               = $Row[4];
        $ConditionData{ValidID}               = $Row[5];
        $ConditionData{CreateTime}            = $Row[6];
        $ConditionData{CreateBy}              = $Row[7];
        $ConditionData{ChangeTime}            = $Row[8];
        $ConditionData{ChangeBy}              = $Row[9];
    }

    # check error
    if ( !%ConditionData ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ConditionID $Param{ConditionID} does not exist!",
        );
        return;
    }

    # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000)
    TIMEFIELD:
    for my $Timefield ( 'CreateTime', 'ChangeTime', ) {
        next TIMEFIELD if !$ConditionData{$Timefield};
        $ConditionData{$Timefield}
            =~ s{ \A ( \d\d\d\d - \d\d - \d\d \s \d\d:\d\d:\d\d ) \. .+? \z }{$1}xms;
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \%ConditionData,
        TTL   => $Self->{CacheTTL},
    );

    return \%ConditionData;
}

=item ConditionList()

return a list of all condition ids of a given change id as array reference.
The ids are sorted by the name of the condition.

    my $ConditionIDsRef = $ConditionObject->ConditionList(
        ChangeID => 5,
        Valid    => 0,   # (optional) default 1 (0|1)
        UserID   => 1,
    );

=cut

sub ConditionList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ChangeID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check valid param
    if ( !defined $Param{Valid} ) {
        $Param{Valid} = 1;
    }

    # check cache
    my $CacheKey = 'ConditionList::ChangeID::' . $Param{ChangeID} . '::Valid::' . $Param{Valid};
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # define SQL statement
    my $SQL = 'SELECT id '
        . 'FROM change_condition '
        . 'WHERE change_id = ? ';

    # get only valid condition ids
    if ( $Param{Valid} ) {

        my @ValidIDs = $Kernel::OM->Get('Kernel::System::Valid')->ValidIDsGet();
        my $ValidIDString = join ', ', @ValidIDs;

        $SQL .= "AND valid_id IN ( $ValidIDString ) ";
    }

    # get sorted list
    $SQL .= 'ORDER BY name ASC ';

    # prepare SQL statement
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL  => $SQL,
        Bind => [ \$Param{ChangeID} ],
    );

    # fetch the result
    my @ConditionIDs;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @ConditionIDs, $Row[0];
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => $CacheKey,
        Value => \@ConditionIDs,
        TTL   => $Self->{CacheTTL},
    );

    return \@ConditionIDs;
}

=item ConditionDelete()

Delete a condition.

    my $Success = $ConditionObject->ConditionDelete(
        ConditionID => 123,
        UserID      => 1,
    );

=cut

sub ConditionDelete {
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

    # trigger ConditionDeletePre-Event
    $Self->EventHandler(
        Event => 'ConditionDeletePre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    # get condition data for event handler
    my $ConditionData = $Self->ConditionGet(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # delete all expressions for this condition id
    my $Success = $Self->ExpressionDeleteAll(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    return if !$Success;

    # delete all actions for this condition id
    $Success = $Self->ActionDeleteAll(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    return if !$Success;

    # delete condition from database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'DELETE FROM change_condition '
            . 'WHERE id = ?',
        Bind => [ \$Param{ConditionID} ],
    );

    # delete cache
    for my $Key (
        'ConditionList::ChangeID::' . $ConditionData->{ChangeID} . '::Valid::0',
        'ConditionList::ChangeID::' . $ConditionData->{ChangeID} . '::Valid::1',
        'ConditionGet::ConditionID::' . $Param{ConditionID},
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    # trigger ConditionDeletePost-Event
    $Self->EventHandler(
        Event => 'ConditionDeletePost',
        Data  => {
            %Param,
            OldConditionData => $ConditionData,
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ConditionDeleteAll()

Delete all conditions for a given ChangeID.
All related expressions and actions will be deleted first.

    my $Success = $ConditionObject->ConditionDeleteAll(
        ChangeID => 123,
        UserID   => 1,
    );

=cut

sub ConditionDeleteAll {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ChangeID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get all condition ids (including invalid) for the given change id
    my $ConditionIDsRef = $Self->ConditionList(
        ChangeID => $Param{ChangeID},
        Valid    => 0,
        UserID   => $Param{UserID},
    );

    # trigger ConditionDeleteAllPre-Event
    $Self->EventHandler(
        Event => 'ConditionDeleteAllPre',
        Data  => {
            %Param,
        },
        UserID => $Param{UserID},
    );

    for my $ConditionID ( @{$ConditionIDsRef} ) {

        # delete all expressions for this condition id
        my $Success = $Self->ExpressionDeleteAll(
            ConditionID => $ConditionID,
            UserID      => $Param{UserID},
        );

        return if !$Success;

        # delete all actions for this condition id
        $Success = $Self->ActionDeleteAll(
            ConditionID => $ConditionID,
            UserID      => $Param{UserID},
        );

        return if !$Success;

        # delete cache for ConditionGet
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => 'ConditionGet::ConditionID::' . $ConditionID,
        );
    }

    # delete conditions from database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'DELETE FROM change_condition '
            . 'WHERE change_id = ?',
        Bind => [ \$Param{ChangeID} ],
    );

    # delete cache
    for my $Key (
        'ConditionList::ChangeID::' . $Param{ChangeID} . '::Valid::0',
        'ConditionList::ChangeID::' . $Param{ChangeID} . '::Valid::1',
        )
    {
        $Kernel::OM->Get('Kernel::System::Cache')->Delete(
            Type => $Self->{CacheType},
            Key  => $Key,
        );
    }

    # trigger ConditionDeleteAllPost-Event
    $Self->EventHandler(
        Event => 'ConditionDeleteAllPost',
        Data  => {
            %Param,
            ChangeID => $Param{ChangeID},
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=item ConditionMatchExecuteAll()

This functions finds the valid conditions for a given ChangeID. The found conditions
are handled by executing the associated actions when a condition matches.
The conditions are handled in the order defined by their names.

Internally, the method ConditionMatchExecute() is called for each of the found conditions.
The optional parameter 'AttributesChanged' is passed on to ConditionMatchExecute().

    my $Success = $ConditionObject->ConditionMatchExecuteAll(
        ChangeID          => 123,
        AttributesChanged => { ITSMChange => [ ChangeTitle, ChangeDescription] },  # (optional)
        Event             => 'ChangeUpdate',                                       # (optional)
        UserID            => 1,
    );

=cut

sub ConditionMatchExecuteAll {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ChangeID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get all condition ids for the given change id
    my $ConditionIDsRef = $Self->ConditionList(
        ChangeID => $Param{ChangeID},
        Valid    => 1,
        UserID   => $Param{UserID},
    );

    # check errors
    return if !$ConditionIDsRef;
    return if ref $ConditionIDsRef ne 'ARRAY';

    # no error if just no valid conditions were found
    return 1 if !@{$ConditionIDsRef};

    # match and execute all conditions
    for my $ConditionID ( @{$ConditionIDsRef} ) {

        # match and execute each condition
        my $Success = $Self->ConditionMatchExecute(
            ConditionID       => $ConditionID,
            AttributesChanged => $Param{AttributesChanged},
            Event             => $Param{Event},
            UserID            => $Param{UserID},
        );

        # write log entry but do not return
        if ( !$Success ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "ConditionMatchExecute for ConditionID '$ConditionID' failed!",
            );
        }
    }

    return 1;
}

=item ConditionMatchExecute()

This function matches the given condition. When it matches the associated actions are
executed.

The optional parameter 'AttributesChanged' defines a list of attributes that were changed
during e.g. a ChangeUpdate-Event. When 'AttributesChanged' is passed, it is used to shortcut the
expression evalution. Only the changed attributes must be checked.
When the expression conjunction is 'any' and more than a single expression is set up,
then, for obvious reasons, the shortcut is not used.

    my $Success = $ConditionObject->ConditionMatchExecute(
        ConditionID       => 123,
        AttributesChanged => { ITSMChange => [ ChangeTitle, ChangeDescription] },  # (optional)
        Event             => 'ChangeUpdate',                                       # (optional)
        UserID            => 1,
    );

=cut

sub ConditionMatchExecute {
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

    # get condition data
    my $ConditionData = $Self->ConditionGet(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # check error
    return if !$ConditionData;

    # get all expressions for the given condition id
    my $ExpressionIDsRef = $Self->ExpressionList(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # check errors
    return if !$ExpressionIDsRef;
    return if ref $ExpressionIDsRef ne 'ARRAY';

    # no error if just no expressions were found
    return 1 if !@{$ExpressionIDsRef};

    # count the number of expression ids
    my $ExpressionIDCount = scalar @{$ExpressionIDsRef};

    # get all actions for the given condition id
    my $ActionIDsRef = $Self->ActionList(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # check errors
    return if !$ActionIDsRef;
    return if ref $ActionIDsRef ne 'ARRAY';

    # no error if just no actions were found
    return 1 if !@{$ActionIDsRef};

    # to store the number of positive (true) expressions
    my @ExpressionMatchResult;

    # to store if the condition matches
    my $ConditionMatch;

    # normally give the list of changed attributes to ExpressionMatch() function
    my $AttributesChanged = $Param{AttributesChanged};

    # expression conjunction is 'all' and there is more than one expresion
    if ( $ConditionData->{ExpressionConjunction} eq 'all' && $ExpressionIDCount > 1 ) {

        # do not give the list of changed attributes to ExpressionMatch()
        $AttributesChanged = undef;
    }

    # try to match each expression
    EXPRESSIONID:
    for my $ExpressionID ( @{$ExpressionIDsRef} ) {

        # match expression
        my $ExpressionMatch = $Self->ExpressionMatch(
            ExpressionID      => $ExpressionID,
            AttributesChanged => $AttributesChanged,
            UserID            => $Param{UserID},
        ) || 0;

        # set ConditionMatch true if ExpressionMatch is true and 'any' is requested
        if ( $ConditionData->{ExpressionConjunction} eq 'any' && $ExpressionMatch ) {
            $ConditionMatch = 1;
            last EXPRESSIONID;
        }

        # condition is false at all, no action will be exected, we just return true
        if ( $ConditionData->{ExpressionConjunction} eq 'all' && !$ExpressionMatch ) {
            return 1;
        }

        # save current expression match result for later checks
        push @ExpressionMatchResult, $ExpressionMatch;
    }

    # count all results which have a true value
    my $TrueCount = scalar grep { $_ == 1 } @ExpressionMatchResult;

    # if the condition did not match already, and not all expressions are true
    if ( !$ConditionMatch && $TrueCount != $ExpressionIDCount ) {

        # no error: if just the condition did not match,
        # there is no need to execute any actions
        return 1;
    }

    # execute all actions of this condition
    ACTIONID:
    for my $ActionID ( @{$ActionIDsRef} ) {

        # execute each action
        my $Success = $Self->ActionExecute(
            ActionID => $ActionID,
            UserID   => $Param{UserID},
        );

        # check error: if ActionExecute() returns undefined it is an error,
        # 1 means an action was executed successfully, and 0 means it was a "Lock"-Action,
        # which is no error, and should therefore not be logged.
        if ( !defined $Success ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "ActionID '$ActionID' could not be executed successfully "
                    . "for ConditionID '$Param{ConditionID}' (Condition name: '$ConditionData->{Name}') "
                    . "on ChangeID '$ConditionData->{ChangeID}' for event '$Param{Event}'.",
            );
        }
    }

    return 1;
}

=item ConditionMatchStateLock()

    my $Success = $ConditionObject->ConditionMatchStateLock(
        ObjectName => 'ITSMChange',
        Selector   => 234,
        StateID    => 123,
        UserID     => 1,
    );

=cut

sub ConditionMatchStateLock {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ObjectName Selector StateID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get id of object
    my $ObjectID = $Self->ObjectLookup(
        Name   => $Param{ObjectName},
        UserID => $Param{UserID},
    );

    # check error
    return if !$ObjectID;

    # get id of operator;
    my $OperatorName = 'lock';
    my $OperatorID   = $Self->OperatorLookup(
        Name   => $OperatorName,
        UserID => $Param{UserID},
    );

    # check error
    return if !$OperatorID;

    # get conditions
    my $Conditions = $Self->_ConditionListByObject(
        ObjectName => $Param{ObjectName},
        Selector   => $Param{Selector},
        UserID     => $Param{UserID},
    ) || [];

    # check error
    return if !@{$Conditions};

    # get all actions affecting this object
    my @AffectedConditionIDs;
    CONDITIONID:
    for my $ConditionID ( @{$Conditions} ) {

        # get actions for this condition
        my $ActionIDsRef = $Self->ActionList(
            ConditionID => $ConditionID,
            UserID      => $Param{UserID},
        ) || [];

        # check actions
        next CONDITIONID if !@{$ActionIDsRef};

        # check for actions
        ACTIONID:
        for my $ActionID ( @{$ActionIDsRef} ) {

            # get action
            my $Action = $Self->ActionGet(
                ActionID => $ActionID,
                UserID   => $Param{UserID},
            );

            # check action
            next ACTIONID if !$Action;

            # store only affected actions
            if (
                $Action->{ObjectID} eq $ObjectID
                && $Action->{OperatorID} eq $OperatorID
                && (
                    $Action->{Selector} eq $Param{Selector}
                    || $Action->{Selector} eq 'all'
                )
                && $Action->{ActionValue} eq $Param{StateID}
                )
            {
                push @AffectedConditionIDs, $Action->{ConditionID};

                # found a condition with an affected action
                # so we can move on to the next condition
                next CONDITIONID;
            }
        }
    }

    # check for affected conditions
    return if !@AffectedConditionIDs;

    # check for positive condition matches
    AFFECTEDCONDITIONID:
    for my $AffectedConditionID (@AffectedConditionIDs) {

        # get condition match
        my $ConditionMatch = $Self->_ConditionMatch(
            ConditionID => $AffectedConditionID,
            UserID      => $Param{UserID},
        );

        next AFFECTEDCONDITIONID if !$ConditionMatch;

        # condition matched successfully
        return 1 if $ConditionMatch;
    }

    # no condition matched
    return;
}

=item ConditionCompareValueFieldType()

Returns the type of the compare value field as string, based on the given object id and attribute id.

    my $FieldType = $ConditionObject->ConditionCompareValueFieldType(
        ObjectID    => 1234,
        AttributeID => 5,
        UserID      => 1,
    );

Returns 'Text' or 'Selection' or 'Date'.

TODO: Add 'Autocomplete' type for ChangeBuilder, ChangeManager, WorkOrderAgent, etc...

=cut

sub ConditionCompareValueFieldType {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ObjectID AttributeID UserID)) {
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

    # check error
    if ( !$ObjectName ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ObjectID $Param{ObjectID} does not exist!",
        );
        return;
    }

    # lookup attribute name
    my $AttributeName = $Self->AttributeLookup(
        AttributeID => $Param{AttributeID},
    );

    # check error
    if ( !$AttributeName ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "AttributeID $Param{AttributeID} does not exist!",
        );
        return;
    }

    # get the field type config for the given object
    my $Config = $Kernel::OM->Get('Kernel::Config')->Get( $ObjectName . '::Attribute::CompareValue::FieldType' );

    # check error
    return if !$Config;

    # remove the name part of the dynamic field and replace only with the string "DynamicField"
    $AttributeName =~ s{ \A DynamicField_ (\w+) }{DynamicField}xms;

    # get the field type for the given attribute or return the default field type 'Selection'
    my $FieldType = $Config->{$AttributeName} || 'Selection';

    return $FieldType;
}

=item ConditionListByObjectType()

Return a list of all conditions ids of a given change id as array reference.
Only the ids of a condition are returned where object type and identifier are matching.

    my $ConditionIDsRef = $ConditionObject->ConditionListByObjectType(
        ObjectType => 'ITSMWorkOrder'
        Selector   => 1234,
        ChangeID   => 5,
        UserID     => 1,
    );

=cut

sub ConditionListByObjectType {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ObjectType Selector ChangeID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get conditions of change
    my $ChangeConditions = $Self->ConditionList(
        ChangeID => $Param{ChangeID},
        UserID   => $Param{UserID},
        Valid    => 0,
    );

    # check conditions
    return if !$ChangeConditions;

    # get expressions of conditions
    my %ConditionExpression = map {
        $_ => $Self->ExpressionList(
            ConditionID => $_,
            UserID      => $Param{UserID},
            ) || []
    } @{$ChangeConditions};

    # get actions of conditions
    my %ConditionAction = map {
        $_ => $Self->ActionList(
            ConditionID => $_,
            UserID      => $Param{UserID},
            ) || []
    } @{$ChangeConditions};

    # get object id of object type
    my $ObjectID = $Self->ObjectLookup(
        Name   => $Param{ObjectType},
        UserID => $Param{UserID},
    );

    # check object id
    return if !$ObjectID;

    # get only affected unique condition id
    my @AffectedConditionIDs;
    CONDITIONID:
    for my $ConditionID ( sort keys %ConditionExpression ) {

        # check expression for this workorder
        EXPRESSIONID:
        for my $ExpressionID ( @{ $ConditionExpression{$ConditionID} } ) {

            # get expression
            my $Expression = $Self->ExpressionGet(
                ExpressionID => $ExpressionID,
                UserID       => $Param{UserID},
            );

            # check expression
            next EXPRESSIONID if !$Expression;

            # check for selector
            next EXPRESSIONID if $Expression->{Selector} ne $Param{Selector};

            # check for object type
            next EXPRESSIONID if $Expression->{ObjectID} ne $ObjectID;

            # check if this conditions is already on stack
            if ( !grep { $_ eq $ConditionID } @AffectedConditionIDs ) {

                # this expression is valid
                push @AffectedConditionIDs, $ConditionID;

                # jump to next condition
                next CONDITIONID;
            }
        }
    }

    CONDITIONID:
    for my $ConditionID ( sort keys %ConditionAction ) {

        # check action for this workorder
        ACTIONID:
        for my $ActionID ( @{ $ConditionAction{$ConditionID} } ) {

            # get action
            my $Action = $Self->ActionGet(
                ActionID => $ActionID,
                UserID   => $Param{UserID},
            );

            # check expression
            next ACTIONID if !$Action;

            # check for selector
            next ACTIONID if $Action->{Selector} ne $Param{Selector};

            # check for object type
            next ACTIONID if $Action->{ObjectID} ne $ObjectID;

            # check if this conditions is already on stack
            if ( !grep { $_ eq $ConditionID } @AffectedConditionIDs ) {

                # this expression is valid
                push @AffectedConditionIDs, $ConditionID;

                # jump to next condition
                next CONDITIONID;
            }
        }
    }

    return \@AffectedConditionIDs;
}

=begin Internal:

=item _ConditionMatch()

This function matches the given condition and executes 'no' actions.
The optional parameter 'AttributesChanged' defines a list of attributes that were changed
during e.g. a ChangeUpdate-Event. If a condition matches an expression, the attribute of the expression
must be listed in 'AttributesChanged'.

    my $Success = $ConditionObject->_ConditionMatch(
        ConditionID       => 123,
        AttributesChanged => { ITSMChange => [ ChangeTitle, ChangeDescription] },  # (optional)
        UserID            => 1,
    );

=cut

sub _ConditionMatch {
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

    # get condition data
    my $ConditionData = $Self->ConditionGet(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # check error
    return if !$ConditionData;

    # get all expressions for the given condition id
    my $ExpressionIDsRef = $Self->ExpressionList(
        ConditionID => $Param{ConditionID},
        UserID      => $Param{UserID},
    );

    # check errors
    return if !$ExpressionIDsRef;
    return if ref $ExpressionIDsRef ne 'ARRAY';

    # no error if just no expressions were found
    return 0 if !@{$ExpressionIDsRef};

    # count the number of expression ids
    my $ExpressionIDCount = scalar @{$ExpressionIDsRef};

    # to store the number of positive (true) expressions
    my @ExpressionMatchResult;

    # to store if the condition matches
    my $ConditionMatch;

    # try to match each expression
    EXPRESSIONID:
    for my $ExpressionID ( @{$ExpressionIDsRef} ) {

        # normally give the list of changed attributes to ExpressionMatch() function
        my $AttributesChanged = $Param{AttributesChanged};

        # expression conjunction is 'all' and there is more than one expresion
        if ( $ConditionData->{ExpressionConjunction} eq 'all' && $ExpressionIDCount > 1 ) {

            # do not give the list of changed attributes to ExpressionMatch()
            $AttributesChanged = undef;
        }

        # match expression
        my $ExpressionMatch = $Self->ExpressionMatch(
            ExpressionID      => $ExpressionID,
            AttributesChanged => $AttributesChanged,
            UserID            => $Param{UserID},
        ) || 0;

        # set ConditionMatch true if ExpressionMatch is true and 'any' is requested
        if ( $ConditionData->{ExpressionConjunction} eq 'any' && $ExpressionMatch ) {
            return 1;
        }

        # condition is false at all, so return true
        if ( $ConditionData->{ExpressionConjunction} eq 'all' && !$ExpressionMatch ) {
            return 0;
        }

        # save current expression match result for later checks
        push @ExpressionMatchResult, $ExpressionMatch;
    }

    # count all results which have a true value
    my $TrueCount = scalar grep { $_ == 1 } @ExpressionMatchResult;

    # if the condition did not match already, and not all expressions are true
    if ( !$ConditionMatch && $TrueCount != $ExpressionIDCount ) {

        # not all expressions have matched
        return 0;
    }

    return 1;
}

=item _ConditionListByObject()

return a list of all conditions ids of a given object.

    my $ConditionIDsRef = $ConditionObject->_ConditionListByObject(
        ObjectName => 'ITSMChange'
        Selector   => 123,
        UserID     => 1,
    );

=cut

sub _ConditionListByObject {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ObjectName Selector UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get change id
    my $ChangeID;

    if ( $Param{ObjectName} eq 'ITSMChange' ) {

        # selector is needed change id
        $ChangeID = $Param{Selector};
    }
    elsif ( $Param{ObjectName} eq 'ITSMWorkOrder' ) {

        # get object backend
        my $BackendObject = $Kernel::OM->Get('Kernel::System::ITSMChange::ITSMCondition::Object::ITSMWorkOrder');

        # check for error
        return if !$BackendObject;

        # define default functions for backend
        my $Sub = 'DataGet';

        # check for available function
        if ( !$BackendObject->can($Sub) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "No function '$Sub' available for backend '$Param{ObjectName}'!",
            );
            return;
        }

        # execute the subroutine
        my $WorkOrder = $BackendObject->$Sub(
            Selector => $Param{Selector},
            UserID   => $Param{UserID},
        ) || {};

        return if !$WorkOrder;

        # get change id
        $ChangeID = $WorkOrder->[0]->{ChangeID};
    }

    # check change id
    return if !$ChangeID;

    # get conditions for this change
    my $Conditions = $Self->ConditionList(
        ChangeID => $ChangeID,
        UserID   => $Param{UserID},
    );

    return $Conditions;
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
