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

# Function to extract footer metadata from markdown file
extract_footer_metadata() {
    local md_file="$1"
    local temp_file="$2"
    
    # Extract the last few lines to check for footer pattern
    local last_lines=$(tail -n 10 "${md_file}")
    
    # Check if file ends with footer pattern (--- followed by Document ID, Document Version, Date, Author)
    if echo "$last_lines" | grep -q "^---$" && \
       echo "$last_lines" | grep -q "^\*\*Document Version\*\*:" && \
       echo "$last_lines" | grep -q "^\*\*Date\*\*:" && \
       echo "$last_lines" | grep -q "^\*\*Author\*\*:"; then
        
        # Extract values (Document ID is optional for backward compatibility)
        local doc_id=$(echo "$last_lines" | grep "^\*\*Document ID\*\*:" | sed 's/\*\*Document ID\*\*:[[:space:]]*//')
        local doc_version=$(echo "$last_lines" | grep "^\*\*Document Version\*\*:" | sed 's/\*\*Document Version\*\*:[[:space:]]*//')
        local doc_date=$(echo "$last_lines" | grep "^\*\*Date\*\*:" | sed 's/\*\*Date\*\*:[[:space:]]*//')
        local doc_author=$(echo "$last_lines" | grep "^\*\*Author\*\*:" | sed 's/\*\*Author\*\*:[[:space:]]*//')
        
        # Find the line number of the last occurrence of "---" that precedes the footer
        # Count total lines in file
        local total_lines=$(wc -l < "${md_file}")
        # Find line number of last "---" (search backwards from end)
        local last_separator_line=$(grep -n "^---$" "${md_file}" | tail -n 1 | cut -d: -f1)
        
        if [ -n "$last_separator_line" ]; then
            # Calculate how many lines to keep (everything before the last ---)
            local lines_to_keep=$((last_separator_line - 1))
            # Extract only those lines
            head -n "$lines_to_keep" "${md_file}" > "${temp_file}"
        else
            # Fallback: shouldn't happen if grep found it, but just in case
            cp "${md_file}" "${temp_file}"
        fi
        
        # Return the extracted values (using echo to return multiple values)
        echo "HAS_FOOTER"
        echo "${doc_id}"
        echo "${doc_version}"
        echo "${doc_date}"
        echo "${doc_author}"
        return 0
    else
        # No footer pattern found, just copy the file
        cp "${md_file}" "${temp_file}"
        echo "NO_FOOTER"
        return 1
    fi
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
        
        # Create temporary file for processed markdown
        local temp_md=$(mktemp)
        
        # Extract footer metadata
        local metadata_output=$(extract_footer_metadata "${md_file}" "${temp_md}")
        local has_footer=$(echo "$metadata_output" | head -n 1)
        
        # Build pandoc command with optional footer variables
        local pandoc_cmd="pandoc \"${temp_md}\" \
            -o \"${pdf_file}\" \
            --pdf-engine=xelatex \
            -V geometry:a4paper \
            -V geometry:margin=1in \
            -V fontsize=11pt \
            -H \"${HEADER_FILE}\""
        
        if [ "$has_footer" = "HAS_FOOTER" ]; then
            local doc_id=$(echo "$metadata_output" | sed -n '2p' | xargs)
            local doc_version=$(echo "$metadata_output" | sed -n '3p' | xargs)
            local doc_date=$(echo "$metadata_output" | sed -n '4p' | xargs)
            local doc_author=$(echo "$metadata_output" | sed -n '5p' | xargs)
            
            # Add header file with footer commands defined
            local temp_header=$(mktemp)
            cat "${HEADER_FILE}" > "${temp_header}"
            
            # If doc_id is present, prepend it to author
            if [ -n "$doc_id" ]; then
                echo "\\renewcommand{\\docauthor}{${doc_id} | ${doc_author}}" >> "${temp_header}"
            else
                echo "\\renewcommand{\\docauthor}{${doc_author}}" >> "${temp_header}"
            fi
            
            echo "\\renewcommand{\\docversion}{v${doc_version}}" >> "${temp_header}"
            echo "\\renewcommand{\\docdate}{${doc_date}}" >> "${temp_header}"
            
            # Use the temp header file
            pandoc_cmd="pandoc \"${temp_md}\" \
                -o \"${pdf_file}\" \
                --pdf-engine=xelatex \
                -V geometry:a4paper \
                -V geometry:margin=1in \
                -V fontsize=11pt \
                -H \"${temp_header}\""
        else
            # Use the standard header file
            pandoc_cmd="pandoc \"${temp_md}\" \
                -o \"${pdf_file}\" \
                --pdf-engine=xelatex \
                -V geometry:a4paper \
                -V geometry:margin=1in \
                -V fontsize=11pt \
                -H \"${HEADER_FILE}\""
        fi
        
        pandoc_cmd="$pandoc_cmd \
            --from markdown+raw_tex \
            --pdf-engine-opt=-interaction=nonstopmode"
        
        # Execute pandoc command
        if eval "$pandoc_cmd" 2>&1 | grep -v "Missing character" || true; then
            
            # Cleanup temp files
            rm -f "${temp_md}"
            [ -n "${temp_header}" ] && rm -f "${temp_header}"
            
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
            # Cleanup temp files
            rm -f "${temp_md}"
            [ -n "${temp_header}" ] && rm -f "${temp_header}"
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
