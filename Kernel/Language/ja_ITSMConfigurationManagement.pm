# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ja_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Computer'} = '';
    $Self->{Translation}->{'Hardware'} = '';
    $Self->{Translation}->{'Network'} = 'ネットワーク';
    $Self->{Translation}->{'Software'} = '';
    $Self->{Translation}->{'Address'} = 'アドレス';
    $Self->{Translation}->{'Admin Tool'} = '管理ツール';
    $Self->{Translation}->{'Backup Device'} = 'バックアップ・デバイス';
    $Self->{Translation}->{'Beamer'} = 'プロジェクター';
    $Self->{Translation}->{'Building'} = '構築';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'CIHistory::ConfigItemCreate';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'CIHistory::ConfigItemDelete';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'CIHistory::DefinitionUpdate';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'CIHistory::DeploymentStateUpdate';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'CIHistory::IncidentStateUpdate';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'CIHistory::LinkAdd';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'CIHistory::LinkDelete';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'CIHistory::NameUpdate';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'CIHistory::ValueUpdate';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'CIHistory::VersionCreate';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'CIHistory::VersionDelete';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = 'CIHistory::AttachmentAdd';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = 'CIHistory::AttachmentDelete';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = 'カメラ';
    $Self->{Translation}->{'Capacity'} = '容量';
    $Self->{Translation}->{'Change Definition'} = '定義の変更';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = '定義の変更に失敗しました。詳細はシステムログを参照してください。';
    $Self->{Translation}->{'Client Application'} = 'クライアントソフト';
    $Self->{Translation}->{'Client OS'} = 'クライアントOS';
    $Self->{Translation}->{'Config Item-Area'} = 'アイテムエリアの設定';
    $Self->{Translation}->{'Config Items available'} = '設定項目の利用可 / 不可';
    $Self->{Translation}->{'Config Items shown'} = '設定項目表示';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'デモ';
    $Self->{Translation}->{'Desktop'} = 'デスクトップ';
    $Self->{Translation}->{'Developer Licence'} = '開発者ライセンス';
    $Self->{Translation}->{'Docking Station'} = 'ドッキングステーション';
    $Self->{Translation}->{'Duplicate'} = 'コピー';
    $Self->{Translation}->{'Embedded'} = '埋め込みオブジェクト';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = '空欄の項目は現在の値が保持されること意味します';
    $Self->{Translation}->{'Enterprise Licence'} = 'エンタープライズ・ライセンス';
    $Self->{Translation}->{'Expiration Date'} = '有効期限';
    $Self->{Translation}->{'Expired'} = '期限切れ';
    $Self->{Translation}->{'Floor'} = '切捨て';
    $Self->{Translation}->{'Freeware'} = 'フリーウェア';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'ゲートウェイ';
    $Self->{Translation}->{'Graphic Adapter'} = 'グラフィックアダプタ';
    $Self->{Translation}->{'Hard Disk'} = 'ハードディスク';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'ハードディスク容量';
    $Self->{Translation}->{'Hide Versions'} = 'バージョンを非表示';
    $Self->{Translation}->{'IP Address'} = 'IP アドレス';
    $Self->{Translation}->{'IP over DHCP'} = 'DHCP有効';
    $Self->{Translation}->{'IT Facility'} = 'ITファシリティ';
    $Self->{Translation}->{'Incident'} = 'インシデント';
    $Self->{Translation}->{'Install Date'} = 'インストール日付';
    $Self->{Translation}->{'Keyboard'} = 'キーボード';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'ノートPC';
    $Self->{Translation}->{'Last Change'} = '最新の変更';
    $Self->{Translation}->{'Licence Key'} = 'ライセンスキー';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'ライセンスキーの有効期限';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'ライセンスキーの数';
    $Self->{Translation}->{'Licence Type'} = 'ライセンスタイプ';
    $Self->{Translation}->{'Maintenance'} = 'メンテナンス';
    $Self->{Translation}->{'Maximum number of one element'} = '一エレメントあたりの最大数';
    $Self->{Translation}->{'Media'} = 'メディア';
    $Self->{Translation}->{'Middleware'} = 'ミドルウェア';
    $Self->{Translation}->{'Model'} = 'モデル';
    $Self->{Translation}->{'Modem'} = 'モデム';
    $Self->{Translation}->{'Monitor'} = 'モニタ';
    $Self->{Translation}->{'Mouse'} = 'マウス';
    $Self->{Translation}->{'Network Adapter'} = 'ネットワークアダプタ';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'ネットワークアダプタ::IP アドレス';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'ネットワーク・DHCP有効';
    $Self->{Translation}->{'Network Address'} = 'ネットワークアドレス';
    $Self->{Translation}->{'Network Address::Gateway'} = 'デフォルトゲートウェイ';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'サブネットマスク';
    $Self->{Translation}->{'Open Source'} = 'オープンソース';
    $Self->{Translation}->{'Operational'} = '運用';
    $Self->{Translation}->{'Other'} = '他';
    $Self->{Translation}->{'Other Equipment'} = 'その他の機器';
    $Self->{Translation}->{'Outlet'} = 'アウトレット';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA カード';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'ノード毎';
    $Self->{Translation}->{'Per Processor'} = 'プロセッサ毎';
    $Self->{Translation}->{'Per Server'} = 'サーバ毎';
    $Self->{Translation}->{'Per User'} = 'ユーザ毎';
    $Self->{Translation}->{'Phone 1'} = '電話 1';
    $Self->{Translation}->{'Phone 2'} = '電話 2';
    $Self->{Translation}->{'Pilot'} = 'パイロット';
    $Self->{Translation}->{'Planned'} = '計画';
    $Self->{Translation}->{'Printer'} = 'プリンタ';
    $Self->{Translation}->{'Production'} = '生産';
    $Self->{Translation}->{'Quantity'} = '数量';
    $Self->{Translation}->{'Rack'} = 'ラック';
    $Self->{Translation}->{'Ram'} = 'RAM';
    $Self->{Translation}->{'Repair'} = '修理';
    $Self->{Translation}->{'Retired'} = '引退';
    $Self->{Translation}->{'Review'} = 'レビュー';
    $Self->{Translation}->{'Room'} = '室内';
    $Self->{Translation}->{'Router'} = 'ルータ';
    $Self->{Translation}->{'Scanner'} = 'スキャナ';
    $Self->{Translation}->{'Search Config Items'} = '設定項目の検索';
    $Self->{Translation}->{'Security Device'} = 'セキュリティデバイス';
    $Self->{Translation}->{'Serial Number'} = 'シリアルナンバー';
    $Self->{Translation}->{'Server'} = 'サーバ';
    $Self->{Translation}->{'Server Application'} = 'サーバソフト';
    $Self->{Translation}->{'Server OS'} = 'サーバOS';
    $Self->{Translation}->{'Show Versions'} = 'バージョンの表示';
    $Self->{Translation}->{'Single Licence'} = 'シングルライセンス';
    $Self->{Translation}->{'Subnet Mask'} = 'サブネットマスク';
    $Self->{Translation}->{'Switch'} = 'スイッチ';
    $Self->{Translation}->{'Telco'} = '電話会社';
    $Self->{Translation}->{'Test/QA'} = 'テスト / QA';
    $Self->{Translation}->{'The deployment state of this config item'} = 'この設定項目の展開状態';
    $Self->{Translation}->{'The incident state of this config item'} = 'この設定項目のインシデント状態';
    $Self->{Translation}->{'Time Restricted'} = '時間制限';
    $Self->{Translation}->{'USB Device'} = 'USBデバイス';
    $Self->{Translation}->{'Unlimited'} = '無制限';
    $Self->{Translation}->{'User Tool'} = 'ユーザ・ツール';
    $Self->{Translation}->{'Volume Licence'} = 'ボリュームライセンス';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN アクセスポイント';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'ワランティ終了日';
    $Self->{Translation}->{'Workplace'} = '職場';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = '構成アイテム管理';
    $Self->{Translation}->{'Change class definition'} = 'クラス定義を変更';
    $Self->{Translation}->{'Config Item Class'} = '';
    $Self->{Translation}->{'Definition'} = '記述';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Config アイテム';
    $Self->{Translation}->{'Filter for Classes'} = 'クラスでフィルタ';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = '新規の構成アイテムを作成するには、リストからクラスを選択してください。';
    $Self->{Translation}->{'Class'} = 'クラス';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM 変更アイテム一括アクション';
    $Self->{Translation}->{'Deployment state'} = 'デプロイメント状況';
    $Self->{Translation}->{'Incident state'} = 'インシデント状況';
    $Self->{Translation}->{'Link to another'} = '他とリンクする';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'コンフィグレーションアイテムの値が不正です!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = '他の構成アイテムへのリンク数';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = '';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'この 構成アイテム の名称';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'この名称はすでに Number(s): %s の構成アイテムで使用中です。';
    $Self->{Translation}->{'Deployment State'} = '展開状況';
    $Self->{Translation}->{'Incident State'} = 'インシデント状況';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = '';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'コンテキストの設定';
    $Self->{Translation}->{'Config Items per page'} = '1ページ毎の設定項目';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = '';
    $Self->{Translation}->{'Deployment State Type'} = '展開の状態';
    $Self->{Translation}->{'Current Incident State'} = '現在のインシデント状態';
    $Self->{Translation}->{'Current Incident State Type'} = '現在のインシデント状態のタイプ';
    $Self->{Translation}->{'Last changed'} = '最終変更日時';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = '新規テンプレートを作成する';
    $Self->{Translation}->{'Run Search'} = '検索を実行';
    $Self->{Translation}->{'Also search in previous versions?'} = 'プレビュー時、以前のバージョンも検索対象としますか？';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = '詳細設定';
    $Self->{Translation}->{'Configuration Item Information'} = '変更アイテム情報';
    $Self->{Translation}->{'Current Deployment State'} = '現在の展開状態';
    $Self->{Translation}->{'Last changed by'} = '最終変更者';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Show one version'} = '説明を表示';
    $Self->{Translation}->{'Show all versions'} = 'すべての説明を表示';
    $Self->{Translation}->{'Version Incident State'} = 'インシデント状態';
    $Self->{Translation}->{'Version Deployment State'} = 'バージョン展開状況';
    $Self->{Translation}->{'Version Number'} = 'バージョンナンバー';
    $Self->{Translation}->{'Configuration Item Version Details'} = '構成の詳細';
    $Self->{Translation}->{'Property'} = '項目';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = '';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = '設定項目';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = '結果がありません。';
    $Self->{Translation}->{'Config Item Search Results'} = '';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = '管理';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        '';
    $Self->{Translation}->{'Config Items'} = '構成アイテム';
    $Self->{Translation}->{'Config item add.'} = '';
    $Self->{Translation}->{'Config item edit.'} = '';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        '';
    $Self->{Translation}->{'Config item history.'} = '';
    $Self->{Translation}->{'Config item print.'} = '';
    $Self->{Translation}->{'Config item zoom.'} = '';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = '構成アイテムの制限';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'ページあたりの構成アイテムの制限値';
    $Self->{Translation}->{'Configuration Management Database.'} = '';
    $Self->{Translation}->{'Configuration item bulk module.'} = '';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        '';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = '構成アイテムの作成または変更';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define the group with permissions.'} = '';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'ジェネリックインターフェイスを用いてITSM構成を作成する権限を定義する。';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        '';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'ジェネリックインターフェイスを用いてITSM構成を取得する権限を定義する。';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'ジェネリックインターフェイスを用いてITSM構成を検索する権限を定義する。';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'ジェネリックインターフェイスを用いてITSM構成を変更する権限を定義する。';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        '';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        '';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'ITSMConfigItemクラスのデフォルト・サブオブジェクトを定義する。';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        '管理インターフェイス Cl 定義エディタの行数を定義する。';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        '';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        '';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        '';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        '';
    $Self->{Translation}->{'Deployment State Color'} = '';
    $Self->{Translation}->{'Deployment State Color.'} = '';
    $Self->{Translation}->{'Deployment State Type.'} = '';
    $Self->{Translation}->{'Disabled'} = '';
    $Self->{Translation}->{'Enabled'} = '';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        '';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        '';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        '';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        '';
    $Self->{Translation}->{'ITSM config item overview.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = '';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        '';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'ITSM構成タイテム統計を生成するためのモジュール';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        '';
    $Self->{Translation}->{'Overview.'} = '概要';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'ジェネラルカタログ属性のパーミッショングループ　の設定値';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required privileges to delete config items.'} = '';
    $Self->{Translation}->{'Search config items.'} = '';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        '';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        '';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        '';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        '';
    $Self->{Translation}->{'class'} = '';
    $Self->{Translation}->{'global'} = '';

}

1;
