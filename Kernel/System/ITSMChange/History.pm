# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ITSMChange::History;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::Log',
    'Kernel::System::User',
);

=head1 NAME

Kernel::System::ITSMChange::History - all change and workorder history functions

=head1 SYNOPSIS

All history functions.

=head1 PUBLIC INTERFACE

=over 4

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $HistoryObject = $Kernel::OM->Get('Kernel::System::ITSMChange::History');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # get the cache type and TTL (in seconds)
    $Self->{CacheType} = 'ITSMChangeManagement';
    $Self->{CacheTTL}  = $Kernel::OM->Get('Kernel::Config')->Get('ITSMChange::CacheTTL') * 60;

    # set default debug flag
    $Self->{Debug} ||= 0;

    return $Self;
}

=item HistoryAdd()

Adds a single history entry to the history. Returns 1 on success, C<undef> otherwise.

    my $Success = $HistoryObject->HistoryAdd(
        ChangeID      => 1234,                     # either ChangeID or WorkOrderID is needed
        WorkOrderID   => 123,                      # either ChangeID or WorkOrderID is needed
        HistoryType   => 'WorkOrderAdd',           # either HistoryType or HistoryTypeID is needed
        HistoryTypeID => 1,                        # either HistoryType or HistoryTypeID is needed
        Fieldname     => 'Justification',          # optional
        ContentNew    => 'Any useful information', # optional
        ContentOld    => 'Old value of field',     # optional
        UserID        => 1,
    );

=cut

sub HistoryAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    # ChangeID is always needed, workorder id is only needed for workorder events
    for my $Needed (qw(UserID ChangeID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # either HistoryType or HistoryTypeID is needed
    if ( !( $Param{HistoryType} || $Param{HistoryTypeID} ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need HistoryType or HistoryTypeID!',
        );
        return;
    }

    # get history type id from history type if history type is given
    if ( $Param{HistoryType} ) {

        # lookup the history type id
        my $ID = $Self->HistoryTypeLookup(
            HistoryType => $Param{HistoryType},
        );

        # no valid history type given
        if ( !$ID ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Invalid history type '$Param{HistoryType}' given!",
            );
            return;
        }

        $Param{HistoryTypeID} = $ID;
    }

    # convert array params
    CONTENT:
    for my $Content (qw(ContentNew ContentOld)) {
        next CONTENT if ref $Param{$Content} ne 'ARRAY';
        $Param{$Content} = join ', ', @{ $Param{$Content} };
    }

    # insert history entry
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'INSERT INTO change_history ( change_id, workorder_id, content_new, '
            . 'content_old, create_by, create_time, type_id, fieldname ) '
            . 'VALUES ( ?, ?, ?, ?, ?, current_timestamp, ?, ? )',
        Bind => [
            \$Param{ChangeID},
            \$Param{WorkOrderID},
            \$Param{ContentNew},
            \$Param{ContentOld},
            \$Param{UserID},
            \$Param{HistoryTypeID},
            \$Param{Fieldname},
        ],
    );

    return 1;
}

=item HistoryAddMultiple()

Adds multiple history entries to the history. Returns 1 on success, C<undef> otherwise.

    my $Success = $HistoryObject->HistoryAddMultiple(
        Data => \@HistoryAddData,
    );

=cut

