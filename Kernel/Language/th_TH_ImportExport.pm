# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::th_TH_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'เพิ่มแม่แบบการทำแผนที่';
    $Self->{Translation}->{'Charset'} = 'เซตคาเรกเตอร์';
    $Self->{Translation}->{'Colon (:)'} = 'เครื่องหมายทวิภาค (:)';
    $Self->{Translation}->{'Column'} = 'คอลัมน์';
    $Self->{Translation}->{'Column Separator'} = 'ตัวคั่นคอลัมน์';
    $Self->{Translation}->{'Dot (.)'} = 'จุด(.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'เครื่องหมายอัฒภาค(;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'ตัวทำตาราง(แท็บ)';
    $Self->{Translation}->{'Include Column Headers'} = 'รวมทั้งส่วนหัวของคอลัมน์';
    $Self->{Translation}->{'Import summary for'} = 'นำเข้าบทสรุปสำหรับ';
    $Self->{Translation}->{'Imported records'} = 'การบันทึกได้นำเข้าแล้ว';
    $Self->{Translation}->{'Exported records'} = 'การบันทึกได้ส่งออกแล้ว';
    $Self->{Translation}->{'Records'} = 'การบันทึก';
    $Self->{Translation}->{'Skipped'} = 'ข้ามแล้ว';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'การจัดการ นำเข้า/ส่งออก';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'สร้างแม่แบบเพื่อนำเข้าและส่งออกข้อมูลออบเจกต์';
    $Self->{Translation}->{'Start Import'} = 'เริ่มนำเข้า';
    $Self->{Translation}->{'Start Export'} = 'เริ่มส่งออก';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = '';
    $Self->{Translation}->{'Name is required!'} = 'ต้องระบุชื่อ!';
    $Self->{Translation}->{'Object is required!'} = 'ต้องระบุออบเจกต์!';
    $Self->{Translation}->{'Format is required!'} = 'ต้องระบุรูปแบบ!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = '';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'ต้องระบุ!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = '';
    $Self->{Translation}->{'No map elements found.'} = 'ไม่พบองค์ประกอบแผนที่';
    $Self->{Translation}->{'Add Mapping Element'} = 'เพิ่มองค์ประกอบของการทำแผนที่';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = '';
    $Self->{Translation}->{'Restrict export per search'} = 'การจำกัดการส่งออกตามการค้นหา';
    $Self->{Translation}->{'Import information'} = 'ข้อมูลนำเข้า';
    $Self->{Translation}->{'Source File'} = 'แหล่งไฟล์';
    $Self->{Translation}->{'Success'} = 'ความสำเร็จ';
    $Self->{Translation}->{'Failed'} = 'ล้มเหลว';
    $Self->{Translation}->{'Duplicate names'} = 'ชื่อซ้ำ';
    $Self->{Translation}->{'Last processed line number of import file'} = 'หมายเลขของการประมวลครั้งสุดท้ายของการนำไฟล์เข้า';
    $Self->{Translation}->{'Ok'} = 'โอเค';

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
        'รูปแบบการลงทะเบียนโมดูล backend สำหรับโมดูลการนำเข้า / ส่งออก';
    $Self->{Translation}->{'Import and export object information.'} = 'การนำเข้าหรือส่งออกข้อมูลออบเจกต์';
    $Self->{Translation}->{'Import/Export'} = 'การนำเข้า/ส่งออก';

}

1;
