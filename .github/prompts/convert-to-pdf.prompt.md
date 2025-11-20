---
description: Convert markdown documents to professionally formatted A4 PDFs with Estonian language support, smart regeneration, and footer metadata extraction
---

# Convert to PDF

Last updated: 2025-11-20T19:14:12+02:00

**Purpose**: Generate professional, print-ready PDFs from markdown documents with proper Estonian typographic support, intelligent caching, and metadata handling.

**Use Case**: Job applications (cover letters, CVs), technical documentation, assignment submissions, and formal reports.

---

## Core Competencies

This conversion system provides:

- **Estonian Language Support**: Proper hyphenation rules, character encoding, and typography
- **Smart Regeneration**: Only rebuild PDFs when source files change (timestamp-based caching)
- **Footer Metadata Extraction**: Automatically extract and format document ID, version, date, author
- **Professional Formatting**: A4 layout with appropriate margins, fonts, and spacing
- **Batch Processing**: Convert multiple documents in one operation
- **Error Handling**: Graceful failure with detailed feedback

---

## Usage Scenarios

Invoke this prompt when user requests:

- "convert to PDF", "export to PDF", "konverdi PDF-iks"
- "create printable version"
- "generate professional document"
- Batch operations: "convert all markdown files to PDF"

---

## Pre-Conversion Checklist

Before conversion, determine:

1. **Source file path(s)** - Absolute path to markdown file(s)
2. **Output location** - Usually same directory, or specified output folder
3. **Document type** - Cover letter, CV, technical report, assignment
4. **Language** - Default to Estonian (`et`) for hyphenation
5. **Rebuild strategy** - Incremental (default) or force rebuild
6. **Footer metadata** - Present or absent in source markdown

---

## Conversion Methods

### Method 1: Simple Single File Conversion (Recommended for Cover Letters/CVs)

**Use when**: Converting one document, no footer metadata, straightforward formatting needs

```bash
pandoc INPUT.md -o OUTPUT.pdf \
  --pdf-engine=xelatex \
  -V geometry:a4paper \
  -V geometry:margin=2.5cm \
  -V fontsize=11pt \
  -V lang=et \
  -V documentclass=article \
  --from markdown+smart
```

**Parameters explained**:

- `--pdf-engine=xelatex`: Unicode/Estonian support (critical for õ, ä, ö, ü)
- `-V geometry:a4paper`: European standard A4 page size
- `-V geometry:margin=2.5cm`: Professional 2.5cm margins (cover letters)
- `-V fontsize=11pt`: Readable 11-point font size
- `-V lang=et`: Estonian hyphenation and typography rules
- `-V documentclass=article`: Standard article layout (clean, professional)
- `--from markdown+smart`: Smart quotes, em-dashes, proper punctuation

### Method 2: With Footer Metadata Extraction (Advanced)

**Use when**: Document has footer metadata (Document ID, Version, Date, Author)

**Footer format** in markdown:

```markdown
[Main document content]

---

**Document ID**: EE-IT-PM-IVP2  
**Document Version**: v1.0  
**Date**: November 4, 2025  
**Author**: Mihkel Putrinš
```

**Conversion steps**:

1. **Extract metadata and strip footer from markdown**:

```bash
# Find line number of last "---" separator
LAST_SEPARATOR=$(grep -n "^---$" INPUT.md | tail -n 1 | cut -d: -f1)

# Extract content before footer
LINES_TO_KEEP=$((LAST_SEPARATOR - 1))
head -n "$LINES_TO_KEEP" INPUT.md > temp_content.md

# Extract metadata values
DOC_ID=$(grep "^\*\*Document ID\*\*:" INPUT.md | sed 's/\*\*Document ID\*\*:[[:space:]]*//')
DOC_VERSION=$(grep "^\*\*Document Version\*\*:" INPUT.md | sed 's/\*\*Document Version\*\*:[[:space:]]*//')
DOC_DATE=$(grep "^\*\*Date\*\*:" INPUT.md | sed 's/\*\*Date\*\*:[[:space:]]*//')
DOC_AUTHOR=$(grep "^\*\*Author\*\*:" INPUT.md | sed 's/\*\*Author\*\*:[[:space:]]*//')
```

