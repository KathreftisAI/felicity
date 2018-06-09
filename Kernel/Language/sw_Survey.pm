# --
# Copyright (C) 2001-2018 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sw_Survey;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentSurveyAdd
    $Self->{Translation}->{'Create New Survey'} = 'Tengeneza tafiti mpya';
    $Self->{Translation}->{'Introduction'} = 'Utangulizi';
    $Self->{Translation}->{'Survey Introduction'} = 'Utangulizi wa tafiti';
    $Self->{Translation}->{'Notification Body'} = 'Kiini cha taarifa';
    $Self->{Translation}->{'Internal Description'} = 'Maelezo ya ndani';

    # Template: AgentSurveyEdit
    $Self->{Translation}->{'Edit General Info'} = 'Hariri taarifa za ujumla';

    # Template: AgentSurveyEditQuestions
    $Self->{Translation}->{'Edit Questions'} = 'Hariri maswali';
    $Self->{Translation}->{'Survey Questions'} = 'Maswali ya tafiti';
    $Self->{Translation}->{'Add Question'} = 'Ongeza swali';
    $Self->{Translation}->{'Type the question'} = 'Chapa swali';
    $Self->{Translation}->{'Answer required'} = 'Jibu linahitajika';
    $Self->{Translation}->{'No questions saved for this survey.'} = 'Hakuna maswali yaliyo hifadhiwa kwa hii tafiti';
    $Self->{Translation}->{'Question'} = 'Swali';
    $Self->{Translation}->{'Answer Required'} = 'Jibu linahitajika';
    $Self->{Translation}->{'When you finish to edit the survey questions just close this screen.'} =
        '';
    $Self->{Translation}->{'Do you really want to delete this question? ALL associated data will be LOST!'} =
        'Je unataka kufuta hili swali? Data zote zita POTEA!';
    $Self->{Translation}->{'Close this window'} = '';
    $Self->{Translation}->{'Edit Question'} = 'Hariri swali';
    $Self->{Translation}->{'go back to questions'} = 'rudi kwenye maswali';
    $Self->{Translation}->{'Question:'} = '';
    $Self->{Translation}->{'Possible Answers For'} = 'Majibu yawezekana kwa';
    $Self->{Translation}->{'Add Answer'} = 'Ongeza jibu';
    $Self->{Translation}->{'No answers saved for this question.'} = 'Hakuna majibu yaliyohifadhiwa kwa hili swali';
    $Self->{Translation}->{'Do you really want to delete this answer?'} = 'Je unataka kufuta hili jibu?';
    $Self->{Translation}->{'This doesn\'t have several answers, a textarea will be displayed.'} =
        'Hili halina majibu mengi, sehemu ya nakala itaonyeshwa.';
    $Self->{Translation}->{'Edit Answer'} = 'Hariri jibu';
    $Self->{Translation}->{'go back to edit question'} = 'Rudi nyuma kuhariri swali';
    $Self->{Translation}->{'Answer:'} = '';

    # Template: AgentSurveyOverviewNavBar
    $Self->{Translation}->{'Max. shown surveys per page'} = '';

    # Template: AgentSurveyOverviewSmall
    $Self->{Translation}->{'Notification Sender'} = 'Mtumaji taarifa';
    $Self->{Translation}->{'Notification Subject'} = 'Somo la taafifa';
    $Self->{Translation}->{'Changed By'} = 'Imebadilishwa na';

    # Template: AgentSurveyStats
    $Self->{Translation}->{'Stats Overview of'} = 'Mapitio ya takwimu ya';
    $Self->{Translation}->{'Requests Table'} = 'Jedwali la maombi';
    $Self->{Translation}->{'Send Time'} = 'Muda wa kutuma';
    $Self->{Translation}->{'Vote Time'} = 'Muda wa kupiga kura';
    $Self->{Translation}->{'See Details'} = 'Ona maelezo';
    $Self->{Translation}->{'Survey Stat Details'} = 'Maelezo ya takwimu za tafiti';
    $Self->{Translation}->{'go back to stats overview'} = 'Rudi nyuma kwenye mapitio ya takwimu';

    # Template: AgentSurveyZoom
    $Self->{Translation}->{'Survey Information'} = 'Taarifa za takwimu';
    $Self->{Translation}->{'Sent requests'} = 'Maombi yaliyotumwa';
    $Self->{Translation}->{'Received surveys'} = 'Tafiti zilizopokelewa';
    $Self->{Translation}->{'Survey Details'} = 'Maelezo ya tafiti';
    $Self->{Translation}->{'Ticket Services'} = 'Huduma za tiketi';
    $Self->{Translation}->{'Survey Results Graph'} = 'Grafu ya matokeo ya tafiti';
    $Self->{Translation}->{'No stat results.'} = 'Hakuna matokeo ya takwimu';

    # Template: PublicSurvey
    $Self->{Translation}->{'Survey'} = 'Tafiti';
    $Self->{Translation}->{'Please answer these questions'} = 'Tafadhali jibu haya maswali';
    $Self->{Translation}->{'Show my answers'} = 'Onyesha majibu yangu';
    $Self->{Translation}->{'These are your answers'} = 'Haya ni majibu yako';
    $Self->{Translation}->{'Survey Title'} = 'Kichwa cha habari cha utafiti';

    # Perl Module: Kernel/Modules/AgentSurveyAdd.pm
    $Self->{Translation}->{'Add New Survey'} = 'Ongeza utafiti mpya';

    # Perl Module: Kernel/Modules/AgentSurveyEdit.pm
    $Self->{Translation}->{'You have no permission for this survey!'} = '';
    $Self->{Translation}->{'No SurveyID is given!'} = '';
    $Self->{Translation}->{'Survey Edit'} = 'Hariri utafiti';

    # Perl Module: Kernel/Modules/AgentSurveyEditQuestions.pm
    $Self->{Translation}->{'You have no permission for this survey or question!'} = '';
    $Self->{Translation}->{'You have no permission for this survey, question or answer!'} = '';
    $Self->{Translation}->{'Survey Edit Questions'} = 'Hariri maswali ya utafiti';
    $Self->{Translation}->{'Yes/No'} = 'Ndio/Hapana';
    $Self->{Translation}->{'Radio (List)'} = 'Redio (Orodha)';
    $Self->{Translation}->{'Checkbox (List)'} = 'Cheki boksi (orodha)';
    $Self->{Translation}->{'Question Type'} = 'Aina ya swali';
    $Self->{Translation}->{'Complete'} = 'Kamili';
    $Self->{Translation}->{'Incomplete'} = 'Isiyo kamili';
    $Self->{Translation}->{'Question Edit'} = 'Hariri maswali';
    $Self->{Translation}->{'Answer Edit'} = 'Hariri majibu';

    # Perl Module: Kernel/Modules/AgentSurveyStats.pm
    $Self->{Translation}->{'Stats Overview'} = 'Mapitio ya takwimu';
    $Self->{Translation}->{'You have no permission for this survey or stats detail!'} = '';
    $Self->{Translation}->{'Stats Detail'} = 'Maelezo ya tafiti';

    # Perl Module: Kernel/Modules/AgentSurveyZoom.pm
    $Self->{Translation}->{'Can\'t set new status! No questions defined.'} = 'Sioni hali mpya! Hakuna maswali yaliyofafanuliwa.';
    $Self->{Translation}->{'Can\'t set new status! Questions incomplete.'} = '';
    $Self->{Translation}->{'Status changed.'} = 'Hali imebadilika';
    $Self->{Translation}->{'- No queue selected -'} = '- Hakuna foleni iliyochaguliwa-';
    $Self->{Translation}->{'- No ticket type selected -'} = '';
    $Self->{Translation}->{'- No ticket service selected -'} = '';
    $Self->{Translation}->{'- Change Status -'} = '- Badilisha Hali-';
    $Self->{Translation}->{'master'} = '';
    $Self->{Translation}->{'New Status'} = 'Hali mpya';
    $Self->{Translation}->{'Survey Description'} = 'Maelezo ya tafiti';
    $Self->{Translation}->{'answered'} = 'Yaliyojibiwa';
    $Self->{Translation}->{'not answered'} = 'Yasiyojibiwa';

    # Perl Module: Kernel/Modules/PublicSurvey.pm
    $Self->{Translation}->{'Thank you for your feedback.'} = 'Asante kwa majibu yako.';
    $Self->{Translation}->{'The survey is finished.'} = 'Utafiti umemalizika';
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
    $Self->{Translation}->{'You have already answered the survey.'} = 'Umekwishajibu tafiti';

    # SysConfig
    $Self->{Translation}->{'A Survey Module.'} = 'Moduli ya utafiti';
    $Self->{Translation}->{'A module to edit survey questions.'} = 'Moduli ya kuhariri maswali ya utafiti';
    $Self->{Translation}->{'All parameters for the Survey object in the agent interface.'} =
        'Parameta zote za vitu vya savei katika kiolesura cha wakala';
    $Self->{Translation}->{'Amount of days after sending a survey mail in which no new survey requests are sent to the same customer. Selecting 0 will always send the survey mail.'} =
        'Idadi ya siku baada ya kutuma barua pepe ya tafiti ambapo hakuna maombi mapya ya tafiti kutumwa kwa mteja huyo. Kuchagua 0 daima kutatuma barua pepe ya savei';
    $Self->{Translation}->{'Default body for the notification email to customers about new survey.'} =
        'Chaguo-msingi la kiini cha barua pepe ya taarifa kwa wateja kuhusu savei mpya.';
    $Self->{Translation}->{'Default sender for the notification email to customers about new survey.'} =
        'Chaguo-msingi la mtumaji wa barua pepe ya taarifa kuhusu savei mpya.';
    $Self->{Translation}->{'Default subject for the notification email to customers about new survey.'} =
        'Chaguo-msingi la somo la barua pepe ya taarifa kwa wateja kuhusu savei mpya.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a survey list.'} =
        'Inafafanua mapitio ya moduli kuonyesha muonekano mdogo wa orodha ya savei.';
    $Self->{Translation}->{'Defines groups which have a permission to change survey status. Array is empty by default and agents from all groups can change survey status.'} =
        '';
    $Self->{Translation}->{'Defines maximum amount of surveys that get sent to a customer per 30 days. ( 0 means no maximum, all survey requests will be sent).'} =
        'Inafafanua kikomo cha juu cha idadi ya savei zinazotumwa kwa mteja kwa siku 30. (0 inamaanisha hakuna kikomo, savei zote zitatumwa). ';
    $Self->{Translation}->{'Defines the amount in hours a ticket has to be closed to trigger the sending of a survey, ( 0 means send immediately after close ). Note: delayed survey sending is done by the OTRS Daemon, prior activation of \'Daemon::SchedulerCronTaskManager::Task###SurveyRequestsSend\' setting.'} =
        '';
    $Self->{Translation}->{'Defines the default height for Richtext views for SurveyZoom elements.'} =
        'Inafafanua chaguo-msingi la urefu wa muonekano wa Richtext kwa elementi za UtafitiKuzwa.';
    $Self->{Translation}->{'Defines the maximum height for Richtext views for SurveyZoom elements.'} =
        '';
    $Self->{Translation}->{'Defines the shown columns in the survey overview. This option has no effect on the position of the columns.'} =
        'Inafafanua safu iliyoonyeshwa kwenye mapitio ya utafiti. Hili chaguo halina athari kwa nafasi ya safu. ';
    $Self->{Translation}->{'Edit survey general information.'} = '';
    $Self->{Translation}->{'Edit survey questions.'} = '';
    $Self->{Translation}->{'Enable or disable the ShowVoteData screen in the public interface to show data of a specific survey result when the customer tries to answer a survey the second time.'} =
        'Wezesha au Usiwezeshe skrini ya OneshaKuraData kwa kiolesura cha umma ili kuonyesha data za utafiti fulani maalumu pale mteja anapojaribu kujibu utafiti kwa mara ya pili.';
    $Self->{Translation}->{'Enable or disable the send condition check for the service.'} = 'Wezesha au Usiwezeshe kuchagua hali ya kutuma kwa hii huduma.';
    $Self->{Translation}->{'Enable or disable the send condition check for the ticket type.'} =
        'Wezesha au Usiwezeshe kuchagua hali ya kutuma kwa aina ya tiketi. ';
    $Self->{Translation}->{'Frontend module registration for survey add in the agent interface.'} =
        'Moduli ya Frontend ya kusajili ili kuongeza  utafiti katika kiolesura cha wakala.';
    $Self->{Translation}->{'Frontend module registration for survey edit in the agent interface.'} =
        'Moduli ya Frontend ya kusajili ili kuhariri utafiti katika kiolesura cha wakala.';
    $Self->{Translation}->{'Frontend module registration for survey stats in the agent interface.'} =
        'Moduli ya Frontend ya kusajili takwimu za utafiti katika kiolesura cha wakala.';
    $Self->{Translation}->{'Frontend module registration for survey zoom in the agent interface.'} =
        'Moduli ya Frontend ya kusajili utafiti kuza katika kiolesura cha wakala.';
    $Self->{Translation}->{'Frontend module registration for the PublicSurvey object in the public Survey area.'} =
        'Moduli ya Frontend ya kusajili kwa ajili ya UtafitiUmma katika eneo la utafiti wa umma.';
    $Self->{Translation}->{'If this regex matches, no customer survey will be sent.'} = 'Kama hii regex inafanana, utafiti wa mteja hautatumwa.';
    $Self->{Translation}->{'Parameters for the pages (in which the surveys are shown) of the small survey overview.'} =
        'Parameta kwa ajili ya kurasa (ambazo ndani yake utafiti umeonyeshwa) za mapitio ya utafiti mdogo. ';
    $Self->{Translation}->{'Public Survey.'} = 'Savei ya umma';
    $Self->{Translation}->{'Shows a link in the menu to edit a survey in its zoom view of the agent interface.'} =
        'Inaonyesha kiungo katika menyu ili kuhariri utafiti katika muonekano uliokuzwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu to edit survey questions in its zoom view of the agent interface.'} =
        'Inaonyesha kiungo katika menyu ili kuhariri maswali ya utafiti katika muonekano uliokuzwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the survey zoom view of the agent interface.'} =
        'Inaonyesha kiungo katika menyu ili kurudi katika muonekano uliokuzwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into the survey statistics details in its zoom view of the agent interface.'} =
        'Inaonyesha kiungo katika menyu ili kukuza maelezo ya takwimu za utafiti katika muonekano uliokuzwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Stats Details'} = 'Maelezo ya tafiti';
    $Self->{Translation}->{'Survey Add Module.'} = '';
    $Self->{Translation}->{'Survey Edit Module.'} = 'Moduli ya kuhariri savei.';
    $Self->{Translation}->{'Survey Overview "Small" Limit'} = 'Mapitio ya savei kikomo "cha chini"';
    $Self->{Translation}->{'Survey Stats Module.'} = 'Moduli ya takwimu za savei.';
    $Self->{Translation}->{'Survey Zoom Module.'} = 'Moduli ya kukuza savei';
    $Self->{Translation}->{'Survey limit per page for Survey Overview "Small".'} = '';
    $Self->{Translation}->{'Surveys will not be sent to the configured email addresses.'} = 'Savei hazitatumwa kwa barua pepe zilizowekwa.';
    $Self->{Translation}->{'The identifier for a survey, e.g. Survey#, MySurvey#. The default is Survey#.'} =
        'Kitambulisho cha utafiti, mf. Utafiti#, Utafiti wangu#. Chaguo-msingi ni Utafiti#.';
    $Self->{Translation}->{'Ticket event module to send automatically survey email requests to customers if a ticket is closed.'} =
        'Moduli ya tukio la tiketi kwa ajili ya kutuma barua pepe za maombi ya tafiti moja kwa moja kwa wateja kama tiketi imefungwa.';
    $Self->{Translation}->{'Trigger sending delayed survey requests.'} = '';
    $Self->{Translation}->{'Zoom into statistics details.'} = '';

}

1;
