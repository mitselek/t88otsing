#!/bin/bash

# Smart PDF converter: Only regenerates PDFs when source files or .header.tex are newer
# Output goes to delivery/task1/ and delivery/task2/

set -e  # Exit on error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DELIVERY_DIR="${SCRIPT_DIR}/delivery"

# Use the LaTeX header file for custom heading spacing
HEADER_FILE="${SCRIPT_DIR}/.header.tex"

# Statistics counters
REGENERATED_COUNT=0
SKIPPED_COUNT=0
FAILED_COUNT=0

# Parse command-line arguments
FORCE_REBUILD=false
CLEAN_BUILD=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --force|-f)
            FORCE_REBUILD=true
            shift
            ;;
        --clean|-c)
            CLEAN_BUILD=true
            shift
            ;;
        --help|-h)
            echo "Usage: $(basename $0) [OPTIONS]"
            echo ""
            echo "Smart PDF converter - only regenerates when source files change"
            echo ""
            echo "Options:"
            echo "  --force, -f    Force regeneration of all PDFs"
            echo "  --clean, -c    Clean delivery directory before build"
            echo "  --help, -h     Show this help message"
            echo ""
            echo "Default: Incremental build (only regenerate changed files)"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

echo "Converting markdown files to PDF..."
echo ""

# Check if PDF needs regeneration based on timestamps
needs_regeneration() {
    local md_file="$1"
    local pdf_file="$2"
    
    # Force rebuild flag overrides everything
    if [ "${FORCE_REBUILD}" = true ]; then
        return 0  # true
    fi
    
    # PDF doesn't exist -> needs regeneration
    if [ ! -f "${pdf_file}" ]; then
        return 0  # true
    fi
    
    # MD file is newer than PDF -> needs regeneration
    if [ "${md_file}" -nt "${pdf_file}" ]; then
        return 0  # true
    fi
    
    # .header.tex is newer than PDF -> needs regeneration
    if [ "${HEADER_FILE}" -nt "${pdf_file}" ]; then
        return 0  # true
    fi
    
    return 1  # false - no regeneration needed
}

# Function to convert a single markdown file
convert_md_to_pdf() {
    local md_file="$1"
    local relative_path="$2"
    local output_dir="${DELIVERY_DIR}/${relative_path}"
    
    # Create output directory
    mkdir -p "${output_dir}"
    
    # Get filename without extension
    local basename=$(basename "${md_file}" .md)
    local pdf_file="${output_dir}/${basename}.pdf"
    
    # Check if regeneration needed
    if needs_regeneration "${md_file}" "${pdf_file}"; then
        echo "Converting: ${md_file} -> ${pdf_file}"
        
        # Convert with pandoc using xelatex
        if pandoc "${md_file}" \
            -o "${pdf_file}" \
            --pdf-engine=xelatex \
            -V geometry:a4paper \
            -V geometry:margin=1in \
            -V fontsize=11pt \
            -H "${HEADER_FILE}" \
            --from markdown+raw_tex \
            --pdf-engine-opt=-interaction=nonstopmode \
            2>&1 | grep -v "Missing character" || true; then
            
            if [ -f "${pdf_file}" ]; then
                echo "✓ Created: ${pdf_file}"
                echo ""
                REGENERATED_COUNT=$((REGENERATED_COUNT + 1))
                return 0
            else
                echo "✗ Failed to create: ${pdf_file}"
                echo ""
                FAILED_COUNT=$((FAILED_COUNT + 1))
                return 1
            fi
        else
            echo "✗ Pandoc failed for: ${pdf_file}"
            echo ""
            FAILED_COUNT=$((FAILED_COUNT + 1))
            return 1
        fi
    else
        echo "⊘ Skipped (up-to-date): ${basename}.pdf"
        SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
    fi
}

# Conditional directory cleaning
if [ "${CLEAN_BUILD}" = true ]; then
    echo "🗑️  Cleaning delivery directory..."
    rm -rf "${DELIVERY_DIR}"
    mkdir -p "${DELIVERY_DIR}"
    echo ""
else
    # Ensure delivery directory exists
    mkdir -p "${DELIVERY_DIR}"
fi

# Check if header file was recently modified (warn user)
if [ -f "${HEADER_FILE}" ]; then
    HEADER_AGE=$(($(date +%s) - $(stat -c %Y "${HEADER_FILE}" 2>/dev/null || echo 0)))
    if [ ${HEADER_AGE} -lt 300 ] && [ "${FORCE_REBUILD}" = false ] && [ "${CLEAN_BUILD}" = false ]; then
        echo "⚠️  Note: .header.tex was modified ${HEADER_AGE}s ago"
        echo "   All PDFs will be regenerated to apply new formatting"
        echo ""
    fi
fi

# Process task1 files
echo "=== Task 1 ==="
echo ""

# Main task1 files
for md_file in "${SCRIPT_DIR}/task1"/*.md; do
    if [ -f "${md_file}" ]; then
        convert_md_to_pdf "${md_file}" "task1"
    fi
done

# Task1 companion documents
for md_file in "${SCRIPT_DIR}/task1/Companion Documents"/*.md; do
    if [ -f "${md_file}" ]; then
        convert_md_to_pdf "${md_file}" "task1/Companion Documents"
    fi
done

# Process task2 files
echo "=== Task 2 ==="
echo ""

# Copy diagram files first (needed for PDF generation)
if [ -f "${SCRIPT_DIR}/task2/task2_file_processing_diagram.svg" ]; then
    mkdir -p "${DELIVERY_DIR}/task2"
    cp "${SCRIPT_DIR}/task2/task2_file_processing_diagram.svg" "${DELIVERY_DIR}/task2/"
    echo "✓ Copied: task2_file_processing_diagram.svg"
fi

if [ -f "${SCRIPT_DIR}/task2/task2_file_processing_diagram.png" ]; then
    mkdir -p "${DELIVERY_DIR}/task2"
    cp "${SCRIPT_DIR}/task2/task2_file_processing_diagram.png" "${DELIVERY_DIR}/task2/"
    echo "✓ Copied: task2_file_processing_diagram.png"
fi

echo ""

for md_file in "${SCRIPT_DIR}/task2"/*.md; do
    if [ -f "${md_file}" ]; then
        # Change to task2 directory so relative image paths work
        cd "${SCRIPT_DIR}/task2"
        convert_md_to_pdf "${md_file}" "task2"
        cd "${SCRIPT_DIR}"
    fi
done

# Copy PlantUML file
if [ -f "${SCRIPT_DIR}/task2/task2_file_processing.puml" ]; then
    cp "${SCRIPT_DIR}/task2/task2_file_processing.puml" "${DELIVERY_DIR}/task2/"
    echo "✓ Copied: task2_file_processing.puml"
    echo ""
fi

echo "=== Summary ==="
echo ""
echo "Regenerated: ${REGENERATED_COUNT} PDF(s)"
echo "Skipped:     ${SKIPPED_COUNT} PDF(s) (already up-to-date)"
if [ ${FAILED_COUNT} -gt 0 ]; then
    echo "Failed:      ${FAILED_COUNT} PDF(s)"
fi
echo ""
echo "PDFs location: ${DELIVERY_DIR}"
echo ""

if [ ${REGENERATED_COUNT} -gt 0 ]; then
    echo "Generated PDFs:"
    find "${DELIVERY_DIR}" -name "*.pdf" -exec ls -lh {} \; | awk '{print "  " $9 " (" $5 ")"}'
fi

echo ""
echo "Done!"

# Exit with error if any conversions failed
if [ ${FAILED_COUNT} -gt 0 ]; then
    exit 1
fi
