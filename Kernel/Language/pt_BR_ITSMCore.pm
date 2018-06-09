# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_ITSMCore;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMCore
    $Self->{Translation}->{'Alternative to'} = 'Alternativa a';
    $Self->{Translation}->{'Availability'} = 'Disponibilidade';
    $Self->{Translation}->{'Back End'} = 'Back End';
    $Self->{Translation}->{'Connected to'} = 'Conectado a';
    $Self->{Translation}->{'Current State'} = 'Estado Atual';
    $Self->{Translation}->{'Demonstration'} = 'Demonstração';
    $Self->{Translation}->{'Depends on'} = 'Depende de';
    $Self->{Translation}->{'End User Service'} = 'Serviço a Usuário Final';
    $Self->{Translation}->{'Errors'} = 'Erros';
    $Self->{Translation}->{'Front End'} = 'Front End';
    $Self->{Translation}->{'IT Management'} = 'Gerenciamento de TI';
    $Self->{Translation}->{'IT Operational'} = 'Operações de TI';
    $Self->{Translation}->{'Impact'} = 'Impacto';
    $Self->{Translation}->{'Incident State'} = 'Estado de Incidente';
    $Self->{Translation}->{'Includes'} = 'Inclui';
    $Self->{Translation}->{'Other'} = 'Outro';
    $Self->{Translation}->{'Part of'} = 'Parte de';
    $Self->{Translation}->{'Project'} = 'Projeto';
    $Self->{Translation}->{'Recovery Time'} = 'Tempo de Recuperação';
    $Self->{Translation}->{'Relevant to'} = 'Relevante a';
    $Self->{Translation}->{'Reporting'} = 'Relatório';
    $Self->{Translation}->{'Required for'} = 'Requisitado por';
    $Self->{Translation}->{'Resolution Rate'} = 'Taxa de Resolução';
    $Self->{Translation}->{'Response Time'} = 'Tempo de Resposta';
    $Self->{Translation}->{'SLA Overview'} = 'Visão Geral de SLA';
    $Self->{Translation}->{'Service Overview'} = 'Visão Geral de Serviço';
    $Self->{Translation}->{'Service-Area'} = 'Área Serviço';
    $Self->{Translation}->{'Training'} = 'Treinamento';
    $Self->{Translation}->{'Transactions'} = 'Transações';
    $Self->{Translation}->{'Underpinning Contract'} = 'Contrato com Terceiros';
    $Self->{Translation}->{'allocation'} = 'atribuição';

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'Criticalidade <-> Impacto <-> Prioridade';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality <-> Impact.'} =
        'Gerenciar a prioridade resultante da combinação Criticalidade <-> Impacto.';
    $Self->{Translation}->{'Priority allocation'} = 'Atribuição de prioridade';

    # Template: AdminSLA
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'Tempo Mínimo entre Incidentes';

    # Template: AdminService
    $Self->{Translation}->{'Criticality'} = 'Criticalidade';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = 'Informação de SLA';
    $Self->{Translation}->{'Last changed'} = 'Última alteração';
    $Self->{Translation}->{'Last changed by'} = 'Última alteração por';
    $Self->{Translation}->{'Associated Services'} = 'Serviços Associados';

    # Template: AgentITSMServiceZoom
    $Self->{Translation}->{'Service Information'} = 'Informação de serviço';
    $Self->{Translation}->{'Current incident state'} = 'Estado Atual de Incidente';
    $Self->{Translation}->{'Associated SLAs'} = 'SLAs Associados';

    # Perl Module: Kernel/Modules/AgentITSMServicePrint.pm
    $Self->{Translation}->{'Current Incident State'} = 'Estado Atual de Incidente';

    # SysConfig
    $Self->{Translation}->{'Both'} = 'Ambos';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Defina Ações onde um botão de configurações está disponível no widget de objetos vinculados (LinkObject::ViewMode="complex"). Observe que essas ações devem ter registrado os seguintes arquivos JS e CSS: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js e Core.Agent .LinkObject.js.';
    $Self->{Translation}->{'Define which columns are shown in the linked Services widget (LinkObject::ViewMode = "complex"). Note: Only Service attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        'Defina quais colunas são mostradas no widget de serviços vinculados (LinkObject::ViewMode="complex"). Observação: somente atributos de serviço são permitidos para DefaultColumns. Definições possíveis: 0 = Desativado, 1 = Disponível, 2 = Activado por padrão.';
    $Self->{Translation}->{'Frontend module registration for the AdminITSMCIPAllocate configuration in the admin area.'} =
        'Registro de módulo de interface para a configuração AdminITSMCIPAllocate na área administrativa.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} =
        'Registro de módulo de interface para o objeto AgentITSMSLA na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} =
        'Registro de módulo de interface para o objeto AgentITSMSLAPrint na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} =
        'Registro de módulo de interface para o objeto AgentITSMSLAZoom na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMService object in the agent interface.'} =
        'Registro de módulo de interface para o objeto AgentITSMService na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} =
        'Registro de módulo de interface para o objeto AgentITSMServicePrint na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} =
        'Registro de módulo de interface para o objeto AgentITSMServiceZoom na interface de atendente.';
    $Self->{Translation}->{'ITSM SLA Overview.'} = 'Visão Geral de SLA ITSM.';
    $Self->{Translation}->{'ITSM Service Overview.'} = 'Visão Geral de Serviço ITSM.';
    $Self->{Translation}->{'Incident'} = 'Incidente';
    $Self->{Translation}->{'Incident State Type'} = 'Tipo de Estado de Incidente';
    $Self->{Translation}->{'Incident State Type.'} = 'Tipo de Estado de Incidente.';
    $Self->{Translation}->{'Manage priority matrix.'} = 'Gerenciar matriz de prioridade.';
    $Self->{Translation}->{'Module to show back link in service menu.'} = 'Módulo para mostrar o link voltar no menu serviço.';
    $Self->{Translation}->{'Module to show back link in sla menu.'} = 'Módulo para mostrar o link voltar no menu SLA.';
    $Self->{Translation}->{'Module to show print link in service menu.'} = 'Módulo para mostrar o link imprimir no menu serviço.';
    $Self->{Translation}->{'Module to show print link in sla menu.'} = 'Módulo para mostrar o link imprimir no menu SLA.';
    $Self->{Translation}->{'Module to show the link link in service menu.'} = 'Módulo para mostrar o link associar no menu serviço.';
    $Self->{Translation}->{'Operational'} = 'Operacional';
    $Self->{Translation}->{'Parameters for the incident states in the preference view.'} = 'Parâmetros para os estados de incidente na visão de preferências.';
    $Self->{Translation}->{'SLA Print.'} = 'Imprimir SLA.';
    $Self->{Translation}->{'SLA Zoom.'} = 'Detalhes do SLA.';
    $Self->{Translation}->{'Service Print.'} = 'imprimir Serviço.';
    $Self->{Translation}->{'Service Zoom.'} = 'Detalhe do Serviço.';
    $Self->{Translation}->{'Set the type and direction of links to be used to calculate the incident state. The key is the name of the link type (as defined in LinkObject::Type), and the value is the direction of the IncidentLinkType that should be followed to calculate the incident state. For example if the IncidentLinkType is set to \'DependsOn\', and the Direction is \'Source\', only \'Depends on\' links will be followed (and not the opposite link \'Required for\') to calculate the incident state. You can add more link types ad directions as you like, e.g. \'Includes\' with the direction \'Target\'. All link types defined in the sysconfig options LinkObject::Type are possible and the direction can be \'Source\', \'Target\', or \'Both\'. IMPORTANT: AFTER YOU MAKE CHANGES TO THIS SYSCONFIG OPTION YOU NEED TO RUN THE SCRIPT bin/otrs.ITSMConfigItemIncidentStateRecalculate.pl SO THAT ALL INCIDENT STATES WILL BE RECALCULATED BASED ON THE NEW SETTINGS!'} =
        'Configura o tipo e a direção de links usados para calcular o estado de incidente. A chave é o nome do tipo de link (como definido em LinkObject::Type) e o valor é a direção do IncidentLinkType que deve ser seguido para calcular o estado de incidente. Por exemplo, se o IncidentLinkType é configurado para \'Depende de\' e a Direção é \'Origem\', apenas links \'Depende de\' serão seguidos (e não o link oposto \'Requerido por\') para calcular o estado de incidente. Você pode adicionar mais de um tipo de link e direções. Ex. \'Inclui\' com a direção \'Destino\'. Todos os tipos de links definidos nas opções LinkObject::Type do sysconfig são possíveis e a direção pode ser \'Origem\', \'Destino\' ou \'Ambos\'. IMPORTANTE: APÓS VOCÊ FAZER MUDANÇAS NESTA OPÇÃO SYSCONFIG, É NECESSÁRIO EXECUTAR O SCRIPT bin/otrs.ITSMConfigItemIncidentStateRecalculate.pl DE FORMA QUE TODOS OS ESTADOS DE INCIDENTES SEJAM RECALCULADOS COM BASE NAS NOVAS CONFIGURAÇÕES!';
    $Self->{Translation}->{'This setting defines that a \'ITSMChange\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        'Essa configuração define que um objeto \'MudançaITSM\' pode ser associado com objetos \'Chamado\' usando o tipo de associação \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'FAQ\' usando o tipo de associação \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'FAQ\' usando o tipo de associação \'PaiFilho\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'FAQ\' usando o tipo de associação \'Relevante a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'AlternativeTo\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Serviço\' usando o tipo de associação \'Alternativa a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Serviço\' usando o tipo de associação \'Depende de\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'RelevantTo\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Serviço\' usando o tipo de associação \'Relevante a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'AlternativeTo\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Chamado\' usando o tipo de associação \'Alternativa a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'DependsOn\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Chamado\' usando o tipo de associação \'Depende de\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'RelevantTo\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com objetos \'Chamado\' usando o tipo de associação \'Relevante a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'AlternativeTo\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com outros objetos \'ItemConfigITSM\' usando o tipo de associação \'Alternativa a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'ConnectedTo\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com outros objetos \'ItemConfigITSM\' usando o tipo de associação \'Conectado a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com outros objetos \'ItemConfigITSM\' usando o tipo de associação \'Depende de\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'Includes\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com outros objetos \'ItemConfigITSM\' usando o tipo de associação \'Inclui\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'RelevantTo\' link type.'} =
        'Essa configuração define que um objeto \'ItemConfigITSM\' pode ser associado com outros objetos \'ItemConfigITSM\' usando o tipo de associação \'Relevante a\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        'Essa configuração define que um objeto \'OrdemServiçoITSM\' pode ser associado com objetos \'ItemConfigITSM\' usando o tipo de associação \'Depende de\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'Normal\' link type.'} =
        'Essa configuração define que um objeto \'OrdemServiçoITSM\' pode ser associado com objetos \'ItemConfigITSM\' usando o tipo de associação \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        'Essa configuração define que um objeto \'OrdemServiçoITSM\' pode ser associado com objetos \'Serviço\' usando o tipo de associação \'Depende de\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'Normal\' link type.'} =
        'Essa configuração define que um objeto \'OrdemServiçoITSM\' pode ser associado com objetos \'Serviço\' usando o tipo de associação \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        'Essa configuração define que um objeto \'OrdemServiçoITSM\' pode ser associado com objetos \'Chamado\' usando o tipo de associação \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        'Essa configuração define que um objeto \'Serviço\' pode ser associado com objetos \'FAQ\' usando o tipo de associação \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Essa configuração define que um objeto \'Serviço\' pode ser associado com objetos \'FAQ\' usando o tipo de associação \'PaiFilho\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        'Essa configuração define que um objeto \'Serviço\' pode ser associado com objetos \'FAQ\' usando o tipo de associação \'Relevante a\'.';
    $Self->{Translation}->{'This setting defines the link type \'AlternativeTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Esta configuração define o tipo de link \'Alternativa a\'. Se o nome da fonte e o nome do alvo contêm o mesmo valor, a associação resultante é não-direcional. Se os valores são diferentes, a associação resultante é um link direcional.';
    $Self->{Translation}->{'This setting defines the link type \'ConnectedTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Esta configuração define o tipo de link \'Conectado a\'. Se o nome da fonte e o nome do alvo contêm o mesmo valor, a associação resultante é não-direcional. Se os valores são diferentes, a associação resultante é um link direcional.';
    $Self->{Translation}->{'This setting defines the link type \'DependsOn\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Esta configuração define o tipo de link \'Depende de\'. Se o nome da fonte e o nome do alvo contêm o mesmo valor, a associação resultante é não-direcional. Se os valores são diferentes, a associação resultante é um link direcional.';
    $Self->{Translation}->{'This setting defines the link type \'Includes\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Esta configuração define o tipo de link \'Inclui\'. Se o nome da fonte e o nome do alvo contêm o mesmo valor, a associação resultante é não-direcional. Se os valores são diferentes, a associação resultante é um link direcional.';
    $Self->{Translation}->{'This setting defines the link type \'RelevantTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Esta configuração define o tipo de link \'Relevante a\'. Se o nome da fonte e o nome do alvo contêm o mesmo valor, a associação resultante é não-direcional. Se os valores são diferentes, a associação resultante é um link direcional.';
    $Self->{Translation}->{'Width of ITSM textareas.'} = 'Número de caracteres por linha em áreas de texto ITSM.';

}

1;
