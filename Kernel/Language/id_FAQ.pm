# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::id_FAQ;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'Tambah Artikel FAQ';
    $Self->{Translation}->{'Keywords'} = 'Katakunci';
    $Self->{Translation}->{'A category is required.'} = 'Sebuah kategori dibutuhkan.';
    $Self->{Translation}->{'Approval'} = 'Persetujuan';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'Manajemen Kategori FAQ';
    $Self->{Translation}->{'Add category'} = 'Tambah kategori';
    $Self->{Translation}->{'Delete Category'} = 'Hapus Kategori';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = 'Tambah Kategori';
    $Self->{Translation}->{'Edit Category'} = 'Edit Kategori';
    $Self->{Translation}->{'Subcategory of'} = 'Sub-kategori dari';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'Silahkan pilih setidaknya satu izin grup';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'Grup Agen yang dapat mengakses artikel dalam kategori ini';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Akan ditampilkan sebagai komentar di Explorer';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'Anda yakin akan menghapus kategori ini?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} =
        'Anda tidak dapat menghapus kategori ini. Kategori ini dipakai pada setidaknya satu artikel FAQ dan/atau merupakan parent dari salah satu kategori';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'Kategori ini digunakan dalam artikel FAQ berikut ini';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'Kategori ini merupakan parent dari subkategori berikut ini';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Anda yakin akan menghapus artikel FAQ ini?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'Eksplorer FAQ';
    $Self->{Translation}->{'Quick Search'} = 'Pencarian Cepat';
    $Self->{Translation}->{'Wildcards are allowed.'} = 'Karakter bebas diperkenankan';
    $Self->{Translation}->{'Advanced Search'} = 'Pencarian Lebih Lanjut';
    $Self->{Translation}->{'Subcategories'} = 'Subkategori';
    $Self->{Translation}->{'FAQ Articles'} = 'Artikel FAQ';
    $Self->{Translation}->{'No subcategories found.'} = 'Subkategori tidak ditemukan';

    # Template: AgentFAQHistory
    $Self->{Translation}->{'History of'} = 'Riwayat dari';

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'Data Jurnal FAQ tidak ditemukan.';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'Manajemen Bahasa FAQ';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languages.'} =
        '';
    $Self->{Translation}->{'Add language'} = 'Tambah bahasa';
    $Self->{Translation}->{'Delete Language %s'} = 'Hapus Bahasa %s';
    $Self->{Translation}->{'Add Language'} = 'Tambah Bahasa';
    $Self->{Translation}->{'Edit Language'} = 'Edit Bahasa';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'Anda yakin akan menghapus bahasa ini?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} =
        'Anda tidak dapat menghapus bahasa ini. Bahasa ini digunakan pada salah satu artikel FAQ!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'Bahasa ini digunakan pada Artikel-artikel FAQ berikut';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Pengaturan Konteks';
    $Self->{Translation}->{'FAQ articles per page'} = 'Artikel FAQ per halaman';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'Tidak ditemukan data FAQ.';

    # Template: AgentFAQSearch
    $Self->{Translation}->{'Keyword'} = 'Kata kunci';
    $Self->{Translation}->{'Vote (e. g. Equals 10 or GreaterThan 60)'} = 'Pilih (contoh: Sama Dengan 10 atau Lebih Besar dari 60)';
    $Self->{Translation}->{'Rate (e. g. Equals 25% or GreaterThan 75%)'} = 'Peringkat (contoh: Sama dengan 25% atau Lebih Besar dari 75%)';
    $Self->{Translation}->{'Approved'} = 'Disetujui';
    $Self->{Translation}->{'Last changed by'} = 'Terakhir dirubah oleh';
    $Self->{Translation}->{'FAQ Article Create Time (before/after)'} = 'Waktu Pembuatan Artikel FAQ (sebelum/setelah)';
    $Self->{Translation}->{'FAQ Article Create Time (between)'} = 'Waktu Pembuatan Artikel FAQ (antara)';
    $Self->{Translation}->{'FAQ Article Change Time (before/after)'} = 'Waktu Perubahan Artikel FAQ (sebelum/setelah)';
    $Self->{Translation}->{'FAQ Article Change Time (between)'} = 'Waktu Perubahan Artikel FAQ (antara)';

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'FAQTekslengkap';

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'Pencarian FAQ';
    $Self->{Translation}->{'Profile Selection'} = 'Pemilihan Profil';
    $Self->{Translation}->{'Vote'} = 'Pilih';
    $Self->{Translation}->{'No vote settings'} = 'Tidak ada pengaturan pemilihan';
    $Self->{Translation}->{'Specific votes'} = 'Pemilihan khusus';
    $Self->{Translation}->{'e. g. Equals 10 or GreaterThan 60'} = 'contoh: Sama Dengan 10 atau Lebih Besar dari 60';
    $Self->{Translation}->{'Rate'} = 'Peringkat';
    $Self->{Translation}->{'No rate settings'} = 'Tidak ada pengaturan peringkat';
    $Self->{Translation}->{'Specific rate'} = 'Peringkat khusus';
    $Self->{Translation}->{'e. g. Equals 25% or GreaterThan 75%'} = 'contoh: Sama dengan 25% atau Lebih Besar dari 75%';
    $Self->{Translation}->{'FAQ Article Create Time'} = 'Waktu Pembuatan Artikel FAQ';
    $Self->{Translation}->{'FAQ Article Change Time'} = 'Waktu Perubahan Artikel FAQ';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'Informasi FAQ';
    $Self->{Translation}->{'Rating'} = 'Peringkat';
    $Self->{Translation}->{'out of 5'} = 'dari 5';
    $Self->{Translation}->{'Votes'} = 'Pemilihan';
    $Self->{Translation}->{'No votes found!'} = 'Ttdak ditemukan pemilihan!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'Belum ada Pemilihan! Jadilah yang pertama melakukan pemeringkatan artikel FAQ ini.';
    $Self->{Translation}->{'Download Attachment'} = 'Unduh Lampiran';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        'Untuk membuka tautan pada bagian deskripsi berikut, Anda harus menekan tombol Ctrl atau Cms atau Shift sambil menekan tautannya (tergantung pada Sistem Operasi dan Peramban)';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} =
        'Seberapa besar artikel ini membantu? Mohon berikan peringkat Anda dan ikut membantu Database FAQ. Terima kasih!';
    $Self->{Translation}->{'not helpful'} = 'tidak membantu';
    $Self->{Translation}->{'very helpful'} = 'sangat membantu';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Add FAQ title to article subject'} = 'Tambahkan judul FAQ pada subjek artikel';
    $Self->{Translation}->{'Insert FAQ Text'} = 'Masukkan Teks FAQ';
    $Self->{Translation}->{'Insert Full FAQ'} = 'Masukkan Seluruh FAQ';
    $Self->{Translation}->{'Insert FAQ Link'} = 'Masukkan Tautan FAQ';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'Masukan Teks dan Tautan FAQ';
    $Self->{Translation}->{'Insert Full FAQ & Link'} = 'Masukkan Seluruh Link dan FAQ';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'Tidak ditemukan artikel FAQ';

    # Template: CustomerFAQRelatedArticles
    $Self->{Translation}->{'This might be helpful'} = '';
    $Self->{Translation}->{'Found no helpful resources for the subject and text.'} = '';
    $Self->{Translation}->{'Type a subject or text to get a list of helpful resources.'} = '';

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Pencarian Tekspenuh pada Artikel FAQ (contoh: "John*n" atau "Will")';
    $Self->{Translation}->{'Vote restrictions'} = 'Batasan Pemilihan';
    $Self->{Translation}->{'Only FAQ articles with votes...'} = 'Hanya artikel FAQ yang telah dipilih...';
    $Self->{Translation}->{'Rate restrictions'} = 'Batasan Peringkat';
    $Self->{Translation}->{'Only FAQ articles with rate...'} = 'Hanya Artikel yang memiliki peringkat...';
    $Self->{Translation}->{'Only FAQ articles created'} = 'Hanya artikel FAQ yang dibuat';
    $Self->{Translation}->{'Only FAQ articles created between'} = 'Hanya artikel FAQ yang dibuat pada ';
    $Self->{Translation}->{'Search-Profile as Template?'} = 'Pencarian-Profil sebagai Template?';

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Article Number'} = 'Nomor Artikel';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Cari artikel dengan kata kunci';

    # Template: PublicFAQSearchOpenSearchDescriptionFAQNumber
    $Self->{Translation}->{'Public'} = 'Umum';

    # Template: PublicFAQSearchResultShort
    $Self->{Translation}->{'Back to FAQ Explorer'} = 'Kembali ke Eksplorer FAQ';

    # Perl Module: Kernel/Modules/AgentFAQAdd.pm
    $Self->{Translation}->{'You need rw permission!'} = '';
    $Self->{Translation}->{'No categories found where user has read/write permissions!'} = '';
    $Self->{Translation}->{'No default language found and can\'t create a new one.'} = '';

    # Perl Module: Kernel/Modules/AgentFAQCategory.pm
    $Self->{Translation}->{'Need CategoryID!'} = '';
    $Self->{Translation}->{'A category should have a name!'} = 'Sebuah kategori harus memiliki nama!';
    $Self->{Translation}->{'This category already exists'} = 'Kategori ini sudah ada';
    $Self->{Translation}->{'FAQ category updated!'} = 'Kategori FAQ diupdate!';
    $Self->{Translation}->{'This category already exists!'} = '';
    $Self->{Translation}->{'FAQ category added!'} = 'Kategori FAQ ditambahkan!';
    $Self->{Translation}->{'No CategoryID is given!'} = '';
    $Self->{Translation}->{'Was not able to delete the category %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQDelete.pm
    $Self->{Translation}->{'No ItemID is given!'} = '';
    $Self->{Translation}->{'You have no permission for this category!'} = '';
    $Self->{Translation}->{'Was not able to delete the FAQ article %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQExplorer.pm
    $Self->{Translation}->{'The CategoryID %s is invalid.'} = '';

    # Perl Module: Kernel/Modules/AgentFAQHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no ItemID is given!'} = '';
    $Self->{Translation}->{'FAQ History'} = '';

    # Perl Module: Kernel/Modules/AgentFAQJournal.pm
    $Self->{Translation}->{'FAQ Journal'} = 'Jurnal FAQ';
    $Self->{Translation}->{'Need config option FAQ::Frontend::Overview'} = '';
    $Self->{Translation}->{'Config option FAQ::Frontend::Overview needs to be a HASH ref!'} =
        '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQLanguage.pm
    $Self->{Translation}->{'No LanguageID is given!'} = '';
    $Self->{Translation}->{'The name is required!'} = 'Nama dibutuhkan!';
    $Self->{Translation}->{'This language already exists!'} = 'Bahasa ini sudah ada!';
    $Self->{Translation}->{'FAQ language updated!'} = 'Bahasa FAQ diperbarui!';
    $Self->{Translation}->{'FAQ language added!'} = 'Bahasa FAQ ditambahkan!';
    $Self->{Translation}->{'Was not able to delete the language %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQPrint.pm
    $Self->{Translation}->{'Last update'} = 'Perbaruan terakhir';
    $Self->{Translation}->{'FAQ Dynamic Fields'} = 'Bidang dinamis FAQ';

    # Perl Module: Kernel/Modules/AgentFAQRichText.pm
    $Self->{Translation}->{'No %s is given!'} = 'Tidak ada %s diberikan!';
    $Self->{Translation}->{'Can\'t load LanguageObject!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Tidak ada hasil!';
    $Self->{Translation}->{'FAQ Number'} = 'Nomor FAQ';
    $Self->{Translation}->{'Last Changed by'} = '';
    $Self->{Translation}->{'FAQ Item Create Time (before/after)'} = '';
    $Self->{Translation}->{'FAQ Item Create Time (between)'} = '';
    $Self->{Translation}->{'FAQ Item Change Time (before/after)'} = '';
    $Self->{Translation}->{'FAQ Item Change Time (between)'} = '';
    $Self->{Translation}->{'Equals'} = '';
    $Self->{Translation}->{'Greater than'} = '';
    $Self->{Translation}->{'Greater than equals'} = '';
    $Self->{Translation}->{'Smaller than'} = '';
    $Self->{Translation}->{'Smaller than equals'} = '';

    # Perl Module: Kernel/Modules/AgentFAQZoom.pm
    $Self->{Translation}->{'Need FileID!'} = '';
    $Self->{Translation}->{'Thanks for your vote!'} = 'Terima kasih atas pilihannya!';
    $Self->{Translation}->{'You have already voted!'} = 'Anda sudah pernah memilih!';
    $Self->{Translation}->{'No rate selected!'} = 'Tidak ada peringkat yang dipilih';
    $Self->{Translation}->{'The voting mechanism is not enabled!'} = '';
    $Self->{Translation}->{'The vote rate is not defined!'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQPrint.pm
    $Self->{Translation}->{'FAQ Article Print'} = 'Cetak Artikel FAQ';

    # Perl Module: Kernel/Modules/CustomerFAQSearch.pm
    $Self->{Translation}->{'Created between'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQZoom.pm
    $Self->{Translation}->{'Need ItemID!'} = '';

    # Perl Module: Kernel/Modules/PublicFAQExplorer.pm
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'Artikel FAQ (terbaru)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'Artikel FAQ (terakhir dirubah)';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'Artikel FAQ (10 teratas)';

    # Perl Module: Kernel/Modules/PublicFAQRSS.pm
    $Self->{Translation}->{'No Type is given!'} = '';
    $Self->{Translation}->{'Type must be either LastCreate or LastChange or Top10!'} = '';
    $Self->{Translation}->{'Can\'t create RSS file!'} = '';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/AgentFAQSearch.pm
    $Self->{Translation}->{'%s (FAQFulltext)'} = '';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/CustomerFAQSearch.pm
    $Self->{Translation}->{'%s - Customer (%s)'} = '';
    $Self->{Translation}->{'%s - Customer (FAQFulltext)'} = '';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/PublicFAQSearch.pm
    $Self->{Translation}->{'%s - Public (%s)'} = '';
    $Self->{Translation}->{'%s - Public (FAQFulltext)'} = '';

    # Perl Module: Kernel/Output/HTML/Layout/FAQ.pm
    $Self->{Translation}->{'Need rate!'} = '';
    $Self->{Translation}->{'This article is empty!'} = 'Artikel ini kosong!';
    $Self->{Translation}->{'Latest created FAQ articles'} = 'Artikel FAQ terakhir dibuat';
    $Self->{Translation}->{'Latest updated FAQ articles'} = 'Artikel FAQ paling baru';
    $Self->{Translation}->{'Top 10 FAQ articles'} = 'Artikel FAQ 10 teratas';

    # Perl Module: Kernel/Output/HTML/LinkObject/FAQ.pm
    $Self->{Translation}->{'Content Type'} = '';

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} =
        'Sebuah filter untuk output HTML untuk menambahkan tautan terkait string yang ditentukan. Dua buah masukan diperkenankan untuk Elemen Gambar. Pertama nama dari gambar (contoh: faq.png). Pada kasus ini path gambar OTRS yang digunakan. Kemungkinan kedua adalah memasukkan tautan ke dalam gambar.';
    $Self->{Translation}->{'Add FAQ article'} = '';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'Warna CSS untuk hasil pemilihan.';
    $Self->{Translation}->{'Cache Time To Leave for FAQ items.'} = 'Waktu Cache Untuk Keluar dalam item FAQ';
    $Self->{Translation}->{'Category Management'} = 'Manajemen Kategori';
    $Self->{Translation}->{'Customer FAQ Print.'} = '';
    $Self->{Translation}->{'Customer FAQ Zoom.'} = '';
    $Self->{Translation}->{'Customer FAQ search.'} = '';
    $Self->{Translation}->{'Customer FAQ.'} = '';
    $Self->{Translation}->{'CustomerFAQRelatedArticles.'} = '';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'Posisi desimal pada hasil pemilihan.';
    $Self->{Translation}->{'Default category name.'} = 'Nama kategori default.';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = 'Bahasa default untuk artikel FAQ pada mode satu bahasa.';
    $Self->{Translation}->{'Default maximum size of the titles in a FAQ article to be shown.'} =
        'Default ukuran maksimum judul dalam artikel FAQ yang akan ditampilkan.';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} =
        'Default priotitas dari tiket untuk persetujuan artikel FAQ.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Status default untuk entri FAQ';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'Status default tiket untuk persetujuan pada artikel FAQ';
    $Self->{Translation}->{'Default type of tickets for the approval of FAQ articles.'} = 'Tipe tiket default untuk persetujuan artikel FAQ';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} =
        'Nilai default untuk parameter Aksi untuk frontend umum. Parameter aksi digunakan pada skrip dari Sistem.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define if the FAQ title should be concatenated to article subject.'} =
        'Tentukan jika judul FAQ harus tersambung ke subjek artikel';
    $Self->{Translation}->{'Define which columns are shown in the linked FAQs widget (LinkObject::ViewMode = "complex"). Note: Only FAQ attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} =
        'Tentukan sebuah gambaran modul untuk menampilkan tampilan kecil dari sebuah jurnal FAQ';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} =
        'Tentukan sebuah gambaran modul untuk menampilkan tampilan kecil dari sebuah daftar FAQ.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} =
        'Tentukan atribut default FAQ untuk penyortiran FAQ dalam pencarian FAQ dari antarmuka agen';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} =
        'Tentukan atribut standar FAQ untuk penyortiran dalam Pencarian FAQ dari antarmuka pelanggan';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} =
        'Tentukan atribut standar FAQ untuk penyortiran dalam pencarian FAQ untuk antarmuka umum.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} =
        'Tentukan atribut standar FAQ untuk penyortiran FAQ dalam Eksplorer FAQ pada antarmuka agen';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} =
        'Tentukan atribut standar FAQ untuk penyortiran FAQ dalam Eksplorer FAQ pada antarmuka pelanggan';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} =
        'Tentukan atribut standar FAQ untuk penyortiran FAQ dalam Eksplorer FAQ pada antarmuka umum';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} =
        'Tentukan urutan standar FAQ dalam hasil Eksplorer FAQ pada antarmuka agen. Naik: Terlama di atas. Turun: Terbaru di atas.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} =
        'Tentukan urutan standar FAQ dalam hasil Eksplorer FAQ pada antarmuka pelanggan. Naik: Terlama di atas. Turun: Terbaru di atas.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} =
        'Tentukan urutan standar FAQ dalam hasil Eksplorer FAQ pada antarmuka umum. Naik: Terlama di atas. Turun: Terbaru di atas.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} =
        'Tentukan urutan standar FAQ dalam hasil pencarian pada antarmuka agen. Naik: Terlama di atas. Turun: Terbaru di atas.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} =
        'Tentukan urutan standar FAQ dalam hasil pencarian pada antarmuka pelanggan. Naik: Terlama di atas. Turun: Terbaru di atas.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} =
        'Tentukan urutan standar FAQ dalam hasil pencarian pada antarmuka umum. Naik: Terlama di atas. Turun: Terbaru di atas.';
    $Self->{Translation}->{'Defines the default shown FAQ search attribute for FAQ search screen.'} =
        'Tentukan atribut pencarian FAQ standar yang ditampilkan untuk layar pencarian FAQ';
    $Self->{Translation}->{'Defines the information to be inserted in a FAQ based Ticket. "Full FAQ" includes text, attachments and inline images.'} =
        'Tentukan informasi yang akan di masukan ke dalam sebuah Tiket berdasar FAQ. "FAQ lengkap" berisi teks, lampiran, dan gambar di barisan.';
    $Self->{Translation}->{'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.'} =
        'Tentukan parameter untuk backend dasbor. "Limit" menentukan jumlah entri yang di tampilkan secara default. "Group" di gunakan untuk membatasi akses ke plugin (misalnya Grup: admin;grup1;grup2;). "Default" mengindikasikanjika plugin diaktifkan secara default atau jika pengguna perlu mengaktifkannya secara manual.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} =
        'Tentukan kolom yang ditampilkan di Eksplorer FAQ. Pilihan ini tidak mempengaruhi posisi kolom.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} =
        'Tentukan kolom yang di tampilkan di jurnal FAQ. Pilihan ini tidak mempengaruhi posisi kolom.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} =
        'Tentukan kolom yang di tampilkan didalam pencarian FAQ. Pilihan ini tidak mempengaruhi posisi kolom.';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed.'} = 'Tentukan dimana tautan \'Masukkan FAQ\' akan ditampilkan.';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'Definisi dari item teks field bebas FAQ';
    $Self->{Translation}->{'Delete this FAQ'} = 'Hapus FAQ ini';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Bidang dinamis yang ditampilkan di dalam menambah layar FAQ pada antarmuka agen. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan, 2 = di aktifkan dan diperlukan.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Bidang dinamis yang ditampilkan di dalam mengubah layar FAQ pada antarmuka agen. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan, 2 = di aktifkan dan diperlukan.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Bidang dinamis yang ditampilkan di dalam layar gambaran umum FAQ pada antarmuka pelanggan. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan, 2 = di aktifkan dan diperlukan.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Bidang dinamis yang ditampilkan di dalam layar gambaran umum FAQ pada antarmuka umum. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan, 2 = di aktifkan dan diperlukan.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Bidang dinamis yang ditampilkan di dalam layar cetak FAQ pada antarmuka agen. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Bidang dinamis yang ditampilkan di dalam layar cetak FAQ pada antarmuka pelanggan. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Bidang dinamis yang ditampilkan di dalam layar cetak FAQ pada antarmuka umum. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Bidang dinamis yang ditampilkan di dalam layar pencarian FAQ pada antarmuka agen. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan, 2 = di aktifkan dan di tampilkan secara default.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Bidang dinamis yang ditampilkan di dalam layar pencarian FAQ pada antarmuka pelanggan. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan, 2 = di aktifkan dan di tampilkan secara default.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Bidang dinamis yang ditampilkan di dalam layar pencarian FAQ pada antarmuka umum. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan, 2 = di aktifkan dan di tampilkan secara default.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Bidang dinamis yang ditampilkan di dalam format kecil layar gambaran FAQ pada antarmuka agen. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Bidang dinamis yang ditampilkan di dalam layar zoom FAQ pada antarmuka agen. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Bidang dinamis yang ditampilkan di dalam layar zoom FAQ pada antarmuka pelanggan. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Bidang dinamis yang ditampilkan di dalam layar zoom FAQ pada antarmuka umum. Pengaturan yang memungkinkan: 0 = di nonaktifkan, 1 = di aktifkan.';
    $Self->{Translation}->{'Edit this FAQ'} = 'ubah FAQ ini.';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = 'Aktifkan multibahasa pada modul FAQ.';
    $Self->{Translation}->{'Enable the related article feature for the customer frontend.'} =
        '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = 'Aktifkan mekanisme voting pada modul FA';
    $Self->{Translation}->{'Explorer'} = 'Eksplorer';
    $Self->{Translation}->{'FAQ AJAX Responder'} = '';
    $Self->{Translation}->{'FAQ AJAX Responder for Richtext.'} = '';
    $Self->{Translation}->{'FAQ Area'} = '';
    $Self->{Translation}->{'FAQ Area.'} = '';
    $Self->{Translation}->{'FAQ Delete.'} = '';
    $Self->{Translation}->{'FAQ Edit.'} = '';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = 'Jurnal gambaran batas "kecil"  FAQ';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = 'Gambaran batas "Kecil"';
    $Self->{Translation}->{'FAQ Print.'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = 'Batas per halaman FAQ untuk jurnal gambaran "kecil" FAQ';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = 'Batas per halaman FAQ untuk gambaran "kecil" FAQ';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = 'Pencarian penerus backend FAQ pada antarmuka agen';
    $Self->{Translation}->{'Field4'} = 'Field4';
    $Self->{Translation}->{'Field5'} = 'Field5';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'Pendaftaran modul Halamandepan untuk antarmuka umum.';
    $Self->{Translation}->{'Full FAQ'} = '';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'Grup untuk persetujuan artikel FAQ';
    $Self->{Translation}->{'History of this FAQ'} = 'Sejarah dari FAQ ini';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = 'Masukan bidang internal pada Tiket berdasar FAQ.';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = 'Masukan nama setiap bidang pada Tiket berdasar FAQ.';
    $Self->{Translation}->{'Interfaces where the quick search should be shown.'} = 'Antarmuka dimana pencarian cepat harus di tampilkan';
    $Self->{Translation}->{'Journal'} = 'Jurnal';
    $Self->{Translation}->{'Language Management'} = 'Manajemen Bahasa';
    $Self->{Translation}->{'Limit for the search to build the keyword FAQ article list.'} = '';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'Tautkan objek lainnya ke item FAQ ini';
    $Self->{Translation}->{'List of queue names for which the related article feature is enabled.'} =
        '';
    $Self->{Translation}->{'List of state types which can be used in the agent interface.'} =
        'Daftar jenis status yang dapat digunakan pada antarmuka agen.';
    $Self->{Translation}->{'List of state types which can be used in the customer interface.'} =
        'Daftar jenis status yang dapat digunakan pada antarmuka pelanggan.';
    $Self->{Translation}->{'List of state types which can be used in the public interface.'} =
        'Daftar jenis status yang dapat digunakan pada antarmuka umum.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} =
        'Jumlah artikel FAQ maksimal yang akan ditampilkan di dalam hasil Eksplorer FAQ di antarmuka agen.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} =
        'Jumlah artikel FAQ maksimal yang akan ditampilkan di dalam hasil Eksplorer FAQ di antarmuka pelanggan.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} =
        'Jumlah artikel FAQ maksimal yang akan ditampilkan di dalam hasil Eksplorer FAQ di antarmuka umum.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} =
        'Jumlah artikel FAQ maksimal yang akan ditampilkan di dalam hasil jurnal FAQ di antarmuka agen.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} =
        'Jumlah artikel FAQ maksimal yang akan ditampilkan di dalam hasil pencarian di antarmuka agen.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} =
        'Jumlah artikel FAQ maksimal yang akan ditampilkan di dalam hasil jurnal FAQ di antarmuka pelanggan.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} =
        'Jumlah artikel FAQ maksimal yang akan ditampilkan di dalam hasil jurnal FAQ di antarmuka umum.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the agent interface.'} =
        'Ukuran maksimal Judul di dalam artikel FAQ yang akan di tampilkan di dalam Eksplorer FAQ pada antarmuka agen.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the customer interface.'} =
        'Ukuran maksimal Judul di dalam artikel FAQ yang akan di tampilkan di dalam Eksplorer FAQ pada antarmuka pelanggan.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the public interface.'} =
        'Ukuran maksimal Judul di dalam artikel FAQ yang akan di tampilkan di dalam Eksplorer FAQ pada antarmuka umum.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the agent interface.'} =
        'Ukuran maksimal Judul di dalam artikel FAQ yang akan di tampilkan di dalam Pencarian FAQ pada antarmuka agen.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the customer interface.'} =
        'Ukuran maksimal Judul di dalam artikel FAQ yang akan di tampilkan di dalam Pencarian FAQ pada antarmuka pelanggan.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the public interface.'} =
        'Ukuran maksimal Judul di dalam artikel FAQ yang akan di tampilkan di dalam Pencarian FAQ pada antarmuka umum.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ journal in the agent interface.'} =
        'Ukuran maksimal Judul di dalam artikel FAQ yang akan di tampilkan di dalam Journal FAQ pada antarmuka agen.';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the customer interface.'} =
        '';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the public interface.'} =
        'Modul untuk menghasilkan profil HTML PencarianTerbuka untuk Pencarian pendek FAQ di antarmuka umum.';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short FAQ search.'} =
        '';
    $Self->{Translation}->{'New FAQ Article'} = 'Artikel FAQ Baru';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'Artikel FAQ baru membutuhkan ersetujuan sebelum dipublikasikan.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} =
        'Jumlah artikel FAQ yang akan ditampilkan pada Eksplorer FAQ di antarmuka pelanggan.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} =
        'Jumlah artikel FAQ yang akan di tampilkan di Eksplorer FAQ pada antarmuka umum.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} =
        'Jumlah artikel FAQ yang akan di tampilkan pada setiap halaman dari hasil pencarian pada antarmuka pelanggan.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} =
        'Jumlah artikel FAQ yang akan di tampilkan pada setiap halaman dari hasil pencarian pada antarmuka umum.';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'Jumlah item yang ditampilkan dalam perubahan terakhir.';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'Jumlah item yang di tampilkan dalam pembuatan terakhir.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'Jumlah item yang ditampilkan dalam 10 fitur teratas.';
    $Self->{Translation}->{'Output filter to add Java-script to CustomerTicketMessage screen.'} =
        '';
    $Self->{Translation}->{'Output limit for the related FAQ articles.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} =
        'Parameter untuk halaman (dimana item FAQ di tampilkan) jurnal kecil gambaran FAQ.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} =
        'Parameter untuk halaman (dimana item FAQ di tampilkan) gambaran kecil FAQ.';
    $Self->{Translation}->{'Print this FAQ'} = 'Cetak FAQ ini.';
    $Self->{Translation}->{'Public FAQ Print.'} = '';
    $Self->{Translation}->{'Public FAQ Zoom.'} = '';
    $Self->{Translation}->{'Public FAQ search.'} = '';
    $Self->{Translation}->{'Public FAQ.'} = '';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'Antrian untuk disetujuinya artikel FAQ';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = 'Peringkatkan untuk memilih.  Kunci harus dalam persentase.';
    $Self->{Translation}->{'S'} = '';
    $Self->{Translation}->{'Search FAQ'} = 'Cari FAQ';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        'Tentukan tinggi default (dalam piksel)  pada bidang sebaris HTML pada AgentFAQZoom.';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        'Tentukan tinggi default (dalam piksel)  pada bidang sebaris HTML pada CustomerFAQZoom (dan PublicFAQZoom).';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        'Tentukan tinggi maksimal (dalam piksel)  pada bidang sebaris HTML pada AgentFAQZoom.';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        'Tentukan tinggi maksimal (dalam piksel)  pada bidang sebaris HTML pada CustomerFAQZoom (dan PublicFAQZoom).';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        'Tampilkan tombol "Masukan tautan FAQ" pada AgentFAQZoomSmall untuk artikel FAQ umum';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" / "Insert Full FAQ & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        'Tamplikan tombol "Masukan teks & tautan FAQ" / "Masukan FAQ & Tautan lengkap" pada AgentFAQZoomSmall untuk artikel FAQ umum.';
    $Self->{Translation}->{'Show "Insert FAQ Text" / "Insert Full FAQ" Button in AgentFAQZoomSmall.'} =
        'Tampilkan tombol "Masukan teks FAQ" / "Masukan FAQ lengkap" pada AgentFAQZoomSmall.';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'Tampilkan artikel FAQ dengan HTML.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'Tampilkan Jalur FAQ iya/tidak.';
    $Self->{Translation}->{'Show invalid items in the FAQ Explorer result of the agent interface.'} =
        '';
    $Self->{Translation}->{'Show items of subcategories.'} = 'Tampilkan item dari subkategori.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'Tampilkan item terakhir yang di ubah pada antarmuka yang di tentukan.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'Tampilkan item terakhir yang di ciptakan pada antarmuka yang di tentukan.';
    $Self->{Translation}->{'Show the stars for the articles with a rating equal or greater like the defined value (set value \'0\' to deactive the output).'} =
        '';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'Tampilkan 10 item teratas pada antarmuka yang di tentukan.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'Tampilkan pemilihan pada antarmuka yang di tentukan.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} =
        'Tampilkan tautan di menu yang mengizinkan hubungan FAQ dengan objek lain di tampilan zoom seperti FAQ pada antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} =
        'Tampilkan tautan pada menu yang mengizinkan penghapusan FAQ pada tampilan zoom pada antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} =
        'Tampilkan tautan pada menu untuk mengakses sejarah FAQ pada tampilan zoomnya di antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} =
        'Tampilkan tautan pada menu untuk mengubah FAQ pada tampilan zoomnya di antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} =
        'Tampilkan tautan pada menu untuk kembali pada FAQ pada tampilan zoom di antarmuka agen.';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} =
        'Tampilkan tautan pada menu untuk mencetak FAQ pada tampilan zoomnya di antarmuka agen.';
    $Self->{Translation}->{'Solution'} = 'Solusi';
    $Self->{Translation}->{'Symptom'} = 'Gejala';
    $Self->{Translation}->{'Text Only'} = '';
    $Self->{Translation}->{'The default languages for the related FAQ articles.'} = '';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} =
        'Pengidentifikasi untuk FAQ, Misalnya FAQ#, KB#, MyFAQ#. Standarnya adalah FAQ#.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} =
        'Pengaturan ini mendefiniskan bahwa objek \'FAQ\' dapat di hubungkan dengan objek \'FAQ\' lain dengan menggunakan type tautan \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Pengaturan ini mendefiniskan bahwa objek \'FAQ\' dapat di hubungkan dengan objek \'FAQ\' lain dengan menggunakan type tautan \'ParentChild\'.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} =
        'Pengaturan ini mendefiniskan bahwa objek \'FAQ\' dapat di hubungkan dengan objek \'Tiket\' lain dengan menggunakan type tautan \'Normal\'.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} =
        'Pengaturan ini mendefiniskan bahwa objek \'FAQ\' dapat di hubungkan dengan objek \'Ticket\' lain dengan menggunakan type tautan \'ParentChild\'.';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'Isi tiket untuk persetujuan artikel FAQ.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'Subjek tiket untuk persetujuan artikel FAQ.';
    $Self->{Translation}->{'Toolbar Item for a shortcut.'} = 'Item toolbar untuk jalan pintas';
    $Self->{Translation}->{'external (customer)'} = 'eksternal (pelanggan)';
    $Self->{Translation}->{'internal (agent)'} = 'internal (agen)';
    $Self->{Translation}->{'public (public)'} = '';

}

1;
