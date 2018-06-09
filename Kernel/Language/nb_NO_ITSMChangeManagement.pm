# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nb_NO_ITSMChangeManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMChangeManagement
    $Self->{Translation}->{'ITSMChange'} = 'Endring';
    $Self->{Translation}->{'ITSMChanges'} = 'Endringer';
    $Self->{Translation}->{'ITSM Changes'} = 'Endringer';
    $Self->{Translation}->{'workorder'} = 'Arbeidsordre';
    $Self->{Translation}->{'A change must have a title!'} = 'En endring må ha en tittel!';
    $Self->{Translation}->{'A condition must have a name!'} = 'En forutsetning må ha et navn!';
    $Self->{Translation}->{'A template must have a name!'} = 'En mal må ha et navn!';
    $Self->{Translation}->{'A workorder must have a title!'} = 'En arbeidsordre må ha en tittel!';
    $Self->{Translation}->{'Add CAB Template'} = 'Legg til CAB-mal';
    $Self->{Translation}->{'Add Workorder'} = 'Legg til Arbeidordre';
    $Self->{Translation}->{'Add a workorder to the change'} = 'Legg en arbeidsordre til endringen';
    $Self->{Translation}->{'Add new condition and action pair'} = 'Legg til nytt forutsetning-gjøremål-par';
    $Self->{Translation}->{'Agent interface module to show the ChangeManager overview icon.'} =
        '';
    $Self->{Translation}->{'Agent interface module to show the MyCAB overview icon.'} = '';
    $Self->{Translation}->{'Agent interface module to show the MyChanges overview icon.'} = '';
    $Self->{Translation}->{'Agent interface module to show the MyWorkOrders overview icon.'} =
        '';
    $Self->{Translation}->{'CABAgents'} = 'CAB-saksbehandlere';
    $Self->{Translation}->{'CABCustomers'} = 'CAB-kunder';
    $Self->{Translation}->{'Change Overview'} = 'Endring Oversikt';
    $Self->{Translation}->{'Change Schedule'} = 'Endre tidsplan';
    $Self->{Translation}->{'Change involved persons of the change'} = 'Endre involverte personer i endringen';
    $Self->{Translation}->{'ChangeHistory::ActionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ActionAddID'} = 'Nytt gjøremål (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ActionDelete'} = 'Gjøremål (ID=%s) slettet';
    $Self->{Translation}->{'ChangeHistory::ActionDeleteAll'} = 'Alle gjøremål for forutsetning (ID=%s) slettet';
    $Self->{Translation}->{'ChangeHistory::ActionExecute'} = 'Gjøremål (ID=%s) utført: %s';
    $Self->{Translation}->{'ChangeHistory::ActionUpdate'} = '%s (Gjøremål ID=%s): Ny: %s -> Gammel: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeActualEndTimeReached'} = 'Endring (ID=%s) har nådd faktisk sluttid.';
    $Self->{Translation}->{'ChangeHistory::ChangeActualStartTimeReached'} = 'Endring (ID=%s) har nådd faktisk starttid.';
    $Self->{Translation}->{'ChangeHistory::ChangeAdd'} = 'Ny Endring (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentAdd'} = 'Nytt Vedlegg: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentDelete'} = 'Slettet Vedlegg %s';
    $Self->{Translation}->{'ChangeHistory::ChangeCABDelete'} = 'CAB Slettet %s';
    $Self->{Translation}->{'ChangeHistory::ChangeCABUpdate'} = '%s: Ny: %s -> Gammel: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkAdd'} = 'Kobling til %s (ID=%s) lagt til';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkDelete'} = 'Kobling til %s (ID=%s) slettet';
    $Self->{Translation}->{'ChangeHistory::ChangeNotificationSent'} = 'Melding sendt til %s (Hendelse: %s)';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedEndTimeReached'} = 'Endring (ID=%s) har nådd planlagt sluttid.';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedStartTimeReached'} = 'Endring (ID=%s) har nådd planlagt starttid.';
    $Self->{Translation}->{'ChangeHistory::ChangeRequestedTimeReached'} = 'Endring (ID=%s) har nådd forespurt tid.';
    $Self->{Translation}->{'ChangeHistory::ChangeUpdate'} = '%s: Ny: %s -> Gammel: %s';
    $Self->{Translation}->{'ChangeHistory::ConditionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ConditionAddID'} = 'Ny forutsetning (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ConditionDelete'} = 'Forutsetning (ID=%s) slettet';
    $Self->{Translation}->{'ChangeHistory::ConditionDeleteAll'} = 'Alle Forutsetninger for Endring (ID=%s) slettet';
    $Self->{Translation}->{'ChangeHistory::ConditionUpdate'} = '%s (Forutsetning ID=%s): Ny: %s -> Gammel: %s';
    $Self->{Translation}->{'ChangeHistory::ExpressionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ExpressionAddID'} = 'Nytt uttrykk (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ExpressionDelete'} = 'Uttrykk (ID=%s) Slettet';
    $Self->{Translation}->{'ChangeHistory::ExpressionDeleteAll'} = 'Alle Uttrykk for Forutsetning (ID=%s) slettet';
    $Self->{Translation}->{'ChangeHistory::ExpressionUpdate'} = '%s (Uttrykk ID=%s): Ny: %s -> Gammel: %s';
    $Self->{Translation}->{'ChangeNumber'} = 'Endre nummer';
    $Self->{Translation}->{'Condition Edit'} = 'Endre Forutsetning';
    $Self->{Translation}->{'Create Change'} = 'Opprett Endring';
    $Self->{Translation}->{'Create a change from this ticket!'} = 'Opprett en Endring fra denne saken';
    $Self->{Translation}->{'Delete Workorder'} = 'Slett Arbeidsordre';
    $Self->{Translation}->{'Edit the change'} = 'Rediger endringen';
    $Self->{Translation}->{'Edit the conditions of the change'} = 'Endre forutsetningene for denne endringen';
    $Self->{Translation}->{'Edit the workorder'} = 'Endre arbeidsordren';
    $Self->{Translation}->{'Expression'} = 'Uttrykk';
    $Self->{Translation}->{'Full-Text Search in Change and Workorder'} = 'Fulltekstsøk i Endring og Arbeidsordre';
    $Self->{Translation}->{'ITSMCondition'} = 'Forutsetning';
    $Self->{Translation}->{'ITSMWorkOrder'} = 'Arbeidsordre';
    $Self->{Translation}->{'Link another object to the change'} = 'Koble et annet objekt til endringen';
    $Self->{Translation}->{'Link another object to the workorder'} = 'Koble et annet objekt til arbeidsordren';
    $Self->{Translation}->{'Move all workorders in time'} = 'Flytt alle arbeidsordre i tid';
    $Self->{Translation}->{'My CABs'} = 'Mine Endringsråd';
    $Self->{Translation}->{'My Changes'} = 'Mine Endringer';
    $Self->{Translation}->{'My Workorders'} = 'Mine Arbeidsordre';
    $Self->{Translation}->{'No XXX settings'} = 'Ingen innstillinger for \'%s\'';
    $Self->{Translation}->{'PIR (Post Implementation Review)'} = 'PIR (Sluttevaluering)';
    $Self->{Translation}->{'PSA (Projected Service Availability)'} = 'PSA (Forventet tjenestetilgjengelighet)';
    $Self->{Translation}->{'Please select first a catalog class!'} = 'Vennligst velg en katalogklasse først!';
    $Self->{Translation}->{'Print the change'} = 'Skriv ut endringen';
    $Self->{Translation}->{'Print the workorder'} = 'Skriv ut arbeidsordren';
    $Self->{Translation}->{'RequestedTime'} = 'Forespurt tid';
    $Self->{Translation}->{'Save Change CAB as Template'} = 'Lagre Endringsråd som mal';
    $Self->{Translation}->{'Save change as a template'} = 'Lagre Endring som mal';
    $Self->{Translation}->{'Save workorder as a template'} = 'Lagre Arbeidsordre som mal';
    $Self->{Translation}->{'Search Changes'} = 'Søk i Endringer';
    $Self->{Translation}->{'Set the agent for the workorder'} = 'Sett saksbehandler for arbeidsordren';
    $Self->{Translation}->{'Take Workorder'} = 'Ta arbeidsordre';
    $Self->{Translation}->{'Take the workorder'} = 'Ta arbeidsordren';
    $Self->{Translation}->{'Template Overview'} = 'Maloversikt';
    $Self->{Translation}->{'The planned end time is invalid!'} = 'Planlagt sluttid er ugyldig!';
    $Self->{Translation}->{'The planned start time is invalid!'} = 'Planlagt starttid er ugyldig!';
    $Self->{Translation}->{'The planned time is invalid!'} = 'Planlagt tid er ugyldig!';
    $Self->{Translation}->{'The requested time is invalid!'} = 'Forespurt tid er ugyldig!';
    $Self->{Translation}->{'New (from template)'} = '';
    $Self->{Translation}->{'Add from template'} = '';
    $Self->{Translation}->{'Add Workorder (from template)'} = '';
    $Self->{Translation}->{'Add a workorder (from template) to the change'} = '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReached'} = 'Arbeidsordre (ID=%s) har nådd faktisk sluttid.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReachedWithWorkOrderID'} =
        'Arbeidsordre (ID=%s) har nådd faktisk sluttid.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReached'} = 'Arbeidsordre (ID=%s) har nådd faktisk starttid.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReachedWithWorkOrderID'} =
        'Arbeidsordre (ID=%s) har nådd faktisk starttid.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAdd'} = 'Ny Arbeidsordre (ID=%s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAddWithWorkOrderID'} = 'Ny Arbeidsordre (ID=%s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAdd'} = 'Nytt vedlegg til Arbeidsordre: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAddWithWorkOrderID'} = '(ID=%s) Nytt vedlegg til Arbeidsordre: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDelete'} = 'Slettet vedlegget fra Arbeidsordre: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDeleteWithWorkOrderID'} = '(ID=%s) Slettet vedlegget fra Arbeidsordre: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAdd'} = '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAddWithWorkOrderID'} =
        '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDelete'} = '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDeleteWithWorkOrderID'} =
        '';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDelete'} = 'Arbeidsordre (ID=%s) slettet';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDeleteWithWorkOrderID'} = 'Arbeidsordre (ID=%s) slettet';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAdd'} = 'Kobling til %s (ID=%s) lagt til';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAddWithWorkOrderID'} = '(ID=%s) Kobling til %s (ID=%s) lagt til';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDelete'} = 'Kobling til %s (ID=%s) slettet';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDeleteWithWorkOrderID'} = '(ID=%s) Kobling til %s (ID=%s) slettet';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSent'} = 'Melding sendt til %s (Hendelse: %s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSentWithWorkOrderID'} = '(ID=%s) Melding sent til %s (Hendelse: %s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReached'} = 'Arbeidsordre (ID=%s) har nådd planlagt sluttid.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReachedWithWorkOrderID'} =
        'Arbeidsordre (ID=%s) har nådd planlagt sluttid.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReached'} = 'Arbeidsordre (ID=%s) har nådd planlagt starttid.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReachedWithWorkOrderID'} =
        'Arbeidsordre (ID=%s) har nådd planlagt starttid.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdate'} = '%s: Ny: %s -> Gammel: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdateWithWorkOrderID'} = '(ID=%s) %s: Ny: %s -> Gammel: %s';
    $Self->{Translation}->{'WorkOrderNumber'} = 'Arbeidsordre nr';
    $Self->{Translation}->{'accepted'} = 'Akseptert';
    $Self->{Translation}->{'any'} = 'hvilken som helst';
    $Self->{Translation}->{'approval'} = 'Godkjenning';
    $Self->{Translation}->{'approved'} = 'Godkjent';
    $Self->{Translation}->{'backout'} = 'Plan for gjenoppretting';
    $Self->{Translation}->{'begins with'} = 'starter med';
    $Self->{Translation}->{'canceled'} = 'Avbrutt';
    $Self->{Translation}->{'contains'} = 'inneholder';
    $Self->{Translation}->{'created'} = 'Opprettet';
    $Self->{Translation}->{'decision'} = 'Beslutning';
    $Self->{Translation}->{'ends with'} = 'slutter med';
    $Self->{Translation}->{'failed'} = 'feilet';
    $Self->{Translation}->{'in progress'} = 'Under arbeid';
    $Self->{Translation}->{'is'} = 'er';
    $Self->{Translation}->{'is after'} = 'er etter';
    $Self->{Translation}->{'is before'} = 'er før';
    $Self->{Translation}->{'is empty'} = 'er tom';
    $Self->{Translation}->{'is greater than'} = 'er større enn';
    $Self->{Translation}->{'is less than'} = 'er mindre enn';
    $Self->{Translation}->{'is not'} = 'er ikke';
    $Self->{Translation}->{'is not empty'} = 'er ikke tom';
    $Self->{Translation}->{'not contains'} = 'inneholder ikke';
    $Self->{Translation}->{'pending approval'} = 'Avventer godkjenning';
    $Self->{Translation}->{'pending pir'} = 'Avventer Sluttevaluering';
    $Self->{Translation}->{'pir'} = 'PIR (Sluttevaluering)';
    $Self->{Translation}->{'ready'} = 'Klar';
    $Self->{Translation}->{'rejected'} = 'Avvist';
    $Self->{Translation}->{'requested'} = 'Forespurt';
    $Self->{Translation}->{'retracted'} = 'Trukket tilbake';
    $Self->{Translation}->{'set'} = 'satt';
    $Self->{Translation}->{'successful'} = 'Vellykket';

    # Template: AdminITSMChangeCIPAllocate
    $Self->{Translation}->{'Category <-> Impact <-> Priority'} = 'Kategori <-> Omfang <-> Prioritet';
    $Self->{Translation}->{'Manage the priority result of combinating Category <-> Impact.'} =
        'Sett opp valg av prioritet basert på Kategori <-> Omfang';
    $Self->{Translation}->{'Priority allocation'} = 'Tildeling av prioritet';

    # Template: AdminITSMChangeNotification
    $Self->{Translation}->{'ITSM ChangeManagement Notification Management'} = 'ITSM Endringer - Meldingsoppsett';
    $Self->{Translation}->{'Add Notification Rule'} = 'Legg til Meldingsregel';
    $Self->{Translation}->{'Rule'} = 'Regel';
    $Self->{Translation}->{'A notification should have a name!'} = 'En melding må ha et navn!';
    $Self->{Translation}->{'Name is required.'} = 'Navn er påkrevd';

    # Template: AdminITSMStateMachine
    $Self->{Translation}->{'Admin State Machine'} = '';
    $Self->{Translation}->{'Select a catalog class!'} = 'Velg en katalogklasse';
    $Self->{Translation}->{'A catalog class is required!'} = 'En katalogklasse er påkrevd!';
    $Self->{Translation}->{'Add a state transition'} = 'Legg til en tilstandsendring';
    $Self->{Translation}->{'Catalog Class'} = 'Katalogklasse';
    $Self->{Translation}->{'Object Name'} = 'Objektets navn';
    $Self->{Translation}->{'Overview over state transitions for'} = 'Oversikt over tilstandsendringer for';
    $Self->{Translation}->{'Delete this state transition'} = '';
    $Self->{Translation}->{'Add a new state transition for'} = 'Ny tilstandsendring for';
    $Self->{Translation}->{'Please select a state!'} = 'Vennligst velg en tilstand!';
    $Self->{Translation}->{'Please select a next state!'} = 'Vennligst velg neste tilstand!';
    $Self->{Translation}->{'Edit a state transition for'} = 'Redigér en tilstandsendring for';
    $Self->{Translation}->{'Do you really want to delete the state transition'} = 'Vil du virkelig slette tilstandsendringen?';

    # Template: AgentITSMChangeAdd
    $Self->{Translation}->{'Add Change'} = 'Legg til Endring';
    $Self->{Translation}->{'ITSM Change'} = 'Endring';
    $Self->{Translation}->{'Justification'} = 'Berettigelse';
    $Self->{Translation}->{'Input invalid.'} = 'Ugyldig verdi.';
    $Self->{Translation}->{'Impact'} = 'Omfang';
    $Self->{Translation}->{'Requested Date'} = 'Forespurt dato';

    # Template: AgentITSMChangeAddFromTemplate
    $Self->{Translation}->{'Select Change Template'} = 'Velg mal for Endring';
    $Self->{Translation}->{'Time type'} = 'Tidstype';
    $Self->{Translation}->{'Invalid time type.'} = 'Ugyldig tidstype';
    $Self->{Translation}->{'New time'} = 'Ny tid';

    # Template: AgentITSMChangeCABTemplate
    $Self->{Translation}->{'Save Change CAB as template'} = 'Lagre Endring-CAB som mal';
    $Self->{Translation}->{'go to involved persons screen'} = 'Gå til involverte personer';
    $Self->{Translation}->{'Invalid Name'} = 'Ugyldig navn';

    # Template: AgentITSMChangeCondition
    $Self->{Translation}->{'Conditions and Actions'} = 'Forutsetninger og Gjøremål';
    $Self->{Translation}->{'Delete Condition'} = 'Slett forutsetning';
    $Self->{Translation}->{'Add new condition'} = 'Legg til ny forutsetning';

    # Template: AgentITSMChangeConditionEdit
    $Self->{Translation}->{'Edit Condition'} = '';
    $Self->{Translation}->{'Need a valid name.'} = 'Trenger et gyldig navn';
    $Self->{Translation}->{'A valid name is needed.'} = '';
    $Self->{Translation}->{'Duplicate name:'} = '';
    $Self->{Translation}->{'This name is already used by another condition.'} = '';
    $Self->{Translation}->{'Matching'} = 'Som passer til';
    $Self->{Translation}->{'Any expression (OR)'} = 'Hvilket utrykk som helst (OR)';
    $Self->{Translation}->{'All expressions (AND)'} = 'Alle uttrykk (AND)';
    $Self->{Translation}->{'Expressions'} = 'Uttrykk';
    $Self->{Translation}->{'Selector'} = 'Velger';
    $Self->{Translation}->{'Operator'} = 'Operator';
    $Self->{Translation}->{'Delete Expression'} = '';
    $Self->{Translation}->{'No Expressions found.'} = 'Ingen uttrykk funnet.';
    $Self->{Translation}->{'Add new expression'} = 'Legg til nytt uttrykk';
    $Self->{Translation}->{'Delete Action'} = '';
    $Self->{Translation}->{'No Actions found.'} = 'Ingen gjøremål funnet';
    $Self->{Translation}->{'Add new action'} = 'Legg til gjøremål';

    # Template: AgentITSMChangeDelete
    $Self->{Translation}->{'Do you really want to delete this change?'} = '';

    # Template: AgentITSMChangeHistory
    $Self->{Translation}->{'History of'} = 'Historikk for';
    $Self->{Translation}->{'Workorder'} = 'Arbeidsordre';
    $Self->{Translation}->{'Show details'} = 'Vis detaljer';
    $Self->{Translation}->{'Show workorder'} = 'Vis arbeidsordre';

    # Template: AgentITSMChangeHistoryZoom
    $Self->{Translation}->{'Detailed history information of'} = 'Detaljert historikk for';
    $Self->{Translation}->{'Modified'} = 'Modifisert';
    $Self->{Translation}->{'Old Value'} = 'Gammel verdi';
    $Self->{Translation}->{'New Value'} = 'Ny verdi';

    # Template: AgentITSMChangeInvolvedPersons
    $Self->{Translation}->{'Involved Persons'} = 'Involverte personer';
    $Self->{Translation}->{'ChangeManager'} = 'Endringsansvarlig';
    $Self->{Translation}->{'User invalid.'} = 'Ugyldig bruker';
    $Self->{Translation}->{'ChangeBuilder'} = 'Opprettet av';
    $Self->{Translation}->{'Change Advisory Board'} = 'Endringsråd';
    $Self->{Translation}->{'CAB Template'} = 'CAB-mal';
    $Self->{Translation}->{'Apply Template'} = 'Bruk mal';
    $Self->{Translation}->{'NewTemplate'} = 'Ny mal';
    $Self->{Translation}->{'Save this CAB as template'} = 'Lagre dette Endringsråd som mal';
    $Self->{Translation}->{'Add to CAB'} = 'Legg til CAB';
    $Self->{Translation}->{'Invalid User'} = 'Ugyldig bruker';
    $Self->{Translation}->{'Current CAB'} = 'Nåværende CAB';

    # Template: AgentITSMChangeOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Kontekstvalg';
    $Self->{Translation}->{'Changes per page'} = 'Endringer per side';

    # Template: AgentITSMChangeOverviewSmall
    $Self->{Translation}->{'WorkOrderTitle'} = 'Arbeidsordretittel';
    $Self->{Translation}->{'ChangeTitle'} = 'Endringstittel';
    $Self->{Translation}->{'WorkOrderAgent'} = 'Saksbehandler for arbeidsordre';
    $Self->{Translation}->{'Workorders'} = 'Arbeidsordre';
    $Self->{Translation}->{'ChangeState'} = 'Endringstilstand';
    $Self->{Translation}->{'WorkOrderState'} = 'Arbeidsordretilstand';
    $Self->{Translation}->{'WorkOrderType'} = 'Type Arbeidsordre';
    $Self->{Translation}->{'Requested Time'} = 'Forespurt tid';
    $Self->{Translation}->{'PlannedStartTime'} = 'Planlagt start';
    $Self->{Translation}->{'PlannedEndTime'} = 'Planlagt slutt';
    $Self->{Translation}->{'ActualStartTime'} = 'Faktisk start';
    $Self->{Translation}->{'ActualEndTime'} = 'Faktisk slutt';

    # Template: AgentITSMChangeReset
    $Self->{Translation}->{'Do you really want to reset this change?'} = '';

    # Template: AgentITSMChangeSearch
    $Self->{Translation}->{'(e.g. 10*5155 or 105658*)'} = '(f.eks. 10*5155 eller 888*)';
    $Self->{Translation}->{'CABAgent'} = 'CAB-saksbehandler';
    $Self->{Translation}->{'e.g.'} = 'f.eks.';
    $Self->{Translation}->{'CABCustomer'} = 'CAB-kunde';
    $Self->{Translation}->{'ITSM Workorder'} = 'Arbeidsordre';
    $Self->{Translation}->{'Instruction'} = 'Instruks';
    $Self->{Translation}->{'Report'} = 'Rapport';
    $Self->{Translation}->{'Change Category'} = 'Endre kategori';
    $Self->{Translation}->{'(before/after)'} = '(før/etter)';
    $Self->{Translation}->{'(between)'} = '(mellom)';

    # Template: AgentITSMChangeTemplate
    $Self->{Translation}->{'Save Change as Template'} = 'Lagre Endring som Mal';
    $Self->{Translation}->{'A template should have a name!'} = 'En mal må ha et navn!';
    $Self->{Translation}->{'The template name is required.'} = 'Malnavnet er påkrevd.';
    $Self->{Translation}->{'Reset States'} = 'Nullstill tilstander';
    $Self->{Translation}->{'Overwrite original template'} = '';
    $Self->{Translation}->{'Delete original change'} = '';

    # Template: AgentITSMChangeTimeSlot
    $Self->{Translation}->{'Move Time Slot'} = 'Flytt tidsrommet';

    # Template: AgentITSMChangeZoom
    $Self->{Translation}->{'Change Information'} = 'Endringsinfo';
    $Self->{Translation}->{'PlannedEffort'} = 'Planlagt innsats';
    $Self->{Translation}->{'Change Initiator(s)'} = 'Initiativtaker(e) til Endring';
    $Self->{Translation}->{'Change Manager'} = 'Endringsansvarlig';
    $Self->{Translation}->{'Change Builder'} = 'Den som opprettet Endringen';
    $Self->{Translation}->{'CAB'} = 'CAB';
    $Self->{Translation}->{'Last changed'} = 'Sist endret';
    $Self->{Translation}->{'Last changed by'} = 'Sist endret av';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        '';
    $Self->{Translation}->{'Download Attachment'} = 'Last ned vedlegg';

    # Template: AgentITSMTemplateEditCAB
    $Self->{Translation}->{'Edit CAB Template'} = '';

    # Template: AgentITSMTemplateEditContent
    $Self->{Translation}->{'This will create a new change from this template, so you can edit and save it.'} =
        '';
    $Self->{Translation}->{'The new change will be deleted automatically after it has been saved as template.'} =
        '';
    $Self->{Translation}->{'This will create a new workorder from this template, so you can edit and save it.'} =
        '';
    $Self->{Translation}->{'A temporary change will be created which contains the workorder.'} =
        '';
    $Self->{Translation}->{'The temporary change and new workorder will be deleted automatically after the workorder has been saved as template.'} =
        '';
    $Self->{Translation}->{'Do you want to proceed?'} = '';

    # Template: AgentITSMTemplateOverviewSmall
    $Self->{Translation}->{'TemplateID'} = 'Mal-ID';
    $Self->{Translation}->{'Edit Content'} = '';
    $Self->{Translation}->{'CreateBy'} = 'Opprettet av';
    $Self->{Translation}->{'CreateTime'} = 'Opprettet';
    $Self->{Translation}->{'ChangeBy'} = 'Opprettet av';
    $Self->{Translation}->{'ChangeTime'} = 'Endret';
    $Self->{Translation}->{'Edit Template Content'} = '';
    $Self->{Translation}->{'Delete Template'} = 'Slett Mal';

    # Template: AgentITSMWorkOrderAdd
    $Self->{Translation}->{'Add Workorder to'} = 'Legg Arbeidsordre til';
    $Self->{Translation}->{'Invalid workorder type.'} = 'Ugyldig type arbeidsordre';
    $Self->{Translation}->{'The planned start time must be before the planned end time!'} = 'Planlagt starttid må være før planlagt sluttid';
    $Self->{Translation}->{'Invalid format.'} = 'Ugyldig format.';

    # Template: AgentITSMWorkOrderAddFromTemplate
    $Self->{Translation}->{'Select Workorder Template'} = 'Velg mal for Arbeidsordren';

    # Template: AgentITSMWorkOrderDelete
    $Self->{Translation}->{'Do you really want to delete this workorder?'} = 'Virkelig slette denne arbeidsordren?';
    $Self->{Translation}->{'You can not delete this Workorder. It is used in at least one Condition!'} =
        'Du kan ikke slette arbeidsordren. Den er i bruk av minst én forutsetning!';
    $Self->{Translation}->{'This Workorder is used in the following Condition(s)'} = 'Denne arbeidsordren brukes av følgende Forutsetning(er)';

    # Template: AgentITSMWorkOrderEdit
    $Self->{Translation}->{'Move following workorders accordingly'} = '';
    $Self->{Translation}->{'If the planned end time of this workorder is changed, the planned start times of all following workorders will be changed accordingly'} =
        '';

    # Template: AgentITSMWorkOrderReport
    $Self->{Translation}->{'The actual start time must be before the actual end time!'} = 'Faktisk starttid må være før faktisk sluttid';
    $Self->{Translation}->{'The actual start time must be set, when the actual end time is set!'} =
        'Hvis sluttiden settes må også starttid settes!';

    # Template: AgentITSMWorkOrderTake
    $Self->{Translation}->{'Current Agent'} = 'Nåværende saksbehandler';
    $Self->{Translation}->{'Do you really want to take this workorder?'} = 'Vil du virkelig ta denne arbeidsordren?';

    # Template: AgentITSMWorkOrderTemplate
    $Self->{Translation}->{'Save Workorder as Template'} = 'Lagre Arbeidsordre som Mal';
    $Self->{Translation}->{'Delete original workorder (and surrounding change)'} = '';

    # Template: AgentITSMWorkOrderZoom
    $Self->{Translation}->{'Workorder Information'} = 'Arbeidsordre-info';

    # Perl Module: Kernel/Modules/AdminITSMChangeNotification.pm
    $Self->{Translation}->{'Unknown notification %s!'} = '';
    $Self->{Translation}->{'There was an error creating the notification.'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChange.pm
    $Self->{Translation}->{'Overview: ITSM Changes'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeAdd.pm
    $Self->{Translation}->{'Ticket with TicketID %s does not exist!'} = '';
    $Self->{Translation}->{'Please contact the admin.'} = '';
    $Self->{Translation}->{'Missing sysconfig option "ITSMChange::AddChangeLinkTicketTypes"!'} =
        '';
    $Self->{Translation}->{'Was not able to add change!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeAddFromTemplate.pm
    $Self->{Translation}->{'Was not able to create change from template!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeCABTemplate.pm
    $Self->{Translation}->{'No ChangeID is given!'} = '';
    $Self->{Translation}->{'No change found for changeID %s.'} = '';
    $Self->{Translation}->{'The CAB of change "%s" could not be serialized.'} = '';
    $Self->{Translation}->{'Could not add the template.'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeCondition.pm
    $Self->{Translation}->{'Change "%s" not found in database!'} = '';
    $Self->{Translation}->{'Could not delete ConditionID %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeConditionEdit.pm
    $Self->{Translation}->{'No %s is given!'} = '';
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
    $Self->{Translation}->{'Was not able to update Change!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no ChangeID is given!'} = '';
    $Self->{Translation}->{'Change "%s" not found in the database!'} = '';
    $Self->{Translation}->{'Unknown type "%s" encountered!'} = '';
    $Self->{Translation}->{'Change History'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistoryZoom.pm
    $Self->{Translation}->{'Can\'t show history zoom, no HistoryEntryID is given!'} = '';
    $Self->{Translation}->{'HistoryEntry "%s" not found in database!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeInvolvedPersons.pm
    $Self->{Translation}->{'Was not able to update Change CAB for Change %s!'} = '';
    $Self->{Translation}->{'Was not able to update Change %s!'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeManager.pm
    $Self->{Translation}->{'Overview: ChangeManager'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyCAB.pm
    $Self->{Translation}->{'Overview: My CAB'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyChanges.pm
    $Self->{Translation}->{'Overview: My Changes'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyWorkOrders.pm
    $Self->{Translation}->{'Overview: My Workorders'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangePIR.pm
    $Self->{Translation}->{'Overview: PIR'} = '';

    # Perl Module: Kernel/Modules/AgentITSMChangePSA.pm
    $Self->{Translation}->{'Overview: PSA'} = '';

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
    $Self->{Translation}->{'WorkOrders'} = 'Arbeidsordre';
    $Self->{Translation}->{'Change Search Result'} = '';
    $Self->{Translation}->{'Change Number'} = '';
    $Self->{Translation}->{'Change Title'} = '';
    $Self->{Translation}->{'Work Order Title'} = '';
    $Self->{Translation}->{'CAB Agent'} = '';
    $Self->{Translation}->{'CAB Customer'} = '';
    $Self->{Translation}->{'Change Description'} = '';
    $Self->{Translation}->{'Change Justification'} = '';
    $Self->{Translation}->{'WorkOrder Instruction'} = '';
    $Self->{Translation}->{'WorkOrder Report'} = '';
    $Self->{Translation}->{'Change Priority'} = '';
    $Self->{Translation}->{'Change Impact'} = '';
    $Self->{Translation}->{'Change State'} = '';
    $Self->{Translation}->{'Created By'} = '';
    $Self->{Translation}->{'WorkOrder State'} = '';
    $Self->{Translation}->{'WorkOrder Type'} = '';
    $Self->{Translation}->{'WorkOrder Agent'} = '';
    $Self->{Translation}->{'Planned Start Time'} = '';
    $Self->{Translation}->{'Planned End Time'} = '';
    $Self->{Translation}->{'Actual Start Time'} = '';
    $Self->{Translation}->{'Actual End Time'} = '';
    $Self->{Translation}->{'Change Time'} = '';
    $Self->{Translation}->{'before'} = '';

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
    $Self->{Translation}->{'My Work Orders'} = '';

    # SysConfig
    $Self->{Translation}->{'A list of the agents who have permission to take workorders. Key is a login name. Content is 0 or 1.'} =
        'Liste over saksbehandlere som har tilgang til å ta arbeidsordre. Innholdet er 0 eller 1.';
    $Self->{Translation}->{'A list of workorder states, at which the ActualStartTime of a workorder will be set if it was empty at this point.'} =
        'Liste over arbeidsordretilstander som vil utløse at faktisk starttid blir satt (hvis tom fra før).';
    $Self->{Translation}->{'Add Workorder (from Template)'} = '';
    $Self->{Translation}->{'Add a change from template.'} = '';
    $Self->{Translation}->{'Add a change.'} = '';
    $Self->{Translation}->{'Add a workorder (from template) to the change.'} = '';
    $Self->{Translation}->{'Add a workorder to the change.'} = '';
    $Self->{Translation}->{'Admin of the CIP matrix.'} = 'Administrasjon av CIP-matrisen';
    $Self->{Translation}->{'Admin of the state machine.'} = 'Administrasjon av tilstandsendringer';
    $Self->{Translation}->{'Agent interface notification module to see the number of change advisory boards.'} =
        'Saksbehandlermodul som viser antallet endringsråd.';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes managed by the user.'} =
        'Saksbehandlermodul som viser antallet endringer styrt av brukeren.';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes.'} =
        'Saksbehandlermodul som viser antallet endringer.';
    $Self->{Translation}->{'Agent interface notification module to see the number of workorders.'} =
        '';
    $Self->{Translation}->{'CAB Member Search'} = '';
    $Self->{Translation}->{'Cache time in minutes for the change management toolbars. Default: 3 hours (180 minutes).'} =
        '';
    $Self->{Translation}->{'Cache time in minutes for the change management. Default: 5 days (7200 minutes).'} =
        '';
    $Self->{Translation}->{'Change CAB Templates'} = '';
    $Self->{Translation}->{'Change History.'} = '';
    $Self->{Translation}->{'Change Involved Persons.'} = '';
    $Self->{Translation}->{'Change Overview "Small" Limit'} = '';
    $Self->{Translation}->{'Change Overview.'} = '';
    $Self->{Translation}->{'Change Print.'} = '';
    $Self->{Translation}->{'Change Schedule.'} = '';
    $Self->{Translation}->{'Change Zoom.'} = '';
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
        'Setter opp hvor ofte meldinger blir sendt ut når planlagt starttid eller andre tidspunkter nås eller passeres';
    $Self->{Translation}->{'Create Change (from Template)'} = '';
    $Self->{Translation}->{'Create a change (from template) from this ticket.'} = '';
    $Self->{Translation}->{'Create a change from this ticket.'} = '';
    $Self->{Translation}->{'Create and manage ITSM Change Management notifications.'} = '';
    $Self->{Translation}->{'Default type for a workorder. This entry must exist in general catalog class \'ITSM::ChangeManagement::WorkOrder::Type\'.'} =
        'Forvalgt type for en arbeidsordre. Denne verdien må finnes i generell katalog.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define the signals for each workorder state.'} = 'Sett opp signaler for hver arbeidsordretilstand';
    $Self->{Translation}->{'Define which columns are shown in the linked Changes widget (LinkObject::ViewMode = "complex"). Note: Only Change attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked Workorder widget (LinkObject::ViewMode = "complex"). Note: Only Workorder attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a change list.'} =
        'Setter opp en oversiktsmodul til å vise "Liten" visning av endringslisten';
    $Self->{Translation}->{'Defines an overview module to show the small view of a template list.'} =
        'Setter opp en oversiktsmodul til å vise "Liten" visning av mal-listen';
    $Self->{Translation}->{'Defines if it will be possible to print the accounted time.'} = 'Spesifiserer om det er mulig å skrive ut kontert tid.';
    $Self->{Translation}->{'Defines if it will be possible to print the planned effort.'} = 'Spesifiserer om det er mulig å skrive ut planlagt innsats.';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) change end states should be allowed if a change is in a locked state.'} =
        '';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) workorder end states should be allowed if a workorder is in a locked state.'} =
        '';
    $Self->{Translation}->{'Defines if the accounted time should be shown.'} = 'Spesifiserer om tidskontering skal vises.';
    $Self->{Translation}->{'Defines if the actual start and end times should be set.'} = 'Spesifiserer om faktisk start- og sluttid bør settes.';
    $Self->{Translation}->{'Defines if the change search and the workorder search functions could use the mirror DB.'} =
        '';
    $Self->{Translation}->{'Defines if the change state can be set in AgentITSMChangeEdit.'} =
        'Spesifiserer om Endringstilstand kan settes i "Endre Endring"';
    $Self->{Translation}->{'Defines if the planned effort should be shown.'} = 'Spesifiserer om planlagt innsats skal vises.';
    $Self->{Translation}->{'Defines if the requested date should be print by customer.'} = 'Spesifiserer om forespurt dato skal kunne skrives ut av kunden';
    $Self->{Translation}->{'Defines if the requested date should be searched by customer.'} =
        'Spesifiserer om forespurt dato skal være søkbar av kunden';
    $Self->{Translation}->{'Defines if the requested date should be set by customer.'} = 'Spesifiserer om forespurt dato skal kunne settes av kunden.';
    $Self->{Translation}->{'Defines if the requested date should be shown by customer.'} = 'Spesifiserer om forespurt dato skal vises til kunden.';
    $Self->{Translation}->{'Defines if the workorder state should be shown.'} = 'Spesifiserer om arbeidsordrens tilstand skal vises.';
    $Self->{Translation}->{'Defines if the workorder title should be shown.'} = 'Spesifiserer om arbeidsordrens tittel skal vises.';
    $Self->{Translation}->{'Defines shown graph attributes.'} = '';
    $Self->{Translation}->{'Defines that only changes containing Workorders linked with services, which the customer user has permission to use will be shown. Any other changes will not be displayed.'} =
        'Spesifiserer at kun Endringer som inneholder Arbeidsordre som er koblet til Tjenester som kunden har tilgang til å bruke skal vises. Alle andre endringer vil ikke bli viste.';
    $Self->{Translation}->{'Defines the change states that will be allowed to delete.'} = '';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change PSA overview.'} =
        'Spesifiserer Endringstilstander som kan brukes som filtre i oversikten over Forventet Tilgjengelighet (PSA)';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change Schedule overview.'} =
        'Spesifiserer Endringstilstander som kan brukes som filtre i Endringsplan-oversikten';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyCAB overview.'} =
        'Spesifiserer Endringstilstander som kan brukes som filtre i "Mine Endringsråd"';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyChanges overview.'} =
        'Spesifiserer Endringstilstander som kan brukes som filtre i "Mine Endringer"';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change manager overview.'} =
        'Spesifiserer Endringstilstander som kan brukes som filtre i Endringsansvarlig-oversikten';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change overview.'} =
        'Spesifiserer Endringstilstander som kan brukes som filtre i Endringsoversikten';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the customer change schedule overview.'} =
        'Spesifiserer Endringstilstander som kan brukes som filtre i kundens Endringsplan-oversikt';
    $Self->{Translation}->{'Defines the default change title for a dummy change which is needed to edit a workorder template.'} =
        '';
    $Self->{Translation}->{'Defines the default sort criteria in the change PSA overview.'} =
        'Definerer standard sorteringskriterier for Forventet Tilgjengelighet (PSA)-oversikten.';
    $Self->{Translation}->{'Defines the default sort criteria in the change manager overview.'} =
        'Definerer standard sorteringskriterier for endringsansvarlig-oversikten';
    $Self->{Translation}->{'Defines the default sort criteria in the change overview.'} = 'Definerer standard sorteringskriterier for Endringsoversikten';
    $Self->{Translation}->{'Defines the default sort criteria in the change schedule overview.'} =
        'Definerer standard sorteringskriterier for Endringsplan-oversikten';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyCAB overview.'} =
        'Definerer standard sorteringskriterier for "Mine Endringsråd"';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyChanges overview.'} =
        'Definerer standard sorteringskriterier for "Mine Endringer"';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyWorkorders overview.'} =
        'Definerer standard sorteringskriterier for "Mine Arbeidsordre"';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the PIR overview.'} =
        'Definerer standard sorteringskriterier for Sluttevalueringsoversikten';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the customer change schedule overview.'} =
        'Definerer standard sorteringskriterier for Endringsplan-oversikten for kunder';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the template overview.'} =
        'Definerer standard sorteringskriterier for mal-oversikten';
    $Self->{Translation}->{'Defines the default sort order in the MyCAB overview.'} = 'Definerer standard sorteringsrekkefølge for "Mine Endringsråd"';
    $Self->{Translation}->{'Defines the default sort order in the MyChanges overview.'} = 'Definerer standard sorteringsrekkefølge for "Mine Endringer"';
    $Self->{Translation}->{'Defines the default sort order in the MyWorkorders overview.'} =
        'Definerer standard sorteringsrekkefølge for "Mine Arbeidsordre"';
    $Self->{Translation}->{'Defines the default sort order in the PIR overview.'} = 'Definerer standard sorteringsrekkefølge for Sluttevaluering-oversikten';
    $Self->{Translation}->{'Defines the default sort order in the change PSA overview.'} = 'Definerer standard sorteringsrekkefølge for Forventet Tilgjengelighet (PSA)-oversikten';
    $Self->{Translation}->{'Defines the default sort order in the change manager overview.'} =
        'Definerer standard sorteringsrekkefølge for Endringsansvarlig-oversikten';
    $Self->{Translation}->{'Defines the default sort order in the change overview.'} = 'Definerer standard sorteringsrekkefølge for Endringsoversikten';
    $Self->{Translation}->{'Defines the default sort order in the change schedule overview.'} =
        'Definerer standard sorteringsrekkefølge for Endringsplan-oversikten';
    $Self->{Translation}->{'Defines the default sort order in the customer change schedule overview.'} =
        'Definerer standard sorteringsrekkefølge for Endringsplan-oversikten for kunder';
    $Self->{Translation}->{'Defines the default sort order in the template overview.'} = 'Definerer standard sorteringsrekkefølge for mal-oversikten';
    $Self->{Translation}->{'Defines the default value for the category of a change.'} = 'Definerer forvalgt kategori for en Endring';
    $Self->{Translation}->{'Defines the default value for the impact of a change.'} = 'Definerer en forvalgt verdi for omfanget til en Endring';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for change attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        '';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for workorder attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        '';
    $Self->{Translation}->{'Defines the object attributes that are selectable for change objects in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the object attributes that are selectable for workorder objects in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute AccountedTime in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualEndTime in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualStartTime in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute CategoryID in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeBuilderID in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeManagerID in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeStateID in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeTitle in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute DynamicField in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ImpactID in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEffort in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEndTime in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedStartTime in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PriorityID in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute RequestedTime in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderAgentID in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderNumber in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderStateID in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTitle in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTypeID in AgentITSMChangeConditionEdit.'} =
        '';
    $Self->{Translation}->{'Defines the period (in years), in which start and end times can be selected.'} =
        '';
    $Self->{Translation}->{'Defines the shown attributes of a workorder in the tooltip of the workorder graph in the change zoom. To show workorder dynamic fields in the tooltip, they must be specified like DynamicField_WorkOrderFieldName1, DynamicField_WorkOrderFieldName2, etc.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the Change PSA overview. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the Change Schedule overview. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the MyCAB overview. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the MyChanges overview. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the MyWorkorders overview. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the PIR overview. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the change manager overview. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the change overview. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the change search. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the customer change schedule overview. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the template overview. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the signals for each ITSMChange state.'} = '';
    $Self->{Translation}->{'Defines the template types that will be used as filters in the template overview.'} =
        '';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the MyWorkorders overview.'} =
        '';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the PIR overview.'} =
        '';
    $Self->{Translation}->{'Defines the workorder types that will be used to show the PIR overview.'} =
        '';
    $Self->{Translation}->{'Defines whether notifications should be sent.'} = '';
    $Self->{Translation}->{'Delete a change.'} = '';
    $Self->{Translation}->{'Delete the change.'} = '';
    $Self->{Translation}->{'Delete the workorder.'} = '';
    $Self->{Translation}->{'Details of a change history entry.'} = '';
    $Self->{Translation}->{'Determines if an agent can exchange the X-axis of a stat if he generates one.'} =
        '';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes done for config item classes.'} =
        '';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding change state updates within a timeperiod.'} =
        '';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding the relation between changes and incident tickets.'} =
        '';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes.'} =
        '';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about the number of Rfc tickets a requester created.'} =
        '';
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
    $Self->{Translation}->{'ITSM event module that cleans up conditions.'} = '';
    $Self->{Translation}->{'ITSM event module that deletes the cache for a toolbar.'} = '';
    $Self->{Translation}->{'ITSM event module that deletes the history of changes.'} = '';
    $Self->{Translation}->{'ITSM event module that matches conditions and executes actions.'} =
        '';
    $Self->{Translation}->{'ITSM event module that sends notifications.'} = '';
    $Self->{Translation}->{'ITSM event module that updates the history of changes.'} = '';
    $Self->{Translation}->{'ITSM event module that updates the history of conditions.'} = '';
    $Self->{Translation}->{'ITSM event module that updates the history of workorders.'} = '';
    $Self->{Translation}->{'ITSM event module to recalculate the workorder numbers.'} = '';
    $Self->{Translation}->{'ITSM event module to set the actual start and end times of workorders.'} =
        '';
    $Self->{Translation}->{'If frequency is \'regularly\', you can configure how often the notifications are sent (every X hours).'} =
        '';
    $Self->{Translation}->{'Link another object to the change.'} = '';
    $Self->{Translation}->{'Link another object to the workorder.'} = '';
    $Self->{Translation}->{'Logfile for the ITSM change counter. This file is used for creating the change numbers.'} =
        'Loggfil for ITSM Endringsteller. Denne filen brukes for å opprett endringsnumrene';
    $Self->{Translation}->{'Lookup of CAB members for autocompletion.'} = '';
    $Self->{Translation}->{'Lookup of agents, used for autocompletion.'} = '';
    $Self->{Translation}->{'Module to check if WorkOrderAdd or WorkOrderAddFromTemplate should be permitted.'} =
        '';
    $Self->{Translation}->{'Module to check the CAB members.'} = 'Modul for å sjekke CAB-medlemmer';
    $Self->{Translation}->{'Module to check the agent.'} = 'Modul for å sjekke saksbehandleren';
    $Self->{Translation}->{'Module to check the change builder.'} = 'Modul for å sjekke den som opprettet Endringen';
    $Self->{Translation}->{'Module to check the change manager.'} = 'Modul for å sjekke Endringsansvarlig';
    $Self->{Translation}->{'Module to check the workorder agent.'} = 'Modul for å sjekke saksbehandler for en arbeidsordre';
    $Self->{Translation}->{'Module to check whether no workorder agent is set.'} = 'Modul for å sjekk om ingen saksbehandler er satt for arbeidsordren';
    $Self->{Translation}->{'Module to check whether the agent is contained in the configured list.'} =
        'Modul som sjekker om saksbehandleren befinner seg i den konfigurerte listen.';
    $Self->{Translation}->{'Module to show a link to create a change from this ticket. The ticket will be automatically linked with the new change.'} =
        '';
    $Self->{Translation}->{'Move Time Slot.'} = '';
    $Self->{Translation}->{'Move all workorders in time.'} = '';
    $Self->{Translation}->{'Only users of these groups have the permission to use the ticket types as defined in "ITSMChange::AddChangeLinkTicketTypes" if the feature "Ticket::Acl::Module###200-Ticket::Acl::Module" is enabled.'} =
        '';
    $Self->{Translation}->{'Overview over all Changes.'} = '';
    $Self->{Translation}->{'PIR'} = '';
    $Self->{Translation}->{'PSA'} = '';
    $Self->{Translation}->{'Parameters for the UserCreateWorkOrderNextMask object in the preference view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the pages (in which the changes are shown) of the small change overview.'} =
        '';
    $Self->{Translation}->{'Presents a link in the menu to show the involved persons in a change, in the zoom view of such change in the agent interface.'} =
        '';
    $Self->{Translation}->{'Print the change.'} = '';
    $Self->{Translation}->{'Print the workorder.'} = '';
    $Self->{Translation}->{'Projected Service Availability'} = '';
    $Self->{Translation}->{'Projected Service Availability (PSA)'} = '';
    $Self->{Translation}->{'Projected Service Availability (PSA) of changes. Overview of approved changes and their services.'} =
        '';
    $Self->{Translation}->{'Required privileges in order for an agent to take a workorder.'} =
        'Rettigheter som kreves for at en saksbehandler skal kunne ta en arbeidsordre';
    $Self->{Translation}->{'Required privileges to access the overview of all changes.'} = 'Rettigheter som kreves for å se oversikt over alle endringer';
    $Self->{Translation}->{'Required privileges to add a workorder.'} = 'Rettigheter som kreves for å opprette en arbeidsordre.';
    $Self->{Translation}->{'Required privileges to change the workorder agent.'} = 'Rettigheter som kreves for å endre saksbehandler på en arbeidsordre.';
    $Self->{Translation}->{'Required privileges to create a template from a change.'} = 'Rettigheter som kreves for å opprett en mal fra en endring';
    $Self->{Translation}->{'Required privileges to create a template from a changes\' CAB.'} =
        'Rettigheter som kreves for å opprette en mal fra en endrings endringsråd (CAB).';
    $Self->{Translation}->{'Required privileges to create a template from a workorder.'} = 'Rettigheter som kreves for å opprett en mal fra en arbeidsordre';
    $Self->{Translation}->{'Required privileges to create changes from templates.'} = '';
    $Self->{Translation}->{'Required privileges to create changes.'} = 'Rettigheter som kreves for å opprette endringer.';
    $Self->{Translation}->{'Required privileges to delete a template.'} = 'Rettighter som kreves for å slette en mal';
    $Self->{Translation}->{'Required privileges to delete a workorder.'} = 'Rettigheter som kreves for å slette en arbeidsordre';
    $Self->{Translation}->{'Required privileges to delete changes.'} = '';
    $Self->{Translation}->{'Required privileges to edit a template.'} = 'Rettigheter som kreves for å redigere en mal';
    $Self->{Translation}->{'Required privileges to edit a workorder.'} = 'Rettigheter som kreves for å redigere en arbeidsordre';
    $Self->{Translation}->{'Required privileges to edit changes.'} = 'Rettigheter som kreves for å redigere endringer';
    $Self->{Translation}->{'Required privileges to edit the conditions of changes.'} = 'Rettigheter som kreves for å endre forutsetninger for en endring';
    $Self->{Translation}->{'Required privileges to edit the content of a template.'} = '';
    $Self->{Translation}->{'Required privileges to edit the involved persons of a change.'} =
        'Rettigheter som kreves for å endre involverte personer i en endring';
    $Self->{Translation}->{'Required privileges to move changes in time.'} = 'Rettigheter som kreves for å flytte endringer i tid';
    $Self->{Translation}->{'Required privileges to print a change.'} = 'Rettigheter som kreves for å skrive ut en endring';
    $Self->{Translation}->{'Required privileges to reset changes.'} = '';
    $Self->{Translation}->{'Required privileges to view a workorder.'} = 'Rettigheter som kreves for å se en arbeidsordre';
    $Self->{Translation}->{'Required privileges to view changes.'} = 'Rettigheter som kreves for å se endringer';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is a CAB member.'} =
        'Rettigheter som kreves for å se listen over endringer der brukeren er medlem av CAB';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is the change manager.'} =
        'Rettigheter som kreves for å se listen over endringer der brukeren er endringsansvarlig';
    $Self->{Translation}->{'Required privileges to view overview over all templates.'} = 'Rettigheter som kreves for å se oversikten over alle maler.';
    $Self->{Translation}->{'Required privileges to view the conditions of changes.'} = 'Rettigheter som kreves for å se forutsetningene til endringer';
    $Self->{Translation}->{'Required privileges to view the history of a change.'} = 'Rettigheter som kreves for å se historikken til en endring';
    $Self->{Translation}->{'Required privileges to view the history of a workorder.'} = 'Rettigheter som kreves for å se historikken til en arbeidsordre';
    $Self->{Translation}->{'Required privileges to view the history zoom of a change.'} = 'Rettigheter som kreves for å se detaljert historikk for en endring';
    $Self->{Translation}->{'Required privileges to view the history zoom of a workorder.'} =
        'Rettigheter som kreves for å se detaljert historikk for en arbeidsordre';
    $Self->{Translation}->{'Required privileges to view the list of Change Schedule.'} = 'Rettigheter som kreves for å se listen over Endringsplaner';
    $Self->{Translation}->{'Required privileges to view the list of change PSA.'} = 'Rettigheter som kreves for å se listen over endringers forventede tjenestetilgjengelighet';
    $Self->{Translation}->{'Required privileges to view the list of changes with an upcoming PIR (Post Implementation Review).'} =
        'Rettigheter som kreves for å se listen over endringer med kommende Sluttevalueringer';
    $Self->{Translation}->{'Required privileges to view the list of own changes.'} = 'Rettigheter som kreves for å se listen over egne endringer';
    $Self->{Translation}->{'Required privileges to view the list of own workorders.'} = 'Rettigheter som kreves for å se listen over egne arbeidsordre';
    $Self->{Translation}->{'Required privileges to write a report for the workorder.'} = 'Rettigheter som kreves for å skrive en rapport for arbeidsordren';
    $Self->{Translation}->{'Reset a change and its workorders.'} = '';
    $Self->{Translation}->{'Reset change and its workorders.'} = '';
    $Self->{Translation}->{'Run task to check if specific times have been reached in changes and workorders.'} =
        '';
    $Self->{Translation}->{'Save change as a template.'} = '';
    $Self->{Translation}->{'Save workorder as a template.'} = '';
    $Self->{Translation}->{'Schedule'} = '';
    $Self->{Translation}->{'Screen after creating a workorder'} = '';
    $Self->{Translation}->{'Search Changes.'} = '';
    $Self->{Translation}->{'Selects the change number generator module. "AutoIncrement" increments the change number, the SystemID and the counter are used with SystemID.counter format (e.g. 100118, 100119). With "Date", the change numbers will be generated by the current date and a counter; this format looks like Year.Month.Day.counter, e.g. 2010062400001, 2010062400002. With "DateChecksum", the counter will be appended as checksum to the string of date plus the SystemID. The checksum will be rotated on a daily basis. This format looks like Year.Month.Day.SystemID.Counter.CheckSum, e.g. 2010062410000017, 2010062410000026.'} =
        '';
    $Self->{Translation}->{'Set the agent for the workorder.'} = '';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        '';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        '';
    $Self->{Translation}->{'Sets the minimal change counter size (if "AutoIncrement" was selected as ITSMChange::NumberGenerator). Default is 5, this means the counter starts from 10000.'} =
        '';
    $Self->{Translation}->{'Sets up the state machine for changes.'} = 'Setter opp tilstandsendringer for Endringer';
    $Self->{Translation}->{'Sets up the state machine for workorders.'} = 'Setter opp tilstandsendringer for Arbeidsordre';
    $Self->{Translation}->{'Shows a checkbox in the AgentITSMWorkOrderEdit screen that defines if the the following workorders should also be moved if a workorder is modified and the planned end time has changed.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows changing the workorder agent, in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a change as a template in the zoom view of the change, in the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a workorder as a template in the zoom view of the workorder, in the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows editing the report of a workorder, in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a change with another object in the change zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a workorder with another object in the zoom view of such workorder of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows moving the time slot of a change in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows taking a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the conditions of a change in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a change in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to add a workorder in the change zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to delete a change in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to delete a workorder in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a change in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the change zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the workorder zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a change in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a workorder in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to reset a change and its workorders in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the change history (reverse ordered) in the agent interface.'} =
        '';
    $Self->{Translation}->{'State Machine'} = 'Tilstandsendringer';
    $Self->{Translation}->{'Stores change and workorder ids and their corresponding template id, while a user is editing a template.'} =
        '';
    $Self->{Translation}->{'Take Workorder.'} = '';
    $Self->{Translation}->{'Take the workorder.'} = '';
    $Self->{Translation}->{'Template.'} = '';
    $Self->{Translation}->{'The identifier for a change, e.g. Change#, MyChange#. The default is Change#.'} =
        '';
    $Self->{Translation}->{'The identifier for a workorder, e.g. Workorder#, MyWorkorder#. The default is Workorder#.'} =
        '';
    $Self->{Translation}->{'This ACL module restricts the usuage of the ticket types that are defined in the sysconfig option \'ITSMChange::AddChangeLinkTicketTypes\', to users of the groups as defined in "ITSMChange::RestrictTicketTypes::Groups". As this ACL could collide with other ACLs which are also related to the ticket type, this sysconfig option is disabled by default and should only be activated if needed.'} =
        '';
    $Self->{Translation}->{'Time Slot'} = '';
    $Self->{Translation}->{'Types of tickets, where in the ticket zoom view a link to add a change will be displayed.'} =
        '';
    $Self->{Translation}->{'User Search'} = '';
    $Self->{Translation}->{'Workorder Add (from template).'} = '';
    $Self->{Translation}->{'Workorder Add.'} = '';
    $Self->{Translation}->{'Workorder Agent'} = '';
    $Self->{Translation}->{'Workorder Agent.'} = '';
    $Self->{Translation}->{'Workorder Delete.'} = '';
    $Self->{Translation}->{'Workorder Edit.'} = '';
    $Self->{Translation}->{'Workorder History Zoom.'} = '';
    $Self->{Translation}->{'Workorder History.'} = '';
    $Self->{Translation}->{'Workorder Report.'} = '';
    $Self->{Translation}->{'Workorder Zoom.'} = '';
    $Self->{Translation}->{'once'} = '';
    $Self->{Translation}->{'regularly'} = '';

}

1;
