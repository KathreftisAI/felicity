# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ru_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Computer'} = '';
    $Self->{Translation}->{'Hardware'} = '';
    $Self->{Translation}->{'Network'} = 'Сеть';
    $Self->{Translation}->{'Software'} = '';
    $Self->{Translation}->{'Address'} = 'Адрес';
    $Self->{Translation}->{'Admin Tool'} = 'Системные утилиты';
    $Self->{Translation}->{'Backup Device'} = 'Устройство бэкапа';
    $Self->{Translation}->{'Beamer'} = 'Проектор';
    $Self->{Translation}->{'Building'} = 'Здание';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'CIHistory::ConfigItemCreate';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'CIHistory::ConfigItemDelete';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'CIHistory::DefinitionUpdate';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'CIHistory::DeploymentStateUpdate';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'CIHistory::IncidentStateUpdate';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'CIHistory::LinkAdd';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'CIHistory::LinkDelete';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'CIHistory::NameUpdate';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'CIHistory::ValueUpdate';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'CIHistory::VersionCreate';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'CIHistory::VersionDelete';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = 'CIHistory::AttachmentAdd';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = 'CIHistory::AttachmentDelete';
    $Self->{Translation}->{'CPU'} = 'ЦПУ';
    $Self->{Translation}->{'Camera'} = 'Камера';
    $Self->{Translation}->{'Capacity'} = 'Объем';
    $Self->{Translation}->{'Change Definition'} = 'Изменить описание';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Невозможно изменить описание! Для подробной информации смотри System Log.';
    $Self->{Translation}->{'Client Application'} = 'Клиентское приложение';
    $Self->{Translation}->{'Client OS'} = 'Клиентская ОС';
    $Self->{Translation}->{'Config Item-Area'} = 'Обзор основных средств';
    $Self->{Translation}->{'Config Items available'} = 'Доступно основных средств';
    $Self->{Translation}->{'Config Items shown'} = 'Показано основных средств';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'Демо-версия';
    $Self->{Translation}->{'Desktop'} = 'Настольный ПК';
    $Self->{Translation}->{'Developer Licence'} = 'Лицензия для разработчика';
    $Self->{Translation}->{'Docking Station'} = 'Док-станция';
    $Self->{Translation}->{'Duplicate'} = 'Резерв';
    $Self->{Translation}->{'Embedded'} = 'Встроенный';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Пустые поля показывают, что текущие значения сохранятся';
    $Self->{Translation}->{'Enterprise Licence'} = 'Корпоративная лицензия';
    $Self->{Translation}->{'Expiration Date'} = 'Срок лицензии';
    $Self->{Translation}->{'Expired'} = 'Устарело';
    $Self->{Translation}->{'Floor'} = 'Этаж';
    $Self->{Translation}->{'Freeware'} = 'Бесплатное ПО';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Шлюз';
    $Self->{Translation}->{'Graphic Adapter'} = 'Видео адаптер';
    $Self->{Translation}->{'Hard Disk'} = 'Жесткий диск';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Жесткий диск::Объем';
    $Self->{Translation}->{'Hide Versions'} = 'Скрыть версии';
    $Self->{Translation}->{'IP Address'} = 'IP адрес';
    $Self->{Translation}->{'IP over DHCP'} = 'IP по DHCP';
    $Self->{Translation}->{'IT Facility'} = 'ИТ объект';
    $Self->{Translation}->{'Incident'} = 'Инцидент';
    $Self->{Translation}->{'Install Date'} = 'Дата установки';
    $Self->{Translation}->{'Keyboard'} = 'Клавиатура';
    $Self->{Translation}->{'LAN'} = 'Сетевая карта';
    $Self->{Translation}->{'Laptop'} = 'Ноутбук';
    $Self->{Translation}->{'Last Change'} = 'Время последнего изменения';
    $Self->{Translation}->{'Licence Key'} = 'Лицензионный ключ';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Лицензионный ключ::Срок лицензии';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Лицензионный ключ::Количество';
    $Self->{Translation}->{'Licence Type'} = 'Тип лицензии';
    $Self->{Translation}->{'Maintenance'} = 'Техническое обслуживание';
    $Self->{Translation}->{'Maximum number of one element'} = 'Максимальное количество одного элемента';
    $Self->{Translation}->{'Media'} = 'Мультимедийные средства';
    $Self->{Translation}->{'Middleware'} = 'Промежуточное ПО';
    $Self->{Translation}->{'Model'} = 'Модель';
    $Self->{Translation}->{'Modem'} = 'Модем';
    $Self->{Translation}->{'Monitor'} = 'Монитор';
    $Self->{Translation}->{'Mouse'} = 'Мышка';
    $Self->{Translation}->{'Network Adapter'} = 'Сетевой адаптер';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Сетевой адаптер::IP адрес';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Сетевой адаптер::IP по DHCP';
    $Self->{Translation}->{'Network Address'} = 'Сетевой адрес';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Сетевой адрес::Шлюз';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Сетевой адрес::Маска подсети';
    $Self->{Translation}->{'Open Source'} = 'ПО с открытым кодом';
    $Self->{Translation}->{'Operational'} = 'В эксплуатации';
    $Self->{Translation}->{'Other'} = 'Другое';
    $Self->{Translation}->{'Other Equipment'} = 'Другое оборудование';
    $Self->{Translation}->{'Outlet'} = 'Розетка';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA карта';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'На ноду(узел)';
    $Self->{Translation}->{'Per Processor'} = 'На ЦПУ';
    $Self->{Translation}->{'Per Server'} = 'На сервер';
    $Self->{Translation}->{'Per User'} = 'На пользователя';
    $Self->{Translation}->{'Phone 1'} = 'Телефон 1';
    $Self->{Translation}->{'Phone 2'} = 'Телефон 2';
    $Self->{Translation}->{'Pilot'} = 'Эксперимент';
    $Self->{Translation}->{'Planned'} = 'Запланированно';
    $Self->{Translation}->{'Printer'} = 'Принтер';
    $Self->{Translation}->{'Production'} = 'Производство';
    $Self->{Translation}->{'Quantity'} = 'Количество';
    $Self->{Translation}->{'Rack'} = 'Стойка';
    $Self->{Translation}->{'Ram'} = 'ОЗУ';
    $Self->{Translation}->{'Repair'} = 'Ремонт';
    $Self->{Translation}->{'Retired'} = 'Списано';
    $Self->{Translation}->{'Review'} = 'Экспертиза';
    $Self->{Translation}->{'Room'} = 'Кабинет';
    $Self->{Translation}->{'Router'} = 'Маршрутизатор';
    $Self->{Translation}->{'Scanner'} = 'Сканер';
    $Self->{Translation}->{'Search Config Items'} = 'Поиск конфигурационных единиц';
    $Self->{Translation}->{'Security Device'} = 'Смарт-карта';
    $Self->{Translation}->{'Serial Number'} = 'Серийный номер';
    $Self->{Translation}->{'Server'} = 'Сервер';
    $Self->{Translation}->{'Server Application'} = 'Серверное приложение';
    $Self->{Translation}->{'Server OS'} = 'Серверная ОС';
    $Self->{Translation}->{'Show Versions'} = 'Показать версии';
    $Self->{Translation}->{'Single Licence'} = 'Однократная лицензия';
    $Self->{Translation}->{'Subnet Mask'} = 'Маска подсети';
    $Self->{Translation}->{'Switch'} = 'Коммутатор';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'Test/QA'} = 'Тестирование';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Состояние использования этой КЕ';
    $Self->{Translation}->{'The incident state of this config item'} = 'Состояние инцидента для этой КЕ';
    $Self->{Translation}->{'Time Restricted'} = 'Ограниченная по времени';
    $Self->{Translation}->{'USB Device'} = 'USB устройство';
    $Self->{Translation}->{'Unlimited'} = 'Без ограничений';
    $Self->{Translation}->{'User Tool'} = 'Пользовательские утилиты';
    $Self->{Translation}->{'Volume Licence'} = 'Корпоративная лицензия';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN точка доступа';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Срок истечения гарантии';
    $Self->{Translation}->{'Workplace'} = 'Рабочее место';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Управление Конфигурационными единицами';
    $Self->{Translation}->{'Change class definition'} = 'Изменить описание класса';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'Описание';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Основные средства';
    $Self->{Translation}->{'Filter for Classes'} = 'Фильтр для классов';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Выберите класс из списка для создания новой КЕ';
    $Self->{Translation}->{'Class'} = 'Класс';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM ConfigItem массовое действие';
    $Self->{Translation}->{'Deployment state'} = 'Состояние использования';
    $Self->{Translation}->{'Incident state'} = 'Состояние инцидента';
    $Self->{Translation}->{'Link to another'} = 'Связать с другим';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Неверный номер конфигурационной единицы!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Количество других КЕ для связывания.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Имя этого учетного элемента';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Имя уже используется другой КЕ со следующим номером (ами): %s';
    $Self->{Translation}->{'Deployment State'} = 'Состояние использования';
    $Self->{Translation}->{'Incident State'} = 'Состояние инцидента';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Параметры контекста';
    $Self->{Translation}->{'Config Items per page'} = 'Конфигурационных единиц на страницу';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = 'Тип Состояния использования';
    $Self->{Translation}->{'Current Incident State'} = 'Текущее состояние инцидента';
    $Self->{Translation}->{'Current Incident State Type'} = 'Тип Текущего состояния инцидента';
    $Self->{Translation}->{'Last changed'} = 'Время последнего изменения';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = 'Создать новый шаблон';
    $Self->{Translation}->{'Run Search'} = 'Выполнить поиск';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Искать и в предыдущих версиях?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Конфигурационная единица';
    $Self->{Translation}->{'Configuration Item Information'} = ' Информация о Конф. ед.';
    $Self->{Translation}->{'Current Deployment State'} = 'Текущее состояние использования';
    $Self->{Translation}->{'Last changed by'} = 'Автор последнего изменения';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Show one version'} = 'Показать одну версию';
    $Self->{Translation}->{'Show all versions'} = 'Показать все версии';
    $Self->{Translation}->{'Version Incident State'} = 'Состояние инцидента версии';
    $Self->{Translation}->{'Version Deployment State'} = 'Состояние использования версии объекта';
    $Self->{Translation}->{'Version Number'} = 'Номер версии';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Полная информация о КЕ выбранной версии';
    $Self->{Translation}->{'Property'} = 'Свойство';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = 'Конфигурационная единица ITSM ';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = 'CIHistory::';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = 'Конфигурационная единица';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Нет результата/Решения!';
    $Self->{Translation}->{'Config Item Search Results'} = 'Результаты поиска конфигурационных единиц';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = '';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Проверка уникальности Имени внутри текущего класса КЕ(\'class\') или глобально (\'global\'),что означает, что любая существующая КЕ учитывается при поиске дубликатов ';
    $Self->{Translation}->{'Config Items'} = 'Конфигурационные единицы';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Config item (КЕ) event module ведущий запись в историю в агентском интерфейсе.';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = ' Лимит КЕ';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'Количество КЕ на страницу';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Модуль поиска КЕ в агентском интерфейсе';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Создание и управление описаниями конфигурационных единиц.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Задает Действия/Actions когда кнопка настройки доступна в связанном виджете (LinkObject::ViewMode = "complex"). Обратите внимание, что эти Действия/Actions должны иметь зарегистрированные JS или CSS файлы: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js и Core.Agent.LinkObject.js.';
    $Self->{Translation}->{'Define the group with permissions.'} = '';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'Задать требуемые права для создания ITSM КЕ с использованием Generic Interface.';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'Задает требуемые права для получения ITSM КЕ с использованием Generic Interface.';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'Задает требуемые права для поиска ITSM КЕ с использованием Generic Interface';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'Задает требуемые права для одновления ITSM КЕ с использованием Generic Interface';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Задает модуль просмотра КЕ в кратком виде.';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'Задает регулярные выражения для каждого отдельного класса для проверки имен КЕ и выдачи сообщений об ошибках.';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Задает умалчивамый подобъект для класса \'ITSMConfigItem\'.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Задает количество строк для редактора описаний КЕ (CI) в интерфейсе админа.';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        '';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'Задает лимит поиска объектов для экрана AgentITSMConfigItem';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'Задает лимит поиска объектов для экрана AgentITSMConfigItemSearch';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'Задает список показываемых столбцов в обзоре КЕ. Этот параметр не влияет на их порядок. Помните: Столбец Класс доступен только при условии выбора в фильтре "Все"(All)';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Задает список показываемых столбцов в результатах поиска КЕ. Этот параметр не влияет на порядок их отображения.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Задает список отображаемых столбцов при просмотре списков КЕ в зависимости от класса. Каждое имя атрибута должно иметь в качестве префикса - имя класса и два двоеточия (i.e. Computer::). Есть ряд атрибутов, общих для всех классов (например, для класса Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Для отображения индивидуальных атрибутов, специфичных для конкретного класса из описания КЕ (CI-Definition), используется следующий синтаксис (например, для класса Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Если нет атрибутов для конкретного класса, отображаются столбцы заданные параметром ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Задает список отображаемых столбцов в результатах поиска КЕ в зависимости от выбранного класса. Каждое имя атрибута должно иметь в качестве префикса - имя класса и два двоеточия (i.e. Computer::). Есть ряд атрибутов, общих для всех классов (например, для класса Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Для отображения индивидуальных атрибутов, специфичных для конкретного класса из описания КЕ (CI-Definition), используется следующий синтаксис (например, для класса Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Если нет атрибутов для конкретного класса, отображаются столбцы заданные параметром ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'Задает перечень отображаемых столбцов отображаемых КЕ в таблице при создании связи, в зависимости от класса. Каждое имя атрибута должно иметь в качестве префикса - имя класса и два двоеточия (i.e. Computer::). Есть ряд атрибутов, общих для всех классов (например, для класса Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Для отображения индивидуальных атрибутов, специфичных для конкретного класса из описания КЕ (CI-Definition), используется следующий синтаксис (например, для класса Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Если нет атрибутов для конкретного класса, отображаются столбцы заданные параметром ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Deployment State Color'} = '';
    $Self->{Translation}->{'Deployment State Color.'} = '';
    $Self->{Translation}->{'Deployment State Type.'} = '';
    $Self->{Translation}->{'Disabled'} = '';
    $Self->{Translation}->{'Enabled'} = '';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'Включает возможность массовых действий с КЕ для интерфейса агента для работы с несколькими КЕ одновременно.';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'Включает возможность массовых действий с КЕ только для перечисленных групп.';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        'Включает/выключает проверку уникальности имен КЕ. До включения этого параметра, проверьте вашу БД на наличие дубликатов имен КЕ. Вы можете сделать это с помощью скрипта bin/otrs.ITSMConfigItemListDuplicates.pl.';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Модуль для проверки группы ответственной за класс';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Модуль для проверки группы ответственной за КЕ';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Модуль формирования статистики по КЕ.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Object backend module registration для модуля Import/Export.';
    $Self->{Translation}->{'Overview.'} = 'Обзор';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'Параметры для цветов обозначающих состояния использования КЕ в настройках обзоров в интерфейсе агента.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Параметры для состояний использования КЕ в настройках обзоров в интерфейсе агента.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Параметры для примерных групповых прав для атрибутов Общего каталога';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Параметры страниц (на которых отображаются КЕ)';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Требуемые права для использования обзора КЕ в CMDB агентом';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Требуемые права для использования поиска в CMDB агентом';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Требуемые права для использования полного просмотра КЕ (zoom view) в CMDB агентом';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Требуемые права для добавления КЕ в CMDB агентом';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Требуемые права для редактирования содержимого КЕ в CMDB агентом';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Требуемые права для просмотра истории содержимого КЕ в CMDB агентом';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Требуемые права для печати характеристик КЕ в CMDB агентом';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '';
    $Self->{Translation}->{'Search config items.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Выбор модуля генерации номера КЕ. "AutoIncrement" последовательно увеличивает номер на 1.Для формирования номера используются SystemID, ConfigItemClassID и счетчик. Формат - "SystemID.ConfigItemClassID.Counter", т.е. 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'Задает состояние использования на экране массовых действий с КЕ в интерфейсе агента.';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'Задает состояние инцидента на экране массовых действий с КЕ в интерфейсе агента.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Показывает пункт меню Связать (Link) для организации связи КЕ с другим объектом на экране полного (zoom view) просмотра';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'Показывает пункт меню для доступа к истории КЕ при просмотре КЕ в интерфейсе агента.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Показывает пункт меню История для просмотра истории КЕ';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'Показывает пункт меню Дублировать для создания новой КЕ путем копирования характеристик текущей КЕ';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Показывает пункт меню Дублировать для создания новой КЕ путем копирования характеристик текущей КЕ';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Показывает пункт меню Редактировать для изменения характеристик КЕ';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        'Показывает пункт меню Назад при подробном просмотре конфигурационных единиц в интерфейсе агента.';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Показывает пункт меню Печать для печати характеристик КЕ';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'Показывает пункт меню для подробного просмотра КЕ при обзоре КЕ в интерфейсе агента';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Показ истории содержимого КЕ (порядок показа)';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'Идентификатор (префикс) к номеру КЕ, т.е КЕ_№, КЕ#, Учетный_элемент_№. По умолчанию - ConfigItem# (или его перевод).';
    $Self->{Translation}->{'class'} = '';
    $Self->{Translation}->{'global'} = '';

}

1;
