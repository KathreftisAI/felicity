# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nl_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Functionaliteit';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Catalogus Beheer';
    $Self->{Translation}->{'Add Catalog Item'} = 'Catalogus-item toevoegen';
    $Self->{Translation}->{'Add Catalog Class'} = 'Catalogus-klasse toevoegen';
    $Self->{Translation}->{'Catalog Class'} = 'Catalogus klasse';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = '';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'Aanmaken en beheren van items in de catalogus.';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        'Frontend module registratie voor de AdminGeneralCatalog configuratie in het beheer deel.';
    $Self->{Translation}->{'General Catalog'} = 'Catalogus';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        'Parameters voor het voorbeeld commentaar 2 van de algemene catalog attributen';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parameters voor de voorbeeld perimssiegroepen van de algemene catalog attributen.';

}

1;
