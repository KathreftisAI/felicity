# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sv_ITSMConfigurationManagement;

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
    $Self->{Translation}->{'Address'} = 'Adress';
    $Self->{Translation}->{'Admin Tool'} = 'Administrationsverktyg';
    $Self->{Translation}->{'Backup Device'} = 'Backupenhet';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Building'} = 'Byggnad';
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
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Capacity'} = 'Kapacitet';
    $Self->{Translation}->{'Change Definition'} = 'Ändra definition';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Ändring av definition misslyckades! Se systemloggen för detaljer.';
    $Self->{Translation}->{'Client Application'} = 'Klientapplikation';
    $Self->{Translation}->{'Client OS'} = 'Klient-OS';
    $Self->{Translation}->{'Config Item-Area'} = 'Konfigurationsenhet-område';
    $Self->{Translation}->{'Config Items available'} = 'Tillgängliga konfigurationsenheter';
    $Self->{Translation}->{'Config Items shown'} = 'Visa konfigurationsenheter';
    $Self->{Translation}->{'CMDB'} = 'Konfigurationsdatabas';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'Developer Licence'} = 'Utvecklarlicens';
    $Self->{Translation}->{'Docking Station'} = 'Dockningsstation';
    $Self->{Translation}->{'Duplicate'} = 'Duplicera';
    $Self->{Translation}->{'Embedded'} = 'Embedded';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Tomma fält anger att tidigare värden ska användas.';
    $Self->{Translation}->{'Enterprise Licence'} = 'Enterpriselicens';
    $Self->{Translation}->{'Expiration Date'} = 'Löper ut datum';
    $Self->{Translation}->{'Expired'} = 'Löpt ut';
    $Self->{Translation}->{'Floor'} = 'Våning';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Gateway';
    $Self->{Translation}->{'Graphic Adapter'} = 'Grafikkort';
    $Self->{Translation}->{'Hard Disk'} = 'Hårddisk';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Hårddisk::Kapacitet';
    $Self->{Translation}->{'Hide Versions'} = 'Dölj versioner';
    $Self->{Translation}->{'IP Address'} = 'IP-adress';
    $Self->{Translation}->{'IP over DHCP'} = 'IP över DHCP';
    $Self->{Translation}->{'IT Facility'} = 'IT-byggnad';
    $Self->{Translation}->{'Incident'} = 'Incident';
    $Self->{Translation}->{'Install Date'} = 'Installationsdatum';
    $Self->{Translation}->{'Keyboard'} = 'Tangentbord';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Laptop';
    $Self->{Translation}->{'Last Change'} = 'Sist ändrat';
    $Self->{Translation}->{'Licence Key'} = 'Licensnyckel';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Licensnyckel::Löper ut';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Licensnyckel::Antal';
    $Self->{Translation}->{'Licence Type'} = 'Licenstyper';
    $Self->{Translation}->{'Maintenance'} = 'Underhåll';
    $Self->{Translation}->{'Maximum number of one element'} = 'Max antal av ett element';
    $Self->{Translation}->{'Media'} = 'Media';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Model'} = 'Modell';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Mouse'} = 'Mus';
    $Self->{Translation}->{'Network Adapter'} = 'Nätverkskort';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Nätverkskort::IP-adress';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Nätverksadapter::IP över DHCP';
    $Self->{Translation}->{'Network Address'} = 'Nätverksadress';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Nätverksadress::Gateway';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Nätverksadress::Subnätmask';
    $Self->{Translation}->{'Open Source'} = 'Öppen källkod';
    $Self->{Translation}->{'Operational'} = 'Operationell';
    $Self->{Translation}->{'Other'} = 'Annan';
    $Self->{Translation}->{'Other Equipment'} = 'Annan utrustning';
    $Self->{Translation}->{'Outlet'} = 'Väggkontakt';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA-kort';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'Per nod';
    $Self->{Translation}->{'Per Processor'} = 'Per processor';
    $Self->{Translation}->{'Per Server'} = 'Per server';
    $Self->{Translation}->{'Per User'} = 'Per användare';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'Pilot'} = 'Pilot';
    $Self->{Translation}->{'Planned'} = 'Planlagd';
    $Self->{Translation}->{'Printer'} = 'Skrivare';
    $Self->{Translation}->{'Production'} = 'Produktion';
    $Self->{Translation}->{'Quantity'} = 'Mängd';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Repair'} = 'Reperation';
    $Self->{Translation}->{'Retired'} = 'Pensionerad';
    $Self->{Translation}->{'Review'} = 'Översyn';
    $Self->{Translation}->{'Room'} = 'Rum';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Search Config Items'} = 'Sök konfigurationsenheter';
    $Self->{Translation}->{'Security Device'} = 'Säkerhetsutrustning';
    $Self->{Translation}->{'Serial Number'} = 'Serienummer';
    $Self->{Translation}->{'Server'} = 'Server';
    $Self->{Translation}->{'Server Application'} = 'Serverapplikation';
    $Self->{Translation}->{'Server OS'} = 'Server-OS';
    $Self->{Translation}->{'Show Versions'} = 'Visa versioner';
    $Self->{Translation}->{'Single Licence'} = 'Enstaka licens';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnätmask';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'Test/QA'} = 'Test/QA';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Driftläge för konfigurationsenhet';
    $Self->{Translation}->{'The incident state of this config item'} = 'Incidentläge för konfigurationsenhet';
    $Self->{Translation}->{'Time Restricted'} = 'Tidsbegränsad';
    $Self->{Translation}->{'USB Device'} = 'USB-enhet';
    $Self->{Translation}->{'Unlimited'} = 'Obegränsad';
    $Self->{Translation}->{'User Tool'} = 'Användarverktyg';
    $Self->{Translation}->{'Volume Licence'} = 'Volymlicens';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN Accesspunkt';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Sista dag för garanti';
    $Self->{Translation}->{'Workplace'} = 'Arbetsplats';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Hantering av konfigurationsenheter';
    $Self->{Translation}->{'Change class definition'} = 'Ändra klassdefinition';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'Definition';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Konfigurationsenhet';
    $Self->{Translation}->{'Filter for Classes'} = 'Filtrera klasser';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Välj en klass från listan för att skapa en ny konfigurationsenhet';
    $Self->{Translation}->{'Class'} = 'Klass';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = '';
    $Self->{Translation}->{'Deployment state'} = 'Driftläge';
    $Self->{Translation}->{'Incident state'} = 'Incidentläge';
    $Self->{Translation}->{'Link to another'} = 'Länka till annan';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = '';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = '';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Namnet på denna konfigurationsenhet';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Namnet används redan i konfigurationsenheter med förljande nummer: %s';
    $Self->{Translation}->{'Deployment State'} = 'Driftläge';
    $Self->{Translation}->{'Incident State'} = 'Incidentläge';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Anpassa vy';
    $Self->{Translation}->{'Config Items per page'} = 'Konfigurationsenheter per sida';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = 'Driftlägestyper';
    $Self->{Translation}->{'Current Incident State'} = 'Nuvarande incidentläge';
    $Self->{Translation}->{'Current Incident State Type'} = 'Nuvarande typ av incidentläge';
    $Self->{Translation}->{'Last changed'} = 'Senast ändrad';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = 'Skapa ny mall';
    $Self->{Translation}->{'Run Search'} = 'Utför sökning';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Sök även i tidigare versioner?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Konfigurationsenhet';
    $Self->{Translation}->{'Configuration Item Information'} = 'Information om konfigurationsenhet';
    $Self->{Translation}->{'Current Deployment State'} = 'Nuvarande driftläge';
    $Self->{Translation}->{'Last changed by'} = 'Senast ändrad av';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Show one version'} = 'Visa en version';
    $Self->{Translation}->{'Show all versions'} = 'Visa alla versioner';
    $Self->{Translation}->{'Version Incident State'} = 'Incidentläge för version';
    $Self->{Translation}->{'Version Deployment State'} = '';
    $Self->{Translation}->{'Version Number'} = 'Versionsnummer';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Versionsinformation för konfigurationsenhet';
    $Self->{Translation}->{'Property'} = 'Egenskap';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = 'Konfigurationsenhet';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Inget resultat!';
    $Self->{Translation}->{'Config Item Search Results'} = '';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Admin.';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = 'Konfigurationsenheter';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Begränsning konfigurationsenheter';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'Max antal konfigurationsenheter per sida';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Skapa och hantera definitioner för konfigurationsenheter';
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
        '';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Anger antal rader för KE-editorn i admingränssnittet.';
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
    $Self->{Translation}->{'Disabled'} = 'Inaktiverad';
    $Self->{Translation}->{'Enabled'} = 'Aktiverad';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        '';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        '';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        '';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = '';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        '';
    $Self->{Translation}->{'Overview.'} = '';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parametrar för exempel på behörighetsegrupper i grundkatalogens attribut.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        '';
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
