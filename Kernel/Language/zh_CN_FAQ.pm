# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_FAQ;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = '添加FAQ文章';
    $Self->{Translation}->{'Keywords'} = '关键字';
    $Self->{Translation}->{'A category is required.'} = '类别是必需的.';
    $Self->{Translation}->{'Approval'} = '审批';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'FAQ类别管理';
    $Self->{Translation}->{'Add category'} = '添加类别';
    $Self->{Translation}->{'Delete Category'} = '删除类别';
    $Self->{Translation}->{'Ok'} = '确定';
    $Self->{Translation}->{'Add Category'} = '添加类别';
    $Self->{Translation}->{'Edit Category'} = '编辑类别';
    $Self->{Translation}->{'Subcategory of'} = '子类别于';
    $Self->{Translation}->{'Please select at least one permission group.'} = '请至少选择一个组权限.';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = '能访问此类别文章的服务人员组';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = '将作为注释在浏览时显示.';
    $Self->{Translation}->{'Do you really want to delete this category?'} = '你确定要删除这个类别吗?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} =
        '你不能删除这个类别，该类别至少包含一篇FAQ文章，或者至少包含一个子类别。';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = '下列FAQ文章使用该类别';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = '该类别是下列子类别的父类别';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = '你确定要删除该FAQ文章吗?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ知识库';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'FAQ浏览器';
    $Self->{Translation}->{'Quick Search'} = '快速搜索';
    $Self->{Translation}->{'Wildcards are allowed.'} = '允许使用通配符。';
    $Self->{Translation}->{'Advanced Search'} = '高级搜索';
    $Self->{Translation}->{'Subcategories'} = '子类别';
    $Self->{Translation}->{'FAQ Articles'} = 'FAQ文章';
    $Self->{Translation}->{'No subcategories found.'} = '没有找到子类别.';

    # Template: AgentFAQHistory
    $Self->{Translation}->{'History of'} = '历史';

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = '没有找到FAQ日志数据。';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'FAQ语言管理';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languages.'} =
        '如果要使用多语言就使用本功能。';
    $Self->{Translation}->{'Add language'} = '添加语言';
    $Self->{Translation}->{'Delete Language %s'} = '删除语言 %s';
    $Self->{Translation}->{'Add Language'} = '添加语言';
    $Self->{Translation}->{'Edit Language'} = '编辑语言';
    $Self->{Translation}->{'Do you really want to delete this language?'} = '你确定要删除这个语言吗?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} =
        '你不能删除这个语言，至少有一篇FAQ文章使用该语言!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = '下列FAQ文章使用该语言';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '上下文设置';
    $Self->{Translation}->{'FAQ articles per page'} = '每页显示的FAQ文章数';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = '没有找到FAQ数据。';

    # Template: AgentFAQSearch
    $Self->{Translation}->{'Keyword'} = '关键字';
    $Self->{Translation}->{'Vote (e. g. Equals 10 or GreaterThan 60)'} = '投票数 (例如，= 10 或 >= 60)';
    $Self->{Translation}->{'Rate (e. g. Equals 25% or GreaterThan 75%)'} = '评分 (例如，= 10% 或 >= 75%)';
    $Self->{Translation}->{'Approved'} = '通过审批';
    $Self->{Translation}->{'Last changed by'} = '上次修改人';
    $Self->{Translation}->{'FAQ Article Create Time (before/after)'} = 'FAQ文章创建时间(相对)';
    $Self->{Translation}->{'FAQ Article Create Time (between)'} = 'FAQ文章创建时间(绝对)';
    $Self->{Translation}->{'FAQ Article Change Time (before/after)'} = 'FAQ文章修改时间(相对)';
    $Self->{Translation}->{'FAQ Article Change Time (between)'} = 'FAQ文章修改时间(绝对)';

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'FAQ全文';

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'FAQ搜索';
    $Self->{Translation}->{'Profile Selection'} = '配置选择';
    $Self->{Translation}->{'Vote'} = '投票';
    $Self->{Translation}->{'No vote settings'} = '无投票设置';
    $Self->{Translation}->{'Specific votes'} = '指定投票';
    $Self->{Translation}->{'e. g. Equals 10 or GreaterThan 60'} = '例如：等于10或者大于60';
    $Self->{Translation}->{'Rate'} = '评分';
    $Self->{Translation}->{'No rate settings'} = '无评分设置';
    $Self->{Translation}->{'Specific rate'} = '指定评分';
    $Self->{Translation}->{'e. g. Equals 25% or GreaterThan 75%'} = '例如：等于25%或大于75%';
    $Self->{Translation}->{'FAQ Article Create Time'} = 'FAQ文章创建时间';
    $Self->{Translation}->{'FAQ Article Change Time'} = 'FAQ文章修改时间';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'FAQ详细信息';
    $Self->{Translation}->{'Rating'} = '评分';
    $Self->{Translation}->{'out of 5'} = '(5分制)';
    $Self->{Translation}->{'Votes'} = '投票次数';
    $Self->{Translation}->{'No votes found!'} = '还没有投票!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = '还没有投票! 这将是该 FAQ 文章的第一个投票。';
    $Self->{Translation}->{'Download Attachment'} = '下载附件';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        '要打开下面描述中的链接，你可能需要在单击链接的同时按住 Ctrl 或 Cmd 或 Shift 键 （取决于您的浏览器和操作系统 ）。';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} =
        '此文档对您有帮助吗？请给出您的评价，帮助我们完善知识库，谢谢！';
    $Self->{Translation}->{'not helpful'} = '没有帮助';
    $Self->{Translation}->{'very helpful'} = '很有帮助';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Add FAQ title to article subject'} = '增加FAQ标题到文章主题中';
    $Self->{Translation}->{'Insert FAQ Text'} = '插入FAQ文本';
    $Self->{Translation}->{'Insert Full FAQ'} = '插入完整FAQ';
    $Self->{Translation}->{'Insert FAQ Link'} = '插入FAQ链接';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = '插入FAQ正文和链接';
    $Self->{Translation}->{'Insert Full FAQ & Link'} = '插入完整FAQ和链接';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = '未找到FAQ文章。';

    # Template: CustomerFAQRelatedArticles
    $Self->{Translation}->{'This might be helpful'} = '';
    $Self->{Translation}->{'Found no helpful resources for the subject and text.'} = '';
    $Self->{Translation}->{'Type a subject or text to get a list of helpful resources.'} = '';

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = '在FAQ中进行全文本搜索（例如：“John*n”或“Will*”）';
    $Self->{Translation}->{'Vote restrictions'} = '投票限制条件';
    $Self->{Translation}->{'Only FAQ articles with votes...'} = '仅FAQ文章的投票数……';
    $Self->{Translation}->{'Rate restrictions'} = '评分限制条件';
    $Self->{Translation}->{'Only FAQ articles with rate...'} = '仅FAQ文章的评分……';
    $Self->{Translation}->{'Only FAQ articles created'} = '仅FAQ文章的创建时间';
    $Self->{Translation}->{'Only FAQ articles created between'} = '仅在以下时间段创建的FAQ文章';
    $Self->{Translation}->{'Search-Profile as Template?'} = '将搜索配置设置为模板？';

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Article Number'} = '文章编号';
    $Self->{Translation}->{'Search for articles with keyword'} = '使用关键字搜索文章';

    # Template: PublicFAQSearchOpenSearchDescriptionFAQNumber
    $Self->{Translation}->{'Public'} = '公开';

    # Template: PublicFAQSearchResultShort
    $Self->{Translation}->{'Back to FAQ Explorer'} = '返回FAQ浏览器';

    # Perl Module: Kernel/Modules/AgentFAQAdd.pm
    $Self->{Translation}->{'You need rw permission!'} = '你需要rw权限！';
    $Self->{Translation}->{'No categories found where user has read/write permissions!'} = '没有找到用户有读写权限的类别。';
    $Self->{Translation}->{'No default language found and can\'t create a new one.'} = '没有找到默认语言且无法创建新的语言。';

    # Perl Module: Kernel/Modules/AgentFAQCategory.pm
    $Self->{Translation}->{'Need CategoryID!'} = '需要CategoryID！';
    $Self->{Translation}->{'A category should have a name!'} = '必须输入类别名称!';
    $Self->{Translation}->{'This category already exists'} = '类别已存在';
    $Self->{Translation}->{'FAQ category updated!'} = 'FAQ类别已更新!';
    $Self->{Translation}->{'This category already exists!'} = '该类别已存在！';
    $Self->{Translation}->{'FAQ category added!'} = 'FAQ类别已添加!';
    $Self->{Translation}->{'No CategoryID is given!'} = '没有指定CategoryID ！';
    $Self->{Translation}->{'Was not able to delete the category %s!'} = '不能删除类别%s！';

    # Perl Module: Kernel/Modules/AgentFAQDelete.pm
    $Self->{Translation}->{'No ItemID is given!'} = '没有指定ItemID！';
    $Self->{Translation}->{'You have no permission for this category!'} = '你没有权限使用此类别！';
    $Self->{Translation}->{'Was not able to delete the FAQ article %s!'} = '不能删除知识库文章%s！';

    # Perl Module: Kernel/Modules/AgentFAQExplorer.pm
    $Self->{Translation}->{'The CategoryID %s is invalid.'} = 'CategoryID %s无效。';

    # Perl Module: Kernel/Modules/AgentFAQHistory.pm
    $Self->{Translation}->{'Can\'t show history, as no ItemID is given!'} = '不能显示历史信息，因为没有指定ItemID！';
    $Self->{Translation}->{'FAQ History'} = 'FAQ历史';

    # Perl Module: Kernel/Modules/AgentFAQJournal.pm
    $Self->{Translation}->{'FAQ Journal'} = 'FAQ日志';
    $Self->{Translation}->{'Need config option FAQ::Frontend::Overview'} = '需要配置选项FAQ::Frontend::Overview。';
    $Self->{Translation}->{'Config option FAQ::Frontend::Overview needs to be a HASH ref!'} =
        '配置选项FAQ::Frontend::Overview需要是一个哈希引用！';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '没有找到视图“%s”的配置选项！';

    # Perl Module: Kernel/Modules/AgentFAQLanguage.pm
    $Self->{Translation}->{'No LanguageID is given!'} = '没有指定LanguageID！';
    $Self->{Translation}->{'The name is required!'} = '名称是必需的!';
    $Self->{Translation}->{'This language already exists!'} = '该语言已经存在!';
    $Self->{Translation}->{'FAQ language updated!'} = 'FAQ语言已更新!';
    $Self->{Translation}->{'FAQ language added!'} = 'FAQ语言已添加!';
    $Self->{Translation}->{'Was not able to delete the language %s!'} = '不能删除语言%s！';

    # Perl Module: Kernel/Modules/AgentFAQPrint.pm
    $Self->{Translation}->{'Last update'} = '上次更新';
    $Self->{Translation}->{'FAQ Dynamic Fields'} = 'FAQ动态字段';

    # Perl Module: Kernel/Modules/AgentFAQRichText.pm
    $Self->{Translation}->{'No %s is given!'} = '没有指定%s！';
    $Self->{Translation}->{'Can\'t load LanguageObject!'} = '不能载入语言对象！';

    # Perl Module: Kernel/Modules/AgentFAQSearch.pm
    $Self->{Translation}->{'No Result!'} = '无结果！';
    $Self->{Translation}->{'FAQ Number'} = 'FAQ编号';
    $Self->{Translation}->{'Last Changed by'} = '最后修改人';
    $Self->{Translation}->{'FAQ Item Create Time (before/after)'} = '知识库条目创建时间（在...之前/之后）';
    $Self->{Translation}->{'FAQ Item Create Time (between)'} = '知识库条目创建时间（在...之间）';
    $Self->{Translation}->{'FAQ Item Change Time (before/after)'} = '知识库条目修改时间（在...之前/之后）';
    $Self->{Translation}->{'FAQ Item Change Time (between)'} = '知识库条目修改时间（在...之间）';
    $Self->{Translation}->{'Equals'} = '等于';
    $Self->{Translation}->{'Greater than'} = '大于';
    $Self->{Translation}->{'Greater than equals'} = '大于等于';
    $Self->{Translation}->{'Smaller than'} = '小于';
    $Self->{Translation}->{'Smaller than equals'} = '小于等于';

    # Perl Module: Kernel/Modules/AgentFAQZoom.pm
    $Self->{Translation}->{'Need FileID!'} = '需要FileID！';
    $Self->{Translation}->{'Thanks for your vote!'} = '感谢您的投票!';
    $Self->{Translation}->{'You have already voted!'} = '您已经投票!';
    $Self->{Translation}->{'No rate selected!'} = '没有选择投票!';
    $Self->{Translation}->{'The voting mechanism is not enabled!'} = '投票机制没有启用！';
    $Self->{Translation}->{'The vote rate is not defined!'} = '没有定义投票的最大评分数！';

    # Perl Module: Kernel/Modules/CustomerFAQPrint.pm
    $Self->{Translation}->{'FAQ Article Print'} = 'FAQ文章打印';

    # Perl Module: Kernel/Modules/CustomerFAQSearch.pm
    $Self->{Translation}->{'Created between'} = '在...之间创建';

    # Perl Module: Kernel/Modules/CustomerFAQZoom.pm
    $Self->{Translation}->{'Need ItemID!'} = '需要ItemID！';

    # Perl Module: Kernel/Modules/PublicFAQExplorer.pm
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'FAQ文章(新创建的)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'FAQ文章(最近修改的)';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'FAQ文章(前10名)';

    # Perl Module: Kernel/Modules/PublicFAQRSS.pm
    $Self->{Translation}->{'No Type is given!'} = '没有指定类型！';
    $Self->{Translation}->{'Type must be either LastCreate or LastChange or Top10!'} = '类型必须是最后创建、最后修改或Top10！';
    $Self->{Translation}->{'Can\'t create RSS file!'} = '不能创建RSS文件！';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/AgentFAQSearch.pm
    $Self->{Translation}->{'%s (FAQFulltext)'} = '%s（FAQ全文）';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/CustomerFAQSearch.pm
    $Self->{Translation}->{'%s - Customer (%s)'} = '%s - 客户（%s）';
    $Self->{Translation}->{'%s - Customer (FAQFulltext)'} = '%s - 客户（FAQ全文）';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/PublicFAQSearch.pm
    $Self->{Translation}->{'%s - Public (%s)'} = '%s - 公开（%s）';
    $Self->{Translation}->{'%s - Public (FAQFulltext)'} = '%s - 公开（FAQ全文）';

    # Perl Module: Kernel/Output/HTML/Layout/FAQ.pm
    $Self->{Translation}->{'Need rate!'} = '请评分！';
    $Self->{Translation}->{'This article is empty!'} = '文章无内容！';
    $Self->{Translation}->{'Latest created FAQ articles'} = '最近创建的FAQ文章';
    $Self->{Translation}->{'Latest updated FAQ articles'} = '最近修改的FAQ文章';
    $Self->{Translation}->{'Top 10 FAQ articles'} = '最常用的文章';

    # Perl Module: Kernel/Output/HTML/LinkObject/FAQ.pm
    $Self->{Translation}->{'Content Type'} = '';

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} =
        '在HTML输出结果中为预定义字符串添加链接的过滤器。图像元素允许两种输入方式：第一种是用图像的名称（如faq.png），在这种情况下会使用OTRS的图像路径；第二种是插入图像的链接。';
    $Self->{Translation}->{'Add FAQ article'} = '添加FAQ文章';
    $Self->{Translation}->{'CSS color for the voting result.'} = '投票结果的CSS颜色。';
    $Self->{Translation}->{'Cache Time To Leave for FAQ items.'} = 'FAQ文章能显示的时间。';
    $Self->{Translation}->{'Category Management'} = '管理类别';
    $Self->{Translation}->{'Customer FAQ Print.'} = '客户FAQ打印。';
    $Self->{Translation}->{'Customer FAQ Zoom.'} = '客户FAQ详情。';
    $Self->{Translation}->{'Customer FAQ search.'} = '客户FAQ搜索';
    $Self->{Translation}->{'Customer FAQ.'} = '客户FAQ。';
    $Self->{Translation}->{'CustomerFAQRelatedArticles.'} = '';
    $Self->{Translation}->{'Decimal places of the voting result.'} = '以十分制显示评分结果。';
    $Self->{Translation}->{'Default category name.'} = '默认的目录名称。';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = '单语言模式下FAQ文章的默认语言。';
    $Self->{Translation}->{'Default maximum size of the titles in a FAQ article to be shown.'} =
        'FAQ文章默认显示标题的最大字符数。';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} =
        'FAQ 文章审批请求工单的默认优先级。';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'FAQ文章的默认状态。';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'FAQ 文章请求批准工单的默认状态。';
    $Self->{Translation}->{'Default type of tickets for the approval of FAQ articles.'} = 'FAQ 文章请求批准工单的默认类型。';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} =
        '公共前端界面指令参数的默认值，指令参数用于系统脚本。';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '定义链接对象小部件(LinkObject::ViewMode = \"complex\")设置按钮中的操作。请注意，这些操作必须已经在以下JS和CSS文件中注册：Core.AllocationList.css、Core.UI.AllocationList.js、 Core.UI.Table.Sort.js、Core.Agent.TableFilters.js和Core.Agent.LinkObject.js。';
    $Self->{Translation}->{'Define if the FAQ title should be concatenated to article subject.'} =
        '定义FAQ标题是否要加到文章主题中。';
    $Self->{Translation}->{'Define which columns are shown in the linked FAQs widget (LinkObject::ViewMode = "complex"). Note: Only FAQ attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '定义链接的知识库小部件(LinkObject::ViewMode = "complex")要显示的列。注意：只有知识库属性和动态字段（DynamicField_NameX）才能作为默认列，可用的设置值为：0 = 禁用，1 = 可用， 2 = 默认启用。';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} =
        '定义一个显示FAQ日志简洁视图的概览模块。';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} =
        '定义一个显示FAQ列表简洁视图的概览模块。';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} =
        '定义在服务人员界面的FAQ搜索结果中排序的默认FAQ属性。';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} =
        '定义在客户界面的FAQ搜索结果中排序的默认FAQ属性。';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} =
        '定义在公共界面的FAQ搜索结果中排序的默认FAQ属性。';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} =
        '定义在服务人员界面的FAQ浏览器中排序的默认FAQ属性。';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} =
        '定义在客户界面的FAQ浏览器中排序的默认FAQ属性。';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} =
        '定义在公共界面的FAQ浏览器中排序的默认FAQ属性。';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} =
        '定义在服务人员界面的FAQ浏览器中显示FAQ的顺序。向上：最早的在最上面，向下：最新的在最上面。';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} =
        '定义在客户界面的FAQ浏览器中显示FAQ的顺序。向上：最早的在最上面，向下：最新的在最上面。';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} =
        '定义在公共界面的FAQ浏览器中显示FAQ的顺序。向上：最早的在最上面，向下：最新的在最上面。';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} =
        '定义在服务人员界面的FAQ搜索结果中的显示顺序。向上：最早的在最上面，向下：最新的在最上面。';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} =
        '定义在客户界面的FAQ搜索结果中的显示顺序。向上：最早的在最上面，向下：最新的在最上面。';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} =
        '定义在公共界面的FAQ搜索结果中的显示顺序。向上：最早的在最上面，向下：最新的在最上面。';
    $Self->{Translation}->{'Defines the default shown FAQ search attribute for FAQ search screen.'} =
        '定义FAQ搜索窗口中默认的用于搜索的FAQ属性。';
    $Self->{Translation}->{'Defines the information to be inserted in a FAQ based Ticket. "Full FAQ" includes text, attachments and inline images.'} =
        '定义基于FAQ的工单中要插入的信息。“完整FAQ”包括文本、附件和内嵌图像。';
    $Self->{Translation}->{'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.'} =
        '定义仪表板的后端参数。“限制”定义默认显示条目的数量。“组”用于控制能访问此模块的组（如：admin;group1;group2组）。“默认”表示此模块默认为可用或需要用户手动启用。';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} =
        '定义在FAQ浏览器中要显示的列。这个选项不会影响列的位置。';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} =
        '定义在FAQ日志中要显示的列。这个选项不会影响列的位置。';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} =
        '定义在FAQ搜索结果中要显示的列。这个选项不会影响列的位置。';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed.'} = '定义“插入FAQ”链接在何处显示。';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = '定义 FAQ 条目的不受限文字字段.';
    $Self->{Translation}->{'Delete this FAQ'} = '删除这篇FAQ';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '服务人员界面中添加FAQ时动态字段显示设置，可用值为：0 = 禁用，1 = 启用，2 = 启用且必填';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '服务人员界面中编辑FAQ时动态字段显示设置，可用值为：0 = 禁用，1 = 启用，2 = 启用且必填';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '客户界面中添加FAQ时动态字段显示设置，可用值为：0 = 禁用，1 = 启用，2 = 启用且必填';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        '客户界面中编辑FAQ时动态字段显示设置，可用值为：0 = 禁用，1 = 启用，2 = 启用且必填';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '服务人员界面中打印FAQ时动态字段显示设置，可用值为：0 = 禁用，1 = 启用';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '客户界面中打印FAQ时动态字段显示设置，可用值为：0 = 禁用，1 = 启用';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '公共界面中打印FAQ时动态字段显示设置，可用值为：0 = 禁用，1 = 启用';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        '服务人员界面中搜索FAQ时动态字段显示设置，可用值为：0 = 禁用，1 = 启用，2 = 启用且默认显示';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        '客户界面中搜索FAQ时动态字段显示设置，可用值为：0 = 禁用，1 = 启用，2 = 启用且默认显示';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        '公共界面中搜索FAQ时动态字段显示设置，可用值为：0 = 禁用，1 = 启用，2 = 启用且默认显示';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '服务人员界面中，FAQ概览视图显示时动态字段显示设置，可用值为：0 = 禁用，1 = 启用';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '服务人员界面中，FAQ详情窗口显示时动态字段显示设置，可用值为：0 = 禁用，1 = 启用';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '客户界面中，FAQ详情窗口显示时动态字段显示设置，可用值为：0 = 禁用，1 = 启用';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        '公共界面中，FAQ详情窗口显示时动态字段显示设置，可用值为：0 = 禁用，1 = 启用';
    $Self->{Translation}->{'Edit this FAQ'} = '编辑FAQ';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = '在FAQ模块中启用多种语言。';
    $Self->{Translation}->{'Enable the related article feature for the customer frontend.'} =
        '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = '在FAQ模块中启用投票机制。';
    $Self->{Translation}->{'Explorer'} = '浏览';
    $Self->{Translation}->{'FAQ AJAX Responder'} = 'FAQ AJAX Responder';
    $Self->{Translation}->{'FAQ AJAX Responder for Richtext.'} = '用于FAQ富文本的AJAX Responder。';
    $Self->{Translation}->{'FAQ Area'} = 'FAQ区域';
    $Self->{Translation}->{'FAQ Area.'} = 'FAQ区域。';
    $Self->{Translation}->{'FAQ Delete.'} = 'FAQ删除。';
    $Self->{Translation}->{'FAQ Edit.'} = 'FAQ编辑。';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = 'FAQ日志概览“简洁视图”限制';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = 'FAQ概览“简洁视图”限制';
    $Self->{Translation}->{'FAQ Print.'} = 'FAQ打印。';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = 'FAQ日志概览“简洁视图”中每页显示的FAQ数量';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = 'FAQ概览“简洁视图”中每页显示的FAQ数量';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = '服务人员界面中，FAQ搜索的后台选项。';
    $Self->{Translation}->{'Field4'} = '字段4';
    $Self->{Translation}->{'Field5'} = '字段5';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = '公共界面的前端模块注册';
    $Self->{Translation}->{'Full FAQ'} = '完整FAQ';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = '批准 FAQ 文章请求的群组。';
    $Self->{Translation}->{'History of this FAQ'} = 'FAQ文章的历史信息';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = '在基于FAQ文章的工单中包含内部字段。';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = '在基于FAQ文章的工单中包含每个字段的名称。';
    $Self->{Translation}->{'Interfaces where the quick search should be shown.'} = '快速搜索时显示的界面';
    $Self->{Translation}->{'Journal'} = '日志';
    $Self->{Translation}->{'Language Management'} = '管理语言';
    $Self->{Translation}->{'Limit for the search to build the keyword FAQ article list.'} = '';
    $Self->{Translation}->{'Link another object to this FAQ item'} = '链接对象到这个FAQ条目';
    $Self->{Translation}->{'List of queue names for which the related article feature is enabled.'} =
        '';
    $Self->{Translation}->{'List of state types which can be used in the agent interface.'} =
        '在服务人员界面中能够使用的状态类型列表。';
    $Self->{Translation}->{'List of state types which can be used in the customer interface.'} =
        '在客户界面中能够使用的状态类型列表。';
    $Self->{Translation}->{'List of state types which can be used in the public interface.'} =
        '在公共界面中能够使用的状态类型列表。';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} =
        '在服务人员界面中，FAQ浏览器能够显示FAQ文章的最大数量。';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} =
        '在客户界面中，FAQ浏览器能够显示FAQ文章的最大数量。';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} =
        '在公共界面中，FAQ浏览器能够显示FAQ文章的最大数量。';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} =
        '在服务人员界面中，FAQ日志能够显示FAQ文章的最大数量。';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} =
        '在服务人员界面中，FAQ搜索结果能够显示的最大数量。';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} =
        '在客户界面中，FAQ搜索结果能够显示的最大数量。';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} =
        '在公共界面中，FAQ搜索结果能够显示的最大数量。';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the agent interface.'} =
        '在服务人员界面中，FAQ浏览器显示FAQ文章标题的最长字符数。';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the customer interface.'} =
        '在客户界面中，FAQ浏览器显示FAQ文章标题的最长字符数。';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the public interface.'} =
        '在公共界面中，FAQ浏览器显示FAQ文章标题的最长字符数。';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the agent interface.'} =
        '在服务人员界面中，FAQ搜索结果显示FAQ文章标题的最长字符数。';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the customer interface.'} =
        '在客户界面中，FAQ搜索结果显示FAQ文章标题的最长字符数。';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the public interface.'} =
        '在公共界面中，FAQ搜索结果显示FAQ文章标题的最长字符数。';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ journal in the agent interface.'} =
        '在服务人员界面中，FAQ日志视图显示FAQ文章标题的最长字符数。';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the customer interface.'} =
        '';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the public interface.'} =
        '在公共界面中，为优化FAQ搜索用于生成HTML开放搜索（OpenSearch）配置的模块。';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short FAQ search.'} =
        '';
    $Self->{Translation}->{'New FAQ Article'} = '创建FAQ文章';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = '新建的FAQ文章在发布之前需要审批。';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} =
        '在客户界面中，FAQ浏览器视图显示的FAQ文章数量。';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} =
        '在公共界面中，FAQ浏览器视图显示的FAQ文章数量。';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} =
        '在客户界面中，FAQ搜索结果每页显示的FAQ文章数量。';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} =
        '在公共界面中，FAQ搜索结果每页显示的FAQ文章数量。';
    $Self->{Translation}->{'Number of shown items in last changes.'} = '显示最近更改条目的数量。';
    $Self->{Translation}->{'Number of shown items in last created.'} = '显示最新创建条目的数量。';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = '按Top10格式显示的条目数。';
    $Self->{Translation}->{'Output filter to add Java-script to CustomerTicketMessage screen.'} =
        '';
    $Self->{Translation}->{'Output limit for the related FAQ articles.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} =
        '显示FAQ条目的微型FAQ日志概览的页面参数。';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} =
        '显示FAQ条目的FAQ概览简洁视图的页面参数。';
    $Self->{Translation}->{'Print this FAQ'} = '打印这篇FAQ';
    $Self->{Translation}->{'Public FAQ Print.'} = '公开FAQ打印。';
    $Self->{Translation}->{'Public FAQ Zoom.'} = '公开FAQ详情。';
    $Self->{Translation}->{'Public FAQ search.'} = '公开FAQ搜索。';
    $Self->{Translation}->{'Public FAQ.'} = '公开FAQ。';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = '审批 FAQ 文章的队列。';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = '好评率, 键值必须以百分比表示。';
    $Self->{Translation}->{'S'} = '简洁';
    $Self->{Translation}->{'Search FAQ'} = '搜索FAQ';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        '在”AgentFAQZoom“中，设置内置HTML字段的默认高度（单位：像素）。';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        '在客户FAQ详情和公开FAQ详情中，设置内置HTML字段的默认高度（按像素）。';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        '在服务人员FAQ详情中，设置内置HTML字段的最大高度（按像素）。';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        '在客户FAQ详情和公开FAQ详情中，设置内置HTML字段的最大高度（按像素）。';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        '对于公开的FAQ文章，在服务人员FAQ详情窗口中显示“插入FAQ链接”按钮。';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" / "Insert Full FAQ & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        '对于公开的FAQ文章，在服务人员FAQ详情窗口中显示“插入FAQ文本和链接”/“插入完整FAQ和链接”按钮。';
    $Self->{Translation}->{'Show "Insert FAQ Text" / "Insert Full FAQ" Button in AgentFAQZoomSmall.'} =
        '在服务人员FAQ详情窗口中显示“插入FAQ文本”/“插入完整FAQ”按钮。';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = '以 HTML 格式显示 FAQ 文章。';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = '是/否显示 FAQ 路径。';
    $Self->{Translation}->{'Show invalid items in the FAQ Explorer result of the agent interface.'} =
        '在服务人员界面中，在FAQ浏览器结果中显示无效条目。';
    $Self->{Translation}->{'Show items of subcategories.'} = '显示子目录的条目。';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = '在定义的界面上显示最近更改的条目。';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = '在定义的界面上显示最新创建的条目。';
    $Self->{Translation}->{'Show the stars for the articles with a rating equal or greater like the defined value (set value \'0\' to deactive the output).'} =
        '';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = '在定义的界面上显示点击量前十个条目。';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = '在定义的界面上显示文章评分。';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} =
        '在服务人员界面中，在该FAQ详情窗口菜单中显示允许将FAQ链接到另一个对象的链接。';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} =
        '在服务人员界面中，在该FAQ的详情窗口菜单中显示允许删除FAQ的链接。';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} =
        '在服务人员界面中，在该FAQ的详情窗口菜单中显示访问FAQ历史的链接。';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} =
        '在服务人员界面中，在该FAQ的详情窗口菜单中显示编辑FAQ的链接。';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} =
        '在服务人员界面中，在该FAQ的详情窗口菜单中显示后退的链接。';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} =
        '在服务人员界面的详情窗口菜单中，显示打印FAQ的链接。';
    $Self->{Translation}->{'Solution'} = '解决方案';
    $Self->{Translation}->{'Symptom'} = '症状';
    $Self->{Translation}->{'Text Only'} = '仅文本';
    $Self->{Translation}->{'The default languages for the related FAQ articles.'} = '';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} =
        'FAQ 的标识符, 例如 (常见问题解答)FAQ#, (知识库)KB#, 默认为 FAQ#。';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} =
        '该设置定义了一个能通过“普通（Normal）”的链接类型与其他FAQ对象连接的FAQ对象。';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} =
        '该设置定义了一个能通过“父子（ParentChild）”的链接类型与其他FAQ对象连接的FAQ对象。';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} =
        '该设置定义了一个能通过“普通（Normal）”的链接类型与其他工单对象连接的FAQ对象。';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} =
        '该设置定义了一个能通过“父子（ParentChild）”的链接类型与其他工单对象连接的FAQ对象。';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'FAQ 文章审批请求的工单正文。';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'FAQ 文章审批请求的工单标题。';
    $Self->{Translation}->{'Toolbar Item for a shortcut.'} = '快捷键的工具栏条目。';
    $Self->{Translation}->{'external (customer)'} = '外部(用户)';
    $Self->{Translation}->{'internal (agent)'} = '内部(服务人员)';
    $Self->{Translation}->{'public (public)'} = '公开（公开）';

}

1;
