# Mehhatrooniku intervjuu - Praktiline demonstratsioon

Last updated: 2025-09-26T13:40:24+03:00

**Intervjuu**: 26. september 2025, kell 12:00 (Google Meet) **Lahendus**: "API standardiseerimine ja kommunikatsiooniprotokollide ühtne rakendamine"
**Positsioon**: Mehhatroonik  
**Ettevõte**: 1UP Technology OÜ

---

## GOOGLE MEET DEMONSTRATSIOON VÕIMALUSED

### 1. GitHub Profiili Demonstratsioon

#### Touch-tone projekt - IDEAALNE NÄIDE

**URL**: [github.com/mitselek/touch-tone](https://github.com/mitselek/touch-tone)

**Demonstratsiooni skript (2-3 minutit)**  

1. **Avaekraan ja kirjeldus**

   - "See on minu kõige relevantesim projekt mehhatrooniku rolli jaoks"
   - Näitan README faili - projektide ülevaade ja eesmärk
   - Rõhutan: "C++ riistvara rakendus assisteeriva tehnoloogia jaoks"

2. **Koodistruktuur**  

   - Näitan kaustade struktuuri
   - Rõhutan: "Riistvara ja tarkvara integratsioon ühes projektis"
   - Tutvustan peamisi faile (main.cpp, hardware interface, signal processing)

3. **Tehnilised aspektid**:

   - Kommentan koodi kvaliteeti ja organisatsiooni
   - Selgitan riistvara-tarkvara liidese põhimõtteid
   - Rõhutan: "See oli täpselt mehhatroonika - mehhaaniline disain + programmeerimine"

#### Entu Webapp projekt - Süsteemiintegratsioon

**URL**: [github.com/entu/webapp](https://github.com/entu/webapp)

**Demonstratsiooni kirjeldus (1-2 minutit)**  

- "30+ organisatsiooni kasutab, näitab skaleeritavuse oskusi"
- "Full-stack arendus ja süsteemiintegratsioon"
- "Sarnane PLC süsteemidega - andmete töötlemine ja juhtimine"

### 2. CAD Oskuste Kirjeldamine (kui küsitakse)

#### SolidWorks kogemus

**Demonstreerida oskusi verbaalselt**  

- "Touch-tone projektis kasutasin SolidWorksi mehhaanilise korpuse disainile"
- "Oskan luua 3D mudeleid, määrata tolerantse ja eksportida STEP faile"
- "3D printimise kogemus on õpetanud materjali omadused ja tootmispiiranguid"

**Näited, mida kirjeldada**  

- Tolerantside määramine elektroonikakomponentidele
- STEP failide eksportimine erinevate tootmissüsteemide jaoks
- Materjalide valimine funktsionaalsuse põhjal

#### Onshape kogemus

- "Pilvepõhise CAD süsteemi kasutamine koostööprojektides"
- "FeatureScript programmeerimise oskused"
- "Versioonihaldus CAD projektides"

### 3. Tehniliste Oskuste Näitamine

#### Programmeerimiskogemuste tutvustus

**30+ GitHub projekti**  

- Näita profiili statistikaid: "Aktiivsed panustamised läbi aastate"
- Rõhuta mitmekesisust: "Python, JavaScript, C++, Java"
- Seletama pikaajalise pühendumust: "Järjepidev areng 15+ aastat"

**Spetsiifilised tehnoloogiad**  

- Python (9/10) - "PLC programmeerimise jaoks väga kasulik"
- C++ - "Riistvara lähedustrogrammeerímine"
- Süsteemiintegratsioon - "API-d, andmevahetused"

---

## PRAKTILISED OSKUSED INTERVJUUS

### CAD/3D Modelleerimine (kui küsitakse tehnilisi detaile)

#### SolidWorks töövoog

1. **Skitseerimine**: "Alustan alati 2D visandist ja mõõtmete määramisest"
2. **3D modelleerimine**: "Kasutan ekstruusion, revolutsioon ja loft operatsioone"
3. **Koostefailid**: "Osad - alambühingud - põhikoost"
4. **Joonised**: "Tootmisjoonised tolerantsidega ja märkustega"
5. **STEP eksport**: "Universaalne formaat erinevate süsteemide jaoks"

#### Praktilise kogemuste kirjeldamine

**Touch-tone seadme disain**  

- "Korpuse disain elektroonika majutamiseks"
- "Nuppude ja lülitite paigutus ergonoomika järgi"
- "Kaablite juhtmise lahendused"
- "Kinnitusdetailide disain"

**3D printimise kogemus**  

- "Prototüüpide valmistamine PLA materjaalist"
- "Tugistruktuuride optimeerimine"
- "Järeltöötlus ja viimistlemine"
- "Iteratiivne disain - test, täiusta, testi uuesti"

### Mehhatroonika Integratsioon (võtmeoskus)

#### Riistvara-tarkvara liideste disain

**Touch-tone projektist**  

- "Kuidas ühendada andurid (mikrofonid) tarkvara programmeerimisega"
- "Signal processing reaalajas - heli tuvastamine ja analüüs"
- "Kasutajaliidese disain füüsiliste nuppude kaudu"
- "Tagasiside süsteemid (LED-id, vibratsioon)"

#### Süsteemitehnika põhimõtted

- **Modulariteet**: "Erinevad funktsioonid eraldi moodulitena"
- **Viganestvus**: "Sensory failide korral töökindel käitumine"
- **Kalibreerimine**: "Seadme häälestamine erinevates tingimustes"
- **Testimine**: "Süstemaatiline lähenemisviis vigade tuvastamisele"

---

## 🔍 PROBLEEMILAHENDUSE DEMONSTRATSIOON

### Näide 1: Touch-tone signaalitöötlus

**Probleem**: "Seade ei tuvastanud telefoni toone õigesti"
**Lähenemisviis**

1. Probleemi isoleerimine - riistvara või tarkvara?
2. Signaali analüüs ossilloskoobiga
3. Algoritmi täiustamine ja filtreerimise optimeerimine
4. Riistvara paigutuse ülevaatamine
   **Lahendus**: "Kombineeritud lähenemisviis - nii tarkvara kui riistvara muudatused"

### Näide 2: PÖFF projektijuhtimine

**Probleem**: "Erinevad tehnilised moodulid ei integreerinud õigesti"
**Lähenemisviis**

1. Probleemi tuvastamine süstemaatiliste testidega
2. Meeskonna kaasamine problemaatika analüüsimisse
3. Arhitektuuriliste muudatuste planeerimine
4. Järkjärguline rakendamine ja testimine
   **Lahendus**: "API standadiseerímine ja kommunikatsiooni protokollide ühetaoline rakendamine"

---

## 🛠️ TEHNILISE KOMPETENTSI NÄITAMINE

### Terminoloogia valdamine

**CAD/Mehhaaniline disain**  

- Tolerance stacks (tolerantside kuhjumine)
- Material properties (materjali omadused)
- Assembly constraints (koostepiirangud)
- Manufacturing considerations (tootmise nõuded)

**Automatiseerimine**  

- PLC (Programmable Logic Controller)
- HMI (Human Machine Interface)
- SCADA (Supervisory Control and Data Acquisition)
- Industrial protocols (tööstusprotokollid)

**Mehhatroonika**  

- Sensor fusion (andmete ühendamine)
- Actuator control (täiturite juhtimine)
- Real-time systems (reaalajas süsteemid)
- Hardware-software co-design

### 1UP Technology kontekstis

**Fanuc robotid**  

- "Olen uurinud Fanuc KAREL programmeerimiskeelt"
- "Mõistada kinemaatikat ja koordinaatsüsteeme"
- "TCP (Tool Center Point) kalibreerimine"

**Automatiseerimisprojektid**  

- "Puidutööstuses on ilmselt vaja spetsiaalseid haardeid"
- "Sensorid kvaliteedi kontrolliks ja ohutuseks"
- "Konveierisüsteemide integratsioon"

---

## 📱 TEHNILINE SETUP GOOGLE MEET'il

### Vajalik ettevalmistus

#### Ekraani jagamine

- Kontrolli, et ekraani jagamine toimib
- Valmista GitHub paremini ette eraldi aknas
- Sule kõik mittevajalikud programmid

#### Internet ühenduse kontroll

- Testi videokvaliteeti ja -audio'i
- Valmista ette tagavaraühendus (telefoni hotspot)

#### Materjalide ettevalmistus

- GitHub profiili link kopeeritud
- Touch-tone projekti link valmis
- Entu Webapp link valmis

### Demonstratsiooni ajakava

**Kogua demonstratsiooni aeg**: Maksimaalselt 5-7 minutit
**Jaotus**

- Touch-tone projekt: 3-4 minutit
- GitHub ülevaade: 2-3 minutit
- Lisaküsimused: Vastavalt vajadusele

---

## 🎯 DEMONSTRATSIOONI EESMÄRGID

### Peamised sõnumid

1. **Praktiline kogemus**: "Ma ei ole ainult teoreetik - mul on põhiõliseid projekte"
2. **Mehhatroonilise mõtlemisviis**: "Suudan ühendada mehhaanikat, elektroonikat ja programmeerimist"
3. **Õppimisvalmidusis**: "Aktiivsed GitHub panustamised näitavad pidevat arengut"
4. **Süstemaatiline lähenemisviis**: "Struktureeritud lähenemisviis projektide arendamisele"

### Mida väldi demonstratsioonis

- ❌ Liiga tehnilised detailid, mis võivad segadust tekitada
- ❌ Liiga palju erinevaid projekte - keskenduvs touch-tone'ile
- ❌ Keerulise koodi analüüs - fookus funktsioonidel ja tulemukstel
- ❌ Liiga pikk aeg ühes kohas - hoia tempo dünaamiline

---

## ✅ LÕPLIKU ETTEVALMISTUSE KONTROLL

### Tehniliselt valmis

- [x] Google Meet testimine
- [x] Ekraani jagamise testimine
- [x] GitHub profiil korras
- [x] Touch-tone projekt leh avatav
- [x] Internet stabiilsus kontrollitud

### Sisu valmidus

- [x] Demonstratsiooni skript läbi harjutatud
- [x] Peamised tehnilised terminid selged
- [x] Projektide kirjeldused valmis
- [x] Küsimused ettevõtte kohta valmis
- [x] CAD oskuste kirjeldamine valmis

### Mentaalne ettevalmistus

- [x] Enesekindlus tehniliste oskuste osas
- [x] Selge nägemus oma väärtusest ettevõttes
- [x] Valmidus spontaansete küsimuste jaoks
- [x] Positiivne ja professionaalne hoiak
