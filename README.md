# System Programming Lab: Buffered Report Builder

## 1. Learning Objectives
By the end of this lab, you should be able to:
- scan structured text safely with `fgets()` and `sscanf()`
- format aligned output with `snprintf()` and dynamic field widths
- compute summary statistics while reading a file once
- reduce stream I/O by building a full report in memory and writing it once
- produce deterministic CLI output that is easy to autograde

## 2. Story
You are maintaining a tiny reporting tool for a warehouse terminal.

The terminal exports one order per line using this format:
- `name|quantity|unit_price|category`

Your job is to read the file, scan each line into fields, build a neatly aligned report, and emit the final report with a single buffered write to `stdout`.

## 3. Repository Layout
- `src/`: starter source file with `TODO(student)` sections
- `include/`: shared constants and function prototypes
- `samples/`: static input file used by the visible grader
- `scripts/`: local check and grade hooks
- `tests/`: notes about visible and hidden checks

## 4. What You Need To Implement
Complete all `TODO(student)` sections in `src/report_buffer_lab.c`.

Required behavior:
1. read the input file with `fgets()` exactly once per physical line
2. parse each record with a width-limited `sscanf()` pattern
3. compute `total_price`, `grand_total`, `max_total`, and `longest_name`
4. build the final report string with `snprintf()` using flexible field widths
5. keep all row formatting deterministic so the visible test can compare exact output
6. do not print row-by-row from helper functions; build the report in memory and let `main()` perform the single `fwrite()`

## 5. Build
```bash
make
```

## 6. Run
```bash
./bin/report_buffer_lab samples/orders.txt
```
