#!/bin/bash

# Simple script to convert all markdown files in task1/ and task2/ to PDFs
# Output goes to delivery/task1/ and delivery/task2/

set -e  # Exit on error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DELIVERY_DIR="${SCRIPT_DIR}/delivery"

# Use the LaTeX header file for custom heading spacing
HEADER_FILE="${SCRIPT_DIR}/.header.tex"

echo "Converting markdown files to PDF..."
echo ""

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
    
    echo "Converting: ${md_file} -> ${pdf_file}"
    
    # Convert with pandoc using xelatex
    pandoc "${md_file}" \
        -o "${pdf_file}" \
        --pdf-engine=xelatex \
        -V geometry:a4paper \
        -V geometry:margin=1in \
        -V fontsize=11pt \
        -H "${HEADER_FILE}" \
        --from markdown+raw_tex \
        --pdf-engine-opt=-interaction=nonstopmode \
        2>&1 | grep -v "Missing character" || true
    
    if [ -f "${pdf_file}" ]; then
        echo "✓ Created: ${pdf_file}"
        echo ""
    else
        echo "✗ Failed to create: ${pdf_file}"
        echo ""
        return 1
    fi
}

# Clean delivery directory
rm -rf "${DELIVERY_DIR}"
mkdir -p "${DELIVERY_DIR}"

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
echo "PDFs created in: ${DELIVERY_DIR}"
echo ""
find "${DELIVERY_DIR}" -name "*.pdf" -exec ls -lh {} \;

echo ""
echo "Done!"
