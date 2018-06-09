# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Maint::SupportData::CollectAsynchronous;

use strict;
use warnings;

use base qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::SupportDataCollector',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Collects certain support data asynchronously.');

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Collecting asynchronous support data...</yellow>\n");

    my %Result = $Kernel::OM->Get('Kernel::System::SupportDataCollector')->CollectAsynchronous();

    if ( !$Result{Success} ) {
        $Self->PrintError("Asynchronous data collection was not successful.");
        $Self->PrintError("$Result{ErrorMessage}");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

1;
