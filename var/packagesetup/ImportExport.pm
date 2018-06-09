# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::ImportExport;    ## no critic

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::DB',
    'Kernel::Config',
    'Kernel::System::SysConfig',
);

=head1 NAME

ImportExport.pm - code to excecute during package installation

=head1 SYNOPSIS

All functions

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CodeObject = $Kernel::OM->Get('var::packagesetup::ImportExport');

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

    return 1;
}

=item CodeUpgradeFromBefore_2_0_3()

This function is only executed if the installed module version is smaller than 2.0.3.

    my $Result = $CodeObject->CodeUpgradeFromBefore_2_0_3();

=cut

sub CodeUpgradeFromBefore_2_0_3 {    ## no critic
    my ( $Self, %Param ) = @_;

    # fix a typo in the database
    $Self->_FixDatabaseTypo();

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

=begin Internal:

=item _FixDatabaseTypo()

    my $Result = $CodeObject->_FixDatabaseTypo();

=cut

sub _FixDatabaseTypo {
    my ( $Self, %Param ) = @_;

    # fix the ColumnSeperator typo (correct is ColumnSeparator)
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => "UPDATE imexport_format "
            . "SET data_key = 'ColumnSeparator' "
            . "WHERE data_key = 'ColumnSeperator'",
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

    # migrate ImportExport config
    # get setting content for ImportExport config
    my $Setting = $ConfigObject->Get('Frontend::Module');

    # update module location
    $Setting->{'AdminImportExport'}->{NavBarModule}->{Module} = "Kernel::Output::HTML::NavBar::ModuleAdmin";

    # set new setting,
    my $Success = $SysConfigObject->ConfigItemUpdate(
        Valid => 1,
        Key   => 'Frontend::Module###AdminImportExport',
        Value => $Setting->{'AdminImportExport'},
    );

    return 1;
}

1;

=end Internal:

=back

=head1 TERMS AND CONDITIONS

This Software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
