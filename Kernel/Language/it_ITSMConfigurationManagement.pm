# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::it_ITSMConfigurationManagement;

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
    $Self->{Translation}->{'Address'} = 'Indirizzo';
    $Self->{Translation}->{'Admin Tool'} = 'Strumenti di amministrazione';
    $Self->{Translation}->{'Backup Device'} = 'Dispositivo di copia';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Building'} = 'Edificio';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'CIHistory::ConfigItemCreate';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'CIHistory::ConfigItemDelete';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'CIHistory::DefinitionUpdate';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'CIHistory::DeploymentStateUpdate';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'CIHistory::IncidentStateUpdate';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'CIHistory::LinkAdd';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'CIHistory::LinkDelete';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'CIHistory::NameUpdate';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'CIHistory::ValueUpdate';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'CIHistory::VersionCreate';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'CIHistory::VersionDelete';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = 'CIHistory::AttachmentAdd';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = 'CIHistory::AttachmentDelete';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = 'Videocamera';
    $Self->{Translation}->{'Capacity'} = 'Capacità';
    $Self->{Translation}->{'Change Definition'} = 'Modifica definizione';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Aggiornamento delle definizioni non riuscita! Vedi il log di sistema per i dettagli.';
    $Self->{Translation}->{'Client Application'} = 'Applicazione client';
    $Self->{Translation}->{'Client OS'} = 'SO Cliente';
    $Self->{Translation}->{'Config Item-Area'} = 'Area di configurazione elementi';
    $Self->{Translation}->{'Config Items available'} = 'Elementi di configurazione disponibili';
    $Self->{Translation}->{'Config Items shown'} = 'Elementi di configurazione mostrati';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'Dimostrativo';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'Developer Licence'} = 'Licenza di sviluppo';
    $Self->{Translation}->{'Docking Station'} = 'Docking Station';
    $Self->{Translation}->{'Duplicate'} = 'Duplicato';
    $Self->{Translation}->{'Embedded'} = 'Integrato';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '';
    $Self->{Translation}->{'Enterprise Licence'} = 'Licenza aziendale';
    $Self->{Translation}->{'Expiration Date'} = 'Data di scadenza';
    $Self->{Translation}->{'Expired'} = 'Scaduto';
    $Self->{Translation}->{'Floor'} = 'Piano';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Gateway';
    $Self->{Translation}->{'Graphic Adapter'} = 'Scheda grafica';
    $Self->{Translation}->{'Hard Disk'} = 'Disco fisso';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Disco fisso::Capacità';
    $Self->{Translation}->{'Hide Versions'} = 'Nascondi versioni';
    $Self->{Translation}->{'IP Address'} = 'Indirizzo IP';
    $Self->{Translation}->{'IP over DHCP'} = 'IP su DHCP';
    $Self->{Translation}->{'IT Facility'} = '';
    $Self->{Translation}->{'Incident'} = '';
    $Self->{Translation}->{'Install Date'} = 'Data di installazione';
    $Self->{Translation}->{'Keyboard'} = 'Tastiera';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Portatile';
    $Self->{Translation}->{'Last Change'} = 'Ultima modifica';
    $Self->{Translation}->{'Licence Key'} = 'Chiave di licenza';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Chiave di licenza::Data di scadenza';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Chiave di licenza::Quantità';
    $Self->{Translation}->{'Licence Type'} = 'Tipo di licenza';
    $Self->{Translation}->{'Maintenance'} = 'Manutenzione';
    $Self->{Translation}->{'Maximum number of one element'} = 'Numero massimo di un elemento';
    $Self->{Translation}->{'Media'} = 'Supporto';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Model'} = 'Modello';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Mouse'} = 'Mouse';
    $Self->{Translation}->{'Network Adapter'} = 'Scheda di rete';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Scheda di rete::Indirizzo IP';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Scheda di rete::IP su DHCP';
    $Self->{Translation}->{'Network Address'} = 'Indirizzo di rete';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Indirizzo di rete::Gateway';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Indirizzo di rete::Subnet Mask';
    $Self->{Translation}->{'Open Source'} = 'Open Source';
    $Self->{Translation}->{'Operational'} = 'Operativo';
    $Self->{Translation}->{'Other'} = 'Altro';
    $Self->{Translation}->{'Other Equipment'} = 'Altri apparati';
    $Self->{Translation}->{'Outlet'} = '';
    $Self->{Translation}->{'PCMCIA Card'} = 'Scheda PCMCIA';
    $Self->{Translation}->{'PDA'} = 'Palmare';
    $Self->{Translation}->{'Per Node'} = 'Per nodo';
    $Self->{Translation}->{'Per Processor'} = 'Per processore';
    $Self->{Translation}->{'Per Server'} = 'Per server';
    $Self->{Translation}->{'Per User'} = 'Per utente';
    $Self->{Translation}->{'Phone 1'} = 'Telefono 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefono 2';
    $Self->{Translation}->{'Pilot'} = 'Pilot';
    $Self->{Translation}->{'Planned'} = 'Pianificato';
    $Self->{Translation}->{'Printer'} = 'Stampante';
    $Self->{Translation}->{'Production'} = 'Produzione';
    $Self->{Translation}->{'Quantity'} = 'Quantità';
    $Self->{Translation}->{'Rack'} = 'Armadio';
    $Self->{Translation}->{'Ram'} = 'Ram';
    $Self->{Translation}->{'Repair'} = 'Riparazione';
    $Self->{Translation}->{'Retired'} = 'Ritirato';
    $Self->{Translation}->{'Review'} = 'Revisionato';
    $Self->{Translation}->{'Room'} = 'Stanza';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Search Config Items'} = 'Ricerca elementi di configurazione';
    $Self->{Translation}->{'Security Device'} = 'Dispositivo di sicurezza';
    $Self->{Translation}->{'Serial Number'} = 'Numero seriale';
    $Self->{Translation}->{'Server'} = 'Server';
    $Self->{Translation}->{'Server Application'} = 'Applicazione server';
    $Self->{Translation}->{'Server OS'} = 'SO server';
    $Self->{Translation}->{'Show Versions'} = 'Mostra versioni';
    $Self->{Translation}->{'Single Licence'} = 'Licenza singola';
    $Self->{Translation}->{'Subnet Mask'} = 'Maschera di rete';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'Test/QA'} = 'Test';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Lo stato di implementazione di questo elemento di configurazione';
    $Self->{Translation}->{'The incident state of this config item'} = 'Lo stato di incidente di questo elemento di configurazione';
    $Self->{Translation}->{'Time Restricted'} = 'Limitata nel tempo';
    $Self->{Translation}->{'USB Device'} = 'Dispositivo USB';
    $Self->{Translation}->{'Unlimited'} = 'Illimitata';
    $Self->{Translation}->{'User Tool'} = 'Strumenti utente';
    $Self->{Translation}->{'Volume Licence'} = 'Licenza per volume';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN Access Point';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Data di scadenza della garanzia';
    $Self->{Translation}->{'Workplace'} = '';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Gestione degli elementi di configurazione';
    $Self->{Translation}->{'Change class definition'} = '';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'Definizione';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Elemento di configurazione';
    $Self->{Translation}->{'Filter for Classes'} = 'Filtro per classi';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '';
    $Self->{Translation}->{'Class'} = 'Classe';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = '';
    $Self->{Translation}->{'Deployment state'} = '';
    $Self->{Translation}->{'Incident state'} = '';
    $Self->{Translation}->{'Link to another'} = 'Collega a un altro';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = '';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = '';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Il nome di questo elemento di configurazione';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';
    $Self->{Translation}->{'Deployment State'} = 'Stato di implementazione';
    $Self->{Translation}->{'Incident State'} = 'Stato dell\'incidente';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Impostazioni di contesto';
    $Self->{Translation}->{'Config Items per page'} = '';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = '';
    $Self->{Translation}->{'Current Incident State'} = 'Stato attuale dell\'incidente';
    $Self->{Translation}->{'Current Incident State Type'} = '';
    $Self->{Translation}->{'Last changed'} = 'Ultima modifica';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = 'Crea nuovo modello';
    $Self->{Translation}->{'Run Search'} = 'Esegui ricerca';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Cercare anche in versioni precedenti?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '';
    $Self->{Translation}->{'Configuration Item Information'} = '';
    $Self->{Translation}->{'Current Deployment State'} = 'Stato attuale di implementazione';
    $Self->{Translation}->{'Last changed by'} = 'Ultima modifica di';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Show one version'} = 'Mostra una versione';
    $Self->{Translation}->{'Show all versions'} = 'Mostra tutte le versioni';
    $Self->{Translation}->{'Version Incident State'} = '';
    $Self->{Translation}->{'Version Deployment State'} = '';
    $Self->{Translation}->{'Version Number'} = 'Numero di versione';
    $Self->{Translation}->{'Configuration Item Version Details'} = '';
    $Self->{Translation}->{'Property'} = 'Proprietà';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Nessun risultato!';
    $Self->{Translation}->{'Config Item Search Results'} = '';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Admin.';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = 'Elementi di configurazione';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = '';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'Limite di elementi di configurazione per pagina';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Crea e gestisci le definizioni per gli elementi di configurazione.';
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
        '';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Definisce il sotto-oggetto predefinito della classe \'ITSMConfigItem\'.';
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
        '';
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
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Modulo per controllare il gruppo responsabile per una classe.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        '';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Modulo per generare le statistiche degli elementi di configurazione ITSM.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        '';
    $Self->{Translation}->{'Overview.'} = '';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parametri per i gruppi di permessi di esempio degli attributi del catalogo generale.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Parametri per le pagine (nelle quali gli elementi di configurazione sono mostrati).';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '';
    $Self->{Translation}->{'Search config items.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        '';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        '';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '';
    $Self->{Translation}->{'class'} = '';
    $Self->{Translation}->{'global'} = '';

}

1;
