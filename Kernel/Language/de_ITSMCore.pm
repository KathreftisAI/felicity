# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMCore;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMCore
    $Self->{Translation}->{'Alternative to'} = 'Alternativ zu';
    $Self->{Translation}->{'Availability'} = 'Verfügbarkeit';
    $Self->{Translation}->{'Back End'} = 'Backend';
    $Self->{Translation}->{'Connected to'} = 'Verbunden mit';
    $Self->{Translation}->{'Current State'} = 'Aktueller Status';
    $Self->{Translation}->{'Demonstration'} = 'Demonstration';
    $Self->{Translation}->{'Depends on'} = 'Hängt ab von';
    $Self->{Translation}->{'End User Service'} = 'Anwender-Service';
    $Self->{Translation}->{'Errors'} = 'Fehler';
    $Self->{Translation}->{'Front End'} = 'Frontend';
    $Self->{Translation}->{'IT Management'} = 'IT Management';
    $Self->{Translation}->{'IT Operational'} = 'IT Betrieb';
    $Self->{Translation}->{'Impact'} = 'Auswirkung';
    $Self->{Translation}->{'Incident State'} = 'Vorfallsstatus';
    $Self->{Translation}->{'Includes'} = 'Beinhaltet';
    $Self->{Translation}->{'Other'} = 'Sonstiges';
    $Self->{Translation}->{'Part of'} = 'Teil von';
    $Self->{Translation}->{'Project'} = 'Projekt';
    $Self->{Translation}->{'Recovery Time'} = 'Wiederherstellungszeit';
    $Self->{Translation}->{'Relevant to'} = 'Relevant für';
    $Self->{Translation}->{'Reporting'} = 'Reporting';
    $Self->{Translation}->{'Required for'} = 'Benötigt für';
    $Self->{Translation}->{'Resolution Rate'} = 'Lösungszeit';
    $Self->{Translation}->{'Response Time'} = 'Reaktionszeit';
    $Self->{Translation}->{'SLA Overview'} = 'SLA-Übersicht';
    $Self->{Translation}->{'Service Overview'} = 'Dienstübersicht';
    $Self->{Translation}->{'Service-Area'} = 'Service-Bereich';
    $Self->{Translation}->{'Training'} = 'Training';
    $Self->{Translation}->{'Transactions'} = 'Transaktionen';
    $Self->{Translation}->{'Underpinning Contract'} = 'Underpinning Contract';
    $Self->{Translation}->{'allocation'} = 'zuordnen';

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'Kritikalität <-> Auswirkung <-> Priorität';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality <-> Impact.'} =
        'Verwaltung der Priorität aus der Kombination von Kritikalität <-> Impact.';
    $Self->{Translation}->{'Priority allocation'} = 'Priorität zuordnen';

    # Template: AdminSLA
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'Mindestzeit zwischen Incidents';

    # Template: AdminService
    $Self->{Translation}->{'Criticality'} = 'Kritikalität';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = 'SLA-Informationen';
    $Self->{Translation}->{'Last changed'} = 'Zuletzt geändert';
    $Self->{Translation}->{'Last changed by'} = 'Zuletzt geändert von';
    $Self->{Translation}->{'Associated Services'} = 'Zugehörige Services';

    # Template: AgentITSMServiceZoom
    $Self->{Translation}->{'Service Information'} = 'Service-Informationen';
    $Self->{Translation}->{'Current incident state'} = 'Aktueller Vorfallstatus';
    $Self->{Translation}->{'Associated SLAs'} = 'Zugehörige SLAs';

    # Perl Module: Kernel/Modules/AgentITSMServicePrint.pm
    $Self->{Translation}->{'Current Incident State'} = 'Aktueller Vorfallsstatus';

    # SysConfig
    $Self->{Translation}->{'Both'} = 'Beide';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked Services widget (LinkObject::ViewMode = "complex"). Note: Only Service attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the AdminITSMCIPAllocate configuration in the admin area.'} =
        'Frontendmodul-Registration der AdminITSMCIPAllocate Konfiguration im Admin-Bereich.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} =
        'Frontendmodul-Registration des AgentITSMSLA-Objekts im Agent-Interface.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} =
        'Frontendmodul-Registration des AgentITSMSLAPrint-Objekts im Agent-Interface.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} =
        'Frontendmodul-Registration des AgentITSMSLAZoom-Objekts im Agent-Interface.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMService object in the agent interface.'} =
        'Frontendmodul-Registration des AgentITSMService-Objekts im Agent-Interface.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} =
        'Frontendmodul-Registration des AgentITSMServicePrint-Objekts im Agent-Interface.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} =
        'Frontendmodul-Registration des AgentITSMServiceZoom-Objekts im Agent-Interface.';
    $Self->{Translation}->{'ITSM SLA Overview.'} = 'ITSM SLA-Übersicht.';
    $Self->{Translation}->{'ITSM Service Overview.'} = 'ITSM-Dienstübersicht.';
    $Self->{Translation}->{'Incident'} = 'Vorfall';
    $Self->{Translation}->{'Incident State Type'} = '';
    $Self->{Translation}->{'Incident State Type.'} = '';
    $Self->{Translation}->{'Manage priority matrix.'} = 'Prioritäts-Matrix verwalten';
    $Self->{Translation}->{'Module to show back link in service menu.'} = 'Über dieses Modul wird der Zurück-Link in der Linkleiste der Service-Ansicht angezeigt.';
    $Self->{Translation}->{'Module to show back link in sla menu.'} = 'Über dieses Modul wird der Zurück-Link in der Linkleiste der SLA-Ansicht angezeigt.';
    $Self->{Translation}->{'Module to show print link in service menu.'} = 'Über dieses Modul wird der Drucken-Link in der Linkleiste der Service-Ansicht angezeigt.';
    $Self->{Translation}->{'Module to show print link in sla menu.'} = 'Über dieses Modul wird der Drucken-Link in der Linkleiste der SLA-Ansicht angezeigt.';
    $Self->{Translation}->{'Module to show the link link in service menu.'} = 'Über dieses Modul wird der Link-Link in der Linkleiste der Service-Ansicht angezeigt.';
    $Self->{Translation}->{'Operational'} = 'Operativ';
    $Self->{Translation}->{'Parameters for the incident states in the preference view.'} = 'Parameter fuer den Vorfallsstatus in der Ansicht fuer die Einstellungen.';
    $Self->{Translation}->{'SLA Print.'} = 'SLA-Druck.';
    $Self->{Translation}->{'SLA Zoom.'} = '';
    $Self->{Translation}->{'Service Print.'} = '';
    $Self->{Translation}->{'Service Zoom.'} = '';
    $Self->{Translation}->{'Set the type and direction of links to be used to calculate the incident state. The key is the name of the link type (as defined in LinkObject::Type), and the value is the direction of the IncidentLinkType that should be followed to calculate the incident state. For example if the IncidentLinkType is set to \'DependsOn\', and the Direction is \'Source\', only \'Depends on\' links will be followed (and not the opposite link \'Required for\') to calculate the incident state. You can add more link types ad directions as you like, e.g. \'Includes\' with the direction \'Target\'. All link types defined in the sysconfig options LinkObject::Type are possible and the direction can be \'Source\', \'Target\', or \'Both\'. IMPORTANT: AFTER YOU MAKE CHANGES TO THIS SYSCONFIG OPTION YOU NEED TO RUN THE SCRIPT bin/otrs.ITSMConfigItemIncidentStateRecalculate.pl SO THAT ALL INCIDENT STATES WILL BE RECALCULATED BASED ON THE NEW SETTINGS!'} =
        'Setzen des Typs und der Richtung der verwendeten Links, um den Incident-Status zu berechnen. Der Schlüssel ist der Name des Link-Typs (wie in LinkObject::Type definiert), und der Wert ist die Richtung des IncidentLinkType, die befolgt werden soll, um den Incident-Status zu berechnen. Zum Beispiel, wenn der IncidentLinkType auf \'DependsOn\' und als Richtung \'Quelle\' gesetzt ist, wird nur \'Depends\' Links gefolgt (und nicht dem Gegenteil \'Benötigt für\') um den IncidentState zu berechnen. Sie können soviele Link-Typen und Richtungen hinzufügen wie Sie möchten, z.B.: \'Enthält\' mit der Richtung \'Target\'. Alle in der Sysconfig unter Linkobject::Type definierten Verknüpfungsarten sind möglich sind und die Richtung kann \'Quelle\', \'Ziel\' oder \'Beide\' sein. WICHTIG: Nachdem Sie Änderungen an dieser Sysconfig-Einstellung gemacht haben, führen Sie das Skript bin/otrs.ITSMConfigItemIncidentStateRecalculate.pl SO aus, damit alle Incident-Status anhand der neuen Einstellungen berechnet werden.';
    $Self->{Translation}->{'This setting defines that a \'ITSMChange\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'ITSMChange\'-Objekt mit dem Linktyp \'Normal\' mit \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'Normal\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'ParentChild\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'RelevantTo\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'AlternativeTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'AlternativeTo\' mit \'Service\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'DependsOn\' mit \'Service\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'RelevantTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'RelevantTo\' mit \'Service\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'AlternativeTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'AlternativeTo\' mit \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'DependsOn\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'DependsOn\' mit \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'RelevantTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'RelevantTo\' mit \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'AlternativeTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'AlternativeTo\' mit anderen \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'ConnectedTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'ConnectedTo\' mit anderen \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'DependsOn\' mit anderen \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'Includes\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'Includes\' mit anderen \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'RelevantTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'RelevantTo\' mit anderen \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        'Definiert, dass ein \'ITSMWorkOrder\'-Objekt mit dem Linktyp \'DependsOn\' mit \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'ITSMWorkOrder\'-Objekt mit dem Linktyp \'Normal\' mit \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        'Definiert, dass ein \'ITSMWorkOrder\'-Objekt mit dem Linktyp \'DependsOn\' mit \'Service\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'ITSMWorkOrder\'-Objekt mit dem Linktyp \'Normal\' mit \'Service\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'ITSMWorkOrder\'-Objekt mit dem Linktyp \'Normal\' mit \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'Service\'-Objekt mit dem Linktyp \'Normal\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Definiert, dass ein \'Service\'-Objekt mit dem Linktyp \'ParentChild\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        'Definiert, dass ein \'Service\'-Objekt mit dem Linktyp \'RelevantTo\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines the link type \'AlternativeTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Definiert den Linktyp \'AlternativeTo\'. Wird als SourceName und TargetName der gleiche Inhalt angegeben, entsteht ein ungerichteter Linktyp. Wird als SourceName und TargetName verschiedener Inhalt angegeben, entsteht ein gerichteter Linktyp.';
    $Self->{Translation}->{'This setting defines the link type \'ConnectedTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Definiert den Linktyp \'ConnectedTo\'. Wird als SourceName und TargetName der gleiche Inhalt angegeben, entsteht ein ungerichteter Linktyp. Wird als SourceName und TargetName verschiedener Inhalt angegeben, entsteht ein gerichteter Linktyp.';
    $Self->{Translation}->{'This setting defines the link type \'DependsOn\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Definiert den Linktyp \'DependsOn\'. Wird als SourceName und TargetName der gleiche Inhalt angegeben, entsteht ein ungerichteter Linktyp. Wird als SourceName und TargetName verschiedener Inhalt angegeben, entsteht ein gerichteter Linktyp.';
    $Self->{Translation}->{'This setting defines the link type \'Includes\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Definiert den Linktyp \'Includes\'. Wird als SourceName und TargetName der gleiche Inhalt angegeben, entsteht ein ungerichteter Linktyp. Wird als SourceName und TargetName verschiedener Inhalt angegeben, entsteht ein gerichteter Linktyp.';
    $Self->{Translation}->{'This setting defines the link type \'RelevantTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Definiert den Linktyp \'RelevantTo\'. Wird als SourceName und TargetName der gleiche Inhalt angegeben, entsteht ein ungerichteter Linktyp. Wird als SourceName und TargetName verschiedener Inhalt angegeben, entsteht ein gerichteter Linktyp.';
    $Self->{Translation}->{'Width of ITSM textareas.'} = 'Anzahl der Zeichen pro Zeile in ITSM-TextAreas.';

}

1;
