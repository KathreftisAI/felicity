# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nb_NO_ITSMConfigurationManagement;

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
    $Self->{Translation}->{'Address'} = '';
    $Self->{Translation}->{'Admin Tool'} = '';
    $Self->{Translation}->{'Backup Device'} = 'Backup-enhet';
    $Self->{Translation}->{'Beamer'} = '';
    $Self->{Translation}->{'Building'} = 'Bygning';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'Ny Konfigurasjonsenhet (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'Konfigurasjonsenhet (ID=%s) slettet';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'Konfigurasjonsenhetens definisjon ble oppdatert (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Produksjonssettingstilstand endret (ny=%s; gml=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Hendelsestilstand oppdatert (ny=%s; gml=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'Kobling til %s (type=%s) lagt til';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'Kobling til %s (type=%s) lagt til';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Navn oppdatert (nytt=%s; gml=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'Attributt %s oppdatert fra "%s" til "%s"';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Ny versjon (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Versjon %s slettet';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = '';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = '';
    $Self->{Translation}->{'CPU'} = 'Prosessor';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Capacity'} = 'Kapasitet';
    $Self->{Translation}->{'Change Definition'} = 'Endre definisjon';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Endring feilet! Se systemloggen for detaljer.';
    $Self->{Translation}->{'Client Application'} = 'Klient-applikasjon';
    $Self->{Translation}->{'Client OS'} = 'Klient-OS';
    $Self->{Translation}->{'Config Item-Area'} = 'Konfigurasjonsenhet-område';
    $Self->{Translation}->{'Config Items available'} = 'Tilgjengelige konfigurasjonsenheter';
    $Self->{Translation}->{'Config Items shown'} = 'Viste konfigurasjonsenheter';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Desktop'} = 'Stasjonær';
    $Self->{Translation}->{'Developer Licence'} = 'Utviklerlisens';
    $Self->{Translation}->{'Docking Station'} = 'Dokkingstasjon';
    $Self->{Translation}->{'Duplicate'} = 'Duplisér';
    $Self->{Translation}->{'Embedded'} = 'Innebygd';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Tomme felter indikerer at de nåværende verdiene beholdes';
    $Self->{Translation}->{'Enterprise Licence'} = 'Enterprise-lisens';
    $Self->{Translation}->{'Expiration Date'} = 'Utgår dato';
    $Self->{Translation}->{'Expired'} = 'Utgått';
    $Self->{Translation}->{'Floor'} = 'Etasje';
    $Self->{Translation}->{'Freeware'} = 'Gratis programvare';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Ruter';
    $Self->{Translation}->{'Graphic Adapter'} = 'Grafikkort';
    $Self->{Translation}->{'Hard Disk'} = 'Harddisk';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Harddisk::Kapasitet';
    $Self->{Translation}->{'Hide Versions'} = 'Skjul versjoner';
    $Self->{Translation}->{'IP Address'} = 'IP-adresse';
    $Self->{Translation}->{'IP over DHCP'} = 'IP fra DHCP';
    $Self->{Translation}->{'IT Facility'} = 'IT-fasilitet';
    $Self->{Translation}->{'Incident'} = '';
    $Self->{Translation}->{'Install Date'} = 'Installasjonsdato';
    $Self->{Translation}->{'Keyboard'} = 'Tastatur';
    $Self->{Translation}->{'LAN'} = 'Lokalnett';
    $Self->{Translation}->{'Laptop'} = 'Bærbar';
    $Self->{Translation}->{'Last Change'} = 'Sist endret';
    $Self->{Translation}->{'Licence Key'} = 'Lisensnøkkel';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Lisensnøkkel::Utgår dato';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Lisensnøkkel::Antall';
    $Self->{Translation}->{'Licence Type'} = 'Lisenstype';
    $Self->{Translation}->{'Maintenance'} = 'Vedlikehold';
    $Self->{Translation}->{'Maximum number of one element'} = 'Maks. antall av ett element';
    $Self->{Translation}->{'Media'} = 'Media';
    $Self->{Translation}->{'Middleware'} = 'Mellomvare';
    $Self->{Translation}->{'Model'} = 'Modell';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Skjerm';
    $Self->{Translation}->{'Mouse'} = 'Mus';
    $Self->{Translation}->{'Network Adapter'} = 'Nettverkskort';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Nettverkskort::IP-adresse';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Nettverkskort::IP fra DHCP';
    $Self->{Translation}->{'Network Address'} = 'Nettverksadresse';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Nettverksadresse::Ruter';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Nettverksadresse::Subnettmaske';
    $Self->{Translation}->{'Open Source'} = 'Åpen kildekode';
    $Self->{Translation}->{'Operational'} = 'Operativ';
    $Self->{Translation}->{'Other'} = 'Annet';
    $Self->{Translation}->{'Other Equipment'} = 'Annet utstyr';
    $Self->{Translation}->{'Outlet'} = 'Kontakt';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA-kort';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'Per Node';
    $Self->{Translation}->{'Per Processor'} = 'Per Prosessor';
    $Self->{Translation}->{'Per Server'} = 'Per Tjener';
    $Self->{Translation}->{'Per User'} = 'Per Bruker';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'Pilot'} = 'Pilot';
    $Self->{Translation}->{'Planned'} = 'Planlagt';
    $Self->{Translation}->{'Printer'} = 'Skriver';
    $Self->{Translation}->{'Production'} = 'Produksjon';
    $Self->{Translation}->{'Quantity'} = 'Antall';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'Internminne';
    $Self->{Translation}->{'Repair'} = 'Reparasjon';
    $Self->{Translation}->{'Retired'} = 'Pensjonert';
    $Self->{Translation}->{'Review'} = 'Evaluering';
    $Self->{Translation}->{'Room'} = 'Rom';
    $Self->{Translation}->{'Router'} = 'Ruter';
    $Self->{Translation}->{'Scanner'} = 'Skanner';
    $Self->{Translation}->{'Search Config Items'} = 'Søk konfigurasjonsenheter';
    $Self->{Translation}->{'Security Device'} = 'Sikkerhetsenhet';
    $Self->{Translation}->{'Serial Number'} = 'Serienummer';
    $Self->{Translation}->{'Server'} = 'Tjener';
    $Self->{Translation}->{'Server Application'} = 'Tjener-applikasjon';
    $Self->{Translation}->{'Server OS'} = 'Tjener-OS';
    $Self->{Translation}->{'Show Versions'} = 'Vis versjoner';
    $Self->{Translation}->{'Single Licence'} = 'Enkeltlisens';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnettmaske';
    $Self->{Translation}->{'Switch'} = 'Svitsj';
    $Self->{Translation}->{'Telco'} = 'Teleutstyr';
    $Self->{Translation}->{'Test/QA'} = 'Test/Kvalitetskontroll';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Produksjonssettingstilstand for denne konfigurasjonsenheten';
    $Self->{Translation}->{'The incident state of this config item'} = 'Hendelsestilstanden for denne konfigurasjonsenheten';
    $Self->{Translation}->{'Time Restricted'} = 'Tidsbegrenset';
    $Self->{Translation}->{'USB Device'} = 'USB-enhet';
    $Self->{Translation}->{'Unlimited'} = 'Ubegrenset';
    $Self->{Translation}->{'User Tool'} = 'Brukerverktøy';
    $Self->{Translation}->{'Volume Licence'} = 'Volumlisens';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN-basestasjon';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Utløpsdato for garanti';
    $Self->{Translation}->{'Workplace'} = 'Arbeidssted';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Administrasjon av konfigurasjonsenheter';
    $Self->{Translation}->{'Change class definition'} = 'Endre klassedefinisjon';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'Definisjon';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Konfigurasjonsenhet';
    $Self->{Translation}->{'Filter for Classes'} = 'Filter for klasser';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Velg en klasse fra listen for å opprette en ny konfigurasjonsenhet';
    $Self->{Translation}->{'Class'} = 'Klasse';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = '';
    $Self->{Translation}->{'Deployment state'} = '';
    $Self->{Translation}->{'Incident state'} = '';
    $Self->{Translation}->{'Link to another'} = '';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = '';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = '';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Navnet til denne konfigurasjonsenheten';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';
    $Self->{Translation}->{'Deployment State'} = 'Produksjonssettingstilstand';
    $Self->{Translation}->{'Incident State'} = 'Hendelsestilstand';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Kontekstvalg';
    $Self->{Translation}->{'Config Items per page'} = 'Konfigurasjonsenheter per side';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = 'Type Produksjonssettingstilstand';
    $Self->{Translation}->{'Current Incident State'} = 'Nåværende Hendelsestilstand';
    $Self->{Translation}->{'Current Incident State Type'} = 'Nåværende type Hendelsestilstand';
    $Self->{Translation}->{'Last changed'} = 'Sist endret';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = '';
    $Self->{Translation}->{'Run Search'} = '';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Også søke i tidligere versjoner?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Konfigurasjonsenhet';
    $Self->{Translation}->{'Configuration Item Information'} = '';
    $Self->{Translation}->{'Current Deployment State'} = 'Nåværende Produksjonssettingstilstand';
    $Self->{Translation}->{'Last changed by'} = 'Sist endret av';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Show one version'} = 'Vis én versjon';
    $Self->{Translation}->{'Show all versions'} = 'Vis alle versjoner';
    $Self->{Translation}->{'Version Incident State'} = 'Hendelsestilstand for versjonen';
    $Self->{Translation}->{'Version Deployment State'} = '';
    $Self->{Translation}->{'Version Number'} = 'Versjon';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Versjonsdetaljer for enheten';
    $Self->{Translation}->{'Property'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = 'Konfigurasjonsenhet';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Ingen resultater';
    $Self->{Translation}->{'Config Item Search Results'} = '';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = '';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = '';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = '';
    $Self->{Translation}->{'Configuration Item limit per page'} = '';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '';
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
        'Parametere for tilgangsgruppe-eksempel i attributtene for generell katalog.';
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
