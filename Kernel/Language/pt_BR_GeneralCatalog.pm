# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Funcionalidade';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Gerenciamento do Catálogo Geral';
    $Self->{Translation}->{'Add Catalog Item'} = 'Adicionar Item ao Catálogo';
    $Self->{Translation}->{'Add Catalog Class'} = 'Adicionar Classe ao Catálogo';
    $Self->{Translation}->{'Catalog Class'} = 'Classe do Catálogo';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Administração.';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'Criar e gerenciar o Catálogo Geral.';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        'Módulo de registo da interface para a configuração AdminGeneralCatalog na área administrativa.';
    $Self->{Translation}->{'General Catalog'} = 'Catálogo Geral';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        'Parâmetros para o comentário de exemplo 2 dos atributos do catálogo geral.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parâmetros do grupos de permissão de exemplo dos atributos do catálogo geral.';

}

1;
