# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Computer'} = '';
    $Self->{Translation}->{'Hardware'} = '';
    $Self->{Translation}->{'Network'} = '';
    $Self->{Translation}->{'Software'} = '';
    $Self->{Translation}->{'Address'} = 'Endereço';
    $Self->{Translation}->{'Admin Tool'} = 'Ferramenta de Administração';
    $Self->{Translation}->{'Backup Device'} = 'Dispositivo de Backup';
    $Self->{Translation}->{'Beamer'} = 'Projetor';
    $Self->{Translation}->{'Building'} = 'Prédio';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'Novo item de configuração (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'Item de configuração (ID=%s) excluído';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'Definição do CI atualizada (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Estado de implementação alterado (novo=%s; antigo=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Estado de incidente alterado (novo=%s; antigo=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'O link para %s (Typ=%s) foi adicionado';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'O link %s (Typ=%s) foi apagado';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Nome alterado (novo=%s; antigo=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'O atributo %s foi alterado de "%s" para "%s" ';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Nova versão criada (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Versão %s foi apagada';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = 'Anexo (%s) adicionado';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = 'Anexo (%s) excluído';
    $Self->{Translation}->{'CPU'} = 'Processador';
    $Self->{Translation}->{'Camera'} = 'Camera';
    $Self->{Translation}->{'Capacity'} = 'CapacAntiguidade';
    $Self->{Translation}->{'Change Definition'} = 'Alterar Definição';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Alteração da definição falhou! Veja o log para mais informação.';
    $Self->{Translation}->{'Client Application'} = 'Aplicação Cliente';
    $Self->{Translation}->{'Client OS'} = 'SO Cliente';
    $Self->{Translation}->{'Config Item-Area'} = 'Área Item de Configuração';
    $Self->{Translation}->{'Config Items available'} = 'Itens de Configuração disponíveis';
    $Self->{Translation}->{'Config Items shown'} = 'Itens de Configuração visíveis';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'Demonstração';
    $Self->{Translation}->{'Desktop'} = 'Área ';
    $Self->{Translation}->{'Developer Licence'} = 'Licença de desenvolvimento';
    $Self->{Translation}->{'Docking Station'} = '';
    $Self->{Translation}->{'Duplicate'} = 'Duplicar';
    $Self->{Translation}->{'Embedded'} = 'Integrado';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Os campos vazios indicam que os valores atuais são mantidos';
    $Self->{Translation}->{'Enterprise Licence'} = 'Licença Corporativa';
    $Self->{Translation}->{'Expiration Date'} = 'Data de Expiração';
    $Self->{Translation}->{'Expired'} = 'Expirado';
    $Self->{Translation}->{'Floor'} = 'Piso';
    $Self->{Translation}->{'Freeware'} = 'Livre';
    $Self->{Translation}->{'GSM'} = '';
    $Self->{Translation}->{'Gateway'} = '';
    $Self->{Translation}->{'Graphic Adapter'} = 'Adaptador Gráfico';
    $Self->{Translation}->{'Hard Disk'} = 'Disco Rígido';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Disco Rígido::CapacAntiguidade';
    $Self->{Translation}->{'Hide Versions'} = 'Ocultar Versões';
    $Self->{Translation}->{'IP Address'} = 'Endereço IP';
    $Self->{Translation}->{'IP over DHCP'} = 'DHCP';
    $Self->{Translation}->{'IT Facility'} = 'Departamento de TI';
    $Self->{Translation}->{'Incident'} = 'Incidente';
    $Self->{Translation}->{'Install Date'} = 'Data Instalação';
    $Self->{Translation}->{'Keyboard'} = 'Teclado';
    $Self->{Translation}->{'LAN'} = 'REDE';
    $Self->{Translation}->{'Laptop'} = 'portátil';
    $Self->{Translation}->{'Last Change'} = 'Última Alteração';
    $Self->{Translation}->{'Licence Key'} = 'Chave de Licença';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Chave de Licença::Data de Expiração';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Chave de Licença::QuantAntiguidade';
    $Self->{Translation}->{'Licence Type'} = 'Tipo de Licença';
    $Self->{Translation}->{'Maintenance'} = 'Manutenção';
    $Self->{Translation}->{'Maximum number of one element'} = 'Número máximo de um elemento';
    $Self->{Translation}->{'Media'} = 'Media';
    $Self->{Translation}->{'Middleware'} = '';
    $Self->{Translation}->{'Model'} = 'Modelo';
    $Self->{Translation}->{'Modem'} = '';
    $Self->{Translation}->{'Monitor'} = '';
    $Self->{Translation}->{'Mouse'} = 'rato';
    $Self->{Translation}->{'Network Adapter'} = 'Adaptador de Rede';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Adaptador de Rede::Endereço IP';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Adaptador de Rede::DHCP';
    $Self->{Translation}->{'Network Address'} = 'Endereço de Rede';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Endereço de Rede::Gateway';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Endereço de Rede::Máscara de Subrede';
    $Self->{Translation}->{'Open Source'} = 'Código aberto';
    $Self->{Translation}->{'Operational'} = 'Operacional';
    $Self->{Translation}->{'Other'} = 'Outro';
    $Self->{Translation}->{'Other Equipment'} = 'Outro Equipamento';
    $Self->{Translation}->{'Outlet'} = 'Tomada';
    $Self->{Translation}->{'PCMCIA Card'} = 'Placa PCMCIA';
    $Self->{Translation}->{'PDA'} = '';
    $Self->{Translation}->{'Per Node'} = 'Por Posto';
    $Self->{Translation}->{'Per Processor'} = 'Por Processador';
    $Self->{Translation}->{'Per Server'} = 'Por Servidor';
    $Self->{Translation}->{'Per User'} = 'Por Utilizador';
    $Self->{Translation}->{'Phone 1'} = 'Telefone 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefone 2';
    $Self->{Translation}->{'Pilot'} = 'Piloto';
    $Self->{Translation}->{'Planned'} = 'Planeado';
    $Self->{Translation}->{'Printer'} = 'Impressora';
    $Self->{Translation}->{'Production'} = 'Produção';
    $Self->{Translation}->{'Quantity'} = 'QuantAntiguidade';
    $Self->{Translation}->{'Rack'} = '';
    $Self->{Translation}->{'Ram'} = 'Memória RAM';
    $Self->{Translation}->{'Repair'} = 'Reparação';
    $Self->{Translation}->{'Retired'} = 'Retirado';
    $Self->{Translation}->{'Review'} = 'Revisão';
    $Self->{Translation}->{'Room'} = 'Sala';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Search Config Items'} = 'Pesquisar Itens de Configuração';
    $Self->{Translation}->{'Security Device'} = 'Dispositivo de Segurança';
    $Self->{Translation}->{'Serial Number'} = 'Número de Série';
    $Self->{Translation}->{'Server'} = 'Servidor';
    $Self->{Translation}->{'Server Application'} = 'Servidor Aplicacional ';
    $Self->{Translation}->{'Server OS'} = 'SO Servidor';
    $Self->{Translation}->{'Show Versions'} = 'Visualizar Versões';
    $Self->{Translation}->{'Single Licence'} = 'Licença Única';
    $Self->{Translation}->{'Subnet Mask'} = 'Máscara de rede';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Telecomunicações';
    $Self->{Translation}->{'Test/QA'} = 'Teste de Qualidade';
    $Self->{Translation}->{'The deployment state of this config item'} = 'O estado de implementação do item de configuração';
    $Self->{Translation}->{'The incident state of this config item'} = 'O estado de incidente deste item de configuração';
    $Self->{Translation}->{'Time Restricted'} = 'Tempo Restrito';
    $Self->{Translation}->{'USB Device'} = 'Dispositivo USB';
    $Self->{Translation}->{'Unlimited'} = 'Ilimitada';
    $Self->{Translation}->{'User Tool'} = 'Ferramenta de Utilizador';
    $Self->{Translation}->{'Volume Licence'} = 'Licença por Volume';
    $Self->{Translation}->{'WLAN'} = '';
    $Self->{Translation}->{'WLAN Access Point'} = '';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Data de Expiração da Garantia';
    $Self->{Translation}->{'Workplace'} = 'Local de Trabalho';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Gestão de Itens de Configuração';
    $Self->{Translation}->{'Change class definition'} = 'Mudar definição de classe';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'Definição';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Item de Configuração';
    $Self->{Translation}->{'Filter for Classes'} = 'Filtro para Classes';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Selecione uma classe a partir da lista para criar um novo item de configuração.';
    $Self->{Translation}->{'Class'} = 'Classe';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = '';
    $Self->{Translation}->{'Deployment state'} = 'Estado de Implementação';
    $Self->{Translation}->{'Incident state'} = 'Estado de incidente';
    $Self->{Translation}->{'Link to another'} = '';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = '';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = '';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'O nome deste item de configuração';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';
    $Self->{Translation}->{'Deployment State'} = 'Estado de Implementação';
    $Self->{Translation}->{'Incident State'} = 'Estado de Incidente';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Configurações de Contexto';
    $Self->{Translation}->{'Config Items per page'} = 'Itens de configuração por página';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = 'Tipo de Estado de Implementação';
    $Self->{Translation}->{'Current Incident State'} = 'Estado do Incidente Atual';
    $Self->{Translation}->{'Current Incident State Type'} = 'Estado Atual de Incidente por tipo';
    $Self->{Translation}->{'Last changed'} = 'Última modificação';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = 'Criar novo Modelo';
    $Self->{Translation}->{'Run Search'} = 'Executar Pesquisa';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Procurar nas versões anteriores também?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Item de configuração';
    $Self->{Translation}->{'Configuration Item Information'} = 'Informação do Item de Configuração';
    $Self->{Translation}->{'Current Deployment State'} = 'Estado de Implementação Atual';
    $Self->{Translation}->{'Last changed by'} = 'Última modificação por';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Show one version'} = 'Visualizar uma versão';
    $Self->{Translation}->{'Show all versions'} = 'Visualizar todas as versões';
    $Self->{Translation}->{'Version Incident State'} = 'Estado da Versão de Incidentes';
    $Self->{Translation}->{'Version Deployment State'} = '';
    $Self->{Translation}->{'Version Number'} = 'Número da versão';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Detalhes da Versão do Item de Configuração';
    $Self->{Translation}->{'Property'} = 'Propriedade';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = 'Item de configuração';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = '';
    $Self->{Translation}->{'Config Item Search Results'} = '';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Administração.';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = 'Itens de Configuração';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Módulo de evento de item de configuração que permite registar o histórico da interface do agente.';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Limite de Items de Configuração';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'Limite de Items de Configuração por página';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Router de pesquisa de item de configuração da interface do agente.';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Criar e gerir as definições de Itens de Configuração.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define the group with permissions.'} = '';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Define um módulo de vista geral para mostrar a vista pequena da lista de itens de configuração.';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Define o subobjeto por omissão da classe \'ITSMConfigItem\'.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        '';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        '';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Define as colunas mostradas na busca de item de configuração. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Deployment State Color'} = '';
    $Self->{Translation}->{'Deployment State Color.'} = '';
    $Self->{Translation}->{'Deployment State Type.'} = '';
    $Self->{Translation}->{'Disabled'} = '';
    $Self->{Translation}->{'Enabled'} = '';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        '';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        '';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Módulo para verificar o grupo responsável por uma classe.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Módulo para verificar o grupo responsável por um item de configuração.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Módulo para gerar estatísticas do item de configuração ITSM.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Modulo de registo de objeto para o módulo de importação/exportação.';
    $Self->{Translation}->{'Overview.'} = '';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Parâmetros de estado de implementação nas preferências de visualização da interface de agente.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parâmetros do grupos de permissão de exemplo dos atributos do catálogo geral.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Parâmetros das páginas (nas quais os itens de configuração são visualizados).';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de pesquisa de item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de detalhes do item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de adição de item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de edição de item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de histórico de item de configuração ITSM de agente.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Permissões necessárias para usar o formulário de impressão de item de configuração ITSM na interface do agente.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '';
    $Self->{Translation}->{'Search config items.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Seleciona o módulo de geração de número de item de configuração. "Autoincremento" incrementa o número do item de configuração, o SystemID, o ConfigItemClassID e o Counter são utilizados. O formato é "SystemID.ConfigItemClassID.Counter", por exemplo, 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Mostra um link no menu que permite associar um item de configuração a outro objeto na vista de detalhes do item de configuração de agente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para aceder o histórico de item de configuração na vista de agente.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para duplicar um item de configuração na vista de agente.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para editar um item de configuração na vista de agente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para imprimir um item de configuração na vista de detalhes de agente.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Mostra o histórico do item configuração (ordem inversa) no interface de agente.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '';
    $Self->{Translation}->{'class'} = '';
    $Self->{Translation}->{'global'} = '';

}

1;
