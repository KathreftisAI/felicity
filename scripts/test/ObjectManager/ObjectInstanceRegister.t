# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use vars (qw($Self));

use Kernel::System::Time;
use Kernel::System::ObjectManager;

$Self->Is(
    $Kernel::OM->Get('Kernel::System::UnitTest'),
    $Self,
    "Global OM returns $Self as 'Kernel::System::UnitTest'",
);

local $Kernel::OM = Kernel::System::ObjectManager->new();

$Self->True( $Kernel::OM, 'Could build object manager' );

$Self->False(
    exists $Kernel::OM->{Objects}->{'Kernel::System::Time'},
    'Kernel::System::Time was not loaded yet',
);

my $TimeObject = Kernel::System::Time->new();

$Self->True(
    $Kernel::OM->ObjectInstanceRegister(
        Package      => 'Kernel::System::Time',
        Object       => $TimeObject,
        Dependencies => [],
    ),
    'Registered TimeObject',
);

$Self->Is(
    $Kernel::OM->Get('Kernel::System::Time'),
    $TimeObject,
    "OM returns the original TimeObject",
);

$Kernel::OM->ObjectsDiscard();

$Self->True(
    $TimeObject,
    "TimeObject is still alive after ObjectsDiscard()",
);

$Self->IsNot(
    $Kernel::OM->Get('Kernel::System::Time'),
    $TimeObject,
    "OM returns its own TimeObject",
);

1;
