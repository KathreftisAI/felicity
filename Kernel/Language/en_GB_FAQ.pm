# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::en_GB_FAQ;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'Add FAQ Article';
    $Self->{Translation}->{'Keywords'} = 'Keywords';
    $Self->{Translation}->{'A category is required.'} = 'A category is required.';
    $Self->{Translation}->{'Approval'} = 'Approval';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'FAQ Category Management';
    $Self->{Translation}->{'Add category'} = 'Add category';
    $Self->{Translation}->{'Delete Category'} = 'Delete Category';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = 'Add Category';
    $Self->{Translation}->{'Edit Category'} = 'Edit Category';
    $Self->{Translation}->{'Subcategory of'} = 'Subcategory of';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'Please select at least one permission group.';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'Agent groups that can access articles in this category.';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Will be shown as comment in Explorer';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'Do you really want to delete this category?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} =
        'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'This category is used in the following FAQ article(s)';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'This category is parent of the following subcategories';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Do you really want to delete this FAQ article?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'FAQ Explorer';
    $Self->{Translation}->{'Quick Search'} = 'Quick Search';
    $Self->{Translation}->{'Wildcards are allowed.'} = 'Wildcards are allowed.';
    $Self->{Translation}->{'Advanced Search'} = 'Advanced Search';
    $Self->{Translation}->{'Subcategories'} = 'Subcategories';
    $Self->{Translation}->{'FAQ Articles'} = 'FAQ Articles';
    $Self->{Translation}->{'No subcategories found.'} = 'No subcategories found.';

    # Template: AgentFAQHistory
    $Self->{Translation}->{'History of'} = 'History of';

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'No FAQ Journal data found';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'FAQ Language Management';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languages.'} =
        'Use this feature if you want to work with multiple languages.';
    $Self->{Translation}->{'Add language'} = 'Add language';
    $Self->{Translation}->{'Delete Language %s'} = 'Delete Language %';
    $Self->{Translation}->{'Add Language'} = 'Add Language';
    $Self->{Translation}->{'Edit Language'} = 'Edit Language';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'Do you really want to delete this language?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} =
        'You can not delete this language. It is used in at least one FAQ article!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'This language is used in the following FAQ Article(s)';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Context Settings';
    $Self->{Translation}->{'FAQ articles per page'} = 'FAQ articles per page';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'No FAQ data found.';

    # Template: AgentFAQSearch
    $Self->{Translation}->{'Keyword'} = 'Keyword';
    $Self->{Translation}->{'Vote (e. g. Equals 10 or GreaterThan 60)'} = 'Vote (e.g. Equals 10 or GreaterThan 60)';
    $Self->{Translation}->{'Rate (e. g. Equals 25% or GreaterThan 75%)'} = 'Rate (e.g. Equals 25% or GreaterThan 75%)';
    $Self->{Translation}->{'Approved'} = 'Approved';
    $Self->{Translation}->{'Last changed by'} = 'Last changed by';
    $Self->{Translation}->{'FAQ Article Create Time (before/after)'} = 'FAQ Article Create Time (before/after)';
    $Self->{Translation}->{'FAQ Article Create Time (between)'} = 'FAQ Article Create Time (between)';
    $Self->{Translation}->{'FAQ Article Change Time (before/after)'} = 'FAQ Article Change Time (before/after)';
    $Self->{Translation}->{'FAQ Article Change Time (between)'} = 'FAQ Article Change Time (between)';

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'FAQFulltext';

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'FAQ Search';
    $Self->{Translation}->{'Profile Selection'} = 'Profile Selection';
    $Self->{Translation}->{'Vote'} = 'Vote';
    $Self->{Translation}->{'No vote settings'} = 'No vote settings';
    $Self->{Translation}->{'Specific votes'} = 'Specific votes';
    $Self->{Translation}->{'e. g. Equals 10 or GreaterThan 60'} = 'e.g. Equals 10 or GreaterThan 60';
    $Self->{Translation}->{'Rate'} = 'Rate';
    $Self->{Translation}->{'No rate settings'} = 'No rate settings';
    $Self->{Translation}->{'Specific rate'} = 'Specific rate';
    $Self->{Translation}->{'e. g. Equals 25% or GreaterThan 75%'} = 'e.g. Equals 25% or GreaterThan 75%';
    $Self->{Translation}->{'FAQ Article Create Time'} = 'FAQ Article Create Time';
    $Self->{Translation}->{'FAQ Article Change Time'} = 'FAQ Article Change Time';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'FAQ Information';
    $Self->{Translation}->{'Rating'} = 'Rating';
    $Self->{Translation}->{'out of 5'} = 'out of 5';
    $Self->{Translation}->{'Votes'} = 'Votes';
    $Self->{Translation}->{'No votes found!'} = 'No votes found!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'No votes found! Be the first one to rate this FAQ article.';
    $Self->{Translation}->{'Download Attachment'} = 'Download Attachment';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} =
        'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!';
    $Self->{Translation}->{'not helpful'} = 'not helpful';
    $Self->{Translation}->{'very helpful'} = 'very helpful';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Add FAQ title to article subject'} = 'Add FAQ title to article subject';
    $Self->{Translation}->{'Insert FAQ Text'} = 'Insert FAQ Text';
    $Self->{Translation}->{'Insert Full FAQ'} = 'Insert Full FAQ';
    $Self->{Translation}->{'Insert FAQ Link'} = 'Insert FAQ Link';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'Insert FAQ Text & Link';
    $Self->{Translation}->{'Insert Full FAQ & Link'} = 'Insert Full FAQ & Link';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'No FAQ articles found.';

    # Template: CustomerFAQRelatedArticles
    $Self->{Translation}->{'This might be helpful'} = '';
    $Self->{Translation}->{'Found no helpful resources for the subject and text.'} = '';
    $Self->{Translation}->{'Type a subject or text to get a list of helpful resources.'} = '';

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")';
    $Self->{Translation}->{'Vote restrictions'} = 'Vote restrictions';
    $Self->{Translation}->{'Only FAQ articles with votes...'} = 'Only FAQ articles with votes...';
    $Self->{Translation}->{'Rate restrictions'} = 'Rate restrictions';
    $Self->{Translation}->{'Only FAQ articles with rate...'} = 'Only FAQ articles with rate...';
    $Self->{Translation}->{'Only FAQ articles created'} = 'Only FAQ articles created';
    $Self->{Translation}->{'Only FAQ articles created between'} = 'Only FAQ articles created between';
    $Self->{Translation}->{'Search-Profile as Template?'} = 'Search-Profile as Template?';

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Article Number'} = 'Article Number?';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Search for articles with keyword';

    # Template: PublicFAQSearchOpenSearchDescriptionFAQNumber
    $Self->{Translation}->{'Public'} = 'Public';

    # Template: PublicFAQSearchResultShort
    $Self->{Translation}->{'Back to FAQ Explorer'} = 'Back to FAQ Explorer';

    # Perl Module: Kernel/Modules/AgentFAQAdd.pm
    $Self->{Translation}->{'You need rw permission!'} = '';
    $Self->{Translation}->{'No categories found where user has read/write permissions!'} = '';
    $Self->{Translation}->{'No default language found and can\'t create a new one.'} = '';

    # Perl Module: Kernel/Modules/AgentFAQCategory.pm
    $Self->{Translation}->{'Need CategoryID!'} = '';
    $Self->{Translation}->{'A category should have a name!'} = 'A category should have a name!';
    $Self->{Translation}->{'This category already exists'} = 'This category already exists';
    $Self->{Translation}->{'FAQ category updated!'} = 'FAQ category updated!';
    $Self->{Translation}->{'This category already exists!'} = '';
    $Self->{Translation}->{'FAQ category added!'} = 'FAQ category added!';
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
    $Self->{Translation}->{'FAQ Journal'} = 'FAQ Journal';
    $Self->{Translation}->{'Need config option FAQ::Frontend::Overview'} = '';
    $Self->{Translation}->{'Config option FAQ::Frontend::Overview needs to be a HASH ref!'} =
        '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQLanguage.pm
    $Self->{Translation}->{'No LanguageID is given!'} = '';
    $Self->{Translation}->{'The name is required!'} = 'The name is required!';
    $Self->{Translation}->{'This language already exists!'} = 'This language already exists!';
    $Self->{Translation}->{'FAQ language updated!'} = 'FAQ language updated!';
    $Self->{Translation}->{'FAQ language added!'} = 'FAQ language added!';
    $Self->{Translation}->{'Was not able to delete the language %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQPrint.pm
    $Self->{Translation}->{'Last update'} = 'Last update';
    $Self->{Translation}->{'FAQ Dynamic Fields'} = 'FAQ Dynamic Fields';

    # Perl Module: Kernel/Modules/AgentFAQRichText.pm
    $Self->{Translation}->{'No %s is given!'} = 'No %s is given!';
    $Self->{Translation}->{'Can\'t load LanguageObject!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQSearch.pm
    $Self->{Translation}->{'No Result!'} = 'No Result!';
    $Self->{Translation}->{'FAQ Number'} = 'FAQ number';
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
    $Self->{Translation}->{'Thanks for your vote!'} = 'Thanks for your vote!';
    $Self->{Translation}->{'You have already voted!'} = 'You have already voted!';
    $Self->{Translation}->{'No rate selected!'} = 'No rate selected!';
    $Self->{Translation}->{'The voting mechanism is not enabled!'} = '';
    $Self->{Translation}->{'The vote rate is not defined!'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQPrint.pm
    $Self->{Translation}->{'FAQ Article Print'} = 'FAQ Article Print';

    # Perl Module: Kernel/Modules/CustomerFAQSearch.pm
    $Self->{Translation}->{'Created between'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQZoom.pm
    $Self->{Translation}->{'Need ItemID!'} = '';

    # Perl Module: Kernel/Modules/PublicFAQExplorer.pm
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'FAQ Articles (new created)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'FAQ Articles (recently changed)';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'FAQ Articles (Top 10)';

    # Perl Module: Kernel/Modules/PublicFAQRSS.pm
    $Self->{Translation}->{'No Type is given!'} = '';
    $Self->{Translation}->{'Type must be either LastCreate or LastChange or Top10!'} = '';
    $Self->{Translation}->{'Can\'t create RSS file!'} = '';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/AgentFAQSearch.pm
    $Self->{Translation}->{'%s (FAQFulltext)'} = '%s (FAQFulltext)';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/CustomerFAQSearch.pm
    $Self->{Translation}->{'%s - Customer (%s)'} = '%s - Customer (%s)';
    $Self->{Translation}->{'%s - Customer (FAQFulltext)'} = '%s - Customer (FAQFulltext)';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/PublicFAQSearch.pm
    $Self->{Translation}->{'%s - Public (%s)'} = '%s - Public (%s)';
    $Self->{Translation}->{'%s - Public (FAQFulltext)'} = '%s - Public (FAQFulltext)';

    # Perl Module: Kernel/Output/HTML/Layout/FAQ.pm
    $Self->{Translation}->{'Need rate!'} = '';
    $Self->{Translation}->{'This article is empty!'} = 'This article is empty!';
    $Self->{Translation}->{'Latest created FAQ articles'} = 'Latest created FAQ articles';
    $Self->{Translation}->{'Latest updated FAQ articles'} = 'Latest updated FAQ articles';
    $Self->{Translation}->{'Top 10 FAQ articles'} = 'Top 10 FAQ articles';

    # Perl Module: Kernel/Output/HTML/LinkObject/FAQ.pm
    $Self->{Translation}->{'Content Type'} = '';

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} =
        'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.';
    $Self->{Translation}->{'Add FAQ article'} = 'Add FAQ article';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'CSS colour for the voting result.';
    $Self->{Translation}->{'Cache Time To Leave for FAQ items.'} = 'Cache Time to Leave for FAQ items.';
    $Self->{Translation}->{'Category Management'} = 'Category Management';
    $Self->{Translation}->{'Customer FAQ Print.'} = 'Customer FAQ Print.';
    $Self->{Translation}->{'Customer FAQ Zoom.'} = 'Customer FAQ Zoom.';
    $Self->{Translation}->{'Customer FAQ search.'} = 'Customer FAQ search.';
    $Self->{Translation}->{'Customer FAQ.'} = 'Customer FAQ.';
    $Self->{Translation}->{'CustomerFAQRelatedArticles.'} = '';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'Decimal places of the voting result.';
    $Self->{Translation}->{'Default category name.'} = 'Default category name.';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = 'Default language for FAQ articles on single language mode.';
    $Self->{Translation}->{'Default maximum size of the titles in a FAQ article to be shown.'} =
        'Default maximum size of the tiles in a FAQ article to be shown.';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} =
        'Default priority of tickets for the approval of FAQ articles.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Default state for FAQ entry.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'Default state of tickets for the approval of FAQ articles.';
    $Self->{Translation}->{'Default type of tickets for the approval of FAQ articles.'} = 'Default type of tickets for the approval of FAQ articles.';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} =
        'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define if the FAQ title should be concatenated to article subject.'} =
        'Define if the FAQ title should be concatenated to article subject.';
    $Self->{Translation}->{'Define which columns are shown in the linked FAQs widget (LinkObject::ViewMode = "complex"). Note: Only FAQ attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} =
        'Defined an overview module to show the small view of a FAQ journal.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} =
        'Defines an overview module to show the small view of a FAQ list.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} =
        'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} =
        'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} =
        'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} =
        'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} =
        'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} =
        'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} =
        'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} =
        'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} =
        'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} =
        'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} =
        'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} =
        'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.';
    $Self->{Translation}->{'Defines the default shown FAQ search attribute for FAQ search screen.'} =
        'Defines the default shown FAQ search attribute for FAQ search screen.';
    $Self->{Translation}->{'Defines the information to be inserted in a FAQ based Ticket. "Full FAQ" includes text, attachments and inline images.'} =
        'Defines the information to be inserted in a FAQ based Ticket. "Full FAQ" includes text, attachments and inline images.';
    $Self->{Translation}->{'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.'} =
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} =
        'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed.'} = 'Defines where the \'Insert FAQ\' link will be displayed.';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'Definition of FAQ item free text field.';
    $Self->{Translation}->{'Delete this FAQ'} = 'Delete this FAQ';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamic fields shown in the FAQ add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamic fields shown in the FAQ edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamic fields shown in the FAQ overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Dynamic fields shown in the FAQ overview screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamic fields shown in the FAQ print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamic fields shown in the FAQ print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamic fields shown in the FAQ print screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Dynamic fields shown in the FAQ search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Dynamic fields shown in the FAQ search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Dynamic fields shown in the FAQ search screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamic fields shown in the FAQ small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamic fields shown in the FAQ zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamic fields shown in the FAQ zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Dynamic fields shown in the FAQ zoom screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.';
    $Self->{Translation}->{'Edit this FAQ'} = 'Edit this FAQ';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = 'Enable multiple languages on FAQ module.';
    $Self->{Translation}->{'Enable the related article feature for the customer frontend.'} =
        '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = 'Enable voting mechanism on FAQ module.';
    $Self->{Translation}->{'Explorer'} = 'Explorer';
    $Self->{Translation}->{'FAQ AJAX Responder'} = 'FAQ AJAX Responder';
    $Self->{Translation}->{'FAQ AJAX Responder for Richtext.'} = 'FAQ AJAX Responder for Richtext';
    $Self->{Translation}->{'FAQ Area'} = 'FAQ Area';
    $Self->{Translation}->{'FAQ Area.'} = 'FAQ Area.';
    $Self->{Translation}->{'FAQ Delete.'} = 'FAQ Delete.';
    $Self->{Translation}->{'FAQ Edit.'} = 'FAQ Edit.';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = 'FAQ Journal Overview "Small" Limit';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = 'FAQ Overview "Small" Limit';
    $Self->{Translation}->{'FAQ Print.'} = 'FAQ Print.';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = 'FAQ limit per page for FAQ Journal Overview "Small"';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = 'FAQ limit per page for FAQ Overview "Small"';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = 'FAQ search backend router of the agent interface.';
    $Self->{Translation}->{'Field4'} = 'Field4';
    $Self->{Translation}->{'Field5'} = 'Field5';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'Frontend module registration for the public interface.';
    $Self->{Translation}->{'Full FAQ'} = 'Full FAQ';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'Group for the approval of FAQ articles.';
    $Self->{Translation}->{'History of this FAQ'} = 'History of this FAQ';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = 'Include internal fields on an FAQ based Ticket.';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = 'Include the name of each field in an FAQ based Ticket.';
    $Self->{Translation}->{'Interfaces where the quick search should be shown.'} = 'Interfaces where the quick search should be shown.';
    $Self->{Translation}->{'Journal'} = 'Journal';
    $Self->{Translation}->{'Language Management'} = 'Language Management';
    $Self->{Translation}->{'Limit for the search to build the keyword FAQ article list.'} = '';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'Link another object to this FAQ item';
    $Self->{Translation}->{'List of queue names for which the related article feature is enabled.'} =
        '';
    $Self->{Translation}->{'List of state types which can be used in the agent interface.'} =
        'List of state types which can be used in the agent interface.';
    $Self->{Translation}->{'List of state types which can be used in the customer interface.'} =
        'List of state types whcih can be used in the customer interface.';
    $Self->{Translation}->{'List of state types which can be used in the public interface.'} =
        'List of state types which can be used in the public interface.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} =
        'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} =
        'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} =
        'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} =
        'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} =
        'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} =
        'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} =
        'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the agent interface.'} =
        'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the agent interface.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the customer interface.'} =
        'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the customer interface.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the public interface.'} =
        'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the public interface.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the agent interface.'} =
        'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the agent interface.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the customer interface.'} =
        'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the customer interface.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the public interface.'} =
        'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the public interface.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ journal in the agent interface.'} =
        'Maximum size of the titles in a FAQ article to be shown in the FAQ journal in the agent interface.';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the customer interface.'} =
        '';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the public interface.'} =
        'Module to generate HTML OpenSearch profile for short FAQ search in the public interface.';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short FAQ search.'} =
        '';
    $Self->{Translation}->{'New FAQ Article'} = 'New FAQ Article';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'New FAQ articles need approval before htey get published.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} =
        'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} =
        'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} =
        'Number of FAQ articles to be displayed on each page of a search result in the customer interface.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} =
        'Number of FAQ articles to be displayed on each page of a search result in the public interface.';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'Number of shown items in last changes.';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'Number of shown items in last created.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'Number of shown items in the top 10 feature.';
    $Self->{Translation}->{'Output filter to add Java-script to CustomerTicketMessage screen.'} =
        '';
    $Self->{Translation}->{'Output limit for the related FAQ articles.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} =
        'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} =
        'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.';
    $Self->{Translation}->{'Print this FAQ'} = 'Print this FAQ';
    $Self->{Translation}->{'Public FAQ Print.'} = 'Public FAQ Print.';
    $Self->{Translation}->{'Public FAQ Zoom.'} = 'Public FAQ Zoom.';
    $Self->{Translation}->{'Public FAQ search.'} = 'Public FAQ search.';
    $Self->{Translation}->{'Public FAQ.'} = 'Public FAQ.';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'Queue for the approval of FAQ articles.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = 'Rates for voting. Key must be in percent.';
    $Self->{Translation}->{'S'} = 'S';
    $Self->{Translation}->{'Search FAQ'} = 'Search FAQ';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        'Set the default height (in pixels) of inline HTML fields in AgentFAQZoom.';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        'Set the default height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        'Set the maximum height (in pixels) of inline HTML fields in AgentFAQZoom.';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        'Set the maximum height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" / "Insert Full FAQ & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        'Show "Insert FAQ Text & Link" / "Insert Full FAQ & Link" Button in AgentFAQZoomSmall for public FAQ Articles.';
    $Self->{Translation}->{'Show "Insert FAQ Text" / "Insert Full FAQ" Button in AgentFAQZoomSmall.'} =
        'Show "Insert FAQ Text" / "Insert Full FAQ" Button in AgentFAQZoomSmall.';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'Show FAQ Article with HTML.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'Show FAQ path yes/no.';
    $Self->{Translation}->{'Show invalid items in the FAQ Explorer result of the agent interface.'} =
        '';
    $Self->{Translation}->{'Show items of subcategories.'} = 'Show items of subcategories.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'Show last change items in defined interfaces.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'Show last created items in defined interfaces.';
    $Self->{Translation}->{'Show the stars for the articles with a rating equal or greater like the defined value (set value \'0\' to deactive the output).'} =
        '';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'Show top 10 items in defined interfaces.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'Show voting in defined interfaces.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} =
        'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} =
        'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} =
        'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} =
        'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} =
        'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} =
        'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.';
    $Self->{Translation}->{'Solution'} = 'Solution';
    $Self->{Translation}->{'Symptom'} = 'Symptom';
    $Self->{Translation}->{'Text Only'} = 'Text Only';
    $Self->{Translation}->{'The default languages for the related FAQ articles.'} = '';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} =
        'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} =
        'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} =
        'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} =
        'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'Ticket body for approval of FAQ article.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'Ticket subject for approval of FAQ article.';
    $Self->{Translation}->{'Toolbar Item for a shortcut.'} = 'Toolbar Item for a shortcut.';
    $Self->{Translation}->{'external (customer)'} = 'external (customer)';
    $Self->{Translation}->{'internal (agent)'} = 'internal (agent)';
    $Self->{Translation}->{'public (public)'} = 'public (public)';

}

1;
