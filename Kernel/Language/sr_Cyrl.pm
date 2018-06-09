# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# Copyright (C) 2010 Milorad Jovanovic <j.milorad at gmail.com>
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
package Kernel::Language::sr_Cyrl;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # $$START$$
    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D.%M.%Y %T';
    $Self->{DateFormatLong}      = '%T - %D.%M.%Y';
    $Self->{DateFormatShort}     = '%D.%M.%Y';
    $Self->{DateInputFormat}     = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';
    $Self->{Completeness}        = 0.995120959544623;

    # csv separator
    $Self->{Separator} = ';';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Да',
        'No' => 'Не',
        'yes' => 'да',
        'no' => 'не',
        'Off' => 'Искључено',
        'off' => 'искључено',
        'On' => 'Укључено',
        'on' => 'укључено',
        'top' => 'врх',
        'end' => 'крај',
        'Done' => 'Урађено',
        'Cancel' => 'Откажи',
        'Reset' => 'Поништи',
        'more than ... ago' => 'пре више од ...',
        'in more than ...' => 'у више од ...',
        'within the last ...' => 'у последњих ...',
        'within the next ...' => 'у следећих ...',
        'Created within the last' => 'Креирано у последњих',
        'Created more than ... ago' => 'Креирано пре више од ...',
        'Today' => 'Данас',
        'Tomorrow' => 'Сутра',
        'Next week' => 'Следеће недеље',
        'day' => 'дан',
        'days' => 'дани',
        'day(s)' => 'дан(и)',
        'd' => 'д',
        'hour' => 'сат',
        'hours' => 'сати',
        'hour(s)' => 'сат(и)',
        'Hours' => 'Сати',
        'h' => 'ч',
        'minute' => 'минут',
        'minutes' => 'минути',
        'minute(s)' => 'минут(и)',
        'Minutes' => 'Минути',
        'm' => 'м',
        'month' => 'месец',
        'months' => 'месеци',
        'month(s)' => 'месец(и)',
        'week' => 'недеља',
        'week(s)' => 'недеља(е)',
        'quarter' => 'тромесечје',
        'quarter(s)' => 'тромесечје(а)',
        'half-year' => 'полугодиште',
        'half-year(s)' => 'полугодиште(а)',
        'year' => 'година',
        'years' => 'године',
        'year(s)' => 'година(е)',
        'second(s)' => 'секунде(е)',
        'seconds' => 'секунде',
        'second' => 'секунда',
        's' => 'с',
        'Time unit' => 'Јединица времена',
        'wrote' => 'написао/ла',
        'Message' => 'Порука',
        'Error' => 'Грешка',
        'Bug Report' => 'Пријава грешке',
        'Attention' => 'Пажња',
        'Warning' => 'Упозорење',
        'Module' => 'Модул',
        'Modulefile' => 'Датотека модула',
        'Subfunction' => 'Подфункција',
        'Line' => 'Линија',
        'Setting' => 'Подешавање',
        'Settings' => 'Подешавања',
        'Example' => 'Пример',
        'Examples' => 'Примери',
        'valid' => 'важећи',
        'Valid' => 'Важећи',
        'invalid' => 'неважећи',
        'Invalid' => 'Неважећи',
        '* invalid' => '* неважећи',
        'invalid-temporarily' => 'неважећи-привремено',
        ' 2 minutes' => ' 2 минута',
        ' 5 minutes' => ' 5 минута',
        ' 7 minutes' => ' 7 минута',
        '10 minutes' => '10 минута',
        '15 minutes' => '15 минута',
        'Mr.' => 'Г-дин',
        'Mrs.' => 'Г-ђа',
        'Next' => 'Следеће',
        'Back' => 'Назад',
        'Next...' => 'Следеће...',
        '...Back' => '...Назад',
        '-none-' => '-ни један-',
        'none' => 'ни један',
        'none!' => 'ни један!',
        'none - answered' => 'ни један - одговорен',
        'please do not edit!' => 'молимо, не мењајте!',
        'Need Action' => 'Потребна акција',
        'AddLink' => 'Додај везу',
        'Link' => 'Повежи',
        'Unlink' => 'Прекини везу',
        'Linked' => 'Повезано',
        'Link (Normal)' => 'Веза (Normal)',
        'Link (Parent)' => 'Веза (Parent)',
        'Link (Child)' => 'Веза (Child)',
        'Normal' => 'Normal',
        'Parent' => 'Parent',
        'Child' => 'Child',
        'Hit' => 'Погодак',
        'Hits' => 'Погоци',
        'Text' => 'Текст',
        'Standard' => 'Стандардан',
        'Lite' => 'Једноставан',
        'User' => 'Корисник',
        'Username' => 'Корисничко име',
        'Language' => 'Језик',
        'Languages' => 'Језици',
        'Password' => 'Лозинка',
        'Preferences' => 'Подешавања',
        'Salutation' => 'Поздрав',
        'Salutations' => 'Поздрави',
        'Signature' => 'Потпис',
        'Signatures' => 'Потписи',
        'Customer' => 'Клијент',
        'CustomerID' => 'ИД клијента',
        'CustomerIDs' => 'ИД-еви клијента',
        'customer' => 'клијент',
        'agent' => 'оператер',
        'system' => 'систем',
        'Customer Info' => 'Клијентски инфо',
        'Customer Information' => 'Информације о клијенту',
        'Customer Companies' => 'Фирме клијенти',
        'Company' => 'Фирма',
        'go!' => 'старт!',
        'go' => 'старт',
        'All' => 'Све',
        'all' => 'sve',
        'Sorry' => 'Извините',
        'update!' => 'ажурирање!',
        'update' => 'ажурирање',
        'Update' => 'Ажурирање',
        'Updated!' => 'Ажурирано!',
        'submit!' => 'пошаљи!',
        'submit' => 'пошаљи',
        'Submit' => 'Пошаљи',
        'change!' => 'промени!',
        'Change' => 'Промени',
        'change' => 'промени',
        'click here' => 'кликните овде',
        'Comment' => 'Коментар',
        'Invalid Option!' => 'Неважећа опција!',
        'Invalid time!' => 'Неважеће време!',
        'Invalid date!' => 'Неважећи датум!',
        'Name' => 'Име',
        'Group' => 'Група',
        'Description' => 'Опис',
        'description' => 'опис',
        'Theme' => 'Тема',
        'Created' => 'Креирано',
        'Created by' => 'Креирао',
        'Changed' => 'Измењено',
        'Changed by' => 'Изменио',
        'Search' => 'Тражи',
        'and' => 'и',
        'between' => 'између',
        'before/after' => 'пре/после',
        'Fulltext Search' => 'Текст за претрагу',
        'Data' => 'Подаци',
        'Options' => 'Опције',
        'Title' => 'Наслов',
        'Item' => 'Ставка',
        'Delete' => 'Избрисати',
        'Edit' => 'Уредити',
        'View' => 'Преглед',
        'Number' => 'Број',
        'System' => 'Систем',
        'Contact' => 'Контакт',
        'Contacts' => 'Контакти',
        'Export' => 'Извоз',
        'Up' => 'Горе',
        'Down' => 'Доле',
        'Add' => 'Додати',
        'Added!' => 'Додато!',
        'Category' => 'Категорија',
        'Viewer' => 'Приказивач',
        'Expand' => 'Прошири',
        'Small' => 'Мало',
        'Medium' => 'Средње',
        'Large' => 'Велико',
        'Date picker' => 'Избор датума',
        'Show Tree Selection' => 'Прикажи дрво селекције',
        'The field content is too long!' => 'Садржај поља је предугачак!',
        'Maximum size is %s characters.' => 'Максимална величина је %s карактера.',
        'This field is required or' => 'Ово поље је обавезно или',
        'New message' => 'Нова порука',
        'New message!' => 'Нова порука!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Молимо вас да одговорите на овај тикет да би сте се вратили на нормалан преглед реда!',
        'You have %s new message(s)!' => 'Имате %s нових порука!',
        'You have %s reminder ticket(s)!' => 'Имате %s тикета подсетника!',
        'The recommended charset for your language is %s!' => 'Препоручени карактерсет за ваш језик је %s!',
        'Change your password.' => 'Промените лозинку.',
        'Please activate %s first!' => 'Молимо, прво активирајте %s.',
        'No suggestions' => 'Нема сугестија',
        'Word' => 'Реч',
        'Ignore' => 'Занемари',
        'replace with' => 'замени са',
        'There is no account with that login name.' => 'Не постоји налог са тим именом за пријаву.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            'Неуспешна пријава! Нетачно је унето ваше корисничко име или лозинка.',
        'There is no acount with that user name.' => 'Не постоји налог са тим корисничким именом.',
        'Please contact your administrator' => 'Молимо контактирајте вашег администратора',
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact your administrator.' =>
            'Аутентификација је успела али подаци о клијенту нису пронађени. Молимо контактирајте вашег администратора.',
        'This e-mail address already exists. Please log in or reset your password.' =>
            'Ова имејл адреса већ постоји. Молимо, пријавите се или ресетујте вашу лозинку.',
        'Logout' => 'Одјава',
        'Logout successful. Thank you for using %s!' => 'Успешно сте се одјавили! Хвала што сте користили %s!',
        'Feature not active!' => 'Функција није активна!',
        'Agent updated!' => 'Ажуриран оператер!',
        'Database Selection' => 'Селекција базе података',
        'Create Database' => 'Креирај базу података',
        'System Settings' => 'Системска подешавања',
        'Mail Configuration' => 'Подешавање имејла',
        'Finished' => 'Завршено',
        'Install OTRS' => 'Инсталирај „OTRS”',
        'Intro' => 'Увод',
        'License' => 'Лиценца',
        'Database' => 'База података',
        'Configure Mail' => 'Подеси имејл',
        'Database deleted.' => 'Обрисана база података.',
        'Enter the password for the administrative database user.' => 'Унеси лозинку за корисника административне базе података.',
        'Enter the password for the database user.' => 'Унеси лозинку за корисника базе података.',
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty.' =>
            'Ако сте поставили рут лозинку за вашу базу података, она мора бити унета овде. Ако нисте, ово поље оставите празно.',
        'Database already contains data - it should be empty!' => 'База података већ садржи податке - требало би да буде празна.',
        'Login is needed!' => 'Потребна је пријава!',
        'It is currently not possible to login due to a scheduled system maintenance.' =>
            'Пријава тренутно није могућа због планираног одржавања система.',
        'Password is needed!' => 'Потребна је лозинка!',
        'Take this Customer' => 'Узми овог клијента',
        'Take this User' => 'Узми овог корисника',
        'possible' => 'могуће',
        'reject' => 'одбаци',
        'reverse' => 'обрнуто',
        'Facility' => 'Инсталација',
        'Time Zone' => 'Временска зона',
        'Pending till' => 'На чекању до',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            'Не користите суперкориснички налог за рад са „OTRS”! Направите нове налоге за оператере и користите њих.',
        'Dispatching by email To: field.' => 'Отпремање путем имејла За: поље.',
        'Dispatching by selected Queue.' => 'Отпремање путем изабраног реда.',
        'No entry found!' => 'Унос није пронађен!',
        'Session invalid. Please log in again.' => 'Сесија је неважећа. Молимо пријавите се поново.',
        'Session has timed out. Please log in again.' => 'Време сесије је истекло. Молимо пријавите се поново.',
        'Session limit reached! Please try again later.' => 'Сесија је истекла! Молимо покушајте касније!',
        'No Permission!' => 'Немате дозволу!',
        '(Click here to add)' => '(Кликни овде за додавање)',
        'Preview' => 'Приказ',
        'Package not correctly deployed! Please reinstall the package.' =>
            'Пакет није коректно инсталиран! Инсталирајте га поново.',
        '%s is not writable!' => 'Не може се уписивати на %s!',
        'Cannot create %s!' => 'Не може се креирати %s!',
        'Check to activate this date' => 'Проверите за активирање овог датума',
        'You have Out of Office enabled, would you like to disable it?' =>
            'Активирана је опција „Ван канцеларије”, желите ли да је искључите?',
        'News about OTRS releases!' => 'Вести о „OTRS” издањима!',
        'Go to dashboard!' => 'Иди на командну таблу!',
        'Customer %s added' => 'Додат клијент %s.',
        'Role added!' => 'Додата улога!',
        'Role updated!' => 'Ажурирана улога!',
        'Attachment added!' => 'Додат прилог!',
        'Attachment updated!' => 'Ажуриран прилог!',
        'Response added!' => 'Додат одговор!',
        'Response updated!' => 'Ажуриран одговор!',
        'Group updated!' => 'Ажурирана група!',
        'Queue added!' => 'Додат ред!',
        'Queue updated!' => 'Ажуриран ред!',
        'State added!' => 'Додат статус!',
        'State updated!' => 'Ажуриран статус!',
        'Type added!' => 'Додат тип!',
        'Type updated!' => 'Ажуриран тип!',
        'Customer updated!' => 'Ажуриран клијент!',
        'Customer company added!' => 'Додата фирма клијента!',
        'Customer company updated!' => 'Ажурирана фирма клијента!',
        'Note: Company is invalid!' => 'Напомена: компанија је неисправна!',
        'Mail account added!' => 'Додат имејл налог!',
        'Mail account updated!' => 'Ажуриран мејл налог!',
        'System e-mail address added!' => 'Додата системска имејл адреса!',
        'System e-mail address updated!' => 'Ажурирана системска имејл адреса!',
        'Contract' => 'Уговор',
        'Online Customer: %s' => 'Клијент на вези: %s',
        'Online Agent: %s' => 'Оператер на вези: %s',
        'Calendar' => 'Календар',
        'File' => 'Датотека',
        'Filename' => 'Назив датотеке',
        'Type' => 'Тип',
        'Size' => 'Величина',
        'Upload' => 'Отпремање',
        'Directory' => 'Директоријум',
        'Signed' => 'Потписано',
        'Sign' => 'Потпис',
        'Crypted' => 'Шифровано',
        'Crypt' => 'Шифра',
        'PGP' => '„PGP”',
        'PGP Key' => '„PGP” кључ',
        'PGP Keys' => '„PGP” кључеви',
        'S/MIME' => 'S/MIME',
        'S/MIME Certificate' => 'S/MIME сертификат',
        'S/MIME Certificates' => 'S/MIME сертификати',
        'Office' => 'Канцеларија',
        'Phone' => 'Телефон',
        'Fax' => 'Факс',
        'Mobile' => 'Мобилни',
        'Zip' => 'ПБ',
        'City' => 'Место',
        'Street' => 'Улица',
        'Country' => 'Држава',
        'Location' => 'Локација',
        'installed' => 'инсталирано',
        'uninstalled' => 'деинсталирано',
        'Security Note: You should activate %s because application is already running!' =>
            'Безбедносна напомена: Требало би да омогућите %s, јер је апликација већ покренута!',
        'Unable to parse repository index document.' => 'Није могуће рашчланити спремиште индекса документа.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'Нема пакета за верзију вашег система, у спремишту су само пакети за друге верзије.',
        'No packages, or no new packages, found in selected repository.' =>
            'У изабраном спремишту нема пакета или нема нових пакета.',
        'Edit the system configuration settings.' => 'Уреди подешавања системске конфигурације.',
        'ACL information from database is not in sync with the system configuration, please deploy all ACLs.' =>
            ' „ACL” информације из базе података нису синхронизоване са системском конфигурацијом, молимо вас да примените све  „ACL” листе.',
        'printed at' => 'штампано у',
        'Loading...' => 'Учитавање...',
        'Dear Mr. %s,' => 'Поштовани г-дине %s,',
        'Dear Mrs. %s,' => 'Поштована г-ђо %s,',
        'Dear %s,' => 'Драги %s,',
        'Hello %s,' => 'Здраво %s,',
        'This email address is not allowed to register. Please contact support staff.' =>
            'Регистрација ове имејл адресе није дозвољено. Молимо да контактирате подршку.',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Креиран је нови налог. Подаци за пријаву послати %с. Молимо проверите ваш имејл.',
        'Please press Back and try again.' => 'Молимо притисните „Назад” и покушајте поново.',
        'Sent password reset instructions. Please check your email.' => 'Упутство за ресет лозинке је послато. Молимо проверите ваше имејлове.',
        'Sent new password to %s. Please check your email.' => 'Послата нова лозинка за %s. Молимо проверите ваше имејлове.',
        'Upcoming Events' => 'Предстојећи догађаји',
        'Event' => 'Догађај',
        'Events' => 'Догађаји',
        'Invalid Token!' => 'Неважећи Токен!',
        'more' => 'још',
        'Collapse' => 'Смањи',
        'Shown' => 'Приказан',
        'Shown customer users' => 'Приказани клијенти корисници',
        'News' => 'Новости',
        'Product News' => 'Новости о производу',
        'OTRS News' => '„OTRS” новости',
        '7 Day Stats' => 'Седмодневна статистика',
        'Process Management information from database is not in sync with the system configuration, please synchronize all processes.' =>
            'Обрађене информације из базе података нису синхронизоване са системском конфигурацијом, молимо вас да синхронизујете све процесе.',
        'Package not verified by the OTRS Group! It is recommended not to use this package.' =>
            'Пакет није верификован од стране „OTRS” групе! Препоручује се да не користите овај пакет.',
        '<br>If you continue to install this package, the following issues may occur!<br><br>&nbsp;-Security problems<br>&nbsp;-Stability problems<br>&nbsp;-Performance problems<br><br>Please note that issues that are caused by working with this package are not covered by OTRS service contracts!<br><br>' =>
            '<br>Ако наставите да инсталирате овај пакет, могу се јавити следећи проблеми!<br><br>&nbsp;-Безбедносни проблеми<br>&nbsp;-Проблеми стабилности<br>&nbsp;-Проблеми у перформансама<br><br>Напомињемо да проблеми настали услед рада са овим пакетом нису покривени „OTRS” сервисним уговором!<br><br>',
        'Mark' => 'Означено',
        'Unmark' => 'Неозначено',
        'Bold' => 'Подебљано',
        'Italic' => 'Курзив',
        'Underline' => 'Подвучено',
        'Font Color' => 'Боја слова',
        'Background Color' => 'Боја позадине',
        'Remove Formatting' => 'Уклони форматирање',
        'Show/Hide Hidden Elements' => 'Покажи/Сакриј скривене елементе',
        'Align Left' => 'Поравнај на лево',
        'Align Center' => 'Центрирај',
        'Align Right' => 'Поравнај на десно',
        'Justify' => 'Обострано поравнање',
        'Header' => 'Заглавље',
        'Indent' => 'Увлачење',
        'Outdent' => 'Извлачење',
        'Create an Unordered List' => 'Направи несређену листу',
        'Create an Ordered List' => 'Направи сређену листу',
        'HTML Link' => '„HTML” веза',
        'Insert Image' => 'Убаци слику',
        'CTRL' => '„CTRL”',
        'SHIFT' => '„SHIFT”',
        'Undo' => 'Поништи',
        'Redo' => 'Понови',
        'OTRS Daemon is not running.' => '„OTRS” сервис не ради.',
        'Can\'t contact registration server. Please try again later.' => 'Не можете да контактирате сервер за регистрацију. Молимо покушајте поново касније.',
        'No content received from registration server. Please try again later.' =>
            'Садржај није примљен од сервера за регистрацију. Молимо покушајте поново касније.',
        'Problems processing server result. Please try again later.' => 'Проблеми у обради резултата сервера. Молимо покушајте поново касније.',
        'Username and password do not match. Please try again.' => 'Корисничко име и лозинка се не поклапају. Молимо покушајте поново.',
        'The selected process is invalid!' => 'Означени процес је неважећи!',
        'Upgrade to %s now!' => 'Ажурирај сада на %s!',
        '%s Go to the upgrade center %s' => '%s Иди у центар за ажурирање %s',
        'The license for your %s is about to expire. Please make contact with %s to renew your contract!' =>
            'Лиценца за ваш %s истиче ускоро. Молимо да контактирате %s ради обнове уговора!',
        'An update for your %s is available, but there is a conflict with your framework version! Please update your framework first!' =>
            'Ажурирање за ваш %s је доступно, али постоји неусаглашеност са верзијом вашег система! Молимо вас да прво ажурирате верзију вашег система!',
        'Your system was successfully upgraded to %s.' => 'Ваш систем је успешно унапређен на %s.',
        'There was a problem during the upgrade to %s.' => 'Проблем током унапређивања на  %s.',
        '%s was correctly reinstalled.' => '%s је коректно реинсталирана.',
        'There was a problem reinstalling %s.' => 'Проблем при реинсталацији %s.',
        'Your %s was successfully updated.' => 'Ваша %s је успешно ажурирана.',
        'There was a problem during the upgrade of %s.' => 'Проблем током унапређивања %s.',
        '%s was correctly uninstalled.' => '%s је коректно деинсталирана.',
        'There was a problem uninstalling %s.' => 'Проблем при деинсталацији %s.',
        'Enable cloud services to unleash all OTRS features!' => 'Активирајте сервисе у облаку да би ослободили све „OTRS” могућности!',

        # Template: AAACalendar
        'New Year\'s Day' => 'Нова година',
        'International Workers\' Day' => 'Међународни празник рада',
        'Christmas Eve' => 'Бадње вече',
        'First Christmas Day' => 'Први дан Божића',
        'Second Christmas Day' => 'Други дан Божића',
        'New Year\'s Eve' => 'Дочек нове године',

        # Template: AAAGenericInterface
        'OTRS as requester' => '„OTRS” као наручиоц',
        'OTRS as provider' => '„OTRS” као пружаоц услуга',
        'Webservice "%s" created!' => 'Веб сервис „%s” креиран',
        'Webservice "%s" updated!' => 'Веб сервис „%s” ажуриран',

        # Template: AAAMonth
        'Jan' => 'Јан',
        'Feb' => 'Феб',
        'Mar' => 'Мар',
        'Apr' => 'Апр',
        'May' => 'Мај',
        'Jun' => 'Јун',
        'Jul' => 'Јул',
        'Aug' => 'Авг',
        'Sep' => 'Сеп',
        'Oct' => 'Окт',
        'Nov' => 'Нов',
        'Dec' => 'Дец',
        'January' => 'јануар',
        'February' => 'фебруар',
        'March' => 'март',
        'April' => 'април',
        'May_long' => 'мај',
        'June' => 'јун',
        'July' => 'јул',
        'August' => 'август',
        'September' => 'септембар',
        'October' => 'октобар',
        'November' => 'новембар',
        'December' => 'децембар',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'Поставке су успешно ажуриране!',
        'User Profile' => 'Кориснички профил',
        'Email Settings' => 'Подешавања имејла',
        'Other Settings' => 'Друга подешавања',
        'Notification Settings' => 'Подешавања обавештења',
        'Change Password' => 'Промена лозинке',
        'Current password' => 'Садашња лозинка',
        'New password' => 'Нова лозинка',
        'Verify password' => 'Потврди лозинку',
        'Spelling Dictionary' => 'Правописни речник',
        'Default spelling dictionary' => 'Подразумевани правописни речник',
        'Max. shown Tickets a page in Overview.' => 'Максимални број тикета по страници у прегледу.',
        'The current password is not correct. Please try again!' => 'Актуелна лозинка је нетачна. Молимо покушајте поново!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Лозинка не може бити ажурирана, нови уноси су различити. Молимо покушајте поново!',
        'Can\'t update password, it contains invalid characters!' => 'Лозинка не може бити ажурирана, садржи недозвољене знакове.',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Лозинка не може бити ажурирана. Минимална дужина лозинке је %s знакова.',
        'Can\'t update password, it must contain at least 2 lowercase and 2 uppercase characters!' =>
            'Лозинка не може бити ажурирана. Мора да садржи минимално 2 велика и 2 мала слова.',
        'Can\'t update password, it must contain at least 1 digit!' => 'Лозинка не може бити ажурирана. Мора да садржи најнмање једну бројку.',
        'Can\'t update password, it must contain at least 2 characters!' =>
            'Лозинка не може бити ажурирана. Мора да садржи најмање 2 знака.',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            'Лозинка не може бити ажурирана. Унета лозинка је већ у употреби. Молимо изаберите неку другу.',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Изаберите сепаратор који ће се користи у CSV датотекама (статистика и претраге). Ако овде не изаберете сепаратор, користиће се подразумевани сепаратор за ваш језик',
        'CSV Separator' => '„CSV” сепаратор',

        # Template: AAATicket
        'Status View' => 'Преглед статуса',
        'Service View' => 'Преглед услуге',
        'Bulk' => 'Масовно',
        'Lock' => 'Закључај',
        'Unlock' => 'Откључај',
        'History' => 'Историја',
        'Zoom' => 'Увећај',
        'Age' => 'Старост',
        'Bounce' => 'Преусмери',
        'Forward' => 'Проследи',
        'From' => 'Од',
        'To' => 'За',
        'Cc' => 'Cc',
        'Bcc' => 'Bcc',
        'Subject' => 'Предмет',
        'Move' => 'Премести',
        'Queue' => 'Ред',
        'Queues' => 'Редови',
        'Priority' => 'Приоритет',
        'Priorities' => 'Приоритети',
        'Priority Update' => 'Ажурирање приоритета',
        'Priority added!' => 'Додат приоритет!',
        'Priority updated!' => 'Ажуриран приоритет!',
        'Signature added!' => 'Додат потпис!',
        'Signature updated!' => 'Ажуриран потпис!',
        'SLA' => '„SLA”',
        'Service Level Agreement' => 'Споразум о нивоу услуге',
        'Service Level Agreements' => 'Споразуми о нивоу услуга',
        'Service' => 'Услуга',
        'Services' => 'Услуге',
        'State' => 'Стање',
        'States' => 'Стања',
        'Status' => 'Статус',
        'Statuses' => 'Статуси',
        'Ticket Type' => 'Тип тикета',
        'Ticket Types' => 'Типови тикета',
        'Compose' => 'Напиши',
        'Pending' => 'На чекању',
        'Owner' => 'Власник',
        'Owner Update' => 'Ажурирање власника',
        'Responsible' => 'Одговоран',
        'Responsible Update' => 'Ажурирање одговорног',
        'Sender' => 'Пошиљаоц',
        'Article' => 'Чланак',
        'Ticket' => 'Тикет',
        'Createtime' => 'Време креирања',
        'plain' => 'неформатирано',
        'Email' => 'Имејл',
        'email' => 'имејл',
        'Close' => 'Затвори',
        'Action' => 'Акција',
        'Attachment' => 'Прилог',
        'Attachments' => 'Прилози',
        'This message was written in a character set other than your own.' =>
            'Ова порука је написана скупом знакова различитим од оног који ви користите.',
        'If it is not displayed correctly,' => 'Ако није исправно приказано,',
        'This is a' => 'Ово је',
        'to open it in a new window.' => 'за отварање у новом прозору.',
        'This is a HTML email. Click here to show it.' => 'Ово је „HTML” имејл. Кликни овде за приказ.',
        'Free Fields' => 'Слободна поља',
        'Merge' => 'Споји',
        'merged' => 'спојено',
        'closed successful' => 'затворено успешно',
        'closed unsuccessful' => 'затворено неуспешно',
        'Locked Tickets Total' => 'Укупно закључних тикета',
        'Locked Tickets Reminder Reached' => 'Достигнут подсетник закључаних тикета',
        'Locked Tickets New' => 'Нови закључани тикети',
        'Responsible Tickets Total' => 'Укупно одговорних тикета',
        'Responsible Tickets New' => 'Нови одговорни тикети',
        'Responsible Tickets Reminder Reached' => 'Достигнут подсетник одговорних тикета',
        'Watched Tickets Total' => 'Укупно праћених тикета',
        'Watched Tickets New' => 'Нови праћени тикети',
        'Watched Tickets Reminder Reached' => 'Достигнут подсетник праћених тикета',
        'All tickets' => 'Сви тикети',
        'Available tickets' => 'Слободни тикети',
        'Escalation' => 'Ескалација',
        'last-search' => 'последња претрага',
        'QueueView' => 'Преглед реда',
        'Ticket Escalation View' => 'Ескалациони преглед тикета',
        'Message from' => 'Порука од',
        'End message' => 'Крај поруке',
        'Forwarded message from' => 'Прослеђена порука од',
        'End forwarded message' => 'Крај прослеђене поруке',
        'Bounce Article to a different mail address' => 'Преусмеравање чланка на другу имејл адресу',
        'Reply to note' => 'Одговори на напомену',
        'new' => 'ново',
        'open' => 'отворени',
        'Open' => 'Отворени',
        'Open tickets' => 'Отворени тикети',
        'closed' => 'затворени',
        'Closed' => 'Затворени',
        'Closed tickets' => 'Затворени тикети',
        'removed' => 'уклоњени',
        'pending reminder' => 'подсетник чекања',
        'pending auto' => 'аутоматско чекање',
        'pending auto close+' => 'чекање на аутоматско затварање+',
        'pending auto close-' => 'чекање на аутоматско затварање-',
        'email-external' => 'електронска пошта-екстерна',
        'email-internal' => 'електронска пошта-интерна',
        'note-external' => 'напомена-екстерна',
        'note-internal' => 'напомена-интерна',
        'note-report' => 'напомена-извештај',
        'phone' => 'телефон',
        'sms' => 'СМС',
        'webrequest' => 'веб захтев',
        'lock' => 'закључан',
        'unlock' => 'откључан',
        'very low' => 'врло низак',
        'low' => 'низак',
        'normal' => 'нормалан',
        'high' => 'висок',
        'very high' => 'врло висок',
        '1 very low' => '1 врло низак',
        '2 low' => '2 низак',
        '3 normal' => '3 нормалан',
        '4 high' => '4 висок',
        '5 very high' => '5 врло висок',
        'auto follow up' => 'аутоматско праћење',
        'auto reject' => 'аутоматско одбацивање',
        'auto remove' => 'аутоматско уклањање',
        'auto reply' => 'аутоматски одговор',
        'auto reply/new ticket' => 'аутоматски одговор/нови тикет',
        'Create' => 'Креирај',
        'Answer' => 'Одговор',
        'Phone call' => 'Телефонски позив',
        'Ticket "%s" created!' => 'Тикет „%s” креиран!',
        'Ticket Number' => 'Број тикета',
        'Ticket Object' => 'Објекат тикета',
        'No such Ticket Number "%s"! Can\'t link it!' => 'Не постоји тикет број „%s”! Не може се повезати!',
        'You don\'t have write access to this ticket.' => 'Немате право уписа у овај тикет.',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'На жалост, морате бити власник тикета за ову акцију.',
        'Please change the owner first.' => 'Молимо прво промените власника.',
        'Ticket selected.' => 'Изабран тикет.',
        'Ticket is locked by another agent.' => 'Тикет је закључан од стране другог оператера.',
        'Ticket locked.' => 'Закључан тикет.',
        'Don\'t show closed Tickets' => 'Не приказуј затворене тикете',
        'Show closed Tickets' => 'Прикажи затворене тикете',
        'New Article' => 'Нови чланак',
        'Unread article(s) available' => 'Располиживи непрочитани чланци',
        'Remove from list of watched tickets' => 'Уклони са листе праћених тикета',
        'Add to list of watched tickets' => 'Додај на листу праћених тикета',
        'Email-Ticket' => 'Имејл-Тикет',
        'Create new Email Ticket' => 'Креира нови Имејл тикет',
        'Phone-Ticket' => 'Телефонски тикет',
        'Search Tickets' => 'Тражење тикета',
        'Customer Realname' => 'Право име клијента',
        'Customer History' => 'Историјат клијента',
        'Edit Customer Users' => 'Измени клијенте кориснике',
        'Edit Customer' => 'Измени клијента',
        'Bulk Action' => 'Масовна акција',
        'Bulk Actions on Tickets' => 'Масовне акције на тикетима',
        'Send Email and create a new Ticket' => 'Пошањи Имејл и креирај нови тикет',
        'Create new Email Ticket and send this out (Outbound)' => 'Отвори нови Имејл тикет и пошаљи ово (одлазни)',
        'Create new Phone Ticket (Inbound)' => 'Креирај нови телефонски тикет (долазни позив)',
        'Address %s replaced with registered customer address.' => 'Адреса %s је замењена регистровном адресом клијента.',
        'Customer user automatically added in Cc.' => 'Клијент клијент се аутоматски додаје у Cc.',
        'Overview of all open Tickets' => 'Преглед свих отворених тикета',
        'Locked Tickets' => 'Закључани тикети',
        'My Locked Tickets' => 'Моји закључани тикети',
        'My Watched Tickets' => 'Моји надзирани тикети',
        'My Responsible Tickets' => 'Тикети за које сам одговоран',
        'Watched Tickets' => 'Посматрани тикет',
        'Watched' => 'Надзирано',
        'Watch' => 'Посматрај',
        'Unwatch' => 'Прекини надзор',
        'Lock it to work on it' => 'Закључајте за рад на тикету',
        'Unlock to give it back to the queue' => 'Откључајте за враћање у ред',
        'Show the ticket history' => 'Прикажи историју тикета',
        'Print this ticket' => 'Одштампај овај тикет',
        'Print this article' => 'Одштампај овај чланак',
        'Split' => 'Подели',
        'Split this article' => 'Подели овај чланак',
        'Forward article via mail' => 'Проследи чланак путем мејла',
        'Change the ticket priority' => 'Промени приоритет тикета',
        'Change the ticket free fields!' => 'Промени слободна поља тикета',
        'Link this ticket to other objects' => 'Увежи овај тикет са другим објектом',
        'Change the owner for this ticket' => 'Промени власника овог тикета',
        'Change the  customer for this ticket' => 'Промени клијента за овај тикет',
        'Add a note to this ticket' => 'Додај напомену овом тикету',
        'Merge into a different ticket' => 'Припоји различитом тикету',
        'Set this ticket to pending' => 'Постави овај тикет у статус чекања',
        'Close this ticket' => 'Затвори овај тикет',
        'Look into a ticket!' => 'Погледај садржај тикета!',
        'Delete this ticket' => 'Обришите овај тикет',
        'Mark as Spam!' => 'Означи као Спам!',
        'My Queues' => 'Моји редови',
        'Shown Tickets' => 'Приказани тикети',
        'Shown Columns' => 'Приказане колоне',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Ваш имејл са бројем тикета „<OTRS_TICKET>” је припојен тикету „<OTRS_MERGE_TO_TICKET>”!',
        'Ticket %s: first response time is over (%s)!' => 'Тикет %s: време одзива је преко (%s)!',
        'Ticket %s: first response time will be over in %s!' => 'Тикет %s: време одзива истиче за %s!',
        'Ticket %s: update time is over (%s)!' => 'Тикет %s: време ажурирања је преко (%s)!',
        'Ticket %s: update time will be over in %s!' => 'Тикет %s: време ажурирања истиче за %s!',
        'Ticket %s: solution time is over (%s)!' => 'Тикет %s: време решавања је преко (%s)!',
        'Ticket %s: solution time will be over in %s!' => 'Тикет %s: време решавања истиче за %s!',
        'There are more escalated tickets!' => 'Има још ескалиралих тикета!',
        'Plain Format' => 'Неформатиран формат',
        'Reply All' => 'Одговори на све',
        'Direction' => 'Смер',
        'New ticket notification' => 'Обавештење о новом тикету',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Пошаљи ми обавештење за нови тикет у „Моји Редови”.',
        'Send new ticket notifications' => 'Пошаљи обавештења о новим тикетима',
        'Ticket follow up notification' => 'Обавештење о наставку тикета',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            'Пошаљи ми обавештење ако овај клијент пошаље наставак, а јасам власник тикета или је тикет откључан и налази се у једном од редова на које сам претплаћен.',
        'Send ticket follow up notifications' => 'Пошаљи обавештења о наставку тикета',
        'Ticket lock timeout notification' => 'Обавештење о истицању закључавања тикета',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Пошаљи ми обавештење ако систем откључа тикет.',
        'Send ticket lock timeout notifications' => 'Пошаљи обавештење о истеку закључавања тикета',
        'Ticket move notification' => 'Обавештење о померању тикета',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Пошаљи ми обавештење кад се тикет премести у „Моји Редове”.',
        'Send ticket move notifications' => 'Пошаљи обавештење о померању тикета',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            'Изабрани омиљени редови. Ако је активирано, добићете и обавештење о овим редовима.',
        'Custom Queue' => 'Прилагођен ред',
        'QueueView refresh time' => 'Време освежавања реда',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            'Ако је укључено, преглед реда ће бити освежен после задатог времена.',
        'Refresh QueueView after' => 'Освежи преглед реда после',
        'Screen after new ticket' => 'Приказ екрана после отварања новог тикета',
        'Show this screen after I created a new ticket' => 'Прикажи овај екран после отварања новог тикета',
        'Closed Tickets' => 'Затворени тикети',
        'Show closed tickets.' => 'Прикажи затворене тикете.',
        'Max. shown Tickets a page in QueueView.' => 'Максимални број приказаних тикета у прегледу реда.',
        'Ticket Overview "Small" Limit' => 'Ограничење прегледа тикета „мало”',
        'Ticket limit per page for Ticket Overview "Small"' => 'Ограничење тикета по страни за преглед „мало”',
        'Ticket Overview "Medium" Limit' => 'Ограничење прегледа тикета „средње”',
        'Ticket limit per page for Ticket Overview "Medium"' => 'Ограничење тикета по страни за преглед „средње”',
        'Ticket Overview "Preview" Limit' => 'Ограничење прегледа тикета „Приказ”',
        'Ticket limit per page for Ticket Overview "Preview"' => 'Ограничење тикета по страни за преглед „Приказ”',
        'Ticket watch notification' => 'Обавештење о праћењу тикета',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            'Пошаљи ми исто обавештење за праћене тикете које ће добити власник.',
        'Send ticket watch notifications' => 'Пошаљи обавештење о праћењу тикета',
        'Out Of Office Time' => 'Време ван канцеларије',
        'New Ticket' => 'Нови тикет',
        'Create new Ticket' => 'Направи нови тикет',
        'Customer called' => 'Позвани клијент',
        'phone call' => 'телефонски позив',
        'Phone Call Outbound' => 'Одлазни телефонски позив',
        'Phone Call Inbound' => 'Долазни телефонски позив',
        'Reminder Reached' => 'Достигнут подсетник',
        'Reminder Tickets' => 'Тикети подсетника',
        'Escalated Tickets' => 'Ескалирани тикети',
        'New Tickets' => 'Нови тикети',
        'Open Tickets / Need to be answered' => 'Отворени тикети / Потребно одговорити',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            'Сви отворени тикети, на овима је већ рађено, али на њих треба одговорити',
        'All new tickets, these tickets have not been worked on yet' => 'Сви нови тикети, на њима још није ништа рађено',
        'All escalated tickets' => 'Сви ескалирани тикети',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Сви тикети са подешеним подсетником, а датум подсетника је достигнут',
        'Archived tickets' => 'Архивирани тикети',
        'Unarchived tickets' => 'Неархивирани тикети',
        'Ticket Information' => 'Информације о тикету',
        'including subqueues' => 'укључујући подредове',
        'excluding subqueues' => 'искључујући подредове',

        # Template: AAAWeekDay
        'Sun' => 'нед',
        'Mon' => 'пон',
        'Tue' => 'уто',
        'Wed' => 'сре',
        'Thu' => 'чет',
        'Fri' => 'пет',
        'Sat' => 'суб',

        # Template: AdminACL
        'ACL Management' => 'Управљање „ACL”',
        'Filter for ACLs' => 'Филтер за ACL',
        'Filter' => 'Филтер',
        'ACL Name' => 'Назив „ACL”',
        'Actions' => 'Акције',
        'Create New ACL' => 'Креирај нову „ACL”',
        'Deploy ACLs' => 'Употреби „ACL” листе',
        'Export ACLs' => 'Извези „ACL” листе',
        'Configuration import' => 'Увоз конфигурације',
        'Here you can upload a configuration file to import ACLs to your system. The file needs to be in .yml format as exported by the ACL editor module.' =>
            'Овде можете послати конфигурациону датотеку за увоз „ACL” листа у ваш систем. Датотека мора бити у „.yml” формату ако се извози од стране „ACL” едитор модула.',
        'This field is required.' => 'Ово поље је обавезно.',
        'Overwrite existing ACLs?' => 'Напиши преко постојећих „ACL” листа?',
        'Upload ACL configuration' => 'Отпреми „ACL” конфигурацију',
        'Import ACL configuration(s)' => 'Увези „ACL” конфигурацију(е)',
        'To create a new ACL you can either import ACLs which were exported from another system or create a complete new one.' =>
            'Да бисте креирали нову „ACL” можете или увести „ACL” листе које су извезене из другог система или направити комплетно нову.',
        'Changes to the ACLs here only affect the behavior of the system, if you deploy the ACL data afterwards. By deploying the ACL data, the newly made changes will be written to the configuration.' =>
            'Промене на „ACL” листама овде само утичу на понашање система, уколико накнадно употребите све „ACL” податке.',
        'ACLs' => '„ACL” листе',
        'Please note: This table represents the execution order of the ACLs. If you need to change the order in which ACLs are executed, please change the names of the affected ACLs.' =>
            'Напомена: Ова табела представља редослед извршавања у „ACL” листама. Ако је потребно да промените редослед којим се извршавају „ACL” листе, молимо промените имена тих „ACL” листа.',
        'ACL name' => 'Назив „ACL”',
        'Validity' => 'Важност',
        'Copy' => 'Копија',
        'No data found.' => 'Ништа није пронађено.',

        # Template: AdminACLEdit
        'Edit ACL %s' => 'Уреди „ACL” %s',
        'Go to overview' => 'Иди на преглед',
        'Delete ACL' => 'Обриши „ACL”',
        'Delete Invalid ACL' => 'Обриши неважећу „ACL”',
        'Match settings' => 'Усклади подешавања',
        'Set up matching criteria for this ACL. Use \'Properties\' to match the current screen or \'PropertiesDatabase\' to match attributes of the current ticket that are in the database.' =>
            'Подесите усклађене критеријуме за ову „ACL” листу. Користите \'Properties\' тако да одговара постојећем приказу екрана или \'PropertiesDatabase\' да би одговарао атрибутима постојећег тикета који су у бази података.',
        'Change settings' => 'Промени подешавања',
        'Set up what you want to change if the criteria match. Keep in mind that \'Possible\' is a white list, \'PossibleNot\' a black list.' =>
            'Подесите оно што желите да мењате ако се критеријуми слажу. Имајте на уму да је \'Possible\' бела листа, \'PossibleNot\' црна листа.',
        'Check the official' => 'Проверите званично',
        'documentation' => 'документација',
        'Show or hide the content' => 'Покажи или сакриј садржај',
        'Edit ACL information' => 'Уреди „ACL” iинформације',
        'Stop after match' => 'Заустави после поклапања',
        'Edit ACL structure' => 'Уреди „ACL” структуру',
        'Save settings' => 'Сачувај подешавања',
        'Save ACL' => 'Сачувај „ACL”',
        'Save' => 'Сачувај',
        'or' => 'или',
        'Save and finish' => 'Сачувај и заврши',
        'Do you really want to delete this ACL?' => 'Да ли заиста желите да обришете ову „ACL” листу?',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?' =>
            'Ова ставка и даље садржи подставке. Да ли сте сигурни да желите да уклоните ову ставку укључујући и њене подставке?',
        'An item with this name is already present.' => 'Већ је присутна тавка под овим именом.',
        'Add all' => 'Додај све',
        'There was an error reading the ACL data.' => 'Дошло је до грешке приликом читања „ACL” података.',

        # Template: AdminACLNew
        'Create a new ACL by submitting the form data. After creating the ACL, you will be able to add configuration items in edit mode.' =>
            'Креирајте нову „ACL” листу подношењем обрасца са подацима. Након креирања „ACL” листе, бићете у могућности да додате конфигурационе ставке у моду измене.',

        # Template: AdminAttachment
        'Attachment Management' => 'Управљање прилозима',
        'Add attachment' => 'Додај прилог',
        'List' => 'Листа',
        'Download file' => 'Преузми датотеку',
        'Delete this attachment' => 'Обриши овај прилог',
        'Do you really want to delete this attachment?' => 'Да ли стварно желите да обришете овај прилог?',
        'Add Attachment' => 'Додај прилог',
        'Edit Attachment' => 'Уреди прилог',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Управљање аутоматским одговорима',
        'Add auto response' => 'Додај аутоматски одговор',
        'Add Auto Response' => 'Додај Аутоматски Одговор',
        'Edit Auto Response' => 'Уреди Аутоматски Одговор',
        'Response' => 'Одговор',
        'Auto response from' => 'Аутоматски одговор од',
        'Reference' => 'Референца',
        'You can use the following tags' => 'Можете користити следеће ознаке',
        'To get the first 20 character of the subject.' => 'Да видите првих 20 слова предмета',
        'To get the first 5 lines of the email.' => 'Да видите првих 5 линија имејла.',
        'To get the name of the ticket\'s customer user (if given).' => 'Да прибавите назив клијента корисника за тикет (ако је дат).',
        'To get the article attribute' => 'Да видите атрибуте чланка',
        ' e. g.' => 'нпр.',
        'Options of the current customer user data' => 'Опције података о актуелном клијенту кориснику',
        'Ticket owner options' => 'Опције власника тикета',
        'Ticket responsible options' => 'Опције одговорног за тикет',
        'Options of the current user who requested this action' => 'Опције актуелног корисника који је тражио ову акцију',
        'Options of the ticket data' => 'Опције података о тикету',
        'Options of ticket dynamic fields internal key values' => 'Опције за вредности интерних кључева динамичких поља тикета.',
        'Options of ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Опције за приказане вредности динамичких поља тикета, корисно за поља Dropdown и Multiselect',
        'Config options' => 'Конфигурационе опције',
        'Example response' => 'Пример одговора',

        # Template: AdminCloudServiceSupportDataCollector
        'Cloud Service Management' => 'Управљање сервисима у облаку',
        'Support Data Collector' => 'Сакупљач података подршке',
        'Support data collector' => 'Сакупљач података подршке',
        'Hint' => 'Савет',
        'Currently support data is only shown in this system.' => 'Актуелни подаци подршке се приказују само на овом систему.',
        'It is highly recommended to send this data to OTRS Group in order to get better support.' =>
            'Препоручује се да ове податке пошаљете „OTRS” Групи да би сте добили бољу подршку.',
        'Configuration' => 'Конфигурација',
        'Send support data' => 'Пошаљи податке за подршку',
        'This will allow the system to send additional support data information to OTRS Group.' =>
            'Ово ће омогућити систему да пошаље додатне информације о подацима подршке  „OTRS” Групацији.',
        'System Registration' => 'Регистрација система',
        'To enable data sending, please register your system with OTRS Group or update your system registration information (make sure to activate the \'send support data\' option.)' =>
            'Да би сте омогућили слање података, молимо вас да региструјете ваш систем у „OTRS” Групи или да ажурирате информације системске регистрације (будите сигурни да сте активирали опцију „send support data”.).',
        'Register this System' => 'Региструј овај систем',
        'System Registration is disabled for your system. Please check your configuration.' =>
            'Системска регистрације је деактивирана за ваш систем. Молимо да проверите вашу конфигурацију.',

        # Template: AdminCloudServices
        'System registration is a service of OTRS Group, which provides a lot of advantages!' =>
            'Регистрација система је услуга „OTRS” Групе, која обезбеђује многе предности!',
        'Please note that the use of OTRS cloud services requires the system to be registered.' =>
            'Напомињемо да коришћење „OTRS” сервиса у облаку захтевају да систем буде регистрован.',
        'Register this system' => 'Региструј овај систем',
        'Here you can configure available cloud services that communicate securely with %s.' =>
            'Овде можете подесити да доступни сервиси у облаку користе сигурну комуникацију преко %s.',
        'Available Cloud Services' => 'Расположиви сервиси у облаку',
        'Upgrade to %s' => 'Унапреди на %s',

        # Template: AdminCustomerCompany
        'Customer Management' => 'Управљање клијентима',
        'Wildcards like \'*\' are allowed.' => 'Џокерски знаци као \'*\' су дозвољени',
        'Add customer' => 'Додај клијента',
        'Select' => 'Изабери',
        'List (only %s shown - more available)' => 'Листа (само %s је приказано - расположиво више)',
        'List (%s total)' => 'Листа (%s укупно)',
        'Please enter a search term to look for customers.' => 'Молимо унесите појам претраге за проналажење клијената.',
        'Add Customer' => 'Додај клијента',

        # Template: AdminCustomerUser
        'Customer User Management' => 'Управљање клијентима клијентима',
        'Back to search results' => 'Врати се на резултате претраге',
        'Add customer user' => 'Додај клијента корисника',
        'Customer user are needed to have a customer history and to login via customer panel.' =>
            'Клијент клијент треба да има клијентски историјат и да се пријави преко клијентског панела.',
        'Last Login' => 'Последња пријава',
        'Login as' => 'Пријави се као',
        'Switch to customer' => 'Пређи на клијента',
        'Add Customer User' => 'Додај клијента корисника',
        'Edit Customer User' => 'Уреди клијента корисника',
        'This field is required and needs to be a valid email address.' =>
            'Ово је обавезно поље и мора да буде исправна имејл адреса.',
        'This email address is not allowed due to the system configuration.' =>
            'Ова имејл адреса није дозвољена због системске конфигурације.',
        'This email address failed MX check.' => 'Ова имејл адреса не задовољава „MX” проверу.',
        'DNS problem, please check your configuration and the error log.' =>
            '„DNS” проблем, молимо проверите конфигурацију и грешаке у логу',
        'The syntax of this email address is incorrect.' => 'Синтакса ове имејл адресе је неисправна.',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => 'Управљање релацијама Клијент-Група',
        'Notice' => 'Напомена',
        'This feature is disabled!' => 'Ова функција је искључена!',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Употребите ову функцију ако желите да дефинишете групне дозволе за клијенте.',
        'Enable it here!' => 'Активирајте је овде!',
        'Edit Customer Default Groups' => 'Уреди подразумеване групе за клијента',
        'These groups are automatically assigned to all customers.' => 'Ове групе су аутоматски додељене свим клијентима.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'Можете управљати овим групама преко конфигурационих подешавања „CustomerGroupAlwaysGroups”.',
        'Filter for Groups' => 'Филтер за групе',
        'Just start typing to filter...' => 'Почните са куцањем за филтер...',
        'Select the customer:group permissions.' => 'Изабери „customer:group” дозволе.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Ако ништа није изабрано, онда нема дозвола у овој групи (тикети неће бити доступни клијенту).',
        'Search Results' => 'Резултат претраге',
        'Customers' => 'Клијенти',
        'No matches found.' => 'Ништа није пронађено.',
        'Groups' => 'Групе',
        'Change Group Relations for Customer' => 'Промени везе са групама за клијента',
        'Change Customer Relations for Group' => 'Промени везе са клијентима за групу',
        'Toggle %s Permission for all' => 'Промени %s дозволе за све',
        'Toggle %s permission for %s' => 'Промени %s дозволе за %s',
        'Customer Default Groups:' => 'Подразумеване групе за клијента:',
        'No changes can be made to these groups.' => 'На овим групама промене нису могуће.',
        'ro' => '„ro”',
        'Read only access to the ticket in this group/queue.' => 'Приступ ограничен само на читање за тикете у овим групама/редовима.',
        'rw' => '„rw”',
        'Full read and write access to the tickets in this group/queue.' =>
            'Приступ без ограничења за тикете у овим групама/редовима.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => 'Управљање везама Клијент-Услуге',
        'Edit default services' => 'Уреди подразумеване услуге',
        'Filter for Services' => 'Филтер за сервисе',
        'Allocate Services to Customer' => 'Придружи сервисе клијенту',
        'Allocate Customers to Service' => 'Придружи клијенте сервису',
        'Toggle active state for all' => 'Промени активно стање за све',
        'Active' => 'Активно',
        'Toggle active state for %s' => 'Промени активно стање за %s',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => 'Управљање динамичким пољима',
        'Add new field for object' => 'Додај ново поље објекту',
        'To add a new field, select the field type from one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'За додавање новог поља изаберите тип поља из једне од листа објеката. Објект дефинише границе поља и после креирања поља се не може мењати.',
        'Dynamic Fields List' => 'Листа динамичких поља',
        'Dynamic fields per page' => 'Број динамичких поља по страни',
        'Label' => 'Ознака',
        'Order' => 'Сортирање',
        'Object' => 'Објекат',
        'Delete this field' => 'Обриши ово поље',
        'Do you really want to delete this dynamic field? ALL associated data will be LOST!' =>
            'Да ли заиста желите да обришете ово динамичко поље? Сви повезани подаци ће бити ИЗГУБЉЕНИ!',
        'Delete field' => 'Обриши поље',
        'Deleting the field and its data. This may take a while...' => 'Брисање поља и података. Ово може мало потрајати...',

        # Template: AdminDynamicFieldCheckbox
        'Dynamic Fields' => 'Динамичка поља',
        'Field' => 'Поље',
        'Go back to overview' => 'Иди назад на преглед',
        'General' => 'Опште',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Ово поље је обавезно и може садржати само од слова и бројеве.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Мора бити јединствено и прихвата само слова и бројеве.',
        'Changing this value will require manual changes in the system.' =>
            'Измена овог поља ће захтевати ручне промене у систему.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Ово је назив који ће се приказивати на екранима где је поље активно.',
        'Field order' => 'Редослед поља',
        'This field is required and must be numeric.' => 'Ово поље је обавезно и мора бити нумеричко.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Ово је редослед по ком ће поља бити приказана на екранима где су активна.',
        'Field type' => 'Тип поља',
        'Object type' => 'Тип објекта',
        'Internal field' => 'Интерно поље',
        'This field is protected and can\'t be deleted.' => 'Ово поље је заштићено и не може бити обрисано.',
        'Field Settings' => 'Подешавање поља',
        'Default value' => 'Подразумевана вредност',
        'This is the default value for this field.' => 'Ово је подразумевана вредност за ово поље.',

        # Template: AdminDynamicFieldDateTime
        'Default date difference' => 'Подразумевана разлика датума',
        'This field must be numeric.' => 'Ово поље мора бити нумеричко.',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'Разлика (у секундама) од САДА, за израчунавање подразумеване вредности поља (нпр. 3600 или -60).',
        'Define years period' => 'Дефиниши пероиод  у годинама',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            'Активирајте ову опцију ради дефинисања фиксног опсега година (у будућност и прошлост) за приказ при избору година у пољу.',
        'Years in the past' => 'Године у прошлости',
        'Years in the past to display (default: 5 years).' => 'Године у прошлости за приказ (подразумевано је 5 година).',
        'Years in the future' => 'Године у будућности',
        'Years in the future to display (default: 5 years).' => 'Године у будућности за приказ (подразумевано је 5 година).',
        'Show link' => 'Покажи везу',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'Овде можете да унесете опциону HTTP везу за вредност поља у прозору општег и увећаног приказа екрана.',
        'Link for preview' => 'Веза за преглед',
        'If filled in, this URL will be used for a preview which is shown when this link is hovered in ticket zoom. Please note that for this to work, the regular URL field above needs to be filled in, too.' =>
            'Ако је попуњено, овај „URL” ће се користити за преглед који се приказује када је показивач изнад везе у детаљима тикета. Узмите у обзир, да би ово радило, нормално „URL” поље изнад, мора такође да буде попуњено.',
        'Restrict entering of dates' => 'Ограничи унос датума',
        'Here you can restrict the entering of dates of tickets.' => 'Овде можете ограничити унос датума за тикете.',

        # Template: AdminDynamicFieldDropdown
        'Possible values' => 'Могуће вредности',
        'Key' => 'Кључ',
        'Value' => 'Вредност',
        'Remove value' => 'Уклони вредност',
        'Add value' => 'Додај вредност',
        'Add Value' => 'Додај Вредност',
        'Add empty value' => 'Додај без вредности',
        'Activate this option to create an empty selectable value.' => 'Активирај ову опцију за креирање избора без вредности.',
        'Tree View' => 'Приказ у облику стабла',
        'Activate this option to display values as a tree.' => 'Активирај ову опцију за приказ вредности у облику стабла.',
        'Translatable values' => 'Преводљиве вредности',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Ако активирате ову опцију вредности ће бити преведене на изабрани језик.',
        'Note' => 'Напомена',
        'You need to add the translations manually into the language translation files.' =>
            'Ове преводе морате ручно додати у датотеке превода.',

        # Template: AdminDynamicFieldText
        'Number of rows' => 'Број редова',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'Унеси висину (у линијама) за ово поље у моду обраде.',
        'Number of cols' => 'Број колона',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'Унеси ширину (у знаковима) за ово поље у моду уређивања.',
        'Check RegEx' => 'Провери „RegEx”',
        'Here you can specify a regular expression to check the value. The regex will be executed with the modifiers xms.' =>
            'Овде можете да дефинишете регуларни израз за проверу вредности. Израз ће бити извршен са модификаторима за xms.',
        'RegEx' => '„RegEx”',
        'Invalid RegEx' => 'Неважећи „RegEx”',
        'Error Message' => 'Порука о грешци',
        'Add RegEx' => 'Додај „RegEx”',

        # Template: AdminEmail
        'Admin Notification' => 'Администраторска обавештења',
        'With this module, administrators can send messages to agents, group or role members.' =>
            'Са овим модулом, администратори могу слати поруке оператерима, групама или припадницима улоге.',
        'Create Administrative Message' => 'Креирај административну поруку',
        'Your message was sent to' => 'Ваша порука је послата',
        'Send message to users' => 'Пошаљи поруку корисницима',
        'Send message to group members' => 'Пошаљи поруку члановима групе',
        'Group members need to have permission' => 'Чланови групе треба да имају дозволу',
        'Send message to role members' => 'Пошаљи поруку припадницима улоге',
        'Also send to customers in groups' => 'Такође пошаљи клијентима у групама',
        'Body' => 'Садржај',
        'Send' => 'Шаљи',

        # Template: AdminGenericAgent
        'Generic Agent' => 'Генерички оператер',
        'Add job' => 'Додај посао',
        'Last run' => 'Последње покретање',
        'Run Now!' => 'Покрени сад!',
        'Delete this task' => 'Обриши овај задатак',
        'Run this task' => 'Покрени овај задатак',
        'Do you really want to delete this task?' => 'Да ли стварно желите да обришете овај задатак?',
        'Job Settings' => 'Подешавање посла',
        'Job name' => 'Назив посла',
        'The name you entered already exists.' => 'Име које сте унели већ постоји.',
        'Toggle this widget' => 'Преклопи овај апликативни додатак (widget)',
        'Automatic execution (multiple tickets)' => 'Аутоматско извршење (вишеструки тикети)',
        'Execution Schedule' => 'Распоред извршења',
        'Schedule minutes' => 'Планирано минута',
        'Schedule hours' => 'Планирано сати',
        'Schedule days' => 'Планирано дана',
        'Currently this generic agent job will not run automatically.' =>
            'Тренутно овај генерички агентски задатак неће радити аутоматски.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Да бисте омогућили аутоматско извршавање изаберите бар једну вредност од минута, сати и дана!',
        'Event based execution (single ticket)' => 'Извршење засновано на догађају (појединачни тикет)',
        'Event Triggers' => 'Окидачи догађаја',
        'List of all configured events' => 'Листа свих конфигурисаних догађаја',
        'Delete this event' => 'Обриши овај догађај',
        'Additionally or alternatively to a periodic execution, you can define ticket events that will trigger this job.' =>
            'Додатно или алтернативно за периодично извршење, можете дефинисати догађаје тикета који ће покренути овај посао.',
        'If a ticket event is fired, the ticket filter will be applied to check if the ticket matches. Only then the job is run on that ticket.' =>
            'Уколико је догађај тикета отказао, биће примењен тикет филтер да потврди да ли тикет одговара. Само тада ће се посао на тикету покренути.',
        'Do you really want to delete this event trigger?' => 'Да ли стварно желите да обришете овај окидач догађаја?',
        'Add Event Trigger' => 'Додај окидач догађаја',
        'Add Event' => 'Додај догађај',
        'To add a new event select the event object and event name and click on the "+" button' =>
            'За додавање новог догађаја изаберите објект догађаја и име догађаја па кликните на „+” дугме',
        'Duplicate event.' => 'Направи дупликат догађаја.',
        'This event is already attached to the job, Please use a different one.' =>
            'Овај догађај је приложен послу. Молимо користите неки други.',
        'Delete this Event Trigger' => 'Obriši ovaj okidač događaja',
        'Remove selection' => 'Уклони избор',
        'Select Tickets' => 'Изабери тикете',
        '(e. g. 10*5155 or 105658*)' => 'нпр. 10*5144 или 105658*',
        '(e. g. 234321)' => 'нпр. 234321',
        'Customer user' => 'Клијент корисник',
        '(e. g. U5150)' => '(нпр. U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Потпуна текстуална претрага у чланку (нпр. „Mar*in” или „Baue*”)',
        'Agent' => 'Оператер',
        'Ticket lock' => 'Тикет закључан',
        'Create times' => 'Времена отварања',
        'No create time settings.' => 'Нема подешавања времена отварања.',
        'Ticket created' => 'Тикет отворен',
        'Ticket created between' => 'Тикет отворен између',
        'Last changed times' => 'Време задње промене',
        'No last changed time settings.' => 'Није подешено време последње промене.',
        'Ticket last changed' => 'Време задње промене тикета',
        'Ticket last changed between' => 'Задња промена тикета између',
        'Change times' => 'Промена времена',
        'No change time settings.' => 'Нема промене времена',
        'Ticket changed' => 'Промењен тикет',
        'Ticket changed between' => 'Тикет промењен између',
        'Close times' => 'Времена затварања',
        'No close time settings.' => 'Није подешено време затварања.',
        'Ticket closed' => 'Тикет затворен',
        'Ticket closed between' => 'Тикет затворен између',
        'Pending times' => 'Времена чекања',
        'No pending time settings.' => 'Нема подешавања времена чекања',
        'Ticket pending time reached' => 'Достигнуто време чекања тикета',
        'Ticket pending time reached between' => 'Време чекања тикета достигнуто између',
        'Escalation times' => 'Времена ескалације',
        'No escalation time settings.' => 'Нема подешавања времена ескалације',
        'Ticket escalation time reached' => 'Достигнуто време ескалације тикета',
        'Ticket escalation time reached between' => 'Време ескалације тикета достигнуто између',
        'Escalation - first response time' => 'Ескалација - време првог одзива',
        'Ticket first response time reached' => 'Достигнуто време првог одзива на тикет',
        'Ticket first response time reached between' => 'Време првог одзива на тикет достигнуто између',
        'Escalation - update time' => 'Ескалација - време ажурирања',
        'Ticket update time reached' => 'Достигнуто време ажурирања тикета',
        'Ticket update time reached between' => 'Време ажурирања тикета достигнуто између',
        'Escalation - solution time' => 'Ескалација - време решавања',
        'Ticket solution time reached' => 'Достигнуто време решавања тикета',
        'Ticket solution time reached between' => 'Време решавања тикета достигнуто између',
        'Archive search option' => 'Опције претраге архива',
        'Update/Add Ticket Attributes' => 'Ажурирај/Додај атрибуте тикета',
        'Set new service' => 'Постави нове услуге',
        'Set new Service Level Agreement' => 'Постави нови Споразум о нивоу услуга',
        'Set new priority' => 'Постави нови приоритет',
        'Set new queue' => 'Постави нови ред',
        'Set new state' => 'Постави ново стање',
        'Pending date' => 'Чекање до',
        'Set new agent' => 'Постави новог оператера',
        'new owner' => 'нови власник',
        'new responsible' => 'нови одговорни',
        'Set new ticket lock' => 'Постави ново закључавање тикета',
        'New customer user' => 'Нови клијент корисник',
        'New customer ID' => 'Нови ИД клијента',
        'New title' => 'Нови наслов',
        'New type' => 'Нови тип',
        'New Dynamic Field Values' => 'Нове вредности динамичких поља',
        'Archive selected tickets' => 'Архивирај изабране тикете',
        'Add Note' => 'Додај напомену',
        'Time units' => 'Временске јединице',
        'Execute Ticket Commands' => 'Изврши команде тикета',
        'Send agent/customer notifications on changes' => 'Пошаљи обавештења оператеру/клијенту при променама',
        'CMD' => 'CMD',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Ова наредба ће бити извршена. ARG[0] је број тикета, а ARG[1] ИД тикета.',
        'Delete tickets' => 'Обриши тикете',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'УПОЗОРЕЊЕ: Сви обухваћени тикети ће бити неповратно уклоњени из базе!',
        'Execute Custom Module' => 'Покрени извршавање посебног модула',
        'Param %s key' => 'Кључ параметра %s',
        'Param %s value' => 'Вредност параметра %s',
        'Save Changes' => 'Сачувај промене',
        'Results' => 'Резултати',
        '%s Tickets affected! What do you want to do?' => '%s тикета је обухваћено. Шта желите да урадите?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'УПОЗОРЕЊЕ: Употребили сте опцију за брисање. Сви обрисани тикети ће бити изгубљени!',
        'Warning: There are %s tickets affected but only %s may be modified during one job execution!' =>
            'Упозорење: Обухваћено је %s тикета али само %s може бити измењено током једног извршавања посла!',
        'Edit job' => 'Уреди посао',
        'Run job' => 'Покрени посао',
        'Affected Tickets' => 'Обухваћени тикети',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => 'Отклањање грешака у општем интерфејсу веб сервиса %s',
        'You are here' => 'Ви сте овде',
        'Web Services' => 'Веб сервиси',
        'Debugger' => 'Програм за отклањање грешака',
        'Go back to web service' => 'Иди назад на веб сервис',
        'Clear' => 'Очисти',
        'Do you really want to clear the debug log of this web service?' =>
            'Да ли стварно желите да очистите отклањање грешака у логу овог веб сервиса?',
        'Request List' => 'Листа захтева',
        'Time' => 'Време',
        'Remote IP' => 'Удаљена „IP” адреса',
        'Loading' => 'Учитавам...',
        'Select a single request to see its details.' => 'Изаберите један захтев да би видели његове детаље.',
        'Filter by type' => 'Филтер по типу',
        'Filter from' => 'Филтер од',
        'Filter to' => 'Филтер до',
        'Filter by remote IP' => 'Филтер по удаљеној „IP” адреси',
        'Limit' => 'Ограничење',
        'Refresh' => 'Освежавање',
        'Request Details' => 'Детаљи захтева',
        'An error occurred during communication.' => 'Дошло је до грешке приликом комуникације.',
        'Show or hide the content.' => 'Покажи или сакриј садржај.',
        'Clear debug log' => 'Очисти отклањање грешака у логу',

        # Template: AdminGenericInterfaceInvokerDefault
        'Add new Invoker to Web Service %s' => 'Додај новог позиваоца у веб сервис %s',
        'Change Invoker %s of Web Service %s' => 'Промените позиваоца %s за веб сервис %s',
        'Add new invoker' => 'Додај новог позиваоца',
        'Change invoker %s' => 'Промени позиваоца %s',
        'Do you really want to delete this invoker?' => 'Да ли заиста желите да избришете овог позиваоца?',
        'All configuration data will be lost.' => 'Сви конфигурациони подаци ће бити изгубљени.',
        'Invoker Details' => 'Детаљи позиваоца',
        'The name is typically used to call up an operation of a remote web service.' =>
            'Име се обично користи за покретање операције удаљеног веб сервиса.',
        'Please provide a unique name for this web service invoker.' => 'Молимо употребите јединствено име за овог позиваоца веб сервиса.',
        'Invoker backend' => 'Позадински приказ позиваоца',
        'This OTRS invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            'Овај модул позадинског приказа „OTRS” позиваоца биће позван да припреми податке за слање на удаљени систем и да обради податке његовог одговора.',
        'Mapping for outgoing request data' => 'Мапирање за излазне податке захтева',
        'Configure' => 'Подеси',
        'The data from the invoker of OTRS will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Подаци из „OTRS” позиваоца биће обрађени овим мапирањем, да би их трансформисали у типове података које удаљени систем очекује.',
        'Mapping for incoming response data' => 'Мапирање за улазне податке одговора',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of OTRS expects.' =>
            'Подаци одговора из „OTRS” позиваоца биће обрађени овим мапирањем, да би их трансформисали у типове података које удаљени систем очекује..',
        'Asynchronous' => 'Асинхрони',
        'This invoker will be triggered by the configured events.' => 'Овај позиваоц ће бити активиран преко подешених догађаја.',
        'Asynchronous event triggers are handled by the OTRS Scheduler Daemon in background (recommended).' =>
            'Асинхроним окидачима догађаја управља „OTRS” Планер системски процес у позадини (препоручено).',
        'Synchronous event triggers would be processed directly during the web request.' =>
            'Синхрони окидачи догађаја биће обрађени директно током веб захтева.',
        'Save and continue' => 'Сачувај и настави',
        'Delete this Invoker' => 'Обриши овог позиваоца',

        # Template: AdminGenericInterfaceMappingSimple
        'GenericInterface Mapping Simple for Web Service %s' => 'Општи интерфејс једноставног мапирања за веб сервис %s',
        'Go back to' => 'Иди назад на',
        'Mapping Simple' => 'Једноставно мапирање',
        'Default rule for unmapped keys' => 'Подразумевано правило за немапиране кључеве',
        'This rule will apply for all keys with no mapping rule.' => 'Ово правило ће се примењивати за све кључеве без правила мапирања.',
        'Default rule for unmapped values' => 'Подразумевано правило за немапиране вредности',
        'This rule will apply for all values with no mapping rule.' => 'Ово правило ће се примењивати за све вредности без правила мапирања.',
        'New key map' => 'Novo mapiranje ključa',
        'Add key mapping' => 'Додај мапирање кључа',
        'Mapping for Key ' => 'Мапирање за кључ',
        'Remove key mapping' => 'Уклони мапирање кључа',
        'Key mapping' => 'Мапирање кључа',
        'Map key' => 'Мапирај кључ',
        'matching the' => 'Подударање са',
        'to new key' => 'на нови кључ',
        'Value mapping' => 'Вредносно мапирање',
        'Map value' => 'Мапирај вредност',
        'to new value' => 'на нову вредност',
        'Remove value mapping' => 'Уклони мапирање вредности',
        'New value map' => 'Ново мапирање вредности',
        'Add value mapping' => 'Додај мапирану вредност',
        'Do you really want to delete this key mapping?' => 'Да ли стварно желите да обришете ово мапирање кључа?',
        'Delete this Key Mapping' => 'Обриши мапирање за овај кључ',

        # Template: AdminGenericInterfaceMappingXSLT
        'GenericInterface Mapping XSLT for Web Service %s' => 'Општи интерфејс „XSLT” мапирања за веб сервис %s',
        'Mapping XML' => 'Мапирање „XML”',
        'Template' => 'Шаблон',
        'The entered data is not a valid XSLT stylesheet.' => 'Унети подаци нису исправан „XSLT” опис стилова.',
        'Insert XSLT stylesheet.' => 'Унеси „XSLT” опис стилова.',

        # Template: AdminGenericInterfaceOperationDefault
        'Add new Operation to Web Service %s' => 'Додај нову операцију веб сервису %s',
        'Change Operation %s of Web Service %s' => 'Промени операцију %s из веб сервиса %s',
        'Add new operation' => 'Додај нову операцију',
        'Change operation %s' => 'Промени операцију %s',
        'Do you really want to delete this operation?' => 'Да ли стварно желите да обришете ову операцију?',
        'Operation Details' => 'Детаљи операције',
        'The name is typically used to call up this web service operation from a remote system.' =>
            'Назив се обично користи за позивање операције веб сервиса из удаљеног система.',
        'Please provide a unique name for this web service.' => 'Молимо да обезбедите јединствено име за овај веб сервис.',
        'Mapping for incoming request data' => 'Мапирање за долазне податке захтева',
        'The request data will be processed by this mapping, to transform it to the kind of data OTRS expects.' =>
            'Подаци захтева ће бити обрађени кроз мапирање, ради трансформације у облик који „OTRS” очекује.',
        'Operation backend' => 'Оперативни позадински приказ',
        'This OTRS operation backend module will be called internally to process the request, generating data for the response.' =>
            'Овај модул „OTRS” оперативног позадинског приказа ће бити интерно позван да обради захтев, генерисањем података за одговор.',
        'Mapping for outgoing response data' => 'Мапирање за излазне податке одговора',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Подаци одговора ће бити обрађени кроз ово мапирање, ради трансформације у облик који удаљени систем очекује.',
        'Delete this Operation' => 'Обриши ову операцију',

        # Template: AdminGenericInterfaceTransportHTTPREST
        'GenericInterface Transport HTTP::REST for Web Service %s' => 'Општи интерфејс транспорта „HTTP::REST” за веб сервис %s',
        'Network transport' => 'Мрежни транспорт',
        'Properties' => 'Својства',
        'Route mapping for Operation' => 'Мапирање руте за операцију',
        'Define the route that should get mapped to this operation. Variables marked by a \':\' will get mapped to the entered name and passed along with the others to the mapping. (e.g. /Ticket/:TicketID).' =>
            'Дефинише руту која ће бити мапирана на ову операцију. Променљиве обележене са \':\' ће бити мапиране на унето име и прослеђене са осталима (нпр. /Ticket/:TicketID).',
        'Valid request methods for Operation' => 'Важеће методе захтева за операцију',
        'Limit this Operation to specific request methods. If no method is selected all requests will be accepted.' =>
            'Ограничи ову опреацију на поједине методе захтева. Ако ни једна метода није изабрана сви захтеви ће бити прихваћени.',
        'Maximum message length' => 'Највећа дужина поруке',
        'This field should be an integer number.' => 'Ово поље треба да буде цео број.',
        'Here you can specify the maximum size (in bytes) of REST messages that OTRS will process.' =>
            'Овде можете унети максималну величину (у бајтима) „REST” порука које ће „OTRS” да обради.',
        'Send Keep-Alive' => 'Пошаљи „Keep-Alive”',
        'This configuration defines if incoming connections should get closed or kept alive.' =>
            'Конфигурација дефинише да ли долазна конекција треба да се затвори и одржава.',
        'Host' => 'Домаћин',
        'Remote host URL for the REST requests.' => 'URL удаљеног уређаја за REST захтеве.',
        'e.g https://www.otrs.com:10745/api/v1.0 (without trailing backslash)' =>
            'нпр „https://www.otrs.com:10745/api/v1.0” (без знака \ крају)',
        'Controller mapping for Invoker' => 'Мапирање контролера за позиваоца',
        'The controller that the invoker should send requests to. Variables marked by a \':\' will get replaced by the data value and passed along with the request. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).' =>
            'Контролер коме ће позивалац прослеђивати захтеве. Променљиве обележене са \':\' ће бити замењене њиховим вредностима и прослеђене заједно са захтевом (нпр. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).',
        'Valid request command for Invoker' => 'Важећа команда захтева за позиваоца',
        'A specific HTTP command to use for the requests with this Invoker (optional).' =>
            'Специфична HTTP команда за примену на захтеве са овим позиваоцем (необавезно).',
        'Default command' => 'Подразумевана команда',
        'The default HTTP command to use for the requests.' => 'Подразумевена HTTP команда за захтеве.',
        'Authentication' => 'Аутентификација',
        'The authentication mechanism to access the remote system.' => 'Механизам аутентификације за пристум удаљеном систему.',
        'A "-" value means no authentication.' => 'Вредност „-” значи нема аутентификације.',
        'The user name to be used to access the remote system.' => 'Корисничко име које ће бити коришћено за приступ удаљеном систему.',
        'The password for the privileged user.' => 'Лозинка за привилегованог корисника.',
        'Use SSL Options' => 'Користи SSL опције',
        'Show or hide SSL options to connect to the remote system.' => 'Прикажи или сакриј SSL опције за повезивање са удаљеним системом.',
        'Certificate File' => 'Сертификат датотеке',
        'The full path and name of the SSL certificate file.' => 'Цела путања и назив за датотеку SSL сертификата.',
        'e.g. /opt/otrs/var/certificates/REST/ssl.crt' => 'нпр /opt/otrs/var/certificates/REST/ssl.crt',
        'Certificate Password File' => 'Сертификат лозинке датотеке',
        'The full path and name of the SSL key file.' => 'Цела путања и назив за датотеку SSL кључа.',
        'e.g. /opt/otrs/var/certificates/REST/ssl.key' => 'нпр /opt/otrs/var/certificates/REST/ssl.key',
        'Certification Authority (CA) File' => 'Датотека сертификационог тела (CA)',
        'The full path and name of the certification authority certificate file that validates the SSL certificate.' =>
            'Цела путања и назив сертификационог тела које проверава исправност SSL сертификата.',
        'e.g. /opt/otrs/var/certificates/REST/CA/ca.file' => 'нпр /opt/otrs/var/certificates/REST/CA/ca.file',

        # Template: AdminGenericInterfaceTransportHTTPSOAP
        'GenericInterface Transport HTTP::SOAP for Web Service %s' => 'Општи интерфејс транспорта HTTP::SOAP за веб сервис %s',
        'Endpoint' => 'Крајња тачка',
        'URI to indicate a specific location for accessing a service.' =>
            'URI за идентификацију специфичне локације за приступ сервису.',
        'e.g. http://local.otrs.com:8000/Webservice/Example' => 'нпр. http://local.otrs.com:8000/Webservice/Example',
        'Namespace' => 'Пртостор имена',
        'URI to give SOAP methods a context, reducing ambiguities.' => 'URI који даје контекст SOAP методама, смањује двосмислености.',
        'e.g urn:otrs-com:soap:functions or http://www.otrs.com/GenericInterface/actions' =>
            'нпр. urn:otrs-com:soap:functions или http://www.otrs.com/GenericInterface/actions',
        'Request name scheme' => 'Захтев за шему имена',
        'Select how SOAP request function wrapper should be constructed.' =>
            'Изаберите како ће бити конструисан омотач функције „SOAP” захтева.',
        '\'FunctionName\' is used as example for actual invoker/operation name.' =>
            '„НазивФункције” се користи као пример за стварно име позиваоца/операције.',
        '\'FreeText\' is used as example for actual configured value.' =>
            '„Слободан текст” се користи као пример за стварну подешену вредност.',
        'Request name free text' => '',
        'Text to be used to as function wrapper name suffix or replacement.' =>
            'Текст који ће бити кориштен као наставак имена или замена омотача функције.',
        'Please consider XML element naming restrictions (e.g. don\'t use \'<\' and \'&\').' =>
            'Молимо да узмете у обзир „XML” оганичења именовања (нпр немојте користити „<” и „&”).',
        'Response name scheme' => 'Шема имена одговора',
        'Select how SOAP response function wrapper should be constructed.' =>
            'Изаберите како ће бити конструисан омотач функције „SOAP” одговора.',
        'Response name free text' => 'Слободан текст имена одговора',
        'Here you can specify the maximum size (in bytes) of SOAP messages that OTRS will process.' =>
            'Овде можете унети максималну величину (у бајтима) „SOAP” порука које ће „OTRS” да обради.',
        'Encoding' => 'Кодни распоред',
        'The character encoding for the SOAP message contents.' => 'Кодни распоред знакова за садржај SOAP поруке.',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => 'нпр. utf-8, latin1, iso-8859-1, cp1250, ...',
        'SOAPAction' => 'SOAP акција',
        'Set to "Yes" to send a filled SOAPAction header.' => 'Изабери „Да” за слање попуњеног заглавља SOAP акције.',
        'Set to "No" to send an empty SOAPAction header.' => 'Изабери „Не” за слање празног заглавља SOAP акције.',
        'SOAPAction separator' => 'Сепаратор SOAP акције',
        'Character to use as separator between name space and SOAP method.' =>
            'Знак који ће се користити као сепаратор између простора имена и SOAP методе.',
        'Usually .Net web services uses a "/" as separator.' => 'Обично .Нет веб сервиси користе „/” као сепаратор.',
        'Proxy Server' => 'Proxy сервер',
        'URI of a proxy server to be used (if needed).' => 'URI од proxy сервера да буде коришћен (ако је потребно).',
        'e.g. http://proxy_hostname:8080' => 'нпр. http://proxy_hostname:8080',
        'Proxy User' => 'Proxy корисник',
        'The user name to be used to access the proxy server.' => 'Корисничко име које ће се користити за приступ proxy серверу.',
        'Proxy Password' => 'Proxy лозинка',
        'The password for the proxy user.' => 'Лозинка за proxy корисника',
        'The full path and name of the SSL certificate file (must be in .p12 format).' =>
            'Цела путања и назив за датотеку SSL сертификата (мора бити у .p12 формату).',
        'e.g. /opt/otrs/var/certificates/SOAP/certificate.p12' => 'нпр. /opt/otrs/var/certificates/SOAP/certificate.p12',
        'The password to open the SSL certificate.' => 'Лозинка за отварање SSL сертификата',
        'The full path and name of the certification authority certificate file that validates SSL certificate.' =>
            'Цела путања и назив сертификационог тела које провера исправност SSL сертификата.',
        'e.g. /opt/otrs/var/certificates/SOAP/CA/ca.pem' => 'нпр. /opt/otrs/var/certificates/SOAP/CA/ca.pem',
        'Certification Authority (CA) Directory' => 'Директоријум сертификационог тела (CA)',
        'The full path of the certification authority directory where the CA certificates are stored in the file system.' =>
            'Цела путања директоријума сертификационог тела где се складиште CA сертификати у систему датотека.',
        'e.g. /opt/otrs/var/certificates/SOAP/CA' => 'нпр. /opt/otrs/var/certificates/SOAP/CA',
        'Sort options' => 'Опције сортирања',
        'Add new first level element' => 'Додај нови елемент првог нивоа',
        'Element' => 'Елемент',
        'Outbound sort order for xml fields (structure starting below function name wrapper) - see documentation for SOAP transport.' =>
            'Одлазни редослед сортирања за XML поља (структура испод назива омотача функције) - погледајте документацију за „SOAP” транспорт.',

        # Template: AdminGenericInterfaceWebservice
        'GenericInterface Web Service Management' => 'Управљање оштим интерфејсом веб сервиса',
        'Add web service' => 'Додај веб сервис',
        'Clone web service' => 'Клонирај веб сервис',
        'The name must be unique.' => 'Име мора бити јединствено.',
        'Clone' => 'Клонирај',
        'Export web service' => 'Извези веб сервис',
        'Import web service' => 'Увези веб сервис',
        'Configuration File' => 'Конфигурациона датотека',
        'The file must be a valid web service configuration YAML file.' =>
            'Датотека мора да буде важећа YAML конфигурациона датотека веб сервиса.',
        'Import' => 'Увези',
        'Configuration history' => 'Историјат конфигурисања',
        'Delete web service' => 'Обриши веб сервис',
        'Do you really want to delete this web service?' => 'Да ли стварно желите да обришете овај веб сервис?',
        'Ready-to-run Web Services' => 'Веб сервиси спремни  за употребу',
        'Here you can activate ready-to-run web services showcasing our best practices that are a part of %s.' =>
            'Овде можете активирати веб сервисе спремне за употребу који приказују нашу најбољу праксу која је део %s.',
        'Please note that these web services may depend on other modules only available with certain %s contract levels (there will be a notification with further details when importing).' =>
            'Молимо да имате на уму да веб сервиси могу да зависе од других модула који су доступни  у оквиру одређених %s нивоа уговора (постоји обавешетење са додатним детаљима при увозу).',
        'Import ready-to-run web service' => 'Увези веб сервис спреман за употребу',
        'Would you like to benefit from web services created by experts? Upgrade to %s to import some sophisticated ready-to-run web services.' =>
            'Да ли желите да искористите веб сервисе креиране од стране експерата? Унапредите на %s да би могли да увезете неке софистициране веб сервисе спремне за употребу.',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            'Након снимања конфигурације бићете поново преусмерени на приказ екрана за уређивање.',
        'If you want to return to overview please click the "Go to overview" button.' =>
            'Ако желите да се вратите на преглед, молимо да кликнете на дугме „Иди на преглед”.',
        'Web Service List' => 'Листа веб сервиса',
        'Remote system' => 'Удаљени систем',
        'Provider transport' => 'Транспорт провајдера',
        'Requester transport' => 'Транспорт потражиоца',
        'Debug threshold' => 'Праг уклањања грешака',
        'In provider mode, OTRS offers web services which are used by remote systems.' =>
            'У режиму провајдера, „OTRS” нуди веб сервисе који се користе од стране удаљених система.',
        'In requester mode, OTRS uses web services of remote systems.' =>
            'У режиму наручиоца, „OTRS” користи веб сервисе удаљених система.',
        'Operations are individual system functions which remote systems can request.' =>
            'Операције су индивидуалне системске функције које удаљени системи могу да захтевају.',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            'Позиваоци припремају податке за захтев на удаљеном wеб сервису и обрађују податке његових одговора.',
        'Controller' => 'Контролер',
        'Inbound mapping' => 'Улазно мапирање',
        'Outbound mapping' => 'Излазно мапирање',
        'Delete this action' => 'Обриши ову акцију',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            'Најмање један %s има контролер који или није активан или није присутан, молимо проверите регистрацију контролера или избришите %s',
        'Delete webservice' => 'Обриши веб сервис',
        'Delete operation' => 'Обриши операцију',
        'Delete invoker' => 'Обриши позиваоца',
        'Clone webservice' => 'Клонирај веб сервис',
        'Import webservice' => 'Увези веб сервис',

        # Template: AdminGenericInterfaceWebserviceHistory
        'GenericInterface Configuration History for Web Service %s' => 'Историјат конфигурације општег интерфејса за веб сервис %s',
        'Go back to Web Service' => 'Вратите се на веб сервис',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            'Овде можете видети старије верзије конфигурације актуелног веб сервиса, експортовати их или их обновити.',
        'Configuration History List' => 'Листа - историјат конфигурације',
        'Version' => 'Верзија',
        'Create time' => 'Време креирања',
        'Select a single configuration version to see its details.' => 'Изабери само једну конфигурациону верзију за преглед њених детаља.',
        'Export web service configuration' => 'Извези конфигурацију веб сервиса',
        'Restore web service configuration' => 'Обнови конфигурацију веб сервиса',
        'Do you really want to restore this version of the web service configuration?' =>
            'Да ли стварно желите да вратите ову верзију конфигурације веб сервиса?',
        'Your current web service configuration will be overwritten.' => 'Актуелна конфигурација веб сервиса биће преписана.',
        'Restore' => 'Обнови',

        # Template: AdminGroup
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'УПОЗОРЕЊЕ: Ако промените име групе \'admin\' пре адекватног подешавања у системској конфигурацији, изгубићете приступ административном панелу! Уколико се то деси, вратите име групи у „admin” помоћу SQL команде.',
        'Group Management' => 'Управљање групама',
        'Add group' => 'Додај групу',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            '„admin” група служи за приступ администрационом простору, а „stats” група статистикама.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Направи нове групе за руковање правима приступа разним групама оператера (нпр. одељење набавке, техничка подршка, продаја, ...).',
        'It\'s useful for ASP solutions. ' => 'Корисно ASP решења.',
        'total' => 'укупно',
        'Add Group' => 'Додај групу',
        'Edit Group' => 'Уреди групу',

        # Template: AdminLog
        'System Log' => 'Системски лог',
        'Here you will find log information about your system.' => 'Овде ћете наћи лог информације о вашем систему.',
        'Hide this message' => 'Сакриј ову поруку',
        'Recent Log Entries' => 'Последњи лог уноси',

        # Template: AdminMailAccount
        'Mail Account Management' => 'Управљање имејл налозима',
        'Add mail account' => 'Додај имејл налог',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Све долазне поруке са једног имејл налога ће бити усмерене у изабрани ред!',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Ако је ваш налог од поверења, користиће се постојећа „X-OTRS” заглавља! „PostMaster” филтери се користе увек.',
        'Delete account' => 'Обриши налог',
        'Fetch mail' => 'Преузми пошту',
        'Add Mail Account' => 'Додај имејл налог',
        'Example: mail.example.com' => 'Пример: mail.example.com',
        'IMAP Folder' => 'IMAP фолдер',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'Ово измените само ако је потребно примити пошту из другог фолдера, а не из INBOX-а.',
        'Trusted' => 'Од поверења',
        'Dispatching' => 'Отпрема',
        'Edit Mail Account' => 'Уреди имејл налог',

        # Template: AdminNavigationBar
        'Admin' => 'Админ',
        'Agent Management' => 'Управљање оператерима',
        'Queue Settings' => 'Подешавање редова',
        'Ticket Settings' => 'Подешавање тикета',
        'System Administration' => 'Администрација система',
        'Online Admin Manual' => 'Административно упутство на мрежи',

        # Template: AdminNotificationEvent
        'Ticket Notification Management' => 'Управљање обавештењима о тикетима',
        'Add notification' => 'Додај обавештење',
        'Export Notifications' => 'Обавештења о извозу',
        'Configuration Import' => 'Увоз конфигурације',
        'Here you can upload a configuration file to import Ticket Notifications to your system. The file needs to be in .yml format as exported by the Ticket Notification module.' =>
            'Овде можете послати конфигурациону датотеку за увоз обавештења о тикету у ваш систем. Датотека мора бити у „.yml” формату ако се извози од стране модула за обавештења о тикету.',
        'Overwrite existing notifications?' => 'Препиши преко постојећих обавештења?',
        'Upload Notification configuration' => 'Отпреми конфигурацију обавештавања',
        'Import Notification configuration' => 'Увези конфигурацију обавештења',
        'Delete this notification' => 'Обриши ово обавештење',
        'Do you really want to delete this notification?' => 'Да ли стварно желите да обришете ово обавештење?',
        'Add Notification' => 'Додај Обавештење',
        'Edit Notification' => 'Уреди обавештење',
        'Show in agent preferences' => 'Приказано у оператерским поставкама.',
        'Agent preferences tooltip' => 'Порука за оператерска подешавања',
        'This message will be shown on the agent preferences screen as a tooltip for this notification.' =>
            'Ова порука ће бити приказана на екрану оператерских подешавања као испомоћ.',
        'Here you can choose which events will trigger this notification. An additional ticket filter can be applied below to only send for ticket with certain criteria.' =>
            'Овде можете изабрати који догађаји ће покренути обавештавање. Додатни филтер за тикете може бити примењен ради слања само за тикете по одређеном критеријуму.',
        'Ticket Filter' => 'Филтер тикета',
        'Article Filter' => 'Филтер чланка',
        'Only for ArticleCreate and ArticleSend event' => 'Само за догађај креирање чланка и слање чланка',
        'Article type' => 'Тип чланка',
        'If ArticleCreate or ArticleSend is used as a trigger event, you need to specify an article filter as well. Please select at least one of the article filter fields.' =>
            'Ако се користе догађаји креирање чланка и слање чланка, неопходно је дефинисати филтер чланка. Молим вас селектујте бар једно поље за филтер чланка.',
        'Article sender type' => 'Тип пошиљаоца чланка',
        'Subject match' => 'Поклапање предмета',
        'Body match' => 'Поклапање садржаја',
        'Include attachments to notification' => 'Укључи прилоге уз обавштење',
        'Recipients' => 'Промаоци',
        'Send to' => 'Пошаљи за ',
        'Send to these agents' => 'Пошаљи овим оператерима',
        'Send to all group members' => 'Пошаљи свим члановима групе',
        'Send to all role members' => 'Пошаљи свим припадницима улоге',
        'Send on out of office' => 'Пошаљи и кад је ван канцеларије',
        'Also send if the user is currently out of office.' => 'Такође пошаљи и када је корисник ван канцеларије.',
        'Once per day' => 'Једном дневно',
        'Notify user just once per day about a single ticket using a selected transport.' =>
            'Обавети корисника само једном дневно о поједином тикету коришћењем изабраног транспорта.',
        'Notification Methods' => 'Методе обавештавања',
        'These are the possible methods that can be used to send this notification to each of the recipients. Please select at least one method below.' =>
            'Ово су могуће методе које се могу користити за слање обавештења сваком примаоцу. Молимо вас да изаберете бар једну методу од понуђених.',
        'Enable this notification method' => 'Активирај овај метод обавештавања',
        'Transport' => 'Транспорт',
        'At least one method is needed per notification.' => 'Потребан је најмање један метод по обавештењу.',
        'Active by default in agent preferences' => ' Подразумевано активно у оператерским поставкама.',
        'This is the default value for assigned recipient agents who didn\'t make a choice for this notification in their preferences yet. If the box is enabled, the notification will be sent to such agents.' =>
            'Ово је подразумевана вредност за придружене оператере примаоце који за ово обавештење у својим поставкама нису још направили избор. Ако је бокс активиран, обавештење ће бити послато таквим оператерима.',
        'This feature is currently not available.' => 'Ово својство тренутно није доступно.',
        'No data found' => 'Ништа није пронађено',
        'No notification method found.' => 'Није пронађена метода обавештавања.',
        'Notification Text' => 'Текст обавештења',
        'This language is not present or enabled on the system. This notification text could be deleted if it is not needed anymore.' =>
            'Овај језик није присутан или укључен на систему. Ово обавештење може бити избрисано уколико више није неопходно.',
        'Remove Notification Language' => 'Уклони језик обавештења',
        'Message body' => 'Садржај поруке',
        'Add new notification language' => 'Уклони нови језик обавештења',
        'Do you really want to delete this notification language?' => 'Да ли заиста желите да избришете овај језик за обавештења?',
        'Tag Reference' => 'Референца ознаке',
        'Notifications are sent to an agent or a customer.' => 'Обавештење послато оператеру или клијенту.',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Да видите првих 20 слова предмета (последњег чланка оператера).',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Да видите првих 5 линија поруке (последњег чланка оператера).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Да видите првих 20 слова предмета (последњег чланка клијента).',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Да видите првих 5 линија поруке (последњег чланка клијента).',
        'Attributes of the current customer user data' => 'Атрибути података актуелног клијента корисника',
        'Attributes of the current ticket owner user data' => 'Атрибути података корисника власника актуелног тикета',
        'Attributes of the current ticket responsible user data' => 'Атрибути података одговорног корисника актуелног тикета',
        'Attributes of the current agent user who requested this action' =>
            'Атрибути актуелног корисника оператера који је тражио ову акцију',
        'Attributes of the recipient user for the notification' => 'Атрибути корисника примаоца за обавештење',
        'Attributes of the ticket data' => 'Атрибути података тикета',
        'Ticket dynamic fields internal key values' => 'Вредности интерних кључева динамичких поља тикета',
        'Ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Приказане вредности динамичких поља, корисно за падајућа и поља са вишеструким избором.',
        'Example notification' => 'Пример обавештења',

        # Template: AdminNotificationEventTransportEmailSettings
        'Additional recipient email addresses' => 'Имејл адреса додатног примаоца',
        'You can use OTRS-tags like <OTRS_TICKET_DynamicField_...> to insert values from the current ticket.' =>
            'Можете користити OTRS тагове као <OTRS_TICKET_DynamicField_...> за уметање вредности из тренутног тикета.',
        'Notification article type' => 'Тип чланка обавештења',
        'An article will be created if the notification is sent to the customer or an additional email address.' =>
            'Чланак је креиран и обавештење послато клијенту или на другу имејл адресу.',
        'Email template' => 'Имејл шаблон',
        'Use this template to generate the complete email (only for HTML emails).' =>
            'Употребите овај шаблон за генерисање комплетног имејла (само за „HTML” имејлове).',
        'Enable email security' => 'Активирајте безбедност имејла',
        'Email security level' => 'Ниво безбедности имејла',
        'If signing key/certificate is missing' => 'Ако потписивање кључа/сертификата недостаје',
        'If encryption key/certificate is missing' => 'Ако кључа/сертификат за шифрирање недостаје',

        # Template: AdminOTRSBusinessInstalled
        'Manage %s' => 'Управљај са %s',
        'Downgrade to OTRS Free' => 'Повратак на бесплатну верзију „OTRS”',
        'Read documentation' => 'Прочитај документацију',
        '%s makes contact regularly with cloud.otrs.com to check on available updates and the validity of the underlying contract.' =>
            '%s редовно се повезује са „cloud.otrs.com” за проверу доступних ажурирања и исправности интерних уговора.',
        'Unauthorized Usage Detected' => 'Детектована неовлаштена употреба',
        'This system uses the %s without a proper license! Please make contact with %s to renew or activate your contract!' =>
            'Овај систем користи %s без адекватне лиценце! Молимо да контактирате %s за обнову или активацију вашег уговора!',
        '%s not Correctly Installed' => '%s није коректно инсталирана',
        'Your %s is not correctly installed. Please reinstall it with the button below.' =>
            'Ваш %s није коректно инсталиран. Молимо да реинсталирате путем дугмета испод.',
        'Reinstall %s' => 'Реинсталирај %s',
        'Your %s is not correctly installed, and there is also an update available.' =>
            'Ваш %s није коректно инсталиран, а и ажурирање је доступно.',
        'You can either reinstall your current version or perform an update with the buttons below (update recommended).' =>
            'Можете реинсталирати актуелну верзију или извршити ажурирање путем дугмета испод (препоручује се ажурирање).',
        'Update %s' => 'Ажурирај %s',
        '%s Not Yet Available' => '%s није још доступно',
        '%s will be available soon.' => '%s ће бити ускоро доступно',
        '%s Update Available' => '%s доступно ажурирање',
        'An update for your %s is available! Please update at your earliest!' =>
            'Ажурирање за ваш %s је доступно! Молимо вас да ажурирате што пре!',
        '%s Correctly Deployed' => '%s коректно распоређено',
        'Congratulations, your %s is correctly installed and up to date!' =>
            'Честитамо, ваш %s је коректно инсталиран и ажуран!',

        # Template: AdminOTRSBusinessNotInstalled
        '%s will be available soon. Please check again in a few days.' =>
            '%s ће бити доступна ускоро. Молимо, проверите поново за неколико дана.',
        'Please have a look at %s for more information.' => 'Молимо да погледате  %s за више информација.',
        'Your OTRS Free is the base for all future actions. Please register first before you continue with the upgrade process of %s!' =>
            'Ваш „OTRS Free” је основа за све будуће активности. Молимо вас да се региструјете пре него што наставите са процесом ажурирања %s!',
        'Before you can benefit from %s, please contact %s to get your %s contract.' =>
            'Пре него вам %s буде користан, молимо да контактирате %s да бисте добили %s уговор.',
        'Connection to cloud.otrs.com via HTTPS couldn\'t be established. Please make sure that your OTRS can connect to cloud.otrs.com via port 443.' =>
            'Конекција према cloud.otrs.com преко HTTPS није могла бити успостављена. Молимо осигурајте да ваш „OTRS” може да се повеже са cloud.otrs.com преко порта 443.',
        'With your existing contract you can only use a small part of the %s.' =>
            'Са вашим садашњим уговором можете користити само мали део од %s.',
        'If you would like to take full advantage of the %s get your contract upgraded now! Contact %s.' =>
            'Ако желите да искористите све предности %s потребно је да ажурирате ваш уговор! Контактирајте %s.',

        # Template: AdminOTRSBusinessUninstall
        'Cancel downgrade and go back' => 'Поништи повратак на стару верзију и врати се назад',
        'Go to OTRS Package Manager' => 'Иди на „OTRS” управљање пакетима',
        'Sorry, but currently you can\'t downgrade due to the following packages which depend on %s:' =>
            'Нажалост, тренутно не можете да се вратите на стару верзију због следећих пакета који зависе од %s:',
        'Vendor' => 'Продавац',
        'Please uninstall the packages first using the package manager and try again.' =>
            'Молимо вас да прво деинсталирате пакете кроз управљач пакетима па да покушате поново. ',
        'You are about to downgrade to OTRS Free and will lose the following features and all data related to these:' =>
            'Вратићете се на стару верзију бесплатног „OTRS” и изгубићете следећа својства и податке повезане са:',
        'Chat' => 'Ћаскање',
        'Report Generator' => 'Генератор извештаја',
        'Timeline view in ticket zoom' => 'Детаљни приказ тикета на временској линији',
        'DynamicField ContactWithData' => 'Динамичко поље „Контакт са подацима”',
        'DynamicField Database' => 'База података динамичких поља',
        'SLA Selection Dialog' => 'Дијалог избора „SLA” ',
        'Ticket Attachment View' => 'Преглед прилога уз тикет',
        'The %s skin' => 'Изглед %s',

        # Template: AdminPGP
        'PGP Management' => 'Управљање „PGP” кључевима',
        'PGP support is disabled' => '„PGP” подршка је онемогућена',
        'To be able to use PGP in OTRS, you have to enable it first.' => 'Да би могли да користите „PGP” у „OTRS”, морате га прво омогућити.',
        'Enable PGP support' => 'Омогући „PGP” подршку',
        'Faulty PGP configuration' => 'Неисправна „PGP” конфигурација',
        'PGP support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            '„PGP” подршка ја омогућена али релевантна конфигурација садржи грешке. Молимо да проверите конфигурацију притиском на дугме испод.',
        'Configure it here!' => 'Подесите то овде!',
        'Check PGP configuration' => 'Провери „PGP” конфигурацију',
        'Add PGP key' => 'Додај „PGP” кључ',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'На овај начин можете директно уређивати комплет кључева подешен у SysConfig (системским конфигурацијама).',
        'Introduction to PGP' => 'Увод у „PGP”',
        'Result' => 'Резултат',
        'Identifier' => 'Идентификатор',
        'Bit' => 'Бит',
        'Fingerprint' => 'Отисак',
        'Expires' => 'Истиче',
        'Delete this key' => 'Обриши овај кључ',
        'Add PGP Key' => 'Додај „PGP” кључ',
        'PGP key' => '„PGP” кључ',

        # Template: AdminPackageManager
        'Package Manager' => 'Управљање пакетима',
        'Uninstall package' => 'Деинсталирај пакет',
        'Do you really want to uninstall this package?' => 'Да ли стварно желите да деинсталирате овај пакет?',
        'Reinstall package' => 'Инсталирај пакет поново',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'Да ли стварно желите да поново инсталирате овај пакет? Све ручне промене ће бити изгубљене.',
        'Continue' => 'Настави',
        'Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Молимо вас да будете сигурни да ваша база података прихвата пакете величине преко %s MB (тренутно прихвата само пакете до %s MB).Молимо прилагодите подешавања „max_allowed_packet” на вашој бази података, да би сте избегли грешке.',
        'Install' => 'Инсталирај',
        'Install Package' => 'Инсталирај пакет',
        'Update repository information' => 'Ажурирај информације о спремишту',
        'Cloud services are currently disabled.' => 'Сервиси у облаку су тренутно деактивирани.',
        'OTRS Verify™ can not continue!' => '„OTRS Verify™” не може да настави!',
        'Enable cloud services' => 'Активирај сервисе у облаку',
        'Online Repository' => 'Мрежно спремиште',
        'Module documentation' => 'Документација модула',
        'Upgrade' => 'Ажурирање',
        'Local Repository' => 'Локално спремиште',
        'This package is verified by OTRSverify (tm)' => 'Овај пакет је верификован од стране OTRSverify (tm)',
        'Uninstall' => 'Деинсталирај',
        'Reinstall' => 'Инсталирај поново',
        'Features for %s customers only' => 'Својства само за %s клијенте',
        'With %s, you can benefit from the following optional features. Please make contact with %s if you need more information.' =>
            'Са %s можете имати користи од следећих опционих функција. Молимо да контактирате %s уколико су вам потребне додатне информације.',
        'Download package' => 'Преузми пакет',
        'Rebuild package' => 'Обнови пакет(rebuild)',
        'Metadata' => 'Мета подаци',
        'Change Log' => 'Промени лог',
        'Date' => 'Датум',
        'List of Files' => 'Списак датотека',
        'Permission' => 'Дозвола',
        'Download' => 'Преузимање',
        'Download file from package!' => 'Преузми датотеку из пакета!',
        'Required' => 'Обавезно',
        'Primary Key' => 'Примарни кључ',
        'Auto Increment' => 'Ауто увећање',
        'SQL' => 'SQL',
        'File differences for file %s' => 'Разлике за датотеку %s',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Перформанса лог-а',
        'This feature is enabled!' => 'Ова функција је активна!',
        'Just use this feature if you want to log each request.' => 'Активирати ову могућност само ако желите да забележите сваки захтев.',
        'Activating this feature might affect your system performance!' =>
            'Активирање ове функције може утицати на перформансе система.',
        'Disable it here!' => 'Искључите је овде!',
        'Logfile too large!' => 'Лог датотека је превелика!',
        'The logfile is too large, you need to reset it' => 'Лог датотека је превелика, треба да је ресетујете',
        'Overview' => 'Преглед',
        'Range' => 'Опсег',
        'last' => 'последње',
        'Interface' => 'Интерфејс',
        'Requests' => 'Захтеви',
        'Min Response' => 'Мин одзив',
        'Max Response' => 'Макс одзив',
        'Average Response' => 'Просечан одзив',
        'Period' => 'Период',
        'Min' => 'Мин',
        'Max' => 'Макс',
        'Average' => 'Просек',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'Управљање PostMaster филтерима',
        'Add filter' => 'Додај филтер',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Ради отпреме или филтрирања долазних имејлова на основу заглавља. Поклапање помоћу регуларних израза је такође могуће.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Уколико желите поклапање само са имејл адресом, користите EMAILADDRESS:info@example.com у „Од”, „За” или „Cc”.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Уколико користите регуларне изразе, такође можете користити и упатеру вредност у () као (***) у \'Set\' action.',
        'Delete this filter' => 'Обриши овај филтер',
        'Do you really want to delete this filter?' => 'Да ли стварно желите да обришете овај филтер?',
        'Add PostMaster Filter' => 'Додај PostMaster филтер',
        'Edit PostMaster Filter' => 'Уреди PostMaster филтер',
        'The name is required.' => 'Име је обавезно.',
        'Filter Condition' => 'Услов филтрирања',
        'AND Condition' => 'AND услов',
        'Check email header' => 'Провери заглавље имејла',
        'Negate' => 'Негирати',
        'Look for value' => 'Потражи вредност',
        'The field needs to be a valid regular expression or a literal word.' =>
            'Ово поље треба да буде важећи регуларни израз или дословно реч.',
        'Set Email Headers' => 'Подеси заглавља имејла',
        'Set email header' => 'Подеси заглавље имејла',
        'Set value' => 'Подеси вредност',
        'The field needs to be a literal word.' => 'Ово поље треба да буде дословно реч.',

        # Template: AdminPriority
        'Priority Management' => 'Управљање приоритетима',
        'Add priority' => 'Додај приоритет',
        'Add Priority' => 'Додај Приоритет',
        'Edit Priority' => 'Уреди Приоритет',

        # Template: AdminProcessManagement
        'Process Management' => 'Управљање процесима',
        'Filter for Processes' => 'Филтер процеса',
        'Create New Process' => 'Креирај нови процес',
        'Deploy All Processes' => 'Распореди све процесе',
        'Here you can upload a configuration file to import a process to your system. The file needs to be in .yml format as exported by process management module.' =>
            'Овде можете учитати конфигурациону датотеку за увоз процеса у ваш систем. Датотека мора бити у .yml формату извезена од стране модула за управљање процесом.',
        'Overwrite existing entities' => 'Напиши преко постојећих ентитета',
        'Upload process configuration' => 'Учитај конфигурацију процеса',
        'Import process configuration' => 'Увези конфигурацију процеса',
        'Ready-to-run Processes' => 'Процеси спремни за употребу',
        'Here you can activate ready-to-run processes showcasing our best practices. Please note that some additional configuration may be required.' =>
            'Овде можете активирати процесе примера најбоље праксе који су спремни за употребу. Молимо обратите пажњу да је можда потребна додатна конфигурација.',
        'Would you like to benefit from processes created by experts? Upgrade to %s to import some sophisticated ready-to-run processes.' =>
            'Да ли желите да искористите процесе креиране од стране експерата? Унапредите на %s за увоз примера софистицираних процеса спремних за употребу.',
        'Import ready-to-run process' => 'Увоз процеса спремних за употребу',
        'To create a new Process you can either import a Process that was exported from another system or create a complete new one.' =>
            'За креирање новог процеса можете или увести процес који је извезен из другог система или креирати комплетно нов.',
        'Changes to the Processes here only affect the behavior of the system, if you synchronize the Process data. By synchronizing the Processes, the newly made changes will be written to the Configuration.' =>
            'Промене у процесима једино утичу на понашање система, ако синхронизујете податке процеса. Синхронизовањем процеса, новонаправљене промене ће бити уписане у конфигурацију.',
        'Processes' => 'Процеси',
        'Process name' => 'Назив процеса',
        'Print' => 'Штампај',
        'Export Process Configuration' => 'Извези конфигурацију процеса',
        'Copy Process' => 'Копирај процес',

        # Template: AdminProcessManagementActivity
        'Cancel & close' => 'Поништи & затвори',
        'Go Back' => 'Врати се назад',
        'Please note, that changing this activity will affect the following processes' =>
            'Напомињемо да ће измене ове активности утицати на пратеће процесе.',
        'Activity' => 'Активност',
        'Activity Name' => 'Назив активности',
        'Activity Dialogs' => 'Дијалози активности',
        'You can assign Activity Dialogs to this Activity by dragging the elements with the mouse from the left list to the right list.' =>
            'Дијалоге активности можете доделити овој активности превлачењем елемената мишем од леве листе до десне листе.',
        'Ordering the elements within the list is also possible by drag \'n\' drop.' =>
            'Мењање редоследа елемената унутар листе је, такође, могуће преврачењем елемената и пуштањем.',
        'Filter available Activity Dialogs' => 'Филтрирај слободне дијалоге активности',
        'Available Activity Dialogs' => 'Слободни дијалози активности',
        'Name: %s, EntityID: %s' => 'Назив: %s, ИД ентитета: %s',
        'Create New Activity Dialog' => 'Креирај нов дијалог активности',
        'Assigned Activity Dialogs' => 'Додељени дијалози активности',
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?' =>
            'Уколико користите ово дугме или везу, напустићете екран и његов тренутни садржај ће бити аутоматски сачуван. Желите ли да наставите?',

        # Template: AdminProcessManagementActivityDialog
        'Please note that changing this activity dialog will affect the following activities' =>
            'Напомињемо да ће промена овог дијалога активности утицати на пратеће активности.',
        'Please note that customer users will not be able to see or use the following fields: Owner, Responsible, Lock, PendingTime and CustomerID.' =>
            'Напомињемо да клијенти корисници нису у могућности да виде или користе следећа поља: Власник, Одговоран, Закључано, Време на чекању и ИД клијента',
        'The Queue field can only be used by customers when creating a new ticket.' =>
            'Поље у реду једино може бити коришћено од стране клијента када креирају нови тикет.',
        'Activity Dialog' => 'Дијалог активности',
        'Activity dialog Name' => 'Назив дијалога активности',
        'Available in' => 'Расположиво у',
        'Description (short)' => 'Опис (кратак)',
        'Description (long)' => 'Опис (дугачак)',
        'The selected permission does not exist.' => 'Изабрана овлашћења не постоје.',
        'Required Lock' => 'Обавезно закључај',
        'The selected required lock does not exist.' => 'Одабрано захтевано закључавање не постоји.',
        'Submit Advice Text' => 'Поднеси „Advice Text”',
        'Submit Button Text' => 'Поднеси „Button Text”',
        'Fields' => 'Поља',
        'You can assign Fields to this Activity Dialog by dragging the elements with the mouse from the left list to the right list.' =>
            'Поља можете доделити у овом дијалогу активности превлачењем елемената мишем из леве листе у десну листу.',
        'Filter available fields' => 'Филтрирај расположива поља',
        'Available Fields' => 'Расположива поља',
        'Name: %s' => 'Назив: %s',
        'Assigned Fields' => 'Додељена поља',
        'ArticleType' => 'ТипЧланка',
        'Display' => 'Прикажи',
        'Edit Field Details' => 'Уреди детаље поља',
        'Customer interface does not support internal article types.' => 'Клијентски интерфејс не подржава интерне типове чланка.',

        # Template: AdminProcessManagementPath
        'Path' => 'Путања',
        'Edit this transition' => 'Уредите ову транзицију',
        'Transition Actions' => 'Транзиционе активности',
        'You can assign Transition Actions to this Transition by dragging the elements with the mouse from the left list to the right list.' =>
            'Можете доделити транзиционе активности у овој транзицији превлачењем елемената мишем из леве листе у десну листу.',
        'Filter available Transition Actions' => 'Филтрирај расположиве транзиционе активности',
        'Available Transition Actions' => 'Расположиве транзиционе активности',
        'Create New Transition Action' => 'Креирај нову транзициону активност',
        'Assigned Transition Actions' => 'Додељене транзиционе активности',

        # Template: AdminProcessManagementProcessAccordion
        'Activities' => 'Активности',
        'Filter Activities...' => 'Филтрирај активности ...',
        'Create New Activity' => 'Креирај нову активност',
        'Filter Activity Dialogs...' => 'Филтрирај дијалоге активности ...',
        'Transitions' => 'Транзиције',
        'Filter Transitions...' => 'Филтрирај транзиције ...',
        'Create New Transition' => 'Креирај нову транзицију',
        'Filter Transition Actions...' => 'Филтрирај транзиционе активности ...',

        # Template: AdminProcessManagementProcessEdit
        'Edit Process' => 'Уреди процес',
        'Print process information' => 'Штампај информације процеса',
        'Delete Process' => 'Избриши процес',
        'Delete Inactive Process' => 'Избриши неактиван процес',
        'Available Process Elements' => 'Расположиви елементи процеса',
        'The Elements listed above in this sidebar can be moved to the canvas area on the right by using drag\'n\'drop.' =>
            'Елементи, наведени горе у издвојеном одељку, могу да се померају по површини на десну страну коришћењем превуци и пусти технике.',
        'You can place Activities on the canvas area to assign this Activity to the Process.' =>
            'Можете поставити активности на поврсину како би доделити ову активност процесу.',
        'To assign an Activity Dialog to an Activity drop the Activity Dialog element from this sidebar over the Activity placed in the canvas area.' =>
            'За додељивање Дијалога Активности некој активности, превуците елемент дијалога активности из издвојеног дела, преко активности смештене на површини.',
        'You can start a connection between two Activities by dropping the Transition element over the Start Activity of the connection. After that you can move the loose end of the arrow to the End Activity.' =>
            'Везу између две активности можете започети превлачењем елемента транзиције преко почетка активности везе. Након тога можете да преместите слободан крај стрелице до краја активности',
        'Actions can be assigned to a Transition by dropping the Action Element onto the label of a Transition.' =>
            'Активност може бити додељена транзицији превлачењем елемента активности на ознаку транзиције.',
        'Edit Process Information' => 'Уреди информације о процесу',
        'Process Name' => 'Назив процеса',
        'The selected state does not exist.' => 'Одабрани статус не постоји.',
        'Add and Edit Activities, Activity Dialogs and Transitions' => 'Додај и уреди активости, дијалоге активности и транзиције',
        'Show EntityIDs' => 'Покажи ИД ентитета',
        'Extend the width of the Canvas' => 'Прошири ширину простора',
        'Extend the height of the Canvas' => 'Продужи висину простора',
        'Remove the Activity from this Process' => 'Уклони активност из овог процеса',
        'Edit this Activity' => 'Уреди ову активност',
        'Save Activities, Activity Dialogs and Transitions' => 'Сачувај активости, дијалоге активности и транзиције',
        'Do you really want to delete this Process?' => 'Да ли заиста желите да обришете овај процес?',
        'Do you really want to delete this Activity?' => 'Да ли заиста желите да обришете ову активност?',
        'Do you really want to delete this Activity Dialog?' => 'Да ли заиста желите да обришете овај дијалог активности?',
        'Do you really want to delete this Transition?' => 'Да ли заиста желите да обришете ову транзицију?',
        'Do you really want to delete this Transition Action?' => 'Да ли заиста желите да обришете ову транзициону активност?',
        'Do you really want to remove this activity from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Да ли заиста желите да уклоните ову активност са површине? Ово једино може да се опозове уколико напустите екран, а да претходно не сачувате измене.',
        'Do you really want to remove this transition from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Да ли заиста желите да уклоните ову транзицију са површине? Ово једино може да се опозове уколико напустите екран, а да претходно не сачувате измене.',
        'Hide EntityIDs' => 'Сакриј ИД-ове објекта',
        'Delete Entity' => 'Избриши објекат',
        'Remove Entity from canvas' => 'Уклони објекат са површине',
        'This Activity is already used in the Process. You cannot add it twice!' =>
            'Ова активност је већ коришћена у процесу. Не можете је додавати два пута.',
        'This Activity cannot be deleted because it is the Start Activity.' =>
            'Ова активност се не може брисати, зато што је то почетак активности.',
        'This Transition is already used for this Activity. You cannot use it twice!' =>
            'Ова транзиција је већ коришћена за ову активност. Не можете је користити два пута.',
        'This TransitionAction is already used in this Path. You cannot use it twice!' =>
            'Ова транзициона тктивност је већ коришћена у овој путањи. Не можете је користити два пута.',
        'Remove the Transition from this Process' => 'Уклони транзицију из овог процеса',
        'No TransitionActions assigned.' => 'Нема додељених транзиционих активности.',
        'The Start Event cannot loose the Start Transition!' => 'Почетак догађаја не може изгубити почетак транзиције.',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.' =>
            'Још увек нема додељених дијалога. Само изаберите један дијалог активности из листе са леве стране и превуците га овде.',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.' =>
            'Неповезана транзиција је већ постављена на површину. Молимо повежите прву транзицију пре него што поставите другу транзицију.',

        # Template: AdminProcessManagementProcessNew
        'In this screen, you can create a new process. In order to make the new process available to users, please make sure to set its state to \'Active\' and synchronize after completing your work.' =>
            'У овом екрану можете креирати нови процес. Да би нови процес био доступан корисницима, молимо вас да поставите статус на \'Active\' и урадите синхронизацију након завршетка вашег рада.',

        # Template: AdminProcessManagementProcessPrint
        'cancel & close' => 'поништи & затвори',
        'Start Activity' => 'Почетак активности',
        'Contains %s dialog(s)' => 'Садржи %s дијалога',
        'Assigned dialogs' => 'Додељени дијалози',
        'Activities are not being used in this process.' => 'Активности се не користе у овом процесу.',
        'Assigned fields' => 'Додељена поља',
        'Activity dialogs are not being used in this process.' => 'Дијалози активности се не користе у овом процесу.',
        'Condition linking' => 'Услов повезивања',
        'Conditions' => 'Услови',
        'Condition' => 'Услов',
        'Transitions are not being used in this process.' => 'Транзиције се не користе у овом процесу.',
        'Module name' => 'Назив модула',
        'Transition actions are not being used in this process.' => 'Транзиционе активности се не користе у овом процесу.',

        # Template: AdminProcessManagementTransition
        'Please note that changing this transition will affect the following processes' =>
            'Напомињемо да би мењење ове транзиције утицало на пратеће процесе',
        'Transition' => 'Транзиција',
        'Transition Name' => 'Назив транзиције',
        'Conditions can only operate on non-empty fields.' => 'Услови могу да се примене само са поља која нису празна.',
        'Type of Linking between Conditions' => 'Тип везе између услова',
        'Remove this Condition' => 'Уклони овај услов',
        'Type of Linking' => 'Тип везе',
        'Add a new Field' => 'Додај ново поље',
        'Remove this Field' => 'Уклони ово поље',
        'And can\'t be repeated on the same condition.' => '„И” се не може поновити у истом услову.',
        'Add New Condition' => 'Додај нови услов',

        # Template: AdminProcessManagementTransitionAction
        'Please note that changing this transition action will affect the following processes' =>
            'Напомињемо да би мењење ове транзиционе активности утицало на пратеће процесе',
        'Transition Action' => 'Транзициона активност',
        'Transition Action Name' => 'Назив транзиционе активности',
        'Transition Action Module' => 'Модул транзиционе активности',
        'Config Parameters' => 'Конфигурациони параметри',
        'Add a new Parameter' => 'Додај нови параметар',
        'Remove this Parameter' => 'Уклони овај параметар',

        # Template: AdminQueue
        'Manage Queues' => 'Управљање редовима',
        'Add queue' => 'Додај ред',
        'Add Queue' => 'Додај Ред',
        'Edit Queue' => 'Уреди Ред',
        'A queue with this name already exists!' => 'Ред са овим именом већ постоји!',
        'Sub-queue of' => 'Под-ред од',
        'Unlock timeout' => 'Време до откључавања',
        '0 = no unlock' => '0 = нема откључавања',
        'Only business hours are counted.' => 'Рачуна се само радно време.',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Ако оператер закључа тикет и не откључа га пре истека времена откључавања, тикет ће се откључати и постати доступан другим запосленима.',
        'Notify by' => 'Обавештен од',
        '0 = no escalation' => '0 = нема ескалације',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Ако контакт са клијентом, било спољашњи имејл или телефон, није додат на нови тикет пре истицања дефинисаног времена, тикет ће ескалирати.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Ако постоји додат чланак, као нпр. наставак преко имејл поруке или клијентског портала, време ажурирања ескалације се ресетује. Ако не постоје контакт подаци о клијенту, било имејл или телефон додати на тикет пре истицања овде дефинисаног времена, тикет ескалира.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Ако се тикет не затвори пре овде дефинисаног времена, тикет ескалира.',
        'Follow up Option' => 'Опције наставка',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Дефинишите да ли наставак на затворени тикет поново отвара тикет или отвара нови.',
        'Ticket lock after a follow up' => 'Закључавање тикета после наставка',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Ако је тикет затворен, а клијент пошаље наставак, тикет ће бити закључан на старог власника.',
        'System address' => 'Системска адреса',
        'Will be the sender address of this queue for email answers.' => 'Биће адреса пошиљаоца за имејл одговоре из овог реда.',
        'Default sign key' => 'Подразумевани кључ потписа',
        'The salutation for email answers.' => 'Поздрав за имејл одговоре.',
        'The signature for email answers.' => 'Потпис за имејл одговоре.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => 'Управљање везама Ред-Аутоматски одговор',
        'This filter allow you to show queues without auto responses' => 'Овај филтер вам омогућава приказ редова без аутоматских одговора',
        'Queues without auto responses' => 'Редови без аутоматских одговора',
        'This filter allow you to show all queues' => 'Овај филтер вам омогућава приказ свих редова',
        'Show all queues' => 'Прикажи све редове',
        'Filter for Queues' => 'Филтер за редове',
        'Filter for Auto Responses' => 'Филтер за Аутоматске одговоре',
        'Auto Responses' => 'Аутоматски одговори',
        'Change Auto Response Relations for Queue' => 'Промени везе са Аутоматским одговорима за Ред',

        # Template: AdminQueueTemplates
        'Manage Template-Queue Relations' => 'Управљање односом Шаблон-Ред',
        'Filter for Templates' => 'Филтер за Шаблоне',
        'Templates' => 'Шаблони',
        'Change Queue Relations for Template' => 'Промена односа Реда за Шаблон',
        'Change Template Relations for Queue' => 'Промена односа Шаблона за Ред',

        # Template: AdminRegistration
        'System Registration Management' => 'Управљање системом регистрације',
        'Edit details' => 'Уреди детаље',
        'Show transmitted data' => 'Покажи послате податке',
        'Deregister system' => 'Одјави систем',
        'Overview of registered systems' => 'Преглед регистрованих система',
        'This system is registered with OTRS Group.' => 'Овај систем је регистрован у „OTRS” Групи.',
        'System type' => 'Тип система',
        'Unique ID' => 'Јединствени ИД',
        'Last communication with registration server' => 'Последња комуникација са регистрационим сервером',
        'System registration not possible' => 'Регистрација система није могућа',
        'Please note that you can\'t register your system if OTRS Daemon is not running correctly!' =>
            'Молимо да обратите пажњу да не можете регистровати ваш систем ако „OTRS” системски процес не ради коректно!',
        'Instructions' => 'Инструкције',
        'System deregistration not possible' => 'Дерегистрација система није могућа',
        'Please note that you can\'t deregister your system if you\'re using the %s or having a valid service contract.' =>
            'Молимо да обратите пажњу да не можете дерегистровати ваш систем ако користите %s или имате важећи сервисни уговор.',
        'OTRS-ID Login' => 'OTRS-ID пријава',
        'Read more' => 'Прочитај више',
        'You need to log in with your OTRS-ID to register your system.' =>
            'Потребно је да се пријавите са вашим OTRS-ID да региструјете ваш систем.',
        'Your OTRS-ID is the email address you used to sign up on the OTRS.com webpage.' =>
            'Ваш OTRS-ID је имејл адреса коју користите за пријаву на веб страну OTRS.com.',
        'Data Protection' => 'Заштита података',
        'What are the advantages of system registration?' => 'Које су предности регистрације система?',
        'You will receive updates about relevant security releases.' => 'Добићете ажурирања одговарајућих безбедносних издања.',
        'With your system registration we can improve our services for you, because we have all relevant information available.' =>
            'Са регистрацијом система можемо побољшати наше услуге за вас, јер ми имамо доступне све релевантне информације.',
        'This is only the beginning!' => 'Ово је само почетак!',
        'We will inform you about our new services and offerings soon.' =>
            'Информисаћемо вас о нашим новим услугама и понудама ускоро!',
        'Can I use OTRS without being registered?' => 'Да ли могу да користим „OTRS” уколико нисам регистрован?',
        'System registration is optional.' => 'Регистрација система је опционална.',
        'You can download and use OTRS without being registered.' => 'Можете преузети „OTRS” и уколико нисте регистровани.',
        'Is it possible to deregister?' => 'Да ли је могућа одјава?',
        'You can deregister at any time.' => 'Можете се одјавити у било које доба.',
        'Which data is transfered when registering?' => 'Који подаци се преносе приликом регистрације?',
        'A registered system sends the following data to OTRS Group:' => 'Регистровани систем шаље следеће податке „OTRS” Групи:',
        'Fully Qualified Domain Name (FQDN), OTRS version, Database, Operating System and Perl version.' =>
            'Пуно квалификовано име домена (FQDN), „OTRS” верзија, база података, оперативни систем и верзија Перла',
        'Why do I have to provide a description for my system?' => 'Зашто морам да проследим опис мог система?',
        'The description of the system is optional.' => 'Опис система је опциони.',
        'The description and system type you specify help you to identify and manage the details of your registered systems.' =>
            'Наведени опис и тип система помажу вам да идентификујете и управљате детаљима регистрованог система.',
        'How often does my OTRS system send updates?' => 'Колико често ће мој „OTRS” систем слати ажурирања?',
        'Your system will send updates to the registration server at regular intervals.' =>
            'Ваш систем ће у редовним временским интервалима слати ажурирања регистрационом серверу.',
        'Typically this would be around once every three days.' => 'Обично је то једном у свака три дана.',
        'In case you would have further questions we would be glad to answer them.' =>
            'У случају да имате додтана питања, биће нам задовољство да одговоримо на њих.',
        'Please visit our' => 'Молимо посетите наш',
        'portal' => 'portal',
        'and file a request.' => 'и поднесите захтев',
        'If you deregister your system, you will lose these benefits:' =>
            'Ако дерегиструјете ваш систем, изгубићете следеће олакшице:',
        'You need to log in with your OTRS-ID to deregister your system.' =>
            'Да би сте ођавили ваш систем, морате да се пријавите са вашим OTRS-ID',
        'OTRS-ID' => 'OTRS-ID',
        'You don\'t have an OTRS-ID yet?' => 'Још увек немате OTRS-ID?',
        'Sign up now' => 'Региструјте се сада',
        'Forgot your password?' => 'Заборавили сте лозинку?',
        'Retrieve a new one' => 'Преузми нову',
        'This data will be frequently transferred to OTRS Group when you register this system.' =>
            'Ови подаци ће бити пренети у „OTRS” Групу када региструјете овај систем.',
        'Attribute' => 'Атрибут',
        'FQDN' => 'FQDN',
        'OTRS Version' => '„OTRS” верзија',
        'Operating System' => 'Оперативни систем',
        'Perl Version' => 'Perl верзија',
        'Optional description of this system.' => 'Опциони опис овог система.',
        'Register' => 'Региструј',
        'Deregister System' => 'Искључи систем из регистра',
        'Continuing with this step will deregister the system from OTRS Group.' =>
            'Настављање овог корака ће ођавити систем из „OTRS” Групе.',
        'Deregister' => 'Искључи из регистра',
        'You can modify registration settings here.' => 'Овде можете изменити регистрациона подешавања.',
        'Overview of transmitted data' => 'Преглед послатих података',
        'There is no data regularly sent from your system to %s.' => 'Нема података који су редовно слати са вашег система за %s.',
        'The following data is sent at minimum every 3 days from your system to %s.' =>
            'Следећи подаци су слати барем свака 3 дана са вашег система за %s.',
        'The data will be transferred in JSON format via a secure https connection.' =>
            'Подаци ће бити послати у „JSON” формату преко сигурне „https” везе. ',
        'System Registration Data' => 'Подаци о регистрацији система',
        'Support Data' => 'Подаци подршке',

        # Template: AdminRole
        'Role Management' => 'Управљање улогама',
        'Add role' => 'Додај улогу',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Направи улогу и додај групе у њу. Онда додај улогу корисницима.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'Нема дефинисаних улога. употребите дугме \'Add\' за креирање нове улоге.',
        'Add Role' => 'Додај Улогу',
        'Edit Role' => 'Уреди Улогу',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => 'Управљање везама Улога-Група',
        'Filter for Roles' => 'Филтер за улоге',
        'Roles' => 'Улоге',
        'Select the role:group permissions.' => 'Изабери дозволе за улогу:групу',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Уколико ништа није изабрано, онда нема дозвола у овој групи (тикети неће бити доступни за ову улогу).',
        'Change Role Relations for Group' => 'Промени везе са улогама за групу',
        'Change Group Relations for Role' => 'Промени везе са групама за улогу',
        'Toggle %s permission for all' => 'Промени %s дозволе за све',
        'move_into' => 'премести у',
        'Permissions to move tickets into this group/queue.' => 'Дозволе да се тикети преместе у ову групу/ред.',
        'create' => 'kreiranje',
        'Permissions to create tickets in this group/queue.' => 'Дозвола да се тикет креира у ову групу/ред.',
        'note' => 'напомена',
        'Permissions to add notes to tickets in this group/queue.' => 'Дозволе за додавање напомена на тикете у овој групи/реду.',
        'owner' => 'власник',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Дозволе за промену власника тикета у овој групи/реду.',
        'priority' => 'приоритет',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Дозвола да се мења приоритет тикета у овој групи/реду.',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => 'Управљање везама Оператер-Улога',
        'Add agent' => 'Додај оператера',
        'Filter for Agents' => 'Филтер за оператере',
        'Agents' => 'Оператери',
        'Manage Role-Agent Relations' => 'Управљање везама Улога-Оператер',
        'Change Role Relations for Agent' => 'Промени везе са улогом за оператера',
        'Change Agent Relations for Role' => 'Промени везе са оператером за улогу',

        # Template: AdminSLA
        'SLA Management' => 'Управљање SLA',
        'Add SLA' => 'Додај SLA',
        'Edit SLA' => 'Уреди SLA',
        'Please write only numbers!' => 'Молимо пишите само бројеве!',

        # Template: AdminSMIME
        'S/MIME Management' => 'S/MIME управљање',
        'SMIME support is disabled' => '„SMIME” подршка је онемогућена',
        'To be able to use SMIME in OTRS, you have to enable it first.' =>
            'Да би могли да користите „SMIME” у „OTRS”, морате је прво омогућити.',
        'Enable SMIME support' => 'Омогући „SMIME” подршку',
        'Faulty SMIME configuration' => 'Неисправна „SMIME” конфигурација',
        'SMIME support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            '„SMIME” подршка ја омогућена али релевантна конфигурација садржи грешке. Молимо да проверите конфигурацију притиском на дугме испод.',
        'Check SMIME configuration' => 'Провери „SMIME” конфигурацију',
        'Add certificate' => 'Додај сертификат',
        'Add private key' => 'Додај приватни кључ',
        'Filter for certificates' => 'Филтер за сертификате',
        'Filter for S/MIME certs' => 'Филтер за S/MIME сертификате',
        'To show certificate details click on a certificate icon.' => 'За приказивање детаља сертификата кликни на иконицу сертификат.',
        'To manage private certificate relations click on a private key icon.' =>
            'За управљање везама приватног сертификата кликните на иконицу приватни кључ.',
        'Here you can add relations to your private certificate, these will be embedded to the S/MIME signature every time you use this certificate to sign an email.' =>
            'Овде можете додати везе на ваш приватни сертификат, што ће бити уграђено у „S/MIME” потпис сваки пут кад употребите овај сертификат за потпис имејла.',
        'See also' => 'Погледај још',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'На овај начин можете директно да уређујете сертификате и приватне кључеве у систему датотека.',
        'Hash' => 'Hash',
        'Handle related certificates' => 'Руковање повезаним сертификатима',
        'Read certificate' => 'Читај сертификат',
        'Delete this certificate' => 'Обриши овај сертификат',
        'Add Certificate' => 'Додај сертификат',
        'Add Private Key' => 'Додај приватни кључ',
        'Secret' => 'Тајна',
        'Related Certificates for' => 'Повезани сертификати за',
        'Delete this relation' => 'Обриши ову везу',
        'Available Certificates' => 'Расположиви сертификати',
        'Relate this certificate' => 'Повежи овај сертификат',

        # Template: AdminSMIMECertRead
        'Close dialog' => 'Затворите дијалог',
        'Certificate details' => 'Детаљи сертификата',

        # Template: AdminSalutation
        'Salutation Management' => 'Управљање поздравима',
        'Add salutation' => 'Додај поздрав',
        'Add Salutation' => 'Додај Поздрав',
        'Edit Salutation' => 'Уреди Поздрав',
        'e. g.' => 'нпр.',
        'Example salutation' => 'Пример поздрава',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => 'Потребно је да сигуран мод буде укључен!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'Сигуран мод ће (уобичајено) бити подешен након иницијалне инсталације.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Уколико сигуран мод није активиран, покрените га кроз системску конфигурацију јер је ваша апликација већ покренута.',

        # Template: AdminSelectBox
        'SQL Box' => 'SQL Бокс',
        'Here you can enter SQL to send it directly to the application database. It is not possible to change the content of the tables, only select queries are allowed.' =>
            'Овде можете унети SQL команде и послати их директно апликационој бази података. Није могуће мењати садржај табела, дозвољен је једино \'select\' упит.',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Овде можете унети SQL команде и послати их директно апликационој бази података.',
        'Only select queries are allowed.' => 'Дозвољени су само „select” упити.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'Постоји грешка у синтакси вашег SQL упита. Молимо проверите.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'Најмање један параметар недостаје за повезивање. Молимо проверите.',
        'Result format' => 'Формат резултата',
        'Run Query' => 'Покрени упит',
        'Query is executed.' => 'Упит је извршен.',

        # Template: AdminService
        'Service Management' => 'Управљање услугама',
        'Add service' => 'Додај услугу',
        'Add Service' => 'Додај услугу',
        'Edit Service' => 'Уреди услугу',
        'Sub-service of' => 'Под-услуга од',

        # Template: AdminSession
        'Session Management' => 'Управљање сесијама',
        'All sessions' => 'Све сесије',
        'Agent sessions' => 'Сесије оператера',
        'Customer sessions' => 'Сесије клијената',
        'Unique agents' => 'Јединствени оператери',
        'Unique customers' => 'Јединствени клијенти',
        'Kill all sessions' => 'Угаси све сесије',
        'Kill this session' => 'Угаси ову сесију',
        'Session' => 'Сесија',
        'Kill' => 'Угаси',
        'Detail View for SessionID' => 'Детаљни преглед за ИД сесије',

        # Template: AdminSignature
        'Signature Management' => 'Управљање потписима',
        'Add signature' => 'Додај потпис',
        'Add Signature' => 'Додај Потпис',
        'Edit Signature' => 'Уреди Потпис',
        'Example signature' => 'Пример потписа',

        # Template: AdminState
        'State Management' => 'Управљање статусима',
        'Add state' => 'Додај статус',
        'Please also update the states in SysConfig where needed.' => 'Молимо да ажурирате стаусе и у системској конфигурацији где је то потребно.',
        'Add State' => 'Додај Статус',
        'Edit State' => 'Уреди Статус',
        'State type' => 'Тип статуса',

        # Template: AdminSupportDataCollector
        'Sending support data to OTRS Group is not possible!' => 'Слање података за подршку за „OTRS” Групи није могуће!',
        'Enable Cloud Services' => 'Активирај сервисе у облаку',
        'This data is sent to OTRS Group on a regular basis. To stop sending this data please update your system registration.' =>
            'Ови подаци се шаљу „OTRS” Групи по регуларној основи. Да зауставите слање ових података молимо вас да ажурирате регистрацију.',
        'You can manually trigger the Support Data sending by pressing this button:' =>
            'Можете мануелно активирати слање подржаних података притискањем овог дугмета:',
        'Send Update' => 'Пошаљи ажурирање',
        'Sending Update...' => 'Слање ажурирања...',
        'Support Data information was successfully sent.' => 'Информације подржаних података су успешно послате.',
        'Was not possible to send Support Data information.' => 'Није могуће послати информације подржаних података.',
        'Update Result' => 'Резултат ажурирања',
        'Currently this data is only shown in this system.' => 'Тренутно су ови подаци приказани само у овом систему.',
        'A support bundle (including: system registration information, support data, a list of installed packages and all locally modified source code files) can be generated by pressing this button:' =>
            'Пакет за подршку (укључујући: информације о регистрацији система, податке за подршку, листу инсталираних пакета и свих локално модификованих датотека изворног кода) може бити генерисан притиском на ово дугме:',
        'Generate Support Bundle' => 'Генериши пакет подршке',
        'Generating...' => 'Генеришем...',
        'It was not possible to generate the Support Bundle.' => 'Није могуће генерисати Пакет подршке.',
        'Generate Result' => 'Генериши резултат',
        'Support Bundle' => 'Пакет подршке',
        'The mail could not be sent' => 'Имејл се не може послати',
        'The support bundle has been generated.' => 'Пакет подршке ће бити генерисан.',
        'Please choose one of the following options.' => 'Молимо изаберите једну од понуђених опција.',
        'Send by Email' => 'Послато имејлом',
        'The support bundle is too large to send it by email, this option has been disabled.' =>
            'Пакет подршке је превелик за слање путем имејла, ова опција је онемогућена.',
        'The email address for this user is invalid, this option has been disabled.' =>
            'Имејл адреса овог корисника је неважећа, ова опција је искључена.',
        'Sending' => 'Слање',
        'The support bundle will be sent to OTRS Group via email automatically.' =>
            'Пакет подршке ће бити аутоматски послат имејлом „OTRS” групи.',
        'Download File' => 'Преузми датотеку',
        'A file containing the support bundle will be downloaded to the local system. Please save the file and send it to the OTRS Group, using an alternate method.' =>
            'Датотека која садржи пакет за подршку ће бити преузета на локални рачунар. Молимо вас да сачувате датотеку и да нам („OTRS Group”) је пошаљете на неки други начин.',
        'Error: Support data could not be collected (%s).' => 'Подржани подаци не могу бити прикупљени (%s).',
        'Details' => 'Детаљи',

        # Template: AdminSysConfig
        'SysConfig' => 'Системска конфигурација',
        'Navigate by searching in %s settings' => 'Навигација кроз претраживање у %s подешавањима',
        'Navigate by selecting config groups' => 'Навигација избором конфигурационих група',
        'Download all system config changes' => 'Преузми све промене системских подешавања',
        'Export settings' => 'Извези подешавања',
        'Load SysConfig settings from file' => 'Учитај системска подешавања из датотеке',
        'Import settings' => 'Увези подешавања',
        'Import Settings' => 'Увези Подешавања',
        'Please enter a search term to look for settings.' => 'Молимо унесите појам претраге за тражење подешавања.',
        'Subgroup' => 'Подгрупа',
        'Elements' => 'Елементи',

        # Template: AdminSysConfigEdit
        'Edit Config Settings in %s → %s' => 'Уреди конфигурациона подешавања у %s → %s',
        'This setting is read only.' => 'Ово подешавање се може само прегледати.',
        'This config item is only available in a higher config level!' =>
            'Ова конфигурациона ставка је доступна само на вишем конфигурационом нивоу',
        'Reset this setting' => 'Поништи ово подешавање',
        'Error: this file could not be found.' => 'Грешка: не може се пронаћи ова датотека.',
        'Error: this directory could not be found.' => 'Грешка: не може се пронаћи овај директоријум.',
        'Error: an invalid value was entered.' => 'Грешка: унета је неважећа вредност.',
        'Content' => 'Садржај',
        'Remove this entry' => 'Уклони овај унос',
        'Add entry' => 'Додај унос',
        'Remove entry' => 'Уклони унос',
        'Add new entry' => 'Додај нов унос',
        'Delete this entry' => 'Обриши овај унос',
        'Create new entry' => 'Направи нов унос',
        'New group' => 'Нова група',
        'Group ro' => 'Група „ro”',
        'Readonly group' => 'Група само за читање',
        'New group ro' => 'Нова „ro” група',
        'Loader' => 'Програм за учитавање',
        'File to load for this frontend module' => 'Датотека коју треба учитати за овај кориснички модул',
        'New Loader File' => 'Нова датотека програма за учитавање',
        'NavBarName' => 'Назив навигационе траке',
        'NavBar' => 'Навигациона трака',
        'LinkOption' => 'Опције везе',
        'Block' => 'Блок',
        'AccessKey' => 'Кључ за приступ',
        'Add NavBar entry' => 'Додај ставку у навигациону траку',
        'NavBar module' => 'Модул навигационе траке',
        'Year' => 'Година',
        'Month' => 'Месец',
        'Day' => 'Дан',
        'Invalid year' => 'Погрешна година',
        'Invalid month' => 'Погрешан месец',
        'Invalid day' => 'Погрешан дан',
        'Show more' => 'Прикажи више',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Управљање системском имејл адресом',
        'Add system address' => 'Додај системску адресу',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Све долазне поруке са овом адресом у пољу „За” или „Cc” биће отпремљене у изабрани ред.',
        'Email address' => 'Имејл адреса',
        'Display name' => 'Прикажи име',
        'Add System Email Address' => 'Додај системску имејл адресу',
        'Edit System Email Address' => 'Уреди системску имејл адресу',
        'The display name and email address will be shown on mail you send.' =>
            'Приказано име и имејл адреса ће бити приказани на поруци коју сте послали.',

        # Template: AdminSystemMaintenance
        'System Maintenance Management' => 'Управљање системом одржавања',
        'Schedule New System Maintenance' => 'Планирај ново оржавање система.',
        'Schedule a system maintenance period for announcing the Agents and Customers the system is down for a time period.' =>
            'Планирање периода одржавања система ради обавештавања оператера и клијената да је систем искључен у том периоду. ',
        'Some time before this system maintenance starts the users will receive a notification on each screen announcing about this fact.' =>
            'Неко време пре него отпочне одржавање система, корисници ће добити обавештење које најављује овај догађај на сваки екран.',
        'Start date' => 'Датум почетка',
        'Stop date' => 'Датум завршетка',
        'Delete System Maintenance' => 'Обриши одржавање система',
        'Do you really want to delete this scheduled system maintenance?' =>
            'Да ли стварно желите да обришете ово планирано оржавање система?',

        # Template: AdminSystemMaintenanceEdit
        'Edit System Maintenance %s' => 'Уреди одржавање система %s',
        'Edit System Maintenance Information' => 'Уреди одржавање система',
        'Date invalid!' => 'Неисправан датум',
        'Login message' => 'Порука пријаве',
        'Show login message' => 'Покажи поруку пријаве',
        'Notify message' => 'Порука обавештења',
        'Manage Sessions' => 'Управљање сесијама',
        'All Sessions' => 'Све сесије',
        'Agent Sessions' => 'Сесије оператера',
        'Customer Sessions' => 'Сесије клијената',
        'Kill all Sessions, except for your own' => 'Прекини све сесије, осим сопствене',

        # Template: AdminTemplate
        'Manage Templates' => 'Управљање шаблонима',
        'Add template' => 'Додај шаблон',
        'A template is a default text which helps your agents to write faster tickets, answers or forwards.' =>
            'Шаблон је подразумевани текст који помаже вашим агентима да брже испишу тикете, одговоре или прослеђене поруке.',
        'Don\'t forget to add new templates to queues.' => 'Не заборавите да додате нови шаблон у реду.',
        'Do you really want to delete this template?' => 'Да ли стварно желите да обришете овај шаблон?',
        'Add Template' => 'Додај Шаблон',
        'Edit Template' => 'Уреди Шаблон',
        'A standard template with this name already exists!' => 'Стандардни шаблон са овим називом већ постоји!',
        'Create type templates only supports this smart tags' => 'Креирај тип шаблона који подржавају само ове паметне ознаке.',
        'Example template' => 'Пример шаблона',
        'The current ticket state is' => 'Тренутни стаус тикета је',
        'Your email address is' => 'Ваша имејл адреса је',

        # Template: AdminTemplateAttachment
        'Manage Templates <-> Attachments Relations' => 'Управљање везама Шаблони <-> Прилози',
        'Filter for Attachments' => 'Филтер за прилоге',
        'Change Template Relations for Attachment' => 'Промени везе шаблона за прилог',
        'Change Attachment Relations for Template' => 'Промени везе прилога за шаблон',
        'Toggle active for all' => 'Промени стање у активан за све',
        'Link %s to selected %s' => 'Повежи %s са изабраним %s',

        # Template: AdminType
        'Type Management' => 'Управљање типовима',
        'Add ticket type' => 'Додај тип тикета',
        'Add Type' => 'Додај Тип ',
        'Edit Type' => 'Уреди Тип',
        'A type with this name already exists!' => 'Тип са овим именом већ постоји!',

        # Template: AdminUser
        'Agents will be needed to handle tickets.' => 'Биће потребни оператери за обраду тикета.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'Не заборавите да додате новог оператера у групе и/или улоге!',
        'Please enter a search term to look for agents.' => 'Молимо унесите појам за претрагу ради налажења оператера.',
        'Last login' => 'Претходна пријава',
        'Switch to agent' => 'Пређи на оператера',
        'Add Agent' => 'Додај Оператера',
        'Edit Agent' => 'Уреди Оператера',
        'Title or salutation' => 'Наслов поздрава',
        'Firstname' => 'Име',
        'Lastname' => 'Презиме',
        'A user with this username already exists!' => 'Ово корисничко име је већ употребљено!',
        'Will be auto-generated if left empty.' => 'Биће аутоматски генерисано ако се остави празно.',
        'Start' => 'Почетак',
        'End' => 'Крај',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => 'Управљање везама Оператер-Група',
        'Change Group Relations for Agent' => 'Промени везе са групом за оператера',
        'Change Agent Relations for Group' => 'Промени везе са оператером за групу',

        # Template: AgentBook
        'Address Book' => 'Адресар',
        'Search for a customer' => 'Тражи клијента',
        'Add email address %s to the To field' => 'Додај имејл адресу %s у поље „За”',
        'Add email address %s to the Cc field' => 'Додај имејл адресу %s у поље „Cc”',
        'Add email address %s to the Bcc field' => 'Додај имејл адресу %s у поље „Bcc”',
        'Apply' => 'Примени',

        # Template: AgentCustomerInformationCenter
        'Customer Information Center' => 'Клијентски информативни центар',

        # Template: AgentCustomerInformationCenterSearch
        'Customer User' => 'Клијент корисник',

        # Template: AgentCustomerSearch
        'Duplicated entry' => 'Двоструки унос',
        'This address already exists on the address list.' => 'Ова адреса већ постоји у листи',
        'It is going to be deleted from the field, please try again.' => 'Биће обрисано из поља, молимо покушајте поново.',

        # Template: AgentCustomerTableView
        'Note: Customer is invalid!' => 'Напомена: Клијент је неважећи!',
        'Start chat' => 'Почни ћаскање',
        'Video call' => 'Видео позив',
        'Audio call' => 'Аудио позив',

        # Template: AgentDaemonInfo
        'The OTRS Daemon is a daemon process that performs asynchronous tasks, e.g. ticket escalation triggering, email sending, etc.' =>
            '„OTRS” сервис је системски процес који извршава асинхроне задатке, нпр. окидање ескалација тикета, слање имејлова, итд.',
        'A running OTRS Daemon is mandatory for correct system operation.' =>
            'Покренут „OTRS” сервис је неопходан за исправно функционисање система.',
        'Starting the OTRS Daemon' => 'Покретање „OTRS” сервиса',
        'Make sure that the file \'%s\' exists (without .dist extension). This cron job will check every 5 minutes if the OTRS Daemon is running and start it if needed.' =>
            'Осигурава да датотека „%s” постоји (без „.dist” екстензије). Овај крон посао ће проверавати сваких 5 минута да ли „OTRS” сервис ради и покреће га ако је потребно.',
        'Execute \'%s start\' to make sure the cron jobs of the \'otrs\' user are active.' =>
            'Извршите „%s start” да би били сигурни да су крон послови за „OTRS” корисника увек активни.',
        'After 5 minutes, check that the OTRS Daemon is running in the system (\'bin/otrs.Daemon.pl status\').' =>
            'После 5 минута, проверава да ли „OTRS” сервис функционише у систему („bin/otrs.Daemon.pl status”).',

        # Template: AgentDashboard
        'Dashboard' => 'Командна табла',

        # Template: AgentDashboardCalendarOverview
        'in' => 'у',

        # Template: AgentDashboardCommon
        'Close this widget' => 'Затвори овај додатак',
        'Available Columns' => 'Расположиве колоне',
        'Visible Columns (order by drag & drop)' => 'Видљиве колоне (редослед према превуци и пусти)',

        # Template: AgentDashboardCustomerIDStatus
        'Escalated tickets' => 'Ескалирани тикети',

        # Template: AgentDashboardCustomerUserList
        'Customer login' => 'Пријава клијента',
        'Customer information' => 'Информације о клијенту',
        'Phone ticket' => 'Телефонски тикет',
        'Email ticket' => 'Имејл тикет',
        '%s open ticket(s) of %s' => '%s отворених тикета од %s',
        '%s closed ticket(s) of %s' => '%s затворених тикета од %s',
        'New phone ticket from %s' => 'Нови телефонски тикет од %s',
        'New email ticket to %s' => 'Нови имејл тикет од %s',

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s је доступно!',
        'Please update now.' => 'Молимо ажурирајте сада.',
        'Release Note' => 'Напомена уз издање',
        'Level' => 'Nivo',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Послато пре %s.',

        # Template: AgentDashboardStats
        'The configuration for this statistic widget contains errors, please review your settings.' =>
            'Конфигурација за овај статистички додатак садржи грешке, моломо проверите ваша подешавања.',
        'Download as SVG file' => 'Преузми као „SVG” датотеку',
        'Download as PNG file' => 'Преузми као „PNG” датотеку',
        'Download as CSV file' => 'Преузми као „CSV” датотеку',
        'Download as Excel file' => 'Преузми као „Excel” датотеку',
        'Download as PDF file' => 'Преузми као „PDF” датотеку',
        'Grouped' => 'Груписано',
        'Stacked' => 'Наслагано',
        'Expanded' => 'Проширено',
        'Stream' => 'Проток',
        'No Data Available.' => '',
        'Please select a valid graph output format in the configuration of this widget.' =>
            'Молимо да у конфигурацији овог додатка изаберете важећи излазни формат графикона.',
        'The content of this statistic is being prepared for you, please be patient.' =>
            'Садржај ове статистике се припрема за вас, молимо будите стрпљиви.',
        'This statistic can currently not be used because its configuration needs to be corrected by the statistics administrator.' =>
            'Ова статистика се тренутно не може користити зато што администратор статистике треба да коригује њену конфигурацију.',

        # Template: AgentDashboardTicketGeneric
        'My locked tickets' => 'Моји закључани тикети',
        'My watched tickets' => 'Моји праћени тикети',
        'My responsibilities' => 'Одговоран сам за',
        'Tickets in My Queues' => 'Тикети у мојим редовима',
        'Tickets in My Services' => 'Тикети у мојим услугама',
        'Service Time' => 'Време услуге',
        'Remove active filters for this widget.' => 'Уклони активне филтере за овај апликативни додатак (widget).',

        # Template: AgentDashboardTicketQueueOverview
        'Totals' => 'Укупне вредности',

        # Template: AgentDashboardUserOnline
        'out of office' => 'ван канцеларије',

        # Template: AgentDashboardUserOutOfOffice
        'until' => 'dok',

        # Template: AgentHTMLReferencePageLayout
        'The ticket has been locked' => 'Тикет је закључан.',
        'Undo & close' => 'Одустани & затвори',

        # Template: AgentInfo
        'Info' => 'Инфо',
        'To accept some news, a license or some changes.' => 'Да би прихватили неке вести, дозволе или неке промене.',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Повежи објекат: %s',
        'go to link delete screen' => 'иди на екран за брисање везе',
        'Select Target Object' => 'Изабери циљни објекат',
        'Link object %s with' => 'Повежи објекат %s  са',
        'Unlink Object: %s' => 'Прекини везу са објектом: %s',
        'go to link add screen' => 'иди на екран за додавање везе',

        # Template: AgentOTRSBusinessBlockScreen
        'Unauthorized usage of %s detected' => 'Детектована неовлаштена употреба %s',
        'If you decide to downgrade to OTRS Free, you will lose all database tables and data related to %s.' =>
            'Ако одлучите да се вратите на верзију бесплатног „OTRS”, изгубићете све табеле у бази података и податке повезане са %s.',

        # Template: AgentPreferences
        'Edit your preferences' => 'Уреди личне поставке',
        'Did you know? You can help translating OTRS at %s.' => 'Да ли сте знали? Можете да помогнете у превођењу „OTRS” на %s.',

        # Template: AgentSpelling
        'Spell Checker' => 'Провера правописа',
        'spelling error(s)' => 'Правописне грешке',
        'Apply these changes' => 'Примени ове измене',

        # Template: AgentStatisticsAdd
        'Statistics » Add' => 'Статистика » Додај',
        'Add New Statistic' => 'Додај нову статистику',
        'Dynamic Matrix' => 'Динамичка матрица',
        'Tabular reporting data where each cell contains a singular data point (e. g. the number of tickets).' =>
            'Табеларни подаци извештаја где свака ћелија садржи само један податак (нпр број тикета).',
        'Dynamic List' => 'Динамичка листа',
        'Tabular reporting data where each row contains data of one entity (e. g. a ticket).' =>
            'Табеларни подаци извештаја где сваки ред садржи податке о само једном ентитету (нпр тикет).',
        'Static' => 'Статички',
        'Complex statistics that cannot be configured and may return non-tabular data.' =>
            'Компликована статистика која се не може подесити и може да врати неформатиране податке.',
        'General Specification' => 'Општа спецификација',
        'Create Statistic' => 'Креирај статистику',

        # Template: AgentStatisticsEdit
        'Statistics » Edit %s%s — %s' => 'Статистика » Измени %s%s — %s',
        'Run now' => 'Покрени сад',
        'Statistics Preview' => 'Преглед статистике',
        'Save statistic' => 'Сачувај статистику',

        # Template: AgentStatisticsImport
        'Statistics » Import' => 'Статистика » Увоз',
        'Import Statistic Configuration' => 'Увези конфигурацију статистике',

        # Template: AgentStatisticsOverview
        'Statistics » Overview' => 'Статистика » Преглед',
        'Statistics' => 'Статистике',
        'Run' => 'Покрени',
        'Edit statistic "%s".' => 'Измени статистику „%s”.',
        'Export statistic "%s"' => 'Извези статистику „%s”.',
        'Export statistic %s' => 'Измени статистику %s',
        'Delete statistic "%s"' => 'Обриши статистику „%s”.',
        'Delete statistic %s' => 'Обриши статистику %s',
        'Do you really want to delete this statistic?' => 'Да ли стварно желите да обришете ову статистику?',

        # Template: AgentStatisticsView
        'Statistics » View %s%s — %s' => 'Статистика » Погледај %s%s — %s',
        'Statistic Information' => 'Статистичке информације',
        'Sum rows' => 'Збир редова',
        'Sum columns' => 'Збир колона',
        'Show as dashboard widget' => 'Прикажи контролну таблу апликативног додатка (Widget-a)',
        'Cache' => 'Кеш',
        'This statistic contains configuration errors and can currently not be used.' =>
            'Ова статистика садржи конфигурационе грешке и сад се не може користити.',

        # Template: AgentTicketActionCommon
        'Change Free Text of %s%s%s' => 'Промени слободни текст за %s%s%s',
        'Change Owner of %s%s%s' => 'Промени власника за %s%s%s',
        'Close %s%s%s' => 'Затвори %s%s%s',
        'Add Note to %s%s%s' => 'Додај напомену %s%s%s',
        'Set Pending Time for %s%s%s' => 'Постави време чекања за %s%s%s',
        'Change Priority of %s%s%s' => 'Промени приоритет за %s%s%s',
        'Change Responsible of %s%s%s' => 'Промени одговорног за %s%s%s',
        'All fields marked with an asterisk (*) are mandatory.' => 'Сва поља означена звездицом (*) су обавезна.',
        'Service invalid.' => 'Неважећа услуга.',
        'New Owner' => 'Нови власник',
        'Please set a new owner!' => 'Молимо да одредите новог власника!',
        'New Responsible' => 'Нови одговорни',
        'Next state' => 'Следећи статус',
        'For all pending* states.' => 'За сва стања* чекања.',
        'Add Article' => 'Додај чланак',
        'Create an Article' => 'Креирај чланак',
        'Inform agents' => 'Обавести оператере',
        'Inform involved agents' => 'Обавести укључене оператере',
        'Here you can select additional agents which should receive a notification regarding the new article.' =>
            'Овде можете изабрати додатне оператере који треба да примају обавештења у вези са новим чланком.',
        'Text will also be received by' => 'Текст ће такође примити и:',
        'Spell check' => 'Провера правописа',
        'Text Template' => 'Шаблон текста',
        'Setting a template will overwrite any text or attachment.' => 'Подешавање шаблона ће преписати сваки текст или прилог.',
        'Note type' => 'Тип напомене',

        # Template: AgentTicketBounce
        'Bounce %s%s%s' => 'Одбаци %s%s%s',
        'Bounce to' => 'Преусмери на',
        'You need a email address.' => 'Потребна вам је имејл адреса.',
        'Need a valid email address or don\'t use a local email address.' =>
            'Исправна имејл адреса је неопходна, али не користите локалну адресу!',
        'Next ticket state' => 'Наредни статус тикета',
        'Inform sender' => 'Обавести пошиљаоца',
        'Send mail' => 'Пошаљи имејл!',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Масовне акције на тикетима',
        'Send Email' => 'Пошаљи имејл',
        'Merge to' => 'Обједини са',
        'Invalid ticket identifier!' => 'Неважећи идентификатор тикета!',
        'Merge to oldest' => 'Обједини са најстаријом',
        'Link together' => 'Повежи заједно',
        'Link to parent' => 'Повежи са надређеним',
        'Unlock tickets' => 'Откључај тикете',
        'Execute Bulk Action' => 'Изврши масовну акцију',

        # Template: AgentTicketCompose
        'Compose Answer for %s%s%s' => 'Напиши одговор за %s%s%s',
        'This address is registered as system address and cannot be used: %s' =>
            'Ова адреса је регистрована као системска и не може бити коришћена: %s',
        'Please include at least one recipient' => 'Молимо да укључите бар једног примаоца',
        'Remove Ticket Customer' => 'Уклони клијент са тикета **',
        'Please remove this entry and enter a new one with the correct value.' =>
            'Молимо да уклоните овај унос и унесете нов са исправном вредношћу.',
        'Remove Cc' => 'Уклони Cc',
        'Remove Bcc' => 'Уклони Bcc',
        'Address book' => 'Адресар',
        'Date Invalid!' => 'Неисправан датум!',

        # Template: AgentTicketCustomer
        'Change Customer of %s%s%s' => 'Промени клијента за %s%s%s',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => 'Отвори нови имејл тикет',
        'Example Template' => 'Пример шаблона',
        'From queue' => 'из реда',
        'To customer user' => 'За клијента корисника',
        'Please include at least one customer user for the ticket.' => 'Молимо вас укључите барем једног клијента корисника за тикет.',
        'Select this customer as the main customer.' => 'Означи овог клијента као главног клијента.',
        'Remove Ticket Customer User' => 'Уклони тикет клијента корисника **',
        'Get all' => 'Узми све',

        # Template: AgentTicketEmailOutbound
        'Outbound Email for %s%s%s' => 'Излазни имејл за %s%s%s',

        # Template: AgentTicketEscalation
        'Ticket %s: first response time is over (%s/%s)!' => 'Тикет %s: време одзива је истекло (%s/%s)!',
        'Ticket %s: first response time will be over in %s/%s!' => 'Тикет %s: време одзива ће истећи за %s/%s!',
        'Ticket %s: update time is over (%s/%s)!' => 'Тикет %s: време ажурирања је преко (%s/%s)!',
        'Ticket %s: update time will be over in %s/%s!' => 'Тикет %s: време ажурирања истиче за %s/%s!',
        'Ticket %s: solution time is over (%s/%s)!' => 'Тикет %s: време решавања је истекло (%s/%s)!',
        'Ticket %s: solution time will be over in %s/%s!' => 'Тикет %s: време решавања истиче за %s/%s!',

        # Template: AgentTicketForward
        'Forward %s%s%s' => 'Проследи %s%s%s',

        # Template: AgentTicketHistory
        'History of %s%s%s' => 'Историјат од %s%s%s',
        'History Content' => 'Садржај историје',
        'Zoom view' => 'Увећани преглед',

        # Template: AgentTicketMerge
        'Merge %s%s%s' => 'Споји %s%s%s',
        'Merge Settings' => 'Подешавања спајања',
        'You need to use a ticket number!' => 'Молимо вас да користите број тикета!',
        'A valid ticket number is required.' => 'Неопходан је исправан број тикета.',
        'Need a valid email address.' => 'Потребна је исправна имејл адреса.',

        # Template: AgentTicketMove
        'Move %s%s%s' => 'Премести %s%s%s',
        'New Queue' => 'Нови Ред',

        # Template: AgentTicketOverviewMedium
        'Select all' => 'Изабери све',
        'No ticket data found.' => 'Нису нађени подаци о тикету',
        'Open / Close ticket action menu' => 'Акциони мени Отварања / Затварања тикета',
        'Select this ticket' => 'Изаберите овај тикет',
        'First Response Time' => 'Време првог одговора',
        'Update Time' => 'Време ажурирања',
        'Solution Time' => 'Време решавања',
        'Move ticket to a different queue' => 'Премести тикет у други ред',
        'Change queue' => 'Промени ред',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Промени опције претраге',
        'Remove active filters for this screen.' => 'Уклони активне филтере за овај екран.',
        'Tickets per page' => 'Тикета по страни',

        # Template: AgentTicketOverviewSmall
        'Reset overview' => 'Рестуј преглед',
        'Column Filters Form' => 'Форма филтера колона',

        # Template: AgentTicketPhone
        'Split Into New Phone Ticket' => 'Подели у нови телефонски тикет',
        'Save Chat Into New Phone Ticket' => 'Сачувај ћаскање у нови телефонски тикет',
        'Create New Phone Ticket' => 'Отвори нови телефонски тикет',
        'Please include at least one customer for the ticket.' => 'Молимо да укључите бар једног клијента за тикет.',
        'To queue' => 'У ред',
        'Chat protocol' => 'Протокол ћаскања',
        'The chat will be appended as a separate article.' => 'Ћаскање ће бити додато као посебан чланак.',

        # Template: AgentTicketPhoneCommon
        'Phone Call for %s%s%s' => 'Телефонски позив за %s%s%s',

        # Template: AgentTicketPlain
        'View Email Plain Text for %s%s%s' => 'Приказ имејла као обичан текст за %s%s%s',
        'Plain' => 'Неформатирано',
        'Download this email' => 'Preuzmi ovu poruku',

        # Template: AgentTicketProcess
        'Create New Process Ticket' => 'Креирај нови процес тикет',
        'Process' => 'Proces',

        # Template: AgentTicketProcessSmall
        'Enroll Ticket into a Process' => 'Прикључи тикет процесу',

        # Template: AgentTicketSearch
        'Search template' => 'Шаблон претраге',
        'Create Template' => 'Направи шаблон',
        'Create New' => 'Направи нов',
        'Profile link' => 'Веза профила',
        'Save changes in template' => 'Сачувај промене у шаблону',
        'Filters in use' => 'Филтери у употреби',
        'Additional filters' => 'Додатни филтери',
        'Add another attribute' => 'Додај још један атрибут',
        'Output' => 'Преглед резултата',
        'Fulltext' => 'Текст',
        'Remove' => 'Уклони',
        'Searches in the attributes From, To, Cc, Subject and the article body, overriding other attributes with the same name.' =>
            'Претраге у атрибутима Од, До, Cc, Предмет и телу чланка, редефинишу друге атрибуте са истим именом.',
        'CustomerID (complex search)' => 'ИД клијента (сложена претрага)',
        '(e. g. 234*)' => '(нпр. 234*)',
        'CustomerID (exact match)' => 'ИД клијента (тачно поклапање)',
        'Customer User Login (complex search)' => 'Пријава клијента корисника (сложена претрага)',
        '(e. g. U51*)' => '(нпр.  U51*)',
        'Customer User Login (exact match)' => 'Пријава клијента корисника (тачно поклапање)',
        'Attachment Name' => 'Назив прилога',
        '(e. g. m*file or myfi*)' => '(нпр m*file или myfi*)',
        'Created in Queue' => 'Отворено у реду',
        'Lock state' => 'Стаус закључавања',
        'Watcher' => 'Праћење',
        'Article Create Time (before/after)' => 'Време креирања чланка (пре/после)',
        'Article Create Time (between)' => 'Време креирања чланка (између)',
        'Ticket Create Time (before/after)' => 'Време отварања тикета (пре/после)',
        'Ticket Create Time (between)' => 'Време отварања тикета (између)',
        'Ticket Change Time (before/after)' => 'Време промене тикета (пре/после)',
        'Ticket Change Time (between)' => 'Време промене тикета (између)',
        'Ticket Last Change Time (before/after)' => 'Време последње промене тикета (пре/после)',
        'Ticket Last Change Time (between)' => 'Време последње промене тикета (између)',
        'Ticket Close Time (before/after)' => 'Време затварања тикета (пре/после)',
        'Ticket Close Time (between)' => 'Време затварања тикета (између)',
        'Ticket Escalation Time (before/after)' => 'Време ескалације тикета (пре/после)',
        'Ticket Escalation Time (between)' => 'Време ескалације тикета (између)',
        'Archive Search' => 'Претрага архива',
        'Run search' => 'Покрени претрагу',

        # Template: AgentTicketZoom
        'Article filter' => 'Филтер за чланке',
        'Article Type' => 'Тип чланка',
        'Sender Type' => 'Тип пошиљаоца',
        'Save filter settings as default' => 'Сачувај подешавања филтера као подразумевана',
        'Event Type Filter' => 'Филтер типа догађаја',
        'Event Type' => 'Тип догађаја',
        'Save as default' => 'Сачувај као подразумевано',
        'Archive' => 'Архивирај',
        'This ticket is archived.' => 'Овај тикет је архивиран',
        'Note: Type is invalid!' => 'Напомена: Тип је неважећи!',
        'Locked' => 'Закључано',
        'Accounted time' => 'Обрачунато време',
        'Linked Objects' => 'Повезани објекти',
        'Change Queue' => 'Промени Ред',
        'There are no dialogs available at this point in the process.' =>
            'У овом тренутку нема слободних дијалога у процесу.',
        'This item has no articles yet.' => 'Ова ставка још увек нема члканке.',
        'Ticket Timeline View' => 'Преглед тикета на временској линији',
        'Article Overview' => 'Преглед чланка',
        'Article(s)' => 'Чланак/Чланци',
        'Page' => 'Страна',
        'Add Filter' => 'Додај Филтер',
        'Set' => 'Подеси',
        'Reset Filter' => 'Ресетуј Филтер',
        'Show one article' => 'Прикажи један чланак',
        'Show all articles' => 'Прикажи све чланке',
        'Show Ticket Timeline View' => 'Прикажи тикете на временској линији',
        'Unread articles' => 'Непрочитани чланци',
        'No.' => 'Бр.',
        'Important' => 'Важно',
        'Unread Article!' => 'Непрочитани Чланци!',
        'Incoming message' => 'Долазна порука',
        'Outgoing message' => 'Одлазна порука',
        'Internal message' => 'Интерна порука',
        'Resize' => 'Промена величине',
        'Mark this article as read' => 'Означи овај чланак као прочитан',
        'Show Full Text' => 'Прикажи цео текст',
        'Full Article Text' => 'Текст целог чланка',
        'No more events found. Please try changing the filter settings.' =>
            'Нема више догађаја. Покушајте да промените подешавања филтера.',
        'by' => 'од',
        'To open links in the following article, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).' =>
            'Да отворите везе у овом чланку, можда ћете морати да притиснете „Ctrl” или „Cmd” или „Shift” тастер док кликнете на везу (зависи од вашег прегледача и оперативног система). ',
        'Close this message' => 'Затвори ову поруку',
        'Article could not be opened! Perhaps it is on another article page?' =>
            'Чланак се не може отворити! Могуће је да је на другој страници?',
        'Scale preview content' => 'Скалирај садржај за приказ',
        'Open URL in new tab' => 'Отвори УРЛ у новом листу',
        'Close preview' => 'Затвори преглед',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.' =>
            'Преглед ове веб странице није могућ јер она не дозвољава да буде уграђена.',

        # Template: AttachmentBlocker
        'To protect your privacy, remote content was blocked.' => 'Да бисте заштитили своју приватност, удаљени садржај је блокиран.',
        'Load blocked content.' => 'Учитај блокирани садржај.',

        # Template: ChatStartForm
        'First message' => 'Прва порука',

        # Template: CloudServicesDisabled
        'This feature requires cloud services.' => 'Ова функција захтева сервисе у облаку!',
        'You can' => 'Ви можете',
        'go back to the previous page' => 'иди на претходну страну',

        # Template: CustomerError
        'An Error Occurred' => 'Догодила се грешка',
        'Error Details' => 'Детаљи грешке',
        'Traceback' => 'Испрати уназад',

        # Template: CustomerFooter
        'Powered by' => 'Покреће',

        # Template: CustomerFooterJS
        'One or more errors occurred!' => 'Дошло је до једне или више грешака!',
        'Close this dialog' => 'Затвори овај дијалог',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'Није могуће отворити искачући прозор. Молимо да искључите блокаду искачућих прозора за ову апликацију.',
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Ако напустите ову страницу, сви отворени прозори ће бити затворени!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'Приказ овог екрана је већ отворен. Желите ли да га затворите и учитате овај уместо њега?',
        'There are currently no elements available to select from.' => 'Тренутно нема слободних елемената за одабир.',
        'Please turn off Compatibility Mode in Internet Explorer!' => 'Молимо да искључите мод компатибилности у Интернет експлореру!',
        'The browser you are using is too old.' => 'Веб претраживач који користите је превише стар.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            '„OTRS” фунционише на великом броју веб претраживача, молимо да инсталирате и користите један од ових.',
        'Please see the documentation or ask your admin for further information.' =>
            'Молимо да прегледате документацију или питате вашег администратора за додатне информације.',
        'Switch to mobile mode' => 'Пређи на мобилни мод',
        'Switch to desktop mode' => 'Пређи на десктоп мод',
        'Not available' => 'Није доступно',
        'Clear all' => 'Очисти све',
        'Clear search' => 'Очисти претрагу',
        '%s selection(s)...' => '%s избор(и)...',
        'and %s more...' => 'и %s више...',
        'Filters' => 'Филтери',
        'Confirm' => 'Потврди',
        'You have unanswered chat requests' => 'Имате неодговорене захтеве за ћаскање',
        'Accept' => 'Прихвати',
        'Decline' => 'Одбаци',
        'An internal error occurred.' => 'Догодила се интерна грешка.',
        'Connection error' => 'Грешка у повезивању',
        'Reload page' => 'Освежи страницу',
        'Your browser was not able to communicate with OTRS properly, there seems to be something wrong with your network connection. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.' =>
            'Ваш интернет прегледач није у могућности да коректно комуницира са „OTRS”, па изгледа на нешто није у реду са вашом мрежном везом. Можете да покушате да ручно освежите ову страницу или да сачекате да ваш прегледач сам поново успостави везу.',
        'The connection has been re-established after a temporary connection loss. Due to this, elements on this page could have stopped to work correctly. In order to be able to use all elements correctly again, it is strongly recommended to reload this page.' =>
            'Веза је поново успостављена након привременог прекида. Због тога, елементи на овој страници су могли да престану да коректно функционишу. Да би све елементе могли поново нормално да користите, препоручујемо обавезно освежавање ове странице. ',

        # Template: CustomerLogin
        'JavaScript Not Available' => 'JavaScript није доступан.',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            'Како би сте користили „OTRS” неопходно је да активирате JavaScript у вашем веб претраживачу.',
        'Browser Warning' => 'Упозорење веб претраживача',
        'One moment please, you are being redirected...' => 'Сачекајте моменат, бићете преусмерени...',
        'Login' => 'Пријављивање',
        'User name' => 'Корисничко име',
        'Your user name' => 'Ваше корисничко име',
        'Your password' => 'Ваша лозинка',
        'Forgot password?' => 'Заборавили сте лозинку?',
        '2 Factor Token' => 'Двофакторски токен',
        'Your 2 Factor Token' => 'Ваш двофакторски токен',
        'Log In' => 'Пријављивање',
        'Not yet registered?' => 'Нисте регистровани?',
        'Request new password' => 'Захтев за нову лозинку',
        'Your User Name' => 'Ваше корисничко име',
        'A new password will be sent to your email address.' => 'Нова лозинка ће бити послата на вашу имејл адресу.',
        'Create Account' => 'Креирајте налог',
        'Please fill out this form to receive login credentials.' => 'Молимо да попуните овај образац да би сте добили податке за пријаву.',
        'How we should address you' => 'Како да вас ословљавамо',
        'Your First Name' => 'Ваше име',
        'Your Last Name' => 'Ваше презиме',
        'Your email address (this will become your username)' => 'Ваша имејл адреса (то ће бити ваше корисничко име)',

        # Template: CustomerNavigationBar
        'Incoming Chat Requests' => 'Долазни захтеви за ћаскање',
        'Edit personal preferences' => 'Уреди личне поставке',
        'Logout %s %s' => 'Одјава %s %s',

        # Template: CustomerRichTextEditor
        'Split Quote' => 'Подели квоту',
        'Open link' => 'Отвори везу',

        # Template: CustomerTicketMessage
        'Service level agreement' => 'Споразум о нивоу услуге',

        # Template: CustomerTicketOverview
        'Welcome!' => 'Добродошли!',
        'Please click the button below to create your first ticket.' => 'Молимо да притиснете дугме испод за креирање вашег првог тикета.',
        'Create your first ticket' => 'Креирајте ваш први тикет',

        # Template: CustomerTicketSearch
        'Profile' => 'Профил',
        'e. g. 10*5155 or 105658*' => 'нпр. 10*5155 или 105658*',
        'Customer ID' => 'ИД клијента',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => 'Текстуално претраживање у тикетима (нпр. „Ba*a” или „Mil*”)',
        'Recipient' => 'Прималац',
        'Carbon Copy' => 'Копија',
        'e. g. m*file or myfi*' => 'нпр m*file или myfi*',
        'Types' => 'Типови',
        'Time restrictions' => 'Временска ограничења',
        'No time settings' => 'Нема подешавања времена',
        'Specific date' => 'Одређени датум',
        'Only tickets created' => 'Само креирани тикети',
        'Date range' => 'Распон датума',
        'Only tickets created between' => 'Само тикети креирани између',
        'Ticket archive system' => 'Систем за архивирање тикета',
        'Save search as template?' => 'Сачувај претрагу као шаблон?',
        'Save as Template?' => 'Сачувати као шаблон?',
        'Save as Template' => 'Сачувај као шаблон',
        'Template Name' => 'Назив шаблона',
        'Pick a profile name' => 'Изабери назив профила',
        'Output to' => 'Излаз на',

        # Template: CustomerTicketSearchResultShort
        'of' => 'од',
        'Search Results for' => 'Резултати претраживања за',
        'Remove this Search Term.' => 'Уклони овај израз за претрагу.',

        # Template: CustomerTicketZoom
        'Start a chat from this ticket' => 'Почни ћаскање из овог тикета',
        'Expand article' => 'Рашири чланак',
        'Information' => 'Информација',
        'Next Steps' => 'Следећи кораци',
        'Reply' => 'Одговори',
        'Chat Protocol' => 'Протокол ћаскања',

        # Template: DashboardEventsTicketCalendar
        'All-day' => 'Целодневно',
        'Sunday' => 'недеља',
        'Monday' => 'понедељак',
        'Tuesday' => 'уторак',
        'Wednesday' => 'среда',
        'Thursday' => 'четвртак',
        'Friday' => 'петак',
        'Saturday' => 'субота',
        'Su' => 'не',
        'Mo' => 'по',
        'Tu' => 'ут',
        'We' => 'ср',
        'Th' => 'че',
        'Fr' => 'пе',
        'Sa' => 'су',
        'Event Information' => 'Информације о догађају',
        'Ticket fields' => 'Поља тикета',
        'Dynamic fields' => 'Динамичка поља',

        # Template: Datepicker
        'Invalid date (need a future date)!' => 'Неисправан датум (потебан будући датум)!',
        'Invalid date (need a past date)!' => 'Неисправан датум (потребан датум у прошлости)!',
        'Previous' => 'Назад',
        'Open date selection' => 'Отвори избор датума',

        # Template: Error
        'An error occurred.' => 'Догодила се грешка.',
        'Really a bug? 5 out of 10 bug reports result from a wrong or incomplete installation of OTRS.' =>
            'Стварно грешка? 5 од 10 пријавлјених грешака су последица погрешне или некомплетне „OTRS” инсталације.',
        'With %s, our experts take care of correct installation and cover your back with support and periodic security updates.' =>
            'Са %s, наши експерти ће се побринути за коректну инсталацију и обезбедити подршку и повремена сигурносна ажурирања.',
        'Contact our service team now.' => 'Контактирајте наш сервисним тим сада.',
        'Send a bugreport' => 'Пошаљи извештај о грешци',

        # Template: FooterJS
        'Please enter at least one search value or * to find anything.' =>
            'Молимо унесите барем једну вредност претраге или * да би сте нешто пронашли.',
        'Please remove the following words from your search as they cannot be searched for:' =>
            'Молимо да уклоните следеће речи из ваше претраге јер се не могу тражити:',
        'Please check the fields marked as red for valid inputs.' => 'Молимо проверите поља означена црвеним за важеће уносе.',
        'Please perform a spell check on the the text first.' => 'Молимо да прво проверите правопис на тексту.',
        'Slide the navigation bar' => 'Померите навигациону траку',
        'Unavailable for chat' => 'Недоступан за ћаскање',
        'Available for internal chats only' => 'Доступан само за интерно ћаскање',
        'Available for chats' => 'Доступан за ћаскање',
        'Please visit the chat manager' => 'Молимо посетите управљач ћаскањем',
        'New personal chat request' => 'Нов лични захтев за ћаскање',
        'New customer chat request' => 'Нов клијентски захтев за ћаскање',
        'New public chat request' => 'Нов јавни захтев за ћаскање',
        'Selected user is not available for chat.' => 'Изабрани корисник није доступан за ћаскање.',
        'New activity' => 'Нова активност',
        'New activity on one of your monitored chats.' => 'Нова активност у једном од надгледаних ћаскања.',
        'Your browser does not support video and audio calling.' => 'Ваш прегледач не подржава видео и аудио позиве.',
        'Selected user is not available for video and audio call.' => 'Изабрани корисник није доступан за видео и аудио позив.',
        'Target user\'s browser does not support video and audio calling.' =>
            'Прегледач циљног корисника не подржава видео и аудио позиве.',
        'Do you really want to continue?' => 'Да ли заиста желите да наставите?',
        'Information about the OTRS Daemon' => 'Информације о „OTRS” сервису',
        'This feature is part of the %s.  Please contact us at %s for an upgrade.' =>
            'Ово својство је део %s.  Молимо да на с контактирате на %s за ажурирање.',
        'Find out more about the %s' => 'Пронађи још информација о %s',

        # Template: Header
        'You are logged in as' => 'Пријављени сте као',

        # Template: Installer
        'JavaScript not available' => 'JavaScript nije dostupan.',
        'Step %s' => 'Корак %s',
        'Database Settings' => 'Подешавање базе података',
        'General Specifications and Mail Settings' => 'Опште спецификације и подешавање поште',
        'Finish' => 'Заврши',
        'Welcome to %s' => 'Добродошли у %s',
        'Web site' => 'Веб сајт',
        'Mail check successful.' => 'Успешна провера имејл подешавања.',
        'Error in the mail settings. Please correct and try again.' => 'Грешка у подешавању имејла. Молимо исправите и покушајте поново.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => 'Подешавање одлазне поште',
        'Outbound mail type' => 'Тип одлазне поште',
        'Select outbound mail type.' => 'Изаберите тип одлазне поште',
        'Outbound mail port' => 'Порт за одлазну пошту',
        'Select outbound mail port.' => 'Изаберите порт за одлазну пошту',
        'SMTP host' => '„SMTP” рачунар',
        'SMTP host.' => '„SMTP” рачунар.',
        'SMTP authentication' => '„SMTP” аутентификација',
        'Does your SMTP host need authentication?' => 'Да ли ваш „SMTP” рачунар ахтева аутентификацију?',
        'SMTP auth user' => '„SMTP” корисник',
        'Username for SMTP auth.' => 'Корисничко име за „SMTP” аутентификацију',
        'SMTP auth password' => 'Лозинка „SMTP” аутентификације',
        'Password for SMTP auth.' => 'Лозинка за „SMTP” аутентификацију',
        'Configure Inbound Mail' => 'Подешавање долазне поште',
        'Inbound mail type' => 'Тип долазне поште',
        'Select inbound mail type.' => 'Изабери тип долазне поште',
        'Inbound mail host' => 'Сервер долазне поште',
        'Inbound mail host.' => 'Сервер долазне поште.',
        'Inbound mail user' => 'Корисник долазне поште',
        'User for inbound mail.' => 'Корисник за долазну пошту.',
        'Inbound mail password' => 'Лозинка долазне поште',
        'Password for inbound mail.' => 'Лозинка за долазну пошту.',
        'Result of mail configuration check' => 'Резултат провере подешавања поште',
        'Check mail configuration' => 'Провери конфигурацију мејла',
        'Skip this step' => 'Прескочи овај корак',

        # Template: InstallerDBResult
        'Database setup successful!' => 'Успешно инсталирање базе',

        # Template: InstallerDBStart
        'Install Type' => 'Инсталирај тип',
        'Create a new database for OTRS' => 'Креирај нову базу података за „OTRS”',
        'Use an existing database for OTRS' => 'Користи постојећу базу података за „OTRS”',

        # Template: InstallerDBmssql
        'Database name' => 'Назив базе података',
        'Check database settings' => 'Проверите подешавања базе',
        'Result of database check' => 'Резултат провере базе података',
        'Database check successful.' => 'Успешна провера базе података.',
        'Database User' => 'Корисник базе података',
        'New' => 'Нов',
        'A new database user with limited permissions will be created for this OTRS system.' =>
            'Нови корисник базе са ограниченим правима ће бити креиран за овај „OTRS” систем.',
        'Repeat Password' => 'Понови лозинку',
        'Generated password' => 'Генерисана лозинка',

        # Template: InstallerDBmysql
        'Passwords do not match' => 'Лозинке се не поклапају',

        # Template: InstallerDBoracle
        'SID' => 'SID',
        'Port' => 'Порт',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Да би сте користили „OTRS” морате унети следеће у командну линију (Terminal/Shell) као „root”.',
        'Restart your webserver' => 'Поново покрените ваш веб сервер.',
        'After doing so your OTRS is up and running.' => 'После овога ваш „OTRS” је укључен и ради.',
        'Start page' => 'Početna strana',
        'Your OTRS Team' => 'Ваш „OTRS” тим',

        # Template: InstallerLicense
        'Don\'t accept license' => 'Не прихватај лиценцу',
        'Accept license and continue' => 'Прихвати лиценцу и настави',

        # Template: InstallerSystem
        'SystemID' => 'Системски ИД',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'Системски идентификатор. Сваки број тикета и сваки ИД HTTP сесије садржи овај број.',
        'System FQDN' => 'Sistemski FQDN',
        'Fully qualified domain name of your system.' => 'Пуно име домена вашег система',
        'AdminEmail' => 'Имејл администратор',
        'Email address of the system administrator.' => 'Имејл адреса систем администратора.',
        'Organization' => 'Организација',
        'Log' => 'Лог',
        'LogModule' => 'Лог модул',
        'Log backend to use.' => 'Позадински приказ лог-а.',
        'LogFile' => 'Лог датотека',
        'Webfrontend' => 'Мрежни интерфејс',
        'Default language' => 'Подразумевани језик',
        'Default language.' => 'Подразумевани језик',
        'CheckMXRecord' => 'Провери MX податке',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'Ручно унета имејл адреса се проверава помоћу MX податка пронађеног у DNS. Немојте користити ову опцију ако је ваш DNS спор или не може да разреши јавне адресе.',

        # Template: LinkObject
        'Object#' => 'Објекат#',
        'Add links' => 'Додај везе',
        'Delete links' => 'Обриши везе',

        # Template: Login
        'Lost your password?' => 'Изгубили сте лозинку?',
        'Request New Password' => 'Захтев за нову лозинку',
        'Back to login' => 'Назад на пријављивање',

        # Template: MobileNotAvailableWidget
        'Feature not available' => 'Својство није доступно',
        'Sorry, but this feature of OTRS is currently not available for mobile devices. If you\'d like to use it, you can either switch to desktop mode or use your regular desktop device.' =>
            'На жалост, ово својство моментално није доступно за мобилне уређаје. Ако желите да га користите, можете де вратити на десктоп мод или користити стандардни десктоп уређај.',

        # Template: Motd
        'Message of the Day' => 'Данашња порука',
        'This is the message of the day. You can edit this in %s.' => 'Ово је дневна порука. Можете је уредити у %s.',

        # Template: NoPermission
        'Insufficient Rights' => 'Недовољна овлаштења',
        'Back to the previous page' => 'Вратите се на претходну страну',

        # Template: Pagination
        'Show first page' => 'Покажи прву страну',
        'Show previous pages' => 'Покажи претходне стране',
        'Show page %s' => 'Покажи страну %s',
        'Show next pages' => 'Покажи следеће стране',
        'Show last page' => 'Покажи последњу страну',

        # Template: PictureUpload
        'Need FormID!' => 'Потребан ИД формулара!',
        'No file found!' => 'Датотека није пронађена!',
        'The file is not an image that can be shown inline!' => 'Датотека није слика која се може непосредно приказати!',

        # Template: PreferencesNotificationEvent
        'Notification' => 'Обавештење',
        'No user configurable notifications found.' => 'Нису пронађена обавештења која корисник може да подеси.',
        'Receive messages for notification \'%s\' by transport method \'%s\'.' =>
            'Примите поруке за обавештавање „%s” пренете путем „%s”.',
        'Please note that you can\'t completely disable notifications marked as mandatory.' =>
            'Молимо да запамтите да не можете потпуно да искључите обавештења означена као обавезна.',
        'Sorry, but you can\'t disable all methods for notifications marked as mandatory.' =>
            'Извините али не можете искључити све методе за обавештења означена као обавезна.',
        'Sorry, but you can\'t disable all methods for this notification.' =>
            'Извините али не можете искључити све методе за ово обавештење.',

        # Template: ActivityDialogHeader
        'Process Information' => 'Информације о процесу',
        'Dialog' => 'Дијалог',

        # Template: Article
        'Inform Agent' => 'Обавести оператера',

        # Template: PublicDefault
        'Welcome' => 'Добродошли',
        'This is the default public interface of OTRS! There was no action parameter given.' =>
            'Ово је подразумевани јавни интерфејс за „OTRS”! Нема датих акционих параметара.',
        'You could install a custom public module (via the package manager), for example the FAQ module, which has a public interface.' =>
            'Можете инсталирати додатни модул (видите управљање пакетима), нпр. FAQ, који има јавни интерфејс.',

        # Template: RichTextEditor
        'Remove Quote' => 'Уклони квоту.',

        # Template: GeneralSpecificationsWidget
        'Permissions' => 'Дозволе',
        'You can select one or more groups to define access for different agents.' =>
            'Можете изабрати једну или више група за дефинисање приступа за различите оператере.',
        'Result formats' => 'Формат резултата',
        'The selected time periods in the statistic are time zone neutral.' =>
            'Изабрани временски периоди у статистици су неутрални по питању временске зоне.',
        'Create summation row' => 'Креирај ред са збиром',
        'Generate an additional row containing sums for all data rows.' =>
            'Генериши додатни ред који садржи суме за све редове са подацима.',
        'Create summation column' => 'Креирај колону са збиром',
        'Generate an additional column containing sums for all data columns.' =>
            'Генериши додатну колону која садржи суме за све колоне са подацима.',
        'Cache results' => 'Кеширај резултате',
        'Stores statistics result data in a cache to be used in subsequent views with the same configuration (requires at least one selected time field).' =>
            'Чува резултате статистика у кешу за коришћење у следећим прегледима са истим подешавањима (захтева изабрано бар једно временско поље).',
        'Provide the statistic as a widget that agents can activate in their dashboard.' =>
            'Обезбеди статистику као апликативни додатак (widget), који опертатери могу активирати путем своје контролне табле.',
        'Please note that enabling the dashboard widget will activate caching for this statistic in the dashboard.' =>
            'Напомињемо да омогућавање апликативног додатка (widget) ће кеширати ову статистику на контролној табли.',
        'If set to invalid end users can not generate the stat.' => 'Ако је подешено на неважеће, крајњи корисници не могу генерисати статистику.',

        # Template: PreviewWidget
        'There are problems in the configuration of this statistic:' => 'Постоје неки проблеми у подешавању ове статистике:',
        'You may now configure the X-axis of your statistic.' => 'Сада можете подесити X осу ваше статистике.',
        'This statistic does not provide preview data.' => 'Ова статистика не омогућава привремени приказ.',
        'Preview format:' => 'Формат приказа:',
        'Please note that the preview uses random data and does not consider data filters.' =>
            'Напомињемо да приказ користи насумично изабране податке и не узима у обзир филтере података.',
        'Configure X-Axis' => 'Подеси X осу',
        'X-axis' => 'Х-оса',
        'Configure Y-Axis' => 'Подеси Y осу',
        'Y-axis' => 'Y-оса',
        'Configure Filter' => 'Подеси филтер',

        # Template: RestrictionsWidget
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Молимо да изаберете само један елемент или искључите дугме „фиксирано”!',
        'Absolute period' => 'Апсолутни период',
        'Between' => 'Између',
        'Relative period' => 'Релативни период',
        'The past complete %s and the current+upcoming complete %s %s' =>
            'Комплетна прошлост %s и комплетна тренутна+будућа %s %s',
        'Do not allow changes to this element when the statistic is generated.' =>
            'Онемогући промене овог елемента при генерисању статистике.',

        # Template: StatsParamsWidget
        'Format' => 'Формат',
        'Exchange Axis' => 'Замени осе',
        'Configurable params of static stat' => 'Подесиви параметри статичке статистике',
        'No element selected.' => 'Није изабран ни један елемент.',
        'Scale' => 'Скала',
        'show more' => 'прикажи више',
        'show less' => 'прикажи мање',

        # Template: D3
        'Download SVG' => 'Преузми SVG',
        'Download PNG' => 'Преузме PNG',

        # Template: XAxisWidget
        'The selected time period defines the default time frame for this statistic to collect data from.' =>
            'Одабрани временски период дефинише подразумеван временски оквир за прикупљање података статистике.',
        'Defines the time unit that will be used to split the selected time period into reporting data points.' =>
            'Дефинише временску јединицу која се користи за поделу изабраног временског периода у појединачне тачке на извештају.',

        # Template: YAxisWidget
        'Please remember that the scale for the Y-axis has to be larger than the scale for the X-axis (e.g. X-axis => Month, Y-Axis => Year).' =>
            'Молимо запамтите, да скала за Y-осу треба да буде већа од скале за Х-осу (нпр. Х-Оса => месец; Y-оса => година).',

        # Template: Test
        'OTRS Test Page' => '„OTRS” тест страна',
        'Welcome %s %s' => 'Добродошли %s %s',
        'Counter' => 'Бројач',

        # Template: Warning
        'Go back to the previous page' => 'Вратите се на претходну страну',

        # Perl Module: Kernel/Config/Defaults.pm
        'View system log messages.' => 'Преглед порука системског дневника.',
        'Update and extend your system with software packages.' => 'Ажурирај и надогради систем софтверским пакетима.',

        # Perl Module: Kernel/Modules/AdminACL.pm
        'ACLs could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            '„ACL” листе не могу да се увезу због непознате грешке, молимо да проверите „OTRS” дневнике за више информација',
        'The following ACLs have been added successfully: %s' => 'Следеће „ACL” листе су успешно додате: %s',
        'The following ACLs have been updated successfully: %s' => 'Следеће „ACL” листе су успешно ажуриране: %s',
        'There where errors adding/updating the following ACLs: %s. Please check the log file for more information.' =>
            'Постоје грешке у додавању/ажурирању следећих „ACL”: %s. Молимо проверите датотеку дневника за више информација.',
        'This field is required' => 'Ово поље је обавезно.',
        'There was an error creating the ACL' => 'Дошло је до грешке при креирању „ACL”',
        'Need ACLID!' => 'Потребан ИД „ACL” листе!',
        'Could not get data for ACLID %s' => 'Не могу прибавити податке за ИД „ACL” листе %s',
        'There was an error updating the ACL' => 'Дошло је до грешке при ажурирању „ACL”',
        'There was an error setting the entity sync status.' => 'Дошло је до грешке приликом подешавања статуса синхронизације ентитета.',
        'There was an error synchronizing the ACLs.' => 'Дошло је до грешке при синхронизацији „ACLs”',
        'ACL %s could not be deleted' => '„ACL” листу %s није могуће обрисати',
        'There was an error getting data for ACL with ID %s' => 'Дошло је до грешке приликом прибављања података за
„ACL” листу са ИД %s',
        'Exact match' => 'Тачно поклапање',
        'Negated exact match' => 'Негирано тачно поклапање',
        'Regular expression' => 'Регуларни израз',
        'Regular expression (ignore case)' => 'Регуларни израз (игнориши величину слова)',
        'Negated regular expression' => 'Негирани регуларни израз',
        'Negated regular expression (ignore case)' => 'Негирани регуларни израз (игнориши величину слова)',

        # Perl Module: Kernel/Modules/AdminCustomerCompany.pm
        'Customer Company %s already exists!' => 'Клијентска фирма %s већ постоји!',

        # Perl Module: Kernel/Modules/AdminCustomerUser.pm
        'New phone ticket' => 'Нови телефонски тикет',
        'New email ticket' => 'Нови имејл тикет',

        # Perl Module: Kernel/Modules/AdminDynamicField.pm
        'Fields configuration is not valid' => 'Конфигурација поља није валидна',
        'Objects configuration is not valid' => 'Конфигурација објекта није валидна',
        'Could not reset Dynamic Field order properly, please check the error log for more details.' =>
            'Није могуће поништити редослед динамичких поља, молимо да проверите „OTRS” дневнике за више информација.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldCheckbox.pm
        'Undefined subaction.' => 'Недефинисана субакција.',
        'Need %s' => 'Потребно %s',
        'The field does not contain only ASCII letters and numbers.' => 'Поље не садржи само ASCII слова и бројеве.',
        'There is another field with the same name.' => 'Постоји друго поље са истим именом.',
        'The field must be numeric.' => 'Поље мора бити нумеричко.',
        'Need ValidID' => 'Потребан важећи ИД',
        'Could not create the new field' => 'Није могуће креирати ново поље',
        'Need ID' => 'Потребан ИД',
        'Could not get data for dynamic field %s' => 'Не могу прибавити податке за динамичко поље %s',
        'The name for this field should not change.' => 'Назив овог поља није пожељно мењати.',
        'Could not update the field %s' => 'Није могуће ажурирати поље %s',
        'Currently' => 'Тренутно',
        'Unchecked' => 'Искључено',
        'Checked' => 'Укључено',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDateTime.pm
        'Prevent entry of dates in the future' => 'Спречава унос датума у будућности',
        'Prevent entry of dates in the past' => 'Спречава унос датума у прошлости',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDropdown.pm
        'This field value is duplicated.' => 'Вредност овог поља је умножена.',

        # Perl Module: Kernel/Modules/AdminEmail.pm
        'Select at least one recipient.' => 'Изаберите бар једног примаоца.',

        # Perl Module: Kernel/Modules/AdminGenericAgent.pm
        'archive tickets' => 'архивирај тикете',
        'restore tickets from archive' => 'врати тикете из архиве',
        'Need Profile!' => 'Потребан је профил!',
        'Got no values to check.' => 'Нема вредности за проверу.',
        'Please remove the following words because they cannot be used for the ticket selection:' =>
            'Молимо да уклоните следеће речи јер се не могу користити за избор тикета:',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceDebugger.pm
        'Need WebserviceID!' => 'Потребан ИД Веб сервиса!',
        'Could not get data for WebserviceID %s' => 'Не могу прибавити податке за ИД Веб сервиса %s',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerDefault.pm
        'Need InvokerType' => 'Потребан тип позиваоца',
        'Invoker %s is not registered' => 'Позиваоц %s није регистрован',
        'InvokerType %s is not registered' => 'Тип позиваоца %s није регистрован',
        'Need Invoker' => 'Потребан позиваоц',
        'Could not determine config for invoker %s' => 'Није могуће утврдити конфигурацију за позиваоца %s',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingSimple.pm
        'Could not get registered configuration for action type %s' => 'Не могу прибавити регистровану конфигурацију за тип акције %s',
        'Could not get backend for %s %s' => 'Није могуће пронаћи позадински модул за %s %s',
        'Could not update configuration data for WebserviceID %s' => 'Не могу ажурирати конфигурационе податке за Веб сервис ИД %s',
        'Keep (leave unchanged)' => 'Задржи (остави непромењено)',
        'Ignore (drop key/value pair)' => 'Игнориши (одбаци пар кључ/вредност)',
        'Map to (use provided value as default)' => 'Мапирај на (употреби понуђену вредност као подразумевану)',
        'Exact value(s)' => 'Тачна вредност(и)',
        'Ignore (drop Value/value pair)' => 'Игнориши (одбаци пар вредност/вредност)',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingXSLT.pm
        'Could not find required library %s' => 'Није могуће пронаћи потребну библиотеку %s',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceOperationDefault.pm
        'Need OperationType' => 'Потребан тип операције',
        'Operation %s is not registered' => 'Операција %s није регистрована',
        'OperationType %s is not registered' => 'Тип операције %s није регистрован',
        'Need Operation' => 'Потребна операција',
        'Could not determine config for operation %s' => 'Није могуће утврдити конфигурацију за операцију %s',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceTransportHTTPREST.pm
        'Need Subaction!' => 'Потребна субакција!',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebservice.pm
        'There is another web service with the same name.' => 'Постоји други веб сервис са истим именом.',
        'There was an error updating the web service.' => 'Дошло је до грешке при ажурирању веб сервиса.',
        'Web service "%s" updated!' => 'Веб сервис „%s” је ажуриран!',
        'There was an error creating the web service.' => 'Дошло је до грешке при креирању веб сервиса.',
        'Web service "%s" created!' => 'Веб сервис „%s” је креиран!',
        'Need Name!' => 'Потребан назив!',
        'Need ExampleWebService!' => 'Потребан ExampleWebService!',
        'Could not read %s!' => 'Није могуће прочитати %s!',
        'Need a file to import!' => 'Потребна датотека за увоз!',
        'The imported file has not valid YAML content! Please check OTRS log for details' =>
            'Увезена датотека нема исправан „YAML” садржај! Молимо проверите „OTRS” дневник за детаље',
        'Web service "%s" deleted!' => 'Веб сервис „%s” је обрисан!',
        'New Web service' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebserviceHistory.pm
        'Got no WebserviceHistoryID!' => 'Нема WebserviceHistoryID!',
        'Could not get history data for WebserviceHistoryID %s' => 'Не могу прибавити податке историјата за Веб сервис ИД %s',

        # Perl Module: Kernel/Modules/AdminNotificationEvent.pm
        'Notification updated!' => 'Обавештење ажурирано!',
        'Notification added!' => 'Обавештење додато!',
        'There was an error getting data for Notification with ID:%s!' =>
            'Дошло је до грешке приликом прибављања података за обавештење ИД:%s!',
        'Unknown Notification %s!' => 'Непознато обавештење %s!',
        'There was an error creating the Notification' => 'Дошло је до грешке приликом креирања обавештења',
        'Notifications could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            'Обавештења не могу да се увезу због непознате грешке, молимо да проверите „OTRS” дневнике за више информација',
        'The following Notifications have been added successfully: %s' =>
            'Следећа обавештења су успешно додата: %s',
        'The following Notifications have been updated successfully: %s' =>
            'Следећа обавештења су успешно ажурирана: %s',
        'There where errors adding/updating the following Notifications: %s. Please check the log file for more information.' =>
            'Постоје грешке у додавању/ажурирању следећих обавештења: %s. Молимо проверите датотеку дневника за више информација.',
        'Agent who owns the ticket' => 'Оператер који је власник тикета',
        'Agent who is responsible for the ticket' => 'Оператер који је одговоран за тикет',
        'All agents watching the ticket' => 'Сви оператери који надзиру тикет',
        'All agents with write permission for the ticket' => 'Сви оператери са дозволом писања за тикет',
        'All agents subscribed to the ticket\'s queue' => 'Сви оператери претплаћени на ред тикета',
        'All agents subscribed to the ticket\'s service' => 'Сви оператери претплаћени на сервис тикета',
        'All agents subscribed to both the ticket\'s queue and service' =>
            'Сви оператери претплаћени и на ред и на сервис тикета',
        'Customer of the ticket' => 'Клијент за тикет',
        'Yes, but require at least one active notification method' => 'Да, али је неопходан бар један активни метод обавештавања.',

        # Perl Module: Kernel/Modules/AdminPGP.pm
        'PGP environment is not working. Please check log for more info!' =>
            '„PGP” окружење не функционише. За више информација проверите дневник.',
        'Need param Key to delete!' => 'Неопходан параметар Key за брисање!',
        'Key %s deleted!' => 'Кључ %s је обрисан!',
        'Need param Key to download!' => 'Неопходан параметар Key за преузимање!',

        # Perl Module: Kernel/Modules/AdminPackageManager.pm
        'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/otrs.Console.pl to install packages!' =>
            'Жао нам је, али Apache::Reload је неопходан као PerlModule и PerlInitHandler у конфигурацији Apache-а. Молимо погледајте scripts/apache2-httpd.include.conf. Алтернативно, можете користити конзолну алатку bin/otrs.Console.pl за инсталацију пакета!',
        'No such package!' => 'Нема таквог пакета!',
        'No such file %s in package!' => 'Нема такве датотеке %s у пакету!',
        'No such file %s in local file system!' => 'Нема такве датотеке %s у локалном систему!',
        'Can\'t read %s!' => 'Немогуће читање %s!',
        'File is OK' => 'Датотека је у реду',
        'Package has locally modified files.' => 'Пакет садржи локално измењене датотеке.',
        'No packages or no new packages found in selected repository.' =>
            'У изабраном спремишту нема пакета или нема нових пакета.',
        'Package not verified due a communication issue with verification server!' =>
            'Пакет није верификован због комуникацијског проблема са верификационим сервером!',
        'Can\'t connect to OTRS Feature Add-on list server!' => 'Није могуће повезати се са OTRS Feature Add-on сервером!',
        'Can\'t get OTRS Feature Add-on list from server!' => 'Не могу прибавити OTRS Feature Add-on листу са сервера!',
        'Can\'t get OTRS Feature Add-on from server!' => 'Не могу прибавити OTRS Feature Add-on са сервера!',

        # Perl Module: Kernel/Modules/AdminPostMasterFilter.pm
        'No such filter: %s' => 'Нема таквог филтера: %s',

        # Perl Module: Kernel/Modules/AdminProcessManagement.pm
        'Need ExampleProcesses!' => 'Потребан је пример процеса!',
        'Need ProcessID!' => 'Потребан је ИД процеса!',
        'Yes (mandatory)' => 'Да (обавезно)',
        'Unknown Process %s!' => 'Непознат процес %s!',
        'There was an error generating a new EntityID for this Process' =>
            'Дошло је до грешке приликом креирања новог ИД ентитета за овај процес',
        'The StateEntityID for state Inactive does not exists' => 'ИД стања ентитета за неактивно стање не постоји',
        'There was an error creating the Process' => 'Дошло је до грешке приликом креирања Процеса',
        'There was an error setting the entity sync status for Process entity: %s' =>
            'Дошло је до грешке приликом подешавања статуса синхронизације за ентитет процеса: %s',
        'Could not get data for ProcessID %s' => 'Не могу прибавити податке за Процес ИД %s',
        'There was an error updating the Process' => 'Дошло је до грешке приликом ажурирања Процеса',
        'Process: %s could not be deleted' => 'Процес: %s се не може обрисати',
        'There was an error synchronizing the processes.' => 'Дошло је до грешке при синхронизацији процеса.',
        'The %s:%s is still in use' => '%s:%s је још у употреби',
        'The %s:%s has a different EntityID' => '%s:%s има различит ИД ентитета',
        'Could not delete %s:%s' => 'Није могуће обрисати %s:%s',
        'There was an error setting the entity sync status for %s entity: %s' =>
            'Дошло је до грешке приликом подешавања статуса синхронизације ентитета за %s ентитет: %s',
        'Could not get %s' => 'Није могуће прибавити %s',
        'Need %s!' => 'Потребно %s!',
        'Process: %s is not Inactive' => 'Процес: %s није неактиван',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivity.pm
        'There was an error generating a new EntityID for this Activity' =>
            'Дошло је до грешке приликом креирања новог ИД ентитета за ову Активност',
        'There was an error creating the Activity' => 'Дошло је до грешке приликом креирања Активности',
        'There was an error setting the entity sync status for Activity entity: %s' =>
            'Дошло је до грешке приликом подешавања статуса синхронизације ентитета за  ентитет Активности: %s',
        'Need ActivityID!' => 'Потребан ИД активности!',
        'Could not get data for ActivityID %s' => 'Не могу прибавити податке за ИД активности %s',
        'There was an error updating the Activity' => 'Дошло је до грешке приликом ажурирања Активности',
        'Missing Parameter: Need Activity and ActivityDialog!' => 'Недостаје параметар: Потребна активност и дијалог активности!',
        'Activity not found!' => 'Активност није пронађена!',
        'ActivityDialog not found!' => 'Дијалог активности није пронађен!',
        'ActivityDialog already assigned to Activity. You cannot add an ActivityDialog twice!' =>
            'Дијалог активности је већ додељен активности. Не можете додавати дијалог два пута.',
        'Error while saving the Activity to the database!' => 'Грешка при чувању активности у бази података!',
        'This subaction is not valid' => 'Субакција није валидна',
        'Edit Activity "%s"' => 'Уреди активност „%s”',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivityDialog.pm
        'There was an error generating a new EntityID for this ActivityDialog' =>
            'Дошло је до грешке приликом креирања новог ИД ентитета за овај Дијалог активности',
        'There was an error creating the ActivityDialog' => 'Дошло је до грешке приликом креирања Дијалога активности',
        'There was an error setting the entity sync status for ActivityDialog entity: %s' =>
            'Дошло је до грешке приликом подешавања статуса синхронизације ентитета за  ентитет Диајлога активности: %s',
        'Need ActivityDialogID!' => 'Потребан ИД Дијалога активности!',
        'Could not get data for ActivityDialogID %s' => 'Не могу прибавити податке за ИД дијалога активности %s',
        'There was an error updating the ActivityDialog' => 'Дошло је до грешке приликом ажурирања Дијалога ктивности',
        'Edit Activity Dialog "%s"' => 'Уреди Дијалог активност „%s”',
        'Agent Interface' => 'Оператерски интерфејс',
        'Customer Interface' => 'Клијентски интерфејс',
        'Agent and Customer Interface' => 'Оператерски и клијентски интерфејс',
        'Do not show Field' => 'Не приказуј ово поље',
        'Show Field' => 'Прикажи поље',
        'Show Field As Mandatory' => 'Прикажи поље као обавезно',
        'fax' => 'факс',

        # Perl Module: Kernel/Modules/AdminProcessManagementPath.pm
        'Edit Path' => 'Уреди путању',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransition.pm
        'There was an error generating a new EntityID for this Transition' =>
            'Дошло је до грешке приликом креирања новог ИД ентитета за ову транзицију',
        'There was an error creating the Transition' => 'Дошло је до грешке приликом креирања Транзиције',
        'There was an error setting the entity sync status for Transition entity: %s' =>
            'Дошло је до грешке приликом подешавања статуса синхронизације ентитета за  ентитет Транзиције: %s',
        'Need TransitionID!' => 'Потребан ИД транзиције!',
        'Could not get data for TransitionID %s' => 'Не могу прибавити податке за ИД транзиције %s',
        'There was an error updating the Transition' => 'Дошло је до грешке приликом ажурирања Транзиције',
        'Edit Transition "%s"' => 'Уреди транзицију „%s”',
        'xor' => 'xor',
        'String' => 'Низ знакова',
        'Transition validation module' => 'Модул валидације транзиције',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransitionAction.pm
        'At least one valid config parameter is required.' => 'Неопходан је бар један валидан конфигурациони параметар.',
        'There was an error generating a new EntityID for this TransitionAction' =>
            'Дошло је до грешке приликом креирања новог ИД ентитета за ову транзициону акцију',
        'There was an error creating the TransitionAction' => 'Дошло је до грешке приликом креирања Транзиционе акције',
        'There was an error setting the entity sync status for TransitionAction entity: %s' =>
            'Дошло је до грешке приликом подешавања статуса синхронизације ентитета за  ентитет Транзиционе акције: %s',
        'Need TransitionActionID!' => 'Потребан ИД транзиционе акције!',
        'Could not get data for TransitionActionID %s' => 'Не могу прибавити податке за ИД транзиционе акције %s',
        'There was an error updating the TransitionAction' => 'Дошло је до грешке приликом ажурирања Транзиционе акције',
        'Edit Transition Action "%s"' => 'Уреди транзициону акцију „%s”',
        'Error: Not all keys seem to have values or vice versa.' => 'Грешка: Сви кључеви немају вредност или обрнуто.',

        # Perl Module: Kernel/Modules/AdminQueue.pm
        'Don\'t use :: in queue name!' => 'Немојте користити :: у називу реда!',
        'Click back and change it!' => 'Кликните на назад и промените то!',

        # Perl Module: Kernel/Modules/AdminQueueAutoResponse.pm
        'Queues ( without auto responses )' => 'Редови (без аутоматских одговора)',

        # Perl Module: Kernel/Modules/AdminSMIME.pm
        'S/MIME environment is not working. Please check log for more info!' =>
            '„S/MIME” окружење не функционише. За више информација проверите дневник.',
        'Need param Filename to delete!' => 'Неопходан параметар Filename за брисање!',
        'Need param Filename to download!' => 'Неопходан параметар Filename за преузимање!',
        'Needed CertFingerprint and CAFingerprint!' => 'Неопходан CertFingerprint и CAFingerprint!',
        'CAFingerprint must be different than CertFingerprint' => 'CAFingerprint мора бити другачији од CertFingerprint',
        'Relation exists!' => 'Веза постоји!',
        'Relation added!' => 'Додата веза!',
        'Impossible to add relation!' => 'Немогуће додавање везе!',
        'Relation doesn\'t exists' => 'Веза не постоји',
        'Relation deleted!' => 'Веза обрисана!',
        'Impossible to delete relation!' => 'Немогуће брисање везе!',
        'Certificate %s could not be read!' => 'Сертификат %s није могуће прочитати!',
        'Needed Fingerprint' => 'Неопходан отисак',

        # Perl Module: Kernel/Modules/AdminSalutation.pm
        'Salutation updated!' => 'Поздрав ажуриран!',
        'Salutation added!' => 'Поздрав додат!',

        # Perl Module: Kernel/Modules/AdminSupportDataCollector.pm
        'File %s could not be read!' => 'Датотеку %s није могуће прочитати!',

        # Perl Module: Kernel/Modules/AdminSysConfig.pm
        'Import not allowed!' => 'Увоз није дозвољен!',
        'Need File!' => 'Потребна датотека!',
        'Can\'t write ConfigItem!' => 'Не могу да упишем конфигурациону ставку!',

        # Perl Module: Kernel/Modules/AdminSystemMaintenance.pm
        'Start date shouldn\'t be defined after Stop date!' => 'Датум почетка не би требало одредити после датума завршетка!',
        'There was an error creating the System Maintenance' => 'Дошло је до грешке приликом креирања Одржавања система',
        'Need SystemMaintenanceID!' => 'Потребан ИД Одржавања система!',
        'Could not get data for SystemMaintenanceID %s' => 'Не могу прибавити податке за системско одржавање %s',
        'System Maintenance was saved successfully!' => 'Системско одржавање је успешно сачувано!',
        'Session has been killed!' => 'Сесија је прекинута!',
        'All sessions have been killed, except for your own.' => 'Све сесије су прекинуте, осим сопствене.',
        'There was an error updating the System Maintenance' => 'Дошло је до грешке приликом ажурирања Одржавања система',
        'Was not possible to delete the SystemMaintenance entry: %s!' => 'Није било могуће обрисати унос за системско одржавање: %s!',

        # Perl Module: Kernel/Modules/AdminTemplate.pm
        'Template updated!' => 'Шаблон ажуриран!',
        'Template added!' => 'Шаблон додат!',

        # Perl Module: Kernel/Modules/AdminType.pm
        'Need Type!' => 'Потребан тип!',

        # Perl Module: Kernel/Modules/AgentDashboardCommon.pm
        'No such config for %s' => 'Нема такве конфигурације за %s',
        'Statistic' => 'Статистика',
        'No preferences for %s!' => 'Нема поставки за %s!',
        'Can\'t get element data of %s!' => 'Не могу прибавити податке елемента за „%s”!',
        'Can\'t get filter content data of %s!' => 'Не могу прибавити податке сарджаја филтера за „%s”!',
        'Customer Company Name' => 'Назив фирме клијента',
        'Customer User ID' => 'ИД клијента корисника',

        # Perl Module: Kernel/Modules/AgentLinkObject.pm
        'Need SourceObject and SourceKey!' => 'Неопходан изворни објект и изворни кључ!',
        'Please contact the administrator.' => 'Молимо контактирајте администратора!',
        'You need ro permission!' => 'Потребна вам је „ro” дозвола!',
        'Can not delete link with %s!' => 'Не може се обрисати веза са %s!',
        'Can not create link with %s! Object already linked as %s.' => 'Не може се креирати веза са %s! Објект је већ повезан као %s.',
        'Can not create link with %s!' => 'Не може се креирати веза са %s!',
        'The object %s cannot link with other object!' => 'Објект %s се не може повезати са другим објектом!',

        # Perl Module: Kernel/Modules/AgentPreferences.pm
        'Param Group is required!' => 'Неопходан параметар групе! ',

        # Perl Module: Kernel/Modules/AgentStatistics.pm
        'Parameter %s is missing.' => 'Недостаје параметар %s.',
        'Invalid Subaction.' => 'Неважећа субакција.',
        'Statistic could not be imported.' => 'Статистика се не може увести.',
        'Please upload a valid statistic file.' => 'Молимо да учитате исправну датотеку статистике.',
        'Export: Need StatID!' => 'Извоз: Потребан ИД статистике!',
        'Delete: Get no StatID!' => 'Delete: нема StatID!',
        'Need StatID!' => 'Потребан ИД статистике!',
        'Could not load stat.' => 'Није могуће учитавање статистике.',
        'Could not create statistic.' => 'Није могуће креирање статистике.',
        'Run: Get no %s!' => 'Run: Нема %s!',

        # Perl Module: Kernel/Modules/AgentTicketActionCommon.pm
        'No TicketID is given!' => 'Није дат ИД Тикета!',
        'You need %s permissions!' => 'Потребне су вам %s дозволе!',
        'Could not perform validation on field %s!' => 'Није могуће обавити валидацију за поље %s!',
        'No subject' => 'Нема предмет',
        'Previous Owner' => 'Претходни власник',

        # Perl Module: Kernel/Modules/AgentTicketBounce.pm
        '%s is needed!' => '%s је неопходно!',
        'Plain article not found for article %s!' => 'Није пронађен обичан чланак за чланак %s!',
        'Article does not belong to ticket %s!' => 'Чланак не припада тикету %s!',
        'Can\'t bounce email!' => 'Не могу одбацити имејл!',
        'Can\'t send email!' => 'Не могу послати имејл!',
        'Wrong Subaction!' => 'Погрешна субакција!',

        # Perl Module: Kernel/Modules/AgentTicketBulk.pm
        'Can\'t lock Tickets, no TicketIDs are given!' => 'Тикети се не могу закључати, није дат ИД Тикета!',
        'Ticket (%s) is not unlocked!' => 'Тикет (%s) није откључан!',
        'Bulk feature is not enabled!' => 'Масовна функција није активирана!',
        'No selectable TicketID is given!' => 'Није дат ИД Тикета који се може изабрати!',
        'You either selected no ticket or only tickets which are locked by other agents.' =>
            'Нисте селектовали ни један тикет или само тикете које су закључали други оператери.',
        'You need to select at least one ticket.' => 'Неопходно је да изаберете бар један тикет.',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to these tickets: %s.' =>
            'Следећи тикети су били игнорисани зато што су закључани од стране другог оператера или зато што немате право уписа у њих: %s.',
        'The following tickets were locked: %s.' => 'Следећи тикети су били закључани: %s.',

        # Perl Module: Kernel/Modules/AgentTicketCompose.pm
        'Can not determine the ArticleType!' => 'Није могуће утврдити Тип чланка.',

        # Perl Module: Kernel/Modules/AgentTicketEmail.pm
        'No Subaction!' => 'Нема субакције!',

        # Perl Module: Kernel/Modules/AgentTicketEmailOutbound.pm
        'Got no TicketID!' => 'Нема ИД Тикета!',
        'System Error!' => 'Системска грешка!',

        # Perl Module: Kernel/Modules/AgentTicketEscalationView.pm
        'Invalid Filter: %s!' => 'Неважећи филтер: %s!',

        # Perl Module: Kernel/Modules/AgentTicketHistory.pm
        'Can\'t show history, no TicketID is given!' => 'Не може се приказати историјат, није дат ИД Тикета!',

        # Perl Module: Kernel/Modules/AgentTicketLock.pm
        'Can\'t lock Ticket, no TicketID is given!' => 'Тикет се не може закључати, није дат ИД Тикета!',
        'Sorry, the current owner is %s!' => 'На жалост, актуелни власник је %s!',
        'Please become the owner first.' => 'Молимо прво преузмите власништво.',
        'Ticket (ID=%s) is locked by %s!' => 'Тикет (ИД=%s) је закључао %s!',
        'Change the owner!' => 'Промени власника!',

        # Perl Module: Kernel/Modules/AgentTicketMerge.pm
        'Can\'t merge ticket with itself!' => 'Тикет се не може повезати са собом!',

        # Perl Module: Kernel/Modules/AgentTicketMove.pm
        'You need move permissions!' => 'Неопходна вам је дозвола за премештање!',

        # Perl Module: Kernel/Modules/AgentTicketPhone.pm
        'Chat is not active.' => 'Ћаскање није активно.',
        'No permission.' => 'Нема дозволе.',
        '%s has left the chat.' => '%s је напустио ћаскање.',
        'This chat has been closed and will be removed in %s hours.' => 'Ово ћаскање је затворено и биће уклоњено за %s сати.',

        # Perl Module: Kernel/Modules/AgentTicketPlain.pm
        'No ArticleID!' => 'Нема ИД Чланка!',
        'Can\'t read plain article! Maybe there is no plain email in backend! Read backend message.' =>
            'Немогуће читање неформатираног чланка! Можда не постоји неформатирана порука у позадинском приказу! Прочитајте поруку из приказа.',

        # Perl Module: Kernel/Modules/AgentTicketPrint.pm
        'Need TicketID!' => 'Потребан ИД Тикета!',
        'printed by' => 'штампао',
        'Ticket Dynamic Fields' => 'Динамичка поља тикета',

        # Perl Module: Kernel/Modules/AgentTicketProcess.pm
        'Couldn\'t get ActivityDialogEntityID "%s"!' => 'Не могу прибавити ActivityDialogEntityID „%s”!',
        'No Process configured!' => 'Нема конфигурисаног процеса!',
        'Process %s is invalid!' => 'Процес %s је неважећи!',
        'Subaction is invalid!' => 'Субакција је неважећа!',
        'Parameter %s is missing in %s.' => 'Недостаје параметар %s у %s.',
        'No ActivityDialog configured for %s in _RenderAjax!' => 'Ниједан дијалог активности није конфигурисан за %s у „_RenderAjax”!',
        'Got no Start ActivityEntityID or Start ActivityDialogEntityID for Process: %s in _GetParam!' =>
            'Нема Start ActivityEntityID или Start ActivityDialogEntityID за процес %s у _GetParam!',
        'Couldn\'t get Ticket for TicketID: %s in _GetParam!' => 'Нема тикета за TicketID: %s у _GetParam!',
        'Couldn\'t determine ActivityEntityID. DynamicField or Config isn\'t set properly!' =>
            'Не може се утврдити ИД ентитета активности. Дининамичко поље или конфигурација нису правилно подешени!',
        'Process::Default%s Config Value missing!' => 'Вредност конфигурације за Process::Default%s недостаје!',
        'Got no ProcessEntityID or TicketID and ActivityDialogEntityID!' =>
            'Нема ProcessEntityID или TicketID и ActivityDialogEntityID!',
        'Can\'t get StartActivityDialog and StartActivityDialog for the ProcessEntityID "%s"!' =>
            'Не могу прибавити StartActivityDialog и StartActivityDialog за ProcessEntityID „%s”!',
        'Can\'t get Ticket "%s"!' => 'Не могу прибавити тикет „%s”!',
        'Can\'t get ProcessEntityID or ActivityEntityID for Ticket "%s"!' =>
            'Не могу прибавити ProcessEntityID или ActivityEntityID за тикет „%s”!',
        'Can\'t get Activity configuration for ActivityEntityID "%s"!' =>
            'Не могу прибавити конфигурацију Activity за ActivityEntityID „%s”!',
        'Can\'t get ActivityDialog configuration for ActivityDialogEntityID "%s"!' =>
            'Не могу прибавити конфигурацију ActivityDialog за ActivityDialogEntityID „%s”!',
        'Can\'t get data for Field "%s" of ActivityDialog "%s"!' => 'Не могу прибавити податке за поље "%s" дијалога активности „%s”!',
        'PendingTime can just be used if State or StateID is configured for the same ActivityDialog. ActivityDialog: %s!' =>
            'Време чекања тикета може бити коришћено ако су стање или ИД стања подешени за исти дијалог активности. ActivityDialog: %s!',
        'Pending Date' => 'Датум чекања',
        'for pending* states' => 'за стања* чекања',
        'ActivityDialogEntityID missing!' => 'Недостаје ИД ентитета Дијалога активности!',
        'Couldn\'t get Config for ActivityDialogEntityID "%s"!' => 'Не могу прибавити конфигурацију за ActivityDialogEntityID „%s”!',
        'Couldn\'t use CustomerID as an invisible field.' => 'CustomerID се не може користити као невидљиво поље.',
        'Missing ProcessEntityID, check your ActivityDialogHeader.tt!' =>
            'Нема ProcessEntityID, проверите ваш ActivityDialogHeader.tt!',
        'No StartActivityDialog or StartActivityDialog for Process "%s" configured!' =>
            'Нема StartActivityDialog или StartActivityDialog за процес „%s”!',
        'Couldn\'t create ticket for Process with ProcessEntityID "%s"!' =>
            'Не могу креирати тикет за процес са ИД ентитета процеса „%s”!',
        'Couldn\'t set ProcessEntityID "%s" on TicketID "%s"!' => 'Не могу поставити ProcessEntityID „%s” за ИД тикета „%s”!',
        'Couldn\'t set ActivityEntityID "%s" on TicketID "%s"!' => 'Не могу поставити ActivityEntityID „%s” за ИД тикета „%s”!',
        'Could not store ActivityDialog, invalid TicketID: %s!' => 'Не могу снимити дијалог активности, неважећи ИД тикета: %s!',
        'Invalid TicketID: %s!' => 'Неважећи ИД тикета: %s!',
        'Missing ActivityEntityID in Ticket %s!' => 'Недостаје ИД ентитета активности на тикету %s!',
        'This step does not belong anymore the current activity in process for Ticket %s!' =>
            '',
        'Another user changed this ticket in the meantime. Please close this window and reload the ticket.' =>
            '',
        'Missing ProcessEntityID in Ticket %s!' => 'Недостаје ИД ентитета процеса на тикету %s!',
        'Could not set DynamicField value for %s of Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Не могу поставити вредност динамичког поља за %s за ИД тикета „%s” у дијалогу активности „%s”!',
        'Could not set PendingTime for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Не могу поставити време чекања тикета за ИД тикета „%s” у дијалогу активности „%s”!',
        'Wrong ActivityDialog Field config: %s can\'t be Display => 1 / Show field (Please change its configuration to be Display => 0 / Do not show field or Display => 2 / Show field as mandatory)!' =>
            'Погрешна конфигурација поља у дијалогу активности: %s не може бити Display => 1 / приказано. (Молимо подесите конфигурацију да буде Display => 0 / није приказано или Display => 2 / прикажи као обавезно)!',
        'Could not set %s for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Не могу поставити %s за ИД тикета „%s” у дијалогу активности „%s”!',
        'Default Config for Process::Default%s missing!' => 'Подразумевано подешавање за Process::Default%s недостаје!',
        'Default Config for Process::Default%s invalid!' => 'Подразумевано подешавање за Process::Default%s је неважеће!',

        # Perl Module: Kernel/Modules/AgentTicketSearch.pm
        'Untitled' => 'Нема наслов',
        'Customer Name' => 'Назив клијента',
        'Invalid Users' => 'Погрешни корисници',
        'CSV' => 'CSV',
        'Excel' => '„Excel”',

        # Perl Module: Kernel/Modules/AgentTicketService.pm
        'Feature not enabled!' => 'Функција није активирана!',

        # Perl Module: Kernel/Modules/AgentTicketWatcher.pm
        'Feature is not active' => 'Функција није активна',

        # Perl Module: Kernel/Modules/AgentTicketZoom.pm
        'Link Deleted' => 'Обрисана веза',
        'Ticket Locked' => 'Закључан тикет',
        'Pending Time Set' => 'Времена чекања је подешено',
        'Dynamic Field Updated' => 'Ажурирано динамичко поље',
        'Outgoing Email (internal)' => 'Одлазни имејл (интерни)',
        'Ticket Created' => 'Креиран тикет',
        'Type Updated' => 'Ажуриран тип',
        'Escalation Update Time In Effect' => 'Актуелно време ажурирања ескалације',
        'Escalation Update Time Stopped' => 'Време ажурирања ескалације је заустављено',
        'Escalation First Response Time Stopped' => 'Време првог одзива ескалације је заустављено',
        'Customer Updated' => 'Ажуриран клијент',
        'Internal Chat' => 'Интерно ћаскање',
        'Automatic Follow-Up Sent' => 'Послат аутоматски наставак',
        'Note Added' => 'Додата напомена',
        'Note Added (Customer)' => 'Додата напомена (клијент)',
        'State Updated' => 'Ажурирано стање',
        'Outgoing Answer' => 'Одлазни одговор',
        'Service Updated' => 'Ажуриран сервис',
        'Link Added' => 'Додата веза',
        'Incoming Customer Email' => 'Долазни имејл клијента',
        'Incoming Web Request' => 'Долазни веб захтев',
        'Priority Updated' => 'Ажуриран приоритет',
        'Ticket Unlocked' => 'Откључан тикет',
        'Outgoing Email' => 'Одлазни имејл',
        'Title Updated' => 'Ажуриран наслов',
        'Ticket Merged' => 'Спојен тикет',
        'Outgoing Phone Call' => 'Излазни телефонски позив',
        'Forwarded Message' => 'Прослеђена порука',
        'Removed User Subscription' => 'Уклоњена претплата за корисника',
        'Time Accounted' => 'Време је обрачунато',
        'Incoming Phone Call' => 'Улазни телефонски позив',
        'System Request.' => 'Системски захтев.',
        'Incoming Follow-Up' => 'Долазни наставак',
        'Automatic Reply Sent' => 'Послат аутоматски одговор',
        'Automatic Reject Sent' => 'Послато аутоматско одбијање',
        'Escalation Solution Time In Effect' => 'Актуелно време решавања ескалације',
        'Escalation Solution Time Stopped' => 'Време решења ескалације је заустављено',
        'Escalation Response Time In Effect' => 'Актуелно време одговора на ескалацију',
        'Escalation Response Time Stopped' => 'Време одзива ескалације је заустављено',
        'SLA Updated' => '„SLA” је ажуриран',
        'Queue Updated' => 'Ажуриран ред',
        'External Chat' => 'Екстерно ћаскање',
        'Queue Changed' => 'Промењен ред',
        'Notification Was Sent' => 'Обавештење је послато',
        'We are sorry, you do not have permissions anymore to access this ticket in its current state.' =>
            'Жао нам је, ви више немате дозволу за приступ овом тикету у његовом садашњем стању.',
        'Can\'t get for ArticleID %s!' => 'Не могу прибавити ИД чланка %s!',
        'Article filter settings were saved.' => 'Подешавања филтера чланка су сачувана.',
        'Event type filter settings were saved.' => 'Подешавања филтера типа догађаја су сачувана.',
        'Need ArticleID!' => 'Неопходан ИД Чланка!',
        'Invalid ArticleID!' => 'Неважећи ИД Чланка!',
        'Offline' => 'Није на вези',
        'User is currently offline.' => 'Корисник тренутно није на вези.',
        'User is currently active.' => 'Корисник је тренутно активан.',
        'Away' => 'Одсутан',
        'User was inactive for a while.' => 'Корисник није био активан неко време.',
        'Unavailable' => 'Недоступно',
        'User set their status to unavailable.' => 'Корисник је недоступан.',
        'Fields with no group' => 'Поља без групе',
        'View the source for this Article' => 'Погледај извор овог Чланка',

        # Perl Module: Kernel/Modules/CustomerTicketAttachment.pm
        'FileID and ArticleID are needed!' => 'Потребан ИД датотеке и ИД чланка!',
        'No TicketID for ArticleID (%s)!' => 'Нема ИД тикета за овај ИД чланка (%s)!',
        'No such attachment (%s)!' => 'Нема таквог прилога (%s)!',

        # Perl Module: Kernel/Modules/CustomerTicketMessage.pm
        'Check SysConfig setting for %s::QueueDefault.' => 'Проверите подешавања за %s::QueueDefault.',
        'Check SysConfig setting for %s::TicketTypeDefault.' => 'Проверите подешавања за %s::TicketTypeDefault.',

        # Perl Module: Kernel/Modules/CustomerTicketOverview.pm
        'Need CustomerID!' => 'Неопходан ИД клијента!',
        'My Tickets' => 'Моји тикети',
        'Company Tickets' => 'Тикети фирми',
        'Untitled!' => 'Нема наслов!',

        # Perl Module: Kernel/Modules/CustomerTicketSearch.pm
        'Please remove the following words because they cannot be used for the search:' =>
            'Молимо да уклоните следеће речи  јер се не могу користити за претрагу:',

        # Perl Module: Kernel/Modules/CustomerTicketZoom.pm
        'Can\'t reopen ticket, not possible in this queue!' => 'Тикет се не може поново отворити, није могуће у овом реду!',
        'Create a new ticket!' => 'Направи нови тикет!',

        # Perl Module: Kernel/Modules/Installer.pm
        'Directory "%s" doesn\'t exist!' => 'Директоријум „%s” не постоји!',
        'Configure "Home" in Kernel/Config.pm first!' => 'Прво подесите „Home” у Kernel/Config.pm!',
        'File "%s/Kernel/Config.pm" not found!' => 'Датотека „%s/Kernel/Config.pm” није пронађена!',
        'Directory "%s" not found!' => 'Директоријум „%s” није пронађен!',
        'Kernel/Config.pm isn\'t writable!' => 'Немогућ упис у „%s/Kernel/Config.pm”!',
        'If you want to use the installer, set the Kernel/Config.pm writable for the webserver user!' =>
            'Ако желите да користите инсталациони програм, подесите дозволу писања у „%s/Kernel/Config.pm” за вебсервер корисника!',
        'Unknown Check!' => 'Непозната провера!',
        'The check "%s" doesn\'t exist!' => 'Провера „%s” не постоји!',
        'Database %s' => 'База података %s',
        'Configure MySQL' => '',
        'Configure PostgreSQL' => '',
        'Configure Oracle' => '',
        'Unknown database type "%s".' => 'Непознат тип базе података „%s”.',
        'Please go back.' => 'Молимо идите назад.',
        'Install OTRS - Error' => 'Инсталирање „OTRS” - грешка',
        'File "%s/%s.xml" not found!' => 'Датотека „%s/%s.xml” није пронађена!',
        'Contact your Admin!' => 'Контактирајте вашег администратора!',
        'Syslog' => '',
        'Can\'t write Config file!' => 'Не могу да упишем конфигурациону датотеку!',
        'Unknown Subaction %s!' => 'Непозната субакција %s!',
        'Can\'t connect to database, Perl module DBD::%s not installed!' =>
            'Не могу се повезати на базу података, Перл модул DBD::%s није инсталиран!',
        'Can\'t connect to database, read comment!' => 'Не могу се повезати на базу података, прочитајте коментар!',
        'Error: Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Грешка: Молимо да проверите да ваша база података прихвата пакете по величини веће од %s MB  (тренутно прихвата пакете величине до %s MB). Молимо да прилагодите параметар „max_allowed_packet setting” у вашој бази података како би избегли грешке.',
        'Error: Please set the value for innodb_log_file_size on your database to at least %s MB (current: %s MB, recommended: %s MB). For more information, please have a look at %s.' =>
            'Грешка: Молимо да подесете вредност за „innodb_log_file_size” у вашој бази података на најмање %s MB (тренутно: %s MB, препоручено: %s MB). За више информација, молимо погледајте на %s.',

        # Perl Module: Kernel/Modules/PublicRepository.pm
        'Need config Package::RepositoryAccessRegExp' => 'Неопходна конфигурација Package::RepositoryAccessRegExp',
        'Authentication failed from %s!' => 'Аутентификација није успела од %s!',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/PGP.pm
        'Sent message crypted to recipient!' => 'Послата шифрована порука примаоцу!',
        '"PGP SIGNED MESSAGE" header found, but invalid!' => '„PGP SIGNED MESSAGE” заглавље пронађено али је неисправно!',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/SMIME.pm
        '"S/MIME SIGNED MESSAGE" header found, but invalid!' => '„S/MIME SIGNED MESSAGE” заглавље пронађено али је неисправно!',
        'Ticket decrypted before' => 'Тикет је дешифрован пре',
        'Impossible to decrypt: private key for email was not found!' => 'Немогуће дешифровање: приватни кључ за ову адресу није пронађен!',
        'Successful decryption' => 'Успешно дешифровање',

        # Perl Module: Kernel/Output/HTML/Dashboard/EventsTicketCalendar.pm
        'The start time of a ticket has been set after the end time!' => 'Време почетка тикета је подешено после времена завршетка!',

        # Perl Module: Kernel/Output/HTML/Dashboard/News.pm
        'Can\'t connect to OTRS News server!' => 'Није могуће повезати се са OTRS News сервером!',
        'Can\'t get OTRS News from server!' => 'Не могу прибавити OTRS News са сервера!',

        # Perl Module: Kernel/Output/HTML/Dashboard/ProductNotify.pm
        'Can\'t connect to Product News server!' => 'Није могуће повезази се са Product News сервером!',
        'Can\'t get Product News from server!' => 'Не могу прибавити Product News са сервера!',

        # Perl Module: Kernel/Output/HTML/Dashboard/RSS.pm
        'Can\'t connect to %s!' => 'Није могуће повезати се са %s!',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketGeneric.pm
        'sorted ascending' => 'сортирано растуће',
        'sorted descending' => 'сортирано опадајуће',
        'filter not active' => 'филтер није активан',
        'filter active' => 'филтер је активан',
        'This ticket has no title or subject' => 'Овај тикет нема наслов или предмет',

        # Perl Module: Kernel/Output/HTML/Layout.pm
        'We are sorry, you do not have permissions anymore to access this ticket in its current state. You can take one of the following actions:' =>
            'Жао нам је али ви више немате дозволу за приступ овом тикету у његовом актуелном стању. Можете предузети једну од следећих акција:',
        'No Permission' => 'Нема дозволе',

        # Perl Module: Kernel/Output/HTML/Layout/LinkObject.pm
        'Linked as' => 'Повезано као',
        'Search Result' => 'Резултат претраге',

        # Perl Module: Kernel/Output/HTML/LinkObject/Ticket.pm
        'Archive search' => 'Претрага архиве',

        # Perl Module: Kernel/Output/HTML/Notification/AgentOTRSBusiness.pm
        '%s Upgrade to %s now! %s' => '%s ажурирајте на %s сада! %s',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerSystemMaintenanceCheck.pm
        'A system maintenance period will start at: ' => 'Период одржавања система ће отпочети у:',

        # Perl Module: Kernel/Output/HTML/Preferences/Language.pm
        '(in process)' => '(у току)',

        # Perl Module: Kernel/Output/HTML/Preferences/NotificationEvent.pm
        'Please make sure you\'ve chosen at least one transport method for mandatory notifications.' =>
            'Молимо вас да проверите да сте изабрали бар један метод транспорта за обавезна обавештења.',

        # Perl Module: Kernel/Output/HTML/Preferences/OutOfOffice.pm
        'Please specify an end date that is after the start date.' => 'Молимо да одредите датум завршетка који је после датума почетка.',

        # Perl Module: Kernel/Output/HTML/Preferences/Password.pm
        'Please supply your new password!' => 'Молимо да обезбедите нову лозинку!',

        # Perl Module: Kernel/Output/HTML/Statistics/View.pm
        'No (not supported)' => 'Не (није подржано)',
        'No past complete or the current+upcoming complete relative time value selected.' =>
            'Није одабрана временска вредност са комплетном прошлошћу или комплетним тренутним и будућим релативним периодом.',
        'The selected time period is larger than the allowed time period.' =>
            'Изабрани временски период је дужи од дозвољеног.',
        'No time scale value available for the current selected time scale value on the X axis.' =>
            'Нема доступног временског опсега за актуелну изабрану вредност опсега на X оси.',
        'The selected date is not valid.' => 'Изабрани датум није важећи.',
        'The selected end time is before the start time.' => 'Изабрано време завршетка је пре времена почетка.',
        'There is something wrong with your time selection.' => 'Нешто није у реду са вашим избором времена.',
        'Please select only one element or allow modification at stat generation time.' =>
            'Молимо да изаберете само један елемент или дозволите измене у време генерисања старта!',
        'Please select at least one value of this field or allow modification at stat generation time.' =>
            'Молимо да изаберете барем једну вредност овог поља или дозволите измену у време генерисања статистике.',
        'Please select one element for the X-axis.' => 'Молимо да изаберете један елемент за X-осу.',
        'You can only use one time element for the Y axis.' => 'Можете користити само један временски елемент за Y осу.',
        'You can only use one or two elements for the Y axis.' => 'Можете да користите само један или два елемента за Y осу.',
        'Please select at least one value of this field.' => 'Молимо да изаберете бар једну вредност за ово поље.',
        'Please provide a value or allow modification at stat generation time.' =>
            'Молимо да обезбедите вредност или дозволите измене у време генерисања старта.',
        'Please select a time scale.' => 'Молимо да одаберете временски опсег.',
        'Your reporting time interval is too small, please use a larger time scale.' =>
            'Ваш интервал извештавања је прекратак, молимо употребите већи распон времена.',
        'Please remove the following words because they cannot be used for the ticket restrictions: %s.' =>
            'Молимо да уклоните следеће речи јер се не могу користити због ограничења тикета: %s.',

        # Perl Module: Kernel/Output/HTML/TicketOverviewMenu/Sort.pm
        'Order by' => 'Сортирај по',

        # Perl Module: Kernel/System/AuthSession.pm
        'You have exceeded the number of concurrent agents - contact sales@otrs.com.' =>
            'Прекорачили сте број истовремено пријављених оператера - контактирајте sales@otrs.com.',
        'Please note that the session limit is almost reached.' => 'Имајте у виду да је ограничење сесија скоро достигнуто.',
        'Login rejected! You have exceeded the maximum number of concurrent Agents! Contact sales@otrs.com immediately!' =>
            'Пријава одбијена! Прекорачили сте дозвољени број истовремено пријављених оператера! Под хитно контактирајте sales@otrs.com!',
        'Session per user limit reached!' => 'Достигнуто ограничење броја сесија по кориснику!',

        # Perl Module: Kernel/System/Console/Command/Dev/Tools/Config2Docbook.pm
        'Configuration Options Reference' => 'Референтни списак конфигурационих опција',
        'This setting can not be changed.' => 'Ово подешавање се не може мењати.',
        'This setting is not active by default.' => 'Ово подешавање није подразумевано активно.',
        'This setting can not be deactivated.' => 'Ово подешавање се не може деактивирати.',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseText.pm
        'e.g. Text or Te*t' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/Checkbox.pm
        'Ignore this field.' => '',

        # Perl Module: Kernel/System/Package.pm
        'not installed' => 'није инсталирано',
        'File is not installed!' => 'Датотека није инсталирана!',
        'File is different!' => 'Датотека је различита!',
        'Can\'t read file!' => 'Немогуће читање датотеке!',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process/State.pm
        'Inactive' => 'Неактивно',
        'FadeAway' => 'У гашењу',

        # Perl Module: Kernel/System/Registration.pm
        'Can\'t get Token from sever' => 'Не могу прибавити токен од сервера',

        # Perl Module: Kernel/System/Stats.pm
        'Sum' => 'Збир',

        # Perl Module: Kernel/System/Stats/Dynamic/Ticket.pm
        'State Type' => 'Тип статуса',
        'Created Priority' => 'Направљени приоритети',
        'Created State' => 'Креирани статус',
        'Create Time' => 'Време креирања',
        'Close Time' => 'Време затварања',
        'Escalation - First Response Time' => 'Ескалација - време првог одзива',
        'Escalation - Update Time' => 'Ескалација - време ажурирања',
        'Escalation - Solution Time' => 'Ескалација - време решавања',
        'Agent/Owner' => 'Оператер/Власник',
        'Created by Agent/Owner' => 'Креирао Оператер/Власник',
        'CustomerUserLogin' => 'Пријава клијента корисника',
        'CustomerUserLogin (complex search)' => 'Пријава клијента корисника (сложена претрага)',
        'CustomerUserLogin (exact match)' => 'Пријава клијента корисника (тачно поклапање)',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketAccountedTime.pm
        'Evaluation by' => 'Проценио',
        'Ticket/Article Accounted Time' => 'Обрачунато време',
        'Ticket Create Time' => 'Време отварања тикета',
        'Ticket Close Time' => 'Време затварања тикета',
        'Accounted time by Agent' => 'Обрачунато време по оператеру',
        'Total Time' => 'Укупно време',
        'Ticket Average' => 'Просечно време по тикету',
        'Ticket Min Time' => 'Минимално време тикета',
        'Ticket Max Time' => 'Максимално време тикета',
        'Number of Tickets' => 'Број тикета',
        'Article Average' => 'Просечно време по чланку',
        'Article Min Time' => 'Минимално време чланка',
        'Article Max Time' => 'Максимално време чланка',
        'Number of Articles' => 'Број чланака',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketList.pm
        'unlimited' => 'неограничено',
        'ascending' => 'растући',
        'descending' => 'опадајући',
        'Attributes to be printed' => 'Атрибути за штампу',
        'Sort sequence' => 'Редослед сортирања',
        'State Historic' => 'Историјат статуса',
        'State Type Historic' => 'Историјат типа статуса',
        'Historic Time Range' => 'Временски опсег историјата',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketSolutionResponseTime.pm
        'Solution Average' => 'Просечно време решења',
        'Solution Min Time' => 'Минимално време решења',
        'Solution Max Time' => 'Максимално време решења',
        'Solution Average (affected by escalation configuration)' => 'Просечно време решења (под утицајем поставки ескалације)',
        'Solution Min Time (affected by escalation configuration)' => 'Минимално време решења (под утицајем поставки ескалације)',
        'Solution Max Time (affected by escalation configuration)' => 'Максимално време решења (под утицајем поставки ескалације)',
        'Solution Working Time Average (affected by escalation configuration)' =>
            'Просечно радно време решења (под утицајем поставки ескалације)',
        'Solution Min Working Time (affected by escalation configuration)' =>
            'Минимално радно време решења (под утицајем поставки ескалације)',
        'Solution Max Working Time (affected by escalation configuration)' =>
            'Максимално радно време решења (под утицајем поставки ескалације)',
        'First Response Average (affected by escalation configuration)' =>
            '',
        'First Response Min Time (affected by escalation configuration)' =>
            '',
        'First Response Max Time (affected by escalation configuration)' =>
            '',
        'First Response Working Time Average (affected by escalation configuration)' =>
            '',
        'First Response Min Working Time (affected by escalation configuration)' =>
            '',
        'First Response Max Working Time (affected by escalation configuration)' =>
            '',
        'Number of Tickets (affected by escalation configuration)' => 'Број тикета (под утицајем поставки ескалације)',

        # Perl Module: Kernel/System/Stats/Static/StateAction.pm
        'Days' => 'Дани',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/TablePresence.pm
        'Table Presence' => 'Присуство табеле',
        'Internal Error: Could not open file.' => 'Интерна грешка: Није могуће отворити датотеку.',
        'Table Check' => 'Провера табеле',
        'Internal Error: Could not read file.' => 'Интерна грешка: Није могуће прочитати датотеку.',
        'Tables found which are not present in the database.' => 'Пронађене табеле које нису присутне у бази података.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Size.pm
        'Database Size' => 'Величина базе података',
        'Could not determine database size.' => 'Није могуће утврдити величину базе података.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Version.pm
        'Database Version' => 'Верзија базе података',
        'Could not determine database version.' => 'Није могуће утврдити верзију базе података',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Charset.pm
        'Client Connection Charset' => 'Карактерсет за повезивање клијента',
        'Setting character_set_client needs to be utf8.' => 'Podešavanje character_set_client mora biti utf8.',
        'Server Database Charset' => 'Karakterset serverske baze podataka',
        'Setting character_set_database needs to be UNICODE or UTF8.' => 'Подешавање character_set_database мора бити UNICODE или UTF8.',
        'Table Charset' => 'Табела карактерсета',
        'There were tables found which do not have utf8 as charset.' => 'Пронађене су табеле које немају utf8 као карактерсет.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InnoDBLogFileSize.pm
        'InnoDB Log File Size' => 'Величина InnoDB датотеке дневника',
        'The setting innodb_log_file_size must be at least 256 MB.' => 'Подешавање „innodb_log_file_size” мора бити барем 256 MB.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/MaxAllowedPacket.pm
        'Maximum Query Size' => 'Максимална величина упита',
        'The setting \'max_allowed_packet\' must be higher than 20 MB.' =>
            'Подешавање \'max_allowed_packet\' мора бити веће од 20 MB.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Performance.pm
        'Query Cache Size' => 'Величина кеш упита',
        'The setting \'query_cache_size\' should be used (higher than 10 MB but not more than 512 MB).' =>
            'Подешавање \'query_cache_size\' мора бити коришћено (веће од 10 MB, али не више од 512 MB)',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/StorageEngine.pm
        'Default Storage Engine' => 'Подразумевани механизам за складиштење',
        'Table Storage Engine' => 'Механизам за складиштење табеле',
        'Tables with a different storage engine than the default engine were found.' =>
            'Пронађене су табеле са различитим механизмом за складиштење него што је предефинисани механизам.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Version.pm
        'MySQL 5.x or higher is required.' => 'Неопходан је MySQL 5.x или више.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/NLS.pm
        'NLS_LANG Setting' => 'NLS_LANG подешавање',
        'NLS_LANG must be set to al32utf8 (e.g. GERMAN_GERMANY.AL32UTF8).' =>
            'NLS_LANG мора бити подешен на al32utf8 (нпр. GERMAN_GERMANY.AL32UTF8).',
        'NLS_DATE_FORMAT Setting' => 'NLS_DATE_FORMAT подешавање',
        'NLS_DATE_FORMAT must be set to \'YYYY-MM-DD HH24:MI:SS\'.' => 'NLS_DATE_FORMAT мора бити подешен на \'YYYY-MM-DD HH24:MI:SS\'.',
        'NLS_DATE_FORMAT Setting SQL Check' => 'SQL провера NLS_DATE_FORMAT подешавања',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Charset.pm
        'Setting client_encoding needs to be UNICODE or UTF8.' => 'Подешавање client_encoding мора бити UNICODE или UTF8.',
        'Setting server_encoding needs to be UNICODE or UTF8.' => 'Подешавање server_encoding мора бити UNICODE или UTF8.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/DateStyle.pm
        'Date Format' => 'Формат датума',
        'Setting DateStyle needs to be ISO.' => 'Подешавање DateStyle мора бити ISO',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Version.pm
        'PostgreSQL 8.x or higher is required.' => 'Препоручено је PostgreSQL 8.x или више.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskPartitionOTRS.pm
        'OTRS Disk Partition' => '„OTRS” партиција на диску',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpace.pm
        'Disk Usage' => 'Коришћење диска',
        'The partition where OTRS is located is almost full.' => 'Партиција на којој је смештен ОТРС је скоро пуна.',
        'The partition where OTRS is located has no disk space problems.' =>
            'Партиција на којој је смештен ОТРС нема проблеме са простором.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpacePartitions.pm
        'Disk Partitions Usage' => 'Коришћење партиције на диску',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Distribution.pm
        'Distribution' => 'Расподела',
        'Could not determine distribution.' => 'Није могуће утврдити расподелу.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/KernelVersion.pm
        'Kernel Version' => 'Кернел верзија',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Load.pm
        'System Load' => 'Оптерећење система',
        'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).' =>
            'Оптерећење система може бити највише број процесора које систем поседује (нпр. оптерећење од 8 или мање на систему са 8 језгара је у реду).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModules.pm
        'Perl Modules' => 'Perl модули',
        'Not all required Perl modules are correctly installed.' => 'Сви захтевани Perl модули нису коректно инсталирани.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Swap.pm
        'Free Swap Space (%)' => 'Слободни Swap простор (%)',
        'No swap enabled.' => 'Размењивање није активирано.',
        'Used Swap Space (MB)' => 'Употребљен Swap простор (MB)',
        'There should be more than 60% free swap space.' => 'Мора постојати више од 60 % слободног swap простора',
        'There should be no more than 200 MB swap space used.' => 'Не треба да буде више од 200 MB употребљеног Swap простора.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ConfigSettings.pm
        'OTRS' => '„OTRS”',
        'Config Settings' => 'Подешавања конфигурације',
        'Could not determine value.' => 'Није могуће утврдити вредност.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DaemonRunning.pm
        'Daemon' => 'Системски сервис',
        'Daemon is running.' => 'Сервис ради.',
        'Daemon is not running.' => 'Сервис не ради.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DatabaseRecords.pm
        'Database Records' => 'Записи у бази података',
        'Tickets' => 'Тикети',
        'Ticket History Entries' => 'Историја уноса тикета',
        'Articles' => 'Чланци',
        'Attachments (DB, Without HTML)' => 'Прилози (база података, без HTML)',
        'Customers With At Least One Ticket' => 'Клијенти са бар једним тикетом',
        'Dynamic Field Values' => 'Вредности динамичког поља',
        'Invalid Dynamic Fields' => 'Неважећа динамичка поља.',
        'Invalid Dynamic Field Values' => 'Неважеће вредности динамичких поља.',
        'GenericInterface Webservices' => 'GenericInterface веб сервис',
        'Process Tickets' => 'Процес тикети',
        'Months Between First And Last Ticket' => 'Месеци између првог и последњег тикета',
        'Tickets Per Month (avg)' => 'Тикети месечно (просечно)',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultSOAPUser.pm
        'Default SOAP Username And Password' => 'Подразумевано „SOAP” корисничко име и лозинка',
        'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.' =>
            'Сигурносни ризик: користите подразумевана подешавања за SOAP::User i SOAP::Password. Молимо промените га.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultUser.pm
        'Default Admin Password' => 'Предефинисана лозинка администратора',
        'Security risk: the agent account root@localhost still has the default password. Please change it or invalidate the account.' =>
            'Сигурносни ризик: агент налог root@localhost још увек има предефинисану лозинку. Молимо промените је или деактивирајте налог.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ErrorLog.pm
        'Error Log' => 'Грешка у пријави',
        'There are error reports in your system log.' => 'Постоје извештаји о грешкама у вашем приступном систему.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FQDN.pm
        'FQDN (domain name)' => ' „FQDN” (назив домена)',
        'Please configure your FQDN setting.' => 'Молимо да подесите „FQDN” параметар.',
        'Domain Name' => 'Назив домена',
        'Your FQDN setting is invalid.' => 'Ваша FQDN подешавања су неважећа.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FileSystemWritable.pm
        'File System Writable' => 'Омогућено писање у систем датотека.',
        'The file system on your OTRS partition is not writable.' => 'Није могуће писање у систем датотека на вашој „OTRS” партицији.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageDeployment.pm
        'Package Installation Status' => 'Статус инсталације пакета',
        'Some packages have locally modified files.' => 'Неки пакети садрже локално измењене датотеке.',
        'Some packages are not correctly installed.' => 'Неки пакети нису исправно инсталирани.',
        'Package Verification Status' => 'Статус верификације пакета',
        'Some packages are not verified by the OTRS Group! It is recommended not to use this packages.' =>
            'Неки пакети нису верификовани од стране OTRS групе! Препоручује се да не користите ове пакете.',
        'Package Framework Version Status' => 'Статус пакета за верзију система',
        'Some packages are not allowed for the current framework version.' =>
            'Неки пакети нису дозвољени за верзију вашег система. ',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageList.pm
        'Package List' => 'Листа пакета',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SessionConfigSettings.pm
        'Session Config Settings' => 'Подешавања сесија',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SpoolMails.pm
        'Spooled Emails' => 'Имејлови у реду чекања',
        'There are emails in var/spool that OTRS could not process.' => 'Постоје имејлови у var/spool које OTRS не може да обради.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SystemID.pm
        'Your SystemID setting is invalid, it should only contain digits.' =>
            'Ваша подешавања системтемског ИД-а су неважећа, треба да садрже само цифре.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/DefaultType.pm
        'Default Ticket Type' => 'Подразумевани тип тикета',
        'The configured default ticket type is invalid or missing. Please change the setting Ticket::Type::Default and select a valid ticket type.' =>
            'Подешени подразумевани тип тикета је неважећи или недостаје. Молимо промените подешавање Ticket::Type::Default и изаберите важећи тип тикета.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/IndexModule.pm
        'Ticket Index Module' => 'Тикет индекс модул',
        'You have more than 60,000 tickets and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'Имате више од 60.000 тикета и треба да користите StaticDB. Погледајте администраторско упутство (Подешавање перформанси) за више информација.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/InvalidUsersWithLockedTickets.pm
        'Invalid Users with Locked Tickets' => 'Неисправни корисници са закључаним тикетима',
        'There are invalid users with locked tickets.' => 'Постоје неисправни корисници са закључаним тикетима.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/OpenTickets.pm
        'Open Tickets' => 'Отворени тикети',
        'You should not have more than 8,000 open tickets in your system.' =>
            'Не би требало да имате више од 8.000 отворених тикета у систему.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/SearchIndexModule.pm
        'Ticket Search Index Module' => 'Модул за индексну претрагу тикета',
        'You have more than 50,000 articles and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'Имате више од 50.000 чланака и треба да користите StaticDB. Погледајте администраторско упутство (Подешавање перформанси) за више информација.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/StaticDBOrphanedRecords.pm
        'Orphaned Records In ticket_lock_index Table' => 'Напуштени записи у ticket_lock_index табели',
        'Table ticket_lock_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'Табела „ticket_lock_index” садржи неповезане записе. Молимо да покренете „bin/otrs.Console.pl” „Maint::Ticket::QueueIndexCleanup” да би очистили „StaticDB” индекс.',
        'Orphaned Records In ticket_index Table' => 'Напуштени записи у ticket_index табели',
        'Table ticket_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'Табела ticket_lindex садржи неповезане записе. Молимо да покренете bin/otrs.Console.pl Maint::Ticket::QueueIndexCleanup да би очистили StaticDB индекс.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/TimeSettings.pm
        'Time Settings' => 'Подешавања времена',
        'Server time zone' => 'Вренеска зона сервера',
        'Computed server time offset' => 'Израчунати помак серверског времена',
        'OTRS TimeZone setting (global time offset)' => '„OTRS” подешавање временске зоне (глобални временски помак)',
        'TimeZone may only be activated for systems running in UTC.' => 'Временска зона се може активирати само за системе који раде на UTC.',
        'OTRS TimeZoneUser setting (per-user time zone support)' => '„OTRS” подешавања корисничке временске зоне (подршка за временске зоне по кориснику)',
        'TimeZoneUser may only be activated for systems running in UTC that don\'t have an OTRS TimeZone set.' =>
            'Подешавање TimeZoneUser може бити активирано само за системе који раде под UTC и који немају подешену опцију OTRS TimeZone.',
        'OTRS TimeZone setting for calendar ' => '„OTRS” подешавање временске зоне за календар',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/LoadedModules.pm
        'Webserver' => 'Веб сервер',
        'Loaded Apache Modules' => 'Учитани „Apache” модули',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/MPMModel.pm
        'MPM model' => 'MPM модел',
        'OTRS requires apache to be run with the \'prefork\' MPM model.' =>
            '„OTRS” захтева да Apache буде покренут са \'prefork\' MPM моделом.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/Performance.pm
        'CGI Accelerator Usage' => 'Употреба CGI Accelerator',
        'You should use FastCGI or mod_perl to increase your performance.' =>
            'За повећање перформанси треба да користите FastCGI или mod_perl.',
        'mod_deflate Usage' => 'Употреба mod_deflate',
        'Please install mod_deflate to improve GUI speed.' => 'Молимо инсталирајте mod_deflate да повећате брзину GUI.',
        'mod_filter Usage' => 'Коришћење „mod_filter”',
        'Please install mod_filter if mod_deflate is used.' => 'Молимо да инсталирате „mod_filter” ако је „mod_deflate” употребљен.',
        'mod_headers Usage' => 'Употреба mod_headers',
        'Please install mod_headers to improve GUI speed.' => 'Молимо инсталирајте mod_headers да повећате брзину GUI',
        'Apache::Reload Usage' => 'Употреба Apache::Reload',
        'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler to prevent web server restarts when installing and upgrading modules.' =>
            'Apache::Reload ili Apache2::Reload се користе као Perl модул и PerlInitHandler ради заштите од рестартовања веб сервера током инсталирања или надоградње модула.',
        'Apache2::DBI Usage' => 'Употреба Apache2::DBI',
        'Apache2::DBI should be used to get a better performance  with pre-established database connections.' =>
            'Apache2::DBI би требало користити за боље перформансе са унапред успостављеним везама са базом података.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/EnvironmentVariables.pm
        'Environment Variables' => 'Променљиве за окружење',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/InternalWebRequest.pm
        'Support Data Collection' => 'Сакупљање података подршке',
        'Support data could not be collected from the web server.' => 'Подаци подршке не могу бити прикупљени са веб сервера.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Version.pm
        'Webserver Version' => 'Веб сервер верзија',
        'Could not determine webserver version.' => 'Не може да препозна веб сервер верзију.',

        # Perl Module: Kernel/System/SupportDataCollector/PluginAsynchronous/OTRS/ConcurrentUsers.pm
        'Concurrent Users Details' => 'Детаљи истовремених корисника',
        'Concurrent Users' => 'Истовремени корисници',

        # Perl Module: Kernel/System/SupportDataCollector/PluginBase.pm
        'Unknown' => 'Непознато',
        'OK' => 'У реду',
        'Problem' => 'Проблем',

        # Perl Module: Kernel/System/Ticket.pm
        'Reset of unlock time.' => 'Поништавање времена откључавања.',

        # Perl Module: Kernel/System/Ticket/Event/NotificationEvent/Transport/Email.pm
        'PGP sign only' => 'Само PGP потпис',
        'PGP encrypt only' => 'Само PGP шифровање',
        'PGP sign and encrypt' => 'PGP потпис и шифровање',
        'SMIME sign only' => 'Само SMIME потпис',
        'SMIME encrypt only' => 'Само SMIME шифровање',
        'SMIME sign and encrypt' => 'SMIME потпис и шифровање',
        'PGP and SMIME not enabled.' => 'PGP и SMIME нису омогућени!',
        'Skip notification delivery' => 'Прескочи доставу обавештења',
        'Send unsigned notification' => 'Пошаљи непотписано обавештење',
        'Send unencrypted notification' => 'Пошаљи нешифовано обавештење',

        # Perl Module: Kernel/System/Web/InterfaceAgent.pm
        'Panic, user authenticated but no user data can be found in OTRS DB!! Perhaps the user is invalid.' =>
            'Пажња, корисник је ',
        'Can`t remove SessionID.' => 'SessionID се не може уклонити.',
        'Logout successful.' => 'Успешна одјава.',
        'Panic! Invalid Session!!!' => 'Пажња! Неважећа сесија!!!',
        'No Permission to use this frontend module!' => 'Немате дозволу за  употребу овог корисничког модула!',

        # Perl Module: Kernel/System/Web/InterfaceCustomer.pm
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact the administrator.' =>
            'Аутентификација је успела, али подаци о клијенту нису пронађени. Молимо контактирајте администратора.',
        'Reset password unsuccessful. Please contact the administrator.' =>
            'Поништавање лозинке није успело. Молимо контактирајте администратора',
        'Added via Customer Panel (%s)' => 'Додато преко клијентског панела (%s)',
        'Customer user can\'t be added!' => 'Не може се додати клијент корисник!',
        'Can\'t send account info!' => 'Не могу послати инфо о налогу!',

        # Perl Module: Kernel/System/Web/InterfaceInstaller.pm
        'SecureMode active!' => 'Сигуран режим је активан!',
        'If you want to re-run the Installer, disable the SecureMode in the SysConfig.' =>
            'Уколико желите да поново покренете инсталацију, онемогућите SecureMode у подешавањима.',
        'Action "%s" not found!' => 'Акција „%s” није пронађена!',

        # Database XML Definition: scripts/database/otrs-initial_insert.xml
        'Group for default access.' => 'Група за подразумеван приступ.',
        'Group of all administrators.' => 'Група свих администратора.',
        'Group for statistics access.' => 'Група за приступ статистици.',
        'All new state types (default: viewable).' => 'Сви нови типови стања (подразумевано: видљиво).',
        'All open state types (default: viewable).' => 'Сви отворени типови стања (подразумевано: видљиво).',
        'All closed state types (default: not viewable).' => 'Сви затворени типови стања (подразумевано: видљиво).',
        'All \'pending reminder\' state types (default: viewable).' => 'Сви типови стања „подсетник на чекању” (подразумевано: видљиво).',
        'All \'pending auto *\' state types (default: viewable).' => 'Сви типови стања „подсетник аутоматски *” (подразумевано: видљиво).',
        'All \'removed\' state types (default: not viewable).' => 'Сви типови стања „уклоњено” (подразумевано: видљиво).',
        'State type for merged tickets (default: not viewable).' => 'Тип стања за спојене тикете (подразумевано: није видљиво).',
        'New ticket created by customer.' => 'Нови тикет који је креирао клијент.',
        'Ticket is closed successful.' => 'Тикет је затворен „успешно”.',
        'Ticket is closed unsuccessful.' => 'Тикет је затворен „неуспешно”.',
        'Open tickets.' => 'Отворени тикети.',
        'Customer removed ticket.' => 'Клијент је уклонио тикет.',
        'Ticket is pending for agent reminder.' => 'Тикет је на чекању за оператерски подсетник.',
        'Ticket is pending for automatic close.' => 'Тикет је на чекању за аутоматско затварање.',
        'State for merged tickets.' => 'Статус за спојене тикете.',
        'system standard salutation (en)' => 'стандардни системски поздрав (en)',
        'Standard Salutation.' => 'Стандардни Поздрав',
        'system standard signature (en)' => 'стандардни системски потпис (en)',
        'Standard Signature.' => 'Стандардни потпис.',
        'Standard Address.' => 'Стандардна адреса.',
        'Follow-ups for closed tickets are possible. Ticket will be reopened.' =>
            'Настављање на затворене тикете је могуће. Тикети ће бити поново отворени.',
        'Follow-ups for closed tickets are not possible. No new ticket will be created.' =>
            'Настављање на затворене тикете није могуће. Нови тикет неће бити креиран.',
        'new ticket' => 'нови тикет',
        'Follow-ups for closed tickets are not possible. A new ticket will be created..' =>
            'Настављање на затворене тикете није могуће. Нови тикет ће бити креиран.',
        'Postmaster queue.' => '„Postmaster” ред.',
        'All default incoming tickets.' => ' Сви подразумевани долазни тикети.',
        'All junk tickets.' => 'Сви бесмислени тикети „junk”.',
        'All misc tickets.' => 'Сви други тикети.',
        'Automatic reply which will be sent out after a new ticket has been created.' =>
            'Аутоматски одговор који ће бити послат после креирања новог тикета.',
        'Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is "reject").' =>
            'Аутоматска порука која ће бити послата након одбацивања наставка (у случају да је опција наставка за ред постављена на „одбаци”).',
        'Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is "possible").' =>
            'Аутоматска потврда која ће бити послата након примања наставка у тикету (у случају да је опција наставка за ред постављена на „могуће”).',
        'Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is "new ticket").' =>
            'Аутоматски одговор који ће бити послат након одбацивања наставка и креирања новог тикета (у случају да је опција наставка за ред постављена на „нови тикет”).',
        'Auto remove will be sent out after a customer removed the request.' =>
            'Аутоматско уклањање ће бити послато кад клијент уклони захтев.',
        'default reply (after new ticket has been created)' => 'подразумевани одговор (после креирања новог тикета)',
        'default reject (after follow-up and rejected of a closed ticket)' =>
            'подразумевано одбацивање (после настављања и одбацивања затвореног тикета)',
        'default follow-up (after a ticket follow-up has been added)' => 'подразумевано наствљање (после додавања настављања на тикет)',
        'default reject/new ticket created (after closed follow-up with new ticket creation)' =>
            'подразумевано одбацивање/креиран нови тикет (после затвореног настављања са креирањем новог тикета)',
        'Unclassified' => 'Неразврстано',
        'tmp_lock' => 'tmp_lock',
        'email-notification-ext' => 'email-notification-ext',
        'email-notification-int' => 'email-notification-int',
        'Ticket create notification' => 'Обавештење о креирању тикета',
        'You will receive a notification each time a new ticket is created in one of your "My Queues" or "My Services".' =>
            'Добићете обавештење сваки пут кад се креира нови тикет у једном од ваших „Моји редови” или „Моји сервиси”.',
        'Ticket follow-up notification (unlocked)' => 'Обавештење о настављању тикета (откључано)',
        'You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your "My Queues" or "My Services".' =>
            'Добићете обавештење када корисник пошаље наставак у откључаном тикету који се налази у „Моји редови” или „Моје услуге”.',
        'Ticket follow-up notification (locked)' => 'Обавештење о настављању тикета (закључано)',
        'You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.' =>
            'Добићете обавештење када корисник пошаље наставак у закључаном тикету чији сте власник или одговорни.',
        'You will receive a notification as soon as a ticket owned by you is automatically unlocked.' =>
            'Добићете обавештење одмах након аутоматског откључавања тикета чији сте власник.',
        'Ticket owner update notification' => 'Обавештење о ажурирању власника тикета',
        'Ticket responsible update notification' => 'Обавештење о ажурирању одговорног за тикет',
        'Ticket new note notification' => 'Обавештење о новој напомени тикета',
        'Ticket queue update notification' => 'Обавештење о ажурирању реда тикета',
        'You will receive a notification if a ticket is moved into one of your "My Queues".' =>
            'Добићете обавештење ако се тикет премести у један од ваших „Моји редови”.',
        'Ticket pending reminder notification (locked)' => 'Обавештење - подсетник тикета на чекању (закључано)',
        'Ticket pending reminder notification (unlocked)' => 'Обавештење - подсетник тикета на чекању (откључано)',
        'Ticket escalation notification' => 'Обавештење о ескалацији тикета',
        'Ticket escalation warning notification' => 'Обавештење о упозорењу на ескалацију тикета',
        'Ticket service update notification' => 'Обавештење о ажурирању услуге тикета',
        'You will receive a notification if a ticket\'s service is changed to one of your "My Services".' =>
            'Добићете обавештење ако се сервис тикета промени у један од ваших „Моји сервиси”.',

        # SysConfig
        '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
' => '
Поштовани,

На жалост не можемо пронаћи важећи број тикета
у вашем предмету, па овај имејл не може бити обрађен.

Молимо Вас да преко клијентског панела креирате нови тикет.

Хвала на вашој помоћи!

Ваша техничка подршка
',
        ' (work units)' => '(радне јединице)',
        '"%s" notification was sent to "%s" by "%s".' => '„%s” обавештења послато за „%s” од „%s”.',
        '"Slim" skin which tries to save screen space for power users.' =>
            '„Упрошћени” изглед који покушава да уштеди место за напредне кориснике.',
        '%s' => '%s',
        '%s time unit(s) accounted. Now total %s time unit(s).' => '%s временских јединица пребројано. Укупно %s временских јединица.',
        '(UserLogin) Firstname Lastname' => '(Пријава корисника) Име Презиме',
        '(UserLogin) Lastname Firstname' => '(Пријава корисника) Презиме Име',
        '(UserLogin) Lastname, Firstname' => '(Пријава корисника) Презиме, Име',
        '*** out of office until %s (%s d left) ***' => '*** ван канцеларије до %s (преостало %s д) ***',
        '100 (Expert)' => '100 (Експерт)',
        '200 (Advanced)' => '200 (Напредни)',
        '300 (Beginner)' => '300 (Почетник)',
        'A TicketWatcher Module.' => 'Модул надзора тикета.',
        'A Website' => 'Вебсајт',
        'A list of dynamic fields that are merged into the main ticket during a merge operation. Only dynamic fields that are empty in the main ticket will be set.' =>
            'Листа динамичких поља која су споајена у главни тикет током операције спајања. Биће подешена само динамичка поља која су празна у главном тикету.',
        'A picture' => 'Слика',
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'ACL модул који дозвољава да надређени тикети буду затворени само ако су већ затворени сви подређени тикети („State” показује која стања нису доступна за надређени тикет док се не затворе сви подређени тикети).',
        'Access Control Lists (ACL)' => 'Листе за контролу приступа (ACL)',
        'AccountedTime' => 'Обрачунато време',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Активира механизам трептања реда који саржи најстарији тикет.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Активира опцију изгубљене лозинке за оператере, на интерфејсу за њих.',
        'Activates lost password feature for customers.' => 'Активира својство изгубљене лозинке за клијенте.',
        'Activates support for customer groups.' => 'Активира подршку за клијентске групе.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Активира филтер за чланке у проширеном прегледу ради дефинисања који чланци треба да буду приказани.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Активира расположиве теме - шаблоне у систему. Вредност 1 значи активно, 0 значи неактивно.',
        'Activates the ticket archive system search in the customer interface.' =>
            'Активира могућност претраживања архиве тикета у клијентском интерфејсу.',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Активира архивски систем ради убрзања рада, тако што ћете неке тикете уклонити ван дневног праћења. Да бисте пронашли ове тикете, маркер архиве мора бити омогућен за претрагу тикета.',
        'Activates time accounting.' => 'Активира мерење времена.',
        'ActivityID' => 'ИД активности',
        'Add an inbound phone call to this ticket' => 'Додај долазни телефонски позив овом тикету.',
        'Add an outbound phone call to this ticket' => 'Додај одлазни телефонски позив овом тикету.',
        'Added email. %s' => 'Додат имејл. %s',
        'Added link to ticket "%s".' => 'Веза на „%s” постављена.',
        'Added note (%s)' => 'Додата напомена (%s)',
        'Added subscription for user "%s".' => 'Претплата за корисника „%s” укључена.',
        'Address book of CustomerUser sources.' => 'Адресар извора података за CustomerUser.',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            'Додаје текућу годину и месец као суфикс у „OTRS” датотеку дневника. Биће креирана датотека дневника за сваки месец.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface. The customers email address won\'t be added if the article type is email-internal.' =>
            'Додавање имејл адреса клијената, примаоцима у тикету на приказу екрана за отварање тикета у интерфејсу оператера. Имејл адресе клијената неће бити додате, уколико је тип артикла имејл-интерни.',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Једнократно додаје нерадне дане за изабрани календар. Молимо Вас да користите једну цифру за бројеве од 1 до 9 (уместо 01 - 09).',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Једнократно додаје нерадне дане. Молимо Вас да користите једну цифру за бројеве од 1 до 9 (уместо 01 - 09).',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Трајно додаје нерадне дане за изабрани календар. Молимо Вас да користите једну цифру за бројеве од 1 до 9 (уместо 01 - 09).',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Трајно додаје нерадне дане. Молимо Вас да користите једну цифру за бројеве од 1 до 9 (уместо 01 - 09).',
        'Admin Area.' => 'Административни простор.',
        'After' => 'После',
        'Agent Name' => 'Име оператера',
        'Agent Name + FromSeparator + System Address Display Name' => 'Назив оператера + сепаратор „oд” + системска адреса за приказ',
        'Agent Preferences.' => 'Оператерска подешавања.',
        'Agent called customer.' => 'Оператер је позвао клијента',
        'Agent interface article notification module to check PGP.' => 'Модул интерфејса оператера за обавештавања о чланку за проверу „PGP”.',
        'Agent interface article notification module to check S/MIME.' =>
            'Модул интерфејса оператера за обавештавања о чланку, провера S/MIME',
        'Agent interface module to access CIC search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модул интерфејса оператера за приступ CIC претрази преко линије за навигацију. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”.',
        'Agent interface module to access fulltext search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модул интерфејса оператера за приступ текстуалној претрази преко линије за навигацију. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”.',
        'Agent interface module to access search profiles via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модул интерфејса оператера за приступ профилима претраживања преко линије за навигацију. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”.',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Модул интерфејса оператера за проверу долазних порука у увећаном прегледу тикета ако S/MIME-кључ постоји и доступан је.',
        'Agent interface notification module to see the number of locked tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модул интерфејса оператера за приказ броја закључаних тикета. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”.',
        'Agent interface notification module to see the number of tickets an agent is responsible for. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модул интерфејса оператера за приказ броја тикета за које је оператер одговоран. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”.',
        'Agent interface notification module to see the number of tickets in My Services. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модул интерфејса оператера за приказ броја тикета у Мојим услугама. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”.',
        'Agent interface notification module to see the number of watched tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модул интерфејса оператера за приказ броја праћених тикета. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”.',
        'AgentCustomerSearch' => 'Претрага корисника',
        'AgentCustomerSearch.' => 'Претрага корисника.',
        'AgentUserSearch' => 'Претрага оператера',
        'AgentUserSearch.' => 'Претрага оператера.',
        'Agents <-> Groups' => 'Оператери <-> Групе',
        'Agents <-> Roles' => 'Оператери <-> Улоге',
        'All customer users of a CustomerID' => 'Сви клијенти корисници за CustomerID',
        'Allows adding notes in the close ticket screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Дозвољава додавање напомена на екрану затварања тикета интерфејса оператера. „Ticket::Frontend::NeedAccountedTime” је може преписати.',
        'Allows adding notes in the ticket free text screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Дозвољава додавање напомена на екрану слободног текста тикета интерфејса оператера. „Ticket::Frontend::NeedAccountedTime” је може преписати.',
        'Allows adding notes in the ticket note screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Дозвољава додавање напомена на екрану напомене тикета интерфејса оператера. „Ticket::Frontend::NeedAccountedTime” је може преписати.',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Дозвољава додавање напомена на екрану власника тикета интерфејса оператера. „Ticket::Frontend::NeedAccountedTime” је може преписати.',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Дозвољава додавање напомена на екрану тикета на чекању интерфејса оператера. „Ticket::Frontend::NeedAccountedTime” је може преписати.',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Дозвољава додавање напомена на екрану приоритета детаљног приказа тикета интерфејса оператера. „Ticket::Frontend::NeedAccountedTime” је може преписати.',
        'Allows adding notes in the ticket responsible screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Дозвољава додавање напомена на екрану одговорног за тикет интерфејса оператера. „Ticket::Frontend::NeedAccountedTime” је може преписати.',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Дозвољава оператерима да замене осе на статистици ако је генеришу.',
        'Allows agents to generate individual-related stats.' => 'Дозвољава оператерима да генеришу индивидуалну статистику.',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Дозвољава избор између приказа прилога у претраживачу или само омогућавања његовог преузимања.',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Дозвољава избор следећег стања за клијентске тикете у клијентском интерфејсу.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Дозвољава клијентима да промене приоритет тикета у клијентском интерфејсу.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Дозвољава клијентима да подесе SLA за тикет у клијентском интерфејсу.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Дозвољава клијентима да подесе приоритет тикета у клијентском интерфејсу.',
        'Allows customers to set the ticket queue in the customer interface. If this is set to \'No\', QueueDefault should be configured.' =>
            'Дозвољава клијентима да подесе ред тикета у корисничком интерфејсу. Ако је подешено на „Не”, онда треба подесити QueueDefault.',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Дозвољава клијентима да подесе услугу за тикет у корисничком интерфејсу.',
        'Allows customers to set the ticket type in the customer interface. If this is set to \'No\', TicketTypeDefault should be configured.' =>
            'Дозвољава клијентима да подесе тип тикета у интерфејсу  корисника. Уколико је ово подешено на  \'Но\', треба конфигурисати TicketTypeDefault.',
        'Allows default services to be selected also for non existing customers.' =>
            'Дозвољава да подразумеване услуге буду изабране и за непостојеће клијенте.',
        'Allows defining new types for ticket (if ticket type feature is enabled).' =>
            'Дозвољава дефинисање новог типа тикета (ако је опција типа тикета активирана).',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Дозвољава дефинисање услуге и СЛА за тикете (нпр. имејл, радна површина, мрежа, ...), и ескалационе атрибуте за СЛА (ако је активирана функција услуга/СЛА за тикет).',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Омогућава напредне услове претраге тикета у интерфејсу оператера. Са овом опцијом моћете претраживати нпр. наслов тикета са условима као "(*key1*&&*key2*)" или "(*key1*||*key2*)".',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Омогућава напредне услове претраге тикета у интерфејсу корисника. Са овом опцијом моћете претраживати нпр. наслов тикета са условима као "(*key1*&&*key2*)" или "(*key1*||*key2*)".',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Дозвољава проширене услове претраге у претрази тикета на интерфејсу општег оператера. Помоћу ове функције можете вршити претраге нпр. са врстом услова као што су: „(key1&&key2)” или „(key1||key2)”.',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Дозвољава поседовање средњег формата прегледа тикета ( CustomerInfo => 1 - такође приказује информације о клијенту).',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Дозвољава поседовање малог формата прегледа тикета ( CustomerInfo => 1  - такође приказује информације о клијенту).',
        'Allows invalid agents to generate individual-related stats.' => 'Дозвољава неважећим оператерима да генеришу индивидуално повезане статистике.',
        'Allows the administrators to login as other customers, via the customer user administration panel.' =>
            'Дозвољава администраторима да приступе као други клијенти, кроз административни панел клијента корисника.',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Дозвољава администраторима да приступе као други корисници, кроз административни панел.',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Дозвољава подешавање статуса новог тикета на приказаном екрану помереног тикета у интерфејсу оператера.',
        'Always show RichText if available' => 'Увек прикажи „RichText” ако је доступан',
        'Arabic (Saudi Arabia)' => 'Арапски (Саудијска арабија)',
        'Archive state changed: "%s"' => 'Промењено стање архивирања: „%s”',
        'ArticleTree' => 'Чланак у облику дрвета',
        'Attachments <-> Templates' => 'Прилози <-> Шеме',
        'Auto Responses <-> Queues' => 'Аутоматски одговори <-> Редови',
        'AutoFollowUp sent to "%s".' => 'Аутоматски наставак за „%s”.',
        'AutoReject sent to "%s".' => 'Аутоматски одбијено „%s”.',
        'AutoReply sent to "%s".' => 'Послат аутоматски одговор за „%s”.',
        'Automated line break in text messages after x number of chars.' =>
            'Аутоматски крај реда у текстуалним порукама после х карактера.',
        'Automatically lock and set owner to current Agent after opening the move ticket screen of the agent interface.' =>
            'Аутоматско закључавање и подешавање власника на актуелног оператера после отварања прозора за премештање тикета у интерфејсу оператера.',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Аутоматско закључавање и подешавање власника на актуелног оператера после избора масовне акције.',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled). This will only work by manually actions of the logged in user. It does not work for automated actions e.g. GenericAgent, Postmaster and GenericInterface.' =>
            'Аутоматски подешава власника тикета као одговорног за њега (ако је фунција одговорног за тикет активирана). Ово фунционише само у ручним акцијама пријавњеног корисника. не важи за аутоматске акције, нпр општег оператера, „Postmaster” и општег интерфејса.',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Аутоматско подешавање одговорног за тикет (ако није до сада подешено) после првог ажурирања.',
        'Balanced white skin by Felix Niklas (slim version).' => 'Избалансирани бели изглед, Феликс Никлас (танка верзија).',
        'Balanced white skin by Felix Niklas.' => 'Избалансирани бели изглед, Феликс Никлас.',
        'Based on global RichText setting' => 'Базирано на глобалним „RichText” поставкама',
        'Basic fulltext index settings. Execute "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild" in order to generate a new index.' =>
            'Основн подешавање индекса целог текста. Изврши „bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild” како би се генерисао нови индекс.',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Блокира све долазне емаил-ове који немају исправан број тикета у предмету са Од: @example.com адресе.',
        'Bounced to "%s".' => 'Одбијено „%s”.',
        'Builds an article index right after the article\'s creation.' =>
            'Генерише индекс чланака одмах по креирању чланка.',
        'Bulgarian' => 'Бугарски',
        'CMD example setup. Ignores emails where external CMD returns some output on STDOUT (email will be piped into STDIN of some.bin).' =>
            'Пример подешавања CMD. Игнорише имејлове када екстерни CMD врати неке излазе на STDOUT (имејл ће бити каналисан у STDIN од some.bin).',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            'Време кеширања у секундама за аутентификације оператера у генеричком интерфејсу.',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            'Време кеширања у секундама за аутентификацију клијента у општем интерфејсу.',
        'Cache time in seconds for the DB ACL backend.' => 'Време кеширања у секундама за позадину ACL базе података.',
        'Cache time in seconds for the DB process backend.' => 'Време кеширања у секундама за позадински процес базе података.',
        'Cache time in seconds for the SSL certificate attributes.' => 'Време кеширања у секундама за SSL сертификоване атрибуте.',
        'Cache time in seconds for the ticket process navigation bar output module.' =>
            'Време кеширања у секундама за излазни модул навигационе траке процеса тикета',
        'Cache time in seconds for the web service config backend.' => 'Време кеширања у секундама за веб сервис конфигурације позадине.',
        'Catalan' => 'Каталонски',
        'Change password' => 'Промена лозинке',
        'Change queue!' => 'Промена реда!',
        'Change the customer for this ticket' => 'Промени клијента за овај тикет',
        'Change the free fields for this ticket' => 'Промени слободна поља овог тикета',
        'Change the priority for this ticket' => 'Промени приоритете за овај тикет.',
        'Change the responsible for this ticket' => 'Промени одговорног за овај тикет',
        'Changed priority from "%s" (%s) to "%s" (%s).' => 'Ажуриран приоритет са „%s” (%s) на „%s” (%s).',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Промени власника тикета за све (корисно за ASP). Обично се показује само агент са дозвлама за читање/писање у реду тикета.',
        'Checkbox' => 'Поље за потврду',
        'Checks if an E-Mail is a followup to an existing ticket by searching the subject for a valid ticket number.' =>
            'Проверава да ли је имејл настављање на постојећи тикета претрагом предмета важећих бројева тикета.',
        'Checks the SystemID in ticket number detection for follow-ups (use "No" if SystemID has been changed after using the system).' =>
            'Проверавање SystemID у детекцији броја тикета за праћења (користити „Не” уколико је SystemID промењен након коришћења система).',
        'Checks the availability of OTRS Business Solution™ for this system.' =>
            'Проверава доступност „OTRS” Пословног решења за овај систем.',
        'Checks the entitlement status of OTRS Business Solution™.' => 'Проверава стаус права коришћења „OTRS” Пословног решења.',
        'Chinese (Simplified)' => 'Кинески (упрошћено)',
        'Chinese (Traditional)' => 'Кинески (традиционално)',
        'Choose for which kind of ticket changes you want to receive notifications.' =>
            'Изабери за какве промене тикета желиш да примиш обавештења.',
        'Closed tickets (customer user)' => 'Затворени тикети (клијент корисник)',
        'Closed tickets (customer)' => 'Затворени тикети (клијент)',
        'Cloud Services' => 'Сервиси у облаку',
        'Cloud service admin module registration for the transport layer.' =>
            'Регистрација админ модула сервиса у облаку за транспортни слој.',
        'Collect support data for asynchronous plug-in modules.' => 'Прикупи податке подршке за асинхдоне прикључне модуле.',
        'Column ticket filters for Ticket Overviews type "Small".' => 'Филтери колона тикета за прегледе тикета типа „мало”.',
        'Columns that can be filtered in the escalation view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колоне које могу бити филтриране на приказу ескалација у интерфејсу оператера. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено. Напомена: Само атрибути тикета, Динамичка поља („DynamicField_NameX”) и Клијентски атрибути (нпр ТелефонКлијентаКорисника, НазивФирмеКлијента, ...) су дозвољени.',
        'Columns that can be filtered in the locked view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колоне које могу бити филтриране на приказу закључавања у интерфејсу оператера. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено. Напомена: Само атрибути тикета, Динамичка поља („DynamicField_NameX”) и Клијентски атрибути (нпр ТелефонКлијентаКорисника, НазивФирмеКлијента, ...) су дозвољени.',
        'Columns that can be filtered in the queue view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колоне које могу бити филтриране на приказу реда у интерфејсу оператера. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено. Напомена: Само атрибути тикета, Динамичка поља („DynamicField_NameX”) и Клијентски атрибути (нпр ТелефонКлијентаКорисника, НазивФирмеКлијента, ...) су дозвољени.',
        'Columns that can be filtered in the responsible view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колоне које могу бити филтриране на приказу одговорности у интерфејсу оператера. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено. Напомена: Само атрибути тикета, Динамичка поља („DynamicField_NameX”) и Клијентски атрибути (нпр ТелефонКлијентаКорисника, НазивФирмеКлијента, ...) су дозвољени.',
        'Columns that can be filtered in the service view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колоне које могу бити филтриране на приказу сервиса у интерфејсу оператера. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено. Напомена: Само атрибути тикета, Динамичка поља („DynamicField_NameX”) и Клијентски атрибути (нпр ТелефонКлијентаКорисника, НазивФирмеКлијента, ...) су дозвољени.',
        'Columns that can be filtered in the status view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колоне које могу бити филтриране на приказу статуса у интерфејсу оператера. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено. Напомена: Само атрибути тикета, Динамичка поља („DynamicField_NameX”) и Клијентски атрибути (нпр ТелефонКлијентаКорисника, НазивФирмеКлијента, ...) су дозвољени.',
        'Columns that can be filtered in the ticket search result view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колоне које могу бити филтриране на приказу резултата претраге у интерфејсу оператера. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено. Напомена: Само атрибути тикета, Динамичка поља („DynamicField_NameX”) и Клијентски атрибути (нпр ТелефонКлијентаКорисника, НазивФирмеКлијента, ...) су дозвољени.',
        'Columns that can be filtered in the watch view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колоне које могу бити филтриране на приказу надзора у интерфејсу оператера. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено. Напомена: Само атрибути тикета, Динамичка поља („DynamicField_NameX”) и Клијентски атрибути (нпр ТелефонКлијентаКорисника, НазивФирмеКлијента, ...) су дозвољени.',
        'Comment for new history entries in the customer interface.' => 'Коментар за нове ставке историје у клијентском интерфејсу.',
        'Comment2' => 'Коментар 2',
        'Communication' => 'Комуникација',
        'Company Status' => 'Статус фирме',
        'Company Tickets.' => 'Тикети фирми.',
        'Company name which will be included in outgoing emails as an X-Header.' =>
            'Назив фирме који ће бити укључен у одлазне имејлове као X-Заглавље.',
        'Compat module for AgentZoom to AgentTicketZoom.' => 'Модул компатибилности за AgentZoom у AgentTicketZoom.',
        'Complex' => 'Сложено',
        'Configure Processes.' => 'Конфигуриши процесе.',
        'Configure and manage ACLs.' => 'Конфигуриши и управљај ACL листама.',
        'Configure any additional readonly mirror databases that you want to use.' =>
            'Конфигурише било коју додатну пресликану базу података, коју желите да користите, само за читање.',
        'Configure sending of support data to OTRS Group for improved support.' =>
            'Подешавање слања података за подршку за „OTRS Group” ради унапређења подршке.',
        'Configure which screen should be shown after a new ticket has been created.' =>
            'Конфигурише који екран би требало приказати након креирања новог тикета.',
        'Configure your own log text for PGP.' => 'Конфигуриши сопствени лог текст за „PGP”.',
        'Configures a default TicketDynamicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (http://otrs.github.io/doc/), chapter "Ticket Event Module".' =>
            'Конфигурише подразумевана подешавања динамичког поља тикета. „Name” дефинише динамичко поље које ће бити коришћено, „Value” је податак који ће бити подешен, а „Event” дефинише окидач догађаја. Молимо консултујте упутство за програмере (http://otrs.github.io/doc/), поглавље "Модул догађаја тикета".',
        'Controls how to display the ticket history entries as readable values.' =>
            'Контролише начин приказа историјских уноса тикета као читљивих вредности. ',
        'Controls if CustomerID is automatically copied from the sender address for unknown customers.' =>
            'Контролише да ли се ИД клијента аутоматски поставља на адресу пошиљаоца за непознате кориснике.',
        'Controls if CustomerID is read-only in the agent interface.' => 'Контролише да ли се ИД клијента може само прегледати у интерфејсу оператера.',
        'Controls if customers have the ability to sort their tickets.' =>
            'Контролише да ли клијенти имају могућност да сортирају своје тикете.',
        'Controls if more than one from entry can be set in the new phone ticket in the agent interface.' =>
            'Контролише да ли више од једног улаза може бити подешено у новом телефонском тикету у интерфејсу оператера.',
        'Controls if the admin is allowed to import a saved system configuration in SysConfig.' =>
            'Контролише да ли је администратору дозвољено да увезе сачувану системску конфигурацију у „SysConfig”.',
        'Controls if the admin is allowed to make changes to the database via AdminSelectBox.' =>
            'Контролише да ли је администратору дозвољено да направи иземене у бази података преко Административног оквира за избор.',
        'Controls if the ticket and article seen flags are removed when a ticket is archived.' =>
            'Контролише да ли су заставицом обележени тикет и чланак уклоњени када је тикет архивиран.',
        'Converts HTML mails into text messages.' => 'Конвертује HTML поруке у текстуалне поруке.',
        'Create New process ticket.' => 'Креирај нови процес тикет',
        'Create and manage Service Level Agreements (SLAs).' => 'Креира и управља Споразуме о нивоу услуга (СЛА)',
        'Create and manage agents.' => 'Креирање и управљање оператерима.',
        'Create and manage attachments.' => 'Креирање и управљање прилозима.',
        'Create and manage customer users.' => 'Креирање и управљање клијентима корисницима.',
        'Create and manage customers.' => 'Креирање и управљање клијентима.',
        'Create and manage dynamic fields.' => 'Креирање и управљање динамичким пољима.',
        'Create and manage groups.' => 'Креирање и управљање групама.',
        'Create and manage queues.' => 'Креирање и управљање редовима.',
        'Create and manage responses that are automatically sent.' => 'Креирање и управљање аутоматским одговорима.',
        'Create and manage roles.' => 'Креирање и управљање улогама.',
        'Create and manage salutations.' => 'Креирање и управљање поздравима.',
        'Create and manage services.' => 'Креирање и управљање услугама.',
        'Create and manage signatures.' => 'Креирање и управљање потписима.',
        'Create and manage templates.' => 'Креирање и управљање шаблонима.',
        'Create and manage ticket notifications.' => 'Креирање и управљање обавештењима за тикете.',
        'Create and manage ticket priorities.' => 'Креирање и управљање приоритетима тикета.',
        'Create and manage ticket states.' => 'Креирање и управљање статусима тикета.',
        'Create and manage ticket types.' => 'Креирање и управљање типовима тикета.',
        'Create and manage web services.' => 'Креирање и управљање веб сервисима.',
        'Create new Ticket.' => 'Креирање новог тикета.',
        'Create new email ticket and send this out (outbound).' => 'Отвори нови имејл тикет и пошаљи ово (одлазни).',
        'Create new email ticket.' => 'Креирање новог Имејл тикета.',
        'Create new phone ticket (inbound).' => 'Креирај нови телефонски тикет (долазни позив).',
        'Create new phone ticket.' => 'Креирање новог телефонског тикета.',
        'Create new process ticket.' => 'Креирај нови процес тикет.',
        'Create tickets.' => 'Креирање тикета.',
        'Croatian' => 'Хрватски',
        'Custom RSS Feed' => 'Прилагођени RSS извор',
        'Custom text for the page shown to customers that have no tickets yet (if you need those text translated add them to a custom translation module).' =>
            'Прилагођен текст за страницу која се приказује клијентима који још увек немају тикете (ако вам је тај текст потребан на другом језику, додајте га у прилагођен модул за преводе).',
        'Customer Administration' => 'Администрација клијената',
        'Customer Information Center Search.' => 'Претрага клијентског информативног центра.',
        'Customer Information Center.' => 'Клијентски информативни центар.',
        'Customer Ticket Print Module.' => 'Модул за штампу тикета у интерфејсу клијента.',
        'Customer User <-> Groups' => 'Клијент корисник <-> Групе',
        'Customer User <-> Services' => 'Клијент корисник <-> Услуге',
        'Customer User Administration' => 'Администрација клијента корисника',
        'Customer Users' => 'Клијенти корисници',
        'Customer called us.' => 'Клијент нас је позвао.',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Клијентска ставка (икона) која показује затворене тикете овог клијента као инфо блок. Подешавање Пријаве клијента корисника “CustomerUserLogin“ на 1 претрагу тикета заснива више на пријави имена него на ИД клијента.',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Клијентска ставка (икона) која показује отворене тикете овог клијента као инфо блок. Подешавање Пријаве клијента корисника “CustomerUserLogin“ на 1 претрагу тикета заснива више на пријави имена него на ИД клијента.',
        'Customer preferences.' => 'Клијентске поставке.',
        'Customer request via web.' => 'Клијентски веб захтев.',
        'Customer ticket overview' => 'Клијентски преглед тикета',
        'Customer ticket search.' => 'Клијентска претрага тикета.',
        'Customer ticket zoom' => 'Клијентски детаљни преглед тикета',
        'Customer user search' => 'Претрага клијената корисника',
        'CustomerID search' => 'Претрага ИД клијената',
        'CustomerName' => 'Назив клијента',
        'CustomerUser' => 'Клијент корисник',
        'Customers <-> Groups' => 'Клијенти <-> Групе',
        'Customizable stop words for fulltext index. These words will be removed from the search index.' =>
            'Подесиве зауставне речи за индекс комплетног текста. Ове речи ће бити уклоњене из индекса претраге.',
        'Czech' => 'Чешки',
        'Danish' => 'Дански',
        'Data used to export the search result in CSV format.' => 'Подаци употребљени за ивоз резултата претраживања у CSV формату.',
        'Date / Time' => 'Датум / Време',
        'Debug' => 'Отклањање неисправности',
        'Debugs the translation set. If this is set to "Yes" all strings (text) without translations are written to STDERR. This can be helpful when you are creating a new translation file. Otherwise, this option should remain set to "No".' =>
            'Уклањање грешака комплета превода. Ако је ово подешено на „Да” целокупан низ знакова (текст) ће без превода бити уписан у STDERR. Ово може бити од помоћи приликом креирања нове датотеке превода. У супротном, ова опција би требала да остане подешена на „Не”.',
        'Default' => 'Подразумевано',
        'Default (Slim)' => 'Подразумевано (упрошћено)',
        'Default ACL values for ticket actions.' => 'Подразумеване ACL вредности за акције тикета.',
        'Default ProcessManagement entity prefixes for entity IDs that are automatically generated.' =>
            'Подразумевани префикси објекта за управљање процесом за ИЂеве објекта који су аутоматски генерисани.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            'Подразумевани подаци за коришћење на атрибутима за приказ претраге тикета. Пример: „TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;”.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            'Подразумевани подаци за коришћење на атрибутима за приказ претраге тикета. Пример: „TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;”.',
        'Default display type for recipient (To,Cc) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Подразумевани тип приказа за имена примаоца (To,Cc) на детаљном приказу тикета у интерфејсу оператара и клијента.',
        'Default display type for sender (From) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Подразумевани тип приказа за имена (Од) пошиљаоца на детаљном приказу тикета у интерфејсу оператера и клијента.',
        'Default loop protection module.' => 'Подразумевани модул заштите од петље.',
        'Default queue ID used by the system in the agent interface.' => 'Подразумевани ИД реда који користи систем у интерфејсу оператера.',
        'Default skin for the agent interface (slim version).' => 'Подразумевани изглед окружења за интерфејс оператера (слаба верзија).',
        'Default skin for the agent interface.' => 'Подразумевани изглед окружења за интерфејс оператера.',
        'Default skin for the customer interface.' => 'Подразумевани изглед окружења за интерфејс клијента.',
        'Default ticket ID used by the system in the agent interface.' =>
            'Подразумевани ИД тикета који користи систем у интерфејсу оператера.',
        'Default ticket ID used by the system in the customer interface.' =>
            'Подразумевани ИД тикета који користи систем у клијентском интерфејсу.',
        'Default value for NameX' => 'Подразумевана вредност за ИмеХ',
        'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.' =>
            'Дефинише акције на којима је омогућен приказ дугмета за подешавање у апликативном додатку линкованих објеката (LinkObject::ViewMode = „complex”). Напомињемо да ове акције морају имати регистроване следеће JS и CSS датотеке: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Дефиниши филтер за html излаз да би додали везе иза дефинисаног низа знакова. Елемент Слика дозвољава два начина улаза. У једном назив слике (нпр. faq.png). У том случају биће коришћена „OTRS” путања слике. Други начин је уношење везе до слике.',
        'Define a mapping between variables of the customer user data (keys) and dynamic fields of a ticket (values). The purpose is to store customer user data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the next setting below.' =>
            'Дефинисање мапирања између променљивих: података клијента корисника (кључеви) и динамичких поља тикета (вредности). Циљ је да се сачувају подаци клијента корисника у динамичком пољу тикета. Динамичка поља морају бити присутна у систему и треба да буду омогућена за  AgentTicketFreeText, тако да могу да буду мануелно подешена/ажурирана од стране оператера. Она не смеју бити омогућена за AgentTicketPhone, AgentTicketEmail и AgentTicketCustomer. Да су била, она би имала предност над аутоматски постављеним вредностима. За коришћење овог мапирања треба, такође, да активирате следећа подешавања.',
        'Define dynamic field name for end time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Дефинишe назив динамичког поља за крајње време. Ово поље мора бити мануелно додато систему као тикет: „Датум / Време” и мора бити активиранo у екранима за креирање тикета и/или у било ком другом екрану са тикет акцијама.',
        'Define dynamic field name for start time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Дефинише назив динамичког поља за почетно време. Ово поље мора бити мануелно додато систему као тикет: „Датум / Време” и мора бити активирано у екранима за креирање тикета и/или у било ком другом екрану са тикет акцијама.',
        'Define the max depth of queues.' => 'Дефиниши максималну дубину за редове.',
        'Define the queue comment 2.' => 'Дефинише коментар реда 2.',
        'Define the service comment 2.' => 'Дефинише сервисни коментар 2.',
        'Define the sla comment 2.' => 'Дефинише sla коментар 2.',
        'Define the start day of the week for the date picker for the indicated calendar.' =>
            'Дефиниши први дан у недељи за избор датума за наведени календар.',
        'Define the start day of the week for the date picker.' => 'Дефиниши први дан у недељи за избор датума.',
        'Define which columns are shown in the linked tickets widget (LinkObject::ViewMode = "complex"). Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Дефинише које колоне ће бити приказане у апликативном додатку линкованих тикета (LinkObject::ViewMode = „complex”). Напомена: само атрибути тикета и динамичка поља (DynamicField_NameX) су дозвољена за подразумеване колоне. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Подразумевано омогућено.',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Дефиниши ставку клијента, која генерише LinkedIn икону на крају инфо блока клијента.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Дефинишие ставку клијента, која генерише XING икону на крају инфо блока клијента.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Дефинише ставку која генерише Google иконицу на крају инфо блока клијента.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Дефинише ставку која генерише Google Maps иконицу на крају инфо блока клијента.',
        'Defines a default list of words, that are ignored by the spell checker.' =>
            'Дефинише подразумевану листу речи, које су игнорисане од стране провере правописа.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Дефинише филтер за html излаз да би сте додали везе иза CVE бројева. Елемент Слика дозвољава два начина улаза. У једном назив слике (нпр. faq.png). И том случају биће коришћена „OTRS” путања слике. Други начин је уношење везе до слике.',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Дефинише филтер за html излаз да би сте додали везе иза Microsoft знакова за набрајање или бројева Елемент Слика дозвољава два начина улаза. У једном назив слике (нпр. faq.png). И том случају биће коришћена „OTRS” путања слике. Други начин је уношење везе до слике.',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Дефинише филтер за html излаз да би сте додали везе иза дефинисаног низа знакова. Елемент Слика дозвољава два начина улаза. У једном назив слике (нпр. faq.png). И том случају биће коришћена „OTRS” путања слике. Други начин је уношење везе до слике.',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Дефинише филтер за HTML излаз да би сте додали везе иза „bugtraq” бројева. Елемент Image дозвољава два начина улаза. У једном назив слике (нпр. faq.png). И том случају биће коришћена „OTRS” путања слике. Други начин је уношење путање до слике.',
        'Defines a filter to collect CVE numbers from article texts in AgentTicketZoom. The results will be displayed in a meta box next to the article. Fill in URLPreview if you would like to see a preview when moving your mouse cursor above the link element. This could be the same URL as in URL, but also an alternate one. Please note that some websites deny being displayed within an iframe (e.g. Google) and thus won\'t work with the preview mode.' =>
            'Дефинише филтер за прикупљање CVE бројева из текста чланка у AgentTicketZoom. Резултати ће бити приказани у прозорчету поред чланка. Подесите URLPreview уколико желите да видите приказ стране приликом преласка курсором преко елемента везе. Ова адреса може бити иста као и за URL, али и другачија. Напомињемо да неке локације одбијају да буду приказане у IFRAME (нпр. Гугл) и зато приказ неће радити.',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            'Дефинише филтер за обраду текста у чланцима, да би се истакле унапред дефинисане кључне речи.',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            'Дефинише регуларни израз који искључује неке адресе из провере синтаксе (ако је „CheckEmailAddresses” постављена на „Да”). Молимо вас унесите регуларни израз у ово поље за имејл адресе, који нису синтаксно исправне, али су неопходне за систем (нпр. „root@localhost”).',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            'Definiše regularni izraz koji kiltrira sve email adrese koje ne bi smele da se koriste u aplikaciji.',
        'Defines a sleep time in microseconds between tickets while they are been processed by a job.' =>
            'Дефинише време спавања у микросекундама између тикета док се обрађују од стране посла.',
        'Defines a useful module to load specific user options or to display news.' =>
            'Дефинише користан модул за учитавање одређених корисничких опција или за приказивање новости.',
        'Defines all the X-headers that should be scanned.' => 'Дефинише сва Х-заглавља која треба скенирати.',
        'Defines all the languages that are available to the application. Specify only English names of languages here.' =>
            'Дефинише све језике који су доступни апликацији. Овде унесите имена језика само на енглеском.',
        'Defines all the languages that are available to the application. Specify only native names of languages here.' =>
            'Дефинише све језике који су доступни апликацији. Овде унесите имена језика само на матичном језику.',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            'Дефинише све параметре за RefreshTime објекат у поставкама у интерфејсу клијента.',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            'Дефинише све параметре за ShownTickets објекат у поставкама интерфејсу клијента.',
        'Defines all the parameters for this item in the customer preferences.' =>
            'Дефинише све параметре за ову ставку у подешавањима клијента.',
        'Defines all the parameters for this item in the customer preferences. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control).' =>
            'Дефинише све параметре за ову ставку у подешавањима клијента. PasswordRegExp омогућава проверу лозинке путем регуларног израза. Дефинишите минимални број карактера путем PasswordMinSize. Дефинишите најмање 2 мала и 2 велика слова тако што ћете подесити одговарајућу опцију на 1. PasswordMin2Characters дефинише да ли лозинка мора да садржи најмање два слова (0 или 1). PasswordNeedDigit контролише потребу за најмање једном цифром (0 или 1).',
        'Defines all the parameters for this notification transport.' => 'Дефинише све параметре за овај транспорт обавештења.',
        'Defines all the possible stats output formats.' => 'Дефинише све могуће излазне формате статистике.',
        'Defines an alternate URL, where the login link refers to.' => 'Дефинише алтернативну URL адресу, на коју указује веза за пријављивање.',
        'Defines an alternate URL, where the logout link refers to.' => 'Одређује алтернативну URL адресу, на коју указује веза за одављивање.',
        'Defines an alternate login URL for the customer panel..' => 'Одређује алтернативну URL адресу пријављивања за клијентски панел.',
        'Defines an alternate logout URL for the customer panel.' => 'Одређује алтернативну URL адресу одјављивања за клијентски панел.',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').' =>
            'Одређује спољашњу везу за базу података клијента (нпр „http://yourhost/customer.php?CID=[% Data.CustomerID %]” или „”).',
        'Defines from which ticket attributes the agent can select the result order.' =>
            'Дефинише из ког атрибута тикета оператер може да изабере редослед резултата.',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'Дефинише како поље Од у имејл порукама (послато из одговора и имејл тикета) треба да изгледа.',
        'Defines if a pre-sorting by priority should be done in the queue view.' =>
            'Одређује ако претходно сортирање по приоритету треба да се уради у приказу реда.',
        'Defines if a pre-sorting by priority should be done in the service view.' =>
            'Одређује да ли претходно сортирање по приоритету треба да се уради у сервисном приказу.',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет у затвореном приказу екрана тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the email outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Дефинише да ли је потребно закључати тикет на приказу екрана за тикет одлазних имејлова у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана за повраћај тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана за отварање тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана за прослеђивање тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана слободног текста тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана за спајање тикета при увећаном приказу тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана за напомену тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана власника тикета при увећаном приказу тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана тикета на чекању при увећаном приказу тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана за тикет долазних телефонских позива у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана за тикет одлазних телефонских позива у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана приоритетног тикета при увећаном приказу тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује ако је потребно закључати тикет на приказу екрана одговорног тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Одређује да ли је потребно закључати тикет да би променили клијента на тикету у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).',
        'Defines if agents should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Дефинише да ли ће оператерима бити дозвољена пријава на систем уколико немају подешен дељени тајни кључ и тиме не користе двофакторски модул за идентификацију.',
        'Defines if composed messages have to be spell checked in the agent interface.' =>
            'Одређује да ли порукама написаним у интерфејсу оператера треба урадити проверу правописа.',
        'Defines if customers should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Дефинише да ли ће клијентима бити дозвољена пријава на систем уколико немају подешен дељени тајни кључ и тиме не користе двофакторски модул за идентификацију.',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.) in customer interface.' =>
            'Дефинише да ли ће се користити побољшани режим (омогућава коришћење табела, замене, индексирања, експонирања, уметања из Word-a, итд) у интерфејсу клијента.',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.).' =>
            'Određuje da li treba da se koristi poboljšani režim (omogućava korišćenje tabele, zamene, indeksiranja, eksponiranja, umetanja iz Word-a, itd.).',
        'Defines if the previously valid token should be accepted for authentication. This is slightly less secure but gives users 30 seconds more time to enter their one-time password.' =>
            'Одређује да ли за аутентификацију треба да буде прихваћен токен који је раније био важећи. Ово је мало мање безбедно али кориснику даје 30 секунди више времена да унесе своју једнократну лозинку.',
        'Defines if the values for filters should be retrieved from all available tickets. If set to "Yes", only values which are actually used in any ticket will be available for filtering. Please note: The list of customers will always be retrieved like this.' =>
            'Дефинише да ли ће вредности филтера бити прибављене од свих доступних тикета. Уколико је подешено на „Да”, само вредности које се иначе користе у било ком тикету ће бити доступне као филтер. Напомињемо да ће листа корисника увек бити приказана на овај начин.',
        'Defines if time accounting is mandatory in the agent interface. If activated, a note must be entered for all ticket actions (no matter if the note itself is configured as active or is originally mandatory for the individual ticket action screen).' =>
            'Дефинише да ли је обрачун времена обавезан у интерфејсу оператера. Ако је активирано, за све акције на тикетима се мора унети напомена (без обзира да ли је сама напомена конфигурисана као активна или је у оргиналу обавезна на екрану индивидуалне акције на тикету).',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            'Одређује да ли обрачун времена мора бити подешен на свим тикетима у масовним акцијама.',
        'Defines out of office message template. Two string parameters (%s) available: end date and number of days left.' =>
            'Дефинише шаблон поруке „ван канцеларије”. Два параметра знаковних низова (%s) су расположива: датум завршетка и број преосталих дана.',
        'Defines queues that\'s tickets are used for displaying as calendar events.' =>
            'Дефинише редове које користе тикети за приказивање у виду календарских догађаја.',
        'Defines the HTTP hostname for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the OTRS Daemon).' =>
            'Дефинише HTTP хост за слање података подршке преко јавног модуле \'PublicSupportDataCollector\' (нпр. од стране OTRS системског сервиса).',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            'Дефинише регуларни израз за IP адресу за приступ локалном спремишту. Потребно је да им омогућите приступ вашем локалном спремишту и паковању: :RepositoryList се захтева на удаљеном host-у',
        'Defines the URL CSS path.' => 'Дефинише URL CSS путању.',
        'Defines the URL base path of icons, CSS and Java Script.' => 'Дефинише URL основну путању за иконе, CSS и Java Script.',
        'Defines the URL image path of icons for navigation.' => 'Дефинише URL путању до слика за навигационе иконе.',
        'Defines the URL java script path.' => 'Дефинише URL путању java скриптова.',
        'Defines the URL rich text editor path.' => 'Дефинише URL Reach Text Editor путању.',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            'Дефинише адресе наменског DNS сервера, уколико је потребно, за „CheckMXRecord” претраге.',
        'Defines the agent preferences key where the shared secret key is stored.' =>
            'Одређује кључ оператерских подешавања где се смешта дељени тајни кључ.',
        'Defines the body text for notification mails sent to agents, about new password (after using this link the new password will be sent).' =>
            'Дефинише тело текста за обавештења о новој лозинки, послата оператерима путем имејлова (нова лозинка ће бити послата после коришћења ове везе).',
        'Defines the body text for notification mails sent to agents, with token about new requested password (after using this link the new password will be sent).' =>
            'Дефинише тело текста за обавештења послата оператерима путем имејлова, са токеном у вези нове захтеване лозинке (нова лозинка ће бити послата после коришћења ове везе).',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            'Одређује садржај текста за обавештења послата клијентима путем имејлова, о новом налогу.',
        'Defines the body text for notification mails sent to customers, about new password (after using this link the new password will be sent).' =>
            'Одређује садржај текста за обавештења послата клијентима путем имејлова, о новој лозинки (нова лозинка ће бити послата после коришћења ове везе).',
        'Defines the body text for notification mails sent to customers, with token about new requested password (after using this link the new password will be sent).' =>
            'Одређује садржај текста за обавештења послата клијентима путем имејлова, са токеном у вези нове захтеване лозинке (нова лозинка ће бити послата после коришћења ове везе).',
        'Defines the body text for rejected emails.' => 'Дефинише садржај текста за одбачене поруке.',
        'Defines the calendar width in percent. Default is 95%.' => 'Дефинише ширину календара у процентима. Подразумевано је 95%.',
        'Defines the cluster node identifier. This is only used in cluster configurations where there is more than one OTRS frontend system. Note: only values from 1 to 99 are allowed.' =>
            'Одређује идентификатор чвора кластера. Ово се користи само у кластер конфигурацијама где постоји више од једног „OTRS” приступног система. Напомена: дозвољене су само вредности ос 1 до 99.',
        'Defines the column to store the keys for the preferences table.' =>
            'Дефинише колону за чување кључева табеле подешавања.',
        'Defines the config options for the autocompletion feature.' => 'Дефинише конфигурационе опције за функцију аутоматског довршавања.',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            'Дефинише конфигурационе параметре за ову ставку, да буду приказани у приказу подешавања.',
        'Defines the config parameters of this item, to be shown in the preferences view. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control). \'PasswordMaxLoginFailed\' allows to set an agent to invalid-temporarily if max failed logins reached.' =>
            'Одређује све параметре за ову ставку у подешавањима оператера. PasswordRegExp омогућава проверу лозинке путем регуларног израза. Дефинишите минимални број карактера путем PasswordMinSize. Дефинишите најмање 2 мала и 2 велика слова тако што ћете подесити одговарајућу опцију на 1. PasswordMin2Characters дефинише да ли лозинка мора да садржи најмање два слова (0 или 1). PasswordNeedDigit контролише потребу за најмање једном цифром (0 или 1). PasswordMaxLoginFailed дозвољава аутоматско проглашавање статуса оператера као неважећи-привремено, уколико је достигнут максимални број неуспешних логовања.',
        'Defines the config parameters of this item, to be shown in the preferences view. Take care to maintain the dictionaries installed in the system in the data section.' =>
            'Дефинише конфигурационе параметре за ову ставку, да буду приказани у приказу подешавања. Водити рачуна о одржавању речника инсталираних у систему у секцији података.',
        'Defines the connections for http/ftp, via a proxy.' => 'Дефинише конекције за http/ftp преко посредника.',
        'Defines the customer preferences key where the shared secret key is stored.' =>
            'Одређује кључ клијентских подешавања где се смешта дељени тајни кључ.',
        'Defines the date input format used in forms (option or input fields).' =>
            'Дефинише форноса датума у формуларе (опционо или поља за унос).',
        'Defines the default CSS used in rich text editors.' => 'Дефинише подразумевани CSS употребљен у RTF уређивању.',
        'Defines the default auto response type of the article for this operation.' =>
            'Дефинише подразумевани тип аутоматског одговора чланка за ову операцију.',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            'Дефинише тело напомене на приказу екрана слободног текста тикета у интерфејсу оператера.',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at http://otrs.github.io/doc/.' =>
            'Дефинише подразумевану корисничку (HTML) тему за оператере и клијенте. Уколико желите, можете додати сопствену тему. Молимо консултујте упутство за администраторе на http://otrs.github.io/doc/.',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            'Дефинише подразумевани језик главног корисничког дела. Све могуће вредности су одређене у расположивим језичким датотекама у систему (погледајте следећа подешавања).',
        'Defines the default history type in the customer interface.' => 'Одређује подразумевани тип историје у интерфејсу клијента.',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            'Дефинише подразумевани максимални број атрибута на Х-оси временске скале.',
        'Defines the default maximum number of statistics per page on the overview screen.' =>
            'Дефинише подразумевани максимални број резултата статистике по страни на екрану прегледа.',
        'Defines the default next state for a ticket after customer follow-up in the customer interface.' =>
            'Дефинише подразумевани следећи статус тикета након клијентовог настављања тикета у интерфејсу клијента.',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања напомене у приказу екрана затвореног тикета у интерфејсу оператера.',
        'Defines the default next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања напомене у приказу екрана масовних тикета у интерфејсу оператера.',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања напомене у приказу екрана тикета слободног текста у интерфејсу оператера.',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања напомене у приказу екрана напомене тикета у интерфејсу оператера.',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања напомене у приказу екрана власника тикета, при увећаном приказу тикета, у интерфејсу оператера.',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања напомене у приказу екрана тикета на чекању, при увећаном приказу тикета, у интерфејсу оператера.',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања напомене у приказу екрана приоритног тикета, при увећаном приказу тикета, у интерфејсу оператера.',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања напомене у приказу екрана одговорног тикета у интерфејсу оператера.',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања напомене у приказу екрана за повраћај тикета у интерфејсу оператера.',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања напомене у приказу екрана за прослеђивање тикета у интерфејсу оператера.',
        'Defines the default next state of a ticket after the message has been sent, in the email outbound screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после слања поруке, на екрану одлазних имејлова у интерфејсу оператера.',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета уколико је састављено / одговорено у приказу екрана за отварање тикета у интерфејсу оператера.',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус телефонских тикета у приказу екрана тикета за долазне телефонске позиве у интерфејсу оператера.',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус телефонских тикета у приказу екрана тикета за одлазне телефонске позиве у интерфејсу оператера.',
        'Defines the default priority of follow-up customer tickets in the ticket zoom screen in the customer interface.' =>
            'Дефинише подразумевани приоритет тикета клијента за настављање на екрану детаљног приказа тикета у интерфејсу  клијента.',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            'Одређује подразумевани приоритет за нове клијентске тикете у интерфејсу клијента.',
        'Defines the default priority of new tickets.' => 'Одређује подразумевани приоритет за нове тикете.',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            'Одређује подразумевани ред за нове клијентске тикете у интерфејсу клијента.',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            'Дефинише подразумевани избор из падајућег менија за динамичке објекте (Од: Заједничка спецификација).',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            'Дефинише подразумевани избор из падајућег менија за дозволе (Од: Заједничка спецификација).',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            'Дефинише подразумевани избор из падајућег менија за статус формата (Од: Заједничка спецификација). Молимо вас да убаците кључ формата (види статистика :: Format).',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Дефинише подразумевани тип пошиљаоца за телефонске тикете на приказу екрана за тикет долазних телефонских позива у интерфејсу оператера.',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Дефинише подразумевани тип пошиљаоца за телефонске тикете на приказу екрана за тикет одлазних телефонских позива у интерфејсу оператера.',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            'Одређује подразумевани тип пошиљаоца за тикете на детаљном приказу екрана тикета у интерфејсу клијента.',
        'Defines the default shown ticket search attribute for ticket search screen (AllTickets/ArchivedTickets/NotArchivedTickets).' =>
            'Дефинише подразумевани приказ претраге атрибута тикета за приказ екрана претраге тикета (Сви тикети/Архивирани тикети/Неархивирани тикети).',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            'Дефинише подразумевани приказ претраге атрибута тикета за приказ екрана претраге тикета.',
        'Defines the default shown ticket search attribute for ticket search screen. Example: "Key" must have the name of the Dynamic Field in this case \'X\', "Content" must have the value of the Dynamic Field depending on the Dynamic Field type,  Text: \'a text\', Dropdown: \'1\', Date/Time: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' and or \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.' =>
            'Дефинише подразумевани приказ претраге атрибута тикета за приказ екрана претраге тикета. Пример: „Key” мора имати назив динамичког поља, у овом случају \'X\', „Content” мора имати вредност динамичког поља у зависности од типа динамичког поља, Текст: \'a text\', Падајући: \'1\', Датум/Време: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' и/или \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.',
        'Defines the default sort criteria for all queues displayed in the queue view.' =>
            'Одређује подразумевани критеријум сортирања за све редове приказане у прегледу реда.',
        'Defines the default sort criteria for all services displayed in the service view.' =>
            'Дефинише подразумевани критеријум сортирања за све сервисе приказане у сервисном прегледу.',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            'Одређује подразумевани редослед сортирања за све редове приказане у приказу реда, након сортирања по приоритету.',
        'Defines the default sort order for all services in the service view, after priority sort.' =>
            'Дефинише подразумевани критеријум сортирања за све сервисе у сервисном прегледу, после  сортирања по приориту.',
        'Defines the default spell checker dictionary.' => 'Одређује подразумевани речник за проверу правописа.',
        'Defines the default state of new customer tickets in the customer interface.' =>
            'Одређује подразумевани статус тикета новог клијента у интерфејсу клијента.',
        'Defines the default state of new tickets.' => 'Одређује подразумевани статус нових тикета.',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Дефинише подразумевани предмет за телефонске тикете на приказу екрана за тикет долазних телефонских позива у интерфејсу оператера.',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Дефинише подразумевани предмет за телефонске тикете на приказу екрана за тикет одлазних телефонских позива у интерфејсу оператера.',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            'Дефинише подразумевани предмет напомене за приказ екрана тикета слободног текста у интерфејсу оператера.',
        'Defines the default the number of seconds (from current time) to re-schedule a generic interface failed task.' =>
            'Дефинише подразумевани број секунди (од садашњег момента) до поновног распореда неуспешног задатка у општем интерфејсу.',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            'Одређује подразумевани атрибут тикета за сортирање тикета у претрази тикета у интерфејсу клијента.',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            'Дефинише подразумевани атрибут тикета за сортирање тикета у ескалационом прегледу интерфејса оператера.',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            'Дефинише подразумевани атрибут тикета за сортирање тикета у прегледу закључаног тикета интерфејса оператера.',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            'Дефинише подразумевани атрибут тикета за сортирање тикета у одговорном прегледу интерфејса оператера.',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            'Дефинише подразумевани атрибут тикета за сортирање тикета у прегледу статуса интерфејса оператера.',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            'Дефинише подразумевани атрибут тикета за сортирање тикета у посматраном прегледу интерфејса оператера.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            'Дефинише подразумевани атрибут тикета за сортирање тикета у резултату претраге тикета интерфејса оператера.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of this operation.' =>
            'Дефинише подразумевани атрибут тикета за сортирање тикета у резултату претраге тикета у овој операцији.',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            'Одређује подразумевану напомену повратног тикета за  клијента/пошиљаоца на приказу екрана за повраћај тикета у интерфејсу оператера.',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања телефонске напомене на приказу екрана за тикет долазних телефонских позива у интерфејсу оператера.',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Дефинише подразумевани следећи статус тикета после додавања телефонске напомене на приказу екрана за тикет одлазних телефонских позива у интерфејсу оператера.',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Дефинише подразумевани редослед тикета (после сортирања по приоритету) у ескалационом прегледу у интерфејсу опрератера. Горе: Најстарији на врху. Доле: Најновије на врху.',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Дефинише подразумевани редослед тикета (после сортирања по приоритету) у прегледу статуса у интерфејсу опрератера. Горе: Најстарији на врху. Доле: Најновије на врху.',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Дефинише подразумевани редослед тикета (после сортирања по приоритету) у одговорном прегледу у интерфејсу опрератера. Горе: Најстарији на врху. Доле: Најновије на врху.',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Дефинише подразумевани редослед тикета (после сортирања по приоритету) у прегледу закључаних тикета у интерфејсу опрератера. Горе: Најстарији на врху. Доле: Најновије на врху.',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Дефинише подразумевани редослед тикета (после сортирања по приоритету) у прегледу претраге тикета у интерфејсу опрератера. Горе: Најстарији на врху. Доле: Најновије на врху.',
        'Defines the default ticket order in the ticket search result of the this operation. Up: oldest on top. Down: latest on top.' =>
            'Дефинише подразумевани редослед тикета у прегледу претраге тикета у овој операцији. Горе: Најстарији на врху. Доле: Најновије на врху.',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Дефинише подразумевани редослед тикета у посматраном прегледу интерфејса оператера. Горе: Најстарији на врху. Доле: Најновије на врху.',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            'Одређује подразумевани редослед тикета у прегледу претраге резултата у интерфејсу клијента. Горе: Најстарији на врху. Доле: Најновије на врху.',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            'Одређује подразумевани приоритет тикета на приказу екрана затвореног тикета у интерфејсу оператера.',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            'Одређује подразумевани приоритет тикета на приказу екрана масовних тикета у интерфејсу оператера.',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            'Одређује подразумевани приоритет тикета на приказу екрана тикета слободног текста у интерфејсу оператера.',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            'Одређује подразумевани приоритет тикета на приказу екрана напомене тикета у интерфејсу оператера.',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Одређује подразумевани приоритет тикета на приказу екрана власника тикета при увећаном приказу тикета у интерфејсу оператера.',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Одређује подразумевани приоритет тикета на приказу екрана власника тикета на чекању при увећаном приказу тикета у интерфејсу оператера.',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Одређује подразумевани приоритет тикета на приказу екрана приоритетног тикета при увећаном приказу тикета у интерфејсу оператера',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            'Одређује подразумевани приоритет тикета на приказу екрана одговорног тикета интерфејса оператера.',
        'Defines the default ticket type for new customer tickets in the customer interface.' =>
            'Одређује подразумевани тип тикета за тикете новог клијента у интерфејсу клијента.',
        'Defines the default ticket type.' => 'Одређује подразумевани тип тикета.',
        'Defines the default type for article in the customer interface.' =>
            'Одређује подразумевани тип чланка у интерфејсу клијента.',
        'Defines the default type of forwarded message in the ticket forward screen of the agent interface.' =>
            'Одређује подразумевани тип прослеђене поруке на приказ екрана прослеђених тикета интерфејса оператера.',
        'Defines the default type of the article for this operation.' => 'Određuje podrazumevani tip članka za ovu operaciju.',
        'Defines the default type of the message in the email outbound screen of the agent interface.' =>
            'Одређује подразумевани тип поруке на екрану одлазних имејлова интерфејса оператера.',
        'Defines the default type of the note in the close ticket screen of the agent interface.' =>
            'Одређује подразумевани тип напомене на приказу екрана затвореног тикета интерфејса оператера.',
        'Defines the default type of the note in the ticket bulk screen of the agent interface.' =>
            'Одређује подразумевани тип напомене на приказу екрана масовних тикета интерфејса оператера.',
        'Defines the default type of the note in the ticket free text screen of the agent interface.' =>
            'Одређује подразумевани тип напомене на приказу екрана тикета слободног текста интерфејса оператера.',
        'Defines the default type of the note in the ticket note screen of the agent interface.' =>
            'Одређује подразумевани тип напомене на приказу екрана напомене тикета интерфејса оператера.',
        'Defines the default type of the note in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Одређује подразумевани тип напомене на приказу екрана власника тикета при увећаном приказу тикета у интерфејсу оператера.',
        'Defines the default type of the note in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Одређује подразумевани тип напомене на приказу екрана тикета на чекању при увећаном приказу тикета у интерфејсу оператера.',
        'Defines the default type of the note in the ticket phone inbound screen of the agent interface.' =>
            'Одређује подразумевани тип напомене на приказу екрана за тикет долазних телефонских позива интерфејса оператера.',
        'Defines the default type of the note in the ticket phone outbound screen of the agent interface.' =>
            'Одређује подразумевани тип напомене на приказу екрана за тикет одлазних телефонских позива интерфејса оператера.',
        'Defines the default type of the note in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Одређује подразумевани тип напомене на приказу екрана приоритетног тикета при увећаном приказу тикета у интерфејсу оператера.',
        'Defines the default type of the note in the ticket responsible screen of the agent interface.' =>
            'Одређује подразумевани тип напомене на приказу екрана одговорног тикета интерфејса оператера.',
        'Defines the default type of the note in the ticket zoom screen of the customer interface.' =>
            'Одређује подразумевани тип напомене на екрану детаљног приказа тикета интерфејса клијента.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            'Дефинише подразумевани употребљени модул корисничког дела, ако акциони параметар није дат у url на инерфејсу оператера.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            'Одређује подразумевани употребљени модул корисничког дела, ако акциони параметар није дат у url на инерфејсу клијента.**',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            'Дефинише подрезумевану вредност за акциони параметар за јавни кориснички део. Акциони параметар је коришћен у скриптама система.',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            'Одређује подразумевани тип видљивог пошиљаоца тикета (подразмевано: клијент).',
        'Defines the dynamic fields that are used for displaying on calendar events.' =>
            'Дефинише динамичка поља која се користе за приказивање на календару догађаја.',
        'Defines the fall-back path to open fetchmail binary. Note: The name of the binary needs to be \'fetchmail\', if it is different please use a symbolic link.' =>
            'Дефинише резервну путању за fetchmail програм. Напомена: назив програма мора бити \'fetchmail\', уколико је другачији молимо користите симболичку везу.',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            'Дефинише филтер који обрађује текст у чланцима, да би се истакле URL адресе.',
        'Defines the format of responses in the ticket compose screen of the agent interface ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] is only realname of From).' =>
            'Дефинише формат одговора у приказу екрана за креирање тикета интерфејса оператера ([% Data.OrigFrom | html %]  је Од у оригиналном облику, [% Data.OrigFromName | html %] је само право име из Од).',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Дефинише потпуно квалификовано име домена система. Ово подешавање се користи као променљива OTRS_CONFIG_FQDN, која се налази у свим формама порука и користи од стране апликације, за грађење веза до тикета унутар вашег система.',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every user for these groups).' =>
            'Одређује групе у којима ће се налазити сваки клијент корисник (ако је „CustomerGroupSupport” активирана и не желите да управљате сваким корисником из ових група).',
        'Defines the height for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Одређује висину за компоненту Rich Text Editor за овај приказ екрана. Унеси број (пиксели) или процентуалну вредност (релативну).',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Одређује висину за компоненту Rich Text Editor. Унеси број (пиксели) или процентуалну вредност (релативну).',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише коментар историје за приказ екрана активности затвореног тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише коментар историје за приказ екрана активности имејл тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише коментар историје за приказ екрана активности телефонског тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            'Дефинише коментар историје за приказ екрана активности тикета слебодног текста, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише коментар историје за приказ екрана активности напомене тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише коментар историје за приказ екрана активности власника тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише коментар историје за приказ екрана активности тикета на чекању, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише коментар историје за приказ екрана активности долазнх телефонских позива тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише коментар историје за приказ екрана активности одлазнх телефонских позива тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише коментар историје за приказ екрана активности приоритетних тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише коментар историје за приказ екрана активности одговорних тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Одређује коментар историје за приказ екрана активности тикета детаљног приказа, који се користи за историју тикета у интерфејсу клијента.',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            'Дефинише коментар историје за ову операцију, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише тип историје за приказ екрана активности затвореног тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише тип историје за приказ екрана активности имејл тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише тип историје за приказ екрана активности телефонског тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            'Дефинише тип историје за приказ екрана активности тикета слободног текста, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише тип историје за приказ екрана активности напомене тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише тип историје за приказ екрана активности власника тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише тип историје за приказ екрана активности тикета на чекању, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише тип историје за приказ екрана активности тикета долазних телефонских позива, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише тип историје за приказ екрана активности тикета одлазних телефонских позива, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише тип историје за приказ екрана активности приоритетног тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Дефинише тип историје за приказ екрана активности одговорног тикета, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Одређује тип историје за приказ екрана активности детаљног приказа тикета, који се користи за историју тикета у интерфејсу клијента.',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            'Дефинише тип историје за ову операцију, који се користи за историју тикета у интерфејсу оператера.',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            'Одређује сате и дане у недељи у назначеном календару, ради рачунања радног времена.',
        'Defines the hours and week days to count the working time.' => 'Одређује сате и дане у недељи у назначеном календару, ради рачунања радног времена.',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            'Дефинише кључ који треба проверити са модулом „Kernel::Modules::AgentInfo”. Ако је овај кориснички параметар кључа тачан, порука ће бити прихваћена од стране система.',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            'Одређује кључ који треба проверити са „CustomerAccept” (прихватање корисника). Ако је овај кориснички параметар кључа тачан, порука ће бити прихваћена од стране система.',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Дефинише тип везе \'Normal\'. Ако назив извора и назив циља садрже исте вредности, добијена веза се сматра неусмереном; у супротном се као резултат добија усмерена веза. ',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Дефинише тип везе надређени-подређени. Ако назив извора и назив циља садрже исте вредности, добијена веза се сматра неусмереном; у супротном се као резултат добија усмерена веза. ',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            'Дефинише тип везе група. Типови везе исте групе поништавају једни друге. Пример: Ако је тикет А везан преко \'Normal\' везе са тикетом Б, онда ови тикети не могу бити додатно везани везом надређени-подређени.',
        'Defines the list of online repositories. Another installations can be used as repository, for example: Key="http://example.com/otrs/public.pl?Action=PublicRepository;File=" and Content="Some Name".' =>
            'Дефинише листу online спремишта. Још инсталација може да се користи као спремиште, на пример: Key=„http://example.com/otrs/public.pl?Action=PublicRepository;File=” и Content=„Some Name”.',
        'Defines the list of possible next actions on an error screen, a full path is required, then is possible to add external links if needed.' =>
            'Дефинише листу могућих следећих акција на приказу екрана са грешком, комплетна путања је обавезна, након чега је могуће додати спољашње везе ако је потребно.',
        'Defines the list of types for templates.' => 'Дефинише листу типова шаблона.',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            'Дефинише локацију за добијање списка online спремишта за додатне пакете. Први расположиви резултат ће бити коришћен.',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            'Дефинише лог модул за систем. „File” пише све поруке у датој лог датотеци, „SysLog” користи системски лог сервис, нпр. syslogd.',
        'Defines the maximal size (in bytes) for file uploads via the browser. Warning: Setting this option to a value which is too low could cause many masks in your OTRS instance to stop working (probably any mask which takes input from the user).' =>
            'Дефинише максималну величину (у бајтовима) за слање датотеке преко претраживача. Упозорење: Подешавање ове опције на сувише малу вредност може узроковати да многе маске у вашој „OTRS” инстанци престану са радом (вероватно свака маска која има улаз од корисника).',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            'Дефинише максимално време важења (у секундама) за ИД сесије.',
        'Defines the maximum number of affected tickets per job.' => 'Дефинише максимални број обухваћених тикета по послу.',
        'Defines the maximum number of pages per PDF file.' => 'Дефинише максимални број страна по PDF датотеци.',
        'Defines the maximum number of quoted lines to be added to responses.' =>
            'Дефинише максимални број цитираних линија за додавање у одговоре.',
        'Defines the maximum number of tasks to be executed as the same time.' =>
            'Дефинише максимални број задатака који ће се извршавати у исто време.',
        'Defines the maximum size (in MB) of the log file.' => 'Дефинише максималну величину лог датотеке (у мегабајтима).',
        'Defines the maximum size in KiloByte of GenericInterface responses that get logged to the gi_debugger_entry_content table.' =>
            'Дефинише максималну величину у килобајтима за одговоре Генеричког интерфејса који се бележе у gi_debugger_entry_content табелу.',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            'Дефинише модул који приказује генеричку напомену у интерфејсу оператера. Биће приказан или „Text” (ако је конфигурисан) или садржај „File”.',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            'Дефинише модул који приказује све тренутно пријављене оператере у интерфејсу оператера.',
        'Defines the module that shows all the currently logged in customers in the agent interface.' =>
            'Дефинише модул који приказује све тренутно пријављене клијенте у интерфејсу оператера.',
        'Defines the module that shows the currently logged in agents in the customer interface.' =>
            'Дефинише модул који приказује све тренутно пријављене оператере у интерфејсу клијента.',
        'Defines the module that shows the currently logged in customers in the customer interface.' =>
            'Дефинише модул који приказује све тренутно пријављене клијенте у интерфејсу клијента.',
        'Defines the module to authenticate customers.' => 'Одређује модул за аутентификацију клијената.',
        'Defines the module to display a notification if cloud services are disabled.' =>
            'Дефинише модул за приказивање обавештења ако су сервиси у облаку онемогућени.',
        'Defines the module to display a notification in different interfaces on different occasions for OTRS Business Solution™.' =>
            'Одређује модул за приказ обавештења у разним интерфејсима у различитим приликама за OTRS Business Solution™.',
        'Defines the module to display a notification in the agent interface if the OTRS Daemon is not running.' =>
            'Одређује модул за приказ обавештења у интерфејсу оператера ако „OTRS” системски процес не ради.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            'Дефинише модул за приказивање обавештења у интерфејсу оператера ако је оператер пријављен на систем док је опција „ван канцеларије” активна.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having system maintenance active.' =>
            'Одређује модул за приказ обавештења у интерфејсу оператера, ако је оператер пријављен на систем док је активно одржавање сиситема.',
        'Defines the module to display a notification in the agent interface, if the agent session limit prior warning is reached.' =>
            'Одређује модул за приказ обавештења у интерфејсу оператера ако .је достигнут лимит сесија оператера.',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            'Дефинише модул за приказивање обавештења у интерфејсу оператера ако се систем користи од стране админ корисника (нормално не треба да раде као администратор).',
        'Defines the module to generate code for periodic page reloads.' =>
            'Дефинише модул за генерисање кода за периодично учитавање страница.',
        'Defines the module to send emails. "Sendmail" directly uses the sendmail binary of your operating system. Any of the "SMTP" mechanisms use a specified (external) mailserver. "DoNotSendEmail" doesn\'t send emails and it is useful for test systems.' =>
            'Дефинише модуле за слање имејл порука. „Sendmail” директно користи апликацију вашег оперативног система за слање имејла. Сваки од „SMTP” механизама користи специфичан (екстерни) имејл сервер. „DoNotSendEmail” не шаље имејлове и то је корисно при тестирању система.',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            'Дефинише модул који се користи за складиштење података сесије. Са „DB” приступни сервер може бити одвојен од сервера базе података. „FS” је бржи.',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            'Дефинише назив апликације, који се приказује у веб интерфејсу, картицама и насловној траци веб претраживача.',
        'Defines the name of the column to store the data in the preferences table.' =>
            'Дефинише назив колоне за складиштење података у табели параметара.',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            'Дефинише назив колоне за складиштење идентификације корисника у табели параметара.',
        'Defines the name of the indicated calendar.' => 'Дефинише назив назначеног календара.',
        'Defines the name of the key for customer sessions.' => 'Одређује назив кључа за клијентске сесије.',
        'Defines the name of the session key. E.g. Session, SessionID or OTRS.' =>
            'Дефинише назив кључа сесије. Нпр. Сесија, Сесија ИД или „OTRS”.',
        'Defines the name of the table where the user preferences are stored.' =>
            'Одређује назив табеле где се смештају подешавања корисника.',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            'Дефинише следеће могуће статусе након отварања / одговарања тикета у приказу екрана за отварање тикета интерфејса оператера.',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            'Дефинише следеће могуће статусе након прослеђивања тикета у приказу екрана за прослеђивање тикета интерфејса оператера.',
        'Defines the next possible states after sending a message in the email outbound screen of the agent interface.' =>
            'Дефинише следеће могуће статусе након слања поруке у приказу екрана одлазних имејлова интерфејса оператера.',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            'Одређује следеће могуће статусе за тикете клијената у интерфејсу клијента.',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Дефинише следећи статус тикета након додавања напомене у приказу екрана затвореног тикета интерфејса оператера.',
        'Defines the next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            'Дефинише следећи статус тикета након додавања напомене у приказу екрана масовних тикета интерфејса оператера.',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Дефинише следећи статус тикета након додавања напомене у приказу екрана тикета слободног текста интерфејса оператера.',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Дефинише следећи статус тикета након додавања напомене у приказу екрана напомене тикета интерфејса оператера.',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Дефинише следећи статус тикета након додавања напомене у приказу екрана власника тикета при увећаном приказу тикета у интерфејсу оператера.',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Дефинише следећи статус тикета након додавања напомене у приказу екрана тикета на чекању при увећаном приказу тикета у интерфејсу оператера.',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Дефинише следећи статус тикета након додавања напомене у приказу екрана приоритетног тикета при увећаном приказу тикета у интерфејсу оператера.',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Дефинише следећи статус тикета након додавања напомене у приказу екрана одговорног тикета у интерфејсу оператера.',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Дефинише следећи статус тикета након враћања, у приказу екрана за повраћај тикета интерфејса оператера.',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            'Дефинише следећи статус тикета након што је померен у други ред у приказу екрана помереног тикета интерфејса оператера.',
        'Defines the number of character per line used in case an HTML article preview replacement on TemplateGenerator for EventNotifications.' =>
            'Одређује број знакова по линији који се користе у случају замене за преглед „HTML” чланка у генератору шаблона за обавештења о догађајима.',
        'Defines the number of days to keep the daemon log files.' => 'Одређује колико дана ће се чувати датотеке историјата рада системског сервиса',
        'Defines the number of header fields in frontend modules for add and update postmaster filters. It can be up to 99 fields.' =>
            'Одеређује број насловних поља у приступним модулима за додавање и ажурирање главних имејл филтера. Може их бити до 99.',
        'Defines the parameters for the customer preferences table.' => 'Одређује параметре за табелу подешавања клијената.',
        'Defines the parameters for the dashboard backend. "Cmd" is used to specify command with parameters. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            'Дефинише параметре позадинског приказа командне табле. „Cmd” се користи за командне параметре. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            'Дефинише параметре за позадински приказ контролне табле. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            'Дефинише параметре за позадински приказ контролне табле. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            'Дефинише параметре за позадински приказ контролне табле. „Limit” дефинише број уноса подрезумевано приказаних. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            'Дефинише параметре за позадински приказ контролне табле. „Limit” дефинише број уноса подрезумевано приказаних. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Дефинише лозинку за приступ SOAP руковању (bin/cgi-bin/rpc.pl).',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            'Дефинише путању и TTF датотеку подебљаног непропорционалног фонта у курзиву у PDF документима.',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            'Дефинише путању и TTF датотеку подебљаног пропорционалног фонта у курзиву у PDF документима.',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            'Дефинише путању и TTF датотеку подебљаног непропорционалног фонта у PDF документима.',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            'Дефинише путању и TTF датотеку подебљаног пропорционалног фонта у PDF документима.',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            'Дефинише путању и TTF датотеку непропорционалног фонта у курзиву у PDF документима.',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            'Дефинише путању и TTF датотеку пропорционалног фонта у курзиву у PDF документима.',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            'Дефинише путању и TTF датотеку непропорционалног фонта у PDF документима.',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            'Дефинише путању и TTF датотеку пропорционалног фонта у PDF документима.',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.' =>
            'Дефинише путању приказаног инфо фајла који је лоциран под Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.',
        'Defines the path to PGP binary.' => 'Одређује путању до „PGP binary”.',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            'Одређује путању до open ssl binary. Може бити потребно HOME Env ($ENV{HOME} = \'/var/lib/wwwrun\';).',
        'Defines the postmaster default queue.' => 'Дефинише подразумевани ред постмастера.',
        'Defines the priority in which the information is logged and presented.' =>
            'Дефинише приоритет по ком се информације бележе и приказују.',
        'Defines the recipient target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "System address" displays all system addresses) in the agent interface.' =>
            'Одређује циљног примаоца телефонског тикета и пошиљаоца имејл тикета („Queue” приказује све редове, „System address” приказује све системске адресе) у интерфејсу оператера.',
        'Defines the recipient target of the tickets ("Queue" shows all queues, "SystemAddress" shows only the queues which are assigned to system addresses) in the customer interface.' =>
            'Одређује циљног примаоца тикета („Ред” приказује све редове, „Системска Адреса” приказује само редове који су додењени системским адресама) у интерфејсу клијента.',
        'Defines the required permission to show a ticket in the escalation view of the agent interface.' =>
            'Дефинише захтевану дозволу за приказ тикета у ескалационом прегледу интерфејса оператера.',
        'Defines the search limit for the stats.' => 'Дефинише границу претраге за статистике.',
        'Defines the sender for rejected emails.' => 'Дефинише пошиљаоца одбијених имејл порука.',
        'Defines the separator between the agents real name and the given queue email address.' =>
            'Одређује сепаратор између правог имена оператера и емаил адресе додељене реду.',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            'Одређује стандардне дозволе расположиве за кориснике у апликацији. Уколико је потребно више дозвола, можете их унети овде. Да би биле ефективне, дозволе морају бити непроменљиве. Молимо проверите када додајете било коју од горе наведених дозвола, да „rw” дозвола остане последња.',
        'Defines the standard size of PDF pages.' => 'Дефинише стандардну величину PDF страница.',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            'Дефинише стање тикета уколико добије наставак, а тикет је већ затвоен.',
        'Defines the state of a ticket if it gets a follow-up.' => 'Дефинише стање тикета уколико добије наставак',
        'Defines the state type of the reminder for pending tickets.' => 'Дефинише дип статуса подсетника за тикете на чекању.',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            'Дефинише предмет за имејл поруке обавештења послата оператерима, о новој лозинки.',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            'Дефинише предмет за имејл поруке обавештења послата оператерима, са токеном о новој захтеваној лозинки.',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            'Одређује предмет за имејл поруке обавештења послата клијентима, о новом налогу.',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            'Одређује предмет за имејл поруке обавештења послата клијентима, о новој лозинки.',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            'Одређује предмет за имејл поруке обавештења послата клијентима, са токеном о новој захтеваној лозинки.',
        'Defines the subject for rejected emails.' => 'Дефинише предмет за одбачене поруке.',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            'Дефинише имејл адресу систем администратора. Она ће бити приказана на екранима са грешком у апликацији.',
        'Defines the system identifier. Every ticket number and http session string contains this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of OTRS).' =>
            'Дефинише идентификатор система. Сваки број тикета и низ знакова http сесије садрши овај ИД. Ово осигурава да ће само тикети који припадају вашем систему бити обрађени као операције праћења (корисно када се одвија комуникација између две „OTRS” инстанце).',
        'Defines the target attribute in the link to external customer database. E.g. \'AsPopup PopupType_TicketAction\'.' =>
            'Одређује циљни атрибут у вези са екстерном базом података клијента. Нпр. \'AsPopup PopupType_TicketAction\'.',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            'Одређује циљни атрибут у вези са екстерном базом података клијента. Нпр. \'target="cdb"\'.',
        'Defines the ticket fields that are going to be displayed calendar events. The "Key" defines the field or ticket attribute and the "Content" defines the display name.' =>
            'Дефинише поља тикета која ће бити приказана у календару догађаја. „Key” дефинише поље или атрибут тикета, а „Content” дефинише приказано име.',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            'Дефинише временску зону назначеног календара, која касније може бити додељена одређеном реду.',
        'Defines the two-factor module to authenticate agents.' => 'Одређује двофакторски модул за идентификацију оператера.',
        'Defines the two-factor module to authenticate customers.' => 'Одређује двофакторски модул за идентификацију клијената.',
        'Defines the type of protocol, used by the web server, to serve the application. If https protocol will be used instead of plain http, it must be specified here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is only used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Дефинише тип протокола коришћеног од стране веб сервера, за потребе апликације. Ако се користи https протокол уместо plain http, мора бити овде назначено. Пошто ово нема утицаја на подешавања или понашање веб сервера, неће променити начин приступа апликацији и, ако је то погрешно, неће вас спречити да се пријавите у апликацију. Ово подешавање се користи само као променљива, OTRS_CONFIG_HttpType која се налази у свим облицима порука коришћених од стране апликације, да изграде везе са тикетима у вашем систему.',
        'Defines the used character for plaintext email quotes in the ticket compose screen of the agent interface. If this is empty or inactive, original emails will not be quoted but appended to the response.' =>
            'Дефинише коришћене карактере за plaintext имејл наводе у приказу екрана отвореног тикета интерфејса оператера. Уколико је ово празно или неактивно, оригинални имејлови неће бити наведени, него додати одговору.',
        'Defines the user identifier for the customer panel.' => 'Одређује идентификатор клијента за клијентски панел.',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Дефинише корисничко име за приступ SOAP руковању (bin/cgi-bin/rpc.pl).',
        'Defines the valid state types for a ticket.' => 'Дефинише важеће типове статуса за тикет.',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/otrs.Console.pl Maint::Ticket::UnlockTimeout" can be used.' =>
            'Одређује важеће статусе за откључане тикете. За откључавање тикета може се користити скрипт „bin/otrs.Console.pl Maint::Ticket::UnlockTimeout”.',
        'Defines the viewable locks of a ticket. NOTE: When you change this setting, make sure to delete the cache in order to use the new value. Default: unlock, tmp_lock.' =>
            'Дефинише',
        'Defines the width for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Одређује ширину за компоненту rich text editor за овај приказ екрана. Унеси број (пиксели) или процентуалну вредност (релативну).',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Одређује ширину за компоненту rich text editor. Унеси број (пиксели) или процентуалну вредност (релативну).',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            'Дефинише који типови пошиљаоца артикла треба да буду показани у приказу тикета.',
        'Defines which items are available for \'Action\' in third level of the ACL structure.' =>
            'Дефинише које су ставке слободне за \'Action\' у трећем нивоу ACL структуре.',
        'Defines which items are available in first level of the ACL structure.' =>
            'Дефинише које су ставке слободне у првом нивоу ACL структуре.',
        'Defines which items are available in second level of the ACL structure.' =>
            'Дефинише које су ставке слободне у другом нивоу ACL структуре',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            'Дефинише који статуси треба да буду аутоматски подешени (Садржај), након достизања времена чекања статуса (Кључ).',
        'Defines wich article type should be expanded when entering the overview. If nothing defined, latest article will be expanded.' =>
            'Дефинише који тип чланка треба да буде проширен приликом уласка у преглед. Ако ништа није дефинисано, последњи чланак ће бити проширен.',
        'Defines, which tickets of which ticket state types should not be listed in linked ticket lists.' =>
            'Дефинише, који тикети од којих типова статуса тикета не треба да буду приказани у листи повезаних тикета.',
        'Delete expired cache from core modules.' => 'Брисање истеклог кеша из модула језгра.',
        'Delete expired loader cache weekly (Sunday mornings).' => 'Брише истекли кеш учитавања седмично (недељом ујутро).',
        'Delete expired sessions.' => 'Брише истекле сесије',
        'Deleted link to ticket "%s".' => 'Веза на „%s” обрисана.',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            'Брише сесију уколико је ИД сесије коришћен преко неважеће удаљене IP адресе.',
        'Deletes requested sessions if they have timed out.' => 'Брише захтевану сесију ако је истекло време.',
        'Delivers extended debugging information in the frontend in case any AJAX errors occur, if enabled.' =>
            'Омогућава прибављање додатних информација о грешкама у интерфејсу, у случају проблема са AJAX методом.',
        'Deploy and manage OTRS Business Solution™.' => 'Примени и управљај OTRS Business Solution™.',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            'Одређује да ли листа могућих редова за премештање у тикет треба да буде приказана у падајућој листи или у новом прозору у интерфејсу оператера. Ако је подешен „Нови прозор” можете додавати напомене о премештању у тикет.',
        'Determines if the statistics module may generate ticket lists.' =>
            'Одређује да ли статистички модул може генерисати листе тикета.',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            'Одређује следећи могући статус тикета, након креирања новог имејл тикета у интерфејсу оператера.',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            'Одређује следећи могући статус тикета, након креирања новог телефонског тикета у интерфејсу оператера.',
        'Determines the next possible ticket states, for process tickets in the agent interface.' =>
            'Одређује следећи могући статус тикета, за тикете процеса у интерфејсу оператера.',
        'Determines the next possible ticket states, for process tickets in the customer interface.' =>
            'Одређује следећи могући статус тикета, за тикете процеса у интерфејсу клијента.',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            'Одређује следећи приказ екрана, након тикета новог клијента у интерфејсу клијента.',
        'Determines the next screen after the follow-up screen of a zoomed ticket in the customer interface.' =>
            'Одређује следећи екрана, након наредног екрана детаљног приказа тикета у интерфејсу клијента.',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return the last overview screen (e.g. search results, queueview, dashboard). TicketZoom will return to the TicketZoom.' =>
            'Одређује следећи приказ екрана, након премештања тикета. LastScreenOverview ће вратити последнји преглед екрана (нпр. резултати претраге, преглед редова, контролна табла). TicketZoom ће вратити на увећање тикета.',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            'Одређује могући статус за тикете на чекању који мењају статус након достизања временског лимита.',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            'Одређује фразу које ће бити приказана као прималац (За:) телефонског тикета и као пошиљалац (Од:) имејл тикета у интерфејсу оператера. За Ред као „NewQueueSelectionType” „<Queue>” приказује називе редова, а за Системску адресу „<Realname> <<Email>>” приказује име и имејл примаоца.',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            'Одређује фразу која ће бити приказана као прималац (За:) тикет у интерфејсу клијента. За Ред као „CustomerPanelSelectionType” „<Queue>” приказује имена редова и за Системску адресу „<Realname> <<Email>>” приказује име и имејл примаоца.',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            'Одређује начин на који се повезани објекти приказују у свакој увећаној маски.',
        'Determines which options will be valid of the recipient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            'Одређује које опције ће бити важеће за примаоца (телефонски тикет) и пошиљаоца (имејл тикет) у интерфејсу оператера.',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            'Одређује који ће редови бити важећи за тикете примаоца у интерфејсу клијента.',
        'Development' => 'Развој',
        'Disable HTTP header "Content-Security-Policy" to allow loading of external script contents. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            'Онемогућава HTTP заглавље „Content-Security-Policy” ради учитавања екстерних скриптова. Онемогућавање овог HTTP заглавља сноси сигурносни ризик! Искључите га само ако знате шта радите!',
        'Disable HTTP header "X-Frame-Options: SAMEORIGIN" to allow OTRS to be included as an IFrame in other websites. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            'Онемогућава HTTP заглавље „X-Frame-Options: SAMEORIGIN” ради учитавања OTRS у оквиру IFRAME на другим странама. Онемогућавање овог HTTP заглавља сноси сигурносни ризик! Искључите га само ако знате шта радите!',
        'Disable restricted security for IFrames in IE. May be required for SSO to work in IE.' =>
            'Онемогући ограничену сигурност за „IFrame” у „IE”. Може бити захтевано за „SSO” да ради у „IE”.',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be activated).' =>
            'Онемогућује слање обавештења подсетника одговорном оператеру тикета (Ticket::Responsible мора бити активиран).',
        'Disables the communication between this system and OTRS Group servers that provides cloud services. If active, some functionality will be lost such as system registration, support data sending, upgrading to and use of OTRS Business Solution™, OTRS Verify™, OTRS News and product News dashboard widgets, among others.' =>
            'Онемогућава комуникацију између овог система и сервера OTRS групе који обезбеђују сервисе у облаку. Ако је активирано, неке функционалности неће радити, а то су регистрација система, слање података подршке, унапређење на OTRS Business Solution™, OTRS верификација, OTRS новости и новости о производу у додацима на контролној табли, између осталих.',
        'Disables the web installer (http://yourhost.example.com/otrs/installer.pl), to prevent the system from being hijacked. If set to "No", the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If not active, it also disables the GenericAgent, PackageManager and SQL Box.' =>
            'Онемогућује веб инсталационом програму (http://yourhost.example.com/otrs/installer.pl) да заштити систем од недозвољеног преузимања. Ако подесите на „Не”, систем може бити поново инсталиран и тренутна основна конфигурација ће бити коришћена да унапред попуни питања унутар инсталационе скрипте. Уколико није активно, такође се онемогућују GenericAgent, PackageManager и SQL Box.',
        'Display a warning and prevent search when using stop words within fulltext search.' =>
            'Прикажи упозорење и онемогући претрагу ако су употребљене зауставне речи у претрази комплетног текста.',
        'Display settings to override defaults for Process Tickets.' => 'Прикажи подешавања да би сте заменили подразумевана за тикете процеса.',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            'Приказује обрачунато време за један чланак у приказу увећаног тикета.',
        'Dropdown' => 'Падајући',
        'Dutch stop words for fulltext index. These words will be removed from the search index.' =>
            'Холандске зауставне речи за индекс претраге комплетног текста. Ове речи ће бити уклоњене из индекса претраге.',
        'Dynamic Fields Checkbox Backend GUI' => 'Позадински приказ динамичког поља за потврду',
        'Dynamic Fields Date Time Backend GUI' => 'Позадински приказ динамичког поља за датум и време',
        'Dynamic Fields Drop-down Backend GUI' => 'Позадински приказ падајућег динамичког поља',
        'Dynamic Fields GUI' => 'Динамичка поља GUI',
        'Dynamic Fields Multiselect Backend GUI' => 'Позадински приказ динамичког поља са вишеструким избором',
        'Dynamic Fields Overview Limit' => 'Ограничен преглед динамичких поља',
        'Dynamic Fields Text Backend GUI' => 'Позадински приказ текстуалног динамичког поља',
        'Dynamic Fields used to export the search result in CSV format.' =>
            'Динамичка поља коришћена за извоз резултата претраге у CSV формат.',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key => My Group\', \'Content: Name_X, NameY\'.' =>
            'Групе динамичких поља за обраду апликативног додатка (widget). Кључ је назив групе, вредност садржи поље које ће бити приказано. Пример: \'Key => My Group\', \'Content: Name_X, NameY\'.',
        'Dynamic fields limit per page for Dynamic Fields Overview' => 'Ограничење динамичких поља по страни за приказ динамичких поља.',
        'Dynamic fields options shown in the ticket message screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###DynamicField.' =>
            'Опције динамичких поља приказане на екрану поруке тикета интерфејса клијента. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и неопходно. НАПОМЕНА: Ако желите да прикажете ова поља такође и при увећаном приказу екрана тикета интерфејса клијента, треба да их омогућите у CustomerTicketZoom###DynamicField.',
        'Dynamic fields options shown in the ticket reply section in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Опције динамичких поља приказане у одељку одговора тикета при увећаном приказу екрана тикета интерфејса клијента. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и неопходно.',
        'Dynamic fields shown in the email outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану одлазних имејлова интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и неопходно.',
        'Dynamic fields shown in the process widget in ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Динамичка поља приказана у процесу апликативног додатка (widget-а) при увећаном приказу екрана тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено.',
        'Dynamic fields shown in the sidebar of the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Динамичка поља приказана у извојеном делу увећаног приказа екрана тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено.',
        'Dynamic fields shown in the ticket close screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану затвореног тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано.',
        'Dynamic fields shown in the ticket compose screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану отвореног тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано',
        'Dynamic fields shown in the ticket email screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану имејл тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано',
        'Dynamic fields shown in the ticket forward screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану прослеђеног тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано',
        'Dynamic fields shown in the ticket free text screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану тикета слободног текста интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано',
        'Dynamic fields shown in the ticket medium format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Динамичка поља приказана на екрану прегледа средњег формата тикета слободног текста интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено.',
        'Dynamic fields shown in the ticket move screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану премештеног тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано.',
        'Dynamic fields shown in the ticket note screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану напомене тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано.',
        'Dynamic fields shown in the ticket overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану прегледа тикета интерфејса клијента. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и неопходно.',
        'Dynamic fields shown in the ticket owner screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану власника тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано.',
        'Dynamic fields shown in the ticket pending screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану тикета на чекању интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано.',
        'Dynamic fields shown in the ticket phone inbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану тикета долазних телефонских позива интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано.',
        'Dynamic fields shown in the ticket phone outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану тикета одлазних телефонских позива интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано.',
        'Dynamic fields shown in the ticket phone screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану телефонских тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано.',
        'Dynamic fields shown in the ticket preview format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Динамичка поља показана на екрану приказа прегледа формата тикета у интерфејсу оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено.',
        'Dynamic fields shown in the ticket print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Динамичка поља приказана на екрану штампе тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено.',
        'Dynamic fields shown in the ticket print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Динамичка поља приказана на екрану штампе тикета интерфејса клијента. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено.',
        'Dynamic fields shown in the ticket priority screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану приоритетног тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано.',
        'Dynamic fields shown in the ticket responsible screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Динамичка поља приказана на екрану одговорног за тикет интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано.',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Динамичка поља приказана на екрану прегледа резултата претраге тикета интерфејса клијента. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено.',
        'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.' =>
            'Динамичка поља приказана на екрану претраге тикета интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и приказано у старту.',
        'Dynamic fields shown in the ticket search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Динамичка поља приказана на екрану претраге тикета интерфејса клијента. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено.',
        'Dynamic fields shown in the ticket small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Динамичка поља приказана на екрану прегледа малог формата тикета слободног текста интерфејса оператера. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено, 2 = Омогућено и захтевано.',
        'Dynamic fields shown in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Динамичка поља приказана на екрану увећаног тикета интерфејса клијента. Могућа подешавања: 0 = Онемогућено, 1 = Омогућено.',
        'DynamicField' => 'Динамичко поље',
        'DynamicField backend registration.' => 'Позадинска регистарција  динамичких поља.',
        'DynamicField object registration.' => 'Регистарција објекта динамичких поља.',
        'E-Mail Outbound' => 'Одлазни имејл',
        'Edit Customer Companies.' => 'Измена фирми клијента.',
        'Edit Customer Users.' => 'Уреди клијенте кориснике.',
        'Edit customer company' => 'Измени фирму клијента',
        'Email Addresses' => 'Имејл адресе',
        'Email Outbound' => 'Одлазни имејл',
        'Email sent to "%s".' => 'Послат одговор „%s”.',
        'Email sent to customer.' => 'Имејл послат клијенту.',
        'Enable keep-alive connection header for SOAP responses.' => 'Омогући заглавље за одржање активне конекције за „SOAP” одговоре.',
        'Enabled filters.' => 'Омогућени филтери.',
        'Enables PGP support. When PGP support is enabled for signing and encrypting mail, it is HIGHLY recommended that the web server runs as the OTRS user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            'Обезбеђује „PGP” подршку. Када је „PGP” подршка омогућена за потписивање и енкрипровање мејла, строго се препоручује да веб сервер ради као „OTRS” корисник. У супротном, биће проблема са привилегијама приликом приступа .gnupg фолдеру.',
        'Enables S/MIME support.' => 'Omogućava S/MIME podršku.',
        'Enables customers to create their own accounts.' => 'Омогућава клијентима да креирају сопствене налоге.',
        'Enables fetch S/MIME from CustomerUser backend support.' => 'Омогућава подршку за прибављање S/MIME из CustomerUser позадинског приказа.',
        'Enables file upload in the package manager frontend.' => 'Омогућава слање датотека у управљачу пакетима приступног система.',
        'Enables or disables the caching for templates. WARNING: Do NOT disable template caching for production environments for it will cause a massive performance drop! This setting should only be disabled for debugging reasons!' =>
            'Активира или деактивира кеширање за шаблоне. УПОЗОРЕЊЕ: НЕМОЈТЕ искључивати кеширање шаблона на системима у раду јер ће то довести до огромног пада перформанси. Ово подешавање треба користити само у циљу налажења и отклањања грешака!',
        'Enables or disables the debug mode over frontend interface.' => 'Укључује или искључује мод тражења грешака преко приступног интерфејса.',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            'Активира или искључује могућност надзора тикета, ради праћења тикета без власника или одговорне особе.',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            'Омогућује логовање перформанси (време извршавања стране). Утиче на перформансе система. Опција Frontend::Module###AdminPerformanceLog мора бити омогућена.',
        'Enables spell checker support.' => 'Омогућава подршку за проверу правописа.',
        'Enables the minimal ticket counter size (if "Date" was selected as TicketNumberGenerator).' =>
            'Активира минималну величину бројача тикета (ако је изабран „датум” као генератор броја тикета).',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            'Активира функцију масовне акције на тикетима за оператерски приступни систем на више тикета истовремено.',
        'Enables ticket bulk action feature only for the listed groups.' =>
            'Активира функцију масовне акције на тикетима само за излистане групе.',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            'Активира функцију одговорног за тикет ради евидентирања специфичног тикета',
        'Enables ticket watcher feature only for the listed groups.' => 'Активира функцију надзора тикета само за излистане групе.',
        'English (Canada)' => 'Енглески (Канада)',
        'English (United Kingdom)' => 'Енглески (Уједињено Краљевство)',
        'English (United States)' => 'Енглески (Сједињене Државе)',
        'English stop words for fulltext index. These words will be removed from the search index.' =>
            'Енглеске зауставне речи за индекс претраге комплетног текста. Ове речи ће бити уклоњене из индекса претраге.',
        'Enroll process for this ticket' => 'Упиши процес за овај тикет',
        'Enter your shared secret to enable two factor authentication.' =>
            'Унесите свој дељени тајни кључ за двофакторски модул за идентификацију.',
        'Escalation response time finished' => 'Истекло време одговора на ескалацију',
        'Escalation response time forewarned' => 'Претходно упозорење за време одговора на ескалацију',
        'Escalation response time in effect' => 'Актуелно време одговора на ескалацију',
        'Escalation solution time finished' => 'Истекло време решавања ескалације',
        'Escalation solution time forewarned' => 'Претходно упозорење за време решавања ескалације',
        'Escalation solution time in effect' => 'Актуелно време решавања ескалације',
        'Escalation update time finished' => 'Истекло време ажурирања ескалације',
        'Escalation update time forewarned' => 'Претходно упозорење за време ажурирања ескалације',
        'Escalation update time in effect' => 'Актуелно време ажурирања ескалације',
        'Escalation view' => 'Преглед ескалација',
        'EscalationTime' => 'Време ескалације',
        'Estonian' => 'Естонски',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate).' =>
            'Регистрација модула догађаја. За бољи учинак можете дефинисати догађај окидач (нпр Догађај => КреирањеТикета).',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            'Регистрација модула догађаја. За бољи учинак можете дефинисати догађај окидач (нпр Догађај => КреирањеТикета). Ово је могуће само ако свим динамичким пољима тикета треба исти догађај.',
        'Event module that performs an update statement on TicketIndex to rename the queue name there if needed and if StaticDB is actually used.' =>
            'Модул догађаја који извршава ажурирање на индексу тикета ради промене назива реда ако је потребно и ако је стварно употребљена статичка база података.',
        'Event module that updates customer user search profiles if login changes.' =>
            'Модул догaђаја који ажурира профиле претраге клијент корисника ако се промени пријава.',
        'Event module that updates customer user service membership if login changes.' =>
            'Модул догађаја који ажурира сервисно чланство клијента корисника ако се промени пријава.',
        'Event module that updates customer users after an update of the Customer.' =>
            'Модул догађаја који ажурира клијента корисника после ажурирања клијента.',
        'Event module that updates tickets after an update of the Customer User.' =>
            'Модул догађаја који ажурира тикете после ажурирања клијента корисника.',
        'Event module that updates tickets after an update of the Customer.' =>
            'Модул догађаја који ажурира тикете после ажурирања корисника.',
        'Events Ticket Calendar' => 'Календар догађаја тикета',
        'Execute SQL statements.' => 'Изврши SQL наредбе.',
        'Executes a custom command or module. Note: if module is used, function is required.' =>
            'Извршава прилагођену команду или модул. Напомена: ако је употребљен модул, функција је неопходна.',
        'Executes follow-up checks on In-Reply-To or References headers for mails that don\'t have a ticket number in the subject.' =>
            'Извршава провере за наставак тикета на In-Reply-To или References заглављима имејла који немају број тикета у предмету.',
        'Executes follow-up checks on attachment contents for mails that don\'t have a ticket number in the subject.' =>
            'Извршава проверу настављања у садржају прилога за имејлове који немају број тикета у предмету.',
        'Executes follow-up checks on email body for mails that don\'t have a ticket number in the subject.' =>
            'Извршава проверу настављања у садржају имејла за поруке које немају број тикета у предмету.',
        'Executes follow-up checks on the raw source email for mails that don\'t have a ticket number in the subject.' =>
            'Извршава проверу настављања у сировом извору имејла за имејлове који немају број тикета у предмету.',
        'Exports the whole article tree in search result (it can affect the system performance).' =>
            'Извози цело стабло чланака у резултат претраге (може озбиљно да утиче на перформансе система).',
        'Fetch emails via fetchmail (using SSL).' => 'Преузима имејлове преко fetchmail програма (путем SSL).',
        'Fetch emails via fetchmail.' => 'Преузима имејлове преко fetchmail програма.',
        'Fetch incoming emails from configured mail accounts.' => 'Преузимање ',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            'Преузима пакете преко proxy сервера. Преиначује опцију „WebUserAgent::Proxy”.',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.' =>
            'Датотека за приказ у модулу Kernel::Modules::AgentInfo, уколико је снимљена под Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Филтер за отклањање грешака у „ACL” листама. Напомена: атрибути тикета могу бити додати у формату <OTRS_TICKET_Attribute> нпр. <OTRS_TICKET_Priority>.',
        'Filter for debugging Transitions. Note: More filters can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Филтер за отклањање грешака код транзиција. Напомена: филтери могу бити додати у формату <OTRS_TICKET_Attribute> нпр. <OTRS_TICKET_Priority>.',
        'Filter incoming emails.' => 'Филтрирање долазних порука.',
        'Finnish' => 'Фински',
        'First Queue' => 'Први ред',
        'FirstLock' => 'FirstLock',
        'FirstResponse' => 'FirstResponse',
        'FirstResponseDiffInMin' => 'FirstResponseDiffInMin',
        'FirstResponseInMin' => 'FirstResponseInMin',
        'Firstname Lastname' => 'Име Презиме',
        'Firstname Lastname (UserLogin)' => 'Име Презиме (Пријава корисника)',
        'FollowUp for [%s]. %s' => 'Наставак за [%s]. %s',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            'Намеће шифрирање одлазних имејлова (7bit|8bit|quoted-printable|base64).',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            'Намеће избор различитог статуса тикета (од актуелног) после акције закључавања. Дефинише актуелни статус као кључ, а следећи статус после закључавања као садржај.',
        'Forces to unlock tickets after being moved to another queue.' =>
            'Принудно откључава тикете после премештања у други ред.',
        'Forwarded to "%s".' => 'Прослеђено „%s”.',
        'French' => 'Француски',
        'French (Canada)' => 'Француски (Канада)',
        'French stop words for fulltext index. These words will be removed from the search index.' =>
            'Француске зауставне речи за индекс претраге комплетног текста. Ове речи ће бити уклоњене из индекса претраге.',
        'Frontend' => 'Интерфејс',
        'Frontend module registration (disable AgentTicketService link if Ticket Serivice feature is not used).' =>
            'Регистрација модула приступа (онемогућите везу „AgentTicketService” ако се не користи Тикет сервис).',
        'Frontend module registration (disable company link if no company feature is used).' =>
            'Регистрација модула приступа (онемогућите везу „предузеће” ако се не користи својство предузеће).',
        'Frontend module registration (disable ticket processes screen if no process available) for Customer.' =>
            'Регистрација модула приступа (онемогућите екран процеса тикета ако процес није расположив) за Клијента.',
        'Frontend module registration (disable ticket processes screen if no process available).' =>
            'Регистрација модула приступа (онемогућите екран процеса тикета ако процес није расположив).',
        'Frontend module registration for the agent interface.' => 'Регистрација модула приступа за интерфејс оператера.',
        'Frontend module registration for the customer interface.' => 'Регистрација модула приступа за интерфејс клијента.',
        'Frontend theme' => 'Изглед приступног система',
        'Full value' => 'Цела вредност',
        'Fulltext index regex filters to remove parts of the text.' => 'Текст индекс RegEx филтери за уклањање делова текста.',
        'Fulltext search' => 'Текст за претрагу',
        'Galician' => 'Галицијски',
        'General ticket data shown in the ticket overviews (fall-back). Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note that TicketNumber can not be disabled, because it is necessary.' =>
            'Општи подаци тикета приказани у прегледу тикета (резерва). Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Омогућено (подразумевано). Напомињемо да TicketNumber не може бити онемогућен, јер је неопходан.',
        'Generate dashboard statistics.' => 'Генериши статистике контролне табле.',
        'Generic Info module.' => 'Општи информациони модул',
        'GenericAgent' => 'Општи оператер',
        'GenericInterface Debugger GUI' => 'Општи интерфејс - ГКИ отклањања грешака.',
        'GenericInterface Invoker GUI' => 'Општи интерфејс - ГКИ позиваоца.',
        'GenericInterface Operation GUI' => 'Општи интерфејс - оперативни ГКИ.',
        'GenericInterface TransportHTTPREST GUI' => 'Општи интерфејс - ГКИ REST HTTP транспорта.',
        'GenericInterface TransportHTTPSOAP GUI' => 'Општи интерфејс - ГКИ SOAP HTTP транспорта.',
        'GenericInterface Web Service GUI' => 'Општи интерфејс - ГКИ веб сервиса.',
        'GenericInterface Webservice History GUI' => 'Општи интерфејс - ГКИ историјата веб сервиса.',
        'GenericInterface Webservice Mapping GUI' => 'Општи интерфејс - ГКИ мапирање веб сервиса.',
        'GenericInterface module registration for the invoker layer.' => 'Регистрација модула општег интерфејса за слој позиваоца.',
        'GenericInterface module registration for the mapping layer.' => 'Регистрација модула општег интерфејса за слој мапирања.',
        'GenericInterface module registration for the operation layer.' =>
            'Регистрација модула општег интерфејса за оперативни слој.',
        'GenericInterface module registration for the transport layer.' =>
            'Регистрација модула општег интерфејса за транспортни слој.',
        'German' => 'Немачки',
        'German stop words for fulltext index. These words will be removed from the search index.' =>
            'Немачке зауставне речи за индекс претрагу комплетног текста. Ове речи ће бити уклоњене из индекса претраге.',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files.' =>
            'Омогућава крајњим корисницима да замене сепаратор за CSV датотеке, дефинисан у датотекама превода.',
        'Global Search Module.' => 'Модул опште претраге',
        'Go back' => 'Иди назад',
        'Google Authenticator' => 'Гугл аутентификација',
        'Graph: Bar Chart' => 'График: Тракасти графикон',
        'Graph: Line Chart' => 'График: Линијски графикон',
        'Graph: Stacked Area Chart' => 'График: Наслагани просторни графикон',
        'Greek' => 'Грчки',
        'HTML Reference' => '„HTML” Референца',
        'HTML Reference.' => '„HTML” Референца.',
        'Hebrew' => 'Хебрејски',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). Runtime will do full-text searches on live data (it works fine for up to 50.000 tickets). StaticDB will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild".' =>
            'Омогућује проширену текстуалну претрагу ваших чланака (претрага по пољима Од, За, Cc, Предмет и Садржај). RuntimeDB ће вршити претрагу постојећих података (даје добре перформансе за до 50.000 тикета). StaticDB ће игнорисати све чланке и направиће индекс претраге по креирању чланка, убрзавајући текстуалну претрагу за око 50%. За креирање почетног индекса користите „bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild”.',
        'Hindi' => 'Хинди',
        'Hungarian' => 'Мађарски',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            'Уколико је изабрано „DB” за Customer::AuthModule, могуће је подесити драјвер базе података (обично се користи аутоматско препознавање).',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            'Уколико је изабрано „DB” за Customer::AuthModule, могуће је подесити лозинку за табелу корисника.',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            'Уколико је изабрано „DB” за Customer::AuthModule, могуће је подесити корисничко име за табелу корисника.',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            'Уколико је изабрано „DB” за Customer::AuthModule, неопходно је подесити DSN за конекцију ка табели корисника.',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            'Уколико је изабрано „DB” за Customer::AuthModule, неопходно је подесити назив колоне за CustomerPassword у табели корисника.',
        'If "DB" was selected for Customer::AuthModule, the crypt type of passwords must be specified.' =>
            'Уколико је изабрано „DB” за Customer::AuthModule, неопходно је подесити начин енкрипције за лозинке.',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            'Уколико је изабрано „DB” за Customer::AuthModule, неопходно је подесити назив колоне за CustomerKey у табели корисника.',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            'Уколико је изабрано „DB” за Customer::AuthModule, неопходно је подесити назив табеле где се чувају кориснички подаци.',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            'Уколико је изабрано „DB” за SessionModule, неопходно је подесити назив табеле где ће се чувати подаци сесија.',
        'If "FS" was selected for SessionModule, a directory where the session data will be stored must be specified.' =>
            'Уколико је изабрано „FS” за SessionModule, неопходно је подесити назив директоријума где ће се чувати подаци сесија.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            'Уколико је подешен HTTPBasicAuth за Customer::AuthModule, можете подесити (путем RegExp) уклањање делова REMOTE_USER вредности (нпр. ради уклањања додатних домена). Напомена: $1 ће бити нови Login.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            'Уколико је „HTTPBasicAuth„ изабран за „Customer::AuthModule”, можете подесити уклањање почетних делова корисничких имена (нпр. за домене као example_domain\\user у user).',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            'Уколико је подешен LDAP за Customer::AuthModule и желите да додате суфикс сваком корисничком имену, дефинишите га овде, нпр. желите само user за корисничко име, али у вашем LDAP директоријуму постоји user@domain.',
        'If "LDAP" was selected for Customer::AuthModule and special paramaters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            'Уколико је подешен LDAP за Customer::AuthModule и неопходни су специјални параметри за Net::LDAP perl модул, можете их подесити овде. Погледајте „perldoc Net::LDAP” за више информација о параметрима.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            'Уколико је подешен LDAP за Customer::AuthModule и ваши корисници имају само анонимни приступ директоријуму, али желите да претражујете податке, можете подесити корисника који има приступ LDAP директоријуму. Лозинку овог корисника можете подесити овде.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            'Уколико је подешен LDAP за Customer::AuthModule и ваши корисници имају само анонимни приступ директоријуму, али желите да претражујете податке, можете подесити корисника који има приступ LDAP директоријуму. Лозинку овог корисника можете подесити овде.',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            'Уколико је подешен LDAP за Customer::AuthModule, BaseDN мора бити дефинисан.',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            'Уколико је подешен LDAP за Customer::AuthModule, адреса LDAP сервера мора бити дефинисана.',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            'Уколико је подешен LDAP за Customer::AuthModule, кориснички идентификатор мора бити дефинисан.',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            'Уколико је подешен LDAP за Customer::AuthModule, кориснички атрибути морају бити дефинисани. За LDAP posixGroups користите UID, за остале користите комплетан кориснички DN.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            'Уколико је подешен LDAP за Customer::AuthModule, овде можете дефинисати приступне параметре.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Уколико је подешен LDAP за Customer::AuthModule, можете дефинисати да ли ће апликација престати са радом уколико нпр. конекција са сервером не може бити остварена због проблема са мрежом.',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use OTRS. Specify the group, who may access the system.' =>
            'Уколико је подешен LDAP за Customer::AuthModule, можете проверити да ли је кориснику омогућена аутентикација ако припада posixGroup, нпр. корисник мора да припада групи xyz да би могао да користи OTRS. Дефинишите групу са приступом систему.',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            'Уколико је подешен LDAP за Customer::AuthModule, можете додати филтер сваком LDAP захтеву, нпр. (mail=*), (objectclass=user) или (!objectclass=computer).',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            'Уколико је подешен Radius за Customer::AuthModule, морате дефинисати лозинку за приступ Radius серверу.',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            'Уколико је подешен Radius за Customer::AuthModule, адреса Radius сервера мора бити дефинисана.',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Уколико је подешен Radius за Customer::AuthModule, можете дефинисати да ли ће апликација престати са радом уколико нпр. конекција са сервером не може бити остварена због проблема са мрежом.',
        'If "Sendmail" was selected as SendmailModule, the location of the sendmail binary and the needed options must be specified.' =>
            'Уколико је подешен Sendmail за SendmailModule, морате дефинисати локацију апликације sendmail и неопходне опције.',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            'Уколико је подешен SysLog за LogModule, може бити дефинисана посебна лог секција.',
        'If "SysLog" was selected for LogModule, a special log sock can be specified (on solaris you may need to use \'stream\').' =>
            'Уколико је подешен SysLog за LogModule, може бити дефинисан посебан лог прикључак (sock, на Соларису вероватно ћете морати користити \'stream\').',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            'Уколико је подешен SysLog за LogModule, може бити дефинисан карактерсет за логовање.',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            'Уколико је подешен File за LogModule, мора бити дефинисана локација лог датотеке. Уколико датотека не постоји, биће креирана од стране система.',
        'If active, none of the regular expressions may match the user\'s email address to allow registration.' =>
            'Ако је активно, ни један регуларни израз se не може поклопити са корисниковом имејл адресом да би дозволио регистрацију.',
        'If active, one of the regular expressions has to match the user\'s email address to allow registration.' =>
            'Ако је активно, један регуларни израз se мора поклопити са корисниковом имејл адресом да би дозволио регистрацију.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            'Ако је као модул за слање имејла изабран било који од „SMTP” механизама, а неопходна је аутентификација на имејл сервер, лозинка мора да буде наведена.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            'Ако је као модул за слање имејла изабран било који од „SMTP” механизама, а неопходна је аутентификација на имејл сервер, корисничко име мора да буде наведено.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            'Ако је као модул за слање имејла изабран било који од „SMTP” механизама, уређај који  шаље имејлове мора да буде наведен.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            'Ако је као „SendmailModule” модул изабран било који од „SMTP” механизама, порт на ком ваш имеј сервер слуша мора да буде наведен.',
        'If enabled debugging information for ACLs is logged.' => 'Ако је активирано, исправљање грешака за ACL се бележи.',
        'If enabled debugging information for transitions is logged.' => 'Ако је активирано, исправљање грешака за транзиције се бележи.',
        'If enabled the daemon will redirect the standard error stream to a log file.' =>
            'Ако је активирано сервис ће преусмерити стандардни ток грешке у датотеку дневника.',
        'If enabled the daemon will redirect the standard output stream to a log file.' =>
            'Ако је активирано сервис ће преусмерити стандардни излазни ток у датотеку дневника.',
        'If enabled, OTRS will deliver all CSS files in minified form. WARNING: If you turn this off, there will likely be problems in IE 7, because it cannot load more than 32 CSS files.' =>
            'Ако је активирано, „OTRS” ће испоручити све CSS датотеке у смањеној форми. УПОЗОРЕЊЕ: Уколико искључите ову опцију, највероватније ћете имати проблеме у IE 7, зато што није у стању да учита више од 32 CSS датотеке.',
        'If enabled, OTRS will deliver all JavaScript files in minified form.' =>
            'Ако је активирано, „OTRS” ће испоручити све јаваскрипт датотеке у смањеној форми.',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            'Ако је активирано, телефонски и имејл тикети ће бити отворени у новом прозору.',
        'If enabled, the OTRS version tag will be removed from the Webinterface, the HTTP headers and the X-Headers of outgoing mails. NOTE: If you change this option, please make sure to delete the cache.' =>
            'Ако је активирано, ознака „OTRS” верзије ће бити уклоњена из веб интерфејса, HTTP заглавља и „X-Headers” у одлазним имејл порукама. НАПОМЕНА: ако мењате ову опцију, молимо да осигурате брисање кеша.',
        'If enabled, the customer can search for tickets in all services (regardless what services are assigned to the customer).' =>
            'Ако је активирано, клијент може претраживати тикете у свим сервисима (без обзира на то који сервиси су додељени клијенту).',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            'Ако је активиринао, различити прегледи (Контролна табла, Закључавање, Редови) ће се аутоматски освежити после задатог времена.',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            'Ако је активирано, први ниво главног менија се отвара на прелаз миша (уместо само на клик).',
        'If no SendmailNotificationEnvelopeFrom is specified, this setting makes it possible to use the email\'s from address instead of an empty envelope sender (required in certain mail server configurations).' =>
            'Ако „SendmailNotificationEnvelopeFrom” није наведен, ова поставка омогућава коришћење адересе пошињаоца имејлова  уместо празног оквира заглавља (обавезно у поставкама неких имејл сервера).',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty (unless SendmailNotificationEnvelopeFrom::FallbackToEmailFrom is set).' =>
            'Ако је подешено ова адреса се користи као оквир заглавља пошиљаоца у одлазним обавештењима. Ако адреса није унета, оквир заглавља пошиљаоца је празан (осим ако је „SendmailNotificationEnvelopeFrom::FallbackToEmailFrom” подешен).',
        'If set, this address is used as envelope sender in outgoing messages (not notifications - see below). If no address is specified, the envelope sender is equal to queue e-mail address.' =>
            'Ако је подешено ова адреса се користи као оквир заглавља пошиљаоца у одлазним порукама (не за обавештења - види ниже). Ако адреса није унета, оквир заглавља пошиљаоца је једнак имејл адреси реда.',
        'If this option is enabled, then the decrypted data will be stored in the database if they are displayed in AgentTicketZoom.' =>
            'Ако је ова опција активирана, онда ће дешифровани подаци бити смештени у базу података ако су приказани на детаљном приказу тикета у интерфејсу оператера.',
        'If this option is set to \'Yes\', tickets created via the web interface, via Customers or Agents, will receive an autoresponse if configured. If this option is set to \'No\', no autoresponses will be sent.' =>
            'Ако је ова опција подешена као „Да”, тикети креирани преко веб интерфејса од стране клијената или оператера, ће ако је подешен добити аутоматски одговор. Ако је ова опција подешена као „Не”, аутоматски одговори неће бити слани.',
        'If this regex matches, no message will be send by the autoresponder.' =>
            'Ако се овај израз поклапа, аутоматски одговарач неће послати ниједну поруку.',
        'If this setting is active, local modifications will not be highlighted as errors in the package manager and support data collector.' =>
            'Ако је ова поставка активна, локалне измене неће бити наглашене као грешке у управљачу пакетима и сакупљачу података подршке.',
        'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.' =>
            '',
        'Ignore system sender article types (e. g. auto responses or email notifications) to be flagged as \'Unread Article\' in AgentTicketZoom or expanded automatically in Large view screens.' =>
            'Игнорише врсту пошиљаоца чланака (нпр. аутоматски одговори или имејл обавештења) приликом приказа непрочитаних чланака у детаљном прегледу тикета или аутоматског проширивања у великом екрану прегледа.',
        'Include tickets of subqueues per default when selecting a queue.' =>
            'Код избора реда, подразумевано укључи и тикете подредова.',
        'Include unknown customers in ticket filter.' => 'Укључите непознате клијенте у филтер тикета.',
        'Includes article create times in the ticket search of the agent interface.' =>
            'Укључује времена креирања тикета у претрагу на оператерском интерфејсу.',
        'Incoming Phone Call.' => 'Улазни телефонски позив.',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the command "bin/otrs.Console.pl Maint::Ticket::QueueIndexRebuild" for initial index creation.' =>
            'Убрзивач индексирања: за одабир TicketViewAccelerator позадинског модула. RuntimeDB генерише сваки преглед реда у ходу из табеле тикета (нема утицаја на перформансе до око 60.000 тикета укупно и 6.000 отворених тикета у систему). StaticDB је најмоћнији модул, користи додатну тикет индекс табелу која ради као преглед (препоручује се за више од 80.000 и 6.000 отворених тикета у систему). Коришћењем команде „bin/otrs.Console.pl Maint::Ticket::QueueIndexRebuild” можете креирати почетни индекс.',
        'Indonesian' => 'Индонежански',
        'Input' => 'Унос',
        'Install ispell or aspell on the system, if you want to use a spell checker. Please specify the path to the aspell or ispell binary on your operating system.' =>
            'Ако желите да користите проверу правописа инсталирајте „ispell” или „aspell” на систем. молимо да наведете путању до „ispell” или „aspell” датотеке на вашем оперативном сиситему.',
        'Interface language' => 'Jezik interfejsa',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Могуће је подесити различите изгледе за различите оператере, који се користе на нивоу домена у апликацији. Коришћењем регуларног израза (regex), можете подесити пар кључ/вредност за препознавање домена. Вредност у Key би требало да препозна домен, а вредност у Content би требало да буде важећи изглед у систему. Молимо консултујте примере за исправан облик регуларног израза.',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Могуће је подесити различите изгледе за различите кориснике, који се користе на нивоу домена у апликацији. Коришћењем регуларног израза (regex), можете подесити пар кључ/вредност за препознавање домена. Вредност у Key би требало да препозна домен, а вредност у Content би требало да буде важећи изглед у систему. Молимо консултујте примере за исправан облик регуларног израза.',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            'Могуће је подесити различите теме за различите оператере и кориснике, који се користе на нивоу домена у апликацији. Коришћењем регуларног израза (regex), можете подесити пар кључ/вредност за препознавање домена. Вредност у Key би требало да препозна домен, а вредност у Content би требало да буде важећа тема у систему. Молимо консултујте примере за исправан облик регуларног израза.',
        'Italian' => 'Италијански',
        'Italian stop words for fulltext index. These words will be removed from the search index.' =>
            'Италијанске зауставне речи за индекс претраге комплетног текста. Ове речи ће бити уклоњене из индекса претраге.',
        'Ivory' => 'Слоновача',
        'Ivory (Slim)' => 'Слоновача (упрошћено)',
        'Japanese' => 'Јапански',
        'JavaScript function for the search frontend.' => 'JavaScript функција за модул претраге.',
        'Last customer subject' => 'Последњи предмет поруке клијента',
        'Lastname Firstname' => 'Презиме, Име',
        'Lastname Firstname (UserLogin)' => 'Презиме, Име (Пријава корисника)',
        'Lastname, Firstname' => 'Презиме, Име',
        'Lastname, Firstname (UserLogin)' => 'Презиме, Име (Пријава корисника)',
        'Latvian' => 'Летонски',
        'Left' => 'Лево',
        'Link Object' => 'Повежи објекат',
        'Link Object.' => 'Повежи објекат.',
        'Link agents to groups.' => 'Повежи оператере са гупама.',
        'Link agents to roles.' => 'Повежи оператере са улогама.',
        'Link attachments to templates.' => 'Повежи прилоге са шаблонима',
        'Link customer user to groups.' => 'Повежи клијента корисника са групама',
        'Link customer user to services.' => 'Повежи клијенте кориснике са услугама.',
        'Link queues to auto responses.' => 'Повежи редове са аутоматским одговорима.',
        'Link roles to groups.' => 'Повежи улоге са групама.',
        'Link templates to queues.' => 'Повежи шаблоне са редовима',
        'Links 2 tickets with a "Normal" type link.' => 'Повежи 2 тикета типом везе „Normal”.',
        'Links 2 tickets with a "ParentChild" type link.' => 'Повежи 2 тикета типом везе „ParentChild”.',
        'List of CSS files to always be loaded for the agent interface.' =>
            'Листа CSS директоријума увек учитаних за интерфејс оператера.',
        'List of CSS files to always be loaded for the customer interface.' =>
            'Листа CSS датотека које се увек учитавају за интерфејс клијента.',
        'List of JS files to always be loaded for the agent interface.' =>
            'Листа JS директоријума увек учитаних за интерфејс оператера.',
        'List of JS files to always be loaded for the customer interface.' =>
            'Листа JS датотека које се увек учитавају за интерфејс клијента.',
        'List of all CustomerCompany events to be displayed in the GUI.' =>
            'Листа свих догађаја за Фирму клијента која ће бити приказана у ГКИ.',
        'List of all CustomerUser events to be displayed in the GUI.' => 'Листа свих догађаја за клијента корисника која ће бити приказана у ГКИ.',
        'List of all DynamicField events to be displayed in the GUI.' => 'Листа свих догађаја на динамичким пољима која ће бити приказана у ГКИ',
        'List of all Package events to be displayed in the GUI.' => 'Листа свих догађаја на пакетима која ће бити приказана у ГКИ',
        'List of all article events to be displayed in the GUI.' => 'Листа свих догађаја на чланцима која ће бити приказана у ГКИ',
        'List of all queue events to be displayed in the GUI.' => 'Листа свих догађаја у реду који ће бити приказани у ГКИ.',
        'List of all ticket events to be displayed in the GUI.' => 'Листа свих догађаја на тикетима која ће бити приказана у ГКИ',
        'List of default Standard Templates which are assigned automatically to new Queues upon creation.' =>
            'Листа подразумеваних стандардних шаблона који се аутоматски додељију новом Реду након креирања.',
        'List of responsive CSS files to always be loaded for the agent interface.' =>
            'Листа прилагодљивих CSS датотека увек учитаних за интерфејс оператера.',
        'List of responsive CSS files to always be loaded for the customer interface.' =>
            'Листа прилагодљивих CSS датотека увек учитаних за интерфејс клијента.',
        'List view' => 'Преглед листе',
        'Lithuanian' => 'Литвански',
        'Lock / unlock this ticket' => 'Закључај / откључај овај тикет',
        'Locked Tickets.' => 'Закључани тикети.',
        'Locked ticket.' => 'Закључан тикет.',
        'Log file for the ticket counter.' => 'Датотека дневника за бројач тикета.',
        'Logout of customer panel.' => 'Одјава са клијентског панела.',
        'Loop-Protection! No auto-response sent to "%s".' => 'Заштита од петље! Аутоматски одговор није послат на „%s”.',
        'Mail Accounts' => 'Имејл налози',
        'Main menu registration.' => 'Регистрација главног менија.',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            'Проверава MX запис имејл адресе пре слања поруке или телефонских или имејл тикета.',
        'Makes the application check the syntax of email addresses.' => 'Приморава апликацију да проверава синтаксу имејл адереса.',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            'Одређује да ли сесије користе HTML колачиће. Уколико су колачићи искључени или клијентски претраживач их не подржава, систем ће радити уобичајено и додаваће ИД сесије у свим везама.',
        'Malay' => 'Малајски',
        'Manage OTRS Group cloud services.' => 'Управљај услугама у облаку „OTRS” Групе.',
        'Manage PGP keys for email encryption.' => 'Управљај „PGP” кључевима за имејл енкрипцију.',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'Управљање ПОП3 или ИМАП налозима за преузимање емаил-а од.',
        'Manage S/MIME certificates for email encryption.' => 'Управљај S/MIME сертификатима за имеј енкрипцију.',
        'Manage existing sessions.' => 'Управљање постојећим сесијама.',
        'Manage support data.' => 'Управљање подацима подршке.',
        'Manage system registration.' => 'Управљање систем регистрацијом.',
        'Manage tasks triggered by event or time based execution.' => 'Управља задацима покренутим од догађаја или на основу временског извршавања.',
        'Mark this ticket as junk!' => 'Означи овај тикет као бесмислен „junk”!',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            'Максимална дужина (у знацима) клијентске инфо табеле (телефон и имејл) на екрану писања имејла.',
        'Max size (in rows) of the informed agents box in the agent interface.' =>
            'Максимална величина (у редовима) оквира информисаних оператера у оператерском интерфејсу.',
        'Max size (in rows) of the involved agents box in the agent interface.' =>
            'Максимална величина (у редовима) оквира укључених оператера у оператерском интерфејсу.',
        'Max size of the subjects in an email reply and in some overview screens.' =>
            'Максимална величина предмета у имејл одговору и неким екранима прегледа.',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            'Мксимум аутоматских имејл одговора дневно на сопствену адресу (Заштита од петље)',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            'Максимална величина у килобајтима за имејлове који могу бити преузети преко „POP3/POP3S/IMAP/IMAPS (KBytes)”.',
        'Maximum Number of a calendar shown in a dropdown.' => 'Максимални број календара приказан у листи.',
        'Maximum length (in characters) of the dynamic field in the article of the ticket zoom view.' =>
            'Максимална дужина (у знацима) динамичког поља у чланку на детаљном прегледу тикета.',
        'Maximum length (in characters) of the dynamic field in the sidebar of the ticket zoom view.' =>
            'Максимална дужина (у знацима) динамичког поља у бочној траци на детаљном прегледу тикета.',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            'Максимални број тикета који ће бити приказани у резултату претраге у интерфејсу оператера.',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            'Максимални број тикета који ће бити приказани у резултату претраге у интерфејсу клијента.',
        'Maximum number of tickets to be displayed in the result of this operation.' =>
            'Максимални број тикета који ће бити приказани у резултату ове операције.',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            'Максимална дужина (у знацима) клијентске инфо табеле на детаљном прегледу тикета.',
        'Merge this ticket and all articles into a another ticket' => 'Споји овај тикет и све чланке у други тикет',
        'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.' => 'Тикет <OTRS_TICKET> спојен у <OTRS_MERGE_TO_TICKET>.',
        'Miscellaneous' => 'Разно',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            'Модул за избор примаоца (За:) у приказу новог тикета у интерфејсу клијента.',
        'Module to check if arrived emails should be marked as email-internal (because of original forwarded internal email). ArticleType and SenderType define the values for the arrived email/article.' =>
            'Модул за проверу да ли пристигли имејлови треба да буду изначени као интерни (на основу оргиналног имејла прослеђивања). Тип чланка и тип пошиљаоца дефинишу вредности за примљени имејл/чланак.',
        'Module to check the group permissions for customer access to tickets.' =>
            'Модул за проверу групних дозвола за клијентски приступ тикетима.',
        'Module to check the group permissions for the access to tickets.' =>
            'Модул за проверу групних дозвола за приступ тикетима.',
        'Module to compose signed messages (PGP or S/MIME).' => 'Модул за израду потписане поруке („PGP” или „S/MIME”).',
        'Module to crypt composed messages (PGP or S/MIME).' => 'Модул за шифрирање написане поруке („PGP” или „S/MIME”).',
        'Module to fetch customer users SMIME certificates of incoming messages.' =>
            'Модул за извлачење корисничких SMIME сертификата из долазних порука.',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            'Модул за филтрирање и руковање долазним порукама. Блокирање/игнорисање свих непожељних имејлова Од: „noreply@” адресе',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            'Модул за филтрирање и руковање долазним порукама. Узмите број са 4 цифре за слободни текст тикета, употребите регуларни израз за поклапање, нпр Од: => \'(.+?)@.+?\', и употребите () као [***] у Постави =>.',
        'Module to filter encrypted bodies of incoming messages.' => 'Модул за филтрирање шифрираног садржаја долазних порука.',
        'Module to generate accounted time ticket statistics.' => 'Модул за генерисање статистике обрачунатог времена тикета.',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            'Модул за генерисање „HTML OpenSearch” профила за кратку претрагу тикета у профилу оператера.',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            'Модул за генерисање „HTML OpenSearch” профила за кратку претрагу тикета у профилу клијента.',
        'Module to generate ticket solution and response time statistics.' =>
            'Модул за генерисање статистике решавања тикета и времена одговора.',
        'Module to generate ticket statistics.' => 'Модул за генерисање статистике тикета.',
        'Module to grant access if the CustomerID of the ticket matches the CustomerID of the customer.' =>
            'Модул за доделу приступа ако се ИД клијента тикета поклапа са ИД клијента.',
        'Module to grant access if the CustomerUserID of the ticket matches the CustomerUserID of the customer.' =>
            'Модул за доделу приступа ако се ИД клијента корисика тикета поклапа са ИД кориника клијента за клијента. ',
        'Module to grant access to any agent that has been involved in a ticket in the past (based on ticket history entries).' =>
            'Модул за доделу приступа било ком оператеру ангажованом на тикету у прошлости (базирано на ставкама историјата тикета).',
        'Module to grant access to the agent responsible of a ticket.' =>
            'Модул за доделу приступа тикету за одговорног оператера.',
        'Module to grant access to the creator of a ticket.' => 'Модул за доделу приступа тикету за креатора тикета.',
        'Module to grant access to the owner of a ticket.' => 'Модул за доделу приступа тикету за власника.',
        'Module to grant access to the watcher agents of a ticket.' => 'Модул за доделу приступа тикету за надзорног оператера.',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            'Модул за приказ обавештења и ескалација (ShownMax: највећи приказан број ексалација, EscalationInMinutes: приказ тикета који ће ескалирати, CacheTime: кеш израчунатих ескалација у секундама).',
        'Module to use database filter storage.' => 'Модул за смештај филтера у базу података.',
        'Multiselect' => 'Вишеструки избор',
        'My Services' => 'Моје услуге',
        'My Tickets.' => 'Моји тикети.',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            'Назив наменског реда. Наменски ред је избор редова по вашој жељи и може се изабрати у подешавањима.',
        'Name of custom service. The custom service is a service selection of your preferred services and can be selected in the preferences settings.' =>
            'Назив наменског сервиса. Наменски сервис је избор сервиса по вашој жељи и може се изабрати у подешавањима.',
        'NameX' => 'ИмеХ',
        'Nederlands' => 'Холандски',
        'New Ticket [%s] created (Q=%s;P=%s;S=%s).' => 'Нови тикет [%s] отворен (Q=%s;P=%s;S=%s).',
        'New Window' => 'Нови прозор',
        'New owner is "%s" (ID=%s).' => 'Нови власник је „%s” (ID=%s).',
        'New process ticket' => 'Нови тикет процеса',
        'New responsible is "%s" (ID=%s).' => 'Нови одговорни је „%s” (ID=%s).',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Следећи могући статус тикета након додавања телефонске напомене у приказу екрана долазних позива интерфејса оператера.',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Следећи могући статус тикета након додавања телефонске напомене у приказу екрана одлазних позива интерфејса оператера.',
        'None' => 'Ни један',
        'Norwegian' => 'Норвешки',
        'Notification sent to "%s".' => 'Послато обавештења кориснику „%s”.',
        'Number of displayed tickets' => 'Број приказаних тикета',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            'Број линија (по тикету) приказаних према услужној претрази у интерфејсу оператера.',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            'Број тикета који ће бити приказани на свакој страни резултата претраге у интерфејсу оператера.',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            'Број тикета који ће бити приказани на свакој страни резултата претраге у интерфејсу клијента.',
        'OTRS can use one or more readonly mirror databases for expensive operations like fulltext search or statistics generation. Here you can specify the DSN for the first mirror database.' =>
            'OTRS може да користи једну или више пресликаних база података за скупе операције као што су претрага текста или генерисање статистика. Овде можете дефинисати DSN за прву пресликану базу података.',
        'Old: "%s" New: "%s"' => 'Старо: „%s” Ново: „%s”',
        'Online' => 'На мрежи',
        'Open tickets (customer user)' => 'Отворени тикети (клијент корисник)',
        'Open tickets (customer)' => 'Отворени тикети (клијент)',
        'Option' => 'Опција',
        'Optional queue limitation for the CreatorCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Опционо ограничење приступа редовима за CreatorCheck модул пермисија. Уколико је подешено, приступ ће бити дозвољен само за тикете у дефинисаним редовима.',
        'Optional queue limitation for the InvolvedCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Опционо ограничење приступа редовима за InvolvedCheck модул пермисија. Уколико је подешено, приступ ће бити дозвољен само за тикете у дефинисаним редовима.',
        'Optional queue limitation for the OwnerCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Опционо ограничење приступа редовима за OwnerCheck модул пермисија. Уколико је подешено, приступ ће бити дозвољен само за тикете у дефинисаним редовима.',
        'Optional queue limitation for the ResponsibleCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Опционо ограничење приступа редовима за ResponsibleCheck модул пермисија. Уколико је подешено, приступ ће бити дозвољен само за тикете у дефинисаним редовима.',
        'Out Of Office' => 'Ван канцеларије',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            'Преоптерећује (редефинисано) постојеће фуцкције у Kernel::System::Ticket. Користи се за лако додавање прилагођавања.',
        'Overview Escalated Tickets.' => 'Преглед ескалираних тикета.',
        'Overview Refresh Time' => 'Преглед времена освежавања',
        'Overview of all escalated tickets.' => 'Преглед свих ескалираних тикета.',
        'Overview of all open Tickets.' => 'Преглед свих отворених тикета.',
        'Overview of all open tickets.' => 'Преглед свих отворених тикета.',
        'Overview of customer tickets.' => 'Преглед клијентских тикета.',
        'PGP Key Management' => 'Управљање „PGP” кључем',
        'PGP Key Upload' => 'Слање „PGP” кључа',
        'Package event module file a scheduler task for update registration.' =>
            'Датотека пакета модула догађаја за задатак планера за ажурирање регистрације.',
        'Parameters for the CreateNextMask object in the preference view of the agent interface.' =>
            'Параметри за CreateNextMask објекат у приказу подешавања у интерфејсу оператера.',
        'Parameters for the CustomQueue object in the preference view of the agent interface.' =>
            'Параметри за CustomQueue објекат у приказу подешавања у интерфејсу оператера.',
        'Parameters for the CustomService object in the preference view of the agent interface.' =>
            'Параметри за CustomService објекат у приказу подешавања у интерфејсу оператера.',
        'Parameters for the RefreshTime object in the preference view of the agent interface.' =>
            'Параметри за RefreshTime објекат у приказу подешавања у интерфејсу оператера.',
        'Parameters for the column filters of the small ticket overview.' =>
            'Параметри за филтер колона у прегледу тикета „мало”.',
        'Parameters for the dashboard backend of the customer company information of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметри за позадински приказ контролне табле фирме клијента у интерфејсу оператера. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Parameters for the dashboard backend of the customer id status widget of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметри за позадински приказ контролне табле ИД клијента у интерфејсу оператера. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Parameters for the dashboard backend of the customer user list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметри за позадински приказ контролне табле листе корисника у интерфејсу оператера. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Параметри за позадински приказ контролне табле прегледа нових тикета у интерфејсу оператера. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка. Напомена: Само атрибути тикета и динамичка поља („DynamicField_NameX”) су дозвољени за DefaultColumns. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено.',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Параметри за позадински приказ контролне табле прегледа отворених тикета у интерфејсу оператера. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка. Напомена: Само атрибути тикета и динамичка поља („DynamicField_NameX”) су дозвољени за DefaultColumns. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено.',
        'Parameters for the dashboard backend of the queue overview widget of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "QueuePermissionGroup" is not mandatory, queues are only listed if they belong to this permission group if you enable it. "States" is a list of states, the key is the sort order of the state in the widget. "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметри за позадински приказ контролне табле прегледа редова у интерфејсу оператера. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „QueuePermissionGroup” није обавезно, редови ће бити излистани само ако припадају дефинисаној групи. „States” је листа стања, кључ се користи за редослед стања у додатку. „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Parameters for the dashboard backend of the running process tickets overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметри за позадински приказ контролне табле прегледа активних процес тикета у интерфејсу оператера. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Параметри за позадински приказ контролне табле прегледа ескалација у интерфејсу оператера. „Limit” је подразумевани број приказаних ескалација. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка. Напомена: Само атрибути тикета и динамичка поља („DynamicField_NameX”) су дозвољени за DefaultColumns. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено.',
        'Parameters for the dashboard backend of the ticket events calendar of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметри за позадински приказ контролне табле календара догађаја тикета у интерфејсу оператера. „Limit” је подразумевани број приказаних ескалација. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Параметри за позадински приказ контролне табле прегледа тикета на чекању у интерфејсу оператера. „Limit” је подразумевани број приказаних ескалација. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка. Напомена: Само атрибути тикета и динамичка поља („DynamicField_NameX”) су дозвољени за DefaultColumns. Могућа подешавања: 0 = Онемогућено, 1 = Доступно, 2 = Подразумевано омогућено.',
        'Parameters for the dashboard backend of the ticket stats of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметри за позадински приказ контролне табле статистике тикета у интерфејсу оператера. „Limit” је подразумевани број приказаних ескалација. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Parameters for the dashboard backend of the upcoming events widget of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметри за позадински приказ контролне табле предстојећих догађаја у интерфејсу оператера. „Limit” је подразумевани број приказаних ескалација. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутима за кеш додатка.',
        'Parameters for the pages (in which the dynamic fields are shown) of the dynamic fields overview.' =>
            'Параметри страница (на којима су динамичка поља видљива) прегледа динамичких поља.',
        'Parameters for the pages (in which the tickets are shown) of the medium ticket overview.' =>
            'Параметри страница (на којима су тикети видљиви) средњег прегледа тикета.',
        'Parameters for the pages (in which the tickets are shown) of the small ticket overview.' =>
            'Параметри страница (на којима су тикети видљиви) смањеног прегледа тикета.',
        'Parameters for the pages (in which the tickets are shown) of the ticket preview overview.' =>
            'Параметри страница (на којима су тикети видљиви) приказа  прегледа тикета.',
        'Parameters of the example SLA attribute Comment2.' => 'Параметри за пример атрибута „SLA” коментара 2.',
        'Parameters of the example queue attribute Comment2.' => 'Параметри за пример атрибута ред коментара 2.',
        'Parameters of the example service attribute Comment2.' => 'Параметри за пример атрибута сервис коментара 2.',
        'ParentChild' => 'ParentChild',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            'Путања до датотеке дневника (важи једино ако је за „LoopProtectionModule” изабрано „FS” и постављено као обавезно).',
        'People' => 'Особе',
        'Performs the configured action for each event (as an Invoker) for each configured Webservice.' =>
            'Извршава подешену акцију за сваки догађај (као позиваоц) за сваки подешени веб сервис.',
        'Permitted width for compose email windows.' => 'Дозвољена ширина прозора за писање поруке.',
        'Permitted width for compose note windows.' => 'Дозвољена ширина прозора за писање напомене.',
        'Persian' => 'Персијски',
        'Phone Call.' => 'Телефонски позив.',
        'Picture Upload' => 'Отпремање слике',
        'Picture upload module.' => 'Модул за отпремање слике.',
        'Picture-Upload' => 'Отпремање слике',
        'Polish' => 'Пољски',
        'Portuguese' => 'Португалски',
        'Portuguese (Brasil)' => 'Португалски (Бразил)',
        'PostMaster Filters' => 'PostMaster филтери',
        'PostMaster Mail Accounts' => 'PostMaster мејл налози',
        'Process Management Activity Dialog GUI' => 'ГКИ дијалога активности управљања процесом',
        'Process Management Activity GUI' => 'ГКИ активности управљања процесом',
        'Process Management Path GUI' => 'ГКИ путање управљања процесом',
        'Process Management Transition Action GUI' => 'ГКИ транзиционе акције управљања процесом',
        'Process Management Transition GUI' => 'ГКИ транзиције управљања процесом',
        'Process Ticket.' => 'Процес тикет.',
        'Process pending tickets.' => 'Процес тикет на чекању.',
        'Process ticket' => 'Процес тикет',
        'ProcessID' => 'ИД процеса',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see http://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            'Заштита од CSRF експлоатације (Cross Site Request Forgery, за више информација погледајте http://en.wikipedia.org/wiki/Cross-site_request_forgery).',
        'Provides a matrix overview of the tickets per state per queue.' =>
            'Даје табеларни преглед тикета по стању и по реду.',
        'Queue view' => 'Преглед реда',
        'Rebuild the ticket index for AgentTicketQueue.' => 'Поново изради индекс тикета за оператерски ред тикета.',
        'Recognize if a ticket is a follow-up to an existing ticket using an external ticket number.' =>
            'Препознај да ли је тикет наставак постојећег тикета коришћењем екстерног броја тикета.',
        'Refresh interval' => 'Интервал освежавања',
        'Removed subscription for user "%s".' => 'Претплата за корисника „%s” искључена.',
        'Removes the ticket watcher information when a ticket is archived.' =>
            'Уклања информације посматрача тикета када се тикет архивира.',
        'Renew existing SMIME certificates from customer backend. Note: SMIME and SMIME::FetchFromCustomer needs to be active in SysConfig and customer backend needs to be configured to fetch UserSMIMECertificate attribute.' =>
            'Обнавља постојеће SMIME сертификате из позадинског приказа корисника. Напомена: SMIME и SMIME::FetchFromCustomer морају бити активни у конфигурацији и позадински приказ корисника мора бити подешен за преузимање UserSMIMECertificate атрибута.',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            'Замењује оригиналног пошиљаоца са имејл адресом актуелног клијента при креирању одговора у прозору за писање одговора интерфејса оператера.',
        'Reports' => 'Извештаји',
        'Reports (OTRS Business Solution™)' => 'Извештаји (OTRS Business Solution™)',
        'Reprocess mails from spool directory that could not be imported in the first place.' =>
            'Поново обради имејлове из директоријума реда чекања који први пут нису могли бити увезени.',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            'Потребне дозволе за промену клијента на тикету у интерфејсу оператера.',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана за затварање тикета у интерфејсу оператера.',
        'Required permissions to use the email outbound screen in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана одлазних имејлова у интерфејсу оператера.',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана за одбијање тикета у интерфејсу оператера.',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            'Потребне дозволе за употребу прозора за отварање тикета у интерфејсу оператера.',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана за прослеђивање тикета у интерфејсу оператера.',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана тикета слободног текста у интерфејсу оператера.',
        'Required permissions to use the ticket merge screen of a zoomed ticket in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана за спајање тикета при увећаном приказу тикета у интерфејсу оператера.',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана за напомене тикета у интерфејсу оператера.',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана власника тикета при увећаном приказу тикета у интерфејсу оператера.',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана тикета на чекању при увећаном приказу тикета у интерфејсу оператера.',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана тикета долазних позива у интерфејсу оператера.',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана тикета одлазних позива у интерфејсу оператера.',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана приоритетног тикета при увећаном приказу тикета у интерфејсу оператера.',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            'Потребне дозволе за употребу приказа екрана одговорног за тикет у интерфејсу оператера.',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            'Ресетује и откључава власника тикета ако је премештен у други ред.',
        'Responsible Tickets' => 'Одговорни тикети',
        'Responsible Tickets.' => 'Одговорни тикети.',
        'Restores a ticket from the archive (only if the event is a state change to any open available state).' =>
            'Враћа тикет из архиве (само ако је догађај промена стања на било које доступно отворено стање).',
        'Retains all services in listings even if they are children of invalid elements.' =>
            'Задржи све сервисе у листи чак иако су деца неважећих елемената.',
        'Right' => 'Десно',
        'Roles <-> Groups' => 'Улоге <-> Групе',
        'Run file based generic agent jobs (Note: module name need needs to be specified in -configuration-module param e.g. "Kernel::System::GenericAgent").' =>
            'Покреће послове генеричког оператера у модулима (Напомена: назив модула мора бити дефинисан у Module конфигурацији, нпр. „Kernel::System::GenericAgent”).',
        'Running Process Tickets' => 'Активни процес тикети',
        'Runs an initial wildcard search of the existing customer company when accessing the AdminCustomerCompany module.' =>
            'Покреће иницијалну џокер претрагу постојећих фирми клијената при приступу модулу AdminCustomerCompany.',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            'Покреће иницијалну џокер претрагу постојећих корисника при приступу модулу AdminCustomerUser.',
        'Runs the system in "Demo" mode. If set to "Yes", agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            'Покреће систем у „Demo” моду. Уколико је подешено на „Да”, оператери могу променити своја подешавања као што су избор језика и теме у интерфејсу оператера. Ове промене ће важити само за тренутну сесију. Оператерима неће бити омогућено да промене своје лозинке.',
        'Russian' => 'Руски',
        'S/MIME Certificate Upload' => 'Слање S/MIME сертификата',
        'SMS' => 'СМС',
        'SMS (Short Message Service)' => '„SMS” (Сервис кратких порука)',
        'Sample command output' => 'Пример командног излаза',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the OTRS user. You can switch between the modules even on a system that is already in production without any loss of data. Note: Searching for attachment names is not supported when "FS" is used.' =>
            'Чува прилоге у чланцима. „DB” снима све прилоге у бази података (непрепоручљиво за чување великих прилога). „FS” снима прилоге у систему датотека; ово је бржа опција, али веб сервер мора бити покренут под OTRS системским корисником. Дозвољена је промена модуле чак и на продукцијским системима без било каквог губитка података. Напомена: претрага прилога по називу није могућа када је „FS” у функцији.',
        'Schedule a maintenance period.' => 'Планирање периода одржавања.',
        'Screen' => 'Екран',
        'Search Customer' => 'Тражи клијента',
        'Search Ticket.' => 'Тражи тикет.',
        'Search Tickets.' => 'Претражи тикете.',
        'Search User' => 'Тражи корисника',
        'Search backend default router.' => 'Подразумевани рутер позадинског модула претраге.',
        'Search backend router.' => 'Рутер позадинског модула претраге.',
        'Search.' => 'Претрага.',
        'Second Queue' => 'Други Ред',
        'Select after which period ticket overviews should refresh automatically.' =>
            '',
        'Select how many tickets should be shown in overviews by default.' =>
            '',
        'Select the main interface language.' => '',
        'Select your frontend Theme.' => 'Изаберите тему интерфејса.',
        'Select your preferred layout for OTRS.' => '',
        'Selects the cache backend to use.' => 'Избор кеша који ће користити систем у позадини.',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            'Бира модул за руковање пренешеним датотекама преко веб интерфејса. „DB” складишти све пренешене датотеке у базу података, „FS” користи систем датотека.',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            'Дефинише модул за генерисање броја тикета. „AutoIncrement” увећава број тикета, ИД система и бројач се користе у ИДсистема.бројач формату (нпр. 1010138, 1010139). Са „Date” бројеви тикета ће бити генерисани преко тренутног датума, ИД система и бројача. Формат ће изгледати као година.месец.дан.ИДсистема.бројач (нпр. 2002070110101520, 2002070110101535). Са „DateChecksum” бројач ће бити додат као контролни број низу сачињеном од датума и ИД система. Контролни број ће се смењивати на дневном нивоу. Формат изгледа овако: година.месец.дан.ИДсистема.бројач.контролни-број (нпр. 2002070110101520, 2002070110101535). „Случајно” генерише бројеве тикета по слободном избору у формату „ИДсистема.случајно" (нпр. 100057866352, 103745394596).',
        'Send new outgoing mail from this ticket' => 'Пошаљи нови одлазни имејл из овог тикета',
        'Send notifications to users.' => 'Пошаљи обавештења корисницима.',
        'Sender type for new tickets from the customer inteface.' => 'Тип пошиљаоца за нове тикете из интерфејса клијента.',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            'Шаље обавештење о наставку само оператеру власнику, ако је тикет откључан (подразумевано је да шаље свим оператерима).',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            'Шаље све одлазне имејлове као невидљиве копије („bcc”) на одређену адресу. Молимо да ово користите само за резервне копије.',
        'Sends customer notifications just to the mapped customer.' => 'Шаље клијентска обавештења само мапираном клијенту.',
        'Sends registration information to OTRS group.' => 'Шаље регистрационе информације „OTRS” Групацији.',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            'Шаље обавештење за потсећање о откључаном тикету кад се достигне датум подсетника (шаље само власнику тикета).',
        'Sends the notifications which are configured in the admin interface under "Notfication (Event)".' =>
            'Шаље обавештења која су у административном интерфејсу конфигурисана под „Обавештење (догађај)”.',
        'Serbian Cyrillic' => 'Српски ћирилица',
        'Serbian Latin' => 'Српски латиница',
        'Service view' => 'Преглед услуге',
        'ServiceView' => 'ServiceView',
        'Set a new password by filling in your current password and a new one.' =>
            '',
        'Set minimum loglevel. If you select \'error\', just errors are logged. With \'debug\' you get all logging messages.' =>
            'Одредите најнижи ниво логовања. Уколико изаберете \'error\', биће логоване само грешке. Са \'debug\' добићете све поруке у логовима.',
        'Set sender email addresses for this system.' => 'Подеси системску адресу пошиљаоца.',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Подеси подразумевану висину (у пикселима) инлине HTML чланака у AgentTicketZoom.',
        'Set the limit of tickets that will be executed on a single genericagent job execution.' =>
            'Поставља ограничење колико ће тикета бити извршено у једном извршавању посла општег оператера.',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Подеси максималну висину (у пикселима) инлине HTML чланака у AgentTicketZoom.',
        'Set this to yes if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            'Постави ово на да ако верујете у све ваше јавне и приватне пгп кључеве, чак и ако нису потврђени поузданим потписом.',
        'Sets if SLA must be selected by the agent.' => 'Подешава ако SLA мора бити изабран од стране оператера.',
        'Sets if SLA must be selected by the customer.' => 'Подешава ако „SLA” мора бити изабран од стране клијента.',
        'Sets if note must be filled in by the agent. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Одређује да ли напомена мора бити попуњена од стране оператера. Ово понашање је могуће преиначити путем Ticket::Frontend::NeedAccountedTime.',
        'Sets if service must be selected by the agent.' => 'Подешава да ли услуга мора бити изабрана од стране оператера.',
        'Sets if service must be selected by the customer.' => 'Подешава да ли услуга мора бити изабрана од стране клијента.',
        'Sets if ticket owner must be selected by the agent.' => 'Подешава ако власник тикета мора бити изабран од стране оператера.',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            'Подешава време чекања тикета на 0 ако је стање промењено на стање које није чекање.',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            'Постави време у минутама (први ниво) за наглашавање редова који садрже нетакнуте тикете.',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            'Постави време у минутама (други ниво) за наглашавање редова који садрже нетакнуте тикете.',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            'Постави конфигурациони ниво за администратора. У зависности од конфигурационог нивоа, неке системске опције неће бити приказане. Конфигурациони нивои поређани растуће: Експерт, Напредни, Почетни. Што је виши ниво (нпр Почетни је највиши), мања је вероватноћа да корисник може да конфигурише систем тако да више није употребљив.',
        'Sets the count of articles visible in preview mode of ticket overviews.' =>
            'Подешава бројање чланака видњивих у моду приказа прегледа тикета.',
        'Sets the default article type for new email tickets in the agent interface.' =>
            'Одређује подразумевани тип чланка за нове имејл тикете на интерфејсу оператера.',
        'Sets the default article type for new phone tickets in the agent interface.' =>
            'Одређује подразумевани тип чланка за нове телефонске тикете на интерфејсу оператера.',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            'Поставља подразумевани садржај за напомене додате на екрану затварања тикета у интерфејсу оператера.',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            'Поставља подразумевани садржај за напомене додате на екрану померања тикета у интерфејсу оператера.',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            'Поставља подразумевани садржај за напомене додате на екрану напомене тикета у интерфејсу оператера.',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Поставља подразумевани садржај за напомене додате на екрану власника тикета у интерфејсу оператера.',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Поставља подразумевани садржај за напомене додате на екрану тикета на чекању на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Поставља подразумевани садржај за напомене додате на екрану приоритета тикета на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            'Поставља подразумевани садржај за напомене додате на екрану одговорног за тикет у интерфејсу оператера.',
        'Sets the default error message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Поставља подразумевану поруку грешке за пријавни екран у интерфејсу оператера и клијента, приказује се током активног периода одржавања.',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            'Поставља подразумевани тип везе за подељене тикете у интерфејсу оператера.',
        'Sets the default message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Поставља подразумевану поруку за пријавни екран у интерфејсу оператера и клијента, приказује се током активног периода одржавања.',
        'Sets the default message for the notification is shown on a running system maintenance period.' =>
            'Одређује подразумевану поруку за обавештење које се види током периода одржавања.',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            'Одређује подразумевани следећи статус за нове телефонске тикете у интерфејсу оператера.',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            'Одређује подразумевани следећи статус тикета, након креирања имејл тикета у интерфејсу оператера.',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            'Поставља подразумевани текст напомене за нове телефонске тикете. Нпр „Нови тикет из позива” у интерфејсу оператера.',
        'Sets the default priority for new email tickets in the agent interface.' =>
            'Одређује подразумевани приоритет новог имејл тикета а у интерфејсу оператера.',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            'Одређује подразумевани приоритет новог телефонског тикета а у интерфејсу оператера.',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            'Поставља подразумевани тип пошиљаоца за нове имејл тикете у интерфејсу оператера.',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            'Поставља подразумевани тип пошиљаоца за нове телефонске тикете у интерфејсу оператера.',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            'Одређује подразумевани предмет за нове имејл тикете (нпр „одлазни имејл”) у интерфејсу оператера.',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            'Одређује подразумевани предмет за нове телефонске тикете (нпр „телефонски позив”) у интерфејсу оператера.',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            'Одређује подразумевани предмет за напомене додате на приказу екрана затвореног тикета у интерфејсу оператера.',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            'Одређује подразумевани предмет за напомене додате на приказу екрана померања тикета у интерфејсу оператера.',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            'Одређује подразумевани предмет за напомене додате на приказу екрана напомена тикета у интерфејсу оператера.',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Одређује подразумевани предмет за напомене додате на детаљном приказу екрана власника тикета у интерфејсу оператера.',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Одређује подразумевани предмет за напомене додате на детаљном приказу екрана тикета на чекању у интерфејсу оператера.',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Одређује подразумевани предмет за напомене додате на детаљном приказу екрана приоритета тикета у интерфејсу оператера.',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            'Одређује подразумевани предмет за напомене додате на приказу екрана одговорног за тикет у интерфејсу оператера.',
        'Sets the default text for new email tickets in the agent interface.' =>
            'Одређује подразумевани текст новог имејл тикета а у интерфејсу оператера.',
        'Sets the display order of the different items in the preferences view.' =>
            'Одређује редослед приказа разних ставки у приказу подешавања.',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is logged out.' =>
            'Одређује време без активности (у секундама) пре него што сесија буде угашена а корисник одјављен.',
        'Sets the maximum number of active agents within the timespan defined in SessionActiveTime before a prior warning will be visible for the logged in agents.' =>
            'Поставља максимални број активних оператера у временском распону дефинисаном у SessionActiveTime пре него што обавештење буде видљиво за пријављене оператере.',
        'Sets the maximum number of active agents within the timespan defined in SessionActiveTime.' =>
            'Поставља максимални број активних оператера у временском распону дефинисаном у „SessionActiveTime”.',
        'Sets the maximum number of active customers within the timespan defined in SessionActiveTime.' =>
            'Поставља максимални број активних клијента у временском распону дефинисаном у „SessionActiveTime”.',
        'Sets the maximum number of active sessions per agent within the timespan defined in SessionActiveTime.' =>
            'Поставља максимални број активних сесија по оператеру у временском распону дефинисаном у „SessionActiveTime”.',
        'Sets the maximum number of active sessions per customers within the timespan defined in SessionActiveTime.' =>
            'Поставља максимални број активних сесија по кориснику у временском распону дефинисаном у „SessionActiveTime”.',
        'Sets the minimal ticket counter size if "AutoIncrement" was selected as TicketNumberGenerator. Default is 5, this means the counter starts from 10000.' =>
            'Дефинише минималну величину бројача тикета уколико је изабран „AutoIncrement” као TicketNumberGenerator. Подразумевано је 5, што значи да бројач почиње од 10000.',
        'Sets the minutes a notification is shown for notice about upcoming system maintenance period.' =>
            'Одређује број минута трајања приказа обавештења о предсојећем периоду одржавања.',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            'Подешава број линија приказаних у текстуалним порукама (нпр број линија у детаљном прегледу реда).',
        'Sets the options for PGP binary.' => 'Одређује опције за „PGP binary”.',
        'Sets the order of the different items in the customer preferences view.' =>
            'Одређује редослед приказа разних ставки у приказу клијентских подешавања.',
        'Sets the password for private PGP key.' => 'Подеси лозинку за приватни „PGP” кључ.',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            'Подеси приоритетне временске јединице (нпр јединице посла, сате, минуте)',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            'Дефинише путању фолдера са скриптама на серверу, према подешавању веб сервера. Ова опција се користи као променљива OTRS_CONFIG_ScriptAlias у свим облицима комуникације широм система, ради генерисања веза ка тикетима.',
        'Sets the queue in the ticket close screen of a zoomed ticket in the agent interface.' =>
            'Поставља ред на прозору затварања тикета на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the queue in the ticket free text screen of a zoomed ticket in the agent interface.' =>
            'Поставља ред на прозору слободног текста тикета на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the queue in the ticket note screen of a zoomed ticket in the agent interface.' =>
            'Поставља ред на прозору напомене тикета на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the queue in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Поставља ред на прозору власника тикета на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the queue in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Поставља ред на прозору тикета на чекању на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the queue in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Поставља ред на прозору приоритета тикета на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the queue in the ticket responsible screen of a zoomed ticket in the agent interface.' =>
            'Поставља ред на прозору одговорног за тикет на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            'Поставља одговорног оператера за тикет на прозору затварања тикета у интерфејсу оператера.',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            'Поставља одговорног оператера за тикет на прозору масовних акција тикета у интерфејсу оператера.',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            'Поставља одговорног оператера за тикет на прозору слободног текста тикета у интерфејсу оператера.',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            'Поставља одговорног оператера за тикет на прозору напомене тикета у интерфејсу оператера.',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Поставља одговорног оператера за тикет у прозору власника тикета на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Поставља одговорног оператера за тикет у прозору тикета на чекању на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Поставља одговорног оператера за тикет у прозору приоритета тикета на детаљном приказу тикета у интерфејсу оператера.',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            'Поставља одговорног оператера за тикет у прозору одговорног за тикет у интерфејсу оператера.',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Подешава сервис на екрану затварања тикета у интерфејсу оператера (неопходно је активирати Ticket::Service).',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Подешава сервис на екрану слободног текста тикета у интерфејсу оператера (неопходно је активирати Ticket::Service).',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Подешава сервис на екрану напомене тикета у интерфејсу оператера (неопходно је активирати Ticket::Service).',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Подешава сервис на екрану власника тикета на детаљном прегледу тикета у интерфејсу оператера (неопходно је активирати Ticket::Service).',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Подешава сервис на екрану тикета на чекању на детаљном прегледу тикета у интерфејсу оператера (неопходно је активирати Ticket::Service).',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Подешава сервис на екрану приоритета тикета на детаљном прегледу тикета у интерфејсу оператера (неопходно је активирати Ticket::Service).',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Подешава сервис на екрану одговорног за тикет у интерфејсу оператера (неопходно је активирати Ticket::Service).',
        'Sets the state of a ticket in the close ticket screen of the agent interface.' =>
            'Поставља статус тикета у екрану затварања тикета у интерфејсу оператера.',
        'Sets the state of a ticket in the ticket bulk screen of the agent interface.' =>
            'Поставља статус тикета у екрану масовних акција у интерфејсу оператера.',
        'Sets the state of a ticket in the ticket free text screen of the agent interface.' =>
            'Поставља статус тикета у екрану слободног текста у интерфејсу оператера.',
        'Sets the state of a ticket in the ticket note screen of the agent interface.' =>
            'Поставља статус тикета у екрану напомене у интерфејсу оператера.',
        'Sets the state of a ticket in the ticket responsible screen of the agent interface.' =>
            'Поставља статус тикета у екрану одговорног у интерфејсу оператера.',
        'Sets the state of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Поставља статус тикета у екрану власника у интерфејсу оператера.',
        'Sets the state of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Поставља статус тикета у екрану чекања у интерфејсу оператера.',
        'Sets the state of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Поставља статус тикета у екрану приоритета у интерфејсу оператера.',
        'Sets the stats hook.' => 'Дефинише ознаку за статистике.',
        'Sets the system time zone (required a system with UTC as system time). Otherwise this is a diff time to the local time.' =>
            'Подешава системску временску зону (неопходан је систем са „UTC” као системским временом). Иначе ово је временска разлика у односу на локално време.',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            'Поставља власника тикета у прозору затварања тикета у интерфејсу оператера.',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            'Поставља власника тикета у прозору масовних акција тикета у интерфејсу оператера.',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            'Поставља власника тикета у прозору слободног текста тикета у интерфејсу оператера.',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            'Поставља власника тикета у прозору напомене тикета у интерфејсу оператера.',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Одређује власника тикета на екрану власништва тикета у детаљном приказу тикета интерфејса оператера.',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Одређује власника тикета на екрану тикета на чекању у детаљном приказу тикета интерфејса оператера.',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Одређује власника тикета на екрану приоритета тикета у детаљном приказу тикета интерфејса оператера.',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            'Одређује власника тикета на екрану одговорности за тикет у интерфејсу оператера.',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Одређује тип тикета на екрану затварања тикет у интерфејсу оператера (Тикет::Тип треба да буде активирано).',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            'Одређује тип тикета на екрану масовне акције тикета у интерфејсу оператера.',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Одређује тип тикета на екрану слободног текста тикета у интерфејсу оператера (Тикет::Тип треба да буде активирано).',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Одређује тип тикета на екрану напомене тикета у интерфејсу оператера (Тикет::Тип треба да буде активирано).',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Одређује тип тикета на екрану власништва тикета детаљног приказа тикета у интерфејсу оператера (Тикет::Тип треба да буде активирано).',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Одређује тип тикета на екрану тикета на чекању детаљног приказа тикета у интерфејсу оператера (Тикет::Тип треба да буде активирано).',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Одређује тип тикета на екрану приоритета тикета детаљног приказа тикета у интерфејсу оператера (Тикет::Тип треба да буде активирано).',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Одређује тип тикета на екрану одговорности за тикет у интерфејсу оператера (Тикет::Тип треба да буде активирано).',
        'Sets the time (in seconds) a user is marked as active (minimum active time is 300 seconds).' =>
            'Поставља време (у секундама) за означавање корисника као активног (минимално активно време је 300 секунди).',
        'Sets the timeout (in seconds) for http/ftp downloads.' => 'Поставља временско одлагање (у секундама) за „http/ftp” преузимања.',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            'Дефинише истицање (у секундама) за функцију преузимања пакета. Преиначује опцију „WebUserAgent::Timeout”.',
        'Sets the user time zone per user (required a system with UTC as system time and UTC under TimeZone). Otherwise this is a diff time to the local time.' =>
            'Дефинише корисничку временску зону (неопходан је систем са „UTC” као системским временом и „UTC” за TimeZone). У супротном, ово је временска разлика у односу на локално време.',
        'Sets the user time zone per user based on java script / browser time zone offset feature at login time.' =>
            'Дефинише корисничку временску зону на основу времена претраживача приликом пријављивања.',
        'Shared Secret' => 'Дељена тајна',
        'Should the cache data be held in memory?' => 'Да ли кеширани подаци треба да се чувају у меморији?',
        'Should the cache data be stored in the selected cache backend?' =>
            'Да ли кеширани подаци треба да се чувају у одабраном кешу система у позадини?',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            'Прикажи избор одговорног у телефонским и имејл тикетима у оператерском интерфејсу.',
        'Show article as rich text even if rich text writing is disabled.' =>
            'Прикажи чланак као обогаћени текст чак и кад је писање обогаћеног текста деактивирано.',
        'Show queues even when only locked tickets are in.' => 'Прикажи редове чак и кад садрже само закључане тикете.',
        'Show the current owner in the customer interface.' => 'Приказује актуелног власника у клијентском интерфејсу.',
        'Show the current queue in the customer interface.' => 'Приказује актуелни ред у клијентском интерфејсу.',
        'Show the history for this ticket' => 'Прикажи историјат за овај тикет',
        'Shows a count of icons in the ticket zoom, if the article has attachments.' =>
            'Приказује број икона у детаљном приказу тикета ако чланак  има прилоге.',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за пријаву / одјаву на тикет у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.  Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију која омогућава повезивање тикета са другим објектом у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију која омогућава спајање тикета у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за приступ историјату тикета у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за додавање поља слободног текста у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за додавање напомене у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            'У менију приказује везу за додавање напомене на тикет у сваки преглед тикета у интерфејсу оператера.',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            'У менију приказује везу за затварање тикета у сваки преглед тикета у интерфејсу оператера.',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за затварање тикета у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Приказује везу у менију за брисање тикета у свим прегледима у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”.',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за брисање тикета у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to enroll a ticket into a process in the ticket zoom view of the agent interface.' =>
            'У менију приказује везу за прикључивање тикета процесу у детаљном прегледу у интерфејсу оператера.',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за повратак у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            'У менију приказује везу за закључавање / откључавање тикета у прегледе тикета у интерфејсу оператера.',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за закључавање/откључавање тикета у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            'У менију приказује везу за померање тикета у сваки преглед тикета у интерфејсу оператера.',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за штампу тикета или чланка у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to see the customer who requested the ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за контролу корисника на кога се води тикет у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            'У менију приказује везу за гледање историјата тикета у сваки преглед тикета у интерфејсу оператера.',
        'Shows a link in the menu to see the owner of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за контролу власника тикета у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за контролу приоритета тикета у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to see the responsible agent of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за контролу одговорног тикета у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to send an outbound email in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за слање одлазне имејл поруке у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to set a ticket as junk in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Приказује везу у менију за означавање тикета као бесмисленог брисање „junk” у свим прегледима у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”.',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за постављање тикета у чекање у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            'У менију приказује везу за подешавање приоритета тикета у сваки преглед тикета у интерфејсу оператера.',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            'У менију приказује везу за детаљни приказ тикета у прегледе тикета у интерфејсу оператера.',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            'У менију приказује везу за приступ прилозима чланка преко „html” прегледа у детаљном прегледу чланка у интерфејсу оператера.',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            'У менију приказује везу за преузимање прилога чланка у детаљном прегледу чланка у интерфејсу оператера',
        'Shows a link to see a zoomed email ticket in plain text.' => 'Приказује везу за приказ детаљног прегледа тикета као обичан текст.',
        'Shows a link to set a ticket as junk in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Приказује везу у менију за означавање тикета као бесмисленог „junk” у детаљном прегледу у интерфејсу оператера. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”. За здруживање веза у менију подесите кључ „ClusterName” са садржајем који ће бити назив који желите да видите у интерфејсу. Користите кључ „ClusterPriority” за измену редоследа група у менију.',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            'Приказује листу свих укључених оператера за овај тикет, на екрану затварања тикета у оператерском интерфејсу.',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            'Приказује листу свих укључених оператера за овај тикет, на екрану слободног текста тикета у оператерском интерфејсу.',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            'Приказује листу свих укључених оператера за овај тикет, на екрану напомене тикета у оператерском интерфејсу.',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Приказује листу свих укључених оператера за овај тикет, на екрану власника тикета на детаљном приказу тикета у оператерском интерфејсу.',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Приказује листу свих укључених оператера за овај тикет, на екрану тикета на чекању на детаљном приказу тикета у оператерском интерфејсу.',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Приказује листу свих укључених оператера за овај тикет, на екрану приоритета тикета на детаљном приказу тикета у оператерском интерфејсу.',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            'Приказује листу свих укључених оператера за овај тикет, на екрану одговорног за тикет у оператерском интерфејсу.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            'Приказује листу свих могућих оператера (сви оператери са дозволом за напомену за ред/тикет) ради утврђивања ко треба да буде информисан о овој напомени, на екрану затварања тикета у интерфејсу оператера.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            'Приказује листу свих могућих оператера (сви оператери са дозволом за напомену за ред/тикет) ради утврђивања ко треба да буде информисан о овој напомени, на екрану слободног текста тикета у интерфејсу оператера.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            'Приказује листу свих могућих оператера (сви оператери са дозволом за напомену за ред/тикет) ради утврђивања ко треба да буде информисан о овој напомени, на екрану напомене тикета у интерфејсу оператера.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Приказује листу свих могућих оператера (сви оператери са дозволом за напомену за ред/тикет) ради утврђивања ко треба да буде информисан о овој напомени, на екрану власништва тикета на детаљном приказу тикета у интерфејсу оператера.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Приказује листу свих могућих оператера (сви оператери са дозволом за напомену за ред/тикет) ради утврђивања ко треба да буде информисан о овој напомени, на екрану тикета на чекању на детаљном приказу тикета у интерфејсу оператера.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Приказује листу свих могућих оператера (сви оператери са дозволом за напомену за ред/тикет) ради утврђивања ко треба да буде информисан о овој напомени, на екрану приоритета тикета на детаљном приказу тикета у интерфејсу оператера.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            'Приказује листу свих могућих оператера (сви оператери са дозволом за напомену за ред/тикет) ради утврђивања ко треба да буде информисан о овој напомени, на екрану одговорности за тикет у интерфејсу оператера.',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            'Приказује прегледа тикета (Инфо клијента => 1 - показује и податке о клијенту, Максимална величина приказа података о клијенту у карактерима).',
        'Shows a select of ticket attributes to order the queue view ticket list. The possible selections can be configured via \'TicketOverviewMenuSort###SortAttributes\'.' =>
            'Приказује листу атрибута тикета за сортирање прегледа редова. Могуће опције могу бити дефинисане преко \'TicketOverviewMenuSort###SortAttributes\'.',
        'Shows all both ro and rw queues in the queue view.' => 'Приказује све, и „ro” и „rw” редове на прегледу редова.',
        'Shows all both ro and rw tickets in the service view.' => 'Приказује све, и ro и rw тикете на прегледу услуга.',
        'Shows all open tickets (even if they are locked) in the escalation view of the agent interface.' =>
            'Приказује све отворене тикете (чак иако су закључани) на ескалационом прегледу у интерфејсу оператера.',
        'Shows all open tickets (even if they are locked) in the status view of the agent interface.' =>
            'Приказује све отворене тикете (чак иако су закључани) на статусном прегледу у интерфејсу оператера.',
        'Shows all the articles of the ticket (expanded) in the zoom view.' =>
            'Приказује све чланке тикета (детаљно) на детаљном прегледу.',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            'Приказује све клијентске идентификаторе у пољу вишеструког избора (није корисно ако имате много клијентских идентификатора).',
        'Shows all the customer user identifiers in a multi-select field (not useful if you have a lot of customer user identifiers).' =>
            '',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            'Приказује избор власника за телефонске и имејл тикете у интерфејсу оператера.',
        'Shows colors for different article types in the article table.' =>
            'Приказује боје за разне типове чланака у табели чланака.',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            'Приказује историјат тикета корисника у AgentTicketPhone, AgentTicketEmail и AgentTicketCustomer.',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            'Приказује предмет задњег клијентовог чланка или наслов тикета у прекледу малог формата.',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            'Приказује постојеће листе редова надређени-подређени у систему у форми стабла или листе.',
        'Shows information on how to start OTRS Daemon' => 'Приказује информације како покренути „OTRS” сервис',
        'Shows the activated ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            'Приказује атрибуте активираних тикета у интерфејсу клијента (0 = Онемогућено, 1 = Омогућено).',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            'Приказује чланке сортирано нормално или обрнуто, на детаљном приказу тикета у интерфејсу оператера.',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            'Приказује податке о клијенту кориснику (број телефона и имејл) на екрану писања поруке.',
        'Shows the customer user\'s info in the ticket zoom view.' => 'Приказује информације о клијенту на детаљном прегледу тикета.',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.' =>
            'Приказује поруку дана (MOTD) на контролној табли у интерфејсу оператера. „Group” се користи да ограничи приступ додатку (нпр. Group: admin;group1;group2;). „Default” указује на то да ли је додатак подразумевано активиран или је потребно да га корисник мануелно активира.',
        'Shows the message of the day on login screen of the agent interface.' =>
            'Приказује дневну поруку на екрану за пријаву у интерфејсу оператера.',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            'Приказује историјат тикета (обрнут редослед) у интерфејсу оператера.',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            'Приказује опције приоритета тикета на екрану затвореног тикета у интерфејсу оператера.',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            'Приказује опције приоритета тикета на екрану померања тикета у интерфејсу оператера.',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            'Приказује опције приоритета тикета на екрану масовних тикета у интерфејсу оператера.',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            'Приказује опције приоритета тикета на екрану слободног текста тикета у интерфејсу оператера.',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            'Приказује опције приоритета тикета на екрану напомене тикета у интерфејсу оператера.',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Приказује опције приоритета тикета на екрану власника на детаљном приказу тикета у интерфејсу оператера.',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Приказује опције приоритета тикета на екрану приказа  чекања на детаљном приказу тикета у интерфејсу оператера.',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Приказује опције приоритета тикета на екрану приоритета на детаљном приказу тикета у интерфејсу оператера.',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            'Приказује опције приоритета тикета на екрану о одговорности на детаљном приказу тикета у интерфејсу оператера.',
        'Shows the title field in the ticket free text screen of the agent interface.' =>
            'Приказује поље наслова наекрану слободног текста тикета у интерфејсу оператера.',
        'Shows the title fields in the close ticket screen of the agent interface.' =>
            'Приказује насловна поља на екрану затвореног тикета у интерфејсу оператера.',
        'Shows the title fields in the ticket note screen of the agent interface.' =>
            'Приказује насловна поља на екрану напомене тикета у интерфејсу оператера.',
        'Shows the title fields in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Приказује насловна поља на екрану власника на детаљном приказу тикета у интерфејсу оператера.',
        'Shows the title fields in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Приказује насловна поља на екрану приказа чекања на детаљном приказу тикета у интерфејсу оператера.',
        'Shows the title fields in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Приказује насловна поља на екрану приоритета на детаљном приказу тикета у интерфејсу оператера.',
        'Shows the title fields in the ticket responsible screen of the agent interface.' =>
            'Приказује насловна поља на приказу екрана одговорности  за тикет у интерфејсу оператера.',
        'Shows time in long format (days, hours, minutes), if set to "Yes"; or in short format (days, hours), if set to "No".' =>
            'Приказује време у дужем формату (дани, сати, минути), опција „Да”; или у краћем формату (дани, сати), опција „Не”.',
        'Shows time use complete description (days, hours, minutes), if set to "Yes"; or just first letter (d, h, m), if set to "No".' =>
            'Приказује потпун опис у времену (дани, сати, минути), опција ”Да”; или само прво слово (д, ч, м), опција ”Не”.',
        'Simple' => 'Једноставно',
        'Skin' => 'Изглед',
        'Slovak' => 'Словачки',
        'Slovenian' => 'Словеначки',
        'Software Package Manager.' => 'Управљање програмским пакетима.',
        'SolutionDiffInMin' => 'SolutionDiffInMin',
        'SolutionInMin' => 'SolutionInMin',
        'Some description!' => 'Неки опис!',
        'Some picture description!' => 'Неки опис слике!',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            'Сортирање тикета (узлазно или силазно) када се изабере један ред из прегледа редова после сортирања тикета по приоритету. Вредности: 0 = узлазно (најстарије на врху, подразумевано), 1 = силазно (најновије на врху). Користи ИД реда за кључ и 0 или 1 за вредност.',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the service view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the ServiceID for the key and 0 or 1 for value.' =>
            'Сортирање тикета (узлазно или силазно) када се изабере један ред из прегледа услуге после сортирања тикета по приоритету. Вредности: 0 = узлазно (најстарије на врху, подразумевано), 1 = силазно (најновије на врху). Користи ИД услуге за кључ и 0 или 1 за вредност.',
        'Spam' => '„Spam”',
        'Spam Assassin example setup. Ignores emails that are marked with SpamAssassin.' =>
            'Пример подешавања за Spam Assassin. Игнорише имејлове које је означио Spam Assassin.',
        'Spam Assassin example setup. Moves marked mails to spam queue.' =>
            'Пример подешавања за Spam Assassin. Премешта означене имејлове у ред за непожељне.',
        'Spanish' => 'Шпански',
        'Spanish (Colombia)' => 'Шпански (Колумбија)',
        'Spanish (Mexico)' => 'Шпански (Мексико)',
        'Spanish stop words for fulltext index. These words will be removed from the search index.' =>
            'Шпанске зауставне речи за индекс претрагу комплетног текста. Ове речи ће бити уклоњене из индекса претраге.',
        'Specifies if an agent should receive email notification of his own actions.' =>
            'Дефинише да ли оператер треба да добије имејл обавештење за своје акције.',
        'Specifies the available note types for this ticket mask. If the option is deselected, ArticleTypeDefault is used and the option is removed from the mask.' =>
            'Наводи доступне типове напомена за ову маску тикета. Ако опција није изабрана, користи се подразумевани тип чланка и опција је уклоњена из маске.',
        'Specifies the default article type for the ticket compose screen in the agent interface if the article type cannot be automatically detected.' =>
            'Наводи подразумевани тип чланка за екран састављања тикета у интерфејсу оператера ако се не може аутоматски одредити тип чланка.',
        'Specifies the different article types that will be used in the system.' =>
            'Одређује различите типове артикала који ће се користити у систему.',
        'Specifies the different note types that will be used in the system.' =>
            'Одређује различите типове напомена који ће се користити у систему.',
        'Specifies the directory to store the data in, if "FS" was selected for TicketStorageModule.' =>
            'Одређује директоријум за складиштење података ако је „FS” изабран за TicketStorageModule.',
        'Specifies the directory where SSL certificates are stored.' => 'Одређује директоријум где се SSL сертификати складиште.',
        'Specifies the directory where private SSL certificates are stored.' =>
            'Одређује директоријум где се приватни SSL сертификати складиште.',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "OTRS Notifications" otrs@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address.' =>
            'Дефинише имејл адресу коју ће апликација користити приликом слања обавештења. Имејл адреса се користи у називу пошиљаоца обавештења (нпр. "OTRS Notifications" otrs@your.example.com). Можете користити променљиву OTRS_CONFIG_FQDN из ваше конфигурације, или одредите другу имејл адресу.',
        'Specifies the email addresses to get notification messages from scheduler tasks.' =>
            'Одреди имејл адресу која ће добијати поруке обавештења од задатака планера.',
        'Specifies the group where the user needs rw permissions so that he can access the "SwitchToCustomer" feature.' =>
            'Одређује групу где су клијентима потребне „rw” дозволе како би могли приступити својству „SwitchToCustomer”.',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "OTRS Notifications" otrs@your.example.com).' =>
            'Дефинише име које ће апликација користити приликом слања обавештења. Име се користи у називу пошиљаоца обавештења (нпр. "OTRS Notifications" otrs@your.example.com).',
        'Specifies the order in which the firstname and the lastname of agents will be displayed.' =>
            'Одређује редослед којим ће бити приказано име и презиме оператера.',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png, 700 x 100 pixel).' =>
            'Одређује путању датотеке логоа у заглављу стране (gif|jpg|png, 700 x 100 pixel).',
        'Specifies the path of the file for the performance log.' => 'Одређује путању датотеке за перформансу лог-а.',
        'Specifies the path to the converter that allows the view of Microsoft Excel files, in the web interface.' =>
            'Одређује путању конвертора који дозвољава преглед Microsoft Excel датотека у веб интерфејсу.',
        'Specifies the path to the converter that allows the view of Microsoft Word files, in the web interface.' =>
            'Одређује путању конвертора који дозвољава преглед Microsoft Word датотека у веб интерфејсу.',
        'Specifies the path to the converter that allows the view of PDF documents, in the web interface.' =>
            'Одређује путању конвертора који дозвољава преглед PDF докумената у веб интерфе',
        'Specifies the path to the converter that allows the view of XML files, in the web interface.' =>
            'Одређује путању конвертора који дозвољава преглед XML датотека у веб интерфе',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            'Одређује текст који треба да се појави у лог датотеци да означи улазак CGI скрипте.',
        'Specifies user id of the postmaster data base.' => 'Одређује ИД корисника postmaster базе података.',
        'Specifies whether all storage backends should be checked when looking for attachments. This is only required for installations where some attachments are in the file system, and others in the database.' =>
            'Дефинише да ли ће бити претражени сви позадински модули приликом приказа прилога. Ово је неопходно само на системима где су неки прилози у систему датотека, а други у бази података.',
        'Specify how many sub directory levels to use when creating cache files. This should prevent too many cache files being in one directory.' =>
            'Навођење колико нивоа поддиректоријума да користи приликом креирања кеш фајлова. То би требало да спречи превише кеш фајлова у једном директоријуму.',
        'Specify the channel to be used to fetch OTRS Business Solution™ updates. Warning: Development releases might not be complete, your system might experience unrecoverable errors and on extreme cases could become unresponsive!' =>
            'Дефинише канал за ажурирање OTRS Business Solution™. Упозорење: бета издања могу бити некомплетна, ваш систем може добити непоправљиве грешке и, у екстремним случајевима, престати да реагује.',
        'Specify the password to authenticate for the first mirror database.' =>
            'Наведи лозинку за ауторизацију на прву пресликану базу података.',
        'Specify the username to authenticate for the first mirror database.' =>
            'Наведи корисничко име за ауторизацију на прву пресликану базу података.',
        'Spell checker.' => 'Провера правописа.',
        'Stable' => ' Стабилно',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            'Стандардне расположиве дозволе за оператере унутар апликације. Уколико је потребно више дозвола они могу унети овде. Дозволе морају бити дефинисане да буду ефективне. Неке друге дозволе су такође обезбеђене уграђивањем у: напомену, затвори, на чекању, клијент, слободан текст, помери, отвори, одговоран, проследи и поврати. Обезбеди да „rw” увек буде последња регистрована дозвола.',
        'Start number for statistics counting. Every new stat increments this number.' =>
            'Почетни број за бројанје статистика. Свака нова статистика повећава овај број.',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            'Почиње џокер претрагу активног објекта након покретања везе маске објекта.',
        'Stat#' => 'Статистика#',
        'Status view' => 'Преглед статуса',
        'Stores cookies after the browser has been closed.' => 'Чува колачиће након затварања претраживача.',
        'Strips empty lines on the ticket preview in the queue view.' => 'Уклања празне линије у приказу тикета на прегледу реда.',
        'Strips empty lines on the ticket preview in the service view.' =>
            'Уклања празне линије у приказу тикета на прегледу услуга.',
        'Swahili' => 'Свахили',
        'Swedish' => 'Шведски',
        'System Address Display Name' => 'Назив за приказ системске адресе',
        'System Maintenance' => 'Одржавање система',
        'System Request (%s).' => 'Системски захтев (%s).',
        'Target' => 'Циљ',
        'Templates <-> Queues' => 'Шаблони <-> Редови',
        'Textarea' => 'Област текста',
        'Thai' => 'Тајландски',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            'Излед који ће се користити у интерфејсу оператера. Молимо проверите доступне изгледе у Frontend::Agent::Skins.',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            'Излед који ће се користити у интерфејсу корисника. Молимо проверите доступне изгледе у Frontend::Customer::Skins.',
        'The daemon registration for the scheduler cron task manager.' =>
            'Регистрација модула сервиса за планиране задатке.',
        'The daemon registration for the scheduler future task manager.' =>
            'Регистрација модула сервиса за будуће задатке.',
        'The daemon registration for the scheduler generic agent task manager.' =>
            'Регистрација модула сервиса за задатке генеричког оператера.',
        'The daemon registration for the scheduler task worker.' => 'Регистрација модула сервиса за радне задатке.',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            'Делилац између прикључка и броја тикета, нпр „: ”.',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            'Време у минутима после емитовања догађаја, у ком су ново обавештење о ескалацији и старту догађаја прикривени.',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the latter case you should verify that the setting PostMaster::CheckFollowUpModule###0200-References is activated to recognize followups based on email headers.' =>
            'Формат поља предмета. \'Left\' значи \'[TicketHook#:12345] Неки наслов\', \'Right\' значи \'Неки наслов [TicketHook#:12345]\', \'None\' значи \'Неки наслов\' и без броја тикета. У последњем случају, обавезно проверите да ли је подешавање PostMaster::CheckFollowUpModule###0200-References активирано за препознавање наставака на основу заглавља имејл порука.',
        'The headline shown in the customer interface.' => 'Наслов приказан у клијентском интерфејсу.',
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            'Идентификатор тикета, нпр Тикет#, Позив#, МојТикет#. Подразумевано је Тикет#.',
        'The logo shown in the header of the agent interface for the skin "default". See "AgentLogo" for further description.' =>
            'Лого приказан у заглављу интерфејса оператера за изглед „подразумевано”. Погледајте „AgentLogo” за детаљнији опис.',
        'The logo shown in the header of the agent interface for the skin "ivory". See "AgentLogo" for further description.' =>
            'Лого приказан у заглављу интерфејса оператера за изглед Слоновача. Погледајте AgentLogo за детаљнији опис.',
        'The logo shown in the header of the agent interface for the skin "ivory-slim". See "AgentLogo" for further description.' =>
            'Лого приказан у заглављу интерфејса оператера за изглед Слоновача (упрошћено). Погледајте AgentLogo за детаљнији опис.',
        'The logo shown in the header of the agent interface for the skin "slim". See "AgentLogo" for further description.' =>
            'Лого приказан у заглављу интерфејса оператера за „упрошћени” изглед. Погледајте „AgentLogo” за детаљнији опис.',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Лого приказан у заглављу оператерског интерфејса. URL до слике може бити релативан у односу на директоријум са сликама или апсолутан до удаљеног сервера.',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Лого приказан у заглављу клијентског интерфејса. URL до слике може бити релативан у односу на директоријум са сликама или апсолутан до удаљеног сервера.',
        'The logo shown on top of the login box of the agent interface. The URL to the image must be relative URL to the skin image directory.' =>
            'Лого приказан на врху екрана за пријаву у оператерски интерфејс. URL до слике мора бити релативан у односу на директоријум са сликама.',
        'The maximal number of articles expanded on a single page in AgentTicketZoom.' =>
            'Максимални број чланака раширених на једној страни на детаљном приказу тикета у интерфејсу оператера.',
        'The maximal number of articles shown on a single page in AgentTicketZoom.' =>
            'Максимални број чланака за приказ на једној страни на детаљном приказу тикета у интерфејсу оператера.',
        'The maximum number of mails fetched at once before reconnecting to the server.' =>
            'Максимални број имејлова преузетих одједном пре поновне конекције на сервер.',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            'Текст на почетку предмета у одговору на имејл, нпр „RE”, „AW”, или „ОД”.',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            'Текст на почетку предмета када се имејл прослеђује, нпр „FW”, „Fwd”, или „Про”.',
        'This event module stores attributes from CustomerUser as DynamicFields tickets. Please see the setting above for how to configure the mapping.' =>
            'Овај модул догађаја чува атрибуте корисника као динамичка поља тикета. Погледајте опцију изнад за подешавање мапирања.',
        'This is the default orange - black skin for the customer interface.' =>
            'Ово је подразумевани наранџасто-црни изглед клијентског интерфејса.',
        'This is the default orange - black skin.' => 'Ово је подразумевани наранџасто-црни изглед.',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            'Уколико је укључен, овај модул и његова PreRun() функција биће  извршени приликом сваког захтева. Користи се за проверу опција корисника и приказ вести о апликацији.',
        'This module is part of the admin area of OTRS.' => 'Овај модул је део „OTRS” административног простора.',
        'This option defines the dynamic field in which a Process Management activity entity id is stored.' =>
            'Ова опција одређује динамичко поље у које се смешта ИД ентитета активности управљања процесима.',
        'This option defines the dynamic field in which a Process Management process entity id is stored.' =>
            'Ова опција одређује динамичко поље у које се смешта ИД ентитета активности управљања процесима.',
        'This option defines the process tickets default lock.' => 'Ова опција одређује подразумевано закључавање тикета у обради.',
        'This option defines the process tickets default priority.' => 'Ова опција одређује подразумевани приоритет тикета у обради.',
        'This option defines the process tickets default queue.' => 'Ова опција одређује подразумевани ред тикета у обради.',
        'This option defines the process tickets default state.' => 'Ова опција одређује подразумевани статус тикета у обради.',
        'This option will deny the access to customer company tickets, which are not created by the customer user.' =>
            'Ова опција ће одбити приступ тикетима клијентове фирме, ако их  није  креирао клијент корисник .',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            'Ова опција вам дозвољава да уграђену листу држава замените својом. Ово је посбно корисно ако у селекцији желите да користите само мали број држава.',
        'This will allow the system to send text messages via SMS.' => 'Ово ће дозволити систему да шаље текстуалне поруке преко СМС.',
        'Ticket Close.' => 'Затварање тикета.',
        'Ticket Compose Bounce Email.' => 'Преусмеравање имејл поруке у тикету.',
        'Ticket Compose email Answer.' => 'Писање имејл поруке у тикету.',
        'Ticket Customer.' => 'Корисник тикета.',
        'Ticket Forward Email.' => 'Прослеђивање имејл поруке у тикету.',
        'Ticket FreeText.' => 'Слободни текст тикета.',
        'Ticket History.' => 'Историјат тикета.',
        'Ticket Lock.' => 'Закључавање тикета',
        'Ticket Merge.' => 'Спајање тикета.',
        'Ticket Move.' => 'Померање тикета.',
        'Ticket Note.' => 'Напомена тикета.',
        'Ticket Notifications' => 'Обавештења о тикету',
        'Ticket Outbound Email.' => 'Слање одлазне имејл поруке у тикету.',
        'Ticket Owner.' => 'Власник тикета.',
        'Ticket Pending.' => 'Постављање тикета у чекање.',
        'Ticket Print.' => 'Штампа тикета.',
        'Ticket Priority.' => 'Приоритет тикета.',
        'Ticket Queue Overview' => 'Преглед реда тикета',
        'Ticket Responsible.' => 'Одговоран за тикет.',
        'Ticket Watcher' => 'Праћење тикета.',
        'Ticket Zoom.' => 'Детаљи тикета.',
        'Ticket bulk module.' => 'Модул масовне акције на тикетима.',
        'Ticket event module that triggers the escalation stop events.' =>
            'Модул догађаја тикета који окида догађаје заустављања ескалације.',
        'Ticket moved into Queue "%s" (%s) from Queue "%s" (%s).' => 'Тикет премештен у ред „%s” (%s) из реда „%s” (%s).',
        'Ticket notifications' => 'Обавештења о тикету',
        'Ticket overview' => 'Pregled tiketa',
        'Ticket plain view of an email.' => 'Приказ неформатиране имејл поруке у тикету.',
        'Ticket title' => 'Наслов тикета',
        'Ticket zoom view.' => 'Детаљни преглед тикета.',
        'TicketNumber' => 'Број тикета',
        'Tickets.' => 'Тикети.',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            'Време у секундама које се додаје на тренутно време ако се поставља статус „на чекању” (подразумевано: 86400 = 1 дан).',
        'Title updated: Old: "%s", New: "%s"' => 'Ажуриран наслов: Стари: „%s”, Нов: „%s”',
        'To accept login information, such as an EULA or license.' => 'Прихватање информација приликом пријављивања, нпр. EULA изјава или лиценца.',
        'To download attachments.' => 'За преузимање прилога.',
        'Toggles display of OTRS FeatureAddons list in PackageManager.' =>
            'Искључује/укључује приказ листе пакета за проширење могућности у екрану за управљање пакетима.',
        'Toolbar Item for a shortcut. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Ставка алатне линије за пречицу. Додатна контрола приказа ове везе може се постићи коришћењем кључа „Group” са садржајем „rw:group1;move_into:group2”.',
        'Transport selection for ticket notifications.' => 'Избор транспорта за обавештења о тикетима.',
        'Tree view' => 'Приказ у облику стабла',
        'Triggers ticket escalation events and notification events for escalation.' =>
            'Активира ескалационе догађаје тикета и догађаје обавештења за ескалације.',
        'Turkish' => 'Турски',
        'Turns off SSL certificate validation, for example if you use a transparent HTTPS proxy. Use at your own risk!' =>
            'Искључује проверу важности SSL сертификата, нпр. уколико користите транспарентан HTTPS прокси. Користите на сопствену одговорност!',
        'Turns on drag and drop for the main navigation.' => 'Активира превуци и отпусти у главној навигацији.',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            'Укључује анимације у интерфејсу. Уколико имате проблеме са овим анимацијама (нпр. са перформансама), овде их можете искључити.',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            'Укључивање провере удаљене IP адресе. Треба бити подешено на „Не” ако се апликација користи, на пример преко прокси фарме или телефонске конекције, зато што је удаљена IP адреса углавном другачија за захтеве.',
        'Ukrainian' => 'Украјински',
        'Unlock tickets that are past their unlock timeout.' => 'Откључај тикете којима је истекло време одлагања за откључавање.',
        'Unlock tickets whenever a note is added and the owner is out of office.' =>
            'Откључавање тикета кад год се дода напомена и власник је ван канцеларије.',
        'Unlocked ticket.' => 'Откључано',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            'Ажурирај ознаку виђених тикета ако су сви прегледани или је креиран нови чланак.',
        'Updated SLA to %s (ID=%s).' => 'Ажуриран SLA „%s” (ID=%s).',
        'Updated Service to %s (ID=%s).' => 'Ажурирана услуга „%s” (ID=%s).',
        'Updated Type to %s (ID=%s).' => 'Ажуриран тип „%s” (ID=%s).',
        'Updated: %s' => 'Ажурирано: %s',
        'Updated: %s=%s;%s=%s;%s=%s;' => 'Ажурирано: %s=%s;%s=%s;%s=%s;',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            'Ажурирај индекс ескалације тикета после ажурирања атрибута тикета.',
        'Updates the ticket index accelerator.' => 'Ажурирај акцелератор индекса тикета.',
        'Use new type of select and autocomplete fields in agent interface, where applicable (InputFields).' =>
            'Користите нови тип поља за избор и аутоматско довршавање у интерфејсу оператера где је то могуће (поља за унос).',
        'Use new type of select and autocomplete fields in customer interface, where applicable (InputFields).' =>
            'Користите нови тип поља за избор и аутоматско довршавање у интерфејсу клијента где је то могуће (поља за унос).',
        'UserFirstname' => 'Име корисника',
        'UserLastname' => 'Презиме корисника',
        'Uses Cc recipients in reply Cc list on compose an email answer in the ticket compose screen of the agent interface.' =>
            'Користи Cc примаоце у узвраћеној Cc листи на састављеном имејл одговору на приказу екрана отвореног тикета у интерфејсу оператера.',
        'Uses richtext for viewing and editing ticket notification.' => 'Користи „richtext” формат за преглед и уређивање тикетских обавештења.',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard templates, auto responses and notifications.' =>
            'Користи richtekt формат за преглед и уређивање: чланака, поздрава, потписа, стандардних шаблона, аутоматских одговора и обавештења.',
        'Vietnam' => 'Вијетнамски',
        'View performance benchmark results.' => 'Преглед резултата провере перформанси.',
        'Watch this ticket' => 'Надгледај овај тикет',
        'Watched Tickets.' => 'Надгледани тикети.',
        'We are performing scheduled maintenance.' => 'Извршавамо планирано одржавање.',
        'We are performing scheduled maintenance. Login is temporarily not available.' =>
            'Извршавамо планирано одржавање. Пријава привремено није могућа.',
        'We are performing scheduled maintenance. We should be back online shortly.' =>
            'Извршавамо планирано одржавање. ускоро ћемо бити поново активни.',
        'Web View' => 'Веб преглед',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the body of this note (this text cannot be changed by the agent).' =>
            'Када су тикети спојени, напомена ће бити аутоматски додата тикету који није више активан. Овде можете дефинисати тело ове напомене (овај текст се не може променити од стране оператера).',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the subject of this note (this subject cannot be changed by the agent).' =>
            'Када су тикети спојени, напомена ће бити аутоматски додата тикету који није више активан. Овде можете дефинисати предмет ове напомене (овај предмет се не може променити од стране оператера).',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            'Када су тикети спојени, клијент може бити информисан имејлом постављањем поља за потврду „Обавести пошиљаоца”. У простору за текст, можете дефинисати унапред форматирани текст који касније бити модификован од стране оператера.',
        'Whether or not to collect meta information from articles using filters configured in Ticket::Frontend::ZoomCollectMetaFilters.' =>
            'Дефинише да ли ће бити прикупљане информације из чланака коришћењем филтера дефинисаним у Ticket::Frontend::ZoomCollectMetaFilters.',
        'Yes, but hide archived tickets' => 'Да, али склони архивиране тикете',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Ваш имејл са бројем тикета „<OTRS_TICKET>” је преусмерен на тикет „<OTRS_BOUNCE_TO>”!',
        'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.' =>
            'Ваш избор из ваших пожељних редова. Ако је активирано, добићете и обавештења о овим редовима путем имејла.',
        'Your service selection of your preferred services. You also get notified about those services via email if enabled.' =>
            'Ваш избор из ваших пожељних услуга. Ако је активирано, добићете и обавештења о овим сервисима путем имејла.',
        'attachment' => 'прилог',
        'bounce' => 'преусмери',
        'compose' => 'састави',
        'debug' => 'отклањање неисправности',
        'error' => 'грешка',
        'forward' => 'проследи',
        'info' => 'инфо',
        'inline' => 'у истом реду',
        'notice' => 'напомена',
        'pending' => 'на чекању',
        'responsible' => 'одговорност',
        'stats' => 'статистика',

    };
    # $$STOP$$
    return;
}

1;
