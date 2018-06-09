# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# Copyright (C) 2010 Thomas Kaltenbrunner <tkaltenbrunner at opc.de>
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
package Kernel::Language::de;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # $$START$$
    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D.%M.%Y %T';
    $Self->{DateFormatLong}      = '%T - %D.%M.%Y';
    $Self->{DateFormatShort}     = '%D.%M.%Y';
    $Self->{DateInputFormat}     = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';
    $Self->{Completeness}        = 0.959951209595446;

    # csv separator
    $Self->{Separator} = ';';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Ja',
        'No' => 'Nein',
        'yes' => 'ja',
        'no' => 'nein',
        'Off' => 'Aus',
        'off' => 'aus',
        'On' => 'Ein',
        'on' => 'ein',
        'top' => 'hoch',
        'end' => 'runter',
        'Done' => 'Fertig',
        'Cancel' => 'Abbrechen',
        'Reset' => 'Zurücksetzen',
        'more than ... ago' => 'vor mehr als ...',
        'in more than ...' => 'in mehr als ...',
        'within the last ...' => 'innerhalb der letzten ...',
        'within the next ...' => 'innerhalb der kommenden ...',
        'Created within the last' => 'Erstellt innerhalb der letzten',
        'Created more than ... ago' => 'Erstellt vor mehr als ...',
        'Today' => 'Heute',
        'Tomorrow' => 'Morgen',
        'Next week' => 'Nächste Woche',
        'day' => 'Tag',
        'days' => 'Tage',
        'day(s)' => 'Tag(e)',
        'd' => 'd',
        'hour' => 'Stunde',
        'hours' => 'Stunden',
        'hour(s)' => 'Stunde(n)',
        'Hours' => 'Stunden',
        'h' => 'h',
        'minute' => 'Minute',
        'minutes' => 'Minuten',
        'minute(s)' => 'Minute(n)',
        'Minutes' => 'Minuten',
        'm' => 'm',
        'month' => 'Monat',
        'months' => 'Monate',
        'month(s)' => 'Monat(e)',
        'week' => 'Woche',
        'week(s)' => 'Woche(n)',
        'quarter' => 'Quartal',
        'quarter(s)' => 'Quartal(e)',
        'half-year' => 'Halbjahr',
        'half-year(s)' => 'Halbjahr(e)',
        'year' => 'Jahr',
        'years' => 'Jahre',
        'year(s)' => 'Jahr(e)',
        'second(s)' => 'Sekunde(n)',
        'seconds' => 'Sekunden',
        'second' => 'Sekunde',
        's' => 's',
        'Time unit' => 'Zeiteinheit',
        'wrote' => 'schrieb',
        'Message' => 'Nachricht',
        'Error' => 'Fehler',
        'Bug Report' => 'Fehlerbericht',
        'Attention' => 'Achtung',
        'Warning' => 'Warnung',
        'Module' => 'Modul',
        'Modulefile' => 'Moduldatei',
        'Subfunction' => 'Unterfunktion',
        'Line' => 'Zeile',
        'Setting' => 'Einstellung',
        'Settings' => 'Einstellungen',
        'Example' => 'Beispiel',
        'Examples' => 'Beispiele',
        'valid' => 'gültig',
        'Valid' => 'Gültig',
        'invalid' => 'ungültig',
        'Invalid' => 'Ungültig',
        '* invalid' => '* ungültig',
        'invalid-temporarily' => 'ungültig-temporär',
        ' 2 minutes' => ' 2 Minuten',
        ' 5 minutes' => ' 5 Minuten',
        ' 7 minutes' => ' 7 Minuten',
        '10 minutes' => '10 Minuten',
        '15 minutes' => '15 Minuten',
        'Mr.' => 'Herr',
        'Mrs.' => 'Frau',
        'Next' => 'Weiter',
        'Back' => 'Zurück',
        'Next...' => 'Weiter...',
        '...Back' => '...Zurück',
        '-none-' => '-keine-',
        'none' => 'keine',
        'none!' => 'keine Angabe!',
        'none - answered' => 'keine - beantwortet',
        'please do not edit!' => 'Bitte nicht ändern!',
        'Need Action' => 'Aktion nötig',
        'AddLink' => 'Verknüpfung hinzufügen',
        'Link' => 'Verknüpfen',
        'Unlink' => 'Verknüpft aufheben',
        'Linked' => 'Verknüpft',
        'Link (Normal)' => 'Verknüpft (Normal)',
        'Link (Parent)' => 'Verknüpft (Eltern)',
        'Link (Child)' => 'Verknüpft (Kinder)',
        'Normal' => 'Normal',
        'Parent' => 'Eltern',
        'Child' => 'Kinder',
        'Hit' => 'Treffer',
        'Hits' => 'Treffer',
        'Text' => 'Text',
        'Standard' => 'Standard',
        'Lite' => 'Einfach',
        'User' => 'Benutzer',
        'Username' => 'Benutzername',
        'Language' => 'Sprache',
        'Languages' => 'Sprachen',
        'Password' => 'Passwort',
        'Preferences' => 'Einstellungen',
        'Salutation' => 'Anrede',
        'Salutations' => 'Anreden',
        'Signature' => 'Signatur',
        'Signatures' => 'Signaturen',
        'Customer' => 'Kunde',
        'CustomerID' => 'Kundennummer',
        'CustomerIDs' => 'Kundennummern',
        'customer' => 'Kunde',
        'agent' => 'Agent',
        'system' => 'System',
        'Customer Info' => 'Kundeninformation',
        'Customer Information' => 'Kundeninformation',
        'Customer Companies' => 'Kunden',
        'Company' => 'Firma',
        'go!' => 'Start!',
        'go' => 'Start',
        'All' => 'Alle',
        'all' => 'alle',
        'Sorry' => 'Entschuldigung',
        'update!' => 'Aktualisieren!',
        'update' => 'Aktualisieren',
        'Update' => 'Aktualisieren',
        'Updated!' => 'Aktualisiert!',
        'submit!' => 'Übermitteln!',
        'submit' => 'Übermitteln',
        'Submit' => 'Übermitteln',
        'change!' => 'Ändern!',
        'Change' => 'Ändern',
        'change' => 'Ändern',
        'click here' => 'hier klicken',
        'Comment' => 'Kommentar',
        'Invalid Option!' => 'Ungültige Option!',
        'Invalid time!' => 'Ungültige Zeitangabe!',
        'Invalid date!' => 'Ungültige Zeitangabe!',
        'Name' => 'Name',
        'Group' => 'Gruppe',
        'Description' => 'Beschreibung',
        'description' => 'Beschreibung',
        'Theme' => 'Schema',
        'Created' => 'Erstellt',
        'Created by' => 'Erstellt von',
        'Changed' => 'Geändert',
        'Changed by' => 'Geändert von',
        'Search' => 'Suche',
        'and' => 'und',
        'between' => 'zwischen',
        'before/after' => 'vor/nach',
        'Fulltext Search' => 'Volltextsuche',
        'Data' => 'Daten',
        'Options' => 'Optionen',
        'Title' => 'Titel',
        'Item' => 'Eintrag',
        'Delete' => 'Löschen',
        'Edit' => 'Bearbeiten',
        'View' => 'Ansehen',
        'Number' => 'Nummer',
        'System' => 'System',
        'Contact' => 'Kontakt',
        'Contacts' => 'Kontakte',
        'Export' => 'Export',
        'Up' => 'Auf',
        'Down' => 'Ab',
        'Add' => 'Hinzufügen',
        'Added!' => 'Hinzugefügt!',
        'Category' => 'Kategorie',
        'Viewer' => 'Betrachter',
        'Expand' => 'Ausklappen',
        'Small' => 'Klein',
        'Medium' => 'Mittel',
        'Large' => 'Groß',
        'Date picker' => 'Datumsauswahl',
        'Show Tree Selection' => 'Baumauswahl anzeigen',
        'The field content is too long!' => 'Der Feldinhalt ist zu lang!',
        'Maximum size is %s characters.' => 'Die Maximallänge beträgt %s Zeichen.',
        'This field is required or' => 'Dieses Feld ist ein Pflichtfeld oder',
        'New message' => 'Neue Nachricht',
        'New message!' => 'Neue Nachricht!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Bitte beantworten Sie diese Ticket(s), um in die normale Queue-Ansicht zurück zu kommen!',
        'You have %s new message(s)!' => 'Sie haben %s neue Nachricht(en) bekommen!',
        'You have %s reminder ticket(s)!' => 'Sie haben %s Erinnerungs-Ticket(s)!',
        'The recommended charset for your language is %s!' => 'Der empfohlene Zeichensatz für Ihre Sprache ist %s!',
        'Change your password.' => 'Passwort ändern.',
        'Please activate %s first!' => 'Bitte %s zuerst aktivieren.',
        'No suggestions' => 'Keine Vorschläge',
        'Word' => 'Wort',
        'Ignore' => 'Ignorieren',
        'replace with' => 'ersetzen mit',
        'There is no account with that login name.' => 'Es existiert kein Benutzerkonto mit diesem Namen.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            'Anmeldung fehlgeschlagen! Benutzername oder Passwort wurden falsch eingegeben.',
        'There is no acount with that user name.' => 'Es gibt kein Benutzerkonto mit diesem Benutzernamen.',
        'Please contact your administrator' => 'Bitte kontaktieren Sie Ihren Administrator',
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact your administrator.' =>
            'Authentifizierung erfolgreich, aber im Kunden-Backend wurde kein Kunden-Eintrag gefunden. Bitte kontaktieren Sie Ihren Administrator.',
        'This e-mail address already exists. Please log in or reset your password.' =>
            'Diese E-Mail-Adresse existiert bereits. Bitte melden Sie sich an oder setzen Ihr Passwort zurück.',
        'Logout' => 'Abmelden',
        'Logout successful. Thank you for using %s!' => 'Abmeldung erfolgreich! Danke, dass Sie %s verwenden.',
        'Feature not active!' => 'Funktion nicht aktiviert!',
        'Agent updated!' => 'Agent aktualisiert!',
        'Database Selection' => 'Datenbank-Auswahl',
        'Create Database' => 'Datenbank erstellen',
        'System Settings' => 'System-Einstellungen',
        'Mail Configuration' => 'Mail-Konfiguration',
        'Finished' => 'Fertig',
        'Install OTRS' => 'OTRS installieren',
        'Intro' => 'Einführung',
        'License' => 'Lizenz',
        'Database' => 'Datenbank',
        'Configure Mail' => 'E-Mail konfigurieren',
        'Database deleted.' => 'Datenbank gelöscht.',
        'Enter the password for the administrative database user.' => 'Geben Sie das Passwort für den Administrationsbenutzer der Datenbank ein.',
        'Enter the password for the database user.' => 'Geben Sie das Passwort für den Datenbankbenutzer ein.',
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty.' =>
            'Sollte ein Root-Passwort für die Datenbank gesetzt sein, muss dieses hier angegeben werden. Anderenfalls muss dieses Feld leer bleiben.',
        'Database already contains data - it should be empty!' => 'Die Datenbank enthält bereits Daten, obwohl sie leer sein sollte!',
        'Login is needed!' => 'Login wird benötigt!',
        'It is currently not possible to login due to a scheduled system maintenance.' =>
            'Die Anmeldung ist derzeit aufgrund einer geplanten Systemwartung nicht verfügbar.',
        'Password is needed!' => 'Passwort wird benötigt!',
        'Take this Customer' => 'Kunden übernehmen',
        'Take this User' => 'Benutzer übernehmen',
        'possible' => 'möglich',
        'reject' => 'ablehnen',
        'reverse' => 'umgekehrt',
        'Facility' => 'Einrichtung',
        'Time Zone' => 'Zeitzone',
        'Pending till' => 'Warten bis',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            'Bitte nicht mit dem Superuser-Account in OTRS arbeiten! Bitte legen Sie neue Agenten an und nutzen Sie diese!',
        'Dispatching by email To: field.' => 'Verteilung nach To: Feld.',
        'Dispatching by selected Queue.' => 'Verteilung nach ausgewählter Queue.',
        'No entry found!' => 'Kein Eintrag gefunden!',
        'Session invalid. Please log in again.' => 'Session ungültig. Bitte neu anmelden.',
        'Session has timed out. Please log in again.' => 'Session abgelaufen. Bitte neu anmelden.',
        'Session limit reached! Please try again later.' => 'Maximale Anzahl an Sessions erreicht. Bitte versuchen Sie es später noch einmal.',
        'No Permission!' => 'Keine Zugriffsrechte!',
        '(Click here to add)' => '(Hier klicken um hinzuzufügen)',
        'Preview' => 'Vorschau',
        'Package not correctly deployed! Please reinstall the package.' =>
            'Paket nicht korrekt installiert. Bitte erneut installieren.',
        '%s is not writable!' => '%s kann nicht geschrieben werden!',
        'Cannot create %s!' => '%s kann nicht erzeugt werden!',
        'Check to activate this date' => 'Auswählen, um dieses Datum zu aktivieren',
        'You have Out of Office enabled, would you like to disable it?' =>
            'Sie haben die Abwesenheitszeit eingeschaltet, möchten Sie diese deaktivieren?',
        'News about OTRS releases!' => 'Neuigkeiten zu OTRS-Releases!',
        'Go to dashboard!' => 'Zur Übersicht gehen!',
        'Customer %s added' => 'Kunde %s hinzugefügt',
        'Role added!' => 'Rolle hinzugefügt!',
        'Role updated!' => 'Rolle aktualisiert!',
        'Attachment added!' => 'Anlage hinzugefügt!',
        'Attachment updated!' => 'Anlage aktualisiert!',
        'Response added!' => 'Antwort hinzugefügt!',
        'Response updated!' => 'Antwort aktualisiert!',
        'Group updated!' => 'Gruppe aktualisiert',
        'Queue added!' => 'Queue hinzugefügt!',
        'Queue updated!' => 'Queue aktualisiert!',
        'State added!' => 'Status hinzugefügt!',
        'State updated!' => 'Status aktualisiert!',
        'Type added!' => 'Typ hinzugefügt!',
        'Type updated!' => 'Typ aktualisiert!',
        'Customer updated!' => 'Kunde aktualisiert!',
        'Customer company added!' => 'Kundenfirma hinzugefügt!',
        'Customer company updated!' => 'Kundenfirma aktualisiert!',
        'Note: Company is invalid!' => 'Hinweis: Firma ist ungültig!',
        'Mail account added!' => 'E-Mail-Konto hinzugefügt!',
        'Mail account updated!' => 'E-Mail-Konto aktualisiert!',
        'System e-mail address added!' => 'E-Mail-Adresse hinzugefügt!',
        'System e-mail address updated!' => 'E-Mail-Adresse aktualisiert!',
        'Contract' => 'Vertrag',
        'Online Customer: %s' => 'Online-Kunde: %s',
        'Online Agent: %s' => 'Online-Agent: %s',
        'Calendar' => 'Kalender',
        'File' => 'Datei',
        'Filename' => 'Dateiname',
        'Type' => 'Typ',
        'Size' => 'Größe',
        'Upload' => 'Hochladen',
        'Directory' => 'Verzeichnis',
        'Signed' => 'Signiert',
        'Sign' => 'Signieren',
        'Crypted' => 'Verschlüsselt',
        'Crypt' => 'Verschlüsseln',
        'PGP' => 'PGP',
        'PGP Key' => 'PGP-Schlüssel',
        'PGP Keys' => 'PGP-Schlüssel',
        'S/MIME' => 'S/MIME',
        'S/MIME Certificate' => 'S/MIME-Zertifikat',
        'S/MIME Certificates' => 'S/MIME-Zertifikate',
        'Office' => 'Büro',
        'Phone' => 'Telefon',
        'Fax' => 'Fax',
        'Mobile' => 'Mobiltelefon',
        'Zip' => 'PLZ',
        'City' => 'Stadt',
        'Street' => 'Straße',
        'Country' => 'Land',
        'Location' => 'Standort',
        'installed' => 'installiert',
        'uninstalled' => 'nicht installiert',
        'Security Note: You should activate %s because application is already running!' =>
            'Sicherheitshinweis: Sie sollten den %s aktivieren, da die Anwendung bereits in Betrieb ist!',
        'Unable to parse repository index document.' => 'Das Indexdokument des Verzeichnisses kann nicht gelesen werden.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'Keine Pakete für Ihre Framework-Version in diesem Verzeichnis gefunden, es enthält nur Pakete für andere Framework-Versionen.',
        'No packages, or no new packages, found in selected repository.' =>
            'Keine oder keine neuen Pakete im ausgewählten Verzeichnis gefunden.',
        'Edit the system configuration settings.' => 'Systemeinstellungen bearbeiten.',
        'ACL information from database is not in sync with the system configuration, please deploy all ACLs.' =>
            'Die ACL-Konfiguration ist laut Datenbank nicht synchron mit der System-Konfiguration, bitte ACLs in Betrieb nehmen.',
        'printed at' => 'gedruckt am',
        'Loading...' => 'Laden...',
        'Dear Mr. %s,' => 'Sehr geehrter Herr %s,',
        'Dear Mrs. %s,' => 'Sehr geehrte Frau %s,',
        'Dear %s,' => 'Lieber %s,',
        'Hello %s,' => 'Hallo %s,',
        'This email address is not allowed to register. Please contact support staff.' =>
            'Diese E-Mail-Adresse darf nicht registriert werden. Bitte wenden Sie sich an die Supportabteilung.',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Neues Benutzerkonto angelegt. Anmeldedaten wurden an %s gesendet. Bitte prüfen Sie Ihre E-Mail.',
        'Please press Back and try again.' => 'Bitte auf Zurück klicken und erneut versuchen.',
        'Sent password reset instructions. Please check your email.' => 'Anweisungen zum Zurücksetzen des Passworts wurden gesendet. Bitte prüfen Sie ihre E-Mail.',
        'Sent new password to %s. Please check your email.' => 'Neues Passwort an %s gesendet. Bitte prüfen Sie Ihre E-Mail.',
        'Upcoming Events' => 'Anstehende Ereignisse',
        'Event' => 'Ereignis',
        'Events' => 'Ereignisse',
        'Invalid Token!' => 'Ungültiger Token!',
        'more' => 'mehr',
        'Collapse' => 'Zuklappen',
        'Shown' => 'Angezeigt',
        'Shown customer users' => 'Angezeigte Kundenbenutzer',
        'News' => 'Neues',
        'Product News' => 'Produkt-Neuigkeiten',
        'OTRS News' => 'OTRS-Neuigkeiten',
        '7 Day Stats' => '7-Tage-Statistik',
        'Process Management information from database is not in sync with the system configuration, please synchronize all processes.' =>
            'Die Konfiguration des Prozessmanagements in der Datenbank ist nicht synchron mit der Systemkonfiguration, bitte synchronisieren Sie alle Prozesse.',
        'Package not verified by the OTRS Group! It is recommended not to use this package.' =>
            'Paket wurde nicht von der OTRS-Gruppe verifiziert! Es wird empfohlen, dieses Paket nicht zu nutzen.',
        '<br>If you continue to install this package, the following issues may occur!<br><br>&nbsp;-Security problems<br>&nbsp;-Stability problems<br>&nbsp;-Performance problems<br><br>Please note that issues that are caused by working with this package are not covered by OTRS service contracts!<br><br>' =>
            '<br>Wenn Sie die Installation dieses Pakets fortführen, können folgende Probleme auftreten!<br><br>&nbsp;-Sicherheitsprobleme<br>&nbsp;-Stabilitätsprobleme<br>&nbsp;-Performanceprobleme<br><br>Bitte beachten Sie, dass Probleme im Zusammenhang mit diesem Paket nicht durch einen OTRS Servicevertrag abgedeckt sind!<br><br>',
        'Mark' => 'Markieren',
        'Unmark' => 'Markierung entfernen',
        'Bold' => 'Fett',
        'Italic' => 'Kursiv',
        'Underline' => 'Unterstreichen',
        'Font Color' => 'Schriftfarbe',
        'Background Color' => 'Hintergrundfarbe',
        'Remove Formatting' => 'Formatierung entfernen',
        'Show/Hide Hidden Elements' => 'Versteckte Elemente anzeigen/verstecken',
        'Align Left' => 'Ausrichtung linksbündig',
        'Align Center' => 'Ausrichtung zentriert',
        'Align Right' => 'Ausrichtung rechtsbündig',
        'Justify' => 'Blocksatz',
        'Header' => 'Überschrift',
        'Indent' => 'Einzug erhöhen',
        'Outdent' => 'Einzug vermindern',
        'Create an Unordered List' => 'Aufzählungsliste erstellen',
        'Create an Ordered List' => 'Nummerierte Liste erstellen',
        'HTML Link' => 'HTML-Verknüpfung',
        'Insert Image' => 'Bild einfügen',
        'CTRL' => 'STRG',
        'SHIFT' => 'Umschalt',
        'Undo' => 'Rückgängig',
        'Redo' => 'Wiederholen',
        'OTRS Daemon is not running.' => 'Der OTRS Daemon läuft nicht.',
        'Can\'t contact registration server. Please try again later.' => 'Registrierungs-Server konnte nicht erreicht werden. Bitte versuchen Sie es später noch einmal.',
        'No content received from registration server. Please try again later.' =>
            'Registrierungs-Server lieferte keinen Inhalt. Bitte versuchen Sie es später noch einmal.',
        'Problems processing server result. Please try again later.' => 'Beim Verarbeiten der Serverantwort ist ein Fehler aufgetreten. Bitte versuchen Sie es später noch einmal.',
        'Username and password do not match. Please try again.' => 'Benutzername und Passwort stimmen nicht überein. Bitte versuchen Sie es noch einmal.',
        'The selected process is invalid!' => 'Der ausgewählte Prozess ist ungültig.',
        'Upgrade to %s now!' => 'Jetzt auf %s upgraden!',
        '%s Go to the upgrade center %s' => '%s Zum Upgrade-Center wechseln %s',
        'The license for your %s is about to expire. Please make contact with %s to renew your contract!' =>
            'Die Nutzungsvereinbarung für Ihre %s läuft in Kürze aus. Bitte kontaktieren Sie %s, um Ihren Vertrag zu erneuern!',
        'An update for your %s is available, but there is a conflict with your framework version! Please update your framework first!' =>
            'Es ist ein Update für Ihre %s verfügbar, jedoch ist die verwendete Version des Frameworks nicht auf dem aktuellen Stand! Bitte aktualisieren Sie zuerst das Framework und installieren im Anschluss das Update!  ',
        'Your system was successfully upgraded to %s.' => 'Ihr System wurde erfolgreich auf die %s erweitert.',
        'There was a problem during the upgrade to %s.' => 'Es gab ein Problem während des Upgrade-Prozesses auf die %s.',
        '%s was correctly reinstalled.' => 'Ihre %s wurde korrekt re-installiert.',
        'There was a problem reinstalling %s.' => 'Es gab ein Problem beim Re-Installieren Ihrer %s.',
        'Your %s was successfully updated.' => 'Ihre %s wurde erfolgreich aktualisiert.',
        'There was a problem during the upgrade of %s.' => 'Es gab ein Problem bei der Aktualisierung Ihrer %s.',
        '%s was correctly uninstalled.' => 'Die %s wurde korrekt de-installiert.',
        'There was a problem uninstalling %s.' => 'Es gab ein Problem beim De-Installieren der %s.',
        'Enable cloud services to unleash all OTRS features!' => 'Aktivieren Sie die Cloud Services, um alle OTRS-Funktionen nutzen zu können!',

        # Template: AAACalendar
        'New Year\'s Day' => 'Neujahr',
        'International Workers\' Day' => 'Tag der Arbeit',
        'Christmas Eve' => 'Heiligabend',
        'First Christmas Day' => '1. Weihnachtstag',
        'Second Christmas Day' => '2. Weihachtstag',
        'New Year\'s Eve' => 'Silvester',

        # Template: AAAGenericInterface
        'OTRS as requester' => 'OTRS als Requester',
        'OTRS as provider' => 'OTRS als Provider',
        'Webservice "%s" created!' => 'Webservice "%s" erstellt!',
        'Webservice "%s" updated!' => 'Webservice "%s" aktualisiert!',

        # Template: AAAMonth
        'Jan' => 'Jan',
        'Feb' => 'Feb',
        'Mar' => 'Mär',
        'Apr' => 'Apr',
        'May' => 'Mai',
        'Jun' => 'Jun',
        'Jul' => 'Jul',
        'Aug' => 'Aug',
        'Sep' => 'Sep',
        'Oct' => 'Okt',
        'Nov' => 'Nov',
        'Dec' => 'Dez',
        'January' => 'Januar',
        'February' => 'Februar',
        'March' => 'März',
        'April' => 'April',
        'May_long' => 'Mai',
        'June' => 'Juni',
        'July' => 'Juli',
        'August' => 'August',
        'September' => 'September',
        'October' => 'Oktober',
        'November' => 'November',
        'December' => 'Dezember',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'Benutzereinstellungen erfolgreich aktualisiert!',
        'User Profile' => 'Benutzer-Profil',
        'Email Settings' => 'E-Mail-Einstellungen',
        'Other Settings' => 'Andere Einstellungen',
        'Notification Settings' => 'Benachrichtigungseinstellungen',
        'Change Password' => 'Passwort ändern',
        'Current password' => 'Aktuelles Passwort',
        'New password' => 'Neues Passwort',
        'Verify password' => 'Passwort verifizieren',
        'Spelling Dictionary' => 'Rechtschreib-Wörterbuch',
        'Default spelling dictionary' => 'Standard-Rechtschreib-Wörterbuch',
        'Max. shown Tickets a page in Overview.' => 'Maximale Anzahl angezeigter Tickets pro Seite in der Übersicht.',
        'The current password is not correct. Please try again!' => 'Das eingegebene Passwort ist nicht korrekt. Bitte versuchen Sie es erneut!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Das Passwort kann nicht aktualisiert werden, da die Eingaben unterschiedlich sind. Bitte versuchen Sie es erneut!',
        'Can\'t update password, it contains invalid characters!' => 'Das Passwort kann nicht aktualisiert werden, da es unerlaubte Zeichen enthält.',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Das Passwort kann nicht aktualisiert werden. Es muss mindestens %s Zeichen lang sein.',
        'Can\'t update password, it must contain at least 2 lowercase and 2 uppercase characters!' =>
            'Das Passwort kann nicht aktualisiert werden. Es muss mindestens 2 Groß- und 2 Kleinbuchstaben enthalten.',
        'Can\'t update password, it must contain at least 1 digit!' => 'Das Passwort kann nicht aktualisiert werden. Es muss mindestens eine Ziffer enthalten.',
        'Can\'t update password, it must contain at least 2 characters!' =>
            'Das Passwort kann nicht aktualisiert werden. Es muss mindestens 2 Zeichen enthalten.',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            'Das Passwort kann nicht aktualisiert werden. Es wurde bereits benutzt. Bitte wählen Sie ein neues.',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Wählen Sie das Trennzeichen, dass in CSV-Dateien (Statistiken und Suchenergebnisse) benutzt werden soll. Wenn Sie hier kein Zeichen wählen, dann wird das Standard-Trennzeichen gemäß der eingestellten Sprache benutzt.',
        'CSV Separator' => 'Trennzeichen für CSV-Daten',

        # Template: AAATicket
        'Status View' => 'Ansicht nach Status',
        'Service View' => 'Ansicht nach Services',
        'Bulk' => 'Sammelaktion',
        'Lock' => 'Sperren',
        'Unlock' => 'Freigeben',
        'History' => 'Historie',
        'Zoom' => 'Inhalt',
        'Age' => 'Alter',
        'Bounce' => 'Umleiten',
        'Forward' => 'Weiterleiten',
        'From' => 'Von',
        'To' => 'An',
        'Cc' => 'Cc',
        'Bcc' => 'Bcc',
        'Subject' => 'Betreff',
        'Move' => 'Verschieben',
        'Queue' => 'Queue',
        'Queues' => 'Queues',
        'Priority' => 'Priorität',
        'Priorities' => 'Prioritäten',
        'Priority Update' => 'Änderung der Priorität',
        'Priority added!' => 'Priorität hinzugefügt!',
        'Priority updated!' => 'Priorität aktualisiert!',
        'Signature added!' => 'Signatur hinzugefügt!',
        'Signature updated!' => 'Signatur aktualisiert!',
        'SLA' => 'SLA',
        'Service Level Agreement' => 'Service-Level-Vereinbarung',
        'Service Level Agreements' => 'Service-Level-Vereinbarungen',
        'Service' => 'Service',
        'Services' => 'Services',
        'State' => 'Status',
        'States' => 'Status',
        'Status' => 'Status',
        'Statuses' => 'Status',
        'Ticket Type' => 'Ticket-Typ',
        'Ticket Types' => 'Ticket-Typen',
        'Compose' => 'Verfassen',
        'Pending' => 'Warten',
        'Owner' => 'Besitzer',
        'Owner Update' => 'Besitzer aktualisiert',
        'Responsible' => 'Verantwortlicher',
        'Responsible Update' => 'Verantwortlichen aktualisiert',
        'Sender' => 'Sender',
        'Article' => 'Artikel',
        'Ticket' => 'Ticket',
        'Createtime' => 'Erstellt am',
        'plain' => 'unformatiert',
        'Email' => 'E-Mail',
        'email' => 'E-Mail',
        'Close' => 'Schließen',
        'Action' => 'Aktion',
        'Attachment' => 'Anlage',
        'Attachments' => 'Anlagen',
        'This message was written in a character set other than your own.' =>
            'Diese Nachricht wurde in einem Zeichensatz erstellt, der nicht Ihrem eigenen entspricht.',
        'If it is not displayed correctly,' => 'Wenn sie nicht korrekt angezeigt wird,',
        'This is a' => 'Dies ist eine',
        'to open it in a new window.' => 'um sie in einem neuen Fenster angezeigt zu bekommen',
        'This is a HTML email. Click here to show it.' => 'Dies ist eine HTML-E-Mail. Hier klicken, um sie anzuzeigen.',
        'Free Fields' => 'Freie Felder',
        'Merge' => 'Zusammenfassen',
        'merged' => 'zusammengefasst',
        'closed successful' => 'erfolgreich geschlossen',
        'closed unsuccessful' => 'erfolglos geschlossen',
        'Locked Tickets Total' => 'Gesperrte Tickets insgesamt',
        'Locked Tickets Reminder Reached' => 'Gesperrte Tickets, Erinnerungszeit erreicht',
        'Locked Tickets New' => 'Neue gesperrte Tickets',
        'Responsible Tickets Total' => 'Verantwortliche Tickets insgesamt',
        'Responsible Tickets New' => 'Neue verantwortliche Tickets',
        'Responsible Tickets Reminder Reached' => 'Verantwortliche Tickets, Erinnerungszeit erreicht',
        'Watched Tickets Total' => 'Beobachtete Tickets insgesamt',
        'Watched Tickets New' => 'Neue beobachtete Tickets',
        'Watched Tickets Reminder Reached' => 'Beobachtete Tickets, Erinnerungszeit erreicht',
        'All tickets' => 'Alle Tickets',
        'Available tickets' => 'Verfügbare Tickets',
        'Escalation' => 'Eskalation',
        'last-search' => 'Letzte Suche',
        'QueueView' => 'Queue-Ansicht',
        'Ticket Escalation View' => 'Ansicht nach Ticket-Eskalationen',
        'Message from' => 'Nachricht von',
        'End message' => 'Ende der Nachricht',
        'Forwarded message from' => 'Weitergeleitete Nachricht von',
        'End forwarded message' => 'Ende der weitergeleiteten Nachricht',
        'Bounce Article to a different mail address' => 'Artikel per E-Mail umleiten',
        'Reply to note' => 'Auf Notiz antworten',
        'new' => 'neu',
        'open' => 'offen',
        'Open' => 'Offen',
        'Open tickets' => 'Offene Tickets',
        'closed' => 'geschlossen',
        'Closed' => 'Geschlossen',
        'Closed tickets' => 'Geschlossene Tickets',
        'removed' => 'entfernt',
        'pending reminder' => 'warten zur Erinnerung',
        'pending auto' => 'warten auf',
        'pending auto close+' => 'warten auf erfolgreich schließen',
        'pending auto close-' => 'warten auf erfolglos schließen',
        'email-external' => 'E-Mail extern',
        'email-internal' => 'E-Mail intern',
        'note-external' => 'Notiz extern',
        'note-internal' => 'Notiz intern',
        'note-report' => 'Notiz für Reporting',
        'phone' => 'Telefonanruf',
        'sms' => 'SMS',
        'webrequest' => 'Webanfrage',
        'lock' => 'gesperrt',
        'unlock' => 'frei',
        'very low' => 'sehr niedrig',
        'low' => 'niedrig',
        'normal' => 'normal',
        'high' => 'hoch',
        'very high' => 'sehr hoch',
        '1 very low' => '1 sehr niedrig',
        '2 low' => '2 niedrig',
        '3 normal' => '3 normal',
        '4 high' => '4 hoch',
        '5 very high' => '5 sehr hoch',
        'auto follow up' => 'automatische Rückfrage',
        'auto reject' => 'automatische Ablehnung',
        'auto remove' => 'automatisches Entfernen',
        'auto reply' => 'automatische Antwort',
        'auto reply/new ticket' => 'automatische Antwort / neues Ticket',
        'Create' => 'Erstellen',
        'Answer' => 'Beantworten',
        'Phone call' => 'Telefonanruf',
        'Ticket "%s" created!' => 'Ticket "%s" erstellt!',
        'Ticket Number' => 'Ticketnummer',
        'Ticket Object' => 'Ticket-Objekt',
        'No such Ticket Number "%s"! Can\'t link it!' => 'Ticketnummer "%s" nicht gefunden! Ticket konnte nicht verknüpft werden!',
        'You don\'t have write access to this ticket.' => 'Sie haben keinen Schreibzugriff auf dieses Ticket.',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'Entschuldigung, Sie müssen Ticketbesitzer sein, um diese Aktion ausführen zu können.',
        'Please change the owner first.' => 'Bitte ändern Sie zunächst den Besitzer.',
        'Ticket selected.' => 'Ticket ausgewählt.',
        'Ticket is locked by another agent.' => 'Das Ticket ist für einen anderen Agenten gesperrt.',
        'Ticket locked.' => 'Ticket gesperrt.',
        'Don\'t show closed Tickets' => 'Geschlossene Tickets nicht zeigen',
        'Show closed Tickets' => 'Geschlossene Tickets anzeigen',
        'New Article' => 'Neuer Artikel',
        'Unread article(s) available' => 'Ungelesene Artikel verfügbar',
        'Remove from list of watched tickets' => 'Von der Liste der beobachteten Tickets streichen',
        'Add to list of watched tickets' => 'Zur Liste der beobachteten Tickets hinzufügen',
        'Email-Ticket' => 'E-Mail-Ticket',
        'Create new Email Ticket' => 'Ein neues E-Mail-Ticket erstellen',
        'Phone-Ticket' => 'Telefon-Ticket',
        'Search Tickets' => 'Ticket-Suche',
        'Customer Realname' => 'Kundenname',
        'Customer History' => 'Kundenhistorie',
        'Edit Customer Users' => 'Kundenbenutzer bearbeiten',
        'Edit Customer' => 'Kunde bearbeiten',
        'Bulk Action' => 'Sammel-Aktion',
        'Bulk Actions on Tickets' => 'Sammel-Aktion an Tickets',
        'Send Email and create a new Ticket' => 'E-Mail senden und neues Ticket erstellen',
        'Create new Email Ticket and send this out (Outbound)' => 'Neues Ticket wird erstellt und E-Mail versendet',
        'Create new Phone Ticket (Inbound)' => 'Neues Ticket wird über einkommenden Anruf erstellt',
        'Address %s replaced with registered customer address.' => 'Adresse %s wurde durch die Adresse des eingetragenen Kunden ersetzt.',
        'Customer user automatically added in Cc.' => 'Kundenbenutzer wurde automatisch ins Cc eingetragen.',
        'Overview of all open Tickets' => 'Übersicht über alle offenen Tickets',
        'Locked Tickets' => 'Gesperrte Tickets',
        'My Locked Tickets' => 'Meine gesperrten Tickets',
        'My Watched Tickets' => 'Meine beobachteten Tickets',
        'My Responsible Tickets' => 'Meine verantwortlichen Tickets',
        'Watched Tickets' => 'Beobachtete Tickets',
        'Watched' => 'Beobachtet',
        'Watch' => 'Beobachten',
        'Unwatch' => 'Nicht beobachten',
        'Lock it to work on it' => 'Zur Bearbeitung sperren',
        'Unlock to give it back to the queue' => 'Zur Rückgabe an die Queue entsperren',
        'Show the ticket history' => 'Ticket-Historie anzeigen',
        'Print this ticket' => 'Dieses Ticket drucken',
        'Print this article' => 'Diesen Artikel drucken',
        'Split' => 'Teilen',
        'Split this article' => 'Diesen Artikel teilen',
        'Forward article via mail' => 'Artikel per E-Mail weiterleiten',
        'Change the ticket priority' => 'Ticket-Priorität ändern',
        'Change the ticket free fields!' => 'Ändern der freien Felder des Tickets.',
        'Link this ticket to other objects' => 'Dieses Ticket mit anderen Objekten verknüpfen',
        'Change the owner for this ticket' => 'Besitzer dieses Tickets ändern',
        'Change the  customer for this ticket' => 'Kunden dieses Tickets ändern',
        'Add a note to this ticket' => 'Eine Notiz zu diesem Ticket hinzufügen',
        'Merge into a different ticket' => 'Mit einem anderen Ticket zusammenfassen',
        'Set this ticket to pending' => 'Ticket auf "warten" setzen',
        'Close this ticket' => 'Dieses Ticket schließen',
        'Look into a ticket!' => 'Ticket genauer ansehen!',
        'Delete this ticket' => 'Dieses Ticket löschen',
        'Mark as Spam!' => 'Als Spam makieren!',
        'My Queues' => 'Meine Queues',
        'Shown Tickets' => 'Gezeigte Tickets',
        'Shown Columns' => 'Gezeigte Spalten',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Ihre E-Mail mit Ticket-Nummer "<OTRS_TICKET>" wurde zu Ticket-Nummer "<OTRS_MERGE_TO_TICKET>" zusammengefasst!',
        'Ticket %s: first response time is over (%s)!' => 'Ticket %s: Reaktionszeit ist abgelaufen (%s)!',
        'Ticket %s: first response time will be over in %s!' => 'Ticket %s: Reaktionszeit wird ablaufen in %s!',
        'Ticket %s: update time is over (%s)!' => 'Ticket %s: Aktualisierungszeit ist abgelaufen (%s)!',
        'Ticket %s: update time will be over in %s!' => 'Ticket %s: Aktualisierungszeit wird ablaufen in %s!',
        'Ticket %s: solution time is over (%s)!' => 'Ticket %s: Lösungszeit ist abgelaufen (%s)!',
        'Ticket %s: solution time will be over in %s!' => 'Ticket %s: Lösungszeit wird ablaufen in %s!',
        'There are more escalated tickets!' => 'Mehrere eskalierte Tickets vorhanden!',
        'Plain Format' => 'Unformatierte Ansicht',
        'Reply All' => 'Allen antworten',
        'Direction' => 'Richtung',
        'New ticket notification' => 'Mitteilung bei neuem Ticket',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Zusenden einer Mitteilung bei neuem Ticket in "Meine Queues".',
        'Send new ticket notifications' => 'Benachrichtigung über neue Tickets senden',
        'Ticket follow up notification' => 'Benachrichtigung über Folgeaktionen',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            'Sende mir eine Benachrichtigung, wenn ein Kunde eine Rückmeldung gibt und ich der Besitzer des Tickets bin, oder das Ticket nicht gesperrt ist und in einer meiner Queues liegt.',
        'Send ticket follow up notifications' => 'Benachrichtigung bei Rückmeldung verschicken',
        'Ticket lock timeout notification' => 'Mitteilung bei Überschreiten der Sperrzeit',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Benachrichtigung bei einer System-Freigabe eines Tickets ("unlock")',
        'Send ticket lock timeout notifications' => 'Benachrichtigung bei Ablauf einer Ticket-Sperre',
        'Ticket move notification' => 'Benachrichtigung beim Verschieben von Tickets',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Zusenden einer Mitteilung beim Verschieben eines Tickets in "Meine Queues".',
        'Send ticket move notifications' => 'Benachrichtigung beim Verschieben eines Tickets',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            'Die Auswahl ihrer favorisierten Queues. Sie werden auch per E-Mail über diese Queues benachrichtigt, wenn die Einstellung aktiv ist.',
        'Custom Queue' => 'Bevorzugte Queue',
        'QueueView refresh time' => 'Queue-Ansicht Aktualisierungszeit',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            'Automatische Aktualisierung der Queue-Ansicht nach der angegebenen Zeit',
        'Refresh QueueView after' => 'Aktualisierung der Queue-Ansicht nach',
        'Screen after new ticket' => 'Ansicht nach Ticket-Erstellung',
        'Show this screen after I created a new ticket' => 'Diese Ansicht nach dem Erstellen eines Tickets anzeigen',
        'Closed Tickets' => 'Geschlossene Tickets',
        'Show closed tickets.' => 'Geschlossene Tickets anzeigen.',
        'Max. shown Tickets a page in QueueView.' => 'Maximale Anzahl angezeigter Tickets pro Seite in der Queue-Ansicht.',
        'Ticket Overview "Small" Limit' => 'Begrenzung für Ticketübersicht "Klein"',
        'Ticket limit per page for Ticket Overview "Small"' => 'Maximale Anzahl Tickets pro Seite für Ticketübersicht "Klein"',
        'Ticket Overview "Medium" Limit' => 'Begrenzung für Ticketübersicht "Mittel"',
        'Ticket limit per page for Ticket Overview "Medium"' => 'Maximale Anzahl Tickets pro Seite für Ticketübersicht "Mittel"',
        'Ticket Overview "Preview" Limit' => 'Begrenzung für Ticketübersicht "Vorschau"',
        'Ticket limit per page for Ticket Overview "Preview"' => 'Maximale Anzahl Tickets pro Seite für Ticketübersicht "Vorschau"',
        'Ticket watch notification' => 'Benachrichtigung über Ticket-Überwachungen',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            'Für meine überwachten Tickets die gleiche Nachricht, die die Besitzer eines Tickets erhalten, an mich senden.',
        'Send ticket watch notifications' => 'Benachrichtigung über Ticket-Überwachungen senden',
        'Out Of Office Time' => 'Abwesenheitszeit',
        'New Ticket' => 'Neues Ticket',
        'Create new Ticket' => 'Neues Ticket erstellen',
        'Customer called' => 'Kundenanruf',
        'phone call' => 'Telefonanruf',
        'Phone Call Outbound' => 'Ausgehender Telefonanruf',
        'Phone Call Inbound' => 'Eingehender Telefonanruf',
        'Reminder Reached' => 'Erinnerung erreicht',
        'Reminder Tickets' => 'Erinnerungs-Tickets',
        'Escalated Tickets' => 'Eskalierte Tickets',
        'New Tickets' => 'Neue Tickets',
        'Open Tickets / Need to be answered' => 'Offene Tickets / Beantwortung erforderlich',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            'Alle offenen Tickets; an diesen Tickets wurde bereits gearbeitet, aber eine Antwort ist erforderlich',
        'All new tickets, these tickets have not been worked on yet' => 'Alle neuen Tickets; an diesen Tickets wurde noch nicht gearbeitet',
        'All escalated tickets' => 'Alle eskalierten Tickets',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Alle Tickets, deren Erinnerungszeit erreicht ist',
        'Archived tickets' => 'Archivierte Tickets',
        'Unarchived tickets' => 'Nicht archivierte Tickets',
        'Ticket Information' => 'Ticket-Informationen',
        'including subqueues' => 'untergeordnete Queues miteinbeziehen',
        'excluding subqueues' => 'untergeordnete Queues ausschließen',

        # Template: AAAWeekDay
        'Sun' => 'So',
        'Mon' => 'Mo',
        'Tue' => 'Di',
        'Wed' => 'Mi',
        'Thu' => 'Do',
        'Fri' => 'Fr',
        'Sat' => 'Sa',

        # Template: AdminACL
        'ACL Management' => 'ACL-Verwaltung',
        'Filter for ACLs' => 'Filter für ACLs',
        'Filter' => 'Filter',
        'ACL Name' => 'ACL-Name',
        'Actions' => 'Aktionen',
        'Create New ACL' => 'Neue ACL erstellen',
        'Deploy ACLs' => 'ACLs in Betrieb nehmen',
        'Export ACLs' => 'ACLs exportieren',
        'Configuration import' => 'Konfiguration importieren',
        'Here you can upload a configuration file to import ACLs to your system. The file needs to be in .yml format as exported by the ACL editor module.' =>
            'Hier können Sie über eine Konfigurationsdatei ACLs ins System importieren. Diese Datei muss das vom ACL Editor verwendeten .yml Format haben.',
        'This field is required.' => 'Dieses Feld wird benötigt.',
        'Overwrite existing ACLs?' => 'Existierende ACLs überschreiben?',
        'Upload ACL configuration' => 'ACL-Konfiguration hochladen',
        'Import ACL configuration(s)' => 'ACL-Konfiguration(en) importieren',
        'To create a new ACL you can either import ACLs which were exported from another system or create a complete new one.' =>
            'Wenn Sie eine ACL erstellen möchten, können Sie sie von einem anderen System importieren oder eine ganz neue erstellen.',
        'Changes to the ACLs here only affect the behavior of the system, if you deploy the ACL data afterwards. By deploying the ACL data, the newly made changes will be written to the configuration.' =>
            'Änderungen an den ACLs wirken sich erst aus, wenn sie die Konfiguration in Betrieb nehmen. Dabei werden die Änderungen in der Konfiguration gespeichert.',
        'ACLs' => 'ACLs',
        'Please note: This table represents the execution order of the ACLs. If you need to change the order in which ACLs are executed, please change the names of the affected ACLs.' =>
            'Hinweis: Diese Tabelle stellt die Ausführungsreihenfolge der ACLs dar. Wenn Sie die Reihenfolge ändern möchten, ändern Sie bitte die Namen der betroffenen ACLs.',
        'ACL name' => 'ACL-Name',
        'Validity' => 'Gültigkeit',
        'Copy' => 'Kopieren',
        'No data found.' => 'Keine Daten gefunden.',

        # Template: AdminACLEdit
        'Edit ACL %s' => 'ACL %s bearbeiten',
        'Go to overview' => 'Zur Übersicht gehen',
        'Delete ACL' => 'ACL löschen',
        'Delete Invalid ACL' => 'Ungültige ACL löschen',
        'Match settings' => 'Filterbedingungen',
        'Set up matching criteria for this ACL. Use \'Properties\' to match the current screen or \'PropertiesDatabase\' to match attributes of the current ticket that are in the database.' =>
            'Stellt die Filterbedingungen dieser ACL ein. Verwenden Sie \'Properties\' um den Wert aus dem aktuellen Bildschirm zu prüfen oder \'PropertiesDatabase\' für den Wert des Tickets, wie es in der Datenbank gespeichert ist.',
        'Change settings' => 'Wertänderungen',
        'Set up what you want to change if the criteria match. Keep in mind that \'Possible\' is a white list, \'PossibleNot\' a black list.' =>
            'Stellt die Wertänderungen ein für den Fall, dass die Filterbedingungen zutreffen. Hierbei ist \'Possible\' eine Positivliste und \'PossibleNot\' eine Negativliste.',
        'Check the official' => 'Prüfen Sie die offizielle',
        'documentation' => 'Dokumentation',
        'Show or hide the content' => 'Inhalt anzeigen oder ausblenden',
        'Edit ACL information' => 'ACL-Information bearbeiten',
        'Stop after match' => 'Stoppen nach Treffer',
        'Edit ACL structure' => 'ACL-Struktur bearbeiten',
        'Save settings' => 'Einstellungen speichern',
        'Save ACL' => 'ACL speichern',
        'Save' => 'Speichern',
        'or' => 'oder',
        'Save and finish' => 'Speichern und abschließen',
        'Do you really want to delete this ACL?' => 'Wollen Sie diese ACL wirklich löschen?',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?' =>
            'Dieser Eintrag enthält Untereinträge. Wollen Sie den Eintrag und alle Untereinträge wirklich löschen?',
        'An item with this name is already present.' => 'Ein Eintrag mit diesem Namen existiert bereits.',
        'Add all' => 'Alle hinzufügen',
        'There was an error reading the ACL data.' => 'Beim Lesen der ACL-Daten ist ein Fehler aufgetreten.',

        # Template: AdminACLNew
        'Create a new ACL by submitting the form data. After creating the ACL, you will be able to add configuration items in edit mode.' =>
            'Neue ACL Erstellen, durch Eingabe der Daten. Nach Anlage der ACL ist es möglich, Konfigurationsparameter im Änderungsmodus einzufügen.',

        # Template: AdminAttachment
        'Attachment Management' => 'Anlagenverwaltung',
        'Add attachment' => 'Anlage hinzufügen',
        'List' => 'Liste',
        'Download file' => 'Datei herunterladen',
        'Delete this attachment' => 'Diesen Anhang entfernen',
        'Do you really want to delete this attachment?' => 'Möchten Sie diesen Anhang wirklich löschen?',
        'Add Attachment' => 'Anhang hinzufügen',
        'Edit Attachment' => 'Anhang bearbeiten',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Verwaltung automatischer Antworten',
        'Add auto response' => 'Automatische Antwort hinzufügen',
        'Add Auto Response' => 'Automatische Antwort hinzufügen',
        'Edit Auto Response' => 'Automatische Antwort bearbeiten',
        'Response' => 'Antwort',
        'Auto response from' => 'Automatische Antwort von',
        'Reference' => 'Referenz',
        'You can use the following tags' => 'Die folgenden Tags können benutzt werden',
        'To get the first 20 character of the subject.' => 'Die ersten 20 Zeichen des Betreffs',
        'To get the first 5 lines of the email.' => 'Die ersten fünf Zeilen der Nachricht',
        'To get the name of the ticket\'s customer user (if given).' => 'Um den Namen des Kunden-Benutzer (falls vorhanden) eines Tickets zu erhalten.',
        'To get the article attribute' => 'Die Artikel-Attribute',
        ' e. g.' => 'z. B.',
        'Options of the current customer user data' => 'Attribute des aktuellen Kunden',
        'Ticket owner options' => 'Attribute des Ticketbesitzers',
        'Ticket responsible options' => 'Attribute des Ticket-Verantwortlichen',
        'Options of the current user who requested this action' => 'Attribute des aktuellen Benutzers, der die Aktion angefordert hat',
        'Options of the ticket data' => 'Attribute der Ticketdaten',
        'Options of ticket dynamic fields internal key values' => 'Interne Werte der DynamicFields von Tickets',
        'Options of ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Angezeigte Werte der DynamicFields von Tickets, nutzbar mit Dropdown und Multiselect',
        'Config options' => 'Konfigurationseinstellungen',
        'Example response' => 'Beispielantwort',

        # Template: AdminCloudServiceSupportDataCollector
        'Cloud Service Management' => 'Verwaltung von Cloud-Services',
        'Support Data Collector' => 'Supportdaten-Analyse',
        'Support data collector' => 'Supportdaten-Analyse',
        'Hint' => 'Hinweis',
        'Currently support data is only shown in this system.' => 'Supportdaten werden derzeit nur auf diesem System angezeigt.',
        'It is highly recommended to send this data to OTRS Group in order to get better support.' =>
            'Es wird empfohlen, diese Daten an die OTRS Gruppe zu senden, um bessere Unterstützung zu erhalten.',
        'Configuration' => 'Konfiguration',
        'Send support data' => 'Supportdaten senden',
        'This will allow the system to send additional support data information to OTRS Group.' =>
            'Diese Einstellung aktiviert das Senden zusätzlicher Support-Informationen an die OTRS Gruppe.',
        'System Registration' => 'Systemregistrierung',
        'To enable data sending, please register your system with OTRS Group or update your system registration information (make sure to activate the \'send support data\' option.)' =>
            'Um das Senden der Daten zu aktivieren, registrieren Sie bitte Ihr System bei der OTRS Gruppe oder aktualisieren Sie Ihre Systemregistrierung (aktivieren Sie die Option \'Supportdaten senden\').',
        'Register this System' => 'Registrieren Sie dieses System',
        'System Registration is disabled for your system. Please check your configuration.' =>
            'Die Systemregistrierung ist für Ihr System deaktiviert. Bitte überprüfen Sie die Konfiguration.',

        # Template: AdminCloudServices
        'System registration is a service of OTRS Group, which provides a lot of advantages!' =>
            'Die Systemregistrierung ist ein Service der OTRS Gruppe, der Ihnen viele Vorteile sichert!',
        'Please note that the use of OTRS cloud services requires the system to be registered.' =>
            'Bitte beachten Sie, dass die Verwendung von OTRS Cloud-Services ein registriertes System voraussetzt.',
        'Register this system' => 'Registrieren Sie dieses System',
        'Here you can configure available cloud services that communicate securely with %s.' =>
            'Hier können Sie verfügbare Cloud-Services konfigurieren die sicher mit %s kommunizieren.',
        'Available Cloud Services' => 'Verfügbare Cloud-Services',
        'Upgrade to %s' => 'Auf %s upgraden',

        # Template: AdminCustomerCompany
        'Customer Management' => 'Kundenverwaltung',
        'Wildcards like \'*\' are allowed.' => 'Platzhalter wie \'*\' sind erlaubt.',
        'Add customer' => 'Kunden hinzufügen',
        'Select' => 'Auswahl',
        'List (only %s shown - more available)' => 'Liste (nur %s angezeigt - mehr verfügbar)',
        'List (%s total)' => 'Liste (%s insgesamt)',
        'Please enter a search term to look for customers.' => 'Bitte geben Sie einen Suchbegriff ein, um nach Kunden zu suchen.',
        'Add Customer' => 'Kunden hinzufügen',

        # Template: AdminCustomerUser
        'Customer User Management' => 'Kundenbenutzerverwaltung',
        'Back to search results' => 'Zurück zum Suchergebnis',
        'Add customer user' => 'Kundenbenutzer hinzufügen',
        'Customer user are needed to have a customer history and to login via customer panel.' =>
            'Kundenbenutzer werden für die Bereitstellung einer Kundenhistorie und für die Anmeldung über den Kundenzugang benötigt.',
        'Last Login' => 'Letzte Anmeldung',
        'Login as' => 'Anmelden als',
        'Switch to customer' => 'Zum Kunden wechseln',
        'Add Customer User' => 'Kundenbenutzer hinzufügen',
        'Edit Customer User' => 'Kundenbenutzer bearbeiten',
        'This field is required and needs to be a valid email address.' =>
            'Dieses Feld wird benötigt und muss eine gültige E-Mail-Adresse sein.',
        'This email address is not allowed due to the system configuration.' =>
            'Diese E-Mail-Adresse wird von der aktuellen Systemkonfiguration nicht zugelassen.',
        'This email address failed MX check.' => 'Für diese E-Mail-Adresse ist die MX-Prüfung fehlgeschlagen.',
        'DNS problem, please check your configuration and the error log.' =>
            'DNS-Problem, bitte prüfen Sie ihre Konfiguration und das Fehlerprotokoll.',
        'The syntax of this email address is incorrect.' => 'Die Syntax dieser E-Mail-Adresse ist fehlerhaft.',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => 'Kunden-Gruppen-Zuordnung verwalten',
        'Notice' => 'Bemerkung',
        'This feature is disabled!' => 'Dieses Feature ist inaktiv!',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Benutzen Sie diese Programmfunktion, wenn Sie Gruppen-Erlaubnisse für Kunden definieren möchten.',
        'Enable it here!' => 'Hier aktivieren!',
        'Edit Customer Default Groups' => 'Standardgruppen für Kunden bearbeiten',
        'These groups are automatically assigned to all customers.' => 'Diese Gruppen werden allen Kunden automatisch zugewiesen.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'Sie können diese Gruppen mit der Konfigurationseinstellung "CustomerGroupAlwaysGroups" bearbeiten.',
        'Filter for Groups' => 'Filter für Gruppen',
        'Just start typing to filter...' => 'Beginnen Sie mit der Eingabe, um zu filtern...',
        'Select the customer:group permissions.' => 'Wählen sie die Kunde:Gruppe-Rechte aus',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Wenn nichts ausgewählt ist, hat der Kunde in dieser Gruppe keine Rechte (und kann nicht auf Tickets zugreifen).',
        'Search Results' => 'Suchergebnisse',
        'Customers' => 'Kunden',
        'No matches found.' => 'Keine Treffer gefunden.',
        'Groups' => 'Gruppen',
        'Change Group Relations for Customer' => 'Gruppenzuordnungen verwalten für Kunden',
        'Change Customer Relations for Group' => 'Kundenzuordnungen verwalten für Gruppe',
        'Toggle %s Permission for all' => 'Recht %s für alle umschalten',
        'Toggle %s permission for %s' => 'Recht %s für %s umschalten',
        'Customer Default Groups:' => 'Standard-Kundengruppen:',
        'No changes can be made to these groups.' => 'An diesen Gruppen können keine Änderungen vorgenommen werden.',
        'ro' => 'ro',
        'Read only access to the ticket in this group/queue.' => 'Nur-Lesen-Zugriff auf Tickets in diesen Gruppen/Queues.',
        'rw' => 'rw',
        'Full read and write access to the tickets in this group/queue.' =>
            'Voller Schreib- und Lesezugriff auf Tickets in der Queue/Gruppe.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => 'Kunden-Service-Zuordnungen verwalten',
        'Edit default services' => 'Standardservices bearbeiten',
        'Filter for Services' => 'Filter für Services',
        'Allocate Services to Customer' => 'Services zuordnen an Kunden',
        'Allocate Customers to Service' => 'Kunden zuordnen an Service',
        'Toggle active state for all' => 'Aktiv-Status für alle umschalten',
        'Active' => 'Aktiv',
        'Toggle active state for %s' => 'Aktiv-Status für %s umschalten',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => 'Verwaltung dynamischer Felder',
        'Add new field for object' => 'Neues Feld hinzufügen für Objekt',
        'To add a new field, select the field type from one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'Um ein neues Feld hinzuzufügen, wählen Sie den Feld-Typ aus der Liste der verfügbaren Typen für das jeweilige Objekt aus. Die Objekt-Auswahl ist bindend und kann nicht nachträglich verändert werden.',
        'Dynamic Fields List' => 'Liste der dynamischen Felder',
        'Dynamic fields per page' => 'Dynamische Felder pro Seite',
        'Label' => 'Beschriftung',
        'Order' => 'Sortierung',
        'Object' => 'Objekt',
        'Delete this field' => 'Dieses Feld löschen',
        'Do you really want to delete this dynamic field? ALL associated data will be LOST!' =>
            'Wollen Sie dieses dynamische Feld wirklich löschen? Alle darin enthaltenen Daten werden GELÖSCHT!',
        'Delete field' => 'Feld löschen',
        'Deleting the field and its data. This may take a while...' => 'Lösche das Feld und die zugehörigen Daten. Dies kann etwas dauern...',

        # Template: AdminDynamicFieldCheckbox
        'Dynamic Fields' => 'Dynamische Felder',
        'Field' => 'Feld',
        'Go back to overview' => 'Zurück zur Übersicht gehen',
        'General' => 'Allgemein',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Dieses Feld wird benötigt, und der Wert darf nur Buchstaben und Zahlen enthalten.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Muss eindeutig sein und darf nur aus Buchstaben und Zahlen bestehen.',
        'Changing this value will require manual changes in the system.' =>
            'Eine Änderung dieses Wertes macht weitere manuelle Änderungen am System erforderlich.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Dieser Name wird auf den Bildschirmen angezeigt, auf denen dieses Feld aktiv ist.',
        'Field order' => 'Feldreihenfolge',
        'This field is required and must be numeric.' => 'Dieses Feld wird benötigt und darf nur Zahlen enthalten.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Die Feldreihenfolge steuert die Ausgabe der Felder auf den Bildschirmen.',
        'Field type' => 'Feldtyp',
        'Object type' => 'Objekttyp',
        'Internal field' => 'Internes Feld',
        'This field is protected and can\'t be deleted.' => 'Dies ist ein geschütztes internes Feld und kann nicht gelöscht werden.',
        'Field Settings' => 'Feldeinstellungen',
        'Default value' => 'Standardwert',
        'This is the default value for this field.' => 'Dies ist der Standardwert für dieses Feld.',

        # Template: AdminDynamicFieldDateTime
        'Default date difference' => 'Standard-Datumsunterschied',
        'This field must be numeric.' => 'Dieses Feld darf nur Zahlen beinhalten.',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'Der Unterschied zu JETZT in Sekunden, mit dem der Standardwert des Feldes berechnet wird (z. B. 3600 oder -60).',
        'Define years period' => 'Jahresbereich angeben',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            'Aktivieren Sie diese Funktion, um für die Datumsauswahl einen festen Jahresbereich anzugeben (Jahre in der Vergangenheit und Zukunft).',
        'Years in the past' => 'Jahre in der Vergangenheit',
        'Years in the past to display (default: 5 years).' => 'Jahre in der Vergangenheit, die angezeigt werden (Standard: 5).',
        'Years in the future' => 'Jahre in der Zukunft',
        'Years in the future to display (default: 5 years).' => 'Jahre in der Zukunft, die angezeigt werden (Standard: 5).',
        'Show link' => 'Link anzeigen',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'Hier können Sie einen optionalen Link für die Felddarstellung in Übersichten und Ansichtsseiten angeben.',
        'Link for preview' => 'Link für Vorschau',
        'If filled in, this URL will be used for a preview which is shown when this link is hovered in ticket zoom. Please note that for this to work, the regular URL field above needs to be filled in, too.' =>
            'Diese URL wird (falls vorhanden) für eine Vorschau verwendet, wenn sich die Maus über diesem Link in der Ticketansicht befindet. Hierfür muss das oben stehende URL-Feld ebenso ausgefüllt werden.',
        'Restrict entering of dates' => 'Eingabe von Daten einschränken',
        'Here you can restrict the entering of dates of tickets.' => 'Hier können Sie die Eingabe von Daten in dieses Feld einschränken.',

        # Template: AdminDynamicFieldDropdown
        'Possible values' => 'Mögliche Werte',
        'Key' => 'Schlüssel',
        'Value' => 'Wert',
        'Remove value' => 'Wert löschen',
        'Add value' => 'Wert hinzufügen',
        'Add Value' => 'Wert hinzufügen',
        'Add empty value' => 'Leeren Wert hinzufügen',
        'Activate this option to create an empty selectable value.' => 'Aktivieren Sie diese Einstellung, um einen leeren Auswahlwert zu erzeugen.',
        'Tree View' => 'Baumansicht',
        'Activate this option to display values as a tree.' => 'Aktivieren Sie diese Option um die Werte als Baum anzuzeigen.',
        'Translatable values' => 'Wertübersetzung',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Wenn Sie diese Einstellung aktivieren, werden die Werte in die Sprache des Benutzers übersetzt.',
        'Note' => 'Notiz',
        'You need to add the translations manually into the language translation files.' =>
            'Sie müssen die Übersetzungen manuell zu den Übersetzungsdateien hinzufügen.',

        # Template: AdminDynamicFieldText
        'Number of rows' => 'Anzahl der Zeilen',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'Gibt die Anzahl der Zeilen für dieses Feld im Bearbeitungsmodus an.',
        'Number of cols' => 'Anzahl der Spalten',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'Gibt die Breite in Zeichen für dieses Feld im Bearbeitungsmodus an.',
        'Check RegEx' => 'Auf RegEx prüfen',
        'Here you can specify a regular expression to check the value. The regex will be executed with the modifiers xms.' =>
            'Hier können Sie einen regulären Ausdruck definieren um den Wert zu prüfen. Der RegEx wird mit den Modifikatoren xms ausgeführt.',
        'RegEx' => 'RegEx',
        'Invalid RegEx' => 'Ungültige RegEx',
        'Error Message' => 'Fehlermeldung',
        'Add RegEx' => 'RegEx hinzufügen',

        # Template: AdminEmail
        'Admin Notification' => 'Admin-Benachrichtigung',
        'With this module, administrators can send messages to agents, group or role members.' =>
            'Mit diesem Modul können Administratoren Nachrichten an Agenten, Gruppen oder Rolleninhaber senden.',
        'Create Administrative Message' => 'Administratorennachricht erzeugen',
        'Your message was sent to' => 'Ihre Nachricht wurde gesendet an',
        'Send message to users' => 'Nachricht an Benutzer senden',
        'Send message to group members' => 'Nachricht an Gruppenmitglieder senden',
        'Group members need to have permission' => 'Gruppenmitglieder brauchen eine Berechtigung',
        'Send message to role members' => 'Nachricht an Inhaber von Rollen senden',
        'Also send to customers in groups' => 'Auch an Kunden der Gruppe senden',
        'Body' => 'Text',
        'Send' => 'Senden',

        # Template: AdminGenericAgent
        'Generic Agent' => 'GenericAgent',
        'Add job' => 'Job hinzufügen',
        'Last run' => 'Letzte Ausführung',
        'Run Now!' => 'Jetzt ausführen!',
        'Delete this task' => 'Diesen Job löschen',
        'Run this task' => 'Diesen Job ausführen',
        'Do you really want to delete this task?' => 'Möchten Sie diese Aufgabe wirklich löschen?',
        'Job Settings' => 'Jobeinstellungen',
        'Job name' => 'Jobname',
        'The name you entered already exists.' => 'Der eingegebene Name existiert bereits.',
        'Toggle this widget' => 'Dieses Widget umschalten',
        'Automatic execution (multiple tickets)' => 'Automatische Ausführung (mehrere Tickets)',
        'Execution Schedule' => 'Ausführungsplan',
        'Schedule minutes' => 'Ausführen zu Minute(n)',
        'Schedule hours' => 'Ausführen zu Stunde(n)',
        'Schedule days' => 'Ausführen an Tag(en)',
        'Currently this generic agent job will not run automatically.' =>
            'Derzeit würde dieser GenericAgent-Job nicht automatisch ausgeführt werden.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Um ihn automatisch auszuführen, muss mindestens je ein Wert von Minuten, Stunden und Tagen ausgewählt werden!',
        'Event based execution (single ticket)' => 'Event-gesteuerte Ausführung (einzelnes Ticket)',
        'Event Triggers' => 'Event-Trigger',
        'List of all configured events' => 'Alle konfigurierten Events anzeigen',
        'Delete this event' => 'Dieses Event löschen',
        'Additionally or alternatively to a periodic execution, you can define ticket events that will trigger this job.' =>
            'Zusätzlich oder alternativ zur periodischen Ausführung können Sie Ticket-Events angeben, bei denen dieser Job ausgeführt werden soll.',
        'If a ticket event is fired, the ticket filter will be applied to check if the ticket matches. Only then the job is run on that ticket.' =>
            'Wenn ein Ticket-Event ausgelöst wird, wird zunächst der Ticketfilter angewendet um zu prüfen, ob das Ticket betroffen ist. Erst danach wird der Job ggf. für dieses Ticket ausgeführt.',
        'Do you really want to delete this event trigger?' => 'Wollen Sie diesen Event-Trigger wirklich löschen?',
        'Add Event Trigger' => 'Event-Trigger hinzufügen',
        'Add Event' => 'Event hinzufügen',
        'To add a new event select the event object and event name and click on the "+" button' =>
            'Um einen neuen Event hinzuzufügen, wählen Sie bitte das Objekt und den Eventnamen und klicken Sie auf den "+"-Knopf',
        'Duplicate event.' => 'Doppeltes Event',
        'This event is already attached to the job, Please use a different one.' =>
            'Dieses Event ist dem Job bereits zugeordnet. Bitte wählen Sie ein anderes aus.',
        'Delete this Event Trigger' => 'Diesen Event-Trigger löschen',
        'Remove selection' => 'Auswahl entfernen',
        'Select Tickets' => 'Tickets selektieren',
        '(e. g. 10*5155 or 105658*)' => '(z .B. 10*5155 oder 105658*)',
        '(e. g. 234321)' => '(z. B. 234321)',
        'Customer user' => 'Kundenbenutzer',
        '(e. g. U5150)' => '(z. B. U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Volltextsuche in Artikeln (z. B. "Mar*in" oder "Baue*").',
        'Agent' => 'Agent',
        'Ticket lock' => 'Ticketsperre',
        'Create times' => 'Erstellzeiten',
        'No create time settings.' => 'Keine Erstell-Zeiten',
        'Ticket created' => 'Ticket erstellt',
        'Ticket created between' => 'Ticket erstellt zwischen',
        'Last changed times' => 'Letzte Änderungszeitpunkte',
        'No last changed time settings.' => 'Keine Einstellungen für letzte Änderungszeit.',
        'Ticket last changed' => 'Ticket zuletzt geändert',
        'Ticket last changed between' => 'Ticket zuletzt geändert zwischen',
        'Change times' => 'Änderungs-Zeiten',
        'No change time settings.' => 'Keine Änderungs-Zeiten',
        'Ticket changed' => 'Ticket geändert',
        'Ticket changed between' => 'Ticket geändert zwischen',
        'Close times' => 'Schließ-Zeiten',
        'No close time settings.' => 'Keine Schließ-Zeiten',
        'Ticket closed' => 'Ticket geschlossen',
        'Ticket closed between' => 'Ticket geschlossen zwischen',
        'Pending times' => 'Erinnerungszeiten',
        'No pending time settings.' => 'Keine Erinnerungszeiten',
        'Ticket pending time reached' => 'Ticket-Erinnerungszeit erreicht',
        'Ticket pending time reached between' => 'Ticket-Erinnerungszeit erreicht zwischen',
        'Escalation times' => 'Eskalationszeiten',
        'No escalation time settings.' => 'Keine Eskalationszeiten',
        'Ticket escalation time reached' => 'Ticket-Eskalationszeit erreicht',
        'Ticket escalation time reached between' => 'Ticket-Eskalationszeit erreicht zwischen',
        'Escalation - first response time' => 'Eskalation - Zeit für erste Reaktion',
        'Ticket first response time reached' => 'Ticket-Reaktionszeit erreicht',
        'Ticket first response time reached between' => 'Ticket-Reaktionszeit erreicht zwischen',
        'Escalation - update time' => 'Eskalation - Aktualisierungszeit',
        'Ticket update time reached' => 'Ticket-Aktualisierungszeit erreicht',
        'Ticket update time reached between' => 'Ticket-Aktualisierungszeit erreicht zwischen',
        'Escalation - solution time' => 'Eskalation - Lösungszeit',
        'Ticket solution time reached' => 'Ticket-Lösungszeit erreicht',
        'Ticket solution time reached between' => 'Ticket-Lösungszeit erreicht zwischen',
        'Archive search option' => 'Im Archiv suchen',
        'Update/Add Ticket Attributes' => 'Ticket-Attribute aktualisieren/hinzufügen',
        'Set new service' => 'Neuen Service setzen',
        'Set new Service Level Agreement' => 'Neues Service-Level-Abkommen setzen',
        'Set new priority' => 'Neue Priorität setzen',
        'Set new queue' => 'Neue Queue festlegen',
        'Set new state' => 'Neuen Status setzen',
        'Pending date' => 'Warten bis',
        'Set new agent' => 'Neuen Agenten setzen',
        'new owner' => 'Neuer Besitzer',
        'new responsible' => 'Neuer Verantwortlicher',
        'Set new ticket lock' => 'Neue Ticketsperre setzen',
        'New customer user' => 'Neuer Kundenbenutzer',
        'New customer ID' => 'Neue Kundennummer',
        'New title' => 'Neuer Titel',
        'New type' => 'Neuer Typ',
        'New Dynamic Field Values' => 'Neue Werte für dynamische Felder',
        'Archive selected tickets' => 'Ausgewählte Tickets archivieren',
        'Add Note' => 'Notiz hinzufügen',
        'Time units' => 'Zeiteinheiten',
        'Execute Ticket Commands' => 'Ticket-Befehle ausführen',
        'Send agent/customer notifications on changes' => 'Sende eine Agenten-/Kunden-Benachrichtigung bei Änderungen',
        'CMD' => 'CMD',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Dieser Befehl wird mit der Ticket-Nummer als erstes und der Ticket-ID als zweites Argument ausgeführt.',
        'Delete tickets' => 'Tickets löschen',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Warnung: Alle betroffenen Tickets werden aus der Datenbank gelöscht und können nicht wiederhergestellt werden!',
        'Execute Custom Module' => 'Benutzerdefiniertes Modul ausführen',
        'Param %s key' => 'Schlüssel für Parameter %s',
        'Param %s value' => 'Wert für Parameter %s',
        'Save Changes' => 'Änderungen speichern',
        'Results' => 'Ergebnisse',
        '%s Tickets affected! What do you want to do?' => '%s Tickets sind betroffen! Was wollen Sie tun?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Warnung: Sie verwenden die Option LÖSCHEN. Alle gelöschten Tickets gehen verloren!',
        'Warning: There are %s tickets affected but only %s may be modified during one job execution!' =>
            'Warnung: %s Tickets sind betroffen, aber nur %s können während der Ausführung eines Jobs geändert werden!',
        'Edit job' => 'Job bearbeiten',
        'Run job' => 'Job ausführen',
        'Affected Tickets' => 'Betroffene Tickets',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => 'GenericInterface Debugger für Webservice %s',
        'You are here' => 'Sie sind hier',
        'Web Services' => 'Webservices',
        'Debugger' => 'Debugger',
        'Go back to web service' => 'Zurück zum Webservice',
        'Clear' => 'Leeren',
        'Do you really want to clear the debug log of this web service?' =>
            'Möchten Sie wirklich das Debug-Log dieses Webservice leeren?',
        'Request List' => 'Anfrage-Liste',
        'Time' => 'Zeit',
        'Remote IP' => 'Remote-IP',
        'Loading' => 'Lade...',
        'Select a single request to see its details.' => 'Wählen Sie eine Anfrage aus, um die Details zu sehen.',
        'Filter by type' => 'Filtern nach Typ',
        'Filter from' => 'Filter von',
        'Filter to' => 'Filter bis',
        'Filter by remote IP' => 'Filter nach Remote-IP',
        'Limit' => 'Limit',
        'Refresh' => 'Aktualisieren',
        'Request Details' => 'Anfragedetails',
        'An error occurred during communication.' => 'Während der Kommunikation ist ein Fehler aufgetreten.',
        'Show or hide the content.' => 'Inhalt anzeigen oder verbergen.',
        'Clear debug log' => 'Debug-Log leeren',

        # Template: AdminGenericInterfaceInvokerDefault
        'Add new Invoker to Web Service %s' => 'Neuen Invoker zum Webservice %s hinzufügen',
        'Change Invoker %s of Web Service %s' => 'Invoker %s von Webservice %s ändern',
        'Add new invoker' => 'Neuen Invoker hinzufügen',
        'Change invoker %s' => 'Invoker %s ändern',
        'Do you really want to delete this invoker?' => 'Wollen Sie diesen Invoker wirklich löschen?',
        'All configuration data will be lost.' => 'Die Konfigurationsdaten gehen verloren.',
        'Invoker Details' => 'Invoker-Details',
        'The name is typically used to call up an operation of a remote web service.' =>
            'Der Name wird typischerweise genutzt, um eine Operation eines entfernten Webservice aufzurufen.',
        'Please provide a unique name for this web service invoker.' => 'Bitte geben sie einen eindeutigen Namen für diesen Webservice-Invoker an.',
        'Invoker backend' => 'Invoker-Backend',
        'This OTRS invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            'Dieses Invoker-Backend-Modul wird aufgerufen, um die Daten zum Versand an das entfernte System sowie die zurückgelieferten Daten aufzubereiten.',
        'Mapping for outgoing request data' => 'Mapping für ausgehende Anfragedaten',
        'Configure' => 'Konfigurieren',
        'The data from the invoker of OTRS will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Die Daten des Invokers von OTRS werden von diesem Mapping verarbeitet, um sie so umzuformen, wie das entfernte System die Daten benötigt.',
        'Mapping for incoming response data' => 'Mapping für eingehende Antwortdaten',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of OTRS expects.' =>
            'Die Antwort-Daten des entfernten Systems werden von diesem Mapping verarbeitet, um sie so umzuformen, wie der Invoker von OTRS sie benötigt.',
        'Asynchronous' => 'Asynchron',
        'This invoker will be triggered by the configured events.' => 'Dieser Invoker wird von den konfigurierten Events ausgelöst.',
        'Asynchronous event triggers are handled by the OTRS Scheduler Daemon in background (recommended).' =>
            'Asynchrone Ereignisauslöser werden vom OTRS Scheduler Daemon im Hintergrund verarbeitet (empfohlen).',
        'Synchronous event triggers would be processed directly during the web request.' =>
            'Synchrone Event-Trigger werden direkt während des laufenden Web-Requests verarbeitet.',
        'Save and continue' => 'Speichern und weiter',
        'Delete this Invoker' => 'Diesen Invoker löschen',

        # Template: AdminGenericInterfaceMappingSimple
        'GenericInterface Mapping Simple for Web Service %s' => 'GenericInterface Simple Mapping für Webservice %s',
        'Go back to' => 'Zurück zu',
        'Mapping Simple' => 'Simple Mapping',
        'Default rule for unmapped keys' => 'Standardregel für nicht gemappte Schlüssel',
        'This rule will apply for all keys with no mapping rule.' => 'Diese Regel wird für alle Schlüssel ohne passende Regel angewendet.',
        'Default rule for unmapped values' => 'Standardregel für nicht gemappte Werte',
        'This rule will apply for all values with no mapping rule.' => 'Diese Regel wird für alle Werte ohne passende Regel angewendet.',
        'New key map' => 'Neues Schlüssel-Mapping',
        'Add key mapping' => 'Schlüssel-Mapping hinzufügen',
        'Mapping for Key ' => 'Mapping für Schlüssel',
        'Remove key mapping' => 'Schlüssel-Mapping entfernen',
        'Key mapping' => 'Schlüssel-Mapping',
        'Map key' => 'Schlüssel',
        'matching the' => 'übereinstimmend mit',
        'to new key' => 'auf neuen Schlüssel mappen',
        'Value mapping' => 'Wert-Mapping',
        'Map value' => 'Wert',
        'to new value' => 'auf neuen Wert mappen',
        'Remove value mapping' => 'Wert-Mapping entfernen',
        'New value map' => 'Neues Wert-Mapping',
        'Add value mapping' => 'Wert-Mapping hinzufügen',
        'Do you really want to delete this key mapping?' => 'Wollen Sie dieses Schlüssel-Mapping wirklich löschen?',
        'Delete this Key Mapping' => 'Schlüssel-Mapping löschen',

        # Template: AdminGenericInterfaceMappingXSLT
        'GenericInterface Mapping XSLT for Web Service %s' => 'GenericInterface XSLT-Mapping für Webservice %s',
        'Mapping XML' => 'Mapping-XML',
        'Template' => 'Vorlage',
        'The entered data is not a valid XSLT stylesheet.' => 'Die eingegebenen Daten sind keine gültige XSLT-Formatvorlage.',
        'Insert XSLT stylesheet.' => 'XSLT-Formatvorlage hinzufügen.',

        # Template: AdminGenericInterfaceOperationDefault
        'Add new Operation to Web Service %s' => 'Neue Operation zu Webservice %s hinzufügen',
        'Change Operation %s of Web Service %s' => 'Operation %s von Webservice %s ändern',
        'Add new operation' => 'Neue Operation hinzufügen',
        'Change operation %s' => 'Operation %s ändern',
        'Do you really want to delete this operation?' => 'Wollen Sie diese Operation wirklich löschen?',
        'Operation Details' => 'Operation-Details',
        'The name is typically used to call up this web service operation from a remote system.' =>
            'Der Name wird typischerweise benutzt, um die Webservice-Operation von einem entfernten System aus aufzurufen.',
        'Please provide a unique name for this web service.' => 'Bitte geben Sie einen eindeutigen Namen für diesen Webservice an.',
        'Mapping for incoming request data' => 'Mapping für eingehende Anfragedaten',
        'The request data will be processed by this mapping, to transform it to the kind of data OTRS expects.' =>
            'Die Daten der eingehenden Anfrage werden von diesem Mapping verarbeitet, um sie so umzuformen, wie die OTRS-Operation sie benötigt.',
        'Operation backend' => 'Operation-Backend',
        'This OTRS operation backend module will be called internally to process the request, generating data for the response.' =>
            'Das Operation-Backend-Modul wird intern aufgerufen um die Anfrage zu verarbeiten, und erzeugt dabei Antwortdaten.',
        'Mapping for outgoing response data' => 'Mapping für ausgehende Antwortdaten',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Die Antwortdaten werden von diesem Mapping verarbeitet, um sie so umzuformen, wie das entfernte System die Daten benötigt.',
        'Delete this Operation' => 'Diese Operation löschen',

        # Template: AdminGenericInterfaceTransportHTTPREST
        'GenericInterface Transport HTTP::REST for Web Service %s' => 'GenericInterface Transport HTTP::REST für Webservice %s',
        'Network transport' => 'Netzwerk-Transport',
        'Properties' => 'Eigenschaften',
        'Route mapping for Operation' => 'Route-Mapping für Operationen',
        'Define the route that should get mapped to this operation. Variables marked by a \':\' will get mapped to the entered name and passed along with the others to the mapping. (e.g. /Ticket/:TicketID).' =>
            'Definiert den Weg, der zu der Operation gemappt werden soll. Variablen, die mit einem \':\' markiert sind, werden zu dem eingegeben Namen gemappt und mit den anderen Variablen an die Funktion übergeben. (z.B.: /Ticket/:TicketID)',
        'Valid request methods for Operation' => 'Gültige Anfrage-Methoden für Operation',
        'Limit this Operation to specific request methods. If no method is selected all requests will be accepted.' =>
            'Beschränken Sie diese Operation auf bestimmte Anfrage-Methoden. Wenn keine Methode ausgewählt ist, werden alle Anfragen akzeptiert.',
        'Maximum message length' => 'Maximale Nachrichtenlänge',
        'This field should be an integer number.' => 'Dieses Feld sollte eine Ganzzahl beinhalten.',
        'Here you can specify the maximum size (in bytes) of REST messages that OTRS will process.' =>
            'Bestimmen Sie die maximale Größe (in Bytes) für REST-Nachrichten, die OTRS akzeptieren soll.',
        'Send Keep-Alive' => 'Keep-Alive senden',
        'This configuration defines if incoming connections should get closed or kept alive.' =>
            'Bestimmt, ob eingehende Verbindungen geschlossen oder am Leben erhalten werden sollen.',
        'Host' => 'Host',
        'Remote host URL for the REST requests.' => 'URL des Remote-Hosts für REST-Anfragen.',
        'e.g https://www.otrs.com:10745/api/v1.0 (without trailing backslash)' =>
            'z. B. https://www.otrs.com:10745/api/v1.0 (ohne abschließenden Backslash)',
        'Controller mapping for Invoker' => 'Controller-Mapping für Invoker',
        'The controller that the invoker should send requests to. Variables marked by a \':\' will get replaced by the data value and passed along with the request. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).' =>
            'Der Controller, an den der Invoker Anfragen senden soll. Variablen, die mit einem \':\' markiert sind, werden durch den Datenwert ersetzt und mit dem Request übergeben. (z.B.: /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password)',
        'Valid request command for Invoker' => 'Gültiger Anforderungsbefehl für Invoker',
        'A specific HTTP command to use for the requests with this Invoker (optional).' =>
            'Ein spezifisches HTTP-Kommando, das für Anfragen mit diesem Invoker zu verwenden ist (optional).',
        'Default command' => 'Standardbefehl',
        'The default HTTP command to use for the requests.' => 'Der Standard-HTTP-Befehl für die Anfragen.',
        'Authentication' => 'Authentifizierung',
        'The authentication mechanism to access the remote system.' => 'Die Authentifizierungsmethode für den Zugriff auf das entfernte System.',
        'A "-" value means no authentication.' => 'Der Wert "-" bedeutet keine Authentifizierung.',
        'The user name to be used to access the remote system.' => 'Der Benutzername für den Zugriff auf das entfernte System.',
        'The password for the privileged user.' => 'Dass Passwort des berechtigten Benutzers.',
        'Use SSL Options' => 'SSL-Optionen verwenden',
        'Show or hide SSL options to connect to the remote system.' => 'Optionen für die Verwendung von SSL zum Zugriff auf das entfernte System anzeigen oder verbergen.',
        'Certificate File' => 'Zertifikatsdatei',
        'The full path and name of the SSL certificate file.' => 'Der vollständige Pfad und Name der SSL-Zertifikats-Datei.',
        'e.g. /opt/otrs/var/certificates/REST/ssl.crt' => 'Zum Beispiel: /opt/otrs/var/certificates/REST/ssl.crt',
        'Certificate Password File' => 'Passwortdatei für Zertifikat',
        'The full path and name of the SSL key file.' => 'Der vollständige Pfad und Name der SSL-Schlüsseldatei.',
        'e.g. /opt/otrs/var/certificates/REST/ssl.key' => 'Zum Beispiel: /opt/otrs/var/certificates/REST/ssl.key',
        'Certification Authority (CA) File' => 'Datei der Certification Authority (CA)',
        'The full path and name of the certification authority certificate file that validates the SSL certificate.' =>
            'Der vollständige Pfad und Name der Zertifizierungsstellen-Zertifikatsdatei, die das SSL-Zertifikat bestätigt.',
        'e.g. /opt/otrs/var/certificates/REST/CA/ca.file' => 'Zum Beispiel: /opt/otrs/var/certificates/REST/CA/ca.file',

        # Template: AdminGenericInterfaceTransportHTTPSOAP
        'GenericInterface Transport HTTP::SOAP for Web Service %s' => 'GenericInterface Transport HTTP::SOAP für Webservice %s',
        'Endpoint' => 'Endpunkt',
        'URI to indicate a specific location for accessing a service.' =>
            'URI für den Zugriff auf einen Webservice.',
        'e.g. http://local.otrs.com:8000/Webservice/Example' => 'z. B. http://local.otrs.com:8000/Webservice/Example',
        'Namespace' => 'Namespace',
        'URI to give SOAP methods a context, reducing ambiguities.' => 'URI, die SOAP-Methoden einen Kontext gibt und damit Mehrdeutigkeiten auflöst.',
        'e.g urn:otrs-com:soap:functions or http://www.otrs.com/GenericInterface/actions' =>
            'z. B. urn:otrs-com:soap:functions oder http://www.otrs.com/GenericInterface/actions',
        'Request name scheme' => 'Anfragen-Namensschema',
        'Select how SOAP request function wrapper should be constructed.' =>
            'Wählen Sie, wie der SOAP-Funktionsaufruf konstruiert werden soll.',
        '\'FunctionName\' is used as example for actual invoker/operation name.' =>
            '\'FunctionName\' wird als Beispiel für den tatsächlichen Namen eines Invokers / einer Operation verwendet.',
        '\'FreeText\' is used as example for actual configured value.' =>
            '\'FreeText\' wird als Beispiel für einen tatsächlich konfigurierten Wert verwendet.',
        'Request name free text' => '',
        'Text to be used to as function wrapper name suffix or replacement.' =>
            'Text, der als Anhang oder Ersatz für den Funktionsnamen verwendet werden soll.',
        'Please consider XML element naming restrictions (e.g. don\'t use \'<\' and \'&\').' =>
            'Bitte beachten Sie die Beschränkungen von XML-Elementnamen (verwenden Sie z. B. kein \'<\' oder \'&\').',
        'Response name scheme' => 'Antwort-Namensschema',
        'Select how SOAP response function wrapper should be constructed.' =>
            'Wählen Sie, wie die SOAP-Antwort konstruiert werden soll.',
        'Response name free text' => 'Freitext für den Antwortnamen',
        'Here you can specify the maximum size (in bytes) of SOAP messages that OTRS will process.' =>
            'Hier können Sie eine Maximalgröße für SOAP-Nachrichten (in Bytes) angeben, die OTRS verarbeitet.',
        'Encoding' => 'Kodierung',
        'The character encoding for the SOAP message contents.' => 'Die Zeichenkodierung für SOAP-Nachrichteninhalte.',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => 'z. B. utf-8, latin1, iso-8859-1, cp1250, usw.',
        'SOAPAction' => 'SOAPAction',
        'Set to "Yes" to send a filled SOAPAction header.' => 'Auf "Ja" stellen, um einen befüllten SOAPAction-Header zu senden.',
        'Set to "No" to send an empty SOAPAction header.' => 'Auf "Nein" stellen, um einen leeren SOAPAction-Header zu senden.',
        'SOAPAction separator' => 'SOAPAction-Trenner',
        'Character to use as separator between name space and SOAP method.' =>
            'Trennzeichen zwischen dem Namespace und der SOAP-Methode.',
        'Usually .Net web services uses a "/" as separator.' => 'Normalerweise verwenden .Net-basierte Webservices "/" als Trenner.',
        'Proxy Server' => 'Proxy-Server',
        'URI of a proxy server to be used (if needed).' => 'URI eines Proxy-Servers (optional).',
        'e.g. http://proxy_hostname:8080' => 'z. B. http://proxy_hostname:8080',
        'Proxy User' => 'Proxy-Benutzer',
        'The user name to be used to access the proxy server.' => 'Benutzername für den Zugriff auf den Proxy-Server.',
        'Proxy Password' => 'Proxy-Passwort',
        'The password for the proxy user.' => 'Passwort des Proxy-Benutzers.',
        'The full path and name of the SSL certificate file (must be in .p12 format).' =>
            'Voller Pfad und Dateiname des SSL-Zertifikats (muss im .p12-Format vorliegen).',
        'e.g. /opt/otrs/var/certificates/SOAP/certificate.p12' => 'z. B. /opt/otrs/var/certificates/SOAP/certificate.p12',
        'The password to open the SSL certificate.' => 'Das Passwort für den Zugriff auf das SSL-Zertifikat.',
        'The full path and name of the certification authority certificate file that validates SSL certificate.' =>
            'Voller Pfad und Dateiname der Datei der Certification Authority (CA), welche das Zertifikat signiert hat.',
        'e.g. /opt/otrs/var/certificates/SOAP/CA/ca.pem' => 'z. B. /opt/otrs/var/certificates/SOAP/CA/ca.pem',
        'Certification Authority (CA) Directory' => 'Verzeichnis mit Certification Autorities (CA)',
        'The full path of the certification authority directory where the CA certificates are stored in the file system.' =>
            'Voller Pfad und Dateiname des CA-Verzeichnisses, in dem CA-Zertifikate gespeichert sind.',
        'e.g. /opt/otrs/var/certificates/SOAP/CA' => 'z. B. /opt/otrs/var/certificates/SOAP/CA',
        'Sort options' => 'Sortierungsoptionen',
        'Add new first level element' => 'Neues Element auf der obersten Ebene hinzufügen',
        'Element' => 'Element',
        'Outbound sort order for xml fields (structure starting below function name wrapper) - see documentation for SOAP transport.' =>
            'Sortierung für ausgehende XML-Felder (Struktur unterhalb des Funktionsaufrufes) - siehe Dokumentation für SOAP-Transport.',

        # Template: AdminGenericInterfaceWebservice
        'GenericInterface Web Service Management' => 'GenericInterface-Webservice-Verwaltung',
        'Add web service' => 'Webservice hinzufügen',
        'Clone web service' => 'Webservice klonen',
        'The name must be unique.' => 'Der Name muss eindeutig sein.',
        'Clone' => 'Klonen',
        'Export web service' => 'Webservice exportieren',
        'Import web service' => 'Webservice importieren',
        'Configuration File' => 'Konfigurationsdatei',
        'The file must be a valid web service configuration YAML file.' =>
            'Die Datei muss eine gültige Webservice-Konfigurationsdatei im YAML-Format sein.',
        'Import' => 'Importieren',
        'Configuration history' => 'Konfigurations-Historie',
        'Delete web service' => 'Webservice löschen',
        'Do you really want to delete this web service?' => 'Wollen Sie diesen Webservice wirklich löschen?',
        'Ready-to-run Web Services' => 'Webservices zur sofortigen Nutzung',
        'Here you can activate ready-to-run web services showcasing our best practices that are a part of %s.' =>
            'Hier können Sie Webservices zur sofortigen Nutzung aktivieren, die Teil der %s sind und nach unseren Best-Practices erstellt wurden.',
        'Please note that these web services may depend on other modules only available with certain %s contract levels (there will be a notification with further details when importing).' =>
            'Bitte beachten Sie, dass diese Webservices von anderen Modulen abhängen können, die nur in bestimmten Vertragsstufen der %s verfügbar sind (Ihnen wird beim Importieren ein entsprechender Hinweis angezeigt).',
        'Import ready-to-run web service' => 'Webservices zur sofortigen Nutzung importieren',
        'Would you like to benefit from web services created by experts? Upgrade to %s to import some sophisticated ready-to-run web services.' =>
            'Möchten Sie von Webservices profitieren, die von Experten erstellt wurden? Dann wechseln Sie auf die %s, um ausgefeilte Webservices zur sofortigen Nutzung importieren zu können.',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            'Nach dem Speichern der Konfiguration werden Sie wieder auf den Bearbeitungsbildschirm geleitet.',
        'If you want to return to overview please click the "Go to overview" button.' =>
            'Wenn Sie zurück zur Übersicht möchten, verwenden Sie bitte den Knopf "Zurück zur Übersicht"',
        'Web Service List' => 'Webservice-Liste',
        'Remote system' => 'Remote-System',
        'Provider transport' => 'Provider-Transport',
        'Requester transport' => 'Requester-Transport',
        'Debug threshold' => 'Debug-Level',
        'In provider mode, OTRS offers web services which are used by remote systems.' =>
            'Im Modus "Provider" bietet OTRS Webservices an, die von entfernten Systemen genutzt werden.',
        'In requester mode, OTRS uses web services of remote systems.' =>
            'Im Modus "Requester" nutzt OTRS selbst Webservices von entfernten Systemen.',
        'Operations are individual system functions which remote systems can request.' =>
            'Operations sind einzelne Systemfunktionen, die entfernte Systeme aufrufen können.',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            'Invoker bereiten Daten für eine Anfrage an einen entfernten Webservice auf und verarbeiten die Antwortdaten.',
        'Controller' => 'Controller',
        'Inbound mapping' => 'Eingehendes Mapping',
        'Outbound mapping' => 'Ausgehendes Mapping',
        'Delete this action' => 'Diese Aktion löschen',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            'Noch mindestens ein %s hat einen Controller, der nicht aktiv oder nicht vorhanden ist, bitte prüfen Sie die Controller-Registrierung oder löschen Sie %s',
        'Delete webservice' => 'Webservice löschen',
        'Delete operation' => 'Operation löschen',
        'Delete invoker' => 'Invoker löschen',
        'Clone webservice' => 'Webservice klonen',
        'Import webservice' => 'Webservice importieren',

        # Template: AdminGenericInterfaceWebserviceHistory
        'GenericInterface Configuration History for Web Service %s' => 'GenericInterface-Konfigurations-Historie für Webservice %s',
        'Go back to Web Service' => 'Zurück zum Webservice',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            'Hier können Sie ältere Versionen der Konfiguration dieses Webservices einsehen, exportieren oder wiederherstellen.',
        'Configuration History List' => 'Liste der Konfigurations-Historie',
        'Version' => 'Version',
        'Create time' => 'Erstellzeit',
        'Select a single configuration version to see its details.' => 'Wählen Sie eine Konfigurationsversion aus, um die Details zu sehen.',
        'Export web service configuration' => 'Webservice-Konfiguration exportieren',
        'Restore web service configuration' => 'Webservice-Konfiguration wiederherstellen',
        'Do you really want to restore this version of the web service configuration?' =>
            'Wollen Sie diese Version der Webservice-Konfiguration wirklich wiederherstellen?',
        'Your current web service configuration will be overwritten.' => 'Ihre aktuelle Konfiguration wird überschrieben.',
        'Restore' => 'Wiederherstellen',

        # Template: AdminGroup
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'VORSICHT: Wenn Sie den Namen der \'admin\'-Gruppe ändern ohne zuvor die entsprechenden Anpassungen in der SysConfig getätigt haben, verlieren Sie den Zugang zum Adminbereich! In diesem Fall sollten Sie den Gruppennamen in der Datenbank zurücksetzen.',
        'Group Management' => 'Gruppen-Verwaltung',
        'Add group' => 'Gruppe hinzufügen',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Die \'admin\'-Gruppe wird für den Admin-Bereich benötigt, die \'stats\'-Gruppe für den Statistik-Bereich.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Erstellen Sie neue Gruppen, um unterschiedliche Berechtigungen für verschiedene Agentengruppen zu realisieren (z. B. Einkauf, Produktion, Verkauf, ...).',
        'It\'s useful for ASP solutions. ' => 'Das ist nützlich für ASP-Lösungen.',
        'total' => 'gesamt',
        'Add Group' => 'Gruppe hinzufügen',
        'Edit Group' => 'Gruppe bearbeiten',

        # Template: AdminLog
        'System Log' => 'Systemprotokoll',
        'Here you will find log information about your system.' => 'Hier finden Sie Informationen zu protokollierten Systemereignissen.',
        'Hide this message' => 'Diesen Hinweis ausblenden',
        'Recent Log Entries' => 'Aktuelle Einträge im Systemprotokoll',

        # Template: AdminMailAccount
        'Mail Account Management' => 'E-Mail-Kontenverwaltung',
        'Add mail account' => 'E-Mailkonto hinzufügen',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Einkommende E-Mails von POP3-Konten werden in die ausgewählte Queue einsortiert!',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Wird dem Konto vertraut, werden die eingehenden X-OTRS Header benutzt! PostMaster Filter werden in jedem Fall verwendet.',
        'Delete account' => 'E-Mailkonto löschen',
        'Fetch mail' => 'E-Mails abholen',
        'Add Mail Account' => 'E-Mailkonto hinzufügen',
        'Example: mail.example.com' => 'Beispiel: mail.example.com',
        'IMAP Folder' => 'IMAP-Ordner',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'Ändern Sie diese Einstellung nur, wenn die Mails aus einem anderen Ordner als "INBOX" geholt werden sollen.',
        'Trusted' => 'Vertraut',
        'Dispatching' => 'Verteilung',
        'Edit Mail Account' => 'E-Mailkonto bearbeiten',

        # Template: AdminNavigationBar
        'Admin' => 'Admin',
        'Agent Management' => 'Agenten-Verwaltung',
        'Queue Settings' => 'Queue-Einstellungen',
        'Ticket Settings' => 'Ticket-Einstellungen',
        'System Administration' => 'Systemverwaltung',
        'Online Admin Manual' => 'Online-Administrationshandbuch',

        # Template: AdminNotificationEvent
        'Ticket Notification Management' => 'Verwaltung von Ticket-Benachrichtigungen',
        'Add notification' => 'Benachrichtigung hinzufügen',
        'Export Notifications' => 'Benachrichtigungen exportieren',
        'Configuration Import' => 'Konfigurationsimport',
        'Here you can upload a configuration file to import Ticket Notifications to your system. The file needs to be in .yml format as exported by the Ticket Notification module.' =>
            'Hier können Sie eine Konfigurationsdatei hochladen, mit der Ticket-Benachrichtigungen im System importiert werden können. Die Datei muss im .yml-Format vorliegen, so wie sie auch vom Ticket-Benachrichtigungsmodul exportiert wird.',
        'Overwrite existing notifications?' => 'Bestehende Benachrichtigungen überschreiben?',
        'Upload Notification configuration' => 'Benachrichtigungs-Konfiguration hochladen',
        'Import Notification configuration' => 'Benachrichtigungs-Konfiguration importieren',
        'Delete this notification' => 'Diese Benachrichtigung löschen',
        'Do you really want to delete this notification?' => 'Möchten Sie diese Benachrichtigung wirklich löschen?',
        'Add Notification' => 'Benachrichtigung hinzufügen',
        'Edit Notification' => 'Benachrichtigung bearbeiten',
        'Show in agent preferences' => 'In Agenteinstellungen anzeigen',
        'Agent preferences tooltip' => 'Kurzinfo für die persönlichen Agenten-Einstellungen',
        'This message will be shown on the agent preferences screen as a tooltip for this notification.' =>
            'Diese Nachricht wird als Kurzinfo für diese Benachrichtigung im Einstellungsbildschirm der Agenten-Einstellungen angezeigt.',
        'Here you can choose which events will trigger this notification. An additional ticket filter can be applied below to only send for ticket with certain criteria.' =>
            'Hier können Sie auswählen, welche Ereignisse diese Benachrichtigung auslösen. Ein zusätzlicher Ticket-Filter kann weiter unten eingestellt werden, um die Benachrichtigung nur für Tickets mit bestimmten Merkmalen zu versenden.',
        'Ticket Filter' => 'Ticketfilter',
        'Article Filter' => 'Artikelfilter',
        'Only for ArticleCreate and ArticleSend event' => 'Nur für die Events ArticleCreate und ArticleSend',
        'Article type' => 'Artikeltyp',
        'If ArticleCreate or ArticleSend is used as a trigger event, you need to specify an article filter as well. Please select at least one of the article filter fields.' =>
            'Wenn ArticleCreate oder ArticleSend aus auslösendes Ereignis verwendet werden, müssen Sie ebenfalls einen Artikelfilter spezifizieren. Bitte wählen Sie mindestens eins der Artikelfilterfelder aus.',
        'Article sender type' => 'Sender-Typ des Artikels',
        'Subject match' => 'Suchbegriff im Betreff',
        'Body match' => 'Suchbegriff im Text',
        'Include attachments to notification' => 'Anlagen an Benachrichtigung anfügen',
        'Recipients' => 'Empfänger',
        'Send to' => 'Senden an',
        'Send to these agents' => 'An diese Agenten senden',
        'Send to all group members' => 'An alle Gruppenmitglieder senden',
        'Send to all role members' => 'An alle Rollenmitglieder senden',
        'Send on out of office' => 'Trotz "nicht im Büro" senden',
        'Also send if the user is currently out of office.' => 'Auch senden, wenn der Benutzer nicht am Arbeitsplatz ist.',
        'Once per day' => 'Einmal pro Tag',
        'Notify user just once per day about a single ticket using a selected transport.' =>
            'Nur einmal am Tag pro Ticket und Benachrichtigungs-Transportmethode versenden.',
        'Notification Methods' => 'Benachrichtigungsoptionen',
        'These are the possible methods that can be used to send this notification to each of the recipients. Please select at least one method below.' =>
            'Dies sind die verfügbaren Methoden für den Versand der Benachrichtigungen an jeden Empfänger. Bitte wählen Sie mindestens eine Methode aus.',
        'Enable this notification method' => 'Diese Benachrichtigungsart aktivieren',
        'Transport' => 'Transport',
        'At least one method is needed per notification.' => 'Mindestens eine Methode ist für jede Benachrichtigung erforderlich.',
        'Active by default in agent preferences' => 'Standardmäßig aktiv in den Einstellungen des Agenten',
        'This is the default value for assigned recipient agents who didn\'t make a choice for this notification in their preferences yet. If the box is enabled, the notification will be sent to such agents.' =>
            'Das ist der Standardwert für zugewiesene Empfänger-Agenten, die für diese Benachrichtigung in ihren Einstellungen noch keine Auswahl getroffen haben. Wenn das Feld ausgewählt ist, wird die Benachrichtigung solchen Agenten zugestellt.',
        'This feature is currently not available.' => 'Diese Funktion ist derzeit nicht verfügbar.',
        'No data found' => 'Keine Daten gefunden',
        'No notification method found.' => 'Keine Benachrichtigungsmethode gefunden.',
        'Notification Text' => 'Benachrichtigungstext',
        'This language is not present or enabled on the system. This notification text could be deleted if it is not needed anymore.' =>
            'Diese Sprache ist im System nicht verfügbar. Der Benachrichtigungstext kann gelöscht werden, falls er nicht mehr benötigt wird.',
        'Remove Notification Language' => 'Benachrichtigungssprache entfernen',
        'Message body' => 'Nachrichteninhalt',
        'Add new notification language' => 'Neue Sprache für Benachrichtigungen hinzufügen',
        'Do you really want to delete this notification language?' => 'Möchten Sie diese Benachrichtigungssprache wirklich löschen?',
        'Tag Reference' => 'Tag-Referenz',
        'Notifications are sent to an agent or a customer.' => 'Benachrichtigungen werden an Agenten und Kunden gesendet.',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Die ersten 20 Zeichen des Betreffs (des letzten Agenten-Artikels).',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Die ersten fünf Zeilen der Nachricht (des letzten Agenten-Artikels).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Die ersten 20 Zeichen des Betreffs (des letzten Kunden-Artikels)',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Die ersten fünf Zeilen der Nachricht (des letzten Kunden-Artikels).',
        'Attributes of the current customer user data' => 'Attribute des aktuellen Kundenbenutzer-Datensatzes',
        'Attributes of the current ticket owner user data' => 'Attribute der Nutzerdaten des aktuellen Ticket-Besitzers',
        'Attributes of the current ticket responsible user data' => 'Attribute der Nutzerdaten des aktuellen Ticket-Verantwortlichem',
        'Attributes of the current agent user who requested this action' =>
            'Attribute der Benutzerdaten des Agenten, der die Aktion ausgelöst hat',
        'Attributes of the recipient user for the notification' => 'Attribute der Benutzerdaten des Empfängers der Benachrichtigung',
        'Attributes of the ticket data' => 'Attribute der Ticketdaten',
        'Ticket dynamic fields internal key values' => 'Interne Schlüssel der dynamischen Felder des Tickets',
        'Ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Anzeigewerte der dynamischen Felder des Tickets, verwendbar für Auswahlfelder',
        'Example notification' => 'Beispiel-Benachrichtigung',

        # Template: AdminNotificationEventTransportEmailSettings
        'Additional recipient email addresses' => 'Zusätzliche Empfänger-E-Mail-Adressen',
        'You can use OTRS-tags like <OTRS_TICKET_DynamicField_...> to insert values from the current ticket.' =>
            'Sie können OTRS-Tags wie <OTRS_TICKET_DynamicField_...> nutzen, um Werte des aktuellen Tickets einzufügen.',
        'Notification article type' => 'Artikeltyp der Benachrichtigung',
        'An article will be created if the notification is sent to the customer or an additional email address.' =>
            'Ein Artikel wird erstellt, wenn die Benachrichtigung an den Kunden oder an eine zusätzliche E-Mail-Adresse versendet wird.',
        'Email template' => 'E-Mail-Vorlage',
        'Use this template to generate the complete email (only for HTML emails).' =>
            'Benutze diese Vorlage, um die komplette E-Mail zu generieren (nur für HTML-E-Mails).',
        'Enable email security' => 'E-Mail-Sicherheit aktivieren',
        'Email security level' => 'E-Mail-Sicherheitsstufe',
        'If signing key/certificate is missing' => 'Wenn Schlüssel/Zertifikat zum Signieren fehlen',
        'If encryption key/certificate is missing' => 'Wenn Schlüssel/Zertifikat zum Verschlüsseln fehlen',

        # Template: AdminOTRSBusinessInstalled
        'Manage %s' => ' %s verwalten',
        'Downgrade to OTRS Free' => 'Zu OTRS Free downgraden',
        'Read documentation' => 'Dokumentation lesen',
        '%s makes contact regularly with cloud.otrs.com to check on available updates and the validity of the underlying contract.' =>
            '%s kontaktiert regelmäßig cloud.otrs.com, um die Verfügbarkeit von Updates und die Gültigkeit des zugrundeliegenden Vertrages zu prüfen.',
        'Unauthorized Usage Detected' => 'Unerlaubte Nutzung festgestellt',
        'This system uses the %s without a proper license! Please make contact with %s to renew or activate your contract!' =>
            'Sie verwenden die %s ohne eine gültige Nutzungsvereinbarung mit der OTRS AG. Bitte kontaktieren Sie umgehend %s! ',
        '%s not Correctly Installed' => '%s ist nicht korrekt installiert',
        'Your %s is not correctly installed. Please reinstall it with the button below.' =>
            'Ihre %s ist nicht korrekt installiert. Bitte re-installieren Sie sie durch Klick auf den nachfolgenden Button.',
        'Reinstall %s' => '%s erneut installieren',
        'Your %s is not correctly installed, and there is also an update available.' =>
            'Ihre %s ist nicht korrekt installiert, außerdem ist ein Update verfügbar.',
        'You can either reinstall your current version or perform an update with the buttons below (update recommended).' =>
            'Sie können Ihre derzeitige Version entweder re-installieren, oder ein Update durchführen (empfohlen).',
        'Update %s' => '%s aktualisieren',
        '%s Not Yet Available' => '%s ist noch nicht verfügbar',
        '%s will be available soon.' => '%s wird bald verfügbar sein.',
        '%s Update Available' => '%s-Aktualisierung verfügbar',
        'An update for your %s is available! Please update at your earliest!' =>
            'Es ist ein Update für Ihre %s verfügbar! Um alle Vorteile nutzen zu können, führen Sie bitte die Aktualisierung zeitnah durch!  ',
        '%s Correctly Deployed' => '%s korrekt installiert',
        'Congratulations, your %s is correctly installed and up to date!' =>
            'Gratulation, Ihre %s ist korrekt installiert und auf einem aktuellen Stand!',

        # Template: AdminOTRSBusinessNotInstalled
        '%s will be available soon. Please check again in a few days.' =>
            'Die %s wird bald verfügbar sein. Bitte prüfen Sie in einigen Tagen erneut.',
        'Please have a look at %s for more information.' => 'Weitere Informationen können Sie unter %s finden.',
        'Your OTRS Free is the base for all future actions. Please register first before you continue with the upgrade process of %s!' =>
            'Bitte registrieren Sie Ihr OTRS Free zunächst, wenn Sie mit dem Upgrade auf die %s fortfahren möchten!',
        'Before you can benefit from %s, please contact %s to get your %s contract.' =>
            'Bevor Sie von %s profitieren können, kontaktieren Sie bitte %s um ihren %s-Vertrag zu erhalten.',
        'Connection to cloud.otrs.com via HTTPS couldn\'t be established. Please make sure that your OTRS can connect to cloud.otrs.com via port 443.' =>
            'Es konnte keine Verbindung mit cloud.otrs.com hergestellt werden. Bitte stellen Sie sicher, dass Ihr OTRS über Port 443 mit cloud.otrs.com kommunizieren kann.',
        'With your existing contract you can only use a small part of the %s.' =>
            'Ihr laufender Vertrag ermöglicht Ihnen zur Zeit nur einen eingeschränkten Zugang zu unserer %s.',
        'If you would like to take full advantage of the %s get your contract upgraded now! Contact %s.' =>
            'Mit einem Upgrade Ihres Vertrages kommen Sie in den Genuss der kompletten %s und profitieren von allen Vorteilen! Kontaktieren Sie %s.',

        # Template: AdminOTRSBusinessUninstall
        'Cancel downgrade and go back' => 'Downgrade abbrechen und zurück',
        'Go to OTRS Package Manager' => 'Zum OTRS Paket-Manager wechseln',
        'Sorry, but currently you can\'t downgrade due to the following packages which depend on %s:' =>
            'Entschuldigung, Sie können ein Downgrade derzeit aufgrund folgender, zu %s abhängiger Pakete nicht durchführen:',
        'Vendor' => 'Anbieter',
        'Please uninstall the packages first using the package manager and try again.' =>
            'Bitte entfernen Sie diese Pakete zunächst und versuchen Sie es nochmals.',
        'You are about to downgrade to OTRS Free and will lose the following features and all data related to these:' =>
            'Wenn Sie zu OTRS Free downgraden, werden Sie die folgenden Features (und alle zugehörigen Daten) verlieren:',
        'Chat' => 'Chat',
        'Report Generator' => 'Berichtgenerator',
        'Timeline view in ticket zoom' => 'Timeline-View im Ticket-Zoom',
        'DynamicField ContactWithData' => 'DynamischesFeld KontaktMitDaten',
        'DynamicField Database' => 'DynamischesFeld Datenbank',
        'SLA Selection Dialog' => 'SLA-Auswahldialog',
        'Ticket Attachment View' => 'Ticket-Anlagenansicht',
        'The %s skin' => 'Den %s-Skin',

        # Template: AdminPGP
        'PGP Management' => 'PGP-Verwaltung',
        'PGP support is disabled' => 'Unterstützung für PGP ist deaktiviert',
        'To be able to use PGP in OTRS, you have to enable it first.' => 'Um PGP in OTRS verwenden zu können, müssen Sie es zuerst aktivieren.',
        'Enable PGP support' => 'PGP-Unterstützung aktivieren',
        'Faulty PGP configuration' => 'Fehlerhafte PGP-Konfiguration',
        'PGP support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'PGP-Unterstützung ist aktiviert, aber die Konfiguration ist fehlerhaft. Bitte überprüfen Sie die Konfiguration mit dem untenstehenden Knopf.',
        'Configure it here!' => 'Hier konfigurieren!',
        'Check PGP configuration' => 'PGP-Konfiguration überprüfen',
        'Add PGP key' => 'PGP-Schlüssel hinzufügen',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'Über diesen Weg kann man den Schlüsselring (konfiguriert in SysConfig) direkt bearbeiten.',
        'Introduction to PGP' => 'Einführung zu PGP',
        'Result' => 'Ergebnis',
        'Identifier' => 'Identifikator',
        'Bit' => 'Bit',
        'Fingerprint' => 'Fingerabdruck',
        'Expires' => 'Erlischt',
        'Delete this key' => 'Diesen Schlüssel löschen',
        'Add PGP Key' => 'PGP-Schlüssel hinzufügen',
        'PGP key' => 'PGP-Schlüssel',

        # Template: AdminPackageManager
        'Package Manager' => 'Paket-Verwaltung',
        'Uninstall package' => 'Paket deinstallieren',
        'Do you really want to uninstall this package?' => 'Soll das Paket wirklich deinstalliert werden?',
        'Reinstall package' => 'Paket erneut installieren',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'Möchten Sie dieses Paket wirklich erneut installieren? Alle manuellen Änderungen gehen verloren.',
        'Continue' => 'Weiter',
        'Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Stellen Sie sicher, dass Ihre Datenbank Pakete über %s MB akzeptiert (Derzeit werden nur Pakete bis %s MB akzeptiert). Bitte passen Sie die Einstellung max_allowed_packet Ihrer Datenbank-Konfiguration an, um Fehler zu vermeiden.',
        'Install' => 'Installieren',
        'Install Package' => 'Paket installieren',
        'Update repository information' => 'Verzeichnis aktualisieren',
        'Cloud services are currently disabled.' => 'Cloud-Services sind derzeit deaktiviert.',
        'OTRS Verify™ can not continue!' => 'OTRS Verify™ kann nicht fortgesetzt werden!',
        'Enable cloud services' => 'Cloud-Services aktivieren',
        'Online Repository' => 'Online-Verzeichnis',
        'Module documentation' => 'Moduldokumentation',
        'Upgrade' => 'Upgrade',
        'Local Repository' => 'Lokales Verzeichnis',
        'This package is verified by OTRSverify (tm)' => 'Dieses Paket wurde von OTRSVerify (tm) geprüft',
        'Uninstall' => 'Deinstallieren',
        'Reinstall' => 'Erneut installieren',
        'Features for %s customers only' => 'Exklusiv: Features für %s Kunden',
        'With %s, you can benefit from the following optional features. Please make contact with %s if you need more information.' =>
            'Mit %s können Sie von den nachfolgenden optionalen Features profitieren. Bitte kontaktieren Sie %s, wenn Sie weitere Informationen benötigen.',
        'Download package' => 'Paket herunterladen',
        'Rebuild package' => 'Paket neu aufbauen (rebuild)',
        'Metadata' => 'Metadaten',
        'Change Log' => 'Änderungsprotokoll',
        'Date' => 'Datum',
        'List of Files' => 'Dateiliste',
        'Permission' => 'Rechte',
        'Download' => 'Herunterladen',
        'Download file from package!' => 'Datei aus dem Paket herunterladen!',
        'Required' => 'Benötigt',
        'Primary Key' => 'Primärer Schlüssel',
        'Auto Increment' => 'Automatisch erhöhen',
        'SQL' => 'SQL',
        'File differences for file %s' => 'Dateiunterschiede für Datei %s',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Performance Log',
        'This feature is enabled!' => 'Dieses Feature ist aktiv!',
        'Just use this feature if you want to log each request.' => 'Nur aktivieren, wenn jede Anfrage protokolliert werden soll.',
        'Activating this feature might affect your system performance!' =>
            'Bitte beachten Sie, dass das Aktivieren dieser Funktion Performance-Einbußen zur Folge haben kann.',
        'Disable it here!' => 'Hier deaktivieren!',
        'Logfile too large!' => 'Logdatei zu groß!',
        'The logfile is too large, you need to reset it' => 'Die Logdatei ist zu groß, sie muss zurückgesetzt werden',
        'Overview' => 'Übersicht',
        'Range' => 'Bereich',
        'last' => 'letzten',
        'Interface' => 'Interface',
        'Requests' => 'Anfragen',
        'Min Response' => 'Min. Antwortzeit',
        'Max Response' => 'Max. Antwortzeit',
        'Average Response' => 'Durchschnittliche Antwortzeit',
        'Period' => 'Zeitraum',
        'Min' => 'Min',
        'Max' => 'Max',
        'Average' => 'Durchschnitt',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'PostMaster-Filter-Verwaltung',
        'Add filter' => 'Filter hinzufügen',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Einkommende Mails anhand von E-Mail-Kopfzeilen verteilen oder filtern. Für die Suche können auch reguläre Ausdrücke benutzt werden.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Wenn nur eine E-Mail-Adresse gesucht wird, dann benutzen Sie EMAILADDRESS:info@example.com in From, To oder Cc.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Wenn Sie reguläre Ausdrücke verwenden, können Sie die gefundenen Werte in () auch als [***] in der Aktion "Setzen" verwenden.',
        'Delete this filter' => 'Diesen Filter löschen',
        'Do you really want to delete this filter?' => 'Möchten Sie diesen Filter wirklich löschen?',
        'Add PostMaster Filter' => 'PostMaster-Filter hinzufügen',
        'Edit PostMaster Filter' => 'PostMaster-Filter bearbeiten',
        'The name is required.' => 'Der Name ist erforderlich.',
        'Filter Condition' => 'Filterbedingung',
        'AND Condition' => 'UND-Bedingung',
        'Check email header' => 'Zu überprüfender E-Mail Header',
        'Negate' => 'Negieren',
        'Look for value' => 'Nach dem Wert suchen',
        'The field needs to be a valid regular expression or a literal word.' =>
            'Dieses Feld sollte einen gültigen regulären Ausdruck oder ein Wort enthalten.',
        'Set Email Headers' => 'E-Mail-Kopfzeilen setzen',
        'Set email header' => 'Setze E-Mai-Kopfzeile',
        'Set value' => 'Setze Wert',
        'The field needs to be a literal word.' => 'Dieses Feld sollte ein Wort enthalten.',

        # Template: AdminPriority
        'Priority Management' => 'Prioritäten-Verwaltung',
        'Add priority' => 'Priorität hinzufügen',
        'Add Priority' => 'Priorität hinzufügen',
        'Edit Priority' => 'Priorität bearbeiten',

        # Template: AdminProcessManagement
        'Process Management' => 'Prozess-Management',
        'Filter for Processes' => 'Filter für Prozesse',
        'Create New Process' => 'Neuen Prozess erstellen',
        'Deploy All Processes' => 'Alle Prozesse speichern',
        'Here you can upload a configuration file to import a process to your system. The file needs to be in .yml format as exported by process management module.' =>
            'Hier können Sie eine Konfigurationdatei hochladen, um einen Prozess in Ihr System zu importieren. Die Datei muss im YAML-Format vorliegen, so wie sie vom Prozessmanagement auch exportiert wird.',
        'Overwrite existing entities' => 'Bestehende Einträge überschreiben',
        'Upload process configuration' => 'Prozesskonfiguration hochladen',
        'Import process configuration' => 'Prozesskonfiguration importieren',
        'Ready-to-run Processes' => 'Lauffähige Prozesse',
        'Here you can activate ready-to-run processes showcasing our best practices. Please note that some additional configuration may be required.' =>
            'Hier können Sie von uns erstellte lauffähige Prozesse zur Demonstration aktivieren. Bitte beachten Sie, dass eventuell weitere Einstellungen erforderlich sind.',
        'Would you like to benefit from processes created by experts? Upgrade to %s to import some sophisticated ready-to-run processes.' =>
            'Möchten Sie von Prozessen profitieren, die von Experten erstellt wurden? Dann wechseln Sie auf die %s, um ausgefeilte Prozesse zur sofortigen Nutzung importieren zu können.',
        'Import ready-to-run process' => 'Prozess zur sofortigen Nutzung importieren',
        'To create a new Process you can either import a Process that was exported from another system or create a complete new one.' =>
            'Um einen neuen Prozess zu erstellen, können Sie entweder einen Prozess aus einem anderen System importieren, oder einen ganz neuen erstellen.',
        'Changes to the Processes here only affect the behavior of the system, if you synchronize the Process data. By synchronizing the Processes, the newly made changes will be written to the Configuration.' =>
            'Änderungen an den Prozessen wirken sich erst dann aus, wenn Sie die Prozesskonfiguration synchronisieren. Dabei werden alle Änderungen in die Systemkonfiguration übernommen.',
        'Processes' => 'Prozesse',
        'Process name' => 'Prozessname',
        'Print' => 'Drucken',
        'Export Process Configuration' => 'Prozesskonfiguration exportieren',
        'Copy Process' => 'Prozess kopieren',

        # Template: AdminProcessManagementActivity
        'Cancel & close' => 'Abbrechen und Beenden',
        'Go Back' => 'Zurück',
        'Please note, that changing this activity will affect the following processes' =>
            'Achtung: Änderungen an dieser Aktivität werden sich auf folgende Prozesse auswirken',
        'Activity' => 'Aktivität',
        'Activity Name' => 'Name der Aktivität',
        'Activity Dialogs' => 'Aktivitäts-Dialoge',
        'You can assign Activity Dialogs to this Activity by dragging the elements with the mouse from the left list to the right list.' =>
            'Sie können Aktivitäts-Dialoge dieser Aktivität zuweisen, indem Sie die Elemente mit der Maus aus der linken Liste in die rechte Liste verschieben.',
        'Ordering the elements within the list is also possible by drag \'n\' drop.' =>
            'Die Elemente können auch durch Verschieben mit der Maus geordnet werden.',
        'Filter available Activity Dialogs' => 'Verfügbare Aktivitäts-Dialoge filtern',
        'Available Activity Dialogs' => 'Verfügbare Aktivitäts-Dialoge',
        'Name: %s, EntityID: %s' => 'Name: %s, EntityID: %s',
        'Create New Activity Dialog' => 'Neuen Aktivitäts-Dialog erstellen',
        'Assigned Activity Dialogs' => 'Zugewiesene Aktivitäts-Dialoge',
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?' =>
            'Sobald sie den Knopf oder den Link verwenden, verlassen Sie dieses Fenster, und der aktuelle Stand wird automatisch gespeichert. Möchten Sie fortfahren?',

        # Template: AdminProcessManagementActivityDialog
        'Please note that changing this activity dialog will affect the following activities' =>
            'Veränderungen an diesem Aktivitäts-Dialog werden sich auf folgende Aktivitäten auswirken',
        'Please note that customer users will not be able to see or use the following fields: Owner, Responsible, Lock, PendingTime and CustomerID.' =>
            'Bitte beachten Sie, dass Kundenbenutzer die folgenden Felder nicht sehen oder benutzen können: Besitzer (Owner), Verantwortlicher (Responsible), Sperre (Lock), Warten bis (PendingTime) und Kundennummer (CustomerID).',
        'The Queue field can only be used by customers when creating a new ticket.' =>
            'Das Queue-Feld kann nur von Kunden ausgewählt werden, wenn diese ein neues Ticket erstellen.',
        'Activity Dialog' => 'Aktivitäts-Dialog',
        'Activity dialog Name' => 'Name des Aktivitäts-Dialogs',
        'Available in' => 'Verfügbar in',
        'Description (short)' => 'Beschreibung (kurz)',
        'Description (long)' => 'Beschreibung (lang)',
        'The selected permission does not exist.' => 'Die ausgewählte Berechtigung existiert nicht.',
        'Required Lock' => 'Erforderliche Sperre',
        'The selected required lock does not exist.' => 'Die ausgewählte Sperre existiert nicht.',
        'Submit Advice Text' => 'Hinweistext beim Absenden',
        'Submit Button Text' => 'Hinweistext für den Absendeknopf',
        'Fields' => 'Felder',
        'You can assign Fields to this Activity Dialog by dragging the elements with the mouse from the left list to the right list.' =>
            'Sie können diesem Aktivitäts-Dialog Felder zuweisen, indem Sie sie mit der Maus aus der rechten Liste in die linke Liste verschieben.',
        'Filter available fields' => 'Verfügbare Felder filtern',
        'Available Fields' => 'Verfügbare Felder',
        'Name: %s' => 'Name: %s',
        'Assigned Fields' => 'Zugewiesene Felder',
        'ArticleType' => 'Artikeltyp',
        'Display' => 'Anzeige',
        'Edit Field Details' => 'Feld-Details bearbeiten',
        'Customer interface does not support internal article types.' => 'Die Kundenoberfläche unterstützt keine internen Artikeltypen.',

        # Template: AdminProcessManagementPath
        'Path' => 'Pfad',
        'Edit this transition' => 'Diesen Übergang bearbeiten',
        'Transition Actions' => 'Übergangs-Aktionen',
        'You can assign Transition Actions to this Transition by dragging the elements with the mouse from the left list to the right list.' =>
            'Die können diesem Übergang Übergangs-Aktionen zuweisen, indem Sie sie mit der Maus aus der rechten Liste in die linke Liste verschieben.',
        'Filter available Transition Actions' => 'Verfügbare Übergangs-Aktionen filtern',
        'Available Transition Actions' => 'Verfügbare Übergangs-Aktionen',
        'Create New Transition Action' => 'Neue Übergangs-Aktion erstellen',
        'Assigned Transition Actions' => 'Zugewiesene Übergangs-Aktionen',

        # Template: AdminProcessManagementProcessAccordion
        'Activities' => 'Aktivitäten',
        'Filter Activities...' => 'Aktivitäten filtern...',
        'Create New Activity' => 'Neue Aktivität erstellen',
        'Filter Activity Dialogs...' => 'Aktivitäts-Dialoge filtern...',
        'Transitions' => 'Übergänge',
        'Filter Transitions...' => 'Übergänge filtern...',
        'Create New Transition' => 'Neuen Übergang erstellen',
        'Filter Transition Actions...' => 'Übergangs-Aktionen filtern...',

        # Template: AdminProcessManagementProcessEdit
        'Edit Process' => 'Prozess bearbeiten',
        'Print process information' => 'Prozess-Informationen drucken',
        'Delete Process' => 'Prozess löschen',
        'Delete Inactive Process' => 'Inaktiven Prozess löschen',
        'Available Process Elements' => 'Verfügbare Prozess-Elemente',
        'The Elements listed above in this sidebar can be moved to the canvas area on the right by using drag\'n\'drop.' =>
            'Die in der Seitenleiste aufgelisteten Elemente können mit der Maus in den Zeichenbereich gezogen werden.',
        'You can place Activities on the canvas area to assign this Activity to the Process.' =>
            'Sie können Aktivitäten im Zeichenbereich platzieren, um diese Aktivitäten dem Prozess zuzuordnen.',
        'To assign an Activity Dialog to an Activity drop the Activity Dialog element from this sidebar over the Activity placed in the canvas area.' =>
            'Aktivitäts-Dialoge können Sie einer Aktivität zuweisen, indem Sie diese aus der Seitenleiste über die Aktivität im Zeichenbereich ziehen.',
        'You can start a connection between two Activities by dropping the Transition element over the Start Activity of the connection. After that you can move the loose end of the arrow to the End Activity.' =>
            '',
        'Actions can be assigned to a Transition by dropping the Action Element onto the label of a Transition.' =>
            'Aktionen können einem Übergang zugeweisen werden, indem Sie das Aktionselement auf den Namen des Übergangs ziehen.',
        'Edit Process Information' => 'Prozess-Informationen bearbeiten',
        'Process Name' => 'Prozessname',
        'The selected state does not exist.' => 'Der ausgewählte Status existiert nicht.',
        'Add and Edit Activities, Activity Dialogs and Transitions' => 'Aktivitäten, Aktivitäts-Dialoge und Übergänge hinzufügen und bearbeiten',
        'Show EntityIDs' => 'EntityIDs einblenden',
        'Extend the width of the Canvas' => 'Die Breite der Zeichenfläche vergrößern',
        'Extend the height of the Canvas' => 'Die Höhe der Zeichenfläche vergrößern',
        'Remove the Activity from this Process' => 'Aktivität aus diesem Prozess entfernen',
        'Edit this Activity' => 'Diese Aktivität bearbeiten',
        'Save Activities, Activity Dialogs and Transitions' => 'Aktivitäten, Aktivitätsdialoge und Übergänge speichern',
        'Do you really want to delete this Process?' => 'Möchten Sie diesen Prozess wirklich löschen?',
        'Do you really want to delete this Activity?' => 'Möchten Sie diese Aktivität wirklich löschen?',
        'Do you really want to delete this Activity Dialog?' => 'Möchten Sie diesen Aktivitäts-Dialog wirklich löschen?',
        'Do you really want to delete this Transition?' => 'Möchten Sie diesen Übergang wirklich löschen?',
        'Do you really want to delete this Transition Action?' => 'Möchten Sie diese Übergangs-Aktion wirklich löschen?',
        'Do you really want to remove this activity from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Möchten Sie diese Aktivität wirklich von der Zeichenfläche entfernen? Das kann nur rückgängig gemacht werden, wenn Sie dieses Fenster ohne Speichern verlassen.',
        'Do you really want to remove this transition from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Möchten Sie diesen Übergang wirklich von der Zeichenfläche entfernen? Das kann nur rückgängig gemacht werden, wenn Sie dieses Fenster ohne Speichern verlassen.',
        'Hide EntityIDs' => 'EntityIDs ausblenden',
        'Delete Entity' => 'Eintrag löschen',
        'Remove Entity from canvas' => 'Eintrag entfernen',
        'This Activity is already used in the Process. You cannot add it twice!' =>
            'Diese Aktivität wird bereits im Prozess verwendet. Sie können sie nicht erneut hinzufügen!',
        'This Activity cannot be deleted because it is the Start Activity.' =>
            'Diese Aktivität kann nicht gelöscht werden, weil sie die Start-Aktivität ist.',
        'This Transition is already used for this Activity. You cannot use it twice!' =>
            'Dieser Übergang wird bereits für diese Aktiviät verwendet. Sie können ihn nicht erneut hinzufügen!',
        'This TransitionAction is already used in this Path. You cannot use it twice!' =>
            'Diese Übergangsaktion wird bereits in diesem Pfad verwendet. Sie können sie nicht erneut hinzufügen!',
        'Remove the Transition from this Process' => 'Diesen Übergang aus dem Prozess entfernen',
        'No TransitionActions assigned.' => 'Keine Übergangsaktionen zugewiesen.',
        'The Start Event cannot loose the Start Transition!' => 'Das Startereignis kann den Start-Übergang nicht verlieren.',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.' =>
            'Es sind noch keine Dialoge zugewiesen. Wählen Sie einfach einen Aktivitäts-Dialog in der linken Liste aus und ziehen Sie ihn in die rechte Liste.',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.' =>
            'Auf der Zeichenfläche ist ein nicht verbundener Übergang vorhanden. Bitte verbinden Sie diesen Übergang zuerst, bevor Sie einen weiteren Übergang platzieren.',

        # Template: AdminProcessManagementProcessNew
        'In this screen, you can create a new process. In order to make the new process available to users, please make sure to set its state to \'Active\' and synchronize after completing your work.' =>
            'Hier können Sie einen neuen Prozess erstellen. Um ihn für die Benutzer verfügbar zu machen, sollten Sie seinen Status auf "Aktiv" setzen und als Abschluss Ihrer Arbeit die Synchronisation durchführen.',

        # Template: AdminProcessManagementProcessPrint
        'cancel & close' => 'Abbrechen & schließen',
        'Start Activity' => 'Start-Aktivität',
        'Contains %s dialog(s)' => 'Enthält %s Dialog(e)',
        'Assigned dialogs' => 'Zugewiesene Dialoge',
        'Activities are not being used in this process.' => 'In diesem Prozess werden keine Aktivitäten verwendet.',
        'Assigned fields' => 'Zugewiesene Felder',
        'Activity dialogs are not being used in this process.' => 'In diesem Prozess werden keine Aktivitäts-Dialoge verwendet.',
        'Condition linking' => 'Verknüpfung der Bedingungen',
        'Conditions' => 'Bedingungen',
        'Condition' => 'Bedingung',
        'Transitions are not being used in this process.' => 'In diesem Prozess werden keine Übergänge verwendet.',
        'Module name' => 'Modulname',
        'Transition actions are not being used in this process.' => 'In diesem Prozess werden keine Übergangs-Aktionen verwendet.',

        # Template: AdminProcessManagementTransition
        'Please note that changing this transition will affect the following processes' =>
            'Achtung: Änderungen an diesem Übergang wirken sich auf folgende Prozesse aus',
        'Transition' => 'Übergang',
        'Transition Name' => 'Name des Übergangs',
        'Conditions can only operate on non-empty fields.' => 'Bedingungen können nur Felder prüfen, die nicht leer sind.',
        'Type of Linking between Conditions' => 'Verknüpfung zwischen den Bedingungen',
        'Remove this Condition' => 'Bedingung entfernen',
        'Type of Linking' => 'Typ der Verknüpfung',
        'Add a new Field' => 'Neues Feld hinzufügen',
        'Remove this Field' => 'Feld entfernen',
        'And can\'t be repeated on the same condition.' => 'Und können nicht innerhalb derselben Abfrage verwendet werden.',
        'Add New Condition' => 'Neue Bedingung hinzufügen',

        # Template: AdminProcessManagementTransitionAction
        'Please note that changing this transition action will affect the following processes' =>
            'Achtung: Änderungen an dieser Übergangs-Aktion wirken sich auf folgende Prozesse aus',
        'Transition Action' => 'Übergangs-Aktion',
        'Transition Action Name' => 'Name der Übergangs-Aktion',
        'Transition Action Module' => 'Übergangs-Aktionsmodul',
        'Config Parameters' => 'Konfigurations-Parameter',
        'Add a new Parameter' => 'Neuen Parameter hinzufügen',
        'Remove this Parameter' => 'Parameter entfernen',

        # Template: AdminQueue
        'Manage Queues' => 'Queue-Verwaltung',
        'Add queue' => 'Queue hinzufügen',
        'Add Queue' => 'Queue hinzufügen',
        'Edit Queue' => 'Queue bearbeiten',
        'A queue with this name already exists!' => 'Eine Queue mit diesem Namen ist bereits vorhanden!',
        'Sub-queue of' => 'Unter-Queue von',
        'Unlock timeout' => 'Freigabe-Zeitintervall',
        '0 = no unlock' => '0 = keine Freigabe',
        'Only business hours are counted.' => 'Nur Geschäftszeiten werden berücksichtigt.',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Wenn ein Agent ein Ticket sperrt und es vor der Entsperrzeit nicht schließt, wird es entsperrt und wieder für andere Agenten verfügbar gemacht.',
        'Notify by' => 'Benachrichtigung durch',
        '0 = no escalation' => '0 = keine Eskalation',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Wenn vor der definierten Zeit keine Kundenreaktion erfolgt (email-external oder phone), eskaliert das Ticket.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Wenn ein Artikel vom Kunden hinzugefügt wird, wird die Eskalationszeit zurückgesetzt. Wenn vor der definierten Zeit keine Kundenreaktion erfolgt, eskaliert das Ticket.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Wenn ein Ticket nicht vor der definierten Zeit geschlossen wird, eskaliert es.',
        'Follow up Option' => 'Nachfrage-Option',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Gibt an, ob eine Rückmeldung zu einem geschlossenen Ticket diese Ticket erneut öffnet, abgelehnt wird oder zu einem neuen Ticket führt.',
        'Ticket lock after a follow up' => 'Ticket sperren nach einer Rückmeldung',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Wenn ein Ticket geschlossen wird und der Kunde eine Rückmeldung schickt, wird es für den letzten Besitzer gesperrt.',
        'System address' => 'Systemadresse',
        'Will be the sender address of this queue for email answers.' => 'Absenderadresse für E-Mails aus dieser Queue.',
        'Default sign key' => 'Standardschlüssel zum Signieren',
        'The salutation for email answers.' => 'Die Anrede für E-Mail-Antworten.',
        'The signature for email answers.' => 'Die Signatur für E-Mail-Antworten.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => 'Zuordnung von Queues und automatischen Antworten verwalten',
        'This filter allow you to show queues without auto responses' => 'Dieser Filter erlaubt das Anzeigen von Queues ohne Automatische Antworten',
        'Queues without auto responses' => 'Queues ohne automatische Antworten',
        'This filter allow you to show all queues' => 'Dieser Filter erlaubt das Anzeigen aller Queues',
        'Show all queues' => 'Alle Queues anzeigen',
        'Filter for Queues' => 'Filter für Queues',
        'Filter for Auto Responses' => 'Filter für automatische Antworten',
        'Auto Responses' => 'Automatische Antworten',
        'Change Auto Response Relations for Queue' => 'Auto-Antwort-Zuordnungen verändern für Queue',

        # Template: AdminQueueTemplates
        'Manage Template-Queue Relations' => 'Zuordnung von Vorlagen zu Queues verwalten',
        'Filter for Templates' => 'Filter für Vorlagen',
        'Templates' => 'Vorlagen',
        'Change Queue Relations for Template' => 'Zuordnung von Vorlage zu Queue verändern',
        'Change Template Relations for Queue' => 'Vorlagen-Zuordnungen für Queue verändern',

        # Template: AdminRegistration
        'System Registration Management' => 'Systemregistrierungs-Verwaltung',
        'Edit details' => 'Details bearbeiten',
        'Show transmitted data' => 'Übertragene Daten anzeigen',
        'Deregister system' => 'System deregistrieren',
        'Overview of registered systems' => 'Übersicht der registrieren Systeme',
        'This system is registered with OTRS Group.' => 'Dieses System ist bei der OTRS Gruppe registriert.',
        'System type' => 'System Typ',
        'Unique ID' => 'Unique ID',
        'Last communication with registration server' => 'Letzte Kommunikation mit dem Registrierungsserver',
        'System registration not possible' => 'Systemregistrierung nicht möglich',
        'Please note that you can\'t register your system if OTRS Daemon is not running correctly!' =>
            'Bitte beachten Sie, dass Sie ihr System nicht registrieren können, wenn der OTRS Daemon nicht läuft!',
        'Instructions' => 'Anweisungen',
        'System deregistration not possible' => 'Deregistrierung des Systems nicht möglich',
        'Please note that you can\'t deregister your system if you\'re using the %s or having a valid service contract.' =>
            'Sie können dieses System nicht deregistrieren wenn Sie %s einsetzen oder einen gültigen Servicevertrag besitzen.',
        'OTRS-ID Login' => 'OTRS-ID Login',
        'Read more' => 'Mehr erfahren',
        'You need to log in with your OTRS-ID to register your system.' =>
            'Um Ihr System zu registrieren, loggen Sie sich bitte mit Ihrer OTRS-ID ein.',
        'Your OTRS-ID is the email address you used to sign up on the OTRS.com webpage.' =>
            'Verwenden Sie dazu die E-Mail-Adresse, mit der Sie sich auf der OTRS Webseite angemeldet haben.',
        'Data Protection' => 'Datenschutz',
        'What are the advantages of system registration?' => 'Welche Vorteile bietet die Systemregistrierung?',
        'You will receive updates about relevant security releases.' => 'Bei sicherheitsrelevanten Releases werden Sie benachrichtigt.',
        'With your system registration we can improve our services for you, because we have all relevant information available.' =>
            'Die Registrierung Ihres Systems ermöglicht es der OTRS Gruppe, Sie schneller und effizienter zu betreuen, weil uns wichtige Informationen über Ihr System bereits vorliegen, die ein mehrmaliges Nachfragen unnötig machen.',
        'This is only the beginning!' => 'Und das ist erst der Anfang!',
        'We will inform you about our new services and offerings soon.' =>
            'Seien Sie gespannt auf weitere Möglichkeiten, die wir Ihnen vorstellen werden.',
        'Can I use OTRS without being registered?' => 'Kann ich OTRS auch ohne Registrierung nutzen?',
        'System registration is optional.' => 'Die Systemregistrierung ist optional.',
        'You can download and use OTRS without being registered.' => 'Sie können OTRS auch ohne Registrierung im vollen Umfang downloaden und nutzen.',
        'Is it possible to deregister?' => 'Kann ich meine Registrierung rückgängig machen?',
        'You can deregister at any time.' => 'Sie können Ihr System jederzeit deregistrieren.',
        'Which data is transfered when registering?' => 'Welche Daten werden bei der Registrierung übertragen?',
        'A registered system sends the following data to OTRS Group:' => 'Ein registriertes System überträgt folgende Daten an die OTRS Gruppe:',
        'Fully Qualified Domain Name (FQDN), OTRS version, Database, Operating System and Perl version.' =>
            'Fully Qualified Domain Name (FQDN), OTRS Version, Datenbank, Betriebssystem und Perl Version.',
        'Why do I have to provide a description for my system?' => 'Warum muss das System beschrieben werden?',
        'The description of the system is optional.' => 'Die Beschreibung des Systems ist optional.',
        'The description and system type you specify help you to identify and manage the details of your registered systems.' =>
            'Der Systemtyp und die Beschreibung hilft Ihnen, Ihre Systeme zu identifizieren und die Systemregistrierung zu verwalten.',
        'How often does my OTRS system send updates?' => 'Wie oft sendet mein OTRS Updates?',
        'Your system will send updates to the registration server at regular intervals.' =>
            'Ihr System sendet in regelmäßigen Abständen Updates an den Registrierungsserver.',
        'Typically this would be around once every three days.' => 'In der Regel findet eine Übertragung an jedem dritten Tag statt.',
        'In case you would have further questions we would be glad to answer them.' =>
            'Sollten Sie weitere Fragen haben, freuen wir uns, diese zu beantworten.',
        'Please visit our' => 'Besuchen Sie einfach unser',
        'portal' => 'Portal,',
        'and file a request.' => 'um eine Anfrage zu stellen.',
        'If you deregister your system, you will lose these benefits:' =>
            'Wenn Sie ihre Systemregistrierung löschen, verlieren Sie folgende Vorteile:',
        'You need to log in with your OTRS-ID to deregister your system.' =>
            'Um Ihr System zu deregistrieren, loggen Sie sich bitte mit Ihrer OTRS-ID ein.',
        'OTRS-ID' => 'OTRS-ID',
        'You don\'t have an OTRS-ID yet?' => 'Sie haben noch keine OTRS-ID?',
        'Sign up now' => 'Registrieren Sie sich jetzt',
        'Forgot your password?' => 'Passwort vergessen?',
        'Retrieve a new one' => 'Neues anfordern',
        'This data will be frequently transferred to OTRS Group when you register this system.' =>
            'Wenn Sie dieses System registrieren, werden folgende Daten in regelmäßigen Abständen an die OTRS Gruppe übertragen.',
        'Attribute' => 'Attribut',
        'FQDN' => 'FQDN',
        'OTRS Version' => 'OTRS-Version',
        'Operating System' => 'Betriebssystem',
        'Perl Version' => 'Perl Version',
        'Optional description of this system.' => 'Optionale Beschreibung für dieses System.',
        'Register' => 'Registrieren',
        'Deregister System' => 'System deregistrieren',
        'Continuing with this step will deregister the system from OTRS Group.' =>
            'Wenn Sie fortfahren, wird dieses System bei der OTRS Gruppe deregistriert.',
        'Deregister' => 'Deregistrieren',
        'You can modify registration settings here.' => 'Sie können ihre Registrierungseinstellungen hier bearbeiten.',
        'Overview of transmitted data' => 'Übersicht der übertragenen Daten',
        'There is no data regularly sent from your system to %s.' => 'Von Ihrem System werden keine Daten regelmäßig an %s übertragen.',
        'The following data is sent at minimum every 3 days from your system to %s.' =>
            'Folgende Daten werden mindestens alle 3 Tage von Ihrem System an %s übertragen.',
        'The data will be transferred in JSON format via a secure https connection.' =>
            'Die Daten werden im JSON-Format über eine sichere https-Verbindung übertragen.',
        'System Registration Data' => 'Daten der Systemregistrierung',
        'Support Data' => 'Supportdaten',

        # Template: AdminRole
        'Role Management' => 'Rollen-Verwaltung',
        'Add role' => 'Rolle hinzufügen',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Erstelle eine Rolle und weise Gruppen hinzu. Danach füge Benutzer zu den Rollen hinzu.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'Bislang sind keine Rollen definiert. Bitte verwenden Sie den Knopf "Hinzufügen", um neue Rollen zu erstellen.',
        'Add Role' => 'Rolle hinzufügen',
        'Edit Role' => 'Rolle bearbeiten',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => 'Zuordnungen von Rollen zu Gruppen verwalten',
        'Filter for Roles' => 'Filter für Rollen',
        'Roles' => 'Rollen',
        'Select the role:group permissions.' => 'Wählen Sie die Rolle:Gruppe-Berechtigungen aus.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Wenn nichts ausgewählt ist, hat die Rolle in dieser Gruppe keine Berechtigungen (und kann nicht auf Tickets zugreifen).',
        'Change Role Relations for Group' => 'Rollen-Zuordnungen ändern für Gruppe',
        'Change Group Relations for Role' => 'Gruppen-Zuordnungen ändern für Rolle',
        'Toggle %s permission for all' => 'Berechtigung %s für alle umschalten',
        'move_into' => 'Verschieben in',
        'Permissions to move tickets into this group/queue.' => 'Rechte, um Tickets in eine Gruppe/Queue zu verschieben.',
        'create' => 'Erstellen',
        'Permissions to create tickets in this group/queue.' => 'Rechte, um in einer Gruppe/Queue Tickets zu erstellen.',
        'note' => 'Notiz',
        'Permissions to add notes to tickets in this group/queue.' => 'Berechtigung zum Hinzufügen von Notizen zu Tickets dieser Gruppe/Queue.',
        'owner' => 'Besitzer',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Berechtigung zum Ändern des Besitzers von Tickets dieser Gruppe/Queue.',
        'priority' => 'Priorität',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Rechte, um die Priorität eines Tickets in einer Gruppe/Queue zu ändern.',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => 'Zuordnungen von Agenten und Rollen verwalten',
        'Add agent' => 'Agent hinzufügen',
        'Filter for Agents' => 'Filter für Agenten',
        'Agents' => 'Agenten',
        'Manage Role-Agent Relations' => 'Zuordnungen von Agenten und Rollen verwalten',
        'Change Role Relations for Agent' => 'Rollen-Zuordnungen verändern für Agenten',
        'Change Agent Relations for Role' => 'Agenten-Zuordnungen verändern für Rolle',

        # Template: AdminSLA
        'SLA Management' => 'SLA-Verwaltung',
        'Add SLA' => 'SLA hinzufügen',
        'Edit SLA' => 'SLA bearbeiten',
        'Please write only numbers!' => 'Bitte geben Sie nur Zahlen ein!',

        # Template: AdminSMIME
        'S/MIME Management' => 'S/MIME-Verwaltung',
        'SMIME support is disabled' => 'SMIME-Unterstützung ist deaktiviert',
        'To be able to use SMIME in OTRS, you have to enable it first.' =>
            'Um SMIME in OTRS zu verwenden, müssen Sie es zunächst aktivieren.',
        'Enable SMIME support' => 'SMIME-Unterstützung aktivieren',
        'Faulty SMIME configuration' => 'Fehlerhafte SMIME-Konfiguration',
        'SMIME support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'SMIME-Unterstützung ist zwar aktiviert, jedoch fehlerhaft konfiguriert. Bitte prüfen Sie die Konfiguration durch Drücken des nachfolgenden Knopfes.',
        'Check SMIME configuration' => 'SMIME-Konfiguration prüfen',
        'Add certificate' => 'Zertifikat hinzufügen',
        'Add private key' => 'Privaten Schlüssel hinzufügen',
        'Filter for certificates' => 'Filter für Zertifikate',
        'Filter for S/MIME certs' => 'Filter für S/MIME Zertifikate',
        'To show certificate details click on a certificate icon.' => 'Zertifikatsdetails können Sie mit einem Klick auf das Zertifikats-Icon aufrufen.',
        'To manage private certificate relations click on a private key icon.' =>
            'Um Zertifikats-Zugehörigkeiten zu verwalten können Sie auf das Icon eines privaten Schlüssels klicken.',
        'Here you can add relations to your private certificate, these will be embedded to the S/MIME signature every time you use this certificate to sign an email.' =>
            'Hier können Sie Beziehungen zu Ihren privaten Zertifikat hinzufügen, diese werden jedes Mal zur  S/MIME-Signatur hinzugefügt, wenn Sie dieses Zertifikat verwenden um eine E-Mail zu signieren.',
        'See also' => 'Siehe auch',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'Über diesen Weg können die Zertifikate und privaten Schlüssel im Dateisystem bearbeitet werden.',
        'Hash' => 'Hash',
        'Handle related certificates' => 'Zugehörige Zertifikate verwalten',
        'Read certificate' => 'Zertifikat lesen',
        'Delete this certificate' => 'Dieses Zertifikat löschen',
        'Add Certificate' => 'Zertifikat hinzufügen',
        'Add Private Key' => 'Privaten Schlüssel hinzufügen',
        'Secret' => 'Geheimnis',
        'Related Certificates for' => 'Zugehörige Zertifikate für',
        'Delete this relation' => 'Diese Zugehörigkeit löschen',
        'Available Certificates' => 'Verfügbare Zertifikate',
        'Relate this certificate' => 'Dieses Zertifikat zuordnen',

        # Template: AdminSMIMECertRead
        'Close dialog' => 'Dialog schließen',
        'Certificate details' => 'Zertifikats-Details',

        # Template: AdminSalutation
        'Salutation Management' => 'Anreden-Verwaltung',
        'Add salutation' => 'Anrede hinzufügen',
        'Add Salutation' => 'Anrede hinzufügen',
        'Edit Salutation' => 'Anrede bearbeiten',
        'e. g.' => 'z. B.',
        'Example salutation' => 'Beispiel-Anrede',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => 'Sicherheitsmodus muss eingeschaltet sein!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'Der Sicherheitsmodus wird normalerweise eingeschaltet, nachdem die Installation abgeschlossen ist.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Wenn der Sicherheitsmodus nicht aktiv ist, können Sie ihn mit der SysConfig aktivieren, da Ihr System bereits läuft.',

        # Template: AdminSelectBox
        'SQL Box' => 'SQL Box',
        'Here you can enter SQL to send it directly to the application database. It is not possible to change the content of the tables, only select queries are allowed.' =>
            'Senden Sie SQL-Befehle direkt an die Anwendungsdatenbank. Es ist nicht möglich, den Inhalt der Tabellen zu ändern, es sind nur SELECT-Abfragen erlaubt.',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Hier können Sie SQL eingeben, das an die Datenbank gesendet wird.',
        'Only select queries are allowed.' => 'Es sind nur Select Abfragen erlaubt',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'Die Syntax Ihrer SQL-Abfrage ist fehlerhaft. Bitte prüfen.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'Es fehlt mindestens ein Parameter für das Binding. Bitte prüfen.',
        'Result format' => 'Zielformat',
        'Run Query' => 'Anfrage ausführen',
        'Query is executed.' => 'Suchanfrage wird ausgeführt.',

        # Template: AdminService
        'Service Management' => 'Service-Verwaltung',
        'Add service' => 'Service hinzufügen',
        'Add Service' => 'Service hinzufügen',
        'Edit Service' => 'Service bearbeiten',
        'Sub-service of' => 'Unterservice von',

        # Template: AdminSession
        'Session Management' => 'Sitzungsverwaltung',
        'All sessions' => 'Alle Sitzungen',
        'Agent sessions' => 'Agenten-Sitzungen',
        'Customer sessions' => 'Kunden-Sitzungen',
        'Unique agents' => 'Eindeutige Agenten',
        'Unique customers' => 'Eindeutige Kunden',
        'Kill all sessions' => 'Löschen aller Sessions',
        'Kill this session' => 'Diese Sitzung löschen',
        'Session' => 'Session',
        'Kill' => 'Löschen',
        'Detail View for SessionID' => 'Detailansicht der Sitzungskennung',

        # Template: AdminSignature
        'Signature Management' => 'Signatur-Verwaltung',
        'Add signature' => 'Signatur hinzufügen',
        'Add Signature' => 'Signatur hinzufügen',
        'Edit Signature' => 'Signatur bearbeiten',
        'Example signature' => 'Beispiel-Signatur',

        # Template: AdminState
        'State Management' => 'Status-Verwaltung',
        'Add state' => 'Status hinzufügen',
        'Please also update the states in SysConfig where needed.' => 'Bitte aktualisieren Sie auch die Status in der SysConfig dort, wo es erforderlich ist.',
        'Add State' => 'Status hinzufügen',
        'Edit State' => 'Status bearbeiten',
        'State type' => 'Status-Typ',

        # Template: AdminSupportDataCollector
        'Sending support data to OTRS Group is not possible!' => 'Das Senden von Support-Daten an die OTRS-Gruppe ist nicht möglich!',
        'Enable Cloud Services' => 'Cloud-Services aktivieren',
        'This data is sent to OTRS Group on a regular basis. To stop sending this data please update your system registration.' =>
            'Diese Daten werden regelmäßig an die OTRS Gruppe gesendet. Falls Sie das Senden der Daten beenden möchten, aktualisieren Sie bitte ihre Systemregistrierung.',
        'You can manually trigger the Support Data sending by pressing this button:' =>
            'Sie können den Versand der Supportdaten manuell auslösen, indem Sie diesen Knopf verwenden:',
        'Send Update' => 'Update senden',
        'Sending Update...' => 'Update wird gesendet...',
        'Support Data information was successfully sent.' => 'Supportdaten wurden erfolgreich gesendet.',
        'Was not possible to send Support Data information.' => 'Es war nicht möglich, die Supportdaten zu versenden.',
        'Update Result' => 'Update-Ergebnis',
        'Currently this data is only shown in this system.' => 'Diese Daten werden derzeit nur in Ihrem System angezeigt.',
        'A support bundle (including: system registration information, support data, a list of installed packages and all locally modified source code files) can be generated by pressing this button:' =>
            'Ein Supportpaket (einschließlich: Systemregistrierungsdaten, Supportdaten, eine Liste der installierten Pakete und aller lokal geänderten Quellcode-Dateien) kann mit diesem Knopf erstellt werden:',
        'Generate Support Bundle' => 'Supportpaket erstellen',
        'Generating...' => 'Wird erstellt...',
        'It was not possible to generate the Support Bundle.' => 'Das Supportpaket konnte nicht erzeugt werden.',
        'Generate Result' => 'Ergebnis der Generierung',
        'Support Bundle' => 'Supportpaket',
        'The mail could not be sent' => 'Die Mail konnte nicht versendet werden',
        'The support bundle has been generated.' => 'Das Supportpaket wurde erstellt.',
        'Please choose one of the following options.' => 'Bitte wählen Sie eine der nachfolgenden Optionen aus.',
        'Send by Email' => 'Per E-Mail senden',
        'The support bundle is too large to send it by email, this option has been disabled.' =>
            'Das Supportpaket ist zu groß, um es manuell zu versenden. Diese Option wurde deaktiviert.',
        'The email address for this user is invalid, this option has been disabled.' =>
            'Die E-Mailadresse für diesen Benutzer ist ungültig, Die Auswahl wurde deaktivert.',
        'Sending' => 'Wird gesendet',
        'The support bundle will be sent to OTRS Group via email automatically.' =>
            'Das Supportpaket wird automatisch per E-Mail zur OTRS Gruppe gesendet.',
        'Download File' => 'Datei herunterladen',
        'A file containing the support bundle will be downloaded to the local system. Please save the file and send it to the OTRS Group, using an alternate method.' =>
            'Das Supportpaket wird als Datei ins lokale Dateisystem heruntergeladen. Bitte speichern Sie die Datei und senden Sie diese auf anderen Wegen an die OTRS Gruppe.',
        'Error: Support data could not be collected (%s).' => 'Fehler: Supportdaten konnten nicht ermittelt werden (%s).',
        'Details' => 'Details',

        # Template: AdminSysConfig
        'SysConfig' => 'SysConfig',
        'Navigate by searching in %s settings' => 'Navigieren Sie mit Hilfe der Suche in %s Einstellungen',
        'Navigate by selecting config groups' => 'Navigieren Sie durch Auswahl der Konfigurationsgruppen',
        'Download all system config changes' => 'Alle Konfigurationsanpassungen herunterladen',
        'Export settings' => 'Einstellungen exportieren',
        'Load SysConfig settings from file' => 'SysConfig-Einstellungen aus Datei laden',
        'Import settings' => 'Einstellungen importieren',
        'Import Settings' => 'Einstellungen importieren',
        'Please enter a search term to look for settings.' => 'Bitte geben Sie einen Suchbegriff ein, um nach Einstellungen zu suchen.',
        'Subgroup' => 'Untergruppe',
        'Elements' => 'Elemente',

        # Template: AdminSysConfigEdit
        'Edit Config Settings in %s → %s' => 'Konfigurationseinstellungen in %s → %s bearbeiten',
        'This setting is read only.' => 'Dies Einstellungen sind nur lesbar.',
        'This config item is only available in a higher config level!' =>
            'Diese Einstellung ist nur in einem höheren Konfigurationslevel verfügbar!',
        'Reset this setting' => 'Diese Einstellung zurücksetzen',
        'Error: this file could not be found.' => 'Error: Diese Datei konnte nicht gefunden werden.',
        'Error: this directory could not be found.' => 'Error: Dieses Verzeichnis konnte nicht gefunden werden.',
        'Error: an invalid value was entered.' => 'Error: Ein ungültiger Wert wurde eingegeben.',
        'Content' => 'Inhalt',
        'Remove this entry' => 'Diesen Eintrag entfernen',
        'Add entry' => 'Eintrag hinzufügen',
        'Remove entry' => 'Eintrag entfernen',
        'Add new entry' => 'Eintrag hinzufügen',
        'Delete this entry' => 'Diesen Eintrag löschen',
        'Create new entry' => 'Eintrag hinzufügen',
        'New group' => 'Neue Gruppe',
        'Group ro' => 'Gruppe ro',
        'Readonly group' => 'Nur-Lesen-Gruppe',
        'New group ro' => 'Neue Gruppe ro',
        'Loader' => 'Loader',
        'File to load for this frontend module' => 'Datei, die für dieses Fontendmodul geladen werden soll',
        'New Loader File' => 'Neue Loader-Datei',
        'NavBarName' => 'NavBarName',
        'NavBar' => 'NavBar',
        'LinkOption' => 'LinkOption',
        'Block' => 'Block',
        'AccessKey' => 'AccessKey',
        'Add NavBar entry' => 'NavBar-Eintrag hinzufügen',
        'NavBar module' => 'NavBar-Modul',
        'Year' => 'Jahr',
        'Month' => 'Monat',
        'Day' => 'Tag',
        'Invalid year' => 'Ungültiges Jahr',
        'Invalid month' => 'Ungültiger Monat',
        'Invalid day' => 'Ungültiger Tag',
        'Show more' => 'Mehr anzeigen',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Verwaltung von System-E-Mail-Adressen',
        'Add system address' => 'Systemadresse hinzufügen',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Alle einkommenden E-Mails mit dieser Adresse in An: oder Cc: werden an die ausgewählte Queue geleitet.',
        'Email address' => 'E-Mail-Adresse',
        'Display name' => 'Anzeigename',
        'Add System Email Address' => 'System-E-Mail-Adresse hinzufügen',
        'Edit System Email Address' => 'System-E-Mail-Adresse bearbeiten',
        'The display name and email address will be shown on mail you send.' =>
            'Der Anzeigename und die E-Mail-Adresse werden für die gesendeten Mail verwendet.',

        # Template: AdminSystemMaintenance
        'System Maintenance Management' => 'Systemwartungs-Verwaltung',
        'Schedule New System Maintenance' => 'Neue Systemwartung planen',
        'Schedule a system maintenance period for announcing the Agents and Customers the system is down for a time period.' =>
            'Ein Systemwartungs-Zeitfenster planen, um Agenten und Kunden auf die Downtime hinzuweisen.',
        'Some time before this system maintenance starts the users will receive a notification on each screen announcing about this fact.' =>
            'Einige Zeit vor der Systemwartung werden die Nutzer einen Hinweis auf jedem Bildschirm sehen.',
        'Start date' => 'Startzeitpunkt',
        'Stop date' => 'Endzeitpunkt',
        'Delete System Maintenance' => 'Systemwartung entfernen',
        'Do you really want to delete this scheduled system maintenance?' =>
            'Wollen Sie diese geplante Systemwartung wirklich löschen?',

        # Template: AdminSystemMaintenanceEdit
        'Edit System Maintenance %s' => 'Systemwartung %s bearbeiten',
        'Edit System Maintenance Information' => '',
        'Date invalid!' => 'Ungültiges Datum',
        'Login message' => 'Anmeldungs-Nachricht',
        'Show login message' => 'Anmeldungs-Nachricht anzeigen',
        'Notify message' => 'Hinweistext',
        'Manage Sessions' => 'Sitzungen verwalten',
        'All Sessions' => 'Alle Sitzungen',
        'Agent Sessions' => 'Agenten-Sitzungen',
        'Customer Sessions' => 'Kunden-Sitzungen',
        'Kill all Sessions, except for your own' => 'Alle Sitzungen außer Ihrer eigenen löschen',

        # Template: AdminTemplate
        'Manage Templates' => 'Vorlagen verwalten',
        'Add template' => 'Vorlage hinzufügen',
        'A template is a default text which helps your agents to write faster tickets, answers or forwards.' =>
            'Eine Vorlage ist ein Standardtext, der Ihren Agenten helfen kann, Tickets schneller zu erstellen, beantworten oder weiterzuleiten.',
        'Don\'t forget to add new templates to queues.' => 'Vergessen Sie nicht, Vorlagen den Queues zuzuordnen.',
        'Do you really want to delete this template?' => 'Möchten Sie diese Vorlage wirklich löschen?',
        'Add Template' => 'Vorlage hinzufügen',
        'Edit Template' => 'Vorlage bearbeiten',
        'A standard template with this name already exists!' => 'Es existiert bereits eine Standardvorlage mit diesem Namen!',
        'Create type templates only supports this smart tags' => 'Vorlagen für das Erstellen unterstützen nur diese "smart tags"',
        'Example template' => 'Beispielvorlage',
        'The current ticket state is' => 'Der aktuelle Ticket-Status ist',
        'Your email address is' => 'Ihre E-Mail-Adresse ist',

        # Template: AdminTemplateAttachment
        'Manage Templates <-> Attachments Relations' => 'Vorlagen-Anhang-Zuordnungen verwalten',
        'Filter for Attachments' => 'Filter für Anlagen',
        'Change Template Relations for Attachment' => 'Vorlagen-Zuordnungen für Anhang verändern',
        'Change Attachment Relations for Template' => 'Anhangs-Zuordnungen für Vorlage verändern',
        'Toggle active for all' => 'Aktiv umschalten für alle',
        'Link %s to selected %s' => '%s zu %s (markiert) verknüpfen',

        # Template: AdminType
        'Type Management' => 'Typ-Verwaltung',
        'Add ticket type' => 'Ticket-Typ hinzufügen',
        'Add Type' => 'Typ hinzufügen',
        'Edit Type' => 'Typ bearbeiten',
        'A type with this name already exists!' => 'Ein Typ mit diesem Namen existiert bereits!',

        # Template: AdminUser
        'Agents will be needed to handle tickets.' => 'Agenten werden für die Verarbeitung von Tickets benötigt.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'Vergessen Sie nicht, einen neuen Agenten zu Gruppen und/oder Rollen hinzuzufügen!',
        'Please enter a search term to look for agents.' => 'Bitte geben Sie einen Suchbegriff ein, um nach Agenten zu suchen.',
        'Last login' => 'Letzte Anmeldung',
        'Switch to agent' => 'Wechseln zu Agent',
        'Add Agent' => 'Agent hinzufügen',
        'Edit Agent' => 'Agent bearbeiten',
        'Title or salutation' => 'Titel oder Anrede',
        'Firstname' => 'Vorname',
        'Lastname' => 'Nachname',
        'A user with this username already exists!' => 'Es existiert bereits ein Nuter mit diesem Benutzernamen!',
        'Will be auto-generated if left empty.' => 'Wird für ein leeres Feld automatisch generiert.',
        'Start' => 'Start',
        'End' => 'Ende',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => 'Zuordnungen von Agent und Gruppe verwalten',
        'Change Group Relations for Agent' => 'Gruppenzuordnungen verwalten für Agenten',
        'Change Agent Relations for Group' => 'Agentenzuordnungen verwalten für Gruppe',

        # Template: AgentBook
        'Address Book' => 'Adressbuch',
        'Search for a customer' => 'Suche nach einem Kunden',
        'Add email address %s to the To field' => 'E-Mail-Adresse %s zum "An"-Feld hinzufügen',
        'Add email address %s to the Cc field' => 'E-Mail-Adresse %s zum "Cc"-Feld hinzufügen',
        'Add email address %s to the Bcc field' => 'E-Mail-Adresse %s zum "Bcc"-Feld hinzufügen',
        'Apply' => 'Anwenden',

        # Template: AgentCustomerInformationCenter
        'Customer Information Center' => 'Kunden-Informationszentrum',

        # Template: AgentCustomerInformationCenterSearch
        'Customer User' => 'Kundenbenutzer',

        # Template: AgentCustomerSearch
        'Duplicated entry' => 'Doppelter Eintrag',
        'This address already exists on the address list.' => 'Dieser Eintrag existiert bereits in der Adressliste',
        'It is going to be deleted from the field, please try again.' => 'Er wird aus dem Feld entfernt, bitte versuchen Sie es erneut.',

        # Template: AgentCustomerTableView
        'Note: Customer is invalid!' => 'Hinweis: Kunde ist ungültig!',
        'Start chat' => 'Chat starten',
        'Video call' => 'Video-Anruf',
        'Audio call' => 'Audio-Anruf',

        # Template: AgentDaemonInfo
        'The OTRS Daemon is a daemon process that performs asynchronous tasks, e.g. ticket escalation triggering, email sending, etc.' =>
            'Der OTRS Daemon ist ein Daemon-Prozess, welcher asynchrone Aufgaben übernimmt, z.B. das Auslösen von Ticket-Eskalationen oder das Versenden von E-Mails.',
        'A running OTRS Daemon is mandatory for correct system operation.' =>
            'Ein laufender OTRS Daemon ist für die korrekte Funktion des Systems erforderlich.',
        'Starting the OTRS Daemon' => 'Den OTRS Daemon starten',
        'Make sure that the file \'%s\' exists (without .dist extension). This cron job will check every 5 minutes if the OTRS Daemon is running and start it if needed.' =>
            'Stellen Sie sicher, dass die Datei \'%s\' existiert (ohne die Endung .dist). Dieser Cronjob wird alle 5 Minuten prüfen, ob der OTRS Daemon läuft, und ihn ggf. starten.',
        'Execute \'%s start\' to make sure the cron jobs of the \'otrs\' user are active.' =>
            'Führen Sie \'%s start\' aus um sicherzustellen, dass die Cronjobs des \'otrs\'-Nutzers aktiv sind.',
        'After 5 minutes, check that the OTRS Daemon is running in the system (\'bin/otrs.Daemon.pl status\').' =>
            'Prüfen Sie nach 5 Minuten, ob der OTRS Daemon läuft  (\'bin/otrs.Daemon.pl status\').',

        # Template: AgentDashboard
        'Dashboard' => 'Übersicht',

        # Template: AgentDashboardCalendarOverview
        'in' => 'in',

        # Template: AgentDashboardCommon
        'Close this widget' => 'Dieses Widget schließen',
        'Available Columns' => 'Verfügbare Spalten',
        'Visible Columns (order by drag & drop)' => 'Angezeigte Spalten (Ändern durch Ziehen)',

        # Template: AgentDashboardCustomerIDStatus
        'Escalated tickets' => 'Eskalierte Tickets',

        # Template: AgentDashboardCustomerUserList
        'Customer login' => 'Kundenlogin',
        'Customer information' => 'Kundeninformation',
        'Phone ticket' => 'Telefon-Ticket',
        'Email ticket' => 'E-Mail-Ticket',
        '%s open ticket(s) of %s' => '%s offene Tickets von %s',
        '%s closed ticket(s) of %s' => '%s geschlossene Tickets von %s',
        'New phone ticket from %s' => 'Neues Telefonticket von %s',
        'New email ticket to %s' => 'Neues E-Mail-Ticket an %s',

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s ist nun verfügbar!',
        'Please update now.' => 'Bitte nun aktualisieren.',
        'Release Note' => 'Versionsbeschreibung',
        'Level' => 'Level',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Veröffentlicht vor %s.',

        # Template: AgentDashboardStats
        'The configuration for this statistic widget contains errors, please review your settings.' =>
            'Die Konfiguration für dieses Statistik-Widget enthält Fehler, bitte prüfen Sie ihre Einstellungen.',
        'Download as SVG file' => 'Als SVG-Datei herunterladen',
        'Download as PNG file' => 'Als PNG-Datei herunterladen',
        'Download as CSV file' => 'Als CSV-Datei herunterladen',
        'Download as Excel file' => 'Als Excel-Datei herunterladen',
        'Download as PDF file' => 'Als PDF-Datei herunterladen',
        'Grouped' => 'Gruppiert',
        'Stacked' => 'Gestapelt',
        'Expanded' => 'Ausgedehnt',
        'Stream' => 'Fließend',
        'No Data Available.' => '',
        'Please select a valid graph output format in the configuration of this widget.' =>
            'Bitte wählen Sie eine gültiges Ausgabeformat in der Konfiguration dieses Widgets aus.',
        'The content of this statistic is being prepared for you, please be patient.' =>
            'Der Inhalt dieser Statistik wird vorbereitet. Bitte haben Sie etwas Geduld.',
        'This statistic can currently not be used because its configuration needs to be corrected by the statistics administrator.' =>
            'Diese Statistik kann momentan nicht verwendet werden, weil ihre Konfiguration vom Statistik-Administrator korrigiert werden muss.',

        # Template: AgentDashboardTicketGeneric
        'My locked tickets' => 'Meine gesperrten Tickets',
        'My watched tickets' => 'Meine beobachteten Tickets',
        'My responsibilities' => 'Meine Verantwortlichkeiten',
        'Tickets in My Queues' => 'Tickets in meinen Queues',
        'Tickets in My Services' => 'Tickets in Meinen Services',
        'Service Time' => 'Service Zeit',
        'Remove active filters for this widget.' => 'Aktive Filter für dieses Widget entfernen.',

        # Template: AgentDashboardTicketQueueOverview
        'Totals' => 'Summen',

        # Template: AgentDashboardUserOnline
        'out of office' => 'abwesend',

        # Template: AgentDashboardUserOutOfOffice
        'until' => 'bis',

        # Template: AgentHTMLReferencePageLayout
        'The ticket has been locked' => 'Das Ticket wurde gesperrt',
        'Undo & close' => 'Rückgängig machen und Beenden',

        # Template: AgentInfo
        'Info' => 'Info',
        'To accept some news, a license or some changes.' => 'Neuigkeiten, eine Lizenz oder Änderungen bestätigen.',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Verknüpfung erstellen: %s',
        'go to link delete screen' => 'zu "Verknüpfung löschen" wechseln',
        'Select Target Object' => 'Zielobjekt auswählen',
        'Link object %s with' => 'Objekt %s verknüpfen mit',
        'Unlink Object: %s' => 'Verknüpfung lösen: %s',
        'go to link add screen' => 'zu "Verknüpfung hinzufügen" wechseln',

        # Template: AgentOTRSBusinessBlockScreen
        'Unauthorized usage of %s detected' => 'Unerlaubte Nutzung der %s erkannt',
        'If you decide to downgrade to OTRS Free, you will lose all database tables and data related to %s.' =>
            'Wenn Sie sich entscheiden, auf OTRS Free downzugraden, verlieren Sie alle zur %s gehörigen Datenbank-Tabellen und Daten. ',

        # Template: AgentPreferences
        'Edit your preferences' => 'Persönliche Einstellungen bearbeiten',
        'Did you know? You can help translating OTRS at %s.' => 'Haben Sie gewusst, dass Sie bei der Übersetzung von OTRS unter %s helfen können?',

        # Template: AgentSpelling
        'Spell Checker' => 'Rechtschreibprüfung',
        'spelling error(s)' => 'Rechtschreibfehler',
        'Apply these changes' => 'Änderungen übernehmen',

        # Template: AgentStatisticsAdd
        'Statistics » Add' => 'Statistiken » Hinzufügen',
        'Add New Statistic' => 'Neue Statistik hinzufügen',
        'Dynamic Matrix' => 'Dynamische Matrix',
        'Tabular reporting data where each cell contains a singular data point (e. g. the number of tickets).' =>
            'Tabellarische Berichtsdaten, worin jede Zelle einen einzelnen Datenpunkt beinhaltet (z.B. die Anzahl der Tickets).',
        'Dynamic List' => 'Dynamische Liste',
        'Tabular reporting data where each row contains data of one entity (e. g. a ticket).' =>
            'Tabellarische Berichtsdaten, worin jede Reihe Daten eines Objekts beinhaltet (z.B. ein Ticket).',
        'Static' => 'Statisch',
        'Complex statistics that cannot be configured and may return non-tabular data.' =>
            'Komplexe Statistiken, die nicht konfiguriert werden können und eventuell Daten zurückliefern, die nicht tabellarisch sind.',
        'General Specification' => 'Allgemeine Angabe',
        'Create Statistic' => 'Statistik erstellen',

        # Template: AgentStatisticsEdit
        'Statistics » Edit %s%s — %s' => 'Statistiken » Bearbeiten %s%s — %s',
        'Run now' => 'Jetzt ausführen',
        'Statistics Preview' => 'Statistik Vorschau',
        'Save statistic' => 'Statistik speichern',

        # Template: AgentStatisticsImport
        'Statistics » Import' => 'Statistiken » Import',
        'Import Statistic Configuration' => 'Statistikeinstellung importieren',

        # Template: AgentStatisticsOverview
        'Statistics » Overview' => 'Statistiken » Übersicht',
        'Statistics' => 'Statistiken',
        'Run' => 'Start',
        'Edit statistic "%s".' => 'Statistik "%s" bearbeiten.',
        'Export statistic "%s"' => 'Statistik "%s" exportieren.',
        'Export statistic %s' => 'Statistik %s exportieren',
        'Delete statistic "%s"' => 'Statistik "%s" löschen',
        'Delete statistic %s' => 'Statistik %s löschen',
        'Do you really want to delete this statistic?' => 'Möchten Sie diese Statistik wirklich löschen?',

        # Template: AgentStatisticsView
        'Statistics » View %s%s — %s' => 'Statistiken » Ansicht %s%s — %s',
        'Statistic Information' => 'Statistikinformationen',
        'Sum rows' => 'Zeilensummierung',
        'Sum columns' => 'Spaltensummierung',
        'Show as dashboard widget' => 'Als Dashboard-Widget anzeigen',
        'Cache' => 'Cache',
        'This statistic contains configuration errors and can currently not be used.' =>
            'Diese Statistik enthält Konfigurationsfehler und kann momentan nicht verwendet werden.',

        # Template: AgentTicketActionCommon
        'Change Free Text of %s%s%s' => 'Den Freitext von %s%s%s ändern',
        'Change Owner of %s%s%s' => 'Besitzer von %s%s%s wechseln',
        'Close %s%s%s' => '%s%s%s schließen',
        'Add Note to %s%s%s' => 'Notiz zu %s%s%s hinzufügen',
        'Set Pending Time for %s%s%s' => 'Wartezeit setzen für %s%s%s',
        'Change Priority of %s%s%s' => 'Priorität von %s%s%s ändern',
        'Change Responsible of %s%s%s' => 'Verantwortlichen von %s%s%s ändern',
        'All fields marked with an asterisk (*) are mandatory.' => 'Alle mit * gekennzeichneten Felder sind Pflichtfelder.',
        'Service invalid.' => 'Ungültiger Service',
        'New Owner' => 'Neuer Besitzer',
        'Please set a new owner!' => 'Bitte einen neuen Besitzer angeben',
        'New Responsible' => 'Wechsel des Verantwortlichen',
        'Next state' => 'Nächster Status',
        'For all pending* states.' => 'Für alle warten* Status.',
        'Add Article' => 'Artikel hinzufügen',
        'Create an Article' => 'Artikel anlegen',
        'Inform agents' => 'Agenten informieren',
        'Inform involved agents' => 'Involvierte Agenten informieren',
        'Here you can select additional agents which should receive a notification regarding the new article.' =>
            'Hier können Sie zusätzliche Agenten auswählen, die eine Benachrichtigung über den neuen Artikel enthalten sollen.',
        'Text will also be received by' => 'Text wird auch gesendet an',
        'Spell check' => 'Rechtschreibprüfung',
        'Text Template' => 'Textvorlage',
        'Setting a template will overwrite any text or attachment.' => 'Die Auswahl einer Vorlage wird bereits bestehenden Text oder Anlagen löschen.',
        'Note type' => 'Notiztyp',

        # Template: AgentTicketBounce
        'Bounce %s%s%s' => '%s%s%s umleiten',
        'Bounce to' => 'Umleiten an',
        'You need a email address.' => 'Sie benötigen eine E-Mail-Adresse',
        'Need a valid email address or don\'t use a local email address.' =>
            'Benötige eine gültige E-Mail-Adresse, verwenden Sie keine lokale Adresse.',
        'Next ticket state' => 'Nächster Status des Tickets',
        'Inform sender' => 'Sender informieren',
        'Send mail' => 'Mail übermitteln',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Ticket Sammelaktion',
        'Send Email' => 'E-Mail versenden',
        'Merge to' => 'Zusammenfassen zu',
        'Invalid ticket identifier!' => 'Ungültiger Ticket-Identifizierer!',
        'Merge to oldest' => 'Zusammenfassen zu Ältestem',
        'Link together' => 'Zusammen verlinken',
        'Link to parent' => 'Mit Eltern verknüpfen',
        'Unlock tickets' => 'Tickets entsperren',
        'Execute Bulk Action' => 'Sammelaktion ausführen',

        # Template: AgentTicketCompose
        'Compose Answer for %s%s%s' => 'Antwort für %s%s%s verfassen',
        'This address is registered as system address and cannot be used: %s' =>
            'Diese Adresse ist als Systemadresse registriert und kann daher nicht verwendet werden: %s.',
        'Please include at least one recipient' => 'Bitte geben sie mindestens einen Empfänger an',
        'Remove Ticket Customer' => 'Ticket-Kunden entfernen',
        'Please remove this entry and enter a new one with the correct value.' =>
            'Bitte entfernen Sie diesen Eintrag und geben Sie einen gültigen an.',
        'Remove Cc' => 'Cc entfernen',
        'Remove Bcc' => 'Bcc entfernen',
        'Address book' => 'Adressbuch',
        'Date Invalid!' => 'Ungültiges Datum!',

        # Template: AgentTicketCustomer
        'Change Customer of %s%s%s' => 'Kunde von %s%s%s ändern',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => 'Neues E-Mail-Ticket anlegen',
        'Example Template' => 'Beispielvorlage',
        'From queue' => 'Aus Queue',
        'To customer user' => 'An Kundenbenutzer',
        'Please include at least one customer user for the ticket.' => 'Bitte tragen Sie wenigstens einen Kundenbenutzer für das Ticket ein',
        'Select this customer as the main customer.' => 'Diesen Kunden als Hauptkunden auswählen.',
        'Remove Ticket Customer User' => 'Kundenbenutzer des Tickets entfernen',
        'Get all' => 'Alles holen',

        # Template: AgentTicketEmailOutbound
        'Outbound Email for %s%s%s' => 'Ausgehende E-Mail für %s%s%s',

        # Template: AgentTicketEscalation
        'Ticket %s: first response time is over (%s/%s)!' => 'Ticket %s: erste Reaktionszeit ist abgelaufen (%s/%s)!',
        'Ticket %s: first response time will be over in %s/%s!' => 'Ticket %s: erste Reaktionszeit wird ablaufen in %s/%s!',
        'Ticket %s: update time is over (%s/%s)!' => 'Ticket %s: Aktualisierungszeit ist abgelaufen (%s/%s)!',
        'Ticket %s: update time will be over in %s/%s!' => 'Ticket %s: Aktualisierungszeit wird ablaufen in %s/%s!',
        'Ticket %s: solution time is over (%s/%s)!' => 'Ticket %s: Lösungszeit ist abgelaufen (%s/%s)!',
        'Ticket %s: solution time will be over in %s/%s!' => 'Ticket %s: Lösungszeit wird ablaufen in %s/%s!',

        # Template: AgentTicketForward
        'Forward %s%s%s' => '%s%s%s weiterleiten',

        # Template: AgentTicketHistory
        'History of %s%s%s' => 'Verlauf von %s%s%s',
        'History Content' => 'Änderungsverlauf',
        'Zoom view' => 'Großansicht',

        # Template: AgentTicketMerge
        'Merge %s%s%s' => '%s%s%s zusammenführen',
        'Merge Settings' => 'Zusammenführungseinstellungen',
        'You need to use a ticket number!' => 'Bitte eine Ticketnummer benutzen!',
        'A valid ticket number is required.' => 'Eine gültige Ticketnummer ist erforderlich.',
        'Need a valid email address.' => 'Benötige gültige E-Mail-Adresse.',

        # Template: AgentTicketMove
        'Move %s%s%s' => '%s%s%s verschieben',
        'New Queue' => 'Neue Queue',

        # Template: AgentTicketOverviewMedium
        'Select all' => 'Alle auswählen',
        'No ticket data found.' => 'Keine Ticketdaten gefunden.',
        'Open / Close ticket action menu' => 'Ticket-Aktionsmenü öffnen/schließen',
        'Select this ticket' => 'Dieses Ticket auswählen',
        'First Response Time' => 'Reaktionszeit',
        'Update Time' => 'Aktualisierungszeit',
        'Solution Time' => 'Lösungszeit',
        'Move ticket to a different queue' => 'Ticket in eine andere Queue verschieben',
        'Change queue' => 'Queue wechseln',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Such-Optionen ändern',
        'Remove active filters for this screen.' => 'Aktive Filter für diesen Bildschirm entfernen.',
        'Tickets per page' => 'Tickets pro Seite',

        # Template: AgentTicketOverviewSmall
        'Reset overview' => 'Übersicht zurücksetzen',
        'Column Filters Form' => 'Spalten-Filter-Formular',

        # Template: AgentTicketPhone
        'Split Into New Phone Ticket' => 'In ein neues Telefonticket splitten',
        'Save Chat Into New Phone Ticket' => 'Chat als neues Telefonticket speichern',
        'Create New Phone Ticket' => 'Neues Telefon-Ticket anlegen',
        'Please include at least one customer for the ticket.' => 'Bitte geben Sie mindestens einen Kunden für das Ticket an.',
        'To queue' => 'An Queue',
        'Chat protocol' => 'Chat Protokoll',
        'The chat will be appended as a separate article.' => 'Der Chat wird als separater Artikel angefügt.',

        # Template: AgentTicketPhoneCommon
        'Phone Call for %s%s%s' => 'Anruf für %s%s%s',

        # Template: AgentTicketPlain
        'View Email Plain Text for %s%s%s' => 'E-Mail-Klartext für %s%s%s ansehen',
        'Plain' => 'Unformatiert',
        'Download this email' => 'Diese E-Mail herunterladen',

        # Template: AgentTicketProcess
        'Create New Process Ticket' => 'Neues Prozessticket',
        'Process' => 'Prozess',

        # Template: AgentTicketProcessSmall
        'Enroll Ticket into a Process' => 'Ticket in einen Prozess überführen',

        # Template: AgentTicketSearch
        'Search template' => 'Suchvorlage',
        'Create Template' => 'Vorlage anlegen',
        'Create New' => 'Neue anlegen',
        'Profile link' => 'Profil-Link',
        'Save changes in template' => 'Änderungen in der Vorlage speichern',
        'Filters in use' => 'Verwendete Filter',
        'Additional filters' => 'zusätzliche Filter',
        'Add another attribute' => 'Ein weiteres Attribut hinzufügen',
        'Output' => 'Ausgabe',
        'Fulltext' => 'Volltext',
        'Remove' => 'Entfernen',
        'Searches in the attributes From, To, Cc, Subject and the article body, overriding other attributes with the same name.' =>
            'Sucht in den Attributen Von, Cc, Betreff, Artikelinhalt und überschreibt Attribute mit dem selben Namen.',
        'CustomerID (complex search)' => 'Kundennummer (komplexe Suche)',
        '(e. g. 234*)' => '(z. B. 234*)',
        'CustomerID (exact match)' => 'Kundennummer (genaue Übereinstimmung)',
        'Customer User Login (complex search)' => 'Kundenbenutzer (komplexe Suche)',
        '(e. g. U51*)' => '(z. B. U51*)',
        'Customer User Login (exact match)' => 'Kundenbenutzer (genaue Übereinstimmung)',
        'Attachment Name' => 'Name der Anlage',
        '(e. g. m*file or myfi*)' => '(z.B. m*file oder myfi*)',
        'Created in Queue' => 'Erstellt in Queue',
        'Lock state' => 'Status Sperre',
        'Watcher' => 'Beobachter',
        'Article Create Time (before/after)' => 'Artikel-Erstellzeit (vor/nach)',
        'Article Create Time (between)' => 'Artikel-Erstellzeit (zwischen)',
        'Ticket Create Time (before/after)' => 'Ticket-Erstellzeit (vor/nach)',
        'Ticket Create Time (between)' => 'Ticket-Erstellzeit (zwischen)',
        'Ticket Change Time (before/after)' => 'Ticket-Änderungszeit (vor/nach)',
        'Ticket Change Time (between)' => 'Ticket-Änderungszeit (zwischen)',
        'Ticket Last Change Time (before/after)' => 'Letzte Ticket-Änderungszeit (vor/nach)',
        'Ticket Last Change Time (between)' => 'Letzte Ticket-Änderungszeit (zwischen)',
        'Ticket Close Time (before/after)' => 'Ticket-Schließzeit (vor/nach)',
        'Ticket Close Time (between)' => 'Ticket-Schließzeit (zwischen)',
        'Ticket Escalation Time (before/after)' => 'Ticket-Eskalationszeit (vor/nach)',
        'Ticket Escalation Time (between)' => 'Ticket-Eskalationszeit (zwischen)',
        'Archive Search' => 'Archivsuche',
        'Run search' => 'Suche starten',

        # Template: AgentTicketZoom
        'Article filter' => 'Filter für Beiträge',
        'Article Type' => 'Artikel Typ',
        'Sender Type' => 'Absender Typ',
        'Save filter settings as default' => 'Filter-Einstellungen als Standard speichern',
        'Event Type Filter' => 'Ereignistypfilter',
        'Event Type' => 'Ereignistyp',
        'Save as default' => 'Save as default',
        'Archive' => 'Archiv',
        'This ticket is archived.' => 'Dieses Ticket ist archiviert.',
        'Note: Type is invalid!' => 'Hinweis: Typ ist ungültig!',
        'Locked' => 'Sperre',
        'Accounted time' => 'Erfasste Zeit',
        'Linked Objects' => 'Verknüpfte Objekte',
        'Change Queue' => 'Queue ändern',
        'There are no dialogs available at this point in the process.' =>
            'Für diesen Prozess stehen derzeit keine Dialoge zur Verfügung.',
        'This item has no articles yet.' => 'Dieser Eintrag hat noch keine Artikel',
        'Ticket Timeline View' => 'Ansicht des Ticket-Verlaufs',
        'Article Overview' => 'Artikelübersicht',
        'Article(s)' => 'Beitrag/Beiträge',
        'Page' => 'Seite',
        'Add Filter' => 'Filter hinzufügen',
        'Set' => 'Setzen',
        'Reset Filter' => 'Filter zurücksetzen',
        'Show one article' => 'Einen Beitrag anzeigen',
        'Show all articles' => 'Alle Beiträge anzeigen',
        'Show Ticket Timeline View' => 'Ticket-Verlauf-Ansicht anzeigen',
        'Unread articles' => 'Ungelesene Beiträge',
        'No.' => 'Nr.',
        'Important' => 'Wichtig',
        'Unread Article!' => 'Ungelesene Beiträge!',
        'Incoming message' => 'Eingehende Nachricht',
        'Outgoing message' => 'Ausgehende Nachricht',
        'Internal message' => 'Interne Nachricht',
        'Resize' => 'Größe anpassen',
        'Mark this article as read' => 'Diesen Artikel als gelesen markieren',
        'Show Full Text' => 'Vollständigen Text anzeigen',
        'Full Article Text' => 'Vollständiger Artikeltext',
        'No more events found. Please try changing the filter settings.' =>
            'Keine weiteren Ereignisse gefunden. Versuchen Sie die Filtereinstellungen zu verändern.',
        'by' => 'von',
        'To open links in the following article, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).' =>
            'Um die Links im folgenden Beitrag zu öffnen, kann es notwendig sein Strg oder Shift zu drücken, während auf den Link geklickt wird (abhängig vom verwendeten Browser und Betriebssystem).',
        'Close this message' => 'Diese Nachricht schließen',
        'Article could not be opened! Perhaps it is on another article page?' =>
            'Artikel konnte nicht geöffnet werden. Befindet er sich vielleicht auf einer anderen Artikelseite?',
        'Scale preview content' => 'Vorschauinhalt skalieren',
        'Open URL in new tab' => 'URL in neuem Tab öffnen',
        'Close preview' => 'Vorschau schließen',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.' =>
            'Diese Webseite kann nicht als Vorschau angezeigt werden, weil sie keine Einbettung erlaubt.',

        # Template: AttachmentBlocker
        'To protect your privacy, remote content was blocked.' => 'Zum Schutz Ihrer Privatsphäre wurden entfernte Inhalte blockiert.',
        'Load blocked content.' => 'Blockierte Inhalte laden.',

        # Template: ChatStartForm
        'First message' => 'Erste Nachricht',

        # Template: CloudServicesDisabled
        'This feature requires cloud services.' => 'Diese Funktion setzt Cloud-Services voraus.',
        'You can' => 'Sie können',
        'go back to the previous page' => 'zurück zur vorhergehenden Seite',

        # Template: CustomerError
        'An Error Occurred' => 'Ein Fehler ist aufgetreten',
        'Error Details' => 'Fehlerdetails',
        'Traceback' => 'Traceback',

        # Template: CustomerFooter
        'Powered by' => 'Powered by',

        # Template: CustomerFooterJS
        'One or more errors occurred!' => 'Ein oder mehrere Fehler sind aufgetreten!',
        'Close this dialog' => 'Diesen Dialog schließen',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'Konnte Popup-Fenster nicht öffnen. Bitte deaktivieren Sie alle Popup-Blocker für diese Anwendung.',
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Wenn Sie diese Seite verlassen, werden auch alle geöffneten Dialoge geschlossen!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'Auf diesem Bildschirm ist bereits ein Popup-Fenster geöffnet. Möchten Sie dieses schließen und dieses stattdessen öffnen?',
        'There are currently no elements available to select from.' => 'Derzeit sind keine Elemente für die Auswahl vorhanden.',
        'Please turn off Compatibility Mode in Internet Explorer!' => 'Bitte schalten Sie den Kompatibilitätsmodus im Internet Explorer aus!',
        'The browser you are using is too old.' => 'Sie verwenden leider einen (stark) veralteten Browser.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            'OTRS funktioniert mit einer großen Auswahl an Browsern, aus denen Sie wählen können. Bitte installieren Sie einen neueren Browser oder upgraden Sie Ihren vorhandenen.',
        'Please see the documentation or ask your admin for further information.' =>
            'Bitte lesen Sie auch die Dokumentation oder fragen Sie Ihren Systemadministrator.',
        'Switch to mobile mode' => 'Zur mobilen Ansicht wechseln',
        'Switch to desktop mode' => 'Zur Desktopansicht wechseln',
        'Not available' => 'Nicht verfügbar',
        'Clear all' => 'Alles löschen',
        'Clear search' => 'Suche löschen',
        '%s selection(s)...' => '%s Auswahl(en)...',
        'and %s more...' => 'und %s weitere...',
        'Filters' => 'Filter',
        'Confirm' => 'Bestätigen',
        'You have unanswered chat requests' => 'Sie haben unbeantwortete Chatanfragen',
        'Accept' => 'Annehmen',
        'Decline' => 'Ablehnen',
        'An internal error occurred.' => 'Ein interner Fehler ist aufgetreten.',
        'Connection error' => 'Verbindungsfehler',
        'Reload page' => 'Seite aktualisieren',
        'Your browser was not able to communicate with OTRS properly, there seems to be something wrong with your network connection. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.' =>
            'Ihr Browser konnte keine Verbunding mit OTRS herstellen, es scheint an ihrere Netzwerk Verbindung zu liegen. Sie könnten versuchen die Seite manuell neu zu Laden oder warten bis ihr Browser die Verbindung wieder herstellt.',
        'The connection has been re-established after a temporary connection loss. Due to this, elements on this page could have stopped to work correctly. In order to be able to use all elements correctly again, it is strongly recommended to reload this page.' =>
            'Die Verbindungen wurde nach einer kurzen Unterbrechung wiederhergestellt. Aus diesem Grund könnte es sein das einige Elemente der Seite nicht korrekt funktionieren. Um alle Elemente erneut korrekt nutzen zu können sollten Sie ihre Seite neue laden.',

        # Template: CustomerLogin
        'JavaScript Not Available' => 'JavaScript nicht aktiviert oder nicht unterstützt.',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            'Um alle Möglichkeiten von OTRS voll ausschöpfen zu können, müssen Sie JavaScript in Ihrem Browser aktivieren.',
        'Browser Warning' => 'Browser-Warnung',
        'One moment please, you are being redirected...' => 'Einen Moment bitte, Sie werden weitergeleitet...',
        'Login' => 'Anmeldung',
        'User name' => 'Benutzername',
        'Your user name' => 'Ihr Benutzername',
        'Your password' => 'Ihr Passwort',
        'Forgot password?' => 'Passwort vergessen?',
        '2 Factor Token' => '2-Faktor-Token',
        'Your 2 Factor Token' => 'Ihr 2-Faktor-Token',
        'Log In' => 'Anmelden',
        'Not yet registered?' => 'Noch nicht registriert?',
        'Request new password' => 'Neues Passwort beantragen',
        'Your User Name' => 'Ihr Benutzername',
        'A new password will be sent to your email address.' => 'Ein neues Passwort wird an Ihre E-Mail-Adresse gesendet.',
        'Create Account' => 'Konto erstellen',
        'Please fill out this form to receive login credentials.' => 'Bitte füllen Sie dieses Formular aus, um Ihre Anmeldedaten zu erhalten.',
        'How we should address you' => 'Wie sollen wir Sie ansprechen?',
        'Your First Name' => 'Ihr Vorname',
        'Your Last Name' => 'Ihr Nachname',
        'Your email address (this will become your username)' => 'Ihre E-Mail-Adresse (das wird Ihr Benutzername)',

        # Template: CustomerNavigationBar
        'Incoming Chat Requests' => 'Eingehende Chatanfragen',
        'Edit personal preferences' => 'Persönliche Einstellungen vornehmen',
        'Logout %s %s' => '%s %s abmelden',

        # Template: CustomerRichTextEditor
        'Split Quote' => 'Zitat aufteilen',
        'Open link' => 'Link öffnen',

        # Template: CustomerTicketMessage
        'Service level agreement' => 'Service-Level-Vereinbarung',

        # Template: CustomerTicketOverview
        'Welcome!' => 'Willkommen!',
        'Please click the button below to create your first ticket.' => 'Bitte verwenden Sie den Knopf unten zur Erstellung Ihres ersten Tickets.',
        'Create your first ticket' => 'Ihr erstes Ticket erstellen',

        # Template: CustomerTicketSearch
        'Profile' => 'Profil',
        'e. g. 10*5155 or 105658*' => 'z. B. 10*5155 oder 105658*',
        'Customer ID' => 'Kundennummer',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => 'Volltextsuche in Tickets (z. B. "Max*" oder "Muster*")',
        'Recipient' => 'Empfänger',
        'Carbon Copy' => 'Kopie an',
        'e. g. m*file or myfi*' => 'z.B.. m*file oder myfi*',
        'Types' => 'Typen',
        'Time restrictions' => 'Zeitbeschränkungen',
        'No time settings' => 'Keine Zeiteinstellungen',
        'Specific date' => 'spezifisches Datum',
        'Only tickets created' => 'Nur Tickets, die erstellt wurden',
        'Date range' => 'Datumsbereich',
        'Only tickets created between' => 'Nur Tickets, die erstellt wurden zwischen',
        'Ticket archive system' => 'Ticket-Archivsystem',
        'Save search as template?' => 'Suche als Vorlage speichern?',
        'Save as Template?' => 'Als Vorlage speichern?',
        'Save as Template' => 'Als Vorlage speichern',
        'Template Name' => 'Name der Vorlage',
        'Pick a profile name' => 'Profilnamen auswählen',
        'Output to' => 'Ausgabe nach',

        # Template: CustomerTicketSearchResultShort
        'of' => 'von',
        'Search Results for' => 'Suchergebnisse für',
        'Remove this Search Term.' => 'Entferne diesen Suchbegriff',

        # Template: CustomerTicketZoom
        'Start a chat from this ticket' => 'Von diesem Ticket aus einen Chat starten',
        'Expand article' => 'Artikel aufklappen',
        'Information' => 'Information',
        'Next Steps' => 'Nächste Schritte',
        'Reply' => 'Antworten',
        'Chat Protocol' => 'Chatprotokoll',

        # Template: DashboardEventsTicketCalendar
        'All-day' => 'Ganztägig',
        'Sunday' => 'Sonntag',
        'Monday' => 'Montag',
        'Tuesday' => 'Dienstag',
        'Wednesday' => 'Mittwoch',
        'Thursday' => 'Donnerstag',
        'Friday' => 'Freitag',
        'Saturday' => 'Samstag',
        'Su' => 'So',
        'Mo' => 'Mo',
        'Tu' => 'Di',
        'We' => 'Mi',
        'Th' => 'Do',
        'Fr' => 'Fr',
        'Sa' => 'Sa',
        'Event Information' => 'Ereignis-Information',
        'Ticket fields' => 'Ticket-Felder',
        'Dynamic fields' => 'Dynamische Felder',

        # Template: Datepicker
        'Invalid date (need a future date)!' => 'Ungültiges Datum (benötige Datum in der Zukunft)!',
        'Invalid date (need a past date)!' => 'Ungültiges Datum (benötige Datum in der Vergangenheit)!',
        'Previous' => 'Zurück',
        'Open date selection' => 'Datumsauswahl öffnen',

        # Template: Error
        'An error occurred.' => 'Ein Fehler ist aufgetreten.',
        'Really a bug? 5 out of 10 bug reports result from a wrong or incomplete installation of OTRS.' =>
            'Wirklich ein Bug? 5 von 10 Bugmeldungen resultieren aus einer falschen oder unvollständigen Installation von OTRS.',
        'With %s, our experts take care of correct installation and cover your back with support and periodic security updates.' =>
            'Mit der %s übernehmen unsere Experten die korrekte Installation und halten Ihnen mit Support und regelmäßigen Sicherheitsupdates den Rücken frei.',
        'Contact our service team now.' => 'Kontaktieren Sie jetzt unser Service-Team.',
        'Send a bugreport' => 'einen Fehlerbericht senden',

        # Template: FooterJS
        'Please enter at least one search value or * to find anything.' =>
            'Bitte geben Sie zumindest einen Suchbegriff ein oder * um nach Allem zu suchen.',
        'Please remove the following words from your search as they cannot be searched for:' =>
            'Bitte entfernen Sie die folgenden Wörter aus Ihrer Suche, da nach ihnen nicht gesucht werden kann:',
        'Please check the fields marked as red for valid inputs.' => 'Bitte prüfen Sie die rot markierten Felder auf gültige Eingaben.',
        'Please perform a spell check on the the text first.' => 'Bitte führen Sie zuerst eine Rechtschreibprüfung aus.',
        'Slide the navigation bar' => 'Verschieben Sie die Navigationsleiste',
        'Unavailable for chat' => 'Nicht für den Chat verfügbar',
        'Available for internal chats only' => 'Nur für interne Chats verfügbar',
        'Available for chats' => 'Verfügbar für Chats',
        'Please visit the chat manager' => 'Bitte rufen Sie den Chat-Manager auf',
        'New personal chat request' => 'Neue persönliche Chatanfrage',
        'New customer chat request' => 'Neue Kundenchatanfrage',
        'New public chat request' => 'Neue öffentliche Chatanfrage',
        'Selected user is not available for chat.' => 'Der ausgewählte Nutzer ist nicht zum Chatten verfügbar.',
        'New activity' => 'Neue Aktivität',
        'New activity on one of your monitored chats.' => 'Neue Aktivitäten in einem ihrer beobachteten Chats.',
        'Your browser does not support video and audio calling.' => 'Ihr Browser unterstützt keine Video- und Audio-Anrufe.',
        'Selected user is not available for video and audio call.' => 'Der ausgewählte Nutzer ist nicht für Video- und Audio-Anrufe verfügbar.',
        'Target user\'s browser does not support video and audio calling.' =>
            'Der Browser des anderen Benutzers unterstützt keine Video- und Audio-Anrufe.',
        'Do you really want to continue?' => 'Möchten Sie wirklich fortfahren?',
        'Information about the OTRS Daemon' => 'Informationen über den OTRS Daemon',
        'This feature is part of the %s.  Please contact us at %s for an upgrade.' =>
            'Diese Funktion ist Teil von %s. Bitte kontaktieren Sie uns unter %s bezüglich eines Upgrades.',
        'Find out more about the %s' => 'Erfahren Sie mehr über die %s',

        # Template: Header
        'You are logged in as' => 'Angemeldet als',

        # Template: Installer
        'JavaScript not available' => 'JavaScript nicht aktiviert oder nicht unterstützt.',
        'Step %s' => 'Schritt %s',
        'Database Settings' => 'Datenbankeinstellungen',
        'General Specifications and Mail Settings' => 'Allgemeine Einstellungen und E-Mail-Einstellungen',
        'Finish' => 'Abschließen',
        'Welcome to %s' => 'Willkommen bei %s',
        'Web site' => 'Website',
        'Mail check successful.' => 'Konfigurationsprüfung erfolgreich.',
        'Error in the mail settings. Please correct and try again.' => 'Fehler in der Mail-Konfiguration. Bitte korrigieren und nochmals probieren.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => 'Mailversand konfigurieren',
        'Outbound mail type' => 'Typ der ausgehenden E-Mail',
        'Select outbound mail type.' => 'Typ der ausgehenden E-Mail auswählen',
        'Outbound mail port' => 'Port der ausgehenden E-Mail',
        'Select outbound mail port.' => 'Port der ausgehenden E-Mail auswählen',
        'SMTP host' => 'SMTP-Host',
        'SMTP host.' => 'SMTP-Host.',
        'SMTP authentication' => 'SMPT-Authentifizierung',
        'Does your SMTP host need authentication?' => 'Benötigt der SMTP-Host eine Authentifizierung?',
        'SMTP auth user' => 'Benutzer für SMTP-Authentifizierung',
        'Username for SMTP auth.' => 'Benutzername für SMTP-Authentifizierung.',
        'SMTP auth password' => 'Passwort für SMTP-Authentifizierung',
        'Password for SMTP auth.' => 'Passwort für SMTP-Authentifizierung.',
        'Configure Inbound Mail' => 'Mailempfang konfigurieren',
        'Inbound mail type' => 'Typ der eingehenden E-Mail',
        'Select inbound mail type.' => 'Typ der eingehenden E-Mail auswählen',
        'Inbound mail host' => 'Host der eingehenden E-Mail',
        'Inbound mail host.' => 'Host der eingehenden E-Mail.',
        'Inbound mail user' => 'Benutzer der eingehenden E-Mail',
        'User for inbound mail.' => 'Benutzername der eingehenden E-Mail',
        'Inbound mail password' => 'Passwort der eingehenden E-Mail',
        'Password for inbound mail.' => 'Passwort der eingehenden E-Mail.',
        'Result of mail configuration check' => 'Ergebnis der E-Mail-Konfigurationsprüfung',
        'Check mail configuration' => 'E-Mail-Konfiguration prüfen',
        'Skip this step' => 'Diesen Schritt überspringen',

        # Template: InstallerDBResult
        'Database setup successful!' => 'Datenbank erfolgreich erstellt!',

        # Template: InstallerDBStart
        'Install Type' => 'Installationstyp',
        'Create a new database for OTRS' => 'Neue Datenbank für OTRS erstellen',
        'Use an existing database for OTRS' => 'Bestehende Datenbank für OTRS nutzen',

        # Template: InstallerDBmssql
        'Database name' => 'Datenbankname',
        'Check database settings' => 'Datenbankeinstellungen prüfen',
        'Result of database check' => 'Ergebnis der Datenbankprüfung',
        'Database check successful.' => 'Datenbankprüfung erfolgreich.',
        'Database User' => 'Datenbankbenutzer',
        'New' => 'Neu',
        'A new database user with limited permissions will be created for this OTRS system.' =>
            'Ein neuer Datenbank-Benutzer mit beschränkten Rechten wird für dieses OTRS-System erstellt.',
        'Repeat Password' => 'Passwort wiederholen',
        'Generated password' => 'Generiertes Passwort',

        # Template: InstallerDBmysql
        'Passwords do not match' => 'Passworte stimmen nicht überein',

        # Template: InstallerDBoracle
        'SID' => 'SID',
        'Port' => 'Port',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Um OTRS nutzen zu können, müssen die die folgenden Zeilen als root in die Befehlszeile (Terminal/Shell) eingeben.',
        'Restart your webserver' => 'Starten Sie ihren Webserver neu.',
        'After doing so your OTRS is up and running.' => 'Danach ist OTRS startklar.',
        'Start page' => 'Startseite',
        'Your OTRS Team' => 'Ihr OTRS-Team',

        # Template: InstallerLicense
        'Don\'t accept license' => 'Lizenz _nicht_ akzeptieren',
        'Accept license and continue' => 'Lizenz akzeptieren und fortfahren',

        # Template: InstallerSystem
        'SystemID' => 'SystemID',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'Der System-Identifizierer. Jede Ticketnummer und jede HTTP-Sitzungs-ID enthalten diese Nummer.',
        'System FQDN' => 'System FQDN',
        'Fully qualified domain name of your system.' => 'Voll qualifizierter Domainname Ihres Systems.',
        'AdminEmail' => 'E-Mail des Administrators',
        'Email address of the system administrator.' => 'E-Mail-Adresse des Administrators.',
        'Organization' => 'Organisation',
        'Log' => 'Protokoll',
        'LogModule' => 'Protokollmodul',
        'Log backend to use.' => 'Protokoll-Backend, welches verwendet werden soll.',
        'LogFile' => 'Protokolldatei',
        'Webfrontend' => 'Web-Oberfläche',
        'Default language' => 'Standardsprache',
        'Default language.' => 'Standardsprache.',
        'CheckMXRecord' => 'MX-Records prüfen',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'E-Mail-Adressen, die vom Benutzer angegeben werden, werden gegen die MX-Einträge im DNS geprüft. Verwenden Sie diese Option nicht, wenn Ihr DNS langsam ist oder öffentliche Adressen nicht auflösen kann.',

        # Template: LinkObject
        'Object#' => 'Objektnummer',
        'Add links' => 'Verknüpfungen hinzufügen',
        'Delete links' => 'Verknüpfungen löschen',

        # Template: Login
        'Lost your password?' => 'Passwort verloren?',
        'Request New Password' => 'Neues Passwort anfordern',
        'Back to login' => 'Zurück zur Anmeldung',

        # Template: MobileNotAvailableWidget
        'Feature not available' => 'Funktion nicht verfügbar',
        'Sorry, but this feature of OTRS is currently not available for mobile devices. If you\'d like to use it, you can either switch to desktop mode or use your regular desktop device.' =>
            'Entschuldigung, aber dieses Feature von OTRS ist derzeit nicht für Mobilgeräte verfügbar. Bitte wechseln sie in die Desktopansicht oder nutzen sie ein normales Desktopgerät, wenn Sie diese Funktion verwenden möchten.',

        # Template: Motd
        'Message of the Day' => 'Nachricht des Tages',
        'This is the message of the day. You can edit this in %s.' => 'Das ist die Nachricht des Tages. Sie können diese in %s bearbeiten.',

        # Template: NoPermission
        'Insufficient Rights' => 'Nicht ausreichende Rechte',
        'Back to the previous page' => 'Zurück zur vorhergehenden Seite',

        # Template: Pagination
        'Show first page' => 'Erste Seite anzeigen',
        'Show previous pages' => 'Vorige Seiten anzeigen',
        'Show page %s' => 'Seite %s anzeigen',
        'Show next pages' => 'Nächste Seiten anzeigen',
        'Show last page' => 'Letzte Seite anzeigen',

        # Template: PictureUpload
        'Need FormID!' => 'FormID benötigt!',
        'No file found!' => 'Keine Datei gefunden!',
        'The file is not an image that can be shown inline!' => 'Diese Datei ist kein Bild, das inline angezeigt werden kann!',

        # Template: PreferencesNotificationEvent
        'Notification' => 'Benachrichtigung',
        'No user configurable notifications found.' => 'Keine vom Benutzer konfigurierbaren Benachrichtigungen gefunden.',
        'Receive messages for notification \'%s\' by transport method \'%s\'.' =>
            'Nachrichten für Benachrichtigung \'%s\' mittels Transportmethode \'%s\' empfangen.',
        'Please note that you can\'t completely disable notifications marked as mandatory.' =>
            'Bitte beachten Sie, dass sie als erforderlich markierte Benachrichtigungen nicht vollständig deaktivieren können.',
        'Sorry, but you can\'t disable all methods for notifications marked as mandatory.' =>
            'Entschuldigung, Sie können für eine erforderliche Benachrichtigungen nicht alle Benachrichtigungsmethoden abschalten.',
        'Sorry, but you can\'t disable all methods for this notification.' =>
            'Entschuldigung, Sie können für diese Benachrichtigung nicht alle Benachrichtigungsmethoden abschalten.',

        # Template: ActivityDialogHeader
        'Process Information' => 'Prozess-Informationen',
        'Dialog' => 'Dialog',

        # Template: Article
        'Inform Agent' => 'Agenten informieren',

        # Template: PublicDefault
        'Welcome' => 'Willkommen',
        'This is the default public interface of OTRS! There was no action parameter given.' =>
            'Dies ist die öffentliche Standard-Benutzerschnittstelle von OTRS. Es wurde kein Action-Parameter übergeben.',
        'You could install a custom public module (via the package manager), for example the FAQ module, which has a public interface.' =>
            'Sie könnten (mithilfe des Paketmanagers) ein eigenes Modul für den öffentlichen Bereich von OTRS installieren, beispielsweise das FAQ-Modul.',

        # Template: RichTextEditor
        'Remove Quote' => 'Zitat entfernen',

        # Template: GeneralSpecificationsWidget
        'Permissions' => 'Rechtevergabe',
        'You can select one or more groups to define access for different agents.' =>
            'Sie können eine oder mehrere Gruppen definieren, um Zugriffsrechte für verschiedene Agenten zu vergeben.',
        'Result formats' => 'Ergebnisformate',
        'The selected time periods in the statistic are time zone neutral.' =>
            'Die ausgewählten Zeitperioden der Statistik sind Zeitzonen-unabhängig.',
        'Create summation row' => 'Summenzeile erzeugen',
        'Generate an additional row containing sums for all data rows.' =>
            'Eine zusätzliche Zeile mit Summen für alle Datenzeilen erzeugen.',
        'Create summation column' => 'Summenspalte erzeugen',
        'Generate an additional column containing sums for all data columns.' =>
            'Eine zusätzliche Spalte mit Summen für alle Datenspalten erzeugen.',
        'Cache results' => 'Ergebnisse cachen',
        'Stores statistics result data in a cache to be used in subsequent views with the same configuration (requires at least one selected time field).' =>
            '',
        'Provide the statistic as a widget that agents can activate in their dashboard.' =>
            'Diese Statistik als Dashboard-Widget anbieten, die Agenten in Ihrem Dashboard aktivieren können.',
        'Please note that enabling the dashboard widget will activate caching for this statistic in the dashboard.' =>
            'Bitte beachten Sie, dass das Dashboard-Widget das Caching für diese Statistik aktiviert.',
        'If set to invalid end users can not generate the stat.' => 'Bei "ungültig" können Nutzer die Statistik nicht mehr ausführen.',

        # Template: PreviewWidget
        'There are problems in the configuration of this statistic:' => 'Es bestehen Probleme in der Konfiguration dieser Statistik:',
        'You may now configure the X-axis of your statistic.' => 'Sie können jetzt die X-Achse Ihrer Statistik konfigurieren.',
        'This statistic does not provide preview data.' => 'Diese Statistik stellt keine Vorschaudaten zur Verfügung.',
        'Preview format:' => 'Vorschauformat:',
        'Please note that the preview uses random data and does not consider data filters.' =>
            'Bitte beachten Sie, dass die Vorschau Zufallsdaten verwendet und keine Datenfilter berücksichtigt.',
        'Configure X-Axis' => 'X-Achse konfigurieren',
        'X-axis' => 'X-Achse',
        'Configure Y-Axis' => 'Y-Achse konfigurieren',
        'Y-axis' => 'Y-Achse',
        'Configure Filter' => 'Filter konfigurieren',

        # Template: RestrictionsWidget
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Bitte wählen Sie nur ein Attribut aus oder entfernen Sie das Häkchen der Checkbox \'Fixiert\'!',
        'Absolute period' => 'Absoluter Zeitraum',
        'Between' => 'Zwischen',
        'Relative period' => 'Relativer Zeitraum',
        'The past complete %s and the current+upcoming complete %s %s' =>
            'Die vergangenen %s und der/die aktuelle+kommenden %s %s.',
        'Do not allow changes to this element when the statistic is generated.' =>
            'Beim Erzeugen der Statistik keine Veränderungen an diesem Element erlauben.',

        # Template: StatsParamsWidget
        'Format' => 'Format',
        'Exchange Axis' => 'Achsen vertauschen',
        'Configurable params of static stat' => 'Konfigurierbare Parameter der statischen Statistik',
        'No element selected.' => 'Es wurde kein Element ausgewählt.',
        'Scale' => 'Skalierung',
        'show more' => 'mehr anzeigen',
        'show less' => 'weniger anzeigen',

        # Template: D3
        'Download SVG' => 'SVG herunterladen',
        'Download PNG' => 'PNG herunterladen',

        # Template: XAxisWidget
        'The selected time period defines the default time frame for this statistic to collect data from.' =>
            'Der ausgewählte Zeitabschnitt definiert den (voreingestellten) Zeitraum, aus dem diese Statistik Daten aggregiert.',
        'Defines the time unit that will be used to split the selected time period into reporting data points.' =>
            'Definiert die Zeiteinheit, anhand welcher der ausgewählte Zeitraum in Berichts-Datenpunkte aufgeteilt wird.',

        # Template: YAxisWidget
        'Please remember that the scale for the Y-axis has to be larger than the scale for the X-axis (e.g. X-axis => Month, Y-Axis => Year).' =>
            'Bitte beachten Sie, dass die Skalierung der Y-Achse größer sein muss als die Skalierung der X-Achse (z. B. X-Achse => Monat, Y-Achse => Jahr).',

        # Template: Test
        'OTRS Test Page' => 'OTRS Testseite',
        'Welcome %s %s' => '%s %s willkommen',
        'Counter' => 'Zähler',

        # Template: Warning
        'Go back to the previous page' => 'Zurück zur vorhergehenden Seite',

        # Perl Module: Kernel/Config/Defaults.pm
        'View system log messages.' => 'Systemprotokollnachrichten ansehen.',
        'Update and extend your system with software packages.' => 'System mit Softwarepaketen aktualisieren und erweitern.',

        # Perl Module: Kernel/Modules/AdminACL.pm
        'ACLs could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            'ACLs konnten aufgrund eines unbekannten Fehlers nicht importiert werden, bitte prüfen Sie das OTRS-Log für mehr Information.',
        'The following ACLs have been added successfully: %s' => 'Die folgenden ACLs wurden erfolgreich hinzugefügt: %s',
        'The following ACLs have been updated successfully: %s' => 'Die folgenden ACLs wurden erfolgreich aktualisiert: %s',
        'There where errors adding/updating the following ACLs: %s. Please check the log file for more information.' =>
            'Beim Hinzufügen/Aktualisieren der folgenden ACLs sind Fehler aufgetreten: %s. Bitte prüfen Sie das OTRS-Log für mehr Informationen.',
        'This field is required' => 'Dieses Feld wird benötigt',
        'There was an error creating the ACL' => 'Es gab einen Fehler beim Erstellen der ACL',
        'Need ACLID!' => 'ACLID benötigt!',
        'Could not get data for ACLID %s' => 'Konnte keine Daten für ACLID %s ermitteln.',
        'There was an error updating the ACL' => 'Beim Aktualisieren der ACL ist ein Fehler aufgetreten',
        'There was an error setting the entity sync status.' => 'Beim Setzen des Synchronisations-Status des Objekts ist ein Fehler aufgetreten.',
        'There was an error synchronizing the ACLs.' => 'Es gab einen Fehler beim Synchronisieren der ACLs.',
        'ACL %s could not be deleted' => 'ACL %s konnte nicht gelöscht werden',
        'There was an error getting data for ACL with ID %s' => 'Es gab einen Fehler beim Holen der Daten für die ACL mit der Kennung %s',
        'Exact match' => 'Genauer Treffer',
        'Negated exact match' => 'Negierter genauer Treffer',
        'Regular expression' => 'Regulärer Ausdruck',
        'Regular expression (ignore case)' => 'Regulärer Ausdruck (Groß-/Kleinschreibung ignorieren)',
        'Negated regular expression' => 'Negierter Regulärer Ausdruck',
        'Negated regular expression (ignore case)' => 'Negierter regulärer Ausdruck (Groß-/Kleinschreibung ignorieren)',

        # Perl Module: Kernel/Modules/AdminCustomerCompany.pm
        'Customer Company %s already exists!' => 'Die Kundenfirma %s existiert bereits!',

        # Perl Module: Kernel/Modules/AdminCustomerUser.pm
        'New phone ticket' => 'Neues Telefon-Ticket',
        'New email ticket' => 'Neues E-Mail-Ticket',

        # Perl Module: Kernel/Modules/AdminDynamicField.pm
        'Fields configuration is not valid' => 'Felderkonfiguration ist nicht gültig',
        'Objects configuration is not valid' => 'Die Objekt-Konfiguration ist ungültig',
        'Could not reset Dynamic Field order properly, please check the error log for more details.' =>
            'Konnte die Reihenfolge der dynamischen Felder nicht zurücksetzen, bitte prüfen Sie das Log für mehr Informationen.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldCheckbox.pm
        'Undefined subaction.' => 'Unbestimmte Subaktion.',
        'Need %s' => '%s benötigt',
        'The field does not contain only ASCII letters and numbers.' => 'Dieses Feld enthält nicht nur ASCII-Zeichen.',
        'There is another field with the same name.' => 'Es existiert bereits ein Feld mit demselben Namen.',
        'The field must be numeric.' => 'Das Feld darf nur Zahlen beinhalten.',
        'Need ValidID' => 'Benötige ValidID',
        'Could not create the new field' => 'Konnte das neue Feld nicht anlegen',
        'Need ID' => 'Kennung benötigt',
        'Could not get data for dynamic field %s' => 'Konnte keine Daten für das dynamische Feld %s ermitteln.',
        'The name for this field should not change.' => 'Der Name dieses Feldes sollte sich nicht ändern.',
        'Could not update the field %s' => 'Das Feld %s konnte nicht aktualisiert werden',
        'Currently' => 'Aktuell',
        'Unchecked' => 'Nicht ausgewählt',
        'Checked' => 'Ausgewählt',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDateTime.pm
        'Prevent entry of dates in the future' => 'Eingabe von zukünftigen Datumswerten verhindern',
        'Prevent entry of dates in the past' => 'Eingabe von vergangenen Datumswerten verhindern',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDropdown.pm
        'This field value is duplicated.' => 'Dieser Wert existiert bereits.',

        # Perl Module: Kernel/Modules/AdminEmail.pm
        'Select at least one recipient.' => 'Wählen Sie mindestens einen Empfänger aus.',

        # Perl Module: Kernel/Modules/AdminGenericAgent.pm
        'archive tickets' => 'Tickets archivieren',
        'restore tickets from archive' => 'Tickets aus dem Archiv wiederherstellen',
        'Need Profile!' => 'Benötige Profile!',
        'Got no values to check.' => 'Keine Werte zum Prüfen empfangen.',
        'Please remove the following words because they cannot be used for the ticket selection:' =>
            'Bitte entfernen Sie die folgenden Worte, da sie nicht für die Ticketauswahl genutzt werden können:',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceDebugger.pm
        'Need WebserviceID!' => 'Benötige WebserviceID!',
        'Could not get data for WebserviceID %s' => 'Konnte keine Daten für WebserviceID %s ermitteln!',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerDefault.pm
        'Need InvokerType' => 'Benötige InvokerType',
        'Invoker %s is not registered' => 'Invoker %s ist nicht registriert',
        'InvokerType %s is not registered' => 'InvokerType %s ist nicht registriert',
        'Need Invoker' => 'Benötige Invoker',
        'Could not determine config for invoker %s' => 'Konnte Konfiguration für Invoker %s nicht ermitteln',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingSimple.pm
        'Could not get registered configuration for action type %s' => 'Konnte keine registrierte Konfiguration für Action Typ %s ermitteln',
        'Could not get backend for %s %s' => 'Konnte Backend für %s %s nicht ermitteln',
        'Could not update configuration data for WebserviceID %s' => 'Konnte Konfigurationsdaten für WebserviceID %s nicht aktualisieren',
        'Keep (leave unchanged)' => 'Behalten (unverändert lassen)',
        'Ignore (drop key/value pair)' => 'Ignorieren (Schlüssel-Wert-Paar entfernen)',
        'Map to (use provided value as default)' => 'Ändern in (verwende angegeben Wert als Standard)',
        'Exact value(s)' => 'Genaue(r) Wert(e)',
        'Ignore (drop Value/value pair)' => 'Ignorieren (Wert-Wert-Paar entfernen)',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingXSLT.pm
        'Could not find required library %s' => 'Konnte benötigte Bibliothek %s nicht finden',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceOperationDefault.pm
        'Need OperationType' => 'Benötige OperationType',
        'Operation %s is not registered' => 'Operation %s ist nicht registriert',
        'OperationType %s is not registered' => 'OperationType %s ist nicht registriert',
        'Need Operation' => 'Operation benötigt',
        'Could not determine config for operation %s' => 'Konnte Konfiguration für Operation %s nicht ermitteln',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceTransportHTTPREST.pm
        'Need Subaction!' => 'Subaktion benötigt!',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebservice.pm
        'There is another web service with the same name.' => 'Es existiert bereits ein Webservice mit demselben Namen.',
        'There was an error updating the web service.' => 'Beim Aktualisieren des Webservice ist ein Fehler aufgetreten.',
        'Web service "%s" updated!' => 'Web Service "%s" aktualisiert!',
        'There was an error creating the web service.' => 'Beim Erstellen des Webservice ist ein Fehler aufgetreten.',
        'Web service "%s" created!' => 'Web Service "%s" erstellt!',
        'Need Name!' => 'Name benötigt!',
        'Need ExampleWebService!' => 'Benötige ExampleWebService!',
        'Could not read %s!' => 'Konnte %s nicht lesen!',
        'Need a file to import!' => 'Benötige eine zu importierende Datei!',
        'The imported file has not valid YAML content! Please check OTRS log for details' =>
            'Die importierte Datei enthält ungültigen YAML-Inhalt. Bitte prüfen Sie das OTRS-Log für mehr Informationen.',
        'Web service "%s" deleted!' => 'Web Service "%s" gelöscht!',
        'New Web service' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebserviceHistory.pm
        'Got no WebserviceHistoryID!' => 'Keine WebserviceHistoryID empfangen!',
        'Could not get history data for WebserviceHistoryID %s' => 'Konnte Historie für WebserviceHistoryID %s nicht finden',

        # Perl Module: Kernel/Modules/AdminNotificationEvent.pm
        'Notification updated!' => 'Benachrichtigung aktualisiert!',
        'Notification added!' => 'Benachrichtigung hinzugefügt!',
        'There was an error getting data for Notification with ID:%s!' =>
            'Beim Ermitteln der Daten für die Benachrichtigung mit der ID %s ist ein Fehler aufgetreten!',
        'Unknown Notification %s!' => 'Unbekannte Benachrichtigung %s!',
        'There was an error creating the Notification' => 'Beim Erstellen der Benachrichtigung ist ein Fehler aufgetreten',
        'Notifications could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            'Benachrichtigungen konnten aufgrund eines unbekannten Fehlers nicht importiert werden. Bitte prüfen Sie das OTRS-Log für mehr Informationen.',
        'The following Notifications have been added successfully: %s' =>
            'Folgende Benachrichtigungen wurden erfolgreich importiert: %s',
        'The following Notifications have been updated successfully: %s' =>
            'Folgende Benachrichtigungen wurden erfolgreich aktualisiert: %s',
        'There where errors adding/updating the following Notifications: %s. Please check the log file for more information.' =>
            'Beim Hinzufügen/Aktualisieren der folgenden Benachrichtigungen sind Fehler aufgetreten: %s. Bitte prüfen Sie das OTRS-Log für mehr Informationen.',
        'Agent who owns the ticket' => 'Agent, dem das Ticket gehört',
        'Agent who is responsible for the ticket' => 'Agent, der für das Ticket verantwortlich ist',
        'All agents watching the ticket' => 'Alle Agenten beobachten das Ticket',
        'All agents with write permission for the ticket' => 'Alle Agenten mit Schreibberechtigung für das Ticket',
        'All agents subscribed to the ticket\'s queue' => 'Alle Agenten, die die Queue des Tickets abonniert haben',
        'All agents subscribed to the ticket\'s service' => 'Alle Agenten, die den Service des Tickets abonniert haben',
        'All agents subscribed to both the ticket\'s queue and service' =>
            'Alle Agenten, die sowohl Queue als auch Service des Tickets abonniert haben',
        'Customer of the ticket' => 'Kunde des Tickets',
        'Yes, but require at least one active notification method' => 'Ja, aber mindestens eine Benachrichtigungsmethode muss aktiviert sein',

        # Perl Module: Kernel/Modules/AdminPGP.pm
        'PGP environment is not working. Please check log for more info!' =>
            'Die PGP-Umgebung funktioniert derzeit nicht. Bitte prüfen Sie das Log für mehr Informationen.',
        'Need param Key to delete!' => 'Benötige Parameter "Key" zum Löschen!',
        'Key %s deleted!' => 'Schlüssel %s gelöscht!',
        'Need param Key to download!' => 'Benötige Parameter "Key" zum herunterladen!',

        # Perl Module: Kernel/Modules/AdminPackageManager.pm
        'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/otrs.Console.pl to install packages!' =>
            'Entschuldigung, Apache::Reload wird als Perl-Modul und PerlInitHandler in der Apache-Konfiguration benötigt (siehe auch scripts/apache2-httpd.include.conf). Alternativ können Sie Pakete auch mithilfe des Kommandozeilen-Tools bin/otrs.Console.pl installieren.',
        'No such package!' => 'Kein solches Paket!',
        'No such file %s in package!' => 'Keine solche Datei %s im Paket!',
        'No such file %s in local file system!' => 'Datei %s existiert nicht im Dateisystem!',
        'Can\'t read %s!' => 'Kann %s nicht lesen!',
        'File is OK' => 'Datei ist OK',
        'Package has locally modified files.' => 'Das Paket enthält lokal angepasste Dateien.',
        'No packages or no new packages found in selected repository.' =>
            'Keine (neuen) Pakete im ausgewählten Verzeichnis gefunden.',
        'Package not verified due a communication issue with verification server!' =>
            'Paket nicht verifiziert aufgrund eines Kommunikationsproblems mit dem Verifikationsserver!',
        'Can\'t connect to OTRS Feature Add-on list server!' => 'Kann nicht zum OTRS Feature-Addon-Listenserver verbinden!',
        'Can\'t get OTRS Feature Add-on list from server!' => 'Kann OTRS Feature-Add-on-Listen nicht vom Server laden!',
        'Can\'t get OTRS Feature Add-on from server!' => 'Kann OTRS Feature-Add-on nicht vom Server laden!',

        # Perl Module: Kernel/Modules/AdminPostMasterFilter.pm
        'No such filter: %s' => 'Kein solcher Filter: %s',

        # Perl Module: Kernel/Modules/AdminProcessManagement.pm
        'Need ExampleProcesses!' => 'Benötige ExampleProcesses!',
        'Need ProcessID!' => 'Benötige ProcessID!',
        'Yes (mandatory)' => 'Ja (erforderlich)',
        'Unknown Process %s!' => 'Unbekannter Prozess %s!',
        'There was an error generating a new EntityID for this Process' =>
            'Beim Generieren einer EntityID für diesen Prozess ist ein Fehler aufgetreten.',
        'The StateEntityID for state Inactive does not exists' => 'Die StateEntityID für den Status "Inaktiv" existiert nicht.',
        'There was an error creating the Process' => 'Beim Erstellen des Prozesses ist ein Fehler aufgetreten.',
        'There was an error setting the entity sync status for Process entity: %s' =>
            'Beim Setzen des Synchronisations-Status für Prozess %s ist ein Fehler aufgetreten.',
        'Could not get data for ProcessID %s' => 'Konnte Daten für ProzessID %s nicht ermitteln.',
        'There was an error updating the Process' => 'Beim Aktualisieren des Prozesses ist ein Fehler aufgetreten',
        'Process: %s could not be deleted' => 'Prozess %s konnte nicht gelöscht werden',
        'There was an error synchronizing the processes.' => 'Beim Synchronisieren des Prozesses ist ein Fehler aufgetreten.',
        'The %s:%s is still in use' => 'Der/die/das %s:%s ist noch in Benutzung',
        'The %s:%s has a different EntityID' => 'Der/die/das %s:%s hat eine abweichende EntityID',
        'Could not delete %s:%s' => 'Konnte %s:%s nicht löschen',
        'There was an error setting the entity sync status for %s entity: %s' =>
            'Beim Setzen des Synchronisations-Status für %s %s ist ein Fehler aufgetreten.',
        'Could not get %s' => 'Konnte %s nicht ermitteln',
        'Need %s!' => 'Benötige %s!',
        'Process: %s is not Inactive' => 'Prozess: %s ist nicht aktiv',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivity.pm
        'There was an error generating a new EntityID for this Activity' =>
            'Beim Generieren einer neuen EntityID für diese Aktivität ist ein Fehler aufgetreten',
        'There was an error creating the Activity' => 'Beim Erstellen der Aktivität ist ein Fehler aufgetreten',
        'There was an error setting the entity sync status for Activity entity: %s' =>
            'Beim Setzen des Synchronisations-Status für Aktivität %s ist ein Fehler aufgetreten',
        'Need ActivityID!' => 'Benötige ActivityID!',
        'Could not get data for ActivityID %s' => 'Konnte Daten für ActivityID %s nicht ermitteln',
        'There was an error updating the Activity' => 'Beim Aktualisieren der Aktivität ist ein Fehler aufgetreten',
        'Missing Parameter: Need Activity and ActivityDialog!' => 'Fehlende Parameter: Benötige Activity und ActivityDialog!',
        'Activity not found!' => 'Activität nicht gefunden!',
        'ActivityDialog not found!' => 'AktivitätsDialog nicht gefunden!',
        'ActivityDialog already assigned to Activity. You cannot add an ActivityDialog twice!' =>
            'Aktivitätsdialog wurde der Aktivität bereits zugeordnet. Sie können denselben Dialog nicht mehrfach zuordnen.',
        'Error while saving the Activity to the database!' => 'Während des Speicherns der Aktivität ist ein Fehler aufgetreten!',
        'This subaction is not valid' => 'Diese Aktion ist ungültig',
        'Edit Activity "%s"' => 'Aktivität "%s" bearbeiten',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivityDialog.pm
        'There was an error generating a new EntityID for this ActivityDialog' =>
            'Beim Generieren einer neuen EntityID für diesen Aktivitäts-Dialog ist ein Fehler aufgetreten.',
        'There was an error creating the ActivityDialog' => 'Beim Erstellen des Aktivitäts-Dialogs ist ein Fehler aufgetreten.',
        'There was an error setting the entity sync status for ActivityDialog entity: %s' =>
            'Beim Setzen des Synchronisations-Status für Aktivitäts-Dialog %s ist ein Fehler aufgetreten.',
        'Need ActivityDialogID!' => 'Benötige ActivityDialogID!',
        'Could not get data for ActivityDialogID %s' => 'Konnte Daten für ActivityDialogID %s nicht ermitteln',
        'There was an error updating the ActivityDialog' => 'Beim Aktualisieren des Aktivitäts-Dialogs ist ein Fehler aufgetreten.',
        'Edit Activity Dialog "%s"' => 'AktivitätsDialog "%s" bearbeiten',
        'Agent Interface' => 'Agenten-Oberfläche',
        'Customer Interface' => 'Kunden-Oberfläche',
        'Agent and Customer Interface' => 'Agenten- und Kunden-Oberfläche',
        'Do not show Field' => 'Feld nicht anzeigen',
        'Show Field' => 'Feld anzeigen',
        'Show Field As Mandatory' => 'Als Pflichtfeld anzeigen',
        'fax' => 'Fax',

        # Perl Module: Kernel/Modules/AdminProcessManagementPath.pm
        'Edit Path' => 'Pfad bearbeiten',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransition.pm
        'There was an error generating a new EntityID for this Transition' =>
            'Beim Generieren einer neuen EntityID für diese Transition ist ein Fehler aufgetreten.',
        'There was an error creating the Transition' => 'Beim Erstellen der Transition ist ein Fehler aufgetreten.',
        'There was an error setting the entity sync status for Transition entity: %s' =>
            'Beim Setzen des Synchronisations-Status für Transition %s ist ein Fehler aufgetreten.',
        'Need TransitionID!' => 'Benötige TransitionID!',
        'Could not get data for TransitionID %s' => 'Konnte Daten für TransitionID %s nicht ermitteln',
        'There was an error updating the Transition' => 'Beim Aktualisieren der Transition ist ein Fehler aufgetreten.',
        'Edit Transition "%s"' => 'Bearbeite Transition %s',
        'xor' => 'exklusives oder (xor)',
        'String' => 'Zeichenkette',
        'Transition validation module' => 'Transition-Validierungs-Modul',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransitionAction.pm
        'At least one valid config parameter is required.' => 'Mindestens ein gültiger Konfigurations-Parameter wird benötigt.',
        'There was an error generating a new EntityID for this TransitionAction' =>
            'Beim Generieren einer neuen EntityID für diese Transition-Aktion ist ein Fehler aufgetreten.',
        'There was an error creating the TransitionAction' => 'Beim Erstellen der Transition-Aktion ist ein Fehler aufgetreten.',
        'There was an error setting the entity sync status for TransitionAction entity: %s' =>
            'Beim Setzen des Synchronisations-Status der Transition-Aktion %s ist ein Fehler aufgetreten.',
        'Need TransitionActionID!' => 'Benötige TransitionActionID!',
        'Could not get data for TransitionActionID %s' => 'Konnte Daten für TransitionActionID %s nicht ermitteln',
        'There was an error updating the TransitionAction' => 'Beim Aktualisieren der Transition-Aktion ist ein Fehler aufgetreten.',
        'Edit Transition Action "%s"' => 'Bearbeite Transition-Aktion %s',
        'Error: Not all keys seem to have values or vice versa.' => 'Fehler: Es scheint, als wären nicht allen Schlüssel auch Werte zugewiesen (oder umgekehrt).',

        # Perl Module: Kernel/Modules/AdminQueue.pm
        'Don\'t use :: in queue name!' => 'Bitte nutzen Sie innerhalb eines Queue-Namens nicht "::"!',
        'Click back and change it!' => 'Gehen Sie zurück, um Änderungen vorzunehmen.',

        # Perl Module: Kernel/Modules/AdminQueueAutoResponse.pm
        'Queues ( without auto responses )' => 'Queues (ohne automatische Antworten)',

        # Perl Module: Kernel/Modules/AdminSMIME.pm
        'S/MIME environment is not working. Please check log for more info!' =>
            'Die S/MIME-Umgebung funktioniert derzeit nicht. Bitte prüfen Sie das Log für mehr Informationen.',
        'Need param Filename to delete!' => 'Benötige Parameter "Filename" zum Löschen!',
        'Need param Filename to download!' => 'Benötige Parameter "Filename" zum Herunterladen!',
        'Needed CertFingerprint and CAFingerprint!' => 'Benötige CertFingerprint und CAFingerprint!',
        'CAFingerprint must be different than CertFingerprint' => 'CAFingerprint und CertFingerprint müssen unterschiedlich sein',
        'Relation exists!' => 'Beziehung existiert!',
        'Relation added!' => 'Beziehung hinzugefügt!',
        'Impossible to add relation!' => 'Beziehung konnte nicht hinzugefügt werden!',
        'Relation doesn\'t exists' => 'Beziehung existiert nicht',
        'Relation deleted!' => 'Beziehung gelöscht!',
        'Impossible to delete relation!' => 'Beziehung konnte nicht gelöscht werden!',
        'Certificate %s could not be read!' => 'Zertifikat %s konnte nicht gelesen werden!',
        'Needed Fingerprint' => 'Benötige Fingerprint',

        # Perl Module: Kernel/Modules/AdminSalutation.pm
        'Salutation updated!' => 'Begrüßung aktualisiert!',
        'Salutation added!' => 'Begrüßung hinzugefügt!',

        # Perl Module: Kernel/Modules/AdminSupportDataCollector.pm
        'File %s could not be read!' => 'Datei %s kann nicht gelesen werden!',

        # Perl Module: Kernel/Modules/AdminSysConfig.pm
        'Import not allowed!' => 'Import nicht erlaubt!',
        'Need File!' => 'Datei benötigt!',
        'Can\'t write ConfigItem!' => 'Kann Konfigurations-Element nicht schreibtn!',

        # Perl Module: Kernel/Modules/AdminSystemMaintenance.pm
        'Start date shouldn\'t be defined after Stop date!' => 'Das Startdatum sollte nicht nach dem Enddatum liegen!',
        'There was an error creating the System Maintenance' => 'Beim Erstellen des Wartungszeitraums ist ein Fehler aufgetreten',
        'Need SystemMaintenanceID!' => 'Benötige SystemMaintenanceID!',
        'Could not get data for SystemMaintenanceID %s' => 'Konnte Daten für SystemMaintenanceID %s nicht ermitteln',
        'System Maintenance was saved successfully!' => 'Wartungszeitraum wurde erfolgreich gespeichert!',
        'Session has been killed!' => 'Sitzung wurde beendet!',
        'All sessions have been killed, except for your own.' => 'Alle Sitzungen wurden gelöscht, außer Ihrer eigenen.',
        'There was an error updating the System Maintenance' => 'Beim Aktualisieren des Wartungszeitraums ist ein Fehler aufgetreten',
        'Was not possible to delete the SystemMaintenance entry: %s!' => 'Wartungszeitraum %s konnte nicht gelöscht werden!',

        # Perl Module: Kernel/Modules/AdminTemplate.pm
        'Template updated!' => 'Vorlage aktualisiert!',
        'Template added!' => 'Vorlage hinzugefügt!',

        # Perl Module: Kernel/Modules/AdminType.pm
        'Need Type!' => 'Typ benötigt!',

        # Perl Module: Kernel/Modules/AgentDashboardCommon.pm
        'No such config for %s' => 'Keine solche Konfiguration für %s',
        'Statistic' => 'Statistik',
        'No preferences for %s!' => 'Keine Einstellungen für %s!',
        'Can\'t get element data of %s!' => 'Konnte Daten zu Element %s nicht ermitteln!',
        'Can\'t get filter content data of %s!' => 'Kann Filter-Daten von %s nicht ermitteln!',
        'Customer Company Name' => '',
        'Customer User ID' => 'Kundenbenutzerkennung',

        # Perl Module: Kernel/Modules/AgentLinkObject.pm
        'Need SourceObject and SourceKey!' => 'Benötige SourceObject und SourceKey!',
        'Please contact the administrator.' => 'Bitte kontaktieren Sie den Administrator.',
        'You need ro permission!' => 'Sie benötigen die ro-Berechtigung!',
        'Can not delete link with %s!' => 'Kann Link mit %s nicht entfernen.',
        'Can not create link with %s! Object already linked as %s.' => 'Kann Verknüpfung zu %s nicht erstellen! Objekt bereits verknüpft als %s.',
        'Can not create link with %s!' => 'Kann Link mit %s nicht erstellen.',
        'The object %s cannot link with other object!' => 'Objekt %s kann nicht mit anderen Objekten verknüpft werden!',

        # Perl Module: Kernel/Modules/AgentPreferences.pm
        'Param Group is required!' => 'Parameter "Group" wird benötigt!',

        # Perl Module: Kernel/Modules/AgentStatistics.pm
        'Parameter %s is missing.' => 'Parameter %s fehlt.',
        'Invalid Subaction.' => 'Ungültige Subaktion.',
        'Statistic could not be imported.' => 'Statistik konnte nicht importiert werden.',
        'Please upload a valid statistic file.' => 'Bitte laden Sie eine gültige Statistikdatei hoch.',
        'Export: Need StatID!' => 'Export: Benötige StatID!',
        'Delete: Get no StatID!' => 'Löschen: Keine StatID empfangen!',
        'Need StatID!' => 'Benötige StatID!',
        'Could not load stat.' => 'Konnte Statistik nicht laden.',
        'Could not create statistic.' => 'Konnte Statistik nicht erstellen.',
        'Run: Get no %s!' => 'Durchlauf: Kein(e) %s empfangen!',

        # Perl Module: Kernel/Modules/AgentTicketActionCommon.pm
        'No TicketID is given!' => 'Keine TicketID übermittelt!',
        'You need %s permissions!' => 'Sie benötigen die %s-Berechtigung!',
        'Could not perform validation on field %s!' => 'Konnte Validierung auf Feld %s nicht ausführen!',
        'No subject' => 'Kein Betreff',
        'Previous Owner' => 'Vorheriger Besitzer',

        # Perl Module: Kernel/Modules/AgentTicketBounce.pm
        '%s is needed!' => '%s wird benötigt!',
        'Plain article not found for article %s!' => 'Nur-Text-Version für Artikel %s nicht gefunden!',
        'Article does not belong to ticket %s!' => 'Artikel gehört nicht zu Ticket %s!',
        'Can\'t bounce email!' => 'Kann E-Mail nicht abweisen!',
        'Can\'t send email!' => 'Kann E-Mail nicht senden!',
        'Wrong Subaction!' => 'Falsche Subaction!',

        # Perl Module: Kernel/Modules/AgentTicketBulk.pm
        'Can\'t lock Tickets, no TicketIDs are given!' => 'Kann Tickets nicht sperren, keine TicketIDs übermittelt!',
        'Ticket (%s) is not unlocked!' => 'Ticket %s ist nicht entsperrt!',
        'Bulk feature is not enabled!' => 'Das Stapelverarbeitungs-Feature ist nicht aktiviert!',
        'No selectable TicketID is given!' => 'Keine auswählbare TicketID übermittelt!',
        'You either selected no ticket or only tickets which are locked by other agents.' =>
            'Sie haben entweder kein Ticket ausgewählt, oder nur Tickets, die von anderen Agenten gesperrt sind.',
        'You need to select at least one ticket.' => 'Sie müssen mindestens ein Ticket auswählen.',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to these tickets: %s.' =>
            '',
        'The following tickets were locked: %s.' => '',

        # Perl Module: Kernel/Modules/AgentTicketCompose.pm
        'Can not determine the ArticleType!' => 'Konnte Artikel-Typ nicht bestimmen!',

        # Perl Module: Kernel/Modules/AgentTicketEmail.pm
        'No Subaction!' => 'Keine Subaktion!',

        # Perl Module: Kernel/Modules/AgentTicketEmailOutbound.pm
        'Got no TicketID!' => 'Keine TicketID empfangen!',
        'System Error!' => 'Systemfehler!',

        # Perl Module: Kernel/Modules/AgentTicketEscalationView.pm
        'Invalid Filter: %s!' => 'Ungültiger Filter: %s!',

        # Perl Module: Kernel/Modules/AgentTicketHistory.pm
        'Can\'t show history, no TicketID is given!' => 'Kann History nicht anzeigen, keine TicketID empfangen!',

        # Perl Module: Kernel/Modules/AgentTicketLock.pm
        'Can\'t lock Ticket, no TicketID is given!' => 'Kann Ticket nicht sperren, keine TicketID empfangen!',
        'Sorry, the current owner is %s!' => 'Entschuldigung, der aktuelle Besitzer ist %s!',
        'Please become the owner first.' => 'Bitte werden Sie zuerst der Besitzer.',
        'Ticket (ID=%s) is locked by %s!' => 'Ticket (ID=%s) ist durch %s gesperrt!',
        'Change the owner!' => 'Ändern Sie den Besitzer!',

        # Perl Module: Kernel/Modules/AgentTicketMerge.pm
        'Can\'t merge ticket with itself!' => 'Kann Ticket nicht mit sich selbst zusammenführen!',

        # Perl Module: Kernel/Modules/AgentTicketMove.pm
        'You need move permissions!' => 'Sie benötigen die move-Berechtigung!',

        # Perl Module: Kernel/Modules/AgentTicketPhone.pm
        'Chat is not active.' => 'Der Chat ist nicht aktiv.',
        'No permission.' => 'Keine Berechtigung.',
        '%s has left the chat.' => '%s hat den Chat verlassen.',
        'This chat has been closed and will be removed in %s hours.' => 'Dieser Chat wurde geschlossen und wird in %s Stunden entfernt.',

        # Perl Module: Kernel/Modules/AgentTicketPlain.pm
        'No ArticleID!' => 'Keine ArticleID!!',
        'Can\'t read plain article! Maybe there is no plain email in backend! Read backend message.' =>
            'Konnte Nur-Text-Artikel nicht lesen. Möglicherweise existiert die Nur-Text-Version nicht. Bitte lesen Sie die Backend-Nachricht.',

        # Perl Module: Kernel/Modules/AgentTicketPrint.pm
        'Need TicketID!' => 'TicketID benötigt!',
        'printed by' => 'gedruckt von',
        'Ticket Dynamic Fields' => 'Dynamische Felder für Tickets',

        # Perl Module: Kernel/Modules/AgentTicketProcess.pm
        'Couldn\'t get ActivityDialogEntityID "%s"!' => 'Konnte ActivityDialogEntityID %s nicht ermitteln!',
        'No Process configured!' => 'Kein Prozess konfiguriert!',
        'Process %s is invalid!' => 'Prozess %s ist ungültig!',
        'Subaction is invalid!' => 'Subaktion ist ungültig!',
        'Parameter %s is missing in %s.' => 'Parameter %s fehlt in %s.',
        'No ActivityDialog configured for %s in _RenderAjax!' => 'Kein ActivityDialog für %s in _RenderAjax definiert!',
        'Got no Start ActivityEntityID or Start ActivityDialogEntityID for Process: %s in _GetParam!' =>
            'Keine Start-ActivityEntityID oder Start-ActivityDialogEntityID für Process %s in _GetParam empfangen!',
        'Couldn\'t get Ticket for TicketID: %s in _GetParam!' => 'Konnte Ticket für TicketID %s in _GetParam nicht ermitteln!',
        'Couldn\'t determine ActivityEntityID. DynamicField or Config isn\'t set properly!' =>
            'Konnte ActivityEntityID nicht ermitteln. Dynamisches Feld oder Konfiguration nicht korrekt.',
        'Process::Default%s Config Value missing!' => 'Process::Default%s Konfigurationswert fehlt!',
        'Got no ProcessEntityID or TicketID and ActivityDialogEntityID!' =>
            'Weder ProcessEntityID, noch TicketID und ActivityDialogEntityID empfangen!',
        'Can\'t get StartActivityDialog and StartActivityDialog for the ProcessEntityID "%s"!' =>
            'Kann StartActivityDialog für ProcessEntityID "%s" nicht ermitteln!',
        'Can\'t get Ticket "%s"!' => 'Kann Ticket "%s" nicht ermitteln!',
        'Can\'t get ProcessEntityID or ActivityEntityID for Ticket "%s"!' =>
            'Kann ProcessEntityID oder ActivityEntityID für Ticket "%s" nicht ermitteln!',
        'Can\'t get Activity configuration for ActivityEntityID "%s"!' =>
            'Kann Aktivitäts-Konfiguration für ActivityEntityID "%s" nicht ermitteln!',
        'Can\'t get ActivityDialog configuration for ActivityDialogEntityID "%s"!' =>
            'Kann Aktivitätsdialog-Konfiguration für ActivityDialogEntityID "%s" nicht ermitteln!',
        'Can\'t get data for Field "%s" of ActivityDialog "%s"!' => 'Kann Daten für Feld "%s" von Aktivitätsdialog "%s" nicht ermitteln!',
        'PendingTime can just be used if State or StateID is configured for the same ActivityDialog. ActivityDialog: %s!' =>
            'Wartezeit kann nur verwendet werden, wenn Status oder StatusID für den Aktivitätsdialog konfiguriert sind. Aktivitätsdialog: %s!',
        'Pending Date' => 'Warten bis',
        'for pending* states' => 'für warten* Status',
        'ActivityDialogEntityID missing!' => 'ActivityDialogEntityID wird benötigt!',
        'Couldn\'t get Config for ActivityDialogEntityID "%s"!' => 'Konnte Konfiguration für ActivityDialogEntityID "%s" nicht ermitteln!',
        'Couldn\'t use CustomerID as an invisible field.' => 'CustomerID konnte nicht als unsichtbares Feld verwendet werden.',
        'Missing ProcessEntityID, check your ActivityDialogHeader.tt!' =>
            'ProcessEntityID fehlt, bitte prüfen Sie Ihre ActivityDialogHeader.tt!',
        'No StartActivityDialog or StartActivityDialog for Process "%s" configured!' =>
            'Kein StartActivityDialog für Prozess "%s" konfiguriert!',
        'Couldn\'t create ticket for Process with ProcessEntityID "%s"!' =>
            'Konnte für den Prozess mit der ProcessEntityID "%s" kein Ticket erstellen!',
        'Couldn\'t set ProcessEntityID "%s" on TicketID "%s"!' => 'Konnte ProcessEntityID "%s" nicht für Ticket "%s" setzen!',
        'Couldn\'t set ActivityEntityID "%s" on TicketID "%s"!' => 'Konnte ActivityEntityID "%s" nicht für Ticket "%s" setzen!',
        'Could not store ActivityDialog, invalid TicketID: %s!' => 'Konnte Aktivitätsdialog nicht speichern, ungültige TicketID: %s!',
        'Invalid TicketID: %s!' => 'Ungültige TicketID: %s!',
        'Missing ActivityEntityID in Ticket %s!' => 'ActivityEntityID fehlt für Ticket %s!',
        'This step does not belong anymore the current activity in process for Ticket %s!' =>
            '',
        'Another user changed this ticket in the meantime. Please close this window and reload the ticket.' =>
            '',
        'Missing ProcessEntityID in Ticket %s!' => 'ProcessEntityID fehlt für Ticket %s!',
        'Could not set DynamicField value for %s of Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Konnte Wert des dynamischen Feldes %s für TicketID %s im Aktivitätsdialog "%s" nicht speichern!',
        'Could not set PendingTime for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Konnte Wartezeit %s für TicketID %s im Aktivitätsdialog "%s" nicht speichern!',
        'Wrong ActivityDialog Field config: %s can\'t be Display => 1 / Show field (Please change its configuration to be Display => 0 / Do not show field or Display => 2 / Show field as mandatory)!' =>
            'Falsche Feldkonfiguration im Aktivitätsdialog: %s kann für Anzeige nicht den Wert 1 (= Feld anzeigen) haben. Bitte ändern Sie die Konfiguration auf Anzeige => 0 (Feld nicht anzeigen) oder Anzeige => 2 (als Pflichtfeld anzeigen)!',
        'Could not set %s for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Konnte %s für TicketID "%s" im Aktivitätsdialog "%s" nicht setzen!',
        'Default Config for Process::Default%s missing!' => 'Standardkonfiguration für Process::Default%s fehlt!',
        'Default Config for Process::Default%s invalid!' => 'Standardkonfiguration für Process::Default%s ungültig!',

        # Perl Module: Kernel/Modules/AgentTicketSearch.pm
        'Untitled' => 'Unbenannt',
        'Customer Name' => 'Kundenname',
        'Invalid Users' => 'Ungültige Benutzer',
        'CSV' => 'CSV',
        'Excel' => 'Excel',

        # Perl Module: Kernel/Modules/AgentTicketService.pm
        'Feature not enabled!' => 'Funktion nicht akiviert!',

        # Perl Module: Kernel/Modules/AgentTicketWatcher.pm
        'Feature is not active' => 'Funktion ist nicht aktiv',

        # Perl Module: Kernel/Modules/AgentTicketZoom.pm
        'Link Deleted' => 'Link gelöscht',
        'Ticket Locked' => 'Ticket gesperrt',
        'Pending Time Set' => 'Wartezeit gesetzt',
        'Dynamic Field Updated' => 'Dynamisches Feld aktualisiert',
        'Outgoing Email (internal)' => 'Ausgehende E-Mail (intern)',
        'Ticket Created' => 'Ticket erstellt',
        'Type Updated' => 'Typ aktualisiert',
        'Escalation Update Time In Effect' => '',
        'Escalation Update Time Stopped' => 'Aktualisierungszeit-Eskalation angehalten',
        'Escalation First Response Time Stopped' => 'Erstreaktionszeit-Eskalation angehalten',
        'Customer Updated' => 'Kunde aktualisiert',
        'Internal Chat' => 'Chat (intern)',
        'Automatic Follow-Up Sent' => 'Automatische Rückfrage gesendet',
        'Note Added' => 'Notiz hinzugefügt',
        'Note Added (Customer)' => 'Notiz hinzugefügt (Kunde)',
        'State Updated' => 'Status aktualisiert',
        'Outgoing Answer' => 'Ausgehende Antwort',
        'Service Updated' => 'Service aktualisiert',
        'Link Added' => 'Link hinzugefügt',
        'Incoming Customer Email' => 'Eingehende E-Mail (Kunde)',
        'Incoming Web Request' => 'Eingehende Webanfrage',
        'Priority Updated' => 'Priorität aktualisiert',
        'Ticket Unlocked' => 'Ticket entsperrt',
        'Outgoing Email' => 'Ausgehende E-Mail',
        'Title Updated' => 'Titel aktualisiert',
        'Ticket Merged' => 'Ticket zusammengefasst',
        'Outgoing Phone Call' => 'Ausgehender Telefonanruf',
        'Forwarded Message' => 'Weitergeleitete Nachricht',
        'Removed User Subscription' => 'Benutzer-Abonnement entfernt',
        'Time Accounted' => 'Zeit erfasst',
        'Incoming Phone Call' => 'Eingehender Telefonanruf',
        'System Request.' => 'Systemanfrage.',
        'Incoming Follow-Up' => 'Eingehende Rückfrage',
        'Automatic Reply Sent' => 'Automatische Antwort gesendet',
        'Automatic Reject Sent' => 'Automatische Ablehnung gesendet',
        'Escalation Solution Time In Effect' => '',
        'Escalation Solution Time Stopped' => 'Lösungszeit-Eskalation angehalten',
        'Escalation Response Time In Effect' => '',
        'Escalation Response Time Stopped' => 'Antwortzeit-Eskalation angehalten',
        'SLA Updated' => 'SLA aktualisiert',
        'Queue Updated' => 'Queue aktualisiert',
        'External Chat' => 'Chat (extern)',
        'Queue Changed' => 'Queue gewechselt',
        'Notification Was Sent' => 'Benachrichtigung wurde gesendet',
        'We are sorry, you do not have permissions anymore to access this ticket in its current state.' =>
            'Entschuldigung, Sie haben keine Berechtigung, auf dieses Ticket in seinem aktuellen Status zuzugreifen.',
        'Can\'t get for ArticleID %s!' => 'Konnte Artikel-ID %s nicht ermitteln!',
        'Article filter settings were saved.' => 'Artikelfilter-Einstellungen wurden gespeichert.',
        'Event type filter settings were saved.' => 'Eventtypfilter-Einstellungen wurden gespeichert.',
        'Need ArticleID!' => 'Benötige ArticleID!',
        'Invalid ArticleID!' => 'Ungültige ArticleID!',
        'Offline' => 'Offline',
        'User is currently offline.' => 'Benutzer ist aktuell nicht verfügbar.',
        'User is currently active.' => 'Benutzer ist gerade aktiv.',
        'Away' => 'Abwesend',
        'User was inactive for a while.' => 'Benutzer war für eine Weile inaktiv.',
        'Unavailable' => 'Nicht verfügbar',
        'User set their status to unavailable.' => 'Benutzer hat seinen Status auf "nicht verfügbar" gesetzt.',
        'Fields with no group' => 'Felder ohne Gruppe',
        'View the source for this Article' => 'Betrachten Sie den Quelltext dieses Artikels',

        # Perl Module: Kernel/Modules/CustomerTicketAttachment.pm
        'FileID and ArticleID are needed!' => 'FileID und ArticleID werden benötigt!',
        'No TicketID for ArticleID (%s)!' => 'Keine TicketID für ArticleID (%s)!',
        'No such attachment (%s)!' => 'Anlage nicht gefunden (%s)!',

        # Perl Module: Kernel/Modules/CustomerTicketMessage.pm
        'Check SysConfig setting for %s::QueueDefault.' => 'Prüfen Sie die Sysconfig-Einstellungen für %s::QueueDefault.',
        'Check SysConfig setting for %s::TicketTypeDefault.' => 'Prüfen Sie die Sysconfig-Einstellungen für %s::TicketTypeDefault.',

        # Perl Module: Kernel/Modules/CustomerTicketOverview.pm
        'Need CustomerID!' => 'Benötige CustomerID!',
        'My Tickets' => 'Meine Tickets',
        'Company Tickets' => 'Firmen-Tickets',
        'Untitled!' => 'Unbenannt!',

        # Perl Module: Kernel/Modules/CustomerTicketSearch.pm
        'Please remove the following words because they cannot be used for the search:' =>
            'Bitte entfernen Sie die folgenden Suchworte, da sie nicht für die Suche verwendet werden können:',

        # Perl Module: Kernel/Modules/CustomerTicketZoom.pm
        'Can\'t reopen ticket, not possible in this queue!' => 'Konnte Ticket nicht wieder eröffnen. In dieser Queue nicht möglich!',
        'Create a new ticket!' => 'Neues Ticket erstellen!',

        # Perl Module: Kernel/Modules/Installer.pm
        'Directory "%s" doesn\'t exist!' => 'Verzeichnis "%s" existiert nicht!',
        'Configure "Home" in Kernel/Config.pm first!' => 'Konfigurieren Sie zuerst "Home" in Kernel/Config.pm!',
        'File "%s/Kernel/Config.pm" not found!' => 'Datei "%s/Kernel/Config.pm" wurde nicht gefunden!',
        'Directory "%s" not found!' => 'Verzeichnis "%s" nicht gefunden!',
        'Kernel/Config.pm isn\'t writable!' => 'Kernel/Config.pm ist nicht schreibbar!',
        'If you want to use the installer, set the Kernel/Config.pm writable for the webserver user!' =>
            'Wenn Sie den Installer verwenden möchten, stellen Sie sicher, dass Kernel/Config.pm durch den Webserver-Benutzer schreibbar ist!',
        'Unknown Check!' => 'Unbekannte Prüfung!',
        'The check "%s" doesn\'t exist!' => 'Die Prüfung "%s" existiert nicht!',
        'Database %s' => 'Datenbank %s',
        'Configure MySQL' => '',
        'Configure PostgreSQL' => '',
        'Configure Oracle' => '',
        'Unknown database type "%s".' => 'Unbekannter Datenbank-Typ "%s".',
        'Please go back.' => 'Bitte gehen Sie zurück.',
        'Install OTRS - Error' => 'OTRS-Installation - Fehler',
        'File "%s/%s.xml" not found!' => 'Datei "%s/%s.xml" nicht gefunden!',
        'Contact your Admin!' => 'Kontaktieren Sie Ihren Administrator!',
        'Syslog' => '',
        'Can\'t write Config file!' => 'Kann Konfigurationsdatei nicht schreiben!',
        'Unknown Subaction %s!' => 'Unbekannte Subaktion %s!',
        'Can\'t connect to database, Perl module DBD::%s not installed!' =>
            'Kann nicht zur Datenbank verbinden, Perl-Modul DBD::%s nicht installiert!',
        'Can\'t connect to database, read comment!' => 'Kann nicht zur Datenbank verbinden, bitte Hinweis lesen!',
        'Error: Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Fehler: Bitte stellen Sie sicher, dass Ihre Datenbank Pakete größer als %s MB akzeptiert (derzeit werden nur Pakete bis zu einer Größe von %s MB akzeptiert). Bitte passen Sie die Einstellung max_allowed_packet Ihrer Datenbank an, um Fehler zu vermeiden.',
        'Error: Please set the value for innodb_log_file_size on your database to at least %s MB (current: %s MB, recommended: %s MB). For more information, please have a look at %s.' =>
            'Fehler: Bitte erhöhen Sie den Wert für innodb_log_file_size in Ihrer Datenbank-Konfiguration auf mindestens %s MB (aktuell: %s MB, empfohlen: %s MB). Mehr Informationen finden Sie unter %s.',

        # Perl Module: Kernel/Modules/PublicRepository.pm
        'Need config Package::RepositoryAccessRegExp' => 'Benötige Konfiguration Package::RepositoryAccessRegExp',
        'Authentication failed from %s!' => 'Authentifizierung von %s fehlgeschlagen!',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/PGP.pm
        'Sent message crypted to recipient!' => 'Nachricht verschlüsselt an Empfänger senden!',
        '"PGP SIGNED MESSAGE" header found, but invalid!' => '"PGP SIGNED MESSAGE"-Header gefunden, aber ungültig!',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/SMIME.pm
        '"S/MIME SIGNED MESSAGE" header found, but invalid!' => '"S/MIME SIGNED MESSAGE"-Header gefunden, aber ungültig!',
        'Ticket decrypted before' => 'Ticket wurde bereits entschlüsselt',
        'Impossible to decrypt: private key for email was not found!' => 'Entschlüsseln nicht möglich: Private Key für E-Mail nicht gefunden!',
        'Successful decryption' => 'Entschlüsseln erfolgreich',

        # Perl Module: Kernel/Output/HTML/Dashboard/EventsTicketCalendar.pm
        'The start time of a ticket has been set after the end time!' => 'Die Starten-Zeit eines Tickets wurde auf einen Zeitpunkt nach der Ende-Zeit gesetzt!',

        # Perl Module: Kernel/Output/HTML/Dashboard/News.pm
        'Can\'t connect to OTRS News server!' => 'Kein Verbindungsaufbau zu den OTRS Neuigkeiten möglich!',
        'Can\'t get OTRS News from server!' => 'OTRS Neuigkeiten können nicht vom Server abgerufen werden!',

        # Perl Module: Kernel/Output/HTML/Dashboard/ProductNotify.pm
        'Can\'t connect to Product News server!' => 'Kein Verbindungsaufbau zu den Produktneuigkeiten möglich!',
        'Can\'t get Product News from server!' => 'Produktneuigkeiten können nicht vom Server abgerufen werden!',

        # Perl Module: Kernel/Output/HTML/Dashboard/RSS.pm
        'Can\'t connect to %s!' => 'Kein Verbindungsaufbau zu %s möglich!',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketGeneric.pm
        'sorted ascending' => 'aufsteigend sortiert',
        'sorted descending' => 'absteigend sortiert',
        'filter not active' => 'Filter nicht aktiv',
        'filter active' => 'Filter aktiv',
        'This ticket has no title or subject' => 'Dieses Ticket hat keinen Titel oder Betreff',

        # Perl Module: Kernel/Output/HTML/Layout.pm
        'We are sorry, you do not have permissions anymore to access this ticket in its current state. You can take one of the following actions:' =>
            'Entschuldigung, Sie haben keine Berechtigung, auf dieses Ticket in seinem aktuellen Status zuzugreifen. Sie können eine der folgenden Aktionen verwenden:',
        'No Permission' => 'Keine Berechtigung',

        # Perl Module: Kernel/Output/HTML/Layout/LinkObject.pm
        'Linked as' => 'Verknüpft als',
        'Search Result' => 'Suchergebnis',

        # Perl Module: Kernel/Output/HTML/LinkObject/Ticket.pm
        'Archive search' => 'Archivsuche',

        # Perl Module: Kernel/Output/HTML/Notification/AgentOTRSBusiness.pm
        '%s Upgrade to %s now! %s' => '%s Jetzt auf %s upgraden! %s',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerSystemMaintenanceCheck.pm
        'A system maintenance period will start at: ' => 'Eine Systemwartungsperiode beginnt um: ',

        # Perl Module: Kernel/Output/HTML/Preferences/Language.pm
        '(in process)' => '(in Arbeit)',

        # Perl Module: Kernel/Output/HTML/Preferences/NotificationEvent.pm
        'Please make sure you\'ve chosen at least one transport method for mandatory notifications.' =>
            'Bitte stellen Sie sicher, dass sie für erforderliche Benachrichtigungen mindestens eine Benachrichtigungsmethode ausgewählt haben.',

        # Perl Module: Kernel/Output/HTML/Preferences/OutOfOffice.pm
        'Please specify an end date that is after the start date.' => 'Bitte geben Sie ein Enddatum an, das nach dem Startdatum liegt.',

        # Perl Module: Kernel/Output/HTML/Preferences/Password.pm
        'Please supply your new password!' => 'Bitte bestätigen Sie ihr neues Passwort',

        # Perl Module: Kernel/Output/HTML/Statistics/View.pm
        'No (not supported)' => 'Nein (nicht unterstützt)',
        'No past complete or the current+upcoming complete relative time value selected.' =>
            'Kein relativer Zeitraum ausgewählt.',
        'The selected time period is larger than the allowed time period.' =>
            'Der ausgewählte Zeitraum ist größer als der erlaubte Zeitraum.',
        'No time scale value available for the current selected time scale value on the X axis.' =>
            'Keine Zeitskalierung für den aktuell ausgewählten Zeitskalierungswert der X-Achse verfügbar.',
        'The selected date is not valid.' => 'Das ausgewählte Datum ist ungültig.',
        'The selected end time is before the start time.' => 'Die ausgewählte Endzeit ist vor der Startzeit.',
        'There is something wrong with your time selection.' => 'Bitte überprüfen Sie Ihre Zeitauswahl.',
        'Please select only one element or allow modification at stat generation time.' =>
            'Bitte wählen Sie nur ein Element oder erlauben Sie die Bearbeitung zur Erstellzeit der Statistik.',
        'Please select at least one value of this field or allow modification at stat generation time.' =>
            'Bitte wählen Sie nur ein Element oder erlauben Sie die Bearbeitung zur Erstellzeit der Statistik.',
        'Please select one element for the X-axis.' => 'Bitte wählen Sie ein Element für die X-Achse aus.',
        'You can only use one time element for the Y axis.' => 'Sie können nur ein Zeitelement für die Y-Achse verwenden.',
        'You can only use one or two elements for the Y axis.' => 'Sie können nur ein oder zwei Elemente für die Y-Achse verwenden.',
        'Please select at least one value of this field.' => 'Bitte wählen Sie mindestens einen Wert in diesem Feld aus.',
        'Please provide a value or allow modification at stat generation time.' =>
            'Bitte geben Sie einen Wert an oder erlauben Sie die Bearbeitung zur Erstellzeit der Statistik.',
        'Please select a time scale.' => 'Bitte wählen Sie eine Zeitskala aus.',
        'Your reporting time interval is too small, please use a larger time scale.' =>
            'Der ausgewählte Zeitraum ist zu klein, bitte nutzen Sie einen größeren Zeitmaßstab.',
        'Please remove the following words because they cannot be used for the ticket restrictions: %s.' =>
            'Bitte entfernen Sie die folgenden Worte, da sie nicht für die Ticket-Einschränkung verwendet werden können: %s.',

        # Perl Module: Kernel/Output/HTML/TicketOverviewMenu/Sort.pm
        'Order by' => 'Sortieren nach',

        # Perl Module: Kernel/System/AuthSession.pm
        'You have exceeded the number of concurrent agents - contact sales@otrs.com.' =>
            'Sie haben die Anzahl der concurrent agents überschritten - kontaktieren Sie umgehend sales@otrs.com',
        'Please note that the session limit is almost reached.' => 'Bitte beachten Sie, dass das Session Limit fast erreicht ist.',
        'Login rejected! You have exceeded the maximum number of concurrent Agents! Contact sales@otrs.com immediately!' =>
            'Anmeldung verweigert! Sie haben die maximale Anzahl an gleichzeitig angemeldeten Agents überschritten! Jetzt sales@otrs.com kontaktieren!',
        'Session per user limit reached!' => 'Sitzung-pro-Benutzer-Limit erreicht!',

        # Perl Module: Kernel/System/Console/Command/Dev/Tools/Config2Docbook.pm
        'Configuration Options Reference' => 'Referenz der Konfigurationseinstellungen',
        'This setting can not be changed.' => 'Diese Einstellung kann nicht geändert werden.',
        'This setting is not active by default.' => 'Diese Einstellung ist standardmäßig nicht aktiv.',
        'This setting can not be deactivated.' => 'Diese Einstellung kann nicht deaktiviert werden.',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseText.pm
        'e.g. Text or Te*t' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/Checkbox.pm
        'Ignore this field.' => '',

        # Perl Module: Kernel/System/Package.pm
        'not installed' => 'nicht installiert',
        'File is not installed!' => 'Datei ist nicht installiert!',
        'File is different!' => 'Datei unterschiedlich!',
        'Can\'t read file!' => 'Datei kann nicht gelesen werden!',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process/State.pm
        'Inactive' => 'Inaktiv',
        'FadeAway' => 'Ausblendend',

        # Perl Module: Kernel/System/Registration.pm
        'Can\'t get Token from sever' => 'Kann Token nicht vom Server ermitteln!',

        # Perl Module: Kernel/System/Stats.pm
        'Sum' => 'Summe',

        # Perl Module: Kernel/System/Stats/Dynamic/Ticket.pm
        'State Type' => 'Statustyp',
        'Created Priority' => 'Erstellt mit der Priorität',
        'Created State' => 'Erstellt mit dem Status',
        'Create Time' => 'Erstellzeit',
        'Close Time' => 'Schließzeit',
        'Escalation - First Response Time' => 'Eskalation - Zeit für die erste Reaktion',
        'Escalation - Update Time' => 'Eskalation - Aktualisierungszeit',
        'Escalation - Solution Time' => 'Eskalation - Lösungszeit',
        'Agent/Owner' => 'Agent/Besitzer',
        'Created by Agent/Owner' => 'Erstellt von Agent/Besitzer',
        'CustomerUserLogin' => 'Kundenlogin',
        'CustomerUserLogin (complex search)' => 'Kundenbenutzer (komplexe Suche)',
        'CustomerUserLogin (exact match)' => 'Kundenbenutzer (genaue Übereinstimmung)',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketAccountedTime.pm
        'Evaluation by' => 'Auswertung nach',
        'Ticket/Article Accounted Time' => 'Zeit zugewiesen',
        'Ticket Create Time' => 'Ticket-Erstellzeit',
        'Ticket Close Time' => 'Ticket-Schließzeit',
        'Accounted time by Agent' => 'Zeit zugewiesen von Agent',
        'Total Time' => 'Gesamtzeit',
        'Ticket Average' => 'Durchschnittszeit pro Ticket',
        'Ticket Min Time' => 'Ticket Minimalzeit',
        'Ticket Max Time' => 'Ticket Maximalzeit',
        'Number of Tickets' => 'Anzahl der Tickets',
        'Article Average' => 'Durchschnittszeit pro Artikel',
        'Article Min Time' => 'Artikel Minimalzeit',
        'Article Max Time' => 'Artikel Maximalzeit',
        'Number of Articles' => 'Anzahl der Artikel',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketList.pm
        'unlimited' => 'unbeschränkt',
        'ascending' => 'aufsteigend',
        'descending' => 'absteigend',
        'Attributes to be printed' => 'Auszugebene Attribute',
        'Sort sequence' => 'Sortierreihenfolge',
        'State Historic' => 'Statuschronik',
        'State Type Historic' => 'Statustypchronik',
        'Historic Time Range' => 'Historischer Zeitbereich',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketSolutionResponseTime.pm
        'Solution Average' => 'Durchschnittliche Lösungszeit',
        'Solution Min Time' => 'Minimale Lösungszeit',
        'Solution Max Time' => 'Maximale Lösungszeit',
        'Solution Average (affected by escalation configuration)' => 'Durchschnitts-Lösungszeit (wird durch Eskalations-Konfiguration beeinflusst)',
        'Solution Min Time (affected by escalation configuration)' => 'Minimale Lösungszeit (wird durch Eskalations-Konfiguration beeinflusst)',
        'Solution Max Time (affected by escalation configuration)' => 'Maximale Lösungszeit (wird durch Eskalations-Konfiguration beeinflusst)',
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
        'Days' => 'Tage',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/TablePresence.pm
        'Table Presence' => 'Prüfung Tabellenexistenz',
        'Internal Error: Could not open file.' => 'Interner Fehler: Konnte datei nicht öffnen.',
        'Table Check' => 'Prüfung Tabellenstatus',
        'Internal Error: Could not read file.' => 'Interner Fehler: Konnte datei nicht lesen.',
        'Tables found which are not present in the database.' => 'In der Datenbank fehlen Tabellen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Size.pm
        'Database Size' => 'Datenbank-Größe',
        'Could not determine database size.' => 'Konnte Datenbank-Größe nicht ermitteln',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Version.pm
        'Database Version' => 'Datenbank-Version',
        'Could not determine database version.' => 'Konnte Datenbank-Version nicht ermitteln',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Charset.pm
        'Client Connection Charset' => 'Zeichensatz der Client-Verbindung',
        'Setting character_set_client needs to be utf8.' => 'Einstellung character_set_client muss utf8 sein.',
        'Server Database Charset' => 'Zeichensatz des Datenbank-Servers',
        'Setting character_set_database needs to be UNICODE or UTF8.' => 'Einstellung character_set_database muss UNICODE oder UTF8 sein.',
        'Table Charset' => 'Zeichensatz der Tabellen',
        'There were tables found which do not have utf8 as charset.' => 'Es wurden Tabellen gefunden, die nicht utf8 als Zeichensatz eingestellt haben.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InnoDBLogFileSize.pm
        'InnoDB Log File Size' => 'InnoDB Log Datei Größe',
        'The setting innodb_log_file_size must be at least 256 MB.' => 'Die Einstellung innodb_log_file_size muss mindestens 256 MB betragen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/MaxAllowedPacket.pm
        'Maximum Query Size' => 'Maximale Anfragegröße',
        'The setting \'max_allowed_packet\' must be higher than 20 MB.' =>
            'Die Einstellung max_allowed_packet muss größer als 20 MB sein.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Performance.pm
        'Query Cache Size' => 'Größe Abfrage-Cache',
        'The setting \'query_cache_size\' should be used (higher than 10 MB but not more than 512 MB).' =>
            'Die Einstellung query_cache_size sollte genutzt werden (mehr als 10 MB aber nicht mehr als 512 MB).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/StorageEngine.pm
        'Default Storage Engine' => 'Standard-Storage-Engine',
        'Table Storage Engine' => 'Tabellen Speicher-Engine',
        'Tables with a different storage engine than the default engine were found.' =>
            'Es wurden Tabellen gefunden, die nicht die Standard-Engine nutzen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Version.pm
        'MySQL 5.x or higher is required.' => 'MySQL 5.x oder höher wird benötigt.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/NLS.pm
        'NLS_LANG Setting' => 'Einstellung NLS_LANG',
        'NLS_LANG must be set to al32utf8 (e.g. GERMAN_GERMANY.AL32UTF8).' =>
            'NLS_LANG muss auf al32utf8 festgelegt sein (z.B. GERMAN_GERMANY.AL32UTF8).',
        'NLS_DATE_FORMAT Setting' => 'Einstellung NLS_DATE_FORMAT',
        'NLS_DATE_FORMAT must be set to \'YYYY-MM-DD HH24:MI:SS\'.' => 'NLS_DATE_FORMAT muss auf \'YYYY-MM-DD HH24:MI:SS\' gesetzt sein.',
        'NLS_DATE_FORMAT Setting SQL Check' => 'SQL-Prüfung NLS_DATE_FORMAT',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Charset.pm
        'Setting client_encoding needs to be UNICODE or UTF8.' => 'Einstellung client_encoding muss UNICODE oder UTF8 sein.',
        'Setting server_encoding needs to be UNICODE or UTF8.' => 'Einstellung server_encoding muss UNICODE oder UTF8 sein.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/DateStyle.pm
        'Date Format' => 'Datumsformat',
        'Setting DateStyle needs to be ISO.' => 'Einstellung DateStyle muss ISO sein.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Version.pm
        'PostgreSQL 8.x or higher is required.' => 'PostgreSQL 8.x oder höher wird benötigt.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskPartitionOTRS.pm
        'OTRS Disk Partition' => 'OTRS-Festplattenpartition',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpace.pm
        'Disk Usage' => 'Festplatten-Verwendung',
        'The partition where OTRS is located is almost full.' => 'Die Partition, auf der OTRS sich befindet, ist fast voll.',
        'The partition where OTRS is located has no disk space problems.' =>
            'Die Partition, auf der OTRS sich befindet, hat keine Platzprobleme.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpacePartitions.pm
        'Disk Partitions Usage' => 'Belegung der Festplatten-Partitionen',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Distribution.pm
        'Distribution' => 'Distribution',
        'Could not determine distribution.' => 'Konnte Distribution nicht ermitteln.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/KernelVersion.pm
        'Kernel Version' => 'Kernelversion',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Load.pm
        'System Load' => 'Systemlast (load)',
        'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).' =>
            'Die Last sollte die Zahl der Systemprozessoren nicht übersteigen (also wäre eine Last von 8 oder weniger auf einem 8-Core-System in Ordnung).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModules.pm
        'Perl Modules' => 'Perlmodule',
        'Not all required Perl modules are correctly installed.' => 'Nicht alle benötigten Perlmodle sind installiert',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Swap.pm
        'Free Swap Space (%)' => 'Freier Auslagerungsspeicher (%)',
        'No swap enabled.' => 'Kein Auslagerungsspeicher aktiviert.',
        'Used Swap Space (MB)' => 'Verwendeter Auslagerungsspeicher (MB)',
        'There should be more than 60% free swap space.' => 'Es sollten mehr als 60% Auslagerungsspeicher verfügbar sein.',
        'There should be no more than 200 MB swap space used.' => 'Es sollten nicht mehr als 200 MB Auslagerungsspeicher verwendet werden.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ConfigSettings.pm
        'OTRS' => 'OTRS',
        'Config Settings' => 'Konfigurationseinstellungen',
        'Could not determine value.' => 'Konnte Wert nicht ermitteln.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DaemonRunning.pm
        'Daemon' => 'Daemon',
        'Daemon is running.' => 'Daemon läuft.',
        'Daemon is not running.' => 'Daemon läuft nicht.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DatabaseRecords.pm
        'Database Records' => 'Datenbankeinträge',
        'Tickets' => 'Tickets',
        'Ticket History Entries' => 'Ticket-Historien-Einträge',
        'Articles' => 'Artikel',
        'Attachments (DB, Without HTML)' => 'Anhänge (in der Datenbank, ohne HTML)',
        'Customers With At Least One Ticket' => 'Kunden mit wenigstens einem Ticket',
        'Dynamic Field Values' => 'Werte in Dynamischen Feldern',
        'Invalid Dynamic Fields' => 'Ungültige dynamische Felder',
        'Invalid Dynamic Field Values' => 'Werte in ungültigen dynamischen Feldern',
        'GenericInterface Webservices' => 'GenericInterface Webservices',
        'Process Tickets' => 'Prozess-Tickets',
        'Months Between First And Last Ticket' => 'Monate zwischen erstem und letztem Ticket',
        'Tickets Per Month (avg)' => 'Tickets pro Monat (Durchschnitt)',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultSOAPUser.pm
        'Default SOAP Username And Password' => 'Standard-Benutzername und -Passwort für SOAP',
        'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.' =>
            'Sicherheitsrisiko: Sie verwenden den Standard-SOAP-Benutzernamen und das Standardpasswort. Bitte ändern Sie diese Einstellungen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultUser.pm
        'Default Admin Password' => 'Standard-Admin-Passwort',
        'Security risk: the agent account root@localhost still has the default password. Please change it or invalidate the account.' =>
            'Sicherheitsrisiko: Das Agentenpasswort für root@localhost ist das Standardpasswort. Bitte ändern Sie es oder deaktivieren Sie diesen Nutzer.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ErrorLog.pm
        'Error Log' => 'Fehlerprotokoll',
        'There are error reports in your system log.' => 'Im System wurden Einträge im Fehlerprotokoll gefunden.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FQDN.pm
        'FQDN (domain name)' => 'FQDN (Domainname)',
        'Please configure your FQDN setting.' => 'Bitte konfigurieren Sie ihre FQDN Einstellungen.',
        'Domain Name' => 'Domainname',
        'Your FQDN setting is invalid.' => 'Ihre Einstellung FQDN ist ungültig.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FileSystemWritable.pm
        'File System Writable' => 'Schreibbarkeit Dateisystem',
        'The file system on your OTRS partition is not writable.' => 'Das Dateisystem auf Ihrer OTRS-Partition ist nicht schreibbar.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageDeployment.pm
        'Package Installation Status' => 'Paketinstallationsstatus',
        'Some packages have locally modified files.' => 'Einige Pakete enthalten lokal angepasste Dateien.',
        'Some packages are not correctly installed.' => 'Es wurden Pakete gefunden, die nicht korrekt installiert sind.',
        'Package Verification Status' => 'Status Paketverifikation',
        'Some packages are not verified by the OTRS Group! It is recommended not to use this packages.' =>
            'Einige Pakete wurden nicht von der OTRS Gruppe verifiziert! Es wird empfohlen, diese Pakete nicht zu nutzen.',
        'Package Framework Version Status' => 'Status Paket-Frameworkversion',
        'Some packages are not allowed for the current framework version.' =>
            'Einige Pakete sind für die aktuelle Framework-Version nicht geeignet.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageList.pm
        'Package List' => 'Paketliste',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SessionConfigSettings.pm
        'Session Config Settings' => 'Sitzungskonfigurationseinstellungen',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SpoolMails.pm
        'Spooled Emails' => '',
        'There are emails in var/spool that OTRS could not process.' => 'In var/spool befinden sich Emails, die OTRS nicht verarbeiten konnte.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SystemID.pm
        'Your SystemID setting is invalid, it should only contain digits.' =>
            'Ihre Einstellung SystemID ist ungültig, sie sollte nur Ziffern enthalten.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/DefaultType.pm
        'Default Ticket Type' => 'Standard-Ticket-Typ',
        'The configured default ticket type is invalid or missing. Please change the setting Ticket::Type::Default and select a valid ticket type.' =>
            'Der konfigurierte Standard-Ticket-Typ fehlt oder ist ungültig. Bitte ändern Sie die Einstellung Ticket::Type::Default und wählen Sie einen gültigen Ticket-Typ.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/IndexModule.pm
        'Ticket Index Module' => 'Ticket-Index-Modul',
        'You have more than 60,000 tickets and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'Sie haben mehr als 60.000 Tickets und sollten das StaticDB-Backend verwenden. Bitte schauen Sie im Administratorhandbuch (Performance Tuning) nach.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/InvalidUsersWithLockedTickets.pm
        'Invalid Users with Locked Tickets' => 'Ungültige Benutzer mit gesperrten Tickets',
        'There are invalid users with locked tickets.' => 'Es existierten ungültige Benutzer mit gesperrten Tickets.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/OpenTickets.pm
        'Open Tickets' => 'Offene Tickets',
        'You should not have more than 8,000 open tickets in your system.' =>
            'Sie sollten nicht mehr als 8.000 offene Tickets im System haben.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/SearchIndexModule.pm
        'Ticket Search Index Module' => 'Ticket-Suchindex-Modul',
        'You have more than 50,000 articles and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'Sie haben mehr als 50.000 Artikel und sollten das StaticDB-Backend verwenden. Bitte schauen Sie im Administratorhandbuch (Performance Tuning) nach.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/StaticDBOrphanedRecords.pm
        'Orphaned Records In ticket_lock_index Table' => 'Verwaiste Einträge in der Tabelle ticket_lock_index',
        'Table ticket_lock_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'Die Tabelle ticket_lock_index enthält verwaiste Einträge. Bitte führen Sie bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" aus, um den StaticDB-Index zu bereinigen.',
        'Orphaned Records In ticket_index Table' => 'Verwaiste Einträge in der Tabelle ticket_index.',
        'Table ticket_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'Die Tabelle ticket_index enthält verwaiste Einträge. Bitte führen Sie "Maint::Ticket::QueueIndexCleanup" aus, um sie zu entfernen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/TimeSettings.pm
        'Time Settings' => 'Zeiteinstellungen',
        'Server time zone' => 'Serverzeitzone',
        'Computed server time offset' => 'Berechneter Serverzeitversatz',
        'OTRS TimeZone setting (global time offset)' => 'OTRS-Zeitzoneneinstellung (globaler Zeitversatz)',
        'TimeZone may only be activated for systems running in UTC.' => 'Die TimeZone sollte nur für Systeme aktiviert werden, die auf Basis von UTC laufen.',
        'OTRS TimeZoneUser setting (per-user time zone support)' => 'OTRS TimeZoneUser-Einstellung (Benutzerbasierte Zeitzonen-Unterstützung).',
        'TimeZoneUser may only be activated for systems running in UTC that don\'t have an OTRS TimeZone set.' =>
            'Die TimeZoneUser sollte nur für Systeme aktiviert werden, die auf Basis von UTC laufen und TimeZone nicht aktiviert haben.',
        'OTRS TimeZone setting for calendar ' => 'OTRS-Zeitzoneneinstellung für Kalender',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/LoadedModules.pm
        'Webserver' => 'Webserver',
        'Loaded Apache Modules' => 'Geladene Apache-Module',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/MPMModel.pm
        'MPM model' => 'MPM-Modell',
        'OTRS requires apache to be run with the \'prefork\' MPM model.' =>
            'OTRS benötigt das Apache \'prefork\' MPM Modul',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/Performance.pm
        'CGI Accelerator Usage' => 'Verwendung CGI-Beschleuniger',
        'You should use FastCGI or mod_perl to increase your performance.' =>
            'Sie sollten FastCGI oder mod_perl verwenden, um die Geschwindigkeit zu steigern.',
        'mod_deflate Usage' => 'Verwendung mod_deflate',
        'Please install mod_deflate to improve GUI speed.' => 'Bitte installieren Sie mod_deflate, um die Geschwindigkeit zu steigern.',
        'mod_filter Usage' => 'Verwendung mod_filter',
        'Please install mod_filter if mod_deflate is used.' => 'Bitte installieren Sie mod_filter falls mod_deflate verwendet wird.',
        'mod_headers Usage' => 'Verwendung mod_headers',
        'Please install mod_headers to improve GUI speed.' => 'Bitte installieren Sie mod_headers, um die Geschwindigkeit zu steigern.',
        'Apache::Reload Usage' => 'Verwendung Apache::Reload',
        'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler to prevent web server restarts when installing and upgrading modules.' =>
            'Apache::Reload oder Apache2::Reload sollten als PerlModule und PerlInitHandler verwendet werden, um Webserver-Neustarts nach Paketinstallation oder -upgrade zu vermeiden.',
        'Apache2::DBI Usage' => 'Verwendung Apache2::DBI',
        'Apache2::DBI should be used to get a better performance  with pre-established database connections.' =>
            'Nutzen Sie Apache2::DBI, um eine höhere Leistung im Zusammenhang mit persistenten Datenbankverbindungen zu erreichen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/EnvironmentVariables.pm
        'Environment Variables' => 'Umgebungsvariablen',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/InternalWebRequest.pm
        'Support Data Collection' => '',
        'Support data could not be collected from the web server.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Version.pm
        'Webserver Version' => 'Webserver-Version',
        'Could not determine webserver version.' => 'Konnte Webserver-Version nicht ermitteln.',

        # Perl Module: Kernel/System/SupportDataCollector/PluginAsynchronous/OTRS/ConcurrentUsers.pm
        'Concurrent Users Details' => 'Details der gleichzeitigen Nutzer',
        'Concurrent Users' => 'Gleichzeitige Nutzer',

        # Perl Module: Kernel/System/SupportDataCollector/PluginBase.pm
        'Unknown' => 'Unbekannt',
        'OK' => 'OK',
        'Problem' => 'Problem',

        # Perl Module: Kernel/System/Ticket.pm
        'Reset of unlock time.' => 'Zurücksetzen des Freigabe-Zeitintervalls.',

        # Perl Module: Kernel/System/Ticket/Event/NotificationEvent/Transport/Email.pm
        'PGP sign only' => 'Nur PGP-Signierung',
        'PGP encrypt only' => 'Nur PGP-Verschlüsselung',
        'PGP sign and encrypt' => 'PGP-Signierung und -Verschlüsselung',
        'SMIME sign only' => 'Nur SMIME-Signierung',
        'SMIME encrypt only' => 'Nur SMIME-Verschlüsselung',
        'SMIME sign and encrypt' => 'SMIME-Signierung und -Verschlüsselung',
        'PGP and SMIME not enabled.' => 'PGP und SMIME sind nicht aktiviert.',
        'Skip notification delivery' => 'Benachrichtigungs-Zustellung überspringen',
        'Send unsigned notification' => 'Unsignierte Benachrichtigung senden',
        'Send unencrypted notification' => 'Unverschlüsselte Benachrichtigung senden',

        # Perl Module: Kernel/System/Web/InterfaceAgent.pm
        'Panic, user authenticated but no user data can be found in OTRS DB!! Perhaps the user is invalid.' =>
            'Achtung, der Benutzer wurde authentifiziert, aber es konnten keine Benutzerdaten in der Datenbank gefunden worden. Möglicherweise ist der Benutzer ungültig.',
        'Can`t remove SessionID.' => 'Kann SessionID nicht enfernen',
        'Logout successful.' => 'Abmeldung erfolgreich.',
        'Panic! Invalid Session!!!' => 'Fehler: Ungültige Sitzung.',
        'No Permission to use this frontend module!' => 'Sie haben keine Berechtigung, dieses Modul zu nutzen!',

        # Perl Module: Kernel/System/Web/InterfaceCustomer.pm
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact the administrator.' =>
            '',
        'Reset password unsuccessful. Please contact the administrator.' =>
            'Zurücksetzen des Kennwort war nicht erfolgreich. Bitte kontaktieren Sie den Administrator!',
        'Added via Customer Panel (%s)' => 'Mittels Kundenbereich hinzugefügt (%s)',
        'Customer user can\'t be added!' => 'Kundenbenutzer kann nicht angelegt werden!',
        'Can\'t send account info!' => 'Kann Zugangsinformation nicht senden!',

        # Perl Module: Kernel/System/Web/InterfaceInstaller.pm
        'SecureMode active!' => 'SecureMode ist aktiv!',
        'If you want to re-run the Installer, disable the SecureMode in the SysConfig.' =>
            '',
        'Action "%s" not found!' => 'Aktion "%s" nicht gefunden!',

        # Database XML Definition: scripts/database/otrs-initial_insert.xml
        'Group for default access.' => 'Gruppe für den Standardzugriff.',
        'Group of all administrators.' => 'Gruppe aller Administratoren.',
        'Group for statistics access.' => 'Gruppe für den Statistikzugriff.',
        'All new state types (default: viewable).' => 'Alle neuen Statustypen (Standard: sichtbar).',
        'All open state types (default: viewable).' => 'Alle offenen Statustypen (Standard: sichtbar).',
        'All closed state types (default: not viewable).' => 'Alle geschlossenen Statustypen (Standard: nicht sichtbar).',
        'All \'pending reminder\' state types (default: viewable).' => 'Alle \'warten auf\'-Statustypen (Standard: sichtbar).',
        'All \'pending auto *\' state types (default: viewable).' => 'Alle \'warten auf automatisch *\'-Statustypen (Standard: sichtbar).',
        'All \'removed\' state types (default: not viewable).' => 'Alle "entfernten" Statustypen (Standard: nicht sichtbar).',
        'State type for merged tickets (default: not viewable).' => 'Statustyp für zusammengefasste Tickets (Standard: nicht sichtbar).',
        'New ticket created by customer.' => 'Neues Ticket von Kunden erstellt.',
        'Ticket is closed successful.' => 'Ticket erfolgreich geschlossen.',
        'Ticket is closed unsuccessful.' => 'Das Ticket ist erfolglos geschlossen.',
        'Open tickets.' => 'Offene Tickets',
        'Customer removed ticket.' => 'Kunde entfernte Ticket.',
        'Ticket is pending for agent reminder.' => 'Das Ticket wartet auf Erinnerung für Agenten.',
        'Ticket is pending for automatic close.' => 'Das Ticket wartet auf automatisches schließen.',
        'State for merged tickets.' => 'Status für zusammengefasste Tickets.',
        'system standard salutation (en)' => 'Systemstandardanrede (en)',
        'Standard Salutation.' => 'Standardanrede.',
        'system standard signature (en)' => 'Systemstandardsignatur (en)',
        'Standard Signature.' => 'Standard Signatur',
        'Standard Address.' => 'Standard Adresse',
        'Follow-ups for closed tickets are possible. Ticket will be reopened.' =>
            'Rückfragen für geschlossene Tickets sind möglich. Tickets werden wiedereröffnet.',
        'Follow-ups for closed tickets are not possible. No new ticket will be created.' =>
            'Rückfragen für geschlossene Tickets sind nicht möglich. Neue Tickets werden nicht erstellt.',
        'new ticket' => 'neues Ticket',
        'Follow-ups for closed tickets are not possible. A new ticket will be created..' =>
            'Rückfragen für geschlossene Tickets sind nicht möglich. Ein neues Ticket wird erstellt.',
        'Postmaster queue.' => 'Postmaster-Queue.',
        'All default incoming tickets.' => 'Alle eingehenden Tickets.',
        'All junk tickets.' => 'Alle Junk-Tickets.',
        'All misc tickets.' => 'Alle Misc-Tickets.',
        'Automatic reply which will be sent out after a new ticket has been created.' =>
            'Eine Automatische Antwort wird versandt, nachdem ein neues Ticket erstellt wurde.',
        'Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is "reject").' =>
            'Automatische Ablehnung, die gesendet wird, nachdem eine Rückantwort abgelehnt wurde (falls die Rückantworts-Einstellung der Queue "Ablehnen" ist).',
        'Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is "possible").' =>
            'Automatische Bestätigung, die gesendet wird, nachdem eine Rückantwort für ein Ticket empfangen wurde (falls die Rückantworts-Einstellung der Queue "Möglich" ist).',
        'Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is "new ticket").' =>
            'Automatische Antwort, die gesendet wird, nachdem eine Rückantwort abgelehnt und ein neues Ticket erstellt wurde (falls die Rückantworts-Einstellung der Queue "Neues Ticket" ist).',
        'Auto remove will be sent out after a customer removed the request.' =>
            'Auto Remove wird versendet, nachdem der Kundenbenutzer die Anfrage entfernt hat.',
        'default reply (after new ticket has been created)' => 'Standardantwort (nachdem ein neues Ticket erstellt wurde)',
        'default reject (after follow-up and rejected of a closed ticket)' =>
            'Standardablehnung (nachdem eine Antwort auf ein geschlossenes Ticket eingegangen und diese abgelehnt wurde)',
        'default follow-up (after a ticket follow-up has been added)' => 'Standardantwort (nachdem eine Antwort auf ein Ticket eingegangen ist)',
        'default reject/new ticket created (after closed follow-up with new ticket creation)' =>
            'Standardablehnung/Neues Ticket erstellt (nachdem eine Antwort auf ein geschlossenes Ticket eingegangen ist und ein neues Ticket erstellt wurde)',
        'Unclassified' => 'Unklassifiziert',
        'tmp_lock' => 'tmp_lock',
        'email-notification-ext' => 'Email-Notification-extern',
        'email-notification-int' => 'Email-Notification-intern',
        'Ticket create notification' => 'Benachrichtigung über neues Ticket',
        'You will receive a notification each time a new ticket is created in one of your "My Queues" or "My Services".' =>
            'Sie erhalten eine Benachrichtigung, wenn ein Ticket in Ihren unter "Meine Queues" oder "Meine Services" ausgewählten Queues oder Services erstellt wird.',
        'Ticket follow-up notification (unlocked)' => 'Benachrichtigung über Folgeaktionen (entsperrtes Ticket)',
        'You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your "My Queues" or "My Services".' =>
            'Sie erhalten eine Benachrichtigung, wenn ein Kunde eine Rückmeldung zu einem Ticket sendet, das in Ihren unter "Meine Queues" oder "Meine Services" ausgewählten Queues oder Services erstellt wurde.',
        'Ticket follow-up notification (locked)' => 'Benachrichtigung über Folgeaktionen (gesperrtes Ticket)',
        'You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.' =>
            'Sie erhalten eine Benachrichtigung, wenn ein Kunde eine Rückmeldung zu einem Ticket sendet, dessen Besitzer oder Verantwortlicher Sie sind.',
        'You will receive a notification as soon as a ticket owned by you is automatically unlocked.' =>
            'Sie erhalten eine Benachrichtigung, wenn ein Ticket, dessen Besitzer Sie sind, automatisch entsperrt wurde.',
        'Ticket owner update notification' => 'Benachrichtigung über Änderung des  Ticket Besitzers',
        'Ticket responsible update notification' => 'Benachrichtigung über Änderung des  Ticket Verantwortlichen',
        'Ticket new note notification' => 'Benachrichtigung über neue Notiz',
        'Ticket queue update notification' => 'Benachrichtigung über Änderung der Queue',
        'You will receive a notification if a ticket is moved into one of your "My Queues".' =>
            'Sie erhalten eine Benachrichtigung, wenn ein Ticket in eine der Queues verschoben wurde, die Sie unter "Meine Queues" ausgewählt haben.',
        'Ticket pending reminder notification (locked)' => 'Benachrichtigung über Erreichen der Erinnerungszeit (gesperrtes Ticket)',
        'Ticket pending reminder notification (unlocked)' => 'Benachrichtigung über Erreichen der Erinnerungszeit (entsperrtes Ticket)',
        'Ticket escalation notification' => 'Benachrichtigung über erfolgte Ticket Eskalation',
        'Ticket escalation warning notification' => 'Benachrichtigung über baldige Ticket Eskalation',
        'Ticket service update notification' => 'Benachrichtigung über Änderung des Services',
        'You will receive a notification if a ticket\'s service is changed to one of your "My Services".' =>
            'Sie erhalten eine Benachrichtigung, wenn für ein Ticket einer der Services ausgewählt wurde, die Sie unter "Meine Services" ausgewählt haben.',

        # SysConfig
        '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
' => '
Sehr geehrter Kunde,

Leider enthält der von Ihnen verwendete Betreff keine gültige Ticketnummer, so dass diese E-Mail nicht automatisch verarbeitet werden kann.

Bitte erstellen Sie ein neues Ticket im Kundenbereich.

Danke für Ihr Verständnis!

Ihr Helpdesk-Team
',
        ' (work units)' => ' (Arbeitseinheiten)',
        '"%s" notification was sent to "%s" by "%s".' => '"%s"-Benachrichtigung versandt an "%s" von "%s".',
        '"Slim" skin which tries to save screen space for power users.' =>
            '"Slim"-Skin, der weniger Bildschirmfläche zum Darstellen von Informationen benötigt.',
        '%s' => '%s',
        '%s time unit(s) accounted. Now total %s time unit(s).' => '%s Zeiteinheit(en) gezählt. Insgesamt %s Zeiteinheit(en).',
        '(UserLogin) Firstname Lastname' => '(BenutzerLogin) Vorname Nachname',
        '(UserLogin) Lastname Firstname' => '(UserLogin) Lastname Firstname',
        '(UserLogin) Lastname, Firstname' => '(BenutzerLogin) Nachname, Vorname',
        '*** out of office until %s (%s d left) ***' => '*** nicht im Büro bis %s (%s Tage übrig) ***',
        '100 (Expert)' => '100 (Experte)',
        '200 (Advanced)' => '200 (Fortgeschritten)',
        '300 (Beginner)' => '300 (Anfänger)',
        'A TicketWatcher Module.' => 'Ein Ticket-Beobachten-Modul.',
        'A Website' => 'Eine Webseite',
        'A list of dynamic fields that are merged into the main ticket during a merge operation. Only dynamic fields that are empty in the main ticket will be set.' =>
            'Eine Liste der dynamischen Felder, die während einer Zusammenführung in das Haupt-Ticket ebenfalls zusammengeführt werden. Es werden nur leere dynamische Felder im Haupt-Ticket geändert.',
        'A picture' => 'Ein Bild',
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'ACL Modul das erlaubt Eltern-Tickets nur dann zu schließen, wenn alle seine Kinder-Tickets geschlossen wurden. ("Status" zeigt welche Status für das Eltern-Ticket nicht verfügbar sind, bis alle Kinder-Tickets geschlossen sind).',
        'Access Control Lists (ACL)' => 'Access Control Lists (ACL)',
        'AccountedTime' => 'Erfasste Zeit',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Aktiviert einen Blinkmechanismus der Queue, die das älteste Ticket enthält.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Aktiviert die "Passwort vergessen" Funktion für Agenten in der Agentenoberfläche.',
        'Activates lost password feature for customers.' => 'Aktiviert die "Passwort vergessen" Funktion für Kunden.',
        'Activates support for customer groups.' => 'Aktiviert die Unterstützung für Kundengruppen.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Aktiviert verschiedene Artikelfilter in der Zoomansicht, um festzulegen, welche Artikel angezeigt werden sollen.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Aktiviert die verfügbaren Skins auf dem System. Wert 1 bedeutet aktiv, 0 bedeutet inaktiv.',
        'Activates the ticket archive system search in the customer interface.' =>
            'Aktiviert die Suche im Ticket-Archiv für das Kunden-Interface.',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Aktiviert das Ticket Archivsystem, um ein schnelleres System zu haben, indem einige Tickets aus dem täglichen Anwendungsbereich verschoben werden. Um diese Tickets in der Suche zu finden, muss das Archiv-Flag in der Ticketsuche aktiviert werden.',
        'Activates time accounting.' => 'Aktiviert die Zeitabrechnung.',
        'ActivityID' => 'ActivityID',
        'Add an inbound phone call to this ticket' => 'Fügen Sie einen eingehenden Anruf zu diesem Ticket hinzu.',
        'Add an outbound phone call to this ticket' => 'Fügen Sie einen ausgehenden Anruf zu diesem Ticket hinzu.',
        'Added email. %s' => 'E-Mail hinzugefügt. %s',
        'Added link to ticket "%s".' => 'Verknüpfung zu "%s" hergestellt.',
        'Added note (%s)' => 'Notiz hinzugefügt (%s)',
        'Added subscription for user "%s".' => 'Abo für Benutzer "%s" eingetragen.',
        'Address book of CustomerUser sources.' => 'Adressbuch für Kundenbenutzer-Quellen.',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            'Fügt einen Suffix mit dem aktuellen Jahr und Monat in die OTRS-Protokolldatei hinzu. Für jeden Monat wir eine eigen Log-Datei erstellt.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface. The customers email address won\'t be added if the article type is email-internal.' =>
            'Fügt die Kunden E-Mailadresse zu den Empfängern hinzu in der "TicketCompose"-Oberfläche des Agenten-Interface hinzu. Die Kunden E-Mailadresse wird nicht hinzugefügt, wenn der Artikel-Typ \'email an intern\' ist.',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Fügt die einmaligen Feiertagetage für den angezeigten Kalender. Bitte verwenden Sie einstellige Zahlen von 1 bis 9 (statt 01 bis 09).',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Fügt die einmaligen Ferien-Tage für den ausgewählten Kalender hinzu. Bitte benutzen Sie ein Ein-Zahlen-Muster mit Zahlen von 1 bis 9 (anstatt 01 - 09).',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Fügt die permanenten Ferien-Tage für den ausgewählten Kalender hinzu. Bitte benutzen Sie ein Ein-Zahlen-Muster mit Zahlen von 1 bis 9 (anstatt 01 - 09).',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Fügt die permanenten Ferien-Tage hinzu. Bitte benutzen Sie ein Ein-Zahlen-Muster mit Zahlen von 1 bis 9 (anstatt 01 - 09).',
        'Admin Area.' => 'Administratorbereich.',
        'After' => 'nach',
        'Agent Name' => 'Agentenname',
        'Agent Name + FromSeparator + System Address Display Name' => 'Agenten-Name + From-Trennzeichen + Anzeigename der System-Adresse',
        'Agent Preferences.' => 'Persönliche Agenten-Einstellungen',
        'Agent called customer.' => 'Kunden angerufen.',
        'Agent interface article notification module to check PGP.' => 'Benachrichtigungsmodul im Agenten-Interface das die PGP-Überprüfung durchführt.',
        'Agent interface article notification module to check S/MIME.' =>
            'Benachrichtigungsmodul im Agenten-Interface das die S/MIME-Prüfung durchführt.',
        'Agent interface module to access CIC search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen-Modul für den Zugriff auf die CIC-Suche über die Navigationsleiste. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface module to access fulltext search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen-Modul für den Zugriff auf die Volltext-Suche über die Navigationsleiste. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface module to access search profiles via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen-Modul für den Zugriff auf die Such-Profile über die Navigationsleiste. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Modul im Agenten-Interface um eingehende E-Mails in der TicketZoomView auf vorhandene und gültige S/MIME-Schlüssel zu überprüfen. ',
        'Agent interface notification module to see the number of locked tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen Benachrichtigungs-Modul zum Anzeigen der Anzahl der gesperrten Tickets. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface notification module to see the number of tickets an agent is responsible for. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen Benachrichtigungs-Modul zum Anzeigen der Anzahl der Tickets, für die der Agent verantwortlich ist. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface notification module to see the number of tickets in My Services. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen Benachrichtigungs-Modul zum Anzeigen der Anzahl der Tickets in "Meien Dienste". Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface notification module to see the number of watched tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen Benachrichtigungs-Modul zum Anzeigen der Anzahl der beobachteten Tickets. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'AgentCustomerSearch' => 'AgentCustomerSearch',
        'AgentCustomerSearch.' => 'AgentCustomerSearch.',
        'AgentUserSearch' => 'AgentUserSearch',
        'AgentUserSearch.' => 'AgentUserSearch.',
        'Agents <-> Groups' => 'Agent <-> Gruppen',
        'Agents <-> Roles' => 'Agent <-> Rollen',
        'All customer users of a CustomerID' => 'Alle Kundenbenutzer einer Kundennummer',
        'Allows adding notes in the close ticket screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt in der Agentenoberfläche das Hinzufügen von Notizen im  \'Schließen\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Allows adding notes in the ticket free text screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt in der Agentenoberfläche das Hinzufügen von Notizen im \'Freie-Felder\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Allows adding notes in the ticket note screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt in der Agentenoberfläche das Hinzufügen von Notizen im \'Notiz\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt in der Agentenoberfläche in einem geöffneten Ticket das Hinzufügen von Notizen im \'Besitzer\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt in der Agentenoberfläche in einem geöffneten Ticket das Hinzufügen von Notizen im \'Warten\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt in der Agentenoberfläche in einem geöffneten Ticket das Hinzufügen von Notizen im \'Priorität\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Allows adding notes in the ticket responsible screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt in der Agentenoberfläche in einem geöffneten Ticket das Hinzufügen von Notizen im \'Verantwortlichen\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Erlaubt Agenten die Achsen einer Statistik zu tauschen, wenn sie eine Statistik generieren.',
        'Allows agents to generate individual-related stats.' => 'Erlaubt Agenten eine individuelle Statistik zu generieren.',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Ermöglicht die Wahl zwischen der Anzeige der Anlagen eines Tickets im Browser (Inline) oder einfach nur als Download anbieten (Anhang).',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Ermöglicht die Wahl des nächsten Verfassen-Status für Kundenticket im Kunden-Interface.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Erlaubt Kunden die Ticketpriorität im Kunden-Interface zu ändern.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Erlaubt Kunden das setzen von SLAst im Kunden-Interface zu ändern.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Erlaubt Kunden das Setzen der Ticketpriorität im Kunden-Interface zu ändern.',
        'Allows customers to set the ticket queue in the customer interface. If this is set to \'No\', QueueDefault should be configured.' =>
            'Ermöglicht es Kunden, die Ticket-Queue in der Kunden-Oberfläche zu setzen . Wenn dieser Wert auf \'Nein\' steht, sollte der Wert \'QueueDefault\' konfiguriert werden.',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Ermöglicht es Kunden den Ticket-Service im Kunden-Interface einzustellen.',
        'Allows customers to set the ticket type in the customer interface. If this is set to \'No\', TicketTypeDefault should be configured.' =>
            'Ermöglicht es Kunden, den Ticket-Typ im Kunden-Interface zu setzen. Wenn dieser Wert auf \'Nein\' steht, sollte der Wert \'TicketTypeDefault\' konfiguriert werden.',
        'Allows default services to be selected also for non existing customers.' =>
            'Ermöglicht das Standard-Services auch für nicht angelegte Kunden ausgewählt werden können.',
        'Allows defining new types for ticket (if ticket type feature is enabled).' =>
            'Ermöglicht die Definition neuer Ticket-Typen  (wenn Ticket-Typ-Funktion aktiviert ist).',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Erlaubt die Definition von Services und SLAs für Tickets (zum Beispiel: E-Mail, Desktop, Network, ...) und Eskalationsattributen für SLAs (wenn die Ticket Service/SLA Einstellung aktiviert ist).',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Erlaubt erweiterte Suchbedingungen der generischen Agenten-Schnittstelle. Mit diesem Feature kann man z.B. Ticket-Titel mit Bedingungen wie dieser "(*key1*&&*key2*)" oder "(*key1*||*key2*)" durchsuchen.',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Ermöglicht eine Ticket-Übersicht mit einigen Ticketinformationen  (Customer => 1 - zeigt auch die Kundeninformation).',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Ermöglicht die Benutzung der kleinenTicketübersicht (CustomerInfo => 1 - zeigt auch die Kundeninformation ).',
        'Allows invalid agents to generate individual-related stats.' => 'Erlaubt Agenten, die ungültig sind, individuelle Statistiken zu generieren.',
        'Allows the administrators to login as other customers, via the customer user administration panel.' =>
            'Erlaubt Administratoren sich als Kunde über die Customer-User-Administrationsoberfläche anzumelden.',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Erlaubt Administratoren sich als anderer Agent über die Agenten-Administrationsoberfläche anzumelden.',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Erlaubt das Setzen eines neuen Ticket-Status im Verschieben-Bildschirm im Agenten-Interface.',
        'Always show RichText if available' => 'Richtext immer verwenden, wenn verfügbar.',
        'Arabic (Saudi Arabia)' => 'Arabisch (Saudi-Arabien)',
        'Archive state changed: "%s"' => 'Archivstatus geändert: "%s"',
        'ArticleTree' => 'Artikelbaum',
        'Attachments <-> Templates' => 'Anhänge <-> Vorlagen',
        'Auto Responses <-> Queues' => 'Auto-Antworten <-> Queues',
        'AutoFollowUp sent to "%s".' => 'AutoFollowUp an "%s" versandt.',
        'AutoReject sent to "%s".' => 'AutoReject an "%s" versandt.',
        'AutoReply sent to "%s".' => 'AutoReply an "%s" versandt.',
        'Automated line break in text messages after x number of chars.' =>
            'Automatischer Zeilenumbruch in Textnachrichten nach x-Zeichen.',
        'Automatically lock and set owner to current Agent after opening the move ticket screen of the agent interface.' =>
            'Automatisches Sperren und setzen des aktuellen Agenten als Besitzer nachdem der Verschieben-Bildschirm im Agenten-Interface geöffnet wurde.',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Automatisches Sperren und setzen des aktuellen Agenten als Besitzer nachdem der Sammelaktion-Bildschirm gewählt wurde.',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled). This will only work by manually actions of the logged in user. It does not work for automated actions e.g. GenericAgent, Postmaster and GenericInterface.' =>
            'Setzt den Besitzer eines Tickets automatisch auch als Verantwortlichen (wenn das Verantwortlicher-Feature aktiviert ist). Dies wird nur durch manuelle Aktionen des eingeloggten Benutzers ausgelöst, nicht durch automatische wie GenericAgent, Postmaster oder GenericInterface.',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Automatisches setzen eines Ticket-Verantwortlichen (wenn er noch nicht gesetzt wurde) nach dem ersten Besitzer-Update.',
        'Balanced white skin by Felix Niklas (slim version).' => 'Balanced White-Skin von Felix Niklas (slim)',
        'Balanced white skin by Felix Niklas.' => 'Balanced White Skin von Felix Niklas.',
        'Based on global RichText setting' => 'Basierend auf der globalen Richtext-Einstellung',
        'Basic fulltext index settings. Execute "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild" in order to generate a new index.' =>
            'Basis-Einstellungen für den Volltext-Index. Führen Sie "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild" aus, um den Index neu zu erstellen.',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Blockiert alle eingehenden E-Mails, die keine gültige Ticketnummer im Betreff mit Absenderadresse: @ example.com besitzen.',
        'Bounced to "%s".' => 'Bounced an "%s".',
        'Builds an article index right after the article\'s creation.' =>
            'Erstellt einen Artikel-Index direkt nach der Erstellung des Artikels.',
        'Bulgarian' => 'Bulgarisch',
        'CMD example setup. Ignores emails where external CMD returns some output on STDOUT (email will be piped into STDIN of some.bin).' =>
            'CMD Beispiel-Setup. Ignoriert E-Mails, in denen ein externer CMD eine Ausgabe auf STDOUT liefert (E-Mail von some.bin wird in STDIN geleitet).',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            'Cache-Zeit in Sekunden für Agent-Authentifizierungen im GenericInterface.',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            'Cache-Zeit in Sekunden für Kunden-Authentifizierungen im GenericInterface.',
        'Cache time in seconds for the DB ACL backend.' => 'Cache-Zeit in Sekunden für Datenbank ACL-Backends.',
        'Cache time in seconds for the DB process backend.' => 'Cache-Zeit in Sekunden für Datenbank Prozess-Backends.',
        'Cache time in seconds for the SSL certificate attributes.' => 'Cache-Zeit in Sekunden für SSL-Zertifikatsattribute.',
        'Cache time in seconds for the ticket process navigation bar output module.' =>
            'Cache-Zeit in Sekunden für das Ticket-Prozess-Navigationsleisten-Ausgabemodul.',
        'Cache time in seconds for the web service config backend.' => 'Cache-Zeit in Sekunden für das Webservice-Konfigurations-Backend.',
        'Catalan' => 'Katalanisch',
        'Change password' => 'Passwort ändern',
        'Change queue!' => 'Queue ändern',
        'Change the customer for this ticket' => 'Ticket-Kunden ändern',
        'Change the free fields for this ticket' => 'Freie Felder des Tickets ändern',
        'Change the priority for this ticket' => 'Priorität des Tickets ändern',
        'Change the responsible for this ticket' => 'Verantwortlichen für dieses Tickets ändern',
        'Changed priority from "%s" (%s) to "%s" (%s).' => 'Priorität aktualisiert von "%s" (%s) nach "%s" (%s).',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Ändert den Besitzer der Tickets auf Alle (nützlich für ASP). In der Regel werden nur Agenten mit rw-Berechtigungen auf die Queue angezeigt.',
        'Checkbox' => 'Kontrollkästchen',
        'Checks if an E-Mail is a followup to an existing ticket by searching the subject for a valid ticket number.' =>
            'Prüft, ob eine E-Mail ein Follow-Up zu einem bestehenden Ticket ist, indem der Betreff nach einer gültigen Ticketnummer durchsucht wird.',
        'Checks the SystemID in ticket number detection for follow-ups (use "No" if SystemID has been changed after using the system).' =>
            'Überprüft die System-ID in der Ticketnummer-Erkennung bei FolloUps (Wählen Sie "Nein" wenn die System-ID während der Nutzung geändert wurde).',
        'Checks the availability of OTRS Business Solution™ for this system.' =>
            'Überprüfe die Verfügbarkeit der OTRS Business Solution™ für dieses System.',
        'Checks the entitlement status of OTRS Business Solution™.' => 'Überprüfe den Berechtigungsstatus der OTRS Business Solution™ für dieses System.',
        'Chinese (Simplified)' => 'Chinesisch (vereinfacht)',
        'Chinese (Traditional)' => 'Chinesisch (traditionell)',
        'Choose for which kind of ticket changes you want to receive notifications.' =>
            'Für welche Veränderungen an Tickets möchten Sie Benachrichtigungen erhalten?',
        'Closed tickets (customer user)' => 'Geschlossene Tickets (Kundenbenutzer)',
        'Closed tickets (customer)' => 'Geschlossene Tickets (Kunden)',
        'Cloud Services' => 'Cloud-Service',
        'Cloud service admin module registration for the transport layer.' =>
            'Cloud-Service-Admin-Modulregistrierung für den Transport-Layer.',
        'Collect support data for asynchronous plug-in modules.' => 'Sammelt Support Daten für asynchrone Erweiterungen.',
        'Column ticket filters for Ticket Overviews type "Small".' => 'Ticket-Filter-Spalte für Ticketübersichten vom Typ "Klein".',
        'Columns that can be filtered in the escalation view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Spalten, auf die in der Eskalations-Ansicht des Agentenbereichs ein Filter angewandt werden kann. Mögliche Werte: 0 = Deaktiviert, 1 = als Filter verfügbar, 2 = standardmäßig als Filter aktiviert. Hinweis: Es sind nur Ticket-Attribute, dynamische Felder (DynamicField_NameX) und Kundenattribute (z.B. CustomerUserPhone, CustomerCompanyName) erlaubt.',
        'Columns that can be filtered in the locked view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Spalten, auf die in der Gesperrt-Ansicht des Agentenbereichs ein Filter angewandt werden kann. Mögliche Werte: 0 = Deaktiviert, 1 = als Filter verfügbar, 2 = standardmäßig als Filter aktiviert. Hinweis: Es sind nur Ticket-Attribute, dynamische Felder (DynamicField_NameX) und Kundenattribute (z.B. CustomerUserPhone, CustomerCompanyName) erlaubt.',
        'Columns that can be filtered in the queue view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Spalten, auf die in der Queue-Ansicht des Agentenbereichs ein Filter angewandt werden kann. Mögliche Werte: 0 = Deaktiviert, 1 = als Filter verfügbar, 2 = standardmäßig als Filter aktiviert. Hinweis: Es sind nur Ticket-Attribute, dynamische Felder (DynamicField_NameX) und Kundenattribute (z.B. CustomerUserPhone, CustomerCompanyName) erlaubt.',
        'Columns that can be filtered in the responsible view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Spalten, auf die in der Verantwortlicher-Ansicht des Agentenbereichs ein Filter angewandt werden kann. Mögliche Werte: 0 = Deaktiviert, 1 = als Filter verfügbar, 2 = standardmäßig als Filter aktiviert. Hinweis: Es sind nur Ticket-Attribute, dynamische Felder (DynamicField_NameX) und Kundenattribute (z.B. CustomerUserPhone, CustomerCompanyName) erlaubt.',
        'Columns that can be filtered in the service view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Spalten, auf die in der Service-Ansicht des Agentenbereichs ein Filter angewandt werden kann. Mögliche Werte: 0 = Deaktiviert, 1 = als Filter verfügbar, 2 = standardmäßig als Filter aktiviert. Hinweis: Es sind nur Ticket-Attribute, dynamische Felder (DynamicField_NameX) und Kundenattribute (z.B. CustomerUserPhone, CustomerCompanyName) erlaubt.',
        'Columns that can be filtered in the status view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Spalten, auf die in der Status-Ansicht des Agentenbereichs ein Filter angewandt werden kann. Mögliche Werte: 0 = Deaktiviert, 1 = als Filter verfügbar, 2 = standardmäßig als Filter aktiviert. Hinweis: Es sind nur Ticket-Attribute, dynamische Felder (DynamicField_NameX) und Kundenattribute (z.B. CustomerUserPhone, CustomerCompanyName) erlaubt.',
        'Columns that can be filtered in the ticket search result view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Spalten, auf die in der Suchergebnis-Ansicht des Agentenbereichs ein Filter angewandt werden kann. Mögliche Werte: 0 = Deaktiviert, 1 = als Filter verfügbar, 2 = standardmäßig als Filter aktiviert. Hinweis: Es sind nur Ticket-Attribute, dynamische Felder (DynamicField_NameX) und Kundenattribute (z.B. CustomerUserPhone, CustomerCompanyName) erlaubt.',
        'Columns that can be filtered in the watch view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Spalten, auf die in der Beobachten-Ansicht des Agentenbereichs ein Filter angewandt werden kann. Mögliche Werte: 0 = Deaktiviert, 1 = als Filter verfügbar, 2 = standardmäßig als Filter aktiviert. Hinweis: Es sind nur Ticket-Attribute, dynamische Felder (DynamicField_NameX) und Kundenattribute (z.B. CustomerUserPhone, CustomerCompanyName) erlaubt.',
        'Comment for new history entries in the customer interface.' => 'Kommentar für neue Historieneinträge im Kunden-Interface.',
        'Comment2' => 'Kommentar2',
        'Communication' => 'Kommunikation',
        'Company Status' => 'Firmenstatus',
        'Company Tickets.' => 'Firmen-Tickets.',
        'Company name which will be included in outgoing emails as an X-Header.' =>
            'Firmenname, welcher in ausgehenden E-Mails als X-Header gesetzt werden soll.',
        'Compat module for AgentZoom to AgentTicketZoom.' => 'Übergangsmodul für AgentZoom zu AgentTicketZoom.',
        'Complex' => 'Komplex',
        'Configure Processes.' => 'Prozesse verwalten.',
        'Configure and manage ACLs.' => 'ACLs konfigurieren und verwalten.',
        'Configure any additional readonly mirror databases that you want to use.' =>
            'Konfigurieren Sie alle weiteren Readonly-Spiegeldatenbanken, die Sie verwenden möchten.',
        'Configure sending of support data to OTRS Group for improved support.' =>
            'Konfigurieren Sie das Senden von Support Daten an die OTRS-Group für eine bessere Unterstützung.',
        'Configure which screen should be shown after a new ticket has been created.' =>
            'Konfigurieren Sie, welche Oberfläche angezeigt werden soll, nachdem ein neues Ticket erstellt wurde.',
        'Configure your own log text for PGP.' => 'Konfigurieren Sie Ihren eigenen Log-Text für PGP.',
        'Configures a default TicketDynamicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (http://otrs.github.io/doc/), chapter "Ticket Event Module".' =>
            'Konfiguriert eine Standardeinstellung für ein dynamisches Ticketfeld. "Name" beschreibt das dynamische Feld, das genutzt werden soll, "Value" die Daten, mit denen das Feld befüllt werden soll. "Event" enthält das auslösende Ereignis. Weitere Informationen finden Sie im Entwicklerhandbuch (http://otrs.github.io/doc/) im Kapitel "Ticket-Eventmodule".',
        'Controls how to display the ticket history entries as readable values.' =>
            'Kontrolliert wie die Ticket-Historie in lesbaren Werten dargestellt wird.',
        'Controls if CustomerID is automatically copied from the sender address for unknown customers.' =>
            '',
        'Controls if CustomerID is read-only in the agent interface.' => '',
        'Controls if customers have the ability to sort their tickets.' =>
            'Legt fest, ob Kunden die Möglichkeit haben ihre Tickets zu sortieren.',
        'Controls if more than one from entry can be set in the new phone ticket in the agent interface.' =>
            'Kontrolliert, ob mehr als ein Eintrag in einem neuen Telefon-Ticket festgelegt werden kann.',
        'Controls if the admin is allowed to import a saved system configuration in SysConfig.' =>
            'Kontrolliert, ob es dem Admin erlaubt ist, eine gespeicherte Systemkonfiguration in SysConfig zu importieren.',
        'Controls if the admin is allowed to make changes to the database via AdminSelectBox.' =>
            'Überprüft ob der Administrator die Berechtigung besitzt Änderungen in der Datenbank über die AdminSelectBox zu tätigen.',
        'Controls if the ticket and article seen flags are removed when a ticket is archived.' =>
            'Kontrolliert ob die Ticket- und Artikel "Gesehen"-Fähnchen entfernt werden, wenn ein Ticket archiviert wird.',
        'Converts HTML mails into text messages.' => 'Konvertiert HTML E-Mails in Textnachrichten.',
        'Create New process ticket.' => 'Neues Prozess-Ticket erstellen.',
        'Create and manage Service Level Agreements (SLAs).' => 'Service-Level-Abkommen (SLAs) erzeugen und verwalten.',
        'Create and manage agents.' => 'Agents erzeugen und verwalten.',
        'Create and manage attachments.' => 'Anlagen erzeugen und verwalten.',
        'Create and manage customer users.' => 'Kundenbenutzer erzeugen und verwalten.',
        'Create and manage customers.' => 'Kunden erzeugen und verwalten.',
        'Create and manage dynamic fields.' => 'Dynamische Felder erzeugen und verwalten.',
        'Create and manage groups.' => 'Gruppen erzeugen und verwalten.',
        'Create and manage queues.' => 'Queues erzeugen und verwalten.',
        'Create and manage responses that are automatically sent.' => 'Vorlagen für automatische Antworten erzeugen und verwalten.',
        'Create and manage roles.' => 'Rollen erzeugen und verwalten.',
        'Create and manage salutations.' => 'Anreden erzeugen und verwalten.',
        'Create and manage services.' => 'Services erzeugen und verwalten.',
        'Create and manage signatures.' => 'Signaturen erzeugen und verwalten.',
        'Create and manage templates.' => 'Vorlagen erzeugen und verwalten.',
        'Create and manage ticket notifications.' => 'Ticket-Benachrichtigungen erstellen und verwalten.',
        'Create and manage ticket priorities.' => 'Ticket-Prioritäten erzeugen und verwalten.',
        'Create and manage ticket states.' => 'Ticket-Status  erzeugen und verwalten.',
        'Create and manage ticket types.' => 'Ticket-Typen erzeugen und verwalten.',
        'Create and manage web services.' => 'Webservices erzeugen und verwalten.',
        'Create new Ticket.' => 'Neues Ticket erstellen.',
        'Create new email ticket and send this out (outbound).' => 'Neues E-Mail-Ticket erstellen und versenden (ausgehend).',
        'Create new email ticket.' => 'Neues E-Mail-Ticket erstellen.',
        'Create new phone ticket (inbound).' => 'Neues Telefon-Ticket erstellen (eingehend).',
        'Create new phone ticket.' => 'Neues Telefon-Ticket erstellen.',
        'Create new process ticket.' => 'Neues Prozess-Ticket erstellen.',
        'Create tickets.' => 'Tickets erstellen.',
        'Croatian' => 'Kroatisch',
        'Custom RSS Feed' => 'Benutzerspezifischer RSS Feed',
        'Custom text for the page shown to customers that have no tickets yet (if you need those text translated add them to a custom translation module).' =>
            'Benutzerdefinierter Text für Kunden, die noch keine Tickets haben (wenn Sie für diesen Text eine Übersetzung wünschen, fügen Sie die Übersetzung in einem eigenen Übersetzungsmodul hinzu).',
        'Customer Administration' => 'Kundenverwaltung',
        'Customer Information Center Search.' => 'Kunden-Informationszentrum-Suche.',
        'Customer Information Center.' => 'Kunden-Informationszentrum.',
        'Customer Ticket Print Module.' => 'Kunden-Ticketdruck-Modul.',
        'Customer User <-> Groups' => 'Kundenbenutzer <-> Gruppen',
        'Customer User <-> Services' => 'Kundenbenutzer <-> Services',
        'Customer User Administration' => 'Kundenbenutzerverwaltung',
        'Customer Users' => 'Kundenbenutzer',
        'Customer called us.' => 'Kunde hat angerufen.',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Kunden-Tickets (Symbol), die die geschlossenen Tickets eines Kunden als Infoblock anzeigt. Setzen Sie die Einstellung CustomerUserLogin auf 1 um Tickets auf Basis des Login-Namens zu suchen anstatt auf Basis der CustomerID.',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Kunden-Tickets (Symbol), die die offenen Tickets eines Kunden als Infoblock anzeigt. Setzen Sie die Einstellung CustomerUserLogin auf 1 um Tickets auf Basis des Login-Namens zu suchen anstatt auf Basis der CustomerID.',
        'Customer preferences.' => 'Persönliche Kunden-Einstellungen',
        'Customer request via web.' => 'Kunde stellte Anfrage über Web.',
        'Customer ticket overview' => 'Kunden-Ticket-Übersicht',
        'Customer ticket search.' => 'Kunden-Ticketsuche.',
        'Customer ticket zoom' => 'Ticketansicht für Kunden',
        'Customer user search' => 'Kundenbenutzersuche',
        'CustomerID search' => 'Kundennummernsuche',
        'CustomerName' => 'Kundenname',
        'CustomerUser' => 'CustomerUser',
        'Customers <-> Groups' => 'Kunden <-> Gruppen',
        'Customizable stop words for fulltext index. These words will be removed from the search index.' =>
            'Anpassbare Stopworte für den Volltext-Index. Diese Worte werden aus dem Suchindex entfernt.',
        'Czech' => 'Tschechisch',
        'Danish' => 'Dänisch',
        'Data used to export the search result in CSV format.' => 'Daten die verwendet werden um das Suchergebnis im CSV-Format zu exportieren.',
        'Date / Time' => 'Datum / Zeit',
        'Debug' => 'Fehlersuche',
        'Debugs the translation set. If this is set to "Yes" all strings (text) without translations are written to STDERR. This can be helpful when you are creating a new translation file. Otherwise, this option should remain set to "No".' =>
            'Debuggt die Übersetzungen. Wenn dies auf "Ja" gesetzt ist, werden alle nicht übersetzten Strings (Text), zur STDERR hinzugefügt. Dies kann hilfreich sein, wenn Sie eine eigene Übersetzung anlegen. Ansonsten sollte diese Option auf "Nein" gesetzt bleiben.',
        'Default' => 'Standard',
        'Default (Slim)' => 'Standard (Schlank)',
        'Default ACL values for ticket actions.' => 'Standard ACL-Werte für Ticketaktionen.',
        'Default ProcessManagement entity prefixes for entity IDs that are automatically generated.' =>
            'Standard Entitäts-Präfixe des Prozessmanagements für Entitäts-IDs, die automatisch generiert werden.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            'Standarddaten, die als Attribute für die für die Ticket-Suchmaske verwendet werden. Beispiel: "TicketCreateTimePointFormat = Jahr; TicketCreateTimePointStart = Letzter; TicketCreateTimePoint = 2;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            'Standarddaten, die als Attribute für die für die Ticket-Suchmaske verwendet werden. Beispiel: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".',
        'Default display type for recipient (To,Cc) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Standard Anzeigetyp für Empfängernamen(To, Cc) in AgentTicketZoom und CustomerTicketZoom.',
        'Default display type for sender (From) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Standard-Anzeigetyp für Absender-Namen (Von) in AgentTicketZoom und CustomerTicketZoom.',
        'Default loop protection module.' => 'Standard "Loop Protection"-Modul',
        'Default queue ID used by the system in the agent interface.' => 'Standard-Queue-ID welche von OTRS in der Agentenoberfläche verwendet wird.',
        'Default skin for the agent interface (slim version).' => 'Standard-Skin für die Agentenoberfläche (Slim)',
        'Default skin for the agent interface.' => 'Standard-Skin für die Agentenoberfläche',
        'Default skin for the customer interface.' => 'Standard-Skin für das Kunden Interface.',
        'Default ticket ID used by the system in the agent interface.' =>
            'Standard-Ticket-ID welche von OTRS in der Agentenoberfläche verwendet wird.',
        'Default ticket ID used by the system in the customer interface.' =>
            'Standard-Ticket-ID welche von OTRS in der Kundenoberfläche verwendet wird.',
        'Default value for NameX' => 'Standardwert für NameX',
        'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.' =>
            'Definieren Sie Actions, in denen im Verknüpfte-Objekte-Widget ein Einstellungen-Knopf verfügbar sein soll (LinkObject::ViewMode = "complex"). Bitte beachten Sie, dass für diese Actions die folgenden JS- und CSS-Dateien registriert sein müssen: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definiert einen Filter für die HTML-Ausgabe um Links hinter einer bestimmten Zeichenfolge hinzufügen. Dieses Element erlaubt zwei Eingabearten. Zum einem den Namen eines Bildes (Beispielsweise faq.png). In diesem Fall wird der OTRS-Bildpfad verwendet. Die zweite Möglichkeit ist, den Link zu dem Bild einzufügen.',
        'Define a mapping between variables of the customer user data (keys) and dynamic fields of a ticket (values). The purpose is to store customer user data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the next setting below.' =>
            'Definiert eine Zuordnung zwischen Variablen der Kundenbenutzerdaten (Schlüssel) und dynamischen Feldern eines Ticket (Werte). Somit können Sie Kundenbenutzerdaten eines Tickets in dynamische Felder speichern. Die dynamischen Felder müssen im System vorhanden sein und sollten für AgentTicketFreeText aktiviert werden, damit sie eingestellt / manuell durch den Agenten aktualisiert werden können. Sie dürfen nicht für AgentTicketPhone, AgentTicketEmail und AgentTicketCustomer aktiviert werden. Wenn sie in diesen Masken aktiviert werden, werden später automatisch gesetzte Werte überschrieben werden. Um dieses Mapping zu verwenden, müssen Sie auch Sie die nächste Einstellung aktivieren.',
        'Define dynamic field name for end time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Definiert dynamische Feldnamen für die Endzeit. Dieses Feld muss manuell im System als Ticket: "Datum / Uhrzeit" hinzugefügt werden und muss in Ticketerstellungsoberflächen und / oder in anderen Ticket-Aktionsoberflächen aktiviert werden.',
        'Define dynamic field name for start time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Definiert dynamische Feldnamen für die Startzeit. Dieses Feld muss manuell im System als Ticket: "Datum / Uhrzeit" hinzugefügt werden und muss in Ticketerstellungsoberflächen und / oder in anderen Ticket-Aktionsoberflächen aktiviert werden.',
        'Define the max depth of queues.' => 'Definiert die maximale Tiefe von Queues',
        'Define the queue comment 2.' => 'Definiert den 2. Queue-Kommentar',
        'Define the service comment 2.' => 'Lege den Servicekommentar 2 fest.',
        'Define the sla comment 2.' => 'Lege den SLA-Kommentar 2 fest.',
        'Define the start day of the week for the date picker for the indicated calendar.' =>
            'Definiert den Wochentag, mit dem die Woche im angegebenen Kalender beginnt.',
        'Define the start day of the week for the date picker.' => 'Definiert den Beginn einer Woche für den Datumswähler.',
        'Define which columns are shown in the linked tickets widget (LinkObject::ViewMode = "complex"). Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Definieren Sie, welche Spalten im verlinkte Tickets-Widget sichtbar sein sollen (LinkObject::ViewMode = "complex"). Hinweis: Nur Ticket-Attribute und dynamische Felder (DynamicField_NameX) sind als Standard-Spalten erlaubt. Mögliche Einstellungen: 0 = inaktiv, 1 = verfügbar, 2 = standardmäßig aktiv.',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Definiert einen Punkt, welcher ein LinedIn-Symbol am Endes der Kundeninformation hinzufügt.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Definiert einen Punkt, welcher ein XINGSymbol am Endes der Kundeninformation hinzufügt.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Definiert einen Punkt, welcher ein GoogleSymbol am Endes der Kundeninformation hinzufügt.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Definiert einen Punkt, welcher ein Google-Maps-Symbol am Endes der Kundeninformation hinzufügt.',
        'Defines a default list of words, that are ignored by the spell checker.' =>
            'Definiert eine Standardliste von Wörtern, die von der Rechtschreibprüfung ignoriert werden.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definiert einen Filter für die HTML-Ausgabe um Links hinter CVE-Nummern hinzufügen. Das Element Bild erlaubt zwei Eingabearten. Zum einem den Namen eines Bildes (Beispielsweise faq.png). In diesem Fall wird der OTRS-Bildpfad verwendet. Die zweite Möglichkeit ist, den Link zu dem Bild einzufügen.',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definiert einen Filter für die HTML-Ausgabe um Links hinter einer MSBulletin-Nummer hinzufügen. Das Element Bild erlaubt zwei Eingabearten. Zum einem den Namen eines Bildes (Beispielsweise faq.png). In diesem Fall wird der OTRS-Bildpfad verwendet. Die zweite Möglichkeit ist, den Link zu dem Bild einzufügen.',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definiert einen Filter für die HTML-Ausgabe um Links hinter einer bestimmten Zeichenfolge hinzufügen. Das Element Bild erlaubt zwei Eingabearten. Zum einem den Namen eines Bildes (Beispielsweise faq.png). In diesem Fall wird der OTRS-Bildpfad verwendet. Die zweite Möglichkeit ist, den Link zu dem Bild einzufügen.',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definiert einen Filter für die HTML-Ausgabe um Links hinter Bugtraq-Nummern hinzufügen. Das Element Bild erlaubt zwei Eingabearten. Zum einem den Namen eines Bildes (Beispielsweise faq.png). In diesem Fall wird der OTRS-Bildpfad verwendet. Die zweite Möglichkeit ist, den Link zu dem Bild einzufügen.',
        'Defines a filter to collect CVE numbers from article texts in AgentTicketZoom. The results will be displayed in a meta box next to the article. Fill in URLPreview if you would like to see a preview when moving your mouse cursor above the link element. This could be the same URL as in URL, but also an alternate one. Please note that some websites deny being displayed within an iframe (e.g. Google) and thus won\'t work with the preview mode.' =>
            'Definiert einen Filter zum Sammeln von CVE-Nummern von Artikel-Texten im AgentTicketZoom. Das Ergebnis wird in einer Meta-Box neben dem Artikel angezeigt. Füllen Sie URLPreview aus, wenn Sie beim halten des Cursors über dem Linkelement eine Vorschau sehen möchten. Das kann dieselbe URL wie in "URL", aber auch eine andere. Bitte beachten Sie, dass einige Webseiten es verbieten in einem iframe (z.B. Google) angezeigt zu werden. Diese würden mit dem Vorschau-Modus nicht funktionieren.',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            'Definiert einen Filter, um den Text in den Artikel zu verarbeiten, um vordefinierte Schlüsselwörter zu markieren.',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            'Definiert Regular-Expressions die einige Adressen von der Syntaxprüfung ausschließt (wenn "CheckEmailAddresses" auf \'"Ja" gesetzt ist). Bitte geben Sie in diesem Feld eine Regex für E-Mail-Adressen an, die syntaktisch nicht gültig, aber für das System (z.B.: "root@localhost") notwendig sind.',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            'Definiert einen regulären Ausdruck, der alle E-Mail-Adressen filtert, die in der Anwendung nicht verwendet werden sollen',
        'Defines a sleep time in microseconds between tickets while they are been processed by a job.' =>
            'Definiert einen Zeitraum in Mikrosekunden, der zwischen der Verarbeitung von Tickets abgewartet werden soll.',
        'Defines a useful module to load specific user options or to display news.' =>
            'Definiert ein nützliches Modul um bestimmte User-Optionen zu laden oder um Neuigkeiten anzuzeigen.',
        'Defines all the X-headers that should be scanned.' => 'Definiert alle X-Headers, die überprüft werden sollen.',
        'Defines all the languages that are available to the application. Specify only English names of languages here.' =>
            'Definiert alle Sprachen, die der Applikation zur Verfügung stehen. Geben Sie nur Englische Sprachnamen an.',
        'Defines all the languages that are available to the application. Specify only native names of languages here.' =>
            'Definiert alle Sprachen, die der Applikation zur Verfügung stehen. Geben Sie nur die einheimischen Sprachnamen an.',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            'Definiert alle Parameter für das Objekt RefreshTime in den Kundeneinstellungen des Kunden-Interface.',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            'Definiert alle Parameter für das Objekt ShownTickets in den Kundeneinstellungen des Kunden-Interface.',
        'Defines all the parameters for this item in the customer preferences.' =>
            'Definiert alle Parameter für Kunden-Einstellungen.',
        'Defines all the parameters for this item in the customer preferences. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control).' =>
            'Legt alle Parameter für diesen Eintrag in den Kunden-Einstellungen fest. \'PasswordRegExp\' erlaubt das prüfen von Passworten gegen einen regulären Ausdruck. Legen Sie Mindestlänge für Passworte mit \'PasswordMinSize\' fest. Legen Sie fest, ob das Passwort mindestens zwei Kleinbuchstaben und zwei Großbuchstaben enthalten muss, indem Sie die entsprechende Option auf \'1\' setzen. \'PasswordMin2Characters\' legt fest, ob mindestens zwei Buchstaben-Zeichen erforderlich sind. \'PasswordNeedDigit\' legt fest, ob das Passwort mindestens eine Zahl enthalten muss. ',
        'Defines all the parameters for this notification transport.' => 'Steuert alle Parameter für diesen Benachrichtigungs-Transport.',
        'Defines all the possible stats output formats.' => 'Definiert alle möglichen Statistikausgabeformate.',
        'Defines an alternate URL, where the login link refers to.' => 'Definiert eine alternative URL, auf die der Login-Link verweist.',
        'Defines an alternate URL, where the logout link refers to.' => 'Definiert eine alternative URL, auf die der Logout-Link verweist.',
        'Defines an alternate login URL for the customer panel..' => 'Definiert für die Kundenoberfläche eine alternative Anmelde-URL, auf die der Login-Link verweist.',
        'Defines an alternate logout URL for the customer panel.' => 'Definiert für die Kundenoberfläche eine alternative Abmelde-URL, auf die der Logout-Link verweist.',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').' =>
            'Definiert eine externen Verbindung zu einer Kundendatenbank (z.B.: \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').',
        'Defines from which ticket attributes the agent can select the result order.' =>
            'Definiert aus welchen Ticket-Attributen der Agent die Ergebnissortierung wählen kann.',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'Definiert, wie das "Von:"-Feld in den E-Mails (gesendet von Antworten und E-Mail-Tickets) aussehen soll.',
        'Defines if a pre-sorting by priority should be done in the queue view.' =>
            'Definiert ob in der Queue-Ansicht eine Vorsortierung anhand der Priorität vorgenommen werden soll.',
        'Defines if a pre-sorting by priority should be done in the service view.' =>
            'Bestimmt, ob in der Service-Ansicht eine Vorsortierung anhand der Priorität vorgenommen werden soll.',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the email outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if agents should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Steuert, ob Agenten, die die Zweifaktor-Authentifizierung nicht nutzen, sich im System einloggen dürfen.',
        'Defines if composed messages have to be spell checked in the agent interface.' =>
            'Bestimmt, ob im Agenten-Interface eine Rechtschreibprüfung für Nachrichten vorgenommen werden muss.',
        'Defines if customers should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Steuert, ob Kunden, die die Zweifaktor-Authentifizierung nicht nutzen, sich im System einloggen dürfen.',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.) in customer interface.' =>
            'Legt fest, ob im Kundenbereich der erweiterte Modus genutzt werden soll (erlaubt die Nutzung von Tabellen, Ersetzen, Hochstellen, Tiefstellen, Einfügen aus Word, usw.).',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.).' =>
            'Bestimmt, ob der erweiterte Modus genutzt werden soll (schaltet die Benutzung von Tabellen, Suchen & Ersetzen, Tiefstellen, Hochstellen, aus Word einfügen, etc. frei).',
        'Defines if the previously valid token should be accepted for authentication. This is slightly less secure but gives users 30 seconds more time to enter their one-time password.' =>
            'Steuert, ob das vorherige, gültige Token für die Authentifizierung akzeptiert werden soll. Dies ist etwas weniger sicher, gibt Nutzern aber 30 Sekunden mehr Zeit, Ihre Einmal-Passwort einzugeben.',
        'Defines if the values for filters should be retrieved from all available tickets. If set to "Yes", only values which are actually used in any ticket will be available for filtering. Please note: The list of customers will always be retrieved like this.' =>
            'Definiert, ob die Werte für Filter von allen verfügbaren Tickets abgerufen werden sollen. Wenn auf "Ja" gesetzt, stehen nur Werte, die aktuell in irgendeinem Ticket für die Filterung verwendet werden zur Verfügung. Bitte beachten Sie: Die Liste der Kunden wird immer auf diesem Wege abgerufen.',
        'Defines if time accounting is mandatory in the agent interface. If activated, a note must be entered for all ticket actions (no matter if the note itself is configured as active or is originally mandatory for the individual ticket action screen).' =>
            'Definiert ob die Zeiterfassung verpflichtend in der Agenten-Oberfläche ist. Wenn diese Funktion aktiviert ist, muss eine Notiz für alle Ticketaktionen (egal ob die Notiz als aktiv konfiguriert ist oder ursprünglich zwingend für die individuellen Ticket-Aktionen konfiguert wurde).',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            'Bestimmt, ob das Zeiterfassungs-Feld für alle Tickets im Stapelverarbeitungs-Bildschirm gesetzt werden soll.',
        'Defines out of office message template. Two string parameters (%s) available: end date and number of days left.' =>
            'Definiert "Nicht im Büro"-Nachrichten-Templates. Zwei String-Parameter (%s) stehen zur Verfügung: Enddatum und Anzahl der übrigen Tage.',
        'Defines queues that\'s tickets are used for displaying as calendar events.' =>
            'Bestimmt die Queues, deren Tickets für die Anzeige als Kalender-Ereignisse berücksichtigt werden sollen.',
        'Defines the HTTP hostname for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the OTRS Daemon).' =>
            'Legt den HTTP-Hostnamen fest, der für die Sammlung von Supportdaten über das freie Modul \'PublicSupportDataCollector\' genutzt wird (z. B. durch den OTRS-Daemon).',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            'Definiert die Regular Expressions für IPs für den Zugriff auf das lokale Repository. Sie müssen diese Einstellungen aktivieren um Zugang zu Ihrem lokalen Repository zu haben, ebenfalls muss das Paket package::RepositoryList auf dem Remote-Host installiert sein.',
        'Defines the URL CSS path.' => 'Definiert den URL-CSS-Pfad',
        'Defines the URL base path of icons, CSS and Java Script.' => 'Definiert den URL-Basispfad von Symbolen, CSS und JavaScript',
        'Defines the URL image path of icons for navigation.' => 'Definiert den URL-Bildpfad von Symbolen für die Navigation',
        'Defines the URL java script path.' => 'Definiert den URL-JavaScript-Pfad',
        'Defines the URL rich text editor path.' => 'Definiert den URL-RichTextEditor-Pfad.',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            'Definiert die Adresse eines dedizierten DNS-Server, wenn nötig, für "CheckMXRecord" Auflösungen.',
        'Defines the agent preferences key where the shared secret key is stored.' =>
            'Defininiert das Einstellungsfeld für Agenten, in dem der Share Secret-Key gespeichert wird.',
        'Defines the body text for notification mails sent to agents, about new password (after using this link the new password will be sent).' =>
            'Definiert den Text im Hauptteil für Benachrichtigungs-Emails, die wegen eines neuen Passworts an Agenten geschickt werden (nachdem dieser Link benutzt wird, wird das neue Passwort gesendet).',
        'Defines the body text for notification mails sent to agents, with token about new requested password (after using this link the new password will be sent).' =>
            'Definiert den Text im Hauptteil für Benachrichtigungs-Emails für Agenten, inklusive eines Tokens für die Passwortänderungsanfrage (nachdem dieser Link benutzt wird, wird das neue Passwort gesendet).',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            'Definiert den Text im Hauptteil für Benachrichtigungs-Emails, die wegen eines neuen Accounts an Kunden geschickt wird.',
        'Defines the body text for notification mails sent to customers, about new password (after using this link the new password will be sent).' =>
            'Definiert den Text im Hauptteil für Benachrichtigungs-Emails, die wegen eines neuen Passworts an Kunden geschickt wird (nachdem dieser Link benutzt wird, wird das neue Passwort gesendet).',
        'Defines the body text for notification mails sent to customers, with token about new requested password (after using this link the new password will be sent).' =>
            'Definiert den Text im Hauptteil für Benachrichtigungs-Emails für Kunden, inklusive eines Tokens für die Passwortänderungsanfrage (nachdem dieser Link benutzt wird, wird das neue Passwort gesendet).',
        'Defines the body text for rejected emails.' => 'Definiert den Body-Text für abgelehnte E-Mails.',
        'Defines the calendar width in percent. Default is 95%.' => 'Definiert die Kalenderbreite in Prozent. Standard ist 95%',
        'Defines the cluster node identifier. This is only used in cluster configurations where there is more than one OTRS frontend system. Note: only values from 1 to 99 are allowed.' =>
            'Definiert den Identifizierer für den Clusterknoten. Wird nur in Clusterkonfigurationen genutzt, in denen mehr als ein OTRS-Frontendsystem vorhanden ist. Hinweis: Es sind nur Werte von 1-99 erlaubt.',
        'Defines the column to store the keys for the preferences table.' =>
            'Definiert die Spalte um die Schlüssel in der Eigenschaften-Tabelle zu speichern',
        'Defines the config options for the autocompletion feature.' => 'Definiert die Konfigurationsoptionen für die Autovervollständigung.',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            'Definiert die Konfigurationsparamenter des Items, die in der Eigenschaftenanzeige angezeigt wird.',
        'Defines the config parameters of this item, to be shown in the preferences view. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control). \'PasswordMaxLoginFailed\' allows to set an agent to invalid-temporarily if max failed logins reached.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view. Take care to maintain the dictionaries installed in the system in the data section.' =>
            'Definiert die Konfigurationsparameter dieses Elements, die in der Einstellungsansicht dargestellt werden.',
        'Defines the connections for http/ftp, via a proxy.' => 'Definiert Verbindungen für HTTP/FTP über einen Proxy.',
        'Defines the customer preferences key where the shared secret key is stored.' =>
            'Defininiert das Einstellungsfeld für Kunden, in dem der Share Secret-Key gespeichert wird.',
        'Defines the date input format used in forms (option or input fields).' =>
            'Definiert das benutzte Datumseingabeformat in Formularen (Option für Eingabefelder).',
        'Defines the default CSS used in rich text editors.' => 'Definiert die genutzte Standard-CSS in RichText-Editoren.',
        'Defines the default auto response type of the article for this operation.' =>
            'Definiert den Standard-Auto-Antwort-Typ des Artikels für diese Operation.',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            'Definiert den Standard-Inhalt einer Notiz in der TicketFreeText-Oberfläche im Agenten-Interface.',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at http://otrs.github.io/doc/.' =>
            'Steuert das standardmäßig verwendete Theme (HTML) für das Frontend für Agenten und Kunden. Hinweis: Sie können Ihre eigenen Themes hinzufügen und verwenden (siehe http://otrs.github.io/doc/).',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            'Definiert die Standard-Frontend-Sprache. Die möglichen Werte werden durch die verfügbaren Sprachdateien auf dem System bestimmt (siehe nächste Einstellung).',
        'Defines the default history type in the customer interface.' => 'Definiert den Standard-Historientyp im Kunden-Interface.',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            'Definiert die standardmäßig eingestellte maximale Anzahl von Attributen für die x-Achse für die Zeitachse.',
        'Defines the default maximum number of statistics per page on the overview screen.' =>
            'Steuert die maximale Anzahl angezeigter Statistiken pro Seite in der Übersicht.',
        'Defines the default next state for a ticket after customer follow-up in the customer interface.' =>
            'Steuert den Folgestatus für Tickets, für die im Kundenbereich eine Kundennachfrage eingegangen ist.',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Schließen-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the default next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Stapelverarbeitungs-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Freitextfelder-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Notiz-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Besitzer-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Warten bis-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Prioritäts-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Verantwortlicher-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Umleiten-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Weiterleiten-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the default next state of a ticket after the message has been sent, in the email outbound screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, nachdem eine ausgehende E-Mail versendet wurde.',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, auf die ein Agent im Antworten-Bildschirm im Agenten-Interface geantwortet hat.',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Bestimmt die Vorbelegung des Textfeldes für Telefon-Tickets im Bildschirm für eingehende Anrufe im Agenten-Interface.',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Bestimmt die Vorbelegung des Textfeldes für Telefon-Tickets im Bildschirm für ausgehende Anrufe im Agenten-Interface.',
        'Defines the default priority of follow-up customer tickets in the ticket zoom screen in the customer interface.' =>
            'Steuert die Folgepriorität für Tickets, für die im Kundenbereich eine Kundennachfrage eingegangen ist.',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            'Definiert die Standard-Prioriät von neuen Kundentickets in der Kundenoberfläche.',
        'Defines the default priority of new tickets.' => 'Definiert die Standard-Priorität von neuen Tickets.',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            'Definiert die Standard-Queue von neuen Kundentickets in der Kundenoberfläche.',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            'Definiert die Standardauswahl in der Einfachauswahl für dynamische Objekte (Formular: genauere Spezifikation).',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            'Definiert die Standardauswahl im Drop-down-Menü für Berechtigungen (Formular: Allgemeine Angaben)',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            'Legt die Standardauswahl im Dropdown-Menü für das Statistik-Format (Form: Gemeinsame Spezifikation) fest. Bitte legen Sie die Formattaste fest (siehe Stats::Format).',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Bestimmt den Standard-Absendertyp für Telefon-Tickets in der Eingehende-Telefon-Tickets-Anzeige in der Agenten-Oberfläche.',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Bestimmt den Standard-Absendertp für Telefon-Tickets in der Ausgehende-Telefon-Tickets-Anzeige in der Agenten-Oberfläche.',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            'Bestimmt den Standard-Absendertp für Telefon-Tickets in der TicketZoom-Anzeige in der Agenten-Oberfläche.',
        'Defines the default shown ticket search attribute for ticket search screen (AllTickets/ArchivedTickets/NotArchivedTickets).' =>
            'Definiert das standardmäßig angezeigte Ticket-Such-Attribut für die Ticket-Suchmaske (AlleTickets/ArchivierteTickets/NichtArchivierteTickets).',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            'Definiert die standardmäßig angezeigten Ticketsuchattribute für die Ticketsuche.',
        'Defines the default shown ticket search attribute for ticket search screen. Example: "Key" must have the name of the Dynamic Field in this case \'X\', "Content" must have the value of the Dynamic Field depending on the Dynamic Field type,  Text: \'a text\', Dropdown: \'1\', Date/Time: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' and or \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.' =>
            'Definiert die Standard Suchattribute für die Ticketsuche Beispiel: "Key" muss den Namen des dynamischen Feldes haben, in diesem Fall \'X\', "Content" muss den Wert des dynamischen Feldes, abhängig vom Feldtyp, haben, Text: \'ein Text\', Dropdown: \'1\', Date/Time: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' and or \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.',
        'Defines the default sort criteria for all queues displayed in the queue view.' =>
            'Definiert die standardmäßig eingestellten Sortierkriterien für alle in der Queue-Ansicht angezeigten Queues.',
        'Defines the default sort criteria for all services displayed in the service view.' =>
            'Definiert die standardmäßig eingestellten Sortierkriterien für alle in der Service-Ansicht angezeigten Services.',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            'Definiert die standardmäßig eingestellten Sortierkriterien für alle in der Queue-Ansicht angezeigten Queues, nachdem nach Priorität sortiert wurde.',
        'Defines the default sort order for all services in the service view, after priority sort.' =>
            'Definiert die standardmäßig eingestellten Sortierkriterien für alle in der Service-Ansicht angezeigten Services, nachdem nach Priorität sortiert wurde.',
        'Defines the default spell checker dictionary.' => 'Definiert das Standard Rechtschreib-Wörterbuch',
        'Defines the default state of new customer tickets in the customer interface.' =>
            'Definiert den Standard-Status von neuen Kundentickets in der Kundenoberfläche.',
        'Defines the default state of new tickets.' => 'Definiert den Standard-Status von neuen Tickets.',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Telefon-Tickets in der Eingehende-Telefon-Tickets-Anzeige in der Agent-Oberfläche.',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Telefon-Tickets in der Ausgehende-Telefon-Tickets-Anzeige in der Agent-Oberfläche.',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff einer Notiz im Ticket-Freitext-Bildschirm des Agenten-Interfaces.',
        'Defines the default the number of seconds (from current time) to re-schedule a generic interface failed task.' =>
            'Definiert die Anzahl an Sekunden (ausgehend vom aktuellen Zeitpunkt), nach denen ein fehlgeschlagener Generic Interface-Task neu geplant werden soll.',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in einer Ticket-Suche im Kunden-Interface.',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in der Eskalations-Anzeige im Agent-Interface.',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in der Gesperrte-Tickets-Anzeige im Agent-Interface.',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in der Verantwortlicher-Anzeige im Agent-Interface.',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in der Status-Anzeige im Agent-Interface.',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in der Beobachten-Anzeige im Agent-Interface.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets des Ticket-Suchergebnis im Agent-Interface.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of this operation.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets im Ticket-Suchergebnis von dieser Operation.',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            'Definiert die Standardbenachrichtigung für umgeleitete Tickets für Kunden/Absender im Umleiten-Bildschirm des Agentenbereichs.',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Steuert den Ticketstatus, nachdem eine Notiz über den "Ausgehender Anruf"-Bildschirm im Agentenbereich hinzugefügt wurde.',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Steuert den Ticketstatus, nachdem eine Notiz über den "Ausgehender Anruf"-Bildschirm im Agentenbereich hinzugefügt wurde.',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung (nach der Sortierung nach Priorität) für die Eskalations-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung (nach der Sortierung nach Priorität) für die Status-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Verantwortlicher-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Gesperrt-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Suchergebnis-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Defines the default ticket order in the ticket search result of the this operation. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Suchergebnis-Ansicht dieser Operation. Auf: Älteste oben. Ab: Neuste oben.',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Beobachten-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Suchergebnis-Ansicht des Kundenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Schließen\'-Oberfläche im Agenten-Interface.',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Sammelaktion\'-Oberfläche im Agenten-Interface.',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Freie Felder\'-Oberfläche im Agenten-Interface.',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Notiz\'-Oberfläche im Agenten-Interface.',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Besitzer\'-Oberfläche im TicketZoom im Agenten-Interface.',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Warten\'-Oberfläche im TicketZoom im Agenten-Interface.',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Priorität\'-Oberfläche im TicketZoom im Agenten-Interface.',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Verantwortlicher\'-Oberfläche im TicketZoom im Agenten-Interface.',
        'Defines the default ticket type for new customer tickets in the customer interface.' =>
            'Definiert den Standard-Ticket-Typ für neue Kundentickets in der  Kundenoberfläche.',
        'Defines the default ticket type.' => 'Definiert den Standardtyp für ein Ticket.',
        'Defines the default type for article in the customer interface.' =>
            'Definiert den Standard-Typ für Artikel im Kunden-Interface.',
        'Defines the default type of forwarded message in the ticket forward screen of the agent interface.' =>
            'Steuert den Typ von weitergeleiteten Nachrichten im Weiterleiten-Bildschirm des Agentenbereichs.',
        'Defines the default type of the article for this operation.' => 'Definiert den Standard-Artikeltyp für diese Operation.',
        'Defines the default type of the message in the email outbound screen of the agent interface.' =>
            'Definiert den Standard-Typ der ausgehenden E-Mail.',
        'Defines the default type of the note in the close ticket screen of the agent interface.' =>
            'Definiert den Standard-Notiztyp in der \'Notiz\'-Oberfläche im Agenten-Interface.',
        'Defines the default type of the note in the ticket bulk screen of the agent interface.' =>
            'Definiert den Standard-Notiztyp in der \'Sammelaktion\'-Oberfläche im Agenten-Interface.',
        'Defines the default type of the note in the ticket free text screen of the agent interface.' =>
            'Definiert den Standard-Notiztyp in der \'Freie Felder\'-Oberfläche im Agenten-Interface.',
        'Defines the default type of the note in the ticket note screen of the agent interface.' =>
            'Definiert den Standard-Notiztyp in der \'Notiz\'-Oberfläche im Agenten-Interface.',
        'Defines the default type of the note in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Definiert den Standard-Notiztyp in der \'Besitzer\'-Oberfläche im TicketZoom im Agenten-Interface.',
        'Defines the default type of the note in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Definiert den Standard-Notiztyp in der \'Warten\'-Oberfläche im TicketZoom im Agenten-Interface.',
        'Defines the default type of the note in the ticket phone inbound screen of the agent interface.' =>
            'Definiert den Standard-Notiztyp in der \'eingehender Telefonanruf\'-Oberfläche im Agenten-Interface.',
        'Defines the default type of the note in the ticket phone outbound screen of the agent interface.' =>
            'Definiert den Standard-Notiztyp in der \'ausgehender Telefonanruf\'-Oberfläche im Agenten-Interface.',
        'Defines the default type of the note in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Definiert den Standard-Notiztyp in der \'Priorität\'-Oberfläche im TicketZoom im Agenten-Interface.',
        'Defines the default type of the note in the ticket responsible screen of the agent interface.' =>
            'Definiert den Standard-Notiztyp in der \'Verantwortlicher\'-Oberfläche im Agenten-Interface.',
        'Defines the default type of the note in the ticket zoom screen of the customer interface.' =>
            'Definiert den Standard-Notiztyp im TicketZoom im Kunden-Interface.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            'Definiert das standardmäßig genutzte Frontend-Modul im Agenten-Interface, wenn kein Action-Paramenter in der URL übergeben wurde.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            'Definiert das standardmäßig genutzte Frontend-Modul im Kunden-Interface, wenn kein Action-Paramenter in der URL übergeben wurde.',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            'Definiert den Standard-Wert für den Action-Paramenter im Public-Frontend. Der Action-Paramter wird in System-Skripten vewendet.',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            'Definiert die standardmäßigen sichtbaren Sendertypen eines Tickets (Standard: Kunde).',
        'Defines the dynamic fields that are used for displaying on calendar events.' =>
            'Definiert die dynamischen Felder, die benutzt werden um Kalender-Events anzuzeigen.',
        'Defines the fall-back path to open fetchmail binary. Note: The name of the binary needs to be \'fetchmail\', if it is different please use a symbolic link.' =>
            'Steuert den Fallback-Pfad zum Öffnen des fetchmail-Binaries. Hinweis: Der Name des Binaries muss "fetchmail" sein. Bitte nutzen Sie einen symbolischen Link, wenn der Name anders lautet.',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            'Definiert den Filter, der Text in Artikeln verarbeitet, um URLs zu highlighten.',
        'Defines the format of responses in the ticket compose screen of the agent interface ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] is only realname of From).' =>
            'Steuert das Format von Antworten im Ticket erstellen-Bildschirm im Agentenbereich ([% Data.OrigFrom | html %] entspricht genau dem Absender, [% Data.OrigFromName | html %] enthält nur den realen Namen des Absenders).',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Definiert den Full Qualified Domain Name des OTRS Systems. Diese Einstellung wird als Variable OTRS_CONFIG_FQDN genutzt, welche in allen Nachrichten-Formularen zu finden ist oder um Links zu Tickets in Ihrem OTRS System zu generieren.',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every user for these groups).' =>
            'Steuert die Gruppen, in denen sich ein Kundenbenutzer standardmäßig befinden soll (wenn CustomerGroupSupport aktiviert ist und Sie nicht jede Gruppenbeziehung für die Nutzer einzeln steuern möchten).',
        'Defines the height for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Definiert die Höhe der RichText-Editor Komponente. Geben Sie einen Zahlen- (Pixel) oder Prozenwert (relativ) an.',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Steuert die Höhe der Richtext-Editor-Komponente. Geben Sie eine Zahl (für die Höhe in Pixeln) oder einen prozentualen Wert (für eine relative Höhe) an.',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Steuert den Historien-Kommentar für die Ticket schließen-Aktion im Agentenbereich.',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Steuert den Historien-Kommentar für Emailtickets im Agentenbereich.',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Steuert den Historien-Kommentar für Telefonticket im Agentenbereich.',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            'Steuert den Historien-Kommentar für die Freitext-Aktion im Agentenbereich.',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Steuert den Historien-Kommentar für die Ticketnotiz-Aktion im Agentenbereich.',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Ticket-Besitzer" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Warten auf Erinnerung" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Eingehender Telefonanruf" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Ausgehender Telefonanruf" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Ticket Priorität" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Ticket-Verantwortlicher" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Warten auf Erinnerung" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            'Definiert den Verlauf-Kommentar für diese Operation, der für den Ticket-Verlauf in der Agenten-Schnittstelle verwendet wird.',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket Schließen" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Neues Email Ticket" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Neues Telefon Ticket" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket FreiText" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket Notiz" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket Besitzer" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Warten auf Erinnerung" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Eingehender Telefonanruf" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ausgehender Telefonanruf" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket Priorität" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket Verantwortlicher" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Definiert den Verlaufstyp für die Ticket-Zoom-Aktion, der für den Ticket-Verlauf in der Kundenschnittstelle verwendet wird.',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            'Definiert den Verlaufstyp für diese Operation, der für den Ticket-Verlauf in der Agenten-Schnittstelle verwendet wird.',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            'Definiert die Stunden und Wochentage des angegebenen Kalenders um die Arbeitszeit zu messen.',
        'Defines the hours and week days to count the working time.' => 'Definiert den Zeitraum und die Wochentage welche als Arbeitszeit zählen.',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            'Definiert den Schlüssel, der mit dem Modul Kernel::Modules::AgentInfo geprüft wird. Wenn dieser Nutzer-Einstellungs-Schlüssel "wahr" ist, wird die Nachricht vom System akzeptiert.',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            'Definiert den Schlüssel, der mit CustomerAccept geprüft wird. Wenn dieser Nutzer-Einstellungs-Schlüssel "wahr" ist, wird die Nachricht vom System akzeptiert.',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Definiert den Link-Typ \'Normal\'. Wenn der Name der Quelle dem des Ziels entspricht, ist der resultierende Link ein nicht-direktionaler Link; Ansonsten ist das Resultat ein direktionaler Link.',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Definiert den Link-Typ \'ParentChild\'. Wenn der Quell- und der Zielname den selben Wert beinhalten, ist der Link nicht-direktional. Ansonsten ist das Ergebnis ein direktionaler Link.',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            'Definition der verschiedenen Verknüpfungsmöglichkeiten. Verknüpfungstpyen der selben Gruppe schließen sich gegenseitig aus. Beispiel: Wenn Ticket A mit dem Typ \'Normal\' mit Ticket B verlinkt wird, dann können diese beiden Tickets nicht noch zusätzlich mit dem Typ \'ElternKind\' miteinander verlinkt werden.',
        'Defines the list of online repositories. Another installations can be used as repository, for example: Key="http://example.com/otrs/public.pl?Action=PublicRepository;File=" and Content="Some Name".' =>
            'Definiert eine Liste von Online-Quellen. Andere Installationen können als Quelle genutzt werden z.B. Key="http://example.com/otrs/public.pl?Action=PublicRepository;File=" and Content="Irgendein Name". ',
        'Defines the list of possible next actions on an error screen, a full path is required, then is possible to add external links if needed.' =>
            'Definiert die Liste der möglichen Folgeaktionen in einer Fehleranzeige. Mit einem vollständigen Pfad kann man bei Bedarf externe Links einfügen.',
        'Defines the list of types for templates.' => 'Definiert die Typenliste für Templates.',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            'Definiert die Adresse der Online-Repository-Liste für zusätzliche Pakete. Das erste verfügbare Ergebnis wird genutzt.',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            'Definiert das Log Module für das System. "Datei" schreibt alle Meldungen in das angegebene Logfile, "SysLog" nutzt den Syslog Daemon des Systems, z.B. syslogd.',
        'Defines the maximal size (in bytes) for file uploads via the browser. Warning: Setting this option to a value which is too low could cause many masks in your OTRS instance to stop working (probably any mask which takes input from the user).' =>
            'Definiert die maximale Größe (in Bytes) für das Hochladen von Dateien mit dem Browser. Achtung: Wenn man die Größe zu klein wählt können viele Eingabemasken in ihrer OTRS-Instanz nicht mehr funktionieren (vermutlich jede Maske die Benutzereingaben erwartet).',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            'Definiert die maximale Gültigkeitsdauer (in Sekunden) für eine Session-ID.',
        'Defines the maximum number of affected tickets per job.' => 'Definiert the maximale Anzahl der betroffenen Tickets pro Job',
        'Defines the maximum number of pages per PDF file.' => 'Bestimmt die maximale Anzahl an Seiten pro PDF-Datei.',
        'Defines the maximum number of quoted lines to be added to responses.' =>
            'Legt die maximale Anzahl an zitierten Zeilen fest, die zu Antworten hinzugefügt werden.',
        'Defines the maximum number of tasks to be executed as the same time.' =>
            'Definiert die maximale Anzahl gleichzeitig ausgeführter Tasks.',
        'Defines the maximum size (in MB) of the log file.' => 'Bestimmt die Maximalgröße (in MB) der Protokolldatei.',
        'Defines the maximum size in KiloByte of GenericInterface responses that get logged to the gi_debugger_entry_content table.' =>
            'Legt die maximale Größe von Antworten des GenericInterfaces fest, die in der gi_debugger_entry_content-Tabelle gespeichert werden (in Kilobyte).',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            'Legt das Modul fest, das eine generische Benachrichtigung im Agenten-Bereich anzeigt. Entweder wird "Text" (wenn konfiguriert), oder der Inhalt von "Datei" angezeigt.',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            'Definiert das Modul das alle zur Zeit angemeldeten Agenten im Agenten-Interface anzeigt.',
        'Defines the module that shows all the currently logged in customers in the agent interface.' =>
            '',
        'Defines the module that shows the currently logged in agents in the customer interface.' =>
            '',
        'Defines the module that shows the currently logged in customers in the customer interface.' =>
            '',
        'Defines the module to authenticate customers.' => 'Definiert das Modul um Kunden zu authentifizieren.',
        'Defines the module to display a notification if cloud services are disabled.' =>
            'Legt das Modul fest, das eine Benachrichtigung anzeigt, wenn Cloud-Services abgeschaltet sind.',
        'Defines the module to display a notification in different interfaces on different occasions for OTRS Business Solution™.' =>
            'Legt das Modul fest, das zu unterschiedlichen Gelegenheiten eine Benachrichtigung zur OTRS Business Solution™ anzeigt,',
        'Defines the module to display a notification in the agent interface if the OTRS Daemon is not running.' =>
            'Definiert das Modul, dass eine Benachrichtigung im Agentenbereich anzeigt, wenn der OTRS Daemon nicht läuft.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            'Definiert das Modul das eine Benachrichtigung im Agenten-Interface anzeigt, wenn ein Agent angemeldet ist, während er die "Out of Office"-Funktion aktiviert hat.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having system maintenance active.' =>
            'Definiert das Modul das eine Benachrichtigung im Agenten-Interface anzeigt, wenn ein Agent angemeldet ist, während die Systemwartung aktiv ist.',
        'Defines the module to display a notification in the agent interface, if the agent session limit prior warning is reached.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            'Legt das Modul fest, das eine Benachrichtigung im Agenten-Bereich anzeigt, wenn das System mit einem Admin-Benutzer genutzt wird (normalerweise sollte im System nicht als Admin-Benutzer gearbeitet werden).',
        'Defines the module to generate code for periodic page reloads.' =>
            'Definiert das Modul für die Code-Generierung beim periodischen Neuladen von Seiten.',
        'Defines the module to send emails. "Sendmail" directly uses the sendmail binary of your operating system. Any of the "SMTP" mechanisms use a specified (external) mailserver. "DoNotSendEmail" doesn\'t send emails and it is useful for test systems.' =>
            'Legt das Modul zum Versenden von E-Mails fest. "Sendmail" nutzt das Sendmail-Binary Ihres Betriebssystems. Jeder der SMTP-Mechanismen nutzt einen zu definierenden (externen) Mailserver. "DoNotSendEmail" versendet keine E-Mails und ist deshalb nützlich für Testsysteme.',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            'Definiert, welches Modul für das Speichern der Session Daten verwendet werden soll. Mit "DB" kann der Anzeige Server getrennt vom DB-Server betrieben werden. "FS" ist schneller.',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            'Definiert den Namen der Anwendung, die in der Weboberfläche, in Tabs und in der Titelleiste des Webbrowser angezeigt wird.',
        'Defines the name of the column to store the data in the preferences table.' =>
            'Definiert den Namen der Spalte, unter der Daten in der Eigenschaften-Tabelle gespeichert werden.',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            'Definiert den Namen der Spalte, unter der die Benutzer-Identifier in der Eigenschaften-Tabelle gespeichert werden.',
        'Defines the name of the indicated calendar.' => 'Definiert den Namen des angezeigten Kalenders.',
        'Defines the name of the key for customer sessions.' => 'Definiert den Namen des Schlüssels für die Kunden-Sessions.',
        'Defines the name of the session key. E.g. Session, SessionID or OTRS.' =>
            'Definiert den Namen des Session-Schlüssels. Zum Beispiel: Session, SessionID oder OTRS',
        'Defines the name of the table where the user preferences are stored.' =>
            'Legt den Namen der Tabelle fest, in der Benutzereinstellungen gespeichert werden.',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            'Definiert den nächsten möglichen Status nach Erstellen eines / Antworten auf ein Ticket im Verfassen-Bildschirm im Agenten-Interface.',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            'Legt die möglichen Folgestatus fest, die nach dem Weiterleiten eines Tickets im Weiterleiten-Bildschirm des Agenten-Bereichs gewählt werden können.',
        'Defines the next possible states after sending a message in the email outbound screen of the agent interface.' =>
            'Definiert die nächsten, auswählbaren Status, nachdem eine ausgehende Email versendet wurde.',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            'Definiert die nächsten möglichen Status für Tickets von Kunden in der Kunden-Oberfläche.',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz im "Ticket Schließen" Ansicht der Agenten-Oberfläche.',
        'Defines the next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz in der "Sammelaktion" Ansicht der Agenten-Oberfläche.',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz im "Ticket FreiText" Ansicht der Agenten-Oberfläche.',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz im "Ticket Notiz" Ansicht der Agenten-Oberfläche.',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz im "Ticket Besitzer" Ansicht der Agenten-Oberfläche.',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz in der "Warten auf Erinnerung" Ansicht der Agenten-Oberfläche.',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz in der "Ticket Priorität" Ansicht der Agenten-Oberfläche.',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz in der "Ticket Verantwortlicher" Ansicht der Agenten-Oberfläche.',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Legt den Folgestatus eines über den Umleiten-Bildschirm des Agenten-Bereichs umgeleiteten Tickets fest.',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem verschieben in eine andere Queue in der "Ticket Queue" Ansicht der Agenten-Oberfläche.',
        'Defines the number of character per line used in case an HTML article preview replacement on TemplateGenerator for EventNotifications.' =>
            'Legt die Anzahl von Zeichen pro Zeile für die Artikel-Vorschau-Ersetzung im TemplateGenerator für EventNotifications fest.',
        'Defines the number of days to keep the daemon log files.' => 'Definiert die Aufbewahrungszeit für die Daemon Log-Dateien in Tagen.',
        'Defines the number of header fields in frontend modules for add and update postmaster filters. It can be up to 99 fields.' =>
            'Legt die Anzahl von Header-Feldern in Frontend-Modulen für das Hinzufügen/Aktualisieren von Postmaster-Filtern fest. Bis zu 99 Felder möglich.',
        'Defines the parameters for the customer preferences table.' => 'Definiert die Parameter der Tabelle mit den Kunden-Einstellungen.',
        'Defines the parameters for the dashboard backend. "Cmd" is used to specify command with parameters. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Cmd" kann zum Festlegen von Kommandos mit Parametern genutzt werden. Mit "Group" kann der Zugriff auf ein Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" legt fest, ob das Plugin standardmäßig aktiv ist, oder ob der Nutzer es manuell einschalten muss. Über "CacheTTL" kann die Laufzeit des Caches für das Plugin festgelegt werden.',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            '',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Definiert das Passwort um die SOAP Schnittstelle anzusteuern (bin/cgi-bin/rpc.pl)',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von fett und kursiv gedruckter nichtproportionaler Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von fett und kursiv gedruckter proportionaler Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von fett gedruckter nichtproportionaler (monospace) Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von fett gedruckter proportionaler Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von kursiv gedruckter nichtproportionaler (monospace) Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von kursiv gedruckter proportionaler Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von nichtproportionaler (monospace) Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung proportionaler Schrift in PDF Dokumenten.',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.' =>
            'Legt den Pfad der angezeigten Info-Datei fest, die in Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt liegt.',
        'Defines the path to PGP binary.' => 'Bestimmt den Pfad zur PGP-Binärdatei.',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            'Legt den Pfad zum OpenSSL-Binary fest. Es benötigt möglicherweise ein HOME-Env ($ENV{HOME} = \'/var/lib/wwwrun\';).',
        'Defines the postmaster default queue.' => 'Definiert die Postmaster-Queue.',
        'Defines the priority in which the information is logged and presented.' =>
            'Definiert die Priorität in welcher die Information aufgezeichnet und präsentiert wird.',
        'Defines the recipient target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "System address" displays all system addresses) in the agent interface.' =>
            'Legt die Art des Empfängers für Telefon-Tickets und des Absenders für E-Mail-Tickets im Agenten-Bereich fest ("Queue" zeigt alle Queues, "System address" alle System-Adressen).',
        'Defines the recipient target of the tickets ("Queue" shows all queues, "SystemAddress" shows only the queues which are assigned to system addresses) in the customer interface.' =>
            'Legt die Art des Empfängers für Tickets im Kunden-Bereich fest ("Queue" zeigt alle Queues, "System address" nur die Queues, die System-Adressen zugewiesen sind).',
        'Defines the required permission to show a ticket in the escalation view of the agent interface.' =>
            'Definiert die benötigten Rechte, um ein Ticket in der Eskalationsansicht der Agenten-Oberfläche anzuzeigen.',
        'Defines the search limit for the stats.' => 'Definiert die maximalen Suchergebnisse für Statistiken.',
        'Defines the sender for rejected emails.' => 'Definiert die Absendeadresse für abgelehnte E-Mails.',
        'Defines the separator between the agents real name and the given queue email address.' =>
            'Definiert das Trennzeichen zwischen dem echten Namen des Agenten und der gegebenen E-Mailqueue Adresse. ',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            '',
        'Defines the standard size of PDF pages.' => 'Bestimmt die Standardgröße von PDF-Seiten.',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            'Definiert den Status eines geschlossenen Tickets, wenn ein Follow-Up eingeht.',
        'Defines the state of a ticket if it gets a follow-up.' => 'Definiert den Status eines Tickets, wenn ein Follow-Up eingeht.',
        'Defines the state type of the reminder for pending tickets.' => 'Definiert den Statusttyp des Reminders für Tickets die auf "Warten" gesetzt sind.',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            'Definiert den Betreff für Benachrichtigungs-Emails, die wegen eines neuen Passworts an Agenten geschickt werden. ',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            'Definiert den Betreff für Benachrichtigungs-Emails, die wegen eines neuen Accounts an Kunden geschickt wird.',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            'Definiert den Betreff für Benachrichtigungs-Emails, die wegen eines neuen Passworts an Kunden geschickt wird.',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            '',
        'Defines the subject for rejected emails.' => 'Bestimmt den Betreff von abgelehnten E-Mails.',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            'Definiert die E-Mail-Adresse des System-Administrators. Sie wird in den Fehleranzeigen des Programms angezeigt.',
        'Defines the system identifier. Every ticket number and http session string contains this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of OTRS).' =>
            'Definiert die System ID. Jede Ticketnummer und HTTP Sitzung enthält diese ID. Das stellt sicher, dass nur Tickets in das Ticketsystem aufgenommen werden, welche zum eigenen Ticketsystem gehören (nützlich, wenn zwischen zwei Instanzen von OTRS kommuniziert wird).',
        'Defines the target attribute in the link to external customer database. E.g. \'AsPopup PopupType_TicketAction\'.' =>
            '',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            '',
        'Defines the ticket fields that are going to be displayed calendar events. The "Key" defines the field or ticket attribute and the "Content" defines the display name.' =>
            '',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            '',
        'Defines the two-factor module to authenticate agents.' => 'Definiert das Modul für die Zwei-Faktor-Authentifizierung von Agenten.',
        'Defines the two-factor module to authenticate customers.' => 'Definiert das Modul für die Zwei-Faktor-Authentifizierung von Kunden.',
        'Defines the type of protocol, used by the web server, to serve the application. If https protocol will be used instead of plain http, it must be specified here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is only used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            '',
        'Defines the used character for plaintext email quotes in the ticket compose screen of the agent interface. If this is empty or inactive, original emails will not be quoted but appended to the response.' =>
            '',
        'Defines the user identifier for the customer panel.' => 'Definiert den Benutzer-Identifier für das Kunden-Interface.',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Definiert den Benutzernamen um auf die SOAP-Schnittstelle zuzugreifen (bin/cgi-bin/rpc.pl).',
        'Defines the valid state types for a ticket.' => 'Definiert die gültigen Statustypen für ein Ticket.',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/otrs.Console.pl Maint::Ticket::UnlockTimeout" can be used.' =>
            '',
        'Defines the viewable locks of a ticket. NOTE: When you change this setting, make sure to delete the cache in order to use the new value. Default: unlock, tmp_lock.' =>
            '',
        'Defines the width for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Definiert die Breite der RichText-Editor Komponente. Geben Sie einen Zahlen- (Pixel) oder Prozenwert (relativ) an.',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Definiert die Breite der RichText-Editor Komponente. Geben Sie einen Zahlen- (Pixel) oder Prozenwert (relativ) an.',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            'Gibt an, welche Artikel-Sendertypen in der Vorschau eines Tickets angezeigt werden sollen.',
        'Defines which items are available for \'Action\' in third level of the ACL structure.' =>
            'Definiert welche Begriffe für eine \'Aktion\' in der dritten Ebene einer ACL-Struktur verfügbar sind.',
        'Defines which items are available in first level of the ACL structure.' =>
            'Definiert welche Begriffe in der ersten Ebene einer ACL-Struktur verfügbar sind.',
        'Defines which items are available in second level of the ACL structure.' =>
            'Definiert welche Begriffe in der zweiten Ebene einer ACL-Struktur verfügbar sind.',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            'Definiert welcher Status automatisch gesetzt wird (Inhalt), nachdem die Wartenzeit eines Status (Schlüssel) erreicht wurde.',
        'Defines wich article type should be expanded when entering the overview. If nothing defined, latest article will be expanded.' =>
            'Gibt an, welcher Artikeltyp beim Öffnen der Übersichtsansicht aufgeklappt dargestellt werden soll. Wenn kein Typ angegeben ist, wird der neueste Artikel aufgeklappt dargestellt.',
        'Defines, which tickets of which ticket state types should not be listed in linked ticket lists.' =>
            'Definiert, dass Tickets mit den ausgewählten Tickets Status nicht bei den verknüpften Tickets angezeigt werden sollen.',
        'Delete expired cache from core modules.' => 'Löscht den abgelaufenen Cache der Kern Module',
        'Delete expired loader cache weekly (Sunday mornings).' => 'Löscht wöchentlich den abgelaufenen Loader Cache (Sonntag Morgen)',
        'Delete expired sessions.' => 'Löscht abgelaufene Benutzersitzungen.',
        'Deleted link to ticket "%s".' => 'Verknüpfung zu "%s" gelöscht.',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            'Löscht die Session, wenn die Session-ID mit einer ungültigen IP-Adresse benutzt wird.',
        'Deletes requested sessions if they have timed out.' => 'Löscht die angefragte Session, wenn ein Timeout vorliegt.',
        'Delivers extended debugging information in the frontend in case any AJAX errors occur, if enabled.' =>
            '',
        'Deploy and manage OTRS Business Solution™.' => 'Bereitstellung und Verwaltung der OTRS Business Solution ™.',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            '',
        'Determines if the statistics module may generate ticket lists.' =>
            'Definiert ob das Statistik-Modul Ticketlisten generieren kann',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            'Definiert den Nächstmöglichen Ticketstatus, nachdem ein neues E-Mailticket im Agenten-interface erstellt wurde.',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            'Definiert den Nächstmöglichen Ticketstatus, nachdem ein neues Telefonticket im Agenten-interface erstellt wurde.',
        'Determines the next possible ticket states, for process tickets in the agent interface.' =>
            'Definiert den Nächstmöglichen Ticketstatus für Prozesstickets im Agenten-Interface.',
        'Determines the next possible ticket states, for process tickets in the customer interface.' =>
            '',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            'Definiert den nächsten Bildschirm nach einem Kundenticket im Kunden-Interface.',
        'Determines the next screen after the follow-up screen of a zoomed ticket in the customer interface.' =>
            '',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return the last overview screen (e.g. search results, queueview, dashboard). TicketZoom will return to the TicketZoom.' =>
            'Bestimmt das nächste Fenster nach dem das Ticket verschoben ist. LastScreenOverview wechselt zur letzten Übersichtsseite. TicketZoom wechselt zur Ticket-Detailansicht.',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            'Definiert wie Verlinkte-Objekte angezeigt werden in TicketZoom-Masken.',
        'Determines which options will be valid of the recipient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            '',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            '',
        'Development' => 'Entwicklung',
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
            'Zeigt eine Warnung an und verhindert die Suche, wenn Stop-Wörter in der Volltextsuche eingegeben werden.',
        'Display settings to override defaults for Process Tickets.' => '',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            'Zeigt die bisher benötigte Zeit für einen Artikel in der TicketZoomView an.',
        'Dropdown' => 'Einfachauswahl',
        'Dutch stop words for fulltext index. These words will be removed from the search index.' =>
            'Niederländische Stoppwörter für den Volltext-Index. Diese Wörter werden vom Suchindex entfernt.',
        'Dynamic Fields Checkbox Backend GUI' => 'Dynamic Fields-Oberfläche für Checkboxen',
        'Dynamic Fields Date Time Backend GUI' => 'Dynamic Fields-Oberfläche für DatumZeit-Felder',
        'Dynamic Fields Drop-down Backend GUI' => 'Dynamic Fields-Oberfläche für Auswahlboxen',
        'Dynamic Fields GUI' => 'Dynamic Fields-Oberfläche',
        'Dynamic Fields Multiselect Backend GUI' => 'Dynamic Fields-Oberfläche für Mehrfachauswahlboxen',
        'Dynamic Fields Overview Limit' => 'Übersichtsbegrenzung der dynamischen Felder',
        'Dynamic Fields Text Backend GUI' => 'Dynamic Fields-Oberfläche für Textfelder',
        'Dynamic Fields used to export the search result in CSV format.' =>
            'Dynamic Fields welche beim Export des Suchergebnisses im CSV-Format auszugeben sind.',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key => My Group\', \'Content: Name_X, NameY\'.' =>
            '',
        'Dynamic fields limit per page for Dynamic Fields Overview' => '',
        'Dynamic fields options shown in the ticket message screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###DynamicField.' =>
            '',
        'Dynamic fields options shown in the ticket reply section in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Optionen zur Anzeige von dynamischen Felder in der "Ticket Antwort" Ansicht in der Agenten-Oberfläche. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the email outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Angezeigte DynamicFields in der Maske für ausgehende Emails. Mögliche Einstellungen: 0 = Deaktiviert, 1 = Aktiviert, 2 = Aktiviert und zwingend benötigt.',
        'Dynamic fields shown in the process widget in ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Dynamische Felder die in der "Ticket Zoom" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.',
        'Dynamic fields shown in the sidebar of the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Dynamische Felder die in der Seitenleiste in der "Ticket Zoom" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.',
        'Dynamic fields shown in the ticket close screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Ticket Schließen" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket compose screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Ticket Erstellen" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket email screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Neues Email Ticket" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket forward screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Ticket Weiterleiten" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket free text screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Ticket FreiText" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket medium format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Dynamische Felder die in der mittleren Ansicht "M" in der Ticket Übersicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.',
        'Dynamic fields shown in the ticket move screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Ticket Verschieben" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket note screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Ticket Notiz" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der Ticket Übersicht in der Kunden-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket owner screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Ticket Besitzer" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket pending screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Warten auf Erinnerung" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket phone inbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Eingehender Telefonanruf" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket phone outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Ausgehender Telefonanruf" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket phone screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Neues Telefon Ticket" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket preview format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Dynamische Felder die in der "Ticket FreiText" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.',
        'Dynamic fields shown in the ticket print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Dynamische Felder die in der "Ticket Drucken" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Dynamische Felder die in der "Ticket Drucken" Ansicht in der Kunden-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.',
        'Dynamic fields shown in the ticket priority screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Ticket Priorität" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket responsible screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Dynamische Felder die in der "Ticket Verantwortlicher" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und benötigt.',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Dynamische Felder die in der Ergebnisanzeige der "Ticket Suche" in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.',
        'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.' =>
            'Dynamische Felder die in der "Ticket Suche" Ansicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert, 2 = aktiviert und standardmäßig angezeigt.',
        'Dynamic fields shown in the ticket search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Dynamische Felder die in der "Ticket Suchen" Ansicht in der Kunden-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.',
        'Dynamic fields shown in the ticket small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Dynamische Felder die in der kleinen Ansicht "S" in der Ticket Übersicht in der Agenten-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = verfügbar, 2 = standardmäßig aktiviert.',
        'Dynamic fields shown in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Dynamische Felder die in der "Ticket Zoom" Ansicht in der Kunden-Oberfläche angezeigt werden. Mögliche Einstellungen: 0 = deaktiviert, 1 = aktiviert.',
        'DynamicField' => 'DynamicField',
        'DynamicField backend registration.' => 'Backend-Registrierung für dynamische Felder.',
        'DynamicField object registration.' => 'DynamischesFeld Objektregistrierung.',
        'E-Mail Outbound' => 'Ausgehende E-Mail',
        'Edit Customer Companies.' => 'Kundenfirmen bearbeiten.',
        'Edit Customer Users.' => 'Kundenbenutzer bearbeiten.',
        'Edit customer company' => 'Kundenunternehmen bearbeiten',
        'Email Addresses' => 'E-Mail-Adressen',
        'Email Outbound' => 'Ausgehende E-Mail',
        'Email sent to "%s".' => 'E-Mail versandt an "%s".',
        'Email sent to customer.' => 'E-Mail an Kunden versandt.',
        'Enable keep-alive connection header for SOAP responses.' => 'Keep-Alive-Verbindungsheader für SOAP-Responses aktivieren.',
        'Enabled filters.' => 'Filter aktiviert.',
        'Enables PGP support. When PGP support is enabled for signing and encrypting mail, it is HIGHLY recommended that the web server runs as the OTRS user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            'Aktiviert PGP-Support. Wenn PGP-Support für das signieren und verschlüsseln von Mails eingeschaltet ist, wird dringend empfohlen, den Webserver unter dem OTRS-Benutzer zu betreiben. Andernfalls werden Probleme mit den Berechtigungen auftreten, wenn auf das .gnupg-Verzeichnis zugegriffen wird.',
        'Enables S/MIME support.' => 'Aktiviert unterstützung für S/MIME.',
        'Enables customers to create their own accounts.' => 'Erlaubt Kunden, eigene Konten anzulegen.',
        'Enables fetch S/MIME from CustomerUser backend support.' => '',
        'Enables file upload in the package manager frontend.' => 'Erlaubt den Datei-Upload im Paket-Manager.',
        'Enables or disables the caching for templates. WARNING: Do NOT disable template caching for production environments for it will cause a massive performance drop! This setting should only be disabled for debugging reasons!' =>
            'Schaltet das Caching von Templates an oder aus. Warnung: Schalten Sie auf Produktivsystemen das Template-Caching nicht ab, da hierdurch massive Performance-Beeinträchtigungen auftreten werden. Diese Einstellung sollte nur zur Fehlerbehebung abgeschaltet werden.',
        'Enables or disables the debug mode over frontend interface.' => 'Aktiviert oder deaktiviert den Debug-Modus für das Frontend.',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            'Aktiviert oder deaktiviert das Ticket beobachten-Feature, das das beobachten von Tickets erlaubt, ohne der Besitzer oder Verantwortliche zu sein.',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            'Aktiviert den Performance-Log zum erfassen der Seiten-Antwortzeiten. Diese Einstellung beeinflusst die Gesamtperformance des Systems. Frontend::Module###AdminPerformanceLog muss aktiviert sein.',
        'Enables spell checker support.' => 'Aktiviert die Unterstützung für die Rechtschreibprüfung.',
        'Enables the minimal ticket counter size (if "Date" was selected as TicketNumberGenerator).' =>
            'Aktiviert die Minimalgröße für Ticketzähler (wenn "Datum" als TicketNumberGenerator ausgewählt ist).',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            'Aktiviert das Stapelverarbeitungs-Feature für das Agenten-Interface, das das gleichzeitige Bearbeiten von mehreren Tickets erlaubt.',
        'Enables ticket bulk action feature only for the listed groups.' =>
            'Aktiviert das Stapelverarbeitungs-Feature nur für die eingetragenen Gruppen.',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            'Aktiviert das Verantwortlicher-Feature, das das Verfolgen von Tickets erlaubt.',
        'Enables ticket watcher feature only for the listed groups.' => 'Aktiviert das Ticket beobachten-Feature nur für die eingetragenen Gruppen.',
        'English (Canada)' => 'Englisch (Kanada)',
        'English (United Kingdom)' => 'Englisch (Vereinigtes Königreich)',
        'English (United States)' => 'Englisch (Vereinigte Staaten)',
        'English stop words for fulltext index. These words will be removed from the search index.' =>
            'Englische Stopworte für den Volltext-Index. Diese Worte werden aus dem Index entfernt.',
        'Enroll process for this ticket' => 'Startet einen Prozess für dieses Ticket',
        'Enter your shared secret to enable two factor authentication.' =>
            'Geben Sie Ihr Shared Secret für die Zweifaktor-Authentifizierung ein.',
        'Escalation response time finished' => 'Eskalation "Antwortzeit" abgelaufen',
        'Escalation response time forewarned' => 'Eskalation "Antwortzeit" vorgewarnt',
        'Escalation response time in effect' => 'Eskalation "Antwortzeit" aktiv',
        'Escalation solution time finished' => 'Eskalation "Lösungszeit" abgelaufen',
        'Escalation solution time forewarned' => 'Eskalation "Lösungszeit" vorgewarnt',
        'Escalation solution time in effect' => 'Eskalation "Lösungszeit" aktiv',
        'Escalation update time finished' => 'Eskalation "Aktualisierungszeit" abgelaufen',
        'Escalation update time forewarned' => 'Eskalation "Aktualisierungszeit" vorgewarnt',
        'Escalation update time in effect' => 'Eskalation "Aktualisierungszeit" aktiv',
        'Escalation view' => 'Ansicht nach Eskalationen',
        'EscalationTime' => 'Eskalationszeit',
        'Estonian' => 'Estnisch',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate).' =>
            'Eventmodul-Registierung. Für höhere Performancen können Sie ein Trigger-Event definieren (z.B. Event => TicketCreate).',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            'Eventmodul-Registierung. Für höhere Performancen können Sie ein Trigger-Event definieren (z.B. Event => TicketCreate). Dies ist nur möglich, wenn alle dynamischen Ticketfelder das gleiche Event benötigen.',
        'Event module that performs an update statement on TicketIndex to rename the queue name there if needed and if StaticDB is actually used.' =>
            'Ereignismodul, das ein Update-Statement auf TicketIndex ausführt, um die Queue umzubenennen (wenn nötig und wenn StaticDB genutzt wird).',
        'Event module that updates customer user search profiles if login changes.' =>
            'Eventmodul, das Suchprofile von Kunden aktualisiert, wenn sich Loginnamen ändern.',
        'Event module that updates customer user service membership if login changes.' =>
            'Eventmodul, das Service-Zuordnungen von Kunden aktualisiert, wenn sich Loginnamen ändern.',
        'Event module that updates customer users after an update of the Customer.' =>
            'Ereignis-Modul, das Kundenbenutzer aktualisiert nach einem Update des Kunden.',
        'Event module that updates tickets after an update of the Customer User.' =>
            'Ereignis-Modul, das ein Ticket aktualisiert nach einem Update des Kundenbenutzers.',
        'Event module that updates tickets after an update of the Customer.' =>
            'Ereignis-Modul, das ein Ticket aktualisiert nach einem Update des Kunden.',
        'Events Ticket Calendar' => 'Ticket-Ereigniskalender',
        'Execute SQL statements.' => 'SQL-Befehle ausführen.',
        'Executes a custom command or module. Note: if module is used, function is required.' =>
            'Führt ein benutzerdefiniertes Kommando oder Modul aus. Hinweis: Wird ein Modul benutzt, muss eine Funktion vorhanden sein.',
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
        'Fetch emails via fetchmail (using SSL).' => 'Empfängt Emails durch Fetchmail (mit SSL).',
        'Fetch emails via fetchmail.' => 'Empfängt Emails durch Fetchmail.',
        'Fetch incoming emails from configured mail accounts.' => 'Empfängt eingehende Emails von konfigurierten Emailaccounts',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            'Lädt Pakete über einen Proxy herunter. Überschreibt "WebUserAgent::Proxy".',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.' =>
            'Datei, die im Modul Kernel::Modules::AgentInfo genutzt wird, wenn sie in Kernel/Output/HTML/Templates/Standard liegt.',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Filter zum Debuggen von ACLs. Hinweis: Weitere Ticket-Attribute können im Format <OTRS_TICKET_Attribute> (z. B. <OTRS_TICKET_Priority>) hinzugefügt werden.',
        'Filter for debugging Transitions. Note: More filters can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Filter zum Debuggen von Transitions. Hinweis: Weitere Filter können im Format <OTRS_TICKET_Attribute> (z. B. <OTRS_TICKET_Priority>) hinzugefügt werden.',
        'Filter incoming emails.' => 'Eingehende E-Mails filtern.',
        'Finnish' => 'Finnisch',
        'First Queue' => 'Erste Queue',
        'FirstLock' => 'Erstsperrzeit',
        'FirstResponse' => 'Erstantwortzeit',
        'FirstResponseDiffInMin' => 'Erstantwortzeitdifferenz in Minuten',
        'FirstResponseInMin' => 'Erstantwortzeit in Minuten',
        'Firstname Lastname' => 'Vorname Nachname',
        'Firstname Lastname (UserLogin)' => 'Vorname Nachname (BenutzerLogin)',
        'FollowUp for [%s]. %s' => 'FollowUp für [%s]. %s',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            'Erzwingt die Kodierung von ausgehenden E-Mails (7bit|8bit|quoted-printable|base64).',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            'Erzwingt das Setzen eines (vom aktuellen Status) abweichenden Ticket-Status nach dem Sperren eines Tickets. Legen Sie den aktuellen Status als Schlüssel und den neuen Status als Inhalt fest.',
        'Forces to unlock tickets after being moved to another queue.' =>
            'Tickets werden nach dem Verschieben in eine andere Queue entsperrt.',
        'Forwarded to "%s".' => 'Weitergeleitet an "%s".',
        'French' => 'Französisch',
        'French (Canada)' => 'Französisch (Kanada)',
        'French stop words for fulltext index. These words will be removed from the search index.' =>
            'Französische Stoppwörter für den Volltext-Index. Diese Wörter werden vom Suchindex entfernt.',
        'Frontend' => 'Oberfläche',
        'Frontend module registration (disable AgentTicketService link if Ticket Serivice feature is not used).' =>
            'Frontend-Modulregistrierung (AgentTicketService-Link entfernen wenn das Service-Feature nicht aktiv ist).',
        'Frontend module registration (disable company link if no company feature is used).' =>
            'Frontend-Modulregistrierung (Firmen-Link entfernen wenn das Firmen-Feature nicht aktiv ist).',
        'Frontend module registration (disable ticket processes screen if no process available) for Customer.' =>
            'Frontend-Modulregistrierung im Kunden-Interface (verberge Ticket-Prozesse, falls kein Prozess verfügbar ist).',
        'Frontend module registration (disable ticket processes screen if no process available).' =>
            'Frontend-Modulregistrierung (verberge Ticket-Prozesse, falls kein Prozess verfügbar ist).',
        'Frontend module registration for the agent interface.' => 'Frontend-Modulregistrierung im Agent-Interface.',
        'Frontend module registration for the customer interface.' => 'Frontend-Modulregistrierung für den Kundenbereich.',
        'Frontend theme' => 'Oberflächenachema',
        'Full value' => 'Vollständiger Wert',
        'Fulltext index regex filters to remove parts of the text.' => 'Volltextindex-Regex-Filter, um Textteile zu entfernen.',
        'Fulltext search' => 'Volltextsuche',
        'Galician' => 'Galizisch',
        'General ticket data shown in the ticket overviews (fall-back). Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note that TicketNumber can not be disabled, because it is necessary.' =>
            'Anzeige von allgemeinen Ticket-Daten in Ticket-Übersichten (Fallback). Mögliche Einstellungen: 0 = Deaktiviert, 1 = Verfügbar, 2 = Standardmäßig aktiviert. Beachten Sie, dass die Ticket-Nummer nicht abgeschaltet werden kann.',
        'Generate dashboard statistics.' => 'Übersichtsseitenstatistiken erzeugen.',
        'Generic Info module.' => 'Generisches Informationsmodul',
        'GenericAgent' => 'GenericAgent',
        'GenericInterface Debugger GUI' => 'Fehlerbehebungs-GUI für GenericInterface',
        'GenericInterface Invoker GUI' => 'Invoker-GUI für GenericInterface',
        'GenericInterface Operation GUI' => 'Operation-GUI für GenericInterface',
        'GenericInterface TransportHTTPREST GUI' => 'TransportHTTPREST-GUI für GenericInterface',
        'GenericInterface TransportHTTPSOAP GUI' => 'TransportHTTPSOAP-GUI für GenericInterface',
        'GenericInterface Web Service GUI' => 'GenericInterface Webservices Benutzeroberfläche',
        'GenericInterface Webservice History GUI' => 'GenericInterface Webservice Verlauf Benutzeroberfläche',
        'GenericInterface Webservice Mapping GUI' => 'Webservice Mapping-GUI für GenericInterface',
        'GenericInterface module registration for the invoker layer.' => 'Modulregistrierung für Invoker-Layer des GenericInterface',
        'GenericInterface module registration for the mapping layer.' => 'Modulregistrierung für Mapping-Layer des GenericInterface',
        'GenericInterface module registration for the operation layer.' =>
            'Modulregistrierung für Operation-Layer des GenericInterface',
        'GenericInterface module registration for the transport layer.' =>
            'Modulregistrierung für Transport-Layer des GenericInterface',
        'German' => 'Deutsch',
        'German stop words for fulltext index. These words will be removed from the search index.' =>
            'Deutsche Stoppwörter für den Volltext-Index. Diese Wörter werden von Suchindex entfernt.',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files.' =>
            'Möglichkeit zum Überschreiben des Trennzeichens für CSV-Dateien, definiert in den Übersetzungsdateien.',
        'Global Search Module.' => 'Globales Suchmodul.',
        'Go back' => 'Zurück',
        'Google Authenticator' => 'Google Authenticator',
        'Graph: Bar Chart' => 'Diagramm: Balken',
        'Graph: Line Chart' => 'Diagramm: Linien',
        'Graph: Stacked Area Chart' => 'Diagramm: Gestapelte Ebenen',
        'Greek' => 'Griechisch',
        'HTML Reference' => 'HTML-Referenz',
        'HTML Reference.' => 'HTML-Referenz.',
        'Hebrew' => 'Hebräisch',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). Runtime will do full-text searches on live data (it works fine for up to 50.000 tickets). StaticDB will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild".' =>
            'Hilft beim Erweitern Ihres Artikel-Volltext-Indexes (Von-, An-, Cc-, Betreffs- und Text-Suche). Runtime führt Volltext-Suchen auf Livedaten aus (performant bis 50.000 Tickets). StaticDB erstellt nach der Artikelerstellung einen Index aus den Artikeldaten, wodurch die Geschwindigkeit von Volltextsuchen um rund 50% steigt. Nutzen Sie "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild", um einen initialen Index zu erstellen.',
        'Hindi' => 'Hindi',
        'Hungarian' => 'Ungarisch',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, kann hier ein Datenbanktreiber definiert werden. Ansonsten wird der benötigte Treiber automatisch ermittelt.',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, kann hier ein Passwort zum Verbinden zur Datenbank hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, kann hier ein Benutzername zum Verbinden zur Datenbank hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, muss hier der DSN zum Verbinden zur Datenbank hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, muss hier der Name der Spalte, die das Kundenpasswort enthält, hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, the crypt type of passwords must be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, muss hier der Verschlüsselungstyp für Passwörter hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, muss hier der Name der Spalte, die CustomerKey enthält, hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, muss hier der Name der Tabelle, in der Kundendaten gespeichert werden sollen, hinterlegt werden.',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            'Wenn "DB" als SessionModule ausgewählt ist, muss hier der Name der Tabelle, in der Sitzungsdaten gespeichert werden sollen, hinterlegt werden.',
        'If "FS" was selected for SessionModule, a directory where the session data will be stored must be specified.' =>
            'Wenn "FS" als SessionModule ausgewählt ist, muss hier der Name des Verzeichnisses, in dem Sitzungsdaten gespeichert werden sollen, hinterlegt werden.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            'Wenn "HTTPBasicAuth" als Customer::AuthModule ausgewählt ist, kann hier ein regulärer Ausdruck definiert werden, um Teile von REMOTE_USER zu entfernen (z.B. für anhängende Domänen). Hinweis: $1 enthält den neuen Login-Namen.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            'Wenn "HTTPBasicAuth" als Customer::AuthModule ausgewählt ist, können Sie hier angeben, ob führende Teile von Benutzernamen (z.B. zur Umwandlung von Domänen wie "example_domain\user" zu "user").',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist und Sie einen Suffix zu jedem Kunden-Loginnamen hinzufügen möchten, können Sie dies hier festlegen (z.B. wenn "benutzername" im LDAP als "benutzername@domain" existiert).',
        'If "LDAP" was selected for Customer::AuthModule and special paramaters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist und spezielle Parameter für das Perl-Modul Net::LDAP benötigt werden, können Sie diese hier angeben. Nutzen Sie "perldoc Net::LDAP" für weitere Informationen zu den Parametern.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist und Ihre Nutzer nur anonymen Zugriff auf den LDAP-Baum haben, Sie die Daten aber durchsuchen möchten, können Sie dies mithilfe eines speziellen Users tun, dessen Passwort Sie hier angeben können.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist und Ihre Nutzer nur anonymen Zugriff auf den LDAP-Baum haben, Sie die Daten aber durchsuchen möchten, können Sie dies mithilfe eines speziellen Users tun, dessen Benutzernamen Sie hier angeben können.',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, muss das BaseDN hier angegeben werden.',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, kann der LDAP-Host hier angegeben werden.',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, muss der User-Identifier hier angegeben werden.',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, können hier Benutzer-Attribute spezifiziert werden. Nutzen Sie UID für LDAP-posixGroups, den vollen Benutzer-DN für nicht-LDAP-posixGroups.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, können hier Zugangs-Attribute bestimmt werden.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, können Sie hier festlegen, ob Anwendungen stoppen sollen, wenn z.B. die Verbindung zum Server aufgrund von Netzwerkproblemen nicht hergestellt werden kann.',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use OTRS. Specify the group, who may access the system.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, können Sie prüfen, ob der Benutzer aufgrund seiner Mitgliedschaft in einer posixGroup Authentifizierungsberechtigt (z.B. wenn ein Nutzer Mitglied der Gruppe xyz sein muss, um OTRS nutzen zu dürfen). Legen Sie diese Gruppe hier fest.',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, können Sie hier Filter für jede LDAP-Anfrage festlegen, z.B. (mail=*), (objectclass=user) oder (!objectclass=computer).',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            'Wenn "Radius" als Customer::AuthModule ausgewählt ist, muss hier das Passwort zur Authentifizierung beim Radius-Host hinterlegt werden.',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            'Wenn "Radius" als Customer::AuthModule ausgewählt ist, muss hier der Radius-Host hinterlegt werden.',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Wenn "Radius" als Customer::AuthModule ausgewählt ist, können Sie hier festlegen, ob Anwendungen stoppen sollen, wenn z.B. die Verbindung zum Server aufgrund von Netzwerkproblemen nicht hergestellt werden kann.',
        'If "Sendmail" was selected as SendmailModule, the location of the sendmail binary and the needed options must be specified.' =>
            'Wenn "Sendmail" als als SendmailModule konfiguriert wurde, müssen hier der Pfad zum Sendmail-binary und die benötigten Optionen hinterlegt werden.',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            'Wenn "SysLog" als LogModule konfiguriert wurde, kann hier eine eigene Kategorie (facility) festgelegt werden.',
        'If "SysLog" was selected for LogModule, a special log sock can be specified (on solaris you may need to use \'stream\').' =>
            'Wenn "SysLog" als LogModule konfiguriert wurde, kann hier ein spezieller Log-Sock festgelegt werden (unter Solaris sollten Sie möglicherweise "stream" verwenden).',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            'Wenn "SysLog" als LogModule konfiguriert wurde, kann hier der Zeichensatz, der für das Logging verwendet werden soll, festgelegt werden.',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            'Wenn "Datei" als LogModule konfiguriert wurde, muss hier eine Log-Datei hinterlegt werden. Existiert die Datei nicht, wird sie automatisch vom System erstellt.',
        'If active, none of the regular expressions may match the user\'s email address to allow registration.' =>
            'Wenn aktiviert, darf keiner der hier definierten regulären Ausdrücke auf die E-Mail-Adresse des Benutzers, der sich registrieren möchte, matchen.',
        'If active, one of the regular expressions has to match the user\'s email address to allow registration.' =>
            'Wenn aktiviert, muss mindestens einer der hier definierten regulären Ausdrücke auf die E-Mail-Adresse des Benutzers, der sich registrieren möchte, matchen.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            'Wenn einer der SMTP-Mechanismen als SendmailModule ausgewählt wurde und der Server eine Authentifizierung benötigt, muss hier ein Passwort angegeben werden.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            'Wenn einer der SMTP-Mechanismen als SendmailModule ausgewählt wurde und der Server eine Authentifizierung benötigt, muss hier ein Benutzername angegeben werden.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            'Wenn einer der SMTP-Mechanismen als SendmailModule ausgewählt wurde, muss hier der Mailhost, der die Mails versendet, angegeben werden.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            'Wenn einer der SMTP-Mechanismen als SendmailModule ausgewählt wurde, muss hier der Port, auf dem Ihr Mailserver auf eingehende Verbindungen lauscht, angegeben werden.',
        'If enabled debugging information for ACLs is logged.' => 'Wenn aktiviert, werden Informationen zur Fehlerbehebung für ACLs geloggt.',
        'If enabled debugging information for transitions is logged.' => 'Wenn aktiviert, werden Informationen zur Fehlerbehebung für Transitions in Prozesstickets geloggt.',
        'If enabled the daemon will redirect the standard error stream to a log file.' =>
            'Aktivieren um die Fehler-Ausgabe des Daemons in eine Log-Datei umzuleiten.',
        'If enabled the daemon will redirect the standard output stream to a log file.' =>
            'Aktivieren um die Standard-Ausgabe des Daemons in eine Log-Datei umzuleiten.',
        'If enabled, OTRS will deliver all CSS files in minified form. WARNING: If you turn this off, there will likely be problems in IE 7, because it cannot load more than 32 CSS files.' =>
            'Wenn akiviert, liefert OTRS alle CSS-Dateien in minifizierter Form aus. WARNUNG: Das Abschalten dieser Einstellung wird im IE 7 wahrscheinlich Probleme verursachen, weil dieser Browser nicht mehr als 32 CSS-Dateien für eine Seite laden kann.',
        'If enabled, OTRS will deliver all JavaScript files in minified form.' =>
            'Wenn aktiviert, liefert OTRS JavaScript-Dateien in minifizierter Form aus.',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            'Wenn aktiviert, werden TicketPhone und TicketEmail in neuen Fenstern geöffnet.',
        'If enabled, the OTRS version tag will be removed from the Webinterface, the HTTP headers and the X-Headers of outgoing mails. NOTE: If you change this option, please make sure to delete the cache.' =>
            '',
        'If enabled, the customer can search for tickets in all services (regardless what services are assigned to the customer).' =>
            'Wenn aktiviert, können Kunden nach Tickets mit allen Services suchen (unabhängig davon, welche Services dem jeweiligen Kunden zugewiesen sind).',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            'Wenn diese Option aktiviert ist, werden die verschiedenen Übersichtsseiten (Dashboard, LockedView, Queue-Ansicht) automatisch nach der angegebenen Zeit aktualisiert.',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            'Wenn aktiviert, öffnet sich die erste Ebene des Hauptmenüs beim schon beim Überfahren der Maus (anstelle nur beim Klick).',
        'If no SendmailNotificationEnvelopeFrom is specified, this setting makes it possible to use the email\'s from address instead of an empty envelope sender (required in certain mail server configurations).' =>
            '',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty (unless SendmailNotificationEnvelopeFrom::FallbackToEmailFrom is set).' =>
            '',
        'If set, this address is used as envelope sender in outgoing messages (not notifications - see below). If no address is specified, the envelope sender is equal to queue e-mail address.' =>
            'Wenn gesetzt, wird diese Adresse als Envelope-Sender-Header in ausgehenden Nachrichten (nicht Benachrichtigungen, siehe unten) genutzt. Ist keine Adresse angegeben, entspricht der Envelope-Sender der an der Queue hinterlegten E-Mail-Adresse.',
        'If this option is enabled, then the decrypted data will be stored in the database if they are displayed in AgentTicketZoom.' =>
            'Wenn diese Option aktiviert ist, werden die entschlüsselten Daten in der Datenbank gespeichert, wenn Sie beim ersten Aufruf des Artikels in AgentTicketZoom angezeigt werden.',
        'If this option is set to \'Yes\', tickets created via the web interface, via Customers or Agents, will receive an autoresponse if configured. If this option is set to \'No\', no autoresponses will be sent.' =>
            'Wenn für diese Einstellungen "Ja" gesetzt ist, werden für Tickets, die von Agenten oder Kunden über die Web-Oberfläche erstellt werden, automatische Antworten versandt (wenn vorhanden).',
        'If this regex matches, no message will be send by the autoresponder.' =>
            'Wenn dieser reguläre Ausdruck zutrifft, wird durch den Autoresponder keine Nachricht versendet.',
        'If this setting is active, local modifications will not be highlighted as errors in the package manager and support data collector.' =>
            'Wenn die Einstellung aktiv ist, werden lokale Änderungen nicht als Fehler in der Supportdaten-Analyse angezeigt.',
        'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.' =>
            '',
        'Ignore system sender article types (e. g. auto responses or email notifications) to be flagged as \'Unread Article\' in AgentTicketZoom or expanded automatically in Large view screens.' =>
            '',
        'Include tickets of subqueues per default when selecting a queue.' =>
            'Tickets von Unterqueues automatisch mit einschließen, wenn eine Queue ausgewählt wird.',
        'Include unknown customers in ticket filter.' => 'Unbekannte Kunden in Ticketfiltern mit einschließen.',
        'Includes article create times in the ticket search of the agent interface.' =>
            'Schließt Artikel-Erstellzeiten in die Ticketsuche im Agentenbereich mit ein.',
        'Incoming Phone Call.' => 'Eingehender Telefonanruf.',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the command "bin/otrs.Console.pl Maint::Ticket::QueueIndexRebuild" for initial index creation.' =>
            '',
        'Indonesian' => 'Indonesisch',
        'Input' => 'Eingabe',
        'Install ispell or aspell on the system, if you want to use a spell checker. Please specify the path to the aspell or ispell binary on your operating system.' =>
            '',
        'Interface language' => 'Sprache Benutzeroberfläche',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Es ist möglich, verschiedene Skins zu konfigurieren, zum Beispiel um zwischen verschiedenen Agenten auf Basis der jeweiligen Domain zu unterscheiden. Sie können durch Nutzung von regulären Ausdrücken mithilfe von Schlüssel-/Wert-Paaren auf Domains prüfen. Der Inhalt von "Schlüssel" sollte die Prüfung auf die Domain beinhalten, der Inhalt von "Wert" den Namen des zu selektierenden Skins für diese Domain. Bitte beachten Sie die Einträge mit Beispielen für korrekte reguläre Ausdrücke.',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Es ist möglich, verschiedene Skins zu konfigurieren, zum Beispiel um zwischen verschiedenen Kunden auf Basis der jeweiligen Domain zu unterscheiden. Sie können durch Nutzung von regulären Ausdrücken mithilfe von Schlüssel-/Wert-Paaren auf Domains prüfen. Der Inhalt von "Schlüssel" sollte die Prüfung auf die Domain beinhalten, der Inhalt von "Wert" den Namen des zu selektierenden Skins für diese Domain. Bitte beachten Sie die Einträge mit Beispielen für korrekte reguläre Ausdrücke.',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            'Es ist möglich, verschiedene Themes zu konfigurieren, zum Beispiel um zwischen verschiedenen Agenten und Kunden auf Basis der jeweiligen Domain zu unterscheiden. Sie können durch Nutzung von regulären Ausdrücken mithilfe von Schlüssel-/Wert-Paaren auf Domains prüfen. Der Inhalt von "Schlüssel" sollte die Prüfung auf die Domain beinhalten, der Inhalt von "Wert" den Namen des zu selektierenden Themes für diese Domain. Bitte beachten Sie die Einträge mit Beispielen für korrekte reguläre Ausdrücke.',
        'Italian' => 'Italienisch',
        'Italian stop words for fulltext index. These words will be removed from the search index.' =>
            'Italienische Stoppwörter für den Volltext-Index. Diese Wörter werden von Suchindex entfernt.',
        'Ivory' => 'Elfenbein',
        'Ivory (Slim)' => 'Elfenbein (Schlank)',
        'Japanese' => 'Japanisch',
        'JavaScript function for the search frontend.' => 'JavaScript-Funktion für das Suche-Frontend.',
        'Last customer subject' => 'Letzter Kunden-Betreff',
        'Lastname Firstname' => 'Nachname Vorname',
        'Lastname Firstname (UserLogin)' => 'Nachname Vorname (BenutzerAnmeldung)',
        'Lastname, Firstname' => 'Nachname, Vorname',
        'Lastname, Firstname (UserLogin)' => 'Nachname, Vorname (BenutzerLogin)',
        'Latvian' => 'Lettisch',
        'Left' => 'Links',
        'Link Object' => 'Verknüpfe Objekt',
        'Link Object.' => 'Link-Objekt.',
        'Link agents to groups.' => 'Agenten zu Gruppen zuordnen.',
        'Link agents to roles.' => 'Agenten zu Rollen zuordnen.',
        'Link attachments to templates.' => 'Anhänge zu Vorlagen zuordnen.',
        'Link customer user to groups.' => 'Kundenbenutzer zu Gruppen zuordnen.',
        'Link customer user to services.' => 'Kundenbenutzer zu Services zuordnen.',
        'Link queues to auto responses.' => 'Automatische Antworten zu Queues zuordnen.',
        'Link roles to groups.' => 'Rollen zu Gruppen zuordnen.',
        'Link templates to queues.' => 'Vorlagen zu Queues zuordnen.',
        'Links 2 tickets with a "Normal" type link.' => 'Verknüpft 2 Tickets mit dem Linktyp "Normal".',
        'Links 2 tickets with a "ParentChild" type link.' => 'Verknüpft 2 Tickets mit dem Linktyp "Eltern-Kind".',
        'List of CSS files to always be loaded for the agent interface.' =>
            'Liste der CSS-Dateien, die immer im Agenten-Interface geladen werden sollen.',
        'List of CSS files to always be loaded for the customer interface.' =>
            'Liste der CSS-Dateien, die immer im Kunden-Interface geladen werden sollen.',
        'List of JS files to always be loaded for the agent interface.' =>
            'Liste der JavaScript-Dateien, die immer im Agenten-Interface geladen werden sollen.',
        'List of JS files to always be loaded for the customer interface.' =>
            'Liste der JavaScript-Dateien, die immer im Kunden-Interface geladen werden sollen.',
        'List of all CustomerCompany events to be displayed in the GUI.' =>
            'Liste aller Kundenereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of all CustomerUser events to be displayed in the GUI.' => 'Liste aller Kundenbenutzerereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of all DynamicField events to be displayed in the GUI.' => 'Liste aller DynamischesFeld-Ereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of all Package events to be displayed in the GUI.' => 'Liste aller Paket-Ereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of all article events to be displayed in the GUI.' => 'Liste aller Artikel-Ereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of all queue events to be displayed in the GUI.' => 'Liste alle Queue-Ereignisse, die im GUI angezeigt werden.',
        'List of all ticket events to be displayed in the GUI.' => 'Liste aller Ticket-Ereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of default Standard Templates which are assigned automatically to new Queues upon creation.' =>
            'Liste der Standardvorlagen, welche neuen Queues nach Erstellung automatisch zugeordnet werden.',
        'List of responsive CSS files to always be loaded for the agent interface.' =>
            'Liste von Responsive-CSS-Dateien, die im Agenten-Bereich immer geladen werden sollen.',
        'List of responsive CSS files to always be loaded for the customer interface.' =>
            'Liste von Responsive-CSS-Dateien, die im Kunden-Bereich immer geladen werden sollen.',
        'List view' => 'Listenansicht',
        'Lithuanian' => 'Litauisch',
        'Lock / unlock this ticket' => 'Sperrt / Entsperrt dieses Ticket.',
        'Locked Tickets.' => 'Gesperrte Tickets.',
        'Locked ticket.' => 'Ticket gesperrt.',
        'Log file for the ticket counter.' => 'Log-Datei für den Ticket-Counter.',
        'Logout of customer panel.' => 'Abmelden vom Kunden-Bereich',
        'Loop-Protection! No auto-response sent to "%s".' => 'Loop-Protection! Keine Auto-Antwort versandt an "%s".',
        'Mail Accounts' => 'E-Mailkonten',
        'Main menu registration.' => 'Hauptmenü-Registrierung.',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            'Überprüft vor dem Senden einer E-Mail oder vor dem übermitteln eines Telefon-Tickets, den MX-Eintrag der E-Mailadresse.',
        'Makes the application check the syntax of email addresses.' => 'Überprüft die Syntax der E-Mailadressen.',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            'Benutzt für das Session-Management HTML-Cookies. Wenn HTML-Cookies deaktiviert sind oder im Browser HTML-Cookies deaktiviert sind, arbeitet das System wie immer und fügt die Session-ID and Links an.',
        'Malay' => 'Malaysisch',
        'Manage OTRS Group cloud services.' => 'Verwaltet die Cloud-Services der OTRS Gruppe.',
        'Manage PGP keys for email encryption.' => 'PGP-Schlüssel für E-Mail-Verschlüsselung verwalten.',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'POP3- oder IMAP-Konten für das Abholen von E-Mail verwalten.',
        'Manage S/MIME certificates for email encryption.' => 'S/MIME-Zertifikate für E-Mail-Verschlüsselung verwalten.',
        'Manage existing sessions.' => 'Sitzungen verwalten.',
        'Manage support data.' => 'Verwaltet die Supportdaten.',
        'Manage system registration.' => 'Systemregistrierung verwalten.',
        'Manage tasks triggered by event or time based execution.' => 'Verwaltung von event- oder zeitbasierten Aufgaben.',
        'Mark this ticket as junk!' => 'Dieses Ticket als Junk markieren!',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            'Maximale Größe (Buchstaben) der Kundeninformationen (Telefon und E-Mail) in der Erfassungs-Oberfläche.',
        'Max size (in rows) of the informed agents box in the agent interface.' =>
            'Maximale Größe (in Reihen) des "Informiere Agenten" Kästchen im Agenten-Interface.',
        'Max size (in rows) of the involved agents box in the agent interface.' =>
            'Maximale Größe (in Reihen) des "Beteiligte Agenten" Kästchen im Agenten-Interface.',
        'Max size of the subjects in an email reply and in some overview screens.' =>
            'Maximale Länge des Betreffs in einer E-Mail-Antwort und in einigen Übersichts-Bildschirmen.',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            'Maximale Anzahl von automatischen E-Mailantworten zur eigenen E-Mailadresse pro Tag (Loop-Protection)',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            'Maximale Größe in KBytes für E-Mails die via POP3/POP3S/IMAP/IMAPS empfangen werden (in KBytes).',
        'Maximum Number of a calendar shown in a dropdown.' => 'Maximale Anzahl an Kalendern, die in Auswahlmenüs angezeigt werden.',
        'Maximum length (in characters) of the dynamic field in the article of the ticket zoom view.' =>
            'Maximale Länge (Buchstaben) von dynamischen Felder von Artikeln in der TicketZoom-Übersicht.',
        'Maximum length (in characters) of the dynamic field in the sidebar of the ticket zoom view.' =>
            'Maximale Länge (Buchstaben) von dynamischen Felder in der Seitenleiste in der TicketZoom-Übersicht.',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            'Maximale Anzahl von Tickets, die im Suchergebnis des Agenten-Interfaces angezeigt werden sollen.',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            'Maximale Anzahl von Tickets, die im Suchergebnis des Kunden-Interfaces angezeigt werden sollen.',
        'Maximum number of tickets to be displayed in the result of this operation.' =>
            'Maximale Anzahl von Tickets, die als Ergebnis dieser Aktion angezeigt werden sollen. ',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            'Maximale Zeichenanzahl für die Tabelle mit Kundeninformationen in der TicketZoom-Ansicht.',
        'Merge this ticket and all articles into a another ticket' => 'Dieses Ticket und alle Artikel in ein anderes Ticket zusammenfassen.',
        'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.' => 'Ticket <OTRS_TICKET> wurde mit <OTRS_MERGE_TO_TICKET> zusammengefasst.',
        'Miscellaneous' => 'Verschiedenes',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            'Modul für die "An"-Auswahl im Ticket Erstellen-Bildschirm im Kundenbereich.',
        'Module to check if arrived emails should be marked as email-internal (because of original forwarded internal email). ArticleType and SenderType define the values for the arrived email/article.' =>
            'Modul zur Prüfung, ob eingegangene E-Mails aufgrund einer vorher weitergeleiteten internen E-Mail als email-internal gekennzeichnet werden sollen. Über ArtikelType und SenderType werden die Werte für die eingegangene E-Mail/den eingegangenen Artikel festgelegt.',
        'Module to check the group permissions for customer access to tickets.' =>
            'Modul zur Prüfung von Gruppen-Berechtigungen für den Zugriff von Kunden auf Tickets.',
        'Module to check the group permissions for the access to tickets.' =>
            'Modul zur Prüfung von Gruppen-Berechtigungen für den Zugriff auf Tickets.',
        'Module to compose signed messages (PGP or S/MIME).' => 'Modul um signierte Nachrichten zu verfassen (PGP oder S/MIME).',
        'Module to crypt composed messages (PGP or S/MIME).' => 'Modul um verschlüsselte Nachrichten zu verassen (PGP oder S/MIME).',
        'Module to fetch customer users SMIME certificates of incoming messages.' =>
            'Modul zum Ermitteln von SMIME-Zertifikaten des Kundenbenutzers bei eingehenden Nachrichten.',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            'Modul zum filtern und bearbeiten von eingehenden Nachrichten. Blockiere/Ignoriere alle Nachrichten mit einer noreply@ Absender-Adresse.',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            '',
        'Module to filter encrypted bodies of incoming messages.' => 'Modul zum Filtern von verschlüsselten Texten bei eingehenden Nachrichten.',
        'Module to generate accounted time ticket statistics.' => 'Modul zur Generierung von Statistiken  für die benötigte Bearbeitungszeit.',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            'Modul zum Generieren eines HTML-OpenSearch-Profils für die Ticket-Schnellsuche im Agentenbereich.',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            'Modul zum Generieren eines HTML-OpenSearch-Profils für die Ticket-Schnellsuche im Kundenbereich.',
        'Module to generate ticket solution and response time statistics.' =>
            'Modul zur Generierung von Lösungs- und Antwortzeitstatistiken.',
        'Module to generate ticket statistics.' => 'Modul zur Generierung von Ticket-Statistiken',
        'Module to grant access if the CustomerID of the ticket matches the CustomerID of the customer.' =>
            'Modul zum Gestatten des Zugriffs, wenn die CustomerID eines Tickets der CustomerID des Kunden entspricht.',
        'Module to grant access if the CustomerUserID of the ticket matches the CustomerUserID of the customer.' =>
            'Modul zum Gestatten des Zugriffs, wenn die CustomerUserID eines Tickets der CustomerUserID des Kunden entspricht.',
        'Module to grant access to any agent that has been involved in a ticket in the past (based on ticket history entries).' =>
            'Modul zum Gestatten des Zugriffs für jeden Agenten, der einmal in ein Ticket involviert war (basierend auf den Einträgen in der Ticket-Historie).',
        'Module to grant access to the agent responsible of a ticket.' =>
            'Modul zum Gestatten des Zugriffs auf ein Ticket durch den verantwortlichen Agenten.',
        'Module to grant access to the creator of a ticket.' => 'Modul zum Gestatten des Zugriffs auf ein Ticket durch den Agenten, der das Ticket ursprünglich erstellt hat.',
        'Module to grant access to the owner of a ticket.' => 'Modul zum Gestatten des Zugriffs auf ein Ticket durch den Agenten, der Besitzer des Tickets ist.',
        'Module to grant access to the watcher agents of a ticket.' => 'Modul zum Gestatten des Zugriffs auf ein Ticket durch Agenten, die das Ticket beobachten.',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            '',
        'Module to use database filter storage.' => '',
        'Multiselect' => 'Mehrfachauswahl',
        'My Services' => 'Meine Services',
        'My Tickets.' => 'Meine Tickets.',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            '',
        'Name of custom service. The custom service is a service selection of your preferred services and can be selected in the preferences settings.' =>
            '',
        'NameX' => 'NameX',
        'Nederlands' => 'Niederländisch',
        'New Ticket [%s] created (Q=%s;P=%s;S=%s).' => 'Neues Ticket [%s] erstellt (Q=%s;P=%s;S=%s).',
        'New Window' => 'Neues Fenster',
        'New owner is "%s" (ID=%s).' => 'Neuer Besitzer ist "%s" (ID=%s).',
        'New process ticket' => 'Neues Prozess-Ticket',
        'New responsible is "%s" (ID=%s).' => 'Neuer Verantwortlicher ist "%s" (ID=%s).',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Mögliche Folgestatus für Tickets, nachdem über den Eingehender Anruf-Bildschirm im Agentenbereich eine Telefonnotiz hinzugefügt wurde.',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Mögliche Folgestatus für Tickets, nachdem über den Ausgehender Anruf-Bildschirm im Agentenbereich eine Telefonnotiz hinzugefügt wurde.',
        'None' => 'Keine',
        'Norwegian' => 'Norwegisch',
        'Notification sent to "%s".' => 'Benachrichtigung versandt an "%s".',
        'Number of displayed tickets' => 'Anzahl der angezeigten Tickets',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            'Anzahl von Zeilen (pro Ticket), die über das Such-Tool im Agentenbereich angezeigt werden.',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            'Anzahl von Tickets pro Seite in Suchergebnissen im Agentenbereich.',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            'Anzahl der anzuzeigenen Tickets pro Seite in einem Suchergebnis in der Kundenoberfläche.',
        'OTRS can use one or more readonly mirror databases for expensive operations like fulltext search or statistics generation. Here you can specify the DSN for the first mirror database.' =>
            'OTRS kann eine oder mehrere Spiegeldatenbanken für aufwändige Operationen wie Volltextsuchen oder Statistikgenerierungen nutzen. Hier können Sie die DSN für die erste Spiegeldatenbank hinterlegen.',
        'Old: "%s" New: "%s"' => 'Alt: "%s" Neu: "%s"',
        'Online' => 'Online',
        'Open tickets (customer user)' => 'Offene Tickets (Kundenbenutzer)',
        'Open tickets (customer)' => 'Offene Tickets (Kunde)',
        'Option' => 'Option',
        'Optional queue limitation for the CreatorCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Optionale Einschränkung auf Queues für das CreatorCheck Permission-Modul. Wenn gesetzt, wird die Erlaubnis nur für Tickets in den hier angegebenen Queues erteilt.',
        'Optional queue limitation for the InvolvedCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Optionale Einschränkung auf Queues für das InvolvedCheck Permission-Modul. Wenn gesetzt, wird die Erlaubnis nur für Tickets in den hier angegebenen Queues erteilt.',
        'Optional queue limitation for the OwnerCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Optionale Einschränkung auf Queues für das OwnerCheck Permission-Modul. Wenn gesetzt, wird die Erlaubnis nur für Tickets in den hier angegebenen Queues erteilt.',
        'Optional queue limitation for the ResponsibleCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Optionale Einschränkung auf Queues für das ResponsibleCheck Permission-Modul. Wenn gesetzt, wird die Erlaubnis nur für Tickets in den hier angegebenen Queues erteilt.',
        'Out Of Office' => 'Derzeit nicht im Büro',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            'Überlädt existierende Funktionen in Kernel::System::Ticket (redefining). Kann genutzt werden, um möglichst einfach Anpassungen vorzunehmen.',
        'Overview Escalated Tickets.' => 'Übersicht eskalierter Tickets.',
        'Overview Refresh Time' => 'Aktualisierungszeiten der Übersichten',
        'Overview of all escalated tickets.' => 'Übersicht aller eskalierter Tickets.',
        'Overview of all open Tickets.' => 'Übersicht über alle offenen Tickets.',
        'Overview of all open tickets.' => 'Übersicht aller offenen Tickets.',
        'Overview of customer tickets.' => 'Übersicht von Kunden-Tickets.',
        'PGP Key Management' => 'PGP-Schlüssel-Verwaltung',
        'PGP Key Upload' => 'PGP Schlüssel hochladen',
        'Package event module file a scheduler task for update registration.' =>
            '',
        'Parameters for the CreateNextMask object in the preference view of the agent interface.' =>
            'Parameter für das CreateNextMask-Objekt in der Einstellungen-Ansicht des Agentenbereichs.',
        'Parameters for the CustomQueue object in the preference view of the agent interface.' =>
            'Parameter für das CustomQueue-Objekt in der Einstellungen-Ansicht des Agentenbereichs.',
        'Parameters for the CustomService object in the preference view of the agent interface.' =>
            'Parameter für das CustomService-Objekt in der Einstellungen-Ansicht des Agentenbereichs.',
        'Parameters for the RefreshTime object in the preference view of the agent interface.' =>
            'Parameter für das RefreshTime-Objekt in der Einstellungen-Ansicht des Agentenbereichs.',
        'Parameters for the column filters of the small ticket overview.' =>
            'Parameter für die Spaltenfilter der "S"-Variante in Ticketübersichten.',
        'Parameters for the dashboard backend of the customer company information of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter für das Dashboard-Backend des Kunden-Informations-Widgets im Agentenbereich. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten.',
        'Parameters for the dashboard backend of the customer id status widget of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter für das Dashboard-Backend des Kundennummer-Status-Widgets im Agentenbereich. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten.',
        'Parameters for the dashboard backend of the customer user list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter für das Dashboard-Backend des Kundenlisten-Widgets im Agentenbereich. "Limit" bestimmt die Anzahl der standardmäßig angezeigten Einträge. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten.',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Parameter für das Dashboard-Backend des neue Tickets-Übersichts-Widgets im Agentenbereich. "Limit" bestimmt die Anzahl der standardmäßig angezeigten Einträge. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten.',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Parameter für das Dashboard-Backend des offene Tickets-Übersichts-Widgets im Agentenbereich. "Limit" bestimmt die Anzahl der standardmäßig angezeigten Einträge. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten. Hinweis: Nur Ticket-Attribute und dynamische Felder (DynamicField_NameX) sind für DefaultColumns erlaubt. Mögliche Einstellungen: 0 = Inaktiv, 1 = Verfügbar, 2 = standardmäßig aktiv.',
        'Parameters for the dashboard backend of the queue overview widget of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "QueuePermissionGroup" is not mandatory, queues are only listed if they belong to this permission group if you enable it. "States" is a list of states, the key is the sort order of the state in the widget. "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter für das Dashboard-Backend des Queue-Übersichts-Widgets im Agentenbereich. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten.',
        'Parameters for the dashboard backend of the running process tickets overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter für das Dashboard-Backend des laufende Prozess-Tickets-Übersichts-Widgets im Agentenbereich. "Limit" bestimmt die Anzahl der standardmäßig angezeigten Einträge. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten.',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Parameter für das Dashboard-Backend des Tickets-Eskalations-Übersichts-Widgets im Agentenbereich. "Limit" bestimmt die Anzahl der standardmäßig angezeigten Einträge. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten. Hinweis: Nur Ticket-Attribute und dynamische Felder (DynamicField_NameX) sind für DefaultColumns erlaubt. Mögliche Einstellungen: 0 = Inaktiv, 1 = Verfügbar, 2 = standardmäßig aktiv.',
        'Parameters for the dashboard backend of the ticket events calendar of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter für das Dashboard-Backend des Tickets-Ereignisse-Widgets im Agentenbereich. "Limit" bestimmt die Anzahl der standardmäßig angezeigten Einträge. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten.',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Parameter für das Dashboard-Backend des wartende Tickets-Übersichts-Widgets im Agentenbereich. "Limit" bestimmt die Anzahl der standardmäßig angezeigten Einträge. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten. Hinweis: Nur Ticket-Attribute und dynamische Felder (DynamicField_NameX) sind für DefaultColumns erlaubt. Mögliche Einstellungen: 0 = Inaktiv, 1 = Verfügbar, 2 = standardmäßig aktiv.',
        'Parameters for the dashboard backend of the ticket stats of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter für das Dashboard-Backend des Statistiken für Tickets-Widgets im Agentenbereich. "Limit" bestimmt die Anzahl der standardmäßig angezeigten Einträge. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten.',
        'Parameters for the dashboard backend of the upcoming events widget of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter für das Dashboard-Backend des bevorstehende Ereignisse-Widgets im Agentenbereich. "Limit" bestimmt die Anzahl der standardmäßig angezeigten Einträge. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten.',
        'Parameters for the pages (in which the dynamic fields are shown) of the dynamic fields overview.' =>
            'Parameter für Seiten der dynamische Felder-Übersicht, in denen dynamische Felder angezeigt werden.',
        'Parameters for the pages (in which the tickets are shown) of the medium ticket overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the small ticket overview.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the ticket preview overview.' =>
            '',
        'Parameters of the example SLA attribute Comment2.' => 'Parameter für das Beispiel-SLA-Attribut Comment2.',
        'Parameters of the example queue attribute Comment2.' => 'Parameter für das Beispiel-Queue-Attribut Comment2.',
        'Parameters of the example service attribute Comment2.' => 'Parameter für das Beispiel-Service-Attribut Comment2.',
        'ParentChild' => 'Eltern-Kind',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            'Pfad zur Log-Datei (wird nur angewandt und ist dann verpflichtend, wenn "FS" als LoopProtectionModule ausgewählt wurde)',
        'People' => 'Personen',
        'Performs the configured action for each event (as an Invoker) for each configured Webservice.' =>
            'Führt die konfigurierte Aktion für jedes Ereignis für jeden konfigurierten Webservice aus (als Invoker).',
        'Permitted width for compose email windows.' => 'Erlaubte Breite für E-Mail erstellen-Fenster.',
        'Permitted width for compose note windows.' => 'Erlaubte Breite für Notiz erstellen-Fenster.',
        'Persian' => 'Persisch',
        'Phone Call.' => 'Telefonanruf.',
        'Picture Upload' => 'Bild-Upload',
        'Picture upload module.' => 'Bild-Upload-Modul.',
        'Picture-Upload' => 'Bild-Hochladen',
        'Polish' => 'Polnisch',
        'Portuguese' => 'Portugiesisch',
        'Portuguese (Brasil)' => 'Portugiesisch (Brasilien)',
        'PostMaster Filters' => 'PostMaster-Filter',
        'PostMaster Mail Accounts' => 'PostMaster-E-Mail-Konten',
        'Process Management Activity Dialog GUI' => 'Prozess-Management Aktivität-Dialog GUI',
        'Process Management Activity GUI' => 'Prozess-Management-Aktivitäten GUI',
        'Process Management Path GUI' => 'Prozess-Management-Pfad GUI',
        'Process Management Transition Action GUI' => 'Prozess-Management Übergangs-Aktionen GUI',
        'Process Management Transition GUI' => 'Prozess-Management-Übergangs Gui',
        'Process Ticket.' => 'Prozess-Ticket.',
        'Process pending tickets.' => 'Abarbeitung wartender Tickets.',
        'Process ticket' => 'Prozess-Ticket',
        'ProcessID' => 'ProcessID',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see http://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            'Schutz gegen CSRF-Lücken (Cross Site Request Forgery). Besuchen Sie http://en.wikipedia.org/wiki/Cross-site_request_forgery für mehr Informationen.',
        'Provides a matrix overview of the tickets per state per queue.' =>
            'Stellt eine Matrix-Übersicht von Tickets pro Status und pro Queue zur Verfügung.',
        'Queue view' => 'Ansicht nach Queues',
        'Rebuild the ticket index for AgentTicketQueue.' => 'Ticket-Index für AgentTicketQueue neu aufbauen.',
        'Recognize if a ticket is a follow-up to an existing ticket using an external ticket number.' =>
            'Erkennung anhand einer externen Ticket-Nummer, ob es sich bei einem Ticket um ein Follow-Up zu einem bestehenden Ticket handelt.',
        'Refresh interval' => 'Aktualisierungsintervall',
        'Removed subscription for user "%s".' => 'Abo für Benutzer "%s" ausgetragen.',
        'Removes the ticket watcher information when a ticket is archived.' =>
            'Entfernt die Ticket-Beobachter-Information, wenn ein Ticket archiviert wird.',
        'Renew existing SMIME certificates from customer backend. Note: SMIME and SMIME::FetchFromCustomer needs to be active in SysConfig and customer backend needs to be configured to fetch UserSMIMECertificate attribute.' =>
            'Existierende SMIME-Zertifikate aus dem Kundenbereich erneuern. Hinweis: SMIME und SMIME::FetchFromCustomer müssen aktiv und das Kunden-Backend so konfiguriert sein, dass UserSMIMECertificate-Attribute ermittelt werden.',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            '',
        'Reports' => 'Berichte',
        'Reports (OTRS Business Solution™)' => 'Berichte (OTRS Business Solution™)',
        'Reprocess mails from spool directory that could not be imported in the first place.' =>
            '',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            'Benötigte Rechte um den Kunden eines Tickets im Agenten-Interface zu ändern.',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            'Benötigte Rechte um den "Schließen"-Dialog im Agenten-Interface aufzurufen.',
        'Required permissions to use the email outbound screen in the agent interface.' =>
            'Benötigte Rechte, um den Dialog für ausgehende Emails im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            'Benötigte Rechte um den "Umleiten"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            'Benötigte Rechte um den "Verfassen"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            'Benötigte Rechte um den "Weiterleiten"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            'Benötigte Rechte um den "Freitext"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket merge screen of a zoomed ticket in the agent interface.' =>
            'Benötigte Rechte um den "Zusammenfassen"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            'Benötigte Rechte um den "Notiz"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Benötigte Rechte um den "Besitzer"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Benötigte Rechte um den "Warten"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            'Benötigte Rechte um den "Eingehender Telefonanruf"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            'Benötigte Rechte um den "Ausgehender Telefonanruf"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Benötigte Rechte um den "Priorität"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            'Benötigte Rechte um den "Verantwortlicher"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            'Setzt den Besitzer eines TIckets zurück und entsperrt es, wenn das Ticket in eine andere Queue verschoben wird.',
        'Responsible Tickets' => 'Verantwortliche Tickets',
        'Responsible Tickets.' => 'Verantwortliche Tickets.',
        'Restores a ticket from the archive (only if the event is a state change to any open available state).' =>
            '',
        'Retains all services in listings even if they are children of invalid elements.' =>
            'Behält alle Services in Auflistungen bei, auch, wenn sie Kind-Services von ungültigen Elementen sind.',
        'Right' => 'Rechts',
        'Roles <-> Groups' => 'Rollen <-> Gruppen',
        'Run file based generic agent jobs (Note: module name need needs to be specified in -configuration-module param e.g. "Kernel::System::GenericAgent").' =>
            'Dateibasierte Generic-Agent-Jobs ausführen (Hinweis: Der Modulname muss im Parameter -configuration-module angegeben sein, z. B. "Kernel::System::GenericAgent").',
        'Running Process Tickets' => 'Aktive Prozesstickets',
        'Runs an initial wildcard search of the existing customer company when accessing the AdminCustomerCompany module.' =>
            'Führt eine initiale Wildcard-Suche für bestehende Kundenfirmen aus, wenn auf AdminCustomerCompany zugegriffen wird.',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            'Führt eine initiale Wildcard-Suche für bestehende Kundenbenutzer aus, wenn auf AdminCustomerUser zugegriffen wird.',
        'Runs the system in "Demo" mode. If set to "Yes", agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            'Führt das System im "Demo" Modus aus. Wenn die Einstellung auf "Ja" gesetzt ist, können Agenten Einstellungen, wie die Sprachauswahl oder das Design über die Agenten Weboberfläche ändern. Diese Einstellungen sind nur für die aktuelle Session gültig. Agenten können ihr Passwort nicht ändern.',
        'Russian' => 'Russisch',
        'S/MIME Certificate Upload' => 'S/MIME Zertifikat hochladen',
        'SMS' => 'SMS',
        'SMS (Short Message Service)' => 'SMS (Short Message Service)',
        'Sample command output' => 'Beispielhafte Kommando-Ausgabe',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the OTRS user. You can switch between the modules even on a system that is already in production without any loss of data. Note: Searching for attachment names is not supported when "FS" is used.' =>
            'Speicherung von Artikel-Anlagen. "DB" legt alle Daten in der Datenbank ab (nicht empfohlen für große Anlagen). "FS" legt alle Daten im Dateisystem ab; dies ist schneller, jedoch sollte der Webserver mit dem OTRS-Benutzer betrieben werden. Sie können im laufenden Betrieb ohne Datenverlust zwischen den Modulen wechseln. Bitte beachten Sie, dass das Suchen nach Anlagen für "FS" nicht unterstützt wird.',
        'Schedule a maintenance period.' => 'Systemwartung planen',
        'Screen' => 'Bildschirm',
        'Search Customer' => 'Kunden suchen',
        'Search Ticket.' => 'Ticket suchen.',
        'Search Tickets.' => 'Tickets suchen.',
        'Search User' => 'Benutzer suchen',
        'Search backend default router.' => 'Standard-Router für Such-Backend.',
        'Search backend router.' => 'Router für Such-Backend.',
        'Search.' => 'Suche.',
        'Second Queue' => 'Zweite Queue',
        'Select after which period ticket overviews should refresh automatically.' =>
            '',
        'Select how many tickets should be shown in overviews by default.' =>
            '',
        'Select the main interface language.' => '',
        'Select your frontend Theme.' => 'Wählen Sie Ihr Anzeigeschema aus.',
        'Select your preferred layout for OTRS.' => '',
        'Selects the cache backend to use.' => 'Gibt das zu verwendende Cache Backend an.',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            'Auswahl wie Uploads über die Web-Oberfläche gehandhabt werden sollen. "DB" speichert alle Uploads in der Datenbank, "FS" nutzt das Dateisystem.',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            '',
        'Send new outgoing mail from this ticket' => 'Neue ausgehende E-Mail aus diesem Ticket heraus senden',
        'Send notifications to users.' => 'Benachrichtigungen an Agenten verschicken.',
        'Sender type for new tickets from the customer inteface.' => 'Absender Typ für neue Tickets aus der Kunden-Oberfläche.',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            'Sendet Rückfrage Benachrichtigungen für Agenten nur an den Ticket Besitzer wenn das Ticket entsperrt ist (standardmäßig werden die Benachrichtigungen an alle Agenten gesendet).',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            'Versendet alle ausgehenden E-Mails via BCC zu der angegebenen Adresse. Bitte nutzen Sie dies ausschließlich für Backups.',
        'Sends customer notifications just to the mapped customer.' => 'Versendet Kundenbenachrichtigungen nur für den gemappten Kunden.',
        'Sends registration information to OTRS group.' => 'Übermitteln der Registrierungsinformationen an die OTRS Group.',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            'Sendet eine Erinnerung eines Entsperrten Tickets nachdem das Erinnerungsdatum erreicht wurde. (Nur zum Besitzer des Tickets gesendet).',
        'Sends the notifications which are configured in the admin interface under "Notfication (Event)".' =>
            'Sendet eine Benachrichtigung welche im Admin Menü unter "Benachrichtig (Event)" eingestellt werden kann.',
        'Serbian Cyrillic' => 'Kyrillisches Serbisch',
        'Serbian Latin' => 'Lateinisches Serbisch',
        'Service view' => 'Ansicht nach Services',
        'ServiceView' => 'DienstAnsicht',
        'Set a new password by filling in your current password and a new one.' =>
            '',
        'Set minimum loglevel. If you select \'error\', just errors are logged. With \'debug\' you get all logging messages.' =>
            'Minimales Log-Level setzen. Wenn Sie "error" wählen, werden nur Fehler mitgeloggt. Mit "debug" erhalten Sie alle Log-Nachrichten.',
        'Set sender email addresses for this system.' => 'Absendeadressen für dieses System verwalten.',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Definiert Standardhöhe (in Pixel) für Inline_HTML-Feldern in AgentTicketZoom.',
        'Set the limit of tickets that will be executed on a single genericagent job execution.' =>
            'Legt die maximale Anzahl an Tickets fest, die pro GenericAgent-Job-Ausführung bearbeitet werden.',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Definiert maximale Höhe (in Pixel) für Inline_HTML-Feldern in AgentTicketZoom.',
        'Set this to yes if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            'Setzen Sie diese Einstellung auf "Ja", wenn Sie allen öffentlichen und privaten PGP-Schlüsseln auch dann vertrauen möchten, wenn diese nicht mit einer vertrauenswürdigen Signatur zertifiziert sind.',
        'Sets if SLA must be selected by the agent.' => 'Gibt an, ob ein SLA durch einen Agenten ausgewählt sein muss.',
        'Sets if SLA must be selected by the customer.' => 'Gibt an, ob ein SLA durch einen Kundenbenutzer ausgewählt sein muss.',
        'Sets if note must be filled in by the agent. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Setzt ob eine Notiz vom Agenten ausgefüllt werden muss. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Sets if service must be selected by the agent.' => 'Gibt an, ob ein Service durch einen Agenten ausgewählt sein muss.',
        'Sets if service must be selected by the customer.' => 'Gibt an, ob ein Service durch einen Kundenbenutzer ausgewählt sein muss.',
        'Sets if ticket owner must be selected by the agent.' => 'Gibt an, ob ein Ticket-Besitzer durch einen Agenten ausgewählt sein muss.',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            'Setzt die Wartezeit eines Tickets auf 0, wenn der Status auf einen nicht warten-Status gesetzt wird.',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            'Definiert das Ticket Alter in Minuten bevor die Queues mit unbearbeiteten Tickets hervorgehoben werden (erstes Level).',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            'Definiert das Ticket Alter in Minuten bevor die Queues mit unbearbeiteten Tickets hervorgehoben werden (zweites Level).',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            'Bestimmt das Konfigurationslevel des Administrators. Abhängig von diesem Level werden einige Optionen der Sysconfig nicht angezeigt. Die verfügbaren Level sind in absteigender Reihenfolge: Experte, Fortgeschrittener, Anfänger. Je höher das Level ist (wobei Anfänger das höchste Level ist), desto niedriger ist die Wahrscheinlichkeit, dass der Nutzer das System versehentlich so konfiguriert, dass es nicht mehr nutzbar ist.',
        'Sets the count of articles visible in preview mode of ticket overviews.' =>
            'Legt die Anzahl von Artikeln fest, die im Vorschau-Modus von Ticketübersichten sichtbar sein soll.',
        'Sets the default article type for new email tickets in the agent interface.' =>
            'Setzt den Standard Ticket-Typ für Neue Email-Tickets in der Agenten-Oberfläche an.',
        'Sets the default article type for new phone tickets in the agent interface.' =>
            'Setzt den Standard Ticket-Typ für Neue Telefon-Tickets in der Agenten-Oberfläche an.',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Schließen" Ansicht in der Agenten-Oberfläche.',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Verschieben" Ansicht in der Agenten-Oberfläche.',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Notiz" Ansicht in der Agenten-Oberfläche.',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Besitzer" Ansicht in der Agenten-Oberfläche.',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Warten auf Erinnerung" Ansicht in der Agenten-Oberfläche.',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Priorität" Ansicht in der Agenten-Oberfläche.',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Verantwortlicher" Ansicht in der Agenten-Oberfläche.',
        'Sets the default error message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Legt die Standard-Fehlermeldung für den Anmelde-Bildschirm im Agenten- und Kundenbereich fest, die angezeigt wird, wenn sich das System gerade in einer Wartungsperiode befindet.',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            'Bestimmt den Standard-Linktyp für geteilte Tickets im Agentenbereich.',
        'Sets the default message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Setzt die Standard Nachricht für den Hinweis, der auf der Agenten- und Kunden-Oberfläche angezeigt wird, wenn sich das System im Wartungsmodus befindet. ',
        'Sets the default message for the notification is shown on a running system maintenance period.' =>
            'Setzt die Standard Nachricht für den Hinweis, der angezeigt wird, wenn das System im Wartungsmodus läuft. ',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            'Setzt den Standard Ticket-Status für neue Telefon-Tickets in der Agenten-Oberfläche. ',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            'Setzt den Standard Ticket-Status für neue E-Mail-Tickets in der Agenten-Oberfläche. ',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            'Setzt die Standard Notiz für neue Telefon-Tickets. z.B. "Neues Ticket durch Anruf" in der Agenten Oberfläche',
        'Sets the default priority for new email tickets in the agent interface.' =>
            'Setzt die Standard Priorität für neue E-Mail-Tickets in der Agenten-Oberfläche.',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            'Setzt die Standard Priorität für neue Telefon-Tickets in der Agenten-Oberfläche.',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            'Bestimmt den Standard-Sendertyp für neue E-Mail-Tickets im Agentenbereich.',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            'Bestimmt den Standard-Sendertyp für neue Telefon-Tickets im Agentenbereich.',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            'Bestimmt den Standard-Betreff für neue E-Mail-Tickets (z.B. "Ausgehende E-Mail") im Agentenbereich.',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            'Bestimmt den Standard-Betreff für neue Telefon-Tickets (z.B. "Telefonanruf") im Agentenbereich.',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticket schließen-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticket verschieben-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticketnotiz-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticketbesitzer-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Wartezeit für Ticket setzen-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticketprioriät-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticketverantwortlicher-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default text for new email tickets in the agent interface.' =>
            'Bestimmt den Standardtext für neue E-Mail-Tickets im Agentenbereich.',
        'Sets the display order of the different items in the preferences view.' =>
            'Bestimmt die Anzeigereihenfolge der verschiedenen Elemente in den persönlichen Einstellungen für Agenten.',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is logged out.' =>
            '',
        'Sets the maximum number of active agents within the timespan defined in SessionActiveTime before a prior warning will be visible for the logged in agents.' =>
            '',
        'Sets the maximum number of active agents within the timespan defined in SessionActiveTime.' =>
            'Steuert die maximale Anzahl an gleichzeitig aktiven Agenten innerhalb der in SessionActiveTime definierten Zeitspanne.',
        'Sets the maximum number of active customers within the timespan defined in SessionActiveTime.' =>
            'Steuert die maximale Anzahl an gleichzeitig aktiven Kunden innerhalb der in SessionActiveTime definierten Zeitspanne.',
        'Sets the maximum number of active sessions per agent within the timespan defined in SessionActiveTime.' =>
            'Steuert die maximale Anzahl an gleichzeitig aktiven Sitzungen pro Agent innerhalb der in SessionActiveTime definierten Zeitspanne.',
        'Sets the maximum number of active sessions per customers within the timespan defined in SessionActiveTime.' =>
            'Steuert die maximale Anzahl an gleichzeitig aktiven Sitzungen pro Kunde innerhalb der in SessionActiveTime definierten Zeitspanne.',
        'Sets the minimal ticket counter size if "AutoIncrement" was selected as TicketNumberGenerator. Default is 5, this means the counter starts from 10000.' =>
            'Legt die minimale Größe für den Ticketzähler fest, wenn "AutoIncrement" als TicketNumberGenerator gewählt wurde. Die Standardeinstellung ist 5, was bedeutet, dass der Zähler bei 10000 startet.',
        'Sets the minutes a notification is shown for notice about upcoming system maintenance period.' =>
            'Steuert, wie lange (in Minuten) die Benachrichtigung über eine bevorstehende Wartungsphase angezeigt werden soll.',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            '',
        'Sets the options for PGP binary.' => 'Legt die Optionen für die PGP-Binärdatei fest.',
        'Sets the order of the different items in the customer preferences view.' =>
            'Bestimmt die Anzeigereihenfolge der verschiedenen Elemente in den persönlichen Einstellungen für Kunden.',
        'Sets the password for private PGP key.' => 'Legt das Passwort für den privaten PGP-Schlüssel fest.',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            'Legt die bevorzugten Zeiteinheiten fest (z.B. Arbeitseinheiten, Stunden, Minuten).',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            '',
        'Sets the queue in the ticket close screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Schließen-Bildschirm von Tickets im Agentenbereich.',
        'Sets the queue in the ticket free text screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Freitext-Bildschirm von Tickets im Agentenbereich.',
        'Sets the queue in the ticket note screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Notiz-Bildschirm von Tickets im Agentenbereich.',
        'Sets the queue in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Besitzer-Bildschirm von Tickets im Agentenbereich.',
        'Sets the queue in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Wartezeit setzen-Bildschirm von Tickets im Agentenbereich.',
        'Sets the queue in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Priorität-Bildschirm von Tickets im Agentenbereich.',
        'Sets the queue in the ticket responsible screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Verantwortlicher-Bildschirm von Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Schließen-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Stapelverarbeitungs-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Freitext-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Notiz-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Besitzer-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Wartezeit setzen-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Priorität-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Verantwortlicher-Bildschirm für Tickets im Agentenbereich.',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Setzt den Service im Schließen-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Setzt den Service im Freitext-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Setzt den Service im Notiz-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Setzt den Service im Besitzer-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Setzt den Service im Wartezeit setzen-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Setzt den Service im Priorität-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Setzt den Service im Verantwortlicher-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
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
        'Sets the stats hook.' => 'Steuert den Hook für Statistiken.',
        'Sets the system time zone (required a system with UTC as system time). Otherwise this is a diff time to the local time.' =>
            'Legt die Zeitzone des Systems fest (benötigt ein System mit UTC als Systemzeit). Andernfalls ist dies die Differenzzeit zur lokalen Zeit.',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            'Setzt den Besitzer im Schließen-Bildschirm für Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            'Setzt den Besitzer im Stapelverarbeitungs-Bildschirm für Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            'Setzt den Besitzer im Freitext-Bildschirm für Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            'Setzt den Besitzer im Notiz-Bildschirm für Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Setzt den Besitzer im Besitzer-Bildschirm für Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Setzt den Besitzer im Wartezeit setzen-Bildschirm für Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Setzt den Besitzer im Priorität-Bildschirm für Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            'Setzt den Besitzer im Verantwortlicher-Bildschirm für Tickets im Agentenbereich.',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Setzt den Ticket-Typ im Schließen-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            'Setzt den Ticket-Typ im Stapelverarbeitungs-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Setzt den Ticket-Typ im Freitext-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Setzt den Ticket-Typ im Notiz-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Setzt den Ticket-Typ im Besitzer-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Setzt den Ticket-Typ im Wartezeit setzen-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Setzt den Ticket-Typ im Priorität-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Setzt den Ticket-Typ im Verantwortlicher-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the time (in seconds) a user is marked as active (minimum active time is 300 seconds).' =>
            '',
        'Sets the timeout (in seconds) for http/ftp downloads.' => 'Steuert den Timeout (in Sekunden) für HTTP/FTP-Downloads.',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            'Steuert den Timeout (in Sekunden) für Paket-Downloads. Überschreibt "WebUserAgent::Timeout".',
        'Sets the user time zone per user (required a system with UTC as system time and UTC under TimeZone). Otherwise this is a diff time to the local time.' =>
            '',
        'Sets the user time zone per user based on java script / browser time zone offset feature at login time.' =>
            '',
        'Shared Secret' => 'Gemeinsames Geheimnis',
        'Should the cache data be held in memory?' => 'Sollen Cache-Daten im Speicher gehalten werden?',
        'Should the cache data be stored in the selected cache backend?' =>
            'Sollen Cache-Daten im ausgewählten Cache-Backend gespeichert werden?',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            'Steuert, ob in Telefon- und E-Mail-Tickets eine Auswahl für den verantwortlichen Agenten angezeigt werden soll (Agentenbereich).',
        'Show article as rich text even if rich text writing is disabled.' =>
            'Steuert, ob der Artikel als Richtext angezeigt werden soll, auch wenn das Schreiben von Richtext abgeschaltet ist.',
        'Show queues even when only locked tickets are in.' => 'Queues auch dann anzeigen, wenn sich darin nur gesperrte Tickets befinden.',
        'Show the current owner in the customer interface.' => 'Steuert, ob der aktuelle Besitzer im Kundenbereich angezeigt werden soll.',
        'Show the current queue in the customer interface.' => 'Steuert, ob die aktuelle Queue im Kundenbereich angezeigt werden soll.',
        'Show the history for this ticket' => 'Zeige die Historie für dieses Ticket an',
        'Shows a count of icons in the ticket zoom, if the article has attachments.' =>
            'Zeigt ein Symbol mit Zähler im Ticket-Zoom an, wenn der Artikel Anhänge besitzt.',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum beobachten/nicht mehr beobachten eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.  Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Verlinken eines Tickets mit einem anderen Objekt im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Zusammenführen von Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Betrachten der Historie eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Bearbeiten der Freitextfelder eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Hinzufügen einer Notiz zu einem Ticket im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            'Zeigt einen Link zum Hinzufügen von Notizen zu Tickets in den Ticketübersichten des Agentenbereichs an.',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            'Zeigt einen Link zum Schließen von Tickets in den Ticketübersichten des Agentenbereichs an.',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Schließen eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Zeigt einen Link zum Löschen von Tickets in den Ticketübersichten des Agentenbereichs an. Zusätzliche Zugriffskontrolle für diesen Link kann über den Schlüssel "Group" und dazugehörigen Inhalt wie "rw:group1;move_into:group2" als Wert erreicht werden.',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Löschen eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to enroll a ticket into a process in the ticket zoom view of the agent interface.' =>
            'Zeigt einen Link zum Umwandeln eines regulären Tickets in ein Prozessticket im Ticket-Zoom des Agentenbereichs an. ',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum zurück Gehen im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            'Zeigt einen Link zum Sperren/Entsperren eines Tickets im Ticket-Zoom des Agentenbereichs an.',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Sperren/Entsperren eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            'Zeigt einen Link zum Verschieben von Tickets in den Ticketübersichten des Agentenbereichs an.',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Drucken eines Tickets oder Artikels im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to see the customer who requested the ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Anzeigen des Kunden, der das Ticket eröffnet hat im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            'Zeigt einen Link zum Anzeigen der Historie von Tickets in den Ticketübersichten im Agentenbereich an.',
        'Shows a link in the menu to see the owner of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Anzeigen des Besitzers eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Anzeigen der Priorität eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to see the responsible agent of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Anzeigen des verantwortlichen Agenten eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to send an outbound email in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Senden einer ausgehenden E-Mail im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to set a ticket as junk in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Zeigt in allen Ticket-Übersichten im Agentenbereich einen Link an, um Tickets als Junk zu kennzeichnen. Zusätzliche Zugriffskontrolle auf den Link kann durch befüllen des Schlüssels "Group" und befüllen des Contents (z. B. mit "rw:group1;move_into:group2") erreicht werden.',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Setzen einer Wartezeit für ein Ticket im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            'Zeigt einen Link zum Verändern der Priorität von Tickets in den Ticketübersichten des Agentenbereichs an.',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            'Zeigt einen Link zum Betrachten (Zoomen) von Tickets in den Ticketübersichten des Agentenbereichs an.',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            'Zeigt einen Link zum Betrachten von Anhängen über eine Onlineansicht im Artikel-Zoom im Agentenbereich an.',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            'Zeigt einen Link zum Herunterladen von Anhängen an Artikeln in der TicketZoom-Ansicht des Agentenbereichs an.',
        'Shows a link to see a zoomed email ticket in plain text.' => 'Zeigt einen Link um das geöffnete Ticket im Rohformat anzuzeigen.',
        'Shows a link to set a ticket as junk in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt in der TicketZoom-Ansicht im Agentenbereich einen Link an, um ein Ticket als Junk zu kennzeichnen. Zusätzliche Zugriffskontrolle auf den Link kann durch befüllen des Schlüssels "Group" und befüllen des Contents (z. B. mit "rw:group1;move_into:group2") erreicht werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            'Zeigt in der "Ticket Schließen" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            'Zeigt in der "Ticket FreiText" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            'Zeigt in der "Ticket Notiz" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Ticket Besitzer" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Warten auf Erinnerung" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Ticket Priorität" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            'Zeigt in der "Ticket Verantwortlicher" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            'Zeigt in der "Ticket Schließen" Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit Berechtigung für Notizen in diesem Ticket/ dieser Queue) die informiert werden sollen.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            'Zeigt in der "Ticket FreiText" Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit Berechtigung für Notizen in diesem Ticket/ dieser Queue) die informiert werden sollen.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            'Zeigt in der "Ticket Notiz" Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit Berechtigung für Notizen in diesem Ticket/ dieser Queue) die informiert werden sollen.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Ticket Besitzer" Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit Berechtigung für Notizen in diesem Ticket/ dieser Queue) die informiert werden sollen.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Warten auf Erinnerung" Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit Berechtigung für Notizen in diesem Ticket/ dieser Queue) die informiert werden sollen.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Ticket Priorität" Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit Berechtigung für Notizen in diesem Ticket/ dieser Queue) die informiert werden sollen.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            'Zeigt in der "Ticket Verantwortlicher" Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit Berechtigung für Notizen in diesem Ticket/ dieser Queue) die informiert werden sollen.',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            '',
        'Shows a select of ticket attributes to order the queue view ticket list. The possible selections can be configured via \'TicketOverviewMenuSort###SortAttributes\'.' =>
            '',
        'Shows all both ro and rw queues in the queue view.' => 'Zeigt sowohl rw als auch ro Queues in der Queue-Ansicht.',
        'Shows all both ro and rw tickets in the service view.' => 'Zeigt sowohl rw als auch ro Queues in der Service-Ansicht.',
        'Shows all open tickets (even if they are locked) in the escalation view of the agent interface.' =>
            'Zeigt in der Eskalation-Ansicht im der Agenten-Oberfläche alle offenen Tickets (auch wenn diese gesperrt sind).',
        'Shows all open tickets (even if they are locked) in the status view of the agent interface.' =>
            'Zeigt in der Status-Ansicht im der Agenten-Oberfläche alle offenen Tickets (auch wenn diese gesperrt sind).',
        'Shows all the articles of the ticket (expanded) in the zoom view.' =>
            'Zeigt in der "Ticket Zoom" Ansicht alle Artikel (in der ausgeklappten Ansicht).',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            '',
        'Shows all the customer user identifiers in a multi-select field (not useful if you have a lot of customer user identifiers).' =>
            '',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            'Zeigt eine Besitzerauswahl in Telefon- und E-Mail-Tickets im Agentenbereich an.',
        'Shows colors for different article types in the article table.' =>
            'Zeigt die Farben für die verschiedenen Artikeltypen in der Artikeltabelle an.',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            '',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            '',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            '',
        'Shows information on how to start OTRS Daemon' => 'Informationen über das Starten des OTRS Daemons anzeigen',
        'Shows the activated ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            '',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            '',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            '',
        'Shows the customer user\'s info in the ticket zoom view.' => '',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.' =>
            '',
        'Shows the message of the day on login screen of the agent interface.' =>
            '',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            '',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
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
            '',
        'Shows time use complete description (days, hours, minutes), if set to "Yes"; or just first letter (d, h, m), if set to "No".' =>
            '',
        'Simple' => 'Einfach',
        'Skin' => 'Skin',
        'Slovak' => 'Slowakisch',
        'Slovenian' => 'Slowenisch',
        'Software Package Manager.' => 'Softwarepaketverwaltung.',
        'SolutionDiffInMin' => 'Lösungszeitdifferenz in Minuten',
        'SolutionInMin' => 'Lösungszeit in Minuten',
        'Some description!' => 'Eine Beschreibung!',
        'Some picture description!' => 'Eine Bildbeschreibung!',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            '',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the service view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the ServiceID for the key and 0 or 1 for value.' =>
            '',
        'Spam' => 'Spam',
        'Spam Assassin example setup. Ignores emails that are marked with SpamAssassin.' =>
            'Spam Assassin Beispielsetup. Ignoriert E-Mail, die von Spam Assassin markiert wurden.',
        'Spam Assassin example setup. Moves marked mails to spam queue.' =>
            'Spam Assassin Beispielsetup. Verschiebt markierte E-Mails in die Spam-Queue.',
        'Spanish' => 'Spanisch',
        'Spanish (Colombia)' => 'Spanisch (Kolumbien)',
        'Spanish (Mexico)' => 'Spanisch (Mexiko)',
        'Spanish stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Specifies if an agent should receive email notification of his own actions.' =>
            '',
        'Specifies the available note types for this ticket mask. If the option is deselected, ArticleTypeDefault is used and the option is removed from the mask.' =>
            '',
        'Specifies the default article type for the ticket compose screen in the agent interface if the article type cannot be automatically detected.' =>
            '',
        'Specifies the different article types that will be used in the system.' =>
            'Legt die verschiedenen Artikel-Typen fest, die im System verwendet werden.',
        'Specifies the different note types that will be used in the system.' =>
            '',
        'Specifies the directory to store the data in, if "FS" was selected for TicketStorageModule.' =>
            'Bestimmt den Ordner, in welchem Daten gespeichert werden, wenn "FS" als TicketStorageModule ausgewählt wurde.',
        'Specifies the directory where SSL certificates are stored.' => 'Legt das Verzeichnis, wo SSL-Zertifikate gespeichert sind, fest.',
        'Specifies the directory where private SSL certificates are stored.' =>
            'Legt das Verzeichnis fest, in welchem die privaten SSL Zertifikate gespeichert sind. ',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "OTRS Notifications" otrs@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address.' =>
            '',
        'Specifies the email addresses to get notification messages from scheduler tasks.' =>
            'Legt die Email-Adresse für Benachrichtigungen von Scheduler Tasks fest.',
        'Specifies the group where the user needs rw permissions so that he can access the "SwitchToCustomer" feature.' =>
            '',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "OTRS Notifications" otrs@your.example.com).' =>
            '',
        'Specifies the order in which the firstname and the lastname of agents will be displayed.' =>
            'Legt die Reihenfolge fest, in der Vorname und Nachname von Agenten angezeigt wird.',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png, 700 x 100 pixel).' =>
            'Gibt den Pfad für die Datei mit dem Logo in der Kopfzeile der Webseite an. (gif|jpg|pnp, 700 x 100 Pixel).',
        'Specifies the path of the file for the performance log.' => 'Hinterlegt den Pfad für die Datei des Performance Logs. ',
        'Specifies the path to the converter that allows the view of Microsoft Excel files, in the web interface.' =>
            'Gibt den Pfad zu dem Konverter an, welcher das Ansehen von Microsoft Excel Dateien in der Weboberfläche erlaubt. ',
        'Specifies the path to the converter that allows the view of Microsoft Word files, in the web interface.' =>
            'Gibt den Pfad zu dem Konverter an, welcher das Ansehen von Microsoft Word Dateien in der Weboberfläche erlaubt. ',
        'Specifies the path to the converter that allows the view of PDF documents, in the web interface.' =>
            'Gibt den Pfad zu dem Konverter an, welcher das Ansehen von PDF Dokumenten in der Weboberfläche erlaubt. ',
        'Specifies the path to the converter that allows the view of XML files, in the web interface.' =>
            'Gibt den Pfad zu dem Konverter an, welcher das Ansehen von XML Dateien in der Weboberfläche erlaubt. ',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            '',
        'Specifies user id of the postmaster data base.' => 'Definiert die Benutzer-Id der Postmaster Datenbank.',
        'Specifies whether all storage backends should be checked when looking for attachments. This is only required for installations where some attachments are in the file system, and others in the database.' =>
            '',
        'Specify how many sub directory levels to use when creating cache files. This should prevent too many cache files being in one directory.' =>
            '',
        'Specify the channel to be used to fetch OTRS Business Solution™ updates. Warning: Development releases might not be complete, your system might experience unrecoverable errors and on extreme cases could become unresponsive!' =>
            '',
        'Specify the password to authenticate for the first mirror database.' =>
            'Geben Sie das Kennwort für die Authentifikation mit der ersten Spiegeldatenbank an.',
        'Specify the username to authenticate for the first mirror database.' =>
            'Geben Sie den Benutzernamen für die Authentifikation mit der ersten Spiegeldatenbank an.',
        'Spell checker.' => 'Rechtschreibprüfung.',
        'Stable' => '',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            '',
        'Start number for statistics counting. Every new stat increments this number.' =>
            '',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            '',
        'Stat#' => 'Statistik Nr.',
        'Status view' => 'Ansicht nach Status',
        'Stores cookies after the browser has been closed.' => 'Speichert Cookies nach dem Schließen des Browsers.',
        'Strips empty lines on the ticket preview in the queue view.' => 'Entfernt leere Zeilen in der Ticket-Vorschau in der Queue-Ansicht.',
        'Strips empty lines on the ticket preview in the service view.' =>
            'Entfernt leere Zeilen in der Ticket-Vorschau in der Service-Ansicht.',
        'Swahili' => 'Swahili',
        'Swedish' => 'Schwedisch',
        'System Address Display Name' => 'System-Adresse Anzeigename',
        'System Maintenance' => 'Systemwartung',
        'System Request (%s).' => 'Systemanfrage (%s).',
        'Target' => 'Ziel',
        'Templates <-> Queues' => 'Vorlagen <-> Queues',
        'Textarea' => 'Textfeld',
        'Thai' => 'Thai',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            '',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            '',
        'The daemon registration for the scheduler cron task manager.' =>
            'Der Hintergrundprozess für den zeitgesteuerten Aufgabenplaner.',
        'The daemon registration for the scheduler future task manager.' =>
            'Der Hintergrundprozess für die zeitgesteuerte Planung der zukünftigen Aufgaben.',
        'The daemon registration for the scheduler generic agent task manager.' =>
            '',
        'The daemon registration for the scheduler task worker.' => '',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            'Das Trennzeichen zwischen dem TicketHook und der Ticketnummer z.B. \':\'.',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            'Die Zeitspanne in Minuten nach der Erzeugung eines Ereignisses, während der neue Vorwarn- und Start-Ereignisse unterdrückt werden.',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the latter case you should verify that the setting PostMaster::CheckFollowUpModule###0200-References is activated to recognize followups based on email headers.' =>
            '',
        'The headline shown in the customer interface.' => 'Die in der Kundenoberfläche angezeigte Überschrift.',
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            '',
        'The logo shown in the header of the agent interface for the skin "default". See "AgentLogo" for further description.' =>
            'Das Logo, das für das Design "default" im Agenten-Interface angezeigt wird. Mehr Informationen finden Sie in der Einstellung "AgentLogo"',
        'The logo shown in the header of the agent interface for the skin "ivory". See "AgentLogo" for further description.' =>
            'Das Logo, das für das Design "ivory" im Agenten-Interface angezeigt wird. Mehr Informationen finden Sie in der Einstellung "AgentLogo"',
        'The logo shown in the header of the agent interface for the skin "ivory-slim". See "AgentLogo" for further description.' =>
            'Das Logo, das für das Design "ivory-slim" im Agenten-Interface angezeigt wird. Mehr Informationen finden Sie in der Einstellung "AgentLogo"',
        'The logo shown in the header of the agent interface for the skin "slim". See "AgentLogo" for further description.' =>
            'Das Logo, das für das Design "slim" im Agenten-Interface angezeigt wird. Mehr Informationen finden Sie in der Einstellung "AgentLogo"',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Das Logo, das im Agenten-Interface angezeigt wird. Die URL zu dem Bild kann entweder eine relative URL zum Designverzeichnis mit dem Bild sein, oder eine vollständige URL zu einem anderen Webserver.',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Das Logo, das im Kunden-Interface angezeigt wird. Die URL zu dem Bild kann entweder eine relative URL zum Designverzeichnis mit dem Bild sein, oder eine vollständige URL zu einem anderen Webserver.',
        'The logo shown on top of the login box of the agent interface. The URL to the image must be relative URL to the skin image directory.' =>
            'Das Logo, das oberhalb der Login-Maske im Agenten-Interface angezeigt wird. Die URL zu dem Bild muss die relative URL zum Designverzeichnis mit dem Bild sein.',
        'The maximal number of articles expanded on a single page in AgentTicketZoom.' =>
            '',
        'The maximal number of articles shown on a single page in AgentTicketZoom.' =>
            'Die maximale Anzahl von Artikeln, welche auf einer Seite im AgentTicketZoom angezeigt werden.',
        'The maximum number of mails fetched at once before reconnecting to the server.' =>
            'Die maximale Anzahl an Mails, die auf einmal abgerufen werden, bevor eine neue Verbindung zum Server aufgebaut wird.',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            'Der Text am Anfang des Betreffs einer E-Mail Antwort, z.B. RE, AW oder AS.',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            'Der Text am Anfang des Betreffs, wenn eine E-Mail weitergeleitet wird, z.B. FW, Fwd oder WG.',
        'This event module stores attributes from CustomerUser as DynamicFields tickets. Please see the setting above for how to configure the mapping.' =>
            '',
        'This is the default orange - black skin for the customer interface.' =>
            '',
        'This is the default orange - black skin.' => 'Dies ist die Standard orange-schwarze Farbgebung.  ',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            '',
        'This module is part of the admin area of OTRS.' => 'Dieses Modul ist ein teil des Admin-Bereiches von OTRS.',
        'This option defines the dynamic field in which a Process Management activity entity id is stored.' =>
            '',
        'This option defines the dynamic field in which a Process Management process entity id is stored.' =>
            '',
        'This option defines the process tickets default lock.' => 'Diese Option setzt die Prozess-Ticket Standardsperre.',
        'This option defines the process tickets default priority.' => 'Diese Option setzt die Prozess-Ticket Standardpriorität',
        'This option defines the process tickets default queue.' => 'Diese Option setzt die Prozess-Ticket Standard-Queue.',
        'This option defines the process tickets default state.' => 'Diese Option setzt den Prozess-Ticket Standardstatus',
        'This option will deny the access to customer company tickets, which are not created by the customer user.' =>
            'Diese Option verweigert den Zugriff auf Tickets von anderen Kundenbenutzern mit der selben Kundenfirma.',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            '',
        'This will allow the system to send text messages via SMS.' => 'Dies erlaubt dem System das Senden von SMS-Nachrichten.',
        'Ticket Close.' => 'Ticket schließen.',
        'Ticket Compose Bounce Email.' => 'E-Mail-Erstellung für Ticket-Umleitung.',
        'Ticket Compose email Answer.' => 'E-Mail-Erstellung für Ticket-Antwort.',
        'Ticket Customer.' => 'Ticket-Kunde.',
        'Ticket Forward Email.' => 'Ticket-Weiterleitung.',
        'Ticket FreeText.' => 'Ticket Freitext-Felder.',
        'Ticket History.' => 'Ticket-History.',
        'Ticket Lock.' => 'Ticket-Sperre.',
        'Ticket Merge.' => 'Ticket-Zusammenfassung.',
        'Ticket Move.' => 'Ticket verschieben.',
        'Ticket Note.' => 'Ticket-Notiz.',
        'Ticket Notifications' => 'Ticket-Benachrichtigungen',
        'Ticket Outbound Email.' => 'Ausgehende Ticket-E-Mail.',
        'Ticket Owner.' => 'Ticket-Besitzer.',
        'Ticket Pending.' => 'Ticket in Wartestatus versetzen.',
        'Ticket Print.' => 'Ticket drucken.',
        'Ticket Priority.' => 'Ticket-Priorität.',
        'Ticket Queue Overview' => 'Ticket-Übersicht nach Queues',
        'Ticket Responsible.' => 'Ticket-Verantwortlicher.',
        'Ticket Watcher' => 'Ticket-Beobachter.',
        'Ticket Zoom.' => 'Ticket-Detailansicht.',
        'Ticket bulk module.' => 'Ticket-Stapelverarbeitung.',
        'Ticket event module that triggers the escalation stop events.' =>
            'Ticket Event Modul welche die Eskalation-Stop-Ereignisse auslöst.',
        'Ticket moved into Queue "%s" (%s) from Queue "%s" (%s).' => 'Ticket verschoben in Queue "%s" (%s) von Queue "%s" (%s).',
        'Ticket notifications' => 'Ticket-Benachrichtigungen',
        'Ticket overview' => 'Ticket-Übersicht',
        'Ticket plain view of an email.' => 'Nur-Text-Ansicht für Ticket-E-Mails.',
        'Ticket title' => 'Ticket-Titel',
        'Ticket zoom view.' => 'Ticket-Detailansicht.',
        'TicketNumber' => 'Ticketnummer',
        'Tickets.' => 'Tickets.',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            'Zeit in Sekunden wird der aktuellen Zeit hinzugefügt wenn ein unerledigter-zustand gesetzt wird (Standard: 86400 = 1 Tag).',
        'Title updated: Old: "%s", New: "%s"' => 'Titel geändert: Alt: "%s", Neu: "%s"',
        'To accept login information, such as an EULA or license.' => 'Um Login-Informationen zu akzeptieren, wie EULAs oder Lizenzen.',
        'To download attachments.' => 'Zum Herunterladen von Anhängen.',
        'Toggles display of OTRS FeatureAddons list in PackageManager.' =>
            'Schaltet die Anzeige der OTRS FeatureAddon-Liste in der Paket-Verwaltung um.',
        'Toolbar Item for a shortcut. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Transport selection for ticket notifications.' => '',
        'Tree view' => 'Baumansicht',
        'Triggers ticket escalation events and notification events for escalation.' =>
            '',
        'Turkish' => 'Türkisch',
        'Turns off SSL certificate validation, for example if you use a transparent HTTPS proxy. Use at your own risk!' =>
            '',
        'Turns on drag and drop for the main navigation.' => 'Aktiviert Drag und Drop für die Hauptnavigation.',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            '',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            '',
        'Ukrainian' => 'Ukrainisch',
        'Unlock tickets that are past their unlock timeout.' => 'Geben Sie Tickets frei, deren Freigabe-Timeout abgelaufen ist.',
        'Unlock tickets whenever a note is added and the owner is out of office.' =>
            'Geben Sie tickets frei, wenn eine Notiz hinzugefügt wurde und der Besitzer nicht im Büro ist.',
        'Unlocked ticket.' => 'Ticketsperre aufgehoben.',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            '',
        'Updated SLA to %s (ID=%s).' => 'SLA aktualisiert "%s" (ID=%s).',
        'Updated Service to %s (ID=%s).' => 'Service aktualisiert "%s" (ID=%s).',
        'Updated Type to %s (ID=%s).' => 'Typ aktualisiert "%s" (ID=%s).',
        'Updated: %s' => 'Aktualisiert: %s',
        'Updated: %s=%s;%s=%s;%s=%s;' => 'Aktualisiert: %s=%s;%s=%s;%s=%s;',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            'Aktualisiert den Ticket-Eskalations-Index nachdem ein Ticket-Attribut aktualisiert wurde.',
        'Updates the ticket index accelerator.' => 'Aktualisiert den Ticket-Index-Beschleuniger.',
        'Use new type of select and autocomplete fields in agent interface, where applicable (InputFields).' =>
            'Nutzen Sie einen neuen Typ von Auswahl- und Autovervollständigen-Feldern in der Agenten-Schnittstelle, wo sie anwendbar sind (InputFields = Eingabefelder).',
        'Use new type of select and autocomplete fields in customer interface, where applicable (InputFields).' =>
            '',
        'UserFirstname' => 'Benutzervorname',
        'UserLastname' => 'Benutzernachname',
        'Uses Cc recipients in reply Cc list on compose an email answer in the ticket compose screen of the agent interface.' =>
            '',
        'Uses richtext for viewing and editing ticket notification.' => 'Nutzt richtext zum betrachten und bearbeiten von Ticket-Benachrichtigungen.',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard templates, auto responses and notifications.' =>
            'Nutzt richtext zum betrachten und bearbeiten von: Artikeln, Begrüßungen, Signaturen, Standard Vorlagen, Automatische Antworten und Benachrichtigungen.',
        'Vietnam' => 'Vietnamesisch',
        'View performance benchmark results.' => 'Ergebnisse der Leistungsmessung ansehen.',
        'Watch this ticket' => 'Dieses Ticket beobachten',
        'Watched Tickets.' => 'Beobachtete Tickets.',
        'We are performing scheduled maintenance.' => 'Wir führen eine geplante Wartung durch.',
        'We are performing scheduled maintenance. Login is temporarily not available.' =>
            'Wir führen eine geplante Wartung durch. Das Einloggen ist im Moment nicht möglich.',
        'We are performing scheduled maintenance. We should be back online shortly.' =>
            'Wir führen eine geplante Wartung durch. Wir werden bald wieder online sein.',
        'Web View' => 'Webansicht',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the body of this note (this text cannot be changed by the agent).' =>
            'Wenn Tickets zusammengefasst werden, wird automatisch zu dem Ticket, das nicht länger aktiv ist, eine Notiz hinzugefügt. Hier können Sie den Textköper dieser Notiz definieren (dieser Text kann nicht durch den Agent verändert werden).',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the subject of this note (this subject cannot be changed by the agent).' =>
            'Wenn Tickets zusammengefasst werden, wird automatisch zu dem Ticket, das nicht länger aktiv ist, eine Notiz hinzugefügt. Hier können Sie den Gegenstand dieser Notiz definieren (dieser Text kann nicht durch den Agent verändert werden).',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            'Wenn Tickets zusammengefasst werden, kann der Kunde durch Setzen des Kontrollkästchens "Sender informieren" per E-Mail informiert werden. In diesem Bereich können Sie einen vorformatierten Text definieren, der später durch die Agents modifiziert werden kann.',
        'Whether or not to collect meta information from articles using filters configured in Ticket::Frontend::ZoomCollectMetaFilters.' =>
            '',
        'Yes, but hide archived tickets' => 'Ja, aber archivierte Tickets verstecken',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Ihre E-Mail mit Ticket-Nummer "<OTRS_TICKET>" wurde an "<OTRS_BOUNCE_TO>" umgeleitet. Kontaktieren Sie diese Adresse für weitere Informationen.',
        'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.' =>
            'Die Auswahl ihrer bevorzugten (abbonnierten) Queues. Sie werden auch per E-Mail über diese Queues benachrichtigt, wenn die Einstellung aktiv ist.',
        'Your service selection of your preferred services. You also get notified about those services via email if enabled.' =>
            'Auswahl der bevorzugten Services. Es werden E-Mail-Benachrichtigungen über diesen ausgewählten Services versendet, falls aktiviert.',
        'attachment' => 'attachment',
        'bounce' => 'Umleiten',
        'compose' => 'Verfassen',
        'debug' => 'debug',
        'error' => 'error',
        'forward' => 'Weiterleiten',
        'info' => 'info',
        'inline' => 'inline',
        'notice' => 'notice',
        'pending' => 'Warten',
        'responsible' => 'Verantwortlicher',
        'stats' => 'stats',

    };
    # $$STOP$$
    return;
}

1;
