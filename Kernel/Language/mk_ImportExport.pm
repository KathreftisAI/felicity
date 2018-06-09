# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::mk_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Añadir plantilla de mapeo';
    $Self->{Translation}->{'Charset'} = 'Juego de caracteres';
    $Self->{Translation}->{'Colon (:)'} = 'Dos puntos (:)';
    $Self->{Translation}->{'Column'} = 'Columna';
    $Self->{Translation}->{'Column Separator'} = 'Separador de Columna';
    $Self->{Translation}->{'Dot (.)'} = 'Punto (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Punto y Coma (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulador (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Incluir Cabecera de la Columna';
    $Self->{Translation}->{'Import summary for'} = 'Importar resumen para';
    $Self->{Translation}->{'Imported records'} = 'Registros importados';
    $Self->{Translation}->{'Exported records'} = 'Registros exportados';
    $Self->{Translation}->{'Records'} = 'Registros';
    $Self->{Translation}->{'Skipped'} = 'Saltado';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Gestión de Importación/Exportación';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Crear una plantilla para importar y exportar informacion del objeto.';
    $Self->{Translation}->{'Start Import'} = 'Iniciar Importación';
    $Self->{Translation}->{'Start Export'} = 'Iniciar Exportación';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = '';
    $Self->{Translation}->{'Name is required!'} = 'El nombre es requerido';
    $Self->{Translation}->{'Object is required!'} = '¡Debe especificar Objeto!';
    $Self->{Translation}->{'Format is required!'} = '¡Debe especificar Formato!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = '';
    $Self->{Translation}->{'Step 3 of 5'} = '';
    $Self->{Translation}->{'is required!'} = '¡es requerido!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = '';
    $Self->{Translation}->{'No map elements found.'} = 'No se encontraron elementos de mapeo.';
    $Self->{Translation}->{'Add Mapping Element'} = 'Añadir Mapeo de Elementos';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = '';
    $Self->{Translation}->{'Restrict export per search'} = 'Restringir exportación por búsqueda';
    $Self->{Translation}->{'Import information'} = 'Importar información';
    $Self->{Translation}->{'Source File'} = 'Archivo origen';
    $Self->{Translation}->{'Success'} = 'Éxito';
    $Self->{Translation}->{'Failed'} = 'Fracasado';
    $Self->{Translation}->{'Duplicate names'} = 'Nombres duplicados';
    $Self->{Translation}->{'Last processed line number of import file'} = 'Última número de línea procesada del archivo importar';
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
        'Registro de módulo de formato backend para el módulo import/export.';
    $Self->{Translation}->{'Import and export object information.'} = 'Importar y exportar información de objetos.';
    $Self->{Translation}->{'Import/Export'} = 'Importar/Exportar';

}

1;
