# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# cleanup from previous tests
my @SupportFiles = $Kernel::OM->Get('Kernel::System::Main')->DirectoryRead(
    Directory => '/var/tmp',
    Filter    => 'SupportBundle_*.tar.gz',
);
foreach my $File (@SupportFiles) {
    unlink $File;
}

# get command object
my $CommandObject = $Kernel::OM->Get('Kernel::System::Console::Command::Maint::SupportBundle::Generate');

my $TargetDirectory = $Kernel::OM->Get('Kernel::Config')->Get('Home') . "/var/tmp";

my $ExitCode = $CommandObject->Execute( '--target-directory', $TargetDirectory );

$Self->Is(
    $ExitCode,
    0,
    "Maint::SupportBundle::Generate exit code",
);

@SupportFiles = $Kernel::OM->Get('Kernel::System::Main')->DirectoryRead(
    Directory => $TargetDirectory,
    Filter    => 'SupportBundle_*.tar.gz',
);

$Self->Is(
    scalar @SupportFiles,
    1,
    "Support bundle generated",
);

# cleanup
foreach my $File (@SupportFiles) {
    unlink $File;
}

# cleanup cache is done by RestoreDatabase

1;
