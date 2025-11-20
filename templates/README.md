# PDF Conversion Templates

Last updated: 2025-11-20T18:40:37+02:00

Professional PDF generation templates for job applications and technical documentation with automatic metadata extraction and smart regeneration.

## Quick Start

**No setup required!** Just use the centralized script from anywhere:

```bash
# From any application directory
cd /path/to/your/application/folder
/home/michelek/Documents/tööotsing/scripts/pdf cover_letter.md CV.md

# Or add to PATH:
export PATH="/home/michelek/Documents/tööotsing/scripts:$PATH"
pdf cover_letter.md CV.md
```

1. **Add metadata to your markdown file (at the top):**

   ```markdown
   <!--
   docID: COMPANY-POSITION-DOC
   version: 1.0
   date: 2025-11-20
   author: Mihkel Putrinš
   -->

   # Your Document Title

   [Content...]
   ```

2. **Convert to PDF:**

   ```bash
   /home/michelek/Documents/tööotsing/scripts/pdf document.md
   ```

3. **Done!** Output in `delivery/` folder.

## Files in This Directory

### `.header.tex`

LaTeX header template that provides:

- Professional heading spacing (not too cramped)
- Compact list formatting
- Orphan/widow prevention (no single lines at page breaks)
- Footer with automatic metadata display:
  - Left: Document ID | Author
  - Center: Page X/Total
  - Right: Version | Date

**Usage:** Automatically loaded by `convert-to-pdf.sh` or use with pandoc:

```bash
pandoc document.md -o document.pdf --pdf-engine=xelatex -H .header.tex
```

### `convert-to-pdf.sh`

Smart conversion script with features:

- **Metadata extraction:** Automatically reads from HTML comments or footer format
- **Incremental builds:** Only regenerates PDFs when source files change
- **Estonian support:** Proper character encoding (õ, ä, ö, ü) and hyphenation
- **Professional formatting:** A4 layout, appropriate margins, clean typography
- **Statistics:** Shows regenerated/skipped/failed counts

**Options:**

```bash
./convert-to-pdf.sh [OPTIONS] [FILE...]

Options:
  --force, -f          Force regeneration of all PDFs
  --clean, -c          Clean output directory before build
  --output DIR, -o     Specify output directory (default: delivery/)
  --help, -h           Show help message
```

## Metadata Formats Supported

### Format 1: HTML Comment Header (Recommended)

Add at the **top** of your markdown file:

```markdown
<!--
docID: RmIT-PO-CL
version: 1.0
date: 2025-11-20
author: Mihkel Putrinš
-->

# Document Title
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

### Format 2: Footer Metadata (Alternative)

Add at the **end** of your markdown file:

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
- Footer is automatically stripped from PDF content
- Used in technical reports and homework assignments

The script automatically detects which format you're using.

## PDF Footer Examples

### With Metadata

```text
┌─────────────────────────────────────────────────┐
│ [Document content]                              │
├─────────────────────────────────────────────────┤
│ RmIT-PO-CL | Mihkel Putrinš    1/1    1.0 | 2025-11-20 │
└─────────────────────────────────────────────────┘
```

**Verified examples:**

- RmIT email template: `RmIT-PO-EMAIL | Mihkel Putrinš    1/1    1.0 | 2025-11-20`
- RmIT cover letter: `RmIT-PO-CL | Mihkel Putrinš    1/1    1.0 | 2025-11-20`

### Without Metadata

```text
┌─────────────────────────────────────────────────┐
│ [Document content]                              │
├─────────────────────────────────────────────────┤
│                           1/1                   │
└─────────────────────────────────────────────────┘
```

## Examples

### Example 1: RmIT Job Application

```bash
cd applications/RmIT/Tooteomanik

# Setup
cp ../../../templates/.header.tex .
cp ../../../templates/convert-to-pdf.sh .
chmod +x convert-to-pdf.sh

# Convert application materials
./convert-to-pdf.sh Mihkel_Putrins_CV_RmIT.md Mihkel_Putrins_kaaskiri_RmIT.md

# Output in delivery/ folder
ls -lh delivery/
```

### Example 2: Technical Report with Footer Metadata

Your markdown file `report.md`:

```markdown
# Technical Analysis Report

## Executive Summary

[Content...]

## Findings

[Content...]

---

**Document ID**: TECH-RPT-001  
**Document Version**: 2.1  
**Date**: November 20, 2025  
**Author**: Mihkel Putrinš
```

Convert:

```bash
./convert-to-pdf.sh report.md
```

Result: `delivery/report.pdf` with footer showing "TECH-RPT-001 | Mihkel Putrinš" on left, page numbers center, "v2.1 | November 20, 2025" on right.

### Example 3: Batch Conversion

```bash
# Convert all markdown files in current directory
./convert-to-pdf.sh

# Convert all with custom output directory
./convert-to-pdf.sh --output final_pdfs/

# Force rebuild all (ignore timestamps)
./convert-to-pdf.sh --force

# Clean build (delete old PDFs first)
./convert-to-pdf.sh --clean
```

## Incremental Builds

The script intelligently rebuilds only when needed:

- PDF doesn't exist → regenerate
- Markdown file newer than PDF → regenerate
- `.header.tex` modified → regenerate all
- `--force` flag → regenerate all
- Otherwise → skip (shows "⊘ Skipped")

**Example output:**

```text
Smart PDF Converter
===================

Processing 3 markdown file(s)...

Converting: document1.md -> document1.pdf
✓ Created: /path/to/delivery/document1.pdf (28K)

⊘ Skipped (up-to-date): document2.md
⊘ Skipped (up-to-date): document3.md

=== Summary ===

Regenerated: 1 PDF(s)
Skipped:     2 PDF(s) (already up-to-date)
```

## Troubleshooting

### Estonian Characters Not Showing

**Solution:** The script uses `--pdf-engine=xelatex -V lang=et` automatically. Make sure XeLaTeX is installed:

```bash
sudo apt-get install texlive-xetex texlive-lang-european
```

### Metadata Not Appearing in Footer

**Check:**

1. Metadata format matches one of the two supported formats
2. HTML comment fields: `docID:`, `version:`, `date:`, `author:` (case-sensitive)
3. Footer fields: `**Document ID**:`, `**Document Version**:` etc. (exact format required)

**Debug:** Run script with verbose pandoc output:

```bash
# Edit convert-to-pdf.sh temporarily, remove "| grep -v" filter to see all output
```

### Script Won't Execute

**Solution:**

```bash
chmod +x convert-to-pdf.sh
```

### PDFs in Wrong Location

**Solution:** Use `--output` flag:

```bash
./convert-to-pdf.sh --output pdfs/ document.md
```

Or edit `OUTPUT_DIR` variable in script.

## Related Documentation

- **Main guide:** `/home/michelek/Documents/tööotsing/.github/prompts/convert-to-pdf.prompt.md`
- **Elektrum homework examples:** `/home/michelek/Documents/tööotsing/applications/Elektrum_Eesti/IT_projektijuht/homework/`

## Version History

- **v1.0** (2025-11-20): Initial templates with dual metadata format support, smart regeneration, professional formatting
