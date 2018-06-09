# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'Criar Nova Pesquisa';
    $Self->{Translation}->{'Introduction'} = 'Introdução';
    $Self->{Translation}->{'Survey Introduction'} = 'Introdução da Pesquisa';
    $Self->{Translation}->{'Notification Body'} = 'Corpo da Notificação';
    $Self->{Translation}->{'Internal Description'} = 'Descrição Interna';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'Editar Informações Gerais';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Editar Perguntas';
    $Self->{Translation}->{'Survey Questions'} = 'Perguntas da Pesquisa';
    $Self->{Translation}->{'Add Question'} = 'Adicionar Pergunta';
    $Self->{Translation}->{'Type the question'} = 'Escreva a pergunta';
    $Self->{Translation}->{'Answer required'} = 'Resposta requerida';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Nenhuma questão salva para esta pesquisa.';
    $Self->{Translation}->{'Question'} = 'Pergunta';
    $Self->{Translation}->{'Answer Required'} = 'Resposta Requerida';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        'Quando você terminar de editar as questões da pesquisa, apenas feche a tela.';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'Você realmente deseja excluir essa questão? TODOS os dados associados serão PERDIDOS!';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = 'Editar Pergunta';
    $Self->{Translation}->{'go back to questions'} = 'voltar às perguntas';
    $Self->{Translation}->{'Question:'} = 'Questão:';
    $Self->{Translation}->{'Possible Answers For'} = 'Possíveis Respostas Para';
    $Self->{Translation}->{'Add Answer'} = 'Adicionar Resposta';
    $Self->{Translation}->{'No answers saved for this question.'} = 'Não há respostas salvas para esta questão';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = 'Você realmente quer excluir essa resposta ?';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'Esta pergunta não possui várias respostas, uma área de texto será mostrada';
    $Self->{Translation}->{'Edit Answer'} = 'Editar Resposta';
    $Self->{Translation}->{'go back to edit question'} = 'voltar para editar pergunta';
    $Self->{Translation}->{'Answer:'} = 'Resposta:';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = 'Qtd. máx. de pesquisas exibidas por página';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Remetente da Notificação';
    $Self->{Translation}->{'Notification Subject'} = 'Assunto da Notificação';
    $Self->{Translation}->{'Changed By'} = 'Modificado por';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = 'Resumo de Estatísticas de';
    $Self->{Translation}->{'Requests Table'} = 'Tabela de Requisições';
    $Self->{Translation}->{'Send Time'} = 'Hora de Envio';
    $Self->{Translation}->{'Vote Time'} = 'Hora do Voto';
    $Self->{Translation}->{'See Details'} = 'Ver detalhes';
    $Self->{Translation}->{'Survey Stat Details'} = 'Detalhes de Estatísticas da Pesquisa';
    $Self->{Translation}->{'go back to stats overview'} = 'voltar ao resumo de estatísticas';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Informação da Pesquisa';
    $Self->{Translation}->{'Sent requests'} = 'Solicitações enviadas';
    $Self->{Translation}->{'Received surveys'} = 'Solicitações recebidas';
    $Self->{Translation}->{'Survey Details'} = 'Detalhes da Pesquisa';
    $Self->{Translation}->{'Ticket Services'} = 'Serviço do chamado';
    $Self->{Translation}->{'Survey Results Graph'} = 'Gráficos de Resultados da Pesquisa';
    $Self->{Translation}->{'No stat results.'} = 'Sem resultados de estatísticas.';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Pesquisa';
    $Self->{Translation}->{'Please answer these questions'} = 'Por favor, responda estas questões';
    $Self->{Translation}->{'Show my answers'} = 'Mostrar minhas respostas';
    $Self->{Translation}->{'These are your answers'} = 'Estas são suas respostas';
    $Self->{Translation}->{'Survey Title'} = 'Título da Pesquisa';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = 'Adicionar Nova Pesquisa';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = 'Você não tem permissão para esta pesquisa!';
    $Self->{Translation}->{'No SurveyID is given!'} = 'Nenhum ID da Pesquisa informado!';
    $Self->{Translation}->{'Survey Edit'} = 'Editar Pesquisa';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = 'Você não tem permissão para esta pesquisa ou pergunta!';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = 'Você não tem permissão para esta pesquisa, pergunta ou resposta!';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Editar Perguntas da Pesquisa';
    $Self->{Translation}->{'Yes/No'} = 'Sim/Não';
    $Self->{Translation}->{'Radio (List)'} = 'Radio (Lista)';
    $Self->{Translation}->{'Checkbox (List)'} = 'Checkbox (Lista)';
    $Self->{Translation}->{'Question Type'} = 'Tipo de questão';
    $Self->{Translation}->{'Complete'} = 'Completo';
    $Self->{Translation}->{'Incomplete'} = 'Incompleto';
    $Self->{Translation}->{'Question Edit'} = 'Edição de Pergunta';
    $Self->{Translation}->{'Answer Edit'} = 'Edição de Resposta';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = 'Resumo de Estatísticas';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = 'Você não tem permissão para esta pesquisa ou detalhes de estatísticas!';
    $Self->{Translation}->{'Stats Detail'} = 'Detalhe da estatística';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'Não é possível configurar o novo estado. Nenhuma questão definida.';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = 'Não é possível definir novo status! Perguntas incompletas.';
    $Self->{Translation}->{'Status changed.'} = 'Estado alterado.';
    $Self->{Translation}->{'- No queue selected -'} = 'Nenhuma fila selecionada';
    $Self->{Translation}->{'- No ticket type selected -'} = '- Nenhum tipo de chamado selecionado -';
    $Self->{Translation}->{'- No ticket service selected -'} = '- Nenhum serviço de chamado selecionado -';
    $Self->{Translation}->{'- Change Status -'} = '- Alterar Estado -';
    $Self->{Translation}->{'master'} = 'mestre';
    $Self->{Translation}->{'New Status'} = 'Novo estado';
    $Self->{Translation}->{'Survey Description'} = 'Descrição da Pesquisa';
    $Self->{Translation}->{'answered'} = 'Respondido';
    $Self->{Translation}->{'not answered'} = 'Não respondido';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'Obrigado pela sua participação.';
    $Self->{Translation}->{'The survey is finished.'} = 'A pesquisa está finalizada.';
    $Self->{Translation}->{'Survey Message!'} = 'Mensagem da Pesquisa!';
    $Self->{Translation}->{'Module not enabled.'} = 'Módulo não habilitado.';
    $Self->{Translation}->{'This functionality is not enabled, please contact your administrator.'} =
        'Esta funcionalidade não está ativa, por favor contate seu administrador.';
    $Self->{Translation}->{'Survey Error!'} = 'Erro na Pesquisa!';
    $Self->{Translation}->{'Invalid survey key.'} = 'Chave da pesquisa inválida.';
    $Self->{Translation}->{'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'} =
        'A chave da pesquisa inserida é inválida, se você acessou um link, talvez ele esteja obsoleto ou quebrado.';
    $Self->{Translation}->{'Survey Vote'} = 'Voto da Pesquisa';
    $Self->{Translation}->{'Survey Vote Data'} = 'Dados do voto da pesquisa';
    $Self->{Translation}->{'You have already answered the survey.'} = 'Você já respondeu a pesquisa.';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Um Módulo de Pesquisa.';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Um módulo para editar perguntas de pesquisa.';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        'Todos os parâmetros para a Pesquisa na interface do agente.';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        'Intervalo de dias após enviar um e-mail de pesquisa dentro do qual novas requisições de pesquisa não serão enviadas para o mesmo cliente. Selecionar 0 irá sempre enviar o e-mail de pesquisa.';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        'Corpo padrão para o e-mail de notificação de clientes sobre nova pesquisa.';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        'Remetente padrão para o e-mail de notificação de clientes sobre nova pesquisa.';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        'Assunto padrão para o e-mail de notificação de clientes sobre nova pesquisa.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        'Define o módulo de visão geral para exibir a visão pequena de uma lista de pesquisa.';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        'Define a máxima quantidade de pesquisas que são enviadas para um cliente a cada 30 dias (0 significa que não há máximo; todas as requisições de pesquisa serão enviadas).';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        'Define a quantidade de horas que um chamado deve estar fechado para envio de uma pesquisa (0 significa enviar imediatamente após fechamento). Nota: um envio tardio de pesquisa é feito pelo OTRS Daemon, sob ativação da configuração  \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' .';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        'Define a altura padrão para Richtext nos elementos da SurveyZoom';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        'Define a altura máxima para visualizações do Richtext nos elementos do SurveyZoom.';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        'Define as colunas exibidas na visão geral de pesquisa. Esta opção não tem efeito sobre a posição das colunas.';
    $Self->{Translation}->{'Edit survey general information.'} = 'Editar informação geral da pesquisa.';
    $Self->{Translation}->{'Edit survey questions.'} = 'Editar as questões da pesquisa.';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        'Habilita ou desabilita a tela ShowVoteData na interface pública para exibir dados do resultado de uma pesquisa específica quando o cliente tenta responder uma pesquisa pela segunda vez.';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = 'Ativa ou desativa verificação de condições de serviços para envio.';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        'Ativa ou desativa verificação de condições de tipos para envio.';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        'Registro de módulo de interface para adição de pesquisa na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        'Registro de módulo de interface para edição de pesquisa na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        'Registro de módulo de interface para estatística de pesquisa na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        'Registro de módulo de interface para detalhes de pesquisa na interface de atendente.';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        'Registro de módulo de interface para o objeto PublicSurvey na área de pesquisa pública.';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'Se esta regex for encontrada, nenhuma pesquisa será enviado para o cliente';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        'Parâmetros para as páginas (nas quais as pesquisas são mostradas) da visão geral de pesquisa pequena.';
    $Self->{Translation}->{'Public Survey.'} = 'Pesquisa Pública';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        'Exibe um link no menu para editar uma pesquisa em sua visão de detalhes na interface de atendente.';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        'Exibe um link no menu para editar questões de pesquisa em sua visão de detalhes na interface de atendente.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        'Exibe um link no menu para voltar da visão de detalhes de uma pesquisa na interface de atendente.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        'Exibe um link no menu para detalhar as estatísticas da pesquisa em sua visão de detalhes na interface de atendente.';
    $Self->{Translation}->{'Stats Details'} = 'Detalhes da estatística';
    $Self->{Translation}->{'Survey Add Module.'} = 'Módulo de adição de pesquisa.';
    $Self->{Translation}->{'Survey Edit Module.'} = 'Módulo de edição de pesquisa';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = 'Limite da Visão Geral de Pesquisa "Pequena"';
    $Self->{Translation}->{'Survey Stats Module.'} = 'Módulo de Estatísticas de Pesquisa';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'Módulo de Detalhe de Pesquisa.';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = 'Limite de pesquisa por página para Visão Geral da pesquisa "Pequeno".';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = 'As pesquisas não será enviadas para os endereços de e-mail configurados.';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        'O identificador de uma pesquisa, ex. Pesquisa#, MinhaPesquisa#. O padrão é Pesquisa#.';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        'Módulo de evento de chamado para enviar requisições de pesquisa via e-mail automaticamente para clientes se um chamado for fechado.';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = 'Disparar o envio de solicitações de pesquisa atrasadas.';
    $Self->{Translation}->{'Zoom into statistics details.'} = 'Zoom em detalhes de estatísticas.';

}

1;
