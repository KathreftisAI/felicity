# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::it_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Aggiungi mappatura modello';
    $Self->{Translation}->{'Charset'} = 'Charset';
    $Self->{Translation}->{'Colon (:)'} = 'Due punti (:)';
    $Self->{Translation}->{'Column'} = 'Colonna';
    $Self->{Translation}->{'Column Separator'} = 'Separatore di colonna';
    $Self->{Translation}->{'Dot (.)'} = 'Punto (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Punto e virgola (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulatore (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Includi le Colonne di Intestazione';
    $Self->{Translation}->{'Import summary for'} = 'Importa il sommario per';
    $Self->{Translation}->{'Imported records'} = 'Voci importate';
    $Self->{Translation}->{'Exported records'} = 'Esporta voci';
    $Self->{Translation}->{'Records'} = 'Voci';
    $Self->{Translation}->{'Skipped'} = 'Saltato';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Gestione Importazione/Esportazione';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Crea un template per importare ed esportare le informazioni degli oggetti.';
    $Self->{Translation}->{'Start Import'} = 'Inizia Importazione';
    $Self->{Translation}->{'Start Export'} = 'Inizia Esportazione';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = '';
    $Self->{Translation}->{'Name is required!'} = 'Il nome è obbligatorio!';
    $Self->{Translation}->{'Object is required!'} = 'L\'oggetto è obbligatorio!';
    $Self->{Translation}->{'Format is required!'} = 'Il formato è obbligatorio!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = '';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'è obbligatorio!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = '';
    $Self->{Translation}->{'No map elements found.'} = 'Nessun elemento mappa trovato.';
    $Self->{Translation}->{'Add Mapping Element'} = 'Aggiungi un elemento di mappatura.';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = '';
    $Self->{Translation}->{'Restrict export per search'} = 'Restringere esportazione per ricerca';
    $Self->{Translation}->{'Import information'} = 'Importare informazione';
    $Self->{Translation}->{'Source File'} = 'Archivio origine';
    $Self->{Translation}->{'Success'} = 'Successo';
    $Self->{Translation}->{'Failed'} = 'Fallito';
    $Self->{Translation}->{'Duplicate names'} = 'Duplica i nomi';
    $Self->{Translation}->{'Last processed line number of import file'} = 'Numero dell\'ultima riga processata del file da importare';
    $Self->{Translation}->{'Ok'} = 'Ok';

    # Perl Module: Kernel/Modules/AdminImportExport.pm
    $Self->{Translation}->{'No object backend found!'} = '';
    $Self->{Translation}->{'No format backend found!'} = '';
    $Self->{Translation}->{'Template not found!'} = '';
    $Self->{Translation}->{'Can\'t insert/update template!'} = '';
    $Self->{Translation}->{'Needed TemplateID!'} = '';
    $Self->{Translation}->{'Error occurred. Import impossible! See Syslog for details.'} = '';
    $Self->{Translation}->{'Error occurred. Export impossible! See Syslog for details.'} = '';
    $Self->{Translation}->{'number'} = '';
    $Self->{Translation}->{'number bigger than zero'} = '';
    $Self->{Translation}->{'integer'} = '';
    $Self->{Translation}->{'integer bigger than zero'} = '';
    $Self->{Translation}->{'Element required, please insert data'} = '';
    $Self->{Translation}->{'Invalid data, please insert a valid %s'} = '';
    $Self->{Translation}->{'Format not found!'} = '';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} =
        'Registrazione del modulo di backend del formato per il modulo di importazione/esportazione.';
    $Self->{Translation}->{'Import and export object information.'} = 'Importa ed esporta le informazioni sull\'oggetto.';
    $Self->{Translation}->{'Import/Export'} = 'Importare/Esportare';

}

1;
