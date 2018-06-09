# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::en_GB_ITSMChangeManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMChangeManagement
    $Self->{Translation}->{'ITSMChange'} = 'Change';
    $Self->{Translation}->{'ITSMChanges'} = 'Changes';
    $Self->{Translation}->{'ITSM Changes'} = 'Changes';
    $Self->{Translation}->{'workorder'} = 'Workorder';
    $Self->{Translation}->{'A change must have a title!'} = 'A change must have a title!';
    $Self->{Translation}->{'A condition must have a name!'} = 'A condition must have a name!';
    $Self->{Translation}->{'A template must have a name!'} = 'A template must have a name!';
    $Self->{Translation}->{'A workorder must have a title!'} = 'A workorder must have a title!';
    $Self->{Translation}->{'Add CAB Template'} = 'Add CAB Template';
    $Self->{Translation}->{'Add Workorder'} = 'Add Workorder';
    $Self->{Translation}->{'Add a workorder to the change'} = 'Add a workorder to the change';
    $Self->{Translation}->{'Add new condition and action pair'} = 'Add new condition and action pair';
    $Self->{Translation}->{'Agent interface module to show the ChangeManager overview icon.'} =
        'Agent interface module to show the ChangeManager overview icon.';
    $Self->{Translation}->{'Agent interface module to show the MyCAB overview icon.'} = 'Agent interface module to show the MyCAB overview icon.';
    $Self->{Translation}->{'Agent interface module to show the MyChanges overview icon.'} = 'Agent interface module to show the MyChanges overview icon.';
    $Self->{Translation}->{'Agent interface module to show the MyWorkOrders overview icon.'} =
        'Agent interface module to show the MyWorkOrders overview icon.';
    $Self->{Translation}->{'CABAgents'} = 'CAB Agents';
    $Self->{Translation}->{'CABCustomers'} = 'CAB Customers';
    $Self->{Translation}->{'Change Overview'} = 'Change Overview';
    $Self->{Translation}->{'Change Schedule'} = 'Change Schedule';
    $Self->{Translation}->{'Change involved persons of the change'} = 'Change involved persons of the change';
    $Self->{Translation}->{'ChangeHistory::ActionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ActionAddID'} = 'New Action (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ActionDelete'} = 'Action (ID=%s) deleted';
    $Self->{Translation}->{'ChangeHistory::ActionDeleteAll'} = 'All Actions of Condition (ID=%s) deleted';
    $Self->{Translation}->{'ChangeHistory::ActionExecute'} = 'Action (ID=%s) executed: %s';
    $Self->{Translation}->{'ChangeHistory::ActionUpdate'} = '%s (Action ID=%s): New: %s <- Old: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeActualEndTimeReached'} = 'Change (ID=%s) reached actual end time.';
    $Self->{Translation}->{'ChangeHistory::ChangeActualStartTimeReached'} = 'Change (ID=%s) reached actual start time.';
    $Self->{Translation}->{'ChangeHistory::ChangeAdd'} = 'New Change (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentAdd'} = 'New Attachment: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentDelete'} = 'Deleted Attachment %s';
    $Self->{Translation}->{'ChangeHistory::ChangeCABDelete'} = 'CAB Deleted %s';
    $Self->{Translation}->{'ChangeHistory::ChangeCABUpdate'} = '%s: New: %s <- Old: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkAdd'} = 'Link to %s (ID=%s) added';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkDelete'} = 'Link to %s (ID=%s) deleted';
    $Self->{Translation}->{'ChangeHistory::ChangeNotificationSent'} = 'Notification sent to %s (Event: %s)';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedEndTimeReached'} = 'Change (ID=%s) reached planned end time.';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedStartTimeReached'} = 'Change (ID=%s) reached planned start time.';
    $Self->{Translation}->{'ChangeHistory::ChangeRequestedTimeReached'} = 'Change (ID=%s) reached requested time.';
    $Self->{Translation}->{'ChangeHistory::ChangeUpdate'} = '%s: New: %s <- Old: %s';
    $Self->{Translation}->{'ChangeHistory::ConditionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ConditionAddID'} = 'New Condition (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ConditionDelete'} = 'Condition (ID=%s) deleted';
    $Self->{Translation}->{'ChangeHistory::ConditionDeleteAll'} = 'All Conditions of Change (ID=%s) deleted';
    $Self->{Translation}->{'ChangeHistory::ConditionUpdate'} = '%s (Condition ID=%s): New: %s <- Old: %s';
    $Self->{Translation}->{'ChangeHistory::ExpressionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ExpressionAddID'} = 'New Expression (ID=%s)';
    $Self->{Translation}->{'ChangeHistory::ExpressionDelete'} = 'Expression (ID=%s) deleted';
    $Self->{Translation}->{'ChangeHistory::ExpressionDeleteAll'} = 'All Expressions of Condition (ID=%s) deleted';
    $Self->{Translation}->{'ChangeHistory::ExpressionUpdate'} = '%s (Expression ID=%s): New: %s <- Old: %s';
    $Self->{Translation}->{'ChangeNumber'} = 'Change Number';
    $Self->{Translation}->{'Condition Edit'} = 'Condition Edit';
    $Self->{Translation}->{'Create Change'} = 'Create Change';
    $Self->{Translation}->{'Create a change from this ticket!'} = 'Create a change from this ticket!';
    $Self->{Translation}->{'Delete Workorder'} = 'Delete Workorder';
    $Self->{Translation}->{'Edit the change'} = 'Edit the change';
    $Self->{Translation}->{'Edit the conditions of the change'} = 'Edit the conditions of the change';
    $Self->{Translation}->{'Edit the workorder'} = 'Edit the workorder';
    $Self->{Translation}->{'Expression'} = 'Expression';
    $Self->{Translation}->{'Full-Text Search in Change and Workorder'} = 'Full-Text Search in Change and Workorder';
    $Self->{Translation}->{'ITSMCondition'} = 'Condition';
    $Self->{Translation}->{'ITSMWorkOrder'} = 'Workorder';
    $Self->{Translation}->{'Link another object to the change'} = 'Link another object to the change';
    $Self->{Translation}->{'Link another object to the workorder'} = 'Link another object to the workorder';
    $Self->{Translation}->{'Move all workorders in time'} = 'Move all workorders in time';
    $Self->{Translation}->{'My CABs'} = 'My CABs';
    $Self->{Translation}->{'My Changes'} = 'My Changes';
    $Self->{Translation}->{'My Workorders'} = 'My Workorders';
    $Self->{Translation}->{'No XXX settings'} = 'No \'%s\' settings';
    $Self->{Translation}->{'PIR (Post Implementation Review)'} = 'PIR (Post Implementation Review)';
    $Self->{Translation}->{'PSA (Projected Service Availability)'} = 'PSA (Projected Service Availability)';
    $Self->{Translation}->{'Please select first a catalog class!'} = 'Please select first a catalogue class!';
    $Self->{Translation}->{'Print the change'} = 'Print the change';
    $Self->{Translation}->{'Print the workorder'} = 'Print the workorder';
    $Self->{Translation}->{'RequestedTime'} = 'Requested Time';
    $Self->{Translation}->{'Save Change CAB as Template'} = 'Save Change CAB as Template';
    $Self->{Translation}->{'Save change as a template'} = 'Save change as a template';
    $Self->{Translation}->{'Save workorder as a template'} = 'Save workorder as a template';
    $Self->{Translation}->{'Search Changes'} = 'Search Changes';
    $Self->{Translation}->{'Set the agent for the workorder'} = 'Set the agent for the workorder';
    $Self->{Translation}->{'Take Workorder'} = 'Take Workorder';
    $Self->{Translation}->{'Take the workorder'} = 'Take the workorder';
    $Self->{Translation}->{'Template Overview'} = 'Template Overview';
    $Self->{Translation}->{'The planned end time is invalid!'} = 'The planned end time is invalid!';
    $Self->{Translation}->{'The planned start time is invalid!'} = 'The planned start time is invalid!';
    $Self->{Translation}->{'The planned time is invalid!'} = 'The planned time is invalid!';
    $Self->{Translation}->{'The requested time is invalid!'} = 'The requested time is invalid!';
    $Self->{Translation}->{'New (from template)'} = 'New (from template)';
    $Self->{Translation}->{'Add from template'} = 'Add from template';
    $Self->{Translation}->{'Add Workorder (from template)'} = 'Add Workorder (from template)';
    $Self->{Translation}->{'Add a workorder (from template) to the change'} = 'Add a workorder (from template) to the change';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReached'} = 'Workorder (ID=%s) reached actual end time.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReachedWithWorkOrderID'} =
        'Workorder (ID=%s) reached actual end time.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReached'} = 'Workorder (ID=%s) reached actual start time.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReachedWithWorkOrderID'} =
        'Workorder (ID=%s) reached actual start time.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAdd'} = 'New Workorder (ID=%s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAddWithWorkOrderID'} = 'New Workorder (ID=%s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAdd'} = 'New Attachment for WorkOrder: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAddWithWorkOrderID'} = '(ID=%s) New Attachment for WorkOrder: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDelete'} = 'Deleted Attachment from WorkOrder: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDeleteWithWorkOrderID'} = '(ID=%s) Deleted Attachment from WorkOrder: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAdd'} = 'New Report Attachment for WorkOrder: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAddWithWorkOrderID'} =
        '(ID=%s) New Report Attachment for WorkOrder: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDelete'} = 'Deleted Report Attachment from WorkOrder: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDeleteWithWorkOrderID'} =
        '(ID=%s) Deleted Report Attachment from WorkOrder: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDelete'} = 'Workorder (ID=%s) deleted';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDeleteWithWorkOrderID'} = 'Workorder (ID=%s) deleted';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAdd'} = 'Link to %s (ID=%s) added';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAddWithWorkOrderID'} = '(ID=%s) Link to %s (ID=%s) added';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDelete'} = 'Link to %s (ID=%s) deleted';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDeleteWithWorkOrderID'} = '(ID=%s) Link to %s (ID=%s) deleted';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSent'} = 'Notification sent to %s (Event: %s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSentWithWorkOrderID'} = '(ID=%s) Notification sent to %s (Event: %s)';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReached'} = 'Workorder (ID=%s) reached planned end time.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReachedWithWorkOrderID'} =
        'Workorder (ID=%s) reached planned end time.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReached'} = 'Workorder (ID=%s) reached planned start time.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReachedWithWorkOrderID'} =
        'Workorder (ID=%s) reached planned start time.';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdate'} = '%s: New: %s <- Old: %s';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdateWithWorkOrderID'} = '(ID=%s) %s: New: %s <- Old: %s';
    $Self->{Translation}->{'WorkOrderNumber'} = 'Workorder Number';
    $Self->{Translation}->{'accepted'} = 'Accepted';
    $Self->{Translation}->{'any'} = 'any';
    $Self->{Translation}->{'approval'} = 'Approval';
    $Self->{Translation}->{'approved'} = 'Approved';
    $Self->{Translation}->{'backout'} = 'Backout Plan';
    $Self->{Translation}->{'begins with'} = 'begins with';
    $Self->{Translation}->{'canceled'} = 'Canceled';
    $Self->{Translation}->{'contains'} = 'contains';
    $Self->{Translation}->{'created'} = 'Created';
    $Self->{Translation}->{'decision'} = 'Decision';
    $Self->{Translation}->{'ends with'} = 'ends with';
    $Self->{Translation}->{'failed'} = 'Failed';
    $Self->{Translation}->{'in progress'} = 'In Progress';
    $Self->{Translation}->{'is'} = 'is';
    $Self->{Translation}->{'is after'} = 'is after';
    $Self->{Translation}->{'is before'} = 'is before';
    $Self->{Translation}->{'is empty'} = 'is empty';
    $Self->{Translation}->{'is greater than'} = 'is greater than';
    $Self->{Translation}->{'is less than'} = 'is less than';
    $Self->{Translation}->{'is not'} = 'is not';
    $Self->{Translation}->{'is not empty'} = 'is not empty';
    $Self->{Translation}->{'not contains'} = 'does not contain';
    $Self->{Translation}->{'pending approval'} = 'Pending Approval';
    $Self->{Translation}->{'pending pir'} = 'Pending PIR';
    $Self->{Translation}->{'pir'} = 'PIR (Post Implementation Review)';
    $Self->{Translation}->{'ready'} = 'Ready';
    $Self->{Translation}->{'rejected'} = 'Rejected';
    $Self->{Translation}->{'requested'} = 'Requested';
    $Self->{Translation}->{'retracted'} = 'Retracted';
    $Self->{Translation}->{'set'} = 'set';
    $Self->{Translation}->{'successful'} = 'Successful';

    # Template: AdminITSMChangeCIPAllocate
    $Self->{Translation}->{'Category <-> Impact <-> Priority'} = 'Category <-> Impact <-> Priority';
    $Self->{Translation}->{'Manage the priority result of combinating Category <-> Impact.'} =
        'Manage the priority result of combinating Category <-> Impact.';
    $Self->{Translation}->{'Priority allocation'} = 'Priority allocation';

    # Template: AdminITSMChangeNotification
    $Self->{Translation}->{'ITSM ChangeManagement Notification Management'} = 'ITSM ChangeManagement Notification Management';
    $Self->{Translation}->{'Add Notification Rule'} = 'Add Notification Rule';
    $Self->{Translation}->{'Rule'} = 'Rule';
    $Self->{Translation}->{'A notification should have a name!'} = 'A notification should have a name!';
    $Self->{Translation}->{'Name is required.'} = 'Name is required.';

    # Template: AdminITSMStateMachine
    $Self->{Translation}->{'Admin State Machine'} = 'Admin State Machine';
    $Self->{Translation}->{'Select a catalog class!'} = 'Select a catalogue class!';
    $Self->{Translation}->{'A catalog class is required!'} = 'A catalogue class is required!';
    $Self->{Translation}->{'Add a state transition'} = 'Add a state transition';
    $Self->{Translation}->{'Catalog Class'} = 'Catalogue Class';
    $Self->{Translation}->{'Object Name'} = 'Object Name';
    $Self->{Translation}->{'Overview over state transitions for'} = 'Overview over state transitions for';
    $Self->{Translation}->{'Delete this state transition'} = 'Delete this state transition';
    $Self->{Translation}->{'Add a new state transition for'} = 'Add a new state transition for';
    $Self->{Translation}->{'Please select a state!'} = 'Please select a state!';
    $Self->{Translation}->{'Please select a next state!'} = 'Please select a next state!';
    $Self->{Translation}->{'Edit a state transition for'} = 'Edit a state transition for';
    $Self->{Translation}->{'Do you really want to delete the state transition'} = 'Do you really want to delete the state transition';

    # Template: AgentITSMChangeAdd
    $Self->{Translation}->{'Add Change'} = 'Add Change';
    $Self->{Translation}->{'ITSM Change'} = 'Change';
    $Self->{Translation}->{'Justification'} = 'Justification';
    $Self->{Translation}->{'Input invalid.'} = 'Input invalid.';
    $Self->{Translation}->{'Impact'} = 'Impact';
    $Self->{Translation}->{'Requested Date'} = 'Requested Date';

    # Template: AgentITSMChangeAddFromTemplate
    $Self->{Translation}->{'Select Change Template'} = 'Select Change Template';
    $Self->{Translation}->{'Time type'} = 'Time type';
    $Self->{Translation}->{'Invalid time type.'} = 'Invalid time type.';
    $Self->{Translation}->{'New time'} = 'New time';

    # Template: AgentITSMChangeCABTemplate
    $Self->{Translation}->{'Save Change CAB as template'} = 'Save Change CAB as template';
    $Self->{Translation}->{'go to involved persons screen'} = 'go to involved persons screen';
    $Self->{Translation}->{'Invalid Name'} = 'Invalid Name';

    # Template: AgentITSMChangeCondition
    $Self->{Translation}->{'Conditions and Actions'} = 'Conditions and Actions';
    $Self->{Translation}->{'Delete Condition'} = 'Delete Condition';
    $Self->{Translation}->{'Add new condition'} = 'Add new condition';

    # Template: AgentITSMChangeConditionEdit
    $Self->{Translation}->{'Edit Condition'} = '';
    $Self->{Translation}->{'Need a valid name.'} = 'Need a valid name.';
    $Self->{Translation}->{'A valid name is needed.'} = 'A valid name is needed.';
    $Self->{Translation}->{'Duplicate name:'} = 'Duplicate name:';
    $Self->{Translation}->{'This name is already used by another condition.'} = 'This name is already used by another condition.';
    $Self->{Translation}->{'Matching'} = 'Matching';
    $Self->{Translation}->{'Any expression (OR)'} = 'Any expression (OR)';
    $Self->{Translation}->{'All expressions (AND)'} = 'All expressions (AND)';
    $Self->{Translation}->{'Expressions'} = 'Expressions';
    $Self->{Translation}->{'Selector'} = 'Selector';
    $Self->{Translation}->{'Operator'} = 'Operator';
    $Self->{Translation}->{'Delete Expression'} = 'Delete Expression';
    $Self->{Translation}->{'No Expressions found.'} = 'No Expressions found.';
    $Self->{Translation}->{'Add new expression'} = 'Add new expression';
    $Self->{Translation}->{'Delete Action'} = 'Delete Action';
    $Self->{Translation}->{'No Actions found.'} = 'No Actions found.';
    $Self->{Translation}->{'Add new action'} = 'Add new action';

    # Template: AgentITSMChangeDelete
    $Self->{Translation}->{'Do you really want to delete this change?'} = 'Do you really want to delete this change?';

    # Template: AgentITSMChangeHistory
    $Self->{Translation}->{'History of'} = 'History of';
    $Self->{Translation}->{'Workorder'} = 'Workorder';
    $Self->{Translation}->{'Show details'} = 'Show details';
    $Self->{Translation}->{'Show workorder'} = 'Show workorder';

    # Template: AgentITSMChangeHistoryZoom
    $Self->{Translation}->{'Detailed history information of'} = 'Detailed history information of';
    $Self->{Translation}->{'Modified'} = 'Modified';
    $Self->{Translation}->{'Old Value'} = 'Old Value';
    $Self->{Translation}->{'New Value'} = 'New Value';

    # Template: AgentITSMChangeInvolvedPersons
    $Self->{Translation}->{'Involved Persons'} = 'Involved Persons';
    $Self->{Translation}->{'ChangeManager'} = 'Change Manager';
    $Self->{Translation}->{'User invalid.'} = 'User invalid.';
    $Self->{Translation}->{'ChangeBuilder'} = 'Change Builder';
    $Self->{Translation}->{'Change Advisory Board'} = 'Change Advisory Board';
    $Self->{Translation}->{'CAB Template'} = 'CAB Template';
    $Self->{Translation}->{'Apply Template'} = 'Apply Template';
    $Self->{Translation}->{'NewTemplate'} = 'NewTemplate';
    $Self->{Translation}->{'Save this CAB as template'} = 'Save this CAB as template';
    $Self->{Translation}->{'Add to CAB'} = 'Add to CAB';
    $Self->{Translation}->{'Invalid User'} = 'Invalid User';
    $Self->{Translation}->{'Current CAB'} = 'Current CAB';

    # Template: AgentITSMChangeOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Context Settings';
    $Self->{Translation}->{'Changes per page'} = 'Changes per page';

    # Template: AgentITSMChangeOverviewSmall
    $Self->{Translation}->{'WorkOrderTitle'} = 'Workorder Title';
    $Self->{Translation}->{'ChangeTitle'} = 'Change Title';
    $Self->{Translation}->{'WorkOrderAgent'} = 'Workorder Agent';
    $Self->{Translation}->{'Workorders'} = 'Workorders';
    $Self->{Translation}->{'ChangeState'} = 'Change State';
    $Self->{Translation}->{'WorkOrderState'} = 'Workorder State';
    $Self->{Translation}->{'WorkOrderType'} = 'Workorder Type';
    $Self->{Translation}->{'Requested Time'} = 'Requested Time';
    $Self->{Translation}->{'PlannedStartTime'} = 'Planned Start';
    $Self->{Translation}->{'PlannedEndTime'} = 'Planned End';
    $Self->{Translation}->{'ActualStartTime'} = 'Actual Start';
    $Self->{Translation}->{'ActualEndTime'} = 'Actual End';

    # Template: AgentITSMChangeReset
    $Self->{Translation}->{'Do you really want to reset this change?'} = 'Do you really want to reset this change?';

    # Template: AgentITSMChangeSearch
    $Self->{Translation}->{'(e.g. 10*5155 or 105658*)'} = '(e.g. 10*5155 or 105658*)';
    $Self->{Translation}->{'CABAgent'} = 'CAB Agent';
    $Self->{Translation}->{'e.g.'} = 'e.g.';
    $Self->{Translation}->{'CABCustomer'} = 'CAB Customer';
    $Self->{Translation}->{'ITSM Workorder'} = 'Workorder';
    $Self->{Translation}->{'Instruction'} = 'Instruction';
    $Self->{Translation}->{'Report'} = 'Report';
    $Self->{Translation}->{'Change Category'} = 'Change Category';
    $Self->{Translation}->{'(before/after)'} = '(before/after)';
    $Self->{Translation}->{'(between)'} = '(between)';

    # Template: AgentITSMChangeTemplate
    $Self->{Translation}->{'Save Change as Template'} = 'Save Change as Template';
    $Self->{Translation}->{'A template should have a name!'} = 'A template should have a name!';
    $Self->{Translation}->{'The template name is required.'} = 'The template name is required.';
    $Self->{Translation}->{'Reset States'} = 'Reset States';
    $Self->{Translation}->{'Overwrite original template'} = 'Overwrite original template';
    $Self->{Translation}->{'Delete original change'} = 'Delete original change';

    # Template: AgentITSMChangeTimeSlot
    $Self->{Translation}->{'Move Time Slot'} = 'Move Time Slot';

    # Template: AgentITSMChangeZoom
    $Self->{Translation}->{'Change Information'} = 'Change Information';
    $Self->{Translation}->{'PlannedEffort'} = 'Planned Effort';
    $Self->{Translation}->{'Change Initiator(s)'} = 'Change Initiator(s)';
    $Self->{Translation}->{'Change Manager'} = 'Change Manager';
    $Self->{Translation}->{'Change Builder'} = 'Change Builder';
    $Self->{Translation}->{'CAB'} = 'CAB';
    $Self->{Translation}->{'Last changed'} = 'Last changed';
    $Self->{Translation}->{'Last changed by'} = 'Last changed by';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).';
    $Self->{Translation}->{'Download Attachment'} = 'Download Attachment';

    # Template: AgentITSMTemplateEditCAB
    $Self->{Translation}->{'Edit CAB Template'} = 'Edit CAB Template';

    # Template: AgentITSMTemplateEditContent
    $Self->{Translation}->{'This will create a new change from this template, so you can edit and save it.'} =
        'This will create a new change from this template, so you can edit and save it.';
    $Self->{Translation}->{'The new change will be deleted automatically after it has been saved as template.'} =
        'The new change will be deleted automatically after it has been saved as template.';
    $Self->{Translation}->{'This will create a new workorder from this template, so you can edit and save it.'} =
        'This will create a new workorder from this template, so you can edit and save it.';
    $Self->{Translation}->{'A temporary change will be created which contains the workorder.'} =
        'A temporary change will be created which contains the workorder.';
    $Self->{Translation}->{'The temporary change and new workorder will be deleted automatically after the workorder has been saved as template.'} =
        'The temporary change and new workorder will be deleted automatically after the workorder has been saved as template.';
    $Self->{Translation}->{'Do you want to proceed?'} = 'Do you want to proceed?';

    # Template: AgentITSMTemplateOverviewSmall
    $Self->{Translation}->{'TemplateID'} = 'TemplateID';
    $Self->{Translation}->{'Edit Content'} = 'Edit Content';
    $Self->{Translation}->{'CreateBy'} = 'Created by';
    $Self->{Translation}->{'CreateTime'} = 'Created';
    $Self->{Translation}->{'ChangeBy'} = 'Changed by';
    $Self->{Translation}->{'ChangeTime'} = 'Changed';
    $Self->{Translation}->{'Edit Template Content'} = 'Edit Template Content';
    $Self->{Translation}->{'Delete Template'} = 'Delete Template';

    # Template: AgentITSMWorkOrderAdd
    $Self->{Translation}->{'Add Workorder to'} = 'Add Workorder to';
    $Self->{Translation}->{'Invalid workorder type.'} = 'Invalid workorder type.';
    $Self->{Translation}->{'The planned start time must be before the planned end time!'} = 'The planned start time must be before the planned end time!';
    $Self->{Translation}->{'Invalid format.'} = 'Invalid format.';

    # Template: AgentITSMWorkOrderAddFromTemplate
    $Self->{Translation}->{'Select Workorder Template'} = 'Select Workorder Template';

    # Template: AgentITSMWorkOrderDelete
    $Self->{Translation}->{'Do you really want to delete this workorder?'} = 'Do you really want to delete this workorder?';
    $Self->{Translation}->{'You can not delete this Workorder. It is used in at least one Condition!'} =
        'You can not delete this Workorder. It is used in at least one Condition!';
    $Self->{Translation}->{'This Workorder is used in the following Condition(s)'} = 'This Workorder is used in the following Condition(s)';

    # Template: AgentITSMWorkOrderEdit
    $Self->{Translation}->{'Move following workorders accordingly'} = 'Move following workorders accordingly';
    $Self->{Translation}->{'If the planned end time of this workorder is changed, the planned start times of all following workorders will be changed accordingly'} =
        'If the planned end time of this workorder is changed, the planned start times of all following workorders will be changed accordingly';

    # Template: AgentITSMWorkOrderReport
    $Self->{Translation}->{'The actual start time must be before the actual end time!'} = 'The actual start time must be before the actual end time!';
    $Self->{Translation}->{'The actual start time must be set, when the actual end time is set!'} =
        'The actual start time must be set, when the actual end time is set!';

    # Template: AgentITSMWorkOrderTake
    $Self->{Translation}->{'Current Agent'} = 'Current Agent';
    $Self->{Translation}->{'Do you really want to take this workorder?'} = 'Do you really want to take this workorder?';

    # Template: AgentITSMWorkOrderTemplate
    $Self->{Translation}->{'Save Workorder as Template'} = 'Save Workorder as Template';
    $Self->{Translation}->{'Delete original workorder (and surrounding change)'} = 'Delete original workorder (and surrounding change)';

    # Template: AgentITSMWorkOrderZoom
    $Self->{Translation}->{'Workorder Information'} = 'Workorder Information';

    # Perl Module: Kernel/Modules/AdminITSMChangeNotification.pm
    $Self->{Translation}->{'Unknown notification %s!'} = 'Unknown notification %s!';
    $Self->{Translation}->{'There was an error creating the notification.'} = 'There was an error creating the notification.';

    # Perl Module: Kernel/Modules/AgentITSMChange.pm
    $Self->{Translation}->{'Overview: ITSM Changes'} = 'Overview: ITSM Changes';

    # Perl Module: Kernel/Modules/AgentITSMChangeAdd.pm
    $Self->{Translation}->{'Ticket with TicketID %s does not exist!'} = 'Ticket with TicketID %s does not exist!';
    $Self->{Translation}->{'Please contact the admin.'} = 'Please contact the admin.';
    $Self->{Translation}->{'Missing sysconfig option "ITSMChange::AddChangeLinkTicketTypes"!'} =
        'Missing sysconfig option "ITSMChange::AddChangeLinkTicketTypes"!';
    $Self->{Translation}->{'Was not able to add change!'} = 'Was not able to add change!';

    # Perl Module: Kernel/Modules/AgentITSMChangeAddFromTemplate.pm
    $Self->{Translation}->{'Was not able to create change from template!'} = 'Was not able to create change from template!';

    # Perl Module: Kernel/Modules/AgentITSMChangeCABTemplate.pm
    $Self->{Translation}->{'No ChangeID is given!'} = 'No ChangeID is given!';
    $Self->{Translation}->{'No change found for changeID %s.'} = 'No change found for changeID %s.';
    $Self->{Translation}->{'The CAB of change "%s" could not be serialized.'} = 'The CAB of change "%s" could not be serialised.';
    $Self->{Translation}->{'Could not add the template.'} = 'Could not add the template.';

    # Perl Module: Kernel/Modules/AgentITSMChangeCondition.pm
    $Self->{Translation}->{'Change "%s" not found in database!'} = 'Change "%s" not found in database!';
    $Self->{Translation}->{'Could not delete ConditionID %s!'} = 'Could not delete ConditionID %s!';

    # Perl Module: Kernel/Modules/AgentITSMChangeConditionEdit.pm
    $Self->{Translation}->{'No %s is given!'} = 'No %s is given!';
    $Self->{Translation}->{'Could not create new condition!'} = 'Could not create new condition!';
    $Self->{Translation}->{'Could not update ConditionID %s!'} = 'Could not update ConditionID %s!';
    $Self->{Translation}->{'Could not update ExpressionID %s!'} = 'Could not update ExpressionID %s!';
    $Self->{Translation}->{'Could not add new Expression!'} = 'Could not add new Expression!';
    $Self->{Translation}->{'Could not update ActionID %s!'} = 'Could not update ActionID %s!';
    $Self->{Translation}->{'Could not add new Action!'} = 'Could not add new Action!';
    $Self->{Translation}->{'Could not delete ExpressionID %s!'} = 'Could not delete ExpressionID %s!';
    $Self->{Translation}->{'Could not delete ActionID %s!'} = 'Could not delete ActionID %s!';
    $Self->{Translation}->{'Error: Unknown field type "%s"!'} = 'Error: Unknown field type "%s"!';
    $Self->{Translation}->{'ConditionID %s does not belong to the given ChangeID %s!'} = 'ConditionID %s does not belong to the given ChangeID %s!';

    # Perl Module: Kernel/Modules/AgentITSMChangeDelete.pm
    $Self->{Translation}->{'Change "%s" does not have an allowed change state to be deleted!'} =
        'Change "%s" does not have an allowed change state to be deleted!';
    $Self->{Translation}->{'Was not able to delete the changeID %s!'} = 'Was not able to delete the changeID %s!';

    # Perl Module: Kernel/Modules/AgentITSMChangeEdit.pm
    $Self->{Translation}->{'Was not able to update Change!'} = 'Was not able to update Change!';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no ChangeID is given!'} = 'Can\'t show history, as no ChangeID is given!';
    $Self->{Translation}->{'Change "%s" not found in the database!'} = 'Change "%s" not found in the database!';
    $Self->{Translation}->{'Unknown type "%s" encountered!'} = 'Unknown type "%s" encountered!';
    $Self->{Translation}->{'Change History'} = 'Change History';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistoryZoom.pm
    $Self->{Translation}->{'Can\'t show history zoom, no HistoryEntryID is given!'} = 'Can\'t show history zoom, no HistoryEntryID is given!';
    $Self->{Translation}->{'HistoryEntry "%s" not found in database!'} = 'HistoryEntry "%s" not found in database!';

    # Perl Module: Kernel/Modules/AgentITSMChangeInvolvedPersons.pm
    $Self->{Translation}->{'Was not able to update Change CAB for Change %s!'} = 'Was not able to update Change CAB for Change %s!';
    $Self->{Translation}->{'Was not able to update Change %s!'} = 'Was not able to update Change %s!';

    # Perl Module: Kernel/Modules/AgentITSMChangeManager.pm
    $Self->{Translation}->{'Overview: ChangeManager'} = 'Overview: ChangeManager';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyCAB.pm
    $Self->{Translation}->{'Overview: My CAB'} = 'Overview: My CAB';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyChanges.pm
    $Self->{Translation}->{'Overview: My Changes'} = 'Overview: My Changes';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyWorkOrders.pm
    $Self->{Translation}->{'Overview: My Workorders'} = 'Overview: My Workorders';

    # Perl Module: Kernel/Modules/AgentITSMChangePIR.pm
    $Self->{Translation}->{'Overview: PIR'} = 'Overview: PIR';

    # Perl Module: Kernel/Modules/AgentITSMChangePSA.pm
    $Self->{Translation}->{'Overview: PSA'} = 'Overview: PSA';

    # Perl Module: Kernel/Modules/AgentITSMChangePrint.pm
    $Self->{Translation}->{'WorkOrder "%s" not found in database!'} = 'WorkOrder "%s" not found in database!';
    $Self->{Translation}->{'Can\'t create output, as the workorder is not attached to a change!'} =
        'Can\'t create output, as the workorder is not attached to a change!';
    $Self->{Translation}->{'Can\'t create output, as no ChangeID is given!'} = 'Can\'t create output, as no ChangeID is given!';
    $Self->{Translation}->{'unknown change title'} = 'unknown change title';
    $Self->{Translation}->{'unknown workorder title'} = 'unknown workorder title';
    $Self->{Translation}->{'ITSM Workorder Overview (%s)'} = 'ITSM Workorder Overview (%s)';

    # Perl Module: Kernel/Modules/AgentITSMChangeReset.pm
    $Self->{Translation}->{'Was not able to reset WorkOrder %s of Change %s!'} = 'Was not able to reset WorkOrder %s of Change %s!';
    $Self->{Translation}->{'Was not able to reset Change %s!'} = 'Was not able to reset Change %s!';

    # Perl Module: Kernel/Modules/AgentITSMChangeSchedule.pm
    $Self->{Translation}->{'Overview: Change Schedule'} = 'Overview: Change Schedule';

    # Perl Module: Kernel/Modules/AgentITSMChangeSearch.pm
    $Self->{Translation}->{'Change Search'} = 'Change Search';
    $Self->{Translation}->{'WorkOrders'} = 'WorkOrders';
    $Self->{Translation}->{'Change Search Result'} = 'Change Search Result';
    $Self->{Translation}->{'Change Number'} = 'Change Number';
    $Self->{Translation}->{'Change Title'} = 'Change Title';
    $Self->{Translation}->{'Work Order Title'} = 'Work Order Title';
    $Self->{Translation}->{'CAB Agent'} = 'CAB Agent';
    $Self->{Translation}->{'CAB Customer'} = 'CAB Customer';
    $Self->{Translation}->{'Change Description'} = 'Change Description';
    $Self->{Translation}->{'Change Justification'} = 'Change Justification';
    $Self->{Translation}->{'WorkOrder Instruction'} = 'WorkOrder Instruction';
    $Self->{Translation}->{'WorkOrder Report'} = 'WorkOrder Report';
    $Self->{Translation}->{'Change Priority'} = 'Change Priority';
    $Self->{Translation}->{'Change Impact'} = 'Change Impact';
    $Self->{Translation}->{'Change State'} = 'Change State';
    $Self->{Translation}->{'Created By'} = 'Created By';
    $Self->{Translation}->{'WorkOrder State'} = 'WorkOrder State';
    $Self->{Translation}->{'WorkOrder Type'} = 'WorkOrder Type';
    $Self->{Translation}->{'WorkOrder Agent'} = 'WorkOrder Agent';
    $Self->{Translation}->{'Planned Start Time'} = 'Planned Start Time';
    $Self->{Translation}->{'Planned End Time'} = 'Planned End Time';
    $Self->{Translation}->{'Actual Start Time'} = 'Actual Start Time';
    $Self->{Translation}->{'Actual End Time'} = 'Actual End Time';
    $Self->{Translation}->{'Change Time'} = 'Change Time';
    $Self->{Translation}->{'before'} = 'before';

    # Perl Module: Kernel/Modules/AgentITSMChangeTemplate.pm
    $Self->{Translation}->{'The change "%s" could not be serialized.'} = 'The change "%s" could not be serialised.';
    $Self->{Translation}->{'Could not update the template "%s".'} = 'Could not update the template "%s".';
    $Self->{Translation}->{'Could not delete change "%s".'} = 'Could not delete change "%s".';

    # Perl Module: Kernel/Modules/AgentITSMChangeTimeSlot.pm
    $Self->{Translation}->{'The change can\'t be moved, as it has no workorders.'} = 'The change can\'t be moved, as it has no workorders.';
    $Self->{Translation}->{'Add a workorder first.'} = 'Add a workorder first.';
    $Self->{Translation}->{'Can\'t move a change which already has started!'} = 'Can\'t move a change which already has started!';
    $Self->{Translation}->{'Please move the individual workorders instead.'} = 'Please move the individual workorders instead.';
    $Self->{Translation}->{'The current %s could not be determined.'} = 'The current %s could not be determined.';
    $Self->{Translation}->{'The %s of all workorders has to be defined.'} = 'The %s of all workorders has to be defined.';
    $Self->{Translation}->{'Was not able to move time slot for workorder #%s!'} = 'Was not able to move time slot for workorder #%s!';

    # Perl Module: Kernel/Modules/AgentITSMTemplateDelete.pm
    $Self->{Translation}->{'You need %s permission!'} = 'You need %s permission!';
    $Self->{Translation}->{'No TemplateID is given!'} = 'No TemplateID is given!';
    $Self->{Translation}->{'Template "%s" not found in database!'} = 'Template "%s" not found in database!';
    $Self->{Translation}->{'Was not able to delete the template %s!'} = 'Was not able to delete the template %s!';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEdit.pm
    $Self->{Translation}->{'Was not able to update Template %s!'} = 'Was not able to update Template %s!';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEditCAB.pm
    $Self->{Translation}->{'Was not able to update Template "%s"!'} = 'Was not able to update Template "%s"!';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEditContent.pm
    $Self->{Translation}->{'Was not able to create change!'} = 'Was not able to create change!';
    $Self->{Translation}->{'Was not able to create workorder from template!'} = 'Was not able to create workorder from template!';

    # Perl Module: Kernel/Modules/AgentITSMTemplateOverview.pm
    $Self->{Translation}->{'Overview: Template'} = 'Overview: Template';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderAdd.pm
    $Self->{Translation}->{'You need %s permissions on the change!'} = 'You need %s permissions on the change!';
    $Self->{Translation}->{'Was not able to add workorder!'} = 'Was not able to add workorder!';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderAgent.pm
    $Self->{Translation}->{'No WorkOrderID is given!'} = 'No WorkOrderID is given!';
    $Self->{Translation}->{'Was not able to set the workorder agent of the workorder "%s" to empty!'} =
        'Was not able to set the workorder agent of the workorder "%s" to empty!';
    $Self->{Translation}->{'Was not able to update the workorder "%s"!'} = 'Was not able to update the workorder "%s"!';
    $Self->{Translation}->{'Could not find Change for WorkOrder %s!'} = 'Could not find Change for WorkOrder %s!';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderDelete.pm
    $Self->{Translation}->{'Was not able to delete the workorder %s!'} = 'Was not able to delete the workorder %s!';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderEdit.pm
    $Self->{Translation}->{'Was not able to update WorkOrder %s!'} = 'Was not able to update WorkOrder %s!';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no WorkOrderID is given!'} = 'Can\'t show history, as no WorkOrderID is given!';
    $Self->{Translation}->{'WorkOrder "%s" not found in the database!'} = 'WorkOrder "%s" not found in the database!';
    $Self->{Translation}->{'WorkOrderHistory::'} = 'WorkOrderHistory::';
    $Self->{Translation}->{'WorkOrder History'} = 'WorkOrder History';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderHistoryZoom.pm
    $Self->{Translation}->{'History entry "%s" not found in the database!'} = 'History entry "%s" not found in the database!';
    $Self->{Translation}->{'WorkOrder History Zoom'} = 'WorkOrder History Zoom';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderTake.pm
    $Self->{Translation}->{'Was not able to take the workorder %s!'} = 'Was not able to take the workorder %s!';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderTemplate.pm
    $Self->{Translation}->{'The workorder "%s" could not be serialized.'} = 'The workorder "%s" could not be serialized.';

    # Perl Module: Kernel/Output/HTML/Layout/ITSMChange.pm
    $Self->{Translation}->{'Need config option %s!'} = '';
    $Self->{Translation}->{'Config option %s needs to be a HASH ref!'} = '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';
    $Self->{Translation}->{'Title: %s | Type: %s'} = '';

    # Perl Module: Kernel/Output/HTML/ToolBar/MyWorkOrders.pm
    $Self->{Translation}->{'My Work Orders'} = 'My Work Orders';

    # SysConfig
    $Self->{Translation}->{'A list of the agents who have permission to take workorders. Key is a login name. Content is 0 or 1.'} =
        'A list of the agents who have permission to take workorders. Key is a login name. Content is 0 or 1.';
    $Self->{Translation}->{'A list of workorder states, at which the ActualStartTime of a workorder will be set if it was empty at this point.'} =
        'A list of workorder states, at which the ActualStartTime of a workorder will be set if it was empty at this point.';
    $Self->{Translation}->{'Add Workorder (from Template)'} = '';
    $Self->{Translation}->{'Add a change from template.'} = 'Add a change from template.';
    $Self->{Translation}->{'Add a change.'} = 'Add a change.';
    $Self->{Translation}->{'Add a workorder (from template) to the change.'} = '';
    $Self->{Translation}->{'Add a workorder to the change.'} = '';
    $Self->{Translation}->{'Admin of the CIP matrix.'} = 'Admin of the CIP matrix.';
    $Self->{Translation}->{'Admin of the state machine.'} = 'Admin of the state machine.';
    $Self->{Translation}->{'Agent interface notification module to see the number of change advisory boards.'} =
        'Agent interface notification module to see the number of change advisory boards.';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes managed by the user.'} =
        'Agent interface notification module to see the number of changes managed by the user.';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes.'} =
        'Agent interface notification module to see the number of changes.';
    $Self->{Translation}->{'Agent interface notification module to see the number of workorders.'} =
        'Agent interface notification module to see the number of workorders.';
    $Self->{Translation}->{'CAB Member Search'} = 'CAB Member Search';
    $Self->{Translation}->{'Cache time in minutes for the change management toolbars. Default: 3 hours (180 minutes).'} =
        'Cache time in minutes for the change management toolbars. Default: 3 hours (180 minutes).';
    $Self->{Translation}->{'Cache time in minutes for the change management. Default: 5 days (7200 minutes).'} =
        'Cache time in minutes for the change management. Default: 5 days (7200 minutes).';
    $Self->{Translation}->{'Change CAB Templates'} = 'Change CAB Templates';
    $Self->{Translation}->{'Change History.'} = 'Change History.';
    $Self->{Translation}->{'Change Involved Persons.'} = 'Change Involved Persons.';
    $Self->{Translation}->{'Change Overview "Small" Limit'} = 'Change Overview "Small" Limit';
    $Self->{Translation}->{'Change Overview.'} = 'Change Overview.';
    $Self->{Translation}->{'Change Print.'} = 'Change Print.';
    $Self->{Translation}->{'Change Schedule.'} = 'Change Schedule.';
    $Self->{Translation}->{'Change Zoom.'} = 'Change Zoom.';
    $Self->{Translation}->{'Change and Workorder Templates'} = '';
    $Self->{Translation}->{'Change and workorder templates edited by this user.'} = '';
    $Self->{Translation}->{'Change area.'} = 'Change area.';
    $Self->{Translation}->{'Change involved persons of the change.'} = '';
    $Self->{Translation}->{'Change limit per page for Change Overview "Small".'} = '';
    $Self->{Translation}->{'Change search backend router of the agent interface.'} = 'Change search backend router of the agent interface.';
    $Self->{Translation}->{'Condition Overview'} = 'Condition Overview';
    $Self->{Translation}->{'Configure which screen should be shown after a new workorder has been created.'} =
        '';
    $Self->{Translation}->{'Configures how often the notifications are sent when planned the start time or other time values have been reached/passed.'} =
        'Configures how often the notifications are sent when planned the start time or other time values have been reached/passed.';
    $Self->{Translation}->{'Create Change (from Template)'} = '';
    $Self->{Translation}->{'Create a change (from template) from this ticket.'} = '';
    $Self->{Translation}->{'Create a change from this ticket.'} = '';
    $Self->{Translation}->{'Create and manage ITSM Change Management notifications.'} = 'Create and manage ITSM Change Management notifications.';
    $Self->{Translation}->{'Default type for a workorder. This entry must exist in general catalog class \'ITSM::ChangeManagement::WorkOrder::Type\'.'} =
        'Default type for a workorder. This entry must exist in general catalog class \'ITSM::ChangeManagement::WorkOrder::Type\'.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define the signals for each workorder state.'} = 'Define the signals for each workorder state.';
    $Self->{Translation}->{'Define which columns are shown in the linked Changes widget (LinkObject::ViewMode = "complex"). Note: Only Change attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked Workorder widget (LinkObject::ViewMode = "complex"). Note: Only Workorder attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a change list.'} =
        'Defines an overview module to show the small view of a change list.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a template list.'} =
        'Defines an overview module to show the small view of a template list.';
    $Self->{Translation}->{'Defines if it will be possible to print the accounted time.'} = 'Defines if it will be possible to print the accounted time.';
    $Self->{Translation}->{'Defines if it will be possible to print the planned effort.'} = 'Defines if it will be possible to print the planned effort.';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) change end states should be allowed if a change is in a locked state.'} =
        'Defines if reachable (as defined by the state machine) change end states should be allowed if a change is in a locked state.';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) workorder end states should be allowed if a workorder is in a locked state.'} =
        'Defines if reachable (as defined by the state machine) workorder end states should be allowed if a workorder is in a locked state.';
    $Self->{Translation}->{'Defines if the accounted time should be shown.'} = 'Defines if the accounted time should be shown.';
    $Self->{Translation}->{'Defines if the actual start and end times should be set.'} = 'Defines if the actual start and end times should be set.';
    $Self->{Translation}->{'Defines if the change search and the workorder search functions could use the mirror DB.'} =
        'Defines if the change search and the workorder search functions could use the mirror DB.';
    $Self->{Translation}->{'Defines if the change state can be set in AgentITSMChangeEdit.'} =
        'Defines if the change state can be set in AgentITSMChangeEdit.';
    $Self->{Translation}->{'Defines if the planned effort should be shown.'} = 'Defines if the planned effort should be shown.';
    $Self->{Translation}->{'Defines if the requested date should be print by customer.'} = 'Defines if the requested date should be print by customer.';
    $Self->{Translation}->{'Defines if the requested date should be searched by customer.'} =
        'Defines if the requested date should be searched by customer.';
    $Self->{Translation}->{'Defines if the requested date should be set by customer.'} = 'Defines if the requested date should be set by customer.';
    $Self->{Translation}->{'Defines if the requested date should be shown by customer.'} = 'Defines if the requested date should be shown by customer.';
    $Self->{Translation}->{'Defines if the workorder state should be shown.'} = 'Defines if the workorder state should be shown.';
    $Self->{Translation}->{'Defines if the workorder title should be shown.'} = 'Defines if the workorder title should be shown.';
    $Self->{Translation}->{'Defines shown graph attributes.'} = 'Defines shown graph attributes.';
    $Self->{Translation}->{'Defines that only changes containing Workorders linked with services, which the customer user has permission to use will be shown. Any other changes will not be displayed.'} =
        'Defines that only changes containing Workorders linked with services, which the customer user has permission to use will be shown. Any other changes will not be displayed.';
    $Self->{Translation}->{'Defines the change states that will be allowed to delete.'} = 'Defines the change states that will be allowed to delete.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change PSA overview.'} =
        'Defines the change states that will be used as filters in the Change PSA overview.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change Schedule overview.'} =
        'Defines the change states that will be used as filters in the Change Schedule overview.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyCAB overview.'} =
        'Defines the change states that will be used as filters in the MyCAB overview.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyChanges overview.'} =
        'Defines the change states that will be used as filters in the MyChanges overview.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change manager overview.'} =
        'Defines the change states that will be used as filters in the change manager overview.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change overview.'} =
        'Defines the change states that will be used as filters in the change overview.';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the customer change schedule overview.'} =
        'Defines the change states that will be used as filters in the customer change schedule overview.';
    $Self->{Translation}->{'Defines the default change title for a dummy change which is needed to edit a workorder template.'} =
        'Defines the default change title for a dummy change which is needed to edit a workorder template.';
    $Self->{Translation}->{'Defines the default sort criteria in the change PSA overview.'} =
        'Defines the default sort criteria in the change PSA overview.';
    $Self->{Translation}->{'Defines the default sort criteria in the change manager overview.'} =
        'Defines the default sort criteria in the change manager overview.';
    $Self->{Translation}->{'Defines the default sort criteria in the change overview.'} = 'Defines the default sort criteria in the change overview.';
    $Self->{Translation}->{'Defines the default sort criteria in the change schedule overview.'} =
        'Defines the default sort criteria in the change schedule overview.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyCAB overview.'} =
        'Defines the default sort criteria of the changes in the MyCAB overview.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyChanges overview.'} =
        'Defines the default sort criteria of the changes in the MyChanges overview.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyWorkorders overview.'} =
        'Defines the default sort criteria of the changes in the MyWorkorders overview.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the PIR overview.'} =
        'Defines the default sort criteria of the changes in the PIR overview.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the customer change schedule overview.'} =
        'Defines the default sort criteria of the changes in the customer change schedule overview.';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the template overview.'} =
        'Defines the default sort criteria of the changes in the template overview.';
    $Self->{Translation}->{'Defines the default sort order in the MyCAB overview.'} = 'Defines the default sort order in the MyCAB overview.';
    $Self->{Translation}->{'Defines the default sort order in the MyChanges overview.'} = 'Defines the default sort order in the MyChanges overview.';
    $Self->{Translation}->{'Defines the default sort order in the MyWorkorders overview.'} =
        'Defines the default sort order in the MyWorkorders overview.';
    $Self->{Translation}->{'Defines the default sort order in the PIR overview.'} = 'Defines the default sort order in the PIR overview.';
    $Self->{Translation}->{'Defines the default sort order in the change PSA overview.'} = 'Defines the default sort order in the change PSA overview.';
    $Self->{Translation}->{'Defines the default sort order in the change manager overview.'} =
        'Defines the default sort order in the change manager overview.';
    $Self->{Translation}->{'Defines the default sort order in the change overview.'} = 'Defines the default sort order in the change overview.';
    $Self->{Translation}->{'Defines the default sort order in the change schedule overview.'} =
        'Defines the default sort order in the change schedule overview.';
    $Self->{Translation}->{'Defines the default sort order in the customer change schedule overview.'} =
        'Defines the default sort order in the customer change schedule overview.';
    $Self->{Translation}->{'Defines the default sort order in the template overview.'} = 'Defines the default sort order in the template overview.';
    $Self->{Translation}->{'Defines the default value for the category of a change.'} = 'Defines the default value for the category of a change.';
    $Self->{Translation}->{'Defines the default value for the impact of a change.'} = 'Defines the default value for the impact of a change.';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for change attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        'Defines the field type of CompareValue fields for change attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for workorder attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        'Defines the field type of CompareValue fields for workorder attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.';
    $Self->{Translation}->{'Defines the object attributes that are selectable for change objects in AgentITSMChangeConditionEdit.'} =
        'Defines the object attributes that are selectable for change objects in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the object attributes that are selectable for workorder objects in AgentITSMChangeConditionEdit.'} =
        'Defines the object attributes that are selectable for workorder objects in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute AccountedTime in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute AccountedTime in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualEndTime in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute ActualEndTime in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualStartTime in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute ActualStartTime in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute CategoryID in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute CategoryID in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeBuilderID in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute ChangeBuilderID in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeManagerID in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute ChangeManagerID in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeStateID in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute ChangeStateID in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeTitle in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute ChangeTitle in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute DynamicField in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute DynamicField in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ImpactID in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute ImpactID in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEffort in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute PlannedEffort in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEndTime in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute PlannedEndTime in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedStartTime in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute PlannedStartTime in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PriorityID in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute PriorityID in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute RequestedTime in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute RequestedTime in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderAgentID in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute WorkOrderAgentID in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderNumber in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute WorkOrderNumber in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderStateID in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute WorkOrderStateID in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTitle in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute WorkOrderTitle in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTypeID in AgentITSMChangeConditionEdit.'} =
        'Defines the operators that are selectable for the attribute WorkOrderTypeID in AgentITSMChangeConditionEdit.';
    $Self->{Translation}->{'Defines the period (in years), in which start and end times can be selected.'} =
        'Defines the period (in years), in which start and end times can be selected.';
    $Self->{Translation}->{'Defines the shown attributes of a workorder in the tooltip of the workorder graph in the change zoom. To show workorder dynamic fields in the tooltip, they must be specified like DynamicField_WorkOrderFieldName1, DynamicField_WorkOrderFieldName2, etc.'} =
        'Defines the shown attributes of a workorder in the tooltip of the workorder graph in the change zoom. To show workorder dynamic fields in the tooltip, they must be specified like DynamicField_WorkOrderFieldName1, DynamicField_WorkOrderFieldName2, etc.';
    $Self->{Translation}->{'Defines the shown columns in the Change PSA overview. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the Change PSA overview. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the Change Schedule overview. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the Change Schedule overview. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the MyCAB overview. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the MyCAB overview. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the MyChanges overview. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the MyChanges overview. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the MyWorkorders overview. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the MyWorkorders overview. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the PIR overview. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the PIR overview. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the change manager overview. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the change manager overview. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the change overview. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the change overview. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the change search. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the change search. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the customer change schedule overview. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the customer change schedule overview. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the template overview. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the template overview. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the signals for each ITSMChange state.'} = 'Defines the signals for each ITSMChange state.';
    $Self->{Translation}->{'Defines the template types that will be used as filters in the template overview.'} =
        'Defines the template types that will be used as filters in the template overview.';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the MyWorkorders overview.'} =
        'Defines the workorder states that will be used as filters in the MyWorkorders overview.';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the PIR overview.'} =
        'Defines the workorder states that will be used as filters in the PIR overview.';
    $Self->{Translation}->{'Defines the workorder types that will be used to show the PIR overview.'} =
        'Defines the workorder types that will be used to show the PIR overview.';
    $Self->{Translation}->{'Defines whether notifications should be sent.'} = 'Defines whether notifications should be sent.';
    $Self->{Translation}->{'Delete a change.'} = 'Delete a change.';
    $Self->{Translation}->{'Delete the change.'} = '';
    $Self->{Translation}->{'Delete the workorder.'} = '';
    $Self->{Translation}->{'Details of a change history entry.'} = 'Details of a change history entry.';
    $Self->{Translation}->{'Determines if an agent can exchange the X-axis of a stat if he generates one.'} =
        'Determines if an agent can exchange the X-axis of a stat if he generates one.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes done for config item classes.'} =
        'Determines if the common stats module may generate stats about changes done for config item classes.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding change state updates within a timeperiod.'} =
        'Determines if the common stats module may generate stats about changes regarding change state updates within a timeperiod.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding the relation between changes and incident tickets.'} =
        'Determines if the common stats module may generate stats about changes regarding the relation between changes and incident tickets.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes.'} =
        'Determines if the common stats module may generate stats about changes.';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about the number of Rfc tickets a requester created.'} =
        'Determines if the common stats module may generate stats about the number of Rfc tickets a requester created.';
    $Self->{Translation}->{'Dynamic fields (for changes and workorders) shown in the change print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamic fields (for changes and workorders) shown in the change print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.';
    $Self->{Translation}->{'Dynamic fields shown in the change add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamic fields shown in the change add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.';
    $Self->{Translation}->{'Dynamic fields shown in the change edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamic fields shown in the change edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.';
    $Self->{Translation}->{'Dynamic fields shown in the change search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamic fields shown in the change search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.';
    $Self->{Translation}->{'Dynamic fields shown in the change zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamic fields shown in the change zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.';
    $Self->{Translation}->{'Dynamic fields shown in the workorder add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamic fields shown in the workorder add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.';
    $Self->{Translation}->{'Dynamic fields shown in the workorder edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamic fields shown in the workorder edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.';
    $Self->{Translation}->{'Dynamic fields shown in the workorder report screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamic fields shown in the workorder report screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.';
    $Self->{Translation}->{'Dynamic fields shown in the workorder zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamic fields shown in the workorder zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.';
    $Self->{Translation}->{'DynamicField event module to handle the update of conditions if dynamic fields are added, updated or deleted.'} =
        'DynamicField event module to handle the update of conditions if dynamic fields are added, updated or deleted.';
    $Self->{Translation}->{'Edit a change.'} = 'Edit a change.';
    $Self->{Translation}->{'Edit the change.'} = '';
    $Self->{Translation}->{'Edit the conditions of the change.'} = '';
    $Self->{Translation}->{'Edit the workorder.'} = '';
    $Self->{Translation}->{'Forward schedule of changes. Overview over approved changes.'} =
        'Forward schedule of changes. Overview over approved changes.';
    $Self->{Translation}->{'History Zoom'} = 'History Zoom';
    $Self->{Translation}->{'ITSM Change CAB Templates.'} = 'ITSM Change CAB Templates.';
    $Self->{Translation}->{'ITSM Change Condition Edit.'} = 'ITSM Change Condition Edit.';
    $Self->{Translation}->{'ITSM Change Condition Overview.'} = 'ITSM Change Condition Overview.';
    $Self->{Translation}->{'ITSM Change Management Notifications'} = 'ITSM Change Management Notifications';
    $Self->{Translation}->{'ITSM Change Manager Overview.'} = 'ITSM Change Manager Overview.';
    $Self->{Translation}->{'ITSM Change PIR Overview.'} = 'ITSM Change PIR Overview.';
    $Self->{Translation}->{'ITSM Change notification rules'} = 'ITSM Change notification rules';
    $Self->{Translation}->{'ITSM MyCAB Overview.'} = 'ITSM MyCAB Overview.';
    $Self->{Translation}->{'ITSM MyChanges Overview.'} = 'ITSM MyChanges Overview.';
    $Self->{Translation}->{'ITSM MyWorkorders Overview.'} = 'ITSM MyWorkorders Overview.';
    $Self->{Translation}->{'ITSM Template Delete.'} = 'ITSM Template Delete.';
    $Self->{Translation}->{'ITSM Template Edit CAB.'} = 'ITSM Template Edit CAB.';
    $Self->{Translation}->{'ITSM Template Edit Content.'} = 'ITSM Template Edit Content.';
    $Self->{Translation}->{'ITSM Template Edit.'} = 'ITSM Template Edit.';
    $Self->{Translation}->{'ITSM Template Overview.'} = 'ITSM Template Overview.';
    $Self->{Translation}->{'ITSM event module that cleans up conditions.'} = 'ITSM event module that cleans up conditions.';
    $Self->{Translation}->{'ITSM event module that deletes the cache for a toolbar.'} = 'ITSM event module that deletes the cache for a toolbar.';
    $Self->{Translation}->{'ITSM event module that deletes the history of changes.'} = 'ITSM event module that deletes the history of changes.';
    $Self->{Translation}->{'ITSM event module that matches conditions and executes actions.'} =
        'ITSM event module that matches conditions and executes actions.';
    $Self->{Translation}->{'ITSM event module that sends notifications.'} = 'ITSM event module that sends notifications.';
    $Self->{Translation}->{'ITSM event module that updates the history of changes.'} = 'ITSM event module that updates the history of changes.';
    $Self->{Translation}->{'ITSM event module that updates the history of conditions.'} = 'ITSM event module that updates the history of conditions.';
    $Self->{Translation}->{'ITSM event module that updates the history of workorders.'} = 'ITSM event module that updates the history of workorders.';
    $Self->{Translation}->{'ITSM event module to recalculate the workorder numbers.'} = 'ITSM event module to recalculate the workorder numbers.';
    $Self->{Translation}->{'ITSM event module to set the actual start and end times of workorders.'} =
        'ITSM event module to set the actual start and end times of workorders.';
    $Self->{Translation}->{'If frequency is \'regularly\', you can configure how often the notifications are sent (every X hours).'} =
        'If frequency is \'regularly\', you can configure how often the notifications are sent (every X hours).';
    $Self->{Translation}->{'Link another object to the change.'} = '';
    $Self->{Translation}->{'Link another object to the workorder.'} = '';
    $Self->{Translation}->{'Logfile for the ITSM change counter. This file is used for creating the change numbers.'} =
        'Logfile for the ITSM change counter. This file is used for creating the change numbers.';
    $Self->{Translation}->{'Lookup of CAB members for autocompletion.'} = 'Lookup of CAB members for autocompletion.';
    $Self->{Translation}->{'Lookup of agents, used for autocompletion.'} = 'Lookup of agents, used for autocompletion.';
    $Self->{Translation}->{'Module to check if WorkOrderAdd or WorkOrderAddFromTemplate should be permitted.'} =
        'Module to check if WorkOrderAdd or WorkOrderAddFromTemplate should be permitted.';
    $Self->{Translation}->{'Module to check the CAB members.'} = 'Module to check the CAB members.';
    $Self->{Translation}->{'Module to check the agent.'} = 'Module to check the agent.';
    $Self->{Translation}->{'Module to check the change builder.'} = 'Module to check the change builder.';
    $Self->{Translation}->{'Module to check the change manager.'} = 'Module to check the change manager.';
    $Self->{Translation}->{'Module to check the workorder agent.'} = 'Module to check the workorder agent.';
    $Self->{Translation}->{'Module to check whether no workorder agent is set.'} = 'Module to check whether no workorder agent is set.';
    $Self->{Translation}->{'Module to check whether the agent is contained in the configured list.'} =
        'Module to check whether the agent is contained in the configured list.';
    $Self->{Translation}->{'Module to show a link to create a change from this ticket. The ticket will be automatically linked with the new change.'} =
        'Module to show a link to create a change from this ticket. The ticket will be automatically linked with the new change.';
    $Self->{Translation}->{'Move Time Slot.'} = 'Move Time Slot.';
    $Self->{Translation}->{'Move all workorders in time.'} = '';
    $Self->{Translation}->{'Only users of these groups have the permission to use the ticket types as defined in "ITSMChange::AddChangeLinkTicketTypes" if the feature "Ticket::Acl::Module###200-Ticket::Acl::Module" is enabled.'} =
        'Only users of these groups have the permission to use the ticket types as defined in "ITSMChange::AddChangeLinkTicketTypes" if the feature "Ticket::Acl::Module###200-Ticket::Acl::Module" is enabled.';
    $Self->{Translation}->{'Overview over all Changes.'} = 'Overview over all Changes.';
    $Self->{Translation}->{'PIR'} = '';
    $Self->{Translation}->{'PSA'} = 'PSA';
    $Self->{Translation}->{'Parameters for the UserCreateWorkOrderNextMask object in the preference view of the agent interface.'} =
        'Parameters for the UserCreateWorkOrderNextMask object in the preference view of the agent interface.';
    $Self->{Translation}->{'Parameters for the pages (in which the changes are shown) of the small change overview.'} =
        'Parameters for the pages (in which the changes are shown) of the small change overview.';
    $Self->{Translation}->{'Presents a link in the menu to show the involved persons in a change, in the zoom view of such change in the agent interface.'} =
        'Presents a link in the menu to show the involved persons in a change, in the zoom view of such change in the agent interface.';
    $Self->{Translation}->{'Print the change.'} = '';
    $Self->{Translation}->{'Print the workorder.'} = '';
    $Self->{Translation}->{'Projected Service Availability'} = '';
    $Self->{Translation}->{'Projected Service Availability (PSA)'} = 'Projected Service Availability (PSA)';
    $Self->{Translation}->{'Projected Service Availability (PSA) of changes. Overview of approved changes and their services.'} =
        'Projected Service Availability (PSA) of changes. Overview of approved changes and their services.';
    $Self->{Translation}->{'Required privileges in order for an agent to take a workorder.'} =
        'Required privileges in order for an agent to take a workorder.';
    $Self->{Translation}->{'Required privileges to access the overview of all changes.'} = 'Required privileges to access the overview of all changes.';
    $Self->{Translation}->{'Required privileges to add a workorder.'} = 'Required privileges to add a workorder.';
    $Self->{Translation}->{'Required privileges to change the workorder agent.'} = 'Required privileges to change the workorder agent.';
    $Self->{Translation}->{'Required privileges to create a template from a change.'} = 'Required privileges to create a template from a change.';
    $Self->{Translation}->{'Required privileges to create a template from a changes\' CAB.'} =
        'Required privileges to create a template from a changes\' CAB.';
    $Self->{Translation}->{'Required privileges to create a template from a workorder.'} = 'Required privileges to create a template from a workorder.';
    $Self->{Translation}->{'Required privileges to create changes from templates.'} = 'Required privileges to create changes from templates.';
    $Self->{Translation}->{'Required privileges to create changes.'} = 'Required privileges to create changes.';
    $Self->{Translation}->{'Required privileges to delete a template.'} = 'Required privileges to delete a template.';
    $Self->{Translation}->{'Required privileges to delete a workorder.'} = 'Required privileges to delete a workorder.';
    $Self->{Translation}->{'Required privileges to delete changes.'} = 'Required privileges to delete changes.';
    $Self->{Translation}->{'Required privileges to edit a template.'} = 'Required privileges to edit a template.';
    $Self->{Translation}->{'Required privileges to edit a workorder.'} = 'Required privileges to edit a workorder.';
    $Self->{Translation}->{'Required privileges to edit changes.'} = 'Required privileges to edit changes.';
    $Self->{Translation}->{'Required privileges to edit the conditions of changes.'} = 'Required privileges to edit the conditions of changes.';
    $Self->{Translation}->{'Required privileges to edit the content of a template.'} = 'Required privileges to edit the content of a template.';
    $Self->{Translation}->{'Required privileges to edit the involved persons of a change.'} =
        'Required privileges to edit the involved persons of a change.';
    $Self->{Translation}->{'Required privileges to move changes in time.'} = 'Required privileges to move changes in time.';
    $Self->{Translation}->{'Required privileges to print a change.'} = 'Required privileges to print a change.';
    $Self->{Translation}->{'Required privileges to reset changes.'} = 'Required privileges to reset changes.';
    $Self->{Translation}->{'Required privileges to view a workorder.'} = 'Required privileges to view a workorder.';
    $Self->{Translation}->{'Required privileges to view changes.'} = 'Required privileges to view changes.';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is a CAB member.'} =
        'Required privileges to view list of changes where the user is a CAB member.';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is the change manager.'} =
        'Required privileges to view list of changes where the user is the change manager.';
    $Self->{Translation}->{'Required privileges to view overview over all templates.'} = 'Required privileges to view overview over all templates.';
    $Self->{Translation}->{'Required privileges to view the conditions of changes.'} = 'Required privileges to view the conditions of changes.';
    $Self->{Translation}->{'Required privileges to view the history of a change.'} = 'Required privileges to view the history of a change.';
    $Self->{Translation}->{'Required privileges to view the history of a workorder.'} = 'Required privileges to view the history of a workorder.';
    $Self->{Translation}->{'Required privileges to view the history zoom of a change.'} = 'Required privileges to view the history zoom of a change.';
    $Self->{Translation}->{'Required privileges to view the history zoom of a workorder.'} =
        'Required privileges to view the history zoom of a workorder.';
    $Self->{Translation}->{'Required privileges to view the list of Change Schedule.'} = 'Required privileges to view the list of Change Schedule.';
    $Self->{Translation}->{'Required privileges to view the list of change PSA.'} = 'Required privileges to view the list of change PSA.';
    $Self->{Translation}->{'Required privileges to view the list of changes with an upcoming PIR (Post Implementation Review).'} =
        'Required privileges to view the list of changes with an upcoming PIR (Post Implementation Review).';
    $Self->{Translation}->{'Required privileges to view the list of own changes.'} = 'Required privileges to view the list of own changes.';
    $Self->{Translation}->{'Required privileges to view the list of own workorders.'} = 'Required privileges to view the list of own workorders.';
    $Self->{Translation}->{'Required privileges to write a report for the workorder.'} = 'Required privileges to write a report for the workorder.';
    $Self->{Translation}->{'Reset a change and its workorders.'} = 'Reset a change and its workorders.';
    $Self->{Translation}->{'Reset change and its workorders.'} = '';
    $Self->{Translation}->{'Run task to check if specific times have been reached in changes and workorders.'} =
        'Run task to check if specific times have been reached in changes and workorders.';
    $Self->{Translation}->{'Save change as a template.'} = '';
    $Self->{Translation}->{'Save workorder as a template.'} = '';
    $Self->{Translation}->{'Schedule'} = '';
    $Self->{Translation}->{'Screen after creating a workorder'} = 'Screen after creating a workorder';
    $Self->{Translation}->{'Search Changes.'} = 'Search Changes.';
    $Self->{Translation}->{'Selects the change number generator module. "AutoIncrement" increments the change number, the SystemID and the counter are used with SystemID.counter format (e.g. 100118, 100119). With "Date", the change numbers will be generated by the current date and a counter; this format looks like Year.Month.Day.counter, e.g. 2010062400001, 2010062400002. With "DateChecksum", the counter will be appended as checksum to the string of date plus the SystemID. The checksum will be rotated on a daily basis. This format looks like Year.Month.Day.SystemID.Counter.CheckSum, e.g. 2010062410000017, 2010062410000026.'} =
        'Selects the change number generator module. "AutoIncrement" increments the change number, the SystemID and the counter are used with SystemID.counter format (e.g. 100118, 100119). With "Date", the change numbers will be generated by the current date and a counter; this format looks like Year.Month.Day.counter, e.g. 2010062400001, 2010062400002. With "DateChecksum", the counter will be appended as checksum to the string of date plus the SystemID. The checksum will be rotated on a daily basis. This format looks like Year.Month.Day.SystemID.Counter.CheckSum, e.g. 2010062410000017, 2010062410000026.';
    $Self->{Translation}->{'Set the agent for the workorder.'} = '';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        'Set the default height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        'Set the maximum height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.';
    $Self->{Translation}->{'Sets the minimal change counter size (if "AutoIncrement" was selected as ITSMChange::NumberGenerator). Default is 5, this means the counter starts from 10000.'} =
        'Sets the minimal change counter size (if "AutoIncrement" was selected as ITSMChange::NumberGenerator). Default is 5, this means the counter starts from 10000.';
    $Self->{Translation}->{'Sets up the state machine for changes.'} = 'Sets up the state machine for changes.';
    $Self->{Translation}->{'Sets up the state machine for workorders.'} = 'Sets up the state machine for workorders.';
    $Self->{Translation}->{'Shows a checkbox in the AgentITSMWorkOrderEdit screen that defines if the the following workorders should also be moved if a workorder is modified and the planned end time has changed.'} =
        'Shows a checkbox in the AgentITSMWorkOrderEdit screen that defines if the the following workorders should also be moved if a workorder is modified and the planned end time has changed.';
    $Self->{Translation}->{'Shows a link in the menu that allows changing the workorder agent, in the zoom view of such workorder of the agent interface.'} =
        'Shows a link in the menu that allows changing the workorder agent, in the zoom view of such workorder of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a change as a template in the zoom view of the change, in the agent interface.'} =
        'Shows a link in the menu that allows defining a change as a template in the zoom view of the change, in the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a workorder as a template in the zoom view of the workorder, in the agent interface.'} =
        'Shows a link in the menu that allows defining a workorder as a template in the zoom view of the workorder, in the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu that allows editing the report of a workorder, in the zoom view of such workorder of the agent interface.'} =
        'Shows a link in the menu that allows editing the report of a workorder, in the zoom view of such workorder of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a change with another object in the change zoom view of the agent interface.'} =
        'Shows a link in the menu that allows linking a change with another object in the change zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a workorder with another object in the zoom view of such workorder of the agent interface.'} =
        'Shows a link in the menu that allows linking a workorder with another object in the zoom view of such workorder of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu that allows moving the time slot of a change in its zoom view of the agent interface.'} =
        'Shows a link in the menu that allows moving the time slot of a change in its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu that allows taking a workorder in the its zoom view of the agent interface.'} =
        'Shows a link in the menu that allows taking a workorder in the its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to access the conditions of a change in the its zoom view of the agent interface.'} =
        'Shows a link in the menu to access the conditions of a change in the its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a change in the its zoom view of the agent interface.'} =
        'Shows a link in the menu to access the history of a change in the its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a workorder in the its zoom view of the agent interface.'} =
        'Shows a link in the menu to access the history of a workorder in the its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to add a workorder in the change zoom view of the agent interface.'} =
        'Shows a link in the menu to add a workorder in the change zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to delete a change in its zoom view of the agent interface.'} =
        'Shows a link in the menu to delete a change in its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to delete a workorder in its zoom view of the agent interface.'} =
        'Shows a link in the menu to delete a workorder in its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to edit a change in the its zoom view of the agent interface.'} =
        'Shows a link in the menu to edit a change in the its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to edit a workorder in the its zoom view of the agent interface.'} =
        'Shows a link in the menu to edit a workorder in the its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the change zoom view of the agent interface.'} =
        'Shows a link in the menu to go back in the change zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the workorder zoom view of the agent interface.'} =
        'Shows a link in the menu to go back in the workorder zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to print a change in the its zoom view of the agent interface.'} =
        'Shows a link in the menu to print a change in the its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to print a workorder in the its zoom view of the agent interface.'} =
        'Shows a link in the menu to print a workorder in the its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to reset a change and its workorders in its zoom view of the agent interface.'} =
        'Shows a link in the menu to reset a change and its workorders in its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows the change history (reverse ordered) in the agent interface.'} =
        'Shows the change history (reverse ordered) in the agent interface.';
    $Self->{Translation}->{'State Machine'} = 'State Machine';
    $Self->{Translation}->{'Stores change and workorder ids and their corresponding template id, while a user is editing a template.'} =
        'Stores change and workorder ids and their corresponding template id, while a user is editing a template.';
    $Self->{Translation}->{'Take Workorder.'} = 'Take Workorder.';
    $Self->{Translation}->{'Take the workorder.'} = '';
    $Self->{Translation}->{'Template.'} = 'Template.';
    $Self->{Translation}->{'The identifier for a change, e.g. Change#, MyChange#. The default is Change#.'} =
        'The identifier for a change, e.g. Change#, MyChange#. The default is Change#.';
    $Self->{Translation}->{'The identifier for a workorder, e.g. Workorder#, MyWorkorder#. The default is Workorder#.'} =
        'The identifier for a workorder, e.g. Workorder#, MyWorkorder#. The default is Workorder#.';
    $Self->{Translation}->{'This ACL module restricts the usuage of the ticket types that are defined in the sysconfig option \'ITSMChange::AddChangeLinkTicketTypes\', to users of the groups as defined in "ITSMChange::RestrictTicketTypes::Groups". As this ACL could collide with other ACLs which are also related to the ticket type, this sysconfig option is disabled by default and should only be activated if needed.'} =
        'This ACL module restricts the usuage of the ticket types that are defined in the sysconfig option \'ITSMChange::AddChangeLinkTicketTypes\', to users of the groups as defined in "ITSMChange::RestrictTicketTypes::Groups". As this ACL could collide with other ACLs which are also related to the ticket type, this sysconfig option is disabled by default and should only be activated if needed.';
    $Self->{Translation}->{'Time Slot'} = 'Time Slot';
    $Self->{Translation}->{'Types of tickets, where in the ticket zoom view a link to add a change will be displayed.'} =
        'Types of tickets, where in the ticket zoom view a link to add a change will be displayed.';
    $Self->{Translation}->{'User Search'} = 'User Search';
    $Self->{Translation}->{'Workorder Add (from template).'} = 'Workorder Add (from template).';
    $Self->{Translation}->{'Workorder Add.'} = 'Workorder Add.';
    $Self->{Translation}->{'Workorder Agent'} = '';
    $Self->{Translation}->{'Workorder Agent.'} = 'Workorder Agent.';
    $Self->{Translation}->{'Workorder Delete.'} = 'Workorder Delete.';
    $Self->{Translation}->{'Workorder Edit.'} = 'Workorder Edit.';
    $Self->{Translation}->{'Workorder History Zoom.'} = 'Workorder History Zoom.';
    $Self->{Translation}->{'Workorder History.'} = 'Workorder History.';
    $Self->{Translation}->{'Workorder Report.'} = 'Workorder Report.';
    $Self->{Translation}->{'Workorder Zoom.'} = 'Workorder Zoom.';
    $Self->{Translation}->{'once'} = 'once';
    $Self->{Translation}->{'regularly'} = 'regularly';

}

1;
