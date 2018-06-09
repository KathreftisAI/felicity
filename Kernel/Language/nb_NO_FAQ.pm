# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nb_NO_FAQ;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'Legg til OSS-artikkel';
    $Self->{Translation}->{'Keywords'} = 'Nøkkelord';
    $Self->{Translation}->{'A category is required.'} = 'Kategori er obligatorisk.';
    $Self->{Translation}->{'Approval'} = 'Godkjenning';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'Kategorioppsett for OSS';
    $Self->{Translation}->{'Add category'} = 'Legg til kategori';
    $Self->{Translation}->{'Delete Category'} = 'Slett kategori';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = 'Legg til kategori';
    $Self->{Translation}->{'Edit Category'} = 'Endre kategori';
    $Self->{Translation}->{'Subcategory of'} = 'Underkategori av';
    $Self->{Translation}->{'Please select at least one permission group.'} = '';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'Saksbehandlergrupper som har tilgang til artikler i denne kategorien';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Vil vises som kommentar i utforskeren';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'Vil du virkelig slette denne kategorien?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} =
        'Du kan ikke slette denne kategorien, fordi den er brukt i minst en OSS-artikkel og/eller foreldre til minst en annen kategori';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'Denne kategorien er brukt i følgende OSS-artikler';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'Denne kategorien er foreldre til følgende underkategorier';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Vil du virkelig slette denne artikkelen?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'OSS';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'Utforsker';
    $Self->{Translation}->{'Quick Search'} = 'Hurtigsøk';
    $Self->{Translation}->{'Wildcards are allowed.'} = '';
    $Self->{Translation}->{'Advanced Search'} = 'Avansert søk';
    $Self->{Translation}->{'Subcategories'} = 'Underkategorier';
    $Self->{Translation}->{'FAQ Articles'} = 'Ofte Stilte Spørsmål';
    $Self->{Translation}->{'No subcategories found.'} = 'Ingen underkategorier funnet';

    # Template: AgentFAQHistory
    $Self->{Translation}->{'History of'} = 'Historikk for';

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = '';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'Språkoppsett for OSS';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languages.'} =
        '';
    $Self->{Translation}->{'Add language'} = 'Legg til språk';
    $Self->{Translation}->{'Delete Language %s'} = 'Slett språk %s';
    $Self->{Translation}->{'Add Language'} = 'Legg til språk';
    $Self->{Translation}->{'Edit Language'} = 'Endre språk';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'Vil du virkelig fjerne dette språket?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} =
        'Du kan ikke slette dette språket. Det er brukt i minst en OSS artikkel!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = '';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Kontekstvalg';
    $Self->{Translation}->{'FAQ articles per page'} = 'OSS artikler per side';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'Ingen artikler funnet';

    # Template: AgentFAQSearch
    $Self->{Translation}->{'Keyword'} = 'Nøkkelord';
    $Self->{Translation}->{'Vote (e. g. Equals 10 or GreaterThan 60)'} = '';
    $Self->{Translation}->{'Rate (e. g. Equals 25% or GreaterThan 75%)'} = '';
    $Self->{Translation}->{'Approved'} = 'Godkjent';
    $Self->{Translation}->{'Last changed by'} = 'Sist endret av';
    $Self->{Translation}->{'FAQ Article Create Time (before/after)'} = 'Opprettelsestidspunkt for OSS artikkelen (før/etter)';
    $Self->{Translation}->{'FAQ Article Create Time (between)'} = 'Opprettelsestidspunkt for OSS artikkelen (mellom)';
    $Self->{Translation}->{'FAQ Article Change Time (before/after)'} = '';
    $Self->{Translation}->{'FAQ Article Change Time (between)'} = '';

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = '';

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'OSS-søk';
    $Self->{Translation}->{'Profile Selection'} = 'Profilvalg';
    $Self->{Translation}->{'Vote'} = 'Stem';
    $Self->{Translation}->{'No vote settings'} = 'Ingen stemmeinnstillinger';
    $Self->{Translation}->{'Specific votes'} = 'Spesifikk notis';
    $Self->{Translation}->{'e. g. Equals 10 or GreaterThan 60'} = '';
    $Self->{Translation}->{'Rate'} = 'Ranger';
    $Self->{Translation}->{'No rate settings'} = 'Ingen rangeringsinnstillinger';
    $Self->{Translation}->{'Specific rate'} = '';
    $Self->{Translation}->{'e. g. Equals 25% or GreaterThan 75%'} = '';
    $Self->{Translation}->{'FAQ Article Create Time'} = '';
    $Self->{Translation}->{'FAQ Article Change Time'} = '';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'Info om OSS';
    $Self->{Translation}->{'Rating'} = 'Rating';
    $Self->{Translation}->{'out of 5'} = 'av 5';
    $Self->{Translation}->{'Votes'} = 'Stemmer';
    $Self->{Translation}->{'No votes found!'} = 'Ingen stemmer funnet!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'Ingen stemmer avgitt! Bli den første til å stemme på denne artikkelen.';
    $Self->{Translation}->{'Download Attachment'} = 'Last ned vedlegg';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        '';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} =
        'Var denne artikkelen til hjelp? Vær snill og gi oss din stemme, slik at vi kan forbedre databasen. Tusen takk!';
    $Self->{Translation}->{'not helpful'} = 'ikke til hjelp';
    $Self->{Translation}->{'very helpful'} = 'veldig nyttig';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Add FAQ title to article subject'} = '';
    $Self->{Translation}->{'Insert FAQ Text'} = 'Sett inn OSS-tekst';
    $Self->{Translation}->{'Insert Full FAQ'} = '';
    $Self->{Translation}->{'Insert FAQ Link'} = 'Sett inn OSS-lenke';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'Sett inn OSS-tekst og -lenke';
    $Self->{Translation}->{'Insert Full FAQ & Link'} = '';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'Ingen OSS-artikler ble funnet';

    # Template: CustomerFAQRelatedArticles
    $Self->{Translation}->{'This might be helpful'} = '';
    $Self->{Translation}->{'Found no helpful resources for the subject and text.'} = '';
    $Self->{Translation}->{'Type a subject or text to get a list of helpful resources.'} = '';

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Fulltekstsøk i OSS-artikler (f.eks. "Ol*" eller "Andreas*n"';
    $Self->{Translation}->{'Vote restrictions'} = '';
    $Self->{Translation}->{'Only FAQ articles with votes...'} = 'Bare OSS artikler med stemmer...';
    $Self->{Translation}->{'Rate restrictions'} = '';
    $Self->{Translation}->{'Only FAQ articles with rate...'} = 'Bare OSS artikler med rangeringer...';
    $Self->{Translation}->{'Only FAQ articles created'} = '';
    $Self->{Translation}->{'Only FAQ articles created between'} = '';
    $Self->{Translation}->{'Search-Profile as Template?'} = '';

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Article Number'} = 'Artikkelnummer';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Søk etter artikler med nøkkelord';

    # Template: PublicFAQSearchOpenSearchDescriptionFAQNumber
    $Self->{Translation}->{'Public'} = 'Offentlig';

    # Template: PublicFAQSearchResultShort
    $Self->{Translation}->{'Back to FAQ Explorer'} = 'Tilbake til OSS utforskeren';

    # Perl Module: Kernel/Modules/AgentFAQAdd.pm
    $Self->{Translation}->{'You need rw permission!'} = '';
    $Self->{Translation}->{'No categories found where user has read/write permissions!'} = '';
    $Self->{Translation}->{'No default language found and can\'t create a new one.'} = '';

    # Perl Module: Kernel/Modules/AgentFAQCategory.pm
    $Self->{Translation}->{'Need CategoryID!'} = '';
    $Self->{Translation}->{'A category should have a name!'} = 'En kategori må ha et navn!';
    $Self->{Translation}->{'This category already exists'} = 'Denne kategorien eksisterer allerede';
    $Self->{Translation}->{'FAQ category updated!'} = 'OSS-kategori oppdatert!';
    $Self->{Translation}->{'This category already exists!'} = '';
    $Self->{Translation}->{'FAQ category added!'} = 'OSS-kategori lagt til';
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
    $Self->{Translation}->{'FAQ History'} = 'OSS-historikk';

    # Perl Module: Kernel/Modules/AgentFAQJournal.pm
    $Self->{Translation}->{'FAQ Journal'} = 'OSS-journal';
    $Self->{Translation}->{'Need config option FAQ::Frontend::Overview'} = '';
    $Self->{Translation}->{'Config option FAQ::Frontend::Overview needs to be a HASH ref!'} =
        '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQLanguage.pm
    $Self->{Translation}->{'No LanguageID is given!'} = '';
    $Self->{Translation}->{'The name is required!'} = 'Navn er påkrevd!';
    $Self->{Translation}->{'This language already exists!'} = 'Dette språket finnes allerede!';
    $Self->{Translation}->{'FAQ language updated!'} = 'OSS-språk oppdatert!';
    $Self->{Translation}->{'FAQ language added!'} = 'OSS-språk lagt til!';
    $Self->{Translation}->{'Was not able to delete the language %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQPrint.pm
    $Self->{Translation}->{'Last update'} = 'Sist oppdatert';
    $Self->{Translation}->{'FAQ Dynamic Fields'} = '';

    # Perl Module: Kernel/Modules/AgentFAQRichText.pm
    $Self->{Translation}->{'No %s is given!'} = '';
    $Self->{Translation}->{'Can\'t load LanguageObject!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Ingen resultater';
    $Self->{Translation}->{'FAQ Number'} = 'OSS-nummer';
    $Self->{Translation}->{'Last Changed by'} = 'Sist endret av';
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
    $Self->{Translation}->{'Thanks for your vote!'} = 'Takk for din stemme!';
    $Self->{Translation}->{'You have already voted!'} = 'Du har allerede stemt';
    $Self->{Translation}->{'No rate selected!'} = 'Ingen rating valgt';
    $Self->{Translation}->{'The voting mechanism is not enabled!'} = '';
    $Self->{Translation}->{'The vote rate is not defined!'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQPrint.pm
    $Self->{Translation}->{'FAQ Article Print'} = 'Utskrift av OSS-artikkel';

    # Perl Module: Kernel/Modules/CustomerFAQSearch.pm
    $Self->{Translation}->{'Created between'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQZoom.pm
    $Self->{Translation}->{'Need ItemID!'} = '';

    # Perl Module: Kernel/Modules/PublicFAQExplorer.pm
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'OSS-artikler (nylig opprettet)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'OSS-artikler (nylig endret)';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'OSS-artikler (Topp 10)';

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
    $Self->{Translation}->{'This article is empty!'} = 'Denne artikkelen er tom!';
    $Self->{Translation}->{'Latest created FAQ articles'} = 'Sist opprettede OSS-artikler';
    $Self->{Translation}->{'Latest updated FAQ articles'} = 'Sist oppdaterte OSS-artikler';
    $Self->{Translation}->{'Top 10 FAQ articles'} = 'Topp 10 OSS';

    # Perl Module: Kernel/Output/HTML/LinkObject/FAQ.pm
    $Self->{Translation}->{'Content Type'} = '';

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} =
        '';
    $Self->{Translation}->{'Add FAQ article'} = '';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'CSS-farge for avstemningsresultat';
    $Self->{Translation}->{'Cache Time To Leave for FAQ items.'} = '';
    $Self->{Translation}->{'Category Management'} = 'Kategorioppsett';
    $Self->{Translation}->{'Customer FAQ Print.'} = '';
    $Self->{Translation}->{'Customer FAQ Zoom.'} = '';
    $Self->{Translation}->{'Customer FAQ search.'} = '';
    $Self->{Translation}->{'Customer FAQ.'} = '';
    $Self->{Translation}->{'CustomerFAQRelatedArticles.'} = '';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'Antall desimaler for avstemningsresultat';
    $Self->{Translation}->{'Default category name.'} = 'Forvalgt kategori';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = '';
    $Self->{Translation}->{'Default maximum size of the titles in a FAQ article to be shown.'} =
        '';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} =
        'Standard prioritet for saker for godkjenning av OSS-artikler.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Standard status for et OSS-objekt.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'Standard status for saker for godkjenning av OSS-artikler.';
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
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'Definisjon av fritekstfelt for OSS-artikler';
    $Self->{Translation}->{'Delete this FAQ'} = 'Slett denne artikkelen';
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
    $Self->{Translation}->{'Edit this FAQ'} = 'Endre denne artikkelen';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = '';
    $Self->{Translation}->{'Enable the related article feature for the customer frontend.'} =
        '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = '';
    $Self->{Translation}->{'Explorer'} = 'Utforsk';
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
    $Self->{Translation}->{'Field4'} = 'Felt 4';
    $Self->{Translation}->{'Field5'} = 'Felt 5';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'Modulregistrering for den offentlige delen';
    $Self->{Translation}->{'Full FAQ'} = '';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'Gruppe som skal godkjenne OSS-artikler.';
    $Self->{Translation}->{'History of this FAQ'} = 'Historikk over denne artikkelen';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Interfaces where the quick search should be shown.'} = '';
    $Self->{Translation}->{'Journal'} = 'Journal';
    $Self->{Translation}->{'Language Management'} = 'Språkoppsett';
    $Self->{Translation}->{'Limit for the search to build the keyword FAQ article list.'} = '';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'Lenk opp et annet objekt til denne artikkelen';
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
    $Self->{Translation}->{'New FAQ Article'} = 'Ny OSS-artikkel';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'Nye artikler trenger godkjenning før de kan publiseres.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} =
        '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} =
        '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} =
        '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} =
        '';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'Antall objekter vist i siste endringer.';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'Antall viste objekter under sist opprettet.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'Antall viste artikler i "Topp 10"-funksjonen';
    $Self->{Translation}->{'Output filter to add Java-script to CustomerTicketMessage screen.'} =
        '';
    $Self->{Translation}->{'Output limit for the related FAQ articles.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} =
        '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} =
        '';
    $Self->{Translation}->{'Print this FAQ'} = 'Skriv ut denne artikkelen';
    $Self->{Translation}->{'Public FAQ Print.'} = '';
    $Self->{Translation}->{'Public FAQ Zoom.'} = '';
    $Self->{Translation}->{'Public FAQ search.'} = '';
    $Self->{Translation}->{'Public FAQ.'} = '';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'Kø for godkjenning av OSS-artikler.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = 'Rater for avstemming. Nøkkel må være i prosent.';
    $Self->{Translation}->{'S'} = '';
    $Self->{Translation}->{'Search FAQ'} = 'Søk i OSS';
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
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'Vis HTML i OSS-artikkel.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'Vis OSS-sti (ja/nei)';
    $Self->{Translation}->{'Show invalid items in the FAQ Explorer result of the agent interface.'} =
        '';
    $Self->{Translation}->{'Show items of subcategories.'} = 'Vis innhold i underkategorier.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'Vis sist endrede artikler i definerte grensesnitt.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'Vis sist opprettede artikler i definerte grensesnitt';
    $Self->{Translation}->{'Show the stars for the articles with a rating equal or greater like the defined value (set value \'0\' to deactive the output).'} =
        '';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'Vis "Topp 10" i definerte grensesnitt.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'Vis avstemming i definerte grensensnitt';
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
    $Self->{Translation}->{'Solution'} = 'Løsning';
    $Self->{Translation}->{'Symptom'} = 'Symptom';
    $Self->{Translation}->{'Text Only'} = '';
    $Self->{Translation}->{'The default languages for the related FAQ articles.'} = '';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} =
        'Identifikator for en OSS-artikkel, f.eks. FAQ#, KB#, OSS#, MinOSS#. Standard er FAQ#.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} =
        'Denne innstillingen definerer at en OSS-artikkel kan lenkes til andre OSS-artikler med "Normal" lenketype.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Denne innstillingen definerer at en OSS-artikkel kan lenkes til andre OSS-artikler med "Foreldre/Barn"-lenketype.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} =
        'Denne innstillingen definerer at en OSS-artikkel kan lenkes til andre saker med "Normal" lenketype.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} =
        'Denne innstillingen definerer at en OSS-artikkel kan lenkes til andre saker med "Foreldre/Barn"-lenketype.';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'Saksinnhold for godkjenning av OSS-artikler.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'Saksemne for godkjenning av OSS-artikler.';
    $Self->{Translation}->{'Toolbar Item for a shortcut.'} = '';
    $Self->{Translation}->{'external (customer)'} = 'kun til kunder';
    $Self->{Translation}->{'internal (agent)'} = 'kun internt (agenter)';
    $Self->{Translation}->{'public (public)'} = '';

}

1;
