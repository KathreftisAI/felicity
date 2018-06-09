# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::GeneralCatalog;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Cache',
    'Kernel::System::CheckItem',
    'Kernel::System::DB',
    'Kernel::System::Log',
    'Kernel::System::Main',
);

=head1 NAME

Kernel::System::GeneralCatalog - general catalog lib

=head1 SYNOPSIS

All general catalog functions.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # load generator preferences module
    my $GeneratorModule = $Kernel::OM->Get('Kernel::Config')->Get('GeneralCatalog::PreferencesModule')
        || 'Kernel::System::GeneralCatalog::PreferencesDB';
    if ( $Kernel::OM->Get('Kernel::System::Main')->Require($GeneratorModule) ) {
        $Self->{PreferencesObject} = $GeneratorModule->new(%Param);
    }

    # define cache settings
    $Self->{CacheType} = 'GeneralCatalog';
    $Self->{CacheTTL}  = 60 * 60 * 3;

    return $Self;
}

=item ClassList()

return an array reference of all general catalog classes

    my $ArrayRef = $GeneralCatalogObject->ClassList();

=cut

sub ClassList {
    my ( $Self, %Param ) = @_;

    # ask database
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT DISTINCT(general_catalog_class) '
            . 'FROM general_catalog ORDER BY general_catalog_class',
    );

    # fetch the result
    my @ClassList;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        push @ClassList, $Row[0];
    }

    # cache the result
    my $CacheKey = 'ClassList';
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \@ClassList,
    );

    return \@ClassList;
}

=item ClassRename()

rename a general catalog class

    my $True = $GeneralCatalogObject->ClassRename(
        ClassOld => 'ITSM::ConfigItem::State',
        ClassNew => 'ITSM::ConfigItem::DeploymentState',
    );

=cut

sub ClassRename {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ClassOld ClassNew)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # cleanup given params
    for my $Argument (qw(ClassOld ClassNew)) {
        $Kernel::OM->Get('Kernel::System::CheckItem')->StringClean(
            StringRef         => \$Param{$Argument},
            RemoveAllNewlines => 1,
            RemoveAllTabs     => 1,
            RemoveAllSpaces   => 1,
        );
    }

    return 1 if $Param{ClassNew} eq $Param{ClassOld};

    # check if new class name already exists
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL   => 'SELECT id FROM general_catalog WHERE general_catalog_class = ?',
        Bind  => [ \$Param{ClassNew} ],
        Limit => 1,
    );

    # fetch the result
    my $AlreadyExists = 0;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $AlreadyExists = 1;
    }

    if ($AlreadyExists) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't rename class $Param{ClassOld}! New classname already exists."
        );
        return;
    }

    # reset cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => $Self->{CacheType},
    );

    # rename general catalog class
    return $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE general_catalog SET general_catalog_class = ? '
            . 'WHERE general_catalog_class = ?',
        Bind => [ \$Param{ClassNew}, \$Param{ClassOld} ],
    );
}

=item ItemList()

returns a list as a hash reference of one general catalog class

    my $HashRef = $GeneralCatalogObject->ItemList(
        Class         => 'ITSM::Service::Type',
        Valid         => 0,                      # (optional) default 1
        Preferences   => {                       # (optional) default {}
            Permission => 2,                     # or whatever preferences can be used
        },
    );

=cut

sub ItemList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Class} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Class!'
        );
        return;
    }

    # set default value
    if ( !defined $Param{Valid} ) {
        $Param{Valid} = 1;
    }

    my $PreferencesCacheKey = '';
    my $PreferencesTable    = '';
    my $PreferencesWhere    = '';
    my @PreferencesBind;

    # handle given preferences
    if ( exists $Param{Preferences} && ref $Param{Preferences} eq 'HASH' ) {

        $PreferencesTable = ', general_catalog_preferences';
        my @Wheres;

        # add all preferences given to where-clause
        for my $Key ( sort keys %{ $Param{Preferences} } ) {

            if ( ref( $Param{Preferences}->{$Key} ) ne 'ARRAY' ) {
                $Param{Preferences}->{$Key} = [ $Param{Preferences}->{$Key} ];
            }

            push @Wheres, '(pref_key = ? AND pref_value IN ('
                . join( ', ', map {'?'} @{ $Param{Preferences}->{$Key} } )
                . '))';

            push @PreferencesBind, \$Key, map { \$_ } @{ $Param{Preferences}->{$Key} };

            # add functionality list to cache key
            $PreferencesCacheKey .= '####' if $PreferencesCacheKey;
            $PreferencesCacheKey .= join q{####}, $Key, map {$_} @{ $Param{Preferences}->{$Key} };
        }

        $PreferencesWhere = 'AND general_catalog.id = general_catalog_preferences.general_catalog_id';
        $PreferencesWhere .= ' AND ' . join ' AND ', @Wheres;
    }

    # create sql string
    my $SQL = "SELECT id, name FROM general_catalog $PreferencesTable "
        . "WHERE general_catalog_class = ? $PreferencesWhere ";
    my @BIND = ( \$Param{Class}, @PreferencesBind );

    # add valid string to sql string
    if ( $Param{Valid} ) {
        $SQL .= 'AND valid_id = 1 ';
    }

    # create cache key
    my $CacheKey = 'ItemList::' . $Param{Class} . '####' . $Param{Valid} . '####' . $PreferencesCacheKey;

    # check if result is already cached
    my $Cache = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if $Cache;

    # ask database
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL  => $SQL,
        Bind => \@BIND,
    );

    # fetch the result
    my %Data;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $Data{ $Row[0] } = $Row[1];
    }

    # just return without logging an error and without caching the empty result
    return if !%Data;

    # cache the result
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \%Data,
    );

    return \%Data;
}

