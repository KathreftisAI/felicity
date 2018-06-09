# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ja_ImportExport;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAImportExport
    $Self->{Translation}->{'Add mapping template'} = 'マッピングテンプレートの追加';
    $Self->{Translation}->{'Charset'} = 'キャラクタセット';
    $Self->{Translation}->{'Colon (:)'} = 'コロン (:)';
    $Self->{Translation}->{'Column'} = '桁';
    $Self->{Translation}->{'Column Separator'} = '桁のセパレータ';
    $Self->{Translation}->{'Dot (.)'} = 'ドット(.)';
    $Self->{Translation}->{'Semicolon (;)'} = 'セミコロン (;)';
    $Self->{Translation}->{'Tabulator (TAB)'} = 'タブ (TAB)';
    $Self->{Translation}->{'Include Column Headers'} = 'ヘッダ情報を含む';
    $Self->{Translation}->{'Import summary for'} = '概要を読み込む';
    $Self->{Translation}->{'Imported records'} = 'インポートしたレコード';
    $Self->{Translation}->{'Exported records'} = 'エクスポートしたレコード';
    $Self->{Translation}->{'Records'} = 'レコード';
    $Self->{Translation}->{'Skipped'} = 'スキップされました';

    # Template: AdminImportExport
    $Self->{Translation}->{'Import/Export Management'} = 'Import/Export マネージャ';
    $Self->{Translation}->{'Create a template to import and export object information.'} = 'オブジェクトのインポート・エクスポート用のテンプレートを作成する';
    $Self->{Translation}->{'Start Import'} = 'インポート開始';
    $Self->{Translation}->{'Start Export'} = 'エクスポート開始';
    $Self->{Translation}->{'Step 1 of 5 - Edit common information'} = 'Step 1 of 5 - 基本情報の設定';
    $Self->{Translation}->{'Name is required!'} = '名称は必須です!';
    $Self->{Translation}->{'Object is required!'} = 'オブジェクトは必須です!';
    $Self->{Translation}->{'Format is required!'} = 'フォーマットは必須です!';
    $Self->{Translation}->{'Step 2 of 5 - Edit object information'} = 'Step 2 of 5 - オブジェクト情報の設定';
    $Self->{Translation}->{'Step 3 of 5 - Edit format information'} = '';
    $Self->{Translation}->{'is required!'} = '必須です';
    $Self->{Translation}->{'Step 4 of 5 - Edit mapping information'} = 'Step 4 of 5 - マッピング情報の設定';
    $Self->{Translation}->{'No map elements found.'} = 'マッピング要素が見つかりませんでした';
    $Self->{Translation}->{'Add Mapping Element'} = 'マッピング要素の追加';
    $Self->{Translation}->{'Step 5 of 5 - Edit search information'} = 'Step 5 of 5 - 検索情報の設定';
    $Self->{Translation}->{'Restrict export per search'} = '検索あたりの出力を制限';
    $Self->{Translation}->{'Import information'} = '情報の読み込み';
    $Self->{Translation}->{'Source File'} = 'ソースファイル';
    $Self->{Translation}->{'Success'} = '成功';
    $Self->{Translation}->{'Failed'} = '失敗';
    $Self->{Translation}->{'Duplicate names'} = '名前が重複しています';
    $Self->{Translation}->{'Last processed line number of import file'} = '読み込み済みファイルの最終実行行数';
    $Self->{Translation}->{'Ok'} = 'Ok';

    # Perl Module: Kernel/Modules/AdminImportExport.pm
    $Self->{Translation}->{'No object backend found!'} = '指定されたオブジェクトのバックエンドが見つかりません！';
    $Self->{Translation}->{'No format backend found!'} = '指定されたフォーマットのバックエンドが見つかりません！';
    $Self->{Translation}->{'Template not found!'} = 'テンプレートが見つかりません！';
    $Self->{Translation}->{'Can\'t insert/update template!'} = 'テンプレートの挿入・更新ができません！';
    $Self->{Translation}->{'Needed TemplateID!'} = 'テンプレートIDの入力が必要です！';
    $Self->{Translation}->{'Error occurred. Import impossible! See Syslog for details.'} = 'インポートが出来ません（エラーが発生しました。詳細はシステムログをご確認ください）！';
    $Self->{Translation}->{'Error occurred. Export impossible! See Syslog for details.'} = 'エクスポートが出来ません（エラーが発生しました。詳細はシステムログをご確認ください）！';
    $Self->{Translation}->{'number'} = '数値';
    $Self->{Translation}->{'number bigger than zero'} = '0以上の数値';
    $Self->{Translation}->{'integer'} = '整数値';
    $Self->{Translation}->{'integer bigger than zero'} = '0以上の整数値';
    $Self->{Translation}->{'Element required, please insert data'} = 'データを入力する必要があります。';
    $Self->{Translation}->{'Invalid data, please insert a valid %s'} = '無効なデータです。有効な %s を入力してください。';
    $Self->{Translation}->{'Format not found!'} = '指定されたフォーマットが見つかりません！';

    # SysConfig
    $Self->{Translation}->{'Format backend module registration for the import/export module.'} =
        'import/exportモジュールのバックエンドモジュールを登録';
    $Self->{Translation}->{'Import and export object information.'} = 'オブジェクト情報のインポート・エクスポート';
    $Self->{Translation}->{'Import/Export'} = 'インポート/エクスポート';

}

1;