sub HistoryAddMultiple {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Data} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need Data!",
        );
        return;
    }

    # check needed stuff
    if ( ref $Param{Data} ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Data must be an array reference!",
        );
        return;
    }

    # check needed stuff
    if ( !@{ $Param{Data} } ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Data array must not be empty!",
        );
        return;
    }

    # define database specific SQL for the multiline inserts
    my %DatabaseSQL;

    # mysql
    $DatabaseSQL{mysql} = {
        Start => 'INSERT INTO change_history ( change_id, workorder_id, content_new, '
            . 'content_old, create_by, create_time, type_id, fieldname ) ',
        FirstLine => 'VALUES ( ?, ?, ?, ?, ?, current_timestamp, ?, ? )',
        NextLine  => ', ( ?, ?, ?, ?, ?, current_timestamp, ?, ? ) ',
        End       => '',
    };

    # postgres 8.2 and newer (same SQL code as for mysql)
    $DatabaseSQL{postgres} = $DatabaseSQL{mysql};

    # oracle
    $DatabaseSQL{oracle} = {
        Start     => 'INSERT ALL ',
        FirstLine => 'INTO change_history ( change_id, workorder_id, content_new, '
            . 'content_old, create_by, create_time, type_id, fieldname )  '
            . 'VALUES ( ?, ?, ?, ?, ?, current_timestamp, ?, ? ) ',
        NextLine => 'INTO change_history ( change_id, workorder_id, content_new, '
            . 'content_old, create_by, create_time, type_id, fieldname )  '
            . 'VALUES ( ?, ?, ?, ?, ?, current_timestamp, ?, ? ) ',
        End => 'SELECT * FROM DUAL',
    };

    # get the database type
    my $DBType = $Kernel::OM->Get('Kernel::System::DB')->GetDatabaseFunction('Type');

    # make multiline inserts for defined databases
    if ( $DatabaseSQL{$DBType} ) {

        my $SQL = '';
        my @Bind;

        HISTORYENTRY:
        for my $HistoryEntry ( @{ $Param{Data} } ) {

            # check needed stuff
            # ChangeID is always needed, workorder id is only needed for workorder events
            for my $Needed (qw(UserID ChangeID)) {
                if ( !$HistoryEntry->{$Needed} ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message  => "Need $Needed!",
                    );
                    next HISTORYENTRY;
                }
            }

            # either HistoryType or HistoryTypeID is needed
            if ( !( $HistoryEntry->{HistoryType} || $HistoryEntry->{HistoryTypeID} ) ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => 'Need HistoryType or HistoryTypeID!',
                );
                next HISTORYENTRY;
            }

            # get history type id from history type if history type is given
            if ( $HistoryEntry->{HistoryType} ) {

                # lookup the history type id
                my $ID = $Self->HistoryTypeLookup(
                    HistoryType => $HistoryEntry->{HistoryType},
                );

                # no valid history type given
                if ( !$ID ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message  => "Invalid history type '$HistoryEntry->{HistoryType}' given!",
                    );
                    next HISTORYENTRY;
                }

                $HistoryEntry->{HistoryTypeID} = $ID;
            }

            # now the history entry is validated and can be added to sql
            if ( !$SQL ) {
                $SQL = $DatabaseSQL{$DBType}->{Start} . $DatabaseSQL{$DBType}->{FirstLine};
            }
            else {
                $SQL .= $DatabaseSQL{$DBType}->{NextLine};
            }

            # convert array params
            CONTENT:
            for my $Content (qw(ContentNew ContentOld)) {
                next CONTENT if ref $HistoryEntry->{$Content} ne 'ARRAY';
                $HistoryEntry->{$Content} = join ', ', @{ $HistoryEntry->{$Content} };
            }

            push @Bind, (
                \$HistoryEntry->{ChangeID},
                \$HistoryEntry->{WorkOrderID},
                \$HistoryEntry->{ContentNew},
                \$HistoryEntry->{ContentOld},
                \$HistoryEntry->{UserID},
                \$HistoryEntry->{HistoryTypeID},
                \$HistoryEntry->{Fieldname},
            );

            # check the length of the SQL string
            # (some databases only accept SQL strings up to 4k,
            # so we want to stay safe here with just 3500 bytes)
            if ( length $SQL > 3500 ) {

                # add the end line to sql string
                $SQL .= $DatabaseSQL{$DBType}->{End};

                # insert multiple history entries
                return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
                    SQL  => $SQL,
                    Bind => \@Bind,
                );

                # reset the SQL string and the Bind array
                $SQL  = '';
                @Bind = ();
            }
        }

        # if there is some SQL left to execute
        if ($SQL) {

            # add the end line to sql string
            $SQL .= $DatabaseSQL{$DBType}->{End};

            # insert multiple history entries
            return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
                SQL  => $SQL,
                Bind => \@Bind,
            );
        }
    }

    # database supports no multiline inserts, so we do it line by line
    else {

        my $Error;
        for my $HistoryEntry ( @{ $Param{Data} } ) {

            # add history entries one by one with the HistoryAdd function
            my $Success = $Self->HistoryAdd(
                %{$HistoryEntry},
            );

            # check error
            if ( !$Success ) {
                $Error = 1;
            }
        }

        return if $Error;
    }

    return 1;
}

