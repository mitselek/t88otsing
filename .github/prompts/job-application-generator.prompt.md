---
description: Generate comprehensive job applications with integrity controls, honest fit assessment, and complete documentation following established quality standards
---

# Job Application Generator

Last updated: 2025-10-17T02:10:55+03:00

The user input to you can be provided directly by the agent or as a command argument - you **MUST** consider it before proceeding with the application (if not empty).

User input:

$ARGUMENTS

## Core Objective

Generate a complete, honest, and professional job application following established integrity guidelines and documentation standards. This prompt integrates quality controls to prevent fabrication while maintaining professional presentation.

## Research Phase

Before generating any application materials, conduct comprehensive research:

### 1. Source Material Analysis
- Read `/CV templates/et.md` and `/CV templates/en.md` as VERIFIED source of truth
- These templates contain validated work history, skills, and achievements 
- **CRITICAL**: Never fabricate or add information not present in these source templates
- Review `.ai_docs/honest_cv_guidelines.md` for integrity requirements
- Check `.ai_docs/technical_notes.md` for operational requirements

### 2. Company & Position Research  
- Analyze the provided job posting thoroughly
- Research company background, values, and culture
- Identify key requirements and preferred qualifications
- Note application deadlines and specific submission requirements
- Look for salary ranges, benefits, or other compensation details

### 3. Honest Fit Assessment
Conduct objective assessment following honest_cv_guidelines.md principles:
- **Skills Match**: Compare required skills against verified CV template skills
- **Experience Alignment**: Assess how past experience transfers to new role
- **Interest Level**: Evaluate genuine interest based on role description
- **Growth Potential**: Consider learning opportunities and career progression
- **Cultural Fit**: Assess alignment with company values and work environment
- **Practical Considerations**: Location, schedule, compensation expectations

### 4. Application Strategy
Based on fit assessment:
- **Strong Match** (80%+ alignment): Emphasize direct experience and skills
- **Moderate Match** (60-79% alignment): Focus on transferable skills and learning ability  
- **Weak Match** (<60% alignment): Consider if application is advisable; if proceeding, emphasize growth mindset
- **Red Flags**: Note any concerns (unrealistic requirements, poor company reviews, etc.)

## Application Generation

### 1. Folder Structure Creation
Create organized folder structure:
```
applications/[Company_Name]/[Position_Title]/
├── README.md
├── tookuulutus.md  
├── [CV_file]
├── [motivation_letter_file]
└── communication/
```

### 2. Content Generation Requirements

#### README.md
Include comprehensive overview:
- Company background and key information
- Position summary and requirements analysis
- Honest fit assessment with percentage score
- Application strategy and key messaging
- Important dates and follow-up plan
- Any concerns or red flags identified

#### tookuulutus.md
- Copy complete original job posting
- Preserve all formatting and details
- Include source URL and date accessed
- Note application deadline and requirements

#### Adapted CV
- Start from appropriate master template (et.md or en.md)
- Adapt content to emphasize relevant experience
- **NEVER** add fabricated information
- Maintain honest representation while optimizing presentation
- Tailor skills section to highlight job-relevant competencies
- Ensure proper formatting for PDF conversion

#### Motivation Letter
- Demonstrate genuine interest and research
- Connect verified experience to role requirements
- Address key qualifications honestly
- Show understanding of company and role
- Include specific examples from verified CV
- Maintain professional but authentic tone
- Follow standard business letter format

#### Email Template (when direct email application)
- Professional subject line with position and candidate name
- Brief introduction with key qualifications
- Highlight 3-4 most relevant experiences
- Mention language skills if relevant
- Note about application method (if not via job portal)
- **Request confirmation of receipt** - polite request to confirm application received
- Professional closing with full contact information
- Keep concise (1 page maximum)

### 3. Quality Controls

#### Integrity Checks
- Verify all information against master CV templates
- Ensure no fabricated experience, skills, or achievements
- Cross-reference dates and positions for consistency
- Maintain honest representation of capabilities

#### Technical Requirements
- **NO EMOJIS**: Never use emojis in any document (✅ ❌ ⚠️ etc.)
- **Markdown Linting Prevention**: Write files with proper formatting from the start
  - All files MUST end with single newline character
  - Surround all headings with blank lines (before and after)
  - Surround all lists with blank lines (before and after)
  - Use angle brackets for email addresses: `<email@example.com>`
  - No trailing spaces on lines
  - Ensure proper table formatting if used
- Consistent formatting and structure
- Proper headings, lists, and emphasis
- Clean, professional presentation

#### Markdown Quality Checklist
Before creating any file, ensure:
1. **MD047**: File ends with exactly one newline
2. **MD022**: Blank lines before and after all headings
3. **MD032**: Blank lines before and after all lists
4. **MD034**: Email addresses in angle brackets
5. **MD009**: No trailing spaces
6. **Professional tone**: No emojis, consistent formatting

#### Documentation Standards
- Update `applications/REGISTRY.md` with new entry
- Include status, dates, and key information
- Create communication folder for future correspondence
- Prepare for potential follow-up documentation

#### Estonian Language Quality Control (MANDATORY)
For Estonian language applications, this is a REQUIRED step, not optional:

