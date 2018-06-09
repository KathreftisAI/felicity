# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::bg_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'Създайте ново Проучване';
    $Self->{Translation}->{'Introduction'} = 'Въведение';
    $Self->{Translation}->{'Survey Introduction'} = 'Въведение в изследването';
    $Self->{Translation}->{'Notification Body'} = 'Уведомяване';
    $Self->{Translation}->{'Internal Description'} = 'Вътрешно описание';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'Редактиране на основната информация';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Редактиране на въпроси';
    $Self->{Translation}->{'Survey Questions'} = 'Въпроси за проучването';
    $Self->{Translation}->{'Add Question'} = 'Добавяне на въпрос';
    $Self->{Translation}->{'Type the question'} = 'Въведете въпроса';
    $Self->{Translation}->{'Answer required'} = 'Необходим е отговор';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Няма записани въпроси за това проучване.';
    $Self->{Translation}->{'Question'} = 'Въпрос';
    $Self->{Translation}->{'Answer Required'} = 'Необходим е отговор';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        'Когато приключите с редактирането на въпросите от изследването, просто затворете този екран.';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'Наистина ли искате да изтриете този въпрос? Всички свързани данни ще бъдат загубени!';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = 'Редактиране на въпроса';
    $Self->{Translation}->{'go back to questions'} = 'Върнете се към въпросите';
    $Self->{Translation}->{'Question:'} = 'Въпрос :';
    $Self->{Translation}->{'Possible Answers For'} = 'Възможни отговори за';
    $Self->{Translation}->{'Add Answer'} = 'Добавяне на Отговор';
    $Self->{Translation}->{'No answers saved for this question.'} = 'Няма отговори за този въпрос.';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = 'Наистина ли искате да изтриете този отговор?';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'Няма няколко отговора, и ще се покаже текста.';
    $Self->{Translation}->{'Edit Answer'} = 'Редактиране на отговор';
    $Self->{Translation}->{'go back to edit question'} = 'Върнете се, за да редактирате въпроса';
    $Self->{Translation}->{'Answer:'} = 'Отговор';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = 'Макс. показани проучвания на страницата';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Изпращач';
    $Self->{Translation}->{'Notification Subject'} = 'Уведомление';
    $Self->{Translation}->{'Changed By'} = 'Променено от';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = 'Преглед на Статистиката от';
    $Self->{Translation}->{'Requests Table'} = 'Таблица с исканията';
    $Self->{Translation}->{'Send Time'} = 'Време за изпращане';
    $Self->{Translation}->{'Vote Time'} = 'Време за гласуване';
    $Self->{Translation}->{'See Details'} = 'Детайли';
    $Self->{Translation}->{'Survey Stat Details'} = 'Данни за състоянието на изследването';
    $Self->{Translation}->{'go back to stats overview'} = 'Върнете се към общия преглед на статистическите данни';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Информация за проучванията';
    $Self->{Translation}->{'Sent requests'} = 'Изпратени искания';
    $Self->{Translation}->{'Received surveys'} = 'Получени проучвания';
    $Self->{Translation}->{'Survey Details'} = 'Данни за изследването';
    $Self->{Translation}->{'Ticket Services'} = 'Билетни услуги';
    $Self->{Translation}->{'Survey Results Graph'} = 'Графика на резултатите от изследването';
    $Self->{Translation}->{'No stat results.'} = 'Няма статически резултати';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Проучване';
    $Self->{Translation}->{'Please answer these questions'} = 'Моля отговорете на следните въпроси';
    $Self->{Translation}->{'Show my answers'} = 'Мойте отговори';
    $Self->{Translation}->{'These are your answers'} = 'Това са твойте отговори';
    $Self->{Translation}->{'Survey Title'} = 'Заглавие';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = 'Довавяне на ново Проучване';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = 'Нямате разрешение за това проучване!';
    $Self->{Translation}->{'No SurveyID is given!'} = 'Не е дадено ID на проучването!';
    $Self->{Translation}->{'Survey Edit'} = 'Редактиране';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = 'Нямате разрешение за това проучване или въпрос!';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = 'Нямате разрешение за това проучване, въпрос или отговор!';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Редактиране на въпроси';
    $Self->{Translation}->{'Yes/No'} = 'ДА/НЕ';
    $Self->{Translation}->{'Radio (List)'} = 'Радио (списък)';
    $Self->{Translation}->{'Checkbox (List)'} = 'Квадратче за отметка (списък)';
    $Self->{Translation}->{'Question Type'} = 'Въпрос тип';
    $Self->{Translation}->{'Complete'} = 'Пълен';
    $Self->{Translation}->{'Incomplete'} = 'Непълен';
    $Self->{Translation}->{'Question Edit'} = 'Редактиране на въпрос';
    $Self->{Translation}->{'Answer Edit'} = 'Редактиране';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = 'Общ преглед на статистическите данни';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = 'Нямате разрешение за това проучване или статистически подробности!';
    $Self->{Translation}->{'Stats Detail'} = 'Подробности';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'Не може да се зададе ново състояние! Няма дефинирани въпроси.';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = 'Не може да се зададе ново състояние! Въпроси непълни.';
    $Self->{Translation}->{'Status changed.'} = 'Състоянието е промено.';
    $Self->{Translation}->{'- No queue selected -'} = '- Не е избрана опашка -';
    $Self->{Translation}->{'- No ticket type selected -'} = '- Няма избран тип билет -';
    $Self->{Translation}->{'- No ticket service selected -'} = '- Няма избрана услуга за билети -';
    $Self->{Translation}->{'- Change Status -'} = '- Промяна на състоянието -';
    $Self->{Translation}->{'master'} = 'Мастер';
    $Self->{Translation}->{'New Status'} = 'Нов статус';
    $Self->{Translation}->{'Survey Description'} = 'Описание';
    $Self->{Translation}->{'answered'} = 'Отговорено';
    $Self->{Translation}->{'not answered'} = 'Не е отговорено';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'Благодарим Ви за обратната връзка.';
    $Self->{Translation}->{'The survey is finished.'} = 'Проучването приключи.';
    $Self->{Translation}->{'Survey Message!'} = 'Съобщение';
    $Self->{Translation}->{'Module not enabled.'} = 'Модулът не е активиран.';
    $Self->{Translation}->{'This functionality is not enabled, please contact your administrator.'} =
        'Тази функция не е активирана, моля, свържете се с Администратор.';
    $Self->{Translation}->{'Survey Error!'} = 'Грешка';
    $Self->{Translation}->{'Invalid survey key.'} = 'Невалиден ключ за проучване.';
    $Self->{Translation}->{'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'} =
        'Въведеният ключ е невалиден, ако сте проследили връзката, може би това е остаряло или невалидно.';
    $Self->{Translation}->{'Survey Vote'} = 'Проучване на гласуването';
    $Self->{Translation}->{'Survey Vote Data'} = 'Данни за гласуване в проучванията';
    $Self->{Translation}->{'You have already answered the survey.'} = 'Вие вече сте отговорили.';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Модул за проучване.';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Модул за редактиране на въпроси от проучването.';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        'Всички параметри за обекта от изследването в интерфейса на агента.';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        'След няколко дни след изпращане на електронното писмо, в което не се изпращат нови заявки за проучване на същия клиент. Избирането на 0 винаги ще изпраща електронната поща.';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        'По подразбиране на имейл за уведомяване на клиентите за ново проучване.';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        'Стандартен подател на имейла за уведомяване на клиенти за ново проучване.';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        'Стандартна тема за имейла за уведомяване на потребителите за ново проучване.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        'Модул за преглед, за да покаже изглед на списъка с проучванията.';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        'Максималния брой проучвания, които се изпращат на клиенти на всеки 30 дни. (0 - означава не максимум, всички заявки за проучване ще бъдат изпратени).';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        'Сумата в часове, за която билетът трябва да бъде затворен, за да се задейства изпращането на проучване, (0 - означава изпращане веднага след затваряне). Забележка : изпращането със закъснение на изследването се извършва от OTRS Daemon, преди активирането на настройката "Daemon :: SchedulerCronTaskManager :: Task ### SurveyRequestsSend".';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        'Височината по подразбиране за изгледа с текст за елементите на Zoom Survey.';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        'Максималната височина за изгледа с текст за елементите на Zoom Survey.';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        'Колоните за показване в общия преглед на изследването. Тази опция няма влияние върху позицията на колоните.';
    $Self->{Translation}->{'Edit survey general information.'} = 'Редактиране на общата информация за проучването.';
    $Self->{Translation}->{'Edit survey questions.'} = 'Редактирайте въпросите на изследването.';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        'Активиране или деактивиране на екрана "показване на данни" за гласуване в публичния интерфейс, за да се показват данни от конкретен резултат от проучването, когато клиентът се опита да отговори на проучването за втори път.';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = 'Активирайте или деактивирайте проверката на състоянието на изпращане за услугата.';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        'Активирайте или деактивирайте проверката на състоянието на изпращане за типа на билета.';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        'Регистрацията на Frontend модула за проучване добавя в интерфейса на агента.';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        'Регистрация на модул Frontend за редактиране на анкетата в интерфейса на агента.';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        'Регистрация на модул Frontend за статистически данни в интерфейса на агента.';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        'Регистрация на Frontend модул за наблюдение увеличение в интерфейса на агента.';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        'Регистрация на модул Frontend за обекта на общественото проучване в публичния район на проучването.';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'Ако този регекс съвпада, няма да бъде изпратено проучване на клиентите.';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        'Параметри на страниците (в които са показани проучванията) на общия преглед на изследването.';
    $Self->{Translation}->{'Public Survey.'} = 'Публично проучване.';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        'Показване на връзка в менюто, за да редактира проучване в неговия мащабен изглед на интерфейса на агента.';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        'Показване на връзка в менюто, за да редактира въпроси от проучването в неговия изглед за увеличение на интерфейса на агента.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        'Показване на връзка в менюто, за да се върне в изгледа за увеличение на интерфейса на агента.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        'Показване на връзка в менюто, за да приближи подробностите в статистическите данни за проучването в екрана за увеличение на интерфейса на агента.';
    $Self->{Translation}->{'Stats Details'} = 'Статистика/Детайли';
    $Self->{Translation}->{'Survey Add Module.'} = 'Добавяне на модул.';
    $Self->{Translation}->{'Survey Edit Module.'} = 'Редактиране на Модул.';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = 'Преглед на изследването за "Малък" лимит';
    $Self->{Translation}->{'Survey Stats Module.'} = 'Модул "Статистика на проучванията".';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'Модул за увеличаване на наблюдението.';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = 'Граница на изследването на страница за преглед на "Малки".';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = 'Проучванията няма да бъдат изпратени до конфигурираните имейл адреси.';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        'Идентификаторът за проучване, напр. Проучване #, MySurvey #. По подразбиране е "Проучване #".';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        'Модул за събитие на билети за автоматично изпращане на заявки за електронна поща до клиентите, ако билетът е затворен.';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = 'Trigger изпраща закъснели заявки за проучване.';
    $Self->{Translation}->{'Zoom into statistics details.'} = 'Увеличете статистическите данни.';

}

1;
