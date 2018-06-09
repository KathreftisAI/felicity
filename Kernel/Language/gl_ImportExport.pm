# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::gl_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Engadir o mapeo do modelo';
    $Self->{Translation}->{'Charset'} = 'Conxunto de caracteres';
    $Self->{Translation}->{'Colon (:)'} = 'Dous puntos :';
    $Self->{Translation}->{'Column'} = 'Columna';
    $Self->{Translation}->{'Column Separator'} = 'Separador de columnas';
    $Self->{Translation}->{'Dot (.)'} = 'Punto (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Punto e coma (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulación (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Incluír as cabeceiras das columnas';
    $Self->{Translation}->{'Import summary for'} = 'Importar o resumo de';
    $Self->{Translation}->{'Imported records'} = 'Rexistros importados';
    $Self->{Translation}->{'Exported records'} = 'Rexistros exportados';
    $Self->{Translation}->{'Records'} = 'Rexistros';
    $Self->{Translation}->{'Skipped'} = 'Omitido';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Xestión da importación/exportación';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Crear un modelo para importar e exportar a información sobre os obxectos.';
    $Self->{Translation}->{'Start Import'} = 'Iniciar a importación';
    $Self->{Translation}->{'Start Export'} = 'Iniciar a exportación';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = '';
    $Self->{Translation}->{'Name is required!'} = 'Requírese un nome!';
    $Self->{Translation}->{'Object is required!'} = 'Requírese un obxecto!';
    $Self->{Translation}->{'Format is required!'} = 'Requírese un formato!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = '';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'E necesario!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = '';
    $Self->{Translation}->{'No map elements found.'} = 'Elementos do mapa non atopados';
    $Self->{Translation}->{'Add Mapping Element'} = 'Engadir elemento de mapeo';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = '';
    $Self->{Translation}->{'Restrict export per search'} = 'Restrinxir a exportación da busca';
    $Self->{Translation}->{'Import information'} = 'Información de importar';
    $Self->{Translation}->{'Source File'} = 'Ficheiro orixe';
    $Self->{Translation}->{'Success'} = 'Correcto';
    $Self->{Translation}->{'Failed'} = 'Fallou';
    $Self->{Translation}->{'Duplicate names'} = 'Nomes duplicados';
    $Self->{Translation}->{'Last processed line number of import file'} = 'Número da derradeira liña procesada do arquivo importar';
    $Self->{Translation}->{'Ok'} = 'Aceptar';

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
        'Módulo de rexistro do formato de backend para o módulo importar/exportar';
    $Self->{Translation}->{'Import and export object information.'} = 'Información para importar e exportar o obxeto';
    $Self->{Translation}->{'Import/Export'} = 'Importación/Exportación';

}

1;
