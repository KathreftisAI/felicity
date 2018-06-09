# OTRS config file (automatically generated)
# VERSION:1.1
package Kernel::Config::Files::ZZZAuto;
use strict;
use warnings;
no warnings 'redefine';
use utf8;
sub Load {
    my ($File, $Self) = @_;
$Self->{'Ticket::Frontend::MenuModule'}->{'315-AddtlITSMField'} =  {
  'Action' => 'AgentTicketAddtlITSMField',
  'ClusterName' => 'Miscellaneous',
  'Description' => 'Change the ITSM fields!',
  'Link' => 'Action=AgentTicketAddtlITSMField;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Additional ITSM Fields',
  'PopupType' => 'TicketAction',
  'Target' => ''
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
      'LinkOption' => '',
      'Name' => 'Asset Management',
      'NavBar' => 'Config Item',
      'Prio' => '300',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'Asset Management'
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
      'LinkOption' => '',
      'Name' => 'New',
      'NavBar' => 'Config Item',
      'Prio' => '200',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'Add'
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
      'LinkOption' => '',
      'Name' => 'CMDB',
      'NavBar' => 'Config Item',
      'Prio' => '55',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview.',
      'Link' => 'Action=AgentITSMConfigItem',
      'LinkOption' => '',
      'Name' => 'Overview',
      'NavBar' => 'Config Item',
      'Prio' => '100',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Config Item',
  'Title' => 'Config Item'
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
      'Description' => 'PIR (Post Implementation Review)',
      'Link' => 'Action=ChangesDashboard',
      'LinkOption' => '',
      'Name' => 'Changes Dashboard',
      'NavBar' => 'ITSM Change',
      'Prio' => '401',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'ChangesDashboard'
};
$Self->{'ITSMWorkOrder::Frontend::AgentITSMWorkOrderType::DynamicField'} =  {
  '130' => 'WorkOrderApproval',
  '133' => 'WorkOrderDecision',
  '136' => 'WorkOrderConfirm'
};
$Self->{'Ticket::Frontend::MenuModule'}->{'318-ITSMChangeAddFromTemplate'} =  {
  'Action' => 'AgentITSMChangeAddFromTemplate',
  'Description' => 'Create a change (from template) from this ticket.',
  'Link' => 'Action=AgentITSMChangeAddFromTemplate;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::ITSMChange',
  'Name' => 'Create Change (from Template)'
};
$Self->{'Frontend::Module'}->{'AgentITSMTemplateEditContent'} =  {
  'Description' => 'ITSM Template Edit Content.',
  'GroupRo' => [
    'itsm-change-builder',
    'itsm-change-manager'
  ],
  'NavBarName' => '',
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMTemplateEditCAB'} =  {
  'Description' => 'ITSM Template Edit CAB.',
  'GroupRo' => [
    'itsm-change-builder',
    'itsm-change-manager'
  ],
  'NavBarName' => '',
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMTemplateEdit'} =  {
  'Description' => 'ITSM Template Edit.',
  'GroupRo' => [
    'itsm-change-builder',
    'itsm-change-manager'
  ],
  'NavBarName' => '',
  'Title' => 'ITSM Change'
};
$Self->{'Frontend::Module'}->{'AgentITSMTemplateDelete'} =  {
  'Description' => 'ITSM Template Delete.',
  'GroupRo' => [
    'itsm-change-builder',
    'itsm-change-manager'
  ],
  'NavBarName' => '',
  'Title' => 'ITSM Change'
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
      'LinkOption' => '',
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
      'LinkOption' => '',
      'Name' => 'Projected Service Availability',
      'NavBar' => 'ITSM Change',
      'Prio' => '350',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'PSA'
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
      'LinkOption' => '',
      'Name' => 'PIR',
      'NavBar' => 'ITSM Change',
      'Prio' => '400',
      'Type' => ''
    }
  ],
  'NavBarName' => 'ITSM Change',
  'Title' => 'ITSM Change'
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
      'LinkOption' => '',
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
      'LinkOption' => '',
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
      'LinkOption' => '',
      'Name' => 'ITSM Changes',
      'NavBar' => 'ITSM Change',
      'Prio' => '54',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Change Overview.',
      'Link' => 'Action=AgentITSMChange',
      'LinkOption' => '',
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
  'NavBarName' => '',
  'Title' => 'CAB Member Search'
};
$Self->{'ProductName'} =  'Felicity Ganges release';
$Self->{'Ticket::Frontend::AgentTicketZoom'}->{'DynamicField'} =  {
  'ITSMCriticality' => '1',
  'ITSMDecisionDate' => '1',
  'ITSMDecisionResult' => '1',
  'ITSMDueDate' => '1',
  'ITSMImpact' => '1',
  'ITSMRecoveryStartTime' => '1',
  'ITSMRepairStartTime' => '1',
  'ITSMReviewRequired' => '1',
  'MasterSlave' => 0
};
$Self->{'Ticket::Frontend::AgentTicketLockedView'}->{'DefaultColumns'} =  {
  'Age' => '2',
  'Changed' => '1',
  'Created' => '1',
  'CustomerCompanyName' => '1',
  'CustomerID' => '1',
  'CustomerName' => '2',
  'CustomerUserID' => '1',
  'EscalationResponseTime' => '1',
  'EscalationSolutionTime' => '1',
  'EscalationTime' => '1',
  'EscalationUpdateTime' => '1',
  'From' => '2',
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
  'CustomerID' => '1',
  'CustomerName' => '2',
  'CustomerUserID' => '1',
  'EscalationResponseTime' => '1',
  'EscalationSolutionTime' => '1',
  'EscalationTime' => '1',
  'EscalationUpdateTime' => '1',
  'From' => '2',
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
$Self->{'PostMaster::PreFilterModule::NewTicketReject::Body'} =  'Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Felicity Team';
$Self->{'PostmasterDefaultPriority'} =  'P1';
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
      'NavBar' => '',
      'Prio' => '130',
      'Type' => 'Submenu'
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Add New Ticket'
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
      'NavBar' => '',
      'Prio' => '120',
      'Type' => 'Submenu'
    }
  ],
  'NavBarName' => 'Ticket',
  'Title' => 'Overview'
};
delete $Self->{'Frontend::Module'}->{'AgentTicketQueue'};
$Self->{'CustomerFrontend::CommonParam'}->{'Action'} =  'CustomerDesk';
$Self->{'Ticket::Frontend::CustomerTicketZoom'}->{'PriorityDefault'} =  'P1';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'SLA'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'PriorityDefault'} =  'P1';
$Self->{'Ticket::Frontend::CustomerTicketMessageNew'}->{'NextScreenAfterNewTicket'} =  'CustomerTicketZoom';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'SLA'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'Service'} =  '0';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'PriorityDefault'} =  'P1';
$Self->{'Ticket::Frontend::CustomerTicketMessage'}->{'Priority'} =  '0';
$Self->{'AgentSelfNotifyOnAction'} =  '1';
delete $Self->{'DashboardBackend'}->{'0280-DashboardEventsTicketCalendar'};
delete $Self->{'DashboardBackend'}->{'0270-TicketQueueOverview'};
delete $Self->{'DashboardBackend'}->{'0260-TicketCalendar'};
$Self->{'Ticket::Frontend::MenuModule'}->{'440-Pending'} =  {
  'Action' => 'AgentTicketPending',
  'ClusterName' => 'Miscellaneous',
  'ClusterPriority' => '',
  'Description' => 'Set this ticket to pending',
  'Link' => 'Action=AgentTicketPending;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Pending',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::Frontend::MenuModule'}->{'301-AgentCustomPrinter'} =  {
  'Action' => 'AgentCustomPrinter',
  'ClusterName' => 'Miscellaneous',
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
  'ClusterName' => 'Miscellaneous',
  'ClusterPriority' => '',
  'Description' => 'Change the priority for this ticket',
  'Link' => 'Action=AgentTicketPriority;TicketID=[% Data.TicketID | html %]',
  'Module' => 'Kernel::Output::HTML::TicketMenu::Generic',
  'Name' => 'Priority',
  'PopupType' => 'TicketAction',
  'Target' => ''
};
$Self->{'Ticket::StateAfterPending'} =  {
  'open' => 'open'
};
$Self->{'Ticket::Frontend::AgentTicketForward'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketBounce'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketPending'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketClose'}->{'StateDefault'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketEmail'}->{'Priority'} =  'P1';
delete $Self->{'Ticket::Frontend::AgentTicketPhone'}->{'SLAMandatory'};
delete $Self->{'Ticket::Frontend::AgentTicketPhone'}->{'ServiceMandatory'};
$Self->{'Ticket::Frontend::AgentTicketPhone'}->{'Priority'} =  'P1';
$Self->{'Ticket::Frontend::AgentTicketPhoneOutbound'}->{'State'} =  'open';
$Self->{'Ticket::Frontend::AgentTicketLockedView'}->{'Order::Default'} =  'Down';
$Self->{'Ticket::Frontend::TimeUnits'} =  '(work units)';
$Self->{'Ticket::Frontend::CustomerDisableCompanyTicketAccess'} =  '1';
$Self->{'Ticket::Frontend::Overview'}->{'Preview'} =  {
  'CustomerInfo' => '1',
  'CustomerInfoMaxSize' => '18',
  'DefaultPreViewLines' => '25',
  'DefaultViewNewLine' => '90',
  'Module' => 'Kernel::Output::HTML::TicketOverview::Small',
  'ModulePriority' => '300',
  'Name' => 'Large',
  'NameShort' => 'L',
  'OverviewMenuModules' => '1',
  'StripEmptyLines' => '0',
  'TicketActionsPerTicket' => '1'
};
$Self->{'Ticket::Frontend::Overview'}->{'Medium'} =  {
  'CustomerInfo' => '1',
  'Module' => 'Kernel::Output::HTML::TicketOverview::Small',
  'ModulePriority' => '200',
  'Name' => 'Medium',
  'NameShort' => 'M',
  'OverviewMenuModules' => '1',
  'TicketActionsPerTicket' => '1'
};
$Self->{'Ticket::Type::Default'} =  'Service Request';
$Self->{'Ticket::Responsible'} =  '1';
$Self->{'Survey::NotificationBody'} =  'Dear Customer,

