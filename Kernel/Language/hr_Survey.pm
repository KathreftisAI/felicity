# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::hr_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'Stvori novu anketu';
    $Self->{Translation}->{'Introduction'} = 'Uvod';
    $Self->{Translation}->{'Survey Introduction'} = 'Uvod ankete';
    $Self->{Translation}->{'Notification Body'} = 'Zabilježba';
    $Self->{Translation}->{'Internal Description'} = 'Interni opis';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'Uredi opće informacije';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Uredi pitanja';
    $Self->{Translation}->{'Survey Questions'} = 'Anketna pitanja';
    $Self->{Translation}->{'Add Question'} = 'Dodaj pitanje';
    $Self->{Translation}->{'Type the question'} = 'Upiši pitanje';
    $Self->{Translation}->{'Answer required'} = 'Odgovor je neophodan';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Nema spremljenih pitanja za ovu anketu.';
    $Self->{Translation}->{'Question'} = 'Pitanje';
    $Self->{Translation}->{'Answer Required'} = 'Odgovor je obavezan';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        '';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'Želite li zaista izbrisati ovo pitanje? Svi podaci pri tome će biti izgubljeni!';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = 'Uredi pitanje';
    $Self->{Translation}->{'go back to questions'} = 'vrati se natrag na pitanja';
    $Self->{Translation}->{'Question:'} = '';
    $Self->{Translation}->{'Possible Answers For'} = 'Mogući odgovori za';
    $Self->{Translation}->{'Add Answer'} = 'Dodaj odgovor';
    $Self->{Translation}->{'No answers saved for this question.'} = 'Nema spremljenih odgovora za ovo pitanje.';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = 'Želite li zaista obrisati ovaj odgovor?';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        '';
    $Self->{Translation}->{'Edit Answer'} = 'Uredi odgovor';
    $Self->{Translation}->{'go back to edit question'} = 'vrati se natrag na uređivanje pitanja';
    $Self->{Translation}->{'Answer:'} = '';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = '';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Zabilježba pošiljatelja';
    $Self->{Translation}->{'Notification Subject'} = 'Zabilježba naslova';
    $Self->{Translation}->{'Changed By'} = 'Mijenjao';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = 'Pregled statistike od';
    $Self->{Translation}->{'Requests Table'} = 'Tablica zahtjeva';
    $Self->{Translation}->{'Send Time'} = 'Vrijeme slanja';
    $Self->{Translation}->{'Vote Time'} = 'Vrijeme glasovanja';
    $Self->{Translation}->{'See Details'} = 'Vidi podrobnije';
    $Self->{Translation}->{'Survey Stat Details'} = 'Detalji anketne statistike';
    $Self->{Translation}->{'go back to stats overview'} = 'vrati se natrag na pregled statistika';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Informacije o anketi';
    $Self->{Translation}->{'Sent requests'} = 'Poslani zahtjevi';
    $Self->{Translation}->{'Received surveys'} = 'Primljene ankete';
    $Self->{Translation}->{'Survey Details'} = 'Detalji ankete';
    $Self->{Translation}->{'Ticket Services'} = '';
    $Self->{Translation}->{'Survey Results Graph'} = 'Rezultati ankete';
    $Self->{Translation}->{'No stat results.'} = 'Nema rezultata. ';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Anketa';
    $Self->{Translation}->{'Please answer these questions'} = 'Molimo vas da odgovorite na pitanja';
    $Self->{Translation}->{'Show my answers'} = 'Prikaži moje odgovore';
    $Self->{Translation}->{'These are your answers'} = 'Ovo su vaši odgovori';
    $Self->{Translation}->{'Survey Title'} = 'Naslov ankete';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = 'Dodaj novu anketu';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = '';
    $Self->{Translation}->{'No SurveyID is given!'} = '';
    $Self->{Translation}->{'Survey Edit'} = 'Uredi anketu';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = '';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = '';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Uredi anketna pitanja';
    $Self->{Translation}->{'Yes/No'} = 'Da/ne';
    $Self->{Translation}->{'Radio (List)'} = '';
    $Self->{Translation}->{'Checkbox (List)'} = ' ';
    $Self->{Translation}->{'Question Type'} = 'Tip pitanja';
    $Self->{Translation}->{'Complete'} = 'Dovršeno';
    $Self->{Translation}->{'Incomplete'} = 'Nedovršeno';
    $Self->{Translation}->{'Question Edit'} = 'Uredi pitanje';
    $Self->{Translation}->{'Answer Edit'} = 'Uredi odgovor';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = 'Pregled statistike';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = '';
    $Self->{Translation}->{'Stats Detail'} = 'Statistika detaljno';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'Nemoguće postaviti novi status! Pitanja nisu postavljena.';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = '';
    $Self->{Translation}->{'Status changed.'} = 'Status promijenjen.';
    $Self->{Translation}->{'- No queue selected -'} = '';
    $Self->{Translation}->{'- No ticket type selected -'} = '';
    $Self->{Translation}->{'- No ticket service selected -'} = '';
    $Self->{Translation}->{'- Change Status -'} = '- Promijeni status -';
    $Self->{Translation}->{'master'} = '';
    $Self->{Translation}->{'New Status'} = '';
    $Self->{Translation}->{'Survey Description'} = 'Opis ankete';
    $Self->{Translation}->{'answered'} = 'odgovoreno';
    $Self->{Translation}->{'not answered'} = 'nije odgovoreno';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'Hvala vam za povratnu informaciju.';
    $Self->{Translation}->{'The survey is finished.'} = 'Anketa je završena.';
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
    $Self->{Translation}->{'You have already answered the survey.'} = 'Već ste ispunjavali anketu.';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Anketni modul.';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Modul za uređivanje anketnih pitanja.';
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
    $Self->{Translation}->{'Public Survey.'} = 'Javna anketa.';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        '';
    $Self->{Translation}->{'Stats Details'} = 'Satistika detaljno';
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
