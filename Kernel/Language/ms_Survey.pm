# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ms_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'Buat Survey Baru';
    $Self->{Translation}->{'Introduction'} = 'Pengenalan';
    $Self->{Translation}->{'Survey Introduction'} = 'Penyiasatan Pengenalan';
    $Self->{Translation}->{'Notification Body'} = 'Badan Pemberitahuan';
    $Self->{Translation}->{'Internal Description'} = 'Description dalaman';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'Edit Maklumat Umum';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Edit Soalan';
    $Self->{Translation}->{'Survey Questions'} = 'Penyiasatan Soalan';
    $Self->{Translation}->{'Add Question'} = 'Tambah Soalan';
    $Self->{Translation}->{'Type the question'} = 'Taip soalan';
    $Self->{Translation}->{'Answer required'} = 'Jawapan diperlukan';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Tiada soalan yang disimpan untuk kajian ini.';
    $Self->{Translation}->{'Question'} = 'Soalan';
    $Self->{Translation}->{'Answer Required'} = 'Jawapan diperlukan';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        'Apabila anda sudah selesai mengubah soalan kaji selidik hanya tutup skrin ini.';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'Adakah anda benar-benar ingin memadam soalan ini? SEMUA data berkaitan akan HILANG!';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = 'Edit Soalan';
    $Self->{Translation}->{'go back to questions'} = 'kembali kepada soalan-soalan';
    $Self->{Translation}->{'Question:'} = 'Soalan:';
    $Self->{Translation}->{'Possible Answers For'} = 'Jawapan Kemungkinan Untuk';
    $Self->{Translation}->{'Add Answer'} = 'Tambah Jawab';
    $Self->{Translation}->{'No answers saved for this question.'} = 'Tiada jawapan yang disimpan untuk soalan ini.';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = 'Adakah anda benar-benar ingin memadam jawapan ini?';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'Ini tidak mempunyai beberapa jawapan, textarea akan dipaparkan.';
    $Self->{Translation}->{'Edit Answer'} = 'Edit Jawapan';
    $Self->{Translation}->{'go back to edit question'} = 'kembali untuk mengedit soalan';
    $Self->{Translation}->{'Answer:'} = 'Jawapan:';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = 'Maksimum soal selidik ditunjukkan setiap halaman';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Pemberitahuan Pengirim';
    $Self->{Translation}->{'Notification Subject'} = 'Tertakluk Pemberitahuan';
    $Self->{Translation}->{'Changed By'} = 'Ditukar dengan';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = 'Gambaran Keseluruhan Statistik daripada';
    $Self->{Translation}->{'Requests Table'} = 'Jadual permintaan';
    $Self->{Translation}->{'Send Time'} = 'Masa Hantar';
    $Self->{Translation}->{'Vote Time'} = 'Masa Undi';
    $Self->{Translation}->{'See Details'} = 'Lihat maklumat';
    $Self->{Translation}->{'Survey Stat Details'} = 'Penyiasatan Details Stat';
    $Self->{Translation}->{'go back to stats overview'} = 'kembali ke Statistik gambaran keseluruhan';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Maklumat Ukur';
    $Self->{Translation}->{'Sent requests'} = 'menghantar permintaan';
    $Self->{Translation}->{'Received surveys'} = 'diterima kaji selidik';
    $Self->{Translation}->{'Survey Details'} = 'Penyiasatan terperinchi';
    $Self->{Translation}->{'Ticket Services'} = 'Perkhidmatan tiket';
    $Self->{Translation}->{'Survey Results Graph'} = 'Ukur Keputusan Graf';
    $Self->{Translation}->{'No stat results.'} = 'Tiada stat keputusan.';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Penyiasatan';
    $Self->{Translation}->{'Please answer these questions'} = 'Sila jawab soalan-soalan';
    $Self->{Translation}->{'Show my answers'} = 'Tunjukkan jawapan saya';
    $Self->{Translation}->{'These are your answers'} = 'Ini adalah jawapan anda';
    $Self->{Translation}->{'Survey Title'} = 'Tajuk Ukur';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = 'Tambah Ukur Baru';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = '';
    $Self->{Translation}->{'No SurveyID is given!'} = '';
    $Self->{Translation}->{'Survey Edit'} = 'Ukur Edit';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = '';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = '';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Penyiasatan Edit Soalan';
    $Self->{Translation}->{'Yes/No'} = 'Ya/Tidak';
    $Self->{Translation}->{'Radio (List)'} = 'Radio (Senarai)';
    $Self->{Translation}->{'Checkbox (List)'} = 'Checkbox (Senarai)';
    $Self->{Translation}->{'Question Type'} = 'Jenis soalan';
    $Self->{Translation}->{'Complete'} = 'lengkap';
    $Self->{Translation}->{'Incomplete'} = 'tidak lengkap';
    $Self->{Translation}->{'Question Edit'} = 'Edit soalan';
    $Self->{Translation}->{'Answer Edit'} = 'Edit Jawapan';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = 'Statistik Tinjauan';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = '';
    $Self->{Translation}->{'Stats Detail'} = 'Statistik Terperinchi';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'Tidak boleh menetapkan status baru! Tiada soalan yang ditakrifkan.';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = '';
    $Self->{Translation}->{'Status changed.'} = 'status berubah.';
    $Self->{Translation}->{'- No queue selected -'} = '-Tiada giliran dipilih-';
    $Self->{Translation}->{'- No ticket type selected -'} = '';
    $Self->{Translation}->{'- No ticket service selected -'} = '';
    $Self->{Translation}->{'- Change Status -'} = '- Ubah Status -';
    $Self->{Translation}->{'master'} = '';
    $Self->{Translation}->{'New Status'} = 'Status baharu';
    $Self->{Translation}->{'Survey Description'} = 'Huraian penyiasatan';
    $Self->{Translation}->{'answered'} = 'Dijawab';
    $Self->{Translation}->{'not answered'} = 'Tidak dijawab';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'Terima kasih atas maklum balas anda.';
    $Self->{Translation}->{'The survey is finished.'} = 'Kaji selidik itu selesai.';
    $Self->{Translation}->{'Survey Message!'} = '';
    $Self->{Translation}->{'Module not enabled.'} = '';
    $Self->{Translation}->{'This functionality is not enabled, please contact your administrator.'} =
        '';
    $Self->{Translation}->{'Survey Error!'} = '';
    $Self->{Translation}->{'Invalid survey key.'} = '';
    $Self->{Translation}->{'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'} =
        '';
    $Self->{Translation}->{'Survey Vote'} = '';
    $Self->{Translation}->{'Survey Vote Data'} = '';
    $Self->{Translation}->{'You have already answered the survey.'} = 'Anda telah menjawab kaji selidik.';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Satu Modul Penyiasatan';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Satu modul untuk mengedit soalan tinjauan';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        'Semua parameter bagi objek Ukur dalam antara muka ejen.';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        'Jumlah hari selepas menghantar mel kaji selidik di mana tiada permintaan kaji selidik baru dihantar kepada pelanggan yang sama. Memilih 0 akan sentiasa menghantar mel kaji selidik.';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        'Default badan untuk pemberitahuan e-mel kepada pelanggan tentang kaji selidik baru.';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        'Penghantar lalai untuk pemberitahuan e-mel kepada pelanggan tentang kaji selidik baru.';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        'Tertakluk lalai untuk pemberitahuan e-mel kepada pelanggan tentang kaji selidik baru.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        'Mentakrifkan modul gambaran untuk menunjukkan pandangan yang kecil senarai kaji selidik.';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        'Mentakrifkan jumlah maksimum kaji selidik yang mendapat dihantar kepada pelanggan setiap 30 hari. (0 bermakna tidak maksimum, semua permintaan kaji selidik akan dihantar).';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        'Mentakrifkan jumlah jam suatu tiket akan ditutup untuk mencetuskan penghantaran suatu kaji selidik, (0 bererti menghantar segera selepas penutupan). Nota: penghantaran kaji selidik tertunda adalah dilakuan oleh OTRS Daemon, pengaktifan sebelumnya tetapan \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\'.';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        'Mentakrifkan ketinggian lalai untuk penonton Teks Kaya untuk elemen Zoom Ukur.';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        'Mentakrifkan ruangan menunjukkan dalam gambaran kajian.Pilihan ini tidak mempunyai kesan ke atas kedudukan tiang.';
    $Self->{Translation}->{'Edit survey general information.'} = '';
    $Self->{Translation}->{'Edit survey questions.'} = '';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        'Dayakan atau nyahdayakan Undi Papar Data skrin dalam antara muka awam untuk menunjukkan data hasil kajian tertentu apabila pelanggan cuba untuk menjawab kaji selidik kali kedua.';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = 'Membolehkan atau melumpuhkan menghantar semakan keadaan untuk perkhidmatan itu.';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        'Membolehkan atau melumpuhkan menghantar semakan keadaan untuk jenis tiket.';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        'Bahagian depan pendaftaran modul untuk menambah kaji selidik dalam antara muka ejen.';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        'Bahagian depan pendaftaran modul untuk menyunting kaji selidik dalam antara muka ejen.';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        'Bahagian Depan pendaftaran modul statistik kajian dalam antara muka ejen.';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        'Frontend pendaftaran modul untuk zoom kaji selidik dalam antara muka ejen.';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        'Frontend pendaftaran modul bagi objek Ukur Awam di kawasan Ukur awam.';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'Jika perlawanan regex ini, tiada kajian pelanggan akan dihantar.';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        'Parameter untuk halaman (di mana kaji selidik ditunjukkan) gambaran kajian kecil.';
    $Self->{Translation}->{'Public Survey.'} = 'Penyiasatan awam.';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        'Menunjukkan pautan dalam menu untuk menyunting kaji selidik dalam paparan zum antara muka ejen.';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        'Menunjukkan pautan dalam menu untuk menyunting soalan kaji selidik dalam paparan zum antara muka ejen.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        'Menunjukkan pautan dalam menu untuk kembali ke paparan zum kaji selidik antara muka ejen.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        'Menunjukkan pautan dalam menu untuk zum maklumat statistik kaji selidik dalam paparan zum antara muka ejen.';
    $Self->{Translation}->{'Stats Details'} = 'Maklumat statistik';
    $Self->{Translation}->{'Survey Add Module.'} = 'Modul Tambah Soal Selidik';
    $Self->{Translation}->{'Survey Edit Module.'} = 'Kaji selidik suntingan modul';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = 'Ukur Tinjauan Had "Kecil"';
    $Self->{Translation}->{'Survey Stats Module.'} = 'Kaji selidik Modul Statistik';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'Penyiasatan Zoom Modul';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = '';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = 'Ukur tidak akan dihantar ke alamat e-mel yang dikonfigurasi.';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        'Pengecam untuk kaji selidik, misalnya Penyiasatan # MySurvey #. Lalai adalah Penyiasatan#.';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        'Tiket modul acara untuk menghantar permintaan e-mel secara automatik kaji selidik kepada pelanggan jika tiket ditutup.';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = 'Pencetus menghantar permohonan soal selidik ditangguhkan';
    $Self->{Translation}->{'Zoom into statistics details.'} = '';

}

1;
