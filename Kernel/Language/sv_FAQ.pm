# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sv_FAQ;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'Skapa FAQ artikel';
    $Self->{Translation}->{'Keywords'} = 'Nyckelord';
    $Self->{Translation}->{'A category is required.'} = 'En kategori krävs.';
    $Self->{Translation}->{'Approval'} = 'Godkännande';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'FAQ kategorihantering';
    $Self->{Translation}->{'Add category'} = 'Skapa kategori';
    $Self->{Translation}->{'Delete Category'} = 'Ta bort kategori';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = 'Skapa kategori';
    $Self->{Translation}->{'Edit Category'} = 'Redigera kategori';
    $Self->{Translation}->{'Subcategory of'} = 'Underkategori till';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'Vänligen välj minst en rättighetsgrupp';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'Agent-grupper med åtkomst till artiklarna i denna kategori.';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Visas som kommentar i Utforskaren.';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'Vill du verkligen ta bort denna kategori?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} =
        'Du kan inte ta bort denna kategorin. Det används av minst en FAQ-artikel!';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'Denna kategori används av följande FAQ-artiklar';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'Denna kategori är förälder för följande underkategroier';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Vill du verkligen ta bort denna FAQ-artikel?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'FAQ-utforskare';
    $Self->{Translation}->{'Quick Search'} = 'Snabbsök';
    $Self->{Translation}->{'Wildcards are allowed.'} = 'Jokertecken är tillåtna.';
    $Self->{Translation}->{'Advanced Search'} = 'Avancerad sökning';
    $Self->{Translation}->{'Subcategories'} = 'Underkategorier';
    $Self->{Translation}->{'FAQ Articles'} = 'FAQ-artiklar';
    $Self->{Translation}->{'No subcategories found.'} = 'Inga underkategorier hittades.';

    # Template: AgentFAQHistory
    $Self->{Translation}->{'History of'} = 'Historik för';

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'Det finns ingen data i FAQ-loggboken';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'FAQ språkhantering';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languages.'} =
        '';
    $Self->{Translation}->{'Add language'} = 'Lägg till språk';
    $Self->{Translation}->{'Delete Language %s'} = 'Ta bort språk %s';
    $Self->{Translation}->{'Add Language'} = 'Lägg till språk';
    $Self->{Translation}->{'Edit Language'} = 'Redigera språk';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'Vill du verkligen ta bort detta språk?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} =
        'Du kan inte ta bort detta språk. Det används i minst en FAQ-artikel!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'Detta språk används av följande FAQ-artiklar';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Anpassa vy';
    $Self->{Translation}->{'FAQ articles per page'} = 'FAQ-artiklar per sida';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'Ingen FAQ-information hittades.';

    # Template: AgentFAQSearch
    $Self->{Translation}->{'Keyword'} = 'Nyckelord';
    $Self->{Translation}->{'Vote (e. g. Equals 10 or GreaterThan 60)'} = 'Röster (ex. lika med 10 eller fler än 60)';
    $Self->{Translation}->{'Rate (e. g. Equals 25% or GreaterThan 75%)'} = 'Betyg (ex. lika med 25% eller mer än 75%)';
    $Self->{Translation}->{'Approved'} = 'Godkänd';
    $Self->{Translation}->{'Last changed by'} = 'Senast ändrad av';
    $Self->{Translation}->{'FAQ Article Create Time (before/after)'} = 'FAQ-Artikel Skapad Tid (före/efter)';
    $Self->{Translation}->{'FAQ Article Create Time (between)'} = 'FAQ-Artikel Skapad Tid (mellan)';
    $Self->{Translation}->{'FAQ Article Change Time (before/after)'} = 'FAQ Artikel Ändrad Tid (före/efter)';
    $Self->{Translation}->{'FAQ Article Change Time (between)'} = 'FAQ-Artikel Ändrad Tid (mellan)';

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'FAQ-Fulltext';

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'FAQ sök';
    $Self->{Translation}->{'Profile Selection'} = 'Profilval';
    $Self->{Translation}->{'Vote'} = 'Rösta';
    $Self->{Translation}->{'No vote settings'} = 'Inga röstinställningar';
    $Self->{Translation}->{'Specific votes'} = 'Specifika röster';
    $Self->{Translation}->{'e. g. Equals 10 or GreaterThan 60'} = 'e.g. Lika med 10 eller StörreÄn 60';
    $Self->{Translation}->{'Rate'} = 'Betygsätt';
    $Self->{Translation}->{'No rate settings'} = 'Inga betygsinställningar';
    $Self->{Translation}->{'Specific rate'} = 'Specifikt betyg';
    $Self->{Translation}->{'e. g. Equals 25% or GreaterThan 75%'} = 'e.g. Lika med 25% eller StörreÄn 75%';
    $Self->{Translation}->{'FAQ Article Create Time'} = 'FAQ-Artikel Skapad Tid';
    $Self->{Translation}->{'FAQ Article Change Time'} = 'FAQ artikel ändringstidpunkt';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'FAQ-Information';
    $Self->{Translation}->{'Rating'} = 'Betyg';
    $Self->{Translation}->{'out of 5'} = 'av 5';
    $Self->{Translation}->{'Votes'} = 'Röster';
    $Self->{Translation}->{'No votes found!'} = 'Inga röster funna!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'Inga röster funna! Bli den första att betygsätta denna FAQ-artikel.';
    $Self->{Translation}->{'Download Attachment'} = 'Ladda ner bilaga';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        'För att öppna länkar i följande beskrivningsblock behöver du kanske trycka <Ctrl> eller <Cmd> eller <Shift> medan du klickar på länken (beroende på vilken webbläsare eller operativsystem du har).';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} =
        'Hur hjälpsam var den här artikeln? Vänligen ge oss ditt betyg och hjälp oss förbättra FAQ-databasen. Tack!';
    $Self->{Translation}->{'not helpful'} = 'inte hjälpsam';
    $Self->{Translation}->{'very helpful'} = 'väldigt hjälpsam';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Add FAQ title to article subject'} = 'Lägg till FAQ-titeln till artikelns ämne';
    $Self->{Translation}->{'Insert FAQ Text'} = 'Klistra in FAQ-text';
    $Self->{Translation}->{'Insert Full FAQ'} = 'Klistra in fullständig FAQ';
    $Self->{Translation}->{'Insert FAQ Link'} = 'Klistra in länk till FAQ';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'Klistra in FAQ-text & länk';
    $Self->{Translation}->{'Insert Full FAQ & Link'} = 'Klistra in fullständig FAQ & länk';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'Inga FAQ artiklar funna.';

    # Template: CustomerFAQRelatedArticles
    $Self->{Translation}->{'This might be helpful'} = '';
    $Self->{Translation}->{'Found no helpful resources for the subject and text.'} = '';
    $Self->{Translation}->{'Type a subject or text to get a list of helpful resources.'} = '';

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Fulltext-sök i FAQ-artiklar (e. g. "John*n" eller "Will*")';
    $Self->{Translation}->{'Vote restrictions'} = 'Röst-restriktioner';
    $Self->{Translation}->{'Only FAQ articles with votes...'} = 'Endast FAQ artiklar med röster...';
    $Self->{Translation}->{'Rate restrictions'} = 'Betygs-restriktioner';
    $Self->{Translation}->{'Only FAQ articles with rate...'} = 'Endast FAQ artiklar med betyg...';
    $Self->{Translation}->{'Only FAQ articles created'} = 'Endast FAQ artiklar skapade';
    $Self->{Translation}->{'Only FAQ articles created between'} = 'Endast FAQ artiklar skapade mellan';
    $Self->{Translation}->{'Search-Profile as Template?'} = 'Sök-profil som mall?';

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Article Number'} = 'Artikelnummer';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Sök efter artiklar med nyckelord';

    # Template: PublicFAQSearchOpenSearchDescriptionFAQNumber
    $Self->{Translation}->{'Public'} = 'Offentlig';

    # Template: PublicFAQSearchResultShort
    $Self->{Translation}->{'Back to FAQ Explorer'} = 'Tillbaka till FAQ-utforskaren';

    # Perl Module: Kernel/Modules/AgentFAQAdd.pm
    $Self->{Translation}->{'You need rw permission!'} = '';
    $Self->{Translation}->{'No categories found where user has read/write permissions!'} = '';
    $Self->{Translation}->{'No default language found and can\'t create a new one.'} = '';

    # Perl Module: Kernel/Modules/AgentFAQCategory.pm
    $Self->{Translation}->{'Need CategoryID!'} = '';
    $Self->{Translation}->{'A category should have a name!'} = 'En kategori behöver ett namn!';
    $Self->{Translation}->{'This category already exists'} = 'Denna kategori finns redan!';
    $Self->{Translation}->{'FAQ category updated!'} = 'FAQ-kategori uppdaterad!';
    $Self->{Translation}->{'This category already exists!'} = '';
    $Self->{Translation}->{'FAQ category added!'} = 'FAQ-kategori tillagd!';
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
    $Self->{Translation}->{'FAQ Journal'} = 'FAQ-loggboken';
    $Self->{Translation}->{'Need config option FAQ::Frontend::Overview'} = '';
    $Self->{Translation}->{'Config option FAQ::Frontend::Overview needs to be a HASH ref!'} =
        '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQLanguage.pm
    $Self->{Translation}->{'No LanguageID is given!'} = '';
    $Self->{Translation}->{'The name is required!'} = 'Namn krävs!';
    $Self->{Translation}->{'This language already exists!'} = 'Detta språk finns redan!';
    $Self->{Translation}->{'FAQ language updated!'} = 'FAQ-språk uppdaterat!';
    $Self->{Translation}->{'FAQ language added!'} = 'FAQ-språk skapat!';
    $Self->{Translation}->{'Was not able to delete the language %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQPrint.pm
    $Self->{Translation}->{'Last update'} = 'Senast uppdaterad';
    $Self->{Translation}->{'FAQ Dynamic Fields'} = 'FAQ Dynamiska Fält';

    # Perl Module: Kernel/Modules/AgentFAQRichText.pm
    $Self->{Translation}->{'No %s is given!'} = '';
    $Self->{Translation}->{'Can\'t load LanguageObject!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Inget resultat!';
    $Self->{Translation}->{'FAQ Number'} = 'FAQ-nummer';
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
    $Self->{Translation}->{'Thanks for your vote!'} = 'Tack för din röst!';
    $Self->{Translation}->{'You have already voted!'} = 'Du har redan röstat!';
    $Self->{Translation}->{'No rate selected!'} = 'Inget betyg satt!';
    $Self->{Translation}->{'The voting mechanism is not enabled!'} = '';
    $Self->{Translation}->{'The vote rate is not defined!'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQPrint.pm
    $Self->{Translation}->{'FAQ Article Print'} = 'FAQ-artikel utskrift';

    # Perl Module: Kernel/Modules/CustomerFAQSearch.pm
    $Self->{Translation}->{'Created between'} = 'Skapat mellan';

    # Perl Module: Kernel/Modules/CustomerFAQZoom.pm
    $Self->{Translation}->{'Need ItemID!'} = '';

    # Perl Module: Kernel/Modules/PublicFAQExplorer.pm
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'FAQ-artiklar (nyligen skapad)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'FAQ-artiklar (nyligen ändrade)';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'FAQ-artiklar (Topp 10)';

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
    $Self->{Translation}->{'This article is empty!'} = 'Den här artikeln är tom!';
    $Self->{Translation}->{'Latest created FAQ articles'} = 'Senast skapade FAQ-artiklar';
    $Self->{Translation}->{'Latest updated FAQ articles'} = 'Senast uppdaterade FAQ-artiklar';
    $Self->{Translation}->{'Top 10 FAQ articles'} = 'Topp 10 FAQ-artiklar';

    # Perl Module: Kernel/Output/HTML/LinkObject/FAQ.pm
    $Self->{Translation}->{'Content Type'} = '';

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} =
        '';
    $Self->{Translation}->{'Add FAQ article'} = 'Lägg till FAQ-artikel';
    $Self->{Translation}->{'CSS color for the voting result.'} = '';
    $Self->{Translation}->{'Cache Time To Leave for FAQ items.'} = '';
    $Self->{Translation}->{'Category Management'} = 'Kategorihantering';
    $Self->{Translation}->{'Customer FAQ Print.'} = '';
    $Self->{Translation}->{'Customer FAQ Zoom.'} = '';
    $Self->{Translation}->{'Customer FAQ search.'} = '';
    $Self->{Translation}->{'Customer FAQ.'} = '';
    $Self->{Translation}->{'CustomerFAQRelatedArticles.'} = '';
    $Self->{Translation}->{'Decimal places of the voting result.'} = '';
    $Self->{Translation}->{'Default category name.'} = '';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = '';
    $Self->{Translation}->{'Default maximum size of the titles in a FAQ article to be shown.'} =
        '';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} =
        '';
    $Self->{Translation}->{'Default state for FAQ entry.'} = '';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = '';
    $Self->{Translation}->{'Default type of tickets for the approval of FAQ articles.'} = '';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} =
        '';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        '';
    $Self->{Translation}->{'Define if the FAQ title should be concatenated to article subject.'} =
        '';
    $Self->{Translation}->{'Define which columns are shown in the linked FAQs widget (LinkObject::ViewMode = "complex"). Note: Only FAQ attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} =
        '';
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
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed.'} = '';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = '';
    $Self->{Translation}->{'Delete this FAQ'} = 'Radera denna FAQ';
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
    $Self->{Translation}->{'Edit this FAQ'} = 'Redigera FAQ';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = '';
    $Self->{Translation}->{'Enable the related article feature for the customer frontend.'} =
        '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = '';
    $Self->{Translation}->{'Explorer'} = 'Utforskare';
    $Self->{Translation}->{'FAQ AJAX Responder'} = '';
    $Self->{Translation}->{'FAQ AJAX Responder for Richtext.'} = '';
    $Self->{Translation}->{'FAQ Area'} = '';
    $Self->{Translation}->{'FAQ Area.'} = '';
    $Self->{Translation}->{'FAQ Delete.'} = '';
    $Self->{Translation}->{'FAQ Edit.'} = '';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = '';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = '';
    $Self->{Translation}->{'FAQ Print.'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = '';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = '';
    $Self->{Translation}->{'Field4'} = '';
    $Self->{Translation}->{'Field5'} = '';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = '';
    $Self->{Translation}->{'Full FAQ'} = '';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = '';
    $Self->{Translation}->{'History of this FAQ'} = 'FAQ-historik';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Interfaces where the quick search should be shown.'} = '';
    $Self->{Translation}->{'Journal'} = 'Loggbok';
    $Self->{Translation}->{'Language Management'} = 'Språkhantering';
    $Self->{Translation}->{'Limit for the search to build the keyword FAQ article list.'} = '';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'Länka ett annat objekt till denna FAQ-artikel';
    $Self->{Translation}->{'List of queue names for which the related article feature is enabled.'} =
        '';
    $Self->{Translation}->{'List of state types which can be used in the agent interface.'} =
        '';
    $Self->{Translation}->{'List of state types which can be used in the customer interface.'} =
        '';
    $Self->{Translation}->{'List of state types which can be used in the public interface.'} =
        '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} =
        '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} =
        '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} =
        '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} =
        '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} =
        '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} =
        '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} =
        '';
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
    $Self->{Translation}->{'New FAQ Article'} = 'Ny FAQ-Artikel';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} =
        '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} =
        '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} =
        '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} =
        '';
    $Self->{Translation}->{'Number of shown items in last changes.'} = '';
    $Self->{Translation}->{'Number of shown items in last created.'} = '';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = '';
    $Self->{Translation}->{'Output filter to add Java-script to CustomerTicketMessage screen.'} =
        '';
    $Self->{Translation}->{'Output limit for the related FAQ articles.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} =
        '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} =
        '';
    $Self->{Translation}->{'Print this FAQ'} = 'Skriv ut FAQ';
    $Self->{Translation}->{'Public FAQ Print.'} = '';
    $Self->{Translation}->{'Public FAQ Zoom.'} = '';
    $Self->{Translation}->{'Public FAQ search.'} = '';
    $Self->{Translation}->{'Public FAQ.'} = '';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'Kö för godkännande av FAQ-artiklar.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = '';
    $Self->{Translation}->{'S'} = '';
    $Self->{Translation}->{'Search FAQ'} = 'Sök FAQ';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        '';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        '';
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
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'Visa FAQ-artikel med HTML.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'Visa FAQ sökväg ja/nej.';
    $Self->{Translation}->{'Show invalid items in the FAQ Explorer result of the agent interface.'} =
        '';
    $Self->{Translation}->{'Show items of subcategories.'} = '';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = '';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = '';
    $Self->{Translation}->{'Show the stars for the articles with a rating equal or greater like the defined value (set value \'0\' to deactive the output).'} =
        '';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = '';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = '';
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
    $Self->{Translation}->{'Solution'} = 'Lösning';
    $Self->{Translation}->{'Symptom'} = 'Symptom';
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
    $Self->{Translation}->{'external (customer)'} = 'extern (kunder)';
    $Self->{Translation}->{'internal (agent)'} = 'intern (agent)';
    $Self->{Translation}->{'public (public)'} = '';

}

1;
