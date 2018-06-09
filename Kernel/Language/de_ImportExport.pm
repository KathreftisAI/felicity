# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Mapping-Template hinzufügen';
    $Self->{Translation}->{'Charset'} = 'Zeichensatz';
    $Self->{Translation}->{'Colon (:)'} = 'Doppelpunkt (:)';
    $Self->{Translation}->{'Column'} = 'Spalte';
    $Self->{Translation}->{'Column Separator'} = 'Spaltentrenner';
    $Self->{Translation}->{'Dot (.)'} = 'Punkt (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Semicolon (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulator (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Mit Spaltenüberschriften';
    $Self->{Translation}->{'Import summary for'} = 'Import-Bericht für';
    $Self->{Translation}->{'Imported records'} = 'Importierte Datensätze';
    $Self->{Translation}->{'Exported records'} = 'Exportierte Datensätze';
    $Self->{Translation}->{'Records'} = 'Datensätze';
    $Self->{Translation}->{'Skipped'} = 'Übersprungen';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Import/Export-Verwaltung';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Erstellen einer Vorlage zum Importieren und Exportieren von Objekt-Informationen.';
    $Self->{Translation}->{'Start Import'} = 'Import starten';
    $Self->{Translation}->{'Start Export'} = 'Export starten';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = 'Schritt 1 von 5 - Allgemeine Informationen bearbeiten';
    $Self->{Translation}->{'Name is required!'} = 'Name wird benötigt!';
    $Self->{Translation}->{'Object is required!'} = 'Objekt ist erforderlich!';
    $Self->{Translation}->{'Format is required!'} = 'Format ist erforderlich!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = 'Schritt 2 von 5 - Objekt-Informationen bearbeiten';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'wird benötigt!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = 'Schritt 4 von 5 - Mapping-Informationen bearbeiten';
    $Self->{Translation}->{'No map elements found.'} = 'Keine Mapping-Elemente gefunden.';
    $Self->{Translation}->{'Add Mapping Element'} = 'Mapping-Element hinzufügen';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = 'Schritt 5 von 5 - Such-Informationen bearbeiten';
    $Self->{Translation}->{'Restrict export per search'} = 'Export per Suche einschränken';
    $Self->{Translation}->{'Import information'} = 'Import-Informationen';
    $Self->{Translation}->{'Source File'} = 'Quell-Datei';
    $Self->{Translation}->{'Success'} = 'Erfolgreich';
    $Self->{Translation}->{'Failed'} = 'Nicht erfolgreich';
    $Self->{Translation}->{'Duplicate names'} = 'Doppelte Namen';
    $Self->{Translation}->{'Last processed line number of import file'} = 'Zuletzt verarbeitete Zeile der Import-Datei';
    $Self->{Translation}->{'Ok'} = 'Ok';

    # Perl Module: Kernel/Modules/AdminImportExport.pm
    $Self->{Translation}->{'No object backend found!'} = 'Kein Backend für das Objekt verfügbar!';
    $Self->{Translation}->{'No format backend found!'} = 'Kein Backend für das Format verfügbar!';
    $Self->{Translation}->{'Template not found!'} = 'Vorlage nicht verfügbar!';
    $Self->{Translation}->{'Can\'t insert/update template!'} = 'Dei Vorlage konnte nicht erstellt oder aktualisiert werden!';
    $Self->{Translation}->{'Needed TemplateID!'} = 'Die ID der Vorlage wird benötigt!';
    $Self->{Translation}->{'Error occurred. Import impossible! See Syslog for details.'} = 'Fehler aufgetreten. Importieren unmöglich! Für Details siehe Syslog.';
    $Self->{Translation}->{'Error occurred. Export impossible! See Syslog for details.'} = 'Fehler aufgetreten. Exportieren unmöglich! Für Details siehe Syslog.';
    $Self->{Translation}->{'number'} = 'Zahl';
    $Self->{Translation}->{'number bigger than zero'} = 'Zahl größer als Null';
    $Self->{Translation}->{'integer'} = 'Ganzzahl';
    $Self->{Translation}->{'integer bigger than zero'} = 'Ganzzahl größer als Null';
    $Self->{Translation}->{'Element required, please insert data'} = 'Element erforderlich, bitte fügen Sie Daten ein';
    $Self->{Translation}->{'Invalid data, please insert a valid %s'} = 'Ungültige Daten, bitte geben Sie ein gültiges %s ein';
    $Self->{Translation}->{'Format not found!'} = 'Format nicht gefunden!';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} =
        'Format-Backend Modul-Registration des Import/Export Moduls.';
    $Self->{Translation}->{'Import and export object information.'} = 'Importieren und Exportieren von Objekt-Informationen.';
    $Self->{Translation}->{'Import/Export'} = 'Import/Export';

}

1;