2. **Create custom LaTeX header with footer**:

```bash
# Create temp header file
cat > temp_header.tex <<'EOF'
\usepackage{fancyhdr}
\usepackage{lastpage}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[L]{\docauthor}
\fancyfoot[C]{\thepage\ / \pageref{LastPage}}
\fancyfoot[R]{\docversion\ | \docdate}

% Define default values (will be overridden)
\providecommand{\docauthor}{Author}
\providecommand{\docversion}{Version}
\providecommand{\docdate}{Date}
EOF

# Append metadata commands
echo "\\renewcommand{\\docauthor}{${DOC_ID} | ${DOC_AUTHOR}}" >> temp_header.tex
echo "\\renewcommand{\\docversion}{${DOC_VERSION}}" >> temp_header.tex
echo "\\renewcommand{\\docdate}{${DOC_DATE}}" >> temp_header.tex
```

3. **Convert with custom header**:

```bash
pandoc temp_content.md -o OUTPUT.pdf \
  --pdf-engine=xelatex \
  -V geometry:a4paper \
  -V geometry:margin=1in \
  -V fontsize=11pt \
  -V lang=et \
  -H temp_header.tex \
  --from markdown+raw_tex \
  --pdf-engine-opt=-interaction=nonstopmode

# Cleanup
rm temp_content.md temp_header.tex
```

### Method 3: Smart Regeneration Script (Batch Processing)

**Use when**: Multiple files, want to avoid unnecessary rebuilds, complex project structure

**Features**:

- Only regenerates PDFs when source markdown or header file changes
- Timestamp-based caching
- Statistics reporting (regenerated, skipped, failed)
- Support for force rebuild and clean build modes

**Script structure**:

```bash
#!/bin/bash
set -e  # Exit on error

# Parse arguments
FORCE_REBUILD=false
CLEAN_BUILD=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --force|-f) FORCE_REBUILD=true; shift ;;
        --clean|-c) CLEAN_BUILD=true; shift ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

# Check if regeneration needed
needs_regeneration() {
    local md_file="$1"
    local pdf_file="$2"
    
    # Force rebuild overrides
    [ "${FORCE_REBUILD}" = true ] && return 0
    
    # PDF doesn't exist
    [ ! -f "${pdf_file}" ] && return 0
    
    # MD file newer than PDF
    [ "${md_file}" -nt "${pdf_file}" ] && return 0
    
    # Header file newer than PDF (if using custom header)
    [ -f .header.tex ] && [ .header.tex -nt "${pdf_file}" ] && return 0
    
    return 1  # No regeneration needed
}

# Convert with statistics
for md_file in *.md; do
    pdf_file="${md_file%.md}.pdf"
    
    if needs_regeneration "${md_file}" "${pdf_file}"; then
        echo "Converting: ${md_file}"
        pandoc "${md_file}" -o "${pdf_file}" [... pandoc options ...]
        REGENERATED=$((REGENERATED + 1))
    else
        echo "⊘ Skipped (up-to-date): ${pdf_file}"
        SKIPPED=$((SKIPPED + 1))
    fi
done

echo "Regenerated: ${REGENERATED}, Skipped: ${SKIPPED}"
```

---

## Document Type Formatting Guidelines

### Cover Letters

**Margins**: 2.5cm (professional, not too tight)  
**Font size**: 11pt (readable, standard business)  
**Language**: `-V lang=et` (Estonian hyphenation)

```bash
pandoc kaaskiri.md -o kaaskiri.pdf \
  --pdf-engine=xelatex \
  -V geometry:a4paper \
  -V geometry:margin=2.5cm \
  -V fontsize=11pt \
  -V lang=et \
  -V documentclass=article \
  --from markdown+smart
```

