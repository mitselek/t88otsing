# Gig / Tükitöö Platvormi Strateegia

Viimane uuendus: 2025-08-13 (fact refresh)

## Eesmärk

Luua fokusseeritud lähenemine paindliku (tükitöö, gig, projekt) sissetuleku käivitamiseks ja skaleerimiseks, säilitades vabaduse ning kontrolli aja üle. Uuendatud faktid pärinevad platvormide avalikest kodulehtedest (külastus 2025-08-13).

## Kiirülevaade

- Primaarne fookus (0–30 päeva): kiire rahavool + profiili algreiting.
- Sekundaarne fookus (30–90 päeva): kõrgema marginaaliga platvormid + tõestuslood.
- Portfoolio / autoriteet: tehnilised või testimis-bounty’d, mis annavad mõõdetavaid tulemusi.
- Faktilised ankurdused (Malt, Testlio, GoWorkaBit) lisatud eraldi plokina all.

## Platvormi Korv (soovitatud algus)

| ROLL                      | PLATVORM   | ROLL FOKUS                               | MIKS                                            | STAATUS |
| ------------------------- | ---------- | ---------------------------------------- | ----------------------------------------------- | ------- |
| Kiire täitmine            | GoWorkaBit | lühivahetused / admin / lihtlogistika    | Baltikumi suurim paindliku töö portaal (slogan) | TODO    |
| Rahvusvaheline generalist | Upwork     | admin + liht dev/automation              | suur turg, mitmekesine nõudlus                  | TODO    |
| Euroopa kvaliteet         | Malt       | analüüs, automatsioon, kergem arendus    | 70K+ kliendi ja 550K+ freelanceri kogukond      | TODO    |
| Testimine                 | Testlio    | QA / testjuhtimine                       | EE juured, kvaliteet, usaldus                   | TODO    |
| Alternatiivne 0% fee      | Braintrust | automatsioon, analüüs                    | madalad kulud, community referral               | LATER   |
| Võistlus/bounty           | Gitcoin    | väiksed web3/andme bounty’d              | mõõdetavad tulemused, nähtavus                  | LATER   |
| Mikroteenus               | Fiverr     | standard paketid (andmepuhastus, skript) | passiivne inbound                               | LATER   |

Legenda: TODO = alustada, IN PROGRESS = profiil töös, LIVE = nähtav ja pakkumised, LATER = võimalik hilisem lisandus.

## Platvormide Detailid

### 1. GoWorkaBit

- URL: <https://www.goworkabit.com>
- Tüüp: Kohalik (Baltikum) lühitöö / vahetused.
- Avalik positsioneerimine: "The Baltic's largest gig and flexible workforce portal" (külastus 2025-08-13).
- Esmane eesmärk: 1–2 kiiret vahetust reputatsiooni ja värske referentsi jaoks.
- Profiili fookus: Usaldusväärsus, kohaletuleku täpsus, dokumenteeritud tööprotsessid.
- KPI: Esimene vahetus < 7 päeva.

### 2. Upwork

- URL: <https://www.upwork.com>
- Tüüp: Globaalne freelance turg (multi-kategooria: Development & IT, Admin & Support jne; külastus 2025-08-13).
- Fee mudel (talentile otsene teenustasustruktuur ei täpsustata avalehes, kliendi poolel rõhutatud tasuta töökuulutamine; NB: täpne freelancer service fee kontrolli pärast konto loomist – ära ankurda numbrit siia ilma kinnitamiseta).
- Esmane eesmärk: 2 väikest fixed-price projekti (≤ $150) 30 päeva jooksul + 2 positiivset arvustust.
- Profiili väärtuspakkumine (draft): "Process & data hygiene sprint: struktureerin segase sheet'i, puhastan andmed ja kirjutan mini-SOPi, mis vähendab kordusküsimusi."
- Esimesed paketid (ideed):
  1. Admin / Research sprint (andmete puhastamine, 2–3h)
  2. Google Sheets konsolideerimise skript (multi-sheet → normalized CSV)
  3. Dokumentatsiooni struktuuri audit (1 päev, fikseeritud)
- Eristajad: Kiire struktureeritud progress update (Done / Doing / Next / Risks), läbipaistev muutuste logi.
- KPI: 2 arvustust >4.9 rating 30 päeva jooksul.

### 3. Malt

- URL: <https://www.malt.com>
- Tüüp: Euroopa freelance (kvaliteet / kõrgem hinnatase).
- Avalikud numbrid (külastus 2025-08-13): 70K+ kliendid, 550K+ freelancerid, 255K+ edukalt lõpetatud projekti.
- Fookus: Analüüs, protsesside kaardistamine, kerge tehniline automatiseerimine.
- Profiili väärtuspakkumine (draft): "Reduce onboarding friction: clean data, structure file space, deliver 1‑page SOP that cuts clarification loops."
- Hinnastamise algusvahemik (draft, kinnitamata): €40–€55/h (testimiseks), tõstmine pärast 2 kinnitatud case'i.
- KPI: Profiil LIVE + 1 inbound päring 60 päeva jooksul.

### 4. Testlio

