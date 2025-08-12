# Job Application Assistant – Condensed Guide

Created: 2025-07-04 • Last Refactor: 2025-08-12 (condensed)  
Mission: Produce truthful, well‑structured application materials. Zero fabrication tolerance.

---

## 1. Core Principles

NEVER: invent facts, inflate skills, guess dates, cite internal company info, fabricate metrics, imply experience not held.  
ALWAYS: verify sources, cite links, mark uncertainty ("approx.", "needs verification"), keep scope honest, ask when data missing, minimize decorative symbols.

Primary safeguard: consult `.ai_docs/` (violations log, honest_cv_guidelines, motivation_letters_audit_log, technical_notes) BEFORE drafting or altering CV, cover letters, or vision docs.

---

## 2. Repository Structure (Target Pattern)

```text
applications/
   Company/
      Role/
         tookuulutus.md      # Verbatim posting (or placeholder + TODO)
         readme.md           # Analysis, fit, strategy
         cv.md               # Tailored CV (on demand)
         kaaskiri.md         # Estonian cover letter (on demand)
         cover_letter.md     # English cover letter (if needed)
         communication/      # YYYY-MM-DD_slug.md logs
CV templates/
cover letters/
templates/               # HTML + styles (no JS)
.ai_docs/                 # Truth & compliance artifacts
```

ALWAYS use Company/Role even for single role; migrate legacy flat folders when touched.

Naming: Simplify special chars; use `_` for spaces if needed. Role names short (<25 chars): e.g. `Laospetsialist`, `Puidutisler`, `Juhiabi`.

---

## 3. Standard Creation Workflow (New Posting)

| Step      | Action                                                              | Output           |
| --------- | ------------------------------------------------------------------- | ---------------- |
| Capture   | Create `Company/Role/`, `communication/`                            | Folders          |
| Post      | Save verbatim text → `tookuulutus.md` (wrap raw emails/URLs)        | Posting file     |
| Analyze   | Draft `readme.md` (fit, gaps, risk/benefit, strategy, QC reminders) | Analysis         |
| Register  | Append row in `applications/REGISTRY.md` (Status=PLANNING)          | Registry updated |
| Follow-up | On request: `cv.md`, `kaaskiri.md`, cover letter                    | Tailored docs    |

Do NOT wait for permission—perform all Capture→Register steps automatically upon user providing a posting.

---

## 4. Document Standards

Markdown: clear heading hierarchy, blank lines around lists & tables, no bare URLs, minimal emphasis.  
HTML (export sources): pure semantic HTML5, inline CSS only, UTF‑8, print (A4) friendly, no JS, no external fonts/CDNs.

Include attribution lines for verbatim sources. Use checklists for final verification (dates, contacts, completeness, links).

---

## 5. Research & Verification

| Area                | Rule                                                                   |
| ------------------- | ---------------------------------------------------------------------- |
| Company facts       | Only official site / authoritative public sources                      |
| Technical standards | Official specs (e.g. HL7, TEHIK docs) + version/date                   |
| Metrics & claims    | Provide baseline or label as estimate; never invent                    |
| Personal experience | Cross‑check with `honest_cv_guidelines.md`; exclude unverifiable items |
| Links               | Test before inclusion                                                  |

Uncertain? Mark with `(verify)` and log TODO in analysis until confirmed.

---

## 6. Application Lifecycle & Registry

Registry file: `applications/REGISTRY.md` (Columns: Role | Company | Posting No | Published | Deadline | Registered | Applied | Interviews | Final Response | Status | Notes)

Status Flow:
PLANNING → APPLIED → INTERVIEW → (OFFER | REJECTED | WITHDRAWN)  
ON-HOLD allowed anytime (note reason). OFFER implies acceptance; if offer declined, note in Comments.

| Trigger                    | Required Action                           | Registry Update                   |
| -------------------------- | ----------------------------------------- | --------------------------------- |
| Posting registered         | Row added                                 | Status=PLANNING, Registered=today |
| Application sent           | Set Applied date                          | Status=APPLIED                    |
| Interview scheduled/held   | Append date to Interviews (chronological) | If first: Status=INTERVIEW        |
| Final decision (offer)     | Set Final Response date                   | Status=OFFER                      |
| Final decision (rejection) | Set Final Response date                   | Status=REJECTED                   |
| Candidate withdraws        | Set Final Response date + reason in Notes | Status=WITHDRAWN                  |
| Pause search for role      | Add reason in Notes                       | Status=ON-HOLD                    |

Timestamps: ISO YYYY-MM-DD (local EE). Leave blank if unknown. Corrections: note "corrected from X→Y" in Notes.

Communication: each significant email/call summary → `communication/YYYY-MM-DD_slug.md` (never embed long threads in registry Notes).

---

## 7. Quality & Integrity Checklist

| Phase             | Checks                                                            |
| ----------------- | ----------------------------------------------------------------- |
| Before drafting   | Open `.ai_docs/`; confirm no prior fabrication pattern repeats    |
| Posting saved     | Verify all sections present; mark missing fields with TODO        |
| Analysis ready    | Fit matrix, risk list, action next steps present                  |
| Before applying   | Tailored CV + cover letter free of unverified claims; links valid |
| Before submission | Spellcheck; roles/dates consistent; registry updated              |
| After response    | Log outcome; set Status + Final Response; add feedback file       |

Red Flags (STOP & clarify): unverifiable metrics, internal strategy claims, future product roadmap speculation, inflated scope of past roles, ambiguous date ranges.

---

## 8. Escalation & Uncertainty Handling

If required data missing → ask succinct clarifying question OR add explicit TODO with reason.  
Use phrasing: "Based on available public info", "Estimate pending confirmation".  
Never silently omit risk; list and label low-confidence items.

---

## 9. Maintenance

Weekly: skim registry for stale PLANNING entries (older than deadline).  
Monthly: verify template + HTML export still valid, update tech version references.  
On change: update Last Refactor date at top.

Success Metrics: zero factual errors, consistent registry states, reproducible PDFs (no styling regressions), minimized duplication across files.

---

## 10. Quick Reference (TL;DR)

Input: Posting → Output (folder + posting + analysis + registry row).  
Never invent; always cite; keep lifecycle current; isolate communication logs; prefer concision.

---

Remember: Honest clarity > embellished narrative. Integrity compounds.

Contact: Mihkel Putrinš · <mitselek@gmail.com> · +372 56560978