=item WorkOrderHistoryGet()

Returns a list of all history entries that belong to the given WorkOrderID. The
list contains hash references with these information:

    $Info{HistoryEntryID}
    $Info{ChangeID}
    $Info{WorkOrderID}
    $Info{HistoryType}
    $Info{HistoryTypeID}
    $Info{Fieldname}
    $Info{ContentNew}
    $Info{ContentOld}
    $Info{CreateBy}
    $Info{CreateTime}
    $Info{UserID}
    $Info{UserLogin}
    $Info{UserLastname}
    $Info{UserFirstname}

    my $HistoryEntries = $HistoryObject->WorkOrderHistoryGet(
        WorkOrderID => 123,
        UserID   => 1,
    );

=cut

sub WorkOrderHistoryGet {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(WorkOrderID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # run the sql statement to get history
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT ch.id, change_id, workorder_id, content_new, content_old, '
            . 'ch.create_by, ch.create_time, type_id, cht.name, fieldname '
            . 'FROM change_history ch, change_history_type cht '
            . 'WHERE ch.type_id = cht.id '
            . 'AND workorder_id = ? ORDER BY ch.create_time, ch.id',
        Bind => [ \$Param{WorkOrderID} ],
    );

    # fetch the entries and save information in array
    my @HistoryEntries;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        my %HistoryEntry = (
            HistoryEntryID => $Row[0],
            ChangeID       => $Row[1],
            WorkOrderID    => $Row[2],
            ContentNew     => defined( $Row[3] ) ? $Row[3] : '',
            ContentOld     => defined( $Row[4] ) ? $Row[4] : '',
            CreateBy       => $Row[5],
            CreateTime     => $Row[6],
            HistoryTypeID  => $Row[7],
            HistoryType    => $Row[8],
            Fieldname      => $Row[9],
        );

        push @HistoryEntries, \%HistoryEntry;
    }

    # get more information about user who created entry
    for my $HistoryEntry (@HistoryEntries) {

        # get user name
        my %User = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
            UserID => $HistoryEntry->{CreateBy},
            Cache  => 1,
        );

        # save user info in history entry
        if (%User) {
            $HistoryEntry->{UserID}        = $User{UserID};
            $HistoryEntry->{UserLogin}     = $User{UserLogin};
            $HistoryEntry->{UserFirstname} = $User{UserFirstname};
            $HistoryEntry->{UserLastname}  = $User{UserLastname};
        }
    }

    return \@HistoryEntries;
}

=item ChangeHistoryGet()

Returns a list of all history entries that belong to the given ChangeID - including
history entries for workorders. The list contains hash references with these information:

    $Info{HistoryEntryID}
    $Info{ChangeID}
    $Info{WorkOrderID}
    $Info{HistoryType}
    $Info{HistoryTypeID}
    $Info{Fieldname}
    $Info{ContentNew}
    $Info{ContentOld}
    $Info{CreateBy}
    $Info{CreateTime}
    $Info{UserID}
    $Info{UserLogin}
    $Info{UserLastname}
    $Info{UserFirstname}

    my $HistoryEntries = $HistoryObject->ChangeHistoryGet(
        ChangeID => 123,
        UserID   => 1,
    );

=cut

