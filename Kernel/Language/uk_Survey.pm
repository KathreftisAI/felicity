# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::uk_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'Створити нове опитування';
    $Self->{Translation}->{'Introduction'} = 'Представлення';
    $Self->{Translation}->{'Survey Introduction'} = 'Представлення опитування';
    $Self->{Translation}->{'Notification Body'} = 'Тіло інформування';
    $Self->{Translation}->{'Internal Description'} = 'Внутрішній опис';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'Редагувати загальну інформацію';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Редагуати запитання';
    $Self->{Translation}->{'Survey Questions'} = 'Запитання опитування';
    $Self->{Translation}->{'Add Question'} = 'Додати запитання';
    $Self->{Translation}->{'Type the question'} = 'Тип запитання';
    $Self->{Translation}->{'Answer required'} = 'Необхідна відповідь';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Немає збережених запитань для цього опитування';
    $Self->{Translation}->{'Question'} = 'Запитання';
    $Self->{Translation}->{'Answer Required'} = 'Необхідна відповідь';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        'Слід закрити це вікно після завершення опитування';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'Ви дійсно хочете видалити це запитання? Всі повязані дані будуть ВТРАЧЕНІ';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = 'Редагувати запитання';
    $Self->{Translation}->{'go back to questions'} = 'повернутись до запитань';
    $Self->{Translation}->{'Question:'} = 'Запитання';
    $Self->{Translation}->{'Possible Answers For'} = 'Можливі відповіді';
    $Self->{Translation}->{'Add Answer'} = 'Додати відповідь';
    $Self->{Translation}->{'No answers saved for this question.'} = 'Немає збережених відповідей до цього запитання';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = 'Ви дійсно хочете видалити це запитання?';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'Це запитання не містить варіантів відповіді, буде показане текстове поле';
    $Self->{Translation}->{'Edit Answer'} = 'Редагувати відповідь';
    $Self->{Translation}->{'go back to edit question'} = 'повернутись до редагування запитання';
    $Self->{Translation}->{'Answer:'} = 'Відповідь';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = 'Максимальна кількість опитувань на сторінку';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Відправник інформувань';
    $Self->{Translation}->{'Notification Subject'} = 'Тема інформування';
    $Self->{Translation}->{'Changed By'} = 'Змінений';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = 'Огляд статистики';
    $Self->{Translation}->{'Requests Table'} = 'Таблиця запитів';
    $Self->{Translation}->{'Send Time'} = 'Час надсилання';
    $Self->{Translation}->{'Vote Time'} = 'Час голосування';
    $Self->{Translation}->{'See Details'} = 'Переглянути деталі';
    $Self->{Translation}->{'Survey Stat Details'} = 'Деталі статистики опитуванння';
    $Self->{Translation}->{'go back to stats overview'} = 'повернутись до перегляду статистики';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Інфориація опитування';
    $Self->{Translation}->{'Sent requests'} = 'Надіслані запити';
    $Self->{Translation}->{'Received surveys'} = 'Отримані опитування';
    $Self->{Translation}->{'Survey Details'} = 'Деталі опитування';
    $Self->{Translation}->{'Ticket Services'} = 'Сервіси заявкок';
    $Self->{Translation}->{'Survey Results Graph'} = 'Графік результатів опитування';
    $Self->{Translation}->{'No stat results.'} = 'Немає статистики';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Опитування';
    $Self->{Translation}->{'Please answer these questions'} = 'Будь ласка, дайте відповідь на наступні запитання';
    $Self->{Translation}->{'Show my answers'} = 'Показати мої відповіді';
    $Self->{Translation}->{'These are your answers'} = 'Вані відповілі';
    $Self->{Translation}->{'Survey Title'} = 'Заголовок опитування';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = 'Додати нове опитування';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = 'Ви не маєте повноважень на це опитування';
    $Self->{Translation}->{'No SurveyID is given!'} = 'Не надано SurveyID!';
    $Self->{Translation}->{'Survey Edit'} = 'Редагувати опитування';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = 'Ви не маєте повноважень на це опитування чи запитання';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = 'Ви не маєте повноважень на це опитування, запитання чи відповідь';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Редагувати запитання опитування';
    $Self->{Translation}->{'Yes/No'} = 'Так/Ні';
    $Self->{Translation}->{'Radio (List)'} = 'Рідіо (список)';
    $Self->{Translation}->{'Checkbox (List)'} = 'Прапорці (список)';
    $Self->{Translation}->{'Question Type'} = 'Тип запитання';
    $Self->{Translation}->{'Complete'} = 'Завершено';
    $Self->{Translation}->{'Incomplete'} = 'Не завершено';
    $Self->{Translation}->{'Question Edit'} = 'Редагувати запитання';
    $Self->{Translation}->{'Answer Edit'} = 'Редагувати відповідь ';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = 'Перегляд статистики';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = 'Ви не маєте повноважень на це опитування чи статистику';
    $Self->{Translation}->{'Stats Detail'} = 'Деталі статистики';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'Не можливо встановити новий статус. Не визначені запитання';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = 'Не можливо оновити статус! Запитання не завершені';
    $Self->{Translation}->{'Status changed.'} = 'Статус змінився.';
    $Self->{Translation}->{'- No queue selected -'} = '- Не вибрано чергу -';
    $Self->{Translation}->{'- No ticket type selected -'} = 'Не вибрано тип заявки';
    $Self->{Translation}->{'- No ticket service selected -'} = 'Не вибрано сервіс заявки';
    $Self->{Translation}->{'- Change Status -'} = '- Змінити статус -';
    $Self->{Translation}->{'master'} = 'головний';
    $Self->{Translation}->{'New Status'} = 'Новий статус';
    $Self->{Translation}->{'Survey Description'} = 'Опис опитування';
    $Self->{Translation}->{'answered'} = 'відполи';
    $Self->{Translation}->{'not answered'} = 'не відповіли';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'Дякуємо за Ваш відгук';
    $Self->{Translation}->{'The survey is finished.'} = 'Опитування завершене';
    $Self->{Translation}->{'Survey Message!'} = 'Повідомлення опитування!';
    $Self->{Translation}->{'Module not enabled.'} = 'Модуль не дозволений';
    $Self->{Translation}->{'This functionality is not enabled, please contact your administrator.'} =
        'Цей функціонал не дозволений, будь ласка звяжіться з адміністратором';
    $Self->{Translation}->{'Survey Error!'} = 'Помилка опитування';
    $Self->{Translation}->{'Invalid survey key.'} = 'Не вірний ключ опитування';
    $Self->{Translation}->{'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'} =
        'Вкладений ключ опитування не вірний, або Ви перейшли за хибним чи пошкодженим посиланням';
    $Self->{Translation}->{'Survey Vote'} = 'Голосування опитування';
    $Self->{Translation}->{'Survey Vote Data'} = 'Дані голосування по опитуванню';
    $Self->{Translation}->{'You have already answered the survey.'} = 'Ви вже відповіли на всі запитання в опитуванні';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Модуль опитування';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Модуль для редагування запитань опитування';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        'Всі параметри по опитуванню є в інтерфейсі агента';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        'Кількість днів після надсилання опитування по яких немає відгуку тому самому клієнту (0-завжди надсилати)';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        'Тіло листа за замовчуванням для інформування по електронній пошті клієнтам про нове опитування';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        'Відправник по замовчуванню для інформування по електронній пошті клієнтам про нове опитування';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        'Тема по замовчуванню для інформування по електронній пошті клієнтам про нове опитування';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        'Визначає модуль перегляду, щоб показати короткий огляд списку з опитуваннями';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        'Визначає таксимальне значення кількості опитувань, що можуть бути наіслані користувачу протягом 30 днів (0-всі)';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        'Визначає значення затримки надсилання опитування після закриття заявки в годинах (0-одразу)';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        'Визначає висоту Richtext views за замовчуванням для збільшених елементів опитування';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        'Визначає макс. висоту Richtext views для збільшених елементів опитування';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        'Визначає які колонки показувати в перегляді опитування. Не впливає на їх розташування';
    $Self->{Translation}->{'Edit survey general information.'} = '';
    $Self->{Translation}->{'Edit survey questions.'} = '';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        'Ввімкнути/вимкнути відображення дати голосування в публічному інтерфейсі(показується клієнту при повторній спробі пройти опитування)';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = 'Ввімкнути/вимкнути перевірку умови відправки для сервісу';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        'Ввімкнути/вимкнути перевірку умови відправки для типу заявки';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        'Frontend модуль реєстрації, що додає опитування в інтерфейс агента';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        'Frontend модуль реєстрації, що редагує опитування в інтерфейс агента';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        'Frontend модуль реєстрації, що додає статистику опитування в інтерфейс агента';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        'Frontend модуль реєстрації, що відкриває опитування в інтерфейс агента';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        'Frontend модуль реєстрації, що додає Публічне опитування в публічний інтерфейс';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'Якщо регулярний вираз визначає, жодне опитування клієнту не буде відправлено';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        'Параметри сторінки (в яких показуються опитування) в короткому представленні';
    $Self->{Translation}->{'Public Survey.'} = 'Публічне опитування';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        'Показує лінк в меню для редагування опитування в розширеному перегляді агента';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        'Показує лінк в меню для редагування запитань опитування в розширеному перегляді агента';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        'Показує лінк в меню для повернення в опитування в розширеному перегляді агента';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        'Показує лінк в меню для статистики опитування в розширеному перегляді агента';
    $Self->{Translation}->{'Stats Details'} = 'Деталі статистики';
    $Self->{Translation}->{'Survey Add Module.'} = 'Додати модуль опитування';
    $Self->{Translation}->{'Survey Edit Module.'} = 'Подуль редагування опитування';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = 'Ліміт перегляду опитувань Коротко';
    $Self->{Translation}->{'Survey Stats Module.'} = 'Статистика модулю опитування';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'Збільшити модуль опитування';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = '';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = 'Опитування не будуть надсилатись на вказані email';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        'Ідетифікатор опитування. По замовчуванню Опитування#';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        'Подія заявки, для автоматичної відправки опитування клієнту якщо заявка закрита';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = 'Тригер відправки відкладених запитів опитування';
    $Self->{Translation}->{'Zoom into statistics details.'} = '';

}

1;
