# Homework Assignment - Elektrum Eesti OÜ - IT Projektijuht

Last updated: 2025-10-22T14:23:14+03:00

**Received:** October 22, 2025 at 12:55 PM (40 minutes after interview)  
**From:** Gerli Golberg <gerli.golberg@elektrum.ee>  
**Deadline:** October 26, 2025  
**Status:** IN PROGRESS

---

## Task 1: Agile Development Plan & IT Specialist Responsibilities

### Requirements

Read the specification document for EE Elektrum new functionality and provide:

1. **Solution Development/Implementation Plan**

   - Describe step-by-step approach
   - Use Agile methodology
   - Show clear phases and milestones

2. **EE IT Specialist Responsibilities**
   - Define role and responsibilities clearly
   - Show understanding of IT specialist function in this context

### Specification Document

- File: `CCB_EE_IP_PPS_LT_HH_Discounts_Recommendation_v1.0.docx`
- Markdown version: `specification.md`
- Topic: EE HH Recommendation functionality with PROMO code

### Key Areas to Address

From specification document:

- **Promo Code System:**

  - Unique code per customer account
  - Generated on contract activation
  - Active while contract is active
  - Display in CC&B and self-service portal
  - Tracking capability (Sent/Used)

- **Discount of Recommendation:**

  - Fixed amount in EUR
  - Three discount amount groups (existing customer, new customer self-service, new customer manual)
  - Applied when new customer contract activated
  - "Continuous bill discount" type

- **Integration Points:**
  - CC&B system
  - Self-service portal (Elektrum.ee)
  - Sales Portal
  - Mobile (Android/iOS)

### Deliverable

Document describing:

- Agile implementation plan (step-by-step)
- IT specialist responsibilities definition
- Format: Professional, clear, well-structured

---

## Task 2: Process Diagram Design

### Scenario

**Context:** File processing from Elektrum partner

**Input:** File with multiple rows from partner  
**Process:** Read and process values from 4 columns

### Business Rules

**Column Reading:**

- Read columns: 1, 2, 3, and 4

**Conditional Logic:**

1. **Column 3 Check:**
   - IF column 3 is empty → use only column 2 value for portal entry
2. **Column 1 Length Check:**
   - IF column 1 length = 10 characters → use column 1 value for portal entry
   - IF column 1 length = 11 characters → use column 4 value instead

**Processing:**

- Loop through all rows in file
- Apply conditional logic for each row
- Enter appropriate value to portal

### Requirements

Create a process diagram that includes:

- Loops (iterate through file rows)
- Conditional branches (decision points)
- Clear flow from start to end
- Proper notation (flowchart symbols)

### Deliverable

Process diagram showing:

- Start → File Input → Loop → Decision Points → Portal Entry → End
- All conditional branches clearly marked
- Professional quality (use draw.io, Lucidchart, Visio, or similar)
- Format: PNG/JPG/PDF

---

## Approach Checklist

### Task 1: Agile Plan

- [ ] Read specification document thoroughly (section 1.3 especially important)
- [ ] Research Agile methodology structure (Scrum/Kanban)
- [ ] Identify key phases:
  - [ ] Requirements gathering & analysis
  - [ ] Sprint planning & backlog creation
  - [ ] Development sprints (iterative)
  - [ ] Testing & QA
  - [ ] UAT and feedback
  - [ ] Deployment
  - [ ] Retrospective & continuous improvement
- [ ] Define IT specialist responsibilities:
  - [ ] Requirements documentation
  - [ ] Technical coordination
  - [ ] System integration
  - [ ] User support planning
  - [ ] Testing coordination
  - [ ] Deployment support
  - [ ] Post-deployment monitoring
- [ ] Write clear, professional document
- [ ] Review for completeness and clarity

### Task 2: Process Diagram

