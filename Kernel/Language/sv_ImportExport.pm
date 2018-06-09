# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sv_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = '';
    $Self->{Translation}->{'Charset'} = 'Teckenkodning';
    $Self->{Translation}->{'Colon (:)'} = 'Kolon (:)';
    $Self->{Translation}->{'Column'} = 'Kolumn';
    $Self->{Translation}->{'Column Separator'} = 'Kolumn-avskiljare';
    $Self->{Translation}->{'Dot (.)'} = 'Punkt (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Semikolon (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = '';
    $Self->{Translation}->{'Include Column Headers'} = '';
    $Self->{Translation}->{'Import summary for'} = 'Importsummering för';
    $Self->{Translation}->{'Imported records'} = 'Importerade poster';
    $Self->{Translation}->{'Exported records'} = 'Exporterade poster';
    $Self->{Translation}->{'Records'} = 'Poster';
    $Self->{Translation}->{'Skipped'} = 'Hoppade över';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Hantering av Import/Export';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Skapa en mall för att importera och exportera objektinformation.';
    $Self->{Translation}->{'Start Import'} = 'Starta import';
    $Self->{Translation}->{'Start Export'} = 'Starta export';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = '';
    $Self->{Translation}->{'Name is required!'} = 'Namn krävs!';
    $Self->{Translation}->{'Object is required!'} = 'Objekt krävs!';
    $Self->{Translation}->{'Format is required!'} = 'Format krävs!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = '';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'krävs!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = '';
    $Self->{Translation}->{'No map elements found.'} = '';
    $Self->{Translation}->{'Add Mapping Element'} = '';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = '';
    $Self->{Translation}->{'Restrict export per search'} = '';
    $Self->{Translation}->{'Import information'} = 'Importinformation';
    $Self->{Translation}->{'Source File'} = 'Källfil';
    $Self->{Translation}->{'Success'} = 'Lyckad';
    $Self->{Translation}->{'Failed'} = 'Misslyckad';
    $Self->{Translation}->{'Duplicate names'} = 'Upprepa namn';
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
    $Self->{Translation}->{'Import and export object information.'} = 'Importera och exportera objektinformation.';
    $Self->{Translation}->{'Import/Export'} = 'Import/Export';

}

1;
