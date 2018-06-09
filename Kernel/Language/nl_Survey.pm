# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nl_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'Nieuwe enquête aanmaken';
    $Self->{Translation}->{'Introduction'} = 'Introductie';
    $Self->{Translation}->{'Survey Introduction'} = 'Introductie';
    $Self->{Translation}->{'Notification Body'} = 'Body text';
    $Self->{Translation}->{'Internal Description'} = 'Interne omschrijving';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'Bewerk algemene informatie';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Bewerk vragen';
    $Self->{Translation}->{'Survey Questions'} = 'Vragen';
    $Self->{Translation}->{'Add Question'} = 'Vraag toevoegen';
    $Self->{Translation}->{'Type the question'} = 'Vraag';
    $Self->{Translation}->{'Answer required'} = 'Verplicht antwoorden';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Er zijn geen vragen opgeslagen voor deze enquête';
    $Self->{Translation}->{'Question'} = 'Vraag';
    $Self->{Translation}->{'Answer Required'} = 'Verplicht Antwoorden';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        '';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'Weet u zeker dat u deze vraag wilt verwijderen? ALLE geassocieerde data zal verloren gaan!';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = 'Bewerk vraag';
    $Self->{Translation}->{'go back to questions'} = 'ga terug naar de vragen';
    $Self->{Translation}->{'Question:'} = 'Vraag:';
    $Self->{Translation}->{'Possible Answers For'} = 'Mogelijke antwoorden';
    $Self->{Translation}->{'Add Answer'} = 'Antwoord toevoegen';
    $Self->{Translation}->{'No answers saved for this question.'} = 'Geen antwoord opgeslagen voor deze vraag.';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = 'Weet u zeker dat u dit antwoord wilt verwijderen?';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'Deze heeft niet meerdere antwoorden. Er zal een tekstvak getoond worden.';
    $Self->{Translation}->{'Edit Answer'} = 'Antwoord bewerken';
    $Self->{Translation}->{'go back to edit question'} = 'ga terug naar de vraag';
    $Self->{Translation}->{'Answer:'} = 'Antwoord:';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = 'Max. getoonde onderzoeken per pagina';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Afzender notificatie';
    $Self->{Translation}->{'Notification Subject'} = 'Onderwerp';
    $Self->{Translation}->{'Changed By'} = 'Gewijzigd door';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = 'Detailoverzicht';
    $Self->{Translation}->{'Requests Table'} = 'Verzoeken';
    $Self->{Translation}->{'Send Time'} = 'Verstuurd op';
    $Self->{Translation}->{'Vote Time'} = 'Ingevuld op';
    $Self->{Translation}->{'See Details'} = 'Zie Details';
    $Self->{Translation}->{'Survey Stat Details'} = 'Detailoverzicht statistieken';
    $Self->{Translation}->{'go back to stats overview'} = 'ga terug naar het overzicht';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Details enquête';
    $Self->{Translation}->{'Sent requests'} = 'Verstuurde verzoeken';
    $Self->{Translation}->{'Received surveys'} = 'Ontvangen enquêtes';
    $Self->{Translation}->{'Survey Details'} = 'Details enquête';
    $Self->{Translation}->{'Ticket Services'} = 'Ticket Services';
    $Self->{Translation}->{'Survey Results Graph'} = 'Resultaten (grafiek)';
    $Self->{Translation}->{'No stat results.'} = 'Geen resultaten.';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Enquête';
    $Self->{Translation}->{'Please answer these questions'} = 'Beantwoordt u de volgende vragen';
    $Self->{Translation}->{'Show my answers'} = 'Toon mijn antwoorden';
    $Self->{Translation}->{'These are your answers'} = 'Dit zijn uw antwoorden';
    $Self->{Translation}->{'Survey Title'} = 'Enquêtetitel';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = 'Nieuwe enquête toevoegen';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = '';
    $Self->{Translation}->{'No SurveyID is given!'} = '';
    $Self->{Translation}->{'Survey Edit'} = 'Bewerk enquête';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = '';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = '';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Bewerk vragen';
    $Self->{Translation}->{'Yes/No'} = 'Ja/Nee';
    $Self->{Translation}->{'Radio (List)'} = 'Keuzerondje (lijst)';
    $Self->{Translation}->{'Checkbox (List)'} = 'Selectievak (lijst)';
    $Self->{Translation}->{'Question Type'} = 'Vraagtype';
    $Self->{Translation}->{'Complete'} = 'Volledig';
    $Self->{Translation}->{'Incomplete'} = 'Onvolledig';
    $Self->{Translation}->{'Question Edit'} = 'Bewerk vraag';
    $Self->{Translation}->{'Answer Edit'} = 'Bewerk antwoord';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = 'Statistieken';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = '';
    $Self->{Translation}->{'Stats Detail'} = 'Detail';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'Kan status niet wijzigen, voeg eerst vragen toe.';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = '';
    $Self->{Translation}->{'Status changed.'} = 'Status bijgewerkt.';
    $Self->{Translation}->{'- No queue selected -'} = '- Geen rij geselecteerd -';
    $Self->{Translation}->{'- No ticket type selected -'} = '';
    $Self->{Translation}->{'- No ticket service selected -'} = '';
    $Self->{Translation}->{'- Change Status -'} = '- Status wijzigen -';
    $Self->{Translation}->{'master'} = '';
    $Self->{Translation}->{'New Status'} = 'Nieuwe Status';
    $Self->{Translation}->{'Survey Description'} = 'Omschrijving';
    $Self->{Translation}->{'answered'} = 'beantwoord';
    $Self->{Translation}->{'not answered'} = 'niet beantwoord';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'Bedankt voor uw feedback.';
    $Self->{Translation}->{'The survey is finished.'} = 'De enquête is ingestuurd.';
    $Self->{Translation}->{'Survey Message!'} = '';
    $Self->{Translation}->{'Module not enabled.'} = '';
    $Self->{Translation}->{'This functionality is not enabled, please contact your administrator.'} =
        '';
    $Self->{Translation}->{'Survey Error!'} = '';
    $Self->{Translation}->{'Invalid survey key.'} = '';
    $Self->{Translation}->{'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'} =
        '';
    $Self->{Translation}->{'Survey Vote'} = '';
    $Self->{Translation}->{'Survey Vote Data'} = '';
    $Self->{Translation}->{'You have already answered the survey.'} = 'U heeft deze enquête al beantwoord.';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Een module om enquêtes te onderhouden en te versturen';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Een module om enquêtes te onderhouden.';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        '';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        '';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        '';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        '';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        '';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        '';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        '';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        '';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        '';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        '';
    $Self->{Translation}->{'Edit survey general information.'} = '';
    $Self->{Translation}->{'Edit survey questions.'} = '';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        '';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = '';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        '';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        '';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = '';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        '';
    $Self->{Translation}->{'Public Survey.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Stats Details'} = 'Stats Details';
    $Self->{Translation}->{'Survey Add Module.'} = '';
    $Self->{Translation}->{'Survey Edit Module.'} = '';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = '';
    $Self->{Translation}->{'Survey Stats Module.'} = '';
    $Self->{Translation}->{'Survey Zoom Module.'} = '';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = '';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = '';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        '';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        '';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = '';
    $Self->{Translation}->{'Zoom into statistics details.'} = '';

}

1;