### CVs (Curriculum Vitae)

**Margins**: 2cm (more compact, fits more content)  
**Font size**: 10pt (smaller but still readable)  
**Language**: `-V lang=et`

```bash
pandoc CV.md -o CV.pdf \
  --pdf-engine=xelatex \
  -V geometry:a4paper \
  -V geometry:margin=2cm \
  -V fontsize=10pt \
  -V lang=et \
  -V documentclass=article \
  --from markdown+smart
```

### Technical Reports / Assignment Submissions

**Margins**: 1in (2.54cm, standard academic)  
**Font size**: 11pt  
**Language**: `-V lang=et` or `-V lang=en` depending on content  
**Additional**: Use custom header for footer metadata

```bash
pandoc report.md -o report.pdf \
  --pdf-engine=xelatex \
  -V geometry:a4paper \
  -V geometry:margin=1in \
  -V fontsize=11pt \
  -V lang=et \
  -H .header.tex \
  --from markdown+raw_tex \
  --pdf-engine-opt=-interaction=nonstopmode
```

---

## Troubleshooting

### Problem: Font Rendering Issues (Characters Cut Off/Overlapping)

**Symptoms**: Letters appear garbled, cut off, or overlapping in PDF  
**Root cause**: Custom font specification incompatible with XeLaTeX or missing font files

**Solution**: Remove `-V mainfont` parameter, let XeLaTeX choose defaults

❌ **Bad** (causes rendering issues):

```bash
-V mainfont="DejaVu Serif"  # Often causes problems
```

✅ **Good** (automatic font selection):

```bash
# Omit mainfont parameter entirely - XeLaTeX will pick best available font
```

### Problem: Estonian Characters Not Displaying (õ, ä, ö, ü)

**Symptoms**: Special characters show as boxes, question marks, or missing  
**Root cause**: Using `pdflatex` instead of `xelatex`, or missing language setting

**Solution**: Use `--pdf-engine=xelatex` and `-V lang=et`

❌ **Bad**:

```bash
pandoc file.md -o file.pdf --pdf-engine=pdflatex  # No Unicode support
```

✅ **Good**:

```bash
pandoc file.md -o file.pdf --pdf-engine=xelatex -V lang=et
```

### Problem: Words Not Breaking at Line Ends (Text Overflow)

**Symptoms**: Long words extend into margins, ugly line breaks  
**Root cause**: Missing language parameter for hyphenation rules

**Solution**: Always include `-V lang=et` for Estonian documents

```bash
pandoc file.md -o file.pdf --pdf-engine=xelatex -V lang=et  # Enables hyphenation
```

### Problem: PDF Not Generated (Silent Failure)

**Symptoms**: No PDF created, minimal error output  
**Root cause**: LaTeX errors suppressed

**Solution**: Add interaction mode parameter to see full errors

```bash
pandoc file.md -o file.pdf \
  --pdf-engine=xelatex \
  --pdf-engine-opt=-interaction=nonstopmode  # Shows errors but continues
```

### Problem: Metadata Not Appearing in Footer

**Symptoms**: Footer shows default values or nothing  
**Root cause**: Footer not extracted from markdown, or header file not loaded

**Solution**: Verify markdown footer format and header file loading

1. Check markdown footer structure (must be last 6 lines, separated by `---`)
2. Ensure header file exists and is referenced: `-H .header.tex`
3. Verify metadata extraction script (see Method 2 above)

---

---

## Quality Assurance Checklist

After conversion, verify:

### Visual Quality

- [ ] **Text rendering**: No cut-off, overlapping, or garbled characters
- [ ] **Estonian characters**: õ, ä, ö, ü display correctly
- [ ] **Page margins**: Professional spacing (not too tight, not too loose)
- [ ] **Hyphenation**: Words break appropriately at line ends
- [ ] **Line spacing**: Comfortable reading (not cramped, not too loose)
- [ ] **Font size**: Readable without being too large (10-12pt typical)