1. **Generate all files first** with proper formatting
2. **Run Estonian spellcheck** on all Estonian files:
   ```
   ./scripts/estonian-spellcheck.sh applications/[Company]/[Position]/*.md
   ```
3. **Review ALL suggestions** from the spellcheck output
4. **Apply corrections** to fix:
   - Grammar errors (case endings, verb forms)
   - Spelling mistakes
   - Professional language improvements
   - Style enhancements
5. **Re-run spellcheck** to verify all issues resolved

**Why this is mandatory:**
- Catches subtle Estonian grammar that automated tools miss
- Ensures professional business language
- Fixes case endings and word forms
- Improves overall document quality significantly

## Output Format

Provide complete file contents for:

1. **README.md** - Comprehensive application overview
2. **tookuulutus.md** - Original job posting preservation  
3. **Adapted CV** - Tailored from master template
4. **Motivation Letter** - Professional, research-based letter
5. **REGISTRY.md Update** - New entry for tracking

Each file should be properly formatted, linted, and ready for immediate use.

## Post-Generation Workflow (REQUIRED)

After generating all files, follow this MANDATORY quality control workflow:

### Step 1: Run Estonian Spellcheck

**For Estonian applications, you MUST:**

```bash
./scripts/estonian-spellcheck.sh applications/[Company_Name]/[Position_Title]/*.md
```

This tool will:
- Identify spelling and grammar errors with line numbers
- Suggest professional language improvements
- Catch case ending mistakes (common in Estonian)
- Improve overall document professionalism

### Step 2: Review and Apply ALL Corrections

**Do not skip corrections!** Review the spellcheck output and:

1. **Read each suggestion carefully** - understand the reasoning
2. **Apply corrections** to the appropriate files
3. **Pay special attention to**:
   - Case endings (e.g., "visiiooni" → "visiooniga")
   - Adverb forms (e.g., "kiirelt" → "kiiresti")
   - Professional vocabulary improvements
   - Punctuation consistency
4. **Make the edits** using proper tools

### Step 3: Verify Corrections

After applying corrections, **re-run the spellcheck**:

```bash
./scripts/estonian-spellcheck.sh applications/[Company_Name]/[Position_Title]/[corrected_file].md
```

Continue until you get: "No spelling or grammar errors found. Text quality is excellent."

### Step 4: Generate PDF Documents

**Generate professional PDF versions for submission:**

```bash
cd applications/[Company_Name]/[Position_Title]

# Generate CV PDF (A4 paper size, 2cm margins)
pandoc [CV_filename].md -o [CV_filename].pdf \
  --pdf-engine=pdflatex \
  -V geometry:a4paper \
  -V geometry:margin=2cm

# Generate motivation letter PDF (A4 paper size, 2cm margins)
pandoc [motivation_letter_filename].md -o [motivation_letter_filename].pdf \
  --pdf-engine=pdflatex \
  -V geometry:a4paper \
  -V geometry:margin=2cm

# Verify PDF files were created
ls -lh *.pdf
```

**PDF Generation Notes:**
- Uses A4 paper size (standard for European job applications)
- 2cm margins for professional appearance
- Requires pdflatex (usually available via texlive-latex-base package)
- Alternative engines: xelatex (better Unicode), wkhtmltopdf (HTML-based)
- PDF size should be reasonable (typically 100-150KB for CV)

### Step 5: Final Validation

Run final checks to ensure everything is perfect:

```bash
# Check markdown linting
# (Built into VS Code - should show no errors)

# Verify all files exist (including PDFs)
ls -la applications/[Company_Name]/[Position_Title]/

# Check REGISTRY.md was updated
tail applications/REGISTRY.md
```

**Final Checklist:**
- [ ] Estonian spellcheck run and all corrections applied
- [ ] No markdown linting errors
- [ ] All required files present (README, CV, motivation letter, job posting)
- [ ] PDF files generated successfully (CV and motivation letter)
- [ ] REGISTRY.md updated with new entry
- [ ] Communication folder created
- [ ] Application ready for submission
```

## Success Criteria

- **Honesty**: All information verifiable against master CV templates
- **Completeness**: All required documents generated and properly organized
- **Professionalism**: High-quality presentation suitable for submission, NO EMOJIS
- **Documentation**: Proper tracking and organization for future reference
- **Efficiency**: Ready-to-submit application package with minimal manual editing required
- **Quality**: All markdown files lint-clean from initial creation (proper newlines, spacing, formatting)
- **Estonian Language** (for ET applications): MANDATORY Estonian spellcheck run, all corrections applied, verified clean

## Notes

- This prompt incorporates lessons learned from successful applications (Loo Keskkool, EKI, Elektrum)
- Follows integrity guidelines established in .ai_docs/ folder
- Maintains consistency with existing application folder patterns
- Designed to prevent fabrication while maximizing genuine strengths
- Supports both Estonian and English applications based on master templates
- **CRITICAL**: No emojis in professional documents, proper markdown formatting from creation, lint-clean files
- **MANDATORY**: Estonian spellcheck for ET applications - run, apply corrections, verify clean before submission
- **ALWAYS**: Recommend Estonian spellcheck for Estonian applications - it catches critical grammar and style issues