sub ChangeHistoryGet {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(ChangeID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # run the sql statement to get history
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT ch.id, change_id, workorder_id, content_new, content_old, '
            . 'ch.create_by, ch.create_time, type_id, cht.name, fieldname '
            . 'FROM change_history ch, change_history_type cht '
            . 'WHERE ch.type_id = cht.id '
            . 'AND change_id = ? ORDER BY ch.create_time, ch.id',
        Bind => [ \$Param{ChangeID} ],
    );

    # fetch the entries and save information in array
    my @HistoryEntries;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        my %HistoryEntry = (
            HistoryEntryID => $Row[0],
            ChangeID       => $Row[1],
            WorkOrderID    => $Row[2],
            ContentNew     => defined( $Row[3] ) ? $Row[3] : '',
            ContentOld     => defined( $Row[4] ) ? $Row[4] : '',
            CreateBy       => $Row[5],
            CreateTime     => $Row[6],
            HistoryTypeID  => $Row[7],
            HistoryType    => $Row[8],
            Fieldname      => $Row[9],
        );

        # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000)
        $HistoryEntry{CreateTime}
            =~ s{ \A ( \d\d\d\d - \d\d - \d\d \s \d\d:\d\d:\d\d ) \. .+? \z }{$1}xms;

        push @HistoryEntries, \%HistoryEntry;
    }

    # get more information about user who created entry
    for my $HistoryEntry (@HistoryEntries) {

        # get user name
        my %User = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
            UserID => $HistoryEntry->{CreateBy},
            Cache  => 1,
        );

        # save user info in history entry
        if (%User) {
            $HistoryEntry->{UserID}        = $User{UserID};
            $HistoryEntry->{UserLogin}     = $User{UserLogin};
            $HistoryEntry->{UserFirstname} = $User{UserFirstname};
            $HistoryEntry->{UserLastname}  = $User{UserLastname};
        }
    }

    return \@HistoryEntries;
}

=item HistoryEntryGet()

Returns a single history entry. The hash reference has these information:

    $Info{HistoryEntryID}
    $Info{ChangeID}
    $Info{WorkOrderID}
    $Info{HistoryType}
    $Info{HistoryTypeID}
    $Info{Fieldname}
    $Info{ContentNew}
    $Info{ContentOld}
    $Info{CreateBy}
    $Info{CreateTime}
    $Info{UserID}
    $Info{UserLogin}
    $Info{UserLastname}
    $Info{UserFirstname}

    my $HistoryEntry = $HistoryObject->HistoryEntryGet(
        HistoryEntryID => 123,
        UserID         => 1,
    );

=cut

sub HistoryEntryGet {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(HistoryEntryID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # run the sql statement to get history
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT ch.id, change_id, workorder_id, content_new, content_old, '
            . 'ch.create_by, ch.create_time, type_id, cht.name, fieldname '
            . 'FROM change_history ch, change_history_type cht '
            . 'WHERE ch.type_id = cht.id '
            . 'AND ch.id = ?',
        Bind => [ \$Param{HistoryEntryID} ],
    );

    # fetch the entries and save information in array
    my %HistoryEntry;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        %HistoryEntry = (
            HistoryEntryID => $Row[0],
            ChangeID       => $Row[1],
            WorkOrderID    => $Row[2],
            ContentNew     => $Row[3],
            ContentOld     => $Row[4],
            CreateBy       => $Row[5],
            CreateTime     => $Row[6],
            HistoryTypeID  => $Row[7],
            HistoryType    => $Row[8],
            Fieldname      => $Row[9],
        );

        # cleanup time stamps (some databases are using e. g. 2008-02-25 22:03:00.000000)
        $HistoryEntry{CreateTime}
            =~ s{ \A ( \d\d\d\d - \d\d - \d\d \s \d\d:\d\d:\d\d ) \. .+? \z }{$1}xms;
    }

    # get user name
    my %User = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
        UserID => $HistoryEntry{CreateBy},
        Cache  => 1,
    );

    # save user info in history entry
    if (%User) {
        $HistoryEntry{UserID}        = $User{UserID};
        $HistoryEntry{UserLogin}     = $User{UserLogin};
        $HistoryEntry{UserFirstname} = $User{UserFirstname};
        $HistoryEntry{UserLastname}  = $User{UserLastname};
    }

    return \%HistoryEntry;
}

