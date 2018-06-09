# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fr_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Fonctionnalité';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Gestion du Catalogue Général';
    $Self->{Translation}->{'Add Catalog Item'} = 'Ajouter un Element au Catalogue';
    $Self->{Translation}->{'Add Catalog Class'} = 'Ajouter une Classe de Catalogue';
    $Self->{Translation}->{'Catalog Class'} = 'Classe de Catalogue';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Administrateur.';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'Créer et gérer le Catalogue Général.';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        'Interface d\'enregistrement de module pour la configuration du Catalogue Général Admin dans la section administrateur';
    $Self->{Translation}->{'General Catalog'} = 'Catalogue Général';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        'Paramètres pour l\'exemple du commentaire 2 des attributs du Catalogue Général';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Paramètres pour l\'exemple des permissions de groupe des attributs du Catalogue Général';

}

1;
