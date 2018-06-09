# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_ITSMChangeManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMChangeManagement
    $Self->{Translation}->{'ITSMChange'} = '变更';
    $Self->{Translation}->{'ITSMChanges'} = '变更';
    $Self->{Translation}->{'ITSM Changes'} = '变更';
    $Self->{Translation}->{'workorder'} = '工作指令';
    $Self->{Translation}->{'A change must have a title!'} = '变更必须有标题!';
    $Self->{Translation}->{'A condition must have a name!'} = '条件必须有名称!';
    $Self->{Translation}->{'A template must have a name!'} = '模板必须有名称!';
    $Self->{Translation}->{'A workorder must have a title!'} = '工作指令必须有标题!';
    $Self->{Translation}->{'Add CAB Template'} = '添加CAB（变更咨询委员会）模板';
    $Self->{Translation}->{'Add Workorder'} = '添加工作指令';
    $Self->{Translation}->{'Add a workorder to the change'} = '添加变更工作指令';
    $Self->{Translation}->{'Add new condition and action pair'} = '添加新的条件和操作';
    $Self->{Translation}->{'Agent interface module to show the ChangeManager overview icon.'} =
        '显示变更经理概览图标的服务人员界面模块。';
    $Self->{Translation}->{'Agent interface module to show the MyCAB overview icon.'} = '显示“我的CAB”概览图标的服务人员界面模块。';
    $Self->{Translation}->{'Agent interface module to show the MyChanges overview icon.'} = '显示“我的变更”概览图标的服务人员界面模块。';
    $Self->{Translation}->{'Agent interface module to show the MyWorkOrders overview icon.'} =
        '显示“我的工作指令”概览图标的服务人员界面模块。';
    $Self->{Translation}->{'CABAgents'} = '服务人员CAB';
    $Self->{Translation}->{'CABCustomers'} = '客户CAB';
    $Self->{Translation}->{'Change Overview'} = '变更概况';
    $Self->{Translation}->{'Change Schedule'} = '变更计划';
    $Self->{Translation}->{'Change involved persons of the change'} = '更换变更涉及的相关人员';
    $Self->{Translation}->{'ChangeHistory::ActionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ActionAddID'} = '新的操作 （ID=%s）';
    $Self->{Translation}->{'ChangeHistory::ActionDelete'} = '操作（ID=%s） 已删除';
    $Self->{Translation}->{'ChangeHistory::ActionDeleteAll'} = '条件（ID=%s）的所有操作均已删除';
    $Self->{Translation}->{'ChangeHistory::ActionExecute'} = '操作（ID=%s）已执行：%s';
    $Self->{Translation}->{'ChangeHistory::ActionUpdate'} = '%s (操作ID=%s): 新：“%s” <-，旧：“ %s”';
    $Self->{Translation}->{'ChangeHistory::ChangeActualEndTimeReached'} = '变更（ID=%s）的实际结束时间已到。';
    $Self->{Translation}->{'ChangeHistory::ChangeActualStartTimeReached'} = '变更（ID=%s）的实际开始时间已到。';
    $Self->{Translation}->{'ChangeHistory::ChangeAdd'} = '新建变更（ID=%s）';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentAdd'} = '新增附件: %s';
    $Self->{Translation}->{'ChangeHistory::ChangeAttachmentDelete'} = '删除附件 %s';
    $Self->{Translation}->{'ChangeHistory::ChangeCABDelete'} = 'CAB已删除 %s';
    $Self->{Translation}->{'ChangeHistory::ChangeCABUpdate'} = '%s : 新：“%s” <-，旧：“%s”';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkAdd'} = '添加到%s的链接 （ID=%s）';
    $Self->{Translation}->{'ChangeHistory::ChangeLinkDelete'} = '删除到%s 的链接（ID=%s）。';
    $Self->{Translation}->{'ChangeHistory::ChangeNotificationSent'} = '通知已发送给%s （事件： %s）';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedEndTimeReached'} = '变更（ID=%s）的计划结束时间已到。';
    $Self->{Translation}->{'ChangeHistory::ChangePlannedStartTimeReached'} = '变更（ID=%s）的计划开始时间已到。';
    $Self->{Translation}->{'ChangeHistory::ChangeRequestedTimeReached'} = '变更（ID=%s）的请求时间已到。';
    $Self->{Translation}->{'ChangeHistory::ChangeUpdate'} = '%s : 新：“%s” <-，旧：“%s”';
    $Self->{Translation}->{'ChangeHistory::ConditionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ConditionAddID'} = '新增条件（ID=%s）';
    $Self->{Translation}->{'ChangeHistory::ConditionDelete'} = '条件（ID=%s）已删除';
    $Self->{Translation}->{'ChangeHistory::ConditionDeleteAll'} = '变更（ID=%s）的所有条件均已删除';
    $Self->{Translation}->{'ChangeHistory::ConditionUpdate'} = '%s（条件ID=%s） : 新：“%s” <-，旧：“%s”';
    $Self->{Translation}->{'ChangeHistory::ExpressionAdd'} = '%s: %s';
    $Self->{Translation}->{'ChangeHistory::ExpressionAddID'} = '新建表达式（ID=%s）';
    $Self->{Translation}->{'ChangeHistory::ExpressionDelete'} = '表达式（ID=%s）已删除';
    $Self->{Translation}->{'ChangeHistory::ExpressionDeleteAll'} = '条件（ID=%s）的所有表达式均已删除';
    $Self->{Translation}->{'ChangeHistory::ExpressionUpdate'} = '%s（表达式ID=%s） : 新：“%s” <-，旧：“%s”';
    $Self->{Translation}->{'ChangeNumber'} = '变更编号';
    $Self->{Translation}->{'Condition Edit'} = '条件编辑';
    $Self->{Translation}->{'Create Change'} = '创建变更';
    $Self->{Translation}->{'Create a change from this ticket!'} = '从这个工单创建变更！';
    $Self->{Translation}->{'Delete Workorder'} = '删除工作指令';
    $Self->{Translation}->{'Edit the change'} = '编辑变更';
    $Self->{Translation}->{'Edit the conditions of the change'} = '编辑变更条件';
    $Self->{Translation}->{'Edit the workorder'} = '编辑工作指令';
    $Self->{Translation}->{'Expression'} = '表达式';
    $Self->{Translation}->{'Full-Text Search in Change and Workorder'} = '在变更和工作指令中进行全文搜索';
    $Self->{Translation}->{'ITSMCondition'} = '条件';
    $Self->{Translation}->{'ITSMWorkOrder'} = '工作指令';
    $Self->{Translation}->{'Link another object to the change'} = '链接另一对象到变更';
    $Self->{Translation}->{'Link another object to the workorder'} = '链接另一对象到工作指令';
    $Self->{Translation}->{'Move all workorders in time'} = '移动所有工作指令的时间';
    $Self->{Translation}->{'My CABs'} = '我的CAB';
    $Self->{Translation}->{'My Changes'} = '我的变更';
    $Self->{Translation}->{'My Workorders'} = '我的工作指令';
    $Self->{Translation}->{'No XXX settings'} = '没有设置\'%s\'';
    $Self->{Translation}->{'PIR (Post Implementation Review)'} = 'PIR (实施后审查)';
    $Self->{Translation}->{'PSA (Projected Service Availability)'} = 'PSA (计划服务可用性)';
    $Self->{Translation}->{'Please select first a catalog class!'} = '请先选择目录类';
    $Self->{Translation}->{'Print the change'} = '打印变更';
    $Self->{Translation}->{'Print the workorder'} = '打印工作指令';
    $Self->{Translation}->{'RequestedTime'} = '请求时间';
    $Self->{Translation}->{'Save Change CAB as Template'} = '保存变更CAB为模板';
    $Self->{Translation}->{'Save change as a template'} = '保存变更为模板';
    $Self->{Translation}->{'Save workorder as a template'} = '保存工作指令为模板';
    $Self->{Translation}->{'Search Changes'} = '搜索变更';
    $Self->{Translation}->{'Set the agent for the workorder'} = '为工作指令指派服务人员';
    $Self->{Translation}->{'Take Workorder'} = '接手工作指令';
    $Self->{Translation}->{'Take the workorder'} = '接手这个工作指令';
    $Self->{Translation}->{'Template Overview'} = '模板概览';
    $Self->{Translation}->{'The planned end time is invalid!'} = '计划结束时间无效！';
    $Self->{Translation}->{'The planned start time is invalid!'} = '计划开始时间无效！';
    $Self->{Translation}->{'The planned time is invalid!'} = '计划时间无效！';
    $Self->{Translation}->{'The requested time is invalid!'} = '请求时间无效！';
    $Self->{Translation}->{'New (from template)'} = '从模板新建变更';
    $Self->{Translation}->{'Add from template'} = '从模板添加';
    $Self->{Translation}->{'Add Workorder (from template)'} = '从模板添加工作指令';
    $Self->{Translation}->{'Add a workorder (from template) to the change'} = '在变更中添加工作指令（通过模板）';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReached'} = '工作指令（ID=%s） 实际结束时间已到。';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualEndTimeReachedWithWorkOrderID'} =
        '工作指令（ID=%s） 实际结束时间已到。';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReached'} = '工作指令（ID=%s） 实际开始时间已到。';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderActualStartTimeReachedWithWorkOrderID'} =
        '工作指令（ID=%s） 实际结束时间已到。';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAdd'} = '新建工作指令（ID=%s）';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAddWithWorkOrderID'} = '新建工作指令（ID=%s）';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAdd'} = '工作指令%s新增附件';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentAddWithWorkOrderID'} = '（ID=%s）工作指令%s新增附件';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDelete'} = '工作指令%s删除附件';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderAttachmentDeleteWithWorkOrderID'} = '（ID=%s）工作指令%s删除附件';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAdd'} = '工作指令%s新建\'报告\'附件';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentAddWithWorkOrderID'} =
        '（ID=%s）工作指令%s新建\'报告\'附件';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDelete'} = '工作指令%s删除\'报告\'附件';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderReportAttachmentDeleteWithWorkOrderID'} =
        '（ID=%s）工作指令%s删除\'报告\'附件';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDelete'} = 'Workorder （ID=%s） deleted';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderDeleteWithWorkOrderID'} = '工作指令（ID=%s）已删除';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAdd'} = '工作指令历史::工作指令添加链接';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkAddWithWorkOrderID'} = '（ID=%s）链接到%s（ID=%s）已添加';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDelete'} = '链接到%s（ID=%s）已删除';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderLinkDeleteWithWorkOrderID'} = '（ID=%s）链接到%s（ID=%s）已删除';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSent'} = '通知已发送给%s （事件： %s）';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderNotificationSentWithWorkOrderID'} = '（ID=%s）通知已发送给%s （事件： %s）';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReached'} = '工作指令（ID=%s）计划结束时间已到。';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedEndTimeReachedWithWorkOrderID'} =
        '工作指令（ID=%s）计划结束时间已到。';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReached'} = '工作指令（ID=%s）计划开始时间已到。';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderPlannedStartTimeReachedWithWorkOrderID'} =
        '工作指令（ID=%s）计划开始时间已到。';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdate'} = '%s : 新：“%s” <-，旧：“%s”';
    $Self->{Translation}->{'WorkOrderHistory::WorkOrderUpdateWithWorkOrderID'} = '（ID=%s）%s : 新：“%s” <-，旧：“%s”';
    $Self->{Translation}->{'WorkOrderNumber'} = '工作指令号';
    $Self->{Translation}->{'accepted'} = '接受';
    $Self->{Translation}->{'any'} = '任何';
    $Self->{Translation}->{'approval'} = '审批';
    $Self->{Translation}->{'approved'} = '通过审批';
    $Self->{Translation}->{'backout'} = '回退';
    $Self->{Translation}->{'begins with'} = '以...开始';
    $Self->{Translation}->{'canceled'} = '取消';
    $Self->{Translation}->{'contains'} = '包含';
    $Self->{Translation}->{'created'} = '创建于';
    $Self->{Translation}->{'decision'} = '决定';
    $Self->{Translation}->{'ends with'} = '以...结束';
    $Self->{Translation}->{'failed'} = '失败';
    $Self->{Translation}->{'in progress'} = '处理中';
    $Self->{Translation}->{'is'} = '是';
    $Self->{Translation}->{'is after'} = '是在...之后';
    $Self->{Translation}->{'is before'} = '是在...之前';
    $Self->{Translation}->{'is empty'} = '为空';
    $Self->{Translation}->{'is greater than'} = '大于';
    $Self->{Translation}->{'is less than'} = '小于';
    $Self->{Translation}->{'is not'} = '不是';
    $Self->{Translation}->{'is not empty'} = '不为空';
    $Self->{Translation}->{'not contains'} = '不包含';
    $Self->{Translation}->{'pending approval'} = '待审批';
    $Self->{Translation}->{'pending pir'} = '等待实施后审查';
    $Self->{Translation}->{'pir'} = 'PIR (实施后审查)';
    $Self->{Translation}->{'ready'} = '就绪';
    $Self->{Translation}->{'rejected'} = '被拒绝';
    $Self->{Translation}->{'requested'} = '请求的';
    $Self->{Translation}->{'retracted'} = '撤回';
    $Self->{Translation}->{'set'} = '设置';
    $Self->{Translation}->{'successful'} = '成功';

    # Template: AdminITSMChangeCIPAllocate
    $Self->{Translation}->{'Category <-> Impact <-> Priority'} = '风险类别 <-> 影响 <-> 优先级';
    $Self->{Translation}->{'Manage the priority result of combinating Category <-> Impact.'} =
        '"风险类别 <-> 影响"之间的组合决定优先级。';
    $Self->{Translation}->{'Priority allocation'} = '优先级分配';

    # Template: AdminITSMChangeNotification
    $Self->{Translation}->{'ITSM ChangeManagement Notification Management'} = '管理变更通知';
    $Self->{Translation}->{'Add Notification Rule'} = '添加通知规则';
    $Self->{Translation}->{'Rule'} = '规则';
    $Self->{Translation}->{'A notification should have a name!'} = '通知必须有名称！';
    $Self->{Translation}->{'Name is required.'} = '名称是必需的。';

    # Template: AdminITSMStateMachine
    $Self->{Translation}->{'Admin State Machine'} = '管理状态模式转换';
    $Self->{Translation}->{'Select a catalog class!'} = '选择目录类';
    $Self->{Translation}->{'A catalog class is required!'} = '目录类是必需的！';
    $Self->{Translation}->{'Add a state transition'} = '添加一个状态转换';
    $Self->{Translation}->{'Catalog Class'} = '目录类';
    $Self->{Translation}->{'Object Name'} = '对象名称';
    $Self->{Translation}->{'Overview over state transitions for'} = '状态转换概况';
    $Self->{Translation}->{'Delete this state transition'} = '删除这个状态转换';
    $Self->{Translation}->{'Add a new state transition for'} = '添加一个新的状态转换';
    $Self->{Translation}->{'Please select a state!'} = '请选择一个状态！';
    $Self->{Translation}->{'Please select a next state!'} = '请选择一个\'下一状态\'！';
    $Self->{Translation}->{'Edit a state transition for'} = '编辑状态转换';
    $Self->{Translation}->{'Do you really want to delete the state transition'} = '您真的想要删除这个状态转换吗?';

    # Template: AgentITSMChangeAdd
    $Self->{Translation}->{'Add Change'} = '创建变更';
    $Self->{Translation}->{'ITSM Change'} = '变更';
    $Self->{Translation}->{'Justification'} = '理由';
    $Self->{Translation}->{'Input invalid.'} = '输入无效。';
    $Self->{Translation}->{'Impact'} = '影响';
    $Self->{Translation}->{'Requested Date'} = '请求日期';

    # Template: AgentITSMChangeAddFromTemplate
    $Self->{Translation}->{'Select Change Template'} = '选择变更模板';
    $Self->{Translation}->{'Time type'} = '时间类型';
    $Self->{Translation}->{'Invalid time type.'} = '无效的时间类型。';
    $Self->{Translation}->{'New time'} = '新的时间';

    # Template: AgentITSMChangeCABTemplate
    $Self->{Translation}->{'Save Change CAB as template'} = '保存变更CAB为模板';
    $Self->{Translation}->{'go to involved persons screen'} = '转向相关人员窗口';
    $Self->{Translation}->{'Invalid Name'} = '无效的名称';

    # Template: AgentITSMChangeCondition
    $Self->{Translation}->{'Conditions and Actions'} = '条件和操作';
    $Self->{Translation}->{'Delete Condition'} = '删除条件';
    $Self->{Translation}->{'Add new condition'} = '添加新的条件';

    # Template: AgentITSMChangeConditionEdit
    $Self->{Translation}->{'Edit Condition'} = '编辑条件';
    $Self->{Translation}->{'Need a valid name.'} = '需要一个有效的名称。';
    $Self->{Translation}->{'A valid name is needed.'} = '需要一个有效的名称。';
    $Self->{Translation}->{'Duplicate name:'} = '重复的名称：';
    $Self->{Translation}->{'This name is already used by another condition.'} = '另一个条件已被使用过该名称。';
    $Self->{Translation}->{'Matching'} = '匹配';
    $Self->{Translation}->{'Any expression (OR)'} = '任意表达式(或)';
    $Self->{Translation}->{'All expressions (AND)'} = '所有表达式(与)';
    $Self->{Translation}->{'Expressions'} = '表达式';
    $Self->{Translation}->{'Selector'} = '选择器';
    $Self->{Translation}->{'Operator'} = '操作符';
    $Self->{Translation}->{'Delete Expression'} = '删除表达式';
    $Self->{Translation}->{'No Expressions found.'} = '没有找到表达式。';
    $Self->{Translation}->{'Add new expression'} = '添加新的表达式';
    $Self->{Translation}->{'Delete Action'} = '删除操作';
    $Self->{Translation}->{'No Actions found.'} = '没有找到操作';
    $Self->{Translation}->{'Add new action'} = '添加新的操作';

    # Template: AgentITSMChangeDelete
    $Self->{Translation}->{'Do you really want to delete this change?'} = '您真的想要删除这个变更吗?';

    # Template: AgentITSMChangeHistory
    $Self->{Translation}->{'History of'} = '历史';
    $Self->{Translation}->{'Workorder'} = '工作指令';
    $Self->{Translation}->{'Show details'} = '显示详情';
    $Self->{Translation}->{'Show workorder'} = '显示工作指令';

    # Template: AgentITSMChangeHistoryZoom
    $Self->{Translation}->{'Detailed history information of'} = '详细历史信息';
    $Self->{Translation}->{'Modified'} = '已修改';
    $Self->{Translation}->{'Old Value'} = '旧值';
    $Self->{Translation}->{'New Value'} = '新值';

    # Template: AgentITSMChangeInvolvedPersons
    $Self->{Translation}->{'Involved Persons'} = '相关人员';
    $Self->{Translation}->{'ChangeManager'} = '变更经理';
    $Self->{Translation}->{'User invalid.'} = '用户无效。';
    $Self->{Translation}->{'ChangeBuilder'} = '变更创建人';
    $Self->{Translation}->{'Change Advisory Board'} = '变更咨询委员会';
    $Self->{Translation}->{'CAB Template'} = 'CAB模板';
    $Self->{Translation}->{'Apply Template'} = '应用模板';
    $Self->{Translation}->{'NewTemplate'} = '新建模板';
    $Self->{Translation}->{'Save this CAB as template'} = '保存这个CAB为模板';
    $Self->{Translation}->{'Add to CAB'} = '添加到CAB';
    $Self->{Translation}->{'Invalid User'} = '无效的用户';
    $Self->{Translation}->{'Current CAB'} = '当前CAB';

    # Template: AgentITSMChangeOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '上下文设置';
    $Self->{Translation}->{'Changes per page'} = '每页显示的变更个数';

    # Template: AgentITSMChangeOverviewSmall
    $Self->{Translation}->{'WorkOrderTitle'} = '工作指令标题';
    $Self->{Translation}->{'ChangeTitle'} = '变更标题';
    $Self->{Translation}->{'WorkOrderAgent'} = '工作指令服务人员';
    $Self->{Translation}->{'Workorders'} = '工作指令';
    $Self->{Translation}->{'ChangeState'} = '变更状态';
    $Self->{Translation}->{'WorkOrderState'} = '工作指令状态';
    $Self->{Translation}->{'WorkOrderType'} = '工作指令类型';
    $Self->{Translation}->{'Requested Time'} = '请求时间';
    $Self->{Translation}->{'PlannedStartTime'} = '计划开始时间';
    $Self->{Translation}->{'PlannedEndTime'} = '计划结束时间';
    $Self->{Translation}->{'ActualStartTime'} = '实际开始时间';
    $Self->{Translation}->{'ActualEndTime'} = '实际结束时间';

    # Template: AgentITSMChangeReset
    $Self->{Translation}->{'Do you really want to reset this change?'} = '您真的想要重置这个变更吗？';

    # Template: AgentITSMChangeSearch
    $Self->{Translation}->{'(e.g. 10*5155 or 105658*)'} = '例如：10*5155 or 105658*';
    $Self->{Translation}->{'CABAgent'} = 'CAB服务人员成员';
    $Self->{Translation}->{'e.g.'} = '例如：';
    $Self->{Translation}->{'CABCustomer'} = 'CAB客户成员';
    $Self->{Translation}->{'ITSM Workorder'} = '工作指令';
    $Self->{Translation}->{'Instruction'} = '指令';
    $Self->{Translation}->{'Report'} = '报告';
    $Self->{Translation}->{'Change Category'} = '变更风险类别';
    $Self->{Translation}->{'(before/after)'} = '（之前/之后）';
    $Self->{Translation}->{'(between)'} = '（在...之间）';

    # Template: AgentITSMChangeTemplate
    $Self->{Translation}->{'Save Change as Template'} = '保存变更为模板';
    $Self->{Translation}->{'A template should have a name!'} = '模板应该有一个名称!';
    $Self->{Translation}->{'The template name is required.'} = '模板名称是必需的。';
    $Self->{Translation}->{'Reset States'} = '重置状态';
    $Self->{Translation}->{'Overwrite original template'} = '覆盖原始模板';
    $Self->{Translation}->{'Delete original change'} = '删除原始变更';

    # Template: AgentITSMChangeTimeSlot
    $Self->{Translation}->{'Move Time Slot'} = '移动时间轴';

    # Template: AgentITSMChangeZoom
    $Self->{Translation}->{'Change Information'} = '变更信息';
    $Self->{Translation}->{'PlannedEffort'} = '计划工作量';
    $Self->{Translation}->{'Change Initiator(s)'} = '变更发起人';
    $Self->{Translation}->{'Change Manager'} = '变更经理';
    $Self->{Translation}->{'Change Builder'} = '变更创建人';
    $Self->{Translation}->{'CAB'} = 'CAB';
    $Self->{Translation}->{'Last changed'} = '上次修改于';
    $Self->{Translation}->{'Last changed by'} = '上次修改人';
    $Self->{Translation}->{'Ok'} = '确定';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        '要打开下面描述中的链接，你可能需要在单击链接的同时按住 Ctrl 或 Cmd 或 Shift 键 （取决于您的浏览器和操作系统 ）。';
    $Self->{Translation}->{'Download Attachment'} = '下载附件';

    # Template: AgentITSMTemplateEditCAB
    $Self->{Translation}->{'Edit CAB Template'} = '编辑CAB模板';

    # Template: AgentITSMTemplateEditContent
    $Self->{Translation}->{'This will create a new change from this template, so you can edit and save it.'} =
        '这将从这个模板创建一个新的变更，这样您能够编辑和保存它。';
    $Self->{Translation}->{'The new change will be deleted automatically after it has been saved as template.'} =
        '新变更保存为模板后，将被自动删除。';
    $Self->{Translation}->{'This will create a new workorder from this template, so you can edit and save it.'} =
        '这将从这个模板创建一个新的工作指令，这样您能够编辑和保存它。';
    $Self->{Translation}->{'A temporary change will be created which contains the workorder.'} =
        '将创建一个包含这个工作指令的临时变更。';
    $Self->{Translation}->{'The temporary change and new workorder will be deleted automatically after the workorder has been saved as template.'} =
        '新的工作指令保存为模板后，临时变更和新的工作指令都将被自动删除。';
    $Self->{Translation}->{'Do you want to proceed?'} = '您要继续进行吗？';

    # Template: AgentITSMTemplateOverviewSmall
    $Self->{Translation}->{'TemplateID'} = '模板ID';
    $Self->{Translation}->{'Edit Content'} = '编辑内容';
    $Self->{Translation}->{'CreateBy'} = '创建人';
    $Self->{Translation}->{'CreateTime'} = '创建时间';
    $Self->{Translation}->{'ChangeBy'} = '修改人';
    $Self->{Translation}->{'ChangeTime'} = '修改时间';
    $Self->{Translation}->{'Edit Template Content'} = '编辑模板内容';
    $Self->{Translation}->{'Delete Template'} = '删除模板';

    # Template: AgentITSMWorkOrderAdd
    $Self->{Translation}->{'Add Workorder to'} = '将工作指令添加到';
    $Self->{Translation}->{'Invalid workorder type.'} = '无效的工作指令类型。';
    $Self->{Translation}->{'The planned start time must be before the planned end time!'} = '计划开始时间必须在计划结束时间之前!';
    $Self->{Translation}->{'Invalid format.'} = '无效的格式.';

    # Template: AgentITSMWorkOrderAddFromTemplate
    $Self->{Translation}->{'Select Workorder Template'} = '选择工作指令模板';

    # Template: AgentITSMWorkOrderDelete
    $Self->{Translation}->{'Do you really want to delete this workorder?'} = '您真的想要删除这个工作指令吗?';
    $Self->{Translation}->{'You can not delete this Workorder. It is used in at least one Condition!'} =
        '你无法删除这个工作单。至少有一个条件用到了它!';
    $Self->{Translation}->{'This Workorder is used in the following Condition(s)'} = '此工作指令出现在下列条件中';

    # Template: AgentITSMWorkOrderEdit
    $Self->{Translation}->{'Move following workorders accordingly'} = '相应的移动工作指令';
    $Self->{Translation}->{'If the planned end time of this workorder is changed, the planned start times of all following workorders will be changed accordingly'} =
        '如果该工作指令的计划结束时间改变了，所有后续工作指令的计划开始时间将相应的改变';

    # Template: AgentITSMWorkOrderReport
    $Self->{Translation}->{'The actual start time must be before the actual end time!'} = '实际开始时间必须在实际结束时间之前!';
    $Self->{Translation}->{'The actual start time must be set, when the actual end time is set!'} =
        '设置实际结束时间后必须设置实际开始时间!';

    # Template: AgentITSMWorkOrderTake
    $Self->{Translation}->{'Current Agent'} = '当前的服务人员';
    $Self->{Translation}->{'Do you really want to take this workorder?'} = '您真的想要删除这个工作指令吗?';

    # Template: AgentITSMWorkOrderTemplate
    $Self->{Translation}->{'Save Workorder as Template'} = '保存工作指令为模板';
    $Self->{Translation}->{'Delete original workorder (and surrounding change)'} = '删除原始工作指令（和相关的变更）';

    # Template: AgentITSMWorkOrderZoom
    $Self->{Translation}->{'Workorder Information'} = '工作指令信息';

    # Perl Module: Kernel/Modules/AdminITSMChangeNotification.pm
    $Self->{Translation}->{'Unknown notification %s!'} = '未知的通知%s！';
    $Self->{Translation}->{'There was an error creating the notification.'} = '创建通知时出现一个错误。';

    # Perl Module: Kernel/Modules/AgentITSMChange.pm
    $Self->{Translation}->{'Overview: ITSM Changes'} = '概览：变更';

    # Perl Module: Kernel/Modules/AgentITSMChangeAdd.pm
    $Self->{Translation}->{'Ticket with TicketID %s does not exist!'} = 'TicketID为%s的工单不存在！';
    $Self->{Translation}->{'Please contact the admin.'} = '请联系系统管理员。';
    $Self->{Translation}->{'Missing sysconfig option "ITSMChange::AddChangeLinkTicketTypes"!'} =
        '系统配置选项"ITSMChange::AddChangeLinkTicketTypes"缺失！';
    $Self->{Translation}->{'Was not able to add change!'} = '不能添加变更！';

    # Perl Module: Kernel/Modules/AgentITSMChangeAddFromTemplate.pm
    $Self->{Translation}->{'Was not able to create change from template!'} = '不能从模板创建变更！';

    # Perl Module: Kernel/Modules/AgentITSMChangeCABTemplate.pm
    $Self->{Translation}->{'No ChangeID is given!'} = '没有指定ChangeID！';
    $Self->{Translation}->{'No change found for changeID %s.'} = '没有找到ChangeID为%s的变更。';
    $Self->{Translation}->{'The CAB of change "%s" could not be serialized.'} = '不能序列化变更的CAB"%s"。';
    $Self->{Translation}->{'Could not add the template.'} = '不能添加模板。';

    # Perl Module: Kernel/Modules/AgentITSMChangeCondition.pm
    $Self->{Translation}->{'Change "%s" not found in database!'} = '数据库中没有找到变更"%s"！';
    $Self->{Translation}->{'Could not delete ConditionID %s!'} = '不能删除ConditionID为%s的条件！';

    # Perl Module: Kernel/Modules/AgentITSMChangeConditionEdit.pm
    $Self->{Translation}->{'No %s is given!'} = '没有指定%s！';
    $Self->{Translation}->{'Could not create new condition!'} = '不能创建新的条件！';
    $Self->{Translation}->{'Could not update ConditionID %s!'} = '不能更新ConditionID为%s的条件！';
    $Self->{Translation}->{'Could not update ExpressionID %s!'} = '不能更新ExpressionID为%s的表达式！';
    $Self->{Translation}->{'Could not add new Expression!'} = '不能添加新的表达式！';
    $Self->{Translation}->{'Could not update ActionID %s!'} = '不能更新ActionID为%s的操作！';
    $Self->{Translation}->{'Could not add new Action!'} = '不能添加新的操作！';
    $Self->{Translation}->{'Could not delete ExpressionID %s!'} = '不能删除ExpressionID为%s的表达式！';
    $Self->{Translation}->{'Could not delete ActionID %s!'} = '不能删除ActionID为%s的操作！';
    $Self->{Translation}->{'Error: Unknown field type "%s"!'} = '错误：未知的字段类型"%s"！';
    $Self->{Translation}->{'ConditionID %s does not belong to the given ChangeID %s!'} = 'ExpressionID为%s的表达式不属于指定的变更ID %s！';

    # Perl Module: Kernel/Modules/AgentITSMChangeDelete.pm
    $Self->{Translation}->{'Change "%s" does not have an allowed change state to be deleted!'} =
        '变更"%s"没有在一个允许删除的变更状态！';
    $Self->{Translation}->{'Was not able to delete the changeID %s!'} = '不能删除变更ID为%s的变更！';

    # Perl Module: Kernel/Modules/AgentITSMChangeEdit.pm
    $Self->{Translation}->{'Was not able to update Change!'} = '不能更新变更！';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no ChangeID is given!'} = '不能显示历史，因为没有指定变更ID！';
    $Self->{Translation}->{'Change "%s" not found in the database!'} = '数据库中没有找到变更"%s"！';
    $Self->{Translation}->{'Unknown type "%s" encountered!'} = '遇到了未知的类型"%s"！';
    $Self->{Translation}->{'Change History'} = '变更历史';

    # Perl Module: Kernel/Modules/AgentITSMChangeHistoryZoom.pm
    $Self->{Translation}->{'Can\'t show history zoom, no HistoryEntryID is given!'} = '不能显示历史详情，因为没有指定HistoryEntryID！';
    $Self->{Translation}->{'HistoryEntry "%s" not found in database!'} = '数据库中没有找到历史条目 "%s"！';

    # Perl Module: Kernel/Modules/AgentITSMChangeInvolvedPersons.pm
    $Self->{Translation}->{'Was not able to update Change CAB for Change %s!'} = '不能更新变更%s的变更CAB！';
    $Self->{Translation}->{'Was not able to update Change %s!'} = '不能更新变更%s！';

    # Perl Module: Kernel/Modules/AgentITSMChangeManager.pm
    $Self->{Translation}->{'Overview: ChangeManager'} = '概览：变更经理';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyCAB.pm
    $Self->{Translation}->{'Overview: My CAB'} = '概览：我的CAB';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyChanges.pm
    $Self->{Translation}->{'Overview: My Changes'} = '概览：我的变更';

    # Perl Module: Kernel/Modules/AgentITSMChangeMyWorkOrders.pm
    $Self->{Translation}->{'Overview: My Workorders'} = '概览：我的工作指定';

    # Perl Module: Kernel/Modules/AgentITSMChangePIR.pm
    $Self->{Translation}->{'Overview: PIR'} = '概览：PIR（实施后审查）';

    # Perl Module: Kernel/Modules/AgentITSMChangePSA.pm
    $Self->{Translation}->{'Overview: PSA'} = '概览：PSA（计划服务可用性）';

    # Perl Module: Kernel/Modules/AgentITSMChangePrint.pm
    $Self->{Translation}->{'WorkOrder "%s" not found in database!'} = '数据库中没有找到工作指令"%s"！';
    $Self->{Translation}->{'Can\'t create output, as the workorder is not attached to a change!'} =
        '不能创建输出，因为这个工作指令没有附加到一个变更上！';
    $Self->{Translation}->{'Can\'t create output, as no ChangeID is given!'} = '不能创建输出，因为没有指定变更ID！';
    $Self->{Translation}->{'unknown change title'} = '未知的变更标题';
    $Self->{Translation}->{'unknown workorder title'} = '未知的工作指令标题';
    $Self->{Translation}->{'ITSM Workorder Overview (%s)'} = '工作指令概览（%s）';

    # Perl Module: Kernel/Modules/AgentITSMChangeReset.pm
    $Self->{Translation}->{'Was not able to reset WorkOrder %s of Change %s!'} = '不能重置工作指令%s（属于变更%s）！';
    $Self->{Translation}->{'Was not able to reset Change %s!'} = '不能重置变更%s！';

    # Perl Module: Kernel/Modules/AgentITSMChangeSchedule.pm
    $Self->{Translation}->{'Overview: Change Schedule'} = '概览：变更计划';

    # Perl Module: Kernel/Modules/AgentITSMChangeSearch.pm
    $Self->{Translation}->{'Change Search'} = '变更搜索';
    $Self->{Translation}->{'WorkOrders'} = '工作指令';
    $Self->{Translation}->{'Change Search Result'} = '变更搜索结果';
    $Self->{Translation}->{'Change Number'} = '变更编号';
    $Self->{Translation}->{'Change Title'} = '变更标题';
    $Self->{Translation}->{'Work Order Title'} = '工作指令标题';
    $Self->{Translation}->{'CAB Agent'} = 'CAB服务人员成员';
    $Self->{Translation}->{'CAB Customer'} = 'CAB客户成员';
    $Self->{Translation}->{'Change Description'} = '变更描述';
    $Self->{Translation}->{'Change Justification'} = '变更理由';
    $Self->{Translation}->{'WorkOrder Instruction'} = '工作指令说明';
    $Self->{Translation}->{'WorkOrder Report'} = '工作指令报告';
    $Self->{Translation}->{'Change Priority'} = '变更优先级';
    $Self->{Translation}->{'Change Impact'} = '变更影响';
    $Self->{Translation}->{'Change State'} = '变更状态';
    $Self->{Translation}->{'Created By'} = '创建人';
    $Self->{Translation}->{'WorkOrder State'} = '工作指令状态';
    $Self->{Translation}->{'WorkOrder Type'} = '工作指令类型';
    $Self->{Translation}->{'WorkOrder Agent'} = '工作指令服务人员';
    $Self->{Translation}->{'Planned Start Time'} = '计划的开始时间';
    $Self->{Translation}->{'Planned End Time'} = '计划结束时间';
    $Self->{Translation}->{'Actual Start Time'} = '实际开始时间';
    $Self->{Translation}->{'Actual End Time'} = '实际结束时间';
    $Self->{Translation}->{'Change Time'} = '修改时间';
    $Self->{Translation}->{'before'} = '在...之前';

    # Perl Module: Kernel/Modules/AgentITSMChangeTemplate.pm
    $Self->{Translation}->{'The change "%s" could not be serialized.'} = '不能序列化变更"%s"。';
    $Self->{Translation}->{'Could not update the template "%s".'} = '不能更新模板"%s"。';
    $Self->{Translation}->{'Could not delete change "%s".'} = '不能删除变更"%s"。';

    # Perl Module: Kernel/Modules/AgentITSMChangeTimeSlot.pm
    $Self->{Translation}->{'The change can\'t be moved, as it has no workorders.'} = '不能移动变更，因为它没有工作指令。';
    $Self->{Translation}->{'Add a workorder first.'} = '首先添加一条工作指令。';
    $Self->{Translation}->{'Can\'t move a change which already has started!'} = '不能移动一个已经开始的变更！';
    $Self->{Translation}->{'Please move the individual workorders instead.'} = '请用移动单独的工作指令来代替。';
    $Self->{Translation}->{'The current %s could not be determined.'} = '不能确定当前的%s。';
    $Self->{Translation}->{'The %s of all workorders has to be defined.'} = '%s的所有工作指令必须被定义好。';
    $Self->{Translation}->{'Was not able to move time slot for workorder #%s!'} = '不能移动工作指令#%s的时间轴！';

    # Perl Module: Kernel/Modules/AgentITSMTemplateDelete.pm
    $Self->{Translation}->{'You need %s permission!'} = '你需要%s权限！';
    $Self->{Translation}->{'No TemplateID is given!'} = '没有指定模板ID！';
    $Self->{Translation}->{'Template "%s" not found in database!'} = '数据库中没有找到模板"%s"！';
    $Self->{Translation}->{'Was not able to delete the template %s!'} = '不能删除模板%s！';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEdit.pm
    $Self->{Translation}->{'Was not able to update Template %s!'} = '不能更新模板%s！';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEditCAB.pm
    $Self->{Translation}->{'Was not able to update Template "%s"!'} = '不能更新模板"%s"！';

    # Perl Module: Kernel/Modules/AgentITSMTemplateEditContent.pm
    $Self->{Translation}->{'Was not able to create change!'} = '不能创建变更！';
    $Self->{Translation}->{'Was not able to create workorder from template!'} = '不能从模板创建工作指令！';

    # Perl Module: Kernel/Modules/AgentITSMTemplateOverview.pm
    $Self->{Translation}->{'Overview: Template'} = '概览：模板';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderAdd.pm
    $Self->{Translation}->{'You need %s permissions on the change!'} = '你需要有变更的%s权限！';
    $Self->{Translation}->{'Was not able to add workorder!'} = '不能添加工作指令！';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderAgent.pm
    $Self->{Translation}->{'No WorkOrderID is given!'} = '没有指定工作指令ID！';
    $Self->{Translation}->{'Was not able to set the workorder agent of the workorder "%s" to empty!'} =
        '不能设置工作指令"%s"的服务人员为空！';
    $Self->{Translation}->{'Was not able to update the workorder "%s"!'} = '不能更新工作指令"%s"！';
    $Self->{Translation}->{'Could not find Change for WorkOrder %s!'} = '找不到工作指令 %s的变更！';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderDelete.pm
    $Self->{Translation}->{'Was not able to delete the workorder %s!'} = '不能删除工作指令%s！';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderEdit.pm
    $Self->{Translation}->{'Was not able to update WorkOrder %s!'} = '不能更新工作指令%s！';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no WorkOrderID is given!'} = '不能显示历史，因为没有指定工作指令ID！';
    $Self->{Translation}->{'WorkOrder "%s" not found in the database!'} = '数据库中没有找到工作指令"%s"！';
    $Self->{Translation}->{'WorkOrderHistory::'} = '工作指令历史::';
    $Self->{Translation}->{'WorkOrder History'} = '工作指令历史';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderHistoryZoom.pm
    $Self->{Translation}->{'History entry "%s" not found in the database!'} = '数据库中没有找到历史条目"%s"！';
    $Self->{Translation}->{'WorkOrder History Zoom'} = '工作指令历史详情';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderTake.pm
    $Self->{Translation}->{'Was not able to take the workorder %s!'} = '不能执行工作指令 %s！';

    # Perl Module: Kernel/Modules/AgentITSMWorkOrderTemplate.pm
    $Self->{Translation}->{'The workorder "%s" could not be serialized.'} = '不能序列化工作指令"%s"。';

    # Perl Module: Kernel/Output/HTML/Layout/ITSMChange.pm
    $Self->{Translation}->{'Need config option %s!'} = '需要配置%s选项！';
    $Self->{Translation}->{'Config option %s needs to be a HASH ref!'} = '配置选项%s需要是一个哈希引用！';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '没有找到视图“%s”的配置选项！';
    $Self->{Translation}->{'Title: %s | Type: %s'} = '标题：%s | 类型：%s';

    # Perl Module: Kernel/Output/HTML/ToolBar/MyWorkOrders.pm
    $Self->{Translation}->{'My Work Orders'} = '我的工作指令';

    # SysConfig
    $Self->{Translation}->{'A list of the agents who have permission to take workorders. Key is a login name. Content is 0 or 1.'} =
        '有权限接手工作指令的服务人员列表。“键”是登录名，“值”是0或1。';
    $Self->{Translation}->{'A list of workorder states, at which the ActualStartTime of a workorder will be set if it was empty at this point.'} =
        '工作指令状态列表，工作指令的ActualStartTime（实际开始时间）将被设置（如果这时候还没有设置的话）。';
    $Self->{Translation}->{'Add Workorder (from Template)'} = '';
    $Self->{Translation}->{'Add a change from template.'} = '从模板添加一个变更。';
    $Self->{Translation}->{'Add a change.'} = '添加一个变更。';
    $Self->{Translation}->{'Add a workorder (from template) to the change.'} = '';
    $Self->{Translation}->{'Add a workorder to the change.'} = '';
    $Self->{Translation}->{'Admin of the CIP matrix.'} = '管理CIP矩阵。';
    $Self->{Translation}->{'Admin of the state machine.'} = '管理状态模式转换。';
    $Self->{Translation}->{'Agent interface notification module to see the number of change advisory boards.'} =
        '查看CAB数量的服务人员界面通知模块。';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes managed by the user.'} =
        '查看变更经理管理的变更数的服务人员界面通知模块。';
    $Self->{Translation}->{'Agent interface notification module to see the number of changes.'} =
        '查看变更数量的服务人员界面通知模块。';
    $Self->{Translation}->{'Agent interface notification module to see the number of workorders.'} =
        '查看工作指令数量的服务人员界面通知模块。';
    $Self->{Translation}->{'CAB Member Search'} = 'CAB成员搜索';
    $Self->{Translation}->{'Cache time in minutes for the change management toolbars. Default: 3 hours (180 minutes).'} =
        '变更管理工具栏的缓存时间（单位：分钟）。默认：3小时（180分钟）。';
    $Self->{Translation}->{'Cache time in minutes for the change management. Default: 5 days (7200 minutes).'} =
        '变更管理的缓存时间（单位：分钟）。默认：5天（7200分钟）。';
    $Self->{Translation}->{'Change CAB Templates'} = '变更CAB模板';
    $Self->{Translation}->{'Change History.'} = '变更历史';
    $Self->{Translation}->{'Change Involved Persons.'} = '变更涉及的人员。';
    $Self->{Translation}->{'Change Overview "Small" Limit'} = '变更概览简洁模式限制';
    $Self->{Translation}->{'Change Overview.'} = '变更概览';
    $Self->{Translation}->{'Change Print.'} = '打印变更。';
    $Self->{Translation}->{'Change Schedule.'} = '变更计划表。';
    $Self->{Translation}->{'Change Zoom.'} = '变更详情。';
    $Self->{Translation}->{'Change and Workorder Templates'} = '';
    $Self->{Translation}->{'Change and workorder templates edited by this user.'} = '';
    $Self->{Translation}->{'Change area.'} = '变更区域。';
    $Self->{Translation}->{'Change involved persons of the change.'} = '';
    $Self->{Translation}->{'Change limit per page for Change Overview "Small".'} = '';
    $Self->{Translation}->{'Change search backend router of the agent interface.'} = '服务人员界面变更搜索后端路由';
    $Self->{Translation}->{'Condition Overview'} = '条件概览';
    $Self->{Translation}->{'Configure which screen should be shown after a new workorder has been created.'} =
        '配置创建新工作指令后显示的界面。';
    $Self->{Translation}->{'Configures how often the notifications are sent when planned the start time or other time values have been reached/passed.'} =
        '配置计划开始时间或其它时间到达/过去时发送通知的频率。';
    $Self->{Translation}->{'Create Change (from Template)'} = '';
    $Self->{Translation}->{'Create a change (from template) from this ticket.'} = '';
    $Self->{Translation}->{'Create a change from this ticket.'} = '';
    $Self->{Translation}->{'Create and manage ITSM Change Management notifications.'} = '创建和管理ITSM变更管理通知。';
    $Self->{Translation}->{'Default type for a workorder. This entry must exist in general catalog class \'ITSM::ChangeManagement::WorkOrder::Type\'.'} =
        '工作指令的默认类型。这个条目必须在目录类\'ITSM::ChangeManagement::WorkOrder::Type\'中存在。';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '定义链接对象小部件(LinkObject::ViewMode = \"complex\")设置按钮中的操作。请注意，这些操作必须已经在以下JS和CSS文件中注册：Core.AllocationList.css、Core.UI.AllocationList.js、 Core.UI.Table.Sort.js、Core.Agent.TableFilters.js和Core.Agent.LinkObject.js。';
    $Self->{Translation}->{'Define the signals for each workorder state.'} = '定义每个工作指令状态的标志信号。';
    $Self->{Translation}->{'Define which columns are shown in the linked Changes widget (LinkObject::ViewMode = "complex"). Note: Only Change attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '定义链接的变更小部件(LinkObject::ViewMode = "complex")要显示的列。注意：只有变更属性才能作为默认列，可用的设置值为：0 = 禁用，1 = 可用， 2 = 默认启用。';
    $Self->{Translation}->{'Define which columns are shown in the linked Workorder widget (LinkObject::ViewMode = "complex"). Note: Only Workorder attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '定义链接的工作指令小部件(LinkObject::ViewMode = "complex")要显示的列。注意：只有工作指令属性才能作为默认列，可用的设置值为：0 = 禁用，1 = 可用， 2 = 默认启用。';
    $Self->{Translation}->{'Defines an overview module to show the small view of a change list.'} =
        '定义一个概览模块，以显示变更列表的简洁视图。';
    $Self->{Translation}->{'Defines an overview module to show the small view of a template list.'} =
        '定义一个概览模块，以显示模板列表的简洁视图。';
    $Self->{Translation}->{'Defines if it will be possible to print the accounted time.'} = '定义是否可以打印记帐时间。';
    $Self->{Translation}->{'Defines if it will be possible to print the planned effort.'} = '定义是否可以打印计划工作量。';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) change end states should be allowed if a change is in a locked state.'} =
        '定义是否允许一个锁定状态的变更可达到结束状态（在状态模式转换中定义）。';
    $Self->{Translation}->{'Defines if reachable (as defined by the state machine) workorder end states should be allowed if a workorder is in a locked state.'} =
        '定义是否允许一个锁定状态的工作指令可达到结束状态（在状态模式转换中定义）。';
    $Self->{Translation}->{'Defines if the accounted time should be shown.'} = '定义是否显示记帐时间。';
    $Self->{Translation}->{'Defines if the actual start and end times should be set.'} = '定义（工作指令报告中）是否要设置实际开始/结束时间。';
    $Self->{Translation}->{'Defines if the change search and the workorder search functions could use the mirror DB.'} =
        '定义变更搜索和工作指令搜索功能是否能够使用镜像数据库。';
    $Self->{Translation}->{'Defines if the change state can be set in AgentITSMChangeEdit.'} =
        '定义在编辑变更时是否能够设置变更状态。';
    $Self->{Translation}->{'Defines if the planned effort should be shown.'} = '定义是否显示计划工作量。';
    $Self->{Translation}->{'Defines if the requested date should be print by customer.'} = '定义客户是否可以打印请求日期。';
    $Self->{Translation}->{'Defines if the requested date should be searched by customer.'} =
        '定义客户是否可以搜索请求日期。';
    $Self->{Translation}->{'Defines if the requested date should be set by customer.'} = '定义客户是否可以设置请求日期。';
    $Self->{Translation}->{'Defines if the requested date should be shown by customer.'} = '定义客户是否可以显示请求日期。';
    $Self->{Translation}->{'Defines if the workorder state should be shown.'} = '定义是否显示工作指令状态。';
    $Self->{Translation}->{'Defines if the workorder title should be shown.'} = '定义是否显示工作指令标题。';
    $Self->{Translation}->{'Defines shown graph attributes.'} = '定义（变更详情窗口工作指令图）显示的图形的属性。';
    $Self->{Translation}->{'Defines that only changes containing Workorders linked with services, which the customer user has permission to use will be shown. Any other changes will not be displayed.'} =
        '定义仅显示变更中包含的工作指令中有 到客户联系人有权限使用的服务 的链接 的变更，任何其它变更都不会显示。';
    $Self->{Translation}->{'Defines the change states that will be allowed to delete.'} = '定义允许删除变更的变更状态。';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change PSA overview.'} =
        '定义\'变更PSA\'概览中能用于过滤器的变更状态。';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the Change Schedule overview.'} =
        '定义\'变更计划\'概览中能用于过滤器的变更状态。';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyCAB overview.'} =
        '定义\'我的CAB\'概览中能用于过滤器的变更状态。';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the MyChanges overview.'} =
        '定义\'我的变更\'概览中能用于过滤器的变更状态。';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change manager overview.'} =
        '定义\'变更经理\'概览中能用于过滤器的变更状态。';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the change overview.'} =
        '定义\'变更\'概览中能用于过滤器的变更状态。';
    $Self->{Translation}->{'Defines the change states that will be used as filters in the customer change schedule overview.'} =
        '定义客户\'变更计划\'概览中能用于过滤器的变更状态。';
    $Self->{Translation}->{'Defines the default change title for a dummy change which is needed to edit a workorder template.'} =
        '定义编辑工作指令时创建的临时变更的默认标题。';
    $Self->{Translation}->{'Defines the default sort criteria in the change PSA overview.'} =
        '定义\'变更PSA\'概览中默认的排序条件。';
    $Self->{Translation}->{'Defines the default sort criteria in the change manager overview.'} =
        '定义\'变更经理\'概览中默认的排序条件。';
    $Self->{Translation}->{'Defines the default sort criteria in the change overview.'} = '定义\'变更\'概览中默认的排序条件。';
    $Self->{Translation}->{'Defines the default sort criteria in the change schedule overview.'} =
        '定义\'变更计划\'概览中默认的排序条件。';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyCAB overview.'} =
        '定义\'我的CAB\'概览中默认的变更排序条件。';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyChanges overview.'} =
        '定义\'我的变更\'概览中默认的变更排序条件。';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the MyWorkorders overview.'} =
        '定义\'我的工作指令\'概览中默认的变更排序条件。';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the PIR overview.'} =
        '定义\'PIR（实施后审查）\'概览中默认的变更排序条件。';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the customer change schedule overview.'} =
        '定义客户\'变更计划\'概览中默认的变更排序条件。';
    $Self->{Translation}->{'Defines the default sort criteria of the changes in the template overview.'} =
        '定义\'模板\'概览中默认的变更排序条件。';
    $Self->{Translation}->{'Defines the default sort order in the MyCAB overview.'} = '定义\'我的CAB\'概览中默认的排序顺序。';
    $Self->{Translation}->{'Defines the default sort order in the MyChanges overview.'} = '定义\'我的变更\'概览中默认的排序顺序。';
    $Self->{Translation}->{'Defines the default sort order in the MyWorkorders overview.'} =
        '定义\'我的工作指令\'概览中默认的排序顺序。';
    $Self->{Translation}->{'Defines the default sort order in the PIR overview.'} = '定义\'PIR（实施后审查）\'概览中默认的排序顺序。';
    $Self->{Translation}->{'Defines the default sort order in the change PSA overview.'} = '定义\'变更PSA\'概览中默认的排序顺序。';
    $Self->{Translation}->{'Defines the default sort order in the change manager overview.'} =
        '定义\'变更经理\'概览中默认的排序顺序。';
    $Self->{Translation}->{'Defines the default sort order in the change overview.'} = '定义变更概览中默认的排序顺序。';
    $Self->{Translation}->{'Defines the default sort order in the change schedule overview.'} =
        '定义\'变更计划\'概览中默认的排序顺序。';
    $Self->{Translation}->{'Defines the default sort order in the customer change schedule overview.'} =
        '定义客户界面\'变更计划\'概览中默认的排序顺序。';
    $Self->{Translation}->{'Defines the default sort order in the template overview.'} = '定义模板概览中默认的排序顺序。';
    $Self->{Translation}->{'Defines the default value for the category of a change.'} = '定义一个变更风险类别的默认值。';
    $Self->{Translation}->{'Defines the default value for the impact of a change.'} = '定义一个变更影响的默认值。';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for change attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        '定义变更属性比较值字段（用于AgentITSMChangeConditionEdit条件编辑）的类型，有效值是：Selection（选择）、Text（文本）和Date（日期）。 如果没有定义类型，字段不会被显示出来。';
    $Self->{Translation}->{'Defines the field type of CompareValue fields for workorder attributes used in AgentITSMChangeConditionEdit. Valid values are Selection, Text and Date. If a type is not defined, the field will not be shown.'} =
        '定义工作指令属性比较值字段（用于AgentITSMChangeConditionEdit变更条件编辑）的类型，有效值是：Selection（选择）、Text（文本）和Date（日期）。 如果没有定义类型，字段不会被显示出来。';
    $Self->{Translation}->{'Defines the object attributes that are selectable for change objects in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的变更对象的属性。';
    $Self->{Translation}->{'Defines the object attributes that are selectable for workorder objects in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的工作指令对象的属性。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute AccountedTime in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 AccountedTime（记帐时间）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualEndTime in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 ActualEndTime（实际结束时间）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ActualStartTime in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 ActualStartTime（实际开始时间）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute CategoryID in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 CategoryID（风险类别ID）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeBuilderID in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 ChangeBuilderID（变更创建人ID）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeManagerID in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 ChangeManagerID（变更经理ID）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeStateID in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 ChangeStateID（变更状态ID）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ChangeTitle in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 ChangeTitle（变更标题）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute DynamicField in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 DynamicField（动态字段）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute ImpactID in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 ImpactID（影响ID）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEffort in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 PlannedEffort（计划工作量）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedEndTime in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 PlannedEndTime（计划结束时间）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PlannedStartTime in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 PlannedStartTime（计划开始时间）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute PriorityID in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 PriorityID（优先级ID）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute RequestedTime in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 RequestedTime（请求时间）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderAgentID in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 WorkOrderAgentID（工作指令服务人员ID）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderNumber in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 WorkOrderNumber（工作指令编号）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderStateID in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 WorkOrderStateID（工作指令状态ID）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTitle in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 WorkOrderTitle（工作指令标题）运算符。';
    $Self->{Translation}->{'Defines the operators that are selectable for the attribute WorkOrderTypeID in AgentITSMChangeConditionEdit.'} =
        '定义在AgentITSMChangeConditionEdit（变更条件编辑）时可选择的 WorkOrderTypeID（工作指令类型ID）运算符。';
    $Self->{Translation}->{'Defines the period (in years), in which start and end times can be selected.'} =
        '定义能够选择开始时间和结束时间的时间段（单位：年）。';
    $Self->{Translation}->{'Defines the shown attributes of a workorder in the tooltip of the workorder graph in the change zoom. To show workorder dynamic fields in the tooltip, they must be specified like DynamicField_WorkOrderFieldName1, DynamicField_WorkOrderFieldName2, etc.'} =
        '在变更详情窗口显示在工作指令图提示文本的属性。要在提示文本中显示工作指令动态字段，他们必须按如下格式指定，如DynamicField_WorkOrderFieldName1、DynamicField_WorkOrderFieldName2等等。';
    $Self->{Translation}->{'Defines the shown columns in the Change PSA overview. This option has no effect on the position of the column.'} =
        '定义在\'变更PSA\'概览中显示的字段，这个选项不会影响字段的显示位置。';
    $Self->{Translation}->{'Defines the shown columns in the Change Schedule overview. This option has no effect on the position of the column.'} =
        '定义在\'变更计划\'概览中显示的字段，这个选项不会影响字段的显示位置。';
    $Self->{Translation}->{'Defines the shown columns in the MyCAB overview. This option has no effect on the position of the column.'} =
        '定义在\'我的CAB\'概览中显示的字段，这个选项不会影响字段的显示位置。';
    $Self->{Translation}->{'Defines the shown columns in the MyChanges overview. This option has no effect on the position of the column.'} =
        '定义在\'我的变更\'概览中显示的字段，这个选项不会影响字段的显示位置。';
    $Self->{Translation}->{'Defines the shown columns in the MyWorkorders overview. This option has no effect on the position of the column.'} =
        '定义在\'我的工作指令\'概览中显示的字段，这个选项不会影响字段的显示位置。';
    $Self->{Translation}->{'Defines the shown columns in the PIR overview. This option has no effect on the position of the column.'} =
        '定义在\'PIR（实施后审查）\'概览中显示的字段，这个选项不会影响字段的显示位置。';
    $Self->{Translation}->{'Defines the shown columns in the change manager overview. This option has no effect on the position of the column.'} =
        '定义在\'变更经理\'概览中显示的字段，这个选项不会影响字段的显示位置。';
    $Self->{Translation}->{'Defines the shown columns in the change overview. This option has no effect on the position of the column.'} =
        '定义在\'变更\'概览中显示的字段，这个选项不会影响字段的显示位置。';
    $Self->{Translation}->{'Defines the shown columns in the change search. This option has no effect on the position of the column.'} =
        '定义在变更搜索结果中显示的字段，这个选项不会影响字段的显示位置。';
    $Self->{Translation}->{'Defines the shown columns in the customer change schedule overview. This option has no effect on the position of the column.'} =
        '定义在客户\'变更计划\'概览中显示的字段，这个选项不会影响字段的显示位置。';
    $Self->{Translation}->{'Defines the shown columns in the template overview. This option has no effect on the position of the column.'} =
        '定义在模板概览中显示的字段，这个选项不会影响字段的显示位置。';
    $Self->{Translation}->{'Defines the signals for each ITSMChange state.'} = '定义变更状态的标志信号。';
    $Self->{Translation}->{'Defines the template types that will be used as filters in the template overview.'} =
        '定义在模板概览中用作过滤器的模板类型。';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the MyWorkorders overview.'} =
        '定义在\'我的工作指令\'概览中用作过滤器的工作指令状态。';
    $Self->{Translation}->{'Defines the workorder states that will be used as filters in the PIR overview.'} =
        '定义在\'PIR（实施后审查）\'概览中用作过滤器的工作指令状态。';
    $Self->{Translation}->{'Defines the workorder types that will be used to show the PIR overview.'} =
        '定义在\'PIR（实施后审查）\'概览中用作过滤器的工作指令类型。';
    $Self->{Translation}->{'Defines whether notifications should be sent.'} = '定义是否发送通知。';
    $Self->{Translation}->{'Delete a change.'} = '删除一个变更。';
    $Self->{Translation}->{'Delete the change.'} = '';
    $Self->{Translation}->{'Delete the workorder.'} = '';
    $Self->{Translation}->{'Details of a change history entry.'} = '一个变更历史条目的详细信息。';
    $Self->{Translation}->{'Determines if an agent can exchange the X-axis of a stat if he generates one.'} =
        '确定服务人员能否交换他生成的统计的X轴。';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes done for config item classes.'} =
        '确定通用统计模块能否生成配置项类所做的变更统计。';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding change state updates within a timeperiod.'} =
        '确定通用统计模块能否生成一段时间内变更关于变更状态更新的统计。';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes regarding the relation between changes and incident tickets.'} =
        '确定通用统计模块能否生成变更关于变更和故障工单之间的关系的统计。';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about changes.'} =
        '确定通用统计模块能否生成关于变更的统计。';
    $Self->{Translation}->{'Determines if the common stats module may generate stats about the number of Rfc tickets a requester created.'} =
        '确定通用统计模块能否生成一个请求者创建的RFC（变更请求）的数量的统计。';
    $Self->{Translation}->{'Dynamic fields (for changes and workorders) shown in the change print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '在服务人员界面变更打印窗口是否显示动态字段。可能的设置：0 - 禁用， 1 = 启用。';
    $Self->{Translation}->{'Dynamic fields shown in the change add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '在服务人员界面添加变更窗口是否显示动态字段。可能的设置：0 - 禁用， 1 = 启用，2 = 启用且必需。';
    $Self->{Translation}->{'Dynamic fields shown in the change edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '在服务人员界面编辑变更窗口是否显示动态字段。可能的设置：0 - 禁用， 1 = 启用，2 = 启用且必需。';
    $Self->{Translation}->{'Dynamic fields shown in the change search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '在服务人员界面搜索变更窗口是否显示动态字段。可能的设置：0 - 禁用， 1 = 启用。';
    $Self->{Translation}->{'Dynamic fields shown in the change zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '在服务人员界面变更详情窗口是否显示动态字段。可能的设置：0 - 禁用， 1 = 启用。';
    $Self->{Translation}->{'Dynamic fields shown in the workorder add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '在服务人员界面添加工作指令窗口是否显示动态字段。可能的设置：0 - 禁用， 1 = 启用，2 = 启用且必需。';
    $Self->{Translation}->{'Dynamic fields shown in the workorder edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '在服务人员界面编辑工作指令窗口是否显示动态字段。可能的设置：0 - 禁用， 1 = 启用，2 = 启用且必需。';
    $Self->{Translation}->{'Dynamic fields shown in the workorder report screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '在服务人员界面工作指令报告窗口是否显示动态字段。可能的设置：0 - 禁用， 1 = 启用，2 = 启用且必需。';
    $Self->{Translation}->{'Dynamic fields shown in the workorder zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '在服务人员界面工作指令详情窗口是否显示动态字段。可能的设置：0 - 禁用， 1 = 启用。';
    $Self->{Translation}->{'DynamicField event module to handle the update of conditions if dynamic fields are added, updated or deleted.'} =
        '处理动态字段更新条件（添加、更新或删除）的动态字段事件模块。';
    $Self->{Translation}->{'Edit a change.'} = '编辑一个变更。';
    $Self->{Translation}->{'Edit the change.'} = '';
    $Self->{Translation}->{'Edit the conditions of the change.'} = '';
    $Self->{Translation}->{'Edit the workorder.'} = '';
    $Self->{Translation}->{'Forward schedule of changes. Overview over approved changes.'} =
        '转发变更的计划表。已批准变更的概览。';
    $Self->{Translation}->{'History Zoom'} = '历史详情';
    $Self->{Translation}->{'ITSM Change CAB Templates.'} = '变更CAB模板。';
    $Self->{Translation}->{'ITSM Change Condition Edit.'} = '变更条件编辑。';
    $Self->{Translation}->{'ITSM Change Condition Overview.'} = '变更条件概览。';
    $Self->{Translation}->{'ITSM Change Management Notifications'} = '变更管理通知';
    $Self->{Translation}->{'ITSM Change Manager Overview.'} = '变更经理概览。';
    $Self->{Translation}->{'ITSM Change PIR Overview.'} = '变更PIR（实施后审查）概览。';
    $Self->{Translation}->{'ITSM Change notification rules'} = '变更通知规则';
    $Self->{Translation}->{'ITSM MyCAB Overview.'} = '我的CAB概览';
    $Self->{Translation}->{'ITSM MyChanges Overview.'} = '我的变更概览。';
    $Self->{Translation}->{'ITSM MyWorkorders Overview.'} = '我的工作指令概览。';
    $Self->{Translation}->{'ITSM Template Delete.'} = '删除模板。';
    $Self->{Translation}->{'ITSM Template Edit CAB.'} = '编辑模板CAB。';
    $Self->{Translation}->{'ITSM Template Edit Content.'} = '编辑模板内容。';
    $Self->{Translation}->{'ITSM Template Edit.'} = '编辑模板。';
    $Self->{Translation}->{'ITSM Template Overview.'} = '模板概览。';
    $Self->{Translation}->{'ITSM event module that cleans up conditions.'} = '清理变更条件的ITSM事件模块。';
    $Self->{Translation}->{'ITSM event module that deletes the cache for a toolbar.'} = '删除变更工具栏缓存的ITSM事件模块。';
    $Self->{Translation}->{'ITSM event module that deletes the history of changes.'} = '删除变更历史的ITSM事件模块。';
    $Self->{Translation}->{'ITSM event module that matches conditions and executes actions.'} =
        '匹配条件并执行操作的ITSM事件模块。';
    $Self->{Translation}->{'ITSM event module that sends notifications.'} = '发送通知的ITSM事件模块。';
    $Self->{Translation}->{'ITSM event module that updates the history of changes.'} = '更新变更历史的ITSM事件模块。';
    $Self->{Translation}->{'ITSM event module that updates the history of conditions.'} = '更新条件历史的ITSM事件模块。';
    $Self->{Translation}->{'ITSM event module that updates the history of workorders.'} = '更新工作指令历史的ITSM事件模块。';
    $Self->{Translation}->{'ITSM event module to recalculate the workorder numbers.'} = '重新计算工作指令编号的ITSM事件模块。';
    $Self->{Translation}->{'ITSM event module to set the actual start and end times of workorders.'} =
        '设置工作指令实际开始/结束时间的ITSM事件模块。';
    $Self->{Translation}->{'If frequency is \'regularly\', you can configure how often the notifications are sent (every X hours).'} =
        '如果频率设置为“定期”，你可以设置发送通知的频率间隔（每X小时）。';
    $Self->{Translation}->{'Link another object to the change.'} = '';
    $Self->{Translation}->{'Link another object to the workorder.'} = '';
    $Self->{Translation}->{'Logfile for the ITSM change counter. This file is used for creating the change numbers.'} =
        'ITSM变更计数器的日志文件，这个文件在创建变更编号时会用到。';
    $Self->{Translation}->{'Lookup of CAB members for autocompletion.'} = '查找CAB成员，用于自动补齐功能。';
    $Self->{Translation}->{'Lookup of agents, used for autocompletion.'} = '查找服务人员，用于自动补齐功能。';
    $Self->{Translation}->{'Module to check if WorkOrderAdd or WorkOrderAddFromTemplate should be permitted.'} =
        '检查是否允许WorkOrderAdd（添加工作指令）或WorkOrderAddFromTemplate（从模板添加工作指令）的模块。';
    $Self->{Translation}->{'Module to check the CAB members.'} = '检查CAB成员的模块。';
    $Self->{Translation}->{'Module to check the agent.'} = '检查变更服务人员的模块。';
    $Self->{Translation}->{'Module to check the change builder.'} = '检查变更创建人的模块。';
    $Self->{Translation}->{'Module to check the change manager.'} = '检查变更经理的模块。';
    $Self->{Translation}->{'Module to check the workorder agent.'} = '检查工作指令服务人员的模块。';
    $Self->{Translation}->{'Module to check whether no workorder agent is set.'} = '检查是否没有设置工作指令服务人员的模块。';
    $Self->{Translation}->{'Module to check whether the agent is contained in the configured list.'} =
        '检查服务人员是否包含在在配置列表中的模块。';
    $Self->{Translation}->{'Module to show a link to create a change from this ticket. The ticket will be automatically linked with the new change.'} =
        '显示一个链接以从工单创建一个变更的模块。工单将自动链接到新的变更。';
    $Self->{Translation}->{'Move Time Slot.'} = '移动时间轴。';
    $Self->{Translation}->{'Move all workorders in time.'} = '';
    $Self->{Translation}->{'Only users of these groups have the permission to use the ticket types as defined in "ITSMChange::AddChangeLinkTicketTypes" if the feature "Ticket::Acl::Module###200-Ticket::Acl::Module" is enabled.'} =
        '如果启用了“Ticket::Acl::Module###200-Ticket::Acl::Module”，只有这些组中的用户有权使用“ITSMChange::AddChangeLinkTicketTypes”中定义的工单类型。';
    $Self->{Translation}->{'Overview over all Changes.'} = '所有变更的概览。';
    $Self->{Translation}->{'PIR'} = '实施后评审';
    $Self->{Translation}->{'PSA'} = 'PSA';
    $Self->{Translation}->{'Parameters for the UserCreateWorkOrderNextMask object in the preference view of the agent interface.'} =
        '服务人员界面偏好设置视图UserCreateWorkOrderNextMask（创建工作指令后的窗口）对象的参数。';
    $Self->{Translation}->{'Parameters for the pages (in which the changes are shown) of the small change overview.'} =
        '变更概览简洁模式显示变更的页面参数。';
    $Self->{Translation}->{'Presents a link in the menu to show the involved persons in a change, in the zoom view of such change in the agent interface.'} =
        '在服务人员界面变更详情窗口，在菜单中显示一个链接以显示变更的相关人员。';
    $Self->{Translation}->{'Print the change.'} = '';
    $Self->{Translation}->{'Print the workorder.'} = '';
    $Self->{Translation}->{'Projected Service Availability'} = '计划服务可用性';
    $Self->{Translation}->{'Projected Service Availability (PSA)'} = '计划服务可用性（PSA）';
    $Self->{Translation}->{'Projected Service Availability (PSA) of changes. Overview of approved changes and their services.'} =
        '变更的计划服务可用性（PSA）。已批准的变更和它们的服务的概览。';
    $Self->{Translation}->{'Required privileges in order for an agent to take a workorder.'} =
        '服务人员接手工作指令所需的权限。';
    $Self->{Translation}->{'Required privileges to access the overview of all changes.'} = '访问所有的变更概览所需的权限。';
    $Self->{Translation}->{'Required privileges to add a workorder.'} = '添加一个工作指令所需的权限。';
    $Self->{Translation}->{'Required privileges to change the workorder agent.'} = '更换工作指令服务人员所需的权限。';
    $Self->{Translation}->{'Required privileges to create a template from a change.'} = '从变更中创建模板所需的权限。';
    $Self->{Translation}->{'Required privileges to create a template from a changes\' CAB.'} =
        '从变更CAB中创建模板所需的权限。';
    $Self->{Translation}->{'Required privileges to create a template from a workorder.'} = '从工作指令创建模板所需的权限。';
    $Self->{Translation}->{'Required privileges to create changes from templates.'} = '从模板中创建变更所需的权限。';
    $Self->{Translation}->{'Required privileges to create changes.'} = '创建变更所需的权限。';
    $Self->{Translation}->{'Required privileges to delete a template.'} = '删除模板所需的权限。';
    $Self->{Translation}->{'Required privileges to delete a workorder.'} = '删除一个工作指令所需的权限。';
    $Self->{Translation}->{'Required privileges to delete changes.'} = '删除变更所需的权限。';
    $Self->{Translation}->{'Required privileges to edit a template.'} = '编辑变更所需的权限。';
    $Self->{Translation}->{'Required privileges to edit a workorder.'} = '编辑工作指令所需的权限。';
    $Self->{Translation}->{'Required privileges to edit changes.'} = '编辑变更所需的权限。';
    $Self->{Translation}->{'Required privileges to edit the conditions of changes.'} = '编辑变更条件所需的权限。';
    $Self->{Translation}->{'Required privileges to edit the content of a template.'} = '编辑模板内容所需的权限。';
    $Self->{Translation}->{'Required privileges to edit the involved persons of a change.'} =
        '编辑变更相关人员所需的权限。';
    $Self->{Translation}->{'Required privileges to move changes in time.'} = '移动变更时间轴所需的权限。';
    $Self->{Translation}->{'Required privileges to print a change.'} = '打印变更所需的权限。';
    $Self->{Translation}->{'Required privileges to reset changes.'} = '重置变更所需的权限。';
    $Self->{Translation}->{'Required privileges to view a workorder.'} = '查看工作指令所需的权限。';
    $Self->{Translation}->{'Required privileges to view changes.'} = '查看变更所需的权限。';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is a CAB member.'} =
        '查看\'我的CAB\'的变更列表所需的权限。';
    $Self->{Translation}->{'Required privileges to view list of changes where the user is the change manager.'} =
        '查看\'我的变更\'的变更列表所需的权限。';
    $Self->{Translation}->{'Required privileges to view overview over all templates.'} = '查看所有模板概览所需的权限。';
    $Self->{Translation}->{'Required privileges to view the conditions of changes.'} = '查看变更条件所需的权限。';
    $Self->{Translation}->{'Required privileges to view the history of a change.'} = '查看变更历史所需的权限。';
    $Self->{Translation}->{'Required privileges to view the history of a workorder.'} = '查看工作指令历史所需的权限。';
    $Self->{Translation}->{'Required privileges to view the history zoom of a change.'} = '查看变更历史详情所需的权限。';
    $Self->{Translation}->{'Required privileges to view the history zoom of a workorder.'} =
        '查看工作指令详情所需的权限。';
    $Self->{Translation}->{'Required privileges to view the list of Change Schedule.'} = '查看变更计划列表所需的权限。';
    $Self->{Translation}->{'Required privileges to view the list of change PSA.'} = '查看变更PSA列表所需的权限。';
    $Self->{Translation}->{'Required privileges to view the list of changes with an upcoming PIR (Post Implementation Review).'} =
        '查看有即使来临的PIR（实施后审查）的变更列表所需的权限。';
    $Self->{Translation}->{'Required privileges to view the list of own changes.'} = '查看自己的变更列表所需的权限。';
    $Self->{Translation}->{'Required privileges to view the list of own workorders.'} = '查看自己的工作指令所需的权限。';
    $Self->{Translation}->{'Required privileges to write a report for the workorder.'} = '为工作指令编写报告所需的权限。';
    $Self->{Translation}->{'Reset a change and its workorders.'} = '重置一个变更和它的工作指令。';
    $Self->{Translation}->{'Reset change and its workorders.'} = '';
    $Self->{Translation}->{'Run task to check if specific times have been reached in changes and workorders.'} =
        '执行任务来检查是否到达了变更和工作指令的特定时间点。';
    $Self->{Translation}->{'Save change as a template.'} = '';
    $Self->{Translation}->{'Save workorder as a template.'} = '';
    $Self->{Translation}->{'Schedule'} = '计划表';
    $Self->{Translation}->{'Screen after creating a workorder'} = '创建工作指令后的窗口';
    $Self->{Translation}->{'Search Changes.'} = '搜索变更。';
    $Self->{Translation}->{'Selects the change number generator module. "AutoIncrement" increments the change number, the SystemID and the counter are used with SystemID.counter format (e.g. 100118, 100119). With "Date", the change numbers will be generated by the current date and a counter; this format looks like Year.Month.Day.counter, e.g. 2010062400001, 2010062400002. With "DateChecksum", the counter will be appended as checksum to the string of date plus the SystemID. The checksum will be rotated on a daily basis. This format looks like Year.Month.Day.SystemID.Counter.CheckSum, e.g. 2010062410000017, 2010062410000026.'} =
        '选择变更编号生成器模块。“自动增量”--递增变更编号，系统ID和计数器配合使用的格式为：系统ID.计数器（如100118、100119）。“日期”--会用当前日期、系统ID和计数器共同生成变更编号，格式为：年.月.日.系统ID.计数器（如2010062400001、2010062400002）。“日期校验和”--计数器的值以校验和的方式追加日期和系统ID的字符串后面，校验和每日轮换，这种格式为：年.月.日.系统ID.计数器.校验和（如2010062410000017、2010062410000026）。';
    $Self->{Translation}->{'Set the agent for the workorder.'} = '';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        '在“AgentITSMChangeZoom（变更详情窗口）”和“AgentITSMWorkOrderZoom（工作指令详情窗口）”中，设置内置HTML字段的默认高度（单位：像素）。';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentITSMChangeZoom and AgentITSMWorkOrderZoom.'} =
        '在“AgentITSMChangeZoom（变更详情窗口）”和“AgentITSMWorkOrderZoom（工作指令详情窗口）”中，设置内置HTML字段的最大高度（单位：像素）。';
    $Self->{Translation}->{'Sets the minimal change counter size (if "AutoIncrement" was selected as ITSMChange::NumberGenerator). Default is 5, this means the counter starts from 10000.'} =
        '设置最小的变更计数器大小（如果变更编号生成器选用“自动增量”）。默认是5（位数），意味着计数器从10000开始。';
    $Self->{Translation}->{'Sets up the state machine for changes.'} = '设置变更的状态模式转换。';
    $Self->{Translation}->{'Sets up the state machine for workorders.'} = '设置工作指令的状态模式转换。';
    $Self->{Translation}->{'Shows a checkbox in the AgentITSMWorkOrderEdit screen that defines if the the following workorders should also be moved if a workorder is modified and the planned end time has changed.'} =
        '在编辑工作指令窗口显示一个复选框，定义如果一个工作指令被修改且计划结束时间被修改时是否后面的工作指令也跟着被移动时间。';
    $Self->{Translation}->{'Shows a link in the menu that allows changing the workorder agent, in the zoom view of such workorder of the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个允许修改工作指令服务人员的链接。';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a change as a template in the zoom view of the change, in the agent interface.'} =
        '在服务人员界面变更详情窗口，在菜单中显示一个允许定义一个变更为模板的链接。';
    $Self->{Translation}->{'Shows a link in the menu that allows defining a workorder as a template in the zoom view of the workorder, in the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个允许定义一个工作指令为模板的链接。';
    $Self->{Translation}->{'Shows a link in the menu that allows editing the report of a workorder, in the zoom view of such workorder of the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个允许编辑工作指令报告的链接。';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a change with another object in the change zoom view of the agent interface.'} =
        '在服务人员界面变更详情窗口，在菜单中显示一个允许链接变更到另一对象的链接。';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a workorder with another object in the zoom view of such workorder of the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个允许链接工作指令到其它对象的链接。';
    $Self->{Translation}->{'Shows a link in the menu that allows moving the time slot of a change in its zoom view of the agent interface.'} =
        '在服务人员界面变更详情窗口，在菜单中显示一个允许移动变更时间轴的链接。';
    $Self->{Translation}->{'Shows a link in the menu that allows taking a workorder in the its zoom view of the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个允许执行一个工作指令的链接。';
    $Self->{Translation}->{'Shows a link in the menu to access the conditions of a change in the its zoom view of the agent interface.'} =
        '在服务人员界面变更详情窗口，在菜单中显示一个访问变更条件的链接。';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a change in the its zoom view of the agent interface.'} =
        '在服务人员界面变更详情窗口，在菜单中显示一个访问变更历史的链接。';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a workorder in the its zoom view of the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个访问工作指令历史的链接。';
    $Self->{Translation}->{'Shows a link in the menu to add a workorder in the change zoom view of the agent interface.'} =
        '在服务人员界面变更详情窗口，在菜单中显示一个添加工作指令的链接。';
    $Self->{Translation}->{'Shows a link in the menu to delete a change in its zoom view of the agent interface.'} =
        '在服务人员界面变更详情窗口，在菜单中显示一个删除变更的链接。';
    $Self->{Translation}->{'Shows a link in the menu to delete a workorder in its zoom view of the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个删除工作指令的链接。';
    $Self->{Translation}->{'Shows a link in the menu to edit a change in the its zoom view of the agent interface.'} =
        '在服务人员界面变更详情窗口，在菜单中显示一个编辑变更的链接。';
    $Self->{Translation}->{'Shows a link in the menu to edit a workorder in the its zoom view of the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个编辑工作指令的链接。';
    $Self->{Translation}->{'Shows a link in the menu to go back in the change zoom view of the agent interface.'} =
        '在服务人员界面变更详情窗口，在菜单中显示一个返回链接。';
    $Self->{Translation}->{'Shows a link in the menu to go back in the workorder zoom view of the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个返回链接。';
    $Self->{Translation}->{'Shows a link in the menu to print a change in the its zoom view of the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个打印变更的链接。';
    $Self->{Translation}->{'Shows a link in the menu to print a workorder in the its zoom view of the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个打印工作指令的链接。';
    $Self->{Translation}->{'Shows a link in the menu to reset a change and its workorders in its zoom view of the agent interface.'} =
        '在服务人员界面工作指令详情窗口，在菜单中显示一个重置变更和工作指令的链接。';
    $Self->{Translation}->{'Shows the change history (reverse ordered) in the agent interface.'} =
        '在服务人员界面显示变更历史（倒序）。';
    $Self->{Translation}->{'State Machine'} = '状态模式转换';
    $Self->{Translation}->{'Stores change and workorder ids and their corresponding template id, while a user is editing a template.'} =
        '当用户编辑一个模板时，存储变更和工作指令的ID和他们对应的模板ID。';
    $Self->{Translation}->{'Take Workorder.'} = '执行工作指令。';
    $Self->{Translation}->{'Take the workorder.'} = '';
    $Self->{Translation}->{'Template.'} = '模板。';
    $Self->{Translation}->{'The identifier for a change, e.g. Change#, MyChange#. The default is Change#.'} =
        '变更的标识符，例如：Change#、MyChange#。默认为Change#。';
    $Self->{Translation}->{'The identifier for a workorder, e.g. Workorder#, MyWorkorder#. The default is Workorder#.'} =
        '工作指令的标识符，例如：Workorder#、MyWorkorder#。默认为Workorder#。';
    $Self->{Translation}->{'This ACL module restricts the usuage of the ticket types that are defined in the sysconfig option \'ITSMChange::AddChangeLinkTicketTypes\', to users of the groups as defined in "ITSMChange::RestrictTicketTypes::Groups". As this ACL could collide with other ACLs which are also related to the ticket type, this sysconfig option is disabled by default and should only be activated if needed.'} =
        '这个ACL模块限制使用定义在系统配置选项\'ITSMChange::AddChangeLinkTicketTypes\'中的工单类型， 仅在\'ITSMChange::RestrictTicketTypes::Groups\'中定义的组成员能够使用。这个ACL可能会和其它与这个工单类型相关的ACL冲突， 所以这个系统配置选项默认是禁用的，仅在需要时启用。';
    $Self->{Translation}->{'Time Slot'} = '时间轴';
    $Self->{Translation}->{'Types of tickets, where in the ticket zoom view a link to add a change will be displayed.'} =
        '在工单详情窗口添加一个变更链接时显示的工单类型。';
    $Self->{Translation}->{'User Search'} = '用户搜索';
    $Self->{Translation}->{'Workorder Add (from template).'} = '添加工作指令（从模板）。';
    $Self->{Translation}->{'Workorder Add.'} = '添加工作指令。';
    $Self->{Translation}->{'Workorder Agent'} = '';
    $Self->{Translation}->{'Workorder Agent.'} = '工作指令服务人员。';
    $Self->{Translation}->{'Workorder Delete.'} = '删除工作指令。';
    $Self->{Translation}->{'Workorder Edit.'} = '编辑工作指令。';
    $Self->{Translation}->{'Workorder History Zoom.'} = '工作指令历史详情。';
    $Self->{Translation}->{'Workorder History.'} = '工作指令历史。';
    $Self->{Translation}->{'Workorder Report.'} = '工作指令报告。';
    $Self->{Translation}->{'Workorder Zoom.'} = '工作指令详情。';
    $Self->{Translation}->{'once'} = '单次';
    $Self->{Translation}->{'regularly'} = '定期';

}

1;
