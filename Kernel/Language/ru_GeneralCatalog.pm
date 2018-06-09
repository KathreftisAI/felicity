# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ru_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Функциональность';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Управление Общим каталогом';
    $Self->{Translation}->{'Add Catalog Item'} = 'Добавление элемента каталога';
    $Self->{Translation}->{'Add Catalog Class'} = 'Добавление класса каталога';
    $Self->{Translation}->{'Catalog Class'} = 'Класс каталога';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = '';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'Создание и управление Общим каталогом';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        'Module registration для конфигурации AdminGeneralCatalog в панели администратора.';
    $Self->{Translation}->{'General Catalog'} = 'Общий каталог';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        'Добавление дополнительного комментария к атрибутам Общего каталога';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Параметры для примерных групповых прав для атрибутов Общего каталога';

}

1;
