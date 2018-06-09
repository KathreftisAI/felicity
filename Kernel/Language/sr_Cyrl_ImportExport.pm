# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sr_Cyrl_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Додај шаблон за мапирање';
    $Self->{Translation}->{'Charset'} = 'Карактерсет';
    $Self->{Translation}->{'Colon (:)'} = 'Двотачка (:)';
    $Self->{Translation}->{'Column'} = 'Колона';
    $Self->{Translation}->{'Column Separator'} = 'Сепаратор колона';
    $Self->{Translation}->{'Dot (.)'} = 'Тачка (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Тачка и запета (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Табулатор (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Укључи наслове колона';
    $Self->{Translation}->{'Import summary for'} = 'Резиме увоза за';
    $Self->{Translation}->{'Imported records'} = 'Увезени записи';
    $Self->{Translation}->{'Exported records'} = 'Извезени записи';
    $Self->{Translation}->{'Records'} = 'Записи';
    $Self->{Translation}->{'Skipped'} = 'Прескочено';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Увоз/Извоз управљање';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Креирај шаблон за увоз и извоз информација о објекту.';
    $Self->{Translation}->{'Start Import'} = 'Почни увоз';
    $Self->{Translation}->{'Start Export'} = 'Почни извоз';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = 'Корак 1 од 5 - Уреди заједничке информације';
    $Self->{Translation}->{'Name is required!'} = 'Име је обавезно!';
    $Self->{Translation}->{'Object is required!'} = 'Објект је обавезан!';
    $Self->{Translation}->{'Format is required!'} = 'Формат је обавезан!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = 'Корак 2 од 5 - Уреди информације о објекту';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'је обавезно!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = 'Корак 4 од 5 - Уреди информације о мапирању';
    $Self->{Translation}->{'No map elements found.'} = 'Ниједан елемент мапе није пронађен.';
    $Self->{Translation}->{'Add Mapping Element'} = 'Додај елемент за мапирање';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = 'Корак 5 од 5 - Уреди информације за претрагу';
    $Self->{Translation}->{'Restrict export per search'} = 'Ограничење извоза по претрази';
    $Self->{Translation}->{'Import information'} = 'Увоз информација';
    $Self->{Translation}->{'Source File'} = 'Изворна датотека';
    $Self->{Translation}->{'Success'} = 'Успешно';
    $Self->{Translation}->{'Failed'} = 'Неуспешно';
    $Self->{Translation}->{'Duplicate names'} = 'Дупликат имена';
    $Self->{Translation}->{'Last processed line number of import file'} = 'Број последње обрађене линије увезене датотеке';
    $Self->{Translation}->{'Ok'} = 'У реду';

    # Perl Module: Kernel/Modules/AdminImportExport.pm
    $Self->{Translation}->{'No object backend found!'} = 'Није пронађен позадински модул објекта!';
    $Self->{Translation}->{'No format backend found!'} = 'Није пронађен позадински модул формата!';
    $Self->{Translation}->{'Template not found!'} = 'Шаблон није пронађен!';
    $Self->{Translation}->{'Can\'t insert/update template!'} = 'Шаблон се не може унети/ажурирати!';
    $Self->{Translation}->{'Needed TemplateID!'} = 'Потребан ИД шаблона!';
    $Self->{Translation}->{'Error occurred. Import impossible! See Syslog for details.'} = 'Догодила се грешка. Увоз је немогућ! За детаље погледајте у системски дневник.';
    $Self->{Translation}->{'Error occurred. Export impossible! See Syslog for details.'} = 'Догодила се грешка. Извоз је немогућ! За детаље погледајте у системски дневник.';
    $Self->{Translation}->{'number'} = 'број';
    $Self->{Translation}->{'number bigger than zero'} = 'број већи од нула';
    $Self->{Translation}->{'integer'} = 'цео број';
    $Self->{Translation}->{'integer bigger than zero'} = 'цео број већи од нула';
    $Self->{Translation}->{'Element required, please insert data'} = 'Неопходан елемент, молимо унесите податке';
    $Self->{Translation}->{'Invalid data, please insert a valid %s'} = 'Неисправни подаци, унесете важећи %s';
    $Self->{Translation}->{'Format not found!'} = 'Формат није пронађен!';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} =
        'Формат регистрације „backend” модула за увоз/извоз модул.';
    $Self->{Translation}->{'Import and export object information.'} = 'Информације о увозу и извозу објеката';
    $Self->{Translation}->{'Import/Export'} = 'Увоз/Извоз';

}

1;
