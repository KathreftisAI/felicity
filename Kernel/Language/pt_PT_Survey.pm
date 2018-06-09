# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# Copyright (C) 2012 FCCN - Rui Francisco <rui.francisco@fccn.pt>
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_PT_Survey;

use utf8;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurvey
    $Self->{Translation}->{'Create New Survey'} = 'Criar novo inquérito';
    $Self->{Translation}->{'Introduction'} = 'Introdução';
    $Self->{Translation}->{'Internal Description'} = 'Descrição interna';
    $Self->{Translation}->{'Survey Edit'} = 'Editar inquérito';
    $Self->{Translation}->{'General Info'} = 'Informação genérica';
    $Self->{Translation}->{'Stats Overview'} = 'Vista de estado';
    $Self->{Translation}->{'Requests Table'} = 'Tabela de pedidos';
    $Self->{Translation}->{'Send Time'} = 'Hora de envio';
    $Self->{Translation}->{'Vote Time'} = 'Hora de resposta';
    $Self->{Translation}->{'Details'} = 'Detalhes';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Não existem perguntas no inquérito';
    $Self->{Translation}->{'Survey Stat Details'} = 'Estatística detalha do inquérito';
    $Self->{Translation}->{'go back to stats overview'} = 'voltar à vista de estatísticas';
    $Self->{Translation}->{'Go back'} = 'voltar';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Survey Edit Questions'} = 'Editar perguntas';
    $Self->{Translation}->{'Add Question'} = 'Adicionar pergunta';
    $Self->{Translation}->{'Type the question'} = 'Escrever a pergunta';
    $Self->{Translation}->{'Survey Questions'} = 'Perguntas do inquérito';
    $Self->{Translation}->{'Question'} = 'Pergunta';
    $Self->{Translation}->{'Edit Question'} = 'Editar pergunta';
    $Self->{Translation}->{'go back to questions'} = 'voltar às perguntas';
    $Self->{Translation}->{'Possible Answers For'} = 'Respostas possíveis';
    $Self->{Translation}->{'Add Answer'} = 'Adicionar resposta';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} = 'Não existem várias respostas, vai ser mostrada uma área de texto';
    $Self->{Translation}->{'Edit Answer'} = 'Editar resposta';
    $Self->{Translation}->{'go back to edit question'} = 'voltar à edição da pergunta';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Definições de contexto';
    $Self->{Translation}->{'Max. shown Surveys per page'} = 'Número de inquéritos por página';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Remetente da notificação';
    $Self->{Translation}->{'Notification Subject'} = 'Assunto da notificação';
    $Self->{Translation}->{'Notification Body'} = 'Texto da notificação';
    $Self->{Translation}->{'Created Time'} = 'Criado em';
    $Self->{Translation}->{'Created By'} = 'Criado por';
    $Self->{Translation}->{'Changed Time'} = 'Modificado em';
    $Self->{Translation}->{'Changed By'} = 'Modificado por';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Informação de inquérito';
    $Self->{Translation}->{'Sent requests'} = 'Pedidos enviados';
    $Self->{Translation}->{'Received surveys'} = 'Inquéritos respondidos';
    $Self->{Translation}->{'Edit General Info'} = 'Editar informação genérica';
    $Self->{Translation}->{'Edit Questions'} = 'Editar perguntas';
    $Self->{Translation}->{'Stats Details'} = 'Detalhes de estatísticas';
    $Self->{Translation}->{'Survey Details'} = 'Detalhes do inquérito';
    $Self->{Translation}->{'Survey Results Graph'} = 'Gráfico de resultados do inquérito';
    $Self->{Translation}->{'No stat results.'} = 'Número de respostas';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Inquérito';
    $Self->{Translation}->{'Please answer the next questions'} = 'Pro favor, responda às seguintes perguntas';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Módulo de inquéritos';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Módulo para editar as perguntas dos inquéritos';
    $Self->{Translation}->{'Days starting from the latest customer survey email between no customer survey email is sent, ( 0 means Always send it ) .'} = 'Número de dias entre envio notificações por cliente, (0 significa enviar sempre)';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} = 'Corpo por omissão do email da notificação de inquérito';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} = 'Remetente por omissão do email da notificação de inquérito';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} =
        '';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} = 'Assunto por omissão do email da notificação de inquérito';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} = 'Define a vista pequena com a lista de inquéritos';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the column.'} = 'Define as colunas a mostrar na vista de inquéritos. Não interfere com a posição das colunas';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} = 'Módulo de auto registo de inquéritos de cliente no interface de agente';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} = 'Módulo de auto registo de inquéritos de cliente no interface público';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'Se a expressão regular coincidir, não será enviado um inquérito.';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} = 'Parametrização das páginas da vista geral de inquéritos';
    $Self->{Translation}->{'Public Survey.'} = 'Inquérito público';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = 'Limite pequeno na vista de inquérito';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'Módulo de detalhe de inquérito';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small"'} = 'Número de inquéritos por página na vista pequena';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} = 'Identificador para os inquéritos. ex. Survey#, MySurvey#. Por omissão é Survey# ';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket gets closed.'} = 'Módulo de envio de notificações automáticas para clientes quando um ticket é fechado';

    $Self->{Translation}->{'Survey Introduction'} = 'Introdução';
    $Self->{Translation}->{'Survey Description'} = 'Descrição';
    $Self->{Translation}->{'This field is required'} = 'Campo obrigatório';
    $Self->{Translation}->{'Survey Introduction'} = 'Introdução';
    $Self->{Translation}->{'Survey Description'} = 'Descrição';
    $Self->{Translation}->{'Complete'} = 'Completo';
    $Self->{Translation}->{'Incomplete'} = 'Incompleto';
    $Self->{Translation}->{'Survey#'} = '';
    $Self->{Translation}->{'Default value'} = 'Valor por omissão';

    $Self->{Translation}->{'Enable or disable the ShowVoteData screen on public interface to show data of an specific votation when customer tries to answer a survey by second time.'} = 'Ativa ou inativa o ecrã ShowVoteData no interface público, quando o cliente tenta responder ao inquérito pela segunda vez';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} = 'Todos os parâmetros para o objeto Inquérito no interface de agente';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} = 'Define a altura por omissão para o editor rtf para os elementos do inquérito';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #

}

1;
