# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_TW_ITSMConfigurationManagement;

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
    $Self->{Translation}->{'Address'} = '地址';
    $Self->{Translation}->{'Admin Tool'} = '管理工具';
    $Self->{Translation}->{'Backup Device'} = '備份設備';
    $Self->{Translation}->{'Beamer'} = '投影儀';
    $Self->{Translation}->{'Building'} = '大廈';
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
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = '照相機';
    $Self->{Translation}->{'Capacity'} = '容量';
    $Self->{Translation}->{'Change Definition'} = '修改定義';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = '修改定義失敗!詳細信息請参考系统日誌.';
    $Self->{Translation}->{'Client Application'} = '客户端應用程序';
    $Self->{Translation}->{'Client OS'} = '客户操作系統';
    $Self->{Translation}->{'Config Item-Area'} = '配置項區域';
    $Self->{Translation}->{'Config Items available'} = '有效的配置項';
    $Self->{Translation}->{'Config Items shown'} = '顯示配置項';
    $Self->{Translation}->{'CMDB'} = '';
    $Self->{Translation}->{'Demo'} = '演示';
    $Self->{Translation}->{'Desktop'} = '桌上型電腦';
    $Self->{Translation}->{'Developer Licence'} = '開發許可';
    $Self->{Translation}->{'Docking Station'} = '塢站';
    $Self->{Translation}->{'Duplicate'} = '複製';
    $Self->{Translation}->{'Embedded'} = '嵌入式';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '空字段表示當前值被保存';
    $Self->{Translation}->{'Enterprise Licence'} = '企業執照';
    $Self->{Translation}->{'Expiration Date'} = '失效日期';
    $Self->{Translation}->{'Expired'} = '到期';
    $Self->{Translation}->{'Floor'} = '樓層';
    $Self->{Translation}->{'Freeware'} = '免費軟件';
    $Self->{Translation}->{'GSM'} = '';
    $Self->{Translation}->{'Gateway'} = '閘道';
    $Self->{Translation}->{'Graphic Adapter'} = '顯示卡';
    $Self->{Translation}->{'Hard Disk'} = '硬碟';
    $Self->{Translation}->{'Hard Disk::Capacity'} = '硬碟::容量';
    $Self->{Translation}->{'Hide Versions'} = '隱藏版本';
    $Self->{Translation}->{'IP Address'} = 'IP位址';
    $Self->{Translation}->{'IP over DHCP'} = '從DHCP取得IP';
    $Self->{Translation}->{'IT Facility'} = 'IT設施';
    $Self->{Translation}->{'Incident'} = '故障';
    $Self->{Translation}->{'Install Date'} = '安装日期';
    $Self->{Translation}->{'Keyboard'} = '鍵盤';
    $Self->{Translation}->{'LAN'} = '區域網路';
    $Self->{Translation}->{'Laptop'} = '筆記本';
    $Self->{Translation}->{'Last Change'} = '最後修改於';
    $Self->{Translation}->{'Licence Key'} = '許可密鑰';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = '許可密鑰::失效日期';
    $Self->{Translation}->{'Licence Key::Quantity'} = '許可密鑰::數量';
    $Self->{Translation}->{'Licence Type'} = '許可類别';
    $Self->{Translation}->{'Maintenance'} = '維護';
    $Self->{Translation}->{'Maximum number of one element'} = '此元素的最大數量';
    $Self->{Translation}->{'Media'} = '介質';
    $Self->{Translation}->{'Middleware'} = '中間件';
    $Self->{Translation}->{'Model'} = '型號';
    $Self->{Translation}->{'Modem'} = '調解調器';
    $Self->{Translation}->{'Monitor'} = '顯示器';
    $Self->{Translation}->{'Mouse'} = '滑鼠';
    $Self->{Translation}->{'Network Adapter'} = '網路卡';
    $Self->{Translation}->{'Network Adapter::IP Address'} = '網路卡::IP位址';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = '網路卡::從DHCP取得IP';
    $Self->{Translation}->{'Network Address'} = '網路位址';
    $Self->{Translation}->{'Network Address::Gateway'} = '網路位址::閘道';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = '網路位址::子網路遮照';
    $Self->{Translation}->{'Open Source'} = '開源';
    $Self->{Translation}->{'Operational'} = '正常';
    $Self->{Translation}->{'Other'} = '其它';
    $Self->{Translation}->{'Other Equipment'} = '其它設備';
    $Self->{Translation}->{'Outlet'} = '插座';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA卡';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = '每個節點';
    $Self->{Translation}->{'Per Processor'} = '每個處理器';
    $Self->{Translation}->{'Per Server'} = '每個服務器';
    $Self->{Translation}->{'Per User'} = '每個用戶';
    $Self->{Translation}->{'Phone 1'} = '電話1';
    $Self->{Translation}->{'Phone 2'} = '電話2';
    $Self->{Translation}->{'Pilot'} = '試驗';
    $Self->{Translation}->{'Planned'} = '已計劃';
    $Self->{Translation}->{'Printer'} = '打印機';
    $Self->{Translation}->{'Production'} = '生產';
    $Self->{Translation}->{'Quantity'} = '數量';
    $Self->{Translation}->{'Rack'} = '機架';
    $Self->{Translation}->{'Ram'} = '内存';
    $Self->{Translation}->{'Repair'} = '修復';
    $Self->{Translation}->{'Retired'} = '報廢';
    $Self->{Translation}->{'Review'} = '複審';
    $Self->{Translation}->{'Room'} = '房間';
    $Self->{Translation}->{'Router'} = '路由器';
    $Self->{Translation}->{'Scanner'} = '掃描儀';
    $Self->{Translation}->{'Search Config Items'} = '搜索配置項';
    $Self->{Translation}->{'Security Device'} = '安全設備';
    $Self->{Translation}->{'Serial Number'} = '序列號';
    $Self->{Translation}->{'Server'} = '服務器';
    $Self->{Translation}->{'Server Application'} = '服務器應用程序';
    $Self->{Translation}->{'Server OS'} = '服務器操作系統';
    $Self->{Translation}->{'Show Versions'} = '顯示版本';
    $Self->{Translation}->{'Single Licence'} = '單一許可';
    $Self->{Translation}->{'Subnet Mask'} = '子網路遮照';
    $Self->{Translation}->{'Switch'} = '交換器';
    $Self->{Translation}->{'Telco'} = '電話公司';
    $Self->{Translation}->{'Test/QA'} = '测試/QA';
    $Self->{Translation}->{'The deployment state of this config item'} = '配置項部署狀態';
    $Self->{Translation}->{'The incident state of this config item'} = '配置項故障狀態';
    $Self->{Translation}->{'Time Restricted'} = '時間限制';
    $Self->{Translation}->{'USB Device'} = 'USB 設備';
    $Self->{Translation}->{'Unlimited'} = '無限制的';
    $Self->{Translation}->{'User Tool'} = '用戶工具';
    $Self->{Translation}->{'Volume Licence'} = '批量授權';
    $Self->{Translation}->{'WLAN'} = '無線網路';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN 無線基地台';
    $Self->{Translation}->{'Warranty Expiration Date'} = '保養失效日期';
    $Self->{Translation}->{'Workplace'} = '工作間';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = '管理配置項';
    $Self->{Translation}->{'Change class definition'} = '修改類定義';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = '定義';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = '配置項';
    $Self->{Translation}->{'Filter for Classes'} = '過濾類';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '先從列表中選擇類別，然後建立新的配置項。';
    $Self->{Translation}->{'Class'} = '類別';

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
    $Self->{Translation}->{'The name of this config item'} = '為這個配置項命名';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';
    $Self->{Translation}->{'Deployment State'} = '部署狀態';
    $Self->{Translation}->{'Incident State'} = '故障狀態';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '上下文設置';
    $Self->{Translation}->{'Config Items per page'} = '每頁配置項個數';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = '部署狀態類型';
    $Self->{Translation}->{'Current Incident State'} = '當前的故障狀態';
    $Self->{Translation}->{'Current Incident State Type'} = '當前的故障狀態類型';
    $Self->{Translation}->{'Last changed'} = '最後修改';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = '創建模板';
    $Self->{Translation}->{'Run Search'} = '搜索';
    $Self->{Translation}->{'Also search in previous versions?'} = '同時搜索以前的版本?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '配置項';
    $Self->{Translation}->{'Configuration Item Information'} = '配置項信息';
    $Self->{Translation}->{'Current Deployment State'} = '當前的部署狀態';
    $Self->{Translation}->{'Last changed by'} = '最後修改於';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Show one version'} = '顯示一個版本';
    $Self->{Translation}->{'Show all versions'} = '顯示所有版本';
    $Self->{Translation}->{'Version Incident State'} = '版本故障狀態';
    $Self->{Translation}->{'Version Deployment State'} = '版本部屬狀態';
    $Self->{Translation}->{'Version Number'} = '版本號碼';
    $Self->{Translation}->{'Configuration Item Version Details'} = '配置項版本詳情';
    $Self->{Translation}->{'Property'} = '屬性';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = '配置項';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = '沒有結果!';
    $Self->{Translation}->{'Config Item Search Results'} = '配置項目搜尋結果';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = '';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = '配置項';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = '';
    $Self->{Translation}->{'Configuration Item limit per page'} = '限制每頁設定的項目數';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '創建和管理配置項定義';
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
    $Self->{Translation}->{'Disabled'} = '禁用';
    $Self->{Translation}->{'Enabled'} = '啟用';
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
    $Self->{Translation}->{'Overview.'} = '概況';
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
