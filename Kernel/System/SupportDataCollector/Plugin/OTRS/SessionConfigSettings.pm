# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::OTRS::SessionConfigSettings;

use strict;
use warnings;

use base qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
);

sub GetDisplayPath {
    return Translatable('OTRS') . '/' . Translatable('Session Config Settings');
}

sub Run {
    my $Self = shift;

    my @Settings = qw(
        SessionMaxTime
        SessionMaxIdleTime
        SessionActiveTime
        AgentSessionLimitPriorWarning
        AgentSessionLimit
        AgentSessionPerUserLimit
        CustomerSessionLimit
        CustomerSessionPerUserLimit
    );

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    for my $Setting (@Settings) {

        my $ConfigValue = $ConfigObject->Get($Setting);

        my $Message;

        $Self->AddResultInformation(
            Identifier => $Setting,
            Label      => $Setting,
            Value      => $ConfigValue,
        );
    }

    return $Self->GetResults();
}

1;
