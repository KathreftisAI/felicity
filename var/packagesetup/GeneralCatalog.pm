# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::GeneralCatalog;    ## no critic

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::SysConfig',
);

=head1 NAME

GeneralCatalog.pm - code to execute during package installation

=head1 SYNOPSIS

All functions

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CodeObject = $Kernel::OM->Get('var::packagesetup::GeneralCatalog');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # always discard the config object before package code is executed,
    # to make sure that the config object will be created newly, so that it
    # will use the recently written new config from the package
    $Kernel::OM->ObjectsDiscard(
        Objects => ['Kernel::Config'],
    );

    return $Self;
}

=item CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    # migrate 'functionality' to external table
    # this is only neccesary in CodeUpgrade, for new installations this is done
    # in the package ITSMCore during CodeInstall
    $Self->_MigrateFunctionality();

    return 1;
}

=item CodeUpgradeFromLowerThan_4_0_91()

This function is only executed if the installed module version is smaller than 4.0.91.

my $Result = $CodeObject->CodeUpgradeFromLowerThan_4_0_91();

=cut

sub CodeUpgradeFromLowerThan_4_0_91 {    ## no critic
    my ( $Self, %Param ) = @_;

    # change configurations to match the new module location.
    $Self->_MigrateConfigs();

    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item _MigrateFunctionality()

=cut

sub _MigrateFunctionality {
    my ( $Self, %Param ) = @_;

    # SELECT all functionality values
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT id, functionality FROM general_catalog',
    );

    my @List;
    ROW:
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        next ROW if !$Row[1];

        push @List, \@Row;
    }

    # save entries in new table
    for my $Entry (@List) {
        $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL =>
                'INSERT INTO general_catalog_preferences( general_catalog_id, pref_key, pref_value )'
                . ' VALUES( ?, \'Functionality\', ? )',
            Bind => [ \$Entry->[0], \$Entry->[1] ],
        );
    }

    # drop column functionality
    my ($Drop) = $Kernel::OM->Get('Kernel::System::DB')->SQLProcessor(
        Database => [
            {
                Tag     => 'TableAlter',
                Name    => 'general_catalog',
                TagType => 'Start',
            },
            {
                Tag     => 'ColumnDrop',
                Name    => 'functionality',
                TagType => 'Start',
            },
            {
                Tag     => 'TableAlter',
                TagType => 'End',
            },
        ],
    );

    $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => $Drop,
    );

    return 1;
}

=item _MigrateConfigs()

change configurations to match the new module location.

    my $Result = $CodeObject->_MigrateConfigs();

=cut

sub _MigrateConfigs {

    # create needed objects
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    # migrate GeneralCatalog Preferences
    # get setting content for GeneralCatalog Preferences
    my $Setting = $ConfigObject->Get('GeneralCatalogPreferences');

    CONFIGITEM:
    for my $MenuModule ( sort keys %{$Setting} ) {

        # update module location
        my $Module = $Setting->{$MenuModule}->{'Module'};
        if ( $Module !~ m{Kernel::Output::HTML::GeneralCatalogPreferences(\w+)} ) {
            next CONFIGITEM;
        }

        $Setting->{$MenuModule}->{Module} = "Kernel::Output::HTML::GeneralCatalogPreferences::Generic";

        # set new setting,
        my $Success = $SysConfigObject->ConfigItemUpdate(
            Valid => 1,
            Key   => 'GeneralCatalogPreferences###' . $MenuModule,
            Value => $Setting->{$MenuModule},
        );
    }

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This Software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
