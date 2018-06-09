# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Maint::Loader::CacheCleanup;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Loader',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Cleanup the CSS/JS loader cache.');

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Cleaning up the loader cache files...</yellow>\n");

    my @DeletedFiles = $Kernel::OM->Get('Kernel::System::Loader')->CacheDelete();
    $Self->Print("<green>Done.</green>\n");

    return $Self->ExitCodeOk();
}

1;
