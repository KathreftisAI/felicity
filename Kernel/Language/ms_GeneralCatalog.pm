# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ms_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = 'Fungsi';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = 'Katalog Pengurusan General';
    $Self->{Translation}->{'Add Catalog Item'} = 'Tambahan Item Katalog';
    $Self->{Translation}->{'Add Catalog Class'} = 'Tambah Kelas Katalog';
    $Self->{Translation}->{'Catalog Class'} = 'Kelas Katalog';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Admin.';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = 'Cipta dan urus Katalog General.';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        'Modul pendaftaran muka hadapan bagi konfigurasi KatalogUmumTadbir dalam ruangan pentadbir. ';
    $Self->{Translation}->{'General Catalog'} = 'Katalog General';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        'Parameter untuk contoh komen 2 pada ciri-ciri katalog.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Parameter untuk contoh kumpulan yang dibenarkan pada ciri-ciri katalog.';

}

1;
