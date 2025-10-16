# Estonian Spell Check Tool

Last updated: 2025-10-17T01:28:48+03:00

## Overview

A shell script that validates Estonian spelling and grammar in markdown files using Google's Gemini API. Designed specifically for job application documents and other Estonian business correspondence.

## Features

- **Estonian Text Extraction**: Automatically extracts Estonian text from markdown files, ignoring code blocks, links, and formatting
- **API Integration**: Uses Google Gemini API for advanced spelling and grammar checking
- **Batch Processing**: Can process multiple files at once
- **Interactive Mode**: Review suggestions before applying changes
- **Color-coded Output**: Clear visual feedback with error highlighting
- **Professional Focus**: Optimized for business documents and job applications

## Prerequisites

1. **Gemini API Key**: You need a Google Gemini API key

   ```bash
   export GEMINI_API_KEY='your-api-key-here'
   ```

2. **Dependencies**:

   - `curl` (for API requests)
   - `jq` (for JSON processing)
   - `bash` 4.0+ (for arrays)

## Installation

The script is located at `scripts/estonian-spellcheck.sh` and is already executable.

## Usage

### Basic Usage

```bash
# Check single file
./scripts/estonian-spellcheck.sh CV.md

# Check multiple files
./scripts/estonian-spellcheck.sh *.md

# Check specific application
./scripts/estonian-spellcheck.sh applications/Elektrum_Eesti/IT_projektijuht/*.md
```

### Options

```bash
# Interactive mode
./scripts/estonian-spellcheck.sh --interactive README.md

# Verbose output
./scripts/estonian-spellcheck.sh --verbose README.md

# Show help
./scripts/estonian-spellcheck.sh --help
```

### Examples

```bash
# Check all markdown files in current directory
./scripts/estonian-spellcheck.sh *.md

# Check specific job application
./scripts/estonian-spellcheck.sh applications/Elektrum_Eesti/IT_projektijuht/Mihkel_Putrins_motivatsioonikiri_Elektrum_IT_projektijuht.md

# Interactive check of motivation letter
./scripts/estonian-spellcheck.sh --interactive "applications/Company/Position/motivatsioonikiri.md"
```

## Output Format

The script provides structured feedback:

### Perfect Text

```text
No spelling or grammar errors found. Text quality is excellent.
```

### Issues Found

```text
SPELLING & GRAMMAR ANALYSIS

Issues Found:
- Line 23: "töökohad" → "töökohta" (Proper case ending)
- Line 45: "analüütik" → "analüütik" (Double check spelling)

Style Suggestions:
- Line 12: Consider: "väga hea" → "suurepärane" (More professional)

Summary:
- Total issues: 2 spelling, 0 grammar, 1 style
- Overall assessment: Good
- Key improvements needed: Case endings review
```

## Integration with Job Application Workflow

This tool integrates seamlessly with the job application generator:

1. **Pre-submission Check**: Run before finalizing applications
2. **Quality Assurance**: Ensure professional Estonian in all documents
3. **Batch Processing**: Check entire application folders at once
4. **CI Integration**: Can be added to git hooks for automatic checking

## Example Workflow

```bash
# 1. Generate job application (using job-application-generator)
# 2. Check Estonian spelling
./scripts/estonian-spellcheck.sh applications/CompanyName/Position/*.md

# 3. Fix any issues found
# 4. Re-check after fixes
./scripts/estonian-spellcheck.sh applications/CompanyName/Position/motivatsioonikiri.md

# 5. Proceed with application submission
```

## Technical Details

### Text Extraction Process

The script extracts Estonian text by:

1. Removing code blocks (```...```)
2. Removing markdown links `[text](url)`
3. Removing inline code `code`
4. Removing formatting markers (`**`, `*`, `#`)
5. Filtering for lines containing Estonian characters (ä, ö, ü, õ)
6. Excluding list items and table rows

### API Integration

- Uses Google Gemini 1.5 Flash model for fast processing
- Sends Estonian-specific prompts for accurate checking
- Handles rate limiting and error responses
- Splits large texts into chunks to avoid token limits

### Error Handling

- Validates API key presence
- Checks file existence and markdown format
- Handles API errors gracefully
- Provides clear error messages and exit codes

## Exit Codes

- `0`: All files clean, no issues
- `1`: Errors occurred (file not found, API errors)
- `2`: Spelling/grammar issues found (warnings)

## Limitations

- Requires active internet connection for API calls
- May have API rate limits (depends on Gemini plan)
- Estonian language detection is based on character patterns
- Technical terms might be flagged incorrectly

## Future Enhancements

- Interactive fix mode (`-f` flag)
- Custom dictionary support for technical terms
- Integration with VS Code as extension
- Offline mode with local Estonian dictionary
- Grammar-specific suggestions

## Security Notes

- API key should be kept secure and not committed to version control
- Consider using `.env` file for local development
- API requests contain document content - ensure compliance with data policies

---

Created: 2025-10-17  
For: Job application quality assurance workflow
