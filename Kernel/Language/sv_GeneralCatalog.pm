# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sv_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Funktionalitet';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Hantera grundkatalog';
    $Self->{Translation}->{'Add Catalog Item'} = 'Lägg till katalogpost';
    $Self->{Translation}->{'Add Catalog Class'} = 'Lägg till klass i katalog';
    $Self->{Translation}->{'Catalog Class'} = 'Katalogklass';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Admin.';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'Skapa och hantera grundkatalogen';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        'Registrering av frontendmodul för AdminGeneralCatalog-inställningar i adminarean.';
    $Self->{Translation}->{'General Catalog'} = 'Grundkatalog';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        'Parametrar för exempelkommentar 2 i attributen för grundkatalogen.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parametrar för exempel på behörighetsegrupper i grundkatalogens attribut.';

}

1;