=item WorkOrderHistoryDelete()

Deletes all entries in history table that belongs to the given WorkOrderID.
The method returns 1 on success and C<undef> otherwise.

    my $Success = $HistoryObject->WorkOrderHistoryDelete(
        WorkOrderID => 123,
        UserID      => 1,
    );

=cut

sub WorkOrderHistoryDelete {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(WorkOrderID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # delete entries for the given workorder
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => 'DELETE FROM change_history WHERE workorder_id = ?',
        Bind => [ \$Param{WorkOrderID} ],
    );

    # success
    return 1;
}

=item ChangeHistoryDelete()

Deletes all entries in history table that belongs to the given ChangeID.
The method returns 1 on success and C<undef> otherwise.

    my $Success = $HistoryObject->ChangeHistoryDelete(
        ChangeID => 123,
        UserID   => 1,
    );

=cut

sub ChangeHistoryDelete {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(ChangeID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # delete entries for the given change
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => 'DELETE FROM change_history WHERE change_id = ?',
        Bind => [ \$Param{ChangeID} ],
    );

    # success
    return 1;
}

=item HistoryUpdate()

This method updates a history entry. It returns 1 on success, and C<undef> otherwise.

    my $Success = $HistoryObject->HistoryUpdate(
        HistoryEntryID => 123,
        WorkOrderID    => 3451,         # optional
        ChangeID       => 1235,         # optional
        ContentNew     => 'new value',  # optional
        ContentOld     => 'old value',  # optional
        UserID         => 1,
    );

=cut

sub HistoryUpdate {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(HistoryEntryID UserID)) {
        if ( !$Param{$Attribute} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # get history entry id and user id
    my $HistoryEntryID = delete $Param{HistoryEntryID};
    my $UserID         = delete $Param{UserID};

    # we have to update at least one column
    if ( !keys %Param ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need at least one column to update!',
        );
        return;
    }

    # what columns should be updated
    my @Columns = keys %Param;
    my @Bind;

    # get bind variables
    for my $Column (@Columns) {
        push @Bind, \$Param{$Column};
    }

    # get bind string
    my %ParamKey2ColumnName = (
        ChangeID      => 'change_id',
        WorkOrderID   => 'workorder_id',
        ContentNew    => 'content_new',
        ContentOld    => 'content_old',
        HistoryTypeID => 'type_id',
        Fieldname     => 'fieldname',
    );
    my $Binds = join ', ', map { $ParamKey2ColumnName{$_} . ' = ? ' } @Columns;

    # do the update
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE change_history SET ' . $Binds . ' '
            . 'WHERE id = ?',
        Bind => [ @Bind, \$HistoryEntryID ],
    );

    return 1;
}

=item HistorySearch()

Searches for changes/workorders that matches the given search criteria. It returns
an array reference with change or workorder IDs. If "Result => 'COUNT'" then the
number of found changes is returned.

    my $IDs = $HistoryObject->HistorySearch(
        Type                => 'Change',       # Change|Workorder which IDs should be returned
        Attribute           => 'ChangeState',
        OldValues           => [ 'rejected' ], # optional - OldValues OR NewValues is needed
        NewValues           => [ 'approved' ], # optional - OldValues OR NewValues is needed
        ChangeBy            => [ 1, 2, 3 ],    # optional
        ChangeDateNewerDate => '2009-01-13 00:00:01', #optional
        ChangeDateOlderDate => '2009-01-13 00:00:01', #optional
        UserID              => 1,
        UsingWildcards      => 0,              # 0|1 - default 1
        Result              => 'ARRAY',        # ARRAY|COUNT - default ARRAY
    );

=cut