- URL: <https://testlio.com>
- Tüüp: Hallatud crowdsourced testimisplatvorm.
- Avalik katvus (külastus 2025-08-13): 600K+ seadmed, 800+ maksemeetodit, 150+ riiki, 100+ keelt.
- Fookus: Struktureeritud testiplaanid, regressioon- ja kasutajateekonna läbilõiked.
- Onboarding: Kandideerimisvorm + võimalik kvalifitseeruv test (detailid kinnitada pärast registreerimist).
- KPI: Onboarding lõpetatud 30 päeva jooksul.

### 5. Braintrust (LATER)

- URL: <https://www.braintrust.com>
- Eristus (ajalooline positsioneerimine): 0% freelancer fee (talent hinnastab, kliendi tasu platvormile). Kinnita jooksvas UI-s enne kommunikatsiooni.
- Märkus: Esilehel hetkel tugev rõhk AI-põhiste intervjuude toodetel (AIR); jälgi, kas võrgu (talent network) onboarding on eraldi.
- Trigger aktiveerimiseks: Kui Upwork + Malt koos toovad > €1500/kuu.

### 6. Gitcoin (LATER)

- URL: <https://www.gitcoin.co>
- Kasutus: Väikesed bounty’d portfooliosse (PR-id, mõõdetavad panused).
- KPI: 2 accepted bounty PR-i 90 päeva jooksul.

### 7. Fiverr (LATER)

- URL: <https://www.fiverr.com>
- Paketi mõtted: "Data Cleanup 500 rows", "Markdown → Structured HTML", "Mini ETL Script".
- KPI: 3 paketti LIVE; 1 müük 60 päeva jooksul.

## Strateegilised Sambad

1. Reputatsioon: Väiksed, kontrollitud ulatusega ülesanded → kõrge hinne → laiendamine.
2. Nähtavus: Standardiseeritud väärtuspakkumine + korduv portfoolio snippet.
3. Süsteemid: Iga töö → lühike internal post-mortem (õppetunnid, taaskasutatav skript).
4. Hinnastamine: "Entry credible" → tõsta iga 2–3 positiivse referentsi järel.
5. Riskijuhtimine: Paralleelselt maksimaalselt 2 aktiivset avatud gig'i kuni voog stabiliseerub.

## Profiili Tuum (Template Draft)

(Placeholder – täidetakse hiljem)

- 3-lause value proposition:
  1. ...
  2. ...
  3. ...
- Core Competencies (bulletid): ...
- Tõestus (quick metrics): ...
- Toolstack (kergelt, mitte liigne): ...

## Upwork Pitch (Template Draft)

Subject: Quick, structured help with [X small process]

Hi [Client Name],

[1 lause väärtus]
[1 lause probleem + tulemusraam]
[Credibility: 1 konkreetne kvant fakt]
[Mini approach: 2–3 bulletit]
[Call to action + risk reversal]

Cheers,
Mihkel

## Malt Profiili Intro (Template Draft)

"..."

## Testlio Onboarding Märkmed (Placeholder)

- Vajalikud dokumendid: ...
- Ajakulu hinnang: ...

## KPI Kokkuvõte

| KPI                         | SIHT      | TÄHTAEG    | STAATUS |
| --------------------------- | --------- | ---------- | ------- |
| GoWorkaBit: esimene vahetus | < 7 päeva | 2025-08-19 | OPEN    |
| Upwork: 2 arvustust         | 30 päeva  | 2025-09-11 | OPEN    |
| Malt: profiil LIVE          | 30 päeva  | 2025-09-11 | OPEN    |
| Testlio: onboarding         | 30 päeva  | 2025-09-11 | OPEN    |
| Gitcoin: 2 bounty PR-i      | 90 päeva  | 2025-11-10 | OPEN    |
| Fiverr: 1 müük              | 60 päeva  | 2025-10-11 | OPEN    |

## Järgmised Vahetud Sammud (Sprint 0)

