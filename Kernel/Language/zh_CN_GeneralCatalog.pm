# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = '功能';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = '目录管理';
    $Self->{Translation}->{'Add Catalog Item'} = '添加目录项目';
    $Self->{Translation}->{'Add Catalog Class'} = '添加新目录类';
    $Self->{Translation}->{'Catalog Class'} = '目录类';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = '系统管理。';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = '创建和管理目录';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        '在系统管理中注册目录管理模块AdminGeneralCatalog的前端模块。';
    $Self->{Translation}->{'General Catalog'} = '目录';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        '目录属性样例-注释2的参数设置。';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        '目录属性样例-权限组的参数。';

}

1;
