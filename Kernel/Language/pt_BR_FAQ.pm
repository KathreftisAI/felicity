# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_FAQ;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'Adicionar Artigo de FAQ';
    $Self->{Translation}->{'Keywords'} = 'Palavras-chave';
    $Self->{Translation}->{'A category is required.'} = 'Uma categoria é necessária.';
    $Self->{Translation}->{'Approval'} = 'Aprovação';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'Gerenciamento de Categoria de FAQ';
    $Self->{Translation}->{'Add category'} = 'Adicionar categoria';
    $Self->{Translation}->{'Delete Category'} = 'Excluir categoria';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = 'Adicionar categoria';
    $Self->{Translation}->{'Edit Category'} = 'Alterar categoria';
    $Self->{Translation}->{'Subcategory of'} = 'Subcategoria de';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'Por favor, selecione pelo menos um grupo de permissão.';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'Grupos de atendentes que podem acessar artigos nesta categoria.';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Será exibido como comentário na lista de entradas da FAQ';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'Você realmente quer apagar esta categoria?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ article and/or is parent of at least one other category'} =
        'Você não pode remover essa categoria. Ela é utilizada por pelo menos um Artigo da FAQ e/ou é pai de pelo menos uma outra categoria. ';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'Esta categoria é utilizada no(s) seguinte(s) artigo(s) FAQ';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'Esta categoria é pai das seguintes subcategorias';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Você realmente quer excluir este artigo FAQ?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'Explorar a FAQ';
    $Self->{Translation}->{'Quick Search'} = 'Busca Rápida';
    $Self->{Translation}->{'Wildcards are allowed.'} = 'Coringas são permitidos.';
    $Self->{Translation}->{'Advanced Search'} = 'Pesquisa Avançada';
    $Self->{Translation}->{'Subcategories'} = 'Subcategorias';
    $Self->{Translation}->{'FAQ Articles'} = 'Artigos FAQ';
    $Self->{Translation}->{'No subcategories found.'} = 'Subcategorias não encontradas.';

    # Template: AgentFAQHistory
    $Self->{Translation}->{'History of'} = 'Histórico de';

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'Não foram encontrados dados de Jornal FAQ.';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'Gerenciamento de Idiomas FAQ';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languages.'} =
        'Use esse recurso se você deseja trabalhar com múltiplos idiomas.';
    $Self->{Translation}->{'Add language'} = 'Adicionar idioma';
    $Self->{Translation}->{'Delete Language %s'} = 'Excluir idioma %s';
    $Self->{Translation}->{'Add Language'} = 'Adicionar Idioma';
    $Self->{Translation}->{'Edit Language'} = 'Editar Idioma';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'Você realmente quer excluir este idioma?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} =
        'Você não pode excluir este idioma. Ele é usado em pelo menos um artigo FAQ!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'Este idioma é usado nos seguintes artigo(s) FAQ';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Configurações de Contexto';
    $Self->{Translation}->{'FAQ articles per page'} = 'Artigos FAQ por página';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'Não foram encontrados dados de FAQ.';

    # Template: AgentFAQSearch
    $Self->{Translation}->{'Keyword'} = 'Palavra-chave';
    $Self->{Translation}->{'Vote (e. g. Equals 10 or GreaterThan 60)'} = 'Voto (ex. Igual a 10 ou maior que 60)';
    $Self->{Translation}->{'Rate (e. g. Equals 25% or GreaterThan 75%)'} = 'Pontuação (ex. Igual a 25% ou maior que 75%)';
    $Self->{Translation}->{'Approved'} = 'Aprovado';
    $Self->{Translation}->{'Last changed by'} = 'Alterado pela última vez por';
    $Self->{Translation}->{'FAQ Article Create Time (before/after)'} = 'Horário de criação de artigo de FAQ (antes/depois)';
    $Self->{Translation}->{'FAQ Article Create Time (between)'} = 'Horário de criação de artigo de FAQ (entre)';
    $Self->{Translation}->{'FAQ Article Change Time (before/after)'} = 'Horário de alteração de artigo de FAQ (antes/depois)';
    $Self->{Translation}->{'FAQ Article Change Time (between)'} = 'Horário de alteração de artigo de FAQ (entre)';

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'FAQ-TextoCompleto';

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'Busca FAQ';
    $Self->{Translation}->{'Profile Selection'} = 'Seleção de perfil';
    $Self->{Translation}->{'Vote'} = 'Voto';
    $Self->{Translation}->{'No vote settings'} = 'Sem configurações de voto';
    $Self->{Translation}->{'Specific votes'} = 'Votos específicos';
    $Self->{Translation}->{'e. g. Equals 10 or GreaterThan 60'} = 'ex. Igual a 10 ou maior que 60';
    $Self->{Translation}->{'Rate'} = 'Pontuação';
    $Self->{Translation}->{'No rate settings'} = 'Sem configurações de pontuação';
    $Self->{Translation}->{'Specific rate'} = 'Pontuação específica';
    $Self->{Translation}->{'e. g. Equals 25% or GreaterThan 75%'} = 'ex. Igual a 25% ou maior que 75%';
    $Self->{Translation}->{'FAQ Article Create Time'} = 'Horário de criação de artigo de FAQ';
    $Self->{Translation}->{'FAQ Article Change Time'} = 'Horário de alteração de artigo de FAQ';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'Informação do FAQ';
    $Self->{Translation}->{'Rating'} = 'Nota';
    $Self->{Translation}->{'out of 5'} = 'de 5';
    $Self->{Translation}->{'Votes'} = 'Votos';
    $Self->{Translation}->{'No votes found!'} = 'Nenhum voto encontrado!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'Nenhum voto encontrado! Seja o primeiro a avaliar este artigo FAQ.';
    $Self->{Translation}->{'Download Attachment'} = 'Baixar anexos';
    $Self->{Translation}->{'To open links in the following description blocks, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).'} =
        'Para abrir links nos blocos de descrição seguintes, talvez você precise pressionar Ctrl, Cmd ou Shift enquanto clica no link (dependendo do seu navegador ou sistema operacional).';
    $Self->{Translation}->{'How helpful was this article? Please give us your rating and help to improve the FAQ Database. Thank You!'} =
        'Este artigo te ajudou?';
    $Self->{Translation}->{'not helpful'} = 'pouco útil';
    $Self->{Translation}->{'very helpful'} = 'muito útil';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Add FAQ title to article subject'} = 'Adicionar assunto no artigo da FAQ.';
    $Self->{Translation}->{'Insert FAQ Text'} = 'Inserir texto do FAQ';
    $Self->{Translation}->{'Insert Full FAQ'} = 'Inserir todo o FAQ';
    $Self->{Translation}->{'Insert FAQ Link'} = 'Inserir link do FAQ';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'Inserir texto do FAQ e link';
    $Self->{Translation}->{'Insert Full FAQ & Link'} = 'Inserir todo o FAQ e link';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'Nenhum artigo FAQ encontrado.';

    # Template: CustomerFAQRelatedArticles
    $Self->{Translation}->{'This might be helpful'} = '';
    $Self->{Translation}->{'Found no helpful resources for the subject and text.'} = '';
    $Self->{Translation}->{'Type a subject or text to get a list of helpful resources.'} = '';

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Pesquisa completa de textos em artigos FAQ (por exemplo, "Jo*o" or "Will*")';
    $Self->{Translation}->{'Vote restrictions'} = 'Restrições de voto';
    $Self->{Translation}->{'Only FAQ articles with votes...'} = 'Apenas artigos de FAQ com votos...';
    $Self->{Translation}->{'Rate restrictions'} = 'Restrições de pontuação';
    $Self->{Translation}->{'Only FAQ articles with rate...'} = 'Apenas artigos de FAQ com pontuação...';
    $Self->{Translation}->{'Only FAQ articles created'} = 'Apenas artigos de FAQ criados';
    $Self->{Translation}->{'Only FAQ articles created between'} = 'Apenas artigos de FAQ criados entre';
    $Self->{Translation}->{'Search-Profile as Template?'} = 'Perfil de pesquisa como modelo?';

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Article Number'} = 'Número do Artigo';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Procure por artigos com palavras-chave';

    # Template: PublicFAQSearchOpenSearchDescriptionFAQNumber
    $Self->{Translation}->{'Public'} = 'Público';

    # Template: PublicFAQSearchResultShort
    $Self->{Translation}->{'Back to FAQ Explorer'} = 'Voltar para a lista de entradas da FAQ';

    # Perl Module: Kernel/Modules/AgentFAQAdd.pm
    $Self->{Translation}->{'You need rw permission!'} = '';
    $Self->{Translation}->{'No categories found where user has read/write permissions!'} = '';
    $Self->{Translation}->{'No default language found and can\'t create a new one.'} = '';

    # Perl Module: Kernel/Modules/AgentFAQCategory.pm
    $Self->{Translation}->{'Need CategoryID!'} = '';
    $Self->{Translation}->{'A category should have a name!'} = 'Uma categoria precisa ter um nome!';
    $Self->{Translation}->{'This category already exists'} = 'Esta categoria já existe!';
    $Self->{Translation}->{'FAQ category updated!'} = 'Categoria de FAQ atualizada!';
    $Self->{Translation}->{'This category already exists!'} = '';
    $Self->{Translation}->{'FAQ category added!'} = 'Categoria de FAQ adicionada!';
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
    $Self->{Translation}->{'FAQ Journal'} = 'Jornal FAQ';
    $Self->{Translation}->{'Need config option FAQ::Frontend::Overview'} = '';
    $Self->{Translation}->{'Config option FAQ::Frontend::Overview needs to be a HASH ref!'} =
        '';
    $Self->{Translation}->{'No config option found for the view "%s"!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQLanguage.pm
    $Self->{Translation}->{'No LanguageID is given!'} = '';
    $Self->{Translation}->{'The name is required!'} = 'O nome é obrigatório!';
    $Self->{Translation}->{'This language already exists!'} = 'Esse idioma já existe!';
    $Self->{Translation}->{'FAQ language updated!'} = 'Idioma de FAQ atualizado!';
    $Self->{Translation}->{'FAQ language added!'} = 'Idioma de FAQ adicionado!';
    $Self->{Translation}->{'Was not able to delete the language %s!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQPrint.pm
    $Self->{Translation}->{'Last update'} = 'Última atualização';
    $Self->{Translation}->{'FAQ Dynamic Fields'} = 'Campos dinâmicos da FAQ';

    # Perl Module: Kernel/Modules/AgentFAQRichText.pm
    $Self->{Translation}->{'No %s is given!'} = '';
    $Self->{Translation}->{'Can\'t load LanguageObject!'} = '';

    # Perl Module: Kernel/Modules/AgentFAQSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Nenhum resultado!';
    $Self->{Translation}->{'FAQ Number'} = 'Número da FAQ';
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
    $Self->{Translation}->{'Thanks for your vote!'} = 'Obrigado por seu voto!';
    $Self->{Translation}->{'You have already voted!'} = 'Você já votou!';
    $Self->{Translation}->{'No rate selected!'} = 'Nenhuma pontuação selecionada!';
    $Self->{Translation}->{'The voting mechanism is not enabled!'} = '';
    $Self->{Translation}->{'The vote rate is not defined!'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQPrint.pm
    $Self->{Translation}->{'FAQ Article Print'} = 'Imprimir artigo da FAQ';

    # Perl Module: Kernel/Modules/CustomerFAQSearch.pm
    $Self->{Translation}->{'Created between'} = '';

    # Perl Module: Kernel/Modules/CustomerFAQZoom.pm
    $Self->{Translation}->{'Need ItemID!'} = '';

    # Perl Module: Kernel/Modules/PublicFAQExplorer.pm
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'Artigos da FAQ (recém criados)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'Artigos da FAQ (alterados recentemente)';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'Artigos da FAQ (Top 10)';

    # Perl Module: Kernel/Modules/PublicFAQRSS.pm
    $Self->{Translation}->{'No Type is given!'} = '';
    $Self->{Translation}->{'Type must be either LastCreate or LastChange or Top10!'} = '';
    $Self->{Translation}->{'Can\'t create RSS file!'} = '';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/AgentFAQSearch.pm
    $Self->{Translation}->{'%s (FAQFulltext)'} = '%s (FAQ-TextoCompleto)';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/CustomerFAQSearch.pm
    $Self->{Translation}->{'%s - Customer (%s)'} = '%s - Cliente (%s)';
    $Self->{Translation}->{'%s - Customer (FAQFulltext)'} = '%s - Cliente (FAQ-TextoCompleto)';

    # Perl Module: Kernel/Output/HTML/HeaderMeta/PublicFAQSearch.pm
    $Self->{Translation}->{'%s - Public (%s)'} = '%s - Público (%s)';
    $Self->{Translation}->{'%s - Public (FAQFulltext)'} = '%s - Público (FAQ-TextoCompleto)';

    # Perl Module: Kernel/Output/HTML/Layout/FAQ.pm
    $Self->{Translation}->{'Need rate!'} = '';
    $Self->{Translation}->{'This article is empty!'} = 'O artigo está vazio!';
    $Self->{Translation}->{'Latest created FAQ articles'} = 'Artigos da FAQ criados recentemente.';
    $Self->{Translation}->{'Latest updated FAQ articles'} = 'Artigos da FAQ atualizados recentemente.';
    $Self->{Translation}->{'Top 10 FAQ articles'} = 'Top 10 artigos da FAQ';

    # Perl Module: Kernel/Output/HTML/LinkObject/FAQ.pm
    $Self->{Translation}->{'Content Type'} = '';

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} =
        'Um filtro de saída HTML para adicionar links para trás uma seqüência definida. O elemento de imagem permite dois tipos de entrada. Primeiro, o nome de uma imagem (faq.png, por exemplo). Neste caso, o caminho da imagem OTRS será usado. A segunda possibilidade é inserir o link para a imagem.';
    $Self->{Translation}->{'Add FAQ article'} = 'Adicionar Artigo de FAQ';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'CSS cor para o resultado da votação.';
    $Self->{Translation}->{'Cache Time To Leave for FAQ items.'} = 'Tempo de expiração de cache para itens de FAQ.';
    $Self->{Translation}->{'Category Management'} = 'Gerenciamento de Categoria';
    $Self->{Translation}->{'Customer FAQ Print.'} = 'Imprimir FAQ de Cliente.';
    $Self->{Translation}->{'Customer FAQ Zoom.'} = 'Zoom em FAQ de Cliente.';
    $Self->{Translation}->{'Customer FAQ search.'} = 'Busca em FAQ de Cliente.';
    $Self->{Translation}->{'Customer FAQ.'} = 'FAQ de Cliente.';
    $Self->{Translation}->{'CustomerFAQRelatedArticles.'} = '';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'Casas decimais do resultado da votação.';
    $Self->{Translation}->{'Default category name.'} = 'Nome padrão da categoria.';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = 'Idioma padrão para os artigos FAQ no modo de idioma único.';
    $Self->{Translation}->{'Default maximum size of the titles in a FAQ article to be shown.'} =
        'Tamanho máximo padrão dos títulos em um artigo de FAQ a serem exibidos.';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} =
        'Prioridade padrão de chamados para a aprovação dos artigos FAQ.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Estado padrão de entrada FAQ.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'Estado padrão de chamados para a aprovação dos artigos FAQ.';
    $Self->{Translation}->{'Default type of tickets for the approval of FAQ articles.'} = 'Tipo padrão do chamados para a aprovação de artigos da FAQ.';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} =
        'Valor padrão para o parâmetro de Recurso para a interface pública. O parâmetro de ação é usado nos scripts do sistema.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Defina Ações onde um botão de configurações está disponível no widget de objetos vinculados (LinkObject::ViewMode="complex"). Observe que essas ações devem ter registrado os seguintes arquivos JS e CSS: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js e Core.Agent .LinkObject.js.';
    $Self->{Translation}->{'Define if the FAQ title should be concatenated to article subject.'} =
        'Define se o título do FAQ deve ser concatenado ao assunto do artigo.';
    $Self->{Translation}->{'Define which columns are shown in the linked FAQs widget (LinkObject::ViewMode = "complex"). Note: Only FAQ attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} =
        'Define um módulo de resumo para mostrar a visualização pequena de um jornal FAQ.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} =
        'Define um módulo de resumo para mostrar a visualizar de uma pequena lista de FAQ.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} =
        'Define o atributo padrão FAQ para classificar o FAQ em uma pesquisa FAQ da interface do atendente.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} =
        'Define o atributo padrão FAQ para classificar o FAQ em uma pesquisa FAQ da interface do cliente.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} =
        'Define o atributo padrão FAQ para classificar o FAQ em uma pesquisa FAQ da interface pública.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} =
        'Define o atributo padrão FAQ para classificar o FAQ no Gerenciador FAQ da interface do atendente';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} =
        'Define o atributo padrão FAQ para classificar o FAQ no Gerenciador FAQ da interface do cliente';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} =
        'Define o atributo padrão FAQ para classificar o FAQ no Gerenciador FAQ da interface pública';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} =
        'Define a ordem padrão de FAQ no resultado do Gerenciador FAQ da interface do atendente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} =
        'Define a ordem padrão de FAQ no resultado do Gerenciador FAQ da interface do cliente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} =
        'Define a ordem padrão de FAQ no resultado do Gerenciador FAQ da interface pública. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} =
        'Define a ordem padrão de FAQ no resultado da pesquisa na interface do atendente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} =
        'Define a ordem padrão de FAQ no resultado da pesquisa na interface do cliente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} =
        'Define a ordem padrão de FAQ no resultado da pesquisa na interface pública. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default shown FAQ search attribute for FAQ search screen.'} =
        'Define o atributo de pesquisa de FAQ padrão na tela de procura de FAQ.';
    $Self->{Translation}->{'Defines the information to be inserted in a FAQ based Ticket. "Full FAQ" includes text, attachments and inline images.'} =
        'Define a informação a ser inserida no chamado baseado em FAQ. "Todo o FAQ" inclui texto, anexos e imagens embutidas.';
    $Self->{Translation}->{'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.'} =
        'Define os parâmetros para o backend do dashboard. "Limite" define o número de entradas exibidas por padrão. "Grupo" é usado para restringir o acesso ao plugin (ex.: Grupo: admin, grupo1, grupo2). "Padrão" indica se o plugin é habilitado por padrão ou se o usuário precisa habilitá-lo manualmente.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} =
        'Define as colunas mostradas no Gerenciador FAQ. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} =
        'Define as colunas mostradas no jornal FAQ. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} =
        'Define as colunas mostradas na pesquisa FAQ. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed.'} = 'Define onde o link "Inserir FAQ" será exibido.';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'Definição de campos de texto livre.';
    $Self->{Translation}->{'Delete this FAQ'} = 'Excluir este FAQ!';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ add screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Campos dinâmicos mostrados na tela de adição de FAQ da interface de atendente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado, 2 = Habilitado e requerido.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ edit screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Campos dinâmicos mostrados na tela de edição de FAQ da interface de atendente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado, 2 = Habilitado e requerido.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Campos dinâmicos mostrados na visão geral de FAQ da interface de cliente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado, 2 = Habilitado e requerido.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ overview screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Campos dinâmicos mostrados na visão geral de FAQ da interface pública. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado, 2 = Habilitado e requerido.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Campos dinâmicos mostrados na tela de impressão de FAQ da interface de atendente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Campos dinâmicos mostrados na tela de impressão de FAQ da interface de cliente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ print screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Campos dinâmicos mostrados na tela de impressão de FAQ da interface pública. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Campos dinâmicos mostrados na tela de pesquisa de FAQ da interface de atendente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado, 2 = Habilitado e exibido por padrão.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Campos dinâmicos mostrados na tela de pesquisa de FAQ da interface de cliente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado, 2 = Habilitado e exibido por padrão.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ search screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.'} =
        'Campos dinâmicos mostrados na tela de pesquisa de FAQ da interface pública. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado, 2 = Habilitado e exibido por padrão.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Campos dinâmicos mostrados na tela de visão geral de FAQ em formato pequeno da interface de atendente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Campos dinâmicos mostrados na tela de detalhes de FAQ da interface de atendente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Campos dinâmicos mostrados na tela de detalhes de FAQ da interface de cliente. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado.';
    $Self->{Translation}->{'Dynamic fields shown in the FAQ zoom screen of the public interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Campos dinâmicos mostrados na tela de detalhes de FAQ da interface pública. Configurações possíveis: 0 = Desabilitado, 1 = Habilitado.';
    $Self->{Translation}->{'Edit this FAQ'} = 'Editar este FAQ';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = 'Permitir vários idiomas no módulo FAQ.';
    $Self->{Translation}->{'Enable the related article feature for the customer frontend.'} =
        '';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = 'Permitir mecanismo de Avaliação no módulo FAQ.';
    $Self->{Translation}->{'Explorer'} = 'Explorar';
    $Self->{Translation}->{'FAQ AJAX Responder'} = 'FAQ AJAX Responder';
    $Self->{Translation}->{'FAQ AJAX Responder for Richtext.'} = 'FAQ AJAX Responder em Richtext.';
    $Self->{Translation}->{'FAQ Area'} = 'Área FAQ';
    $Self->{Translation}->{'FAQ Area.'} = 'Área FAQ.';
    $Self->{Translation}->{'FAQ Delete.'} = 'Deletar FAQ.';
    $Self->{Translation}->{'FAQ Edit.'} = 'Editar FAQ.';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = 'Limite da Visão Geral "Pequeno" do Jornal FAQ';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = 'Limite da Visão Geral FAQ "Pequeno"';
    $Self->{Translation}->{'FAQ Print.'} = 'imprimir FAQ.';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = 'Limite de FAQs por página da Visão Geral "Pequeno" do Jornal FAQ';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = 'Limite de FAQs por página da Visão Geral "Pequeno" de FAQ';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = 'FAQ busca servidor roteador da interface do atendente.';
    $Self->{Translation}->{'Field4'} = 'Campo4';
    $Self->{Translation}->{'Field5'} = 'Campo5';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'Frontend de registo do módulo para a interface pública.';
    $Self->{Translation}->{'Full FAQ'} = 'FAQ completo';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'Grupo para a aprovação dos artigos FAQ.';
    $Self->{Translation}->{'History of this FAQ'} = 'Histórico deste FAQ';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = 'Incluir campos internos de um Chamado base FAQ.';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = 'Incluir o nome de cada campo em um Chamado base FAQ.';
    $Self->{Translation}->{'Interfaces where the quick search should be shown.'} = 'Interfaces onde a pesquisa rápida deve ser mostrada.';
    $Self->{Translation}->{'Journal'} = 'Jornal';
    $Self->{Translation}->{'Language Management'} = 'Gestão de idiomas';
    $Self->{Translation}->{'Limit for the search to build the keyword FAQ article list.'} = '';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'Link de outro artigo para este item FAQ';
    $Self->{Translation}->{'List of queue names for which the related article feature is enabled.'} =
        '';
    $Self->{Translation}->{'List of state types which can be used in the agent interface.'} =
        'Lista dos tipos de estado que pode ser utilizado na interface de agente.';
    $Self->{Translation}->{'List of state types which can be used in the customer interface.'} =
        'Lista dos tipos de estado que pode ser utilizado na interface de cliente.';
    $Self->{Translation}->{'List of state types which can be used in the public interface.'} =
        'Lista dos tipos de estado que pode ser utilizado na interface pública.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} =
        'O número máximo de artigos FAQ para ser exibido no resultado do Gerenciador FAQ da interface do atendente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} =
        'O número máximo de artigos FAQ para ser exibido no resultado do Gerenciador FAQ da interface do cliente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} =
        'O número máximo de artigos FAQ para ser exibido no resultado do Gerenciador FAQ da interface pública.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} =
        'O número máximo de artigos FAQ para ser exibido no jornal FAQ da interface do atendente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} =
        'O número máximo de artigos FAQ para ser exibido no resultado de uma pesquisa na interface do atendente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} =
        'O número máximo de artigos FAQ para ser exibido no resultado de uma pesquisa na interface do cliente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} =
        'O número máximo de artigos FAQ para ser exibido no resultado de uma pesquisa na interface publica.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the agent interface.'} =
        'Tamanho máximo de títulos em um artigo FAQ a serem exibidos na lista de entradas da FAQ da interface de atendente.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the customer interface.'} =
        'Tamanho máximo de títulos em um artigo FAQ a serem exibidos na lista de entradas da FAQ da interface de cliente.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Explorer in the public interface.'} =
        'Tamanho máximo de títulos em um artigo FAQ a serem exibidos na lista de entradas da FAQ da interface pública.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the agent interface.'} =
        'Tamanho máximo de títulos em um artigo FAQ a serem exibidos na Pesquisa de FAQ da interface de atendente.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the customer interface.'} =
        'Tamanho máximo de títulos em um artigo FAQ a serem exibidos na Pesquisa de FAQ da interface de cliente.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ Search in the public interface.'} =
        'Tamanho máximo de títulos em um artigo FAQ a serem exibidos na Pesquisa de FAQ da interface pública.';
    $Self->{Translation}->{'Maximum size of the titles in a FAQ article to be shown in the FAQ journal in the agent interface.'} =
        'Tamanho máximo de títulos em um artigo FAQ a serem exibidos no Jornal FAQ da interface de atendente.';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the customer interface.'} =
        '';
    $Self->{Translation}->{'Module to generate HTML OpenSearch profile for short FAQ search in the public interface.'} =
        'Módulo para gerar perfil HTML OpenSearch para pesquisas curtas de FAQ na interface pública.';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short FAQ search.'} =
        '';
    $Self->{Translation}->{'New FAQ Article'} = 'Novo artigo FAQ';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'Novos artigos FAQ precisam de aprovação antes de ser publicados.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} =
        'Número de artigos FAQ para ser exibido no Gerenciador FAQ da interface do cliente';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} =
        'Número de artigos FAQ para ser exibido no Gerenciador FAQ da interface publica';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} =
        'Número de artigos FAQ para ser exibido em cada página de um resultado de pesquisa na interface do cliente';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} =
        'Número de artigos FAQ para ser exibido em cada página de um resultado de pesquisa na interface publica';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'Número de itens mostrados em últimas alterações.';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'Número de itens mostrados em últimas criações.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'Número de itens mostrados no recurso top 10.';
    $Self->{Translation}->{'Output filter to add Java-script to CustomerTicketMessage screen.'} =
        '';
    $Self->{Translation}->{'Output limit for the related FAQ articles.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} =
        'Parâmetros de páginas (nas quais os itens FAQ são mostrados) da visão geral pequena do jornal FAQ.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} =
        'Parâmetros de páginas (nas quais os itens FAQ são mostrados) da visão geral pequena de FAQ.';
    $Self->{Translation}->{'Print this FAQ'} = 'Imprimir este FAQ';
    $Self->{Translation}->{'Public FAQ Print.'} = 'Imprimir FAQ público.';
    $Self->{Translation}->{'Public FAQ Zoom.'} = 'Zoom em FAQ público.';
    $Self->{Translation}->{'Public FAQ search.'} = 'Busca FAQ público.';
    $Self->{Translation}->{'Public FAQ.'} = 'FAQ público.';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'Fila para a aprovação dos artigos FAQ.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = 'Condição para a avaliação. Chave deve ser em percentual.';
    $Self->{Translation}->{'S'} = 'S';
    $Self->{Translation}->{'Search FAQ'} = 'Pesquisa FAQ';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        'Configura a altura padrão (em pixels) de campos HTML embutidos no AgentFAQZoom.';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        'Configura a altura padrão (em pixels) de campos HTML embutidos em CustomerFAQZoom (e PublicFAQZoom).';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentFAQZoom.'} =
        'Configura a altura máxima (em pixels) de campos HTML embutidos no AgentFAQZoom.';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} =
        'Configura a altura máxima (em pixels) de campos HTML embutidos em CustomerFAQZoom (e PublicFAQZoom).';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        'Mostra botão "Inserir Link FAQ" em Ampliação pequena para o artigos FAQ públicos';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" / "Insert Full FAQ & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} =
        'Mostrar botões "Inserir texto do FAQ e link" / "Inserir todo o FAQ e link" em AgentFAQZoomSmall para Artigos de FAQ públicos.';
    $Self->{Translation}->{'Show "Insert FAQ Text" / "Insert Full FAQ" Button in AgentFAQZoomSmall.'} =
        'Mostrar botões "Inserir texto do FAQ" / "Inserir todo o FAQ" em AgentFAQZoomSmall.';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'Mostrar artigo FAQ com HTML.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'Mostrar caminho FAQ sim / não.';
    $Self->{Translation}->{'Show invalid items in the FAQ Explorer result of the agent interface.'} =
        '';
    $Self->{Translation}->{'Show items of subcategories.'} = 'Mostrar itens de subcategorias.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'Mostrar as últimas alterações de itens em interfaces definidas.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'Mostrar os últimos itens criados em interfaces definidas.';
    $Self->{Translation}->{'Show the stars for the articles with a rating equal or greater like the defined value (set value \'0\' to deactive the output).'} =
        '';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'Mostrar os 10 itens superior em interfaces definidas.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'Mostrar votação em interfaces definidas.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} =
        'Mostra um link no menu que permite ligar um FAQ com outro objeto no modo de exibição ampliada na interface do atendente.';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} =
        'Mostra um link no menu que permite excluir um FAQ no modo de exibição ampliada na interface do atendente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} =
        'Mostra um link no menu para acessar o histórico de um FAQ no modo de exibição ampliada na interface do atendente.';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para editar um FAQ no modo de exibição ampliada na interface do atendente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} =
        'Mostra um link no menu para voltar um FAQ no modo de exibição ampliada na interface do atendente.';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} =
        'Mostra um link no menu para imprimir um FAQ no modo de exibição ampliada na interface do atendente.';
    $Self->{Translation}->{'Solution'} = 'Solução';
    $Self->{Translation}->{'Symptom'} = 'Sintoma';
    $Self->{Translation}->{'Text Only'} = 'Apenas texto';
    $Self->{Translation}->{'The default languages for the related FAQ articles.'} = '';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} =
        'O identificador para um FAQ, exemplo FAQ # KB # # MyFAQ. O padrão é FAQ #.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} =
        'Essa configuração define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'FAQ\' usando o tipo de vínculo \'Normal\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Essa configuração define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'FAQ\' usando o tipo de vínculo \'Pai e filho\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} =
        'Essa configuração define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'Chamado\' usando o tipo de vínculo \'Normal\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} =
        'Essa configuração define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'Chamado\' usando o tipo de vínculo \'Pai e filho\'';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'Corpo do chamado para aprovação de um artigo FAQ.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'O assunto do chamado para aprovação de um artigo FAQ.';
    $Self->{Translation}->{'Toolbar Item for a shortcut.'} = 'Item da barra de ferramentas para um atalho. ';
    $Self->{Translation}->{'external (customer)'} = 'externo (cliente)';
    $Self->{Translation}->{'internal (agent)'} = 'interno (atendente)';
    $Self->{Translation}->{'public (public)'} = 'público (público)';

}

1;
