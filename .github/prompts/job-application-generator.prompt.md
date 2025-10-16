---
description: Generate comprehensive job applications with integrity controls, honest fit assessment, and complete documentation following established quality standards
---

# Job Application Generator

Last updated: 2025-10-17T00:45:22+03:00

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

### 3. Quality Controls

#### Integrity Checks
- Verify all information against master CV templates
- Ensure no fabricated experience, skills, or achievements
- Cross-reference dates and positions for consistency
- Maintain honest representation of capabilities

#### Technical Requirements
- All Markdown files must pass VS Code linting
- Consistent formatting and structure
- Proper headings, lists, and emphasis
- Clean, professional presentation

#### Documentation Standards
- Update `applications/REGISTRY.md` with new entry
- Include status, dates, and key information
- Create communication folder for future correspondence
- Prepare for potential follow-up documentation

## Output Format

Provide complete file contents for:

1. **README.md** - Comprehensive application overview
2. **tookuulutus.md** - Original job posting preservation  
3. **Adapted CV** - Tailored from master template
4. **Motivation Letter** - Professional, research-based letter
5. **REGISTRY.md Update** - New entry for tracking

Each file should be properly formatted, linted, and ready for immediate use.

## Success Criteria

- **Honesty**: All information verifiable against master CV templates
- **Completeness**: All required documents generated and properly organized
- **Professionalism**: High-quality presentation suitable for submission
- **Documentation**: Proper tracking and organization for future reference
- **Efficiency**: Ready-to-submit application package with minimal manual editing required

## Notes

- This prompt incorporates lessons learned from successful applications (Loo Keskkool, EKI)
- Follows integrity guidelines established in .ai_docs/ folder
- Maintains consistency with existing application folder patterns
- Designed to prevent fabrication while maximizing genuine strengths
- Supports both Estonian and English applications based on master templates
