# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_MX_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Agregar plantilla de mapeo';
    $Self->{Translation}->{'Charset'} = 'Conjunto de Caracteres';
    $Self->{Translation}->{'Colon (:)'} = 'Dos Puntos (:)';
    $Self->{Translation}->{'Column'} = 'Calumna';
    $Self->{Translation}->{'Column Separator'} = 'Separador de Columna';
    $Self->{Translation}->{'Dot (.)'} = 'Punto (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Punto y coma (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulador (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Incluir Cabecera de Columnas';
    $Self->{Translation}->{'Import summary for'} = 'Importar resumen para';
    $Self->{Translation}->{'Imported records'} = 'Registros importados';
    $Self->{Translation}->{'Exported records'} = 'Registros exportados';
    $Self->{Translation}->{'Records'} = 'Registros';
    $Self->{Translation}->{'Skipped'} = 'Omitido';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Gestión de Importación/Exportación';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Crear una plantilla para importar y exportar información de objetos.';
    $Self->{Translation}->{'Start Import'} = 'Iniciar Importación';
    $Self->{Translation}->{'Start Export'} = 'Iniciar Exportación';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = '';
    $Self->{Translation}->{'Name is required!'} = 'Es requerido un nombre!';
    $Self->{Translation}->{'Object is required!'} = 'Es requerido un objeto!';
    $Self->{Translation}->{'Format is required!'} = 'Es requerido un formato.';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = '';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'es requerido!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = '';
    $Self->{Translation}->{'No map elements found.'} = 'No se han encontrado mapas.';
    $Self->{Translation}->{'Add Mapping Element'} = 'Agregar un Elemento de Mapeo';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = '';
    $Self->{Translation}->{'Restrict export per search'} = 'Restringir la exportación a la búsqueda';
    $Self->{Translation}->{'Import information'} = 'Información de importación';
    $Self->{Translation}->{'Source File'} = 'Archivo Fuente';
    $Self->{Translation}->{'Success'} = 'Éxito';
    $Self->{Translation}->{'Failed'} = 'Falló';
    $Self->{Translation}->{'Duplicate names'} = 'Nombres duplicados';
    $Self->{Translation}->{'Last processed line number of import file'} = 'Último número de línea procesada del archivo a importar';
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
        'Formato del módulo administrativo de registro para el módulo de importación/exportación.';
    $Self->{Translation}->{'Import and export object information.'} = 'Importar y exportar información de un objeto.';
    $Self->{Translation}->{'Import/Export'} = 'Importar/Exportar';

}

1;