Thanks for using our service. Help us to improve us and our services.

Please give us feedback on how to improve our services:

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>public.pl?Action=PublicSurvey;PublicSurveyKey=<OTRS_PublicSurveyKey>

Thanks for your help!

Felicity-Team';
$Self->{'Survey::NotificationSender'} =  'felicity@unotechsoft.com';
$Self->{'Frontend::Module'}->{'AgentSurveyEditQuestions'} =  {
  'Description' => 'A module to edit survey questions.',
  'Loader' => {
    'CSS' => [
      'Survey.Agent.Default.css'
    ]
  },
  'NavBarName' => '',
  'Title' => ''
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
  'NavBarName' => 'Survey',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AgentSurveyStats'} =  {
  'Description' => 'Survey Stats Module.',
  'Loader' => {
    'CSS' => [
      'Survey.Agent.Default.css'
    ]
  },
  'NavBarName' => 'Survey',
  'Title' => ''
};
$Self->{'Frontend::Module'}->{'AgentSurveyEdit'} =  {
  'Description' => 'Survey Edit Module.',
  'Loader' => {
    'CSS' => [
      'Survey.Agent.Default.css'
    ]
  },
  'NavBarName' => 'Survey',
  'Title' => ''
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
      'LinkOption' => '',
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
      'LinkOption' => '',
      'Name' => 'Survey',
      'NavBar' => 'Survey',
      'Prio' => '57',
      'Type' => 'Menu'
    },
    {
      'AccessKey' => '',
      'Block' => '',
      'Description' => 'Overview',
      'Link' => 'Action=AgentSurveyOverview',
      'LinkOption' => '',
      'Name' => 'Overview',
      'NavBar' => 'Survey',
      'Prio' => '100',
      'Type' => ''
    }
  ],
  'NavBarName' => 'Survey',
  'Title' => 'Survey'
};
$Self->{'Ticket::Frontend::AgentRequest'}->{'Order::Default'} =  'Down';
$Self->{'Ticket::Frontend::AgentRequest'}->{'SortBy::Default'} =  'Age';
delete $Self->{'Frontend::Module'}->{'ServiceList'};
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
      'AccessKey' => '',
      'Block' => 'ItemArea',
      'Description' => 'Request1',
      'Link' => '',
      'LinkOption' => '',
      'Name' => 'Request',
      'NavBar' => 'Request',
      'Prio' => '51',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Request1',
  'Title' => 'Request'
};
$Self->{'Process::DefaultPriority'} =  'P1';
$Self->{'Ticket::Frontend::AgentProblem'}->{'Order::Default'} =  'Down';
$Self->{'Ticket::Frontend::AgentProblem'}->{'SortBy::Default'} =  'Age';
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
      'AccessKey' => '',
      'Block' => 'ItemArea',
      'Description' => 'Problem to be created from Incident',
      'Link' => '',
      'LinkOption' => '',
      'Name' => 'Problem',
      'NavBar' => 'Problem',
      'Prio' => '53',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Problem',
  'Title' => 'Problem'
};
$Self->{'Ticket::Frontend::AgentIncident'}->{'Order::Default'} =  'Down';
$Self->{'Ticket::Frontend::AgentIncident'}->{'SortBy::Default'} =  'Age';
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
      'AccessKey' => '',
      'Block' => 'ItemArea',
      'Description' => 'Incident1',
      'Link' => '',
      'LinkOption' => '',
      'Name' => 'Incident',
      'NavBar' => 'Incident',
      'Prio' => '52',
      'Type' => 'Menu'
    }
  ],
  'NavBarName' => 'Incident1',
  'Title' => 'Incident'
};
$Self->{'Frontend::Module'}->{'AgentFAQHistory'} =  {
  'Description' => '',
  'Group' => [
    'faq'
  ],
  'GroupRo' => [
    'faq'
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'History'
};
$Self->{'Frontend::Module'}->{'AgentFAQJournal'} =  {
  'Description' => '',
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
      'LinkOption' => '',
      'Name' => 'Journal',
      'NavBar' => 'FAQ',
      'Prio' => '930',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
};
$Self->{'Frontend::Module'}->{'AgentFAQRichText'} =  {
  'Description' => 'FAQ AJAX Responder for Richtext.',
  'Group' => [
    'faq'
  ],
  'GroupRo' => [
    'faq'
  ],
  'NavBarName' => '',
  'Title' => 'FAQ AJAX Responder'
};
$Self->{'Frontend::Module'}->{'AgentFAQSearchSmall'} =  {
  'Description' => '',
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
  'Description' => '',
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
      'LinkOption' => '',
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
      'LinkOption' => '',
      'Name' => 'Language Management',
      'NavBar' => 'FAQ',
      'Prio' => '940',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
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
      'LinkOption' => '',
      'Name' => 'New',
      'NavBar' => 'FAQ',
      'Prio' => '920',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
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
      'LinkOption' => '',
      'Name' => 'KB',
      'NavBar' => 'FAQ',
      'Prio' => '56',
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
      'LinkOption' => '',
      'Name' => 'Explorer',
      'NavBar' => 'FAQ',
      'Prio' => '910',
      'Type' => ''
    }
  ],
  'NavBarName' => 'FAQ',
  'Title' => 'FAQ'
};
$Self->{'Daemon::SchedulerTaskWorker::NotificationRecipientEmail'} =  'yazad@unotechsoft.com';
$Self->{'Loader::Enabled::JS'} =  '0';
$Self->{'Loader::Enabled::CSS'} =  '0';
delete $Self->{'DashboardBackend'}->{'0405-News'};
delete $Self->{'DashboardBackend'}->{'0000-ProductNotify'};
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
      'NavBar' => '',
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
delete $Self->{'Frontend::Module'}->{'AgentOTRSBusiness'};
$Self->{'Frontend::Module'}->{'AgentCustomerInformationCenterSearch'} =  {
  'Description' => 'Customer Information Center Search.',
  'NavBarName' => '',
  'Title' => ''
};
$Self->{'CustomerPanelBodyNewAccount'} =  'Hi <OTRS_USERFIRSTNAME>,