### Content Accuracy

- [ ] **All sections present**: No missing content from markdown
- [ ] **Formatting preserved**: Bold, italic, lists maintain structure
- [ ] **Links**: URLs display correctly (even if not clickable in print)
- [ ] **Code blocks**: Monospace font, proper indentation (if applicable)
- [ ] **Tables**: Borders, alignment correct (if applicable)

### Footer Metadata (if applicable)

- [ ] **Document ID**: Displays in footer left (e.g., "EE-IT-PM-IVP2 | Mihkel Putrinš")
- [ ] **Page numbers**: Centered, format "1 / 5" (current / total)
- [ ] **Version and date**: Right-aligned, format "v1.0 | November 4, 2025"

### File Properties

- [ ] **File size**: Reasonable (25-60 KB for text-only documents)
- [ ] **Filename**: Descriptive, professional naming (no spaces, underscores OK)
- [ ] **Location**: Saved in correct directory
- [ ] **Permissions**: Readable by all (not accidentally restricted)

### Command Verification

```bash
# Check file exists and size
ls -lh OUTPUT.pdf

# Verify Estonian characters (extract text and check)
pdftotext OUTPUT.pdf - | grep -E "õ|ä|ö|ü"

# Count pages (if pdfinfo available)
pdfinfo OUTPUT.pdf | grep Pages
```

---

## Workflow Examples

### Example 1: Simple Cover Letter Conversion

**Scenario**: Convert RmIT cover letter for job application

```bash
cd /home/michelek/Documents/tööotsing/applications/RmIT/Tooteomanik

# Convert to PDF
pandoc Mihkel_Putrins_kaaskiri_RmIT.md \
  -o Mihkel_Putrins_kaaskiri_RmIT.pdf \
  --pdf-engine=xelatex \
  -V geometry:a4paper \
  -V geometry:margin=2.5cm \
  -V fontsize=11pt \
  -V lang=et \
  -V documentclass=article \
  --from markdown+smart

# Verify output
ls -lh Mihkel_Putrins_kaaskiri_RmIT.pdf
# Expected: ~28K file size

# Quick visual check
xdg-open Mihkel_Putrins_kaaskiri_RmIT.pdf  # Or evince, okular, etc.
```

### Example 2: Batch Convert All Markdown in Directory

**Scenario**: Convert multiple documents at once

```bash
cd /home/michelek/Documents/tööotsing/applications/Company/Position

# Convert all markdown files
for md_file in *.md; do
    pdf_file="${md_file%.md}.pdf"
    echo "Converting: ${md_file} -> ${pdf_file}"
    
    pandoc "${md_file}" -o "${pdf_file}" \
      --pdf-engine=xelatex \
      -V geometry:a4paper \
      -V geometry:margin=2.5cm \
      -V fontsize=11pt \
      -V lang=et \
      -V documentclass=article \
      --from markdown+smart
done

# List all generated PDFs
ls -lh *.pdf
```

### Example 3: Technical Report with Footer Metadata

**Scenario**: Elektrum homework assignment with document tracking

```bash
cd /home/michelek/Documents/tööotsing/applications/Elektrum_Eesti/IT_projektijuht/homework

# Run smart conversion script (already includes footer extraction logic)
./convert-to-pdf.sh

# Or manually with footer extraction:
# 1. Extract content (see Method 2 above)
# 2. Extract metadata
# 3. Create custom header
# 4. Convert with header

# Result: PDFs in delivery/ folder with proper footers
```

---

## Performance Optimization

### Incremental Builds (Smart Regeneration)

For projects with multiple documents, use timestamp checking to avoid unnecessary rebuilds:

**Benefits**:

- Faster builds (only regenerate changed files)
- Save CPU time (XeLaTeX is slow)
- Clear feedback (shows what was rebuilt vs. skipped)

