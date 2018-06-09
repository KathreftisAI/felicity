# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_ITSMIncidentProblemManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMIncidentProblemManagement
    $Self->{Translation}->{'Add decision to ticket'} = 'Añadir decisión al ticket';
    $Self->{Translation}->{'Decision Date'} = 'Fecha de Decisión';
    $Self->{Translation}->{'Decision Result'} = 'Resultado de Decisión';
    $Self->{Translation}->{'Due Date'} = 'Fecha de vencimiento';
    $Self->{Translation}->{'Reason'} = 'Motivo';
    $Self->{Translation}->{'Recovery Start Time'} = 'Fecha Inicial de Recuperación';
    $Self->{Translation}->{'Repair Start Time'} = 'Fecha Inicial de Reparación';
    $Self->{Translation}->{'Review Required'} = 'Revisión Requerida';
    $Self->{Translation}->{'closed with workaround'} = 'Cerrado con solución provisional';

    # Template: AgentTicketActionCommon
    $Self->{Translation}->{'Change Decision of Ticket'} = 'Cambiar Decisión del Ticket';
    $Self->{Translation}->{'Change ITSM fields of ticket'} = 'Modificar campos ITSM del ticket';
    $Self->{Translation}->{'Service Incident State'} = 'Estado de Incidente del Servicio';

    # Template: AgentTicketEmail
    $Self->{Translation}->{'Link ticket'} = 'Vincular ticket';

    # Template: AgentTicketOverviewPreview
    $Self->{Translation}->{'Criticality'} = 'Urgencia';
    $Self->{Translation}->{'Impact'} = 'Impacto';

    # SysConfig
    $Self->{Translation}->{'Add a decision!'} = '¡Agregue una decisión!';
    $Self->{Translation}->{'Additional ITSM Fields'} = 'Campos ITSM Adicionales';
    $Self->{Translation}->{'Additional ITSM ticket fields.'} = 'Campos adicionales del ticket en ITSM.';
    $Self->{Translation}->{'Allows adding notes in the additional ITSM field screen of the agent interface.'} =
        'Permite agregar notas en la ventana de campos ITSM adicionales de la interfaz del agente.';
    $Self->{Translation}->{'Allows adding notes in the decision screen of the agent interface.'} =
        'Permite agregar notas en la ventana de decisión de la interfaz del agente.';
    $Self->{Translation}->{'Change the ITSM fields!'} = 'Modificar los campos ITSM';
    $Self->{Translation}->{'Decision'} = 'Decisión';
    $Self->{Translation}->{'Defines if a ticket lock is required in the additional ITSM field screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Determina si es necesario que el ticket esté bloqueado para acceder a la ventana de campos ITSM adicionales de la interfaz del agente (si el ticket no está bloqueado aún, se bloquea y el agente actual se convertirá automáticamente en su propietario).';
    $Self->{Translation}->{'Defines if a ticket lock is required in the decision screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Determina si es necesario que el ticket esté bloqueado para acceder a la ventana de decisión de la interfaz del agente (si el ticket no está bloqueado aún, se bloquea y el agente actual se convertirá automáticamente en su propietario).';
    $Self->{Translation}->{'Defines if the service incident state should be shown during service selection in the agent interface.'} =
        'Define si el estado de la incidencia en el servicio debe ser mostrado durante la selección del servicio en la interfaz del agente.';
    $Self->{Translation}->{'Defines the default body of a note in the additional ITSM field screen of the agent interface.'} =
        'Define el texto por default de una nota, en la ventana de campos ITSM adicionales de la interfaz del agente.';
    $Self->{Translation}->{'Defines the default body of a note in the decision screen of the agent interface.'} =
        'Define el texto por default de una nota, en la ventana de decisión de la interfaz del agente.';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        'Define el siguiente estado de un ticket por default, luego de agregar una nota en la ventana de campos ITSM adicionales de la interfaz del agente.';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        'Define el siguiente estado de un ticket por default, luego de agregar una nota en la ventana de decisión de la interfaz del agente.';
    $Self->{Translation}->{'Defines the default subject of a note in the additional ITSM field screen of the agent interface.'} =
        'Define el asunto por default de una nota, en la ventana de campos ITSM adicionales de la interfaz del agente.';
    $Self->{Translation}->{'Defines the default subject of a note in the decision screen of the agent interface.'} =
        'Define el asunto por default de una nota, en la ventana de decisión de la interfaz del agente.';
    $Self->{Translation}->{'Defines the default ticket priority in the additional ITSM field screen of the agent interface.'} =
        'Define la prioridad default del ticket en la ventana de campos ITSM adicionales de la interfaz del agente.';
    $Self->{Translation}->{'Defines the default ticket priority in the decision screen of the agent interface.'} =
        'Define la prioridad default del ticket en la ventana de decisión de la interfaz del agente.';
    $Self->{Translation}->{'Defines the default type of the note in the additional ITSM field screen of the agent interface.'} =
        'Define el tipo default de las notas en la ventana de campos ITSM adicionales de la interfaz del agente.';
    $Self->{Translation}->{'Defines the default type of the note in the decision screen of the agent interface.'} =
        'Define el tipo default de las notas en la ventana de decisión de la interfaz del agente.';
    $Self->{Translation}->{'Defines the history comment for the additional ITSM field screen action, which gets used for ticket history.'} =
        'Define el comentario del historial para la acción de la ventana de campos ITSM adicionales, misma que es usada por el historial del ticket.';
    $Self->{Translation}->{'Defines the history comment for the decision screen action, which gets used for ticket history.'} =
        'Define el comentario del historial, para la acción de la ventana de decisión, misma que es usada por el historial del ticket.';
    $Self->{Translation}->{'Defines the history type for the additional ITSM field screen action, which gets used for ticket history.'} =
        'Define el tipo de historial para la acción de la ventana de campos ITSM adicionales, misma que es usada por el historial del ticket.';
    $Self->{Translation}->{'Defines the history type for the decision screen action, which gets used for ticket history.'} =
        'Define el tipo de historial, para la acción de la ventana de decisión, misma que es usada por el historial del ticket.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        'Define el siguiente estado de un ticket, luego de agregar una nota en la ventana de campos ITSM adicionales de la interfaz del agente.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        'Define el siguiente estado de un ticket, luego de agregar una nota en la ventana de decisión de la interfaz del agente.';
    $Self->{Translation}->{'Dynamic fields shown in the additional ITSM field screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Campos dinámicos mostrados en pantalla de Campos ITSM adicionales en la interfaz de Agente. Configuración posible: 0 = Deshabilitado, 1 = Habilitado, 2 = Habilitado y requerido';
    $Self->{Translation}->{'Dynamic fields shown in the decision screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Campos dinámicos mostrados en pantalla de Desición en la interfaz de Agente. Configuración posible: 0 = Deshabilitado, 1 = Habilitado, 2 = Habilitado y requerido';
    $Self->{Translation}->{'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Campos dinámicos mostrados en pantalla de Búsqueda de Tickets en la interfaz de Agente. Configuración posible: 0 = Deshabilitado, 1 = Habilitado';
    $Self->{Translation}->{'Dynamic fields shown in the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Campos dinámicos mostrados en pantalla de Resumen del Ticket en la interfaz de Agente. Configuración posible: 0 = Deshabilitado, 1 = Habilitado.';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket first level solution rate.'} =
        'Habilita, en el módulo de estadísticas, la generación de estadísticas acerca del tasa promedio de solución de primer nivel de tickets ITSM.';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket solution.'} =
        'Habilita, en el módulo de estadísticas, la generación de estadísticas acerca del promedio de solución de tickets ITSM.';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the additional ITSM field screen of the agent interface.'} =
        'Si una nota es agregada por un agente, define el estado de un ticket en la ventana de campos ITSM adicionales, en la interfaz del agente.';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the decision screen of the agent interface.'} =
        'Si una nota es agregada por un agente, define el estado de un ticket en la ventana de decisión, en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the additional ITSM field screen in the agent interface.'} =
        'Permisos necesarios para usar la ventana de campos ITSM adicionales, en la interfaz del agente.';
    $Self->{Translation}->{'Required permissions to use the decision screen in the agent interface.'} =
        'Permisos necesarios para usar la ventana de decisión, en la interfaz del agente.';
    $Self->{Translation}->{'Sets the service in the additional ITSM field screen of the agent interface (Ticket::Service needs to be activated).'} =
        'Permite definir el servicio en la ventana de campos ITSM adicionales en la interfaz del agente (Ticket::Service tiene que estar habilitado).';
    $Self->{Translation}->{'Sets the service in the decision screen of the agent interface (Ticket::Service needs to be activated).'} =
        'Permite definir el servicio en la ventana de decisión en la interfaz del agente (Ticket::Service tiene que estar habilitado).';
    $Self->{Translation}->{'Sets the ticket owner in the additional ITSM field screen of the agent interface.'} =
        'Permite definir el propietario del ticket en la ventana de campos ITSM adicionales, en la interfaz del agente.';
    $Self->{Translation}->{'Sets the ticket owner in the decision screen of the agent interface.'} =
        'Permite definir el propietario del ticket en la ventana de decisión, en la interfaz del agente.';
    $Self->{Translation}->{'Sets the ticket responsible in the additional ITSM field screen of the agent interface.'} =
        'Permite definir el responsable del ticket en la ventana de campos ITSM adicionales, en la interfaz del agente.';
    $Self->{Translation}->{'Sets the ticket responsible in the decision screen of the agent interface.'} =
        'Permite definir el responsable del ticket en la ventana de decisión, en la interfaz del agente.';
    $Self->{Translation}->{'Sets the ticket type in the additional ITSM field screen of the agent interface (Ticket::Type needs to be activated).'} =
        'Permite definir el tipo de ticket en la ventana de campos ITSM adicionales en la interfaz del agente (Ticket::Type tiene que estar habilitado).';
    $Self->{Translation}->{'Sets the ticket type in the decision screen of the agent interface (Ticket::Type needs to be activated).'} =
        'Permite definir el tipo de ticket en la ventana de decisión en la interfaz del agente (Ticket::Type tiene que estar habilitado).';
    $Self->{Translation}->{'Shows a link in the menu to change the decision of a ticket in its zoom view of the agent interface.'} =
        'Muesta un vínculo en el menú para modificar la decisión de un ticket, en el detalle de dicho ticket, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to modify additional ITSM fields in the ticket zoom view of the agent interface.'} =
        'Muesta un vínculo en el menú para modificar campos ITSM adicionales, en el detalle del ticket correspondiente, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the additional ITSM field screen of the agent interface.'} =
        'Muesta una lista de todos los agentes involucrados en este ticket, en la ventana de campos ITSM adicionales de la interfaz del agente.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the decision screen of the agent interface.'} =
        'Muesta una lista de todos los agentes involucrados en este ticket, en la ventana de decisión de la interfaz del agente.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the additional ITSM field screen of the agent interface.'} =
        'Muestra una lista de todos los agentes posibles (aquellos con permisos para agregar notas en la fila o ticket), para determinar quién/quiénes deben ser informados acerca de ésta nota, en la ventana de campos ITSM adicionales de la interfaz del agente.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the decision screen of the agent interface.'} =
        'Muestra una lista de todos los agentes posibles (aquellos con permisos para agregar notas en la fila o ticket), para determinar quién/quiénes deben ser informados acerca de ésta nota, en la ventana de decisión de la interfaz del agente.';
    $Self->{Translation}->{'Shows the ticket priority options in the additional ITSM field screen of the agent interface.'} =
        'Muestra las opciones de prioridad del ticket en la ventana de campos ITSM adicionales de la interfaz del agente.';
    $Self->{Translation}->{'Shows the ticket priority options in the decision screen of the agent interface.'} =
        'Muestra las opciones de prioridad del ticket en la ventana de decisión de la interfaz del agente.';
    $Self->{Translation}->{'Shows the title fields in the additional ITSM field screen of the agent interface.'} =
        'Muestra los campos del título en la ventana de campos ITSM adicionales de la interfaz del agente.';
    $Self->{Translation}->{'Shows the title fields in the decision screen of the agent interface.'} =
        'Muestra los campos del título en la ventana de decisión de la interfaz del agente.';
    $Self->{Translation}->{'Ticket decision.'} = 'Decisión del Ticket.';

}

1;
