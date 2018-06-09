# --
# Copyright (C) 2006 Gabor Gancs /gg@magicnet.hu/
# Copyright (C) 2006 Krisztian Gancs /krisz@gancs.hu/
# Copyright (C) 2006 Flora Szabo /szaboflora@magicnet.hu/
# Copyright (C) 2007 Aron Ujvari <ujvari@hungary.com>
# Copyright (C) 2009 Arnold Matyasi <arn@webma.hu>
# Copyright (C) 2013 Csaba Németh <csaba@sopron.hu>
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::hu;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # $$START$$
    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%Y-%M-%D %T';
    $Self->{DateFormatLong}      = '%Y. %B %D. %A %T';
    $Self->{DateFormatShort}     = '%Y-%M-%D';
    $Self->{DateInputFormat}     = '%Y-%M-%D';
    $Self->{DateInputFormatLong} = '%Y-%M-%D - %T';
    $Self->{Completeness}        = 0.995120959544623;

    # csv separator
    $Self->{Separator} = ';';

    $Self->{Translation} = {

        # Template: AAABase
        'Yes' => 'Igen',
        'No' => 'Nem',
        'yes' => 'igen',
        'no' => 'nem',
        'Off' => 'Ki',
        'off' => 'ki',
        'On' => 'Be',
        'on' => 'be',
        'top' => 'teteje',
        'end' => 'vége',
        'Done' => 'Kész',
        'Cancel' => 'Mégse',
        'Reset' => 'Visszaállítás',
        'more than ... ago' => 'több mint … ezelőtt',
        'in more than ...' => 'több mint …',
        'within the last ...' => 'az elmúlt … belül',
        'within the next ...' => 'a következő … belül',
        'Created within the last' => 'Létrehozva az elmúlt … belül',
        'Created more than ... ago' => 'Létrehozva több mint … ezelőtt',
        'Today' => 'Ma',
        'Tomorrow' => 'Holnap',
        'Next week' => 'Következő hét',
        'day' => 'nap',
        'days' => 'nap',
        'day(s)' => 'nap',
        'd' => 'n',
        'hour' => 'óra',
        'hours' => 'óra',
        'hour(s)' => 'óra',
        'Hours' => 'Óra',
        'h' => 'ó',
        'minute' => 'perc',
        'minutes' => 'perc',
        'minute(s)' => 'perc',
        'Minutes' => 'Perc',
        'm' => 'p',
        'month' => 'hónap',
        'months' => 'hónap',
        'month(s)' => 'hónap',
        'week' => 'hét',
        'week(s)' => 'hét',
        'quarter' => 'negyedév',
        'quarter(s)' => 'negyedév',
        'half-year' => 'félév',
        'half-year(s)' => 'félév',
        'year' => 'év',
        'years' => 'év',
        'year(s)' => 'év',
        'second(s)' => 'másodperc',
        'seconds' => 'másodperc',
        'second' => 'másodperc',
        's' => 'mp',
        'Time unit' => 'Időegység',
        'wrote' => 'írta',
        'Message' => 'Üzenet',
        'Error' => 'Hiba',
        'Bug Report' => 'Hibajelentés',
        'Attention' => 'Figyelem',
        'Warning' => 'Figyelmeztetés',
        'Module' => 'Modul',
        'Modulefile' => 'Modulfájl',
        'Subfunction' => 'Alfunkció',
        'Line' => 'Sor',
        'Setting' => 'Beállítás',
        'Settings' => 'Beállítások',
        'Example' => 'Példa',
        'Examples' => 'Példa',
        'valid' => 'érvényes',
        'Valid' => 'Érvényes',
        'invalid' => 'érvénytelen',
        'Invalid' => 'Érvénytelen',
        '* invalid' => '* érvénytelen',
        'invalid-temporarily' => 'átmenetileg érvénytelen',
        ' 2 minutes' => ' 2 perc',
        ' 5 minutes' => ' 5 perc',
        ' 7 minutes' => ' 7 perc',
        '10 minutes' => '10 perc',
        '15 minutes' => '15 perc',
        'Mr.' => 'Úr',
        'Mrs.' => 'Úrhölgy',
        'Next' => 'Következő',
        'Back' => 'Vissza',
        'Next...' => 'Következő...',
        '...Back' => '...Vissza',
        '-none-' => '-nincs-',
        'none' => 'nincs',
        'none!' => 'nincs!',
        'none - answered' => 'nincs - megválaszolt',
        'please do not edit!' => 'kérjük ne szerkessze!',
        'Need Action' => 'Beavatkozás szükséges',
        'AddLink' => 'Kapcsolat hozzáadása',
        'Link' => 'Összekapcsolás',
        'Unlink' => 'Kapcsolat törlése',
        'Linked' => 'Összekapcsolt',
        'Link (Normal)' => 'Kapcsolat (normál)',
        'Link (Parent)' => 'Kapcsolat (szülő)',
        'Link (Child)' => 'Kapcsolat (gyermek)',
        'Normal' => 'Normál',
        'Parent' => 'Szülő',
        'Child' => 'Gyermek',
        'Hit' => 'Találat',
        'Hits' => 'Találatok',
        'Text' => 'Szöveg',
        'Standard' => 'Szabványos',
        'Lite' => 'Egyszerű',
        'User' => 'Felhasználó',
        'Username' => 'Felhasználónév',
        'Language' => 'Nyelv',
        'Languages' => 'Nyelvek',
        'Password' => 'Jelszó',
        'Preferences' => 'Beállítások',
        'Salutation' => 'Megszólítás',
        'Salutations' => 'Megszólítások',
        'Signature' => 'Aláírás',
        'Signatures' => 'Aláírások',
        'Customer' => 'Ügyfél',
        'CustomerID' => 'Ügyfél-azonosító',
        'CustomerIDs' => 'Ügyfél-azonosítók',
        'customer' => 'ügyfél',
        'agent' => 'ügyintéző',
        'system' => 'rendszer',
        'Customer Info' => 'Ügyfél-információk',
        'Customer Information' => 'Ügyfél-információk',
        'Customer Companies' => 'Ügyfél-vállalatok',
        'Company' => 'Vállalat',
        'go!' => 'indítás!',
        'go' => 'indítás',
        'All' => 'Összes',
        'all' => 'összes',
        'Sorry' => 'Sajnálom',
        'update!' => 'frissítés!',
        'update' => 'frissítés',
        'Update' => 'Frissítés',
        'Updated!' => 'Frissítve!',
        'submit!' => 'elküldés!',
        'submit' => 'elküldés',
        'Submit' => 'Elküldés',
        'change!' => 'változtatás!',
        'Change' => 'Változtatás',
        'change' => 'változtatás',
        'click here' => 'kattintson ide',
        'Comment' => 'Megjegyzés',
        'Invalid Option!' => 'Érvénytelen beállítás!',
        'Invalid time!' => 'Érvénytelen időpont!',
        'Invalid date!' => 'Érvénytelen dátum!',
        'Name' => 'Név',
        'Group' => 'Csoport',
        'Description' => 'Leírás',
        'description' => 'leírás',
        'Theme' => 'Téma',
        'Created' => 'Létrehozva',
        'Created by' => 'Létrehozta',
        'Changed' => 'Módosítva',
        'Changed by' => 'Módosította',
        'Search' => 'Keresés',
        'and' => 'és',
        'between' => 'között',
        'before/after' => 'előtt/után',
        'Fulltext Search' => 'Szabad-szavas keresés',
        'Data' => 'Adat',
        'Options' => 'Beállítások',
        'Title' => 'Cím',
        'Item' => 'Elem',
        'Delete' => 'Törlés',
        'Edit' => 'Szerkesztés',
        'View' => 'Nézet',
        'Number' => 'Szám',
        'System' => 'Rendszer',
        'Contact' => 'Partner',
        'Contacts' => 'Partnerek',
        'Export' => 'Exportálás',
        'Up' => 'Fel',
        'Down' => 'Le',
        'Add' => 'Hozzáadás',
        'Added!' => 'Hozzáadva!',
        'Category' => 'Kategória',
        'Viewer' => 'Megjelenítő',
        'Expand' => 'Kinyitás',
        'Small' => 'Kicsi',
        'Medium' => 'Közepes',
        'Large' => 'Nagy',
        'Date picker' => 'Dátumválasztó',
        'Show Tree Selection' => 'Fakijelölés megjelenítése',
        'The field content is too long!' => 'A mező tartalma túl hosszú!',
        'Maximum size is %s characters.' => 'A legnagyobb méret %s karakter.',
        'This field is required or' => 'Ez a mező kötelező vagy',
        'New message' => 'Új üzenet',
        'New message!' => 'Új üzenet!',
        'Please answer this ticket(s) to get back to the normal queue view!' =>
            'Válaszoljon ezekre a jegyekre, hogy visszatérhessen a normál várólista nézethez!',
        'You have %s new message(s)!' => 'Önnek %s új üzenete van!',
        'You have %s reminder ticket(s)!' => 'Önnek %s emlékeztető jegye van!',
        'The recommended charset for your language is %s!' => 'Az ajánlott karakterkészlet az ön nyelvénél %s!',
        'Change your password.' => 'Változtassa meg a jelszavát.',
        'Please activate %s first!' => 'Kérjük először aktiválja: %s!',
        'No suggestions' => 'Nincsenek javaslatok',
        'Word' => 'Szó',
        'Ignore' => 'Mellőzés',
        'replace with' => 'csere ezzel',
        'There is no account with that login name.' => 'Azzal a bejelentkező névvel nincs fiók.',
        'Login failed! Your user name or password was entered incorrectly.' =>
            'Sikertelen bejelentkezés! A megadott felhasználónév vagy jelszó hibás.',
        'There is no acount with that user name.' => 'Azzal a bejelentkező névvel nincs fiók.',
        'Please contact your administrator' => 'Vegye fel a kapcsolatot a rendszergazdával',
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact your administrator.' =>
            'A hitelesítés sikerült, de nem található ügyfélrekord az ügyfél háttérprogramban. Vegye fel a kapcsolatot a rendszergazdával.',
        'This e-mail address already exists. Please log in or reset your password.' =>
            'Ez az e-mail cím már létezik. Jelentkezzen be, vagy állítsa vissza a jelszavát.',
        'Logout' => 'Kilépés',
        'Logout successful. Thank you for using %s!' => 'Sikeres kilépés. Köszönjük, hogy a(z) %s használatát választotta!',
        'Feature not active!' => 'A funkció nem aktív!',
        'Agent updated!' => 'Ügyintéző frissítve!',
        'Database Selection' => 'Adatbázis-kijelölés',
        'Create Database' => 'Adatbázis létrehozása',
        'System Settings' => 'Rendszerbeállítások',
        'Mail Configuration' => 'Levelezési beállítások',
        'Finished' => 'Befejezve',
        'Install OTRS' => 'OTRS telepítése',
        'Intro' => 'Bevezetés',
        'License' => 'Licenc',
        'Database' => 'Adatbázis',
        'Configure Mail' => 'Levelezés beállítása',
        'Database deleted.' => 'Adatbázis törölve.',
        'Enter the password for the administrative database user.' => 'Adja meg az adatbázis adminisztrátor felhasználó jelszavát.',
        'Enter the password for the database user.' => 'Adja meg az adatbázis felhasználó jelszavát.',
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty.' =>
            'Ha az adatbázishoz rendszergazda jelszót állított be, akkor azt itt meg kell adni. Ha nem, hagyja üresen ezt a mezőt.',
        'Database already contains data - it should be empty!' => 'Az adatbázis már tartalmaz adatokat - üresnek kell lennie!',
        'Login is needed!' => 'Belépés szükséges!',
        'It is currently not possible to login due to a scheduled system maintenance.' =>
            'Jelenleg nem lehetséges bejelentkezni ütemezett rendszerkarbantartás miatt.',
        'Password is needed!' => 'Jelszó szükséges!',
        'Take this Customer' => 'Az ügyfél átvétele',
        'Take this User' => 'A felhasználó átvétele',
        'possible' => 'lehetséges',
        'reject' => 'elutasítás',
        'reverse' => 'megfordítás',
        'Facility' => 'Képesség',
        'Time Zone' => 'Időzóna',
        'Pending till' => 'Várakozás eddig',
        'Don\'t use the Superuser account to work with OTRS! Create new Agents and work with these accounts instead.' =>
            'Ne használja a rendszergazda fiókot az OTRS-sel! Hozzon létre új ügyintézőket és azokkal a fiókokkal dolgozzon inkább.',
        'Dispatching by email To: field.' => 'Szétválogatás az e-mail címzett mezője szerint.',
        'Dispatching by selected Queue.' => 'Szétválogatás a kiválasztott várólista szerint.',
        'No entry found!' => 'Nem található bejegyzés!',
        'Session invalid. Please log in again.' => 'A munkamenet érvénytelen. Jelentkezzen be újra.',
        'Session has timed out. Please log in again.' => 'A munkamenet túllépte az időkorlátot. Jelentkezzen be újra.',
        'Session limit reached! Please try again later.' => 'A munkamenetkorlát elérve! Próbálkozzon később.',
        'No Permission!' => 'Nincs jogosultság!',
        '(Click here to add)' => '(Kattintson ide a hozzáadáshoz)',
        'Preview' => 'Előnézet',
        'Package not correctly deployed! Please reinstall the package.' =>
            'A csomag nincs rendesen üzembe állítva! Telepítse újra a csomagot.',
        '%s is not writable!' => 'A(z) %s nem írható!',
        'Cannot create %s!' => 'Nem sikerült a(z) %s létrehozása!',
        'Check to activate this date' => 'Jelölje be a dátum aktiválásához',
        'You have Out of Office enabled, would you like to disable it?' =>
            'Engedélyezte az Irodán kívül funkciót, szeretné letiltani azt?',
        'News about OTRS releases!' => 'Az OTRS kiadásaival kapcsolatos hírek!',
        'Go to dashboard!' => 'Ugrás a vezérlőpultra!',
        'Customer %s added' => '%s ügyfél hozzáadva',
        'Role added!' => 'Szerep hozzáadva!',
        'Role updated!' => 'Szerep frissítve!',
        'Attachment added!' => 'Melléklet hozzáadva!',
        'Attachment updated!' => 'Melléklet frissítve!',
        'Response added!' => 'Válasz hozzáadva!',
        'Response updated!' => 'Válasz frissítve!',
        'Group updated!' => 'Csoport frissítve!',
        'Queue added!' => 'Várólista hozzáadva!',
        'Queue updated!' => 'Várólista frissítve!',
        'State added!' => 'Állapot hozzáadva!',
        'State updated!' => 'Állapot frissítve!',
        'Type added!' => 'Típus hozzáadva!',
        'Type updated!' => 'Típus frissítve!',
        'Customer updated!' => 'Ügyfél frissítve!',
        'Customer company added!' => 'Ügyfél-vállalat hozzáadva!',
        'Customer company updated!' => 'Ügyfél-vállalat frissítve!',
        'Note: Company is invalid!' => 'Megjegyzés: a vállalat érvénytelen!',
        'Mail account added!' => 'Levelezőfiók hozzáadva!',
        'Mail account updated!' => 'Levelezőfiók frissítve!',
        'System e-mail address added!' => 'Rendszer e-mail cím hozzáadva!',
        'System e-mail address updated!' => 'Rendszer e-mail cím frissítve!',
        'Contract' => 'Szerződés',
        'Online Customer: %s' => 'Bejelentkezett ügyfél: %s',
        'Online Agent: %s' => 'Bejelentkezett ügyintéző: %s',
        'Calendar' => 'Naptár',
        'File' => 'Fájl',
        'Filename' => 'Fájlnév',
        'Type' => 'Típus',
        'Size' => 'Méret',
        'Upload' => 'Feltöltés',
        'Directory' => 'Könyvtár',
        'Signed' => 'Aláírt',
        'Sign' => 'Aláírás',
        'Crypted' => 'Kódolt',
        'Crypt' => 'Kódolás',
        'PGP' => 'PGP',
        'PGP Key' => 'PGP kulcs',
        'PGP Keys' => 'PGP kulcsok',
        'S/MIME' => 'S/MIME',
        'S/MIME Certificate' => 'S/MIME tanúsítvány',
        'S/MIME Certificates' => 'S/MIME tanúsítványok',
        'Office' => 'Iroda',
        'Phone' => 'Telefon',
        'Fax' => 'Fax',
        'Mobile' => 'Mobiltelefon',
        'Zip' => 'Irányítószám',
        'City' => 'Város',
        'Street' => 'Utca',
        'Country' => 'Ország',
        'Location' => 'Hely',
        'installed' => 'telepített',
        'uninstalled' => 'eltávolított',
        'Security Note: You should activate %s because application is already running!' =>
            'Biztonsági megjegyzés: A(z) %s aktiválása kellene, mert az alkalmazás már fut!',
        'Unable to parse repository index document.' => 'Nem sikerült feldolgozni a tároló index dokumentumot.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'Ebben a tárolóban nem találhatók csomagok a keretrendszer verziójához, csak más keretrendszer verziókhoz való csomagokat tartalmaz.',
        'No packages, or no new packages, found in selected repository.' =>
            'Nincsenek csomagok vagy nem találhatók új csomagok a kijelölt tárolóban.',
        'Edit the system configuration settings.' => 'A rendszer konfigurációs beállításainak szerkesztése.',
        'ACL information from database is not in sync with the system configuration, please deploy all ACLs.' =>
            'Az adatbázis ACL információi nincsenek szinkronizálva a rendszer beállításaival, állítson üzembe minden ACL-t.',
        'printed at' => 'nyomtatva',
        'Loading...' => 'Betöltés…',
        'Dear Mr. %s,' => 'Tisztelt %s Úr!',
        'Dear Mrs. %s,' => 'Tisztelt %s Úrhölgy!',
        'Dear %s,' => 'Tisztelt %s!',
        'Hello %s,' => 'Helló %s!',
        'This email address is not allowed to register. Please contact support staff.' =>
            'Ez az e-mail cím nem megengedett a regisztráláshoz. Vegye fel a kapcsolatot a támogató csapattal.',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Az új fiók létrehozva. A bejelentkezési információkat elküldtük erre a címre: %s. Nézze meg a leveleit.',
        'Please press Back and try again.' => 'Nyomja meg a Vissza gombot, és próbálja újra.',
        'Sent password reset instructions. Please check your email.' => 'A jelszó visszaállítási utasítások elküldve. Nézze meg a leveleit.',
        'Sent new password to %s. Please check your email.' => 'Az új jelszó elküldve erre a címre: %s. Nézze meg a leveleit.',
        'Upcoming Events' => 'Közelgő események',
        'Event' => 'Esemény',
        'Events' => 'Események',
        'Invalid Token!' => 'Érvénytelen token!',
        'more' => 'tovább',
        'Collapse' => 'Összecsukás',
        'Shown' => 'Megjelenített',
        'Shown customer users' => 'Megjelenített ügyfél-felhasználók',
        'News' => 'Hírek',
        'Product News' => 'Termék hírek',
        'OTRS News' => 'OTRS hírek',
        '7 Day Stats' => '7 napos statisztika',
        'Process Management information from database is not in sync with the system configuration, please synchronize all processes.' =>
            'Az adatbázis folyamatkezelő információi nincsenek szinkronizálva a rendszer beállításaival, szinkronizáljon minden folyamatot.',
        'Package not verified by the OTRS Group! It is recommended not to use this package.' =>
            'A csomagot nem ellenőrizte az OTRS csoport! Nem javasolt a csomag használata.',
        '<br>If you continue to install this package, the following issues may occur!<br><br>&nbsp;-Security problems<br>&nbsp;-Stability problems<br>&nbsp;-Performance problems<br><br>Please note that issues that are caused by working with this package are not covered by OTRS service contracts!<br><br>' =>
            '<br>Ha folytatja a csomag telepítését, a következő hibák fordulhatnak elő!<br><br>&nbsp;- biztonsági problémák<br>&nbsp;- stabilitási problémák<br>&nbsp;- teljesítmény problémák<br><br>Vegye figyelembe, hogy a csomag használata során felmerülő problémákra nem vonatkozik az OTRS szolgáltatási szerződése!<br><br>',
        'Mark' => 'Megjelölés',
        'Unmark' => 'Megjelölés megszüntetése',
        'Bold' => 'Félkövér',
        'Italic' => 'Dőlt',
        'Underline' => 'Aláhúzott',
        'Font Color' => 'Betűszín',
        'Background Color' => 'Háttérszín',
        'Remove Formatting' => 'Formázás eltávolítása',
        'Show/Hide Hidden Elements' => 'Rejtett elemek megjelenítése/elrejtése',
        'Align Left' => 'Balra igazítás',
        'Align Center' => 'Középre igazítás',
        'Align Right' => 'Jobbra igazítás',
        'Justify' => 'Sorkizárt',
        'Header' => 'Fejléc',
        'Indent' => 'Behúzás növelése',
        'Outdent' => 'Behúzás csökkentése',
        'Create an Unordered List' => 'Felsorolás létrehozása',
        'Create an Ordered List' => 'Számozott lista létrehozása',
        'HTML Link' => 'HTML hivatkozás',
        'Insert Image' => 'Kép beszúrása',
        'CTRL' => 'CRTL',
        'SHIFT' => 'SHIFT',
        'Undo' => 'Visszavonás',
        'Redo' => 'Újra',
        'OTRS Daemon is not running.' => 'Az OTRS démon nem fut.',
        'Can\'t contact registration server. Please try again later.' => 'Nem sikerült elérni a regisztrációs kiszolgálót. Próbálkozzon később.',
        'No content received from registration server. Please try again later.' =>
            'Nem érkezett tartalom a regisztrációs kiszolgálótól. Próbálkozzon később.',
        'Problems processing server result. Please try again later.' => 'Hiba a kiszolgáló eredményének feldolgozásakor. Próbálkozzon később.',
        'Username and password do not match. Please try again.' => 'A felhasználónév és a jelszó nem egyezik. Próbálja újra.',
        'The selected process is invalid!' => 'A kiválasztott folyamat érvénytelen!',
        'Upgrade to %s now!' => 'Frissítés a következőre most: %s!',
        '%s Go to the upgrade center %s' => '%s Ugrás a frissítési központhoz %s',
        'The license for your %s is about to expire. Please make contact with %s to renew your contract!' =>
            'Az Ön %s licence hamarosan lejár. A szerződés megújításához vegye fel a kapcsolatot a következővel: %s!',
        'An update for your %s is available, but there is a conflict with your framework version! Please update your framework first!' =>
            'Frissítés érhető el az Ön %s telepítéséhez, de ütközés van a keretrendszer verziójával! Először a keretrendszert frissítse!',
        'Your system was successfully upgraded to %s.' => 'A rendszere sikeresen frissítve lett a következő verzióra: %s.',
        'There was a problem during the upgrade to %s.' => 'Hiba történt a(z) %s verzióra való frissítés közben.',
        '%s was correctly reinstalled.' => 'A(z) %s rendben újra lett telepítve.',
        'There was a problem reinstalling %s.' => 'Hiba történt a(z) %s újratelepítésekor.',
        'Your %s was successfully updated.' => 'A(z) %s sikeresen frissítve lett.',
        'There was a problem during the upgrade of %s.' => 'Hiba történt a(z) %s frissítése közben.',
        '%s was correctly uninstalled.' => 'A(z) %s rendben el lett távolítva.',
        'There was a problem uninstalling %s.' => 'Hiba történt a(z) %s eltávolításakor.',
        'Enable cloud services to unleash all OTRS features!' => 'Engedélyezze a felhőszolgáltatásokat az összes OTRS funkció feloldásához!',

        # Template: AAACalendar
        'New Year\'s Day' => 'Újév',
        'International Workers\' Day' => 'A munka ünnepe',
        'Christmas Eve' => 'Szenteste',
        'First Christmas Day' => 'Karácsony első napja',
        'Second Christmas Day' => 'Karácsony második napja',
        'New Year\'s Eve' => 'Szilveszter',

        # Template: AAAGenericInterface
        'OTRS as requester' => 'OTRS mint kérelmező',
        'OTRS as provider' => 'OTRS mint szolgáltató',
        'Webservice "%s" created!' => 'A(z) „%s” webszolgáltatás létrehozva!',
        'Webservice "%s" updated!' => 'A(z) „%s” webszolgáltatás frissítve!',

        # Template: AAAMonth
        'Jan' => 'jan.',
        'Feb' => 'febr.',
        'Mar' => 'márc.',
        'Apr' => 'ápr.',
        'May' => 'máj.',
        'Jun' => 'jún.',
        'Jul' => 'júl.',
        'Aug' => 'aug.',
        'Sep' => 'szept.',
        'Oct' => 'okt.',
        'Nov' => 'nov.',
        'Dec' => 'dec.',
        'January' => 'január',
        'February' => 'február',
        'March' => 'március',
        'April' => 'április',
        'May_long' => 'május',
        'June' => 'június',
        'July' => 'július',
        'August' => 'augusztus',
        'September' => 'szeptember',
        'October' => 'október',
        'November' => 'november',
        'December' => 'december',

        # Template: AAAPreferences
        'Preferences updated successfully!' => 'A beállítások sikeresen frissítve!',
        'User Profile' => 'Felhasználói profil',
        'Email Settings' => 'E-mail beállítások',
        'Other Settings' => 'Egyéb beállítások',
        'Notification Settings' => 'Értesítési beállítások',
        'Change Password' => 'Jelszó megváltoztatása',
        'Current password' => 'Jelenlegi jelszó',
        'New password' => 'Új jelszó',
        'Verify password' => 'Jelszó ellenőrzése',
        'Spelling Dictionary' => 'Helyesírás-ellenőrző szótár',
        'Default spelling dictionary' => 'Alapértelmezett helyesírás-ellenőrző szótár',
        'Max. shown Tickets a page in Overview.' => 'Egy oldalon megjelenített legtöbb jegy az áttekintőben.',
        'The current password is not correct. Please try again!' => 'A jelenlegi jelszó nem helyes. Próbálja újra.',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Nem lehet frissíteni a jelszót, az új jelszavak nem egyeznek. Próbálja újra!',
        'Can\'t update password, it contains invalid characters!' => 'Nem lehet frissíteni a jelszót, érvénytelen karaktereket tartalmaz!',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Nem lehet frissíteni a jelszót, legalább %s karakter hosszúnak kell lennie!',
        'Can\'t update password, it must contain at least 2 lowercase and 2 uppercase characters!' =>
            'Nem lehet frissíteni a jelszót, legalább 2 kisbetűt és 2 nagybetűt kell tartalmaznia!',
        'Can\'t update password, it must contain at least 1 digit!' => 'Nem lehet frissíteni a jelszót, legalább 1 számjegyet kell tartalmaznia!',
        'Can\'t update password, it must contain at least 2 characters!' =>
            'Nem lehet frissíteni a jelszót, legalább 2 betűt kell tartalmaznia!',
        'Can\'t update password, this password has already been used. Please choose a new one!' =>
            'Nem lehet frissíteni a jelszót, ez a jelszó már használatban van. Válasszon egy újat!',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Válassza ki a CSV fájlokban (statisztikák és keresések) használt elválasztó karaktert. Ha nem választ ki elválasztót itt, a nyelvének megfelelő alapértelmezett elválasztó lesz használva.',
        'CSV Separator' => 'CSV elválasztó',

        # Template: AAATicket
        'Status View' => 'Állapot nézet',
        'Service View' => 'Szolgáltatás nézet',
        'Bulk' => 'Tömeges',
        'Lock' => 'Zárolás',
        'Unlock' => 'Feloldás',
        'History' => 'Előzmények',
        'Zoom' => 'Részletek',
        'Age' => 'Időtartam',
        'Bounce' => 'Átirányítás',
        'Forward' => 'Továbbítás',
        'From' => 'Feladó',
        'To' => 'Címzett',
        'Cc' => 'Másolat',
        'Bcc' => 'Titkos másolat',
        'Subject' => 'Tárgy',
        'Move' => 'Áthelyezés',
        'Queue' => 'Várólista',
        'Queues' => 'Várólisták',
        'Priority' => 'Prioritás',
        'Priorities' => 'Prioritások',
        'Priority Update' => 'Prioritás frissítése',
        'Priority added!' => 'Prioritás hozzáadva!',
        'Priority updated!' => 'Prioritás frissítve!',
        'Signature added!' => 'Aláírás hozzáadva!',
        'Signature updated!' => 'Aláírás frissítve!',
        'SLA' => 'SLA',
        'Service Level Agreement' => 'Szolgáltatási szint megállapodás',
        'Service Level Agreements' => 'Szolgáltatási szint megállapodások',
        'Service' => 'Szolgáltatás',
        'Services' => 'Szolgáltatások',
        'State' => 'Állapot',
        'States' => 'Állapotok',
        'Status' => 'Állapot',
        'Statuses' => 'Állapotok',
        'Ticket Type' => 'Jegytípus',
        'Ticket Types' => 'Jegytípusok',
        'Compose' => 'Válasz',
        'Pending' => 'Függőben',
        'Owner' => 'Tulajdonos',
        'Owner Update' => 'Tulajdonos frissítése',
        'Responsible' => 'Felelős',
        'Responsible Update' => 'Felelős frissítése',
        'Sender' => 'Küldő',
        'Article' => 'Bejegyzés',
        'Ticket' => 'Jegy',
        'Createtime' => 'Létrehozás ideje',
        'plain' => 'egyszerű',
        'Email' => 'E-mail',
        'email' => 'e-mail',
        'Close' => 'Lezárás',
        'Action' => 'Művelet',
        'Attachment' => 'Melléklet',
        'Attachments' => 'Mellékletek',
        'This message was written in a character set other than your own.' =>
            'Ezt az üzenetet más karakterkészlettel írták mint amit ön használ.',
        'If it is not displayed correctly,' => 'Ha ez nem helyesen jelent meg,',
        'This is a' => 'Ez egy',
        'to open it in a new window.' => 'hogy megnyissa új ablakban.',
        'This is a HTML email. Click here to show it.' => 'Ez egy HTML e-mail. Kattintson ide a megtekintéshez.',
        'Free Fields' => 'Szabad mezők',
        'Merge' => 'Egyesítés',
        'merged' => 'egyesített',
        'closed successful' => 'sikeresen lezárva',
        'closed unsuccessful' => 'sikertelenül lezárva',
        'Locked Tickets Total' => 'Zárolt jegyek (összes)',
        'Locked Tickets Reminder Reached' => 'Zárolt jegyek (emlékeztető elérve)',
        'Locked Tickets New' => 'Zárolt jegyek (új)',
        'Responsible Tickets Total' => 'Felelős jegyek (összes)',
        'Responsible Tickets New' => 'Felelős jegyek (új)',
        'Responsible Tickets Reminder Reached' => 'Felelős jegyek (emlékeztető elérve)',
        'Watched Tickets Total' => 'Megfigyelt jegyek (összes)',
        'Watched Tickets New' => 'Megfigyelt jegyek (új)',
        'Watched Tickets Reminder Reached' => 'Megfigyelt jegyek (emlékeztető elérve)',
        'All tickets' => 'Összes jegy',
        'Available tickets' => 'Elérhető jegyek',
        'Escalation' => 'Eszkaláció',
        'last-search' => 'utolsó-keresés',
        'QueueView' => 'Várólista nézet',
        'Ticket Escalation View' => 'Jegy eszkaláció nézet',
        'Message from' => 'Üzenet tőle',
        'End message' => 'Üzenet vége',
        'Forwarded message from' => 'Továbbított üzenet tőle',
        'End forwarded message' => 'Továbbított üzenet vége',
        'Bounce Article to a different mail address' => 'Bejegyzés átirányítása egy másik e-mail címre',
        'Reply to note' => 'Válasz a jegyzetre',
        'new' => 'új',
        'open' => 'nyitott',
        'Open' => 'Nyitott',
        'Open tickets' => 'Nyitott jegyek',
        'closed' => 'lezárva',
        'Closed' => 'Lezárva',
        'Closed tickets' => 'Lezárt jegyek',
        'removed' => 'eltávolított',
        'pending reminder' => 'emlékeztető függőben',
        'pending auto' => 'automatikus függőben',
        'pending auto close+' => 'automatikus lezárás függőben+',
        'pending auto close-' => 'automatikus lezárás függőben-',
        'email-external' => 'külső e-mail',
        'email-internal' => 'belső e-mail',
        'note-external' => 'külső jegyzet',
        'note-internal' => 'belső jegyzet',
        'note-report' => 'jegyzet jelentés',
        'phone' => 'telefon',
        'sms' => 'SMS',
        'webrequest' => 'webkérés',
        'lock' => 'zárolt',
        'unlock' => 'feloldott',
        'very low' => 'nagyon alacsony',
        'low' => 'alacsony',
        'normal' => 'normál',
        'high' => 'magas',
        'very high' => 'nagyon magas',
        '1 very low' => '1 nagyon alacsony',
        '2 low' => '2 alacsony',
        '3 normal' => '3 normál',
        '4 high' => '4 magas',
        '5 very high' => '5 nagyon magas',
        'auto follow up' => 'automatikus követés',
        'auto reject' => 'automatikus elutasítás',
        'auto remove' => 'automatikus eltávolítás',
        'auto reply' => 'automatikus válasz',
        'auto reply/new ticket' => 'automatikus válasz/új jegy',
        'Create' => 'Létrehozás',
        'Answer' => 'Válasz',
        'Phone call' => 'Telefonhívás',
        'Ticket "%s" created!' => 'Jegy létrehozva: „%s”!',
        'Ticket Number' => 'Jegyszám',
        'Ticket Object' => 'Jegyobjektum',
        'No such Ticket Number "%s"! Can\'t link it!' => 'Nincs „%s” számú jegy! Nem lehet összekapcsolni!',
        'You don\'t have write access to this ticket.' => 'Nincs írási joga ehhez a jegyhez.',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'Sajnáljuk, a jegy tulajdonosának kell lennie a művelet végrehajtásához.',
        'Please change the owner first.' => 'Először változtassa meg a tulajdonost.',
        'Ticket selected.' => 'Kijelölt jegy.',
        'Ticket is locked by another agent.' => 'A jegyet egy másik ügyintéző zárolta.',
        'Ticket locked.' => 'Zárolt jegy.',
        'Don\'t show closed Tickets' => 'Ne jelenítse meg a lezárt jegyeket.',
        'Show closed Tickets' => 'Lezárt jegyek megtekintése',
        'New Article' => 'Új bejegyzés',
        'Unread article(s) available' => 'Olvasatlan bejegyzések érhetők el',
        'Remove from list of watched tickets' => 'Eltávolítás a megfigyelt jegyek listájáról',
        'Add to list of watched tickets' => 'Hozzáadás a megfigyelt jegyek listájához',
        'Email-Ticket' => 'E-mail jegy',
        'Create new Email Ticket' => 'Új e-mail jegy létrehozása',
        'Phone-Ticket' => 'Telefonos jegy',
        'Search Tickets' => 'Jegyek keresése',
        'Customer Realname' => 'Ügyfél valódi neve',
        'Customer History' => 'Ügyfél előzmények',
        'Edit Customer Users' => 'Ügyfél-felhasználók szerkesztése',
        'Edit Customer' => 'Ügyfél szerkesztése',
        'Bulk Action' => 'Tömeges művelet',
        'Bulk Actions on Tickets' => 'Tömeges művelet a jegyeken',
        'Send Email and create a new Ticket' => 'E-mail küldése és új jegy létrehozása',
        'Create new Email Ticket and send this out (Outbound)' => 'Új e-mail jegy létrehozása és kiküldése (kimenő)',
        'Create new Phone Ticket (Inbound)' => 'Új telefonos jegy létrehozása (bejövő)',
        'Address %s replaced with registered customer address.' => 'A(z) %s cím kicserélve a regisztrált ügyfél címével.',
        'Customer user automatically added in Cc.' => 'Az ügyfél-felhasználó automatikusan hozzáadva a másolati mezőhöz.',
        'Overview of all open Tickets' => 'Összes nyitott jegy áttekintése',
        'Locked Tickets' => 'Zárolt jegyek',
        'My Locked Tickets' => 'Saját zárolt jegyek',
        'My Watched Tickets' => 'Saját megfigyelt jegyek',
        'My Responsible Tickets' => 'Saját felelős jegyek',
        'Watched Tickets' => 'Megfigyelt jegyek',
        'Watched' => 'Megfigyelt',
        'Watch' => 'Megfigyelés',
        'Unwatch' => 'Leiratkozás',
        'Lock it to work on it' => 'Zárolás a rajta végzett munkához',
        'Unlock to give it back to the queue' => 'Feloldás a várakozási sorba való visszarakáshoz',
        'Show the ticket history' => 'Jegy előzményeinek megjelenítése',
        'Print this ticket' => 'Jegy nyomtatása',
        'Print this article' => 'Bejegyzés nyomtatása',
        'Split' => 'Felosztás',
        'Split this article' => 'Bejegyzés felosztása',
        'Forward article via mail' => 'Bejegyzés továbbítása levélben',
        'Change the ticket priority' => 'Jegy prioritásának módosítása',
        'Change the ticket free fields!' => 'Módosítsa a jegy szabad mezőit!',
        'Link this ticket to other objects' => 'Jegy összekapcsolása más objektumokkal',
        'Change the owner for this ticket' => 'Tulajdonos módosítása ennél a jegynél',
        'Change the  customer for this ticket' => 'Ügyfél módosítása ennél a jegynél',
        'Add a note to this ticket' => 'Jegyzet hozzáadása a jegyhez',
        'Merge into a different ticket' => 'Egyesítés egy másik jeggyel',
        'Set this ticket to pending' => 'Jegy beállítása függőre',
        'Close this ticket' => 'Jegy lezárása',
        'Look into a ticket!' => 'Tekintsen bele egy jegybe!',
        'Delete this ticket' => 'Jegy törlése',
        'Mark as Spam!' => 'Megjelölés szemétként!',
        'My Queues' => 'Saját várólisták',
        'Shown Tickets' => 'Megjelenített jegyek',
        'Shown Columns' => 'Megjelenített oszlopok',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Az Ön „<OTRS_TICKET>” jegyszámú levele egyesítve lett a következővel: „<OTRS_MERGE_TO_TICKET>”.',
        'Ticket %s: first response time is over (%s)!' => '%s jegy: az első válaszidő lejárt (%s)!',
        'Ticket %s: first response time will be over in %s!' => '%s jegy: az első válaszidő le fog járni %s időn belül!',
        'Ticket %s: update time is over (%s)!' => '%s jegy: a frissítés ideje lejárt (%s)!',
        'Ticket %s: update time will be over in %s!' => '%s jegy: a frissítés ideje le fog járni %s időn belül!',
        'Ticket %s: solution time is over (%s)!' => '%s jegy: a megoldás ideje lejárt (%s)!',
        'Ticket %s: solution time will be over in %s!' => '%s jegy: a megoldás ideje le fog járni %s időn belül!',
        'There are more escalated tickets!' => 'Több eszkalált jegy van!',
        'Plain Format' => 'Egyszerű formátum',
        'Reply All' => 'Válasz mindenkinek',
        'Direction' => 'Irány',
        'New ticket notification' => 'Új jegy értesítés',
        'Send me a notification if there is a new ticket in "My Queues".' =>
            'Küldjön egy értesítést, ha új jegy van a „Saját várólistámban”.',
        'Send new ticket notifications' => 'Új jegy értesítések küldése',
        'Ticket follow up notification' => 'Jegy követési értesítés',
        'Send me a notification if a customer sends a follow up and I\'m the owner of the ticket or the ticket is unlocked and is in one of my subscribed queues.' =>
            'Küldjön egy értesítést, ha egy ügyfél követést küld és én vagyok a jegy tulajdonosa, vagy a jegy feloldott és a feliratkozott várólistáim egyikében van.',
        'Send ticket follow up notifications' => 'Jegy követési értesítések küldése',
        'Ticket lock timeout notification' => 'Jegyzárolási időkorlát értesítés',
        'Send me a notification if a ticket is unlocked by the system.' =>
            'Küldjön egy értesítést, ha egy jegyet feloldott a rendszer.',
        'Send ticket lock timeout notifications' => 'Jegyzárolási időkorlát értesítések küldése',
        'Ticket move notification' => 'Jegy áthelyezési értesítés',
        'Send me a notification if a ticket is moved into one of "My Queues".' =>
            'Küldjön egy értesítést, ha egy jegyet a „Saját várólistáim” egyikébe helyeztek át.',
        'Send ticket move notifications' => 'Jegy áthelyezési értesítések küldése',
        'Your queue selection of your favourite queues. You also get notified about those queues via email if enabled.' =>
            'Az előnyben részesített várólistáknak a várólista kiválasztása. Értesítést is kaphat azokról a várólistákról e-mailben, ha engedélyezve van.',
        'Custom Queue' => 'Egyéni várólista',
        'QueueView refresh time' => 'Várólista nézet frissítési ideje',
        'If enabled, the QueueView will automatically refresh after the specified time.' =>
            'Ha engedélyezve van, a várólista nézet automatikusan frissítve lesz egy megadott idő után.',
        'Refresh QueueView after' => 'Várólista nézet frissítése ennyi idő után',
        'Screen after new ticket' => 'Új jegy utáni képernyő',
        'Show this screen after I created a new ticket' => 'Ezen képernyő megjelenítése egy új jegy létrehozása után',
        'Closed Tickets' => 'Lezárt jegyek',
        'Show closed tickets.' => 'Lezárt jegyek megjelenítése.',
        'Max. shown Tickets a page in QueueView.' => 'Az egy lapon megjelenített jegyek számának maximuma várólista nézetben.',
        'Ticket Overview "Small" Limit' => '„Kis” jegyáttekintés korlát',
        'Ticket limit per page for Ticket Overview "Small"' => 'Oldalankénti jegykorlát a „Kis” jegyáttekintéshez',
        'Ticket Overview "Medium" Limit' => '„Közepes” jegyáttekintés korlát',
        'Ticket limit per page for Ticket Overview "Medium"' => 'Oldalankénti jegykorlát a „Közepes” jegyáttekintéshez',
        'Ticket Overview "Preview" Limit' => '„Előnézet” jegyáttekintés korlát',
        'Ticket limit per page for Ticket Overview "Preview"' => 'Oldalankénti jegykorlát az „Előnézet” jegyáttekintéshez',
        'Ticket watch notification' => 'Jegy megfigyelési értesítés',
        'Send me the same notifications for my watched tickets that the ticket owners will get.' =>
            'Ugyanazokat az értesítéseket küldje el nekem a megfigyelt jegyeimhez, amelyeket a jegy tulajdonosa fog kapni.',
        'Send ticket watch notifications' => 'Jegy megfigyelési értesítések küldése',
        'Out Of Office Time' => 'Irodán kívüli idő',
        'New Ticket' => 'Új jegy',
        'Create new Ticket' => 'Új jegy létrehozása',
        'Customer called' => 'Ügyfél telefonált',
        'phone call' => 'telefonhívás',
        'Phone Call Outbound' => 'Kimenő telefonhívás',
        'Phone Call Inbound' => 'Bejövő telefonhívás',
        'Reminder Reached' => 'Emlékeztető elérve',
        'Reminder Tickets' => 'Emlékeztető jegyek',
        'Escalated Tickets' => 'Eszkalált jegyek',
        'New Tickets' => 'Új jegyek',
        'Open Tickets / Need to be answered' => 'Nyitott jegyek / Válaszra várnak',
        'All open tickets, these tickets have already been worked on, but need a response' =>
            'Minden nyitott jegy, ezeken a jegyeken már dolgoztak, de válaszra várnak',
        'All new tickets, these tickets have not been worked on yet' => 'Minden új jegy, ezeken a jegyeken még nem dolgoztak',
        'All escalated tickets' => 'Minden eszkalált jegy',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Minden emlékeztetővel beállított jegy, ahol az emlékeztető dátuma lejárt',
        'Archived tickets' => 'Archivált jegyek',
        'Unarchived tickets' => 'Archiválatlan jegyek',
        'Ticket Information' => 'Jegyinformációk',
        'including subqueues' => 'alvárólisták felvétele',
        'excluding subqueues' => 'alvárólisták kizárása',

        # Template: AAAWeekDay
        'Sun' => 'v',
        'Mon' => 'h',
        'Tue' => 'k',
        'Wed' => 'sze',
        'Thu' => 'cs',
        'Fri' => 'p',
        'Sat' => 'szo',

        # Template: AdminACL
        'ACL Management' => 'ACL kezelés',
        'Filter for ACLs' => 'Szűrő az ACL-ekhez',
        'Filter' => 'Szűrő',
        'ACL Name' => 'ACL név',
        'Actions' => 'Műveletek',
        'Create New ACL' => 'Új ACL létrehozása',
        'Deploy ACLs' => 'ACL-ek üzembe állítása',
        'Export ACLs' => 'ACL-ek exportálása',
        'Configuration import' => 'Beállítás importálás',
        'Here you can upload a configuration file to import ACLs to your system. The file needs to be in .yml format as exported by the ACL editor module.' =>
            'Itt tud egy beállítófájlt feltölteni az ACL-ek importálásához a rendszerre. A fájlnak .yml formátumban kell lennie, ahogy az ACL szerkesztőmodul exportálta.',
        'This field is required.' => 'Ez a mező kötelező.',
        'Overwrite existing ACLs?' => 'Felülírja a meglévő ACL-eket?',
        'Upload ACL configuration' => 'ACL beállítás feltöltése',
        'Import ACL configuration(s)' => 'ACL beállítások importálása',
        'To create a new ACL you can either import ACLs which were exported from another system or create a complete new one.' =>
            'Egy új ACL létrehozásához importálhat másik rendszerből exportált ACL-eket, vagy létrehozhat egy teljesen újat.',
        'Changes to the ACLs here only affect the behavior of the system, if you deploy the ACL data afterwards. By deploying the ACL data, the newly made changes will be written to the configuration.' =>
            'Az ACL-eken itt elvégzett változások csak akkor lesznek hatással a rendszer viselkedésére, ha azután üzembe állítja az ACL adatokat. Az ACL adatok üzembe állításával az újonnan elvégzett módosítások be lesznek írva a beállításokba.',
        'ACLs' => 'ACL-ek',
        'Please note: This table represents the execution order of the ACLs. If you need to change the order in which ACLs are executed, please change the names of the affected ACLs.' =>
            'Ne feledje: Ez a táblázat az ACL-ek végrehajtási sorrendjét tünteti fel. Ha módosítani kell az ACL-ek végrehajtási sorrendjén, változtassa meg az érintett ACL-ek neveit.',
        'ACL name' => 'ACL név',
        'Validity' => 'Érvényesség',
        'Copy' => 'Másolás',
        'No data found.' => 'Nem található adat',

        # Template: AdminACLEdit
        'Edit ACL %s' => '%s ACL szerkesztése',
        'Go to overview' => 'Ugrás az áttekintőhöz',
        'Delete ACL' => 'ACL törlése',
        'Delete Invalid ACL' => 'Érvénytelen ACL törlése',
        'Match settings' => 'Illesztési beállítások',
        'Set up matching criteria for this ACL. Use \'Properties\' to match the current screen or \'PropertiesDatabase\' to match attributes of the current ticket that are in the database.' =>
            'Illesztési feltétel beállítása ehhez az ACL-hez. Használja a „Properties” értéket a jelenlegi képernyő megfeleltetéséhez, vagy a „PropertiesDatabase” értéket az adatbázisban lévő jelenlegi jegy megfeleltetéséhez.',
        'Change settings' => 'Változtatási beállítások',
        'Set up what you want to change if the criteria match. Keep in mind that \'Possible\' is a white list, \'PossibleNot\' a black list.' =>
            'Állítsa be, amit módosítani szeretne a feltétel egyezésekor. Ne feledkezzen meg arról, hogy a „Possible” a fehérlista, a „PossibleNot” a feketelista.',
        'Check the official' => 'Nézze meg a hivatalos',
        'documentation' => 'dokumentációt',
        'Show or hide the content' => 'A tartalom megjelenítése vagy elrejtése',
        'Edit ACL information' => 'ACL információk szerkesztése',
        'Stop after match' => 'Leállítás találat után',
        'Edit ACL structure' => 'ACL struktúra szerkesztése',
        'Save settings' => 'Beállítások mentése',
        'Save ACL' => 'ACL mentése',
        'Save' => 'Mentés',
        'or' => 'vagy',
        'Save and finish' => 'Mentés és befejezés',
        'Do you really want to delete this ACL?' => 'Valóban törölni szeretné ezt az ACL-t?',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?' =>
            'Ez az elem még mindig tartalmaz részelemeket. Biztosan törölni szeretné ezt az elemet a részelemeivel együtt?',
        'An item with this name is already present.' => 'Már létezik egy elem ezzel a névvel.',
        'Add all' => 'Összes hozzáadása',
        'There was an error reading the ACL data.' => 'Hiba történt az ACL adatok olvasásakor.',

        # Template: AdminACLNew
        'Create a new ACL by submitting the form data. After creating the ACL, you will be able to add configuration items in edit mode.' =>
            'Egy új ACL létrehozása az űrlapadatok beküldésével. Az ACL létrehozása után lesz képes beállítási elemek hozzáadására szerkesztés módban.',

        # Template: AdminAttachment
        'Attachment Management' => 'Mellékletkezelés',
        'Add attachment' => 'Melléklet hozzáadása',
        'List' => 'Lista',
        'Download file' => 'Fájl letöltése',
        'Delete this attachment' => 'Melléklet törlése',
        'Do you really want to delete this attachment?' => 'Valóban törölni szeretné ezt a mellékletet?',
        'Add Attachment' => 'Melléklet hozzáadása',
        'Edit Attachment' => 'Melléklet szerkesztése',

        # Template: AdminAutoResponse
        'Auto Response Management' => 'Automatikus válaszkezelés',
        'Add auto response' => 'Automatikus válasz hozzáadása',
        'Add Auto Response' => 'Automatikus válasz hozzáadása',
        'Edit Auto Response' => 'Automatikus válasz szerkesztése',
        'Response' => 'Válasz',
        'Auto response from' => 'Automatikus válasz feladója',
        'Reference' => 'Hivatkozás',
        'You can use the following tags' => 'A következő címkéket használhatja',
        'To get the first 20 character of the subject.' => 'A tárgy első 20 karakterének lekéréséhez.',
        'To get the first 5 lines of the email.' => 'Az e-mail első 5 sorának lekéréséhez.',
        'To get the name of the ticket\'s customer user (if given).' => 'A jegy ügyfél-felhasználója nevének lekéréséhez (ha meg van adva).',
        'To get the article attribute' => 'A bejegyzés jellemzőjének lekéréséhez',
        ' e. g.' => ' például',
        'Options of the current customer user data' => 'A jelenlegi ügyfél-felhasználó adatainak beállításai',
        'Ticket owner options' => 'Jegytulajdonos beállításai',
        'Ticket responsible options' => 'Jegyfelelős beállításai',
        'Options of the current user who requested this action' => 'A jelenlegi felhasználó beállításai, aki ezt a műveletet kérte',
        'Options of the ticket data' => 'A jegy adatainak beállításai',
        'Options of ticket dynamic fields internal key values' => 'A jegy dinamikus mezői belső kulcs értékeinek beállításai',
        'Options of ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'A jegy dinamikus mezői megjelenített értékeinek beállításai, legördülő és többválasztós mezőknél hasznos',
        'Config options' => 'Konfigurációs beállítások',
        'Example response' => 'Példa válasz',

        # Template: AdminCloudServiceSupportDataCollector
        'Cloud Service Management' => 'Felhőszolgáltatás kezelés',
        'Support Data Collector' => 'Támogatási adatgyűjtő',
        'Support data collector' => 'Támogatási adatgyűjtő',
        'Hint' => 'Tipp',
        'Currently support data is only shown in this system.' => 'Jelenleg a támogatási adatok csak ezen a rendszeren jelennek meg.',
        'It is highly recommended to send this data to OTRS Group in order to get better support.' =>
            'Erősen javasolt az adatok elküldése az OTRS csoportnak annak érdekében, hogy jobb támogatást kapjon.',
        'Configuration' => 'Beállítás',
        'Send support data' => 'Támogatási adatok küldése',
        'This will allow the system to send additional support data information to OTRS Group.' =>
            'Ez lehetővé fogja tenni a rendszer számára további támogatási adatok információinak küldését az OTRS csoportnak.',
        'System Registration' => 'Rendszer regisztráció',
        'To enable data sending, please register your system with OTRS Group or update your system registration information (make sure to activate the \'send support data\' option.)' =>
            'Az adatküldés engedélyezéséhez regisztrálja a rendszerét az OTRS csoporttal, vagy frissítse a rendszer regisztrációjának információit (győződjön meg arról, hogy aktiválta a „Támogatási adatok küldése” lehetőséget).',
        'Register this System' => 'A rendszer regisztrálása',
        'System Registration is disabled for your system. Please check your configuration.' =>
            'A rendszer regisztráció le van tiltva a rendszerénél. Ellenőrizze a beállításokat.',

        # Template: AdminCloudServices
        'System registration is a service of OTRS Group, which provides a lot of advantages!' =>
            'A rendszer regisztráció az OTRS csoport szolgáltatása, amely számos előnyt biztosít!',
        'Please note that the use of OTRS cloud services requires the system to be registered.' =>
            'Ne feledje, hogy az OTRS felhőszolgáltatások használatához a rendszer regisztrációja szükséges.',
        'Register this system' => 'A rendszer regisztrálása',
        'Here you can configure available cloud services that communicate securely with %s.' =>
            'Itt tudja beállítani azokat az elérhető felhőszolgáltatásokat, amelyek biztonságosan kommunikálnak a következővel: %s.',
        'Available Cloud Services' => 'Elérhető felhőszolgáltatások',
        'Upgrade to %s' => 'Frissítés a következőre: %s',

        # Template: AdminCustomerCompany
        'Customer Management' => 'Ügyfélkezelés',
        'Wildcards like \'*\' are allowed.' => 'Helyettesítő karakterek (például „*”) engedélyezettek.',
        'Add customer' => 'Ügyfél hozzáadása',
        'Select' => 'Kiválasztás',
        'List (only %s shown - more available)' => 'Lista (csak %s látható - több érhető el)',
        'List (%s total)' => 'Lista (összesen %s)',
        'Please enter a search term to look for customers.' => 'Adjon meg egy keresési kifejezést az ügyfelek kereséséhez.',
        'Add Customer' => 'Ügyfél hozzáadása',

        # Template: AdminCustomerUser
        'Customer User Management' => 'Ügyfél-felhasználó kezelés',
        'Back to search results' => 'Vissza a keresési eredményekhez',
        'Add customer user' => 'Ügyfél-felhasználó hozzáadása',
        'Customer user are needed to have a customer history and to login via customer panel.' =>
            'Az ügyfél-felhasználó az ügyfél-előzményekhez és az ügyfélpanelen keresztüli bejelentkezéshez szükséges.',
        'Last Login' => 'Utolsó belépés',
        'Login as' => 'Belépés mint',
        'Switch to customer' => 'Váltás az ügyfélre',
        'Add Customer User' => 'Ügyfél-felhasználó hozzáadása',
        'Edit Customer User' => 'Ügyfél-felhasználó szerkesztése',
        'This field is required and needs to be a valid email address.' =>
            'Ez a mező kötelező és érvényes e-mail címet kell tartalmaznia.',
        'This email address is not allowed due to the system configuration.' =>
            'Ez az e-mail cím nem megengedett a rendszerbeállítások miatt.',
        'This email address failed MX check.' => 'Ez az e-mail cím megbukott az MX ellenőrzésen.',
        'DNS problem, please check your configuration and the error log.' =>
            'DNS probléma, ellenőrizze a beállításokat és a hibanaplót.',
        'The syntax of this email address is incorrect.' => 'Ennek az e-mail címnek hibás a szintaxisa.',

        # Template: AdminCustomerUserGroup
        'Manage Customer-Group Relations' => 'Ügyfél-csoport kapcsolatok kezelése',
        'Notice' => 'Értesítés',
        'This feature is disabled!' => 'Ez a szolgáltatás le van tiltva!',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Csak akkor használja ezt a szolgáltatást, ha csoportjogosultságokat szeretne meghatározni az ügyfelekhez.',
        'Enable it here!' => 'Itt engedélyezze!',
        'Edit Customer Default Groups' => 'Alapértelmezett ügyfélcsoportok szerkesztése',
        'These groups are automatically assigned to all customers.' => 'Ezek a csoportok automatikusan hozzá vannak rendelve minden ügyfélhez.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'Ezeket a csoportokat a „CustomerGroupAlwaysGroups” beállításon keresztül kezelheti.',
        'Filter for Groups' => 'Szűrő a csoportokhoz',
        'Just start typing to filter...' => 'Csak kezdjen el gépelni a szűréshez…',
        'Select the customer:group permissions.' => 'A customer:group jogosultságok kiválasztása.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Ha semmi sincs kiválasztva, akkor ebben a csoportban nincsenek jogosultságok (a jegyek nem lesznek elérhetők az ügyfeleknek).',
        'Search Results' => 'Keresési eredmények',
        'Customers' => 'Ügyfelek',
        'No matches found.' => 'Nincs találat.',
        'Groups' => 'Csoportok',
        'Change Group Relations for Customer' => 'Csoportkapcsolatok megváltoztatása egy ügyfélnél',
        'Change Customer Relations for Group' => 'Ügyfélkapcsolatok megváltoztatása egy csoportnál',
        'Toggle %s Permission for all' => 'A(z) %s jogosultság ki- vagy bekapcsolása mindenkinek',
        'Toggle %s permission for %s' => 'A(z) %s jogosultság ki- vagy bekapcsolása ehhez: %s',
        'Customer Default Groups:' => 'Alapértelmezett ügyfélcsoportok',
        'No changes can be made to these groups.' => 'Nem lehet változtatni ezeken a csoportokon.',
        'ro' => 'csak olvasás',
        'Read only access to the ticket in this group/queue.' => 'Csak olvasható hozzáférés ebben a csoportban/várólistában lévő jegyekhez.',
        'rw' => 'írás, olvasás',
        'Full read and write access to the tickets in this group/queue.' =>
            'Teljes írási és olvasási hozzáférés ebben a csoportban/várólistában lévő jegyekhez.',

        # Template: AdminCustomerUserService
        'Manage Customer-Services Relations' => 'Ügyfél-szolgáltatás kapcsolatok kezelése',
        'Edit default services' => 'Alapértelmezett szolgáltatások szerkesztése',
        'Filter for Services' => 'Szűrő a szolgáltatásokhoz',
        'Allocate Services to Customer' => 'Szolgáltatások lefoglalása az ügyfélhez',
        'Allocate Customers to Service' => 'Ügyfelek lefoglalása a szolgáltatáshoz',
        'Toggle active state for all' => 'Aktivált állapot ki- és bekapcsolása mindenkinek',
        'Active' => 'Aktív',
        'Toggle active state for %s' => 'Aktivált állapot ki- és bekapcsolása ehhez: %s',

        # Template: AdminDynamicField
        'Dynamic Fields Management' => 'Dinamikus mezők kezelése',
        'Add new field for object' => 'Új mező hozzáadása az objektumhoz',
        'To add a new field, select the field type from one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'Egy új mező hozzáadásához válassza ki a mezőtípust az objektum listájának egyikéből. Az objektum határozza meg a mező határát, és nem lehet azt megváltoztatni a mező létrehozása után.',
        'Dynamic Fields List' => 'Dinamikus mezők listája',
        'Dynamic fields per page' => 'Oldalankénti dinamikus mezők',
        'Label' => 'Címke',
        'Order' => 'Sorrend',
        'Object' => 'Objektum',
        'Delete this field' => 'Mező törlése',
        'Do you really want to delete this dynamic field? ALL associated data will be LOST!' =>
            'Valóban törölni szeretné ezt a dinamikus mezőt? MINDEN hozzárendelt adat EL FOG VESZNI!',
        'Delete field' => 'Mező törlése',
        'Deleting the field and its data. This may take a while...' => 'A mező és az adatainak törlése folyamatban van. Ez eltarthat egy ideig…',

        # Template: AdminDynamicFieldCheckbox
        'Dynamic Fields' => 'Dinamikus mezők',
        'Field' => 'Mező',
        'Go back to overview' => 'Vissza az áttekintőhöz',
        'General' => 'Általános',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Ez a mező kötelező, és az értéke csak betű és szám karakter lehet.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Egyedinek kell lennie, és csak betű és szám karaktereket fogad el.',
        'Changing this value will require manual changes in the system.' =>
            'Az érték megváltoztatása kézi módosításokat fog igényelni a rendszeren.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Ez azokon a képernyőkön megjelenítendő név, ahol a mező aktív.',
        'Field order' => 'Mezősorrend',
        'This field is required and must be numeric.' => 'Ez a mező kötelező, és csak számot tartalmazhat.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Ez az a sorrend, amelyben ez a mező meg fog jelenni a képernyőkön, ahol aktív.',
        'Field type' => 'Mezőtípus',
        'Object type' => 'Objektumtípus',
        'Internal field' => 'Belső mező',
        'This field is protected and can\'t be deleted.' => 'Ez a mező védett, és nem lehet törölni.',
        'Field Settings' => 'mezőbeállítások',
        'Default value' => 'Alapértelmezett érték',
        'This is the default value for this field.' => 'Ez az alapértelmezett érték ehhez a mezőhöz.',

        # Template: AdminDynamicFieldDateTime
        'Default date difference' => 'Alapértelmezett dátumkülönbség',
        'This field must be numeric.' => 'Ez a mező csak számot tartalmazhat.',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'A különbség MOSTANTÓL (másodpercben) a mező alapértelmezett értékének számításához (például 3600 vagy -60).',
        'Define years period' => 'Éves időszak meghatározása',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            'A szolgáltatás aktiválásával egy rögzített évtartományt határozhat meg (a jövőben vagy a múltban), amely a mező év részében kerül megjelenítésre.',
        'Years in the past' => 'Elmúlt évek',
        'Years in the past to display (default: 5 years).' => 'A megjelenítendő elmúlt évek (alapértelmezés: 5 év).',
        'Years in the future' => 'Jövőbeli évek',
        'Years in the future to display (default: 5 years).' => 'A megjelenítendő jövőbeli évek (alapértelmezés: 5 év).',
        'Show link' => 'Hivatkozás megjelenítése',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'Itt határozható meg egy opcionális HTTP hivatkozás a mező értékéhez az áttekintőben és a nagyítási képernyőkön.',
        'Link for preview' => 'Hivatkozás az előnézethez',
        'If filled in, this URL will be used for a preview which is shown when this link is hovered in ticket zoom. Please note that for this to work, the regular URL field above needs to be filled in, too.' =>
            'Ha ki van töltve, akkor ez az URL lesz használva egy olyan előnézethez, amely akkor jelenik meg, amikor erre a hivatkozásra rámutatnak a jegynagyításban. Ne feledje, hogy ahhoz, hogy ez működjön, a fenti szabályos URL-mezőt is ki kell tölteni.',
        'Restrict entering of dates' => 'Korlátozás dátumok bevitelére',
        'Here you can restrict the entering of dates of tickets.' => 'Itt korlátozható a jegyek dátumának bevitele.',

        # Template: AdminDynamicFieldDropdown
        'Possible values' => 'Lehetséges értékek',
        'Key' => 'Kulcs',
        'Value' => 'Érték',
        'Remove value' => 'Érték eltávolítása',
        'Add value' => 'Érték hozzáadása',
        'Add Value' => 'Érték hozzáadása',
        'Add empty value' => 'Üres érték hozzáadása',
        'Activate this option to create an empty selectable value.' => 'Aktiválja ezt a lehetőséget egy üres, kijelölhető érték létrehozásához.',
        'Tree View' => 'Fa nézet',
        'Activate this option to display values as a tree.' => 'Aktiválja ezt a lehetőséget az értékek faként való megjelenítéséhez.',
        'Translatable values' => 'Lefordítható értékek',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Ha aktiválja ezt a lehetőséget, az értékek le lesznek fordítva a felhasználó által megadott nyelvre.',
        'Note' => 'Jegyzet',
        'You need to add the translations manually into the language translation files.' =>
            'A fordításokat kézzel kell hozzáadnia a nyelv fordítási fájljaihoz.',

        # Template: AdminDynamicFieldText
        'Number of rows' => 'Sorok száma',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'A mező magasságának megadása (sorokban) a szerkesztő módban.',
        'Number of cols' => 'Oszlopok száma',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'A mező szélességének megadása (karakterekben) a szerkesztő módban.',
        'Check RegEx' => 'Reguláris kifejezés ellenőrzése',
        'Here you can specify a regular expression to check the value. The regex will be executed with the modifiers xms.' =>
            'Itt adhatja meg az értéket ellenőrző reguláris kifejezést. A reguláris kifejezés az xms módosítóval lesz végrehajtva.',
        'RegEx' => 'Reguláris kifejezés',
        'Invalid RegEx' => 'Érvénytelen reguláris kifejezés',
        'Error Message' => 'Hibaüzenet',
        'Add RegEx' => 'Reguláris kifejezés hozzáadása',

        # Template: AdminEmail
        'Admin Notification' => 'Adminisztrátor értesítés',
        'With this module, administrators can send messages to agents, group or role members.' =>
            'Ezzel a modullal az adminisztrátorok üzeneteket küldhetnek az ügyintézőknek, csoportoknak vagy a tagoknak.',
        'Create Administrative Message' => 'Adminisztratív üzenet létrehozása',
        'Your message was sent to' => 'Az üzenet elküldve a következőknek',
        'Send message to users' => 'Üzenet küldése a felhasználóknak',
        'Send message to group members' => 'Üzenet küldése a csoport tagjainak',
        'Group members need to have permission' => 'A csoport tagjainak jogosultságra van szükségük',
        'Send message to role members' => 'Üzenet küldése a szerep tagjainak',
        'Also send to customers in groups' => 'Küldés a csoportokban lévő ügyfeleknek is',
        'Body' => 'Törzs',
        'Send' => 'Küldés',

        # Template: AdminGenericAgent
        'Generic Agent' => 'Általános ügyintéző',
        'Add job' => 'Feladat hozzáadása',
        'Last run' => 'Utolsó futás',
        'Run Now!' => 'Futtatás most!',
        'Delete this task' => 'Feladat törlése',
        'Run this task' => 'Feladat futtatása',
        'Do you really want to delete this task?' => 'Valóban törölni szeretné ezt a feladatot?',
        'Job Settings' => 'Feladat-beállítások',
        'Job name' => 'Feladatnév',
        'The name you entered already exists.' => 'A megadott név már létezik.',
        'Toggle this widget' => 'Felületi elem ki- és bekapcsolása',
        'Automatic execution (multiple tickets)' => 'Automatikus végrehajtás (több jegy)',
        'Execution Schedule' => 'Végrehajtás-ütemezés',
        'Schedule minutes' => 'Perc ütemezése',
        'Schedule hours' => 'Óra ütemezése',
        'Schedule days' => 'Nap ütemezése',
        'Currently this generic agent job will not run automatically.' =>
            'Jelenleg ez az általános ügyintéző feladat nem fut le automatikusan.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Az automatikus végrehajtás engedélyezéséhez válasszon legalább egy értéket a perc, óra és nap közül!',
        'Event based execution (single ticket)' => 'Eseményalapú végrehajtás (egyetlen jegy)',
        'Event Triggers' => 'Esemény-aktiválók',
        'List of all configured events' => 'Az összes beállított esemény listája',
        'Delete this event' => 'Esemény törlése',
        'Additionally or alternatively to a periodic execution, you can define ticket events that will trigger this job.' =>
            'Egy időszakos végrehajtás mellett vagy helyett meghatározhat olyan jegyeseményeket, amelyek aktiválni fogják ezt a feladatot.',
        'If a ticket event is fired, the ticket filter will be applied to check if the ticket matches. Only then the job is run on that ticket.' =>
            'Ha egy jegyesemény elsül, a jegy szűrő alkalmazásával kerül ellenőrzésre, hogy a jegy illeszkedik-e.',
        'Do you really want to delete this event trigger?' => 'Valóban törölni szeretné ezt az esemény-aktiválót?',
        'Add Event Trigger' => 'Esemény-aktiváló hozzáadása',
        'Add Event' => 'Esemény hozzáadása',
        'To add a new event select the event object and event name and click on the "+" button' =>
            'Egy új esemény hozzáadásához válassza ki az eseményobjektumot és az eseménynevet, majd kattintson a „+” gombra.',
        'Duplicate event.' => 'Esemény kettőzése.',
        'This event is already attached to the job, Please use a different one.' =>
            'Ez az esemény már csatolva van a feladathoz, használjon egy másikat.',
        'Delete this Event Trigger' => 'Esemény-aktiváló törlése',
        'Remove selection' => 'Kijelölés eltávolítása',
        'Select Tickets' => 'Jegyek kijelölése',
        '(e. g. 10*5155 or 105658*)' => '(például 10*5155 vagy 105658*)',
        '(e. g. 234321)' => '(például 234321)',
        'Customer user' => 'Ügyfél-felhasználó',
        '(e. g. U5150)' => '(például U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Szabad-szavas keresés a bejegyzésben (például „Mar*in” vagy „Baue*”).',
        'Agent' => 'Ügyintéző',
        'Ticket lock' => 'Jegyzár',
        'Create times' => 'Létrehozási idők',
        'No create time settings.' => 'Nincsenek létrehozási idő beállítások.',
        'Ticket created' => 'Jegy létrehozva',
        'Ticket created between' => 'Jegy létrehozva a következő időpontok között',
        'Last changed times' => 'Utolsó módosítási idők',
        'No last changed time settings.' => 'Nincsenek utolsó módosítási idő beállítások.',
        'Ticket last changed' => 'Jegy utoljára módosítva',
        'Ticket last changed between' => 'Jegy utoljára módosítva a következő időpontok között',
        'Change times' => 'Módosítási idők',
        'No change time settings.' => 'Nincsenek módosítási idő beállítások.',
        'Ticket changed' => 'Jegy módosítva',
        'Ticket changed between' => 'Jegy módosítva a következő időpontok között',
        'Close times' => 'Lezárási idők',
        'No close time settings.' => 'Nincsenek lezárási idő beállítások.',
        'Ticket closed' => 'Jegy lezárva',
        'Ticket closed between' => 'Jegy lezárva a következő időpontok között',
        'Pending times' => 'Várakozási idők',
        'No pending time settings.' => 'Nincsenek várakozási idő beállítások.',
        'Ticket pending time reached' => 'Jegy várakozási ideje elérve',
        'Ticket pending time reached between' => 'Jegy várakozási ideje elérve a következő időpontok között',
        'Escalation times' => 'Eszkalációs idők',
        'No escalation time settings.' => 'Nincsenek eszkalációs idő beállítások.',
        'Ticket escalation time reached' => 'Jegy eszkalációs ideje elérve',
        'Ticket escalation time reached between' => 'Jegy eszkalációs ideje elérve a következő időpontok között',
        'Escalation - first response time' => 'Eszkaláció - első válaszidő',
        'Ticket first response time reached' => 'Jegy első válaszideje elérve',
        'Ticket first response time reached between' => 'Jegy első válaszideje elérve a következő időpontok között',
        'Escalation - update time' => 'Eszkaláció - frissítési idő',
        'Ticket update time reached' => 'Jegy frissítési ideje elérve',
        'Ticket update time reached between' => 'Jegy frissítési ideje elérve a következő időpontok között',
        'Escalation - solution time' => 'Eszkaláció - megoldási idő',
        'Ticket solution time reached' => 'Jegy megoldási ideje elérve',
        'Ticket solution time reached between' => 'Jegy megoldási ideje elérve a következő időpontok között',
        'Archive search option' => 'Archívumkeresési beállítások',
        'Update/Add Ticket Attributes' => 'Jegyjellemzők frissítése/hozzáadása',
        'Set new service' => 'Új szolgáltatás beállítása',
        'Set new Service Level Agreement' => 'Új szolgáltatási szint megállapodás beállítása',
        'Set new priority' => 'Új prioritás beállítása',
        'Set new queue' => 'Új várólista beállítása',
        'Set new state' => 'Új állapot beállítása',
        'Pending date' => 'Várakozási dátum',
        'Set new agent' => 'Új ügyintéző beállítása',
        'new owner' => 'új tulajdonos',
        'new responsible' => 'új felelős',
        'Set new ticket lock' => 'Új jegyzár beállítása',
        'New customer user' => 'Új ügyfél-felhasználó',
        'New customer ID' => 'Új ügyfél-azonosító',
        'New title' => 'Új cím',
        'New type' => 'Új típus',
        'New Dynamic Field Values' => 'Új dinamikus mező értékek',
        'Archive selected tickets' => 'Kijelölt jegyek archiválása',
        'Add Note' => 'Jegyzet hozzáadása',
        'Time units' => 'Időegységek',
        'Execute Ticket Commands' => 'Jegyparancsok végrehajtása',
        'Send agent/customer notifications on changes' => 'Ügyintéző/ügyfél értesítések küldése módosításkor',
        'CMD' => 'PARANCS',
        'This command will be executed. ARG[0] will be the ticket number. ARG[1] the ticket id.' =>
            'Ez a parancs lesz végrehajtva. Az ARG[0] lesz a jegy száma. Az ARG[1] lesz a jegy azonosítója.',
        'Delete tickets' => 'Jegyek törlése',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Figyelem: Minden érintett jegy el lesz távolítva az adatbázisból, és nem lehet visszaállítani!',
        'Execute Custom Module' => 'Egyéni modul végrehajtása',
        'Param %s key' => '%s paraméter kulcs',
        'Param %s value' => '%s paraméter érték',
        'Save Changes' => 'Változtatások mentése',
        'Results' => 'Eredmények',
        '%s Tickets affected! What do you want to do?' => '%s jegy érintett! Mit szeretne tenni?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Figyelem: A TÖRLÉS lehetőséget használta. Minden törölt jegy el fog veszni!',
        'Warning: There are %s tickets affected but only %s may be modified during one job execution!' =>
            'Figyelem: %s jegy érintett, de csak %s módosítható egy feladat-végrehajtás során!',
        'Edit job' => 'Feladat szerkesztése',
        'Run job' => 'Feladat futtatása',
        'Affected Tickets' => 'Érintett jegyek',

        # Template: AdminGenericInterfaceDebugger
        'GenericInterface Debugger for Web Service %s' => 'Általános felület hibakereső a(z) %s webszolgáltatáshoz',
        'You are here' => 'Ön itt áll',
        'Web Services' => 'Webszolgáltatások',
        'Debugger' => 'Hibakereső',
        'Go back to web service' => 'Vissza a webszolgáltatáshoz',
        'Clear' => 'Törlés',
        'Do you really want to clear the debug log of this web service?' =>
            'Valóban törölni szeretné ennek a webszolgáltatásnak a hibakeresési naplóját?',
        'Request List' => 'Kéréslista',
        'Time' => 'Idő',
        'Remote IP' => 'Távoli IP',
        'Loading' => 'Betöltés',
        'Select a single request to see its details.' => 'Válasszon egy egyszerű kérést a részletei megtekintéséhez.',
        'Filter by type' => 'Szűrés típus szerint',
        'Filter from' => 'Szűrés ettől',
        'Filter to' => 'Szűrés eddig',
        'Filter by remote IP' => 'Szűrés távoli IP szerint',
        'Limit' => 'Korlát',
        'Refresh' => 'Frissítés',
        'Request Details' => 'Kérés részletei',
        'An error occurred during communication.' => 'Hiba történt a kommunikáció közben.',
        'Show or hide the content.' => 'A tartalom megjelenítése vagy elrejtése.',
        'Clear debug log' => 'Hibakeresési napló törlése',

        # Template: AdminGenericInterfaceInvokerDefault
        'Add new Invoker to Web Service %s' => 'Új meghívó hozzáadása a(z) %s webszolgáltatáshoz',
        'Change Invoker %s of Web Service %s' => 'A(z) %s webszolgáltatás %s meghívójának módosítása',
        'Add new invoker' => 'Új meghívó hozzáadása',
        'Change invoker %s' => '%s meghívó módosítása',
        'Do you really want to delete this invoker?' => 'Valóban törölni szeretné ezt a meghívót?',
        'All configuration data will be lost.' => 'Minden beállítási adat el fog veszni.',
        'Invoker Details' => 'Meghívó részletei',
        'The name is typically used to call up an operation of a remote web service.' =>
            'A név tipikusan egy távoli webszolgáltatás műveletének meghívásához használható.',
        'Please provide a unique name for this web service invoker.' => 'Adjon meg egy egyedi nevet ehhez a webszolgáltatás meghívóhoz.',
        'Invoker backend' => 'Meghívó háttérprogram',
        'This OTRS invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            'Ez az OTRS meghívó háttérprogram modul lesz meghívva a távoli rendszerre küldendő adatok előkészítéséhez, és a válasz adatainak feldolgozásához.',
        'Mapping for outgoing request data' => 'Leképezés a kimenő kérés adataihoz',
        'Configure' => 'Beállítás',
        'The data from the invoker of OTRS will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Ez a leképezés fogja feldolgozni az OTRS meghívójából származó adatokat olyan formára alakítva át azokat, ahogy a távoli rendszer várja.',
        'Mapping for incoming response data' => 'Leképezés a bejövő válasz adataihoz',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of OTRS expects.' =>
            'Ez a leképezés fogja a válasz adatait feldolgozni olyan formára alakítva át azokat, ahogy az OTRS meghívója várja.',
        'Asynchronous' => 'Aszinkron',
        'This invoker will be triggered by the configured events.' => 'Ezt a meghívót a beállított események fogják aktiválni.',
        'Asynchronous event triggers are handled by the OTRS Scheduler Daemon in background (recommended).' =>
            'Az aszinkron esemény-aktiválókat az OTRS ütemeződémon kezeli a háttérben (javasolt).',
        'Synchronous event triggers would be processed directly during the web request.' =>
            'A szinkron esemény-aktiválók közvetlenül legyenek feldolgozva a webkérések alatt.',
        'Save and continue' => 'Mentés és folytatás',
        'Delete this Invoker' => 'Meghívó törlése',

        # Template: AdminGenericInterfaceMappingSimple
        'GenericInterface Mapping Simple for Web Service %s' => 'Általános felület egyszerű leképező a(z) %s webszolgáltatáshoz',
        'Go back to' => 'Vissza ide',
        'Mapping Simple' => 'Egyszerű leképezés',
        'Default rule for unmapped keys' => 'Alapértelmezett szabály a nem leképezett kulcsokhoz',
        'This rule will apply for all keys with no mapping rule.' => 'Ez a szabály alkalmazni fogja minden leképezési szabály nélküli kulcsra.',
        'Default rule for unmapped values' => 'Alapértelmezett szabály a nem leképezett értékekhez',
        'This rule will apply for all values with no mapping rule.' => 'Ez a szabály alkalmazni fogja minden leképezési szabály nélküli értékre.',
        'New key map' => 'Új kulcstérkép',
        'Add key mapping' => 'Új kulcsleképezés',
        'Mapping for Key ' => 'Leképezés a kulcshoz: ',
        'Remove key mapping' => 'Kulcsleképezés eltávolítása',
        'Key mapping' => 'Kulcsleképezés',
        'Map key' => 'Kulcs leképezése',
        'matching the' => 'illeszkedik',
        'to new key' => 'az új kulcsra',
        'Value mapping' => 'Értékleképezés',
        'Map value' => 'Érték leképezése',
        'to new value' => 'az új értékre',
        'Remove value mapping' => 'Értékleképezés eltávolítása',
        'New value map' => 'Új értéktérkép',
        'Add value mapping' => 'Értékleképezés hozzáadása',
        'Do you really want to delete this key mapping?' => 'Valóban törölni szeretné ezt a kulcsleképezést?',
        'Delete this Key Mapping' => 'Kulcsleképezés törlése',

        # Template: AdminGenericInterfaceMappingXSLT
        'GenericInterface Mapping XSLT for Web Service %s' => 'Általános felület XSLT-leképező a(z) %s webszolgáltatáshoz',
        'Mapping XML' => 'XML leképezése',
        'Template' => 'Sablon',
        'The entered data is not a valid XSLT stylesheet.' => 'A megadott adat nem érvényes XSLT-stíluslap.',
        'Insert XSLT stylesheet.' => 'XSLT-stíluslap beszúrása.',

        # Template: AdminGenericInterfaceOperationDefault
        'Add new Operation to Web Service %s' => 'Új művelet hozzáadása a(z) %s webszolgáltatáshoz',
        'Change Operation %s of Web Service %s' => 'A(z) %s webszolgáltatás %s műveletének módosítása',
        'Add new operation' => 'Új művelet hozzáadása',
        'Change operation %s' => '%s művelet módosítása',
        'Do you really want to delete this operation?' => 'Valóban törölni szeretné ezt a műveletet?',
        'Operation Details' => 'Művelet részletei',
        'The name is typically used to call up this web service operation from a remote system.' =>
            'A név tipikusan ennek a webszolgáltatás műveletnek a meghívásához használható egy távoli rendszerből.',
        'Please provide a unique name for this web service.' => 'Adjon meg egy egyedi nevet ehhez a webszolgáltatáshoz.',
        'Mapping for incoming request data' => 'Leképezés a bejövő kérés adataihoz',
        'The request data will be processed by this mapping, to transform it to the kind of data OTRS expects.' =>
            'Ez a leképezés fogja a kérés adatait feldolgozni olyan formára alakítva át azokat, ahogy az OTRS várja.',
        'Operation backend' => 'Műveleti háttérprogram.',
        'This OTRS operation backend module will be called internally to process the request, generating data for the response.' =>
            'Ez az OTRS műveleti háttérprogram modul lesz belsőleg meghívva a kérés feldolgozásához, és az adat előállításához a válasz számára.',
        'Mapping for outgoing response data' => 'Leképezés a kimenő válasz adataihoz',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Ez a leképezés fogja a válasz adatait feldolgozni olyan formára alakítva át azokat, ahogy a távoli rendszer várja.',
        'Delete this Operation' => 'Művelet törlése',

        # Template: AdminGenericInterfaceTransportHTTPREST
        'GenericInterface Transport HTTP::REST for Web Service %s' => 'Általános felület HTTP::REST átvitel a(z) %s webszolgáltatáshoz',
        'Network transport' => 'Hálózati átvitel',
        'Properties' => 'Tulajdonságok',
        'Route mapping for Operation' => 'Útvonal leképezés a művelethez',
        'Define the route that should get mapped to this operation. Variables marked by a \':\' will get mapped to the entered name and passed along with the others to the mapping. (e.g. /Ticket/:TicketID).' =>
            'Meghatározza azt az útvonalat, amelyet ehhez a művelethez kellene leképezni. A kettősponttal „:” megjelölt változók a megadott névhez lesznek leképezve, és a többivel együtt kerülnek átadásra a leképezéshez. (például /Ticket/:TicketID).',
        'Valid request methods for Operation' => 'Érvényes kérési módszerek a művelethez',
        'Limit this Operation to specific request methods. If no method is selected all requests will be accepted.' =>
            'Ezen művelet korlátozása a megadott kérési módszerekre. Ha nincs módszer kiválasztva, akkor minden kérés el lesz fogadva.',
        'Maximum message length' => 'Legnagyobb üzenethossz',
        'This field should be an integer number.' => 'Ez a mező csak egész szám lehet.',
        'Here you can specify the maximum size (in bytes) of REST messages that OTRS will process.' =>
            'Itt adhatja meg a REST üzenetek legnagyobb méretét (bájtban), amelyeket az OTRS fel fog dolgozni.',
        'Send Keep-Alive' => 'Életben tartás küldése',
        'This configuration defines if incoming connections should get closed or kept alive.' =>
            'Ez a beállítás azt határozza meg, hogy a bejövő kapcsolatok le legyenek-e zárva vagy maradjanak életben.',
        'Host' => 'Kiszolgáló',
        'Remote host URL for the REST requests.' => 'Távoli kiszolgáló URL a REST kérésekhez.',
        'e.g https://www.otrs.com:10745/api/v1.0 (without trailing backslash)' =>
            'például https://www.otrs.com:10745/api/v1.0 (lezáró perjel nélkül)',
        'Controller mapping for Invoker' => 'Vezérlő leképezés a meghívóhoz',
        'The controller that the invoker should send requests to. Variables marked by a \':\' will get replaced by the data value and passed along with the request. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).' =>
            'Az a vezérlő, amelyhez a meghívónak kéréseket kell küldenie. A kettősponttal „:” megjelölt változók az adatok értékével lesznek helyettesítve és a kéréssel együtt kerülnek átadásra. (például /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).',
        'Valid request command for Invoker' => 'Érvényes kérés parancs a meghívóhoz',
        'A specific HTTP command to use for the requests with this Invoker (optional).' =>
            'A kérésekhez használandó megadott HTTP parancs ezzel a meghívóval (opcionális).',
        'Default command' => 'Alapértelmezett parancs',
        'The default HTTP command to use for the requests.' => 'A kéréseknél használandó alapértelmezett HTTP parancs.',
        'Authentication' => 'Hitelesítés',
        'The authentication mechanism to access the remote system.' => 'A hitelesítési mechanizmus a távoli rendszer eléréséhez.',
        'A "-" value means no authentication.' => 'A „-” érték azt jelenti, hogy nincs hitelesítés.',
        'The user name to be used to access the remote system.' => 'A távoli rendszer hozzáféréséhez használandó felhasználónév.',
        'The password for the privileged user.' => 'A privilegizált felhasználó jelszava.',
        'Use SSL Options' => 'SSL beállítások használata',
        'Show or hide SSL options to connect to the remote system.' => 'SSL beállítások megjelenítése vagy elrejtése a távoli rendszerhez való csatlakozáshoz.',
        'Certificate File' => 'Tanúsítványfájl',
        'The full path and name of the SSL certificate file.' => 'Az SSL tanúsítványfájl teljes elérési útja és neve.',
        'e.g. /opt/otrs/var/certificates/REST/ssl.crt' => 'például /opt/otrs/var/certificates/REST/ssl.crt',
        'Certificate Password File' => 'Tanúsítvány jelszófájl',
        'The full path and name of the SSL key file.' => 'Az SSL kulcsfájl teljes elérési útja és neve.',
        'e.g. /opt/otrs/var/certificates/REST/ssl.key' => 'például /opt/otrs/var/certificates/REST/ssl.key',
        'Certification Authority (CA) File' => 'Hitelesítés-szolgáltató (CA) fájl',
        'The full path and name of the certification authority certificate file that validates the SSL certificate.' =>
            'A hitelesítés-szolgáltató tanúsítványfájljának teljes elérési útja és neve, amely hitelesíti az SSL tanúsítványt.',
        'e.g. /opt/otrs/var/certificates/REST/CA/ca.file' => 'például /opt/otrs/var/certificates/REST/CA/ca.file',

        # Template: AdminGenericInterfaceTransportHTTPSOAP
        'GenericInterface Transport HTTP::SOAP for Web Service %s' => 'Általános felület HTTP::SOAP átvitel a(z) %s webszolgáltatáshoz',
        'Endpoint' => 'Végpont',
        'URI to indicate a specific location for accessing a service.' =>
            'Egy adott helyet jelző URI egy szolgáltatáshoz való hozzáféréshez.',
        'e.g. http://local.otrs.com:8000/Webservice/Example' => 'például http://local.otrs.com:8000/Webservice/Example',
        'Namespace' => 'Névtér',
        'URI to give SOAP methods a context, reducing ambiguities.' => 'URI egy környezethez való SOAP metódusok adásához csökkentve a kétértelműséget.',
        'e.g urn:otrs-com:soap:functions or http://www.otrs.com/GenericInterface/actions' =>
            'például urn:otrs-com:soap:functions vagy http://www.otrs.com/GenericInterface/actions',
        'Request name scheme' => 'Kérés névséma',
        'Select how SOAP request function wrapper should be constructed.' =>
            'Válassza ki, hogy a SOAP-kérés függvénycsomagolót hogyan kell felépíteni.',
        '\'FunctionName\' is used as example for actual invoker/operation name.' =>
            'A „FunctionName” példaként van használva az aktuális meghívó/művelet nevénél.',
        '\'FreeText\' is used as example for actual configured value.' =>
            'A „FreeText” példaként van használva az aktuális beállított értéknél.',
        'Request name free text' => '',
        'Text to be used to as function wrapper name suffix or replacement.' =>
            'Függvénycsomagoló név utótagként vagy helyettesítőként használandó szöveg.',
        'Please consider XML element naming restrictions (e.g. don\'t use \'<\' and \'&\').' =>
            'Legyen tekintettel az XML-elem elnevezési korlátozásaira (például ne használja a „<” és az „&” karaktereket).',
        'Response name scheme' => 'Válasz névséma',
        'Select how SOAP response function wrapper should be constructed.' =>
            'Válassza ki, hogy a SOAP-válasz függvénycsomagolót hogyan kell felépíteni.',
        'Response name free text' => 'Kérés nevének szabad szövege',
        'Here you can specify the maximum size (in bytes) of SOAP messages that OTRS will process.' =>
            'Itt adhatja meg a SOAP üzenetek legnagyobb méretét (bájtban), amelyeket az OTRS fel fog dolgozni.',
        'Encoding' => 'Kódolás',
        'The character encoding for the SOAP message contents.' => 'A SOAP üzenettartalmak karakterkódolása.',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => 'például utf-8, latin1, iso-8859-1, cp1250, stb.',
        'SOAPAction' => 'SOAP művelet',
        'Set to "Yes" to send a filled SOAPAction header.' => 'Állítsa „Igen” értékre egy kitöltött SOAP művelet fejléc küldéséhez.',
        'Set to "No" to send an empty SOAPAction header.' => 'Állítsa „Nem” értékre egy üres SOAP művelet fejléc küldéséhez.',
        'SOAPAction separator' => 'SOAP művelet elválasztó',
        'Character to use as separator between name space and SOAP method.' =>
            'Az elválasztóként használt karakter a névtér és a SOAP metódus között.',
        'Usually .Net web services uses a "/" as separator.' => 'Általában a .Net webszolgáltatások a „/” karaktert használják elválasztóként.',
        'Proxy Server' => 'Proxy-kiszolgáló',
        'URI of a proxy server to be used (if needed).' => 'A használandó proxy-kiszolgáló URI-ja (ha szükséges).',
        'e.g. http://proxy_hostname:8080' => 'például http://proxy_hostname:8080',
        'Proxy User' => 'Proxy felhasználó',
        'The user name to be used to access the proxy server.' => 'A proxy-kiszolgáló eléréséhez használandó felhasználónév.',
        'Proxy Password' => 'Proxy jelszó',
        'The password for the proxy user.' => 'A proxy felhasználó jelszava.',
        'The full path and name of the SSL certificate file (must be in .p12 format).' =>
            'Az SSL tanúsítványfájl teljes elérési útja és neve (.p12 formátumban kell lennie).',
        'e.g. /opt/otrs/var/certificates/SOAP/certificate.p12' => 'például /opt/otrs/var/certificates/SOAP/certificate.p12',
        'The password to open the SSL certificate.' => 'A jelszó az SSL tanúsítvány megnyitásához.',
        'The full path and name of the certification authority certificate file that validates SSL certificate.' =>
            'A hitelesítés-szolgáltató tanúsítványfájljának teljes elérési útja és neve, amely hitelesíti az SSL tanúsítványt.',
        'e.g. /opt/otrs/var/certificates/SOAP/CA/ca.pem' => 'például /opt/otrs/var/certificates/SOAP/CA/ca.pem',
        'Certification Authority (CA) Directory' => 'Hitelesítés-szolgáltató (CA) könyvtár',
        'The full path of the certification authority directory where the CA certificates are stored in the file system.' =>
            'A hitelesítés-szolgáltató könyvtárának teljes elérési útja, ahol a CA tanúsítványok tárolva vannak a fájlrendszeren.',
        'e.g. /opt/otrs/var/certificates/SOAP/CA' => 'például /opt/otrs/var/certificates/SOAP/CA',
        'Sort options' => 'Rendezési beállítások',
        'Add new first level element' => 'Új első szintű elem hozzáadása',
        'Element' => 'Elem',
        'Outbound sort order for xml fields (structure starting below function name wrapper) - see documentation for SOAP transport.' =>
            'Kimenő rendezési sorrend az XML-mezőknél (a szerkezet a függvénynév csomagoló alatt indul) - nézze meg a SOAP-átvitel dokumentációját.',

        # Template: AdminGenericInterfaceWebservice
        'GenericInterface Web Service Management' => 'Általános felület webszolgáltatás kezelés',
        'Add web service' => 'Webszolgáltatás hozzáadása',
        'Clone web service' => 'Webszolgáltatás klónozása',
        'The name must be unique.' => 'A névnek egyedinek kell lennie.',
        'Clone' => 'Klónozás',
        'Export web service' => 'Webszolgáltatás exportálása',
        'Import web service' => 'Webszolgáltatás importálása',
        'Configuration File' => 'Beállítófájl',
        'The file must be a valid web service configuration YAML file.' =>
            'A fájlnak érvényes webszolgáltatás-beállító YAML fájlnak kell lennie.',
        'Import' => 'Importálás',
        'Configuration history' => 'Beállítási előzmények',
        'Delete web service' => 'Webszolgáltatás törlése',
        'Do you really want to delete this web service?' => 'Valóban törölni szeretné ezt a webszolgáltatást?',
        'Ready-to-run Web Services' => 'Futtatásra kész webszolgáltatások',
        'Here you can activate ready-to-run web services showcasing our best practices that are a part of %s.' =>
            'Itt kapcsolhatja be a legjobb gyakorlatainkat bemutató futtatásra kész webszolgáltatásokat, amelyek a(z) %s részei.',
        'Please note that these web services may depend on other modules only available with certain %s contract levels (there will be a notification with further details when importing).' =>
            'Ne feledje, hogy ezen webszolgáltatások függhetnek olyan egyéb moduloktól, amelyek csak bizonyos %s szerződési szintekkel érhetők el (lesz egy értesítés a további részletekkel az importáláskor).',
        'Import ready-to-run web service' => 'Futtatásra kész webszolgáltatás importálása',
        'Would you like to benefit from web services created by experts? Upgrade to %s to import some sophisticated ready-to-run web services.' =>
            'Szeretné élvezni a szakértők által létrehozott webszolgáltatások előnyeit? Ahhoz, hogy importálhasson néhány kitapasztalt futtatásra kész webszolgáltatást, frissítsen a következőre: %s.',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            'A beállítások mentése után ismét átirányításra kerül a szerkesztő képernyőre.',
        'If you want to return to overview please click the "Go to overview" button.' =>
            'Ha vissza szeretne térni az áttekintőre, kattintson a „Ugrás az áttekintőhöz” gombra.',
        'Web Service List' => 'Webszolgáltatás lista',
        'Remote system' => 'Távoli rendszer',
        'Provider transport' => 'Szolgáltató átvitel',
        'Requester transport' => 'Kérő átvitel',
        'Debug threshold' => 'Hibakeresési küszöbszint',
        'In provider mode, OTRS offers web services which are used by remote systems.' =>
            'Szolgáltató módban az OTRS olyan webszolgáltatásokat javasol, amelyeket a távoli rendszerek használnak.',
        'In requester mode, OTRS uses web services of remote systems.' =>
            'Kérő módban az OTRS a távoli rendszerek webszolgáltatásait használja.',
        'Operations are individual system functions which remote systems can request.' =>
            'A műveletek olyan egyedi rendszerfunkciók, amelyeket a távoli rendszerek kérhetnek.',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            'A meghívók előkészítik az adatokat egy távoli webszolgáltatáshoz intézendő kéréshez, és feldolgozzák a válasz adatait.',
        'Controller' => 'Vezérlő',
        'Inbound mapping' => 'Bejövő leképezés',
        'Outbound mapping' => 'Kimenő leképezés',
        'Delete this action' => 'Művelet törlése',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            'Legalább egy %s olyan vezérlővel rendelkezik, amely vagy nem aktív, vagy nincs jelen. Ellenőrizze a vezérlő regisztrációját, vagy törölje a következőt: %s',
        'Delete webservice' => 'Webszolgáltatás törlése',
        'Delete operation' => 'Művelet törlése',
        'Delete invoker' => 'Meghívó törlése',
        'Clone webservice' => 'Webszolgáltatás klónozása',
        'Import webservice' => 'Webszolgáltatás importálása',

        # Template: AdminGenericInterfaceWebserviceHistory
        'GenericInterface Configuration History for Web Service %s' => 'Általános felület beállítási előzmények a(z) %s webszolgáltatáshoz',
        'Go back to Web Service' => 'Vissza a webszolgáltatáshoz',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            'Itt tekintheti meg a jelenlegi webszolgáltatás beállításának régebbi verzióit, exportálhatja vagy akár vissza is állíthatja azokat.',
        'Configuration History List' => 'Beállítási előzmények listája',
        'Version' => 'Verzió',
        'Create time' => 'Létrehozás ideje',
        'Select a single configuration version to see its details.' => 'Válasszon egy egyszerű beállítási verziót a részletei megtekintéséhez.',
        'Export web service configuration' => 'Webszolgáltatás-beállítás exportálása',
        'Restore web service configuration' => 'Webszolgáltatás-beállítás visszaállítása',
        'Do you really want to restore this version of the web service configuration?' =>
            'Valóban vissza szeretné állítani a webszolgáltatás beállításának ezen verzióját?',
        'Your current web service configuration will be overwritten.' => 'A jelenlegi webszolgáltatás-beállítás felül lesz írva.',
        'Restore' => 'Visszaállítás',

        # Template: AdminGroup
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'FIGYELEM: Ha az „admin” csoport nevét megváltoztatja a megfelelő SysConfig beállítások előtt, úgy ki lesz zárva az adminisztrációs felületről! Ha ez megtörtént, akkor nevezze vissza a csoportot „admin” névre egy SQL utasítás segítségével.',
        'Group Management' => 'Csoportkezelés',
        'Add group' => 'Csoport hozzáadása',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Az admin csoport az adminisztrációs területre, a stats csoport a statisztika területre való bejutáshoz van.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Új csoportok létrehozása a hozzáférési jogosultságok kezeléséhez az ügyintézők különböző csoportjainál (például beszerzési részleg, támogató részleg, értékesítési részleg, …).',
        'It\'s useful for ASP solutions. ' => 'Ez ASP megoldásoknál hasznos. ',
        'total' => 'összesen',
        'Add Group' => 'Csoport hozzáadása',
        'Edit Group' => 'Csoport szerkesztése',

        # Template: AdminLog
        'System Log' => 'Rendszernapló',
        'Here you will find log information about your system.' => 'Itt napló információkat fog találni a rendszeréről.',
        'Hide this message' => 'Üzenet elrejtése',
        'Recent Log Entries' => 'Legutóbbi naplóbejegyzések',

        # Template: AdminMailAccount
        'Mail Account Management' => 'Levelezőfiók-kezelés',
        'Add mail account' => 'Levelezőfiók hozzáadása',
        'All incoming emails with one account will be dispatched in the selected queue!' =>
            'Az összes fiókkal rendelkező bejövő e-mail a kiválasztott várólistába lesz kézbesítve!',
        'If your account is trusted, the already existing X-OTRS header at arrival time (for priority, ...) will be used! PostMaster filter will be used anyway.' =>
            'Ha a fiókja megbízható, a már létező X-OTRS fejléc lesz használva beérkezéskor (prioritáshoz, …)! Egyébként a levelezési szűrők lesznek alkalmazva.',
        'Delete account' => 'Fiók törlése',
        'Fetch mail' => 'Levél lekérése',
        'Add Mail Account' => 'Levelezőfiók hozzáadása',
        'Example: mail.example.com' => 'Példa: mail.example.com',
        'IMAP Folder' => 'IMAP mappa',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'Ezt csak akkor módosítsa, ha az INBOX mappától eltérőből szükséges a levél lekérése.',
        'Trusted' => 'Megbízható',
        'Dispatching' => 'Kézbesítés',
        'Edit Mail Account' => 'Levelezőfiók szerkesztése',

        # Template: AdminNavigationBar
        'Admin' => 'Adminisztráció',
        'Agent Management' => 'Ügyintéző-kezelés',
        'Queue Settings' => 'Várólista beállítások',
        'Ticket Settings' => 'Jegybeállítások',
        'System Administration' => 'Rendszer adminisztráció',
        'Online Admin Manual' => 'Online adminisztrátori kézikönyv',

        # Template: AdminNotificationEvent
        'Ticket Notification Management' => 'Jegyértesítés-kezelés',
        'Add notification' => 'Értesítés hozzáadása',
        'Export Notifications' => 'Értesítések exportálása',
        'Configuration Import' => 'Beállítás importálás',
        'Here you can upload a configuration file to import Ticket Notifications to your system. The file needs to be in .yml format as exported by the Ticket Notification module.' =>
            'Itt tud egy beállítófájlt feltölteni a jegyértesítések importálásához a rendszerre. A fájlnak .yml formátumban kell lennie, ahogy a jegyértesítés modul exportálta.',
        'Overwrite existing notifications?' => 'Felülírja a meglévő értesítéseket?',
        'Upload Notification configuration' => 'Értesítés beállítások feltöltése',
        'Import Notification configuration' => 'Értesítés beállítások importálása',
        'Delete this notification' => 'Értesítés törlése',
        'Do you really want to delete this notification?' => 'Valóban törölni szeretné ezt az értesítést?',
        'Add Notification' => 'Értesítés hozzáadása',
        'Edit Notification' => 'Értesítés szerkesztése',
        'Show in agent preferences' => 'Megjelenítés az ügyintézői beállításokban',
        'Agent preferences tooltip' => 'Ügyintézői beállítások buboréksúgó',
        'This message will be shown on the agent preferences screen as a tooltip for this notification.' =>
            'Ez az üzenet egy buboréksúgóként lesz megjelenítve az ügyintézői beállítások képernyőn ennél az értesítésnél.',
        'Here you can choose which events will trigger this notification. An additional ticket filter can be applied below to only send for ticket with certain criteria.' =>
            'Itt választhatja ki, hogy mely események fogják aktiválni ezt az értesítést. Egy további jegyszűrő alkalmazható lent a csak egy bizonyos feltétellel rendelkező jegynél történő küldéshez.',
        'Ticket Filter' => 'Jegyszűrő',
        'Article Filter' => 'Bejegyzés szűrő',
        'Only for ArticleCreate and ArticleSend event' => 'Csak ArticleCreate és ArticleSend eseménynél',
        'Article type' => 'Bejegyzés típusa',
        'If ArticleCreate or ArticleSend is used as a trigger event, you need to specify an article filter as well. Please select at least one of the article filter fields.' =>
            'Ha az ArticleCreate vagy ArticleSend aktiváló eseményként van használva, meg kell adnia egy bejegyzés szűrőt is. Válasszon legalább egyet a bejegyzés szűrő mezőkből.',
        'Article sender type' => 'Bejegyzés küldő típus',
        'Subject match' => 'Tárgy egyezés',
        'Body match' => 'Törzs egyezés',
        'Include attachments to notification' => 'Mellékletek felvétele az értesítésbe',
        'Recipients' => 'Címzettek',
        'Send to' => 'Küldés neki',
        'Send to these agents' => 'Küldés ezeknek az ügyintézőknek',
        'Send to all group members' => 'Küldés az összes csoporttagnak',
        'Send to all role members' => 'Küldés az összes szereptagnak',
        'Send on out of office' => 'Küldés irodán kívüli állapotban',
        'Also send if the user is currently out of office.' => 'Akkor is küldje el, ha a felhasználó jelenleg irodán kívül van.',
        'Once per day' => 'Naponta egyszer',
        'Notify user just once per day about a single ticket using a selected transport.' =>
            'A felhasználó értesítése csak egyszer egy nap egy egyedüli jegyről egy kiválasztott átvitel használatával.',
        'Notification Methods' => 'Értesítési módszerek',
        'These are the possible methods that can be used to send this notification to each of the recipients. Please select at least one method below.' =>
            'Ezek azok a lehetséges módszerek, amelyek ezen értesítés küldéséhez használhatók az egyes címzettek részére. Válasszon lent legalább egy módszert.',
        'Enable this notification method' => 'Értesítési módszer engedélyezése',
        'Transport' => 'Átvitel',
        'At least one method is needed per notification.' => 'Legalább egy módszer szükséges értesítésenként.',
        'Active by default in agent preferences' => 'Alapértelmezetten bekapcsolva az ügyintézői beállításokban',
        'This is the default value for assigned recipient agents who didn\'t make a choice for this notification in their preferences yet. If the box is enabled, the notification will be sent to such agents.' =>
            'Ez az alapértelmezett érték az olyan hozzárendelt címzett ügyintézőknél, akik még nem választottak ennél az értesítésnél a beállításaikban. Ha a doboz engedélyezve van, akkor az értesítés el lesz küldve az ilyen ügyintézőknek.',
        'This feature is currently not available.' => 'Ez a szolgáltatás jelenleg nem érhető el.',
        'No data found' => 'Nem található adat',
        'No notification method found.' => 'Nem található értesítési módszer.',
        'Notification Text' => 'Értesítési szöveg',
        'This language is not present or enabled on the system. This notification text could be deleted if it is not needed anymore.' =>
            'Ez a nyelv nincs jelen vagy nincs engedélyezve a rendszeren. Ez az értesítési szöveg törölhető, ha többé nincs rá szükség.',
        'Remove Notification Language' => 'Értesítési nyelv eltávolítása',
        'Message body' => 'Üzenettörzs',
        'Add new notification language' => 'Új értesítési nyelv hozzáadása',
        'Do you really want to delete this notification language?' => 'Valóban törölni szeretné ezt az értesítési nyelvet?',
        'Tag Reference' => 'Címke hivatkozás',
        'Notifications are sent to an agent or a customer.' => 'Az értesítések ügyintézőnek vagy ügyfélnek kerülnek elküldésre.',
        'To get the first 20 character of the subject (of the latest agent article).' =>
            '(A legutóbbi ügyintéző bejegyzés) tárgya első 20 karakterének lekéréséhez.',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            '(A legutóbbi ügyintéző bejegyzés) törzse első 5 sorának lekéréséhez.',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            '(A legutóbbi ügyfél bejegyzés) tárgya első 20 karakterének lekéréséhez.',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            '(A legutóbbi ügyfél bejegyzés) törzse első 5 sorának lekéréséhez.',
        'Attributes of the current customer user data' => 'A jelenlegi ügyfél-felhasználó adatainak jellemzői',
        'Attributes of the current ticket owner user data' => 'A jelenlegi jegytulajdonos felhasználóadatainak jellemzői',
        'Attributes of the current ticket responsible user data' => 'A jelenlegi jegyfelelős felhasználóadatainak jellemzői',
        'Attributes of the current agent user who requested this action' =>
            'A jelenlegi ügyintéző-felhasználó jellemzői, aki ezt a műveletet kérte',
        'Attributes of the recipient user for the notification' => 'A címzett felhasználó jellemzői az értesítésnél',
        'Attributes of the ticket data' => 'A jegy adatainak jellemzői',
        'Ticket dynamic fields internal key values' => 'A jegy dinamikus mezőinek belső kulcs értékei',
        'Ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'A jegy dinamikus mezőinek megjelenített értékei, legördülő és többválasztós mezőknél hasznos',
        'Example notification' => 'Példa értesítés',

        # Template: AdminNotificationEventTransportEmailSettings
        'Additional recipient email addresses' => 'További címzett e-mail címek',
        'You can use OTRS-tags like <OTRS_TICKET_DynamicField_...> to insert values from the current ticket.' =>
            'Használhatja az OTRS címkéket (mint például <OTRS_TICKET_DynamicField_...>) értékek beszúrásához a jelenlegi jegyből.',
        'Notification article type' => 'Értesítési bejegyzés típusa',
        'An article will be created if the notification is sent to the customer or an additional email address.' =>
            'Egy bejegyzés lesz létrehozva, ha az értesítés elküldésre került az ügyfélnek vagy egy további e-mail címre.',
        'Email template' => 'E-mail sablon',
        'Use this template to generate the complete email (only for HTML emails).' =>
            'Ezen sablon használata a teljes e-mail előállításához (csak HTML e-maileknél).',
        'Enable email security' => 'E-mail biztonság engedélyezése',
        'Email security level' => 'E-mail biztonsági szint',
        'If signing key/certificate is missing' => 'Ha az aláíró kulcs vagy tanúsítvány hiányzik',
        'If encryption key/certificate is missing' => 'Ha a titkosító kulcs vagy tanúsítvány hiányzik',

        # Template: AdminOTRSBusinessInstalled
        'Manage %s' => '%s kezelése',
        'Downgrade to OTRS Free' => 'Visszaváltás az ingyenes OTRS-re',
        'Read documentation' => 'Dokumentáció elolvasása',
        '%s makes contact regularly with cloud.otrs.com to check on available updates and the validity of the underlying contract.' =>
            'A(z) %s rendszeresen kapcsolatot létesít a cloud.otrs.com kiszolgálóval az elérhető frissítések és az alapjául szolgáló szerződés érvényességének ellenőrzéséhez.',
        'Unauthorized Usage Detected' => 'Jogosulatlan használat észlelhető',
        'This system uses the %s without a proper license! Please make contact with %s to renew or activate your contract!' =>
            'Ez a rendszer a megfelelő licenc nélkül használja a(z) %s programot. A szerződés megújításához vagy aktiválásához vegye fel a kapcsolatot a következővel: %s!',
        '%s not Correctly Installed' => '%s nincs helyesen telepítve',
        'Your %s is not correctly installed. Please reinstall it with the button below.' =>
            'A(z) %s nincs helyesen telepítve. Telepítse újra a lenti gombbal.',
        'Reinstall %s' => '%s újratelepítése',
        'Your %s is not correctly installed, and there is also an update available.' =>
            'A(z) %s nincs helyesen telepítve, és egy frissítés is elérhető.',
        'You can either reinstall your current version or perform an update with the buttons below (update recommended).' =>
            'Újratelepítheti a jelenlegi verziót, vagy elvégezhet egy frissítést a lenti gombbal (a frissítés javasolt).',
        'Update %s' => '%s frissítése',
        '%s Not Yet Available' => '%s még nem érhető el',
        '%s will be available soon.' => '%s hamarosan elérhető lesz.',
        '%s Update Available' => '%s frissítés érhető el',
        'An update for your %s is available! Please update at your earliest!' =>
            'Frissítés érhető el a(z) %s programhoz! Frissítsen a lehető leghamarabb!',
        '%s Correctly Deployed' => 'A(z) %s helyesen üzembe állítva',
        'Congratulations, your %s is correctly installed and up to date!' =>
            'Gratulálunk, a(z) %s program helyesen telepítve van és naprakész!',

        # Template: AdminOTRSBusinessNotInstalled
        '%s will be available soon. Please check again in a few days.' =>
            'A(z) %s hamarosan elérhető lesz. Ellenőrizze ismét néhány nap múlva.',
        'Please have a look at %s for more information.' => 'Vessen egy pillantást a(z) %s címre a további információkért.',
        'Your OTRS Free is the base for all future actions. Please register first before you continue with the upgrade process of %s!' =>
            'Az ingyenes OTRS az alapja minden további műveletnek. Először regisztráljon, mielőtt folytatja a(z) %s frissítési folyamatát!',
        'Before you can benefit from %s, please contact %s to get your %s contract.' =>
            'Mielőtt hasznot húzna a(z) %s programból, kérjük lépjen kapcsolatba a szolgáltatóval (%s) a(z) %s szerződés beszerzéséhez.',
        'Connection to cloud.otrs.com via HTTPS couldn\'t be established. Please make sure that your OTRS can connect to cloud.otrs.com via port 443.' =>
            'Nem sikerült kapcsolatot létesíteni HTTPS-en keresztül a cloud.otrs.com hellyel. Győződjön meg arról, hogy az OTRS rendszere tud-e kapcsolódni a cloud.otrs.com címre a 443-as porton.',
        'With your existing contract you can only use a small part of the %s.' =>
            'A meglévő szerződésével csak egy kis részét tudja használni a(z) %s programnak.',
        'If you would like to take full advantage of the %s get your contract upgraded now! Contact %s.' =>
            'Ha a(z) %s minden előnyét igénybe szeretné venni, akkor frissítse most a szerződését! Kapcsolatfelvétel: %s.',

        # Template: AdminOTRSBusinessUninstall
        'Cancel downgrade and go back' => 'Visszaváltás megszakítása és visszalépés',
        'Go to OTRS Package Manager' => 'Ugrás az OTRS csomagkezelőhöz',
        'Sorry, but currently you can\'t downgrade due to the following packages which depend on %s:' =>
            'Sajnáljuk, de jelenleg nem válthat vissza a következő csomagok miatt, amelyek ettől függnek: %s:',
        'Vendor' => 'Gyártó',
        'Please uninstall the packages first using the package manager and try again.' =>
            'Először távolítsa el a csomagokat a csomagkezelő használatával, majd próbálja újra.',
        'You are about to downgrade to OTRS Free and will lose the following features and all data related to these:' =>
            'Arra készül, hogy visszavált az ingyenes OTRS-re, és el fogja veszíteni a következő szolgáltatásokat és minden ezekhez kapcsolódó adatot:',
        'Chat' => 'Csevegés',
        'Report Generator' => 'Jelentés előállító',
        'Timeline view in ticket zoom' => 'Idővonal nézet a jegynagyításban',
        'DynamicField ContactWithData' => 'Dinamikus mező ContactWithData',
        'DynamicField Database' => 'Dinamikus mező adatbázis',
        'SLA Selection Dialog' => 'SLA kiválasztó párbeszédablak',
        'Ticket Attachment View' => 'Jegymelléklet nézet',
        'The %s skin' => 'A(z) %s felszín',

        # Template: AdminPGP
        'PGP Management' => 'PGP kezelés',
        'PGP support is disabled' => 'A PGP támogatás le van tiltva',
        'To be able to use PGP in OTRS, you have to enable it first.' => 'Hogy képes legyen PGP-t használni az OTRS-ben, ahhoz először engedélyeznie kell azt.',
        'Enable PGP support' => 'PGP támogatás engedélyezése',
        'Faulty PGP configuration' => 'Hibás PGP beállítás',
        'PGP support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'A PGP támogatás engedélyezve van, de a hozzá tartozó beállítások hibákat tartalmaznak. Ellenőrizze a beállításokat a lenti gomb használatával.',
        'Configure it here!' => 'Itt állítsa be!',
        'Check PGP configuration' => 'PGP beállítások ellenőrzése',
        'Add PGP key' => 'PGP kulcs hozzáadása',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'Ezzel a módszerrel közvetlenül szerkesztheti a kulcstartót, amit a rendszer beállításainál beállított.',
        'Introduction to PGP' => 'Bevezetés a PGP-be',
        'Result' => 'Eredmény',
        'Identifier' => 'Azonosító',
        'Bit' => 'Bit',
        'Fingerprint' => 'Ujjlenyomat',
        'Expires' => 'Lejárat',
        'Delete this key' => 'Kulcs törlése',
        'Add PGP Key' => 'PGP kulcs hozzáadása',
        'PGP key' => 'PGP kulcs',

        # Template: AdminPackageManager
        'Package Manager' => 'Csomagkezelő',
        'Uninstall package' => 'Csomag eltávolítása',
        'Do you really want to uninstall this package?' => 'Valóban el szeretné távolítani ezt a csomagot?',
        'Reinstall package' => 'Csomag újratelepítése',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'Valóban újra szeretné telepíteni ezt a csomagot? Minden kézi változtatás el fog veszni.',
        'Continue' => 'Folytatás',
        'Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Győződjön meg arról, hogy az adatbázisa elfogad-e %s MB méretűnél nagyobb csomagot (jelenleg csak legfeljebb %s MB méretű csomagot fogad el). A hibák elkerülése érdekében alkalmazkodjon az adatbázisa max_allowed_packet beállításához.',
        'Install' => 'Telepítés',
        'Install Package' => 'Csomag telepítése',
        'Update repository information' => 'Tároló-információk frissítése',
        'Cloud services are currently disabled.' => 'A felhőszolgáltatások jelenleg le vannak tiltva.',
        'OTRS Verify™ can not continue!' => 'Az OTRS Verify™ nem folytatható!',
        'Enable cloud services' => 'Felhőszolgáltatások engedélyezése',
        'Online Repository' => 'Online tároló',
        'Module documentation' => 'Modul-dokumentáció',
        'Upgrade' => 'Frissítés',
        'Local Repository' => 'Helyi tároló',
        'This package is verified by OTRSverify (tm)' => 'Ezt a csomagot az OTRSverify (tm) ellenőrizte.',
        'Uninstall' => 'Eltávolítás',
        'Reinstall' => 'Újratelepítés',
        'Features for %s customers only' => 'Csak a(z) %s ügyfelek szolgáltatásai',
        'With %s, you can benefit from the following optional features. Please make contact with %s if you need more information.' =>
            'A(z) %s használatával a következő opcionális szolgáltatások előnyeit élvezheti. Ha további információkra van szüksége, akkor vegye fel a kapcsolatot a következővel: %s.',
        'Download package' => 'Csomag letöltése',
        'Rebuild package' => 'Csomag újraépítése',
        'Metadata' => 'Metaadatok',
        'Change Log' => 'Változásnapló',
        'Date' => 'Dátum',
        'List of Files' => 'Fájlok listája',
        'Permission' => 'Jogosultság',
        'Download' => 'Letöltés',
        'Download file from package!' => 'Fájl letöltése a csomagból!',
        'Required' => 'Kötelező',
        'Primary Key' => 'Elsődleges kulcs',
        'Auto Increment' => 'Automatikus növelés',
        'SQL' => 'SQL',
        'File differences for file %s' => 'Fájleltérések ezzel a fájllal: %s',

        # Template: AdminPerformanceLog
        'Performance Log' => 'Teljesítmény napló',
        'This feature is enabled!' => 'Ez a szolgáltatás engedélyezve van!',
        'Just use this feature if you want to log each request.' => 'Csak akkor használja ezt a szolgáltatást, ha minden egyes kérést naplózni szeretne.',
        'Activating this feature might affect your system performance!' =>
            'A szolgáltatás aktiválása hatással lehet a rendszer teljesítményére!',
        'Disable it here!' => 'Itt tiltsa le!',
        'Logfile too large!' => 'A naplófájl túl nagy!',
        'The logfile is too large, you need to reset it' => 'A naplófájl túl nagy, vissza kell állítania azt',
        'Overview' => 'Áttekintés',
        'Range' => 'Tartomány',
        'last' => 'utolsó',
        'Interface' => 'Felület',
        'Requests' => 'Kérések',
        'Min Response' => 'Legkisebb válasz',
        'Max Response' => 'Legnagyobb válasz',
        'Average Response' => 'Átlagos válasz',
        'Period' => 'Időszak',
        'Min' => 'Legkisebb',
        'Max' => 'Legnagyobb',
        'Average' => 'Átlag',

        # Template: AdminPostMasterFilter
        'PostMaster Filter Management' => 'Levelezési szűrőkezelés',
        'Add filter' => 'Szűrő hozzáadása',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Az e-mail fejléceken alapuló bejövő e-mailek kézbesítéséhez vagy szűréséhez. A reguláris kifejezések használatával való illesztés szintén lehetséges.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Ha csak az e-mail cím egyezését szeretné vizsgálni, használja az EMAILADDRESS:info@example.com kifejezést a feladó, a címzett vagy a másolat mezőkben.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Ha reguláris kifejezéseket használ, akkor a () belsejében lévő egyező értéket is használhatja [***] formában a „Beállítás” műveletben.',
        'Delete this filter' => 'Szűrő törlése',
        'Do you really want to delete this filter?' => 'Valóban törölni szeretné ezt a szűrőt?',
        'Add PostMaster Filter' => 'Levelezési szűrő hozzáadása',
        'Edit PostMaster Filter' => 'Levelezési szűrő szerkesztése',
        'The name is required.' => 'A név kötelező.',
        'Filter Condition' => 'Szűrőfeltétel',
        'AND Condition' => 'ÉS feltétel',
        'Check email header' => 'E-mail fejléc ellenőrzése',
        'Negate' => 'Tagadás',
        'Look for value' => 'Érték keresése',
        'The field needs to be a valid regular expression or a literal word.' =>
            'Ennek a mezőnek érvényes reguláris kifejezésnek vagy szóliterálnak kell lennie.',
        'Set Email Headers' => 'E-mail fejlécek beállítása',
        'Set email header' => 'E-mail fejléc beállítása',
        'Set value' => 'Érték beállítása',
        'The field needs to be a literal word.' => 'Ennek a mezőnek szóliterálnak kell lennie.',

        # Template: AdminPriority
        'Priority Management' => 'Prioritás-kezelés',
        'Add priority' => 'Prioritás hozzáadása',
        'Add Priority' => 'Prioritás hozzáadása',
        'Edit Priority' => 'Prioritás szerkesztése',

        # Template: AdminProcessManagement
        'Process Management' => 'Folyamatkezelés',
        'Filter for Processes' => 'Szűrő a folyamatokhoz',
        'Create New Process' => 'Új folyamat létrehozása',
        'Deploy All Processes' => 'Minden folyamat üzembe állítása',
        'Here you can upload a configuration file to import a process to your system. The file needs to be in .yml format as exported by process management module.' =>
            'Itt tölthet fel egy beállítófájlt egy folyamat importálásához a rendszerre. A fájlnak .yml formátumban kell lennie, ahogy a folyamatkezelő modul exportálta.',
        'Overwrite existing entities' => 'Meglévő bejegyzések felülírása',
        'Upload process configuration' => 'Folyamat-beállítás feltöltése',
        'Import process configuration' => 'Folyamat-beállítás importálása',
        'Ready-to-run Processes' => 'Futtatásra kész folyamatok',
        'Here you can activate ready-to-run processes showcasing our best practices. Please note that some additional configuration may be required.' =>
            'Itt kapcsolhatja be a legjobb gyakorlatainkat bemutató futtatásra kész folyamatokat. Ne feledje, hogy néhány további beállítás lehet szükséges.',
        'Would you like to benefit from processes created by experts? Upgrade to %s to import some sophisticated ready-to-run processes.' =>
            'Szeretné élvezni a szakértők által létrehozott folyamatok előnyeit? Ahhoz, hogy importálhasson néhány kitapasztalt futtatásra kész folyamatot, frissítsen a következőre: %s.',
        'Import ready-to-run process' => 'Futtatásra kész folyamat importálása',
        'To create a new Process you can either import a Process that was exported from another system or create a complete new one.' =>
            'Egy új folyamat létrehozásához importálhat egy másik rendszerből exportált folyamatot, vagy létrehozhat egy teljesen újat.',
        'Changes to the Processes here only affect the behavior of the system, if you synchronize the Process data. By synchronizing the Processes, the newly made changes will be written to the Configuration.' =>
            'A folyamatokon itt elvégzett módosítás csak akkor lesz hatással a rendszer viselkedésére, ha szinkronizálja a folyamatadatokat. A folyamatok szinkronizálásával az újonnan elvégzett módosítások be lesznek írva a beállításokba.',
        'Processes' => 'Folyamatok',
        'Process name' => 'Folyamat neve',
        'Print' => 'Nyomtatás',
        'Export Process Configuration' => 'Folyamat-beállítás exportálása',
        'Copy Process' => 'Folyamat másolása',

        # Template: AdminProcessManagementActivity
        'Cancel & close' => 'Megszakítás és bezárás',
        'Go Back' => 'Vissza',
        'Please note, that changing this activity will affect the following processes' =>
            'Ne feledje, hogy a tevékenység módosítása érinteni fogja a következő folyamatokat',
        'Activity' => 'Tevékenység',
        'Activity Name' => 'Tevékenység neve',
        'Activity Dialogs' => 'Tevékenység párbeszédek',
        'You can assign Activity Dialogs to this Activity by dragging the elements with the mouse from the left list to the right list.' =>
            'Tevékenység párbeszédeket rendelhet hozzá ehhez a tevékenységhez, ha az elemeket bal oldali listából a jobb oldali listába húzza az egérrel.',
        'Ordering the elements within the list is also possible by drag \'n\' drop.' =>
            'Lehetőség van az elemek rendezésére is a listán belül fogd és vidd módon.',
        'Filter available Activity Dialogs' => 'Elérhető tevékenység párbeszédek szűrése',
        'Available Activity Dialogs' => 'Elérhető tevékenység párbeszédek',
        'Name: %s, EntityID: %s' => 'Név: %s, egyedazonosító: %s',
        'Create New Activity Dialog' => 'Új tevékenység párbeszéd létrehozása',
        'Assigned Activity Dialogs' => 'Hozzárendelt tevékenység párbeszédek',
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?' =>
            'Amint ezt a gombot vagy hivatkozást használja, el fogja hagyni ezt a képernyőt, és a jelenlegi állapota automatikusan el lesz mentve. Szeretné folytatni?',

        # Template: AdminProcessManagementActivityDialog
        'Please note that changing this activity dialog will affect the following activities' =>
            'Ne feledje, hogy a tevékenység párbeszéd módosítása érinteni fogja a következő tevékenységeket',
        'Please note that customer users will not be able to see or use the following fields: Owner, Responsible, Lock, PendingTime and CustomerID.' =>
            'Ne feledje, hogy az ügyfél-felhasználók nem lesznek képesek megtekinteni vagy használni a következő mezőket: tulajdonos, felelős, zár, várakozási idő, ügyfél-azonosító.',
        'The Queue field can only be used by customers when creating a new ticket.' =>
            'Az ügyfelek csak a várólista mezőt használhatják egy új jegy létrehozásakor.',
        'Activity Dialog' => 'Tevékenység párbeszéd',
        'Activity dialog Name' => 'Tevékenység párbeszéd neve',
        'Available in' => 'Elérhető ebben',
        'Description (short)' => 'Leírás (rövid)',
        'Description (long)' => 'Leírás (hosszú)',
        'The selected permission does not exist.' => 'A kijelölt jogosultság nem létezik.',
        'Required Lock' => 'Zárolás szükséges',
        'The selected required lock does not exist.' => 'A kijelölt szükséges zárolás nem létezik.',
        'Submit Advice Text' => 'Elküldés értesítőszövege',
        'Submit Button Text' => 'Elküldés gomb szövege',
        'Fields' => 'Mezők',
        'You can assign Fields to this Activity Dialog by dragging the elements with the mouse from the left list to the right list.' =>
            'Mezőket rendelhet hozzá ehhez a tevékenység párbeszédhez, ha az elemeket bal oldali listából a jobb oldali listába húzza az egérrel.',
        'Filter available fields' => 'Elérhető mezők szűrése',
        'Available Fields' => 'Elérhető mezők',
        'Name: %s' => 'Név: %s',
        'Assigned Fields' => 'Hozzárendelt mezők',
        'ArticleType' => 'Bejegyzéstípus',
        'Display' => 'Megjelenítés',
        'Edit Field Details' => 'Mezőrészletek szerkesztése',
        'Customer interface does not support internal article types.' => 'Az ügyfélfelület nem támogatja a belső bejegyzéstípusokat.',

        # Template: AdminProcessManagementPath
        'Path' => 'Útvonal',
        'Edit this transition' => 'Átmenet szerkesztése',
        'Transition Actions' => 'Átmenet műveletek',
        'You can assign Transition Actions to this Transition by dragging the elements with the mouse from the left list to the right list.' =>
            'Átmenet műveleteket rendelhet hozzá ehhez az átmenethez, ha az elemeket bal oldali listából a jobb oldali listába húzza az egérrel.',
        'Filter available Transition Actions' => 'Elérhető átmenet műveletek szűrése',
        'Available Transition Actions' => 'Elérhető átmenet műveletek',
        'Create New Transition Action' => 'Új átmenet művelet létrehozása',
        'Assigned Transition Actions' => 'Hozzárendelt átmenet műveletek',

        # Template: AdminProcessManagementProcessAccordion
        'Activities' => 'Tevékenységek',
        'Filter Activities...' => 'Tevékenységek szűrése…',
        'Create New Activity' => 'Új tevékenység létrehozása',
        'Filter Activity Dialogs...' => 'Tevékenység párbeszédek szűrése…',
        'Transitions' => 'Átmenetek',
        'Filter Transitions...' => 'Átmenetek szűrése…',
        'Create New Transition' => 'Új átmenet létrehozása',
        'Filter Transition Actions...' => 'Átmenet műveletek szűrése…',

        # Template: AdminProcessManagementProcessEdit
        'Edit Process' => 'Folyamat szerkesztése',
        'Print process information' => 'Folyamat-információk nyomtatása',
        'Delete Process' => 'Folyamat törlése',
        'Delete Inactive Process' => 'Inaktív folyamat törlése',
        'Available Process Elements' => 'Elérhető folyamatelemek',
        'The Elements listed above in this sidebar can be moved to the canvas area on the right by using drag\'n\'drop.' =>
            'Az ezen az oldalsávon fent felsorolt elemek áthelyezhetők a jobb oldali vászonterületre fogd és vidd módon.',
        'You can place Activities on the canvas area to assign this Activity to the Process.' =>
            'Tevékenységeket helyezhet a vászonterületre a tevékenység hozzárendeléséhez a folyamathoz.',
        'To assign an Activity Dialog to an Activity drop the Activity Dialog element from this sidebar over the Activity placed in the canvas area.' =>
            'Egy tevékenység párbeszéd hozzárendeléséhez egy folyamathoz húzza a tevékenység párbeszédelemet a tevékenység fölött elhelyezett oldalsávról a vászonterületre.',
        'You can start a connection between two Activities by dropping the Transition element over the Start Activity of the connection. After that you can move the loose end of the arrow to the End Activity.' =>
            'Kapcsolatot létesíthet két tevékenység között, ha az átmenet elemet a kapcsolat kezdő tevékenysége fölé ejti. Ezután viheti a nyíl szabad végét a befejező tevékenységre.',
        'Actions can be assigned to a Transition by dropping the Action Element onto the label of a Transition.' =>
            'Műveletek rendelhetők egy átmenethez, ha a műveletelemet egy átmenet címkéjére ejti.',
        'Edit Process Information' => 'Folyamat-információk szerkesztése',
        'Process Name' => 'Folyamat neve',
        'The selected state does not exist.' => 'A kijelölt állapot nem létezik.',
        'Add and Edit Activities, Activity Dialogs and Transitions' => 'Tevékenységek, tevékenység párbeszédek és átmenetek hozzáadása és szerkesztése',
        'Show EntityIDs' => 'Entitás-azonosítók megjelenítése',
        'Extend the width of the Canvas' => 'A vászon szélességének kibővítése',
        'Extend the height of the Canvas' => 'A vászon magasságának kibővítése',
        'Remove the Activity from this Process' => 'Tevékenység eltávolítása ebből a folyamatból',
        'Edit this Activity' => 'Tevékenység szerkesztése',
        'Save Activities, Activity Dialogs and Transitions' => 'Tevékenységek, tevékenység párbeszédek és átmenetek mentése',
        'Do you really want to delete this Process?' => 'Valóban törölni szeretné ezt a folyamatot?',
        'Do you really want to delete this Activity?' => 'Valóban törölni szeretné ezt a tevékenységet?',
        'Do you really want to delete this Activity Dialog?' => 'Valóban törölni szeretné ezt a tevékenység párbeszédet?',
        'Do you really want to delete this Transition?' => 'Valóban törölni szeretné ezt az átmenetet?',
        'Do you really want to delete this Transition Action?' => 'Valóban törölni szeretné ezt az átmenet műveletet?',
        'Do you really want to remove this activity from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Valóban el szeretné távolítani ezt a tevékenységet a vászonról? Ezt csak akkor lehet változatlanul hagyni, ha mentés nélkül hagyja el ezt a képernyőt.',
        'Do you really want to remove this transition from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Valóban el szeretné távolítani ezt az átmenetet a vászonról? Ezt csak akkor lehet változatlanul hagyni, ha mentés nélkül hagyja el ezt a képernyőt.',
        'Hide EntityIDs' => 'Entitás-azonosítók elrejtése',
        'Delete Entity' => 'Entitás törlése',
        'Remove Entity from canvas' => 'Entitás eltávolítása a vászonról',
        'This Activity is already used in the Process. You cannot add it twice!' =>
            'Ez a tevékenység már használatban van a folyamatban. Nem adhatja hozzá kétszer!',
        'This Activity cannot be deleted because it is the Start Activity.' =>
            'Ez a tevékenység nem törölhető, mert ez a kezdő tevékenység.',
        'This Transition is already used for this Activity. You cannot use it twice!' =>
            'Ez az átmenet már használatban van a tevékenységben. Nem használhatja kétszer!',
        'This TransitionAction is already used in this Path. You cannot use it twice!' =>
            'Ez az átmenet művelet már használatban van az útvonalon. Nem használhatja kétszer!',
        'Remove the Transition from this Process' => 'Átmenet eltávolítása ebből a folyamatból',
        'No TransitionActions assigned.' => 'Nincsenek átmenet műveletek hozzárendelve.',
        'The Start Event cannot loose the Start Transition!' => 'A kezdő esemény nem oldhatja fel a kezdő átmenetet!',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.' =>
            'Még nincsenek párbeszédek hozzárendelve. Csak fogjon meg egy tevékenység párbeszédet a bal oldali listából, és húzza ide.',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.' =>
            'Egy kapcsolatban nem lévő átmenet már el van helyezve a vásznon. Először csatlakoztassa ezt az átmenetet, mielőtt egy másik átmenetet helyezne el.',

        # Template: AdminProcessManagementProcessNew
        'In this screen, you can create a new process. In order to make the new process available to users, please make sure to set its state to \'Active\' and synchronize after completing your work.' =>
            'Ezen a képernyőn hozhat létre új folyamatot. Annak érdekében, hogy az új folyamatot elérhetővé tegye a felhasználóknak, győződjön meg arról, hogy „Aktívra” állította az állapotát, és szinkronizálta a munka befejezése után.',

        # Template: AdminProcessManagementProcessPrint
        'cancel & close' => 'megszakítás és bezárás',
        'Start Activity' => 'Tevékenység indítása',
        'Contains %s dialog(s)' => '%s párbeszédet tartalmaz',
        'Assigned dialogs' => 'Hozzárendelt párbeszédek',
        'Activities are not being used in this process.' => 'Ebben a folyamatban nem használnak tevékenységeket.',
        'Assigned fields' => 'Hozzárendelt mezők',
        'Activity dialogs are not being used in this process.' => 'Ebben a folyamatban nem használnak tevékenység párbeszédeket.',
        'Condition linking' => 'Feltétel kapcsolása',
        'Conditions' => 'Feltételek',
        'Condition' => 'Feltétel',
        'Transitions are not being used in this process.' => 'Ebben a folyamatban nem használnak átmeneteket.',
        'Module name' => 'Modulnév',
        'Transition actions are not being used in this process.' => 'Ebben a folyamatban nem használnak átmenet műveleteket.',

        # Template: AdminProcessManagementTransition
        'Please note that changing this transition will affect the following processes' =>
            'Ne feledje, hogy az átmenet módosítása érinteni fogja a következő folyamatokat',
        'Transition' => 'Átmenet',
        'Transition Name' => 'Átmenet neve',
        'Conditions can only operate on non-empty fields.' => 'A feltételek csak nem üres mezőkön működhetnek.',
        'Type of Linking between Conditions' => 'Kapcsolat típusa a feltételek között',
        'Remove this Condition' => 'Feltétel eltávolítása',
        'Type of Linking' => 'Kapcsolat típusa',
        'Add a new Field' => 'Új mező hozzáadása',
        'Remove this Field' => 'Mező eltávolítása',
        'And can\'t be repeated on the same condition.' => 'És nem lehet ismételni ugyanazon a feltételen.',
        'Add New Condition' => 'Új feltétel hozzáadása',

        # Template: AdminProcessManagementTransitionAction
        'Please note that changing this transition action will affect the following processes' =>
            'Ne feledje, hogy az átmenet művelet módosítása érinteni fogja a következő folyamatokat',
        'Transition Action' => 'Átmenet művelet',
        'Transition Action Name' => 'Átmenet művelet neve',
        'Transition Action Module' => 'Átmenet művelet modul',
        'Config Parameters' => 'Beállítási paraméterek',
        'Add a new Parameter' => 'Új paraméter hozzáadása',
        'Remove this Parameter' => 'Paraméter eltávolítása',

        # Template: AdminQueue
        'Manage Queues' => 'Várólisták kezelése',
        'Add queue' => 'Várólista hozzáadása',
        'Add Queue' => 'Várólista hozzáadása',
        'Edit Queue' => 'Várólista szerkesztése',
        'A queue with this name already exists!' => 'Már létezik ilyen nevű várólista!',
        'Sub-queue of' => 'Alvárólistája ennek',
        'Unlock timeout' => 'Feloldási időkorlát',
        '0 = no unlock' => '0 = nincs feloldás',
        'Only business hours are counted.' => 'Csak a nyitva tartás számít.',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Ha egy ügyintéző zárol egy jegyet, és nem zárja le a feloldási időkorlát elérése előtt, akkor a jegy fel lesz oldva, és elérhetővé válik más ügyintézőknek.',
        'Notify by' => 'Értesítés',
        '0 = no escalation' => '0 = nincs eszkaláció',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Ha az új jegyhez nem lett ügyfél-elérhetőség - külső e-mail cím vagy telefon - hozzáadva az itt megadott idő lejárta előtt, a jegy eszkalálva lesz.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Ha hozzá lett adva egy bejegyzés, úgymint követő e-mail vagy ügyfélportál, az eszkaláció frissítési ideje vissza lesz állítva. Ha nincs ügyfél-elérhetőség - külső e-mail cím vagy telefon - hozzáadva az itt megadott idő lejárta előtt, a jegy eszkalálva lesz.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Ha a jegy nem lett lezártra állítva az itt megadott idő lejárta előtt, a jegy eszkalálva lesz.',
        'Follow up Option' => 'Követés beállítás',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Megadja, hogy a lezárt jegyek követése újranyissa a jegyet, elutasítsa, vagy egy új jegyhez vezessen.',
        'Ticket lock after a follow up' => 'Jegy zárolása egy követés után',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Ha egy jegy le van zárva, és az ügyfél egy követést küld, a jegy zárolva lesz a régi tulajdonosnak.',
        'System address' => 'Rendszercím',
        'Will be the sender address of this queue for email answers.' => 'Lesz-e a várólista feladójának címe a válasz e-mailekhez.',
        'Default sign key' => 'Alapértelmezett aláíró kulcs',
        'The salutation for email answers.' => 'A megszólítás a válasz e-mailekhez.',
        'The signature for email answers.' => 'Az aláírás a válasz e-mailekhez.',

        # Template: AdminQueueAutoResponse
        'Manage Queue-Auto Response Relations' => 'Várólista-automatikus válasz kapcsolatok kezelése',
        'This filter allow you to show queues without auto responses' => 'Ez a szűrő lehetővé teszi az automatikus válaszok nélküli várólisták megjelenítést',
        'Queues without auto responses' => 'Automatikus válaszok nélküli várólisták',
        'This filter allow you to show all queues' => 'Ez a szűrő lehetővé teszi az összes várólista megjelenítést',
        'Show all queues' => 'Az összes várólista megjelenítése',
        'Filter for Queues' => 'Szűrő a várólistákhoz',
        'Filter for Auto Responses' => 'Szűrő az automatikus válaszokhoz',
        'Auto Responses' => 'Automatikus válaszok',
        'Change Auto Response Relations for Queue' => 'Automatikus válasz kapcsolatok megváltoztatása egy várólistánál',

        # Template: AdminQueueTemplates
        'Manage Template-Queue Relations' => 'Sablon-várólista kapcsolatok kezelése',
        'Filter for Templates' => 'Szűrő a sablonokhoz',
        'Templates' => 'Sablonok',
        'Change Queue Relations for Template' => 'Várólista-kapcsolatok megváltoztatása egy sablonnál',
        'Change Template Relations for Queue' => 'Sablonkapcsolatok megváltoztatása egy várólistánál',

        # Template: AdminRegistration
        'System Registration Management' => 'Rendszer regisztráció kezelés',
        'Edit details' => 'Részletek szerkesztése',
        'Show transmitted data' => 'Átvitt adatok megtekintése',
        'Deregister system' => 'Rendszer regisztrációjának törlése',
        'Overview of registered systems' => 'Regisztrált rendszerek áttekintése',
        'This system is registered with OTRS Group.' => 'Ez a rendszer regisztrálva van az OTRS csoporttal.',
        'System type' => 'Rendszertípus',
        'Unique ID' => 'Egyedi azonosító',
        'Last communication with registration server' => 'Utolsó kommunikáció a regisztrációs kiszolgálóval',
        'System registration not possible' => 'A rendszer regisztrációja nem lehetséges',
        'Please note that you can\'t register your system if OTRS Daemon is not running correctly!' =>
            'Ne feledje, hogy nem tudja regisztrálni a rendszerét, ha az OTRS démon nem fut helyesen!',
        'Instructions' => 'Utasítások',
        'System deregistration not possible' => 'A rendszer regisztrációjának megszüntetése nem lehetséges',
        'Please note that you can\'t deregister your system if you\'re using the %s or having a valid service contract.' =>
            'Ne feledje, hogy hogy nem tudja a rendszer regisztrációját megszüntetni a(z) %s használatakor, vagy ha érvényes szolgáltatói szerződése van.',
        'OTRS-ID Login' => 'OTRS-azonosító bejelentkezés',
        'Read more' => 'Olvassa tovább',
        'You need to log in with your OTRS-ID to register your system.' =>
            'Be kell jelentkeznie az OTRS-azonosítójával a rendszer regisztrálásához.',
        'Your OTRS-ID is the email address you used to sign up on the OTRS.com webpage.' =>
            'Az OTRS-azonosítója az OTRS.com weboldalon a regisztrációhoz használt e-mail címe.',
        'Data Protection' => 'Adatvédelem',
        'What are the advantages of system registration?' => 'Mik a rendszer regisztrálásának előnyei?',
        'You will receive updates about relevant security releases.' => 'Frissítéseket kap a fontos biztonsági kiadásokról.',
        'With your system registration we can improve our services for you, because we have all relevant information available.' =>
            'A rendszer regisztrálása által tovább fejleszthetjük a szolgáltatásainkat, mert nekünk minden fontos információ elérhető.',
        'This is only the beginning!' => 'És ez még csak a kezdet!',
        'We will inform you about our new services and offerings soon.' =>
            'Hamarosan értesíteni fogjuk az új szolgáltatásainkról és ajánlatainkról.',
        'Can I use OTRS without being registered?' => 'Használható az OTRS regisztráció nélkül?',
        'System registration is optional.' => 'A rendszer regisztrációja opcionális.',
        'You can download and use OTRS without being registered.' => 'Letöltheti és használhatja az OTRS-t anélkül, hogy regisztrálva lenne.',
        'Is it possible to deregister?' => 'Lehetséges a regisztráció törlése?',
        'You can deregister at any time.' => 'Bármikor törölheti a regisztrációt.',
        'Which data is transfered when registering?' => 'Milyen adatok kerülnek átvitelre a regisztrációkor?',
        'A registered system sends the following data to OTRS Group:' => 'Egy regisztrált rendszer a következő adatokat küldi az OTRS csoportnak:',
        'Fully Qualified Domain Name (FQDN), OTRS version, Database, Operating System and Perl version.' =>
            'Teljes képzésű tartománynév (FQDN), OTRS verzió, adatbázis, operációs rendszer és Perl verzió.',
        'Why do I have to provide a description for my system?' => 'Miért kell leírást megadnom a rendszeremhez?',
        'The description of the system is optional.' => 'A rendszer leírása opcionális.',
        'The description and system type you specify help you to identify and manage the details of your registered systems.' =>
            'A megadott leírás és a rendszer típusa segít az azonosításban, és a regisztrált rendszer részleteinek kezelésében.',
        'How often does my OTRS system send updates?' => 'Milyen gyakran küld az OTRS rendszerem frissítéseket?',
        'Your system will send updates to the registration server at regular intervals.' =>
            'A rendszer szabályos időközönként fog frissítéseket küldeni a regisztrációs kiszolgálónak.',
        'Typically this would be around once every three days.' => 'Ez tipikusan nagyjából három naponta történik.',
        'In case you would have further questions we would be glad to answer them.' =>
            'Abban az esetben, ha további kérdései vannak, szívesen megválaszoljuk azokat.',
        'Please visit our' => 'Látogassa meg a',
        'portal' => 'portálunkat',
        'and file a request.' => 'és küldje el a kérését.',
        'If you deregister your system, you will lose these benefits:' =>
            'Ha megszünteti a rendszer regisztrációját, a következő előnyöket fogja elveszíteni:',
        'You need to log in with your OTRS-ID to deregister your system.' =>
            'Be kell jelentkeznie az OTRS-azonosítójával a rendszere regisztrációjának törléséhez.',
        'OTRS-ID' => 'OTRS-azonosító',
        'You don\'t have an OTRS-ID yet?' => 'Még nincs OTRS-azonosítója?',
        'Sign up now' => 'Regisztráljon most',
        'Forgot your password?' => 'Elfelejtette a jelszavát?',
        'Retrieve a new one' => 'Kérjen egy újat',
        'This data will be frequently transferred to OTRS Group when you register this system.' =>
            'Ezek az adatok rendszeresen el lesznek küldve az OTRS csoportnak, ha regisztrálja a rendszerét.',
        'Attribute' => 'Jellemző',
        'FQDN' => 'FQDN',
        'OTRS Version' => 'OTRS verzió',
        'Operating System' => 'Operációs rendszer',
        'Perl Version' => 'Perl verzió',
        'Optional description of this system.' => 'A rendszer opcionális leírása.',
        'Register' => 'Regisztráció',
        'Deregister System' => 'Rendszer regisztrációjának törlése',
        'Continuing with this step will deregister the system from OTRS Group.' =>
            'Ha folytatja, ezzel a lépéssel törölni fogja a rendszer regisztrációját az OTRS csoportnál.',
        'Deregister' => 'Regisztráció törlése',
        'You can modify registration settings here.' => 'Itt módosíthatja a regisztrációs beállításokat.',
        'Overview of transmitted data' => 'Átvitt adatok áttekintése',
        'There is no data regularly sent from your system to %s.' => 'Nincsenek rendszeresen elküldött adatok a rendszeréről ide: %s.',
        'The following data is sent at minimum every 3 days from your system to %s.' =>
            'A következő adatok minimum 3 naponta lesznek elküldve a rendszeréről ide: %s.',
        'The data will be transferred in JSON format via a secure https connection.' =>
            'Az adatok JSON formátumban kerülnek átvitelre biztonságos https kapcsolaton keresztül.',
        'System Registration Data' => 'Rendszer regisztráció adatok',
        'Support Data' => 'Támogatási adatok',

        # Template: AdminRole
        'Role Management' => 'Szerepkezelés',
        'Add role' => 'Szerep hozzáadása',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Hozzon létre egy szerepet és tegyen bele csoportokat. Azután adja a szerepet a felhasználókhoz.',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'Nincsenek szerepek meghatározva. Használja a „Hozzáadás” gombot egy új szerep létrehozásához.',
        'Add Role' => 'Szerep hozzáadása',
        'Edit Role' => 'Szerep szerkesztése',

        # Template: AdminRoleGroup
        'Manage Role-Group Relations' => 'Szerep-csoport kapcsolatok kezelése',
        'Filter for Roles' => 'Szűrő a szerepekhez',
        'Roles' => 'Szerepek',
        'Select the role:group permissions.' => 'A szerep:csoport jogosultságok kiválasztása.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Ha semmi sincs kiválasztva, akkor ebben a csoportban nincsenek jogosultságok (a jegyek nem lesznek elérhetők a szerepnek).',
        'Change Role Relations for Group' => 'Szerepkapcsolatok megváltoztatása egy csoportnál',
        'Change Group Relations for Role' => 'Csoportkapcsolatok megváltoztatása egy szerepnél',
        'Toggle %s permission for all' => 'A(z) %s jogosultság ki- vagy bekapcsolása mindenkinek',
        'move_into' => 'átmozgatás',
        'Permissions to move tickets into this group/queue.' => 'Jogosultságok jegyek áthelyezéséhez ebbe a csoportba/várólistába.',
        'create' => 'létrehozás',
        'Permissions to create tickets in this group/queue.' => 'Jogosultságok új jegyek létrehozásához ebben a csoportban/várólistában.',
        'note' => 'jegyzet',
        'Permissions to add notes to tickets in this group/queue.' => 'Jogosultságok a jegyekhez való jegyzetek hozzáadásához ebben a csoportban/várólistában.',
        'owner' => 'tulajdonos',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Jogosultságok a jegyek tulajdonosának megváltoztatásához ebben a csoportban/várólistában.',
        'priority' => 'prioritás',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Jogosultságok a jegy prioritásnak megváltoztatásához ebben a csoportban/várólistában.',

        # Template: AdminRoleUser
        'Manage Agent-Role Relations' => 'Ügyintéző-szerep kapcsolatok kezelése',
        'Add agent' => 'Ügyintéző hozzáadása',
        'Filter for Agents' => 'Szűrő az ügyintézőkhöz',
        'Agents' => 'Ügyintézők',
        'Manage Role-Agent Relations' => 'Szerep-ügyintéző kapcsolatok kezelése',
        'Change Role Relations for Agent' => 'Szerepkapcsolatok megváltoztatása egy ügyintézőnél',
        'Change Agent Relations for Role' => 'Ügyintéző-kapcsolatok megváltoztatása egy szerepnél',

        # Template: AdminSLA
        'SLA Management' => 'SLA kezelés',
        'Add SLA' => 'SLA hozzáadása',
        'Edit SLA' => 'SLA szerkesztése',
        'Please write only numbers!' => 'Csak számokat írjon!',

        # Template: AdminSMIME
        'S/MIME Management' => 'S/MIME kezelés',
        'SMIME support is disabled' => 'Az S/MIME támogatás le van tiltva',
        'To be able to use SMIME in OTRS, you have to enable it first.' =>
            'Hogy képes legyen S/MIME-t használni az OTRS-ben, ahhoz először engedélyeznie kell azt.',
        'Enable SMIME support' => 'S/MIME támogatás engedélyezése',
        'Faulty SMIME configuration' => 'Hibás S/MIME beállítás',
        'SMIME support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'Az S/MIME támogatás engedélyezve van, de a hozzá tartozó beállítások hibákat tartalmaznak. Ellenőrizze a beállításokat a lenti gomb használatával.',
        'Check SMIME configuration' => 'S/MIME beállítások ellenőrzése',
        'Add certificate' => 'Tanúsítvány hozzáadása',
        'Add private key' => 'Személyes kulcs hozzáadása',
        'Filter for certificates' => 'Szűrő a tanúsítványokhoz',
        'Filter for S/MIME certs' => 'Szűrő az S/MIME tanúsítványokhoz',
        'To show certificate details click on a certificate icon.' => 'A tanúsítvány részleteinek megtekintéséhez kattintson a tanúsítvány ikonra.',
        'To manage private certificate relations click on a private key icon.' =>
            'A személyes tanúsítvány kapcsolatok kezeléséhez kattintson a személyes kulcs ikonra.',
        'Here you can add relations to your private certificate, these will be embedded to the S/MIME signature every time you use this certificate to sign an email.' =>
            'Itt adhat hozzá kapcsolatokat a személyes tanúsítványához, ezek lesznek beágyazva az S/MIME aláírásba minden alkalommal, amikor ezt a tanúsítványt egy e-mail aláírásához használja.',
        'See also' => 'Lásd még',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'Ily módon közvetlenül szerkesztheti a fájlrendszeren a tanúsítványokat és a személyes kulcsokat.',
        'Hash' => 'Kivonat',
        'Handle related certificates' => 'Kapcsolódó tanúsítványok kezelése',
        'Read certificate' => 'Tanúsítvány olvasása',
        'Delete this certificate' => 'Tanúsítvány törlése',
        'Add Certificate' => 'Tanúsítvány hozzáadása',
        'Add Private Key' => 'Személyes kulcs hozzáadása',
        'Secret' => 'Titok',
        'Related Certificates for' => 'Kapcsolódó tanúsítványok ehhez',
        'Delete this relation' => 'Kapcsolat törlése',
        'Available Certificates' => 'Elérhető tanúsítványok',
        'Relate this certificate' => 'Tanúsítvány összekapcsolása',

        # Template: AdminSMIMECertRead
        'Close dialog' => 'Párbeszédablak bezárása',
        'Certificate details' => 'Tanúsítvány részletek',

        # Template: AdminSalutation
        'Salutation Management' => 'Megszólítás kezelés',
        'Add salutation' => 'Megszólítás hozzáadása',
        'Add Salutation' => 'Megszólítás hozzáadása',
        'Edit Salutation' => 'Megszólítás szerkesztése',
        'e. g.' => 'például',
        'Example salutation' => 'Példa megszólítás',

        # Template: AdminSecureMode
        'Secure mode needs to be enabled!' => 'A biztonsági módot engedélyezni szükséges!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'A biztonságos mód (normális esetben) a kezdeti telepítés befejezése után lesz beállítva.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Ha a biztonságos mód nincs aktiválva, aktiválja a rendszerbeállításon keresztül, mert az alkalmazás már fut.',

        # Template: AdminSelectBox
        'SQL Box' => 'SQL doboz',
        'Here you can enter SQL to send it directly to the application database. It is not possible to change the content of the tables, only select queries are allowed.' =>
            'Itt tudja megadni az SQL-t, amelyet közvetlenül az alkalmazás adatbázisába küld. Nem lehetséges a táblák tartalmának megváltoztatása, csak kiválasztó lekérdezések engedélyezettek.',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Itt tudja megadni az SQL-t, amelyet közvetlenül az alkalmazás adatbázisába küld.',
        'Only select queries are allowed.' => 'Csak kiválasztó lekérdezések engedélyezettek.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'Az SQL lekérdezés szintaktikájában hiba van. Ellenőrizze azt.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'Legalább egy paraméter hiányzik a kötéshez. Ellenőrizze azt.',
        'Result format' => 'Eredmény formátum',
        'Run Query' => 'Lekérdezés futtatása',
        'Query is executed.' => 'Lekérdezés végrehajtva.',

        # Template: AdminService
        'Service Management' => 'Szolgáltatás kezelés',
        'Add service' => 'Szolgáltatás hozzáadása',
        'Add Service' => 'Szolgáltatás hozzáadása',
        'Edit Service' => 'Szolgáltatás szerkesztése',
        'Sub-service of' => 'Részszolgáltatása ennek',

        # Template: AdminSession
        'Session Management' => 'Munkamenet-kezelés',
        'All sessions' => 'Összes munkamenet',
        'Agent sessions' => 'Ügyintéző munkamenetek',
        'Customer sessions' => 'Ügyfél munkamenetek',
        'Unique agents' => 'Egyedi ügyintézők',
        'Unique customers' => 'Egyedi ügyfelek',
        'Kill all sessions' => 'Összes munkamenet kilövése',
        'Kill this session' => 'Munkamenet kilövése',
        'Session' => 'Munkamenet',
        'Kill' => 'Kilövés',
        'Detail View for SessionID' => 'A munkamenet-azonosító részletes nézete',

        # Template: AdminSignature
        'Signature Management' => 'Aláírás kezelés',
        'Add signature' => 'Aláírás hozzáadása',
        'Add Signature' => 'Aláírás hozzáadása',
        'Edit Signature' => 'Aláírás szerkesztése',
        'Example signature' => 'Példa aláírás',

        # Template: AdminState
        'State Management' => 'Állapot kezelés',
        'Add state' => 'Állapot hozzáadása',
        'Please also update the states in SysConfig where needed.' => 'Frissítse az állapotokat a rendszer beállításaiban is, ahol szükséges.',
        'Add State' => 'Állapot hozzáadása',
        'Edit State' => 'Állapot szerkesztése',
        'State type' => 'Állapottípus',

        # Template: AdminSupportDataCollector
        'Sending support data to OTRS Group is not possible!' => 'Nem lehetséges támogatási adatokat küldeni az OTRS csoportnak!',
        'Enable Cloud Services' => 'Felhőszolgáltatások engedélyezése',
        'This data is sent to OTRS Group on a regular basis. To stop sending this data please update your system registration.' =>
            'Ezeket az adatokat küldik el az OTRS csoportnak rendszeresen. Az adatok küldésének leállításához frissítse a rendszer regisztrációját.',
        'You can manually trigger the Support Data sending by pressing this button:' =>
            'Kézzel is aktiválhatja a támogatási adatok küldését a gomb megnyomásával:',
        'Send Update' => 'Frissítés küldése',
        'Sending Update...' => 'Frissítés küldése…',
        'Support Data information was successfully sent.' => 'A támogatási adatok információi sikeresen elküldve.',
        'Was not possible to send Support Data information.' => 'Nem volt lehetséges a támogatási adatok információinak küldése.',
        'Update Result' => 'Eredmény frissítése',
        'Currently this data is only shown in this system.' => 'Jelenleg ezek az adatok csak ezen a rendszeren jelennek meg.',
        'A support bundle (including: system registration information, support data, a list of installed packages and all locally modified source code files) can be generated by pressing this button:' =>
            'A támogatási csomag (tartalmazza: rendszer regisztrációs információk, támogatási adatok, telepített csomagok listája és minden helyileg módosított forráskód fájl) előállítható a gomb megnyomásával:',
        'Generate Support Bundle' => 'Támogatási csomag előállítása',
        'Generating...' => 'Előállítás…',
        'It was not possible to generate the Support Bundle.' => 'Nem volt lehetséges a támogatási csomag előállítása.',
        'Generate Result' => 'Előállítás eredménye',
        'Support Bundle' => 'Támogatási csomag',
        'The mail could not be sent' => 'A levelet nem sikerült elküldeni.',
        'The support bundle has been generated.' => 'A támogatási csomag előállítva.',
        'Please choose one of the following options.' => 'Válassza a következő lehetőségek egyikét.',
        'Send by Email' => 'Küldés e-mailben',
        'The support bundle is too large to send it by email, this option has been disabled.' =>
            'A támogatási csomag túl nagy az e-mailben történő küldéshez, ez a lehetőség le lett tiltva.',
        'The email address for this user is invalid, this option has been disabled.' =>
            'Ennek a felhasználónak az e-mail címe érvénytelen, ez a lehetőség le lett tiltva.',
        'Sending' => 'Küldés',
        'The support bundle will be sent to OTRS Group via email automatically.' =>
            'A támogatási csomag automatikusan el lesz küldve e-mailben az OTRS csoportnak.',
        'Download File' => 'Fájl letöltése',
        'A file containing the support bundle will be downloaded to the local system. Please save the file and send it to the OTRS Group, using an alternate method.' =>
            'A támogatási csomagot tartalmazó fájl le lesz töltve a helyi rendszerre. Mentse el a fájlt, és küldje el az OTRS csoportnak egy alternatív módszer használatával.',
        'Error: Support data could not be collected (%s).' => 'Hiba: A támogatási adatokat nem sikerült összegyűjteni (%s).',
        'Details' => 'Részletek',

        # Template: AdminSysConfig
        'SysConfig' => 'Rendszerbeállítások',
        'Navigate by searching in %s settings' => 'Navigáció %s beállításban való kereséssel',
        'Navigate by selecting config groups' => 'Navigáció a beállítási csoportok kiválasztásával',
        'Download all system config changes' => 'Minden rendszerbeállítás változtatás letöltése',
        'Export settings' => 'Beállítások exportálása',
        'Load SysConfig settings from file' => 'Rendszerbeállítások betöltése fájlból',
        'Import settings' => 'Beállítások importálása',
        'Import Settings' => 'Beállítások importálása',
        'Please enter a search term to look for settings.' => 'Adjon meg egy keresési kifejezést a beállítások kereséséhez.',
        'Subgroup' => 'Alcsoport',
        'Elements' => 'Elemek',

        # Template: AdminSysConfigEdit
        'Edit Config Settings in %s → %s' => 'Konfigurációs beállítások szerkesztése: %s → %s',
        'This setting is read only.' => 'Ez a beállítás csak olvasható.',
        'This config item is only available in a higher config level!' =>
            'Ez a beállítási elem csak magasabb beállítási szinten érhető el!',
        'Reset this setting' => 'Beállítás visszaállítása',
        'Error: this file could not be found.' => 'Hiba: ez a fájl nem található.',
        'Error: this directory could not be found.' => 'Hiba: ez a könyvtár nem található.',
        'Error: an invalid value was entered.' => 'Hiba: érvénytelen értéket adtak meg.',
        'Content' => 'Tartalom',
        'Remove this entry' => 'Bejegyzés eltávolítása',
        'Add entry' => 'Bejegyzés hozzáadása',
        'Remove entry' => 'Bejegyzés eltávolítása',
        'Add new entry' => 'Új bejegyzés hozzáadása',
        'Delete this entry' => 'Bejegyzés törlése',
        'Create new entry' => 'Új bejegyzés létrehozása',
        'New group' => 'Új csoport',
        'Group ro' => 'Csoport csak olvasható',
        'Readonly group' => 'Csak olvasható csoport',
        'New group ro' => 'Új csak olvasható csoport',
        'Loader' => 'Betöltő',
        'File to load for this frontend module' => 'Ehhez az előtétprogram-modulhoz betöltendő fájl',
        'New Loader File' => 'Új betöltő fájl',
        'NavBarName' => 'Navigációs sáv név',
        'NavBar' => 'Navigációs sáv',
        'LinkOption' => 'Kapcsolat beállítás',
        'Block' => 'Blokk',
        'AccessKey' => 'Hívóbetű',
        'Add NavBar entry' => 'Navigációs sáv bejegyzés hozzáadása',
        'NavBar module' => 'Navigációs sáv modul',
        'Year' => 'Év',
        'Month' => 'Hónap',
        'Day' => 'Nap',
        'Invalid year' => 'Érvénytelen év',
        'Invalid month' => 'Érvénytelen hónap',
        'Invalid day' => 'Érvénytelen nap',
        'Show more' => 'Több megjelenítése',

        # Template: AdminSystemAddress
        'System Email Addresses Management' => 'Rendszer e-mail címek kezelése',
        'Add system address' => 'Rendszercím hozzáadása',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Az összes, ezzel a címzett vagy másolati mezőben lévő címmel rendelkező bejövő e-mail a kijelölt várólistába lesz kézbesítve.',
        'Email address' => 'E-mail cím',
        'Display name' => 'Megjelenített név',
        'Add System Email Address' => 'Rendszer e-mail cím hozzáadása',
        'Edit System Email Address' => 'Rendszer e-mail cím szerkesztése',
        'The display name and email address will be shown on mail you send.' =>
            'A megjelenített név és az e-mail cím meg lesz jelenítve az elküldött leveleknél.',

        # Template: AdminSystemMaintenance
        'System Maintenance Management' => 'Rendszerkarbantartás kezelés',
        'Schedule New System Maintenance' => 'Új rendszerkarbantartás ütemezése',
        'Schedule a system maintenance period for announcing the Agents and Customers the system is down for a time period.' =>
            'Egy rendszerkarbantartás időszak ütemezése az ügyintézők és ügyfelek értesítéséhez, hogy a rendszer leáll egy időszakra.',
        'Some time before this system maintenance starts the users will receive a notification on each screen announcing about this fact.' =>
            'Egy kis idő a rendszerkarbantartás indulása előtt. A felhasználók értesítést fognak kapni minden képernyőn ennek a ténynek a bejelentéséről.',
        'Start date' => 'Kezdődátum',
        'Stop date' => 'Végdátum',
        'Delete System Maintenance' => 'Rendszerkarbantartás törlése',
        'Do you really want to delete this scheduled system maintenance?' =>
            'Valóban törölni szeretné ezt az ütemezett rendszerkarbantartást?',

        # Template: AdminSystemMaintenanceEdit
        'Edit System Maintenance %s' => 'Rendszerkarbantartás szerkesztése: %s',
        'Edit System Maintenance Information' => 'Rendszerkarbantartás információk szerkesztése',
        'Date invalid!' => 'Érvénytelen dátum!',
        'Login message' => 'Bejelentkező üzenet',
        'Show login message' => 'Bejelentkező üzenet megjelenítése',
        'Notify message' => 'Értesítő üzenet',
        'Manage Sessions' => 'Munkamenetek kezelése',
        'All Sessions' => 'Összes munkamenet',
        'Agent Sessions' => 'Ügyintéző munkamenetek',
        'Customer Sessions' => 'Ügyfél munkamenetek',
        'Kill all Sessions, except for your own' => 'Összes munkamenet kilövése, kivéve az Ön sajátját',

        # Template: AdminTemplate
        'Manage Templates' => 'Sablonok kezelése',
        'Add template' => 'Sablon hozzáadása',
        'A template is a default text which helps your agents to write faster tickets, answers or forwards.' =>
            'A sablon egy olyan alapértelmezett szöveg, amely segíti az ügyintézőket a gyorsabb jegyek, válaszok vagy továbbítások írásakor.',
        'Don\'t forget to add new templates to queues.' => 'Ne felejtse el hozzáadni az új sablonokat a várólistákhoz.',
        'Do you really want to delete this template?' => 'Valóban törölni szeretné ezt a sablont?',
        'Add Template' => 'Sablon hozzáadása',
        'Edit Template' => 'Sablon szerkesztése',
        'A standard template with this name already exists!' => 'Már létezik ilyen nevű szabványos sablon!',
        'Create type templates only supports this smart tags' => 'Típussablonok létrehozása, amelyek csak ezeket az intelligens címkéket támogatják',
        'Example template' => 'Példa sablon',
        'The current ticket state is' => 'A jegy jelenlegi állapota',
        'Your email address is' => 'Az e-mail címe',

        # Template: AdminTemplateAttachment
        'Manage Templates <-> Attachments Relations' => 'Sablonok <-> Mellékletek kapcsolatainak kezelése',
        'Filter for Attachments' => 'Szűrő a mellékletekhez',
        'Change Template Relations for Attachment' => 'Sablonkapcsolatok megváltoztatása egy mellékletnél',
        'Change Attachment Relations for Template' => 'Mellékletkapcsolatok megváltoztatása egy sablonnál',
        'Toggle active for all' => 'Aktiválás ki- és bekapcsolása mindenkinek',
        'Link %s to selected %s' => '%s összekapcsolása a kijelölt %s elemmel',

        # Template: AdminType
        'Type Management' => 'Típuskezelés',
        'Add ticket type' => 'Jegytípus hozzáadása',
        'Add Type' => 'Típus hozzáadása',
        'Edit Type' => 'Típus szerkesztése',
        'A type with this name already exists!' => 'Már létezik ilyen nevű típus!',

        # Template: AdminUser
        'Agents will be needed to handle tickets.' => 'Ügyintézőkre lesz szükség a jegyek kezeléséhez.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'Ne felejtse el hozzáadni az új ügyintézőt a csoportokhoz és/vagy szerepekhez!',
        'Please enter a search term to look for agents.' => 'Adjon meg egy keresési kifejezést az ügyintézők kereséséhez.',
        'Last login' => 'Utolsó belépés',
        'Switch to agent' => 'Váltás ügyintézőre',
        'Add Agent' => 'Ügyintéző hozzáadása',
        'Edit Agent' => 'Ügyintéző szerkesztése',
        'Title or salutation' => 'Titulus vagy megszólítás',
        'Firstname' => 'Keresztnév',
        'Lastname' => 'Vezetéknév',
        'A user with this username already exists!' => 'Már létezik ilyen felhasználónevű felhasználó!',
        'Will be auto-generated if left empty.' => 'Legyen automatikusan előállított, ha üresen van hagyva.',
        'Start' => 'Indítás',
        'End' => 'Befejezés',

        # Template: AdminUserGroup
        'Manage Agent-Group Relations' => 'Ügyintéző-csoport kapcsolatok kezelése',
        'Change Group Relations for Agent' => 'Csoportkapcsolatok megváltoztatása egy ügyintézőnél',
        'Change Agent Relations for Group' => 'Ügyintéző-kapcsolatok megváltoztatása egy csoportnál',

        # Template: AgentBook
        'Address Book' => 'Címjegyzék',
        'Search for a customer' => 'Egy ügyfél keresése',
        'Add email address %s to the To field' => 'A(z) %s e-mail cím hozzáadása a címzett mezőhöz',
        'Add email address %s to the Cc field' => 'A(z) %s e-mail cím hozzáadása a másolat mezőhöz',
        'Add email address %s to the Bcc field' => 'A(z) %s e-mail cím hozzáadása a titkos másolat mezőhöz',
        'Apply' => 'Alkalmaz',

        # Template: AgentCustomerInformationCenter
        'Customer Information Center' => 'Ügyfélinformációs-központ',

        # Template: AgentCustomerInformationCenterSearch
        'Customer User' => 'Ügyfél-felhasználó',

        # Template: AgentCustomerSearch
        'Duplicated entry' => 'Kettőzött bejegyzés',
        'This address already exists on the address list.' => 'Ez a cím már létezik a címlistában.',
        'It is going to be deleted from the field, please try again.' => 'Ez törölve lesz a mezőből, próbálja újra.',

        # Template: AgentCustomerTableView
        'Note: Customer is invalid!' => 'Megjegyzés: Az ügyfél érvénytelen!',
        'Start chat' => 'Csevegés indítása',
        'Video call' => 'Videohívás',
        'Audio call' => 'Hanghívás',

        # Template: AgentDaemonInfo
        'The OTRS Daemon is a daemon process that performs asynchronous tasks, e.g. ticket escalation triggering, email sending, etc.' =>
            'Az OTRS démon egy démonfolyamat, amely olyan aszinkron feladatokat hajt végre, mint például jegyeszkaláció aktiválás, e-mail küldés, stb.',
        'A running OTRS Daemon is mandatory for correct system operation.' =>
            'Egy futó OTRS démon feltétlenül szükséges a helyes rendszerműködéshez.',
        'Starting the OTRS Daemon' => 'Az OTRS démon indítása',
        'Make sure that the file \'%s\' exists (without .dist extension). This cron job will check every 5 minutes if the OTRS Daemon is running and start it if needed.' =>
            'Győződjön meg arról, hogy a(z) „%s” fájl létezik-e (.dist kiterjesztés nélkül). Ez a cron-feladat 5 percenként fogja ellenőrizni, hogy az OTRS démon fut-e, és szükség szerint elindítja azt.',
        'Execute \'%s start\' to make sure the cron jobs of the \'otrs\' user are active.' =>
            'Hajtsa végre a(z) „%s start” parancsot, hogy megbizonyosodjon arról, hogy az „otrs” felhasználó cron-feladatai aktívak-e.',
        'After 5 minutes, check that the OTRS Daemon is running in the system (\'bin/otrs.Daemon.pl status\').' =>
            'Ellenőrizze 5 perc után, hogy az OTRS démon fut-e a rendszeren („bin/otrs.Daemon.pl status”).',

        # Template: AgentDashboard
        'Dashboard' => 'Vezérlőpult',

        # Template: AgentDashboardCalendarOverview
        'in' => 'ekkor:',

        # Template: AgentDashboardCommon
        'Close this widget' => 'Felületi elem bezárása',
        'Available Columns' => 'Elérhető oszlopok',
        'Visible Columns (order by drag & drop)' => 'Látható oszlopok (rendezés fogd és vidd módon)',

        # Template: AgentDashboardCustomerIDStatus
        'Escalated tickets' => 'Eszkalált jegyek',

        # Template: AgentDashboardCustomerUserList
        'Customer login' => 'Ügyfélbelépés',
        'Customer information' => 'Ügyfél-információk',
        'Phone ticket' => 'Telefonos jegy',
        'Email ticket' => 'E-mail jegy',
        '%s open ticket(s) of %s' => '%s nyitott jegye ennek: %s',
        '%s closed ticket(s) of %s' => '%s lezárt jegye ennek: %s',
        'New phone ticket from %s' => 'Új telefonos jegy tőle: %s',
        'New email ticket to %s' => 'Új e-mail jegy neki: %s',

        # Template: AgentDashboardProductNotify
        '%s %s is available!' => '%s %s elérhető!',
        'Please update now.' => 'Frissítse most.',
        'Release Note' => 'Kiadási megjegyzés',
        'Level' => 'Szint',

        # Template: AgentDashboardRSSOverview
        'Posted %s ago.' => 'Beküldve %s ezelőtt.',

        # Template: AgentDashboardStats
        'The configuration for this statistic widget contains errors, please review your settings.' =>
            'Ennek a statisztikai felületi elemnek a beállítása hibákat tartalmaz. Nézze át a beállításait.',
        'Download as SVG file' => 'Letöltés SVG-fájlként',
        'Download as PNG file' => 'Letöltés PNG-fájlként',
        'Download as CSV file' => 'Letöltés CSV-fájlként',
        'Download as Excel file' => 'Letöltés Excel fájlként',
        'Download as PDF file' => 'Letöltés PDF-fájlként',
        'Grouped' => 'Csoportosított',
        'Stacked' => 'Halmozott',
        'Expanded' => 'Kifeszített',
        'Stream' => 'Folyam',
        'No Data Available.' => '',
        'Please select a valid graph output format in the configuration of this widget.' =>
            'Válasszon egy érvényes kimeneti grafikonformátumot ennek a felületi elemnek a beállításaiban.',
        'The content of this statistic is being prepared for you, please be patient.' =>
            'A statisztika tartalma előkészítés alatt van, várjon türelemmel.',
        'This statistic can currently not be used because its configuration needs to be corrected by the statistics administrator.' =>
            'Ez a statisztika jelenleg nem használható, mert a beállításait javítania kell a statisztika adminisztrátorának.',

        # Template: AgentDashboardTicketGeneric
        'My locked tickets' => 'Saját zárolt jegyek',
        'My watched tickets' => 'Saját megfigyelt jegyek',
        'My responsibilities' => 'Saját felelősségek',
        'Tickets in My Queues' => 'Jegyek a várólistáimban',
        'Tickets in My Services' => 'Jegyek a szolgáltatásaimban',
        'Service Time' => 'Szolgáltatás ideje',
        'Remove active filters for this widget.' => 'A felületi elem aktív szűrőinek eltávolítása.',

        # Template: AgentDashboardTicketQueueOverview
        'Totals' => 'Összesen',

        # Template: AgentDashboardUserOnline
        'out of office' => 'irodán kívül',

        # Template: AgentDashboardUserOutOfOffice
        'until' => 'eddig:',

        # Template: AgentHTMLReferencePageLayout
        'The ticket has been locked' => 'A jegy zárolva lett',
        'Undo & close' => 'Visszavonás és bezárás',

        # Template: AgentInfo
        'Info' => 'Információ',
        'To accept some news, a license or some changes.' => 'A hírek, a licenc és néhány változtatás elfogadásához.',

        # Template: AgentLinkObject
        'Link Object: %s' => 'Objektum összekapcsolása: %s',
        'go to link delete screen' => 'ugrás a kapcsolat törlés képernyőre',
        'Select Target Object' => 'Kijelölt célobjektum',
        'Link object %s with' => '%s objektum összekapcsolása ezzel',
        'Unlink Object: %s' => 'Objektum kapcsolatának törlése: %s',
        'go to link add screen' => 'ugrás a kapcsolat hozzáadás képernyőre',

        # Template: AgentOTRSBusinessBlockScreen
        'Unauthorized usage of %s detected' => 'A(z) %s jogosulatlan használata észlelhető',
        'If you decide to downgrade to OTRS Free, you will lose all database tables and data related to %s.' =>
            'Ha úgy dönt, hogy visszavált az ingyenes OTRS-re, akkor el fogja veszíteni az összes adatbázis táblát és a(z) %s szolgáltatáshoz kapcsolódó adatokat.',

        # Template: AgentPreferences
        'Edit your preferences' => 'Beállítások szerkesztése',
        'Did you know? You can help translating OTRS at %s.' => 'Tudta? Segíthet az OTRS fordításában a következő címen: %s.',

        # Template: AgentSpelling
        'Spell Checker' => 'Helyesírás-ellenőrző',
        'spelling error(s)' => 'helyesírási hibák',
        'Apply these changes' => 'Módosítások alkalmazása',

        # Template: AgentStatisticsAdd
        'Statistics » Add' => 'Statisztikák » Hozzáadás',
        'Add New Statistic' => 'Új statisztika hozzáadása',
        'Dynamic Matrix' => 'Dinamikus mátrix',
        'Tabular reporting data where each cell contains a singular data point (e. g. the number of tickets).' =>
            'Táblázatos jelentési adatok, ahol minden egyes cella egy egyedülálló adatpontot tartalmaz (például a jegyek számát).',
        'Dynamic List' => 'Dinamikus lista',
        'Tabular reporting data where each row contains data of one entity (e. g. a ticket).' =>
            'Táblázatos jelentési adatok, ahol minden egyes sor egy entitás adatait tartalmazza (például egy jegyet).',
        'Static' => 'Statikus',
        'Complex statistics that cannot be configured and may return non-tabular data.' =>
            'Összetett statisztikák, amelyek nem állíthatók be és esetleg nem táblázatos adatokat adnak vissza.',
        'General Specification' => 'Általános specifikáció',
        'Create Statistic' => 'Statisztika létrehozása',

        # Template: AgentStatisticsEdit
        'Statistics » Edit %s%s — %s' => 'Statisztikák » %s%s szerkesztése — %s',
        'Run now' => 'Futtatás most',
        'Statistics Preview' => 'Statisztikák előnézet',
        'Save statistic' => 'Statisztika mentése',

        # Template: AgentStatisticsImport
        'Statistics » Import' => 'Statisztikák » Importálás',
        'Import Statistic Configuration' => 'Statisztika-beállítások importálása',

        # Template: AgentStatisticsOverview
        'Statistics » Overview' => 'Statisztikák » Áttekintő',
        'Statistics' => 'Statisztikák',
        'Run' => 'Futtatás',
        'Edit statistic "%s".' => '„%s” statisztika szerkesztése.',
        'Export statistic "%s"' => '„%s” statisztika exportálása',
        'Export statistic %s' => '%s statisztika exportálása',
        'Delete statistic "%s"' => '„%s” statisztika törlése',
        'Delete statistic %s' => '%s statisztika törlése',
        'Do you really want to delete this statistic?' => 'Valóban törölni szeretné ezt a statisztikát?',

        # Template: AgentStatisticsView
        'Statistics » View %s%s — %s' => 'Statisztikák » %s%s megtekintése — %s',
        'Statistic Information' => 'Statisztika információk',
        'Sum rows' => 'Sorok összegzése',
        'Sum columns' => 'Oszlopok összegzése',
        'Show as dashboard widget' => 'Megjelenítés vezérlőpult felületi elemként',
        'Cache' => 'Gyorsítótár',
        'This statistic contains configuration errors and can currently not be used.' =>
            'Ez a statisztika beállítási hibákat tartalmaz, és jelenleg nem használható.',

        # Template: AgentTicketActionCommon
        'Change Free Text of %s%s%s' => '%s%s%s szabad szövegének módosítása',
        'Change Owner of %s%s%s' => '%s%s%s tulajdonosának módosítása',
        'Close %s%s%s' => '%s%s%s lezárása',
        'Add Note to %s%s%s' => 'Jegyzet hozzáadása ehhez: %s%s%s',
        'Set Pending Time for %s%s%s' => '%s%s%s várakozó idejének beállítása',
        'Change Priority of %s%s%s' => '%s%s%s prioritásának módosítása',
        'Change Responsible of %s%s%s' => '%s%s%s felelősének módosítása',
        'All fields marked with an asterisk (*) are mandatory.' => 'Minden csillaggal (*) jelölt mező kötelező.',
        'Service invalid.' => 'Érvénytelen szolgáltatás.',
        'New Owner' => 'Új tulajdonos',
        'Please set a new owner!' => 'Állítson be új tulajdonost!',
        'New Responsible' => 'Új felelős',
        'Next state' => 'Következő állapot',
        'For all pending* states.' => 'Minden függőben* állapotnál.',
        'Add Article' => 'Bejegyzés hozzáadása',
        'Create an Article' => 'Egy bejegyzés létrehozása',
        'Inform agents' => 'Ügyintézők értesítése',
        'Inform involved agents' => 'Részt vevő ügyintézők értesítése',
        'Here you can select additional agents which should receive a notification regarding the new article.' =>
            'Itt választhat ki további ügyintézőket, akiknek értesítést kell kapniuk az új bejegyzést illetően.',
        'Text will also be received by' => 'A szöveget meg fogja még kapni',
        'Spell check' => 'Helyesírás-ellenőrzés',
        'Text Template' => 'Szövegsablon',
        'Setting a template will overwrite any text or attachment.' => 'Egy sablon beállítása felül fog írni minden szöveget vagy mellékletet.',
        'Note type' => 'Jegyzet típusa',

        # Template: AgentTicketBounce
        'Bounce %s%s%s' => '%s%s%s átirányítása',
        'Bounce to' => 'Átirányítás ide',
        'You need a email address.' => 'Egy e-mail címre van szüksége.',
        'Need a valid email address or don\'t use a local email address.' =>
            'Egy érvényes e-mail cím szükséges, vagy ne használja a helyi e-mail címet.',
        'Next ticket state' => 'Következő jegyállapot',
        'Inform sender' => 'Küldő tájékoztatása',
        'Send mail' => 'Levél küldése',

        # Template: AgentTicketBulk
        'Ticket Bulk Action' => 'Tömeges jegyművelet',
        'Send Email' => 'E-mail küldése',
        'Merge to' => 'Egyesítés ezzel',
        'Invalid ticket identifier!' => 'Érvénytelen jegyazonosító!',
        'Merge to oldest' => 'Egyesítés a legrégebbivel',
        'Link together' => 'Összekapcsolás',
        'Link to parent' => 'Összekapcsolás a szülővel',
        'Unlock tickets' => 'Jegyek feloldása',
        'Execute Bulk Action' => 'Tömeges művelet végrehajtása',

        # Template: AgentTicketCompose
        'Compose Answer for %s%s%s' => 'Válasz írása erre: %s%s%s',
        'This address is registered as system address and cannot be used: %s' =>
            'Ez a cím rendszercímként van regisztrálva és nem használható: %s',
        'Please include at least one recipient' => 'Vegyen fel legalább egy címzettet',
        'Remove Ticket Customer' => 'Jegy ügyfél eltávolítása',
        'Please remove this entry and enter a new one with the correct value.' =>
            'Távolítsa el ezt a bejegyzést, és adjon meg egy újat a helyes értékkel.',
        'Remove Cc' => 'Másolat eltávolítása',
        'Remove Bcc' => 'Titkos másolat eltávolítása',
        'Address book' => 'Címjegyzék',
        'Date Invalid!' => 'Érvénytelen dátum!',

        # Template: AgentTicketCustomer
        'Change Customer of %s%s%s' => '%s%s%s ügyfelének módosítása',

        # Template: AgentTicketEmail
        'Create New Email Ticket' => 'Új e-mail jegy létrehozása',
        'Example Template' => 'Példa sablon',
        'From queue' => 'Várólistából',
        'To customer user' => 'Ügyfél-felhasználónak',
        'Please include at least one customer user for the ticket.' => 'Vegyen fel legalább egy ügyfél-felhasználót a jegyhez.',
        'Select this customer as the main customer.' => 'Az ügyfél kijelölése fő ügyfélként.',
        'Remove Ticket Customer User' => 'Jegy ügyfél-felhasználójának eltávolítása',
        'Get all' => 'Összes lekérése',

        # Template: AgentTicketEmailOutbound
        'Outbound Email for %s%s%s' => 'Kimenő e-mail ehhez: %s%s%s',

        # Template: AgentTicketEscalation
        'Ticket %s: first response time is over (%s/%s)!' => '%s jegy: az első válaszidő lejárt (%s/%s)!',
        'Ticket %s: first response time will be over in %s/%s!' => '%s jegy: az első válaszidő le fog járni: %s/%s!',
        'Ticket %s: update time is over (%s/%s)!' => '%s jegy: a frissítés ideje lejárt (%s/%s)!',
        'Ticket %s: update time will be over in %s/%s!' => '%s jegy: a frissítési idő le fog járni: %s/%s!',
        'Ticket %s: solution time is over (%s/%s)!' => '%s jegy: a megoldási idő lejárt (%s/%s)!',
        'Ticket %s: solution time will be over in %s/%s!' => '%s jegy: a megoldási idő le fog járni: %s/%s!',

        # Template: AgentTicketForward
        'Forward %s%s%s' => '%s%s%s továbbítása',

        # Template: AgentTicketHistory
        'History of %s%s%s' => '%s%s%s előzményei',
        'History Content' => 'Előzménytartalom',
        'Zoom view' => 'Nagyítási nézet',

        # Template: AgentTicketMerge
        'Merge %s%s%s' => '%s%s%s egyesítése',
        'Merge Settings' => 'Egyesítés beállítások',
        'You need to use a ticket number!' => 'Egy jegyszámot kell használnia!',
        'A valid ticket number is required.' => 'Érvényes jegyszám szükséges.',
        'Need a valid email address.' => 'Érvényes e-mail cím szükséges.',

        # Template: AgentTicketMove
        'Move %s%s%s' => '%s%s%s áthelyezése',
        'New Queue' => 'Új várólista',

        # Template: AgentTicketOverviewMedium
        'Select all' => 'Összes kijelölése',
        'No ticket data found.' => 'Nem található jegyadat.',
        'Open / Close ticket action menu' => 'Jegyművelet menü megnyitása vagy bezárása',
        'Select this ticket' => 'Jegy kijelölése',
        'First Response Time' => 'Első válaszidő',
        'Update Time' => 'Frissítés ideje',
        'Solution Time' => 'Megoldás ideje',
        'Move ticket to a different queue' => 'Jegy áthelyezése egy másik várólistába',
        'Change queue' => 'Várólista módosítása',

        # Template: AgentTicketOverviewNavBar
        'Change search options' => 'Keresési beállítások módosítása',
        'Remove active filters for this screen.' => 'Aktív szűrők eltávolítása ennél a képernyőnél',
        'Tickets per page' => 'Jegyek oldalanként',

        # Template: AgentTicketOverviewSmall
        'Reset overview' => 'Áttekintő visszaállítása',
        'Column Filters Form' => 'Oszlopszűrők űrlap',

        # Template: AgentTicketPhone
        'Split Into New Phone Ticket' => 'Felosztás új telefonos jegybe',
        'Save Chat Into New Phone Ticket' => 'Csevegés mentése egy új telefonos jegybe',
        'Create New Phone Ticket' => 'Új telefonos jegy létrehozása',
        'Please include at least one customer for the ticket.' => 'Vegyen fel legalább egy ügyfelet a jegyhez!',
        'To queue' => 'Várólistába',
        'Chat protocol' => 'Csevegés protokoll',
        'The chat will be appended as a separate article.' => 'A csevegés elkülönített bejegyzésként lesz hozzáfűzve.',

        # Template: AgentTicketPhoneCommon
        'Phone Call for %s%s%s' => 'Telefonhívás ehhez: %s%s%s',

        # Template: AgentTicketPlain
        'View Email Plain Text for %s%s%s' => 'Egyszerű szöveges e-mail megtekintése ennél: %s%s%s',
        'Plain' => 'Egyszerű',
        'Download this email' => 'E-mail letöltése',

        # Template: AgentTicketProcess
        'Create New Process Ticket' => 'Új folyamatjegy létrehozása',
        'Process' => 'Folyamat',

        # Template: AgentTicketProcessSmall
        'Enroll Ticket into a Process' => 'Jegy besorolása egy folyamatba',

        # Template: AgentTicketSearch
        'Search template' => 'Keresési sablon',
        'Create Template' => 'Sablon létrehozása',
        'Create New' => 'Új létrehozása',
        'Profile link' => 'Profil hivatkozás',
        'Save changes in template' => 'Módosítások mentése sablonba',
        'Filters in use' => 'Használatban lévő szűrők',
        'Additional filters' => 'További szűrők',
        'Add another attribute' => 'További jellemző hozzáadása',
        'Output' => 'Kimenet',
        'Fulltext' => 'Szabad-szavas',
        'Remove' => 'Eltávolítás',
        'Searches in the attributes From, To, Cc, Subject and the article body, overriding other attributes with the same name.' =>
            'Keresés a feladó, címzett, másolat, tárgy és a bejegyzéstörzs jellemzőkben, felülbírálva más hasonló nevű jellemzőket.',
        'CustomerID (complex search)' => 'Ügyfél-azonosító (összetett keresés)',
        '(e. g. 234*)' => '(például 234*)',
        'CustomerID (exact match)' => 'Ügyfél-azonosító (pontos egyezés)',
        'Customer User Login (complex search)' => 'Ügyfél-felhasználó belépés (összetett keresés)',
        '(e. g. U51*)' => '(például U51*)',
        'Customer User Login (exact match)' => 'Ügyfél-felhasználó belépés (pontos egyezés)',
        'Attachment Name' => 'Melléklet neve',
        '(e. g. m*file or myfi*)' => '(például f*jlom vagy fájl*)',
        'Created in Queue' => 'Létrehozva a várólistában',
        'Lock state' => 'Zár állapot',
        'Watcher' => 'Megfigyelő',
        'Article Create Time (before/after)' => 'Bejegyzés létrehozási ideje (előtt/után)',
        'Article Create Time (between)' => 'Bejegyzés létrehozási ideje (között)',
        'Ticket Create Time (before/after)' => 'Jegy létrehozási ideje (előtt/után)',
        'Ticket Create Time (between)' => 'Jegy létrehozási ideje (között)',
        'Ticket Change Time (before/after)' => 'Jegy módosítási ideje (előtt/után)',
        'Ticket Change Time (between)' => 'Jegy módosítási ideje (között)',
        'Ticket Last Change Time (before/after)' => 'Jegy utolsó módosítási ideje (előtt/után)',
        'Ticket Last Change Time (between)' => 'Jegy utolsó módosítási ideje (között)',
        'Ticket Close Time (before/after)' => 'Jegy lezárási ideje (előtt/után)',
        'Ticket Close Time (between)' => 'Jegy lezárási ideje (között)',
        'Ticket Escalation Time (before/after)' => 'Jegy eszkalálási ideje (előtt/után)',
        'Ticket Escalation Time (between)' => 'Jegy eszkalálási ideje (között)',
        'Archive Search' => 'Archívum keresés',
        'Run search' => 'Keresés futtatása',

        # Template: AgentTicketZoom
        'Article filter' => 'Bejegyzésszűrő',
        'Article Type' => 'Bejegyzéstípus',
        'Sender Type' => 'Küldőtípus',
        'Save filter settings as default' => 'Szűrőbeállítások mentése alapértelmezettként',
        'Event Type Filter' => 'Eseménytípus szűrő',
        'Event Type' => 'Eseménytípus',
        'Save as default' => 'Mentés alapértelmezettként',
        'Archive' => 'Archiválás',
        'This ticket is archived.' => 'Ez a jegy archiválva van.',
        'Note: Type is invalid!' => 'Megjegyzés: a típus érvénytelen!',
        'Locked' => 'Zárolt',
        'Accounted time' => 'Elszámolt idő',
        'Linked Objects' => 'Kapcsolt objektumok',
        'Change Queue' => 'Várólista módosítása',
        'There are no dialogs available at this point in the process.' =>
            'Nem érhetők el párbeszédek a folyamat ezen pontján.',
        'This item has no articles yet.' => 'Ennek az elemnek még nincsenek bejegyzései.',
        'Ticket Timeline View' => 'Jegy idővonal nézet',
        'Article Overview' => 'Bejegyzés áttekintő',
        'Article(s)' => 'Bejegyzések',
        'Page' => 'Oldal',
        'Add Filter' => 'Szűrő hozzáadása',
        'Set' => 'Beállítás',
        'Reset Filter' => 'Szűrő visszaállítása',
        'Show one article' => 'Egy bejegyzés megjelenítése',
        'Show all articles' => 'Összes bejegyzés megjelenítése',
        'Show Ticket Timeline View' => 'Jegy idővonal nézet megjelenítése',
        'Unread articles' => 'Olvasatlan bejegyzések',
        'No.' => 'Szám',
        'Important' => 'Fontos',
        'Unread Article!' => 'Olvasatlan bejegyzés!',
        'Incoming message' => 'Bejövő üzenet',
        'Outgoing message' => 'Kimenő üzenet',
        'Internal message' => 'Belső üzenet',
        'Resize' => 'Átméretezés',
        'Mark this article as read' => 'Bejegyzés megjelölése olvasottként',
        'Show Full Text' => 'Teljes szöveg megjelenítése',
        'Full Article Text' => 'Teljes bejegyzés szöveg',
        'No more events found. Please try changing the filter settings.' =>
            'Nem található több esemény. Próbáljon meg változtatni a szűrő beállításain.',
        'by' => '–',
        'To open links in the following article, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).' =>
            'A következő bejegyzésben lévő hivatkozások megnyitásához lehet, hogy meg kell nyomnia a Ctrl vagy a Cmd vagy a Shift billentyűt, miközben a hivatkozásra kattint (a böngészőjétől és az operációs rendszerétől függően).',
        'Close this message' => 'Üzenet bezárása',
        'Article could not be opened! Perhaps it is on another article page?' =>
            'A bejegyzést nem sikerült megnyitni! Talán egy másik bejegyzés oldalon van?',
        'Scale preview content' => 'Előnézet tartalmának méretezése',
        'Open URL in new tab' => 'URL megnyitása új lapon',
        'Close preview' => 'Előnézet bezárása',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.' =>
            'Ennek a weboldalnak nem lehet biztosítani az előnézetét, mert nem engedte meg a beágyazását.',

        # Template: AttachmentBlocker
        'To protect your privacy, remote content was blocked.' => 'Az adatai védelme érdekében a távoli tartalom blokkolva lett.',
        'Load blocked content.' => 'Blokkolt tartalom betöltése.',

        # Template: ChatStartForm
        'First message' => 'Első üzenet',

        # Template: CloudServicesDisabled
        'This feature requires cloud services.' => 'Ez a funkció felhőszolgáltatásokat igényel.',
        'You can' => 'Lehetőségei',
        'go back to the previous page' => 'visszatérés az előző oldalra',

        # Template: CustomerError
        'An Error Occurred' => 'Hiba történt',
        'Error Details' => 'Hiba részletei',
        'Traceback' => 'Visszakövetés',

        # Template: CustomerFooter
        'Powered by' => 'A gépházban:',

        # Template: CustomerFooterJS
        'One or more errors occurred!' => 'Egy vagy több hiba történt!',
        'Close this dialog' => 'Párbeszédablak bezárása',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'Nem sikerült megnyitni a felugró ablakot. Tiltson le minden felugró ablak blokkolót ennél az alkalmazásnál.',
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Ha most elhagyja ezt az oldalt, az összes megnyitott felugró ablak is be fog záródni!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'A képernyő felugró ablaka már meg van nyitva. Szeretné bezárni, és helyette ezt betölteni?',
        'There are currently no elements available to select from.' => 'Jelenleg nincsenek elérhető elemek, amelyekből kijelölhetne.',
        'Please turn off Compatibility Mode in Internet Explorer!' => 'Kapcsolja ki a kompatibilitási módot az Internet Explorerben!',
        'The browser you are using is too old.' => 'A használt böngésző túl régi.',
        'OTRS runs with a huge lists of browsers, please upgrade to one of these.' =>
            'Az OTRS a böngészők hatalmas listájával futtatható, frissítse ezek egyikére.',
        'Please see the documentation or ask your admin for further information.' =>
            'További információkért nézze meg a dokumentációt, vagy kérdezze az adminisztrátort.',
        'Switch to mobile mode' => 'Átváltás mobil módra',
        'Switch to desktop mode' => 'Átváltás asztali módra',
        'Not available' => 'Nem érhető el',
        'Clear all' => 'Összes törlése',
        'Clear search' => 'Keresés törlése',
        '%s selection(s)...' => '%s kijelölés…',
        'and %s more...' => 'és további %s…',
        'Filters' => 'Szűrők',
        'Confirm' => 'Megerősítés',
        'You have unanswered chat requests' => 'Megválaszolatlan csevegés kérései vannak',
        'Accept' => 'Elfogadás',
        'Decline' => 'Elutasítás',
        'An internal error occurred.' => 'Belső hiba történt.',
        'Connection error' => 'Kapcsolódási hiba',
        'Reload page' => 'Oldal újratöltése',
        'Your browser was not able to communicate with OTRS properly, there seems to be something wrong with your network connection. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.' =>
            'A böngészője nem volt képes megfelelően kommunikálni az OTRS-sel, úgy tűnik, hogy valami nincs rendben a hálózati kapcsolattal. Megpróbálhatja újratölteni ezt az oldalt kézzel, vagy megvárhatja, amíg a böngészője saját maga létesíti újra a kapcsolatot.',
        'The connection has been re-established after a temporary connection loss. Due to this, elements on this page could have stopped to work correctly. In order to be able to use all elements correctly again, it is strongly recommended to reload this page.' =>
            'A kapcsolat ismét kiépítésre került, miután egy átmeneti kapcsolat elveszett. Emiatt az oldalon lévő elemek esetleg nem fognak helyesen működni. Annak érdekében, hogy ismét képes legyen minden elemet helyesen használni, erősen ajánlott az oldal újratöltése.',

        # Template: CustomerLogin
        'JavaScript Not Available' => 'JavaScript nem érhető el',
        'In order to experience OTRS, you\'ll need to enable JavaScript in your browser.' =>
            'Annak érdekében, hogy megtapasztalja az OTRS-t, szükséges lesz engedélyeznie a JavaScriptet a böngészőben.',
        'Browser Warning' => 'Böngésző figyelmeztetés',
        'One moment please, you are being redirected...' => 'Egy pillanat, hamarosan átirányítjuk…',
        'Login' => 'Belépés',
        'User name' => 'Felhasználónév',
        'Your user name' => 'A felhasználóneve',
        'Your password' => 'A jelszava',
        'Forgot password?' => 'Elfelejtette a jelszót?',
        '2 Factor Token' => 'Kétlépcsős token',
        'Your 2 Factor Token' => 'Az Ön kétlépcsős tokenje',
        'Log In' => 'Bejelentkezés',
        'Not yet registered?' => 'Még nem regisztrált?',
        'Request new password' => 'Új jelszó kérése',
        'Your User Name' => 'A felhasználóneve',
        'A new password will be sent to your email address.' => 'Az új jelszó el lesz küldve az e-mail címére.',
        'Create Account' => 'Fiók létrehozása',
        'Please fill out this form to receive login credentials.' => 'Töltse ki ezt az űrlapot a bejelentkezési adatok fogadásához.',
        'How we should address you' => 'Hogyan szólítsuk meg',
        'Your First Name' => 'A keresztneve',
        'Your Last Name' => 'A vezetékneve',
        'Your email address (this will become your username)' => 'Az e-mail címe (ez lesz a felhasználóneve)',

        # Template: CustomerNavigationBar
        'Incoming Chat Requests' => 'Bejövő csevegés kérések',
        'Edit personal preferences' => 'Személyes beállítások szerkesztése',
        'Logout %s %s' => 'Kilépés: %s %s',

        # Template: CustomerRichTextEditor
        'Split Quote' => 'Idézet felosztása',
        'Open link' => 'Hivatkozás megnyitása',

        # Template: CustomerTicketMessage
        'Service level agreement' => 'Szolgáltatási szint megállapodás',

        # Template: CustomerTicketOverview
        'Welcome!' => 'Üdvözöljük!',
        'Please click the button below to create your first ticket.' => 'Kattintson a lenti gombra az első jegy létrehozásához.',
        'Create your first ticket' => 'Első jegy létrehozása',

        # Template: CustomerTicketSearch
        'Profile' => 'Profil',
        'e. g. 10*5155 or 105658*' => 'például 10*5155 vagy 105658*',
        'Customer ID' => 'Ügyfél-azonosító',
        'Fulltext search in tickets (e. g. "John*n" or "Will*")' => 'Szabad-szavas keresés a jegyekben (például „Kata*n” vagy „Gerg*”).',
        'Recipient' => 'Címzett',
        'Carbon Copy' => 'Másolat',
        'e. g. m*file or myfi*' => 'például f*jlom vagy fájl*',
        'Types' => 'Típusok',
        'Time restrictions' => 'Idő megkötések',
        'No time settings' => 'Nincsenek időbeállítások',
        'Specific date' => 'Adott dátum',
        'Only tickets created' => 'Csak létrehozott jegyek',
        'Date range' => 'Dátumtartomány',
        'Only tickets created between' => 'Csak ezek között létrehozott jegyek',
        'Ticket archive system' => 'Jegyarchiváló rendszer',
        'Save search as template?' => 'Menti a keresést sablonként?',
        'Save as Template?' => 'Menti sablonként?',
        'Save as Template' => 'Mentés sablonként',
        'Template Name' => 'Sablonnév',
        'Pick a profile name' => 'Válasszon egy profilnevet',
        'Output to' => 'Kimenet ide',

        # Template: CustomerTicketSearchResultShort
        'of' => '/',
        'Search Results for' => 'Keresési eredmények ennél',
        'Remove this Search Term.' => 'A keresési kifejezés eltávolítása.',

        # Template: CustomerTicketZoom
        'Start a chat from this ticket' => 'Csevegés indítása ebből a jegyből',
        'Expand article' => 'Bejegyzés kinyitása',
        'Information' => 'Információ',
        'Next Steps' => 'Következő lépések',
        'Reply' => 'Válasz',
        'Chat Protocol' => 'Csevegés protokoll',

        # Template: DashboardEventsTicketCalendar
        'All-day' => 'Egész nap',
        'Sunday' => 'vasárnap',
        'Monday' => 'hétfő',
        'Tuesday' => 'kedd',
        'Wednesday' => 'szerda',
        'Thursday' => 'csütörtök',
        'Friday' => 'péntek',
        'Saturday' => 'szombat',
        'Su' => 'v',
        'Mo' => 'h',
        'Tu' => 'k',
        'We' => 'sze',
        'Th' => 'cs',
        'Fr' => 'p',
        'Sa' => 'szo',
        'Event Information' => 'Esemény információk',
        'Ticket fields' => 'Jegymezők',
        'Dynamic fields' => 'Dinamikus mezők',

        # Template: Datepicker
        'Invalid date (need a future date)!' => 'Érvénytelen dátum (jövőbeli dátum szükséges)!',
        'Invalid date (need a past date)!' => 'Érvénytelen dátum (múltbeli dátum szükséges)!',
        'Previous' => 'Előző',
        'Open date selection' => 'Dátumkijelölés megnyitása',

        # Template: Error
        'An error occurred.' => 'Hiba történt.',
        'Really a bug? 5 out of 10 bug reports result from a wrong or incomplete installation of OTRS.' =>
            'Valóban hiba? 10-ből 5 hibajelentés az OTRS hibás vagy befejezetlen telepítéséből származik.',
        'With %s, our experts take care of correct installation and cover your back with support and periodic security updates.' =>
            'A(z) %s használatával a szakértőink gondoskodnak a jelenlegi telepítésről, és támogatást nyújtanak, valamint rendszeres biztonsági frissítéseket biztosítanak.',
        'Contact our service team now.' => 'Vegye fel a kapcsolatot a szolgáltatási csapatunkkal most.',
        'Send a bugreport' => 'Hibajelentés küldése',

        # Template: FooterJS
        'Please enter at least one search value or * to find anything.' =>
            'Adjon meg legalább egy keresési értéket, vagy * karaktert, ha bármire rá szeretne keresni.',
        'Please remove the following words from your search as they cannot be searched for:' =>
            'Távolítsa el a következő szavakat a keresésből, mivel azokra nem lehet rákeresni:',
        'Please check the fields marked as red for valid inputs.' => 'Ellenőrizze a pirosan megjelölt mezőket a helyes bevitelekért.',
        'Please perform a spell check on the the text first.' => 'Először hajtson végre helyesírás-ellenőrzést a szövegen.',
        'Slide the navigation bar' => 'Csúsztassa a navigációs sávot',
        'Unavailable for chat' => 'Nem érhető el csevegéshez',
        'Available for internal chats only' => 'Csak belső csevegésekhez érhető el',
        'Available for chats' => 'Elérhető csevegésekhez',
        'Please visit the chat manager' => 'Látogassa meg a csevegéskezelőt',
        'New personal chat request' => 'Új személyes csevegéskérés',
        'New customer chat request' => 'Új ügyfél csevegéskérés',
        'New public chat request' => 'Új nyilvános csevegéskérés',
        'Selected user is not available for chat.' => 'A kijelölt felhasználó nem érhető el csevegéshez.',
        'New activity' => 'Új tevékenység',
        'New activity on one of your monitored chats.' => 'Új tevékenység a megfigyelt csevegések valamelyikén.',
        'Your browser does not support video and audio calling.' => 'A böngészője nem támogatja a video- és hanghívást.',
        'Selected user is not available for video and audio call.' => 'A kijelölt felhasználó nem érhető el video- és hanghíváshoz.',
        'Target user\'s browser does not support video and audio calling.' =>
            'A célfelhasználó böngészője nem támogatja a video- és hanghívást.',
        'Do you really want to continue?' => 'Valóban folytatni akarja?',
        'Information about the OTRS Daemon' => 'Információk az OTRS démonról',
        'This feature is part of the %s.  Please contact us at %s for an upgrade.' =>
            'Ez a szolgáltatás a(z) %s része. A frissítéshez lépjen velünk kapcsolatba a következő címen: %s.',
        'Find out more about the %s' => 'Tudjon meg többet a következőről: %s',

        # Template: Header
        'You are logged in as' => 'Belépett a következő néven:',

        # Template: Installer
        'JavaScript not available' => 'JavaScript nem érhető el',
        'Step %s' => '%s. lépés',
        'Database Settings' => 'Adatbázis-beállítások',
        'General Specifications and Mail Settings' => 'Általános specifikációk és levelezési beállítások',
        'Finish' => 'Befejezés',
        'Welcome to %s' => 'Üdvözli a(z) %s',
        'Web site' => 'Weboldal',
        'Mail check successful.' => 'Levélellenőrzés sikeres.',
        'Error in the mail settings. Please correct and try again.' => 'Hiba van a levélbeállításokban. Javítsa és próbálja újra.',

        # Template: InstallerConfigureMail
        'Configure Outbound Mail' => 'Kimenő levél beállítása',
        'Outbound mail type' => 'Kimenő levél típusa',
        'Select outbound mail type.' => 'Válassza ki a kimenő levél típusát.',
        'Outbound mail port' => 'Kimenő levél portja',
        'Select outbound mail port.' => 'Válassza ki a kimenő levél portját.',
        'SMTP host' => 'SMTP kiszolgáló',
        'SMTP host.' => 'SMTP kiszolgáló.',
        'SMTP authentication' => 'SMTP hitelesítés',
        'Does your SMTP host need authentication?' => 'Az SMTP kiszolgáló igényel hitelesítést?',
        'SMTP auth user' => 'SMTP hitelesítő felhasználó',
        'Username for SMTP auth.' => 'Felhasználónév az SMTP hitelesítéshez.',
        'SMTP auth password' => 'SMTP hitelesítő jelszó',
        'Password for SMTP auth.' => 'Jelszó az SMTP hitelesítéshez.',
        'Configure Inbound Mail' => 'Bejövő levél beállítása',
        'Inbound mail type' => 'Bejövő levél típusa',
        'Select inbound mail type.' => 'Válassza ki a bejövő levél típusát.',
        'Inbound mail host' => 'Bejövő levél kiszolgálója',
        'Inbound mail host.' => 'Bejövő levél kiszolgálója.',
        'Inbound mail user' => 'Bejövő levél felhasználója',
        'User for inbound mail.' => 'Felhasználó a bejövő levélhez.',
        'Inbound mail password' => 'Bejövő levél jelszava',
        'Password for inbound mail.' => 'Jelszó a bejövő levélhez.',
        'Result of mail configuration check' => 'A levélbeállítás-ellenőrzés eredménye',
        'Check mail configuration' => 'Levélbeállítás ellenőrzése',
        'Skip this step' => 'Lépés kihagyása',

        # Template: InstallerDBResult
        'Database setup successful!' => 'Az adatbázis beállítása sikeres!',

        # Template: InstallerDBStart
        'Install Type' => 'Telepítés típusa',
        'Create a new database for OTRS' => 'Új adatbázis létrehozása az OTRS-hez',
        'Use an existing database for OTRS' => 'Meglévő adatbázis használata az OTRS-hez',

        # Template: InstallerDBmssql
        'Database name' => 'Adatbázis neve',
        'Check database settings' => 'Adatbázis-beállítások ellenőrzése',
        'Result of database check' => 'Az adatbázis-ellenőrzés eredménye',
        'Database check successful.' => 'Az adatbázis-ellenőrzés sikeres.',
        'Database User' => 'Adatbázis felhasználó',
        'New' => 'Új',
        'A new database user with limited permissions will be created for this OTRS system.' =>
            'Egy új, korlátozott jogosultságokkal rendelkező adatbázis felhasználó lesz létrehozva ehhez az OTRS rendszerhez.',
        'Repeat Password' => 'Jelszó ismétlése',
        'Generated password' => 'Generált jelszó',

        # Template: InstallerDBmysql
        'Passwords do not match' => 'A jelszavak nem egyeznek',

        # Template: InstallerDBoracle
        'SID' => 'SID',
        'Port' => 'Port',

        # Template: InstallerFinish
        'To be able to use OTRS you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Ahhoz, hogy az OTRS-t használni tudja, a következő parancsot kell begépelnie a parancssorba (terminálban/parancsértelmezőben) rendszergazdaként.',
        'Restart your webserver' => 'Indítsa újra a webkiszolgálót',
        'After doing so your OTRS is up and running.' => 'Miután ezt megtette, az OTRS készen áll és fut.',
        'Start page' => 'Kezdőoldal',
        'Your OTRS Team' => 'Az OTRS csapata',

        # Template: InstallerLicense
        'Don\'t accept license' => 'Licenc elutasítása',
        'Accept license and continue' => 'Licenc elfogadása és folytatás',

        # Template: InstallerSystem
        'SystemID' => 'Rendszer azonosító',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'A rendszer azonosítója. Minden jegyszám és minden HTTP munkamenet-azonosító tartalmazza ezt a számot.',
        'System FQDN' => 'Rendszer FQDN',
        'Fully qualified domain name of your system.' => 'A rendszer teljes képzésű tartományneve.',
        'AdminEmail' => 'Adminisztrátori e-mail',
        'Email address of the system administrator.' => 'A rendszer adminisztrátorának e-mail címe.',
        'Organization' => 'Szervezet',
        'Log' => 'Napló',
        'LogModule' => 'Naplómodul',
        'Log backend to use.' => 'A használandó naplózó háttérprogram.',
        'LogFile' => 'Naplófájl',
        'Webfrontend' => 'Webes felhasználói felület',
        'Default language' => 'Alapértelmezett nyelv',
        'Default language.' => 'Alapértelmezett nyelv.',
        'CheckMXRecord' => 'MX rekord ellenőrzése',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'A kézzel megadott e-mail címek ellenőrzése a DNS-ben található MX rekordokkal. Ne használja ezt a lehetőséget, ha a DNS lassú, vagy nem oldja fel a nyilvános címeket.',

        # Template: LinkObject
        'Object#' => 'Objektum#',
        'Add links' => 'Kapcsolatok hozzáadása',
        'Delete links' => 'Kapcsolatok törlése',

        # Template: Login
        'Lost your password?' => 'Elfelejtette a jelszavát?',
        'Request New Password' => 'Új jelszó kérése',
        'Back to login' => 'Vissza a bejelentkezéshez',

        # Template: MobileNotAvailableWidget
        'Feature not available' => 'A szolgáltatás nem érhető el',
        'Sorry, but this feature of OTRS is currently not available for mobile devices. If you\'d like to use it, you can either switch to desktop mode or use your regular desktop device.' =>
            'Sajnáljuk, de az OTRS ezen szolgáltatása jelenleg nem érhető el mobil készülékekről. Ha használni szeretné, akkor vagy váltson asztali módra, vagy használja a megszokott asztali eszközét.',

        # Template: Motd
        'Message of the Day' => 'A nap üzenete',
        'This is the message of the day. You can edit this in %s.' => 'Ez a nap üzenete. Ezt a %s fájlban szerkesztheti.',

        # Template: NoPermission
        'Insufficient Rights' => 'Nincs elegendő joga',
        'Back to the previous page' => 'Vissza az előző oldalra',

        # Template: Pagination
        'Show first page' => 'Első oldal megjelenítése',
        'Show previous pages' => 'Előző oldalak megjelenítése',
        'Show page %s' => '%s. oldal megjelenítése',
        'Show next pages' => 'Következő oldalak megjelenítése',
        'Show last page' => 'Utolsó oldal megjelenítése',

        # Template: PictureUpload
        'Need FormID!' => 'Űrlap-azonosító szükséges!',
        'No file found!' => 'Nem található fájl!',
        'The file is not an image that can be shown inline!' => 'A fájl nem olyan kép, amelyet beágyazva meg lehetne jeleníteni!',

        # Template: PreferencesNotificationEvent
        'Notification' => 'Értesítés',
        'No user configurable notifications found.' => 'Nem találhatók felhasználó által beállítható értesítések.',
        'Receive messages for notification \'%s\' by transport method \'%s\'.' =>
            'Üzenetek fogadása a(z) „%s” értesítéshez a(z) „%s” átviteli módszerrel.',
        'Please note that you can\'t completely disable notifications marked as mandatory.' =>
            'Ne feledje, hogy nem tudja teljesen letiltani a kötelezőként megjelölt értesítéseket.',
        'Sorry, but you can\'t disable all methods for notifications marked as mandatory.' =>
            'Sajnáljuk, de nem tud minden módszert letiltani a kötelezőként megjelölt értesítéseknél.',
        'Sorry, but you can\'t disable all methods for this notification.' =>
            'Sajnáljuk, de nem tud minden módszert letiltani ennél az értesítésnél.',

        # Template: ActivityDialogHeader
        'Process Information' => 'Folyamat-információk',
        'Dialog' => 'Párbeszéd',

        # Template: Article
        'Inform Agent' => 'Ügyintéző értesítése',

        # Template: PublicDefault
        'Welcome' => 'Üdvözöljük',
        'This is the default public interface of OTRS! There was no action parameter given.' =>
            'Ez az OTRS alapértelmezett nyilvános felülete! Nem került megadásra műveleti paraméter.',
        'You could install a custom public module (via the package manager), for example the FAQ module, which has a public interface.' =>
            'Telepíthetne egy olyan egyéni nyilvános modult (a csomagkezelőn keresztül), amelynek van nyilvános felülete, mint például a GyIK modulnak.',

        # Template: RichTextEditor
        'Remove Quote' => 'Idézés eltávolítása',

        # Template: GeneralSpecificationsWidget
        'Permissions' => 'Jogosultságok',
        'You can select one or more groups to define access for different agents.' =>
            'Kiválaszthat egy vagy több csoportot a hozzáférés meghatározásához a különböző ügyintézőknél.',
        'Result formats' => 'Eredmény formátumok',
        'The selected time periods in the statistic are time zone neutral.' =>
            'A kiválasztott időszakok a statisztikában időzóna semlegesek.',
        'Create summation row' => 'Összegző sor létrehozása',
        'Generate an additional row containing sums for all data rows.' =>
            'Egy további sort állít elő, amely az összes adatsor összegeit tartalmazza.',
        'Create summation column' => 'Összegző oszlop létrehozása',
        'Generate an additional column containing sums for all data columns.' =>
            'Egy további oszlopot állít elő, amely az összes adatoszlop összegeit tartalmazza.',
        'Cache results' => 'Eredmények gyorstárazása',
        'Stores statistics result data in a cache to be used in subsequent views with the same configuration (requires at least one selected time field).' =>
            'Eltárolja a statisztikák eredményadatait egy gyorsítótárban az azonos beállítással rendelkező későbbi nézetekben való használathoz (legalább egy kiválasztott időmezőt igényel).',
        'Provide the statistic as a widget that agents can activate in their dashboard.' =>
            'A statisztika biztosítása felületi elemként, amelyet az ügyintézők aktiválhatnak a vezérlőpultjukon.',
        'Please note that enabling the dashboard widget will activate caching for this statistic in the dashboard.' =>
            'Ne feledje, hogy a vezérlőpult felületi elem engedélyezése aktiválni fogja a statisztika gyorsítótárának használatát a vezérlőpulton.',
        'If set to invalid end users can not generate the stat.' => 'Ha érvénytelenre állítja, a végfelhasználók nem tudják a statisztikát előállítani.',

        # Template: PreviewWidget
        'There are problems in the configuration of this statistic:' => 'Problémák vannak ennek a statisztikának a beállításaiban:',
        'You may now configure the X-axis of your statistic.' => 'Most beállíthatja a statisztika X-tengelyét.',
        'This statistic does not provide preview data.' => 'Ez a statisztika nem szolgáltat előnézeti adatokat.',
        'Preview format:' => 'Előnézeti formátum:',
        'Please note that the preview uses random data and does not consider data filters.' =>
            'Ne feledje, hogy az előnézet véletlenszerű adatokat használ, és nincs tekintettel az adatszűrőkre.',
        'Configure X-Axis' => 'X-tengely beállítása',
        'X-axis' => 'X-tengely',
        'Configure Y-Axis' => 'Y-tengely beállítása',
        'Y-axis' => 'Y-tengely',
        'Configure Filter' => 'Szűrő beállítása',

        # Template: RestrictionsWidget
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Csak egyetlen elemet válasszon, vagy kapcsolja ki a „Rögzített” gombot.',
        'Absolute period' => 'Abszolút időszak',
        'Between' => 'Között',
        'Relative period' => 'Relatív időszak',
        'The past complete %s and the current+upcoming complete %s %s' =>
            'A már teljes %s és a jelenlegi+közelgő teljes %s %s',
        'Do not allow changes to this element when the statistic is generated.' =>
            'Ne tegyen lehetővé változtatásokat ezen az elemen, amikor a statisztikát előállítják.',

        # Template: StatsParamsWidget
        'Format' => 'Formátum',
        'Exchange Axis' => 'Tengelyek felcserélése',
        'Configurable params of static stat' => 'Statikus statisztika beállítható paraméterei',
        'No element selected.' => 'Nincs elem kiválasztva.',
        'Scale' => 'Skála',
        'show more' => 'több megjelenítése',
        'show less' => 'kevesebb megjelenítése',

        # Template: D3
        'Download SVG' => 'SVG letöltése',
        'Download PNG' => 'PNG letöltése',

        # Template: XAxisWidget
        'The selected time period defines the default time frame for this statistic to collect data from.' =>
            'A kijelölt időszak határozza meg azt az alapértelmezett időkeretet ennél a statisztikánál, amelyből az adatokat begyűjti.',
        'Defines the time unit that will be used to split the selected time period into reporting data points.' =>
            'Azt az időegységet határozza meg, amely a kijelölt időszaknak jelentési adatpontokba történő felosztásához lesz használva.',

        # Template: YAxisWidget
        'Please remember that the scale for the Y-axis has to be larger than the scale for the X-axis (e.g. X-axis => Month, Y-Axis => Year).' =>
            'Ne feledje, hogy az Y-tengely méretezésének nagyobbnak kell lennie az X-tengely méretezésénél (például X-tengely => Hónap, Y-tengely => Év).',

        # Template: Test
        'OTRS Test Page' => 'OTRS tesztoldal',
        'Welcome %s %s' => 'Üdvözli a(z) %s %s',
        'Counter' => 'Számláló',

        # Template: Warning
        'Go back to the previous page' => 'Vissza az előző oldalra',

        # Perl Module: Kernel/Config/Defaults.pm
        'View system log messages.' => 'Rendszernapló üzenetek megtekintése.',
        'Update and extend your system with software packages.' => 'A rendszer frissítése vagy kibővítése szoftvercsomagokkal.',

        # Perl Module: Kernel/Modules/AdminACL.pm
        'ACLs could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            'Az ACL-eket nem sikerült importálni egy ismeretlen hiba miatt, további információkért nézze meg az OTRS naplókat',
        'The following ACLs have been added successfully: %s' => 'A következő ACL-ek sikeresen hozzá lettek adva: %s',
        'The following ACLs have been updated successfully: %s' => 'A következő ACL-ek sikeresen frissítve lettek: %s',
        'There where errors adding/updating the following ACLs: %s. Please check the log file for more information.' =>
            'Hibák történtek a következő ACL-ek hozzáadásakor vagy frissítésekor: %s. További információkért nézze meg a naplófájlt.',
        'This field is required' => 'Ez a mező kötelező',
        'There was an error creating the ACL' => 'Hiba történt az ACL létrehozásakor',
        'Need ACLID!' => 'ACL-azonosító szükséges!',
        'Could not get data for ACLID %s' => 'Nem sikerült lekérni az adatokat az ACL-azonosítóhoz: %s',
        'There was an error updating the ACL' => 'Hiba történt az ACL frissítésekor',
        'There was an error setting the entity sync status.' => 'Hiba történt az egyed szinkronizációs állapotának beállításakor.',
        'There was an error synchronizing the ACLs.' => 'Hiba történt az ACL-ek szinkronizálásakor.',
        'ACL %s could not be deleted' => 'A(z) %s ACL törlése nem sikerült',
        'There was an error getting data for ACL with ID %s' => 'Hiba történt az adatok lekérésekor a(z) %s azonosítóval rendelkező ACL-nél',
        'Exact match' => 'Pontos egyezés',
        'Negated exact match' => 'Tagadott pontos egyezés',
        'Regular expression' => 'Reguláris kifejezés',
        'Regular expression (ignore case)' => 'Reguláris kifejezés (kis- és nagybetű megegyezik)',
        'Negated regular expression' => 'Tagadott reguláris kifejezés',
        'Negated regular expression (ignore case)' => 'Tagadott reguláris kifejezés (kis- és nagybetű megegyezik)',

        # Perl Module: Kernel/Modules/AdminCustomerCompany.pm
        'Customer Company %s already exists!' => 'A(z) %s ügyfél-vállalat már létezik!',

        # Perl Module: Kernel/Modules/AdminCustomerUser.pm
        'New phone ticket' => 'Új telefonos jegy',
        'New email ticket' => 'Új e-mail jegy',

        # Perl Module: Kernel/Modules/AdminDynamicField.pm
        'Fields configuration is not valid' => 'A mezők beállítása nem érvényes',
        'Objects configuration is not valid' => 'Az objektumok beállítása nem érvényes',
        'Could not reset Dynamic Field order properly, please check the error log for more details.' =>
            'Nem sikerült megfelelően visszaállítani a dinamikus mező sorrendjét. További részletekért nézze meg a hibanaplót.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldCheckbox.pm
        'Undefined subaction.' => 'Meghatározatlan alművelet.',
        'Need %s' => '%s szükséges',
        'The field does not contain only ASCII letters and numbers.' => 'Ez a mező nem csak ASCII betűket és számokat tartalmaz.',
        'There is another field with the same name.' => 'Már létezik egy ugyanilyen nevű mező.',
        'The field must be numeric.' => 'Ez a mező csak számot tartalmazhat.',
        'Need ValidID' => 'Érvényes-azonosító szükséges',
        'Could not create the new field' => 'Nem sikerült létrehozni az új mezőt',
        'Need ID' => 'Azonosító szükséges',
        'Could not get data for dynamic field %s' => 'Nem sikerült lekérni az adatokat a dinamikus mezőhöz: %s',
        'The name for this field should not change.' => 'Ennek a mezőnek a nevét nem szabad megváltoztatni.',
        'Could not update the field %s' => 'Nem sikerült frissíteni a következő mezőt: %s',
        'Currently' => 'Jelenleg',
        'Unchecked' => 'Nincs bejelölve',
        'Checked' => 'Bejelölve',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDateTime.pm
        'Prevent entry of dates in the future' => 'Jövőbeli dátumbejegyzések megakadályozása',
        'Prevent entry of dates in the past' => 'Múltbeli dátumbejegyzések megakadályozása',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDropdown.pm
        'This field value is duplicated.' => 'Ez a mezőérték kettőzött.',

        # Perl Module: Kernel/Modules/AdminEmail.pm
        'Select at least one recipient.' => 'Válasszon legalább egy címzettet.',

        # Perl Module: Kernel/Modules/AdminGenericAgent.pm
        'archive tickets' => 'jegyek archiválása',
        'restore tickets from archive' => 'jegyek visszaállítása az archívumból',
        'Need Profile!' => 'Profil szükséges!',
        'Got no values to check.' => 'Nem kaptam értékeket az ellenőrzéshez.',
        'Please remove the following words because they cannot be used for the ticket selection:' =>
            'Távolítsa el a következő szavakat, mert azok nem használhatók a jegykiválasztásnál:',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceDebugger.pm
        'Need WebserviceID!' => 'Webszolgáltatás-azonosító szükséges!',
        'Could not get data for WebserviceID %s' => 'Nem sikerült lekérni az adatokat a webszolgáltatás-azonosítóhoz: %s',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerDefault.pm
        'Need InvokerType' => 'Meghívótípus szükséges',
        'Invoker %s is not registered' => 'A(z) %s meghívó nincs regisztrálva',
        'InvokerType %s is not registered' => 'A(z) %s meghívótípus nincs regisztrálva',
        'Need Invoker' => 'Meghívó szükséges',
        'Could not determine config for invoker %s' => 'Nem sikerült meghatározni a beállítást a(z) %s meghívónál',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingSimple.pm
        'Could not get registered configuration for action type %s' => 'Nem sikerült regisztráltatni a beállítást a(z) %s művelettípushoz',
        'Could not get backend for %s %s' => 'Nem sikerült lekérni a háttérprogramot ennél: %s %s',
        'Could not update configuration data for WebserviceID %s' => 'Nem sikerült frissíteni a beállítási adatokat a(z) %s webszolgáltatás-azonosítónál',
        'Keep (leave unchanged)' => 'Megtartás (változatlanul hagyás)',
        'Ignore (drop key/value pair)' => 'Mellőzés (kulcs-érték pár eldobása)',
        'Map to (use provided value as default)' => 'Leképezés (biztosított érték használata alapértelmezettként)',
        'Exact value(s)' => 'Pontos értékek',
        'Ignore (drop Value/value pair)' => 'Mellőzés (érték-érték pár eldobása)',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingXSLT.pm
        'Could not find required library %s' => 'Nem található a szükséges programkönyvtár: %s',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceOperationDefault.pm
        'Need OperationType' => 'Művelettípus szükséges',
        'Operation %s is not registered' => 'A(z) %s művelet nincs regisztrálva',
        'OperationType %s is not registered' => 'A(z) %s művelettípus nincs regisztrálva',
        'Need Operation' => 'Művelet szükséges',
        'Could not determine config for operation %s' => 'Nem sikerült meghatározni a beállítást a(z) %s műveletnél',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceTransportHTTPREST.pm
        'Need Subaction!' => 'Alművelet szükséges!',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebservice.pm
        'There is another web service with the same name.' => 'Már létezik egy ugyanilyen nevű webszolgáltatás.',
        'There was an error updating the web service.' => 'Hiba történt a webszolgáltatás frissítésekor.',
        'Web service "%s" updated!' => 'A(z) „%s” webszolgáltatás frissítve!',
        'There was an error creating the web service.' => 'Hiba történt a webszolgáltatás létrehozásakor.',
        'Web service "%s" created!' => 'A(z) „%s” webszolgáltatás létrehozva!',
        'Need Name!' => 'Név szükséges!',
        'Need ExampleWebService!' => 'Példa webszolgáltatás szükséges!',
        'Could not read %s!' => 'Nem sikerült olvasni: %s!',
        'Need a file to import!' => 'Egy fájl szükséges az importáláshoz!',
        'The imported file has not valid YAML content! Please check OTRS log for details' =>
            'Az importált fájl nem rendelkezik érvényes YAML tartalommal! A részletekért nézze meg az OTRS naplóját.',
        'Web service "%s" deleted!' => 'A(z) „%s” webszolgáltatás törölve!',
        'New Web service' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebserviceHistory.pm
        'Got no WebserviceHistoryID!' => 'Nem kaptam webszolgáltatás előzmény-azonosítót!',
        'Could not get history data for WebserviceHistoryID %s' => 'Nem sikerült lekérni az előzményadatokat a(z) %s webszolgáltatás előzmény-azonosítóhoz',

        # Perl Module: Kernel/Modules/AdminNotificationEvent.pm
        'Notification updated!' => 'Értesítés frissítve!',
        'Notification added!' => 'Értesítés hozzáadva!',
        'There was an error getting data for Notification with ID:%s!' =>
            'Hiba történt az adatok lekérésekor az ID:%s azonosítóval rendelkező értesítésnél!',
        'Unknown Notification %s!' => 'Ismeretlen értesítés: %s!',
        'There was an error creating the Notification' => 'Hiba történt az értesítés létrehozásakor',
        'Notifications could not be Imported due to a unknown error, please check OTRS logs for more information' =>
            'Az értesítéseket nem sikerült importálni egy ismeretlen hiba miatt, további információkért nézze meg az OTRS naplókat',
        'The following Notifications have been added successfully: %s' =>
            'A következő értesítések sikeresen hozzá lettek adva: %s',
        'The following Notifications have been updated successfully: %s' =>
            'A következő értesítések sikeresen frissítve lettek: %s',
        'There where errors adding/updating the following Notifications: %s. Please check the log file for more information.' =>
            'Hibák történtek a következő értesítések hozzáadásakor vagy frissítésekor: %s. További információkért nézze meg a naplófájlt.',
        'Agent who owns the ticket' => 'Az ügyintéző, aki a jegy tulajdonosa',
        'Agent who is responsible for the ticket' => 'Az ügyintéző, aki a jegyért felelős',
        'All agents watching the ticket' => 'A jegyet megfigyelő összes ügyintéző',
        'All agents with write permission for the ticket' => 'A jegyhez írási jogosultsággal rendelkező összes ügyintéző',
        'All agents subscribed to the ticket\'s queue' => 'A jegy várólistájára feliratkozott összes ügyintéző',
        'All agents subscribed to the ticket\'s service' => 'A jegy szolgáltatására feliratkozott összes ügyintéző',
        'All agents subscribed to both the ticket\'s queue and service' =>
            'A jegy várólistájára és szolgáltatására is feliratkozott összes ügyintéző',
        'Customer of the ticket' => 'A jegy ügyfele',
        'Yes, but require at least one active notification method' => 'Igen, de legalább egy aktív értesítési módszert igényel',

        # Perl Module: Kernel/Modules/AdminPGP.pm
        'PGP environment is not working. Please check log for more info!' =>
            'A PGP környezet nem működik. További információkért nézze meg a naplót!',
        'Need param Key to delete!' => 'Kulcs paraméter szükséges a törléshez!',
        'Key %s deleted!' => 'A(z) %s kulcs törölve!',
        'Need param Key to download!' => 'Kulcs paraméter szükséges a letöltéshez!',

        # Perl Module: Kernel/Modules/AdminPackageManager.pm
        'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/otrs.Console.pl to install packages!' =>
            'Sajnáljuk, de az Apache::Reload modul PerlModule és PerlInitHandler beállításként szükséges az Apache beállítófájljában. Nézze meg a scripts/apache2-httpd.include.conf parancsfájlt is. Alternatívaként használhatja a bin/otrs.Console.pl parancssori eszközt is a csomagok telepítéséhez!',
        'No such package!' => 'Nincs ilyen csomag!',
        'No such file %s in package!' => 'Nincs ilyen %s fájl a csomagban!',
        'No such file %s in local file system!' => 'Nincs ilyen %s fájl a helyi fájlrendszeren!',
        'Can\'t read %s!' => 'Nem olvasható: %s!',
        'File is OK' => 'A fájl rendben van',
        'Package has locally modified files.' => 'A csomag helyileg módosított fájlokkal rendelkezik.',
        'No packages or no new packages found in selected repository.' =>
            'Nincsenek csomagok vagy nem találhatók új csomagok a kijelölt tárolóban.',
        'Package not verified due a communication issue with verification server!' =>
            'A csomag nincs ellenőrizve az ellenőrző-kiszolgálóval történő kommunikációs hiba miatt!',
        'Can\'t connect to OTRS Feature Add-on list server!' => 'Nem lehet kapcsolódni az OTRS szolgáltatáskiegészítő lista kiszolgálójához!',
        'Can\'t get OTRS Feature Add-on list from server!' => 'Nem lehet lekérni az OTRS szolgáltatáskiegészítő listát a kiszolgálóról!',
        'Can\'t get OTRS Feature Add-on from server!' => 'Nem lehet lekérni az OTRS szolgáltatáskiegészítőt a kiszolgálóról!',

        # Perl Module: Kernel/Modules/AdminPostMasterFilter.pm
        'No such filter: %s' => 'Nincs ilyen szűrő: %s',

        # Perl Module: Kernel/Modules/AdminProcessManagement.pm
        'Need ExampleProcesses!' => 'Példafolyamatok szükségesek!',
        'Need ProcessID!' => 'Folyamatazonosító szükséges!',
        'Yes (mandatory)' => 'Igen (kötelező)',
        'Unknown Process %s!' => 'Ismeretlen folyamat: %s!',
        'There was an error generating a new EntityID for this Process' =>
            'Hiba történt egy új egyedazonosító előállításakor ennél a folyamatnál',
        'The StateEntityID for state Inactive does not exists' => 'Az állapotegyed-azonosító az Inaktív állapotnál nem létezik',
        'There was an error creating the Process' => 'Hiba történt a folyamat létrehozásakor',
        'There was an error setting the entity sync status for Process entity: %s' =>
            'Hiba történt az egyed szinkronizációs állapotának beállításakor ennél a folyamategyednél: %s',
        'Could not get data for ProcessID %s' => 'Nem sikerült lekérni az adatokat a folyamatazonosítóhoz: %s',
        'There was an error updating the Process' => 'Hiba történt a folyamat frissítésekor',
        'Process: %s could not be deleted' => 'Folyamat: %s törlése nem sikerült',
        'There was an error synchronizing the processes.' => 'Hiba történt a folyamatok szinkronizálásakor.',
        'The %s:%s is still in use' => 'A(z) %s:%s még mindig használatban van',
        'The %s:%s has a different EntityID' => 'A(z) %s:%s eltérő egyedazonosítóval rendelkezik',
        'Could not delete %s:%s' => 'Nem sikerült törölni: %s:%s',
        'There was an error setting the entity sync status for %s entity: %s' =>
            'Hiba történt az egyed szinkronizációs állapotának beállításakor a(z) %s egyednél: %s',
        'Could not get %s' => 'Nem sikerült lekérni: %s',
        'Need %s!' => '%s szükséges!',
        'Process: %s is not Inactive' => 'Folyamat: %s nem inaktív',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivity.pm
        'There was an error generating a new EntityID for this Activity' =>
            'Hiba történt egy új egyedazonosító előállításakor ennél a tevékenységnél',
        'There was an error creating the Activity' => 'Hiba történt a tevékenység létrehozásakor',
        'There was an error setting the entity sync status for Activity entity: %s' =>
            'Hiba történt az egyed szinkronizációs állapotának beállításakor a tevékenységegyednél: %s',
        'Need ActivityID!' => 'Tevékenység-azonosító szükséges!',
        'Could not get data for ActivityID %s' => 'Nem sikerült lekérni az adatokat a tevékenység-azonosítóhoz: %s',
        'There was an error updating the Activity' => 'Hiba történt a tevékenység frissítésekor',
        'Missing Parameter: Need Activity and ActivityDialog!' => 'Hiányzó paraméter: tevékenység és tevékenység párbeszéd szükséges!',
        'Activity not found!' => 'Nem található tevékenység!',
        'ActivityDialog not found!' => 'Nem található tevékenység párbeszéd!',
        'ActivityDialog already assigned to Activity. You cannot add an ActivityDialog twice!' =>
            'A tevékenység párbeszéd már hozzá van rendelve a tevékenységhez. Nem adhat hozzá egy tevékenység párbeszédet kétszer!',
        'Error while saving the Activity to the database!' => 'Hiba történt a tevékenységnek az adatbázisba történő mentése közben!',
        'This subaction is not valid' => 'Ez az alművelet nem érvényes',
        'Edit Activity "%s"' => 'Tevékenység szerkesztése: „%s”',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivityDialog.pm
        'There was an error generating a new EntityID for this ActivityDialog' =>
            'Hiba történt egy új egyedazonosító előállításakor ennél a tevékenység párbeszédnél',
        'There was an error creating the ActivityDialog' => 'Hiba történt a tevékenység párbeszéd létrehozásakor',
        'There was an error setting the entity sync status for ActivityDialog entity: %s' =>
            'Hiba történt az egyed szinkronizációs állapotának beállításakor a tevékenység párbeszéd egyednél: %s',
        'Need ActivityDialogID!' => 'Tevékenység párbeszéd azonosító szükséges!',
        'Could not get data for ActivityDialogID %s' => 'Nem sikerült lekérni az adatokat a tevékenység párbeszéd azonosítójához: %s',
        'There was an error updating the ActivityDialog' => 'Hiba történt a tevékenység párbeszéd frissítésekor',
        'Edit Activity Dialog "%s"' => 'Tevékenység párbeszéd szerkesztése: „%s”',
        'Agent Interface' => 'Ügyintézői felület',
        'Customer Interface' => 'Ügyfélfelület',
        'Agent and Customer Interface' => 'Ügyintézői és ügyfélfelület',
        'Do not show Field' => 'Ne jelenjen meg a mező',
        'Show Field' => 'Mező megjelenítése',
        'Show Field As Mandatory' => 'Mező megjelenítése kötelezőként',
        'fax' => 'fax',

        # Perl Module: Kernel/Modules/AdminProcessManagementPath.pm
        'Edit Path' => 'Útvonal szerkesztése',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransition.pm
        'There was an error generating a new EntityID for this Transition' =>
            'Hiba történt egy új egyedazonosító előállításakor ennél az átmenetnél',
        'There was an error creating the Transition' => 'Hiba történt az átmenet létrehozásakor',
        'There was an error setting the entity sync status for Transition entity: %s' =>
            'Hiba történt az egyed szinkronizációs állapotának beállításakor az átmenetegyednél: %s',
        'Need TransitionID!' => 'Átmenet-azonosító szükséges!',
        'Could not get data for TransitionID %s' => 'Nem sikerült lekérni az adatokat az átmenet-azonosítóhoz: %s',
        'There was an error updating the Transition' => 'Hiba történt az átmenet frissítésekor',
        'Edit Transition "%s"' => 'Átmenet szerkesztése: „%s”',
        'xor' => 'kizáró vagy',
        'String' => 'Szöveg',
        'Transition validation module' => 'Átmenet-ellenőrző modul',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransitionAction.pm
        'At least one valid config parameter is required.' => 'Legalább egy érvényes beállítási paraméter szükséges.',
        'There was an error generating a new EntityID for this TransitionAction' =>
            'Hiba történt egy új egyedazonosító előállításakor ennél az átmenet műveletnél',
        'There was an error creating the TransitionAction' => 'Hiba történt az átmenet művelet létrehozásakor',
        'There was an error setting the entity sync status for TransitionAction entity: %s' =>
            'Hiba történt az egyed szinkronizációs állapotának beállításakor az átmenet művelet egyednél: %s',
        'Need TransitionActionID!' => 'Átmenet művelet azonosító szükséges!',
        'Could not get data for TransitionActionID %s' => 'Nem sikerült lekérni az adatokat az átmenet művelet azonosítóhoz: %s',
        'There was an error updating the TransitionAction' => 'Hiba történt az átmenet művelet frissítésekor',
        'Edit Transition Action "%s"' => 'Átmenet művelet szerkesztése: „%s”',
        'Error: Not all keys seem to have values or vice versa.' => 'Hiba: úgy tűnik, hogy nem minden kulcsnak van értéke, és fordítva.',

        # Perl Module: Kernel/Modules/AdminQueue.pm
        'Don\'t use :: in queue name!' => 'Ne használjon :: karaktereket a várólista nevében!',
        'Click back and change it!' => 'Kattintson vissza, és változtassa meg!',

        # Perl Module: Kernel/Modules/AdminQueueAutoResponse.pm
        'Queues ( without auto responses )' => 'Várólisták (automatikus válaszok nélkül)',

        # Perl Module: Kernel/Modules/AdminSMIME.pm
        'S/MIME environment is not working. Please check log for more info!' =>
            'Az S/MIME környezet nem működik. További információkért nézze meg a naplót!',
        'Need param Filename to delete!' => 'Fájlnév paraméter szükséges a törléshez!',
        'Need param Filename to download!' => 'Fájlnév paraméter szükséges a letöltéshez!',
        'Needed CertFingerprint and CAFingerprint!' => 'Tanúsítvány ujjlenyomat és hitelesítésszolgáltató ujjlenyomat szükséges!',
        'CAFingerprint must be different than CertFingerprint' => 'A hitelesítésszolgáltató ujjlenyomatának eltérőnek kell lennie a tanúsítvány ujjlenyomatától',
        'Relation exists!' => 'A kapcsolat létezik!',
        'Relation added!' => 'Kapcsolat hozzáadva!',
        'Impossible to add relation!' => 'Lehetetlen hozzáadni a kapcsolatot!',
        'Relation doesn\'t exists' => 'A kapcsolat nem létezik',
        'Relation deleted!' => 'Kapcsolat törölve!',
        'Impossible to delete relation!' => 'Lehetetlen törölni a kapcsolatot!',
        'Certificate %s could not be read!' => 'A(z) %s tanúsítványt nem sikerült beolvasni!',
        'Needed Fingerprint' => 'Ujjlenyomat szükséges',

        # Perl Module: Kernel/Modules/AdminSalutation.pm
        'Salutation updated!' => 'Megszólítás frissítve!',
        'Salutation added!' => 'Megszólítás hozzáadva!',

        # Perl Module: Kernel/Modules/AdminSupportDataCollector.pm
        'File %s could not be read!' => 'A(z) %s fájlt nem sikerült beolvasni!',

        # Perl Module: Kernel/Modules/AdminSysConfig.pm
        'Import not allowed!' => 'Az importálás nem engedélyezett!',
        'Need File!' => 'Fájl szükséges!',
        'Can\'t write ConfigItem!' => 'Nem lehet írni a beállítási elemet!',

        # Perl Module: Kernel/Modules/AdminSystemMaintenance.pm
        'Start date shouldn\'t be defined after Stop date!' => 'A kezdődátumot nem lehet a végdátum utánra meghatározni!',
        'There was an error creating the System Maintenance' => 'Hiba történt a rendszerkarbantartás létrehozásakor',
        'Need SystemMaintenanceID!' => 'Rendszerkarbantartás-azonosító szükséges!',
        'Could not get data for SystemMaintenanceID %s' => 'Nem sikerült lekérni az adatokat a rendszerkarbantartás-azonosítóhoz: %s',
        'System Maintenance was saved successfully!' => 'A rendszerkarbantartás sikeresen mentésre került!',
        'Session has been killed!' => 'A munkamenet ki lett lőve!',
        'All sessions have been killed, except for your own.' => 'Összes munkamenet ki lett lőve, kivéve az Ön sajátját.',
        'There was an error updating the System Maintenance' => 'Hiba történt a rendszerkarbantartás frissítésekor',
        'Was not possible to delete the SystemMaintenance entry: %s!' => 'Nem volt lehetséges a rendszerkarbantartás egyedet törölni: %s!',

        # Perl Module: Kernel/Modules/AdminTemplate.pm
        'Template updated!' => 'Sablon frissítve!',
        'Template added!' => 'Sablon hozzáadva!',

        # Perl Module: Kernel/Modules/AdminType.pm
        'Need Type!' => 'Típus szükséges!',

        # Perl Module: Kernel/Modules/AgentDashboardCommon.pm
        'No such config for %s' => 'Nincs ilyen beállítás ehhez: %s',
        'Statistic' => 'Statisztika',
        'No preferences for %s!' => 'Nincsenek beállítások ehhez: %s!',
        'Can\'t get element data of %s!' => 'Nem lehet lekérni a(z) „%s” elemadatait!',
        'Can\'t get filter content data of %s!' => 'Nem lehet lekérni a(z) „%s” szűrőtartalom-adatait!',
        'Customer Company Name' => 'Ügyfél-vállalat neve',
        'Customer User ID' => 'Ügyfél-felhasználó azonosítója',

        # Perl Module: Kernel/Modules/AgentLinkObject.pm
        'Need SourceObject and SourceKey!' => 'Forrásobjektum és forráskulcs szükséges!',
        'Please contact the administrator.' => 'Vegye fel a kapcsolatot a rendszergazdával.',
        'You need ro permission!' => 'Csak olvasható jogosultságra van szüksége!',
        'Can not delete link with %s!' => 'A következővel való kapcsolat nem törölhető: %s!',
        'Can not create link with %s! Object already linked as %s.' => 'Nem lehet kapcsolatot létrehozni ezzel: %s! Az objektum már a következőként kapcsolódik: %s.',
        'Can not create link with %s!' => 'A következővel való kapcsolat nem hozható létre: %s!',
        'The object %s cannot link with other object!' => 'A(z) %s objektum nem kapcsolható össze más objektummal!',

        # Perl Module: Kernel/Modules/AgentPreferences.pm
        'Param Group is required!' => 'Csoport paraméter szükséges!',

        # Perl Module: Kernel/Modules/AgentStatistics.pm
        'Parameter %s is missing.' => 'A(z) %s paraméter hiányzik.',
        'Invalid Subaction.' => 'Érvénytelen alművelet.',
        'Statistic could not be imported.' => 'A statisztika importálása nem sikerült.',
        'Please upload a valid statistic file.' => 'Töltsön fel egy érvényes statisztikafájlt.',
        'Export: Need StatID!' => 'Exportálás: statisztikaazonosító szükséges!',
        'Delete: Get no StatID!' => 'Törlés: nem kaptam statisztikaazonosítót!',
        'Need StatID!' => 'Statisztikaazonosító szükséges!',
        'Could not load stat.' => 'Nem sikerült betölteni a statisztikát.',
        'Could not create statistic.' => 'Nem sikerült létrehozni a statisztikát.',
        'Run: Get no %s!' => 'Futtatás: nem kaptam ilyet: %s!',

        # Perl Module: Kernel/Modules/AgentTicketActionCommon.pm
        'No TicketID is given!' => 'Nincs jegyazonosító megadva!',
        'You need %s permissions!' => '%s jogosultságokra van szüksége!',
        'Could not perform validation on field %s!' => 'Nem sikerült végrehajtani az ellenőrzést a következő mezőn: %s!',
        'No subject' => 'Nincs tárgy',
        'Previous Owner' => 'Korábbi tulajdonos',

        # Perl Module: Kernel/Modules/AgentTicketBounce.pm
        '%s is needed!' => '%s szükséges!',
        'Plain article not found for article %s!' => 'Egyszerű bejegyzés nem található a(z) %s bejegyzéshez!',
        'Article does not belong to ticket %s!' => 'A bejegyzés nem tartozik ehhez a jegyhez: %s!',
        'Can\'t bounce email!' => 'Nem lehet átirányítani az e-mailt!',
        'Can\'t send email!' => 'Nem lehet elküldeni az e-mailt!',
        'Wrong Subaction!' => 'Rossz alművelet!',

        # Perl Module: Kernel/Modules/AgentTicketBulk.pm
        'Can\'t lock Tickets, no TicketIDs are given!' => 'Nem lehet zárolni a jegyeket, nincsenek jegyazonosítók megadva!',
        'Ticket (%s) is not unlocked!' => 'A jegy (%s) nincs feloldva!',
        'Bulk feature is not enabled!' => 'A tömeges funkció nincs engedélyezve!',
        'No selectable TicketID is given!' => 'Nincs kiválasztható jegyazonosító megadva!',
        'You either selected no ticket or only tickets which are locked by other agents.' =>
            'Vagy nem választott ki jegyet, vagy csak olyan jegyeket, amelyeket más ügyintézők zároltak.',
        'You need to select at least one ticket.' => 'Legalább egy jegyet ki kell választania.',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to these tickets: %s.' =>
            'A következő jegyek figyelmen kívül lettek hagyva, mert másik ügyintéző zárolta azokat vagy nincs írási hozzáférése ezekhez a jegyekhez: %s.',
        'The following tickets were locked: %s.' => 'A következő jegyek zárolva lettek: %s.',

        # Perl Module: Kernel/Modules/AgentTicketCompose.pm
        'Can not determine the ArticleType!' => 'Nem lehet meghatározni a bejegyzés típusát!',

        # Perl Module: Kernel/Modules/AgentTicketEmail.pm
        'No Subaction!' => 'Nincs alművelet!',

        # Perl Module: Kernel/Modules/AgentTicketEmailOutbound.pm
        'Got no TicketID!' => 'Nem kaptam jegyazonosítót!',
        'System Error!' => 'Rendszerhiba!',

        # Perl Module: Kernel/Modules/AgentTicketEscalationView.pm
        'Invalid Filter: %s!' => 'Érvénytelen szűrő: %s!',

        # Perl Module: Kernel/Modules/AgentTicketHistory.pm
        'Can\'t show history, no TicketID is given!' => 'Nem lehet megjeleníteni az előzményeket, nincs jegyazonosító megadva!',

        # Perl Module: Kernel/Modules/AgentTicketLock.pm
        'Can\'t lock Ticket, no TicketID is given!' => 'Nem lehet zárolni a jegyet, nincs jegyazonosító megadva!',
        'Sorry, the current owner is %s!' => 'Sajnáljuk, a jelenlegi tulajdonos %s!',
        'Please become the owner first.' => 'Először legyen Ön a tulajdonos.',
        'Ticket (ID=%s) is locked by %s!' => 'A jegyet (ID=%s) %s zárolta!',
        'Change the owner!' => 'Változtassa meg a tulajdonost!',

        # Perl Module: Kernel/Modules/AgentTicketMerge.pm
        'Can\'t merge ticket with itself!' => 'Nem lehet egyesíteni a jegyet saját magával!',

        # Perl Module: Kernel/Modules/AgentTicketMove.pm
        'You need move permissions!' => 'Áthelyezés jogosultságokra van szüksége!',

        # Perl Module: Kernel/Modules/AgentTicketPhone.pm
        'Chat is not active.' => 'A csevegés nem aktív.',
        'No permission.' => 'Nincs jogosultság.',
        '%s has left the chat.' => '%s kilépett a csevegésből.',
        'This chat has been closed and will be removed in %s hours.' => 'Ez a csevegés le lett zárva és eltávolításra kerül %s órán belül.',

        # Perl Module: Kernel/Modules/AgentTicketPlain.pm
        'No ArticleID!' => 'Nincs bejegyzésazonosító!',
        'Can\'t read plain article! Maybe there is no plain email in backend! Read backend message.' =>
            'Nem lehet olvasni az egyszerű bejegyzést! Talán nincs is egyszerű e-mail a háttérprogramban! Olvassa el a háttérprogram üzenetét.',

        # Perl Module: Kernel/Modules/AgentTicketPrint.pm
        'Need TicketID!' => 'Jegyazonosító szükséges!',
        'printed by' => 'nyomtatta',
        'Ticket Dynamic Fields' => 'Jegy dinamikus mezők',

        # Perl Module: Kernel/Modules/AgentTicketProcess.pm
        'Couldn\'t get ActivityDialogEntityID "%s"!' => 'Nem sikerült lekérni a tevékenység párbeszéd egyedazonosítót: „%s”!',
        'No Process configured!' => 'Nincs beállított folyamat!',
        'Process %s is invalid!' => 'A(z) %s folyamat érvénytelen!',
        'Subaction is invalid!' => 'Az alművelet érvénytelen!',
        'Parameter %s is missing in %s.' => 'A(z) %s paraméter hiányzik ebben: %s.',
        'No ActivityDialog configured for %s in _RenderAjax!' => 'Nincs tevékenység párbeszéd beállítva a _RenderAjax szubrutinban ehhez: %s!',
        'Got no Start ActivityEntityID or Start ActivityDialogEntityID for Process: %s in _GetParam!' =>
            'Nem érkezett kezdő tevékenységegyed-azonosító vagy kezdő tevékenység párbeszéd egyedazonosító a(z) %s folyamatnál a _GetParam szubrutinban!',
        'Couldn\'t get Ticket for TicketID: %s in _GetParam!' => 'Nem sikerült lekérni a jegyet a(z) %s jegyazonosítóhoz a _GetParam szubrutinban!',
        'Couldn\'t determine ActivityEntityID. DynamicField or Config isn\'t set properly!' =>
            'Nem sikerült meghatározni a tevékenység egyedazonosítóját. A dinamikus mező vagy a beállítás nincs megfelelően beállítva!',
        'Process::Default%s Config Value missing!' => 'A Process::Default%s beállítás értéke hiányzik!',
        'Got no ProcessEntityID or TicketID and ActivityDialogEntityID!' =>
            'Nem kaptam folyamategyed-azonosítót vagy jegyazonosítót és tevékenység párbeszéd egyed-azonosítót!',
        'Can\'t get StartActivityDialog and StartActivityDialog for the ProcessEntityID "%s"!' =>
            'Nem lehet lekérni a kezdő tevékenység párbeszédet és a(z) „%s” folyamategyed-azonosító kezdő tevékenység párbeszédét!',
        'Can\'t get Ticket "%s"!' => 'Nem lehet lekérni a(z) „%s” jegyet!',
        'Can\'t get ProcessEntityID or ActivityEntityID for Ticket "%s"!' =>
            'Nem lehet lekérni a folyamategyed-azonosítót vagy a tevékenységegyed-azonosítót a(z) „%s” jegynél!',
        'Can\'t get Activity configuration for ActivityEntityID "%s"!' =>
            'Nem lehet lekérni a tevékenység beállítását a(z) „%s” tevékenységegyed-azonosítónál!',
        'Can\'t get ActivityDialog configuration for ActivityDialogEntityID "%s"!' =>
            'Nem lehet lekérni a tevékenység párbeszéd beállítását a(z) „%s” tevékenység párbeszéd egyed-azonosítójánál!',
        'Can\'t get data for Field "%s" of ActivityDialog "%s"!' => 'Nem lehet lekérni az adatokat a(z) „%s” mezőnél, amely a(z) „%s” tevékenység párbeszédhez tartozik!',
        'PendingTime can just be used if State or StateID is configured for the same ActivityDialog. ActivityDialog: %s!' =>
            'A várakozási idő csak akkor használható, ha az állapot vagy az állapotazonosító be van állítva ugyanannál a tevékenység párbeszédnél. Tevékenység párbeszéd: %s!',
        'Pending Date' => 'Várakozás dátuma',
        'for pending* states' => 'függőben* állapotokhoz',
        'ActivityDialogEntityID missing!' => 'A tevékenység párbeszéd egyedazonosító hiányzik!',
        'Couldn\'t get Config for ActivityDialogEntityID "%s"!' => 'Nem sikerült lekérni a beállítást a tevékenység párbeszéd egyedazonosítóhoz: „%s”!',
        'Couldn\'t use CustomerID as an invisible field.' => 'Nem sikerült az ügyfél-azonosítót láthatatlan mezőként használni.',
        'Missing ProcessEntityID, check your ActivityDialogHeader.tt!' =>
            'Hiányzó folyamategyed-azonosító, ellenőrizze az ActivityDialogHeader.tt fájlt!',
        'No StartActivityDialog or StartActivityDialog for Process "%s" configured!' =>
            'Nincs beállítva kezdő tevékenység párbeszéd vagy a(z) „%s” folyamat kezdő tevékenység párbeszéde!',
        'Couldn\'t create ticket for Process with ProcessEntityID "%s"!' =>
            'Nem sikerült jegyet létrehozni a(z) „%s” folyamategyed-azonosítóval rendelkező folyamatnál!',
        'Couldn\'t set ProcessEntityID "%s" on TicketID "%s"!' => 'Nem sikerült beállítani a(z) „%s” folyamategyed-azonosítót a következő jegyazonosítónál: „%s”!',
        'Couldn\'t set ActivityEntityID "%s" on TicketID "%s"!' => 'Nem sikerült beállítani a(z) „%s” tevékenységegyed-azonosítót a következő jegyazonosítónál: „%s”!',
        'Could not store ActivityDialog, invalid TicketID: %s!' => 'Nem sikerült eltárolni a tevékenység párbeszédet, érvénytelen jegyazonosító: %s!',
        'Invalid TicketID: %s!' => 'Érvénytelen jegyazonosító: %s!',
        'Missing ActivityEntityID in Ticket %s!' => 'Hiányzó tevékenységegyed-azonosító a következő jegyben: %s!',
        'This step does not belong anymore the current activity in process for Ticket %s!' =>
            '',
        'Another user changed this ticket in the meantime. Please close this window and reload the ticket.' =>
            '',
        'Missing ProcessEntityID in Ticket %s!' => 'Hiányzó folyamategyed-azonosító a következő jegyben: %s!',
        'Could not set DynamicField value for %s of Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Nem sikerült beállítani a(z) %s dinamikus mező értékét, amely a(z) „%s” azonosítójú jegyhez tartozik a(z) „%s” tevékenység párbeszédben!',
        'Could not set PendingTime for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Nem sikerült beállítani a várakozási időt a(z) „%s” azonosítójú jegynél a(z) „%s” tevékenység párbeszédben!',
        'Wrong ActivityDialog Field config: %s can\'t be Display => 1 / Show field (Please change its configuration to be Display => 0 / Do not show field or Display => 2 / Show field as mandatory)!' =>
            'Hibás tevékenység párbeszéd mezőbeállítás: %s, nem lehet „Display => 1 / mező megjelenítése” (változtassa meg a beállítását, hogy „Display => 0 / ne jelenítse meg a mezőt” vagy „Display => 2 / mező megjelenítése kötelezőként” legyen)!',
        'Could not set %s for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Nem sikerült a(z) %s beállítása a(z) „%s” azonosítójú jegynél a(z) „%s” tevékenység párbeszédben!',
        'Default Config for Process::Default%s missing!' => 'A Process::Default%s alapértelmezett beállítása hiányzik!',
        'Default Config for Process::Default%s invalid!' => 'A Process::Default%s alapértelmezett beállítása érvénytelen!',

        # Perl Module: Kernel/Modules/AgentTicketSearch.pm
        'Untitled' => 'Névtelen',
        'Customer Name' => 'Ügyfél neve',
        'Invalid Users' => 'Érvénytelen felhasználók',
        'CSV' => 'CSV',
        'Excel' => 'Excel',

        # Perl Module: Kernel/Modules/AgentTicketService.pm
        'Feature not enabled!' => 'A szolgáltatás nincs engedélyezve!',

        # Perl Module: Kernel/Modules/AgentTicketWatcher.pm
        'Feature is not active' => 'A szolgáltatás nem aktív',

        # Perl Module: Kernel/Modules/AgentTicketZoom.pm
        'Link Deleted' => 'Kapcsolat törölve',
        'Ticket Locked' => 'Jegy zárolva',
        'Pending Time Set' => 'Várakozási idő beállítva',
        'Dynamic Field Updated' => 'Dinamikus mező frissítve',
        'Outgoing Email (internal)' => 'Kimenő e-mail (belső)',
        'Ticket Created' => 'Jegy létrehozva',
        'Type Updated' => 'Típus frissítve',
        'Escalation Update Time In Effect' => 'Eszkaláció frissítési idő van hatályban',
        'Escalation Update Time Stopped' => 'Eszkaláció frissítési ideje leállítva',
        'Escalation First Response Time Stopped' => 'Eszkaláció első válaszideje leállítva',
        'Customer Updated' => 'Ügyfél frissítve',
        'Internal Chat' => 'Belső csevegés',
        'Automatic Follow-Up Sent' => 'Automatikus követés elküldve',
        'Note Added' => 'Jegyzet hozzáadva',
        'Note Added (Customer)' => 'Jegyzet hozzáadva (ügyfél)',
        'State Updated' => 'Állapot frissítve',
        'Outgoing Answer' => 'Kimenő válasz',
        'Service Updated' => 'Szolgáltatás frissítve',
        'Link Added' => 'Kapcsolat hozzáadva',
        'Incoming Customer Email' => 'Bejövő ügyfél e-mail',
        'Incoming Web Request' => 'Bejövő webkérés',
        'Priority Updated' => 'Prioritás frissítve',
        'Ticket Unlocked' => 'Jegy feloldva',
        'Outgoing Email' => 'Kimenő e-mail',
        'Title Updated' => 'Cím frissítve',
        'Ticket Merged' => 'Jegy egyesítve',
        'Outgoing Phone Call' => 'Kimenő telefonhívás',
        'Forwarded Message' => 'Továbbított üzenet',
        'Removed User Subscription' => 'Felhasználói feliratkozás eltávolítva',
        'Time Accounted' => 'Idő elszámolva',
        'Incoming Phone Call' => 'Bejövő telefonhívás',
        'System Request.' => 'Rendszer kérés.',
        'Incoming Follow-Up' => 'Bejövő követés',
        'Automatic Reply Sent' => 'Automatikus válasz elküldve',
        'Automatic Reject Sent' => 'Automatikus elutasítás elküldve',
        'Escalation Solution Time In Effect' => 'Eszkaláció megoldási idő van hatályban',
        'Escalation Solution Time Stopped' => 'Eszkaláció megoldási ideje leállítva',
        'Escalation Response Time In Effect' => 'Eszkaláció válaszidő van hatályban',
        'Escalation Response Time Stopped' => 'Eszkaláció válaszideje leállítva',
        'SLA Updated' => 'SLA frissítve',
        'Queue Updated' => 'Várólista frissítve',
        'External Chat' => 'Külső csevegés',
        'Queue Changed' => 'Várólista módosítva',
        'Notification Was Sent' => 'Értesítés elküldve',
        'We are sorry, you do not have permissions anymore to access this ticket in its current state.' =>
            'Sajnáljuk, de már nincs jogosultsága a jegyhez történő hozzáféréshez annak jelenlegi állapotában.',
        'Can\'t get for ArticleID %s!' => 'Nem lehet lekérni a(z) %s bejegyzés-azonosítóhoz!',
        'Article filter settings were saved.' => 'A bejegyzésszűrő beállításai mentésre kerültek.',
        'Event type filter settings were saved.' => 'Az eseménytípus-szűrő beállításai mentésre kerültek.',
        'Need ArticleID!' => 'Bejegyzésazonosító szükséges!',
        'Invalid ArticleID!' => 'Érvénytelen bejegyzésazonosító!',
        'Offline' => 'Kilépett',
        'User is currently offline.' => 'A felhasználó jelenleg nincs kapcsolatban.',
        'User is currently active.' => 'A felhasználó jelenleg aktív.',
        'Away' => 'Távol',
        'User was inactive for a while.' => 'A felhasználó inaktív volt egy ideig.',
        'Unavailable' => 'Nem érhető el',
        'User set their status to unavailable.' => 'A felhasználó elérhetetlenre állította az állapotát.',
        'Fields with no group' => 'Csoport nélküli mezők',
        'View the source for this Article' => 'Forrás megtekintése ennél a bejegyzésnél',

        # Perl Module: Kernel/Modules/CustomerTicketAttachment.pm
        'FileID and ArticleID are needed!' => 'Fájlazonosító és bejegyzésazonosító szükséges!',
        'No TicketID for ArticleID (%s)!' => 'Nincs jegyazonosító a bejegyzésazonosítóhoz (%s)!',
        'No such attachment (%s)!' => 'Nincs ilyen melléklet (%s)!',

        # Perl Module: Kernel/Modules/CustomerTicketMessage.pm
        'Check SysConfig setting for %s::QueueDefault.' => 'Rendszerbeállítás ellenőrzése ennél: %s::QueueDefault.',
        'Check SysConfig setting for %s::TicketTypeDefault.' => 'Rendszerbeállítás ellenőrzése ennél: %s::TicketTypeDefault.',

        # Perl Module: Kernel/Modules/CustomerTicketOverview.pm
        'Need CustomerID!' => 'Ügyfél-azonosító szükséges!',
        'My Tickets' => 'Saját jegyek',
        'Company Tickets' => 'Vállalati jegyek',
        'Untitled!' => 'Névtelen!',

        # Perl Module: Kernel/Modules/CustomerTicketSearch.pm
        'Please remove the following words because they cannot be used for the search:' =>
            'Távolítsa el a következő szavakat, mert azok nem használhatók a keresésnél:',

        # Perl Module: Kernel/Modules/CustomerTicketZoom.pm
        'Can\'t reopen ticket, not possible in this queue!' => 'Nem lehet újranyitni a jegyet, mert ez nem lehetséges ebben a várólistában!',
        'Create a new ticket!' => 'Hozzon létre új jegyet!',

        # Perl Module: Kernel/Modules/Installer.pm
        'Directory "%s" doesn\'t exist!' => 'A(z) „%s” könyvtár nem létezik!',
        'Configure "Home" in Kernel/Config.pm first!' => 'Először állítsa be a „Home” értékét a Kernel/Config.pm fájlban!',
        'File "%s/Kernel/Config.pm" not found!' => 'A(z) „%s/Kernel/Config.pm” fájl nem található!',
        'Directory "%s" not found!' => 'A(z) „%s” könyvtár nem található!',
        'Kernel/Config.pm isn\'t writable!' => 'A Kernel/Config.pm nem írható!',
        'If you want to use the installer, set the Kernel/Config.pm writable for the webserver user!' =>
            'Ha használni szeretné a telepítőt, akkor állítsa írhatóra a Kernel/Config.pm fájlt a webkiszolgáló felhasználójának!',
        'Unknown Check!' => 'Ismeretlen ellenőrzés!',
        'The check "%s" doesn\'t exist!' => 'A(z) „%s” ellenőrzés nem létezik!',
        'Database %s' => '%s adatbázis',
        'Configure MySQL' => '',
        'Configure PostgreSQL' => '',
        'Configure Oracle' => '',
        'Unknown database type "%s".' => 'Ismeretlen adatbázistípus: „%s”.',
        'Please go back.' => 'Lépjen vissza.',
        'Install OTRS - Error' => 'Az OTRS telepítése - hiba',
        'File "%s/%s.xml" not found!' => 'A(z) „%s/%s.xml” fájl nem található!',
        'Contact your Admin!' => 'Vegye fel a kapcsolatot a rendszergazdával!',
        'Syslog' => '',
        'Can\'t write Config file!' => 'Nem lehet írni a beállítófájlt!',
        'Unknown Subaction %s!' => 'Ismeretlen alművelet: %s!',
        'Can\'t connect to database, Perl module DBD::%s not installed!' =>
            'Nem lehet kapcsolódni az adatbázishoz, a DBD::%s Perl-modul nincs telepítve!',
        'Can\'t connect to database, read comment!' => 'Nem lehet kapcsolódni az adatbázishoz, olvassa el a megjegyzést!',
        'Error: Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Hiba: Győződjön meg arról, hogy az adatbázisa elfogad-e %s MB méretűnél nagyobb csomagot (jelenleg csak legfeljebb %s MB méretű csomagot fogad el). A hibák elkerülése érdekében alkalmazkodjon az adatbázisa max_allowed_packet beállításához.',
        'Error: Please set the value for innodb_log_file_size on your database to at least %s MB (current: %s MB, recommended: %s MB). For more information, please have a look at %s.' =>
            'Hiba: Állítsa be az adatbázison az innodb_log_file_size értékét legalább %s MB méretűre (jelenleg: %s MB, ajánlott: %s MB). További információkért nézze meg a következőt: %s.',

        # Perl Module: Kernel/Modules/PublicRepository.pm
        'Need config Package::RepositoryAccessRegExp' => 'A Package::RepositoryAccessRegExp beállítás szükséges',
        'Authentication failed from %s!' => 'Sikertelen hitelesítés innen: %s!',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/PGP.pm
        'Sent message crypted to recipient!' => 'Titkosított üzenet elküldve a címzetteknek!',
        '"PGP SIGNED MESSAGE" header found, but invalid!' => 'A „PGP SIGNED MESSAGE” fejléc megtalálható, de érvénytelen!',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/SMIME.pm
        '"S/MIME SIGNED MESSAGE" header found, but invalid!' => 'Az „S/MIME SIGNED MESSAGE” fejléc megtalálható, de érvénytelen!',
        'Ticket decrypted before' => 'A jegy korábban visszafejtésre került',
        'Impossible to decrypt: private key for email was not found!' => 'Lehetetlen visszafejteni: nem található személyes kulcs az e-mailhez!',
        'Successful decryption' => 'Sikeres visszafejtés',

        # Perl Module: Kernel/Output/HTML/Dashboard/EventsTicketCalendar.pm
        'The start time of a ticket has been set after the end time!' => 'Egy jegy kezdési ideje a befejezési ideje után lett beállítva!',

        # Perl Module: Kernel/Output/HTML/Dashboard/News.pm
        'Can\'t connect to OTRS News server!' => 'Nem lehet kapcsolódni az OTRS hírek kiszolgálójához!',
        'Can\'t get OTRS News from server!' => 'Nem lehet lekérni az OTRS híreket a kiszolgálóról!',

        # Perl Module: Kernel/Output/HTML/Dashboard/ProductNotify.pm
        'Can\'t connect to Product News server!' => 'Nem lehet kapcsolódni a termékhírek kiszolgálójához!',
        'Can\'t get Product News from server!' => 'Nem lehet lekérni a termékhíreket a kiszolgálóról!',

        # Perl Module: Kernel/Output/HTML/Dashboard/RSS.pm
        'Can\'t connect to %s!' => 'Nem lehet kapcsolódni ehhez: %s!',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketGeneric.pm
        'sorted ascending' => 'növekvően rendezve',
        'sorted descending' => 'csökkenően rendezve',
        'filter not active' => 'a szűrő nem aktív',
        'filter active' => 'a szűrő aktív',
        'This ticket has no title or subject' => 'Ennek a jegynek nincs címe vagy tárgya',

        # Perl Module: Kernel/Output/HTML/Layout.pm
        'We are sorry, you do not have permissions anymore to access this ticket in its current state. You can take one of the following actions:' =>
            'Sajnáljuk, de már nincs jogosultsága a jegyhez történő hozzáféréshez annak jelenlegi állapotában. A következő műveletek egyikét választhatja:',
        'No Permission' => 'Nincs jogosultság',

        # Perl Module: Kernel/Output/HTML/Layout/LinkObject.pm
        'Linked as' => 'Összekapcsolva mint',
        'Search Result' => 'Keresési eredmény',

        # Perl Module: Kernel/Output/HTML/LinkObject/Ticket.pm
        'Archive search' => 'Archívum keresés',

        # Perl Module: Kernel/Output/HTML/Notification/AgentOTRSBusiness.pm
        '%s Upgrade to %s now! %s' => '%s Frissítés erre most: %s! %s',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerSystemMaintenanceCheck.pm
        'A system maintenance period will start at: ' => 'Egy rendszerkarbantartás időszak fog kezdődni ekkor: ',

        # Perl Module: Kernel/Output/HTML/Preferences/Language.pm
        '(in process)' => '(folyamatban)',

        # Perl Module: Kernel/Output/HTML/Preferences/NotificationEvent.pm
        'Please make sure you\'ve chosen at least one transport method for mandatory notifications.' =>
            'Győződjön meg arról, hogy kiválasztott-e legalább egy átviteli módszert a kötelező értesítésekhez.',

        # Perl Module: Kernel/Output/HTML/Preferences/OutOfOffice.pm
        'Please specify an end date that is after the start date.' => 'Olyan befejezési dátumot adjon meg, amely a kezdődátum után van.',

        # Perl Module: Kernel/Output/HTML/Preferences/Password.pm
        'Please supply your new password!' => 'Adja meg az új jelszavát!',

        # Perl Module: Kernel/Output/HTML/Statistics/View.pm
        'No (not supported)' => 'Nincs (nem támogatott)',
        'No past complete or the current+upcoming complete relative time value selected.' =>
            'Nincs már teljes vagy a jelenlegi+közelgő teljes relatív időérték kiválasztva.',
        'The selected time period is larger than the allowed time period.' =>
            'A kiválasztott időszak nagyobb a megengedett időszaknál.',
        'No time scale value available for the current selected time scale value on the X axis.' =>
            'Nincs elérhető időskála érték a jelenleg kiválasztott időskála értékhez az X-tengelyen.',
        'The selected date is not valid.' => 'A kiválasztott dátum nem érvényes.',
        'The selected end time is before the start time.' => 'A kiválasztott befejezési idő a kezdési idő előtt van.',
        'There is something wrong with your time selection.' => 'Valami baj van az időkiválasztással.',
        'Please select only one element or allow modification at stat generation time.' =>
            'Csak egy elemet válasszon, vagy engedélyezze a módosítást a statisztika előállításakor.',
        'Please select at least one value of this field or allow modification at stat generation time.' =>
            'Ennek a mezőnek legalább egy értékét válassza ki, vagy engedélyezze a módosítást a statisztika előállításakor.',
        'Please select one element for the X-axis.' => 'Válasszon egy elemet az X-tengelyhez.',
        'You can only use one time element for the Y axis.' => 'Csak egy időelemet használhat az Y-tengelynél.',
        'You can only use one or two elements for the Y axis.' => 'Csak egy vagy két elemet használhat az Y-tengelynél.',
        'Please select at least one value of this field.' => 'Válasszon legalább egy értéket ebből a mezőből.',
        'Please provide a value or allow modification at stat generation time.' =>
            'Adjon meg egy értéket, vagy engedélyezze a módosítást a statisztika előállításakor.',
        'Please select a time scale.' => 'Válasszon egy időskálát.',
        'Your reporting time interval is too small, please use a larger time scale.' =>
            'A jelentési időintervallum túl kicsi, használjon nagyobb időskálát.',
        'Please remove the following words because they cannot be used for the ticket restrictions: %s.' =>
            'Távolítsa el a következő szavakat, mert azok nem használhatók a jegykorlátozásoknál: %s.',

        # Perl Module: Kernel/Output/HTML/TicketOverviewMenu/Sort.pm
        'Order by' => 'Rendezés',

        # Perl Module: Kernel/System/AuthSession.pm
        'You have exceeded the number of concurrent agents - contact sales@otrs.com.' =>
            'Túllépte az egyidejű ügyintézők számát - vegye fel a kapcsolatot velünk a sales@otrs.com e-mail címen.',
        'Please note that the session limit is almost reached.' => 'Ne feledje, hogy a munkamenet-korlátot majdnem elérte.',
        'Login rejected! You have exceeded the maximum number of concurrent Agents! Contact sales@otrs.com immediately!' =>
            'Belépés elutasítva! Túllépte az egyidejű ügyintézők számát! Azonnal vegye fel a kapcsolatot velünk a sales@otrs.com e-mail címen!',
        'Session per user limit reached!' => 'A felhasználónkénti munkamenetkorlát elérve!',

        # Perl Module: Kernel/System/Console/Command/Dev/Tools/Config2Docbook.pm
        'Configuration Options Reference' => 'Beállítási lehetőségek hivatkozása',
        'This setting can not be changed.' => 'Ez a beállítás nem változtatható meg.',
        'This setting is not active by default.' => 'Ez a beállítás alapértelmezetten nincs bekapcsolva.',
        'This setting can not be deactivated.' => 'Ez a beállítás nem kapcsolható ki.',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseText.pm
        'e.g. Text or Te*t' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/Checkbox.pm
        'Ignore this field.' => '',

        # Perl Module: Kernel/System/Package.pm
        'not installed' => 'nincs telepítve',
        'File is not installed!' => 'A fájl nincs telepítve!',
        'File is different!' => 'A fájl eltérő!',
        'Can\'t read file!' => 'Nem olvasható a fájl!',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process/State.pm
        'Inactive' => 'Inaktív',
        'FadeAway' => 'Kivezetve',

        # Perl Module: Kernel/System/Registration.pm
        'Can\'t get Token from sever' => 'Nem lehet lekérni a tokent a kiszolgálóról',

        # Perl Module: Kernel/System/Stats.pm
        'Sum' => 'Összesen',

        # Perl Module: Kernel/System/Stats/Dynamic/Ticket.pm
        'State Type' => 'Állapot típusa',
        'Created Priority' => 'Létrehozott prioritás',
        'Created State' => 'Létrehozott állapot',
        'Create Time' => 'Létrehozás ideje',
        'Close Time' => 'Lezárás ideje',
        'Escalation - First Response Time' => 'Eszkaláció - első válaszidő',
        'Escalation - Update Time' => 'Eszkaláció - frissítési idő',
        'Escalation - Solution Time' => 'Eszkaláció - megoldási idő',
        'Agent/Owner' => 'Ügyintéző/Tulajdonos',
        'Created by Agent/Owner' => 'Létrehozta: ügyintéző/tulajdonos',
        'CustomerUserLogin' => 'Ügyfél-felhasználó bejelentkezőnév',
        'CustomerUserLogin (complex search)' => 'Ügyfél-felhasználó belépés (összetett keresés)',
        'CustomerUserLogin (exact match)' => 'Ügyfél-felhasználó belépés (pontos egyezés)',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketAccountedTime.pm
        'Evaluation by' => 'Kiértékelés',
        'Ticket/Article Accounted Time' => 'Jegy/Bejegyzés elszámolt idő',
        'Ticket Create Time' => 'Jegy létrehozásának ideje',
        'Ticket Close Time' => 'Jegy lezárásának ideje',
        'Accounted time by Agent' => 'Ügyintéző által elszámolt idő',
        'Total Time' => 'Teljes idő',
        'Ticket Average' => 'Jegy átlag',
        'Ticket Min Time' => 'Jegy legkisebb ideje',
        'Ticket Max Time' => 'Jegy legnagyobb ideje',
        'Number of Tickets' => 'Jegyek száma',
        'Article Average' => 'Bejegyzés átlag',
        'Article Min Time' => 'Bejegyzés legkisebb ideje',
        'Article Max Time' => 'Bejegyzés legnagyobb ideje',
        'Number of Articles' => 'Bejegyzések száma',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketList.pm
        'unlimited' => 'korlátlan',
        'ascending' => 'növekvő',
        'descending' => 'csökkenő',
        'Attributes to be printed' => 'Nyomtatandó jellemzők',
        'Sort sequence' => 'Rendezési sorrend',
        'State Historic' => 'Történelmi állapot',
        'State Type Historic' => 'Történelmi állapottípus',
        'Historic Time Range' => 'Történelmi időtartomány',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketSolutionResponseTime.pm
        'Solution Average' => 'Megoldás átlaga',
        'Solution Min Time' => 'Megoldás legkisebb ideje',
        'Solution Max Time' => 'Megoldás legnagyobb ideje',
        'Solution Average (affected by escalation configuration)' => 'Megoldás átlaga (az eszkalációs beállítás által érintett)',
        'Solution Min Time (affected by escalation configuration)' => 'Megoldás legkisebb ideje (az eszkalációs beállítás által érintett)',
        'Solution Max Time (affected by escalation configuration)' => 'Megoldás legnagyobb ideje (az eszkalációs beállítás által érintett)',
        'Solution Working Time Average (affected by escalation configuration)' =>
            'Megoldás munkaidejének átlaga (az eszkalációs beállítás által érintett)',
        'Solution Min Working Time (affected by escalation configuration)' =>
            'Megoldás legkisebb munkaideje (az eszkalációs beállítás által érintett)',
        'Solution Max Working Time (affected by escalation configuration)' =>
            'Megoldás legnagyobb munkaideje (az eszkalációs beállítás által érintett)',
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
        'Number of Tickets (affected by escalation configuration)' => 'Jegyek száma (az eszkalációs beállítás által érintett)',

        # Perl Module: Kernel/System/Stats/Static/StateAction.pm
        'Days' => 'Napok',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/TablePresence.pm
        'Table Presence' => 'Tábla jelenlét',
        'Internal Error: Could not open file.' => 'Belső hiba: Nem sikerült megnyitni a fájlt.',
        'Table Check' => 'Táblaellenőrzés',
        'Internal Error: Could not read file.' => 'Belső hiba: Nem sikerült olvasni a fájlt.',
        'Tables found which are not present in the database.' => 'Olyan táblák találhatók, amelyek nincsenek az adatbázisban.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Size.pm
        'Database Size' => 'Adatbázisméret',
        'Could not determine database size.' => 'Nem sikerült meghatározni az adatbázis méretét.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Version.pm
        'Database Version' => 'Adatbázis-verzió',
        'Could not determine database version.' => 'Nem sikerült meghatározni az adatbázis verzióját.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Charset.pm
        'Client Connection Charset' => 'Kliens kapcsolat karakterkészlete',
        'Setting character_set_client needs to be utf8.' => 'A character_set_client beállításnak utf8 értékűnek kell lennie.',
        'Server Database Charset' => 'Kiszolgáló adatbázis karakterkészlete',
        'Setting character_set_database needs to be UNICODE or UTF8.' => 'A character_set_database beállításnak UNICODE vagy UTF8 értékűnek kell lennie.',
        'Table Charset' => 'Tábla karakterkészlete',
        'There were tables found which do not have utf8 as charset.' => 'Olyan táblák találhatók, amelyek nem utf8 karakterkészletűek.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InnoDBLogFileSize.pm
        'InnoDB Log File Size' => 'InnoDB naplófájl méret',
        'The setting innodb_log_file_size must be at least 256 MB.' => 'Az innodb_log_file_size beállításnak legalább 256 MB értékűnek kell lennie.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/MaxAllowedPacket.pm
        'Maximum Query Size' => 'Legnagyobb lekérdezési méret',
        'The setting \'max_allowed_packet\' must be higher than 20 MB.' =>
            'A „max_allowed_packet” beállításnak nagyobbnak kell lennie mint 20 MB.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Performance.pm
        'Query Cache Size' => 'Lekérdezési gyorsítótár méret',
        'The setting \'query_cache_size\' should be used (higher than 10 MB but not more than 512 MB).' =>
            'A „query_cache_size” beállítást használni kell (nagyobb mint 10 MB, de nem több mint 512 MB).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/StorageEngine.pm
        'Default Storage Engine' => 'Alapértelmezett tárolómotor',
        'Table Storage Engine' => 'Táblatároló-motor',
        'Tables with a different storage engine than the default engine were found.' =>
            'Az alapértelmezett motortól eltérő motorral rendelkező táblák találhatók.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Version.pm
        'MySQL 5.x or higher is required.' => 'MySQL 5.x vagy újabb szükséges.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/NLS.pm
        'NLS_LANG Setting' => 'NLS_LANG beállítás',
        'NLS_LANG must be set to al32utf8 (e.g. GERMAN_GERMANY.AL32UTF8).' =>
            'Az NLS_LANG értékét al32utf8 értékre kell állítani (például: GERMAN_GERMANY.AL32UTF8).',
        'NLS_DATE_FORMAT Setting' => 'NLS_DATE_FORMAT beállítás',
        'NLS_DATE_FORMAT must be set to \'YYYY-MM-DD HH24:MI:SS\'.' => 'Az NLS_DATE_FORMAT értékét „YYYY-MM-DD HH24:MI:SS” értékre kell állítani.',
        'NLS_DATE_FORMAT Setting SQL Check' => 'NLS_DATE_FORMAT beállítás SQL ellenőrzés',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Charset.pm
        'Setting client_encoding needs to be UNICODE or UTF8.' => 'A client_encoding beállításnak UNICODE vagy UTF8 értékűnek kell lennie.',
        'Setting server_encoding needs to be UNICODE or UTF8.' => 'A server_encoding beállításnak UNICODE vagy UTF8 értékűnek kell lennie.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/DateStyle.pm
        'Date Format' => 'Dátumformátum',
        'Setting DateStyle needs to be ISO.' => 'A DateStyle beállításnak ISO értékűnek kell lennie.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Version.pm
        'PostgreSQL 8.x or higher is required.' => 'PostgreSQL 8.x vagy újabb szükséges.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskPartitionOTRS.pm
        'OTRS Disk Partition' => 'OTRS lemezpartíció',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpace.pm
        'Disk Usage' => 'Lemezhasználat',
        'The partition where OTRS is located is almost full.' => 'Az OTRS-t tartalmazó partíció majdnem betelt.',
        'The partition where OTRS is located has no disk space problems.' =>
            'Az OTRS-t tartalmazó partíciónak nincs tárhely problémája.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpacePartitions.pm
        'Disk Partitions Usage' => 'Lemezpartíciók használata',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Distribution.pm
        'Distribution' => 'Disztribúció',
        'Could not determine distribution.' => 'Nem sikerült meghatározni a disztribúciót.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/KernelVersion.pm
        'Kernel Version' => 'Kernel verzió',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Load.pm
        'System Load' => 'Rendszerterhelés',
        'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).' =>
            'A rendszerterhelésnek legfeljebb annyinak kell lennie, ahány processzorral a rendszer rendelkezik (például 8-as vagy kisebb terhelés egy 8 processzoros rendszeren rendben van).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModules.pm
        'Perl Modules' => 'Perl modulok',
        'Not all required Perl modules are correctly installed.' => 'Nincs minden szükséges Perm modul megfelelően telepítve.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Swap.pm
        'Free Swap Space (%)' => 'Szabad lapozófájl méret (%)',
        'No swap enabled.' => 'Nincs lapozófájl engedélyezve.',
        'Used Swap Space (MB)' => 'Használt lapozófájl méret (%)',
        'There should be more than 60% free swap space.' => '60%-nál több szabad lapozófájlnak kellene lennie.',
        'There should be no more than 200 MB swap space used.' => '200 MB-nál nem kellene több lapozófájlt használni.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ConfigSettings.pm
        'OTRS' => 'OTRS',
        'Config Settings' => 'Beállítások konfigurálása',
        'Could not determine value.' => 'Nem sikerült meghatározni az értéket.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DaemonRunning.pm
        'Daemon' => 'Démon',
        'Daemon is running.' => 'A démon fut.',
        'Daemon is not running.' => 'A démon nem fut.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DatabaseRecords.pm
        'Database Records' => 'Adatbázis rekordok',
        'Tickets' => 'Jegyek',
        'Ticket History Entries' => 'Jegy előzmény bejegyzések',
        'Articles' => 'Bejegyzések',
        'Attachments (DB, Without HTML)' => 'Mellékletek (DB, HTML nélkül)',
        'Customers With At Least One Ticket' => 'Legalább egy jeggyel rendelkező ügyfelek',
        'Dynamic Field Values' => 'Dinamikus mező értékek',
        'Invalid Dynamic Fields' => 'Érvénytelen dinamikus mezők',
        'Invalid Dynamic Field Values' => 'Érvénytelen dinamikus mező értékek',
        'GenericInterface Webservices' => 'Általános felület webszolgáltatások',
        'Process Tickets' => 'Folyamatjegyek',
        'Months Between First And Last Ticket' => 'Az első és az utolsó jegy közti hónapok',
        'Tickets Per Month (avg)' => 'Jegyek havonta (átlag)',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultSOAPUser.pm
        'Default SOAP Username And Password' => 'Alapértelmezett SOAP felhasználónév és jelszó',
        'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.' =>
            'Biztonsági kockázat: a SOAP::User és a SOAP::Password alapértelmezett beállításait használja. Változtassa meg.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/DefaultUser.pm
        'Default Admin Password' => 'Alapértelmezett adminisztrátor jelszó',
        'Security risk: the agent account root@localhost still has the default password. Please change it or invalidate the account.' =>
            'Biztonsági kockázat: a root@localhost ügyintéző fióknak még mindig az alapértelmezett jelszava van. Változtassa meg, vagy érvénytelenítse a fiókot.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/ErrorLog.pm
        'Error Log' => 'Hibanapló',
        'There are error reports in your system log.' => 'Hibajelentések vannak a rendszernaplóban.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FQDN.pm
        'FQDN (domain name)' => 'FQDN (tartománynév)',
        'Please configure your FQDN setting.' => 'Állítsa be az FQDN beállítását.',
        'Domain Name' => 'Tartománynév',
        'Your FQDN setting is invalid.' => 'Az FQDN beállítás érvénytelen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/FileSystemWritable.pm
        'File System Writable' => 'Fájlrendszer írhatóság',
        'The file system on your OTRS partition is not writable.' => 'Az OTRS partíció fájlrendszere nem írható.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageDeployment.pm
        'Package Installation Status' => 'Csomagtelepítési állapot',
        'Some packages have locally modified files.' => 'Néhány csomag helyileg módosított fájlokkal rendelkezik.',
        'Some packages are not correctly installed.' => 'Néhány csomag nincs helyesen telepítve.',
        'Package Verification Status' => 'Csomagellenőrzési állapot',
        'Some packages are not verified by the OTRS Group! It is recommended not to use this packages.' =>
            'Néhány csomagot nem ellenőrzött az OTRS csoport! Nem javasolt a csomagok használata.',
        'Package Framework Version Status' => 'Csomag keretrendszer verziójának állapota',
        'Some packages are not allowed for the current framework version.' =>
            'Néhány csomag nem engedélyezett a jelenlegi keretrendszer verzióhoz.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/PackageList.pm
        'Package List' => 'Csomaglista',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SessionConfigSettings.pm
        'Session Config Settings' => 'Munkamenet-konfigurációs beállítások',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SpoolMails.pm
        'Spooled Emails' => 'Várakozási sorba helyezett levelek',
        'There are emails in var/spool that OTRS could not process.' => 'Olyan levelek találhatók a var/spool mappában, amelyeket az OTRS nem tudott feldolgozni.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/SystemID.pm
        'Your SystemID setting is invalid, it should only contain digits.' =>
            'A rendszer-azonosító beállítás érvénytelen, csak számjegyeket tartalmazhat.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/DefaultType.pm
        'Default Ticket Type' => 'Alapértelmezett jegytípus',
        'The configured default ticket type is invalid or missing. Please change the setting Ticket::Type::Default and select a valid ticket type.' =>
            'A beállított alapértelmezett jegytípus érvénytelen vagy hiányzik. Változtassa meg a Ticket::Type::Default beállításait, és válasszon egy érvényes jegytípust.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/IndexModule.pm
        'Ticket Index Module' => 'Jegy indexelő modul',
        'You have more than 60,000 tickets and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'Több mint 60.000 jegye van, ezért a StaticDB háttérprogramot kellene használnia. További információkért nézze meg az adminisztrátori kézikönyvet (Teljesítmény finomhangolás).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/InvalidUsersWithLockedTickets.pm
        'Invalid Users with Locked Tickets' => 'Érvénytelen felhasználók zárolt jegyekkel',
        'There are invalid users with locked tickets.' => 'Zárolt jegyekkel rendelkező érvénytelen felhasználók vannak.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/OpenTickets.pm
        'Open Tickets' => 'Nyitott jegyek',
        'You should not have more than 8,000 open tickets in your system.' =>
            'Nem kellene 8.000 nyitott jegynél többel rendelkeznie a rendszeren.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/SearchIndexModule.pm
        'Ticket Search Index Module' => 'Jegykeresés indexelő modul',
        'You have more than 50,000 articles and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'Több mint 50.000 bejegyzése van, ezért a StaticDB háttérprogramot kellene használnia. További információkért nézze meg az adminisztrátori kézikönyvet (Teljesítmény finomhangolás).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/Ticket/StaticDBOrphanedRecords.pm
        'Orphaned Records In ticket_lock_index Table' => 'Elárvult rekordok a ticket_lock_index táblában',
        'Table ticket_lock_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'A ticket_lock_index tábla elárvult rekordokat tartalmaz. Futtassa a bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" parancsot a StaticDB index tisztításához.',
        'Orphaned Records In ticket_index Table' => 'Elárvult rekordok a ticket_index táblában',
        'Table ticket_index contains orphaned records. Please run bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'A ticket_index tábla elárvult rekordokat tartalmaz. Futtassa a bin/otrs.Console.pl "Maint::Ticket::QueueIndexCleanup" parancsot a StaticDB index tisztításához.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OTRS/TimeSettings.pm
        'Time Settings' => 'Időbeállítások',
        'Server time zone' => 'Kiszolgáló időzónája',
        'Computed server time offset' => 'Számított kiszolgáló időeltolás',
        'OTRS TimeZone setting (global time offset)' => 'OTRS TimeZone beállítás (globális időeltolás)',
        'TimeZone may only be activated for systems running in UTC.' => 'A TimeZone csak UTC-ben futó rendszereknél kapcsolható be.',
        'OTRS TimeZoneUser setting (per-user time zone support)' => 'OTRS TimeZoneUser beállítás (felhasználónkénti időzóna támogatás)',
        'TimeZoneUser may only be activated for systems running in UTC that don\'t have an OTRS TimeZone set.' =>
            'A TimeZoneUser csak olyan UTC-ben futó rendszereknél kapcsolható be, amelyeknek nincs OTRS TimeZone beállításuk.',
        'OTRS TimeZone setting for calendar ' => 'OTRS TimeZone beállítás a naptárhoz: ',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/LoadedModules.pm
        'Webserver' => 'Webkiszolgáló',
        'Loaded Apache Modules' => 'Betöltött Apache modulok',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/MPMModel.pm
        'MPM model' => 'MPM modell',
        'OTRS requires apache to be run with the \'prefork\' MPM model.' =>
            'Az OTRS az apache „prefork” MPM modellel való futtatását igényli.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/Performance.pm
        'CGI Accelerator Usage' => 'CGI gyorsító használat',
        'You should use FastCGI or mod_perl to increase your performance.' =>
            'A FastCGI vagy a mod_perl használatára lenne szüksége a teljesítmény növeléséhez.',
        'mod_deflate Usage' => 'mod_deflate használat',
        'Please install mod_deflate to improve GUI speed.' => 'Telepítse a mod_deflate csomagot a felhasználói felület sebességének növeléséhez.',
        'mod_filter Usage' => 'mod_filter használat',
        'Please install mod_filter if mod_deflate is used.' => 'Telepítse a mod_filter modult, ha a mod_deflate használatban van.',
        'mod_headers Usage' => 'mod_headers használat',
        'Please install mod_headers to improve GUI speed.' => 'Telepítse a mod_headers csomagot a felhasználói felület sebességének növeléséhez.',
        'Apache::Reload Usage' => 'Apache::Reload használat',
        'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler to prevent web server restarts when installing and upgrading modules.' =>
            'Az Apache::Reload vagy az Apache2::Reload használata kellene PerlModule és PerlInitHandler modulként a webkiszolgáló újraindításának megakadályozásához, amikor modulokat telepít és frissít.',
        'Apache2::DBI Usage' => 'Apache2::DBI használat',
        'Apache2::DBI should be used to get a better performance  with pre-established database connections.' =>
            'Az Apache2::DBI használata kellene az előre kiépített adatbázis-kapcsolatokkal való jobb teljesítmény eléréséhez.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/EnvironmentVariables.pm
        'Environment Variables' => 'Környezeti változók',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/InternalWebRequest.pm
        'Support Data Collection' => 'Támogatási adatgyűjtés',
        'Support data could not be collected from the web server.' => 'A támogatási adatokat nem sikerült begyűjteni a webkiszolgálóról.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Version.pm
        'Webserver Version' => 'Webkiszolgáló verzió',
        'Could not determine webserver version.' => 'Nem sikerült meghatározni a webkiszolgáló verzióját.',

        # Perl Module: Kernel/System/SupportDataCollector/PluginAsynchronous/OTRS/ConcurrentUsers.pm
        'Concurrent Users Details' => 'Egyidejű felhasználók részletei',
        'Concurrent Users' => 'Egyidejű felhasználók',

        # Perl Module: Kernel/System/SupportDataCollector/PluginBase.pm
        'Unknown' => 'Ismeretlen',
        'OK' => 'OK',
        'Problem' => 'Probléma',

        # Perl Module: Kernel/System/Ticket.pm
        'Reset of unlock time.' => 'Feloldási idő visszaállítása.',

        # Perl Module: Kernel/System/Ticket/Event/NotificationEvent/Transport/Email.pm
        'PGP sign only' => 'Csak PGP aláírás',
        'PGP encrypt only' => 'Csak PGP titkosítás',
        'PGP sign and encrypt' => 'PGP aláírás és titkosítás',
        'SMIME sign only' => 'Csak S/MIME aláírás',
        'SMIME encrypt only' => 'Csak S/MIME titkosítás',
        'SMIME sign and encrypt' => 'S/MIME aláírás és titkosítás',
        'PGP and SMIME not enabled.' => 'A PGP és az S/MIME nincs engedélyezve.',
        'Skip notification delivery' => 'Értesítés-kézbesítés kihagyása',
        'Send unsigned notification' => 'Aláíratlan értesítés küldése',
        'Send unencrypted notification' => 'Titkosítatlan értesítés küldése',

        # Perl Module: Kernel/System/Web/InterfaceAgent.pm
        'Panic, user authenticated but no user data can be found in OTRS DB!! Perhaps the user is invalid.' =>
            'Pánik, a felhasználó hitelesítette magát, de nem találhatók felhasználói adatok az OTRS adatbázisában! Talán a felhasználó érvénytelen.',
        'Can`t remove SessionID.' => 'Nem lehet eltávolítani a munkamenet-azonosítót.',
        'Logout successful.' => 'Sikeres kilépés.',
        'Panic! Invalid Session!!!' => 'Pánik! Érvénytelen munkamenet!!!',
        'No Permission to use this frontend module!' => 'Nincs jogosultsága ezen előtétprogram-modul használatához!',

        # Perl Module: Kernel/System/Web/InterfaceCustomer.pm
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact the administrator.' =>
            'A hitelesítés sikerült, de nem található ügyfélrekord az ügyfél háttérprogramban. Vegye fel a kapcsolatot a rendszergazdával.',
        'Reset password unsuccessful. Please contact the administrator.' =>
            'A jelszó visszaállítása sikertelen. Vegye fel a kapcsolatot a rendszergazdával.',
        'Added via Customer Panel (%s)' => 'Hozzáadva az ügyfélpanelen keresztül (%s)',
        'Customer user can\'t be added!' => 'Az ügyfél-felhasználót nem lehet hozzáadni!',
        'Can\'t send account info!' => 'Nem lehet elküldeni a fiókinformációkat!',

        # Perl Module: Kernel/System/Web/InterfaceInstaller.pm
        'SecureMode active!' => 'Biztonságos mód bekapcsolva!',
        'If you want to re-run the Installer, disable the SecureMode in the SysConfig.' =>
            'Ha újra szeretné futtatni a telepítőt, akkor tiltsa le a biztonságos módot a rendszerbeállításokban.',
        'Action "%s" not found!' => 'A(z) „%s” művelet nem található!',

        # Database XML Definition: scripts/database/otrs-initial_insert.xml
        'Group for default access.' => 'Csoport az alapértelmezett hozzáféréshez.',
        'Group of all administrators.' => 'Az összes adminisztrátor csoportja.',
        'Group for statistics access.' => 'Csoport a statisztikák hozzáféréshez.',
        'All new state types (default: viewable).' => 'Minden új állapottípus (alapértelmezett: megtekinthető).',
        'All open state types (default: viewable).' => 'Minden nyitott állapottípus (alapértelmezett: megtekinthető).',
        'All closed state types (default: not viewable).' => 'Minden lezárt állapottípus (alapértelmezett: nem megtekinthető).',
        'All \'pending reminder\' state types (default: viewable).' => 'Minden „emlékeztető függőben” állapottípus (alapértelmezett: megtekinthető).',
        'All \'pending auto *\' state types (default: viewable).' => 'Minden „automatikus * függőben” állapottípus (alapértelmezett: megtekinthető).',
        'All \'removed\' state types (default: not viewable).' => 'Minden „eltávolított” állapottípus (alapértelmezett: nem megtekinthető).',
        'State type for merged tickets (default: not viewable).' => 'Állapottípus az egyesített jegyeknél (alapértelmezett: nem megtekinthető).',
        'New ticket created by customer.' => 'Az ügyfél által létrehozott új jegy.',
        'Ticket is closed successful.' => 'A jegy sikeresen lezárva.',
        'Ticket is closed unsuccessful.' => 'A jegy sikertelenül lezárva.',
        'Open tickets.' => 'Nyitott jegyek.',
        'Customer removed ticket.' => 'Az ügyfél eltávolította a jegyet.',
        'Ticket is pending for agent reminder.' => 'A jegy ügyintézői emlékeztetőre vár.',
        'Ticket is pending for automatic close.' => 'A jegy automatikus lezárásra vár.',
        'State for merged tickets.' => 'Állapot az egyesített jegyeknél.',
        'system standard salutation (en)' => 'a rendszer szabványos megszólítása (en)',
        'Standard Salutation.' => 'Szabványos megszólítás.',
        'system standard signature (en)' => 'a rendszer szabványos aláírása (en)',
        'Standard Signature.' => 'Szabványos aláírás.',
        'Standard Address.' => 'Szabványos cím.',
        'Follow-ups for closed tickets are possible. Ticket will be reopened.' =>
            'Követések lehetségesek a lezárt jegyeknél. A jegy újra lesz nyitva.',
        'Follow-ups for closed tickets are not possible. No new ticket will be created.' =>
            'Követések nem lehetségesek a lezárt jegyeknél. Nem lesz új jegy létrehozva.',
        'new ticket' => 'új jegy',
        'Follow-ups for closed tickets are not possible. A new ticket will be created..' =>
            'Követések nem lehetségesek a lezárt jegyeknél. Egy új jegy lesz létrehozva.',
        'Postmaster queue.' => 'Levelezési várólista.',
        'All default incoming tickets.' => 'Minden alapértelmezetten bejövő jegy.',
        'All junk tickets.' => 'Minden szemét jegy.',
        'All misc tickets.' => 'Minden egyéb jegy.',
        'Automatic reply which will be sent out after a new ticket has been created.' =>
            'Automatikus válasz, amely akkor lesz kiküldve, miután egy új jegyet létrehoztak.',
        'Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is "reject").' =>
            'Automatikus elutasítás, amely akkor lesz kiküldve, miután egy követést elutasítottak (abban az esetben, ha a várólista követési beállítása „elutasítás”).',
        'Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is "possible").' =>
            'Automatikus beállítás, amely akkor lesz kiküldve, miután egy követést fogadtak egy jegyhez (abban az esetben, ha a várólista követési beállítása „lehetséges”).',
        'Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is "new ticket").' =>
            'Automatikus válasz, amely akkor lesz kiküldve, miután egy követést elutasítottak és egy új jegyet létrehoztak (abban az esetben, ha a várólista követési beállítása „új jegy”).',
        'Auto remove will be sent out after a customer removed the request.' =>
            'Automatikus eltávolítás akkor lesz kiküldve, miután egy ügyfél eltávolította a kérést.',
        'default reply (after new ticket has been created)' => 'alapértelmezett válasz (miután egy új jegyet létrehoztak)',
        'default reject (after follow-up and rejected of a closed ticket)' =>
            'alapértelmezett elutasítás (egy lezárt jegy követése és elutasítása után)',
        'default follow-up (after a ticket follow-up has been added)' => 'alapértelmezett követés (miután egy jegy követést hozzáadtak)',
        'default reject/new ticket created (after closed follow-up with new ticket creation)' =>
            'alapértelmezett elutasítás/új jegy létrehozva (új jegy létrehozásával történő lezárt követés után)',
        'Unclassified' => 'Osztályozatlan',
        'tmp_lock' => 'átmenetileg zárolt',
        'email-notification-ext' => 'külső e-mail értesítés',
        'email-notification-int' => 'belső e-mail értesítés',
        'Ticket create notification' => 'Jegy létrehozási értesítés',
        'You will receive a notification each time a new ticket is created in one of your "My Queues" or "My Services".' =>
            'Egy értesítést fog kapni minden alkalommal, amikor egy új jegy jön létre a „Saját várólistái” vagy a „Saját szolgáltatásai” egyikében.',
        'Ticket follow-up notification (unlocked)' => 'Jegy követési értesítés (feloldott)',
        'You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your "My Queues" or "My Services".' =>
            'Egy értesítést fog kapni, ha egy ügyfél egy követést küld egy olyan feloldott jegyhez, amely a „Saját várólistáiban” vagy a „Saját szolgáltatásaiban” van.',
        'Ticket follow-up notification (locked)' => 'Jegy követési értesítés (zárolt)',
        'You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.' =>
            'Egy értesítést fog kapni, ha egy ügyfél egy követést küld egy olyan zárolt jegyhez, amelynek Ön a jegytulajdonosa vagy a felelőse.',
        'You will receive a notification as soon as a ticket owned by you is automatically unlocked.' =>
            'Egy értesítést fog kapni, amint az Ön tulajdonában lévő jegy automatikusan feloldásra kerül.',
        'Ticket owner update notification' => 'Jegytulajdonos frissítési értesítés',
        'Ticket responsible update notification' => 'Jegyfelelős frissítési értesítés',
        'Ticket new note notification' => 'Új jegyjegyzet értesítés',
        'Ticket queue update notification' => 'Jegyvárólista frissítési értesítés',
        'You will receive a notification if a ticket is moved into one of your "My Queues".' =>
            'Egy értesítést fog kapni, ha egy jegyet a „Saját várólistái” egyikébe helyeznek át.',
        'Ticket pending reminder notification (locked)' => 'Jegy emlékeztető függőben értesítés (zárolt)',
        'Ticket pending reminder notification (unlocked)' => 'Jegy emlékeztető függőben értesítés (feloldott)',
        'Ticket escalation notification' => 'Jegyeszkaláció értesítés',
        'Ticket escalation warning notification' => 'Jegyeszkaláció figyelmeztetési értesítés',
        'Ticket service update notification' => 'Jegyszolgáltatás frissítési értesítés',
        'You will receive a notification if a ticket\'s service is changed to one of your "My Services".' =>
            'Egy értesítést fog kapni, ha egy jegy szolgáltatását a „Saját szolgáltatásai” egyikére változtatják meg.',

        # SysConfig
        '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
' => '
Tisztelt Ügyfelünk!

Sajnos nem sikerült érvényes jegyszámot felismernünk
a tárgyban, ezért ezt a levelet nem lehet feldolgozni.

Kérjük, hogy hozzon létre egy új jegyet az ügyfélpanelen.

Köszönjük a segítségét!

Az Ön segélyszolgálat csapata
',
        ' (work units)' => ' (munkaegységek)',
        '"%s" notification was sent to "%s" by "%s".' => '„%s” értesítést küldött neki: „%s” a következő: „%s”.',
        '"Slim" skin which tries to save screen space for power users.' =>
            '„Karcsú” felszín, amely képernyőhelyet próbál megspórolni a haladó felhasználóknak.',
        '%s' => '%s',
        '%s time unit(s) accounted. Now total %s time unit(s).' => '%s időegység elszámolva. Most összesen %s időegység.',
        '(UserLogin) Firstname Lastname' => '(Felhasználónév) Keresztnév Vezetéknév',
        '(UserLogin) Lastname Firstname' => '(Felhasználónév) Vezetéknév Keresztnév',
        '(UserLogin) Lastname, Firstname' => '(Felhasználónév) Vezetéknév, Keresztnév',
        '*** out of office until %s (%s d left) ***' => '*** irodán kívül eddig: %s (%s nap van hátra) ***',
        '100 (Expert)' => '100 (Szakértő)',
        '200 (Advanced)' => '200 (Haladó)',
        '300 (Beginner)' => '300 (Kezdő)',
        'A TicketWatcher Module.' => 'Egy jegymegfigyelő modul.',
        'A Website' => 'Egy weboldal',
        'A list of dynamic fields that are merged into the main ticket during a merge operation. Only dynamic fields that are empty in the main ticket will be set.' =>
            'Azon dinamikus mezők listája, amelyek az egyesítési művelet során egyesítve lesznek a fő jeggyel. A fő jegyen belül csak az üres dinamikus mezők lesznek beállítva.',
        'A picture' => 'Egy kép',
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'Egy ACL modul, amely csak akkor engedélyezi a szülőjegyek lezárását, ha már minden gyermekjegyük le van zárva (az „Állapot” jelzi, hogy mely állapotok nem érhetők el a szülőjegyhez, amíg minden gyermekjegy le nincs zárva).',
        'Access Control Lists (ACL)' => 'Hozzáférés-vezérlési listák (ACL)',
        'AccountedTime' => 'Elszámolt idő',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'A legrégebbi jegyet tartalmazó várólista villogási mechanizmusát aktiválja.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Elfelejtett jelszó szolgáltatását aktivál az ügyintézőknek az ügyintézői felületen.',
        'Activates lost password feature for customers.' => 'Elfelejtett jelszó szolgáltatást aktivál az ügyfeleknek.',
        'Activates support for customer groups.' => 'Az ügyfélcsoportok támogatását aktiválja.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'A nagyítás nézeten lévő bejegyzésszűrőt aktiválja, amely megadja, hogy mely bejegyzések legyenek láthatók.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Az elérhető témákat aktiválja a rendszeren. Az 1 érték aktívat, a 0 inaktívat jelent.',
        'Activates the ticket archive system search in the customer interface.' =>
            'A jegyarchiváló rendszer keresését aktiválja az ügyfél felületen.',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'A jegyarchiváló rendszert aktiválja, hogy felgyorsítsa a rendszert néhány jegy áthelyezésével a napi áttekintőből.',
        'Activates time accounting.' => 'Az időelszámolást aktiválja.',
        'ActivityID' => 'Tevékenység-azonosító',
        'Add an inbound phone call to this ticket' => 'Bejövő telefonhívás hozzáadása ehhez a jegyhez',
        'Add an outbound phone call to this ticket' => 'Kimenő telefonhívás hozzáadása ehhez a jegyhez',
        'Added email. %s' => 'E-mail hozzáadva. %s',
        'Added link to ticket "%s".' => 'Hivatkozás hozzáadva a következő jegyhez: „%s”.',
        'Added note (%s)' => 'Jegyzet hozzáadva (%s)',
        'Added subscription for user "%s".' => 'Feliratkozás hozzáadva a következő felhasználóhoz: „%s”.',
        'Address book of CustomerUser sources.' => 'Az ügyfél-felhasználó források címjegyzéke.',
        'Adds a suffix with the actual year and month to the OTRS log file. A logfile for every month will be created.' =>
            'Az aktuális évet és hónapot tartalmazó előtagot ad az OTRS naplófájlhoz. Minden hónapban új naplófájl lesz létrehozva.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface. The customers email address won\'t be added if the article type is email-internal.' =>
            'Hozzáadja az ügyfelek e-mail címeit a címzettekhez az ügyintézői felület jegyválasz képernyőjén. Az ügyfelek e-mail címei nem lesznek hozzáadva, ha a bejegyzés típusa belső e-mail.',
        'Adds the one time vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Hozzáadja az egyszeri munkaszüneti napokat a jelzett naptárhoz. Egy számjegyből álló mintát használjon a számoknál 1-től 9-ig (01 - 09 helyett).',
        'Adds the one time vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Hozzáadja az egyszeri munkaszüneti napokat. Egy számjegyből álló mintát használjon a számoknál 1-től 9-ig (01 - 09 helyett).',
        'Adds the permanent vacation days for the indicated calendar. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Hozzáadja az állandó munkaszüneti napokat a jelzett naptárhoz. Egy számjegyből álló mintát használjon a számoknál 1-től 9-ig (01 - 09 helyett).',
        'Adds the permanent vacation days. Please use single digit pattern for numbers from 1 to 9 (instead of 01 - 09).' =>
            'Hozzáadja az állandó munkaszüneti napokat. Egy számjegyből álló mintát használjon a számoknál 1-től 9-ig (01 - 09 helyett).',
        'Admin Area.' => 'Adminisztrációs terület.',
        'After' => 'Ez után',
        'Agent Name' => 'Ügyintézőnév',
        'Agent Name + FromSeparator + System Address Display Name' => 'Ügyintézőnév + feladóelválasztó + rendszercím megjelenített neve',
        'Agent Preferences.' => 'Ügyintézői beállítások.',
        'Agent called customer.' => 'Ügyintéző hívta az ügyfelet.',
        'Agent interface article notification module to check PGP.' => 'Ügyintézői felület bejegyzés értesítési modul a PGP ellenőrzéséhez.',
        'Agent interface article notification module to check S/MIME.' =>
            'Ügyintézői felület bejegyzés értesítési modul az S/MIME ellenőrzéséhez.',
        'Agent interface module to access CIC search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Ügyintézői felület modul a CIC kereséshez való hozzáféréshez a navigációs sávon keresztül. A hivatkozás megjelenítéséhez vagy elrejtéséhez további hozzáférés vezérlő készíthető a „Group” kulcs és az „rw:csoport1;move_into:csoport2” értékhez hasonló tartalom használatával.',
        'Agent interface module to access fulltext search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Ügyintézői felület modul a szabad-szavas kereséshez való hozzáféréshez a navigációs sávon keresztül. A hivatkozás megjelenítéséhez vagy elrejtéséhez további hozzáférés vezérlő készíthető a „Group” kulcs és az „rw:csoport1;move_into:csoport2” értékhez hasonló tartalom használatával.',
        'Agent interface module to access search profiles via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Ügyintézői felület modul a keresési profilokhoz való hozzáféréshez a navigációs sávon keresztül. A hivatkozás megjelenítéséhez vagy elrejtéséhez további hozzáférés vezérlő készíthető a „Group” kulcs és az „rw:csoport1;move_into:csoport2” értékhez hasonló tartalom használatával.',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Ügyintézői felület modul a bejövő e-mailek ellenőrzéséhez a jegynagyítás nézeten, ha az S/MIME-kulcs elérhető és igaz.',
        'Agent interface notification module to see the number of locked tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Ügyintézői felület értesítési modul a zárolt jegyek számának megtekintéséhez. A hivatkozás megjelenítéséhez vagy elrejtéséhez további hozzáférés vezérlő készíthető a „Group” kulcs és az „rw:csoport1;move_into:csoport2” értékhez hasonló tartalom használatával.',
        'Agent interface notification module to see the number of tickets an agent is responsible for. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Ügyintézői felület értesítési modul azon jegyek számának megtekintéséhez, amelyekért egy ügyintéző felelős. A hivatkozás megjelenítéséhez vagy elrejtéséhez további hozzáférés vezérlő készíthető a „Group” kulcs és az „rw:csoport1;move_into:csoport2” értékhez hasonló tartalom használatával.',
        'Agent interface notification module to see the number of tickets in My Services. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Ügyintézői felület értesítési modul a „Saját szolgáltatásaiban” lévő jegyek számának megtekintéséhez. A hivatkozás megjelenítéséhez vagy elrejtéséhez további hozzáférés vezérlő készíthető a „Group” kulcs és az „rw:csoport1;move_into:csoport2” értékhez hasonló tartalom használatával.',
        'Agent interface notification module to see the number of watched tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Ügyintézői felület értesítési modul a megfigyelt jegyek számának megtekintéséhez. A hivatkozás megjelenítéséhez vagy elrejtéséhez további hozzáférés vezérlő készíthető a „Group” kulcs és az „rw:csoport1;move_into:csoport2” értékhez hasonló tartalom használatával.',
        'AgentCustomerSearch' => 'Ügyintézői ügyfélkeresés',
        'AgentCustomerSearch.' => 'Ügyintézői ügyfélkeresés.',
        'AgentUserSearch' => 'Ügyintézői felhasználókeresés',
        'AgentUserSearch.' => 'Ügyintézői felhasználókeresés.',
        'Agents <-> Groups' => 'Ügyintézők <-> Csoportok',
        'Agents <-> Roles' => 'Ügyintézők <-> Szerepek',
        'All customer users of a CustomerID' => 'Egy ügyfél-azonosító minden ügyfél-felhasználója',
        'Allows adding notes in the close ticket screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Lehetővé teszi jegyzetek hozzáadását az ügyintézői felület jegylezárás képernyőjén. Felülírható a Ticket::Frontend::NeedAccountedTime használatával.',
        'Allows adding notes in the ticket free text screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Lehetővé teszi jegyzetek hozzáadását az ügyintézői felület jegy szabad szöveg képernyőjén. Felülírható a Ticket::Frontend::NeedAccountedTime használatával.',
        'Allows adding notes in the ticket note screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Lehetővé teszi jegyzetek hozzáadását az ügyintézői felület jegy jegyzet képernyőjén. Felülírható a Ticket::Frontend::NeedAccountedTime használatával.',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Lehetővé teszi jegyzetek hozzáadását egy nagyított jegynek a jegy tulajdonos képernyőjén az ügyintézői felületen. Felülírható a Ticket::Frontend::NeedAccountedTime használatával.',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Lehetővé teszi jegyzetek hozzáadását egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen. Felülírható a Ticket::Frontend::NeedAccountedTime használatával.',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Lehetővé teszi jegyzetek hozzáadását egy nagyított jegynek a jegy prioritás képernyőjén az ügyintézői felületen. Felülírható a Ticket::Frontend::NeedAccountedTime használatával.',
        'Allows adding notes in the ticket responsible screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Lehetővé teszi jegyzetek hozzáadását az ügyintézői felület jegy felelős képernyőjén. Felülírható a Ticket::Frontend::NeedAccountedTime használatával.',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Lehetővé teszi az ügyintézőknek egy statisztika tengelyeinek felcserélését, ha előállítanak egyet.',
        'Allows agents to generate individual-related stats.' => 'Lehetővé teszi az ügyintézőknek egyénhez kapcsolódó statisztikák előállítását.',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Lehetővé teszi a jegy mellékleteinek böngészőben történő megjelenítése (beágyazott), vagy azok letölthetővé tétele (melléklet) közötti választást.',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Lehetővé teszi az ügyfélfelületen lévő ügyféljegyek következő válasz állapotának kiválasztását.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Lehetővé teszi az ügyfeleknek a jegy prioritásának megváltoztatását az ügyfélfelületen.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Lehetővé teszi az ügyfeleknek a jegy SLA beállítását az ügyfélfelületen.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Lehetővé teszi az ügyfeleknek a jegy prioritásának beállítását az ügyfélfelületen.',
        'Allows customers to set the ticket queue in the customer interface. If this is set to \'No\', QueueDefault should be configured.' =>
            'Lehetővé teszi az ügyfeleknek a jegy várólistájának beállítását az ügyfélfelületen. Ha ez „Nem” értékre van állítva, akkor az alapértelmezett várólista kerül beállításra.',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Lehetővé teszi az ügyfeleknek a jegy szolgáltatásának beállítását az ügyfélfelületen.',
        'Allows customers to set the ticket type in the customer interface. If this is set to \'No\', TicketTypeDefault should be configured.' =>
            'Lehetővé teszi az ügyfeleknek a jegy típusának beállítását az ügyfélfelületen. Ha ez „Nem” értékre van állítva, az alapértelmezett jegytípus kerül beállításra.',
        'Allows default services to be selected also for non existing customers.' =>
            'Lehetővé teszi az alapértelmezett szolgáltatások kiválasztását a nem létező ügyfelekhez is.',
        'Allows defining new types for ticket (if ticket type feature is enabled).' =>
            'Lehetővé teszi új típusok meghatározását a jegyekhez (ha a jegytípus szolgáltatás engedélyezve van).',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Lehetővé teszi szolgáltatások és SLA-k meghatározását a jegyekhez (például e-mail, asztali, hálózat, …), és eszkalációs jellemzőket az SLA-khoz (ha a jegy szolgáltatás/SLA funkció engedélyezve van).',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Lehetővé teszi a kiterjesztett keresési feltételeket az ügyintézői felület jegykeresésében. Ezzel a funkcióval rákereshet például a jegycímre olyan típusú feltételekkel mint „(*kulcs1*&&*kulcs2*)” vagy „(*kulcs1*||*kulcs2*)”.',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Lehetővé teszi a kiterjesztett keresési feltételeket az ügyfélfelület jegykeresésében. Ezzel a funkcióval rákereshet például a jegycímre olyan típusú feltételekkel mint „(*kulcs1*&&*kulcs2*)” vagy „(*kulcs1*||*kulcs2*)”.',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Lehetővé teszi a kiterjesztett keresési feltételeket az általános ügyintézői felület jegykeresésében. Ezzel a funkcióval rákereshet például a jegycímre olyan típusú feltételekkel mint „(*kulcs1*&&*kulcs2*)” vagy „(*kulcs1*||*kulcs2*)”.',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Lehetővé teszi a közepes formátumú jegyáttekintőt (CustomerInfo => 1 - megjeleníti az ügyfél-információkat is).',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Lehetővé teszi a kis formátumú jegyáttekintőt (CustomerInfo => 1 - megjeleníti az ügyfél-információkat is).',
        'Allows invalid agents to generate individual-related stats.' => 'Lehetővé teszi az érvénytelen ügyintézőknek egyénhez kapcsolódó statisztikák előállítását.',
        'Allows the administrators to login as other customers, via the customer user administration panel.' =>
            'Lehetővé teszi az adminisztrátoroknak, hogy más ügyfélként lépjenek be az ügyfél-felhasználó adminisztrációs panelen keresztül.',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Lehetővé teszi az adminisztrátoroknak, hogy más felhasználóként lépjenek be a felhasználók adminisztrációs paneljén keresztül.',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Lehetővé teszi új jegyállapotok beállítását az ügyintézői felület jegy áthelyezése képernyőjén.',
        'Always show RichText if available' => 'Mindig RichText szöveget jelenítsen meg, ha elérhető',
        'Arabic (Saudi Arabia)' => 'Arab (Szaúd-Arábia)',
        'Archive state changed: "%s"' => 'Az archívumállapot megváltozott: „%s”',
        'ArticleTree' => 'Bejegyzés fa',
        'Attachments <-> Templates' => 'Mellékletek <-> Sablonok',
        'Auto Responses <-> Queues' => 'Automatikus válaszok <-> Várólisták',
        'AutoFollowUp sent to "%s".' => 'Automatikus követés elküldve ide: „%s”.',
        'AutoReject sent to "%s".' => 'Automatikus elutasítás elküldve ide: „%s”.',
        'AutoReply sent to "%s".' => 'Automatikus válasz elküldve ide: „%s”.',
        'Automated line break in text messages after x number of chars.' =>
            'Automatikus sortörés a szöveges üzenetekben x karakter után.',
        'Automatically lock and set owner to current Agent after opening the move ticket screen of the agent interface.' =>
            'Automatikus zárolás és a tulajdonos beállítása az aktuális ügyintézőre az ügyintézői felület jegy áthelyezés képernyőjének megnyitása után.',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Automatikus zárolás és a tulajdonos beállítása az aktuális ügyintézőre egy tömeges művelet kiválasztása után.',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled). This will only work by manually actions of the logged in user. It does not work for automated actions e.g. GenericAgent, Postmaster and GenericInterface.' =>
            'Automatikusan beállítja a jegy tulajdonosát annak felelőseként (ha a jegyfelelős szolgáltatás engedélyezve van). Ez csak a bejelentkezett felhasználó kézi műveleteinél fog működni. Nem működik olyan automatizált műveleteknél, mint például az általános ügyintéző, a levelezés és az általános felület.',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Automatikusan beállítja a jegy felelősét (ha még nincs beállítva) az első tulajdonos-frissítés után.',
        'Balanced white skin by Felix Niklas (slim version).' => 'Kiegyenlített fehér felszín Felix Niklas-tól (karcsú változat).',
        'Balanced white skin by Felix Niklas.' => 'Kiegyenlített fehér felszín Felix Niklas-tól.',
        'Based on global RichText setting' => 'Globális RichText beállítás alapján',
        'Basic fulltext index settings. Execute "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild" in order to generate a new index.' =>
            'Alapvető szabad-szavas index beállítások. Futtassa a „bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild” parancsfájlt egy új index előállítása érdekében.',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Az összes bejövő e-mailt blokkolja, amelyeknek nincs érvényes jegyszáma a tárgyban a @example.com feladójú címmel.',
        'Bounced to "%s".' => 'Átirányítva ide: „%s”.',
        'Builds an article index right after the article\'s creation.' =>
            'Egy bejegyzésindexet épít közvetlenül a bejegyzések létrehozása után.',
        'Bulgarian' => 'Bolgár',
        'CMD example setup. Ignores emails where external CMD returns some output on STDOUT (email will be piped into STDIN of some.bin).' =>
            'PARANCS példa beállítás. Mellőzi azokat az e-maileket, ahol a külső PARANCS néhány kimenettel tér vissza a SZABVÁNYOS KIMENETEN (az e-mail át lesz irányítva a some.bin SZABVÁNYOS BEMENETÉRE).',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            'Gyorsítótárazás ideje másodpercben az ügyintéző hitelesítésénél az általános felületen.',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            'Gyorsítótárazás ideje másodpercben az ügyfél hitelesítésénél az általános felületen.',
        'Cache time in seconds for the DB ACL backend.' => 'Gyorsítótárazás ideje másodpercben a DB ACL háttérprogramnál.',
        'Cache time in seconds for the DB process backend.' => 'Gyorsítótárazás ideje másodpercben a DB folyamat háttérprogramnál.',
        'Cache time in seconds for the SSL certificate attributes.' => 'Gyorsítótárazás ideje másodpercben az SSL tanúsítvány jellemzőinél.',
        'Cache time in seconds for the ticket process navigation bar output module.' =>
            'Gyorsítótárazás ideje másodpercben a jegyfolyamat navigációs sáv kimeneti moduljánál.',
        'Cache time in seconds for the web service config backend.' => 'Gyorsítótárazás ideje másodpercben a webszolgáltatás beállításának háttérprogramjánál.',
        'Catalan' => 'Katalán',
        'Change password' => 'Jelszó megváltoztatása',
        'Change queue!' => 'Várólista módosítása',
        'Change the customer for this ticket' => 'Ügyfél módosítása ennél a jegynél',
        'Change the free fields for this ticket' => 'A szabad mezők módosítása ennél a jegynél',
        'Change the priority for this ticket' => 'Prioritás módosítása ennél a jegynél',
        'Change the responsible for this ticket' => 'Felelős módosítása ennél a jegynél',
        'Changed priority from "%s" (%s) to "%s" (%s).' => 'Prioritás módosítva erről: „%s” (%s) erre: „%s” (%s).',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Megváltoztatja a jegyek tulajdonosát mindenkire (ASP-nél hasznos). Normális esetben csak a jegy várólistájában írási-olvasási jogosultsággal rendelkező ügyintéző kerül megjelenítésre.',
        'Checkbox' => 'Jelölőnégyzet',
        'Checks if an E-Mail is a followup to an existing ticket by searching the subject for a valid ticket number.' =>
            'Azt ellenőrzi a tárgyban történő érvényes jegyszám keresésével, hogy egy e-mail egy meglévő jegy követője-e.',
        'Checks the SystemID in ticket number detection for follow-ups (use "No" if SystemID has been changed after using the system).' =>
            'Ellenőrzi a rendszer-azonosítót a jegy számának felismeréskor a követéseknél (használja a „Nem” értéket, ha a rendszer-azonosító megváltozott a rendszer használata után).',
        'Checks the availability of OTRS Business Solution™ for this system.' =>
            'Ellenőrzi az OTRS Business Solution™ elérhetőségét ennél a rendszernél.',
        'Checks the entitlement status of OTRS Business Solution™.' => 'Ellenőrzi az OTRS Business Solution™ jogosultsági állapotát.',
        'Chinese (Simplified)' => 'Kínai (egyszerűsített)',
        'Chinese (Traditional)' => 'Kínai (hagyományos)',
        'Choose for which kind of ticket changes you want to receive notifications.' =>
            'Válassza ki, hogy milyen típusú jegyváltoztatásról szeretne értesítéseket kapni.',
        'Closed tickets (customer user)' => 'Lezárt jegyek (ügyfél-felhasználó)',
        'Closed tickets (customer)' => 'Lezárt jegyek (ügyfél)',
        'Cloud Services' => 'Felhőszolgáltatások',
        'Cloud service admin module registration for the transport layer.' =>
            'Felhőszolgáltatás adminisztrációs modul regisztráció az átviteli réteghez.',
        'Collect support data for asynchronous plug-in modules.' => 'Támogatási adatok begyűjtése az aszinkron bővítmény modulokhoz.',
        'Column ticket filters for Ticket Overviews type "Small".' => 'Jegyszűrő oszlop a „Kis” jegyáttekintő típusnál.',
        'Columns that can be filtered in the escalation view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Az ügyintézői felület eszkalációs nézetében szűrhető oszlopok. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett. Megjegyzés: Csak jegyattribútumok, dinamikus mezők (DynamicField_NévX) és ügyfélattribútumok (például CustomerUserPhone, CustomerCompanyName, …) engedélyezettek.',
        'Columns that can be filtered in the locked view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Az ügyintézői felület zárolás nézetében szűrhető oszlopok. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett. Megjegyzés: Csak jegyattribútumok, dinamikus mezők (DynamicField_NévX) és ügyfélattribútumok (például CustomerUserPhone, CustomerCompanyName, …) engedélyezettek.',
        'Columns that can be filtered in the queue view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Az ügyintézői felület várólista nézetében szűrhető oszlopok. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett. Megjegyzés: Csak jegyattribútumok, dinamikus mezők (DynamicField_NévX) és ügyfélattribútumok (például CustomerUserPhone, CustomerCompanyName, …) engedélyezettek.',
        'Columns that can be filtered in the responsible view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Az ügyintézői felület felelős nézetében szűrhető oszlopok. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett. Megjegyzés: Csak jegyattribútumok, dinamikus mezők (DynamicField_NévX) és ügyfélattribútumok (például CustomerUserPhone, CustomerCompanyName, …) engedélyezettek.',
        'Columns that can be filtered in the service view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Az ügyintézői felület szolgáltatás nézetében szűrhető oszlopok. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett. Megjegyzés: Csak jegyattribútumok, dinamikus mezők (DynamicField_NévX) és ügyfélattribútumok (például CustomerUserPhone, CustomerCompanyName, …) engedélyezettek.',
        'Columns that can be filtered in the status view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Az ügyintézői felület állapot nézetében szűrhető oszlopok. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett. Megjegyzés: Csak jegyattribútumok, dinamikus mezők (DynamicField_NévX) és ügyfélattribútumok (például CustomerUserPhone, CustomerCompanyName, …) engedélyezettek.',
        'Columns that can be filtered in the ticket search result view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Az ügyintézői felület jegykeresési eredmények nézetében szűrhető oszlopok. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett. Megjegyzés: Csak jegyattribútumok, dinamikus mezők (DynamicField_NévX) és ügyfélattribútumok (például CustomerUserPhone, CustomerCompanyName, …) engedélyezettek.',
        'Columns that can be filtered in the watch view of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Az ügyintézői felület megfigyelés nézetében szűrhető oszlopok. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett. Megjegyzés: Csak jegyattribútumok, dinamikus mezők (DynamicField_NévX) és ügyfélattribútumok (például CustomerUserPhone, CustomerCompanyName, …) engedélyezettek.',
        'Comment for new history entries in the customer interface.' => 'Megjegyzés az új előzmény bejegyzésekhez az ügyfélfelületen.',
        'Comment2' => 'Megjegyzés2',
        'Communication' => 'Kommunikáció',
        'Company Status' => 'Vállalat állapot',
        'Company Tickets.' => 'Vállalati jegyek.',
        'Company name which will be included in outgoing emails as an X-Header.' =>
            'Vállalat neve, amely a kimenő e-mailekbe lesz felvéve X-Header bejegyzésként.',
        'Compat module for AgentZoom to AgentTicketZoom.' => 'Kompatibilitási modul az AgentZoom részére az AgentTicketZoom modulhoz.',
        'Complex' => 'Összetett',
        'Configure Processes.' => 'Folyamatok beállítása.',
        'Configure and manage ACLs.' => 'ACL-ek beállítása és kezelése.',
        'Configure any additional readonly mirror databases that you want to use.' =>
            'Bármely további csak olvasható tükör adatbázis beállítása, amelyet használni szeretne.',
        'Configure sending of support data to OTRS Group for improved support.' =>
            'Az OTRS csoportnak történő támogatási adatok küldésének beállítása a javított támogatásért.',
        'Configure which screen should be shown after a new ticket has been created.' =>
            'Annak beállítása, hogy mely képernyő legyen megjelenítve, miután egy új jegyet létrehoztak.',
        'Configure your own log text for PGP.' => 'Saját naplószöveg beállítása a PGP-hez.',
        'Configures a default TicketDynamicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (http://otrs.github.io/doc/), chapter "Ticket Event Module".' =>
            'Beállítja az alapértelmezett jegy dinamikus mező beállítást. A „Name” a használandó dinamikus mezőt, a „Value” a beállítandó adatokat, illetve az „Event” az aktiváló eseményt határozza meg. Nézze meg a fejlesztői kézikönyv (http://otrs.github.io/doc/) „Jegyesemény modul” fejezetét.',
        'Controls how to display the ticket history entries as readable values.' =>
            'Azt szabályozza, hogy hogyan jelenjenek meg a jegy előzmény bejegyzések olvasható értékként.',
        'Controls if CustomerID is automatically copied from the sender address for unknown customers.' =>
            'Azt szabályozza, hogy az ügyfél-azonosító automatikusan át legyen-e másolva a feladó címéből az ismeretlen ügyfeleknél.',
        'Controls if CustomerID is read-only in the agent interface.' => 'Azt szabályozza, hogy az ügyfél-azonosító csak olvasható-e az ügyintézői felületen.',
        'Controls if customers have the ability to sort their tickets.' =>
            'Azt szabályozza, hogy az ügyfelek képesek legyenek-e rendezni a saját jegyeiket.',
        'Controls if more than one from entry can be set in the new phone ticket in the agent interface.' =>
            'Azt szabályozza, hogy lehessen-e egynél több bejegyzést beállítani az új telefonos jegyben az ügyintézői felületen.',
        'Controls if the admin is allowed to import a saved system configuration in SysConfig.' =>
            'Azt szabályozza, hogy az adminisztrátornak megengedett-e egy elmentett rendszerbeállítás importálása a rendszerbeállításokban.',
        'Controls if the admin is allowed to make changes to the database via AdminSelectBox.' =>
            'Azt szabályozza, hogy az adminisztrátornak megengedett-e az adatbázison módosításokat végrehajtania az adminisztrátori lekérdeződobon keresztül.',
        'Controls if the ticket and article seen flags are removed when a ticket is archived.' =>
            'Azt szabályozza, hogy a jegy és a bejegyzés látható jelzői el legyenek-e távolítva a jegy archiválásakor.',
        'Converts HTML mails into text messages.' => 'Átalakítja a HTML leveleket szöveges üzenetre.',
        'Create New process ticket.' => 'Új folyamatjegy létrehozása.',
        'Create and manage Service Level Agreements (SLAs).' => 'Szolgáltatási szint megállapodások (SLA-k) létrehozása és kezelése.',
        'Create and manage agents.' => 'Ügyintézők létrehozása és kezelése.',
        'Create and manage attachments.' => 'Mellékletek létrehozása és kezelése.',
        'Create and manage customer users.' => 'Ügyfél-felhasználók létrehozása és kezelése.',
        'Create and manage customers.' => 'Ügyfelek létrehozása és kezelése.',
        'Create and manage dynamic fields.' => 'Dinamikus mezők létrehozása és kezelése.',
        'Create and manage groups.' => 'Csoportok létrehozása és kezelése.',
        'Create and manage queues.' => 'Várólisták létrehozása és kezelése.',
        'Create and manage responses that are automatically sent.' => 'Automatikusan küldött válaszok létrehozása és kezelése.',
        'Create and manage roles.' => 'Szerepek létrehozása és kezelése.',
        'Create and manage salutations.' => 'Megszólítások létrehozása és kezelése.',
        'Create and manage services.' => 'Szolgáltatások létrehozása és kezelése.',
        'Create and manage signatures.' => 'Aláírások létrehozása és kezelése.',
        'Create and manage templates.' => 'Sablonok létrehozása és kezelése.',
        'Create and manage ticket notifications.' => 'Jegyértesítések létrehozása és kezelése.',
        'Create and manage ticket priorities.' => 'Jegyprioritások létrehozása és kezelése.',
        'Create and manage ticket states.' => 'Jegyállapotok létrehozása és kezelése.',
        'Create and manage ticket types.' => 'Jegytípusok létrehozása és kezelése.',
        'Create and manage web services.' => 'Webszolgáltatások létrehozása és kezelése.',
        'Create new Ticket.' => 'Új jegy létrehozása.',
        'Create new email ticket and send this out (outbound).' => 'Új e-mail jegy létrehozása és ennek kiküldése (kimenő).',
        'Create new email ticket.' => 'Új e-mail jegy létrehozása.',
        'Create new phone ticket (inbound).' => 'Új telefonos jegy létrehozása (bejövő).',
        'Create new phone ticket.' => 'Új telefonos jegy létrehozása.',
        'Create new process ticket.' => 'Új folyamatjegy létrehozása.',
        'Create tickets.' => 'Jegyek létrehozása.',
        'Croatian' => 'Horvát',
        'Custom RSS Feed' => 'Egyéni RSS hírforrás',
        'Custom text for the page shown to customers that have no tickets yet (if you need those text translated add them to a custom translation module).' =>
            'Egyéni szöveg arra az oldalra, amely azoknak az ügyfeleknek jelenik meg, akik még nem rendelkeznek jeggyel (ha le szeretné fordítani ezt a szöveget, akkor adja hozzá az egyéni fordítási modulhoz).',
        'Customer Administration' => 'Ügyfél adminisztráció',
        'Customer Information Center Search.' => 'Ügyfélinformációs-központ keresés.',
        'Customer Information Center.' => 'Ügyfélinformációs-központ.',
        'Customer Ticket Print Module.' => 'Ügyféljegy nyomtátás modul.',
        'Customer User <-> Groups' => 'Ügyfél-felhasználó <-> Csoportok',
        'Customer User <-> Services' => 'Ügyfél-felhasználó <-> Szolgáltatások',
        'Customer User Administration' => 'Ügyfél-felhasználó adminisztráció',
        'Customer Users' => 'Ügyfél-felhasználók',
        'Customer called us.' => 'Ügyfél hívott minket.',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Ügyfélelem (ikon), amely az ügyfél lezárt jegyeit jeleníti információs blokként. A CustomerUserLogin beállítás 1 értékkel a bejelentkezési név alapján keresi a jegyeket az ügyfél-azonosító helyett.',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Ügyfélelem (ikon), amely az ügyfél nyitott jegyeit jeleníti információs blokként. A CustomerUserLogin beállítás 1 értékkel a bejelentkezési név alapján keresi a jegyeket az ügyfél-azonosító helyett.',
        'Customer preferences.' => 'Ügyfélbeállítások.',
        'Customer request via web.' => 'Ügyfélkérés weben keresztül.',
        'Customer ticket overview' => 'Ügyféljegy-áttekintő',
        'Customer ticket search.' => 'Ügyféljegykeresés.',
        'Customer ticket zoom' => 'Ügyféljegynagyítás',
        'Customer user search' => 'Ügyfél-felhasználó keresés',
        'CustomerID search' => 'Ügyfél-azonosító keresés',
        'CustomerName' => 'Ügyfélnév',
        'CustomerUser' => 'Ügyfél-felhasználó',
        'Customers <-> Groups' => 'Ügyfelek <-> Csoportok',
        'Customizable stop words for fulltext index. These words will be removed from the search index.' =>
            'Személyre szabható kiszűrendő szavak a szabad-szavas indexnél. Ezek a szavak el lesznek távolítva a keresési indexből.',
        'Czech' => 'Cseh',
        'Danish' => 'Dán',
        'Data used to export the search result in CSV format.' => 'A keresési eredmény CSV formátumba való exportálásához használt adat.',
        'Date / Time' => 'Dátum / Idő',
        'Debug' => 'Hibakeresés',
        'Debugs the translation set. If this is set to "Yes" all strings (text) without translations are written to STDERR. This can be helpful when you are creating a new translation file. Otherwise, this option should remain set to "No".' =>
            'Hibákat keres a beállított fordításban. Ha ez „Igen” értékre van állítva, akkor minden fordítás nélküli karakterlánc (szöveg) ki lesz írva a SZABVÁNYOS HIBAKIMENETRE. Ez akkor lehet hasznos, ha új fordítási fájlt hoz létre. Egyébként ez a beállítás maradjon „Nem” értékre állítva.',
        'Default' => 'Alapértelmezett',
        'Default (Slim)' => 'Alapértelmezett (karcsú)',
        'Default ACL values for ticket actions.' => 'Alapértelmezett ACL értékek a jegyműveletekhez.',
        'Default ProcessManagement entity prefixes for entity IDs that are automatically generated.' =>
            'Alapértelmezett ProcessManagement entitás előtagok azon entitás azonosítókhoz, amelyek automatikusan lettek előállítva.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            'A jegykeresés képernyő jellemzőinél használt alapértelmezett adatok. Például: „TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;”.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            'A jegykeresés képernyő jellemzőinél használt alapértelmezett adatok. Például: „TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;”.',
        'Default display type for recipient (To,Cc) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Alapértelmezett megjelenítési típus a címzett (címzett, másolat) neveihez az ügyintézői jegynagyítás és az ügyfél jegynagyítás képernyőkön.',
        'Default display type for sender (From) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Alapértelmezett megjelenítési típus a küldő (feladó) neveihez az ügyintézői jegynagyítás és az ügyfél jegynagyítás képernyőkön.',
        'Default loop protection module.' => 'Alapértelmezett hurokvédelem modul.',
        'Default queue ID used by the system in the agent interface.' => 'A rendszer által alapértelmezetten használt várólista azonosító az ügyintézői felületen.',
        'Default skin for the agent interface (slim version).' => 'Alapértelmezett felszín az ügyintézői felülethez (karcsú változat)',
        'Default skin for the agent interface.' => 'Alapértelmezett felszín az ügyintézői felülethez.',
        'Default skin for the customer interface.' => 'Alapértelmezett felszín az ügyfélfelülethez.',
        'Default ticket ID used by the system in the agent interface.' =>
            'A rendszer által alapértelmezetten használt jegyazonosító az ügyintézői felületen.',
        'Default ticket ID used by the system in the customer interface.' =>
            'A rendszer által alapértelmezetten használt jegyazonosító az ügyfélfelületen.',
        'Default value for NameX' => 'A NameX alapértelmezett értéke',
        'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.' =>
            'Műveletek meghatározása, ahol egy beállítások gomb érhető el a kapcsolt objektumok felületi elemen (LinkObject::ViewMode = „összetett”). Ne feledje, hogy ezeknek a műveleteknek rendelkezniük kell a következő JS és CSS fájlok regisztrálásával: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Szűrő meghatározása a HTML kimenethez, hogy hivatkozást adjon egy meghatározott szöveg mögé. Ez a képelem kétfajta bevitelt tesz lehetővé. Elsőként egy kép nevét (például faq.png). Ez esetben az OTRS képútvonal lesz felhasználva. A másik lehetőség a hivatkozás beszúrása a képhez.',
        'Define a mapping between variables of the customer user data (keys) and dynamic fields of a ticket (values). The purpose is to store customer user data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the next setting below.' =>
            'Leképezés meghatározása az ügyfél-felhasználó adatainak változói (kulcsok) és a jegyek dinamikus mezői (értékek) között. A cél az ügyfél-felhasználó adatainak tárolása a jegy dinamikus mezőiben. A dinamikus mezőknek jelen kell lennie a rendszeren, és engedélyezve kell lenniük az AgentTicketFreeText számára azért, hogy az ügyintéző beállíthassa vagy frissíthesse azokat. Nem szabad engedélyezve lenniük az AgentTicketPhone, az AgentTicketEmail és az AgentTicketCustomer számára. Ha azok voltak, akkor elsőbbséget élveznek az automatikusan beállított értékekkel szemben. A leképezés használatához a következő lenti beállítást is aktiválnia kell.',
        'Define dynamic field name for end time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Dinamikus mezőnév meghatározása a befejezési időhöz. Ezt a mezőt kézzel kell hozzáadni a rendszerhez jegyként: „Dátum / Idő”, és aktiválni kell a jegylétrehozó képernyőn és/vagy bármely más jegyművelet képernyőn.',
        'Define dynamic field name for start time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Dinamikus mezőnév meghatározása a kezdési időhöz. Ezt a mezőt kézzel kell hozzáadni a rendszerhez jegyként: „Dátum / Idő”, és aktiválni kell a jegylétrehozó képernyőn és/vagy bármely más jegyművelet képernyőn.',
        'Define the max depth of queues.' => 'Várólisták legnagyobb mélységének meghatározása.',
        'Define the queue comment 2.' => 'A várólista 2. megjegyzésének meghatározása.',
        'Define the service comment 2.' => 'A szolgáltatás 2. megjegyzésének meghatározása.',
        'Define the sla comment 2.' => 'Az SLA 2. megjegyzésének meghatározása.',
        'Define the start day of the week for the date picker for the indicated calendar.' =>
            'A hét kezdőnapjának meghatározása a jelzett naptár dátumválasztójánál.',
        'Define the start day of the week for the date picker.' => 'A hét kezdőnapjának meghatározása a dátumválasztónál.',
        'Define which columns are shown in the linked tickets widget (LinkObject::ViewMode = "complex"). Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Annak meghatározása, hogy mely oszlopok legyenek láthatók a kapcsolt jegyek felületi elemen (LinkObject::ViewMode = „összetett”). Megjegyzés: csak jegyattribútumok és dinamikus mezők (DynamicField_NévX) engedélyezettek a DefaultColumns értékeinél. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett.',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Egy ügyfélelemet határoz meg, amely egy LinkedIn ikont állít elő az ügyfél információs blokk végén.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Egy ügyfélelemet határoz meg, amely egy XING ikont állít elő az ügyfél információs blokk végén.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Egy ügyfélelemet határoz meg, amely egy Google ikont állít elő az ügyfél információs blokk végén.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Egy ügyfélelemet határoz meg, amely egy Google Térkép ikont állít elő az ügyfél-információs blokk végén.',
        'Defines a default list of words, that are ignored by the spell checker.' =>
            'Egy alapértelmezett szólistát határoz meg, amely figyelmen kívül lesz hagyva helyesírás-ellenőrzéskor.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Szűrő meghatározása a HTML kimenethez, hogy hivatkozást adjon a CVE számok mögé. Ez a képelem kétfajta bevitelt tesz lehetővé. Elsőként egy kép nevét (például faq.png). Ez esetben az OTRS képútvonal lesz felhasználva. A másik lehetőség a hivatkozás beszúrása a képhez.',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Szűrő meghatározása a HTML kimenethez, hogy hivatkozást adjon az MSBulletin számok mögé. Ez a képelem kétfajta bevitelt tesz lehetővé. Elsőként egy kép nevét (például faq.png). Ez esetben az OTRS képútvonal lesz felhasználva. A másik lehetőség a hivatkozás beszúrása a képhez.',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Szűrő meghatározása a HTML kimenethez, hogy hivatkozást adjon egy meghatározott szöveg mögé. Ez a képelem kétfajta bevitelt tesz lehetővé. Elsőként egy kép nevét (például faq.png). Ez esetben az OTRS képútvonal lesz felhasználva. A másik lehetőség a hivatkozás beszúrása a képhez.',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the OTRS image path will be used. The second possiblity is to insert the link to the image.' =>
            'Szűrő meghatározása a HTML kimenethez, hogy hivatkozást adjon a bugraq számok mögé. Ez a képelem kétfajta bevitelt tesz lehetővé. Elsőként egy kép nevét (például faq.png). Ez esetben az OTRS képútvonal lesz felhasználva. A másik lehetőség a hivatkozás beszúrása a képhez.',
        'Defines a filter to collect CVE numbers from article texts in AgentTicketZoom. The results will be displayed in a meta box next to the article. Fill in URLPreview if you would like to see a preview when moving your mouse cursor above the link element. This could be the same URL as in URL, but also an alternate one. Please note that some websites deny being displayed within an iframe (e.g. Google) and thus won\'t work with the preview mode.' =>
            'Egy szűrőt határoz meg CVE számok begyűjtéséhez a bejegyzés szövegeiből az ügyintézői jegynagyításban. Az eredmények egy metadobozban lesznek megjelenítve a bejegyzés mellett. Töltse ki az URLPreview mezőt, ha egy előnézetet szeretne látni, amikor az egérkurzort a linkelem fölé viszi. Ez lehet ugyanaz az URL mint az URL mezőben van, de lehet egy másik is. Ne feledje, hogy néhány weboldal (például Google) nem hagyja, hogy egy belső kereten belül jelenítsék meg, és emiatt az nem fog működni előnézeti módban.',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            'Egy szűrőt határoz meg a bejegyzésekben lévő szöveg feldolgozásához annak érdekében, hogy kiemelje az előre meghatározott kulcsszavakat.',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            'Egy reguláris kifejezést határoz meg, amely néhány címet kizár a szintaxis-ellenőrzésből (ha a „CheckEmailAddresses” beállítás „Igen” értékre van állítva). Adjon meg egy reguláris kifejezést ebben a mezőben azokhoz az e-mail címekhez, amelyek szintaktikailag nem helyesek, de szükségesek a rendszerhez (azaz „root@localhost”).',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            'Egy reguláris kifejezést határoz meg, amely az összes olyan e-mail címet kiszűri, amely nem használható az alkalmazásban.',
        'Defines a sleep time in microseconds between tickets while they are been processed by a job.' =>
            'Egy alvási időt határoz meg ezredmásodpercben a jegyek között, miközben azokat egy feladat feldolgozza.',
        'Defines a useful module to load specific user options or to display news.' =>
            'Egy hasznos modult határoz meg egy megadott felhasználó beállításainak betöltéséhez, vagy a hírek megjelenítéséhez.',
        'Defines all the X-headers that should be scanned.' => 'Meghatározza az összes olyan X-header értéket, amelyet vizsgálni kell.',
        'Defines all the languages that are available to the application. Specify only English names of languages here.' =>
            'Meghatározza az összes olyan nyelvet, amelyek elérhetők az alkalmazásnak. A nyelveknek csak az angol neveit adja meg itt.',
        'Defines all the languages that are available to the application. Specify only native names of languages here.' =>
            'Meghatározza az összes olyan nyelvet, amelyek elérhetők az alkalmazásnak. A nyelveknek csak az eredeti neveit adja meg itt.',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            'Meghatározza a frissítési idő objektum összes paraméterét az ügyfélfelület ügyfél beállításaiban.',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            'Meghatározza a megjelenített jegyek objektum összes paraméterét az ügyfélfelület ügyfél beállításaiban.',
        'Defines all the parameters for this item in the customer preferences.' =>
            'Meghatározza ennek az elemnek az összes paraméterét az ügyfél beállításaiban.',
        'Defines all the parameters for this item in the customer preferences. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control).' =>
            'Meghatározza az összes paramétert ehhez az elemhez az ügyfél beállításaiban. A „PasswordRegExp” lehetővé teszi a jelszavak illesztését egy reguláris kifejezéssel. A „PasswordMinSize” használatával meghatározható a karakterek legkisebb száma. A megfelelő beállítás „1”-re állításával meghatározható, hogy legalább 2 kisbetűs és 2 nagybetűs karakter szükséges. A „PasswordMin2Characters” azt határozza meg, hogy a jelszónak tartalmaznia kell legalább 2 betű karaktert (állítsa 0-ra vagy 1-re). A „PasswordNeedDigit” szabályozza a legalább 1 számjegy szükségét (állítsa 0-ra vagy 1-re a szabályzáshoz).',
        'Defines all the parameters for this notification transport.' => 'Meghatározza az összes paramétert ehhez az értesítési átvitelhez.',
        'Defines all the possible stats output formats.' => 'Meghatározza az összes lehetséges statisztikai kimeneti formátumot.',
        'Defines an alternate URL, where the login link refers to.' => 'Egy alternatív URL-t határoz meg, amelyre a bejelentkezési hivatkozás mutat.',
        'Defines an alternate URL, where the logout link refers to.' => 'Egy alternatív URL-t határoz meg, amelyre a kijelentkezési hivatkozás mutat.',
        'Defines an alternate login URL for the customer panel..' => 'Egy alternatív bejelentkezési URL-t határoz meg az ügyfélpanelhez.',
        'Defines an alternate logout URL for the customer panel.' => 'Egy alternatív kijelentkezési URL-t határoz meg az ügyfélpanelhez.',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').' =>
            'Egy külső hivatkozást határoz meg az ügyfél adatbázisára (például „http://yourhost/customer.php?CID=[% Data.CustomerID %]” vagy „”).',
        'Defines from which ticket attributes the agent can select the result order.' =>
            'Meghatározza, hogy mely jegyjellemzőkből választhatja ki az ügyintéző az eredmény rendezését.',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'Meghatározza, hogy az e-mailek (válaszokból és e-mail jegyekből küldve) Feladó mezője hogyan nézzen ki.',
        'Defines if a pre-sorting by priority should be done in the queue view.' =>
            'Meghatározza, hogy a prioritás szerinti előrendezés legyen kész a várólista nézetben.',
        'Defines if a pre-sorting by priority should be done in the service view.' =>
            'Meghatározza, hogy a prioritás szerinti előrendezés legyen kész a szolgáltatás nézetben.',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges az ügyintézői felület jegylezárás képernyőjén (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the email outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges az ügyintézői felület e-mail kimenő képernyőjén (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges az ügyintézői felület jegyátirányítás képernyőjén (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges az ügyintézői felület jegyválasz képernyőjén (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges az ügyintézői felület jegytovábbítás képernyőjén (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges az ügyintézői felület jegy szabad szöveg képernyőjén (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges a nagyított jegynek a jegyegyesítés képernyőjén az ügyintézői felületen (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges az ügyintézői felület jegyjegyzet képernyőjén (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges a nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges a nagyított jegynek a jegyvárakozás képernyőjén az ügyintézői felületen (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges az ügyintézői felület jegy telefon bejövő képernyőjén (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges az ügyintézői felület jegy telefon kimenő képernyőjén (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges a nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges az ügyintézői felület jegyfelelős képernyőjén (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Meghatározza, hogy jegyzárolás szükséges a jegy ügyfelének módosításához az ügyintézői felületen (ha a jegy még nincs zárolva, a jegy zárolva lesz, és az aktuális ügyintéző automatikusan beállításra kerül annak tulajdonosaként).',
        'Defines if agents should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Meghatározza, hogy engedélyezni kell-e az ügyintézőknek a bejelentkezést, ha nincs megosztott titok eltárolva a beállításaikban, és következésképpen nem használnak kétlépcsős hitelesítést.',
        'Defines if composed messages have to be spell checked in the agent interface.' =>
            'Meghatározza, hogy a megírt üzeneteken helyesírás-ellenőrzést kelljen végezni az ügyintézői felületen.',
        'Defines if customers should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Meghatározza, hogy engedélyezni kell-e az ügyfeleknek a bejelentkezést, ha nincs megosztott titok eltárolva a beállításaikban, és következésképpen nem használnak kétlépcsős hitelesítést.',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.) in customer interface.' =>
            'Meghatározza, hogy a bővített módot kell használni (táblázat, csere, alsó index, felső index, beillesztés Wordből, stb. használatát engedélyezi) az ügyfélfelületen.',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.).' =>
            'Meghatározza, hogy a bővített módot kell használni (táblázat, csere, alsó index, felső index, beillesztés Wordből, stb. használatát engedélyezi).',
        'Defines if the previously valid token should be accepted for authentication. This is slightly less secure but gives users 30 seconds more time to enter their one-time password.' =>
            'Meghatározza, hogy az előző érvényes tokent el kell-e fogadni a hitelesítésnél. Ez valamivel kevésbé biztonságos, de 30 másodperccel több időt ad a felhasználóknak az egyszer használatos jelszavuk beírásához.',
        'Defines if the values for filters should be retrieved from all available tickets. If set to "Yes", only values which are actually used in any ticket will be available for filtering. Please note: The list of customers will always be retrieved like this.' =>
            'Meghatározza, hogy a szűrők értékeit le kell-e kérni az összes elérhető jegyből. Ha „Igen” értékre van állítva, akkor csak azok az értékek lesznek elérhetők a szűréshez, amelyeket ténylegesen használnak valamelyik jegyben. Ne feledje: az ügyfelek listája mindig lekérése kerül ehhez hasonlóan.',
        'Defines if time accounting is mandatory in the agent interface. If activated, a note must be entered for all ticket actions (no matter if the note itself is configured as active or is originally mandatory for the individual ticket action screen).' =>
            'Meghatározza, hogy az időelszámolás kötelező-e az ügyintézői felületen. Ha aktiválva van, akkor egy jegyzetet kell megadni minden jegyműveletnél (nem számít, hogy maga a jegyzet aktívként van-e beállítva, vagy eredetileg is kötelező az egyedüli jegyművelet képernyőnél).',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            'Meghatározza, hogy az időelszámolást be kell állítani minden jegyre a tömeges műveletben.',
        'Defines out of office message template. Two string parameters (%s) available: end date and number of days left.' =>
            'Meghatározza az irodán kívüli üzenet sablonját. Két szövegparaméter (%s) érhető el: a befejezési dátum és a hátralévő napok száma.',
        'Defines queues that\'s tickets are used for displaying as calendar events.' =>
            'Várólistákat határoz meg, amely jegyei naptárban lévő eseményekként való megjelenítéshez vannak felhasználva.',
        'Defines the HTTP hostname for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the OTRS Daemon).' =>
            'Meghatározza a HTTP gépnevet a támogatási adatok gyűjtéséhez a nyilvános „PublicSupportDataCollector” modullal (például az OTRS démonból használva).',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            'Az IP reguláris kifejezést határozza meg a helyi tárolóhoz való hozzáféréshez. Engedélyeznie kell ezt a helyi tárolóhoz való hozzáféréshez, továbbá a package::RepositoryList szükséges a távoli kiszolgálón.',
        'Defines the URL CSS path.' => 'Meghatározza az URL CSS útvonalát.',
        'Defines the URL base path of icons, CSS and Java Script.' => 'Meghatározza az URL alap útvonalát az ikonok, a CSS és a JavaScript eléréséhez.',
        'Defines the URL image path of icons for navigation.' => 'Meghatározza az URL ikonok kép útvonalát a navigációhoz.',
        'Defines the URL java script path.' => 'Meghatározza az URL JavaScript útvonalát.',
        'Defines the URL rich text editor path.' => 'Meghatározza az URL RichText szerkesztő útvonalát.',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            'Meghatározza egy dedikált DNS kiszolgáló címét, ha szükséges a „CheckMXRecord” keresésekhez.',
        'Defines the agent preferences key where the shared secret key is stored.' =>
            'Meghatározza azt az ügyintéző beállítási kulcsot, ahol a megosztott titok kulcs tárolva van.',
        'Defines the body text for notification mails sent to agents, about new password (after using this link the new password will be sent).' =>
            'Meghatározza az új jelszóval kapcsolatosan az ügyintézőknek küldött értesítési levelek törzsének szövegét (a hivatkozás használata után az új jelszó el lesz küldve).',
        'Defines the body text for notification mails sent to agents, with token about new requested password (after using this link the new password will be sent).' =>
            'Meghatározza a kért új jelszóval kapcsolatosan a tokennel rendelkező ügyintézőknek küldött értesítési levelek törzsének szövegét (a hivatkozás használata után az új jelszó el lesz küldve).',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            'Meghatározza az új fiókkal kapcsolatosan az ügyfeleknek küldött értesítési levelek törzsének szövegét.',
        'Defines the body text for notification mails sent to customers, about new password (after using this link the new password will be sent).' =>
            'Meghatározza az új jelszóval kapcsolatosan az ügyfeleknek küldött értesítési levelek törzsének szövegét (a hivatkozás használata után az új jelszó el lesz küldve).',
        'Defines the body text for notification mails sent to customers, with token about new requested password (after using this link the new password will be sent).' =>
            'Meghatározza a kért új jelszóval kapcsolatosan a tokennel rendelkező ügyfeleknek küldött értesítési levelek törzsének szövegét (a hivatkozás használata után az új jelszó el lesz küldve).',
        'Defines the body text for rejected emails.' => 'Meghatározza az elutasított levelek törzsének szövegét.',
        'Defines the calendar width in percent. Default is 95%.' => 'Meghatározza a naptár szélességét százalékosan. Az alapértelmezett 95%.',
        'Defines the cluster node identifier. This is only used in cluster configurations where there is more than one OTRS frontend system. Note: only values from 1 to 99 are allowed.' =>
            'Meghatározza a fürtözött rendszer csomópontjának azonosítóját. Ez csak az olyan fürtözött rendszer beállításaiban van használva, ahol egynél több OTRS előtétprogram rendszer is van. Megjegyzés: csak 1 és 99 közötti értékek engedélyezettek.',
        'Defines the column to store the keys for the preferences table.' =>
            'Meghatározza az oszlopot a kulcsok tárolásához a beállítások táblánál.',
        'Defines the config options for the autocompletion feature.' => 'Meghatározza a beállítási lehetőségeket az automatikus kiegészítés funkcióhoz.',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            'Meghatározza ennek az elemnek a beállítási paramétereit, amelyek a beállítások nézetben jelennek meg.',
        'Defines the config parameters of this item, to be shown in the preferences view. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control). \'PasswordMaxLoginFailed\' allows to set an agent to invalid-temporarily if max failed logins reached.' =>
            'Meghatározza ennek az elemnek a beállítási paramétereit a beállítások nézetben történő megjelenítéshez. A „PasswordRegExp” lehetővé teszi a jelszavak illesztését egy reguláris kifejezéssel. A „PasswordMinSize” használatával meghatározható a karakterek legkisebb száma. A megfelelő beállítás „1”-re állításával meghatározható, hogy legalább 2 kisbetűs és 2 nagybetűs karakter szükséges. A „PasswordMin2Characters” azt határozza meg, hogy a jelszónak tartalmaznia kell legalább 2 betű karaktert (állítsa 0-ra vagy 1-re). A „PasswordNeedDigit” szabályozza a legalább 1 számjegy szükségét (állítsa 0-ra vagy 1-re a szabályzáshoz). A „PasswordMaxLoginFailed” lehetővé teszi egy ügyintéző átmenetileg érvénytelenre állítását, ha a maximális sikertelen bejelentkezést elérte.',
        'Defines the config parameters of this item, to be shown in the preferences view. Take care to maintain the dictionaries installed in the system in the data section.' =>
            'Meghatározza ennek az elemnek a beállítási paramétereit, amelyek a beállítások nézetben jelennek meg. Ügyeljen a rendszerre telepített szótárak karbantartására az adatok szakaszban.',
        'Defines the connections for http/ftp, via a proxy.' => 'Meghatározza a proxyn keresztüli HTTP/FTP kapcsolatokat.',
        'Defines the customer preferences key where the shared secret key is stored.' =>
            'Meghatározza azt az ügyfél beállítási kulcsot, ahol a megosztott titok kulcs tárolva van.',
        'Defines the date input format used in forms (option or input fields).' =>
            'Meghatározza az űrlapokon használt adatok beviteli formátumát (választás vagy beviteli mező).',
        'Defines the default CSS used in rich text editors.' => 'Meghatározza a RichText szerkesztőkben használt alapértelmezett CSS-t.',
        'Defines the default auto response type of the article for this operation.' =>
            'Meghatározza a bejegyzés alapértelmezett automatikus válasz típusát ehhez a művelethez.',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            'Meghatározza egy jegyzet alapértelmezett törzsét az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at http://otrs.github.io/doc/.' =>
            'Meghatározza az ügyintézők és az ügyfelek által használt alapértelmezett előtétprogram (HTML) témáját. Ha szeretné, hozzáadhatja a saját témáját. Nézze meg a http://otrs.github.io/doc/ címen elérhető adminisztrátori kézikönyvet.',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            'Meghatározza az előtétprogram alapértelmezett nyelvét. Az összes lehetséges értéket a rendszeren lévő elérhető nyelvi fájlok határozzák meg.',
        'Defines the default history type in the customer interface.' => 'Meghatározza az alapértelmezett előzménytípust az ügyfélfelületen.',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            'Meghatározza az X-tengely jellemzőinek az alapértelmezett legnagyobb számát az időskálánál.',
        'Defines the default maximum number of statistics per page on the overview screen.' =>
            'Meghatározza a statisztikák oldalankénti alapértelmezett legnagyobb számát az áttekintő képernyőn.',
        'Defines the default next state for a ticket after customer follow-up in the customer interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát az ügyfél követése után az ügyfélfelületen.',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát egy jegyzet hozzáadása után az ügyintézői felület jegy lezárása képernyőjén.',
        'Defines the default next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát egy jegyzet hozzáadása után az ügyintézői felület tömeges jegy képernyőjén.',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát egy jegyzet hozzáadása után az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát egy jegyzet hozzáadása után az ügyintézői felület jegyjegyzet képernyőjén.',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát egy jegyzet hozzáadása után a nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát egy jegyzet hozzáadása után a nagyított jegy várakozó jegy képernyőjén az ügyintézői felületen.',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát egy jegyzet hozzáadása után a nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát egy jegyzet hozzáadása után az ügyintézői felület jegyfelelős képernyőjén.',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát az átirányítása után az ügyintézői felület jegyátirányítás képernyőjén.',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát a továbbítás után az ügyintézői felület jegytovábbítás képernyőjén.',
        'Defines the default next state of a ticket after the message has been sent, in the email outbound screen of the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát az üzenet elküldése után az ügyintézői felület e-mail kimenő képernyőjén.',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát, ha azt megírták / megválaszolták az ügyintézői felület jegyválasz képernyőjén.',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Meghatározza a telefonos jegyek alapértelmezett jegyzet törzsét az ügyintézői felület jegy telefon bejövő képernyőjén.',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Meghatározza a telefonos jegyek alapértelmezett jegyzet törzsét az ügyintézői felület jegy telefon kimenő képernyőjén.',
        'Defines the default priority of follow-up customer tickets in the ticket zoom screen in the customer interface.' =>
            'Meghatározza a követő ügyféljegyek alapértelmezett prioritását a jegynagyítás képernyőn az ügyfélfelületen.',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            'Meghatározza az új ügyféljegyek alapértelmezett prioritását az ügyfélfelületen.',
        'Defines the default priority of new tickets.' => 'Meghatározza az új jegyek alapértelmezett prioritását.',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            'Meghatározza az új ügyféljegyek alapértelmezett várólistáját az ügyfélfelületen.',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            'Meghatározza a legördülő menü alapértelmezett kijelölését a dinamikus objektumokhoz (Űrlap: közös specifikáció).',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            'Meghatározza a legördülő menü alapértelmezett kijelölését a jogosultságokhoz (Űrlap: közös specifikáció).',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            'Meghatározza a legördülő menü alapértelmezett kijelölését a statisztika formátumokhoz (Űrlap: közös specifikáció). Szúrja be a formátum kulcsot (lásd: Stats::Format).',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Meghatározza a telefonos jegyek alapértelmezett küldőtípusát az ügyintézői felület jegy telefon bejövő képernyőjén.',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Meghatározza a telefonos jegyek alapértelmezett küldőtípusát az ügyintézői felület jegy telefon kimenő képernyőjén.',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            'Meghatározza a jegyek alapértelmezett küldőtípusát az ügyfélfelület jegynagyítás képernyőjén.',
        'Defines the default shown ticket search attribute for ticket search screen (AllTickets/ArchivedTickets/NotArchivedTickets).' =>
            'Meghatározza az alapértelmezetten megjelenített jegykeresési jellemzőket a jegykeresés képernyőnél (AllTickets/ArchivedTickets/NotArchivedTickets).',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            'Meghatározza az alapértelmezetten megjelenített jegykeresési jellemzőket a jegykeresés képernyőnél.',
        'Defines the default shown ticket search attribute for ticket search screen. Example: "Key" must have the name of the Dynamic Field in this case \'X\', "Content" must have the value of the Dynamic Field depending on the Dynamic Field type,  Text: \'a text\', Dropdown: \'1\', Date/Time: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' and or \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.' =>
            'Meghatározza az alapértelmezetten megjelenített jegy keresési attribútumát a jegykeresés képernyőnél. Például: a „Kulcs” értékének jelen esetben a dinamikus mező „X” nevének kell lennie, a „Tartalom” értékének a dinamikus mező típusától függően a dinamikus mező értékének kell lennie, a szöveg: „egy szöveg”, a lenyíló: „1”, a dátum és idő: „Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;” és vagy „Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7”;.',
        'Defines the default sort criteria for all queues displayed in the queue view.' =>
            'Meghatározza az alapértelmezett rendezési feltételt a várólista nézetben megjelenített összes várólistánál.',
        'Defines the default sort criteria for all services displayed in the service view.' =>
            'Meghatározza az alapértelmezett rendezési feltételt a szolgáltatás nézetben megjelenített összes szolgáltatásnál.',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            'Meghatározza az alapértelmezett rendezési sorrendet a várólista nézetben lévő összes várólistánál a prioritás rendezés után.',
        'Defines the default sort order for all services in the service view, after priority sort.' =>
            'Meghatározza az alapértelmezett rendezési sorrendet a szolgáltatás nézetben lévő összes szolgáltatásnál a prioritás rendezés után.',
        'Defines the default spell checker dictionary.' => 'Meghatározza az alapértelmezett helyesírás-ellenőrző szótárat.',
        'Defines the default state of new customer tickets in the customer interface.' =>
            'Meghatározza az új ügyféljegyek alapértelmezett állapotát az ügyfélfelületen.',
        'Defines the default state of new tickets.' => 'Meghatározza az új jegyek alapértelmezett állapotát.',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Meghatározza a telefonos jegyek alapértelmezett tárgyát az ügyintézői felület jegy telefon bejövő képernyőjén.',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Meghatározza a telefonos jegyek alapértelmezett tárgyát az ügyintézői felület jegy telefon kimenő képernyőjén.',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            'Meghatározza egy jegyzet alapértelmezett tárgyát az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Defines the default the number of seconds (from current time) to re-schedule a generic interface failed task.' =>
            'Meghatározza az alapértelmezett másodpercek számát (a jelenlegi időtől) egy általános felület sikertelen feladatának újraütemezéséhez.',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            'Meghatározza az alapértelmezett jegyjellemzőt a jegyrendezéshez az ügyfélfelület jegykeresésében.',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            'Meghatározza az alapértelmezett jegyjellemzőt a jegyrendezéshez az ügyintézői felület eszkalációs nézetében.',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            'Meghatározza az alapértelmezett jegyjellemzőt a jegyrendezéshez az ügyintézői felület zárolt jegy nézetében.',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            'Meghatározza az alapértelmezett jegyjellemzőt a jegyrendezéshez az ügyintézői felület felelős nézetében.',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            'Meghatározza az alapértelmezett jegyjellemzőt a jegyrendezéshez az ügyintézői felület állapot nézetében.',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            'Meghatározza az alapértelmezett jegyjellemzőt a jegyrendezéshez az ügyintézői felület megfigyelés nézetében.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            'Meghatározza az alapértelmezett jegyjellemzőt az ügyintézői felület jegykeresési eredményének jegyrendezéséhez.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of this operation.' =>
            'Meghatározza az alapértelmezett jegyjellemzőt ezen művelet jegykeresési eredményének jegyrendezéséhez.',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            'Meghatározza az ügyfél/küldő alapértelmezett jegyátirányítási értesítését az ügyintézői felület jegyátirányítás képernyőjén.',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát egy telefonos jegyzet hozzáadása után az ügyintézői felület jegy telefon bejövő képernyőjén.',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Meghatározza egy jegy alapértelmezett következő állapotát egy telefonos jegyzet hozzáadása után az ügyintézői felület jegy telefon kimenő képernyőjén.',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Meghatározza az alapértelmezett jegysorrendet (a prioritás rendezés után) az ügyintézői felület eszkalációs nézetében. Fel: legrégebbi felülre. Le: legutolsó felülre.',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Meghatározza az alapértelmezett jegysorrendet (a prioritás rendezés után) az ügyintézői felület állapot nézetében. Fel: legrégebbi felülre. Le: legutolsó felülre.',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Meghatározza az alapértelmezett jegysorrendet az ügyintézői felület felelős nézetében. Fel: legrégebbi felülre. Le: legutolsó felülre.',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Meghatározza az alapértelmezett jegysorrendet az ügyintézői felület jegyzárolás nézetében. Fel: legrégebbi felülre. Le: legutolsó felülre.',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Meghatározza az alapértelmezett jegysorrendet az ügyintézői felület jegykeresési eredményében. Fel: legrégebbi felülre. Le: legutolsó felülre.',
        'Defines the default ticket order in the ticket search result of the this operation. Up: oldest on top. Down: latest on top.' =>
            'Meghatározza az alapértelmezett jegysorrendet ezen művelet jegykeresési eredményében. Fel: legrégebbi felülre. Le: legutolsó felülre.',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Meghatározza az alapértelmezett jegysorrendet az ügyintézői felület megfigyelés nézetében. Fel: legrégebbi felülre. Le: legutolsó felülre.',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            'Meghatározza egy keresési eredmény alapértelmezett jegysorrendjét az ügyfélfelületen. Fel: legrégebbi felülre. Le: legutolsó felülre.',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            'Meghatározza az alapértelmezett jegyprioritást az ügyintézői felület jegylezárás képernyőjén.',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            'Meghatározza az alapértelmezett jegyprioritást az ügyintézői felület jegy tömeges képernyőjén.',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            'Meghatározza az alapértelmezett jegyprioritást az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            'Meghatározza az alapértelmezett jegyprioritást az ügyintézői felület jegyjegyzet képernyőjén.',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza az alapértelmezett jegyprioritást egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza az alapértelmezett jegyprioritást egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen.',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza az alapértelmezett jegyprioritást egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            'Meghatározza az alapértelmezett jegyprioritást az ügyintézői felület jegyfelelős képernyőjén.',
        'Defines the default ticket type for new customer tickets in the customer interface.' =>
            'Meghatározza az alapértelmezett jegytípust az új ügyféljegyekhez az ügyfélfelületen.',
        'Defines the default ticket type.' => 'Meghatározza az alapértelmezett jegytípust.',
        'Defines the default type for article in the customer interface.' =>
            'Meghatározza a bejegyzés alapértelmezett típusát az ügyfélfelületen.',
        'Defines the default type of forwarded message in the ticket forward screen of the agent interface.' =>
            'Meghatározza a továbbított üzenet alapértelmezett típusát az ügyintézői felület jegytovábbítás képernyőjén.',
        'Defines the default type of the article for this operation.' => 'Meghatározza a bejegyzés alapértelmezett típusát ennél a műveletnél.',
        'Defines the default type of the message in the email outbound screen of the agent interface.' =>
            'Meghatározza az üzenet alapértelmezett típusát az ügyintézői felület e-mail kimenő képernyőjén.',
        'Defines the default type of the note in the close ticket screen of the agent interface.' =>
            'Meghatározza a jegyzet alapértelmezett típusát az ügyintézői felület jegylezárás képernyőjén.',
        'Defines the default type of the note in the ticket bulk screen of the agent interface.' =>
            'Meghatározza a jegyzet alapértelmezett típusát az ügyintézői felület jegy tömeges képernyőjén.',
        'Defines the default type of the note in the ticket free text screen of the agent interface.' =>
            'Meghatározza a jegyzet alapértelmezett típusát az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Defines the default type of the note in the ticket note screen of the agent interface.' =>
            'Meghatározza a jegyzet alapértelmezett típusát az ügyintézői felület jegyjegyzet képernyőjén.',
        'Defines the default type of the note in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza a jegyzet alapértelmezett típusát egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Defines the default type of the note in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza a jegyzet alapértelmezett típusát egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen.',
        'Defines the default type of the note in the ticket phone inbound screen of the agent interface.' =>
            'Meghatározza a jegyzet alapértelmezett típusát az ügyintézői felület jegy telefon bejövő képernyőjén.',
        'Defines the default type of the note in the ticket phone outbound screen of the agent interface.' =>
            'Meghatározza a jegyzet alapértelmezett típusát az ügyintézői felület jegy telefon kimenő képernyőjén.',
        'Defines the default type of the note in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza a jegyzet alapértelmezett típusát egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Defines the default type of the note in the ticket responsible screen of the agent interface.' =>
            'Meghatározza a jegyzet alapértelmezett típusát az ügyintézői felület jegyfelelős képernyőjén.',
        'Defines the default type of the note in the ticket zoom screen of the customer interface.' =>
            'Meghatározza a jegyzet alapértelmezett típusát az ügyfélfelület jegynagyítás képernyőjén.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            'Meghatározza az alapértelmezetten használt előtétprogram-modult, ha nincs művelet paraméter megadva az URL-ben az ügyintézői felületen.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            'Meghatározza az alapértelmezetten használt előtétprogram-modult, ha nincs művelet paraméter megadva az URL-ben az ügyfélfelületen.',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            'Meghatározza a nyilvános előtétprogram művelet paraméterének alapértelmezett értékét. Ezt a művelet paramétert használják a rendszer parancsfájljaiban.',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            'Meghatározza egy jegy alapértelmezett megtekinthető küldő típusait (alapértelmezett: ügyfél).',
        'Defines the dynamic fields that are used for displaying on calendar events.' =>
            'Meghatározza azokat a dinamikus mezőket, amelyeket a naptárban lévő események megjelenítésénél használnak.',
        'Defines the fall-back path to open fetchmail binary. Note: The name of the binary needs to be \'fetchmail\', if it is different please use a symbolic link.' =>
            'Meghatározza a tartalék útvonalat a fetchmail bináris megnyitásához. Megjegyzés: a bináris neve csak „fetchmail” lehet, ha ettől eltérő, akkor használjon szimbolikus linket.',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            'Meghatározza azokat a szűrőket, amelyek feldolgozzák a bejegyzésekben lévő szöveget az URL-ek kiemelése érdekében.',
        'Defines the format of responses in the ticket compose screen of the agent interface ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] is only realname of From).' =>
            'Meghatározza a válaszok formátumát az ügyintézői felület jegyválasz képernyőjén ([% Data.OrigFrom | html %] = feladó 1:1, [% Data.OrigFromName | html %] csak a feladó valódi neve).',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Meghatározza a rendszer teljes képzésű tartománynevét. Ezt a beállítást az OTRS_CONFIG_FQDN változójaként használják, amely az alkalmazás által használt üzenetküldés összes űrlapján megtalálható a jegyekre mutató hivatkozások készítéséhez a rendszeren belül.',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every user for these groups).' =>
            'Meghatározza azokat a csoportokat, amelyekbe minden ügyfél-felhasználó be fog kerülni (ha a CustomerGroupSupport engedélyezve van, és nem szeretne minden felhasználót kezelni ezeknél a csoportoknál).',
        'Defines the height for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Meghatározza a RichText szerkesztő komponens magasságát ennél a képernyőnél. Szám (képpont) vagy százalék (relatív) értéket adjon meg.',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Meghatározza a RichText szerkesztő komponens magasságát. Szám (képpont) vagy százalék (relatív) értéket adjon meg.',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények megjegyzést a jegylezárás képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények megjegyzést az e-mail jegy képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények megjegyzést a telefonos jegy képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            'Meghatározza az előzmények megjegyzést a jegy szabad szöveg képernyő művelethez, amelyet a jegy előzményeinél szoktak használni.',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények megjegyzést a jegyjegyzet képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények megjegyzést a jegytulajdonos képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények megjegyzést a várakozó jegy képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények megjegyzést a jegy telefon bejövő képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények megjegyzést a jegy telefon kimenő képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények megjegyzést a jegy prioritás képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények megjegyzést a jegyfelelős képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Meghatározza az előzmények megjegyzést a jegynagyítás művelethez, amelyet a jegy előzményeinél szoktak használni az ügyfélfelületen.',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények megjegyzést ehhez a művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények típusát a jegylezárás képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények típusát az e-mail jegy képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények típusát a telefonos jegy képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            'Meghatározza az előzmények típusát a jegy szabad szöveg képernyő művelethez, amelyet a jegy előzményeinél szoktak használni.',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények típusát a jegyjegyzet képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények típusát a jegytulajdonos képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények típusát a várakozó jegy képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények típusát a jegy telefon bejövő képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények típusát a jegy telefon kimenő képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények típusát a jegy prioritás képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények típusát a jegy felelős képernyő művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Meghatározza az előzmények típusát a jegynagyítás művelethez, amelyet a jegy előzményeinél szoktak használni az ügyfélfelületen.',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            'Meghatározza az előzmények típusát ehhez a művelethez, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            'Meghatározza a jelzett naptár óráit és hétköznapjait a munkaidő számításához.',
        'Defines the hours and week days to count the working time.' => 'Meghatározza az órákat és a hétköznapokat a munkaidő számításához.',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            'Meghatározza a Kernel::Modules::AgentInfo modullal ellenőrzendő kulcsot. Ha ez a felhasználói beállítás kulcs igaz, az üzenetet elfogadta a rendszer.',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            'Meghatározza a CustomerAccept által ellenőrzendő kulcsot. Ha ez a felhasználói beállítás kulcs igaz, akkor az üzenetet elfogadta a rendszer.',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Meghatározza a „Normál” típusú hivatkozást. Ha a forrás neve és a cél neve ugyanazt az értéket tartalmazza, az eredményül kapott hivatkozás nem irányított. Egyébként az eredmény egy irányított hivatkozás.',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Meghatározza a „Szülő-gyermek” típusú hivatkozást. Ha a forrás neve és a cél neve ugyanazt az értéket tartalmazza, az eredményül kapott hivatkozás nem irányított. Egyébként az eredmény egy irányított hivatkozás.',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            'Meghatározza a hivatkozástípus csoportokat. Ugyanazon csoport hivatkozás típusai kioltják egymást. Példa: ha az A jegy „Normál” hivatkozásként kapcsolódik a B jegyhez, akkor ezeket a jegyeket nem lehet emellett „Szülő-gyermek” kapcsolat hivatkozásaként összekötni.',
        'Defines the list of online repositories. Another installations can be used as repository, for example: Key="http://example.com/otrs/public.pl?Action=PublicRepository;File=" and Content="Some Name".' =>
            'Meghatározza az online tárolók listáját. Egy másik telepítés is használható tárolóként, például: Kulcs=„http://example.com/otrs/public.pl?Action=PublicRepository;File=” és Tartalom=„Valamilyen név”.',
        'Defines the list of possible next actions on an error screen, a full path is required, then is possible to add external links if needed.' =>
            'Meghatározza a lehetséges következő műveletek listáját egy hibaképernyőn. Egy teljes elérési út szükséges, ezután lehetséges külső hivatkozásokat hozzáadni, ha szükséges.',
        'Defines the list of types for templates.' => 'Meghatározza a típusok listáját a sablonokhoz.',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            'Meghatározza a helyet további csomagok online tárolólistájának lekéréséhez. Az első elérhető találat lesz felhasználva.',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            'Meghatározza a napló modult a rendszerhez. A „File” minden üzenetet a megadott naplófájlba ír, a „SysLog” a rendszer syslog démonját használja, mint például a syslogd.',
        'Defines the maximal size (in bytes) for file uploads via the browser. Warning: Setting this option to a value which is too low could cause many masks in your OTRS instance to stop working (probably any mask which takes input from the user).' =>
            'Meghatározza a böngészőn keresztüli fájlfeltöltések legnagyobb méretét (bájtban). Figyelem: A beállítás túl alacsony értékre állítása azt okozhatja, hogy az OTRS példány számos maszkja nem fog működni (valószínűleg az összes maszk, amely bemenetet vár a felhasználótól).',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            'Meghatározza egy munkamenet azonosító legnagyobb érvényes értékét (másodpercben).',
        'Defines the maximum number of affected tickets per job.' => 'Meghatározza a feladatonként érintett jegyek legnagyobb számát.',
        'Defines the maximum number of pages per PDF file.' => 'Meghatározza az oldalak legnagyobb számát PDF fájlonként.',
        'Defines the maximum number of quoted lines to be added to responses.' =>
            'Meghatározza a válaszokhoz hozzáadott idézett sorok legnagyobb számát.',
        'Defines the maximum number of tasks to be executed as the same time.' =>
            'Meghatározza az azonos időben végrehajtandó feladatok legnagyobb számát.',
        'Defines the maximum size (in MB) of the log file.' => 'Meghatározza a naplófájl legnagyobb méretét (MB-ban).',
        'Defines the maximum size in KiloByte of GenericInterface responses that get logged to the gi_debugger_entry_content table.' =>
            'Meghatározza az általános felület válaszainak legnagyobb méretét kilobájtban, amelyek naplózva lesznek a gi_debugger_entry_content táblába.',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            'Meghatározza azt a modult, amely egy általános értesítést jelenít meg az ügyintézői felületen. Vagy „Szöveg” - ha be van állítva - vagy a „Fájl” tartalma kerül megjelenítésre.',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            'Meghatározza azt a modult, amely megjeleníti az összes aktuálisan bejelentkezett ügyintézőt az ügyintézői felületen.',
        'Defines the module that shows all the currently logged in customers in the agent interface.' =>
            'Meghatározza azt a modult, amely megjeleníti az összes aktuálisan bejelentkezett ügyfelet az ügyintézői felületen.',
        'Defines the module that shows the currently logged in agents in the customer interface.' =>
            'Meghatározza azt a modult, amely megjeleníti az aktuálisan bejelentkezett ügyintézőket az ügyfélfelületen.',
        'Defines the module that shows the currently logged in customers in the customer interface.' =>
            'Meghatározza azt a modult, amely megjeleníti az aktuálisan bejelentkezett ügyfeleket az ügyfélfelületen.',
        'Defines the module to authenticate customers.' => 'Meghatározza azt a modult, amely hitelesíti az ügyfeleket.',
        'Defines the module to display a notification if cloud services are disabled.' =>
            'Meghatározza azt a modult, amely egy értesítést jelenít meg, ha a felhőszolgáltatások le vannak tiltva.',
        'Defines the module to display a notification in different interfaces on different occasions for OTRS Business Solution™.' =>
            'Meghatározza azt a modult, amely egy értesítést jelenít meg a különböző felületeken különböző alkalmakkor OTRS Business Solution™ használatánál.',
        'Defines the module to display a notification in the agent interface if the OTRS Daemon is not running.' =>
            'Meghatározza azt a modult, amely egy értesítést jelenít meg az ügyintézői felületen, ha az OTRS démon nem fut.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            'Meghatározza azt a modult, amely egy értesítést jelenít meg az ügyintézői felületen, ha az ügyintéző aközben jelentkezett be, hogy az irodán kívül aktív.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having system maintenance active.' =>
            'Meghatározza azt a modult, amely egy értesítést jelenít meg az ügyintézői felületen, ha az ügyintéző aközben jelentkezett be, hogy a rendszerkarbantartás aktív.',
        'Defines the module to display a notification in the agent interface, if the agent session limit prior warning is reached.' =>
            'Meghatározza azt a modult, amely egy értesítést jelenít meg az ügyintézői felületen, ha az ügyintézői munkamenetkorlát előzetes figyelmeztetését elérték.',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            'Meghatározza azt a modult, amely egy értesítést jelenít meg az ügyintézői felületen, ha a rendszert egy adminisztrátor felhasználó használja (normális esetben nem kell adminisztrátorként dolgozni).',
        'Defines the module to generate code for periodic page reloads.' =>
            'Meghatározza azt a modult, amely kódot állít elő a periodikus oldalújratöltésekhez.',
        'Defines the module to send emails. "Sendmail" directly uses the sendmail binary of your operating system. Any of the "SMTP" mechanisms use a specified (external) mailserver. "DoNotSendEmail" doesn\'t send emails and it is useful for test systems.' =>
            'Meghatározza azt a modult, amely e-maileket küld. A „Sendmail” közvetlenül az operációs rendszere sendmail binárisát használja. Az „SMTP” mechanizmusok bármelyike egy megadott (külső) levelező-kiszolgálót használ. A „DoNotSendEmail” nem küld e-maileket, és tesztrendszerek esetén hasznos.',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            'Meghatározza azt a modult, amely a munkamenet adatait tárolja. A „DB” értékkel az előtétprogram kiszolgáló leválasztható az adatbázis kiszolgálóról. Az „FS” gyorsabb.',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            'Meghatározza annak az alkalmazásnak a nevét, amely a webes felületen, a füleken és a webböngésző címsorában jelenik meg.',
        'Defines the name of the column to store the data in the preferences table.' =>
            'Meghatározza annak az oszlopnak a nevét, amely adatokat tárol a beállítások táblában.',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            'Meghatározza annak az oszlopnak a nevét, amely a felhasználói azonosítót tárolja a beállítások táblában.',
        'Defines the name of the indicated calendar.' => 'Meghatározza a jelzett naptár nevét.',
        'Defines the name of the key for customer sessions.' => 'Meghatározza a kulcs nevét az ügyfél munkamenetekhez.',
        'Defines the name of the session key. E.g. Session, SessionID or OTRS.' =>
            'Meghatározza a munkamenetkulcs nevét. Például munkamenet, munkamenet-azonosító vagy OTRS.',
        'Defines the name of the table where the user preferences are stored.' =>
            'Meghatározza annak a táblának a nevét, ahol a felhasználói beállítások vannak tárolva.',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            'Meghatározza egy jegy írása / megválaszolása utáni következő lehetséges állapotokat az ügyintézői felület jegyválasz képernyőjén.',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            'Meghatározza egy jegy továbbítása utáni következő lehetséges állapotokat az ügyintézői felület jegytovábbítás képernyőjén.',
        'Defines the next possible states after sending a message in the email outbound screen of the agent interface.' =>
            'Meghatározza egy üzenet küldése utáni következő lehetséges állapotokat az ügyintézői felület e-mail kimenő képernyőjén.',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            'Meghatározza az ügyféljegyek következő lehetséges állapotait az ügyfélfelületen.',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Meghatározza egy jegy következő állapotát egy jegyzet hozzáadása után az ügyintézői felület jegylezárás képernyőjén.',
        'Defines the next state of a ticket after adding a note, in the ticket bulk screen of the agent interface.' =>
            'Meghatározza egy jegy következő állapotát egy jegyzet hozzáadása után az ügyintézői felület jegy tömeges képernyőjén.',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Meghatározza egy jegy következő állapotát egy jegyzet hozzáadása után az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Meghatározza egy jegy következő állapotát egy jegyzet hozzáadása után az ügyintézői felület jegyjegyzet képernyőjén.',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza egy jegy következő állapotát egy jegyzet hozzáadása után egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza egy jegy következő állapotát egy jegyzet hozzáadása után egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen.',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Meghatározza egy jegy következő állapotát egy jegyzet hozzáadása után egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Meghatározza egy jegy következő állapotát egy jegyzet hozzáadása után az ügyintézői felület jegyfelelős képernyőjén.',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Meghatározza egy jegy következő állapotát az átirányítása után az ügyintézői felület jegyátirányítás képernyőjén.',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            'Meghatározza egy jegy következő állapotát egy másik várólistába helyezése után az ügyintézői felület jegyáthelyezés képernyőjén.',
        'Defines the number of character per line used in case an HTML article preview replacement on TemplateGenerator for EventNotifications.' =>
            'Meghatározza a soronkénti karakterek számát, amelyet egy sablon-előállítón lévő HTML-bejegyzés előnézet cseréje esetén használnak az esemény-értesítésekhez.',
        'Defines the number of days to keep the daemon log files.' => 'Meghatározza a napok számát a démon naplófájljainak megtartásához.',
        'Defines the number of header fields in frontend modules for add and update postmaster filters. It can be up to 99 fields.' =>
            'Meghatározza az előtétprogram-modulokban lévő fejlécmezők számát a levelezési szűrők hozzáadásánál és frissítésénél. Akár 99 mező is lehet.',
        'Defines the parameters for the customer preferences table.' => 'Meghatározza az ügyfélbeállítások tábla paramétereit.',
        'Defines the parameters for the dashboard backend. "Cmd" is used to specify command with parameters. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            'Meghatározza a vezérlőpult háttérprogram paramétereit. A „Cmd” egy paraméterekkel ellátott parancs megadásához használható. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” jelzi, ha a bővítmény alapértelmezetten engedélyezve van, vagy ha a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTL” a bővítmény gyorsítótár lejárati időtartamát jelzi percben.',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            'Meghatározza a vezérlőpult háttérprogram paramétereit. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” jelzi, ha a bővítmény alapértelmezetten engedélyezve van, vagy ha a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTL” a bővítmény gyorsítótár lejárati időtartamát jelzi percben.',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            'Meghatározza a vezérlőpult háttérprogram paramétereit. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” jelzi, ha a bővítmény alapértelmezetten engedélyezve van, vagy ha a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár lejárati időtartamát jelzi percben.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin.' =>
            'Meghatározza a vezérlőpult háttérprogram paramétereit. A „Limit” határozza meg az alapértelmezetten megjelenített bejegyzések számát. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” jelzi, ha a bővítmény alapértelmezetten engedélyezve van, vagy ha a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTL” a bővítmény gyorsítótár lejárati időtartamát jelzi percben.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin.' =>
            'Meghatározza a vezérlőpult háttérprogram paramétereit. A „Limit” határozza meg az alapértelmezetten megjelenített bejegyzések számát. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” jelzi, ha a bővítmény alapértelmezetten engedélyezve van, vagy ha a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár lejárati időtartamát jelzi percben.',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Meghatározza a SOAP leíróhoz való hozzáférés jelszavát (bin/cgi-bin/rpc.pl).',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            'Meghatározza az útvonalat és a TTF-fájlt a félkövér dőlt rögzített szélességű betűkészlet kezeléséhez a PDF dokumentumokban.',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            'Meghatározza az útvonalat és a TTF-fájlt a félkövér dőlt arányos betűkészlet kezeléséhez a PDF dokumentumokban.',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            'Meghatározza az útvonalat és a TTF-fájlt a félkövér rögzített szélességű betűkészlet kezeléséhez a PDF dokumentumokban.',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            'Meghatározza az útvonalat és a TTF-fájlt a félkövér arányos betűkészlet kezeléséhez a PDF dokumentumokban.',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            'Meghatározza az útvonalat és a TTF-fájlt a dőlt rögzített szélességű betűkészlet kezeléséhez a PDF dokumentumokban.',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            'Meghatározza az útvonalat és a TTF-fájlt a dőlt arányos betűkészlet kezeléséhez a PDF dokumentumokban.',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            'Meghatározza az útvonalat és a TTF-fájlt a rögzített szélességű betűkészlet kezeléséhez a PDF dokumentumokban.',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            'Meghatározza az útvonalat és a TTF-fájlt az arányos betűkészlet kezeléséhez a PDF dokumentumokban.',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.' =>
            'Meghatározza a megjelenített információs fájl útvonalát, amely a Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt alatt található.',
        'Defines the path to PGP binary.' => 'Meghatározza a PGP bináris útvonalát.',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            'Meghatározza az open ssl bináris útvonalát. Szükséges lehet a HOME környezeti változó ($ENV{HOME} = \'/var/lib/wwwrun\';).',
        'Defines the postmaster default queue.' => 'Meghatározza az alapértelmezett levelezési várólistát.',
        'Defines the priority in which the information is logged and presented.' =>
            'Meghatározza azt a prioritást, amelyben az információk naplózva lesznek és bemutatásra kerülnek.',
        'Defines the recipient target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "System address" displays all system addresses) in the agent interface.' =>
            'Meghatározza a telefonos jegy címzett célját és az e-mail jegy küldőjét (a „Várólista” minden várólistát megjelenít, a „Rendszercím” minden rendszercímet megjelenít) az ügyintézői felületen.',
        'Defines the recipient target of the tickets ("Queue" shows all queues, "SystemAddress" shows only the queues which are assigned to system addresses) in the customer interface.' =>
            'Meghatározza a jegyek címzett célját az ügyfélfelületen (a „Várólista” minden várólistát megjelenít, a „Rendszercím” csak azokat a várólistákat jeleníti meg, amelyek a rendszercímhez vannak hozzárendelve).',
        'Defines the required permission to show a ticket in the escalation view of the agent interface.' =>
            'Meghatározza egy jegy megtekintéséhez szükséges jogosultságokat az ügyintézői felület eszkalációs nézetében.',
        'Defines the search limit for the stats.' => 'Meghatározza a statisztikák keresési korlátját.',
        'Defines the sender for rejected emails.' => 'Meghatározza az elutasított e-mailek küldőjét.',
        'Defines the separator between the agents real name and the given queue email address.' =>
            'Egy elválasztót határoz meg az ügyintézők valódi neve és a megadott várólista e-mail címek között.',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            'Meghatározza az ügyfeleknek elérhető szabványos jogosultságokat az alkalmazáson belül. Ha több jogosultság szükséges, akkor itt adhatja meg azokat. A jogosultságoknak szerepelniük kell a forráskódban, hogy hatályban lévők legyenek. Győződjön meg arról, hogy bármely fent említett jogosultság hozzáadásakor az „rw” jogosultság legyen az utolsó bejegyzés.',
        'Defines the standard size of PDF pages.' => 'Meghatározza a PDF oldalak szabványos méretét.',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            'Meghatározza egy jegy állapotát, ha az egy követést kap, és a jegy már le lett zárva.',
        'Defines the state of a ticket if it gets a follow-up.' => 'Meghatározza egy jegy állapotát, ha az egy követést kap.',
        'Defines the state type of the reminder for pending tickets.' => 'Meghatározza az emlékeztető állapottípusát a várakozó jegyeknél.',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            'Meghatározza az új jelszóval kapcsolatosan az ügyintézőknek küldött értesítési levelek tárgyát.',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            'Meghatározza a kért új jelszóval kapcsolatosan a tokennel rendelkező ügyintézőknek küldött értesítési levelek tárgyát.',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            'Meghatározza az új fiókkal kapcsolatosan az ügyfeleknek küldött értesítési levelek tárgyát.',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            'Meghatározza az új jelszóval kapcsolatosan az ügyfeleknek küldött értesítési levelek tárgyát.',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            'Meghatározza a kért új jelszóval kapcsolatosan a tokennel rendelkező ügyfeleknek küldött értesítési levelek tárgyát.',
        'Defines the subject for rejected emails.' => 'Meghatározza az elutasított levelek tárgyát.',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            'Meghatározza a rendszer adminisztrátorának e-mail címét. Ez az alkalmazás hibaképernyőin lesz megjelenítve.',
        'Defines the system identifier. Every ticket number and http session string contains this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of OTRS).' =>
            'Meghatározza a rendszer azonosítóját. Minden jegyszám és HTTP munkamenet szöveg tartalmazza ezt az azonosítót. Ez biztosítja, hogy csak azok a jegyek legyenek feldolgozva követőként, amelyek a rendszerhez tartoznak (hasznos az OTRS két példánya közötti kommunikációkor).',
        'Defines the target attribute in the link to external customer database. E.g. \'AsPopup PopupType_TicketAction\'.' =>
            'Meghatározza a cél jellemzőt egy külső ügyfél-adatbázisra mutató hivatkozásban. Például „AsPopup PopupType_TicketAction”.',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            'Meghatározza a cél jellemzőt egy külső ügyfél-adatbázisra mutató hivatkozásban. Például „target="cdb"”.',
        'Defines the ticket fields that are going to be displayed calendar events. The "Key" defines the field or ticket attribute and the "Content" defines the display name.' =>
            'Meghatározza azokat a jegymezőket, amelyek a naptárban lévő eseményeknél meg lesznek jelenítve. A „Kulcs” a mezőt vagy a jegy jellemzőjét határozza meg, a „Tartalom” pedig a megjelenített nevet.',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            'Meghatározza a jelzett naptár időzónáját, amely később hozzárendelhető egy megadott várólistához.',
        'Defines the two-factor module to authenticate agents.' => 'Meghatározza azt a kétlépcsős modult, amely hitelesíti az ügyintézőket.',
        'Defines the two-factor module to authenticate customers.' => 'Meghatározza azt a kétlépcsős modult, amely hitelesíti az ügyfeleket.',
        'Defines the type of protocol, used by the web server, to serve the application. If https protocol will be used instead of plain http, it must be specified here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is only used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Meghatározza a webkiszolgáló által használt protokoll típusát az alkalmazás kiszolgálásához. Ha https protokollt fognak használni az egyszerű http helyett, akkor azt itt kell megadni. Mivel ez nem befolyásolja a webkiszolgáló beállításait vagy viselkedését, ezért nem fogja megváltoztatni az alkalmazáshoz való hozzáférés módját, és ha rossz, nem fogja megakadályozni az alkalmazásba való belépést. Ezt a beállítást csak az OTRS_CONFIG_HttpType változójaként használják, amely az alkalmazás által használt üzenetküldés összes űrlapján megtalálható a jegyekre mutató hivatkozások készítéséhez a rendszeren belül.',
        'Defines the used character for plaintext email quotes in the ticket compose screen of the agent interface. If this is empty or inactive, original emails will not be quoted but appended to the response.' =>
            'Meghatározza az egyszerű szöveges e-mail idézetekhez használt karaktert az ügyintézői felület jegyválasz képernyőjén. Ha ez üres vagy inaktív, akkor az eredeti levelek nem lesznek idézve, viszont hozzáfűzésre kerülnek a válaszhoz.',
        'Defines the user identifier for the customer panel.' => 'Meghatározza a felhasználói azonosítót az ügyfélpanelhez.',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Meghatározza a SOAP leíróhoz való hozzáférés felhasználónevét (bin/cgi-bin/rpc.pl).',
        'Defines the valid state types for a ticket.' => 'Meghatározza egy jegy érvényes állapotának típusait.',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/otrs.Console.pl Maint::Ticket::UnlockTimeout" can be used.' =>
            'Meghatározza a zárolatlan jegyek érvényes állapotait. A jegyek feloldásához a „bin/otrs.Console.pl Maint::Ticket::UnlockTimeout” parancsfájl használható.',
        'Defines the viewable locks of a ticket. NOTE: When you change this setting, make sure to delete the cache in order to use the new value. Default: unlock, tmp_lock.' =>
            'Meghatározza egy jegy látható zárait. MEGJEGYZÉS: ha megváltoztatja ezt a beállítást, akkor győződjön meg arról, hogy törölte-e a gyorsítótárat annak érdekében, hogy használhassa az új értéket. Alapértelmezett: zárolatlan, átmenetileg zárolt.',
        'Defines the width for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Meghatározza a RichText szerkesztő komponens szélességét ennél a képernyőnél. Szám (képpont) vagy százalék (relatív) értéket adjon meg.',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Meghatározza a RichText szerkesztő komponens szélességét. Szám (képpont) vagy százalék (relatív) értéket adjon meg.',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            'Meghatározza, hogy mely bejegyzés küldő típusokat kell megjeleníteni egy jegy előnézetében.',
        'Defines which items are available for \'Action\' in third level of the ACL structure.' =>
            'Meghatározza, hogy mely elemek érhetők el az „Action” szakasznál az ACL szerkezet harmadik szintjén.',
        'Defines which items are available in first level of the ACL structure.' =>
            'Meghatározza, hogy mely elemek érhetők el az ACL szerkezet első szintjén.',
        'Defines which items are available in second level of the ACL structure.' =>
            'Meghatározza, hogy mely elemek érhetők el az ACL szerkezet második szintjén.',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            'Meghatározza, hogy mely állapotok legyenek automatikusan beállítva (Tartalom) az állapot várakozási idejének (Kulcs) elérése után.',
        'Defines wich article type should be expanded when entering the overview. If nothing defined, latest article will be expanded.' =>
            'Meghatározza, hogy mely bejegyzéstípus legyen kinyitva az áttekintőre lépéskor. Ha semmi sincs meghatározva, akkor a legutóbbi bejegyzés lesz kinyitva.',
        'Defines, which tickets of which ticket state types should not be listed in linked ticket lists.' =>
            'Meghatározza, hogy mely jegyállapot típusok mely jegyei ne legyenek listázva a kapcsolt jegylistákban.',
        'Delete expired cache from core modules.' => 'Lejárt gyorsítótár törlése az alapvető modulokból.',
        'Delete expired loader cache weekly (Sunday mornings).' => 'Lejárt betöltő gyorsítótár törlése hetente (vasárnap reggelente).',
        'Delete expired sessions.' => 'Lejárt munkamenetek törlése.',
        'Deleted link to ticket "%s".' => 'Hivatkozás törölve a következő jegyre: „%s”.',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            'Töröl egy munkamenetet, ha a munkamenet azonosítót egy érvénytelen távoli IP-vel használják.',
        'Deletes requested sessions if they have timed out.' => 'Törli a kért munkameneteket, ha túllépték az időkorlátot.',
        'Delivers extended debugging information in the frontend in case any AJAX errors occur, if enabled.' =>
            'Kiterjesztett hibakeresési információkat szolgáltat az előtétprogramon abban az esetben, ha bármilyen AJAX-hiba történik, ha engedélyezve van.',
        'Deploy and manage OTRS Business Solution™.' => 'Az OTRS Business Solution™ üzembe állítása és kezelése.',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            'Meghatározza, hogy a lehetséges várólisták listája, amelybe a jegyet áthelyezik, egy legördülő listában vagy egy új ablakban legyen megjelenítve az ügyintézői felületen. Ha „Új ablak” van beállítva, akkor egy áthelyezési megjegyzést adhat a jegyhez.',
        'Determines if the statistics module may generate ticket lists.' =>
            'Meghatározza, hogy a statisztika modul generálhat-e jegylistákat.',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            'Meghatározza a következő lehetséges jegyállapotokat egy új e-mail jegy létrehozása után az ügyintézői felületen.',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            'Meghatározza a következő lehetséges jegyállapotokat egy új telefonos jegy létrehozása után az ügyintézői felületen.',
        'Determines the next possible ticket states, for process tickets in the agent interface.' =>
            'Meghatározza a következő lehetséges jegyállapotokat a jegyek feldolgozásához az ügyintézői felületen.',
        'Determines the next possible ticket states, for process tickets in the customer interface.' =>
            'Meghatározza a következő lehetséges jegyállapotokat a jegyek feldolgozásához az ügyfélfelületen.',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            'Meghatározza az új ügyféljegy utáni következő képernyőt az ügyfélfelületen.',
        'Determines the next screen after the follow-up screen of a zoomed ticket in the customer interface.' =>
            'Meghatározza egy nagyított jegynek a követő képernyője utáni következő képernyőt az ügyfélfelületen.',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return the last overview screen (e.g. search results, queueview, dashboard). TicketZoom will return to the TicketZoom.' =>
            'Meghatározza a következő képernyőt a jegy áthelyezése után. A LastScreenOverview a legutóbbi áttekintő képernyővel fog visszatérni (például keresési eredmények, várólista nézet, vezérlőpult). A TicketZoom vissza fog térni a jegynagyításhoz.',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            'Meghatározza a lehetséges állapotokat a várakozó jegyeknél, amelyek az időkorlát elérése után állapotot váltottak.',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            'Meghatározza azokat a szövegeket, amelyek a telefonos jegy címzettjeként (Címzett:), illetve az e-mail jegy küldőjeként (Feladó:) kerülnek megjelenítésre az ügyintézői felületen. A várólistánál mint NewQueueSelectionType „<Queue>” a várólisták neveit jeleníti meg, és a SystemAddress „<Realname> <<Email>>” esetén a címzett nevét és e-mail címét jeleníti meg.',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            'Meghatározza azokat a szövegeket, amelyek a jegy címzettjeként (Címzett:) kerülnek megjelenítésre az ügyfélfelületen. A várólistánál mint CustomerPanelSelectionType, „<Queue>” a várólisták neveit jeleníti meg, és a SystemAddress „<Realname> <<Email>>” esetén a címzett nevét és e-mail címét jeleníti meg.',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            'Meghatározza annak a módját, ahogyan a kapcsolt objektumok megjelenítésre kerülnek minden egyes nagyítási maszkban.',
        'Determines which options will be valid of the recipient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            'Meghatározza, hogy mely lehetőségek lesznek érvényesek a címzettnél (telefonos jegy) és a küldőnél (e-mail jegy) az ügyintézői felületen.',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            'Meghatározza, hogy mely várólisták lesznek érvényesek a jegy címzettjeinél az ügyfélfelületen.',
        'Development' => 'Fejlesztői',
        'Disable HTTP header "Content-Security-Policy" to allow loading of external script contents. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            'A „Content-Security-Policy” HTTP-fejléc letiltása a külső parancsfájltartalmak betöltésének engedélyezéséhez. Ezen HTTP-fejléc letiltása biztonsági probléma lehet! Csak akkor tiltsa le, ha tudja, hogy mit csinál!',
        'Disable HTTP header "X-Frame-Options: SAMEORIGIN" to allow OTRS to be included as an IFrame in other websites. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            'Az „X-Frame-Options: SAMEORIGIN” HTTP-fejléc letiltása, hogy lehetővé tegye az OTRS beágyazását IFrame-ként más weboldalakba. Ennek a HTTP-fejlécnek a letiltása biztonsági probléma lehet! Csak akkor tiltsa le, ha tudja, hogy mit csinál!',
        'Disable restricted security for IFrames in IE. May be required for SSO to work in IE.' =>
            'Korlátozott biztonság letiltása Internet Explorerben az iFrame-eknél. Az SSO szükséges lehet, hogy működjön IE alatt.',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be activated).' =>
            'Letiltja az emlékeztető értesítések küldését egy jegy felelős ügyintézőjének (a Ticket::Responsible aktiválása szükséges).',
        'Disables the communication between this system and OTRS Group servers that provides cloud services. If active, some functionality will be lost such as system registration, support data sending, upgrading to and use of OTRS Business Solution™, OTRS Verify™, OTRS News and product News dashboard widgets, among others.' =>
            'Letiltja a kommunikációt a rendszer és az OTRS csoport azon kiszolgálói között, amelyek felhőszolgáltatásokat nyújtanak. Ha be van kapcsolva, akkor néhány funkcionalitás el fog veszi, mint például a rendszer regisztráció, a támogatási adatok küldése, az OTRS Business Solution™ használata és az arra történő frissítés, az OTRS Verify™, az OTRS hírek és termékhírek vezérlőpult felületi elemek, stb.',
        'Disables the web installer (http://yourhost.example.com/otrs/installer.pl), to prevent the system from being hijacked. If set to "No", the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If not active, it also disables the GenericAgent, PackageManager and SQL Box.' =>
            'Letiltja a webes telepítőt (http://yourhost.example.com/otrs/installer.pl), hogy megakadályozza a rendszer feltörését. Ha „Nem” értékre állítja, a rendszer újratelepíthető, és a jelenlegi alap konfiguráció lesz felhasználva a telepítő parancsfájlon belüli kérdések előre kitöltéséhez. Ha nem aktív, akkor letiltja az általános ügyintézőt, a csomagkezelőt és az SQL dobozt is.',
        'Display a warning and prevent search when using stop words within fulltext search.' =>
            'Figyelmeztetés megjelenítése és a keresés megakadályozása, ha kiszűrendő szavakat használ a szabad-szavas keresésen belül.',
        'Display settings to override defaults for Process Tickets.' => 'Beállítások megjelenítése az alapértékek felülbírálásához a jegyek feldolgozásánál.',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            'Megjeleníti az elszámolt időt egy bejegyzésnél a jegy nagyítás nézeten.',
        'Dropdown' => 'Legördülő',
        'Dutch stop words for fulltext index. These words will be removed from the search index.' =>
            'Holland kiszűrendő szavak a szabad-szavas indexnél. Ezek a szavak el lesznek távolítva a keresési indexből.',
        'Dynamic Fields Checkbox Backend GUI' => 'Dinamikus mezők jelölőnégyzet háttérprogram grafikus felület',
        'Dynamic Fields Date Time Backend GUI' => 'Dinamikus mezők dátum idő háttérprogram grafikus felület',
        'Dynamic Fields Drop-down Backend GUI' => 'Dinamikus mezők legördülő háttérprogram grafikus felület',
        'Dynamic Fields GUI' => 'Dinamikus mezők grafikus felület',
        'Dynamic Fields Multiselect Backend GUI' => 'Dinamikus mezők többválasztós háttérprogram grafikus felület',
        'Dynamic Fields Overview Limit' => 'Dinamikus mezők áttekintő korlát',
        'Dynamic Fields Text Backend GUI' => 'Dinamikus mezők szöveg háttérprogram grafikus felület',
        'Dynamic Fields used to export the search result in CSV format.' =>
            'Dinamikus mezők, amelyek a keresési eredmények CSV formátumba való exportálásához használhatók.',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key => My Group\', \'Content: Name_X, NameY\'.' =>
            'Dinamikus mezők csoportjai a feldolgozó felületi elemhez. A kulcs a csoport neve, az érték a megjelenítendő mezőket tartalmazza. Példa: „Kulcs => Saját csoport”, „Tartalom: Név_X, Név_Y”.',
        'Dynamic fields limit per page for Dynamic Fields Overview' => 'Dinamikus mezők oldalankénti korlátja a dinamikus mezők áttekintőnél',
        'Dynamic fields options shown in the ticket message screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###DynamicField.' =>
            'Az ügyfélfelület jegy üzenet képernyőjén megjelenő dinamikus mezők lehetőségei. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező. MEGJEGYZÉS: Ha az ügyfélfelület jegy nagyításában is meg szeretné jeleníteni ezeket a mezőket, akkor engedélyeznie kell azokat ebben: CustomerTicketZoom###DynamicField.',
        'Dynamic fields options shown in the ticket reply section in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyfélfelület jegynagyítás képernyőjén a jegy válasz szakaszban megjelenített dinamikus mezők lehetőségei. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the email outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület e-mail kimenő képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the process widget in ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Az ügyintézői felület jegynagyítás képernyőjén a feldolgozó felületi elemben megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve.',
        'Dynamic fields shown in the sidebar of the ticket zoom screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Az ügyintézői felület jegynagyítás képernyőjének oldalsávján megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve.',
        'Dynamic fields shown in the ticket close screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegylezárás képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket compose screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegyválasz képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket email screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegy e-mail képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket forward screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegytovábbítás képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket free text screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegy szabad szöveg képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket medium format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Az ügyintézői felület jegy közepes formátum áttekintő képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve.',
        'Dynamic fields shown in the ticket move screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegyáthelyezés képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket note screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegyjegyzet képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket overview screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyfélfelület jegyáttekintő képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket owner screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegytulajdonos képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket pending screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület várakozó jegy képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket phone inbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegy telefon bejövő képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket phone outbound screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegy telefon kimenő képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket phone screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegy telefon képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket preview format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Az ügyintézői felület jegy előnézeti formátum áttekintő képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve.',
        'Dynamic fields shown in the ticket print screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Az ügyintézői felület jegynyomtatás képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve.',
        'Dynamic fields shown in the ticket print screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Az ügyfélfelület jegynyomtatás képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve.',
        'Dynamic fields shown in the ticket priority screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegyprioritás képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket responsible screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and required.' =>
            'Az ügyintézői felület jegyfelelős képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és kötelező.',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Az ügyfélfelület jegykeresési áttekintő eredmények képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve.',
        'Dynamic fields shown in the ticket search screen of the agent interface. Possible settings: 0 = Disabled, 1 = Enabled, 2 = Enabled and shown by default.' =>
            'Az ügyintézői felület jegykeresés képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve, 2 = Engedélyezve és alapértelmezetten megjelenítve.',
        'Dynamic fields shown in the ticket search screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Az ügyfélfelület jegykeresés képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve.',
        'Dynamic fields shown in the ticket small format overview screen of the agent interface. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Az ügyintézői felület jegy kis formátumú áttekintő képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Elérhető, 2 = Alapértelmezetten engedélyezve.',
        'Dynamic fields shown in the ticket zoom screen of the customer interface. Possible settings: 0 = Disabled, 1 = Enabled.' =>
            'Az ügyfélfelület jegynagyítás képernyőjén megjelenített dinamikus mezők. Lehetséges beállítások: 0 = Letiltva, 1 = Engedélyezve.',
        'DynamicField' => 'Dinamikus mező',
        'DynamicField backend registration.' => 'Dinamikus mező háttérprogram regisztráció.',
        'DynamicField object registration.' => 'Dinamikus mező objektum regisztráció.',
        'E-Mail Outbound' => 'Kimenő e-mail',
        'Edit Customer Companies.' => 'Ügyfél-vállalatok szerkesztése.',
        'Edit Customer Users.' => 'Ügyfél-felhasználók szerkesztése.',
        'Edit customer company' => 'Ügyfél-vállalat szerkesztése',
        'Email Addresses' => 'E-mail címek',
        'Email Outbound' => 'Kimenő e-mail',
        'Email sent to "%s".' => 'Az e-mail elküldve ide: „%s”.',
        'Email sent to customer.' => 'Az e-mail elküldve az ügyfélnek.',
        'Enable keep-alive connection header for SOAP responses.' => 'Kapcsolatfenntartó kapcsolatfejléc engedélyezése a SOAP válaszoknál.',
        'Enabled filters.' => 'Engedélyezett szűrők.',
        'Enables PGP support. When PGP support is enabled for signing and encrypting mail, it is HIGHLY recommended that the web server runs as the OTRS user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            'Engedélyezi a PGP támogatást. Amikor a PGP támogatás engedélyezve van levelek aláírásához és titkosításához, akkor ERŐSEN javasolt, hogy a webkiszolgáló az OTRS felhasználóként fusson. Egyébként problémák lesznek a jogosultságokkal, amikor hozzáfér a .gnupg mappához.',
        'Enables S/MIME support.' => 'Engedélyezi az S/MIME támogatást.',
        'Enables customers to create their own accounts.' => 'Engedélyezi az ügyfeleknek, hogy létrehozzák a saját fiókjaikat.',
        'Enables fetch S/MIME from CustomerUser backend support.' => 'Engedélyezi az S/MIME lekérését az ügyfél-felhasználó háttérprogram támogatásából.',
        'Enables file upload in the package manager frontend.' => 'Engedélyezi a fájlfeltöltést a csomagkezelő előtétprogramon.',
        'Enables or disables the caching for templates. WARNING: Do NOT disable template caching for production environments for it will cause a massive performance drop! This setting should only be disabled for debugging reasons!' =>
            'Engedélyezi vagy letiltja a gyorsítótárazást a sablonoknál. FIGYELMEZTETÉS: NE tiltsa le a sablon gyorsítótárazást termelési környezeteknél, mert hatalmas teljesítménycsökkenést fog okozni! Ezt a beállítást csak hibakeresési okokból szabad letiltani!',
        'Enables or disables the debug mode over frontend interface.' => 'Engedélyezi vagy letiltja a hibakereső módot az előtétprogram felületén.',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            'Engedélyezi vagy letiltja a jegymegfigyelő funkciót, hogy nyomon kövesse a jegyeket anélkül, hogy tulajdonos vagy felelős lenne.',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            'Engedélyezi a teljesítmény naplót (az oldal válaszidejének naplózásához). Ez hatással lesz a rendszer teljesítményére. A Frontend::Module###AdminPerformanceLog beállításnak engedélyezve kell lennie.',
        'Enables spell checker support.' => 'Engedélyezi a helyesírás-ellenőrzés támogatást.',
        'Enables the minimal ticket counter size (if "Date" was selected as TicketNumberGenerator).' =>
            'Engedélyezi a legkisebb jegyszámláló méretet (ha „Dátum” lett kiválasztva mint jegyszám-előállító).',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            'Engedélyezi a tömeges jegyművelet szolgáltatást az ügyintézői előtétprogramnál, hogy egyszerre több jegyen tudjon dolgozni.',
        'Enables ticket bulk action feature only for the listed groups.' =>
            'Csak a felsorolt csoportoknak engedélyezi a tömeges jegyművelet szolgáltatást.',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            'Engedélyezi a jegyfelelős szolgáltatást egy megadott jegy nyomon követéséhez.',
        'Enables ticket watcher feature only for the listed groups.' => 'Csak a felsorolt csoportoknak engedélyezi a jegymegfigyelés szolgáltatást.',
        'English (Canada)' => 'Angol (Kanada)',
        'English (United Kingdom)' => 'Angol (Egyesült Királyság)',
        'English (United States)' => 'Angol (Egyesült Államok)',
        'English stop words for fulltext index. These words will be removed from the search index.' =>
            'Angol kiszűrendő szavak a szabad-szavas indexnél. Ezek a szavak el lesznek távolítva a keresési indexből.',
        'Enroll process for this ticket' => 'Folyamat besorolása ehhez a jegyhez',
        'Enter your shared secret to enable two factor authentication.' =>
            'Adja meg a megosztott titkot a kétlépcsős hitelesítés engedélyezéséhez.',
        'Escalation response time finished' => 'Eszkaláció válaszidő befejeződött',
        'Escalation response time forewarned' => 'Eszkaláció válaszidő figyelmeztetve',
        'Escalation response time in effect' => 'Eszkaláció válaszidő van hatályban',
        'Escalation solution time finished' => 'Eszkaláció megoldási idő befejeződött',
        'Escalation solution time forewarned' => 'Eszkaláció megoldási idő figyelmeztetve',
        'Escalation solution time in effect' => 'Eszkaláció megoldási idő van hatályban',
        'Escalation update time finished' => 'Eszkaláció frissítési idő befejeződött',
        'Escalation update time forewarned' => 'Eszkaláció frissítési idő figyelmeztetve',
        'Escalation update time in effect' => 'Eszkaláció frissítési idő van hatályban',
        'Escalation view' => 'Eszkalációs nézet',
        'EscalationTime' => 'Eszkalációs idő',
        'Estonian' => 'Észt',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate).' =>
            'Eseménymodul regisztráció. A jobb teljesítményért meghatározhat egy aktiváló eseményt (például Event => TicketCreate).',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            'Eseménymodul regisztráció. A jobb teljesítményért meghatározhat egy aktiváló eseményt (például Event => TicketCreate). Ez csak akkor lehetséges, ha minden jegy dinamikus mező ugyanazt az eseményt igényli.',
        'Event module that performs an update statement on TicketIndex to rename the queue name there if needed and if StaticDB is actually used.' =>
            'Eseménymodul, amely módosítási utasítást hajt végre a TicketIndex táblán a várólista nevének átnevezéséhez, ha ez ott szükséges, és ha éppenséggel StaticDB van használatban.',
        'Event module that updates customer user search profiles if login changes.' =>
            'Eseménymodul, amely frissíti az ügyfél-felhasználó keresési profiljait, ha a bejelentkezés megváltozik.',
        'Event module that updates customer user service membership if login changes.' =>
            'Eseménymodul, amely frissíti az ügyfél-felhasználó szolgáltatás tagságát, ha a bejelentkezés megváltozik.',
        'Event module that updates customer users after an update of the Customer.' =>
            'Eseménymodul, amely frissíti az ügyfél-felhasználókat az ügyfél frissítése után.',
        'Event module that updates tickets after an update of the Customer User.' =>
            'Eseménymodul, amely frissíti a jegyeket az ügyfél-felhasználó frissítése után.',
        'Event module that updates tickets after an update of the Customer.' =>
            'Eseménymodul, amely frissíti a jegyeket az ügyfél frissítése után.',
        'Events Ticket Calendar' => 'Események jegynaptár',
        'Execute SQL statements.' => 'SQL utasítások végrehajtása.',
        'Executes a custom command or module. Note: if module is used, function is required.' =>
            'Egy egyéni parancsot vagy modult hajt végre. Megjegyzés: ha modult használ, akkor függvény szükséges.',
        'Executes follow-up checks on In-Reply-To or References headers for mails that don\'t have a ticket number in the subject.' =>
            'Követő ellenőrzéseket hajt végre az In-Reply-To vagy a References fejléceken azoknál a leveleknél, amelyek nem rendelkeznek jegyszámmal a tárgyában.',
        'Executes follow-up checks on attachment contents for mails that don\'t have a ticket number in the subject.' =>
            'Követő ellenőrzéseket hajt végre a melléklet tartalmakon azoknál a leveleknél, amelyek nem rendelkeznek jegyszámmal a tárgyában.',
        'Executes follow-up checks on email body for mails that don\'t have a ticket number in the subject.' =>
            'Követő ellenőrzéseket hajt végre az e-mail törzsén azoknál a leveleknél, amelyek nem rendelkeznek jegyszámmal a tárgyában.',
        'Executes follow-up checks on the raw source email for mails that don\'t have a ticket number in the subject.' =>
            'Követő ellenőrzéseket hajt végre az e-mail nyers forrásán azoknál a leveleknél, amelyek nem rendelkeznek jegyszámmal a tárgyában.',
        'Exports the whole article tree in search result (it can affect the system performance).' =>
            'Exportálja a teljes bejegyzésfát a keresési eredményben (hatással lehet a rendszer teljesítményére).',
        'Fetch emails via fetchmail (using SSL).' => 'E-mailek lekérése a fetchmail programon keresztül (SSL használatával).',
        'Fetch emails via fetchmail.' => 'E-mailek lekérése a fetchmail programon keresztül.',
        'Fetch incoming emails from configured mail accounts.' => 'Bejövő e-mailek lekérése a beállított levelezőfiókokból.',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            'Csomagokat kér le proxy-n keresztül. Felülírja a „WebUserAgent::Proxy” beállítást.',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.' =>
            'Egy fájl, amely a Kernel::Modules::AgentInfo modulban van megjelenítve, ha a Kernel/Output/HTML/Templates/Standard/AgentInfo.tt alatt található.',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Szűrő az ACL-ek hibakereséséhez. Megjegyzés: több jegyattribútum is hozzáadható <OTRS_TICKET_Attribútum> formátumban, például <OTRS_TICKET_Priority>.',
        'Filter for debugging Transitions. Note: More filters can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Szűrő az átmenetek hibakereséséhez. Megjegyzés: több szűrő is hozzáadható <OTRS_TICKET_Attribútum> formátumban, például <OTRS_TICKET_Priority>.',
        'Filter incoming emails.' => 'Bejövő e-mailek szűrése.',
        'Finnish' => 'Finn',
        'First Queue' => 'Első várólista',
        'FirstLock' => 'FirstLock',
        'FirstResponse' => 'FirstResponse',
        'FirstResponseDiffInMin' => 'FirstResponseDiffInMin',
        'FirstResponseInMin' => 'FirstResponseInMin',
        'Firstname Lastname' => 'Keresztnév Vezetéknév',
        'Firstname Lastname (UserLogin)' => 'Keresztnév Vezetéknév (Felhasználónév)',
        'FollowUp for [%s]. %s' => 'Követő ehhez: [%s]. %s',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            'A kimenő e-mailek kódolását kényszeríti (7bit|8bit|quoted-printable|base64).',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            'Egy másik jegyállapot (az aktuálisból) kiválasztását kényszeríti a zárolás művelet után. Az aktuális állapotot kulcsként határozza meg, és a zárolás művelet utáni következő állapotot tartalomként.',
        'Forces to unlock tickets after being moved to another queue.' =>
            'Kényszeríti a jegyek feloldását, miután át lettek helyezve egy másik várólistába.',
        'Forwarded to "%s".' => 'Továbbítva ide: „%s”.',
        'French' => 'Francia',
        'French (Canada)' => 'Francia (Kanada)',
        'French stop words for fulltext index. These words will be removed from the search index.' =>
            'Francia kiszűrendő szavak a szabad-szavas indexnél. Ezek a szavak el lesznek távolítva a keresési indexből.',
        'Frontend' => 'Előtétprogram',
        'Frontend module registration (disable AgentTicketService link if Ticket Serivice feature is not used).' =>
            'Előtétprogram-modul regisztráció (az AgentTicketService hivatkozás letiltása, ha a jegy szolgáltatás funkció nincs használatban).',
        'Frontend module registration (disable company link if no company feature is used).' =>
            'Előtétprogram-modul regisztráció (vállalat-hivatkozás letiltása, ha nincs vállalat-szolgáltatás használatban).',
        'Frontend module registration (disable ticket processes screen if no process available) for Customer.' =>
            'Előtétprogram-modul regisztráció (jegy feldolgozások képernyő letiltása, ha nincs elérhető folyamat) az ügyfélnek.',
        'Frontend module registration (disable ticket processes screen if no process available).' =>
            'Előtétprogram-modul regisztráció (jegy feldolgozások képernyő letiltása, ha nincs elérhető folyamat).',
        'Frontend module registration for the agent interface.' => 'Előtétprogram-modul regisztráció az ügyintézői felülethez.',
        'Frontend module registration for the customer interface.' => 'Előtétprogram-modul regisztráció az ügyfélfelülethez.',
        'Frontend theme' => 'Előtétprogram téma',
        'Full value' => 'Teljes érték',
        'Fulltext index regex filters to remove parts of the text.' => 'Szabad-szavas index reguláris kifejezés szűrők a szöveg részeinek áthelyezéséhez.',
        'Fulltext search' => 'Szabad-szavas keresés',
        'Galician' => 'Galíciai',
        'General ticket data shown in the ticket overviews (fall-back). Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default. Note that TicketNumber can not be disabled, because it is necessary.' =>
            'A jegyáttekintőkben megjelenített általános jegyadatok (tartalék). Lehetséges beállítások: 0 = Letiltva, 1 = Elérhető, 2 = Alapértelmezetten engedélyezett. Ne feledje, hogy a TicketNumber nem tiltható le, mert az szükséges.',
        'Generate dashboard statistics.' => 'Vezérlőpult statisztikák előállítása.',
        'Generic Info module.' => 'Általános információs modul.',
        'GenericAgent' => 'Általános ügyintéző',
        'GenericInterface Debugger GUI' => 'Általános felület hibakereső grafikus felület',
        'GenericInterface Invoker GUI' => 'Általános felület meghívó grafikus felület',
        'GenericInterface Operation GUI' => 'Általános felület művelet grafikus felület',
        'GenericInterface TransportHTTPREST GUI' => 'Általános felület TransportHTTPREST grafikus felület',
        'GenericInterface TransportHTTPSOAP GUI' => 'Általános felület TransportHTTPSOAP grafikus felület',
        'GenericInterface Web Service GUI' => 'Általános felület webszolgáltatás grafikus felület',
        'GenericInterface Webservice History GUI' => 'Általános felület webszolgáltatás előzmények grafikus felület',
        'GenericInterface Webservice Mapping GUI' => 'Általános felület webszolgáltatás leképezés grafikus felület',
        'GenericInterface module registration for the invoker layer.' => 'Általános felület modul regisztráció a meghívó réteghez.',
        'GenericInterface module registration for the mapping layer.' => 'Általános felület modul regisztráció a leképező réteghez.',
        'GenericInterface module registration for the operation layer.' =>
            'Általános felület modul regisztráció a műveleti réteghez.',
        'GenericInterface module registration for the transport layer.' =>
            'Általános felület modul regisztráció az átviteli réteghez.',
        'German' => 'Német',
        'German stop words for fulltext index. These words will be removed from the search index.' =>
            'Német kiszűrendő szavak a szabad-szavas indexnél. Ezek a szavak el lesznek távolítva a keresési indexből.',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files.' =>
            'Megadja a végfelhasználóknak azt a lehetőséget, hogy felülírják a CSV fájloknál a fordítási fájlokban meghatározott elválasztó karaktert.',
        'Global Search Module.' => 'Globális keresés modul.',
        'Go back' => 'Vissza',
        'Google Authenticator' => 'Google hitelesítő',
        'Graph: Bar Chart' => 'Grafikon: oszlopdiagram',
        'Graph: Line Chart' => 'Grafikon: vonaldiagram',
        'Graph: Stacked Area Chart' => 'Grafikon: halmozott területdiagram',
        'Greek' => 'Görög',
        'HTML Reference' => 'HTML hivatkozás',
        'HTML Reference.' => 'HTML hivatkozás.',
        'Hebrew' => 'Héber',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). Runtime will do full-text searches on live data (it works fine for up to 50.000 tickets). StaticDB will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild".' =>
            'Segít kiterjeszteni a bejegyzések szabad-szavas keresését (feladó, címzett, másolat, tárgy és törzs keresés). Futásidőben fog szabad-szavas kereséseket végrehajtani a valós adatokon (nagyszerűen működik akár 50000 jegynél is). A StaticDB fel fogja darabolni az összes bejegyzést, és egy indexet fog felépíteni a bejegyzés létrehozása után, körülbelül 50%-kal növelve a szabad-szavas kereséseket. Egy kezdeti index létrehozásához használja a „bin/otrs.Console.pl Maint::Ticket::FulltextIndexRebuild” parancsfájlt.',
        'Hindi' => 'Hindi',
        'Hungarian' => 'Magyar',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            'Ha „DB” lett kiválasztva a Customer::AuthModule modulnál, akkor megadható egy adatbázis-meghajtó (normális esetben automatikus felismerést használva).',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            'Ha „DB” lett kiválasztva a Customer::AuthModule modulnál, akkor megadható egy jelszó az ügyféltáblához való csatlakozáshoz.',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            'Ha „DB” lett kiválasztva a Customer::AuthModule modulnál, akkor megadható egy felhasználónév az ügyféltáblához való csatlakozáshoz.',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            'Ha „DB” lett kiválasztva a Customer::AuthModule modulnál, akkor a DSN megadása kötelező az ügyféltáblához való kapcsolatnál.',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            'Ha „DB” lett kiválasztva a Customer::AuthModule modulnál, akkor meg kell adni a CustomerPassword oszlopnevét az ügyféltáblában.',
        'If "DB" was selected for Customer::AuthModule, the crypt type of passwords must be specified.' =>
            'Ha „DB” lett kiválasztva a Customer::AuthModule modulnál, akkor meg kell adni a jelszavak titkosításának típusát.',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            'Ha „DB” lett kiválasztva a Customer::AuthModule modulnál, akkor meg kell adni a CustomerKey oszlopnevét az ügyféltáblában.',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            'Ha „DB” lett kiválasztva a Customer::AuthModule modulnál, akkor meg kell adni annak a táblának a nevét, ahol az ügyféladatok tárolva lesznek.',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            'Ha „DB” lett kiválasztva a SessionModule modulnál, akkor meg kell adni azt a táblát az adatbázisban, ahol a munkamenet adatok tárolva lesznek.',
        'If "FS" was selected for SessionModule, a directory where the session data will be stored must be specified.' =>
            'Ha „FS” lett kiválasztva a SessionModule modulnál, akkor meg kell adni azt a könyvtárat, ahol a munkamenet adatok tárolva lesznek.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            'Ha „HTTPBasicAuth” lett kiválasztva a Customer::AuthModule modulnál, akkor megadhatja (reguláris kifejezés használatával) a TÁVOLI_FELHASZNÁLÓ részeinek felvágását (például a záró tartományok eltávolításához). Reguláris kifejezés megjegyzés, a $1 lesz az új bejelentkezés.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            'Ha „HTTPBasicAuth” lett kiválasztva a Customer::AuthModule modulnál, akkor megadhatja a felhasználónevek vezető részeinek levágását (például tartományoknál, úgymint pelda_tartomany\felhasznalo a felhasználóhoz).',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            'Ha „LDAP” lett kiválasztva a Customer::AuthModule modulnál, és egy utótagot szeretne hozzáadni minden ügyfél bejelentkezési névhez, akkor azt itt adja meg. Például csak a user felhasználónevet szeretné írni, de az LDAP könyvtárban a user@domain létezik.',
        'If "LDAP" was selected for Customer::AuthModule and special paramaters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            'Ha „LDAP” lett kiválasztva a Customer::AuthModule modulnál, és speciális paraméterek szükségesek a Net::LDAP Perl modulhoz, akkor azokat itt adhatja meg. További információkért nézze meg a „perldoc Net::LDAP” dokumentációt a paraméterekkel kapcsolatban.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            'Ha „LDAP” lett kiválasztva a Customer::AuthModule modulnál, és a felhasználóinak csak névtelen hozzáférése van az LDAP fához, de keresni szeretne az adatokban, akkor azt megteheti egy olyan felhasználóval, akinek hozzáférése van az LDAP könyvtárhoz. Itt adja meg a jelszavát annak a speciális felhasználónak.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            'Ha „LDAP” lett kiválasztva a Customer::AuthModule modulnál, és a felhasználóinak csak névtelen hozzáférése van az LDAP fához, de keresni szeretne az adatokban, akkor azt megteheti egy olyan felhasználóval, akinek hozzáférése van az LDAP könyvtárhoz. Itt adja meg a felhasználónevét annak a speciális felhasználónak.',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            'Ha „LDAP” lett kiválasztva a Customer::AuthModule modulnál, akkor a BaseDN megadása kötelező.',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            'Ha „LDAP” lett kiválasztva a Customer::AuthModule modulnál, akkor megadható a LDAP kiszolgáló.',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            'Ha „LDAP” lett kiválasztva a Customer::AuthModule modulnál, akkor meg kell adni a felhasználó-azonosítót.',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            'Ha „LDAP” lett kiválasztva a Customer::AuthModule modulnál, akkor megadhatók a felhasználói jellemzők. Az LDAP posixGroups esetén használjon UID-t, nem LDAP posixGroups esetén használjon teljes felhasználó DN-t.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            'Ha „LDAP” lett kiválasztva a Customer::AuthModule modulnál, akkor itt adhatja meg a hozzáférési jellemzőket.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Ha „LDAP” lett kiválasztva a Customer::AuthModule modulnál, akkor megadhatja, hogy az alkalmazás leálljon, ha például hálózati problémák miatt nem lehet kapcsolatot létesíteni a kiszolgálóval.',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use OTRS. Specify the group, who may access the system.' =>
            'Ha „LDAP” lett kiválasztva a Customer::AuthModule modulnál, akkor ellenőrizheti, hogy a felhasználónak engedélyezett-e a hitelesítés, mert egy posixGroup része. Például a felhasználónak az xyz csoportban kell lennie az OTRS használatához. Adja meg azt a csoportot, amely hozzáférhet a rendszerhez.',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            'Ha „LDAP” lett kiválasztva, akkor egy szűrőt adhat minden LDAP lekérdezéshez, például (mail=*), (objectclass=user) vagy (!objectclass=computer).',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            'Ha „Radius” lett kiválasztva a Customer::AuthModule modulnál, akkor meg kell adni a radius kiszolgálóra történő hitelesítés jelszavát.',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            'Ha „Radius” lett kiválasztva a Customer::AuthModule modulnál, akkor meg kell adni a radius kiszolgálót.',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Ha „Radius” lett kiválasztva a Customer::AuthModule modulnál, akkor megadhatja, hogy az alkalmazás leálljon, ha például hálózati problémák miatt nem lehet kapcsolatot létesíteni a kiszolgálóval.',
        'If "Sendmail" was selected as SendmailModule, the location of the sendmail binary and the needed options must be specified.' =>
            'Ha „Sendmail” lett kiválasztva a SendmailModule modulnál, akkor meg kell adni a sendmail bináris helyét és a szükséges beállításokat.',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            'Ha „SysLog” lett kiválasztva a LogModule modulnál, akkor megadható egy speciális naplózó képesség.',
        'If "SysLog" was selected for LogModule, a special log sock can be specified (on solaris you may need to use \'stream\').' =>
            'Ha „SysLog” lett kiválasztva a LogModule modulnál, akkor megadható egy speciális naplózó foglalat (solaris esetén a „stream” használata lehet szükséges).',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            'Ha „SysLog” lett kiválasztva a LogModule modulnál, akkor megadható a naplózásnál használandó karakterkészlet.',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            'Ha „File” lett kiválasztva a LogModule modulnál, akkor meg kell adni egy naplófájlt. Ha a fájl nem létezik, a rendszer létre fogja hozni.',
        'If active, none of the regular expressions may match the user\'s email address to allow registration.' =>
            'Ha aktív, akkor a reguláris kifejezések egyike sem illeszkedhet a felhasználó e-mail címére a regisztráció elfogadásához.',
        'If active, one of the regular expressions has to match the user\'s email address to allow registration.' =>
            'Ha aktív, akkor a reguláris kifejezések egyikének illeszkednie kell a felhasználó e-mail címére a regisztráció elfogadásához.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            'Ha az „SMTP” mechanizmusok bármelyike SendmailModule modulként lett kiválasztva, és hitelesítés szükséges a levelező kiszolgálóhoz, akkor meg kell adni egy jelszót.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            'Ha az „SMTP” mechanizmusok bármelyike SendmailModule modulként lett kiválasztva, és hitelesítés szükséges a levelező kiszolgálóhoz, akkor meg kell adni egy felhasználónevet.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            'Ha az „SMTP” mechanizmusok bármelyike SendmailModule modulként lett kiválasztva, akkor meg kell adni azt a levelező kiszolgálót, amely kiküldi a leveleket.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            'Ha az „SMTP” mechanizmusok bármelyike SendmailModule modulként lett kiválasztva, akkor meg kell adni azt a portot, ahol a levelező kiszolgáló a bejövő kapcsolatokat figyeli.',
        'If enabled debugging information for ACLs is logged.' => 'Ha engedélyezve van, akkor az ACL-ek hibakeresési információi naplózva lesznek.',
        'If enabled debugging information for transitions is logged.' => 'Ha engedélyezve van, akkor az átmenetek hibakeresési információi naplózva lesznek.',
        'If enabled the daemon will redirect the standard error stream to a log file.' =>
            'Ha engedélyezve van, akkor a démon át fogja irányítani a szabványos hibafolyamot egy naplófájlba.',
        'If enabled the daemon will redirect the standard output stream to a log file.' =>
            'Ha engedélyezve van, akkor a démon át fogja irányítani a szabványos kimenetfolyamot egy naplófájlba.',
        'If enabled, OTRS will deliver all CSS files in minified form. WARNING: If you turn this off, there will likely be problems in IE 7, because it cannot load more than 32 CSS files.' =>
            'Ha engedélyezve van, akkor az OTRS minden CSS fájlt minimalizált formában fog kiszolgálni. FIGYELEM: Ha ezt kikapcsolja, akkor valószínűleg problémái lesznek IE7 alatt, mert az nem tud 32 CSS fájlnál többet betölteni.',
        'If enabled, OTRS will deliver all JavaScript files in minified form.' =>
            'Ha engedélyezve van, akkor az OTRS minden JavaScript fájlt minimalizált formában fog szállítani.',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            'Ha engedélyezve van, akkor a telefonos jegy és az e-mail jegy új ablakokban fog megnyílni.',
        'If enabled, the OTRS version tag will be removed from the Webinterface, the HTTP headers and the X-Headers of outgoing mails. NOTE: If you change this option, please make sure to delete the cache.' =>
            'Ha engedélyezve van, akkor az OTRS verziócímke el lesz távolítva a webes felületről, a HTTP fejlécekből és a kimenő levelek X-Headers bejegyzéseiből. Megjegyzés: ha megváltoztatja ezt a beállítást, akkor gondoskodjon a gyorsítótár törléséről is.',
        'If enabled, the customer can search for tickets in all services (regardless what services are assigned to the customer).' =>
            'Ha engedélyezve van, akkor az ügyfél minden szolgáltatásban kereshet jegyeket (tekintet nélkül arra, hogy mely szolgáltatások vannak hozzárendelve az ügyfélhez).',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            'Ha engedélyezve van, akkor a különböző áttekintők (vezérlőpult, zárolt nézet, várólista nézet) automatikusan frissítve lesznek a megadott idő után.',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            'Ha engedélyezve van, akkor a főmenü első szintje megnyílik az egérrel való rámutatáskor (a csak kattintás helyet).',
        'If no SendmailNotificationEnvelopeFrom is specified, this setting makes it possible to use the email\'s from address instead of an empty envelope sender (required in certain mail server configurations).' =>
            'Ha nincs SendmailNotificationEnvelopeFrom megadva, akkor ez a beállítás lehetővé teszi az e-mailek feladó címének használatát egy üres boríték küldő helyett (bizonyos levelezőkiszolgálók beállításainál szükséges).',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty (unless SendmailNotificationEnvelopeFrom::FallbackToEmailFrom is set).' =>
            'Ha be van állítva, akkor ez a cím lesz használva a kimenő értesítések boríték küldő fejléceként. Ha nincs cím beállítva, a boríték küldő fejléc üres (hacsak a SendmailNotificationEnvelopeFrom::FallbackToEmailFrom be nincs állítva).',
        'If set, this address is used as envelope sender in outgoing messages (not notifications - see below). If no address is specified, the envelope sender is equal to queue e-mail address.' =>
            'Ha be van állítva, akkor ez a cím lesz használva boríték küldőként a kimenő üzenetekben (nem értesítések - lásd lent). Ha nincs cím beállítva, a boríték küldő megegyezik a várólista e-mail címével.',
        'If this option is enabled, then the decrypted data will be stored in the database if they are displayed in AgentTicketZoom.' =>
            'Ha ez a beállítás engedélyezve van, akkor a visszafejtett adatok az adatbázisban lesznek tárolva, ha megjelenítésre kerültek az ügyintézői jegynagyítás képernyőn.',
        'If this option is set to \'Yes\', tickets created via the web interface, via Customers or Agents, will receive an autoresponse if configured. If this option is set to \'No\', no autoresponses will be sent.' =>
            'Ha ez a beállítás „Igaz” értékre van állítva, akkor a webes felületen keresztül, az ügyfelek vagy az ügyintézők által létrehozott jegyek egy automatikus választ fognak kapni, ha be van állítva. Ha ez a beállítás „Nem” értékre van állítva, nem lesznek automatikus válaszok elküldve.',
        'If this regex matches, no message will be send by the autoresponder.' =>
            'Ha ez a reguláris kifejezés illeszkedik, akkor az automatikus válaszadó nem fog üzenetet küldeni.',
        'If this setting is active, local modifications will not be highlighted as errors in the package manager and support data collector.' =>
            'Ha ez a beállítás be van kapcsolva, akkor a helyi módosítások nem lesznek hibaként kiemelve a csomagkezelőben és támogatási adatgyűjtőben.',
        'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.' =>
            '',
        'Ignore system sender article types (e. g. auto responses or email notifications) to be flagged as \'Unread Article\' in AgentTicketZoom or expanded automatically in Large view screens.' =>
            'Annak mellőzése, hogy a rendszer által küldött bejegyzéstípusok (például automatikus válaszok vagy e-mail értesítések) „olvasatlan bejegyzésként” legyenek megjelölve az ügyintézői jegynagyításban vagy automatikusan ki legyenek nyitva a nagy nézet képernyőkben.',
        'Include tickets of subqueues per default when selecting a queue.' =>
            'Az alvárólisták jegyeinek felvétele alapértelmezetten egy várólista kijelölésekor.',
        'Include unknown customers in ticket filter.' => 'Ismeretlen ügyfelek felvétele a jegyszűrőben.',
        'Includes article create times in the ticket search of the agent interface.' =>
            'Felveszi a bejegyzés létrehozási idejeit az ügyintézői felület jegy keresésénél.',
        'Incoming Phone Call.' => 'Bejövő telefonhívás.',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the command "bin/otrs.Console.pl Maint::Ticket::QueueIndexRebuild" for initial index creation.' =>
            'IndexAccelerator: a TicketViewAccelerator háttérprogram modul választásához. A „RuntimeDB” minden egyes várólista nézetet valós időben állít elő a jegytáblából (nincs teljesítmény-probléma a rendszeren körülbelül 60.000 összes jegyig és 6.000 nyitott jegyig). A „StaticDB” a legerősebb modul, amely egy további jegyindex táblát használ, amely úgy működik mint egy nézet (javasolt, ha több mint 80.000 és 6.000 nyitott jegy van a rendszeren tárolva). Használja a „bin/otrs.Console.pl Maint::Ticket::QueueIndexRebuild” parancsot a kezdeti index létrehozásához.',
        'Indonesian' => 'Indonéz',
        'Input' => 'Beviteli mező',
        'Install ispell or aspell on the system, if you want to use a spell checker. Please specify the path to the aspell or ispell binary on your operating system.' =>
            'Telepítse az ispell vagy az aspell programokat a rendszerére, ha egy helyesírás-ellenőrzőt szeretne használni. Adja meg az aspell vagy ispell bináris útvonalát az operációs rendszerén.',
        'Interface language' => 'Felület nyelve',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Lehetséges különféle felszínek beállítása, például különbséget lehet tenni az alkalmazáson belül különböző ügyintézők között tartományonkénti alapon használva. Egy reguláris kifejezés (regex) használatával beállíthat egy tartományra illeszkedő Kulcs/Tartalom párt. A „Kulcsban” lévő értéknek kell illeszkednie a tartományra, és a „Tartalomban” lévő értéknek a rendszeren lévő érvényes felszínnek kell lennie. Nézze meg a példabejegyzéseket a reguláris kifejezés megfelelő formájáért.',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Lehetséges különféle felszínek beállítása, például különbséget lehet tenni az alkalmazáson belül különböző ügyfelek között tartományonkénti alapon használva. Egy reguláris kifejezés (regex) használatával beállíthat egy tartományra illeszkedő Kulcs/Tartalom párt. A „Kulcsban” lévő értéknek kell illeszkednie a tartományra, és a „Tartalomban” lévő értéknek a rendszeren lévő érvényes felszínnek kell lennie. Nézze meg a példabejegyzéseket a reguláris kifejezés megfelelő formájáért.',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            'Lehetséges különféle témák beállítása, például különbséget lehet tenni az alkalmazáson belül ügyintézők és ügyfelek között tartományonkénti alapon használva. Egy reguláris kifejezés (regex) használatával beállíthat egy tartományra illeszkedő Kulcs/Tartalom párt. A „Kulcsban” lévő értéknek kell illeszkednie a tartományra, és a „Tartalomban” lévő értéknek a rendszeren lévő érvényes témának kell lennie. Nézze meg a példabejegyzéseket a reguláris kifejezés megfelelő formájáért.',
        'Italian' => 'Olasz',
        'Italian stop words for fulltext index. These words will be removed from the search index.' =>
            'Olasz kiszűrendő szavak a szabad-szavas indexnél. Ezek a szavak el lesznek távolítva a keresési indexből.',
        'Ivory' => 'Elefántcsont',
        'Ivory (Slim)' => 'Elefántcsont (karcsú)',
        'Japanese' => 'Japán',
        'JavaScript function for the search frontend.' => 'JavaScript függvény a keresési előtétprogramhoz.',
        'Last customer subject' => 'Legutóbbi ügyféltárgy',
        'Lastname Firstname' => 'Vezetéknév Keresztnév',
        'Lastname Firstname (UserLogin)' => 'Vezetéknév Keresztnév (Felhasználónév)',
        'Lastname, Firstname' => 'Vezetéknév, Keresztnév',
        'Lastname, Firstname (UserLogin)' => 'Vezetéknév, Keresztnév (Felhasználónév)',
        'Latvian' => 'Lett',
        'Left' => 'Bal',
        'Link Object' => 'Objektum összekapcsolása',
        'Link Object.' => 'Objektum összekapcsolása.',
        'Link agents to groups.' => 'Ügyintézők összekapcsolása csoportokkal.',
        'Link agents to roles.' => 'Ügyintézők összekapcsolása szerepekkel.',
        'Link attachments to templates.' => 'Mellékletek összekapcsolása sablonokkal.',
        'Link customer user to groups.' => 'Ügyfél-felhasználó összekapcsolása csoportokkal.',
        'Link customer user to services.' => 'Ügyfél-felhasználó összekapcsolása szolgáltatásokkal.',
        'Link queues to auto responses.' => 'Várólisták összekapcsolása automatikus válaszokkal.',
        'Link roles to groups.' => 'Szerepek összekapcsolása csoportokkal.',
        'Link templates to queues.' => 'Sablonok összekapcsolása várólistákkal.',
        'Links 2 tickets with a "Normal" type link.' => 'Összekapcsol 2 jegyet egy „Normál” típusú hivatkozással.',
        'Links 2 tickets with a "ParentChild" type link.' => 'Összekapcsol 2 jegyet egy „Szülő-gyermek” típusú hivatkozással.',
        'List of CSS files to always be loaded for the agent interface.' =>
            'CSS fájlok listája, amelyek mindig betöltődnek az ügyintézői felületnél.',
        'List of CSS files to always be loaded for the customer interface.' =>
            'CSS fájlok listája, amelyek mindig betöltődnek az ügyfélfelületnél.',
        'List of JS files to always be loaded for the agent interface.' =>
            'JS fájlok listája, amelyek mindig betöltődnek az ügyintézői felületnél.',
        'List of JS files to always be loaded for the customer interface.' =>
            'JS fájlok listája, amelyek mindig betöltődnek az ügyfélfelületnél.',
        'List of all CustomerCompany events to be displayed in the GUI.' =>
            'Az összes CustomerCompany esemény listája, amelyek megjelennek a grafikus felületen.',
        'List of all CustomerUser events to be displayed in the GUI.' => 'Az összes CustomerUser esemény listája, amelyek megjelennek a grafikus felületen.',
        'List of all DynamicField events to be displayed in the GUI.' => 'Az összes dinamikus mező esemény listája, amelyek megjelennek a grafikus felületen.',
        'List of all Package events to be displayed in the GUI.' => 'Az összes Package esemény listája, amelyek megjelennek a grafikus felületen.',
        'List of all article events to be displayed in the GUI.' => 'Az összes bejegyzés esemény listája, amelyek megjelennek a grafikus felületen.',
        'List of all queue events to be displayed in the GUI.' => 'Az összes várólista esemény listája, amelyek megjelennek a grafikus felületen.',
        'List of all ticket events to be displayed in the GUI.' => 'Az összes jegyesemény listája, amelyek megjelennek a grafikus felületen.',
        'List of default Standard Templates which are assigned automatically to new Queues upon creation.' =>
            'Az alapértelmezett szabványos sablonok listája, amelyek automatikusan hozzá vannak rendelve az új várólistákhoz a létrehozáskor.',
        'List of responsive CSS files to always be loaded for the agent interface.' =>
            'Alkalmazkodó CSS fájlok listája, amelyek mindig betöltődnek az ügyintézői felületnél.',
        'List of responsive CSS files to always be loaded for the customer interface.' =>
            'Alkalmazkodó CSS fájlok listája, amelyek mindig betöltődnek az ügyfélfelületnél.',
        'List view' => 'Listanézet',
        'Lithuanian' => 'Litván',
        'Lock / unlock this ticket' => 'Jegy zárolása vagy feloldása',
        'Locked Tickets.' => 'Zárolt jegyek.',
        'Locked ticket.' => 'Zárolt jegy.',
        'Log file for the ticket counter.' => 'Naplófájl a jegyszámlálóhoz.',
        'Logout of customer panel.' => 'Az ügyfélpanel kijelentkezése.',
        'Loop-Protection! No auto-response sent to "%s".' => 'Hurokvédelem! Nem lett automatikus válasz elküldve ide: „%s”.',
        'Mail Accounts' => 'Levelezőfiókok',
        'Main menu registration.' => 'Főmenü regisztráció.',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            'Ellenőrizteti az alkalmazással az e-mail címek MX-rekordjait egy e-mail küldésekor vagy egy telefon vagy e-mail jegy elküldésekor.',
        'Makes the application check the syntax of email addresses.' => 'Ellenőrizteti az alkalmazással az e-mail címek szintaxisát.',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            'HTML sütik használatát írja elő a munkamenet-kezelőnek. Ha a HTML sütik le vannak tiltva, vagy a kliens böngésző letiltotta a HTML sütiket, akkor a rendszer a szokásos módon fog működni, és hozzáfűzi a munkamenet-azonosítót a hivatkozásokhoz.',
        'Malay' => 'Maláj',
        'Manage OTRS Group cloud services.' => 'OTRS csoport felhőszolgáltatások kezelése.',
        'Manage PGP keys for email encryption.' => 'PGP kulcsok kezelése e-mail titkosításhoz.',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'POP3 vagy IMAP fiókok kezelése e-mailek letöltéséhez.',
        'Manage S/MIME certificates for email encryption.' => 'S/MIME tanúsítványok kezelése e-mailek titkosításához.',
        'Manage existing sessions.' => 'Meglévő munkamenetek kezelése.',
        'Manage support data.' => 'Támogatási adatok kezelése.',
        'Manage system registration.' => 'Rendszer regisztráció kezelése.',
        'Manage tasks triggered by event or time based execution.' => 'Esemény vagy időalapú végrehajtás által aktivált feladatok kezelése.',
        'Mark this ticket as junk!' => 'Jegy megjelölése szemétként!',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            'Az ügyfél-információs tábla (telefon vagy e-mail) legnagyobb mérete (karakterben) a jegyválasz képernyőn.',
        'Max size (in rows) of the informed agents box in the agent interface.' =>
            'A tájékoztatott ügyintézők doboz legnagyobb mérete (sorokban) az ügyintézői felületen.',
        'Max size (in rows) of the involved agents box in the agent interface.' =>
            'A részt vevő ügyintézők doboz legnagyobb mérete (sorokban) az ügyintézői felületen.',
        'Max size of the subjects in an email reply and in some overview screens.' =>
            'A tárgyak legnagyobb mérete egy e-mail válasznál és néhány áttekintő képernyőnél.',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            'Automatikus válaszok maximalizálása a saját e-mail címre naponta (hurok védelem).',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            'Levelek méretének maximalizálása Kbyte-ban, amelyeket POP3/POP3S/IMAP/IMAPS kapcsolaton keresztül lehet letölteni (Kbyte-ban).',
        'Maximum Number of a calendar shown in a dropdown.' => 'Egy legördülőben megjelenített naptár legnagyobb száma.',
        'Maximum length (in characters) of the dynamic field in the article of the ticket zoom view.' =>
            'A dinamikus mező legnagyobb hossza (karakterben) a jegynagyítás nézet bejegyzésében.',
        'Maximum length (in characters) of the dynamic field in the sidebar of the ticket zoom view.' =>
            'A dinamikus mező legnagyobb hossza (karakterben) a jegynagyítás nézet oldalsávján.',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            'Egy keresés eredményében megjelenített jegyek legnagyobb száma az ügyintézői felületen.',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            'Egy keresés eredményében megjelenített jegyek legnagyobb száma az ügyfélfelületen.',
        'Maximum number of tickets to be displayed in the result of this operation.' =>
            'Ennek a műveletnek az eredményében megjelenített jegyek legnagyobb száma.',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            'Az ügyfél-információs tábla legnagyobb mérete (karakterben) a jegynagyítás nézeten.',
        'Merge this ticket and all articles into a another ticket' => 'A jegy és minden bejegyzés egyesítése egy másik jegybe',
        'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.' => 'A(z) <OTRS_TICKET> jegy egyesítve a következővel: <OTRS_MERGE_TO_TICKET>.',
        'Miscellaneous' => 'Egyebek',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            'Egy modul az új jegy képernyőn lévő címzett kijelöléshez az ügyfélfelületen.',
        'Module to check if arrived emails should be marked as email-internal (because of original forwarded internal email). ArticleType and SenderType define the values for the arrived email/article.' =>
            'Egy modul annak ellenőrzéséhez, hogy a beérkező e-maileket meg kell-e jelölni belső e-mailként (az eredeti továbbított belső e-mail miatt). Az ArticleType és a SenderType határozza meg az értékeket a beérkező e-mailhez vagy bejegyzéshez.',
        'Module to check the group permissions for customer access to tickets.' =>
            'Egy modul a csoportjogosultságok ellenőrzéséhez az ügyfélnél a jegyekhez való hozzáféréshez.',
        'Module to check the group permissions for the access to tickets.' =>
            'Egy modul a csoportjogosultságok ellenőrzéséhez a jegyekhez való hozzáférésénél.',
        'Module to compose signed messages (PGP or S/MIME).' => 'Egy modul aláírt üzenetek írásához (PGP vagy S/MIME).',
        'Module to crypt composed messages (PGP or S/MIME).' => 'Egy modul a megírt üzenetek titkosításához (PGP vagy S/MIME).',
        'Module to fetch customer users SMIME certificates of incoming messages.' =>
            'Egy modul a bejövő üzenetek ügyfél-felhasználói S/MIME tanúsítványainak lekéréséhez.',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            'Egy modul a bejövő üzenetek szűréséhez és manipulálásához. Minden levélszemét blokkolása vagy mellőzése a noreply@ című feladóval.',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            'Egy modul a bejövő üzenetek szűréséhez és manipulálásához. Kérjen le egy 4 számjegyű számot a jegy szabad szöveghez, használjon reguláris kifejezést az illesztésben. Például From => \'(.+?)@.+?\', és használja a () karaktereket mint [***] ebben: Set =>.',
        'Module to filter encrypted bodies of incoming messages.' => 'Egy modul a bejövő üzenetek titkosított törzseinek szűréséhez.',
        'Module to generate accounted time ticket statistics.' => 'Egy modul az elszámolt idő jegy statisztikák előállításához.',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            'Egy modul a HTML OpenSearch profil előállításához a rövid jegykeresésnél az ügyintézői felületen.',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            'Egy modul a HTML OpenSearch profil előállításához a rövid jegykeresésnél az ügyfélfelületen.',
        'Module to generate ticket solution and response time statistics.' =>
            'Egy modul a jegy megoldás és válaszidő statisztikák előállításához.',
        'Module to generate ticket statistics.' => 'Egy modul a jegystatisztikák előállításához.',
        'Module to grant access if the CustomerID of the ticket matches the CustomerID of the customer.' =>
            'Egy modul hozzáférés megadásához, ha a jegy CustomerID mezője illeszkedik az ügyfél CustomerID mezőjére.',
        'Module to grant access if the CustomerUserID of the ticket matches the CustomerUserID of the customer.' =>
            'Egy modul hozzáférés megadásához, ha a jegy CustomerUserID mezője illeszkedik az ügyfél CustomerUserID mezőjére.',
        'Module to grant access to any agent that has been involved in a ticket in the past (based on ticket history entries).' =>
            'Egy modul hozzáférés megadásához bármely ügyintézőnek, aki régebben részt vett a jegynél (a jegyelőzmény bejegyzéseken alapulva).',
        'Module to grant access to the agent responsible of a ticket.' =>
            'Egy modul hozzáférés megadásához egy jegy felelős ügyintézőjének.',
        'Module to grant access to the creator of a ticket.' => 'Egy modul hozzáférés megadásához egy jegy létrehozójának.',
        'Module to grant access to the owner of a ticket.' => 'Egy modul hozzáférés megadásához egy jegy tulajdonosának.',
        'Module to grant access to the watcher agents of a ticket.' => 'Egy modul hozzáférés megadásához egy jegy megfigyelő ügyintézőinek.',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            'Egy modul az értesítések és eszkalációk megjelenítéséhez (ShownMax: legtöbb megjelenített eszkaláció, EscalationInMinutes: jegyek megjelenítése, amelyek eszkalálva lesznek, CacheTime: a számított eszkalációk gyorsítótára másodpercben).',
        'Module to use database filter storage.' => 'Egy modul az adatbázis-szűrő tároló használatához.',
        'Multiselect' => 'Többválasztós',
        'My Services' => 'Saját szolgáltatások',
        'My Tickets.' => 'Saját jegyek.',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            'Az egyéni várólista neve. Az egyéni várólista az előnyben részesített várólisták kiválasztása, és a beállításokban választható ki.',
        'Name of custom service. The custom service is a service selection of your preferred services and can be selected in the preferences settings.' =>
            'Az egyéni szolgáltatás neve. Az egyéni szolgáltatás az előnyben részesített szolgáltatások kiválasztása, és a beállításokban választható ki.',
        'NameX' => 'NévX',
        'Nederlands' => 'Holland',
        'New Ticket [%s] created (Q=%s;P=%s;S=%s).' => 'Az új jegy [%s] létrejött (Q=%s;P=%s;S=%s).',
        'New Window' => 'Új ablak',
        'New owner is "%s" (ID=%s).' => 'Az új tulajdonos: „%s” (ID=%s).',
        'New process ticket' => 'Új folyamatjegy',
        'New responsible is "%s" (ID=%s).' => 'Az új felelős: „%s” (ID=%s).',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'A következő lehetséges jegyállapotok egy új telefonos jegyzet hozzáadása után az ügyintézői felület jegy telefon bejövő képernyőjén.',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'A következő lehetséges jegyállapotok egy új telefonos jegyzet hozzáadása után az ügyintézői felület jegy telefon kimenő képernyőjén.',
        'None' => 'Nincs',
        'Norwegian' => 'Norvég',
        'Notification sent to "%s".' => 'Értesítés elküldve ide: „%s”.',
        'Number of displayed tickets' => 'Megjelenített jegyek száma',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            'A keresési segédprogram által megjelenített sorok száma (jegyenként) az ügyintézői felületen.',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            'Egy keresési eredmény minden egyes oldalán megjelenített jegyek száma az ügyintézői felületen.',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            'Egy keresési eredmény minden egyes oldalán megjelenített jegyek száma az ügyfélfelületen.',
        'OTRS can use one or more readonly mirror databases for expensive operations like fulltext search or statistics generation. Here you can specify the DSN for the first mirror database.' =>
            'Az OTRS képes egy vagy több csak olvasható tükör adatbázist használni az olyan költséges műveleteknél, mint például a szabad-szavas keresés vagy a statisztikák előállítása. Itt adhatja meg a DNS-t az első tükör adatbázishoz.',
        'Old: "%s" New: "%s"' => 'Régi: „%s” Új: „%s”',
        'Online' => 'Elérhető',
        'Open tickets (customer user)' => 'Nyitott jegyek (ügyfél-felhasználó)',
        'Open tickets (customer)' => 'Nyitott jegyek (ügyfél)',
        'Option' => 'Lehetőség',
        'Optional queue limitation for the CreatorCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Opcionális várólista korlátozás a CreatorCheck jogosultsági modulnál. Ha be van állítva, akkor a jogosultságok csak a jegyeknél vannak engedélyezve a megadott várólistákban.',
        'Optional queue limitation for the InvolvedCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Opcionális várólista korlátozás az InvolvedCheck jogosultsági modulnál. Ha be van állítva, akkor a jogosultságok csak a jegyeknél vannak engedélyezve a megadott várólistákban.',
        'Optional queue limitation for the OwnerCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Opcionális várólista korlátozás az OwnerCheck jogosultsági modulnál. Ha be van állítva, akkor a jogosultságok csak a jegyeknél vannak engedélyezve a megadott várólistákban.',
        'Optional queue limitation for the ResponsibleCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Opcionális várólista korlátozás a ResponsibleCheck jogosultsági modulnál. Ha be van állítva, akkor a jogosultságok csak a jegyeknél vannak engedélyezve a megadott várólistákban.',
        'Out Of Office' => 'Irodán kívül',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            'Túlterheli (újra meghatározza) a Kernel::System::Ticket helyen meglévő függvényeket. Személyre szabások könnyű hozzáadásához használható.',
        'Overview Escalated Tickets.' => 'Eszkalált jegyek áttekintése.',
        'Overview Refresh Time' => 'Áttekintő frissítési ideje',
        'Overview of all escalated tickets.' => 'Összes eszkalált jegy áttekintése.',
        'Overview of all open Tickets.' => 'Az összes nyitott jegy áttekintése.',
        'Overview of all open tickets.' => 'Összes nyitott jegy áttekintése.',
        'Overview of customer tickets.' => 'Összes ügyféljegy áttekintése.',
        'PGP Key Management' => 'PGP kulcs kezelés',
        'PGP Key Upload' => 'PGP kulcs feltöltés',
        'Package event module file a scheduler task for update registration.' =>
            'Az eseménymodul fájl csomagolása egy ütemező feladatba a regisztráció frissítéséhez.',
        'Parameters for the CreateNextMask object in the preference view of the agent interface.' =>
            'A következő maszk létrehozása objektum paraméterei az ügyintézői felület beállítás nézetében.',
        'Parameters for the CustomQueue object in the preference view of the agent interface.' =>
            'Az egyéni várólista objektum paraméterei az ügyintézői felület beállítás nézetében.',
        'Parameters for the CustomService object in the preference view of the agent interface.' =>
            'Az egyéni szolgáltatás objektum paraméterei az ügyintézői felület beállítás nézetében.',
        'Parameters for the RefreshTime object in the preference view of the agent interface.' =>
            'A frissítési idő objektum paraméterei az ügyintézői felület beállítás nézetében.',
        'Parameters for the column filters of the small ticket overview.' =>
            'Paraméterek a kis jegyáttekintő oszlopszűrőihez.',
        'Parameters for the dashboard backend of the customer company information of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Paraméterek az ügyintézői felület ügyfél-vállalat információinak vezérlőpult háttérprogramjához. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben.',
        'Parameters for the dashboard backend of the customer id status widget of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Paraméterek az ügyintézői felület ügyfél-azonosító állapot felületi elemének vezérlőpult háttérprogramjához. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben.',
        'Parameters for the dashboard backend of the customer user list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Paraméterek az ügyintézői felület ügyfél-felhasználó lista áttekintésének vezérlőpult háttérprogramjához. A „Limit” az alapértelmezetten megjelenített bejegyzések száma. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben.',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Paraméterek az ügyintézői felület új jegyek áttekintésének vezérlőpult háttérprogramjához. A „Limit” az alapértelmezetten megjelenített bejegyzések száma. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben. Megjegyzés: csak jegyattribútumok és dinamikus mezők (DynamicField_NévX) engedélyezettek a DefaultColumns értékeinél. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett.',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Paraméterek az ügyintézői felület nyitott jegyek áttekintésének vezérlőpult háttérprogramjához. A „Limit” az alapértelmezetten megjelenített bejegyzések száma. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben. Megjegyzés: csak jegyattribútumok és dinamikus mezők (DynamicField_NévX) engedélyezettek a DefaultColumns értékeinél. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett.',
        'Parameters for the dashboard backend of the queue overview widget of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "QueuePermissionGroup" is not mandatory, queues are only listed if they belong to this permission group if you enable it. "States" is a list of states, the key is the sort order of the state in the widget. "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Paraméterek az ügyintézői felület várólista áttekintő felületi elemének vezérlőpult háttérprogramjához. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „QueuePermissionGroup” nem kötelező, a várólisták csak akkor lesznek listázva, ha ehhez a jogosultság csoporthoz tartoznak, ha engedélyezi azt. A „States” az állapotok listája, a kulcs az állapot rendezési sorrendje a felületi elemen. A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben.',
        'Parameters for the dashboard backend of the running process tickets overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Paraméterek az ügyintézői felület futó folyamat jegyek áttekintésének vezérlőpult háttérprogramjához. A „Limit” az alapértelmezetten megjelenített bejegyzések száma. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben.',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Paraméterek az ügyintézői felület jegyeszkaláció áttekintésének vezérlőpult háttérprogramjához. A „Limit” az alapértelmezetten megjelenített bejegyzések száma. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben. Megjegyzés: csak jegyattribútumok és dinamikus mezők (DynamicField_NévX) engedélyezettek a DefaultColumns értékeinél. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett.',
        'Parameters for the dashboard backend of the ticket events calendar of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Paraméterek az ügyintézői felület jegy események naptárának vezérlőpult háttérprogramjához. A „Limit” az alapértelmezetten megjelenített bejegyzések száma. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben.',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Paraméterek az ügyintézői felület jegy emlékeztető függőben áttekintésének vezérlőpult háttérprogramjához. A „Limit” az alapértelmezetten megjelenített bejegyzések száma. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben. Megjegyzés: csak jegyattribútumok és dinamikus mezők (DynamicField_NévX) engedélyezettek a DefaultColumns értékeinél. Lehetséges beállítások: 0 = letiltva, 1 = elérhető, 2 = alapértelmezetten engedélyezett.',
        'Parameters for the dashboard backend of the ticket stats of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Paraméterek az ügyintézői felület jegy statisztikáinak vezérlőpult háttérprogramjához. A „Limit” az alapértelmezetten megjelenített bejegyzések száma. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben.',
        'Parameters for the dashboard backend of the upcoming events widget of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Paraméterek az ügyintézői felület közelgő események felületi elemének vezérlőpult háttérprogramjához. A „Limit” az alapértelmezetten megjelenített bejegyzések száma. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” azt határozza meg, hogy a bővítmény alapértelmezetten engedélyezve van, vagy hogy a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben.',
        'Parameters for the pages (in which the dynamic fields are shown) of the dynamic fields overview.' =>
            'Paraméterek a dinamikus mezők áttekintőjének oldalaihoz (amelyben a dinamikus mezők vannak megjelenítve).',
        'Parameters for the pages (in which the tickets are shown) of the medium ticket overview.' =>
            'Paraméterek a közepes jegyáttekintő oldalaihoz (amelyben a jegyek vannak megjelenítve).',
        'Parameters for the pages (in which the tickets are shown) of the small ticket overview.' =>
            'Paraméterek a kis jegyáttekintő oldalaihoz (amelyben a jegyek vannak megjelenítve).',
        'Parameters for the pages (in which the tickets are shown) of the ticket preview overview.' =>
            'Paraméterek a jegyelőnézet áttekintőjének oldalaihoz (amelyben a jegyek vannak megjelenítve).',
        'Parameters of the example SLA attribute Comment2.' => 'A példa Comment2 SLA jellemző paraméterei.',
        'Parameters of the example queue attribute Comment2.' => 'A példa Comment2 várólista jellemző paraméterei.',
        'Parameters of the example service attribute Comment2.' => 'A példa Comment2 szolgáltatás jellemző paraméterei.',
        'ParentChild' => 'Szülő-gyermek',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            'A naplófájl útvonala (csak akkor alkalmazza, ha „FS” lett kiválasztva a LoopProtectionModule modulnál, és nem kötelező).',
        'People' => 'Emberek',
        'Performs the configured action for each event (as an Invoker) for each configured Webservice.' =>
            'Végrehajtja a beállított műveletet minden eseménynél (mint egy meghívó) minden egyes beállított webszolgáltatáshoz.',
        'Permitted width for compose email windows.' => 'Engedélyezett szélesség az e-mail írás ablakoknál.',
        'Permitted width for compose note windows.' => 'Engedélyezett szélesség a jegyzet írás ablakoknál.',
        'Persian' => 'Perzsa',
        'Phone Call.' => 'Telefonhívás.',
        'Picture Upload' => 'Képfeltöltés',
        'Picture upload module.' => 'Fényképfeltöltés modul.',
        'Picture-Upload' => 'Képfeltöltés',
        'Polish' => 'Lengyel',
        'Portuguese' => 'Portugál',
        'Portuguese (Brasil)' => 'Portugál (Brazil)',
        'PostMaster Filters' => 'Levelezési szűrők',
        'PostMaster Mail Accounts' => 'Levelezési levélfiókok',
        'Process Management Activity Dialog GUI' => 'Folyamatkezelés tevékenység párbeszéd grafikus felület',
        'Process Management Activity GUI' => 'Folyamatkezelés tevékenység grafikus felület',
        'Process Management Path GUI' => 'Folyamatkezelés útvonal grafikus felület',
        'Process Management Transition Action GUI' => 'Folyamatkezelés átmeneti művelet grafikus felület',
        'Process Management Transition GUI' => 'Folyamatkezelés átmenet grafikus felület',
        'Process Ticket.' => 'Folyamatjegy.',
        'Process pending tickets.' => 'Függőben lévő jegyek feldolgozása.',
        'Process ticket' => 'Folyamatjegy',
        'ProcessID' => 'Folyamatazonosító',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see http://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            'CSRF (Cross Site Request Forgery - oldalon-keresztüli kéréshamisítás) exploitok elleni védelem (további információkért nézze meg a http://hu.wikipedia.org/wiki/Cross-site_request_forgery oldalt).',
        'Provides a matrix overview of the tickets per state per queue.' =>
            'Egy mátrix áttekintőt biztosít a jegyekhez állapotonként és várólistánként.',
        'Queue view' => 'Várólista nézet',
        'Rebuild the ticket index for AgentTicketQueue.' => 'Az AgentTicketQueue jegyindexének újraépítése.',
        'Recognize if a ticket is a follow-up to an existing ticket using an external ticket number.' =>
            'Annak felismerése, ha a jegy egy külső jegyszámot használó meglévő jegy követője.',
        'Refresh interval' => 'Frissítési időköz',
        'Removed subscription for user "%s".' => 'Feliratkozás eltávolítva a következő felhasználónál: „%s”.',
        'Removes the ticket watcher information when a ticket is archived.' =>
            'Eltávolítja a jegy megfigyelési információkat, ha a jegyet archiválják.',
        'Renew existing SMIME certificates from customer backend. Note: SMIME and SMIME::FetchFromCustomer needs to be active in SysConfig and customer backend needs to be configured to fetch UserSMIMECertificate attribute.' =>
            'Meglévő S/MIME tanúsítványok megújítása az ügyfél háttérprogramból. Megjegyzés: az SMIME és SMIME::FetchFromCustomer beállításoknak bekapcsolva kell lenniük a rendszerbeállításokban, és az ügyfél háttérprogramnak beállítva kell lennie a UserSMIMECertificate attribútum lekéréséhez.',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            'Kicseréli az eredeti küldőt az aktuális ügyfél e-mail címére a válasz írásakor az ügyintézői felület jegyválasz képernyőjén.',
        'Reports' => 'Jelentések',
        'Reports (OTRS Business Solution™)' => 'Jelentések (OTRS Business Solution™)',
        'Reprocess mails from spool directory that could not be imported in the first place.' =>
            'Azon levelek újrafeldolgozása a tároló könyvtárból, amelyeket nem sikerült importálni az első helyen.',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            'Egy jegy ügyfelének módosításához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            'A jegylezárás képernyő használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the email outbound screen in the agent interface.' =>
            'Az e-mail kimenő képernyő használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            'A jegyátirányítás képernyő használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            'A jegyválasz képernyő használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            'A jegytovábbítás képernyő használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            'A jegy szabad szöveg képernyő használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket merge screen of a zoomed ticket in the agent interface.' =>
            'Egy nagyított jegynek a jegyegyesítés képernyőjének használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            'A jegyjegyzet képernyő használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Egy nagyított jegynek a jegytulajdonos képernyőjének használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Egy nagyított jegynek a várakozó jegy képernyőjének használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            'A jegy telefon bejövő képernyő használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            'A jegy telefon kimenő képernyő használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Egy nagyított jegynek a jegyprioritás képernyőjének használatához szükséges jogosultságok az ügyintézői felületen.',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            'A jegyfelelős képernyő használatához szükséges jogosultságok az ügyintézői felületen.',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            'Visszaállítja és feloldja egy jegy tulajdonosát, ha az egy másik várólistába lett áthelyezve.',
        'Responsible Tickets' => 'Felelős jegyek',
        'Responsible Tickets.' => 'Felelős jegyek.',
        'Restores a ticket from the archive (only if the event is a state change to any open available state).' =>
            'Visszaállít egy jegyet az archívumból (csak akkor, ha az esemény egy állapotváltozás bármely elérhető nyitott állapotba).',
        'Retains all services in listings even if they are children of invalid elements.' =>
            'Megtartja a listázásokban lévő összes szolgáltatást akkor is, ha azok érvénytelen elemek gyermekei.',
        'Right' => 'Jobb',
        'Roles <-> Groups' => 'Szerepek <-> Csoportok',
        'Run file based generic agent jobs (Note: module name need needs to be specified in -configuration-module param e.g. "Kernel::System::GenericAgent").' =>
            'Fájlalapú általános ügyintéző feladatok futtatása (Megjegyzés: a modul nevét meg kell adni a -configuration-module paraméterben, például „Kernel::System::GenericAgent”).',
        'Running Process Tickets' => 'Futó folyamat jegyek',
        'Runs an initial wildcard search of the existing customer company when accessing the AdminCustomerCompany module.' =>
            'A meglévő ügyfél-vállalat kezdeti helyettesítő karakter keresését futtatja az AdminCustomerCompany modulhoz való hozzáféréskor.',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            'A meglévő ügyfél-felhasználók kezdeti helyettesítő karakter keresését futtatja az AdminCustomerUser modulhoz való hozzáféréskor.',
        'Runs the system in "Demo" mode. If set to "Yes", agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            '„Demo” módban futtatja a rendszert. Ha „Igen” értékre van állítva, az ügyintézők megváltoztathatják a beállításokat, mint például nyelv és téma választása, az ügyintézői webes felületen keresztül. Ezek a beállítások csak az aktuális munkamenetre érvényesek. Nem lesz lehetséges az ügyintézőknek a jelszavaik megváltoztatása.',
        'Russian' => 'Orosz',
        'S/MIME Certificate Upload' => 'S/MIME tanúsítvány feltöltés',
        'SMS' => 'SMS',
        'SMS (Short Message Service)' => 'SMS (rövid szöveges üzenet)',
        'Sample command output' => 'Minta parancskimenet',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the OTRS user. You can switch between the modules even on a system that is already in production without any loss of data. Note: Searching for attachment names is not supported when "FS" is used.' =>
            'Elmenti a bejegyzések mellékleteit. A „DB” minden adatot az adatbázisban tárol (nem ajánlott nagy mellékletek tárolásához). Az „FS” a fájlrendszeren tárolja az adatokat. Ez gyorsabb, de a webkiszolgálót az OTRS felhasználó alatt kell futtatni. Adatvesztés nélkül válthat át a modulok között még egy olyan rendszeren is, amely produktív használatban van. Megjegyzés: A mellékletnevek keresése nem támogatott „FS” használata esetén.',
        'Schedule a maintenance period.' => 'Egy karbantartási időszakot ütemez.',
        'Screen' => 'Képernyő',
        'Search Customer' => 'Ügyfél keresése',
        'Search Ticket.' => 'Jegy keresése.',
        'Search Tickets.' => 'Jegyek keresése.',
        'Search User' => 'Felhasználó keresése',
        'Search backend default router.' => 'Háttérprogram alapértelmezett útválasztó keresése.',
        'Search backend router.' => 'Háttérprogram útválasztó keresése.',
        'Search.' => 'Keresés.',
        'Second Queue' => 'Második várólista',
        'Select after which period ticket overviews should refresh automatically.' =>
            '',
        'Select how many tickets should be shown in overviews by default.' =>
            '',
        'Select the main interface language.' => '',
        'Select your frontend Theme.' => 'Válasszon előtétprogram témát.',
        'Select your preferred layout for OTRS.' => '',
        'Selects the cache backend to use.' => 'Kiválasztja a használandó gyorsítótár háttérprogramot.',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            'Kiválasztja a modult a webes felületen keresztüli feltöltések kezeléséhez. A „DB” minden feltöltést adatbázisban tárol, az „FS” a fájlrendszert használja.',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). "Random" generates randomized ticket numbers in the format "SystemID.Random" (e.g. 100057866352, 103745394596).' =>
            'Kiválasztja a jegyszám előállító modult. Az „AutoIncrement” növeli a jegyszámot, a rendszer azonosító és a számláló rendszerazonosító.számláló formátumban lesz használva (például 1010138, 1010139). A „Date” választásával a jegyszámok az aktuális dátum, a rendszer azonosító és a számláló alapján lesznek előállítva. A formátum év.hónap.nap.rendszerazonosító.számláló kinézetű lesz (például 200206231010138, 200206231010139). A „DateChecksum” választásával a számláló ellenőrzőösszegként lesz hozzáfűzve a dátum és a rendszer azonosító karakterláncához. Az ellenőrzőösszeg forgatva lesz minden nap. A formátum év.hónap.nap.rendszerazonosító.számláló.ellenőrzőösszeg kinézetű lesz (például 2002070110101520, 2002070110101535). A „Random” véletlenszerű jegyszámokat állít elő „rendszerazonosító.véletlen” formátumban (például 100057866352, 103745394596).',
        'Send new outgoing mail from this ticket' => 'Új kimenő levél küldése erről a jegyről',
        'Send notifications to users.' => 'Értesítések küldése a felhasználóknak.',
        'Sender type for new tickets from the customer inteface.' => 'Az új jegyek küldőtípusa az ügyfélfelületről.',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            'Csak a tulajdonosnak küld ügyintéző követő értesítést, ha a jegy fel van oldva (az alapértelmezett, hogy minden ügyintézőnek elküldi az értesítést).',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            'Elküld minden kimenő e-mailt titkos másolatként egy megadott címre. Ez csak biztonsági mentés céljából használja.',
        'Sends customer notifications just to the mapped customer.' => 'Az ügyfél értesítéseket csak a leképezett ügyfélnek küldi el.',
        'Sends registration information to OTRS group.' => 'Regisztrációs információkat küld az OTRS csoportnak.',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            'Elküldi a feloldott jegy emlékeztető értesítéseit az emlékeztető dátum elérése után (csak a jegy tulajdonosának küldi).',
        'Sends the notifications which are configured in the admin interface under "Notfication (Event)".' =>
            'Elküldi azokat az értesítéseket, amelyek az adminisztrációs felületen az „Értesítés (esemény)” alatt vannak beállítva.',
        'Serbian Cyrillic' => 'Szerb (cirill)',
        'Serbian Latin' => 'Szerb (latin)',
        'Service view' => 'Szolgáltatás nézet',
        'ServiceView' => 'Szolgáltatás nézet',
        'Set a new password by filling in your current password and a new one.' =>
            '',
        'Set minimum loglevel. If you select \'error\', just errors are logged. With \'debug\' you get all logging messages.' =>
            'Legkisebb naplózási szint beállítása. Ha a „hibát” választja, akkor csak a hibák lesznek naplózva. A „hibakeresés” lehetőséggel minden naplózási üzenetet megkap.',
        'Set sender email addresses for this system.' => 'A küldő e-mail címeinek beállítása a rendszerhez.',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'A beágyazott HTML bejegyzések alapértelmezett magasságának beállítása (képpontban) az ügyintézői jegynagyítás képernyőn.',
        'Set the limit of tickets that will be executed on a single genericagent job execution.' =>
            'Azon jegyek korlátjának beállítása, amelyek egy egyedüli genericagent feladat végrehajtásakor lesznek végrehajtva.',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'A beágyazott HTML bejegyzések legnagyobb magasságának beállítása (képpontban) az ügyintézői jegynagyítás képernyőn.',
        'Set this to yes if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            'Állítsa ezt igenre, ha megbízik minden nyilvános és személyes PGP kulcsban még akkor is, ha azok nincsenek egy megbízható aláírással tanúsítva.',
        'Sets if SLA must be selected by the agent.' => 'Beállítja, hogy az ügyintézőnek ki kell választania az SLA-t.',
        'Sets if SLA must be selected by the customer.' => 'Beállítja, hogy az ügyfélnek ki kell választania az SLA-t.',
        'Sets if note must be filled in by the agent. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Beállítja, hogy a jegyzetet ki kell-e töltenie az ügyintézőnek. Felülírható a Ticket::Frontend::NeedAccountedTime használatával.',
        'Sets if service must be selected by the agent.' => 'Beállítja, hogy az ügyintézőnek ki kell választania a szolgáltatást.',
        'Sets if service must be selected by the customer.' => 'Beállítja, hogy az ügyfélnek ki kell választania a szolgáltatást.',
        'Sets if ticket owner must be selected by the agent.' => 'Beállítja, hogy az ügyintézőnek ki kell választania a jegy tulajdonosát.',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            'Egy jegy várakozási idejét 0-ra állítja, ha az állapot egy nem várakozó állapotra változik.',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            'Beállítja az életkort percben (első szint) a várólisták kiemeléséhez, amelyek érintetlen jegyeket tartalmaznak.',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            'Beállítja az életkort percben (második szint) a várólisták kiemeléséhez, amelyek érintetlen jegyeket tartalmaznak.',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            'Beállítja az adminisztrátor beállítási szintjét. A beállítási szinttől függően néhány rendszerbeállítás nem lesz megjelenítve. A beállítási szintek növekvő sorrendben vannak: szakértő, haladó, kezdő. A magasabb a beállítási szint (például a kezdő a legmagasabb), a legkevésbé valószínű, hogy a felhasználó véletlenül úgy állítsa be a rendszert, hogy az többé ne legyen használható.',
        'Sets the count of articles visible in preview mode of ticket overviews.' =>
            'Beállítja a jegyáttekintők előnézeti módjában látható bejegyzések számát.',
        'Sets the default article type for new email tickets in the agent interface.' =>
            'Beállítja az alapértelmezett bejegyzéstípust az új e-mail jegyekhez az ügyintézői felületen.',
        'Sets the default article type for new phone tickets in the agent interface.' =>
            'Beállítja az alapértelmezett bejegyzéstípust az új telefonos jegyekhez az ügyintézői felületen.',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            'Beállítja az alapértelmezett törzsszöveget az ügyintézői felület jegylezárás képernyőjén hozzáadott jegyzeteknél.',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            'Beállítja az alapértelmezett törzsszöveget az ügyintézői felület jegyáthelyezés képernyőjén hozzáadott jegyzeteknél.',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            'Beállítja az alapértelmezett törzsszöveget az ügyintézői felület jegyjegyzet képernyőjén hozzáadott jegyzeteknél.',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Beállítja az alapértelmezett törzsszöveget egy nagyított jegynek a jegytulajdonos képernyőjén hozzáadott jegyzeteknél az ügyintézői felületen.',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Beállítja az alapértelmezett törzsszöveget egy nagyított jegynek a várakozó jegy képernyőjén hozzáadott jegyzeteknél az ügyintézői felületen.',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Beállítja az alapértelmezett törzsszöveget egy nagyított jegynek a jegyprioritás képernyőjén hozzáadott jegyzeteknél az ügyintézői felületen.',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            'Beállítja az alapértelmezett törzsszöveget az ügyintézői felület jegyfelelős képernyőjén hozzáadott jegyzeteknél.',
        'Sets the default error message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Beállítja az alapértelmezett hibaüzenetet az ügyintézői és az ügyfélfelület bejelentkező képernyőjén, amely akkor jelenik meg, ha egy futó rendszerkarbantartás időszak aktív.',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            'Beállítja a felosztott jegyek alapértelmezett hivatkozás típusát az ügyintézői felületen.',
        'Sets the default message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Beállítja az alapértelmezett üzenetet az ügyintézői és az ügyfélfelület bejelentkező képernyőjén, amely akkor jelenik meg, ha egy futó rendszerkarbantartás időszak aktív.',
        'Sets the default message for the notification is shown on a running system maintenance period.' =>
            'Beállítja a megjelenített értesítés alapértelmezett üzenetét a futó rendszerkarbantartás időszaknál.',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            'Beállítja az új telefonos jegyek alapértelmezett következő állapotát az ügyintézői felületen.',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            'Beállítja az alapértelmezett következő jegyállapotot egy e-mail jegy létrehozása után az ügyintézői felületen.',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            'Beállítja az alapértelmezett jegyzetszöveget az új telefonos jegyeknél. Például „Új jegy híváson keresztül” az ügyintézői felületen.',
        'Sets the default priority for new email tickets in the agent interface.' =>
            'Beállítja az alapértelmezett prioritást az új e-mail jegyeknél az ügyintézői felületen.',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            'Beállítja az alapértelmezett prioritást az új telefonos jegyeknél az ügyintézői felületen.',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            'Beállítja az alapértelmezett küldőtípust az új e-mail jegyeknél az ügyintézői felületen.',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            'Beállítja az alapértelmezett küldőtípust az új telefonos jegyeknél az ügyintézői felületen.',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            'Beállítja az alapértelmezett tárgyat az új e-mail jegyeknél (például „kimenő e-mail”) az ügyintézői felületen.',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            'Beállítja az alapértelmezett tárgyat az új telefonos jegyeknél (például „telefonhívás”) az ügyintézői felületen.',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            'Beállítja az alapértelmezett tárgyat az ügyintézői felület jegylezárás képernyőjén hozzáadott jegyzeteknél.',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            'Beállítja az alapértelmezett tárgyat az ügyintézői felület jegyáthelyezés képernyőjén hozzáadott jegyzeteknél.',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            'Beállítja az alapértelmezett tárgyat az ügyintézői felület jegyjegyzet képernyőjén hozzáadott jegyzeteknél.',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Beállítja az alapértelmezett tárgyat egy nagyított jegynek a jegytulajdonos képernyőjén hozzáadott jegyzeteknél az ügyintézői felületen.',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Beállítja az alapértelmezett tárgyat egy nagyított jegynek a várakozó jegy képernyőjén hozzáadott jegyzeteknél az ügyintézői felületen.',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Beállítja az alapértelmezett tárgyat egy nagyított jegynek a jegyprioritás képernyőjén hozzáadott jegyzeteknél az ügyintézői felületen.',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            'Beállítja az alapértelmezett tárgyat az ügyintézői felület jegyfelelős képernyőjén hozzáadott jegyzeteknél.',
        'Sets the default text for new email tickets in the agent interface.' =>
            'Beállítja az alapértelmezett szöveget az új e-mail jegyeknél az ügyintézői felületen.',
        'Sets the display order of the different items in the preferences view.' =>
            'Beállítja a különböző elemek megjelenítési sorrendjét a beállítások nézeten.',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is logged out.' =>
            'Beállítja az inaktivitás idejét (másodpercben) átadásra, mielőtt egy munkamenetet kilő és egy felhasználót kijelentkeztet.',
        'Sets the maximum number of active agents within the timespan defined in SessionActiveTime before a prior warning will be visible for the logged in agents.' =>
            'Beállítja az aktív ügyintézők legnagyobb számát a SessionActiveTime modulon meghatározott időtartamon belül, mielőtt egy előzetes figyelmeztetés lesz látható a bejelentkezett ügyintézőnél.',
        'Sets the maximum number of active agents within the timespan defined in SessionActiveTime.' =>
            'Beállítja az aktív ügyintézők legnagyobb számát a SessionActiveTime modulon meghatározott időtartamon belül.',
        'Sets the maximum number of active customers within the timespan defined in SessionActiveTime.' =>
            'Beállítja az aktív ügyfelek legnagyobb számát a SessionActiveTime modulon meghatározott időtartamon belül.',
        'Sets the maximum number of active sessions per agent within the timespan defined in SessionActiveTime.' =>
            'Beállítja az ügyintézőnkénti aktív munkamenetek legnagyobb számát a SessionActiveTime modulon meghatározott időtartamon belül.',
        'Sets the maximum number of active sessions per customers within the timespan defined in SessionActiveTime.' =>
            'Beállítja az ügyfelenkénti aktív munkamenetek legnagyobb számát a SessionActiveTime modulon meghatározott időtartamon belül.',
        'Sets the minimal ticket counter size if "AutoIncrement" was selected as TicketNumberGenerator. Default is 5, this means the counter starts from 10000.' =>
            'Beállítja a legkisebb jegyszámlálóméretet, ha „Automatikus növelés” lett kiválasztva jegyszám-előállítóként. Alapértelmezetten 5, amely azt jelenti, hogy a számláló 10000-től indul.',
        'Sets the minutes a notification is shown for notice about upcoming system maintenance period.' =>
            'Beállítja, hogy egy értesítés hány percig legyen látható a közelgő rendszerkarbantartás időszakról szóló értesítésről.',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            'Beállítja a szöveges üzenetekben megjelenített sorok számát (például a QueueZoom modulban lévő jegy sorok).',
        'Sets the options for PGP binary.' => 'Beállítja a PGP bináris beállításait.',
        'Sets the order of the different items in the customer preferences view.' =>
            'Beállítja a különböző elemek sorrendjét az ügyfél beállítások nézetén.',
        'Sets the password for private PGP key.' => 'Beállítja a személyes PGP kulcs jelszavát.',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            'Beállítja az előnyben részesített időegységeket (például munkaegység, óra, perc).',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            'Beállítja a kiszolgálón lévő parancsfájlok mappájának előtagját, ahogy a webkiszolgálón be van állítva. Ezt a beállítást az OTRS_CONFIG_ScriptAlias változójaként használják, amely az alkalmazás által használt üzenetküldés összes űrlapján megtalálható a jegyekre mutató hivatkozások készítéséhez a rendszeren belül.',
        'Sets the queue in the ticket close screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a várólistát egy nagyított jegynek a jegylezárás képernyőjén az ügyintézői felületen.',
        'Sets the queue in the ticket free text screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a várólistát egy nagyított jegynek a jegy szabad szöveg képernyőjén az ügyintézői felületen.',
        'Sets the queue in the ticket note screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a várólistát egy nagyított jegynek a jegyjegyzet képernyőjén az ügyintézői felületen.',
        'Sets the queue in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a várólistát egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Sets the queue in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a várólistát egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen.',
        'Sets the queue in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a várólistát egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Sets the queue in the ticket responsible screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a várólistát egy nagyított jegynek a jegyfelelős képernyőjén az ügyintézői felületen.',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            'Beállítja a jegy felelős ügyintézőjét az ügyintézői felület jegylezárás képernyőjén.',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            'Beállítja a jegy felelős ügyintézőjét az ügyintézői felület jegy tömeges képernyőjén.',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            'Beállítja a jegy felelős ügyintézőjét az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            'Beállítja a jegy felelős ügyintézőjét az ügyintézői felület jegyjegyzet képernyőjén.',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a jegy felelős ügyintézőjét egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a jegy felelős ügyintézőjét egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen.',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a jegy felelős ügyintézőjét egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            'Beállítja a jegy felelős ügyintézőjét az ügyintézői felület jegyfelelős képernyőjén.',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Beállítja a szolgáltatást az ügyintézői felület jegylezárás képernyőjén (a Ticket::Service modulnak aktiválva kell lennie).',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Beállítja a szolgáltatást az ügyintézői felület jegy szabad szöveg képernyőjén (a Ticket::Service modulnak aktiválva kell lennie).',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Beállítja a szolgáltatást az ügyintézői felület jegyjegyzet képernyőjén (a Ticket::Service modulnak aktiválva kell lennie).',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Beállítja a szolgáltatást egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen (a Ticket::Service modulnak aktiválva kell lennie).',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Beállítja a szolgáltatást egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen (a Ticket::Service modulnak aktiválva kell lennie).',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).' =>
            'Beállítja a szolgáltatást egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen (a Ticket::Service modulnak aktiválva kell lennie).',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Beállítja a szolgáltatást az ügyintézői felület jegyfelelős képernyőjén (a Ticket::Service modulnak aktiválva kell lennie).',
        'Sets the state of a ticket in the close ticket screen of the agent interface.' =>
            'Beállítja egy jegy állapotát az ügyintézői felület jegylezárás képernyőjén.',
        'Sets the state of a ticket in the ticket bulk screen of the agent interface.' =>
            'Beállítja egy jegy állapotát az ügyintézői felület jegy tömeges képernyőjén.',
        'Sets the state of a ticket in the ticket free text screen of the agent interface.' =>
            'Beállítja egy jegy állapotát az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Sets the state of a ticket in the ticket note screen of the agent interface.' =>
            'Beállítja egy jegy állapotát az ügyintézői felület jegyjegyzet képernyőjén.',
        'Sets the state of a ticket in the ticket responsible screen of the agent interface.' =>
            'Beállítja egy jegy állapotát az ügyintézői felület jegyfelelős képernyőjén.',
        'Sets the state of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Beállítja egy jegy állapotát egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Sets the state of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Beállítja egy jegy állapotát egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen.',
        'Sets the state of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Beállítja egy jegy állapotát egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Sets the stats hook.' => 'Beállítja a statisztikai horgokat.',
        'Sets the system time zone (required a system with UTC as system time). Otherwise this is a diff time to the local time.' =>
            'Beállítja a rendszer időzónáját (egy UTC-vel rendelkező rendszer szükséges rendszeridőként). Egyébként ez egy időeltérés a helyi időhöz képest.',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            'Beállítja a jegy tulajdonosát az ügyintézői felület jegylezárás képernyőjén.',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            'Beállítja a jegy tulajdonosát az ügyintézői felület jegy tömeges képernyőjén.',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            'Beállítja a jegy tulajdonosát az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            'Beállítja a jegy tulajdonosát az ügyintézői felület jegyjegyzet képernyőjén.',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a jegy tulajdonosát egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a jegy tulajdonosát egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen.',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Beállítja a jegy tulajdonosát egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            'Beállítja a jegy tulajdonosát az ügyintézői felület jegyfelelős képernyőjén.',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Beállítja a jegy típusát az ügyintézői felület jegylezárás képernyőjén (a Ticket::Type modulnak aktiválva kell lennie).',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            'Beállítja a jegy típusát az ügyintézői felület jegy tömeges képernyőjén.',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Beállítja a jegy típusát az ügyintézői felület jegy szabad szöveg képernyőjén (a Ticket::Type modulnak aktiválva kell lennie).',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Beállítja a jegy típusát az ügyintézői felület jegyjegyzet képernyőjén (a Ticket::Type modulnak aktiválva kell lennie).',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Beállítja a jegy típusát egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen (a Ticket::Type modulnak aktiválva kell lennie).',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Beállítja a jegy típusát egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen (a Ticket::Type modulnak aktiválva kell lennie).',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).' =>
            'Beállítja a jegy típusát egy nagyított jegynek a jegy prioritás képernyőjén az ügyintézői felületen (a Ticket::Type modulnak aktiválva kell lennie).',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Beállítja a jegy típusát az ügyintézői felület jegyfelelős képernyőjén (a Ticket::Type modulnak aktiválva kell lennie).',
        'Sets the time (in seconds) a user is marked as active (minimum active time is 300 seconds).' =>
            'Beállítja az időt (másodpercben), ami után a felhasználó aktívként van megjelölve (a legkisebb aktív idő 300 másodperc).',
        'Sets the timeout (in seconds) for http/ftp downloads.' => 'Beállítja az időkorlátot (másodpercben) a HTTP/FTP letöltésekhez.',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            'Beállítja az időkorlátot (másodpercben) a csomagletöltésekhez. Felülírja a „WebUserAgent::Timeout” beállítást.',
        'Sets the user time zone per user (required a system with UTC as system time and UTC under TimeZone). Otherwise this is a diff time to the local time.' =>
            'Beállítja a felhasználó időzónáját felhasználónként (egy UTC-vel rendelkező rendszer szükséges rendszeridőként és az időzóna alatti UTC) Egyébként ez egy időeltérés a helyi időhöz képest.',
        'Sets the user time zone per user based on java script / browser time zone offset feature at login time.' =>
            'Beállítja a felhasználó időzónáját felhasználónként a bejelentkezéskor vett JavaScript / böngésző időzóna eltolás szolgáltatáson alapulva.',
        'Shared Secret' => 'Megosztott titok',
        'Should the cache data be held in memory?' => 'A gyorsítótár adatait a memóriában kell tartani?',
        'Should the cache data be stored in the selected cache backend?' =>
            'El kell tárolni a gyorsítótárazott adatokat a kijelölt gyorsítótár háttérprogramban?',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            'Egy felelős kiválasztás megjelenítése a telefon és e-mail jegyekben az ügyintézői felületen.',
        'Show article as rich text even if rich text writing is disabled.' =>
            'Bejegyzés megjelenítése RichTextként még akkor is, ha a RichText írás le van tiltva.',
        'Show queues even when only locked tickets are in.' => 'Várólisták megjelenítése még akkor is, ha csak zárolt jegyek vannak bennük.',
        'Show the current owner in the customer interface.' => 'Az aktuális tulajdonos megjelenítése az ügyfélfelületen.',
        'Show the current queue in the customer interface.' => 'Az aktuális várólista megjelenítése az ügyfélfelületen.',
        'Show the history for this ticket' => 'Előzmények megjelenítése ennél a jegynél',
        'Shows a count of icons in the ticket zoom, if the article has attachments.' =>
            'Megjeleníti az ikonok számát a jegynagyításban, ha a bejegyzésnek mellékletei vannak.',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegyre történő feliratkozáshoz vagy leiratkozáshoz az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.  Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben, amely lehetővé teszi egy jegy összekapcsolását egy másik objektummal az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben, amely lehetővé teszi a jegyek egyesítését az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy előzményeinek hozzáféréséhez az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy szabad szövegmező hozzáadásához az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegyzet hozzáadásához az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegyhez történő jegyzet hozzáadásához az ügyintézői felület összes jegyáttekintőjében.',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegylezárásához az ügyintézői felület összes jegyáttekintőjében.',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy lezárásához az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy törléséhez az ügyintézői felület összes jegyáttekintőjében. A hivatkozás megjelenítéséhez vagy elrejtéséhez további hozzáférés vezérlő készíthető a „Group” kulcs és az „rw:csoport1;move_into:csoport2” értékhez hasonló tartalom használatával.',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy törléséhez az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to enroll a ticket into a process in the ticket zoom view of the agent interface.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy besorolásához egy folyamatba az ügyintézői felület jegynagyítás nézetében.',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben a visszalépéshez az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy zárolásához vagy feloldásához az ügyintézői felület jegyáttekintőiben.',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben a jegyek zárolásához vagy feloldásához az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy áthelyezéséhez az ügyintézői felület összes jegyáttekintőjében.',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy vagy egy bejegyzés nyomtatásához az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to see the customer who requested the ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben az ügyintézői felület jegynagyítás nézetében annak az ügyfélnek a megtekintéséhez, aki a jegyet kérte. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy előzményeinek megtekintéséhez az ügyintézői felület összes jegyáttekintőjében.',
        'Shows a link in the menu to see the owner of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy tulajdonosának megtekintéséhez az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy prioritásának megtekintéséhez az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to see the responsible agent of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy felelős ügyintézőjének megtekintéséhez az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to send an outbound email in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy kimenő e-mail küldéséhez az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to set a ticket as junk in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy szemétként való megjelöléséhez az ügyintézői felület összes jegyáttekintőjében. A hivatkozás megjelenítéséhez vagy elrejtéséhez további hozzáférés vezérlő készíthető a „Group” kulcs és az „rw:csoport1;move_into:csoport2” értékhez hasonló tartalom használatával.',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy függőben lévőre állításához az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy prioritásának beállításához az ügyintézői felület összes jegyáttekintőjében.',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            'Egy hivatkozást jelenít meg a menüben egy jegy nagyításához az ügyintézői felület jegyáttekintőiben.',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            'Egy hivatkozást jelenít meg a bejegyzés mellékleteinek hozzáféréséhez egy online HTML megjelenítőn keresztül a bejegyzés nagyítás nézetén az ügyintézői felületen.',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            'Egy hivatkozást jelenít meg a bejegyzés mellékleteinek letöltéséhez a bejegyzés nagyítás nézetén az ügyintézői felületen.',
        'Shows a link to see a zoomed email ticket in plain text.' => 'Egy hivatkozást jelenít meg egy nagyított e-mail jegy egyszerű szöveges megtekintéséhez.',
        'Shows a link to set a ticket as junk in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Egy hivatkozást jelenít meg egy jegy szemétként történő beállításához az ügyintézői felület jegynagyítás nézetében. Ezen hivatkozás megjelenítéséhez vagy meg nem jelenítéséhez további hozzáférési vezérlőt lehet készíteni a „Group” kulcs és az „rw:csoport1;move_into:csoport2” tartalomhoz hasonló használatával. A menüpontok csoportokba rendezéséhez használja a „ClusterName” kulcsot bármilyen olyan tartalommal, amelyet a felhasználói felületen látni szeretne. Használja a „ClusterPriority” kulcsot egy bizonyos fürt sorrendjének beállításához az eszköztáron belül.',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            'Megjeleníti a jegynél részt vett összes ügyintéző listáját az ügyintézői felület jegylezárás képernyőjén.',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            'Megjeleníti a jegynél részt vett összes ügyintéző listáját az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            'Megjeleníti a jegynél részt vett összes ügyintéző listáját az ügyintézői felület jegyjegyzet képernyőjén.',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti a jegynél részt vett összes ügyintéző listáját egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti a jegynél részt vett összes ügyintéző listáját egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen.',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti a jegynél részt vett összes ügyintéző listáját egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            'Megjeleníti a jegynél részt vett összes ügyintéző listáját az ügyintézői felület jegyfelelős képernyőjén.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            'Megjeleníti az összes lehetséges ügyintéző listáját (minden ügyintéző, aki jegyzet jogosultsággal rendelkezik a várólistán vagy jegyen) annak meghatározásához, hogy kit kell értesíteni erről a jegyzetről az ügyintézői felület jegylezárás képernyőjén.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            'Megjeleníti az összes lehetséges ügyintéző listáját (minden ügyintéző, aki jegyzet jogosultsággal rendelkezik a várólistán vagy jegyen) annak meghatározásához, hogy kit kell értesíteni erről a jegyzetről az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            'Megjeleníti az összes lehetséges ügyintéző listáját (minden ügyintéző, aki jegyzet jogosultsággal rendelkezik a várólistán vagy jegyen) annak meghatározásához, hogy kit kell értesíteni erről a jegyzetről az ügyintézői felület jegyjegyzet képernyőjén.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti az összes lehetséges ügyintéző listáját (minden ügyintéző, aki jegyzet jogosultsággal rendelkezik a várólistán vagy jegyen) annak meghatározásához, hogy kit kell értesíteni erről a jegyzetről egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti az összes lehetséges ügyintéző listáját (minden ügyintéző, aki jegyzet jogosultsággal rendelkezik a várólistán vagy jegyen) annak meghatározásához, hogy kit kell értesíteni erről a jegyzetről egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti az összes lehetséges ügyintéző listáját (minden ügyintéző, aki jegyzet jogosultsággal rendelkezik a várólistán vagy jegyen) annak meghatározásához, hogy kit kell értesíteni erről a jegyzetről egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            'Megjeleníti az összes lehetséges ügyintéző listáját (minden ügyintéző, aki jegyzet jogosultsággal rendelkezik a várólistán vagy jegyen) annak meghatározásához, hogy kit kell értesíteni erről a jegyzetről az ügyintézői felület jegyfelelős képernyőjén.',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            'Megjeleníti a jegyáttekintő előnézetét (CustomerInfo => 1 - az ügyfél-információt is megjeleníti, a CustomerInfoMaxSize az ügyfél-információ legnagyobb mérete karakterben).',
        'Shows a select of ticket attributes to order the queue view ticket list. The possible selections can be configured via \'TicketOverviewMenuSort###SortAttributes\'.' =>
            'Megjeleníti a jegyjellemzők kijelölését a várólista nézet jegylista rendezéséhez. A lehetséges kijelöléseket a „TicketOverviewMenuSort###SortAttributes” beállításon keresztül lehet beállítani.',
        'Shows all both ro and rw queues in the queue view.' => 'Megjeleníti a csak olvasható és az írható, olvasható várólistákat is a várólista nézetben.',
        'Shows all both ro and rw tickets in the service view.' => 'Megjeleníti a csak olvasható és az írható, olvasható jegyeket is a szolgáltatás nézetben.',
        'Shows all open tickets (even if they are locked) in the escalation view of the agent interface.' =>
            'Megjelenít minden nyitott jegyet (akkor is, ha zárolt) az ügyintézői felület eszkalációs nézetében.',
        'Shows all open tickets (even if they are locked) in the status view of the agent interface.' =>
            'Megjelenít minden nyitott jegyet (akkor is, ha zárolt) az ügyintézői felület állapot nézetében.',
        'Shows all the articles of the ticket (expanded) in the zoom view.' =>
            'Megjeleníti a jegy összes bejegyzését (kinyitva) a nagyítás nézetben.',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            'Megjeleníti az összes ügyfél-azonosítót egy többválasztós mezőben (nem hasznos, ha nagyon sok ügyfél-azonosítója van).',
        'Shows all the customer user identifiers in a multi-select field (not useful if you have a lot of customer user identifiers).' =>
            '',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            'Megjelenít egy tulajdonos kijelölést a telefon és e-mail jegyekben az ügyintézői felületen.',
        'Shows colors for different article types in the article table.' =>
            'Színeket jelenít meg a különböző bejegyzéstípusokhoz a bejegyzéstáblázatban.',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            'Ügyfélelőzmény jegyeket jelenít meg az ügyintézői telefonos jegy, az ügyintézői e-mail jegy és az ügyintézői ügyféljegy képernyőkön.',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            'Vagy a legutolsó ügyfél bejegyzés tárgyát, vagy a jegy címét jeleníti meg a kis formátumú áttekintőben.',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            'Megjeleníti a meglévő szülő vagy gyermek várólisták listáit a rendszeren fa vagy lista formában.',
        'Shows information on how to start OTRS Daemon' => 'Információkat jelenít meg arról, hogy hogyan indítsa az OTRS démont',
        'Shows the activated ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            'Megjeleníti az aktivált jegyjellemzőket az ügyfélfelületen (0 = Letiltva és 1 = Engedélyezve).',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            'Megjeleníti a bejegyzéseket normálisan vagy fordítottan rendezve a jegynagyítás alatt az ügyintézői felületen.',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            'Megjeleníti az ügyfél-felhasználó információit (telefon vagy e-mail) a válasz képernyőn.',
        'Shows the customer user\'s info in the ticket zoom view.' => 'Megjeleníti az ügyfél-felhasználó információit a jegynagyítás nézetben.',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually.' =>
            'Megjeleníti a nap üzenetét (MOTD) az ügyintézői vezérlőpulton. A „Group” használható a hozzáférés korlátozásához a bővítményre (például Group: admin;csoport1;csoport2;). A „Default” jelzi, ha a bővítmény alapértelmezetten engedélyezve van, vagy ha a felhasználónak kézzel kell engedélyeznie azt.',
        'Shows the message of the day on login screen of the agent interface.' =>
            'Megjeleníti a nap üzenetét az ügyintézői felület bejelentkező képernyőjén.',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            'Megjeleníti a jegy előzményeket (fordítottan rendezve) az ügyintézői felületen.',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            'Megjeleníti a jegyprioritás lehetőségeit az ügyintézői felület jegylezárás képernyőjén.',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            'Megjeleníti a jegyprioritás lehetőségeit az ügyintézői felület jegyáthelyezés képernyőjén.',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            'Megjeleníti a jegyprioritás lehetőségeit az ügyintézői felület jegy tömeges képernyőjén.',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            'Megjeleníti a jegyprioritás lehetőségeit az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            'Megjeleníti a jegyprioritás lehetőségeit az ügyintézői felület jegyjegyzet képernyőjén.',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti a jegyprioritás lehetőségeit egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti a jegyprioritás lehetőségeit egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen.',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti a jegyprioritás lehetőségeit egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            'Megjeleníti a jegyprioritás lehetőségeit az ügyintézői felület jegyfelelős képernyőjén.',
        'Shows the title field in the ticket free text screen of the agent interface.' =>
            'Megjeleníti a cím mezőt az ügyintézői felület jegy szabad szöveg képernyőjén.',
        'Shows the title fields in the close ticket screen of the agent interface.' =>
            'Megjeleníti a cím mezőket az ügyintézői felület jegylezárás képernyőjén.',
        'Shows the title fields in the ticket note screen of the agent interface.' =>
            'Megjeleníti a cím mezőket az ügyintézői felület jegyjegyzet képernyőjén.',
        'Shows the title fields in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti a cím mezőket egy nagyított jegynek a jegytulajdonos képernyőjén az ügyintézői felületen.',
        'Shows the title fields in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti a cím mezőket egy nagyított jegynek a várakozó jegy képernyőjén az ügyintézői felületen.',
        'Shows the title fields in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Megjeleníti a cím mezőket egy nagyított jegynek a jegyprioritás képernyőjén az ügyintézői felületen.',
        'Shows the title fields in the ticket responsible screen of the agent interface.' =>
            'Megjeleníti a cím mezőket az ügyintézői felület jegyfelelős képernyőjén.',
        'Shows time in long format (days, hours, minutes), if set to "Yes"; or in short format (days, hours), if set to "No".' =>
            'Hosszú formátumban jeleníti meg az időt (nap, óra, perc), ha „Igen” értékre van állítva, vagy rövid formátumban (nap, óra), ha „Nem” értékű.',
        'Shows time use complete description (days, hours, minutes), if set to "Yes"; or just first letter (d, h, m), if set to "No".' =>
            'A teljes leírás használatával jeleníti meg az időt (nap, óra, perc), ha „Igen” értékre van állítva, vagy csak az első betűt (n, ó, p), ha „Nem” értékre van állítva.',
        'Simple' => 'Egyszerű',
        'Skin' => 'Felszín',
        'Slovak' => 'Szlovák',
        'Slovenian' => 'Szlovén',
        'Software Package Manager.' => 'Szoftvercsomag-kezelő.',
        'SolutionDiffInMin' => 'SolutionDiffInMin',
        'SolutionInMin' => 'SolutionInMin',
        'Some description!' => 'Egy kis leírás!',
        'Some picture description!' => 'Egy kis képleírás!',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            'Rendezi a jegyeket (növekvően vagy csökkenően), ha egyedüli várólista van kiválasztva a várólista nézetben, és miután a jegyek prioritás szerint lettek rendezve. Értékek: 0 = növekvő (legrégebbi felül, alapértelmezett), 1 = csökkenő (legfiatalabb felül). Használja a várólista-azonosítót a kulcshoz és a 0 vagy az 1 számjegyeket az értékhez.',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the service view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the ServiceID for the key and 0 or 1 for value.' =>
            'Rendezi a jegyeket (növekvően vagy csökkenően), ha egyedüli várólista van kiválasztva a szolgáltatás nézetben, és miután a jegyek prioritás szerint lettek rendezve. Értékek: 0 = növekvő (legrégebbi felül, alapértelmezett), 1 = csökkenő (legfiatalabb felül). Használja a szolgáltatás-azonosítót a kulcshoz és a 0 vagy az 1 számjegyeket az értékhez.',
        'Spam' => 'Levélszemét',
        'Spam Assassin example setup. Ignores emails that are marked with SpamAssassin.' =>
            'Spam Assassin példa beállítás. Mellőzi azokat az e-maileket, amelyeket a SpamAssassin megjelölt.',
        'Spam Assassin example setup. Moves marked mails to spam queue.' =>
            'Spam Assassin példa beállítás. Áthelyezi a megjelölt leveleket a spam várólistába.',
        'Spanish' => 'Spanyol',
        'Spanish (Colombia)' => 'Spanyol (Kolumbia)',
        'Spanish (Mexico)' => 'Spanyol (Mexikó)',
        'Spanish stop words for fulltext index. These words will be removed from the search index.' =>
            'Spanyol kiszűrendő szavak a szabad-szavas indexnél. Ezek a szavak el lesznek távolítva a keresési indexből.',
        'Specifies if an agent should receive email notification of his own actions.' =>
            'Megadja, hogy egy ügyintéző fogadhatja a saját műveletei e-mail értesítését.',
        'Specifies the available note types for this ticket mask. If the option is deselected, ArticleTypeDefault is used and the option is removed from the mask.' =>
            'Megadja az elérhető jegyzettípusokat ehhez a jegymaszkhoz. Ha a lehetőség nincs kiválasztva, az ArticleTypeDefault lesz használva, és a lehetőség el lesz távolítva a maszkból.',
        'Specifies the default article type for the ticket compose screen in the agent interface if the article type cannot be automatically detected.' =>
            'Megadja az alapértelmezett bejegyzéstípust az ügyintézői felület jegyválasz képernyőjén, ha a bejegyzéstípus nem ismerhető fel automatikusan.',
        'Specifies the different article types that will be used in the system.' =>
            'Megadja a különböző bejegyzéstípusokat, amelyek a rendszeren használva lesznek.',
        'Specifies the different note types that will be used in the system.' =>
            'Megadja a különböző jegyzettípusokat, amelyek a rendszeren használva lesznek.',
        'Specifies the directory to store the data in, if "FS" was selected for TicketStorageModule.' =>
            'Azt a könyvtárat adja meg, amelyben az adatok vannak tárolva, ha „FS” lett kiválasztva a TicketStorageModule modulnál.',
        'Specifies the directory where SSL certificates are stored.' => 'Azt a könyvtárat adja meg, ahol az SSL tanúsítványok vannak tárolva.',
        'Specifies the directory where private SSL certificates are stored.' =>
            'Azt a könyvtárat adja meg, ahol a személyes SSL tanúsítványok vannak tárolva.',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "OTRS Notifications" otrs@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address.' =>
            'Azt az e-mail címet adja meg, amelyet az alkalmazás az értesítések elküldésekor használjon. Az e-mail cím a teljes megjelenítési név összeállításához lesz használva az értesítési mesternél (azaz „OTRS értesítések” otrs@your.example.com). Használhatja az OTRS_CONFIG_FQDN változót, ahogy a konfigurációban be van állítva, vagy válasszon egy másik e-mail címet.',
        'Specifies the email addresses to get notification messages from scheduler tasks.' =>
            'Megadja az e-mail címet az ütemező feladataiból érkező értesítési üzenetek fogadásához.',
        'Specifies the group where the user needs rw permissions so that he can access the "SwitchToCustomer" feature.' =>
            'Azt a csoportot adja meg, ahol a felhasználónak írási, olvasási jogosultságra van szüksége, így hozzáférhet a „SwitchToCustomer” funkcióhoz.',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "OTRS Notifications" otrs@your.example.com).' =>
            'Azt a nevet adja meg, amelyet az alkalmazás az értesítések elküldésekor használjon. A küldő neve a teljes megjelenítési név összeállításához lesz használva az értesítési mesternél (azaz „OTRS értesítésiek” otrs@your.example.com).',
        'Specifies the order in which the firstname and the lastname of agents will be displayed.' =>
            'Azt a sorrendet adja meg, amelyben az ügyintéző keresztneve és vezetékneve megjelenítve legyen.',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png, 700 x 100 pixel).' =>
            'Megadja a fájl útvonalát az oldal fejlécében lévő logóhoz (gif|jpg|png, 700 x 100 képpont).',
        'Specifies the path of the file for the performance log.' => 'Megadja a fájl útvonalát a teljesítménynaplóhoz.',
        'Specifies the path to the converter that allows the view of Microsoft Excel files, in the web interface.' =>
            'Megadja az átalakító útvonalát, amely lehetővé teszi a Microsoft Excel fájlok megtekintését a webes felületen.',
        'Specifies the path to the converter that allows the view of Microsoft Word files, in the web interface.' =>
            'Megadja az átalakító útvonalát, amely lehetővé teszi a Microsoft Word fájlok megtekintését a webes felületen.',
        'Specifies the path to the converter that allows the view of PDF documents, in the web interface.' =>
            'Megadja az átalakító útvonalát, amely lehetővé teszi a PDF dokumentumok megtekintését a webes felületen.',
        'Specifies the path to the converter that allows the view of XML files, in the web interface.' =>
            'Megadja az átalakító útvonalát, amely lehetővé teszi az XML fájlok megtekintését a webes felületen.',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            'Azt a szöveget adja meg, amelynek a naplófájlban kell megjelennie egy CGI parancsfájl bejegyzést jelezve.',
        'Specifies user id of the postmaster data base.' => 'Megadja a levelezési adatbázis felhasználó-azonosítóját.',
        'Specifies whether all storage backends should be checked when looking for attachments. This is only required for installations where some attachments are in the file system, and others in the database.' =>
            'Megadja, hogy az összes tárolási háttérprogramot ellenőrizni kell-e a mellékletek keresésekor. Ez csak azoknál a telepítéseknél szükséges, ahol néhány melléklet a fájlrendszeren van tárolva, a többi pedig adatbázisban.',
        'Specify how many sub directory levels to use when creating cache files. This should prevent too many cache files being in one directory.' =>
            'Megadja, hogy hány alkönyvtár szintet használjon a gyorsítótár fájl létrehozásakor. Ez megakadályozza, hogy túl sok gyorsítótár fájl legyen egy könyvtárban.',
        'Specify the channel to be used to fetch OTRS Business Solution™ updates. Warning: Development releases might not be complete, your system might experience unrecoverable errors and on extreme cases could become unresponsive!' =>
            'Megadja az OTRS Business Solution™ frissítések letöltéshez használt csatornát. Figyelmeztetés: a fejlesztői kiadások nem biztos, hogy befejezettek, a rendszere helyrehozhatatlan hibákat szenvedhet, és extrém esetekben elérhetetlenné válhat!',
        'Specify the password to authenticate for the first mirror database.' =>
            'A jelszó megadása az első tükör adatbázisnál történő hitelesítéshez.',
        'Specify the username to authenticate for the first mirror database.' =>
            'A felhasználónév megadása az első tükör adatbázisnál történő hitelesítéshez.',
        'Spell checker.' => 'Helyesírás-ellenőrző.',
        'Stable' => 'Stabil',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            'Szabványos elérhető jogosultságok az alkalmazáson belüli ügyintézőknél. Ha több jogosultság szükséges, akkor azok itt adhatók meg. A jogosultságokat meg kell határozni, hogy hatályban lévők legyenek. Néhány egyéb jó jogosultság beépítetten is biztosítva van: jegyzet, lezárás, függőben, ügyfél, szabad szöveg, áthelyezés, válasz írása, felelős, továbbítás és átirányítás. Győződjön meg arról, hogy az „rw” mindig az utolsó regisztrált jogosultság legyen.',
        'Start number for statistics counting. Every new stat increments this number.' =>
            'Kezdőszám a statisztika számláláshoz. Minden új statisztika növeli ezt a számot.',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            'Elindítja az aktív objektum helyettesítő karakter keresését, miután a hivatkozás objektum maszk elindult.',
        'Stat#' => 'Stat#',
        'Status view' => 'Állapot nézet',
        'Stores cookies after the browser has been closed.' => 'Sütiket tárol, miután a böngészőt bezárták.',
        'Strips empty lines on the ticket preview in the queue view.' => 'Eltávolítja az üres sorokat a jegyelőnézetből a várólista nézetben.',
        'Strips empty lines on the ticket preview in the service view.' =>
            'Eltávolítja az üres sorokat a jegyelőnézetből a szolgáltatás nézetben.',
        'Swahili' => 'Szuahéli',
        'Swedish' => 'Svéd',
        'System Address Display Name' => 'Rendszercím megjelenített neve',
        'System Maintenance' => 'Rendszerkarbantartás',
        'System Request (%s).' => 'Rendszer kérés (%s).',
        'Target' => 'Cél',
        'Templates <-> Queues' => 'Sablonok <-> Várólisták',
        'Textarea' => 'Szövegdoboz',
        'Thai' => 'Thai',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            'Az ügyintéző felszínének belső neve, amelyet az ügyintézői felületen kell használni. Ellenőrizze az elérhető felszíneket a Frontend::Agent::Skins helyen.',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            'Az ügyfél felszínének belső neve, amelyet az ügyfélfelületen kell használni. Ellenőrizze az elérhető felszíneket a Frontend::Customer::Skins helyen.',
        'The daemon registration for the scheduler cron task manager.' =>
            'A démon regisztrációja az ütemező cron feladatkezelőjénél.',
        'The daemon registration for the scheduler future task manager.' =>
            'A démon regisztrációja az ütemező jövőbeli feladatkezelőjénél.',
        'The daemon registration for the scheduler generic agent task manager.' =>
            'A démon regisztrációja az ütemező általános ügyintéző feladatkezelőjénél.',
        'The daemon registration for the scheduler task worker.' => 'A démon regisztrációja az ütemező feladat munkásánál.',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            'A TicketHook és a jegyszám közötti elválasztó. Például „: ”.',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            'Az esemény kibocsátása utáni időtartam percben, amelyben az új eszkaláció értesíti és elindítja az elnyomott eseményeket.',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the latter case you should verify that the setting PostMaster::CheckFollowUpModule###0200-References is activated to recognize followups based on email headers.' =>
            'A tárgy formátuma. A „Bal” jelentése „[Jegyhorog#:12345] Valamilyen tárgy”, a „Jobb” jelentése „Valamilyen tárgy [Jegyhorog#:12345]”, a „Nincs” jelentése „Valamilyen tárgy” és nincs jegyszám. Ez utóbbi esetben ellenőriznie kell, hogy a PostMaster::CheckFollowUpModule###0200-References beállítás be van-e kapcsolva az e-mail fejlécek alapján történő követők felismeréséhez.',
        'The headline shown in the customer interface.' => 'Az ügyfélfelületen megjelenített főcím.',
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            'Egy jegy azonosítója, például Ticket#, Call#, MyTicket#. Az alapértelmezett a Ticket#.',
        'The logo shown in the header of the agent interface for the skin "default". See "AgentLogo" for further description.' =>
            'Az ügyintézői felület fejlécében megjelenített logó az „alapértelmezett” felszínnél. További leírásért nézze meg az „AgentLogo” bejegyzést.',
        'The logo shown in the header of the agent interface for the skin "ivory". See "AgentLogo" for further description.' =>
            'Az ügyintézői felület fejlécében megjelenített logó az „ivory” felszínnél. További leírásért nézze meg az „AgentLogo” bejegyzést.',
        'The logo shown in the header of the agent interface for the skin "ivory-slim". See "AgentLogo" for further description.' =>
            'Az ügyintézői felület fejlécében megjelenített logó az „ivory-slim” felszínnél. További leírásért nézze meg az „AgentLogo” bejegyzést.',
        'The logo shown in the header of the agent interface for the skin "slim". See "AgentLogo" for further description.' =>
            'Az ügyintézői felület fejlécében megjelenített logó a „slim” felszínnél. További leírásért nézze meg az „AgentLogo” bejegyzést.',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Az ügyintéző felület fejlécében megjelenített logó. A kép URL lehet relatív URL a felszín képkönyvtárától, vagy egy teljes URL egy távoli webkiszolgálótól.',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Az ügyfélfelület fejlécében megjelenített logó. A kép URL lehet relatív URL a felszín képkönyvtárától, vagy egy teljes URL egy távoli webkiszolgálótól.',
        'The logo shown on top of the login box of the agent interface. The URL to the image must be relative URL to the skin image directory.' =>
            'Az ügyintézői felület bejelentkezési dobozának tetején megjelenített logó. A kép URL-nek relatív URL-nek kell lennie a felszín képkönyvtárától.',
        'The maximal number of articles expanded on a single page in AgentTicketZoom.' =>
            'Egy önálló lapon kinyitott bejegyzések legnagyobb száma az ügyintézői jegynagyítás képernyőn.',
        'The maximal number of articles shown on a single page in AgentTicketZoom.' =>
            'Egy önálló lapon megjelenített bejegyzések legnagyobb száma az ügyintézői jegynagyítás képernyőn.',
        'The maximum number of mails fetched at once before reconnecting to the server.' =>
            'A kiszolgálóra történő újrakapcsolódás előtt egyszerre lekért levelek legnagyobb száma.',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            'A tárgy elején lévő szöveg egy válasz e-mailben, például RE, AW vagy AS.',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            'A tárgy elején lévő szöveg egy e-mail továbbításakor, például FW, Fwd vagy WG.',
        'This event module stores attributes from CustomerUser as DynamicFields tickets. Please see the setting above for how to configure the mapping.' =>
            'Ez az eseménymodul az ügyfél-felhasználó jellemzőit tárolja jegy típusú dinamikus mezőkként. Nézze meg a fenti beállítást ahhoz, hogy hogyan kell beállítani a leképezést.',
        'This is the default orange - black skin for the customer interface.' =>
            'Ez az alapértelmezett narancssárga - fekete felszín az ügyfélfelülethez.',
        'This is the default orange - black skin.' => 'Ez az alapértelmezett narancssárga - fekete felszín.',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            'Ez a modul és annak PreRun() függvénye lesz végrehajtva minden kérésnél, ha meg van határozva. Ez a modul néhány felhasználói beállítás ellenőrzéséhez vagy az új alkalmazásokkal kapcsolatos hírek megjelenítéséhez hasznos.',
        'This module is part of the admin area of OTRS.' => 'Ez a modul az OTRS adminisztrációs területének a része.',
        'This option defines the dynamic field in which a Process Management activity entity id is stored.' =>
            'Ez a beállítás határozza meg azt a dinamikus mezőt, amelyben a folyamatkezelő tevékenység-entitás azonosítója tárolva van.',
        'This option defines the dynamic field in which a Process Management process entity id is stored.' =>
            'Ez a beállítás határozza meg azt a dinamikus mezőt, amelyben a folyamatkezelő folyamat-entitás azonosítója tárolva van.',
        'This option defines the process tickets default lock.' => 'Ez a beállítás határozza meg a folyamatjegyek alapértelmezett zárát.',
        'This option defines the process tickets default priority.' => 'Ez a beállítás határozza meg a folyamatjegyek alapértelmezett prioritását.',
        'This option defines the process tickets default queue.' => 'Ez a beállítás határozza meg a folyamatjegyek alapértelmezett várólistáját.',
        'This option defines the process tickets default state.' => 'Ez a beállítás határozza meg a folyamatjegyek alapértelmezett állapotát.',
        'This option will deny the access to customer company tickets, which are not created by the customer user.' =>
            'Ez a beállítás meg fogja tagadni azon ügyfél-vállalati jegyekhez való hozzáférést, amelyeket nem az ügyfél-felhasználó hozott létre.',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            'Ez a beállítás lehetővé teszi a beépített országlista felülbírálását a saját országlistájával. Ez különösen hasznos, ha az országoknak csak egy kiválasztott kis csoportját szeretné használni.',
        'This will allow the system to send text messages via SMS.' => 'Ez lehetővé fogja tenni a rendszernek a szöveges üzenetek küldését SMS-ben.',
        'Ticket Close.' => 'Jegylezárás.',
        'Ticket Compose Bounce Email.' => 'E-mail átirányító jegyválasz.',
        'Ticket Compose email Answer.' => 'E-mailre történő jegyválasz.',
        'Ticket Customer.' => 'Jegyügyfél.',
        'Ticket Forward Email.' => 'Jegy e-mail továbbítás.',
        'Ticket FreeText.' => 'Jegy szabad szöveg.',
        'Ticket History.' => 'Jegyelőzmények.',
        'Ticket Lock.' => 'Jegyzár.',
        'Ticket Merge.' => 'Jegyegyesítés.',
        'Ticket Move.' => 'Jegyáthelyezés.',
        'Ticket Note.' => 'Jegyjegyzet.',
        'Ticket Notifications' => 'Jegyértesítések',
        'Ticket Outbound Email.' => 'Jegy kimenő e-mail.',
        'Ticket Owner.' => 'Jegytulajdonos.',
        'Ticket Pending.' => 'Jegy függőben.',
        'Ticket Print.' => 'Jegynyomtatás.',
        'Ticket Priority.' => 'Jegyprioritás.',
        'Ticket Queue Overview' => 'Jegyvárólista áttekintő',
        'Ticket Responsible.' => 'Jegyfelelős.',
        'Ticket Watcher' => 'Jegymegfigyelő',
        'Ticket Zoom.' => 'Jegynagyítás.',
        'Ticket bulk module.' => 'Jegy tömeges modul.',
        'Ticket event module that triggers the escalation stop events.' =>
            'Jegyesemény modul, amely aktiválja az eszkaláció leállítás eseményeket.',
        'Ticket moved into Queue "%s" (%s) from Queue "%s" (%s).' => 'A jegy áthelyezve a(z) „%s” (%s) várólistába a(z) „%s” (%s) várólistából.',
        'Ticket notifications' => 'Jegyértesítések',
        'Ticket overview' => 'Jegyáttekintő',
        'Ticket plain view of an email.' => 'Egy e-mail egyszerű jegynézete.',
        'Ticket title' => 'Jegycím',
        'Ticket zoom view.' => 'Jegynagyítás nézet.',
        'TicketNumber' => 'Jegyszám',
        'Tickets.' => 'Jegyek.',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            'Az idő másodpercben, amely hozzáadódik az aktuális időhöz, ha egy várakozó állapot be van állítva (alapértelmezett: 86400 = 1 nap).',
        'Title updated: Old: "%s", New: "%s"' => 'Cím frissítve: régi: „%s”, új: „%s”',
        'To accept login information, such as an EULA or license.' => 'Bejelentkezési információk elfogadásához, mint például EULA vagy licenc.',
        'To download attachments.' => 'Mellékletek letöltéséhez.',
        'Toggles display of OTRS FeatureAddons list in PackageManager.' =>
            'Ki- és bekapcsolja az OTRS szolgáltatás-bővítmény listájának megjelenítését a csomagkezelőben.',
        'Toolbar Item for a shortcut. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Eszköztárelem egy gyorshivatkozáshoz. A hivatkozás megjelenítéséhez vagy elrejtéséhez további hozzáférés vezérlő készíthető a „Group” kulcs és az „rw:csoport1;move_into:csoport2” értékhez hasonló tartalom használatával.',
        'Transport selection for ticket notifications.' => 'Átvitelkiválasztás a jegyértesítésekhez.',
        'Tree view' => 'Fa nézet',
        'Triggers ticket escalation events and notification events for escalation.' =>
            'Aktiválja a jegyeszkalációs eseményeket és az értesítés eseményeket az eszkalációnál.',
        'Turkish' => 'Török',
        'Turns off SSL certificate validation, for example if you use a transparent HTTPS proxy. Use at your own risk!' =>
            'Kikapcsolja az SSL tanúsítvány ellenőrzést, ha például átlátszó HTTPS proxyt használ. Csak saját felelősségre használja!',
        'Turns on drag and drop for the main navigation.' => 'Bekapcsolja a „fogd és vidd” lehetőséget a fő navigációnál.',
        'Turns on the animations used in the GUI. If you have problems with these animations (e.g. performance issues), you can turn them off here.' =>
            'Bekapcsolja a grafikus felületen használt animációkat. Ha problémái vannak ezekkel az animációkkal (például teljesítmény-problémák), akkor itt kapcsolhatja ki azokat.',
        'Turns on the remote ip address check. It should be set to "No" if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            'Bekapcsolja a távoli IP-cím ellenőrzését. „Nem” értékre kell állítania, ha az alkalmazást például egy proxy-farmon vagy betárcsázós kapcsolaton keresztül használják, mert a távoli IP-cím többnyire eltérő az egyes kéréseknél.',
        'Ukrainian' => 'Ukrán',
        'Unlock tickets that are past their unlock timeout.' => 'Jegyek feloldása, amelyek átlépték a feloldási időkorlátjukat.',
        'Unlock tickets whenever a note is added and the owner is out of office.' =>
            'Jegyek feloldása, amikor egy jegyzetet adnak hozzá és a tulajdonos házon kívül van.',
        'Unlocked ticket.' => 'Feloldott jegy.',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            'A jegy „Megtekintett” jelzőjének frissítése, ha minden bejegyzést megtekintettek, vagy egy új bejegyzést hoztak létre.',
        'Updated SLA to %s (ID=%s).' => 'SLA frissítve erre: %s (ID=%s).',
        'Updated Service to %s (ID=%s).' => 'Szolgáltatás frissítve erre: %s (ID=%s).',
        'Updated Type to %s (ID=%s).' => 'Típus frissítve erre: %s (ID=%s).',
        'Updated: %s' => 'Frissítve: %s',
        'Updated: %s=%s;%s=%s;%s=%s;' => 'Frissítve: %s=%s;%s=%s;%s=%s;',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            'Frissíti a jegyeszkalációs indexet, miután egy jegyjellemző frissítve lett.',
        'Updates the ticket index accelerator.' => 'Frissíti a jegyindex gyorsítót.',
        'Use new type of select and autocomplete fields in agent interface, where applicable (InputFields).' =>
            'A választó és automatikusan kiegészítő mezők új típusának használata az ügyintézői felületen, ahol alkalmazható (beviteli mezők).',
        'Use new type of select and autocomplete fields in customer interface, where applicable (InputFields).' =>
            'A választó és automatikusan kiegészítő mezők új típusának használata az ügyfélfelületen, ahol alkalmazható (beviteli mezők).',
        'UserFirstname' => 'UserFirstname',
        'UserLastname' => 'UserLastname',
        'Uses Cc recipients in reply Cc list on compose an email answer in the ticket compose screen of the agent interface.' =>
            'Másolati címzetteket használ a válaszlistán egy e-mailre történő válasz írásakor az ügyintézői felület jegyválasz képernyőjén.',
        'Uses richtext for viewing and editing ticket notification.' => 'RichText szöveget használ a jegyértesítések megtekintésénél és szerkesztésénél.',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard templates, auto responses and notifications.' =>
            'RichText szöveget használ a megtekintésnél és szerkesztésnél: bejegyzések, megszólítások, aláírások, szabványos sablonok, automatikus válaszok és értesítések.',
        'Vietnam' => 'Vietnami',
        'View performance benchmark results.' => 'Teljesítményteszt eredményeinek megtekintése.',
        'Watch this ticket' => 'Jegy megfigyelése',
        'Watched Tickets.' => 'Megfigyelt jegyek.',
        'We are performing scheduled maintenance.' => 'Ütemezett karbantartást végzünk.',
        'We are performing scheduled maintenance. Login is temporarily not available.' =>
            'Ütemezett karbantartást végzünk. A bejelentkezés átmenetileg nem érhető el.',
        'We are performing scheduled maintenance. We should be back online shortly.' =>
            'Ütemezett karbantartást végzünk. Rövidesen ismét elérhetőnek kell lennünk.',
        'Web View' => 'Webnézet',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the body of this note (this text cannot be changed by the agent).' =>
            'Amikor jegyeket egyesítenek, egy jegyzet lesz automatikusan hozzáadva ahhoz a jegyhez, amely többé már nem aktív. Itt határozhatja meg ennek a jegyzetnek a törzsét (ezt a szöveget nem tudja megváltoztatni az ügyintéző).',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the subject of this note (this subject cannot be changed by the agent).' =>
            'Amikor jegyeket egyesítenek, egy jegyzet lesz automatikusan hozzáadva ahhoz a jegyhez, amely többé már nem aktív. Itt határozhatja meg ennek a jegyzetnek a tárgyát (ezt a tárgyat nem tudja megváltoztatni az ügyintéző).',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            'Amikor jegyeket egyesítenek, az ügyfél tájékoztatást kaphat e-mailben a „Küldő tájékoztatása” jelölőnégyzet beállításával. Ebben a szövegdobozban meghatározhat egy előformázott szöveget, amelyet később az ügyintézők módosíthatnak.',
        'Whether or not to collect meta information from articles using filters configured in Ticket::Frontend::ZoomCollectMetaFilters.' =>
            'Gyűjtsön vagy ne gyűjtsön meta-információkat a bejegyzésekből a Ticket::Frontend::ZoomCollectMetaFilters beállításban beállított szűrők használatával.',
        'Yes, but hide archived tickets' => 'Igen, de az archivált jegyek elrejtése',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Az Ön „<OTRS_TICKET>” számú jegyhez rendelt e-mailje átirányításra került a következő címre: „<OTRS_BOUNCE_TO>”. További információkért vegye fel ezzel a címmel a kapcsolatot.',
        'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.' =>
            'Az előnyben részesített várólistáknak a várólista kiválasztása. Értesítést is kaphat azokról a várólistákról e-mailben, ha engedélyezve van.',
        'Your service selection of your preferred services. You also get notified about those services via email if enabled.' =>
            'Az előnyben részesített szolgáltatásoknak a szolgáltatás kiválasztása. Értesítést is kaphat azokról a szolgáltatásokról e-mailben, ha engedélyezve van.',
        'attachment' => 'melléklet',
        'bounce' => 'átirányítás',
        'compose' => 'válasz',
        'debug' => 'hibakeresés',
        'error' => 'hiba',
        'forward' => 'továbbítás',
        'info' => 'információ',
        'inline' => 'beágyazott',
        'notice' => 'értesítés',
        'pending' => 'függőben',
        'responsible' => 'felelős',
        'stats' => 'statisztikák',

    };
    # $$STOP$$
    return;
}

1;
