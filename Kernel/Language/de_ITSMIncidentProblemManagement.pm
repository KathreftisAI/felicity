# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMIncidentProblemManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMIncidentProblemManagement
    $Self->{Translation}->{'Add decision to ticket'} = 'Entscheidung an Ticket hängen';
    $Self->{Translation}->{'Decision Date'} = 'Entscheidung';
    $Self->{Translation}->{'Decision Result'} = 'Entscheidung';
    $Self->{Translation}->{'Due Date'} = 'Fälligkeitsdatum';
    $Self->{Translation}->{'Reason'} = 'Begründung';
    $Self->{Translation}->{'Recovery Start Time'} = 'Wiederherstellung Startzeit';
    $Self->{Translation}->{'Repair Start Time'} = 'Reparatur Startzeit';
    $Self->{Translation}->{'Review Required'} = 'Nachbearbeitung erforderlich';
    $Self->{Translation}->{'closed with workaround'} = 'provisorisch geschlossen';

    # Template: AgentTicketActionCommon
    $Self->{Translation}->{'Change Decision of Ticket'} = 'Die Entscheidung des Tickets ändern';
    $Self->{Translation}->{'Change ITSM fields of ticket'} = 'Ändern der ITSM Felder des Tickets';
    $Self->{Translation}->{'Service Incident State'} = 'Service Vorfallsstatus';

    # Template: AgentTicketEmail
    $Self->{Translation}->{'Link ticket'} = 'Ticket verknüpfen';

    # Template: AgentTicketOverviewPreview
    $Self->{Translation}->{'Criticality'} = 'Kritikalität';
    $Self->{Translation}->{'Impact'} = 'Auswirkung';

    # SysConfig
    $Self->{Translation}->{'Add a decision!'} = 'Hinzufügen einer Entscheidung!';
    $Self->{Translation}->{'Additional ITSM Fields'} = 'Zusätzliche ITSM Felder';
    $Self->{Translation}->{'Additional ITSM ticket fields.'} = 'Zusätzliche ITSM Ticketfelder.';
    $Self->{Translation}->{'Allows adding notes in the additional ITSM field screen of the agent interface.'} =
        'Erlaubt das Hinzufügen von Notizen in der zusätzlichen ITSM-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Allows adding notes in the decision screen of the agent interface.'} =
        'Erlaubt das Hinzufügen von Notizen im Entscheidungs-Bildschirm im Agenten-Interface.';
    $Self->{Translation}->{'Change the ITSM fields!'} = 'Ändern der ITSM-Felder!';
    $Self->{Translation}->{'Decision'} = 'Entscheidung';
    $Self->{Translation}->{'Defines if a ticket lock is required in the additional ITSM field screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.';
    $Self->{Translation}->{'Defines if a ticket lock is required in the decision screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.';
    $Self->{Translation}->{'Defines if the service incident state should be shown during service selection in the agent interface.'} =
        'Bestimmt, ob der Service Incident Status während der Service-Auswahl im Agenten-Interface angezeigt werden soll.';
    $Self->{Translation}->{'Defines the default body of a note in the additional ITSM field screen of the agent interface.'} =
        'Definiert den Standard-Inhalt einer Notiz in der zusätzliche ITSM Felder-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Defines the default body of a note in the decision screen of the agent interface.'} =
        'Definiert den Standard-Inhalt einer Notiz in der Entscheidungs-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        'Bestimmt den Folgestatus für Tickets, für die über die zusätzlichen ITSM Felder im Agenten-Interface eine Notiz hinzugefügt wurde.';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        'Bestimmt den Folgestatus für Tickets, für die in der Entscheiduns-Oberfläche im Agenten-Interface eine Notiz hinzugefügt wurde.';
    $Self->{Translation}->{'Defines the default subject of a note in the additional ITSM field screen of the agent interface.'} =
        'Definiert den Standard-Betreff einer Notiz in der zusätzliche ITSM Felder-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Defines the default subject of a note in the decision screen of the agent interface.'} =
        'Definiert den Standard-Betreff einer Notiz in der Entscheidungs-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Defines the default ticket priority in the additional ITSM field screen of the agent interface.'} =
        'Definiert die Standard-Priorität in der zusätzliche ITSM Felder-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Defines the default ticket priority in the decision screen of the agent interface.'} =
        'Definiert die Standard-Priorität in der Entscheidungs-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Defines the default type of the note in the additional ITSM field screen of the agent interface.'} =
        'Definiert den Standard-Typ einer Notiz in der zusätzliche ITSM Felder-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Defines the default type of the note in the decision screen of the agent interface.'} =
        'Definiert den Standard-Typ einer Notiz in der Entscheidungs-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Defines the history comment for the additional ITSM field screen action, which gets used for ticket history.'} =
        'Steuert den Historien-Kommentar für die Aktionen in der Oberfläche zusätzliche ITSM-Felder im Agentenbereich.';
    $Self->{Translation}->{'Defines the history comment for the decision screen action, which gets used for ticket history.'} =
        'Steuert den Historien-Kommentar für die Entscheidungs-Aktion im Agentenbereich.';
    $Self->{Translation}->{'Defines the history type for the additional ITSM field screen action, which gets used for ticket history.'} =
        '';
    $Self->{Translation}->{'Defines the history type for the decision screen action, which gets used for ticket history.'} =
        '';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the additional ITSM field screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the decision screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket first level solution rate.'} =
        '';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket solution.'} =
        '';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the additional ITSM field screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the decision screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the service in the additional ITSM field screen of the agent interface (Ticket::Service needs to be activated).'} =
        'Setzt den Service in der zusätzliche ITSM-Felder-Oberfläche für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).';
    $Self->{Translation}->{'Sets the service in the decision screen of the agent interface (Ticket::Service needs to be activated).'} =
        'Setzt den Service in der Entscheidungs-Oberfläche für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).';
    $Self->{Translation}->{'Sets the ticket owner in the additional ITSM field screen of the agent interface.'} =
        'Setzt den Ticket-Besitzer in der zusätzliche ITSM Felder-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Sets the ticket owner in the decision screen of the agent interface.'} =
        'Setzt den Besitzer in der Entscheidungs-Oberfläche für Tickets im Agentenbereich.';
    $Self->{Translation}->{'Sets the ticket responsible in the additional ITSM field screen of the agent interface.'} =
        'Setzt den Ticket-Verantwortlichen in der zusätzliche ITSM Felder-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Sets the ticket responsible in the decision screen of the agent interface.'} =
        'Setzt den Ticket-Verantwortlichen in der Entscheidungs-Oberfläche für Tickets im Agentenbereich.';
    $Self->{Translation}->{'Sets the ticket type in the additional ITSM field screen of the agent interface (Ticket::Type needs to be activated).'} =
        'Setzt den Ticket-Typ in der zusätzliche ITSM-Felder-Oberfläche für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).';
    $Self->{Translation}->{'Sets the ticket type in the decision screen of the agent interface (Ticket::Type needs to be activated).'} =
        'Setzt den Ticket-Typ in der Entscheidungs-Oberfläche für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).';
    $Self->{Translation}->{'Shows a link in the menu to change the decision of a ticket in its zoom view of the agent interface.'} =
        'Zeigt in der Agenten-Oberfläche imTicket-Menü einen Link an um die Entscheidung an einem Ticket zu ändern';
    $Self->{Translation}->{'Shows a link in the menu to modify additional ITSM fields in the ticket zoom view of the agent interface.'} =
        'Zeigt einen Link in der Menu-Leiste in der Zoom-Ansicht im Agenten-Interface an, der es ermöglicht die zusätzlichen ITSM-Felder zu bearbeiten.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the additional ITSM field screen of the agent interface.'} =
        'Zeigt in der Oberfläche zusätzliche ITSM-Felder der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the decision screen of the agent interface.'} =
        'Zeigt in der Oberfläche Entscheidung der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the ticket priority options in the additional ITSM field screen of the agent interface.'} =
        'Zeigt die Ticket-Priorität in der zusätzliche ITSM-Felder-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Shows the ticket priority options in the decision screen of the agent interface.'} =
        'Zeigt die Ticket-Priorität in der Entscheidungs-Oberfläche im Agenten-Interface.';
    $Self->{Translation}->{'Shows the title fields in the additional ITSM field screen of the agent interface.'} =
        'Zeigt den Ticket-Titel in der zusätzliche ITSM-Felder-Oberfläche für Tickets im Agentenbereich.';
    $Self->{Translation}->{'Shows the title fields in the decision screen of the agent interface.'} =
        'Zeigt den Ticket-Titel in der Entscheidungs-Oberfläche für Tickets im Agentenbereich.';
    $Self->{Translation}->{'Ticket decision.'} = '';

}

1;
