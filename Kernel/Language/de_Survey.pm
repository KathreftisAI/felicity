# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'Neue Umfrage erstellen';
    $Self->{Translation}->{'Introduction'} = 'Einleitungstext';
    $Self->{Translation}->{'Survey Introduction'} = 'Umfrage Einleitung';
    $Self->{Translation}->{'Notification Body'} = 'Benachrichtigung Text';
    $Self->{Translation}->{'Internal Description'} = 'Interne Beschreibung';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'Allgemeine Angaben bearbeiten';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Fragen bearbeiten';
    $Self->{Translation}->{'Survey Questions'} = 'Umfrage-Fragen';
    $Self->{Translation}->{'Add Question'} = 'Frage hinzufügen';
    $Self->{Translation}->{'Type the question'} = 'Frage eingeben';
    $Self->{Translation}->{'Answer required'} = 'Antwort erforderlich';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Für diese Umfrage sind keine Fragen gespeichert.';
    $Self->{Translation}->{'Question'} = 'Frage';
    $Self->{Translation}->{'Answer Required'} = 'Antwort erforderlich';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        'Nach dem Bearbeiten der Umfrage dieses Fenster einfach schliessen';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'Wollen Sie diese Frage wirklich löschen? Alle darin enthaltenen Daten werden GELÖSCHT!';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = 'Frage bearbeiten';
    $Self->{Translation}->{'go back to questions'} = 'Zurück zu den Fragen';
    $Self->{Translation}->{'Question:'} = 'Frage:';
    $Self->{Translation}->{'Possible Answers For'} = 'Mögliche Antworten für';
    $Self->{Translation}->{'Add Answer'} = 'Antwort hinzufügen';
    $Self->{Translation}->{'No answers saved for this question.'} = 'Für diese Frage sind keine Antworten gespeichert.';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = 'Wollen Sie diese Frage wirklich löschen?';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'Diese Frage hat nicht mehrere Antworten, ein Texteingabefeld wird hinzugefügt.';
    $Self->{Translation}->{'Edit Answer'} = 'Antwort bearbeiten';
    $Self->{Translation}->{'go back to edit question'} = 'Zurück zum Bearbeiten der Frage';
    $Self->{Translation}->{'Answer:'} = 'Antwort:';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = 'Maximale Anzahl angezeigter Umfragen pro Seite';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Benachrichtigung Absender';
    $Self->{Translation}->{'Notification Subject'} = 'Benachrichtigung Betreff';
    $Self->{Translation}->{'Changed By'} = 'Geändert von';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = 'Statistikübersicht von';
    $Self->{Translation}->{'Requests Table'} = 'Anfragentabelle';
    $Self->{Translation}->{'Send Time'} = 'Sendezeit';
    $Self->{Translation}->{'Vote Time'} = 'Abstimmungszeit';
    $Self->{Translation}->{'See Details'} = 'Siehe Details';
    $Self->{Translation}->{'Survey Stat Details'} = 'Umfragestatistikdetails';
    $Self->{Translation}->{'go back to stats overview'} = 'Zurück zur Übersicht';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Umfrageinformationen';
    $Self->{Translation}->{'Sent requests'} = 'Gesendete Anfragen';
    $Self->{Translation}->{'Received surveys'} = 'Erhaltene Umfragen';
    $Self->{Translation}->{'Survey Details'} = 'Umfragedetails';
    $Self->{Translation}->{'Ticket Services'} = 'Ticket-Dienste';
    $Self->{Translation}->{'Survey Results Graph'} = 'Grafik Umfrageergebnisse';
    $Self->{Translation}->{'No stat results.'} = 'Keine Statistikergebnisse.';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Umfrage';
    $Self->{Translation}->{'Please answer these questions'} = 'Bitte beantworten Sie diese Fragen';
    $Self->{Translation}->{'Show my answers'} = 'Zeige meine Antworten';
    $Self->{Translation}->{'These are your answers'} = 'Dies sind Ihre Antworten';
    $Self->{Translation}->{'Survey Title'} = 'Umfragetitel';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = 'Neue Umfrage hinzufügen';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = '';
    $Self->{Translation}->{'No SurveyID is given!'} = '';
    $Self->{Translation}->{'Survey Edit'} = 'Umfrage bearbeiten';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = '';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = '';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Fragen der Umfrage bearbeiten';
    $Self->{Translation}->{'Yes/No'} = 'Ja/Nein';
    $Self->{Translation}->{'Radio (List)'} = 'Optionsschalter (Liste)';
    $Self->{Translation}->{'Checkbox (List)'} = 'Kontrollkästchen (Liste)';
    $Self->{Translation}->{'Question Type'} = 'Fragetyp';
    $Self->{Translation}->{'Complete'} = 'Vollständig';
    $Self->{Translation}->{'Incomplete'} = 'Unvollständig';
    $Self->{Translation}->{'Question Edit'} = 'Frage bearbeiten';
    $Self->{Translation}->{'Answer Edit'} = 'Antwort bearbeiten';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = 'Statistikübersicht';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = '';
    $Self->{Translation}->{'Stats Detail'} = 'Statistikdetail';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'Status konnte nicht gesetzt werden! Keine Fragen definiert.';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = '';
    $Self->{Translation}->{'Status changed.'} = 'Status geändert.';
    $Self->{Translation}->{'- No queue selected -'} = '- Keine Queue ausgewählt -';
    $Self->{Translation}->{'- No ticket type selected -'} = '- Kein Tickettyp ausgewählt -';
    $Self->{Translation}->{'- No ticket service selected -'} = '- Kein Ticketdienst ausgewählt -';
    $Self->{Translation}->{'- Change Status -'} = '- Status ändern -';
    $Self->{Translation}->{'master'} = '';
    $Self->{Translation}->{'New Status'} = 'Neuer Status';
    $Self->{Translation}->{'Survey Description'} = 'Umfrage Beschreibung';
    $Self->{Translation}->{'answered'} = 'beantwortet';
    $Self->{Translation}->{'not answered'} = 'nicht beantwortet';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'Danke für Ihr Feedback.';
    $Self->{Translation}->{'The survey is finished.'} = 'Die Umfrage ist beendet.';
    $Self->{Translation}->{'Survey Message!'} = 'Umfragenachricht!';
    $Self->{Translation}->{'Module not enabled.'} = 'Modul nicht akiviert.';
    $Self->{Translation}->{'This functionality is not enabled, please contact your administrator.'} =
        '';
    $Self->{Translation}->{'Survey Error!'} = 'Umfragefehler!';
    $Self->{Translation}->{'Invalid survey key.'} = '';
    $Self->{Translation}->{'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'} =
        '';
    $Self->{Translation}->{'Survey Vote'} = '';
    $Self->{Translation}->{'Survey Vote Data'} = '';
    $Self->{Translation}->{'You have already answered the survey.'} = 'Sie haben die Umfrage schon beantwortet.';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Ein Umfragemodul.';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Ein Modul, um Umfragen zu bearbeiten';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        'Alle Parameter für das Umfragemodul in der Agenten-Oberfläche.';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        'Anzahl an Tagen nach dem Versand einer Umfrage-E-Mail in denen keine neue Umfrage-E-Mail an den gleichen Kunden versendet wird. Wählen sie 0, um immer Umfrage-E-Mails zu versenden.';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        'Voreingestellter Text für Benachrichtigungs-E-Mails an den Kunden über neue Umfragen.';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        'Voreingestellter Absender für Benachrichtigungs-E-Mails an den Kunden über neue Umfragen.';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        'Voreingestellter Betreff für Benachrichtigungs-E-Mails an den Kunden über neue Umfragen.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        'Definiert ein Übersichtsmodul, dass eine Liste aller Umfragen anzeigt.';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        'Definiert die maximale Anzahl von Umfragen die ein Kunde innerhalb von 30 Tagen zugesandt bekommt. ( 0 steht für kein Maximum, alle Umfrage-E-Mails werden versandt.)';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        'Definiert die Anzahl an Stunden für die ein Ticket geschlossen sein muss um den Versand einer Umfrage auszulösen ( 0 bedeutet, sofort nach Schließen eines Tickets senden ). Hinweis: Das absenden der verzögerten Umfrage wird durch den OTRS Daemon erledigt, vorherige Aktivierung durch die \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' Einstellung.';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        'Definiert die Standardhöhe eines WYSIWYG-Bereichs für die Umfragedetailansicht.';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        'Definiert die angezeigten Spalten der Umfrage Übersicht. Diese Option hat keine Auswirkung auf die Position der Spalten.';
    $Self->{Translation}->{'Edit survey general information.'} = '';
    $Self->{Translation}->{'Edit survey questions.'} = '';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        'Aktivieren oder deaktivieren die ShowVoteData Anzeigen in der öffentlichen Oberfläche, um Abstimmungsdaten anzuzeigen, wen ein Kunde versucht, ein zweites mal abzustimmen.';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = 'Aktivieren oder deaktivieren der Versandbedingungsprüfung für den Dienst.';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        'Aktivieren oder deaktivieren der Versandbedingungsprüfung für den Tickettyp.';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        'Frontend-Modul-Registrierung für das Hinzufügen einer Umfrage in der Agenten-Oberfläche.';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        'Frontend-Modul-Registrierung für die Umfragebearbeitung in der Agenten-Oberfläche.';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        'Frontend-Modul-Registrierung für die Umfragedetailansicht in der Agenten-Oberfläche.';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        'Frontend-Modul-Registrierung für die Umfragedetailansicht in der Agenten-Oberfläche.';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        'Frontend-Modul-Registrierung für die öffentliche Umfrageübersicht.';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'Wenn dieser reguläre Ausdruck zutrifft, wird keine Umfrage an den Kunden gesendet.';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        'Parameter für die Seiten der Umfrageübersicht.';
    $Self->{Translation}->{'Public Survey.'} = 'Öffentliche Umfrage.';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        'Zeigt einen Link im Menü der Zoom-Ansicht der Agenten-Oberfläche an, der es ermöglicht eine Umfrage zu bearbeiten.';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        'Zeigt einen Link im Menü in Zoom-Ansicht der Agenten-Oberfläche an, der es ermöglicht die Fragen einer Umfrage zu bearbeiten.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        'Zeigt einen Link im Menü in Zoom-Ansicht der Agenten-Oberfläche an, mit dem zum Umfrage-Zoom zurückgegangen werden kann.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        'Zeigt einen Link im Menü in Zoom-Ansicht der Agenten-Oberfläche an, mit dem die Details einer Umfrage angezeigt werden können.';
    $Self->{Translation}->{'Stats Details'} = 'Statistikdetail';
    $Self->{Translation}->{'Survey Add Module.'} = 'Umfrage Modul hinzufügen';
    $Self->{Translation}->{'Survey Edit Module.'} = 'Umfrage bearbeiten';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = 'Umfrageübersicht "Kleines" Limit';
    $Self->{Translation}->{'Survey Stats Module.'} = 'Umfragestatistikmodul.';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'Umfragedetailansichtmodul.';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = '';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = 'Umfragen werden nicht an die konfigurierten E-Mail-Adressen gesendet.';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        'Die eindeutige Bezeichnung für eine Umfrage, z. B. Survey# oder MySurvey#. Standard ist Survey#.';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        'Ticket-Event-Modul, um automatisch Umfrage-E-Mails an Kunden zu senden, wenn ein Ticket geschlossen wird.';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = 'Auslöser zum Senden von verzögerten Anfragen';
    $Self->{Translation}->{'Zoom into statistics details.'} = '';

}

1;
