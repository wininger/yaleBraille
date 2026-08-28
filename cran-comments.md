## Test environments
* macOS Sequoia 15.4.1 (local), R 4.4.3
* win-builder (R-devel) — 0 errors, 0 warnings, 0 notes
* win-builder (R-release) — 0 errors, 0 warnings, 0 notes
* mac-builder (R-release, arm64) — 0 errors, 0 warnings, 0 notes
* R-hub: linux (R-devel) — 0 errors, 1 warning, 3 notes
* R-hub: macos (R-devel, x86_64) — 0 errors, 1 warning, 2 notes
* R-hub: macos (R-devel, arm64) — 0 errors, 1 warning, 2 notes
* R-hub: windows (R-devel) — 0 errors, 1 warning, 2 notes
* CRAN pre-check: windows (R-devel) — 0 errors, 0 warnings, 2 notes
* CRAN pre-check: linux (R-devel) — 0 errors, 1 warning, 2 notes

## R CMD check results
0 errors | 1 warning | 2-3 notes

### WARNING: Compiled code (all R-hub platforms)
This warning arises entirely from bundled third-party C source code from
the liblouis library (https://liblouis.io). Specifically:

1. exit() — found in liblouis/compileTranslationTable.o and
   liblouis/utils.o. These are part of liblouis's internal
   error-handling and cannot be removed without forking and maintaining
   a custom version of liblouis.

2. sprintf / __sprintf_chk — found in liblouis/compileTranslationTable.o,
   liblouis/logging.o, liblouis/metadata.o, and liblouis/utils.o.
   These are internal to liblouis and cannot be modified without
   forking the library.

3. stderr — found in liblouis/logging.o. This is liblouis's internal
   logging mechanism.

4. R_registerRoutines / R_useDynamicSymbols (Windows only) — fully
   implemented in src/init.c for the package's own callable routine
   (r_translate). The Windows checker flags the entire DLL because the
   bundled liblouis object files (compiled via SOURCES in src/Makevars)
   do not themselves call R_registerRoutines — nor should they, as they
   are internal C library code, not R-callable functions. The
   registration in init.c covers all functions exposed to R.

These warnings do not appear on win-builder or mac-builder, only on
R-hub, suggesting they may be specific to the R-hub build environment's
stricter binary scanning.

### NOTE: New submission
This is a new submission to CRAN.

### NOTE: Unable to verify current time
Transient network issue on the local checking machine; not a package
problem.

### NOTE: .github directory
Used for R-hub CI checks, listed in .Rbuildignore.

### NOTE: cran-comments.md
Standard submission file, listed in .Rbuildignore.

### NOTE: Object files in source (Linux R-hub only)
The Linux R-hub checker flags .o files found after compilation of the
bundled liblouis C sources. These are build artifacts generated during
the check itself, not pre-compiled files included in the source package.
This is confirmed by git ls-files src/liblouis/ showing only .c source
files and headers are tracked.

### CRAN pre-check fixes (resubmission)
Three issues identified in CRAN pre-check have been addressed:

1. 'liblouis' now quoted in DESCRIPTION to avoid spell-check false positive.
2. .github directory added to .Rbuildignore to exclude from tarball.
3. -Wno-format-truncation added to src/Makevars to suppress false-positive
   GCC 16 format-truncation warning in bundled liblouis source code. The
   flagged snprintf calls are already guarded by explicit length checks
   immediately preceding them.
   
## Downstream dependencies
None. This is a new submission.
