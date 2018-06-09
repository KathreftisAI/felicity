# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ro_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = '增加映射模版';
    $Self->{Translation}->{'Charset'} = '字符集';
    $Self->{Translation}->{'Colon (:)'} = '冒号 (:)';
    $Self->{Translation}->{'Column'} = '列';
    $Self->{Translation}->{'Column Separator'} = '列分隔符';
    $Self->{Translation}->{'Dot (.)'} = '句号 (.)';
    $Self->{Translation}->{'Semicolon (;)'} = '分号 (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'TAB键 (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = '包括列标题';
    $Self->{Translation}->{'Import summary for'} = '导入总结';
    $Self->{Translation}->{'Imported records'} = '导入记录';
    $Self->{Translation}->{'Exported records'} = '导出记录';
    $Self->{Translation}->{'Records'} = '记录';
    $Self->{Translation}->{'Skipped'} = '跳过的';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = '导入/导出管理';
    $Self->{Translation}->{'Create a template to import and export object information.'} = '创建模板导入和导出对象信息。';
    $Self->{Translation}->{'Start Import'} = '开始导入';
    $Self->{Translation}->{'Start Export'} = '开始导出';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = '';
    $Self->{Translation}->{'Name is required!'} = '命名是必需的！';
    $Self->{Translation}->{'Object is required!'} = '对象是必需的！';
    $Self->{Translation}->{'Format is required!'} = '格式是必需的！';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = '';
    $Self->{Translation}->{'Step 3 of 5'} = '';
    $Self->{Translation}->{'is required!'} = '是必需的！';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = '';
    $Self->{Translation}->{'No map elements found.'} = '没有找到映射的字段';
    $Self->{Translation}->{'Add Mapping Element'} = '添加映射字段';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = '';
    $Self->{Translation}->{'Restrict export per search'} = '按搜索限制导出';
    $Self->{Translation}->{'Import information'} = '导入信息';
    $Self->{Translation}->{'Source File'} = '源文件';
    $Self->{Translation}->{'Success'} = '成功';
    $Self->{Translation}->{'Failed'} = '失败';
    $Self->{Translation}->{'Duplicate names'} = '重复的名称';
    $Self->{Translation}->{'Last processed line number of import file'} = '导入文件最后处理的行数';
    $Self->{Translation}->{'Ok'} = '确定';

    # Perl Module: Kernel/Modules/AdminImportExport.pm
    $Self->{Translation}->{'No object backend found!'} = '';
    $Self->{Translation}->{'No format backend found!'} = '';
    $Self->{Translation}->{'Template not found!'} = '';
    $Self->{Translation}->{'Can\'t insert/update template!'} = '';
    $Self->{Translation}->{'Needed TemplateID!'} = '';
    $Self->{Translation}->{'Error occurred. Import impossible! See Syslog for details.'} = '';
    $Self->{Translation}->{'Error occurred. Export impossible! See Syslog for details.'} = '';
    $Self->{Translation}->{'number'} = '';
    $Self->{Translation}->{'number bigger than zero'} = '';
    $Self->{Translation}->{'integer'} = '';
    $Self->{Translation}->{'integer bigger than zero'} = '';
    $Self->{Translation}->{'Element required, please insert data'} = '';
    $Self->{Translation}->{'Invalid data, please insert a valid %s'} = '';
    $Self->{Translation}->{'Format not found!'} = '';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} =
        '为导入/导出模块的格式后端模块注册。';
    $Self->{Translation}->{'Import and export object information.'} = '导入和导出对象信息。';
    $Self->{Translation}->{'Import/Export'} = '导入/导出';

}

1;
