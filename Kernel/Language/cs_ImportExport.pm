# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::cs_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Nová šablona zobrazení';
    $Self->{Translation}->{'Charset'} = 'Znaková sada';
    $Self->{Translation}->{'Colon (:)'} = 'Dvojtečka (:)';
    $Self->{Translation}->{'Column'} = 'Sloupec';
    $Self->{Translation}->{'Column Separator'} = 'Oddělovač Sloupců';
    $Self->{Translation}->{'Dot (.)'} = 'Tečka (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Středník (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulátor (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = '';
    $Self->{Translation}->{'Import summary for'} = '';
    $Self->{Translation}->{'Imported records'} = '';
    $Self->{Translation}->{'Exported records'} = '';
    $Self->{Translation}->{'Records'} = 'Záznamů';
    $Self->{Translation}->{'Skipped'} = 'Přeskočeno';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Import/Export Správa';
    $Self->{Translation}->{'Create a template to import and export object information.'} = '';
    $Self->{Translation}->{'Start Import'} = 'Zahájit Import';
    $Self->{Translation}->{'Start Export'} = 'Zahájit Export';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = '';
    $Self->{Translation}->{'Name is required!'} = '';
    $Self->{Translation}->{'Object is required!'} = '';
    $Self->{Translation}->{'Format is required!'} = '';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = '';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = '';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = '';
    $Self->{Translation}->{'No map elements found.'} = '';
    $Self->{Translation}->{'Add Mapping Element'} = '';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = '';
    $Self->{Translation}->{'Restrict export per search'} = 'Omezit Export vyhledáváním';
    $Self->{Translation}->{'Import information'} = 'Informace o Importu';
    $Self->{Translation}->{'Source File'} = 'Zdrojový Soubor';
    $Self->{Translation}->{'Success'} = 'Úspěšně';
    $Self->{Translation}->{'Failed'} = 'Neúspěšně';
    $Self->{Translation}->{'Duplicate names'} = 'Duplicitní jména';
    $Self->{Translation}->{'Last processed line number of import file'} = '';
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
        '';
    $Self->{Translation}->{'Import and export object information.'} = '';
    $Self->{Translation}->{'Import/Export'} = 'Import/Export';

}

1;
