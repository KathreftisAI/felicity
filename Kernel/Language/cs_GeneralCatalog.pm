# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cs_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Funkcionalita';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Správa Hlavního Katalogu';
    $Self->{Translation}->{'Add Catalog Item'} = 'Přidat položku Katalogu';
    $Self->{Translation}->{'Add Catalog Class'} = 'Přidat třídu Katalogu';
    $Self->{Translation}->{'Catalog Class'} = 'Třídy Katalogu';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = '';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'Vytvořit a spravovat hlavní katalog';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        'Frontendová registrace modulu pro konfiguraci hlavního katalogu v administrativní oblasti.';
    $Self->{Translation}->{'General Catalog'} = 'Hlavní Katalog';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        'Příklad parametrů pro komentář 2 obecných atributů katalogu';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parametry skupiny pro příklad oprávnění obecných atributů katalogu';

}

1;
