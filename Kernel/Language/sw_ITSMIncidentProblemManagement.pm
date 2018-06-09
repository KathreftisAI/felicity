# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sw_ITSMIncidentProblemManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMIncidentProblemManagement
    $Self->{Translation}->{'Add decision to ticket'} = 'Ongeza tiketi ya uamuzi';
    $Self->{Translation}->{'Decision Date'} = 'Tarehe ya uamuzi';
    $Self->{Translation}->{'Decision Result'} = 'Matokeo ya uamuzi';
    $Self->{Translation}->{'Due Date'} = 'Tarehe ukomo';
    $Self->{Translation}->{'Reason'} = 'Sababu';
    $Self->{Translation}->{'Recovery Start Time'} = 'Muda wa kuanza wa urejeshi';
    $Self->{Translation}->{'Repair Start Time'} = 'Muda wa kuanza wa matengenezo';
    $Self->{Translation}->{'Review Required'} = 'mapitio yanahitajika';
    $Self->{Translation}->{'closed with workaround'} = 'Fungwa na mkusanyiko kazi';

    # Template: AgentTicketActionCommon
    $Self->{Translation}->{'Change Decision of Ticket'} = 'Badilisha tiketi ya uamuzi';
    $Self->{Translation}->{'Change ITSM fields of ticket'} = 'Badili tiketi ya uga wa ITSM';
    $Self->{Translation}->{'Service Incident State'} = 'Hali ya tukio ya huduma';

    # Template: AgentTicketEmail
    $Self->{Translation}->{'Link ticket'} = 'Tiketi kiungo';

    # Template: AgentTicketOverviewPreview
    $Self->{Translation}->{'Criticality'} = 'Kwa kina';
    $Self->{Translation}->{'Impact'} = 'Madhara';

    # SysConfig
    $Self->{Translation}->{'Add a decision!'} = 'Ongeza uamuzi!';
    $Self->{Translation}->{'Additional ITSM Fields'} = 'Uga zilizoongezwa Za ITSM';
    $Self->{Translation}->{'Additional ITSM ticket fields.'} = '';
    $Self->{Translation}->{'Allows adding notes in the additional ITSM field screen of the agent interface.'} =
        'Ruhusu kuongeza vidokezo katika skrini ya uga nyongeza ya ITSM ya kiolesura cha wakala.';
    $Self->{Translation}->{'Allows adding notes in the decision screen of the agent interface.'} =
        'Ruhusu kuongeza vidokezo katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Change the ITSM fields!'} = 'Badili uga wa ITSM!';
    $Self->{Translation}->{'Decision'} = 'Uamuzi';
    $Self->{Translation}->{'Defines if a ticket lock is required in the additional ITSM field screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Inafafanua kama kufungwa kwa tiketi kunatakiwa katika skrini ya uga wa ITSM ulioongezwa wa kiolesura cha wakala (kama tiketi haijafungwa bado, tiketi inafungwa na wakala wa sasa atawekwa otomatiki kama mmiliki wake).';
    $Self->{Translation}->{'Defines if a ticket lock is required in the decision screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Inafafanua kama kufungwa kwa tiketi kunatakiwa katika skrini ya maamuzi ya kiolesura cha wakala (kama tiketi haijafungwa bado, tiketi inafungwa na wakala wa sasa atawekwa otomatiki kama mmiliki wake).';
    $Self->{Translation}->{'Defines if the service incident state should be shown during service selection in the agent interface.'} =
        'Inafafanua  kama hali ya tukio ya huduma ionyeshwe wakati wa chaguo la huduma katika kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default body of a note in the additional ITSM field screen of the agent interface.'} =
        'Inafafanua kiini cha chaguo-msingi cha kidokezo katika skrini ya uga wa ITSM ulioongezwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default body of a note in the decision screen of the agent interface.'} =
        'Inafafanua kiini cha chaguo-msingi cha kidokezo katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        'Inafafanua hali nayofuata ya chaguo-msingi baada ya kuongeza kidokezo, katika skrini ya uga wa ITSM ulioongezwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        'Inafafanua hali inayofuata chaguo-msingi ya tiketi baada ya kuongeza kidokezo, katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default subject of a note in the additional ITSM field screen of the agent interface.'} =
        'Inafafanua somo chaguo-msingi la kidokezo katika skrini ya uga wa ITSM uliiongezwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default subject of a note in the decision screen of the agent interface.'} =
        'Inafafanua somo chaguo-msingi la kidokezo katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default ticket priority in the additional ITSM field screen of the agent interface.'} =
        'Inafafanua kipaumbele cha tiketi chaguo msingi katika skrini ya uga wa ITSM uliiongezwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default ticket priority in the decision screen of the agent interface.'} =
        'Inafafanua kipaumbele cha tiketi chaguo msingi katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default type of the note in the additional ITSM field screen of the agent interface.'} =
        'Inafafanua aina ya chaguo msingi ya kidokezo katika skrini ya uga wa ITSM ulioongezwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the default type of the note in the decision screen of the agent interface.'} =
        'Inaelezea aina ya chaguo msingi ya kidokezo katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the history comment for the additional ITSM field screen action, which gets used for ticket history.'} =
        'Inaelezea maoni ya historia kwa ajili ya kitendo cha skrini ya uga wa ITSM ulioongezwa, ambacho kinatumika kwa ajili ya historia ya tiketi.';
    $Self->{Translation}->{'Defines the history comment for the decision screen action, which gets used for ticket history.'} =
        'Inaelezea maoni ya historia kwa aijili ya kitendo cha skrini ya maamuzi, ambacho kinatumika kwa ajili ya historia ya tiketi.';
    $Self->{Translation}->{'Defines the history type for the additional ITSM field screen action, which gets used for ticket history.'} =
        'Inaelezea aina ya historia kwa ajili ya kitendo cha skrini ya uga wa ITSM ulioongezwa , ambacho kinatumika kwa ajili ya historia ya tiketi.';
    $Self->{Translation}->{'Defines the history type for the decision screen action, which gets used for ticket history.'} =
        'Inaelezea aina ya historia kwa ajili ya kitendo cha skrini ya maamuzi, ambacho kinatumika kwa ajili ya historia ya tiketi.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        'Inaelezea hali ifuatayo ya tiketi baada ya kuongeza kidokezo, katika skrini ya uga wa ITSM uliongezwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        'Inaelezea hali ifuatayo ya tiketi baada ya kuongeza kidokezo, katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Dynamic fields shown in the additional ITSM field screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Uga wenye nguvu unaonyeshwa katika skrini ya uga wa ITSM ulioongezwa katika kiolesura cha wakala. Mipangilio inayowezeka: 0=Kutokuwezesha, 1=wezesha, 2=Wezesha na inahitajika.';
    $Self->{Translation}->{'Dynamic fields shown in the decision screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Uga wenye nguvu unaonyeshwa katika skrini ya maamuzi ya kiolesura cha wakala. Mipangilio inayowezeka: 0=Kutokuwezesha, 1=wezesha, 2=Wezesha na inahitajika.';
    $Self->{Translation}->{'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Uga wenye nguvu unaonyeshwa katika skrini ya kutafuta tiketi ya kiolesura cha wakala. Mipangilio inayowezeka: 0=Kutokuwezesha, 1=wezesha.';
    $Self->{Translation}->{'Dynamic fields shown in the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Uga wenye nguvu unaonyeshwa katika skrini iliyokuzwa ya tiketi ya kiolesura cha wakala. Mipangilio inayowezeka: 0=Kutokuwezesha, 1=wezesha.';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket first level solution rate.'} =
        'Wezesha moduli za takwimu kutengeneza takwimu kuhusu wastani wa kiwango cha ufumbuzi cha ngazi ya kwanza ya tiketi ya ITSM.';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket solution.'} =
        'Wezesha moduli za takwimu kutengeneza takwimu kuhusu wastani wa ufumbuzi wa tiketi ya ITSM';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the additional ITSM field screen of the agent interface.'} =
        'Kama kidokezo kimeongezwa na wakala, inaweka hali ya tiketi katika skrini ya uga wa ITSM ulioongezwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the decision screen of the agent interface.'} =
        'Kama kidokezo kimeongezwa na wakala, inaweka hali ya tiketi katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Required permissions to use the additional ITSM field screen in the agent interface.'} =
        'Inahitaji ruhusa kutumia skrini ya uga wa ITSM uliiongezwa katika kiolesura cha wakala.';
    $Self->{Translation}->{'Required permissions to use the decision screen in the agent interface.'} =
        'Inahitaji ruhusa kutumia skrini ya maamuzi katika kiolesura cha wakala.';
    $Self->{Translation}->{'Sets the service in the additional ITSM field screen of the agent interface (Ticket::Service needs to be activated).'} =
        'Inawekwa katika huduma katika skrini ya uga wa ITSM uliiongezwa katika kioelesura cha wakala (Tiketi:: Huduma inahitaji kuamilishwa).';
    $Self->{Translation}->{'Sets the service in the decision screen of the agent interface (Ticket::Service needs to be activated).'} =
        'Inaweka huduma katika skrini ya maamuzi ya kioleusura cha wakala (Tiketi:: Huduma inahitaji kuamilishwa).';
    $Self->{Translation}->{'Sets the ticket owner in the additional ITSM field screen of the agent interface.'} =
        'Inaweka mmiliki wa tiketi katika skrini ya uga wa ITSM iliyoongezwa ya kiolesura cha wakala.';
    $Self->{Translation}->{'Sets the ticket owner in the decision screen of the agent interface.'} =
        'Inaweka mmiliki wa tikwti katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Sets the ticket responsible in the additional ITSM field screen of the agent interface.'} =
        'Inaweka tiketi inayohusika katika skrini ya uga wa ITSM ulioongezwa  wa kiolesura cha wakala.';
    $Self->{Translation}->{'Sets the ticket responsible in the decision screen of the agent interface.'} =
        'Inaweka tiketi inayohusika katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Sets the ticket type in the additional ITSM field screen of the agent interface (Ticket::Type needs to be activated).'} =
        'Inaweka aina ya tiketi katika skrini ya uga wa ITSM ulioongezwa katika kiolesura cha wakala (Tiketi::Aina inayohitaji kuamilishwa).';
    $Self->{Translation}->{'Sets the ticket type in the decision screen of the agent interface (Ticket::Type needs to be activated).'} =
        'Inaweka aina ya tiketi katika skrini ya maamuzi ya kiolesura cha wakala (Tiketi:: Aina inayohitaji kuamilishwa ).';
    $Self->{Translation}->{'Shows a link in the menu to change the decision of a ticket in its zoom view of the agent interface.'} =
        'Inaonyesha kiungo katika menyu cha kubadilisha maamuzi ya tiketi katika mandhari yake iliyokuzwa ya kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a link in the menu to modify additional ITSM fields in the ticket zoom view of the agent interface.'} =
        'Inaonyesha kiungo katika menyu cha kurekebisha uga za ITSM zilizoongezwa katika mandhari ya iliyokuzwa ya tiketi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the additional ITSM field screen of the agent interface.'} =
        'Inaonyesha orodha ya mawakala wote waliohusika katika tiketi hii, katika skrini ya uga wa ITSM ulioongezwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the decision screen of the agent interface.'} =
        'Inaonyesha orodha ya mawakala wote waliohusika katika tiketi hii, katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the additional ITSM field screen of the agent interface.'} =
        'Inaonyesha orodha ya mawakala wote( Mawakala wote wenye kidokezo cha ruhusa katika foleni/tiketi) wanaoweza kugundua nani ataarifiwe kuhusu kidokezo hiki, katika skrini ya uga wa ITSM ulioongezwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the decision screen of the agent interface.'} =
        'Inaonyesha orodha ya mawakala wote( Mawakala wote wenye kidokezo cha ruhusa katika foleni/tiketi) wanaoweza kugundua nani ataarifiwe kuhusu kidokezo hiki, katika skrini ya maamuzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Shows the ticket priority options in the additional ITSM field screen of the agent interface.'} =
        'Inaonyesha michaguo yenye kipaumbele ya tiketi katika skrini uga wa ITSM ulioongezwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Shows the ticket priority options in the decision screen of the agent interface.'} =
        'Inaoyesha ';
    $Self->{Translation}->{'Shows the title fields in the additional ITSM field screen of the agent interface.'} =
        'Inyesha uga za kichwa cha habari katika skrini ya uga wa ITSM ulioongezwa wa kiolesura cha wakala.';
    $Self->{Translation}->{'Shows the title fields in the decision screen of the agent interface.'} =
        'Inyesha uga wa kichwa cha habari katika skrini ya maamzi ya kiolesura cha wakala.';
    $Self->{Translation}->{'Ticket decision.'} = '';

}

1;
