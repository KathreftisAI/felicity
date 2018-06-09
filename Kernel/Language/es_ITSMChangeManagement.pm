# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::es_ITSMChangeManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMChangeManagement
    $Self->{Translation}->{'ITSMChange'} = 'Cambio';
    $Self->{Translation}->{'ITSMChanges'} = 'Cambios';
    $Self->{Translation}->{'ITSM Changes'} = 'Cambios';
    $Self->{Translation}->{'workorder'} = 'orden de trabajo';
    $Self->{Translation}->{'A change must have a title!'} = '¡Un cambio debe tener un título!';
    $Self->{Translation}->{'A condition must have a name!'} = '¡Una condición debe tener un nombre!';
    $Self->{Translation}->{'A template must have a name!'} = '¡Una plantilla debe tener un nombre!';
    $Self->{Translation}->{'A workorder must have a title!'} = '¡Cada orden de trabajo debe tener un título!';
    $Self->{Translation}->{'Add CAB Template'} = 'Agregar Plantilla de Comité de Cambios';
    $Self->{Translation}->{'Add Workorder'} = 'Agregar Orden de Trabajo';
    $Self->{Translation}->{'Add a workorder to the change'} = 'Agregar una orden de trabajo al cambio';
    $Self->{Translation}->{'Add new condition and action pair'} = 'Agregar par condición-acción nuevo';
    $Self->{Translation}->{'Agent interface module to show the ChangeManager overview icon.'} =
        'Módulo de la interfaz del agente que muestra el ícono de resumen de GestiónDeCambios.';
    $Self->{Translation}->{'Agent interface module to show the MyCAB overview icon.'} = 'Módulo de la interfaz del agente que muestra el ícono de resumen de MisCAB.';
    $Self->{Translation}->{'Agent interface module to show the MyChanges overview icon.'} = 'Módulo de la interfaz del agente que muestra el ícono de resumen de MisCambios.';
    $Self->{Translation}->{'Agent interface module to show the MyWorkOrders overview icon.'} =
        'Módulo de la interfaz del agente que muestra el ícono de resumen de MisÓrdenesDeTrabajo.';
    $Self->{Translation}->{'CABAgents'} = 'Agentes del CAB';
    $Self->{Translation}->{'CABCustomers'} = 'Clientes del CAB';
    $Self->{Translation}->{'Change Overview'} = 'Resumen de Cambios';
    $Self->{Translation}->{'Change Schedule'} = 'Cambiar Programación';
    $Self->{Translation}->{'Change involved persons of the change'} = 'Cambiar las personas involucradas en el cambio';
    $Self->{Translation}->{'ChangeHistory::ActionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ActionAddID'} = 'Nueva Acción (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ActionDelete'} = 'Acción (ID=%s) eliminada';
    $Self->{Translation}->{'ChangeHistory::ActionDeleteAll'} = 'Todas las Acciones de la Condición (ID=%s) eliminadas';
    $Self->{Translation}->{'ChangeHistory::ActionExecute'} = 'Acción (ID=%s) ejecutada: %s';
    $Self->{Translation}->{'ChangeHistory::ActionUpdate'} = '%s (ID de la Acción=%s): Nueva: %s <- Antigua: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeActualEndTimeReached'} = 'El Cambio (ID=%s) ha alcanzado su fecha de finalización real planeada.';
    $Self->{Translation}->{'ChangeHistory::ChangeActualStartTimeReached'} = 'El Cambio (ID=%s) ha alcanzado su fecha de inicio real planeada.';
    $Self->{Translation}->{'ChangeHistory::ChangeAdd'} = 'Cambio nuevo (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentAdd'} = 'Nuevo adjunto: %s ';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentDelete'} = 'Adjunto %s eliminado';
    $Self->{Translation}->{'ChangeHistory::ChangeCABDelete'} = 'Comité de cambios %s eliminado';
    $Self->{Translation}->{'ChangeHistory::ChangeCABUpdate'} = '%s: Nuevo: %s <- Antiguo: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkAdd'} = 'Vínculo a %s (ID=%s) agregado';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkDelete'} = 'Vínculo a %s (ID=%s) eliminado';
    $Self->{Translation}->{'ChangeHistory::ChangeNotificationSent'} = 'Notificación enviada a %s (Evento: %s)';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedEndTimeReached'} = 'El Cambio (ID=%s) ha alcanzado su fecha de finalización planeada.';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedStartTimeReached'} = 'El Cambio (ID=%s) ha alcanzado su fecha de inicio planeada.';
    $Self->{Translation}->{'ChangeHistory::ChangeRequestedTimeReached'} = 'El Cambio (ID=%s) ha alcanzado su fecha esperada de ocurrencia.';
    $Self->{Translation}->{'ChangeHistory::ChangeUpdate'} = '%s: Nuevo: %s <- Antiguo: %s';
    $Self->{Translation}->{'ChangeHistory::ConditionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ConditionAddID'} = 'Nueva Condición (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ConditionDelete'} = 'Codición (ID=%s) eliminada';
    $Self->{Translation}->{'ChangeHistory::ConditionDeleteAll'} = 'Todas las condiciones del cambio (ID=%s) eliminadas';
    $Self->{Translation}->{'ChangeHistory::ConditionUpdate'} = '%s (ID de la Condición=%s): Nuevo: %s <- Antiguo: %s';
    $Self->{Translation}->{'ChangeHistory::ExpressionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ExpressionAddID'} = 'Nueva Expresión (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ExpressionDelete'} = 'Expresión (ID=%s) eliminada';
    $Self->{Translation}->{'ChangeHistory::ExpressionDeleteAll'} = 'Todas las Expresiones de la Condición (ID=%s) eliminadas';
    $Self->{Translation}->{'ChangeHistory::ExpressionUpdate'} = '%s (ID de la Expresión=%s): Nueva: %s <- Antigua: %s';
    $Self->{Translation}->{'ChangeNumber'} = 'Número del Cambio';
    $Self->{Translation}->{'Condition Edit'} = 'Editar Condición';
    $Self->{Translation}->{'Create Change'} = 'Crear un Cambio';
    $Self->{Translation}->{'Create a change from this ticket!'} = '¡Crear un cambio a partir de este ticket!';
    $Self->{Translation}->{'Delete Workorder'} = 'Eliminar Orden de Trabajo';
    $Self->{Translation}->{'Edit the change'} = 'Editar el cambio';
    $Self->{Translation}->{'Edit the conditions of the change'} = 'Editar las condiciones del cambio';
    $Self->{Translation}->{'Edit the workorder'} = 'Editar la Orden de Trabajo';
    $Self->{Translation}->{'Expression'} = 'Expresión';
    $Self->{Translation}->{'Full-Text Search in Change and Workorder'} = 'Búsqueda de texto completo en un Cambio o una Orden de Trabajo';
    $Self->{Translation}->{'ITSMCondition'} = 'Condición';
    $Self->{Translation}->{'ITSMWorkOrder'} = 'Orden de Trabajo';
    $Self->{Translation}->{'Link another object to the change'} = 'Vincular un objeto nuevo al cambio';
    $Self->{Translation}->{'Link another object to the workorder'} = 'Vincular un objeto nuevo a la orden de trabajo';
    $Self->{Translation}->{'Move all workorders in time'} = 'Mover todas las ordenes de trabajo a tiempo';
    $Self->{Translation}->{'My CABs'} = 'Mis Comités de Cambio (CABs)';
    $Self->{Translation}->{'My Changes'} = 'Mis Cambios';
    $Self->{Translation}->{'My Workorders'} = 'Mis Órdenes de Trabajo';
    $Self->{Translation}->{'No XXX settings'} = 'No hay configuraciones \'%s\' ';
    $Self->{Translation}->{'PIR (Post Implementation Review)'} = 'Revisión Post Implementación (PIR)';
    $Self->{Translation}->{'PSA (Projected Service Availability)'} = 'Disponibilidad Proyectada del Servicio (PSA)';
    $Self->{Translation}->{'Please select first a catalog class!'} = '¡Por favor seleccione primero una clase de catálogo!';
    $Self->{Translation}->{'Print the change'} = 'Imprimir el cambio';
    $Self->{Translation}->{'Print the workorder'} = 'Imprimir la Orden de Trabajo';
    $Self->{Translation}->{'RequestedTime'} = 'Fecha Solicitada';
    $Self->{Translation}->{'Save Change CAB as Template'} = 'Guardar Change CAB como Plantilla';
    $Self->{Translation}->{'Save change as a template'} = 'Guardar el cambio como plantilla';
    $Self->{Translation}->{'Save workorder as a template'} = 'Guardar la orden de trabajo como plantilla';
    $Self->{Translation}->{'Search Changes'} = 'Buscar Cambios';
    $Self->{Translation}->{'Set the agent for the workorder'} = 'Asignar agente a la orden de trabajo';
    $Self->{Translation}->{'Take Workorder'} = 'Tomar Orden de Trabajo';
    $Self->{Translation}->{'Take the workorder'} = 'Tomar la Orden de Trabajo';
    $Self->{Translation}->{'Template Overview'} = 'Resumen de Plantillas';
    $Self->{Translation}->{'The planned end time is invalid!'} = '¡La fecha de finalización planeada no es válida!';
    $Self->{Translation}->{'The planned start time is invalid!'} = '¡La fecha de inicio planeada no es válida!';
    $Self->{Translation}->{'The planned time is invalid!'} = '¡El periodo de tiempo planeado es inválido!';
    $Self->{Translation}->{'The requested time is invalid!'} = '¡La fecha solicitada no es válida!';
    $Self->{Translation}->{'New (from template)'} = 'Nuevo (desde plantilla)';
    $Self->{Translation}->{'Add from template'} = 'Agregar desde plantilla';
    $Self->{Translation}->{'Add Workorder (from template)'} = 'Agregar Orden de Trabajo (desde plantilla)';
    $Self->{Translation}->{'Add a workorder (from template) to the change'} = 'Agregar Orden de Trabajo (desde plantilla) al Cambio';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReached'} = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de finalización real.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReachedWithWorkOrderID'} =
        'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de finalización real.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReached'} = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de inicio real.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReachedWithWorkOrderID'} =
        'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de inicio real.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAdd'} = 'Nueva Orden de Trabajo (ID=%s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAddWithWorkOrderID'} = 'Nueva Orden de Trabajo (ID=%s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAdd'} = 'Nuevo adjunto: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAddWithWorkOrderID'} = '(ID=%s) Nuevo adjunto para Orden de Trabajo: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDelete'} = 'Adjunto %s eliminado';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDeleteWithWorkOrderID'} = '(ID=%s) Borrar adjunto de Orden de Trabajo: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAdd'} = '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAddWithWorkOrderID'} =
        '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDelete'} = '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDeleteWithWorkOrderID'} =
        '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDelete'} = 'Orden de Trabajo (ID=%s) eliminada';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDeleteWithWorkOrderID'} = 'Orden de Trabajo (ID=%s) eliminada';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAdd'} = 'Vínculo a %s (ID=%s) agregado';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAddWithWorkOrderID'} = '(ID=%s) Vínculo a %s (ID=%s) adicionado';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDelete'} = 'Vínculo a %s (ID=%s) eliminada';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDeleteWithWorkOrderID'} = '(ID=%s) Vínculo a %s (ID=%s) eliminado';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSent'} = 'Envió de notificación';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSentWithWorkOrderID'} = 'Se ha enviado la notificación de orden de trabajo con ID de la orden de trabajo.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReached'} = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de finalización planeada.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReachedWithWorkOrderID'} =
        'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de finalización planeada.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReached'} = 'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de inicio planeada.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReachedWithWorkOrderID'} =
        'La Orden de Trabajo (ID=%s) ha alcanzado su fecha de inicio planeada.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdate'} = '%s: Nueva: %s <- Antigua: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdateWithWorkOrderID'} = '(ID=%s) %s: Nueva: %s <- Antigua: %s';
    $Self->{Translation}->{'WorkOrderNumber'} = 'Número de la Orden de Trabajo';
    $Self->{Translation}->{'accepted'} = 'aceptada';
    $Self->{Translation}->{'any'} = 'cualquiera';
    $Self->{Translation}->{'approval'} = 'aprobación';
    $Self->{Translation}->{'approved'} = 'aprobado';
    $Self->{Translation}->{'backout'} = 'plan de vuelta atrás';
    $Self->{Translation}->{'begins with'} = 'comienza con';
    $Self->{Translation}->{'canceled'} = 'cancelada';
    $Self->{Translation}->{'contains'} = 'contiene';
    $Self->{Translation}->{'created'} = 'creado';
    $Self->{Translation}->{'decision'} = 'decisión';
    $Self->{Translation}->{'ends with'} = 'termina con';
    $Self->{Translation}->{'failed'} = 'fallido';
    $Self->{Translation}->{'in progress'} = 'en progreso';
    $Self->{Translation}->{'is'} = 'es';
    $Self->{Translation}->{'is after'} = 'está después';
    $Self->{Translation}->{'is before'} = 'está antes';
    $Self->{Translation}->{'is empty'} = 'está vacío(a)';
    $Self->{Translation}->{'is greater than'} = 'es mayor que';
    $Self->{Translation}->{'is less than'} = 'es menor que';
    $Self->{Translation}->{'is not'} = 'no es';
    $Self->{Translation}->{'is not empty'} = 'no está vacío(a)';
    $Self->{Translation}->{'not contains'} = 'no contiene';
    $Self->{Translation}->{'pending approval'} = 'aprobación pendiente';
    $Self->{Translation}->{'pending pir'} = 'revisión post-implementación pendiente';
    $Self->{Translation}->{'pir'} = 'revisión post-implementación';
    $Self->{Translation}->{'ready'} = 'lista';
    $Self->{Translation}->{'rejected'} = 'rechazado';
    $Self->{Translation}->{'requested'} = 'solicitado';
    $Self->{Translation}->{'retracted'} = 'devuelto';
    $Self->{Translation}->{'set'} = 'configurada';
    $Self->{Translation}->{'successful'} = 'exitoso';

    # Template: AdminITSMChangeCIPAllocate
    $Self->{Translation}->{'Category <-> Impact <-> Priority'} = 'Categoría <-> Impacto <-> Prioridad';
    $Self->{Translation}->{'Manage the priority result of combinating Category <-> Impact.'} =
        'Administrar la prioridad resultante al combinar Categoría <-> Impacto.';
    $Self->{Translation}->{'Priority allocation'} = 'Asignar prioridad';

    # Template: AdminITSMChangeNotification
    $Self->{Translation}->{'ITSM ChangeManagement Notification Management'} = 'Gestión de Notificaciones de Cambios ITSM';
    $Self->{Translation}->{'Add Notification Rule'} = 'Agregar Regla de Notificación';
    $Self->{Translation}->{'Rule'} = 'Regla';
    $Self->{Translation}->{'A notification should have a name!'} = '¡Las Notificaciones deben tener un nombre!';
    $Self->{Translation}->{'Name is required.'} = 'El nombre es requerido';

    # Template: AdminITSMStateMachine
    $Self->{Translation}->{'Admin State Machine'} = 'Administración de Maquina de Estados';
    $Self->{Translation}->{'Select a catalog class!'} = '¡Seleccione una clase del catalogo!';
    $Self->{Translation}->{'A catalog class is required!'} = '¡Se requiere una clase del Catálogo!';
    $Self->{Translation}->{'Add a state transition'} = 'Adicionar un estado de transición';
    $Self->{Translation}->{'Catalog Class'} = 'Clase de Catálogo';
    $Self->{Translation}->{'Object Name'} = 'Nombre del Objeto';
    $Self->{Translation}->{'Overview over state transitions for'} = 'Resumen de las transiciones de estado para';
    $Self->{Translation}->{'Delete this state transition'} = 'Eliminar este estado de transición';
    $Self->{Translation}->{'Add a new state transition for'} = 'Adicionar un estado de transición nuevo para';
    $Self->{Translation}->{'Please select a state!'} = '¡Por favor seleccione un estado!';
    $Self->{Translation}->{'Please select a next state!'} = '!Por favor seleccione el siguiente estado¡';
    $Self->{Translation}->{'Edit a state transition for'} = 'Editar un estado de transición para';
    $Self->{Translation}->{'Do you really want to delete the state transition'} = '¿Realmente desea eliminar esta transición de estado?';

    # Template: AgentITSMChangeAdd
    $Self->{Translation}->{'Add Change'} = 'Agregar Cambio';
    $Self->{Translation}->{'ITSM Change'} = 'Cambio ITSM';
    $Self->{Translation}->{'Justification'} = 'Justificación';
    $Self->{Translation}->{'Input invalid.'} = 'Entrada inválida';
    $Self->{Translation}->{'Impact'} = 'Impacto';
    $Self->{Translation}->{'Requested Date'} = 'Fecha solicitada';

    # Template: AgentITSMChangeAddFromTemplate
    $Self->{Translation}->{'Select Change Template'} = 'Seleccionar Plantilla de Cambio';
    $Self->{Translation}->{'Time type'} = 'Tipo de fecha';
    $Self->{Translation}->{'Invalid time type.'} = 'Tipo de hora inválido.';
    $Self->{Translation}->{'New time'} = 'Nuevo intervalo de tiempo';

    # Template: AgentITSMChangeCABTemplate
    $Self->{Translation}->{'Save Change CAB as template'} = 'Guardar Comité de Cambio como plantilla';
    $Self->{Translation}->{'go to involved persons screen'} = 'volver a pantalla de personas involucradas';
    $Self->{Translation}->{'Invalid Name'} = 'Nombre no válido';

    # Template: AgentITSMChangeCondition
    $Self->{Translation}->{'Conditions and Actions'} = 'Condiciones y Acciones';
    $Self->{Translation}->{'Delete Condition'} = 'Eliminar condición';
    $Self->{Translation}->{'Add new condition'} = 'Agregar nueva condición';

    # Template: AgentITSMChangeConditionEdit
    $Self->{Translation}->{'Edit Condition'} = '';
    $Self->{Translation}->{'Need a valid name.'} = 'Se requiere un nombre válido';
    $Self->{Translation}->{'A valid name is needed.'} = 'Se requiere un nombre valido.';
    $Self->{Translation}->{'Duplicate name:'} = 'Nombre duplicado:';
    $Self->{Translation}->{'This name is already used by another condition.'} = 'Este nombre esta siendo usado por otra Condición.';
    $Self->{Translation}->{'Matching'} = 'Coincidentes';
    $Self->{Translation}->{'Any expression (OR)'} = 'Cualquier expresión (O)';
    $Self->{Translation}->{'All expressions (AND)'} = 'Todas las expresiones (Y)';
    $Self->{Translation}->{'Expressions'} = 'Expresiones';
    $Self->{Translation}->{'Selector'} = 'Selector';
    $Self->{Translation}->{'Operator'} = 'Operador';
    $Self->{Translation}->{'Delete Expression'} = 'Eliminar expresión';
    $Self->{Translation}->{'No Expressions found.'} = 'No se encuentran Expresiones.';
    $Self->{Translation}->{'Add new expression'} = 'Agregar expresión nueva';
    $Self->{Translation}->{'Delete Action'} = 'Eliminar Acción';
    $Self->{Translation}->{'No Actions found.'} = 'No se encuentran Acciones.';
    $Self->{Translation}->{'Add new action'} = 'Agregar acción nueva';

    # Template: AgentITSMChangeDelete
    $Self->{Translation}->{'Do you really want to delete this change?'} = '¿Realmente desea eliminar este Cambio?';

    # Template: AgentITSMChangeHistory
    $Self->{Translation}->{'History of'} = 'Historial de';
    $Self->{Translation}->{'Workorder'} = 'Orden de Trabajo';
    $Self->{Translation}->{'Show details'} = 'Mostrar detalles';
    $Self->{Translation}->{'Show workorder'} = 'Mostrar Orden de Trabajo';

    # Template: AgentITSMChangeHistoryZoom
    $Self->{Translation}->{'Detailed history information of'} = 'Información histórica detallada de';
    $Self->{Translation}->{'Modified'} = 'Modificado';
    $Self->{Translation}->{'Old Value'} = 'Valor Antiguo';
    $Self->{Translation}->{'New Value'} = 'Nuevo Valor';

    # Template: AgentITSMChangeInvolvedPersons
    $Self->{Translation}->{'Involved Persons'} = 'Personas Involucradas';
    $Self->{Translation}->{'ChangeManager'} = 'Administrador de Cambios';
    $Self->{Translation}->{'User invalid.'} = 'El usuario no es válido.';
    $Self->{Translation}->{'ChangeBuilder'} = 'Constructor de Cambios';
    $Self->{Translation}->{'Change Advisory Board'} = 'Comités de Cambio';
    $Self->{Translation}->{'CAB Template'} = 'Plantilla de Comité de Cambio';
    $Self->{Translation}->{'Apply Template'} = 'Aplicar Plantilla';
    $Self->{Translation}->{'NewTemplate'} = 'Nueva Plantilla';
    $Self->{Translation}->{'Save this CAB as template'} = 'Salvar Comité de Cambio como plantilla';
    $Self->{Translation}->{'Add to CAB'} = 'Agregar al Comité de Cambios';
    $Self->{Translation}->{'Invalid User'} = 'Usuario inválido';
    $Self->{Translation}->{'Current CAB'} = 'Comité de Cambios Actual';

    # Template: AgentITSMChangeOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Ajustes de Contexto';
    $Self->{Translation}->{'Changes per page'} = 'Cambios por página';

    # Template: AgentITSMChangeOverviewSmall
    $Self->{Translation}->{'WorkOrderTitle'} = 'Título de la Orden de Trabajo';
    $Self->{Translation}->{'ChangeTitle'} = 'Título del Cambio';
    $Self->{Translation}->{'WorkOrderAgent'} = 'Agente de la Orden de Trabajo';
    $Self->{Translation}->{'Workorders'} = 'Orden de Trabajo';
    $Self->{Translation}->{'ChangeState'} = 'Estado del Cambio';
    $Self->{Translation}->{'WorkOrderState'} = 'Estado de la Orden de Trabajo';
    $Self->{Translation}->{'WorkOrderType'} = 'Tipo de Orden de Trabajo';
    $Self->{Translation}->{'Requested Time'} = 'Fecha de Solicitud';
    $Self->{Translation}->{'PlannedStartTime'} = 'Fecha de Inicio Planeado';
    $Self->{Translation}->{'PlannedEndTime'} = 'Fecha de Finalización Planeada';
    $Self->{Translation}->{'ActualStartTime'} = 'Fecha de Inicio Real';
    $Self->{Translation}->{'ActualEndTime'} = 'Fecha de Finalización Real';

    # Template: AgentITSMChangeReset
    $Self->{Translation}->{'Do you really want to reset this change?'} = '¿Realmente desea resetear este Cambio?';

    # Template: AgentITSMChangeSearch
    $Self->{Translation}->{'(e.g. 10*5155 or 105658*)'} = '(ej. 10*5155 o 105658*)';
    $Self->{Translation}->{'CABAgent'} = 'Agente del CAB';
    $Self->{Translation}->{'e.g.'} = 'ej.';
    $Self->{Translation}->{'CABCustomer'} = 'Cliente del CAB';
    $Self->{Translation}->{'ITSM Workorder'} = 'Orden de Trabajo ITSM';
    $Self->{Translation}->{'Instruction'} = 'Instrucción';
    $Self->{Translation}->{'Report'} = 'Reporte';
    $Self->{Translation}->{'Change Category'} = 'Categoría de Cambio';
    $Self->{Translation}->{'(before/after)'} = '(antes/después)';
    $Self->{Translation}->{'(between)'} = '(entre)';

    # Template: AgentITSMChangeTemplate
    $Self->{Translation}->{'Save Change as Template'} = 'Guardar Cambio como Plantilla';
    $Self->{Translation}->{'A template should have a name!'} = '¡Una plantilla debe tener un nombre!';
    $Self->{Translation}->{'The template name is required.'} = 'El nombre de la plantilla es imprescindible.';
    $Self->{Translation}->{'Reset States'} = 'Reestablecer Estados';
    $Self->{Translation}->{'Overwrite original template'} = 'Sobreescribir platilla original';
    $Self->{Translation}->{'Delete original change'} = 'Eliminar cambio original';

    # Template: AgentITSMChangeTimeSlot
    $Self->{Translation}->{'Move Time Slot'} = 'Mover Periodo de Tiempo';

    # Template: AgentITSMChangeZoom
    $Self->{Translation}->{'Change Information'} = 'Información del Cambio';
    $Self->{Translation}->{'PlannedEffort'} = 'Esfuerzo Planeado';
    $Self->{Translation}->{'Change Initiator(s)'} = 'Iniciador(es) de Cambio(s)';
    $Self->{Translation}->{'Change Manager'} = 'Administrador del Cambio';
    $Self->{Translation}->{'Change Builder'} = 'Constructor del Cambio';
    $Self->{Translation}->{'CAB'} = 'CAB';
    $Self->{Translation}->{'Last changed'} = 'Último cambio';
    $Self->{Translation}->{'Last changed by'} = 'Último cambio por';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        'Para abrir links en los siguientes bloques de descripción, podria necesitar presionar la teclas Ctrl, Cmd o Shift mientras presiona el link (depende del browser y el SO)';
    $Self->{Translation}->{'Download Attachment'} = 'Descargar Adjunto';

    # Template: AgentITSMTemplateEditCAB
    $Self->{Translation}->{'Edit CAB Template'} = 'Editar Plantilla de Comité de Cambios';

    # Template: AgentITSMTemplateEditContent
    $Self->{Translation}->{'This will create a new change from this template, so you can edit and save it.'} =
        'Esto creará un nuevo cambio a partir de esta plantilla, para que lo pueda editar y guardar.';
    $Self->{Translation}->{'The new change will be deleted automatically after it has been saved as template.'} =
        'El nuevo cambio será eliminado automáticamente luego de que sea guardado como plantilla.';
    $Self->{Translation}->{'This will create a new workorder from this template, so you can edit and save it.'} =
        'Esto creará una nueva orden de trabajo a partir de esta plantilla, para que la pueda editar y guardar.';
    $Self->{Translation}->{'A temporary change will be created which contains the workorder.'} =
        ' Se creará un cambio temporalmente, el cual contendrá la orden de trabajo.';
    $Self->{Translation}->{'The temporary change and new workorder will be deleted automatically after the workorder has been saved as template.'} =
        'El cambio temporal y la nueva orden de trabajo se eliminarán de forma automática después de que la orden de trabajo se haya guardado como plantilla.';
    $Self->{Translation}->{'Do you want to proceed?'} = '¿Desea proceder?';

    # Template: AgentITSMTemplateOverviewSmall
    $Self->{Translation}->{'TemplateID'} = 'IDPlantilla';
    $Self->{Translation}->{'Edit Content'} = 'Editar Contenido';
    $Self->{Translation}->{'CreateBy'} = 'Creado por';
    $Self->{Translation}->{'CreateTime'} = 'Fecha de creación';
    $Self->{Translation}->{'ChangeBy'} = 'Modificado por';
    $Self->{Translation}->{'ChangeTime'} = 'Fecha del cambio';
    $Self->{Translation}->{'Edit Template Content'} = 'Editar Contenido de la Plantilla';
    $Self->{Translation}->{'Delete Template'} = 'Eliminar Plantilla';

    # Template: AgentITSMWorkOrderAdd
    $Self->{Translation}->{'Add Workorder to'} = 'Agregar Orden de Trabajo a';
    $Self->{Translation}->{'Invalid workorder type.'} = 'Tipo de orden de trabajo inválido.';
    $Self->{Translation}->{'The planned start time must be before the planned end time!'} = '¡La fecha planeada de inicio debe ser anterior a la de finalización!';
    $Self->{Translation}->{'Invalid format.'} = 'Formato no válido.';

    # Template: AgentITSMWorkOrderAddFromTemplate
    $Self->{Translation}->{'Select Workorder Template'} = 'Seleccionar Plantilla de Orden de Trabajo';

    # Template: AgentITSMWorkOrderDelete
    $Self->{Translation}->{'Do you really want to delete this workorder?'} = '¿Realmente desea eliminar esta orden de trabajo?';
    $Self->{Translation}->{'You can not delete this Workorder. It is used in at least one Condition!'} =
        '¡No es posible eliminar esta orden de trabajo, pues está siendo usada en al menos una Condición!';
    $Self->{Translation}->{'This Workorder is used in the following Condition(s)'} = 'Esta orden de trabajo se usa en la(s) siguiente(s) condicion(es)';

    # Template: AgentITSMWorkOrderEdit
    $Self->{Translation}->{'Move following workorders accordingly'} = 'Mover las siguientes ordenes de trabajo correspondientemente';
    $Self->{Translation}->{'If the planned end time of this workorder is changed, the planned start times of all following workorders will be changed accordingly'} =
        'Si se cambia la hora de finalización prevista de esta orden de trabajo , las horas de inicio planificadas de todas las siguientes órdenes de trabajo se cambiarán en consecuencia';

    # Template: AgentITSMWorkOrderReport
    $Self->{Translation}->{'The actual start time must be before the actual end time!'} = '¡La hora de inicio actual debe ser anterior a la de finalización!';
    $Self->{Translation}->{'The actual start time must be set, when the actual end time is set!'} =
        '¡Debe establecer la hora de inicio actual cuando la hora de término está establecida!';

    # Template: AgentITSMWorkOrderTake
    $Self->{Translation}->{'Current Agent'} = 'Agente Actual';
    $Self->{Translation}->{'Do you really want to take this workorder?'} = '¿Realmente desea tomar esta orden de trabajo?';

    # Template: AgentITSMWorkOrderTemplate
    $Self->{Translation}->{'Save Workorder as Template'} = 'Guardar Orden de Trabajo como Plantilla';
    $Self->{Translation}->{'Delete original workorder (and surrounding change)'} = 'Eliminar orden de trabajo original (y el cambio que la rodea)';

    # Template: AgentITSMWorkOrderZoom
    $Self->{Translation}->{'Workorder Information'} = 'Información de la Orden de Trabajo';

    # Perl Module: Kernel/Modules/AdminITSMChangeNotification.pm
    $Self->{Translation}->{'Unknown notification %s!'} = '¡Notificación desconocida %s!';
    $Self->{Translation}->{'There was an error creating the notification.'} = 'Se produjo un error al crear la notificación.';

    # Perl Module: Kernel/Modules/AgentITSMChange.pm
    $Self->{Translation}->{'Overview: ITSM Changes'} = 'Resumen: Cambios ITSM';

    # Perl Module: Kernel/Modules/AgentITSMChangeAdd.pm
    $Self->{Translation}->{'Ticket with TicketID %s does not exist!'} = '¡El Ticket con la ID %s no existe!';
    $Self->{Translation}->{'Please contact the admin.'} = 'Por favor, póngase en contacto con el administrador.';
    $Self->{Translation}->{'Missing sysconfig option "ITSMChange::AddChangeLinkTicketTypes"!'} =
        '';
    $Self->{Translation}->{'Was not able to add change!'} = 'No se pudo agregar el cambio!';

    # Perl Module: Kernel/Modules/AgentITSMChangeAddFromTemplate.pm
    $Self->{Translation}->{'Was not able to create change from template!'} = 'No se pudo crear el cambio desde la plantilla!';

    # Perl Module: Kernel/Modules/AgentITSMChangeCABTemplate.pm
    $Self->{Translation}->{'No ChangeID is given!'} = '';
    $Self->{Translation}->{'No change found for changeID %s.'} = '';
    $Self->{Translation}->{'The CAB of change "%s" could not be serialized.'} = '';
    $Self->{Translation}->{'Could not add the template.'} = 'No se pudo agregar la plantilla.';

    # Perl Module: Kernel/Modules/AgentITSMChangeCondition.pm
    $Self->{Translation}->{'Change "%s" not found in database!'} = '';
    $Self->{Translation}->{'Could not delete ConditionID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeConditionEdit.pm
    $Self->{Translation}->{'No %s is given!'} = '¡No se indica el %s!';
    $Self->{Translation}->{'Could not create new condition!'} = '';
    $Self->{Translation}->{'Could not update ConditionID %s!'} = '';
    $Self->{Translation}->{'Could not update ExpressionID %s!'} = '';
    $Self->{Translation}->{'Could not add new Expression!'} = '';
    $Self->{Translation}->{'Could not update ActionID %s!'} = '';
    $Self->{Translation}->{'Could not add new Action!'} = '';
    $Self->{Translation}->{'Could not delete ExpressionID %s!'} = '';
    $Self->{Translation}->{'Could not delete ActionID %s!'} = '';
    $Self->{Translation}->{'Error: Unknown field type "%s"!'} = '';
    $Self->{Translation}->{'ConditionID %s does not belong to the given ChangeID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeDelete.pm
    $Self->{Translation}->{'Change "%s" does not have an allowed change state to be deleted!'} =
        '';
    $Self->{Translation}->{'Was not able to delete the changeID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeEdit.pm
    $Self->{Translation}->{'Was not able to update Change!'} = 'No se pudo actualizar el Cambio!';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no ChangeID is given!'} = '';
    $Self->{Translation}->{'Change "%s" not found in the database!'} = '';
    $Self->{Translation}->{'Unknown type "%s" encountered!'} = '';
    $Self->{Translation}->{'Change History'} = 'Historial de cambio';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistoryZoom.pm
    $Self->{Translation}->{'Can\'t show history zoom, no HistoryEntryID is given!'} = '';
    $Self->{Translation}->{'HistoryEntry "%s" not found in database!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeInvolvedPersons.pm
    $Self->{Translation}->{'Was not able to update Change CAB for Change %s!'} = '';
    $Self->{Translation}->{'Was not able to update Change %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeManager.pm
    $Self->{Translation}->{'Overview: ChangeManager'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyCAB.pm
    $Self->{Translation}->{'Overview: My CAB'} = 'Resumen: Mi CAB';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyChanges.pm
    $Self->{Translation}->{'Overview: My Changes'} = 'Resumen: Mis Cambios';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyWorkOrders.pm
    $Self->{Translation}->{'Overview: My Workorders'} = 'Resumen: Mis ordenes de trabajo';

    # Perl Module: Kernel/Modules/AgentITSMChangePIR.pm
    $Self->{Translation}->{'Overview: PIR'} = 'Resumen: PIR';

    # Perl Module: Kernel/Modules/AgentITSMChangePSA.pm
    $Self->{Translation}->{'Overview: PSA'} = 'Resumen: PSA';

    # Perl Module: Kernel/Modules/AgentITSMChangePrint.pm
    $Self->{Translation}->{'WorkOrder "%s" not found in database!'} = '';
    $Self->{Translation}->{'Can\'t create output, as the workorder is not attached to a change!'} =
        '';
    $Self->{Translation}->{'Can\'t create output, as no ChangeID is given!'} = '';
    $Self->{Translation}->{'unknown change title'} = '';
    $Self->{Translation}->{'unknown workorder title'} = '';
    $Self->{Translation}->{'ITSM Workorder Overview (%s)'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeReset.pm
    $Self->{Translation}->{'Was not able to reset WorkOrder %s of Change %s!'} = '';
    $Self->{Translation}->{'Was not able to reset Change %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeSchedule.pm
    $Self->{Translation}->{'Overview: Change Schedule'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeSearch.pm
    $Self->{Translation}->{'Change Search'} = '';
    $Self->{Translation}->{'WorkOrders'} = 'Orden de Trabajo';
    $Self->{Translation}->{'Change Search Result'} = '';
    $Self->{Translation}->{'Change Number'} = '';
    $Self->{Translation}->{'Change Title'} = '';
    $Self->{Translation}->{'Work Order Title'} = '';
    $Self->{Translation}->{'CAB Agent'} = 'Agente del CAB';
    $Self->{Translation}->{'CAB Customer'} = 'Cliente del CAB';
    $Self->{Translation}->{'Change Description'} = 'Cambiar descripción';
    $Self->{Translation}->{'Change Justification'} = '';
    $Self->{Translation}->{'WorkOrder Instruction'} = '';
    $Self->{Translation}->{'WorkOrder Report'} = '';
    $Self->{Translation}->{'Change Priority'} = '';
    $Self->{Translation}->{'Change Impact'} = '';
    $Self->{Translation}->{'Change State'} = '';
    $Self->{Translation}->{'Created By'} = 'Creador por';
    $Self->{Translation}->{'WorkOrder State'} = '';
    $Self->{Translation}->{'WorkOrder Type'} = '';
    $Self->{Translation}->{'WorkOrder Agent'} = '';
    $Self->{Translation}->{'Planned Start Time'} = '';
    $Self->{Translation}->{'Planned End Time'} = '';
    $Self->{Translation}->{'Actual Start Time'} = '';
    $Self->{Translation}->{'Actual End Time'} = '';
    $Self->{Translation}->{'Change Time'} = '';
    $Self->{Translation}->{'before'} = 'antes ';

    # Perl Module: Kernel/Modules/AgentITSMChangeTemplate.pm
    $Self->{Translation}->{'The change "%s" could not be serialized.'} = '';
    $Self->{Translation}->{'Could not update the template "%s".'} = 'No se pudo actualizar la plantilla. "%s".';
    $Self->{Translation}->{'Could not delete change "%s".'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeTimeSlot.pm
    $Self->{Translation}->{'The change can\'t be moved, as it has no workorders.'} = '';
    $Self->{Translation}->{'Add a workorder first.'} = '';
    $Self->{Translation}->{'Can\'t move a change which already has started!'} = '';
    $Self->{Translation}->{'Please move the individual workorders instead.'} = '';
    $Self->{Translation}->{'The current %s could not be determined.'} = '';
    $Self->{Translation}->{'The %s of all workorders has to be defined.'} = '';
    $Self->{Translation}->{'Was not able to move time slot for workorder #%s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMTemplateDelete.pm
    $Self->{Translation}->{'You need %s permission!'} = '¡Necesita permiso %s!';
    $Self->{Translation}->{'No TemplateID is given!'} = '';
    $Self->{Translation}->{'Template "%s" not found in database!'} = '';
    $Self->{Translation}->{'Was not able to delete the template %s!'} = '¡No se pudo eliminar la plantilla %s!';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEdit.pm
    $Self->{Translation}->{'Was not able to update Template %s!'} = 'No se pudo actualizar la Plantilla %s!';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEditCAB.pm
    $Self->{Translation}->{'Was not able to update Template "%s"!'} = 'No se pudo actualizar la Plantilla "%s"!';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEditContent.pm
    $Self->{Translation}->{'Was not able to create change!'} = '';
    $Self->{Translation}->{'Was not able to create workorder from template!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMTemplateOverview.pm
    $Self->{Translation}->{'Overview: Template'} = 'Resumen: Plantilla';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderAdd.pm
    $Self->{Translation}->{'You need %s permissions on the change!'} = '';
    $Self->{Translation}->{'Was not able to add workorder!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderAgent.pm
    $Self->{Translation}->{'No WorkOrderID is given!'} = '';
    $Self->{Translation}->{'Was not able to set the workorder agent of the workorder "%s" to empty!'} =
        '';
    $Self->{Translation}->{'Was not able to update the workorder "%s"!'} = '';
    $Self->{Translation}->{'Could not find Change for WorkOrder %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderDelete.pm
    $Self->{Translation}->{'Was not able to delete the workorder %s!'} = '¡No se pudo eliminar la orden de trabajo %s!';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderEdit.pm
    $Self->{Translation}->{'Was not able to update WorkOrder %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no WorkOrderID is given!'} = '';
    $Self->{Translation}->{'WorkOrder "%s" not found in the database!'} = '';
    $Self->{Translation}->{'WorkOrderHistory::'} = '';
    $Self->{Translation}->{'WorkOrder History'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderHistoryZoom.pm
    $Self->{Translation}->{'History entry "%s" not found in the database!'} = '';
    $Self->{Translation}->{'WorkOrder History Zoom'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderTake.pm
    $Self->{Translation}->{'Was not able to take the workorder %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderTemplate.pm
    $Self->{Translation}->{'The workorder "%s" could not be serialized.'} = '';

    # Perl Module: Kernel/Output/HTML/Layout/ITSMChange.pm
    $Self->{Translation}->{'Need config option %s!'} = '';
    $Self->{Translation}->{'Config option %s needs to be a HASH ref!'} = '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';
    $Self->{Translation}->{'Title: %s | Type: %s'} = 'Título: %s | Tipo: %s';

    # Perl Module: Kernel/Output/HTML/ToolBar/MyWorkOrders.pm
    $Self->{Translation}->{'My Work Orders'} = 'Mis Órdenes de Trabajo';

    # SysConfig
    $Self->{Translation}->{'A list of the agents who have permission to take workorders. Key is a login name. Content is 0 or 1.'} =
        'Una lista de los agentes que tienen permiso para tomar órdenes de trabajo. Key es un nombre de inicio de sesión. Content puede ser 0 ó 1.';
    $Self->{Translation}->{'A list of workorder states, at which the ActualStartTime of a workorder will be set if it was empty at this point.'} =
        'Una lista de estados para las órdenes de trabajo, misma que será asignada a ActualStartTime, si para este punto seguía vacío.';
    $Self->{Translation}->{'Add Workorder (from Template)'} = '';
    $Self->{Translation}->{'Add a change from template.'} = 'Agregar un cambio desde una plantilla.';
    $Self->{Translation}->{'Add a change.'} = 'Añadir un cambio.';
    $Self->{Translation}->{'Add a workorder (from template) to the change.'} = '';
    $Self->{Translation}->{'Add a workorder to the change.'} = '';
    $Self->{Translation}->{'Admin of the CIP matrix.'} = 'Administrar la matriz CIP.';
    $Self->{Translation}->{'Admin of the state machine.'} = 'Administrar la máquina de estados.';
    $Self->{Translation}->{'Agent interface notification module to see the number of change advisory boards.'} =
        'Módulo de notificación de la interface del Agente para mostrar el número de change advisory boards.';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes managed by the user.'} =
        'Módulo de notificación de la interface del Agente para mostrar el número de  cambios administrados por el usuario.';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes.'} =
        'Módulo de notificación de la interface del Agente para mostrar el número de cambios.';
    $Self->{Translation}->{'Agent interface notification module to see the number of workorders.'} =
        '';
    $Self->{Translation}->{'CAB Member Search'} = '';
    $Self->{Translation}->{'Cache time in minutes for the change management toolbars. Default: 3 hours (180 minutes).'} =
        'Tiempo caché en minutos para las barras de tareas de gestión del cambio. Por defecto:  3 horas (180 minutos).';
    $Self->{Translation}->{'Cache time in minutes for the change management. Default: 5 days (7200 minutes).'} =
        'Tiempo caché en minutos para la gestión del cambio. Por defecto: 5 días (7200 minutos).';
    $Self->{Translation}->{'Change CAB Templates'} = '';
    $Self->{Translation}->{'Change History.'} = '';
    $Self->{Translation}->{'Change Involved Persons.'} = 'Cambiar personas involucradas.';
    $Self->{Translation}->{'Change Overview "Small" Limit'} = 'Cambie Límite Vista General "Pequeña"';
    $Self->{Translation}->{'Change Overview.'} = '';
    $Self->{Translation}->{'Change Print.'} = '';
    $Self->{Translation}->{'Change Schedule.'} = '';
    $Self->{Translation}->{'Change Zoom.'} = 'Ampliación del Cambio.';
    $Self->{Translation}->{'Change and Workorder Templates'} = '';
    $Self->{Translation}->{'Change and workorder templates edited by this user.'} = '';
    $Self->{Translation}->{'Change area.'} = '';
    $Self->{Translation}->{'Change involved persons of the change.'} = '';
    $Self->{Translation}->{'Change limit per page for Change Overview "Small".'} = '';
    $Self->{Translation}->{'Change search backend router of the agent interface.'} = '';
    $Self->{Translation}->{'Condition Overview'} = '';
    $Self->{Translation}->{'Configure which screen should be shown after a new workorder has been created.'} =
        '';
    $Self->{Translation}->{'Configures how often the notifications are sent when planned the start time or other time values have been reached/passed.'} =
        'Configura el intervalo de envío de notificaciones cuando alguno de los valores del tiempo, como la fecha de inicio planeada, se alcanzan/sobrepasan.';
    $Self->{Translation}->{'Create Change (from Template)'} = '';
    $Self->{Translation}->{'Create a change (from template) from this ticket.'} = '';
    $Self->{Translation}->{'Create a change from this ticket.'} = '';
    $Self->{Translation}->{'Create and manage ITSM Change Management notifications.'} = '';
    $Self->{Translation}->{'Default type for a workorder. This entry must exist in general catalog class \'ITSM::ChangeManagement::WorkOrder::Type\'.'} =
        'Tipo default para las órdenes de trabajo. Este registro debe existir en la clase \'ITSM::ChangeManagement::WorkOrder::Type\' del catálogo general.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Definir acciones donde está disponible un botón de configuración en el widget de objetos vinculados (LinkObject::ViewMode = "complex"). Tenga en cuenta que estas acciones deben haber registrado los siguientes archivos JS y CSS: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js y Core.Agent.LinkObject.js.';
    $Self->{Translation}->{'Define the signals for each workorder state.'} = 'Define las señales para cada estado de las órdenes de trabajo.';
    $Self->{Translation}->{'Define which columns are shown in the linked Changes widget (LinkObject::ViewMode = "complex"). Note: Only Change attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked Workorder widget (LinkObject::ViewMode = "complex"). Note: Only Workorder attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a change list.'} =
        'Define un módulo de resumen para mostrar la vista pequeña de una lista de cambios.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a template list.'} =
        'Define un módulo de resumen para mostrar la vista pequeña de una lista de plantillas.';
    $Self->{Translation}->{'Defines if it will be possible to print the accounted time.'} = 'Define si será posible imprimir el tiempo contabilizado.';
    $Self->{Translation}->{'Defines if it will be possible to print the planned effort.'} = 'Define si será posible imprimir el esfuerzo planeado.';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) change end states should be allowed if a change is in a locked state.'} =
        '';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) workorder end states should be allowed if a workorder is in a locked state.'} =
        '';
    $Self->{Translation}->{'Defines if the accounted time should be shown.'} = 'Determina si el tiempo contabilizado debe mostrarse.';
    $Self->{Translation}->{'Defines if the actual start and end times should be set.'} = 'Determina si las fechas de inicio y finalización reales deben fijarse.';
    $Self->{Translation}->{'Defines if the change search and the workorder search functions could use the mirror DB.'} =
        '';
    $Self->{Translation}->{'Defines if the change state can be set in AgentITSMChangeEdit.'} =
        'Define si el estado de un cambio puede determinarse en AgentITSMChangeEdit.';
    $Self->{Translation}->{'Defines if the planned effort should be shown.'} = 'Determina si el esfuerzo planeado debe mostrarse.';
    $Self->{Translation}->{'Defines if the requested date should be print by customer.'} = 'Define si la fecha solicitada debe ser impresa por el cliente.';
    $Self->{Translation}->{'Defines if the requested date should be searched by customer.'} =
        'Define si la fecha solicitada debe ser buscada por el cliente.';
    $Self->{Translation}->{'Defines if the requested date should be set by customer.'} = 'Define si la fecha solicitada debe ser establecida por el cliente.';
    $Self->{Translation}->{'Defines if the requested date should be shown by customer.'} = 'Define si la fecha solicitada debe ser mostrada por el cliente.';
    $Self->{Translation}->{'Defines if the workorder state should be shown.'} = 'Determina si el estado de la orden de trabajo debe mostrarse.';
    $Self->{Translation}->{'Defines if the workorder title should be shown.'} = 'Determina si el título de la orden de trabajo debe mostrarse.';
    $Self->{Translation}->{'Defines shown graph attributes.'} = 'Define los atributos mostrados en las gráficas.';
    $Self->{Translation}->{'Defines that only changes containing Workorders linked with services, which the customer user has permission to use will be shown. Any other changes will not be displayed.'} =
        'Define que únicamente se mostrarán los cambios que contienen órdenes de trabajo, vinculadas con servicios, que el cliente tiene permiso de usar. El resto de los cambios no se desplegará.';
    $Self->{Translation}->{'Defines the change states that will be allowed to delete.'} = 'Define los estados de cambio que se permitirán eliminar.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change PSA overview.'} =
        'Define los estados de los cambios que serán utilizados como filtros en la vista de resumen de la PSA de los cambios.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change Schedule overview.'} =
        'Define los estados de los cambios que serán utilizados como filtros en la vista de resumen de la agenda de los cambios.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyCAB overview.'} =
        'Define los estados de los cambios que serán utilizados como filtros en la vista de resumen de MyCAB.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyChanges overview.'} =
        'Define los estados de los cambios que serán utilizados como filtros en la vista de resumen de MyChanges.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change manager overview.'} =
        'Define los estados de los cambios que serán utilizados como filtros en la vista de resumen de la gestión de cambios.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change overview.'} =
        'Define los estados de los cambios que serán usados como filtros en los resúmenes de dichos cambios.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the customer change schedule overview.'} =
        'Define los estados de los cambios que serán utilizados como filtros en la vista de resumen de edición de la agenda, en la interfaz del cliente.';
    $Self->{Translation}->{'Defines the default change title for a dummy change which is needed to edit a workorder template.'} =
        'Define el título por defecto de un cambio que será utilizado para un cambio temporal, el cual se necesita para editar una plantilla de orden de trabajo.';
    $Self->{Translation}->{'Defines the default sort criteria in the change PSA overview.'} =
        'Define el criterio de ordenamiento por default para la vista de resumem de la PSA de los cambios.';
    $Self->{Translation}->{'Defines the default sort criteria in the change manager overview.'} =
        'Define el criterio de ordenamiento por default para la vista de resumem del administrador de los cambios.';
    $Self->{Translation}->{'Defines the default sort criteria in the change overview.'} = 'Define el criterio de ordenamiento por default para la vista de resumem de los cambios.';
    $Self->{Translation}->{'Defines the default sort criteria in the change schedule overview.'} =
        'Define el criterio de ordenamiento por default para la vista de resumem de la agenda de los cambios.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyCAB overview.'} =
        'Define el criterio de ordenamiento por default de los cambios para la vista de resumem de MyCAB.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyChanges overview.'} =
        'Define el criterio de ordenamiento por default de los cambios para la vista de resumem de MyChanges.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyWorkorders overview.'} =
        'Define el criterio de ordenamiento por default de los cambios para la vista de resumem de MyWorkorders.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the PIR overview.'} =
        'Define el criterio de ordenamiento por default de los cambios para la vista de resumem de las PIR.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the customer change schedule overview.'} =
        'Define el criterio de ordenamiento por default de los cambios para la vista de resumem de edición de la agenda, en la interfaz del cliente.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the template overview.'} =
        'Define el criterio de ordenamiento por default de los cambios para la vista de resumem de las plantillas.';
    $Self->{Translation}->{'Defines the default sort order in the MyCAB overview.'} = 'Define el parámetro de ordenamiento por default para la vista de resumem de MyCAB.';
    $Self->{Translation}->{'Defines the default sort order in the MyChanges overview.'} = 'Define el parámetro de ordenamiento por default para la vista de resumem de MyChanges.';
    $Self->{Translation}->{'Defines the default sort order in the MyWorkorders overview.'} =
        'Define el parámetro de ordenamiento por default para la vista de resumem de MyWorkorders.';
    $Self->{Translation}->{'Defines the default sort order in the PIR overview.'} = 'Define el parámetro de ordenamiento por default para la vista de resumem de las PIR.';
    $Self->{Translation}->{'Defines the default sort order in the change PSA overview.'} = 'Define el parámetro de ordenamiento por default para la vista de resumem de la PSA de los cambios.';
    $Self->{Translation}->{'Defines the default sort order in the change manager overview.'} =
        'Define el parámetro de ordenamiento por default para la vista de resumem de la agenda de los cambios.';
    $Self->{Translation}->{'Defines the default sort order in the change overview.'} = 'Define el parámetro de ordenamiento por default en la vista de resumen de los cambios.';
    $Self->{Translation}->{'Defines the default sort order in the change schedule overview.'} =
        'Define el parámetro de ordenamiento por default para la vista de resumem de la agenda de los cambios.';
    $Self->{Translation}->{'Defines the default sort order in the customer change schedule overview.'} =
        'Define el parámetro de ordenamiento por default para la vista de resumem de edición de la angenda, en la interfaz del cliente.';
    $Self->{Translation}->{'Defines the default sort order in the template overview.'} = 'Define el parámetro de ordenamiento por default para la vista de resumem de las plantillas.';
    $Self->{Translation}->{'Defines the default value for the category of a change.'} = 'Define el valor por default de la categoría de los cambios.';
    $Self->{Translation}->{'Defines the default value for the impact of a change.'} = 'Define el valor por default del impacto de los cambios.';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for change attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        'Define el tipo de campo para los CompareValue de los atributos de un cambio en AgentITSMChangeConditionEdit. Los valores posibles son: Selección, Texto y Fecha. Si el tipo no está definido, el campo no se mostrará.';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for workorder attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        'Define el tipo de campo para los CompareValue de los atributos de una orden de trabajo en AgentITSMChangeConditionEdit. Los valores posibles son: Selección, Texto y Fecha. Si el tipo no está definido, el campo no se mostrará.';
    $Self->{Translation}->{'Defines the object attributes that are selectable for change objects in AgentITSMChangeConditionEdit.'} =
        'Define los atributos elegibles para los cambios en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the object attributes that are selectable for workorder objects in AgentITSMChangeConditionEdit.'} =
        'Define los atributos elegibles para las órdenes de trabajo en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute AccountedTime in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo AccountedTime en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualEndTime in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo ActualEndTime en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualStartTime in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo ActualStartTime en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute CategoryID in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo CategoryID en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeBuilderID in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo ChangeBuilderID en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeManagerID in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo ChangeManagerID en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeStateID in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo ChangeStateID en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeTitle in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo ChangeTitle en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute DynamicField in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ImpactID in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo ImpactID en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEffort in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo PlannedEffort en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEndTime in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo PlannedEndTime en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedStartTime in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo PlannedStartTime en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PriorityID in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo PriorityID en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute RequestedTime in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo RequestedTime en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderAgentID in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo WorkOrderAgentID en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderNumber in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo WorkOrderNumber en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderStateID in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo WorkOrderStateID en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTitle in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo WorkOrderTitle en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTypeID in AgentITSMChangeConditionEdit.'} =
        'Define los operadores elegibles para el atributo WorkOrderTypeID en AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the period (in years), in which start and end times can be selected.'} =
        'Define el periodo (en años) en el que las fechas de inicio y finalización pueden seleccionarse.';
    $Self->{Translation}->{'Defines the shown attributes of a workorder in the tooltip of the workorder graph in the change zoom. To show workorder dynamic fields in the tooltip, they must be specified like DynamicField_WorkOrderFieldName1, DynamicField_WorkOrderFieldName2, etc.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the Change PSA overview. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la vista de resumen de la PSA de los cambios, sin que esto tenga efecto en la posición de las mismas.';
    $Self->{Translation}->{'Defines the shown columns in the Change Schedule overview. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la vista de resumen de la agenda de los cambios, sin que esto tenga efecto en la posición de las mismas.';
    $Self->{Translation}->{'Defines the shown columns in the MyCAB overview. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la vista de resumen de MyCAB, sin que esto tenga efecto en la posición de las mismas.';
    $Self->{Translation}->{'Defines the shown columns in the MyChanges overview. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la vista de resumen de MyChanges, sin que esto tenga efecto en la posición de las mismas.';
    $Self->{Translation}->{'Defines the shown columns in the MyWorkorders overview. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la vista de resumen de MyWorkorders, sin que esto tenga efecto en la posición de las mismas.';
    $Self->{Translation}->{'Defines the shown columns in the PIR overview. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la vista de resumen de las PIR, sin que esto tenga efecto en la posición de las mismas.';
    $Self->{Translation}->{'Defines the shown columns in the change manager overview. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la vista de resumen del administrador de los cambios, sin que esto tenga efecto en la posición de las mismas.';
    $Self->{Translation}->{'Defines the shown columns in the change overview. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la vista de resumen de los cambios, sin que esto tenga efecto en la posición de las mismas.';
    $Self->{Translation}->{'Defines the shown columns in the change search. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la búsqueda de cambios, sin que esto tenga efecto en la posición de las mismas.';
    $Self->{Translation}->{'Defines the shown columns in the customer change schedule overview. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la vista de resumen de edición de la angenda de la interfaz del cliente, sin que esto tenga efecto en la posición de las mismas.';
    $Self->{Translation}->{'Defines the shown columns in the template overview. This option has no effect on the position of the column.'} =
        'Define las columnas mostradas en la vista de resumen de las plantillas, sin que esto tenga efecto en la posición de las mismas.';
    $Self->{Translation}->{'Defines the signals for each ITSMChange state.'} = 'Define las señales para cada uno de los estado de los cambios ITSM.';
    $Self->{Translation}->{'Defines the template types that will be used as filters in the template overview.'} =
        'Define los tipos de plantilla que serán utilizados como filtros en la vista de resumen de las plantillas.';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the MyWorkorders overview.'} =
        'Define los estados de las órdenes de trabajo que serán utilizados como filtros en la vista de resumen de MyWorkorders.';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the PIR overview.'} =
        'Define los estados de las órdenes de trabajo que serán utilizados como filtros en la vista de resumen de las PIR.';
    $Self->{Translation}->{'Defines the workorder types that will be used to show the PIR overview.'} =
        'Define los tipos de órdenes de trabajo que se usarán en la vista de resumen de las PIR.';
    $Self->{Translation}->{'Defines whether notifications should be sent.'} = 'Determina si deben enviarse notificaciones.';
    $Self->{Translation}->{'Delete a change.'} = 'Eliminar un cambio.';
    $Self->{Translation}->{'Delete the change.'} = '';
    $Self->{Translation}->{'Delete the workorder.'} = '';
    $Self->{Translation}->{'Details of a change history entry.'} = '';
    $Self->{Translation}->{'Determines if an agent can exchange the X-axis of a stat if he generates one.'} =
        'Determina si, al crear una estadística, es posible que los agentes intercambien las X-axis de las mismas.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes done for config item classes.'} =
        'Determina si el módulo comun de estadísticas debe generar estadísticas sobre cambios hechos a clases de elementos de configuración.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding change state updates within a timeperiod.'} =
        'Determina si el módulo comun de estadísticas debe generar estadísticas sobre los cambios, respecto a las actualizaciones de estado de los cambios en un periodo determinado.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding the relation between changes and incident tickets.'} =
        'Determina si el módulo comun de estadísticas debe generar estadísticas sobre los cambios, respecto a la relación entre los cambios y los tickets de tipo incidente.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes.'} =
        'Determina si el módulo comun de estadísticas debe generar estadísticas sobre los cambios.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about the number of Rfc tickets a requester created.'} =
        'Determina si el módulo comun de estadísticas debe generar estadísticas sobre el número de tickets Rfc que una persona creó.';
    $Self->{Translation}->{'Dynamic fields (for changes and workorders) shown in the change print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the change add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the change edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the change search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the change zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the workorder add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the workorder edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the workorder report screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the workorder zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'DynamicField event module to handle the update of conditions if dynamic fields are added, updated or deleted.'} =
        '';
    $Self->{Translation}->{'Edit a change.'} = 'Editar un cambio.';
    $Self->{Translation}->{'Edit the change.'} = '';
    $Self->{Translation}->{'Edit the conditions of the change.'} = '';
    $Self->{Translation}->{'Edit the workorder.'} = '';
    $Self->{Translation}->{'Forward schedule of changes. Overview over approved changes.'} =
        '';
    $Self->{Translation}->{'History Zoom'} = '';
    $Self->{Translation}->{'ITSM Change CAB Templates.'} = '';
    $Self->{Translation}->{'ITSM Change Condition Edit.'} = '';
    $Self->{Translation}->{'ITSM Change Condition Overview.'} = '';
    $Self->{Translation}->{'ITSM Change Management Notifications'} = '';
    $Self->{Translation}->{'ITSM Change Manager Overview.'} = '';
    $Self->{Translation}->{'ITSM Change PIR Overview.'} = '';
    $Self->{Translation}->{'ITSM Change notification rules'} = '';
    $Self->{Translation}->{'ITSM MyCAB Overview.'} = '';
    $Self->{Translation}->{'ITSM MyChanges Overview.'} = '';
    $Self->{Translation}->{'ITSM MyWorkorders Overview.'} = '';
    $Self->{Translation}->{'ITSM Template Delete.'} = '';
    $Self->{Translation}->{'ITSM Template Edit CAB.'} = '';
    $Self->{Translation}->{'ITSM Template Edit Content.'} = '';
    $Self->{Translation}->{'ITSM Template Edit.'} = '';
    $Self->{Translation}->{'ITSM Template Overview.'} = '';
    $Self->{Translation}->{'ITSM event module that cleans up conditions.'} = 'Módulo de eventos para ITSM que elimina condiciones.';
    $Self->{Translation}->{'ITSM event module that deletes the cache for a toolbar.'} = '';
    $Self->{Translation}->{'ITSM event module that deletes the history of changes.'} = '';
    $Self->{Translation}->{'ITSM event module that matches conditions and executes actions.'} =
        'Módulo de eventos para ITSM que verifica condiciones y ejecuta acciones.';
    $Self->{Translation}->{'ITSM event module that sends notifications.'} = 'Módulo de eventos para ITSM para enviar notificaciones.';
    $Self->{Translation}->{'ITSM event module that updates the history of changes.'} = 'Módulo de eventos para ITSM que actualiza la historia de los cambios.';
    $Self->{Translation}->{'ITSM event module that updates the history of conditions.'} = '';
    $Self->{Translation}->{'ITSM event module that updates the history of workorders.'} = '';
    $Self->{Translation}->{'ITSM event module to recalculate the workorder numbers.'} = 'Módulo de eventos para ITSM que recalcula los números de las órdenes de trabajo.';
    $Self->{Translation}->{'ITSM event module to set the actual start and end times of workorders.'} =
        'Módulo de eventos para ITSM para definir las fechas de inicio y finalización reales de las órdenes de trabajo.';
    $Self->{Translation}->{'If frequency is \'regularly\', you can configure how often the notifications are sent (every X hours).'} =
        '';
    $Self->{Translation}->{'Link another object to the change.'} = '';
    $Self->{Translation}->{'Link another object to the workorder.'} = '';
    $Self->{Translation}->{'Logfile for the ITSM change counter. This file is used for creating the change numbers.'} =
        'Log para el contador de los cambios ITSM. Este archivo se usa para crear los números de cambios.';
    $Self->{Translation}->{'Lookup of CAB members for autocompletion.'} = '';
    $Self->{Translation}->{'Lookup of agents, used for autocompletion.'} = '';
    $Self->{Translation}->{'Module to check if WorkOrderAdd or WorkOrderAddFromTemplate should be permitted.'} =
        '';
    $Self->{Translation}->{'Module to check the CAB members.'} = 'Módulo para verificar los miembros del CAB.';
    $Self->{Translation}->{'Module to check the agent.'} = 'Módulo para verificar el agente.';
    $Self->{Translation}->{'Module to check the change builder.'} = 'Módulo para verificar el creador de los cambios.';
    $Self->{Translation}->{'Module to check the change manager.'} = 'Módulo para verificar el administrador de los cambios.';
    $Self->{Translation}->{'Module to check the workorder agent.'} = 'Módulo para verificar el agente de la orden de trabajo.';
    $Self->{Translation}->{'Module to check whether no workorder agent is set.'} = 'Módulo para verificar si el agente de una orden de trabajo se ha establecido.';
    $Self->{Translation}->{'Module to check whether the agent is contained in the configured list.'} =
        'Módulo para verificar si el agente está incluido en la lista de configuración.';
    $Self->{Translation}->{'Module to show a link to create a change from this ticket. The ticket will be automatically linked with the new change.'} =
        'Módulo que muestra un vínculo para crear un cambio de este ticket. El ticket se vinculará automaticamente con el cambio nuevo.';
    $Self->{Translation}->{'Move Time Slot.'} = '';
    $Self->{Translation}->{'Move all workorders in time.'} = '';
    $Self->{Translation}->{'Only users of these groups have the permission to use the ticket types as defined in "ITSMChange::AddChangeLinkTicketTypes" if the feature "Ticket::Acl::Module###200-Ticket::Acl::Module" is enabled.'} =
        'Sólo los usuarios que pertenezcan a estos grupos tendrán permiso de usar los tipos de tickets, tal y como se define en "ITSMChange::AddChangeLinkTicketTypes" si la funcionalidad "Ticket::Acl::Module###200-Ticket::Acl::Module" está habilitada.';
    $Self->{Translation}->{'Overview over all Changes.'} = '';
    $Self->{Translation}->{'PIR'} = '';
    $Self->{Translation}->{'PSA'} = 'PSA';
    $Self->{Translation}->{'Parameters for the UserCreateWorkOrderNextMask object in the preference view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the pages (in which the changes are shown) of the small change overview.'} =
        '';
    $Self->{Translation}->{'Presents a link in the menu to show the involved persons in a change, in the zoom view of such change in the agent interface.'} =
        'Presenta un vínculo en el menú para mostrar a las personas involucradas en un cambio, en la vista detallada de dicho cambio de la interfaz del agente.';
    $Self->{Translation}->{'Print the change.'} = '';
    $Self->{Translation}->{'Print the workorder.'} = '';
    $Self->{Translation}->{'Projected Service Availability'} = '';
    $Self->{Translation}->{'Projected Service Availability (PSA)'} = 'Disponibilidad Proyectada del Servicio (PSA)';
    $Self->{Translation}->{'Projected Service Availability (PSA) of changes. Overview of approved changes and their services.'} =
        '';
    $Self->{Translation}->{'Required privileges in order for an agent to take a workorder.'} =
        'Privilegios necesarios para que un agente tome una orden de trabajo.';
    $Self->{Translation}->{'Required privileges to access the overview of all changes.'} = 'Permisos necesarios para acceder a la vista de resumen de todos los cambios.';
    $Self->{Translation}->{'Required privileges to add a workorder.'} = 'Privilegios necesarios para agregar una orden de trabajo.';
    $Self->{Translation}->{'Required privileges to change the workorder agent.'} = 'Privilegios necesarios para modificar el agente de una orden de trabajo.';
    $Self->{Translation}->{'Required privileges to create a template from a change.'} = 'Privilegios necesarios para crear una plantilla a partir de un cambio.';
    $Self->{Translation}->{'Required privileges to create a template from a changes\' CAB.'} =
        'Privilegios necesarios para crear una platilla a partir de un CAB de cambios.';
    $Self->{Translation}->{'Required privileges to create a template from a workorder.'} = 'Privilegios necesarios para crear una plantilla a partir de una orden de trabajo.';
    $Self->{Translation}->{'Required privileges to create changes from templates.'} = 'Privilegios requeridos para crear cambios basados en plantillas.';
    $Self->{Translation}->{'Required privileges to create changes.'} = 'Privilegios necesarios para crear cambios.';
    $Self->{Translation}->{'Required privileges to delete a template.'} = 'Privilegios necesarios para eliminar una plantilla.';
    $Self->{Translation}->{'Required privileges to delete a workorder.'} = 'Privilegios necesarios para eliminar una orden de trabajo.';
    $Self->{Translation}->{'Required privileges to delete changes.'} = 'Privilegios requeridos para eliminar cambios.';
    $Self->{Translation}->{'Required privileges to edit a template.'} = 'Privilegios necesarios para modificar una plantilla.';
    $Self->{Translation}->{'Required privileges to edit a workorder.'} = 'Privilegios necesarios para modificar una orden de trabajo.';
    $Self->{Translation}->{'Required privileges to edit changes.'} = 'Privilegios necesarios para modificar cambios.';
    $Self->{Translation}->{'Required privileges to edit the conditions of changes.'} = 'Privilegios necesarios para modificar las condiciones de los cambios.';
    $Self->{Translation}->{'Required privileges to edit the content of a template.'} = 'Privilegios requeridos para editar el contenido de una plantilla.';
    $Self->{Translation}->{'Required privileges to edit the involved persons of a change.'} =
        'Privilegios necesarios para modificar la lista de personas involucradas en un cambio.';
    $Self->{Translation}->{'Required privileges to move changes in time.'} = 'Privilegios necesarios para mover cambios en el tiempo.';
    $Self->{Translation}->{'Required privileges to print a change.'} = 'Privilegios necesarios para imprimir un cambio.';
    $Self->{Translation}->{'Required privileges to reset changes.'} = 'Privilegios requeridos para reajustar cambios.';
    $Self->{Translation}->{'Required privileges to view a workorder.'} = 'Privilegios necesarios para ver una orden de trabajo.';
    $Self->{Translation}->{'Required privileges to view changes.'} = 'Privilegios necesarios para ver los cambios.';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is a CAB member.'} =
        'Privilegios necesarios para ver la lista de los cambios, donde el usuario es un miembro del CAB.';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is the change manager.'} =
        'Privilegios necesarios para ver la lista de los cambios, donde el usuario es el administrador de cambios.';
    $Self->{Translation}->{'Required privileges to view overview over all templates.'} = 'Permisos necesarios para acceder a la vista de resumen de todas las plantillas.';
    $Self->{Translation}->{'Required privileges to view the conditions of changes.'} = 'Privilegios necesarios para ver las condiciones de los cambios.';
    $Self->{Translation}->{'Required privileges to view the history of a change.'} = 'Privilegios necesarios para ver la historia de los cambios.';
    $Self->{Translation}->{'Required privileges to view the history of a workorder.'} = 'Privilegios necesarios para ver la historia de una orden de trabajo.';
    $Self->{Translation}->{'Required privileges to view the history zoom of a change.'} = 'Privilegios necesarios para acceder a la vista detallada de la historia de los cambios.';
    $Self->{Translation}->{'Required privileges to view the history zoom of a workorder.'} =
        'Privilegios necesarios para ver la vista detallada de la historia de una orden de trabajo.';
    $Self->{Translation}->{'Required privileges to view the list of Change Schedule.'} = 'Privilegios necesarios para ver la lista de la agenda de los cambios.';
    $Self->{Translation}->{'Required privileges to view the list of change PSA.'} = 'Privilegios necesarios para ver la lista de la PSA de los cambios.';
    $Self->{Translation}->{'Required privileges to view the list of changes with an upcoming PIR (Post Implementation Review).'} =
        'Privilegios necesarios para ver la lista de cambios con un PIR (Revisión Post Implementación) próximo.';
    $Self->{Translation}->{'Required privileges to view the list of own changes.'} = 'Privilegios necesarios para ver una lista de mis cambios propios.';
    $Self->{Translation}->{'Required privileges to view the list of own workorders.'} = 'Privilegios necesarios para ver una lista de mis órdenes de trabajo propias.';
    $Self->{Translation}->{'Required privileges to write a report for the workorder.'} = 'Privilegios necesarios para hacer un reporte de una orden de trabajo.';
    $Self->{Translation}->{'Reset a change and its workorders.'} = '';
    $Self->{Translation}->{'Reset change and its workorders.'} = '';
    $Self->{Translation}->{'Run task to check if specific times have been reached in changes and workorders.'} =
        '';
    $Self->{Translation}->{'Save change as a template.'} = '';
    $Self->{Translation}->{'Save workorder as a template.'} = '';
    $Self->{Translation}->{'Schedule'} = '';
    $Self->{Translation}->{'Screen after creating a workorder'} = 'Pantalla posterior a la creación de una orden de trabajo';
    $Self->{Translation}->{'Search Changes.'} = 'Buscar Cambios.';
    $Self->{Translation}->{'Selects the change number generator module. "AutoIncrement" increments the change number, the SystemID and the counter are used with SystemID.counter format (e.g. 100118, 100119). With "Date", the change numbers will be generated by the current date and a counter; this format looks like Year.Month.Day.counter, e.g. 2010062400001, 2010062400002. With "DateChecksum", the counter will be appended as checksum to the string of date plus the SystemID. The checksum will be rotated on a daily basis. This format looks like Year.Month.Day.SystemID.Counter.CheckSum, e.g. 2010062410000017, 2010062410000026.'} =
        '';
    $Self->{Translation}->{'Set the agent for the workorder.'} = '';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        'Establecer la altura predeterminada (en píxeles) de los campos HTML «inline» de AgentITSMChangeZoom y  AgentITSMWorkOrderZoom.';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        'Establecer la altura predeterminada (en píxeles) de los campos HTML «inline» de AgentITSMChangeZoom y  AgentITSMWorkOrderZoom.';
    $Self->{Translation}->{'Sets the minimal change counter size (if "AutoIncrement" was selected as ITSMChange::NumberGenerator). Default is 5, this means the counter starts from 10000.'} =
        '';
    $Self->{Translation}->{'Sets up the state machine for changes.'} = 'Configura la máquina de estados para los cambios.';
    $Self->{Translation}->{'Sets up the state machine for workorders.'} = 'Configura la máquina de estados para las órdenes de trabajo';
    $Self->{Translation}->{'Shows a checkbox in the AgentITSMWorkOrderEdit screen that defines if the the following workorders should also be moved if a workorder is modified and the planned end time has changed.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows changing the workorder agent, in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a change as a template in the zoom view of the change, in the agent interface.'} =
        'Muestra un vínculo en el menú que permite definir un cambio como una plantilla, en la vista detallada de dicho cambio, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a workorder as a template in the zoom view of the workorder, in the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows editing the report of a workorder, in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a change with another object in the change zoom view of the agent interface.'} =
        'Muestra un link en el menú para vincular un cambio con otro objeto, en la vista detallada de dicho cambio de la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a workorder with another object in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows moving the time slot of a change in its zoom view of the agent interface.'} =
        'Muestra un vínculo en el menú que permite mover el periodo de tiempo de un cambio, en su vista detallada de la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu that allows taking a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the conditions of a change in the its zoom view of the agent interface.'} =
        'Muestra un vínculo en el menú para acceder a las condiciones de un cambio en su vista detallada de la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a change in the its zoom view of the agent interface.'} =
        'Muestra un link en el menú para acceder a la historia de un cambio en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to add a workorder in the change zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to delete a change in its zoom view of the agent interface.'} =
        'Muestra un vínculo en el menú para eliminar un cambio en la vista de zoom o en la interfaz de agente.';
    $Self->{Translation}->{'Shows a link in the menu to delete a workorder in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a change in the its zoom view of the agent interface.'} =
        'Muestra un link en el menú para editar un cambio en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to edit a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the change zoom view of the agent interface.'} =
        'Muestra un link en el menú para regresar en la vista detallada de un cambio de la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the workorder zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a change in the its zoom view of the agent interface.'} =
        'Muestra un link en el menú para imprimir un cambio en su vista detallada, en la interfaz del agente.';
    $Self->{Translation}->{'Shows a link in the menu to print a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to reset a change and its workorders in its zoom view of the agent interface.'} =
        'Muestra un vínculo en el menú para reajustar un cambio y sus ordenes de trabajo en la vista de zoom o en la interfaz de agente.';
    $Self->{Translation}->{'Shows the change history (reverse ordered) in the agent interface.'} =
        'Muestra la historia del cambio (ordenado inversamente) en la interfaz del agente.';
    $Self->{Translation}->{'State Machine'} = 'Máquina de Estados';
    $Self->{Translation}->{'Stores change and workorder ids and their corresponding template id, while a user is editing a template.'} =
        '';
    $Self->{Translation}->{'Take Workorder.'} = '';
    $Self->{Translation}->{'Take the workorder.'} = '';
    $Self->{Translation}->{'Template.'} = 'Plantilla.';
    $Self->{Translation}->{'The identifier for a change, e.g. Change#, MyChange#. The default is Change#.'} =
        'Identificador de un cambio, por ejemplo: Cambio#, MiCambio#. El default es Change#.';
    $Self->{Translation}->{'The identifier for a workorder, e.g. Workorder#, MyWorkorder#. The default is Workorder#.'} =
        'Identificador de una orden de trabajo, por ejemplo: OrdenDeTrabajo#, MiOrdenDeTrabajo#. El default es Workorder#.';
    $Self->{Translation}->{'This ACL module restricts the usuage of the ticket types that are defined in the sysconfig option \'ITSMChange::AddChangeLinkTicketTypes\', to users of the groups as defined in "ITSMChange::RestrictTicketTypes::Groups". As this ACL could collide with other ACLs which are also related to the ticket type, this sysconfig option is disabled by default and should only be activated if needed.'} =
        '';
    $Self->{Translation}->{'Time Slot'} = 'Periodo de tiempo';
    $Self->{Translation}->{'Types of tickets, where in the ticket zoom view a link to add a change will be displayed.'} =
        'Tipos de tickets en cuya vista detallada aparecerá un vínculo para agregar un cambio.';
    $Self->{Translation}->{'User Search'} = 'Búsqueda de Usuario';
    $Self->{Translation}->{'Workorder Add (from template).'} = '';
    $Self->{Translation}->{'Workorder Add.'} = '';
    $Self->{Translation}->{'Workorder Agent'} = '';
    $Self->{Translation}->{'Workorder Agent.'} = '';
    $Self->{Translation}->{'Workorder Delete.'} = '';
    $Self->{Translation}->{'Workorder Edit.'} = '';
    $Self->{Translation}->{'Workorder History Zoom.'} = 'Vista detallada del Historial de la Orden de trabajo.';
    $Self->{Translation}->{'Workorder History.'} = '';
    $Self->{Translation}->{'Workorder Report.'} = '';
    $Self->{Translation}->{'Workorder Zoom.'} = 'Vista detallada de la Orden de trabajo.';
    $Self->{Translation}->{'once'} = '';
    $Self->{Translation}->{'regularly'} = '';

}

1;