**Implementation**:

```bash
needs_regeneration() {
    local md_file="$1"
    local pdf_file="$2"
    
    # PDF doesn't exist -> regenerate
    [ ! -f "${pdf_file}" ] && return 0
    
    # MD file newer than PDF -> regenerate
    [ "${md_file}" -nt "${pdf_file}" ] && return 0
    
    # Header file newer than PDF -> regenerate
    [ -f .header.tex ] && [ .header.tex -nt "${pdf_file}" ] && return 0
    
    return 1  # No regeneration needed
}

# Usage in conversion loop
if needs_regeneration "${md_file}" "${pdf_file}"; then
    # Regenerate PDF
    pandoc ...
else
    echo "⊘ Skipped (up-to-date): ${pdf_file}"
fi
```

### Parallel Processing

For truly large document sets, consider parallel conversion:

```bash
# Install GNU parallel if needed: sudo apt-get install parallel

# Convert in parallel (max 4 concurrent processes)
find . -name "*.md" -print0 | parallel -0 -j4 '
    pdf_file="{.}.pdf"
    pandoc "{}" -o "${pdf_file}" \
      --pdf-engine=xelatex \
      -V geometry:a4paper \
      -V geometry:margin=2.5cm \
      -V fontsize=11pt \
      -V lang=et \
      -V documentclass=article \
      --from markdown+smart
'
```

---

## Best Practices

### Markdown Formatting Requirements

Before conversion, ensure markdown is lint-compliant:

- Blank line before and after each heading
- Blank line before and after each list
- Blank line before and after each code block
- No trailing spaces on lines
- Consistent indentation (2 or 4 spaces for nested lists)

**Why it matters**: Clean markdown → clean PDF (proper spacing, no rendering glitches)

### Filename Conventions

Use descriptive, professional filenames:

✅ **Good**:

- `Mihkel_Putrins_CV_RmIT.pdf`
- `Mihkel_Putrins_kaaskiri_RmIT.pdf`
- `Elektrum_homework_task1.pdf`

❌ **Bad**:

- `cv.pdf` (too generic)
- `my application letter.pdf` (spaces problematic)
- `FINAL VERSION 2.pdf` (unprofessional)

### Version Control Integration

Commit both markdown and PDF to git:

```bash
git add Mihkel_Putrins_kaaskiri_RmIT.md Mihkel_Putrins_kaaskiri_RmIT.pdf
git commit -m "Add RmIT Tooteomanik application materials"
```

**Rationale**: PDFs ensure exact snapshot of submitted document (fonts, layout locked in)

---

## Automated Conversion with Centralized Script

### Using the PDF Converter

The workspace includes a centralized PDF conversion system. No need to copy files - just call the script from anywhere:

```bash
# From any application directory
/home/michelek/Documents/tööotsing/scripts/pdf [OPTIONS] [FILES...]

# Or add to PATH for convenience:
export PATH="/home/michelek/Documents/tööotsing/scripts:$PATH"
pdf [OPTIONS] [FILES...]
```

The `pdf` script automatically:
- Uses centralized `.header.tex` from `/templates/` directory
- Extracts metadata from HTML comments or footer format
- Only regenerates PDFs when source files change (incremental builds)
- Applies consistent formatting across all documents
- Generates professional footers with document tracking
- Outputs to `delivery/` folder in current directory

**Basic usage:**

```bash
# Convert specific files in current directory
pdf email_template.md cover_letter.md

# Convert all .md files
pdf *.md

# Force rebuild all PDFs
pdf --force

# Clean output directory before build
pdf --clean

# Specify custom output directory
pdf --output pdfs/
```

### Metadata Format: HTML Comment Header (Recommended)

Add this at the top of your markdown file:

```markdown
<!--
docID: RmIT-PO-CL
version: 1.0
date: 2025-11-20
author: Mihkel Putrinš
-->

# Your Document Title

[Content here...]
```

