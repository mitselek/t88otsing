#!/bin/bash

# HTML/PDF Conversion Helper Script
# Usage: ./convert.sh [cv|cover] [input.html] [output.pdf]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATES_DIR="$SCRIPT_DIR"

# Function to convert HTML to PDF using browser
convert_to_pdf() {
    local input_html="$1"
    local output_pdf="$2"
    
    if command -v google-chrome &> /dev/null; then
        google-chrome --headless --disable-gpu --print-to-pdf="$output_pdf" "$input_html"
    elif command -v chromium-browser &> /dev/null; then
        chromium-browser --headless --disable-gpu --print-to-pdf="$output_pdf" "$input_html"
    elif command -v firefox &> /dev/null; then
        echo "Firefox detected. Please use File -> Print -> Save as PDF manually."
        firefox "$input_html"
    else
        echo "No suitable browser found. Please install Chrome, Chromium, or Firefox."
        echo "You can also open $input_html in any browser and print to PDF."
        exit 1
    fi
}

# Function to replace placeholders in template
replace_placeholders() {
    local template="$1"
    local output="$2"
    local data_file="$3"
    
    # Simple placeholder replacement (you can enhance this)
    cp "$template" "$output"
    
    # If data file exists, replace placeholders
    if [[ -f "$data_file" ]]; then
        echo "Data file support not implemented yet. Manual replacement needed."
    fi
}

# Main logic
case "${1:-help}" in
    cv)
        INPUT_HTML="${2:-cv.html}"
        OUTPUT_PDF="${3:-cv.pdf}"
        echo "Converting CV: $INPUT_HTML -> $OUTPUT_PDF"
        convert_to_pdf "$INPUT_HTML" "$OUTPUT_PDF"
        ;;
    cover)
        INPUT_HTML="${2:-cover_letter.html}"
        OUTPUT_PDF="${3:-cover_letter.pdf}"
        echo "Converting cover letter: $INPUT_HTML -> $OUTPUT_PDF"
        convert_to_pdf "$INPUT_HTML" "$OUTPUT_PDF"
        ;;
    template)
        TYPE="${2:-cv}"
        if [[ "$TYPE" == "cv" ]]; then
            cp "$TEMPLATES_DIR/cv_template.html" "./cv.html"
            echo "CV template copied to cv.html"
        elif [[ "$TYPE" == "cover" ]]; then
            cp "$TEMPLATES_DIR/cover_letter_template.html" "./cover_letter.html"
            echo "Cover letter template copied to cover_letter.html"
        else
            echo "Unknown template type: $TYPE"
            exit 1
        fi
        ;;
    help|*)
        echo "HTML/PDF Conversion Helper"
        echo ""
        echo "Usage:"
        echo "  $0 cv [input.html] [output.pdf]     # Convert CV to PDF"
        echo "  $0 cover [input.html] [output.pdf] # Convert cover letter to PDF"
        echo "  $0 template [cv|cover]             # Copy template to current directory"
        echo ""
        echo "Examples:"
        echo "  $0 template cv                     # Copy CV template"
        echo "  $0 cv cv.html cv.pdf              # Convert CV to PDF"
        echo "  $0 cover                          # Convert cover_letter.html to cover_letter.pdf"
        ;;
esac
