# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Computer'} = '计算机';
    $Self->{Translation}->{'Hardware'} = '硬件';
    $Self->{Translation}->{'Network'} = '网络';
    $Self->{Translation}->{'Software'} = '软件';
    $Self->{Translation}->{'Address'} = '地址';
    $Self->{Translation}->{'Admin Tool'} = '管理工具';
    $Self->{Translation}->{'Backup Device'} = '备份设备';
    $Self->{Translation}->{'Beamer'} = '投影仪';
    $Self->{Translation}->{'Building'} = '大厦';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = '配置项历史::配置项创建';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = '配置项历史::配置项删除';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = '配置项历史::定义更新';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = '配置项历史::配置状态更新';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = '配置项历史::事件状态更新';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = '配置项历史::建立关系';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = '配置项历史::删除关系';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = '配置项历史::名称更新';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = '配置项历史::配置项值更新';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = '配置项历史::创建版本';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = '配置项历史::删除版本';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = '配置项历史::增加附件';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = '配置项历史::删除附件';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = '照相机';
    $Self->{Translation}->{'Capacity'} = '容量';
    $Self->{Translation}->{'Change Definition'} = '修改定义';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = '修改定义失败!详细信息请参考系统日志.';
    $Self->{Translation}->{'Client Application'} = '客户端应用程序';
    $Self->{Translation}->{'Client OS'} = '客户操作系统';
    $Self->{Translation}->{'Config Item-Area'} = '配置项区域';
    $Self->{Translation}->{'Config Items available'} = '有效的配置项';
    $Self->{Translation}->{'Config Items shown'} = '显示配置项';
    $Self->{Translation}->{'CMDB'} = '配置管理数据库';
    $Self->{Translation}->{'Demo'} = '演示';
    $Self->{Translation}->{'Desktop'} = '台式电脑';
    $Self->{Translation}->{'Developer Licence'} = '开发许可';
    $Self->{Translation}->{'Docking Station'} = '坞站';
    $Self->{Translation}->{'Duplicate'} = '复制';
    $Self->{Translation}->{'Embedded'} = '嵌入式';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '空字段表示保持当前值';
    $Self->{Translation}->{'Enterprise Licence'} = '企业许可';
    $Self->{Translation}->{'Expiration Date'} = '过期日期';
    $Self->{Translation}->{'Expired'} = '已过期';
    $Self->{Translation}->{'Floor'} = '楼层';
    $Self->{Translation}->{'Freeware'} = '免费软件';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = '网关';
    $Self->{Translation}->{'Graphic Adapter'} = '显卡';
    $Self->{Translation}->{'Hard Disk'} = '硬盘';
    $Self->{Translation}->{'Hard Disk::Capacity'} = '硬盘::容量';
    $Self->{Translation}->{'Hide Versions'} = '隐藏版本';
    $Self->{Translation}->{'IP Address'} = 'IP地址';
    $Self->{Translation}->{'IP over DHCP'} = '从DHCP获取IP';
    $Self->{Translation}->{'IT Facility'} = 'IT设施';
    $Self->{Translation}->{'Incident'} = '故障';
    $Self->{Translation}->{'Install Date'} = '安装日期';
    $Self->{Translation}->{'Keyboard'} = '键盘';
    $Self->{Translation}->{'LAN'} = '局域网';
    $Self->{Translation}->{'Laptop'} = '笔记本';
    $Self->{Translation}->{'Last Change'} = '最后修改于';
    $Self->{Translation}->{'Licence Key'} = '许可密钥';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = '许可密钥::有效期';
    $Self->{Translation}->{'Licence Key::Quantity'} = '许可密钥::数量';
    $Self->{Translation}->{'Licence Type'} = '许可类别';
    $Self->{Translation}->{'Maintenance'} = '维护';
    $Self->{Translation}->{'Maximum number of one element'} = '单个元素的最大数量';
    $Self->{Translation}->{'Media'} = '介质';
    $Self->{Translation}->{'Middleware'} = '中间件';
    $Self->{Translation}->{'Model'} = '型号';
    $Self->{Translation}->{'Modem'} = '调解调器';
    $Self->{Translation}->{'Monitor'} = '显示器';
    $Self->{Translation}->{'Mouse'} = '鼠标';
    $Self->{Translation}->{'Network Adapter'} = '网卡';
    $Self->{Translation}->{'Network Adapter::IP Address'} = '网卡::IP地址';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = '网卡::从DHCP获取IP';
    $Self->{Translation}->{'Network Address'} = '网络地址';
    $Self->{Translation}->{'Network Address::Gateway'} = '网络地址::网关';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = '网络地址::子网掩码';
    $Self->{Translation}->{'Open Source'} = '开源';
    $Self->{Translation}->{'Operational'} = '正常';
    $Self->{Translation}->{'Other'} = '其它';
    $Self->{Translation}->{'Other Equipment'} = '其它设备';
    $Self->{Translation}->{'Outlet'} = '插座';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA卡';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = '每个节点';
    $Self->{Translation}->{'Per Processor'} = '每个处理器';
    $Self->{Translation}->{'Per Server'} = '每个服务器';
    $Self->{Translation}->{'Per User'} = '每个用户';
    $Self->{Translation}->{'Phone 1'} = '电话1';
    $Self->{Translation}->{'Phone 2'} = '电话2';
    $Self->{Translation}->{'Pilot'} = '试验';
    $Self->{Translation}->{'Planned'} = '已计划';
    $Self->{Translation}->{'Printer'} = '打印机';
    $Self->{Translation}->{'Production'} = '生产';
    $Self->{Translation}->{'Quantity'} = '数量';
    $Self->{Translation}->{'Rack'} = '机架';
    $Self->{Translation}->{'Ram'} = '内存';
    $Self->{Translation}->{'Repair'} = '修复';
    $Self->{Translation}->{'Retired'} = '报废';
    $Self->{Translation}->{'Review'} = '复审';
    $Self->{Translation}->{'Room'} = '房间';
    $Self->{Translation}->{'Router'} = '路由器';
    $Self->{Translation}->{'Scanner'} = '扫描仪';
    $Self->{Translation}->{'Search Config Items'} = '搜索配置项';
    $Self->{Translation}->{'Security Device'} = '安全设备';
    $Self->{Translation}->{'Serial Number'} = '序列号';
    $Self->{Translation}->{'Server'} = '服务器';
    $Self->{Translation}->{'Server Application'} = '服务器应用程序';
    $Self->{Translation}->{'Server OS'} = '服务器操作系统';
    $Self->{Translation}->{'Show Versions'} = '显示版本';
    $Self->{Translation}->{'Single Licence'} = '单一许可';
    $Self->{Translation}->{'Subnet Mask'} = '子网掩码';
    $Self->{Translation}->{'Switch'} = '交换机';
    $Self->{Translation}->{'Telco'} = '电话公司';
    $Self->{Translation}->{'Test/QA'} = '测试/品质保证';
    $Self->{Translation}->{'The deployment state of this config item'} = '配置项部署状态';
    $Self->{Translation}->{'The incident state of this config item'} = '配置项故障状态';
    $Self->{Translation}->{'Time Restricted'} = '时间限制';
    $Self->{Translation}->{'USB Device'} = 'USB 设备';
    $Self->{Translation}->{'Unlimited'} = '无限制的';
    $Self->{Translation}->{'User Tool'} = '用户工具';
    $Self->{Translation}->{'Volume Licence'} = '批量授权';
    $Self->{Translation}->{'WLAN'} = '无线网络';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN 无线访问点';
    $Self->{Translation}->{'Warranty Expiration Date'} = '保修过期日期';
    $Self->{Translation}->{'Workplace'} = '工作间';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = '管理配置项';
    $Self->{Translation}->{'Change class definition'} = '修改类定义';
    $Self->{Translation}->{'Config Item Class'} = '配置项类';
    $Self->{Translation}->{'Definition'} = '定义';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = '配置项';
    $Self->{Translation}->{'Filter for Classes'} = '类过滤器';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '先从列表中选择类，然后创建新的配置项。';
    $Self->{Translation}->{'Class'} = '类';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM 配置项 批量操作';
    $Self->{Translation}->{'Deployment state'} = '部署状态';
    $Self->{Translation}->{'Incident state'} = '事件状态';
    $Self->{Translation}->{'Link to another'} = '链接到其他';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = '无效的配置项编号！';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = '将要链接的另外一个配置项编号。';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '你真的想要删除这个配置项吗?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = '为这个配置项命名';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '编号为(s):%s的配置项已经使用了此名字';
    $Self->{Translation}->{'Deployment State'} = '部署状态';
    $Self->{Translation}->{'Incident State'} = '故障状态';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '配置项：%s 的历史信息';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '上下文设置';
    $Self->{Translation}->{'Config Items per page'} = '每页配置项个数';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '一个通用的ITSM配置项表格';
    $Self->{Translation}->{'Deployment State Type'} = '部署状态类型';
    $Self->{Translation}->{'Current Incident State'} = '当前的故障状态';
    $Self->{Translation}->{'Current Incident State Type'} = '当前的故障状态类型';
    $Self->{Translation}->{'Last changed'} = '最后修改';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = '创建新模板';
    $Self->{Translation}->{'Run Search'} = '搜索';
    $Self->{Translation}->{'Also search in previous versions?'} = '同时搜索以前的版本吗?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '配置项';
    $Self->{Translation}->{'Configuration Item Information'} = '配置项信息';
    $Self->{Translation}->{'Current Deployment State'} = '当前的部署状态';
    $Self->{Translation}->{'Last changed by'} = '最后修改人';
    $Self->{Translation}->{'Ok'} = '确定';
    $Self->{Translation}->{'Show one version'} = '显示一个版本';
    $Self->{Translation}->{'Show all versions'} = '显示所有版本';
    $Self->{Translation}->{'Version Incident State'} = '版本故障状态';
    $Self->{Translation}->{'Version Deployment State'} = '版本部署状态';
    $Self->{Translation}->{'Version Number'} = '版本号';
    $Self->{Translation}->{'Configuration Item Version Details'} = '配置项版本详情';
    $Self->{Translation}->{'Property'} = '属性';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = 'ITSM配置项';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = '配置项历史::';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = '配置项';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = '无结果！';
    $Self->{Translation}->{'Config Item Search Results'} = '配置项搜索结果';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = '系统管理。';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '检查是否为唯一名称的范围是仅在\'class\'（配置项类）内还是\'global\'(全局)，就是在查找重复配置项名称时的范围。';
    $Self->{Translation}->{'Config Items'} = '配置项';
    $Self->{Translation}->{'Config item add.'} = '添加配置项。';
    $Self->{Translation}->{'Config item edit.'} = '编辑配置项。';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '服务人员界面用于记录配置项事件到历史的模块。';
    $Self->{Translation}->{'Config item history.'} = '配置项历史。';
    $Self->{Translation}->{'Config item print.'} = '打印配置项。';
    $Self->{Translation}->{'Config item zoom.'} = '配置项详情。';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = '配置项限制';
    $Self->{Translation}->{'Configuration Item limit per page'} = '每页配置项限制';
    $Self->{Translation}->{'Configuration Management Database.'} = '配置管理数据库。';
    $Self->{Translation}->{'Configuration item bulk module.'} = '配置项批处理模块。';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '服务人员界面的配置项搜索后端路由。';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '创建和管理配置项定义';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '定义链接对象小部件(LinkObject::ViewMode = \"complex\")设置按钮中的操作。请注意，这些操作必须已经在以下JS和CSS文件中注册：Core.AllocationList.css、Core.UI.AllocationList.js、 Core.UI.Table.Sort.js、Core.Agent.TableFilters.js和Core.Agent.LinkObject.js。';
    $Self->{Translation}->{'Define the group with permissions.'} = '定义有权限的组。';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        '定义使用通用接口创建ITSM配置项所需的权限。';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        '定义使用通用接口删除ITSM配置项所需的权限。';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        '定义使用通用接口获取ITSM配置项所需的权限。';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        '定义使用通用接口搜索ITSM配置项所需的权限。';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        '定义使用通用接口更新ITSM配置项所需的权限。';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        '定义显示配置项列表简洁视图的概览模块。';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '为每个配置项类定义独立的正则表达式，以检查配置项名称并显示相应的错误消息。';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        '定义\'ITSMConfigItem\'类的默认子对象。';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        '定义在系统管理面板中修改配置项定义的编辑器的行数。';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        '定义故障状态从高（如紧急）到低（如正常）的顺序。';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        '定义关联的部署状态，即链接的工单可以影响配置项状态的情况。';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        '定义AgentITSMConfigItem（服务人员配置项）窗口的搜索限制';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        '定义AgentITSMConfigItemSearch（服务人员配置项搜索）窗口的搜索限制';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        '定义配置项概览显示的字段。这个选项不会影响字段的位置。注意：如果选择“全部”，则“Class（类）”字段总是会显示。';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        '定义配置项搜索中显示的字段。这个选项不会影响字段的位置。';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '定义配置项概览视图中按配置项类分类显示的字段。每个条目均需以类名为前缀再加上双冒号（如计算机::）。有一些配置项属性是所有配置项都有的（例如，对于计算机类：计算机::名称、计算机::CurDeplState当前部署状态、计算机::CreateTime创建时间）。要显示在配置项定义中定义的独特的配置项属性，必须使用下面的方案（例如：对于计算机类：计算机::硬盘::1、计算机::硬盘::容量::1、计算机::硬盘::2、计算机::硬盘::2计算机::硬盘::2）。如果一个配置项类没有条目存在，则使用在ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns中设置的默认字段。';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '定义按配置项类分类的配置项搜索结果中显示的字段。每个条目均需以类名为前缀再加上双冒号（如计算机::）。有一些配置项属性是所有配置项都有的（例如，对于计算机类：计算机::名称、计算机::CurDeplState当前部署状态、计算机::CreateTime创建时间）。要显示在配置项定义中定义的独特的配置项属性，必须使用下面的方案（例如：对于计算机类：计算机::硬盘::1、计算机::硬盘::容量::1、计算机::硬盘::2、计算机::硬盘::2计算机::硬盘::2）。如果一个配置项类没有条目存在，则使用在ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns中设置的默认字段。';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        '定义链接表复合视图中按配置项类分类显示的字段。每个条目均需以类名为前缀再加上双冒号（如计算机::）。有一些配置项属性是所有配置项都有的（例如，对于计算机类：计算机::名称、计算机::CurDeplState当前部署状态、计算机::CreateTime创建时间）。要显示在配置项定义中定义的独特的配置项属性，必须使用下面的方案（例如：对于计算机类：计算机::硬盘::1、计算机::硬盘::容量::1、计算机::硬盘::2、计算机::硬盘::2计算机::硬盘::2）。如果一个配置项类没有条目存在，则使用在ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns中设置的默认字段。';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '定义哪一类(从工单角度命名的)链接可以影响一个链接的配置项的状态。';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '定义哪一类工单可以影响一个链接的配置项的状态。';
    $Self->{Translation}->{'Deployment State Color'} = '部署状态的颜色';
    $Self->{Translation}->{'Deployment State Color.'} = '部署状态的颜色。';
    $Self->{Translation}->{'Deployment State Type.'} = '部署状态类型。';
    $Self->{Translation}->{'Disabled'} = '已禁用';
    $Self->{Translation}->{'Enabled'} = '已启用';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        '在服务人员界面启用配置项批量操作功能，可以一次处理多个配置项。';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        '只有列表中的组才有权限使用配置项批量操作功能。';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '启用/禁用检查配置项唯一名称功能。在启用这个选项前，您应该检查系统中是否已经存在重名的配置项，您可以使用这个脚本来检查重名情况：bin/otrs.ITSMConfigItemListDuplicates.pl。';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '在工单-配置项的链接中设置配置项-状态的事件模块。';
    $Self->{Translation}->{'ITSM config item overview.'} = 'ITSM配置项概览。';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '用于检查配置项类的组权限的模块。';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        '用于检查配置项的组权限的模块。';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = '用于生成ITSM配置项统计的模块';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        '用于导入/导出模块的对象后端模块注册。';
    $Self->{Translation}->{'Overview.'} = '概览。';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        '服务人员界面偏好设置视图中用于部署状态颜色的参数。';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        '服务人员界面偏好设置视图中用于部署状态的参数。';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        '目录属性样例-权限组的参数。';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        '显示配置项的页面参数。';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        '服务人员界面使用ITSM配置项窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        '服务人员界面使用ITSM配置项搜索窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        '服务人员界面使用ITSM配置项详情窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        '服务人员界面使用添加ITSM配置项窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        '服务人员界面使用编辑ITSM配置项窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        '服务人员界面使用ITSM配置项历史窗口需要的权限。';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        '服务人员界面使用ITSM配置项打印窗口需要的权限。';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '删除配置项所需的权限。';
    $Self->{Translation}->{'Search config items.'} = '搜索配置项。';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        '选择配置项号码生成器模块。“AutoIncrement自动增量”使用系统ID、配置项类ID和计数器来增加配置项号，格式为：系统ID.配置项类ID.计数器，如1205000004、1205000005。';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '当一个工单链接到一个配置项时自动设置这个配置项的故障状态。';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        '在服务人员界面配置项批量操作窗口设置部署状态。';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        '在服务人员界面配置项批量操作窗口设置事件状态。';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个允许链接配置项到另一对象的链接。';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        '在服务人员界面配置项概览视图中，在菜单中显示一个允许访问配置项历史的链接。';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个允许访问配置项历史的链接。';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个删除配置项的链接。';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        '在服务人员界面配置项概览视图中，在菜单中显示一个复制配置项的链接。';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个复制配置项的链接。';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个编辑配置项的链接。';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个返回链接。';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        '在服务人员界面配置项详情视图中，在菜单中显示一个打印配置项的链接。';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        '在服务人员界面配置项概览视图中，在菜单中显示一个查看配置项详情的链接。';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        '在服务人员界面显示配置项历史（倒序）。';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '配置项标识符，如ConfigItem#、MyConfigItem#，默认是ConfigItem#。';
    $Self->{Translation}->{'class'} = '类';
    $Self->{Translation}->{'global'} = '全局';

}

1;
