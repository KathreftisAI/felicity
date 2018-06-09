# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_TW_FAQ;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = '添加常見問題文章';
    $Self->{Translation}->{'Keywords'} = '關鍵字';
    $Self->{Translation}->{'A category is required.'} = '目錄分類為必須的!';
    $Self->{Translation}->{'Approval'} = '審批';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = '常見問題目錄分類管理';
    $Self->{Translation}->{'Add category'} = '添加目錄分類';
    $Self->{Translation}->{'Delete Category'} = '刪除目錄分類';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = '添加目錄分類';
    $Self->{Translation}->{'Edit Category'} = '編輯目錄分類';
    $Self->{Translation}->{'Subcategory of'} = '';
    $Self->{Translation}->{'Please select at least one permission group.'} = '請選擇至少一個權限組。';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = '可以存取此目錄分類文章的服務員組別。';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = '在瀏覽器中將會顯示為評言。';
    $Self->{Translation}->{'Do you really want to delete this category?'} = '您確定要刪除此目錄分類？';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} =
        '您無法刪除此目錄分類。至少被一篇常見問題文章在此目錄分類內，及/或它是至少一個其他目錄分類是它的母目錄分類。';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = '以下的常見問題文章使用此目類分類';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = '以下目錄分類是此目錄分類的子目錄分類';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = '您確定要刪除此常見問題文章？';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = '常見問題';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = '探索常見問題';
    $Self->{Translation}->{'Quick Search'} = '快速搜尋';
    $Self->{Translation}->{'Wildcards are allowed.'} = '容許使用通配符號。';
    $Self->{Translation}->{'Advanced Search'} = '進階搜尋';
    $Self->{Translation}->{'Subcategories'} = '子目錄分類';
    $Self->{Translation}->{'FAQ Articles'} = '常見問題文章';
    $Self->{Translation}->{'No subcategories found.'} = '沒有找到子目錄分類。';

    # Template: AgentFAQHistory
    $Self->{Translation}->{'History of'} = '歷史';

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = '沒有找到常見問題日誌數據。';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = '常見問題語言管理';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languages.'} =
        '';
    $Self->{Translation}->{'Add language'} = '添加語言';
    $Self->{Translation}->{'Delete Language %s'} = '刪除語言 %s';
    $Self->{Translation}->{'Add Language'} = '添加語言';
    $Self->{Translation}->{'Edit Language'} = '編輯語言';
    $Self->{Translation}->{'Do you really want to delete this language?'} = '您確定要刪除此語言？';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} =
        '您無法刪除此語言。它被至少一篇常見問題文章使用中。';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = '以下常見問題文章正使用此目錄分類';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '上下文設置';
    $Self->{Translation}->{'FAQ articles per page'} = '常見問題文章/頁';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = '沒有找到常見問題數據。';

    # Template: AgentFAQSearch
    $Self->{Translation}->{'Keyword'} = '關鍵字';
    $Self->{Translation}->{'Vote (e. g. Equals 10 or GreaterThan 60)'} = '投票 (例：等於10或大於60)';
    $Self->{Translation}->{'Rate (e. g. Equals 25% or GreaterThan 75%)'} = '評分 (例：等於25%或大於75%)';
    $Self->{Translation}->{'Approved'} = '已通過審批';
    $Self->{Translation}->{'Last changed by'} = '最後修改於';
    $Self->{Translation}->{'FAQ Article Create Time (before/after)'} = '常見問題文章創建時間 (之前/之後)';
    $Self->{Translation}->{'FAQ Article Create Time (between)'} = '常見問題文章創建時間(之間)';
    $Self->{Translation}->{'FAQ Article Change Time (before/after)'} = '常見問題文章更新時間(之前/之後)';
    $Self->{Translation}->{'FAQ Article Change Time (between)'} = '常見問題文章更新時間(之間)';

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = '常見問題全文內容';

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = '常見問題搜尋';
    $Self->{Translation}->{'Profile Selection'} = '檔案資料選項';
    $Self->{Translation}->{'Vote'} = '投票';
    $Self->{Translation}->{'No vote settings'} = '沒有投票設定';
    $Self->{Translation}->{'Specific votes'} = '指定選票';
    $Self->{Translation}->{'e. g. Equals 10 or GreaterThan 60'} = '例：等於10或大於60';
    $Self->{Translation}->{'Rate'} = '評分';
    $Self->{Translation}->{'No rate settings'} = '沒有評分設定';
    $Self->{Translation}->{'Specific rate'} = '指定評分';
    $Self->{Translation}->{'e. g. Equals 25% or GreaterThan 75%'} = '例：等於25%或大於75%';
    $Self->{Translation}->{'FAQ Article Create Time'} = '常見問題文章創建時間';
    $Self->{Translation}->{'FAQ Article Change Time'} = '常見問題文章編輯時間';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = '常見問題資訊';
    $Self->{Translation}->{'Rating'} = '評分';
    $Self->{Translation}->{'out of 5'} = '';
    $Self->{Translation}->{'Votes'} = '選票';
    $Self->{Translation}->{'No votes found!'} = '沒有找到選票！';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = '';
    $Self->{Translation}->{'Download Attachment'} = '下載附件';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        '';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} =
        '';
    $Self->{Translation}->{'not helpful'} = '沒有幫助';
    $Self->{Translation}->{'very helpful'} = '很有幫助';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Add FAQ title to article subject'} = '添加常見問題標題到文章標題';
    $Self->{Translation}->{'Insert FAQ Text'} = '插入常見問題文字';
    $Self->{Translation}->{'Insert Full FAQ'} = '插入全部常見問題';
    $Self->{Translation}->{'Insert FAQ Link'} = '插入常見問題連結';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = '插入常見問題文字及連結';
    $Self->{Translation}->{'Insert Full FAQ & Link'} = '插入全部常見問題及連結';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = '沒有找到常見問題文章。';

    # Template: CustomerFAQRelatedArticles
    $Self->{Translation}->{'This might be helpful'} = '';
    $Self->{Translation}->{'Found no helpful resources for the subject and text.'} = '';
    $Self->{Translation}->{'Type a subject or text to get a list of helpful resources.'} = '';

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = '常見問題文章全文檢索 (例："John*n" 或 "Will*")';
    $Self->{Translation}->{'Vote restrictions'} = '投票限制條件';
    $Self->{Translation}->{'Only FAQ articles with votes...'} = '只是有被投選的常見問題文章';
    $Self->{Translation}->{'Rate restrictions'} = '評分限制條件';
    $Self->{Translation}->{'Only FAQ articles with rate...'} = '只是有評分的常見問題文章';
    $Self->{Translation}->{'Only FAQ articles created'} = '只是已創建的常見問題文章';
    $Self->{Translation}->{'Only FAQ articles created between'} = '只是常見問題文章創建於';
    $Self->{Translation}->{'Search-Profile as Template?'} = '';

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Article Number'} = '文章編號';
    $Self->{Translation}->{'Search for articles with keyword'} = '用關鍵字搜尋文章';

    # Template: PublicFAQSearchOpenSearchDescriptionFAQNumber
    $Self->{Translation}->{'Public'} = '公開';

    # Template: PublicFAQSearchResultShort
    $Self->{Translation}->{'Back to FAQ Explorer'} = '回到常見問題瀏覽器';

    # Perl Module: Kernel/Modules/AgentFAQAdd.pm
    $Self->{Translation}->{'You need rw permission!'} = '';
    $Self->{Translation}->{'No categories found where user has read/write permissions!'} = '';
    $Self->{Translation}->{'No default language found and can\'t create a new one.'} = '';

    # Perl Module: Kernel/Modules/AgentFAQCategory.pm
    $Self->{Translation}->{'Need CategoryID!'} = '';
    $Self->{Translation}->{'A category should have a name!'} = '目錄分類必須有名稱!';
    $Self->{Translation}->{'This category already exists'} = '此目錄分類已經存在';
    $Self->{Translation}->{'FAQ category updated!'} = '常見問題目錄分類已更新!';
    $Self->{Translation}->{'This category already exists!'} = '';
    $Self->{Translation}->{'FAQ category added!'} = '常見問題目錄分類已添加!';
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
    $Self->{Translation}->{'FAQ Journal'} = '常見問題日誌';
    $Self->{Translation}->{'Need config option FAQ::Frontend::Overview'} = '';
    $Self->{Translation}->{'Config option FAQ::Frontend::Overview needs to be a HASH ref!'} =
        '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQLanguage.pm
    $Self->{Translation}->{'No LanguageID is given!'} = '';
    $Self->{Translation}->{'The name is required!'} = '名稱為必須的!';
    $Self->{Translation}->{'This language already exists!'} = '此語言已存在!';
    $Self->{Translation}->{'FAQ language updated!'} = '常見問題語言已更新!';
    $Self->{Translation}->{'FAQ language added!'} = '常見問題語言已添加!';
    $Self->{Translation}->{'Was not able to delete the language %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQPrint.pm
    $Self->{Translation}->{'Last update'} = '最後更新';
    $Self->{Translation}->{'FAQ Dynamic Fields'} = '常見問題動態欄位';

    # Perl Module: Kernel/Modules/AgentFAQRichText.pm
    $Self->{Translation}->{'No %s is given!'} = '';
    $Self->{Translation}->{'Can\'t load LanguageObject!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQSearch.pm
    $Self->{Translation}->{'No Result!'} = '沒有結果!';
    $Self->{Translation}->{'FAQ Number'} = '常見問題編號';
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
    $Self->{Translation}->{'Thanks for your vote!'} = '感謝您的投票!';
    $Self->{Translation}->{'You have already voted!'} = '您己經投票!';
    $Self->{Translation}->{'No rate selected!'} = '沒有選取評分!';
    $Self->{Translation}->{'The voting mechanism is not enabled!'} = '';
    $Self->{Translation}->{'The vote rate is not defined!'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQPrint.pm
    $Self->{Translation}->{'FAQ Article Print'} = '常見問題文章列印';

    # Perl Module: Kernel/Modules/CustomerFAQSearch.pm
    $Self->{Translation}->{'Created between'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQZoom.pm
    $Self->{Translation}->{'Need ItemID!'} = '';

    # Perl Module: Kernel/Modules/PublicFAQExplorer.pm
    $Self->{Translation}->{'FAQ Articles (new created)'} = '常見問題文章 (新添加)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = '常見問題文章 (最近更新)';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = '常見問題文章 (首10篇)';

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
    $Self->{Translation}->{'This article is empty!'} = '此文章為空白!';
    $Self->{Translation}->{'Latest created FAQ articles'} = '最近添加的常見問題文章';
    $Self->{Translation}->{'Latest updated FAQ articles'} = '最近更新常見問題文章';
    $Self->{Translation}->{'Top 10 FAQ articles'} = '首10篇常見問題文章';

    # Perl Module: Kernel/Output/HTML/LinkObject/FAQ.pm
    $Self->{Translation}->{'Content Type'} = '';

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} =
        '';
    $Self->{Translation}->{'Add FAQ article'} = '';
    $Self->{Translation}->{'CSS color for the voting result.'} = '選票結果使用的CSS 顏色';
    $Self->{Translation}->{'Cache Time To Leave for FAQ items.'} = '離開常見問題項目的緩存時間';
    $Self->{Translation}->{'Category Management'} = '目錄分類管理';
    $Self->{Translation}->{'Customer FAQ Print.'} = '';
    $Self->{Translation}->{'Customer FAQ Zoom.'} = '';
    $Self->{Translation}->{'Customer FAQ search.'} = '';
    $Self->{Translation}->{'Customer FAQ.'} = '';
    $Self->{Translation}->{'CustomerFAQRelatedArticles.'} = '';
    $Self->{Translation}->{'Decimal places of the voting result.'} = '選票結果小數位';
    $Self->{Translation}->{'Default category name.'} = '默許目錄分類名稱';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = '單一語言模式下的常見問題文章默許語言';
    $Self->{Translation}->{'Default maximum size of the titles in a FAQ article to be shown.'} =
        '默許常見問題文章標題顯示的最大值';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} =
        '等待審批常見問題文章工單預設優先值';
    $Self->{Translation}->{'Default state for FAQ entry.'} = '常見問題條目預設狀態';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = '等待審批常見問題文章的工單默許狀態';
    $Self->{Translation}->{'Default type of tickets for the approval of FAQ articles.'} = '等待審批常見問題文章的工單默許類別';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} =
        '';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define if the FAQ title should be concatenated to article subject.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked FAQs widget (LinkObject::ViewMode = "complex"). Note: Only FAQ attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} =
        '設定顯示常見問題日誌小檢閱模式的概況模組';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} =
        '設定顯示常見問題列表小檢閱模式的概況模組';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} =
        '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} =
        '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} =
        '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} =
        '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} =
        '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} =
        '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} =
        '';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} =
        '';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} =
        '';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} =
        '';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} =
        '';
    $Self->{Translation}->{'Defines the default shown FAQ search attribute for FAQ search screen.'} =
        '';
    $Self->{Translation}->{'Defines the information to be inserted in a FAQ based Ticket. "Full FAQ" includes text, attachments and inline images.'} =
        '';
    $Self->{Translation}->{'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} =
        '';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed.'} = '設定 \'插入常見問題\' 顯示位置';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = '';
    $Self->{Translation}->{'Delete this FAQ'} = '刪除此常見問題';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '';
    $Self->{Translation}->{'Edit this FAQ'} = '編輯此常見問題';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = '啓用常見問題模組多種語言';
    $Self->{Translation}->{'Enable the related article feature for the customer frontend.'} =
        '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = '啓用常見問題模組投票機制';
    $Self->{Translation}->{'Explorer'} = '瀏覽器';
    $Self->{Translation}->{'FAQ AJAX Responder'} = '';
    $Self->{Translation}->{'FAQ AJAX Responder for Richtext.'} = '';
    $Self->{Translation}->{'FAQ Area'} = '';
    $Self->{Translation}->{'FAQ Area.'} = '';
    $Self->{Translation}->{'FAQ Delete.'} = '';
    $Self->{Translation}->{'FAQ Edit.'} = '';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = '常見問題日誌概況 "小" 模式限制';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = '常見問題概況 "小"模式限制';
    $Self->{Translation}->{'FAQ Print.'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = '常見問題日誌概況 "小" 模式每頁顯示常見問題數量';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = '常見問題概況 "小"  模式每頁顯示常見問題數量';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = '';
    $Self->{Translation}->{'Field4'} = '欄位4';
    $Self->{Translation}->{'Field5'} = '欄位5';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = '公開介面的前台模組登記';
    $Self->{Translation}->{'Full FAQ'} = '';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = '常見問題文章審批用戶組';
    $Self->{Translation}->{'History of this FAQ'} = '此常見問題歷史';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = '常見問題為本的工單包含的內部欄位';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = '常見問題為本的工單包含的每一欄位名稱';
    $Self->{Translation}->{'Interfaces where the quick search should be shown.'} = '顯示快速搜尋的介面';
    $Self->{Translation}->{'Journal'} = '日誌';
    $Self->{Translation}->{'Language Management'} = '語言管理';
    $Self->{Translation}->{'Limit for the search to build the keyword FAQ article list.'} = '';
    $Self->{Translation}->{'Link another object to this FAQ item'} = '連結其他物件到此常見問題物件';
    $Self->{Translation}->{'List of queue names for which the related article feature is enabled.'} =
        '';
    $Self->{Translation}->{'List of state types which can be used in the agent interface.'} =
        '在服務員介面可使用的狀態分類列表';
    $Self->{Translation}->{'List of state types which can be used in the customer interface.'} =
        '在客戶介面可使用的狀態分類列表';
    $Self->{Translation}->{'List of state types which can be used in the public interface.'} =
        '在公開介面可使用的狀態分類列表';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} =
        '在服務員介面可顯示於常見問題瀏覽器結果的常見問題文章最多數量';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} =
        '在客戶介面可顯示於常見問題瀏覽器結果的常見問題文章最大數量';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} =
        '在公開介面可顯示於常見問題瀏覽器結果的常見問題文章最大數量';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} =
        '在服務員介面可顯示於常見問題日誌的常見問題文章最大數量';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} =
        '在服務員介面可顯示於搜尋結果的常見問題文章最大數量';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} =
        '在客戶介面可顯示於搜尋結果的常見問題文章最大數量';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} =
        '在公開介面可顯示於搜尋結果的常見問題文章最大數量';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the agent interface.'} =
        '';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the customer interface.'} =
        '';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the public interface.'} =
        '';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the agent interface.'} =
        '';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the customer interface.'} =
        '';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the public interface.'} =
        '';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ journal in the agent interface.'} =
        '';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the customer interface.'} =
        '';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the public interface.'} =
        '';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short FAQ search.'} =
        '';
    $Self->{Translation}->{'New FAQ Article'} = '新常見問題文章';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = '新常見問題文章發佈前需要經過審批';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} =
        '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} =
        '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} =
        '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} =
        '';
    $Self->{Translation}->{'Number of shown items in last changes.'} = '最近更新顯示項目數量';
    $Self->{Translation}->{'Number of shown items in last created.'} = '最近創建顯示項目數量';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = '首10篇功能顯示項目數量';
    $Self->{Translation}->{'Output filter to add Java-script to CustomerTicketMessage screen.'} =
        '';
    $Self->{Translation}->{'Output limit for the related FAQ articles.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} =
        '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} =
        '';
    $Self->{Translation}->{'Print this FAQ'} = '列印此常見問題';
    $Self->{Translation}->{'Public FAQ Print.'} = '';
    $Self->{Translation}->{'Public FAQ Zoom.'} = '';
    $Self->{Translation}->{'Public FAQ search.'} = '';
    $Self->{Translation}->{'Public FAQ.'} = '';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = '常見問題文章審批佇列';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = '投票評分。數值必須為百分率。';
    $Self->{Translation}->{'S'} = '';
    $Self->{Translation}->{'Search FAQ'} = '搜尋常見問題';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        '設定在AgentFAQZoom中內嵌HTML欄位默許高度 (像素)';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        '設定在CustomerFAQZoom (及PublicFAQZoom)中內嵌HTML欄位默許高度 (像素)';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        '';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        '';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        '';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" / "Insert Full FAQ & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        '';
    $Self->{Translation}->{'Show "Insert FAQ Text" / "Insert Full FAQ" Button in AgentFAQZoomSmall.'} =
        '';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = '以HTML格式顯示常見問題文章';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = '顯示常見問題路徑 (是/否)';
    $Self->{Translation}->{'Show invalid items in the FAQ Explorer result of the agent interface.'} =
        '';
    $Self->{Translation}->{'Show items of subcategories.'} = '顯示子目錄分類項目';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = '顯示指定介面的最近更新項目';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = '顯示指定介面的最近創建項目';
    $Self->{Translation}->{'Show the stars for the articles with a rating equal or greater like the defined value (set value \'0\' to deactive the output).'} =
        '';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = '顯示指定介面的首10個項目';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = '顯示指定介面的投票';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Solution'} = '解決方案';
    $Self->{Translation}->{'Symptom'} = '';
    $Self->{Translation}->{'Text Only'} = '';
    $Self->{Translation}->{'The default languages for the related FAQ articles.'} = '';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} =
        '';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} =
        '';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = '';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = '';
    $Self->{Translation}->{'Toolbar Item for a shortcut.'} = '';
    $Self->{Translation}->{'external (customer)'} = '外部 (客戶)';
    $Self->{Translation}->{'internal (agent)'} = '內部 (服務員)';
    $Self->{Translation}->{'public (public)'} = '';

}

1;