sub HistorySearch {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    for my $Attribute (qw(Type Attribute UserID)) {
        if ( !$Param{$Attribute} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Attribute!",
            );
            return;
        }
    }

    # verify that all passed array parameters contain an arrayref
    ARGUMENT:
    for my $Argument (
        qw(
        OldValues
        NewValues
        ChangeBy
        )
        )
    {
        if ( !defined $Param{$Argument} ) {
            $Param{$Argument} ||= [];

            next ARGUMENT;
        }

        if ( ref $Param{$Argument} ne 'ARRAY' ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Argument must be an array reference!",
            );
            return;
        }
    }

    # set default values
    if ( !defined $Param{UsingWildcards} ) {
        $Param{UsingWildcards} = 1;
    }

    # set the default behaviour for the return type
    my $Result = $Param{Result} || 'ARRAY';

    my @SQLWhere;    # assemble the conditions used in the WHERE clause

    # add string params to the WHERE clause
    my %StringParams = (

        # strings in change_history
        Attribute => 'ch.fieldname',
    );

    # add string params to sql-where-array
    STRINGPARAM:
    for my $StringParam ( sort keys %StringParams ) {

        # check string params for useful values, the string '0' is allowed
        next STRINGPARAM if !exists $Param{$StringParam};
        next STRINGPARAM if !defined $Param{$StringParam};
        next STRINGPARAM if $Param{$StringParam} eq '';

        # quote
        $Param{$StringParam} = $Kernel::OM->Get('Kernel::System::DB')->Quote( $Param{$StringParam} );

        # wildcards are used
        if ( $Param{UsingWildcards} ) {

            # get like escape string needed for some databases (e.g. oracle)
            my $LikeEscapeString = $Kernel::OM->Get('Kernel::System::DB')->GetDatabaseFunction('LikeEscapeString');

            # Quote
            $Param{$StringParam} = $Kernel::OM->Get('Kernel::System::DB')->Quote( $Param{$StringParam}, 'Like' );

            # replace * with %
            $Param{$StringParam} =~ s{ \*+ }{%}xmsg;

            # do not use string params which contain only %
            next STRINGPARAM if $Param{$StringParam} =~ m{ \A %* \z }xms;

            push @SQLWhere,
                "LOWER($StringParams{$StringParam}) LIKE LOWER('$Param{$StringParam}') $LikeEscapeString";
        }

        # no wildcards are used
        else {
            push @SQLWhere,
                "LOWER($StringParams{$StringParam}) = LOWER('$Param{$StringParam}')";
        }
    }

    # set array params
    my %ArrayParams = (
        OldValues => 'ch.content_old',
        NewValues => 'ch.content_new',
        ChangeBy  => 'ch.create_by',
    );

    # add array params to sql-where-array
    ARRAYPARAM:
    for my $ArrayParam ( sort keys %ArrayParams ) {

        # ignore empty lists
        next ARRAYPARAM if !@{ $Param{$ArrayParam} };

        # quote
        for my $OneParam ( @{ $Param{$ArrayParam} } ) {
            $OneParam = $Kernel::OM->Get('Kernel::System::DB')->Quote($OneParam);

            # for strings we need single quotes
            if ( $OneParam !~ m{ \A [+-]? \d+ (?:\.\d+)? \z }xms ) {
                $OneParam = "'$OneParam'";
            }
        }

        # create string
        my $InString = join ', ', @{ $Param{$ArrayParam} };

        push @SQLWhere, "$ArrayParams{$ArrayParam} IN ($InString)";
    }

    # set time params
    my %TimeParams = (

        # times in change_history
        ChangeTimeNewerDate => 'ch.create_time >=',
        ChangeTimeOlderDate => 'ch.create_time <=',
    );

    # check and add time params to WHERE
    TIMEPARAM:
    for my $TimeParam ( sort keys %TimeParams ) {

        next TIMEPARAM if !$Param{$TimeParam};

        if ( $Param{$TimeParam} !~ m{ \A \d\d\d\d-\d\d-\d\d \s \d\d:\d\d:\d\d \z }xms ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "The parameter $TimeParam has an invalid date format!",
            );

            return;
        }

        $Param{$TimeParam} = $Kernel::OM->Get('Kernel::System::DB')->Quote( $Param{$TimeParam} );

        # the time attributes of change_history show up in the WHERE clause
        push @SQLWhere, "$TimeParams{$TimeParam} '$Param{$TimeParam}'";
    }

    # create SQL statement
    my $Type = lc $Param{Type};
    my $SQL  = "SELECT DISTINCT ch.${Type}_id FROM change_history ch ";

    if ( $Result eq 'COUNT' ) {
        $SQL = "SELECT COUNT( DISTINCT( ch.${Type}_id ) ) FROM change_history ch ";
    }

    # add the WHERE clause
    if (@SQLWhere) {
        $SQL .= 'WHERE ';
        $SQL .= join ' AND ', map {"( $_ )"} @SQLWhere;
        $SQL .= ' ';
    }

    # ignore the parameter 'Limit' when result type is 'COUNT'
    if ( $Result eq 'COUNT' ) {
        delete $Param{Limit};
    }

    # ask database
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL   => $SQL,
        Limit => $Param{Limit},
    );

    # fetch the result
    my @IDs;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @IDs, $Row[0];
    }

    if ( $Result eq 'COUNT' ) {

        # return the COUNT(c.id) attribute
        return $IDs[0];
    }
    else {
        return \@IDs;
    }
}