You or someone impersonating you has created a new Felicity account for you.

Full name: <OTRS_USERFIRSTNAME> <OTRS_USERLASTNAME>
User name: <OTRS_USERLOGIN>
Password : <OTRS_USERPASSWORD>

You can log in via the following URL. We encourage you to change your password
via the Preferences button after logging in.

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>customer.pl';
$Self->{'CustomerPanelSubjectNewAccount'} =  'New Felicity Account!';
$Self->{'CustomerPanelBodyLostPassword'} =  'Hi <OTRS_USERFIRSTNAME>,


New password: <OTRS_NEWPW>

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>customer.pl';
$Self->{'CustomerPanelSubjectLostPassword'} =  'New Felicity password';
$Self->{'CustomerPanelBodyLostPasswordToken'} =  'Hi <OTRS_USERFIRSTNAME>,

You or someone impersonating you has requested to change your Felicity password.

If you want to do this, click on this link. You will receive another email containing the password.

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>customer.pl?Action=CustomerLostPassword;Token=<OTRS_TOKEN>

If you did not request a new password, please ignore this email.';
$Self->{'CustomerPanelSubjectLostPasswordToken'} =  'New Felicity password request';
$Self->{'CustomerPanelCreateAccount'} =  '0';
$Self->{'CustomerPanelLostPassword'} =  '0';
delete $Self->{'PreferencesGroups'}->{'SpellDict'};
$Self->{'NotificationBodyLostPassword'} =  'Hi <OTRS_USERFIRSTNAME>,


