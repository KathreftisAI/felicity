# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sw_ITSMCore;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMCore
    $Self->{Translation}->{'Alternative to'} = 'Badala ya ';
    $Self->{Translation}->{'Availability'} = 'Upatikanaji';
    $Self->{Translation}->{'Back End'} = 'Mazingira ya nyuma';
    $Self->{Translation}->{'Connected to'} = 'Imeunganishwa na';
    $Self->{Translation}->{'Current State'} = 'Hali ya sasa';
    $Self->{Translation}->{'Demonstration'} = 'Maonyesho';
    $Self->{Translation}->{'Depends on'} = 'Inategemeana na ';
    $Self->{Translation}->{'End User Service'} = 'Huduma ya mtumiaji wa mwihso';
    $Self->{Translation}->{'Errors'} = 'Makosa';
    $Self->{Translation}->{'Front End'} = 'Mazingira ya mbele';
    $Self->{Translation}->{'IT Management'} = 'Usimamizi wa IT';
    $Self->{Translation}->{'IT Operational'} = 'Uendeshaji wa IT';
    $Self->{Translation}->{'Impact'} = 'Madhara';
    $Self->{Translation}->{'Incident State'} = 'Hali ya tukio';
    $Self->{Translation}->{'Includes'} = 'Inahusisha';
    $Self->{Translation}->{'Other'} = 'Engine';
    $Self->{Translation}->{'Part of'} = 'Sehemu ya';
    $Self->{Translation}->{'Project'} = 'Mradi';
    $Self->{Translation}->{'Recovery Time'} = 'Muda wa kupona';
    $Self->{Translation}->{'Relevant to'} = 'Husiana na';
    $Self->{Translation}->{'Reporting'} = 'Uarifu';
    $Self->{Translation}->{'Required for'} = 'Inahitajika kwa';
    $Self->{Translation}->{'Resolution Rate'} = 'Kiwango cha muonekano';
    $Self->{Translation}->{'Response Time'} = 'Muda wa majibu';
    $Self->{Translation}->{'SLA Overview'} = 'Marejeo ya SLA';
    $Self->{Translation}->{'Service Overview'} = 'Marejeo ya huduma';
    $Self->{Translation}->{'Service-Area'} = 'Eneo la huduma';
    $Self->{Translation}->{'Training'} = 'Mafunzo';
    $Self->{Translation}->{'Transactions'} = 'Miamala';
    $Self->{Translation}->{'Underpinning Contract'} = 'Mkataba wa kuimarisha';
    $Self->{Translation}->{'allocation'} = 'Ugawaji';

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'Umuhimu <-> Madhara <-> Kipaumbele';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality <-> Impact.'} =
        'Simamia matokeo ya kipaumbele ya kuunganisha Umuhimu ';
    $Self->{Translation}->{'Priority allocation'} = 'Kuweka kipaumbele';

    # Template: AdminSLA
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'Kima cha chini cha muda kati ya matukio';

    # Template: AdminService
    $Self->{Translation}->{'Criticality'} = 'Umuhimu';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = 'Taarifa za SLA';
    $Self->{Translation}->{'Last changed'} = 'Mwisho kubadilishwa';
    $Self->{Translation}->{'Last changed by'} = 'Mwsho kubadilishwa na';
    $Self->{Translation}->{'Associated Services'} = 'Huduma zinazohusika';

    # Template: AgentITSMServiceZoom
    $Self->{Translation}->{'Service Information'} = 'Taarifa za huduma';
    $Self->{Translation}->{'Current incident state'} = 'Hali ya tukio la sasa';
    $Self->{Translation}->{'Associated SLAs'} = 'SLA zinazohusika';

    # Perl Module: Kernel/Modules/AgentITSMServicePrint.pm
    $Self->{Translation}->{'Current Incident State'} = 'Hali ya tukio la sasa';

    # SysConfig
    $Self->{Translation}->{'Both'} = '';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked Services widget (LinkObject::ViewMode = "complex"). Note: Only Service attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the AdminITSMCIPAllocate configuration in the admin area.'} =
        'Usajili wa moduli za mazingira ya mbele kwa usanidi wa AdminITSMCIPAllocate katika eneo la kiongozi.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} =
        'Usajili wa moduli ya mazingira ya mbele kwa kipengee cha ITSMSLA cha wakala  katika kiolesura cha wakala.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} =
        'Usajili wa moduli ya mazingira ya mbele kwa kipengee cha  uchapishwaji cha ITSMSLA cha wakala katika kiolesura cha wakala';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} =
        'Usajili wa moduli ya mazingira ya mbele kwa kipengee cha kukuzwa cha ITSMSLA cha wakala katika kiolesura cha wakala';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMService object in the agent interface.'} =
        'Usajili wa moduli ya mazingira ya mbele kwa kipengee cha huduma cha ITSMSLA cha wakala katika kiolesura cha wakala.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} =
        'Usajili wa moduli ya mazingira ya mbele kwa kipengee cha kuchapishwa kwa huduma cha ITSMSLA cha wakala katika kiolesura cha wakala.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} =
        'Usajili wa moduli ya mazingira ya mbele kwa kipengee cha kukuzwa kwa huduma cha ITSMSLA cha wakala katika kiolesura cha wakala.';
    $Self->{Translation}->{'ITSM SLA Overview.'} = '';
    $Self->{Translation}->{'ITSM Service Overview.'} = '';
    $Self->{Translation}->{'Incident'} = 'Tukio';
    $Self->{Translation}->{'Incident State Type'} = '';
    $Self->{Translation}->{'Incident State Type.'} = '';
    $Self->{Translation}->{'Manage priority matrix.'} = 'Simamia matriki ya kipaumbele.';
    $Self->{Translation}->{'Module to show back link in service menu.'} = 'Moduli ya kuonyesha kiungo cha kurudi nyuma katika menyu ya huduma.';
    $Self->{Translation}->{'Module to show back link in sla menu.'} = 'Moduli ya kuonyesha kiungo cha kurudi nyuma katika menyu ya sla.';
    $Self->{Translation}->{'Module to show print link in service menu.'} = 'Moduli ya kuonyesha kiungo cha kuchapisha katika menyu ya huduma.';
    $Self->{Translation}->{'Module to show print link in sla menu.'} = 'Moduli ya kuonyesha kiungo cha kuchapisha katika menyu ya sla.';
    $Self->{Translation}->{'Module to show the link link in service menu.'} = 'Moduli ya kuonyesha kiungo cha kiungo katika menyu ya huduma.';
    $Self->{Translation}->{'Operational'} = 'Uendeshaji';
    $Self->{Translation}->{'Parameters for the incident states in the preference view.'} = 'Vigezo ya hali ya matukio katika mandhari ya mapendeleo.';
    $Self->{Translation}->{'SLA Print.'} = '';
    $Self->{Translation}->{'SLA Zoom.'} = '';
    $Self->{Translation}->{'Service Print.'} = '';
    $Self->{Translation}->{'Service Zoom.'} = '';
    $Self->{Translation}->{'Set the type and direction of links to be used to calculate the incident state. The key is the name of the link type (as defined in LinkObject::Type), and the value is the direction of the IncidentLinkType that should be followed to calculate the incident state. For example if the IncidentLinkType is set to \'DependsOn\', and the Direction is \'Source\', only \'Depends on\' links will be followed (and not the opposite link \'Required for\') to calculate the incident state. You can add more link types ad directions as you like, e.g. \'Includes\' with the direction \'Target\'. All link types defined in the sysconfig options LinkObject::Type are possible and the direction can be \'Source\', \'Target\', or \'Both\'. IMPORTANT: AFTER YOU MAKE CHANGES TO THIS SYSCONFIG OPTION YOU NEED TO RUN THE SCRIPT bin/otrs.ITSMConfigItemIncidentStateRecalculate.pl SO THAT ALL INCIDENT STATES WILL BE RECALCULATED BASED ON THE NEW SETTINGS!'} =
        'Weka aina na mwelekeo wa viungo vitakavyotumika kutafuta hali ya tukio. Funguo ni jina la aina ya kiungo (kama ilivyofafanuliwa katika Kipengee cha Kiungo:: Aina), na thamani ni mweleko wa Aina ya kiungo cha tukio ambacho kifatwe ili kutafuta hali ya tukio. Kwa mfano kama Aina ya kiungo ya tukio imewekwa kwenye \'Inategemeana na\', na mwelekeo ni \'Chanzo\', viungo \'Inategemeana na\' tu vitafwata (na sio kiungo cha tofauti \'Inahitajika kwa\')kutafuta halii ya tukio. Unaweza kuongeza zaidi aina na mielekeo kama upendavyo mfano \'Inahusisha\' na mwelekeo \'Lengo\'. Viungo vyote vilivyofafanuliwa katika chaguo la mfumo la usanidi KipengeeKiungo::Aina vinawezekana na mwelekeo unaweza kuwa \'Chanzo\' , \'Lengo\' au \'Yote\'. MUHIMU: BAADA YA KUFANYA MABADILIKO KATIKA CHAGUO HILI LA USANIDI MFUMO  UNAHITAJI KUWASHA MAANDIKO bin/otrs.ITSMConfigItemIncidentStateRecalculate.pl ILI HALI YA MATUKIO YOTE YAWEZE KUTAFUTWA KUTEGEMEANA NA MIPANGILIO MIPYA! ';
    $Self->{Translation}->{'This setting defines that a \'ITSMChange\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Badiliko la ITSM\' kinweza kuunganishwa na kipengee cha \'Tiketi\' kwa kutumia aina ya kiungo \'Kawaida\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee cha \'Maswali yanayoulizwa mara kwa mara\' kwa kutumia aina ya kiungo \'Kawaida\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee cha \'Maswali yanayoulizwa mara kwa mara\' kwa kutumia aina ya kiungo \'ParentChild\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee cha \'Maswali yanayoulizwa mara kwa mara\' kwa kutumia aina ya kiungo \'Inahusiana na\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'AlternativeTo\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee cha \'Huduma\' kwa kutumia aina ya kiungo \'Badala ya\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee cha \'Huduma\' kwa kutumia aina ya kiungo \'Inategemeana na\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'RelevantTo\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee cha \'Huduma\' kwa kutumia aina ya kiungo \'Husiana na\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'AlternativeTo\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee cha \'Tiketi\' kwa kutumia aina ya kiungo \'Badala ya\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'DependsOn\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee cha \'Tiketi\' kwa kutumia aina ya kiungo \'Inategemeana na\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'RelevantTo\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee cha \'Tiketi\' kwa kutumia aina ya kiungo \'Husiana na\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'AlternativeTo\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee kingine cha\'Kipengele cha usanidi cha ITSM\'  kwa kutumia aina ya kiungo \'Badala ya\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'ConnectedTo\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee kingine cha\'Kipengele cha usanidi cha ITSM\'  kwa kutumia aina ya kiungo \'Inaunganishwa na\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee kingine cha\'Kipengele cha usanidi cha ITSM\'  kwa kutumia aina ya kiungo \'Inategemeana na\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'Includes\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee kingine cha\'Kipengele cha usanidi cha ITSM\'  kwa kutumia aina ya kiungo \'Husisha\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'RelevantTo\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Kipengele cha usanidi cha ITSM\' kinaweza kuunganishwa na kipengee kingine cha\'Kipengele cha usanidi cha ITSM\'  kwa kutumia aina ya kiungo \'Husiana na\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Mpangilio wa kazi wa ITSM\' kinaweza kuunganishwa na kipengee kingine cha\'Kipengele cha usanidi cha ITSM\'  kwa kutumia aina ya kiungo \'Inategemeana na\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'Normal\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Mpangilio wa kazi wa ITSM\' kinaweza kuunganishwa na kipengee kingine cha\'Kipengele cha usanidi cha ITSM\'  kwa kutumia aina ya kiungo \'Kawaida\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Mpangilio wa kazi wa ITSM\' kinaweza kuunganishwa na kipengee kingine cha\'Huduma\' kwa kutumia aina ya kiungo \'Inategemeana na\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'Normal\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Mpangilio wa kazi wa ITSM\' kinaweza kuunganishwa na kipengee kingine cha\'Huduma\' kwa kutumia aina ya kiungo \'Kawaida\'.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Mpangilio wa kazi wa ITSM\' kinaweza kuunganishwa na kipengee kingine cha\'Tiketi\' kwa kutumia aina ya kiungo \'Kawaida\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Huduma\' kinaweza kuunganishwa na kipengee cha \'Maswali yanayoulizwa mara kwa mara\' kwa kutumia aina ya kiungo \'Kawaida\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengee cha \'Huduma\' kinaweza kuunganishwa na kipengee cha \'Maswali yanayoulizwa mara kwa mara\' kwa kutumia aina ya kiungo \'ParentChild\'.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        'Husiana na';
    $Self->{Translation}->{'This setting defines the link type \'AlternativeTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Mipangilio hii inafafanua aina ya kiungo \'Badala ya\'. Kama jina la chanzo na jina lengwa yana thamani moja, kiungo kinachotokana ni hakina uelekeo. Kama thamani ni tofauti, kiungo kilichotokea kina uelekeo.';
    $Self->{Translation}->{'This setting defines the link type \'ConnectedTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Mipangilio hii inafafanua aina ya kiungo \'Imeunganishwa na\'. Kama jina la chanzo na jina lengwa yana thamani moja, kiungo kinachotokana ni hakina uelekeo. Kama thamani ni tofauti, kiungo kilichotokea kina uelekeo.';
    $Self->{Translation}->{'This setting defines the link type \'DependsOn\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Mipangilio hii inafafanua aina ya kiungo \'Inategemeana na\'. Kama jina la chanzo na jina lengwa yana thamani moja, kiungo kinachotokana ni hakina uelekeo. Kama thamani ni tofauti, kiungo kilichotokea kina uelekeo.';
    $Self->{Translation}->{'This setting defines the link type \'Includes\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Mipangilio hii inafafanua aina ya kiungo \'Inahusisha\'. Kama jina la chanzo na jina lengwa yana thamani moja, kiungo kilichotokea ni hakina uelekeo. Kama thamani ni tofauti, kiungo kilichotokea kina uelekeo.';
    $Self->{Translation}->{'This setting defines the link type \'RelevantTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Mipangilio hii inafafanua aina ya kiungo \'Husiana na\'. Kama jina la chanzo na jina lengwa yana thamani moja, kiungo kilichotokea ni hakina uelekeo. Kama thamani ni tofauti, kiungo kilichotokea kina uelekeo.';
    $Self->{Translation}->{'Width of ITSM textareas.'} = 'Upana wa eneo la matini la ITSM ';

}

1;
