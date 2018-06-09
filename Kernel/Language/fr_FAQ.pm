# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fr_FAQ;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'Ajouter Article de FAQ';
    $Self->{Translation}->{'Keywords'} = 'Mots-clés';
    $Self->{Translation}->{'A category is required.'} = 'Une catégorie est requise';
    $Self->{Translation}->{'Approval'} = 'Autorisation';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'Gestion Catégories de FAQ';
    $Self->{Translation}->{'Add category'} = 'Ajout Catégorie';
    $Self->{Translation}->{'Delete Category'} = 'Effacer Catégorie';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = 'Ajout Catégorie';
    $Self->{Translation}->{'Edit Category'} = 'Editer Catégorie';
    $Self->{Translation}->{'Subcategory of'} = 'Sous catégorie de';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'Merci de Sélectionner au moins un groupe de permission.';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'Groupes d\'agents pouvant accéder aux articles de cette catégorie.';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Sera affiché comme un commentaire dans l\'Explorer.';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'Voulez-vous vraiment effacer cette catégorie?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} =
        'Impossible d\'effacer cette catégorie. Elle est utilisée dans au moins un article de FAQ et/ou est parente d\'au moins une autre catégorie.';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'Cette catégorie est utilisée dans les articles de FAQ suivants';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'Cette catégorie est parente';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Voulez-vous vraiment effacer cet article de FAQ?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'Navigateur FAQ';
    $Self->{Translation}->{'Quick Search'} = 'Recherche rapide';
    $Self->{Translation}->{'Wildcards are allowed.'} = 'Les métacaractères sont autorisés';
    $Self->{Translation}->{'Advanced Search'} = 'Recherche Avancée';
    $Self->{Translation}->{'Subcategories'} = 'Sous-catégories';
    $Self->{Translation}->{'FAQ Articles'} = 'Articles de FAQ';
    $Self->{Translation}->{'No subcategories found.'} = 'Pas de sous-catégorie trouvée.';

    # Template: AgentFAQHistory
    $Self->{Translation}->{'History of'} = 'Historique de';

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'Pas de journal de données FAQ trouvé';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'Gestion Langue FAQ';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languages.'} =
        'Utiliser cette fonction afin de travailler avec de multiples langues';
    $Self->{Translation}->{'Add language'} = 'Ajouter une langue';
    $Self->{Translation}->{'Delete Language %s'} = 'Effacer une langue %s';
    $Self->{Translation}->{'Add Language'} = 'Ajouter une langue';
    $Self->{Translation}->{'Edit Language'} = 'Editer la langue';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'Voulez-vous vraiment effacer cette langue';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} =
        'Impossible d\'effacer cette langue. Elle est utilisée dans au moins un article de FAQ';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'Cette langue est utilisée dans les articles FAQ suivants';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Réglages de Contexte';
    $Self->{Translation}->{'FAQ articles per page'} = 'Articles FAQ par page';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'pas de données FAQ trouvées';

    # Template: AgentFAQSearch
    $Self->{Translation}->{'Keyword'} = 'Mot-clé';
    $Self->{Translation}->{'Vote (e. g. Equals 10 or GreaterThan 60)'} = 'Vote (ex. EgalA 10 ou SuperieurA 60)';
    $Self->{Translation}->{'Rate (e. g. Equals 25% or GreaterThan 75%)'} = 'Note (ex. EgalA 25% ou SuperieurA 75%)';
    $Self->{Translation}->{'Approved'} = 'Approuvé';
    $Self->{Translation}->{'Last changed by'} = 'Dernière modification par';
    $Self->{Translation}->{'FAQ Article Create Time (before/after)'} = 'Date Création Article (avant/après)';
    $Self->{Translation}->{'FAQ Article Create Time (between)'} = 'Date Création Article (période)';
    $Self->{Translation}->{'FAQ Article Change Time (before/after)'} = 'Date Modification Article (avant/après)';
    $Self->{Translation}->{'FAQ Article Change Time (between)'} = 'Date Modification Article (période)';

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'Texte Intégral FAQ';

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'Recherche dans la FAQ';
    $Self->{Translation}->{'Profile Selection'} = 'Sélection du profil';
    $Self->{Translation}->{'Vote'} = 'Vote';
    $Self->{Translation}->{'No vote settings'} = 'Pas de paramètres de vote';
    $Self->{Translation}->{'Specific votes'} = 'Vote spécifique';
    $Self->{Translation}->{'e. g. Equals 10 or GreaterThan 60'} = 'p.ex. égal à 10 ou supérieur à 60';
    $Self->{Translation}->{'Rate'} = 'Noter';
    $Self->{Translation}->{'No rate settings'} = 'Pas de réglage de cote';
    $Self->{Translation}->{'Specific rate'} = 'Cote spécifique';
    $Self->{Translation}->{'e. g. Equals 25% or GreaterThan 75%'} = 'p.ex égal à 25% ou supérieur à 75%';
    $Self->{Translation}->{'FAQ Article Create Time'} = 'Heure de création du ticket de FAQ';
    $Self->{Translation}->{'FAQ Article Change Time'} = 'FAQ Article Date de modification';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'Information FAQ';
    $Self->{Translation}->{'Rating'} = 'Cote';
    $Self->{Translation}->{'out of 5'} = 'sur 5';
    $Self->{Translation}->{'Votes'} = 'Votes';
    $Self->{Translation}->{'No votes found!'} = 'Aucun vote trouvé!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'Soyez le premier à noter cete article de FAQ';
    $Self->{Translation}->{'Download Attachment'} = 'Télécharger Fichier Joint';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        'Pour ouvrir les liens dans les blocs de description suivantes, vous pourriez avoir besoin d\'appuyer sur Ctrl ou Cmd ou Maj tout en cliquant sur le lien (en fonction de votre navigateur et OS).';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} =
        'Cet Article était-il utile? Merci de donner une note et de participer à l\'amélioration de la base de données. Merci!';
    $Self->{Translation}->{'not helpful'} = 'peu utile';
    $Self->{Translation}->{'very helpful'} = 'très utile';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Add FAQ title to article subject'} = 'Ajouter un titre de la FAQ au sujet de l\'article';
    $Self->{Translation}->{'Insert FAQ Text'} = 'Insérer Texte dans la FAQ';
    $Self->{Translation}->{'Insert Full FAQ'} = 'Insérer toute la FAQ';
    $Self->{Translation}->{'Insert FAQ Link'} = 'Insérer Lien dans la FAQ';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'Insérer Texte & Lien dans la FAQ';
    $Self->{Translation}->{'Insert Full FAQ & Link'} = 'Insérer tout Texte et Lien dans la FAQ';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'Pas d\'article de FAQ trouvé.';

    # Template: CustomerFAQRelatedArticles
    $Self->{Translation}->{'This might be helpful'} = '';
    $Self->{Translation}->{'Found no helpful resources for the subject and text.'} = '';
    $Self->{Translation}->{'Type a subject or text to get a list of helpful resources.'} = '';

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Recherche texte intégrale dans les articles FAQ (ex. "Emilie*")';
    $Self->{Translation}->{'Vote restrictions'} = 'Restrictions de vote';
    $Self->{Translation}->{'Only FAQ articles with votes...'} = 'Uniquement les articles de FAQ avec des votes...';
    $Self->{Translation}->{'Rate restrictions'} = 'Restrictions de cote';
    $Self->{Translation}->{'Only FAQ articles with rate...'} = 'Uniquement les articles de FAQ avec cote ...';
    $Self->{Translation}->{'Only FAQ articles created'} = 'Uniquement les nouveaux articles de FAQ';
    $Self->{Translation}->{'Only FAQ articles created between'} = 'Uniquement les articles de FAQ créés entre';
    $Self->{Translation}->{'Search-Profile as Template?'} = 'Modèle de recherche en modèle ?';

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Article Number'} = 'Numéro d\'Article';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Recherche des Articles avec mot clé';

    # Template: PublicFAQSearchOpenSearchDescriptionFAQNumber
    $Self->{Translation}->{'Public'} = 'Public';

    # Template: PublicFAQSearchResultShort
    $Self->{Translation}->{'Back to FAQ Explorer'} = 'Revenir au Navigateur FAQ';

    # Perl Module: Kernel/Modules/AgentFAQAdd.pm
    $Self->{Translation}->{'You need rw permission!'} = '';
    $Self->{Translation}->{'No categories found where user has read/write permissions!'} = '';
    $Self->{Translation}->{'No default language found and can\'t create a new one.'} = '';

    # Perl Module: Kernel/Modules/AgentFAQCategory.pm
    $Self->{Translation}->{'Need CategoryID!'} = '';
    $Self->{Translation}->{'A category should have a name!'} = 'Une catégorie devrait avoir un nom!';
    $Self->{Translation}->{'This category already exists'} = 'Cette catégorie existe déjà!';
    $Self->{Translation}->{'FAQ category updated!'} = 'Catégorie de FAQ mise à jour!';
    $Self->{Translation}->{'This category already exists!'} = '';
    $Self->{Translation}->{'FAQ category added!'} = 'Catégorie de FAQ ajoutée!';
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
    $Self->{Translation}->{'FAQ Journal'} = 'Journal de FAQ';
    $Self->{Translation}->{'Need config option FAQ::Frontend::Overview'} = '';
    $Self->{Translation}->{'Config option FAQ::Frontend::Overview needs to be a HASH ref!'} =
        '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQLanguage.pm
    $Self->{Translation}->{'No LanguageID is given!'} = '';
    $Self->{Translation}->{'The name is required!'} = 'Le nom est requis!';
    $Self->{Translation}->{'This language already exists!'} = 'Cette langue existe déjà!';
    $Self->{Translation}->{'FAQ language updated!'} = 'Langue de FAQ mise à jour!';
    $Self->{Translation}->{'FAQ language added!'} = 'Langue de FAQ ajouté!';
    $Self->{Translation}->{'Was not able to delete the language %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQPrint.pm
    $Self->{Translation}->{'Last update'} = 'Dernière mise à jour';
    $Self->{Translation}->{'FAQ Dynamic Fields'} = 'Champs dynamiques de FAQ';

    # Perl Module: Kernel/Modules/AgentFAQRichText.pm
    $Self->{Translation}->{'No %s is given!'} = '';
    $Self->{Translation}->{'Can\'t load LanguageObject!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Aucun résultat !';
    $Self->{Translation}->{'FAQ Number'} = 'Numéro de FAQ';
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
    $Self->{Translation}->{'Thanks for your vote!'} = 'Merci pour votre vote !';
    $Self->{Translation}->{'You have already voted!'} = 'Vous avez déjà voté !';
    $Self->{Translation}->{'No rate selected!'} = 'Pas de sélection !';
    $Self->{Translation}->{'The voting mechanism is not enabled!'} = '';
    $Self->{Translation}->{'The vote rate is not defined!'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQPrint.pm
    $Self->{Translation}->{'FAQ Article Print'} = 'Imprimer Article de FAQ';

    # Perl Module: Kernel/Modules/CustomerFAQSearch.pm
    $Self->{Translation}->{'Created between'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQZoom.pm
    $Self->{Translation}->{'Need ItemID!'} = '';

    # Perl Module: Kernel/Modules/PublicFAQExplorer.pm
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'Articles de FAQ (nouvelles questions)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'Articles de FAQ (derniers changements)';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'Articles de FAQ (Top 10)';

    # Perl Module: Kernel/Modules/PublicFAQRSS.pm
    $Self->{Translation}->{'No Type is given!'} = '';
    $Self->{Translation}->{'Type must be either LastCreate or LastChange or Top10!'} = '';
    $Self->{Translation}->{'Can\'t create RSS file!'} = '';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/AgentFAQSearch.pm
    $Self->{Translation}->{'%s (FAQFulltext)'} = '';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/CustomerFAQSearch.pm
    $Self->{Translation}->{'%s - Customer (%s)'} = '%s - Client (%s)';
    $Self->{Translation}->{'%s - Customer (FAQFulltext)'} = '';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/PublicFAQSearch.pm
    $Self->{Translation}->{'%s - Public (%s)'} = '%s - Publique (%s)';
    $Self->{Translation}->{'%s - Public (FAQFulltext)'} = '';

    # Perl Module: Kernel/Output/HTML/Layout/FAQ.pm
    $Self->{Translation}->{'Need rate!'} = '';
    $Self->{Translation}->{'This article is empty!'} = 'Cet article est vide !';
    $Self->{Translation}->{'Latest created FAQ articles'} = 'Dernières questions créées';
    $Self->{Translation}->{'Latest updated FAQ articles'} = 'Dernières questions modifiées';
    $Self->{Translation}->{'Top 10 FAQ articles'} = 'Top 10 des questions';

    # Perl Module: Kernel/Output/HTML/LinkObject/FAQ.pm
    $Self->{Translation}->{'Content Type'} = '';

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} =
        '';
    $Self->{Translation}->{'Add FAQ article'} = 'Ajouter un article de FAQ';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'Couleur CSS pour le résultat du vote';
    $Self->{Translation}->{'Cache Time To Leave for FAQ items.'} = 'Durée de validité du Cache pour les éléments de la FAQ';
    $Self->{Translation}->{'Category Management'} = 'Gestion des catégories';
    $Self->{Translation}->{'Customer FAQ Print.'} = 'Impression FAQ Client.';
    $Self->{Translation}->{'Customer FAQ Zoom.'} = 'Zoom FAQ Client.';
    $Self->{Translation}->{'Customer FAQ search.'} = 'Recherche FAQ Client.';
    $Self->{Translation}->{'Customer FAQ.'} = 'FAQ Client.';
    $Self->{Translation}->{'CustomerFAQRelatedArticles.'} = '';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'Positionnement décimal des résultats du vote';
    $Self->{Translation}->{'Default category name.'} = 'Nom de catégorie par défaut';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = 'Langue par défaut pour les articles de la FAQ en mode langage unique.';
    $Self->{Translation}->{'Default maximum size of the titles in a FAQ article to be shown.'} =
        'Taille maximum par défaut des titres dans un article de la FAQ à montrer.';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} =
        'Priorité par défaut des tickets pour l\'approbation d\'articles de la FAQ.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Etat par défaut d\'une entrée de la FAQ.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'Etat par défaut des tickets pour l\'approbation d\'articles de la FAQ.';
    $Self->{Translation}->{'Default type of tickets for the approval of FAQ articles.'} = 'Type par défaut des tickets pour l\'approbation d\'articles de la FAQ.';
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
    $Self->{Translation}->{'Delete this FAQ'} = 'Supprimer cette FAQ';
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
    $Self->{Translation}->{'Edit this FAQ'} = 'Modifier cette FAQ';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = '';
    $Self->{Translation}->{'Enable the related article feature for the customer frontend.'} =
        '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = '';
    $Self->{Translation}->{'Explorer'} = 'Explorateur';
    $Self->{Translation}->{'FAQ AJAX Responder'} = '';
    $Self->{Translation}->{'FAQ AJAX Responder for Richtext.'} = '';
    $Self->{Translation}->{'FAQ Area'} = 'Zone FAQ';
    $Self->{Translation}->{'FAQ Area.'} = 'Zone FAQ.';
    $Self->{Translation}->{'FAQ Delete.'} = 'Supprimer FAQ';
    $Self->{Translation}->{'FAQ Edit.'} = 'Editer FAQ';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = '';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = '';
    $Self->{Translation}->{'FAQ Print.'} = 'Impression FAQ.';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = '';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = '';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = '';
    $Self->{Translation}->{'Field4'} = '';
    $Self->{Translation}->{'Field5'} = '';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = '';
    $Self->{Translation}->{'Full FAQ'} = '';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = '';
    $Self->{Translation}->{'History of this FAQ'} = 'Historique de cette FAQ';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = '';
    $Self->{Translation}->{'Interfaces where the quick search should be shown.'} = '';
    $Self->{Translation}->{'Journal'} = 'Journal';
    $Self->{Translation}->{'Language Management'} = 'Gestion des langues';
    $Self->{Translation}->{'Limit for the search to build the keyword FAQ article list.'} = '';
    $Self->{Translation}->{'Link another object to this FAQ item'} = '';
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
    $Self->{Translation}->{'New FAQ Article'} = 'Nouvel Article FAQ';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'Les nouveaux articles FAQ doivent être approuvés avant d\'être publiés';
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
    $Self->{Translation}->{'Print this FAQ'} = 'Imprimer cette FAQ';
    $Self->{Translation}->{'Public FAQ Print.'} = 'Imprimer FAQ publique.';
    $Self->{Translation}->{'Public FAQ Zoom.'} = 'Zoom FAQ publique.';
    $Self->{Translation}->{'Public FAQ search.'} = 'Recherche FAQ publique.';
    $Self->{Translation}->{'Public FAQ.'} = 'FAQ Publique.';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = '';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = '';
    $Self->{Translation}->{'S'} = 'S';
    $Self->{Translation}->{'Search FAQ'} = 'Recherche dans FAQ';
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
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'Afficher l\'article de FAQ en HTML.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'Afficher le chemin FAQ oui/non.';
    $Self->{Translation}->{'Show invalid items in the FAQ Explorer result of the agent interface.'} =
        '';
    $Self->{Translation}->{'Show items of subcategories.'} = 'Afficher les éléments des sous-catégories';
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
    $Self->{Translation}->{'Solution'} = 'Solution';
    $Self->{Translation}->{'Symptom'} = 'Symptôme';
    $Self->{Translation}->{'Text Only'} = 'Texte uniquement';
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
    $Self->{Translation}->{'Toolbar Item for a shortcut.'} = 'Élément barre à outils pour raccourci.';
    $Self->{Translation}->{'external (customer)'} = 'externe (client)';
    $Self->{Translation}->{'internal (agent)'} = 'interne (opérateur)';
    $Self->{Translation}->{'public (public)'} = 'public (public)';

}

1;