- [ ] Kinnita platvormi korv (kas muudatusi?)
- [ ] Koosta 3-lause value proposition draft
- [ ] Täida Upwork profiili põhi (headline, overview, 2 skill tag'i)
- [ ] Defineeri 2 väikest Upwork pakkumist detailsemalt
- [ ] Registreeru GoWorkaBit ja saada esimene kandideerimine
- [ ] Kaardista varasem kogemus → 3 kvant näidet (admin/protsess/automatsioon)

## Märkmed / Inbox

## Faktilised Ankurdused (Snapshot 2025-08-13)

| Platvorm   | Avalik number / väide                                     | Allikas / Märkus                 |
| ---------- | --------------------------------------------------------- | -------------------------------- |
| Malt       | 70K+ kliendid; 550K+ freelancerid; 255K+ projekti         | Malt avaleht (loetud 2025-08-13) |
| Testlio    | 600K+ seadmed; 800+ maksemeetodit; 150+ riiki; 100+ keelt | Testlio avaleht                  |
| GoWorkaBit | "The Baltic's largest gig and flexible workforce portal"  | GoWorkaBit landing               |
| Braintrust | 0% freelancer fee (ajalooline)                            | Kinnita enne kasutamist          |

NB: Ära kasuta numbreid turundusväiteks väljaspool konteksti ilma kuupäevata; uuenda snapshot kvartalis.

---

## REMOTE (Salaried / Pikemad Lepingud) Lisamoodul

Lisatud info põhineb failil `remote_job_opportunities.md` (viimane versioon kuupäevaga 2025-06-03) + konsolideeritud vaade. Eesmärk: integreerida kaugpalkade otsing gig-strateegiaga nii, et fookus hajuks minimaalselt.

### Core Remote Platvormid (Täiendavad)

| Platvorm       | Fookus                  | Kategooriad (näited)           | Tüübid           | Märgatavad omadused                        |
| -------------- | ----------------------- | ------------------------------ | ---------------- | ------------------------------------------ |
| WeWorkRemotely | Suurim remote community | Programming, Design, Support   | FT, PT, Contract | Tugev tech presence, detailne kuulutus     |
| Remote.co      | Kureeritud listingud    | Developer, Designer, Marketing | Peamiselt FT     | Remote policy info, kvaliteet > kvantiteet |
| RemoteOK       | Tech keskne             | Development, Design, Marketing | FT, Contract, PT | Reaalajas feed, palgavahemikud             |

NB: Need lisatakse "salaried track" allika korvi; aktiivselt jälgida samaaegselt maks 2 korraga (nt WeWorkRemotely + RemoteOK), et mitte ujutada.

### Kõrge Nõudlusega Oskuste Klaster (Q2–Q3 2025)

- Frontend: React / TypeScript / CSS utility (Tailwind)
- Backend: Node.js / Python / Go, pilv (AWS / GCP / Azure)
- Full-stack: Next.js / MERN muster + Postgres / Mongo
- DevOps: Docker, Kubernetes, CI/CD, IaC (Terraform)
- Kvaliteet & Test: Automatiseerimise alused + struktureeritud repro sammud

Fookus: Tükitöö profiilides rõhuta ülekantavaid protsessi / struktureerimise oskusi; salaried taotluste puhul vali 1 süvendatav tehniline rida (nt "Data pipeline hygiene + lightweight automation with Python").

### Palgavahemiku Orientiir (USD, globaalsed remote kuulutused – varieerub)

| Tase           | Vahemik (USD/aasta) | Märkus                               |
| -------------- | ------------------- | ------------------------------------ |
| Junior Dev     | 40k – 70k           | Suur hajuvus asukohast ja stackist   |
| Mid-level      | 70k – 120k          | Core stack + iseseisev töö           |
| Senior         | 120k – 180k         | Süsteemi disain, mentoring           |
| Lead/Principal | 180k – 250k+        | Arhitektuur, strateegia, stakeholder |

Allikas: Konsolideeritud turu vaatlused; täpne pakkumine kinnitatakse vestluse käigus. Ära kasuta publik materjalis ilma kuupäevata. (Snapshot 2025-06, viide failile.)

### Application Strategy (Integreerimine KPI-dega)

Phase 1 (Profile Readiness – paralleel Sprint 0 gig):

1. LinkedIn remote optimiseerimine (headline: process & data hygiene + remote reliability)
2. Üks salary-CV variant (ja eraldi gig CV / profiilid)
3. Portfolio: 1 mini-case (andmepuhastus + SOP) – jagatud mõlemas track'is.

Phase 2 (Targeted Outreach – algus pärast vähemalt 1 gig review):

1. 5–7 kohandatud avaldust nädalas (WeWorkRemotely + RemoteOK filtreeritud)
2. Registry laiendus: veerud Source / Follow-up Date / Outcome.

Phase 3 (Interview Prep):

1. Video setup check (valgus, heli, neutraalne taust)
2. 3 STAR-lugu: (a) Data cleanup turnaround, (b) Documentation reducing clarifications, (c) Ad-hoc automation.

Kill Rule (Salaried track): Kui 4 nädala jooksul <2 kvalifitseeritud vastust, vähenda mahtu ja suuna lisaenergia gig profile case'ide tugevdamisele.

### Cross-over Sünergiad

| Gig Artefakt            | Kasutus salaried kandideerimisel | Täiendus                              |
| ----------------------- | -------------------------------- | ------------------------------------- |
| Data cleanup + SOP case | Portfoolio link / PDF            | Lisa enne–pärast KPI tabel            |
| Upwork review'd         | Reliability signaal              | Tõlgi neutraalseks tsitaadiks (luba?) |
| Testlio onboarding      | Kvaliteeditöö muster             | Highlight: structured test steps      |

### Järgmised Mikrosammud (Remote lisandus)

- [ ] LinkedIn headline draft lisada strateegiafaili (TODO märk)
- [ ] Lisa Registry laiendatud skeem (README või eraldi `REGISTRY_REMOTE.md`?)
- [ ] Koosta 3 STAR bulletit ja salvesta `STAR_bank.md`

---

- Mõelda: kas lisada Worksome vs Braintrust varem?
- Maksustamine: hinnata FIE vs OÜ → lihtsaim lähikuudeks.
- Lisada sisemine logi fail igale platvormile (communication/).
