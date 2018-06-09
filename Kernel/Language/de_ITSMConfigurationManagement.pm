# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Computer'} = 'Computer';
    $Self->{Translation}->{'Hardware'} = 'Hardware';
    $Self->{Translation}->{'Network'} = 'Netzwerk';
    $Self->{Translation}->{'Software'} = 'Software';
    $Self->{Translation}->{'Address'} = 'Adresse';
    $Self->{Translation}->{'Admin Tool'} = 'Admin Tool';
    $Self->{Translation}->{'Backup Device'} = 'Backup Gerät';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Building'} = 'Gebäude';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'Neues ConfigItem (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'ConfigItem (ID=%s) gelöscht';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'Definition des ConfigItems aktualisiert (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Verwendungsstatus geändert (neu=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Vorfallsstatus geändert (neu=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'Link auf %s (Typ=%s) hinzugefügt';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'Link auf %s (Typ=%s) gelöscht';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Name geändert (neu=%s; alt=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'Attribut %s von "%s" auf "%s" geändert';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Neue Version erzeugt (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Version %s gelöscht';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = 'Anhang (%s) hinzugefügt';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = 'Anhang (%s) gelöscht';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Capacity'} = 'Kapazität';
    $Self->{Translation}->{'Change Definition'} = 'Definition ändern';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Ändern der Definition fehlgeschlagen! Im System Log finden Sie weitere Informationen.';
    $Self->{Translation}->{'Client Application'} = 'Client Anwendung';
    $Self->{Translation}->{'Client OS'} = 'Client Betriebssystem';
    $Self->{Translation}->{'Config Item-Area'} = 'Config Item-Bereich';
    $Self->{Translation}->{'Config Items available'} = 'Config Items verfügbar';
    $Self->{Translation}->{'Config Items shown'} = 'Config Items angezeigt';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'Developer Licence'} = 'Entwickler Lizenz';
    $Self->{Translation}->{'Docking Station'} = 'Docking Station';
    $Self->{Translation}->{'Duplicate'} = 'Duplizieren';
    $Self->{Translation}->{'Embedded'} = 'Embedded';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Leere Felder belassen den aktuellen Wert';
    $Self->{Translation}->{'Enterprise Licence'} = 'Enterprise Lizenz';
    $Self->{Translation}->{'Expiration Date'} = 'Ablaufdatum';
    $Self->{Translation}->{'Expired'} = 'Abgelaufen';
    $Self->{Translation}->{'Floor'} = 'Etage';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Gateway';
    $Self->{Translation}->{'Graphic Adapter'} = 'Grafik Adapter';
    $Self->{Translation}->{'Hard Disk'} = 'Festplatte';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Festplatte::Kapazität';
    $Self->{Translation}->{'Hide Versions'} = 'Versionen ausblenden';
    $Self->{Translation}->{'IP Address'} = 'IP Addresse';
    $Self->{Translation}->{'IP over DHCP'} = 'IP über DHCP';
    $Self->{Translation}->{'IT Facility'} = 'IT Einrichtung';
    $Self->{Translation}->{'Incident'} = 'Vorfall';
    $Self->{Translation}->{'Install Date'} = 'Installationsdatum';
    $Self->{Translation}->{'Keyboard'} = 'Tastatur';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Laptop';
    $Self->{Translation}->{'Last Change'} = 'Letzte Änderung';
    $Self->{Translation}->{'Licence Key'} = 'Lizenzschlüssel';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Lizenzschlüssel::Ablaufdatum';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Lizenzschlüssel::Menge';
    $Self->{Translation}->{'Licence Type'} = 'Lizenztyp';
    $Self->{Translation}->{'Maintenance'} = 'In Wartung';
    $Self->{Translation}->{'Maximum number of one element'} = 'Maximale Anzahl eines Elements';
    $Self->{Translation}->{'Media'} = 'Medium';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Model'} = 'Model';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Mouse'} = 'Maus';
    $Self->{Translation}->{'Network Adapter'} = 'Netzwerk Adapter';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Netzwerk Adapter::IP Adresse';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Netzwerk Adapter::IP über DHCP';
    $Self->{Translation}->{'Network Address'} = 'Netzwerk Adresse';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Netzwerk Adresse::Gateway';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Netzwerk Adresse::Subnetz Maske';
    $Self->{Translation}->{'Open Source'} = 'Open Source';
    $Self->{Translation}->{'Operational'} = 'Operativ';
    $Self->{Translation}->{'Other'} = 'Sonstiges';
    $Self->{Translation}->{'Other Equipment'} = 'Sonstige Ausstattung';
    $Self->{Translation}->{'Outlet'} = 'Anschlussdose';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA Karte';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'Pro Knoten';
    $Self->{Translation}->{'Per Processor'} = 'Pro Prozessor';
    $Self->{Translation}->{'Per Server'} = 'Pro Server';
    $Self->{Translation}->{'Per User'} = 'Pro Benutzer';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'Pilot'} = 'Pilotbetrieb';
    $Self->{Translation}->{'Planned'} = 'Geplant';
    $Self->{Translation}->{'Printer'} = 'Drucker';
    $Self->{Translation}->{'Production'} = 'Produktiv';
    $Self->{Translation}->{'Quantity'} = 'Menge';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'Arbeitsspeicher';
    $Self->{Translation}->{'Repair'} = 'In Reparatur';
    $Self->{Translation}->{'Retired'} = 'Außer Dienst';
    $Self->{Translation}->{'Review'} = 'Unter Review';
    $Self->{Translation}->{'Room'} = 'Raum';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'Scanner'} = 'Scanner';
    $Self->{Translation}->{'Search Config Items'} = 'Config Item Suche';
    $Self->{Translation}->{'Security Device'} = 'Sicherheitsgerät';
    $Self->{Translation}->{'Serial Number'} = 'Seriennummer';
    $Self->{Translation}->{'Server'} = 'Server';
    $Self->{Translation}->{'Server Application'} = 'Server Anwendung';
    $Self->{Translation}->{'Server OS'} = 'Server Betriebssystem';
    $Self->{Translation}->{'Show Versions'} = 'Versionen einblenden';
    $Self->{Translation}->{'Single Licence'} = 'Einzellizenz';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnetz Maske';
    $Self->{Translation}->{'Switch'} = 'Switch';
    $Self->{Translation}->{'Telco'} = 'Telko';
    $Self->{Translation}->{'Test/QA'} = 'Test/QS';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Der Verwendungsstatus dieses Config Items';
    $Self->{Translation}->{'The incident state of this config item'} = 'Der Vorfallsstatus dieses Config Items';
    $Self->{Translation}->{'Time Restricted'} = 'Zeitlich begrenzt';
    $Self->{Translation}->{'USB Device'} = 'USB Gerät';
    $Self->{Translation}->{'Unlimited'} = 'Unlimitiert';
    $Self->{Translation}->{'User Tool'} = 'User Tool';
    $Self->{Translation}->{'Volume Licence'} = 'Volumen Lizenz';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN Access Point';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Garantie Ablaufdatum';
    $Self->{Translation}->{'Workplace'} = 'Arbeitsplatz';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Config Item Verwaltung';
    $Self->{Translation}->{'Change class definition'} = 'Klassen-Definition ändern';
    $Self->{Translation}->{'Config Item Class'} = 'ConfigItem Klasse';
    $Self->{Translation}->{'Definition'} = 'Definition';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Config Item';
    $Self->{Translation}->{'Filter for Classes'} = 'Filter für Klassen';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Wählen Sie eine Klasse aus der Liste aus um ein neues Config Item zu erstellen.';
    $Self->{Translation}->{'Class'} = 'Klasse';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM ConfigItem Sammel-Aktion';
    $Self->{Translation}->{'Deployment state'} = 'Verwendungsstatus';
    $Self->{Translation}->{'Incident state'} = 'Vorfallsstatus';
    $Self->{Translation}->{'Link to another'} = 'Zu einem anderen verlinken';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Ungültige Configuration Item Nummer!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Die Nummer des zu verlinkenden ConfigItems.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = 'Wollen Sie dieses Configitem wirklich löschen?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Der Name dieses Config Items';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Name wird bereits von den ConfigItems mit den folgenden Nummern verwendet: %s';
    $Self->{Translation}->{'Deployment State'} = 'Verwendungsstatus';
    $Self->{Translation}->{'Incident State'} = 'Vorfallsstatus';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Kontext-Eintstellungen';
    $Self->{Translation}->{'Config Items per page'} = 'Config Items pro Seite';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = 'Verwendungsstatus-Typ';
    $Self->{Translation}->{'Current Incident State'} = 'Aktueller Vorfallsstatus';
    $Self->{Translation}->{'Current Incident State Type'} = 'Aktueller Vorfallsstatus-Typ';
    $Self->{Translation}->{'Last changed'} = 'Zuletzt geändert';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = 'Neue Vorlage erstellen';
    $Self->{Translation}->{'Run Search'} = 'Suche ausführen';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Auch in früheren Versionen suchen?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Configuration Item';
    $Self->{Translation}->{'Configuration Item Information'} = 'Configuration Item Information';
    $Self->{Translation}->{'Current Deployment State'} = 'Aktueller Verwendungsstatus';
    $Self->{Translation}->{'Last changed by'} = 'Zuletzt geändert von';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Show one version'} = 'Zeige nur eine Version';
    $Self->{Translation}->{'Show all versions'} = 'Zeige alle Versionen';
    $Self->{Translation}->{'Version Incident State'} = 'Versions-Vorfallstatus';
    $Self->{Translation}->{'Version Deployment State'} = '';
    $Self->{Translation}->{'Version Number'} = 'Versionsnummer';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Configuration Item Versions-Details';
    $Self->{Translation}->{'Property'} = 'Eigenschaft';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = 'ConfigItem';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Kein Ergebnis!';
    $Self->{Translation}->{'Config Item Search Results'} = 'Suchergebnise filtern';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Admin.';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Prüfe Namen auf Eindeutigkeit innerhalb der selben ConfigItem-Klasse oder global, d.h. es werden alle ConfigItems jeglicher ConfigItem-Klasse bei der Prüfung auf einen eindeutigen Namen berücksichtigt.';
    $Self->{Translation}->{'Config Items'} = 'Config Items';
    $Self->{Translation}->{'Config item add.'} = 'Config Item hinzufügen.';
    $Self->{Translation}->{'Config item edit.'} = 'Config Item bearbeiten.';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Config item history.'} = 'Config Item Verlauf.';
    $Self->{Translation}->{'Config item print.'} = 'Config Item drucken.';
    $Self->{Translation}->{'Config item zoom.'} = 'Config Item Zoom.';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Configuration Item Limit';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'Configuration Item Limit pro Seite';
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
        'Definiert das Standard-Subobject der Klasse';
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
    $Self->{Translation}->{'Disabled'} = 'Deaktiviert';
    $Self->{Translation}->{'Enabled'} = 'Aktiviert';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        '';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        '';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '(De-)Aktiviert die Funktionalität um ConfigItems auf eindeutige Namen zu überprüfen. Bevor Sie diese Option aktivieren, sollten Sie Ihr System auf bereits vorhandene ConfigItems mit gleichem Namen überprüfen. Sie können dies mit Hilfe des scripts bin/otrs.ITSMConfigItemListDuplicates.pl tun.';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        '';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = '';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Objekt-Backend Modul Registration des Import/Export Moduls.';
    $Self->{Translation}->{'Overview.'} = 'Übersicht.';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parameter für die zugriffsberechtigte Gruppe der General-Katalog-Attribute.';
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
    $Self->{Translation}->{'Search config items.'} = 'Suche config items.';
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
    $Self->{Translation}->{'class'} = 'Klasse';
    $Self->{Translation}->{'global'} = 'Global';

}

1;