=item HistoryTypeLookup()

This method does a lookup for a history type. If a history type id is given,
it returns the name of the history type. If a history type is given, the appropriate
id is returned.

    my $Name = $HistoryObject->HistoryTypeLookup(
        HistoryTypeID => 1234,
    );

    my $ID = $HistoryObject->HistoryTypeLookup(
        HistoryType => 'WorkOrderAdd',
    );

=cut

sub HistoryTypeLookup {
    my ( $Self, %Param ) = @_;

    # check for needed stuff
    if ( !$Param{HistoryTypeID} && !$Param{HistoryType} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need HistoryTypeID or HistoryType!',
        );
        return;
    }

    # if both valid keys are given, return
    if ( $Param{HistoryTypeID} && $Param{HistoryType} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need either HistoryTypeID OR HistoryType - not both!',
        );
        return;
    }

    # find out what the used key is
    my $Key = 'HistoryType';

    if ( $Param{HistoryTypeID} ) {
        $Key = 'HistoryTypeID';
    }

    # check the cache
    my $Cache = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => 'HistoryTypeLookup::' . $Key . '::' . $Param{$Key},
    );

    # if result is cached return that result
    return $Cache if $Cache;

    # set the appropriate SQL statement
    my $SQL = 'SELECT name FROM change_history_type WHERE id = ?';

    if ( $Key eq 'HistoryType' ) {
        $SQL = 'SELECT id FROM change_history_type WHERE name = ?';
    }

    # fetch the requested value
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL   => $SQL,
        Bind  => [ \$Param{$Key} ],
        Limit => 1,
    );

    my $Value;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $Value = $Row[0];
    }

    # save value in cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => 'HistoryTypeLookup::' . $Key . '::' . $Param{$Key},
        Value => $Value,
        TTL   => $Self->{CacheTTL},
    );

    return $Value;
}

=item HistoryTypeList()

returns an array reference with hashreferences. The key of the hashreference is the id
of an recipient and the name is the value.

=cut

sub HistoryTypeList {
    my ( $Self, %Param ) = @_;

    # check the cache
    my $Cache = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => 'HistoryTypeList',
    );

    # if result is cached return that result
    return $Cache if $Cache;

    # prepare db query
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id, name FROM change_history_type ORDER BY name',
    );

    # retrieve data
    my @HistoryTypes;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        my $Entry = {
            Key   => $Row[0],
            Value => $Row[1],
        };
        push @HistoryTypes, $Entry;
    }

    # save values in cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        Key   => 'HistoryTypeList',
        Value => \@HistoryTypes,
        TTL   => $Self->{CacheTTL},
    );

    return \@HistoryTypes;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
