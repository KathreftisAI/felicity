# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ms_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'Tambah templat peta';
    $Self->{Translation}->{'Charset'} = 'Set karakter';
    $Self->{Translation}->{'Colon (:)'} = 'Titik bertindih (:)';
    $Self->{Translation}->{'Column'} = 'Kolum';
    $Self->{Translation}->{'Column Separator'} = 'Kolum pemisah';
    $Self->{Translation}->{'Dot (.)'} = 'Titik (.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'Semikolon (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'Tabulator (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'Termasuk Kolum Kepala';
    $Self->{Translation}->{'Import summary for'} = 'Import ringkasan untuk';
    $Self->{Translation}->{'Imported records'} = 'Rekod yang diimport';
    $Self->{Translation}->{'Exported records'} = 'Rekod yang dieksport';
    $Self->{Translation}->{'Records'} = 'Rekod-rekod';
    $Self->{Translation}->{'Skipped'} = 'Melangkaui';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Pengurusan Import/Eksport';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'Cipta templat untuk import dan eksport informasi objek.';
    $Self->{Translation}->{'Start Import'} = 'Mula import';
    $Self->{Translation}->{'Start Export'} = 'Mula eksport';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = '';
    $Self->{Translation}->{'Name is required!'} = 'Nama dikehendaki!';
    $Self->{Translation}->{'Object is required!'} = 'Objek adalah diperlukan!';
    $Self->{Translation}->{'Format is required!'} = 'Format adalah diperlukan!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = '';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = 'diperlukan!';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = '';
    $Self->{Translation}->{'No map elements found.'} = 'Tiada elemen peta ditemui.';
    $Self->{Translation}->{'Add Mapping Element'} = 'Tambah elemen peta';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = '';
    $Self->{Translation}->{'Restrict export per search'} = 'Dilarang eksport per carian';
    $Self->{Translation}->{'Import information'} = 'Informasi import';
    $Self->{Translation}->{'Source File'} = 'Sumber fail';
    $Self->{Translation}->{'Success'} = 'Berjaya';
    $Self->{Translation}->{'Failed'} = 'Gagal';
    $Self->{Translation}->{'Duplicate names'} = 'Menyalin nama-nama';
    $Self->{Translation}->{'Last processed line number of import file'} = 'Nombor baris terakhir diproses fail import';
    $Self->{Translation}->{'Ok'} = 'Ok';

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
        'Format backend modul pendaftaran untuk modul import/eksport.';
    $Self->{Translation}->{'Import and export object information.'} = 'Informasi objek import dan eksport.';
    $Self->{Translation}->{'Import/Export'} = 'Import/Eksport';

}

1;
