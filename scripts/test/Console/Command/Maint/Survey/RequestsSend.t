# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

## no critic (Modules::RequireExplicitPackage)
use strict;
use warnings;
use utf8;

use vars (qw($Self));

my @Tests = (
    {
        Name     => "No Params 'SendInHoursAfterClose' disabled",
        Params   => [],
        Config   => 0,
        ExitCode => 0,
    },
    {
        Name     => "Wrong Param 'SendInHoursAfterClose' disabled",
        Params   => ['--test'],
        Config   => 0,
        ExitCode => 1,
    },
    {
        Name     => "Force param 'SendInHoursAfterClose' disabled",
        Params   => ['--force'],
        Config   => 0,
        ExitCode => 0,
    },
    {
        Name     => "No Params 'SendInHoursAfterClose' enabled",
        Params   => [],
        Config   => 1,
        ExitCode => 0,
    },
    {
        Name     => "Wrong Param 'SendInHoursAfterClose' enabled",
        Params   => ['--test'],
        Config   => 1,
        ExitCode => 1,
    },
    {
        Name     => "Force param 'SendInHoursAfterClose' enabled",
        Params   => ['--force'],
        Config   => 1,
        ExitCode => 0,
    },

);

# get needed objects
my $CommandObject = $Kernel::OM->Get('Kernel::System::Console::Command::Maint::Survey::RequestsSend');
my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');

for my $Test (@Tests) {

    # set config
    $ConfigObject->Set(
        Valid => 1,
        Key   => 'Survey::SendInHoursAfterClose',
        Value => $Test->{Config},
    );

    my $ExitCode = $CommandObject->Execute( @{ $Test->{Params} } );

    $Self->Is(
        $ExitCode,
        $Test->{ExitCode},
        "$Test->{Name} - ExitCode",
    );
}

1;
