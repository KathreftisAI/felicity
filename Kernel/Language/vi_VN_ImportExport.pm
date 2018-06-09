# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::vi_VN_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Thêm mẫu mapping';
    $Self->{Translation}->{'Charset'} = 'Bộ mã ký tự';
    $Self->{Translation}->{'Colon (:)'} = 'Dấu hai chấm (:)';
    $Self->{Translation}->{'Column'} = 'Cột';
    $Self->{Translation}->{'Column Separator'} = 'Phân cách cột';
    $Self->{Translation}->{'Dot (.)'} = 'Dấu chấm (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Dấu chấm phẩy (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Bộ lập bảng (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Gồm tiêu đề cột';
    $Self->{Translation}->{'Import summary for'} = 'Tóm lược nhập vào cho';
    $Self->{Translation}->{'Imported records'} = 'Bản ghi được nhập';
    $Self->{Translation}->{'Exported records'} = 'Bản ghi được xuất';
    $Self->{Translation}->{'Records'} = 'Bản ghi';
    $Self->{Translation}->{'Skipped'} = 'Bị bỏ qua';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Quản lý Nhập/Xuất';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Tạo một mẫu để nhập và xuất thông tin đối tượng.';
    $Self->{Translation}->{'Start Import'} = 'Bắt đầu nhập vào';
    $Self->{Translation}->{'Start Export'} = 'Bắt đầu xuất ra';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = '';
    $Self->{Translation}->{'Name is required!'} = 'Yêu cầu phải có tên!';
    $Self->{Translation}->{'Object is required!'} = 'Yêu cầu phải có đối tượng!';
    $Self->{Translation}->{'Format is required!'} = 'Yêu cầu phải có định dạng!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = '';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'là bắt buộc!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = '';
    $Self->{Translation}->{'No map elements found.'} = 'Không tìm thấy đối tượng map.';
    $Self->{Translation}->{'Add Mapping Element'} = 'Thêm đối tượng mapping';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = '';
    $Self->{Translation}->{'Restrict export per search'} = 'Giới hạn dữ liệu xuất mỗi lần tìm kiếm';
    $Self->{Translation}->{'Import information'} = 'Thông tin nhập vào';
    $Self->{Translation}->{'Source File'} = 'Tệp nguồn';
    $Self->{Translation}->{'Success'} = 'Thành công';
    $Self->{Translation}->{'Failed'} = 'Lỗi';
    $Self->{Translation}->{'Duplicate names'} = 'Trùng tên';
    $Self->{Translation}->{'Last processed line number of import file'} = 'Dòng cuối cùng được xử lý trong tệp nhập vào';
    $Self->{Translation}->{'Ok'} = 'Đồng ý';

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
        'Đăng ký mô-đun định dạng nền cho mô-đun nhập/xuất';
    $Self->{Translation}->{'Import and export object information.'} = 'Thông tin nhập và xuất đối tượng.';
    $Self->{Translation}->{'Import/Export'} = 'Nhập/Xuất';

}

1;
