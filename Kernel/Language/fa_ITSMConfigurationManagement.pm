# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fa_ITSMConfigurationManagement;

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
    $Self->{Translation}->{'Address'} = 'نشانی';
    $Self->{Translation}->{'Admin Tool'} = 'ابزار مدیریتی';
    $Self->{Translation}->{'Backup Device'} = 'وسایل پشتیبان‌گیری';
    $Self->{Translation}->{'Beamer'} = 'پرتو افکن';
    $Self->{Translation}->{'Building'} = 'ساختمان';
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
    $Self->{Translation}->{'CPU'} = 'سی‌پی‌یو';
    $Self->{Translation}->{'Camera'} = 'دوربین';
    $Self->{Translation}->{'Capacity'} = 'ظرفیت';
    $Self->{Translation}->{'Change Definition'} = 'تغییر تعریف';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'عملیات تغییر تعریف ناموفق بود. برای کسب اطلاع بیشتر log سیستم را ببینید.';
    $Self->{Translation}->{'Client Application'} = 'برنامه‌های کلاینت';
    $Self->{Translation}->{'Client OS'} = 'سیستم عامل کلاینت';
    $Self->{Translation}->{'Config Item-Area'} = 'محدوده CI';
    $Self->{Translation}->{'Config Items available'} = 'CIهای در دسترس';
    $Self->{Translation}->{'Config Items shown'} = 'CIهای نمایش داده شده';
    $Self->{Translation}->{'CMDB'} = '';
    $Self->{Translation}->{'Demo'} = 'نسخه نمایشی';
    $Self->{Translation}->{'Desktop'} = 'رومیزی';
    $Self->{Translation}->{'Developer Licence'} = 'اجازه‌نامه توسعه دهنده';
    $Self->{Translation}->{'Docking Station'} = 'ایستگاه اتصال';
    $Self->{Translation}->{'Duplicate'} = 'تکثیر';
    $Self->{Translation}->{'Embedded'} = 'داخلی';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'فیلدهای خالی مشخص می‌کند که مقادیر کنونی باقی خواهند ماند';
    $Self->{Translation}->{'Enterprise Licence'} = 'اجازه‌نامه سازمانی';
    $Self->{Translation}->{'Expiration Date'} = 'تاریخ انقضا';
    $Self->{Translation}->{'Expired'} = 'منقضی شده';
    $Self->{Translation}->{'Floor'} = 'طبقه';
    $Self->{Translation}->{'Freeware'} = 'نرم افزار مجانی';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Gateway';
    $Self->{Translation}->{'Graphic Adapter'} = 'کارت گرافیک';
    $Self->{Translation}->{'Hard Disk'} = 'هارد دیسک';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'هارد دیسک::ظرفیت';
    $Self->{Translation}->{'Hide Versions'} = 'ویرایش‌ها را مخفی کن';
    $Self->{Translation}->{'IP Address'} = 'آدرس IP';
    $Self->{Translation}->{'IP over DHCP'} = 'IP از طریق DHCP';
    $Self->{Translation}->{'IT Facility'} = 'تسهیلات IT';
    $Self->{Translation}->{'Incident'} = '';
    $Self->{Translation}->{'Install Date'} = 'تاریخ نصب';
    $Self->{Translation}->{'Keyboard'} = 'صفحه کلید';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'کیفی';
    $Self->{Translation}->{'Last Change'} = 'آخرین تغییر';
    $Self->{Translation}->{'Licence Key'} = 'کلید اجازه‌نامه';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'کلید اجازه‌نامه::تاریخ انقضا';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'کلید اجازه‌نامه::تعداد';
    $Self->{Translation}->{'Licence Type'} = 'نوع اجازه‌نامه';
    $Self->{Translation}->{'Maintenance'} = 'پشتیبانی و نگهداری';
    $Self->{Translation}->{'Maximum number of one element'} = 'حداکثر شماره یک عنصر';
    $Self->{Translation}->{'Media'} = 'رسانه';
    $Self->{Translation}->{'Middleware'} = 'میان افزار';
    $Self->{Translation}->{'Model'} = 'مدل';
    $Self->{Translation}->{'Modem'} = 'مودم';
    $Self->{Translation}->{'Monitor'} = 'صفحه نمایش';
    $Self->{Translation}->{'Mouse'} = 'ماوس';
    $Self->{Translation}->{'Network Adapter'} = 'کارت شبکه';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'کارت شبکه::آدرس IP';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'کارت شبکه::IP از طریق DHCP';
    $Self->{Translation}->{'Network Address'} = 'آدرس شبکه';
    $Self->{Translation}->{'Network Address::Gateway'} = 'آدرس شبکه::Gateway';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'آدرس شبکه::Subnet Mask';
    $Self->{Translation}->{'Open Source'} = 'کد باز';
    $Self->{Translation}->{'Operational'} = 'عملیاتی';
    $Self->{Translation}->{'Other'} = 'غیره';
    $Self->{Translation}->{'Other Equipment'} = 'تجهیزات متفرقه';
    $Self->{Translation}->{'Outlet'} = 'پریز';
    $Self->{Translation}->{'PCMCIA Card'} = 'کارت PCMCIA';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'به ازای کامپیوتر';
    $Self->{Translation}->{'Per Processor'} = 'به ازای پردازشگر';
    $Self->{Translation}->{'Per Server'} = 'به ازای سرور';
    $Self->{Translation}->{'Per User'} = 'به ازای کاربر';
    $Self->{Translation}->{'Phone 1'} = 'تلفن ۱';
    $Self->{Translation}->{'Phone 2'} = 'تلفن ۲';
    $Self->{Translation}->{'Pilot'} = 'نمونه آزمایشی';
    $Self->{Translation}->{'Planned'} = 'برنامه ریزی شده';
    $Self->{Translation}->{'Printer'} = 'چاپگر';
    $Self->{Translation}->{'Production'} = 'در حال تولید';
    $Self->{Translation}->{'Quantity'} = 'تعداد';
    $Self->{Translation}->{'Rack'} = 'قفسه';
    $Self->{Translation}->{'Ram'} = 'رم';
    $Self->{Translation}->{'Repair'} = 'تعمیر';
    $Self->{Translation}->{'Retired'} = 'بازنشسته شده';
    $Self->{Translation}->{'Review'} = 'بازبینی';
    $Self->{Translation}->{'Room'} = 'اتاق';
    $Self->{Translation}->{'Router'} = 'مسیریاب';
    $Self->{Translation}->{'Scanner'} = 'اسکنر';
    $Self->{Translation}->{'Search Config Items'} = 'جستجوی آیتم‌های پیکربندی';
    $Self->{Translation}->{'Security Device'} = 'وسایل امنیتی';
    $Self->{Translation}->{'Serial Number'} = 'شماره سریال';
    $Self->{Translation}->{'Server'} = 'سرور';
    $Self->{Translation}->{'Server Application'} = 'نرم افزار سرور';
    $Self->{Translation}->{'Server OS'} = 'سیستم عامل سرور';
    $Self->{Translation}->{'Show Versions'} = 'ویرایش‌ها را نمایش بده';
    $Self->{Translation}->{'Single Licence'} = 'اجازه‌نامه تکی';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnet Mask';
    $Self->{Translation}->{'Switch'} = 'سویچ';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'Test/QA'} = 'تست/تضمین کیفیت';
    $Self->{Translation}->{'The deployment state of this config item'} = 'وضعیت نصب این CI';
    $Self->{Translation}->{'The incident state of this config item'} = 'وضعیت رخداد این CI';
    $Self->{Translation}->{'Time Restricted'} = 'دارای محدوده زمانی';
    $Self->{Translation}->{'USB Device'} = 'تجهیزات USB';
    $Self->{Translation}->{'Unlimited'} = 'نامحدود';
    $Self->{Translation}->{'User Tool'} = 'ابزار کاربر';
    $Self->{Translation}->{'Volume Licence'} = 'اجازه‌نامه حجمی';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'نقاط دسترسی WLAN';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'تاریخ انقضای ضمانت‌نامه';
    $Self->{Translation}->{'Workplace'} = 'محل کار';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'مدیریت CI';
    $Self->{Translation}->{'Change class definition'} = 'تغییر تعریف کلاس';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'تعریف';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'آیتم پیکربندی';
    $Self->{Translation}->{'Filter for Classes'} = 'فیلتر برای کلاس‌ها';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'کلاسی را برای ساخت یک آیتم پبکربندی جدید انتخا کنید.';
    $Self->{Translation}->{'Class'} = 'کلاس';

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
    $Self->{Translation}->{'The name of this config item'} = 'نام این آیتم‌های پیکربندی';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        '';
    $Self->{Translation}->{'Deployment State'} = 'وضعیت نصب';
    $Self->{Translation}->{'Incident State'} = 'وضعیت رخداد';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'تنظیمات مفاد';
    $Self->{Translation}->{'Config Items per page'} = 'تعداد آیتم‌های پیکربندی در هر صفحه';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = 'نوع وضعیت نصب';
    $Self->{Translation}->{'Current Incident State'} = 'وضعیت جاری رخداد';
    $Self->{Translation}->{'Current Incident State Type'} = 'نوع وضعیت جاری رخداد';
    $Self->{Translation}->{'Last changed'} = 'آخرین تغییر';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = 'ساختن قالب جدید';
    $Self->{Translation}->{'Run Search'} = '';
    $Self->{Translation}->{'Also search in previous versions?'} = 'در ویرایش‌های قبلی هم جستجو انجام شود؟';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'آیتم پیکربندی';
    $Self->{Translation}->{'Configuration Item Information'} = '';
    $Self->{Translation}->{'Current Deployment State'} = 'وضعیت فعلی نصب';
    $Self->{Translation}->{'Last changed by'} = 'آخرین تغییر به وسیله';
    $Self->{Translation}->{'Ok'} = 'تایید';
    $Self->{Translation}->{'Show one version'} = 'نمایش یک نسخه';
    $Self->{Translation}->{'Show all versions'} = 'نمایش تمام نسخه‌ها';
    $Self->{Translation}->{'Version Incident State'} = 'وضعیت رخداد نسخه';
    $Self->{Translation}->{'Version Deployment State'} = '';
    $Self->{Translation}->{'Version Number'} = 'شماره نسخه';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'جزئیات نسخه آیتم پیکربندی';
    $Self->{Translation}->{'Property'} = 'ویژگی';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = 'آیتم پیکربندی';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = '';
    $Self->{Translation}->{'Config Item Search Results'} = '';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'مدیر';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = '';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'ماژول رویداد آیتم پیکربندی که ثبت وقایع در تاریخچه را در واسط کاربری کارشناس فعال می‌سازد.';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'محدودیت آیتم پیکربندی';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'محدودیت آیتم پیکربندی در هر صفحه';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'ساخت و مدیریت تعاریف آیتم‌های پیکربندی';
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
        'پارامترهایی برای گروه‌های دسترسی نمونه مربوط به ویژگی‌های فهرست عمومی';
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