=item ItemGet()

get item attributes

    my $ItemDataRef = $GeneralCatalogObject->ItemGet(
        ItemID => 3,
    );

    or

    my $ItemDataRef = $GeneralCatalogObject->ItemGet(
        Class => 'ITSM::Service::Type',
        Name  => 'Underpinning Contract',
    );

returns

    my $Item = {
        'ItemID'     => '23',
        'Class'      => 'ITSM::Service::Type',
        'Name'       => 'Underpinning Contract'
        'Comment'    => 'Some Comment',
        'ValidID'    => '1',
        'CreateTime' => '2012-01-12 09:36:24',
        'CreateBy'   => '1',
        'ChangeTime' => '2012-01-12 09:36:24',
        'ChangeBy'   => '1',
    };

=cut

sub ItemGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ItemID} && ( !$Param{Class} || $Param{Name} eq '' ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need ItemID OR Class and Name!'
        );
        return;
    }

    # create sql string
    my $SQL = 'SELECT id, general_catalog_class, name, valid_id, comments, '
        . 'create_time, create_by, change_time, change_by FROM general_catalog WHERE ';
    my @BIND;

    # add options to sql string
    if ( $Param{Class} && $Param{Name} ne '' ) {

        # check if result is already cached
        my $CacheKey = 'ItemGet::Class::' . $Param{Class} . '::' . $Param{Name};
        my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
            Type => $Self->{CacheType},
            Key  => $CacheKey,
        );
        return $Cache if $Cache;

        # add class and name to sql string
        $SQL .= 'general_catalog_class = ? AND name = ?';
        push @BIND, ( \$Param{Class}, \$Param{Name} );
    }
    else {

        # check if result is already cached
        my $CacheKey = 'ItemGet::ItemID::' . $Param{ItemID};
        my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
            Type => $Self->{CacheType},
            Key  => $CacheKey,
        );
        return $Cache if $Cache;

        # add item id to sql string
        $SQL .= 'id = ?';
        push @BIND, \$Param{ItemID};
    }

    # ask database
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL   => $SQL,
        Bind  => \@BIND,
        Limit => 1,
    );

    # fetch the result
    my %ItemData;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ItemData{ItemID}     = $Row[0];
        $ItemData{Class}      = $Row[1];
        $ItemData{Name}       = $Row[2];
        $ItemData{ValidID}    = $Row[3];
        $ItemData{Comment}    = $Row[4] || '';
        $ItemData{CreateTime} = $Row[5];
        $ItemData{CreateBy}   = $Row[6];
        $ItemData{ChangeTime} = $Row[7];
        $ItemData{ChangeBy}   = $Row[8];
    }

    # check item
    if ( !$ItemData{ItemID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Item not found in database!',
        );
        return;
    }

    # get general catalog preferences
    my %Preferences = $Self->GeneralCatalogPreferencesGet( ItemID => $ItemData{ItemID} );

    # merge hash
    if (%Preferences) {
        %ItemData = ( %ItemData, %Preferences );
    }

    # cache the result
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => 'ItemGet::Class::' . $ItemData{Class} . '::' . $ItemData{Name},
        Value => \%ItemData,
    );
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => 'ItemGet::ItemID::' . $ItemData{ItemID},
        Value => \%ItemData,
    );

    return \%ItemData;
}

=item ItemAdd()

add a new general catalog item

    my $ItemID = $GeneralCatalogObject->ItemAdd(
        Class         => 'ITSM::Service::Type',
        Name          => 'Item Name',
        ValidID       => 1,
        Comment       => 'Comment',              # (optional)
        UserID        => 1,
    );

=cut

