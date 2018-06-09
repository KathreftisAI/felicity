# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sw_FAQ;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'Ongeza makala ya maswali';
    $Self->{Translation}->{'Keywords'} = 'Maneno makuu';
    $Self->{Translation}->{'A category is required.'} = 'Sehemu inahitajika';
    $Self->{Translation}->{'Approval'} = 'Idhini';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'Sehemu ya menejimenti ya maswali';
    $Self->{Translation}->{'Add category'} = 'Ongeza sehemu';
    $Self->{Translation}->{'Delete Category'} = 'Futa sehemu';
    $Self->{Translation}->{'Ok'} = 'Sawa';
    $Self->{Translation}->{'Add Category'} = 'Ongeza sehemu';
    $Self->{Translation}->{'Edit Category'} = 'Hariri sehemu';
    $Self->{Translation}->{'Subcategory of'} = 'Kijisehemu cha';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'Tafadhali chagua japo';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'Makundi ya wakala yenye ruhusa kwa hii makala katika kategori hii.';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Itaonyeshwa kama tamko kwenye Explorer.';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'Je unataka kufuta hii sehemu?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} =
        'Huwezi kufuta sehemu hii.Imetumika na makala ya maswali si chini ya moja na/au ipo ndani ya kategori nyingine si chini ya moja. ';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'Hii sehemu inatumika katika makala ya maswali ifuatayo.';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'Hii ni sehemu mama ya vijisehemu vifuatavyo ';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Je unataka Kufuta hii makala ya maswali?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'Maswali';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'Kichunguzaji maswali';
    $Self->{Translation}->{'Quick Search'} = 'Tafuta haraka';
    $Self->{Translation}->{'Wildcards are allowed.'} = 'Wildcard haziruhusiwi';
    $Self->{Translation}->{'Advanced Search'} = 'Tafuta zaidi';
    $Self->{Translation}->{'Subcategories'} = 'Kijikisehemu';
    $Self->{Translation}->{'FAQ Articles'} = 'Makala ya Maswali';
    $Self->{Translation}->{'No subcategories found.'} = 'Hakuna vijisehemu vilivyopatikana.';

    # Template: AgentFAQHistory
    $Self->{Translation}->{'History of'} = 'Historia ya';

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'Data za jarida la maswali hazijapatikana.';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'Menejimenti ya lugha ya maswali';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languages.'} =
        '';
    $Self->{Translation}->{'Add language'} = 'Ongeza lugha';
    $Self->{Translation}->{'Delete Language %s'} = 'Futa Lugha';
    $Self->{Translation}->{'Add Language'} = 'Ongeza Lugha';
    $Self->{Translation}->{'Edit Language'} = 'Hariri Lugha';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'Je unataka kufuta hii lugha?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} =
        'Huwezi kufuta lugha hii. Imetumika kwenye makala ya maswali zaidi ya moja.';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'Hii lugha imetumika katika makala ya(za) maswali ifuatayo.';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Mipangilio ya muktadha';
    $Self->{Translation}->{'FAQ articles per page'} = 'Makala ya maswali kwa ukurasa';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'Hakuna data za maswali';

    # Template: AgentFAQSearch
    $Self->{Translation}->{'Keyword'} = 'Neno kuu';
    $Self->{Translation}->{'Vote (e. g. Equals 10 or GreaterThan 60)'} = 'Kura (mfano. sawa na 10 au Zaidi ya 60)';
    $Self->{Translation}->{'Rate (e. g. Equals 25% or GreaterThan 75%)'} = 'Kiwango (mfano Sawa na 25% au Zaidi ya 75%)';
    $Self->{Translation}->{'Approved'} = 'Kuidhinisha';
    $Self->{Translation}->{'Last changed by'} = 'Mara ya mwisho imebadilishwa na';
    $Self->{Translation}->{'FAQ Article Create Time (before/after)'} = 'Muda wa kutengeneza makala ya maswali (kabla/baada)';
    $Self->{Translation}->{'FAQ Article Create Time (between)'} = 'Muda wa kutengeneza Makala ya maswali (katikati)';
    $Self->{Translation}->{'FAQ Article Change Time (before/after)'} = 'Muda wa kubadilisha makala ya maswali (kabla/baada)';
    $Self->{Translation}->{'FAQ Article Change Time (between)'} = 'Muda wa kubadilisha makala ya maswali (katikati)';

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'Nakala nzima ya maswali yanayo ulizwa mara kwa mara.';

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'Tafuta maswali';
    $Self->{Translation}->{'Profile Selection'} = 'Chaguo la maelezo mafupi';
    $Self->{Translation}->{'Vote'} = 'Kura';
    $Self->{Translation}->{'No vote settings'} = 'Hakuna Mipangilio ya kura';
    $Self->{Translation}->{'Specific votes'} = 'Kura maalumu';
    $Self->{Translation}->{'e. g. Equals 10 or GreaterThan 60'} = 'Mafano Sawa na 10 au Zaidi ya 60';
    $Self->{Translation}->{'Rate'} = 'Kiwango';
    $Self->{Translation}->{'No rate settings'} = 'Hakuna mipangilio ya kiwango';
    $Self->{Translation}->{'Specific rate'} = 'Kiwango maalum';
    $Self->{Translation}->{'e. g. Equals 25% or GreaterThan 75%'} = 'Mfano Sawa na 25% au Zaidi ya 75%';
    $Self->{Translation}->{'FAQ Article Create Time'} = 'Muda wa kutengeneza makala ya maswali';
    $Self->{Translation}->{'FAQ Article Change Time'} = 'Muda wa kubadili makala ya maswali';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'Habari za Maswali';
    $Self->{Translation}->{'Rating'} = 'Thaminisha';
    $Self->{Translation}->{'out of 5'} = 'Kati ya 5';
    $Self->{Translation}->{'Votes'} = 'Kura';
    $Self->{Translation}->{'No votes found!'} = 'Hakuna Kura zilizopatika';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'Hakuna kura. Kuwa wa kwanza kuthaminisha makala hii ya maswali.';
    $Self->{Translation}->{'Download Attachment'} = 'Download Kiambatanishwa';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        '';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} =
        'Ni kwa kiasi gan makala hii imesaidia? Tafadhali tusaidie kuthaminisha kuleta mabadiliko katika database ya Maswali. Asante';
    $Self->{Translation}->{'not helpful'} = 'Haina Msaada';
    $Self->{Translation}->{'very helpful'} = 'Ina msaada sana';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Add FAQ title to article subject'} = 'Ongeza kichwa cha habari cha maswali katika somo ya makala';
    $Self->{Translation}->{'Insert FAQ Text'} = 'Ingiza matini ya maswali';
    $Self->{Translation}->{'Insert Full FAQ'} = 'Ingiza maswali yote';
    $Self->{Translation}->{'Insert FAQ Link'} = 'Ingiza link ya maswali';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'Ingiza nakala ya maswali na Link';
    $Self->{Translation}->{'Insert Full FAQ & Link'} = 'Ingiza maswali yote na link';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'Hakuna makala ya maswali iliyopatikana';

    # Template: CustomerFAQRelatedArticles
    $Self->{Translation}->{'This might be helpful'} = '';
    $Self->{Translation}->{'Found no helpful resources for the subject and text.'} = '';
    $Self->{Translation}->{'Type a subject or text to get a list of helpful resources.'} = '';

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Tafuta nakala kamili katika maswali yanayooulizwa mara kwa mara (mfano "John" au "Will")';
    $Self->{Translation}->{'Vote restrictions'} = 'Vizuizi vya kura';
    $Self->{Translation}->{'Only FAQ articles with votes...'} = 'Makala ya maswali yenye kura ';
    $Self->{Translation}->{'Rate restrictions'} = 'Vizuizi vya thamani';
    $Self->{Translation}->{'Only FAQ articles with rate...'} = 'Makala ya maswali yaliyothaminishwa';
    $Self->{Translation}->{'Only FAQ articles created'} = 'Makala ya maswali yaliyotengenezwa tu';
    $Self->{Translation}->{'Only FAQ articles created between'} = 'Makala ya maswali yalitengenezwa kati ya';
    $Self->{Translation}->{'Search-Profile as Template?'} = 'Tafuta maelezo mafupi kama kielezo';

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Article Number'} = 'Namba ya makala';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Tafuta Makala kwa neno kuu';

    # Template: PublicFAQSearchOpenSearchDescriptionFAQNumber
    $Self->{Translation}->{'Public'} = 'Umma';

    # Template: PublicFAQSearchResultShort
    $Self->{Translation}->{'Back to FAQ Explorer'} = 'Back to FAQ mchunguzi';

    # Perl Module: Kernel/Modules/AgentFAQAdd.pm
    $Self->{Translation}->{'You need rw permission!'} = '';
    $Self->{Translation}->{'No categories found where user has read/write permissions!'} = '';
    $Self->{Translation}->{'No default language found and can\'t create a new one.'} = '';

    # Perl Module: Kernel/Modules/AgentFAQCategory.pm
    $Self->{Translation}->{'Need CategoryID!'} = '';
    $Self->{Translation}->{'A category should have a name!'} = 'sehemu iwe na jina';
    $Self->{Translation}->{'This category already exists'} = 'Hii sehemu tayari ipo';
    $Self->{Translation}->{'FAQ category updated!'} = 'Sehemu ya maswali iliyobadilishwa!';
    $Self->{Translation}->{'This category already exists!'} = '';
    $Self->{Translation}->{'FAQ category added!'} = 'Sehemu ya maswali iliyoongezwa!';
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
    $Self->{Translation}->{'FAQ Journal'} = 'Jarida la maswali';
    $Self->{Translation}->{'Need config option FAQ::Frontend::Overview'} = '';
    $Self->{Translation}->{'Config option FAQ::Frontend::Overview needs to be a HASH ref!'} =
        '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQLanguage.pm
    $Self->{Translation}->{'No LanguageID is given!'} = '';
    $Self->{Translation}->{'The name is required!'} = 'Jina linahitajika!';
    $Self->{Translation}->{'This language already exists!'} = 'Lugha ipo tayari!';
    $Self->{Translation}->{'FAQ language updated!'} = 'Lugha ya maswali imebadilishwa!';
    $Self->{Translation}->{'FAQ language added!'} = 'Lugha ya maswali  imeongezwa!';
    $Self->{Translation}->{'Was not able to delete the language %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQPrint.pm
    $Self->{Translation}->{'Last update'} = 'Mabadiliko ya mwisho';
    $Self->{Translation}->{'FAQ Dynamic Fields'} = '';

    # Perl Module: Kernel/Modules/AgentFAQRichText.pm
    $Self->{Translation}->{'No %s is given!'} = '';
    $Self->{Translation}->{'Can\'t load LanguageObject!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQSearch.pm
    $Self->{Translation}->{'No Result!'} = '';
    $Self->{Translation}->{'FAQ Number'} = 'idadi ya maswali';
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
    $Self->{Translation}->{'Thanks for your vote!'} = 'Asante kwa Kura yako!';
    $Self->{Translation}->{'You have already voted!'} = 'Umeshapiga kura tayari!';
    $Self->{Translation}->{'No rate selected!'} = 'Hakuna chaguo la kiwango';
    $Self->{Translation}->{'The voting mechanism is not enabled!'} = '';
    $Self->{Translation}->{'The vote rate is not defined!'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQPrint.pm
    $Self->{Translation}->{'FAQ Article Print'} = 'Chapisha makala ya maswali';

    # Perl Module: Kernel/Modules/CustomerFAQSearch.pm
    $Self->{Translation}->{'Created between'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQZoom.pm
    $Self->{Translation}->{'Need ItemID!'} = '';

    # Perl Module: Kernel/Modules/PublicFAQExplorer.pm
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'Makala ya maswali (Mpya iliyotengenezwa)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'Makala ya maswali (Iliyobadilishwa hivi karibuni)';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'Makala ya maswali (10 bora)';

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
    $Self->{Translation}->{'This article is empty!'} = '';
    $Self->{Translation}->{'Latest created FAQ articles'} = 'Makala mpya ya maswali';
    $Self->{Translation}->{'Latest updated FAQ articles'} = 'Marekebisho mapya ya makala ya maswali';
    $Self->{Translation}->{'Top 10 FAQ articles'} = 'Makala 10 bora ya Maswali';

    # Perl Module: Kernel/Output/HTML/LinkObject/FAQ.pm
    $Self->{Translation}->{'Content Type'} = '';

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} =
        'Kichujio cha matokeo ya HTML ili kuongeza viungo kwa tungo zilizo fafanuliwa. Sura ya elemnti hii inaruhusu maingizo ya aina mbili. Kwanza jinala sura (mf. faq.png). Kwa kesi hii sura ya njia ya OTRS itatumika. Njia ya pili ni kuingiza kiungo cha hiyo sura.';
    $Self->{Translation}->{'Add FAQ article'} = '';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'Rangi ya CSS kwa matokeo ya kura';
    $Self->{Translation}->{'Cache Time To Leave for FAQ items.'} = 'Muda wa maswali yaliyyoulizwa mara myingi kufutika kutoka kwenye kumbukumbu';
    $Self->{Translation}->{'Category Management'} = 'Usimamizi wa kategori';
    $Self->{Translation}->{'Customer FAQ Print.'} = '';
    $Self->{Translation}->{'Customer FAQ Zoom.'} = '';
    $Self->{Translation}->{'Customer FAQ search.'} = '';
    $Self->{Translation}->{'Customer FAQ.'} = '';
    $Self->{Translation}->{'CustomerFAQRelatedArticles.'} = '';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'Mwongo wa matokeo ya kura';
    $Self->{Translation}->{'Default category name.'} = 'Jina la chaguo-msingi la kategori';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = 'Chaguo-msingi la lugha ya makala ya maswali yaliyoulizwa mara nyingi katika lugha moja.';
    $Self->{Translation}->{'Default maximum size of the titles in a FAQ article to be shown.'} =
        'Ukubwa wa upeo wa juu chaguo msingi wa vichwa katika makala ya maswali yanayoulizwa mara kwa mara kuonyeshwa.';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} =
        'Kipaumbele cha chaguo-msingi cha tiketi kwa idhini ya makala ya maswali';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Hali ya chaguo-msingi ya ingizo la maswali yaliyoulizwa mara kwa mara.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'Hali ya chaguo-msingi kwa tiketi za idhini ya makala ya maswali yaliyoulizwa mara kwa mara.';
    $Self->{Translation}->{'Default type of tickets for the approval of FAQ articles.'} = 'Hali ya chaguo-msingi kwa tiketi za makala ya maswali yaliyoulizwa mara kwa mara.';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} =
        'Thamani ya chaguo-msingi kwa patameta amilifu kwa ';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define if the FAQ title should be concatenated to article subject.'} =
        'Eleza kama kichwa cha habari cha maswali yaliyoulizwa maranyingi kiunganishwe na somo la makala.';
    $Self->{Translation}->{'Define which columns are shown in the linked FAQs widget (LinkObject::ViewMode = "complex"). Note: Only FAQ attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} =
        'Inaeleza mapitio ya moduli kuonyesha  muonekano mdogo wa jarida la maswali yaliyoulizwa mara kwa mara.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} =
        'Inaeleza mapitio ya moduli kuonyesha muonekano mdogo wa orodha ya maswali yaliyoulizwa mara kwa mara.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} =
        'Inafafanua chaguo-msingi kiumbi cha maswali yanayoulizwa mara kwa mara kwa ajili ya upangaji wa maswali yanayoulizwa mara kwa mara katika maswali yanayoulizwa mara kwa mara tafuti ya kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} =
        'Inafafanua chaguo-msingi kiumbi cha maswali yanayoulizwa mara kwa mara kwa ajili ya upangaji wa maswali yanayoulizwa mara kwa mara tafuti ya kiolesura cha mteja.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} =
        'Inafafanua chaguo-msingi kiumbi cha maswali yanayoulizwa mara kwa mara kwa ajili ya upangaji wa maswali yanayoulizwa mara kwa mara tafuti ya kiolesura cha umma.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} =
        'Inafafanua chaguo-msingi kiumbi cha maswali yanayoulizwa mara kwa mara kwa ajili ya upangaji wa maswali yanayoulizwa mara kwa mara katika kichunguzi cha maswali yanayoulizwa mara kwa mara ya kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} =
        'Inafafanua chaguo-msingi kiumbi cha maswali yanayoulizwa mara kwa mara kwa ajili ya upangaji wa maswali yanayoulizwa mara kwa mara katika kichunguzi cha maswali yanayoulizwa mara kwa mara ya kiolesura cha mteja.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} =
        'Inafafanua chaguo-msingi kiumbi cha maswali yanayoulizwa mara kwa mara kwa ajili ya upangaji wa maswali yanayoulizwa mara kwa mara katika kichunguzi cha maswali yanayoulizwa mara kwa mara ya kiolesura cha umma.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} =
        'Fafanua chaguo-msingi wa mpangilio wa maswali yanayoulizwa mara kwa mara katika matokeo ya kichunguzi cha maswali yanayoulizwa mara kwa mara ya kiolesura cha wakala. Juu: Kongwe juu. Chini: ya sasahivi juu';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} =
        'Fafanua chaguo-msingi wa mpangilio wa maswali yanayoulizwa mara kwa mara katika matokeo ya kichunguzi cha maswali yanayoulizwa mara kwa mara ya kiolesura cha mteja. Juu: Kongwe juu. Chini: ya sasahivi juu';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} =
        'Fafanua chaguo-msingi wa mpangilio wa maswali yanayoulizwa mara kwa mara katika matokeo ya kichunguzi cha maswali yanayoulizwa mara kwa mara ya kiolesura cha umma. Juu: Kongwe juu. Chini: ya sasahivi juu';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} =
        'Fafanua chaguo-msingi wa mpangilio wa maswali yanayoulizwa mara kwa mara katika matokeo ya kutafuta katika kiolesura cha wakala. Juu: Kongwe juu. Chini: ya sasahivi juu';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} =
        'Fafanua chaguo-msingi wa mpangilio wa maswali yanayoulizwa mara kwa mara katika matokeo ya kutafuta katika kiolesura cha mteja. Juu: Kongwe juu. Chini: ya sasahivi juu';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} =
        'Fafanua chaguo-msingi wa maswali yanayoulizwa mara kwa mara ya majibu ya utafutaji katika intafase ya umma. Juu: Kongwe zaidi juu. Chini: Ya sasa hivi juu';
    $Self->{Translation}->{'Defines the default shown FAQ search attribute for FAQ search screen.'} =
        'Inafafana sifa ya utafutaji wa maswali yanayoulizwa mara kwa mara kwa ajili ya skrini ya utafutaji maswali yanayoulizwa mara kwa mara.';
    $Self->{Translation}->{'Defines the information to be inserted in a FAQ based Ticket. "Full FAQ" includes text, attachments and inline images.'} =
        'Fafanua taarifa itakayoingizwa kwenye maswali yanayoulizwa mara kwa mara kwa misingi ya tiketi. "Maswali yaliyojaa nayayoulizwa mara kwa mara" yanayojumuisha nakala, viambatanishi na taswaira ya mstari wa ndani.';
    $Self->{Translation}->{'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} =
        'Fafanua safu zilizoonyeshwa katika kitafuta maswali. Hili chaguo halina madhara katika nafasi kwenye safu.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} =
        'Fafanua safu zilizoonyeshwa katika jarida la maswali. Hili chaguo halina madhara katika nafasi kwenye safu.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} =
        'Fafanua safu zilizoonyeshwa katika makala ya maswali. Hili chaguo halina madhara katika nafasi kwenye safu.';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed.'} = '';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'Ufafanuzi wa uga ya matini huru ya kipengele cha maswali yanayoulizwa mara kwa mara.';
    $Self->{Translation}->{'Delete this FAQ'} = 'Futa haya maswali yaliyoulizwa mara kwa mara';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ya kuongeza maswali yanayoulizwa mara kwa mara ya kiolesura cha wakala. Mipango inayowezekana: 0= Lemazwa, 1 = wezesha, 2 = wezesha and takiwa.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ya kuhariri ya maswali yanayoulizwa mara kwa mara ya kiolesura cha wakala.Mipango inayowezekana: 0= Lemazwa, 1 = wezesha, 2 = wezesha and takiwa.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ya mapitio ya maswali yanayoulizwa mara kwa mara ya kiolesura cha wakala. Mipango inayowezekana: 0= Lemazwa, 1 = wezesha, 2 = wezesha and takiwa.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ya mapitio ya maswali yanayoulizwa mara kwa mara ya kiolesura cha umma. Mipango inayowezekana: 0= Lemazwa, 1 = wezesha, 2 = wezesha and takiwa.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ya kuchapisha ya maswali yanayoulizwa mara kwa mara ya kiolesura cha wakala. Mipango inayowezekana: 0= Lemazwa, 1 = wezesha.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ya mapitio ya maswali yanayoulizwa mara kwa mara ya kiolesura cha mteja. Mipango inayowezekana: 0= Lemazwa, 1 = wezesha.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ya mapitio ya maswali yanayoulizwa mara kwa mara ya kiolesura cha umma. Mipango inayowezekana: 0= Lemazwa, 1 = wezesha.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ya kutafuta  maswali yanayoulizwa mara kwa mara ya kiolesura cha wakala. Mipango inayowezekana: 0= Lemazwa, 1 = wezesha, 2 = wezesha and ilivyoonyeshwa na chaguo-msingi.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ya kutafuta  maswali yanayoulizwa mara kwa mara ya kiolesura cha mteja. Mipango inayowezekana: 0= Lemazwa, 1 = wezesha, 2 = wezesha and ilivyoonyeshwa na chaguo-msingi.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ya kutafuta  maswali yanayoulizwa mara kwa mara ya kiolesura cha umma. Mipango inayowezekana: 0= Lemazwa, 1 = wezesha, 2 = wezesha and ilivyoonyeshwa na chaguo-msingi.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ya maumbizo madogo ya mapitio ya maswali yanayoulizwa mara kwa mara ya kiolesura cha wakala. 0= Lemazwa, 1 = wezesha.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ilikuzwa ya maswali yanayoulizwa mara kwa mara ya kiolesura cha wakala. 0= Lemazwa, 1 = wezesha.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ilikuzwa ya maswali yanayoulizwa mara kwa mara ya kiolesura cha mteja. 0= Lemazwa, 1 = wezesha.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Uga wenye uwezo imeonyeshwa katika skrini ilikuzwa ya maswali yanayoulizwa mara kwa mara ya kiolesura cha umma. 0= Lemazwa, 1 = wezesha.';
    $Self->{Translation}->{'Edit this FAQ'} = 'Hariri makala hii';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = 'Wezesha Lugha nyingi nyingi katika maswali haya.';
    $Self->{Translation}->{'Enable the related article feature for the customer frontend.'} =
        '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = 'Wezesha ';
    $Self->{Translation}->{'Explorer'} = 'Kichunguzaji';
    $Self->{Translation}->{'FAQ AJAX Responder'} = '';
    $Self->{Translation}->{'FAQ AJAX Responder for Richtext.'} = '';
    $Self->{Translation}->{'FAQ Area'} = '';
    $Self->{Translation}->{'FAQ Area.'} = '';
    $Self->{Translation}->{'FAQ Delete.'} = '';
    $Self->{Translation}->{'FAQ Edit.'} = '';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = ' Kikomo "kidogo" cha mapitio ya jarida la maswali yaliyoulizwa mara kwa mara';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = 'Kikomo "kidogo" cha mapitio ya maswali yaliyoulizwa mara kwa mara.';
    $Self->{Translation}->{'FAQ Print.'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = 'Upeo wa maswali yanayoulizwa mara kwa mara kwa ukurasa kwa mapitio ya jarida ya maswali yanayoulizwa mara kwa mara. \'\'Ndogo\'\'.';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = 'Upeo wa maswali yanayoulizwa mara kwa mara kwa ukurasa kwa mapitio  ya maswali yanayoulizwa mara kwa mara. \'\'Ndogo\'\'.';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = 'Maswali yanayoulizwa mara kwa mara tafuta backend ruta ya kiolesura cha wakala.';
    $Self->{Translation}->{'Field4'} = 'Sehemu4';
    $Self->{Translation}->{'Field5'} = 'Sehemu5';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'Moduli ya usajili ya frontend kwa ajili ya kiolesura cha umma.';
    $Self->{Translation}->{'Full FAQ'} = '';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'Makundi ya idhini kwa maswali yaliyoulizwa mara kwa mara.';
    $Self->{Translation}->{'History of this FAQ'} = 'Historia ya maswali haya yaliyoulizwa mara kwa mara.';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = 'Jumuisha sehemu za ndani za maswali yaliyoulizwa mara kwa mara kulingana na tiketi.';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = 'Jumuisha jina la kila sehemu ya maswali yaliyoulizwa mara nyingi kulingana na tiketi.';
    $Self->{Translation}->{'Interfaces where the quick search should be shown.'} = 'Kiolesura ambacho utafutaji wa haraka unatakiwa kuonyeshwa.';
    $Self->{Translation}->{'Journal'} = 'Jarida';
    $Self->{Translation}->{'Language Management'} = 'Menejimenti ya lugha';
    $Self->{Translation}->{'Limit for the search to build the keyword FAQ article list.'} = '';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'Unganishga kitu kingine na kipengele hiki cha  maswali yaliyoulizwa mara kwa mara';
    $Self->{Translation}->{'List of queue names for which the related article feature is enabled.'} =
        '';
    $Self->{Translation}->{'List of state types which can be used in the agent interface.'} =
        'Orodha ya aina ya hali ambazo zinaweza kutumika katika kiolesura cha wakala.';
    $Self->{Translation}->{'List of state types which can be used in the customer interface.'} =
        'Orodha ya aina ya hali ambazo zinaweza kutumika katika kiolesura cha mteja.';
    $Self->{Translation}->{'List of state types which can be used in the public interface.'} =
        'Orodha ya aina ya hali ambazo zinaweza kutumika katika kiolesura cha umma.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} =
        'Namba ya upeo wa juu ya maswali yanayoulizwa mara kwa mara yanayatayoonyeshwa katika majibu ya kichunguzi cha maswali yanayoulizwa mara kwa mara ya kiolesura cha wakala.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} =
        'Namba ya upeo wa juu ya maswali yanayoulizwa mara kwa mara yanayatayoonyeshwa katika majibu ya kichunguzi cha maswali yanayoulizwa mara kwa mara ya kiolesura cha mteja.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} =
        'Namba ya upeo wa juu ya maswali yanayoulizwa mara kwa mara yanayatayoonyeshwa katika majibu ya kichunguzi cha maswali yanayoulizwa mara kwa mara ya kiolesura cha umma.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} =
        'Namba ya upeo wa juu ya maswali yanayoulizwa mara kwa mara yanayatayoonyeshwa katika  makala ya maswali yanayoulizwa mara kwa mara katika kiolesura cha wakala.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} =
        'Namba ya upeo wa juu ya maswali yanayoulizwa mara kwa mara yanayatayoonyeshwa katika majibu ya uchunguzi  ya kiolesura cha wakala.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} =
        'Namba ya upeo wa juu ya maswali yanayoulizwa mara kwa mara yanayatayoonyeshwa katika majibu ya uchunguzi  ya kiolesura cha mteja.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} =
        'Namba ya upeo wa juu ya maswali yanayoulizwa mara kwa mara yanayatayoonyeshwa katika majibu ya uchunguzi  ya kiolesura cha umma.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the agent interface.'} =
        'Upeo wa juu wa ukubwa wa vichwa katika makala ya maswali inayoonyeshwa katika kivinjari cha maswali yanayoulizwa mara kwa mara katika kiolesura cha wakala.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the customer interface.'} =
        'Upeo wa juu wa ukubwa wa vichwa katika makala ya maswali inayoonyeshwa katika kivinjari cha maswali yanayoulizwa mara kwa mara katika kiolesura cha mteja.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the public interface.'} =
        'Upeo wa juu wa ukubwa wa vichwa katika makala ya maswali inayoonyeshwa katika kivinjari cha maswali yanayoulizwa mara kwa mara katika kiolesura cha umma.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the agent interface.'} =
        'Upeo wa juu wa ukubwa wa vichwa katika makala ya maswali inayoonyeshwa katika utafutaji wa maswali yanayoulizwa mara kwa mara katika kiolesura cha wakala.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the customer interface.'} =
        'Upeo wa juu wa ukubwa wa vichwa katika makala ya maswali inayoonyeshwa katika utafutaji wa maswali yanayoulizwa mara kwa mara  katika kiolesura cha mteja.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the public interface.'} =
        'Upeo wa juu wa ukubwa wa vichwa katika makala ya maswali inayoonyeshwa katika utafutaji wa maswali yanayoulizwa mara kwa mara katika kiolesura cha umma.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ journal in the agent interface.'} =
        'Upeo wa juu wa ukubwa wa vichwa katika makala ya maswali inayoonyeshwa katika jarida la maswali yanayoulizwa mara kwa mara katika kiolesura cha wakala.';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the customer interface.'} =
        '';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the public interface.'} =
        'Moduli ya kuzalisha maelezo mafupi ya utafutaji wa wazi wa HTML kwa utafutaji mfupi wa maswali yanayoulizwa mara kwa mara katika kiolesura cha umma. ';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short FAQ search.'} =
        '';
    $Self->{Translation}->{'New FAQ Article'} = 'Makala mpya ya maswali';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'Makala mpya ya maswali yanahitaji idhinisho kabla hayatolewa.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} =
        'Namba ya makala ya maswali yanayoulizwa mara kwa mara yatakayoonyeshwa katika kitafuta maswali yanayoulizwa mara kwa mara ya kiolesura cha mteja.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} =
        'Namba ya makala ya maswali yanayoulizwa mara kwa mara yatakayoonyeshwa katika kitafuta maswali yanayoulizwa mara kwa mara ya kiolesura cha umma.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} =
        'Namba ya makala ya maswali yanayoulizwa mara kwa mara yatakayoonyeshwa katika kila ukurasa wa matokeo ya utafutaji ya kiolesura cha mteja.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} =
        'Namba ya makala ya maswali yanayoulizwa mara kwa mara yatakayoonyeshwa katika kila ukurasa wa matokeo ya utafutaji ya kiolesura cha umma.';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'Namba ya vitu vilivoonyweshwa katika mabadiliko ya mwisho.';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'Namba ya vitu vilivotengenezwa mwishoni.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'Namba ya vitu vilivoonyweshwa katika vipengele 10 bora.';
    $Self->{Translation}->{'Output filter to add Java-script to CustomerTicketMessage screen.'} =
        '';
    $Self->{Translation}->{'Output limit for the related FAQ articles.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} =
        'Parameta za kurasa (ambazo vipengee vya maswali yanayoulizwa mara kwa mara zimeonyeshwa) za mapitio madogo ya jarida la maswali yanayoulizwa mara kwa mara.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} =
        'Parameta za kurasa (ambazo vipengee vya maswali yanayoulizwa mara kwa mara zimeonyeshwa) za mapitio madogo ya  maswali yanayoulizwa mara kwa mara.';
    $Self->{Translation}->{'Print this FAQ'} = 'Chapisha maswali haya.';
    $Self->{Translation}->{'Public FAQ Print.'} = '';
    $Self->{Translation}->{'Public FAQ Zoom.'} = '';
    $Self->{Translation}->{'Public FAQ search.'} = '';
    $Self->{Translation}->{'Public FAQ.'} = '';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'Foleni ya idhini ya makala ya maswali yanayoulizwa mara akwa mara.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = 'Thaminisho la kura. Funguo lazima iwe kwenye asilimia.';
    $Self->{Translation}->{'S'} = '';
    $Self->{Translation}->{'Search FAQ'} = 'Tafuta maswali';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        'Seti urefu wa chaguo-msingi (katika pikseli) ya ndani ya mstari wa ugo wa HTML katika ukuzaji wa maswali yanayoulizwa mara kwa mara ya wakala.';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        'Seti urefu wa chaguo-msingi (katika pikseli) ya ndani ya mstari wa ugo wa HTML katika ukuzaji wa maswali yanayoulizwa mara kwa mara ya mteja.(na ukuzaji wa maswali yanayoulizwa mara kwa maraya umma )';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        'Seti upeo wa juu wa urefu (katika pikseli) ya ndani ya mstari wa ugo wa HTML katika ukuzaji wa maswali yanayoulizwa mara kwa mara ya wakala.';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        'Seti upeo wa juu wa urefu (katika pikseli) ya ndani ya mstari wa ugo wa HTML katika ukuzaji wa maswali yanayoulizwa mara kwa mara ya mteja.(and ukuzaji wa maswali yanayoulizwa mara kwa mara ya umma).';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        'Inaonyesha kitufe cha \'\' Ingiza kiunganishi cha maswali yanayoulizwa mara kwa mara\'\' katika wakala fifiza wa maswali yanayoulizwa mara kwa mara kwa makala ya maswali yanayoulizwa mara kwa mara ya umma.';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" / "Insert Full FAQ & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        'Inaonyesha kitufe cha \'\'Ingiza matini ya maswali yanayoulizwa mara kwa mara & kiunganishi\'\' / \'\'ingiza mawali yanayoulizwa mara kwa mara yote &kiunganishi\'\' katika wakala fifiza wa maswali yanayoulizwa mara kwa mara kwa makala ya maswali yanayoulizwa mara kwa mara ya umma.';
    $Self->{Translation}->{'Show "Insert FAQ Text" / "Insert Full FAQ" Button in AgentFAQZoomSmall.'} =
        'Inaonyesha kitufe cha \'\' Ingiza matini ya maswali yanayoulizwa mara kwa mara\'\' / \'\'Ingiza maswali yanayoulizwa mara kwa mara yote\'\'  katika wakala  fifiza wa maswali yanayoulizwa mara kwa mara ';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'Onyesha makala ya maswali na HTML';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'Onyesha njia ya maswali ndio/hapana.';
    $Self->{Translation}->{'Show invalid items in the FAQ Explorer result of the agent interface.'} =
        '';
    $Self->{Translation}->{'Show items of subcategories.'} = 'Inaonyesha vipengele vya kategori.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'Inaonyesha vipengele vilivyobadilishwa katika kiolesura kilichofafanuliwa.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'Inaonyesha vipengele vilivyotengenezwa mwishoni katika kiolesura  kilichofafanuliwa.';
    $Self->{Translation}->{'Show the stars for the articles with a rating equal or greater like the defined value (set value \'0\' to deactive the output).'} =
        '';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'Inaonyesha vipengele  10  bora katika kiolesura kilichofafanuliwa.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'Inaonyesha kupiga kura katika kiolesura kilichofafanuliwa.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} =
        'Inaonyesha kiunganishi katika orodha ambacho kinaruhusu kuunganishwa kwa maswali yanayoulizwa mara kwa mara na kipengele kingine katika mandhari kuzwa ya hayo maswali yanayoulizwa mara kwa mara ya wakala wa kiolesura.';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} =
        'Inaonyesha kiunganishi katika orodha amabcho kinaruhusu kufuta maswali yanayoulizwa mara kwa mara katika mandhani kuzwa katika wakala wa kiolesura.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} =
        'Inaonyesha kiunganishi katika orodha kufikia historia ya maswali yanayoulizwa mara kwa mara katika mandhari kuzwa ya wakala wa kiolesura.';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} =
        'Inaonyesha kuinganishi katika orodha kuhariri katika mandhari kuzwa ya maswali yanayoulizwa mara kwa mara ya wakala wa kiolesura.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} =
        'Inaonyesha kiunganishi katika orodha cha kurudi nyuma katika mandhari kuzwa ya maswali yanayoulizwa mara kwa mara ya wakala wa kiolesura.';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} =
        'Inaonyesha kiunganishi katika orodha kuchapisha maswali yanayoulizwa mara kwa mara katika mandhari iliyokuzwa ya wakala wa kiolesura.';
    $Self->{Translation}->{'Solution'} = '';
    $Self->{Translation}->{'Symptom'} = '';
    $Self->{Translation}->{'Text Only'} = '';
    $Self->{Translation}->{'The default languages for the related FAQ articles.'} = '';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} =
        'Kitambulishi cha maswali yanayoulizwa mara kwa mara, mfano maswali yanayoulizwa mara kwa mara#,KB#, MyFAQ#. Chaguo msingi ni maswali yanayoulizwa mara kwa mara#.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengele cha maswali yanayoulizwa mara kwa mara kinaweza kuunganishwa na kipengele kingine cha maswali yanayoulizwa mara kwa mara kwa kutumia kiunganishi aina ya \'kawaida\'.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengele cha maswali yanayoulizwa mara kwa mara kinaweza kuunganishwa na kipengele kingine cha tiketi kwa kutumia kiunganishi aina ya \'ZaziMtoto\'.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengele cha maswali yanayoulizwa mara kwa mara kinaweza kuunganishwa na kipengele kingine cha tiketi kwa kutumia kiunganishi aina ya \'kawaida\'.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} =
        'Mpangilio huu unafafanua kwamba kipengele cha maswali yanayoulizwa mara kwa mara kinaweza kuunganishwa na kipengele kingine cha tiketi kwa kutumia aina ya kiunganishi kizazi.';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'Kiini cha tiketi kwa Idhini ya makala ya maswali yanayoulizwa mara kwa mara.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'Somo la tiketi kwa Idhini ya makala ya maswali yanayoulizwa mara kwa mara.';
    $Self->{Translation}->{'Toolbar Item for a shortcut.'} = 'Kipengele cha mwambaa zana kwa ajili ya mkato.';
    $Self->{Translation}->{'external (customer)'} = 'nje (mteja)';
    $Self->{Translation}->{'internal (agent)'} = 'ndani (wakala)';
    $Self->{Translation}->{'public (public)'} = '';

}

1;
