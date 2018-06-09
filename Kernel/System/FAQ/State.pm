# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::FAQ::State;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::FAQ::State - sub module of Kernel::System::FAQ

=head1 SYNOPSIS

All FAQ state functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item StateAdd()

add a state

    my $Success = $FAQObject->StateAdd(
        Name   => 'public',
        TypeID => 1,
        UserID => 1,
    );

Returns:

    $Success = 1;               # or undef if state could not be added

=cut

sub StateAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Name TypeID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => '
            INSERT INTO faq_state (name, type_id)
            VALUES ( ?, ? )',
        Bind => [ \$Param{Name}, \$Param{TypeID} ],
    );

    return 1;
}

=item StateGet()

get a state as hash

    my %State = $FAQObject->StateGet(
        StateID => 1,
        UserID  => 1,
    );

Returns:

    %State = (
        StateID  => 1,
        Name     => 'internal (agent)',
        TypeID   => 1,
    );

=cut

sub StateGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(StateID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # SQL
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, name, type_id
            FROM faq_state
            WHERE id = ?',
        Bind  => [ \$Param{StateID} ],
        Limit => 1,
    );

    my %Data;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        %Data = (
            StateID => $Row[0],
            Name    => $Row[1],
            TypeID  => $Row[2],
        );
    }

    return %Data;
}

=item StateList()

get the state list as hash

    my %States = $FAQObject->StateList(
        UserID => 1,
    );

Returns:

    %States = (
        1 => 'internal (agent)',
        2 => 'external (customer)',
        3 => 'public (all)',
    );

=cut

sub StateList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );

        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # SQL
    return if !$DBObject->Prepare(
        SQL => '
            SELECT id, name
            FROM faq_state'
    );

    my %List;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $List{ $Row[0] } = $Row[1];
    }

    return %List;
}

=item StateUpdate()

update a state

    my Success = $FAQObject->StateUpdate(
        StateID => 1,
        Name    => 'public',
        TypeID  => 1,
        UserID  => 1,
    );

Returns:

    Success = 1;             # or undef if state could not be updated

=cut

sub StateUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(StateID Name TypeID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );

            return;
        }
    }

    # SQL
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => '
            UPDATE faq_state
            SET name = ?, type_id = ?,
            WHERE id = ?',
        Bind => [ \$Param{Name}, \$Param{TypeID}, \$Param{StateID} ],
    );

    return 1;
}

=item StateTypeGet()

get a state as hash reference

    my $StateTypeHashRef = $FAQObject->StateTypeGet(
        StateID => 1,
        UserID  => 1,
    );

Or

    my $StateTypeHashRef = $FAQObject->StateTypeGet(
        Name    => 'internal',
        UserID  => 1,
    );

Returns:

    $StateTypeHashRef = {
        'StateID' => 1,
        'Name'    => 'internal',
    };

=cut

sub StateTypeGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );

        return;
    }

    my $SQL = '
        SELECT id, name
        FROM faq_state_type
        WHERE';
    my @Bind;
    my $CacheKey = 'StateTypeGet::';
    if ( defined $Param{StateID} ) {
        $SQL .= ' id = ?';
        push @Bind, \$Param{StateID};
        $CacheKey .= 'ID::' . $Param{StateID};
    }
    elsif ( defined $Param{Name} ) {
        $SQL .= ' name = ?';
        push @Bind, \$Param{Name};
        $CacheKey .= 'Name::' . $Param{Name};
    }

    # get cache object
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    # check cache
    my $Cache = $CacheObject->Get(
        Type => 'FAQ',
        Key  => $CacheKey,
    );

    return $Cache if $Cache;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # SQL
    return if !$DBObject->Prepare(
        SQL  => $SQL,
        Bind => \@Bind,
    );

    my %Data;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        %Data = (
            StateID => $Row[0],
            Name    => $Row[1],
        );
    }

    # cache result
    $CacheObject->Set(
        Type  => 'FAQ',
        Key   => $CacheKey,
        Value => \%Data,
        TTL   => 60 * 60 * 24 * 2,
    );

    return \%Data;
}

=item StateTypeList()

get the state type list as hash reference

    my $StateTypeHashRef = $FAQObject->StateTypeList(
        UserID => 1,
    );

optional, get state type list for some states:

    my $StateTypeHashRef = $FAQObject->StateTypeList(
        Types  => [ 'public', 'internal'],
        UserID => 1,
    );

Returns:

    $StateTypeHashRef = {
        1 => 'internal',
        3 => 'public',
        2 => 'external',
    };

=cut

sub StateTypeList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );

        return;
    }

    # build SQL
    my $SQL = '
        SELECT id, name
        FROM faq_state_type';

    # types are given
    if ( $Param{Types} ) {

        if ( ref $Param{Types} ne 'ARRAY' ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => 'Types should be an array reference!',
            );
        }

        # call StateTypeList without parameters to validate Types
        my $StateTypeList = $Self->StateTypeList( UserID => $Param{UserID} );
        my %StateTypes = reverse %{$StateTypeList};
        my @Types;

        # only add types to list that exist
        TYPE:
        for my $Type ( @{ $Param{Types} } ) {
            next TYPE if !$StateTypes{$Type};
            push @Types, "'$Type'";
        }

        # create string
        if (@Types) {
            $SQL .= ' WHERE name IN ( ' . join( ', ', @Types ) . ' )';
        }
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # prepare SQL
    return if !$DBObject->Prepare( SQL => $SQL );

    # fetch the result
    my %List;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $List{ $Row[0] } = $Row[1];
    }

    return \%List;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
