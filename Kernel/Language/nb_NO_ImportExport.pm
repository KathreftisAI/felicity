# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nb_NO_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Legg til mal for mapping';
    $Self->{Translation}->{'Charset'} = 'Tegnsett';
    $Self->{Translation}->{'Colon (:)'} = 'Kolon (:)';
    $Self->{Translation}->{'Column'} = 'Kolonne';
    $Self->{Translation}->{'Column Separator'} = 'Kolonneseparator';
    $Self->{Translation}->{'Dot (.)'} = 'Punktum (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Semikolon (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulator (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Inkluder kolonneoverskrifter';
    $Self->{Translation}->{'Import summary for'} = 'Oppsummeringer for import';
    $Self->{Translation}->{'Imported records'} = 'Importerte rader';
    $Self->{Translation}->{'Exported records'} = 'Eksporterte rader';
    $Self->{Translation}->{'Records'} = 'Rader';
    $Self->{Translation}->{'Skipped'} = 'Hoppet over';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Administrasjon av Import/Eksport';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Opprett en mal for å eksportere og importere informasjon';
    $Self->{Translation}->{'Start Import'} = 'Start import';
    $Self->{Translation}->{'Start Export'} = 'Start eksport';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = '';
    $Self->{Translation}->{'Name is required!'} = 'Navn er påkrevd!';
    $Self->{Translation}->{'Object is required!'} = 'Objekt er påkrevd!';
    $Self->{Translation}->{'Format is required!'} = 'Format er påkrevd!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = '';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'er påkrevd!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = '';
    $Self->{Translation}->{'No map elements found.'} = 'Ingen elementer funnet.';
    $Self->{Translation}->{'Add Mapping Element'} = 'Legg til mapping-element';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = '';
    $Self->{Translation}->{'Restrict export per search'} = 'Begrens eksport per søk';
    $Self->{Translation}->{'Import information'} = 'Import-informasjon';
    $Self->{Translation}->{'Source File'} = 'Kildefil';
    $Self->{Translation}->{'Success'} = 'Vellykket';
    $Self->{Translation}->{'Failed'} = 'Feilet';
    $Self->{Translation}->{'Duplicate names'} = 'Duplikate navn';
    $Self->{Translation}->{'Last processed line number of import file'} = 'Siste prosesserte linjenummer av importfil';
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
        'Baksidemodul-registrering for formatet til import/eksport-modulen';
    $Self->{Translation}->{'Import and export object information.'} = 'Informasjon for import- og eksport-objekt';
    $Self->{Translation}->{'Import/Export'} = 'Import/Eksport';

}

1;
