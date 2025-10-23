# Task 2: File Processing Diagram with Conditional Logic

Last updated: 2025-10-23T07:31:43+03:00

**Prepared for**: Elektrum Eesti OÜ - IT Projektijuht Position

**Date**: October 23, 2025

**Author**: Mihkel Putrinš

---

## 1. Process Overview

### 1.1 Business Context

Elektrum receives files from external partners containing customer data in multiple columns. The system must read these files, apply conditional logic to determine which column value to use, and enter the selected value into the portal system.

### 1.2 Processing Rules

The file contains 4 columns per row:

- **Column 1**: Primary identifier (length can be 10 or 11 characters)
- **Column 2**: Secondary value (used when Column 3 is empty)
- **Column 3**: Optional field (may be empty)
- **Column 4**: Alternative value (used when Column 1 has 11 characters)

**Conditional Logic**:

1. **Priority 1 - Column 3 Check**:
   - IF Column 3 is empty → Use Column 2 value only
   - IF Column 3 has data → Continue to next check

2. **Priority 2 - Column 1 Length Check** (only if Column 3 has data):
   - IF Column 1 length = 10 characters → Use Column 1 value
   - IF Column 1 length = 11 characters → Use Column 4 value

---

## 2. Process Diagram Description

### 2.1 Flowchart Structure

The process follows standard flowchart notation with these symbol types:

- **Oval**: Start/End points
- **Rectangle**: Process/Action steps
- **Diamond**: Decision points (conditional branches)
- **Parallelogram**: Input/Output operations
- **Arrow**: Flow direction

### 2.2 Detailed Flow

```text
┌─────────────────┐
│      START      │
└────────┬────────┘
         │
         ▼
    ┌─────────────────────┐
    │  Read Partner File  │
    └──────────┬──────────┘
               │
               ▼
        ┌──────────────┐
        │ File Exists? │◄───────┐
        └──┬────────┬──┘         │
           │ No     │ Yes        │
           │        │            │
           ▼        ▼            │
    ┌──────────┐  ┌────────────────────┐
    │   Error  │  │ Initialize Row = 1 │
    │   Exit   │  └─────────┬──────────┘
    └──────────┘            │
                            ▼
                    ┌──────────────────┐
                    │   More Rows in   │
                    │      File?       │◄──────────────┐
                    └───┬──────────┬───┘               │
                        │ No       │ Yes               │
                        │          │                   │
                        ▼          ▼                   │
                 ┌──────────┐  ┌──────────────────┐   │
                 │ Close    │  │ Read Columns:    │   │
                 │ File     │  │ 1, 2, 3, 4       │   │
                 └────┬─────┘  └────────┬─────────┘   │
                      │                 │              │
                      ▼                 ▼              │
               ┌──────────┐      ┌─────────────────┐  │
               │   END    │      │  Column 3       │  │
               └──────────┘      │    Empty?       │  │
                                 └──┬───────────┬──┘  │
                                    │ Yes       │ No  │
                                    │           │     │
                                    ▼           ▼     │
                            ┌──────────────┐  ┌──────────────────┐
                            │ Use Column 2 │  │  Column 1        │
                            │    Value     │  │  Length = 10?    │
                            └──────┬───────┘  └──┬───────────┬───┘
                                   │             │ Yes       │ No (=11)
                                   │             │           │
                                   │             ▼           ▼
                                   │      ┌──────────────┐  ┌──────────────┐
                                   │      │ Use Column 1 │  │ Use Column 4 │
                                   │      │    Value     │  │    Value     │
                                   │      └──────┬───────┘  └──────┬───────┘
                                   │             │                 │
                                   └─────────────┼─────────────────┘
                                                 │
                                                 ▼
                                        ┌─────────────────┐
                                        │ Enter Selected  │
                                        │ Value to Portal │
                                        └────────┬────────┘
                                                 │
                                                 ▼
                                        ┌─────────────────┐
                                        │ Increment Row   │
                                        │   Counter       │
                                        └────────┬────────┘
                                                 │
                                                 └────────────────┘
                                                 (Loop back to "More Rows?")
```

---

## 3. Logic Walkthrough

### 3.1 Step-by-Step Process

#### Step 1: Initialization

