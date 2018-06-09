# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::da_ITSMCore;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMCore
    $Self->{Translation}->{'Alternative to'} = 'Alternativ til';
    $Self->{Translation}->{'Availability'} = 'Tilgængelighed';
    $Self->{Translation}->{'Back End'} = 'Backend';
    $Self->{Translation}->{'Connected to'} = 'Forbundet til';
    $Self->{Translation}->{'Current State'} = 'Nuværende tilstand';
    $Self->{Translation}->{'Demonstration'} = 'Demonstration';
    $Self->{Translation}->{'Depends on'} = 'Afhænger af';
    $Self->{Translation}->{'End User Service'} = 'Kundeservice';
    $Self->{Translation}->{'Errors'} = 'Fejl';
    $Self->{Translation}->{'Front End'} = 'Frontend';
    $Self->{Translation}->{'IT Management'} = 'IT Management';
    $Self->{Translation}->{'IT Operational'} = 'IT operationel';
    $Self->{Translation}->{'Impact'} = 'Påvirkning';
    $Self->{Translation}->{'Incident State'} = 'Incident tilstand';
    $Self->{Translation}->{'Includes'} = 'Indkludere';
    $Self->{Translation}->{'Other'} = 'Andre';
    $Self->{Translation}->{'Part of'} = 'Del af';
    $Self->{Translation}->{'Project'} = 'Projekt';
    $Self->{Translation}->{'Recovery Time'} = 'Genetableringstid';
    $Self->{Translation}->{'Relevant to'} = 'Relevant for';
    $Self->{Translation}->{'Reporting'} = 'Reportering';
    $Self->{Translation}->{'Required for'} = 'Kræves for';
    $Self->{Translation}->{'Resolution Rate'} = 'Løsningsrate';
    $Self->{Translation}->{'Response Time'} = 'Reaktionstid';
    $Self->{Translation}->{'SLA Overview'} = 'SLA oversigt';
    $Self->{Translation}->{'Service Overview'} = 'Service oversigt';
    $Self->{Translation}->{'Service-Area'} = 'Service område';
    $Self->{Translation}->{'Training'} = 'Træning';
    $Self->{Translation}->{'Transactions'} = 'Transaktioner';
    $Self->{Translation}->{'Underpinning Contract'} = 'Underliggende kontrakt';
    $Self->{Translation}->{'allocation'} = '';

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'Kritikalitet <-> Påvirkning <-> Prioritet';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality <-> Impact.'} =
        '';
    $Self->{Translation}->{'Priority allocation'} = '';

    # Template: AdminSLA
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'Minimumstid mellem Incidents';

    # Template: AdminService
    $Self->{Translation}->{'Criticality'} = 'Kritikalitet';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = '';
    $Self->{Translation}->{'Last changed'} = 'Sidst ændret';
    $Self->{Translation}->{'Last changed by'} = 'Sidst ændret af';
    $Self->{Translation}->{'Associated Services'} = 'Tilknyttede services';

    # Template: AgentITSMServiceZoom
    $Self->{Translation}->{'Service Information'} = '';
    $Self->{Translation}->{'Current incident state'} = '';
    $Self->{Translation}->{'Associated SLAs'} = 'Tilknyttede SLAs';

    # Perl Module: Kernel/Modules/AgentITSMServicePrint.pm
    $Self->{Translation}->{'Current Incident State'} = 'Nuværende Incident tilstand';

    # SysConfig
    $Self->{Translation}->{'Both'} = '';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked Services widget (LinkObject::ViewMode = "complex"). Note: Only Service attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the AdminITSMCIPAllocate configuration in the admin area.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMService object in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} =
        '';
    $Self->{Translation}->{'ITSM SLA Overview.'} = '';
    $Self->{Translation}->{'ITSM Service Overview.'} = '';
    $Self->{Translation}->{'Incident'} = 'Incident';
    $Self->{Translation}->{'Incident State Type'} = '';
    $Self->{Translation}->{'Incident State Type.'} = '';
    $Self->{Translation}->{'Manage priority matrix.'} = '';
    $Self->{Translation}->{'Module to show back link in service menu.'} = '';
    $Self->{Translation}->{'Module to show back link in sla menu.'} = '';
    $Self->{Translation}->{'Module to show print link in service menu.'} = '';
    $Self->{Translation}->{'Module to show print link in sla menu.'} = '';
    $Self->{Translation}->{'Module to show the link link in service menu.'} = '';
    $Self->{Translation}->{'Operational'} = 'Operationel';
    $Self->{Translation}->{'Parameters for the incident states in the preference view.'} = '';
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
    $Self->{Translation}->{'Width of ITSM textareas.'} = '';

}

1;
