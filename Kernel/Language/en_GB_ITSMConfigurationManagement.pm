# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::en_GB_ITSMConfigurationManagement;

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
    $Self->{Translation}->{'Backup Device'} = '';
    $Self->{Translation}->{'Beamer'} = '';
    $Self->{Translation}->{'Building'} = '';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'New ConfigItem (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'ConfigItem (ID=%s) deleted';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'ConfigItems\' definition updated (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Deployment state updated (new=%s; old=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Incident state updated (new=%s; old=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'Link to %s (type=%s) added';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'Link to %s (type=%s) deleted';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'Name updated (new=%s; old=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'Attribute %s updated from "%s" to "%s"';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'New version (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Version %s deleted';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = '';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = '';
    $Self->{Translation}->{'CPU'} = '';
    $Self->{Translation}->{'Camera'} = '';
    $Self->{Translation}->{'Capacity'} = '';
    $Self->{Translation}->{'Change Definition'} = '';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = '';
    $Self->{Translation}->{'Client Application'} = '';
    $Self->{Translation}->{'Client OS'} = '';
    $Self->{Translation}->{'Config Item-Area'} = '';
    $Self->{Translation}->{'Config Items available'} = '';
    $Self->{Translation}->{'Config Items shown'} = '';
    $Self->{Translation}->{'CMDB'} = '';
    $Self->{Translation}->{'Demo'} = '';
    $Self->{Translation}->{'Desktop'} = '';
    $Self->{Translation}->{'Developer Licence'} = '';
    $Self->{Translation}->{'Docking Station'} = '';
    $Self->{Translation}->{'Duplicate'} = '';
    $Self->{Translation}->{'Embedded'} = '';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '';
    $Self->{Translation}->{'Enterprise Licence'} = '';
    $Self->{Translation}->{'Expiration Date'} = '';
    $Self->{Translation}->{'Expired'} = '';
    $Self->{Translation}->{'Floor'} = '';
    $Self->{Translation}->{'Freeware'} = '';
    $Self->{Translation}->{'GSM'} = '';
    $Self->{Translation}->{'Gateway'} = '';
    $Self->{Translation}->{'Graphic Adapter'} = '';
    $Self->{Translation}->{'Hard Disk'} = '';
    $Self->{Translation}->{'Hard Disk::Capacity'} = '';
    $Self->{Translation}->{'Hide Versions'} = '';
    $Self->{Translation}->{'IP Address'} = '';
    $Self->{Translation}->{'IP over DHCP'} = '';
    $Self->{Translation}->{'IT Facility'} = '';
    $Self->{Translation}->{'Incident'} = '';
    $Self->{Translation}->{'Install Date'} = '';
    $Self->{Translation}->{'Keyboard'} = 'Keyboard';
    $Self->{Translation}->{'LAN'} = '';
    $Self->{Translation}->{'Laptop'} = '';
    $Self->{Translation}->{'Last Change'} = '';
    $Self->{Translation}->{'Licence Key'} = '';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = '';
    $Self->{Translation}->{'Licence Key::Quantity'} = '';
    $Self->{Translation}->{'Licence Type'} = '';
    $Self->{Translation}->{'Maintenance'} = '';
    $Self->{Translation}->{'Maximum number of one element'} = '';
    $Self->{Translation}->{'Media'} = '';
    $Self->{Translation}->{'Middleware'} = '';
    $Self->{Translation}->{'Model'} = '';
    $Self->{Translation}->{'Modem'} = '';
    $Self->{Translation}->{'Monitor'} = '';
    $Self->{Translation}->{'Mouse'} = '';
    $Self->{Translation}->{'Network Adapter'} = '';
    $Self->{Translation}->{'Network Adapter::IP Address'} = '';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = '';
    $Self->{Translation}->{'Network Address'} = '';
    $Self->{Translation}->{'Network Address::Gateway'} = '';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = '';
    $Self->{Translation}->{'Open Source'} = '';
    $Self->{Translation}->{'Operational'} = '';
    $Self->{Translation}->{'Other'} = '';
    $Self->{Translation}->{'Other Equipment'} = '';
    $Self->{Translation}->{'Outlet'} = '';
    $Self->{Translation}->{'PCMCIA Card'} = '';
    $Self->{Translation}->{'PDA'} = '';
    $Self->{Translation}->{'Per Node'} = '';
    $Self->{Translation}->{'Per Processor'} = '';
    $Self->{Translation}->{'Per Server'} = '';
    $Self->{Translation}->{'Per User'} = '';
    $Self->{Translation}->{'Phone 1'} = '';
    $Self->{Translation}->{'Phone 2'} = '';
    $Self->{Translation}->{'Pilot'} = '';
    $Self->{Translation}->{'Planned'} = '';
    $Self->{Translation}->{'Printer'} = '';
    $Self->{Translation}->{'Production'} = '';
    $Self->{Translation}->{'Quantity'} = '';
    $Self->{Translation}->{'Rack'} = '';
    $Self->{Translation}->{'Ram'} = '';
    $Self->{Translation}->{'Repair'} = '';
    $Self->{Translation}->{'Retired'} = '';
    $Self->{Translation}->{'Review'} = '';
    $Self->{Translation}->{'Room'} = '';
    $Self->{Translation}->{'Router'} = '';
    $Self->{Translation}->{'Scanner'} = '';
    $Self->{Translation}->{'Search Config Items'} = '';
    $Self->{Translation}->{'Security Device'} = '';
    $Self->{Translation}->{'Serial Number'} = '';
    $Self->{Translation}->{'Server'} = 'Server';
    $Self->{Translation}->{'Server Application'} = '';
    $Self->{Translation}->{'Server OS'} = '';
    $Self->{Translation}->{'Show Versions'} = '';
    $Self->{Translation}->{'Single Licence'} = '';
    $Self->{Translation}->{'Subnet Mask'} = '';
    $Self->{Translation}->{'Switch'} = '';
    $Self->{Translation}->{'Telco'} = '';
    $Self->{Translation}->{'Test/QA'} = '';
    $Self->{Translation}->{'The deployment state of this config item'} = '';
    $Self->{Translation}->{'The incident state of this config item'} = '';
    $Self->{Translation}->{'Time Restricted'} = '';
    $Self->{Translation}->{'USB Device'} = '';
    $Self->{Translation}->{'Unlimited'} = '';
    $Self->{Translation}->{'User Tool'} = '';
    $Self->{Translation}->{'Volume Licence'} = '';
    $Self->{Translation}->{'WLAN'} = '';
    $Self->{Translation}->{'WLAN Access Point'} = '';
    $Self->{Translation}->{'Warranty Expiration Date'} = '';
    $Self->{Translation}->{'Workplace'} = '';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = '';
    $Self->{Translation}->{'Change class definition'} = '';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = '';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = '';
    $Self->{Translation}->{'Filter for Classes'} = '';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '';
    $Self->{Translation}->{'Class'} = '';

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
    $Self->{Translation}->{'The name of this config item'} = '';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';
    $Self->{Translation}->{'Deployment State'} = '';
    $Self->{Translation}->{'Incident State'} = '';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Context Settings';
    $Self->{Translation}->{'Config Items per page'} = '';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = '';
    $Self->{Translation}->{'Current Incident State'} = '';
    $Self->{Translation}->{'Current Incident State Type'} = '';
    $Self->{Translation}->{'Last changed'} = 'Last changed';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = '';
    $Self->{Translation}->{'Run Search'} = '';
    $Self->{Translation}->{'Also search in previous versions?'} = '';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '';
    $Self->{Translation}->{'Configuration Item Information'} = '';
    $Self->{Translation}->{'Current Deployment State'} = '';
    $Self->{Translation}->{'Last changed by'} = 'Last changed by';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Show one version'} = '';
    $Self->{Translation}->{'Show all versions'} = '';
    $Self->{Translation}->{'Version Incident State'} = '';
    $Self->{Translation}->{'Version Deployment State'} = '';
    $Self->{Translation}->{'Version Number'} = '';
    $Self->{Translation}->{'Configuration Item Version Details'} = '';
    $Self->{Translation}->{'Property'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = 'No Result!';
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
        '';
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
