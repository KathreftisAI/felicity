# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::xx_Custom;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # $$START$$

    # own translations
    $Self->{Translation}->{'Lock'}   = 'Lala';
    $Self->{Translation}->{'Unlock'} = 'Lulu';

    # or a other syntax would be
    #    $Self->{Translation} = {
    #        %{$Self->{Translation}},
    #        # own translations
    #        'Lock' => 'Lala',
    #        'UnLock' => 'Lulu',
    #    };

    # $$STOP$$
}

1;
