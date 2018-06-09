# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ja_GeneralCatalog;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAGeneralCatalog
    $Self->{Translation}->{'Functionality'} = '機能性';

    # Template: AdminGeneralCatalog
    $Self->{Translation}->{'General Catalog Management'} = '一般カタログ管理';
    $Self->{Translation}->{'Add Catalog Item'} = 'カタログ項目を追加';
    $Self->{Translation}->{'Add Catalog Class'} = 'カタログクラスを追加';
    $Self->{Translation}->{'Catalog Class'} = 'カタログクラス';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = '管理';
    $Self->{Translation}->{'Create and manage the General Catalog.'} = '一般カタログの作成と管理';
    $Self->{Translation}->{'Frontend module registration for the AdminGeneralCatalog configuration in the admin area.'} =
        '管理エリアでのAdminGeneralCatalogのフロントエンドモジュールの登録';
    $Self->{Translation}->{'General Catalog'} = '一般カタログ';
    $Self->{Translation}->{'Parameters for the example comment 2 of the general catalog attributes.'} =
        '一般カタログ属性のコメント例 2　の設定値';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        '一般カタログ属性のパーミッショングループ　の設定値';

}

1;
