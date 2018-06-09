# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ja_ITSMIncidentProblemManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMIncidentProblemManagement
    $Self->{Translation}->{'Add decision to ticket'} = 'チケットに決定を追加する';
    $Self->{Translation}->{'Decision Date'} = '決定日付';
    $Self->{Translation}->{'Decision Result'} = '決定結果';
    $Self->{Translation}->{'Due Date'} = '対応期限';
    $Self->{Translation}->{'Reason'} = '理由';
    $Self->{Translation}->{'Recovery Start Time'} = '回復開始時間';
    $Self->{Translation}->{'Repair Start Time'} = '修理開始時間';
    $Self->{Translation}->{'Review Required'} = 'レビュー必須';
    $Self->{Translation}->{'closed with workaround'} = 'ワークアラウンドで完了';

    # Template: AgentTicketActionCommon
    $Self->{Translation}->{'Change Decision of Ticket'} = 'チケットの変更決定';
    $Self->{Translation}->{'Change ITSM fields of ticket'} = 'チケットのITSM項目を変更する';
    $Self->{Translation}->{'Service Incident State'} = 'サービスインシデント状況';

    # Template: AgentTicketEmail
    $Self->{Translation}->{'Link ticket'} = 'チケットをリンクする';

    # Template: AgentTicketOverviewPreview
    $Self->{Translation}->{'Criticality'} = '重要度';
    $Self->{Translation}->{'Impact'} = '影響度';

    # SysConfig
    $Self->{Translation}->{'Add a decision!'} = '決定を追加する！';
    $Self->{Translation}->{'Additional ITSM Fields'} = '追加のITSM項目';
    $Self->{Translation}->{'Additional ITSM ticket fields.'} = '追加の ITSM チケット･フィールド';
    $Self->{Translation}->{'Allows adding notes in the additional ITSM field screen of the agent interface.'} =
        'エージェントインターフェイスのアディショナルITSM項目画面で追加のノートを許可する';
    $Self->{Translation}->{'Allows adding notes in the decision screen of the agent interface.'} =
        '担当者インタフェースの決定 画面で、メモの追加を許可します。';
    $Self->{Translation}->{'Change the ITSM fields!'} = 'ITSM項目を変更する！';
    $Self->{Translation}->{'Decision'} = '決定';
    $Self->{Translation}->{'Defines if a ticket lock is required in the additional ITSM field screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        '';
    $Self->{Translation}->{'Defines if a ticket lock is required in the decision screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        '';
    $Self->{Translation}->{'Defines if the service incident state should be shown during service selection in the agent interface.'} =
        '担当者インターフェイスでサービス選択時にサービスインシデント状況を表示するか定義するする';
    $Self->{Translation}->{'Defines the default body of a note in the additional ITSM field screen of the agent interface.'} =
        '担当者インタフェースの追加のITSMのフィールド画面で用いるデフォルトのメモ本文を定義します。';
    $Self->{Translation}->{'Defines the default body of a note in the decision screen of the agent interface.'} =
        '担当者インタフェースの決定画面で用いるデフォルトのメモ本文を定義します。';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        '担当者インタフェースの追加のITSMのフィールド画面で、メモ追加後の「次の状態」についてデフォルトの選択肢を定義します。';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        '担当者インタフェースの決定画面で、メモ追加後の「次の状態」についてデフォルトの選択肢を定義します。';
    $Self->{Translation}->{'Defines the default subject of a note in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default subject of a note in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default ticket priority in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default ticket priority in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default type of the note in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default type of the note in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the history comment for the additional ITSM field screen action, which gets used for ticket history.'} =
        '';
    $Self->{Translation}->{'Defines the history comment for the decision screen action, which gets used for ticket history.'} =
        '';
    $Self->{Translation}->{'Defines the history type for the additional ITSM field screen action, which gets used for ticket history.'} =
        '';
    $Self->{Translation}->{'Defines the history type for the decision screen action, which gets used for ticket history.'} =
        '';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the additional ITSM field screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '担当者インターフェイスの追加 ITSMフィールド画面で表示される動的フィールド。 選択可能な設定値: 0 = 無効, 1 = 有効, 2 = 有効かつ必須項目';
    $Self->{Translation}->{'Dynamic fields shown in the decision screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '担当者インターフェイスの決定画面で表示される動的フィールド。 選択可能な設定値: 0 = 無効, 1 = 有効, 2 = 有効かつ必須項目';
    $Self->{Translation}->{'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '担当者インターフェイスのチケット検索画面で表示される動的フィールド。 選択可能な設定値: 0 = 無効, 1 = 有効';
    $Self->{Translation}->{'Dynamic fields shown in the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '担当者インターフェイスのチケットズーム画面で表示される動的フィールド。 選択可能な設定値: 0 = 無効, 1 = 有効';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket first level solution rate.'} =
        '';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket solution.'} =
        '';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the additional ITSM field screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Required permissions to use the decision screen in the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the service in the additional ITSM field screen of the agent interface (Ticket::Service needs to be activated).'} =
        '';
    $Self->{Translation}->{'Sets the service in the decision screen of the agent interface (Ticket::Service needs to be activated).'} =
        '';
    $Self->{Translation}->{'Sets the ticket owner in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the ticket owner in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the ticket responsible in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the ticket responsible in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Sets the ticket type in the additional ITSM field screen of the agent interface (Ticket::Type needs to be activated).'} =
        '';
    $Self->{Translation}->{'Sets the ticket type in the decision screen of the agent interface (Ticket::Type needs to be activated).'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to change the decision of a ticket in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to modify additional ITSM fields in the ticket zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the ticket priority options in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the ticket priority options in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the title fields in the additional ITSM field screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows the title fields in the decision screen of the agent interface.'} =
        '';
    $Self->{Translation}->{'Ticket decision.'} = '';

}

1;
