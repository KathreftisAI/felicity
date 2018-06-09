# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pl_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'Utwórz nową ankietę';
    $Self->{Translation}->{'Introduction'} = 'Wprowadzenie';
    $Self->{Translation}->{'Survey Introduction'} = 'Wstęp ankiety';
    $Self->{Translation}->{'Notification Body'} = 'Treść powiadomienia';
    $Self->{Translation}->{'Internal Description'} = 'Wewnętrzny opis';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'Edytuj informacje ogólne';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Edytuj pytania';
    $Self->{Translation}->{'Survey Questions'} = 'Pytania ankiety';
    $Self->{Translation}->{'Add Question'} = 'Dodaj pytanie';
    $Self->{Translation}->{'Type the question'} = 'Wprowadź pytanie';
    $Self->{Translation}->{'Answer required'} = 'Wymagana odpowiedź';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Brak pytań zapisanych w tej ankiecie.';
    $Self->{Translation}->{'Question'} = 'Pytanie';
    $Self->{Translation}->{'Answer Required'} = 'Wymagana odpowiedź';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        'Kiedy zakończysz edycję pytań ankiety po prostu zamknij to okno.';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'Czy na pewno chcesz usunąć to pytanie? Wszystkie związane dane będą USUNIĘTE!';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = 'Edytuj pytanie';
    $Self->{Translation}->{'go back to questions'} = 'powrót do pytań';
    $Self->{Translation}->{'Question:'} = 'Pytanie:';
    $Self->{Translation}->{'Possible Answers For'} = 'Możliwe odpowiedzi do';
    $Self->{Translation}->{'Add Answer'} = 'Dodaj odpowiedź';
    $Self->{Translation}->{'No answers saved for this question.'} = 'Brak zapisanych odpowiedzi na to pytanie.';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = 'Czy na pewno chcesz usunąć tę odpowiedź?';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'Nie posiada wielu odpowiedzi, będzie wyświetlane pole tekstowe.';
    $Self->{Translation}->{'Edit Answer'} = 'Edytuj odpowiedź';
    $Self->{Translation}->{'go back to edit question'} = 'powrót do edycji pytania';
    $Self->{Translation}->{'Answer:'} = 'Odpowiedz:';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = 'Maks. liczba wyświetlanych ankiet na stronę';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Nadawca powiadomienia';
    $Self->{Translation}->{'Notification Subject'} = 'Temat powiadomienia';
    $Self->{Translation}->{'Changed By'} = 'Zmienione przez';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = 'Przegląd statystyki';
    $Self->{Translation}->{'Requests Table'} = 'Tabela żądań';
    $Self->{Translation}->{'Send Time'} = 'Czas wysłania';
    $Self->{Translation}->{'Vote Time'} = 'Czas głosowania';
    $Self->{Translation}->{'See Details'} = 'Zobacz szczegóły';
    $Self->{Translation}->{'Survey Stat Details'} = 'Szczegóły statystyki';
    $Self->{Translation}->{'go back to stats overview'} = 'Wstecz do przeglądu statystyki';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Informacje o ankiecie';
    $Self->{Translation}->{'Sent requests'} = 'Wysłane żądania';
    $Self->{Translation}->{'Received surveys'} = 'Otrzymane ankiety';
    $Self->{Translation}->{'Survey Details'} = 'Szczegóły ankiety';
    $Self->{Translation}->{'Ticket Services'} = 'Zgłoszenie Usług';
    $Self->{Translation}->{'Survey Results Graph'} = 'Wykres wyników ankiety';
    $Self->{Translation}->{'No stat results.'} = 'Brak wyników ankiety.';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Ankieta';
    $Self->{Translation}->{'Please answer these questions'} = 'Proszę odpowiedzieć na te pytania';
    $Self->{Translation}->{'Show my answers'} = 'Pokaż moje odpowiedzi';
    $Self->{Translation}->{'These are your answers'} = 'Oto Twoje odpowiedzi';
    $Self->{Translation}->{'Survey Title'} = 'Tytuł ankiety';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = 'Dodaj nową ankietę';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = 'Nie masz uprawnień do tej ankiety!';
    $Self->{Translation}->{'No SurveyID is given!'} = 'Nie podano identyfikatora ankiety SurveyID!';
    $Self->{Translation}->{'Survey Edit'} = 'Edycja ankiety';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = 'Nie masz uprawnień do tej ankiety lub pytania!';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = 'Nie masz uprawnień do tej ankiety, pytania lub odpowiedzi!';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Edycja pytań ankiety';
    $Self->{Translation}->{'Yes/No'} = 'Tak/Nie';
    $Self->{Translation}->{'Radio (List)'} = 'Radio (Lista)';
    $Self->{Translation}->{'Checkbox (List)'} = 'Pole wyboru (Lista)';
    $Self->{Translation}->{'Question Type'} = 'Typ pytania';
    $Self->{Translation}->{'Complete'} = 'Kompletne';
    $Self->{Translation}->{'Incomplete'} = 'Niekompletne';
    $Self->{Translation}->{'Question Edit'} = 'Edycja pytań';
    $Self->{Translation}->{'Answer Edit'} = 'Edycja odpowiedzi';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = 'Statystyka';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = 'Nie masz uprawnień do tej ankiety lub szczegółów statystyki!';
    $Self->{Translation}->{'Stats Detail'} = 'Szczegóły statystyki';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'Nie można zmienić stanu! Brak zdefiniowanych pytań.';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = 'Nie można zmienić stanu! Pytanie niekompletne.';
    $Self->{Translation}->{'Status changed.'} = 'Zmieniono stan.';
    $Self->{Translation}->{'- No queue selected -'} = '- Nie wybrano kolejki -';
    $Self->{Translation}->{'- No ticket type selected -'} = '- Nie wybrano typu zgłoszenia -';
    $Self->{Translation}->{'- No ticket service selected -'} = '- Nie wybrano zgłoszenia usług -';
    $Self->{Translation}->{'- Change Status -'} = '- Zmień stan -';
    $Self->{Translation}->{'master'} = 'nadrzędny';
    $Self->{Translation}->{'New Status'} = 'Nowy stan';
    $Self->{Translation}->{'Survey Description'} = 'Opis ankiety';
    $Self->{Translation}->{'answered'} = 'odpowiedziano';
    $Self->{Translation}->{'not answered'} = 'nie odpowiedziano';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'Dziękujęmy za wypełnienie ankiety.';
    $Self->{Translation}->{'The survey is finished.'} = 'Ankieta zakończona.';
    $Self->{Translation}->{'Survey Message!'} = 'Wiadomość ankiety!';
    $Self->{Translation}->{'Module not enabled.'} = 'Moduł nie włączony.';
    $Self->{Translation}->{'This functionality is not enabled, please contact your administrator.'} =
        'Ta funkcjonalność nie jest włączona. Proszę skontaktuj się z administratorem.';
    $Self->{Translation}->{'Survey Error!'} = 'Błąd ankiety!';
    $Self->{Translation}->{'Invalid survey key.'} = 'Nieprawidłowy klucz ankiety.';
    $Self->{Translation}->{'The inserted survey key is invalid, if you followed a link maybe this is obsolete or broken.'} =
        'Wprowadzony klucz ankiety jest nieprawidłowy. Jeśli trafiłeś tutaj przy pomocy linku, być może jest on nieaktualny lub nieprawidłowy.';
    $Self->{Translation}->{'Survey Vote'} = 'Wynik ankiety';
    $Self->{Translation}->{'Survey Vote Data'} = 'Dane wynikowe ankiety';
    $Self->{Translation}->{'You have already answered the survey.'} = 'Już odpowiedziałeś na tę ankietę.';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Moduł ankiet.';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Moduł do edycji pytań ankiet';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        'Wszystkie parametry dla ankiet w interfejsie agenta.';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        'Liczba dni po których nastąpi wysłanie żądania wypełnienia ankiety. Wprowadzenie "0" spowoduje wysłanie e-maila zawsze.';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        'Domyślna budowa informacji dl użytkownika odnośnie nowej ankiety.';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        'Domyślny nadawca informacji o nowej ankiecie.';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        'Domyślny temat informacji o nowej ankiete.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        'Defniuje moduł przeglądu wyświetlania list ankiet.';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        'Definiuje maksymalną liczbę ankiet wysyłaniu do Klienta w ciągu 30 dni. (0 oznacza brak ograniczenia, wszystkie żądania będą wysyłane).';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        'Ustala liczbę godzin które muszą minąć od zamknięcia zgłoszenia do wysłania ankiety (0 oznacza bezzwłoczną wysyłkę przy zamykaniu zgłoszenia). Uwaga: opóźnione wysyłanie ankiety jest realizowane przez Demona OTRS, po uprzedniej aktywacji w ustawieniach: \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' ';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        'Definiuje domyślną wysokość widoków Richtext dla elementów SurveyZoom.';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        'Definiuje maksymalną wysokość widoków Richtext dla elementów SurveyZoom.';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        'Definiuje widoczne kolumny w przeglądzie ankiet. Ta opcja nie wpływa na pozycję kolumn.';
    $Self->{Translation}->{'Edit survey general information.'} = 'Edytuj informacje ogólne ankiety.';
    $Self->{Translation}->{'Edit survey questions.'} = 'Edytuj pytania ankiety.';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        'Włącz lub wyłącz ekran ShowVoteData w interfejsie publicznym aby pokazać wyniki ankiety gdy klient próbuje odpowiedzieć na akietę drugi raz.';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = 'Włącza lub wyłącza sprawdzanie warunku wysyłki dla usługi.';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        'Włącza lub wyłącza sprawdzanie warunku wysyłki dla typu zgłoszenia.';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        'Moduł frontend rejestrujący dodawanie ankiet w panelu agenta.';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        'Moduł frontend rejestrujący edycję ankiet w panelu agenta.';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        'Moduł frontend rejestrujący statystykę ankiet w panelu agenta.';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        'Moduł frontend rejestrujący podgląd ankiet w panelu agenta.';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        'Moduł frontend rejestrujący obiekt PublicSurvey w obszarze publicznym ankiety.';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'Gdy to wyrażenie regularne jest spełnione, nie zostanie wysłana żadna ankieta do klienta.';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        'Parametry dla stron (na których pokazywane są ankiety) dla małego przeglądu ankiet.';
    $Self->{Translation}->{'Public Survey.'} = 'Ankieta publiczna.';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        'Pokazuje link w menu do edycji ankiety w jej przybliżonym widoku w interfejsie agenta.';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        'Pokazuje link w menu do edycji pytań ankiety w jej przybliżonym widoku w interfejsie agenta.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        'Pokazuje w menu link wstecz w widoku przybliżonym ankiety w interfejsie agenta.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        'Pokazuje link w menu do przybliżania szczegółów statystyk ankiety w jej widoku przybliżonym w interfejsie agenta';
    $Self->{Translation}->{'Stats Details'} = 'Szczegóły statystyk';
    $Self->{Translation}->{'Survey Add Module.'} = 'Moduł dodawania ankiet.';
    $Self->{Translation}->{'Survey Edit Module.'} = 'Moduł edycji ankiet.';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = 'Limit "małego" przeglądu ankiet';
    $Self->{Translation}->{'Survey Stats Module.'} = 'Moduł statystyk ankiet.';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'Podgląd ankiety.';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = 'Limit ilości ankiet w "małym" przeglądzie.';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = 'Ankiety nie będą wysyłane na skonfigurowane adresy email.';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        'Identyfikacja dla ankiety, np. Survey#, MySurvey#. Domyślnie: Survey#.';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        'Zdarzenie zgłoszenia wysyła automatycznie e-maila z prośbą o wypełnienie ankiety po zamknięciu zgłoszenia.';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = 'Wyzwalacz opóźnionej wysyłki próśb o wypełnienie ankiety.';
    $Self->{Translation}->{'Zoom into statistics details.'} = 'Podgląd szczegółów statystyk.';

}

1;
