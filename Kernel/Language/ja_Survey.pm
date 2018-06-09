# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::ja_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = '新規調査の作成';
    $Self->{Translation}->{'Introduction'} = '紹介文';
    $Self->{Translation}->{'Survey Introduction'} = '調査の紹介文';
    $Self->{Translation}->{'Notification Body'} = '通知の本文';
    $Self->{Translation}->{'Internal Description'} = '内部向け説明';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = '一般情報の編集';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = '質問の編集';
    $Self->{Translation}->{'Survey Questions'} = '調査質問';
    $Self->{Translation}->{'Add Question'} = '質問の追加';
    $Self->{Translation}->{'Type the question'} = '質問の入力';
    $Self->{Translation}->{'Answer required'} = '回答必須です';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'この調査に対する質問が保存されていません。';
    $Self->{Translation}->{'Question'} = '質問';
    $Self->{Translation}->{'Answer Required'} = '回答が必須の項目です';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        'このサーベイ設問の編集が完了したら、画面を閉じてください。';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'この質問を本当に削除してもいいですか？　関連しているすべてのデーターが失われます!';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = '質問編集';
    $Self->{Translation}->{'go back to questions'} = '質問へ戻る';
    $Self->{Translation}->{'Question:'} = '設問:';
    $Self->{Translation}->{'Possible Answers For'} = '選択肢';
    $Self->{Translation}->{'Add Answer'} = '回答の追加';
    $Self->{Translation}->{'No answers saved for this question.'} = 'この質問への回答はまだありません';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = '本当にこの答えを削除してもいいですか？';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'この質問には選択肢がありません。テキストエリアが表示されます。';
    $Self->{Translation}->{'Edit Answer'} = '回答の編集';
    $Self->{Translation}->{'go back to edit question'} = '質問の編集に戻る';
    $Self->{Translation}->{'Answer:'} = '回答:';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = 'ページあたりの最大数';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = '通知の送信者';
    $Self->{Translation}->{'Notification Subject'} = '通知の件名';
    $Self->{Translation}->{'Changed By'} = '更新者';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = '統計一覧';
    $Self->{Translation}->{'Requests Table'} = '回答一覧';
    $Self->{Translation}->{'Send Time'} = '送信日時';
    $Self->{Translation}->{'Vote Time'} = '返信日時';
    $Self->{Translation}->{'See Details'} = '詳細を確認';
    $Self->{Translation}->{'Survey Stat Details'} = '調査統計の詳細';
    $Self->{Translation}->{'go back to stats overview'} = '統計一覧に戻る';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = '調査の情報';
    $Self->{Translation}->{'Sent requests'} = '送信数';
    $Self->{Translation}->{'Received surveys'} = '返信数';
    $Self->{Translation}->{'Survey Details'} = '調査の詳細';
    $Self->{Translation}->{'Ticket Services'} = 'チケット・サービス';
    $Self->{Translation}->{'Survey Results Graph'} = '調査結果のグラフ';
    $Self->{Translation}->{'No stat results.'} = '統計結果がありません。';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = '調査';
    $Self->{Translation}->{'Please answer these questions'} = 'これらの質問に回答してください。';
    $Self->{Translation}->{'Show my answers'} = '過去の回答を表示';
    $Self->{Translation}->{'These are your answers'} = 'これらは過去に回答されたものです。';
    $Self->{Translation}->{'Survey Title'} = '調査のタイトル';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = '新規調査の追加';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = '';
    $Self->{Translation}->{'No SurveyID is given!'} = '';
    $Self->{Translation}->{'Survey Edit'} = '調査の編集';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = '';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = '';
    $Self->{Translation}->{'Survey Edit Questions'} = '調査質問の編集';
    $Self->{Translation}->{'Yes/No'} = 'はい/いいえ';
    $Self->{Translation}->{'Radio (List)'} = 'ラジオボタン (一覧)';
    $Self->{Translation}->{'Checkbox (List)'} = 'チェックボックス (一覧)';
    $Self->{Translation}->{'Question Type'} = '質問タイプ';
    $Self->{Translation}->{'Complete'} = '完成';
    $Self->{Translation}->{'Incomplete'} = '未完成';
    $Self->{Translation}->{'Question Edit'} = '質問の編集';
    $Self->{Translation}->{'Answer Edit'} = '回答の編集';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = '統計一覧';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = '';
    $Self->{Translation}->{'Stats Detail'} = '統計の詳細';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = '新しい状態を設定できません! 質問が定義されていません。';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = '';
    $Self->{Translation}->{'Status changed.'} = '状態が変更されました。';
    $Self->{Translation}->{'- No queue selected -'} = 'キューが選択されていません';
    $Self->{Translation}->{'- No ticket type selected -'} = '';
    $Self->{Translation}->{'- No ticket service selected -'} = '';
    $Self->{Translation}->{'- Change Status -'} = '- ステータス変更 -';
    $Self->{Translation}->{'master'} = '';
    $Self->{Translation}->{'New Status'} = '新しい状況';
    $Self->{Translation}->{'Survey Description'} = '調査の説明';
    $Self->{Translation}->{'answered'} = '回答あり';
    $Self->{Translation}->{'not answered'} = '回答なし';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'フィードバックいただきありがとうございました。';
    $Self->{Translation}->{'The survey is finished.'} = '調査が完了しました。';
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
    $Self->{Translation}->{'You have already answered the survey.'} = '調査に回答済みです。';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = '調査モジュール';
    $Self->{Translation}->{'A module to edit survey questions.'} = '調査質問を編集するモジュール';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        '担当者インタフェースにおける調査オブジェクトに対する全てのパラメータ';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        '調査メールを送信した後、同じ顧客に新しい調査要求が送信されない日数。';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        '新しい調査について顧客に通知するメールの本文のデフォルト';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        '新しい調査をについて顧客に通知するメールの送信者のデフォルト';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        '新しい調査をについて顧客に通知するメールの件名のデフォルト';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        '調査一覧(S)を表示するための一覧モジュールの定義';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        '30日の間に顧客に送信する調査の最大数を定義します。(0は無制限を意味し、全ての調査要求が送信されます)';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        '';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        '調査拡大画面の要素に対してリッチテキストに対するデフォルトの高さを定義します。';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        '調査一覧で表示される列数を定義します。このオプションは列の位置には作用しません。';
    $Self->{Translation}->{'Edit survey general information.'} = '';
    $Self->{Translation}->{'Edit survey questions.'} = '';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        '公開インターフェースにおいて、顧客が2度回答しようとした際に、これまでの回答データを表示するShowVoteData画面を有効にするか否か';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = 'サービスの送信条件を有効または無効にする。';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        'ティケットタイプの送信条件を有効または無効にする。';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        '担当者インタフェースの統計フロントエンド・モジュールの登録です。';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        '担当者インタフェースの統計の変更画面フロントエンド・モジュールの登録です。';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        '担当者インタフェースの統計状況フロントエンド・モジュールの登録です。';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        '担当者インターフェースの調査拡大に対するフロントエンド・モジュールの登録です。';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        '公開インターフェースのPublicSurveyオブジェクトに対するフロントエンド・モジュールの登録です。';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'この正規表現にマッチする場合、調査は顧客に送信されません。';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        '調査一覧 (Small) の (調査が表示される) ページに対するパラメータ';
    $Self->{Translation}->{'Public Survey.'} = '公開インターフェースのPublicSurveyオブジェクトに対するフロントエンドモジュール登録です。';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        '担当者インタフェースの統計ズームビューで編集リンクをメニューを表示する。';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        '担当者インタフェースの統計質問ズームビューでの編集リンクをメニューに表示する。';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        '担当者インタフェースのズームビューで表示している統計の編集リンクをメニューを表示する。';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        '担当者インタフェースのズームビューで表示している統計の編集リンクをメニューを表示する。';
    $Self->{Translation}->{'Stats Details'} = '統計の詳細';
    $Self->{Translation}->{'Survey Add Module.'} = 'サーベイモジュール追加';
    $Self->{Translation}->{'Survey Edit Module.'} = '統計編集モジュール';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = '調査一覧(S)の表示数';
    $Self->{Translation}->{'Survey Stats Module.'} = '統計調査モジュール';
    $Self->{Translation}->{'Survey Zoom Module.'} = '調査の拡大モジュール';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = '';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = '調査は設定された電子メールアドレスには送信されません。';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        '例えばSurvey#, MySurvey#などのチケットの識別子です。デフォルトはSurvey#です。';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        'チケットが完了した際に、顧客に自動的に調査メールを送信するチケットイベントモジュール。';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = '追ってのサーベイ要求を送信するトリガ。';
    $Self->{Translation}->{'Zoom into statistics details.'} = '';

}

1;
