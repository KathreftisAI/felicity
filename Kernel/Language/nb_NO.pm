# --
# Copyright (C) 2004 Arne Georg Gleditsch <argggh at linpro.no>
# Copyright (C) 2005 Espen Stefansen <libbe at stefansen dot net>
# Copyright (C) 2006 Knut Haugen <knuthaug at linpro.no>
# Copyright (C) 2007-2009 Fredrik Andersen <fredrik.andersen at husbanken.no>
# Copyright (C) 2010-2011 Eirik Wulff <eirik at epledoktor.no>
# Copyright (C) 2011 Lars Erik Utsi Gullerud <lerik at nolink.net>
# Copyright (C) 2011 Espen Stefansen <libbe at stefansen dot net>
# Copyright (C) 2012 Lars Magnus Herland <lars.magnus at herland.priv.no>
# Copyright (C) 2013 Espen Stefansen <libbe at stefansen dot net>
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::nb_NO;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # $$START$$
    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D/%M %Y %T';
    $Self->{DateFormatLong}      = '%A %D. %B %Y %T';
    $Self->{DateFormatShort}     = '%D.%M.%Y';
    $Self->{DateInputFormat}     = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';
    $Self->{Completeness}        = 0.565155519414515;

    # csv separator
    $Self->{Separator} = ';';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Ja',
        'No' => 'Nei',
        'yes' => 'ja',
        'no' => 'nei',
        'Off' => 'Av',
        'off' => 'av',
        'On' => 'På',
        'on' => 'på',
        'top' => 'topp',
        'end' => 'slutt',
        'Done' => 'Ferdig',
        'Cancel' => 'Avbryt',
        'Reset' => 'Nullstill',
        'more than ... ago' => 'mer enn ... siden',
        'in more than ...' => 'i mer enn ...',
        'within the last ...' => 'i løpet av de siste ...',
        'within the next ...' => 'i løpet av neste ...',
        'Created within the last' => 'Opprettet i løpet av de siste',
        'Created more than ... ago' => 'Opprettet mer enn ... siden',
        'Today' => 'Idag',
        'Tomorrow' => 'I morgen',
        'Next week' => 'Neste uke',
        'day' => 'dag',
        'days' => 'dager',
        'day(s)' => 'dag(er)',
        'd' => 'd',
        'hour' => 'time',
        'hours' => 'timer',
        'hour(s)' => 'time(r)',
        'Hours' => 'Timer',
        'h' => 't',
        'minute' => 'minutt',
        'minutes' => 'minutter',
        'minute(s)' => 'minutt(er)',
        'Minutes' => 'Minutter',
        'm' => 'm',
        'month' => 'måned',
        'months' => 'måneder',
        'month(s)' => 'måned(er)',
        'week' => 'uke',
        'week(s)' => 'uke(r)',
        'quarter' => 'kvartal',
        'quarter(s)' => 'kvartal(er)',
        'half-year' => 'halvår',
        'half-year(s)' => 'halvår(lig)',
        'year' => 'år',
        'years' => 'år',
        'year(s)' => 'år',
        'second(s)' => 'sekund(er)',
        'seconds' => 'sekunder',
        'second' => 'sekund',
        's' => 's',
        'Time unit' => 'Tidsenhet',
        'wrote' => 'skrev',
        'Message' => 'Melding',
        'Error' => 'Feil',
        'Bug Report' => 'Feil-rapport',
        'Attention' => 'OBS',
        'Warning' => 'Advarsel',
        'Module' => 'Modul',
        'Modulefile' => 'Modulfil',
        'Subfunction' => 'Underfunksjon',
        'Line' => 'Linje',
        'Setting' => 'Innstilling',
        'Settings' => 'Innstillinger',
        'Example' => 'Eksempel',
        'Examples' => 'Eksempler',
        'valid' => 'gyldig',
        'Valid' => 'Gyldig',
        'invalid' => 'ugyldig',
        'Invalid' => 'Ugyldig',
        '* invalid' => '* ugyldig',
        'invalid-temporarily' => 'midlertidig ugyldig',
        ' 2 minutes' => ' 2 minutter',
        ' 5 minutes' => ' 5 minutter',
        ' 7 minutes' => ' 7 minutter',
        '10 minutes' => '10 minutter',
        '15 minutes' => '15 minutter',
        'Mr.' => 'Hr.',
        'Mrs.' => 'Fru',
        'Next' => 'Neste',
        'Back' => 'Tilbake',
        'Next...' => 'Neste...',
        '...Back' => '...Tilbake',
        '-none-' => '-ingen-',
        'none' => 'ingen',
        'none!' => 'ingen!',
        'none - answered' => 'ingen - besvart',
        'please do not edit!' => 'Vennligst ikke endre!',
        'Need Action' => 'Trenger handling',
        'AddLink' => 'Legg til link',
        'Link' => 'Koble',
        'Unlink' => 'Koble fra',
        'Linked' => 'Koblet',
        'Link (Normal)' => 'Koblet (Normal)',
        'Link (Parent)' => 'Koblet (Forelder))',
        'Link (Child)' => 'Koblet (Barn)',
        'Normal' => 'Normal',
        'Parent' => 'Forelder',
        'Child' => 'Barn',
        'Hit' => 'Treff',
        'Hits' => 'Treff',
        'Text' => 'Tekst',
        'Standard' => 'Standard',
        'Lite' => 'Enkel',
        'User' => 'Bruker',
        'Username' => 'Brukernavn',
        'Language' => 'Språk',
        'Languages' => 'Språk',
        'Password' => 'Passord',
        'Preferences' => 'Innstillinger',
        'Salutation' => 'Hilsning',
        'Salutations' => 'Hilsninger',
        'Signature' => 'Signatur',
        'Signatures' => 'Signaturer',
        'Customer' => 'Kunde',
        'CustomerID' => 'Kunde-ID',
        'CustomerIDs' => 'Kunde-IDer',
        'customer' => 'kunde',
        'agent' => 'saksbehandler',
        'system' => 'system',
        'Customer Info' => 'Kunde info',
        'Customer Information' => 'Kundeinformasjon',
        'Customer Companies' => 'Kundefirma',
        'Company' => 'Bedrift',
        'go!' => 'Start!',
        'go' => 'Start',
        'All' => 'Alle',
        'all' => 'alle',
        'Sorry' => 'Beklager',
        'update!' => 'oppdater!',
        'update' => 'oppdater',
        'Update' => 'Oppdater',
        'Updated!' => 'Oppdatert!',
        'submit!' => 'send!',
        'submit' => 'send',
        'Submit' => 'Send',
        'change!' => 'endre!',
        'Change' => 'Endre',
        'change' => 'endre',
        'click here' => 'klikk her',
        'Comment' => 'Kommentar',
        'Invalid Option!' => 'Ugyldig valg',
        'Invalid time!' => 'Ugyldig tid',
        'Invalid date!' => 'Ugyldig dato',
        'Name' => 'Navn',
        'Group' => 'Gruppe',
        'Description' => 'Beskrivelse',
        'description' => 'beskrivelse',
        'Theme' => 'Tema',
        'Created' => 'Opprettet',
        'Created by' => 'Opprettet av',
        'Changed' => 'Endret',
        'Changed by' => 'Endret av',
        'Search' => 'Søk',
        'and' => 'og',
        'between' => 'mellom',
        'before/after' => 'før/etter',
        'Fulltext Search' => 'Fritekst-søk',
        'Data' => 'Data',
        'Options' => 'Valg',
        'Title' => 'Tittel',
        'Item' => 'Punkt',
        'Delete' => 'Slett',
        'Edit' => 'Rediger',
        'View' => 'Bilde',
        'Number' => 'Nummer',
        'System' => 'System',
        'Contact' => 'Kontakt',
        'Contacts' => 'Kontakter',
        'Export' => 'Eksporter',
        'Up' => 'Stigende',
        'Down' => 'Synkende',
        'Add' => 'Legg til',
        'Added!' => 'Lagt til!',
        'Category' => 'Kategori',
        'Viewer' => 'Fremviser',
        'Expand' => 'Utvid',
        'Small' => 'Liten',
        'Medium' => 'Medium',
        'Large' => 'Stor',
        'Date picker' => 'Datovelger',
        'Show Tree Selection' => 'Vis Trestruktur',
        'The field content is too long!' => 'Innholdet i feltet er for langt!',
        'Maximum size is %s characters.' => 'Maksimal lengde er %s tegn.',
        'This field is required or' => 'Dette feltet er obligatorisk eller',
        'New message' => 'Ny melding',
        'New message!' => 'Ny melding!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Vennligst besvar denne/disse sakene for å komme tilbake til det normale køvisningsbildet!',
        'You have %s new message(s)!' => 'Du har %s ny(e) melding(er)!',
        'You have %s reminder ticket(s)!' => 'Du har %s påminnelses-sak(er)!',
        'The recommended charset for your language is %s!' => 'Anbefalt tegnsett for ditt språk er %s!',
        'Change your password.' => 'Endre passordet ditt.',
        'Please activate %s first!' => 'Vennligst aktiver %s først!',
        'No suggestions' => 'Ingen forslag',
        'Word' => 'Ord',
        'Ignore' => 'Ignorer',
        'replace with' => 'erstatt med',
        'There is no account with that login name.' => 'Finner ingen konto med det navnet.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            'Innlogging feilet! Brukernavn eller passord ble skrevet inn feil.',
        'There is no acount with that user name.' => 'Det finnes ingen konto med det brukernavnet',
        'Please contact your administrator' => 'Vennligst kontakt administratoren',
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact your administrator.' =>
            'Pålogging var vellykket, men ingen kundeoppføring er funnet i kundemodulen. Kontakt din administrator',
        'This e-mail address already exists. Please log in or reset your password.' =>
            'Epostadressen finnes allerede. Vennligst logg inn eller nullstill passordet ditt.',
        'Logout' => 'Logg ut',
        'Logout successful. Thank you for using %s!' => 'Utlogging utført.  Takk for at du brukte %s!',
        'Feature not active!' => 'Funksjon ikke aktivert!',
        'Agent updated!' => 'Saksbehandler oppdatert',
        'Database Selection' => 'Databasevalg',
        'Create Database' => 'Opprett database',
        'System Settings' => 'Systeminnstillinger',
        'Mail Configuration' => 'E-postoppsett',
        'Finished' => 'Ferdig',
        'Install OTRS' => 'Installer OTRS',
        'Intro' => 'Introduksjon',
        'License' => 'Lisens',
        'Database' => 'Database',
        'Configure Mail' => 'Konfigurer e-post',
        'Database deleted.' => 'Databasen fjernet',
        'Enter the password for the administrative database user.' => 'Skriv inn passordet for administrator-databasebrukeren.',
        'Enter the password for the database user.' => 'Skriv inn passordet for databasebrukeren.',
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty.' =>
            'Hvis du har satt et root-passord for din database må det bli skrevet inn her. Hvis ikke, la dette feltet være tomt.',
        'Database already contains data - it should be empty!' => 'Databasen inneholder allerede data - den må være tom!',
        'Login is needed!' => 'Innlogging kreves',
        'It is currently not possible to login due to a scheduled system maintenance.' =>
            'Det er for tiden ikke mulig å logge inn på grunn et planlagt vedlikehold',
        'Password is needed!' => 'Passord er påkrevd!',
        'Take this Customer' => 'Velg denne kunden',
        'Take this User' => 'Velg denne brukeren',
        'possible' => 'mulig',
        'reject' => 'Avvises',
        'reverse' => 'motsatt',
        'Facility' => 'Innretning',
        'Time Zone' => 'Tidssone',
        'Pending till' => 'Utsatt til',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            'Ikke bruk Superbruker kontoen til å jobbe med OTRS! Opprett nye Agenter og jobb heller med disse kontoene.',
        'Dispatching by email To: field.' => 'Utsending etter oppføringer i To:-felt.',
        'Dispatching by selected Queue.' => 'Utsending etter valgt kø.',
        'No entry found!' => 'Ingen oppføringer funnet!',
        'Session invalid. Please log in again.' => 'Sesjonen er ugyldig. Vennligst logg inn igjen.',
        'Session has timed out. Please log in again.' => 'Sesjonen har gått ut på tid.  Vennligst logg inn igjen.',
        'Session limit reached! Please try again later.' => 'Grensen for total antall sesjoner er nådd. Vennligst prøv igjen senere.',
        'No Permission!' => 'Ingen rettigheter!',
        '(Click here to add)' => '(Klikk her for å legge til)',
        'Preview' => 'Forhåndsvisning',
        'Package not correctly deployed! Please reinstall the package.' =>
            'Pakken er ikke riktig installert! Vennligst installer pakken på nytt.',
        '%s is not writable!' => '%s er ikke skrivbar!',
        'Cannot create %s!' => 'Kan ikke opprette %s!',
        'Check to activate this date' => 'Kryss av for å aktivere denne datoen',
        'You have Out of Office enabled, would you like to disable it?' =>
            'Du har fraværassistenten aktivert, vil du så den av?',
        'News about OTRS releases!' => 'Nyheter om OTRS utgivelser!',
        'Go to dashboard!' => 'Gå til kontrollpanel',
        'Customer %s added' => 'Kunde %s lagt til',
        'Role added!' => 'Rollen ble lagt til!',
        'Role updated!' => 'Rolle oppdatert!',
        'Attachment added!' => 'Vedlegg lagt til!',
        'Attachment updated!' => 'Vedlegg oppdatert!',
        'Response added!' => 'Svaret ble lagret!',
        'Response updated!' => 'Svaret ble lagret!',
        'Group updated!' => 'Gruppe oppdatert!',
        'Queue added!' => 'Kø lagt til!',
        'Queue updated!' => 'Kø oppdatert!',
        'State added!' => 'Status lagt til!',
        'State updated!' => 'Status oppdatert!',
        'Type added!' => 'Type lagt til!',
        'Type updated!' => 'Type oppdatert!',
        'Customer updated!' => 'Kunde oppdatert!',
        'Customer company added!' => 'Kundebedrift lagt til!',
        'Customer company updated!' => 'Kundebedrift oppdatert!',
        'Note: Company is invalid!' => 'Merk: Bedrift er ugyldig!',
        'Mail account added!' => 'E-postkonto lagt til!',
        'Mail account updated!' => 'E-postkonto oppdatert!',
        'System e-mail address added!' => 'System e-postadresse lagt til!',
        'System e-mail address updated!' => 'System e-postadresse oppdatert!',
        'Contract' => 'Kontrakt',
        'Online Customer: %s' => 'Pålogget kunde: %s',
        'Online Agent: %s' => 'Pålogget agent: %s',
        'Calendar' => 'Kalender',
        'File' => 'Fil',
        'Filename' => 'Filnavn',
        'Type' => 'Type',
        'Size' => 'Størrelse',
        'Upload' => 'Last opp',
        'Directory' => 'Katalog',
        'Signed' => 'Signert',
        'Sign' => 'Signer',
        'Crypted' => 'Kryptert',
        'Crypt' => 'Krypter',
        'PGP' => 'PGP',
        'PGP Key' => 'PGP-nøkkel',
        'PGP Keys' => 'PGP-nøkler',
        'S/MIME' => 'S/MIME',
        'S/MIME Certificate' => 'S/MIME-sertifikat',
        'S/MIME Certificates' => 'S/MIME-sertifikater',
        'Office' => 'Kontor',
        'Phone' => 'Telefon',
        'Fax' => 'Telefaks',
        'Mobile' => 'Mobil',
        'Zip' => 'Postnr',
        'City' => 'By',
        'Street' => 'Gate',
        'Country' => 'Land',
        'Location' => 'Kart',
        'installed' => 'installert',
        'uninstalled' => 'avinstallert',
        'Security Note: You should activate %s because application is already running!' =>
            'Sikkerhetsnotis: Du burde aktivere %s siden applikasjonen allerede kjører!',
        'Unable to parse repository index document.' => 'Kunne ikke lese fjernarkivets indeks',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'Ingen pakker ble funnet for din rammeverk-versjon, kun for andre versjoner',
        'No packages, or no new packages, found in selected repository.' =>
            'Ingen pakker, eller ingen nye pakker ble funnet i valgt fjernarkiv',
        'Edit the system configuration settings.' => 'Endre på systeminnstillingene',
        'ACL information from database is not in sync with the system configuration, please deploy all ACLs.' =>
            'ACL informasjonen fra databasen er ikke i synk med systemkonfigurasjonen, vennligst distributer alle ACLer.',
        'printed at' => 'skrevet ut på',
        'Loading...' => 'Laster...',
        'Dear Mr. %s,' => 'Kjære %s',
        'Dear Mrs. %s,' => 'Kjære %s',
        'Dear %s,' => 'Kjære %s',
        'Hello %s,' => 'Hei %s',
        'This email address is not allowed to register. Please contact support staff.' =>
            'Denne epostadressen er ikke tillatt å registrere. Kontakt brukerstøtten.',
        'New account created. Sent login information to %s. Please check your email.' =>
            'En ny konto har blitt opprettet. Brukernavn og passord er sendt til %s. Vennligst sjekk e-posten din.',
        'Please press Back and try again.' => 'Vennligst gå tilbake og prøv på nytt',
        'Sent password reset instructions. Please check your email.' => 'Instrukser for nullstilling av passord har blitt sendt til din e-postadresse.',
        'Sent new password to %s. Please check your email.' => 'Nytt passord ble sendt til %s. Sjekk e-posten din.',
        'Upcoming Events' => 'Kommende hendelser',
        'Event' => 'Hendelse',
        'Events' => 'Hendelser',
        'Invalid Token!' => 'Ugyldig bevis!',
        'more' => 'mer',
        'Collapse' => 'Minimer',
        'Shown' => 'Vist',
        'Shown customer users' => 'Vis kunde-bruker',
        'News' => 'Nyheter',
        'Product News' => 'Produktnyheter',
        'OTRS News' => 'OTRS-nyheter',
        '7 Day Stats' => '7-dagers statistikk',
        'Process Management information from database is not in sync with the system configuration, please synchronize all processes.' =>
            'Prosessstyringsinformasjon fra databasen er ikke synkronisert med systemkonfigurasjon. Vennligst synkroniser alle prosesser',
        'Package not verified by the OTRS Group! It is recommended not to use this package.' =>
            'Pakken er ikke verifisert av OTRS-gruppen! Det er anbefalt å ikke bruke denne pakken.',
        '<br>If you continue to install this package, the following issues may occur!<br><br>&nbsp;-Security problems<br>&nbsp;-Stability problems<br>&nbsp;-Performance problems<br><br>Please note that issues that are caused by working with this package are not covered by OTRS service contracts!<br><br>' =>
            '<br>Hvis du fortsetter å bruke denne pakken, kan følgende skje:
