# Patsiendi Üldandmete Teenus (PÜT)

**Kuupäev:** 1. juuli 2025  
**Kontekst:** UpTIS komponendi dokumentatsioon

---

## Ülevaade

Patsiendi Üldandmete Teenus (PÜT) on osa uue põlvkonna tervise infosüsteemist (UpTIS), mis lahendab patsiendi üldandmete (nimi, aadress, telefon, e-post jms) killustumise ja kvaliteediprobleemid tervisevaldkonnas.

## Praegune probleem

### Andmete killustatus

- **Erinevad süsteemid:** Haiglad, perearstid, eriarstikeskused, hambaravikliinikud koguvad andmeid eraldi
- **Vormingu puudumine:** Ühtseid nõudeid kogutud andmete vormingu kohta ei ole
- **Uuendamise probleem:** Puuduvad reeglid andmete ajakohastamiseks
- **Vananenud andmed:** Infosüsteemides suur hulk aegunud üldandmeid

### Kvaliteediprobleemid

- **Erinevad andmed:** Sama isiku kohta erinev info eri süsteemides
- **Korduv kogumine:** Sama infot kogutakse korduvalt
- **Puudulikud andmed:** Info eestkoste, hooldusõiguse, töövõimekao kohta puudub

## PÜT lahendus

### Eesmärgid

- **Ühtsed üldandmed:** Kõikides tervisevaldkonna lahendustes sama info
- **Ajakohasus:** Regulaarne andmete uuendamine
- **Kvaliteet:** Parem andmekvaliteet tervishoiuteenuse osutamiseks
- **Efektiivsus:** Aja kokkuhoid sisestamise ja otsimise arvelt

### Uued võimalused

- **Eestkoste info:** Automaatne eestkoste andmete saamine
- **Hooldusõigus:** Hooldusõiguse info kättesaadavus
- **Töövõimekao andmed:** Töövõime info automaatne edastamine
- **Puuete info:** Puuete andmete kättesaadavus

## Tehnilised lahendused

### Andmeallikad

PÜT suhtleb järgmiste riiklike andmekogudega:

- **Siseministeerium** (rahvastikuregister)
- **Sotsiaalkindlustusamet** (töövõimekadu, puuded)
- **Töötukassa** (tööhõive andmed)
- **Maksu- ja Tolliamet** (maksualased andmed)
- **Maa-amet** (aadressi andmed)

### Andmete alglaadimine

- **Rahvastikuregister:** Eesti isikukoodi omavate isikute algandmed
- **Operatiivne lahendus:** Kiire ja hästi skaleeruv süsteem
- **Regulaarne uuendamine:** Muudatuspäringud andmete ajakohana hoidmiseks

### Andmete rikastamine

- **Tervishoiuasutustelt saadav info:** Telefonid, e-post, lisaaadressid
- **Vastastikune täiendamine:** PÜT saab täiendada ka rahvastikuregistri andmeid
- **Kahesuunaline andmevahetus:** Mitte ainult tarbimine, vaid ka andmine

## Kasutegur erinevate osapoolte jaoks

### Patsiendile

- **Parem kontakt:** Kvaliteetsem suhtlus tervishoiuteenuse osutajatega
- **Automaatsus:** Ei pea korduvalt sama infot andma
- **Ajakohasus:** Andmed on alati värskemad

### Tervishoiuteenuse osutajale

- **Kvaliteetsem andmetöötlus:** Täpsemad ja ajakohasemad andmed
- **Aja kokkuhoid:** Vähem käsitsi sisestamist ja otsimist
- **Lisainfo:** Eestkoste, hooldusõiguse, puuete info automaatselt
- **Töövoo efektiivsus:** Vähem bürokraatiat

### Tervisesüsteemile

- **Üleüldine andmekvaliteet:** Ajakohasem info kõikides süsteemides
- **Standardiseerimine:** Ühtsed andmevahetuspõhimõtted
- **Automatiseerimine:** Vähem käsitsi töötlemist

## Tehnilised materjalid

### Arendajatele

- **Juurutusjuhend:** [fhir.ee/ImplementationGuide/mpi/](https://fhir.ee/ImplementationGuide/mpi/index.html)
- **Protsessi analüüs:** [Patsiendi üldandmete teenuse analüüs](https://pub.e-tervis.ee/manuals/Patsiendi%20%C3%BCldandmete%20teenuse%20anal%C3%BC%C3%BCs/1)

### HL7 FHIR integratsioon

- PÜT kasutab HL7 FHIR standardit andmevahetuseks
- Vastab UpTIS üldistele arhitektuuripõhimõtetele
- Toetab mikroteenuste arhitektuuri

## Seos UpTIS-iga

PÜT on üks UpTIS-i põhikomponente, mis:

- Realiseerib "andmete ühekordse küsimise" põhimõtet
- Toetab reaalajas andmevahetust
- Vähendab andmete dubleerimist
- Parandab kogu süsteemi andmekvaliteeti

---

**Märkus:** PÜT on konkreetne näide sellest, kuidas UpTIS lahendab praktilisi probleeme tervisevaldkonnas, ühendades erinevaid riiklikke andmekogu ja tagades patsiendi üldandmete kvaliteedi.

_Allikas: [TEHIK Patsiendi üldandmete teenus](https://www.tehik.ee/patsiendi-uldandmete-teenus)_