- [ ] Choose diagram tool (draw.io recommended - free and professional)
- [ ] Design flowchart structure:
  - [ ] Start symbol
  - [ ] File input process
  - [ ] Loop structure (for each row)
  - [ ] Decision diamond: Column 3 empty?
    - [ ] Yes branch → use column 2
    - [ ] No branch → check column 1 length
  - [ ] Decision diamond: Column 1 length = 10 or 11?
    - [ ] 10 chars → use column 1
    - [ ] 11 chars → use column 4
  - [ ] Portal entry process
  - [ ] Loop back or continue
  - [ ] End symbol
- [ ] Ensure clear labeling on all symbols
- [ ] Add descriptive text for decisions
- [ ] Review logic flow for correctness
- [ ] Export as high-quality image/PDF

### Submission Preparation

- [ ] Review both deliverables for quality
- [ ] Proofread all text (Estonian or English as appropriate)
- [ ] Prepare cover email with:
  - [ ] Thank you for the opportunity
  - [ ] Brief overview of deliverables
  - [ ] Expression of enthusiasm
  - [ ] Professional signature
- [ ] Attach all files clearly labeled
- [ ] Submit by October 26, 2025

---

## Success Factors

### What to Demonstrate

1. **Organizational Thinking**

   - Clear structure and phases
   - Logical flow and dependencies
   - Attention to detail

2. **Agile Knowledge**

   - Understanding of iterative development
   - Sprint-based approach
   - Stakeholder collaboration
   - Continuous improvement mindset

3. **Technical Communication**

   - Clear diagrams and documentation
   - Appropriate level of detail
   - Professional presentation

4. **Business Understanding**

   - Grasp of promo code system purpose
   - Understanding of discount logic
   - Recognition of user needs

5. **Reliability**
   - Timely submission (by Oct 26)
   - Complete deliverables
   - Quality work

---

## Time Allocation

**Total Available:** 4 days (Oct 22 evening - Oct 26)

**Recommended Schedule:**

- **Day 1 (Oct 22-23):**

  - Read specification document carefully (2-3 hours)
  - Research Agile methodology (1 hour)
  - Outline Task 1 structure (1 hour)

- **Day 2 (Oct 24):**

  - Draft Task 1 Agile plan (2-3 hours)
  - Draft Task 1 IT specialist responsibilities (1 hour)
  - Design Task 2 flowchart structure (1-2 hours)

- **Day 3 (Oct 25):**

  - Complete Task 2 diagram (2 hours)
  - Review and refine both tasks (2 hours)
  - Get feedback if possible (30 min)

- **Day 4 (Oct 26):**
  - Final review and proofreading (1 hour)
  - Prepare submission email (30 min)
  - Submit (morning/afternoon buffer)

---

## Submission Details

**To:** <gerli.golberg@elektrum.ee>  
**Subject:** Homework Assignment - IT Projektijuht - Mihkel Putrinš  
**Deadline:** October 26, 2025

**Email Template:**

```text
Tere Gerli,

Tänan võimalust esitada kodutöö IT projektijuhi rolli kandideerimiseks.

Manuses leiate:
1. [Filename] - Agile arendusplaan ja IT-spetsialisti vastutusalad
2. [Filename] - Protsessidiagramm failide töötlemiseks

[Optional: Brief note about your approach or key insights]

Olen väga huvitatud Elektrumi IT meeskonnaga liitumisest ja loodan, et need materjalid näitavad minu oskusi ja lähenemist.

Palun andke teada, kui teil on küsimusi või vajate täiendavat informatsiooni.

Parimate soovidega,
Mihkel Putrinš
[Contact information]
```

---

## Notes

**Key Insights from Interview:**

- Gerli emphasized value of Latvian language skills (IT team largely Latvian)
- "Helping people organize better" theme resonated strongly
- Working "over the desk" with Gerli - close collaboration expected
- Homework is next evaluation filter before potential in-person interview

**Competitive Advantages to Leverage:**

- 14+ years IT experience
- Project management background (PÖFF: 4/4 hired)
- User support experience (Kunstiakadeemia: 700+ users)
- Latvian language capability
- Organizational and problem-solving mindset

---

**Last Updated:** October 22, 2025 at 14:30