<br><br>&nbsp;-Sikkerhetsproblemer<br>&nbsp;-Stabilitetsproblemer<br>&nbsp;Ytelsesproblemer<br><br>Vær oppmerksom på at problemer forårsaket av denne pakken ikke er dekket av OTRS supportkontrakter.',
        'Mark' => 'Merk',
        'Unmark' => 'Fjern merking',
        'Bold' => 'Halvfet',
        'Italic' => 'Kursiv',
        'Underline' => 'Understrek',
        'Font Color' => 'Skriftfarge',
        'Background Color' => 'Bakgrunnsfarge',
        'Remove Formatting' => 'Fjern Formatering',
        'Show/Hide Hidden Elements' => 'Vis/Skjul Skjulte Elementer',
        'Align Left' => 'Venstrejuster',
        'Align Center' => 'Midtstill',
        'Align Right' => 'Høyrejuster',
        'Justify' => 'Juster',
        'Header' => 'Overskrift',
        'Indent' => 'Innrykk',
        'Outdent' => 'Utrykk',
        'Create an Unordered List' => 'Lag en unummerert liste',
        'Create an Ordered List' => 'Lag en nummerert liste',
        'HTML Link' => 'HTML-lenke',
        'Insert Image' => 'Sett Inn Bilde',
        'CTRL' => 'CTRL',
        'SHIFT' => 'SKIFT',
        'Undo' => 'Angre',
        'Redo' => 'Omgjør',
        'OTRS Daemon is not running.' => 'OTRS tjenesten kjører ikke',
        'Can\'t contact registration server. Please try again later.' => 'Kan ikke kontakte registreringsserver. Prøv igjen senere.',
        'No content received from registration server. Please try again later.' =>
            'Fikk ikke noe innhold fra registreringsserver. Prøv igjen senere.',
        'Problems processing server result. Please try again later.' => 'Problemer med å prosessere serverresultat. Prøv igjen senere.',
        'Username and password do not match. Please try again.' => 'Brukernavn og passord stemmer ikke overens. Prøv igjen.',
        'The selected process is invalid!' => 'Valgt prosess er ikke gyldig!',
        'Upgrade to %s now!' => 'Oppgrader til %s nå!',
        '%s Go to the upgrade center %s' => '%s Gå til oppgraderingssenteret %s',
        'The license for your %s is about to expire. Please make contact with %s to renew your contract!' =>
            'Lisensen din for %s holder på å gå ut. Vennligst ta kontakt med %s for å fornye din kontrakt!',
        'An update for your %s is available, but there is a conflict with your framework version! Please update your framework first!' =>
            'En oppdatering for %s er tilgjengelig, men det er en konflikt mot din versjon av rammeverket! Vennligst oppgrader ditt rammeverk først!',
        'Your system was successfully upgraded to %s.' => 'Ditt system var vellykket oppgradert til %s.',
        'There was a problem during the upgrade to %s.' => 'Det oppstod et problem under oppgraderingen til %s.',
        '%s was correctly reinstalled.' => '%s ble riktig re-installert.',
        'There was a problem reinstalling %s.' => 'Det var et problem med re-installasjonen av %s',
        'Your %s was successfully updated.' => '%s ble vellykket oppdatert.',
        'There was a problem during the upgrade of %s.' => 'Det var ett problem under oppgraderingen av %s.',
        '%s was correctly uninstalled.' => '%s ble vellykket avinstallert.',
        'There was a problem uninstalling %s.' => 'Det oppstod et problem under avinstallasjonen av %s.',
        'Enable cloud services to unleash all OTRS features!' => 'Aktiver sky-tjenester for å kunne bruke alle OTRS funksjoner',

        # Template: AAACalendar
        'New Year\'s Day' => 'Nyttårsdagen',
        'International Workers\' Day' => 'Internasjonale arbeidernes dag',
        'Christmas Eve' => 'Julaften',
        'First Christmas Day' => 'Første juledag',
        'Second Christmas Day' => 'Andre juledag',
        'New Year\'s Eve' => 'Nyttårsaften',

        # Template: AAAGenericInterface
        'OTRS as requester' => 'OTRS som en etterspørrer',
        'OTRS as provider' => 'OTRS som en leverandør',
        'Webservice "%s" created!' => 'Webtjeneste "%s" lagt til!',
        'Webservice "%s" updated!' => 'Webtjeneste "%s" oppdatert!',

        # Template: AAAMonth
        'Jan' => 'jan',
        'Feb' => 'feb',
        'Mar' => 'mar',
        'Apr' => 'apr',
        'May' => 'mai',
        'Jun' => 'jun',
        'Jul' => 'jul',
        'Aug' => 'aug',
        'Sep' => 'sep',
        'Oct' => 'okt',
        'Nov' => 'nov',
        'Dec' => 'des',
        'January' => 'januar',
        'February' => 'februar',
        'March' => 'mars',
        'April' => 'april',
        'May_long' => 'mai',
        'June' => 'juni',
        'July' => 'juli',
        'August' => 'august',
        'September' => 'september',
        'October' => 'oktober',
        'November' => 'november',
        'December' => 'desember',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'Innstillinger lagret!',
        'User Profile' => 'Brukerprofil',
        'Email Settings' => 'E-postinnstillinger',
        'Other Settings' => 'Andre innstillinger',
        'Notification Settings' => 'Innstillinger for Varsling',
        'Change Password' => 'Endre passord',
        'Current password' => 'Nåværende passord',
        'New password' => 'Nytt passord',
        'Verify password' => 'Gjenta passord',
        'Spelling Dictionary' => 'Ordbok for stavekontroll',
        'Default spelling dictionary' => 'Standard ordliste for stavekontroll',
        'Max. shown Tickets a page in Overview.' => 'Maks. viste saker per side i oversikten.',
        'The current password is not correct. Please try again!' => 'Nåværende passord er ikke korrekt. Prøv igjen.',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Kan ikke oppdatere passordet fordi det nye passordet ikke er skrevet likt i begge felt. Prøv igjen!',
        'Can\'t update password, it contains invalid characters!' => 'Kan ikke oppdatere passordet fordi det inneholder ulovlige tegn!',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Kan ikke oppdatere passordet, det må være minst %s tegn langt!',
        'Can\'t update password, it must contain at least 2 lowercase and 2 uppercase characters!' =>
            'Kan ikke oppdatere passordet, det må inneholde minst to små og to store bokstaver!',
        'Can\'t update password, it must contain at least 1 digit!' => 'Kan ikke oppdatere passordet, det må inneholde minst ett tall!',
        'Can\'t update password, it must contain at least 2 characters!' =>
            'Kan ikke oppdatere passordet fordi det må inneholde minst to bokstaver!',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            'Kan ikke oppdatere passordet fordi du har brukt det før. Vennligst velg et annet!',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Velg et separator-tegn for bruk i CSV-filer (statistikk og søk). Hvis du ikke velger en, vil standardtegnet for språket bli brukt.',
        'CSV Separator' => 'CSV-separator',

        # Template: AAATicket
        'Status View' => 'Statusvisning',
        'Service View' => 'Visning av Tjenester',
        'Bulk' => 'Masseendring',
        'Lock' => 'Ta sak',
        'Unlock' => 'Frigi sak',
        'History' => 'Historikk',
        'Zoom' => 'Detaljer',
        'Age' => 'Alder',
        'Bounce' => 'Oversend',
        'Forward' => 'Videresend',
        'From' => 'Fra',
        'To' => 'Til',
        'Cc' => 'Kopi',
        'Bcc' => 'Blindkopi',
        'Subject' => 'Emne',
        'Move' => 'Flytt',
        'Queue' => 'Kø',
        'Queues' => 'Køer',
        'Priority' => 'Prioritet',
        'Priorities' => 'Prioriteter',
        'Priority Update' => 'Oppdatering av prioritet',
        'Priority added!' => 'Prioritet lagt til!',
        'Priority updated!' => 'Prioritet oppdatert!',
        'Signature added!' => 'Signatur lagt til!',
        'Signature updated!' => 'Signatur oppdatert!',
        'SLA' => 'SLA',
        'Service Level Agreement' => 'Tjenestenivåavtale',
        'Service Level Agreements' => 'Tjenestenivåavtaler',
        'Service' => 'Tjeneste',
        'Services' => 'Tjenester',
        'State' => 'Status',
        'States' => 'Statuser',
        'Status' => 'Status',
        'Statuses' => 'Statuser',
        'Ticket Type' => 'Sakstype',
        'Ticket Types' => 'Sakstyper',
        'Compose' => 'Forfatt',
        'Pending' => 'Satt på vent',
        'Owner' => 'Eier',
        'Owner Update' => 'Oppdatering av eier',
        'Responsible' => 'Ansvarlig',
        'Responsible Update' => 'Oppdatering av ansvarlig',
        'Sender' => 'Avsender',
        'Article' => 'Innlegg',
        'Ticket' => 'Sak',
        'Createtime' => 'Opprettet',
        'plain' => 'rå',
        'Email' => 'E-post',
        'email' => 'e-post',
        'Close' => 'Avslutt sak',
        'Action' => 'Handling',
        'Attachment' => 'Vedlegg',
        'Attachments' => 'Vedlegg',
        'This message was written in a character set other than your own.' =>
            'Denne meldingen ble skrevet i et annet tegnsett enn det du bruker.',
        'If it is not displayed correctly,' => 'Dersom den ikke vises korrekt,',
        'This is a' => 'Dette er en',
        'to open it in a new window.' => 'for å åpne i nytt vindu',
        'This is a HTML email. Click here to show it.' => 'Dette er en HTML e-post. Klikk her for å vise den.',
        'Free Fields' => 'Stikkord',
        'Merge' => 'Flett',
        'merged' => 'flettet',
        'closed successful' => 'løst og lukket',
        'closed unsuccessful' => 'lukket uløst',
        'Locked Tickets Total' => 'Totalt antall saker under behandling',
        'Locked Tickets Reminder Reached' => 'Antall saker med påminnelser',
        'Locked Tickets New' => 'Nye saker under behandling',
        'Responsible Tickets Total' => 'Totalt antall saker du er ansvarlig for',
        'Responsible Tickets New' => 'Nye saker du er ansvarlig for',
        'Responsible Tickets Reminder Reached' => 'Saker du er ansvarlig for med påminnelser',
        'Watched Tickets Total' => 'Totalt antall overvåkede saker',
        'Watched Tickets New' => 'Nye overvåkede saker',
        'Watched Tickets Reminder Reached' => 'Overvåkede saker med påminnelser',
        'All tickets' => 'Alle saker',
        'Available tickets' => 'Tilgjengelige saker',
        'Escalation' => 'Eskalering',
        'last-search' => 'siste søk',
        'QueueView' => 'Køer',
        'Ticket Escalation View' => 'Eskaleringsvisning',
        'Message from' => 'Melding fra',
        'End message' => 'Sluttmelding',
        'Forwarded message from' => 'Videresend meldingen fra',
        'End forwarded message' => 'Avslutt videresendt melding',
        'Bounce Article to a different mail address' => '',
        'Reply to note' => 'Besvar notis',
        'new' => 'ny',
        'open' => 'åpen',
        'Open' => 'Åpen',
        'Open tickets' => 'Åpne saker',
        'closed' => 'avsluttet',
        'Closed' => 'Avsluttet',
        'Closed tickets' => 'Lukkede saker',
        'removed' => 'fjernet',
        'pending reminder' => 'venter på påminnelse',
        'pending auto' => 'venter på automatisk endring',
        'pending auto close+' => 'auto-avslutning (løst)',
        'pending auto close-' => 'auto-avslutning (uløst)',
        'email-external' => 'e-post eksternt',
        'email-internal' => 'e-post internt',
        'note-external' => 'notis eksternt',
        'note-internal' => 'notis internt',
        'note-report' => 'notis til rapport',
        'phone' => 'telefon',
        'sms' => 'sms',
        'webrequest' => 'web-forespørsel',
        'lock' => 'privat',
        'unlock' => 'tilgjengelig',
        'very low' => 'svært lav',
        'low' => 'lav',
        'normal' => 'normal',
        'high' => 'høy',
        'very high' => 'svært høy',
        '1 very low' => '1 svært lav',
        '2 low' => '2 lav',
        '3 normal' => '3 normal',
        '4 high' => '4 høy',
        '5 very high' => '5 svært høy',
        'auto follow up' => 'Automatisk oppfølging',
        'auto reject' => 'Avslå automatisk',
        'auto remove' => 'Fjern automatisk ',
        'auto reply' => 'Svar automatisk',
        'auto reply/new ticket' => 'Svar/ny sak automatisk',
        'Create' => 'Opprett',
        'Answer' => 'Svar',
        'Phone call' => 'Telefon-anrop',
        'Ticket "%s" created!' => 'Sak «%s» opprettet!',
        'Ticket Number' => 'Saksnummer',
        'Ticket Object' => 'Saksobjekt',
        'No such Ticket Number "%s"! Can\'t link it!' => 'Finner ikke saksnummer «%s»! Kan ikke linke til det!',
        'You don\'t have write access to this ticket.' => 'Du har ikke skrivetilgang til denne saken.',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'Beklager, du må være eier av saken for å utføre denne handlingen',
        'Please change the owner first.' => 'Vennligst sett eier først.',
        'Ticket selected.' => 'Sak valgt',
        'Ticket is locked by another agent.' => 'Saken er låst på en annen saksbehandler',
        'Ticket locked.' => 'Saken er låst',
        'Don\'t show closed Tickets' => 'Ikke vis avsluttede saker',
        'Show closed Tickets' => 'Vis avsluttede saker',
        'New Article' => 'Nytt innlegg',
        'Unread article(s) available' => 'Uleste artikler tilgjengelig',
        'Remove from list of watched tickets' => 'Fjern fra listen over overvåkede saker',
        'Add to list of watched tickets' => 'Legg til i listen over overvåkede saker',
        'Email-Ticket' => 'Send e-post',
        'Create new Email Ticket' => 'Opprett ny sak ved å sende e-post',
        'Phone-Ticket' => 'Henvendelser',
        'Search Tickets' => 'Søk i saker',
        'Customer Realname' => 'Kundens navn',
        'Customer History' => 'Kundehistorikk',
        'Edit Customer Users' => 'Rediger kundebrukere',
        'Edit Customer' => 'Endre kunde',
        'Bulk Action' => 'Masseredigering',
        'Bulk Actions on Tickets' => 'Masseredigering på saker',
        'Send Email and create a new Ticket' => 'Send e-post og opprett en ny sak',
        'Create new Email Ticket and send this out (Outbound)' => 'Opprett ny e-post sak, og send denne utgående',
        'Create new Phone Ticket (Inbound)' => 'Opprett ny telefonhenvendelse (inngående)',
        'Address %s replaced with registered customer address.' => 'Adressen %s er byttet ut med adressen som er registrert på kunde',
        'Customer user automatically added in Cc.' => 'Kundebrukeren ble automatisk lagt til Kopi-feltet',
        'Overview of all open Tickets' => 'Oversikt over alle tilgjengelige saker',
        'Locked Tickets' => 'Mine private saker',
        'My Locked Tickets' => 'Mine låste saker',
        'My Watched Tickets' => 'Mine overvåkede saker',
        'My Responsible Tickets' => 'Saker jeg er ansvarlig for',
        'Watched Tickets' => 'Overvåkede saker',
        'Watched' => 'Overvåket',
        'Watch' => 'Overvåk',
        'Unwatch' => 'Ikke overvåk',
        'Lock it to work on it' => 'Lås sak for å arbeide med den',
        'Unlock to give it back to the queue' => 'Frigi sak til køen',
        'Show the ticket history' => 'Vis saks-historikk',
        'Print this ticket' => 'Skriv ut denne saken',
        'Print this article' => 'Skriv ut denne artikkelen',
        'Split' => 'Del',
        'Split this article' => 'Skill ut denne artikkelen',
        'Forward article via mail' => 'Videresend artikkelen via e-post',
        'Change the ticket priority' => 'Bytt prioritet på saken',
        'Change the ticket free fields!' => 'Endre stikkordene!',
        'Link this ticket to other objects' => 'Koble denne saken til andre objekter',
        'Change the owner for this ticket' => 'Bytt eier av denne saken',
        'Change the  customer for this ticket' => 'Bytt kunde i denne saken',
        'Add a note to this ticket' => 'Legg til et notis på denne saken',
        'Merge into a different ticket' => 'Flett inn i en annen sak',
        'Set this ticket to pending' => 'Sett sak som venter tilbakemelding',
        'Close this ticket' => 'Lukk denne saken',
        'Look into a ticket!' => 'Se på sak!',
        'Delete this ticket' => 'Fjern denne saken',
        'Mark as Spam!' => 'Marker som søppel',
        'My Queues' => 'Mine køer',
        'Shown Tickets' => 'Viste saker',
        'Shown Columns' => 'Vis kolonner',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Din e-postsak med nummer "<OTRS_TICKET>" er flettet med "<OTRS_MERGE_TO_TICKET>". ',
        'Ticket %s: first response time is over (%s)!' => 'Sak %s: første responstid tidsfristen er overskredet (%s)!',
        'Ticket %s: first response time will be over in %s!' => 'Sak %s: første responstid tidsfristen er over om %s!',
        'Ticket %s: update time is over (%s)!' => 'Sak %s: oppdateringtidsfristen er overskredet (%s)!',
        'Ticket %s: update time will be over in %s!' => 'Sak %s: oppdateringtidsfristen er over om %s!',
        'Ticket %s: solution time is over (%s)!' => 'Sak %s: løsningtidsfristen er overskredet (%s)!',
        'Ticket %s: solution time will be over in %s!' => 'Sak %s: løsningtidsfristen er over om %s!',
        'There are more escalated tickets!' => 'Det er flere eskalerte saker!',
        'Plain Format' => 'Kildetekst',
        'Reply All' => 'Svar Alle',
        'Direction' => 'Retning',
        'New ticket notification' => 'Varsling ved ny sak',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Send meg en varsling dersom det kommer en ny sak i mine utvalgte køer.',
        'Send new ticket notifications' => 'Send varsling om nye saker',
        'Ticket follow up notification' => 'Varsling ved saksoppfølging',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            'Send varsling hvis kunden sender en oppfølging og jeg eier saken, eller om saken er åpen og i en av mine abonnerte køer.',
        'Send ticket follow up notifications' => 'Send varsling om oppfølging på sak',
        'Ticket lock timeout notification' => 'Varsling ved overskridelse av tidsfrist for avslutting av sak',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Send meg en varsling dersom systemet åpner en avsluttet sak.',
        'Send ticket lock timeout notifications' => 'Send varsling om tidsoverskridelse på sakslås',
        'Ticket move notification' => 'Varsling om flytting av sak',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Send meg en varsling dersom en sak flyttes over i en av mine utvalgte køer.',
        'Send ticket move notifications' => 'Send varsling om flytting av sak',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            'Dine kø-valg over favoritt-køer. Du kan også få notiser om disse køene via e-post om det er skrudd på',
        'Custom Queue' => 'Utvalgte køer',
        'QueueView refresh time' => 'Automatisk oppdateringfrekvens av kø-visningen',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            'Hvis slått på vil kø-listen automatisk oppdatere seg etter spesifisert tid',
        'Refresh QueueView after' => 'Automatisk gjenoppfriskning av kø-visning etter',
        'Screen after new ticket' => 'Skjermbilde etter innlegging av ny sak',
        'Show this screen after I created a new ticket' => 'Vis denne skjermen etter at jeg oppretter en ny sak',
        'Closed Tickets' => 'Avsluttede saker',
        'Show closed tickets.' => 'Vis avsluttede saker.',
        'Max. shown Tickets a page in QueueView.' => 'Max. viste saker per side i kø-visningen.',
        'Ticket Overview "Small" Limit' => 'Begrensning for saksvisning "liten"',
        'Ticket limit per page for Ticket Overview "Small"' => 'Antall saker per side for Saksvisning "liten"',
        'Ticket Overview "Medium" Limit' => 'Begrensning for saksvisning "medium"',
        'Ticket limit per page for Ticket Overview "Medium"' => 'Antall saker per side for Saksvisning "medium"',
        'Ticket Overview "Preview" Limit' => 'Begrensning for saksvisning "forhåndsvisning"',
        'Ticket limit per page for Ticket Overview "Preview"' => 'Antall saker per side for Saksvisning "Forhåndsvisning"',
        'Ticket watch notification' => 'Varsling om overvåkede saker',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            'Send meg samme varsling for overvåkede saker som sakens eier får',
        'Send ticket watch notifications' => 'Send varsling om overvåkede saker',
        'Out Of Office Time' => 'Tidspunkt man er ute fra kontoret',
        'New Ticket' => 'Ny sak',
        'Create new Ticket' => 'Opprett ny sak',
        'Customer called' => 'Kunde oppringt',
        'phone call' => 'telefonsamtale',
        'Phone Call Outbound' => 'Utgående telefonsamtale',
        'Phone Call Inbound' => 'Innkommende telefonsamtale',
        'Reminder Reached' => 'Påminnelse nådd',
        'Reminder Tickets' => 'Saker med påminnelse',
        'Escalated Tickets' => 'Eskalerte saker',
        'New Tickets' => 'Nye saker',
        'Open Tickets / Need to be answered' => 'Åpne saker / Må besvares',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            'Alle åpne saker som trenger arbeid, men som også trenger et svar',
        'All new tickets, these tickets have not been worked on yet' => 'Alle nye saker som ikke har blitt sett på enda.',
        'All escalated tickets' => 'Alle eskalerte saker',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Alle saker med påminnelse satt der påminnelsen har slått til',
        'Archived tickets' => 'Arkiverte saker',
        'Unarchived tickets' => 'Aktive saker',
        'Ticket Information' => 'Saksinformasjon',
        'including subqueues' => 'Inkluderer underkøer',
        'excluding subqueues' => 'Ekskluderer underkøer',

        # Template: AAAWeekDay
        'Sun' => 'søn',
        'Mon' => 'man',
        'Tue' => 'tir',
        'Wed' => 'ons',
        'Thu' => 'tor',
        'Fri' => 'fre',
        'Sat' => 'lør',

        # Template: AdminACL
        'ACL Management' => 'Administrasjon: ACL',
        'Filter for ACLs' => 'Filter for ACLer',
        'Filter' => 'Filter',
        'ACL Name' => 'ACL navn',
        'Actions' => 'Handlinger',
        'Create New ACL' => 'Opprett ACL',
        'Deploy ACLs' => 'Distribuere ACLer',
        'Export ACLs' => 'Eksporter ACLer',
        'Configuration import' => 'Import av konfigurasjon',
        'Here you can upload a configuration file to import ACLs to your system. The file needs to be in .yml format as exported by the ACL editor module.' =>
            '',
        'This field is required.' => 'Dette feltet er obligatorisk.',
        'Overwrite existing ACLs?' => 'Overskriv eksisterende ACLer?',
        'Upload ACL configuration' => 'Last opp ACL konfigurasjon',
        'Import ACL configuration(s)' => 'Importer ACL-konfigurasjon(er)',
        'To create a new ACL you can either import ACLs which were exported from another system or create a complete new one.' =>
            '',
        'Changes to the ACLs here only affect the behavior of the system, if you deploy the ACL data afterwards. By deploying the ACL data, the newly made changes will be written to the configuration.' =>
            '',
        'ACLs' => 'ACLer',
        'Please note: This table represents the execution order of the ACLs. If you need to change the order in which ACLs are executed, please change the names of the affected ACLs.' =>
            '',
        'ACL name' => 'ACL navn',
        'Validity' => 'Gyldighet',
        'Copy' => 'Kopier',
        'No data found.' => 'Ingen data funnet.',

        # Template: AdminACLEdit
        'Edit ACL %s' => 'Endre ACL %',
        'Go to overview' => 'Gå til oversikt',
        'Delete ACL' => 'Slett ACL',
        'Delete Invalid ACL' => 'Slett ugyldig ACL',
        'Match settings' => '',
        'Set up matching criteria for this ACL. Use \'Properties\' to match the current screen or \'PropertiesDatabase\' to match attributes of the current ticket that are in the database.' =>
            '',
        'Change settings' => 'Endre innstillinger',
        'Set up what you want to change if the criteria match. Keep in mind that \'Possible\' is a white list, \'PossibleNot\' a black list.' =>
            '',
        'Check the official' => '',
        'documentation' => 'dokumentasjon',
        'Show or hide the content' => 'Vis eller skjul innholdet',
        'Edit ACL information' => 'Endre ACL informasjon',
        'Stop after match' => 'Stopp ved treff',
        'Edit ACL structure' => 'Endre ACL struktur',
        'Save settings' => 'Lagre innstillinger',
        'Save ACL' => '',
        'Save' => 'Lagre',
        'or' => 'eller',
        'Save and finish' => 'Lagre og fullfør',
        'Do you really want to delete this ACL?' => 'Vil du virkelig fjerne denne ACLen?',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?' =>
            '',
        'An item with this name is already present.' => 'Et objekt med dette navnet eksisterer allerede.',
        'Add all' => 'Legg til alle',
        'There was an error reading the ACL data.' => '',

        # Template: AdminACLNew
        'Create a new ACL by submitting the form data. After creating the ACL, you will be able to add configuration items in edit mode.' =>
            '',

        # Template: AdminAttachment
        'Attachment Management' => 'Administrasjon: Vedlegg',
        'Add attachment' => 'Legg til vedlegg',
        'List' => 'Liste',
        'Download file' => 'Last ned fil',
        'Delete this attachment' => 'Slett dette vedlegget',
        'Do you really want to delete this attachment?' => '',
        'Add Attachment' => 'Legg til vedlegg',
        'Edit Attachment' => 'Endre vedlegg',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Administrasjon: Autosvar',
        'Add auto response' => 'Legg til autosvar',
        'Add Auto Response' => 'Legg Til Autosvar',
        'Edit Auto Response' => 'Endre Autosvar',
        'Response' => 'Svar',
        'Auto response from' => 'Autosvar fra',
        'Reference' => 'Referanse',
        'You can use the following tags' => 'Du kan bruke de følgende "tags"',
        'To get the first 20 character of the subject.' => 'For å hente de første 20 tegnene i overskriften.',
        'To get the first 5 lines of the email.' => 'For å hente de første 5 linjene i e-posten.',
        'To get the name of the ticket\'s customer user (if given).' => '',
        'To get the article attribute' => 'For å hente innlegg-attributtet',
        ' e. g.' => 'f.eks.',
        'Options of the current customer user data' => 'Valg for den nåværende brukerens brukerdata',
        'Ticket owner options' => 'Valg for sakens eier',
        'Ticket responsible options' => 'Valg for saksansvarlige',
        'Options of the current user who requested this action' => 'Valg for den nåværende brukeren som ba om denne handlingen',
        'Options of the ticket data' => 'Valg for sakens data',
        'Options of ticket dynamic fields internal key values' => '',
        'Options of ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            '',
        'Config options' => 'Valg for oppsett',
        'Example response' => 'Eksempel på svar',

        # Template: AdminCloudServiceSupportDataCollector
        'Cloud Service Management' => '',
        'Support Data Collector' => '',
        'Support data collector' => '',
        'Hint' => 'Hint',
        'Currently support data is only shown in this system.' => '',
        'It is highly recommended to send this data to OTRS Group in order to get better support.' =>
            '',
        'Configuration' => 'Konfigurasjon',
        'Send support data' => 'Send support data',
        'This will allow the system to send additional support data information to OTRS Group.' =>
            'Dette vil tillate ditt system å sende tilleggsdatainformasjon til OTRS gruppen.',
        'System Registration' => 'Registrering av systemet',
        'To enable data sending, please register your system with OTRS Group or update your system registration information (make sure to activate the \'send support data\' option.)' =>
            '',
        'Register this System' => 'Registrer dette systemet',
        'System Registration is disabled for your system. Please check your configuration.' =>
            'Registrering av systemet er deaktivert for ditt system. Vennligst undersøk din konfigurasjon.',

        # Template: AdminCloudServices
        'System registration is a service of OTRS Group, which provides a lot of advantages!' =>
            'Registrering av systemet er en tjeneste fra OTRS gruppen, som kan tilby mange fordeler!',
        'Please note that the use of OTRS cloud services requires the system to be registered.' =>
            'Vennligst husk på at bruken av OTRS sine skytjenester krever at systemet er registrert.',
        'Register this system' => 'Registrer dette systemet',
        'Here you can configure available cloud services that communicate securely with %s.' =>
            'Her kan du finne konfigurere tilgjengelige skytjenester som kommuniserer sikkert med %s.',
        'Available Cloud Services' => 'Tilgjengelige skytjenester',
        'Upgrade to %s' => 'Oppgrader til %s',

        # Template: AdminCustomerCompany
        'Customer Management' => 'Administrasjon: Kunder',
        'Wildcards like \'*\' are allowed.' => 'Jokertegn som \'*\ er tillatt',
        'Add customer' => 'Legg til kunde',
        'Select' => 'Velg',
        'List (only %s shown - more available)' => '',
        'List (%s total)' => '',
        'Please enter a search term to look for customers.' => 'Vennligst skriv et søkekriterie for å lete etter kunder',
        'Add Customer' => 'Legg til kunde',

        # Template: AdminCustomerUser
        'Customer User Management' => 'Administrasjon: Kundebruker',
        'Back to search results' => 'Tilbake til søkeresultatet',
        'Add customer user' => 'Legg til kunde-bruker',
        'Customer user are needed to have a customer history and to login via customer panel.' =>
            'Kundebrukere trengs for å kunne ha kundehistorikk og mulighet til å logge inn via brukerpanelet.',
        'Last Login' => 'Siste innlogging',
        'Login as' => 'Logg inn som',
        'Switch to customer' => 'Bytt til kunde',
        'Add Customer User' => 'Legg til kunde-bruker',
        'Edit Customer User' => 'Endre kunde-bruker',
        'This field is required and needs to be a valid email address.' =>
            'Dette feltet er påkrevd og trenger å være en gyldig e-postadresse',
        'This email address is not allowed due to the system configuration.' =>
            'Denne e-postadressen er ikke tillatt i systemkonfigurasjonen',
        'This email address failed MX check.' => 'Denne e-postadressen feilet i en DNS-test (ingen MX)',
        'DNS problem, please check your configuration and the error log.' =>
            'Navntjener (DNS) problem, vennligst se på konfigurasjonen og i error loggen.',
        'The syntax of this email address is incorrect.' => 'Syntaksen på denne e-postadressen er feil.',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => 'Administrere forhold mellom Kunde og Gruppe',
        'Notice' => 'Notis',
        'This feature is disabled!' => 'Denne funksjonen er deaktivert!',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Bruk denne funksjonen kun dersom du vil definere grupperettigheter for kunder.',
        'Enable it here!' => 'Aktiver denne her!',
        'Edit Customer Default Groups' => 'Endre standardgrupper for kunder',
        'These groups are automatically assigned to all customers.' => 'Disse gruppene blir automatisk tildelt alle nye kunder',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'Du kan styre disse gruppene gjennom innstillingen "CustomerGroupAlwaysGroups"',
        'Filter for Groups' => 'Filter for Grupper',
        'Just start typing to filter...' => 'Bare start å skrive, for å filtrere...',
        'Select the customer:group permissions.' => 'Velg rettigheter for kunde:gruppe',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Hvis ingenting blir valgt vil det ikke være noen rettigheter for denne gruppen (saker vil ikke være synlige for brukeren).',
        'Search Results' => 'Søkeresultat',
        'Customers' => 'Kunder',
        'No matches found.' => 'Ingen treff funnet',
        'Groups' => 'Grupper',
        'Change Group Relations for Customer' => 'Endre grupperettigheter for Kunde',
        'Change Customer Relations for Group' => 'Endre kundekoplinger for gruppe',
        'Toggle %s Permission for all' => 'Slå av/på %s-tilgang for alle',
        'Toggle %s permission for %s' => 'Slå av/på %s-tilgang for %s',
        'Customer Default Groups:' => 'Standardgrupper for kunder',
        'No changes can be made to these groups.' => 'Kan ikke endre disse gruppene.',
        'ro' => 'lesetilgang',
        'Read only access to the ticket in this group/queue.' => 'Kun lese-tilgang til saker i denne gruppen/køen.',
        'rw' => 'skrivetilgang',
        'Full read and write access to the tickets in this group/queue.' =>
            'Full lese- og skrive-tilgang til saker i denne gruppen/køen.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => 'Administrere forhold mellom Kunde og Tjeneste',
        'Edit default services' => 'Endre standardtjenester',
        'Filter for Services' => 'Filter for tjenester',
        'Allocate Services to Customer' => 'Legg Tjeneste til Kunde',
        'Allocate Customers to Service' => 'Legg Kunder til Tjeneste',
        'Toggle active state for all' => 'Slå av/på aktivisering for alle',
        'Active' => 'Aktiv',
        'Toggle active state for %s' => 'Slå av/på aktivisering for %s',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => 'Administrasjon: Dynamiske felt',
        'Add new field for object' => 'Legg til nytt felt for et objekt',
        'To add a new field, select the field type from one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            '',
        'Dynamic Fields List' => 'Liste over dynamiske felt',
        'Dynamic fields per page' => 'Dynamiske felt per side',
        'Label' => 'Etikett',
        'Order' => 'Sortering',
        'Object' => 'Objekt',
        'Delete this field' => 'Fjern dette feltet',
        'Do you really want to delete this dynamic field? ALL associated data will be LOST!' =>
            'Vil du virkelig fjerne dette dynamiske feltet? ALLE tilknyttede data vil bli BORTE!',
        'Delete field' => 'Fjern felt',
        'Deleting the field and its data. This may take a while...' => '',

        # Template: AdminDynamicFieldCheckbox
        'Dynamic Fields' => 'Dynamiske felter',
        'Field' => 'Felt',
        'Go back to overview' => 'Gå tilbake til oversikten',
        'General' => 'Generelt',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Dette feltet er påkrevd, og innholdet må bare være bokstaver og tall',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Må være unikt og bare inneholde bokstaver og tall',
        'Changing this value will require manual changes in the system.' =>
            'Endring av denne verdien vil kreve manuelle endringer i systemet.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Dette er navnet som vil bli vist på skjermen hvor feltet er aktivert',
        'Field order' => 'Feltrekkefølge',
        'This field is required and must be numeric.' => 'Dette feltet er påkrevd og må inneholde tall',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Dette er rekkefølgen som vises på feltene på skjermen hvor de er aktive',
        'Field type' => 'Felt type',
        'Object type' => 'Objekt type',
        'Internal field' => 'Internt felt',
        'This field is protected and can\'t be deleted.' => 'Dette feltet er beskyttet og kan ikke slettes.',
        'Field Settings' => 'Felt Innstillinger',
        'Default value' => 'Standardverdi',
        'This is the default value for this field.' => 'Dette er standardverdien for dette feltet',

        # Template: AdminDynamicFieldDateTime
        'Default date difference' => 'Standard dato forskjeller',
        'This field must be numeric.' => 'Dette feltet må inneholde tall',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            '',
        'Define years period' => '',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            '',
        'Years in the past' => '',
        'Years in the past to display (default: 5 years).' => '',
        'Years in the future' => '',
        'Years in the future to display (default: 5 years).' => '',
        'Show link' => 'Vis lenke',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            '',
        'Link for preview' => '',
        'If filled in, this URL will be used for a preview which is shown when this link is hovered in ticket zoom. Please note that for this to work, the regular URL field above needs to be filled in, too.' =>
            '',
        'Restrict entering of dates' => '',
        'Here you can restrict the entering of dates of tickets.' => '',

        # Template: AdminDynamicFieldDropdown
        'Possible values' => 'Tilgjengelige verdier',
        'Key' => 'Nøkkel',
        'Value' => 'Innhold',
        'Remove value' => 'Fjern verdi',
        'Add value' => 'Legg til verdi',
        'Add Value' => 'Legg til verdi',
        'Add empty value' => 'Legg til tom verdi',
        'Activate this option to create an empty selectable value.' => 'Aktiver dette valget for å lage tomme valgbare verdier',
        'Tree View' => 'Trestruktur',
        'Activate this option to display values as a tree.' => 'Aktiver dette valget for å vise verdier som en trestruktur',
        'Translatable values' => 'Oversettbare verdier',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Om du aktiverer dette valget vil verdiene bli oversatt til det bruker har definert som språk',
        'Note' => 'Notis',
        'You need to add the translations manually into the language translation files.' =>
            'Du må legge til oversettelsen manuelt i språk filen',

        # Template: AdminDynamicFieldText
        'Number of rows' => 'Antall rader',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'Spesifiser høyden (i antall linjer) for dette feltet i endrings-modus',
        'Number of cols' => 'Antall kolonner',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'Spesifiser bredden (i antall tegn) for dette feltet i endrings-modus',
        'Check RegEx' => '',
        'Here you can specify a regular expression to check the value. The regex will be executed with the modifiers xms.' =>
            '',
        'RegEx' => 'RegEx',
        'Invalid RegEx' => 'Ugyldig RegEx',
        'Error Message' => 'Feilmelding',
        'Add RegEx' => 'Legg til RegEx',

        # Template: AdminEmail
        'Admin Notification' => 'Administratorvarsling',
        'With this module, administrators can send messages to agents, group or role members.' =>
            'Med denne modulen kan administratorer sende meldinger til saksbehandlere, gruppe- eller rolle-medlemmer',
        'Create Administrative Message' => 'Lag Administrativ melding',
        'Your message was sent to' => 'Meldingen ble sendt til',
        'Send message to users' => 'Send melding til brukere',
        'Send message to group members' => 'Send melding til gruppemedlemmer',
        'Group members need to have permission' => 'Gruppemedlemmer må ha tilgang',
        'Send message to role members' => 'Send melding til medlemmer av rolle',
        'Also send to customers in groups' => 'Send også til kunder i grupper',
        'Body' => 'Meldingstekst',
        'Send' => 'Send',

        # Template: AdminGenericAgent
        'Generic Agent' => 'Generisk agent',
        'Add job' => 'Legg til jobb',
        'Last run' => 'Sist kjørt',
        'Run Now!' => 'Kjør nå!',
        'Delete this task' => 'Slett denne oppgaven',
        'Run this task' => 'Kjør denne oppgaven',
        'Do you really want to delete this task?' => '',
        'Job Settings' => 'Innstillinger for jobb',
        'Job name' => 'Navn',
        'The name you entered already exists.' => 'Navnet du oppga finnes allerede',
        'Toggle this widget' => 'Slå av/på denne modulen',
        'Automatic execution (multiple tickets)' => '',
        'Execution Schedule' => '',
        'Schedule minutes' => 'Minutter',
        'Schedule hours' => 'Timer',
        'Schedule days' => 'Dager',
        'Currently this generic agent job will not run automatically.' =>
            'Føreløpig vil ikke denne generiske agentjobben kjøres automatisk.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'For å skru på automatisk utførelse velg minst en verdi i form av minutter, timer og dager!',
        'Event based execution (single ticket)' => '',
        'Event Triggers' => 'Hendelse utløser',
        'List of all configured events' => '',
        'Delete this event' => 'Fjern denne hendelsen',
        'Additionally or alternatively to a periodic execution, you can define ticket events that will trigger this job.' =>
            '',
        'If a ticket event is fired, the ticket filter will be applied to check if the ticket matches. Only then the job is run on that ticket.' =>
            '',
        'Do you really want to delete this event trigger?' => '',
        'Add Event Trigger' => 'Legg til hendelse utløser',
        'Add Event' => 'Legg til hendelse',
        'To add a new event select the event object and event name and click on the "+" button' =>
            '',
        'Duplicate event.' => 'Klone hendelsen.',
        'This event is already attached to the job, Please use a different one.' =>
            '',
        'Delete this Event Trigger' => 'Fjern denne Hendelses Utløseren',
        'Remove selection' => '',
        'Select Tickets' => 'Velg saker',
        '(e. g. 10*5155 or 105658*)' => 'f.eks. 10*5144 eller 105658*',
        '(e. g. 234321)' => 'f.eks. 234321',
        'Customer user' => 'Kunde',
        '(e. g. U5150)' => 'f.eks. U5150',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Fulltekst-søk i innlegg (f.eks. "Mar*in" eller "Baue*").',
        'Agent' => 'Saksbehandler',
        'Ticket lock' => 'Sakslås',
        'Create times' => 'Opprettelsestidspunkt',
        'No create time settings.' => 'Ingen opprettelsestidspunkt innstillinger.',
        'Ticket created' => 'Sak opprettet',
        'Ticket created between' => 'Sak opprettet mellom',
        'Last changed times' => '',
        'No last changed time settings.' => '',
        'Ticket last changed' => '',
        'Ticket last changed between' => '',
        'Change times' => 'Bytt tider',
        'No change time settings.' => 'Ingen endringstidspunkt innstillinger',
        'Ticket changed' => 'Sak endret',
        'Ticket changed between' => 'Sak endret mellom',
        'Close times' => 'Stengningstidspunkt',
        'No close time settings.' => 'Ingen stengetid-innstilling',
        'Ticket closed' => 'Sak låst',
        'Ticket closed between' => 'Sak låst mellom',
        'Pending times' => 'Ventetider',
        'No pending time settings.' => 'Ingen innstillinger for ventetid.',
        'Ticket pending time reached' => 'Ventetiden er nådd',
        'Ticket pending time reached between' => 'Ventetiden er nådd mellom',
        'Escalation times' => 'Eskaleringstid',
        'No escalation time settings.' => 'Ingen eskaleringsinnstillinger',
        'Ticket escalation time reached' => 'Sakens eskaleringstid nådd',
        'Ticket escalation time reached between' => 'Sakens eskaleringstid nådd mellom',
        'Escalation - first response time' => 'Eskalering - første responstid',
        'Ticket first response time reached' => 'Sakens første responstid nådd',
        'Ticket first response time reached between' => 'Sakens første responstid nådd mellom',
        'Escalation - update time' => 'Eskalering - oppdateringtidspunkt',
        'Ticket update time reached' => 'Sakens oppdateringtidspunkt nådd',
        'Ticket update time reached between' => 'Sakens oppdateringstid nådd mellom',
        'Escalation - solution time' => 'Eskalering - løsnings-tid',
        'Ticket solution time reached' => 'Sakens løsnings-tid nådd',
        'Ticket solution time reached between' => 'Sakens løsnings-tid nådd mellom',
        'Archive search option' => 'Valg for arkivert søk',
        'Update/Add Ticket Attributes' => '',
        'Set new service' => 'Sett ny tjeneste',
        'Set new Service Level Agreement' => 'Sett ny Tjenestenivåavtale',
        'Set new priority' => 'Sett ny prioritet',
        'Set new queue' => 'Sett ny kø',
        'Set new state' => 'Sett ny status',
        'Pending date' => 'Sett på vent til',
        'Set new agent' => 'Sett ny saksbehandler',
        'new owner' => 'ny eier',
        'new responsible' => 'ny ansvarlig',
        'Set new ticket lock' => 'Sett ny sakslås',
        'New customer user' => '',
        'New customer ID' => 'Ny Kunde-ID',
        'New title' => 'Nytt emne',
        'New type' => 'Ny type',
        'New Dynamic Field Values' => 'Nye Dynamiske Felt verdier',
        'Archive selected tickets' => 'Arkiver valgte saker',
        'Add Note' => 'Legg til notis',
        'Time units' => 'Tidsenheter',
        'Execute Ticket Commands' => '',
        'Send agent/customer notifications on changes' => 'Send en saksbehandler-/kunde-varsling ved endringer',
        'CMD' => 'Kommando',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Denne kommandoen vil bli kjørt. ARG[0] vil være saksnummer. ARG[1] saks-id.',
        'Delete tickets' => 'Slett saker',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'ADVARSEL: Alle saker som blir funnet av denne jobben vil bli slettet og kan ikke gjenopprettes!',
        'Execute Custom Module' => 'Kjør tilpasset modul',
        'Param %s key' => 'Nøkkel for Parameter %s',
        'Param %s value' => 'Verdi for Parameter %s',
        'Save Changes' => 'Lagre endringer',
        'Results' => 'Resultat',
        '%s Tickets affected! What do you want to do?' => '%s saker blir påvirket! Hva vil du gjøre?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'ADVARSEL: Du brukte SLETTE-valget. Alle saker som slettes blir borte for godt!',
        'Warning: There are %s tickets affected but only %s may be modified during one job execution!' =>
            '',
        'Edit job' => 'Endre jobb',
        'Run job' => 'Kjør jobb',
        'Affected Tickets' => 'Antall saker påvirket',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => '',
        'You are here' => 'Du er her',
        'Web Services' => 'Webtjenester',
        'Debugger' => 'Feilsøker',
        'Go back to web service' => 'Gå tilbake til web tjeneste',
        'Clear' => 'Tøm',
        'Do you really want to clear the debug log of this web service?' =>
            'Vil du virkelig tømme feilsøkerloggen for denne web tjenesten?',
        'Request List' => '',
        'Time' => 'Tid',
        'Remote IP' => 'Fjernstyrt IP',
        'Loading' => 'Laster',
        'Select a single request to see its details.' => '',
        'Filter by type' => 'Filtrer ut fra type',
        'Filter from' => 'Filtrer fra',
        'Filter to' => 'Filtrer til',
        'Filter by remote IP' => 'Filtrer ut fra ekstern IP',
        'Limit' => 'Grense',
        'Refresh' => 'Oppdater',
        'Request Details' => '',
        'An error occurred during communication.' => 'En feil oppstod under kommunikasjonen',
        'Show or hide the content.' => 'Vis eller skjul innhold.',
        'Clear debug log' => 'Tøm feilsøker loggen',

        # Template: AdminGenericInterfaceInvokerDefault
        'Add new Invoker to Web Service %s' => 'Legg til ny Anroper til Web Tjenesten %s',
        'Change Invoker %s of Web Service %s' => 'Bytt Anroper %s for Web Tjeneste %s',
        'Add new invoker' => 'Legg til ny anroper',
        'Change invoker %s' => 'Bytt anroper %s',
        'Do you really want to delete this invoker?' => 'Vil du virkelig fjerne denne anroperen?',
        'All configuration data will be lost.' => 'Alle konfigurasjons-data vil gå tapt.',
        'Invoker Details' => 'Detaljerte Anrop',
        'The name is typically used to call up an operation of a remote web service.' =>
            'Navnet er typisk brukt for å kalle opp en handling på en fjernstyrt web tjeneste.',
        'Please provide a unique name for this web service invoker.' => 'Vennligst oppgi et unikt navn på denne web tjeneste anroperen.',
        'Invoker backend' => '',
        'This OTRS invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            '',
        'Mapping for outgoing request data' => '',
        'Configure' => 'Konfigurer',
        'The data from the invoker of OTRS will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            '',
        'Mapping for incoming response data' => '',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of OTRS expects.' =>
            '',
        'Asynchronous' => 'Asynkron',
        'This invoker will be triggered by the configured events.' => '',
        'Asynchronous event triggers are handled by the OTRS Scheduler Daemon in background (recommended).' =>
            '',
        'Synchronous event triggers would be processed directly during the web request.' =>
            '',
        'Save and continue' => 'Lagre og fortsett',
        'Delete this Invoker' => 'Fjern denne Anroperen',

        # Template: AdminGenericInterfaceMappingSimple
        'GenericInterface Mapping Simple for Web Service %s' => '',
        'Go back to' => 'Gå tilbake til',
        'Mapping Simple' => '',
        'Default rule for unmapped keys' => 'Standard regler for ukartlagte nøkler',
        'This rule will apply for all keys with no mapping rule.' => 'Denne regelen vil brukes på alle nøkler uten kartleggingsregel.',
        'Default rule for unmapped values' => 'Standard regler for ukartlagte verdier.',
        'This rule will apply for all values with no mapping rule.' => 'Denne regelen vil brukes på alle verdien uten kartleggingsregel.',
        'New key map' => 'Nytt nøkkel mapping',
        'Add key mapping' => 'Legg til nøkkel for mapping',
        'Mapping for Key ' => 'Mapping for nøkkel',
        'Remove key mapping' => 'Fjern nøkkel mapping',
        'Key mapping' => 'Nøkkel mapping',
        'Map key' => 'Mapping nøkkel',
        'matching the' => 'matcher',
        'to new key' => 'til ny nøkkel',
        'Value mapping' => 'Verdi mapping',
        'Map value' => 'Mapping verdi',
        'to new value' => 'til ny verdi',
        'Remove value mapping' => 'Fjern verdi for mapping',
        'New value map' => 'Ny verdi for mapping',
        'Add value mapping' => 'Legg til verdi for mapping',
        'Do you really want to delete this key mapping?' => 'Vil du virkelig slette denne nøkkelen for mapping?',
        'Delete this Key Mapping' => 'Slett denne nøkkelen for mapping',

        # Template: AdminGenericInterfaceMappingXSLT
        'GenericInterface Mapping XSLT for Web Service %s' => '',
        'Mapping XML' => 'Mapping for XML',
        'Template' => 'Mal',
        'The entered data is not a valid XSLT stylesheet.' => '',
        'Insert XSLT stylesheet.' => '',

        # Template: AdminGenericInterfaceOperationDefault
        'Add new Operation to Web Service %s' => 'Legg til ny handling til web tjenesten %s',
        'Change Operation %s of Web Service %s' => 'Endre handling %s på web tjeneste %s',
        'Add new operation' => 'Legg til ny handling',
        'Change operation %s' => 'Bytt handling %s',
        'Do you really want to delete this operation?' => 'Vil du virkelig slette denne handlingen?',
        'Operation Details' => 'Detaljerte handlinger',
        'The name is typically used to call up this web service operation from a remote system.' =>
            '',
        'Please provide a unique name for this web service.' => 'Vennligst velg et unikt navn for denne web tjenesten',
        'Mapping for incoming request data' => '',
        'The request data will be processed by this mapping, to transform it to the kind of data OTRS expects.' =>
            '',
        'Operation backend' => '',
        'This OTRS operation backend module will be called internally to process the request, generating data for the response.' =>
            '',
        'Mapping for outgoing response data' => '',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            '',
        'Delete this Operation' => 'Fjern denne handlingen',

        # Template: AdminGenericInterfaceTransportHTTPREST
        'GenericInterface Transport HTTP::REST for Web Service %s' => '',
        'Network transport' => 'Nettverkstransport',
        'Properties' => 'Egenskaper',
        'Route mapping for Operation' => '',
        'Define the route that should get mapped to this operation. Variables marked by a \':\' will get mapped to the entered name and passed along with the others to the mapping. (e.g. /Ticket/:TicketID).' =>
            '',
        'Valid request methods for Operation' => '',
        'Limit this Operation to specific request methods. If no method is selected all requests will be accepted.' =>
            '',
        'Maximum message length' => 'Maksimal lengde på melding',
        'This field should be an integer number.' => 'Dette feltet inneholde et heltall',
        'Here you can specify the maximum size (in bytes) of REST messages that OTRS will process.' =>
            '',
        'Send Keep-Alive' => 'Send Keep-Alive',
        'This configuration defines if incoming connections should get closed or kept alive.' =>
            '',
        'Host' => 'Tjener',
        'Remote host URL for the REST requests.' => '',
        'e.g https://www.otrs.com:10745/api/v1.0 (without trailing backslash)' =>
            'f.eks. https://www.otrs.com:10745/api/v1.0 (uten skråstrek på slutten)',
        'Controller mapping for Invoker' => '',
        'The controller that the invoker should send requests to. Variables marked by a \':\' will get replaced by the data value and passed along with the request. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).' =>
            '',
        'Valid request command for Invoker' => '',
        'A specific HTTP command to use for the requests with this Invoker (optional).' =>
            '',
        'Default command' => 'Standard kommando',
        'The default HTTP command to use for the requests.' => '',
        'Authentication' => 'Autentisering',
        'The authentication mechanism to access the remote system.' => 'Godkjenningmekanisme for å få tilgang til det fjernstyrte systemet.',
        'A "-" value means no authentication.' => 'En "-" verdi betyr ingen godkjenning.',
        'The user name to be used to access the remote system.' => 'Brukernavnet til bruk for å få tilgang til det fjernstyrte systemet.',
        'The password for the privileged user.' => 'Passordet for den priviligerte brukeren.',
        'Use SSL Options' => 'Bruk SSL valg',
        'Show or hide SSL options to connect to the remote system.' => 'Vis eller skjul SSL valg for å koble til fjernstyrte systemer.',
        'Certificate File' => 'Sertifikat fil',
        'The full path and name of the SSL certificate file.' => 'Full adresse og navn på SSL sertifikat filen.',
        'e.g. /opt/otrs/var/certificates/REST/ssl.crt' => 'f.eks. /opt/otrs/var/certificates/REST/ssl.crt',
        'Certificate Password File' => 'Sertifikat passord fil',
        'The full path and name of the SSL key file.' => 'Full adresse og navn på SSL nøkkel filen.',
        'e.g. /opt/otrs/var/certificates/REST/ssl.key' => 'f.eks. /opt/otrs/var/certificates/REST/ssl.key',
        'Certification Authority (CA) File' => 'Sertifikatmyndighet (CA) fil',
        'The full path and name of the certification authority certificate file that validates the SSL certificate.' =>
            'Full adresse og navn på Sertifikatmyndighet-filen som skal validere SSL sertifikatet.',
        'e.g. /opt/otrs/var/certificates/REST/CA/ca.file' => 'f.eks. /opt/otrs/var/certificates/REST/CA/ca.file',

        # Template: AdminGenericInterfaceTransportHTTPSOAP
        'GenericInterface Transport HTTP::SOAP for Web Service %s' => '',
        'Endpoint' => 'Sluttpunkt',
        'URI to indicate a specific location for accessing a service.' =>
            '',
        'e.g. http://local.otrs.com:8000/Webservice/Example' => 'f.eks. http://local.otrs.com:8000/Webservice/Example',
        'Namespace' => 'Navneområde',
        'URI to give SOAP methods a context, reducing ambiguities.' => '',
        'e.g urn:otrs-com:soap:functions or http://www.otrs.com/GenericInterface/actions' =>
            '',
        'Request name scheme' => '',
        'Select how SOAP request function wrapper should be constructed.' =>
            '',
        '\'FunctionName\' is used as example for actual invoker/operation name.' =>
            '',
        '\'FreeText\' is used as example for actual configured value.' =>
            '',
        'Request name free text' => '',
        'Text to be used to as function wrapper name suffix or replacement.' =>
            '',
        'Please consider XML element naming restrictions (e.g. don\'t use \'<\' and \'&\').' =>
            '',
        'Response name scheme' => '',
        'Select how SOAP response function wrapper should be constructed.' =>
            '',
        'Response name free text' => '',
        'Here you can specify the maximum size (in bytes) of SOAP messages that OTRS will process.' =>
            '',
        'Encoding' => 'Kodifisering',
        'The character encoding for the SOAP message contents.' => '',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => 'f.eks. utf-8, latin1, iso-8859-1, cp1250, etc.',
        'SOAPAction' => 'SOAPAction',
        'Set to "Yes" to send a filled SOAPAction header.' => '',
        'Set to "No" to send an empty SOAPAction header.' => '',
        'SOAPAction separator' => 'SOAPAction-separator',
        'Character to use as separator between name space and SOAP method.' =>
            '',
        'Usually .Net web services uses a "/" as separator.' => '',
        'Proxy Server' => 'Proxy server',
        'URI of a proxy server to be used (if needed).' => 'URL til en proxytjener som skal brukes (dersom nødvendig).',
        'e.g. http://proxy_hostname:8080' => 'f.eks. http://proxy_hostname:8080',
        'Proxy User' => 'Proxy bruker',
        'The user name to be used to access the proxy server.' => '',
        'Proxy Password' => 'Proxy passord',
        'The password for the proxy user.' => 'Passordet for proxybrukeren.',
        'The full path and name of the SSL certificate file (must be in .p12 format).' =>
            'Full adresse og navn på SSL sertifikat filen (må være i .p12 format).',
        'e.g. /opt/otrs/var/certificates/SOAP/certificate.p12' => '',
        'The password to open the SSL certificate.' => 'Passordet for å låse opp SSL sertifikatet.',
        'The full path and name of the certification authority certificate file that validates SSL certificate.' =>
            '',
        'e.g. /opt/otrs/var/certificates/SOAP/CA/ca.pem' => 'f.eks. /opt/otrs/var/certificates/SOAP/CA/ca.pem',
        'Certification Authority (CA) Directory' => '',
        'The full path of the certification authority directory where the CA certificates are stored in the file system.' =>
            '',
        'e.g. /opt/otrs/var/certificates/SOAP/CA' => '',
        'Sort options' => 'Sorteringsvalg',
        'Add new first level element' => '',
        'Element' => '',
        'Outbound sort order for xml fields (structure starting below function name wrapper) - see documentation for SOAP transport.' =>
            '',

        # Template: AdminGenericInterfaceWebservice
        'GenericInterface Web Service Management' => 'Administrasjon: Generiske webtjenester',
        'Add web service' => 'Legg til webtjeneste',
        'Clone web service' => 'Dupliser webtjeneste',
        'The name must be unique.' => 'Dette navnet må være unikt',
        'Clone' => 'Duplisere',
        'Export web service' => 'Eksporter webtjenesten',
        'Import web service' => 'Importer webtjeneste',
        'Configuration File' => 'Konfigurasjons-fil',
        'The file must be a valid web service configuration YAML file.' =>
            'Filen må være en godkjent YAML web tjeneste konfigurasjons-fil',
        'Import' => 'Importer',
        'Configuration history' => 'Konfigurasjonshistorikk',
        'Delete web service' => 'Fjern webtjeneste',
        'Do you really want to delete this web service?' => 'Vil du virkelig fjerne denne webtjenesten?',
        'Ready-to-run Web Services' => '',
        'Here you can activate ready-to-run web services showcasing our best practices that are a part of %s.' =>
            '',
        'Please note that these web services may depend on other modules only available with certain %s contract levels (there will be a notification with further details when importing).' =>
            '',
        'Import ready-to-run web service' => '',
        'Would you like to benefit from web services created by experts? Upgrade to %s to import some sophisticated ready-to-run web services.' =>
            '',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            '',
        'If you want to return to overview please click the "Go to overview" button.' =>
            '',
        'Web Service List' => 'Liste over webtjenester',
        'Remote system' => 'Fjernstyrt system',
        'Provider transport' => '',
        'Requester transport' => '',
        'Debug threshold' => 'Feilsøkergrense',
        'In provider mode, OTRS offers web services which are used by remote systems.' =>
            '',
        'In requester mode, OTRS uses web services of remote systems.' =>
            '',
        'Operations are individual system functions which remote systems can request.' =>
            '',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            '',
        'Controller' => 'Kontrollerer',
        'Inbound mapping' => 'Inngående mapping',
        'Outbound mapping' => 'Utgående mapping',
        'Delete this action' => 'Fjern denne handlingen',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            '',
        'Delete webservice' => 'Fjern webtjenesten',
        'Delete operation' => 'Fjern handlingen',
        'Delete invoker' => 'Slett anroperen',
        'Clone webservice' => 'Dupliser webtjenesten',
        'Import webservice' => 'Importer webtjeneste',

        # Template: AdminGenericInterfaceWebserviceHistory
        'GenericInterface Configuration History for Web Service %s' => '',
        'Go back to Web Service' => 'Gå tilbake til Web Tjenester',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            'Her kan du se eldre versjoner av gjeldende web tjeneste konfigurasjon, eksportere og gjenopprette dem',
        'Configuration History List' => 'Konfigurasjons-historikk',
        'Version' => 'Versjon',
        'Create time' => 'Opprettelses tid',
        'Select a single configuration version to see its details.' => 'Velg en konfigurasjons-versjon for å se dens detaljer',
        'Export web service configuration' => 'Eksporter konfigurasjonenn for web tjenesten',
        'Restore web service configuration' => 'Gjenopprett web tjeneste konfigurasjonen',
        'Do you really want to restore this version of the web service configuration?' =>
            '',
        'Your current web service configuration will be overwritten.' => '',
        'Restore' => 'Gjenopprette',

        # Template: AdminGroup
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'ADVARSEL: Om du endrer navnet til gruppen \'admin\' før du gjør de nødvendige endringer i SysConfig, vil du bli utestengt fra administrator panelet! Om dette skjer, vennligst endre navnet på gruppen tilbake til admin via SQL statement.',
        'Group Management' => 'Administrasjon: Grupper',
        'Add group' => 'Legg til gruppe',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            '\'admin\'-gruppen gir tilgang til Admin-området, \'stats\'-gruppen til Statistikk-området.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Opprett grupper for å håndtere tilgangsrettigheter for forskjellige grupperinger av saksbehandlinger (f.eks. salgsavdelingen, service, innkjøp, osv.)',
        'It\'s useful for ASP solutions. ' => 'Det er nyttig for ASP-løsninger',
        'total' => 'total',
        'Add Group' => 'Legg til gruppe',
        'Edit Group' => 'Endre gruppe',

        # Template: AdminLog
        'System Log' => 'Systemlogg',
        'Here you will find log information about your system.' => 'Her finner du logg-informasjon fra systemet ditt',
        'Hide this message' => 'Skjul denne meldingen',
        'Recent Log Entries' => 'Siste Loggmeldinger',

        # Template: AdminMailAccount
        'Mail Account Management' => 'Administrasjon: E-postkontoer',
        'Add mail account' => 'Legg til e-postkonto',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Innkommende e-poster fra POP3-kontoer blir sortert til valgt kø!',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Dersom kontoen er betrodd vil de eksisterende X-OTRS hodene ved ankomst (for proritet...) bli brukt. PostMaster filtre vil bli brukt uansett.',
        'Delete account' => 'Slett konto',
        'Fetch mail' => 'Hent e-post',
        'Add Mail Account' => 'Legg til e-postkonto',
        'Example: mail.example.com' => 'F.eks.: mail.eksempel.com',
        'IMAP Folder' => 'IMAP mappe',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'Endre denne om du må hente e-post fra en annen mappe en INBOX',
        'Trusted' => 'Betrodd',
        'Dispatching' => 'Fordeling',
        'Edit Mail Account' => 'Rediger e-postkonto',

        # Template: AdminNavigationBar
        'Admin' => 'Administrator',
        'Agent Management' => 'Saksbehandlere',
        'Queue Settings' => 'Oppsett av køer',
        'Ticket Settings' => 'Oppsett av saker',
        'System Administration' => 'Systemadministrasjon',
        'Online Admin Manual' => 'Online Administrator håndbok',

        # Template: AdminNotificationEvent
        'Ticket Notification Management' => '',
        'Add notification' => 'Legg til varsling',
        'Export Notifications' => '',
        'Configuration Import' => '',
        'Here you can upload a configuration file to import Ticket Notifications to your system. The file needs to be in .yml format as exported by the Ticket Notification module.' =>
            '',
        'Overwrite existing notifications?' => '',
        'Upload Notification configuration' => '',
        'Import Notification configuration' => '',
        'Delete this notification' => 'Slett denne varslingen',
        'Do you really want to delete this notification?' => 'Vil du virkelig slette dette varslet?',
        'Add Notification' => 'Legg til varsling',
        'Edit Notification' => 'Endre varsling',
        'Show in agent preferences' => '',
        'Agent preferences tooltip' => '',
        'This message will be shown on the agent preferences screen as a tooltip for this notification.' =>
            '',
        'Here you can choose which events will trigger this notification. An additional ticket filter can be applied below to only send for ticket with certain criteria.' =>
            '',
        'Ticket Filter' => 'Saksfilter',
        'Article Filter' => 'Artikkelfilter',
        'Only for ArticleCreate and ArticleSend event' => '',
        'Article type' => 'Innleggstype',
        'If ArticleCreate or ArticleSend is used as a trigger event, you need to specify an article filter as well. Please select at least one of the article filter fields.' =>
            '',
        'Article sender type' => '',
        'Subject match' => 'Emnetreff',
        'Body match' => 'Meldingstreff',
        'Include attachments to notification' => 'Bruk vedlegg i varslingen',
        'Recipients' => 'Mottakere',
        'Send to' => 'Send til',
        'Send to these agents' => 'Sent til disse saksbehandlerne',
        'Send to all group members' => 'Send til alle gruppemedlemmene',
        'Send to all role members' => 'Send til alle medlemmer av rolle',
        'Send on out of office' => '',
        'Also send if the user is currently out of office.' => '',
        'Once per day' => 'En gang per dag',
        'Notify user just once per day about a single ticket using a selected transport.' =>
            '',
        'Notification Methods' => 'Varslingsmetoder',
        'These are the possible methods that can be used to send this notification to each of the recipients. Please select at least one method below.' =>
            '',
        'Enable this notification method' => '',
        'Transport' => '',
        'At least one method is needed per notification.' => '',
        'Active by default in agent preferences' => '',
        'This is the default value for assigned recipient agents who didn\'t make a choice for this notification in their preferences yet. If the box is enabled, the notification will be sent to such agents.' =>
            '',
        'This feature is currently not available.' => 'Denne funksjonen er p.t. ikke tilgjengelig.',
        'No data found' => 'Ingen data funnet',
        'No notification method found.' => 'Ingen varslingsmetode funnet',
        'Notification Text' => 'Varslingstekst',
        'This language is not present or enabled on the system. This notification text could be deleted if it is not needed anymore.' =>
            '',
        'Remove Notification Language' => '',
        'Message body' => '',
        'Add new notification language' => '',
        'Do you really want to delete this notification language?' => '',
        'Tag Reference' => '',
        'Notifications are sent to an agent or a customer.' => 'Varslinger som sendes til saksbehandlere eller kunder.',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'For å få de første 20 tegn av emnefeltet (fra den siste agentsaken).',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'For å få de første 5 linjene av meldingen (fra den siste agentsaken).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'For å få de første 20 tegn av emnefeltet (fra den siste kundesaken).',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'For å få de første 5 linjene av meldingen (fra den siste kundesaken).',
        'Attributes of the current customer user data' => '',
        'Attributes of the current ticket owner user data' => '',
        'Attributes of the current ticket responsible user data' => '',
        'Attributes of the current agent user who requested this action' =>
            '',
        'Attributes of the recipient user for the notification' => '',
        'Attributes of the ticket data' => '',
        'Ticket dynamic fields internal key values' => '',
        'Ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            '',
        'Example notification' => '',

        # Template: AdminNotificationEventTransportEmailSettings
        'Additional recipient email addresses' => '',
        'You can use OTRS-tags like <OTRS_TICKET_DynamicField_...> to insert values from the current ticket.' =>
            '',
        'Notification article type' => 'Artikkeltype for varsling',
        'An article will be created if the notification is sent to the customer or an additional email address.' =>
            '',
        'Email template' => 'E-post mal',
        'Use this template to generate the complete email (only for HTML emails).' =>
            '',
        'Enable email security' => '',
        'Email security level' => '',
        'If signing key/certificate is missing' => '',
        'If encryption key/certificate is missing' => '',

        # Template: AdminOTRSBusinessInstalled
        'Manage %s' => '',
        'Downgrade to OTRS Free' => 'Nedgrader til OTRS Free',
        'Read documentation' => 'Les dokumentasjonen',
        '%s makes contact regularly with cloud.otrs.com to check on available updates and the validity of the underlying contract.' =>
            '',
        'Unauthorized Usage Detected' => 'Uautorisert bruk oppdaget',
        'This system uses the %s without a proper license! Please make contact with %s to renew or activate your contract!' =>
            'Dette systemet bruker %s uten en gyldig lisens! Vær vennlig å ta kontakt med %s for å fornye eller aktivere din kontrakt!',
        '%s not Correctly Installed' => '%s er ikke riktig installert',
        'Your %s is not correctly installed. Please reinstall it with the button below.' =>
            'Din %s er ikke riktig installert. Vennligst installer på nytt ved hjelp av knappen under.',
        'Reinstall %s' => 'Re-installer %s',
        'Your %s is not correctly installed, and there is also an update available.' =>
            'Din %s er ikke riktig installert og det er også en oppdatering tilgjengelig.',
        'You can either reinstall your current version or perform an update with the buttons below (update recommended).' =>
            'Du kan enten re-installere din gjeldende versjon eller du kan utføre en oppdatering med knappene under (oppdatering er anbefalt).',
        'Update %s' => 'Oppdater %',
        '%s Not Yet Available' => '%s ikke tilgjengelig enda',
        '%s will be available soon.' => '%s vil snart være tilgjengelig',
        '%s Update Available' => '%s oppdatering tilgjengelig',
        'An update for your %s is available! Please update at your earliest!' =>
            'En oppdatering for %s er tilgjengelig! Vennligst oppdater så raskt som mulig!',
        '%s Correctly Deployed' => '% ble vellykket distribuert',
        'Congratulations, your %s is correctly installed and up to date!' =>
            'Gratulerer, %s ble vellykket installert og er oppdatert!',

        # Template: AdminOTRSBusinessNotInstalled
        '%s will be available soon. Please check again in a few days.' =>
            '%s vil være tilgjengelig snart. Vennligst ta en titt igjen om noen dager.',
        'Please have a look at %s for more information.' => 'Vennligst se %s for ytterligere informasjon.',
        'Your OTRS Free is the base for all future actions. Please register first before you continue with the upgrade process of %s!' =>
            '',
        'Before you can benefit from %s, please contact %s to get your %s contract.' =>
            '',
        'Connection to cloud.otrs.com via HTTPS couldn\'t be established. Please make sure that your OTRS can connect to cloud.otrs.com via port 443.' =>
            '',
        'With your existing contract you can only use a small part of the %s.' =>
            '',
        'If you would like to take full advantage of the %s get your contract upgraded now! Contact %s.' =>
            '',

        # Template: AdminOTRSBusinessUninstall
        'Cancel downgrade and go back' => 'Avbryt nedgradering og gå tilbake',
        'Go to OTRS Package Manager' => 'Gå til OTRS pakkehåndtereren',
        'Sorry, but currently you can\'t downgrade due to the following packages which depend on %s:' =>
            '',
        'Vendor' => 'Forhandler',
        'Please uninstall the packages first using the package manager and try again.' =>
            '',
        'You are about to downgrade to OTRS Free and will lose the following features and all data related to these:' =>
            '',
        'Chat' => 'Chat',
        'Report Generator' => 'Rapportgenerator',
        'Timeline view in ticket zoom' => '',
        'DynamicField ContactWithData' => '',
        'DynamicField Database' => '',
        'SLA Selection Dialog' => '',
        'Ticket Attachment View' => '',
        'The %s skin' => '',

        # Template: AdminPGP
        'PGP Management' => 'Administrasjon: PGP',
        'PGP support is disabled' => 'PGP støtte er deaktivert',
        'To be able to use PGP in OTRS, you have to enable it first.' => 'For å kunne bruke PGP funksjonen i OTRS må du først aktivere den.',
        'Enable PGP support' => 'Aktiver PGP støtte',
        'Faulty PGP configuration' => 'Feil i PGP konfigurasjonen',
        'PGP support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'PGP støtte er aktivert, men konfigurasjonen inneholder feil. Vær vennlig å gå igjennom konfigurasjonen ved å bruke knappen nedenfor.',
        'Configure it here!' => 'Konfigurer den her!',
        'Check PGP configuration' => 'Sjekk PGP konfigurasjon',
        'Add PGP key' => 'Legg til PGP-nøkkel',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'På denne måten kan du direkte redigere nøkkelringen som er konfigurert i SysConfig',
        'Introduction to PGP' => 'Introduksjon til PGP',
        'Result' => 'Resultat',
        'Identifier' => 'Nøkkel',
        'Bit' => 'Bit',
        'Fingerprint' => 'Fingeravtrykk',
        'Expires' => 'Utgår',
        'Delete this key' => 'Slett denne nøkkelen',
        'Add PGP Key' => 'Legg Til PGP-nøkkel',
        'PGP key' => 'PGP-nøkkel',

        # Template: AdminPackageManager
        'Package Manager' => 'Pakkehåndterer',
        'Uninstall package' => 'Avinstaller pakke',
        'Do you really want to uninstall this package?' => 'Vil du virkelig avinstallere denne pakken?',
        'Reinstall package' => 're-installer pakken',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'Vil du virkelig re-installere pakken? Alle manuelle endringer vil bli borte.',
        'Continue' => 'Fortsett',
        'Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            '',
        'Install' => 'Installer',
        'Install Package' => 'Installer pakke',
        'Update repository information' => 'Oppdater pakkelager-informasjon',
        'Cloud services are currently disabled.' => '',
        'OTRS Verify™ can not continue!' => '',
        'Enable cloud services' => '',
        'Online Repository' => 'Pakkelager på nettet',
        'Module documentation' => 'Modul-dokumentasjon',
        'Upgrade' => 'Oppgrader',
        'Local Repository' => 'Lokalt pakkelager',
        'This package is verified by OTRSverify (tm)' => '',
        'Uninstall' => 'Avinstaller',
        'Reinstall' => 're-installer',
        'Features for %s customers only' => 'Funksjoner tilgjengelig kun for %s kunder',
        'With %s, you can benefit from the following optional features. Please make contact with %s if you need more information.' =>
            '',
        'Download package' => 'Last ned pakke',
        'Rebuild package' => 'Gjenoppbygg pakke',
        'Metadata' => 'Metadata',
        'Change Log' => 'Endrings-logg',
        'Date' => 'Dato',
        'List of Files' => 'Fil-liste',
        'Permission' => 'Rettigheter',
        'Download' => 'Last ned',
        'Download file from package!' => 'Last ned fil fra pakke!',
        'Required' => 'Påkrevd',
        'Primary Key' => '',
        'Auto Increment' => '',
        'SQL' => 'SQL',
        'File differences for file %s' => 'Forskjeller for filen %s',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Ytelseslogg',
        'This feature is enabled!' => 'Denne funksjonen er aktivert!',
        'Just use this feature if you want to log each request.' => 'Bruk denne funksjonen kun dersom du vil logge hver forespørsel.',
        'Activating this feature might affect your system performance!' =>
            'Aktivering av denne funksjonen kan påvirke system-ytelsen!',
        'Disable it here!' => 'Deaktiver denne her!',
        'Logfile too large!' => 'Loggfilen er for stor!',
        'The logfile is too large, you need to reset it' => 'Loggfilen er for stor, du må nullstille den',
        'Overview' => 'Oversikt',
        'Range' => 'Rekkevidde',
        'last' => 'siste',
        'Interface' => 'Grensesnitt',
        'Requests' => 'Forespørsler',
        'Min Response' => 'Min Respons',
        'Max Response' => 'Max Respons',
        'Average Response' => 'Gjennomsnittlig Respons',
        'Period' => 'Periode',
        'Min' => 'Min',
        'Max' => 'Maks',
        'Average' => 'Gjennomsnitt',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'Administrasjon: E-postfilter',
        'Add filter' => 'Legg til filter',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'For å behandle eller filtrere innkommende e-poster basert på e-posthoder. Regulære uttrykk kan også brukes.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Dersom du ønsker å kun treffe e-postadresser, benytt EMAILADDRESS:info@example.com i Fra, Til eller Kopi.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Hvis du bruker "Regular Expressions" kan du også bruke verdien i () som [***] i "Sett"-verdier.',
        'Delete this filter' => 'Slett dette filteret',
        'Do you really want to delete this filter?' => '',
        'Add PostMaster Filter' => 'Legg til Postmaster-filter',
        'Edit PostMaster Filter' => 'Endre Postmaster-filter',
        'The name is required.' => 'Navn er påkrevd',
        'Filter Condition' => 'Filter-tilstand',
        'AND Condition' => '',
        'Check email header' => '',
        'Negate' => '',
        'Look for value' => 'Se etter verdi',
        'The field needs to be a valid regular expression or a literal word.' =>
            '',
        'Set Email Headers' => 'Sett meldingshoder',
        'Set email header' => 'Sett meldingshode',
        'Set value' => 'Sett verdi',
        'The field needs to be a literal word.' => 'Feltet må inneholde et ord bestående av bokstaver',

        # Template: AdminPriority
        'Priority Management' => 'Administrasjon: Prioriteter',
        'Add priority' => 'Ny prioritering',
        'Add Priority' => 'Ny Prioritering',
        'Edit Priority' => 'Endre Prioritering',

        # Template: AdminProcessManagement
        'Process Management' => 'Prosessoppsett',
        'Filter for Processes' => 'Filter for prosesser',
        'Create New Process' => 'Opprett ny prosess',
        'Deploy All Processes' => '',
        'Here you can upload a configuration file to import a process to your system. The file needs to be in .yml format as exported by process management module.' =>
            '',
        'Overwrite existing entities' => 'Overskriv eksisterende entiteter',
        'Upload process configuration' => 'Last opp prosess konfigurasjon',
        'Import process configuration' => 'Importer prosess konfigurasjon',
        'Ready-to-run Processes' => '',
        'Here you can activate ready-to-run processes showcasing our best practices. Please note that some additional configuration may be required.' =>
            '',
        'Would you like to benefit from processes created by experts? Upgrade to %s to import some sophisticated ready-to-run processes.' =>
            '',
        'Import ready-to-run process' => '',
        'To create a new Process you can either import a Process that was exported from another system or create a complete new one.' =>
            '',
        'Changes to the Processes here only affect the behavior of the system, if you synchronize the Process data. By synchronizing the Processes, the newly made changes will be written to the Configuration.' =>
            '',
        'Processes' => 'Prosesser',
        'Process name' => 'Prosessnavn',
        'Print' => 'Utskrift',
        'Export Process Configuration' => '',
        'Copy Process' => 'Kopier prosess',

        # Template: AdminProcessManagementActivity
        'Cancel & close' => 'Avbryt og lukk',
        'Go Back' => 'Gå tilbake',
        'Please note, that changing this activity will affect the following processes' =>
            '',
        'Activity' => 'Aktivitet',
        'Activity Name' => 'Aktivitetsnavn',
        'Activity Dialogs' => 'Aktivitetsdialoger',
        'You can assign Activity Dialogs to this Activity by dragging the elements with the mouse from the left list to the right list.' =>
            'Du kan tildele aktivitetsdialoger til denne aktiviteten ved å dra elementet med musepekeren fra venstre liste til høyre liste',
        'Ordering the elements within the list is also possible by drag \'n\' drop.' =>
            '',
        'Filter available Activity Dialogs' => '',
        'Available Activity Dialogs' => 'Tilgjengelige aktivitetsdialoger',
        'Name: %s, EntityID: %s' => '',
        'Create New Activity Dialog' => 'Opprett ny aktivitetsdialog',
        'Assigned Activity Dialogs' => 'Tildel aktivitetsdialoger',
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?' =>
            '',

        # Template: AdminProcessManagementActivityDialog
        'Please note that changing this activity dialog will affect the following activities' =>
            '',
        'Please note that customer users will not be able to see or use the following fields: Owner, Responsible, Lock, PendingTime and CustomerID.' =>
            '',
        'The Queue field can only be used by customers when creating a new ticket.' =>
            'Kø feltet kan bare benyttes av kunder når en ny sak opprettes.',
        'Activity Dialog' => 'Aktivitetsdialog',
        'Activity dialog Name' => 'Aktivitetsdialognavn',
        'Available in' => 'Tilgjengelig i',
        'Description (short)' => 'Beskrivelse (kort)',
        'Description (long)' => 'Beskrivelse (lang)',
        'The selected permission does not exist.' => 'Den valgte tilatelsen eksisterer ikke.',
        'Required Lock' => 'Påkrevd lås',
        'The selected required lock does not exist.' => 'Den valgte påkrevde låsen eksisterer ikke.',
        'Submit Advice Text' => '',
        'Submit Button Text' => '',
        'Fields' => 'Felter',
        'You can assign Fields to this Activity Dialog by dragging the elements with the mouse from the left list to the right list.' =>
            '',
        'Filter available fields' => 'Tiltrer på tilgjengelige felter',
        'Available Fields' => 'Tilgjengelige felter',
        'Name: %s' => 'Navn: %s',
        'Assigned Fields' => 'Tilordnede felter',
        'ArticleType' => 'Artikkeltype',
        'Display' => 'Vis',
        'Edit Field Details' => 'Endre feltdetaljer',
        'Customer interface does not support internal article types.' => 'Kundegrensesnittet støtter ikke interne artikkeltyper.',

        # Template: AdminProcessManagementPath
        'Path' => 'Addrese',
        'Edit this transition' => 'Endre denne overgangen',
        'Transition Actions' => 'Overgangshandling',
        'You can assign Transition Actions to this Transition by dragging the elements with the mouse from the left list to the right list.' =>
            'Du kan tildele overgangshandlinger til denne overgangen ved å dra elementet med musepekeren fra venstre liste til høyre liste',
        'Filter available Transition Actions' => 'Filtrer på tilgjengelige overgangshandlinger',
        'Available Transition Actions' => 'Tilgjengelige overgangshandlinger',
        'Create New Transition Action' => 'Opprett ny overgangshandling',
        'Assigned Transition Actions' => 'Tildel overgangshandling',

        # Template: AdminProcessManagementProcessAccordion
        'Activities' => 'Aktiviteter',
        'Filter Activities...' => 'Filtrer aktiviteter...',
        'Create New Activity' => 'Opprett ny aktivitet',
        'Filter Activity Dialogs...' => 'Filtrer aktivitetsdialoger',
        'Transitions' => 'Overganger',
        'Filter Transitions...' => 'Filtrer overganger...',
        'Create New Transition' => 'Opprett ny overgang',
        'Filter Transition Actions...' => 'Filtrer overgangshandlinger',

        # Template: AdminProcessManagementProcessEdit
        'Edit Process' => 'Endre prosess',
        'Print process information' => 'Skriv ut prosessinformasjon',
        'Delete Process' => 'Slett prosess',
        'Delete Inactive Process' => 'Slett inaktive prosesser',
        'Available Process Elements' => 'Tilgjengelige prosesselementer',
        'The Elements listed above in this sidebar can be moved to the canvas area on the right by using drag\'n\'drop.' =>
            '',
        'You can place Activities on the canvas area to assign this Activity to the Process.' =>
            '',
        'To assign an Activity Dialog to an Activity drop the Activity Dialog element from this sidebar over the Activity placed in the canvas area.' =>
            '',
        'You can start a connection between two Activities by dropping the Transition element over the Start Activity of the connection. After that you can move the loose end of the arrow to the End Activity.' =>
            '',
        'Actions can be assigned to a Transition by dropping the Action Element onto the label of a Transition.' =>
            '',
        'Edit Process Information' => 'Endre prosessinformasjon',
        'Process Name' => 'Prosessnavn',
        'The selected state does not exist.' => 'Den valgte tilstand eksisterer ikke.',
        'Add and Edit Activities, Activity Dialogs and Transitions' => '',
        'Show EntityIDs' => '',
        'Extend the width of the Canvas' => '',
        'Extend the height of the Canvas' => '',
        'Remove the Activity from this Process' => 'Fjern aktiviteten fra denne prosessen',
        'Edit this Activity' => 'Endre denne aktiviteten',
        'Save Activities, Activity Dialogs and Transitions' => 'Lagre aktivitetene, aktivitets-dialogene og overgangene',
        'Do you really want to delete this Process?' => 'Vil du virkelig fjerne denne prosessen?',
        'Do you really want to delete this Activity?' => 'Vil du virkelig fjerne denne aktiviteten?',
        'Do you really want to delete this Activity Dialog?' => 'Vil du virkelig fjerne denne aktivitets-dialogen?',
        'Do you really want to delete this Transition?' => 'Vil du virkelig fjerne denne overgangen?',
        'Do you really want to delete this Transition Action?' => 'Vil du virkelig fjerne denne overgangshandlingen?',
        'Do you really want to remove this activity from the canvas? This can only be undone by leaving this screen without saving.' =>
            '',
        'Do you really want to remove this transition from the canvas? This can only be undone by leaving this screen without saving.' =>
            '',
        'Hide EntityIDs' => '',
        'Delete Entity' => 'Slett entitet',
        'Remove Entity from canvas' => 'Fjern entitet fra lerretet',
        'This Activity is already used in the Process. You cannot add it twice!' =>
            'Denne aktiviteten er allerede i bruk i denne prosessen. Du kan ikke leggen den til for andre gang!',
        'This Activity cannot be deleted because it is the Start Activity.' =>
            '',
        'This Transition is already used for this Activity. You cannot use it twice!' =>
            'Denne overgangen er allerede i bruk i denne aktiviteten. Du kan ikke leggen den til for andre gang!',
        'This TransitionAction is already used in this Path. You cannot use it twice!' =>
            'Denne overgangshandlingen er allerede i bruk i denne addressen. Du kan ikke leggen den til for andre gang!',
        'Remove the Transition from this Process' => '',
        'No TransitionActions assigned.' => '',
        'The Start Event cannot loose the Start Transition!' => '',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.' =>
            '',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.' =>
            '',

        # Template: AdminProcessManagementProcessNew
        'In this screen, you can create a new process. In order to make the new process available to users, please make sure to set its state to \'Active\' and synchronize after completing your work.' =>
            '',

        # Template: AdminProcessManagementProcessPrint
        'cancel & close' => '',
        'Start Activity' => 'Start aktivitet',
        'Contains %s dialog(s)' => '',
        'Assigned dialogs' => 'Tilordnede dialoger',
        'Activities are not being used in this process.' => 'Aktiviteter er ikke i bruk i denne prosessen.',
        'Assigned fields' => 'Tilordnede felter',
        'Activity dialogs are not being used in this process.' => 'Aktivitetsdialoger er ikke i bruk i denne prosessen.',
        'Condition linking' => '',
        'Conditions' => 'Tilstander',
        'Condition' => 'Tilstand',
        'Transitions are not being used in this process.' => 'Overganger er ikke i bruk i denne prosessen.',
        'Module name' => 'Modulnavn',
        'Transition actions are not being used in this process.' => '',

        # Template: AdminProcessManagementTransition
        'Please note that changing this transition will affect the following processes' =>
            '',
        'Transition' => 'Overgang',
        'Transition Name' => 'Overgangsnavn',
        'Conditions can only operate on non-empty fields.' => '',
        'Type of Linking between Conditions' => 'Koblingstype mellom tilstander',
        'Remove this Condition' => 'Slett denne tilstanden',
        'Type of Linking' => 'Koblingtype',
        'Add a new Field' => 'Legg til et nytt felt',
        'Remove this Field' => 'Fjern dette feltet',
        'And can\'t be repeated on the same condition.' => '',
        'Add New Condition' => 'Legg til ny tilstand',

        # Template: AdminProcessManagementTransitionAction
        'Please note that changing this transition action will affect the following processes' =>
            '',
        'Transition Action' => 'Overgangshandling',
        'Transition Action Name' => 'Overgangshandling-navn',
        'Transition Action Module' => 'Overgangshandling-modul',
        'Config Parameters' => 'Konfigurer parametere',
        'Add a new Parameter' => 'Legg til et nytt parameter',
        'Remove this Parameter' => 'Fjern dette parameteret',

        # Template: AdminQueue
        'Manage Queues' => 'Kø-administrasjon',
        'Add queue' => 'Ny kø',
        'Add Queue' => 'Legg til kø',
        'Edit Queue' => 'Endre kø',
        'A queue with this name already exists!' => '',
        'Sub-queue of' => 'Under-kø av',
        'Unlock timeout' => 'Tidsintervall for å sette sak tilgjengelig for andre',
        '0 = no unlock' => '0 = ikke gjør saker tilgjengelig',
        'Only business hours are counted.' => 'Kun timene i åpningstiden telles',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Hvis en agent låser en sak og ikke stenger den før låsetiden har passert vil saken bli låst opp og komme tilgjengelig for andre saksbehandlere.',
        'Notify by' => 'Varsle ved',
        '0 = no escalation' => '0 = ingen eskalering',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Hvis det ikke legges til en kundekontakt, enten e-post eller telefon, til en sak innen tiden definert her vil den bli eskalert.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Hvis det kommer inn et objekt, f.eks. en oppfølging på e-post eller fra kundeportalen, vil eskaleringstiden bli nullstilt. Hvis ingen kundekontakt blir lagt til, enten som utgående e-post eller utgående telefon, innen tiden som er spesifisert her, vil saken bli eskalert.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Hvis saken ikke blir stengt innen tiden spesifisert her utløper vil den bli eskalert.',
        'Follow up Option' => 'Korrespondanse på avsluttet sak',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Forteller om oppfølginger på stengte saker skal gjenåpne saken, avvises eller føre til en ny sak.',
        'Ticket lock after a follow up' => 'Saken settes som privat etter oppfølgnings e-post',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Hvis en sak blir stengt og kunden sender en oppfølging vil saken bli låst til den forrige eieren.',
        'System address' => 'Systemadresse',
        'Will be the sender address of this queue for email answers.' => 'Avsenderadresse for e-post i denne køen.',
        'Default sign key' => 'Standard signeringsnøkkel',
        'The salutation for email answers.' => 'Hilsning for e-postsvar.',
        'The signature for email answers.' => 'Signatur for e-postsvar.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => 'Administrasjon av Autosvar for Køer',
        'This filter allow you to show queues without auto responses' => '',
        'Queues without auto responses' => 'Køer uten autosvar',
        'This filter allow you to show all queues' => '',
        'Show all queues' => 'Vis alle køer',
        'Filter for Queues' => 'Filter for køer',
        'Filter for Auto Responses' => 'Filter for Autosvar',
        'Auto Responses' => 'Autosvar',
        'Change Auto Response Relations for Queue' => 'Endre Autosvar-kopling for Kø',

        # Template: AdminQueueTemplates
        'Manage Template-Queue Relations' => 'Koplinger mellom Mal og Kø',
        'Filter for Templates' => 'Filter for Maler',
        'Templates' => 'Maler',
        'Change Queue Relations for Template' => '',
        'Change Template Relations for Queue' => '',

        # Template: AdminRegistration
        'System Registration Management' => '',
        'Edit details' => 'Endre detaljer',
        'Show transmitted data' => 'Vis overført data',
        'Deregister system' => 'Avregistrere system',
        'Overview of registered systems' => 'Oversikt over registrerte systemet',
        'This system is registered with OTRS Group.' => 'Dette systemet er registrert med OTRS gruppen.',
        'System type' => 'Systemtype',
        'Unique ID' => 'Unik ID',
        'Last communication with registration server' => 'Sist kommunikasjon med registreringstjeneren',
        'System registration not possible' => 'Registrering av systemet er ikke mulig',
        'Please note that you can\'t register your system if OTRS Daemon is not running correctly!' =>
            'Vennligst legg merket til at du ikke kan registrere systemet, dersom OTRS tjenesten ikke kjører riktig!',
        'Instructions' => 'Instruksjoner',
        'System deregistration not possible' => 'Avregistrering av systemet er ikke mulig',
        'Please note that you can\'t deregister your system if you\'re using the %s or having a valid service contract.' =>
            '',
        'OTRS-ID Login' => 'OTRS-ID',
        'Read more' => 'Les mer',
        'You need to log in with your OTRS-ID to register your system.' =>
            '',
        'Your OTRS-ID is the email address you used to sign up on the OTRS.com webpage.' =>
            '',
        'Data Protection' => 'Databeskyttelse',
        'What are the advantages of system registration?' => 'Hva er fordelene med registrering av systemet?',
        'You will receive updates about relevant security releases.' => 'Du vil motta oppdateringer om relevante sikkerhetsoppdateringer.',
        'With your system registration we can improve our services for you, because we have all relevant information available.' =>
            '',
        'This is only the beginning!' => 'Dette er bare begynnelsen',
        'We will inform you about our new services and offerings soon.' =>
            '',
        'Can I use OTRS without being registered?' => 'Kan jeg bruke OTRS uten å være registrert?',
        'System registration is optional.' => 'Registrering er valgfritt.',
        'You can download and use OTRS without being registered.' => 'Du kan laste ned og bruke OTRS uten å være registrert.',
        'Is it possible to deregister?' => 'Er det mulig å avregistrere seg?',
        'You can deregister at any time.' => 'Du kan avregistrere deg når som helst.',
        'Which data is transfered when registering?' => 'Hvilke data blir overført ved registrering?',
        'A registered system sends the following data to OTRS Group:' => 'Et registrert system overfører følgende data til OTRS gruppen:',
        'Fully Qualified Domain Name (FQDN), OTRS version, Database, Operating System and Perl version.' =>
            'Fully Qualified Domain Name (FQDN), OTRS versjon, Database-, Operativsystem- og Perl versjon.',
        'Why do I have to provide a description for my system?' => 'Hvorfor må jeg gi en beskrivelse for mitt system?',
        'The description of the system is optional.' => 'Beskrivelsen er valgfri.',
        'The description and system type you specify help you to identify and manage the details of your registered systems.' =>
            '',
        'How often does my OTRS system send updates?' => 'Hvor ofte sender mitt OTRS system oppdateringer?',
        'Your system will send updates to the registration server at regular intervals.' =>
            'Ditt system vil sende oppdateringer til registreringstjeneren med jevne mellomrom.',
        'Typically this would be around once every three days.' => 'Typisk så vil dette være en gang vær tredje dag.',
        'In case you would have further questions we would be glad to answer them.' =>
            '',
        'Please visit our' => 'Vennligst besøk vår',
        'portal' => 'portal',
        'and file a request.' => 'og send inn en forespørsel.',
        'If you deregister your system, you will lose these benefits:' =>
            '',
        'You need to log in with your OTRS-ID to deregister your system.' =>
            '',
        'OTRS-ID' => 'OTRS-ID',
        'You don\'t have an OTRS-ID yet?' => 'Har du ikke en OTRS-ID enda?',
        'Sign up now' => 'Registrer deg her',
        'Forgot your password?' => 'Glemt ditt passord?',
        'Retrieve a new one' => 'Hent en ny en',
        'This data will be frequently transferred to OTRS Group when you register this system.' =>
            '',
        'Attribute' => 'Attributt',
        'FQDN' => 'FQDN',
        'OTRS Version' => 'OTRS versjon',
        'Operating System' => 'Operativsystem',
        'Perl Version' => 'Perl versjon',
        'Optional description of this system.' => 'Valgfri beskrivelse av dette systemet.',
        'Register' => 'Registrer',
        'Deregister System' => 'Avregistrere system',
        'Continuing with this step will deregister the system from OTRS Group.' =>
            '',
        'Deregister' => 'Avregistrere',
        'You can modify registration settings here.' => 'Du kan endre registreringsinnstillingene her.',
        'Overview of transmitted data' => 'Oversikt over overført data',
        'There is no data regularly sent from your system to %s.' => 'Det finnes ikke noe jevnlig data som er sent fra ditt system til %s.',
        'The following data is sent at minimum every 3 days from your system to %s.' =>
            '',
        'The data will be transferred in JSON format via a secure https connection.' =>
            '',
        'System Registration Data' => '',
        'Support Data' => '',

        # Template: AdminRole
        'Role Management' => 'Administrasjon: Roller',
        'Add role' => 'Ny rolle',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Opprett en rolle og legg grupper til rollen. Legg deretter til saksbehandlere til rollen.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'Ingen roller er definerte. Vennligst bruk "Ny rolle" for å opprett en.',
        'Add Role' => 'Ny Rolle',
        'Edit Role' => 'Endre Rolle',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => 'Koplinger mellom Rolle og Gruppe',
        'Filter for Roles' => 'Filter for Roller',
        'Roles' => 'Roller',
        'Select the role:group permissions.' => 'Velg rolle:gruppe-rettigheter',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Hvis ingenting blir valgt vil det ikke være noen tilgang til gruppen (rollen vil ikke se saker for gruppen)',
        'Change Role Relations for Group' => 'Endre gruppens koplinger til roller',
        'Change Group Relations for Role' => 'Endre rollens koplinger til grupper',
        'Toggle %s permission for all' => 'Slå av/på tilgang for alle',
        'move_into' => 'Flytt til',
        'Permissions to move tickets into this group/queue.' => 'Rettighet til å flytte saker i denne gruppen/køen.',
        'create' => 'opprett',
        'Permissions to create tickets in this group/queue.' => 'Rettighet til å opprette saker i denne gruppen/køen.',
        'note' => 'notis',
        'Permissions to add notes to tickets in this group/queue.' => 'Rettigheter for å svare på saker i denne gruppen/køen',
        'owner' => 'Eier',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Rettigheter til å endre eier av saker i denne gruppen/køen',
        'priority' => 'prioritet',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Rettighet til å endre prioritet i denne gruppen/køen.',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => 'Koplinger mellom Saksbehandlere og Roller',
        'Add agent' => 'Legg til saksbehandler',
        'Filter for Agents' => 'Filter for Saksbehandlere',
        'Agents' => 'Saksbehandlere',
        'Manage Role-Agent Relations' => 'Koplinger mellom Rolle og Saksbehandler',
        'Change Role Relations for Agent' => 'Endre saksbehandlerens kopling til roller',
        'Change Agent Relations for Role' => 'Endre rollens kopling til saksbehandlere',

        # Template: AdminSLA
        'SLA Management' => 'Administrasjon: SLA',
        'Add SLA' => 'Ny SLA',
        'Edit SLA' => 'Endre SLA',
        'Please write only numbers!' => 'Vennligst skriv kun siffer',

        # Template: AdminSMIME
        'S/MIME Management' => 'Administrasjon: S/MIME',
        'SMIME support is disabled' => '',
        'To be able to use SMIME in OTRS, you have to enable it first.' =>
            '',
        'Enable SMIME support' => '',
        'Faulty SMIME configuration' => '',
        'SMIME support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            '',
        'Check SMIME configuration' => '',
        'Add certificate' => 'Legg til sertifikat',
        'Add private key' => 'Legg til privat nøkkel',
        'Filter for certificates' => 'Filter for sertifikater',
        'Filter for S/MIME certs' => 'Filter for S/MIME certifikater',
        'To show certificate details click on a certificate icon.' => 'For å vise detaljer rundt sertifikatet, trykk på et sertifikat ikon.',
        'To manage private certificate relations click on a private key icon.' =>
            'For å endre private sertifikat relasjoner, trykk på et privat nøkkel ikon.',
        'Here you can add relations to your private certificate, these will be embedded to the S/MIME signature every time you use this certificate to sign an email.' =>
            '',
        'See also' => 'Se også',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'På denne måten kan du direkte redigere sertifikatet og private nøkler i filsystemet. ',
        'Hash' => 'Hash',
        'Handle related certificates' => 'Behandle relaterte sertifikater',
        'Read certificate' => 'Les sertifikat',
        'Delete this certificate' => 'Slett dette sertifikatet',
        'Add Certificate' => 'Legg til sertifikat',
        'Add Private Key' => 'Legg til privat nøkkel',
        'Secret' => 'Hemmelighet',
        'Related Certificates for' => 'Relaterte sertifikater for',
        'Delete this relation' => 'Fjern denne relasjonen',
        'Available Certificates' => 'Tilgjengelige sertifikater',
        'Relate this certificate' => 'Relater dette sertifikatet',

        # Template: AdminSMIMECertRead
        'Close dialog' => '',
        'Certificate details' => 'Sertifikat detaljer',

        # Template: AdminSalutation
        'Salutation Management' => 'Administrasjon: Hilsninger',
        'Add salutation' => 'Legg til hilsning',
        'Add Salutation' => 'Legg til hilsning',
        'Edit Salutation' => 'Endre hilsning',
        'e. g.' => 'f.eks.',
        'Example salutation' => 'Eksempel på hilsning',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => 'Sikkermodus må slås på!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'Sikkermodus vil (normalt) være satt etter førstegangs-installasjon er ferdig.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Hvis sikkermodus ikke er slått på, slå det på via Systemkonfigurasjon fordi applikasjonen er i drift',

        # Template: AdminSelectBox
        'SQL Box' => 'SQL-boks',
        'Here you can enter SQL to send it directly to the application database. It is not possible to change the content of the tables, only select queries are allowed.' =>
            '',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Her kan du skrive SQL for å sende kommandoer rett til OTRS sin database',
        'Only select queries are allowed.' => 'Kun select spørringer er mulig.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'SQL-spørringen har en syntaks-feil. Vennligst sjekk den.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'Det mangler minst ett parameter i bindingen. Vennligst sjekk den.',
        'Result format' => 'Format for resultatet',
        'Run Query' => 'Kjør spørring',
        'Query is executed.' => 'Spørringen er utført.',

        # Template: AdminService
        'Service Management' => 'Administrasjon: Tjenester',
        'Add service' => 'Ny tjeneste',
        'Add Service' => 'Legg til Tjeneste',
        'Edit Service' => 'Endre Tjeneste',
        'Sub-service of' => 'Under-tjeneste av',

        # Template: AdminSession
        'Session Management' => 'Administrasjon: Sesjoner',
        'All sessions' => 'Alle sesjoner',
        'Agent sessions' => 'Saksbehandler-sesjoner',
        'Customer sessions' => 'Kunde-sesjoner',
        'Unique agents' => 'Unike saksbehandlere',
        'Unique customers' => 'Unike kunder',
        'Kill all sessions' => 'Terminer alle sesjoner',
        'Kill this session' => 'Terminer denne sesjonen',
        'Session' => 'Sesjon',
        'Kill' => 'Terminer',
        'Detail View for SessionID' => 'Detaljert visning av SesjonsID',

        # Template: AdminSignature
        'Signature Management' => 'Administrasjon: Signaturer',
        'Add signature' => 'Ny signatur',
        'Add Signature' => 'Legg til signatur',
        'Edit Signature' => 'Endre Signatur',
        'Example signature' => 'Eksempel på signatur',

        # Template: AdminState
        'State Management' => 'Administrasjon: Statuser',
        'Add state' => 'Ny Status',
        'Please also update the states in SysConfig where needed.' => 'Vennligst også oppdatert nødvendige statuser i SysConfig',
        'Add State' => 'Legg til status',
        'Edit State' => 'Endre status',
        'State type' => 'Statustype',

        # Template: AdminSupportDataCollector
        'Sending support data to OTRS Group is not possible!' => '',
        'Enable Cloud Services' => '',
        'This data is sent to OTRS Group on a regular basis. To stop sending this data please update your system registration.' =>
            '',
        'You can manually trigger the Support Data sending by pressing this button:' =>
            '',
        'Send Update' => 'Send oppdatering',
        'Sending Update...' => 'Sender oppdatering...',
        'Support Data information was successfully sent.' => '',
        'Was not possible to send Support Data information.' => '',
        'Update Result' => 'Oppdateringsresultat',
        'Currently this data is only shown in this system.' => '',
        'A support bundle (including: system registration information, support data, a list of installed packages and all locally modified source code files) can be generated by pressing this button:' =>
            '',
        'Generate Support Bundle' => '',
        'Generating...' => 'Genererer....',
        'It was not possible to generate the Support Bundle.' => '',
        'Generate Result' => '',
        'Support Bundle' => '',
        'The mail could not be sent' => '',
        'The support bundle has been generated.' => '',
        'Please choose one of the following options.' => '',
        'Send by Email' => 'Send på e-post',
        'The support bundle is too large to send it by email, this option has been disabled.' =>
            '',
        'The email address for this user is invalid, this option has been disabled.' =>
            '',
        'Sending' => 'Sender',
        'The support bundle will be sent to OTRS Group via email automatically.' =>
            '',
        'Download File' => 'Last ned fil',
        'A file containing the support bundle will be downloaded to the local system. Please save the file and send it to the OTRS Group, using an alternate method.' =>
            '',
        'Error: Support data could not be collected (%s).' => '',
        'Details' => 'Detaljer',

        # Template: AdminSysConfig
        'SysConfig' => 'Systemkonfigurasjon',
        'Navigate by searching in %s settings' => 'Naviger ved å søke i %-oppsett',
        'Navigate by selecting config groups' => 'Naviger ved å velge oppsettsgrupperinger',
        'Download all system config changes' => 'Last ned alle konfigurasjons-endringer',
        'Export settings' => 'Eksport av oppsettet',
        'Load SysConfig settings from file' => 'Last inn konfigurasjon fra fil',
        'Import settings' => 'Importer oppsett',
        'Import Settings' => 'Importer oppsett',
        'Please enter a search term to look for settings.' => 'Vennligst skriv inn et søk for å finne oppsett',
        'Subgroup' => 'Undergruppe',
        'Elements' => 'Elementer',

        # Template: AdminSysConfigEdit
        'Edit Config Settings in %s → %s' => '',
        'This setting is read only.' => 'Denne innstillingene kan bare leses.',
        'This config item is only available in a higher config level!' =>
            'Dette konfigurasjons-objektet er kun tilgjengelig på et høyere administrasjonsnivå',
        'Reset this setting' => 'Nullstill denne innstillingen',
        'Error: this file could not be found.' => 'Feil: denne filen ble ikke funnet.',
        'Error: this directory could not be found.' => 'Feil: denne mappen ble ikke funnet.',
        'Error: an invalid value was entered.' => 'Feil: en ugyldig verdi ble skrevet inn',
        'Content' => 'Innhold',
        'Remove this entry' => 'Slett denne posten',
        'Add entry' => 'Ny post',
        'Remove entry' => 'Slett post',
        'Add new entry' => 'Ny post',
        'Delete this entry' => 'Slett denne posten',
        'Create new entry' => 'Opprett ny post',
        'New group' => 'Ny gruppe',
        'Group ro' => 'Gruppe kun-les',
        'Readonly group' => 'Gruppen kan kun leses',
        'New group ro' => 'Ny gruppe kun-les',
        'Loader' => 'Innlaster',
        'File to load for this frontend module' => 'Fil som skal lastes for denne frontsidemodulen',
        'New Loader File' => 'Ny Innlastingsfil',
        'NavBarName' => 'navBarName',
        'NavBar' => 'Navigasjons-meny',
        'LinkOption' => 'Lenkevalg',
        'Block' => 'Blokk',
        'AccessKey' => 'Tilgangstast',
        'Add NavBar entry' => 'Ny Navigasjons-meny-knapp',
        'NavBar module' => '',
        'Year' => 'År',
        'Month' => 'Måned',
        'Day' => 'Dag',
        'Invalid year' => 'Ugyldig år',
        'Invalid month' => 'Ugyldig måned',
        'Invalid day' => 'Ugyldig dag',
        'Show more' => 'Vis mer',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Administrasjon: Systemets E-postadresser',
        'Add system address' => 'Ny systemadresse',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'All innkommende e-post til denne adressen i To eller CC vil bli lagt i den valgte køen',
        'Email address' => 'E-postadresse',
        'Display name' => 'Vist navn',
        'Add System Email Address' => 'Legg til Systemadresse',
        'Edit System Email Address' => 'Endre Systemadresse',
        'The display name and email address will be shown on mail you send.' =>
            'Vist navn og e-postadresse vil vises på e-posten du sender ut',

        # Template: AdminSystemMaintenance
        'System Maintenance Management' => '',
        'Schedule New System Maintenance' => '',
        'Schedule a system maintenance period for announcing the Agents and Customers the system is down for a time period.' =>
            '',
        'Some time before this system maintenance starts the users will receive a notification on each screen announcing about this fact.' =>
            '',
        'Start date' => 'Startdato',
        'Stop date' => 'Sluttdato',
        'Delete System Maintenance' => '',
        'Do you really want to delete this scheduled system maintenance?' =>
            '',

        # Template: AdminSystemMaintenanceEdit
        'Edit System Maintenance %s' => '',
        'Edit System Maintenance Information' => '',
        'Date invalid!' => 'Ugyldig dato!',
        'Login message' => 'Innloggingsmelding',
        'Show login message' => 'Vis innloggingsmelding',
        'Notify message' => 'Varselmelding',
        'Manage Sessions' => 'Sesjons-administrasjon',
        'All Sessions' => 'Alle sesjoner',
        'Agent Sessions' => 'Saksbehandler-sesjoner',
        'Customer Sessions' => 'Kunde-sesjoner',
        'Kill all Sessions, except for your own' => '',

        # Template: AdminTemplate
        'Manage Templates' => 'Mal-administrasjon',
        'Add template' => 'Legg til mal',
        'A template is a default text which helps your agents to write faster tickets, answers or forwards.' =>
            '',
        'Don\'t forget to add new templates to queues.' => '',
        'Do you really want to delete this template?' => 'Virkelig slette denne malen?',
        'Add Template' => 'Legg til Mal',
        'Edit Template' => 'Endre Mal',
        'A standard template with this name already exists!' => '',
        'Create type templates only supports this smart tags' => '',
        'Example template' => 'Eksempel på mal',
        'The current ticket state is' => 'Nåværende status på sak',
        'Your email address is' => 'Din e-postadresse er',

        # Template: AdminTemplateAttachment
        'Manage Templates <-> Attachments Relations' => 'Koplinger mellom Mal og Vedlegg',
        'Filter for Attachments' => 'Filter for vedlegg',
        'Change Template Relations for Attachment' => '',
        'Change Attachment Relations for Template' => '',
        'Toggle active for all' => 'Aktiver/Deaktiver alle',
        'Link %s to selected %s' => 'Koble %s til valgt %s',

        # Template: AdminType
        'Type Management' => 'Administrasjon: Typer',
        'Add ticket type' => 'Ny sakstype',
        'Add Type' => 'Legg til sakstype',
        'Edit Type' => 'Endre sakstype',
        'A type with this name already exists!' => '',

        # Template: AdminUser
        'Agents will be needed to handle tickets.' => 'Saksbehandlere trengs for å behandle saker',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'Ikke glem å legge saksbehandlere i grupper og/eller roller',
        'Please enter a search term to look for agents.' => 'Skriv et søk for å finne saksbehandlere',
        'Last login' => 'Siste innlogging',
        'Switch to agent' => 'Bytt til saksbehandler',
        'Add Agent' => 'Legg til Saksbehandler',
        'Edit Agent' => 'Endre Saksbehandler',
        'Title or salutation' => '',
        'Firstname' => 'Fornavn',
        'Lastname' => 'Etternavn',
        'A user with this username already exists!' => '',
        'Will be auto-generated if left empty.' => '',
        'Start' => 'Start',
        'End' => 'Slutt',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => 'Koplinger mellom Saksbehandler og Gruppe',
        'Change Group Relations for Agent' => 'Endre gruppekoplinger for saksbehandler',
        'Change Agent Relations for Group' => 'Endre saksbehandlerkoplinger for gruppe',

        # Template: AgentBook
        'Address Book' => 'Adressebok',
        'Search for a customer' => 'Søk etter kunde',
        'Add email address %s to the To field' => 'Legg til adressen %s i To-feltet',
        'Add email address %s to the Cc field' => 'Legg til adressen %s i Cc-feltet',
        'Add email address %s to the Bcc field' => 'Legg til adressen %s i Bcc-feltet',
        'Apply' => 'Lagre',

        # Template: AgentCustomerInformationCenter
        'Customer Information Center' => '',

        # Template: AgentCustomerInformationCenterSearch
        'Customer User' => 'Kunde-bruker',

        # Template: AgentCustomerSearch
        'Duplicated entry' => 'Doble innlegg',
        'This address already exists on the address list.' => 'Denne adressen finnes allerede i adresseboken',
        'It is going to be deleted from the field, please try again.' => '',

        # Template: AgentCustomerTableView
        'Note: Customer is invalid!' => 'Merk: Kunden er ugyldig!',
        'Start chat' => '',
        'Video call' => '',
        'Audio call' => '',

        # Template: AgentDaemonInfo
        'The OTRS Daemon is a daemon process that performs asynchronous tasks, e.g. ticket escalation triggering, email sending, etc.' =>
            '',
        'A running OTRS Daemon is mandatory for correct system operation.' =>
            'En kjørende OTRS agent er påkrevd for at systemet skal kjøre riktig.',
        'Starting the OTRS Daemon' => 'Innstillinger for OTRS Agenten',
        'Make sure that the file \'%s\' exists (without .dist extension). This cron job will check every 5 minutes if the OTRS Daemon is running and start it if needed.' =>
            '',
        'Execute \'%s start\' to make sure the cron jobs of the \'otrs\' user are active.' =>
            '',
        'After 5 minutes, check that the OTRS Daemon is running in the system (\'bin/otrs.Daemon.pl status\').' =>
            '',

        # Template: AgentDashboard
        'Dashboard' => 'Kontrollpanel',

        # Template: AgentDashboardCalendarOverview
        'in' => 'om',

        # Template: AgentDashboardCommon
        'Close this widget' => '',
        'Available Columns' => 'Tilgjengelige kolonner',
        'Visible Columns (order by drag & drop)' => 'Tilgjengelige kolonner (sorter ved dra og slipp)',

        # Template: AgentDashboardCustomerIDStatus
        'Escalated tickets' => 'Eskalerte saker',

        # Template: AgentDashboardCustomerUserList
        'Customer login' => 'Kundeinnlogging',
        'Customer information' => 'Kundeinformasjon',
        'Phone ticket' => 'Telefonsak',
        'Email ticket' => 'E-postsak',
        '%s open ticket(s) of %s' => '%s åpne sak(er) av %s',
        '%s closed ticket(s) of %s' => '%s lukkede sak(er) av %s',
        'New phone ticket from %s' => 'Ny telefonsak fra %s',
        'New email ticket to %s' => 'Ny e-postsak til %s',

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s er tilgjengelig!',
        'Please update now.' => 'Vennligst oppdater nå.',
        'Release Note' => 'Versjons-notis',
        'Level' => 'Nivå',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Postet for %s siden',

        # Template: AgentDashboardStats
        'The configuration for this statistic widget contains errors, please review your settings.' =>
            '',
        'Download as SVG file' => 'Last ned som SVG fil',
        'Download as PNG file' => 'Last ned som PNG fil',
        'Download as CSV file' => 'Last ned som CSV fil',
        'Download as Excel file' => 'Last ned som Excel fil',
        'Download as PDF file' => 'Last ned som PDF fil',
        'Grouped' => 'Gruppert',
        'Stacked' => 'Stablet',
        'Expanded' => 'Utvidet',
        'Stream' => 'Strøm',
        'No Data Available.' => '',
        'Please select a valid graph output format in the configuration of this widget.' =>
            '',
        'The content of this statistic is being prepared for you, please be patient.' =>
            '',
        'This statistic can currently not be used because its configuration needs to be corrected by the statistics administrator.' =>
            '',

        # Template: AgentDashboardTicketGeneric
        'My locked tickets' => 'Mine låste saker',
        'My watched tickets' => 'Mine overvåkede saker',
        'My responsibilities' => 'Mine ansvar',
        'Tickets in My Queues' => 'Saker i Min Kø',
        'Tickets in My Services' => 'Saker i Mine Tjenester',
        'Service Time' => 'Tjenestetid',
        'Remove active filters for this widget.' => '',

        # Template: AgentDashboardTicketQueueOverview
        'Totals' => 'Totaler',

        # Template: AgentDashboardUserOnline
        'out of office' => 'ikke på kontoret',

        # Template: AgentDashboardUserOutOfOffice
        'until' => 'før',

        # Template: AgentHTMLReferencePageLayout
        'The ticket has been locked' => 'Saken har blitt låst',
        'Undo & close' => '',

        # Template: AgentInfo
        'Info' => 'Informasjon',
        'To accept some news, a license or some changes.' => 'For å akseptere nyheter, en lisens eller endringer',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Koble objekt: %s',
        'go to link delete screen' => 'gå til skjermen for å slette lenker',
        'Select Target Object' => 'Velg mål-objekt',
        'Link object %s with' => '',
        'Unlink Object: %s' => 'Koble fra objekt: %s',
        'go to link add screen' => 'gå til skjermen for å legge til lenker',

        # Template: AgentOTRSBusinessBlockScreen
        'Unauthorized usage of %s detected' => '',
        'If you decide to downgrade to OTRS Free, you will lose all database tables and data related to %s.' =>
            '',

        # Template: AgentPreferences
        'Edit your preferences' => 'Endre dine innstillinger',
        'Did you know? You can help translating OTRS at %s.' => '',

        # Template: AgentSpelling
        'Spell Checker' => 'Stavekontroll',
        'spelling error(s)' => 'Stavefeil',
        'Apply these changes' => 'Iverksett endringer',

        # Template: AgentStatisticsAdd
        'Statistics » Add' => 'Statistikk» Legg til',
        'Add New Statistic' => 'Legg til ny statistikk',
        'Dynamic Matrix' => 'Dynamisk matrise',
        'Tabular reporting data where each cell contains a singular data point (e. g. the number of tickets).' =>
            '',
        'Dynamic List' => 'Dynamisk liste',
        'Tabular reporting data where each row contains data of one entity (e. g. a ticket).' =>
            '',
        'Static' => 'Statisk',
        'Complex statistics that cannot be configured and may return non-tabular data.' =>
            '',
        'General Specification' => '',
        'Create Statistic' => 'Lag statistikk',

        # Template: AgentStatisticsEdit
        'Statistics » Edit %s%s — %s' => '',
        'Run now' => 'Kjør nå',
        'Statistics Preview' => 'Forhåndsvisning av statistikk',
        'Save statistic' => 'Lagre statistikk',

        # Template: AgentStatisticsImport
        'Statistics » Import' => 'Statistikk » Importer',
        'Import Statistic Configuration' => 'Importer statistikk konfigurasjon',

        # Template: AgentStatisticsOverview
        'Statistics » Overview' => 'Statistikk » Oversikt',
        'Statistics' => 'Statistikk',
        'Run' => 'Kjør',
        'Edit statistic "%s".' => 'Editer statistikk "%s".',
        'Export statistic "%s"' => 'Eksporter statistikk "%s"',
        'Export statistic %s' => 'Eksporter statistikk %s',
        'Delete statistic "%s"' => 'Slett statistikk "%s"',
        'Delete statistic %s' => '',
        'Do you really want to delete this statistic?' => '',

        # Template: AgentStatisticsView
        'Statistics » View %s%s — %s' => '',
        'Statistic Information' => 'Informasjon om statistikk',
        'Sum rows' => 'Summer rader',
        'Sum columns' => 'Summer kolonner',
        'Show as dashboard widget' => '',
        'Cache' => 'Mellomlagring',
        'This statistic contains configuration errors and can currently not be used.' =>
            '',

        # Template: AgentTicketActionCommon
        'Change Free Text of %s%s%s' => '',
        'Change Owner of %s%s%s' => '',
        'Close %s%s%s' => '',
        'Add Note to %s%s%s' => '',
        'Set Pending Time for %s%s%s' => '',
        'Change Priority of %s%s%s' => '',
        'Change Responsible of %s%s%s' => '',
        'All fields marked with an asterisk (*) are mandatory.' => '',
        'Service invalid.' => 'Tjenesten er ugyldig.',
        'New Owner' => 'Ny eier',
        'Please set a new owner!' => 'Vennligst sett en ny eier!',
        'New Responsible' => 'Ny ansvarlig',
        'Next state' => 'Neste status',
        'For all pending* states.' => 'For alle med ventende-tilstander',
        'Add Article' => 'Legg til artikkel',
        'Create an Article' => 'Lag en artikkel',
        'Inform agents' => 'Informer saksbehandlerne',
        'Inform involved agents' => 'Informer involverte saksbehandlere',
        'Here you can select additional agents which should receive a notification regarding the new article.' =>
            '',
        'Text will also be received by' => '',
        'Spell check' => 'Stavekontroll',
        'Text Template' => 'Tekstmal',
        'Setting a template will overwrite any text or attachment.' => '',
        'Note type' => 'Notistype',

        # Template: AgentTicketBounce
        'Bounce %s%s%s' => '',
        'Bounce to' => 'Oversend til',
        'You need a email address.' => 'Du trenger en e-postadresse.',
        'Need a valid email address or don\'t use a local email address.' =>
            'Må ha en gyldig e-postadresse, og ikke en lokal adresse',
        'Next ticket state' => 'Neste status på sak',
        'Inform sender' => 'Informer avsender',
        'Send mail' => 'Send e-posten',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Masseredigering av saker',
        'Send Email' => 'Send e-post',
        'Merge to' => 'Flett med',
        'Invalid ticket identifier!' => 'Ugyldig Saksnummer',
        'Merge to oldest' => 'Flett med eldste',
        'Link together' => 'Koble sammen',
        'Link to parent' => 'Koble til forelder',
        'Unlock tickets' => 'Lås opp saker',
        'Execute Bulk Action' => '',

        # Template: AgentTicketCompose
        'Compose Answer for %s%s%s' => '',
        'This address is registered as system address and cannot be used: %s' =>
            '',
        'Please include at least one recipient' => 'Vennligst oppgi minst en mottaker',
        'Remove Ticket Customer' => 'Fjern kunde fra sak',
        'Please remove this entry and enter a new one with the correct value.' =>
            'Vennlist fjern innlegget og legg til en med riktige verdier',
        'Remove Cc' => 'Fjern Cc',
        'Remove Bcc' => 'Fjern Bcc',
        'Address book' => 'Adressebok',
        'Date Invalid!' => 'Ugyldig dato',

        # Template: AgentTicketCustomer
        'Change Customer of %s%s%s' => '',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => 'Opprett ny e-postsak',
        'Example Template' => 'Eksempel på mal',
        'From queue' => 'Fra kø',
        'To customer user' => 'Til kunde-bruker',
        'Please include at least one customer user for the ticket.' => '',
        'Select this customer as the main customer.' => 'Velg denne kunden som hovedkunden.',
        'Remove Ticket Customer User' => 'Fjern kundebruker fra sak',
        'Get all' => 'Hent alle',

        # Template: AgentTicketEmailOutbound
        'Outbound Email for %s%s%s' => '',

        # Template: AgentTicketEscalation
        'Ticket %s: first response time is over (%s/%s)!' => '',
        'Ticket %s: first response time will be over in %s/%s!' => '',
        'Ticket %s: update time is over (%s/%s)!' => '',
        'Ticket %s: update time will be over in %s/%s!' => '',
        'Ticket %s: solution time is over (%s/%s)!' => '',
        'Ticket %s: solution time will be over in %s/%s!' => '',

        # Template: AgentTicketForward
        'Forward %s%s%s' => '',

        # Template: AgentTicketHistory
        'History of %s%s%s' => '',
        'History Content' => 'Historikk',
        'Zoom view' => 'Zoom visning',

        # Template: AgentTicketMerge
        'Merge %s%s%s' => '',
        'Merge Settings' => '',
        'You need to use a ticket number!' => 'Du må bruke et saksnummer',
        'A valid ticket number is required.' => 'Et gyldig Saksnummer er påkrevd.',
        'Need a valid email address.' => 'Trenger en gyldig e-postadresse',

        # Template: AgentTicketMove
        'Move %s%s%s' => '',
        'New Queue' => 'Ny kø',

        # Template: AgentTicketOverviewMedium
        'Select all' => 'Velg alle',
        'No ticket data found.' => 'Ingen saker ble funnet',
        'Open / Close ticket action menu' => '',
        'Select this ticket' => 'Velg denne saken',
        'First Response Time' => 'Første responstid',
        'Update Time' => 'Oppdateringstid',
        'Solution Time' => 'Løsningstid',
        'Move ticket to a different queue' => 'Flytt saker til annen kø',
        'Change queue' => 'Endre kø',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Endre søke-innstillinger',
        'Remove active filters for this screen.' => 'Fjern aktive filtre for dette skjermbildet.',
        'Tickets per page' => 'Saker per side',

        # Template: AgentTicketOverviewSmall
        'Reset overview' => 'Tilbakestill oversikten',
        'Column Filters Form' => '',

        # Template: AgentTicketPhone
        'Split Into New Phone Ticket' => '',
        'Save Chat Into New Phone Ticket' => '',
        'Create New Phone Ticket' => 'Lag ny Telefon-sak',
        'Please include at least one customer for the ticket.' => 'Vennligst oppgi minst en kunde for denne saken',
        'To queue' => 'Til kø',
        'Chat protocol' => '',
        'The chat will be appended as a separate article.' => '',

        # Template: AgentTicketPhoneCommon
        'Phone Call for %s%s%s' => '',

        # Template: AgentTicketPlain
        'View Email Plain Text for %s%s%s' => '',
        'Plain' => 'Enkel',
        'Download this email' => 'Last ned denne e-posten',

        # Template: AgentTicketProcess
        'Create New Process Ticket' => 'Opprett ny prosess sak',
        'Process' => 'Prosess',

        # Template: AgentTicketProcessSmall
        'Enroll Ticket into a Process' => '',

        # Template: AgentTicketSearch
        'Search template' => 'Bruk mal',
        'Create Template' => 'Ny mal',
        'Create New' => 'Ny',
        'Profile link' => 'Lenke til profil',
        'Save changes in template' => 'Lagre endringer i mal',
        'Filters in use' => 'Filtre i bruk',
        'Additional filters' => 'Tilleggsfiltre',
        'Add another attribute' => 'Legg til attributt',
        'Output' => 'Resultat',
        'Fulltext' => 'Fulltekst',
        'Remove' => 'Fjern',
        'Searches in the attributes From, To, Cc, Subject and the article body, overriding other attributes with the same name.' =>
            '',
        'CustomerID (complex search)' => '',
        '(e. g. 234*)' => '',
        'CustomerID (exact match)' => '',
        'Customer User Login (complex search)' => '',
        '(e. g. U51*)' => '',
        'Customer User Login (exact match)' => '',
        'Attachment Name' => 'Vedleggsnavn',
        '(e. g. m*file or myfi*)' => '',
        'Created in Queue' => 'Opprettet i kø',
        'Lock state' => 'Låsestatus',
        'Watcher' => 'Overvåker',
        'Article Create Time (before/after)' => 'Opprettelsestidspunkt for artikkel (før/etter)',
        'Article Create Time (between)' => 'Opprettelsestidspunkt for artikkel (mellom)',
        'Ticket Create Time (before/after)' => 'Opprettelsestidspunkt for sak (før/etter)',
        'Ticket Create Time (between)' => 'Opprettelsestidspunkt for sak (mellom)',
        'Ticket Change Time (before/after)' => 'Endringstidspunkt for sak (før/etter)',
        'Ticket Change Time (between)' => 'Endringstidspunkt for sak (mellom)',
        'Ticket Last Change Time (before/after)' => '',
        'Ticket Last Change Time (between)' => '',
        'Ticket Close Time (before/after)' => 'Avslutningstidspunkt for sak (før/etter)',
        'Ticket Close Time (between)' => 'Avslutningstidspunkt for sak (mellom)',
        'Ticket Escalation Time (before/after)' => '',
        'Ticket Escalation Time (between)' => '',
        'Archive Search' => 'Arkivsøk',
        'Run search' => 'Start søk',

        # Template: AgentTicketZoom
        'Article filter' => 'Innleggsfilter',
        'Article Type' => 'Sakstype',
        'Sender Type' => 'Sendertype',
        'Save filter settings as default' => 'Lagre filter som standard',
        'Event Type Filter' => '',
        'Event Type' => '',
        'Save as default' => 'Lagre som standard',
        'Archive' => 'Arkiv',
        'This ticket is archived.' => 'Denne saken er arkivert.',
        'Note: Type is invalid!' => 'Merk: Typen er ugyldig!',
        'Locked' => 'Tilgjengelighet',
        'Accounted time' => 'Benyttet tid',
        'Linked Objects' => 'Koblede objekter',
        'Change Queue' => 'Bytt kø',
        'There are no dialogs available at this point in the process.' =>
            '',
        'This item has no articles yet.' => '',
        'Ticket Timeline View' => '',
        'Article Overview' => 'Artikkeloversikt',
        'Article(s)' => 'Innlegg',
        'Page' => 'Side',
        'Add Filter' => 'Legg til filter',
        'Set' => 'Sett',
        'Reset Filter' => 'Nullstill filter',
        'Show one article' => 'Vis ett innlegg',
        'Show all articles' => 'Vis alle innlegg',
        'Show Ticket Timeline View' => '',
        'Unread articles' => 'Uleste innlegg',
        'No.' => 'Nr.',
        'Important' => 'Viktig',
        'Unread Article!' => 'Ulest innlegg!',
        'Incoming message' => 'Innkommende melding',
        'Outgoing message' => 'Utgående melding',
        'Internal message' => 'Intern melding',
        'Resize' => 'Gjør om størrelse.',
        'Mark this article as read' => 'Marker denne artikkelen som lest',
        'Show Full Text' => 'Vis fulltekst',
        'Full Article Text' => '',
        'No more events found. Please try changing the filter settings.' =>
            '',
        'by' => 'av',
        'To open links in the following article, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).' =>
            '',
        'Close this message' => 'Lukk denne meldingen',
        'Article could not be opened! Perhaps it is on another article page?' =>
            '',
        'Scale preview content' => '',
        'Open URL in new tab' => '',
        'Close preview' => '',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.' =>
            '',

        # Template: AttachmentBlocker
        'To protect your privacy, remote content was blocked.' => '',
        'Load blocked content.' => 'Last inn blokkert innhold',

        # Template: ChatStartForm
        'First message' => 'Første melding',

        # Template: CloudServicesDisabled
        'This feature requires cloud services.' => '',
        'You can' => 'Du kan',
        'go back to the previous page' => 'gå tilbake til forrige side',

        # Template: CustomerError
        'An Error Occurred' => '',
        'Error Details' => 'Feildetaljer',
        'Traceback' => 'Tilbakesporing',

        # Template: CustomerFooter
        'Powered by' => 'Drevet av',

        # Template: CustomerFooterJS
        'One or more errors occurred!' => 'En eller flere feil har oppstått!',
        'Close this dialog' => 'Lukk denne dialogen',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'Kunne ikke åpne sprettoppvindu. Vennligst slå av eventuelle blokkefunksjoner i nettleseren for dette nettstedet.',
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Hvis du forlater denne siden vil også alle åpne sprettopp-vinduer bli lukket.',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'En sprettoppvindu med denne skjermen er allerede åpen. Vil du stenge vinduet og laste det inn her i stedet?',
        'There are currently no elements available to select from.' => '',
        'Please turn off Compatibility Mode in Internet Explorer!' => '',
        'The browser you are using is too old.' => 'Nettleseren du bruker er for gammel.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            'OTRS kjører på en lang rekke nettlesere, vennligst oppgrader til en av disse.',
        'Please see the documentation or ask your admin for further information.' =>
            'Vennligst se dokumentasjonen eller spør din IT-ansvarlige for mer informasjon.',
        'Switch to mobile mode' => '',
        'Switch to desktop mode' => '',
        'Not available' => 'Ikke tilgjengelig',
        'Clear all' => 'Tøm alle',
        'Clear search' => 'Tilbakestil søk',
        '%s selection(s)...' => '',
        'and %s more...' => '',
        'Filters' => 'Filtre',
        'Confirm' => 'Bekreft',
        'You have unanswered chat requests' => '',
        'Accept' => '',
        'Decline' => '',
        'An internal error occurred.' => '',
        'Connection error' => '',
        'Reload page' => '',
        'Your browser was not able to communicate with OTRS properly, there seems to be something wrong with your network connection. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.' =>
            '',
        'The connection has been re-established after a temporary connection loss. Due to this, elements on this page could have stopped to work correctly. In order to be able to use all elements correctly again, it is strongly recommended to reload this page.' =>
            '',

        # Template: CustomerLogin
        'JavaScript Not Available' => 'JavaScript ikke tilgjengelig',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            'For å bruke OTRS må JavaScript slås på i nettleseren.',
        'Browser Warning' => 'Advarsel om nettleseren',
        'One moment please, you are being redirected...' => 'Et øyeblikk, du blir omdirigert',
        'Login' => 'Innlogging',
        'User name' => 'Brukernavn',
        'Your user name' => 'Ditt brukernavn',
        'Your password' => 'Ditt passord',
        'Forgot password?' => 'Glemt passordet?',
        '2 Factor Token' => '',
        'Your 2 Factor Token' => '',
        'Log In' => 'Logg inn',
        'Not yet registered?' => 'Ikke registrert enda?',
        'Request new password' => 'Be om nytt passord',
        'Your User Name' => 'Ditt brukernavn',
        'A new password will be sent to your email address.' => 'Nytt passord vil bli sendt til din e-postadresse',
        'Create Account' => 'Opprett konto',
        'Please fill out this form to receive login credentials.' => '',
        'How we should address you' => 'Hvordan skal vi tiltale deg',
        'Your First Name' => 'Ditt fornavn',
        'Your Last Name' => 'Ditt etternavn',
        'Your email address (this will become your username)' => 'Din e-postadresse (Dette vil bli ditt brukernavn)',

        # Template: CustomerNavigationBar
        'Incoming Chat Requests' => '',
        'Edit personal preferences' => 'Endre personlige innstillinger',
        'Logout %s %s' => 'Logg ut %s %s',

        # Template: CustomerRichTextEditor
        'Split Quote' => '',
        'Open link' => '',

        # Template: CustomerTicketMessage
        'Service level agreement' => 'Tjenestenivåavtale',

        # Template: CustomerTicketOverview
        'Welcome!' => 'Velkommen!',
        'Please click the button below to create your first ticket.' => 'Vennligst klikk på knappen under for å opprette din første sak.',
        'Create your first ticket' => 'Opprett din første sak',

        # Template: CustomerTicketSearch
        'Profile' => 'Profil',
        'e. g. 10*5155 or 105658*' => 'f.eks. 10*5155 eller 105658*',
        'Customer ID' => 'Kunde-ID',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => 'Fulltekst-søk i saker (f.eks. "Hans*n eller "Will*")',
        'Recipient' => 'Mottaker',
        'Carbon Copy' => 'Kopi til',
        'e. g. m*file or myfi*' => '',
        'Types' => 'Typer',
        'Time restrictions' => 'Tidsbegrensning',
        'No time settings' => 'Ingen tidsinnstillinger',
        'Specific date' => 'Spesifikk dato',
        'Only tickets created' => 'Kun saker opprettet',
        'Date range' => '',
        'Only tickets created between' => 'Kun saker opprettet mellom',
        'Ticket archive system' => 'Saksarkiveringssystem',
        'Save search as template?' => 'Lagre søk som mal?',
        'Save as Template?' => 'Lagre som mal?',
        'Save as Template' => 'Lagre som mal',
        'Template Name' => 'Navn på mal',
        'Pick a profile name' => 'Velg et profil navn',
        'Output to' => 'Skriv ut til',

        # Template: CustomerTicketSearchResultShort
        'of' => 'av',
        'Search Results for' => 'Søkeresultater for',
        'Remove this Search Term.' => 'Fjern dette søkekriteriet',

        # Template: CustomerTicketZoom
        'Start a chat from this ticket' => '',
        'Expand article' => 'Utvid artikkel',
        'Information' => 'Informasjon',
        'Next Steps' => 'Neste steg',
        'Reply' => 'Svar',
        'Chat Protocol' => '',

        # Template: DashboardEventsTicketCalendar
        'All-day' => 'Hele dagen',
        'Sunday' => 'søndag',
        'Monday' => 'mandag',
        'Tuesday' => 'tirsdag',
        'Wednesday' => 'onsdag',
        'Thursday' => 'torsdag',
        'Friday' => 'fredag',
        'Saturday' => 'lørdag',
        'Su' => 'sø',
        'Mo' => 'ma',
        'Tu' => 'ti',
        'We' => 'on',
        'Th' => 'to',
        'Fr' => 'fr',
        'Sa' => 'lø',
        'Event Information' => 'Hendelsesinformasjon',
        'Ticket fields' => 'Saksfelt',
        'Dynamic fields' => 'Dynamiske felter',

        # Template: Datepicker
        'Invalid date (need a future date)!' => 'Ugyldig dato (må være i fremtiden)',
        'Invalid date (need a past date)!' => 'Ugyldig dato (må være tilbake i tid)',
        'Previous' => 'Forrige',
        'Open date selection' => 'Åpne datovelger',

        # Template: Error
        'An error occurred.' => '',
        'Really a bug? 5 out of 10 bug reports result from a wrong or incomplete installation of OTRS.' =>
            '',
        'With %s, our experts take care of correct installation and cover your back with support and periodic security updates.' =>
            '',
        'Contact our service team now.' => '',
        'Send a bugreport' => 'Sende en feilrapport',

        # Template: FooterJS
        'Please enter at least one search value or * to find anything.' =>
            'Vennligst oppgi minst en søkeverdi eller * for å finne noe.',
        'Please remove the following words from your search as they cannot be searched for:' =>
            '',
        'Please check the fields marked as red for valid inputs.' => '',
        'Please perform a spell check on the the text first.' => '',
        'Slide the navigation bar' => '',
        'Unavailable for chat' => '',
        'Available for internal chats only' => '',
        'Available for chats' => '',
        'Please visit the chat manager' => '',
        'New personal chat request' => '',
        'New customer chat request' => '',
        'New public chat request' => '',
        'Selected user is not available for chat.' => '',
        'New activity' => 'Ny aktivitet',
        'New activity on one of your monitored chats.' => '',
        'Your browser does not support video and audio calling.' => '',
        'Selected user is not available for video and audio call.' => '',
        'Target user\'s browser does not support video and audio calling.' =>
            '',
        'Do you really want to continue?' => '',
        'Information about the OTRS Daemon' => 'Informasjon om OTRS Agenten',
        'This feature is part of the %s.  Please contact us at %s for an upgrade.' =>
            '',
        'Find out more about the %s' => '',

        # Template: Header
        'You are logged in as' => 'Du er innlogget som',

        # Template: Installer
        'JavaScript not available' => 'JavaScript er ikke tilgjengelig',
        'Step %s' => 'Steg %s',
        'Database Settings' => 'Databaseinnstillinger',
        'General Specifications and Mail Settings' => 'Generelle spesifikasjoner og e-post-innstillinger',
        'Finish' => 'Ferdig',
        'Welcome to %s' => 'Velkommen til %s',
        'Web site' => 'Websted',
        'Mail check successful.' => 'E-postsjekk fullført',
        'Error in the mail settings. Please correct and try again.' => 'Feil i e-postoppsettet. Korriger og prøv igjen.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => 'Sett opp utgående e-post',
        'Outbound mail type' => 'Type',
        'Select outbound mail type.' => 'Velg type utgående e-post',
        'Outbound mail port' => 'Utgående port for e-post',
        'Select outbound mail port.' => 'Velg port for utgående e-post',
        'SMTP host' => 'SMTP-tjener',
        'SMTP host.' => 'SMTP-tjener',
        'SMTP authentication' => 'SMTP-autentisering',
        'Does your SMTP host need authentication?' => 'Trenger SMTP-tjeneren din autentisering?',
        'SMTP auth user' => 'Bruker for autentisering',
        'Username for SMTP auth.' => 'Brukernavn for SMTP-autentisering',
        'SMTP auth password' => 'Passord for autentisering',
        'Password for SMTP auth.' => 'Passord for SMTP-autentisering',
        'Configure Inbound Mail' => 'Sett opp innkommende e-post',
        'Inbound mail type' => 'Type',
        'Select inbound mail type.' => 'Velg type for innkommende e-post',
        'Inbound mail host' => 'E-post-tjener',
        'Inbound mail host.' => 'E-post-tjener',
        'Inbound mail user' => 'Brukernavn',
        'User for inbound mail.' => 'Bruker for innkommende e-post',
        'Inbound mail password' => 'Passord',
        'Password for inbound mail.' => 'Passord for innkommende e-post',
        'Result of mail configuration check' => 'Resultat for e-postsjekk',
        'Check mail configuration' => 'Sjekk e-postkonfigurasjonen',
        'Skip this step' => 'Hopp over dette steget',

        # Template: InstallerDBResult
        'Database setup successful!' => 'Konfigurasjon av databasen var vellykket',

        # Template: InstallerDBStart
        'Install Type' => 'Installasjonstype',
        'Create a new database for OTRS' => '',
        'Use an existing database for OTRS' => '',

        # Template: InstallerDBmssql
        'Database name' => 'Databasenavn',
        'Check database settings' => 'Sjekk database-oppsett',
        'Result of database check' => 'Resultat for databasesjekken',
        'Database check successful.' => 'Databasesjekk fullført.',
        'Database User' => 'Databasebruker',
        'New' => 'Ny',
        'A new database user with limited permissions will be created for this OTRS system.' =>
            'En ny databasebruker med begrensede rettigheter vil bli opprettet for denne OTRS-installasjonen.',
        'Repeat Password' => 'Gjenta passord',
        'Generated password' => 'Opprett hvilkårlig passord',

        # Template: InstallerDBmysql
        'Passwords do not match' => 'Passordet stemmer ikke',

        # Template: InstallerDBoracle
        'SID' => 'SID',
        'Port' => 'Port',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'For å kunne bruke OTRS, må følgende linje utføres på kommandolinjen som root.',
        'Restart your webserver' => 'Restart webserveren din',
        'After doing so your OTRS is up and running.' => 'Etter dette vil OTRS være oppe og kjøre.',
        'Start page' => 'Startside',
        'Your OTRS Team' => 'OTRS-Teamet',

        # Template: InstallerLicense
        'Don\'t accept license' => 'Ikke aksepter lisens',
        'Accept license and continue' => 'Aksepter lisensen og fortsett',

        # Template: InstallerSystem
        'SystemID' => 'System-ID',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'Identifikator for dette systemet. Saksnumre og HTTP-sesjoner bruker dette nummeret.',
        'System FQDN' => 'Systemets tjenernavn (FQDN)',
        'Fully qualified domain name of your system.' => 'Fullt kvalifisert domene-navn for din tjener.',
        'AdminEmail' => 'Admin e-post',
        'Email address of the system administrator.' => 'E-postadresse til systemadministratoren',
        'Organization' => 'Organisasjon',
        'Log' => 'Logg',
        'LogModule' => 'Logg-modul',
        'Log backend to use.' => 'Loggmetode som skal brukes',
        'LogFile' => 'Logg-fil',
        'Webfrontend' => 'Web-grensesnitt',
        'Default language' => 'Standardspråk',
        'Default language.' => 'Standardspråk.',
        'CheckMXRecord' => 'Sjekk MX-informasjon',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'E-postadresser som angis manuelt, sjekkes mot MX-oppføringer i DNS. Ikke bruk dette valget dersom din DNS er treg eller ikke gjør oppslag for offentlige adresser.',

        # Template: LinkObject
        'Object#' => 'Objekt#',
        'Add links' => 'Legg til lenker',
        'Delete links' => 'Slett lenker',

        # Template: Login
        'Lost your password?' => 'Mistet passord?',
        'Request New Password' => 'Be om nytt passord',
        'Back to login' => 'Tilbake til innlogging',

        # Template: MobileNotAvailableWidget
        'Feature not available' => 'Funksjonen er ikke tilgjengelig',
        'Sorry, but this feature of OTRS is currently not available for mobile devices. If you\'d like to use it, you can either switch to desktop mode or use your regular desktop device.' =>
            '',

        # Template: Motd
        'Message of the Day' => 'Dagens melding',
        'This is the message of the day. You can edit this in %s.' => '',

        # Template: NoPermission
        'Insufficient Rights' => 'Utilstrekkelige rettigheter',
        'Back to the previous page' => 'Tilbake til forrige side',

        # Template: Pagination
        'Show first page' => 'Vis første side',
        'Show previous pages' => 'Vis foregående sider',
        'Show page %s' => 'Vis side %s',
        'Show next pages' => 'Vis neste sider',
        'Show last page' => 'Vis siste side',

        # Template: PictureUpload
        'Need FormID!' => 'Trenger FormID!',
        'No file found!' => 'Ingen fil ble funnet',
        'The file is not an image that can be shown inline!' => 'Filen er ikke et bilde som kan vises i nettleseren!',

        # Template: PreferencesNotificationEvent
        'Notification' => 'Varsling',
        'No user configurable notifications found.' => '',
        'Receive messages for notification \'%s\' by transport method \'%s\'.' =>
            '',
        'Please note that you can\'t completely disable notifications marked as mandatory.' =>
            '',
        'Sorry, but you can\'t disable all methods for notifications marked as mandatory.' =>
            '',
        'Sorry, but you can\'t disable all methods for this notification.' =>
            '',

        # Template: ActivityDialogHeader
        'Process Information' => 'Prosessinformasjon',
        'Dialog' => 'Dialog',

        # Template: Article
        'Inform Agent' => 'Informer Saksbehandler',

        # Template: PublicDefault
        'Welcome' => 'Velkommen',
        'This is the default public interface of OTRS! There was no action parameter given.' =>
            '',
        'You could install a custom public module (via the package manager), for example the FAQ module, which has a public interface.' =>
            '',

        # Template: RichTextEditor
        'Remove Quote' => '',

        # Template: GeneralSpecificationsWidget
        'Permissions' => 'Tilgang',
        'You can select one or more groups to define access for different agents.' =>
            'Du kan velge en eller flere grupper for å gi tilgang for forskjellige saksbehandlere',
        'Result formats' => '',
        'The selected time periods in the statistic are time zone neutral.' =>
            '',
        'Create summation row' => '',
        'Generate an additional row containing sums for all data rows.' =>
            '',
        'Create summation column' => '',
        'Generate an additional column containing sums for all data columns.' =>
            '',
        'Cache results' => '',
        'Stores statistics result data in a cache to be used in subsequent views with the same configuration (requires at least one selected time field).' =>
            '',
        'Provide the statistic as a widget that agents can activate in their dashboard.' =>
            '',
        'Please note that enabling the dashboard widget will activate caching for this statistic in the dashboard.' =>
            '',
        'If set to invalid end users can not generate the stat.' => 'Hvis satt til ugyldig kan ikke sluttbrukere generere statistikken',

        # Template: PreviewWidget
        'There are problems in the configuration of this statistic:' => '',
        'You may now configure the X-axis of your statistic.' => '',
        'This statistic does not provide preview data.' => '',
        'Preview format:' => 'Format på forhåndsvisning',
        'Please note that the preview uses random data and does not consider data filters.' =>
            '',
        'Configure X-Axis' => 'Konfigurer X-aksen',
        'X-axis' => 'X-akse',
        'Configure Y-Axis' => 'Konfigurer Y-aksen',
        'Y-axis' => 'Y-akse',
        'Configure Filter' => 'Konfigurer filter',

        # Template: RestrictionsWidget
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Vennligst velg kun ett element, eller deaktivere \'Fast\' knappen',
        'Absolute period' => 'Absolutt periode',
        'Between' => 'Mellom',
        'Relative period' => 'Relativ periode',
        'The past complete %s and the current+upcoming complete %s %s' =>
            '',
        'Do not allow changes to this element when the statistic is generated.' =>
            '',

        # Template: StatsParamsWidget
        'Format' => 'Format',
        'Exchange Axis' => 'Bytt akser',
        'Configurable params of static stat' => 'Konfigurer-bare parametre til statisk statistikk',
        'No element selected.' => 'Ingen valgte elementer.',
        'Scale' => 'Skala',
        'show more' => '',
        'show less' => '',

        # Template: D3
        'Download SVG' => 'Last ned SVG',
        'Download PNG' => 'Last ned PNG',

        # Template: XAxisWidget
        'The selected time period defines the default time frame for this statistic to collect data from.' =>
            '',
        'Defines the time unit that will be used to split the selected time period into reporting data points.' =>
            '',

        # Template: YAxisWidget
        'Please remember that the scale for the Y-axis has to be larger than the scale for the X-axis (e.g. X-axis => Month, Y-Axis => Year).' =>
            '',

        # Template: Test
        'OTRS Test Page' => 'OTRS Test-side',
        'Welcome %s %s' => 'Velkommen %s %s',
        'Counter' => 'Teller',

        # Template: Warning
        'Go back to the previous page' => 'Tilbake til forrige side',

        # Perl Module: Kernel/Config/Defaults.pm
        'View system log messages.' => 'Vis systemloggmeldinger',
        'Update and extend your system with software packages.' => 'Oppdater og utvid systemet med programvarepakker',

        # Perl Module: Kernel/Modules/AdminACL.pm
        'ACLs could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            '',
        'The following ACLs have been added successfully: %s' => '',
        'The following ACLs have been updated successfully: %s' => '',
        'There where errors adding/updating the following ACLs: %s. Please check the log file for more information.' =>
            '',
        'This field is required' => 'Dette feltet er obligatorisk',
        'There was an error creating the ACL' => '',
        'Need ACLID!' => '',
        'Could not get data for ACLID %s' => '',
        'There was an error updating the ACL' => '',
        'There was an error setting the entity sync status.' => '',
        'There was an error synchronizing the ACLs.' => '',
        'ACL %s could not be deleted' => '',
        'There was an error getting data for ACL with ID %s' => '',
        'Exact match' => '',
        'Negated exact match' => '',
        'Regular expression' => '',
        'Regular expression (ignore case)' => '',
        'Negated regular expression' => '',
        'Negated regular expression (ignore case)' => '',

        # Perl Module: Kernel/Modules/AdminCustomerCompany.pm
        'Customer Company %s already exists!' => '',

        # Perl Module: Kernel/Modules/AdminCustomerUser.pm
        'New phone ticket' => 'Ny telefonsak',
        'New email ticket' => 'Ny e-postsak',

        # Perl Module: Kernel/Modules/AdminDynamicField.pm
        'Fields configuration is not valid' => '',
        'Objects configuration is not valid' => '',
        'Could not reset Dynamic Field order properly, please check the error log for more details.' =>
            '',

        # Perl Module: Kernel/Modules/AdminDynamicFieldCheckbox.pm
        'Undefined subaction.' => '',
        'Need %s' => '',
        'The field does not contain only ASCII letters and numbers.' => '',
        'There is another field with the same name.' => '',
        'The field must be numeric.' => '',
        'Need ValidID' => '',
        'Could not create the new field' => '',
        'Need ID' => '',
        'Could not get data for dynamic field %s' => '',
        'The name for this field should not change.' => '',
        'Could not update the field %s' => '',
        'Currently' => 'Nåværende',
        'Unchecked' => '',
        'Checked' => '',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDateTime.pm
        'Prevent entry of dates in the future' => '',
        'Prevent entry of dates in the past' => '',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDropdown.pm
        'This field value is duplicated.' => '',

        # Perl Module: Kernel/Modules/AdminEmail.pm
        'Select at least one recipient.' => '',

        # Perl Module: Kernel/Modules/AdminGenericAgent.pm
        'archive tickets' => '',
        'restore tickets from archive' => '',
        'Need Profile!' => '',
        'Got no values to check.' => '',
        'Please remove the following words because they cannot be used for the ticket selection:' =>
            '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceDebugger.pm
        'Need WebserviceID!' => '',
        'Could not get data for WebserviceID %s' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerDefault.pm
        'Need InvokerType' => '',
        'Invoker %s is not registered' => '',
        'InvokerType %s is not registered' => '',
        'Need Invoker' => '',
        'Could not determine config for invoker %s' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingSimple.pm
        'Could not get registered configuration for action type %s' => '',
        'Could not get backend for %s %s' => '',
        'Could not update configuration data for WebserviceID %s' => '',
        'Keep (leave unchanged)' => '',
        'Ignore (drop key/value pair)' => '',
        'Map to (use provided value as default)' => '',
        'Exact value(s)' => '',
        'Ignore (drop Value/value pair)' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingXSLT.pm
        'Could not find required library %s' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceOperationDefault.pm
        'Need OperationType' => '',
        'Operation %s is not registered' => '',
        'OperationType %s is not registered' => '',
        'Need Operation' => '',
        'Could not determine config for operation %s' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceTransportHTTPREST.pm
        'Need Subaction!' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebservice.pm
        'There is another web service with the same name.' => '',
        'There was an error updating the web service.' => '',
        'Web service "%s" updated!' => 'Webtjeneste "%s" er oppdatert!',
        'There was an error creating the web service.' => '',
        'Web service "%s" created!' => 'Webtjeneste "%s" er opprettet!',
        'Need Name!' => '',
        'Need ExampleWebService!' => '',
        'Could not read %s!' => '',
        'Need a file to import!' => '',
        'The imported file has not valid YAML content! Please check OTRS log for details' =>
            '',
        'Web service "%s" deleted!' => 'Webtjeneste "%s" er slettet!',
        'New Web service' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebserviceHistory.pm
        'Got no WebserviceHistoryID!' => '',
        'Could not get history data for WebserviceHistoryID %s' => '',

        # Perl Module: Kernel/Modules/AdminNotificationEvent.pm
        'Notification updated!' => '',
        'Notification added!' => '',
        'There was an error getting data for Notification with ID:%s!' =>
            '',
        'Unknown Notification %s!' => '',
        'There was an error creating the Notification' => '',
        'Notifications could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            '',
        'The following Notifications have been added successfully: %s' =>
            '',
        'The following Notifications have been updated successfully: %s' =>
            '',
        'There where errors adding/updating the following Notifications: %s. Please check the log file for more information.' =>
            '',
        'Agent who owns the ticket' => 'Saksbehandleren som eier saken',
        'Agent who is responsible for the ticket' => 'Agenten som er ansvarlig for saken',
        'All agents watching the ticket' => 'Alle saksbehandlere som overvåker saken',
        'All agents with write permission for the ticket' => 'Alle saksbehandlere med skrivetilgang til saken ',
        'All agents subscribed to the ticket\'s queue' => '',
        'All agents subscribed to the ticket\'s service' => '',
        'All agents subscribed to both the ticket\'s queue and service' =>
            '',
        'Customer of the ticket' => '',
        'Yes, but require at least one active notification method' => '',

        # Perl Module: Kernel/Modules/AdminPGP.pm
        'PGP environment is not working. Please check log for more info!' =>
            '',
        'Need param Key to delete!' => '',
        'Key %s deleted!' => '',
        'Need param Key to download!' => '',

        # Perl Module: Kernel/Modules/AdminPackageManager.pm
        'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/otrs.Console.pl to install packages!' =>
            '',
        'No such package!' => '',
        'No such file %s in package!' => '',
        'No such file %s in local file system!' => '',
        'Can\'t read %s!' => '',
        'File is OK' => '',
        'Package has locally modified files.' => '',
        'No packages or no new packages found in selected repository.' =>
            '',
        'Package not verified due a communication issue with verification server!' =>
            '',
        'Can\'t connect to OTRS Feature Add-on list server!' => '',
        'Can\'t get OTRS Feature Add-on list from server!' => '',
        'Can\'t get OTRS Feature Add-on from server!' => '',

        # Perl Module: Kernel/Modules/AdminPostMasterFilter.pm
        'No such filter: %s' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagement.pm
        'Need ExampleProcesses!' => '',
        'Need ProcessID!' => '',
        'Yes (mandatory)' => '',
        'Unknown Process %s!' => '',
        'There was an error generating a new EntityID for this Process' =>
            '',
        'The StateEntityID for state Inactive does not exists' => '',
        'There was an error creating the Process' => '',
        'There was an error setting the entity sync status for Process entity: %s' =>
            '',
        'Could not get data for ProcessID %s' => '',
        'There was an error updating the Process' => '',
        'Process: %s could not be deleted' => '',
        'There was an error synchronizing the processes.' => '',
        'The %s:%s is still in use' => '',
        'The %s:%s has a different EntityID' => '',
        'Could not delete %s:%s' => '',
        'There was an error setting the entity sync status for %s entity: %s' =>
            '',
        'Could not get %s' => '',
        'Need %s!' => '',
        'Process: %s is not Inactive' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivity.pm
        'There was an error generating a new EntityID for this Activity' =>
            '',
        'There was an error creating the Activity' => '',
        'There was an error setting the entity sync status for Activity entity: %s' =>
            '',
        'Need ActivityID!' => '',
        'Could not get data for ActivityID %s' => '',
        'There was an error updating the Activity' => '',
        'Missing Parameter: Need Activity and ActivityDialog!' => '',
        'Activity not found!' => '',
        'ActivityDialog not found!' => '',
        'ActivityDialog already assigned to Activity. You cannot add an ActivityDialog twice!' =>
            '',
        'Error while saving the Activity to the database!' => '',
        'This subaction is not valid' => '',
        'Edit Activity "%s"' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivityDialog.pm
        'There was an error generating a new EntityID for this ActivityDialog' =>
            '',
        'There was an error creating the ActivityDialog' => '',
        'There was an error setting the entity sync status for ActivityDialog entity: %s' =>
            '',
        'Need ActivityDialogID!' => '',
        'Could not get data for ActivityDialogID %s' => '',
        'There was an error updating the ActivityDialog' => '',
        'Edit Activity Dialog "%s"' => '',
        'Agent Interface' => '',
        'Customer Interface' => '',
        'Agent and Customer Interface' => '',
        'Do not show Field' => '',
        'Show Field' => '',
        'Show Field As Mandatory' => '',
        'fax' => 'faks',

        # Perl Module: Kernel/Modules/AdminProcessManagementPath.pm
        'Edit Path' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransition.pm
        'There was an error generating a new EntityID for this Transition' =>
            '',
        'There was an error creating the Transition' => '',
        'There was an error setting the entity sync status for Transition entity: %s' =>
            '',
        'Need TransitionID!' => '',
        'Could not get data for TransitionID %s' => '',
        'There was an error updating the Transition' => '',
        'Edit Transition "%s"' => '',
        'xor' => '',
        'String' => '',
        'Transition validation module' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransitionAction.pm
        'At least one valid config parameter is required.' => '',
        'There was an error generating a new EntityID for this TransitionAction' =>
            '',
        'There was an error creating the TransitionAction' => '',
        'There was an error setting the entity sync status for TransitionAction entity: %s' =>
            '',
        'Need TransitionActionID!' => '',
        'Could not get data for TransitionActionID %s' => '',
        'There was an error updating the TransitionAction' => '',
        'Edit Transition Action "%s"' => '',
        'Error: Not all keys seem to have values or vice versa.' => '',

        # Perl Module: Kernel/Modules/AdminQueue.pm
        'Don\'t use :: in queue name!' => '',
        'Click back and change it!' => '',

        # Perl Module: Kernel/Modules/AdminQueueAutoResponse.pm
        'Queues ( without auto responses )' => '',

        # Perl Module: Kernel/Modules/AdminSMIME.pm
        'S/MIME environment is not working. Please check log for more info!' =>
            '',
        'Need param Filename to delete!' => '',
        'Need param Filename to download!' => '',
        'Needed CertFingerprint and CAFingerprint!' => '',
        'CAFingerprint must be different than CertFingerprint' => '',
        'Relation exists!' => '',
        'Relation added!' => '',
        'Impossible to add relation!' => '',
        'Relation doesn\'t exists' => '',
        'Relation deleted!' => '',
        'Impossible to delete relation!' => '',
        'Certificate %s could not be read!' => '',
        'Needed Fingerprint' => '',

        # Perl Module: Kernel/Modules/AdminSalutation.pm
        'Salutation updated!' => '',
        'Salutation added!' => '',

        # Perl Module: Kernel/Modules/AdminSupportDataCollector.pm
        'File %s could not be read!' => '',

        # Perl Module: Kernel/Modules/AdminSysConfig.pm
        'Import not allowed!' => '',
        'Need File!' => '',
        'Can\'t write ConfigItem!' => '',

        # Perl Module: Kernel/Modules/AdminSystemMaintenance.pm
        'Start date shouldn\'t be defined after Stop date!' => '',
        'There was an error creating the System Maintenance' => '',
        'Need SystemMaintenanceID!' => '',
        'Could not get data for SystemMaintenanceID %s' => '',
        'System Maintenance was saved successfully!' => '',
        'Session has been killed!' => '',
        'All sessions have been killed, except for your own.' => '',
        'There was an error updating the System Maintenance' => '',
        'Was not possible to delete the SystemMaintenance entry: %s!' => '',

        # Perl Module: Kernel/Modules/AdminTemplate.pm
        'Template updated!' => '',
        'Template added!' => '',

        # Perl Module: Kernel/Modules/AdminType.pm
        'Need Type!' => '',

        # Perl Module: Kernel/Modules/AgentDashboardCommon.pm
        'No such config for %s' => '',
        'Statistic' => 'Statistikk',
        'No preferences for %s!' => '',
        'Can\'t get element data of %s!' => '',
        'Can\'t get filter content data of %s!' => '',
        'Customer Company Name' => '',
        'Customer User ID' => '',

        # Perl Module: Kernel/Modules/AgentLinkObject.pm
        'Need SourceObject and SourceKey!' => '',
        'Please contact the administrator.' => '',
        'You need ro permission!' => '',
        'Can not delete link with %s!' => 'Kan ikke slette sammenkoblingen med %s!',
        'Can not create link with %s! Object already linked as %s.' => '',
        'Can not create link with %s!' => 'Kan ikke opprette sammenkobling med %s!',
        'The object %s cannot link with other object!' => '',

        # Perl Module: Kernel/Modules/AgentPreferences.pm
        'Param Group is required!' => '',

        # Perl Module: Kernel/Modules/AgentStatistics.pm
        'Parameter %s is missing.' => '',
        'Invalid Subaction.' => '',
        'Statistic could not be imported.' => 'Statistikk kunne ikke bli importert.',
        'Please upload a valid statistic file.' => 'Vennligst last opp en gyldig statistikk fil.',
        'Export: Need StatID!' => '',
        'Delete: Get no StatID!' => '',
        'Need StatID!' => '',
        'Could not load stat.' => '',
        'Could not create statistic.' => '',
        'Run: Get no %s!' => '',

        # Perl Module: Kernel/Modules/AgentTicketActionCommon.pm
        'No TicketID is given!' => '',
        'You need %s permissions!' => '',
        'Could not perform validation on field %s!' => '',
        'No subject' => 'Tomt emne-felt',
        'Previous Owner' => 'Forrige eier',

        # Perl Module: Kernel/Modules/AgentTicketBounce.pm
        '%s is needed!' => '',
        'Plain article not found for article %s!' => '',
        'Article does not belong to ticket %s!' => '',
        'Can\'t bounce email!' => '',
        'Can\'t send email!' => '',
        'Wrong Subaction!' => '',

        # Perl Module: Kernel/Modules/AgentTicketBulk.pm
        'Can\'t lock Tickets, no TicketIDs are given!' => '',
        'Ticket (%s) is not unlocked!' => '',
        'Bulk feature is not enabled!' => '',
        'No selectable TicketID is given!' => '',
        'You either selected no ticket or only tickets which are locked by other agents.' =>
            '',
        'You need to select at least one ticket.' => '',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to these tickets: %s.' =>
            '',
        'The following tickets were locked: %s.' => '',

        # Perl Module: Kernel/Modules/AgentTicketCompose.pm
        'Can not determine the ArticleType!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEmail.pm
        'No Subaction!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEmailOutbound.pm
        'Got no TicketID!' => '',
        'System Error!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEscalationView.pm
        'Invalid Filter: %s!' => '',

        # Perl Module: Kernel/Modules/AgentTicketHistory.pm
        'Can\'t show history, no TicketID is given!' => '',

        # Perl Module: Kernel/Modules/AgentTicketLock.pm
        'Can\'t lock Ticket, no TicketID is given!' => '',
        'Sorry, the current owner is %s!' => '',
        'Please become the owner first.' => '',
        'Ticket (ID=%s) is locked by %s!' => '',
        'Change the owner!' => '',

        # Perl Module: Kernel/Modules/AgentTicketMerge.pm
        'Can\'t merge ticket with itself!' => '',

        # Perl Module: Kernel/Modules/AgentTicketMove.pm
        'You need move permissions!' => '',

        # Perl Module: Kernel/Modules/AgentTicketPhone.pm
        'Chat is not active.' => '',
        'No permission.' => '',
        '%s has left the chat.' => '%s har gått ut av chatten.',
        'This chat has been closed and will be removed in %s hours.' => '',

        # Perl Module: Kernel/Modules/AgentTicketPlain.pm
        'No ArticleID!' => '',
        'Can\'t read plain article! Maybe there is no plain email in backend! Read backend message.' =>
            '',

        # Perl Module: Kernel/Modules/AgentTicketPrint.pm
        'Need TicketID!' => '',
        'printed by' => 'skrevet ut av',
        'Ticket Dynamic Fields' => '',

        # Perl Module: Kernel/Modules/AgentTicketProcess.pm
        'Couldn\'t get ActivityDialogEntityID "%s"!' => '',
        'No Process configured!' => '',
        'Process %s is invalid!' => '',
        'Subaction is invalid!' => '',
        'Parameter %s is missing in %s.' => '',
        'No ActivityDialog configured for %s in _RenderAjax!' => '',
        'Got no Start ActivityEntityID or Start ActivityDialogEntityID for Process: %s in _GetParam!' =>
            '',
        'Couldn\'t get Ticket for TicketID: %s in _GetParam!' => '',
        'Couldn\'t determine ActivityEntityID. DynamicField or Config isn\'t set properly!' =>
            '',
        'Process::Default%s Config Value missing!' => '',
        'Got no ProcessEntityID or TicketID and ActivityDialogEntityID!' =>
            '',
        'Can\'t get StartActivityDialog and StartActivityDialog for the ProcessEntityID "%s"!' =>
            '',
        'Can\'t get Ticket "%s"!' => '',
        'Can\'t get ProcessEntityID or ActivityEntityID for Ticket "%s"!' =>
            '',
        'Can\'t get Activity configuration for ActivityEntityID "%s"!' =>
            '',
        'Can\'t get ActivityDialog configuration for ActivityDialogEntityID "%s"!' =>
            '',
        'Can\'t get data for Field "%s" of ActivityDialog "%s"!' => '',
        'PendingTime can just be used if State or StateID is configured for the same ActivityDialog. ActivityDialog: %s!' =>
            '',
        'Pending Date' => 'Utsatt til',
        'for pending* states' => 'for vente-tilstander',
        'ActivityDialogEntityID missing!' => '',
        'Couldn\'t get Config for ActivityDialogEntityID "%s"!' => '',
        'Couldn\'t use CustomerID as an invisible field.' => '',
        'Missing ProcessEntityID, check your ActivityDialogHeader.tt!' =>
            '',
        'No StartActivityDialog or StartActivityDialog for Process "%s" configured!' =>
            '',
        'Couldn\'t create ticket for Process with ProcessEntityID "%s"!' =>
            '',
        'Couldn\'t set ProcessEntityID "%s" on TicketID "%s"!' => '',
        'Couldn\'t set ActivityEntityID "%s" on TicketID "%s"!' => '',
        'Could not store ActivityDialog, invalid TicketID: %s!' => '',
        'Invalid TicketID: %s!' => '',
        'Missing ActivityEntityID in Ticket %s!' => '',
        'This step does not belong anymore the current activity in process for Ticket %s!' =>
            '',
        'Another user changed this ticket in the meantime. Please close this window and reload the ticket.' =>
            '',
        'Missing ProcessEntityID in Ticket %s!' => '',
        'Could not set DynamicField value for %s of Ticket with ID "%s" in ActivityDialog "%s"!' =>
            '',
        'Could not set PendingTime for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            '',
        'Wrong ActivityDialog Field config: %s can\'t be Display => 1 / Show field (Please change its configuration to be Display => 0 / Do not show field or Display => 2 / Show field as mandatory)!' =>
            '',
        'Could not set %s for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            '',
        'Default Config for Process::Default%s missing!' => '',
        'Default Config for Process::Default%s invalid!' => '',

        # Perl Module: Kernel/Modules/AgentTicketSearch.pm
        'Untitled' => '',
        'Customer Name' => '',
        'Invalid Users' => 'Ugyldige brukere',
        'CSV' => 'CSV',
        'Excel' => '',

        # Perl Module: Kernel/Modules/AgentTicketService.pm
        'Feature not enabled!' => '',

        # Perl Module: Kernel/Modules/AgentTicketWatcher.pm
        'Feature is not active' => '',

        # Perl Module: Kernel/Modules/AgentTicketZoom.pm
        'Link Deleted' => '',
        'Ticket Locked' => 'Saken er låst',
        'Pending Time Set' => '',
        'Dynamic Field Updated' => '',
        'Outgoing Email (internal)' => 'Utgående epost (intern)',
        'Ticket Created' => '',
        'Type Updated' => '',
        'Escalation Update Time In Effect' => '',
        'Escalation Update Time Stopped' => '',
        'Escalation First Response Time Stopped' => '',
        'Customer Updated' => '',
        'Internal Chat' => 'Intern chat',
        'Automatic Follow-Up Sent' => '',
        'Note Added' => '',
        'Note Added (Customer)' => '',
        'State Updated' => '',
        'Outgoing Answer' => 'Utgående svar',
        'Service Updated' => '',
        'Link Added' => '',
        'Incoming Customer Email' => 'Innkommende kunde-epost',
        'Incoming Web Request' => 'Innkommende webhenvendelse',
        'Priority Updated' => 'Prioritet oppdatert',
        'Ticket Unlocked' => 'Saken er ulåst',
        'Outgoing Email' => 'Utgående epost',
        'Title Updated' => 'Tittel oppdatert',
        'Ticket Merged' => '',
        'Outgoing Phone Call' => 'Utgående telefonsamtale',
        'Forwarded Message' => '',
        'Removed User Subscription' => '',
        'Time Accounted' => '',
        'Incoming Phone Call' => 'Innkommende telefonsamtale',
        'System Request.' => '',
        'Incoming Follow-Up' => '',
        'Automatic Reply Sent' => '',
        'Automatic Reject Sent' => '',
        'Escalation Solution Time In Effect' => '',
        'Escalation Solution Time Stopped' => '',
        'Escalation Response Time In Effect' => '',
        'Escalation Response Time Stopped' => '',
        'SLA Updated' => '',
        'Queue Updated' => 'Kø oppdatert',
        'External Chat' => 'Ekstern chat',
        'Queue Changed' => '',
        'Notification Was Sent' => '',
        'We are sorry, you do not have permissions anymore to access this ticket in its current state.' =>
            '',
        'Can\'t get for ArticleID %s!' => '',
        'Article filter settings were saved.' => '',
        'Event type filter settings were saved.' => '',
        'Need ArticleID!' => '',
        'Invalid ArticleID!' => '',
        'Offline' => '',
        'User is currently offline.' => '',
        'User is currently active.' => '',
        'Away' => '',
        'User was inactive for a while.' => '',
        'Unavailable' => '',
        'User set their status to unavailable.' => '',
        'Fields with no group' => '',
        'View the source for this Article' => '',

        # Perl Module: Kernel/Modules/CustomerTicketAttachment.pm
        'FileID and ArticleID are needed!' => '',
        'No TicketID for ArticleID (%s)!' => '',
        'No such attachment (%s)!' => '',

        # Perl Module: Kernel/Modules/CustomerTicketMessage.pm
        'Check SysConfig setting for %s::QueueDefault.' => '',
        'Check SysConfig setting for %s::TicketTypeDefault.' => '',

        # Perl Module: Kernel/Modules/CustomerTicketOverview.pm
        'Need CustomerID!' => '',
        'My Tickets' => 'Mine saker',
        'Company Tickets' => 'Bedriftsaker',
        'Untitled!' => '',

        # Perl Module: Kernel/Modules/CustomerTicketSearch.pm
        'Please remove the following words because they cannot be used for the search:' =>
            '',

        # Perl Module: Kernel/Modules/CustomerTicketZoom.pm
        'Can\'t reopen ticket, not possible in this queue!' => '',
        'Create a new ticket!' => '',

        # Perl Module: Kernel/Modules/Installer.pm
        'Directory "%s" doesn\'t exist!' => '',
        'Configure "Home" in Kernel/Config.pm first!' => '',
        'File "%s/Kernel/Config.pm" not found!' => '',
        'Directory "%s" not found!' => '',
        'Kernel/Config.pm isn\'t writable!' => '',
        'If you want to use the installer, set the Kernel/Config.pm writable for the webserver user!' =>
            '',
        'Unknown Check!' => '',
        'The check "%s" doesn\'t exist!' => '',
        'Database %s' => '',
        'Configure MySQL' => '',
        'Configure PostgreSQL' => '',
        'Configure Oracle' => '',
        'Unknown database type "%s".' => '',
        'Please go back.' => '',
        'Install OTRS - Error' => '',
        'File "%s/%s.xml" not found!' => '',
        'Contact your Admin!' => '',
        'Syslog' => '',
        'Can\'t write Config file!' => '',
        'Unknown Subaction %s!' => '',
        'Can\'t connect to database, Perl module DBD::%s not installed!' =>
            '',
        'Can\'t connect to database, read comment!' => '',
        'Error: Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            '',
        'Error: Please set the value for innodb_log_file_size on your database to at least %s MB (current: %s MB, recommended: %s MB). For more information, please have a look at %s.' =>
            '',

        # Perl Module: Kernel/Modules/PublicRepository.pm
        'Need config Package::RepositoryAccessRegExp' => '',
        'Authentication failed from %s!' => '',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/PGP.pm
        'Sent message crypted to recipient!' => '',
        '"PGP SIGNED MESSAGE" header found, but invalid!' => '',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/SMIME.pm
        '"S/MIME SIGNED MESSAGE" header found, but invalid!' => '',
        'Ticket decrypted before' => '',
        'Impossible to decrypt: private key for email was not found!' => '',
        'Successful decryption' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/EventsTicketCalendar.pm
        'The start time of a ticket has been set after the end time!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/News.pm
        'Can\'t connect to OTRS News server!' => '',
        'Can\'t get OTRS News from server!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/ProductNotify.pm
        'Can\'t connect to Product News server!' => '',
        'Can\'t get Product News from server!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/RSS.pm
        'Can\'t connect to %s!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketGeneric.pm
        'sorted ascending' => '',
        'sorted descending' => '',
        'filter not active' => '',
        'filter active' => '',
        'This ticket has no title or subject' => 'Denne saken har ingen tittel eller emne',

        # Perl Module: Kernel/Output/HTML/Layout.pm
        'We are sorry, you do not have permissions anymore to access this ticket in its current state. You can take one of the following actions:' =>
            'Beklager, men du har ikke tilgang til denne saken i sin nåværende tilstand. Du kan gjøre en av følgende:',
        'No Permission' => '',

        # Perl Module: Kernel/Output/HTML/Layout/LinkObject.pm
        'Linked as' => 'Sammenkoblet som',
        'Search Result' => '',

        # Perl Module: Kernel/Output/HTML/LinkObject/Ticket.pm
        'Archive search' => '',

        # Perl Module: Kernel/Output/HTML/Notification/AgentOTRSBusiness.pm
        '%s Upgrade to %s now! %s' => '',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerSystemMaintenanceCheck.pm
        'A system maintenance period will start at: ' => '',

        # Perl Module: Kernel/Output/HTML/Preferences/Language.pm
        '(in process)' => '(under arbeid)',

        # Perl Module: Kernel/Output/HTML/Preferences/NotificationEvent.pm
        'Please make sure you\'ve chosen at least one transport method for mandatory notifications.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Preferences/OutOfOffice.pm
        'Please specify an end date that is after the start date.' => '',

        # Perl Module: Kernel/Output/HTML/Preferences/Password.pm
        'Please supply your new password!' => '',

        # Perl Module: Kernel/Output/HTML/Statistics/View.pm
        'No (not supported)' => 'Ingen (Ikke støttet)',
        'No past complete or the current+upcoming complete relative time value selected.' =>
            '',
        'The selected time period is larger than the allowed time period.' =>
            '',
        'No time scale value available for the current selected time scale value on the X axis.' =>
            '',
        'The selected date is not valid.' => 'Den valgte datoen er ikke gyldig.',
        'The selected end time is before the start time.' => 'Den valgte slutt tidspunktet er før start tidspunktet.',
        'There is something wrong with your time selection.' => 'Det er noe galt med dine valg av tid.',
        'Please select only one element or allow modification at stat generation time.' =>
            '',
        'Please select at least one value of this field or allow modification at stat generation time.' =>
            '',
        'Please select one element for the X-axis.' => 'Vennligst ett element for X-aksen.',
        'You can only use one time element for the Y axis.' => 'Du kan bare bruke et tidselement for Y-aksen.',
        'You can only use one or two elements for the Y axis.' => 'Du kan bare bruke en eller to elementer for Y-aksen.',
        'Please select at least one value of this field.' => 'Vennligst velg minst en verdi for dette feltet.',
        'Please provide a value or allow modification at stat generation time.' =>
            '',
        'Please select a time scale.' => '',
        'Your reporting time interval is too small, please use a larger time scale.' =>
            '',
        'Please remove the following words because they cannot be used for the ticket restrictions: %s.' =>
            '',

        # Perl Module: Kernel/Output/HTML/TicketOverviewMenu/Sort.pm
        'Order by' => 'Sorter etter',

        # Perl Module: Kernel/System/AuthSession.pm
        'You have exceeded the number of concurrent agents - contact sales@otrs.com.' =>
            '',
        'Please note that the session limit is almost reached.' => '',
        'Login rejected! You have exceeded the maximum number of concurrent Agents! Contact sales@otrs.com immediately!' =>
            '',
        'Session per user limit reached!' => '',

        # Perl Module: Kernel/System/Console/Command/Dev/Tools/Config2Docbook.pm
        'Configuration Options Reference' => '',
        'This setting can not be changed.' => '',
        'This setting is not active by default.' => '',
        'This setting can not be deactivated.' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseText.pm
        'e.g. Text or Te*t' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/Checkbox.pm
        'Ignore this field.' => '',

        # Perl Module: Kernel/System/Package.pm
        'not installed' => '',
        'File is not installed!' => '',
        'File is different!' => '',
        'Can\'t read file!' => '',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process/State.pm
        'Inactive' => 'Inaktiv',
        'FadeAway' => '',

        # Perl Module: Kernel/System/Registration.pm
        'Can\'t get Token from sever' => '',

        # Perl Module: Kernel/System/Stats.pm
        'Sum' => 'Sum',

        # Perl Module: Kernel/System/Stats/Dynamic/Ticket.pm
        'State Type' => '',
        'Created Priority' => 'Opprettet Prioritet',
        'Created State' => 'Opprettet Status',
        'Create Time' => 'Tid',
        'Close Time' => 'Avsluttet Tidspunkt',
        'Escalation - First Response Time' => '',
        'Escalation - Update Time' => '',
        'Escalation - Solution Time' => '',
        'Agent/Owner' => 'Saksbehandler/Eier',
        'Created by Agent/Owner' => 'Opprettet av Saksbehandler/Eier',
        'CustomerUserLogin' => 'KundeBrukerInnlogging',
        'CustomerUserLogin (complex search)' => '',
        'CustomerUserLogin (exact match)' => '',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketAccountedTime.pm
        'Evaluation by' => 'Evaluering av',
        'Ticket/Article Accounted Time' => 'Sak/Innlegg Utgjort Tid',
        'Ticket Create Time' => 'Sak Opprettelsestidspunkt',
        'Ticket Close Time' => 'Sak Avsluttingstidspunkt',
        'Accounted time by Agent' => 'Utgjort tid av Saksbehandler',
        'Total Time' => 'Total Tid',
        'Ticket Average' => 'Saksgjennomsnitt',
        'Ticket Min Time' => 'Sak Min Tid',
        'Ticket Max Time' => 'Sak Max Tid',
        'Number of Tickets' => 'Antall Saker',
        'Article Average' => 'Innlegg Gjennomsnitt',
        'Article Min Time' => 'Innlegg Min Tid',
        'Article Max Time' => 'Innlegg Max Tid',
        'Number of Articles' => 'Antall Innlegg',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketList.pm
        'unlimited' => '',
        'ascending' => 'stigende',
        'descending' => 'synkende',
        'Attributes to be printed' => 'Attributter som skal printes',
        'Sort sequence' => 'Sorteringssekvens',
        'State Historic' => '',
        'State Type Historic' => '',
        'Historic Time Range' => '',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketSolutionResponseTime.pm
        'Solution Average' => '',
        'Solution Min Time' => '',
        'Solution Max Time' => '',
        'Solution Average (affected by escalation configuration)' => '',
        'Solution Min Time (affected by escalation configuration)' => '',
        'Solution Max Time (affected by escalation configuration)' => '',
        'Solution Working Time Average (affected by escalation configuration)' =>
            '',
        'Solution Min Working Time (affected by escalation configuration)' =>
            '',
        'Solution Max Working Time (affected by escalation configuration)' =>
            '',
        'First Response Average (affected by escalation configuration)' =>
            '',
        'First Response Min Time (affected by escalation configuration)' =>
            '',
        'First Response Max Time (affected by escalation configuration)' =>
            '',
        'First Response Working Time Average (affected by escalation configuration)' =>
            '',
        'First Response Min Working Time (affected by escalation configuration)' =>
            '',
        'First Response Max Working Time (affected by escalation configuration)' =>
            '',
        'Number of Tickets (affected by escalation configuration)' => '',

        # Perl Module: Kernel/System/Stats/Static/StateAction.pm
        'Days' => 'Dager',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/TablePresence.pm
        'Table Presence' => '',
        'Internal Error: Could not open file.' => 'Intern feil: Kan ikke åpne fil.',
        'Table Check' => 'Tabell sjekk',
        'Internal Error: Could not read file.' => 'Intern feil: Kan ikke lese filen.',
        'Tables found which are not present in the database.' => 'Tabeller funnet som ikke er tilgjengelig i databasen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Size.pm
        'Database Size' => 'Databasestørrelse',
        'Could not determine database size.' => 'Kunne ikke bestemme størrelsen på databasen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Version.pm
        'Database Version' => 'Databaseversjon',
        'Could not determine database version.' => 'Kunne ikke bestemme databaseversjon.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Charset.pm
        'Client Connection Charset' => '',
        'Setting character_set_client needs to be utf8.' => 'Innstillingen character_set_client må være utf8',
        'Server Database Charset' => 'Tjener databasetegnsett',
        'Setting character_set_database needs to be UNICODE or UTF8.' => 'Innstillingen character_set_database må være UNICODE eller UTF8.',
        'Table Charset' => 'Tabel tegnsett',
        'There were tables found which do not have utf8 as charset.' => 'Det ble funnet tabeller som ikke er satt som utf8',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InnoDBLogFileSize.pm
        'InnoDB Log File Size' => 'InnoDB logfilstørrelse',
        'The setting innodb_log_file_size must be at least 256 MB.' => 'Innstillingen \'innodb_log_file_size\' må minst være 256 MB.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/MaxAllowedPacket.pm
        'Maximum Query Size' => 'Maksimum størrelse på spørring',
        'The setting \'max_allowed_packet\' must be higher than 20 MB.' =>
            'Innstillingen \'max_allowed_packet\' må være større enn 20 MB.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Performance.pm
        'Query Cache Size' => 'Spørring mellomlagringsstørrelse',
        'The setting \'query_cache_size\' should be used (higher than 10 MB but not more than 512 MB).' =>
            'Innstillingen \'query_cache_size\' bør brukes (over 10MB, men ikke større enn 512MB)',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/StorageEngine.pm
        'Default Storage Engine' => 'Standard lagringsmotor',
        'Table Storage Engine' => '',
        'Tables with a different storage engine than the default engine were found.' =>
            'Tabeller med en annen lagringsmotor enn standardmotoren ble funnet',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Version.pm
        'MySQL 5.x or higher is required.' => 'MySQL 5.x eller høyere er nødvendig.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/NLS.pm
        'NLS_LANG Setting' => 'NLS_LANG innstilling',
        'NLS_LANG must be set to al32utf8 (e.g. GERMAN_GERMANY.AL32UTF8).' =>
            'NLS_LANG må bli satt til (f.eks. GERMAN_GERMANY.AL32UTF8).',
        'NLS_DATE_FORMAT Setting' => 'NLS_DATE_FORMAT innstilling',
        'NLS_DATE_FORMAT must be set to \'YYYY-MM-DD HH24:MI:SS\'.' => 'NLS_DATE_FORMAT må bli satt til \'YYYY-MM-DD HH24:MI:SS\'.',
        'NLS_DATE_FORMAT Setting SQL Check' => 'NLS_DATE_FORMAT innstilling for SQL sjekk',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Charset.pm
        'Setting client_encoding needs to be UNICODE or UTF8.' => 'Innstillingene \'client_encoding\' må være satt til UNICODE eller UTF8.',
        'Setting server_encoding needs to be UNICODE or UTF8.' => 'Innstilling \'server_encoding\' må være satt til UNIDOCE eller UTF8.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/DateStyle.pm
        'Date Format' => 'Datoformat',
        'Setting DateStyle needs to be ISO.' => 'Innstilling DateStyle må være satt til ISO.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Version.pm
        'PostgreSQL 8.x or higher is required.' => 'PostgreSQL 8.x eller høyere er nødvendig.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskPartitionOTRS.pm
        'OTRS Disk Partition' => 'OTRS diskpartisjon',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpace.pm
        'Disk Usage' => 'Diskforbruk',
        'The partition where OTRS is located is almost full.' => 'Partisjonen hvor OTRS er plassert, er nesten full.',
        'The partition where OTRS is located has no disk space problems.' =>
            'Partisjonen hvor OTRS er plasser, har igjen diskplass problemer.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpacePartitions.pm
        'Disk Partitions Usage' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Distribution.pm
        'Distribution' => 'Distribusjon',
        'Could not determine distribution.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/KernelVersion.pm
        'Kernel Version' => 'Kernel versjon',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Load.pm
        'System Load' => 'Systembelastning',
        'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModules.pm
        'Perl Modules' => 'Perl moduler',
        'Not all required Perl modules are correctly installed.' => 'Ikke alle påkrevde Perl moduler er riktig installert. ',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Swap.pm
        'Free Swap Space (%)' => 'Ledig swap diskplass (%)',
        'No swap enabled.' => 'Ingen swap tilgjengelig.',
        'Used Swap Space (MB)' => 'Brukt swap diskplass (MB)',
        'There should be more than 60% free swap space.' => 'Det bør være mer enn 60% ledig swap diskplass.',
        'There should be no more than 200 MB swap space used.' => 'Det bær vær ikke være mer enn 200 MB brukt diskplass til swap.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ConfigSettings.pm
        'OTRS' => 'OTRS',
        'Config Settings' => '',
        'Could not determine value.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DaemonRunning.pm
        'Daemon' => 'Agent',
        'Daemon is running.' => '',
        'Daemon is not running.' => 'Agenten kjører ikke.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DatabaseRecords.pm
        'Database Records' => 'Databaseposter',
        'Tickets' => 'Saker',
        'Ticket History Entries' => '',
        'Articles' => 'Innlegg',
        'Attachments (DB, Without HTML)' => 'Vedlegg (DB, uten HTML)',
        'Customers With At Least One Ticket' => '',
        'Dynamic Field Values' => 'Dynamiske felt verdier',
        'Invalid Dynamic Fields' => 'Ugyldige dynamiske felt',
        'Invalid Dynamic Field Values' => 'Ugyldige dynamiske felt verdier',
        'GenericInterface Webservices' => '',
        'Process Tickets' => '',
        'Months Between First And Last Ticket' => 'Måneder mellom første og siste sak',
        'Tickets Per Month (avg)' => 'Saker per måned (gjennomsnittlig)',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultSOAPUser.pm
        'Default SOAP Username And Password' => 'Standard SOAP brukernavn og passord',
        'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultUser.pm
        'Default Admin Password' => 'Standard administrator passord',
        'Security risk: the agent account root@localhost still has the default password. Please change it or invalidate the account.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ErrorLog.pm
        'Error Log' => 'Feillogg',
        'There are error reports in your system log.' => 'Det er rapportert feil i din systemlogg.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FQDN.pm
        'FQDN (domain name)' => 'FQDN (fult domenenavn)',
        'Please configure your FQDN setting.' => 'Vennligst konfigurer din FQDN innstilling.',
        'Domain Name' => 'Domenenavn',
        'Your FQDN setting is invalid.' => 'Din FQDN innstilling er ugyldig.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FileSystemWritable.pm
        'File System Writable' => '',
        'The file system on your OTRS partition is not writable.' => 'Filsystemet for din OTRS partisjon er ikke mulig å skrive til.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageDeployment.pm
        'Package Installation Status' => 'Installasjonsstatus for pakker',
        'Some packages have locally modified files.' => '',
        'Some packages are not correctly installed.' => 'Noen pakker er ikke riktig installert.',
        'Package Verification Status' => '',
        'Some packages are not verified by the OTRS Group! It is recommended not to use this packages.' =>
            '',
        'Package Framework Version Status' => '',
        'Some packages are not allowed for the current framework version.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageList.pm
        'Package List' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SessionConfigSettings.pm
        'Session Config Settings' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SpoolMails.pm
        'Spooled Emails' => '',
        'There are emails in var/spool that OTRS could not process.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SystemID.pm
        'Your SystemID setting is invalid, it should only contain digits.' =>
            'Din SystemID innstilling er ugyldig, den kan bare inneholde tall.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/DefaultType.pm
        'Default Ticket Type' => '',
        'The configured default ticket type is invalid or missing. Please change the setting Ticket::Type::Default and select a valid ticket type.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/IndexModule.pm
        'Ticket Index Module' => '',
        'You have more than 60,000 tickets and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/InvalidUsersWithLockedTickets.pm
        'Invalid Users with Locked Tickets' => '',
        'There are invalid users with locked tickets.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/OpenTickets.pm
        'Open Tickets' => 'Åpne saker',
        'You should not have more than 8,000 open tickets in your system.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/SearchIndexModule.pm
        'Ticket Search Index Module' => '',
        'You have more than 50,000 articles and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'Du har mer enn 50 000 artikler og bør bruke StaticDB som backend. Se i administrator manualen (Ytelsesjustering) for ytterligere informasjon.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/StaticDBOrphanedRecords.pm
        'Orphaned Records In ticket_lock_index Table' => '',
        'Table ticket_lock_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            '',
        'Orphaned Records In ticket_index Table' => '',
        'Table ticket_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/TimeSettings.pm
        'Time Settings' => '',
        'Server time zone' => 'Tjener tidssone',
        'Computed server time offset' => 'Utregnet tjener tidsforskyvning',
        'OTRS TimeZone setting (global time offset)' => 'OTRS tidssone instillinger (Global tidsforskyvning)',
        'TimeZone may only be activated for systems running in UTC.' => 'Tidssone kan bare ble aktivert for systemer som kjører i UTC.',
        'OTRS TimeZoneUser setting (per-user time zone support)' => '',
        'TimeZoneUser may only be activated for systems running in UTC that don\'t have an OTRS TimeZone set.' =>
            '',
        'OTRS TimeZone setting for calendar ' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/LoadedModules.pm
        'Webserver' => 'Webtjener',
        'Loaded Apache Modules' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/MPMModel.pm
        'MPM model' => 'MPM modell',
        'OTRS requires apache to be run with the \'prefork\' MPM model.' =>
            'OTRS krever Apache for å kunne kjøre \'prefork\' MPM modellen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/Performance.pm
        'CGI Accelerator Usage' => 'CGI Accelerator status',
        'You should use FastCGI or mod_perl to increase your performance.' =>
            'Du bør benytte FastCGI eller mod_perl for å forbedre ytelsen.',
        'mod_deflate Usage' => 'mod_deflate status',
        'Please install mod_deflate to improve GUI speed.' => 'Vennligst installer mod_deflate for å forbedre hastigheten på GUI.',
        'mod_filter Usage' => 'mod_filter status',
        'Please install mod_filter if mod_deflate is used.' => 'Vennligst installer mod_filer dersom mod_deflate ikke brukes.',
        'mod_headers Usage' => 'mod_headers status',
        'Please install mod_headers to improve GUI speed.' => 'Vennligst installer mod_headers for å forbedre hastigheten på GUI.',
        'Apache::Reload Usage' => 'Apache::Reload status',
        'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler to prevent web server restarts when installing and upgrading modules.' =>
            'Apache::Reload eller Apache2:Reload bør benyttes ettersom PerlModule og PerlInitHandler hindrer at webtjeneren restartes, dersom du installerer eller oppgraderer moduler.',
        'Apache2::DBI Usage' => 'Apache2::DBI status',
        'Apache2::DBI should be used to get a better performance  with pre-established database connections.' =>
            'Apache2::DBI bør brukes for å oppnå best ytelse med forhåndsetablerte databasekoblinger. ',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/EnvironmentVariables.pm
        'Environment Variables' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/InternalWebRequest.pm
        'Support Data Collection' => '',
        'Support data could not be collected from the web server.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Version.pm
        'Webserver Version' => 'Webtjener versjon',
        'Could not determine webserver version.' => 'Kunne ikke bestemme webtjenerversjon.',

        # Perl Module: Kernel/System/SupportDataCollector/PluginAsynchronous/OTRS/ConcurrentUsers.pm
        'Concurrent Users Details' => '',
        'Concurrent Users' => 'Samtidige brukere',

        # Perl Module: Kernel/System/SupportDataCollector/PluginBase.pm
        'Unknown' => 'Ukjent',
        'OK' => 'OK',
        'Problem' => 'Problem',

        # Perl Module: Kernel/System/Ticket.pm
        'Reset of unlock time.' => '',

        # Perl Module: Kernel/System/Ticket/Event/NotificationEvent/Transport/Email.pm
        'PGP sign only' => '',
        'PGP encrypt only' => '',
        'PGP sign and encrypt' => '',
        'SMIME sign only' => '',
        'SMIME encrypt only' => '',
        'SMIME sign and encrypt' => '',
        'PGP and SMIME not enabled.' => '',
        'Skip notification delivery' => '',
        'Send unsigned notification' => '',
        'Send unencrypted notification' => '',

        # Perl Module: Kernel/System/Web/InterfaceAgent.pm
        'Panic, user authenticated but no user data can be found in OTRS DB!! Perhaps the user is invalid.' =>
            '',
        'Can`t remove SessionID.' => '',
        'Logout successful.' => '',
        'Panic! Invalid Session!!!' => '',
        'No Permission to use this frontend module!' => '',

        # Perl Module: Kernel/System/Web/InterfaceCustomer.pm
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact the administrator.' =>
            '',
        'Reset password unsuccessful. Please contact the administrator.' =>
            '',
        'Added via Customer Panel (%s)' => '',
        'Customer user can\'t be added!' => '',
        'Can\'t send account info!' => '',

        # Perl Module: Kernel/System/Web/InterfaceInstaller.pm
        'SecureMode active!' => '',
        'If you want to re-run the Installer, disable the SecureMode in the SysConfig.' =>
            '',
        'Action "%s" not found!' => '',

        # Database XML Definition: scripts/database/otrs-initial_insert.xml
        'Group for default access.' => '',
        'Group of all administrators.' => '',
        'Group for statistics access.' => '',
        'All new state types (default: viewable).' => '',
        'All open state types (default: viewable).' => '',
        'All closed state types (default: not viewable).' => '',
        'All \'pending reminder\' state types (default: viewable).' => '',
        'All \'pending auto *\' state types (default: viewable).' => '',
        'All \'removed\' state types (default: not viewable).' => '',
        'State type for merged tickets (default: not viewable).' => '',
        'New ticket created by customer.' => 'Ny sak opprettet av kunden.',
        'Ticket is closed successful.' => 'Sak ble løst og lukket.',
        'Ticket is closed unsuccessful.' => 'Sak ble lukket uløst.',
        'Open tickets.' => 'Åpne saker.',
        'Customer removed ticket.' => 'Kunden fjernet saken.',
        'Ticket is pending for agent reminder.' => '',
        'Ticket is pending for automatic close.' => '',
        'State for merged tickets.' => '',
        'system standard salutation (en)' => '',
        'Standard Salutation.' => 'Standard hilsning.',
        'system standard signature (en)' => '',
        'Standard Signature.' => 'Standard signatur.',
        'Standard Address.' => 'Standard adresse.',
        'Follow-ups for closed tickets are possible. Ticket will be reopened.' =>
            '',
        'Follow-ups for closed tickets are not possible. No new ticket will be created.' =>
            '',
        'new ticket' => 'ny sak',
        'Follow-ups for closed tickets are not possible. A new ticket will be created..' =>
            '',
        'Postmaster queue.' => '',
        'All default incoming tickets.' => '',
        'All junk tickets.' => 'Alle søppel saker.',
        'All misc tickets.' => 'Alle diverse saker.',
        'Automatic reply which will be sent out after a new ticket has been created.' =>
            '',
        'Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is "reject").' =>
            '',
        'Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is "possible").' =>
            '',
        'Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is "new ticket").' =>
            '',
        'Auto remove will be sent out after a customer removed the request.' =>
            '',
        'default reply (after new ticket has been created)' => '',
        'default reject (after follow-up and rejected of a closed ticket)' =>
            '',
        'default follow-up (after a ticket follow-up has been added)' => '',
        'default reject/new ticket created (after closed follow-up with new ticket creation)' =>
            '',
        'Unclassified' => '',
        'tmp_lock' => '',
        'email-notification-ext' => '',
        'email-notification-int' => '',
        'Ticket create notification' => '',
        'You will receive a notification each time a new ticket is created in one of your "My Queues" or "My Services".' =>
            '',
        'Ticket follow-up notification (unlocked)' => '',
        'You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your "My Queues" or "My Services".' =>
            'Du vil motta et varsel om en kunde sender en oppfølging til en ulåst sak i "mine køer" eller "mine tjenester".',
        'Ticket follow-up notification (locked)' => '',
        'You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.' =>
            '',
        'You will receive a notification as soon as a ticket owned by you is automatically unlocked.' =>
            '',
        'Ticket owner update notification' => '',
        'Ticket responsible update notification' => '',
        'Ticket new note notification' => '',
        'Ticket queue update notification' => '',
        'You will receive a notification if a ticket is moved into one of your "My Queues".' =>
            '',
        'Ticket pending reminder notification (locked)' => '',
        'Ticket pending reminder notification (unlocked)' => '',
        'Ticket escalation notification' => '',
        'Ticket escalation warning notification' => '',
        'Ticket service update notification' => '',
        'You will receive a notification if a ticket\'s service is changed to one of your "My Services".' =>
            '',

        # SysConfig
        '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
