# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::it_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Funzionalità';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Gestione del Catalogo Generale';
    $Self->{Translation}->{'Add Catalog Item'} = 'Aggiungi Elemento al Catalogo';
    $Self->{Translation}->{'Add Catalog Class'} = 'Aggiungi Classe al Catalogo';
    $Self->{Translation}->{'Catalog Class'} = 'Classe di Catalogo';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Admin.';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'Crea e gestisci il Catalogo Generale';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        'Modulo di registrazione per la configurazione di AdminGeneralCatalog nell\'area di admin.';
    $Self->{Translation}->{'General Catalog'} = 'Catalogo Generale';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        'Parametri per il commento di esempio 2 degli attributi del catalogo generale.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parametri per i gruppi di permessi di esempio degli attributi del catalogo generale.';

}

1;
