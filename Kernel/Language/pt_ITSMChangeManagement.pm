# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_ITSMChangeManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMChangeManagement
    $Self->{Translation}->{'ITSMChange'} = 'Alteração';
    $Self->{Translation}->{'ITSMChanges'} = 'Alterações';
    $Self->{Translation}->{'ITSM Changes'} = 'Alterações ITSM';
    $Self->{Translation}->{'workorder'} = 'Ordem de Serviço';
    $Self->{Translation}->{'A change must have a title!'} = 'Uma Alteração deve ter um título!';
    $Self->{Translation}->{'A condition must have a name!'} = 'Uma condição deve ter um nome!';
    $Self->{Translation}->{'A template must have a name!'} = 'Um modelo deve ter um nome!';
    $Self->{Translation}->{'A workorder must have a title!'} = 'Uma ordem de serviço deve ter um título!';
    $Self->{Translation}->{'Add CAB Template'} = 'Adicionar modelo de CAB';
    $Self->{Translation}->{'Add Workorder'} = 'Adicionar Ordem';
    $Self->{Translation}->{'Add a workorder to the change'} = 'Adicionar ordem de serviço à Alteração';
    $Self->{Translation}->{'Add new condition and action pair'} = 'Adicionar nova condição e par de ações';
    $Self->{Translation}->{'Agent interface module to show the ChangeManager overview icon.'} =
        'Módulo de interface de agente para exibir o ícone de vista geral gestor de alterações.';
    $Self->{Translation}->{'Agent interface module to show the MyCAB overview icon.'} = 'Módulo de interface de agente para exibir o ícone de vista geral MeuCAB.';
    $Self->{Translation}->{'Agent interface module to show the MyChanges overview icon.'} = 'Módulo de interface de agente para exibir o ícone de vista geral Minhas Alterações.';
    $Self->{Translation}->{'Agent interface module to show the MyWorkOrders overview icon.'} =
        'Módulo de interface de agente para exibir o ícone de vista geral Minhas Ordens de Serviços.';
    $Self->{Translation}->{'CABAgents'} = 'agentes CAB';
    $Self->{Translation}->{'CABCustomers'} = 'Clientes CAB';
    $Self->{Translation}->{'Change Overview'} = 'Vista de alterações';
    $Self->{Translation}->{'Change Schedule'} = 'Agenda da alteração';
    $Self->{Translation}->{'Change involved persons of the change'} = 'Alterar pessoas envolvidas na Alteração';
    $Self->{Translation}->{'ChangeHistory::ActionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ActionAddID'} = 'Nova Ação (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ActionDelete'} = 'Ação (ID=%s) apagada';
    $Self->{Translation}->{'ChangeHistory::ActionDeleteAll'} = 'Todas as Ações de Condição (ID=%s) apagadas';
    $Self->{Translation}->{'ChangeHistory::ActionExecute'} = 'Ação (ID=%s) executada: %s';
    $Self->{Translation}->{'ChangeHistory::ActionUpdate'} = '%s (Ação ID=%s): Nova: %s -> Antiga: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeActualEndTimeReached'} = 'Alteração (ID=%s) atingiu o tempo de fim.';
    $Self->{Translation}->{'ChangeHistory::ChangeActualStartTimeReached'} = 'Alteração (ID=%s) atingiu o tempo de início.';
    $Self->{Translation}->{'ChangeHistory::ChangeAdd'} = 'Nova Alteração (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentAdd'} = 'Novo Anexo: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentDelete'} = 'Anexo apagado %s';
    $Self->{Translation}->{'ChangeHistory::ChangeCABDelete'} = 'CAB apagado %s';
    $Self->{Translation}->{'ChangeHistory::ChangeCABUpdate'} = '%s: Nova: %s -> Antiga: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkAdd'} = 'Associação a %s (ID=%s) adicionada';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkDelete'} = 'Associação a %s (ID=%s) apagada';
    $Self->{Translation}->{'ChangeHistory::ChangeNotificationSent'} = 'Notificação enviada para %s (Evento: %s)';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedEndTimeReached'} = 'Alteração (ID=%s) atingiu o tempo de fim previsto.';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedStartTimeReached'} = 'Alteração (ID=%s) atingiu o tempo de início previsto.';
    $Self->{Translation}->{'ChangeHistory::ChangeRequestedTimeReached'} = 'Alteração (ID=%s) atingiu o tempo solicitado.';
    $Self->{Translation}->{'ChangeHistory::ChangeUpdate'} = '%s: Nova: %s -> Antiga: %s';
    $Self->{Translation}->{'ChangeHistory::ConditionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ConditionAddID'} = 'Nova Condição (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ConditionDelete'} = 'Condição (ID=%s) apagada';
    $Self->{Translation}->{'ChangeHistory::ConditionDeleteAll'} = 'Todas as Condições de Alteração (ID=%s) apagadas';
    $Self->{Translation}->{'ChangeHistory::ConditionUpdate'} = '%s (Condição ID=%s): Nova: %s -> Antiga: %s';
    $Self->{Translation}->{'ChangeHistory::ExpressionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ExpressionAddID'} = 'Nova Expressão (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ExpressionDelete'} = 'Expressão (ID=%s) apagada';
    $Self->{Translation}->{'ChangeHistory::ExpressionDeleteAll'} = 'Todas as Expressões de Condição (ID=%s) apagadas';
    $Self->{Translation}->{'ChangeHistory::ExpressionUpdate'} = '%s (ID Expressão=%s): Nova: %s -> Antiga: %s';
    $Self->{Translation}->{'ChangeNumber'} = 'Número da Alteração';
    $Self->{Translation}->{'Condition Edit'} = 'Editar Condição';
    $Self->{Translation}->{'Create Change'} = 'Criar Alteração';
    $Self->{Translation}->{'Create a change from this ticket!'} = 'Criar uma Alteração a partir deste ticket!';
    $Self->{Translation}->{'Delete Workorder'} = 'Apagar Ordem de Serviço';
    $Self->{Translation}->{'Edit the change'} = 'Editar Alteração';
    $Self->{Translation}->{'Edit the conditions of the change'} = 'Editar as condições da alteração';
    $Self->{Translation}->{'Edit the workorder'} = 'Editar ordem de serviço';
    $Self->{Translation}->{'Expression'} = 'Expressão';
    $Self->{Translation}->{'Full-Text Search in Change and Workorder'} = 'Procura no texto completo de alterações e ordens de serviço';
    $Self->{Translation}->{'ITSMCondition'} = 'Condição ITSM';
    $Self->{Translation}->{'ITSMWorkOrder'} = 'Ordem de Serviço ITSM';
    $Self->{Translation}->{'Link another object to the change'} = 'Associar outro objeto à alteração';
    $Self->{Translation}->{'Link another object to the workorder'} = 'Associar outro objeto à ordem de serviço';
    $Self->{Translation}->{'Move all workorders in time'} = 'Mover todas as ordens de serviço no tempo';
    $Self->{Translation}->{'My CABs'} = 'Os meus CABs';
    $Self->{Translation}->{'My Changes'} = 'As minhas alterações';
    $Self->{Translation}->{'My Workorders'} = 'As minhas ordens';
    $Self->{Translation}->{'No XXX settings'} = 'Nenhuma configuração \'%s\'';
    $Self->{Translation}->{'PIR (Post Implementation Review)'} = 'RPI (Revista Pós-Implementação)';
    $Self->{Translation}->{'PSA (Projected Service Availability)'} = 'DPS (DisponibilAntiguidade Projetada de Serviço)';
    $Self->{Translation}->{'Please select first a catalog class!'} = 'Por favor, selecione primeiro uma classe de catálogo!';
    $Self->{Translation}->{'Print the change'} = 'Imprimir alteração';
    $Self->{Translation}->{'Print the workorder'} = 'Imprimir ordem de serviço';
    $Self->{Translation}->{'RequestedTime'} = 'Solicitado em';
    $Self->{Translation}->{'Save Change CAB as Template'} = 'Guardar CAB da alteração como modelo';
    $Self->{Translation}->{'Save change as a template'} = 'Guardar alteração como modelo';
    $Self->{Translation}->{'Save workorder as a template'} = 'Guardar ordem de serviço como modelo';
    $Self->{Translation}->{'Search Changes'} = 'Procurar alterações';
    $Self->{Translation}->{'Set the agent for the workorder'} = 'Alocar agente à ordem de serviço';
    $Self->{Translation}->{'Take Workorder'} = 'Assumir ordem de serviço';
    $Self->{Translation}->{'Take the workorder'} = 'Assumir a ordem de serviço';
    $Self->{Translation}->{'Template Overview'} = 'Cista de Modelos';
    $Self->{Translation}->{'The planned end time is invalid!'} = 'O tempo de fim planeado é inválido!';
    $Self->{Translation}->{'The planned start time is invalid!'} = 'O tempo de início planeado é inválido!';
    $Self->{Translation}->{'The planned time is invalid!'} = 'O tempo planeado é inválido!';
    $Self->{Translation}->{'The requested time is invalid!'} = 'O tempo indicado é inválido!';
    $Self->{Translation}->{'New (from template)'} = 'Nova (utilizando modelo)';
    $Self->{Translation}->{'Add from template'} = 'Adicionar utilizando modelo';
    $Self->{Translation}->{'Add Workorder (from template)'} = 'Adicionar ordem (com modelo)';
    $Self->{Translation}->{'Add a workorder (from template) to the change'} = 'Adicionar uma ordem (com modelo) à mudança';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReached'} = 'Ordem de Serviço (ID=%s) atingiu o tempo de fim.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReachedWithWorkOrderID'} =
        'Ordem de Serviço (ID=%s) atingiu o tempo de fim.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReached'} = 'Ordem de Serviço (ID=%s) atingiu o tempo de início.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReachedWithWorkOrderID'} =
        'Ordem de Serviço (ID=%s) atingiu o tempo de início.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAdd'} = 'Nova Ordem de Serviço (ID=%s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAddWithWorkOrderID'} = 'Nova Ordem de Serviço (ID=%s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAdd'} = 'Novo anexo à ordem %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAddWithWorkOrderID'} = '(ID=%s) Novo anexo à ordem: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDelete'} = 'Anexo apagado da ordem: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDeleteWithWorkOrderID'} = '(ID=%s) anexo apagado da ordem: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAdd'} = '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAddWithWorkOrderID'} =
        '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDelete'} = '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDeleteWithWorkOrderID'} =
        '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDelete'} = 'Ordem (ID=%s) apagada';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDeleteWithWorkOrderID'} = 'Ordem (ID=%s) apagada';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAdd'} = 'Associação a %s (ID=%s) adicionada';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAddWithWorkOrderID'} = '(ID=%s) Associação a %s (ID=%s) adicionada';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDelete'} = 'Associação a %s (ID=%s) apagada';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDeleteWithWorkOrderID'} = '(ID=%s) Associação a %s (ID=%s) apagada';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSent'} = 'Notificação enviada para %s (Evento: %s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSentWithWorkOrderID'} = '(ID=%s) Notificação enviada para %s (Evento: %s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReached'} = 'Ordem de Serviço (ID=%s) atingiu o tempo final previsto.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReachedWithWorkOrderID'} =
        'Ordem de Serviço (ID=%s) atingiu o tempo final previsto.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReached'} = 'Ordem de Serviço (ID=%s) atingiu o tempo de início previsto.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReachedWithWorkOrderID'} =
        'Ordem de Serviço (ID=%s) atingiu o tempo de início previsto.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdate'} = '%s: Nova: %s -> Antiga: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdateWithWorkOrderID'} = '(ID=%s) %s: Nova: %s -> Antiga: %s';
    $Self->{Translation}->{'WorkOrderNumber'} = 'Número da Ordem de Serviço';
    $Self->{Translation}->{'accepted'} = 'Aceite';
    $Self->{Translation}->{'any'} = 'qualquer';
    $Self->{Translation}->{'approval'} = 'Aprovação';
    $Self->{Translation}->{'approved'} = 'Aprovada';
    $Self->{Translation}->{'backout'} = 'Plano de Retorno';
    $Self->{Translation}->{'begins with'} = 'inicia com';
    $Self->{Translation}->{'canceled'} = 'Cancelada';
    $Self->{Translation}->{'contains'} = 'contém';
    $Self->{Translation}->{'created'} = 'Criada';
    $Self->{Translation}->{'decision'} = 'Decisão';
    $Self->{Translation}->{'ends with'} = 'termina com';
    $Self->{Translation}->{'failed'} = 'Falhou';
    $Self->{Translation}->{'in progress'} = 'Em curso';
    $Self->{Translation}->{'is'} = 'é';
    $Self->{Translation}->{'is after'} = 'depois de';
    $Self->{Translation}->{'is before'} = 'antes de';
    $Self->{Translation}->{'is empty'} = 'é vazio';
    $Self->{Translation}->{'is greater than'} = 'é maior que';
    $Self->{Translation}->{'is less than'} = 'é menor que';
    $Self->{Translation}->{'is not'} = 'não é';
    $Self->{Translation}->{'is not empty'} = 'não está vazio';
    $Self->{Translation}->{'not contains'} = 'não contém';
    $Self->{Translation}->{'pending approval'} = 'Aprovação Pendente';
    $Self->{Translation}->{'pending pir'} = 'RPI Pendente';
    $Self->{Translation}->{'pir'} = 'RPI (Revista Pós-Implementação)';
    $Self->{Translation}->{'ready'} = 'Pronta';
    $Self->{Translation}->{'rejected'} = 'Rejeitada';
    $Self->{Translation}->{'requested'} = 'Requerida';
    $Self->{Translation}->{'retracted'} = 'Retratada';
    $Self->{Translation}->{'set'} = 'configurar';
    $Self->{Translation}->{'successful'} = 'Sucesso';

    # Template: AdminITSMChangeCIPAllocate
    $Self->{Translation}->{'Category <-> Impact <-> Priority'} = 'Categoria <-> Impacto <-> Prioridade';
    $Self->{Translation}->{'Manage the priority result of combinating Category <-> Impact.'} =
        'Gestão de Prioridade a partir da combinação da categoria <-> Impacto.';
    $Self->{Translation}->{'Priority allocation'} = 'Atribuir Prioridade';

    # Template: AdminITSMChangeNotification
    $Self->{Translation}->{'ITSM ChangeManagement Notification Management'} = 'Gestão de Notificações de gestão de Alteração ITSM';
    $Self->{Translation}->{'Add Notification Rule'} = 'Adicionar Regra de Notificação';
    $Self->{Translation}->{'Rule'} = 'Regra';
    $Self->{Translation}->{'A notification should have a name!'} = 'A notificação precisa de um nome!';
    $Self->{Translation}->{'Name is required.'} = 'Nome é obrigatório.';

    # Template: AdminITSMStateMachine
    $Self->{Translation}->{'Admin State Machine'} = 'Gerir Máquina de Estado';
    $Self->{Translation}->{'Select a catalog class!'} = 'Selecione uma classe de catálogo!';
    $Self->{Translation}->{'A catalog class is required!'} = 'A classe de catálogo é necessária!';
    $Self->{Translation}->{'Add a state transition'} = 'Adicionar uma transição de estado';
    $Self->{Translation}->{'Catalog Class'} = 'Classe de Catálogo';
    $Self->{Translation}->{'Object Name'} = 'Nome do Objeto';
    $Self->{Translation}->{'Overview over state transitions for'} = 'Revisão da transição de estado para';
    $Self->{Translation}->{'Delete this state transition'} = 'Excluir esta transição de estado';
    $Self->{Translation}->{'Add a new state transition for'} = 'Adicionar uma nova transição de estado para';
    $Self->{Translation}->{'Please select a state!'} = 'Por favor selecione um estado!';
    $Self->{Translation}->{'Please select a next state!'} = 'Por favor, escolha o próximo estado!';
    $Self->{Translation}->{'Edit a state transition for'} = 'Editar uma transição de estado para';
    $Self->{Translation}->{'Do you really want to delete the state transition'} = 'Você quer mesmo Apagar esta transição de estado?';

    # Template: AgentITSMChangeAdd
    $Self->{Translation}->{'Add Change'} = 'Adicionar Alteração';
    $Self->{Translation}->{'ITSM Change'} = 'Alteração';
    $Self->{Translation}->{'Justification'} = 'Justificação';
    $Self->{Translation}->{'Input invalid.'} = 'Entrada inválida.';
    $Self->{Translation}->{'Impact'} = 'Impacto';
    $Self->{Translation}->{'Requested Date'} = 'Data Solicitada';

    # Template: AgentITSMChangeAddFromTemplate
    $Self->{Translation}->{'Select Change Template'} = 'Selecione modelo de Alteração';
    $Self->{Translation}->{'Time type'} = 'Tipo de Horário';
    $Self->{Translation}->{'Invalid time type.'} = 'Tipo de horário inválido.';
    $Self->{Translation}->{'New time'} = 'Novo horário';

    # Template: AgentITSMChangeCABTemplate
    $Self->{Translation}->{'Save Change CAB as template'} = 'Guardar CAB da Alteração como modelo';
    $Self->{Translation}->{'go to involved persons screen'} = 'ir para o ecrãn "Pessoas Envolvidas"';
    $Self->{Translation}->{'Invalid Name'} = 'Nome inválido';

    # Template: AgentITSMChangeCondition
    $Self->{Translation}->{'Conditions and Actions'} = 'Condições e Ações';
    $Self->{Translation}->{'Delete Condition'} = 'Apagar Condição';
    $Self->{Translation}->{'Add new condition'} = 'Adicionar nova condição';

    # Template: AgentITSMChangeConditionEdit
    $Self->{Translation}->{'Edit Condition'} = '';
    $Self->{Translation}->{'Need a valid name.'} = 'Um nome válido é necessário.';
    $Self->{Translation}->{'A valid name is needed.'} = '';
    $Self->{Translation}->{'Duplicate name:'} = '';
    $Self->{Translation}->{'This name is already used by another condition.'} = '';
    $Self->{Translation}->{'Matching'} = 'Combinação';
    $Self->{Translation}->{'Any expression (OR)'} = 'Qualquer expressão lógica (OU)';
    $Self->{Translation}->{'All expressions (AND)'} = 'Todas as expressões lógicas (E)';
    $Self->{Translation}->{'Expressions'} = 'Expressões';
    $Self->{Translation}->{'Selector'} = 'Seletor';
    $Self->{Translation}->{'Operator'} = 'Operador';
    $Self->{Translation}->{'Delete Expression'} = 'Excluir Expressão';
    $Self->{Translation}->{'No Expressions found.'} = 'Nenhuma expressão lógica encontrada.';
    $Self->{Translation}->{'Add new expression'} = 'Adicionar nova expressão';
    $Self->{Translation}->{'Delete Action'} = 'Excluir Ação';
    $Self->{Translation}->{'No Actions found.'} = 'Nenhuma ação encontrada.';
    $Self->{Translation}->{'Add new action'} = 'Adicionar nova ação';

    # Template: AgentITSMChangeDelete
    $Self->{Translation}->{'Do you really want to delete this change?'} = 'Você quer realmente excluir esta mudança?';

    # Template: AgentITSMChangeHistory
    $Self->{Translation}->{'History of'} = 'Histórico de';
    $Self->{Translation}->{'Workorder'} = 'Ordem de Serviço';
    $Self->{Translation}->{'Show details'} = 'Mostrar detalhes';
    $Self->{Translation}->{'Show workorder'} = 'Mostrar Ordem de Serviço';

    # Template: AgentITSMChangeHistoryZoom
    $Self->{Translation}->{'Detailed history information of'} = 'Informações detalhadas sobre o histórico de';
    $Self->{Translation}->{'Modified'} = 'Modificado';
    $Self->{Translation}->{'Old Value'} = 'Antigo valor';
    $Self->{Translation}->{'New Value'} = 'Novo valor';

    # Template: AgentITSMChangeInvolvedPersons
    $Self->{Translation}->{'Involved Persons'} = 'Pessoas Envolvidas';
    $Self->{Translation}->{'ChangeManager'} = 'gestor da Alteração';
    $Self->{Translation}->{'User invalid.'} = 'Utilizador inválido';
    $Self->{Translation}->{'ChangeBuilder'} = 'Construtor da Alteração';
    $Self->{Translation}->{'Change Advisory Board'} = 'Conselho Consultivo de Alteração';
    $Self->{Translation}->{'CAB Template'} = 'Modelo de CAB';
    $Self->{Translation}->{'Apply Template'} = 'Aplicar Modelo';
    $Self->{Translation}->{'NewTemplate'} = 'Novo modelo';
    $Self->{Translation}->{'Save this CAB as template'} = 'Guardar este CAB como modelo';
    $Self->{Translation}->{'Add to CAB'} = 'Adicionar ao CAB';
    $Self->{Translation}->{'Invalid User'} = 'Utilizador inválido';
    $Self->{Translation}->{'Current CAB'} = 'CAB Atual';

    # Template: AgentITSMChangeOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Configurações de Contexto';
    $Self->{Translation}->{'Changes per page'} = 'Alterações por página';

    # Template: AgentITSMChangeOverviewSmall
    $Self->{Translation}->{'WorkOrderTitle'} = 'Título da Ordem de Serviço';
    $Self->{Translation}->{'ChangeTitle'} = 'Título da Alteração';
    $Self->{Translation}->{'WorkOrderAgent'} = 'agente da Ordem de Serviço';
    $Self->{Translation}->{'Workorders'} = 'Ordem de Serviço';
    $Self->{Translation}->{'ChangeState'} = 'Estado da Alteração';
    $Self->{Translation}->{'WorkOrderState'} = 'Estado da Ordem de Serviço';
    $Self->{Translation}->{'WorkOrderType'} = 'Tipo da Ordem de Serviço';
    $Self->{Translation}->{'Requested Time'} = 'Horário solicitado';
    $Self->{Translation}->{'PlannedStartTime'} = 'Início planeado';
    $Self->{Translation}->{'PlannedEndTime'} = 'fim planeado';
    $Self->{Translation}->{'ActualStartTime'} = 'Início Real';
    $Self->{Translation}->{'ActualEndTime'} = 'fim Real';

    # Template: AgentITSMChangeReset
    $Self->{Translation}->{'Do you really want to reset this change?'} = 'Você quer realmente redefinir esta mudança?';

    # Template: AgentITSMChangeSearch
    $Self->{Translation}->{'(e.g. 10*5155 or 105658*)'} = '(ex. 10*5155 ou 105658*)';
    $Self->{Translation}->{'CABAgent'} = 'agente CAB';
    $Self->{Translation}->{'e.g.'} = 'ex.';
    $Self->{Translation}->{'CABCustomer'} = 'Cliente CAB';
    $Self->{Translation}->{'ITSM Workorder'} = 'Ordem de Serviço ITSM';
    $Self->{Translation}->{'Instruction'} = 'Instrução';
    $Self->{Translation}->{'Report'} = 'Relatório';
    $Self->{Translation}->{'Change Category'} = 'Categoria da Alteração';
    $Self->{Translation}->{'(before/after)'} = '(antes/depois)';
    $Self->{Translation}->{'(between)'} = '(entre)';

    # Template: AgentITSMChangeTemplate
    $Self->{Translation}->{'Save Change as Template'} = 'Guardar Alteração como Modelo';
    $Self->{Translation}->{'A template should have a name!'} = 'Um modelo precisa de um nome!';
    $Self->{Translation}->{'The template name is required.'} = 'O nome do modelo é necessário.';
    $Self->{Translation}->{'Reset States'} = 'Restabelecer Estados';
    $Self->{Translation}->{'Overwrite original template'} = '';
    $Self->{Translation}->{'Delete original change'} = '';

    # Template: AgentITSMChangeTimeSlot
    $Self->{Translation}->{'Move Time Slot'} = 'Deslocar Horários';

    # Template: AgentITSMChangeZoom
    $Self->{Translation}->{'Change Information'} = 'Informação da Alteração';
    $Self->{Translation}->{'PlannedEffort'} = 'Esforço planeado';
    $Self->{Translation}->{'Change Initiator(s)'} = 'Iniciador(es) da Alteração';
    $Self->{Translation}->{'Change Manager'} = 'Gestor de Alteração';
    $Self->{Translation}->{'Change Builder'} = 'Construtor da Alteração';
    $Self->{Translation}->{'CAB'} = 'CAB';
    $Self->{Translation}->{'Last changed'} = 'Última alteração';
    $Self->{Translation}->{'Last changed by'} = 'Última alteração por';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        'Para abrir as ligações abaixo poderá necessitar de premir a tecla CTRL (ou CMD) ou Shift (dependendo do browser e do sistema operativo) quando clicar sobre a ligação';
    $Self->{Translation}->{'Download Attachment'} = 'Descarregar Anexo';

    # Template: AgentITSMTemplateEditCAB
    $Self->{Translation}->{'Edit CAB Template'} = '';

    # Template: AgentITSMTemplateEditContent
    $Self->{Translation}->{'This will create a new change from this template, so you can edit and save it.'} =
        '';
    $Self->{Translation}->{'The new change will be deleted automatically after it has been saved as template.'} =
        '';
    $Self->{Translation}->{'This will create a new workorder from this template, so you can edit and save it.'} =
        '';
    $Self->{Translation}->{'A temporary change will be created which contains the workorder.'} =
        '';
    $Self->{Translation}->{'The temporary change and new workorder will be deleted automatically after the workorder has been saved as template.'} =
        '';
    $Self->{Translation}->{'Do you want to proceed?'} = '';

    # Template: AgentITSMTemplateOverviewSmall
    $Self->{Translation}->{'TemplateID'} = 'Template-ID';
    $Self->{Translation}->{'Edit Content'} = '';
    $Self->{Translation}->{'CreateBy'} = 'Criado por';
    $Self->{Translation}->{'CreateTime'} = 'Criado em';
    $Self->{Translation}->{'ChangeBy'} = 'Alterado por';
    $Self->{Translation}->{'ChangeTime'} = 'Alterado em';
    $Self->{Translation}->{'Edit Template Content'} = '';
    $Self->{Translation}->{'Delete Template'} = 'Apagar modelo';

    # Template: AgentITSMWorkOrderAdd
    $Self->{Translation}->{'Add Workorder to'} = 'Adicionar ordem de serviço a';
    $Self->{Translation}->{'Invalid workorder type.'} = 'Tipo de ordem de serviço inválido';
    $Self->{Translation}->{'The planned start time must be before the planned end time!'} = 'O tempo de início planeado deve ser anterior ao horário de fim planeado!';
    $Self->{Translation}->{'Invalid format.'} = 'Formato Inválido.';

    # Template: AgentITSMWorkOrderAddFromTemplate
    $Self->{Translation}->{'Select Workorder Template'} = 'Selecione modelo de ordem de serviço';

    # Template: AgentITSMWorkOrderDelete
    $Self->{Translation}->{'Do you really want to delete this workorder?'} = 'Deseja apagar esta ordem de serviço?';
    $Self->{Translation}->{'You can not delete this Workorder. It is used in at least one Condition!'} =
        'Não é possível apagar esta ordem de serviço. É utilizada pelo menos numa condição!';
    $Self->{Translation}->{'This Workorder is used in the following Condition(s)'} = 'Esta ordem de serviço está em utilização na(s) condição(ões)';

    # Template: AgentITSMWorkOrderEdit
    $Self->{Translation}->{'Move following workorders accordingly'} = 'Mover as seguintes ordens de acordo';
    $Self->{Translation}->{'If the planned end time of this workorder is changed, the planned start times of all following workorders will be changed accordingly'} =
        'Se o término planejado desta ordem de serviço for alterado, o horário planejado de início de todas as seguintes ordens também serão alterados';

    # Template: AgentITSMWorkOrderReport
    $Self->{Translation}->{'The actual start time must be before the actual end time!'} = 'O tempo de início real deve ser anterior ao tempo final real !';
    $Self->{Translation}->{'The actual start time must be set, when the actual end time is set!'} =
        'O tempo de início real deve ser definido, quando o tempo de fim real é configurado!';

    # Template: AgentITSMWorkOrderTake
    $Self->{Translation}->{'Current Agent'} = 'agente atual';
    $Self->{Translation}->{'Do you really want to take this workorder?'} = 'Deseja assumir esta ordem de serviço?';

    # Template: AgentITSMWorkOrderTemplate
    $Self->{Translation}->{'Save Workorder as Template'} = 'Guardar Ordem de Serviço como Modelo';
    $Self->{Translation}->{'Delete original workorder (and surrounding change)'} = '';

    # Template: AgentITSMWorkOrderZoom
    $Self->{Translation}->{'Workorder Information'} = 'Informação da Ordem de Serviço';

    # Perl Module: Kernel/Modules/AdminITSMChangeNotification.pm
    $Self->{Translation}->{'Unknown notification %s!'} = '';
    $Self->{Translation}->{'There was an error creating the notification.'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChange.pm
    $Self->{Translation}->{'Overview: ITSM Changes'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeAdd.pm
    $Self->{Translation}->{'Ticket with TicketID %s does not exist!'} = '';
    $Self->{Translation}->{'Please contact the admin.'} = '';
    $Self->{Translation}->{'Missing sysconfig option "ITSMChange::AddChangeLinkTicketTypes"!'} =
        '';
    $Self->{Translation}->{'Was not able to add change!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeAddFromTemplate.pm
    $Self->{Translation}->{'Was not able to create change from template!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeCABTemplate.pm
    $Self->{Translation}->{'No ChangeID is given!'} = '';
    $Self->{Translation}->{'No change found for changeID %s.'} = '';
    $Self->{Translation}->{'The CAB of change "%s" could not be serialized.'} = '';
    $Self->{Translation}->{'Could not add the template.'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeCondition.pm
    $Self->{Translation}->{'Change "%s" not found in database!'} = '';
    $Self->{Translation}->{'Could not delete ConditionID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeConditionEdit.pm
    $Self->{Translation}->{'No %s is given!'} = '';
    $Self->{Translation}->{'Could not create new condition!'} = '';
    $Self->{Translation}->{'Could not update ConditionID %s!'} = '';
    $Self->{Translation}->{'Could not update ExpressionID %s!'} = '';
    $Self->{Translation}->{'Could not add new Expression!'} = '';
    $Self->{Translation}->{'Could not update ActionID %s!'} = '';
    $Self->{Translation}->{'Could not add new Action!'} = '';
    $Self->{Translation}->{'Could not delete ExpressionID %s!'} = '';
    $Self->{Translation}->{'Could not delete ActionID %s!'} = '';
    $Self->{Translation}->{'Error: Unknown field type "%s"!'} = '';
    $Self->{Translation}->{'ConditionID %s does not belong to the given ChangeID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeDelete.pm
    $Self->{Translation}->{'Change "%s" does not have an allowed change state to be deleted!'} =
        '';
    $Self->{Translation}->{'Was not able to delete the changeID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeEdit.pm
    $Self->{Translation}->{'Was not able to update Change!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no ChangeID is given!'} = '';
    $Self->{Translation}->{'Change "%s" not found in the database!'} = '';
    $Self->{Translation}->{'Unknown type "%s" encountered!'} = '';
    $Self->{Translation}->{'Change History'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistoryZoom.pm
    $Self->{Translation}->{'Can\'t show history zoom, no HistoryEntryID is given!'} = '';
    $Self->{Translation}->{'HistoryEntry "%s" not found in database!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeInvolvedPersons.pm
    $Self->{Translation}->{'Was not able to update Change CAB for Change %s!'} = '';
    $Self->{Translation}->{'Was not able to update Change %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeManager.pm
    $Self->{Translation}->{'Overview: ChangeManager'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyCAB.pm
    $Self->{Translation}->{'Overview: My CAB'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyChanges.pm
    $Self->{Translation}->{'Overview: My Changes'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyWorkOrders.pm
    $Self->{Translation}->{'Overview: My Workorders'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangePIR.pm
    $Self->{Translation}->{'Overview: PIR'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangePSA.pm
    $Self->{Translation}->{'Overview: PSA'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangePrint.pm
    $Self->{Translation}->{'WorkOrder "%s" not found in database!'} = '';
    $Self->{Translation}->{'Can\'t create output, as the workorder is not attached to a change!'} =
        '';
    $Self->{Translation}->{'Can\'t create output, as no ChangeID is given!'} = '';
    $Self->{Translation}->{'unknown change title'} = '';
    $Self->{Translation}->{'unknown workorder title'} = '';
    $Self->{Translation}->{'ITSM Workorder Overview (%s)'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeReset.pm
    $Self->{Translation}->{'Was not able to reset WorkOrder %s of Change %s!'} = '';
    $Self->{Translation}->{'Was not able to reset Change %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeSchedule.pm
    $Self->{Translation}->{'Overview: Change Schedule'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeSearch.pm
    $Self->{Translation}->{'Change Search'} = '';
    $Self->{Translation}->{'WorkOrders'} = 'Ordens de Serviço';
    $Self->{Translation}->{'Change Search Result'} = '';
    $Self->{Translation}->{'Change Number'} = '';
    $Self->{Translation}->{'Change Title'} = '';
    $Self->{Translation}->{'Work Order Title'} = '';
    $Self->{Translation}->{'CAB Agent'} = '';
    $Self->{Translation}->{'CAB Customer'} = '';
    $Self->{Translation}->{'Change Description'} = '';
    $Self->{Translation}->{'Change Justification'} = '';
    $Self->{Translation}->{'WorkOrder Instruction'} = '';
    $Self->{Translation}->{'WorkOrder Report'} = '';
    $Self->{Translation}->{'Change Priority'} = '';
    $Self->{Translation}->{'Change Impact'} = '';
    $Self->{Translation}->{'Change State'} = '';
    $Self->{Translation}->{'Created By'} = '';
    $Self->{Translation}->{'WorkOrder State'} = '';
    $Self->{Translation}->{'WorkOrder Type'} = '';
    $Self->{Translation}->{'WorkOrder Agent'} = '';
    $Self->{Translation}->{'Planned Start Time'} = '';
    $Self->{Translation}->{'Planned End Time'} = '';
    $Self->{Translation}->{'Actual Start Time'} = '';
    $Self->{Translation}->{'Actual End Time'} = '';
    $Self->{Translation}->{'Change Time'} = '';
    $Self->{Translation}->{'before'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeTemplate.pm
    $Self->{Translation}->{'The change "%s" could not be serialized.'} = '';
    $Self->{Translation}->{'Could not update the template "%s".'} = '';
    $Self->{Translation}->{'Could not delete change "%s".'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeTimeSlot.pm
    $Self->{Translation}->{'The change can\'t be moved, as it has no workorders.'} = '';
    $Self->{Translation}->{'Add a workorder first.'} = '';
    $Self->{Translation}->{'Can\'t move a change which already has started!'} = '';
    $Self->{Translation}->{'Please move the individual workorders instead.'} = '';
    $Self->{Translation}->{'The current %s could not be determined.'} = '';
    $Self->{Translation}->{'The %s of all workorders has to be defined.'} = '';
    $Self->{Translation}->{'Was not able to move time slot for workorder #%s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMTemplateDelete.pm
    $Self->{Translation}->{'You need %s permission!'} = '';
    $Self->{Translation}->{'No TemplateID is given!'} = '';
    $Self->{Translation}->{'Template "%s" not found in database!'} = '';
    $Self->{Translation}->{'Was not able to delete the template %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEdit.pm
    $Self->{Translation}->{'Was not able to update Template %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEditCAB.pm
    $Self->{Translation}->{'Was not able to update Template "%s"!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEditContent.pm
    $Self->{Translation}->{'Was not able to create change!'} = '';
    $Self->{Translation}->{'Was not able to create workorder from template!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMTemplateOverview.pm
    $Self->{Translation}->{'Overview: Template'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderAdd.pm
    $Self->{Translation}->{'You need %s permissions on the change!'} = '';
    $Self->{Translation}->{'Was not able to add workorder!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderAgent.pm
    $Self->{Translation}->{'No WorkOrderID is given!'} = '';
    $Self->{Translation}->{'Was not able to set the workorder agent of the workorder "%s" to empty!'} =
        '';
    $Self->{Translation}->{'Was not able to update the workorder "%s"!'} = '';
    $Self->{Translation}->{'Could not find Change for WorkOrder %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderDelete.pm
    $Self->{Translation}->{'Was not able to delete the workorder %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderEdit.pm
    $Self->{Translation}->{'Was not able to update WorkOrder %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no WorkOrderID is given!'} = '';
    $Self->{Translation}->{'WorkOrder "%s" not found in the database!'} = '';
    $Self->{Translation}->{'WorkOrderHistory::'} = '';
    $Self->{Translation}->{'WorkOrder History'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderHistoryZoom.pm
    $Self->{Translation}->{'History entry "%s" not found in the database!'} = '';
    $Self->{Translation}->{'WorkOrder History Zoom'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderTake.pm
    $Self->{Translation}->{'Was not able to take the workorder %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderTemplate.pm
    $Self->{Translation}->{'The workorder "%s" could not be serialized.'} = '';

    # Perl Module: Kernel/Output/HTML/Layout/ITSMChange.pm
    $Self->{Translation}->{'Need config option %s!'} = '';
    $Self->{Translation}->{'Config option %s needs to be a HASH ref!'} = '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';
    $Self->{Translation}->{'Title: %s | Type: %s'} = '';

    # Perl Module: Kernel/Output/HTML/ToolBar/MyWorkOrders.pm
    $Self->{Translation}->{'My Work Orders'} = '';

    # SysConfig
    $Self->{Translation}->{'A list of the agents who have permission to take workorders. Key is a login name. Content is 0 or 1.'} =
        'Lista dos agentes que têm permissão para ter Ordens de Serviço.Chave é um nome de login.O conteúdo é 0 ou 1';
    $Self->{Translation}->{'A list of workorder states, at which the ActualStartTime of a workorder will be set if it was empty at this point.'} =
        'Lista de estados de Ordem de Serviço, em que a hora de início real de uma Ordem de Serviço será definida se estiver vazia.';
    $Self->{Translation}->{'Add Workorder (from Template)'} = '';
    $Self->{Translation}->{'Add a change from template.'} = '';
    $Self->{Translation}->{'Add a change.'} = '';
    $Self->{Translation}->{'Add a workorder (from template) to the change.'} = '';
    $Self->{Translation}->{'Add a workorder to the change.'} = '';
    $Self->{Translation}->{'Admin of the CIP matrix.'} = 'Gerir matriz CIP.';
    $Self->{Translation}->{'Admin of the state machine.'} = 'Gerir máquina de estado.';
    $Self->{Translation}->{'Agent interface notification module to see the number of change advisory boards.'} =
        'Módulo de notificação da interface do agente para ver o número de CAB.';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes managed by the user.'} =
        'Módulo de notificação da interface do agente para ver o número de alterações geridas pelo utilizador.';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes.'} =
        'Módulo de notificação da interface do agente para ver o número de alterações.';
    $Self->{Translation}->{'Agent interface notification module to see the number of workorders.'} =
        '';
    $Self->{Translation}->{'CAB Member Search'} = '';
    $Self->{Translation}->{'Cache time in minutes for the change management toolbars. Default: 3 hours (180 minutes).'} =
        '';
    $Self->{Translation}->{'Cache time in minutes for the change management. Default: 5 days (7200 minutes).'} =
        '';
    $Self->{Translation}->{'Change CAB Templates'} = '';
    $Self->{Translation}->{'Change History.'} = '';
    $Self->{Translation}->{'Change Involved Persons.'} = '';
    $Self->{Translation}->{'Change Overview "Small" Limit'} = 'Limite para a vista de Alterações "pequeno"';
    $Self->{Translation}->{'Change Overview.'} = '';
    $Self->{Translation}->{'Change Print.'} = '';
    $Self->{Translation}->{'Change Schedule.'} = '';
    $Self->{Translation}->{'Change Zoom.'} = '';
    $Self->{Translation}->{'Change and Workorder Templates'} = '';
    $Self->{Translation}->{'Change and workorder templates edited by this user.'} = '';
    $Self->{Translation}->{'Change area.'} = '';
    $Self->{Translation}->{'Change involved persons of the change.'} = '';
    $Self->{Translation}->{'Change limit per page for Change Overview "Small".'} = '';
    $Self->{Translation}->{'Change search backend router of the agent interface.'} = 'Alterar pesquisa apoiada do router do agente de interface';
    $Self->{Translation}->{'Condition Overview'} = '';
    $Self->{Translation}->{'Configure which screen should be shown after a new workorder has been created.'} =
        '';
    $Self->{Translation}->{'Configures how often the notifications are sent when planned the start time or other time values have been reached/passed.'} =
        'Configura a freqüência com que as notificações são enviadas quando o tempo previsto de início ou outros valores de tempo for atingido/ultrpassado.';
    $Self->{Translation}->{'Create Change (from Template)'} = '';
    $Self->{Translation}->{'Create a change (from template) from this ticket.'} = '';
    $Self->{Translation}->{'Create a change from this ticket.'} = '';
    $Self->{Translation}->{'Create and manage ITSM Change Management notifications.'} = '';
    $Self->{Translation}->{'Default type for a workorder. This entry must exist in general catalog class \'ITSM::ChangeManagement::WorkOrder::Type\'.'} =
        'Tipo por omissão de Ordem de Serviço.Esta entrada deve existir na classe catálogo geral \'ITSM::Gestão da Alteração::Ordem de Serviço::Tipo\'.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define the signals for each workorder state.'} = 'Definição dos avisos para cada estado de Ordem de Serviço.';
    $Self->{Translation}->{'Define which columns are shown in the linked Changes widget (LinkObject::ViewMode = "complex"). Note: Only Change attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked Workorder widget (LinkObject::ViewMode = "complex"). Note: Only Workorder attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a change list.'} =
        'Define uma vista global do módulo para mostrar uma pequena vista da lista de Alterações.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a template list.'} =
        'Define uma vista global do módulo para mostrar uma pequena vistão da lista de modelos.';
    $Self->{Translation}->{'Defines if it will be possible to print the accounted time.'} = 'Define se será possível imprimir o tempo contabilizado.';
    $Self->{Translation}->{'Defines if it will be possible to print the planned effort.'} = 'Define se será possível imprimir o esforço planeado.';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) change end states should be allowed if a change is in a locked state.'} =
        '';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) workorder end states should be allowed if a workorder is in a locked state.'} =
        '';
    $Self->{Translation}->{'Defines if the accounted time should be shown.'} = 'Define se o tempo contabilizado deve ser mostrado.';
    $Self->{Translation}->{'Defines if the actual start and end times should be set.'} = 'Define se o real início e de fim deve ser definido.';
    $Self->{Translation}->{'Defines if the change search and the workorder search functions could use the mirror DB.'} =
        '';
    $Self->{Translation}->{'Defines if the change state can be set in AgentITSMChangeEdit.'} =
        'Define se o estado de Alteração pode ser definida em agenteITSMEditarAlteração.';
    $Self->{Translation}->{'Defines if the planned effort should be shown.'} = 'Define se o esforço planeado deve ser mostrado.';
    $Self->{Translation}->{'Defines if the requested date should be print by customer.'} = 'Define se a data solicitada deverá ser impressa por cliente';
    $Self->{Translation}->{'Defines if the requested date should be searched by customer.'} =
        'Define se a data solicitada deverá ser pesquisado pelo cliente..';
    $Self->{Translation}->{'Defines if the requested date should be set by customer.'} = 'Define se a data solicitada deverá ser definido pelo cliente.';
    $Self->{Translation}->{'Defines if the requested date should be shown by customer.'} = 'Define se a data solicitada deve ser indicada pelo cliente.';
    $Self->{Translation}->{'Defines if the workorder state should be shown.'} = 'Define se o estado da Ordem de Serviço deve ser mostrado.';
    $Self->{Translation}->{'Defines if the workorder title should be shown.'} = 'Define se o título da Ordem de Serviço deve ser mostrado.';
    $Self->{Translation}->{'Defines shown graph attributes.'} = 'Define mostrado atributos gráfico.';
    $Self->{Translation}->{'Defines that only changes containing Workorders linked with services, which the customer user has permission to use will be shown. Any other changes will not be displayed.'} =
        'Define que somente as alterações contendo Ordens de Serviço relacionadas com os serviços, que o utilizador cliente tem permissão para utilizar serão mostradas. Quaisquer outras alterações não serão exibidas.';
    $Self->{Translation}->{'Defines the change states that will be allowed to delete.'} = '';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change PSA overview.'} =
        'Define os estados de alteração que serão utilizado como filtros na vista global de alteração PSA.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change Schedule overview.'} =
        'Define os estados de alteração que serão utilizados como filtros na vista global de agendamento de alteração .';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyCAB overview.'} =
        'Define os estados de alteração que serão utilizados como filtros na minha vista global CAB.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyChanges overview.'} =
        'Define os estados de alteração que serão utilizados como filtros na minha vista global de Alteração.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change manager overview.'} =
        'Define os estados de alteração que serão utilizados como filtros na vista global do gestor de alterações.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change overview.'} =
        'Define os estados alteração que serão utilizados como filtros na vista global de alterações.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the customer change schedule overview.'} =
        'Define os estados de alteração que serão utilizados como filtros na vista global do cliente de agendamento de alterações.';
    $Self->{Translation}->{'Defines the default change title for a dummy change which is needed to edit a workorder template.'} =
        '';
    $Self->{Translation}->{'Defines the default sort criteria in the change PSA overview.'} =
        'Define os critérios de classificação por omissão na alteração de vista global da PSA.';
    $Self->{Translation}->{'Defines the default sort criteria in the change manager overview.'} =
        'Define os critérios de classificação por omissão na vista global da gestão de alterações.';
    $Self->{Translation}->{'Defines the default sort criteria in the change overview.'} = 'Define os critérios de classificação por omissão na vista global de alteração.';
    $Self->{Translation}->{'Defines the default sort criteria in the change schedule overview.'} =
        'Define os critérios de classificação por omissão na vista global de programação de alterações.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyCAB overview.'} =
        'Define os critérios de classificação por omissão na vista global de Alterações do "Meu CAB".';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyChanges overview.'} =
        'Define os critérios de classificação por omissão na vista global de Alterações da "Minha Alteração".';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyWorkorders overview.'} =
        'Define os critérios de classificação por omissão na vista global de alterações da "Minha Ordem de Serviço".';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the PIR overview.'} =
        'Define os critérios de classificação por omissão na vista global de Alterações PIR.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the customer change schedule overview.'} =
        'Define os critérios de classificação por omissão na vista global para os clientes programarem a Alteração.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the template overview.'} =
        'Define os critérios de classificação por omissão na vista global do modelo de Alterações.';
    $Self->{Translation}->{'Defines the default sort order in the MyCAB overview.'} = 'Define a ordem de classificação por omissão na vista global de "Meu CAB".';
    $Self->{Translation}->{'Defines the default sort order in the MyChanges overview.'} = 'Define a ordem de classificação por omissão na vista global de "Minha Alteração".';
    $Self->{Translation}->{'Defines the default sort order in the MyWorkorders overview.'} =
        'Define a ordem de classificação por omissão na vista global de "Minha Ordem de Serviço".';
    $Self->{Translation}->{'Defines the default sort order in the PIR overview.'} = 'Define a ordem de classificação por omissão na vista global de PIR.';
    $Self->{Translation}->{'Defines the default sort order in the change PSA overview.'} = 'Define a ordem de classificação por omissão na vista global de Alteração PSA.';
    $Self->{Translation}->{'Defines the default sort order in the change manager overview.'} =
        'Define a ordem de classificação por omissão na vista global da gestão de Alteração.';
    $Self->{Translation}->{'Defines the default sort order in the change overview.'} = 'Define a ordem de classificação por omissão na vista global de Alteração.';
    $Self->{Translation}->{'Defines the default sort order in the change schedule overview.'} =
        'Define a ordem de classificação por omissão na vista global de programar a Alteração.';
    $Self->{Translation}->{'Defines the default sort order in the customer change schedule overview.'} =
        'Define a ordem de classificação por omissão na vista global do cliente programar a Alteração.';
    $Self->{Translation}->{'Defines the default sort order in the template overview.'} = 'Define a ordem de classificação por omissão na vista global de modelo.';
    $Self->{Translation}->{'Defines the default value for the category of a change.'} = 'Define o valor por omissão para a categoria de uma alteração.';
    $Self->{Translation}->{'Defines the default value for the impact of a change.'} = 'Define o valor por omissão para o Impacto de uma alteração.';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for change attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        'Define o tipo de campo para comparar os campos de valor para o agente de Alteração, atributos em ITSM Editar Condição de Alteração. Os valores válidos são de Seleção, texto e data. Se nenhum tipo for definido, o campo não é exibido.';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for workorder attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        'Define o tipo de campo para comparar os campos de valor para a Ordem de Serviço, atributos em ITSM Editar Condição de Alteração. Os valores válidos são de Seleção, texto e data. Se nenhum tipo for definido, o campo não é exibido.';
    $Self->{Translation}->{'Defines the object attributes that are selectable for change objects in AgentITSMChangeConditionEdit.'} =
        'Define os atributos de objeto que são selecionáveis para objetos de Alteração em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the object attributes that are selectable for workorder objects in AgentITSMChangeConditionEdit.'} =
        'Define os atributos de objeto que são selecionáveis para objetos de ordem de serviço em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute AccountedTime in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Tempo Contabilizados em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualEndTime in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Hora de fim real em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualStartTime in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Hora de início real em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute CategoryID in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Categoria ID em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeBuilderID in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Alterar Construtor ID em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeManagerID in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Alterar gestor ID em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeStateID in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Alterar Estado ID em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeTitle in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Alterar Título ID em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute DynamicField in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ImpactID in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Impacto ID em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEffort in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Esforço planeado em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEndTime in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Hora Final Planejada em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedStartTime in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Hora Ínicio Planejada em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PriorityID in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Prioridade ID em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute RequestedTime in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Tempo Requerido em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderAgentID in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Ordem de Serviço agente ID em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderNumber in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Número Ordem de Serviço em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderStateID in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Estado ID Ordem de Serviço em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTitle in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Título Ordem de Serviço em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTypeID in AgentITSMChangeConditionEdit.'} =
        'Define os operadores que são selecionáveis para o atributo Tipo ID Ordem de Serviço em Editar a Condição de Alteração do ITSM.';
    $Self->{Translation}->{'Defines the period (in years), in which start and end times can be selected.'} =
        'Define o período (em anos), em que os tempos de início e fim podem ser selecionados.';
    $Self->{Translation}->{'Defines the shown attributes of a workorder in the tooltip of the workorder graph in the change zoom. To show workorder dynamic fields in the tooltip, they must be specified like DynamicField_WorkOrderFieldName1, DynamicField_WorkOrderFieldName2, etc.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the Change PSA overview. This option has no effect on the position of the column.'} =
        'Define as colunas visualizadas na vista geral da PSA. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the Change Schedule overview. This option has no effect on the position of the column.'} =
        'Define as colunas visualizadas na vista geral da Agenda. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the MyCAB overview. This option has no effect on the position of the column.'} =
        'Define as colunas visualizadas na vista geral do "Meu CAB". Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the MyChanges overview. This option has no effect on the position of the column.'} =
        'Define as colunas visualizadas na vista geral das Minhas Alterações. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the MyWorkorders overview. This option has no effect on the position of the column.'} =
        'Define as colunas visualizadas na vista geral das Minhas Ordens de Serviço. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the PIR overview. This option has no effect on the position of the column.'} =
        'Define as colunas visualizadas na vista geral da PIR. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the change manager overview. This option has no effect on the position of the column.'} =
        'Define as colunas visualizadas na vista geral do gestor de Alteração. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the change overview. This option has no effect on the position of the column.'} =
        'Define as colunas visualizadas na vista geral da Alteração. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the change search. This option has no effect on the position of the column.'} =
        'Define as colunas visualizadas na pesquisa da Alteração. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the customer change schedule overview. This option has no effect on the position of the column.'} =
        'Define as colunas visualizadas na vista geral de Agendar a Alteração. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the template overview. This option has no effect on the position of the column.'} =
        'Define as colunas visualizadas na vista geral do modelo. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the signals for each ITSMChange state.'} = 'Define os sinais para cada estado Alteração ITSM.';
    $Self->{Translation}->{'Defines the template types that will be used as filters in the template overview.'} =
        'Define os tipos de modelo que serão usados como filtros na vista global de modelo.';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the MyWorkorders overview.'} =
        'Define os estados de ordem de serviço que serão usados como filtros na vista global das Minhas Ordens de Serviço.';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the PIR overview.'} =
        'Define os estados de ordem de serviço que serão usados como filtros na vista global da PIR.';
    $Self->{Translation}->{'Defines the workorder types that will be used to show the PIR overview.'} =
        'Define os tipos de ordem de serviço que serão usados como filtros para mostrar na vista global da PIR.';
    $Self->{Translation}->{'Defines whether notifications should be sent.'} = 'Define se as notificações devem ser enviadas.';
    $Self->{Translation}->{'Delete a change.'} = '';
    $Self->{Translation}->{'Delete the change.'} = '';
    $Self->{Translation}->{'Delete the workorder.'} = '';
    $Self->{Translation}->{'Details of a change history entry.'} = '';
    $Self->{Translation}->{'Determines if an agent can exchange the X-axis of a stat if he generates one.'} =
        'Define se um agente pode trocar o eixo X de uma estatística gerida por si.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes done for config item classes.'} =
        'Define se o módulo de estatísticas comuns pode gerar estatísticas sobre as Alterações feitas para as classes de item de configuração.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding change state updates within a timeperiod.'} =
        'Define se o módulo de estatísticas comuns pode gerar estatísticas sobre as Alterações referentes às atualizações Alteração de estado dentro de um período de tempo.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding the relation between changes and incident tickets.'} =
        'Define se o módulo de estatísticas comuns pode gerar estatísticas sobre as Alterações a respeito da relação entre as Alterações e os tickets de incidente.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes.'} =
        'Define se o módulo de estatísticas comuns pode gerar estatísticas sobre as Alterações.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about the number of Rfc tickets a requester created.'} =
        'Define se o módulo de estatísticas comuns pode gerar estatísticas sobre o número de tickets RFC a um solicitante criado.';
    $Self->{Translation}->{'Dynamic fields (for changes and workorders) shown in the change print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the change add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the change edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the change search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the change zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the workorder add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the workorder edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the workorder report screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the workorder zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'DynamicField event module to handle the update of conditions if dynamic fields are added, updated or deleted.'} =
        '';
    $Self->{Translation}->{'Edit a change.'} = '';
    $Self->{Translation}->{'Edit the change.'} = '';
    $Self->{Translation}->{'Edit the conditions of the change.'} = '';
    $Self->{Translation}->{'Edit the workorder.'} = '';
    $Self->{Translation}->{'Forward schedule of changes. Overview over approved changes.'} =
        '';
    $Self->{Translation}->{'History Zoom'} = '';
    $Self->{Translation}->{'ITSM Change CAB Templates.'} = '';
    $Self->{Translation}->{'ITSM Change Condition Edit.'} = '';
    $Self->{Translation}->{'ITSM Change Condition Overview.'} = '';
    $Self->{Translation}->{'ITSM Change Management Notifications'} = '';
    $Self->{Translation}->{'ITSM Change Manager Overview.'} = '';
    $Self->{Translation}->{'ITSM Change PIR Overview.'} = '';
    $Self->{Translation}->{'ITSM Change notification rules'} = '';
    $Self->{Translation}->{'ITSM MyCAB Overview.'} = '';
    $Self->{Translation}->{'ITSM MyChanges Overview.'} = '';
    $Self->{Translation}->{'ITSM MyWorkorders Overview.'} = '';
    $Self->{Translation}->{'ITSM Template Delete.'} = '';
    $Self->{Translation}->{'ITSM Template Edit CAB.'} = '';
    $Self->{Translation}->{'ITSM Template Edit Content.'} = '';
    $Self->{Translation}->{'ITSM Template Edit.'} = '';
    $Self->{Translation}->{'ITSM Template Overview.'} = '';
    $Self->{Translation}->{'ITSM event module that cleans up conditions.'} = 'Módulo de evento ITSM que limpa condições.';
    $Self->{Translation}->{'ITSM event module that deletes the cache for a toolbar.'} = '';
    $Self->{Translation}->{'ITSM event module that deletes the history of changes.'} = '';
    $Self->{Translation}->{'ITSM event module that matches conditions and executes actions.'} =
        'Módulo de evento ITSM que coincide com as condições e executa as ações.';
    $Self->{Translation}->{'ITSM event module that sends notifications.'} = 'Módulo de eventos ITSM que envia notificações.';
    $Self->{Translation}->{'ITSM event module that updates the history of changes.'} = 'Módulo de evento ITSM que atualiza o histórico de Alterações.';
    $Self->{Translation}->{'ITSM event module that updates the history of conditions.'} = '';
    $Self->{Translation}->{'ITSM event module that updates the history of workorders.'} = '';
    $Self->{Translation}->{'ITSM event module to recalculate the workorder numbers.'} = 'Módulo de evento ITSM para recalcular os números de ordem de serviço.';
    $Self->{Translation}->{'ITSM event module to set the actual start and end times of workorders.'} =
        'Módulo de evento ITSM para definir o tempo início e de fim de ordens de serviço.';
    $Self->{Translation}->{'If frequency is \'regularly\', you can configure how often the notifications are sent (every X hours).'} =
        '';
    $Self->{Translation}->{'Link another object to the change.'} = '';
    $Self->{Translation}->{'Link another object to the workorder.'} = '';
    $Self->{Translation}->{'Logfile for the ITSM change counter. This file is used for creating the change numbers.'} =
        'Ficheiro de log para o contador de Alteração ITSM. Este ficheiro é usado para criar os números de Alteração.';
    $Self->{Translation}->{'Lookup of CAB members for autocompletion.'} = '';
    $Self->{Translation}->{'Lookup of agents, used for autocompletion.'} = '';
    $Self->{Translation}->{'Module to check if WorkOrderAdd or WorkOrderAddFromTemplate should be permitted.'} =
        '';
    $Self->{Translation}->{'Module to check the CAB members.'} = 'Módulo para verificar os membros do CAB.';
    $Self->{Translation}->{'Module to check the agent.'} = 'Módulo para verificar o agente.';
    $Self->{Translation}->{'Module to check the change builder.'} = 'Módulo para verificar o construtor da Alteração.';
    $Self->{Translation}->{'Module to check the change manager.'} = 'Módulo para verificar o gestor de Alteração.';
    $Self->{Translation}->{'Module to check the workorder agent.'} = 'Módulo para verificar o agente da ordem de serviço.';
    $Self->{Translation}->{'Module to check whether no workorder agent is set.'} = 'Módulo para verificar se não existe agente de ordem de serviço.';
    $Self->{Translation}->{'Module to check whether the agent is contained in the configured list.'} =
        'Módulo para verificar se o agente pertence à lista configurada.';
    $Self->{Translation}->{'Module to show a link to create a change from this ticket. The ticket will be automatically linked with the new change.'} =
        'Módulo para mostrar um link para criar uma Alteração a partir deste ticket. O ticket será automaticamente ligado com a nova Alteração.';
    $Self->{Translation}->{'Move Time Slot.'} = '';
    $Self->{Translation}->{'Move all workorders in time.'} = '';
    $Self->{Translation}->{'Only users of these groups have the permission to use the ticket types as defined in "ITSMChange::AddChangeLinkTicketTypes" if the feature "Ticket::Acl::Module###200-Ticket::Acl::Module" is enabled.'} =
        'Somente Utilizadors dos grupos têm permissão para utilizar os tipos de tickets, tal como definido em "AlteraçãoITSM:TiposticketsAdicionarLinkAlteração" se o recurso "ticket::ACL:: Módulo###200-ticket::ACL::Módulo" estiver ativo.';
    $Self->{Translation}->{'Overview over all Changes.'} = '';
    $Self->{Translation}->{'PIR'} = '';
    $Self->{Translation}->{'PSA'} = '';
    $Self->{Translation}->{'Parameters for the UserCreateWorkOrderNextMask object in the preference view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the pages (in which the changes are shown) of the small change overview.'} =
        'Parâmetros para as páginas (em que as Alterações são mostradas) da vista pequena global de Alteração.';
    $Self->{Translation}->{'Presents a link in the menu to show the involved persons in a change, in the zoom view of such change in the agent interface.'} =
        'Apresenta um link no menu para mostrar as pessoas envolvidas numa Alteração, na vista a ampliar.';
    $Self->{Translation}->{'Print the change.'} = '';
    $Self->{Translation}->{'Print the workorder.'} = '';
    $Self->{Translation}->{'Projected Service Availability'} = '';
    $Self->{Translation}->{'Projected Service Availability (PSA)'} = '';
    $Self->{Translation}->{'Projected Service Availability (PSA) of changes. Overview of approved changes and their services.'} =
        '';
    $Self->{Translation}->{'Required privileges in order for an agent to take a workorder.'} =
        'Privilégios necessários para um agente ter uma ordem de serviço.';
    $Self->{Translation}->{'Required privileges to access the overview of all changes.'} = 'Privilégios necessários para aceder à vista global de todas as alterações.';
    $Self->{Translation}->{'Required privileges to add a workorder.'} = 'Privilégios necessários para adicionar uma ordem de serviço.';
    $Self->{Translation}->{'Required privileges to change the workorder agent.'} = 'Privilégios necessários para alterar o agente de ordem de serviço.';
    $Self->{Translation}->{'Required privileges to create a template from a change.'} = 'Privilégios necessários para criar um modelo de uma alteração.';
    $Self->{Translation}->{'Required privileges to create a template from a changes\' CAB.'} =
        'Privilégios necessários para criar um modelo de uma Alteração\' CAB.';
    $Self->{Translation}->{'Required privileges to create a template from a workorder.'} = 'Privilégios necessários para criar um modelo de uma ordem de serviço.';
    $Self->{Translation}->{'Required privileges to create changes from templates.'} = '';
    $Self->{Translation}->{'Required privileges to create changes.'} = 'Privilégios necessários para criar Alterações.';
    $Self->{Translation}->{'Required privileges to delete a template.'} = 'Privilégios necessários para criar um modelo.';
    $Self->{Translation}->{'Required privileges to delete a workorder.'} = 'Privilégios necessários para criar uma ordem de serviço.';
    $Self->{Translation}->{'Required privileges to delete changes.'} = 'Privilégios necessários para excluir mudanças.';
    $Self->{Translation}->{'Required privileges to edit a template.'} = 'Privilégios necessários para editar um modelo.';
    $Self->{Translation}->{'Required privileges to edit a workorder.'} = 'Privilégios necessários para editar uma ordem de serviço.';
    $Self->{Translation}->{'Required privileges to edit changes.'} = 'Privilégios necessários para editar uma Alteração.';
    $Self->{Translation}->{'Required privileges to edit the conditions of changes.'} = 'Privilégios necessários para editar uma condição de alteração.';
    $Self->{Translation}->{'Required privileges to edit the content of a template.'} = '';
    $Self->{Translation}->{'Required privileges to edit the involved persons of a change.'} =
        'Privilégios necessários para editar pessoas envolvidas na alteração.';
    $Self->{Translation}->{'Required privileges to move changes in time.'} = 'Privilégios necessários para mover as alterações no tempo.';
    $Self->{Translation}->{'Required privileges to print a change.'} = 'Privilégios necessários para imprimir uma alteração';
    $Self->{Translation}->{'Required privileges to reset changes.'} = 'Privilégios necessários para redefinir mudanças.';
    $Self->{Translation}->{'Required privileges to view a workorder.'} = 'Privilégios necessários para visualizar uma ordem de serviço.';
    $Self->{Translation}->{'Required privileges to view changes.'} = 'Privilégios necessários para visualizar alterações.';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is a CAB member.'} =
        'Privilégios necessários para visualizar a lista de alterações, onde o Utilizador é membro do CAB.';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is the change manager.'} =
        'Privilégios necessários para visualizar a lista de alterações, onde o utilizador é o gestor da alteração.';
    $Self->{Translation}->{'Required privileges to view overview over all templates.'} = 'Privilégios necessários para visualizar a vista global de todos os modelos.';
    $Self->{Translation}->{'Required privileges to view the conditions of changes.'} = 'Privilégios necessários para visualizar as condições de alterações.';
    $Self->{Translation}->{'Required privileges to view the history of a change.'} = 'Privilégios necessários para visualizar o histórico de uma alteração.';
    $Self->{Translation}->{'Required privileges to view the history of a workorder.'} = 'Privilégios necessários para visualizar o histórico de uma ordem de serviço.';
    $Self->{Translation}->{'Required privileges to view the history zoom of a change.'} = 'Privilégios necessários para visualizar o histórico ampliado de uma alteração.';
    $Self->{Translation}->{'Required privileges to view the history zoom of a workorder.'} =
        'Privilégios necessários para visualizar o histórico ampliado de uma ordem de serviço.';
    $Self->{Translation}->{'Required privileges to view the list of Change Schedule.'} = 'Privilégios necessários para visualizar a lista da agenda de alteração.';
    $Self->{Translation}->{'Required privileges to view the list of change PSA.'} = 'Privilégios necessários para visualizar a lista de Alterações PSA.';
    $Self->{Translation}->{'Required privileges to view the list of changes with an upcoming PIR (Post Implementation Review).'} =
        'Privilégios necessários para visualizar a lista de Alterações com um PIR.';
    $Self->{Translation}->{'Required privileges to view the list of own changes.'} = 'Privilégios necessários para visualizar a lista de alterações próprias.';
    $Self->{Translation}->{'Required privileges to view the list of own workorders.'} = 'Privilégios necessários para visualizar a lista de ordens de serviço próprias.';
    $Self->{Translation}->{'Required privileges to write a report for the workorder.'} = 'Privilégios necessários para escrever um relatório para a ordem de serviço.';
    $Self->{Translation}->{'Reset a change and its workorders.'} = '';
    $Self->{Translation}->{'Reset change and its workorders.'} = '';
    $Self->{Translation}->{'Run task to check if specific times have been reached in changes and workorders.'} =
        '';
    $Self->{Translation}->{'Save change as a template.'} = '';
    $Self->{Translation}->{'Save workorder as a template.'} = '';
    $Self->{Translation}->{'Schedule'} = '';
    $Self->{Translation}->{'Screen after creating a workorder'} = 'Tela Após Criar Ordem de Serviço';
    $Self->{Translation}->{'Search Changes.'} = '';
    $Self->{Translation}->{'Selects the change number generator module. "AutoIncrement" increments the change number, the SystemID and the counter are used with SystemID.counter format (e.g. 100118, 100119). With "Date", the change numbers will be generated by the current date and a counter; this format looks like Year.Month.Day.counter, e.g. 2010062400001, 2010062400002. With "DateChecksum", the counter will be appended as checksum to the string of date plus the SystemID. The checksum will be rotated on a daily basis. This format looks like Year.Month.Day.SystemID.Counter.CheckSum, e.g. 2010062410000017, 2010062410000026.'} =
        '';
    $Self->{Translation}->{'Set the agent for the workorder.'} = '';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        '';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        '';
    $Self->{Translation}->{'Sets the minimal change counter size (if "AutoIncrement" was selected as ITSMChange::NumberGenerator). Default is 5, this means the counter starts from 10000.'} =
        '';
    $Self->{Translation}->{'Sets up the state machine for changes.'} = 'Configura a máquina de estado para as Alterações.';
    $Self->{Translation}->{'Sets up the state machine for workorders.'} = 'Configura a máquina de estado para as ordens de serviço.';
    $Self->{Translation}->{'Shows a checkbox in the AgentITSMWorkOrderEdit screen that defines if the the following workorders should also be moved if a workorder is modified and the planned end time has changed.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows changing the workorder agent, in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a change as a template in the zoom view of the change, in the agent interface.'} =
        'Mostra um link no menu que permite definir uma Alteração como um modelo na vista de alteração, na interface do agente.';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a workorder as a template in the zoom view of the workorder, in the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows editing the report of a workorder, in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a change with another object in the change zoom view of the agent interface.'} =
        'Mostra um link no menu que permite ligar uma Alteração com outro objeto na Alteração.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a workorder with another object in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows moving the time slot of a change in its zoom view of the agent interface.'} =
        'Mostra um link no menu que permite mover o intervalo de tempo de uma Alteração na sua opinião.';
    $Self->{Translation}->{'Shows a link in the menu that allows taking a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the conditions of a change in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para aceder as condições de uma Alteração.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a change in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para aceder o histórico de uma Alteração.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to add a workorder in the change zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to delete a change in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to delete a workorder in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a change in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para editar uma Alteração.';
    $Self->{Translation}->{'Shows a link in the menu to edit a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the change zoom view of the agent interface.'} =
        'Mostra um link no menu para voltar a Alteração.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the workorder zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a change in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para imprimir uma Alteração.';
    $Self->{Translation}->{'Shows a link in the menu to print a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to reset a change and its workorders in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the change history (reverse ordered) in the agent interface.'} =
        'Mostra o histórico de alterações (ordem inversa).';
    $Self->{Translation}->{'State Machine'} = 'Máquina de Estado';
    $Self->{Translation}->{'Stores change and workorder ids and their corresponding template id, while a user is editing a template.'} =
        '';
    $Self->{Translation}->{'Take Workorder.'} = '';
    $Self->{Translation}->{'Take the workorder.'} = '';
    $Self->{Translation}->{'Template.'} = '';
    $Self->{Translation}->{'The identifier for a change, e.g. Change#, MyChange#. The default is Change#.'} =
        'O identificador de uma Alteração, por exemplo, Alteração#,Minha Alteração#. Por omissão é Alteração#.';
    $Self->{Translation}->{'The identifier for a workorder, e.g. Workorder#, MyWorkorder#. The default is Workorder#.'} =
        'O identificador de uma Ordem de Serviço, por exemplo, Ordem de Serviço#,Minha Ordem de Serviço#. Por omissão é Ordem de Serviço#.';
    $Self->{Translation}->{'This ACL module restricts the usuage of the ticket types that are defined in the sysconfig option \'ITSMChange::AddChangeLinkTicketTypes\', to users of the groups as defined in "ITSMChange::RestrictTicketTypes::Groups". As this ACL could collide with other ACLs which are also related to the ticket type, this sysconfig option is disabled by default and should only be activated if needed.'} =
        '';
    $Self->{Translation}->{'Time Slot'} = '';
    $Self->{Translation}->{'Types of tickets, where in the ticket zoom view a link to add a change will be displayed.'} =
        'Tipos de tickets, onde no detalhe de visualização do ticket é mostrado um link para adicionar uma Alteração.';
    $Self->{Translation}->{'User Search'} = '';
    $Self->{Translation}->{'Workorder Add (from template).'} = '';
    $Self->{Translation}->{'Workorder Add.'} = '';
    $Self->{Translation}->{'Workorder Agent'} = '';
    $Self->{Translation}->{'Workorder Agent.'} = '';
    $Self->{Translation}->{'Workorder Delete.'} = '';
    $Self->{Translation}->{'Workorder Edit.'} = '';
    $Self->{Translation}->{'Workorder History Zoom.'} = '';
    $Self->{Translation}->{'Workorder History.'} = '';
    $Self->{Translation}->{'Workorder Report.'} = '';
    $Self->{Translation}->{'Workorder Zoom.'} = '';
    $Self->{Translation}->{'once'} = '';
    $Self->{Translation}->{'regularly'} = '';

}

1;
