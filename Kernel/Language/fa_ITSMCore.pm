# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fa_ITSMCore;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMCore
    $Self->{Translation}->{'Alternative to'} = 'جایگزینی برای';
    $Self->{Translation}->{'Availability'} = 'میزان در دسترس بودن';
    $Self->{Translation}->{'Back End'} = 'پشت صحنه';
    $Self->{Translation}->{'Connected to'} = 'متصل است به';
    $Self->{Translation}->{'Current State'} = 'وضعیت جاری';
    $Self->{Translation}->{'Demonstration'} = 'نمایش';
    $Self->{Translation}->{'Depends on'} = 'وابسته است به';
    $Self->{Translation}->{'End User Service'} = 'سرویس کاربر نهایی';
    $Self->{Translation}->{'Errors'} = 'خطاها';
    $Self->{Translation}->{'Front End'} = 'جلو صحنه';
    $Self->{Translation}->{'IT Management'} = 'مدیریت IT';
    $Self->{Translation}->{'IT Operational'} = 'عملیات IT';
    $Self->{Translation}->{'Impact'} = 'اثر';
    $Self->{Translation}->{'Incident State'} = 'وضعیت رخداد';
    $Self->{Translation}->{'Includes'} = 'مشتمل است بر';
    $Self->{Translation}->{'Other'} = 'بقیه';
    $Self->{Translation}->{'Part of'} = 'بخشی از';
    $Self->{Translation}->{'Project'} = 'پروژه';
    $Self->{Translation}->{'Recovery Time'} = 'زمان بهبود';
    $Self->{Translation}->{'Relevant to'} = 'مرتبط با';
    $Self->{Translation}->{'Reporting'} = 'گزارشی';
    $Self->{Translation}->{'Required for'} = 'مورد نیاز است برای';
    $Self->{Translation}->{'Resolution Rate'} = 'نرخ حل مسئله';
    $Self->{Translation}->{'Response Time'} = 'زمان پاسخگویی';
    $Self->{Translation}->{'SLA Overview'} = 'خلاصه SLA';
    $Self->{Translation}->{'Service Overview'} = 'خلاصه سرویس';
    $Self->{Translation}->{'Service-Area'} = 'بخش سرویس';
    $Self->{Translation}->{'Training'} = 'آموزشی';
    $Self->{Translation}->{'Transactions'} = 'تراکنش‌ها';
    $Self->{Translation}->{'Underpinning Contract'} = 'قرارداد آماده چاپ';
    $Self->{Translation}->{'allocation'} = 'اختصاص';

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'اهمیت <-> اثر <-> اولویت';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality <-> Impact.'} =
        'مدیریت الویت ناشی از ترکیب اهمیت <-> اثر';
    $Self->{Translation}->{'Priority allocation'} = 'تخصیص الویت';

    # Template: AdminSLA
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'حداقل زمان بین دو رخداد';

    # Template: AdminService
    $Self->{Translation}->{'Criticality'} = 'اهمیت';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = 'اطلاعات SLA';
    $Self->{Translation}->{'Last changed'} = 'آخرین تغییر';
    $Self->{Translation}->{'Last changed by'} = 'آخرین تغییر توسط';
    $Self->{Translation}->{'Associated Services'} = 'سرویس‌های مرتبط';

    # Template: AgentITSMServiceZoom
    $Self->{Translation}->{'Service Information'} = 'اطلاعات سرویس';
    $Self->{Translation}->{'Current incident state'} = 'وضعیت کنونی رخداد';
    $Self->{Translation}->{'Associated SLAs'} = 'SLAهای مرتبط';

    # Perl Module: Kernel/Modules/AgentITSMServicePrint.pm
    $Self->{Translation}->{'Current Incident State'} = 'وضعیت جاری رخداد';

    # SysConfig
    $Self->{Translation}->{'Both'} = '';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked Services widget (LinkObject::ViewMode = "complex"). Note: Only Service attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the AdminITSMCIPAllocate configuration in the admin area.'} =
        'ثبت ماژول برای پیکربندی AdminITSMCIPAllocate در بخش مدیریت';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} =
        'ثبت ماژول برای پیکربندی آبجکت AgentITSMSLA در واسط کاربری کارشناس';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} =
        'ثبت ماژول برای پیکربندی آبجکت AgentITSMSLAPrint در واسط کاربری کارشناس';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} =
        'ثبت ماژول برای پیکربندی آبجکت AgentITSMSLAZoom در واسط کاربری کارشناس';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMService object in the agent interface.'} =
        'ثبت ماژول برای پیکربندی آبجکت AgentITSMService در واسط کاربری کارشناس';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} =
        'ثبت ماژول برای پیکربندی آبجکت AgentITSMServicePrint در واسط کاربری کارشناس';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} =
        'ثبت ماژول برای پیکربندی آبجکت AgentITSMServiceZoom در واسط کاربری کارشناس';
    $Self->{Translation}->{'ITSM SLA Overview.'} = '';
    $Self->{Translation}->{'ITSM Service Overview.'} = '';
    $Self->{Translation}->{'Incident'} = '';
    $Self->{Translation}->{'Incident State Type'} = '';
    $Self->{Translation}->{'Incident State Type.'} = '';
    $Self->{Translation}->{'Manage priority matrix.'} = 'مدیریت ماتریس الویت';
    $Self->{Translation}->{'Module to show back link in service menu.'} = 'ماژولی برای نمایش لینک بازگشت در منوی سرویس';
    $Self->{Translation}->{'Module to show back link in sla menu.'} = 'ماژولی برای نمایش لینک بازگشت در منوی SLA';
    $Self->{Translation}->{'Module to show print link in service menu.'} = 'ماژولی برای نمایش لینک چاپ در منوی سرویس';
    $Self->{Translation}->{'Module to show print link in sla menu.'} = 'ماژولی برای نمایش لینک چاپ در منوی SLA';
    $Self->{Translation}->{'Module to show the link link in service menu.'} = '';
    $Self->{Translation}->{'Operational'} = 'عملیاتی';
    $Self->{Translation}->{'Parameters for the incident states in the preference view.'} = 'پارامترهایی برای وضعیت‌های رخداد در نمای تنظیمات شخصی';
    $Self->{Translation}->{'SLA Print.'} = '';
    $Self->{Translation}->{'SLA Zoom.'} = '';
    $Self->{Translation}->{'Service Print.'} = '';
    $Self->{Translation}->{'Service Zoom.'} = '';
    $Self->{Translation}->{'Set the type and direction of links to be used to calculate the incident state. The key is the name of the link type (as defined in LinkObject::Type), and the value is the direction of the IncidentLinkType that should be followed to calculate the incident state. For example if the IncidentLinkType is set to \'DependsOn\', and the Direction is \'Source\', only \'Depends on\' links will be followed (and not the opposite link \'Required for\') to calculate the incident state. You can add more link types ad directions as you like, e.g. \'Includes\' with the direction \'Target\'. All link types defined in the sysconfig options LinkObject::Type are possible and the direction can be \'Source\', \'Target\', or \'Both\'. IMPORTANT: AFTER YOU MAKE CHANGES TO THIS SYSCONFIG OPTION YOU NEED TO RUN THE SCRIPT bin/otrs.ITSMConfigItemIncidentStateRecalculate.pl SO THAT ALL INCIDENT STATES WILL BE RECALCULATED BASED ON THE NEW SETTINGS!'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMChange\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'AlternativeTo\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'RelevantTo\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'AlternativeTo\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'DependsOn\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'RelevantTo\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'AlternativeTo\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'ConnectedTo\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'Includes\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'RelevantTo\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'Normal\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'Normal\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines the link type \'AlternativeTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        '';
    $Self->{Translation}->{'This setting defines the link type \'ConnectedTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        '';
    $Self->{Translation}->{'This setting defines the link type \'DependsOn\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        '';
    $Self->{Translation}->{'This setting defines the link type \'Includes\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        '';
    $Self->{Translation}->{'This setting defines the link type \'RelevantTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        '';
    $Self->{Translation}->{'Width of ITSM textareas.'} = 'اندازه عرض کنترل‌های ورود متن ITSM';

}

1;
