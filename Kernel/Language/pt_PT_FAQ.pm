# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# Copyright (C) 2012 FCCN - Rui Francisco <rui.francisco@fccn.pt>
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_PT_FAQ;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAFAQ
    $Self->{Translation}->{'internal'} = 'interno';
    $Self->{Translation}->{'public'} = 'público';
    $Self->{Translation}->{'external'} = 'externo';
    $Self->{Translation}->{'FAQ Number'} = 'Número FAQ';
    $Self->{Translation}->{'LatestChangedItems'} = 'Artigos modificados recentemente';
    $Self->{Translation}->{'LatestCreatedItems'} = 'Últimos artigos adicionados';
    $Self->{Translation}->{'Top10Items'} = 'Os 10 artigos mais acedidos';
    $Self->{Translation}->{'SubCategoryOf'} = 'Subcategoria de';
    $Self->{Translation}->{'No rate selected!'} = 'Selecione a pontuação!';
    $Self->{Translation}->{'public (all)'} = 'público (todos)';
    $Self->{Translation}->{'external (customer)'} = 'externo (cliente)';
    $Self->{Translation}->{'internal (agent)'} = 'interno (agente)';
    $Self->{Translation}->{'StartDay'} = 'Dia de início';
    $Self->{Translation}->{'StartMonth'} = 'Mês de início';
    $Self->{Translation}->{'StartYear'} = 'Ano de início';
    $Self->{Translation}->{'EndDay'} = 'Dia de fim';
    $Self->{Translation}->{'EndMonth'} = 'Mês de fim';
    $Self->{Translation}->{'EndYear'} = 'Ano de fim';
    $Self->{Translation}->{'Thanks for your vote!'} = 'Obrigado pela sua colaboração';
    $Self->{Translation}->{'You have already voted!'} = 'Já participou!';
    $Self->{Translation}->{'FAQ Article Print'} = 'Imprimir Artigo FAQ';
    $Self->{Translation}->{'FAQ Articles (Top 10)'} = 'Artigos FAQ (Top 10)';
    $Self->{Translation}->{'FAQ Articles (new created)'} = 'Artigos FAQ (criado novo)';
    $Self->{Translation}->{'FAQ Articles (recently changed)'} = 'Artigos FAQ (alterados recentemente)';
    $Self->{Translation}->{'FAQ category updated!'} = 'Categoria FAQ atualizada!';
    $Self->{Translation}->{'FAQ category added!'} = 'Categoria FAQ adicionada!';
    $Self->{Translation}->{'A category should have a name!'} = 'A categoria precisa ter um nome!';
    $Self->{Translation}->{'This category already exists'} = 'Esta categoria já existe!';
    $Self->{Translation}->{'FAQ language added!'} = 'Idioma FAQ adicionado!';
    $Self->{Translation}->{'FAQ language updated!'} = 'Idioma FAQ  atualizado!';
    $Self->{Translation}->{'The name is required!'} = 'O nome é obrigatório!';
    $Self->{Translation}->{'This language already exists!'} = 'O idioma já existe!';

    # Template: AgentFAQAdd
    $Self->{Translation}->{'Add FAQ Article'} = 'Adicionar Artigo de FAQ';
    $Self->{Translation}->{'A category is required.'} = 'A categoria é obrigatória.';
    $Self->{Translation}->{'Approval'} = 'Aprovação';

    # Template: AgentFAQCategory
    $Self->{Translation}->{'FAQ Category Management'} = 'Gestão de Categoria de FAQ';
    $Self->{Translation}->{'Add category'} = 'Adicionar categoria';
    $Self->{Translation}->{'Delete Category'} = 'Apagar Categoria';
    $Self->{Translation}->{'Ok'} = 'Ok';
    $Self->{Translation}->{'Add Category'} = 'Adicionar categoria';
    $Self->{Translation}->{'Edit Category'} = 'Alterar categoria';
    $Self->{Translation}->{'Will be shown as comment in Explorer.'} = 'Será exibido como comentário no browser';
    $Self->{Translation}->{'Please select at least one permission group.'} = 'Por favor, selecione pelo menos um grupo de permissão.';
    $Self->{Translation}->{'Agent groups that can access articles in this category.'} = 'Grupos de agentes que podem aceder aos artigos nesta categoria.';
    $Self->{Translation}->{'Do you really want to delete this category?'} = 'Deseja apagar esta categoria?';
    $Self->{Translation}->{'You can not delete this category. It is used in at least one FAQ artigo and/or is parent of at least one other category'} = 'Não pode apagar esta categoria. É usada em pelo menos um artigo FAQ e/ou é pai de pelo menos uma outra categoria!';
    $Self->{Translation}->{'This category is used in the following FAQ article(s)'} = 'Esta categoria é utilizada no(s) seguinte(s) artigo(s) FAQ';
    $Self->{Translation}->{'This category is parent of the following subcategories'} = 'Esta categoria é pai das seguintes sub-categorias';

    # Template: AgentFAQDelete
    $Self->{Translation}->{'Do you really want to delete this FAQ article?'} = 'Deseja apagar este artigo FAQ?';

    # Template: AgentFAQEdit
    $Self->{Translation}->{'FAQ'} = 'FAQ';

    # Template: AgentFAQExplorer
    $Self->{Translation}->{'FAQ Explorer'} = 'Explorador FAQ';
    $Self->{Translation}->{'Quick Search'} = 'Pesquisa Rápida';
    $Self->{Translation}->{'Advanced Search'} = 'Pesquisa Avançada';
    $Self->{Translation}->{'Subcategories'} = 'Sub-categorias';
    $Self->{Translation}->{'FAQ Articles'} = 'Artigos FAQ';
    $Self->{Translation}->{'No subcategories found.'} = 'Subcategorias não encontradas.';

    # Template: AgentFAQHistory

    # Template: AgentFAQJournalOverviewSmall
    $Self->{Translation}->{'No FAQ Journal data found.'} = 'Não foram encontrados dados de Jornal FAQ.';

    # Template: AgentFAQLanguage
    $Self->{Translation}->{'FAQ Language Management'} = 'Gestão de Idiomas FAQ';
    $Self->{Translation}->{'Use this feature if you want to work with multiple languges.'} = 'Utilize esta funcionalAntiguidade caseo deseja trabalhar com múltiplos idiomas.';
    $Self->{Translation}->{'Add language'} = 'Adicionar idioma';
    $Self->{Translation}->{'Delete Language %s'} = 'Apagar idioma %s';
    $Self->{Translation}->{'Add Language'} = 'Adicionar idioma';
    $Self->{Translation}->{'Edit Language'} = 'Editar idioma';
    $Self->{Translation}->{'Do you really want to delete this language?'} = 'Deseja apagar este idioma?';
    $Self->{Translation}->{'You can not delete this language. It is used in at least one FAQ article!'} = 'Não pode apagar este idioma. É usado em pelo menos um artigo FAQ!';
    $Self->{Translation}->{'This language is used in the following FAQ Article(s)'} = 'Este idioma é usado nos seguintes artigo(s) FAQ';

    # Template: AgentFAQOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Configurações de Contexto';
    $Self->{Translation}->{'FAQ articles per page'} = 'Artigos FAQ por página';

    # Template: AgentFAQOverviewSmall
    $Self->{Translation}->{'No FAQ data found.'} = 'Não foram encontrados dados de FAQ.';

    # Template: AgentFAQPrint
    $Self->{Translation}->{'FAQ-Info'} = 'FAQ Informação';
    $Self->{Translation}->{'Votes'} = 'Votos';

    # Template: AgentFAQSearch

    # Template: AgentFAQSearchOpenSearchDescriptionFAQNumber

    # Template: AgentFAQSearchOpenSearchDescriptionFulltext
    $Self->{Translation}->{'FAQFulltext'} = 'FAQ-TextoCompleto';

    # Template: AgentFAQSearchResultPrint

    # Template: AgentFAQSearchSmall
    $Self->{Translation}->{'FAQ Search'} = 'Pesquisa FAQ';

    # Template: AgentFAQZoom
    $Self->{Translation}->{'FAQ Information'} = 'Informação FAQ';
    $Self->{Translation}->{'Rating'} = 'Nota';
    $Self->{Translation}->{'Rating %'} = 'Nota %';
    $Self->{Translation}->{'out of 5'} = 'reduzido de 5';
    $Self->{Translation}->{'No votes found!'} = 'Nenhum voto encontrado!';
    $Self->{Translation}->{'No votes found! Be the first one to rate this FAQ article.'} = 'Nenhum voto encontrado! Seja o primeiro a avaliar este artigo FAQ.';
    $Self->{Translation}->{'Download Attachment'} = 'Descarregar anexos';
    $Self->{Translation}->{'ArticleVotingQuestion'} = 'Este artigo foi útil ?';
    $Self->{Translation}->{'not helpful'} = 'não ajuda';
    $Self->{Translation}->{'very helpful'} = 'muito útil';

    # Template: AgentFAQZoomSmall
    $Self->{Translation}->{'Insert FAQ Text'} = 'FAQ Inserir Texto';
    $Self->{Translation}->{'Insert FAQ Link'} = 'FAQ Inserir Link';
    $Self->{Translation}->{'Insert FAQ Text & Link'} = 'FAQ Inserir Texto e Link';

    # Template: CustomerFAQExplorer
    $Self->{Translation}->{'No FAQ articles found.'} = 'Nenhum artigo FAQ encontrado.';

    # Template: CustomerFAQPrint

    # Template: CustomerFAQSearch
    $Self->{Translation}->{'Fulltext search in FAQ articles (e. g. "John*n" or "Will*")'} = 'Pesquisa completa de textos em artigos FAQ (por exemplo, "Jo*o" or "Will*")';

    # Template: CustomerFAQSearchOpenSearchDescription

    # Template: CustomerFAQSearchResultPrint

    # Template: CustomerFAQSearchResultShort

    # Template: CustomerFAQZoom
    $Self->{Translation}->{'Details'} = 'Detalhes';
    $Self->{Translation}->{'Search for articles with keyword'} = 'Pesquise por artigos com palavras-chave';

    # Template: PublicFAQExplorer

    # Template: PublicFAQPrint

    # Template: PublicFAQSearch

    # Template: PublicFAQSearchOpenSearchDescription
    $Self->{Translation}->{'Public'} = 'Público';

    # Template: PublicFAQSearchResultPrint

    # Template: PublicFAQSearchResultShort

    # Template: PublicFAQZoom

    # SysConfig
    $Self->{Translation}->{'A filter for HTML output to add links behind a defined string. The element Image allows two input kinds. First the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possibility is to insert the link to the image.'} = 'Um filtro de saída HTML para adicionar links para atrás uma seqüência definida. O elemento de imagem permite dois tipos de entrada. Primeiro, o nome da imagem (ex:faq.png). Neste caso, o caminho da imagem OTRS será utilizado. A segunda permite inserir o link para a imagem.';
    $Self->{Translation}->{'CSS color for the voting result.'} = 'Côr CSS para o resultado da votação.';
    $Self->{Translation}->{'Category Management'} = 'Gestão de Categorias';
    $Self->{Translation}->{'Decimal places of the voting result.'} = 'Casas decimais do resultado da votação.';
    $Self->{Translation}->{'Default category name.'} = 'Nome por omissão de categoria.';
    $Self->{Translation}->{'Default language for FAQ articles on single language mode.'} = 'Idioma por omissão para os artigos FAQ no modo de idioma único.';
    $Self->{Translation}->{'Default priority of tickets for the approval of FAQ articles.'} = 'Prioridade por omissão de tickets para aprovação dos artigos FAQ.';
    $Self->{Translation}->{'Default state for FAQ entry.'} = 'Estado por omissão de entrada FAQ.';
    $Self->{Translation}->{'Default state of tickets for the approval of FAQ articles.'} = 'Estado por omissão de tickets para aprovação dos artigos FAQ.';
    $Self->{Translation}->{'Default value for the Action parameter for the public frontend. The Action parameter is used in the scripts of the system.'} = 'Valor por omissão para o parâmetro de Recurso na interface pública. O parâmetro de ação é utilizado nos scripts do sistema.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ journal.'} = 'Define um módulo de resumo para mostrar a vista pequena de um jornal FAQ.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a FAQ list.'} = 'Define um módulo de resumo para mostrar a visualizar de uma pequena lista de FAQ.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the agent interface.'} = 'Define o atributo por omissão FAQ para classificar a FAQ numa pesquisa FAQ no interface do agente.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the customer interface.'} = 'Define o atributo por omissão FAQ para classificar a FAQ numa pesquisa FAQ no interface do cliente.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ search of the public interface.'} = 'Define o atributo por omissão FAQ para classificar a FAQ em uma pesquisa FAQ na interface pública.';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the agent interface.'} = 'Define o atributo por omissão FAQ para classificar o FAQ na gestão FAQ da interface do agente';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the customer interface.'} = 'Define o atributo por omissão FAQ para classificar o FAQ no Gerenciador FAQ da interface do cliente';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the FAQ Explorer of the public interface.'} = 'Define o atributo por omissão FAQ para classificar o FAQ na gestão FAQ da interface pública';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the agent interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem por omissão de FAQ no resultado da gestão FAQ da interface do agente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the customer interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem por omissão de FAQ no resultado na gestão FAQ da interface do cliente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order in the FAQ Explorer result of the public interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem por omissão de FAQ no resultado na gestão FAQ da interface pública. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the agent interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem por omissão de FAQ no resultado da pesquisa na interface do agente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the customer interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem por omissão de FAQ no resultado da pesquisa na interface do cliente. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the default FAQ order of a search result in the public interface. Up: oldest on top. Down: latest on top.'} = 'Define a ordem por omissão de FAQ no resultado da pesquisa na interface pública. Acima: A mais antiga no topo. Abaixo: mais recentes no topo.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ Explorer. This option has no effect on the position of the column.'} = 'Define as colunas mostradas na gestão FAQ. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ journal. This option has no effect on the position of the column.'} = 'Define as colunas mostradas no jornal FAQ. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines the shown columns in the FAQ search. This option has no effect on the position of the column.'} = 'Define as colunas mostradas na pesquisa FAQ. Esta opção não tem efeito sobre a posição da coluna.';
    $Self->{Translation}->{'Defines where the \'Insert FAQ\' link will be displayed. Note: AgentTicketActionCommon includes AgentTicketNote, AgentTicketClose, AgentTicketFreeText, AgentTicketOwner, AgentTicketPending, AgentTicketPriority and AgentTicketResponsible.'} = 'Define onde o link \'Inserir FAQ\' será exibido. Nota: Os Recurso comums do agente incluem Abrir ticket, Fechar ticket, ticket de Texto Livre, proprietário do ticket, ticket pendente, Prioridade e responsável do ticket.';
    $Self->{Translation}->{'Definition of FAQ item free text field.'} = 'Definição de campos de texto livre.';
    $Self->{Translation}->{'Delete this FAQ'} = 'Apagar esta FAQ!';
    $Self->{Translation}->{'Edit this FAQ'} = 'Editar esta FAQ';
    $Self->{Translation}->{'Enable multiple languages on FAQ module.'} = 'Permitir vários idiomas no módulo FAQ.';
    $Self->{Translation}->{'Enable voting mechanism on FAQ module.'} = 'Permitir mecanismo de Avaliação no módulo FAQ.';
    $Self->{Translation}->{'FAQ Journal'} = 'Jornal FAQ';
    $Self->{Translation}->{'FAQ Journal Overview "Small" Limit'} = 'Limite da vista "Pequena" do Jornal FAQ';
    $Self->{Translation}->{'FAQ Overview "Small" Limit'} = 'Limite da vista  FAQ "Pequeno"';
    $Self->{Translation}->{'FAQ limit per page for FAQ Journal Overview "Small"'} = 'Limite de FAQs por página na vista "Pequeno" do Jornal FAQ';
    $Self->{Translation}->{'FAQ limit per page for FAQ Overview "Small"'} = 'Limite de FAQs por página na vista "Pequena" de FAQ';
    $Self->{Translation}->{'FAQ path separator.'} = 'Delimitador de caminho FAQ.';
    $Self->{Translation}->{'FAQ search backend router of the agent interface.'} = 'Router de pesquisa FAQ na interface do agente.';
    $Self->{Translation}->{'FAQ-Area'} = 'Área FAQ';
    $Self->{Translation}->{'Frontend module registration for the public interface.'} = 'Frontend de registo do módulo para a interface pública.';
    $Self->{Translation}->{'Group for the approval of FAQ articles.'} = 'Grupo para a aprovação dos artigos FAQ.';
    $Self->{Translation}->{'History of this FAQ'} = 'Histórico da FAQ';
    $Self->{Translation}->{'Include internal fields on a FAQ based Ticket.'} = 'Incluir campos internos de um ticket baseado em FAQ.';
    $Self->{Translation}->{'Include the name of each field in a FAQ based Ticket.'} = 'Incluir o nome de cada campo num ticket baseado em FAQ.';
    $Self->{Translation}->{'Interfaces where the quicksearch should be shown.'} = 'Interfaces onde a busca rápida deve ser visualizada.';
    $Self->{Translation}->{'Journal'} = 'Jornal';
    $Self->{Translation}->{'Language Management'} = 'Gestão de idiomas';
    $Self->{Translation}->{'Languagekey which is defined in the language file *_FAQ.pm.'} = 'Idioma chave que está definido no arquivo de idioma *_FAQ.pm.';
    $Self->{Translation}->{'Link another object to this FAQ item'} = 'Link de outro artigo para esta FAQ';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the agent interface.'} = 'O número máximo de artigos FAQ visualizado na gestão FAQ da interface do agente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the customer interface.'} = 'O número máximo de artigos FAQ visualizado na gestão Gerenciador FAQ da interface do cliente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ Explorer result of the public interface.'} = 'O número máximo de artigos FAQ visualizado na gestão FAQ da interface pública.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the FAQ journal in the agent interface.'} = 'O número máximo de artigos FAQ visualizado no jornal FAQ da interface do agente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the agent interface.'} = 'O número máximo de artigos FAQ visualizado no resutlado de uma pesquisa no interface do agente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the customer interface.'} = 'O número máximo de artigos FAQ visualizado no resultado de uma pesquisa na interface do cliente.';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a search in the public interface.'} = 'O número máximo de artigos FAQ visualizado o no resultado de uma pesquisa na interface publica.';
    $Self->{Translation}->{'Module to generate html OpenSearch profile for short faq search.'} = 'Módulo para gerar html "OpenSearch"de pesquisa faq curta.';
    $Self->{Translation}->{'New FAQ Article'} = 'Novo artigo FAQ';
    $Self->{Translation}->{'New FAQ articles need approval before they get published.'} = 'Novos artigos FAQ precisam de aprovação antes de ser publicados.';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the customer interface.'} = 'Número de artigos FAQ visualizado na gestão FAQ do interface do cliente';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the FAQ Explorer of the public interface.'} = 'Número de artigos FAQ visualizado na gestão FAQ do interface publica';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the customer interface.'} = 'Número de artigos FAQ visualizado por página de resultados de pesquisa na interface do cliente';
    $Self->{Translation}->{'Number of FAQ articles to be displayed on each page of a search result in the public interface.'} = 'Número de artigos FAQ visualizado por página de resultados de pesquisa na interface publica';
    $Self->{Translation}->{'Number of shown items in last changes.'} = 'Número de itens visualizados nas últimas alterações.';
    $Self->{Translation}->{'Number of shown items in last created.'} = 'Número de itens visualizados nas últimas criações.';
    $Self->{Translation}->{'Number of shown items in the top 10 feature.'} = 'Número de itens visualizados em top 10.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ journal overview.'} = 'Parâmetros de páginas (nas quais os itens FAQ são visualizados) da vista pequena do jornal FAQ.';
    $Self->{Translation}->{'Parameters for the pages (in which the FAQ items are shown) of the small FAQ overview.'} = 'Parâmetros de páginas (nas quais os itens FAQ são visualizados) da vista pequena de FAQ.';
    $Self->{Translation}->{'Print this FAQ'} = 'Imprimir FAQ';
    $Self->{Translation}->{'Queue for the approval of FAQ articles.'} = 'Fila para aprovação dos artigos FAQ.';
    $Self->{Translation}->{'Rates for voting. Key must be in percent.'} = 'Condição para a avaliação. Chave em percentagem.';
    $Self->{Translation}->{'Search FAQ'} = 'Pesquisar FAQ';
    $Self->{Translation}->{'Show "Insert FAQ Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = 'Mostrar botão "Inserir Link FAQ" na vista pequena de artigos FAQ públicos';
    $Self->{Translation}->{'Show "Insert FAQ Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = 'Mostra botão "Inserir texto e Link FAQ" na vista pequena de artigos FAQ públicos';
    $Self->{Translation}->{'Show "Insert FAQ Text" Button in AgentFAQZoomSmall.'} = 'Mostrar botão "Inserir FAQ Texto" na vista para o agente.';
    $Self->{Translation}->{'Show FAQ Article with HTML.'} = 'Mostrar artigo FAQ com HTML.';
    $Self->{Translation}->{'Show FAQ path yes/no.'} = 'Mostrar caminho FAQ sim / não.';
    $Self->{Translation}->{'Show WYSIWYG editor in agent interface.'} = 'Mostrar editor WYSIWYG na interface do agente.';
    $Self->{Translation}->{'Show items of subcategories.'} = 'Mostrar subcategorias.';
    $Self->{Translation}->{'Show last change items in defined interfaces.'} = 'Mostrar as últimas alterações de itens em interfaces definidas.';
    $Self->{Translation}->{'Show last created items in defined interfaces.'} = 'Mostrar os últimos itens criados em interfaces definidas.';
    $Self->{Translation}->{'Show top 10 items in defined interfaces.'} = 'Mostrar as 10 mais visualizadas em interfaces definidas.';
    $Self->{Translation}->{'Show voting in defined interfaces.'} = 'Mostrar votação em interfaces definidas.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a FAQ with another object in the zoom view of such FAQ of the agent interface.'} = 'Mostra um link no menu que permite ligar a FAQ com outro objeto na vista do agente.';
    $Self->{Translation}->{'Shows a link in the menu that allows to delete a FAQ in its zoom view in the agent interface.'} = 'Mostra um link no menu que permite excluir um FAQ na vista na interface do agente.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a FAQ in its zoom view of the agent interface.'} = 'Mostra um link no menu para aceder ao histórico da FAQ na vista do agente.';
    $Self->{Translation}->{'Shows a link in the menu to edit a FAQ in the its zoom view of the agent interface.'} = 'Mostra um link no menu para editar uma FAQ na vista da interface do agente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the FAQ zoom view of the agent interface.'} = 'Mostra um link no menu para voltar uma FAQ na vista da interface do agente.';
    $Self->{Translation}->{'Shows a link in the menu to print a FAQ in the its zoom view of the agent interface.'} = 'Mostra um link no menu para imprimir uma FAQ na vista da interface do agente.';
    $Self->{Translation}->{'The identifier for a FAQ, e.g. FAQ#, KB#, MyFAQ#. The default is FAQ#.'} = 'O identificador para FAQ, exemplo FAQ # KB # # MyFAQ. O valor por omissão é FAQ #.';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'Normal\' link type.'} = 'Essa configuração define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'FAQ\' com ligação \'Normal\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'FAQ\' objects using the \'ParentChild\' link type.'} = 'Essa configuração define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'FAQ\' com ligação \'Pai e filho\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'Normal\' link type.'} = 'Essa configuração define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'Ticket\' com ligação \'Normal\'';
    $Self->{Translation}->{'This setting defines that a \'FAQ\' object can be linked with other \'Ticket\' objects using the \'ParentChild\' link type.'} = 'Essa configuração define que um objeto \'FAQ\' pode ser relacionado com outros objetos \'Ticket\' com ligação \'Pai e filho\'';
    $Self->{Translation}->{'Ticket body for approval of FAQ article.'} = 'Corpo do ticket para aprovação de um artigo FAQ.';
    $Self->{Translation}->{'Ticket subject for approval of FAQ article.'} = 'O assunto do ticket para aprovação de um artigo FAQ.';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in AgentFAQZoom.'} = '';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in AgentFAQZoom.'} = '';
    $Self->{Translation}->{'Set the default height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} = '';
    $Self->{Translation}->{'Set the maximum height (in pixels) of inline HTML fields in CustomerFAQZoom (and PublicFAQZoom).'} = '';
    $Self->{Translation}->{'Cache Time To Leave for FAQ items.'} = '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in a FAQ Explorer of the agent interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the explorer in the customer interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ attribute for FAQ sorting in the explorer in the public interface.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the explorer in the customer interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order in the explorer in the public interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Defines the default FAQ order of a Explorer result in the agent interface. Up: oldest on top. Down: latest on top.'} = '';
    $Self->{Translation}->{'Delete: '} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the explorer in the customer interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the explorer in the public interface.'} = '';
    $Self->{Translation}->{'Maximum number of FAQ articles to be displayed in the result of a Explorer in the agent interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in each page of a search result in the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in each page of a search result in the public interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the explorer in the customer interface.'} = '';
    $Self->{Translation}->{'Number of FAQ articles to be displayed in the explorer in the public interface.'} = '';
    $Self->{Translation}->{'Show "Insert Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert Text & Link" Button in AgentFAQZoomSmall for public FAQ Articles.'} = '';
    $Self->{Translation}->{'Show "Insert Text" Button in AgentFAQZoomSmall.'} = '';

}

1;
