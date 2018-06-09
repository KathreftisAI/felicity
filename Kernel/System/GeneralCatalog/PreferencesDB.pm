# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::GeneralCatalog::PreferencesDB;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::GeneralCatalog::PreferencesDB - some preferences functions for general catalog

=head1 SYNOPSIS

some preferences functions for general catalog

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $GeneralCatalogPreferencesDBObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog::PreferencesDB');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # preferences table data
    $Self->{PreferencesTable}      = 'general_catalog_preferences';
    $Self->{PreferencesTableKey}   = 'pref_key';
    $Self->{PreferencesTableValue} = 'pref_value';
    $Self->{PreferencesTableGcID}  = 'general_catalog_id';

    return $Self;
}

=item GeneralCatalogPreferencesSet()

Set preferences for an item

    $PreferencesObject->GeneralCatalogPreferencesSet(
        ItemID => 1234,
        Key    => 'Functionality',
        Value  => 'operational',
    );

=cut

sub GeneralCatalogPreferencesSet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ItemID Key Value)) {
        if ( !defined( $Param{$Needed} ) ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # delete old data
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => "DELETE FROM $Self->{PreferencesTable} WHERE "
            . "$Self->{PreferencesTableGcID} = ? AND $Self->{PreferencesTableKey} = ?",
        Bind => [
            \$Param{ItemID},
            \$Param{Key},
        ],
    );

    # insert new data
    return $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => "INSERT INTO $Self->{PreferencesTable} ($Self->{PreferencesTableGcID}, "
            . " $Self->{PreferencesTableKey}, $Self->{PreferencesTableValue}) "
            . " VALUES (?, ?, ?)",
        Bind => [
            \$Param{ItemID},
            \$Param{Key},
            \$Param{Value},
        ],
    );
}

=item GeneralCatalogPreferencesGet()

Get all Preferences for an item

    my %Preferences = $PreferencesObject->GeneralCatalogPreferencesGet(
        ItemID => 123,
    );

=cut

sub GeneralCatalogPreferencesGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(ItemID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # check if queue preferences are available
    if ( !$Kernel::OM->Get('Kernel::Config')->Get('GeneralCatalogPreferences') ) {
        return;
    }

    # get preferences
    return if !$Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => "SELECT $Self->{PreferencesTableKey}, $Self->{PreferencesTableValue} "
            . " FROM $Self->{PreferencesTable} WHERE $Self->{PreferencesTableGcID} = ?",
        Bind => [ \$Param{ItemID} ],
    );

    my %Data;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $Data{ $Row[0] } = $Row[1];
    }

    # return data
    return %Data;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
