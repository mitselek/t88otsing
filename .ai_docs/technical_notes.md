# Technical Notes

## ⚠️ AI Assistant Quality Control

**CRITICAL**: See comprehensive audit in `cross_reference_violations_log.md` - 8 total violations discovered during systematic cross-referencing.

**Critical Issues Discovered**: AI assistant fabricated multiple false claims not present in master CV templates:

1. **"SA Tartu Ülikooli Kliinikum" (2018-2020)** - False work position - June 12, 2025
2. **"Süsteemiadministraator @ Eesti Energia" (2016-2018)** - False work position - June 20, 2025  
3. **"Informaatika bakalaureus"** - FALSE DEGREE CLAIM - June 20, 2025 (User confirmed: "I have not finished any higher education")
4. **"Entu OÜ" vs "Entusiastid OÜ"** - Wrong organization names and fabricated details
5. **Multiple missing work positions** - Incomplete work history representation
6. **Fabricated training sections** - Fake courses and certifications

This highlights the importance of:

1. **Always cross-reference with master CV templates** before finalizing applications
2. **Human verification** of all AI-generated content for accuracy
3. **Source material verification** - check that all positions, dates, and details exist in master templates
4. **Systematic verification** - AI fabrications can be systematic, not isolated incidents

### Quality Control Checklist

Before finalizing any application:

- ✅ Cross-reference all work experience with master CV templates
- ✅ Verify all dates, company names, and job titles
- ✅ Ensure no fabricated positions or inflated claims
- ✅ Check against honest CV guidelines

---

## Terminal Output Issues with AI Assistant

### Problem

The AI assistant's `run_in_terminal` tool sometimes doesn't capture output from git commands and other terminal operations, returning empty results.

### Workarounds

1. **Use `get_terminal_last_command`** - Most reliable method

   ```text
   After running a command that doesn't show output, use get_terminal_last_command 
   to retrieve the output from the previous command execution.
   ```

2. **Pipe to cat** - **PROVEN EFFECTIVE** ✅

   ```bash
   git status | cat
   git commit -m "message" | cat
   ```

   **Discovery (2025-06-20)**: The `| cat` trick works reliably for git commands and shows output immediately in the terminal tool.

3. **Use `get_terminal_output` with terminal ID** - If available

   ```text
   When a terminal ID is provided, use get_terminal_output to check results
   ```

### Root Cause Discovery

**Problem identified (2025-06-20)**: Commands may require manual user interaction (pressing Enter) to complete, even when they appear finished to the AI. This explains why `get_terminal_last_command` sometimes retrieves output from "empty line" commands.

### Best Practices for AI

1. **Prefer `| cat` for git commands** - Most reliable for immediate output
2. **Use `get_terminal_last_command` as backup** - When `| cat` isn't applicable
3. **Be aware of interactive prompts** - Commands may need user completion

### Examples

```bash
# Command runs but shows no output
git status

# Solution: Check last command output
get_terminal_last_command
```

## Markdown Quality Control

### VS Code Markdown Linter

**Always run VS Code markdown linter** after creating or modifying any markdown document.

Common issues to fix:

- **MD022** - Headers should be surrounded by blank lines
- **MD032** - Lists should be surrounded by blank lines  
- **MD034** - Bare URL used
- **MD009** - Trailing spaces
- **MD047** - Files should end with a single newline

### Best Practices

- Ensure consistent formatting and structure
- Fix all linting issues before finalizing documents
- Use proper markdown syntax for better readability

## Document Formatting and Conversion

### HTML + CSS Template System

**Problem**: Applications too long, need professional styling  
**Solution**: Markdown → HTML → PDF workflow with CSS templates

#### Workflow

1. **Create concise markdown** (following length guidelines)
2. **Convert to HTML** using templates
3. **Apply CSS styling** for professional appearance
4. **Generate PDF** via browser print

#### Templates Structure

```text
templates/
├── cv_template.html              # CV HTML template with placeholders
└── styles/
    └── professional.css          # Professional styling for both documents
```

#### Template Features

- **Placeholder system**: `{{VARIABLE_NAME}}` for easy content replacement
- **Conditional sections**: `{{#SECTION}}...{{/SECTION}}` for optional content
- **Print optimization**: A4 page setup with proper margins
- **Professional styling**: Estonian business standards
- **Responsive design**: Works on screen and print

#### Length Guidelines

- **CV**: Maximum 2 pages (A4)
- **Cover Letter**: Maximum 1 page
- **Combined**: Never exceed 3 pages total

#### CSS Features

- Professional fonts (Arial, Times New Roman)
- Consistent margins and spacing
- Print-optimized layouts
- Estonian business letter standards
- Page break controls

## Related Documentation

- **Honest CV Guidelines** (`honest_cv_guidelines.md`) - Content standards and quality control processes for job applications

---

*Created: June 20, 2025*
*Issue discovered during EKI application git commits*
