# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Funktionalität';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'General-Katalog-Verwaltung';
    $Self->{Translation}->{'Add Catalog Item'} = 'Katalog-Eintrag hinzufügen';
    $Self->{Translation}->{'Add Catalog Class'} = 'Katalog-Klasse hinzufügen';
    $Self->{Translation}->{'Catalog Class'} = 'Katalog-Klasse';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Admin.';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'General-Katalog erstellen und verwalten.';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        'Frontendmodul-Registration der AdminGeneralCatalog Konfiguration im Admin-Bereich.';
    $Self->{Translation}->{'General Catalog'} = 'General-Katalog';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        'Parameter für den Beispiel-Kommentar 2 der General-Katalog-Attribute.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parameter für die zugriffsberechtigte Gruppe der General-Katalog-Attribute.';

}

1;
