# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::hu_ITSMConfigurationManagement;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AAAITSMConfigItem
    $Self->{Translation}->{'Computer'} = 'Számítógép';
    $Self->{Translation}->{'Hardware'} = 'Hardver';
    $Self->{Translation}->{'Network'} = 'Hálózat';
    $Self->{Translation}->{'Software'} = 'Szoftver';
    $Self->{Translation}->{'Address'} = 'Cím';
    $Self->{Translation}->{'Admin Tool'} = 'Adminisztrációs eszköz';
    $Self->{Translation}->{'Backup Device'} = 'Biztonsági mentés eszköz';
    $Self->{Translation}->{'Beamer'} = 'Beamer';
    $Self->{Translation}->{'Building'} = 'Összeállítás';
    $Self->{Translation}->{'CIHistory::ConfigItemCreate'} = 'CIHistory::ConfigItemCreate';
    $Self->{Translation}->{'CIHistory::ConfigItemDelete'} = 'CIHistory::ConfigItemDelete';
    $Self->{Translation}->{'CIHistory::DefinitionUpdate'} = 'CIHistory::DefinitionUpdate';
    $Self->{Translation}->{'CIHistory::DeploymentStateUpdate'} = 'CIHistory::DeploymentStateUpdate';
    $Self->{Translation}->{'CIHistory::IncidentStateUpdate'} = 'CIHistory::IncidentStateUpdate';
    $Self->{Translation}->{'CIHistory::LinkAdd'} = 'CIHistory::LinkAdd';
    $Self->{Translation}->{'CIHistory::LinkDelete'} = 'CIHistory::LinkDelete';
    $Self->{Translation}->{'CIHistory::NameUpdate'} = 'CIHistory::NameUpdate';
    $Self->{Translation}->{'CIHistory::ValueUpdate'} = 'CIHistory::ValueUpdate';
    $Self->{Translation}->{'CIHistory::VersionCreate'} = 'CIHistory::VersionCreate';
    $Self->{Translation}->{'CIHistory::VersionDelete'} = 'CIHistory::VersionDelete';
    $Self->{Translation}->{'CIHistory::AttachmentAdd'} = 'CIHistory::AttachmentAdd';
    $Self->{Translation}->{'CIHistory::AttachmentDelete'} = 'CIHistory::AttachmentDelete';
    $Self->{Translation}->{'CPU'} = 'CPU';
    $Self->{Translation}->{'Camera'} = 'Kamera';
    $Self->{Translation}->{'Capacity'} = 'Kapacitás';
    $Self->{Translation}->{'Change Definition'} = 'Meghatározás módosítása';
    $Self->{Translation}->{'Change of definition failed! See System Log for details.'} = 'A meghatározás módosítása nem sikerült! A részletekért nézze meg a rendszernaplót.';
    $Self->{Translation}->{'Client Application'} = 'Kliens alkalmazás';
    $Self->{Translation}->{'Client OS'} = 'Kliens operációs rendszer';
    $Self->{Translation}->{'Config Item-Area'} = 'Konfigurációelem-terület';
    $Self->{Translation}->{'Config Items available'} = 'Elérhető konfigurációelemek';
    $Self->{Translation}->{'Config Items shown'} = 'Megjelenített konfigurációelemek';
    $Self->{Translation}->{'CMDB'} = 'CMDB';
    $Self->{Translation}->{'Demo'} = 'Bemutató';
    $Self->{Translation}->{'Desktop'} = 'Asztal';
    $Self->{Translation}->{'Developer Licence'} = 'Fejlesztői licenc';
    $Self->{Translation}->{'Docking Station'} = 'Dokkoló állomás';
    $Self->{Translation}->{'Duplicate'} = 'Kettőzés';
    $Self->{Translation}->{'Embedded'} = 'Beágyazott';
    $Self->{Translation}->{'Empty fields indicate that the current values are kept'} = 'Az üres mezők azt jelzik, hogy az aktuális mezők megtartásra kerülnek';
    $Self->{Translation}->{'Enterprise Licence'} = 'Vállalati licenc';
    $Self->{Translation}->{'Expiration Date'} = 'Lejárati idő';
    $Self->{Translation}->{'Expired'} = 'Lejárt';
    $Self->{Translation}->{'Floor'} = 'Emelet';
    $Self->{Translation}->{'Freeware'} = 'Freeware';
    $Self->{Translation}->{'GSM'} = 'GSM';
    $Self->{Translation}->{'Gateway'} = 'Átjáró';
    $Self->{Translation}->{'Graphic Adapter'} = 'Grafikus csatoló';
    $Self->{Translation}->{'Hard Disk'} = 'Merevlemez';
    $Self->{Translation}->{'Hard Disk::Capacity'} = 'Merevlemez::Kapacitás';
    $Self->{Translation}->{'Hide Versions'} = 'Verziók elrejtése';
    $Self->{Translation}->{'IP Address'} = 'IP-cím';
    $Self->{Translation}->{'IP over DHCP'} = 'IP a DHCP fölött';
    $Self->{Translation}->{'IT Facility'} = 'IT képesség';
    $Self->{Translation}->{'Incident'} = 'Incidens';
    $Self->{Translation}->{'Install Date'} = 'Telepítés dátuma';
    $Self->{Translation}->{'Keyboard'} = 'Billentyűzet';
    $Self->{Translation}->{'LAN'} = 'LAN';
    $Self->{Translation}->{'Laptop'} = 'Laptop';
    $Self->{Translation}->{'Last Change'} = 'Utolsó módosítás';
    $Self->{Translation}->{'Licence Key'} = 'Licenc kulcs';
    $Self->{Translation}->{'Licence Key::Expiration Date'} = 'Licenc kulcs::Lejárati dátum';
    $Self->{Translation}->{'Licence Key::Quantity'} = 'Licenc kulcs::Mennyiség';
    $Self->{Translation}->{'Licence Type'} = 'Licenctípus';
    $Self->{Translation}->{'Maintenance'} = 'Karbantartás';
    $Self->{Translation}->{'Maximum number of one element'} = 'Egy elem legnagyobb száma';
    $Self->{Translation}->{'Media'} = 'Adathordozó';
    $Self->{Translation}->{'Middleware'} = 'Köztes réteg';
    $Self->{Translation}->{'Model'} = 'Modell';
    $Self->{Translation}->{'Modem'} = 'Modem';
    $Self->{Translation}->{'Monitor'} = 'Monitor';
    $Self->{Translation}->{'Mouse'} = 'Egér';
    $Self->{Translation}->{'Network Adapter'} = 'Hálózati csatoló';
    $Self->{Translation}->{'Network Adapter::IP Address'} = 'Hálózati csatoló::IP-cím';
    $Self->{Translation}->{'Network Adapter::IP over DHCP'} = 'Hálózati csatoló::IP a DHCP fölött';
    $Self->{Translation}->{'Network Address'} = 'Hálózati cím';
    $Self->{Translation}->{'Network Address::Gateway'} = 'Hálózati cím::Átjáró';
    $Self->{Translation}->{'Network Address::Subnet Mask'} = 'Hálózati cím::Alhálózati maszk';
    $Self->{Translation}->{'Open Source'} = 'Nyílt forrású';
    $Self->{Translation}->{'Operational'} = 'Üzemképes';
    $Self->{Translation}->{'Other'} = 'Egyéb';
    $Self->{Translation}->{'Other Equipment'} = 'Egyéb berendezés';
    $Self->{Translation}->{'Outlet'} = 'Outlet';
    $Self->{Translation}->{'PCMCIA Card'} = 'PCMCIA kártya';
    $Self->{Translation}->{'PDA'} = 'PDA';
    $Self->{Translation}->{'Per Node'} = 'Csomópontonként';
    $Self->{Translation}->{'Per Processor'} = 'Processzoronként';
    $Self->{Translation}->{'Per Server'} = 'Kiszolgálónként';
    $Self->{Translation}->{'Per User'} = 'Felhasználónként';
    $Self->{Translation}->{'Phone 1'} = '1. telefon';
    $Self->{Translation}->{'Phone 2'} = '2. telefon';
    $Self->{Translation}->{'Pilot'} = 'Próbaüzem';
    $Self->{Translation}->{'Planned'} = 'Tervezett';
    $Self->{Translation}->{'Printer'} = 'Nyomtató';
    $Self->{Translation}->{'Production'} = 'Termelés';
    $Self->{Translation}->{'Quantity'} = 'Mennyiség';
    $Self->{Translation}->{'Rack'} = 'Rack';
    $Self->{Translation}->{'Ram'} = 'Ram';
    $Self->{Translation}->{'Repair'} = 'Javítás';
    $Self->{Translation}->{'Retired'} = 'Visszavont';
    $Self->{Translation}->{'Review'} = 'Vizsgálat';
    $Self->{Translation}->{'Room'} = 'Szoba';
    $Self->{Translation}->{'Router'} = 'Útválasztó';
    $Self->{Translation}->{'Scanner'} = 'Lapolvasó';
    $Self->{Translation}->{'Search Config Items'} = 'Konfigurációelemek keresése';
    $Self->{Translation}->{'Security Device'} = 'Biztonsági eszköz';
    $Self->{Translation}->{'Serial Number'} = 'Sorozatszám';
    $Self->{Translation}->{'Server'} = 'Kiszolgáló';
    $Self->{Translation}->{'Server Application'} = 'Kiszolgáló alkalmazás';
    $Self->{Translation}->{'Server OS'} = 'Kiszolgáló operációs rendszer';
    $Self->{Translation}->{'Show Versions'} = 'Verziók megjelenítése';
    $Self->{Translation}->{'Single Licence'} = 'Egyedüli licenc';
    $Self->{Translation}->{'Subnet Mask'} = 'Alhálózati maszk';
    $Self->{Translation}->{'Switch'} = 'Kapcsoló';
    $Self->{Translation}->{'Telco'} = 'Telco';
    $Self->{Translation}->{'Test/QA'} = 'Tesztelés/QA';
    $Self->{Translation}->{'The deployment state of this config item'} = 'A konfigurációelem üzembe állítási állapota';
    $Self->{Translation}->{'The incident state of this config item'} = 'A konfigurációelem incidensállapota';
    $Self->{Translation}->{'Time Restricted'} = 'Időben korlátozott';
    $Self->{Translation}->{'USB Device'} = 'USB eszköz';
    $Self->{Translation}->{'Unlimited'} = 'Korlátlan';
    $Self->{Translation}->{'User Tool'} = 'Felhasználói eszköz';
    $Self->{Translation}->{'Volume Licence'} = 'Mennyiségi licenc';
    $Self->{Translation}->{'WLAN'} = 'WLAN';
    $Self->{Translation}->{'WLAN Access Point'} = 'WLAN hozzáférési pont';
    $Self->{Translation}->{'Warranty Expiration Date'} = 'Garancia lejárati idő';
    $Self->{Translation}->{'Workplace'} = 'Munkahely';

    # Template: AdminITSMConfigItem
    $Self->{Translation}->{'Config Item Management'} = 'Konfigurációelem-menedzsment';
    $Self->{Translation}->{'Change class definition'} = 'Osztály-meghatározás módosítása';
    $Self->{Translation}->{'Config Item Class'} = 'Konfigurációelem-osztály';
    $Self->{Translation}->{'Definition'} = 'Meghatározás';

    # Template: AgentITSMConfigItemAdd
    $Self->{Translation}->{'Config Item'} = 'Konfigurációelem';
    $Self->{Translation}->{'Filter for Classes'} = 'Szűrő az osztályokhoz';
    $Self->{Translation}->{'Select a Class from the list to create a new Config Item.'} = 'Válasszon egy osztályt a listából egy új konfigurációelem létrehozásához.';
    $Self->{Translation}->{'Class'} = 'Osztály';

    # Template: AgentITSMConfigItemBulk
    $Self->{Translation}->{'ITSM ConfigItem Bulk Action'} = 'ITSM konfigurációelem tömeges művelet';
    $Self->{Translation}->{'Deployment state'} = 'Üzembe állítási állapot';
    $Self->{Translation}->{'Incident state'} = 'Incidensállapot';
    $Self->{Translation}->{'Link to another'} = 'Hivatkozás egy másik';
    $Self->{Translation}->{'Invalid Configuration Item number!'} = 'Érvénytelen konfigurációelem-szám!';
    $Self->{Translation}->{'The number of another Configuration Item to link with.'} = 'Egy másik konfigurációelem száma, amellyel össze kell kötni.';

    # Template: AgentITSMConfigItemDelete
    $Self->{Translation}->{'Do you really want to delete this config item?'} = 'Valóban törölni szeretné ezt a konfigurációelemet?';

    # Template: AgentITSMConfigItemEdit
    $Self->{Translation}->{'The name of this config item'} = 'A konfigurációelem neve';
    $Self->{Translation}->{'Name is already in use by the ConfigItems with the following Number(s): %s'} =
        'A nevet már használják a konfigurációelemek a következő számokkal: %s';
    $Self->{Translation}->{'Deployment State'} = 'Üzembe állítási állapot';
    $Self->{Translation}->{'Incident State'} = 'Incidensállapot';

    # Template: AgentITSMConfigItemHistory
    $Self->{Translation}->{'History of Config Item: %s'} = 'Konfigurációelem előzményei: %s';

    # Template: AgentITSMConfigItemOverviewNavBar
    $Self->{Translation}->{'Context Settings'} = 'Környezet beállítások';
    $Self->{Translation}->{'Config Items per page'} = 'Konfigurációelemek oldalanként';

    # Template: AgentITSMConfigItemOverviewSmall
    $Self->{Translation}->{'A generic ITSM Configuration Item table'} = 'Egy általános ITSM konfigurációelem táblázat';
    $Self->{Translation}->{'Deployment State Type'} = 'Üzembe állítási állapottípus';
    $Self->{Translation}->{'Current Incident State'} = 'Jelenlegi incidensállapot';
    $Self->{Translation}->{'Current Incident State Type'} = 'Jelenlegi incidensállapot típus';
    $Self->{Translation}->{'Last changed'} = 'Utolsó módosítás';

    # Template: AgentITSMConfigItemSearch
    $Self->{Translation}->{'Create New Template'} = 'Új sablon létrehozása';
    $Self->{Translation}->{'Run Search'} = 'Keresés futtatása';
    $Self->{Translation}->{'Also search in previous versions?'} = 'Keressen az előző verziókban is?';

    # Template: AgentITSMConfigItemZoom
    $Self->{Translation}->{'Configuration Item'} = 'Konfigurációelem';
    $Self->{Translation}->{'Configuration Item Information'} = 'Konfigurációelem-információk';
    $Self->{Translation}->{'Current Deployment State'} = 'Jelenlegi üzembe állítási állapot';
    $Self->{Translation}->{'Last changed by'} = 'Utoljára módosította';
    $Self->{Translation}->{'Ok'} = 'OK';
    $Self->{Translation}->{'Show one version'} = 'Egy verzió megjelenítése';
    $Self->{Translation}->{'Show all versions'} = 'Összes verzió megjelenítése';
    $Self->{Translation}->{'Version Incident State'} = 'Verzió incidensállapot';
    $Self->{Translation}->{'Version Deployment State'} = 'Verzió üzembe állítási állapot';
    $Self->{Translation}->{'Version Number'} = 'Verziószám';
    $Self->{Translation}->{'Configuration Item Version Details'} = 'Konfigurációelem-verzió részletek';
    $Self->{Translation}->{'Property'} = 'Tulajdonság';

    # Perl Module: Kernel/Modules/AgentITSMConfigItem.pm
    $Self->{Translation}->{'ITSM ConfigItem'} = 'ITSM konfigurációelem';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemHistory.pm
    $Self->{Translation}->{'CIHistory::'} = 'CIHistory::';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemPrint.pm
    $Self->{Translation}->{'ConfigItem'} = 'Konfigurációelem';

    # Perl Module: Kernel/Modules/AgentITSMConfigItemSearch.pm
    $Self->{Translation}->{'No Result!'} = 'Nincs találat!';
    $Self->{Translation}->{'Config Item Search Results'} = 'Konfigurációelem keresési eredmények';

    # SysConfig
    $Self->{Translation}->{'Admin.'} = 'Adminisztráció.';
    $Self->{Translation}->{'Check for a unique name only within the same ConfigItem class (\'class\') or globally (\'global\'), which means every existing ConfigItem is taken into account when looking for duplicates.'} =
        'Egyedi név ellenőrzése kizárólag ugyanabban a konfigurációelem osztályban („osztály”) vagy globálisan („globális”), amely azt jelenti, hogy minden meglévő konfigurációelem egy fiókba lesz felvéve a kettőzések keresésekor.';
    $Self->{Translation}->{'Config Items'} = 'Konfigurációelemek';
    $Self->{Translation}->{'Config item add.'} = 'Konfigurációelem hozzáadása.';
    $Self->{Translation}->{'Config item edit.'} = 'Konfigurációelem szerkesztése.';
    $Self->{Translation}->{'Config item event module that enables logging to history in the agent interface.'} =
        'Konfigurációelem esemény modul, amely engedélyezi a naplózást az előzményekbe az ügyintézői felületen.';
    $Self->{Translation}->{'Config item history.'} = 'Konfigurációelem előzményei.';
    $Self->{Translation}->{'Config item print.'} = 'Konfigurációelem nyomtatása.';
    $Self->{Translation}->{'Config item zoom.'} = 'Konfigurációelem nagyítása.';
    $Self->{Translation}->{'ConfigItemNumber'} = '';
    $Self->{Translation}->{'Configuration Item Limit'} = 'Konfigurációelem-korlát';
    $Self->{Translation}->{'Configuration Item limit per page'} = 'Konfigurációelem-korlát oldalanként';
    $Self->{Translation}->{'Configuration Management Database.'} = 'Konfigurációmenedzsment-adatbázis.';
    $Self->{Translation}->{'Configuration item bulk module.'} = 'Konfigurációelem tömeges modul.';
    $Self->{Translation}->{'Configuration item search backend router of the agent interface.'} =
        'Az ügyintézői felület konfigurációelem keresési háttérprogram útválasztója.';
    $Self->{Translation}->{'Create and manage the definitions for Configuration Items.'} = 'Meghatározások létrehozása és kezelése a konfigurációelemeknél.';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Műveletek meghatározása, ahol egy beállítások gomb érhető el a kapcsolt objektumok felületi elemen (LinkObject::ViewMode = „összetett”). Ne feledje, hogy ezeknek a műveleteknek rendelkezniük kell a következő JS és CSS fájlok regisztrálásával: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js és Core.Agent.LinkObject.js.';
    $Self->{Translation}->{'Define the group with permissions.'} = 'A jogosultságokkal rendelkező csoport meghatározása.';
    $Self->{Translation}->{'Defines Required permissions to create ITSM configuration items using the Generic Interface.'} =
        'Meghatározza a szükséges jogosultságokat az ITSM konfigurációelemek létrehozásához az általános felület használatával.';
    $Self->{Translation}->{'Defines Required permissions to delete ITSM configuration items using the Generic Interface.'} =
        'Meghatározza a szükséges jogosultságokat az ITSM konfigurációelemek törléséhez az általános felület használatával.';
    $Self->{Translation}->{'Defines Required permissions to get ITSM configuration items using the Generic Interface.'} =
        'Meghatározza a szükséges jogosultságokat az ITSM konfigurációelemek lekéréséhez az általános felület használatával.';
    $Self->{Translation}->{'Defines Required permissions to search ITSM configuration items using the Generic Interface.'} =
        'Meghatározza a szükséges jogosultságokat az ITSM konfigurációelemek kereséséhez az általános felület használatával.';
    $Self->{Translation}->{'Defines Required permissions to update ITSM configuration items using the Generic Interface.'} =
        'Meghatározza a szükséges jogosultságokat az ITSM konfigurációelemek frissítéséhez az általános felület használatával.';
    $Self->{Translation}->{'Defines an overview module to show the small view of a configuration item list.'} =
        'Egy áttekintő modult határoz meg egy konfigurációelem lista kis nézetének megjelenítéséhez.';
    $Self->{Translation}->{'Defines regular expressions individually for each ConfigItem class to check the ConfigItem name and to show corresponding error messages.'} =
        'Reguláris kifejezéseket határoz meg egyénileg minden egyes konfigurációelem osztálynál a konfigurációelem nevének ellenőrzéséhez, valamint a megfelelő hibaüzenetek megjelenítéséhez.';
    $Self->{Translation}->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} =
        'Meghatározza az „ITSMConfigItem” osztály alapértelmezett alobjektumát.';
    $Self->{Translation}->{'Defines the number of rows for the CI definition editor in the admin interface.'} =
        'Meghatározza a CI meghatározás-szerkesztő sorainak számát az adminisztrációs felületen.';
    $Self->{Translation}->{'Defines the order of incident states from high (e.g. cricital) to low (e.g. functional).'} =
        'Meghatározza az incidensállapotok sorrendjét a legmagasabbtól (például kritikus) a legalacsonyabbig (például funkcionális).';
    $Self->{Translation}->{'Defines the relevant deployment states where linked tickets can affect the status of a CI.'} =
        'Meghatározza a kapcsolódó üzembe állítási állapotokat, ahol a kapcsolt jegyek befolyásolhatják egy konfigurációelem állapotát.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItem screen.'} =
        'Meghatározza a keresési korlátot az AgentITSMConfigItem képernyőn.';
    $Self->{Translation}->{'Defines the search limit for the AgentITSMConfigItemSearch screen.'} =
        'Meghatározza a keresési korlátot az AgentITSMConfigItemSearch képernyőn.';
    $Self->{Translation}->{'Defines the shown columns in the config item overview. This option has no effect on the position of the column. Note: Class column is always available if filter \'All\' is selected.'} =
        'Meghatározza a megjelenített oszlopokat a konfigurációelem áttekintőben. Ennek a beállításnak nincs hatása az oszlop helyzetére. Megjegyzés: az osztály oszlop mindig látható, ha az „Összes” szűrő ki van választva.';
    $Self->{Translation}->{'Defines the shown columns in the config item search. This option has no effect on the position of the column.'} =
        'Meghatározza a megjelenített oszlopokat a konfigurációelem keresőben. Ennek a beállításnak nincs hatása az oszlop helyzetére.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item overview depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Meghatározza a CI-k megjelenített oszlopait a konfigurációelem áttekintőben a CI osztálytól függően. Minden bejegyzést az oszlop neve és dupla kettőspont előtaggal kell ellátni (azaz Computer::). Van néhány olyan CI-attribútum, amely közös minden CI-vel (például a Computer osztálynál: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Az egyéni CI-attribútumok megjelenítéséhez, ahogy azok a CI-meghatározásban meg vannak adva, a következő sémát kell használni (például a Computer osztálynál): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Ha egy CI osztályhoz nincs bejegyzés, akkor az alapértelmezett oszlopok lesznek megjelenítve, ahogy az ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns beállításban meg van határozva.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the config item search depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that are common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown as defined in the setting ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns.'} =
        'Meghatározza a CI-k megjelenített oszlopait a konfigurációelem keresőben a CI osztálytól függően. Minden bejegyzést az oszlop neve és dupla kettőspont előtaggal kell ellátni (azaz Computer::). Van néhány olyan CI-attribútum, amely közös minden CI-vel (például a Computer osztálynál: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Az egyéni CI-attribútumok megjelenítéséhez, ahogy azok a CI-meghatározásban meg vannak adva, a következő sémát kell használni (például a Computer osztálynál): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Ha egy CI osztályhoz nincs bejegyzés, akkor az alapértelmezett oszlopok lesznek megjelenítve, ahogy az ITSMConfigItem::Frontend::AgentITSMConfigItem###ShowColumns beállításban meg van határozva.';
    $Self->{Translation}->{'Defines the shown columns of CIs in the link table complex view, depending on the CI class. Each entry must be prefixed with the class name and double colons (i.e. Computer::). There are a few CI-Attributes that common to all CIs (example for the class Computer: Computer::Name, Computer::CurDeplState, Computer::CreateTime). To show individual CI-Attributes as defined in the CI-Definition, the following scheme must be used (example for the class Computer): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. If there is no entry for a CI class, then the default columns are shown.'} =
        'Meghatározza a CI-k megjelenített oszlopait a kapcsolati tábla komplex nézetében a CI osztálytól függően. Minden bejegyzést az oszlop neve és dupla kettőspont előtaggal kell ellátni (azaz Computer::). Van néhány olyan CI-attribútum, amely közös minden CI-vel (például a Computer osztálynál: Computer::Name, Computer::CurDeplState, Computer::CreateTime). Az egyéni CI-attribútumok megjelenítéséhez, ahogy azok a CI-meghatározásban meg vannak adva, a következő sémát kell használni (például a Computer osztálynál): Computer::HardDisk::1, Computer::HardDisk::1::Capacity::1, Computer::HardDisk::2, Computer::HardDisk::2::Capacity::1. Ha egy CI osztályhoz nincs bejegyzés, akkor az alapértelmezett oszlopok lesznek megjelenítve.';
    $Self->{Translation}->{'Defines which type of link (named from the ticket perspective) can affect the status of a linked CI.'} =
        'Meghatározza, hogy mely kapcsolattípusok (a jegy nézőpontjából elnevezve) befolyásolhatják egy kapcsolt konfigurációelem állapotát.';
    $Self->{Translation}->{'Defines which type of ticket can affect the status of a linked CI.'} =
        'Meghatározza, hogy mely jegytípus befolyásolhatja egy kapcsolt konfigurációelem állapotát.';
    $Self->{Translation}->{'Deployment State Color'} = 'Üzembe állítási állapot színe';
    $Self->{Translation}->{'Deployment State Color.'} = 'Üzembe állítási állapot színe.';
    $Self->{Translation}->{'Deployment State Type.'} = 'Üzembe állítási állapottípus.';
    $Self->{Translation}->{'Disabled'} = 'Letiltva';
    $Self->{Translation}->{'Enabled'} = 'Engedélyezve';
    $Self->{Translation}->{'Enables configuration item bulk action feature for the agent frontend to work on more than one configuration item at a time.'} =
        'Engedélyezi a konfigurációelem tömeges művelet funkciót az ügyintézői előtétprogramnál, hogy egyszerre egynél több konfigurációelemmel dolgozhasson.';
    $Self->{Translation}->{'Enables configuration item bulk action feature only for the listed groups.'} =
        'Csak a felsorolt csoportoknak engedélyezi a konfigurációelem tömeges művelet funkciót.';
    $Self->{Translation}->{'Enables/disables the functionality to check ConfigItems for unique names. Before enabling this option you should check your system for already existing config items with duplicate names. You can do this with the script bin/otrs.ITSMConfigItemListDuplicates.pl.'} =
        'Engedélyezi vagy letiltja azt a funkcionalitást, amely a konfigurációelemek egyedi neveit ellenőrzi. A lehetőség engedélyezése előtt ellenőriznie kell a rendszerét, hogy vannak-e már létező konfigurációelemek kettőzött névvel. Ezt megteheti a bin/otrs.ITSMConfigItemListDuplicates.pl parancsfájllal.';
    $Self->{Translation}->{'Event module to set configitem-status on ticket-configitem-link.'} =
        'Eseménymodul a konfigurációelem állapotának beállításához egy jegy konfigurációelem hivatkozásán.';
    $Self->{Translation}->{'ITSM config item overview.'} = 'ITSM konfigurációelem áttekintés.';
    $Self->{Translation}->{'Module to check the group responsible for a class.'} = 'Egy modul egy osztályért felelős csoport ellenőrzéséhez.';
    $Self->{Translation}->{'Module to check the group responsible for a configuration item.'} =
        'Egy modul egy konfigurációelemért felelős csoport ellenőrzéséhez.';
    $Self->{Translation}->{'Module to generate ITSM config item statistics.'} = 'Egy modul ITSM konfigurációelem statisztikák előállításához.';
    $Self->{Translation}->{'Object backend module registration for the import/export module.'} =
        'Objektum háttérprogram modul regisztráció az importálás/exportálás modulhoz.';
    $Self->{Translation}->{'Overview.'} = 'Áttekintés.';
    $Self->{Translation}->{'Parameters for the deployment states color in the preferences view of the agent interface.'} =
        'Paraméterek az üzembe állítási állapotok színeihez az ügyintézői felület beállítások nézetében.';
    $Self->{Translation}->{'Parameters for the deployment states in the preferences view of the agent interface.'} =
        'Paraméterek az üzembe állítási állapotokhoz az ügyintézői felület beállítások nézetében.';
    $Self->{Translation}->{'Parameters for the example permission groups of the general catalog attributes.'} =
        'Paraméterek az általános katalógus attribútumainak példa jogosultság csoportjaihoz.';
    $Self->{Translation}->{'Parameters for the pages (in which the configuration items are shown).'} =
        'Paraméterek az oldalakhoz (amelyeken a konfigurációelemek megjelennek).';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} =
        'A szükséges jogosultságok az ITSM konfigurációelem képernyőjének használatához az ügyintézői felületen.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} =
        'A szükséges jogosultságok az ITSM konfigurációelem keresési képernyőjének használatához az ügyintézői felületen.';
    $Self->{Translation}->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} =
        'A szükséges jogosultságok az ITSM konfigurációelem nagyítási képernyőjének használatához az ügyintézői felületen.';
    $Self->{Translation}->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} =
        'A szükséges jogosultságok az ITSM konfigurációelem hozzáadása képernyőjének használatához az ügyintézői felületen.';
    $Self->{Translation}->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} =
        'A szükséges jogosultságok az ITSM konfigurációelem szerkesztése képernyőjének használatához az ügyintézői felületen.';
    $Self->{Translation}->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} =
        'A szükséges jogosultságok az ITSM konfigurációelem előzmények képernyőjének használatához az ügyintézői felületen.';
    $Self->{Translation}->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} =
        'A szükséges jogosultságok az ITSM konfigurációelem nyomtatása képernyőjének használatához az ügyintézői felületen.';
    $Self->{Translation}->{'Required privileges to delete config items.'} = 'A szükséges jogosultságok a konfigurációelemek törléséhez.';
    $Self->{Translation}->{'Search config items.'} = 'Konfigurációelemek keresése.';
    $Self->{Translation}->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} =
        'Kiválasztja a konfigurációelem számelőállító modulját. Az „AutoIncrement” növeli a konfigurációelem számát, a használt SystemID, ConfigItemClassID és számláló értékét. A formátum: „SystemID.ConfigItemClassID.Counter”, például: 1205000004, 1205000005.';
    $Self->{Translation}->{'Set the incident state of a CI automatically when a Ticket is Linked to a CI.'} =
        'Egy konfigurációelem incidensállapotának automatikus beállítása, amikor egy jegyet kapcsolnak egy konfigurációelemhez.';
    $Self->{Translation}->{'Sets the deployment state in the configuration item bulk screen of the agent interface.'} =
        'Beállítja az üzembe állítási állapotot az ügyintézői felület konfigurációelem tömeges művelet képernyőjén.';
    $Self->{Translation}->{'Sets the incident state in the configuration item bulk screen of the agent interface.'} =
        'Beállítja az incidensállapotot az ügyintézői felület konfigurációelem tömeges művelet képernyőjén.';
    $Self->{Translation}->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben, amely lehetővé teszi egy konfigurációelem hozzákapcsolását egy másik objektumhoz az ügyintézői felület konfigurációelem nagyítási nézetén.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the configuration item overview of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben egy konfigurációelem előzményeinek eléréséhez az ügyintézői felület konfigurációelem áttekintőjében.';
    $Self->{Translation}->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben egy konfigurációelem előzményeinek eléréséhez az ügyintézői felületen az elem nagyítási nézetében.';
    $Self->{Translation}->{'Shows a link in the menu to delete a configuration item in its zoom view of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben egy konfigurációelem törléséhez az ügyintézői felületen az elem nagyítási nézetében.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the configuration item overview of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben egy konfigurációelem kettőzéséhez az ügyintézői felület konfigurációelem áttekintőjében.';
    $Self->{Translation}->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben egy konfigurációelem kettőzéséhez az ügyintézői felületen az elem nagyítási nézetében.';
    $Self->{Translation}->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben egy konfigurációelem szerkesztéséhez az ügyintézői felületen az elem nagyítási nézetében.';
    $Self->{Translation}->{'Shows a link in the menu to go back in the configuration item zoom view of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben az ügyintézői felület konfigurációelem nagyítási nézethez való visszatéréshez.';
    $Self->{Translation}->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben egy konfigurációelem nyomtatásához az ügyintézői felületen az elem nagyítási nézetében.';
    $Self->{Translation}->{'Shows a link in the menu to zoom into a configuration item in the configuration item overview of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben egy konfigurációelembe történő nagyításhoz az ügyintézői felület konfigurációelem áttekintőjében.';
    $Self->{Translation}->{'Shows the config item history (reverse ordered) in the agent interface.'} =
        'Megjeleníti a konfigurációelem előzményeit (fordított sorrendben) az ügyintézői felületen.';
    $Self->{Translation}->{'The identifier for a configuration item, e.g. ConfigItem#, MyConfigItem#. The default is ConfigItem#.'} =
        'Egy konfigurációelem azonosítója, például: ConfigItem#, MyConfigItem#. Az alapértelmezett: ConfigItem#.';
    $Self->{Translation}->{'class'} = 'osztály';
    $Self->{Translation}->{'global'} = 'globális';

}

1;
