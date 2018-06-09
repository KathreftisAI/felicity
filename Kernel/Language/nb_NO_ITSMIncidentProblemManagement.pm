# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nb_NO_ITSMIncidentProblemManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMIncidentProblemManagement
    $Self->{Translation}->{'Add decision to ticket'} = 'Legg til beslutning for sak';
    $Self->{Translation}->{'Decision Date'} = 'Beslutningsdato';
    $Self->{Translation}->{'Decision Result'} = 'Beslutningsresultat';
    $Self->{Translation}->{'Due Date'} = 'Forfallsdato';
    $Self->{Translation}->{'Reason'} = 'Begrunnelse';
    $Self->{Translation}->{'Recovery Start Time'} = 'Starttid for gjenoppretting';
    $Self->{Translation}->{'Repair Start Time'} = 'Starttid for reparasjon';
    $Self->{Translation}->{'Review Required'} = 'Evaluering kreves';
    $Self->{Translation}->{'closed with workaround'} = 'Lukket med midlertidig løsning';

    # Template: AgentTicketActionCommon
    $Self->{Translation}->{'Change Decision of Ticket'} = 'Endre sakens beslutning';
    $Self->{Translation}->{'Change ITSM fields of ticket'} = 'Endre sakens ITSM-felter';
    $Self->{Translation}->{'Service Incident State'} = '';

    # Template: AgentTicketEmail
    $Self->{Translation}->{'Link ticket'} = 'Koble sak';

    # Template: AgentTicketOverviewPreview
    $Self->{Translation}->{'Criticality'} = 'Kritikalitet';
    $Self->{Translation}->{'Impact'} = 'Omfang';

    # SysConfig
    $Self->{Translation}->{'Add a decision!'} = 'Legg til en beslutning!';
    $Self->{Translation}->{'Additional ITSM Fields'} = 'Ekstra ITSM-felt';
    $Self->{Translation}->{'Additional ITSM ticket fields.'} = '';
    $Self->{Translation}->{'Allows adding notes in the additional ITSM field screen of the agent interface.'} =
        'Tillater å legge til notiser i de ekstra ITSM-feltene i saksbehandlerdelen';
    $Self->{Translation}->{'Allows adding notes in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Change the ITSM fields!'} = 'Endre ITSM-feltene!';
    $Self->{Translation}->{'Decision'} = 'Beslutning';
    $Self->{Translation}->{'Defines if a ticket lock is required in the additional ITSM field screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        '';
    $Self->{Translation}->{'Defines if a ticket lock is required in the decision screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        '';
    $Self->{Translation}->{'Defines if the service incident state should be shown during service selection in the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default body of a note in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default body of a note in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default subject of a note in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default subject of a note in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default ticket priority in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default ticket priority in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default type of the note in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default type of the note in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the history comment for the additional ITSM field screen action, which gets used for ticket history.'} =
        '';
    $Self->{Translation}->{'Defines the history comment for the decision screen action, which gets used for ticket history.'} =
        '';
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
        '';
    $Self->{Translation}->{'Sets the service in the decision screen of the agent interface (Ticket::Service needs to be activated).'} =
        '';
    $Self->{Translation}->{'Sets the ticket owner in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the ticket owner in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the ticket responsible in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the ticket responsible in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the ticket type in the additional ITSM field screen of the agent interface (Ticket::Type needs to be activated).'} =
        '';
    $Self->{Translation}->{'Sets the ticket type in the decision screen of the agent interface (Ticket::Type needs to be activated).'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to change the decision of a ticket in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to modify additional ITSM fields in the ticket zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the ticket priority options in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the ticket priority options in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the title fields in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the title fields in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Ticket decision.'} = '';

}

1;
