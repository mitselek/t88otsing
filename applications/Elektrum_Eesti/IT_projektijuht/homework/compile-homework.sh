#!/usr/bin/env bash
set -euo pipefail

# Homework Compilation Script for Elektrum IT PM Application
# Author: Mihkel Putrinš
# Date: 2025-10-23
# Purpose: Compile homework files, convert to A4 PDFs, package for delivery

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_DIR="${SCRIPT_DIR}/delivery/Elektrum_IT_PM_Homework_${TIMESTAMP}"
ARCHIVE_NAME="Elektrum_IT_PM_Homework_${TIMESTAMP}.zip"
AUTHOR="Mihkel Putrinš"
DATE="2025-10-23"

# Counters
FILES_COPIED=0
PDFS_CREATED=0
PDFS_FAILED=0
ERRORS_LOG="${OUTPUT_DIR}/errors.log"

# Function to print colored messages
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_ok() {
    echo -e "${GREEN}[OK]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_check() {
    echo -e "${BLUE}[CHECK]${NC} $1"
}

# Function to check dependencies
check_dependencies() {
    log_info "Checking dependencies..."
    
    local missing_deps=()
    
    if ! command -v pandoc &> /dev/null; then
        missing_deps+=("pandoc")
    else
        log_ok "pandoc found: $(which pandoc)"
    fi
    
    if ! command -v pdflatex &> /dev/null; then
        missing_deps+=("pdflatex")
    else
        log_ok "pdflatex found: $(which pdflatex)"
    fi
    
    if ! command -v zip &> /dev/null; then
        missing_deps+=("zip")
    else
        log_ok "zip found: $(which zip)"
    fi
    
    if [ ${#missing_deps[@]} -ne 0 ]; then
        log_error "Missing dependencies: ${missing_deps[*]}"
        echo ""
        echo "Install missing dependencies:"
        echo "  sudo apt-get install pandoc texlive-latex-base texlive-latex-extra zip"
        exit 2
    fi
    
    echo ""
}

# Function to setup output directory
setup_output_dir() {
    log_info "Setting up output directory..."
    log_info "Output: ${OUTPUT_DIR}"
    
    if [ -d "${OUTPUT_DIR}" ]; then
        log_warning "Output directory already exists: ${OUTPUT_DIR}"
        rm -rf "${OUTPUT_DIR}"
    fi
    
    mkdir -p "${OUTPUT_DIR}"
    mkdir -p "${OUTPUT_DIR}/task1/Companion Documents"
    mkdir -p "${OUTPUT_DIR}/task2"
    
    # Create errors log
    touch "${ERRORS_LOG}"
    
    log_ok "Output directory created"
    echo ""
}

# Function to copy markdown file and convert to PDF
process_markdown_file() {
    local src_file="$1"
    local dest_file="$2"
    local pdf_file="${dest_file%.md}.pdf"
    
    # Copy markdown file
    cp "${src_file}" "${dest_file}"
    ((FILES_COPIED++))
    log_ok "Copied: $(basename "${src_file}")"
    
    # Convert to PDF
    log_info "Converting to PDF: $(basename "${src_file}")"
    
    local pdf_dir=$(dirname "${pdf_file}")
    local pdf_basename=$(basename "${pdf_file}")
    
    # Run pandoc with output suppression except for errors
    if (cd "${pdf_dir}" && pandoc "$(basename "${dest_file}")" \
        -o "${pdf_basename}" \
        --pdf-engine=pdflatex \
        -V geometry:a4paper \
        -V geometry:margin=1in \
        -V fontsize=11pt \
        --toc \
        --number-sections \
        2>> "${ERRORS_LOG}"); then
        ((PDFS_CREATED++))
        log_ok "PDF created: ${pdf_basename}"
    else
        ((PDFS_FAILED++))
        log_error "PDF conversion failed: $(basename "${src_file}")"
        echo "Failed to convert: ${src_file}" >> "${ERRORS_LOG}"
    fi
}

# Function to copy files
copy_and_convert_files() {
    log_info "Processing Task 1 files..."
    echo ""
    
    # Task 1 core files
    process_markdown_file \
        "${SCRIPT_DIR}/task1/task1_agile_plan.md" \
        "${OUTPUT_DIR}/task1/task1_agile_plan.md"
    
    process_markdown_file \
        "${SCRIPT_DIR}/task1/business_problem_summary.md" \
        "${OUTPUT_DIR}/task1/business_problem_summary.md"
    
    process_markdown_file \
        "${SCRIPT_DIR}/task1/README.md" \
        "${OUTPUT_DIR}/task1/README.md"
    
    echo ""
    log_info "Processing Task 1 Companion Documents..."
    echo ""
    
    # Task 1 companion documents
    for md_file in "${SCRIPT_DIR}/task1/Companion Documents"/*.md; do
        if [ -f "${md_file}" ]; then
            local basename=$(basename "${md_file}")
            process_markdown_file \
                "${md_file}" \
                "${OUTPUT_DIR}/task1/Companion Documents/${basename}"
        fi
    done
    
    echo ""
    log_info "Processing Task 2 files..."
    echo ""
    
    # Task 2 files
    process_markdown_file \
        "${SCRIPT_DIR}/task2/task2_submission.md" \
        "${OUTPUT_DIR}/task2/task2_submission.md"
    
    # Copy PlantUML file (not converted)
    if [ -f "${SCRIPT_DIR}/task2/task2_file_processing.puml" ]; then
        cp "${SCRIPT_DIR}/task2/task2_file_processing.puml" \
           "${OUTPUT_DIR}/task2/task2_file_processing.puml"
        ((FILES_COPIED++))
        log_ok "Copied: task2_file_processing.puml"
    fi
    
    echo ""
}

# Function to generate manifest
generate_manifest() {
    log_info "Generating manifest..."
    
    local manifest="${OUTPUT_DIR}/MANIFEST.txt"
    
    cat > "${manifest}" << EOF
HOMEWORK COMPILATION MANIFEST
===============================================

Generated: $(date '+%Y-%m-%d %H:%M:%S')
Author: ${AUTHOR}
Source: ${SCRIPT_DIR}

FILES INCLUDED:
===============================================

Task 1: Agile Development Plan & IT Specialist Responsibilities
-----------------------------------------------------------
EOF
    
    # List Task 1 files
    find "${OUTPUT_DIR}/task1" -type f -name "*.md" -o -name "*.pdf" | sort | while read -r file; do
        local rel_path="${file#${OUTPUT_DIR}/}"
        local size=$(du -h "${file}" | cut -f1)
        echo "  ${rel_path} (${size})" >> "${manifest}"
    done
    
    cat >> "${manifest}" << EOF

Task 2: Process Diagram
-----------------------------------------------------------
EOF
    
    # List Task 2 files
    find "${OUTPUT_DIR}/task2" -type f | sort | while read -r file; do
        local rel_path="${file#${OUTPUT_DIR}/}"
        local size=$(du -h "${file}" | cut -f1)
        echo "  ${rel_path} (${size})" >> "${manifest}"
    done
    
    # Add summary
    local total_size=$(du -sh "${OUTPUT_DIR}" | cut -f1)
    
    cat >> "${manifest}" << EOF

SUMMARY:
-----------------------------------------------------------
Total Files: ${FILES_COPIED}
PDFs Created: ${PDFS_CREATED}
PDFs Failed: ${PDFS_FAILED}
Total Size: ${total_size}

EOF
    
    log_ok "Manifest created: MANIFEST.txt"
}

# Function to generate README for reviewer
generate_readme() {
    log_info "Generating README for reviewer..."
    
    local readme="${OUTPUT_DIR}/README_FOR_REVIEWER.txt"
    
    cat > "${readme}" << 'EOF'
===============================================
HOMEWORK SUBMISSION
Elektrum Eesti OÜ - IT Projektijuht Position
===============================================

Author: Mihkel Putrinš
Date: October 23, 2025
Submission Date: October 26, 2025

CONTENTS:
===============================================

Task 1: Agile Development Plan & IT Specialist Responsibilities
-----------------------------------------------------------

Core Documents:
  task1_agile_plan.pdf
    - Comprehensive Agile development plan (4 sprints, 8 weeks)
    - Sprint-by-sprint breakdown with user stories
    - IT Specialist responsibilities integrated throughout
    - Definition of Done criteria
    
  business_problem_summary.pdf
    - Detailed business requirements analysis
    - Complete business logic breakdown
    - Integration point mapping
    - Edge case analysis
    
  README.pdf
    - Documentation package navigation guide
    - Reading recommendations by time available
    - Key differentiators and value propositions

Companion Documents:
  Companion Documents/IT_Specialist_Role_Definition.pdf
    - Phase-by-phase responsibilities breakdown
    - Cross-functional collaboration patterns
    - Success metrics and typical weekly schedule
    
  Companion Documents/Metrics_and_Monitoring.pdf
    - Technical KPIs, business KPIs, project execution metrics
    - Monitoring infrastructure design
    - Performance testing strategy
    
  Companion Documents/Team_Structure_and_RACI.pdf
    - Team organization chart with reporting lines
    - RACI matrix for key project activities
    - Decision authority levels and team capacity
    
  Companion Documents/Domain_Glossary.pdf
    - Project acronyms and terminology reference
    - Technical and business domain definitions

Task 2: Process Diagram
-----------------------------------------------------------

  task2_submission.pdf
    - File processing flowchart with proper notation
    - Conditional logic and decision points
    - Four-column swimlane structure
    - Complete with error handling paths

FORMAT NOTES:
-----------------------------------------------------------

- All documents provided in both Markdown (.md) and PDF (.pdf) formats
- PDFs formatted for A4 paper (210mm × 297mm) with 1-inch margins
- Table of contents included where applicable
- Section numbering for easy reference
- Original markdown preserved for source review

REVIEW RECOMMENDATIONS:
-----------------------------------------------------------

Quick Review (15 min):
  1. task1/README.pdf - Documentation overview
  2. task1/task1_agile_plan.pdf - Sprint goals and business value
  3. task2/task2_submission.pdf - Process diagram

Comprehensive Review (45 min):
  1. task1/business_problem_summary.pdf - Business context
  2. task1/task1_agile_plan.pdf - Full Agile approach
  3. Companion Documents - Role definition, metrics, team structure
  4. task2/task2_submission.pdf - Complete process analysis

Deep Dive (2+ hours):
  - All core documents
  - All companion documents
  - Cross-reference validation
  - Markdown source review

CONTACT:
-----------------------------------------------------------

For questions about this submission:
Mihkel Putrinš
Email: [your email]
Phone: [your phone]

Thank you for reviewing my application!

===============================================
EOF
    
    log_ok "README created: README_FOR_REVIEWER.txt"
}

# Function to print summary
print_summary() {
    echo ""
    echo "=============================================="
    log_info "COMPILATION SUMMARY"
    echo "=============================================="
    echo ""
    echo "  Files Copied:    ${FILES_COPIED}"
    echo "  PDFs Created:    ${PDFS_CREATED}"
    
    if [ ${PDFS_FAILED} -gt 0 ]; then
        echo "  PDFs Failed:     ${PDFS_FAILED} (see ${ERRORS_LOG})"
    fi
    
    echo ""
    echo "  Output Location: ${OUTPUT_DIR}"
    
    if [ -s "${ERRORS_LOG}" ]; then
        log_warning "Some errors occurred during PDF conversion"
        log_warning "Check ${ERRORS_LOG} for details"
    else
        rm -f "${ERRORS_LOG}"
    fi
    
    echo ""
    echo "=============================================="
    
    # Calculate total size
    local total_size=$(du -sh "${OUTPUT_DIR}" | cut -f1)
    echo "  Total Size:      ${total_size}"
    echo "=============================================="
    echo ""
}

# Function to prompt for zip creation
prompt_for_zip() {
    echo ""
    log_info "Ready to create delivery archive"
    echo ""
    echo "Archive will be created at:"
    echo "  ${SCRIPT_DIR}/delivery/${ARCHIVE_NAME}"
    echo ""
    
    read -p "Create ZIP archive now? [Y/n] " -n 1 -r
    echo ""
    
    if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
        return 0
    else
        return 1
    fi
}

# Function to create archive
create_archive() {
    log_info "Creating ZIP archive..."
    
    local archive_path="${SCRIPT_DIR}/delivery/${ARCHIVE_NAME}"
    
    # Remove old archive if exists
    if [ -f "${archive_path}" ]; then
        rm -f "${archive_path}"
    fi
    
    # Create zip (suppress output, show only result)
    (cd "${SCRIPT_DIR}/delivery" && \
     zip -r -q "$(basename "${archive_path}")" "$(basename "${OUTPUT_DIR}")")
    
    if [ -f "${archive_path}" ]; then
        local archive_size=$(du -h "${archive_path}" | cut -f1)
        log_ok "Archive created: ${ARCHIVE_NAME} (${archive_size})"
        echo ""
        echo "Delivery archive ready:"
        echo "  ${archive_path}"
        echo ""
        log_info "You can now email this file to Elektrum Eesti"
    else
        log_error "Failed to create archive"
        exit 1
    fi
}

# Function to cleanup temporary files
cleanup_temp_files() {
    log_info "Cleaning up temporary LaTeX files..."
    
    find "${OUTPUT_DIR}" -type f \( \
        -name "*.aux" -o \
        -name "*.log" -o \
        -name "*.out" -o \
        -name "*.toc" \) -delete
    
    log_ok "Cleanup complete"
}

# Main execution
main() {
    echo ""
    echo "=============================================="
    echo "  Elektrum IT PM Homework Compilation"
    echo "  Author: ${AUTHOR}"
    echo "  Date: ${DATE}"
    echo "=============================================="
    echo ""
    
    check_dependencies
    setup_output_dir
    copy_and_convert_files
    cleanup_temp_files
    generate_manifest
    generate_readme
    print_summary
    
    if prompt_for_zip; then
        create_archive
    else
        echo ""
        log_info "Archive not created. You can create it later with:"
        echo "  cd ${SCRIPT_DIR}/delivery"
        echo "  zip -r ${ARCHIVE_NAME} $(basename "${OUTPUT_DIR}")"
        echo ""
    fi
    
    log_ok "Compilation complete!"
    echo ""
}

# Run main function
main "$@"
