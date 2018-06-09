# OTRS config file (automatically generated)
# VERSION:1.1
package Kernel::Config::Files::ZZZZDisableOTRSBusinessNotification;

use strict;
use warnings;
no warnings 'redefine';

use List::Util qw(first);

sub Load {
    my ($File, $Self) = @_;

    my $NotificationModules = $Self->{'Frontend::NotifyModule'};
    my ($Key)               = first { $_ =~ m{OTRSBusiness} }sort keys %{ $NotificationModules || {} };

    if ( defined $Key ) {
        delete $Self->{'Frontend::NotifyModule'}->{$Key};
    }
}

1;
