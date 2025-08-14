# Rate Card (Draft) – Internal

Viimane uuendus: 2025-08-13

Eesmärk: Ühtne hinnastamise alus gig- ja freelance-platvormidel. Mitte avaldada tervikuna; välisele kasutusele läheb vaid konkreetne pakkumine. Kõik numbrid ilma käibemaksuta (kui lisandub, märgi kliendile eraldi). Valuutakonverteerimine ümardada lähima 1 ühikuni.

## 1. Põhiprintsiibid

- Hind = (Aeg \* Tunnikulu) + Väärtuskomponent (↑ kui dokumentatsioon / riskivähendus).
- Väldi liiga madalat sisenemist: ei alla baastaseme (Cost Floor) isegi esimese review nimel.
- Tõstmine: iga 2 järjestikuse positiivse (≥4.9) review + 1 mõõdetud case.
- Paketid väljendavad tulemusi, mitte tooreid tunde ("Clean + SOP", mitte "3h töö").

## 2. Sisekulude Ligikaudne Baas (ei avalikustata)

| Komponent                     | Arvutus                                                    | Märkus                |
| ----------------------------- | ---------------------------------------------------------- | --------------------- |
| Tunnikulu sisemine            | (FIE/OÜ siht palgakomponent + maksud + overhead)/töötunnid | Arvuta kord kvartalis |
| Miinimum efektiivne tunnimäär | tunnikulu \* 1.35                                          | Katab puhvrid         |

NB: Sisesta tegelik arv pärast maksustruktuuri kinnitamist.

## 3. Upwork (USD)

| Pakkumine                  | Scope (draft)                          | Algus hind | Raise Trigger        |
| -------------------------- | -------------------------------------- | ---------- | -------------------- |
| Data Cleanup Sprint        | ≤500 rida, 1 sheet, log + mini-SOP     | $75 fixed  | 2 arvustust + 1 case |
| Sheet Consolidation Script | ≤3 input sheet'i → normaliseeritud CSV | $120 fixed | Sama                 |
| Documentation Mini Audit   | ≤1 failistruktuur / ≤6 folderit        | $140 fixed | Sama                 |

Järgmine tõste: +15–20% kui keskmine tööaeg < hinnang.

## 4. Malt (EUR)

| Teenus                         | Algus €/h | Siht €/h (12–16w) | Tõste Tingimus        |
| ------------------------------ | --------- | ----------------- | --------------------- |
| Data / File Hygiene & SOP      | 45        | 60                | 2 inbound + 2 case'i  |
| Ongoing Ops Support (retainer) | 48        | 65                | 3 kuud stabiilne maht |
| Transition / Handover Sprint   | 55        | 70                | 2 edukat sprinti      |

## 5. Worksome (GBP/EUR) – Placeholder

| Teenus              | Algus | Siht  | Märkus                     |
| ------------------- | ----- | ----- | -------------------------- |
| Ops + Documentation | £42/h | £55/h | Võid pakkuda EUR paralleel |

## 6. Fiverr (Productized)

| Pakett                    | Sisu                          | Algus hind (USD) | Upsell'id             |
| ------------------------- | ----------------------------- | ---------------- | --------------------- |
| Basic Cleanup             | ≤300 rida + muutuste logi     | 45               | 24h rush +$15         |
| Standard Cleanup+SOP      | ≤800 rida + logi + 1-lehe SOP | 95               | Loom walkthrough +$20 |
| Premium Data Hygiene Pack | ≤1500 rida + SOP + 30m call   | 165              | + järel QA 7p +$30    |

Raise: Kui Premium <4h tegelik tööaeg → +10% hind.

## 7. Testlio (QA) – Orientiir

Tasustamine platvormipõhine (cycle / test case). Märgi pärast esimese cycle infot reaalne vahemik.

## 8. Braintrust

Positsioneerimine kõrgem; ära alusta alla Malt sihthinna (konverteeri USD). Oota kuni portfoolio case'id olemas.

## 9. Hinnatõste Logi (täida jooksvalt)

| Kuupäev | Platvorm | Enne → Pärast | Põhjus | Märkus |
| ------- | -------- | ------------- | ------ | ------ |

## 10. Riskid

- Liiga kiire tõstmine enne case'e → madal konversioon.
- Liiga madal algus → ankur klientidele.
  Mitigatsioon: Kasuta sisemist põranda hinda ja hoia paketid fokusseeritud.

---

TODO: Sisesta sisemised tunnikulud; lisada valuutavahetuse valem (skript). Update kvartalis.