**Alternative format** (also supported):

```markdown
<!--
document ID: RmIT-PO-CL
version: 1.0
date: 2025-11-20
author: Mihkel Putrinš
-->
```

**Advantages:**
- Won't show in rendered PDF
- Easy to read and edit
- Works with markdownlint
- Consistent across all document types
- Flexible field names (`docID:` or `document ID:` both work)

### Metadata Format: Footer (Alternative)

Add this at the end of your markdown file:

```markdown
[Main content...]

---

**Document ID**: AGILE  
**Document Version**: 1.0  
**Date**: October 23, 2025  
**Author**: Mihkel Putrinš
```

**Advantages:**
- Visible in markdown preview
- Clear document tracking
- Used in Elektrum homework assignments
- Footer is automatically stripped from PDF content

**Note:** The script will automatically detect which format you're using and extract metadata accordingly.

### Footer Appearance in PDF

With metadata present, PDFs will have professional footers:

```
┌─────────────────────────────────────────────────┐
│ [Content]                                       │
│                                                 │
├─────────────────────────────────────────────────┤
│ RmIT-PO-CL | Mihkel Putrinš    1/1    1.0 | 2025-11-20 │
└─────────────────────────────────────────────────┘
   ↑                              ↑       ↑
   Document ID & Author      Page#    Version & Date
```

**Verified example from RmIT application:**
- Email template footer: `RmIT-PO-EMAIL | Mihkel Putrinš    1/1    1.0 | 2025-11-20`
- Cover letter footer: `RmIT-PO-CL | Mihkel Putrinš    1/1    1.0 | 2025-11-20`

Without metadata, footers show only page numbers:

```
┌─────────────────────────────────────────────────┐
│ [Content]                                       │
│                                                 │
├─────────────────────────────────────────────────┤
│                           1/1                   │
└─────────────────────────────────────────────────┘
```

## Related Tools and Commands

### PDF Manipulation

```bash
# Extract text from PDF (verification)
pdftotext OUTPUT.pdf output.txt

# Get PDF metadata
pdfinfo OUTPUT.pdf

# Combine multiple PDFs
pdfunite file1.pdf file2.pdf file3.pdf combined.pdf

# Compress PDF (reduce file size)
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
   -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed.pdf original.pdf
```

### Markdown Linting

```bash
# Check markdown formatting
markdownlint kaaskiri.md

# Auto-fix common issues
markdownlint --fix kaaskiri.md
```

### Batch Operations

```bash
# Convert all markdown in subdirectories using smart script
find . -name "*.md" -print0 | xargs -0 ./convert-to-pdf.sh

# Generate table of contents for all PDFs
for pdf in delivery/*.pdf; do
    echo "$(basename "$pdf"): $(pdfinfo "$pdf" | grep Pages | awk '{print $2}') pages"
done

# Extract and verify all metadata
for pdf in delivery/*.pdf; do
    echo "=== $(basename "$pdf") ==="
    pdfinfo "$pdf" | grep -E "Title|Author|Creator|Producer"
    echo ""
done
```

---

## Advanced: Custom LaTeX Header Template

The `.header.tex` template provides consistent styling across all documents. Copy from templates:

```bash
cp /home/michelek/Documents/tööotsing/templates/.header.tex .
```

**Key features:**

```latex
% Custom heading spacing (professional, not cramped)
\titlespacing*{\section}{0pt}{36pt plus 4pt minus 2pt}{12pt plus 2pt minus 2pt}
\titlespacing*{\subsection}{0pt}{32pt plus 4pt minus 2pt}{8pt plus 2pt minus 2pt}

% Prevent orphans/widows (single lines at page breaks)
\widowpenalty=10000
\clubpenalty=10000

% Compact list spacing
\setlist[enumerate,1]{topsep=1pt, partopsep=0pt, itemsep=0pt, parsep=0pt}

% Footer with metadata placeholders
\fancyfoot[L]{\small \ifx\docid\empty\docauthor\else\docid\ | \docauthor\fi}
\fancyfoot[C]{\small \thepage/\pageref{LastPage}}
\fancyfoot[R]{\small \ifx\docversion\empty\docdate\else\docversion\ | \docdate\fi}
```

