# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_ITSMChangeManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMChangeManagement
    $Self->{Translation}->{'ITSMChange'} = 'Change';
    $Self->{Translation}->{'ITSMChanges'} = 'Changes';
    $Self->{Translation}->{'ITSM Changes'} = 'Changes';
    $Self->{Translation}->{'workorder'} = 'Arbeitsauftrag';
    $Self->{Translation}->{'A change must have a title!'} = 'Ein Change benötigt einen Titel!';
    $Self->{Translation}->{'A condition must have a name!'} = 'Eine Bedingung benötigt einen Namen!';
    $Self->{Translation}->{'A template must have a name!'} = 'Eine Vorlage benötigt einen Namen!';
    $Self->{Translation}->{'A workorder must have a title!'} = 'Ein Arbeitsauftrag benötigt einen Titel!';
    $Self->{Translation}->{'Add CAB Template'} = 'Eine CAB-Vorlage hinzufügen';
    $Self->{Translation}->{'Add Workorder'} = 'Arbeitsauftrag hinzufügen';
    $Self->{Translation}->{'Add a workorder to the change'} = 'Füge einen Arbeitsauftrag zu dieser Änderung hinzu';
    $Self->{Translation}->{'Add new condition and action pair'} = 'Füge ein neues Bedingungs- und Aktions-Paar hinzu';
    $Self->{Translation}->{'Agent interface module to show the ChangeManager overview icon.'} =
        'Modul zum Anzeigen des ChangeManager-Übersichts-Icons.';
    $Self->{Translation}->{'Agent interface module to show the MyCAB overview icon.'} = 'Modul zum Anzeigen des MyCAB-Übersichts-Icons.';
    $Self->{Translation}->{'Agent interface module to show the MyChanges overview icon.'} = 'Modul zum Anzeigen des MyChanges-Übersichts-Icons.';
    $Self->{Translation}->{'Agent interface module to show the MyWorkOrders overview icon.'} =
        'Modul zum Anzeigen des MeineArbeitsaufträge-Übersichtssymbols.';
    $Self->{Translation}->{'CABAgents'} = 'CAB Agents';
    $Self->{Translation}->{'CABCustomers'} = 'CAB Kunden';
    $Self->{Translation}->{'Change Overview'} = 'Änderungsübersicht';
    $Self->{Translation}->{'Change Schedule'} = 'Change Schedule';
    $Self->{Translation}->{'Change involved persons of the change'} = 'Bearbeite beteiligte Personen dieses Changes';
    $Self->{Translation}->{'ChangeHistory::ActionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ActionAddID'} = 'Neue Action (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ActionDelete'} = 'Action (ID=%s) gelöscht';
    $Self->{Translation}->{'ChangeHistory::ActionDeleteAll'} = 'Alle Aktionen von Bedingung (ID=%s) gelöscht';
    $Self->{Translation}->{'ChangeHistory::ActionExecute'} = 'Aktion (ID=%s) ausgeführt: %s';
    $Self->{Translation}->{'ChangeHistory::ActionUpdate'} = '%s (Action ID=%s): Neu: %s <- Alt: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeActualEndTimeReached'} = 'Change (ID=%s) wurde beendet.';
    $Self->{Translation}->{'ChangeHistory::ChangeActualStartTimeReached'} = 'Change (ID=%s) hat begonnen.';
    $Self->{Translation}->{'ChangeHistory::ChangeAdd'} = 'Neuer Change (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentAdd'} = 'Neuer Anhang: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentDelete'} = 'Anhang gelöscht: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeCABDelete'} = 'CAB gelöscht %s';
    $Self->{Translation}->{'ChangeHistory::ChangeCABUpdate'} = '%s: Neu: %s <- Alt: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkAdd'} = 'Link zu %s (ID=%s) hinzugefügt';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkDelete'} = 'Link zu %s (ID=%s) gelöscht';
    $Self->{Translation}->{'ChangeHistory::ChangeNotificationSent'} = 'Benachrichtigung an %s geschickt (Event: %s)';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedEndTimeReached'} = 'Change (ID=%s) hat geplante Endzeit erreicht.';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedStartTimeReached'} = 'Change (ID=%s) hat geplante Startzeit erreicht.';
    $Self->{Translation}->{'ChangeHistory::ChangeRequestedTimeReached'} = 'Change (ID=%s) hat gewünschte Endzeit erreicht.';
    $Self->{Translation}->{'ChangeHistory::ChangeUpdate'} = '%s: Neu: %s <- Alt: %s';
    $Self->{Translation}->{'ChangeHistory::ConditionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ConditionAddID'} = 'Neue Bedingung (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ConditionDelete'} = 'Bedingung (ID=%s) gelöscht';
    $Self->{Translation}->{'ChangeHistory::ConditionDeleteAll'} = 'Alle Bedingungen von Change (ID=%s) gelöscht';
    $Self->{Translation}->{'ChangeHistory::ConditionUpdate'} = '%s (Bedingung ID=%s): Neu: %s <- Alt: %s';
    $Self->{Translation}->{'ChangeHistory::ExpressionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ExpressionAddID'} = 'Neue Expression (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ExpressionDelete'} = 'Expression (ID=%s) gelöscht';
    $Self->{Translation}->{'ChangeHistory::ExpressionDeleteAll'} = 'Alle logischen Ausdrücke von Bedingung (ID=%s) gelöscht';
    $Self->{Translation}->{'ChangeHistory::ExpressionUpdate'} = '%s (Expression ID=%s): Neu: %s <- Alt: %s';
    $Self->{Translation}->{'ChangeNumber'} = 'Change Nummer';
    $Self->{Translation}->{'Condition Edit'} = 'Bedingung bearbeiten';
    $Self->{Translation}->{'Create Change'} = 'Change erstellen';
    $Self->{Translation}->{'Create a change from this ticket!'} = 'Einen Change aus diesem Ticket erstellen!';
    $Self->{Translation}->{'Delete Workorder'} = 'Diesen Arbeitsauftrag löschen';
    $Self->{Translation}->{'Edit the change'} = 'Diesen Change bearbeiten';
    $Self->{Translation}->{'Edit the conditions of the change'} = 'Bearbeite die Bedingungen dieses Changes';
    $Self->{Translation}->{'Edit the workorder'} = 'Diesen Arbeitsauftrag bearbeiten';
    $Self->{Translation}->{'Expression'} = 'Logischer Ausdruck';
    $Self->{Translation}->{'Full-Text Search in Change and Workorder'} = 'Volltextsuche in Änderung und Arbeitsauftrag';
    $Self->{Translation}->{'ITSMCondition'} = 'Bedingung';
    $Self->{Translation}->{'ITSMWorkOrder'} = 'Arbeitsauftrag';
    $Self->{Translation}->{'Link another object to the change'} = 'Verknüpfe ein anderes Objekt mit diesem Change';
    $Self->{Translation}->{'Link another object to the workorder'} = 'Verknüpfe ein anderes Objekt mit diesem Arbeitsauftrag';
    $Self->{Translation}->{'Move all workorders in time'} = 'Verschiebe alle Arbeitsaufträge um eine neue zeitliche Differenz';
    $Self->{Translation}->{'My CABs'} = 'Meine CABs';
    $Self->{Translation}->{'My Changes'} = 'Meine Changes';
    $Self->{Translation}->{'My Workorders'} = 'Meine Arbeitsaufträge';
    $Self->{Translation}->{'No XXX settings'} = 'Keine \'%s\' Auswahl';
    $Self->{Translation}->{'PIR (Post Implementation Review)'} = 'PIR (Post Implementation Review)';
    $Self->{Translation}->{'PSA (Projected Service Availability)'} = 'PSA (Projected Service Availability)';
    $Self->{Translation}->{'Please select first a catalog class!'} = 'Bitte wählen Sie zuerst eine Katalog Klasse aus!';
    $Self->{Translation}->{'Print the change'} = 'Diesen Change drucken';
    $Self->{Translation}->{'Print the workorder'} = 'Diesen Arbeitsauftrag drucken';
    $Self->{Translation}->{'RequestedTime'} = 'Wunschtermin';
    $Self->{Translation}->{'Save Change CAB as Template'} = 'Speichere Change-CAB als Vorlage';
    $Self->{Translation}->{'Save change as a template'} = 'Speichere diesen Change als Vorlage';
    $Self->{Translation}->{'Save workorder as a template'} = 'Arbeitsauftrag als Vorlage speichern';
    $Self->{Translation}->{'Search Changes'} = 'Suche Changes';
    $Self->{Translation}->{'Set the agent for the workorder'} = 'Einen Agenten für diesen Arbeitsauftrag festlegen';
    $Self->{Translation}->{'Take Workorder'} = 'Arbeitsauftrag übernehmen';
    $Self->{Translation}->{'Take the workorder'} = 'Diesen Arbeitsauftrag übernehmen';
    $Self->{Translation}->{'Template Overview'} = 'Vorlagenübersicht';
    $Self->{Translation}->{'The planned end time is invalid!'} = 'Die geplante Endzeit ist ungültig!';
    $Self->{Translation}->{'The planned start time is invalid!'} = 'Die geplante Startzeit ist ungültig!';
    $Self->{Translation}->{'The planned time is invalid!'} = 'Der geplante Zeitraum ist ungültig!';
    $Self->{Translation}->{'The requested time is invalid!'} = 'Die angegebene Zeit ist ungültig!';
    $Self->{Translation}->{'New (from template)'} = 'Neu (von Template)';
    $Self->{Translation}->{'Add from template'} = 'Von Template hinzufügen';
    $Self->{Translation}->{'Add Workorder (from template)'} = 'Arbeitsauftrag hinzufügen (aus Vorlage)';
    $Self->{Translation}->{'Add a workorder (from template) to the change'} = 'Füge eine nArbeitsauftrag (aus Vorlage) zu dieser Änderung hinzu';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReached'} = 'WorkOrderHistory::WorkOrderActualEndTimeReached';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReachedWithWorkOrderID'} =
        'WorkOrderHistory::WorkOrderActualEndTimeReachedWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReached'} = 'WorkOrderHistory::WorkOrderActualStartTimeReached';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReachedWithWorkOrderID'} =
        'WorkOrderHistory::WorkOrderActualStartTimeReachedWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAdd'} = 'WorkOrderHistory::WorkOrderAdd';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAddWithWorkOrderID'} = 'WorkOrderHistory::WorkOrderAddWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAdd'} = 'WorkOrderHistory::WorkOrderAttachmentAdd';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAddWithWorkOrderID'} = 'WorkOrderHistory::WorkOrderAttachmentAddWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDelete'} = 'WorkOrderHistory::WorkOrderAttachmentDelete';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDeleteWithWorkOrderID'} = 'WorkOrderHistory::WorkOrderAttachmentDeleteWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAdd'} = 'WorkOrderHistory::WorkOrderReportAttachmentAdd';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAddWithWorkOrderID'} =
        'WorkOrderHistory::WorkOrderReportAttachmentAddWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDelete'} = 'WorkOrderHistory::WorkOrderReportAttachmentDelete';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDeleteWithWorkOrderID'} =
        'WorkOrderHistory::WorkOrderReportAttachmentDeleteWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDelete'} = 'WorkOrderHistory::WorkOrderDelete';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDeleteWithWorkOrderID'} = 'WorkOrderHistory::WorkOrderDeleteWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAdd'} = 'WorkOrderHistory::WorkOrderLinkAdd';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAddWithWorkOrderID'} = 'WorkOrderHistory::WorkOrderLinkAddWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDelete'} = 'WorkOrderHistory::WorkOrderLinkDelete';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDeleteWithWorkOrderID'} = 'WorkOrderHistory::WorkOrderLinkDeleteWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSent'} = 'WorkOrderHistory::WorkOrderNotificationSent';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSentWithWorkOrderID'} = 'WorkOrderHistory::WorkOrderNotificationSentWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReached'} = 'WorkOrderHistory::WorkOrderPlannedEndTimeReached';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReachedWithWorkOrderID'} =
        'WorkOrderHistory::WorkOrderPlannedEndTimeReachedWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReached'} = 'WorkOrderHistory::WorkOrderPlannedStartTimeReached';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReachedWithWorkOrderID'} =
        'WorkOrderHistory::WorkOrderPlannedStartTimeReachedWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdate'} = 'WorkOrderHistory::WorkOrderUpdate';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdateWithWorkOrderID'} = 'WorkOrderHistory::WorkOrderUpdateWithWorkOrderID';
    $Self->{Translation}->{'WorkOrderNumber'} = 'Arbeitsauftragnummer';
    $Self->{Translation}->{'accepted'} = 'Accepted';
    $Self->{Translation}->{'any'} = 'beliebige';
    $Self->{Translation}->{'approval'} = 'Genehmigung';
    $Self->{Translation}->{'approved'} = 'Approved';
    $Self->{Translation}->{'backout'} = 'Backout Plan';
    $Self->{Translation}->{'begins with'} = 'beginnt mit';
    $Self->{Translation}->{'canceled'} = 'Canceled';
    $Self->{Translation}->{'contains'} = 'enthält';
    $Self->{Translation}->{'created'} = 'Created';
    $Self->{Translation}->{'decision'} = 'Entscheidung';
    $Self->{Translation}->{'ends with'} = 'endet mit';
    $Self->{Translation}->{'failed'} = 'Failed';
    $Self->{Translation}->{'in progress'} = 'In Progress';
    $Self->{Translation}->{'is'} = 'ist';
    $Self->{Translation}->{'is after'} = 'ist nach';
    $Self->{Translation}->{'is before'} = 'ist vor';
    $Self->{Translation}->{'is empty'} = 'ist leer';
    $Self->{Translation}->{'is greater than'} = 'ist grösser als';
    $Self->{Translation}->{'is less than'} = 'ist kleiner als';
    $Self->{Translation}->{'is not'} = 'ist nicht';
    $Self->{Translation}->{'is not empty'} = 'ist nicht leer';
    $Self->{Translation}->{'not contains'} = 'enthält nicht';
    $Self->{Translation}->{'pending approval'} = 'Pending Approval';
    $Self->{Translation}->{'pending pir'} = 'Pending PIR';
    $Self->{Translation}->{'pir'} = 'PIR (Post Implementation Review)';
    $Self->{Translation}->{'ready'} = 'Ready';
    $Self->{Translation}->{'rejected'} = 'Rejected';
    $Self->{Translation}->{'requested'} = 'Requested';
    $Self->{Translation}->{'retracted'} = 'Retracted';
    $Self->{Translation}->{'set'} = 'setze';
    $Self->{Translation}->{'successful'} = 'Successful';

    # Template: AdminITSMChangeCIPAllocate
    $Self->{Translation}->{'Category <-> Impact <-> Priority'} = 'Kategorie <-> Auswirkung <-> Priorität';
    $Self->{Translation}->{'Manage the priority result of combinating Category <-> Impact.'} =
        'Verwaltung der Priorität aus der Kombination von Kategorie <-> Impact.';
    $Self->{Translation}->{'Priority allocation'} = 'Priorität zuordnen';

    # Template: AdminITSMChangeNotification
    $Self->{Translation}->{'ITSM ChangeManagement Notification Management'} = 'ITSM ChangeManagement Benachrichtigungs-Verwaltung';
    $Self->{Translation}->{'Add Notification Rule'} = 'Benachrichtigungs-Regel';
    $Self->{Translation}->{'Rule'} = 'Regel';
    $Self->{Translation}->{'A notification should have a name!'} = 'Eine Benachrichtigung benötigt einen Namen!';
    $Self->{Translation}->{'Name is required.'} = 'Name ist erforderlich.';

    # Template: AdminITSMStateMachine
    $Self->{Translation}->{'Admin State Machine'} = 'Admin State Machine';
    $Self->{Translation}->{'Select a catalog class!'} = 'Wählen Sie eine Katalog-Klasse aus!';
    $Self->{Translation}->{'A catalog class is required!'} = 'Eine Katalog-Klasse ist erforderlich!';
    $Self->{Translation}->{'Add a state transition'} = 'Hinzufügen eines Status-Übergangs';
    $Self->{Translation}->{'Catalog Class'} = 'Katalog-Klasse';
    $Self->{Translation}->{'Object Name'} = 'Objekt-Name';
    $Self->{Translation}->{'Overview over state transitions for'} = 'Übersicht über Statusübergänge für';
    $Self->{Translation}->{'Delete this state transition'} = 'Löschen dieses Status-Übergangs';
    $Self->{Translation}->{'Add a new state transition for'} = 'Hinzufügen eines neuen Status-Übergangs für';
    $Self->{Translation}->{'Please select a state!'} = 'Bitte wählen Sie einen Status!';
    $Self->{Translation}->{'Please select a next state!'} = 'Bitte wählen sie den Folge-Status!';
    $Self->{Translation}->{'Edit a state transition for'} = 'Bearbeiten eines Status-Übergangs für';
    $Self->{Translation}->{'Do you really want to delete the state transition'} = 'Wollen Sie diesen Status-Übergang wirklich löschen?';

    # Template: AgentITSMChangeAdd
    $Self->{Translation}->{'Add Change'} = 'Change hinzufügen';
    $Self->{Translation}->{'ITSM Change'} = 'Change';
    $Self->{Translation}->{'Justification'} = 'Begründung';
    $Self->{Translation}->{'Input invalid.'} = 'Ungültige Eingabe.';
    $Self->{Translation}->{'Impact'} = 'Auswirkung';
    $Self->{Translation}->{'Requested Date'} = 'Wunschtermin';

    # Template: AgentITSMChangeAddFromTemplate
    $Self->{Translation}->{'Select Change Template'} = 'Change-Vorlage auswählen';
    $Self->{Translation}->{'Time type'} = 'Zeit-Typ';
    $Self->{Translation}->{'Invalid time type.'} = 'Ungültiger Zeit-Typ.';
    $Self->{Translation}->{'New time'} = 'Neue Zeit';

    # Template: AgentITSMChangeCABTemplate
    $Self->{Translation}->{'Save Change CAB as template'} = 'Diesen Change als Vorlage speichern';
    $Self->{Translation}->{'go to involved persons screen'} = 'gehe zum Screen "Beteiligte Personen"';
    $Self->{Translation}->{'Invalid Name'} = 'Ungültiger Name';

    # Template: AgentITSMChangeCondition
    $Self->{Translation}->{'Conditions and Actions'} = 'Bedingungen und Aktionen';
    $Self->{Translation}->{'Delete Condition'} = 'Bedingung löschen';
    $Self->{Translation}->{'Add new condition'} = 'Bedingung hinzufügen';

    # Template: AgentITSMChangeConditionEdit
    $Self->{Translation}->{'Edit Condition'} = 'Bedingung bearbeiten';
    $Self->{Translation}->{'Need a valid name.'} = 'Ein gültiger Name ist erforderlich.';
    $Self->{Translation}->{'A valid name is needed.'} = 'Ein gültiger Name ist erforderlich.';
    $Self->{Translation}->{'Duplicate name:'} = 'Doppelter Name:';
    $Self->{Translation}->{'This name is already used by another condition.'} = 'Dieser Name wird bereits von einer anderen Bedingung verwendet.';
    $Self->{Translation}->{'Matching'} = 'Übereinstimmung';
    $Self->{Translation}->{'Any expression (OR)'} = 'Beliebiger logischer Ausdruck (ODER)';
    $Self->{Translation}->{'All expressions (AND)'} = 'Alle logischen Ausdrücke (UND)';
    $Self->{Translation}->{'Expressions'} = 'Logische Ausdrücke';
    $Self->{Translation}->{'Selector'} = 'Selektor';
    $Self->{Translation}->{'Operator'} = 'Operator';
    $Self->{Translation}->{'Delete Expression'} = 'Ausdruck löschen';
    $Self->{Translation}->{'No Expressions found.'} = 'Keinen logischen Ausdruck gefunden.';
    $Self->{Translation}->{'Add new expression'} = 'Füge einen neuen logischen Ausdruck hinzu';
    $Self->{Translation}->{'Delete Action'} = 'Aktion löschen';
    $Self->{Translation}->{'No Actions found.'} = 'Keine Aktionen gefunden.';
    $Self->{Translation}->{'Add new action'} = 'Füge eine neue Aktion hinzu';

    # Template: AgentITSMChangeDelete
    $Self->{Translation}->{'Do you really want to delete this change?'} = 'Möchten Sie diesen Change wirklich löschen?';

    # Template: AgentITSMChangeHistory
    $Self->{Translation}->{'History of'} = 'Änderungsverlauf von';
    $Self->{Translation}->{'Workorder'} = 'Arbeitsauftrag';
    $Self->{Translation}->{'Show details'} = 'Details anzeigen';
    $Self->{Translation}->{'Show workorder'} = 'Arbeitsauftrag anzeigen';

    # Template: AgentITSMChangeHistoryZoom
    $Self->{Translation}->{'Detailed history information of'} = 'Detailierte Historien-Informationen von';
    $Self->{Translation}->{'Modified'} = 'Modifiziert';
    $Self->{Translation}->{'Old Value'} = 'Alter Wert';
    $Self->{Translation}->{'New Value'} = 'Neuer Wert';

    # Template: AgentITSMChangeInvolvedPersons
    $Self->{Translation}->{'Involved Persons'} = 'Beteiligte Personen';
    $Self->{Translation}->{'ChangeManager'} = 'Change-Manager';
    $Self->{Translation}->{'User invalid.'} = 'Ungültiger Benutzer';
    $Self->{Translation}->{'ChangeBuilder'} = 'Change-Builder';
    $Self->{Translation}->{'Change Advisory Board'} = 'Change-Advisory-Board';
    $Self->{Translation}->{'CAB Template'} = 'CAB-Vorlage';
    $Self->{Translation}->{'Apply Template'} = 'Vorlage anwenden';
    $Self->{Translation}->{'NewTemplate'} = 'Neue Vorlage';
    $Self->{Translation}->{'Save this CAB as template'} = 'Dieses CAB als Vorlage speichern';
    $Self->{Translation}->{'Add to CAB'} = 'Zum CAB hinzufügen';
    $Self->{Translation}->{'Invalid User'} = 'Ungültiger Benutzer';
    $Self->{Translation}->{'Current CAB'} = 'Aktuelles CAB';

    # Template: AgentITSMChangeOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Kontext-Einstellungen';
    $Self->{Translation}->{'Changes per page'} = 'Changes pro Seite';

    # Template: AgentITSMChangeOverviewSmall
    $Self->{Translation}->{'WorkOrderTitle'} = 'Arbeitsauftragtitel';
    $Self->{Translation}->{'ChangeTitle'} = 'Change-Titel';
    $Self->{Translation}->{'WorkOrderAgent'} = 'Arbeitsauftragagent';
    $Self->{Translation}->{'Workorders'} = 'Arbeitsaufträge';
    $Self->{Translation}->{'ChangeState'} = 'Change-Status';
    $Self->{Translation}->{'WorkOrderState'} = 'Arbeitsauftragstatus';
    $Self->{Translation}->{'WorkOrderType'} = 'Arbeitsauftragtyp';
    $Self->{Translation}->{'Requested Time'} = 'Wunschtermin';
    $Self->{Translation}->{'PlannedStartTime'} = 'Geplanter Start';
    $Self->{Translation}->{'PlannedEndTime'} = 'Geplantes Ende';
    $Self->{Translation}->{'ActualStartTime'} = 'Tatsächlicher Start';
    $Self->{Translation}->{'ActualEndTime'} = 'Tatsächliches Ende';

    # Template: AgentITSMChangeReset
    $Self->{Translation}->{'Do you really want to reset this change?'} = 'Möchten Sie diesen Change wirklich zurücksetzen?';

    # Template: AgentITSMChangeSearch
    $Self->{Translation}->{'(e.g. 10*5155 or 105658*)'} = '(z. B. 10*5155 or 105658*)';
    $Self->{Translation}->{'CABAgent'} = 'CAB Agent';
    $Self->{Translation}->{'e.g.'} = 'z. B.';
    $Self->{Translation}->{'CABCustomer'} = 'CAB Kunde';
    $Self->{Translation}->{'ITSM Workorder'} = 'ITSM Arbeitsauftrag';
    $Self->{Translation}->{'Instruction'} = 'Anweisung';
    $Self->{Translation}->{'Report'} = 'Bericht';
    $Self->{Translation}->{'Change Category'} = 'Change-Kategorie';
    $Self->{Translation}->{'(before/after)'} = '(vor/nach)';
    $Self->{Translation}->{'(between)'} = '(zwischen)';

    # Template: AgentITSMChangeTemplate
    $Self->{Translation}->{'Save Change as Template'} = 'Speichere Change als Vorlage';
    $Self->{Translation}->{'A template should have a name!'} = 'Eine Vorlage benötigt einen Namen!';
    $Self->{Translation}->{'The template name is required.'} = 'Der Vorlagen-Name ist erforderlich.';
    $Self->{Translation}->{'Reset States'} = 'Setze Status zurück';
    $Self->{Translation}->{'Overwrite original template'} = 'Original-Template überschreiben';
    $Self->{Translation}->{'Delete original change'} = 'Original-Change löschen';

    # Template: AgentITSMChangeTimeSlot
    $Self->{Translation}->{'Move Time Slot'} = 'Verschiebe Zeitfenster';

    # Template: AgentITSMChangeZoom
    $Self->{Translation}->{'Change Information'} = 'Change-Informationen';
    $Self->{Translation}->{'PlannedEffort'} = 'Geplanter Aufwand';
    $Self->{Translation}->{'Change Initiator(s)'} = 'Change Initiator(s)';
    $Self->{Translation}->{'Change Manager'} = 'Change-Manager';
    $Self->{Translation}->{'Change Builder'} = 'Change-Builder';
    $Self->{Translation}->{'CAB'} = 'CAB';
    $Self->{Translation}->{'Last changed'} = 'Zuletzt geändert';
    $Self->{Translation}->{'Last changed by'} = 'Zuletzt geändert von';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        'Um die Links im folgenden Beitrag zu öffnen, kann es notwendig sein Strg oder Shift zu drücken, während auf den Link geklickt wird (abhängig vom verwendeten Browser und Betriebssystem).';
    $Self->{Translation}->{'Download Attachment'} = 'Anhang herunterladen';

    # Template: AgentITSMTemplateEditCAB
    $Self->{Translation}->{'Edit CAB Template'} = 'CAB-Template bearbeiten';

    # Template: AgentITSMTemplateEditContent
    $Self->{Translation}->{'This will create a new change from this template, so you can edit and save it.'} =
        'Dieses wird einen neuen Change aus diesem Template erstellen, Sie können diesen editieren und speichern.';
    $Self->{Translation}->{'The new change will be deleted automatically after it has been saved as template.'} =
        'Der neue Change wird automatisch gelöscht, nachdem dieser als Template gespeichert wurde.';
    $Self->{Translation}->{'This will create a new workorder from this template, so you can edit and save it.'} =
        'Dieses wird einen neuen Arbeitsauftrag aus dieser Vorlage erstellen, Sie können diese editieren und speichern.';
    $Self->{Translation}->{'A temporary change will be created which contains the workorder.'} =
        'Eine temporäre Änderung wird erstellt, der den Arbeitsauftrag enthält.';
    $Self->{Translation}->{'The temporary change and new workorder will be deleted automatically after the workorder has been saved as template.'} =
        'Die temporäre Änderung und der neue Arbeitsauftrag wird automatisch gelöscht, nachdem der Arbeitsauftrag als Vorlage gespeichert wurde.';
    $Self->{Translation}->{'Do you want to proceed?'} = 'Möchten Sie fortfahren?';

    # Template: AgentITSMTemplateOverviewSmall
    $Self->{Translation}->{'TemplateID'} = 'Template-ID';
    $Self->{Translation}->{'Edit Content'} = 'Inhalt bearbeiten';
    $Self->{Translation}->{'CreateBy'} = 'Erstellt von';
    $Self->{Translation}->{'CreateTime'} = 'Erstellt';
    $Self->{Translation}->{'ChangeBy'} = 'Geändert von';
    $Self->{Translation}->{'ChangeTime'} = 'Geändert';
    $Self->{Translation}->{'Edit Template Content'} = 'Vorlageninhalt bearbeiten';
    $Self->{Translation}->{'Delete Template'} = 'Vorlage Löschen';

    # Template: AgentITSMWorkOrderAdd
    $Self->{Translation}->{'Add Workorder to'} = 'Arbeitsauftrag hinzufügen zu';
    $Self->{Translation}->{'Invalid workorder type.'} = 'Ungültiger Arbeitsauftragstyp';
    $Self->{Translation}->{'The planned start time must be before the planned end time!'} = 'Der geplante Start muss vor dem geplanten Ende liegen!';
    $Self->{Translation}->{'Invalid format.'} = 'Ungültiges Format.';

    # Template: AgentITSMWorkOrderAddFromTemplate
    $Self->{Translation}->{'Select Workorder Template'} = 'Arbeitsauftragsvorlage auswählen';

    # Template: AgentITSMWorkOrderDelete
    $Self->{Translation}->{'Do you really want to delete this workorder?'} = 'Möchten Sie diesen Arbeitsauftrag wirklich löschen?';
    $Self->{Translation}->{'You can not delete this Workorder. It is used in at least one Condition!'} =
        'Sie können diesen Arbeitsauftrag nicht löschen. Sie wird in mindestens einer Bedingung verwendet!';
    $Self->{Translation}->{'This Workorder is used in the following Condition(s)'} = 'Dieser Arbeitsauftrag findet Verwendung in den folgenden Bedingung(en)';

    # Template: AgentITSMWorkOrderEdit
    $Self->{Translation}->{'Move following workorders accordingly'} = 'Nachfolgende Arbeitsaufträge entsprechend verschieben';
    $Self->{Translation}->{'If the planned end time of this workorder is changed, the planned start times of all following workorders will be changed accordingly'} =
        'Wenn die gepplante Endzeit eines Arbeitsauftrags geändert wird, dann werden die nachfolgenden Arbeitsaufträge entsprechend verschoben';

    # Template: AgentITSMWorkOrderReport
    $Self->{Translation}->{'The actual start time must be before the actual end time!'} = 'Die tatsächliche Startzeit muss vor der tatsächlichen Endzeit liegen!';
    $Self->{Translation}->{'The actual start time must be set, when the actual end time is set!'} =
        'Die tatsächliche Startzeit muss angegeben wreden, wenn eine tatsächliche Endzeit angegeben wurde!';

    # Template: AgentITSMWorkOrderTake
    $Self->{Translation}->{'Current Agent'} = 'Aktueller Agent';
    $Self->{Translation}->{'Do you really want to take this workorder?'} = 'Wollen sie diesen Arbeitsauftrag wirklich übernehmen?';

    # Template: AgentITSMWorkOrderTemplate
    $Self->{Translation}->{'Save Workorder as Template'} = 'Arbeitsauftrag als Vorlage speichern';
    $Self->{Translation}->{'Delete original workorder (and surrounding change)'} = 'Original-Arbeitsauftrag (und der umgebenden Änderung) löschen';

    # Template: AgentITSMWorkOrderZoom
    $Self->{Translation}->{'Workorder Information'} = 'Arbeitsauftragsinformationen';

    # Perl Module: Kernel/Modules/AdminITSMChangeNotification.pm
    $Self->{Translation}->{'Unknown notification %s!'} = 'Unbekannte Benachrichtigung %s!';
    $Self->{Translation}->{'There was an error creating the notification.'} = 'Beim Erstellen der Benachrichtigung ist ein Fehler aufgetreten.';

    # Perl Module: Kernel/Modules/AgentITSMChange.pm
    $Self->{Translation}->{'Overview: ITSM Changes'} = 'Changes';

    # Perl Module: Kernel/Modules/AgentITSMChangeAdd.pm
    $Self->{Translation}->{'Ticket with TicketID %s does not exist!'} = 'Ticket mit Ticket-Kennung %s ist nicht vorhanden!';
    $Self->{Translation}->{'Please contact the admin.'} = 'Bitte kontaktieren Sie einen Administrator.';
    $Self->{Translation}->{'Missing sysconfig option "ITSMChange::AddChangeLinkTicketTypes"!'} =
        '';
    $Self->{Translation}->{'Was not able to add change!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeAddFromTemplate.pm
    $Self->{Translation}->{'Was not able to create change from template!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeCABTemplate.pm
    $Self->{Translation}->{'No ChangeID is given!'} = 'Keine Änderungskennung übermittelt!';
    $Self->{Translation}->{'No change found for changeID %s.'} = '';
    $Self->{Translation}->{'The CAB of change "%s" could not be serialized.'} = '';
    $Self->{Translation}->{'Could not add the template.'} = 'Vorlage konnte nicht hinzugefügt werden.';

    # Perl Module: Kernel/Modules/AgentITSMChangeCondition.pm
    $Self->{Translation}->{'Change "%s" not found in database!'} = 'Änderung "%s" in der Datenbank nicht gefunden!';
    $Self->{Translation}->{'Could not delete ConditionID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeConditionEdit.pm
    $Self->{Translation}->{'No %s is given!'} = '';
    $Self->{Translation}->{'Could not create new condition!'} = '';
    $Self->{Translation}->{'Could not update ConditionID %s!'} = '';
    $Self->{Translation}->{'Could not update ExpressionID %s!'} = '';
    $Self->{Translation}->{'Could not add new Expression!'} = 'Neuer Ausdruck konnte nicht hinzugefügt werden!';
    $Self->{Translation}->{'Could not update ActionID %s!'} = '';
    $Self->{Translation}->{'Could not add new Action!'} = 'Neue Aktion konnte nicht hinzugefügt werden!';
    $Self->{Translation}->{'Could not delete ExpressionID %s!'} = '';
    $Self->{Translation}->{'Could not delete ActionID %s!'} = '';
    $Self->{Translation}->{'Error: Unknown field type "%s"!'} = 'Fehler: Unbekannter Feldtyp "%s"!';
    $Self->{Translation}->{'ConditionID %s does not belong to the given ChangeID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeDelete.pm
    $Self->{Translation}->{'Change "%s" does not have an allowed change state to be deleted!'} =
        '';
    $Self->{Translation}->{'Was not able to delete the changeID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeEdit.pm
    $Self->{Translation}->{'Was not able to update Change!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no ChangeID is given!'} = '';
    $Self->{Translation}->{'Change "%s" not found in the database!'} = 'Änderung "%s" in der Datenbank nicht gefunden!';
    $Self->{Translation}->{'Unknown type "%s" encountered!'} = '';
    $Self->{Translation}->{'Change History'} = 'Änderungschronik';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistoryZoom.pm
    $Self->{Translation}->{'Can\'t show history zoom, no HistoryEntryID is given!'} = '';
    $Self->{Translation}->{'HistoryEntry "%s" not found in database!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeInvolvedPersons.pm
    $Self->{Translation}->{'Was not able to update Change CAB for Change %s!'} = '';
    $Self->{Translation}->{'Was not able to update Change %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeManager.pm
    $Self->{Translation}->{'Overview: ChangeManager'} = 'Übersicht: ÄnderungsVerwalter';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyCAB.pm
    $Self->{Translation}->{'Overview: My CAB'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyChanges.pm
    $Self->{Translation}->{'Overview: My Changes'} = 'Übersicht: Meine Änderungen';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyWorkOrders.pm
    $Self->{Translation}->{'Overview: My Workorders'} = 'Übersicht: Meine Arbeitsaufträge';

    # Perl Module: Kernel/Modules/AgentITSMChangePIR.pm
    $Self->{Translation}->{'Overview: PIR'} = 'Übersicht: PIR';

    # Perl Module: Kernel/Modules/AgentITSMChangePSA.pm
    $Self->{Translation}->{'Overview: PSA'} = 'Overview: PSA';

    # Perl Module: Kernel/Modules/AgentITSMChangePrint.pm
    $Self->{Translation}->{'WorkOrder "%s" not found in database!'} = 'Arbeitsauftrag "%s" in Datenbank nicht gefunden!';
    $Self->{Translation}->{'Can\'t create output, as the workorder is not attached to a change!'} =
        '';
    $Self->{Translation}->{'Can\'t create output, as no ChangeID is given!'} = '';
    $Self->{Translation}->{'unknown change title'} = 'unbekannter Änderungstitel';
    $Self->{Translation}->{'unknown workorder title'} = 'unbekannter Arbeitsauftragstitel';
    $Self->{Translation}->{'ITSM Workorder Overview (%s)'} = 'ITSM-Arbeitsauftragübersicht (%s)';

    # Perl Module: Kernel/Modules/AgentITSMChangeReset.pm
    $Self->{Translation}->{'Was not able to reset WorkOrder %s of Change %s!'} = '';
    $Self->{Translation}->{'Was not able to reset Change %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeSchedule.pm
    $Self->{Translation}->{'Overview: Change Schedule'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeSearch.pm
    $Self->{Translation}->{'Change Search'} = 'Suche ändern';
    $Self->{Translation}->{'WorkOrders'} = 'Arbeitsauftrag';
    $Self->{Translation}->{'Change Search Result'} = 'Suchergebnis ändern';
    $Self->{Translation}->{'Change Number'} = 'Nummer ändern';
    $Self->{Translation}->{'Change Title'} = 'Titel ändern';
    $Self->{Translation}->{'Work Order Title'} = 'Arbeitsauftragtitel';
    $Self->{Translation}->{'CAB Agent'} = '';
    $Self->{Translation}->{'CAB Customer'} = '';
    $Self->{Translation}->{'Change Description'} = 'Änderungsbeschreibung';
    $Self->{Translation}->{'Change Justification'} = '';
    $Self->{Translation}->{'WorkOrder Instruction'} = '';
    $Self->{Translation}->{'WorkOrder Report'} = 'Arbeitsauftragsbericht';
    $Self->{Translation}->{'Change Priority'} = 'Änderungspriorität';
    $Self->{Translation}->{'Change Impact'} = '';
    $Self->{Translation}->{'Change State'} = 'Änderungsstatus';
    $Self->{Translation}->{'Created By'} = 'Erstellt von';
    $Self->{Translation}->{'WorkOrder State'} = 'Arbeitsauftragsstatus';
    $Self->{Translation}->{'WorkOrder Type'} = 'Arbeitsauftragtyp';
    $Self->{Translation}->{'WorkOrder Agent'} = 'Arbeitsauftragsagent';
    $Self->{Translation}->{'Planned Start Time'} = 'Geplante Startzeit';
    $Self->{Translation}->{'Planned End Time'} = 'Geplante Endzeit';
    $Self->{Translation}->{'Actual Start Time'} = 'Tatsächliche Startzeit';
    $Self->{Translation}->{'Actual End Time'} = 'Tatsächliche Endzeit';
    $Self->{Translation}->{'Change Time'} = 'Zeit ändern';
    $Self->{Translation}->{'before'} = 'vor';

    # Perl Module: Kernel/Modules/AgentITSMChangeTemplate.pm
    $Self->{Translation}->{'The change "%s" could not be serialized.'} = '';
    $Self->{Translation}->{'Could not update the template "%s".'} = '';
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
    $Self->{Translation}->{'You need %s permission!'} = '';
    $Self->{Translation}->{'No TemplateID is given!'} = '';
    $Self->{Translation}->{'Template "%s" not found in database!'} = '';
    $Self->{Translation}->{'Was not able to delete the template %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEdit.pm
    $Self->{Translation}->{'Was not able to update Template %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEditCAB.pm
    $Self->{Translation}->{'Was not able to update Template "%s"!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEditContent.pm
    $Self->{Translation}->{'Was not able to create change!'} = '';
    $Self->{Translation}->{'Was not able to create workorder from template!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMTemplateOverview.pm
    $Self->{Translation}->{'Overview: Template'} = '';

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
    $Self->{Translation}->{'Was not able to delete the workorder %s!'} = '';

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
    $Self->{Translation}->{'Title: %s | Type: %s'} = '';

    # Perl Module: Kernel/Output/HTML/ToolBar/MyWorkOrders.pm
    $Self->{Translation}->{'My Work Orders'} = 'Meine Arbeitsaufträge';

    # SysConfig
    $Self->{Translation}->{'A list of the agents who have permission to take workorders. Key is a login name. Content is 0 or 1.'} =
        'Eine Liste der Agenten, die Zugriff auf Arbeitsaufträge haben. Schlüssel ist der Anmeldename. Inhalt ist 0 oder 1';
    $Self->{Translation}->{'A list of workorder states, at which the ActualStartTime of a workorder will be set if it was empty at this point.'} =
        'Eine Liste von Arbeitsauftragsstaten, bei denen die ActualStartTime eines Arbeitsauftrags festgelegt wird, wenn diese vorher nicht festgelegt war.';
    $Self->{Translation}->{'Add Workorder (from Template)'} = '';
    $Self->{Translation}->{'Add a change from template.'} = '';
    $Self->{Translation}->{'Add a change.'} = '';
    $Self->{Translation}->{'Add a workorder (from template) to the change.'} = '';
    $Self->{Translation}->{'Add a workorder to the change.'} = '';
    $Self->{Translation}->{'Admin of the CIP matrix.'} = 'Admin der CIP-Matrix.';
    $Self->{Translation}->{'Admin of the state machine.'} = 'Admin der State Machine';
    $Self->{Translation}->{'Agent interface notification module to see the number of change advisory boards.'} =
        'Agenten-Ansicht Benachrichtigung-Modul um die Zahl der Change-Advisory-Boards anzuzeigen.';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes managed by the user.'} =
        'Agenten-Ansicht Benachrichtigung-Modul um die Zahl der Changes anzuzeigen die vom Benutzer verwaltet werden.';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes.'} =
        'Agenten-Ansicht Benachrichtigung-Modul um die Zahl der Changes anzuzeigen.';
    $Self->{Translation}->{'Agent interface notification module to see the number of workorders.'} =
        '';
    $Self->{Translation}->{'CAB Member Search'} = '';
    $Self->{Translation}->{'Cache time in minutes for the change management toolbars. Default: 3 hours (180 minutes).'} =
        'Cache-Zeit in Minuten für die Change Management Werkzeugleiste. Standard: 3 Stunden (180 Minuten)';
    $Self->{Translation}->{'Cache time in minutes for the change management. Default: 5 days (7200 minutes).'} =
        'Cache-Zeit in Minuten für die Change Management. Standard: 5 Tage (7200 Minuten).';
    $Self->{Translation}->{'Change CAB Templates'} = '';
    $Self->{Translation}->{'Change History.'} = '';
    $Self->{Translation}->{'Change Involved Persons.'} = '';
    $Self->{Translation}->{'Change Overview "Small" Limit'} = 'Change Übersicht Anzeige Limit für "Small"';
    $Self->{Translation}->{'Change Overview.'} = '';
    $Self->{Translation}->{'Change Print.'} = '';
    $Self->{Translation}->{'Change Schedule.'} = '';
    $Self->{Translation}->{'Change Zoom.'} = '';
    $Self->{Translation}->{'Change and Workorder Templates'} = '';
    $Self->{Translation}->{'Change and workorder templates edited by this user.'} = '';
    $Self->{Translation}->{'Change area.'} = '';
    $Self->{Translation}->{'Change involved persons of the change.'} = '';
    $Self->{Translation}->{'Change limit per page for Change Overview "Small".'} = '';
    $Self->{Translation}->{'Change search backend router of the agent interface.'} = 'Such-Backend-Router für die Change-Suche in der Agenten-Ansicht.';
    $Self->{Translation}->{'Condition Overview'} = '';
    $Self->{Translation}->{'Configure which screen should be shown after a new workorder has been created.'} =
        '';
    $Self->{Translation}->{'Configures how often the notifications are sent when planned the start time or other time values have been reached/passed.'} =
        'Konfiguration wie häufig Benachrichtungen verschickt werden wenn die geplante Startzeit oder andere Zeiten erreicht wurden bzw. schon vorbei sind.';
    $Self->{Translation}->{'Create Change (from Template)'} = '';
    $Self->{Translation}->{'Create a change (from template) from this ticket.'} = '';
    $Self->{Translation}->{'Create a change from this ticket.'} = '';
    $Self->{Translation}->{'Create and manage ITSM Change Management notifications.'} = '';
    $Self->{Translation}->{'Default type for a workorder. This entry must exist in general catalog class \'ITSM::ChangeManagement::WorkOrder::Type\'.'} =
        'Standardtyp für einen Arbeitsauftrag. Dieser Eintrag muss in der General Catalog Klasse \'ITSM::ChangeManagement::WorkOrder::Type\' existieren.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define the signals for each workorder state.'} = 'Definieren eines Signals für einen Arbeitsauftragsstatus.';
    $Self->{Translation}->{'Define which columns are shown in the linked Changes widget (LinkObject::ViewMode = "complex"). Note: Only Change attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked Workorder widget (LinkObject::ViewMode = "complex"). Note: Only Workorder attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a change list.'} =
        'Definiert das Übersichtsmodul um die Small-Ansicht einer Change-Liste anzuzeigen.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a template list.'} =
        'Definiert das Übersichtsmodul um die Small-Ansicht einer Template-Liste anzuzeigen.';
    $Self->{Translation}->{'Defines if it will be possible to print the accounted time.'} = 'Definiert ob die erfasste Zeit ausgedruckt werden kann.';
    $Self->{Translation}->{'Defines if it will be possible to print the planned effort.'} = 'Definiert ob der geplante Aufwand ausgedruckt werden kann.';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) change end states should be allowed if a change is in a locked state.'} =
        'Definiert ob nachfolgende Endzustände für Changes (wie in der State Machine definiert) auch dann erlaubt sind, wenn sich der Change im gesperrten Zustand befindet.';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) workorder end states should be allowed if a workorder is in a locked state.'} =
        'Definiert, ob nachfolgende Endzustände für einen Arbeitsauftrag (wie in der State Machine definiert) auch dann erlaubt sind, wenn sich Ihre Arbeitsaufträge im gesperrten Zustand befindet.';
    $Self->{Translation}->{'Defines if the accounted time should be shown.'} = 'Soll die gebuchte Zeit angezeigt werden.';
    $Self->{Translation}->{'Defines if the actual start and end times should be set.'} = 'Wenn der tatsächliche Start- und Endzeitpunkt gesetzt werden soll.';
    $Self->{Translation}->{'Defines if the change search and the workorder search functions could use the mirror DB.'} =
        'Definiert, ob die Änderungssuche und Arbeitsauftragssuche die Spiegeldatenbank benutzen kann.';
    $Self->{Translation}->{'Defines if the change state can be set in AgentITSMChangeEdit.'} =
        'Definiert ob der Change-Status in AgentITSMChangeEdit gesetzt werden kann.';
    $Self->{Translation}->{'Defines if the planned effort should be shown.'} = 'Soll der geplante Aufwand angezeigt werden.';
    $Self->{Translation}->{'Defines if the requested date should be print by customer.'} = 'Definiert ob das Anfragedatum für den Kunden gedruckt werden soll.';
    $Self->{Translation}->{'Defines if the requested date should be searched by customer.'} =
        'Soll der Wunschtermin des Kunden gesucht werden können.';
    $Self->{Translation}->{'Defines if the requested date should be set by customer.'} = 'Definiert ob das Anfragedatum vom Kunden ausgefüllt werden soll.';
    $Self->{Translation}->{'Defines if the requested date should be shown by customer.'} = 'Soll der Wunschtermin des Kunden angezeigt werden.';
    $Self->{Translation}->{'Defines if the workorder state should be shown.'} = 'Soll der Status des Arbeitsauftrags angezeigt werden.';
    $Self->{Translation}->{'Defines if the workorder title should be shown.'} = 'Soll der Titel des Arbeitsauftrags angezeigt werden.';
    $Self->{Translation}->{'Defines shown graph attributes.'} = 'Definiert Attribute für die Anzeige des Graphen.';
    $Self->{Translation}->{'Defines that only changes containing Workorders linked with services, which the customer user has permission to use will be shown. Any other changes will not be displayed.'} =
        'Definiert, dass nur Änderungen angezeigt werden, die Arbeitsaufträge enthalten, die mit Diensten verlinkt sind, für die der Kunden-Benutzer eine Berechtigung hat. Andere Änderungen werden nicht angezeigt.';
    $Self->{Translation}->{'Defines the change states that will be allowed to delete.'} = 'Definiert den Änderungsstatus welcher das löschen ermöglicht.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change PSA overview.'} =
        'Definiert die Change-States die als Filter in der Change PSA-Übersicht verwendet werden.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change Schedule overview.'} =
        'Definiert die Change-States die als Filter in der Change Schedule-Übersicht verwendet werden.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyCAB overview.'} =
        'Definiert die Change-States die als Filter in der MyCAB-Übersicht verwendet werden.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyChanges overview.'} =
        'Definiert die Change-States die als Filter in der MyChanges-Übersicht verwendet werden.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change manager overview.'} =
        'Definiert die Change-States die als Filter in der Change-Manager-Übersicht verwendet werden.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change overview.'} =
        'Definiert die Change-States die als Filter in der Change-Übersicht verwendet werden.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the customer change schedule overview.'} =
        'Definiert die Change-States die als Filter in der Kunden-Ansicht "Change Schedule" verwendet werden.';
    $Self->{Translation}->{'Defines the default change title for a dummy change which is needed to edit a workorder template.'} =
        'Definiert den Standardtitel für eine Scheinänderung, welche benötigt wird, um eine Arbeitsauftragsvorlage zu editieren.';
    $Self->{Translation}->{'Defines the default sort criteria in the change PSA overview.'} =
        'Standard Sortierung der Changes in der Change PSA-Übersicht.';
    $Self->{Translation}->{'Defines the default sort criteria in the change manager overview.'} =
        'Standard Sortierung der Changes in der Change-Manager-Übersicht.';
    $Self->{Translation}->{'Defines the default sort criteria in the change overview.'} = 'Standard Sortierung der Changes in der Change-Übersicht.';
    $Self->{Translation}->{'Defines the default sort criteria in the change schedule overview.'} =
        'Standard Sortierung der Changes in der Change Schedule-Übersicht.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyCAB overview.'} =
        'Standard Sortierung der Changes in der MyCAB-Übersicht.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyChanges overview.'} =
        'Standard Sortierung der Changes in der MyChanges-Übersicht.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyWorkorders overview.'} =
        'Standardsortierung der Änderungen in der MeineArbeitsaufträge-Übersicht.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the PIR overview.'} =
        'Standard Sortierung der Changes in der PIR-Übersicht.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the customer change schedule overview.'} =
        'Standard Sortierung der Changes in der Kunden-Ansicht "Change Schedule".';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the template overview.'} =
        'Standard Sortierung der Templates in der Template-Übersicht.';
    $Self->{Translation}->{'Defines the default sort order in the MyCAB overview.'} = 'Standard Reihenfolge der Changes in der MyCAB-Übersicht.';
    $Self->{Translation}->{'Defines the default sort order in the MyChanges overview.'} = 'Standard Reihenfolge der Changes in der MyChanges-Übersicht.';
    $Self->{Translation}->{'Defines the default sort order in the MyWorkorders overview.'} =
        'Standardreihenfolge der Arbeitsaufträge in der MeineArbeitsaufträge-Übersicht.';
    $Self->{Translation}->{'Defines the default sort order in the PIR overview.'} = 'Standard Reihenfolge der Changes in der PIR-Übersicht.';
    $Self->{Translation}->{'Defines the default sort order in the change PSA overview.'} = 'Standard Reihenfolge der Changes in der Change PSA-Übersicht.';
    $Self->{Translation}->{'Defines the default sort order in the change manager overview.'} =
        'Standard Reihenfolge der Changes in der Change-Manager-Übersicht.';
    $Self->{Translation}->{'Defines the default sort order in the change overview.'} = 'Definiert die Standard Sortierung in der Änderungsübersicht.';
    $Self->{Translation}->{'Defines the default sort order in the change schedule overview.'} =
        'Standard Reihenfolge der Changes in der Change Schedule-Übersicht.';
    $Self->{Translation}->{'Defines the default sort order in the customer change schedule overview.'} =
        'Standard Reihenfolge der Changes in der Kunden-Ansicht "Change Schedule".';
    $Self->{Translation}->{'Defines the default sort order in the template overview.'} = 'Standard Reihenfolge der Templates in der Template-Übersicht.';
    $Self->{Translation}->{'Defines the default value for the category of a change.'} = 'Der Standard-Wert für die Kategorie eines Changes.';
    $Self->{Translation}->{'Defines the default value for the impact of a change.'} = 'Der Standard-Wert für die Auswirkung eines Changes.';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for change attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        'Definiert den Feld-Typ für CompareValue Felder für Change-Attribute in AgentITSMChangeConditionEdit. Gültige Werte sind Selection, Text und Date. Wenn kein Typ definiert ist, dann wird das feld nicht angezeigt.';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for workorder attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        'Definiert den Feld-Typ für CompareValue Felder für Workorder-Attribute in AgentITSMChangeConditionEdit. Gültige Werte sind Selection, Text und Date. Wenn kein Typ definiert ist, dann wird das feld nicht angezeigt.';
    $Self->{Translation}->{'Defines the object attributes that are selectable for change objects in AgentITSMChangeConditionEdit.'} =
        'Definiert die Objekt-Attribute die für Change-Objekte in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the object attributes that are selectable for workorder objects in AgentITSMChangeConditionEdit.'} =
        'Definiert die Objekt-Attribute die für Workorder-Objekte in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute AccountedTime in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut AccountedTime in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualEndTime in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut ActualEndTime in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualStartTime in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut ActualStartTime in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute CategoryID in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut CategoryID in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeBuilderID in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut ChangeBuilderID in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeManagerID in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut ChangeManagerID in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeStateID in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut ChangeStateID in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeTitle in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut ChangeTitle in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute DynamicField in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für Dynamische Felder in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ImpactID in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut ImpactID in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEffort in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut PlannedEffort in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEndTime in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut PlannedEndTime in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedStartTime in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut PlannedStartTime in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PriorityID in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut PriorityID in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute RequestedTime in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut RequestedTime in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderAgentID in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut WorkOrderAgentID in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderNumber in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut WorkOrderNumber in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderStateID in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut WorkOrderStateID in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTitle in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut WorkOrderTitle in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTypeID in AgentITSMChangeConditionEdit.'} =
        'Definiert die Operatoren die für das Attribut WorkOrderTypeID in AgentITSMChangeConditionEdit ausgewählt werden können.';
    $Self->{Translation}->{'Defines the period (in years), in which start and end times can be selected.'} =
        'Definiert den Zeitraum (in Jahren) in welcher Start- und Endzeiten gewählt werden können.';
    $Self->{Translation}->{'Defines the shown attributes of a workorder in the tooltip of the workorder graph in the change zoom. To show workorder dynamic fields in the tooltip, they must be specified like DynamicField_WorkOrderFieldName1, DynamicField_WorkOrderFieldName2, etc.'} =
        'Definiert die Attribute einer Workorder die in der "Change Zoom" Ansicht als Kurzinfo zum Workorder Balken angezeigt werden. Um Dynamische felder der Workorder anzuzeigen, müssen dies als DynamicField_WorkOrderFieldName1, DynamicField_WorkOrderFieldName2, etc. angegeben werden.';
    $Self->{Translation}->{'Defines the shown columns in the Change PSA overview. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten in der Change PSA-Übersicht. Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the Change Schedule overview. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten in der Change Schedule-Übersicht. Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the MyCAB overview. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten in der MyCAB-Übersicht. Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the MyChanges overview. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten in der MyChanges-Übersicht. Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the MyWorkorders overview. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten in der MyWorkorders-Übersicht. Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the PIR overview. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten in der PIR-Übersicht. Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the change manager overview. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten in der Change-Manager-Übersicht. Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the change overview. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten in der Change-Übersicht. Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the change search. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten im Suchergebniss. Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the customer change schedule overview. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten in der Kunden-Ansicht "Change Schedule". Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the shown columns in the template overview. This option has no effect on the position of the column.'} =
        'Definiert die angezeigten Tabellenspalten in der Template-Übersicht. Diese Option hat keinen Effekt auf die Position der Spalten.';
    $Self->{Translation}->{'Defines the signals for each ITSMChange state.'} = 'Definieren eines Signals für einen ITSMChange-Status.';
    $Self->{Translation}->{'Defines the template types that will be used as filters in the template overview.'} =
        'Definiert die TemplateTypen die als Filter in der Template-Übersicht verwendet werden.';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the MyWorkorders overview.'} =
        'Definiert die Workorder-States die als Filter in der MyWorkorders-Übersicht verwendet werden.';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the PIR overview.'} =
        'Definiert die Workorder-States die als Filter in der PIR-Übersicht verwendet werden.';
    $Self->{Translation}->{'Defines the workorder types that will be used to show the PIR overview.'} =
        'Definiert die Workorder-Typen die für die PIR-Übersicht verwendet werden.';
    $Self->{Translation}->{'Defines whether notifications should be sent.'} = 'Wenn Benachrichtigungen versendet werden sollen.';
    $Self->{Translation}->{'Delete a change.'} = '';
    $Self->{Translation}->{'Delete the change.'} = '';
    $Self->{Translation}->{'Delete the workorder.'} = '';
    $Self->{Translation}->{'Details of a change history entry.'} = '';
    $Self->{Translation}->{'Determines if an agent can exchange the X-axis of a stat if he generates one.'} =
        'Wenn diese Option aktiviert wird, hat der Agent die Möglichkeit beim Generieren einer Statistik die beiden Achsen zu vertauschen.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes done for config item classes.'} =
        'Hier können Sie festlegen, ob das Statistik-Modul auch allgemeine Statistiken über die Anzahl der durchgeführten Changes nach CI-Klasse generieren darf.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding change state updates within a timeperiod.'} =
        'Hier können Sie festlegen, ob das Statistik-Modul auch allgemeine Statistiken über Changes bzgl. Status-Updates innerhalb einer Zeitperiode generieren darf.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding the relation between changes and incident tickets.'} =
        'Hier können Sie festlegen, ob das Statistik-Modul auch allgemeine Statistiken über Changes bzgl. dem Zusammenhang zwischen Changes und Vorfalls-Tickets generieren darf.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes.'} =
        'Hier können Sie festlegen, ob das Statistik-Modul auch allgemeine Statistiken über Changes generieren darf.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about the number of Rfc tickets a requester created.'} =
        'Hier können Sie festlegen, ob das Statistik-Modul auch allgemeine Statistiken über die Anzahl von RfC-Tickets, die von Benutzern erzeugt wurden, generieren darf.';
    $Self->{Translation}->{'Dynamic fields (for changes and workorders) shown in the change print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamische Felder (für Changes und Workorder) die in der Oberfläche "Change drucken" in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.';
    $Self->{Translation}->{'Dynamic fields shown in the change add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamische Felder die in der Oberfläche "Change hinzufügen" in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.';
    $Self->{Translation}->{'Dynamic fields shown in the change edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamische Felder die in der Oberfläche "Change bearbeiten" in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.';
    $Self->{Translation}->{'Dynamic fields shown in the change search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamische Felder die in der Oberfläche "Change suchen" in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.';
    $Self->{Translation}->{'Dynamic fields shown in the change zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamische Felder die in der Oberfläche "Change Zoom" in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.';
    $Self->{Translation}->{'Dynamic fields shown in the workorder add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamische Felder die in der Oberfläche "Workorder hinzufügen" in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert,  2 = aktiviert und benötigt.';
    $Self->{Translation}->{'Dynamic fields shown in the workorder edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamische Felder die in der Oberfläche "Workorder bearbeiten" in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert,  2 = aktiviert und benötigt.';
    $Self->{Translation}->{'Dynamic fields shown in the workorder report screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamische Felder die in der Oberfläche "Workorder Bericht" in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert,  2 = aktiviert und benötigt.';
    $Self->{Translation}->{'Dynamic fields shown in the workorder zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamische Felder die in der Oberfläche "Workorder Zoom" in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.';
    $Self->{Translation}->{'DynamicField event module to handle the update of conditions if dynamic fields are added, updated or deleted.'} =
        'Dynamische Felder Event-Modul zur Behandlung der Bedingungen wenn Dynamische Felder hinzugefügt, geändert oder gelöscht werden.';
    $Self->{Translation}->{'Edit a change.'} = '';
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
    $Self->{Translation}->{'ITSM event module that cleans up conditions.'} = 'ITSM Event Modul zum Aufräumen von Conditions.';
    $Self->{Translation}->{'ITSM event module that deletes the cache for a toolbar.'} = 'ITSM-Ereignismodul, das den Cache für eine Werkzeugleiste löscht.';
    $Self->{Translation}->{'ITSM event module that deletes the history of changes.'} = '';
    $Self->{Translation}->{'ITSM event module that matches conditions and executes actions.'} =
        'ITSM Event Modul zum Überprüfen von Conditions und zum Ausführen von Actions.';
    $Self->{Translation}->{'ITSM event module that sends notifications.'} = 'ITSM Event Modul zum Senden von Benachrichtigungen.';
    $Self->{Translation}->{'ITSM event module that updates the history of changes.'} = 'ITSM Event Modul aktualisiert die Historie von Changes.';
    $Self->{Translation}->{'ITSM event module that updates the history of conditions.'} = '';
    $Self->{Translation}->{'ITSM event module that updates the history of workorders.'} = '';
    $Self->{Translation}->{'ITSM event module to recalculate the workorder numbers.'} = 'ITSM Event Modul, das die Workorder Nummern neu berechnet.';
    $Self->{Translation}->{'ITSM event module to set the actual start and end times of workorders.'} =
        'ITSM Event Modul, das die ActualStart und ActualEnd Zeiten von Workorders setzt.';
    $Self->{Translation}->{'If frequency is \'regularly\', you can configure how often the notifications are sent (every X hours).'} =
        '';
    $Self->{Translation}->{'Link another object to the change.'} = '';
    $Self->{Translation}->{'Link another object to the workorder.'} = '';
    $Self->{Translation}->{'Logfile for the ITSM change counter. This file is used for creating the change numbers.'} =
        'Pfad und Verzeichnis zur Logdatei für den ITSM Change-Counter. Diese Datei hilft bei der Erzeugung von Change-Nummern.';
    $Self->{Translation}->{'Lookup of CAB members for autocompletion.'} = '';
    $Self->{Translation}->{'Lookup of agents, used for autocompletion.'} = '';
    $Self->{Translation}->{'Module to check if WorkOrderAdd or WorkOrderAddFromTemplate should be permitted.'} =
        'Modul zur Prüfung ob WorkOrderAdd oder WorkOrderAddFromTemplate erlaubt ist.';
    $Self->{Translation}->{'Module to check the CAB members.'} = 'Modul zum Überprüfen des Agenten im CAB.';
    $Self->{Translation}->{'Module to check the agent.'} = 'Modul zum Überprüfen des Agenten.';
    $Self->{Translation}->{'Module to check the change builder.'} = 'Modul zum Überprüfen des Change Builders.';
    $Self->{Translation}->{'Module to check the change manager.'} = 'Modul zum Überprüfen des Change Managers.';
    $Self->{Translation}->{'Module to check the workorder agent.'} = 'Modul zum Überprüfen des Workorder-Agenten.';
    $Self->{Translation}->{'Module to check whether no workorder agent is set.'} = 'Modul zum Überprüfen ob es keinen Agenten für die Workorder gibt.';
    $Self->{Translation}->{'Module to check whether the agent is contained in the configured list.'} =
        'Modul zum Überprüfen ob der Agent in der konfigurierten Liste enthalten ist.';
    $Self->{Translation}->{'Module to show a link to create a change from this ticket. The ticket will be automatically linked with the new change.'} =
        'Mit diesem Modul wird ein Link im Menü der Ticketansicht angezeigt, mit dem ein Change erstellt werden kann. Das Ticket wird automatisch mit dem neu erstellten Change verlinkt.';
    $Self->{Translation}->{'Move Time Slot.'} = '';
    $Self->{Translation}->{'Move all workorders in time.'} = '';
    $Self->{Translation}->{'Only users of these groups have the permission to use the ticket types as defined in "ITSMChange::AddChangeLinkTicketTypes" if the feature "Ticket::Acl::Module###200-Ticket::Acl::Module" is enabled.'} =
        'Nur die Mitglieder dieser Gruppen haben die Erlaubnis die Ticket-Typen zu verwenden, die in "ITSMChange::AddChangeLinkTicketTypes" definiert sind, wenn das Feature "Ticket::Acl::Module###200-Ticket::Acl::Module" aktiviert ist.';
    $Self->{Translation}->{'Overview over all Changes.'} = '';
    $Self->{Translation}->{'PIR'} = '';
    $Self->{Translation}->{'PSA'} = '';
    $Self->{Translation}->{'Parameters for the UserCreateWorkOrderNextMask object in the preference view of the agent interface.'} =
        'Parameter für das UserCreateWorkOrderNextMask Objekt in den Benutzereinstellungen der Agenten-Oberfläche.';
    $Self->{Translation}->{'Parameters for the pages (in which the changes are shown) of the small change overview.'} =
        'Parameter für die Change Übersichts-Anzeige in der Anzeige-Variante "S".';
    $Self->{Translation}->{'Presents a link in the menu to show the involved persons in a change, in the zoom view of such change in the agent interface.'} =
        'Zeigt in der "Change Zoom" Ansicht der Agenten-Oberfläche einen  Menu Link der es erlaubt die eingebundenen Agenten anzuzeigen.';
    $Self->{Translation}->{'Print the change.'} = '';
    $Self->{Translation}->{'Print the workorder.'} = '';
    $Self->{Translation}->{'Projected Service Availability'} = '';
    $Self->{Translation}->{'Projected Service Availability (PSA)'} = '';
    $Self->{Translation}->{'Projected Service Availability (PSA) of changes. Overview of approved changes and their services.'} =
        '';
    $Self->{Translation}->{'Required privileges in order for an agent to take a workorder.'} =
        'Benötigtes Recht zum Übernehmen einer Workorder.';
    $Self->{Translation}->{'Required privileges to access the overview of all changes.'} = 'Erforderliche Berechtigungen, um auf die Übersicht aller Änderungen zuzugreifen.';
    $Self->{Translation}->{'Required privileges to add a workorder.'} = 'Benötigtes Recht zum Löschen einer Workorder.';
    $Self->{Translation}->{'Required privileges to change the workorder agent.'} = 'Benötigtes Recht zum Ändern des Agenten einer Workorder.';
    $Self->{Translation}->{'Required privileges to create a template from a change.'} = 'Benötigtes Recht um eine Vorlage aus einem Change zu erstellen.';
    $Self->{Translation}->{'Required privileges to create a template from a changes\' CAB.'} =
        'Benötigtes Recht um eine Vorlage aus einem CAB eines Change zu erstellen.';
    $Self->{Translation}->{'Required privileges to create a template from a workorder.'} = 'Benötigtes Recht um eine Vorlage aus einer Workorder zu erstellen.';
    $Self->{Translation}->{'Required privileges to create changes from templates.'} = 'Erforderliche Berechtigungen, um Änderungen aus Vorlagen zu erstellen.';
    $Self->{Translation}->{'Required privileges to create changes.'} = 'Benötigtes Recht zum Erstellen von Changes.';
    $Self->{Translation}->{'Required privileges to delete a template.'} = 'Benötigtes Recht zum Löschen einer Vorlage.';
    $Self->{Translation}->{'Required privileges to delete a workorder.'} = 'Benötigtes Recht zum Löschen einer Workorder.';
    $Self->{Translation}->{'Required privileges to delete changes.'} = 'Benötigtes Recht zum Löschen von Changes.';
    $Self->{Translation}->{'Required privileges to edit a template.'} = 'Benötigtes Recht zum Ändern einer Vorlage.';
    $Self->{Translation}->{'Required privileges to edit a workorder.'} = 'Benötigtes Recht zum Ändern einer Workorder.';
    $Self->{Translation}->{'Required privileges to edit changes.'} = 'Benötigtes Recht zum Bearbeiten von Changes.';
    $Self->{Translation}->{'Required privileges to edit the conditions of changes.'} = 'Benötigtes Recht zum Bearbeiten der Condition von Changes.';
    $Self->{Translation}->{'Required privileges to edit the content of a template.'} = 'Benötigtes Recht zum Ändern des Inhalts einer Vorlage.';
    $Self->{Translation}->{'Required privileges to edit the involved persons of a change.'} =
        'Benötigtes Recht zum Ändern der beteiligten Personen.';
    $Self->{Translation}->{'Required privileges to move changes in time.'} = 'Benötigtes Recht zum zeitlichen Verschieben von Changes.';
    $Self->{Translation}->{'Required privileges to print a change.'} = 'Benötigtes Recht zum Drucken von Changes.';
    $Self->{Translation}->{'Required privileges to reset changes.'} = 'Benötigtes Recht zum Zurücksetzen von Changes.';
    $Self->{Translation}->{'Required privileges to view a workorder.'} = 'Benötigtes Recht zum Betrachten einer Workorder.';
    $Self->{Translation}->{'Required privileges to view changes.'} = 'Benötigtes Recht zum Ansehen von Changes.';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is a CAB member.'} =
        'Benötigtes Recht zum Einsehen der Liste der Changes bei denen der Benutzer Mitglied des CABs ist.';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is the change manager.'} =
        'Benötigtes Recht zum Einsehen der Liste der Changes bei denen der Benutzer change manager ist.';
    $Self->{Translation}->{'Required privileges to view overview over all templates.'} = 'Benötigtes Recht zum Einsehen der Liste von Vorlagen.';
    $Self->{Translation}->{'Required privileges to view the conditions of changes.'} = 'Benötigtes Recht zum Betrachten der Conditions von Changes.';
    $Self->{Translation}->{'Required privileges to view the history of a change.'} = 'Benötigtes Recht zum Einsehen der Historie eines Change.';
    $Self->{Translation}->{'Required privileges to view the history of a workorder.'} = 'Benötigtes Recht zum Betrachten der Historie einer Workorder.';
    $Self->{Translation}->{'Required privileges to view the history zoom of a change.'} = 'Benötigtes Recht zum Einsehen der Historiendetails eines Changes.';
    $Self->{Translation}->{'Required privileges to view the history zoom of a workorder.'} =
        'Benötigtes Recht zum Betrachten der Historiendetails einer Workorder.';
    $Self->{Translation}->{'Required privileges to view the list of Change Schedule.'} = 'Benötigtes Recht zum Einsehen der Change Schedule-Übersicht.';
    $Self->{Translation}->{'Required privileges to view the list of change PSA.'} = 'Benötigtes Recht zum Einsehen der Change PSA-Übersicht.';
    $Self->{Translation}->{'Required privileges to view the list of changes with an upcoming PIR (Post Implementation Review).'} =
        'Benötigtes Recht zum Einsehen der Liste von Changes mit einem anstehenden PIR (Post Implementation Review).';
    $Self->{Translation}->{'Required privileges to view the list of own changes.'} = 'Benötigtes Recht zum Einsehen der Liste der eigenen Changes.';
    $Self->{Translation}->{'Required privileges to view the list of own workorders.'} = 'Benötigtes Recht zum Einsehen der Liste von eigenen Workorders.';
    $Self->{Translation}->{'Required privileges to write a report for the workorder.'} = 'Benötigtes Recht zum Verfassen eines Berichtes für eine Workorder.';
    $Self->{Translation}->{'Reset a change and its workorders.'} = '';
    $Self->{Translation}->{'Reset change and its workorders.'} = '';
    $Self->{Translation}->{'Run task to check if specific times have been reached in changes and workorders.'} =
        '';
    $Self->{Translation}->{'Save change as a template.'} = '';
    $Self->{Translation}->{'Save workorder as a template.'} = '';
    $Self->{Translation}->{'Schedule'} = '';
    $Self->{Translation}->{'Screen after creating a workorder'} = 'Ansicht nach Workorder-Erstellung';
    $Self->{Translation}->{'Search Changes.'} = '';
    $Self->{Translation}->{'Selects the change number generator module. "AutoIncrement" increments the change number, the SystemID and the counter are used with SystemID.counter format (e.g. 100118, 100119). With "Date", the change numbers will be generated by the current date and a counter; this format looks like Year.Month.Day.counter, e.g. 2010062400001, 2010062400002. With "DateChecksum", the counter will be appended as checksum to the string of date plus the SystemID. The checksum will be rotated on a daily basis. This format looks like Year.Month.Day.SystemID.Counter.CheckSum, e.g. 2010062410000017, 2010062410000026.'} =
        'Definiert das Change Nummer Generierung Modul. "AutoIncrement" erhöht die Change Nummer fortlaufend, dieses Format stellt sich als SystemID.Zähler dar (z.B. 100118, 100119). Mit "Datum" werden die Change Nummern aus dem aktuellen Datum und einem Zähler generiert, dieses Format stellt sich als Jahr.Monat.Tag.Zähler dar, z.B. 2010062400001, 2010062400002. Mit "DataChecksum" hängt der Zähler eine Prüfziffer an den Wert an zuzüglich der SystemID. Die Prüfziffer ändert sich täglich, dieses Format stellt sich als Jahr.Monat.Tag.SystemID.Zähler.Prüfziffer dar, z.B. 2010062410000017, 2010062410000026.';
    $Self->{Translation}->{'Set the agent for the workorder.'} = '';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        'Definiert die maximale Höhe (in Pixel) für Inline-HTML-Felder in  AgentITSMChangeZoom und AgentITSMWorkOrderZoom.';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        'Definiert die maximale Höhe (in Pixel) für Inline-HTML-Felder in  AgentITSMChangeZoom und AgentITSMWorkOrderZoom.';
    $Self->{Translation}->{'Sets the minimal change counter size (if "AutoIncrement" was selected as ITSMChange::NumberGenerator). Default is 5, this means the counter starts from 10000.'} =
        'Definiert die minimale Zählergröße für Changes (wenn "AutoIncrement" unter ITSMChange::NumberGenerator ausgewählt wurde). Standard ist 5, d.h. der Zähler startet mit 10000.';
    $Self->{Translation}->{'Sets up the state machine for changes.'} = 'Konfiguration für die State Machine für Changes.';
    $Self->{Translation}->{'Sets up the state machine for workorders.'} = 'Konfiguration für die State Machine für Workorders.';
    $Self->{Translation}->{'Shows a checkbox in the AgentITSMWorkOrderEdit screen that defines if the the following workorders should also be moved if a workorder is modified and the planned end time has changed.'} =
        'Zeigt in der "Workorder bearbeiten" Ansicht der Agenten-Oberfläche einen  Checkbox die es erlaubt die nachfolgenden Workorder zu verschieben falls die bearbeitete Workorder verändert wurde und der geplante Fertigstellungstermin sich geändert hat.';
    $Self->{Translation}->{'Shows a link in the menu that allows changing the workorder agent, in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a change as a template in the zoom view of the change, in the agent interface.'} =
        'Zeigt in der "Change Zoom" Ansicht der Agenten-Oberfläche einen  Menu Link der es erlaubt den Change als Vorlage zu speichern.';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a workorder as a template in the zoom view of the workorder, in the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows editing the report of a workorder, in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a change with another object in the change zoom view of the agent interface.'} =
        'Zeigt in der "Change Zoom" Ansicht der Agenten-Oberfläche einen  Menu Link der es erlaubt den Change mit einem anderen Objekt zu verknüpfen.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a workorder with another object in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows moving the time slot of a change in its zoom view of the agent interface.'} =
        'Zeigt in der Change Zoom Ansicht des Agenten-Interfaces einen Menu Link zum Ändern des Zeitfensters.';
    $Self->{Translation}->{'Shows a link in the menu that allows taking a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the conditions of a change in the its zoom view of the agent interface.'} =
        'Zeigt in der Change Zoom Ansicht des Agenten-Interfaces einen Menu Link zum Zugriff auf die Bedingungen.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a change in the its zoom view of the agent interface.'} =
        'Zeigt in der Change Zoom Ansicht des Agenten-Interfaces einen Menu Link zum Zugriff auf die Historie.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to add a workorder in the change zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to delete a change in its zoom view of the agent interface.'} =
        'Zeigt in der Change Zoom Ansicht des Agenten-Interfaces einen Menu Link zum Löschen.';
    $Self->{Translation}->{'Shows a link in the menu to delete a workorder in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a change in the its zoom view of the agent interface.'} =
        'Zeigt in der Change Zoom Ansicht des Agenten-Interfaces einen Menu Link zum Bearbeiten.';
    $Self->{Translation}->{'Shows a link in the menu to edit a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the change zoom view of the agent interface.'} =
        'Zeigt in der Change Zoom Ansicht des Agenten-Interfaces einen Menu Link zum Zurückgehen.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the workorder zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a change in the its zoom view of the agent interface.'} =
        'Zeigt in der "Change Zoom" Ansicht der Agenten-Oberfläche einen  Menu Link der es erlaubt den Change auszudrucken.';
    $Self->{Translation}->{'Shows a link in the menu to print a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to reset a change and its workorders in its zoom view of the agent interface.'} =
        'Zeigt in der "Change Zoom" Ansicht der Agenten-Oberfläche einen  Menu Link der es erlaubt den Change und seine Workorders zurückzusetzen.';
    $Self->{Translation}->{'Shows the change history (reverse ordered) in the agent interface.'} =
        'Zeigt in Änderungschronik (umgekehrte Reihenfolge) in der Agentenoberfläche an.';
    $Self->{Translation}->{'State Machine'} = 'State Machine';
    $Self->{Translation}->{'Stores change and workorder ids and their corresponding template id, while a user is editing a template.'} =
        'Speichert Change und Workorder ID und die zugehörige Vorlagen ID während ein Benutzer das Template bearbeitet.';
    $Self->{Translation}->{'Take Workorder.'} = 'Arbeitsauftrag übernehmen.';
    $Self->{Translation}->{'Take the workorder.'} = '';
    $Self->{Translation}->{'Template.'} = '';
    $Self->{Translation}->{'The identifier for a change, e.g. Change#, MyChange#. The default is Change#.'} =
        'Change-Identifikator, z. B. Change#, MeinChange#. Als Standard wird Change# verwendet.';
    $Self->{Translation}->{'The identifier for a workorder, e.g. Workorder#, MyWorkorder#. The default is Workorder#.'} =
        'Workorder-Identifikator, z. B. Workorder#, MeineWorkorder#. Als Standard wird Workorder# verwendet.';
    $Self->{Translation}->{'This ACL module restricts the usuage of the ticket types that are defined in the sysconfig option \'ITSMChange::AddChangeLinkTicketTypes\', to users of the groups as defined in "ITSMChange::RestrictTicketTypes::Groups". As this ACL could collide with other ACLs which are also related to the ticket type, this sysconfig option is disabled by default and should only be activated if needed.'} =
        'Dieses ACL Modul beschränkt die Nutzung von Tickettypen welche in der Systemkonfiguration unter "ITSMChange::AddChangeLinkTicketTypes" definiert sind, zu den Nutzern der Gruppen aus "ITSMChange::RestrictTicketTypes::Groups". Weil diese ACL mit anderen ACL\'s, welche gebunden an den Tickettypen sind, kollidieren könnte, ist diese Option standardmäßig deaktiviert und sollte nur nach Bedarf aktiviert werden. ';
    $Self->{Translation}->{'Time Slot'} = '';
    $Self->{Translation}->{'Types of tickets, where in the ticket zoom view a link to add a change will be displayed.'} =
        'Typen der Tickets, in denen im Ticket-Zoom ein Link angezeigt wird, um einen Change zu erstellen.';
    $Self->{Translation}->{'User Search'} = '';
    $Self->{Translation}->{'Workorder Add (from template).'} = '';
    $Self->{Translation}->{'Workorder Add.'} = 'Arbeitsauftrag hinzufügen.';
    $Self->{Translation}->{'Workorder Agent'} = '';
    $Self->{Translation}->{'Workorder Agent.'} = '';
    $Self->{Translation}->{'Workorder Delete.'} = 'Arbeitsauftrag löschen.';
    $Self->{Translation}->{'Workorder Edit.'} = 'Arbeitsauftrag bearbeiten.';
    $Self->{Translation}->{'Workorder History Zoom.'} = '';
    $Self->{Translation}->{'Workorder History.'} = '';
    $Self->{Translation}->{'Workorder Report.'} = '';
    $Self->{Translation}->{'Workorder Zoom.'} = '';
    $Self->{Translation}->{'once'} = 'einmalig';
    $Self->{Translation}->{'regularly'} = 'regelmäßig';

}

1;