Here\'s your new Felicity password.

New password: <OTRS_NEWPW>

You can log in via the following URL:

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl';
$Self->{'NotificationSubjectLostPassword'} =  'New Felicity password';
$Self->{'NotificationBodyLostPasswordToken'} =  'Hi <OTRS_USERFIRSTNAME>,

You or someone impersonating you has requested to change your Felicity password.

If you want to do this, click on the link below. You will receive another email containing the password.

<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=LostPassword;Token=<OTRS_TOKEN>

If you did not request a new password, please ignore this email.';
$Self->{'NotificationSubjectLostPasswordToken'} =  'New Felicity password request';
$Self->{'NotificationSenderEmail'} =  'felicity@unotechsoft.com';
$Self->{'NotificationSenderName'} =  'Felicity Demo-Notifications';
$Self->{'CGILogPrefix'} =  'FELICITY-CGI';
delete $Self->{'Frontend::NotifyModule'}->{'100-OTRSBusiness'};
delete $Self->{'SendmailBcc'};
$Self->{'SendmailModule::AuthPassword'} =  'Diamonds@unotech';
$Self->{'SendmailModule::AuthUser'} =  'felicity@unotechsoft.com';
$Self->{'SendmailModule::Port'} =  '587';
$Self->{'SendmailModule::Host'} =  'smtp.gmail.com';
$Self->{'SendmailModule'} =  'Kernel::System::Email::SMTPTLS';
$Self->{'CheckMXRecord'} =  '0';
$Self->{'Frontend::WebPath'} =  '/felicity-web/';
$Self->{'CustomerHeadline'} =  'Felicity Indus release';
$Self->{'Organization'} =  'Unotech Software';
$Self->{'AdminEmail'} =  'felicity@unotechsoft.com';
$Self->{'ScriptAlias'} =  'felicity/';
delete $Self->{'NodeID'};
$Self->{'FQDN'} =  'felicityplatform.com';
$Self->{'SecureMode'} =  '1';
}
1;