1. Process starts
2. System attempts to read partner file
3. IF file doesn't exist → Error handling → Exit
4. IF file exists → Continue to Step 2

#### Step 2: Loop Setup

1. Initialize row counter (Row = 1)
2. Begin processing loop

#### Step 3: Row Processing (Loop)

1. Check: Are there more rows in the file?
   - IF No rows left → Jump to Step 7 (Cleanup)
   - IF Yes → Continue to Step 4

#### Step 4: Data Reading

1. Read values from current row:
   - Column 1 value
   - Column 2 value
   - Column 3 value
   - Column 4 value

#### Step 5: Decision Tree (Conditional Logic)

1. **First Decision**: Is Column 3 empty?
   - **Branch A (Column 3 is Empty)**:
     - Use Column 2 value
     - Jump to Step 6 (Portal Entry)
   - **Branch B (Column 3 has Data)**:
     - Continue to Second Decision

2. **Second Decision** (only if Branch B): What is Column 1 length?
   - **Branch B1 (Column 1 = 10 characters)**:
     - Use Column 1 value
     - Jump to Step 6 (Portal Entry)
   - **Branch B2 (Column 1 = 11 characters)**:
     - Use Column 4 value
     - Jump to Step 6 (Portal Entry)

#### Step 6: Portal Entry

1. Enter the selected value to portal system
2. Increment row counter (Row = Row + 1)
3. Loop back to Step 3 (Check for more rows)

#### Step 7: Cleanup

1. Close file
2. Process ends

---

## 4. Example Scenarios

### Scenario 1: Column 3 is Empty

**Input Row**:

- Column 1: "1234567890" (10 chars)
- Column 2: "VALUE_B"
- Column 3: "" (empty)
- Column 4: "VALUE_D"

**Decision Path**:

1. Column 3 empty? → YES
2. Use Column 2 value

**Result**: "VALUE_B" entered to portal

---

### Scenario 2: Column 3 Has Data, Column 1 = 10 Characters

**Input Row**:

- Column 1: "ABCDEFGHIJ" (10 chars)
- Column 2: "VALUE_B"
- Column 3: "VALUE_C" (not empty)
- Column 4: "VALUE_D"

**Decision Path**:

1. Column 3 empty? → NO
2. Column 1 length = 10? → YES
3. Use Column 1 value

**Result**: "ABCDEFGHIJ" entered to portal

---

### Scenario 3: Column 3 Has Data, Column 1 = 11 Characters

**Input Row**:

- Column 1: "ABCDEFGHIJK" (11 chars)
- Column 2: "VALUE_B"
- Column 3: "VALUE_C" (not empty)
- Column 4: "VALUE_D"

**Decision Path**:

