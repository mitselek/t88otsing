# TEHIK E-tervise IT-lahenduste Arendamise Põhimõtted

**Kuupäev:** 1. juuli 2025  
**Allikas:** TEHIK (viimati uuendatud veebruar 2024)

TEHIKu e-tervise arhitektuuripaneel kasutab neid põhimõtteid lahenduste hindamisel. Need on soovituslikud kõikidele tervisesüsteemi tarkvara arendajatele.

---

## Ärilised põhimõtted

### Kasutajakeskne lähenemine

- **Kasutajakeskne disain** (User Centered Design Thinking)
- **Protsessianalüüs:** Kohustuslik kooskõlastatud protsessianalüüsi dokument
- **Avalike süsteemide läbipaistvus:** Avalike infosüsteemide protsessianalüüsi tuleb publitseerida

### Once-Only printsiibi järgimine

- **Andmete ühekordne küsimine:** Vältida dubleerivat andmete kogumist
- **Andmete taaskasutamine:** Juba kogutud andmete kasutamine teiste süsteemide poolt
- **Liidestuslepingud:** Prognoosida kasutusmaht ja sõlmida lepingud

### Õiguslik alus ja andmekvaliteet

- **Õiguslik alus:** Iga terviseandmete töötlemise jaoks vajalik
- **Andmekvaliteedi kontroll:** Koheselt uute teenuste käivitamisel
- **Kontrolli asukoht:** Võimalikult allika lähedal, ideaalis sisestamisel

### Mittefunktsionaalsed nõuded (MFN)

- **E-ITS nõuded:** Vastavus e-riigi IT-süsteemide nõuetele
- **Riskianalüüs:** Kohustuslik kõikide lahenduste jaoks
- **Käideldavus:** Süsteemi töökindluse tagamine
- **Süsteemi autonoomsus:** Sõltumatus teistest süsteemidest

### Integratsioon ja migratsioon

- **Olemasolevate lahenduste hindamine:** Integratsioon või migratsioon
- **Sujuv üleminek:** Kasutajate jaoks häireteta siirdumine
- **Selged eesmärgid:** Igal komponendil peab olema selge eesmärk

### Ühine infoväli

- **Sündmuspõhine andmevahetus:** Andmed TIS-i kohe loomise hetkel
- **Automaatne jagamine:** Kasutaja ei pea eraldi toiminguid tegema
- **Teisene kasutus:** Dokumenteeritud protsessid ja ligipääsupoliitika

---

## Koosvõime põhimõtted

### Rahvusvahelised standardid

- **HL7 FHIR (Fast Healthcare Interoperability Resources):** Primaarne terviseandmete andmevahetusstandard
- **FHIR ressursid:** Dokumenteeritud kasutatavad ressursid/profiilid
- **HL7 Estonia:** Soovitame kasutada kohalikke profiile

### Terminoloogiad ja klassifikaatorid

- **Rahvusvahelised koodisüsteemid:** SNOMED CT, LOINC, ICD, ATC
- **Standarditud terminoloogiad:** Ühtsed kodeerimistavad

### Andmevahetus

- **X-tee:** Riiklike andmekogudega suhtlemisel kohustuslik
- **REST API:** Soovituslik uute teenuste jaoks
- **API-first lähenemine:** Liidese dokumenteerimine enne arendust
- **Test-driven development:** Testide kirjutamine enne arendust

---

## Tehnilised põhimõtted

### Arhitektuur

- **Mikroteenused:** Monoliitlahenduste asemel
  - Üks teenus = üks äriprobleem
  - Vähesed omavahelised sõltuvused
  - Sõltumatu paigaldus ja uuendamine
  - Kõrg-käideldavus ja testimine

### Kasutajaliides

- **Mikroesitluskiht:** Komponentide põhine lähenemine
- **WCAG nõuded:** Ligipääsetavuse tagamine
- **VEERA disainisüsteem:** Riigi ühine disainisüsteem

### Pilvekõlbulikkus

- **Skaleeritavus:** Koormuse kasvuga toimetulek
- **Vastupidavus:** Vigade suhtes vastupidav
- **Jälgitavus:** Monitooring ja logide haldus
- **Automatiseerimine:** Automatiseeritud protsessid
- **Turvalisus:** Pidev turvanõuete täitmine

### Tehnoloogiate valik

- **Töökindlad lahendused:** Eelistatult vabavaralised
- **Eesti kompetents:** Kohalik arendus- ja halduskompetents
- **Vendor lock-in vältimine:** Sõltuvuse vähendamine ühest tarnijast

### Andmete käitlemine

- **Täielik eksport/import:** Andmete liikuvus tagatud
- **Isikupõhine eksport:** GDPR nõuete täitmine
- **Dokumenteeritud andmemudel:** Migratsiooniks ja sekundaarseks kasutuseks

### Kvaliteedi tagamine

- **Automaatsed koodikontrollid:** CI/CD pipeline'is
- **Automatiseeritud testid:** Osa arendustsüklist
- **Protsessimootor:** Camunda või Flowable töövoogude jaoks
- **Korduvkasutatavad komponendid:** Riigi koodivaramu kasutamine

### Monitooring ja auditeeritavus

- **OpenTelemetry standard:** Monitooringu jaoks
- **Audit logi:** Eraldatud muudest logidest
- **Andmejälgija liides:** eesti.ee portaalile
- **Toimingute jälgimine:** Kes, millal, kelle andmetega

### Turvalisus

- **Turvakaalutlused:** Projekteerimisel kohe arvestatud
- **Turvatestid:** Välise osapoole poolt enne toodangusse minekut
- **TARA integratsioon:** Turvaline autentimine
- **Turbevead:** Kõik vead parandatud enne käivitamist

### Dokumentatsioon

- **Arhitektuuridokument:** Süsteemi ülesehitus
- **Integratsioonide kirjeldus:** Liidestuste dokumenteerimine
- **Andmemudel:** Andmestruktuuride kirjeldus
- **Paigaldusjuhend:** Tehnilise paigalduse instruktsioonid
- **Ajakohasus:** Dokumentatsiooni pidev uuendamine

### Terviseportaali integratsioon

- **Patsiendi vaade:** Andmete kuvamine riiklikus terviseportaalis
- **Tervisejuhtimise töölaud:** Tervishoiutöötajate andmevaatur
- **Planeerimise kohustus:** Enne arenduse alustamist visandada

---

**Märkus:** Need põhimõtted on kohustuslikud TEHIK arhitektuuripaneeli hindamisel. Kõikidele teistele on need soovituslikud, kuid soovitatavad parimate praktikate järgimiseks.

_Allikas: [TEHIK E-tervise IT-lahenduste arendamise põhimõtted](https://www.tehik.ee/e-tervise-it-lahenduste-arendamise-pohimotted)_
