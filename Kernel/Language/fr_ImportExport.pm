# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fr_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Ajouter un template de mappage';
    $Self->{Translation}->{'Charset'} = 'Jeu de caractères';
    $Self->{Translation}->{'Colon (:)'} = 'Deux points (:)';
    $Self->{Translation}->{'Column'} = 'Colonne';
    $Self->{Translation}->{'Column Separator'} = 'Séparateur de colonne';
    $Self->{Translation}->{'Dot (.)'} = 'Point (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Point virgule (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulation (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Inclure les en-têtes de colonnes';
    $Self->{Translation}->{'Import summary for'} = 'Résumé de l\'import pour';
    $Self->{Translation}->{'Imported records'} = 'Enregistrements importés';
    $Self->{Translation}->{'Exported records'} = 'Enregistrements exportés';
    $Self->{Translation}->{'Records'} = 'Enregistrements';
    $Self->{Translation}->{'Skipped'} = 'Passé(s)';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Gestion de l\'Import/Export';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Créer un modèle pour importer et exporter les informations d\'objet';
    $Self->{Translation}->{'Start Import'} = 'Démarrer Import';
    $Self->{Translation}->{'Start Export'} = 'Démarrer Export';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = 'Etape 1 sur 5 - Editer l\'information commune';
    $Self->{Translation}->{'Name is required!'} = 'Un Nom est requis!';
    $Self->{Translation}->{'Object is required!'} = 'Un Objet est requis!';
    $Self->{Translation}->{'Format is required!'} = 'Un Format est requis!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = 'Etape 2 sur 5 - Editer l\'information d\'objet';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'est requis !';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = 'Etape 4 sur 5 - Editer l\'information de mappage';
    $Self->{Translation}->{'No map elements found.'} = 'Aucun élément de mappage trouvé';
    $Self->{Translation}->{'Add Mapping Element'} = 'Ajouter un élément de mappage';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = 'Etape 5 sur 5 - Editer l\'information de recherche';
    $Self->{Translation}->{'Restrict export per search'} = 'Restreindre l\'export par recherche';
    $Self->{Translation}->{'Import information'} = 'Informations d\'import';
    $Self->{Translation}->{'Source File'} = 'Fichier Source';
    $Self->{Translation}->{'Success'} = 'Réussi';
    $Self->{Translation}->{'Failed'} = 'Echoué';
    $Self->{Translation}->{'Duplicate names'} = 'Noms en double';
    $Self->{Translation}->{'Last processed line number of import file'} = 'Numéro de la dernière ligne traitée dans le fichier d\'import';
    $Self->{Translation}->{'Ok'} = 'Ok';

    # Perl Module: Kernel/Modules/AdminImportExport.pm
    $Self->{Translation}->{'No object backend found!'} = '';
    $Self->{Translation}->{'No format backend found!'} = '';
    $Self->{Translation}->{'Template not found!'} = 'Template non trouvé!';
    $Self->{Translation}->{'Can\'t insert/update template!'} = 'Impossible d\'insérer/mettre à jour le template!';
    $Self->{Translation}->{'Needed TemplateID!'} = 'Identifiant de template requis!';
    $Self->{Translation}->{'Error occurred. Import impossible! See Syslog for details.'} = 'Une erreur est survenue. Import impossible! Voyez le log système pour les détails.';
    $Self->{Translation}->{'Error occurred. Export impossible! See Syslog for details.'} = 'Une erreur est survenue. Export impossible! Voyez le log système pour les détails.';
    $Self->{Translation}->{'number'} = 'nombre';
    $Self->{Translation}->{'number bigger than zero'} = 'nombre plus grand que zéro';
    $Self->{Translation}->{'integer'} = 'entier';
    $Self->{Translation}->{'integer bigger than zero'} = 'entier plus grand que zéro';
    $Self->{Translation}->{'Element required, please insert data'} = 'Elément requis, veuillez entrer une donnée';
    $Self->{Translation}->{'Invalid data, please insert a valid %s'} = '';
    $Self->{Translation}->{'Format not found!'} = 'Format non trouvé!';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} =
        'Enregistrement en arrière plan du module d\'import/export';
    $Self->{Translation}->{'Import and export object information.'} = 'Importer et exporter des informations d\'objet';
    $Self->{Translation}->{'Import/Export'} = 'Importer/Exporter';

}

1;
