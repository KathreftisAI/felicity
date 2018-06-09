# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Adicionar modelo de mapeamento';
    $Self->{Translation}->{'Charset'} = 'Codificação de Caracteres';
    $Self->{Translation}->{'Colon (:)'} = 'Dois Pontos (:)';
    $Self->{Translation}->{'Column'} = 'Coluna';
    $Self->{Translation}->{'Column Separator'} = 'Separador de Colunas';
    $Self->{Translation}->{'Dot (.)'} = 'Ponto (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Ponto e Vírgula (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulação (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Incluir Cabeçalhos de Colunas';
    $Self->{Translation}->{'Import summary for'} = 'Resumo de importação para';
    $Self->{Translation}->{'Imported records'} = 'Registros importados';
    $Self->{Translation}->{'Exported records'} = 'Registros exportados';
    $Self->{Translation}->{'Records'} = 'Registros';
    $Self->{Translation}->{'Skipped'} = 'Desconsiderados';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Gerenciamento de Importação/Exportação';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Criar um modelo para importar e exportar informações de objeto.';
    $Self->{Translation}->{'Start Import'} = 'Iniciar Importação';
    $Self->{Translation}->{'Start Export'} = 'Iniciar Exportação';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = 'Passo 1 de 5 - Editar informações comuns';
    $Self->{Translation}->{'Name is required!'} = 'Nome é obrigatório!';
    $Self->{Translation}->{'Object is required!'} = 'Objeto é obrigatório!';
    $Self->{Translation}->{'Format is required!'} = 'O formato é obrigatório!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = 'Passo 2 de 5 - Editar informações do objeto';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'é obrigatório!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = 'Passo 4 de 5 - Editar informações de mapeamento';
    $Self->{Translation}->{'No map elements found.'} = 'Não há elementos mapa encontrado.';
    $Self->{Translation}->{'Add Mapping Element'} = 'Adicionar elemento de mapeamento';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = 'Passo 5 de 5 - Editar informações de pesquisa';
    $Self->{Translation}->{'Restrict export per search'} = 'Restringir exportação por pesquisa';
    $Self->{Translation}->{'Import information'} = 'Informações de importação';
    $Self->{Translation}->{'Source File'} = 'Arquivo de Origem';
    $Self->{Translation}->{'Success'} = 'Sucesso';
    $Self->{Translation}->{'Failed'} = 'Falhou';
    $Self->{Translation}->{'Duplicate names'} = 'Nomes duplicados';
    $Self->{Translation}->{'Last processed line number of import file'} = 'Último número de linha processada do arquivo de imporatação';
    $Self->{Translation}->{'Ok'} = 'Ok';

    # Perl Module: Kernel/Modules/AdminImportExport.pm
    $Self->{Translation}->{'No object backend found!'} = 'Nenhum objeto backend encontrado!';
    $Self->{Translation}->{'No format backend found!'} = 'Nenhum formato backend encontrado!';
    $Self->{Translation}->{'Template not found!'} = 'Modelo não encontrado!';
    $Self->{Translation}->{'Can\'t insert/update template!'} = 'Não é possível inserir/atualizar modelo!';
    $Self->{Translation}->{'Needed TemplateID!'} = '';
    $Self->{Translation}->{'Error occurred. Import impossible! See Syslog for details.'} = '';
    $Self->{Translation}->{'Error occurred. Export impossible! See Syslog for details.'} = '';
    $Self->{Translation}->{'number'} = '';
    $Self->{Translation}->{'number bigger than zero'} = '';
    $Self->{Translation}->{'integer'} = '';
    $Self->{Translation}->{'integer bigger than zero'} = '';
    $Self->{Translation}->{'Element required, please insert data'} = '';
    $Self->{Translation}->{'Invalid data, please insert a valid %s'} = '';
    $Self->{Translation}->{'Format not found!'} = 'Formato não encontrado!';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} =
        'Formato de registro backend do módulo de importação / exportação módulo.';
    $Self->{Translation}->{'Import and export object information.'} = 'Importar e exportar informações de objeto.';
    $Self->{Translation}->{'Import/Export'} = 'Importação/Exportação';

}

1;
