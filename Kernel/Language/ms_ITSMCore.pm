# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ms_ITSMCore;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMCore
    $Self->{Translation}->{'Alternative to'} = 'Alternatif kepada';
    $Self->{Translation}->{'Availability'} = 'Verfügbarkeit';
    $Self->{Translation}->{'Back End'} = 'Backend';
    $Self->{Translation}->{'Connected to'} = 'Dihungkan kepada';
    $Self->{Translation}->{'Current State'} = 'Status sedia ada';
    $Self->{Translation}->{'Demonstration'} = 'Demostrasi';
    $Self->{Translation}->{'Depends on'} = 'Bergantung kepada';
    $Self->{Translation}->{'End User Service'} = 'Pengguna Akhir Servis';
    $Self->{Translation}->{'Errors'} = 'Kesilapan';
    $Self->{Translation}->{'Front End'} = 'Frontend';
    $Self->{Translation}->{'IT Management'} = 'Pengurusan IT';
    $Self->{Translation}->{'IT Operational'} = 'Operasi IT';
    $Self->{Translation}->{'Impact'} = 'Kesan';
    $Self->{Translation}->{'Incident State'} = 'insiden keadaan';
    $Self->{Translation}->{'Includes'} = 'Termasuk';
    $Self->{Translation}->{'Other'} = 'Selain';
    $Self->{Translation}->{'Part of'} = 'Sebahagian daripada';
    $Self->{Translation}->{'Project'} = 'Projek';
    $Self->{Translation}->{'Recovery Time'} = 'Masa Sembuhan';
    $Self->{Translation}->{'Relevant to'} = 'Berkaitan kepada';
    $Self->{Translation}->{'Reporting'} = 'Melaporkan';
    $Self->{Translation}->{'Required for'} = 'Diperlukan untuk';
    $Self->{Translation}->{'Resolution Rate'} = 'kadar Resolusi';
    $Self->{Translation}->{'Response Time'} = 'Masa Tindak balas';
    $Self->{Translation}->{'SLA Overview'} = 'Lihat semula SLA';
    $Self->{Translation}->{'Service Overview'} = 'Lihat semula servis';
    $Self->{Translation}->{'Service-Area'} = 'Kawasan-Servis';
    $Self->{Translation}->{'Training'} = 'Latihan';
    $Self->{Translation}->{'Transactions'} = 'Transaksi';
    $Self->{Translation}->{'Underpinning Contract'} = 'Underpinning Contract';
    $Self->{Translation}->{'allocation'} = 'Menempatkan semula';

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality <-> Impact <-> Priority'} = 'Kritikal <-> Kesan <-> Keutamaan';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality <-> Impact.'} =
        'Menguruskan hasil keutamaan kritikal gabungan <-> Kesan.';
    $Self->{Translation}->{'Priority allocation'} = 'Berikan keutamaan';

    # Template: AdminSLA
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'Masa minima antara incident';

    # Template: AdminService
    $Self->{Translation}->{'Criticality'} = 'Kritikal';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = 'SLA-Informasi';
    $Self->{Translation}->{'Last changed'} = 'Kali terakhir diubah';
    $Self->{Translation}->{'Last changed by'} = 'Kali terakhir diubah semasa';
    $Self->{Translation}->{'Associated Services'} = 'Perkhidmatan Bersekutu';

    # Template: AgentITSMServiceZoom
    $Self->{Translation}->{'Service Information'} = 'Informasi Servis';
    $Self->{Translation}->{'Current incident state'} = 'Kejadian keadaan semasa';
    $Self->{Translation}->{'Associated SLAs'} = 'SLA Bersekutu';

    # Perl Module: Kernel/Modules/AgentITSMServicePrint.pm
    $Self->{Translation}->{'Current Incident State'} = 'Insiden status semasa';

    # SysConfig
    $Self->{Translation}->{'Both'} = 'Kedua-duanya';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked Services widget (LinkObject::ViewMode = "complex"). Note: Only Service attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the AdminITSMCIPAllocate configuration in the admin area.'} =
        'Frontend pendaftaran modul untuk konfigurasi AdminITSMCIPAllocate di kawasan admin.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} =
        'Frontend pendaftaran modul bagi objek AgentITSMSLA dalam antara muka ejen.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} =
        'Frontend pendaftaran modul untuk objek AgentITSMSLAPrint dalam antara muka ejen.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} =
        'Frontend pendaftaran modul untuk objek AgentITSMSLAZoom dalam antara muka ejen.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMService object in the agent interface.'} =
        'Frontend pendaftaran modul bagi objek AgentITSMService dalam antara muka ejen.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} =
        'Frontend pendaftaran modul untuk objek AgentITSMServicePrint dalam antara muka ejen.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} =
        'Frontend pendaftaran modul untuk objek AgentITSMServiceZoom dalam antara muka ejen.';
    $Self->{Translation}->{'ITSM SLA Overview.'} = 'tinjauan keseluruhan ITSM SLA';
    $Self->{Translation}->{'ITSM Service Overview.'} = 'Tinjauan Servis ITSM';
    $Self->{Translation}->{'Incident'} = 'insiden';
    $Self->{Translation}->{'Incident State Type'} = 'Jenis Keadaan Kejadian';
    $Self->{Translation}->{'Incident State Type.'} = 'Jenis Keadaan Kejadian.';
    $Self->{Translation}->{'Manage priority matrix.'} = 'Mengurus matriks keutamaan.';
    $Self->{Translation}->{'Module to show back link in service menu.'} = 'Modul untuk menunjukkan kembali pautan dalam menu perkhidmatan.';
    $Self->{Translation}->{'Module to show back link in sla menu.'} = 'Modul untuk menunjukkan kembali pautan dalam menu SLA.';
    $Self->{Translation}->{'Module to show print link in service menu.'} = 'Modul untuk menunjukkan pautan cetak dalam menu perkhidmatan.';
    $Self->{Translation}->{'Module to show print link in sla menu.'} = 'Modul untuk menunjukkan pautan cetak dalam menu SLA.';
    $Self->{Translation}->{'Module to show the link link in service menu.'} = 'Modul untuk menunjukkan pautan pautan dalam menu perkhidmatan.';
    $Self->{Translation}->{'Operational'} = 'operasi';
    $Self->{Translation}->{'Parameters for the incident states in the preference view.'} = 'Parameter untuk keadaan insiden memandangkan keutamaan.';
    $Self->{Translation}->{'SLA Print.'} = 'Cetakan SLA.';
    $Self->{Translation}->{'SLA Zoom.'} = 'Zum SLA.';
    $Self->{Translation}->{'Service Print.'} = 'Cetakan Servis.';
    $Self->{Translation}->{'Service Zoom.'} = 'Zum Servis.';
    $Self->{Translation}->{'Set the type and direction of links to be used to calculate the incident state. The key is the name of the link type (as defined in LinkObject::Type), and the value is the direction of the IncidentLinkType that should be followed to calculate the incident state. For example if the IncidentLinkType is set to \'DependsOn\', and the Direction is \'Source\', only \'Depends on\' links will be followed (and not the opposite link \'Required for\') to calculate the incident state. You can add more link types ad directions as you like, e.g. \'Includes\' with the direction \'Target\'. All link types defined in the sysconfig options LinkObject::Type are possible and the direction can be \'Source\', \'Target\', or \'Both\'. IMPORTANT: AFTER YOU MAKE CHANGES TO THIS SYSCONFIG OPTION YOU NEED TO RUN THE SCRIPT bin/otrs.ITSMConfigItemIncidentStateRecalculate.pl SO THAT ALL INCIDENT STATES WILL BE RECALCULATED BASED ON THE NEW SETTINGS!'} =
        'Menetapkan jenis dan arah pautan yang digunakan untuk mengira keadaan insiden. Kuncinya adalah nama jenis link (sebagaimana ditakrifkan dalam PautanObjek::Jenis) , dan nilai adalah arah JenisPautanInsiden yang perlu diikuti untuk mengira keadaan insiden itu. Sebagai contoh jika JenisPautanInsiden ditetapkan kepada \' Bergantung Kepada \', dan Arah adalah \' Sumber\' , hanya \' Bergantung Kepada \' pautan akan diikuti (dan bukan pautan bertentangan \' Yang diperlukan untuk\' ) untuk mengira keadaan insiden. Anda boleh menambah lebih banyak arahan jenis pautan yang anda suka, contohnya \' Termasuk\' dengan arah \' Sasaran \'. Semua jenis pautan yang ditakrifkan dalam pilihan konfigsis PautanObjek::Jenis adalah mungkin dan arahnya mungkin \' Sumber \', \' Sasaran \', atau \' Kedua-dua\' . PENTING: SELEPAS ANDA MEMBUAT PERUBAHAN KEPADA TETAPAN KONFIGSIS ANDA PERLU MENJALANKAN SKRIP bin / otrs.ITSMKonfigurasiKiraansemulaKeadaanInsidenItem.pl SUPAYA SEMUA KEADAAN INSIDEN akan dikira semula BERDASARKAN TETAPAN BARU!';
    $Self->{Translation}->{'This setting defines that a \'ITSMChange\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'Ubah ITSM\' objek boleh dikaitkan dengan \'Tiket \' objek menggunakan \'Normal\'  jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM \' objek boleh dikaitkan dengan \'FAQ\' objek menggunakan \'Normal\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM \' objek boleh dikaitkan dengan \'FAQ\' objek menggunakan \'Ibu Bapa Anak Anak\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM \' objek boleh dikaitkan dengan \'FAQ\' objek menggunakan \'Relevan Untuk\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'AlternativeTo\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM \' objek boleh dikaitkan dengan \'Perkhidmatan\' objek menggunakan \'AlternativeTo\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM \' objek boleh dikaitkan dengan \'Perkhidmatan\' objek menggunakan \'Bergantung Pada\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'RelevantTo\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM\' objek boleh dikaitkan dengan \'Perkhidmatan\' objek menggunakan \'Relevan Untuk\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'AlternativeTo\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM\' objek boleh dikaitkan dengan \'Tiket\' objek menggunakan \'Alternatif Untuk\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'DependsOn\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM\' objek boleh dikaitkan dengan \'Tiket \' objek menggunakan \'Bergantung Pada\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'RelevantTo\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM\' objek boleh dikaitkan dengan \'Tiket\' objek menggunakan \'Relevan Untuk\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'AlternativeTo\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM\' objek boleh dikaitkan dengan lain \'ITSMConfigItem\' objek menggunakan \'AlternativeTo\' pautan jenis.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'ConnectedTo\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM\' objek boleh dikaitkan dengan lain \'ITSMConfigItem\' objek menggunakan \'ConnectedTo\' pautan jenis.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM\' objek boleh dikaitkan dengan lain \'ConfigItem ITSM\' objek menggunakan \'Bergantung Pada\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'Includes\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ConfigItem ITSM\' objek boleh dikaitkan dengan lain-lain \'ITSMConfigItem\' objek menggunakan \'Termasuk\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'RelevantTo\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'ITSM ConfigItem\' objek boleh dikaitkan dengan objek \'ConfigItem ITSM\'lain yang menggunakan \'Relevan Untuk\' yang jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'Perintah Kerja ITSM \' objek boleh dikaitkan dengan \'ConfigItem ITSM\'objek menggunakan \'Bergantung Pada\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'Normal\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'Perintah Kerja ITSM \' objek boleh dikaitkan dengan \'ConfigItem ITSM\' objek menggunakan \'Normal\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'Perintah Kerja ITSM \' objek boleh dikaitkan dengan \'Perkhidmatan\' objek menggunakan \'Bergantung Pada\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'Normal\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'Perintah Kerja ITSM \' objek boleh dikaitkan dengan \'Perkhidmatan \' objek menggunakan \'Normal \' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        'Tetapan ini mentakrifkan bahawa \'Perintah Kerja ITSM \' objek boleh dikaitkan dengan \'Tiket\' objek menggunakan \'Normal\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        'Tetapan ini mentakrifkan bahawa objek \'Perkhidmatan \' boleh dikaitkan dengan \'FAQ\' objek menggunakan \'Normal\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Tetapan ini mentakrifkan bahawa objek \'Perkhidmatan \' boleh dikaitkan dengan \'FAQ\' objek menggunakan \'Ibu Bapa Kanak-kanak\' jenis pautan.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        'Tetapan ini mentakrifkan bahawa objek \'Perkhidmatan \' boleh dikaitkan dengan \'FAQ\' objek menggunakan \'Relevan Untuk\' jenis pautan.';
    $Self->{Translation}->{'This setting defines the link type \'AlternativeTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Tetapan ini mentakrifkan jenis pautan \'AlternativeTo\'. Jika nama sumber dan nama sasaran mengandungi nilai yang sama, pautan yang terhasil adalah bukan satu arah. Jika nilai berbeza, pautan yang terhasil adalah pautan berarah.';
    $Self->{Translation}->{'This setting defines the link type \'ConnectedTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Tetapan ini mentakrifkan jenis pautan \'ConnectedTo\'. Jika nama sumber dan nama sasaran mengandungi nilai yang sama, pautan yang terhasil adalah bukan satu arah. Jika nilai berbeza, pautan yang terhasil adalah pautan berarah.';
    $Self->{Translation}->{'This setting defines the link type \'DependsOn\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Tetapan ini mentakrifkan jenis pautan \'Bergantung Pada\'. Jika nama sumber dan nama sasaran mengandungi nilai yang sama, pautan yang terhasil adalah bukan satu arah. Jika nilai berbeza, pautan yang terhasil adalah pautan berarah.';
    $Self->{Translation}->{'This setting defines the link type \'Includes\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Tetapan ini mentakrifkan jenis pautan \'Termasuk\'. Jika nama sumber dan nama sasaran mengandungi nilai yang sama, pautan yang terhasil adalah bukan satu arah. Jika nilai berbeza, pautan yang terhasil adalah pautan berarah.';
    $Self->{Translation}->{'This setting defines the link type \'RelevantTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Tetapan ini mentakrifkan jenis pautan \'RelevantTo\'. Jika nama sumber dan nama sasaran mengandungi nilai yang sama, pautan yang terhasil adalah bukan satu arah. Jika nilai berbeza, pautan yang terhasil adalah pautan berarah.';
    $Self->{Translation}->{'Width of ITSM textareas.'} = 'Lebar kawasan teks ITSM.';

}

1;
