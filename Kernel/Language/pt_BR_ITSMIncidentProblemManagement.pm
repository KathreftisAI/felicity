# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_ITSMIncidentProblemManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMIncidentProblemManagement
    $Self->{Translation}->{'Add decision to ticket'} = 'Adicionar decisão ao chamado';
    $Self->{Translation}->{'Decision Date'} = 'Data de Decisão';
    $Self->{Translation}->{'Decision Result'} = 'Decisão Resultante';
    $Self->{Translation}->{'Due Date'} = 'Data de vencimento';
    $Self->{Translation}->{'Reason'} = 'Razão';
    $Self->{Translation}->{'Recovery Start Time'} = 'Horário Inicial de Recuperação';
    $Self->{Translation}->{'Repair Start Time'} = 'Horário Inicial de Reparo';
    $Self->{Translation}->{'Review Required'} = 'Revisão Requisitada';
    $Self->{Translation}->{'closed with workaround'} = 'fechado com solução de contorno';

    # Template: AgentTicketActionCommon
    $Self->{Translation}->{'Change Decision of Ticket'} = 'Alterar Decisão de Chamado';
    $Self->{Translation}->{'Change ITSM fields of ticket'} = 'Alterar os campos ITSM do chamado';
    $Self->{Translation}->{'Service Incident State'} = 'Estado de Incidente do Serviço';

    # Template: AgentTicketEmail
    $Self->{Translation}->{'Link ticket'} = 'Associar chamado';

    # Template: AgentTicketOverviewPreview
    $Self->{Translation}->{'Criticality'} = 'Criticalidade';
    $Self->{Translation}->{'Impact'} = 'Impacto';

    # SysConfig
    $Self->{Translation}->{'Add a decision!'} = 'Adicionar uma decisão!';
    $Self->{Translation}->{'Additional ITSM Fields'} = 'Campos adicionais ITSM';
    $Self->{Translation}->{'Additional ITSM ticket fields.'} = 'Campos adicionais de Ticket ITSM';
    $Self->{Translation}->{'Allows adding notes in the additional ITSM field screen of the agent interface.'} =
        'Permite adicionar notas na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Allows adding notes in the decision screen of the agent interface.'} =
        'Permite adicionar notas na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Change the ITSM fields!'} = 'Alterar campos ITSM!';
    $Self->{Translation}->{'Decision'} = 'Decisão';
    $Self->{Translation}->{'Defines if a ticket lock is required in the additional ITSM field screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Define se um bloqueio de chamado é exigido na tela de campos adicionais ITSM da interface de atendente (se o chamado não estiver bloqueado ainda, o chamado será bloqueadoe o atendente atual será automaticamente definido como seu proprietário).';
    $Self->{Translation}->{'Defines if a ticket lock is required in the decision screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Define se um bloqueio de chamado é exigido na tela de decisão da interface de atendente (se o chamado não estiver bloqueado ainda, o chamado será bloqueadoe o atendente atual será automaticamente definido como seu proprietário).';
    $Self->{Translation}->{'Defines if the service incident state should be shown during service selection in the agent interface.'} =
        'Define se o estado de incidente do serviço deve ser mostrado durante a seleção de serviço na interface de atendente.';
    $Self->{Translation}->{'Defines the default body of a note in the additional ITSM field screen of the agent interface.'} =
        'Define o corpo padrão de uma nota na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Defines the default body of a note in the decision screen of the agent interface.'} =
        'Define o corpo padrão de uma nota na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        'Define o próximo estado padrão de um chamado após a adição de uma nota, na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        'Define o próximo estado padrão de um chamado após a adição de uma nota, na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Defines the default subject of a note in the additional ITSM field screen of the agent interface.'} =
        'Define o assunto padrão de uma nota na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Defines the default subject of a note in the decision screen of the agent interface.'} =
        'Define o assunto padrão de uma nota na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Defines the default ticket priority in the additional ITSM field screen of the agent interface.'} =
        'Define a prioridade padrão de chamado na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Defines the default ticket priority in the decision screen of the agent interface.'} =
        'Define a prioridade padrão de chamado na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Defines the default type of the note in the additional ITSM field screen of the agent interface.'} =
        'Define o tipo padrão de uma nota na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Defines the default type of the note in the decision screen of the agent interface.'} =
        'Define o tipo padrão de uma nota na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Defines the history comment for the additional ITSM field screen action, which gets used for ticket history.'} =
        'Define o comentário de histórico para a ação de campos adicionais ITSM, que é usado no histórico do chamado.';
    $Self->{Translation}->{'Defines the history comment for the decision screen action, which gets used for ticket history.'} =
        'Define o comentário de histórico para a ação de decisão, que é usado no histórico do chamado.';
    $Self->{Translation}->{'Defines the history type for the additional ITSM field screen action, which gets used for ticket history.'} =
        'Define o tipo de histórico para a ação de campos adicionais ITSM, que é usado no histórico do chamado.';
    $Self->{Translation}->{'Defines the history type for the decision screen action, which gets used for ticket history.'} =
        'Define o tipo de histórico para a ação de decisão, que é usado no histórico do chamado.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        'Define o próximo estado de um chamado após a adição de uma nota, na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        'Define o próximo estado de um chamado após a adição de uma nota, na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Dynamic fields shown in the additional ITSM field screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Campos dinâmicos mostrados na tela de campos adicionais ITSM da interface de atendente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado, 2 = Habilitado e requerido.';
    $Self->{Translation}->{'Dynamic fields shown in the decision screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Campos dinâmicos mostrados na tela de decisão da interface de atendente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado, 2 = Habilitado e requerido.';
    $Self->{Translation}->{'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Campos dinâmicos mostrados na tela de pesquisa de chamado da interface de atendente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado.';
    $Self->{Translation}->{'Dynamic fields shown in the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Campos dinâmicos mostrados na tela de detalhes do chamado da interface de atendente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado.';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket first level solution rate.'} =
        'Permite que o módulo de estatísticas gere estatísticas sobre o nível médio de chamados ITSM no primeiro nível de solução.';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket solution.'} =
        'Permite que o módulo de estatísticas gere estatísticas sobre o nível médio de chamados ITSM no primeiro nível de solução.';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the additional ITSM field screen of the agent interface.'} =
        'Se uma nota é adicionada por um atendente, define o estado de um chamado na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the decision screen of the agent interface.'} =
        'Se uma nota é adicionada por um atendente, define o estado de um chamado na tela de decisão da interface dd atendente.';
    $Self->{Translation}->{'Required permissions to use the additional ITSM field screen in the agent interface.'} =
        'Permissões necessárias para usar a tela de campos adicionais ITSM na interface de atendente.';
    $Self->{Translation}->{'Required permissions to use the decision screen in the agent interface.'} =
        'Permissões necessárias para usar a tela de decisão na interface de atendente.';
    $Self->{Translation}->{'Sets the service in the additional ITSM field screen of the agent interface (Ticket::Service needs to be activated).'} =
        'Define o serviço adicional na tela de campos adicionais ITSM de interface do atendente (Chamado::Serviço precisa estar ativado).';
    $Self->{Translation}->{'Sets the service in the decision screen of the agent interface (Ticket::Service needs to be activated).'} =
        'Define o serviço na tela de decisão da interface de atendente (Chamado::Serviço precisa estar ativado).';
    $Self->{Translation}->{'Sets the ticket owner in the additional ITSM field screen of the agent interface.'} =
        'Define o proprietário do chamado na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Sets the ticket owner in the decision screen of the agent interface.'} =
        'Define o proprietário do chamado na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Sets the ticket responsible in the additional ITSM field screen of the agent interface.'} =
        'Define o responsável pelo chamado de tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Sets the ticket responsible in the decision screen of the agent interface.'} =
        'Define o responsável pelo chamado na tela decisão da interface de atendente.';
    $Self->{Translation}->{'Sets the ticket type in the additional ITSM field screen of the agent interface (Ticket::Type needs to be activated).'} =
        'Define o tipo de chamado na tela de campos adicionais ITSM da interface de atendente. (Chamado::Tipo precisa estar ativado).';
    $Self->{Translation}->{'Sets the ticket type in the decision screen of the agent interface (Ticket::Type needs to be activated).'} =
        'Define o tipo de chamado na tela de decisão da interface de atendente (Chamado::Tipo precisa estar ativado).';
    $Self->{Translation}->{'Shows a link in the menu to change the decision of a ticket in its zoom view of the agent interface.'} =
        'Mostra um link no menu para alterar a decisão de um chamado na sua visão em detalhes na interface de atendente.';
    $Self->{Translation}->{'Shows a link in the menu to modify additional ITSM fields in the ticket zoom view of the agent interface.'} =
        'Mostra um link no menu para modificar campos adicionais ITSM na visão em detalhes de um chamado na interface de atendente.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the additional ITSM field screen of the agent interface.'} =
        'Mostra uma lista de todos os atendentes envolvidos neste chamado, na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the decision screen of the agent interface.'} =
        'Mostra uma lista de todos os atendentes envolvidos neste chamado, na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the additional ITSM field screen of the agent interface.'} =
        'Mostra uma lista de todos os atendentes possíveis (todos os atendentes com permissões de nota na fila/chamado) para determinar quem deve ser informado sobre esta nota, na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the decision screen of the agent interface.'} =
        'Mostra uma lista de todos os atendentes possíveis (todos os atendentes com permissões nota na fila/chamado) para determinar quem deve ser informado sobre esta nota, na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Shows the ticket priority options in the additional ITSM field screen of the agent interface.'} =
        'Mostra as opções de prioridade de chamado na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Shows the ticket priority options in the decision screen of the agent interface.'} =
        'Mostra as opções de prioridade de chamado na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Shows the title fields in the additional ITSM field screen of the agent interface.'} =
        'Mostra os campos de título na tela de campos adicionais ITSM da interface de atendente.';
    $Self->{Translation}->{'Shows the title fields in the decision screen of the agent interface.'} =
        'Mostra os campos de título na tela de decisão da interface de atendente.';
    $Self->{Translation}->{'Ticket decision.'} = 'Decisão de Chamado.';

}

1;
