# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ms_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Computer'} = '';
    $Self->{Translation}->{'Hardware'} = '';
    $Self->{Translation}->{'Network'} = '';
    $Self->{Translation}->{'Software'} = '';
    $Self->{Translation}->{'Address'} = 'Alamat';
    $Self->{Translation}->{'Admin Tool'} = 'Admin Tool';
    $Self->{Translation}->{'Backup Device'} = 'Peralatan Backup';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Building'} = 'Bangunan';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'ConfigItem Baru (ID=%s)';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'ConfigItem (ID=%s) dipadam';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'Definisi ConfigItems dikemaskini (ID=%s)';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'Gunakan status berubah (baru=%s; lama=%s)';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'Status Insiden berubah (baru=%s; lama=%s)';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'Pautan ditambah pada %s (jenis=%s)';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'Pautan dipadam pada %s (jenis=%s)';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'nama ditukar (baru=%s; lama=%s)';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'Atribut% s "%s" kepada "%s" berubah';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'Versi baru menjana (ID=%s)';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'Versi %s dipadam';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = 'CISejarah::LampiranTambah';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = 'CISejarah::LampiranPadam';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Capacity'} = 'Muatan';
    $Self->{Translation}->{'Change Definition'} = 'Ubah definisi';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'Perubahan definisi gagal! Lihat Log Sistem untuk maklumat lanjut.';
    $Self->{Translation}->{'Client Application'} = 'Aplikasi pelanggan';
    $Self->{Translation}->{'Client OS'} = 'OS Pelanggan';
    $Self->{Translation}->{'Config Item-Area'} = 'Config Perkara-Kawasan';
    $Self->{Translation}->{'Config Items available'} = 'Item config disediakan';
    $Self->{Translation}->{'Config Items shown'} = 'Item config ditunjukkan';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'Demo';
    $Self->{Translation}->{'Desktop'} = 'Desktop';
    $Self->{Translation}->{'Developer Licence'} = 'Lesen Pemaju';
    $Self->{Translation}->{'Docking Station'} = 'Dok Stesen';
    $Self->{Translation}->{'Duplicate'} = 'Gandakan';
    $Self->{Translation}->{'Embedded'} = 'terbenam';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Medan kosong menunjukkan bahawa nilai semasa disimpan';
    $Self->{Translation}->{'Enterprise Licence'} = 'Lesen Enterprise';
    $Self->{Translation}->{'Expiration Date'} = 'Tarikh Tamat Tempoh';
    $Self->{Translation}->{'Expired'} = 'Tamat Tempoh';
    $Self->{Translation}->{'Floor'} = 'tingkat';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Gerbang';
    $Self->{Translation}->{'Graphic Adapter'} = 'Penyesuai grafik';
    $Self->{Translation}->{'Hard Disk'} = 'Cakera Keras';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Cakera Keras :: Kapasiti';
    $Self->{Translation}->{'Hide Versions'} = 'Sembunyi Versi';
    $Self->{Translation}->{'IP Address'} = 'IP Addresse';
    $Self->{Translation}->{'IP over DHCP'} = 'IP lebih DHCP';
    $Self->{Translation}->{'IT Facility'} = 'IT Kemudahan';
    $Self->{Translation}->{'Incident'} = 'insiden';
    $Self->{Translation}->{'Install Date'} = 'Pasang Tarikh';
    $Self->{Translation}->{'Keyboard'} = 'Juruteknik';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Laptop';
    $Self->{Translation}->{'Last Change'} = 'Perubahan akhir';
    $Self->{Translation}->{'Licence Key'} = 'Kunci Lesen';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Kunci Lesen :: Tarikh Tamat Tempoh';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Kunci Lesen:: Kuantiti';
    $Self->{Translation}->{'Licence Type'} = 'Jenis Lesen';
    $Self->{Translation}->{'Maintenance'} = 'penyelenggaraan';
    $Self->{Translation}->{'Maximum number of one element'} = 'Bilangan maksimum satu elemen';
    $Self->{Translation}->{'Media'} = 'Media';
    $Self->{Translation}->{'Middleware'} = 'Middleware';
    $Self->{Translation}->{'Model'} = 'Model';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Mouse'} = 'tetikus';
    $Self->{Translation}->{'Network Adapter'} = 'Network Adapter';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Network Adapter :: IP Address';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Network Adapter :: IP lebih DHCP';
    $Self->{Translation}->{'Network Address'} = 'Alamat Rangkaian';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Rangkaian Alamat :: Gerbang';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Rangkaian Alamat :: Subnet Mask';
    $Self->{Translation}->{'Open Source'} = 'Sumber Terbuka';
    $Self->{Translation}->{'Operational'} = 'operasi';
    $Self->{Translation}->{'Other'} = 'lain-lain';
    $Self->{Translation}->{'Other Equipment'} = 'Peralatan lain-lain';
    $Self->{Translation}->{'Outlet'} = 'Outlet';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA Kad';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'per Nod';
    $Self->{Translation}->{'Per Processor'} = 'untuk Pemproses';
    $Self->{Translation}->{'Per Server'} = 'Setiap pelayan';
    $Self->{Translation}->{'Per User'} = 'setiap Pengguna';
    $Self->{Translation}->{'Phone 1'} = 'Telefon 1';
    $Self->{Translation}->{'Phone 2'} = 'Telefon 2';
    $Self->{Translation}->{'Pilot'} = 'Pilot';
    $Self->{Translation}->{'Planned'} = 'Dirancang';
    $Self->{Translation}->{'Printer'} = 'pencetak';
    $Self->{Translation}->{'Production'} = 'pengeluaran';
    $Self->{Translation}->{'Quantity'} = 'Kuantiti';
    $Self->{Translation}->{'Rack'} = 'Rak';
    $Self->{Translation}->{'Ram'} = 'memori utama';
    $Self->{Translation}->{'Repair'} = 'Membaiki';
    $Self->{Translation}->{'Retired'} = 'bersara';
    $Self->{Translation}->{'Review'} = 'mengkaji';
    $Self->{Translation}->{'Room'} = 'Bilik';
    $Self->{Translation}->{'Router'} = 'Router';
    $Self->{Translation}->{'Scanner'} = 'Pengimbas';
    $Self->{Translation}->{'Search Config Items'} = 'Carian Config Item';
    $Self->{Translation}->{'Security Device'} = 'Peranti Keselamatan';
    $Self->{Translation}->{'Serial Number'} = 'Nombor Series';
    $Self->{Translation}->{'Server'} = 'Pelayan';
    $Self->{Translation}->{'Server Application'} = 'Permohonan Pelayan';
    $Self->{Translation}->{'Server OS'} = 'Server OS';
    $Self->{Translation}->{'Show Versions'} = 'Papar versi';
    $Self->{Translation}->{'Single Licence'} = 'Lesen Sahaja';
    $Self->{Translation}->{'Subnet Mask'} = 'Subnet Mask';
    $Self->{Translation}->{'Switch'} = 'Tukar';
    $Self->{Translation}->{'Telco'} = 'Telko';
    $Self->{Translation}->{'Test/QA'} = 'Ujian/QA';
    $Self->{Translation}->{'The deployment state of this config item'} = 'Keadaan penempatan item ini config';
    $Self->{Translation}->{'The incident state of this config item'} = 'Keadaan insiden bagi config item ini';
    $Self->{Translation}->{'Time Restricted'} = 'masa Terhad';
    $Self->{Translation}->{'USB Device'} = 'Peranti USB';
    $Self->{Translation}->{'Unlimited'} = 'Tiada batasan';
    $Self->{Translation}->{'User Tool'} = 'Alat pengguna';
    $Self->{Translation}->{'Volume Licence'} = 'Lesen Jilid';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'pusat akses WLAN';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Tarikh Waranti Peluputan';
    $Self->{Translation}->{'Workplace'} = 'Tempat kerja';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Pengurusan Config Item';
    $Self->{Translation}->{'Change class definition'} = 'Ubah definisi kelas';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = 'Definisi';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Config Item';
    $Self->{Translation}->{'Filter for Classes'} = 'Menapis Kelas';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Pilih Kelas dari senarai untuk mewujudkan Perkara Config baru.';
    $Self->{Translation}->{'Class'} = 'Kelas';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ItemKonfig ITSM Tindakan Pukal';
    $Self->{Translation}->{'Deployment state'} = 'Keadaan pertukaran';
    $Self->{Translation}->{'Incident state'} = 'Keadaan insiden';
    $Self->{Translation}->{'Link to another'} = 'Paut ke lain';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Nombor Barangan Konfigurasi Tidak Sah!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Nombor Barangan Konfigurasi lain untuk dipautkan dengan.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = 'Anda benar ingin membuang item config ini?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'Nama config item ini';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'Nama sudah digunakan oleh ConfigItems dengan Nombor(nombor-nombor) berikut: %s';
    $Self->{Translation}->{'Deployment State'} = 'Keadaan Pertukaran';
    $Self->{Translation}->{'Incident State'} = 'insiden keadaan';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'konteks Tetapan';
    $Self->{Translation}->{'Config Items per page'} = 'Item config per halaman';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = 'Jenis Pertukaran Keadaan';
    $Self->{Translation}->{'Current Incident State'} = 'Insiden keadaan semasa';
    $Self->{Translation}->{'Current Incident State Type'} = 'Nyatakan Jenis Insiden Semasa';
    $Self->{Translation}->{'Last changed'} = 'Terkini berubah';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = 'Cipta Templat Baharu';
    $Self->{Translation}->{'Run Search'} = 'Jalankan Carian';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Juga mencari dalam versi sebelumnya?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Perkara konfigurasi';
    $Self->{Translation}->{'Configuration Item Information'} = 'Maklumat Barangan Konfigurasi';
    $Self->{Translation}->{'Current Deployment State'} = 'Pertukaran keadaan semasa';
    $Self->{Translation}->{'Last changed by'} = 'Terakhir diubah oleh';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Show one version'} = 'Tunjukkan satu versi';
    $Self->{Translation}->{'Show all versions'} = 'Tunjukkan semua versi';
    $Self->{Translation}->{'Version Incident State'} = 'Versi Insiden Negeri';
    $Self->{Translation}->{'Version Deployment State'} = 'Versi Keadaan Pertukaran';
    $Self->{Translation}->{'Version Number'} = 'Bilangan versi';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Konfigurasi Versi Item Keperinchian';
    $Self->{Translation}->{'Property'} = 'harta';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = 'ITSM ConfigItem';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = 'CIHistory::';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = 'ConfigItem';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Tiada Keputusan!';
    $Self->{Translation}->{'Config Item Search Results'} = 'Hasil carian ConfigItem';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Admin.';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Semak nama yang unik sahaja di dalam kelas ConfigItem yang sama (\'kelas\') atau di peringkat global (\'global\'), yang bermaksud setiap ConfigItem sedia ada diambil kira ketika mencari pendua.';
    $Self->{Translation}->{'Config Items'} = 'Barangan Konfigurasi';
    $Self->{Translation}->{'Config item add.'} = 'Tambah item config.';
    $Self->{Translation}->{'Config item edit.'} = 'Edit item config.';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Modul acara barangan konfigurasi yang membenarkan untuk log ke sejarah dalam antara muka agen.';
    $Self->{Translation}->{'Config item history.'} = 'Sejarah item config.';
    $Self->{Translation}->{'Config item print.'} = 'Cetak item config.';
    $Self->{Translation}->{'Config item zoom.'} = 'Zum item config.';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Had Barangan Konfigurasi';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'Had Barangan Konfigurasi setiap muka surat';
    $Self->{Translation}->{'Configuration Management Database.'} = 'Konfigurasi Pengurusan Pangkalan Data.';
    $Self->{Translation}->{'Configuration item bulk module.'} = 'Konfigurasi item modul pukal.';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        ' Router carian belakang barangan konfigurasi antara muka ejen.';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Cipta dan urus takrifan untuk Barangan Konfigurasi.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Takrifkan Tindakan dimana butang tetapan itu ada dalam widget objek bersambung (LinkObject::ViewMode = "complex"). Sila pastikan yang Tindakan ini perlu didaftarkan yang berikut fail-fail JS dan CSS: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.';
    $Self->{Translation}->{'Define the group with permissions.'} = 'Takrifkan kumpulan tersebut dengan keizinan.';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'Mentakrifkan kebenaran yang diperlukan untuk mencipta barangan konfigurasi ITSM menggunakan Antara Muka Generik.';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        'Takrifkan keizinan yang diperlukan untuk membuang item konfigurasi ITSM menggunakan Antaramuka Umum.';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'Mentakrifkan kebenaran yang diperlukan untuk mendapatkan barangan konfigurasi ITSM menggunakan Antara Muka Generik.';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'Mentakrifkan kebenaran yang diperlukan untuk mencari barangan konfigurasi ITSM menggunakan Antara Muka Generik.';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'Mentakrifkan kebenaran yang diperlukan untuk mengemaskini barangan konfigurasi ITSM menggunakan Antara Muka Generik.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Mentakrifkan modul gambaran untuk menunjukkan pandangan yang kecil senarai item konfigurasi.';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'Mentakrifkan ungkapan biasa secara individu untuk setiap kelas ItemKonfig untuk memeriksa nama ItemKonfig dan untuk menunjukkan mesej ralat sepadan.';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Definiert das Standard-Subobject der Klasse';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Menentukan bilangan baris untuk editor definisi CI dalam antara muka admin.';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        'Takrifkan susunan keadaan insiden daripada tinggi (cth. kritikal) ke rendah (cth. fungsian).';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        'Takrifkan keadaan penempatan yang releven dimana tiket bersambung boleh menjejaskan status bagi CI.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'Mentakrifkan had carian untuk skrin ItemKonfigITSMAgen.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'Mentakrifkan had carian untuk skrin CarianItemKonfigITSMAgen.';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'Mentakrifkan ruangan ditunjukkan dalam gambaran keseluruhan item konfig. Pilihan ini tidak mempunyai kesan ke atas kedudukan ruangan. Nota: ruangan Kelas sentiasa ada jika penapis \'Semua\' dipilih.';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Mentakrifkan ruangan yang ditunjukkan dalam carian item konfig. Pilihan ini tidak mempunyai kesan ke atas kedudukan tiang.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Mentakrifkan ruangan ditunjukkan daripada CIs dalam gambaran keseluruhan item konfig bergantung kepada kelas CI . Setiap penyertaan hendaklah dimulakan dengan nama kelas dan titik bertindih dua (iaitu Komputer::). Terdapat beberapa sifat-CI yang ada pada kesemua CIs (contoh untuk kelas Komputer:Komputer::Nama, Komputer::CurDeplState, Komputer::MasaCipta). Untuk menunjukkan sifat individu CI sebagaimana yang ditakrifkan dalam Definisi-CI, skim berikut mesti digunakan (contoh untuk kelas Komputer): Komputer::harddisk::1, Komputer::harddisk::1::Kapasiti::1, komputer::harddisk::2, Komputer::harddisk::2::Kapasiti::1. Jika tiada penyertaan untuk kelas CI, maka ruangan default ditunjukkan sebagaimana yang ditakrifkan dalam ITSMKonfigItem::Bahagian Depan::AgentITSMKonfigItem###TunjukRuangan.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Mentakrifkan ruangan ditunjukkan daripada CIs dalam gambaran keseluruhan item konfig bergantung kepada kelas CI . Setiap penyertaan hendaklah dimulakan dengan nama kelas dan titik bertindih dua (iaitu Komputer::). Terdapat beberapa sifat-CI yang ada pada kesemua CIs (contoh untuk kelas Komputer:Komputer::Nama, Komputer::CurDeplState, Komputer::MasaCipta). Untuk menunjukkan sifat individu CI sebagaimana yang ditakrifkan dalam Definisi-CI, skim berikut mesti digunakan (contoh untuk kelas Komputer): Komputer::harddisk::1, Komputer::harddisk::1::Kapasiti::1, komputer::harddisk::2, Komputer::harddisk::2::Kapasiti::1. Jika tiada penyertaan untuk kelas CI, maka ruangan default ditunjukkan sebagaimana yang ditakrifkan dalam ITSMKonfigItem::Bahagian Depan::AgentITSMKonfigItem###TunjukRuangan.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'Mentakrifkan ruangan ditunjukkan CIs dalam pandangan pautan jadual kompleks, bergantung kepada kelas CI . Setiap penyertaan hendaklah dimulakan dengan nama kelas dan titik bertindih dua (iaitu Komputer::). Terdapat beberapa Sifat-sifat-CI yang sama kepada semua CIs (contoh untuk kelas Komputer:Komputer::Nama, Komputer::CurDeplState, Komputer::CreateTime). Untuk menunjukkan sifat individu CI sebagaimana yang ditakrifkan dalam Definisi-CI, skim berikut mesti digunakan (contoh untuk kelas Komputer): Komputer::harddisk::1, Komputer::harddisk::1::Kapasiti::1, komputer::harddisk::2, Komputer::harddisk::2::Kapasiti::1. Jika tiada penyertaan untuk kelas CI, maka ruangan default dipaparkan.';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        'Takrifkan jenis sambungan yang mana (dinamakan daripada perspektif tiket) boleh menjejaskan status bagi satu sambungan CI.';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        'Takrifkan jenis tiket yang mana boleh menjejaskan status bagi satu sambungan CI.';
    $Self->{Translation}->{'Deployment State Color'} = 'Penempatan Keadaan Warna.';
    $Self->{Translation}->{'Deployment State Color.'} = 'Penempatan Keadaan Warna.';
    $Self->{Translation}->{'Deployment State Type.'} = 'Penempatan Keadaan Jenis.';
    $Self->{Translation}->{'Disabled'} = 'Tidak dibolehkan';
    $Self->{Translation}->{'Enabled'} = 'Dibolehkan';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'Membolehkan ciri tindakan pukal item konfigurasi untuk frontend ejen untuk bekerja pada lebih daripada satu item konfigurasi pada satu masa.';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'Membolehkan ciri item konfigurasi tindakan pukal hanya untuk kumpulan yang disenaraikan.';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        'Membolehkan/melumpuhkan fungsi untuk menyemak KonfigItem untuk nama-nama yang unik. Sebelum membolehkan pilihan ini anda perlu menyemak sistem anda untuk barangan konfig yang telah sedia ada dengan nama yang sama. Anda boleh melakukan ini dengan bin skrip/otrs.ITSMConfigItemListDuplicates.pl.';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        'Model acara untuk menyediakan status-itemconfig atas sambungan-itemconfig-tiket.';
    $Self->{Translation}->{'ITSM config item overview.'} = 'pandangan item config ITSM.';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Modul untuk menyemak kumpulan bertanggungjawab untuk kelas.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Modul untuk menyemak kumpulan bertanggungjawab untuk item konfigurasi.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Modul untuk menjana statistik konfig item ITSM.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Objekt-Backend Modul Registration des Import/Export Moduls.';
    $Self->{Translation}->{'Overview.'} = 'Pandangan keseluruhan.';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'Parameter untuk warna keadaan mengatur kedudukan dalam paparan pilihan dari paparan ejen.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Parameter untuk keadaan mengatur kedudukan dalam paparan pilihan dari paparan ejen.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parameter untuk contoh kumpulan yang dibenarkan pada ciri-ciri katalog.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Parameter untuk muka surat (di mana item konfigurasi ditunjukkan).';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'Memerlukan kebenaran untuk menggunakan skrin item konfigurasi ITSM dalam paparan ejen.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'Memerlukan kebenaran untuk menggunakan skrin carian item konfigurasi ITSM dalam paparan ejen.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'Memerlukan kebenaran untuk menggunakan skrin zum item konfigurasi ITSM dalam paparan ejen.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'Memerlukan kebenaran untuk menggunakan skrin tambah item konfigurasi ITSM dalam paparan ejen.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'Memerlukan kebenaran untuk menggunakan skrin edit item konfigurasi ITSM dalam paparan ejen.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'Memerlukan kebenaran untuk menggunakan skrin sejarah item konfigurasi ITSM dalam paparan ejen.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'Memerlukan kebenaran untuk menggunakan skrin cetak item konfigurasi ITSM dalam paparan ejen.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = 'Keistimewaan-keistimewaan dikehendaki untuk memadamkan barang-barang config.';
    $Self->{Translation}->{'Search config items.'} = 'Cari barang-barang config.';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Memilih item konfigurasi modul penjana nombor. "PenambahanAuto" menambah bilangan item tatarajah, SistemID, KonfigItemClassID dan kaunter digunakan. Format ini adalah "SystemID.ConfigItemClassID.Counter ", contohnya 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        'Menentukan keadaan insiden bagi CI secara automatik apabila suatu Tiket disambungkan kepada suatu CI.';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'Set keadaan penempatan dalam skrin pukal item konfigurasi antara muka ejen.';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'Set keadaan insiden dalam skrin pukal item konfigurasi antara muka ejen.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Menunjukkan pautan dalam menu yang membolehkan menghubungkan item konfigurasi dengan objek lain dalam pandangan zum item konfig bagi antara muka ejen.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'Tunjuk pautan dalam menu untuk mengakses sejarah item konfigurasi di dalam gambaran keseluruhan item konfigurasi antara muka agen.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Menunjukkan pautan dalam menu untuk mengakses sejarah item konfigurasi dalam pandangan zum antara muka ejen.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        'Menunjukkan satu sambungan kepada menu untuk memadam satu barang konfigurasi  dalam pandangan zumnya daripada antaramuka ejen.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'Tunjuk pautan dalam menu untuk menyalin item konfigurasi di dalam gambaran keseluruhan item konfigurasi antara muka agen.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Menunjukkan pautan dalam menu untuk menyalin barangan konfigurasi dalam pandangan zum antara muka ejen.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Menunjukkan pautan dalam menu untuk edit barangan konfigurasi dalam pandangan zum antara muka ejen.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        'menunjukkan suatu sambungan pada menu untuk kembali dalam zoom item konfigurasi daripada antara muka agen';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Menunjukkan pautan dalam menu untuk mencetak barangan konfigurasi dalam pandangan zum antara muka ejen.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'Tunjuk pautan dalam menu untuk zum ke dalam barangan konfigurasi di dalam gambaran keseluruhan barangan konfigurasi antara muka agen.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Tunjuk sejarah barangan konfig (urutan terbalik) dalam antara muka agen.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'Pengecam untuk item konfigurasi, contoh: ConfigItem#, MyConfigItem#. Default ialah ConfigItem#.';
    $Self->{Translation}->{'class'} = 'kelas';
    $Self->{Translation}->{'global'} = 'global';

}

1;
