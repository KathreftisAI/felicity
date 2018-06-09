# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::OS::Load;

use strict;
use warnings;

use base qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = ();

sub GetDisplayPath {
    return Translatable('Operating System');
}

sub Run {
    my $Self = shift;

    # Check if used OS is a linux system
    if ( $^O !~ /(linux|unix|netbsd|freebsd|darwin)/i ) {
        return $Self->GetResults();
    }

    my @Loads;

    # If used OS is a linux system
    if ( $^O =~ /(linux|unix|netbsd|freebsd|darwin)/i ) {

        # linux systems
        if ( -e "/proc/loadavg" ) {
            my $LoadFile;
            open( $LoadFile, '<', "/proc/loadavg" );    ## no critic
            while (<$LoadFile>) {
                @Loads = split( " ", $_ );
            }
            close($LoadFile);
        }

        # mac os
        elsif ( $^O =~ /darwin/i ) {
            if ( open( my $In, "-|", "sysctl vm.loadavg" ) ) {    ## no critic
                while (<$In>) {
                    if ( my ($Loads) = $_ =~ /vm\.loadavg: \s* \{ \s*  (.*) \s* \}/smx ) {
                        @Loads = split ' ', $Loads;
                    }
                }
                close $In;
            }
        }

        if (@Loads) {
            $Self->AddResultInformation(
                Label => Translatable('System Load'),
                Value => $Loads[2],
                Message =>
                    Translatable(
                    'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).'
                    ),
            );
        }
    }

    return $Self->GetResults();
}

1;