' => '',
        ' (work units)' => '',
        '"%s" notification was sent to "%s" by "%s".' => '',
        '"Slim" skin which tries to save screen space for power users.' =>
            '',
        '%s' => '%s',
        '%s time unit(s) accounted. Now total %s time unit(s).' => '%s minutt(er) lagt til. Total tid er %s minutt(er).',
        '(UserLogin) Firstname Lastname' => '(Brukernavn) Fornavn Etternavn',
        '(UserLogin) Lastname Firstname' => '(Brukernavn) Etternavn Fornavn',
        '(UserLogin) Lastname, Firstname' => '(Brukernavn) Etternavn, Fornavn',
        '*** out of office until %s (%s d left) ***' => '',
        '100 (Expert)' => '',
        '200 (Advanced)' => '',
        '300 (Beginner)' => '',
        'A TicketWatcher Module.' => '',
        'A Website' => 'En hjemmeside',
        'A list of dynamic fields that are merged into the main ticket during a merge operation. Only dynamic fields that are empty in the main ticket will be set.' =>
            '',
        'A picture' => 'Et bilde',
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'ACL-modul som lar en stenge overordnede saker kun hvis alle undersakene deres har blitt stengte ("Status" viser hvilke statuser som ikke er tilgjengelige inntil alle undersaker er stengte).',
        'Access Control Lists (ACL)' => '',
        'AccountedTime' => '',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Slår på en blinke-mekanisme for den køen som har den eldste saken.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Slår på glemt-passord-funksjonalitet for saksbehandlere.',
        'Activates lost password feature for customers.' => 'Slår på glemt-passord-funksjonalitet for kundebrukere.',
        'Activates support for customer groups.' => 'Slår på støtte for kundegrupper.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Slår på innleggsfilteret i zoom-visningen for å spesifisere hvilke innlegg som skal vises.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Slår på de tilgjengelige temaene i systemet. Verdien 1 betyr aktivert, mens 0 betyr inaktivert',
        'Activates the ticket archive system search in the customer interface.' =>
            'Slår på arkivsøk i kundegrensesnittet',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Slår på arkiveringssystemet for saker. Dette øker hastigheten på systemet ved å fjerne noen av sakene ut av den daglige bruken. For å søke etter slike saker må man søke etter arkiverte saker.',
        'Activates time accounting.' => 'Slår på tids-kontering',
        'ActivityID' => '',
        'Add an inbound phone call to this ticket' => '',
        'Add an outbound phone call to this ticket' => '',
        'Added email. %s' => 'Lagt e-post til sak. %s',
        'Added link to ticket "%s".' => 'La til link til sak «%s».',
        'Added note (%s)' => 'Lagt til notis (%s)',
        'Added subscription for user "%s".' => 'La til abonnement for brukeren «%s».',
        'Address book of CustomerUser sources.' => '',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            'Legger til år og måned på loggfilens navn. Dette gjør at man får én logg-fil per måned.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface. The customers email address won\'t be added if the article type is email-internal.' =>
            '',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Legger til ikke-gjentagende fridager for kalenderen. Vennligst bruk enkelttall mellom 1 og 9 (ikke 01 - 09).',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            '',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Legger til årlige fridager for kalenderen. Vennligst bruk enkelttall mellom 1 og 9 (ikke 01 - 09).',
        'Admin Area.' => '',
        'After' => 'Etter',
        'Agent Name' => '',
        'Agent Name + FromSeparator + System Address Display Name' => '',
        'Agent Preferences.' => '',
        'Agent called customer.' => 'Saksbehandler ringte kunde.',
        'Agent interface article notification module to check PGP.' => 'Varslingsmodul for å sjekke PGP.',
        'Agent interface article notification module to check S/MIME.' =>
            'Varslingsmodul for å sjekke S/MIME.',
        'Agent interface module to access CIC search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to access fulltext search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to access search profiles via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Saksbehandlermodul som sjekker innkommende e-post i Zoom-visning dersom S/MIME-nøkkelen er tilgjengelig og korrekt.',
        'Agent interface notification module to see the number of locked tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface notification module to see the number of tickets an agent is responsible for. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface notification module to see the number of tickets in My Services. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface notification module to see the number of watched tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'AgentCustomerSearch' => '',
        'AgentCustomerSearch.' => '',
        'AgentUserSearch' => '',
        'AgentUserSearch.' => '',
        'Agents <-> Groups' => 'Saksbehandlere <-> Grupper',
        'Agents <-> Roles' => 'Saksbehandlere <-> Roller',
        'All customer users of a CustomerID' => 'Alle kunder-brukere av et KundeID',
        'Allows adding notes in the close ticket screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket free text screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket note screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows adding notes in the ticket responsible screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Tillater saksbehandlere å bytte akse for statistikk de selv oppretter',
        'Allows agents to generate individual-related stats.' => 'Lar saksbehandlere opprette statistikk relatert til individer.',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Tillater å velge mellom å vise vedlegg til saker i nettleseren (inline) eller gjøre dem nedlastbare (vedlegg).',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Tillater å velge status ved opprettelse av kundesaker i kundeportalen.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Lar kunder endre sakens prioritet i kundeportalen.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Lar kunder sette sakens SLA i kundeportalen.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Lar kunder sette sakens prioritet i kundeportalen.',
        'Allows customers to set the ticket queue in the customer interface. If this is set to \'No\', QueueDefault should be configured.' =>
            'Tillater kundene å sette saks-kø når en sak opprettes. Hvis denne settes til \'Nei\' må standardkø være satt.',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Lar kunder velge sakens tjeneste i kundeportalen.',
        'Allows customers to set the ticket type in the customer interface. If this is set to \'No\', TicketTypeDefault should be configured.' =>
            '',
        'Allows default services to be selected also for non existing customers.' =>
            '',
        'Allows defining new types for ticket (if ticket type feature is enabled).' =>
            'Tillater å definere nye typer saker (dersom sakstype-funksjonaliteten er slått på).',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Tillater å opprette tjenester og SLAer for saker (f.eks. e-post, skrivebord, nettverk, ...) og eskaleringsattributter for SLAer (dersom tjenester/SLA er slått på).',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Tillater å bruke medium saksoversikt (KundeInfo => 1 - viser også kundeinformasjon).',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Tillater å bruke liten saksoversikt (Kunde-info => 1 - vis også kundeinformasjon)',
        'Allows invalid agents to generate individual-related stats.' => '',
        'Allows the administrators to login as other customers, via the customer user administration panel.' =>
            '',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Tillater administratorer å logge seg inn som andre brukere, via brukeradministrasjonspanelet',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Tillater å endre sakens status når den skal flyttes',
        'Always show RichText if available' => '',
        'Arabic (Saudi Arabia)' => 'Arabisk (Saudi Arabia)',
        'Archive state changed: "%s"' => 'Ny arkiv statuser: «%s»',
        'ArticleTree' => '',
        'Attachments <-> Templates' => 'Vedlegg  <-> Maler',
        'Auto Responses <-> Queues' => 'Autosvar <-> Køer',
        'AutoFollowUp sent to "%s".' => 'AutoOppfølging sendt til «%s».',
        'AutoReject sent to "%s".' => 'AutoReject sent to «%s».',
        'AutoReply sent to "%s".' => 'AutoSvar sendt til «%s».',
        'Automated line break in text messages after x number of chars.' =>
            'Automatisk linjeskift i tekstmeldinger etter # antall tegn.',
        'Automatically lock and set owner to current Agent after opening the move ticket screen of the agent interface.' =>
            '',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Automatisk lås og sett eier til nåværende agent etter å ha blitt valgt i en masseredigeringshandling',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled). This will only work by manually actions of the logged in user. It does not work for automated actions e.g. GenericAgent, Postmaster and GenericInterface.' =>
            '',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Sett automatisk ansvarlig for en sak (hvis ikke satt) etter første eieroppdatering',
        'Balanced white skin by Felix Niklas (slim version).' => '',
        'Balanced white skin by Felix Niklas.' => 'Balansert hvitt tema av Felix Niklas',
        'Based on global RichText setting' => '',
        'Basic fulltext index settings. Execute "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild" in order to generate a new index.' =>
            '',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Blokkerer all innkommende e-post som ikke har et gyldig saksnummer i emnefeltet som er sendt fra @example.com-adresser.',
        'Bounced to "%s".' => 'Avslått til «%s».',
        'Builds an article index right after the article\'s creation.' =>
            'Bygger en innleggsindeks rett etter at et innlegg er opprettet.',
        'Bulgarian' => 'Bulgarsk',
        'CMD example setup. Ignores emails where external CMD returns some output on STDOUT (email will be piped into STDIN of some.bin).' =>
            'CMD - eksempel på oppsett. Ignorerer e-post hvor ekstern CMD returnerer noe som helst til STDOUT (e-posten vil bli "pipet" til kommandoen STDIN).',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for the DB ACL backend.' => '',
        'Cache time in seconds for the DB process backend.' => '',
        'Cache time in seconds for the SSL certificate attributes.' => '',
        'Cache time in seconds for the ticket process navigation bar output module.' =>
            '',
        'Cache time in seconds for the web service config backend.' => '',
        'Catalan' => 'Katalansk',
        'Change password' => 'Endre passord',
        'Change queue!' => 'Endre kø!',
        'Change the customer for this ticket' => 'Bytt kunde for denne saken',
        'Change the free fields for this ticket' => '',
        'Change the priority for this ticket' => 'Bytt prioriteten på denne saken',
        'Change the responsible for this ticket' => '',
        'Changed priority from "%s" (%s) to "%s" (%s).' => 'Endret prioritet fra «%s» (%s) til «%s» (%s).',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Endrer eier på saker til "alle" (brukbart for ASP). Normalt vil kun saksbehandlere med Les/skriv-tilgang til køen bli vist.',
        'Checkbox' => 'Avkryssingsfelt',
        'Checks if an E-Mail is a followup to an existing ticket by searching the subject for a valid ticket number.' =>
            '',
        'Checks the SystemID in ticket number detection for follow-ups (use "No" if SystemID has been changed after using the system).' =>
            'Sjekker SystemID i saksnummer-generatoren for oppfølginger (bruk "Nei" hvis SystemID har blitt endret etter å ha brukt systemet.',
        'Checks the availability of OTRS Business Solution™ for this system.' =>
            '',
        'Checks the entitlement status of OTRS Business Solution™.' => '',
        'Chinese (Simplified)' => 'Kinesisk (Forenklet)',
        'Chinese (Traditional)' => 'Kinesisk (Tradisjonell)',
        'Choose for which kind of ticket changes you want to receive notifications.' =>
            '',
        'Closed tickets (customer user)' => '',
        'Closed tickets (customer)' => 'Avsluttede saker (kunde)',
        'Cloud Services' => 'Skytjenester',
        'Cloud service admin module registration for the transport layer.' =>
            '',
        'Collect support data for asynchronous plug-in modules.' => '',
        'Column ticket filters for Ticket Overviews type "Small".' => '',
        'Columns that can be filtered in the escalation view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the locked view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the queue view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the responsible view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the service view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the status view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the ticket search result view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the watch view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Comment for new history entries in the customer interface.' => 'Kommentar for nye historiske innlegg i kundeportalen.',
        'Comment2' => 'Kommentar2',
        'Communication' => 'Kommunikasjon',
        'Company Status' => 'Bedriftstatus',
        'Company Tickets.' => '',
        'Company name which will be included in outgoing emails as an X-Header.' =>
            '',
        'Compat module for AgentZoom to AgentTicketZoom.' => '',
        'Complex' => '',
        'Configure Processes.' => '',
        'Configure and manage ACLs.' => 'Konfigurer og administrere ACLer.',
        'Configure any additional readonly mirror databases that you want to use.' =>
            '',
        'Configure sending of support data to OTRS Group for improved support.' =>
            '',
        'Configure which screen should be shown after a new ticket has been created.' =>
            '',
        'Configure your own log text for PGP.' => 'Sett opp din egen loggtekst for PGP.',
        'Configures a default TicketDynamicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (http://otrs.github.io/doc/), chapter "Ticket Event Module".' =>
            '',
        'Controls how to display the ticket history entries as readable values.' =>
            '',
        'Controls if CustomerID is automatically copied from the sender address for unknown customers.' =>
            '',
        'Controls if CustomerID is read-only in the agent interface.' => '',
        'Controls if customers have the ability to sort their tickets.' =>
            'Gir kunder mulighet til å sortere sakene sine.',
        'Controls if more than one from entry can be set in the new phone ticket in the agent interface.' =>
            '',
        'Controls if the admin is allowed to import a saved system configuration in SysConfig.' =>
            '',
        'Controls if the admin is allowed to make changes to the database via AdminSelectBox.' =>
            '',
        'Controls if the ticket and article seen flags are removed when a ticket is archived.' =>
            '',
        'Converts HTML mails into text messages.' => 'Konverter HTML e-poster til tekstmeldinger',
        'Create New process ticket.' => '',
        'Create and manage Service Level Agreements (SLAs).' => 'Administrasjon av Tjenestenivåavtaler (SLAer)',
        'Create and manage agents.' => 'Administrasjon av saksbehandlere.',
        'Create and manage attachments.' => 'Administrasjon av vedlegg.',
        'Create and manage customer users.' => 'Administrasjon av kundebrukere.',
        'Create and manage customers.' => 'Administrasjon av kunder',
        'Create and manage dynamic fields.' => 'Administrasjon av dynamiske felter',
        'Create and manage groups.' => 'Administrasjon av grupper.',
        'Create and manage queues.' => 'Administrasjon av køer.',
        'Create and manage responses that are automatically sent.' => 'Administrasjon av autosvar.',
        'Create and manage roles.' => 'Administrasjon av roller.',
        'Create and manage salutations.' => 'Administrasjon av hilsener.',
        'Create and manage services.' => 'Administrasjon av tjenester.',
        'Create and manage signatures.' => 'Administrasjon av signaturer.',
        'Create and manage templates.' => '',
        'Create and manage ticket notifications.' => '',
        'Create and manage ticket priorities.' => 'Administrasjon av sakprioriteringer.',
        'Create and manage ticket states.' => 'Administrasjon av status på saker.',
        'Create and manage ticket types.' => 'Administrasjon av sakstyper.',
        'Create and manage web services.' => 'Administrasjon av web tjenester',
        'Create new Ticket.' => '',
        'Create new email ticket and send this out (outbound).' => '',
        'Create new email ticket.' => '',
        'Create new phone ticket (inbound).' => '',
        'Create new phone ticket.' => '',
        'Create new process ticket.' => '',
        'Create tickets.' => '',
        'Croatian' => 'Kroatisk',
        'Custom RSS Feed' => 'Egendefinert RSS Feed',
        'Custom text for the page shown to customers that have no tickets yet (if you need those text translated add them to a custom translation module).' =>
            '',
        'Customer Administration' => '',
        'Customer Information Center Search.' => '',
        'Customer Information Center.' => '',
        'Customer Ticket Print Module.' => '',
        'Customer User <-> Groups' => '',
        'Customer User <-> Services' => '',
        'Customer User Administration' => '',
        'Customer Users' => 'Kunder',
        'Customer called us.' => 'Kunden ringte oss.',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer preferences.' => '',
        'Customer request via web.' => 'Kundeforespørsel via web.',
        'Customer ticket overview' => '',
        'Customer ticket search.' => '',
        'Customer ticket zoom' => '',
        'Customer user search' => '',
        'CustomerID search' => '',
        'CustomerName' => 'Kundenavn',
        'CustomerUser' => '',
        'Customers <-> Groups' => 'Kunder <-> Grupper',
        'Customizable stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Czech' => 'Tjekkisk',
        'Danish' => 'Dansk',
        'Data used to export the search result in CSV format.' => 'Data brukt for å eksportere søkeresultatet i CSV-format.',
        'Date / Time' => 'Dato / Tid',
        'Debug' => 'Feilsøk',
        'Debugs the translation set. If this is set to "Yes" all strings (text) without translations are written to STDERR. This can be helpful when you are creating a new translation file. Otherwise, this option should remain set to "No".' =>
            '',
        'Default' => '',
        'Default (Slim)' => '',
        'Default ACL values for ticket actions.' => 'Standard ACL-verdier for sakshendelser',
        'Default ProcessManagement entity prefixes for entity IDs that are automatically generated.' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            '',
        'Default display type for recipient (To,Cc) names in AgentTicketZoom and CustomerTicketZoom.' =>
            '',
        'Default display type for sender (From) names in AgentTicketZoom and CustomerTicketZoom.' =>
            '',
        'Default loop protection module.' => 'Standard loop-beskyttelsesmodul',
        'Default queue ID used by the system in the agent interface.' => 'Standard køID brukt av systemet for saksbehandlere.',
        'Default skin for the agent interface (slim version).' => '',
        'Default skin for the agent interface.' => '',
        'Default skin for the customer interface.' => '',
        'Default ticket ID used by the system in the agent interface.' =>
            'Standard Saksnr brukt av systemet i saksbehandler-delen',
        'Default ticket ID used by the system in the customer interface.' =>
            'Standard Saksnr brukt av systemet i kundeportalen.',
        'Default value for NameX' => 'Standardverdi for NavnX',
        'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.' =>
            '',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Sett et filter for HTML-visning som legger til lenker bak en gitt tekst. Bildeelementet tillater to typer inn-data. For det første navnet på et bilde (f.eks. bilde01.png). I det tilfellet vil OTRS sin bilde-sti brukes. Den andre muligheten er å skrive inn URL til bildet',
        'Define a mapping between variables of the customer user data (keys) and dynamic fields of a ticket (values). The purpose is to store customer user data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the next setting below.' =>
            '',
        'Define dynamic field name for end time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            '',
        'Define dynamic field name for start time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            '',
        'Define the max depth of queues.' => '',
        'Define the queue comment 2.' => '',
        'Define the service comment 2.' => '',
        'Define the sla comment 2.' => '',
        'Define the start day of the week for the date picker for the indicated calendar.' =>
            '',
        'Define the start day of the week for the date picker.' => 'Setter dag for ukestart i datovelgeren.',
        'Define which columns are shown in the linked tickets widget (LinkObject::ViewMode = "complex"). Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Definerer et kundeelement som lager et LinkedIn-symbol på slutten av kundeinfo-blokken.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Definerer et kundeelement som lager et XING-symbol på slutten av kundeinfo-blokken.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Definerer et kundeelement som lager et Google-symbol på slutten av kundeinfo-blokken.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Definferer et kundeelement som lager et Google Maps-symbol på slutten av kunde-info-blokken.',
        'Defines a default list of words, that are ignored by the spell checker.' =>
            'Definerer en liste med standard-ord som skal ignoreres av stavekontrollen.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definerer et filter for HTML-visning for å legge til lenker bak CVE-nummer. Bilde-elementet tillater to typer inn-data. Enten navnet på en bilde-fil (f.eks. bilde01.png), der OTRS vil gå utfra at bildet ligger i OTRS sin bildemappe. Eller man kan oppgi URL til et bilde.',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definerer et filter i HTML-visningen for å legge til lenker bak MSBulletin-nummer. Bildeelementet tillater to typer inn-data. Enten navnet på en bilde-fil (f.eks. bilde01.png), der OTRS vil gå utfra at bildet ligger i OTRS sin bildemappe. Eller man kan oppgi URL til et bilde.',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definerer et filter for HTML-visning som legger til lenker bak en definert tekst. Bilde-elementet tillater to typer inn-data. Enten navnet på en bilde-fil (f.eks. bilde01.png), der OTRS vil gå utfra at bildet ligger i OTRS sin bildemappe. Eller man kan oppgi URL til et bilde.',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definerer et filter for HTML-visning som legger til lenker bak BugTraq-numre. Bilde-elementet tillater to typer inn-data. Enten navnet på en bildefil (f.eks. bilde01.png), der OTRS vil gå utfra at bildet ligger i OTRS sin bildemappe. Eller man kan oppgi URL til et bilde.',
        'Defines a filter to collect CVE numbers from article texts in AgentTicketZoom. The results will be displayed in a meta box next to the article. Fill in URLPreview if you would like to see a preview when moving your mouse cursor above the link element. This could be the same URL as in URL, but also an alternate one. Please note that some websites deny being displayed within an iframe (e.g. Google) and thus won\'t work with the preview mode.' =>
            '',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            'Definerer et filter som prosesserer teksten i innlegg for å markere predefinerte nøkkelord.',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            'Definerer en Regulær-uttrykk-setning som ekskluderer adresser fra syntaks-sjekken (hvis "sjekk e-postadresser" er satt til Ja). Skriv inn en Regulær-uttrykk-setning for e-postadresser som ikke er syntaktisk korrekte, men som er viktige for systemet (f.eks. "root@localhost").',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            'Definerer en Regulær-uttrykk -setning som filtrerer ut alle e-postadresser som ikke skal brukes i systemet.',
        'Defines a sleep time in microseconds between tickets while they are been processed by a job.' =>
            '',
        'Defines a useful module to load specific user options or to display news.' =>
            'Definerer en modul for å laste spesifikke brukerinnstillinger eller for å vise nyheter.',
        'Defines all the X-headers that should be scanned.' => 'Definerer at alle X-hode-feltene som skal skannes.',
        'Defines all the languages that are available to the application. Specify only English names of languages here.' =>
            '',
        'Defines all the languages that are available to the application. Specify only native names of languages here.' =>
            '',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            'Definerer alle parametre for gjenoppfriskning i kundeportalen.',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            'Definerer alle parametre for viste saker i kundeportalen.',
        'Defines all the parameters for this item in the customer preferences.' =>
            'Definerer alle parametre for dette objektet i kunde-oppsettet.',
        'Defines all the parameters for this item in the customer preferences. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control).' =>
            '',
        'Defines all the parameters for this notification transport.' => '',
        'Defines all the possible stats output formats.' => 'Definerer alle mulige formater for statistikk',
        'Defines an alternate URL, where the login link refers to.' => 'Definerer en alternativ URL som Innloggingslenken skal peke til.',
        'Defines an alternate URL, where the logout link refers to.' => 'Definerer en alternativ URL som skal logge ut brukeren.',
        'Defines an alternate login URL for the customer panel..' => 'Alternativ innlogging-URL for kundeportalen.',
        'Defines an alternate logout URL for the customer panel.' => 'Alternativ URL for ut-logging av kunder.',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').' =>
            '',
        'Defines from which ticket attributes the agent can select the result order.' =>
            '',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'Definerer hvordan Fra-feltet på e-poster (sendt som svar eller e-post-saker) skal se ut.',
        'Defines if a pre-sorting by priority should be done in the queue view.' =>
            '',
        'Defines if a pre-sorting by priority should be done in the service view.' =>
            '',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en saks-lås er nødvendig for å få stenge en sak. Hvis saken ikke er låst vil den bli det, og nåværende agent vil bli satt som eier.',
        'Defines if a ticket lock is required in the email outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en saks-lås er nødvendig for å oversende en sak. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en sakslås er nødvendig for å opprette en sak. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en sakslås er nødvendig for å videresende en sak. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en sakslås er nødvendig i fritekstvinduet til en sak. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en sakslås er nødvendig for saksfletting. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en sakslås er nødvendig i notisvinduet til en sak. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en sakslås er nødvendig i sakseier-vinduet til en sak. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en sakslås er nødvendig i "På vent"-vinduet. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en sakslås er nødvendig i "Utgående Telefon"-skjermen til en sak. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en sakslås er nødvendig i prioritetsvinduet til en sak. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en sakslås er nødvendig i ansvarlig-vinduet. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Spesifiserer om en sakslås er nødvendig for å endre kunden på en sak. Hvis saken ikke er låst vil den bli det, og nåværende agent blir satt som eier.',
        'Defines if agents should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            '',
        'Defines if composed messages have to be spell checked in the agent interface.' =>
            'Spesifiserer om nye meldinger som skrives må stavekontrolleres.',
        'Defines if customers should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            '',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.) in customer interface.' =>
            '',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.).' =>
            '',
        'Defines if the previously valid token should be accepted for authentication. This is slightly less secure but gives users 30 seconds more time to enter their one-time password.' =>
            '',
        'Defines if the values for filters should be retrieved from all available tickets. If set to "Yes", only values which are actually used in any ticket will be available for filtering. Please note: The list of customers will always be retrieved like this.' =>
            '',
        'Defines if time accounting is mandatory in the agent interface. If activated, a note must be entered for all ticket actions (no matter if the note itself is configured as active or is originally mandatory for the individual ticket action screen).' =>
            '',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            '',
        'Defines out of office message template. Two string parameters (%s) available: end date and number of days left.' =>
            '',
        'Defines queues that\'s tickets are used for displaying as calendar events.' =>
            '',
        'Defines the HTTP hostname for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the OTRS Daemon).' =>
            '',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            'Spesifiserer Regulær-uttrykk for IPen til lokalt pakkelager. Du må slå dette på for å ha tilgang til ditt lokale pakkelager. I tillegg er package::RepositoryList påkrevd på andre tjenere.',
        'Defines the URL CSS path.' => 'Definerer URL til CSS',
        'Defines the URL base path of icons, CSS and Java Script.' => 'Definerer URL som basesti for icons, CSS og JavaScript',
        'Defines the URL image path of icons for navigation.' => 'Definerer URL for bildesti til navigasjons-icons',
        'Defines the URL java script path.' => 'Definerer URL til JavaScript-filer',
        'Defines the URL rich text editor path.' => 'Definerer URL til Rik Tekst-redigereren.',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            'Definerer en dedikert DNS-tjener å bruke, hvis nødvendig, for å gjøre MX-sjekk på e-postadresser.',
        'Defines the agent preferences key where the shared secret key is stored.' =>
            '',
        'Defines the body text for notification mails sent to agents, about new password (after using this link the new password will be sent).' =>
            'Definerer meldingsteksten for nytt-passord-meldingen til saksbehandlere. Etter å ha brukt lenken vil det nye passordet bli sendt.',
        'Defines the body text for notification mails sent to agents, with token about new requested password (after using this link the new password will be sent).' =>
            'Definerer meldingsteksten for nytt-passord-meldingen til saksbehandlere. Etter å ha brukt lenken vil det nye passordet bli sendt.',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            'Definerer meldingsteksten sent til nye kunder når kontoen blir opprettet.',
        'Defines the body text for notification mails sent to customers, about new password (after using this link the new password will be sent).' =>
            'Definerer meldingsteksten for glemt-passord-melding til kundebrukere. Etter å ha klikket på lenken vil det nye passordet bli sendt til kunden.',
        'Defines the body text for notification mails sent to customers, with token about new requested password (after using this link the new password will be sent).' =>
            'Definerer meldingsteksten for glemt-passord-melding til kundebrukere. Etter å ha klikket på lenken vil det nye passordet bli sendt til kunden.',
        'Defines the body text for rejected emails.' => 'Meldingstekst for avviste e-poster.',
        'Defines the calendar width in percent. Default is 95%.' => '',
        'Defines the cluster node identifier. This is only used in cluster configurations where there is more than one OTRS frontend system. Note: only values from 1 to 99 are allowed.' =>
            '',
        'Defines the column to store the keys for the preferences table.' =>
            'Definerer hvilken kolonne som skal brukes for å lagre nøkler til valgtabellen',
        'Defines the config options for the autocompletion feature.' => '',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            'Definerer parametrene som skal vises i Innstillinger for dette objektet',
        'Defines the config parameters of this item, to be shown in the preferences view. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control). \'PasswordMaxLoginFailed\' allows to set an agent to invalid-temporarily if max failed logins reached.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view. Take care to maintain the dictionaries installed in the system in the data section.' =>
            'Definerer parametrene som skal vises i Innstillinger for dette objektet. Pass på å beholde ordlistene som er installert i systemet, i dataseksjonen.',
        'Defines the connections for http/ftp, via a proxy.' => 'Spesifiserer proxy-oppsett for http/ftp',
        'Defines the customer preferences key where the shared secret key is stored.' =>
            '',
        'Defines the date input format used in forms (option or input fields).' =>
            'Spesifiserer datoformat på skjema (valg- eller tekstfelter).',
        'Defines the default CSS used in rich text editors.' => 'Spesifiserer standard CSS til bruk i rik-tekst-redigering.',
        'Defines the default auto response type of the article for this operation.' =>
            '',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            'Spesifiserer standardinnholdet for notiser i sakens fritekstdel for saksbehandlere.',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at http://otrs.github.io/doc/.' =>
            '',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            'Spesifiserer standardspråk for webdelen. De mulige valgene er bestemt av språkene som er tilgjengelige i løsningen (se neste innstilling).',
        'Defines the default history type in the customer interface.' => 'Spesifiserer standard historikkvisning i kundeportalen.',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            'Setter standardverdi for maks. antall atributter på X-aksen for tidsskalaen',
        'Defines the default maximum number of statistics per page on the overview screen.' =>
            '',
        'Defines the default next state for a ticket after customer follow-up in the customer interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Setter standardverdi for neste status etter å ha lagt til en notis når man stenger en sak i agentdelen.',
        'Defines the default next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            'Setter standardverdi for neste status etter å ha lagt til en notis i masseredigering i agentdelen.',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Setter standardverdi for neste status etter å ha lagt til en notis i sakens fritekstside i agentdelen.',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Setter standardverdi for neste status når agent legger til en notis under interne notater.',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Definerer standard for neste saksstatus når agent legger til en notis i eier-delen',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Definerer standard for neste status for en sak etter å ha lagt til en notis i avventingsdelen av agents saksvisning',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Definerer standard for neste saksstatus etter at agent har lagt til en notis og endret prioritet på en sak',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Definerer standard for neste saksstatus etter at agent har lagt til en notis under saksansvar',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Definerer standard for neste saksstatus etter at agent har lagt til en notis for en sak som blir avvist',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            'Definerer standard for neste saksstatus når agent videresender en sak',
        'Defines the default next state of a ticket after the message has been sent, in the email outbound screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            'Setter standard for neste saksstatus når den blir opprettet/besvart av agent',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Definerer standard notistekst for utgående telefon-saker i agentdelen',
        'Defines the default priority of follow-up customer tickets in the ticket zoom screen in the customer interface.' =>
            '',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            'Setter standard prioritet på nye saker opprettet i kundeportalen',
        'Defines the default priority of new tickets.' => 'Setter standard prioritet på nye saker',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            'Setter standardkø for nye saker opprettet i kundeportalen.',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            'Definerer standard forvalg i menyen for dynamiske objekter (Form: Common Specification)',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            'Definerer standard forvalg i menyen for tilgangsrettigheter (Form: Common Specification)',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            'Definerer standard forvalg i menyen for statistikkformat (Form: Common Specification). Vennligst skriv inn formatnøkkelen (se Stats::Format)',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Setter standard sendertype for utgående telefonsaker i agentdelen',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            'Setter standard sendertype for saker i saksvisningen i kundeportalen',
        'Defines the default shown ticket search attribute for ticket search screen (AllTickets/ArchivedTickets/NotArchivedTickets).' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen. Example: "Key" must have the name of the Dynamic Field in this case \'X\', "Content" must have the value of the Dynamic Field depending on the Dynamic Field type,  Text: \'a text\', Dropdown: \'1\', Date/Time: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' and or \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.' =>
            '',
        'Defines the default sort criteria for all queues displayed in the queue view.' =>
            '',
        'Defines the default sort criteria for all services displayed in the service view.' =>
            '',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            'Definerer standard sorteringsrekkefølge for alle køer i køvisningen, etter at de er blitt sortert etter prioritet.',
        'Defines the default sort order for all services in the service view, after priority sort.' =>
            '',
        'Defines the default spell checker dictionary.' => 'Definerer standard ordliste for stavekontroll.',
        'Defines the default state of new customer tickets in the customer interface.' =>
            'Definerer standard status for nye kundesaker opprettet i kundeportalen.',
        'Defines the default state of new tickets.' => 'Definerer standard status for nye saker',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Definerer standardverdi for emnefeltet i skjermbildet for utgående telefonsak i agentbildet.',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default the number of seconds (from current time) to re-schedule a generic interface failed task.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of this operation.' =>
            '',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Definerer standard saksrekkefølge (etter de er sortert etter prioritet) i eskaleringsvisningen. Opp: eldste først. Ned: nyeste først.',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Definerer standard saksrekkefølge (etter de er sortert etter prioritet) i statusvisningen. Opp: eldste først. Ned: nyeste først',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Definerer standard saksrekkefølge for søkeresultater i agentbildet. Opp: eldste først. Ned: nyeste først.',
        'Defines the default ticket order in the ticket search result of the this operation. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            'Definerer standard saksrekkefølge i et søkeresultat i kundebildet. Opp: eldste først. Ned: nyeste først.',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            'Definerer standard saksprioritet i "avslutt sak"-skjermen i agentbildet.',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default ticket type for new customer tickets in the customer interface.' =>
            '',
        'Defines the default ticket type.' => '',
        'Defines the default type for article in the customer interface.' =>
            'Definerer standard type for innlegg i kundebildet.',
        'Defines the default type of forwarded message in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the default type of the article for this operation.' => '',
        'Defines the default type of the message in the email outbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the close ticket screen of the agent interface.' =>
            'Definerer standard type notis i "Avslutt sak" bildet.',
        'Defines the default type of the note in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket note screen of the agent interface.' =>
            'Definerer standard type notis i "Legg til notis" bildet.',
        'Defines the default type of the note in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default type of the note in the ticket zoom screen of the customer interface.' =>
            '',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            '',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            '',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            '',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            '',
        'Defines the dynamic fields that are used for displaying on calendar events.' =>
            '',
        'Defines the fall-back path to open fetchmail binary. Note: The name of the binary needs to be \'fetchmail\', if it is different please use a symbolic link.' =>
            '',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            '',
        'Defines the format of responses in the ticket compose screen of the agent interface ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] is only realname of From).' =>
            '',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            '',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every user for these groups).' =>
            '',
        'Defines the height for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            '',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            '',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            '',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            '',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            '',
        'Defines the hours and week days to count the working time.' => 'Definerer timer og ukedager som telles som arbeidstid.',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            '',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            '',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            '',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            '',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            '',
        'Defines the list of online repositories. Another installations can be used as repository, for example: Key="http://example.com/otrs/public.pl?Action=PublicRepository;File=" and Content="Some Name".' =>
            '',
        'Defines the list of possible next actions on an error screen, a full path is required, then is possible to add external links if needed.' =>
            '',
        'Defines the list of types for templates.' => '',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            '',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            '',
        'Defines the maximal size (in bytes) for file uploads via the browser. Warning: Setting this option to a value which is too low could cause many masks in your OTRS instance to stop working (probably any mask which takes input from the user).' =>
            '',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            'Definerer maksimal gyldig tid (i sekunder) for en sesjons-ID.',
        'Defines the maximum number of affected tickets per job.' => '',
        'Defines the maximum number of pages per PDF file.' => 'Definerer maksimalt antall sider per PDF-fil.',
        'Defines the maximum number of quoted lines to be added to responses.' =>
            '',
        'Defines the maximum number of tasks to be executed as the same time.' =>
            '',
        'Defines the maximum size (in MB) of the log file.' => 'Definerer maksimal størrelse (i MB) for loggfilen.',
        'Defines the maximum size in KiloByte of GenericInterface responses that get logged to the gi_debugger_entry_content table.' =>
            '',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            '',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            'Definerer modulen som viser alle innloggede saksbehandlere i saksbehandlergrensesnittet.',
        'Defines the module that shows all the currently logged in customers in the agent interface.' =>
            '',
        'Defines the module that shows the currently logged in agents in the customer interface.' =>
            '',
        'Defines the module that shows the currently logged in customers in the customer interface.' =>
            '',
        'Defines the module to authenticate customers.' => 'Definerer modulen for å autentisere kunder.',
        'Defines the module to display a notification if cloud services are disabled.' =>
            '',
        'Defines the module to display a notification in different interfaces on different occasions for OTRS Business Solution™.' =>
            '',
        'Defines the module to display a notification in the agent interface if the OTRS Daemon is not running.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having system maintenance active.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent session limit prior warning is reached.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            '',
        'Defines the module to generate code for periodic page reloads.' =>
            '',
        'Defines the module to send emails. "Sendmail" directly uses the sendmail binary of your operating system. Any of the "SMTP" mechanisms use a specified (external) mailserver. "DoNotSendEmail" doesn\'t send emails and it is useful for test systems.' =>
            '',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            '',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            'Definerer navnet på applikasjonen, som vises i webgrensesnittet, faner, og tittellinjen på nettleseren.',
        'Defines the name of the column to store the data in the preferences table.' =>
            '',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            '',
        'Defines the name of the indicated calendar.' => '',
        'Defines the name of the key for customer sessions.' => '',
        'Defines the name of the session key. E.g. Session, SessionID or OTRS.' =>
            '',
        'Defines the name of the table where the user preferences are stored.' =>
            '',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the next possible states after sending a message in the email outbound screen of the agent interface.' =>
            '',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            '',
        'Defines the number of character per line used in case an HTML article preview replacement on TemplateGenerator for EventNotifications.' =>
            '',
        'Defines the number of days to keep the daemon log files.' => '',
        'Defines the number of header fields in frontend modules for add and update postmaster filters. It can be up to 99 fields.' =>
            '',
        'Defines the parameters for the customer preferences table.' => '',
        'Defines the parameters for the dashboard backend. "Cmd" is used to specify command with parameters. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            '',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            '',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.' =>
            '',
        'Defines the path to PGP binary.' => '',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            '',
        'Defines the postmaster default queue.' => '',
        'Defines the priority in which the information is logged and presented.' =>
            '',
        'Defines the recipient target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "System address" displays all system addresses) in the agent interface.' =>
            '',
        'Defines the recipient target of the tickets ("Queue" shows all queues, "SystemAddress" shows only the queues which are assigned to system addresses) in the customer interface.' =>
            '',
        'Defines the required permission to show a ticket in the escalation view of the agent interface.' =>
            '',
        'Defines the search limit for the stats.' => '',
        'Defines the sender for rejected emails.' => '',
        'Defines the separator between the agents real name and the given queue email address.' =>
            '',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            '',
        'Defines the standard size of PDF pages.' => 'Definerer standardstørrelse på PDF-sider.',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            'Definerer status på en sak hvis den får en oppfølging og saken allerede var avsluttet.',
        'Defines the state of a ticket if it gets a follow-up.' => 'Definerer status på en sak hvis den får en oppfølging.',
        'Defines the state type of the reminder for pending tickets.' => 'Definerer statustypen for påminnelser om saker på vent.',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            '',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            '',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            '',
        'Defines the subject for rejected emails.' => '',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            '',
        'Defines the system identifier. Every ticket number and http session string contains this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of OTRS).' =>
            '',
        'Defines the target attribute in the link to external customer database. E.g. \'AsPopup PopupType_TicketAction\'.' =>
            '',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            '',
        'Defines the ticket fields that are going to be displayed calendar events. The "Key" defines the field or ticket attribute and the "Content" defines the display name.' =>
            '',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            '',
        'Defines the two-factor module to authenticate agents.' => '',
        'Defines the two-factor module to authenticate customers.' => '',
        'Defines the type of protocol, used by the web server, to serve the application. If https protocol will be used instead of plain http, it must be specified here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is only used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            '',
        'Defines the used character for plaintext email quotes in the ticket compose screen of the agent interface. If this is empty or inactive, original emails will not be quoted but appended to the response.' =>
            '',
        'Defines the user identifier for the customer panel.' => '',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            '',
        'Defines the valid state types for a ticket.' => '',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/otrs.Console.pl Maint::Ticket::UnlockTimeout" can be used.' =>
            '',
        'Defines the viewable locks of a ticket. NOTE: When you change this setting, make sure to delete the cache in order to use the new value. Default: unlock, tmp_lock.' =>
            '',
        'Defines the width for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            '',
        'Defines which items are available for \'Action\' in third level of the ACL structure.' =>
            '',
        'Defines which items are available in first level of the ACL structure.' =>
            '',
        'Defines which items are available in second level of the ACL structure.' =>
            '',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            '',
        'Defines wich article type should be expanded when entering the overview. If nothing defined, latest article will be expanded.' =>
            '',
        'Defines, which tickets of which ticket state types should not be listed in linked ticket lists.' =>
            '',
        'Delete expired cache from core modules.' => '',
        'Delete expired loader cache weekly (Sunday mornings).' => '',
        'Delete expired sessions.' => '',
        'Deleted link to ticket "%s".' => 'Slettet link til sak «%s».',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            '',
        'Deletes requested sessions if they have timed out.' => '',
        'Delivers extended debugging information in the frontend in case any AJAX errors occur, if enabled.' =>
            '',
        'Deploy and manage OTRS Business Solution™.' => '',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            '',
        'Determines if the statistics module may generate ticket lists.' =>
            '',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            '',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            '',
        'Determines the next possible ticket states, for process tickets in the agent interface.' =>
            '',
        'Determines the next possible ticket states, for process tickets in the customer interface.' =>
            '',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            '',
        'Determines the next screen after the follow-up screen of a zoomed ticket in the customer interface.' =>
            '',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return the last overview screen (e.g. search results, queueview, dashboard). TicketZoom will return to the TicketZoom.' =>
            '',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            '',
        'Determines which options will be valid of the recipient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            '',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            '',
        'Development' => '',
        'Disable HTTP header "Content-Security-Policy" to allow loading of external script contents. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            '',
        'Disable HTTP header "X-Frame-Options: SAMEORIGIN" to allow OTRS to be included as an IFrame in other websites. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            '',
        'Disable restricted security for IFrames in IE. May be required for SSO to work in IE.' =>
            '',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be activated).' =>
            '',
        'Disables the communication between this system and OTRS Group servers that provides cloud services. If active, some functionality will be lost such as system registration, support data sending, upgrading to and use of OTRS Business Solution™, OTRS Verify™, OTRS News and product News dashboard widgets, among others.' =>
            '',
        'Disables the web installer (http://yourhost.example.com/otrs/installer.pl), to prevent the system from being hijacked. If set to "No", the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If not active, it also disables the GenericAgent, PackageManager and SQL Box.' =>
            '',
        'Display a warning and prevent search when using stop words within fulltext search.' =>
            '',
        'Display settings to override defaults for Process Tickets.' => '',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            '',
        'Dropdown' => 'Nedfellsmeny',
        'Dutch stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Dynamic Fields Checkbox Backend GUI' => '',
        'Dynamic Fields Date Time Backend GUI' => '',
        'Dynamic Fields Drop-down Backend GUI' => '',
        'Dynamic Fields GUI' => '',
        'Dynamic Fields Multiselect Backend GUI' => '',
        'Dynamic Fields Overview Limit' => '',
        'Dynamic Fields Text Backend GUI' => '',
        'Dynamic Fields used to export the search result in CSV format.' =>
            '',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key => My Group\', \'Content: Name_X, NameY\'.' =>
            '',
        'Dynamic fields limit per page for Dynamic Fields Overview' => '',
        'Dynamic fields options shown in the ticket message screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###DynamicField.' =>
            '',
        'Dynamic fields options shown in the ticket reply section in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the email outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the process widget in ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the sidebar of the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket close screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket compose screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket email screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket forward screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket free text screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket medium format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket move screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket note screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket owner screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket pending screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone inbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket phone screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket preview format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket priority screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket responsible screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            '',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.' =>
            '',
        'Dynamic fields shown in the ticket search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'Dynamic fields shown in the ticket small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Dynamic fields shown in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            '',
        'DynamicField' => '',
        'DynamicField backend registration.' => '',
        'DynamicField object registration.' => '',
        'E-Mail Outbound' => 'Utgående e-post',
        'Edit Customer Companies.' => '',
        'Edit Customer Users.' => '',
        'Edit customer company' => 'Endre kundebedrift',
        'Email Addresses' => 'e-postadresser',
        'Email Outbound' => '',
        'Email sent to "%s".' => 'E-post sendt til «%s».',
        'Email sent to customer.' => 'E-post sendt til saksbehandler.',
        'Enable keep-alive connection header for SOAP responses.' => '',
        'Enabled filters.' => 'Aktiver filtre.',
        'Enables PGP support. When PGP support is enabled for signing and encrypting mail, it is HIGHLY recommended that the web server runs as the OTRS user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            '',
        'Enables S/MIME support.' => 'Aktiverer støtte for S/MIME',
        'Enables customers to create their own accounts.' => 'Lar kunder opprette sine egne kontoer',
        'Enables fetch S/MIME from CustomerUser backend support.' => '',
        'Enables file upload in the package manager frontend.' => '',
        'Enables or disables the caching for templates. WARNING: Do NOT disable template caching for production environments for it will cause a massive performance drop! This setting should only be disabled for debugging reasons!' =>
            '',
        'Enables or disables the debug mode over frontend interface.' => '',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            '',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            '',
        'Enables spell checker support.' => 'Aktiverer støtte for stavekontroll.',
        'Enables the minimal ticket counter size (if "Date" was selected as TicketNumberGenerator).' =>
            '',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            '',
        'Enables ticket bulk action feature only for the listed groups.' =>
            '',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            '',
        'Enables ticket watcher feature only for the listed groups.' => '',
        'English (Canada)' => 'Engelsk (Canada)',
        'English (United Kingdom)' => 'Engelsk (Storbritannia)',
        'English (United States)' => 'Engelsk (Amerika)',
        'English stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Enroll process for this ticket' => '',
        'Enter your shared secret to enable two factor authentication.' =>
            '',
        'Escalation response time finished' => '',
        'Escalation response time forewarned' => '',
        'Escalation response time in effect' => '',
        'Escalation solution time finished' => '',
        'Escalation solution time forewarned' => '',
        'Escalation solution time in effect' => '',
        'Escalation update time finished' => '',
        'Escalation update time forewarned' => '',
        'Escalation update time in effect' => '',
        'Escalation view' => 'Eskaleringsvisning',
        'EscalationTime' => '',
        'Estonian' => 'Estisk',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate).' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Event module that performs an update statement on TicketIndex to rename the queue name there if needed and if StaticDB is actually used.' =>
            '',
        'Event module that updates customer user search profiles if login changes.' =>
            '',
        'Event module that updates customer user service membership if login changes.' =>
            '',
        'Event module that updates customer users after an update of the Customer.' =>
            '',
        'Event module that updates tickets after an update of the Customer User.' =>
            '',
        'Event module that updates tickets after an update of the Customer.' =>
            '',
        'Events Ticket Calendar' => '',
        'Execute SQL statements.' => 'Kjør SQL-spørringer',
        'Executes a custom command or module. Note: if module is used, function is required.' =>
            '',
        'Executes follow-up checks on In-Reply-To or References headers for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow-up checks on attachment contents for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow-up checks on email body for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow-up checks on the raw source email for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Exports the whole article tree in search result (it can affect the system performance).' =>
            '',
        'Fetch emails via fetchmail (using SSL).' => '',
        'Fetch emails via fetchmail.' => '',
        'Fetch incoming emails from configured mail accounts.' => '',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            '',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.' =>
            '',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            '',
        'Filter for debugging Transitions. Note: More filters can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            '',
        'Filter incoming emails.' => 'Filtrering av innkommende e-poster',
        'Finnish' => 'Finsk',
        'First Queue' => '',
        'FirstLock' => 'FørsteLås',
        'FirstResponse' => 'FørsteTilbakemelding',
        'FirstResponseDiffInMin' => 'FørsteTilbakemeldingDiffIMin',
        'FirstResponseInMin' => 'FørsteTilbakemeldingIMin',
        'Firstname Lastname' => 'Fornavn Etternavn',
        'Firstname Lastname (UserLogin)' => 'Firstname Lastname (Brukernavn)',
        'FollowUp for [%s]. %s' => 'Oppfølging til sak [%s]. %s',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            '',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            '',
        'Forces to unlock tickets after being moved to another queue.' =>
            'Tvinger opp-låsing av saker ved flytting til ny kø',
        'Forwarded to "%s".' => 'Videresendt til «%s».',
        'French' => 'Fransk',
        'French (Canada)' => 'Fransk (Canada)',
        'French stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Frontend' => '',
        'Frontend module registration (disable AgentTicketService link if Ticket Serivice feature is not used).' =>
            '',
        'Frontend module registration (disable company link if no company feature is used).' =>
            '',
        'Frontend module registration (disable ticket processes screen if no process available) for Customer.' =>
            '',
        'Frontend module registration (disable ticket processes screen if no process available).' =>
            '',
        'Frontend module registration for the agent interface.' => 'Registrering av websidemodul i agentdelen.',
        'Frontend module registration for the customer interface.' => '',
        'Frontend theme' => 'Nettsidetema',
        'Full value' => '',
        'Fulltext index regex filters to remove parts of the text.' => '',
        'Fulltext search' => 'Fulltekst-søk',
        'Galician' => 'Galisisk',
        'General ticket data shown in the ticket overviews (fall-back). Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note that TicketNumber can not be disabled, because it is necessary.' =>
            '',
        'Generate dashboard statistics.' => '',
        'Generic Info module.' => '',
        'GenericAgent' => 'Administrasjon: Generisk Saksbehandler',
        'GenericInterface Debugger GUI' => '',
        'GenericInterface Invoker GUI' => '',
        'GenericInterface Operation GUI' => '',
        'GenericInterface TransportHTTPREST GUI' => '',
        'GenericInterface TransportHTTPSOAP GUI' => '',
        'GenericInterface Web Service GUI' => '',
        'GenericInterface Webservice History GUI' => '',
        'GenericInterface Webservice Mapping GUI' => '',
        'GenericInterface module registration for the invoker layer.' => '',
        'GenericInterface module registration for the mapping layer.' => '',
        'GenericInterface module registration for the operation layer.' =>
            '',
        'GenericInterface module registration for the transport layer.' =>
            '',
        'German' => 'Tysk',
        'German stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files.' =>
            'Gir sluttbrukerne muligheten til å overstyre separatortegnet til CSV-filer definert i oversettelsesfila.',
        'Global Search Module.' => '',
        'Go back' => 'Gå tilbake',
        'Google Authenticator' => '',
        'Graph: Bar Chart' => '',
        'Graph: Line Chart' => '',
        'Graph: Stacked Area Chart' => '',
        'Greek' => 'Gresk',
        'HTML Reference' => '',
        'HTML Reference.' => '',
        'Hebrew' => 'Hebraisk',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). Runtime will do full-text searches on live data (it works fine for up to 50.000 tickets). StaticDB will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild".' =>
            '',
        'Hindi' => 'Hindi',
        'Hungarian' => 'Ungarsk',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            'Hvis "DB" er valgt som Customer::AuthModule kan man velge databasedriver (normalt brukes et automatisk oppsett).',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            'Hvis "DB" er valgt som Customer::AuthModule kan man sette et passord for å koble til kundetabellen.',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            'Hvis "DB" er valgt under som::AuthModule kan man sette et brukernavn for å koble til kundetabellen.',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            'Hvis "DB" er valgt som Customer::AuthModule må man spesifisere en DSN for tilkoplingen til kundetabellen.',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            'Hvis "DB" er valgt som Customer::AuthModule må man skrive inn feltnavnet som skal kobles til CustomerPassword i kundetabellen.',
        'If "DB" was selected for Customer::AuthModule, the crypt type of passwords must be specified.' =>
            'Hvis "DB" er valgt som Customer::AuthModule må man spesifisere krypteringstype for passordfeltet i tabellen.',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            'Hvis "DB" er valgt som Customer::AuthModule må feltnavnet som skal kobles til CustomerKey spesifiseres.',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            'Hvis "DB" er valgt som Customer::AuthModule må man skrive inn navnet på tabellen for lagring av kundedata.',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            'Hvis "DB" er valgt for SessionModule må man spesifisere tabellnavnet for lagring av sesjonsdata.',
        'If "FS" was selected for SessionModule, a directory where the session data will be stored must be specified.' =>
            'Hvis "FS" er valgt for SessionModule må man spesifisere en mappe som kan brukes til lagring av sesjonsdata.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            '',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            'Hvis "HTTPBasicAuth" er valgt som Customer::AuthModule kan du velge å ta vekk deler av brukernavnet (f.eks. gjøre "domene\bruker" om til "bruker").',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            'Hvis "LDAP" er valgt som Customer::AuthModule og du vil legge til en tekst til etter brukernavnet (f.eks. endre "brukernavn" til "brukernavn@domene") kan du spesifisere dette her.',
        'If "LDAP" was selected for Customer::AuthModule and special paramaters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            'Hvis "LDAP" er valgt som Customer::AuthModule og du trenger spesielle parametre for LDAP-modulen Net::LDAP kan du spesifisere dem her. Se "perldoc Net::LDAP" for mer info om parametrene.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            'Hvis "LDAP" er valgt som Customer::AuthModule og brukerne kun har anonym tilgang til LDAP-treet kan du spesifisere en egen bruker for søking. Passordet til denne brukeren skrives inn her.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            'Hvis "LDAP" er valgt som Customer::AuthModule og brukerne kun har anonym tilgang til LDAP-treet kan du spesifisere en egen bruker for søking. Brukernavnet til denne brukeren skrives inn her',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            'Hvis "LDAP" er valgt som Customer::AuthModule må Base DN skrives inn her.',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            'Hvis "LDAP" er valgt som Customer::AuthModule kan du skrive inn LDAP-tjeneren her',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            'Hvis "LDAP" er valgt som Customer::AuthModule må brukernes id-felt spesifiseres her (f.eks. uid).',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            'Hvis "LDAP" er valgt som Customer::AuthModule kan brukernes attributter settes opp. For LDAP posixGroups brukes UID, for andre må full bruker-DN brukes.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            'Hvis "LDAP" er valgt som Customer::AuthModule kan du spesifisere tilgangsoppsett her.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Hvis "LDAP" er valgt som Customer::AuthModule kan du velge at systemet vil stoppe opp hvis f.eks. tilkoplingen til en tjener ikke kan gjøres pga. nettverksproblemer.',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use OTRS. Specify the group, who may access the system.' =>
            '',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            'Hvis "LDAP" er valgt som Customer::AuthModule kan du sette et filter for alle LDAP-søk. F.eks. (mail=*), (objectclass=user) eller (!objectclass=computer)',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            'Hvis "Radius" er valgt som Customer::AuthModule må du skrive inn passordet som autentiserer mot radius-tjeneren.',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            'Hvis "Radius" er valgt som Customer::AuthModule må du skrive inn adressen til Radius-tjeneren her.',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Hvis "Radius" er valgt som Customer::AuthModule kan du velge at systemet vil stoppe opp om Radius-tjeneren ikke lenger er tilgjengelig pga. nettverksproblemer el.l.',
        'If "Sendmail" was selected as SendmailModule, the location of the sendmail binary and the needed options must be specified.' =>
            'Hvis "Sendmail" er valgt som SendmailModule må du sette opp stien til sendmail-programmet, samt evt. nødvendige tilleggsvalg.',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            '',
        'If "SysLog" was selected for LogModule, a special log sock can be specified (on solaris you may need to use \'stream\').' =>
            '',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            '',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            '',
        'If active, none of the regular expressions may match the user\'s email address to allow registration.' =>
            '',
        'If active, one of the regular expressions has to match the user\'s email address to allow registration.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            'Hvis noen av "SMTP"-mekanismene er valgt som SendmailModule, og autentisering mot e-post-tjeneren er nødvendig, må et passord spesifiseres.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            'Hvis noen av "SMTP"-mekanismene er valgt som SendmailModule, og autentisering mot e-post-tjeneren er nødvendig, må et brukernavn spesifiseres',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            'Hvis noen av "SMTP"-mekanismene er valgt som SendmailModule, må e-post-tjeneren som sender ut e-post spesifiseres.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            'Hvis noen av "SMTP"-mekanismene er valgt som SendmailModule, må porten der din e-post-tjener lytter på innkommende forbindelser spesifiseres. ',
        'If enabled debugging information for ACLs is logged.' => '',
        'If enabled debugging information for transitions is logged.' => '',
        'If enabled the daemon will redirect the standard error stream to a log file.' =>
            '',
        'If enabled the daemon will redirect the standard output stream to a log file.' =>
            '',
        'If enabled, OTRS will deliver all CSS files in minified form. WARNING: If you turn this off, there will likely be problems in IE 7, because it cannot load more than 32 CSS files.' =>
            '',
        'If enabled, OTRS will deliver all JavaScript files in minified form.' =>
            'Hvis slått på vil OTRS levere alle JavaScript-filer i minimert form',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            'Hvis slått på vil telefonsak og e-postsak bli åpnet i nye vinduer.',
        'If enabled, the OTRS version tag will be removed from the Webinterface, the HTTP headers and the X-Headers of outgoing mails. NOTE: If you change this option, please make sure to delete the cache.' =>
            '',
        'If enabled, the customer can search for tickets in all services (regardless what services are assigned to the customer).' =>
            '',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            'Hvis slått på vil de forskjellige oversiktene (Kontrollpanel, kø-oversikt, osv.) automatisk oppdateres etter angitt tid.',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            '',
        'If no SendmailNotificationEnvelopeFrom is specified, this setting makes it possible to use the email\'s from address instead of an empty envelope sender (required in certain mail server configurations).' =>
            '',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty (unless SendmailNotificationEnvelopeFrom::FallbackToEmailFrom is set).' =>
            '',
        'If set, this address is used as envelope sender in outgoing messages (not notifications - see below). If no address is specified, the envelope sender is equal to queue e-mail address.' =>
            '',
        'If this option is enabled, then the decrypted data will be stored in the database if they are displayed in AgentTicketZoom.' =>
            '',
        'If this option is set to \'Yes\', tickets created via the web interface, via Customers or Agents, will receive an autoresponse if configured. If this option is set to \'No\', no autoresponses will be sent.' =>
            '',
        'If this regex matches, no message will be send by the autoresponder.' =>
            'Hvis denne Regulær-uttrykk-setningen slår til vil ikke autosvar bli sendt.',
        'If this setting is active, local modifications will not be highlighted as errors in the package manager and support data collector.' =>
            '',
        'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.' =>
            '',
        'Ignore system sender article types (e. g. auto responses or email notifications) to be flagged as \'Unread Article\' in AgentTicketZoom or expanded automatically in Large view screens.' =>
            '',
        'Include tickets of subqueues per default when selecting a queue.' =>
            '',
        'Include unknown customers in ticket filter.' => '',
        'Includes article create times in the ticket search of the agent interface.' =>
            'Inkluder opprettelsestidspunkt i søkedelen av agentdelen.',
        'Incoming Phone Call.' => '',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the command "bin/otrs.Console.pl Maint::Ticket::QueueIndexRebuild" for initial index creation.' =>
            '',
        'Indonesian' => '',
        'Input' => 'Tilføre',
        'Install ispell or aspell on the system, if you want to use a spell checker. Please specify the path to the aspell or ispell binary on your operating system.' =>
            '',
        'Interface language' => 'Språk for grensesnittet',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'Italian' => 'Italiensk',
        'Italian stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Ivory' => '',
        'Ivory (Slim)' => '',
        'Japanese' => 'Japansk',
        'JavaScript function for the search frontend.' => '',
        'Last customer subject' => '',
        'Lastname Firstname' => 'Etternavn Fornavn',
        'Lastname Firstname (UserLogin)' => 'Etternavn Fornavn (Brukernavn)',
        'Lastname, Firstname' => 'Etternavn, Fornavn',
        'Lastname, Firstname (UserLogin)' => 'Etternavn, Fornavn (Brukernavn)',
        'Latvian' => 'Latvisk',
        'Left' => 'Venstre',
        'Link Object' => 'Koble objekt',
        'Link Object.' => '',
        'Link agents to groups.' => 'Koble saksbehandlere til grupper',
        'Link agents to roles.' => 'Koble saksbehandlere til roller',
        'Link attachments to templates.' => 'Koble vedlegg til maler',
        'Link customer user to groups.' => 'Koble kunde-bruker til grupper.',
        'Link customer user to services.' => 'Koble kunde-bruker til tjenester.',
        'Link queues to auto responses.' => 'Koble køer til autosvar',
        'Link roles to groups.' => 'Koble roller til grupper.',
        'Link templates to queues.' => 'Koble maler til køer.',
        'Links 2 tickets with a "Normal" type link.' => 'Koble 2 saker med en "normal" lenke',
        'Links 2 tickets with a "ParentChild" type link.' => 'Koble 2 saker med en hierarkisk lenke',
        'List of CSS files to always be loaded for the agent interface.' =>
            'Liste med CSS-filer som alltid skal lastes for agentdelen',
        'List of CSS files to always be loaded for the customer interface.' =>
            'Liste med CSS-filer som alltid skal lastes for kundeportalen',
        'List of JS files to always be loaded for the agent interface.' =>
            'Liste over JS-filer som alltid skal lastes for agentdelen',
        'List of JS files to always be loaded for the customer interface.' =>
            'Liste over JS-filer som alltid skal lastes for kundeportalen',
        'List of all CustomerCompany events to be displayed in the GUI.' =>
            '',
        'List of all CustomerUser events to be displayed in the GUI.' => '',
        'List of all DynamicField events to be displayed in the GUI.' => '',
        'List of all Package events to be displayed in the GUI.' => '',
        'List of all article events to be displayed in the GUI.' => '',
        'List of all queue events to be displayed in the GUI.' => '',
        'List of all ticket events to be displayed in the GUI.' => '',
        'List of default Standard Templates which are assigned automatically to new Queues upon creation.' =>
            '',
        'List of responsive CSS files to always be loaded for the agent interface.' =>
            '',
        'List of responsive CSS files to always be loaded for the customer interface.' =>
            '',
        'List view' => '',
        'Lithuanian' => 'Litauisk',
        'Lock / unlock this ticket' => 'Lås / lås opp denne saken ',
        'Locked Tickets.' => '',
        'Locked ticket.' => 'Sak satt som privat.',
        'Log file for the ticket counter.' => 'Loggfil for sakstelleren',
        'Logout of customer panel.' => '',
        'Loop-Protection! No auto-response sent to "%s".' => 'Loop-Protection! No auto-response sent to «%s».',
        'Mail Accounts' => 'E-postkontoer',
        'Main menu registration.' => '',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            'Gjør at systemet sjekker MX-oppføringen for e-postadressen før det sender en e-post eller oppretter en telefonsak eller e-postsak.',
        'Makes the application check the syntax of email addresses.' => 'Gjør at systemet sjekker at en e-postadresse er skrevet på riktig måte.',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            'Gjør at sesjoner bruker informasjonskapsler (cookies). Dersom dette er slått av på klientens nettleser vil systemet legge til sesjons-ID i lenkene.',
        'Malay' => '',
        'Manage OTRS Group cloud services.' => '',
        'Manage PGP keys for email encryption.' => 'Adminstrasjon av PGP-nøkler for kryptering og signering av e-poster',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'Administrasjon av POP3- og IMAP-kontoer for innkommende e-post',
        'Manage S/MIME certificates for email encryption.' => 'Adminstrasjon av S/MIME-sertifikater for e-postkryptering',
        'Manage existing sessions.' => 'Administrasjon av aktive sesjoner',
        'Manage support data.' => '',
        'Manage system registration.' => '',
        'Manage tasks triggered by event or time based execution.' => '',
        'Mark this ticket as junk!' => 'Marker denne saken som søppel!',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            'Maks. størrelse (antall tegn) for kundelisten (telefon og e-post) i opprett-skjermen.',
        'Max size (in rows) of the informed agents box in the agent interface.' =>
            '',
        'Max size (in rows) of the involved agents box in the agent interface.' =>
            '',
        'Max size of the subjects in an email reply and in some overview screens.' =>
            '',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            'Maksimum antall autosvar til egne e-postadresser per dag (beskyttelse mot e-post-looping)',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            'Maks. størrelse (i kilobytes) på e-post som kan hentes via POP3/IMAP',
        'Maximum Number of a calendar shown in a dropdown.' => '',
        'Maximum length (in characters) of the dynamic field in the article of the ticket zoom view.' =>
            '',
        'Maximum length (in characters) of the dynamic field in the sidebar of the ticket zoom view.' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            'Maks. antall viste saker i søkeresultater (agentdelen)',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            'Maks. antall viste saker i søkeresultater (kundeportalen)',
        'Maximum number of tickets to be displayed in the result of this operation.' =>
            '',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            'Maks. størrelse (antall tegn) i kundeinfo-tabellen i saksdetaljer-visningen.',
        'Merge this ticket and all articles into a another ticket' => '',
        'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.' => '',
        'Miscellaneous' => 'Diverse',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            'Modul for valg av mottaker når man oppretter ny sak i kundeportalen.',
        'Module to check if arrived emails should be marked as email-internal (because of original forwarded internal email). ArticleType and SenderType define the values for the arrived email/article.' =>
            '',
        'Module to check the group permissions for customer access to tickets.' =>
            '',
        'Module to check the group permissions for the access to tickets.' =>
            '',
        'Module to compose signed messages (PGP or S/MIME).' => 'Modul for å lage signerte meldinger (PGP eller S/MIME)',
        'Module to crypt composed messages (PGP or S/MIME).' => 'Modul for å kryptere meldinger (PGP eller S/MIME)',
        'Module to fetch customer users SMIME certificates of incoming messages.' =>
            '',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            'Modul for å filtrere og manipulere innkommende meldinger Blokker/ignorer alle søppel-meldinger med "From: noreply@"-adresser',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            '',
        'Module to filter encrypted bodies of incoming messages.' => '',
        'Module to generate accounted time ticket statistics.' => '',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            '',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            '',
        'Module to generate ticket solution and response time statistics.' =>
            '',
        'Module to generate ticket statistics.' => '',
        'Module to grant access if the CustomerID of the ticket matches the CustomerID of the customer.' =>
            '',
        'Module to grant access if the CustomerUserID of the ticket matches the CustomerUserID of the customer.' =>
            '',
        'Module to grant access to any agent that has been involved in a ticket in the past (based on ticket history entries).' =>
            '',
        'Module to grant access to the agent responsible of a ticket.' =>
            '',
        'Module to grant access to the creator of a ticket.' => '',
        'Module to grant access to the owner of a ticket.' => '',
        'Module to grant access to the watcher agents of a ticket.' => '',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            '',
        'Module to use database filter storage.' => 'Modul for å bruke databaselagring av filtre.',
        'Multiselect' => '',
        'My Services' => 'Mine tjenester',
        'My Tickets.' => '',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            '',
        'Name of custom service. The custom service is a service selection of your preferred services and can be selected in the preferences settings.' =>
            '',
        'NameX' => 'NavnX',
        'Nederlands' => 'Nederland',
        'New Ticket [%s] created (Q=%s;P=%s;S=%s).' => 'Ny sak [%s] opprettet (Q=%s;P=%s;S=%s).',
        'New Window' => 'Nytt vindu',
        'New owner is "%s" (ID=%s).' => 'Ny saksbehandler er «%s» (ID=%s).',
        'New process ticket' => 'Ny prosess sak',
        'New responsible is "%s" (ID=%s).' => 'Ny ansvarlig er «%s» (ID=%s).',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'None' => 'Ingen',
        'Norwegian' => 'Norsk',
        'Notification sent to "%s".' => 'Varsling sendt til «%s».',
        'Number of displayed tickets' => 'Antall viste saker',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            'Antall linjer (per sak) som vises i søkeverktøyet.',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            'Antall saker som vises per side i et søkeresultat.',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            'Antall saker som vises per side i et søkeresultat i kundeportalen.',
        'OTRS can use one or more readonly mirror databases for expensive operations like fulltext search or statistics generation. Here you can specify the DSN for the first mirror database.' =>
            '',
        'Old: "%s" New: "%s"' => 'Gammel: «%s» Ny: «%s»',
        'Online' => 'Online',
        'Open tickets (customer user)' => 'Åpne saker (kunde-bruker)',
        'Open tickets (customer)' => 'Åpne saker (kunder)',
        'Option' => '',
        'Optional queue limitation for the CreatorCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Optional queue limitation for the InvolvedCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Optional queue limitation for the OwnerCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Optional queue limitation for the ResponsibleCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Out Of Office' => '',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            '',
        'Overview Escalated Tickets.' => '',
        'Overview Refresh Time' => 'Oppdateringstid',
        'Overview of all escalated tickets.' => '',
        'Overview of all open Tickets.' => 'Oversikt over alle åpne saker',
        'Overview of all open tickets.' => '',
        'Overview of customer tickets.' => '',
        'PGP Key Management' => 'Administrasjon: PGP Nøkkler',
        'PGP Key Upload' => 'Last opp PGP-nøkkel',
        'Package event module file a scheduler task for update registration.' =>
            '',
        'Parameters for the CreateNextMask object in the preference view of the agent interface.' =>
            '',
        'Parameters for the CustomQueue object in the preference view of the agent interface.' =>
            '',
        'Parameters for the CustomService object in the preference view of the agent interface.' =>
            '',
        'Parameters for the RefreshTime object in the preference view of the agent interface.' =>
            '',
        'Parameters for the column filters of the small ticket overview.' =>
            '',
        'Parameters for the dashboard backend of the customer company information of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the customer id status widget of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the customer user list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Parameters for the dashboard backend of the queue overview widget of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "QueuePermissionGroup" is not mandatory, queues are only listed if they belong to this permission group if you enable it. "States" is a list of states, the key is the sort order of the state in the widget. "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the running process tickets overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Parameters for the dashboard backend of the ticket events calendar of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Parameters for the dashboard backend of the ticket stats of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the upcoming events widget of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the pages (in which the dynamic fields are shown) of the dynamic fields overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the medium ticket overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the small ticket overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the ticket preview overview.' =>
            '',
        'Parameters of the example SLA attribute Comment2.' => '',
        'Parameters of the example queue attribute Comment2.' => '',
        'Parameters of the example service attribute Comment2.' => '',
        'ParentChild' => '',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            '',
        'People' => 'Personer',
        'Performs the configured action for each event (as an Invoker) for each configured Webservice.' =>
            '',
        'Permitted width for compose email windows.' => 'Tillatt bredde for "skriv e-post" vinduer.',
        'Permitted width for compose note windows.' => 'Tillatt bredde for "skriv notis" vinduer.',
        'Persian' => 'Persisk',
        'Phone Call.' => '',
        'Picture Upload' => '',
        'Picture upload module.' => '',
        'Picture-Upload' => 'Opplasting av bilde',
        'Polish' => 'Polsk',
        'Portuguese' => 'Portugisisk',
        'Portuguese (Brasil)' => 'Portugisisk (Brasil)',
        'PostMaster Filters' => 'Postmaster-filtre',
        'PostMaster Mail Accounts' => 'Postmaster e-postkontoer',
        'Process Management Activity Dialog GUI' => '',
        'Process Management Activity GUI' => '',
        'Process Management Path GUI' => '',
        'Process Management Transition Action GUI' => '',
        'Process Management Transition GUI' => '',
        'Process Ticket.' => '',
        'Process pending tickets.' => '',
        'Process ticket' => '',
        'ProcessID' => 'ProsessID',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see http://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            '',
        'Provides a matrix overview of the tickets per state per queue.' =>
            '',
        'Queue view' => 'Køvisning',
        'Rebuild the ticket index for AgentTicketQueue.' => '',
        'Recognize if a ticket is a follow-up to an existing ticket using an external ticket number.' =>
            '',
        'Refresh interval' => 'Automatisk innlasting',
        'Removed subscription for user "%s".' => 'Fjernet abonnement for brukeren «%s».',
        'Removes the ticket watcher information when a ticket is archived.' =>
            '',
        'Renew existing SMIME certificates from customer backend. Note: SMIME and SMIME::FetchFromCustomer needs to be active in SysConfig and customer backend needs to be configured to fetch UserSMIMECertificate attribute.' =>
            '',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            '',
        'Reports' => 'Rapporter',
        'Reports (OTRS Business Solution™)' => 'Rapporter (OTRS Business Solution™)',
        'Reprocess mails from spool directory that could not be imported in the first place.' =>
            '',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            'Nødvendige rettigheter for å endre kunde på en sak.',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            'Nødvendige rettigheter for å bruke "Avslutt sak" bildet.',
        'Required permissions to use the email outbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            'Nødvendige rettigheter for å bruke "Opprett sak" bildet.',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket merge screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            '',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            '',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            '',
        'Responsible Tickets' => '',
        'Responsible Tickets.' => '',
        'Restores a ticket from the archive (only if the event is a state change to any open available state).' =>
            '',
        'Retains all services in listings even if they are children of invalid elements.' =>
            '',
        'Right' => 'Høyre',
        'Roles <-> Groups' => 'Roller <-> Grupper',
        'Run file based generic agent jobs (Note: module name need needs to be specified in -configuration-module param e.g. "Kernel::System::GenericAgent").' =>
            '',
        'Running Process Tickets' => '',
        'Runs an initial wildcard search of the existing customer company when accessing the AdminCustomerCompany module.' =>
            '',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            '',
        'Runs the system in "Demo" mode. If set to "Yes", agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            '',
        'Russian' => 'Russisk',
        'S/MIME Certificate Upload' => 'Opplasting av S/MIME-sertifikat',
        'SMS' => 'SMS',
        'SMS (Short Message Service)' => '',
        'Sample command output' => '',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the OTRS user. You can switch between the modules even on a system that is already in production without any loss of data. Note: Searching for attachment names is not supported when "FS" is used.' =>
            '',
        'Schedule a maintenance period.' => '',
        'Screen' => 'Skjerm',
        'Search Customer' => 'Kunde-søk',
        'Search Ticket.' => '',
        'Search Tickets.' => '',
        'Search User' => 'Søk etter bruker',
        'Search backend default router.' => '',
        'Search backend router.' => '',
        'Search.' => '',
        'Second Queue' => '',
        'Select after which period ticket overviews should refresh automatically.' =>
            '',
        'Select how many tickets should be shown in overviews by default.' =>
            '',
        'Select the main interface language.' => '',
        'Select your frontend Theme.' => 'Velg tema for webvisningen.',
        'Select your preferred layout for OTRS.' => '',
        'Selects the cache backend to use.' => '',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            '',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            '',
        'Send new outgoing mail from this ticket' => '',
        'Send notifications to users.' => 'Send varsling til brukerne',
        'Sender type for new tickets from the customer inteface.' => 'Sendingstype for nye meldinger på kundeweben',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            'Send varsling kun til sakens eier dersom en sak låses opp (normalt sendes meldingen til alle saksbehandlere).',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            'Send all utgående e-post via Bcc til spesifisert adresse. Vennligst bruk dette kun for sikkerhetskopiering.',
        'Sends customer notifications just to the mapped customer.' => '',
        'Sends registration information to OTRS group.' => '',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            'Sender en påminnelse om opplåsing av saker etter oppnådd tidsfrist (sendes kun til sakens eier).',
        'Sends the notifications which are configured in the admin interface under "Notfication (Event)".' =>
            'Sender varslingene som er spesifiserte i admin-delen under "Melding (Hendelse)"',
        'Serbian Cyrillic' => 'Serbisk (Cyrillic)',
        'Serbian Latin' => 'Serbisk (Latin)',
        'Service view' => 'Tjeneste visning',
        'ServiceView' => '',
        'Set a new password by filling in your current password and a new one.' =>
            '',
        'Set minimum loglevel. If you select \'error\', just errors are logged. With \'debug\' you get all logging messages.' =>
            '',
        'Set sender email addresses for this system.' => 'Sett opp avsenderadresse for denne installasjonen',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            '',
        'Set the limit of tickets that will be executed on a single genericagent job execution.' =>
            '',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            '',
        'Set this to yes if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            '',
        'Sets if SLA must be selected by the agent.' => '',
        'Sets if SLA must be selected by the customer.' => '',
        'Sets if note must be filled in by the agent. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Sets if service must be selected by the agent.' => '',
        'Sets if service must be selected by the customer.' => '',
        'Sets if ticket owner must be selected by the agent.' => 'Angir om sakseier må velges av saksbehandleren.',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            '',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            '',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            '',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            '',
        'Sets the count of articles visible in preview mode of ticket overviews.' =>
            '',
        'Sets the default article type for new email tickets in the agent interface.' =>
            '',
        'Sets the default article type for new phone tickets in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the default error message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            '',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            '',
        'Sets the default message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            '',
        'Sets the default message for the notification is shown on a running system maintenance period.' =>
            '',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            '',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            '',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            '',
        'Sets the default priority for new email tickets in the agent interface.' =>
            '',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            '',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            '',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the default text for new email tickets in the agent interface.' =>
            '',
        'Sets the display order of the different items in the preferences view.' =>
            '',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is logged out.' =>
            '',
        'Sets the maximum number of active agents within the timespan defined in SessionActiveTime before a prior warning will be visible for the logged in agents.' =>
            '',
        'Sets the maximum number of active agents within the timespan defined in SessionActiveTime.' =>
            '',
        'Sets the maximum number of active customers within the timespan defined in SessionActiveTime.' =>
            '',
        'Sets the maximum number of active sessions per agent within the timespan defined in SessionActiveTime.' =>
            '',
        'Sets the maximum number of active sessions per customers within the timespan defined in SessionActiveTime.' =>
            '',
        'Sets the minimal ticket counter size if "AutoIncrement" was selected as TicketNumberGenerator. Default is 5, this means the counter starts from 10000.' =>
            '',
        'Sets the minutes a notification is shown for notice about upcoming system maintenance period.' =>
            '',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            '',
        'Sets the options for PGP binary.' => '',
        'Sets the order of the different items in the customer preferences view.' =>
            '',
        'Sets the password for private PGP key.' => '',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            '',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            '',
        'Sets the queue in the ticket close screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket free text screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket note screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the queue in the ticket responsible screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the state of a ticket in the close ticket screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the ticket free text screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the ticket note screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the state of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the state of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the state of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the stats hook.' => '',
        'Sets the system time zone (required a system with UTC as system time). Otherwise this is a diff time to the local time.' =>
            '',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the time (in seconds) a user is marked as active (minimum active time is 300 seconds).' =>
            '',
        'Sets the timeout (in seconds) for http/ftp downloads.' => '',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            '',
        'Sets the user time zone per user (required a system with UTC as system time and UTC under TimeZone). Otherwise this is a diff time to the local time.' =>
            '',
        'Sets the user time zone per user based on java script / browser time zone offset feature at login time.' =>
            '',
        'Shared Secret' => '',
        'Should the cache data be held in memory?' => '',
        'Should the cache data be stored in the selected cache backend?' =>
            '',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            '',
        'Show article as rich text even if rich text writing is disabled.' =>
            '',
        'Show queues even when only locked tickets are in.' => '',
        'Show the current owner in the customer interface.' => '',
        'Show the current queue in the customer interface.' => '',
        'Show the history for this ticket' => '',
        'Shows a count of icons in the ticket zoom, if the article has attachments.' =>
            '',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.  Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to enroll a ticket into a process in the ticket zoom view of the agent interface.' =>
            '',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            '',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to see the customer who requested the ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to see the owner of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to see the responsible agent of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to send an outbound email in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to set a ticket as junk in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            '',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            '',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            '',
        'Shows a link to see a zoomed email ticket in plain text.' => '',
        'Shows a link to set a ticket as junk in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            '',
        'Shows a select of ticket attributes to order the queue view ticket list. The possible selections can be configured via \'TicketOverviewMenuSort###SortAttributes\'.' =>
            '',
        'Shows all both ro and rw queues in the queue view.' => '',
        'Shows all both ro and rw tickets in the service view.' => '',
        'Shows all open tickets (even if they are locked) in the escalation view of the agent interface.' =>
            'Viser alle åpne saker (også låste) i eskaleringsvinduet i agentdelen',
        'Shows all open tickets (even if they are locked) in the status view of the agent interface.' =>
            'Viser alle åpne saker (også låste) i statusvinduet i agentdelen',
        'Shows all the articles of the ticket (expanded) in the zoom view.' =>
            'Viser alle innlegg i saken (utvidet) i zoom-visning',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            'Viser alle kunde-identifikatorer i et multivalg-felt (ikke brukbart hvis du har mange identifikatorer)',
        'Shows all the customer user identifiers in a multi-select field (not useful if you have a lot of customer user identifiers).' =>
            '',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            'Viser et eier-valg i telefon- og e-post-saker i agentdelen',
        'Shows colors for different article types in the article table.' =>
            'Viser farger for ulike artikkeltyper i artikkeltabellen',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            'Viser kundehistorikk i agentdelen.',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            'Viser enten emnet til siste kundeartikkel eller sakens emne i "liten" oversikt.',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            'Viser eksisterende foredldre/barn kølister i systemet i form av et tre eller en liste',
        'Shows information on how to start OTRS Daemon' => 'Vis informasjon om hvordan starte OTRS Agenten',
        'Shows the activated ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            'Viser de aktiverte saksattributtene i kundeportalen (0 = Av og 1 = På)',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            'Viser artiklene sortert normalt eller reversert i saksvisning i agentdelen.',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            'Viser kundens brukerinformasjon (telefon og e-post) når man komponerer en sak',
        'Shows the customer user\'s info in the ticket zoom view.' => 'Viser kundebrukerens info i saksvisningen.',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.' =>
            'Viser Dagens Melding (MOTD) i agent-kontrollpanelet. "Gruppe" brukes til å begrense tilgang til innstikket (f.eks. Gruppe: admin;gruppe1;gruppe2). "Standard" betyr at innstikket er slått på som standard, hvis ikke må saksbehandleren selv slå det på under Innstillinger',
        'Shows the message of the day on login screen of the agent interface.' =>
            'Viser Dagens Melding på innloggingsskjermen til agentdelen',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            'Viser sakshistorikken (nyeste først) i agentdelen.',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            'Viser sakens prioritetsvalg i agentdelens skjerm for å avslutte saker',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            'Viser sakens prioritetsvalg i agentdelens skjerm for å flytte saker',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            'Viser sakens prioritetsvalg i agentdelens skjerm for å masseredigere saker.',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            'Viser sakens prioritetsvalg i agentdelens skjerm for fritekst.',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            'Viser sakens prioritetsvalg i agentdelens skjerm for notiser',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Viser sakens prioritetsvalg i agentdelens sakseier-skjerm i saksvisning',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows the title field in the ticket free text screen of the agent interface.' =>
            '',
        'Shows the title fields in the close ticket screen of the agent interface.' =>
            '',
        'Shows the title fields in the ticket note screen of the agent interface.' =>
            '',
        'Shows the title fields in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title fields in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows time in long format (days, hours, minutes), if set to "Yes"; or in short format (days, hours), if set to "No".' =>
            'Viser tiden i langt format (dager, timer, minutter) hvis satt til "ja", eller i kortformat (dager, timer) hvis satt til "nei"',
        'Shows time use complete description (days, hours, minutes), if set to "Yes"; or just first letter (d, h, m), if set to "No".' =>
            '',
        'Simple' => '',
        'Skin' => 'Webtema',
        'Slovak' => 'Slovakisk',
        'Slovenian' => 'Slovensk',
        'Software Package Manager.' => '',
        'SolutionDiffInMin' => '',
        'SolutionInMin' => '',
        'Some description!' => 'Noe beskrivelse!',
        'Some picture description!' => 'Noe bilde beskrivelse!',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            '',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the service view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the ServiceID for the key and 0 or 1 for value.' =>
            '',
        'Spam' => '',
        'Spam Assassin example setup. Ignores emails that are marked with SpamAssassin.' =>
            'Eksempeloppsett for SpamAssassin. Ignorerer e-poster som er merket av SpamAssassin.',
        'Spam Assassin example setup. Moves marked mails to spam queue.' =>
            'Eksempeloppsett for SpamAssassin. Flytter merkede e-poster til køen for søppelpost.',
        'Spanish' => 'Spansk',
        'Spanish (Colombia)' => 'Spansk (Kolombia)',
        'Spanish (Mexico)' => 'Spansk (Mexico)',
        'Spanish stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Specifies if an agent should receive email notification of his own actions.' =>
            'Angir om en agent skal motta e-postvarsling om sine egne handlinger.',
        'Specifies the available note types for this ticket mask. If the option is deselected, ArticleTypeDefault is used and the option is removed from the mask.' =>
            '',
        'Specifies the default article type for the ticket compose screen in the agent interface if the article type cannot be automatically detected.' =>
            '',
        'Specifies the different article types that will be used in the system.' =>
            'Spesifiserer de ulike artikkeltypene som skal brukes i systemet.',
        'Specifies the different note types that will be used in the system.' =>
            'Spesifiserer de forskjellige notis-typene som skal brukes i systemet.',
        'Specifies the directory to store the data in, if "FS" was selected for TicketStorageModule.' =>
            'Spesifiserer mappen der data skal lagres dersom "FS" er valgt for lagring av saker.',
        'Specifies the directory where SSL certificates are stored.' => 'Spesifiserer mappen der SSL-sertifikatene lagres',
        'Specifies the directory where private SSL certificates are stored.' =>
            'Spesifiserer mappen der private SSL-sertifikater lagres.',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "OTRS Notifications" otrs@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address.' =>
            '',
        'Specifies the email addresses to get notification messages from scheduler tasks.' =>
            '',
        'Specifies the group where the user needs rw permissions so that he can access the "SwitchToCustomer" feature.' =>
            '',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "OTRS Notifications" otrs@your.example.com).' =>
            '',
        'Specifies the order in which the firstname and the lastname of agents will be displayed.' =>
            '',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png, 700 x 100 pixel).' =>
            'Spesifiserer stien til logofilen i toppen av siden (gif|jpg|png, 700x100 piksler).',
        'Specifies the path of the file for the performance log.' => 'Spesifiserer stien til ytelseslogg-filen.',
        'Specifies the path to the converter that allows the view of Microsoft Excel files, in the web interface.' =>
            'Spesifiserer stien til konverteringsprogrammet som tillater visning av Microsoft Excel-filer i webvisningen',
        'Specifies the path to the converter that allows the view of Microsoft Word files, in the web interface.' =>
            'Spesifiserer stien til konverteringsprogrammet som tillater visning av Microsoft Word-filer i webvisningen',
        'Specifies the path to the converter that allows the view of PDF documents, in the web interface.' =>
            'Spesifiserer stien til konverteringsprogrammet som tillater visning av PDF-filer i webvisningen',
        'Specifies the path to the converter that allows the view of XML files, in the web interface.' =>
            'Spesifiserer stien til konverteringsprogrammet som tillater visning av XML-filer',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            'Spesifiserer teksten som skal skrives til loggfilen for å markere et innslag fra et CGI-script.',
        'Specifies user id of the postmaster data base.' => 'Spesifiserer bruker-id for postmaster-databasen',
        'Specifies whether all storage backends should be checked when looking for attachments. This is only required for installations where some attachments are in the file system, and others in the database.' =>
            '',
        'Specify how many sub directory levels to use when creating cache files. This should prevent too many cache files being in one directory.' =>
            '',
        'Specify the channel to be used to fetch OTRS Business Solution™ updates. Warning: Development releases might not be complete, your system might experience unrecoverable errors and on extreme cases could become unresponsive!' =>
            '',
        'Specify the password to authenticate for the first mirror database.' =>
            '',
        'Specify the username to authenticate for the first mirror database.' =>
            '',
        'Spell checker.' => '',
        'Stable' => '',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            'Standard tilgjengelige rettigheter for saksbehandlere i systemet. Hvis flere rettigheter trengs kan de skrives inn her. Noen andre fine rettigheter finnes også innebygde: note, close, pending, customer, freetext, move, compose, responsible, forward og bounce. Pass på at "rw" alltid er den siste i listen.',
        'Start number for statistics counting. Every new stat increments this number.' =>
            'Starttall for statistikktelling. Nye statistikker legger til på dette tallet.',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            '',
        'Stat#' => 'Stat#',
        'Status view' => 'Statusvisning',
        'Stores cookies after the browser has been closed.' => 'Lagrer informasjonskapsler (cookies) etter at nettleseren har blitt stengt.',
        'Strips empty lines on the ticket preview in the queue view.' => 'Tar vekk tomme linjer i saksvisningen i kølisten',
        'Strips empty lines on the ticket preview in the service view.' =>
            '',
        'Swahili' => 'Swahili',
        'Swedish' => 'Svensk',
        'System Address Display Name' => '',
        'System Maintenance' => 'Vedlikehold av systemet',
        'System Request (%s).' => 'Systemspørring (%s).',
        'Target' => '',
        'Templates <-> Queues' => 'Maler <-> Køer',
        'Textarea' => 'Tekstareale',
        'Thai' => 'Tailandsk',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            '',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            '',
        'The daemon registration for the scheduler cron task manager.' =>
            '',
        'The daemon registration for the scheduler future task manager.' =>
            '',
        'The daemon registration for the scheduler generic agent task manager.' =>
            '',
        'The daemon registration for the scheduler task worker.' => '',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            'Skilletegnet mellom TicketHook og saksnummeret, f.eks. ":"',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            '',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the latter case you should verify that the setting PostMaster::CheckFollowUpModule###0200-References is activated to recognize followups based on email headers.' =>
            '',
        'The headline shown in the customer interface.' => 'Overskriften som vises i kundeportalen',
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            'Identifikatoren for en sak, f.eks. Sak#, Ticket#, MinSak#. Standard er Ticket#',
        'The logo shown in the header of the agent interface for the skin "default". See "AgentLogo" for further description.' =>
            '',
        'The logo shown in the header of the agent interface for the skin "ivory". See "AgentLogo" for further description.' =>
            '',
        'The logo shown in the header of the agent interface for the skin "ivory-slim". See "AgentLogo" for further description.' =>
            '',
        'The logo shown in the header of the agent interface for the skin "slim". See "AgentLogo" for further description.' =>
            '',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The logo shown on top of the login box of the agent interface. The URL to the image must be relative URL to the skin image directory.' =>
            'Logoen som synes over innloggingsboksen i agentdelen. URLen må være relativ til image-mappen i den valgte temamappen.',
        'The maximal number of articles expanded on a single page in AgentTicketZoom.' =>
            '',
        'The maximal number of articles shown on a single page in AgentTicketZoom.' =>
            '',
        'The maximum number of mails fetched at once before reconnecting to the server.' =>
            '',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            'Teksten i begynnelsen av emnet på et e-post-svar, f.eks. RE, SV',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            'Teksten i begynnelsen av emnet på en e-post som er videresendt, f.eks. VS, FW',
        'This event module stores attributes from CustomerUser as DynamicFields tickets. Please see the setting above for how to configure the mapping.' =>
            '',
        'This is the default orange - black skin for the customer interface.' =>
            '',
        'This is the default orange - black skin.' => '',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            'Denne modulen og dens PreRun()-funksjon vil, hvis satt, bli kjørt ved hver forespørsel. Denne modulen er nyttig for å sjekke brukerinnstillinger eller for å vise nyheter om nye programmer el.l.',
        'This module is part of the admin area of OTRS.' => '',
        'This option defines the dynamic field in which a Process Management activity entity id is stored.' =>
            '',
        'This option defines the dynamic field in which a Process Management process entity id is stored.' =>
            '',
        'This option defines the process tickets default lock.' => '',
        'This option defines the process tickets default priority.' => '',
        'This option defines the process tickets default queue.' => '',
        'This option defines the process tickets default state.' => '',
        'This option will deny the access to customer company tickets, which are not created by the customer user.' =>
            '',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            '',
        'This will allow the system to send text messages via SMS.' => '',
        'Ticket Close.' => '',
        'Ticket Compose Bounce Email.' => '',
        'Ticket Compose email Answer.' => '',
        'Ticket Customer.' => '',
        'Ticket Forward Email.' => '',
        'Ticket FreeText.' => '',
        'Ticket History.' => '',
        'Ticket Lock.' => '',
        'Ticket Merge.' => '',
        'Ticket Move.' => '',
        'Ticket Note.' => '',
        'Ticket Notifications' => '',
        'Ticket Outbound Email.' => '',
        'Ticket Owner.' => '',
        'Ticket Pending.' => '',
        'Ticket Print.' => '',
        'Ticket Priority.' => '',
        'Ticket Queue Overview' => '',
        'Ticket Responsible.' => '',
        'Ticket Watcher' => '',
        'Ticket Zoom.' => '',
        'Ticket bulk module.' => '',
        'Ticket event module that triggers the escalation stop events.' =>
            '',
        'Ticket moved into Queue "%s" (%s) from Queue "%s" (%s).' => 'Sak flyttet inn i køen «%s» (%s) fra kø «%s» (%s).',
        'Ticket notifications' => 'Sak varslinger',
        'Ticket overview' => 'Saksoversikt',
        'Ticket plain view of an email.' => '',
        'Ticket title' => '',
        'Ticket zoom view.' => '',
        'TicketNumber' => 'Ticketnummer',
        'Tickets.' => '',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            '',
        'Title updated: Old: "%s", New: "%s"' => 'Tittel oppdatert: Gammel: "%s", Ny: "%s"',
        'To accept login information, such as an EULA or license.' => '',
        'To download attachments.' => '',
        'Toggles display of OTRS FeatureAddons list in PackageManager.' =>
            '',
        'Toolbar Item for a shortcut. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Transport selection for ticket notifications.' => '',
        'Tree view' => '',
        'Triggers ticket escalation events and notification events for escalation.' =>
            '',
        'Turkish' => 'Tyrkisk',
        'Turns off SSL certificate validation, for example if you use a transparent HTTPS proxy. Use at your own risk!' =>
            '',
        'Turns on drag and drop for the main navigation.' => '',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            '',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            '',
        'Ukrainian' => 'Ukrainsk',
        'Unlock tickets that are past their unlock timeout.' => '',
        'Unlock tickets whenever a note is added and the owner is out of office.' =>
            '',
        'Unlocked ticket.' => 'Sak gjort tilgjengelig.',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            '',
        'Updated SLA to %s (ID=%s).' => 'Endret SLA til «%s» (ID=%s).',
        'Updated Service to %s (ID=%s).' => 'Endret tjeneste til «%s» (ID=%s).',
        'Updated Type to %s (ID=%s).' => 'Endret type til %s (ID=%s).',
        'Updated: %s' => 'Sett på vent til: %s',
        'Updated: %s=%s;%s=%s;%s=%s;' => 'Stikkord oppdatert: %s=%s;%s=%s;%s=%s;',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            '',
        'Updates the ticket index accelerator.' => '',
        'Use new type of select and autocomplete fields in agent interface, where applicable (InputFields).' =>
            '',
        'Use new type of select and autocomplete fields in customer interface, where applicable (InputFields).' =>
            '',
        'UserFirstname' => 'Brukers-fornavn',
        'UserLastname' => 'Brukers-etternavn',
        'Uses Cc recipients in reply Cc list on compose an email answer in the ticket compose screen of the agent interface.' =>
            '',
        'Uses richtext for viewing and editing ticket notification.' => '',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard templates, auto responses and notifications.' =>
            '',
        'Vietnam' => 'Vietnam',
        'View performance benchmark results.' => 'Vis resultater etter ytelsesmålinger',
        'Watch this ticket' => 'Overvåk denne saken',
        'Watched Tickets.' => '',
        'We are performing scheduled maintenance.' => 'Vi utfører et planlagt vedlikehold.',
        'We are performing scheduled maintenance. Login is temporarily not available.' =>
            'Vi utfører et planlagt vedlikehold. Innlogging er for øyeblikket ikke tilgjengelig.',
        'We are performing scheduled maintenance. We should be back online shortly.' =>
            'Vi utfører et planlagt vedlikehold. Sidene vil være tilgjengelig om ikke så lat for lenge.',
        'Web View' => '',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the body of this note (this text cannot be changed by the agent).' =>
            '',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the subject of this note (this subject cannot be changed by the agent).' =>
            '',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            '',
        'Whether or not to collect meta information from articles using filters configured in Ticket::Frontend::ZoomCollectMetaFilters.' =>
            '',
        'Yes, but hide archived tickets' => 'Ja, men skjul de arkiverte sakene',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            '',
        'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.' =>
            '',
        'Your service selection of your preferred services. You also get notified about those services via email if enabled.' =>
            '',
        'attachment' => '',
        'bounce' => '',
        'compose' => '',
        'debug' => '',
        'error' => '',
        'forward' => '',
        'info' => '',
        'inline' => '',
        'notice' => '',
        'pending' => '',
        'responsible' => '',
        'stats' => '',

    };
    # $$STOP$$
    return;
}

1;
