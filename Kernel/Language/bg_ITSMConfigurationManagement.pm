# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::bg_ITSMConfigurationManagement;

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
    $Self->{Translation}->{'Admin Tool'} = 'Административнен инструмент';
    $Self->{Translation}->{'Backup Device'} = 'Архивиращо у-во';
    $Self->{Translation}->{'Beamer'} = 'Бимер';
    $Self->{Translation}->{'Building'} = '';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = '';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = '';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = '';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = '';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = '';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = '';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = '';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = '';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = '';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = '';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = '';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = '';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = '';
    $Self->{Translation}->{'CPU'} = 'Процесор';
    $Self->{Translation}->{'Camera'} = 'Камера';
    $Self->{Translation}->{'Capacity'} = 'Капацитет';
    $Self->{Translation}->{'Change Definition'} = 'Промяна на дефиницията';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Промяната на дефинициите е неуспешна! Виж системния журнал за детайли.';
    $Self->{Translation}->{'Client Application'} = 'Потребителски приложения';
    $Self->{Translation}->{'Client OS'} = 'Потребителска Опер.с-ма';
    $Self->{Translation}->{'Config Item-Area'} = '';
    $Self->{Translation}->{'Config Items available'} = 'Достъпни конфигур.единици';
    $Self->{Translation}->{'Config Items shown'} = 'Показани конфигур.единици';
    $Self->{Translation}->{'CMDB'} = '';
    $Self->{Translation}->{'Demo'} = 'Демо';
    $Self->{Translation}->{'Desktop'} = 'Настолен';
    $Self->{Translation}->{'Developer Licence'} = 'Лиценз за разработчици';
    $Self->{Translation}->{'Docking Station'} = 'Докинг станция';
    $Self->{Translation}->{'Duplicate'} = 'Направи копие';
    $Self->{Translation}->{'Embedded'} = 'Вградена';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '';
    $Self->{Translation}->{'Enterprise Licence'} = 'Ентърпрайс лиценз';
    $Self->{Translation}->{'Expiration Date'} = 'Дата на изтичане';
    $Self->{Translation}->{'Expired'} = 'Изтекли';
    $Self->{Translation}->{'Floor'} = '';
    $Self->{Translation}->{'Freeware'} = 'Безплатно разпространяван';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Гейт преход';
    $Self->{Translation}->{'Graphic Adapter'} = 'Графична карта';
    $Self->{Translation}->{'Hard Disk'} = 'Твърд диск';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Твърд диск::капацитет';
    $Self->{Translation}->{'Hide Versions'} = 'Скрий Версиите';
    $Self->{Translation}->{'IP Address'} = 'IP адрес';
    $Self->{Translation}->{'IP over DHCP'} = 'IP от DHCP';
    $Self->{Translation}->{'IT Facility'} = '';
    $Self->{Translation}->{'Incident'} = '';
    $Self->{Translation}->{'Install Date'} = 'Дата на инсталация';
    $Self->{Translation}->{'Keyboard'} = 'Клавиатура';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Преносим';
    $Self->{Translation}->{'Last Change'} = 'Последна промяна';
    $Self->{Translation}->{'Licence Key'} = 'Лицензен ключ';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Лицензен ключ::Дата на изтичане';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Лицензен ключ::Количество';
    $Self->{Translation}->{'Licence Type'} = 'Тип на лиценза';
    $Self->{Translation}->{'Maintenance'} = 'Поддръжка';
    $Self->{Translation}->{'Maximum number of one element'} = '';
    $Self->{Translation}->{'Media'} = 'Медия';
    $Self->{Translation}->{'Middleware'} = 'Средно ниво';
    $Self->{Translation}->{'Model'} = 'Модел';
    $Self->{Translation}->{'Modem'} = 'Модем';
    $Self->{Translation}->{'Monitor'} = 'Монитор';
    $Self->{Translation}->{'Mouse'} = 'Мишка';
    $Self->{Translation}->{'Network Adapter'} = 'Мрежов адаптер';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Мрежов адаптер::IP Адрес';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Мрежов адаптер::IP от DHCP';
    $Self->{Translation}->{'Network Address'} = 'Мрежов адрес';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Мрежов адрес::Гейт преход';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Мрежов адрес::Маска на подмрежата';
    $Self->{Translation}->{'Open Source'} = 'Софтуер с отворен код';
    $Self->{Translation}->{'Operational'} = '';
    $Self->{Translation}->{'Other'} = 'Други';
    $Self->{Translation}->{'Other Equipment'} = 'Друго оборудване';
    $Self->{Translation}->{'Outlet'} = '';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA карта';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'Лицензиране на точка';
    $Self->{Translation}->{'Per Processor'} = 'Лицензиране за процесор';
    $Self->{Translation}->{'Per Server'} = 'Лицензиране за сървър';
    $Self->{Translation}->{'Per User'} = 'Лицензиране за потребител';
    $Self->{Translation}->{'Phone 1'} = '';
    $Self->{Translation}->{'Phone 2'} = '';
    $Self->{Translation}->{'Pilot'} = 'Пилот-водач';
    $Self->{Translation}->{'Planned'} = 'Планиран';
    $Self->{Translation}->{'Printer'} = 'Принтер';
    $Self->{Translation}->{'Production'} = 'Продуктивен';
    $Self->{Translation}->{'Quantity'} = 'Количество';
    $Self->{Translation}->{'Rack'} = '';
    $Self->{Translation}->{'Ram'} = 'Памет';
    $Self->{Translation}->{'Repair'} = 'Ремонт/Възстановяване';
    $Self->{Translation}->{'Retired'} = 'Излязъл от употреба';
    $Self->{Translation}->{'Review'} = 'Преглеждан';
    $Self->{Translation}->{'Room'} = '';
    $Self->{Translation}->{'Router'} = 'Рутер';
    $Self->{Translation}->{'Scanner'} = 'Скенер';
    $Self->{Translation}->{'Search Config Items'} = '';
    $Self->{Translation}->{'Security Device'} = 'У-во за сигурност';
    $Self->{Translation}->{'Serial Number'} = 'Сериен Номер';
    $Self->{Translation}->{'Server'} = 'Сървър';
    $Self->{Translation}->{'Server Application'} = 'Сървърно приложение';
    $Self->{Translation}->{'Server OS'} = 'сървърна Опер.с-ма';
    $Self->{Translation}->{'Show Versions'} = 'Покажи Версиите';
    $Self->{Translation}->{'Single Licence'} = 'Единичен лиценз';
    $Self->{Translation}->{'Subnet Mask'} = 'Маска на подмрежата';
    $Self->{Translation}->{'Switch'} = 'Концентратор';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'Test/QA'} = 'Тест/Качествен контрол';
    $Self->{Translation}->{'The deployment state of this config item'} = '';
    $Self->{Translation}->{'The incident state of this config item'} = '';
    $Self->{Translation}->{'Time Restricted'} = 'Лиценз, ограничен по време';
    $Self->{Translation}->{'USB Device'} = 'USB Устройство';
    $Self->{Translation}->{'Unlimited'} = 'Неограничен лиценз';
    $Self->{Translation}->{'User Tool'} = 'Клиентски инструмент';
    $Self->{Translation}->{'Volume Licence'} = 'Специални обемни програми';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN точка за достъп';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Дата на изтичане на гаранцията';
    $Self->{Translation}->{'Workplace'} = '';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Управление на конфигурационните единици CI';
    $Self->{Translation}->{'Change class definition'} = '';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = '';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = '';
    $Self->{Translation}->{'Filter for Classes'} = '';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '';
    $Self->{Translation}->{'Class'} = 'Клас';

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
    $Self->{Translation}->{'Context Settings'} = '';
    $Self->{Translation}->{'Config Items per page'} = '';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = '';
    $Self->{Translation}->{'Current Incident State'} = '';
    $Self->{Translation}->{'Current Incident State Type'} = '';
    $Self->{Translation}->{'Last changed'} = 'Последна промяна';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = '';
    $Self->{Translation}->{'Run Search'} = '';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Да търси и в предишните версии?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '';
    $Self->{Translation}->{'Configuration Item Information'} = '';
    $Self->{Translation}->{'Current Deployment State'} = '';
    $Self->{Translation}->{'Last changed by'} = 'Последно променен от';
    $Self->{Translation}->{'Ok'} = '';
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
    $Self->{Translation}->{'No Result!'} = '';
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