sub ItemAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Class ValidID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # name must be not empty, but number zero (0) is allowed
    if ( $Param{Name} eq '' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need Name!",
        );
        return;
    }

    # set default values
    for my $Argument (qw(Comment)) {
        $Param{$Argument} ||= '';
    }

    # cleanup given params
    for my $Argument (qw(Class)) {
        $Kernel::OM->Get('Kernel::System::CheckItem')->StringClean(
            StringRef         => \$Param{$Argument},
            RemoveAllNewlines => 1,
            RemoveAllTabs     => 1,
            RemoveAllSpaces   => 1,
        );
    }
    for my $Argument (qw(Name Comment)) {
        $Kernel::OM->Get('Kernel::System::CheckItem')->StringClean(
            StringRef         => \$Param{$Argument},
            RemoveAllNewlines => 1,
            RemoveAllTabs     => 1,
        );
    }

    # find exiting item with same name
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id FROM general_catalog '
            . 'WHERE general_catalog_class = ? AND name = ?',
        Bind  => [ \$Param{Class}, \$Param{Name} ],
        Limit => 1,
    );

    # fetch the result
    my $NoAdd;
    while ( $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $NoAdd = 1;
    }

    # abort insert of new item, if item name already exists
    if ($NoAdd) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't add new item! General catalog item with same name already exists in this class.",
        );
        return;
    }

    # reset cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => $Self->{CacheType},
    );

    # insert new item
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'INSERT INTO general_catalog '
            . '(general_catalog_class, name, valid_id, comments, '
            . 'create_time, create_by, change_time, change_by) VALUES '
            . '(?, ?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{Class}, \$Param{Name},
            \$Param{ValidID},
            \$Param{Comment}, \$Param{UserID},
            \$Param{UserID},
        ],
    );

    # find id of new item
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id FROM general_catalog '
            . 'WHERE general_catalog_class = ? AND name = ?',
        Bind  => [ \$Param{Class}, \$Param{Name} ],
        Limit => 1,
    );

    # fetch the result
    my $ItemID;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $ItemID = $Row[0];
    }

    return $ItemID;
}

=item ItemUpdate()

update an existing general catalog item

    my $True = $GeneralCatalogObject->ItemUpdate(
        ItemID        => 123,
        Name          => 'Item Name',
        ValidID       => 1,
        Comment       => 'Comment',    # (optional)
        UserID        => 1,
    );

=cut

sub ItemUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(ItemID ValidID UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # name must be not empty, but number zero (0) is allowed
    if ( $Param{Name} eq '' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need Name!",
        );
        return;
    }

    # set default values
    for my $Argument (qw(Comment)) {
        $Param{$Argument} ||= '';
    }

    # cleanup given params
    for my $Argument (qw(Class)) {
        $Kernel::OM->Get('Kernel::System::CheckItem')->StringClean(
            StringRef         => \$Param{$Argument},
            RemoveAllNewlines => 1,
            RemoveAllTabs     => 1,
            RemoveAllSpaces   => 1,
        );
    }
    for my $Argument (qw(Name Comment)) {
        $Kernel::OM->Get('Kernel::System::CheckItem')->StringClean(
            StringRef         => \$Param{$Argument},
            RemoveAllNewlines => 1,
            RemoveAllTabs     => 1,
        );
    }

    # get class of item
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL   => 'SELECT general_catalog_class FROM general_catalog WHERE id = ?',
        Bind  => [ \$Param{ItemID} ],
        Limit => 1,
    );

    # fetch the result
    my $Class;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $Class = $Row[0];
    }

    if ( !$Class ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't update item! General catalog item not found in this class.",
        );
        return;
    }

    # find exiting item with same name
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL   => 'SELECT id FROM general_catalog WHERE general_catalog_class = ? AND name = ?',
        Bind  => [ \$Class, \$Param{Name} ],
        Limit => 1,
    );

    # fetch the result
    my $Update = 1;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        if ( $Param{ItemID} ne $Row[0] ) {
            $Update = 0;
        }
    }

    if ( !$Update ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message =>
                "Can't update item! General catalog item with same name already exists in this class.",
        );
        return;
    }

    # reset cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => $Self->{CacheType},
    );

    return $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE general_catalog SET '
            . 'name = ?, valid_id = ?, comments = ?, '
            . 'change_time = current_timestamp, change_by = ? '
            . 'WHERE id = ?',
        Bind => [
            \$Param{Name},
            \$Param{ValidID}, \$Param{Comment},
            \$Param{UserID},  \$Param{ItemID},
        ],
    );
}

=item GeneralCatalogPreferencesSet()

set GeneralCatalog preferences

    $GeneralCatalogObject->GeneralCatalogPreferencesSet(
        ItemID => 123,
        Key    => 'UserComment',
        Value  => 'some comment',
    );

=cut

sub GeneralCatalogPreferencesSet {
    my $Self = shift;

    # delete cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => $Self->{CacheType},
    );

    return $Self->{PreferencesObject}->GeneralCatalogPreferencesSet(@_);
}

=item GeneralCatalogPreferencesGet()

get GeneralCatalog preferences

    my %Preferences = $QueueObject->GeneralCatalogPreferencesGet(
        ItemID => 123,
    );

=cut

sub GeneralCatalogPreferencesGet {
    my $Self = shift;

    return $Self->{PreferencesObject}->GeneralCatalogPreferencesGet(@_);
}

1;

=back

=head1 TERMS AND CONDITIONS

This Software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