1. Column 3 empty? → NO
2. Column 1 length = 10? → NO (it's 11)
3. Use Column 4 value

**Result**: "VALUE_D" entered to portal

---

### Scenario 4: Multiple Rows Processing

**Input File**:

```text
Row 1: "1234567890", "VAL_B1", "",        "VAL_D1"
Row 2: "ABCDEFGHIJ", "VAL_B2", "VAL_C2",  "VAL_D2"
Row 3: "ABCDEFGHIJK","VAL_B3", "VAL_C3",  "VAL_D3"
Row 4: "1234567890", "VAL_B4", "VAL_C4",  "VAL_D4"
```

**Processing**:

- Row 1: Column 3 empty → Use "VAL_B1"
- Row 2: Column 3 has data, Column 1 = 10 → Use "ABCDEFGHIJ"
- Row 3: Column 3 has data, Column 1 = 11 → Use "VAL_D3"
- Row 4: Column 3 has data, Column 1 = 10 → Use "1234567890"

**Portal Entries**: "VAL_B1", "ABCDEFGHIJ", "VAL_D3", "1234567890" (in order)

---

## 5. Error Handling

### 5.1 Potential Error Scenarios

1. **File Not Found**
   - Check: File exists before processing
   - Action: Log error, notify administrator, exit gracefully

2. **Empty File**
   - Check: File has at least one row
   - Action: Log warning, exit (no data to process)

3. **Missing Columns**
   - Check: Each row has exactly 4 columns
   - Action: Log error with row number, skip row, continue processing

4. **Invalid Column 1 Length**
   - Check: Column 1 length is either 10 or 11 (not other values)
   - Action: If not 10 or 11, treat as error, skip row, log issue

5. **Portal Entry Failure**
   - Check: Portal API returns success
   - Action: If failure, retry 3 times, then log error and continue (or halt, depending on business requirements)

### 5.2 Enhanced Flowchart with Error Handling

To make the process more robust, consider adding error handling branches:

- After "Read Partner File": IF file read fails → Log error → Exit
- After "Read Columns": IF row has != 4 columns → Log error → Skip row → Continue loop
- After "Column 1 Length Check": IF length != 10 AND != 11 → Log error → Skip row → Continue loop
- After "Enter to Portal": IF portal entry fails → Retry 3x → IF still fails → Log error → Continue loop (or halt)

---

## 6. Implementation Considerations

### 6.1 Performance

- **Large Files**: If files contain thousands/millions of rows, consider batch processing or parallel processing
- **Portal API Rate Limits**: Check if portal has rate limits; if so, add throttling between entries
- **Memory Usage**: Stream file reading (row-by-row) rather than loading entire file into memory

### 6.2 Monitoring & Logging

- **Metrics to Track**:
  - Total rows processed
  - Rows using Column 2 (Column 3 empty)
  - Rows using Column 1 (Column 3 data, length 10)
  - Rows using Column 4 (Column 3 data, length 11)
  - Errors encountered (by type)
  - Processing time per file

- **Logging**:
  - Log start/end of each file processing
  - Log errors with row numbers for troubleshooting
  - Log summary statistics after each file

### 6.3 Validation

- **Pre-Processing Validation**:
  - File format check (CSV, TSV, fixed-width?)
  - Column count validation
  - Column 1 format validation (alphanumeric only?)
  
- **Post-Processing Validation**:
  - Compare rows processed vs rows in file (ensure none skipped unintentionally)
  - Verify portal entries match expected count
  - Alert if error rate exceeds threshold (e.g., >5% error rate)

---

## 7. Visual Diagram Creation Guide

### 7.1 Recommended Tools

- **draw.io** (free, web-based): <https://app.diagrams.net/>
- **Lucidchart** (free tier available): <https://www.lucidchart.com/>
- **Microsoft Visio** (if available)
- **PlantUML** (code-based, for developers)

### 7.2 Diagram Layout Suggestions

**Vertical Flow** (Top to Bottom):

- Start at top
- Flow downward for main path
- Branch left/right for decision paths
- Rejoin main path after branches
- End at bottom

**Symbols to Use**:

- Oval: START, END, Error Exit
- Rectangle: Read File, Read Columns, Enter to Portal, Increment Counter
- Diamond: File Exists?, More Rows?, Column 3 Empty?, Column 1 Length = 10?
- Parallelogram: Output error messages

**Color Coding** (Optional):

- Green: Happy path (successful processing)
- Red: Error paths
- Yellow: Decision points
- Blue: Input/Output operations

### 7.3 Diagram Size & Export

- **Size**: A4 portrait or landscape (ensure readable when printed)
- **Font**: Minimum 10pt for labels
- **Export Format**: PNG (high resolution, 300 DPI) or PDF
- **File Name**: `task2_file_processing_diagram.png` or `.pdf`

---

## 8. Conclusion

This file processing workflow demonstrates:

1. **Loop Structure**: Iterating through all rows in the file
2. **Conditional Branches**: Two decision points (Column 3 empty check, Column 1 length check)
3. **Clear Logic Flow**: Easy to follow, understand, and implement
4. **Error Handling**: Robust handling of edge cases (file not found, invalid data)
5. **Professional Documentation**: Detailed explanation supports diagram for complete understanding

The process ensures that partner data is correctly interpreted and entered into the portal based on business rules, with appropriate error handling for production robustness.

---

## 9. Next Steps

1. Create visual diagram using draw.io or similar tool
2. Follow the flowchart structure described in Section 2.2
3. Include all decision points and branches
4. Add clear labels to all symbols
5. Export as high-resolution image (PNG) or PDF
6. Review diagram against business rules to ensure correctness
7. Include diagram in final submission along with this documentation

---

**Document Version**: 1.0

**Date**: October 23, 2025

**Author**: Mihkel Putrinš

**Status**: Ready for Diagram Creation
