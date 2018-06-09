# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sr_Cyrl_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'Направи нову анкету';
    $Self->{Translation}->{'Introduction'} = 'Увод';
    $Self->{Translation}->{'Survey Introduction'} = 'Увод у анкету';
    $Self->{Translation}->{'Notification Body'} = 'Сарджај обавештења';
    $Self->{Translation}->{'Internal Description'} = 'Интерни опис';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'Уреди опште информације';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Уреди питања';
    $Self->{Translation}->{'Survey Questions'} = 'Анкетна питања';
    $Self->{Translation}->{'Add Question'} = 'Додај питање';
    $Self->{Translation}->{'Type the question'} = 'Унеси питање';
    $Self->{Translation}->{'Answer required'} = 'Обавезан одговор';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'За ову анкету нису сачувана питања.';
    $Self->{Translation}->{'Question'} = 'Питање';
    $Self->{Translation}->{'Answer Required'} = 'Обавезан одговор';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        'Када завршите са уређивањем анкетних питања само затворите овај прозор.';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'Да ли заиста желите да обришете ово питање? СВИ повезани подаци ће бити ИЗГУБЉЕНИ!';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = 'Уреди питање';
    $Self->{Translation}->{'go back to questions'} = 'назад на питања';
    $Self->{Translation}->{'Question:'} = 'Питање:';
    $Self->{Translation}->{'Possible Answers For'} = 'Могући одговори за';
    $Self->{Translation}->{'Add Answer'} = 'Додај одговор';
    $Self->{Translation}->{'No answers saved for this question.'} = 'За ово питање нису сачувани одговори.';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = 'Да ли заиста желите да избришете овај одговор?';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'Ово нема више одговора, простор за текст ће бити приказан.';
    $Self->{Translation}->{'Edit Answer'} = 'Уреди одговор';
    $Self->{Translation}->{'go back to edit question'} = 'назад на уређивање питања';
    $Self->{Translation}->{'Answer:'} = 'Одговор:';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = 'Максимум приказаних анкета по страни';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Пошиљаоц обавештења';
    $Self->{Translation}->{'Notification Subject'} = 'Предмет обавештења';
    $Self->{Translation}->{'Changed By'} = 'Мењао';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = 'Преглед статистике за';
    $Self->{Translation}->{'Requests Table'} = 'Табела захтева';
    $Self->{Translation}->{'Send Time'} = 'Време слања';
    $Self->{Translation}->{'Vote Time'} = 'Време гласања';
    $Self->{Translation}->{'See Details'} = 'Види детаље';
    $Self->{Translation}->{'Survey Stat Details'} = 'Детаљи статистике анкете';
    $Self->{Translation}->{'go back to stats overview'} = 'иди назад на преглед статистике';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Информације о анкети';
    $Self->{Translation}->{'Sent requests'} = 'Послати захтеви';
    $Self->{Translation}->{'Received surveys'} = 'Примљене анкете';
    $Self->{Translation}->{'Survey Details'} = 'Детаљи анкете';
    $Self->{Translation}->{'Ticket Services'} = 'Услуге за тикет';
    $Self->{Translation}->{'Survey Results Graph'} = 'Графикон резултата анкете';
    $Self->{Translation}->{'No stat results.'} = 'Нема статистике резултата.';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Анкета';
    $Self->{Translation}->{'Please answer these questions'} = 'Молимо да одговорите на ова питања';
    $Self->{Translation}->{'Show my answers'} = 'Покажи моје одговоре';
    $Self->{Translation}->{'These are your answers'} = 'Ово су ваши одговори';
    $Self->{Translation}->{'Survey Title'} = 'Наслов анкете';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = 'Додај нову анкету';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = 'Немате дозволу за ову анкету!';
    $Self->{Translation}->{'No SurveyID is given!'} = 'Није дат ИД Анкете!';
    $Self->{Translation}->{'Survey Edit'} = 'Уреди анкету';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = 'Немате дозволу за ову анкету или питање!';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = 'Немате дозволу за ову анкету, питање или одговор!';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Уреди анкетна питања';
    $Self->{Translation}->{'Yes/No'} = 'Да/Не';
    $Self->{Translation}->{'Radio (List)'} = 'Дугме (Листа)';
    $Self->{Translation}->{'Checkbox (List)'} = 'Поље за потврду (Листа)';
    $Self->{Translation}->{'Question Type'} = 'Тип питања';
    $Self->{Translation}->{'Complete'} = 'Комплетно';
    $Self->{Translation}->{'Incomplete'} = 'Некомплетно';
    $Self->{Translation}->{'Question Edit'} = 'Уреди питање';
    $Self->{Translation}->{'Answer Edit'} = 'Уреди одговор';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = 'Преглед статистике';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = 'Немате дозволу за ову анкету или детаље статистике!';
    $Self->{Translation}->{'Stats Detail'} = 'Детаљ статистике';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'Не може се поставити нови статус! Нема дефинисаних питања.';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = 'Не може се поставити нови статус! Питања су непотпуна.';
    $Self->{Translation}->{'Status changed.'} = 'Статус промењен.';
    $Self->{Translation}->{'- No queue selected -'} = '- Није изабран ред -';
    $Self->{Translation}->{'- No ticket type selected -'} = '- Није изабран тип тикета -';
    $Self->{Translation}->{'- No ticket service selected -'} = '- Није изабран сервис тикета -';
    $Self->{Translation}->{'- Change Status -'} = '- Промени статус -';
    $Self->{Translation}->{'master'} = 'главни';
    $Self->{Translation}->{'New Status'} = 'Нови статус';
    $Self->{Translation}->{'Survey Description'} = 'Опис анкете';
    $Self->{Translation}->{'answered'} = 'одговорено';
    $Self->{Translation}->{'not answered'} = 'није одговорено';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'Хвала на вашим одговорима.';
    $Self->{Translation}->{'The survey is finished.'} = 'Анкета је завршена.';
    $Self->{Translation}->{'Survey Message!'} = 'Порука анкете!';
    $Self->{Translation}->{'Module not enabled.'} = 'Модул није активиран.';
    $Self->{Translation}->{'This functionality is not enabled, please contact your administrator.'} =
        'Ова фунционалност није омогућена, молимо контактирајте вашег администратора.';
    $Self->{Translation}->{'Survey Error!'} = 'Грешка у анкети!';
    $Self->{Translation}->{'Invalid survey key.'} = 'Неисправан кључ анкете.';
    $Self->{Translation}->{'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'} =
        'Унети кључ анкете је неисправан, ако сте пратили везу можда је она неважећа или оштећена.';
    $Self->{Translation}->{'Survey Vote'} = 'Гласање у анкети';
    $Self->{Translation}->{'Survey Vote Data'} = 'Подаци о гласању у анкети';
    $Self->{Translation}->{'You have already answered the survey.'} = 'Већ сте одговорили на анкету.';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Анкетни модул.';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Модул за уређивање анкетних питања.';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        'Сви параметри Објекта анкете у интерфејсу оператера.';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        'Број дана после слања имејла о анкети за које истом кориснику неће бити слани нови захтеви. Ако изаберете 0 имејл о анкети се увек шаље.';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        'Подразумевани садржај имејла обавештења о новој анкети за кориснике.';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        'Подразумевани пошиљаоц имејла обавештења о новом истраживању за кориснике.';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        'Подразумевани предмет имејла обавештења о новој анкети за кориснике.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        'Дефинише модул прегледа за мали приказ листе анкета. ';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        'Дефинише максимални број анкета који ће бити послат кориснику током 30 дана. (0 значи да нема максимума, сви захтеви ће бити послати).';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        'Дефинише број сати од затварања тикета за покретање слања анкете. (0 значи да се шаље одмах по затварању). Напомена: одлагање слања анкете обавља „OTRS ” сервис пре активирања „Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend” поставке.';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        'Дефинише подразумевану висину оквира за приказ текста  за детаљни приказ елемената анкете.';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        'Одређује максималну висину „Richtext” приказа текста  за детаљни приказ елемената анкете.';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        'Дефинише приказане колоне у прегледу анкете. Ова опције нема утицај на позиције колона.';
    $Self->{Translation}->{'Edit survey general information.'} = 'Уреди опште информације о анкети.';
    $Self->{Translation}->{'Edit survey questions.'} = 'Уреди анкетна питања.';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        'Укључи или искључи приказ екрана за гласање на јавном интерфејсу ради приказа резултата поједине анкете када корисник покуша да одговори на упитник по други пут.';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = 'Укључи или искључи проверу статуса слања за услугу.';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        'Укључи или искључи проверу статуса слања за тип тикета.';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        'Регистрација "Frontend" модула за додавање анкете у интерфејсу оператера.';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        'Регистрација "Frontend" модула за измене анкете у интерфејсу оператера.';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        'Регистрација "Frontend" модула за статистику анкете у интерфејсу оператера.';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        'Регистрација "Frontend" модула за детаљни приказ анкете у интерфејсу оператера.';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        'Регистрација "Frontend" модула за јавне анкетне објекте анкете у простору јавних анкета.';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'Ако се овај израз поклапа, анкета неће бити послата кориснику.';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        'Параметри страница (на којима су анкете видљиве) на малом приказу прегледа анкета.';
    $Self->{Translation}->{'Public Survey.'} = 'Јавна анкета.';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        'У менију приказује везу за уређивање анкете у детаљном приказу интерфејса оператера.';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        'У менију приказује везу за уређивање анкетних питања у детаљном приказу интерфејса оператера.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        'У менију приказује везу за повратак у детаљни приказ анкете у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        'У менију приказује везу за детаљни приказ статистике анкете у детаљном приказу на интерфејсу оператера.';
    $Self->{Translation}->{'Stats Details'} = 'Детаљи статистике';
    $Self->{Translation}->{'Survey Add Module.'} = 'Модул за додавање анкете.';
    $Self->{Translation}->{'Survey Edit Module.'} = 'Модул за уређивање анкете.';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = 'Ограничење прегледа анкете - „мало”';
    $Self->{Translation}->{'Survey Stats Module.'} = 'Модул за статистику анкете.';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'Модул за детаљни приказ анкете.';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = 'Ограничење анкете по страни за преглед - „мало”';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = 'Анкета неће бити послата на подешену имејл адресу.';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        'Идентификатор за анкету, нпр Survey#, MySurvey#. Подразумевано је Survey#.';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        'Модул догађаја на тикету за аутоматско слање имејла о истраживању корисницима ако је тикет затворен.';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = 'Окидач одложеног слања захтева за анкету.';
    $Self->{Translation}->{'Zoom into statistics details.'} = 'Улаз у детаљни приказ статистике.';

}

1;
