## Test environments
* macOS Sequoia 15.4.1 (local), R 4.4.3
* win-builder (R-devel) — 0 errors, 0 warnings, 0 notes
* win-builder (R-release) — 0 errors, 0 warnings, 0 notes
* mac-builder (R-release, arm64) — 0 errors, 0 warnings, 0 notes
* Windows Server 2022, R-devel (R-hub v2) — 0 errors, 1 warning, 2 notes

## R CMD check results
0 errors | 1 warning | 2 notes

### WARNING: Compiled code (R-hub Windows only)
The warning arises entirely from bundled third-party C source code from
the liblouis library (https://liblouis.io). Specifically:

1. The exit() calls in liblouis/compileTranslationTable.o and
   liblouis/utils.o are part of liblouis's internal error-handling.
   Modifying these would require forking liblouis and maintaining a
   custom version, creating a significant long-term maintenance burden
   and risk of divergence from the upstream library.

2. R_registerRoutines() and R_useDynamicSymbols() are already
   implemented in src/init.c for the package's own routines. The
   warning about their absence refers to the liblouis object files,
   which are a bundled external library and not part of the package's
   own native routine interface.

This warning does not appear on win-builder (R-devel or R-release) or
mac-builder, suggesting it may be specific to the R-hub build environment.

### NOTE: New submission
This is a new submission to CRAN.

### NOTE: Unable to verify current time
Transient network issue on the local checking machine; not a package problem.

## NOTEs
* .github directory: used for R-hub CI checks, not part of the package
* cran-comments.md: standard submission file, not part of the package

## Downstream dependencies
None. This is a new submission.
