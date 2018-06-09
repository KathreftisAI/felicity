# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::hu_ITSMIncidentProblemManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMIncidentProblemManagement
    $Self->{Translation}->{'Add decision to ticket'} = 'Döntés hozzáadása a jegyhez';
    $Self->{Translation}->{'Decision Date'} = 'Döntés dátuma';
    $Self->{Translation}->{'Decision Result'} = 'Döntés eredménye';
    $Self->{Translation}->{'Due Date'} = 'Határidő';
    $Self->{Translation}->{'Reason'} = 'Ok';
    $Self->{Translation}->{'Recovery Start Time'} = 'Helyreállítás indítási ideje';
    $Self->{Translation}->{'Repair Start Time'} = 'Javítás indítási ideje';
    $Self->{Translation}->{'Review Required'} = 'Áttekintés szükséges';
    $Self->{Translation}->{'closed with workaround'} = 'lezárva kerülő megoldással';

    # Template: AgentTicketActionCommon
    $Self->{Translation}->{'Change Decision of Ticket'} = 'Jegy döntésének módosítása';
    $Self->{Translation}->{'Change ITSM fields of ticket'} = 'Jegy ITSM mezőinek módosítása';
    $Self->{Translation}->{'Service Incident State'} = 'Szolgáltatás incidensállapot';

    # Template: AgentTicketEmail
    $Self->{Translation}->{'Link ticket'} = 'Jegy összekapcsolása';

    # Template: AgentTicketOverviewPreview
    $Self->{Translation}->{'Criticality'} = 'Kritikusság';
    $Self->{Translation}->{'Impact'} = 'Hatás';

    # SysConfig
    $Self->{Translation}->{'Add a decision!'} = 'Adjon hozzá egy döntést!';
    $Self->{Translation}->{'Additional ITSM Fields'} = 'További ITSM mezők';
    $Self->{Translation}->{'Additional ITSM ticket fields.'} = 'További ITSM jegymezők.';
    $Self->{Translation}->{'Allows adding notes in the additional ITSM field screen of the agent interface.'} =
        'Lehetővé teszi jegyzetek hozzáadását az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Allows adding notes in the decision screen of the agent interface.'} =
        'Lehetővé teszi jegyzetek hozzáadását az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Change the ITSM fields!'} = 'Változtassa meg az ITSM mezőket!';
    $Self->{Translation}->{'Decision'} = 'Döntés';
    $Self->{Translation}->{'Defines if a ticket lock is required in the additional ITSM field screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Meghatározza, hogy szükséges-e jegyzárolás az ügyintézői felület további ITSM mező képernyőjén (ha a jegy még nincs zárolva, akkor a jegy zárolva lesz, és az aktuális ügyintéző automatikusan annak tulajdonosaként lesz beállítva).';
    $Self->{Translation}->{'Defines if a ticket lock is required in the decision screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Meghatározza, hogy szükséges-e jegyzárolás az ügyintézői felület döntési képernyőjén (ha a jegy még nincs zárolva, akkor a jegy zárolva lesz, és az aktuális ügyintéző automatikusan annak tulajdonosaként lesz beállítva).';
    $Self->{Translation}->{'Defines if the service incident state should be shown during service selection in the agent interface.'} =
        'Meghatározza, hogy a szolgáltatás incidensállapotát meg kell-e jeleníteni a szolgáltatás kiválasztása közben az ügyintézői felületen.';
    $Self->{Translation}->{'Defines the default body of a note in the additional ITSM field screen of the agent interface.'} =
        'Meghatározza egy jegyzet alapértelmezett törzsét az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Defines the default body of a note in the decision screen of the agent interface.'} =
        'Meghatározza egy jegyzet alapértelmezett törzsét az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        'Meghatározza egy jegy alapértelmezett következő állapotát egy jegyzet hozzáadása után az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        'Meghatározza egy jegy alapértelmezett következő állapotát egy jegyzet hozzáadása után az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Defines the default subject of a note in the additional ITSM field screen of the agent interface.'} =
        'Meghatározza egy jegyzet alapértelmezett tárgyát az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Defines the default subject of a note in the decision screen of the agent interface.'} =
        'Meghatározza egy jegyzet alapértelmezett tárgyát az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Defines the default ticket priority in the additional ITSM field screen of the agent interface.'} =
        'Meghatározza az alapértelmezett jegy prioritást az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Defines the default ticket priority in the decision screen of the agent interface.'} =
        'Meghatározza az alapértelmezett jegyprioritást az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Defines the default type of the note in the additional ITSM field screen of the agent interface.'} =
        'Meghatározza a jegyzet alapértelmezett típusát az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Defines the default type of the note in the decision screen of the agent interface.'} =
        'Meghatározza a jegyzet alapértelmezett típusát az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Defines the history comment for the additional ITSM field screen action, which gets used for ticket history.'} =
        'Azt az előzmény megjegyzést határozza meg a további ITSM mező képernyő műveleténél, amelyet a jegy előzményeinél szoktak használni.';
    $Self->{Translation}->{'Defines the history comment for the decision screen action, which gets used for ticket history.'} =
        'Azt az előzmény megjegyzést határozza meg a döntési képernyő műveleténél, amelyet a jegy előzményeinél szoktak használni.';
    $Self->{Translation}->{'Defines the history type for the additional ITSM field screen action, which gets used for ticket history.'} =
        'Azt az előzmény típust határozza meg a további ITSM mező képernyő műveleténél, amelyet a jegy előzményeinél szoktak használni.';
    $Self->{Translation}->{'Defines the history type for the decision screen action, which gets used for ticket history.'} =
        'Azt az előzmény típust határozza meg a döntési képernyő műveleténél, amelyet a jegy előzményeinél szoktak használni.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the additional ITSM field screen of the agent interface.'} =
        'Meghatározza egy jegy következő állapotát egy jegyzet hozzáadása után az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the decision screen of the agent interface.'} =
        'Meghatározza egy jegy következő állapotát egy jegyzet hozzáadása után az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Dynamic fields shown in the additional ITSM field screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Az ügyintézői felület további ITSM mező képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.';
    $Self->{Translation}->{'Dynamic fields shown in the decision screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.'} =
        'Az ügyintézői felület döntési képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.';
    $Self->{Translation}->{'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Az ügyintézői felület jegykeresés képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve.';
    $Self->{Translation}->{'Dynamic fields shown in the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.'} =
        'Az ügyintézői felület jegynagyítás képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve.';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket first level solution rate.'} =
        'Engedélyezi a statisztikák modult az ITSM jegy első szintű megoldási arányának átlagával kapcsolatos statisztikák előállításához.';
    $Self->{Translation}->{'Enables the stats module to generate statistics about the average of ITSM ticket solution.'} =
        'Engedélyezi a statisztikák modult az ITSM jegy megoldásának átlagával kapcsolatos statisztikák előállításához.';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the additional ITSM field screen of the agent interface.'} =
        'Ha egy ügyintéző hozzáadott egy megjegyzést, akkor beállítja egy jegy állapotát az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of a ticket in the decision screen of the agent interface.'} =
        'Ha egy ügyintéző hozzáadott egy megjegyzést, akkor beállítja egy jegy állapotát az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Required permissions to use the additional ITSM field screen in the agent interface.'} =
        'A szükséges jogosultságok a további ITSM mező képernyőjének használatához az ügyintézői felületen.';
    $Self->{Translation}->{'Required permissions to use the decision screen in the agent interface.'} =
        'A szükséges jogosultságok a döntési képernyő használatához az ügyintézői felületen.';
    $Self->{Translation}->{'Sets the service in the additional ITSM field screen of the agent interface (Ticket::Service needs to be activated).'} =
        'Beállítja a szolgáltatást az ügyintézői felület további ITSM mező képernyőjén (a Ticket::Service lehetőségnek bekapcsolva kell lennie).';
    $Self->{Translation}->{'Sets the service in the decision screen of the agent interface (Ticket::Service needs to be activated).'} =
        'Beállítja a szolgáltatást az ügyintézői felület döntési képernyőjén (a Ticket::Service lehetőségnek bekapcsolva kell lennie).';
    $Self->{Translation}->{'Sets the ticket owner in the additional ITSM field screen of the agent interface.'} =
        'Beállítja a jegy tulajdonosát az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Sets the ticket owner in the decision screen of the agent interface.'} =
        'Beállítja a jegy tulajdonosát az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Sets the ticket responsible in the additional ITSM field screen of the agent interface.'} =
        'Beállítja a jegy felelősét az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Sets the ticket responsible in the decision screen of the agent interface.'} =
        'Beállítja a jegy felelősét az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Sets the ticket type in the additional ITSM field screen of the agent interface (Ticket::Type needs to be activated).'} =
        'Beállítja a jegy típusát az ügyintézői felület további ITSM mező képernyőjén (a Ticket::Type lehetőségnek bekapcsolva kell lennie).';
    $Self->{Translation}->{'Sets the ticket type in the decision screen of the agent interface (Ticket::Type needs to be activated).'} =
        'Beállítja a jegy típusát az ügyintézői felület döntési képernyőjén (a Ticket::Type lehetőségnek bekapcsolva kell lennie).';
    $Self->{Translation}->{'Shows a link in the menu to change the decision of a ticket in its zoom view of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben egy jegy döntésének megváltoztatásához az ügyintézői felületen az elem nagyítási nézetében.';
    $Self->{Translation}->{'Shows a link in the menu to modify additional ITSM fields in the ticket zoom view of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben a további ITSM mezők módosításához az ügyintézői felület jegynagyítás nézetében.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the additional ITSM field screen of the agent interface.'} =
        'Megjeleníti a jegyen részt vevő összes ügyintéző listáját az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the decision screen of the agent interface.'} =
        'Megjeleníti a jegyen részt vevő összes ügyintéző listáját az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the additional ITSM field screen of the agent interface.'} =
        'Megjeleníti az összes lehetséges ügyintéző (a várólistán vagy jegyen jegyzet jogosultsággal rendelkező összes ügyintéző) listáját az ügyintézői felület további ITSM mező képernyőjén annak meghatározásához, hogy kit kell tájékoztatni erről a jegyzetről.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the decision screen of the agent interface.'} =
        'Megjeleníti az összes lehetséges ügyintéző (a várólistán vagy jegyen jegyzet jogosultsággal rendelkező összes ügyintéző) listáját az ügyintézői felület döntési képernyőjén annak meghatározásához, hogy kit kell tájékoztatni erről a jegyzetről.';
    $Self->{Translation}->{'Shows the ticket priority options in the additional ITSM field screen of the agent interface.'} =
        'Megjeleníti a jegy prioritási lehetőségeket az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Shows the ticket priority options in the decision screen of the agent interface.'} =
        'Megjeleníti a jegy prioritási lehetőségeket az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Shows the title fields in the additional ITSM field screen of the agent interface.'} =
        'Megjeleníti a címmezőket az ügyintézői felület további ITSM mező képernyőjén.';
    $Self->{Translation}->{'Shows the title fields in the decision screen of the agent interface.'} =
        'Megjeleníti a címmezőket az ügyintézői felület döntési képernyőjén.';
    $Self->{Translation}->{'Ticket decision.'} = 'Jegydöntés.';

}

1;
