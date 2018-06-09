# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_TW_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = '創建新的調查';
    $Self->{Translation}->{'Introduction'} = '介紹';
    $Self->{Translation}->{'Survey Introduction'} = '調查介紹';
    $Self->{Translation}->{'Notification Body'} = '通知正文';
    $Self->{Translation}->{'Internal Description'} = '内部描述';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = '編輯一般信息';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = '編輯問題';
    $Self->{Translation}->{'Survey Questions'} = '調查問題';
    $Self->{Translation}->{'Add Question'} = '添加問題';
    $Self->{Translation}->{'Type the question'} = '問題類型';
    $Self->{Translation}->{'Answer required'} = '需要回答';
    $Self->{Translation}->{'No questions saved for this survey.'} = '這個調查没有保存的問題。';
    $Self->{Translation}->{'Question'} = '問題';
    $Self->{Translation}->{'Answer Required'} = '必須回答';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        '';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        '';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = '編輯問題';
    $Self->{Translation}->{'go back to questions'} = '返回問題';
    $Self->{Translation}->{'Question:'} = '問題：';
    $Self->{Translation}->{'Possible Answers For'} = '可選的回答';
    $Self->{Translation}->{'Add Answer'} = '添加回答';
    $Self->{Translation}->{'No answers saved for this question.'} = '';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = '您確定要刪除此答案？';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        '';
    $Self->{Translation}->{'Edit Answer'} = '編輯回答';
    $Self->{Translation}->{'go back to edit question'} = '返回到編輯問題';
    $Self->{Translation}->{'Answer:'} = '答：';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = '';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = '通知發送者';
    $Self->{Translation}->{'Notification Subject'} = '通知主題';
    $Self->{Translation}->{'Changed By'} = '修改人';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = '統計概況';
    $Self->{Translation}->{'Requests Table'} = '請求表';
    $Self->{Translation}->{'Send Time'} = '發送時間';
    $Self->{Translation}->{'Vote Time'} = '投票時間';
    $Self->{Translation}->{'See Details'} = '查看詳情';
    $Self->{Translation}->{'Survey Stat Details'} = '調查統計詳情';
    $Self->{Translation}->{'go back to stats overview'} = '返回統計概況';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = '調查信息';
    $Self->{Translation}->{'Sent requests'} = '已發送的請求';
    $Self->{Translation}->{'Received surveys'} = '已接收的調查';
    $Self->{Translation}->{'Survey Details'} = '調查詳情';
    $Self->{Translation}->{'Ticket Services'} = '工單服務';
    $Self->{Translation}->{'Survey Results Graph'} = '調查結果圖';
    $Self->{Translation}->{'No stat results.'} = '沒有統計結果。';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = '調查';
    $Self->{Translation}->{'Please answer these questions'} = '請回答這些問題';
    $Self->{Translation}->{'Show my answers'} = '顯示我的回答';
    $Self->{Translation}->{'These are your answers'} = '這些是你的回答';
    $Self->{Translation}->{'Survey Title'} = '調查標題';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = '創建新的調查';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = '';
    $Self->{Translation}->{'No SurveyID is given!'} = '';
    $Self->{Translation}->{'Survey Edit'} = '編輯調查';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = '';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = '';
    $Self->{Translation}->{'Survey Edit Questions'} = '編輯調查問題';
    $Self->{Translation}->{'Yes/No'} = '是/否';
    $Self->{Translation}->{'Radio (List)'} = '單選（列表）';
    $Self->{Translation}->{'Checkbox (List)'} = '複選框（列表）';
    $Self->{Translation}->{'Question Type'} = '問題類別';
    $Self->{Translation}->{'Complete'} = '完整';
    $Self->{Translation}->{'Incomplete'} = '不完整';
    $Self->{Translation}->{'Question Edit'} = '編輯問題';
    $Self->{Translation}->{'Answer Edit'} = '編輯回答';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = '統計概況';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = '';
    $Self->{Translation}->{'Stats Detail'} = '統計詳情';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = '無法設置新的狀態！還未定義問題。';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = '';
    $Self->{Translation}->{'Status changed.'} = '狀態已更改。';
    $Self->{Translation}->{'- No queue selected -'} = '- 沒有選取佇列 -';
    $Self->{Translation}->{'- No ticket type selected -'} = '';
    $Self->{Translation}->{'- No ticket service selected -'} = '';
    $Self->{Translation}->{'- Change Status -'} = '- 更改狀態 -';
    $Self->{Translation}->{'master'} = '';
    $Self->{Translation}->{'New Status'} = '新狀態';
    $Self->{Translation}->{'Survey Description'} = '調查描述';
    $Self->{Translation}->{'answered'} = '已回答';
    $Self->{Translation}->{'not answered'} = '未回答';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = '感謝你的反饋。';
    $Self->{Translation}->{'The survey is finished.'} = '調查結束。';
    $Self->{Translation}->{'Survey Message!'} = '';
    $Self->{Translation}->{'Module not enabled.'} = '';
    $Self->{Translation}->{'This functionality is not enabled, please contact your administrator.'} =
        '';
    $Self->{Translation}->{'Survey Error!'} = '';
    $Self->{Translation}->{'Invalid survey key.'} = '';
    $Self->{Translation}->{'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'} =
        '';
    $Self->{Translation}->{'Survey Vote'} = '';
    $Self->{Translation}->{'Survey Vote Data'} = '';
    $Self->{Translation}->{'You have already answered the survey.'} = '你已經回答了調查。';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = '調查模組';
    $Self->{Translation}->{'A module to edit survey questions.'} = '';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        '';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        '';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        '';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        '';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        '';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        '';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        '';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        '';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        '';
    $Self->{Translation}->{'Edit survey general information.'} = '';
    $Self->{Translation}->{'Edit survey questions.'} = '';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        '';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = '';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        '';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        '';
    $Self->{Translation}->{'Public Survey.'} = '公開的調查';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Stats Details'} = '';
    $Self->{Translation}->{'Survey Add Module.'} = '調查添加模組';
    $Self->{Translation}->{'Survey Edit Module.'} = '調查編輯模組';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = '';
    $Self->{Translation}->{'Survey Stats Module.'} = '';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'Modul Umfrage-Detailansicht';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = '';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = '';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        '';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        '';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = '';
    $Self->{Translation}->{'Zoom into statistics details.'} = '';

}

1;
