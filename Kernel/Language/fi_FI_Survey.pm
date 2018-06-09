# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::fi_FI_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAASurvey
    $Self->{Translation}->{'- Change Status -'} = '- Muuta tilaa -';
    $Self->{Translation}->{'Add New Survey'} = 'Lisää uusi kysely';
    $Self->{Translation}->{'Survey Edit'} = 'Muokkaa kyselyä';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Muokkaa kysymyksiä';
    $Self->{Translation}->{'Question Edit'} = 'Kysymysten muokkaus';
    $Self->{Translation}->{'Answer Edit'} = 'Vastausten muokkaus';
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'Uuden tilan asettaminen ei onnistu! Et ole määrittänyt kysymyksiä!';
    $Self->{Translation}->{'Status changed.'} = 'Tila muutettu.';
    $Self->{Translation}->{'Thank you for your feedback.'} = 'Kiitos palautteestasi.';
    $Self->{Translation}->{'The survey is finished.'} = 'Kysely on valmis.';
    $Self->{Translation}->{'Complete'} = 'Valmis';
    $Self->{Translation}->{'Incomplete'} = 'Keskeneräinen';
    $Self->{Translation}->{'Checkbox (List)'} = 'Valitse yksi tai useampia (Lista)';
    $Self->{Translation}->{'Radio'} = 'Valitse yksi';
    $Self->{Translation}->{'Radio (List)'} = 'Valitse yksi monesta (Lista)';
    $Self->{Translation}->{'Stats Overview'} = 'Tulosten yhteenveto';
    $Self->{Translation}->{'Survey Description'} = 'Kyselyn kuvaus';
    $Self->{Translation}->{'Survey Introduction'} = 'Kyselyn esittely';
    $Self->{Translation}->{'Yes/No'} = 'Kyllä / Ei';
    $Self->{Translation}->{'YesNo'} = 'Kyllä / Ei';
    $Self->{Translation}->{'answered'} = 'Vastasi';
    $Self->{Translation}->{'not answered'} = 'Ei vastannut';
    $Self->{Translation}->{'Stats Detail'} = 'Yksityiskohtaiset tulokset';
    $Self->{Translation}->{'You have already answered the survey.'} = 'Olet jo vastannut tähän kyselyyn.';

    # Template: AgentSurvey
    $Self->{Translation}->{'Create New Survey'} = 'Luo uusi kysely';
    $Self->{Translation}->{'Introduction'} = 'Esittely';
    $Self->{Translation}->{'Internal Description'} = 'Sisäinen kuvaus';
    $Self->{Translation}->{'Edit General Info'} = 'Muokkaa tietoja';
    $Self->{Translation}->{'General Info'} = 'Yleiset tiedot';
    $Self->{Translation}->{'Stats Overview of'} = 'Tulosten yhteenveto';
    $Self->{Translation}->{'Requests Table'} = '';
    $Self->{Translation}->{'Send Time'} = 'Lähetysaika';
    $Self->{Translation}->{'Vote Time'} = 'Äänestysaika';
    $Self->{Translation}->{'Survey Stat Details'} = 'Kyselyn tulosten yksityiskohdat';
    $Self->{Translation}->{'go back to stats overview'} = 'mene takaisin yhteenvetoon';
    $Self->{Translation}->{'Go back'} = 'Takaisin';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Muokkaa kysymyksiä';
    $Self->{Translation}->{'Add Question'} = 'Lisää kysymys';
    $Self->{Translation}->{'Type the question'} = 'Syötä kysymys';
    $Self->{Translation}->{'Survey Questions'} = 'Kyselyn kysymykset';
    $Self->{Translation}->{'Question'} = 'Kysymys';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Kyselyyn ei ole tallennettu kysymyksiä.';
    $Self->{Translation}->{'Edit Question'} = 'Muokkaa kysymystä';
    $Self->{Translation}->{'go back to questions'} = 'mene takaisin kysymyksiin';
    $Self->{Translation}->{'Possible Answers For'} = 'Vastausvaihtoehdot';
    $Self->{Translation}->{'Add Answer'} = 'Lisää vastaus';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} = 'Tässä ei ole useita vastauksia, näytetään tekstialue.';
    $Self->{Translation}->{'Edit Answer'} = 'Muokkaa vastausta';
    $Self->{Translation}->{'go back to edit question'} = 'mene takaisin muokkaamaan kysymystä';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = '';
    $Self->{Translation}->{'Max. shown Surveys per page'} = '';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Muistutuksen lähettäjä';
    $Self->{Translation}->{'Notification Subject'} = 'Muistutuksen otsikko';
    $Self->{Translation}->{'Notification Body'} = 'Muistutuksen viesti';
    $Self->{Translation}->{'Changed By'} = 'Muokkaaja';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Kyselyn tiedot';
    $Self->{Translation}->{'Sent requests'} = 'Lähetettyjä kyselyitä';
    $Self->{Translation}->{'Received surveys'} = 'Vastausten määrä';
    $Self->{Translation}->{'Stats Details'} = 'Tulosten yksityiskohdat';
    $Self->{Translation}->{'Survey Details'} = 'Kyselyn yksityiskohdat';
    $Self->{Translation}->{'Survey Results Graph'} = 'Tulosten graafit';
    $Self->{Translation}->{'No stat results.'} = 'Ei tuloksia.';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Kysely';
    $Self->{Translation}->{'Please answer these questions'} = 'Vastaa seuraaviin kysymyksiin';
    $Self->{Translation}->{'Show my answers'} = 'Näytä vastaukseni';
    $Self->{Translation}->{'These are your answers'} = 'Nämä ovat vastauksesi';
    $Self->{Translation}->{'Survey Title'} = 'Kyselyn otsikko';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Kyselyominaisuus';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Moduuli kyselyiden luontiin';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} = '';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} = '';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} = '';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} = '';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = '';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} = '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} = '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} = '';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ).'} = '';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} = '';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} = '';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} = '';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} = '';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} = '';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} = '';
    $Self->{Translation}->{'Public Survey.'} = '';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = '';
    $Self->{Translation}->{'Survey Zoom Module.'} = '';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small"'} = '';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} = '';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} = '';

    #
    # OBSOLETE ENTRIES FOR REFERENCE, DO NOT TRANSLATE!
    #
    $Self->{Translation}->{'Changed Time'} = '';
    $Self->{Translation}->{'Created By'} = '';
    $Self->{Translation}->{'Created Time'} = '';
    $Self->{Translation}->{'Please answer the next questions'} = '';

}

1;
