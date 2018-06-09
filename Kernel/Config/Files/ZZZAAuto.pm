# OTRS config file (automatically generated)
# VERSION:1.1
package Kernel::Config::Files::ZZZAAuto;
use strict;
use warnings;
no warnings 'redefine';
use utf8;
sub Load {
    my ($File, $Self) = @_;
$Self->{'Package::RepositoryList'} =  {
  'http://ftp.otrs.org/pub/otrs/itsm/bundle5/' => 'OTRS::ITSM 5 Bundle Master'
};
$Self->{'Ticket::Service'} =  '1';
$Self->{'ACLKeysLevel3::Actions'}->{'100-Default-ITSM'} =  [
  'AgentTicketAddtlITSMField',
  'AgentTicketDecision'
];
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'ShowIncidentState'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'ShowIncidentState'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'ShowIncidentState'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'ShowIncidentState'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'ShowIncidentState'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'ShowIncidentState'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'ShowIncidentState'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'ShowIncidentState'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'ShowIncidentState'} =  '1';
$Self->{'Stats::DynamicObjectRegistration'}->{'ITSMTicketSolutionTimeAverage'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::ITSMTicketSolutionTimeAverage'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'ITSMTicketFirstLevelSolutionRate'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::ITSMTicketFirstLevelSolutionRate'
};
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'ShowIncidentState'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'HistoryComment'} =  '%%Note';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'DynamicField'} =  {
  'ITSMDecisionDate' => '1',
  'ITSMDecisionResult' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'Title'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'ArticleTypes'} =  {
  'note-external' => '1',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'Body'} =  '[% Translate("Reason") | html %]:';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'Subject'} =  '[% Translate("Decision") | html %]';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'NoteMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'Queue'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketDecision'}->{'Permission'} =  'rw';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'ShowIncidentState'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'HistoryComment'} =  '%%FreeText';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'DynamicField'} =  {
  'ITSMDueDate' => '1',
  'ITSMRecoveryStartTime' => '1',
  'ITSMRepairStartTime' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'Title'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'ArticleTypes'} =  {
  'note-external' => '1',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'Subject'} =  '[% Translate("Note") | html %]';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'NoteMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'Note'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'Queue'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketAddtlITSMField'}->{'Permission'} =  'rw';
$Self->{'Ticket::Frontend::MenuModule'}->{'420-Decision'} =  {
  'Action' => 'AgentTicketDecision',
  'Description' => 'Add a decision!',
  'Link' => 'Action=AgentTicketDecision;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Decision',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'315-AddtlITSMField'} =  {
  'Action' => 'AgentTicketAddtlITSMField',
  'Description' => 'Change the ITSM fields!',
  'Link' => 'Action=AgentTicketAddtlITSMField;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Additional ITSM Fields',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Frontend::Module'}->{'AgentTicketDecision'} =  {
  'Description' => 'Ticket decision.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Decision'
};
$Self->{'Frontend::Module'}->{'AgentTicketAddtlITSMField'} =  {
  'Description' => 'Additional ITSM ticket fields.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Additional ITSM Fields'
};
$Self->{'LinkObject::ComplexTable'}->{'Service'} =  {
  'DefaultColumns' => {
    'ChangeTime' => '1',
    'Comment' => '1',
    'CreateTime' => '1',
    'Criticality' => '2',
    'CurInciState' => '2',
    'Type' => '2'
  },
  'Module' => 'Kernel::Output::HTML::LinkObject::Service.pm',
  'Priority' => {
    'ChangeTime' => '160',
    'Comment' => '110',
    'CreateTime' => '150',
    'Criticality' => '130',
    'CurInciState' => '140',
    'Type' => '120'
  }
};
$Self->{'LinkObject::ComplexTable::SettingsVisibility'}->{'Service'} =  [
  'AgentITSMServiceZoom'
];
$Self->{'ITSMSLA::Frontend::MenuModule'}->{'100-Print'} =  {
  'Action' => 'AgentITSMSLAPrint',
  'Description' => 'Print',
  'Link' => 'Action=AgentITSMSLAPrint;SLAID=[% Data.SLAID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMSLAMenu::Generic',
  'Name' => 'Print'
};
$Self->{'ITSMSLA::Frontend::MenuModule'}->{'000-Back'} =  {
  'Action' => '',
  'Description' => 'Back',
  'Link' => 'Action=AgentITSMSLA',
  'Module' => 'Kernel::Output::HTML::ITSMSLAMenu::Generic',
  'Name' => 'Back',
  'Target' => 'Back'
};
$Self->{'ITSMService::Frontend::MenuModule'}->{'200-Link'} =  {
  'Action' => 'AgentITSMService',
  'Description' => 'Link',
  'Link' => 'Action=AgentLinkObject;SourceObject=Service;SourceKey=[% Data.ServiceID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMServiceMenu::Link',
  'Name' => 'Link',
  'Target' => 'PopUp'
};
$Self->{'ITSMService::Frontend::MenuModule'}->{'100-Print'} =  {
  'Action' => 'AgentITSMServicePrint',
  'Description' => 'Print',
  'Link' => 'Action=AgentITSMServicePrint;ServiceID=[% Data.ServiceID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMServiceMenu::Generic',
  'Name' => 'Print'
};
$Self->{'ITSMService::Frontend::MenuModule'}->{'000-Back'} =  {
  'Action' => '',
  'Description' => 'Back',
  'Link' => 'Action=AgentITSMService',
  'Module' => 'Kernel::Output::HTML::ITSMServiceMenu::Generic',
  'Name' => 'Back',
  'Target' => 'Back'
};
$Self->{'Frontend::Module'}->{'AgentITSMSLAPrint'} =  {
  'Description' => 'SLA Print.',
  'GroupRo' => [
    'itsm-service'
  ],
  'NavBarName' => 'Service',
  'Title' => 'Print'
};
$Self->{'Frontend::Module'}->{'AgentITSMSLAZoom'} =  {
  'Description' => 'SLA Zoom.',
  'GroupRo' => [
    'itsm-service'
  ],
  'NavBarName' => 'Service',
  'Title' => 'Zoom'
};
$Self->{'Frontend::Module'}->{'AgentITSMServicePrint'} =  {
  'Description' => 'Service Print.',
  'GroupRo' => [
    'itsm-service'
  ],
  'NavBarName' => 'Service',
  'Title' => 'Print'
};
$Self->{'Frontend::Module'}->{'AgentITSMServiceZoom'} =  {
  'Description' => 'Service Zoom.',
  'GroupRo' => [
    'itsm-service'
  ],
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.UI.Table.Sort.js',
      'Core.Agent.TableFilters.js',
      'Core.Agent.LinkObject.js'
    ]
  },
  'NavBarName' => 'Service',
  'Title' => 'Zoom'
};
$Self->{'Frontend::Module'}->{'AgentITSMSLA'} =  {
  'Description' => 'ITSM SLA Overview.',
  'GroupRo' => [
    'itsm-service'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'SLA Overview',
      'Link' => 'Action=AgentITSMSLA',
      'Name' => 'SLA',
      'NavBar' => 'Service',
      'Prio' => '200',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Service',
  'Title' => 'SLA'
};
$Self->{'Frontend::Module'}->{'AgentITSMService'} =  {
  'Description' => 'ITSM Service Overview.',
  'Group' => [
    'itsm-service'
  ],
  'GroupRo' => [
    'itsm-service'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => 'ItemArea',
      'Description' => 'Service-Area',
      'Link' => 'Action=AgentITSMService',
      'Name' => 'Services',
      'NavBar' => 'Service',
      'Prio' => '3100',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Service Overview',
      'Link' => 'Action=AgentITSMService',
      'Name' => 'Service',
      'NavBar' => 'Service',
      'Prio' => '100',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Service',
  'Title' => 'Service'
};
$Self->{'Loader::Agent::CommonJS'}->{'100-ITSM'} =  [
  'ITSM.Agent.CustomerSearch.js',
  'ITSM.Agent.IncidentState.js'
];
$Self->{'Loader::Agent::CommonCSS'}->{'100-ITSM'} =  [
  'ITSM.Agent.Default.css',
  'ITSM.Agent.Search.css'
];
$Self->{'GeneralCatalogPreferences'}->{'IncidentStates'} =  {
  'Block' => 'Option',
  'Class' => 'ITSM::Core::IncidentState',
  'Data' => {
    'incident' => 'Incident',
    'operational' => 'Operational',
    'warning' => 'Warning'
  },
  'Desc' => 'Incident State Type.',
  'Label' => 'Incident State Type',
  'Module' => 'Kernel::Output::HTML::GeneralCatalogPreferences::Generic',
  'PrefKey' => 'Functionality'
};
$Self->{'ITSM::Frontend::TextArea'} =  '78';
$Self->{'LinkObject::PossibleLink'}->{'3420'} =  {
  'Object1' => 'ITSMChange',
  'Object2' => 'Ticket',
  'Type' => 'Normal'
};
$Self->{'LinkObject::PossibleLink'}->{'3412'} =  {
  'Object1' => 'ITSMWorkOrder',
  'Object2' => 'Ticket',
  'Type' => 'Normal'
};
$Self->{'LinkObject::PossibleLink'}->{'3411'} =  {
  'Object1' => 'ITSMWorkOrder',
  'Object2' => 'ITSMConfigItem',
  'Type' => 'DependsOn'
};
$Self->{'LinkObject::PossibleLink'}->{'3410'} =  {
  'Object1' => 'ITSMWorkOrder',
  'Object2' => 'ITSMConfigItem',
  'Type' => 'Normal'
};
$Self->{'LinkObject::PossibleLink'}->{'3401'} =  {
  'Object1' => 'ITSMWorkOrder',
  'Object2' => 'Service',
  'Type' => 'DependsOn'
};
$Self->{'LinkObject::PossibleLink'}->{'3400'} =  {
  'Object1' => 'ITSMWorkOrder',
  'Object2' => 'Service',
  'Type' => 'Normal'
};
$Self->{'LinkObject::PossibleLink'}->{'3282'} =  {
  'Object1' => 'Service',
  'Object2' => 'FAQ',
  'Type' => 'RelevantTo'
};
$Self->{'LinkObject::PossibleLink'}->{'3281'} =  {
  'Object1' => 'Service',
  'Object2' => 'FAQ',
  'Type' => 'ParentChild'
};
$Self->{'LinkObject::PossibleLink'}->{'3280'} =  {
  'Object1' => 'Service',
  'Object2' => 'FAQ',
  'Type' => 'Normal'
};
$Self->{'LinkObject::PossibleLink'}->{'3262'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'FAQ',
  'Type' => 'RelevantTo'
};
$Self->{'LinkObject::PossibleLink'}->{'3261'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'FAQ',
  'Type' => 'ParentChild'
};
$Self->{'LinkObject::PossibleLink'}->{'3260'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'FAQ',
  'Type' => 'Normal'
};
$Self->{'LinkObject::PossibleLink'}->{'3242'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'Service',
  'Type' => 'RelevantTo'
};
$Self->{'LinkObject::PossibleLink'}->{'3241'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'Service',
  'Type' => 'DependsOn'
};
$Self->{'LinkObject::PossibleLink'}->{'3240'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'Service',
  'Type' => 'AlternativeTo'
};
$Self->{'LinkObject::PossibleLink'}->{'3222'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'Ticket',
  'Type' => 'RelevantTo'
};
$Self->{'LinkObject::PossibleLink'}->{'3221'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'Ticket',
  'Type' => 'DependsOn'
};
$Self->{'LinkObject::PossibleLink'}->{'3220'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'Ticket',
  'Type' => 'AlternativeTo'
};
$Self->{'LinkObject::PossibleLink'}->{'3204'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'ITSMConfigItem',
  'Type' => 'RelevantTo'
};
$Self->{'LinkObject::PossibleLink'}->{'3203'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'ITSMConfigItem',
  'Type' => 'Includes'
};
$Self->{'LinkObject::PossibleLink'}->{'3202'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'ITSMConfigItem',
  'Type' => 'DependsOn'
};
$Self->{'LinkObject::PossibleLink'}->{'3201'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'ITSMConfigItem',
  'Type' => 'ConnectedTo'
};
$Self->{'LinkObject::PossibleLink'}->{'3200'} =  {
  'Object1' => 'ITSMConfigItem',
  'Object2' => 'ITSMConfigItem',
  'Type' => 'AlternativeTo'
};
$Self->{'LinkObject::Type'}->{'RelevantTo'} =  {
  'SourceName' => 'Relevant to',
  'TargetName' => 'Relevant to'
};
$Self->{'LinkObject::Type'}->{'Includes'} =  {
  'SourceName' => 'Includes',
  'TargetName' => 'Part of'
};
$Self->{'LinkObject::Type'}->{'DependsOn'} =  {
  'SourceName' => 'Depends on',
  'TargetName' => 'Required for'
};
$Self->{'LinkObject::Type'}->{'ConnectedTo'} =  {
  'SourceName' => 'Connected to',
  'TargetName' => 'Connected to'
};
$Self->{'LinkObject::Type'}->{'AlternativeTo'} =  {
  'SourceName' => 'Alternative to',
  'TargetName' => 'Alternative to'
};
$Self->{'ITSM::Core::IncidentLinkTypeDirection'} =  {
  'DependsOn' => 'Both'
};
$Self->{'Frontend::Module'}->{'AdminITSMCIPAllocate'} =  {
  'Description' => 'Manage priority matrix.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Table.css'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Criticality <-> Impact <-> Priority',
    'Prio' => '430'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Criticality <-> Impact <-> Priority'
};
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemBulk'}->{'InciState'} =  '1';
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemBulk'}->{'DeplState'} =  '1';
$Self->{'ITSMConfigItem::Frontend::PreMenuModule'}->{'300-Duplicate'} =  {
  'Action' => 'AgentITSMConfigItemEdit',
  'Description' => 'Duplicate',
  'Link' => 'Action=AgentITSMConfigItemEdit;DuplicateID=[% Data.ConfigItemID | html %];VersionID=[% Data.VersionID | html %];ReturnToLastScreen=1',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'Duplicate',
  'Target' => 'PopUp'
};
$Self->{'ITSMConfigItem::Frontend::PreMenuModule'}->{'200-History'} =  {
  'Action' => 'AgentITSMConfigItemHistory',
  'Description' => 'History',
  'Link' => 'Action=AgentITSMConfigItemHistory;ConfigItemID=[% Data.ConfigItemID | html %];VersionID=[% Data.VersionID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'History',
  'Target' => 'PopUp'
};
$Self->{'ITSMConfigItem::Frontend::PreMenuModule'}->{'100-Zoom'} =  {
  'Action' => 'AgentITSMConfigItemZoom',
  'Description' => 'Zoom',
  'Link' => 'Action=AgentITSMConfigItemZoom;ConfigItemID=[% Data.ConfigItemID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'Zoom',
  'Target' => ''
};
$Self->{'Frontend::Module'}->{'AgentITSMConfigItemBulk'} =  {
  'Description' => 'Configuration item bulk module.',
  'NavBarName' => 'CMDB',
  'Title' => 'Bulk Action'
};
$Self->{'ITSMConfigItem::Frontend::BulkFeature'} =  '1';
$Self->{'UniqueCIName::UniquenessCheckScope'} =  'global';
$Self->{'UniqueCIName::EnableUniquenessCheck'} =  '0';
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItem'}->{'ShowColumns'} =  {
  'Class' => '0',
  'CurDeplSignal' => '1',
  'CurDeplState' => '1',
  'CurDeplStateType' => '0',
  'CurInciSignal' => '1',
  'CurInciState' => '1',
  'CurInciStateType' => '0',
  'LastChanged' => '1',
  'Name' => '1',
  'Number' => '1'
};
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItem'}->{'SearchLimit'} =  '10000';
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemSearch'}->{'SearchCSVData'} =  [
  'Class',
  'Incident State',
  'Name',
  'ConfigItemNumber',
  'Deployment State',
  'Version',
  'Create Time'
];
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemSearch'}->{'ShowColumns'} =  {
  'Class' => '0',
  'CurDeplSignal' => '1',
  'CurDeplState' => '1',
  'CurDeplStateType' => '0',
  'CurInciSignal' => '1',
  'CurInciState' => '1',
  'CurInciStateType' => '0',
  'LastChanged' => '1',
  'Name' => '1',
  'Number' => '1'
};
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemSearch'}->{'SearchLimit'} =  '10000';
$Self->{'ITSMConfigItem::Hook'} =  'ConfigItem#';
$Self->{'ITSMConfigItem::Frontend::Overview'}->{'Small'} =  {
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::OverviewSmall',
  'Name' => 'Small',
  'NameShort' => 'S',
  'PageShown' => '25'
};
$Self->{'PreferencesGroups'}->{'ConfigItemOverviewSmallPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '25',
  'Key' => 'Configuration Item limit per page',
  'Label' => 'Configuration Item Limit',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserConfigItemOverviewSmallPageShown',
  'Prio' => '8000'
};
$Self->{'Loader::Agent::CommonJS'}->{'100-ConfigurationManagement'} =  [
  'ITSM.Agent.ConfigItem.Search.js',
  'ITSM.UI.ConfigItemActionRow.js'
];
$Self->{'Frontend::Search::JavaScript'}->{'ConfigItem'} =  {
  '^(?:Agent|Admin)ITSMConfigItem' => 'ITSM.Agent.ConfigItem.Search.OpenSearchDialog(\'AgentITSMConfigItemSearch\')'
};
$Self->{'Frontend::Search'}->{'ConfigItem'} =  {
  '^(?:Agent|Admin)ITSMConfigItem' => 'Action=AgentITSMConfigItemSearch;Subaction=AJAX'
};
$Self->{'GeneralCatalogPreferences'}->{'Permissions'} =  {
  'Block' => 'Permission',
  'Class' => 'ITSM::ConfigItem::Class',
  'Desc' => 'Define the group with permissions.',
  'Label' => 'Permission',
  'Module' => 'Kernel::Output::HTML::GeneralCatalogPreferences::Generic',
  'PrefKey' => 'Permission'
};
$Self->{'ITSMConfigItem::Frontend::AdminITSMConfigItem'}->{'EditorRows'} =  '30';
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemSearch'}->{'Permission'} =  'ro';
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemZoom'}->{'Permission'} =  'ro';
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemDelete'}->{'Permission'} =  'rw';
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemPrint'}->{'Permission'} =  'ro';
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemHistory'}->{'Permission'} =  'ro';
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemAdd'}->{'Permission'} =  'rw';
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItemEdit'}->{'Permission'} =  'rw';
$Self->{'ITSMConfigItem::Frontend::AgentITSMConfigItem'}->{'Permission'} =  'ro';
$Self->{'ITSMConfigItem::Permission::Item'}->{'010-ItemClassGroupCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::ITSMConfigItem::Permission::ItemClassGroupCheck',
  'Required' => '0'
};
$Self->{'ITSMConfigItem::Permission::Class'}->{'010-ClassGroupCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::ITSMConfigItem::Permission::ClassGroupCheck',
  'Required' => '0'
};
$Self->{'GeneralCatalogPreferences'}->{'DeploymentStatesColors'} =  {
  'Block' => 'ColorPicker',
  'Class' => 'ITSM::ConfigItem::DeploymentState',
  'Data' => '',
  'Desc' => 'Deployment State Color.',
  'Label' => 'Deployment State Color',
  'Module' => 'Kernel::Output::HTML::GeneralCatalogPreferences::Generic',
  'PrefKey' => 'Color'
};
$Self->{'GeneralCatalogPreferences'}->{'DeploymentStates'} =  {
  'Block' => 'Option',
  'Class' => 'ITSM::ConfigItem::DeploymentState',
  'Data' => {
    'postproductive' => 'postproductive',
    'preproductive' => 'preproductive',
    'productive' => 'productive'
  },
  'Desc' => 'Deployment State Type.',
  'Label' => 'Deployment State Type',
  'Module' => 'Kernel::Output::HTML::GeneralCatalogPreferences::Generic',
  'PrefKey' => 'Functionality'
};
$Self->{'Frontend::Module'}->{'AgentITSMConfigItemHistory'} =  {
  'Description' => 'Config item history.',
  'GroupRo' => [
    'itsm-configitem'
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'History'
};
$Self->{'ITSMConfigItem::Frontend::HistoryOrder'} =  'normal';
$Self->{'ITSMConfigItem::EventModulePost'}->{'100-History'} =  {
  'Event' => '(ConfigItemCreate|VersionCreate|DeploymentStateUpdate|IncidentStateUpdate|ConfigItemDelete|LinkAdd|LinkDelete|DefinitionUpdate|NameUpdate|ValueUpdate|DefinitionCreate|VersionDelete|AttachmentAddPost|AttachmentDeletePost)',
  'Module' => 'Kernel::System::ITSMConfigItem::Event::DoHistory',
  'Transaction' => '0'
};
$Self->{'ImportExport::ObjectBackendRegistration'}->{'ITSMConfigItem'} =  {
  'Module' => 'Kernel::System::ImportExport::ObjectBackend::ITSMConfigItem',
  'Name' => 'Config Item'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'ITSMConfigItem'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::ITSMConfigItem'
};
$Self->{'LinkObject::DefaultSubObject'}->{'ITSMConfigItem'} =  'Computer';
$Self->{'ITSMConfigItem::NumberGenerator'} =  'Kernel::System::ITSMConfigItem::Number::AutoIncrement';
$Self->{'LinkObject::ComplexTable::SettingsVisibility'}->{'ITSMConfigItem'} =  [
  'AgentITSMConfigItemZoom'
];
$Self->{'ITSMConfigItem::Frontend::MenuModule'}->{'810-MoreDetails'} =  {
  'Action' => 'CIMoreDetails',
  'Description' => 'More Details',
  'Link' => 'Action=CIMoreDetails;ConfigItemID=[% Data.ConfigItemID | html %];ClassID=[% Data.ClassID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'More Details'
};
$Self->{'ITSMConfigItem::Frontend::MenuModule'}->{'800-All CI'} =  {
  'Action' => 'CIGraphView',
  'Description' => 'All Config Items',
  'Link' => 'Action=CIGraphView;ConfigItemID=[% Data.ConfigItemID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'Dependent CI'
};
$Self->{'ITSMConfigItem::Frontend::MenuModule'}->{'700-ConfigItemDelete'} =  {
  'Action' => 'AgentITSMConfigItemDelete',
  'ConfirmedActionQueryString' => 'Action=AgentITSMConfigItemDelete;Subaction=ConfigItemDelete;ConfigItemID=[% Data.ConfigItemID | html %]',
  'Description' => 'Delete Configuration Item',
  'DialogContentQueryString' => 'Action=AgentITSMConfigItemDelete;ConfigItemID=[% Data.ConfigItemID | html %]',
  'DialogTitle' => '[% Translate("Delete") | html %] [% Config("ITSMConfigItem::Hook") %] [% Data.Number | html %]',
  'ElementSelector' => '#Menu[% Data.MenuID | html %]',
  'Link' => 'Action=AgentITSMConfigItemDelete;ConfigItemID=[% Data.ConfigItemID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'Delete',
  'Target' => 'ConfirmDialog'
};
$Self->{'ITSMConfigItem::Frontend::MenuModule'}->{'600-Duplicate'} =  {
  'Action' => 'AgentITSMConfigItemEdit',
  'Description' => 'Duplicate',
  'Link' => 'Action=AgentITSMConfigItemEdit;DuplicateID=[% Data.ConfigItemID | html %];VersionID=[% Data.VersionID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'Duplicate',
  'Target' => 'PopUp'
};
$Self->{'ITSMConfigItem::Frontend::MenuModule'}->{'500-Link'} =  {
  'Action' => 'AgentLinkObject',
  'Description' => 'Link',
  'Link' => 'Action=AgentLinkObject;SourceObject=ITSMConfigItem;SourceKey=[% Data.ConfigItemID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'Link',
  'Target' => 'PopUp'
};
$Self->{'ITSMConfigItem::Frontend::MenuModule'}->{'400-Print'} =  {
  'Action' => 'AgentITSMConfigItemPrint',
  'Description' => 'Print',
  'Link' => 'Action=AgentITSMConfigItemPrint;ConfigItemID=[% Data.ConfigItemID | html %];VersionID=[% Data.VersionID | html %]',
  'LinkParam' => 'target="print"',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'Print',
  'Target' => 'PopUp'
};
$Self->{'ITSMConfigItem::Frontend::MenuModule'}->{'300-Edit'} =  {
  'Action' => 'AgentITSMConfigItemEdit',
  'Description' => 'Edit',
  'Link' => 'Action=AgentITSMConfigItemEdit;ConfigItemID=[% Data.ConfigItemID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'Edit',
  'Target' => 'PopUp'
};
$Self->{'ITSMConfigItem::Frontend::MenuModule'}->{'200-History'} =  {
  'Action' => 'AgentITSMConfigItemHistory',
  'Description' => 'History',
  'Link' => 'Action=AgentITSMConfigItemHistory;ConfigItemID=[% Data.ConfigItemID | html %];VersionID=[% Data.VersionID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'History',
  'Target' => 'PopUp'
};
$Self->{'ITSMConfigItem::Frontend::MenuModule'}->{'000-Back'} =  {
  'Action' => '',
  'Description' => 'Back',
  'Link' => 'Action=AgentITSMConfigItem;ClassID=[% Data.ClassID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMConfigItem::MenuGeneric',
  'Name' => 'Back',
  'Target' => 'Back'
};
$Self->{'Frontend::Module'}->{'AgentCMDBAsset'} =  {
  'Description' => 'Asset Management.',
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Detail.css',
      'ITSM.Table.css',
      'ITSM.Print.css'
    ],
    'JavaScript' => [
      'thirdparty/jquery-tablesorter-2.0.5/jquery.tablesorter.js',
      'Core.UI.Table.Sort.js',
      'ITSM.Agent.Zoom.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Search config items.',
      'Link' => 'Action=AgentCMDBAsset',
      'Name' => 'Asset Management',
      'NavBar' => 'Config Item',
      'Prio' => '300',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'Asset Management'
};
$Self->{'Frontend::Module'}->{'AgentITSMConfigItemSearch'} =  {
  'Description' => 'Search config items.',
  'GroupRo' => [
    'itsm-configitem'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Detail.css',
      'ITSM.Table.css',
      'ITSM.Print.css'
    ],
    'JavaScript' => [
      'thirdparty/jquery-tablesorter-2.0.5/jquery.tablesorter.js',
      'Core.UI.Table.Sort.js',
      'ITSM.Agent.Zoom.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Search config items.',
      'Link' => 'Action=AgentITSMConfigItemSearch',
      'LinkOption' => 'onclick="ITSM.Agent.ConfigItem.Search.OpenSearchDialog(\'AgentITSMConfigItemSearch\'); if (event.stopPropagation) { event.stopPropagation(); } else { window.event.cancelBubble = true; } return false;"',
      'Name' => 'Search',
      'NavBar' => 'Config Item',
      'Prio' => '300',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'Search'
};
$Self->{'Frontend::Module'}->{'AgentITSMConfigItemAdd'} =  {
  'Description' => 'Config item add.',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'New',
      'Link' => 'Action=AgentITSMConfigItemAdd',
      'Name' => 'New',
      'NavBar' => 'Config Item',
      'Prio' => '200',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'Add'
};
$Self->{'Frontend::Module'}->{'AgentITSMConfigItemDelete'} =  {
  'Description' => 'Delete a configuration item',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBarName' => 'ITSM ConfigItem',
  'Title' => 'Delete'
};
$Self->{'Frontend::Module'}->{'AgentITSMConfigItemPrint'} =  {
  'Description' => 'Config item print.',
  'GroupRo' => [
    'itsm-configitem'
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'Print'
};
$Self->{'Frontend::Module'}->{'AgentITSMConfigItemEdit'} =  {
  'Description' => 'Config item edit.',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'Edit'
};
$Self->{'Frontend::Module'}->{'AgentITSMConfigItemZoom'} =  {
  'Description' => 'Config item zoom.',
  'GroupRo' => [
    'itsm-configitem'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css',
      'ITSM.Agent.Detail.css',
      'Core.AllocationList.css',
      'ITSM.Print.css'
    ],
    'JavaScript' => [
      'thirdparty/jquery-tablesorter-2.0.5/jquery.tablesorter.js',
      'Core.UI.AllocationList.js',
      'Core.UI.Table.Sort.js',
      'Core.Agent.TableFilters.js',
      'Core.Agent.LinkObject.js',
      'ITSM.Agent.Zoom.js',
      'ITSM.Agent.ConfirmDialog.js'
    ]
  },
  'NavBarName' => 'Config Item',
  'Title' => 'Zoom'
};
$Self->{'Frontend::Module'}->{'AgentITSMConfigItem'} =  {
  'Description' => 'ITSM config item overview.',
  'GroupRo' => [
    'itsm-configitem'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => 'ItemArea',
      'Description' => 'Configuration Management Database.',
      'Link' => 'Action=AgentITSMConfigItem',
      'Name' => 'CMDB',
      'NavBar' => 'Config Item',
      'Prio' => '3200',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview.',
      'Link' => 'Action=AgentITSMConfigItem',
      'Name' => 'Overview',
      'NavBar' => 'Config Item',
      'Prio' => '100',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'Config Item'
};
$Self->{'Frontend::Module'}->{'AdminITSMConfigItem'} =  {
  'Description' => 'Admin.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage the definitions for Configuration Items.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Config Items',
    'Prio' => '495'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Config Item'
};
$Self->{'ITSMChange::Frontend::AgentITSMChange'}->{'Order::Default'} =  'Up';
$Self->{'ITSMChange::Frontend::AgentITSMChange'}->{'SortBy::Default'} =  '';
$Self->{'Frontend::Module'}->{'ChangeCalendar'} =  {
  'Description' => 'ITSM Change Dashboard Overview.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Change Calendar',
      'Link' => 'Action=ChangeCalendar',
      'Name' => 'Change Calendar',
      'NavBar' => 'ITSM Change',
      'Prio' => '101',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'ChangeCalendar'
};
$Self->{'Frontend::Module'}->{'ChangesDashboard'} =  {
  'Description' => 'ITSM Change Dashboard Overview.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Changes Dashboard',
      'Link' => 'Action=ChangesDashboard',
      'Name' => 'Changes Dashboard',
      'NavBar' => 'ITSM Change',
      'Prio' => '99',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'ChangesDashboard'
};
$Self->{'ITSMWorkOrder::EventModule'}->{'1000-GenericInterface'} =  {
  'Event' => '',
  'Module' => 'Kernel::GenericInterface::Event::Handler',
  'Transaction' => '1'
};
$Self->{'ITSMChange::EventModule'}->{'1000-GenericInterface'} =  {
  'Event' => '',
  'Module' => 'Kernel::GenericInterface::Event::Handler',
  'Transaction' => '1'
};
$Self->{'Events'}->{'ITSMWorkOrder'} =  [
  'WorkOrderAddPre',
  'WorkOrderAddPost',
  'WorkOrderUpdatePre',
  'WorkOrderUpdatePost',
  'WorkOrderDeletePre',
  'WorkOrderDeletePost',
  'WorkOrderAttachmentAddPost',
  'WorkOrderAttachmentDeletePost',
  'WorkOrderReportAttachmentAddPost',
  'WorkOrderReportAttachmentDeletePost'
];
$Self->{'Events'}->{'ITSMChange'} =  [
  'ChangeAddPre',
  'ChangeAddPost',
  'ChangeUpdatePre',
  'ChangeUpdatePost',
  'ChangeCABUpdatePre',
  'ChangeCABUpdatePost',
  'ChangeCABDeletePre',
  'ChangeCABDeletePost',
  'ChangeDeletePre',
  'ChangeDeletePost',
  'ChangeAttachmentAddPost',
  'ChangeAttachmentDeletePost'
];
$Self->{'Loader::Agent::CommonJS'}->{'100-ITSMChangeManagement'} =  [
  'ITSM.Agent.ChangeManagement.Search.js',
  'ITSM.Agent.UserSearch.js',
  'ITSM.Agent.CABMemberSearch.js'
];
$Self->{'ITSMChange::Frontend::AgentHTMLFieldHeightMax'} =  '2500';
$Self->{'ITSMChange::Frontend::AgentHTMLFieldHeightDefault'} =  '100';
$Self->{'ITSMChange::Frontend::AgentITSMChangeSearch'}->{'SearchCSVData'} =  [
  'ChangeNumber',
  'ChangeTitle',
  'ChangeBuilder',
  'WorkOrderCount',
  'ChangeState',
  'Priority',
  'PlannedStartTime',
  'PlannedEndTime'
];
$Self->{'Frontend::Search::JavaScript'}->{'Change'} =  {
  '^(?:Agent|Admin)ITSM(Change|WorkOrder|TemplateOverview)' => 'ITSM.Agent.ChangeManagement.Search.OpenSearchDialog(\'AgentITSMChangeSearch\')'
};
$Self->{'Frontend::Search'}->{'Change'} =  {
  '^(?:Agent|Admin)ITSM(Change|WorkOrder|TemplateOverview)' => 'Action=AgentITSMChangeSearch;Subaction=AJAX'
};
$Self->{'PreferencesGroups'}->{'UserITSMChangeManagementTemplateEdit'} =  {
  'Active' => '0',
  'Block' => 'Input',
  'Column' => 'Other Settings',
  'Data' => '',
  'Desc' => 'Change and workorder templates edited by this user.',
  'Key' => 'Template',
  'Label' => 'Change and Workorder Templates',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserITSMChangeManagementTemplateEdit',
  'Prio' => '9000'
};
$Self->{'PreferencesGroups'}->{'ChangeOverviewSmallPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '25',
  'Desc' => 'Change limit per page for Change Overview "Small".',
  'Key' => 'Limit',
  'Label' => 'Change Overview "Small" Limit',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserChangeOverviewSmallPageShown',
  'Prio' => '8000'
};
$Self->{'PreferencesGroups'}->{'UserCreateWorkOrderNextMask'} =  {
  'Active' => '1',
  'Column' => 'Other Settings',
  'Data' => {
    'AgentITSMChangeZoom' => 'ChangeZoom',
    'AgentITSMWorkOrderZoom' => 'WorkorderZoom'
  },
  'DataSelected' => 'AgentITSMWorkOrderZoom',
  'Desc' => 'Configure which screen should be shown after a new workorder has been created.',
  'Key' => 'Screen',
  'Label' => 'Screen after creating a workorder',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserCreateWorkOrderNextMask',
  'Prio' => '4000'
};
$Self->{'ITSMChange::NumberGenerator::AutoIncrement::MinCounterSize'} =  '5';
$Self->{'ITSMChange::NumberGenerator'} =  'Kernel::System::ITSMChange::Number::DateChecksum';
$Self->{'Stats::DynamicObjectRegistration'}->{'ITSMChangeManagementChangesPerCIClasses'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::ITSMChangeManagementChangesPerCIClasses'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'ITSMChangeManagementRfcRequester'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::ITSMChangeManagementRfcRequester'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'ITSMChangeManagementChangesIncidents'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::ITSMChangeManagementChangesIncidents'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'ITSMChangeManagementHistory'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::ITSMChangeManagementHistory'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'ITSMChangeManagement'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::ITSMChangeManagement'
};
$Self->{'Stats::ExchangeAxis'} =  '1';
$Self->{'ITSMChange::TimeReachedNotifications'}->{'Hours'} =  '1';
$Self->{'ITSMChange::TimeReachedNotifications'}->{'Frequency'} =  'once';
$Self->{'ITSMChange::SendNotifications'} =  '1';
$Self->{'ITSMStateMachine::Object'}->{'WorkOrder'} =  {
  'Class' => 'ITSM::ChangeManagement::WorkOrder::State',
  'Name' => 'WorkOrder'
};
$Self->{'ITSMStateMachine::Object'}->{'Change'} =  {
  'Class' => 'ITSM::ChangeManagement::Change::State',
  'Name' => 'Change'
};
$Self->{'ITSMWorkOrder::Permission'}->{'40-CABCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::ITSMChange::ITSMWorkOrder::Permission::CABCheck',
  'Required' => '0'
};
$Self->{'ITSMWorkOrder::Permission'}->{'30-WorkOrderAgentCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::ITSMChange::ITSMWorkOrder::Permission::WorkOrderAgentCheck',
  'Required' => '0'
};
$Self->{'ITSMWorkOrder::Permission'}->{'20-ChangeBuilderCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::ITSMChange::ITSMWorkOrder::Permission::ChangeBuilderCheck',
  'Required' => '0'
};
$Self->{'ITSMWorkOrder::Permission'}->{'10-ChangeManagerCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::ITSMChange::ITSMWorkOrder::Permission::ChangeManagerCheck',
  'Required' => '0'
};
$Self->{'ITSMChange::Permission'}->{'40-CABCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::ITSMChange::Permission::CABCheck',
  'Required' => '0'
};
$Self->{'ITSMChange::Permission'}->{'30-ChangeAgentCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::ITSMChange::Permission::ChangeAgentCheck',
  'Required' => '0'
};
$Self->{'ITSMChange::Permission'}->{'20-ChangeBuilderCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::ITSMChange::Permission::ChangeBuilderCheck',
  'Required' => '0'
};
$Self->{'ITSMChange::Permission'}->{'10-ChangeManagerCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::ITSMChange::Permission::ChangeManagerCheck',
  'Required' => '0'
};
$Self->{'ITSMChange::Permission'}->{'06-AddWorkOrderCheck'} =  {
  'Granted' => '0',
  'Module' => 'Kernel::System::ITSMChange::Permission::AddWorkOrderCheck',
  'Required' => '1'
};
$Self->{'ITSMChange::Frontend::CustomerITSMChangeSchedule'}->{'SortBy::Default'} =  'PlannedStartTime';
$Self->{'ITSMChange::Frontend::CustomerITSMChangeSchedule'}->{'ShowOnlyChangesWithAllowedServices'} =  '1';
$Self->{'ITSMChange::Frontend::CustomerITSMChangeSchedule'}->{'ShowColumns'} =  {
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'Category' => '0',
  'ChangeBuilder' => '0',
  'ChangeManager' => '0',
  'ChangeNumber' => '1',
  'ChangeState' => '1',
  'ChangeStateSignal' => '1',
  'ChangeTitle' => '1',
  'CreateTime' => '0',
  'DynamicField_ChangeFieldName1' => '0',
  'DynamicField_ChangeFieldName2' => '0',
  'Impact' => '0',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'Priority' => '0',
  'RequestedTime' => '0',
  'Services' => '1',
  'WorkOrderCount' => '0'
};
$Self->{'ITSMChange::Frontend::CustomerITSMChangeSchedule'}->{'Order::Default'} =  'Up';
$Self->{'ITSMChange::Frontend::CustomerITSMChangeSchedule'}->{'Filter::ChangeStates'} =  [
  'approved',
  'in progress'
];
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderZoom'}->{'DynamicField'} =  {};
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderZoom'}->{'PlannedEffort'} =  '1';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderZoom'}->{'Permission'} =  'ro';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderZoom'}->{'AccountedTime'} =  '1';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderTemplate'}->{'Permission'} =  'rw';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderTake'}->{'Permission'} =  'rw';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderReport'}->{'Permission'} =  'rw';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderType::DynamicField'} =  {};
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderReport'}->{'DynamicField'} =  {};
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderReport'}->{'ActualTimeSpan'} =  '0';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderReport'}->{'AccountedTime'} =  '1';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderHistoryZoom'}->{'Permission'} =  'ro';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderHistory'}->{'Permission'} =  'ro';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderEdit'}->{'MoveFollowingWorkOrders'} =  '1';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderEdit'}->{'PlannedEffort'} =  '1';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderEdit'}->{'Permission'} =  'rw';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderEdit'}->{'DynamicField'} =  {};
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderDelete'}->{'Permission'} =  'rw';
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderAgent'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMWorkOrderAddFromTemplate'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMWorkOrderAdd'}->{'PlannedEffort'} =  '1';
$Self->{'ITSMChange::Frontend::AgentITSMWorkOrderAdd'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMWorkOrderAdd'}->{'DynamicField'} =  {};
$Self->{'ITSMChange::Frontend::AgentITSMTemplateOverview'}->{'SortBy::Default'} =  'TemplateID';
$Self->{'ITSMChange::Frontend::AgentITSMTemplateOverview'}->{'ShowColumns'} =  {
  'ChangeBy' => '0',
  'ChangeTime' => '0',
  'Comment' => '1',
  'CreateBy' => '1',
  'CreateTime' => '1',
  'Delete' => '1',
  'EditContent' => '1',
  'Name' => '1',
  'Type' => '1',
  'Valid' => '1'
};
$Self->{'ITSMChange::Frontend::AgentITSMTemplateOverview'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMTemplateOverview'}->{'Order::Default'} =  'Up';
$Self->{'ITSMChange::Frontend::AgentITSMTemplateOverview'}->{'Filter::TemplateTypes'} =  [
  'ITSMChange',
  'ITSMWorkOrder',
  'CAB'
];
$Self->{'ITSMChange::Frontend::AgentITSMTemplateEditCAB'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMTemplateEditContent'}->{'DefaultChangeTitle'} =  'Helper dummy change needed for editing a workorder template';
$Self->{'ITSMChange::Frontend::AgentITSMTemplateEditContent'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMTemplateEdit'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMTemplateDelete'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChangeZoom'}->{'DynamicField'} =  {};
$Self->{'ITSMChange::Frontend::AgentITSMChangeZoom'}->{'Tooltip::WorkOrderAttributes'} =  {
  'AccountedTime' => '0',
  'ActualEndTime' => '1',
  'ActualStartTime' => '1',
  'DynamicField_WorkOrderFieldName1' => '0',
  'DynamicField_WorkOrderFieldName2' => '0',
  'Instruction' => '0',
  'PlannedEffort' => '0',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'Report' => '0',
  'WorkOrderAgent' => '1',
  'WorkOrderState' => '1',
  'WorkOrderTitle' => '1',
  'WorkOrderType' => '1'
};
$Self->{'ITSMChange::Frontend::AgentITSMChangeZoom'}->{'WorkOrderGraph'} =  {
  'TimeLineColor' => '#DC143C',
  'TimeLineWidth' => '2',
  'approval_actual_color' => '#FF7F50',
  'approval_planned_color' => '#FF4500',
  'backout_actual_color' => '#C0C0C0',
  'backout_planned_color' => '#696969',
  'pir_actual_color' => '#87CEEB',
  'pir_planned_color' => '#4682B4',
  'undefined_actual_color' => '#F08080',
  'undefined_planned_color' => '#B22222',
  'workorder_actual_color' => '#3CB371',
  'workorder_planned_color' => '#006400'
};
$Self->{'ITSMChange::Frontend::AgentITSMChangeZoom'}->{'WorkOrderTitle'} =  '0';
$Self->{'ITSMChange::Frontend::AgentITSMChangeZoom'}->{'WorkOrderState'} =  '0';
$Self->{'ITSMChange::Frontend::AgentITSMChangeZoom'}->{'RequestedTime'} =  '1';
$Self->{'ITSMChange::Frontend::AgentITSMChangeZoom'}->{'PlannedEffort'} =  '1';
$Self->{'ITSMChange::Frontend::AgentITSMChangeZoom'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChangeZoom'}->{'AccountedTime'} =  '1';
$Self->{'ITSMChange::Frontend::AgentITSMChangeTimeSlot'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChangeTemplate'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChangeSearch'}->{'ShowColumns'} =  {
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'Category' => '0',
  'ChangeBuilder' => '1',
  'ChangeManager' => '0',
  'ChangeNumber' => '1',
  'ChangeState' => '1',
  'ChangeStateSignal' => '1',
  'ChangeTime' => '0',
  'ChangeTitle' => '1',
  'CreateTime' => '0',
  'DynamicField_ChangeFieldName1' => '0',
  'DynamicField_ChangeFieldName2' => '0',
  'Impact' => '0',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'Priority' => '1',
  'RequestedTime' => '0',
  'Services' => '0',
  'WorkOrderCount' => '1'
};
$Self->{'ITSMChange::Frontend::AgentITSMChangeSearch'}->{'DynamicField'} =  {};
$Self->{'ITSMChange::Frontend::AgentITSMChangeSearch'}->{'RequestedTime'} =  '1';
$Self->{'ITSMChange::Frontend::AgentITSMChangePrint'}->{'DynamicField'} =  {};
$Self->{'ITSMChange::Frontend::AgentITSMChangePrint'}->{'RequestedTime'} =  '1';
$Self->{'ITSMChange::Frontend::AgentITSMChangePrint'}->{'PlannedEffort'} =  '1';
$Self->{'ITSMChange::Frontend::AgentITSMChangePrint'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChangePrint'}->{'AccountedTime'} =  '1';
$Self->{'ITSMChange::Frontend::AdminITSMChangeNotification'}->{'RichTextHeight'} =  '320';
$Self->{'ITSMChange::Frontend::AdminITSMChangeNotification'}->{'RichTextWidth'} =  '620';
$Self->{'ITSMChange::Frontend::AdminITSMChangeNotification'}->{'RichText'} =  '1';
$Self->{'ITSMChange::Frontend::AgentITSMChangePIR'}->{'WorkOrderTypes'} =  [
  'pir'
];
$Self->{'ITSMChange::Frontend::AgentITSMChangePIR'}->{'SortBy::Default'} =  'PlannedStartTime';
$Self->{'ITSMChange::Frontend::AgentITSMChangePIR'}->{'ShowColumns'} =  {
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'Category' => '0',
  'ChangeBuilder' => '0',
  'ChangeManager' => '0',
  'ChangeNumber' => '0',
  'ChangeState' => '0',
  'ChangeStateSignal' => '0',
  'ChangeTime' => '0',
  'ChangeTitle' => '1',
  'CreateTime' => '0',
  'DynamicField_WorkOrderFieldName1' => '0',
  'DynamicField_WorkOrderFieldName2' => '0',
  'Impact' => '0',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'Priority' => '0',
  'RequestedTime' => '0',
  'Services' => '0',
  'WorkOrderAgent' => '1',
  'WorkOrderCount' => '0',
  'WorkOrderNumber' => '1',
  'WorkOrderState' => '1',
  'WorkOrderStateSignal' => '1',
  'WorkOrderTitle' => '1',
  'WorkOrderType' => '0'
};
$Self->{'ITSMChange::Frontend::AgentITSMChangePIR'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChangePIR'}->{'Order::Default'} =  'Up';
$Self->{'ITSMChange::Frontend::AgentITSMChangePIR'}->{'Filter::WorkOrderStates'} =  [
  'accepted',
  'ready',
  'in progress',
  'closed',
  'canceled'
];
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyWorkOrders'}->{'SortBy::Default'} =  'PlannedStartTime';
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyWorkOrders'}->{'ShowColumns'} =  {
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'Category' => '0',
  'ChangeBuilder' => '0',
  'ChangeManager' => '0',
  'ChangeNumber' => '0',
  'ChangeState' => '0',
  'ChangeStateSignal' => '0',
  'ChangeTime' => '0',
  'ChangeTitle' => '1',
  'CreateTime' => '0',
  'DynamicField_WorkOrderFieldName1' => '0',
  'DynamicField_WorkOrderFieldName2' => '0',
  'Impact' => '0',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'Priority' => '0',
  'RequestedTime' => '0',
  'Services' => '0',
  'WorkOrderAgent' => '1',
  'WorkOrderCount' => '0',
  'WorkOrderNumber' => '1',
  'WorkOrderState' => '1',
  'WorkOrderStateSignal' => '1',
  'WorkOrderTitle' => '1',
  'WorkOrderType' => '0'
};
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyWorkOrders'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyWorkOrders'}->{'Order::Default'} =  'Up';
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyChanges'}->{'SortBy::Default'} =  'PlannedStartTime';
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyChanges'}->{'ShowColumns'} =  {
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'Category' => '0',
  'ChangeBuilder' => '1',
  'ChangeManager' => '0',
  'ChangeNumber' => '1',
  'ChangeState' => '1',
  'ChangeStateSignal' => '1',
  'ChangeTime' => '0',
  'ChangeTitle' => '1',
  'CreateTime' => '0',
  'DynamicField_ChangeFieldName1' => '0',
  'DynamicField_ChangeFieldName2' => '0',
  'Impact' => '0',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'Priority' => '1',
  'RequestedTime' => '0',
  'Services' => '0',
  'WorkOrderCount' => '1'
};
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyChanges'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyChanges'}->{'Order::Default'} =  'Up';
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyWorkOrders'}->{'Filter::WorkOrderStates'} =  [
  'created',
  'accepted',
  'ready',
  'in progress'
];
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyChanges'}->{'Filter::ChangeStates'} =  [
  'requested',
  'pending approval',
  'approved',
  'in progress',
  'pending pir'
];
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyCAB'}->{'SortBy::Default'} =  'ChangeNumber';
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyCAB'}->{'ShowColumns'} =  {
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'Category' => '0',
  'ChangeBuilder' => '1',
  'ChangeManager' => '0',
  'ChangeNumber' => '1',
  'ChangeState' => '1',
  'ChangeStateSignal' => '1',
  'ChangeTime' => '0',
  'ChangeTitle' => '1',
  'CreateTime' => '0',
  'DynamicField_ChangeFieldName1' => '0',
  'DynamicField_ChangeFieldName2' => '0',
  'Impact' => '0',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'Priority' => '1',
  'RequestedTime' => '0',
  'Services' => '0',
  'WorkOrderCount' => '1'
};
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyCAB'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyCAB'}->{'Order::Default'} =  'Up';
$Self->{'ITSMChange::Frontend::AgentITSMChangeMyCAB'}->{'Filter::ChangeStates'} =  [
  'requested',
  'pending approval',
  'approved',
  'in progress',
  'pending pir'
];
$Self->{'ITSMChange::Frontend::AgentITSMChangeManager'}->{'SortBy::Default'} =  'ChangeNumber';
$Self->{'ITSMChange::Frontend::AgentITSMChangeManager'}->{'ShowColumns'} =  {
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'Category' => '0',
  'ChangeBuilder' => '1',
  'ChangeManager' => '1',
  'ChangeNumber' => '1',
  'ChangeState' => '1',
  'ChangeStateSignal' => '1',
  'ChangeTime' => '0',
  'ChangeTitle' => '1',
  'CreateTime' => '0',
  'DynamicField_ChangeFieldName1' => '0',
  'DynamicField_ChangeFieldName2' => '0',
  'Impact' => '0',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'Priority' => '1',
  'RequestedTime' => '0',
  'Services' => '0',
  'WorkOrderCount' => '1'
};
$Self->{'ITSMChange::Frontend::AgentITSMChangeManager'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChangeManager'}->{'Order::Default'} =  'Up';
$Self->{'ITSMChange::Frontend::AgentITSMChangeManager'}->{'Filter::ChangeStates'} =  [
  'requested',
  'pending approval',
  'approved',
  'in progress',
  'pending pir'
];
$Self->{'ITSMChange::Frontend::AgentITSMChangeInvolvedPersons'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChangeHistoryZoom'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChangeHistory'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChangeSchedule'}->{'SortBy::Default'} =  'PlannedStartTime';
$Self->{'ITSMChange::Frontend::AgentITSMChangeSchedule'}->{'ShowColumns'} =  {
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'Category' => '0',
  'ChangeBuilder' => '1',
  'ChangeManager' => '0',
  'ChangeNumber' => '1',
  'ChangeState' => '1',
  'ChangeStateSignal' => '1',
  'ChangeTime' => '0',
  'ChangeTitle' => '1',
  'CreateTime' => '0',
  'DynamicField_ChangeFieldName1' => '0',
  'DynamicField_ChangeFieldName2' => '0',
  'Impact' => '0',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'Priority' => '1',
  'RequestedTime' => '0',
  'Services' => '0',
  'WorkOrderCount' => '1'
};
$Self->{'ITSMChange::Frontend::AgentITSMChangeSchedule'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChangeSchedule'}->{'Order::Default'} =  'Up';
$Self->{'ITSMChange::Frontend::AgentITSMChangeSchedule'}->{'Filter::ChangeStates'} =  [
  'approved'
];
$Self->{'ITSMChange::Frontend::AgentITSMChangeReset'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChangePSA'}->{'SortBy::Default'} =  'PlannedStartTime';
$Self->{'ITSMChange::Frontend::AgentITSMChangePSA'}->{'ShowColumns'} =  {
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'Category' => '0',
  'ChangeBuilder' => '0',
  'ChangeManager' => '0',
  'ChangeNumber' => '1',
  'ChangeState' => '1',
  'ChangeStateSignal' => '1',
  'ChangeTime' => '0',
  'ChangeTitle' => '1',
  'CreateTime' => '0',
  'DynamicField_ChangeFieldName1' => '0',
  'DynamicField_ChangeFieldName2' => '0',
  'Impact' => '0',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'Priority' => '1',
  'RequestedTime' => '0',
  'Services' => '1',
  'WorkOrderCount' => '0'
};
$Self->{'ITSMChange::Frontend::AgentITSMChangePSA'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChangePSA'}->{'Order::Default'} =  'Up';
$Self->{'ITSMChange::Frontend::AgentITSMChangePSA'}->{'Filter::ChangeStates'} =  [
  'approved'
];
$Self->{'ITSMChange::Frontend::AgentITSMChangeEdit'}->{'DynamicField'} =  {};
$Self->{'ITSMChange::Frontend::AgentITSMChangeEdit'}->{'ChangeState'} =  '0';
$Self->{'ITSMChange::Frontend::AgentITSMChangeEdit'}->{'RequestedTime'} =  '1';
$Self->{'ITSMChange::Frontend::AgentITSMChangeDelete'}->{'ChangeStates'} =  [
  'requested',
  'pending approval'
];
$Self->{'ITSMChange::Frontend::AgentITSMChangeDelete'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChangeEdit'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChangeConditionEdit'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChangeCondition'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChangeCABTemplate'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChangeAddFromTemplate'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChangeAdd'}->{'DynamicField'} =  {};
$Self->{'ITSMChange::Frontend::AgentITSMChangeAdd'}->{'RequestedTime'} =  '1';
$Self->{'ITSMChange::Frontend::AgentITSMChangeAdd'}->{'Permission'} =  'rw';
$Self->{'ITSMChange::Frontend::AgentITSMChange'}->{'ShowColumns'} =  {
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'Category' => '0',
  'ChangeBuilder' => '1',
  'ChangeManager' => '0',
  'ChangeNumber' => '1',
  'ChangeState' => '1',
  'ChangeStateSignal' => '1',
  'ChangeTime' => '0',
  'ChangeTitle' => '1',
  'CreateTime' => '0',
  'DynamicField_ChangeFieldName1' => '0',
  'DynamicField_ChangeFieldName2' => '0',
  'Impact' => '0',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'Priority' => '1',
  'RequestedTime' => '0',
  'Services' => '0',
  'WorkOrderCount' => '1'
};
$Self->{'ITSMChange::Frontend::AgentITSMChange'}->{'Permission'} =  'ro';
$Self->{'ITSMChange::Frontend::AgentITSMChange'}->{'Filter::ChangeStates'} =  [
  'requested',
  'pending approval',
  'rejected',
  'approved',
  'in progress',
  'pending pir',
  'successful',
  'failed',
  'canceled',
  'retracted'
];
$Self->{'ITSMChange::Frontend::HistoryOrder'} =  'normal';
$Self->{'ITSMWorkOrder::TimePeriod'} =  {
  'YearPeriodFuture' => '5',
  'YearPeriodPast' => '5'
};
$Self->{'ITSMWorkOrder::TakePermission::List'} =  {
  '' => '1'
};
$Self->{'ITSMWorkOrder::ActualStartTimeSet::States'} =  [
  'in progress'
];
$Self->{'ITSMWorkOrder::Type::Default'} =  'workorder';
$Self->{'ITSMWorkOrder::State::Signal'} =  {
  'accepted' => 'grayled',
  'canceled' => 'redled',
  'closed' => 'greenled',
  'created' => 'grayled',
  'in progress' => 'yellowled',
  'ready' => 'yellowled'
};
$Self->{'ITSMWorkOrder::StateLock::AllowEndStates'} =  '1';
$Self->{'ITSMWorkOrder::Hook'} =  'Workorder#';
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'DynamicField'} =  {
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'AccountedTime'} =  {
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'PlannedEffort'} =  {
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'ActualEndTime'} =  {
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'ActualStartTime'} =  {
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'PlannedEndTime'} =  {
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'PlannedStartTime'} =  {
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'WorkOrderAgentID'} =  {
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'WorkOrderTitle'} =  {
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'WorkOrderTypeID'} =  {
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'WorkOrderStateID'} =  {
  'lock' => '1',
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Attribute::Operator'}->{'WorkOrderNumber'} =  {
  'set' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Action::Object::Attribute'} =  {
  'AccountedTime' => '0',
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'DynamicField' => '1',
  'PlannedEffort' => '0',
  'PlannedEndTime' => '0',
  'PlannedStartTime' => '0',
  'WorkOrderAgentID' => '1',
  'WorkOrderNumber' => '0',
  'WorkOrderStateID' => '1',
  'WorkOrderTitle' => '0',
  'WorkOrderTypeID' => '0'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'DynamicField'} =  {
  'begins with' => '1',
  'contains' => '1',
  'ends with' => '1',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '1',
  'is greater than' => '1',
  'is less than' => '1',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'AccountedTime'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '1',
  'is greater than' => '1',
  'is less than' => '1',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'PlannedEffort'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '1',
  'is greater than' => '1',
  'is less than' => '1',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'ActualEndTime'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '1',
  'is before' => '1',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'ActualStartTime'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '1',
  'is before' => '1',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'PlannedEndTime'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '1',
  'is before' => '1',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'PlannedStartTime'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '1',
  'is before' => '1',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'WorkOrderAgentID'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '0',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '0',
  'not contains' => '0'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'WorkOrderTitle'} =  {
  'begins with' => '1',
  'contains' => '1',
  'ends with' => '1',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '1'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'WorkOrderTypeID'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '0',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '0',
  'not contains' => '0'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'WorkOrderStateID'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '0',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '0',
  'not contains' => '0'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Attribute::Operator'}->{'WorkOrderNumber'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '0',
  'is greater than' => '1',
  'is less than' => '1',
  'is not' => '1',
  'is not empty' => '0',
  'not contains' => '0'
};
$Self->{'ITSMWorkOrder::Mapping::Expression::Object::Attribute'} =  {
  'AccountedTime' => '1',
  'ActualEndTime' => '1',
  'ActualStartTime' => '1',
  'DynamicField' => '1',
  'PlannedEffort' => '1',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'WorkOrderAgentID' => '1',
  'WorkOrderNumber' => '1',
  'WorkOrderStateID' => '1',
  'WorkOrderTitle' => '1',
  'WorkOrderTypeID' => '1'
};
$Self->{'ITSMWorkOrder::Attribute::CompareValue::FieldType'} =  {
  'AccountedTime' => 'Text',
  'ActualEndTime' => 'Date',
  'ActualStartTime' => 'Date',
  'DynamicField' => 'Text',
  'PlannedEffort' => 'Text',
  'PlannedEndTime' => 'Date',
  'PlannedStartTime' => 'Date',
  'WorkOrderAgentID' => 'Selection',
  'WorkOrderNumber' => 'Text',
  'WorkOrderStateID' => 'Selection',
  'WorkOrderTitle' => 'Text',
  'WorkOrderTypeID' => 'Selection'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'DynamicField'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'AccountedTime'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'PlannedEffort'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'ActualEndTime'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'ActualStartTime'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'PlannedEndTime'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'PlannedStartTime'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'RequestedTime'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'ChangeBuilderID'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'ChangeManagerID'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'PriorityID'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'ImpactID'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'CategoryID'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'ChangeTitle'} =  {
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Attribute::Operator'}->{'ChangeStateID'} =  {
  'lock' => '1',
  'set' => '1'
};
$Self->{'ITSMChange::Mapping::Action::Object::Attribute'} =  {
  'AccountedTime' => '0',
  'ActualEndTime' => '0',
  'ActualStartTime' => '0',
  'CategoryID' => '1',
  'ChangeBuilderID' => '0',
  'ChangeManagerID' => '1',
  'ChangeStateID' => '1',
  'ChangeTitle' => '0',
  'DynamicField' => '1',
  'ImpactID' => '1',
  'PlannedEffort' => '0',
  'PlannedEndTime' => '0',
  'PlannedStartTime' => '0',
  'PriorityID' => '1',
  'RequestedTime' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'DynamicField'} =  {
  'begins with' => '1',
  'contains' => '1',
  'ends with' => '1',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '1',
  'is greater than' => '1',
  'is less than' => '1',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '1'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'AccountedTime'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '1',
  'is greater than' => '1',
  'is less than' => '1',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'PlannedEffort'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '1',
  'is greater than' => '1',
  'is less than' => '1',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'ActualEndTime'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '1',
  'is before' => '1',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'ActualStartTime'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '1',
  'is before' => '1',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'PlannedEndTime'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '1',
  'is before' => '1',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'PlannedStartTime'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '1',
  'is before' => '1',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'RequestedTime'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '1',
  'is before' => '1',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'ChangeBuilderID'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '0',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '0',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'ChangeManagerID'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'PriorityID'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '0',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '0',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'ImpactID'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '0',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '0',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'CategoryID'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '0',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '0',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'ChangeTitle'} =  {
  'begins with' => '1',
  'contains' => '1',
  'ends with' => '1',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '1',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '1',
  'not contains' => '1'
};
$Self->{'ITSMChange::Mapping::Expression::Attribute::Operator'}->{'ChangeStateID'} =  {
  'begins with' => '0',
  'contains' => '0',
  'ends with' => '0',
  'is' => '1',
  'is after' => '0',
  'is before' => '0',
  'is empty' => '0',
  'is greater than' => '0',
  'is less than' => '0',
  'is not' => '1',
  'is not empty' => '0',
  'not contains' => '0'
};
$Self->{'ITSMChange::Mapping::Expression::Object::Attribute'} =  {
  'AccountedTime' => '1',
  'ActualEndTime' => '1',
  'ActualStartTime' => '1',
  'CategoryID' => '1',
  'ChangeBuilderID' => '1',
  'ChangeManagerID' => '1',
  'ChangeStateID' => '1',
  'ChangeTitle' => '1',
  'DynamicField' => '1',
  'ImpactID' => '1',
  'PlannedEffort' => '1',
  'PlannedEndTime' => '1',
  'PlannedStartTime' => '1',
  'PriorityID' => '1',
  'RequestedTime' => '1'
};
$Self->{'ITSMChange::Attribute::CompareValue::FieldType'} =  {
  'AccountedTime' => 'Text',
  'ActualEndTime' => 'Date',
  'ActualStartTime' => 'Date',
  'CategoryID' => 'Selection',
  'ChangeBuilderID' => 'Selection',
  'ChangeManagerID' => 'Selection',
  'ChangeStateID' => 'Selection',
  'ChangeTitle' => 'Text',
  'DynamicField' => 'Text',
  'ImpactID' => 'Selection',
  'PlannedEffort' => 'Text',
  'PlannedEndTime' => 'Date',
  'PlannedStartTime' => 'Date',
  'PriorityID' => 'Selection',
  'RequestedTime' => 'Date'
};
$Self->{'ITSMChange::Impact::Default'} =  '3 normal';
$Self->{'ITSMChange::Category::Default'} =  '3 normal';
$Self->{'ITSMChange::State::Signal'} =  {
  'approved' => 'greenled',
  'canceled' => 'redled',
  'failed' => 'redled',
  'in progress' => 'yellowled',
  'pending approval' => 'yellowled',
  'pending pir' => 'yellowled',
  'rejected' => 'redled',
  'requested' => 'grayled',
  'retracted' => 'grayled',
  'successful' => 'greenled'
};
$Self->{'ITSMChange::StateLock::AllowEndStates'} =  '1';
$Self->{'ITSMChange::Hook'} =  'Change#';
$Self->{'ITSMChange::CounterLog'} =  '<OTRS_CONFIG_Home>/var/log/ITSMChangeCounter.log';
$Self->{'ITSMChange::RestrictTicketTypes::Groups'} =  [
  'itsm-change',
  'itsm-change-builder',
  'itsm-change-manager'
];
$Self->{'ITSMChange::AddChangeLinkTicketTypes'} =  [
  'RfC'
];
$Self->{'ITSMChange::ToolBar::CacheTTL'} =  '180';
$Self->{'ITSMChange::CacheTTL'} =  '7200';
$Self->{'DynamicFields::ObjectType'}->{'ITSMWorkOrder'} =  {
  'DisplayName' => 'ITSMWorkOrder',
  'Module' => 'Kernel::System::DynamicField::ObjectType::ITSMWorkOrder',
  'Prio' => '460'
};
$Self->{'DynamicFields::ObjectType'}->{'ITSMChange'} =  {
  'DisplayName' => 'ITSMChange',
  'Module' => 'Kernel::System::DynamicField::ObjectType::ITSMChange',
  'Prio' => '450'
};
$Self->{'ITSMChange::ChangeSearch::MirrorDB'} =  '0';
$Self->{'ITSMCondition::EventModule'}->{'02-Notification'} =  {
  'Event' => '(ActionExecutePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::Notification',
  'Transaction' => '0'
};
$Self->{'ITSMCondition::EventModule'}->{'01-HistoryAdd'} =  {
  'Event' => '(ConditionAddPost|ConditionUpdatePost|ConditionDeletePost|ConditionDeleteAllPost|ExpressionAddPost|ExpressionUpdatePost|ExpressionDeletePost|ExpressionDeleteAllPost|ActionAddPost|ActionUpdatePost|ActionDeletePost|ActionDeleteAllPost|ActionExecutePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::HistoryAdd',
  'Transaction' => '0'
};
$Self->{'ITSMChangeManagementNotification::EventModule'}->{'01-HistoryAdd'} =  {
  'Event' => '(ChangeNotificationSentPost|WorkOrderNotificationSentPost)',
  'Module' => 'Kernel::System::ITSMChange::Event::HistoryAdd',
  'Transaction' => '0'
};
$Self->{'ITSMChangeCronjob::EventModule'}->{'03-Condition'} =  {
  'Event' => '(ChangePlannedStartTimeReachedPost|ChangePlannedEndTimeReachedPost|ChangeActualStartTimeReachedPost|ChangeActualEndTimeReachedPost|ChangeRequestedTimeReachedPost|WorkOrderPlannedStartTimeReachedPost|WorkOrderPlannedEndTimeReachedPost|WorkOrderActualStartTimeReachedPost|WorkOrderActualEndTimeReachedPost)',
  'Module' => 'Kernel::System::ITSMChange::Event::Condition',
  'Transaction' => '0'
};
$Self->{'ITSMChangeCronjob::EventModule'}->{'02-Notification'} =  {
  'Event' => '(ChangePlannedStartTimeReachedPost|ChangePlannedEndTimeReachedPost|ChangeActualStartTimeReachedPost|ChangeActualEndTimeReachedPost|ChangeRequestedTimeReachedPost|WorkOrderPlannedStartTimeReachedPost|WorkOrderPlannedEndTimeReachedPost|WorkOrderActualStartTimeReachedPost|WorkOrderActualEndTimeReachedPost)',
  'Module' => 'Kernel::System::ITSMChange::Event::Notification',
  'Transaction' => '0'
};
$Self->{'ITSMChangeCronjob::EventModule'}->{'01-HistoryAdd'} =  {
  'Event' => '(ChangePlannedStartTimeReachedPost|ChangePlannedEndTimeReachedPost|ChangeActualStartTimeReachedPost|ChangeActualEndTimeReachedPost|ChangeRequestedTimeReachedPost|WorkOrderPlannedStartTimeReachedPost|WorkOrderPlannedEndTimeReachedPost|WorkOrderActualStartTimeReachedPost|WorkOrderActualEndTimeReachedPost)',
  'Module' => 'Kernel::System::ITSMChange::Event::HistoryAdd',
  'Transaction' => '0'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'ITSMChangesCheck'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Admin::ITSM::Change::Check',
  'Params' => [],
  'Schedule' => '*/10 * * * *',
  'TaskName' => 'ITSMChangesCheck'
};
$Self->{'ITSMWorkOrder::EventModule'}->{'80-ToolBarMyWorkOrdersCacheDelete'} =  {
  'Event' => '(WorkOrderAddPost|WorkOrderUpdatePost|WorkOrderDeletePost)',
  'Module' => 'Kernel::System::ITSMChange::ITSMWorkOrder::Event::ToolBarMyWorkOrdersCacheDelete',
  'Transaction' => '0'
};
$Self->{'ITSMWorkOrder::EventModule'}->{'05-Condition'} =  {
  'Event' => '(WorkOrderAddPost|WorkOrderUpdatePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::Condition',
  'Transaction' => '0'
};
$Self->{'ITSMWorkOrder::EventModule'}->{'04-Notification'} =  {
  'Event' => '(WorkOrderAddPost|WorkOrderUpdatePost|WorkOrderDeletePost|WorkOrderLinkAddPost|WorkOrderLinkDeletePost|WorkOrderAttachmentAddPost|WorkOrderAttachmentDeletePost|WorkOrderReportAttachmentAddPost|WorkOrderReportAttachmentDeletePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::Notification',
  'Transaction' => '0'
};
$Self->{'ITSMWorkOrder::EventModule'}->{'03-HistoryAdd'} =  {
  'Event' => '(WorkOrderAddPost|WorkOrderUpdatePost|WorkOrderDeletePost|WorkOrderLinkAddPost|WorkOrderLinkDeletePost|WorkOrderAttachmentAddPost|WorkOrderAttachmentDeletePost|WorkOrderReportAttachmentAddPost|WorkOrderReportAttachmentDeletePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::HistoryAdd',
  'Transaction' => '0'
};
$Self->{'ITSMWorkOrder::EventModule'}->{'02-WorkOrderActualTimesSet'} =  {
  'Event' => 'WorkOrderUpdatePost',
  'Module' => 'Kernel::System::ITSMChange::ITSMWorkOrder::Event::WorkOrderActualTimesSet',
  'Transaction' => '0'
};
$Self->{'ITSMWorkOrder::EventModule'}->{'01-WorkOrderNumberCalc'} =  {
  'Event' => '(WorkOrderUpdatePost|WorkOrderDeletePost)',
  'Module' => 'Kernel::System::ITSMChange::ITSMWorkOrder::Event::WorkOrderNumberCalc',
  'Transaction' => '0'
};
$Self->{'ITSMChange::EventModule'}->{'91-HistoryDelete'} =  {
  'Event' => '(ChangeDeletePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::HistoryDelete',
  'Transaction' => '0'
};
$Self->{'ITSMChange::EventModule'}->{'90-ConditionDelete'} =  {
  'Event' => '(ChangeDeletePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::ConditionDelete',
  'Transaction' => '0'
};
$Self->{'ITSMChange::EventModule'}->{'82-ToolBarMyCABCacheDelete'} =  {
  'Event' => '(ChangeCABUpdatePost|ChangeCABDeletePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::ToolBarMyCABCacheDelete',
  'Transaction' => '0'
};
$Self->{'ITSMChange::EventModule'}->{'81-ToolBarMyChangesCacheDelete'} =  {
  'Event' => '(ChangeAddPost|ChangeUpdatePost|ChangeDeletePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::ToolBarMyChangesCacheDelete',
  'Transaction' => '0'
};
$Self->{'ITSMChange::EventModule'}->{'80-ToolBarChangeManagerCacheDelete'} =  {
  'Event' => '(ChangeAddPost|ChangeUpdatePost|ChangeDeletePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::ToolBarChangeManagerCacheDelete',
  'Transaction' => '0'
};
$Self->{'ITSMChange::EventModule'}->{'03-Condition'} =  {
  'Event' => '(ChangeAddPost|ChangeUpdatePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::Condition',
  'Transaction' => '0'
};
$Self->{'ITSMChange::EventModule'}->{'02-Notification'} =  {
  'Event' => '(ChangeAddPost|ChangeUpdatePost|ChangeCABUpdatePost|ChangeCABDeletePost|ChangeDeletePost|ChangeLinkAddPost|ChangeLinkDeletePost|ChangeAttachmentAddPost|ChangeAttachmentDeletePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::Notification',
  'Transaction' => '0'
};
$Self->{'ITSMChange::EventModule'}->{'01-HistoryAdd'} =  {
  'Event' => '(ChangeAddPost|ChangeUpdatePost|ChangeCABUpdatePost|ChangeCABDeletePost|ChangeLinkAddPost|ChangeLinkDeletePost|ChangeAttachmentAddPost|ChangeAttachmentDeletePost)',
  'Module' => 'Kernel::System::ITSMChange::Event::HistoryAdd',
  'Transaction' => '0'
};
$Self->{'DynamicField::EventModulePost'}->{'100-UpdateITSMChangeConditions'} =  {
  'Event' => '(DynamicFieldAdd|DynamicFieldUpdate|DynamicFieldDelete)',
  'Module' => 'Kernel::System::DynamicField::Event::UpdateITSMChangeConditions',
  'Transaction' => '0'
};
$Self->{'LinkObject::ComplexTable'}->{'ITSMWorkOrder'} =  {
  'DefaultColumns' => {
    'AccountedTime' => '1',
    'ActualEndTime' => '1',
    'ActualStartTime' => '1',
    'ChangeTime' => '2',
    'CreateTime' => '1',
    'PlannedEffort' => '1',
    'PlannedEndTime' => '1',
    'PlannedStartTime' => '1',
    'WorkOrderState' => '2',
    'WorkOrderTitle' => '2',
    'WorkOrderType' => '2'
  },
  'Module' => 'Kernel::Output::HTML::LinkObject::ITSMWorkOrder.pm',
  'Priority' => {
    'AccountedTime' => '180',
    'ActualEndTime' => '160',
    'ActualStartTime' => '150',
    'ChangeTime' => '200',
    'CreateTime' => '190',
    'PlannedEffort' => '170',
    'PlannedEndTime' => '140',
    'PlannedStartTime' => '130',
    'WorkOrderState' => '110',
    'WorkOrderTitle' => '100',
    'WorkOrderType' => '120'
  }
};
$Self->{'LinkObject::ComplexTable'}->{'ITSMChange'} =  {
  'DefaultColumns' => {
    'AccountedTime' => '1',
    'ActualEndTime' => '1',
    'ActualStartTime' => '1',
    'Category' => '2',
    'ChangeState' => '2',
    'ChangeTime' => '2',
    'ChangeTitle' => '2',
    'CreateTime' => '1',
    'Impact' => '2',
    'PlannedEffort' => '1',
    'PlannedEndTime' => '1',
    'PlannedStartTime' => '1',
    'Priority' => '2',
    'RequestedTime' => '1'
  },
  'Module' => 'Kernel::Output::HTML::LinkObject::ITSMChange.pm',
  'Priority' => {
    'AccountedTime' => '200',
    'ActualEndTime' => '180',
    'ActualStartTime' => '170',
    'Category' => '120',
    'ChangeState' => '110',
    'ChangeTime' => '230',
    'ChangeTitle' => '100',
    'CreateTime' => '220',
    'Impact' => '130',
    'PlannedEffort' => '190',
    'PlannedEndTime' => '160',
    'PlannedStartTime' => '150',
    'Priority' => '140',
    'RequestedTime' => '210'
  }
};
$Self->{'LinkObject::ComplexTable::SettingsVisibility'}->{'ITSMChangeManagement'} =  [
  'AgentITSMChangeZoom',
  'AgentITSMWorkOrderZoom'
];
$Self->{'ITSMWorkOrder::Frontend::MenuModule'}->{'090-WorkOrderDelete'} =  {
  'Action' => 'AgentITSMWorkOrderDelete',
  'ConfirmedActionQueryString' => 'Action=AgentITSMWorkOrderDelete;Subaction=WorkOrderDelete;WorkOrderID=[% Data.WorkOrderID | html %]',
  'Description' => 'Delete the workorder.',
  'DialogContentQueryString' => 'Action=AgentITSMWorkOrderDelete;WorkOrderID=[% Data.WorkOrderID | html %]',
  'DialogTitle' => '[% Translate("Delete") | html %] [% Config("ITSMWorkOrder::Hook") %] [% Data.ChangeNumber | html %]-[% Data.WorkOrderNumber | html %]',
  'ElementSelector' => '#Menu[% Data.MenuID | html %]',
  'Link' => 'Action=AgentITSMWorkOrderDelete;WorkOrderID=[% Data.WorkOrderID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMWorkOrder::MenuWithPermissionFromChange',
  'Name' => 'Delete',
  'Target' => 'ConfirmDialog'
};
$Self->{'ITSMWorkOrder::Frontend::MenuModule'}->{'080-Template'} =  {
  'Action' => 'AgentITSMWorkOrderTemplate',
  'Description' => 'Save workorder as a template.',
  'Link' => 'Action=AgentITSMWorkOrderTemplate;WorkOrderID=[% Data.WorkOrderID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMWorkOrder::MenuWithPermissionFromChange',
  'Name' => 'Template',
  'Target' => 'PopUp'
};
$Self->{'ITSMWorkOrder::Frontend::MenuModule'}->{'060-Link'} =  {
  'Action' => 'AgentLinkObject',
  'Description' => 'Link another object to the workorder.',
  'Link' => 'Action=AgentLinkObject;SourceObject=ITSMWorkOrder;SourceKey=[% Data.WorkOrderID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMWorkOrder::MenuGeneric',
  'Name' => 'Link',
  'Target' => 'PopUp'
};
$Self->{'ITSMWorkOrder::Frontend::MenuModule'}->{'050-Report'} =  {
  'Action' => 'AgentITSMWorkOrderReport',
  'Description' => 'Report',
  'Link' => 'Action=AgentITSMWorkOrderReport;WorkOrderID=[% Data.WorkOrderID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMWorkOrder::MenuGeneric',
  'Name' => 'Report',
  'Target' => 'PopUp'
};
$Self->{'ITSMWorkOrder::Frontend::MenuModule'}->{'040-WorkOrderAgent'} =  {
  'Action' => 'AgentITSMWorkOrderAgent',
  'Description' => 'Set the agent for the workorder.',
  'Link' => 'Action=AgentITSMWorkOrderAgent;WorkOrderID=[% Data.WorkOrderID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMWorkOrder::MenuWithPermissionFromChange',
  'Name' => 'Workorder Agent',
  'Target' => 'PopUp'
};
$Self->{'ITSMWorkOrder::Frontend::MenuModule'}->{'035-Take'} =  {
  'Action' => 'AgentITSMWorkOrderTake',
  'ConfirmedActionQueryString' => 'Action=AgentITSMWorkOrderTake;Subaction=WorkOrderTake;WorkOrderID=[% Data.WorkOrderID | html %]',
  'Description' => 'Take the workorder.',
  'DialogContentQueryString' => 'Action=AgentITSMWorkOrderTake;WorkOrderID=[% Data.WorkOrderID | html %]',
  'DialogTitle' => '[% Translate("Take Workorder") | html %]: [% Config("ITSMWorkOrder::Hook") %] [% Data.ChangeNumber | html %] - [% Data.WorkOrderNumber | html %]',
  'ElementSelector' => '#Menu[% Data.MenuID | html %]',
  'Link' => 'Action=AgentITSMWorkOrderTake;WorkOrderID=[% Data.WorkOrderID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMWorkOrder::MenuWithTakePermission',
  'Name' => 'Take Workorder',
  'Target' => 'ConfirmDialog'
};
$Self->{'ITSMWorkOrder::Frontend::MenuModule'}->{'030-Edit'} =  {
  'Action' => 'AgentITSMWorkOrderEdit',
  'Description' => 'Edit the workorder.',
  'Link' => 'Action=AgentITSMWorkOrderEdit;WorkOrderID=[% Data.WorkOrderID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMWorkOrder::MenuWithPermissionFromChange',
  'Name' => 'Edit',
  'Target' => 'PopUp'
};
$Self->{'ITSMWorkOrder::Frontend::MenuModule'}->{'020-Print'} =  {
  'Action' => 'AgentITSMChangePrint',
  'Description' => 'Print the workorder.',
  'Link' => 'Action=AgentITSMChangePrint;WorkOrderID=[% Data.WorkOrderID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMWorkOrder::MenuGeneric',
  'Name' => 'Print',
  'Target' => 'PopUp'
};
$Self->{'ITSMWorkOrder::Frontend::MenuModule'}->{'010-History'} =  {
  'Action' => 'AgentITSMWorkOrderHistory',
  'Description' => 'History',
  'Link' => 'Action=AgentITSMWorkOrderHistory;WorkOrderID=[% Data.WorkOrderID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMWorkOrder::MenuGeneric',
  'Name' => 'History',
  'Target' => 'PopUp'
};
$Self->{'ITSMWorkOrder::Frontend::MenuModule'}->{'000-Back'} =  {
  'Action' => '',
  'Description' => 'Back',
  'Link' => '[% Env("LastScreenWorkOrders") %]',
  'Module' => 'Kernel::Output::HTML::ITSMWorkOrder::MenuGeneric',
  'Name' => 'Back',
  'Target' => 'Back'
};
$Self->{'ITSMChange::Frontend::MenuModule'}->{'090-Template'} =  {
  'Action' => 'AgentITSMChangeTemplate',
  'Description' => 'Save change as a template.',
  'Link' => 'Action=AgentITSMChangeTemplate;ChangeID=[% Data.ChangeID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMChange::MenuGeneric',
  'Name' => 'Template',
  'Target' => 'PopUp'
};
$Self->{'ITSMChange::Frontend::MenuModule'}->{'080-MoveTimeSlot'} =  {
  'Action' => 'AgentITSMChangeTimeSlot',
  'Description' => 'Move all workorders in time.',
  'Link' => 'Action=AgentITSMChangeTimeSlot;ChangeID=[% Data.ChangeID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMChange::MenuTimeSlot',
  'Name' => 'Move Time Slot',
  'Target' => 'PopUp'
};
$Self->{'ITSMChange::Frontend::MenuModule'}->{'070-Link'} =  {
  'Action' => 'AgentLinkObject',
  'Description' => 'Link another object to the change.',
  'Link' => 'Action=AgentLinkObject;SourceObject=ITSMChange;SourceKey=[% Data.ChangeID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMChange::MenuGeneric',
  'Name' => 'Link',
  'Target' => 'PopUp'
};
$Self->{'ITSMChange::Frontend::MenuModule'}->{'060-Conditions'} =  {
  'Action' => 'AgentITSMChangeCondition',
  'Description' => 'Edit the conditions of the change.',
  'Link' => 'Action=AgentITSMChangeCondition;ChangeID=[% Data.ChangeID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMChange::MenuGeneric',
  'Name' => 'Conditions',
  'Target' => 'PopUp'
};
$Self->{'ITSMChange::Frontend::MenuModule'}->{'055-WorkOrderAddFromTemplate'} =  {
  'Action' => 'AgentITSMWorkOrderAddFromTemplate',
  'Description' => 'Add a workorder (from template) to the change.',
  'Link' => 'Action=AgentITSMWorkOrderAddFromTemplate;ChangeID=[% Data.ChangeID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMChange::MenuGeneric',
  'Name' => 'Add Workorder (from Template)',
  'Target' => 'PopUp'
};
$Self->{'ITSMChange::Frontend::MenuModule'}->{'050-WorkOrderAdd'} =  {
  'Action' => 'AgentITSMWorkOrderAdd',
  'Description' => 'Add a workorder to the change.',
  'Link' => 'Action=AgentITSMWorkOrderAdd;ChangeID=[% Data.ChangeID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMChange::MenuGeneric',
  'Name' => 'Add Workorder',
  'Target' => 'PopUp'
};
$Self->{'ITSMChange::Frontend::MenuModule'}->{'040-InvolvedPersons'} =  {
  'Action' => 'AgentITSMChangeInvolvedPersons',
  'Description' => 'Change involved persons of the change.',
  'Link' => 'Action=AgentITSMChangeInvolvedPersons;ChangeID=[% Data.ChangeID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMChange::MenuGeneric',
  'Name' => 'Involved Persons',
  'Target' => 'PopUp'
};
$Self->{'ITSMChange::Frontend::MenuModule'}->{'030-Edit'} =  {
  'Action' => 'AgentITSMChangeEdit',
  'Description' => 'Edit the change.',
  'Link' => 'Action=AgentITSMChangeEdit;ChangeID=[% Data.ChangeID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMChange::MenuGeneric',
  'Name' => 'Edit',
  'Target' => 'PopUp'
};
$Self->{'ITSMChange::Frontend::MenuModule'}->{'020-Print'} =  {
  'Action' => 'AgentITSMChangePrint',
  'Description' => 'Print the change.',
  'Link' => 'Action=AgentITSMChangePrint;ChangeID=[% Data.ChangeID | html %]',
  'LinkParam' => 'target="print_change"',
  'Module' => 'Kernel::Output::HTML::ITSMChange::MenuGeneric',
  'Name' => 'Print',
  'Target' => 'PopUp'
};
$Self->{'ITSMChange::Frontend::MenuModule'}->{'010-History'} =  {
  'Action' => 'AgentITSMChangeHistory',
  'Description' => 'History',
  'Link' => 'Action=AgentITSMChangeHistory;ChangeID=[% Data.ChangeID | html %]',
  'Module' => 'Kernel::Output::HTML::ITSMChange::MenuGeneric',
  'Name' => 'History',
  'Target' => 'PopUp'
};
$Self->{'ITSMChange::Frontend::MenuModule'}->{'000-Back'} =  {
  'Action' => '',
  'Description' => 'Back',
  'Link' => '[% Env("LastScreenChanges") %]',
  'Module' => 'Kernel::Output::HTML::ITSMChange::MenuGeneric',
  'Name' => 'Back',
  'Target' => 'Back'
};
$Self->{'Ticket::Frontend::MenuModule'}->{'317-ITSMChangeAdd'} =  {
  'Action' => 'AgentITSMChangeAdd',
  'Description' => 'Create a change from this ticket.',
  'Link' => 'Action=AgentITSMChangeAdd;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::ITSMChange',
  'Name' => 'Create Change'
};
$Self->{'ITSMChange::Frontend::TemplateOverview'}->{'Small'} =  {
  'Module' => 'Kernel::Output::HTML::ITSMTemplate::OverviewSmall',
  'Name' => 'Small',
  'NameShort' => 'S',
  'PageShown' => '25'
};
$Self->{'ITSMChange::Frontend::Overview'}->{'Small'} =  {
  'Module' => 'Kernel::Output::HTML::ITSMChange::OverviewSmall',
  'Name' => 'Small',
  'NameShort' => 'S',
  'PageShown' => '25'
};
$Self->{'Frontend::ToolBarModule'}->{'104-ITSMChangeManagement::MyCAB'} =  {
  'CssClass' => 'MyCABs',
  'Icon' => 'fa fa-group',
  'Module' => 'Kernel::Output::HTML::ToolBar::MyCAB',
  'Priority' => '1000620'
};
$Self->{'Frontend::ToolBarModule'}->{'103-ITSMChangeManagement::MyWorkOrders'} =  {
  'CssClass' => 'MyWorkOrders',
  'Icon' => 'fa fa-tasks',
  'Module' => 'Kernel::Output::HTML::ToolBar::MyWorkOrders',
  'Priority' => '1000640'
};
$Self->{'Frontend::ToolBarModule'}->{'102-ITSMChangeManagement::MyChanges'} =  {
  'CssClass' => 'MyChanges',
  'Icon' => 'fa fa-retweet',
  'Module' => 'Kernel::Output::HTML::ToolBar::MyChanges',
  'Priority' => '1000630'
};
$Self->{'Frontend::ToolBarModule'}->{'101-ITSMChangeManagement::ChangeManager'} =  {
  'CssClass' => 'ChangeManager',
  'Icon' => 'fa fa-male',
  'Module' => 'Kernel::Output::HTML::ToolBar::ChangeManager',
  'Priority' => '1000610'
};
$Self->{'Frontend::Module'}->{'AgentITSMWorkOrderZoom'} =  {
  'Description' => 'Workorder Zoom.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css',
      'ITSM.ChangeManagement.Default.css',
      'ITSM.ChangeManagement.RTEContent.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.UI.Table.Sort.js',
      'Core.Agent.TableFilters.js',
      'Core.Agent.LinkObject.js',
      'ITSM.Agent.ChangeManagement.Zoom.js',
      'ITSM.Agent.ConfirmDialog.js'
    ]
  },
  'NavBarName' => 'ITSM Change',
  'Title' => 'Zoom'
};
$Self->{'Frontend::Module'}->{'AgentITSMWorkOrderTemplate'} =  {
  'Description' => 'Template.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Template'
};
$Self->{'Frontend::Module'}->{'AgentITSMWorkOrderTake'} =  {
  'Description' => 'Take Workorder.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Take Workorder'
};
$Self->{'Frontend::Module'}->{'AgentITSMWorkOrderReport'} =  {
  'Description' => 'Workorder Report.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Report'
};
$Self->{'Frontend::Module'}->{'AgentITSMWorkOrderHistoryZoom'} =  {
  'Description' => 'Workorder History Zoom.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'History Zoom'
};
$Self->{'Frontend::Module'}->{'AgentITSMWorkOrderHistory'} =  {
  'Description' => 'Workorder History.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'History'
};
$Self->{'Frontend::Module'}->{'AgentITSMWorkOrderEdit'} =  {
  'Description' => 'Workorder Edit.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Edit'
};
$Self->{'Frontend::Module'}->{'AgentITSMWorkOrderDelete'} =  {
  'Description' => 'Workorder Delete.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Delete'
};
$Self->{'Frontend::Module'}->{'AgentITSMWorkOrderAgent'} =  {
  'Description' => 'Workorder Agent.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Agent'
};
$Self->{'Frontend::Module'}->{'AgentITSMWorkOrderAddFromTemplate'} =  {
  'Description' => 'Workorder Add (from template).',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Add'
};
$Self->{'Frontend::Module'}->{'AgentITSMWorkOrderAdd'} =  {
  'Description' => 'Workorder Add.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Add'
};
$Self->{'Frontend::Module'}->{'AgentITSMUserSearch'} =  {
  'Description' => 'Lookup of agents, used for autocompletion.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'User Search'
};
$Self->{'Frontend::Module'}->{'AgentITSMTemplateOverview'} =  {
  'Description' => 'ITSM Template Overview.',
  'GroupRo' => [
    'itsm-change-builder',
    'itsm-change-manager'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.ChangeManagement.Default.css'
    ],
    'JavaScript' => [
      'ITSM.Agent.ConfirmDialog.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Template Overview',
      'Link' => 'Action=AgentITSMTemplateOverview',
      'Name' => 'Templates',
      'NavBar' => 'ITSM Change',
      'Prio' => '500',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMTemplateEditContent'} =  {
  'Description' => 'ITSM Template Edit Content.',
  'GroupRo' => [
    'itsm-change-builder',
    'itsm-change-manager'
  ],
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMTemplateEditCAB'} =  {
  'Description' => 'ITSM Template Edit CAB.',
  'GroupRo' => [
    'itsm-change-builder',
    'itsm-change-manager'
  ],
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMTemplateEdit'} =  {
  'Description' => 'ITSM Template Edit.',
  'GroupRo' => [
    'itsm-change-builder',
    'itsm-change-manager'
  ],
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMTemplateDelete'} =  {
  'Description' => 'ITSM Template Delete.',
  'GroupRo' => [
    'itsm-change-builder',
    'itsm-change-manager'
  ],
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeZoom'} =  {
  'Description' => 'Change Zoom.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css',
      'Core.AllocationList.css',
      'ITSM.ChangeManagement.Default.css',
      'ITSM.ChangeManagement.Responsive.css',
      'ITSM.ChangeManagement.WorkorderGraph.css',
      'ITSM.ChangeManagement.RTEContent.css'
    ],
    'JavaScript' => [
      'thirdparty/jquery-tablesorter-2.0.5/jquery.tablesorter.js',
      'ITSM.Agent.ChangeManagement.WorkorderGraph.js',
      'ITSM.Agent.ChangeManagement.Zoom.js',
      'Core.UI.AllocationList.js',
      'Core.UI.Table.Sort.js',
      'Core.Agent.TableFilters.js',
      'Core.Agent.LinkObject.js',
      'ITSM.Agent.ConfirmDialog.js'
    ]
  },
  'NavBarName' => 'ITSM Change',
  'Title' => 'Zoom'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeTimeSlot'} =  {
  'Description' => 'Move Time Slot.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Time Slot'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeTemplate'} =  {
  'Description' => 'Template.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Template'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeSearch'} =  {
  'Description' => 'Search Changes.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Search Changes',
      'Link' => 'Action=AgentITSMChangeSearch',
      'LinkOption' => 'onclick="ITSM.Agent.ChangeManagement.Search.OpenSearchDialog(\'AgentITSMChangeSearch\'); if (event.stopPropagation) { event.stopPropagation(); } else { window.event.cancelBubble = true; } return false;"',
      'Name' => 'Search',
      'NavBar' => 'ITSM Change',
      'Prio' => '600',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Search'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeSchedule'} =  {
  'Description' => 'Forward schedule of changes. Overview over approved changes.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Change Schedule',
      'Link' => 'Action=AgentITSMChangeSchedule',
      'Name' => 'Schedule',
      'NavBar' => 'ITSM Change',
      'Prio' => '300',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Change Schedule'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangePSA'} =  {
  'Description' => 'Projected Service Availability (PSA) of changes. Overview of approved changes and their services.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Projected Service Availability (PSA)',
      'Link' => 'Action=AgentITSMChangePSA',
      'Name' => 'Projected Service Availability',
      'NavBar' => 'ITSM Change',
      'Prio' => '350',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'PSA'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangePrint'} =  {
  'Description' => 'Change Print.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Print'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangePIR'} =  {
  'Description' => 'ITSM Change PIR Overview.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'PIR (Post Implementation Review)',
      'Link' => 'Action=AgentITSMChangePIR',
      'Name' => 'PIR',
      'NavBar' => 'ITSM Change',
      'Prio' => '400',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'ITSM Change'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerITSMChangeMyWorkOrders'} =  {
  'Description' => 'ITSM MyWorkorders Overview.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'ITSM MyWorkorders Overview',
      'Link' => 'Action=CustomerITSMChangeMyWorkOrders',
      'Name' => 'My Task',
      'NavBar' => 'My Task',
      'Prio' => '8495',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'My Task'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerITSMWorkOrderZoom'} =  {
  'Description' => 'ITSM MyWorkOrders Overview.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBarName' => 'ITSM Change',
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeMyWorkOrders'} =  {
  'Description' => 'ITSM MyWorkorders Overview.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBarName' => 'ITSM Change',
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeMyChanges'} =  {
  'Description' => 'ITSM MyChanges Overview.',
  'GroupRo' => [
    'itsm-change-builder',
    'itsm-change-manager'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBarName' => 'ITSM Change',
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeMyCAB'} =  {
  'Description' => 'ITSM MyCAB Overview.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBarName' => 'ITSM Change',
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeManager'} =  {
  'Description' => 'ITSM Change Manager Overview.',
  'GroupRo' => [
    'itsm-change-manager'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBarName' => 'ITSM Change',
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeInvolvedPersons'} =  {
  'Description' => 'Change Involved Persons.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Involved Persons'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeHistoryZoom'} =  {
  'Description' => 'Details of a change history entry.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'History Zoom'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeHistory'} =  {
  'Description' => 'Change History.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'History'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeEdit'} =  {
  'Description' => 'Edit a change.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Edit'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeConditionEdit'} =  {
  'Description' => 'ITSM Change Condition Edit.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Table.css'
    ]
  },
  'NavBarName' => 'ITSM Change',
  'Title' => 'Condition Edit'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeCondition'} =  {
  'Description' => 'ITSM Change Condition Overview.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Condition Overview'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeCABTemplate'} =  {
  'Description' => 'ITSM Change CAB Templates.',
  'GroupRo' => [
    'itsm-change'
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Change CAB Templates'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeAddFromTemplate'} =  {
  'Description' => 'Add a change from template.',
  'GroupRo' => [
    'itsm-change-builder',
    'itsm-change-manager'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'New (from template)',
      'Link' => 'Action=AgentITSMChangeAddFromTemplate',
      'Name' => 'New (from template)',
      'NavBar' => 'ITSM Change',
      'Prio' => '250',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Add from template'
};
$Self->{'Frontend::Module'}->{'AgentITSMChangeAdd'} =  {
  'Description' => 'Add a change.',
  'GroupRo' => [
    'itsm-change-manager'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'New',
      'Link' => 'Action=AgentITSMChangeAdd',
      'Name' => 'New',
      'NavBar' => 'ITSM Change',
      'Prio' => '200',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'Add'
};
$Self->{'Frontend::Module'}->{'AgentITSMChange'} =  {
  'Description' => 'Overview over all Changes.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Agent.Default.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => 'ItemArea',
      'Description' => 'Change area.',
      'Link' => 'Action=AgentITSMChange',
      'Name' => 'ITSM Changes',
      'NavBar' => 'ITSM Change',
      'Prio' => '3400',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Change Overview.',
      'Link' => 'Action=AgentITSMChange',
      'Name' => 'Overview',
      'NavBar' => 'ITSM Change',
      'Prio' => '100',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'ITSM Changes'
};
$Self->{'Frontend::Module'}->{'AgentITSMCABMemberSearch'} =  {
  'Description' => 'Lookup of CAB members for autocompletion.',
  'GroupRo' => [
    'itsm-change'
  ],
  'Title' => 'CAB Member Search'
};
$Self->{'Frontend::Module'}->{'AdminITSMStateMachine'} =  {
  'Description' => 'Admin of the state machine.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'State Machine',
    'Prio' => '433'
  },
  'NavBarName' => 'Admin',
  'Title' => 'State Machine'
};
$Self->{'Frontend::Module'}->{'AdminITSMChangeNotification'} =  {
  'Description' => 'Create and manage ITSM Change Management notifications.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.NotificationEvent.css'
    ],
    'JavaScript' => [
      'ITSM.Agent.ChangeManagement.NotificationEvent.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'ITSM Change Management Notifications',
    'Prio' => '406'
  },
  'NavBarName' => 'Admin',
  'Title' => 'ITSM Change notification rules'
};
$Self->{'Frontend::Module'}->{'AdminITSMChangeCIPAllocate'} =  {
  'Description' => 'Admin of the CIP matrix.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.Table.css'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Category <-> Impact <-> Priority',
    'Prio' => '431'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Category <-> Impact <-> Priority'
};
$Self->{'LinkObject::ViewMode'} =  'Complex';
$Self->{'ProductName'} =  'OTRS::ITSM 5s';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'DynamicField'} =  {
  'ITSMCriticality' => '1',
  'ITSMImpact' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Service'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'TicketType'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'DynamicField'} =  {
  'ITSMReviewRequired' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'DynamicField'} =  {
  'ITSMReviewRequired' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'DynamicField'} =  {
  'ITSMImpact' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketZoom'}->{'DynamicField'} =  {
  'ITSMCriticality' => '1',
  'ITSMDecisionDate' => '1',
  'ITSMDecisionResult' => '1',
  'ITSMDueDate' => '1',
  'ITSMImpact' => '1',
  'ITSMRecoveryStartTime' => '1',
  'ITSMRepairStartTime' => '1',
  'ITSMReviewRequired' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'DynamicField'} =  {
  'ITSMDecisionDate' => '1',
  'ITSMDecisionResult' => '1',
  'ITSMDueDate' => '1',
  'ITSMImpact' => '1',
  'ITSMRecoveryStartTime' => '1',
  'ITSMRepairStartTime' => '1',
  'ITSMReviewRequired' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'DynamicField'} =  {
  'ITSMDueDate' => '1',
  'ITSMImpact' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'DynamicField'} =  {
  'ITSMDueDate' => '1',
  'ITSMImpact' => '1'
};
$Self->{'Ticket::Type'} =  '1';
$Self->{'Ticket::Frontend::ZoomCollectMeta'} =  '0';
$Self->{'LinkObject::ComplexTable'}->{'Ticket'} =  {
  'DefaultColumns' => {
    'Age' => '1',
    'Changed' => '1',
    'Created' => '2',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '2',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '2',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Module' => 'Kernel::Output::HTML::LinkObject::Ticket.pm',
  'Priority' => {
    'Age' => '110',
    'Changed' => '120',
    'Created' => '310',
    'CustomerID' => '240',
    'CustomerName' => '250',
    'CustomerUserID' => '260',
    'EscalationResponseTime' => '160',
    'EscalationSolutionTime' => '150',
    'EscalationTime' => '140',
    'EscalationUpdateTime' => '170',
    'Lock' => '200',
    'Owner' => '220',
    'PendingTime' => '130',
    'Priority' => '300',
    'Queue' => '210',
    'Responsible' => '230',
    'SLA' => '290',
    'Service' => '280',
    'State' => '190',
    'TicketNumber' => '100',
    'Title' => '180',
    'Type' => '270'
  }
};
$Self->{'LinkObject::ComplexTable::SettingsVisibility'}->{'Ticket'} =  [
  'AgentTicketZoom'
];
$Self->{'Ticket::Frontend::DefaultSenderDisplayType'} =  'Realname';
$Self->{'Ticket::Frontend::DefaultRecipientDisplayType'} =  'Realname';
$Self->{'Frontend::NavBarModule'}->{'7-AgentTicketService'} =  {
  'Module' => 'Kernel::Output::HTML::NavBar::AgentTicketService'
};
$Self->{'Ticket::Frontend::AgentTicketService'}->{'DefaultColumns'} =  {
  'Age' => '2',
  'Changed' => '1',
  'Created' => '1',
  'CustomerCompanyName' => '1',
  'CustomerID' => '2',
  'CustomerName' => '1',
  'CustomerUserID' => '1',
  'EscalationResponseTime' => '1',
  'EscalationSolutionTime' => '1',
  'EscalationTime' => '1',
  'EscalationUpdateTime' => '1',
  'Lock' => '2',
  'Owner' => '2',
  'PendingTime' => '1',
  'Priority' => '1',
  'Queue' => '2',
  'Responsible' => '1',
  'SLA' => '1',
  'Service' => '2',
  'State' => '2',
  'TicketNumber' => '2',
  'Title' => '2',
  'Type' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'DefaultColumns'} =  {
  'Age' => '2',
  'Changed' => '1',
  'Created' => '1',
  'CustomerCompanyName' => '1',
  'CustomerID' => '2',
  'CustomerName' => '1',
  'CustomerUserID' => '1',
  'EscalationResponseTime' => '1',
  'EscalationSolutionTime' => '1',
  'EscalationTime' => '1',
  'EscalationUpdateTime' => '1',
  'Lock' => '2',
  'Owner' => '2',
  'PendingTime' => '1',
  'Priority' => '1',
  'Queue' => '2',
  'Responsible' => '1',
  'SLA' => '1',
  'Service' => '1',
  'State' => '2',
  'TicketNumber' => '2',
  'Title' => '2',
  'Type' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketEscalationView'}->{'DefaultColumns'} =  {
  'Age' => '2',
  'Changed' => '1',
  'Created' => '1',
  'CustomerCompanyName' => '1',
  'CustomerID' => '2',
  'CustomerName' => '1',
  'CustomerUserID' => '1',
  'EscalationResponseTime' => '1',
  'EscalationSolutionTime' => '1',
  'EscalationTime' => '2',
  'EscalationUpdateTime' => '1',
  'Lock' => '2',
  'Owner' => '2',
  'PendingTime' => '1',
  'Priority' => '1',
  'Queue' => '2',
  'Responsible' => '1',
  'SLA' => '1',
  'Service' => '1',
  'State' => '2',
  'TicketNumber' => '2',
  'Title' => '2',
  'Type' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketLockedView'}->{'DefaultColumns'} =  {
  'Age' => '2',
  'Changed' => '1',
  'Created' => '1',
  'CustomerCompanyName' => '1',
  'CustomerID' => '2',
  'CustomerName' => '1',
  'CustomerUserID' => '1',
  'EscalationResponseTime' => '1',
  'EscalationSolutionTime' => '1',
  'EscalationTime' => '1',
  'EscalationUpdateTime' => '1',
  'Lock' => '2',
  'Owner' => '2',
  'PendingTime' => '1',
  'Priority' => '1',
  'Queue' => '2',
  'Responsible' => '1',
  'SLA' => '1',
  'Service' => '1',
  'State' => '2',
  'TicketNumber' => '2',
  'Title' => '2',
  'Type' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketWatchView'}->{'DefaultColumns'} =  {
  'Age' => '2',
  'Changed' => '1',
  'Created' => '1',
  'CustomerCompanyName' => '1',
  'CustomerID' => '2',
  'CustomerName' => '1',
  'CustomerUserID' => '1',
  'EscalationResponseTime' => '1',
  'EscalationSolutionTime' => '1',
  'EscalationTime' => '1',
  'EscalationUpdateTime' => '1',
  'Lock' => '2',
  'Owner' => '2',
  'PendingTime' => '1',
  'Priority' => '1',
  'Queue' => '2',
  'Responsible' => '1',
  'SLA' => '1',
  'Service' => '1',
  'State' => '2',
  'TicketNumber' => '2',
  'Title' => '2',
  'Type' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketResponsibleView'}->{'DefaultColumns'} =  {
  'Age' => '2',
  'Changed' => '1',
  'Created' => '1',
  'CustomerCompanyName' => '1',
  'CustomerID' => '2',
  'CustomerName' => '1',
  'CustomerUserID' => '1',
  'EscalationResponseTime' => '1',
  'EscalationSolutionTime' => '1',
  'EscalationTime' => '1',
  'EscalationUpdateTime' => '1',
  'Lock' => '2',
  'Owner' => '2',
  'PendingTime' => '1',
  'Priority' => '1',
  'Queue' => '2',
  'Responsible' => '1',
  'SLA' => '1',
  'Service' => '1',
  'State' => '2',
  'TicketNumber' => '2',
  'Title' => '2',
  'Type' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'DefaultColumns'} =  {
  'Age' => '2',
  'Changed' => '1',
  'Created' => '1',
  'CustomerCompanyName' => '1',
  'CustomerID' => '2',
  'CustomerName' => '1',
  'CustomerUserID' => '1',
  'EscalationResponseTime' => '1',
  'EscalationSolutionTime' => '1',
  'EscalationTime' => '1',
  'EscalationUpdateTime' => '1',
  'Lock' => '2',
  'Owner' => '2',
  'PendingTime' => '1',
  'Priority' => '1',
  'Queue' => '2',
  'Responsible' => '1',
  'SLA' => '1',
  'Service' => '1',
  'State' => '2',
  'TicketNumber' => '2',
  'Title' => '2',
  'Type' => '1'
};
$Self->{'Ticket::Frontend::AgentTicketStatusView'}->{'DefaultColumns'} =  {
  'Age' => '2',
  'Changed' => '1',
  'Created' => '1',
  'CustomerCompanyName' => '1',
  'CustomerID' => '2',
  'CustomerName' => '1',
  'CustomerUserID' => '1',
  'EscalationResponseTime' => '1',
  'EscalationSolutionTime' => '1',
  'EscalationTime' => '1',
  'EscalationUpdateTime' => '1',
  'Lock' => '2',
  'Owner' => '2',
  'PendingTime' => '1',
  'Priority' => '1',
  'Queue' => '2',
  'Responsible' => '1',
  'SLA' => '1',
  'Service' => '1',
  'State' => '2',
  'TicketNumber' => '2',
  'Title' => '2',
  'Type' => '1'
};
$Self->{'DefaultOverviewColumns'} =  {
  'Age' => '2',
  'Changed' => '1',
  'CustomerID' => '2',
  'CustomerName' => '1',
  'CustomerUserID' => '1',
  'EscalationResponseTime' => '1',
  'EscalationSolutionTime' => '1',
  'EscalationTime' => '1',
  'EscalationUpdateTime' => '1',
  'Lock' => '2',
  'Owner' => '2',
  'PendingTime' => '1',
  'Priority' => '1',
  'Queue' => '2',
  'Responsible' => '1',
  'SLA' => '1',
  'Service' => '1',
  'State' => '2',
  'TicketNumber' => '2',
  'Title' => '2',
  'Type' => '1'
};
$Self->{'StandardTemplate::Types'} =  {
  'Answer' => 'Answer',
  'Create' => 'Create',
  'Email' => 'Email',
  'Forward' => 'Forward',
  'Note' => 'Note',
  'PhoneCall' => 'Phone call'
};
$Self->{'Ticket::Frontend::AgentTicketMerge'}->{'RichTextHeight'} =  '100';
$Self->{'Ticket::Frontend::AgentTicketMerge'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketEmailOutbound'}->{'RichTextHeight'} =  '300';
$Self->{'Ticket::Frontend::AgentTicketEmailOutbound'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'RichTextHeight'} =  '100';
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'RichTextHeight'} =  '100';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'RichTextHeight'} =  '100';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'RichTextHeight'} =  '100';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'RichTextHeight'} =  '100';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'RichTextHeight'} =  '200';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'RichTextWidth'} =  '475';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'RichTextHeight'} =  '200';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'RichTextWidth'} =  '475';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'RichTextHeight'} =  '320';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'RichTextHeight'} =  '320';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'RichTextHeight'} =  '100';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'RichTextHeight'} =  '100';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'RichTextHeight'} =  '100';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'SearchCSVDynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'SearchOverviewDynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchCSVDynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'Defaults'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketPrint'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketPrint'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'FollowUpDynamicField'} =  {};
$Self->{'Ticket::Frontend::OverviewPreview'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::OverviewMedium'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::OverviewSmall'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketEmailOutbound'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'DynamicField'} =  {};
$Self->{'DynamicFields::Driver'}->{'Multiselect'} =  {
  'ConfigDialog' => 'AdminDynamicFieldMultiselect',
  'DisplayName' => 'Multiselect',
  'ItemSeparator' => ', ',
  'Module' => 'Kernel::System::DynamicField::Driver::Multiselect'
};
$Self->{'DynamicFields::Driver'}->{'Date'} =  {
  'ConfigDialog' => 'AdminDynamicFieldDateTime',
  'DisplayName' => 'Date',
  'Module' => 'Kernel::System::DynamicField::Driver::Date'
};
$Self->{'DynamicFields::Driver'}->{'DateTime'} =  {
  'ConfigDialog' => 'AdminDynamicFieldDateTime',
  'DisplayName' => 'Date / Time',
  'Module' => 'Kernel::System::DynamicField::Driver::DateTime'
};
$Self->{'DynamicFields::Driver'}->{'Dropdown'} =  {
  'ConfigDialog' => 'AdminDynamicFieldDropdown',
  'DisplayName' => 'Dropdown',
  'Module' => 'Kernel::System::DynamicField::Driver::Dropdown'
};
$Self->{'DynamicFields::Driver'}->{'Checkbox'} =  {
  'ConfigDialog' => 'AdminDynamicFieldCheckbox',
  'DisplayName' => 'Checkbox',
  'Module' => 'Kernel::System::DynamicField::Driver::Checkbox'
};
$Self->{'DynamicFields::Driver'}->{'TextArea'} =  {
  'ConfigDialog' => 'AdminDynamicFieldText',
  'DisplayName' => 'Textarea',
  'Module' => 'Kernel::System::DynamicField::Driver::TextArea'
};
$Self->{'DynamicFields::Driver'}->{'Text'} =  {
  'ConfigDialog' => 'AdminDynamicFieldText',
  'DisplayName' => 'Text',
  'Module' => 'Kernel::System::DynamicField::Driver::Text'
};
$Self->{'DynamicFields::ObjectType'}->{'Ticket'} =  {
  'DisplayName' => 'Ticket',
  'Module' => 'Kernel::System::DynamicField::ObjectType::Ticket',
  'Prio' => '100'
};
$Self->{'DynamicFields::ObjectType'}->{'Article'} =  {
  'DisplayName' => 'Article',
  'Module' => 'Kernel::System::DynamicField::ObjectType::Article',
  'Prio' => '110'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldMultiselect'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.DynamicField.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js',
      'Core.Agent.Admin.DynamicFieldMultiselect.js'
    ]
  },
  'Title' => 'Dynamic Fields Multiselect Backend GUI'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldDateTime'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.DynamicField.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js',
      'Core.Agent.Admin.DynamicFieldDateTime.js'
    ]
  },
  'Title' => 'Dynamic Fields Date Time Backend GUI'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldDropdown'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.DynamicField.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js',
      'Core.Agent.Admin.DynamicFieldDropdown.js'
    ]
  },
  'Title' => 'Dynamic Fields Drop-down Backend GUI'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldCheckbox'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js'
    ]
  },
  'Title' => 'Dynamic Fields Checkbox Backend GUI'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldText'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js',
      'Core.Agent.Admin.DynamicFieldText.js'
    ]
  },
  'Title' => 'Dynamic Fields Text Backend GUI'
};
$Self->{'PreferencesGroups'}->{'DynamicFieldsOverviewPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '25',
  'Key' => 'Dynamic fields limit per page for Dynamic Fields Overview',
  'Label' => 'Dynamic Fields Overview Limit',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'AdminDynamicFieldsOverviewPageShown',
  'Prio' => '8000'
};
$Self->{'Frontend::Module'}->{'AdminDynamicField'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.DynamicField.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage dynamic fields.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Dynamic Fields',
    'Prio' => '1000'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Dynamic Fields GUI'
};
$Self->{'Ticket::Frontend::ZoomRichTextForce'} =  '1';
$Self->{'Ticket::Frontend::MaxArticlesPerPage'} =  '1000';
$Self->{'Ticket::Frontend::MaxArticlesZoomExpand'} =  '400';
$Self->{'Ticket::Frontend::HTMLArticleHeightMax'} =  '2500';
$Self->{'Ticket::Frontend::HTMLArticleHeightDefault'} =  '100';
$Self->{'Stats::DynamicObjectRegistration'}->{'TicketSolutionResponseTime'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::TicketSolutionResponseTime'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'TicketAccountedTime'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::TicketAccountedTime'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'TicketList'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::TicketList'
};
$Self->{'Stats::DynamicObjectRegistration'}->{'Ticket'} =  {
  'Module' => 'Kernel::System::Stats::Dynamic::Ticket'
};
$Self->{'LinkObject::IgnoreLinkedTicketStateTypes'} =  [
  'merged',
  'removed'
];
$Self->{'LinkObject::PossibleLink'}->{'0201'} =  {
  'Object1' => 'Ticket',
  'Object2' => 'Ticket',
  'Type' => 'ParentChild'
};
$Self->{'LinkObject::PossibleLink'}->{'0200'} =  {
  'Object1' => 'Ticket',
  'Object2' => 'Ticket',
  'Type' => 'Normal'
};
$Self->{'AutoResponseForWebTickets'} =  '1';
$Self->{'SendNoAutoResponseRegExp'} =  '(MAILER-DAEMON|postmaster|abuse)@.+?\\..+?';
$Self->{'PostMaster::CheckFollowUpModule'}->{'0200-References'} =  {
  'Module' => 'Kernel::System::PostMaster::FollowUpCheck::References'
};
$Self->{'PostMaster::CheckFollowUpModule'}->{'0100-Subject'} =  {
  'Module' => 'Kernel::System::PostMaster::FollowUpCheck::Subject'
};
$Self->{'PostMaster::PreFilterModule'}->{'000-SMIMEFetchFromCustomer'} =  {
  'Module' => 'Kernel::System::PostMaster::Filter::SMIMEFetchFromCustomer'
};
$Self->{'PostMaster::PreCreateFilterModule'}->{'000-FollowUpArticleTypeCheck'} =  {
  'ArticleType' => 'email-internal',
  'Module' => 'Kernel::System::PostMaster::Filter::FollowUpArticleTypeCheck',
  'SenderType' => 'customer'
};
$Self->{'PostMaster::PreFilterModule'}->{'000-MatchDBSource'} =  {
  'Module' => 'Kernel::System::PostMaster::Filter::MatchDBSource'
};
$Self->{'PostMaster::PreFilterModule::NewTicketReject::Body'} =  '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
';
$Self->{'PostMaster::PreFilterModule::NewTicketReject::Subject'} =  'Email Rejected';
$Self->{'PostmasterX-Header'} =  [
  'From',
  'To',
  'Cc',
  'Reply-To',
  'ReplyTo',
  'Subject',
  'Message-ID',
  'Message-Id',
  'Resent-To',
  'Resent-From',
  'Precedence',
  'Mailing-List',
  'List-Id',
  'List-Archive',
  'Errors-To',
  'References',
  'In-Reply-To',
  'Auto-Submitted',
  'X-Loop',
  'X-Spam-Flag',
  'X-Spam-Level',
  'X-Spam-Score',
  'X-Spam-Status',
  'X-No-Loop',
  'X-Priority',
  'Importance',
  'X-Mailer',
  'User-Agent',
  'Organization',
  'X-Original-To',
  'Delivered-To',
  'Envelope-To',
  'X-Envelope-To',
  'Return-Path',
  'X-OTRS-Owner',
  'X-OTRS-OwnerID',
  'X-OTRS-Responsible',
  'X-OTRS-ResponsibleID',
  'X-OTRS-Loop',
  'X-OTRS-Priority',
  'X-OTRS-Queue',
  'X-OTRS-Lock',
  'X-OTRS-Ignore',
  'X-OTRS-State',
  'X-OTRS-State-PendingTime',
  'X-OTRS-Type',
  'X-OTRS-Service',
  'X-OTRS-SLA',
  'X-OTRS-CustomerNo',
  'X-OTRS-CustomerUser',
  'X-OTRS-SenderType',
  'X-OTRS-ArticleType',
  'X-OTRS-FollowUp-Priority',
  'X-OTRS-FollowUp-Queue',
  'X-OTRS-FollowUp-Lock',
  'X-OTRS-FollowUp-State',
  'X-OTRS-FollowUp-State-PendingTime',
  'X-OTRS-FollowUp-Type',
  'X-OTRS-FollowUp-Service',
  'X-OTRS-FollowUp-SLA',
  'X-OTRS-FollowUp-SenderType',
  'X-OTRS-FollowUp-ArticleType',
  'X-OTRS-BodyDecrypted'
];
$Self->{'PostmasterHeaderFieldCount'} =  '12';
$Self->{'PostmasterFollowUpOnUnlockAgentNotifyOnlyToOwner'} =  '0';
$Self->{'PostmasterFollowUpState'} =  'open';
$Self->{'PostmasterDefaultState'} =  'new';
$Self->{'PostmasterDefaultPriority'} =  '3 normal';
$Self->{'PostmasterDefaultQueue'} =  'Raw';
$Self->{'PostmasterUserID'} =  '1';
$Self->{'PostmasterAutoHTML2Text'} =  '1';
$Self->{'LoopProtectionLog'} =  '<OTRS_CONFIG_Home>/var/log/LoopProtection';
$Self->{'LoopProtectionModule'} =  'Kernel::System::PostMaster::LoopProtection::DB';
$Self->{'PostMasterReconnectMessage'} =  '20';
$Self->{'PostMasterMaxEmailSize'} =  '16384';
$Self->{'PostmasterMaxEmails'} =  '40';
$Self->{'TicketACL::Debug::Enabled'} =  '0';
$Self->{'ACL::CacheTTL'} =  '3600';
$Self->{'ACLKeysLevel3::Actions'}->{'100-Default'} =  [
  'AgentTicketBounce',
  'AgentTicketClose',
  'AgentTicketCompose',
  'AgentTicketCustomer',
  'AgentTicketForward',
  'AgentTicketEmailOutbound',
  'AgentTicketFreeText',
  'AgentTicketHistory',
  'AgentTicketLink',
  'AgentTicketLock',
  'AgentTicketMerge',
  'AgentTicketMove',
  'AgentTicketNote',
  'AgentTicketOwner',
  'AgentTicketPending',
  'AgentTicketPhone',
  'AgentTicketPhoneInbound',
  'AgentTicketPhoneOutbound',
  'AgentTicketPlain',
  'AgentTicketPrint',
  'AgentTicketPriority',
  'AgentTicketProcess',
  'AgentTicketResponsible',
  'AgentTicketSearch',
  'AgentTicketWatcher',
  'AgentTicketZoom',
  'AgentLinkObject',
  'CustomerTicketProcess'
];
$Self->{'ACLKeysLevel2::PropertiesDatabase'} =  {
  'CustomerUser' => 'CustomerUser',
  'DynamicField' => 'DynamicField',
  'Owner' => 'Owner',
  'Priority' => 'Priority',
  'Process' => 'Process',
  'Queue' => 'Queue',
  'Responsible' => 'Responsible',
  'SLA' => 'SLA',
  'Service' => 'Service',
  'State' => 'State',
  'Ticket' => 'Ticket',
  'Type' => 'Type',
  'User' => 'User'
};
$Self->{'ACLKeysLevel2::Properties'} =  {
  'CustomerUser' => 'CustomerUser',
  'DynamicField' => 'DynamicField',
  'Frontend' => 'Frontend',
  'Owner' => 'Owner',
  'Priority' => 'Priority',
  'Process' => 'Process',
  'Queue' => 'Queue',
  'Responsible' => 'Responsible',
  'SLA' => 'SLA',
  'Service' => 'Service',
  'State' => 'State',
  'Ticket' => 'Ticket',
  'Type' => 'Type',
  'User' => 'User'
};
$Self->{'ACLKeysLevel2::PossibleNot'} =  {
  'Action' => 'Action',
  'ActivityDialog' => 'ActivityDialog',
  'Process' => 'Process',
  'Ticket' => 'Ticket'
};
$Self->{'ACLKeysLevel2::PossibleAdd'} =  {
  'Action' => 'Action',
  'ActivityDialog' => 'ActivityDialog',
  'Process' => 'Process',
  'Ticket' => 'Ticket'
};
$Self->{'ACLKeysLevel2::Possible'} =  {
  'Action' => 'Action',
  'ActivityDialog' => 'ActivityDialog',
  'Process' => 'Process',
  'Ticket' => 'Ticket'
};
$Self->{'ACLKeysLevel1Change'} =  {
  'Possible' => 'Possible',
  'PossibleAdd' => 'PossibleAdd',
  'PossibleNot' => 'PossibleNot'
};
$Self->{'ACLKeysLevel1Match'} =  {
  'Properties' => 'Properties',
  'PropertiesDatabase' => 'PropertiesDatabase'
};
$Self->{'TicketACL::Default::Action'} =  {};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketSearch'} =  {
  'Description' => 'Customer ticket search.',
  'NavBar' => [
    {
      'AccessKey' => 's',
      'Block' => '',
      'Description' => 'Search.',
      'Link' => 'Action=CustomerTicketSearch',
      'LinkOption' => '',
      'Name' => 'Search',
      'NavBar' => 'Ticket',
      'Prio' => '300',
      'Type' => 'Submenu'
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Search'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketAttachment'} =  {
  'Description' => 'To download attachments.',
  'NavBarName' => '',
  'Title' => ''
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketPrint'} =  {
  'Description' => 'Customer Ticket Print Module.',
  'NavBarName' => '',
  'Title' => 'Print'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketZoom'} =  {
  'Description' => 'Ticket zoom view.',
  'Loader' => {
    'JavaScript' => [
      'Core.Customer.TicketZoom.js',
      'Core.UI.Popup.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Zoom'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketMessageNew'} =  {
  'Description' => 'Create tickets.',
  'NavBar' => [
    {
      'AccessKey' => 'n',
      'Block' => '',
      'Description' => 'Add New Ticket.',
      'Link' => 'Action=CustomerTicketMessageNew',
      'LinkOption' => '',
      'Name' => 'Add New Ticket',
      'NavBar' => 'Ticket',
      'Prio' => '130',
      'Type' => 'Submenu'
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Add New Ticket'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketMessage'} =  {
  'Description' => 'Create tickets.',
  'NavBar' => [
    {
      'AccessKey' => 'n',
      'Block' => '',
      'Description' => 'Create new Ticket.',
      'Link' => 'Action=CustomerTicketMessage',
      'LinkOption' => '',
      'Name' => 'New Ticket',
      'NavBar' => 'Ticket',
      'Prio' => '100',
      'Type' => 'Submenu'
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'New Ticket'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketOverview'} =  {
  'Description' => 'Overview of customer tickets.',
  'NavBar' => [
    {
      'AccessKey' => 'm',
      'Block' => '',
      'Description' => 'Tickets.',
      'Link' => 'Action=CustomerTicketOverview;Subaction=MyTickets',
      'LinkOption' => '',
      'Name' => 'Tickets',
      'NavBar' => 'Ticket',
      'Prio' => '100',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'My Tickets.',
      'Link' => 'Action=CustomerTicketOverview;Subaction=MyTickets',
      'LinkOption' => '',
      'Name' => 'My Tickets',
      'NavBar' => 'Ticket',
      'Prio' => '110',
      'Type' => 'Submenu'
    },
    {
      'AccessKey' => 'M',
      'Block' => '',
      'Description' => 'Company Tickets.',
      'Link' => 'Action=CustomerTicketOverview;Subaction=CompanyTickets',
      'LinkOption' => '',
      'Name' => 'Company Tickets',
      'NavBar' => 'Ticket',
      'Prio' => '120',
      'Type' => 'Submenu'
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Overview'
};
$Self->{'Notification::CharactersPerLine'} =  '80';
$Self->{'PreferencesGroups'}->{'NotificationEvent'} =  {
  'Active' => '1',
  'Column' => 'Notification Settings',
  'Desc' => 'Choose for which kind of ticket changes you want to receive notifications.',
  'Label' => 'Ticket notifications',
  'Module' => 'Kernel::Output::HTML::Preferences::NotificationEvent',
  'PrefKey' => 'AdminNotifcationEventTransport',
  'Prio' => '8000'
};
$Self->{'Notification::Transport'}->{'SMS'} =  {
  'AgentEnabledByDefault' => '0',
  'Icon' => 'fa fa-mobile',
  'IsOTRSBusinessTransport' => '1',
  'Module' => 'Kernel::System::Ticket::Event::NotificationEvent::Transport::SMS',
  'Name' => 'SMS (Short Message Service)',
  'Prio' => '120'
};
$Self->{'Notification::Transport'}->{'NotificationView'} =  {
  'AgentEnabledByDefault' => '0',
  'Icon' => 'fa fa-th-list',
  'IsOTRSBusinessTransport' => '1',
  'Module' => 'Kernel::System::Ticket::Event::NotificationEvent::Transport::NotificationView',
  'Name' => 'Web View',
  'Prio' => '110'
};
$Self->{'Notification::Transport'}->{'Email'} =  {
  'AgentEnabledByDefault' => '1',
  'Icon' => 'fa fa-envelope',
  'IsOTRSBusinessTransport' => '0',
  'Module' => 'Kernel::System::Ticket::Event::NotificationEvent::Transport::Email',
  'Name' => 'Email',
  'Prio' => '100'
};
$Self->{'Frontend::Admin::AdminNotificationEvent'}->{'RichTextHeight'} =  '320';
$Self->{'Frontend::Admin::AdminNotificationEvent'}->{'RichTextWidth'} =  '620';
$Self->{'Frontend::Admin::AdminNotificationEvent'}->{'RichText'} =  '1';
$Self->{'Queue::EventModulePost'}->{'130-UpdateQueue'} =  {
  'Event' => 'QueueUpdate',
  'Module' => 'Kernel::System::Queue::Event::TicketAcceleratorUpdate',
  'Transaction' => '0'
};
$Self->{'Events'}->{'Queue'} =  [
  'QueueCreate',
  'QueueUpdate'
];
$Self->{'Events'}->{'Article'} =  [
  'ArticleCreate',
  'ArticleUpdate',
  'ArticleSend',
  'ArticleBounce',
  'ArticleAgentNotification',
  'ArticleCustomerNotification',
  'ArticleAutoResponse',
  'ArticleFlagSet',
  'ArticleFlagDelete',
  'ArticleAgentNotification',
  'ArticleCustomerNotification'
];
$Self->{'Events'}->{'Ticket'} =  [
  'TicketCreate',
  'TicketDelete',
  'TicketTitleUpdate',
  'TicketUnlockTimeoutUpdate',
  'TicketQueueUpdate',
  'TicketTypeUpdate',
  'TicketServiceUpdate',
  'TicketSLAUpdate',
  'TicketCustomerUpdate',
  'TicketPendingTimeUpdate',
  'TicketLockUpdate',
  'TicketArchiveFlagUpdate',
  'TicketStateUpdate',
  'TicketOwnerUpdate',
  'TicketResponsibleUpdate',
  'TicketPriorityUpdate',
  'HistoryAdd',
  'HistoryDelete',
  'TicketAccountTime',
  'TicketMerge',
  'TicketSubscribe',
  'TicketUnsubscribe',
  'TicketFlagSet',
  'TicketFlagDelete',
  'TicketSlaveLinkAdd',
  'TicketSlaveLinkDelete',
  'TicketMasterLinkDelete',
  'EscalationResponseTimeNotifyBefore',
  'EscalationUpdateTimeNotifyBefore',
  'EscalationSolutionTimeNotifyBefore',
  'EscalationResponseTimeStart',
  'EscalationUpdateTimeStart',
  'EscalationSolutionTimeStart',
  'EscalationResponseTimeStop',
  'EscalationUpdateTimeStop',
  'EscalationSolutionTimeStop',
  'NotificationNewTicket',
  'NotificationFollowUp',
  'NotificationLockTimeout',
  'NotificationOwnerUpdate',
  'NotificationResponsibleUpdate',
  'NotificationAddNote',
  'NotificationMove',
  'NotificationPendingReminder',
  'NotificationEscalation',
  'NotificationEscalationNotifyBefore',
  'NotificationServiceUpdate'
];
$Self->{'Ticket::IncludeUnknownTicketCustomers'} =  '0';
$Self->{'Ticket::UnlockOnAway'} =  '1';
$Self->{'Ticket::GenericAgentRunLimit'} =  '4000';
$Self->{'Ticket::GenericAgentTicketSearch'}->{'ExtendedSearchCondition'} =  '1';
$Self->{'Ticket::EventModulePost'}->{'900-GenericAgent'} =  {
  'Event' => '',
  'Module' => 'Kernel::System::Ticket::Event::GenericAgent',
  'Transaction' => '1'
};
$Self->{'Frontend::Module'}->{'AdminGenericAgent'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.Admin.GenericAgent.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Manage tasks triggered by event or time based execution.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'GenericAgent',
    'Prio' => '300'
  },
  'NavBarName' => 'Admin',
  'Title' => 'GenericAgent'
};
$Self->{'Frontend::Module'}->{'AdminPriority'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage ticket priorities.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Priorities',
    'Prio' => '850'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Priorities'
};
$Self->{'Frontend::Module'}->{'AdminState'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage ticket states.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'States',
    'Prio' => '800'
  },
  'NavBarName' => 'Admin',
  'Title' => 'States'
};
$Self->{'Frontend::Module'}->{'AdminType'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage ticket types.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Types',
    'Prio' => '700'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Types'
};
$Self->{'Frontend::Module'}->{'AdminSLA'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage Service Level Agreements (SLAs).',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Service Level Agreements',
    'Prio' => '1000'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Service Level Agreements'
};
$Self->{'Frontend::Module'}->{'AdminService'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage services.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Services',
    'Prio' => '900'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Services'
};
$Self->{'Frontend::Module'}->{'AdminNotificationEvent'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.NotificationEvent.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.NotificationEvent.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage ticket notifications.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Ticket Notifications',
    'Prio' => '400'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Ticket Notifications'
};
$Self->{'Frontend::Module'}->{'AdminSystemAddress'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Email',
    'Description' => 'Set sender email addresses for this system.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Email Addresses',
    'Prio' => '300'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Email Addresses'
};
$Self->{'Frontend::Module'}->{'AdminSignature'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage signatures.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Signatures',
    'Prio' => '900'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Signatures'
};
$Self->{'Frontend::Module'}->{'AdminSalutation'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage salutations.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Salutations',
    'Prio' => '800'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Salutations'
};
$Self->{'Frontend::Module'}->{'AdminTemplateAttachment'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Link attachments to templates.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Attachments <-> Templates',
    'Prio' => '700'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Attachments <-> Templates'
};
$Self->{'Frontend::Module'}->{'AdminAttachment'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage attachments.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Attachments',
    'Prio' => '600'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Attachments'
};
$Self->{'Frontend::Module'}->{'AdminQueueAutoResponse'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Link queues to auto responses.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Auto Responses <-> Queues',
    'Prio' => '500'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Auto Responses <-> Queues'
};
$Self->{'Frontend::Module'}->{'AdminAutoResponse'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage responses that are automatically sent.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Auto Responses',
    'Prio' => '400'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Auto Responses'
};
$Self->{'Frontend::Module'}->{'AdminQueueTemplates'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Link templates to queues.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Templates <-> Queues',
    'Prio' => '300'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Templates <-> Queues'
};
$Self->{'Frontend::Module'}->{'AdminTemplate'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage templates.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Templates',
    'Prio' => '200'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Templates'
};
$Self->{'Frontend::Module'}->{'AdminQueue'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Queue',
    'Description' => 'Create and manage queues.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Queues',
    'Prio' => '100'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Queues'
};
$Self->{'Frontend::Module'}->{'AdminACL'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.ACL.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.ACL.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Configure and manage ACLs.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Access Control Lists (ACL)',
    'Prio' => '750'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Access Control Lists (ACL)'
};
$Self->{'Frontend::Module'}->{'AgentTicketBulk'} =  {
  'Description' => 'Ticket bulk module.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Bulk Action'
};
$Self->{'Frontend::Module'}->{'AgentTicketPrint'} =  {
  'Description' => 'Ticket Print.',
  'NavBarName' => 'Ticket',
  'Title' => 'Print'
};
$Self->{'Frontend::Module'}->{'AgentTicketFreeText'} =  {
  'Description' => 'Ticket FreeText.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Free Fields'
};
$Self->{'Frontend::Module'}->{'AgentTicketClose'} =  {
  'Description' => 'Ticket Close.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Close'
};
$Self->{'Frontend::Module'}->{'AgentTicketCustomer'} =  {
  'Description' => 'Ticket Customer.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Customer'
};
$Self->{'Frontend::Module'}->{'AgentTicketEmailOutbound'} =  {
  'Description' => 'Ticket Outbound Email.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Email Outbound'
};
$Self->{'Frontend::Module'}->{'AgentTicketForward'} =  {
  'Description' => 'Ticket Forward Email.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Forward'
};
$Self->{'Frontend::Module'}->{'AgentTicketBounce'} =  {
  'Description' => 'Ticket Compose Bounce Email.',
  'NavBarName' => 'Ticket',
  'Title' => 'Bounce'
};
$Self->{'Frontend::Module'}->{'AgentTicketCompose'} =  {
  'Description' => 'Ticket Compose email Answer.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Compose'
};
$Self->{'Frontend::Module'}->{'AgentTicketResponsible'} =  {
  'Description' => 'Ticket Responsible.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Responsible'
};
$Self->{'Frontend::Module'}->{'AgentTicketOwner'} =  {
  'Description' => 'Ticket Owner.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Owner'
};
$Self->{'Frontend::Module'}->{'AgentTicketHistory'} =  {
  'Description' => 'Ticket History.',
  'NavBarName' => 'Ticket',
  'Title' => 'History'
};
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'RichTextHeight'} =  '100';
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'RichTextWidth'} =  '620';
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'NextScreen'} =  'TicketZoom';
$Self->{'Frontend::Module'}->{'AgentTicketMove'} =  {
  'Description' => 'Ticket Move.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Move'
};
$Self->{'Frontend::Module'}->{'AgentTicketLock'} =  {
  'Description' => 'Ticket Lock.',
  'NavBarName' => 'Ticket',
  'Title' => 'Lock'
};
$Self->{'Frontend::Module'}->{'AgentTicketPriority'} =  {
  'Description' => 'Ticket Priority.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Priority'
};
$Self->{'Frontend::Module'}->{'AgentTicketWatcher'} =  {
  'Description' => 'A TicketWatcher Module.',
  'NavBarName' => 'Ticket-Watcher',
  'Title' => 'Ticket Watcher'
};
$Self->{'Frontend::Module'}->{'AgentTicketPending'} =  {
  'Description' => 'Ticket Pending.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Pending'
};
$Self->{'Frontend::Module'}->{'AgentTicketMerge'} =  {
  'Description' => 'Ticket Merge.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketMerge.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Merge'
};
$Self->{'Frontend::Module'}->{'AgentTicketNote'} =  {
  'Description' => 'Ticket Note.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Note'
};
$Self->{'Frontend::Module'}->{'AgentTicketPlain'} =  {
  'Description' => 'Ticket plain view of an email.',
  'NavBarName' => 'Ticket',
  'Title' => 'Plain'
};
$Self->{'Frontend::Module'}->{'AgentTicketAttachment'} =  {
  'Description' => 'To download attachments.',
  'NavBarName' => 'Ticket',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AgentTicketZoom'} =  {
  'Description' => 'Ticket Zoom.',
  'Loader' => {
    'CSS' => [
      'Core.Agent.TicketProcess.css',
      'Core.Agent.TicketMenuModuleCluster.css',
      'Core.AllocationList.css',
      'ITSM.ChangeManagement.WorkorderGraph.css'
    ],
    'JavaScript' => [
      'thirdparty/jquery-tablesorter-2.0.5/jquery.tablesorter.js',
      'ITSM.Agent.ChangeManagement.WorkorderGraph.js',
      'Core.Agent.TicketZoom.js',
      'Core.UI.AllocationList.js',
      'Core.UI.Table.Sort.js',
      'Core.Agent.TableFilters.js',
      'Core.Agent.LinkObject.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Zoom'
};
$Self->{'Frontend::Module'}->{'AgentZoom'} =  {
  'Description' => 'Compat module for AgentZoom to AgentTicketZoom.',
  'NavBarName' => 'Ticket',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AgentTicketEscalationView'} =  {
  'Description' => 'Overview of all escalated tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'e',
      'Block' => '',
      'Description' => 'Overview Escalated Tickets.',
      'Link' => 'Action=AgentTicketEscalationView',
      'LinkOption' => '',
      'Name' => 'Escalation view',
      'NavBar' => 'Ticket',
      'Prio' => '120',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Escalation view'
};
$Self->{'Frontend::Module'}->{'AgentTicketStatusView'} =  {
  'Description' => 'Overview of all open tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'v',
      'Block' => '',
      'Description' => 'Overview of all open Tickets.',
      'Link' => 'Action=AgentTicketStatusView',
      'LinkOption' => '',
      'Name' => 'Status view',
      'NavBar' => 'Ticket',
      'Prio' => '110',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Status view'
};
$Self->{'Frontend::Module'}->{'AgentUserSearch'} =  {
  'Description' => 'AgentUserSearch.',
  'NavBarName' => 'Ticket',
  'Title' => 'AgentUserSearch'
};
$Self->{'Frontend::Module'}->{'AgentCustomerSearch'} =  {
  'Description' => 'AgentCustomerSearch.',
  'NavBarName' => 'Ticket',
  'Title' => 'AgentCustomerSearch'
};
$Self->{'Frontend::Module'}->{'AgentTicketWatchView'} =  {
  'Description' => 'Watched Tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AgentTicketQueue.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Watched Tickets'
};
$Self->{'Frontend::Module'}->{'AgentTicketResponsibleView'} =  {
  'Description' => 'Responsible Tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Responsible Tickets'
};
$Self->{'Frontend::Module'}->{'AgentTicketLockedView'} =  {
  'Description' => 'Locked Tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AgentTicketQueue.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Locked Tickets'
};
$Self->{'Frontend::Module'}->{'AgentTicketSearch'} =  {
  'Description' => 'Search Ticket.',
  'Loader' => {
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 's',
      'Block' => '',
      'Description' => 'Search Tickets.',
      'Link' => 'Action=AgentTicketSearch',
      'LinkOption' => 'onclick="window.setTimeout(function(){Core.Agent.Search.OpenSearchDialog(\'AgentTicketSearch\');}, 0); return false;"',
      'Name' => 'Search',
      'NavBar' => 'Ticket',
      'Prio' => '300',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Search'
};
$Self->{'Frontend::Module'}->{'AgentTicketEmail'} =  {
  'Description' => 'Create new email ticket.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'm',
      'Block' => '',
      'Description' => 'Create new email ticket and send this out (outbound).',
      'Link' => 'Action=AgentTicketEmail',
      'LinkOption' => '',
      'Name' => 'New email ticket',
      'NavBar' => 'Ticket',
      'Prio' => '210',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'New email ticket'
};
$Self->{'Frontend::Module'}->{'AgentTicketPhoneInbound'} =  {
  'Description' => 'Incoming Phone Call.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Phone-Ticket'
};
$Self->{'Frontend::Module'}->{'AgentTicketPhoneOutbound'} =  {
  'Description' => 'Phone Call.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => 'Ticket',
  'Title' => 'Phone-Ticket'
};
$Self->{'Frontend::Module'}->{'AgentTicketPhone'} =  {
  'Description' => 'Create new phone ticket.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'n',
      'Block' => '',
      'Description' => 'Create new phone ticket (inbound).',
      'Link' => 'Action=AgentTicketPhone',
      'LinkOption' => '',
      'Name' => 'New phone ticket',
      'NavBar' => 'Ticket',
      'Prio' => '200',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'New phone ticket'
};
$Self->{'Frontend::Module'}->{'AgentTicketService'} =  {
  'Description' => 'Overview of all open Tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AgentTicketService.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'O',
      'Block' => '',
      'Description' => 'Overview of all open Tickets.',
      'Link' => 'Action=AgentTicketService',
      'LinkOption' => '',
      'Name' => 'Service view',
      'NavBar' => 'Ticket',
      'Prio' => '105',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'ServiceView'
};
$Self->{'Frontend::Module'}->{'AgentTicketQueue'} =  {
  'Description' => 'Overview of all open Tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AgentTicketQueue.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'o',
      'Block' => '',
      'Description' => 'Overview of all open Tickets.',
      'Link' => 'Action=AgentTicketQueue',
      'LinkOption' => '',
      'Name' => 'Queue view',
      'NavBar' => 'Ticket',
      'Prio' => '100',
      'Type' => ''
    },
    {
      'AccessKey' => 't',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AgentTicketQueue',
      'LinkOption' => '',
      'Name' => 'Tickets',
      'NavBar' => 'Ticket',
      'Prio' => '200',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'QueueView'
};
$Self->{'CustomerFrontend::HeaderMetaModule'}->{'2-TicketSearch'} =  {
  'Action' => 'CustomerTicketSearch',
  'Module' => 'Kernel::Output::HTML::HeaderMeta::CustomerTicketSearch'
};
$Self->{'CustomerFrontend::CommonParam'}->{'TicketID'} =  '';
$Self->{'CustomerFrontend::CommonParam'}->{'Action'} =  'CustomerTicketOverview';
$Self->{'Frontend::CommonParam'}->{'TicketID'} =  '';
$Self->{'Frontend::CommonParam'}->{'QueueID'} =  '0';
$Self->{'Frontend::CommonParam'}->{'Action'} =  'AgentDashboard';
$Self->{'CustomerPreferencesGroups'}->{'RefreshTime'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Data' => {
    '0' => 'off',
    '10' => '10 minutes',
    '15' => '15 minutes',
    '2' => ' 2 minutes',
    '5' => ' 5 minutes',
    '7' => ' 7 minutes'
  },
  'DataSelected' => '0',
  'Desc' => 'Select after which period ticket overviews should refresh automatically.',
  'Key' => 'Refresh interval',
  'Label' => 'Ticket overview',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserRefreshTime',
  'Prio' => '4000'
};
$Self->{'CustomerPreferencesGroups'}->{'ShownTickets'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Data' => {
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30'
  },
  'DataSelected' => '25',
  'Desc' => 'Select how many tickets should be shown in overviews by default.',
  'Key' => 'Tickets per page',
  'Label' => 'Number of displayed tickets',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserShowTickets',
  'Prio' => '4000'
};
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'SearchCSVData'} =  [
  'TicketNumber',
  'Age',
  'Created',
  'Closed',
  'State',
  'Priority',
  'Lock',
  'CustomerID',
  'CustomerName',
  'From',
  'Subject'
];
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'SearchArticleCSVTree'} =  '0';
$Self->{'Customer::TicketSearch::AllServices'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketSearch'}->{'ExtendedSearchCondition'} =  '1';
$Self->{'Ticket::CustomerTicketSearch::Order::Default'} =  'Down';
$Self->{'Ticket::CustomerTicketSearch::SortBy::Default'} =  'Age';
$Self->{'Ticket::CustomerTicketSearch::SearchPageShown'} =  '40';
$Self->{'Ticket::CustomerTicketSearch::SearchLimit'} =  '5000';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'AttributesView'} =  {
  'Owner' => '0',
  'Priority' => '1',
  'Queue' => '1',
  'Responsible' => '0',
  'SLA' => '0',
  'Service' => '0',
  'State' => '1',
  'Type' => '0'
};
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'StateType'} =  [
  'open',
  'closed'
];
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'State'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'PriorityDefault'} =  '3 normal';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'Priority'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'HistoryType'} =  'FollowUp';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'SenderType'} =  'customer';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'ArticleType'} =  'webrequest';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'NextScreenAfterFollowUp'} =  'CustomerTicketOverview';
$Self->{'CustomerPanel::NewTicketQueueSelectionModule'} =  'Kernel::Output::HTML::CustomerNewTicket::QueueSelectionGeneric';
$Self->{'CustomerPanelSelectionString'} =  '<Queue>';
$Self->{'CustomerPanelSelectionType'} =  'Queue';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'HistoryType'} =  'WebRequestCustomer';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'SenderType'} =  'customer';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'ArticleType'} =  'webrequest';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'StateDefault'} =  'new';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'SLA'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'Service'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'TicketType'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'Queue'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'PriorityDefault'} =  '3 normal';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'Priority'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'NextScreenAfterNewTicket'} =  'CustomerTicketOverview';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'HistoryType'} =  'WebRequestCustomer';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'SenderType'} =  'customer';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'ArticleType'} =  'webrequest';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'StateDefault'} =  'new';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'SLA'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'Service'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'TicketType'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'Queue'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'PriorityDefault'} =  '3 normal';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'Priority'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'NextScreenAfterNewTicket'} =  'CustomerTicketOverview';
$Self->{'AgentSelfNotifyOnAction'} =  '0';
$Self->{'CustomerNotifyJustToRealCustomer'} =  '0';
$Self->{'PreferencesGroups'}->{'CreateNextMask'} =  {
  'Active' => '1',
  'Column' => 'Other Settings',
  'Data' => {
    '0' => 'CreateTicket',
    'AgentTicketZoom' => 'TicketZoom'
  },
  'DataSelected' => '',
  'Desc' => 'Configure which screen should be shown after a new ticket has been created.',
  'Key' => 'Screen',
  'Label' => 'Screen after new ticket',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserCreateNextMask',
  'Prio' => '3000'
};
$Self->{'PreferencesGroups'}->{'TicketOverviewPreviewPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '15',
  'Key' => 'Ticket limit per page for Ticket Overview "Preview"',
  'Label' => 'Ticket Overview "Preview" Limit',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserTicketOverviewPreviewPageShown',
  'Prio' => '8200'
};
$Self->{'PreferencesGroups'}->{'TicketOverviewMediumPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '20',
  'Key' => 'Ticket limit per page for Ticket Overview "Medium"',
  'Label' => 'Ticket Overview "Medium" Limit',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserTicketOverviewMediumPageShown',
  'Prio' => '8100'
};
$Self->{'PreferencesGroups'}->{'TicketOverviewFilterSettings'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Key' => 'Column ticket filters for Ticket Overviews type "Small".',
  'Label' => 'Enabled filters.',
  'Module' => 'Kernel::Output::HTML::Preferences::ColumnFilters',
  'PrefKey' => 'UserFilterColumnsEnabled',
  'Prio' => '8100'
};
$Self->{'PreferencesGroups'}->{'TicketOverviewSmallPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '25',
  'Key' => 'Ticket limit per page for Ticket Overview "Small"',
  'Label' => 'Ticket Overview "Small" Limit',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserTicketOverviewSmallPageShown',
  'Prio' => '8000'
};
$Self->{'PreferencesGroups'}->{'RefreshTime'} =  {
  'Active' => '1',
  'Column' => 'Other Settings',
  'Data' => {
    '0' => 'off',
    '10' => '10 minutes',
    '15' => '15 minutes',
    '2' => ' 2 minutes',
    '5' => ' 5 minutes',
    '7' => ' 7 minutes'
  },
  'DataSelected' => '0',
  'Desc' => 'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.',
  'Key' => 'After',
  'Label' => 'Overview Refresh Time',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserRefreshTime',
  'Prio' => '2000'
};
$Self->{'PreferencesGroups'}->{'CustomService'} =  {
  'Active' => '1',
  'Column' => 'Notification Settings',
  'Desc' => 'Your service selection of your preferred services. You also get notified about those services via email if enabled.',
  'Key' => '',
  'Label' => 'My Services',
  'Module' => 'Kernel::Output::HTML::Preferences::CustomService',
  'Prio' => '1000'
};
$Self->{'PreferencesGroups'}->{'CustomQueue'} =  {
  'Active' => '1',
  'Column' => 'Notification Settings',
  'Desc' => 'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.',
  'Key' => '',
  'Label' => 'My Queues',
  'Module' => 'Kernel::Output::HTML::Preferences::CustomQueue',
  'Permission' => 'ro',
  'Prio' => '1000'
};
$Self->{'AgentCustomerInformationCenter::Backend'}->{'0500-CIC-CustomerIDStatus'} =  {
  'Attributes' => '',
  'Block' => 'ContentSmall',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'Description' => 'Company Status',
  'Group' => '',
  'Module' => 'Kernel::Output::HTML::Dashboard::CustomerIDStatus',
  'Permission' => 'ro',
  'Title' => 'Company Status'
};
$Self->{'AgentCustomerInformationCenter::Backend'}->{'0130-CIC-TicketOpen'} =  {
  'Attributes' => 'StateType=open;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'DefaultColumns' => {
    'Age' => '2',
    'Changed' => '1',
    'Created' => '1',
    'CustomerCompanyName' => '1',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '1',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '1',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Description' => 'All open tickets, these tickets have already been worked on, but need a response',
  'Filter' => 'All',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketGeneric',
  'Permission' => 'ro',
  'Time' => 'Age',
  'Title' => 'Open Tickets / Need to be answered'
};
$Self->{'AgentCustomerInformationCenter::Backend'}->{'0120-CIC-TicketNew'} =  {
  'Attributes' => 'StateType=new;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'DefaultColumns' => {
    'Age' => '2',
    'Changed' => '1',
    'Created' => '1',
    'CustomerCompanyName' => '1',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '1',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '1',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Description' => 'All new tickets, these tickets have not been worked on yet',
  'Filter' => 'All',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketGeneric',
  'Permission' => 'ro',
  'Time' => 'Age',
  'Title' => 'New Tickets'
};
$Self->{'AgentCustomerInformationCenter::Backend'}->{'0110-CIC-TicketEscalation'} =  {
  'Attributes' => 'TicketEscalationTimeOlderMinutes=1;SortBy=EscalationTime;OrderBy=Down;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'DefaultColumns' => {
    'Age' => '2',
    'Changed' => '1',
    'Created' => '1',
    'CustomerCompanyName' => '1',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '1',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '1',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Description' => 'All escalated tickets',
  'Filter' => 'All',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketGeneric',
  'Permission' => 'ro',
  'Time' => 'EscalationTime',
  'Title' => 'Escalated Tickets'
};
$Self->{'AgentCustomerInformationCenter::Backend'}->{'0100-CIC-TicketPendingReminder'} =  {
  'Attributes' => 'TicketPendingTimeOlderMinutes=1;StateType=pending reminder;SortBy=PendingTime;OrderBy=Down;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'DefaultColumns' => {
    'Age' => '2',
    'Changed' => '1',
    'Created' => '1',
    'CustomerCompanyName' => '1',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '1',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '1',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Description' => 'All tickets with a reminder set where the reminder date has been reached',
  'Filter' => 'Locked',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketGeneric',
  'Permission' => 'ro',
  'Time' => 'UntilTime',
  'Title' => 'Reminder Tickets'
};
$Self->{'AgentCustomerInformationCenter::Backend'}->{'0050-CIC-CustomerUserList'} =  {
  'Attributes' => '',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'Description' => 'All customer users of a CustomerID',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::CustomerUserList',
  'Permission' => 'ro',
  'Title' => 'Customer Users'
};
$Self->{'OnlyValuesOnTicket'} =  '1';
$Self->{'DashboardEventsTicketCalendar::TicketFieldsForEvents'} =  {
  'CustomerID' => 'Customer ID',
  'CustomerUserID' => 'Customer user',
  'Priority' => 'Priority',
  'Queue' => 'Queue',
  'SLA' => 'SLA',
  'Service' => 'Service',
  'State' => 'State',
  'Title' => 'Title',
  'Type' => 'Type'
};
$Self->{'DashboardEventsTicketCalendar::DynamicFieldsForEvents'} =  [
  'TicketCalendarStartTime',
  'TicketCalendarEndTime'
];
$Self->{'DashboardEventsTicketCalendar::DynamicFieldEndTime'} =  'TicketCalendarEndTime';
$Self->{'DashboardEventsTicketCalendar::DynamicFieldStartTime'} =  'TicketCalendarStartTime';
$Self->{'DashboardEventsTicketCalendar'}->{'Queues'} =  [
  'Raw'
];
$Self->{'DashboardEventsTicketCalendar'}->{'CalendarWidth'} =  '95';
$Self->{'DashboardBackend'}->{'0280-DashboardEventsTicketCalendar'} =  {
  'Block' => 'ContentLarge',
  'CacheTTL' => '0',
  'Default' => '0',
  'Group' => '',
  'Module' => 'Kernel::Output::HTML::Dashboard::EventsTicketCalendar',
  'Title' => 'Events Ticket Calendar'
};
$Self->{'DashboardBackend'}->{'0270-TicketQueueOverview'} =  {
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'Description' => 'Provides a matrix overview of the tickets per state per queue.',
  'Group' => '',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketQueueOverview',
  'Permission' => 'rw',
  'QueuePermissionGroup' => 'users',
  'Sort' => 'SortBy=Age;OrderBy=Up',
  'States' => {
    '1' => 'new',
    '4' => 'open',
    '6' => 'pending reminder'
  },
  'Title' => 'Ticket Queue Overview'
};
$Self->{'DashboardBackend'}->{'0260-TicketCalendar'} =  {
  'Block' => 'ContentSmall',
  'CacheTTL' => '2',
  'Default' => '1',
  'Group' => '',
  'Limit' => '6',
  'Module' => 'Kernel::Output::HTML::Dashboard::Calendar',
  'OwnerOnly' => '',
  'Permission' => 'rw',
  'Title' => 'Upcoming Events'
};
$Self->{'DashboardBackend'}->{'0250-TicketStats'} =  {
  'Block' => 'ContentSmall',
  'CacheTTLLocal' => '30',
  'Changed' => '1',
  'Closed' => '1',
  'Default' => '1',
  'Group' => '',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketStatsGeneric',
  'Permission' => 'rw',
  'Title' => '7 Day Stats'
};
$Self->{'DashboardBackend'}->{'0130-TicketOpen'} =  {
  'Attributes' => 'StateType=open;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'DefaultColumns' => {
    'Age' => '2',
    'Changed' => '1',
    'Created' => '1',
    'CustomerCompanyName' => '1',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '1',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '1',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Description' => 'All open tickets, these tickets have already been worked on, but need a response',
  'Filter' => 'All',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketGeneric',
  'Permission' => 'rw',
  'Time' => 'Age',
  'Title' => 'Open Tickets / Need to be answered'
};
$Self->{'DashboardBackend'}->{'0120-TicketNew'} =  {
  'Attributes' => 'StateType=new;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'DefaultColumns' => {
    'Age' => '2',
    'Changed' => '1',
    'Created' => '1',
    'CustomerCompanyName' => '1',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '1',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '1',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Description' => 'All new tickets, these tickets have not been worked on yet',
  'Filter' => 'All',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketGeneric',
  'Permission' => 'rw',
  'Time' => 'Age',
  'Title' => 'New Tickets'
};
$Self->{'DashboardBackend'}->{'0110-TicketEscalation'} =  {
  'Attributes' => 'TicketEscalationTimeOlderMinutes=1;SortBy=EscalationTime;OrderBy=Down;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'DefaultColumns' => {
    'Age' => '2',
    'Changed' => '1',
    'Created' => '1',
    'CustomerCompanyName' => '1',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '1',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '1',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Description' => 'All escalated tickets',
  'Filter' => 'All',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketGeneric',
  'Permission' => 'rw',
  'Time' => 'EscalationTime',
  'Title' => 'Escalated Tickets'
};
$Self->{'DashboardBackend'}->{'0100-TicketPendingReminder'} =  {
  'Attributes' => 'TicketPendingTimeOlderMinutes=1;StateType=pending reminder;SortBy=PendingTime;OrderBy=Down;',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '1',
  'DefaultColumns' => {
    'Age' => '2',
    'Changed' => '1',
    'Created' => '1',
    'CustomerCompanyName' => '1',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '1',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '1',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Description' => 'All tickets with a reminder set where the reminder date has been reached',
  'Filter' => 'Locked',
  'Group' => '',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketGeneric',
  'Permission' => 'rw',
  'Time' => 'UntilTime',
  'Title' => 'Reminder Tickets'
};
$Self->{'Ticket::DefineEmailFromSeparator'} =  'via';
$Self->{'Ticket::DefineEmailFrom'} =  'SystemAddressName';
$Self->{'CustomerTicket::Permission'}->{'3-CustomerIDCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::CustomerPermission::CustomerIDCheck',
  'Required' => '0'
};
$Self->{'CustomerTicket::Permission'}->{'2-CustomerUserIDCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::CustomerPermission::CustomerUserIDCheck',
  'Required' => '0'
};
$Self->{'CustomerTicket::Permission'}->{'1-GroupCheck'} =  {
  'Granted' => '0',
  'Module' => 'Kernel::System::Ticket::CustomerPermission::GroupCheck',
  'Required' => '1'
};
$Self->{'Ticket::Permission'}->{'4-WatcherCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::Permission::WatcherCheck',
  'Required' => '0'
};
$Self->{'Ticket::Permission'}->{'3-GroupCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::Permission::GroupCheck',
  'Required' => '0'
};
$Self->{'Ticket::Permission'}->{'2-ResponsibleCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::Permission::ResponsibleCheck',
  'Required' => '0'
};
$Self->{'Ticket::Permission'}->{'1-OwnerCheck'} =  {
  'Granted' => '1',
  'Module' => 'Kernel::System::Ticket::Permission::OwnerCheck',
  'Required' => '0'
};
$Self->{'System::Permission'} =  [
  'ro',
  'move_into',
  'create',
  'note',
  'owner',
  'priority',
  'rw'
];
$Self->{'Ticket::Frontend::PreMenuModule'}->{'445-Move'} =  {
  'Action' => 'AgentTicketMove',
  'Description' => 'Change queue!',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Move',
  'Name' => 'Move'
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'440-Close'} =  {
  'Action' => 'AgentTicketClose',
  'Description' => 'Close this ticket',
  'Link' => 'Action=AgentTicketClose;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Close',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'420-Note'} =  {
  'Action' => 'AgentTicketNote',
  'Description' => 'Add a note to this ticket',
  'Link' => 'Action=AgentTicketNote;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Note',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'300-Priority'} =  {
  'Action' => 'AgentTicketPriority',
  'Description' => 'Change the priority for this ticket',
  'Link' => 'Action=AgentTicketPriority;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Priority',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'210-History'} =  {
  'Action' => 'AgentTicketHistory',
  'Description' => 'Show the ticket history',
  'Link' => 'Action=AgentTicketHistory;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'History',
  'PopupType' => 'TicketHistory',
  'Target' => ''
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'200-Zoom'} =  {
  'Action' => 'AgentTicketZoom',
  'Description' => 'Look into a ticket!',
  'Link' => 'Action=AgentTicketZoom;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Zoom',
  'PopupType' => '',
  'Target' => ''
};
$Self->{'Ticket::Frontend::PreMenuModule'}->{'100-Lock'} =  {
  'Action' => 'AgentTicketLock',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Lock',
  'Name' => 'Lock',
  'PopupType' => '',
  'Target' => ''
};
$Self->{'TicketOverviewMenuSort'}->{'SortAttributes'} =  {
  'Age' => '1',
  'Title' => '1'
};
$Self->{'Ticket::Frontend::OverviewMenuModule'}->{'001-Sort'} =  {
  'Module' => 'Kernel::Output::HTML::TicketOverviewMenu::Sort'
};
$Self->{'Ticket::Frontend::MenuModule'}->{'428-LinkedCI'} =  {
  'Action' => 'CIGraphView',
  'ClusterName' => 'Communication',
  'ClusterPriority' => '',
  'Description' => 'Show Linked CI',
  'Link' => 'Action=CIGraphView;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Linked CI',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'451-ChangeStatus'} =  {
  'Action' => 'AgentTicketFreeText',
  'Description' => 'Change the free fields for this ticket',
  'Link' => 'Action=AgentTicketFreeText;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Change Status',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'450-Close'} =  {
  'Action' => 'AgentTicketClose',
  'ClusterName' => '',
  'ClusterPriority' => '',
  'Description' => 'Close this ticket',
  'Link' => 'Action=AgentTicketClose;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Close',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'448-Watch'} =  {
  'Action' => 'AgentTicketWatcher',
  'ClusterName' => '',
  'ClusterPriority' => '',
  'Description' => 'Watch this ticket',
  'Module' => 'Kernel::Output::HTML::TicketMenu::TicketWatcher',
  'Name' => 'Watch',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'440-Pending'} =  {
  'Action' => 'AgentTicketPending',
  'ClusterName' => '',
  'ClusterPriority' => '',
  'Description' => 'Set this ticket to pending',
  'Link' => 'Action=AgentTicketPending;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Pending',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'430-Merge'} =  {
  'Action' => 'AgentTicketMerge',
  'ClusterName' => 'Miscellaneous',
  'ClusterPriority' => '800',
  'Description' => 'Merge this ticket and all articles into a another ticket',
  'Link' => 'Action=AgentTicketMerge;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Merge',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'427-Email Outbound'} =  {
  'Action' => 'AgentTicketEmailOutbound',
  'ClusterName' => 'Communication',
  'ClusterPriority' => '435',
  'Description' => 'Send new outgoing mail from this ticket',
  'Link' => 'Action=AgentTicketEmailOutbound;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'E-Mail Outbound',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'426-Phone Call Inbound'} =  {
  'Action' => 'AgentTicketPhoneInbound',
  'ClusterName' => 'Communication',
  'ClusterPriority' => '435',
  'Description' => 'Add an inbound phone call to this ticket',
  'Link' => 'Action=AgentTicketPhoneInbound;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Phone Call Inbound',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'425-Phone Call Outbound'} =  {
  'Action' => 'AgentTicketPhoneOutbound',
  'ClusterName' => 'Communication',
  'ClusterPriority' => '435',
  'Description' => 'Add an outbound phone call to this ticket',
  'Link' => 'Action=AgentTicketPhoneOutbound;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Phone Call Outbound',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'420-Note'} =  {
  'Action' => 'AgentTicketNote',
  'ClusterName' => 'Communication',
  'ClusterPriority' => '435',
  'Description' => 'Add a note to this ticket',
  'Link' => 'Action=AgentTicketNote;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Note',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'420-Customer'} =  {
  'Action' => 'AgentTicketCustomer',
  'ClusterName' => 'People',
  'ClusterPriority' => '430',
  'Description' => 'Change the customer for this ticket',
  'Link' => 'Action=AgentTicketCustomer;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Customer',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'410-Responsible'} =  {
  'Action' => 'AgentTicketResponsible',
  'ClusterName' => 'People',
  'ClusterPriority' => '430',
  'Description' => 'Change the responsible for this ticket',
  'Link' => 'Action=AgentTicketResponsible;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Responsible',
  'Name' => 'Responsible',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'400-Owner'} =  {
  'Action' => 'AgentTicketOwner',
  'ClusterName' => 'People',
  'ClusterPriority' => '430',
  'Description' => 'Change the owner for this ticket',
  'Link' => 'Action=AgentTicketOwner;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Owner',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'320-Link'} =  {
  'Action' => 'AgentLinkObject',
  'ClusterName' => 'Miscellaneous',
  'ClusterPriority' => '800',
  'Description' => 'Link this ticket to other objects',
  'Link' => 'Action=AgentLinkObject;SourceObject=Ticket;SourceKey=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Link',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'310-FreeText'} =  {
  'Action' => 'AgentTicketFreeText',
  'ClusterName' => 'Miscellaneous',
  'ClusterPriority' => '800',
  'Description' => 'Change the free fields for this ticket',
  'Link' => 'Action=AgentTicketFreeText;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Free Fields',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'301-AgentCustomPrinter'} =  {
  'Action' => 'AgentCustomPrinter',
  'ClusterName' => '',
  'ClusterPriority' => '',
  'Description' => 'To Print Ticket Details',
  'Link' => 'Action=AgentCustomPrinter;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Custom Print',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'300-Priority'} =  {
  'Action' => 'AgentTicketPriority',
  'ClusterName' => '',
  'ClusterPriority' => '',
  'Description' => 'Change the priority for this ticket',
  'Link' => 'Action=AgentTicketPriority;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Priority',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'210-Print'} =  {
  'Action' => 'AgentTicketPrint',
  'ClusterName' => '',
  'ClusterPriority' => '',
  'Description' => 'Print this ticket',
  'Link' => 'Action=AgentTicketPrint;TicketID=[% Data.TicketID | html %]',
  'LinkParam' => 'target="print"',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Print',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'200-History'} =  {
  'Action' => 'AgentTicketHistory',
  'ClusterName' => 'Miscellaneous',
  'ClusterPriority' => '800',
  'Description' => 'Show the history for this ticket',
  'Link' => 'Action=AgentTicketHistory;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'History',
  'PopupType' => 'TicketHistory',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'100-Lock'} =  {
  'Action' => 'AgentTicketLock',
  'ClusterName' => 'Miscellaneous',
  'ClusterPriority' => '800',
  'Description' => 'Lock / unlock this ticket',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Lock',
  'Name' => 'Lock',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'000-Back'} =  {
  'Action' => '',
  'ClusterName' => '',
  'ClusterPriority' => '',
  'Description' => 'Go back',
  'Link' => '[% Env("LastScreenOverview") %];TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Back',
  'PopupType' => '',
  'Target' => ''
};
$Self->{'Ticket::Frontend::ArticleAttachmentModule'}->{'2-HTML-Viewer'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleAttachment::HTMLViewer'
};
$Self->{'Ticket::Frontend::ArticleAttachmentModule'}->{'1-Download'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleAttachment::Download'
};
$Self->{'Ticket::Frontend::ArticleComposeModule'}->{'2-CryptEmail'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleCompose::Crypt'
};
$Self->{'Ticket::Frontend::ArticleComposeModule'}->{'1-SignEmail'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleCompose::Sign'
};
$Self->{'Ticket::Frontend::ArticlePreViewModule'}->{'1-SMIME'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleCheck::SMIME'
};
$Self->{'Ticket::Frontend::ArticlePreViewModule'}->{'1-PGP'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleCheck::PGP'
};
$Self->{'Ticket::Frontend::ArticleViewModule'}->{'1-SMIME'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleCheck::SMIME'
};
$Self->{'Ticket::Frontend::ArticleViewModule'}->{'1-PGP'} =  {
  'Module' => 'Kernel::Output::HTML::ArticleCheck::PGP'
};
$Self->{'Frontend::CustomerUser::Item'}->{'15-OpenTickets'} =  {
  'Action' => 'AgentTicketSearch',
  'Attributes' => 'StateType=Open;',
  'CSS' => 'Core.Agent.CustomerUser.OpenTicket.css',
  'CSSClassNoOpenTicket' => 'NoOpenTicket',
  'CSSClassOpenTicket' => 'OpenTicket',
  'CustomerUserLogin' => '0',
  'IconNameNoOpenTicket' => 'fa-check-circle',
  'IconNameOpenTicket' => 'fa-exclamation-circle',
  'Module' => 'Kernel::Output::HTML::CustomerUser::GenericTicket',
  'Subaction' => 'Search',
  'Target' => '_blank',
  'Text' => 'Open tickets (customer)'
};
$Self->{'Frontend::HeaderMetaModule'}->{'2-TicketSearch'} =  {
  'Action' => 'AgentTicketSearch',
  'Module' => 'Kernel::Output::HTML::HeaderMeta::AgentTicketSearch'
};
$Self->{'Frontend::ToolBarModule'}->{'9-Ticket::TicketLocked'} =  {
  'AccessKey' => 'k',
  'AccessKeyNew' => '',
  'AccessKeyReached' => '',
  'CssClass' => 'Locked',
  'CssClassNew' => 'Locked New',
  'CssClassReached' => 'Locked Reached',
  'Icon' => 'fa fa-lock',
  'IconNew' => 'fa fa-lock',
  'IconReached' => 'fa fa-lock',
  'Module' => 'Kernel::Output::HTML::ToolBar::TicketLocked',
  'Priority' => '1030030'
};
$Self->{'Frontend::ToolBarModule'}->{'8-Ticket::TicketWatcher'} =  {
  'AccessKey' => '',
  'AccessKeyNew' => '',
  'AccessKeyReached' => '',
  'CssClass' => 'Watcher',
  'CssClassNew' => 'Watcher New',
  'CssClassReached' => 'Watcher Reached',
  'Icon' => 'fa fa-eye',
  'IconNew' => 'fa fa-eye',
  'IconReached' => 'fa fa-eye',
  'Module' => 'Kernel::Output::HTML::ToolBar::TicketWatcher',
  'Priority' => '1030020'
};
$Self->{'Frontend::ToolBarModule'}->{'7-Ticket::TicketResponsible'} =  {
  'AccessKey' => 'r',
  'AccessKeyNew' => '',
  'AccessKeyReached' => '',
  'CssClass' => 'Responsible',
  'CssClassNew' => 'Responsible New',
  'CssClassReached' => 'Responsible Reached',
  'Icon' => 'fa fa-user',
  'IconNew' => 'fa fa-user',
  'IconReached' => 'fa fa-user',
  'Module' => 'Kernel::Output::HTML::ToolBar::TicketResponsible',
  'Priority' => '1030010'
};
$Self->{'CustomerDBLinkClass'} =  '';
$Self->{'CustomerDBLinkTarget'} =  '';
$Self->{'CustomerDBLink'} =  '[% Env("CGIHandle") %]?Action=AgentCustomerInformationCenter;CustomerID=[% Data.CustomerID | uri %]';
$Self->{'Ticket::StateAfterPending'} =  {
  'pending auto close+' => 'closed successful',
  'pending auto close-' => 'closed unsuccessful'
};
$Self->{'Ticket::PendingAutoStateType'} =  [
  'pending auto'
];
$Self->{'Ticket::PendingReminderStateType'} =  [
  'pending reminder'
];
$Self->{'Ticket::PendingNotificationNotToResponsible'} =  '0';
$Self->{'Ticket::PendingNotificationOnlyToOwner'} =  '0';
$Self->{'Ticket::UnlockStateType'} =  [
  'new',
  'open'
];
$Self->{'Ticket::ViewableStateType'} =  [
  'new',
  'open',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::ViewableLocks'} =  [
  '\'unlock\'',
  '\'tmp_lock\''
];
$Self->{'Ticket::ViewableSenderTypes'} =  [
  '\'customer\''
];
$Self->{'Ticket::Frontend::AutomaticMergeText'} =  'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.';
$Self->{'Ticket::Frontend::AutomaticMergeSubject'} =  'Ticket Merged';
$Self->{'Ticket::Frontend::MergeText'} =  'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".';
$Self->{'Ticket::Frontend::AgentTicketCustomer::CustomerIDReadOnly'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketCustomer'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketCustomer'}->{'Permission'} =  'customer';
$Self->{'Ticket::Frontend::AgentTicketMerge'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketMerge'}->{'Permission'} =  'rw';
$Self->{'Ticket::Frontend::AgentTicketEmailOutbound'}->{'ArticleTypes'} =  [
  'email-external',
  'email-internal'
];
$Self->{'Ticket::Frontend::AgentTicketEmailOutbound'}->{'ArticleTypeDefault'} =  'email-internal';
$Self->{'Ticket::Frontend::AgentTicketEmailOutbound'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketEmailOutbound'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketEmailOutbound'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketEmailOutbound'}->{'Permission'} =  'compose';
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'ArticleTypes'} =  [
  'email-external',
  'email-internal'
];
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'ArticleTypeDefault'} =  'email-external';
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'StateDefault'} =  'closed successful';
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'Permission'} =  'forward';
$Self->{'Ticket::Frontend::ComposeExcludeCcRecipients'} =  '0';
$Self->{'Ticket::Frontend::ComposeReplaceSenderAddress'} =  '0';
$Self->{'Ticket::Frontend::ComposeAddCustomerAddress'} =  '1';
$Self->{'Ticket::Frontend::Quote'} =  '>';
$Self->{'Ticket::Frontend::ResponseFormat'} =  '[% Data.Salutation | html %]
[% Data.StdResponse | html %]
[% Data.Signature | html %]

[% Data.Created | Localize("TimeShort") %] - [% Data.OrigFromName | html %] [% Translate("wrote") | html %]:
[% Data.Body | html %]
';
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'DefaultArticleType'} =  'email-external';
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'ArticleTypes'} =  [
  'email-external',
  'email-internal'
];
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'StateType'} =  [
  'open',
  'closed',
  'pending auto',
  'pending reminder'
];
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketCompose'}->{'Permission'} =  'compose';
$Self->{'Ticket::Frontend::BounceText'} =  'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.';
$Self->{'Ticket::Frontend::AgentTicketBounce'}->{'StateType'} =  [
  'open',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketBounce'}->{'StateDefault'} =  'closed successful';
$Self->{'Ticket::Frontend::AgentTicketBounce'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBounce'}->{'Permission'} =  'bounce';
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'NoteMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'Note'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'Priority'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'StateType'} =  [
  'open',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'State'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketMove'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::MoveType'} =  'form';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'ArticleTypes'} =  {
  'note-external' => '1',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'Priority'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'State'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'Responsible'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'Owner'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'TicketType'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketBulk'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'HistoryComment'} =  '%%Responsible';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Title'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Priority'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'ArticleTypes'} =  {
  'note-external' => '0',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'InformAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'InvolvedAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'NoteMandatory'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'StateType'} =  [
  'open',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Responsible'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Queue'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketResponsible'}->{'Permission'} =  'responsible';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'HistoryComment'} =  '%%Priority';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Title'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Priority'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'ArticleTypes'} =  {
  'note-external' => '0',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'InformAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'InvolvedAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'NoteMandatory'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'StateType'} =  [
  'open',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Queue'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPriority'}->{'Permission'} =  'priority';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'HistoryComment'} =  '%%Pending';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Title'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Priority'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'ArticleTypes'} =  {
  'note-external' => '0',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'InformAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'InvolvedAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'NoteMandatory'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'StateDefault'} =  'pending reminder';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'StateType'} =  [
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'State'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Queue'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'Permission'} =  'pending';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'HistoryComment'} =  '%%Owner';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Title'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Priority'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'ArticleTypes'} =  {
  'note-external' => '0',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'InformAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'InvolvedAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'NoteMandatory'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'StateType'} =  [
  'open',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'OwnerMandatory'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Owner'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Queue'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketOwner'}->{'Permission'} =  'owner';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'HistoryComment'} =  '%%Note';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Title'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Priority'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'ArticleTypes'} =  {
  'note-external' => '1',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'InformAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'InvolvedAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'NoteMandatory'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Queue'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketNote'}->{'Permission'} =  'note';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'HistoryComment'} =  '%%Close';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Title'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Priority'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'ArticleTypes'} =  {
  'note-external' => '0',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'InformAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'InvolvedAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'NoteMandatory'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Note'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'StateDefault'} =  'closed successful';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'StateType'} =  [
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'State'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Queue'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'TicketType'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'Permission'} =  'close';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'HistoryType'} =  'EmailAgent';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'StateType'} =  [
  'open',
  'pending auto',
  'pending reminder',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketEmail::CustomerIDReadOnly'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'SenderType'} =  'agent';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'ArticleType'} =  'email-external';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'Priority'} =  '3 normal';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'SplitLinkType'} =  {
  'Direction' => 'Target',
  'LinkType' => 'ParentChild'
};
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'HistoryType'} =  'PhoneCallCustomer';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'StateType'} =  [
  'open',
  'pending auto',
  'pending reminder',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhone::AllowMultipleFrom'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPhone::CustomerIDReadOnly'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'SenderType'} =  'customer';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'ArticleType'} =  'phone';
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'Priority'} =  '3 normal';
$Self->{'NewTicketInNewWindow::Enabled'} =  '0';
$Self->{'Ticket::Frontend::ShowCustomerTickets'} =  '1';
$Self->{'Ticket::Frontend::NewQueueSelectionString'} =  '<Queue>';
$Self->{'Ticket::Frontend::NewQueueSelectionType'} =  'Queue';
$Self->{'Ticket::Frontend::NewResponsibleSelection'} =  '1';
$Self->{'Ticket::Frontend::NewOwnerSelection'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'HistoryType'} =  'PhoneCallCustomer';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'StateType'} =  [
  'open',
  'pending auto',
  'pending reminder',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'State'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'SenderType'} =  'customer';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'ArticleType'} =  'phone';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketPhoneInbound'}->{'Permission'} =  'phone';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'HistoryComment'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'HistoryType'} =  'PhoneCallAgent';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'StateType'} =  [
  'open',
  'pending auto',
  'pending reminder',
  'closed'
];
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'State'} =  'closed successful';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'SenderType'} =  'agent';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'ArticleType'} =  'phone';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'RequiredLock'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'Permission'} =  'phone';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'HistoryComment'} =  '%%FreeText';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'HistoryType'} =  'AddNote';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Title'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Priority'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'ArticleTypes'} =  {
  'note-external' => '1',
  'note-internal' => '1',
  'note-report' => '0'
};
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'ArticleTypeDefault'} =  'note-internal';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'InformAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'InvolvedAgent'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Body'} =  '';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Subject'} =  '';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'NoteMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Note'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'StateType'} =  [
  'open',
  'closed',
  'pending reminder',
  'pending auto'
];
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'State'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Responsible'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'OwnerMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Queue'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'SLAMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'ServiceMandatory'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Service'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'TicketType'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'RequiredLock'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketFreeText'}->{'Permission'} =  'rw';
$Self->{'Ticket::Frontend::AgentTicketWatchView'}->{'Order::Default'} =  'Up';
$Self->{'Ticket::Frontend::AgentTicketWatchView'}->{'SortBy::Default'} =  'Age';
$Self->{'Ticket::Frontend::AgentTicketResponsibleView'}->{'Order::Default'} =  'Up';
$Self->{'Ticket::Frontend::AgentTicketResponsibleView'}->{'SortBy::Default'} =  'Age';
$Self->{'Ticket::Frontend::AgentTicketLockedView'}->{'Order::Default'} =  'Up';
$Self->{'Ticket::Frontend::AgentTicketLockedView'}->{'SortBy::Default'} =  'Age';
$Self->{'Frontend::Search'}->{'Ticket'} =  {
  '^AgentTicket' => 'Action=AgentTicketSearch;Subaction=AJAX'
};
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'Defaults'}->{'Fulltext'} =  '';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'ArticleCreateTime'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchCSVData'} =  [
  'TicketNumber',
  'Age',
  'Created',
  'Closed',
  'FirstLock',
  'FirstResponse',
  'State',
  'Priority',
  'Queue',
  'Lock',
  'Owner',
  'UserFirstname',
  'UserLastname',
  'CustomerID',
  'CustomerName',
  'From',
  'Subject',
  'AccountedTime',
  'ArticleTree',
  'SolutionInMin',
  'SolutionDiffInMin',
  'FirstResponseInMin',
  'FirstResponseDiffInMin'
];
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchArticleCSVTree'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'Order::Default'} =  'Down';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SortBy::Default'} =  'Age';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchViewableTicketLines'} =  '10';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchPageShown'} =  '40';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'SearchLimit'} =  '2000';
$Self->{'Ticket::Frontend::AgentTicketSearch'}->{'ExtendedSearchCondition'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketEscalationView'}->{'Order::Default'} =  'Up';
$Self->{'Ticket::Frontend::AgentTicketEscalationView'}->{'SortBy::Default'} =  'EscalationTime';
$Self->{'Ticket::Frontend::AgentTicketEscalationView'}->{'ViewableTicketsPage'} =  '50';
$Self->{'Ticket::Frontend::AgentTicketEscalationView'}->{'TicketPermission'} =  'rw';
$Self->{'Ticket::Frontend::AgentTicketStatusView'}->{'Order::Default'} =  'Down';
$Self->{'Ticket::Frontend::AgentTicketStatusView'}->{'SortBy::Default'} =  'Age';
$Self->{'Ticket::Frontend::AgentTicketStatusView'}->{'ViewableTicketsPage'} =  '50';
$Self->{'Ticket::Frontend::NeedSpellCheck'} =  '0';
$Self->{'Ticket::Frontend::BulkAccountedTime'} =  '1';
$Self->{'Ticket::Frontend::NeedAccountedTime'} =  '0';
$Self->{'Ticket::Frontend::TimeUnits'} =  ' (work units)';
$Self->{'Ticket::Frontend::AccountTime'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketService'}->{'Order::Default'} =  'Up';
$Self->{'Ticket::Frontend::AgentTicketService'}->{'PreSort::ByPriority'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketService'}->{'SortBy::Default'} =  'Age';
$Self->{'Ticket::Frontend::AgentTicketService'}->{'ViewAllPossibleTickets'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketService'}->{'StripEmptyLines'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'Order::Default'} =  'Up';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'PreSort::ByPriority'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'SortBy::Default'} =  'Age';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'UseSubQueues'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'Blink'} =  '1';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'HighlightAge2'} =  '2880';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'HighlightAge1'} =  '1440';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'HideEmptyQueues'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'ViewAllPossibleTickets'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketQueue'}->{'StripEmptyLines'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketOverview'}->{'DynamicField'} =  {};
$Self->{'Ticket::Frontend::CustomerTicketOverview'}->{'Queue'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketOverview'}->{'Owner'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketOverview'}->{'ColumnHeader'} =  'TicketTitle';
$Self->{'Ticket::Frontend::CustomerDisableCompanyTicketAccess'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketOverviewSortable'} =  '';
$Self->{'Ticket::Frontend::DynamicFieldsZoomMaxSizeArticle'} =  '160';
$Self->{'Ticket::Frontend::DynamicFieldsZoomMaxSizeSidebar'} =  '18';
$Self->{'Ticket::Frontend::CustomerInfoZoomMaxSize'} =  '22';
$Self->{'Ticket::Frontend::CustomerInfoZoom'} =  '1';
$Self->{'Ticket::Frontend::CustomerInfoComposeMaxSize'} =  '22';
$Self->{'Ticket::Frontend::CustomerInfoCompose'} =  '1';
$Self->{'Ticket::Frontend::InvolvedAgentMaxSize'} =  '3';
$Self->{'Ticket::Frontend::InformAgentMaxSize'} =  '3';
$Self->{'Ticket::Frontend::TextAreaNote'} =  '78';
$Self->{'Ticket::Frontend::TextAreaEmail'} =  '82';
$Self->{'Ticket::Frontend::HistoryTypes'}->{'000-Framework'} =  {
  'AddNote' => 'Added note (%s)',
  'ArchiveFlagUpdate' => 'Archive state changed: "%s"',
  'Bounce' => 'Bounced to "%s".',
  'CustomerUpdate' => 'Updated: %s',
  'EmailAgent' => 'Email sent to customer.',
  'EmailCustomer' => 'Added email. %s',
  'EscalationResponseTimeNotifyBefore' => 'Escalation response time forewarned',
  'EscalationResponseTimeStart' => 'Escalation response time in effect',
  'EscalationResponseTimeStop' => 'Escalation response time finished',
  'EscalationSolutionTimeNotifyBefore' => 'Escalation solution time forewarned',
  'EscalationSolutionTimeStart' => 'Escalation solution time in effect',
  'EscalationSolutionTimeStop' => 'Escalation solution time finished',
  'EscalationUpdateTimeNotifyBefore' => 'Escalation update time forewarned',
  'EscalationUpdateTimeStart' => 'Escalation update time in effect',
  'EscalationUpdateTimeStop' => 'Escalation update time finished',
  'FollowUp' => 'FollowUp for [%s]. %s',
  'Forward' => 'Forwarded to "%s".',
  'Lock' => 'Locked ticket.',
  'LoopProtection' => 'Loop-Protection! No auto-response sent to "%s".',
  'Misc' => '%s',
  'Move' => 'Ticket moved into Queue "%s" (%s) from Queue "%s" (%s).',
  'NewTicket' => 'New Ticket [%s] created (Q=%s;P=%s;S=%s).',
  'OwnerUpdate' => 'New owner is "%s" (ID=%s).',
  'PhoneCallAgent' => 'Agent called customer.',
  'PhoneCallCustomer' => 'Customer called us.',
  'PriorityUpdate' => 'Changed priority from "%s" (%s) to "%s" (%s).',
  'Remove' => '%s',
  'ResponsibleUpdate' => 'New responsible is "%s" (ID=%s).',
  'SLAUpdate' => 'Updated SLA to %s (ID=%s).',
  'SendAgentNotification' => '"%s" notification was sent to "%s" by "%s".',
  'SendAnswer' => 'Email sent to "%s".',
  'SendAutoFollowUp' => 'AutoFollowUp sent to "%s".',
  'SendAutoReject' => 'AutoReject sent to "%s".',
  'SendAutoReply' => 'AutoReply sent to "%s".',
  'SendCustomerNotification' => 'Notification sent to "%s".',
  'ServiceUpdate' => 'Updated Service to %s (ID=%s).',
  'SetPendingTime' => 'Updated: %s',
  'StateUpdate' => 'Old: "%s" New: "%s"',
  'Subscribe' => 'Added subscription for user "%s".',
  'SystemRequest' => 'System Request (%s).',
  'TicketDynamicFieldUpdate' => 'Updated: %s=%s;%s=%s;%s=%s;',
  'TicketLinkAdd' => 'Added link to ticket "%s".',
  'TicketLinkDelete' => 'Deleted link to ticket "%s".',
  'TimeAccounting' => '%s time unit(s) accounted. Now total %s time unit(s).',
  'TitleUpdate' => 'Title updated: Old: "%s", New: "%s"',
  'TypeUpdate' => 'Updated Type to %s (ID=%s).',
  'Unlock' => 'Unlocked ticket.',
  'Unsubscribe' => 'Removed subscription for user "%s".',
  'WebRequestCustomer' => 'Customer request via web.'
};
$Self->{'Ticket::Frontend::HistoryOrder'} =  'normal';
$Self->{'Ticket::Frontend::TicketArticleFilter'} =  '0';
$Self->{'Ticket::UseArticleColors'} =  '1';
$Self->{'Ticket::ZoomTimeDisplay'} =  '0';
$Self->{'Ticket::ZoomAttachmentDisplayCount'} =  '20';
$Self->{'Ticket::Frontend::ZoomExpandSort'} =  'reverse';
$Self->{'Ticket::Frontend::ZoomExpand'} =  '0';
$Self->{'Ticket::Frontend::PlainView'} =  '0';
$Self->{'Ticket::Frontend::BulkFeature'} =  '1';
$Self->{'Ticket::Watcher'} =  '0';
$Self->{'Ticket::Frontend::ListType'} =  'tree';
$Self->{'Ticket::Frontend::MaxQueueLevel'} =  '5';
$Self->{'Ticket::Frontend::PendingDiffTime'} =  '86400';
$Self->{'Ticket::Frontend::Overview::PreviewArticleLimit'} =  '5';
$Self->{'Ticket::Frontend::Overview'}->{'Preview'} =  {
  'CustomerInfo' => '0',
  'CustomerInfoMaxSize' => '18',
  'DefaultPreViewLines' => '25',
  'DefaultViewNewLine' => '90',
  'Module' => 'Kernel::Output::HTML::TicketOverview::Preview',
  'ModulePriority' => '300',
  'Name' => 'Large',
  'NameShort' => 'L',
  'OverviewMenuModules' => '1',
  'StripEmptyLines' => '0',
  'TicketActionsPerTicket' => '1'
};
$Self->{'Ticket::Frontend::Overview'}->{'Medium'} =  {
  'CustomerInfo' => '0',
  'Module' => 'Kernel::Output::HTML::TicketOverview::Medium',
  'ModulePriority' => '200',
  'Name' => 'Medium',
  'NameShort' => 'M',
  'OverviewMenuModules' => '1',
  'TicketActionsPerTicket' => '1'
};
$Self->{'Ticket::Frontend::OverviewSmall'}->{'ColumnHeader'} =  'LastCustomerSubject';
$Self->{'Ticket::Frontend::Overview'}->{'Small'} =  {
  'CustomerInfo' => '1',
  'Module' => 'Kernel::Output::HTML::TicketOverview::Small',
  'ModulePriority' => '100',
  'Name' => 'Small',
  'NameShort' => 'S'
};
$Self->{'Ticket::EventModulePost'}->{'098-ArticleSearchIndex'} =  {
  'Event' => '(ArticleCreate|ArticleUpdate)',
  'Module' => 'Kernel::System::Ticket::Event::ArticleSearchIndex'
};
$Self->{'Ticket::SearchIndex::StopWords'}->{'it'} =  [
  'a',
  'adesso',
  'ai',
  'al',
  'alla',
  'allo',
  'allora',
  'altre',
  'altri',
  'altro',
  'anche',
  'ancora',
  'avere',
  'aveva',
  'avevano',
  'ben',
  'buono',
  'che',
  'chi',
  'cinque',
  'comprare',
  'con',
  'consecutivi',
  'consecutivo',
  'cosa',
  'cui',
  'da',
  'del',
  'della',
  'dello',
  'dentro',
  'deve',
  'devo',
  'di',
  'doppio',
  'due',
  'e',
  'ecco',
  'fare',
  'fine',
  'fino',
  'fra',
  'gente',
  'giu',
  'ha',
  'hai',
  'hanno',
  'ho',
  'il',
  'indietro',
  'invece',
  'io',
  'la',
  'lavoro',
  'le',
  'lei',
  'lo',
  'loro',
  'lui',
  'lungo',
  'ma',
  'me',
  'meglio',
  'molta',
  'molti',
  'molto',
  'nei',
  'nella',
  'no',
  'noi',
  'nome',
  'nostro',
  'nove',
  'nuovi',
  'nuovo',
  'o',
  'oltre',
  'ora',
  'otto',
  'peggio',
  'pero',
  'persone',
  'piu',
  'poco',
  'primo',
  'promesso',
  'qua',
  'quarto',
  'quasi',
  'quattro',
  'quello',
  'questo',
  'qui',
  'quindi',
  'quinto',
  'rispetto',
  'sara',
  'secondo',
  'sei',
  'sembra',
  'sembrava',
  'senza',
  'sette',
  'sia',
  'siamo',
  'siete',
  'solo',
  'sono',
  'sopra',
  'soprattutto',
  'sotto',
  'stati',
  'stato',
  'stesso',
  'su',
  'subito',
  'sul',
  'sulla',
  'tanto',
  'te',
  'tempo',
  'terzo',
  'tra',
  'tre',
  'triplo',
  'ultimo',
  'un',
  'una',
  'uno',
  'va',
  'vai',
  'voi',
  'volte',
  'vostro'
];
$Self->{'Ticket::SearchIndex::StopWords'}->{'fr'} =  [
  'alors',
  'au',
  'aucuns',
  'aussi',
  'autre',
  'avant',
  'avec',
  'avoir',
  'bon',
  'car',
  'ce',
  'cela',
  'ces',
  'ceux',
  'chaque',
  'ci',
  'comme',
  'comment',
  'dans',
  'des',
  'du',
  'dedans',
  'dehors',
  'depuis',
  'deux',
  'devrait',
  'doit',
  'donc',
  'dos',
  'droite',
  'début',
  'elle',
  'elles',
  'en',
  'encore',
  'essai',
  'est',
  'et',
  'eu',
  'fait',
  'faites',
  'fois',
  'font',
  'force',
  'haut',
  'hors',
  'ici',
  'il',
  'ils',
  'je',
  'juste',
  'la',
  'le',
  'les',
  'leur',
  'là',
  'ma',
  'maintenant',
  'mais',
  'mes',
  'mine',
  'moins',
  'mon',
  'mot',
  'même',
  'ni',
  'nommés',
  'notre',
  'nous',
  'nouveaux',
  'ou',
  'où',
  'par',
  'parce',
  'parole',
  'pas',
  'personnes',
  'peut',
  'peu',
  'pièce',
  'plupart',
  'pour',
  'pourquoi',
  'quand',
  'que',
  'quel',
  'quelle',
  'quelles',
  'quels',
  'qui',
  'sa',
  'sans',
  'ses',
  'seulement',
  'si',
  'sien',
  'son',
  'sont',
  'sous',
  'soyez',
  'sujet',
  'sur',
  'ta',
  'tandis',
  'tellement',
  'tels',
  'tes',
  'ton',
  'tous',
  'tout',
  'trop',
  'très',
  'tu',
  'valeur',
  'voie',
  'voient',
  'vont',
  'votre',
  'vous',
  'vu',
  'ça',
  'étaient',
  'état',
  'étions',
  'été',
  'être'
];
$Self->{'Ticket::SearchIndex::StopWords'}->{'es'} =  [
  'un',
  'una',
  'unas',
  'unos',
  'uno',
  'sobre',
  'todo',
  'también',
  'tras',
  'otro',
  'algún',
  'alguno',
  'alguna',
  'algunos',
  'algunas',
  'ser',
  'es',
  'soy',
  'eres',
  'somos',
  'sois',
  'estoy',
  'esta',
  'estamos',
  'estais',
  'estan',
  'como',
  'en',
  'para',
  'atras',
  'porque',
  'por qué',
  'estado',
  'estaba',
  'ante',
  'antes',
  'siendo',
  'ambos',
  'pero',
  'por',
  'poder',
  'puede',
  'puedo',
  'podemos',
  'podeis',
  'pueden',
  'fui',
  'fue',
  'fuimos',
  'fueron',
  'hacer',
  'hago',
  'hace',
  'hacemos',
  'haceis',
  'hacen',
  'cada',
  'fin',
  'incluso',
  'primero',
  'desde',
  'conseguir',
  'consigo',
  'consigue',
  'consigues',
  'conseguimos',
  'consiguen',
  'ir',
  'voy',
  'va',
  'vamos',
  'vais',
  'van',
  'vaya',
  'gueno',
  'ha',
  'tener',
  'tengo',
  'tiene',
  'tenemos',
  'teneis',
  'tienen',
  'el',
  'la',
  'lo',
  'las',
  'los',
  'su',
  'aqui',
  'mio',
  'tuyo',
  'ellos',
  'ellas',
  'nos',
  'nosotros',
  'vosotros',
  'vosotras',
  'si',
  'dentro',
  'solo',
  'solamente',
  'saber',
  'sabes',
  'sabe',
  'sabemos',
  'sabeis',
  'saben',
  'ultimo',
  'largo',
  'bastante',
  'haces',
  'muchos',
  'aquellos',
  'aquellas',
  'sus',
  'entonces',
  'tiempo',
  'verdad',
  'verdadero',
  'verdadera',
  'cierto',
  'ciertos',
  'cierta',
  'ciertas',
  'intentar',
  'intento',
  'intenta',
  'intentas',
  'intentamos',
  'intentais',
  'intentan',
  'dos',
  'bajo',
  'arriba',
  'encima',
  'usar',
  'uso',
  'usas',
  'usa',
  'usamos',
  'usais',
  'usan',
  'emplear',
  'empleo',
  'empleas',
  'emplean',
  'ampleamos',
  'empleais',
  'valor',
  'muy',
  'era',
  'eras',
  'eramos',
  'eran',
  'modo',
  'bien',
  'cual',
  'cuando',
  'donde',
  'mientras',
  'quien',
  'con',
  'entre',
  'sin',
  'trabajo',
  'trabajar',
  'trabajas',
  'trabaja',
  'trabajamos',
  'trabajais',
  'trabajan',
  'podria',
  'podrias',
  'podriamos',
  'podrian',
  'podriais',
  'yo',
  'aquel'
];
$Self->{'Ticket::SearchIndex::StopWords'}->{'nl'} =  [
  'de',
  'zijn',
  'een',
  'en',
  'in',
  'je',
  'het',
  'van',
  'op',
  'ze',
  'hebben',
  'het',
  'hij',
  'niet',
  'met',
  'er',
  'dat',
  'die',
  'te',
  'wat',
  'voor',
  'naar',
  'gaan',
  'kunnen',
  'zeggen',
  'dat',
  'maar',
  'aan',
  'veel',
  'zijn',
  'worden',
  'uit',
  'ook',
  'komen',
  'als',
  'om',
  'moeten',
  'we',
  'doen',
  'bij',
  'goed',
  'haar',
  'dan',
  'nog',
  'of',
  'maken',
  'zo',
  'wel',
  'mijn',
  'zien',
  'over',
  'willen',
  'staan',
  'door',
  'kijken',
  'zullen',
  'heel',
  'nu',
  'weten',
  'zitten',
  'hem',
  'schrijven',
  'vinden',
  'woord',
  'hoe',
  'geen',
  'dit',
  'mens',
  'al',
  'jij',
  'ander',
  'groot',
  'waar',
  'maar',
  'weer',
  'kind',
  'me',
  'vragen',
  'een',
  'denken',
  'twee',
  'horen',
  'iets',
  'deze',
  'krijgen',
  'ons',
  'zich',
  'lezen',
  'hun',
  'welk',
  'zin',
  'laten',
  'mogen',
  'hier',
  'jullie',
  'toch',
  'geven',
  'jaar',
  'tegen',
  'al',
  'eens',
  'echt',
  'houden',
  'alleen',
  'lopen',
  'mee',
  'ja',
  'roepen',
  'tijd',
  'dag',
  'elkaar',
  'even',
  'lang',
  'land',
  'liggen',
  'waarom',
  'zetten',
  'vader',
  'laat',
  'beginnen',
  'blijven',
  'nee',
  'moeder',
  'huis',
  'nou',
  'na',
  'af',
  'keer',
  'dus',
  'tot',
  'vertellen',
  'wie',
  'net',
  'jou',
  'les',
  'want',
  'man',
  'nieuw',
  'elk',
  'tekst',
  'omdat',
  'gebruiken',
  'u'
];
$Self->{'Ticket::SearchIndex::StopWords'}->{'de'} =  [
  'aber',
  'als',
  'am',
  'an',
  'auch',
  'auf',
  'aus',
  'bei',
  'bin',
  'bis',
  'bist',
  'da',
  'dadurch',
  'daher',
  'darum',
  'das',
  'daß',
  'dass',
  'dein',
  'deine',
  'dem',
  'den',
  'der',
  'des',
  'dessen',
  'deshalb',
  'die',
  'dies',
  'dieser',
  'dieses',
  'doch',
  'dort',
  'du',
  'durch',
  'ein',
  'eine',
  'einem',
  'einen',
  'einer',
  'eines',
  'er',
  'es',
  'euer',
  'eure',
  'für',
  'hatte',
  'hatten',
  'hattest',
  'hattet',
  'hier',
  'hinter',
  'ich',
  'ihr',
  'ihre',
  'im',
  'in',
  'ist',
  'ja',
  'jede',
  'jedem',
  'jeden',
  'jeder',
  'jedes',
  'jener',
  'jenes',
  'jetzt',
  'kann',
  'kannst',
  'können',
  'könnt',
  'machen',
  'mein',
  'meine',
  'mit',
  'muß',
  'mußt',
  'musst',
  'müssen',
  'müßt',
  'nach',
  'nachdem',
  'nein',
  'nicht',
  'nun',
  'oder',
  'seid',
  'sein',
  'seine',
  'sich',
  'sie',
  'sind',
  'soll',
  'sollen',
  'sollst',
  'sollt',
  'sonst',
  'soweit',
  'sowie',
  'und',
  'unser',
  'unsere',
  'unter',
  'vom',
  'von',
  'vor',
  'wann',
  'warum',
  'was',
  'weiter',
  'weitere',
  'wenn',
  'wer',
  'werde',
  'werden',
  'werdet',
  'weshalb',
  'wie',
  'wieder',
  'wieso',
  'wir',
  'wird',
  'wirst',
  'wo',
  'woher',
  'wohin',
  'zu',
  'zum',
  'zur',
  'über'
];
$Self->{'Ticket::SearchIndex::StopWords'}->{'en'} =  [
  'a',
  'about',
  'above',
  'after',
  'again',
  'against',
  'all',
  'am',
  'an',
  'and',
  'any',
  'are',
  'aren\'t',
  'as',
  'at',
  'be',
  'because',
  'been',
  'before',
  'being',
  'below',
  'between',
  'both',
  'but',
  'by',
  'can\'t',
  'cannot',
  'could',
  'couldn\'t',
  'did',
  'didn\'t',
  'do',
  'does',
  'doesn\'t',
  'doing',
  'don\'t',
  'down',
  'during',
  'each',
  'few',
  'for',
  'from',
  'further',
  'had',
  'hadn\'t',
  'has',
  'hasn\'t',
  'have',
  'haven\'t',
  'having',
  'he',
  'he\'d',
  'he\'ll',
  'he\'s',
  'her',
  'here',
  'here\'s',
  'hers',
  'herself',
  'him',
  'himself',
  'his',
  'how',
  'how\'s',
  'i',
  'i\'d',
  'i\'ll',
  'i\'m',
  'i\'ve',
  'if',
  'in',
  'into',
  'is',
  'isn\'t',
  'it',
  'it\'s',
  'its',
  'itself',
  'let\'s',
  'me',
  'more',
  'most',
  'mustn\'t',
  'my',
  'myself',
  'no',
  'nor',
  'not',
  'of',
  'off',
  'on',
  'once',
  'only',
  'or',
  'other',
  'ought',
  'our',
  'ours',
  'ourselves',
  'out',
  'over',
  'own',
  'same',
  'shan\'t',
  'she',
  'she\'d',
  'she\'ll',
  'she\'s',
  'should',
  'shouldn\'t',
  'so',
  'some',
  'such',
  'than',
  'that',
  'that\'s',
  'the',
  'their',
  'theirs',
  'them',
  'themselves',
  'then',
  'there',
  'there\'s',
  'these',
  'they',
  'they\'d',
  'they\'ll',
  'they\'re',
  'they\'ve',
  'this',
  'those',
  'through',
  'to',
  'too',
  'under',
  'until',
  'up',
  'very',
  'was',
  'wasn\'t',
  'we',
  'we\'d',
  'we\'ll',
  'we\'re',
  'we\'ve',
  'were',
  'weren\'t',
  'what',
  'what\'s',
  'when',
  'when\'s',
  'where',
  'where\'s',
  'which',
  'while',
  'who',
  'who\'s',
  'whom',
  'why',
  'why\'s',
  'with',
  'won\'t',
  'would',
  'wouldn\'t',
  'you',
  'you\'d',
  'you\'ll',
  'you\'re',
  'you\'ve',
  'your',
  'yours',
  'yourself',
  'yourselves'
];
$Self->{'Ticket::SearchIndex::Filters'} =  [
  '[,\\&\\<\\>\\?"\\!\\*\\|;\\[\\]\\(\\)\\+\\$\\^=]',
  '^[\':.]|[\':.]$',
  '^[^\\w]+$'
];
$Self->{'Ticket::SearchIndex::Attribute'} =  {
  'WordCountMax' => '1000',
  'WordLengthMax' => '30',
  'WordLengthMin' => '3'
};
$Self->{'Ticket::SearchIndex::WarnOnStopWordUsage'} =  '0';
$Self->{'Ticket::SearchIndexModule'} =  'Kernel::System::Ticket::ArticleSearchIndex::RuntimeDB';
$Self->{'CustomerUser::EventModulePost'}->{'120-UpdateTickets'} =  {
  'Event' => 'CustomerUserUpdate',
  'Module' => 'Kernel::System::CustomerUser::Event::TicketUpdate',
  'Transaction' => '0'
};
$Self->{'CustomerCompany::EventModulePost'}->{'110-UpdateTickets'} =  {
  'Event' => 'CustomerCompanyUpdate',
  'Module' => 'Kernel::System::CustomerCompany::Event::TicketUpdate',
  'Transaction' => '0'
};
$Self->{'Ticket::EventModulePost'}->{'940-TicketArticleNewMessageUpdate'} =  {
  'Event' => 'ArticleCreate|ArticleFlagSet',
  'Module' => 'Kernel::System::Ticket::Event::TicketNewMessageUpdate'
};
$Self->{'Ticket::EventModulePost'}->{'930-ForceUnlockOnMove'} =  {
  'Event' => 'TicketQueueUpdate',
  'Module' => 'Kernel::System::Ticket::Event::ForceUnlock'
};
$Self->{'Ticket::EventModulePost'}->{'920-EscalationStopEvents'} =  {
  'Event' => 'TicketSLAUpdate|TicketQueueUpdate|TicketStateUpdate|ArticleCreate',
  'Module' => 'Kernel::System::Ticket::Event::TriggerEscalationStopEvents'
};
$Self->{'Ticket::EventModulePost'}->{'910-EscalationIndex'} =  {
  'Event' => 'TicketSLAUpdate|TicketQueueUpdate|TicketStateUpdate|TicketCreate|ArticleCreate',
  'Module' => 'Kernel::System::Ticket::Event::TicketEscalationIndex'
};
$Self->{'Ticket::EventModulePost'}->{'500-NotificationEvent'} =  {
  'Event' => '',
  'Module' => 'Kernel::System::Ticket::Event::NotificationEvent',
  'Transaction' => '1'
};
$Self->{'Ticket::EventModulePost'}->{'150-TicketPendingTimeReset'} =  {
  'Event' => 'TicketStateUpdate',
  'Module' => 'Kernel::System::Ticket::Event::TicketPendingTimeReset'
};
$Self->{'Ticket::EventModulePost'}->{'140-ResponsibleAutoSet'} =  {
  'Event' => 'TicketOwnerUpdate',
  'Module' => 'Kernel::System::Ticket::Event::ResponsibleAutoSet'
};
$Self->{'Ticket::EventModulePost'}->{'110-AcceleratorUpdate'} =  {
  'Event' => 'TicketStateUpdate|TicketQueueUpdate|TicketLockUpdate',
  'Module' => 'Kernel::System::Ticket::Event::TicketAcceleratorUpdate'
};
$Self->{'Ticket::EventModulePost'}->{'100-ArchiveRestore'} =  {
  'Event' => 'TicketStateUpdate',
  'Module' => 'Kernel::System::Ticket::Event::ArchiveRestore'
};
$Self->{'OTRSEscalationEvents::DecayTime'} =  '1440';
$Self->{'ArticleDir'} =  '<OTRS_CONFIG_Home>/var/article';
$Self->{'Ticket::StorageModule::CheckAllBackends'} =  '0';
$Self->{'Ticket::StorageModule'} =  'Kernel::System::Ticket::ArticleStorageDB';
$Self->{'Ticket::IndexModule'} =  'Kernel::System::Ticket::IndexAccelerator::RuntimeDB';
$Self->{'Ticket::CounterLog'} =  '<OTRS_CONFIG_Home>/var/log/TicketCounter.log';
$Self->{'Ticket::NumberGenerator::Date::UseFormattedCounter'} =  '0';
$Self->{'Ticket::NumberGenerator::MinCounterSize'} =  '5';
$Self->{'Ticket::NumberGenerator::CheckSystemID'} =  '1';
$Self->{'Ticket::NumberGenerator'} =  'Kernel::System::Ticket::Number::DateChecksum';
$Self->{'Ticket::CustomerArchiveSystem'} =  '0';
$Self->{'Ticket::ArchiveSystem::RemoveTicketWatchers'} =  '1';
$Self->{'Ticket::ArchiveSystem::RemoveSeenFlags'} =  '1';
$Self->{'Ticket::ArchiveSystem'} =  '0';
$Self->{'Ticket::Service::Default::UnknownCustomer'} =  '0';
$Self->{'Ticket::Service::KeepChildren'} =  '0';
$Self->{'Ticket::Type::Default'} =  'Unclassified';
$Self->{'Ticket::ResponsibleAutoSet'} =  '1';
$Self->{'Ticket::Responsible'} =  '0';
$Self->{'Ticket::ChangeOwnerToEveryone'} =  '0';
$Self->{'Ticket::NewArticleIgnoreSystemSender'} =  '0';
$Self->{'Ticket::CustomService'} =  'My Services';
$Self->{'Ticket::CustomQueue'} =  'My Queues';
$Self->{'Ticket::MergeDynamicFields'} =  [];
$Self->{'Ticket::SubjectFormat'} =  'Left';
$Self->{'Ticket::SubjectFwd'} =  'Fwd';
$Self->{'Ticket::SubjectRe'} =  'Re';
$Self->{'Ticket::SubjectSize'} =  '100';
$Self->{'Ticket::HookDivider'} =  '';
$Self->{'Ticket::Hook'} =  'Ticket#';
$Self->{'Survey::Frontend::MenuModule'}->{'030-StatsDetails'} =  {
  'Action' => 'AgentSurveyStats',
  'Description' => 'Zoom into statistics details.',
  'Link' => 'Action=AgentSurveyStats;SurveyID=[% Data.SurveyID | html %]',
  'Module' => 'Kernel::Output::HTML::SurveyMenu::Generic',
  'Name' => 'Stats Details',
  'Target' => 'PopUp'
};
$Self->{'Survey::Frontend::MenuModule'}->{'020-EditQuestions'} =  {
  'Action' => 'AgentSurveyEditQuestions',
  'Description' => 'Edit survey questions.',
  'Link' => 'Action=AgentSurveyEditQuestions;SurveyID=[% Data.SurveyID | html %]',
  'Module' => 'Kernel::Output::HTML::SurveyMenu::Generic',
  'Name' => 'Edit Questions',
  'Target' => 'PopUp'
};
$Self->{'Survey::Frontend::MenuModule'}->{'010-EditGeneralInfo'} =  {
  'Action' => 'AgentSurveyEdit',
  'Description' => 'Edit survey general information.',
  'Link' => 'Action=AgentSurveyEdit;SurveyID=[% Data.SurveyID | html %]',
  'Module' => 'Kernel::Output::HTML::SurveyMenu::Generic',
  'Name' => 'Edit General Info',
  'Target' => 'PopUp'
};
$Self->{'Survey::Frontend::MenuModule'}->{'000-Back'} =  {
  'Action' => '',
  'Description' => 'Back',
  'Link' => '[% Env("LastScreenOverview") | html %]',
  'Module' => 'Kernel::Output::HTML::SurveyMenu::Generic',
  'Name' => 'Back',
  'Target' => 'Back'
};
$Self->{'PreferencesGroups'}->{'SurveyOverviewSmallPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '25',
  'Desc' => 'Select how many notifications should be shown in Survey Overview "Small" by default.',
  'Key' => 'Survey limit per page for Survey Overview "Small".',
  'Label' => 'Survey Overview "Small" Limit',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserSurveyOverviewSmallPageShown',
  'Prio' => '8000'
};
$Self->{'Survey::Hook'} =  'Survey#';
$Self->{'Survey::AmountOfSurveysPer30Days'} =  '0';
$Self->{'Survey::SendInHoursAfterClose'} =  '0';
$Self->{'Survey::Frontend::ChangeSurveyStatusGroups'} =  [];
$Self->{'Survey::Frontend::HTMLRichTextHeightMax'} =  '2500';
$Self->{'Survey::Frontend::HTMLRichTextHeightDefault'} =  '80';
$Self->{'Survey::Frontend::AgentSurveyOverview'}->{'ShowColumns'} =  {
  'ChangeBy' => '0',
  'ChangeTime' => '0',
  'CreateBy' => '0',
  'CreateTime' => '1',
  'Description' => '0',
  'Introduction' => '0',
  'NotificationBody' => '0',
  'NotificationSender' => '0',
  'NotificationSubject' => '0',
  'Number' => '1',
  'Status' => '1',
  'Title' => '1'
};
$Self->{'Survey::Frontend::Overview'}->{'Small'} =  {
  'Image' => 'overviewsmall.png',
  'ImageSelected' => 'overviewsmall-selected.png',
  'Module' => 'Kernel::Output::HTML::SurveyOverview::Small',
  'Name' => 'Small',
  'NameShort' => 'S',
  'PageShown' => '25'
};
$Self->{'Ticket::EventModulePost'}->{'99-SurveySendRequest'} =  {
  'Event' => '(ArticleCreate|TicketStateUpdate)',
  'Module' => 'Kernel::System::Ticket::Event::SurveySendRequest'
};
$Self->{'Survey::SendNoSurveyRegExp'} =  '(MAILER-DAEMON|postmaster|abuse)@.+?\\..+?';
$Self->{'Survey::NotificationBody'} =  'Dear Customer,

Thanks for using our service. Help us to improve us and our services.

Please give us feedback on how to improve our services:

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>public.pl?Action=PublicSurvey;PublicSurveyKey=<OTRS_PublicSurveyKey>

Thanks for your help!

Your OTRS-Team
            ';
$Self->{'Survey::NotificationSubject'} =  'Help us with your feedback!';
$Self->{'Survey::NotificationRecipientBlacklist'} =  [];
$Self->{'Survey::NotificationSender'} =  'quality@example.com';
$Self->{'Survey::CheckSendConditionService'} =  '0';
$Self->{'Survey::CheckSendConditionTicketType'} =  '0';
$Self->{'Survey::SendPeriod'} =  '300';
$Self->{'PublicFrontend::Module'}->{'PublicSurvey'} =  {
  'Description' => 'Public Survey.',
  'Loader' => {
    'CSS' => [
      'Survey.Customer.Default.css'
    ]
  },
  'NavBarName' => 'Survey',
  'Title' => 'Survey'
};
$Self->{'Frontend::Module'}->{'AgentSurveyEditQuestions'} =  {
  'Description' => 'A module to edit survey questions.',
  'Loader' => {
    'CSS' => [
      'Survey.Agent.Default.css'
    ]
  }
};
$Self->{'Frontend::Module'}->{'AgentSurveyZoom'} =  {
  'Description' => 'Survey Zoom Module.',
  'Loader' => {
    'CSS' => [
      'Survey.Agent.Default.css'
    ],
    'JavaScript' => [
      'Survey.Agent.SurveyZoom.js'
    ]
  },
  'NavBarName' => 'Survey'
};
$Self->{'Frontend::Module'}->{'AgentSurveyStats'} =  {
  'Description' => 'Survey Stats Module.',
  'Loader' => {
    'CSS' => [
      'Survey.Agent.Default.css'
    ]
  },
  'NavBarName' => 'Survey'
};
$Self->{'Frontend::Module'}->{'AgentSurveyEdit'} =  {
  'Description' => 'Survey Edit Module.',
  'Loader' => {
    'CSS' => [
      'Survey.Agent.Default.css'
    ]
  },
  'NavBarName' => 'Survey'
};
$Self->{'Frontend::Module'}->{'AgentSurveyAdd'} =  {
  'Description' => 'Survey Add Module.',
  'Loader' => {
    'CSS' => [
      'Survey.Agent.Default.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'New',
      'Link' => 'Action=AgentSurveyAdd',
      'Name' => 'New',
      'NavBar' => 'Survey',
      'Prio' => '200',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Survey',
  'Title' => 'Survey'
};
$Self->{'Frontend::Module'}->{'AgentSurveyOverview'} =  {
  'Description' => 'A Survey Module.',
  'Loader' => {
    'CSS' => [
      'Survey.Agent.Default.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'u',
      'Block' => 'ItemArea',
      'Description' => 'A Survey Module.',
      'Link' => 'Action=AgentSurveyOverview',
      'Name' => 'Survey',
      'NavBar' => 'Survey',
      'Prio' => '8000',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview',
      'Link' => 'Action=AgentSurveyOverview',
      'Name' => 'Overview',
      'NavBar' => 'Survey',
      'Prio' => '100',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Survey',
  'Title' => 'Survey'
};
$Self->{'Frontend::Module'}->{'CreateRequestTicket'} =  {
  'Description' => 'Create new request phone ticket.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Create New Request.',
      'Link' => 'Action=AgentTicketPhone&type=Request',
      'LinkOption' => '',
      'Name' => 'Create Request',
      'NavBar' => 'Request',
      'Prio' => '8492',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Request',
  'Title' => 'New phone ticket'
};
$Self->{'Ticket::Frontend::AgentRequest'}->{'Order::Default'} =  '';
$Self->{'Ticket::Frontend::AgentRequest'}->{'SortBy::Default'} =  '';
$Self->{'CustomerFrontend::Module'}->{'CustomerCatalog'} =  {
  'Description' => 'Customer Catalog.',
  'Loader' => {
    'CSS' => [
      'FAQ.Customer.Detail.css',
      'FAQ.Customer.Default.css',
      'FAQ.Widget.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Customer Catalog',
      'Link' => 'Action=CustomerCatalog',
      'Name' => 'Catalog',
      'NavBar' => 'Customer Catalog',
      'Prio' => '800',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Customer Catalog',
  'Title' => 'Customer Catalog'
};
$Self->{'Frontend::Module'}->{'RequestDashboard'} =  {
  'Description' => 'Overview of Request Dashboard.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview of Request Dashboard.',
      'Link' => 'Action=RequestDashboard',
      'LinkOption' => '',
      'Name' => 'Request Dashboard',
      'NavBar' => 'Request',
      'Prio' => '8459',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Request',
  'Title' => 'RequestDashboard'
};
$Self->{'Frontend::Module'}->{'AgentCatalog'} =  {
  'Description' => 'Catalog',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Catalog.',
      'Link' => 'Action=AgentCatalog',
      'LinkOption' => '',
      'Name' => 'Catalog',
      'NavBar' => 'Request',
      'Prio' => '8492',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Request',
  'Title' => 'Catalog'
};
$Self->{'Frontend::Module'}->{'ServiceList'} =  {
  'Description' => 'Service List',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview Escalated Tickets.',
      'Link' => 'Action=ServiceList',
      'LinkOption' => '',
      'Name' => 'Service List',
      'NavBar' => 'Request',
      'Prio' => '8490',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Request',
  'Title' => 'RequestEscalation'
};
$Self->{'Frontend::Module'}->{'RequestEscalation'} =  {
  'Description' => 'Overview of all escalated tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview Escalated Tickets.',
      'Link' => 'Action=RequestEscalation',
      'LinkOption' => '',
      'Name' => 'Escalation',
      'NavBar' => 'Request',
      'Prio' => '8480',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Request',
  'Title' => 'RequestEscalation'
};
$Self->{'Frontend::Module'}->{'1-Module::AgentRequest'} =  {
  'Description' => 'Overview of all Request tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview Escalated Tickets.',
      'Link' => 'Action=AgentRequest',
      'LinkOption' => '',
      'Name' => 'Overview',
      'NavBar' => 'Request',
      'Prio' => '8460',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Request',
  'Title' => 'AgentNewEscalation'
};
$Self->{'Frontend::Module'}->{'AgentRequest'} =  {
  'Description' => 'Request for Services (e.g., Update on OS)',
  'Group' => [
    'users'
  ],
  'Loader' => {
    'CSS' => [
      'Core.AgentTicketQueue.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'Block' => 'ItemArea',
      'Description' => 'Request1',
      'Link' => '',
      'Name' => 'Request',
      'NavBar' => 'Request',
      'Prio' => '8400',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Request1',
  'Title' => 'Request'
};
$Self->{'DynamicFields::Driver'}->{'ActivityID'} =  {
  'ConfigDialog' => 'AdminDynamicFieldText',
  'DisabledAdd' => '1',
  'DisplayName' => 'ActivityID',
  'Module' => 'Kernel::System::DynamicField::Driver::ProcessManagement::ActivityID'
};
$Self->{'DynamicFields::Driver'}->{'ProcessID'} =  {
  'ConfigDialog' => 'AdminDynamicFieldText',
  'DisabledAdd' => '1',
  'DisplayName' => 'ProcessID',
  'Module' => 'Kernel::System::DynamicField::Driver::ProcessManagement::ProcessID'
};
$Self->{'DashboardBackend'}->{'0140-RunningTicketProcess'} =  {
  'Attributes' => 'StateType=new;StateType=open;StateType=pending reminder;StateType=pending auto',
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '0.5',
  'Default' => '0',
  'DefaultColumns' => {
    'Age' => '2',
    'Changed' => '1',
    'CustomerID' => '1',
    'CustomerName' => '1',
    'CustomerUserID' => '1',
    'DynamicField_ProcessManagementActivityID' => '2',
    'DynamicField_ProcessManagementProcessID' => '2',
    'EscalationResponseTime' => '1',
    'EscalationSolutionTime' => '1',
    'EscalationTime' => '1',
    'EscalationUpdateTime' => '1',
    'Lock' => '1',
    'Owner' => '1',
    'PendingTime' => '1',
    'Priority' => '1',
    'Queue' => '1',
    'Responsible' => '1',
    'SLA' => '1',
    'Service' => '1',
    'State' => '1',
    'TicketNumber' => '2',
    'Title' => '2',
    'Type' => '1'
  },
  'Description' => 'All tickets with a reminder set where the reminder date has been reached',
  'Group' => '',
  'IsProcessWidget' => '1',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::TicketGeneric',
  'Permission' => 'rw',
  'Time' => 'UntilTime',
  'Title' => 'Running Process Tickets'
};
$Self->{'ProcessManagement::Transition::Debug::Enabled'} =  '0';
$Self->{'Ticket::Frontend::AgentTicketProcess::CustomerIDReadOnly'} =  '1';
$Self->{'Ticket::Frontend::CustomerTicketProcess'}->{'StateType'} =  [
  'new',
  'open'
];
$Self->{'Ticket::Frontend::AgentTicketProcess'}->{'StateType'} =  [
  'new',
  'open',
  'pending auto',
  'pending reminder',
  'closed'
];
$Self->{'Process::NavBarOutput::CacheTTL'} =  '900';
$Self->{'Process::CacheTTL'} =  '3600';
$Self->{'Process::Entity::Prefix'} =  {
  'Activity' => 'A',
  'ActivityDialog' => 'AD',
  'Process' => 'P',
  'Transition' => 'T',
  'TransitionAction' => 'TA'
};
$Self->{'CustomerFrontend::NavBarModule'}->{'10-CustomerTicketProcesses'} =  {
  'Module' => 'Kernel::Output::HTML::NavBar::CustomerTicketProcess'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerTicketProcess'} =  {
  'Description' => 'Process Ticket.',
  'Loader' => {
    'CSS' => [
      'Core.Customer.TicketProcess.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'o',
      'Block' => '',
      'Description' => 'Create new process ticket.',
      'Link' => 'Action=CustomerTicketProcess',
      'LinkOption' => '',
      'Name' => 'New process ticket',
      'NavBar' => 'Ticket',
      'Prio' => '220',
      'Type' => 'Submenu'
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Process ticket'
};
$Self->{'Ticket::Frontend::MenuModule'}->{'480-Process'} =  {
  'Action' => 'AgentTicketProcess',
  'Cluster' => '',
  'Description' => 'Enroll process for this ticket',
  'Link' => 'Action=AgentTicketProcess;IsProcessEnroll=1;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Process',
  'Name' => 'Process',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::AgentTicketZoom'}->{'ProcessWidgetDynamicField'} =  {};
$Self->{'Ticket::Frontend::AgentTicketZoom'}->{'ProcessWidgetDynamicFieldGroups'} =  {};
$Self->{'Ticket::Frontend::AgentTicketZoom'}->{'ProcessDisplay'} =  {
  'NavBarName' => 'Processes',
  'WidgetTitle' => 'Process Information'
};
$Self->{'Process::DefaultPriority'} =  '3 normal';
$Self->{'Process::DefaultLock'} =  'unlock';
$Self->{'Process::DefaultState'} =  'new';
$Self->{'Process::DefaultQueue'} =  'Raw';
$Self->{'Process::DynamicFieldProcessManagementActivityID'} =  'ProcessManagementActivityID';
$Self->{'Process::DynamicFieldProcessManagementProcessID'} =  'ProcessManagementProcessID';
$Self->{'Ticket::EventModulePost'}->{'998-TicketProcessTransitions'} =  {
  'Event' => '',
  'Module' => 'Kernel::System::Ticket::Event::TicketProcessTransitions',
  'Transaction' => '1'
};
$Self->{'Frontend::Module'}->{'AgentTicketProcess'} =  {
  'Description' => 'Create new process ticket.',
  'Loader' => {
    'CSS' => [
      'Core.Agent.TicketProcess.css'
    ],
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js',
      'Core.Agent.TicketProcess.js',
      'Custom.TicketProcess.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'p',
      'Block' => '',
      'Description' => 'Create New process ticket.',
      'Link' => 'Action=AgentTicketProcess',
      'LinkOption' => '',
      'Name' => 'New process ticket',
      'NavBar' => 'Ticket',
      'Prio' => '220',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'New process ticket'
};
$Self->{'Frontend::NavBarModule'}->{'1-TicketProcesses'} =  {
  'Module' => 'Kernel::Output::HTML::NavBar::AgentTicketProcess'
};
$Self->{'Frontend::Module'}->{'AdminProcessManagementPath'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.ProcessManagement.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.ProcessManagement.js',
      'Core.UI.AllocationList.js'
    ]
  },
  'Title' => 'Process Management Path GUI'
};
$Self->{'Frontend::Module'}->{'AdminProcessManagementTransitionAction'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.ProcessManagement.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.ProcessManagement.js'
    ]
  },
  'Title' => 'Process Management Transition Action GUI'
};
$Self->{'Frontend::Module'}->{'AdminProcessManagementTransition'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.ProcessManagement.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.ProcessManagement.js'
    ]
  },
  'Title' => 'Process Management Transition GUI'
};
$Self->{'Frontend::Module'}->{'AdminProcessManagementActivityDialog'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.ProcessManagement.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.ProcessManagement.js',
      'Core.UI.AllocationList.js'
    ]
  },
  'Title' => 'Process Management Activity Dialog GUI'
};
$Self->{'Frontend::Module'}->{'AdminProcessManagementActivity'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.ProcessManagement.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.ProcessManagement.js',
      'Core.UI.AllocationList.js'
    ]
  },
  'Title' => 'Process Management Activity GUI'
};
$Self->{'Frontend::Module'}->{'AdminProcessManagement'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.ProcessManagement.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'thirdparty/jsplumb-1.6.4/jsplumb.js',
      'thirdparty/farahey-0.5/farahey.js',
      'thirdparty/jsplumb-labelspacer/label-spacer.js',
      'Core.Agent.Admin.ProcessManagement.js',
      'Core.Agent.Admin.ProcessManagement.Canvas.js',
      'Core.UI.AllocationList.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Configure Processes.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Process Management',
    'Prio' => '750'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Process Management'
};
$Self->{'Frontend::Module'}->{'CreateProblemTicket'} =  {
  'Description' => 'Create new problem phone ticket.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Create New Problem.',
      'Link' => 'Action=AgentTicketPhone&type=Problem',
      'LinkOption' => '',
      'Name' => 'Create Problem',
      'NavBar' => 'Problem',
      'Prio' => '8494',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Problem',
  'Title' => 'New phone ticket'
};
$Self->{'Ticket::Frontend::AgentProblem'}->{'Order::Default'} =  '';
$Self->{'Ticket::Frontend::AgentProblem'}->{'SortBy::Default'} =  '';
$Self->{'Frontend::Module'}->{'ProblemDashboard'} =  {
  'Description' => 'Overview of Problem Dashboard.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview of Problem Dashboard.',
      'Link' => 'Action=ProblemDashboard',
      'LinkOption' => '',
      'Name' => 'Problem Dashboard',
      'NavBar' => 'Problem',
      'Prio' => '8459',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Problem',
  'Title' => 'ProblemDashboard'
};
$Self->{'Frontend::Module'}->{'ProblemEscalation'} =  {
  'Description' => 'Overview of all escalated tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview Escalated Tickets.',
      'Link' => 'Action=ProblemEscalation',
      'LinkOption' => '',
      'Name' => 'Escalation',
      'NavBar' => 'Problem',
      'Prio' => '8480',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Problem',
  'Title' => 'ProblemEscalation'
};
$Self->{'Frontend::Module'}->{'1-Module::AgentProblem'} =  {
  'Description' => 'Overview of all Problem tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview Escalated Tickets.',
      'Link' => 'Action=AgentProblem',
      'LinkOption' => '',
      'Name' => 'Overview',
      'NavBar' => 'Problem',
      'Prio' => '8460',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Problem',
  'Title' => 'AgentNewEscalation'
};
$Self->{'Frontend::Module'}->{'AgentProblem'} =  {
  'Description' => 'Problem To be Made from Incident',
  'Group' => [
    'users'
  ],
  'Loader' => {
    'CSS' => [
      'Core.AgentTicketQueue.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'Block' => 'ItemArea',
      'Description' => 'Problem to be created from Incident',
      'Link' => '',
      'Name' => 'Problem',
      'NavBar' => 'Problem',
      'Prio' => '8400',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Problem',
  'Title' => 'Problem'
};
$Self->{'IncidentToProblem::Config::TicketCreate'} =  {
  'NoofTickets' => '5'
};
$Self->{'IncidentToProblem::Config::TicketSearch'} =  {
  'SubjectContains' => 'DOWN',
  'TicketCreatedWithInMinutes' => '7200',
  'TitleRegExp' => '\\bAlert:\\s+(\\w+)'
};
$Self->{'Frontend::Module'}->{'CreateIncidentTicket'} =  {
  'Description' => 'Create new incident phone ticket.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Create New Incident.',
      'Link' => 'Action=AgentTicketPhone&type=Incident',
      'LinkOption' => '',
      'Name' => 'Create Incident',
      'NavBar' => 'Incident',
      'Prio' => '8493',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Incident',
  'Title' => 'New phone ticket'
};
$Self->{'Ticket::Frontend::AgentIncident'}->{'Order::Default'} =  '';
$Self->{'Ticket::Frontend::AgentIncident'}->{'SortBy::Default'} =  '';
$Self->{'Frontend::Module'}->{'IncidentDashboard'} =  {
  'Description' => 'Overview of Incident Dashboard.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview of Incident Dashboard.',
      'Link' => 'Action=IncidentDashboard',
      'LinkOption' => '',
      'Name' => 'Incident Dashboard',
      'NavBar' => 'Incident',
      'Prio' => '8459',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Incident',
  'Title' => 'IncidentDashboard'
};
$Self->{'Frontend::Module'}->{'AgentNewEscalation'} =  {
  'Description' => 'Overview of all escalated tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview Escalated Tickets.',
      'Link' => 'Action=AgentNewEscalation',
      'LinkOption' => '',
      'Name' => 'Escalation',
      'NavBar' => 'Incident',
      'Prio' => '8480',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Incident',
  'Title' => 'AgentNewEscalation'
};
$Self->{'Frontend::Module'}->{'1-Module::AgentIncident'} =  {
  'Description' => 'Overview of all Incident tickets.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview of Incident Queue Tickets.',
      'Link' => 'Action=AgentIncident',
      'LinkOption' => '',
      'Name' => 'Overview',
      'NavBar' => 'Incident',
      'Prio' => '8460',
      'Type' => 'SubMenu'
    }
  ],
  'NavBarName' => 'Incident',
  'Title' => 'AgentIncidentQueue'
};
$Self->{'Frontend::Module'}->{'AgentIncident'} =  {
  'Description' => 'Incident1',
  'Group' => [
    'users'
  ],
  'Loader' => {
    'CSS' => [
      'Core.AgentTicketQueue.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'Block' => 'ItemArea',
      'Description' => 'Incident1',
      'Link' => '',
      'Name' => 'Incident',
      'NavBar' => 'Incident',
      'Prio' => '8400',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Incident1',
  'Title' => 'Incident'
};
$Self->{'ITSMConfigItem::LinkStatus::LinkTypes'} =  {
  'RelevantTo' => 'Incident'
};
$Self->{'ITSMConfigItem::LinkStatus::IncidentStates'} =  [
  'Incident',
  'Warning',
  'Operational'
];
$Self->{'Ticket::EventModulePost'}->{'042-ITSMConfigItemTicketStatusLink'} =  {
  'Event' => '(TicketStateUpdate|TicketTypeUpdate)',
  'Module' => 'Kernel::System::Ticket::Event::TicketStatusLink'
};
$Self->{'ITSMConfigItem::EventModulePost'}->{'042-ITSMConfigItemTicketStatusLink'} =  {
  'Event' => '(LinkAdd|LinkDelete)',
  'Module' => 'Kernel::System::Ticket::Event::TicketStatusLink'
};
$Self->{'ITSMConfigItem::SetIncidentStateOnLink'} =  '0';
$Self->{'GenericInterface::Operation::ConfigItemDelete'}->{'Permission'} =  'rw';
$Self->{'GenericInterface::Operation::ConfigItemUpdate'}->{'Permission'} =  'rw';
$Self->{'GenericInterface::Operation::ConfigItemCreate'}->{'Permission'} =  'rw';
$Self->{'GenericInterface::Operation::ConfigItemSearch'}->{'Permission'} =  'ro';
$Self->{'GenericInterface::Operation::ConfigItemGet'}->{'Permission'} =  'ro';
$Self->{'GenericInterface::Operation::Module'}->{'ConfigItem::ConfigItemDelete'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'ConfigItem',
  'Name' => 'ConfigItemDelete'
};
$Self->{'GenericInterface::Operation::Module'}->{'ConfigItem::ConfigItemSearch'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'ConfigItem',
  'Name' => 'ConfigItemSearch'
};
$Self->{'GenericInterface::Operation::Module'}->{'ConfigItem::ConfigItemUpdate'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'ConfigItem',
  'Name' => 'ConfigItemUpdate'
};
$Self->{'GenericInterface::Operation::Module'}->{'ConfigItem::ConfigItemGet'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'ConfigItem',
  'Name' => 'ConfigItemGet'
};
$Self->{'GenericInterface::Operation::Module'}->{'ConfigItem::GetListOfCIs'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'ConfigItem',
  'Name' => 'GetListOfCIs'
};
$Self->{'GenericInterface::Operation::Module'}->{'ConfigItem::GetConfigItemLinkRelation'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'ConfigItem',
  'Name' => 'GetConfigItemLinkRelation'
};
$Self->{'GenericInterface::Operation::Module'}->{'ConfigItem::ConfigItemCreate'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'ConfigItem',
  'Name' => 'ConfigItemCreate'
};
$Self->{'GenericInterface::Operation::Module'}->{'Customer::GetTicketGrid'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Customer',
  'Name' => 'GetTicketGrid'
};
$Self->{'GenericInterface::Operation::TicketSearch'}->{'Order::Default'} =  'Down';
$Self->{'GenericInterface::Operation::TicketSearch'}->{'SortBy::Default'} =  'Age';
$Self->{'GenericInterface::Operation::TicketSearch'}->{'SearchLimit'} =  '500';
$Self->{'GenericInterface::Operation::TicketUpdate'}->{'AutoResponseType'} =  'auto follow up';
$Self->{'GenericInterface::Operation::TicketUpdate'}->{'HistoryComment'} =  '%%GenericInterface Note';
$Self->{'GenericInterface::Operation::TicketUpdate'}->{'HistoryType'} =  'AddNote';
$Self->{'GenericInterface::Operation::ResponseLoggingMaxSize'} =  '200';
$Self->{'GenericInterface::Operation::TicketUpdate'}->{'ArticleType'} =  'webrequest';
$Self->{'GenericInterface::Operation::TicketCreate'}->{'AutoResponseType'} =  'auto reply';
$Self->{'GenericInterface::Operation::TicketCreate'}->{'HistoryComment'} =  '%%GenericInterface Create';
$Self->{'GenericInterface::Operation::TicketCreate'}->{'HistoryType'} =  'NewTicket';
$Self->{'GenericInterface::Operation::TicketCreate'}->{'ArticleType'} =  'webrequest';
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::TicketSearch'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'TicketGet'
};
$Self->{'GenericInterface::Operation::Module'}->{'ServiceCatalog::ServiceList1'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'ServiceCatalog',
  'Name' => 'ServiceList1'
};
$Self->{'GenericInterface::Operation::Module'}->{'ServiceCatalog::ServiceList'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'ServiceCatalog',
  'Name' => 'ServiceList'
};
$Self->{'GenericInterface::Operation::Module'}->{'ServiceCatalog::ServiceListGet'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'ServiceCatalog',
  'Name' => 'ServiceListGet'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::TicketGet'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'TicketGet'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::TicketUpdate'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'TicketUpdate'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::TicketCreate'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'TicketCreate'
};
$Self->{'GenericInterface::Operation::Module'}->{'SSO::CheckToken'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'SSO',
  'Name' => 'CheckToken'
};
$Self->{'GenericInterface::Operation::Module'}->{'Session::SessionUserDetails'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Session',
  'Name' => 'SessionUserDetails'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::GetChangeWorkorderDetails'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'GetChangeWorkorderDetails'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::GetJsonData'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'GetJsonData'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::GetTicketDetails'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'GetTicketDetails'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::ListOfCIs'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'ListOfCIs'
};
$Self->{'GenericInterface::Operation::Module'}->{'Session::SessionCreate'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Session',
  'Name' => 'SessionCreate'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::TicketServiceSet'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'TicketServiceSet'
};
$Self->{'GenericInterface::Mapping::Module'}->{'XSLT'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceMappingXSLT'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceMappingXSLT'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ]
  },
  'Title' => 'GenericInterface Webservice Mapping GUI'
};
$Self->{'GenericInterface::Mapping::Module'}->{'Simple'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceMappingSimple'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceMappingSimple'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceMappingSimple.js'
    ]
  },
  'Title' => 'GenericInterface Webservice Mapping GUI'
};
$Self->{'GenericInterface::Transport::Module'}->{'HTTP::REST'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceTransportHTTPREST',
  'Name' => 'REST',
  'Protocol' => 'HTTP'
};
$Self->{'GenericInterface::Transport::Module'}->{'HTTP::SOAP'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceTransportHTTPSOAP',
  'Name' => 'SOAP',
  'Protocol' => 'HTTP'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceInvokerDefault'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceInvoker.js'
    ]
  },
  'Title' => 'GenericInterface Invoker GUI'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceOperationDefault'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceOperation.js'
    ]
  },
  'Title' => 'GenericInterface Operation GUI'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceWebserviceHistory'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceWebserviceHistory.js'
    ]
  },
  'Title' => 'GenericInterface Webservice History GUI'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceTransportHTTPREST'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ]
  },
  'Title' => 'GenericInterface TransportHTTPREST GUI'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceTransportHTTPSOAP'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css',
      'Core.Agent.SortedTree.css'
    ],
    'JavaScript' => [
      'Core.Agent.SortedTree.js'
    ]
  },
  'Title' => 'GenericInterface TransportHTTPSOAP GUI'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceWebservice'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceWebservice.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Create and manage web services.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Web Services',
    'Prio' => '1000'
  },
  'NavBarName' => 'Admin',
  'Title' => 'GenericInterface Web Service GUI'
};
$Self->{'Frontend::Module'}->{'AdminGenericInterfaceDebugger'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.GenericInterface.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.GenericInterfaceDebugger.js'
    ]
  },
  'Title' => 'GenericInterface Debugger GUI'
};
$Self->{'GenericInterface::Operation::Common::CachedAuth::CustomerCacheTTL'} =  '300';
$Self->{'GenericInterface::Operation::Common::CachedAuth::AgentCacheTTL'} =  '300';
$Self->{'GenericInterface::WebserviceConfig::CacheTTL'} =  '86400';
$Self->{'DynamicField::EventModulePost'}->{'1000-GenericInterface'} =  {
  'Event' => '',
  'Module' => 'Kernel::GenericInterface::Event::Handler',
  'Transaction' => '1'
};
$Self->{'Queue::EventModulePost'}->{'1000-GenericInterface'} =  {
  'Event' => '',
  'Module' => 'Kernel::GenericInterface::Event::Handler',
  'Transaction' => '1'
};
$Self->{'CustomerUser::EventModulePost'}->{'1000-GenericInterface'} =  {
  'Event' => '',
  'Module' => 'Kernel::GenericInterface::Event::Handler',
  'Transaction' => '1'
};
$Self->{'CustomerCompany::EventModulePost'}->{'1000-GenericInterface'} =  {
  'Event' => '',
  'Module' => 'Kernel::GenericInterface::Event::Handler',
  'Transaction' => '1'
};
$Self->{'Package::EventModulePost'}->{'1000-GenericInterface'} =  {
  'Event' => '',
  'Module' => 'Kernel::GenericInterface::Event::Handler',
  'Transaction' => '1'
};
$Self->{'Ticket::EventModulePost'}->{'999-GenericInterface'} =  {
  'Event' => '',
  'Module' => 'Kernel::GenericInterface::Event::Handler',
  'Transaction' => '1'
};
$Self->{'FAQ::Frontend::CustomerFAQRelatedArticles'}->{'VoteStarsVisible'} =  '4';
$Self->{'FAQ::Frontend::CustomerFAQRelatedArticles'}->{'ShowLimit'} =  '10';
$Self->{'FAQ::Frontend::CustomerFAQRelatedArticles'}->{'DefaultLanguages'} =  [
  'en'
];
$Self->{'FAQ::KeywordArticeList::SearchLimit'} =  '5000';
$Self->{'CustomerFrontend::Module'}->{'CustomerFAQRelatedArticles'} =  {
  'Description' => 'CustomerFAQRelatedArticles.',
  'Title' => 'CustomerFAQRelatedArticles'
};
$Self->{'Frontend::Output::FilterElementPost'}->{'OutputFilterPostFAQRelatedArticles'} =  {
  'Module' => 'Kernel::Output::HTML::FilterElementPost::FAQRelatedArticles',
  'Templates' => {
    'CustomerTicketMessageNew' => '1'
  }
};
$Self->{'FAQ::Customer::RelatedArticles::Enabled'} =  '1';
$Self->{'LinkObject::ComplexTable'}->{'FAQ'} =  {
  'DefaultColumns' => {
    'Approved' => '1',
    'CategoryName' => '1',
    'Changed' => '1',
    'ContentType' => '1',
    'Created' => '2',
    'FAQNumber' => '2',
    'Language' => '1',
    'State' => '2',
    'Title' => '2'
  },
  'Module' => 'Kernel::Output::HTML::LinkObject::FAQ.pm',
  'Priority' => {
    'Approved' => '160',
    'CategoryName' => '140',
    'Changed' => '180',
    'ContentType' => '170',
    'Created' => '130',
    'FAQNumber' => '100',
    'Language' => '150',
    'State' => '120',
    'Title' => '110'
  }
};
$Self->{'LinkObject::ComplexTable::SettingsVisibility'}->{'FAQ'} =  [
  'AgentFAQZoom'
];
$Self->{'FAQ::Frontend::AgentFAQSearch'}->{'Defaults'}->{'Fulltext'} =  '';
$Self->{'FAQ::Frontend::PublicFAQSearch'}->{'SearchCSVDynamicField'} =  {};
$Self->{'FAQ::Frontend::PublicFAQOverview'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::PublicFAQSearch'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::CustomerFAQSearch'}->{'SearchCSVDynamicField'} =  {};
$Self->{'FAQ::Frontend::CustomerFAQOverview'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::CustomerFAQSearch'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::AgentFAQSearch'}->{'SearchCSVDynamicField'} =  {};
$Self->{'FAQ::Frontend::AgentFAQSearch'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::PublicFAQPrint'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::CustomerFAQPrint'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::AgentFAQPrint'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::PublicFAQZoom'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::CustomerFAQZoom'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::AgentFAQZoom'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::AgentFAQEdit'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::AgentFAQAdd'}->{'DynamicField'} =  {};
$Self->{'FAQ::Frontend::OverviewSmall'}->{'DynamicField'} =  {};
$Self->{'DynamicFields::ObjectType'}->{'FAQ'} =  {
  'DisplayName' => 'FAQ',
  'Module' => 'Kernel::System::DynamicField::ObjectType::FAQ',
  'Prio' => '200'
};
$Self->{'FAQ::Frontend::AgentFAQEdit'}->{'RichTextHeight'} =  '320';
$Self->{'FAQ::Frontend::AgentFAQEdit'}->{'RichTextWidth'} =  '620';
$Self->{'FAQ::Frontend::AgentFAQAdd'}->{'RichTextHeight'} =  '320';
$Self->{'FAQ::Frontend::AgentFAQAdd'}->{'RichTextWidth'} =  '620';
$Self->{'FAQ::Frontend::CustomerHTMLFieldHeightMax'} =  '2500';
$Self->{'FAQ::Frontend::CustomerHTMLFieldHeightDefault'} =  '100';
$Self->{'FAQ::Frontend::AgentHTMLFieldHeightMax'} =  '2500';
$Self->{'FAQ::Frontend::AgentHTMLFieldHeightDefault'} =  '100';
$Self->{'GenericInterface::Operation::Module'}->{'FAQ::PublicFAQSearch'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'FAQ',
  'Name' => 'PublicFAQSearch'
};
$Self->{'GenericInterface::Operation::Module'}->{'FAQ::PublicFAQGet'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'FAQ',
  'Name' => 'PublicFAQGet'
};
$Self->{'GenericInterface::Operation::Module'}->{'FAQ::PublicCategoryList'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'FAQ',
  'Name' => 'PublicCategoryList'
};
$Self->{'GenericInterface::Operation::Module'}->{'FAQ::LanguageList'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'FAQ',
  'Name' => 'LanguageList'
};
$Self->{'DashboardBackend'}->{'0399-FAQ-LastCreate'} =  {
  'Block' => 'ContentSmall',
  'Default' => '1',
  'Description' => '',
  'Group' => 'faq',
  'Module' => 'Kernel::Output::HTML::Dashboard::FAQ',
  'Title' => 'Latest created FAQ articles',
  'Type' => 'LastCreate'
};
$Self->{'DashboardBackend'}->{'0398-FAQ-LastChange'} =  {
  'Block' => 'ContentSmall',
  'Default' => '1',
  'Description' => '',
  'Group' => 'faq',
  'Module' => 'Kernel::Output::HTML::Dashboard::FAQ',
  'Title' => 'Latest updated FAQ articles',
  'Type' => 'LastChange'
};
$Self->{'FAQ::CacheTTL'} =  '172800';
$Self->{'FAQ::Voting'} =  '1';
$Self->{'Loader::Customer::CommonCSS'}->{'200-FAQ'} =  [
  'FAQ.RelatedArticles.css',
  'FAQ.Customer.Default.css'
];
$Self->{'Loader::Agent::CommonJS'}->{'200-FAQ'} =  [
  'FAQ.Agent.TicketCompose.js'
];
$Self->{'Loader::Agent::CommonCSS'}->{'200-FAQ'} =  [
  'FAQ.Agent.Default.css'
];
$Self->{'FAQ::MultiLanguage'} =  '1';
$Self->{'FAQ::TicketCompose'}->{'UpdateArticleSubject'} =  '1';
$Self->{'FAQ::TicketCompose'}->{'ShowInsertTextAndLinkButton'} =  '1';
$Self->{'FAQ::TicketCompose'}->{'ShowInsertLinkButton'} =  '1';
$Self->{'FAQ::TicketCompose'}->{'ShowInsertTextButton'} =  '1';
$Self->{'FAQ::TicketCompose'}->{'ShowFieldNames'} =  '1';
$Self->{'FAQ::TicketCompose'}->{'IncludeInternal'} =  '0';
$Self->{'FAQ::TicketCompose'}->{'InsertMethod'} =  'Full';
$Self->{'Frontend::Module'}->{'AgentFAQDelete'} =  {
  'Description' => 'FAQ Delete.',
  'Group' => [
    'faq'
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'Delete'
};
$Self->{'Frontend::Module'}->{'AgentFAQHistory'} =  {
  'Group' => [
    'faq'
  ],
  'GroupRo' => [
    'faq'
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'History'
};
$Self->{'FAQ::Frontend::JournalOverview'}->{'Small'} =  {
  'Module' => 'Kernel::Output::HTML::FAQJournalOverview::Small',
  'Name' => 'Small',
  'NameShort' => 'S'
};
$Self->{'PreferencesGroups'}->{'FAQJournalOverviewSmallPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '25',
  'Key' => 'FAQ limit per page for FAQ Journal Overview "Small"',
  'Label' => 'FAQ Journal Overview "Small" Limit',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserFAQJournalOverviewSmallPageShown',
  'Prio' => '8000'
};
$Self->{'FAQ::Frontend::AgentFAQJournal'}->{'JournalLimit'} =  '200';
$Self->{'FAQ::Frontend::AgentFAQJournal'}->{'ShowColumns'} =  {
  'Category' => '1',
  'Name' => '1',
  'Time' => '1',
  'Title' => '1',
  'Valid' => '1'
};
$Self->{'Frontend::Module'}->{'AgentFAQJournal'} =  {
  'Group' => [
    'faq'
  ],
  'GroupRo' => [
    'faq'
  ],
  'NavBar' => [
    {
      'AccessKey' => 'J',
      'Block' => '',
      'Description' => 'FAQ Journal',
      'GroupRo' => [
        'faq'
      ],
      'Link' => 'Action=AgentFAQJournal',
      'Name' => 'Journal',
      'NavBar' => 'FAQ',
      'Prio' => '930',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
};
$Self->{'PublicFrontend::Module'}->{'PublicFAQPrint'} =  {
  'Description' => 'Public FAQ Print.',
  'NavBarName' => 'FAQ',
  'Title' => ''
};
$Self->{'PublicFrontend::Module'}->{'PublicFAQ'} =  {
  'Description' => 'Public FAQ Zoom.',
  'NavBarName' => 'FAQ',
  'Title' => ''
};
$Self->{'PublicFrontend::Module'}->{'PublicFAQZoom'} =  {
  'Description' => 'Public FAQ Zoom.',
  'Loader' => {
    'CSS' => [
      'FAQ.Customer.Default.css',
      'FAQ.Customer.Detail.css',
      'FAQ.FAQZoom.css'
    ],
    'JavaScript' => [
      'FAQ.Customer.FAQZoom.js'
    ]
  },
  'NavBarName' => 'FAQ',
  'Title' => ''
};
$Self->{'FAQ::Frontend::PublicFAQSearch'}->{'Order::Default'} =  'Down';
$Self->{'FAQ::Frontend::PublicFAQSearch'}->{'SortBy::Default'} =  'FAQID';
$Self->{'FAQ::Frontend::PublicFAQSearch'}->{'SearchPageShown'} =  '40';
$Self->{'FAQ::Frontend::PublicFAQSearch'}->{'SearchLimit'} =  '200';
$Self->{'PublicFrontend::Module'}->{'PublicFAQSearch'} =  {
  'Description' => 'Public FAQ search.',
  'Loader' => {
    'CSS' => [
      'FAQ.Customer.Default.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'FAQ Area',
      'Link' => 'Action=PublicFAQSearch',
      'LinkOption' => '',
      'Name' => 'Search FAQ',
      'NavBar' => '',
      'Prio' => '600',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'Search FAQ'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerFAQPrint'} =  {
  'Description' => 'Customer FAQ Print.',
  'NavBarName' => 'FAQ',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AgentFAQPrint'} =  {
  'Description' => 'FAQ Print.',
  'Group' => [
    'faq'
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'Print'
};
$Self->{'FAQ::Frontend::CustomerFAQSearch'}->{'Order::Default'} =  'Down';
$Self->{'FAQ::Frontend::CustomerFAQSearch'}->{'SortBy::Default'} =  'FAQID';
$Self->{'FAQ::Frontend::CustomerFAQSearch'}->{'SearchPageShown'} =  '40';
$Self->{'FAQ::Frontend::CustomerFAQSearch'}->{'SearchLimit'} =  '200';
$Self->{'CustomerFrontend::Module'}->{'CustomerFAQSearch'} =  {
  'Description' => 'Customer FAQ search.',
  'NavBar' => [
    {
      'AccessKey' => 'S',
      'Block' => '',
      'Description' => 'Search',
      'Link' => 'Action=CustomerFAQSearch',
      'LinkOption' => '',
      'Name' => 'Search',
      'NavBar' => 'FAQ',
      'Prio' => '780',
      'Type' => 'Submenu'
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'Search FAQ'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerFAQZoom'} =  {
  'Description' => 'Customer FAQ Zoom.',
  'Loader' => {
    'CSS' => [
      'FAQ.Customer.Detail.css',
      'FAQ.Customer.Default.css',
      'FAQ.FAQZoom.css'
    ],
    'JavaScript' => [
      'FAQ.Customer.FAQZoom.js'
    ]
  },
  'NavBarName' => 'FAQ',
  'Title' => ''
};
$Self->{'FAQ::Frontend::MenuModule'}->{'050-Delete'} =  {
  'Action' => 'AgentFAQDelete',
  'ConfirmedActionQueryString' => 'Action=AgentFAQDelete;Subaction=Delete;ItemID=[% Data.ItemID | html %]',
  'Description' => 'Delete this FAQ',
  'DialogContentQueryString' => 'Action=AgentFAQDelete;ItemID=[% Data.ItemID | html %]',
  'DialogTitle' => '[% Translate("Delete") | html %] [% Config("FAQ::FAQHook") %] [% Data.Number | html %]',
  'ElementSelector' => '#[% Data.MenuID | html %]',
  'Link' => 'Action=AgentFAQDelete;ItemID=[% Data.ItemID | html %]',
  'Module' => 'Kernel::Output::HTML::FAQMenu::Generic',
  'Name' => 'Delete',
  'Target' => 'ConfirmationDialog'
};
$Self->{'FAQ::Frontend::MenuModule'}->{'040-Link'} =  {
  'Action' => 'AgentLinkObject',
  'Description' => 'Link another object to this FAQ item',
  'Link' => 'Action=AgentLinkObject;SourceObject=FAQ;SourceKey=[% Data.ItemID | html %]',
  'Module' => 'Kernel::Output::HTML::FAQMenu::Generic',
  'Name' => 'Link',
  'Target' => 'PopUp'
};
$Self->{'FAQ::Frontend::MenuModule'}->{'030-Print'} =  {
  'Action' => 'AgentFAQPrint',
  'Description' => 'Print this FAQ',
  'Link' => 'Action=AgentFAQPrint;ItemID=[% Data.ItemID | html %]',
  'LinkParam' => 'target="print_FAQ"',
  'Module' => 'Kernel::Output::HTML::FAQMenu::Generic',
  'Name' => 'Print',
  'Target' => 'PopUp'
};
$Self->{'FAQ::Frontend::MenuModule'}->{'020-History'} =  {
  'Action' => 'AgentFAQHistory',
  'Description' => 'History of this FAQ',
  'Link' => 'Action=AgentFAQHistory;ItemID=[% Data.ItemID | html %]',
  'Module' => 'Kernel::Output::HTML::FAQMenu::Generic',
  'Name' => 'History',
  'Target' => 'PopUp'
};
$Self->{'FAQ::Frontend::MenuModule'}->{'010-Edit'} =  {
  'Action' => 'AgentFAQEdit',
  'Description' => 'Edit this FAQ',
  'Link' => 'Action=AgentFAQEdit;ItemID=[% Data.ItemID | html %];ScreenType=Popup',
  'Module' => 'Kernel::Output::HTML::FAQMenu::Generic',
  'Name' => 'Edit',
  'Target' => 'PopUp'
};
$Self->{'FAQ::Frontend::MenuModule'}->{'000-Back'} =  {
  'Action' => '',
  'Description' => 'Back',
  'Link' => '[% Env("LastScreenOverview") %]',
  'Module' => 'Kernel::Output::HTML::FAQMenu::Generic',
  'Name' => 'Back',
  'Target' => 'Back'
};
$Self->{'Frontend::Module'}->{'AgentFAQRichText'} =  {
  'Description' => 'FAQ AJAX Responder for Richtext.',
  'Group' => [
    'faq'
  ],
  'GroupRo' => [
    'faq'
  ],
  'Title' => 'FAQ AJAX Responder'
};
$Self->{'Frontend::Module'}->{'AgentFAQZoom'} =  {
  'Description' => 'FAQ Area.',
  'Group' => [
    'faq'
  ],
  'GroupRo' => [
    'faq'
  ],
  'Loader' => {
    'CSS' => [
      'FAQ.Agent.Detail.css',
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'FAQ.Agent.ConfirmationDialog.js',
      'FAQ.Agent.TicketCompose.js',
      'FAQ.Agent.FAQZoom.js',
      'Core.UI.AllocationList.js',
      'Core.UI.Table.Sort.js',
      'Core.Agent.TableFilters.js',
      'Core.Agent.LinkObject.js'
    ]
  },
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
};
$Self->{'PreferencesGroups'}->{'FAQOverviewSmallPageShown'} =  {
  'Active' => '0',
  'Column' => 'Other Settings',
  'Data' => {
    '10' => '10',
    '15' => '15',
    '20' => '20',
    '25' => '25',
    '30' => '30',
    '35' => '35'
  },
  'DataSelected' => '25',
  'Key' => 'FAQ limit per page for FAQ Overview "Small"',
  'Label' => 'FAQ Overview "Small" Limit',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserFAQOverviewSmallPageShown',
  'Prio' => '8000'
};
$Self->{'FAQ::Frontend::AgentFAQExplorer'}->{'ShowInvalidFAQItems'} =  '0';
$Self->{'FAQ::Frontend::AgentFAQExplorer'}->{'SearchLimit'} =  '200';
$Self->{'FAQ::Frontend::AgentFAQExplorer'}->{'Order::Default'} =  'Down';
$Self->{'FAQ::Frontend::AgentFAQExplorer'}->{'SortBy::Default'} =  'FAQID';
$Self->{'FAQ::Frontend::AgentFAQExplorer'}->{'ShowColumns'} =  {
  'Category' => '0',
  'Changed' => '0',
  'Language' => '1',
  'State' => '1',
  'Title' => '1',
  'Valid' => '1'
};
$Self->{'FAQ::Frontend::AgentFAQSearch'}->{'SearchLimit'} =  '200';
$Self->{'FAQ::Frontend::AgentFAQSearch'}->{'Order::Default'} =  'Down';
$Self->{'FAQ::Frontend::AgentFAQSearch'}->{'SortBy::Default'} =  'FAQID';
$Self->{'FAQ::Frontend::AgentFAQSearch'}->{'ShowColumns'} =  {
  'Category' => '1',
  'Changed' => '1',
  'Language' => '1',
  'State' => '1',
  'Title' => '1',
  'Valid' => '1'
};
$Self->{'FAQ::Frontend::Overview'}->{'Small'} =  {
  'Module' => 'Kernel::Output::HTML::FAQOverview::Small',
  'Name' => 'Small',
  'NameShort' => 'S'
};
$Self->{'Frontend::Search'}->{'FAQ'} =  {
  '^(?:Agent|Admin)FAQ' => 'Action=AgentFAQSearch;Subaction=AJAX'
};
$Self->{'Frontend::Module'}->{'AgentFAQSearchSmall'} =  {
  'Group' => [
    'faq'
  ],
  'GroupRo' => [
    'faq'
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
};
$Self->{'Frontend::Module'}->{'AgentFAQSearch'} =  {
  'Group' => [
    'faq'
  ],
  'GroupRo' => [
    'faq'
  ],
  'NavBar' => [
    {
      'AccessKey' => 'S',
      'Block' => '',
      'Description' => 'Search FAQ',
      'GroupRo' => [
        'faq'
      ],
      'Link' => 'Action=AgentFAQSearch',
      'LinkOption' => 'onclick="Core.Agent.Search.OpenSearchDialog(\'AgentFAQSearch\'); if (event.stopPropagation) { event.stopPropagation(); } else { window.event.cancelBubble = true; } return false;"',
      'Name' => 'Search',
      'NavBar' => 'FAQ',
      'Prio' => '960',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
};
$Self->{'Frontend::Module'}->{'AgentFAQCategory'} =  {
  'Description' => 'FAQ Area.',
  'Group' => [
    'faq_admin'
  ],
  'Loader' => {
    'JavaScript' => [
      'FAQ.Agent.ConfirmationDialog.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'C',
      'Block' => '',
      'Description' => 'Category Management',
      'Group' => [
        'faq_admin'
      ],
      'Link' => 'Action=AgentFAQCategory',
      'Name' => 'Category Management',
      'NavBar' => 'FAQ',
      'Prio' => '950',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
};
$Self->{'Frontend::Module'}->{'AgentFAQLanguage'} =  {
  'Description' => 'FAQ Area.',
  'Group' => [
    'faq_admin'
  ],
  'Loader' => {
    'JavaScript' => [
      'FAQ.Agent.ConfirmationDialog.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'L',
      'Block' => '',
      'Description' => 'Language Management',
      'Group' => [
        'faq_admin'
      ],
      'Link' => 'Action=AgentFAQLanguage',
      'Name' => 'Language Management',
      'NavBar' => 'FAQ',
      'Prio' => '940',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
};
$Self->{'Frontend::Module'}->{'AgentFAQEdit'} =  {
  'Description' => 'FAQ Edit.',
  'Group' => [
    'faq'
  ],
  'Loader' => {
    'CSS' => [
      'FAQ.Agent.Detail.css'
    ]
  },
  'NavBarName' => 'FAQ',
  'Title' => 'Edit'
};
$Self->{'Frontend::Module'}->{'AgentFAQAdd'} =  {
  'Description' => 'FAQ Area.',
  'Group' => [
    'faq'
  ],
  'Loader' => {
    'CSS' => [
      'FAQ.Agent.Detail.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'A',
      'Block' => '',
      'Description' => 'New FAQ Article',
      'Group' => [
        'faq'
      ],
      'Link' => 'Action=AgentFAQAdd',
      'Name' => 'New',
      'NavBar' => 'FAQ',
      'Prio' => '920',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
};
$Self->{'Frontend::Output::FilterElementPost'}->{'FAQ'} =  {
  'Debug' => '0',
  'Module' => 'Kernel::Output::HTML::FilterElementPost::FAQ',
  'Templates' => {
    'AgentTicketClose' => '1',
    'AgentTicketCompose' => '1',
    'AgentTicketEmail' => '1',
    'AgentTicketEmailOutbound' => '1',
    'AgentTicketForward' => '1',
    'AgentTicketFreeText' => '1',
    'AgentTicketNote' => '1',
    'AgentTicketOwner' => '1',
    'AgentTicketPending' => '1',
    'AgentTicketPhone' => '1',
    'AgentTicketPriority' => '1',
    'AgentTicketResponsible' => '1'
  }
};
$Self->{'PublicFrontend::HeaderMetaModule'}->{'3-FAQSearch'} =  {
  'Action' => 'PublicFAQSearch',
  'Module' => 'Kernel::Output::HTML::HeaderMeta::PublicFAQSearch'
};
$Self->{'CustomerFrontend::HeaderMetaModule'}->{'3-FAQSearch'} =  {
  'Action' => 'CustomerFAQSearch',
  'Module' => 'Kernel::Output::HTML::HeaderMeta::CustomerFAQSearch'
};
$Self->{'Frontend::HeaderMetaModule'}->{'3-FAQSearch'} =  {
  'Action' => 'AgentFAQSearch',
  'Module' => 'Kernel::Output::HTML::HeaderMeta::AgentFAQSearch'
};
$Self->{'FAQ::Item::HTML'} =  '1';
$Self->{'PublicFrontend::Module'}->{'PublicFAQRSS'} =  {
  'Description' => 'Public FAQ.',
  'NavBarName' => 'FAQ'
};
$Self->{'FAQ::Frontend::PublicFAQExplorer'}->{'Order::Default'} =  'Down';
$Self->{'FAQ::Frontend::PublicFAQExplorer'}->{'SortBy::Default'} =  'FAQID';
$Self->{'FAQ::Frontend::PublicFAQExplorer'}->{'SearchPageShown'} =  '40';
$Self->{'FAQ::Frontend::PublicFAQExplorer'}->{'SearchLimit'} =  '200';
$Self->{'PublicFrontend::Module'}->{'PublicFAQExplorer'} =  {
  'Description' => 'Public FAQ.',
  'Loader' => {
    'CSS' => [
      'FAQ.Customer.Detail.css',
      'FAQ.Customer.Default.css',
      'FAQ.Widget.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'X',
      'Block' => '',
      'Description' => 'FAQ Area',
      'Link' => 'Action=PublicFAQExplorer',
      'Name' => 'FAQ',
      'NavBar' => '',
      'Prio' => '400',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => ''
};
$Self->{'PublicFrontend::CommonParam'}->{'Action'} =  'PublicFAQExplorer';
$Self->{'FAQ::Frontend::CustomerFAQExplorer'}->{'Order::Default'} =  'Down';
$Self->{'FAQ::Frontend::CustomerFAQExplorer'}->{'SortBy::Default'} =  'FAQID';
$Self->{'FAQ::Frontend::CustomerFAQExplorer'}->{'SearchPageShown'} =  '40';
$Self->{'FAQ::Frontend::CustomerFAQExplorer'}->{'SearchLimit'} =  '200';
$Self->{'CustomerFrontend::Module'}->{'CustomerFAQExplorer'} =  {
  'Description' => 'Customer FAQ.',
  'Loader' => {
    'CSS' => [
      'FAQ.Customer.Detail.css',
      'FAQ.Customer.Default.css',
      'FAQ.Widget.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'FAQ',
      'Link' => 'Action=CustomerFAQExplorer',
      'Name' => 'KB',
      'NavBar' => 'FAQ',
      'Prio' => '700',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => 'X',
      'Block' => '',
      'Description' => 'FAQ Explorer',
      'Link' => 'Action=CustomerFAQExplorer',
      'Name' => 'FAQ Explorer',
      'NavBar' => 'FAQ',
      'Prio' => '710',
      'Type' => 'Submenu'
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AgentFAQExplorer'} =  {
  'Description' => 'FAQ Area.',
  'Group' => [
    'faq'
  ],
  'GroupRo' => [
    'faq'
  ],
  'Loader' => {
    'CSS' => [
      'FAQ.Agent.Detail.css'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'F',
      'Block' => 'ItemArea',
      'Description' => 'FAQ Area',
      'GroupRo' => [
        'faq'
      ],
      'Link' => 'Action=AgentFAQExplorer',
      'Name' => 'KB',
      'NavBar' => 'FAQ',
      'Prio' => '350',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => 'X',
      'Block' => '',
      'Description' => 'FAQ Explorer',
      'GroupRo' => [
        'faq'
      ],
      'Link' => 'Action=AgentFAQExplorer',
      'Name' => 'Explorer',
      'NavBar' => 'FAQ',
      'Prio' => '910',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
};
$Self->{'LinkObject::PossibleLink'}->{'8304'} =  {
  'Object1' => 'FAQ',
  'Object2' => 'Ticket',
  'Type' => 'ParentChild'
};
$Self->{'LinkObject::PossibleLink'}->{'8303'} =  {
  'Object1' => 'FAQ',
  'Object2' => 'Ticket',
  'Type' => 'Normal'
};
$Self->{'LinkObject::PossibleLink'}->{'8302'} =  {
  'Object1' => 'FAQ',
  'Object2' => 'FAQ',
  'Type' => 'ParentChild'
};
$Self->{'LinkObject::PossibleLink'}->{'8301'} =  {
  'Object1' => 'FAQ',
  'Object2' => 'FAQ',
  'Type' => 'Normal'
};
$Self->{'FAQ::Item::Field6'} =  {
  'Caption' => 'Comment',
  'Prio' => '600',
  'Show' => 'internal'
};
$Self->{'FAQ::Item::Field5'} =  {
  'Caption' => 'Field5',
  'Prio' => '500',
  'Show' => ''
};
$Self->{'FAQ::Item::Field4'} =  {
  'Caption' => 'Field4',
  'Prio' => '400',
  'Show' => ''
};
$Self->{'FAQ::Item::Field3'} =  {
  'Caption' => 'Solution',
  'Prio' => '300',
  'Show' => 'public'
};
$Self->{'FAQ::Item::Field2'} =  {
  'Caption' => 'Problem',
  'Prio' => '200',
  'Show' => 'public'
};
$Self->{'FAQ::Item::Field1'} =  {
  'Caption' => 'Symptom',
  'Prio' => '100',
  'Show' => 'public'
};
$Self->{'FAQ::ApprovalTicketType'} =  'Unclassified';
$Self->{'FAQ::ApprovalTicketDefaultState'} =  'new';
$Self->{'FAQ::ApprovalTicketPriority'} =  '3 normal';
$Self->{'FAQ::ApprovalTicketBody'} =  'Hi,

a new FAQ article needs your approval before it can be published.

  FAQ#   : <OTRS_FAQ_NUMBER>
  Title  : <OTRS_FAQ_TITLE>
  Author : <OTRS_FAQ_AUTHOR>
  State  : <OTRS_FAQ_STATE>

If you want to do this, click on this link:

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentFAQEdit;ItemID=<OTRS_FAQ_ITEMID>

Your OTRS Notification Master
            ';
$Self->{'FAQ::ApprovalTicketSubject'} =  'FAQ approval required for FAQ# <OTRS_FAQ_NUMBER>';
$Self->{'FAQ::ApprovalQueue'} =  'FAQ_Approval';
$Self->{'FAQ::ApprovalGroup'} =  'faq_approval';
$Self->{'FAQ::ApprovalRequired'} =  '0';
$Self->{'FAQ::Default::State'} =  'internal (agent)';
$Self->{'FAQ::TitleSize'} =  '50';
$Self->{'FAQ::FAQHook'} =  'FAQ#';
$Self->{'FAQ::Explorer::Top10::ShowSubCategoryItems'} =  '1';
$Self->{'FAQ::Explorer::Top10::Limit'} =  '10';
$Self->{'FAQ::Explorer::Top10::Show'} =  {
  'external' => 'external (customer)',
  'internal' => 'internal (agent)',
  'public' => 'public (public)'
};
$Self->{'FAQ::Explorer::LastCreate::Limit'} =  '3';
$Self->{'FAQ::Explorer::LastCreate::ShowSubCategoryItems'} =  '1';
$Self->{'FAQ::Explorer::LastCreate::Show'} =  {
  'external' => 'external (customer)',
  'internal' => 'internal (agent)',
  'public' => 'public (public)'
};
$Self->{'FAQ::Explorer::LastChange::Limit'} =  '3';
$Self->{'FAQ::Explorer::LastChange::ShowSubCategoryItems'} =  '1';
$Self->{'FAQ::Explorer::LastChange::Show'} =  {
  'external' => 'external (customer)',
  'internal' => 'internal (agent)',
  'public' => 'public (public)'
};
$Self->{'FAQ::Explorer::QuickSearch::Show'} =  {
  'public' => 'public (public)'
};
$Self->{'FAQ::Explorer::ItemList::VotingResultColors'} =  {
  '100' => 'green',
  '30' => 'red',
  '70' => 'orange'
};
$Self->{'FAQ::Explorer::ItemList::VotingResultDecimalPlaces'} =  '2';
$Self->{'FAQ::Explorer::Path::Show'} =  '1';
$Self->{'FAQ::Item::Voting::Show'} =  {
  'external' => 'external (customer)',
  'internal' => 'internal (agent)'
};
$Self->{'FAQ::Item::Voting::Rates'} =  {
  '0' => '1',
  '100' => '5',
  '25' => '2',
  '50' => '3',
  '75' => '4'
};
$Self->{'FAQ::Default::RootCategoryComment'} =  'default comment';
$Self->{'FAQ::Default::RootCategoryName'} =  'FAQ';
$Self->{'FAQ::Public::StateTypes'} =  [
  'public'
];
$Self->{'FAQ::Customer::StateTypes'} =  [
  'external',
  'public'
];
$Self->{'FAQ::Agent::StateTypes'} =  [
  'internal',
  'external',
  'public'
];
$Self->{'Frontend::Module'}->{'EscalationMatrix'} =  {
  'Description' => 'ADFE',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Set an Escalation Matrix.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Escalation Matrix',
    'Prio' => '412'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Set Escalation Matrix'
};
$Self->{'DynamicField_Tagging::Default::AgentTicketMove-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketMove'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketAddtlITSMField-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketAddtlITSMField'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketPriority-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketPriority'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketOwner-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketOwner'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketFreeText-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketFreeText'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketResponsible-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketResponsible'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketDecision-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketDecision'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketPending-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketPending'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketClose-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketClose'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketNote-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketNote'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketForward-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketForward'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketCompose-Mandatory'} =  {};
$Self->{'DynamicField_Tagging::Default::AgentTicketCompose'} =  {};
$Self->{'Frontend::Module'}->{'DependentDropdown'} =  {
  'Description' => 'ADFE',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Set Dependent Query and SubQuery.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Dependent Dropdown',
    'Prio' => '411'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Set Dependent Dropdown'
};
$Self->{'Daemon::SchedulerGenericInterfaceTaskManager::FutureTaskTimeDiff'} =  '300';
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'OTRSBusinessAvailabilityCheck'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::OTRSBusiness::AvailabilityCheck',
  'Params' => [],
  'Schedule' => '15,35,55 */1 * * *',
  'TaskName' => 'OTRSBusinessAvailabilityCheck'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'OTRSBusinessEntitlementCheck'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::OTRSBusiness::EntitlementCheck',
  'Params' => [],
  'Schedule' => '25,45 */1 * * *',
  'TaskName' => 'OTRSBusinessEntitlementCheck'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'SupportDataCollectAsynchronous'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::SupportData::CollectAsynchronous',
  'Params' => [],
  'Schedule' => '1 * * * *',
  'TaskName' => 'SupportDataCollectAsynchronous'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'RegistrationUpdateSend'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::Registration::UpdateSend',
  'Params' => [],
  'Schedule' => '30 * * * *',
  'TaskName' => 'RegistrationUpdateSend'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'RenewCustomerSMIMECertificates'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::SMIME::CustomerCertificate::Renew',
  'Params' => [],
  'Schedule' => '02 02 * * *',
  'TaskName' => 'RenewCustomerSMIMECertificates'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'TicketUnlockTimeout'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::Ticket::UnlockTimeout',
  'Params' => [],
  'Schedule' => '35 * * * *',
  'TaskName' => 'TicketUnlockTimeout'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'SessionDeleteExpired'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::Session::DeleteExpired',
  'Params' => [],
  'Schedule' => '55 */2 * * *',
  'TaskName' => 'SessionDeleteExpired'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'TicketAcceleratorRebuild'} =  {
  'Function' => 'TicketAcceleratorRebuild',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Ticket',
  'Params' => [],
  'Schedule' => '01 01 * * *',
  'TaskName' => 'TicketAcceleratorRebuild'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'MailAccountFetch'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::PostMaster::MailAccountFetch',
  'Params' => [],
  'Schedule' => '*/10 * * * *',
  'TaskName' => 'MailAccountFetch'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'SpoolMailsReprocess'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::PostMaster::SpoolMailsReprocess',
  'Params' => [],
  'Schedule' => '10 0 * * *',
  'TaskName' => 'SpoolMailsReprocess'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'TicketPendingCheck'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::Ticket::PendingCheck',
  'Params' => [],
  'Schedule' => '45 */2 * * *',
  'TaskName' => 'TicketPendingCheck'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'UnoSLAEscalationNotification'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::Ticket::UnoSLAEscalationNotification',
  'Params' => [],
  'Schedule' => '*/5 * * * *',
  'TaskName' => 'UnoSLAEscalationNotification'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'EscalationCheck'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::Ticket::EscalationCheck',
  'Params' => [],
  'Schedule' => '*/5 * * * *',
  'TaskName' => 'EscalationCheck'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'GenerateDashboardStats'} =  {
  'Function' => 'Execute',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Console::Command::Maint::Stats::Dashboard::Generate',
  'Params' => [],
  'Schedule' => '5 * * * *',
  'TaskName' => 'GenerateDashboardStats'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'LoaderCacheDelete'} =  {
  'Function' => 'CacheDelete',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Loader',
  'Params' => [],
  'Schedule' => '30 0 * * 0',
  'TaskName' => 'LoaderCacheDelete'
};
$Self->{'Daemon::SchedulerCronTaskManager::Task'}->{'CoreCacheCleanup'} =  {
  'Function' => 'CleanUp',
  'MaximumParallelInstances' => '1',
  'Module' => 'Kernel::System::Cache',
  'Params' => [
    'Expired',
    '1'
  ],
  'Schedule' => '20 0 * * 0',
  'TaskName' => 'CoreCacheCleanup'
};
$Self->{'Daemon::SchedulerGenericAgentTaskManager::SleepTime'} =  '0';
$Self->{'Daemon::SchedulerGenericAgentTaskManager::TicketLimit'} =  '4000';
$Self->{'Daemon::SchedulerTaskWorker::NotificationRecipientEmail'} =  'root@localhost';
$Self->{'Daemon::SchedulerTaskWorker::MaximumWorkers'} =  '5';
$Self->{'DaemonModules'}->{'SchedulerTaskWorker'} =  {
  'Module' => 'Kernel::System::Daemon::DaemonModules::SchedulerTaskWorker'
};
$Self->{'DaemonModules'}->{'SchedulerFutureTaskManager'} =  {
  'Module' => 'Kernel::System::Daemon::DaemonModules::SchedulerFutureTaskManager'
};
$Self->{'DaemonModules'}->{'SchedulerCronTaskManager'} =  {
  'Module' => 'Kernel::System::Daemon::DaemonModules::SchedulerCronTaskManager'
};
$Self->{'DaemonModules'}->{'SchedulerGenericAgentTaskManager'} =  {
  'Module' => 'Kernel::System::Daemon::DaemonModules::SchedulerGenericAgentTaskManager'
};
$Self->{'Daemon::Log::STDERR'} =  '1';
$Self->{'Daemon::Log::STDOUT'} =  '0';
$Self->{'Loader::Agent::CommonJS'}->{'001-Daemon'} =  [
  'Core.Agent.DaemonInfo.js'
];
$Self->{'Loader::Agent::CommonCSS'}->{'001-Daemon'} =  [
  'Core.Agent.DaemonInfo.css'
];
$Self->{'Frontend::NotifyModule'}->{'800-Daemon-Check'} =  {
  'Module' => 'Kernel::Output::HTML::Notification::DaemonCheck'
};
$Self->{'Frontend::Module'}->{'AgentDaemonInfo'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Title' => 'Shows information on how to start OTRS Daemon'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldFile'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.Admin.DynamicField.js'
    ]
  },
  'Title' => 'Dynamic Fields Text Backend GUI'
};
$Self->{'DynamicFields::Driver'}->{'File'} =  {
  'ConfigDialog' => 'AdminDynamicFieldFile',
  'DeleteFileDB' => '0',
  'DisplayName' => 'File',
  'Module' => 'Kernel::System::DynamicField::Driver::File'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerDFFileAttachment'} =  {
  'Description' => 'CustomerDFFileAttachment',
  'NavBar' => [
    {}
  ],
  'NavBarName' => 'CustomerDFFileAttachment',
  'Title' => 'CustomerDFFileAttachment'
};
$Self->{'Frontend::Module'}->{'AgentDFFileAttachment'} =  {
  'Description' => 'AgentDFFileAttachment',
  'NavBar' => [
    {}
  ],
  'NavBarName' => 'AgentDFFileAttachment',
  'Title' => 'AgentDFFileAttachment'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerDesk'} =  {
  'Description' => 'Customer Desk.',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'GetChangeWorkorderDetails'} =  {
  'Description' => 'This module is part of the agent area of OTRS.',
  'Title' => 'GetChangeWorkorderDetails'
};
$Self->{'Frontend::Module'}->{'GetTicketDetails'} =  {
  'Description' => 'This module is part of the agent area of OTRS.',
  'Title' => 'GetTicketDetails'
};
$Self->{'Frontend::Module'}->{'CreateFAQ'} =  {
  'Description' => 'This module is part of the agent area of OTRS.',
  'Title' => 'CreateFAQ'
};
$Self->{'Frontend::Module'}->{'GetLinkedFAQData'} =  {
  'Description' => 'This module is part of the agent area of OTRS.',
  'Title' => 'GetLinkedFAQData'
};
$Self->{'Frontend::Module'}->{'GetLinkedTicketData'} =  {
  'Description' => 'This module is part of the agent area of OTRS.',
  'Title' => 'GetLinkedTicketData'
};
$Self->{'CustomerFrontend::Module'}->{'AgentFAQSearchName'} =  {
  'Description' => 'This module is part of the agent area of OTRS.',
  'Title' => 'AgentFAQSearchName'
};
$Self->{'Frontend::Module'}->{'AgentFAQSearchName'} =  {
  'Description' => 'This module is part of the agent area of OTRS.',
  'Title' => 'AgentFAQSearchName'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::GetLinkedFAQData'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'GetLinkedFAQData'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::GetLinkedTicketData'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'GetLinkedTicketData'
};
$Self->{'GenericInterface::Operation::Module'}->{'Ticket::GetLinkedTicketFAQData'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'Ticket',
  'Name' => 'GetLinkedTicketFAQData'
};
$Self->{'GenericInterface::Operation::Module'}->{'FAQ::CreateFAQ'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'FAQ',
  'Name' => 'CreateFAQ'
};
$Self->{'GenericInterface::Operation::Module'}->{'FAQ::AgentFAQGet'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'FAQ',
  'Name' => 'AgentFAQGet'
};
$Self->{'GenericInterface::Operation::Module'}->{'FAQ::AgentFAQSearch'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'FAQ',
  'Name' => 'AgentFAQSearch'
};
$Self->{'Frontend::Module'}->{'AgentSignature'} =  {
  'Description' => 'This module is part of the admin area of OTRS.',
  'Title' => 'Signatures'
};
$Self->{'CloudService::Admin::Module'}->{'200-SMS'} =  {
  'ConfigDialog' => 'AdminCloudServiceSMS',
  'Description' => 'This will allow the system to send text messages via SMS.',
  'Icon' => 'fa fa-mobile',
  'IsOTRSBusiness' => '1',
  'Name' => 'SMS'
};
$Self->{'Frontend::Module'}->{'AdminCloudServiceSupportDataCollector'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.CloudService.SupportDataCollector.css'
    ]
  },
  'Title' => 'Support data collector'
};
$Self->{'CloudService::Admin::Module'}->{'100-SupportDataCollector'} =  {
  'ConfigDialog' => 'AdminCloudServiceSupportDataCollector',
  'Description' => 'Configure sending of support data to OTRS Group for improved support.',
  'Icon' => 'fa fa-compass',
  'Name' => 'Support data collector'
};
$Self->{'Frontend::NotifyModule'}->{'100-CloudServicesDisabled'} =  {
  'Group' => 'admin',
  'Module' => 'Kernel::Output::HTML::Notification::AgentCloudServicesDisabled'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerChat'} =  {
  'Description' => 'Customer Chat.',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'CIDynamicJson'} =  {
  'Description' => 'CIDynamicJson',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'CIDynamicJson',
      'Link' => 'Action=CIDynamicJson',
      'Name' => 'CIDynamicJson',
      'NavBar' => 'Config Item',
      'Prio' => '520',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => ' CIDynamicJson'
};
$Self->{'Frontend::Module'}->{'CIMoreDetails'} =  {
  'Description' => 'CIMoreDetails',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'CIMoreDetails',
      'Link' => 'Action=CIMoreDetails',
      'Name' => 'CIMoreDetails',
      'NavBar' => 'Config Item',
      'Prio' => '510',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'CIMoreDetails'
};
$Self->{'Frontend::Module'}->{'CIGraphView'} =  {
  'Description' => 'CIGraphView',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'CIGraphView',
      'Link' => 'Action=CIGraphView',
      'Name' => 'CIGraphView',
      'NavBar' => 'Config Item',
      'Prio' => '500',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => ' CIGraphView'
};
$Self->{'Frontend::Module'}->{'CMDBGlobal'} =  {
  'Description' => 'Global',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Global',
      'Link' => 'Action=CMDBGlobal',
      'Name' => 'Global',
      'NavBar' => 'Config Item',
      'Prio' => '490',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => ' Global'
};
$Self->{'Frontend::Module'}->{'CMDBPhones'} =  {
  'Description' => 'Phones',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Phones',
      'Link' => 'Action=CMDBPhones',
      'Name' => 'Phones',
      'NavBar' => 'Config Item',
      'Prio' => '480',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => ' Phones'
};
$Self->{'Frontend::Module'}->{'CMDBConsumables'} =  {
  'Description' => 'Consumables',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Consumables',
      'Link' => 'Action=CMDBConsumables',
      'Name' => 'Consumables',
      'NavBar' => 'Config Item',
      'Prio' => '470',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => ' Consumables'
};
$Self->{'Frontend::Module'}->{'CMDBCartridges'} =  {
  'Description' => 'Cartridges',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Cartridges',
      'Link' => 'Action=CMDBCartridges',
      'Name' => 'Cartridges',
      'NavBar' => 'Config Item',
      'Prio' => '460',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => ' Cartridges'
};
$Self->{'Frontend::Module'}->{'CMDBPrinters'} =  {
  'Description' => 'Printers',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Printers',
      'Link' => 'Action=CMDBPrinters',
      'Name' => 'Printers',
      'NavBar' => 'Config Item',
      'Prio' => '450',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => ' Printers'
};
$Self->{'Frontend::Module'}->{'CMDBDevices'} =  {
  'Description' => 'Devices',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Devices',
      'Link' => 'Action=CMDBDevices',
      'Name' => 'Devices',
      'NavBar' => 'Config Item',
      'Prio' => '440',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => ' Devices'
};
$Self->{'Frontend::Module'}->{'CMDBNetworkDevices'} =  {
  'Description' => 'Network Devices',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Network Devices',
      'Link' => 'Action=CMDBNetworkDevices',
      'Name' => 'Network Devices',
      'NavBar' => 'Config Item',
      'Prio' => '430',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => ' Network Devices'
};
$Self->{'Frontend::Module'}->{'CMDBSoftware'} =  {
  'Description' => 'Software',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Software',
      'Link' => 'Action=CMDBSoftware',
      'Name' => 'Software',
      'NavBar' => 'Config Item',
      'Prio' => '420',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => ' Software'
};
$Self->{'Frontend::Module'}->{'CMDBMonitor'} =  {
  'Description' => 'Monitor',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Monitor',
      'Link' => 'Action=CMDBMonitor',
      'Name' => 'Monitor',
      'NavBar' => 'Config Item',
      'Prio' => '410',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => ' Monitor'
};
$Self->{'Frontend::Module'}->{'CMDBComputers'} =  {
  'Description' => 'Computers',
  'Group' => [
    'itsm-configitem'
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Computers',
      'Link' => 'Action=CMDBComputers',
      'Name' => 'Computers',
      'NavBar' => 'Config Item',
      'Prio' => '400',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'Computers'
};
$Self->{'Frontend::Module'}->{'CMDBInformationServer'} =  {
  'Description' => 'Server Information',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => ' Server Information',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Information <-> Server Information ',
    'Prio' => '590'
  },
  'NavBarName' => 'Admin',
  'Title' => ' Server Information'
};
$Self->{'Frontend::Module'}->{'CMDBInformationStatistics'} =  {
  'Description' => 'Information Statistics',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Information Statistics',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Information <-> Statistics ',
    'Prio' => '580'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Information Statistics'
};
$Self->{'Frontend::Module'}->{'CMDBInformationLogs'} =  {
  'Description' => 'Information Logs visualization',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Information Logs visualization',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Information <-> Logs visualization ',
    'Prio' => '570'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Information Logs visualization'
};
$Self->{'Frontend::Module'}->{'CMDBManageLocalImport'} =  {
  'Description' => 'Manage Local Import',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Manage Local Import',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Manage <-> Local Import ',
    'Prio' => '560'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Manage Local Import'
};
$Self->{'Frontend::Module'}->{'CMDBManageDictionary'} =  {
  'Description' => 'Manage Dictionary.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Manage Dictionary',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Manage <-> Dictionary ',
    'Prio' => '550'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Manage Dictionary..'
};
$Self->{'Frontend::Module'}->{'CMDBManageDuplicates'} =  {
  'Description' => 'Manage Duplicates.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Manage Duplicates',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Manage <-> Duplicates ',
    'Prio' => '540'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Manage Duplicates'
};
$Self->{'Frontend::Module'}->{'CMDBManageAdministrativeData'} =  {
  'Description' => 'Manage Administrative Data',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Manage Administrative Data',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Manage <-> Administrative Data ',
    'Prio' => '530'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Manage Administrative Data'
};
$Self->{'Frontend::Module'}->{'CMDBManageRegistry'} =  {
  'Description' => 'Manage Registry',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Manage Registry',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Manage <-> Registry ',
    'Prio' => '520'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Manage Registry'
};
$Self->{'Frontend::Module'}->{'CMDBNetworkAdminister'} =  {
  'Description' => 'Network Administer',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Network Administer',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Network <-> Administer ',
    'Prio' => '510'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Network Administer'
};
$Self->{'Frontend::Module'}->{'CMDBNetworkSNMP'} =  {
  'Description' => 'Network SNMP',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Network SNMP',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Network <-> SNMP ',
    'Prio' => '500'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Network SNMP'
};
$Self->{'Frontend::Module'}->{'CMDBNetworkIPDiscover'} =  {
  'Description' => 'Network IPDiscover',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Network IPDiscover',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Network <-> IPDiscover ',
    'Prio' => '490'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Network IPDiscover'
};
$Self->{'Frontend::Module'}->{'CMDBConfigAccount'} =  {
  'Description' => 'config update all account info.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Config Update all account info',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Config <-> Update all account info ',
    'Prio' => '480'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Config update all account info'
};
$Self->{'Frontend::Module'}->{'CMDBConfigAgent'} =  {
  'Description' => 'config agent',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Config Agent',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Config <-> Agent ',
    'Prio' => '470'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Config Agent'
};
$Self->{'Frontend::Module'}->{'CMDBConfigLabelFile'} =  {
  'Description' => 'label file configuration',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Label File Configuration',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Config <-> Label File Configuration ',
    'Prio' => '460'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Config Label file Configuration'
};
$Self->{'Frontend::Module'}->{'CMDBConfigBlacklist'} =  {
  'Description' => 'Config Blacklist',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Config Blacklist',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Config <-> Blacklist ',
    'Prio' => '450'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Config Blacklist'
};
$Self->{'Frontend::Module'}->{'CMDBConfig'} =  {
  'Description' => 'Config',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Config',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Config',
    'Prio' => '440'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Config'
};
$Self->{'Frontend::Module'}->{'CMDBDeploymentRules'} =  {
  'Description' => 'Deployment Rules',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Deployment Rules of affectation',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Deployment <-> Rules of affectation',
    'Prio' => '430'
  },
  'NavBarName' => 'Admin',
  'Title' => 'CMDB Rules'
};
$Self->{'Frontend::Module'}->{'CMDBDeploymentActivate'} =  {
  'Description' => 'Deployment Activate',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Deployment Activate',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Deployment <-> Activate',
    'Prio' => '420'
  },
  'NavBarName' => 'Admin',
  'Title' => 'CMDB Deployment Activate'
};
$Self->{'Frontend::Module'}->{'CMDBDeploymentBuild'} =  {
  'Description' => 'Deployment Build',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'CMDB',
    'Description' => 'Deployment Build',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Deployment <-> Build',
    'Prio' => '410'
  },
  'NavBarName' => 'Admin',
  'Title' => 'CMDB Deployment Build'
};
$Self->{'Frontend::Module'}->{'AgentProcessLinkObject'} =  {
  'Description' => 'This module is part of the agent area of OTRS.',
  'Title' => 'AgentProcessLinkObject'
};
$Self->{'GenericInterface::Operation::Module'}->{'FAQ::AgentFAQSearchName'} =  {
  'ConfigDialog' => 'AdminGenericInterfaceOperationDefault',
  'Controller' => 'FAQ',
  'Name' => 'AgentFAQSearchName'
};
$Self->{'Frontend::Module'}->{'AgentCustomPrinter'} =  {
  'Description' => 'This module is part of the agent area of OTRS.',
  'Title' => 'AgentCustomPrinter'
};
$Self->{'Frontend::Module'}->{'AgentBulkPrinter'} =  {
  'Description' => 'This module is part of the agent area of OTRS.',
  'Title' => 'AgentBulkPrinter'
};
$Self->{'Frontend::Module'}->{'AgentAssignmentMaster'} =  {
  'Description' => 'ADFE',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Add Query, SubQuery and associate with a User.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Agent Assigment Master',
    'Prio' => '410'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Agent Assignment Master'
};
$Self->{'Frontend::Module'}->{'AgentArticlePrinter'} =  {
  'Description' => 'This module is part of the agent area of OTRS.',
  'Title' => 'AgentArticlePrinter'
};
$Self->{'Frontend::Module'}->{'AdminDynamicFieldExtend'} =  {
  'Description' => 'ADFE',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage the Visibility of Admin Dynamic Field Extension.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Admin Dynamic Field Extension',
    'Prio' => '410'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Admin Dynamic Field Extend'
};
$Self->{'Frontend::Module'}->{'AdminCustomerGradeEmpIDMaster'} =  {
  'Description' => 'ADFE',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Add Query, SubQuery and associate with a User.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Customer Grade and Employee ID Assignment',
    'Prio' => '410'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Customer Grade and Employee ID Assignment'
};
$Self->{'ImportExport::FormatBackendRegistration'}->{'CSV'} =  {
  'Module' => 'Kernel::System::ImportExport::FormatBackend::CSV',
  'Name' => 'CSV'
};
$Self->{'Frontend::Module'}->{'AdminImportExport'} =  {
  'Description' => 'Import and export object information.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'ITSM.ImportExport.css'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Import/Export',
    'Prio' => '710'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Import/Export'
};
$Self->{'Loader::Agent::CommonJS'}->{'100-GeneralCatalog'} =  [
  'thirdparty/jscolor_1.4.1/jscolor.js'
];
$Self->{'Frontend::Module'}->{'AdminGeneralCatalog'} =  {
  'Description' => 'Admin.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Ticket',
    'Description' => 'Create and manage the General Catalog.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'General Catalog',
    'Prio' => '410'
  },
  'NavBarName' => 'Admin',
  'Title' => 'General Catalog'
};
$Self->{'ModernizeCustomerFormFields'} =  '1';
$Self->{'ModernizeFormFields'} =  '1';
$Self->{'OTRSBusiness::ReleaseChannel'} =  '1';
$Self->{'SystemMaintenance::IsActiveDefaultLoginErrorMessage'} =  'We are performing scheduled maintenance. Login is temporarily not available.';
$Self->{'SystemMaintenance::IsActiveDefaultLoginMessage'} =  'We are performing scheduled maintenance. We should be back online shortly.';
$Self->{'SystemMaintenance::IsActiveDefaultNotification'} =  'We are performing scheduled maintenance.';
$Self->{'SystemMaintenance::TimeNotifyUpcomingMaintenance'} =  '30';
$Self->{'PossibleNextActions'} =  {
  'Go to dashboard!' => '[% Env(\'CGIHandle\') %]?Action=AgentDashboard'
};
$Self->{'AutoComplete::Customer'}->{'Default'} =  {
  'AutoCompleteActive' => '1',
  'ButtonText' => 'Search',
  'MaxResultsDisplayed' => '20',
  'MinQueryLength' => '2',
  'QueryDelay' => '100'
};
$Self->{'AutoComplete::Agent'}->{'UserSearch'} =  {
  'AutoCompleteActive' => '1',
  'ButtonText' => 'Search User',
  'MaxResultsDisplayed' => '20',
  'MinQueryLength' => '2',
  'QueryDelay' => '100'
};
$Self->{'AutoComplete::Agent'}->{'CustomerSearch'} =  {
  'AutoCompleteActive' => '1',
  'ButtonText' => 'Search Customer',
  'MaxResultsDisplayed' => '20',
  'MinQueryLength' => '2',
  'QueryDelay' => '100'
};
$Self->{'AutoComplete::Agent'}->{'Default'} =  {
  'AutoCompleteActive' => '1',
  'ButtonText' => 'Search',
  'MaxResultsDisplayed' => '20',
  'MinQueryLength' => '2',
  'QueryDelay' => '100'
};
$Self->{'Cache::SubdirLevels'} =  '2';
$Self->{'Cache::InBackend'} =  '1';
$Self->{'Cache::InMemory'} =  '1';
$Self->{'Cache::Module'} =  'Kernel::System::Cache::FileStorable';
$Self->{'CustomerUser::EventModulePost'}->{'100-UpdateServiceMembership'} =  {
  'Event' => 'CustomerUserUpdate',
  'Module' => 'Kernel::System::CustomerUser::Event::ServiceMemberUpdate',
  'Transaction' => '0'
};
$Self->{'CustomerUser::EventModulePost'}->{'100-UpdateSearchProfiles'} =  {
  'Event' => 'CustomerUserUpdate',
  'Module' => 'Kernel::System::CustomerUser::Event::SearchProfileUpdate',
  'Transaction' => '0'
};
$Self->{'CustomerCompany::EventModulePost'}->{'100-UpdateCustomerUsers'} =  {
  'Event' => 'CustomerCompanyUpdate',
  'Module' => 'Kernel::System::CustomerCompany::Event::CustomerUserUpdate',
  'Transaction' => '0'
};
$Self->{'Events'}->{'CustomerCompany'} =  [
  'CustomerCompanyAdd',
  'CustomerCompanyUpdate'
];
$Self->{'Events'}->{'CustomerUser'} =  [
  'CustomerUserAdd',
  'CustomerUserUpdate'
];
$Self->{'AdminSelectBox::AllowDatabaseModification'} =  '0';
$Self->{'AdminCustomerCompany::RunInitialWildcardSearch'} =  '1';
$Self->{'AdminCustomerUser::RunInitialWildcardSearch'} =  '1';
$Self->{'TimeShowCompleteDescription'} =  '0';
$Self->{'Loader::Customer::SelectedSkin'} =  'default';
$Self->{'Loader::Customer::Skin'}->{'000-default'} =  {
  'Description' => 'This is the default orange - black skin for the customer interface.',
  'HomePage' => 'www.otrs.org',
  'InternalName' => 'default',
  'VisibleName' => 'Default'
};
$Self->{'Loader::Agent::DefaultSelectedSkin'} =  'default';
$Self->{'Loader::Agent::Skin'}->{'001-ivory-slim'} =  {
  'Description' => 'Balanced white skin by Felix Niklas (slim version).',
  'HomePage' => 'www.felixniklas.de',
  'InternalName' => 'ivory-slim',
  'VisibleName' => 'Ivory (Slim)'
};
$Self->{'Loader::Agent::Skin'}->{'001-ivory'} =  {
  'Description' => 'Balanced white skin by Felix Niklas.',
  'HomePage' => 'www.felixniklas.de',
  'InternalName' => 'ivory',
  'VisibleName' => 'Ivory'
};
$Self->{'Loader::Agent::Skin'}->{'001-slim'} =  {
  'Description' => '"Slim" skin which tries to save screen space for power users.',
  'HomePage' => 'www.otrs.org',
  'InternalName' => 'slim',
  'VisibleName' => 'Default (Slim)'
};
$Self->{'Loader::Agent::Skin'}->{'000-default'} =  {
  'Description' => 'This is the default orange - black skin.',
  'HomePage' => 'www.otrs.org',
  'InternalName' => 'default',
  'VisibleName' => 'Default'
};
$Self->{'FirstnameLastnameOrder'} =  '0';
$Self->{'OpenMainMenuOnHover'} =  '0';
$Self->{'Loader::Customer::CommonJS'}->{'000-Framework'} =  [
  'thirdparty/jquery-2.1.4/jquery.js',
  'thirdparty/jquery-browser-detection/jquery-browser-detection.js',
  'thirdparty/jquery-validate-1.14.0/jquery.validate.js',
  'thirdparty/jquery-ui-1.11.4/jquery-ui.js',
  'thirdparty/stacktrace-0.6.4/stacktrace.js',
  'thirdparty/jquery-pubsub/pubsub.js',
  'thirdparty/jquery-jstree-3.1.1/jquery.jstree.js',
  'Core.Debug.js',
  'Core.Exception.js',
  'Core.Data.js',
  'Core.JSON.js',
  'Core.JavaScriptEnhancements.js',
  'Core.Config.js',
  'Core.App.js',
  'Core.App.Responsive.js',
  'Core.AJAX.js',
  'Core.UI.js',
  'Core.UI.InputFields.js',
  'Core.UI.Accessibility.js',
  'Core.UI.Dialog.js',
  'Core.UI.RichTextEditor.js',
  'Core.UI.Datepicker.js',
  'Core.UI.Popup.js',
  'Core.UI.TreeSelection.js',
  'Core.UI.Autocomplete.js',
  'Core.Form.js',
  'Core.Form.ErrorTooltips.js',
  'Core.Form.Validate.js',
  'Core.Customer.js',
  'Core.Customer.Responsive.js'
];
$Self->{'Loader::Customer::ResponsiveCSS'}->{'000-Framework'} =  [
  'Core.Responsive.css'
];
$Self->{'Loader::Customer::CommonCSS'}->{'000-Framework'} =  [
  'Core.Reset.css',
  'Core.Default.css',
  'Core.Form.css',
  'Core.Dialog.css',
  'Core.Tooltip.css',
  'Core.Login.css',
  'Core.Control.css',
  'Core.Table.css',
  'Core.TicketZoom.css',
  'Core.InputFields.css',
  'Core.Print.css',
  'thirdparty/fontawesome/font-awesome.css'
];
$Self->{'Loader::Agent::CommonJS'}->{'000-Framework'} =  [
  'thirdparty/jquery-2.1.4/jquery.js',
  'thirdparty/jquery-browser-detection/jquery-browser-detection.js',
  'thirdparty/jquery-ui-1.11.4/jquery-ui.js',
  'thirdparty/jquery-ui-touch-punch-0.2.3/jquery.ui.touch-punch.js',
  'thirdparty/jquery-validate-1.14.0/jquery.validate.js',
  'thirdparty/stacktrace-0.6.4/stacktrace.js',
  'thirdparty/jquery-pubsub/pubsub.js',
  'thirdparty/jquery-jstree-3.1.1/jquery.jstree.js',
  'Core.JavaScriptEnhancements.js',
  'Core.Debug.js',
  'Core.Exception.js',
  'Core.Data.js',
  'Core.Config.js',
  'Core.JSON.js',
  'Core.App.js',
  'Core.App.Responsive.js',
  'Core.AJAX.js',
  'Core.UI.js',
  'Core.UI.InputFields.js',
  'Core.UI.Accordion.js',
  'Core.UI.Datepicker.js',
  'Core.UI.DnD.js',
  'Core.UI.Floater.js',
  'Core.UI.Resizable.js',
  'Core.UI.Table.js',
  'Core.UI.Accessibility.js',
  'Core.UI.RichTextEditor.js',
  'Core.UI.Dialog.js',
  'Core.UI.ActionRow.js',
  'Core.UI.Popup.js',
  'Core.UI.TreeSelection.js',
  'Core.UI.Autocomplete.js',
  'Core.Form.js',
  'Core.Form.ErrorTooltips.js',
  'Core.Form.Validate.js',
  'Core.Agent.js',
  'Core.Agent.Search.js',
  'Core.Agent.CustomerInformationCenterSearch.js',
  'Core.UI.Notification.js',
  'Core.Agent.Responsive.js'
];
$Self->{'Loader::Agent::ResponsiveCSS'}->{'000-Framework'} =  [
  'Core.Responsive.css'
];
$Self->{'Loader::Agent::CommonCSS'}->{'000-Framework'} =  [
  'Core.Reset.css',
  'Core.Default.css',
  'Core.Header.css',
  'Core.OverviewControl.css',
  'Core.OverviewSmall.css',
  'Core.OverviewMedium.css',
  'Core.OverviewLarge.css',
  'Core.Footer.css',
  'Core.PageLayout.css',
  'Core.Form.css',
  'Core.Table.css',
  'Core.Widget.css',
  'Core.WidgetMenu.css',
  'Core.TicketDetail.css',
  'Core.Tooltip.css',
  'Core.Dialog.css',
  'Core.InputFields.css',
  'Core.Print.css',
  'thirdparty/fontawesome/font-awesome.css'
];
$Self->{'Loader::Enabled::JS'} =  '1';
$Self->{'Loader::Enabled::CSS'} =  '1';
$Self->{'Secure::DisableBanner'} =  '0';
$Self->{'Frontend::AgentLinkObject::WildcardSearch'} =  '0';
$Self->{'DashboardBackend'}->{'0405-News'} =  {
  'Block' => 'ContentSmall',
  'CacheTTL' => '360',
  'Default' => '1',
  'Description' => '',
  'Group' => '',
  'Limit' => '6',
  'Module' => 'Kernel::Output::HTML::Dashboard::News',
  'Title' => 'OTRS News'
};
$Self->{'DashboardBackend'}->{'0400-UserOnline'} =  {
  'Block' => 'ContentSmall',
  'CacheTTLLocal' => '5',
  'Default' => '0',
  'Description' => '',
  'Filter' => 'Agent',
  'Group' => '',
  'IdleMinutes' => '60',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::UserOnline',
  'ShowEmail' => '0',
  'SortBy' => 'UserFullname',
  'Title' => 'Online'
};
$Self->{'DashboardBackend'}->{'0390-UserOutOfOffice'} =  {
  'Block' => 'ContentSmall',
  'CacheTTLLocal' => '5',
  'Default' => '1',
  'Description' => '',
  'Group' => '',
  'IdleMinutes' => '60',
  'Limit' => '10',
  'Module' => 'Kernel::Output::HTML::Dashboard::UserOutOfOffice',
  'SortBy' => 'UserFullname',
  'Title' => 'Out Of Office'
};
$Self->{'DashboardBackend'}->{'0000-ProductNotify'} =  {
  'Block' => 'ContentLarge',
  'CacheTTLLocal' => '1440',
  'Default' => '1',
  'Description' => 'News about OTRS releases!',
  'Group' => 'admin',
  'Module' => 'Kernel::Output::HTML::Dashboard::ProductNotify',
  'Title' => 'Product News'
};
$Self->{'LanguageDebug'} =  '0';
$Self->{'Stats::CustomerUserLoginsAsMultiSelect'} =  '0';
$Self->{'Stats::CustomerIDAsMultiSelect'} =  '1';
$Self->{'Stats::UseInvalidAgentInStats'} =  '1';
$Self->{'Stats::UseAgentElementInStats'} =  '0';
$Self->{'Stats::Format'} =  {
  'CSV' => 'CSV',
  'D3::BarChart' => 'Graph: Bar Chart',
  'D3::LineChart' => 'Graph: Line Chart',
  'D3::StackedAreaChart' => 'Graph: Stacked Area Chart',
  'Excel' => 'Excel',
  'Print' => 'Print'
};
$Self->{'Stats::SearchLimit'} =  '1000';
$Self->{'Stats::DefaultSelectedFormat'} =  [
  'Print',
  'CSV',
  'Excel',
  'D3::BarChart',
  'D3::LineChart',
  'D3::StackedAreaChart'
];
$Self->{'Stats::DefaultSelectedPermissions'} =  [
  'stats'
];
$Self->{'Stats::DefaultSelectedDynamicObject'} =  'Ticket';
$Self->{'Stats::SearchPageShown'} =  '50';
$Self->{'Stats::StatsStartNumber'} =  '10000';
$Self->{'Stats::StatsHook'} =  'Stat#';
$Self->{'Frontend::Module'}->{'AgentStatistics'} =  {
  'Description' => '',
  'Group' => [
    'stats'
  ],
  'GroupRo' => [
    'stats'
  ],
  'Loader' => {
    'CSS' => [
      'thirdparty/nvd3-1.7.1/nv.d3.css',
      'Core.Agent.Statistics.css'
    ],
    'JavaScript' => [
      'thirdparty/d3-3.5.6/d3.min.js',
      'thirdparty/nvd3-1.7.1/nvd3.min.js',
      'thirdparty/nvd3-1.7.1/models/OTRSLineChart.js',
      'thirdparty/nvd3-1.7.1/models/OTRSMultiBarChart.js',
      'thirdparty/nvd3-1.7.1/models/OTRSStackedAreaChart.js',
      'thirdparty/canvg-1.4/rgbcolor.js',
      'thirdparty/canvg-1.4/StackBlur.js',
      'thirdparty/canvg-1.4/canvg.js',
      'thirdparty/StringView-8/stringview.js',
      'Core.Agent.Statistics.js',
      'Core.UI.AdvancedChart.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AgentStatistics;Subaction=Overview',
      'LinkOption' => '',
      'Name' => 'Reports',
      'NavBar' => 'Reports',
      'Prio' => '8500',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => '',
      'GroupRo' => [
        'stats'
      ],
      'Link' => 'Action=AgentStatisticsReports;Subaction=Overview',
      'LinkOption' => 'class="OTRSBusinessRequired"',
      'Name' => 'Reports (OTRS Business Solution™)',
      'NavBar' => 'Reports',
      'Prio' => '100',
      'Type' => ''
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => '',
      'GroupRo' => [
        'stats'
      ],
      'Link' => 'Action=AgentStatistics;Subaction=Overview',
      'LinkOption' => '',
      'Name' => 'Statistics',
      'NavBar' => 'Reports',
      'Prio' => '200',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Reports',
  'Title' => 'Statistics'
};
$Self->{'Frontend::Module'}->{'AgentHTMLReference'} =  {
  'Description' => 'HTML Reference.',
  'Group' => [
    'users'
  ],
  'GroupRo' => [
    'users'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.HTMLReference.css'
    ]
  },
  'NavBarName' => '',
  'Title' => 'HTML Reference'
};
$Self->{'PublicFrontend::Module'}->{'PublicSupportDataCollector'} =  {
  'Description' => 'PublicSupportDataCollector',
  'NavBarName' => '',
  'Title' => 'PublicSupportDataCollector'
};
$Self->{'PublicFrontend::Module'}->{'PublicRepository'} =  {
  'Description' => 'PublicRepository',
  'NavBarName' => '',
  'Title' => 'PublicRepository'
};
$Self->{'PublicFrontend::Module'}->{'PublicDefault'} =  {
  'Description' => 'PublicDefault',
  'NavBarName' => '',
  'Title' => 'PublicDefault'
};
$Self->{'Frontend::Themes'} =  {
  'Lite' => '0',
  'Standard' => '1'
};
$Self->{'CustomerFrontend::Module'}->{'SpellingInline'} =  {
  'Description' => 'Spell checker.',
  'NavBarName' => '',
  'Title' => 'Spell Checker'
};
$Self->{'CustomerFrontend::Module'}->{'PictureUpload'} =  {
  'Description' => 'Picture upload module.',
  'NavBarName' => 'Ticket',
  'Title' => 'Picture-Upload'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerAccept'} =  {
  'Description' => 'To accept login information, such as an EULA or license.',
  'NavBarName' => '',
  'Title' => 'Info'
};
$Self->{'CustomerFrontend::Module'}->{'CustomerPreferences'} =  {
  'Description' => 'Customer preferences.',
  'NavBarName' => '',
  'Title' => 'Preferences'
};
$Self->{'CustomerFrontend::Module'}->{'Logout'} =  {
  'Description' => 'Logout of customer panel.',
  'NavBarName' => '',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AdminSystemMaintenance'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Schedule a maintenance period.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'System Maintenance',
    'Prio' => '501'
  },
  'NavBarName' => 'Admin',
  'Title' => 'System Maintenance'
};
$Self->{'Frontend::Module'}->{'AdminPackageManager'} =  {
  'Description' => 'Software Package Manager.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Update and extend your system with software packages.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Package Manager',
    'Prio' => '1000'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Package Manager'
};
$Self->{'Frontend::Module'}->{'AdminSelectBox'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Execute SQL statements.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'SQL Box',
    'Prio' => '700'
  },
  'NavBarName' => 'Admin',
  'Title' => 'SQL Box'
};
$Self->{'Frontend::Module'}->{'AdminLog'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'View system log messages.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'System Log',
    'Prio' => '600'
  },
  'NavBarName' => 'Admin',
  'Title' => 'System Log'
};
$Self->{'Frontend::Module'}->{'AdminCloudServices'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.CloudServices.css'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Manage OTRS Group cloud services.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Cloud Services',
    'Prio' => '380'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Cloud Services'
};
$Self->{'Frontend::Module'}->{'AdminSupportDataCollector'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.SupportDataCollector.css'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Manage support data.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Support Data Collector',
    'Prio' => '370'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Support Data Collector'
};
$Self->{'Frontend::Module'}->{'AgentOTRSBusiness'} =  {
  'Description' => 'Agent',
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.OTRSBusiness.css'
    ]
  },
  'NavBarName' => '',
  'Title' => 'OTRS Business Solution™'
};
$Self->{'Frontend::Module'}->{'AdminOTRSBusiness'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.OTRSBusiness.css'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Deploy and manage OTRS Business Solution™.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'OTRS Business Solution™',
    'Prio' => '360'
  },
  'NavBarName' => 'Admin',
  'Title' => 'OTRS Business Solution™'
};
$Self->{'Frontend::Module'}->{'AdminRegistration'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.Registration.css'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Manage system registration.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'System Registration',
    'Prio' => '350'
  },
  'NavBarName' => 'Admin',
  'Title' => 'System Registration'
};
$Self->{'Frontend::Module'}->{'AdminPerformanceLog'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.PerformanceLog.css'
    ]
  },
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'View performance benchmark results.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Performance Log',
    'Prio' => '550'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Performance Log'
};
$Self->{'Frontend::Module'}->{'AdminSession'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Manage existing sessions.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Session Management',
    'Prio' => '500'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Session Management'
};
$Self->{'Frontend::Module'}->{'AdminEmail'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'System',
    'Description' => 'Send notifications to users.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Admin Notification',
    'Prio' => '400'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Admin Notification'
};
$Self->{'Frontend::Module'}->{'AdminPostMasterFilter'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Email',
    'Description' => 'Filter incoming emails.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'PostMaster Filters',
    'Prio' => '200'
  },
  'NavBarName' => 'Admin',
  'Title' => 'PostMaster Filters'
};
$Self->{'Frontend::Module'}->{'AdminMailAccount'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Email',
    'Description' => 'Manage POP3 or IMAP accounts to fetch email from.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'PostMaster Mail Accounts',
    'Prio' => '100'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Mail Accounts'
};
$Self->{'Frontend::Module'}->{'AdminPGP'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Email',
    'Description' => 'Manage PGP keys for email encryption.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'PGP Keys',
    'Prio' => '1200'
  },
  'NavBarName' => 'Admin',
  'Title' => 'PGP Key Management'
};
$Self->{'Frontend::Module'}->{'AdminSMIME'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Email',
    'Description' => 'Manage S/MIME certificates for email encryption.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'S/MIME Certificates',
    'Prio' => '1100'
  },
  'NavBarName' => 'Admin',
  'Title' => 'S/MIME Management'
};
$Self->{'Frontend::Module'}->{'AdminRoleGroup'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Link roles to groups.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Roles <-> Groups',
    'Prio' => '800'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Roles <-> Groups'
};
$Self->{'Frontend::Module'}->{'AdminRoleUser'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Link agents to roles.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Agents <-> Roles',
    'Prio' => '700'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Agents <-> Roles'
};
$Self->{'Frontend::Module'}->{'AdminRole'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Create and manage roles.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Roles',
    'Prio' => '600'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Roles'
};
$Self->{'Frontend::Module'}->{'AdminCustomerUserService'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Link customer user to services.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Customer User <-> Services',
    'Prio' => '500'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Customer User <-> Services'
};
$Self->{'Frontend::Module'}->{'AdminCustomerUserGroup'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Link customer user to groups.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Customer User <-> Groups',
    'Prio' => '400'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Customers <-> Groups'
};
$Self->{'Frontend::NavBarModule'}->{'6-CustomerCompany'} =  {
  'Module' => 'Kernel::Output::HTML::NavBar::CustomerCompany'
};
$Self->{'Frontend::Module'}->{'AdminCustomerCompany'} =  {
  'Description' => 'Edit Customer Companies.',
  'Group' => [
    'admin',
    'users'
  ],
  'GroupRo' => [
    ''
  ],
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AdminCustomerCompany;Nav=Agent',
      'LinkOption' => '',
      'Name' => 'Customer Administration',
      'NavBar' => 'Customers',
      'Prio' => '9100',
      'Type' => ''
    }
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Create and manage customers.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Customers',
    'Prio' => '310'
  },
  'NavBarName' => 'Customers',
  'Title' => 'Customer Companies'
};
$Self->{'Frontend::Module'}->{'AdminCustomerUser'} =  {
  'Description' => 'Edit Customer Users.',
  'Group' => [
    'admin',
    'users'
  ],
  'GroupRo' => [
    ''
  ],
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => '',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AdminCustomerUser;Nav=Agent',
      'LinkOption' => '',
      'Name' => 'Customer User Administration',
      'NavBar' => 'Customers',
      'Prio' => '9000',
      'Type' => ''
    }
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Create and manage customer users.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Customer User',
    'Prio' => '300'
  },
  'NavBarName' => 'Customers',
  'Title' => 'Customer Users'
};
$Self->{'Frontend::Module'}->{'AdminUserGroup'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Link agents to groups.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Agents <-> Groups',
    'Prio' => '200'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Agents <-> Groups'
};
$Self->{'Frontend::Module'}->{'AdminGroup'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Create and manage groups.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Groups',
    'Prio' => '150'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Groups'
};
$Self->{'Frontend::Module'}->{'AdminUser'} =  {
  'Description' => 'Create and manage agents.',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Agent',
    'Description' => 'Create and manage agents.',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Agents',
    'Prio' => '100'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Agents'
};
$Self->{'Frontend::Module'}->{'AdminInit'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarName' => '',
  'Title' => 'Init'
};
$Self->{'Frontend::Module'}->{'Admin'} =  {
  'Description' => 'Admin Area.',
  'Group' => [
    'admin'
  ],
  'Loader' => {
    'CSS' => [
      'Core.Agent.Admin.css'
    ],
    'JavaScript' => [
      'Core.Agent.Admin.SysConfig.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'a',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=Admin',
      'LinkOption' => '',
      'Name' => 'Admin',
      'NavBar' => 'Admin',
      'Prio' => '10000',
      'Type' => 'Menu'
    }
  ],
  'NavBarModule' => {
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin'
  },
  'NavBarName' => 'Admin',
  'Title' => ''
};
$Self->{'Frontend::SearchDefault'} =  'Action=AgentTicketSearch;Subaction=AJAX';
$Self->{'Frontend::Module'}->{'AgentSearch'} =  {
  'Description' => 'Global Search Module.',
  'NavBarName' => '',
  'Title' => 'Search'
};
$Self->{'Frontend::Module'}->{'AgentInfo'} =  {
  'Description' => 'Generic Info module.',
  'NavBarName' => '',
  'Title' => 'Info'
};
$Self->{'Frontend::Module'}->{'AgentLinkObject'} =  {
  'Description' => 'Link Object.',
  'NavBarName' => '',
  'Title' => 'Link Object'
};
$Self->{'Frontend::Module'}->{'AgentBook'} =  {
  'Description' => 'Address book of CustomerUser sources.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.CustomerSearch.js',
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => '',
  'Title' => 'Address Book'
};
$Self->{'Frontend::Module'}->{'SpellingInline'} =  {
  'Description' => 'Spell checker.',
  'NavBarName' => '',
  'Title' => 'Spell Checker'
};
$Self->{'Frontend::Module'}->{'AgentSpelling'} =  {
  'Description' => 'Spell checker.',
  'Loader' => {
    'JavaScript' => [
      'Core.Agent.TicketAction.js'
    ]
  },
  'NavBarName' => '',
  'Title' => 'Spell Checker'
};
$Self->{'Frontend::Module'}->{'PictureUpload'} =  {
  'Description' => 'Picture upload module.',
  'NavBarName' => 'Ticket',
  'Title' => 'Picture Upload'
};
$Self->{'Frontend::Module'}->{'AgentPreferences'} =  {
  'Description' => 'Agent Preferences.',
  'Loader' => {
    'CSS' => [
      'Core.Agent.Preferences.css'
    ]
  },
  'NavBarName' => 'Preferences',
  'Title' => ''
};
$Self->{'AgentCustomerInformationCenter::Backend'}->{'0600-CIC-CustomerCompanyInformation'} =  {
  'Attributes' => '',
  'Block' => 'ContentSmall',
  'Default' => '1',
  'Description' => 'Customer Information',
  'Group' => '',
  'Module' => 'Kernel::Output::HTML::Dashboard::CustomerCompanyInformation',
  'Title' => 'Customer Information'
};
$Self->{'Frontend::Search::JavaScript'}->{'AgentCustomerInformationCenter'} =  {
  '^AgentCustomerInformationCenter' => 'Core.Agent.CustomerInformationCenterSearch.OpenSearchDialog()'
};
$Self->{'Frontend::Search'}->{'AgentCustomerInformationCenter'} =  {
  '^AgentCustomerInformationCenter' => 'Action=AgentCustomerInformationCenterSearch'
};
$Self->{'Frontend::Module'}->{'AgentCustomerInformationCenterSearch'} =  {
  'Description' => 'Customer Information Center Search.',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AgentCustomerInformationCenter'} =  {
  'Description' => 'Customer Information Center.',
  'Loader' => {
    'CSS' => [
      'Core.AllocationList.css'
    ],
    'JavaScript' => [
      'Core.UI.AllocationList.js',
      'Core.Agent.Dashboard.js',
      'Core.Agent.TableFilters.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'c',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AgentCustomerInformationCenter',
      'LinkOption' => 'onclick="window.setTimeout(function(){Core.Agent.CustomerInformationCenterSearch.OpenSearchDialog();}, 0); return false;"',
      'Name' => 'Customer Information Center',
      'NavBar' => 'Customers',
      'Prio' => '50',
      'Type' => ''
    },
    {
      'AccessKey' => '',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AgentCustomerInformationCenter',
      'LinkOption' => '',
      'Name' => 'Customers',
      'NavBar' => 'Customers',
      'Prio' => '60',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Customers',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AgentDashboard'} =  {
  'Description' => 'Agent Dashboard',
  'Loader' => {
    'CSS' => [
      'Core.Agent.Dashboard.css',
      'Core.AllocationList.css',
      'thirdparty/fullcalendar-2.4.0/fullcalendar.min.css',
      'thirdparty/nvd3-1.7.1/nv.d3.css'
    ],
    'JavaScript' => [
      'thirdparty/momentjs-2.10.6/moment.min.js',
      'thirdparty/fullcalendar-2.4.0/fullcalendar.min.js',
      'thirdparty/d3-3.5.6/d3.min.js',
      'thirdparty/nvd3-1.7.1/nvd3.min.js',
      'thirdparty/nvd3-1.7.1/models/OTRSLineChart.js',
      'thirdparty/nvd3-1.7.1/models/OTRSMultiBarChart.js',
      'thirdparty/nvd3-1.7.1/models/OTRSStackedAreaChart.js',
      'thirdparty/canvg-1.4/rgbcolor.js',
      'thirdparty/canvg-1.4/StackBlur.js',
      'thirdparty/canvg-1.4/canvg.js',
      'thirdparty/StringView-8/stringview.js',
      'Core.UI.AdvancedChart.js',
      'Core.UI.AllocationList.js',
      'Core.Agent.TableFilters.js',
      'Core.Agent.Dashboard.js'
    ]
  },
  'NavBar' => [
    {
      'AccessKey' => 'd',
      'Block' => 'ItemArea',
      'Description' => '',
      'Link' => 'Action=AgentDashboard',
      'LinkOption' => '',
      'Name' => 'Dashboard',
      'NavBar' => 'Dashboard',
      'Prio' => '50',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Dashboard',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'Logout'} =  {
  'Description' => 'Logout',
  'NavBarName' => '',
  'Title' => ''
};
$Self->{'CustomerPreferencesGroups'}->{'SMIME'} =  {
  'Active' => '1',
  'Column' => 'Other Settings',
  'Key' => 'S/MIME Certificate Upload',
  'Label' => 'S/MIME Certificate',
  'Module' => 'Kernel::Output::HTML::Preferences::SMIME',
  'PrefKey' => 'UserSMIMEKey',
  'Prio' => '11000'
};
$Self->{'CustomerPreferencesGroups'}->{'PGP'} =  {
  'Active' => '1',
  'Column' => 'Other Settings',
  'Key' => 'PGP Key Upload',
  'Label' => 'PGP Key',
  'Module' => 'Kernel::Output::HTML::Preferences::PGP',
  'PrefKey' => 'UserPGPKey',
  'Prio' => '10000'
};
$Self->{'CustomerPreferencesGroups'}->{'TimeZone'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Key' => 'Time Zone',
  'Label' => 'Time Zone',
  'Module' => 'Kernel::Output::HTML::Preferences::TimeZone',
  'PrefKey' => 'UserTimeZone',
  'Prio' => '5000'
};
$Self->{'CustomerPreferencesGroups'}->{'Theme'} =  {
  'Active' => '0',
  'Column' => 'User Profile',
  'Key' => 'Select your frontend Theme.',
  'Label' => 'Theme',
  'Module' => 'Kernel::Output::HTML::Preferences::Theme',
  'PrefKey' => 'UserTheme',
  'Prio' => '1000'
};
$Self->{'CustomerPreferencesGroups'}->{'Language'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Desc' => 'Select the main interface language.',
  'Key' => 'Language',
  'Label' => 'Interface language',
  'Module' => 'Kernel::Output::HTML::Preferences::Language',
  'PrefKey' => 'UserLanguage',
  'Prio' => '2000'
};
$Self->{'CustomerPreferencesGroups'}->{'GoogleAuthenticatorSecretKey'} =  {
  'Active' => '0',
  'Block' => 'Input',
  'Column' => 'Other Settings',
  'Key' => 'Shared Secret',
  'Label' => 'Google Authenticator',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserGoogleAuthenticatorSecretKey',
  'Prio' => '1100'
};
$Self->{'CustomerPreferencesGroups'}->{'Password'} =  {
  'Active' => '1',
  'Area' => 'Customer',
  'Column' => 'Other Settings',
  'Desc' => 'Set a new password by filling in your current password and a new one.',
  'Label' => 'Change password',
  'Module' => 'Kernel::Output::HTML::Preferences::Password',
  'PasswordMin2Characters' => '0',
  'PasswordMin2Lower2UpperCharacters' => '0',
  'PasswordMinSize' => '0',
  'PasswordNeedDigit' => '0',
  'PasswordRegExp' => '',
  'Prio' => '1000'
};
$Self->{'CustomerPreferencesView'} =  [
  'User Profile',
  'Other Settings'
];
$Self->{'CustomerPreferences'} =  {
  'Module' => 'Kernel::System::CustomerUser::Preferences::DB',
  'Params' => {
    'Table' => 'customer_preferences',
    'TableKey' => 'preferences_key',
    'TableUserID' => 'user_id',
    'TableValue' => 'preferences_value'
  }
};
$Self->{'Customer::AuthTwoFactorModule::AllowPreviousToken'} =  '1';
$Self->{'Customer::AuthTwoFactorModule::AllowEmptySecret'} =  '1';
$Self->{'Customer::AuthTwoFactorModule::SecretPreferencesKey'} =  'UserGoogleAuthenticatorSecretKey';
$Self->{'Customer::AuthModule::Radius::Die'} =  '1';
$Self->{'Customer::AuthModule::LDAP::Die'} =  '1';
$Self->{'Customer::AuthModule::DB::CustomerPassword'} =  'pw';
$Self->{'Customer::AuthModule::DB::CustomerKey'} =  'login';
$Self->{'Customer::AuthModule::DB::Table'} =  'customer_user';
$Self->{'Customer::AuthModule::DB::CryptType'} =  'sha2';
$Self->{'Customer::AuthModule'} =  'Kernel::System::CustomerAuth::DB';
$Self->{'CustomerPanelBodyNewAccount'} =  'Hi <OTRS_USERFIRSTNAME>,

You or someone impersonating you has created a new OTRS account for
you.

Full name: <OTRS_USERFIRSTNAME> <OTRS_USERLASTNAME>
User name: <OTRS_USERLOGIN>
Password : <OTRS_USERPASSWORD>

You can log in via the following URL. We encourage you to change your password
via the Preferences button after logging in.

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>customer.pl
            ';
$Self->{'CustomerPanelSubjectNewAccount'} =  'New OTRS Account!';
$Self->{'CustomerPanelBodyLostPassword'} =  'Hi <OTRS_USERFIRSTNAME>,


New password: <OTRS_NEWPW>

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>customer.pl
            ';
$Self->{'CustomerPanelSubjectLostPassword'} =  'New OTRS password';
$Self->{'CustomerPanelBodyLostPasswordToken'} =  'Hi <OTRS_USERFIRSTNAME>,

You or someone impersonating you has requested to change your OTRS
password.

If you want to do this, click on this link. You will receive another email containing the password.

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>customer.pl?Action=CustomerLostPassword;Token=<OTRS_TOKEN>

If you did not request a new password, please ignore this email.
            ';
$Self->{'CustomerPanelSubjectLostPasswordToken'} =  'New OTRS password request';
$Self->{'CustomerPanelCreateAccount'} =  '1';
$Self->{'CustomerPanelLostPassword'} =  '1';
$Self->{'Frontend::CustomerUser::Item'}->{'1-GoogleMaps'} =  {
  'Attributes' => 'UserStreet;UserCity;UserCountry;',
  'CSS' => 'Core.Agent.CustomerUser.GoogleMaps.css',
  'CSSClass' => 'GoogleMaps',
  'IconName' => 'fa-globe',
  'Module' => 'Kernel::Output::HTML::CustomerUser::Generic',
  'Required' => 'UserStreet;UserCity;',
  'Target' => '_blank',
  'Text' => 'Location',
  'URL' => 'http://maps.google.com/maps?z=7&q='
};
$Self->{'CustomerFrontend::NotifyModule'}->{'6-CustomerSystemMaintenance-Check'} =  {
  'Module' => 'Kernel::Output::HTML::Notification::CustomerSystemMaintenanceCheck'
};
$Self->{'CustomerFrontend::HeaderMetaModule'}->{'1-Refresh'} =  {
  'Module' => 'Kernel::Output::HTML::HeaderMeta::Refresh'
};
$Self->{'CustomerGroupAlwaysGroups'} =  [
  'users'
];
$Self->{'CustomerGroupSupport'} =  '0';
$Self->{'CustomerPanelUserID'} =  '1';
$Self->{'PreferencesGroups'}->{'TimeZone'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Key' => 'Time Zone',
  'Label' => 'Time Zone',
  'Module' => 'Kernel::Output::HTML::Preferences::TimeZone',
  'PrefKey' => 'UserTimeZone',
  'Prio' => '5000'
};
$Self->{'PreferencesGroups'}->{'OutOfOffice'} =  {
  'Active' => '1',
  'Block' => 'OutOfOffice',
  'Column' => 'User Profile',
  'Desc' => 'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.',
  'Key' => '',
  'Label' => 'Out Of Office Time',
  'Module' => 'Kernel::Output::HTML::Preferences::OutOfOffice',
  'PrefKey' => 'UserOutOfOffice',
  'Prio' => '4000'
};
$Self->{'PreferencesGroups'}->{'Theme'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Key' => 'Frontend theme',
  'Label' => 'Theme',
  'Module' => 'Kernel::Output::HTML::Preferences::Theme',
  'PrefKey' => 'UserTheme',
  'Prio' => '3000'
};
$Self->{'PreferencesGroups'}->{'Skin'} =  {
  'Active' => '1',
  'Column' => 'Other Settings',
  'Desc' => 'Select your preferred layout for OTRS.',
  'Key' => 'Skin',
  'Label' => 'Skin',
  'Module' => 'Kernel::Output::HTML::Preferences::Skin',
  'PrefKey' => 'UserSkin',
  'Prio' => '100'
};
$Self->{'PreferencesGroups'}->{'Language'} =  {
  'Active' => '1',
  'Column' => 'User Profile',
  'Desc' => 'Select the main interface language.',
  'Key' => 'Language',
  'Label' => 'Language',
  'Module' => 'Kernel::Output::HTML::Preferences::Language',
  'PrefKey' => 'UserLanguage',
  'Prio' => '1000'
};
$Self->{'PreferencesGroups'}->{'Comment'} =  {
  'Active' => '0',
  'Block' => 'Input',
  'Column' => 'Other Settings',
  'Data' => '[% Env("UserComment") %]',
  'Key' => 'Comment',
  'Label' => 'Comment',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserComment',
  'Prio' => '6000'
};
delete $Self->{'PreferencesGroups'}->{'SpellDict'};
$Self->{'PreferencesGroups'}->{'GoogleAuthenticatorSecretKey'} =  {
  'Active' => '0',
  'Block' => 'Input',
  'Column' => 'User Profile',
  'Desc' => 'Enter your shared secret to enable two factor authentication.',
  'Key' => 'Shared Secret',
  'Label' => 'Google Authenticator',
  'Module' => 'Kernel::Output::HTML::Preferences::Generic',
  'PrefKey' => 'UserGoogleAuthenticatorSecretKey',
  'Prio' => '0600'
};
$Self->{'PreferencesGroups'}->{'Password'} =  {
  'Active' => '1',
  'Area' => 'Agent',
  'Column' => 'User Profile',
  'Desc' => 'Set a new password by filling in your current password and a new one.',
  'Label' => 'Change password',
  'Module' => 'Kernel::Output::HTML::Preferences::Password',
  'PasswordMaxLoginFailed' => '0',
  'PasswordMin2Characters' => '0',
  'PasswordMin2Lower2UpperCharacters' => '0',
  'PasswordMinSize' => '0',
  'PasswordNeedDigit' => '0',
  'PasswordRegExp' => '',
  'Prio' => '0500'
};
$Self->{'PreferencesView'} =  [
  'User Profile',
  'Notification Settings',
  'Other Settings'
];
$Self->{'PreferencesTableUserID'} =  'user_id';
$Self->{'PreferencesTableValue'} =  'preferences_value';
$Self->{'PreferencesTableKey'} =  'preferences_key';
$Self->{'PreferencesTable'} =  'user_preferences';
$Self->{'AuthTwoFactorModule::AllowPreviousToken'} =  '1';
$Self->{'AuthTwoFactorModule::AllowEmptySecret'} =  '1';
$Self->{'AuthTwoFactorModule::SecretPreferencesKey'} =  'UserGoogleAuthenticatorSecretKey';
$Self->{'PerformanceLog::FileMax'} =  '25';
$Self->{'PerformanceLog::File'} =  '<OTRS_CONFIG_Home>/var/log/Performance.log';
$Self->{'PerformanceLog'} =  '0';
$Self->{'System::Customer::Permission'} =  [
  'ro',
  'rw'
];
$Self->{'NotificationBodyLostPassword'} =  'Hi <OTRS_USERFIRSTNAME>,


Here\'s your new OTRS password.

New password: <OTRS_NEWPW>

You can log in via the following URL:

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl
            ';
$Self->{'NotificationSubjectLostPassword'} =  'New OTRS password';
$Self->{'NotificationBodyLostPasswordToken'} =  'Hi <OTRS_USERFIRSTNAME>,

You or someone impersonating you has requested to change your OTRS
password.

If you want to do this, click on the link below. You will receive another email containing the password.

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=LostPassword;Token=<OTRS_TOKEN>

If you did not request a new password, please ignore this email.
            ';
$Self->{'NotificationSubjectLostPasswordToken'} =  'New OTRS password request';
$Self->{'NotificationSenderEmail'} =  'otrs@<OTRS_CONFIG_FQDN>';
$Self->{'NotificationSenderName'} =  'OTRS Notifications';
$Self->{'SMIME::FetchFromCustomer'} =  '0';
$Self->{'SMIME::StoreDecryptedData'} =  '1';
$Self->{'SMIME::CacheTTL'} =  '86400';
$Self->{'SMIME::PrivatePath'} =  '/etc/ssl/private';
$Self->{'SMIME::CertPath'} =  '/etc/ssl/certs';
$Self->{'SMIME::Bin'} =  '/usr/bin/openssl';
$Self->{'SMIME'} =  '0';
$Self->{'PGP::StoreDecryptedData'} =  '1';
$Self->{'PGP::Log'} =  {
  'BADSIG' => 'The PGP signature with the keyid has not been verified successfully.',
  'ERRSIG' => 'It was not possible to check the PGP signature, this may be caused by a missing public key or an unsupported algorithm.',
  'EXPKEYSIG' => 'The PGP signature was made by an expired key.',
  'GOODSIG' => 'Good PGP signature.',
  'KEYREVOKED' => 'The PGP signature was made by a revoked key, this could mean that the signature is forged.',
  'NODATA' => 'No valid OpenPGP data found.',
  'NO_PUBKEY' => 'No public key found.',
  'REVKEYSIG' => 'The PGP signature was made by a revoked key, this could mean that the signature is forged.',
  'SIGEXPIRED' => 'The PGP signature is expired.',
  'SIG_ID' => 'Signature data.',
  'TRUST_UNDEFINED' => 'This key is not certified with a trusted signature!.',
  'VALIDSIG' => 'The PGP signature with the keyid is good.'
};
$Self->{'PGP::TrustedNetwork'} =  '0';
$Self->{'PGP::Key::Password'} =  {
  '488A0B8F' => 'SomePassword',
  'D2DF79FA' => 'SomePassword'
};
$Self->{'PGP::Options'} =  '--homedir /opt/otrs/.gnupg/ --batch --no-tty --yes';
$Self->{'PGP::Bin'} =  '/usr/bin/gpg';
$Self->{'PGP'} =  '0';
$Self->{'PDF::TTFontFile'}->{'MonospacedBoldItalic'} =  'DejaVuSansMono-BoldOblique.ttf';
$Self->{'PDF::TTFontFile'}->{'MonospacedItalic'} =  'DejaVuSansMono-Oblique.ttf';
$Self->{'PDF::TTFontFile'}->{'MonospacedBold'} =  'DejaVuSansMono-Bold.ttf';
$Self->{'PDF::TTFontFile'}->{'Monospaced'} =  'DejaVuSansMono.ttf';
$Self->{'PDF::TTFontFile'}->{'ProportionalBoldItalic'} =  'DejaVuSans-BoldOblique.ttf';
$Self->{'PDF::TTFontFile'}->{'ProportionalItalic'} =  'DejaVuSans-Oblique.ttf';
$Self->{'PDF::TTFontFile'}->{'ProportionalBold'} =  'DejaVuSans-Bold.ttf';
$Self->{'PDF::TTFontFile'}->{'Proportional'} =  'DejaVuSans.ttf';
$Self->{'PDF::MaxPages'} =  '100';
$Self->{'PDF::PageSize'} =  'a4';
$Self->{'PDF::LogoFile'} =  '<OTRS_CONFIG_Home>/var/logo-otrs.png';
$Self->{'SOAP::Keep-Alive'} =  '0';
$Self->{'Events'}->{'DynamicField'} =  [
  'DynamicFieldAdd',
  'DynamicFieldUpdate',
  'DynamicFieldDelete'
];
$Self->{'Events'}->{'Package'} =  [
  'PackageInstall',
  'PackageReinstall',
  'PackageUpgrade',
  'PackageUninstall'
];
$Self->{'Package::EventModulePost'}->{'99-SupportDataSend'} =  {
  'Event' => '(PackageInstall|PackageReinstall|PackageUpgrade|PackageUninstall)',
  'Module' => 'Kernel::System::Package::Event::SupportDataSend',
  'Transaction' => '1'
};
$Self->{'Package::ShowFeatureAddons'} =  '1';
$Self->{'Package::Timeout'} =  '120';
$Self->{'Package::RepositoryRoot'} =  [
  'http://ftp.otrs.org/pub/otrs/misc/packages/repository.xml'
];
$Self->{'Package::FileUpload'} =  '1';
$Self->{'WebUserAgent::DisableSSLVerification'} =  '0';
$Self->{'WebUserAgent::Timeout'} =  '15';
$Self->{'SpellCheckerIgnore'} =  [
  'www',
  'webmail',
  'https',
  'http',
  'html',
  'rfc'
];
$Self->{'SpellCheckerDictDefault'} =  'english';
$Self->{'SpellCheckerBin'} =  '/usr/bin/ispell';
$Self->{'SpellChecker'} =  '0';
$Self->{'SwitchToCustomer::PermissionGroup'} =  'admin';
$Self->{'SwitchToCustomer'} =  '0';
$Self->{'SwitchToUser'} =  '0';
$Self->{'OutOfOfficeMessageTemplate'} =  '*** out of office until %s (%s d left) ***';
$Self->{'DemoSystem'} =  '0';
$Self->{'ShowMotd'} =  '0';
$Self->{'LostPassword'} =  '1';
$Self->{'Frontend::Output::FilterText'}->{'AAAURL'} =  {
  'Module' => 'Kernel::Output::HTML::FilterText::URL',
  'Templates' => {
    'AgentTicketZoom' => '1'
  }
};
$Self->{'CGILogPrefix'} =  'OTRS-CGI';
$Self->{'WebUploadCacheModule'} =  'Kernel::System::Web::UploadCache::DB';
$Self->{'WebMaxFileUpload'} =  '24000000';
$Self->{'TimeWorkingHours::Calendar9'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar9'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar9'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'CalendarWeekDayStart::Calendar9'} =  '1';
$Self->{'TimeZone::Calendar9'} =  '0';
$Self->{'TimeZone::Calendar9Name'} =  'Calendar Name 9';
$Self->{'TimeWorkingHours::Calendar8'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar8'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar8'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'CalendarWeekDayStart::Calendar8'} =  '1';
$Self->{'TimeZone::Calendar8'} =  '0';
$Self->{'TimeZone::Calendar8Name'} =  'Calendar Name 8';
$Self->{'TimeWorkingHours::Calendar7'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar7'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar7'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'CalendarWeekDayStart::Calendar7'} =  '1';
$Self->{'TimeZone::Calendar7'} =  '0';
$Self->{'TimeZone::Calendar7Name'} =  'Calendar Name 7';
$Self->{'TimeWorkingHours::Calendar6'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar6'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar6'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'CalendarWeekDayStart::Calendar6'} =  '1';
$Self->{'TimeZone::Calendar6'} =  '0';
$Self->{'TimeZone::Calendar6Name'} =  'Calendar Name 6';
$Self->{'TimeWorkingHours::Calendar5'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar5'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar5'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'CalendarWeekDayStart::Calendar5'} =  '1';
$Self->{'TimeZone::Calendar5'} =  '0';
$Self->{'TimeZone::Calendar5Name'} =  'Calendar Name 5';
$Self->{'TimeWorkingHours::Calendar4'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar4'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar4'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'CalendarWeekDayStart::Calendar4'} =  '1';
$Self->{'TimeZone::Calendar4'} =  '0';
$Self->{'TimeZone::Calendar4Name'} =  'Calendar Name 4';
$Self->{'TimeWorkingHours::Calendar3'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar3'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar3'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'CalendarWeekDayStart::Calendar3'} =  '1';
$Self->{'TimeZone::Calendar3'} =  '0';
$Self->{'TimeZone::Calendar3Name'} =  'Calendar Name 3';
$Self->{'TimeWorkingHours::Calendar2'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar2'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar2'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'CalendarWeekDayStart::Calendar2'} =  '1';
$Self->{'TimeZone::Calendar2'} =  '0';
$Self->{'TimeZone::Calendar2Name'} =  'Calendar Name 2';
$Self->{'TimeWorkingHours::Calendar1'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime::Calendar1'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays::Calendar1'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'CalendarWeekDayStart::Calendar1'} =  '1';
$Self->{'TimeZone::Calendar1'} =  '0';
$Self->{'TimeZone::Calendar1Name'} =  'Calendar Name 1';
$Self->{'TimeWorkingHours'} =  {
  'Fri' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Mon' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Sat' => [],
  'Sun' => [],
  'Thu' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Tue' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ],
  'Wed' => [
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ]
};
$Self->{'TimeVacationDaysOneTime'} =  {
  '2004' => {
    '1' => {
      '1' => 'test'
    }
  }
};
$Self->{'TimeVacationDays'} =  {
  '1' => {
    '1' => 'New Year\'s Day'
  },
  '12' => {
    '24' => 'Christmas Eve',
    '25' => 'First Christmas Day',
    '26' => 'Second Christmas Day',
    '31' => 'New Year\'s Eve'
  },
  '5' => {
    '1' => 'International Workers\' Day'
  }
};
$Self->{'CalendarWeekDayStart'} =  '1';
$Self->{'TimeZoneUserBrowserAutoOffset'} =  '1';
$Self->{'TimeZoneUser'} =  '0';
$Self->{'SessionTable'} =  'sessions';
$Self->{'SessionDir'} =  '<OTRS_CONFIG_Home>/var/sessions';
$Self->{'CustomerSessionPerUserLimit'} =  '20';
$Self->{'CustomerSessionLimit'} =  '100';
$Self->{'AgentSessionPerUserLimit'} =  '20';
$Self->{'AgentSessionLimit'} =  '100';
$Self->{'SessionCSRFProtection'} =  '1';
$Self->{'SessionUseCookieAfterBrowserClose'} =  '0';
$Self->{'SessionUseCookie'} =  '1';
$Self->{'SessionDeleteIfTimeToOld'} =  '1';
$Self->{'SessionActiveTime'} =  '600';
$Self->{'SessionMaxIdleTime'} =  '21600';
$Self->{'SessionMaxTime'} =  '57600';
$Self->{'SessionDeleteIfNotRemoteID'} =  '1';
$Self->{'SessionCheckRemoteIP'} =  '1';
$Self->{'CustomerPanelSessionName'} =  'OTRSCustomerInterface';
$Self->{'SessionName'} =  'OTRSAgentInterface';
$Self->{'SessionModule'} =  'Kernel::System::AuthSession::DB';
$Self->{'Frontend::NotifyModule'}->{'600-SystemMaintenance-Check'} =  {
  'Module' => 'Kernel::Output::HTML::Notification::SystemMaintenanceCheck'
};
$Self->{'Frontend::NotifyModule'}->{'500-OutofOffice-Check'} =  {
  'Module' => 'Kernel::Output::HTML::Notification::OutofOfficeCheck'
};
$Self->{'Frontend::NotifyModule'}->{'250-AgentSessionLimit'} =  {
  'Module' => 'Kernel::Output::HTML::Notification::AgentSessionLimit'
};
$Self->{'Frontend::NotifyModule'}->{'200-UID-Check'} =  {
  'Module' => 'Kernel::Output::HTML::Notification::UIDCheck'
};
$Self->{'CustomerFrontend::NotifyModule'}->{'1-OTRSBusiness'} =  {
  'Module' => 'Kernel::Output::HTML::Notification::CustomerOTRSBusiness'
};
$Self->{'Frontend::NotifyModule'}->{'100-OTRSBusiness'} =  {
  'Group' => 'admin',
  'Module' => 'Kernel::Output::HTML::Notification::AgentOTRSBusiness'
};
$Self->{'Frontend::HeaderMetaModule'}->{'100-Refresh'} =  {
  'Module' => 'Kernel::Output::HTML::HeaderMeta::Refresh'
};
$Self->{'InfoFile'} =  'AgentInfo';
$Self->{'InfoKey'} =  'wpt22';
$Self->{'SendmailBcc'} =  '';
$Self->{'SendmailModule::Host'} =  'mail.example.com';
$Self->{'SendmailModule::CMD'} =  '/usr/sbin/sendmail -i -f';
$Self->{'SendmailModule'} =  'Kernel::System::Email::Sendmail';
$Self->{'MinimumLogLevel'} =  'error';
$Self->{'LogModule::LogFile::Date'} =  '0';
$Self->{'LogModule::LogFile'} =  '/tmp/otrs.log';
$Self->{'LogModule::SysLog::Charset'} =  'utf-8';
$Self->{'LogModule::SysLog::LogSock'} =  'unix';
$Self->{'LogModule::SysLog::Facility'} =  'user';
$Self->{'LogModule'} =  'Kernel::System::Log::SysLog';
$Self->{'LinkObject::TypeGroup'}->{'0001'} =  [
  'Normal',
  'ParentChild'
];
$Self->{'LinkObject::Type'}->{'ParentChild'} =  {
  'SourceName' => 'Parent',
  'TargetName' => 'Child'
};
$Self->{'LinkObject::Type'}->{'Normal'} =  {
  'SourceName' => 'Normal',
  'TargetName' => 'Normal'
};
$Self->{'CheckEmailInvalidAddress'} =  '@(example)\\.(..|...)$';
$Self->{'CheckEmailValidAddress'} =  '^(root@localhost|admin@localhost)$';
$Self->{'CheckEmailAddresses'} =  '1';
$Self->{'CheckMXRecord'} =  '1';
$Self->{'AttachmentDownloadType'} =  'attachment';
$Self->{'TimeShowAlwaysLong'} =  '0';
$Self->{'TimeInputFormat'} =  'Option';
$Self->{'Frontend::MenuDragDropEnabled'} =  '1';
$Self->{'Frontend::AnimationEnabled'} =  '1';
$Self->{'DefaultViewLines'} =  '6000';
$Self->{'DefaultViewNewLine'} =  '90';
$Self->{'DisableContentSecurityPolicy'} =  '0';
$Self->{'DisableIFrameOriginRestricted'} =  '0';
$Self->{'DisableMSIFrameSecurityRestricted'} =  '0';
$Self->{'Frontend::RichText::EnhancedMode::Customer'} =  '0';
$Self->{'Frontend::RichText::EnhancedMode'} =  '0';
$Self->{'Frontend::RichText::DefaultCSS'} =  'font-family:Geneva,Helvetica,Arial,sans-serif; font-size: 12px;';
$Self->{'Frontend::RichTextHeight'} =  '320';
$Self->{'Frontend::RichTextWidth'} =  '620';
$Self->{'Frontend::RichTextPath'} =  '<OTRS_CONFIG_Frontend::WebPath>js/thirdparty/ckeditor-4.8.0/';
$Self->{'Frontend::RichText'} =  '1';
$Self->{'Frontend::JavaScriptPath'} =  '<OTRS_CONFIG_Frontend::WebPath>js/';
$Self->{'Frontend::CSSPath'} =  '<OTRS_CONFIG_Frontend::WebPath>css/';
$Self->{'Frontend::ImagePath'} =  '<OTRS_CONFIG_Frontend::WebPath>skins/Agent/default/img/';
$Self->{'Frontend::WebPath'} =  '/otrs-web/';
$Self->{'AgentLogo'} =  {
  'StyleHeight' => '85px',
  'StyleRight' => '38px',
  'StyleTop' => '4px',
  'StyleWidth' => '270px',
  'URL' => 'skins/Agent/default/img/logo_bg.png'
};
$Self->{'CustomerHeadline'} =  'Example Company';
$Self->{'DefaultTheme'} =  'Standard';
$Self->{'DefaultUsedLanguagesNative'} =  {
  'ar_SA' => 'العَرَبِية‎',
  'bg' => 'Български',
  'ca' => 'Català',
  'cs' => 'Česky',
  'da' => 'Dansk',
  'de' => 'Deutsch',
  'el' => 'Ελληνικά',
  'en' => 'English (United States)',
  'en_CA' => 'English (Canada)',
  'en_GB' => 'English (United Kingdom)',
  'es' => 'Español',
  'es_CO' => 'Español (Colombia)',
  'es_MX' => 'Español (México)',
  'et' => 'Eesti',
  'fa' => 'فارسى',
  'fi' => 'Suomi',
  'fr' => 'Français',
  'fr_CA' => 'Français (Canada)',
  'gl' => 'Galego',
  'he' => 'עברית',
  'hi' => 'हिन्दी',
  'hr' => 'Hrvatski',
  'hu' => 'Magyar',
  'id' => 'Bahasa Indonesia',
  'it' => 'Italiano',
  'ja' => '日本語',
  'lt' => 'Lietuvių kalba',
  'lv' => 'Latvijas',
  'ms' => 'Melayu',
  'nb_NO' => 'Norsk bokmål',
  'nl' => 'Nederlandse',
  'pl' => 'Polski',
  'pt' => 'Português',
  'pt_BR' => 'Português Brasileiro',
  'ru' => 'Русский',
  'sk_SK' => 'Slovenčina',
  'sl' => 'Slovenščina',
  'sr_Cyrl' => 'Српски',
  'sr_Latn' => 'Srpski',
  'sv' => 'Svenska',
  'sw' => 'Kiswahili',
  'th_TH' => 'ภาษาไทย',
  'tr' => 'Türkçe',
  'uk' => 'Українська',
  'vi_VN' => 'ViɆt Nam',
  'zh_CN' => '简体中文',
  'zh_TW' => '正體中文'
};
$Self->{'DefaultUsedLanguages'} =  {
  'ar_SA' => 'Arabic (Saudi Arabia)',
  'bg' => 'Bulgarian',
  'ca' => 'Catalan',
  'cs' => 'Czech',
  'da' => 'Danish',
  'de' => 'German',
  'el' => 'Greek',
  'en' => 'English (United States)',
  'en_CA' => 'English (Canada)',
  'en_GB' => 'English (United Kingdom)',
  'es' => 'Spanish',
  'es_CO' => 'Spanish (Colombia)',
  'es_MX' => 'Spanish (Mexico)',
  'et' => 'Estonian',
  'fa' => 'Persian',
  'fi' => 'Finnish',
  'fr' => 'French',
  'fr_CA' => 'French (Canada)',
  'gl' => 'Galician',
  'he' => 'Hebrew',
  'hi' => 'Hindi',
  'hr' => 'Croatian',
  'hu' => 'Hungarian',
  'id' => 'Indonesian',
  'it' => 'Italian',
  'ja' => 'Japanese',
  'lt' => 'Lithuanian',
  'lv' => 'Latvian',
  'ms' => 'Malay',
  'nb_NO' => 'Norwegian',
  'nl' => 'Nederlands',
  'pl' => 'Polish',
  'pt' => 'Portuguese',
  'pt_BR' => 'Portuguese (Brasil)',
  'ru' => 'Russian',
  'sk_SK' => 'Slovak',
  'sl' => 'Slovenian',
  'sr_Cyrl' => 'Serbian Cyrillic',
  'sr_Latn' => 'Serbian Latin',
  'sv' => 'Swedish',
  'sw' => 'Swahili',
  'th_TH' => 'Thai',
  'tr' => 'Turkish',
  'uk' => 'Ukrainian',
  'vi_VN' => 'Vietnam',
  'zh_CN' => 'Chinese (Simplified)',
  'zh_TW' => 'Chinese (Traditional)'
};
$Self->{'DefaultLanguage'} =  'en';
$Self->{'Organization'} =  'Example Company';
$Self->{'AdminEmail'} =  'admin@example.com';
$Self->{'ScriptAlias'} =  'otrs/';
$Self->{'HttpType'} =  'http';
delete $Self->{'NodeID'};
$Self->{'FQDN'} =  'yourhost.example.com';
$Self->{'SystemID'} =  '10';
$Self->{'ConfigImportAllowed'} =  '1';
$Self->{'ConfigLevel'} =  '100';
$Self->{'Frontend::TemplateCache'} =  '1';
$Self->{'Frontend::AjaxDebug'} =  '0';
$Self->{'Frontend::DebugMode'} =  '0';
$Self->{'SecureMode'} =  '0';
$Self->{'Frontend::Module'}->{'AdminCatalogDynamicfieldMappingMaster'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Catalog Dynamicfield Mapping Master',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Catalog Dynamicfield Mapping Master',
    'Prio' => '1300'
  },
  'NavBarName' => 'Admin',
  'Title' => ' Catalog Dynamicfield Mapping Master'
};
$Self->{'Frontend::Module'}->{'AdminCatalogCategoryItem'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Catalog Category Item',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Catalog Category Item',
    'Prio' => '1200'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Catalog Category Item'
};
$Self->{'Frontend::Module'}->{'AdminCatalogCategoryMaster'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Catalog Category Master',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Catalog Category Master',
    'Prio' => '1100'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Catalog Category Master'
};
$Self->{'Frontend::Module'}->{'AdminCatalogMaster'} =  {
  'Description' => 'Admin',
  'Group' => [
    'admin'
  ],
  'NavBarModule' => {
    'Block' => 'Customer',
    'Description' => 'Catalog Master',
    'Module' => 'Kernel::Output::HTML::NavBar::ModuleAdmin',
    'Name' => 'Catalog Master',
    'Prio' => '1000'
  },
  'NavBarName' => 'Admin',
  'Title' => 'Catalog Master'
};
}
1;
