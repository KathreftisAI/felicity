# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fa_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'کارکردی';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'مدیریت فهرست عمومی';
    $Self->{Translation}->{'Add Catalog Item'} = 'اضافه کردن یک قلم فهرست';
    $Self->{Translation}->{'Add Catalog Class'} = 'اضافه کردن کلاس فهرستی';
    $Self->{Translation}->{'Catalog Class'} = 'فهرست کلاسی';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'مدیر';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'ساخت و مدیریت فهرست عمومی';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        'ثبت ماژول برای پیکربندی فهرست عمومی در بخش مدیریت';
    $Self->{Translation}->{'General Catalog'} = 'فهرست عمومی';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        'پارامترهایی برای توضیح نمونه ۲ مربوط به ویژگی‌های فهرست عمومی';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'پارامترهایی برای گروه‌های دسترسی نمونه مربوط به ویژگی‌های فهرست عمومی';

}

1;
