# Job Application Registry

Last updated: 2025-08-28T00:12:39+03:00

Chronological list of job postings (ascending by published date). Tracks lifecycle timestamps. Use ISO date format (YYYY-MM-DD). Leave unknown fields blank until an event occurs.

## Legend

- Status values: PLANNING | APPLIED | INTERVIEW | REJECTED | OFFER | WITHDRAWN | ON-HOLD
- Published: Original posting publication date.
- Registered: Date the posting was captured into this repository.
- Applied: Date application (CV/cover letter) was submitted.
- Interviews: Comma‑separated dates (or folder names) of interviews / meetings.
- Final Response: Date of rejection / offer acceptance / withdrawal.

## Active / Recent Postings

| Role                             | Company                    | Posting No | Published  | Deadline   | Registered | Applied    | Interviews | Final Response | Status   | Notes                                    |
| -------------------------------- | -------------------------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | -------------- | -------- | ---------------------------------------- |
| Betoonvormija                    | O.Z. Company OÜ            | 1619685    | 2025-08-06 | 2025-09-04 | 2025-08-12 |            |            |                | PLANNING | Renditöö BETONEKS                        |
| Metallkonstruktsioonide koostaja | Hire Hand Services OÜ      | 1619564    | 2025-08-06 | 2025-09-05 | 2025-08-12 |            |            |                | PLANNING | DEFER (fookus IT); BLRT; 5 kohta         |
| Armeerija                        | O.Z. Company OÜ            | 1619921    | 2025-08-08 | 2025-09-05 | 2025-08-12 |            |            |                | PLANNING | Renditöö BETONEKS                        |
| Puusepp / Puidutisler            | Scandinor OÜ               | 1620007    | 2025-08-08 | 2025-09-07 | 2025-08-12 |            |            |                | PLANNING | 4 openings                               |
| Laospetsialist                   | Sisekaitse                 | 1620165    | 2025-08-11 | 2025-08-21 | 2025-08-12 |            |            |                | PLANNING | Archive captured 2025-08-12              |
| Juhiabi                          | Patendiamet                | 1620083    | 2025-08-11 | 2025-08-24 | 2025-08-12 |            |            |                | PLANNING | Verbatim text provided by user           |
| Õhtune administraator / valvur   | Tallinna Tehnikagümnaasium | 798678     | 2025-08-11 | 2025-08-14 | 2025-08-12 | 2025-08-14 |            |                | APPLIED  | Evening shift, 0.5 FTE (half-time), €443 |
| Lead Product Manager             | Enefit                     | teamdash-Uua93Ex8 |            | 2025-08-17 | 2025-08-14 |            |            | 2025-08-27     | REJECTED | Teamdash posting                         |
| Senior Product Manager (Internal Platforms) | Enefit           | teamdash-cht4AXTt |            | 2025-08-31 | 2025-08-14 |            |            |                | PLANNING | Teamdash posting                         |
| Tarkvaraarendaja                 | Spindl OÜ                  |            |            |            | 2025-08-28 | 2025-08-28 |            |                | APPLIED  |                                          |
| Tarkvaraarendaja                 | Solutional OÜ              | 984706     | 2025-07-30 | 2025-08-29 | 2025-08-28 |            |            |                | PLANNING |                                          |

### Abbreviation Glossary (add when new appears)

- BLRT – Ajalooline "Balti Laevaremonditehas"; nüüd BLRT Grupp AS (tööstuskontsern: laevaehitus, metallitööd, tehnika).
- FTE – Full-Time Equivalent (täistööaja ekvivalent). 1.0 FTE = täiskoormus; 0.5 FTE = poole kohaga.

## Future Updates

Add older historical applications below (or in a new section) once their metadata is normalized. Consider a separate ARCHIVE section when volume grows > 30 active rows.

---

## Update Procedure

1. On registering new posting: add new row with Status=PLANNING and fill Published/Deadline if known.
2. When application submitted: set Applied date and change Status=APPLIED.
3. For each interview: append date (YYYY-MM-DD) to Interviews (keep chronological) and update Status=INTERVIEW if first.
4. On final decision:
   - Rejection: set Final Response date + Status=REJECTED.
   - Offer accepted: date + Status=OFFER.
   - Withdrawal: date + Status=WITHDRAWN (note reason in Notes).
5. If paused: Status=ON-HOLD with brief reason in Notes.
6. Keep Notes concise (< 60 chars); create /communication/ entries for detailed logs.

## Data Integrity Rules

- Do not invent Published or Deadline dates; if missing, leave blank and add note.
- Reflect reality even if unfavorable (record rejections immediately).
- When correcting a mistake, preserve original value in Notes (e.g., "Published date corrected from 2025-08-10 → 2025-08-11").

---

Last maintained: 2025-08-14
