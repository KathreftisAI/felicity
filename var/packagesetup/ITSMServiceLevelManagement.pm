# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::ITSMServiceLevelManagement;    ## no critic

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Stats',
    'Kernel::System::SysConfig',
);

=head1 NAME

ITSMServiceLevelManagement.pm - code to excecute during package installation

=head1 SYNOPSIS

All functions

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CodeObject = $Kernel::OM->Get('var::packagesetup::ITSMServiceLevelManagement');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # rebuild ZZZ* files
    $Kernel::OM->Get('Kernel::System::SysConfig')->WriteDefault();

    # define the ZZZ files
    my @ZZZFiles = (
        'ZZZAAuto.pm',
        'ZZZAuto.pm',
    );

    # reload the ZZZ files (mod_perl workaround)
    for my $ZZZFile (@ZZZFiles) {

        PREFIX:
        for my $Prefix (@INC) {
            my $File = $Prefix . '/Kernel/Config/Files/' . $ZZZFile;
            next PREFIX if !-f $File;
            do $File;
            last PREFIX;
        }
    }

    # always discard the config object before package code is executed,
    # to make sure that the config object will be created newly, so that it
    # will use the recently written new config from the package
    $Kernel::OM->ObjectsDiscard(
        Objects => ['Kernel::Config'],
    );

    # the stats object needs a UserID parameter for the constructor
    # we need to discard any existing stats object before
    $Kernel::OM->ObjectsDiscard(
        Objects => ['Kernel::System::Stats'],
    );

    # define UserID parameter for the constructor of the stats object
    $Kernel::OM->ObjectParamAdd(
        'Kernel::System::Stats' => {
            UserID => 1,
        },
    );

    # define file prefix
    $Self->{FilePrefix} = 'ITSMStats';

    return $Self;
}

=item CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    # install stats
    $Kernel::OM->Get('Kernel::System::Stats')->StatsInstall(
        FilePrefix => $Self->{FilePrefix},
        UserID     => 1,
    );

    return 1;
}

=item CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    # install stats
    $Kernel::OM->Get('Kernel::System::Stats')->StatsInstall(
        FilePrefix => $Self->{FilePrefix},
        UserID     => 1,
    );

    return 1;
}

=item CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    # install stats
    $Kernel::OM->Get('Kernel::System::Stats')->StatsInstall(
        FilePrefix => $Self->{FilePrefix},
        UserID     => 1,
    );

    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    # uninstall stats
    $Kernel::OM->Get('Kernel::System::Stats')->StatsUninstall(
        FilePrefix => $Self->{FilePrefix},
        UserID     => 1,
    );

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