**Manual usage** (without script):

```bash
pandoc document.md -o document.pdf \
  --pdf-engine=xelatex \
  -V geometry:a4paper \
  -V geometry:margin=2.5cm \
  -V fontsize=11pt \
  -V lang=et \
  -H .header.tex \
  --from markdown+smart
```

**With custom metadata:**

```bash
# Create temporary header with metadata
cat .header.tex > temp_header.tex
echo "\\renewcommand{\\docid}{RmIT-PO-CL}" >> temp_header.tex
echo "\\renewcommand{\\docversion}{v1.0}" >> temp_header.tex
echo "\\renewcommand{\\docdate}{2025-11-20}" >> temp_header.tex
echo "\\renewcommand{\\docauthor}{Mihkel Putrinš}" >> temp_header.tex

# Convert with custom header
pandoc document.md -o document.pdf \
  --pdf-engine=xelatex \
  -V geometry:a4paper \
  -H temp_header.tex \
  --from markdown+smart

# Cleanup
rm temp_header.tex
```

**Note:** The smart conversion script (`convert-to-pdf.sh`) automates this entire process.

---

## Conclusion

This conversion system provides professional PDF generation with automatic metadata extraction. Key principles:

1. **Working directory matters**: Script creates `delivery/` subfolder in your CURRENT directory
2. **Always cd first**: Navigate to application directory before running conversion
3. **Centralized templates**: `.header.tex` in `/templates/`, script in `/scripts/`
4. **No local copies needed**: Call `/scripts/pdf` from anywhere in workspace
5. **Add metadata**: Use HTML comment header format (recommended) or footer format
6. **Smart regeneration**: Script only rebuilds when files change (faster workflow)
7. **Consistent formatting**: Professional headers, footers, spacing across all documents
8. **Estonian support**: Always uses `-V lang=et` and `--pdf-engine=xelatex`

**Quick Start Workflow:**

```bash
# IMPORTANT: Always navigate to the application directory FIRST
# The script creates output in delivery/ subfolder of current working directory
cd /home/michelek/Documents/tööotsing/applications/Company/Position

# Add metadata to markdown files (use HTML comment format)
# <!-- docID: XXX version: 1.0 date: YYYY-MM-DD author: Your Name -->

# Convert to PDF (creates PDFs in ./delivery/)
/home/michelek/Documents/tööotsing/scripts/pdf document.md

# Done! Output in ./delivery/ (relative to current directory)
ls -lh delivery/
```

**Optional: Add to PATH for convenience:**

```bash
echo 'export PATH="/home/michelek/Documents/tööotsing/scripts:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Now you can just use:
pdf document.md
```

---

**Document ID**: TOOL-PDF-CONVERT-v3.1  
**Last updated**: 2025-11-20  
**Last tested**: RmIT Tooteomanik application (email_template.md, cover letter) - footers verified working  
**Author**: GitHub Copilot

---

## Revision History

- **v1.0** (2025-11-20): Initial version with basic pandoc command
- **v2.0** (2025-11-20): Added footer metadata extraction, smart regeneration, batch processing, comprehensive troubleshooting, QA checklist, and advanced examples based on Elektrum homework conversion script patterns
- **v3.0** (2025-11-20): Added reusable templates (`.header.tex`, `convert-to-pdf.sh`), HTML comment metadata support, automated metadata extraction from two formats, comprehensive template documentation, and quick start workflow
- **v3.1** (2025-11-20): Fixed metadata field name flexibility (supports both `docID:` and `document ID:` formats), verified footer rendering in production PDFs, added real examples from RmIT application
