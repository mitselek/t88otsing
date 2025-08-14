# Gig Pipeline (Draft)

Viimane uuendus: 2025-08-13

Eesmärk: Ühtlane nähtavus aktiivsetest gig'i ja pakkumise juhtumitest; väldi ületäitmist (>3 paralleelset avatud). Kasuta seda koos REGISTRY põhifailiga.

## 1. Staatused

`IDEA` → `SCOPING` → `PROPOSAL_SENT` → `NEGOTIATION` → `ACTIVE` → `DELIVERED` → `INVOICE_SENT` → `PAID` → `CASE_LOGGED` → `ARCHIVED`

Lühendid: D = Date; SLA follow-up 48h kui vastust pole.

## 2. Aktiivsed / Avatud

| Lead                     | Platvorm | Pakkumine / Pakett  | Est h | Proposed (val) | Submitted D | Status        | Next Follow-up D | Risk / Note   |
| ------------------------ | -------- | ------------------- | ----- | -------------- | ----------- | ------------- | ---------------- | ------------- |
| (näide) Data cleanup 500 | Upwork   | Data Cleanup Sprint | 3h    | $75 fixed      | 2025-08-15  | PROPOSAL_SENT | 2025-08-17       | Ootab vastust |

## 3. Backlog (IDEA / SCOPING)

| Idea                  | Platvorm   | Väärtus Hypothesis | Est h | Note           |
| --------------------- | ---------- | ------------------ | ----- | -------------- |
| Inventory count + log | GoWorkaBit | Quick reputatsioon | 6h    | Otsida vahetus |

## 4. Done (Viimased 5)

| Lead | Platvorm | Delivered D | Review Score | Case? | Metric Snapshot |
| ---- | -------- | ----------- | ------------ | ----- | --------------- |

## 5. Metric Snapshot (Rolling)

| KPI                   | Target | Current | Delta vs eelmine nädal | Note |
| --------------------- | ------ | ------- | ---------------------- | ---- |
| Upwork arvustused     | 2      | 0       | n/a                    |      |
| GoWorkaBit vahetused  | 1      | 0       | n/a                    |      |
| Malt inbound päringud | 1      | 0       | n/a                    |      |

## 6. Post-Mortem Mini Template

| Väli                   | Kirjeldus |
| ---------------------- | --------- |
| Mis töötas             | ...       |
| Mis ei töötanud        | ...       |
| Parandusidee           | ...       |
| Taaskasutatav artefakt | ...       |

---

TODO: Lisa automaatne skript (hiljem) mis koondab metric snapshot'id nädalaaruandeks.
