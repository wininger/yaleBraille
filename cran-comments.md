## Test environments
* macOS Sequoia 15.4.1 (local), R 4.4.3
* win-builder (R-devel) — 0 errors, 0 warnings, 0 notes
* win-builder (R-release) — 0 errors, 0 warnings, 0 notes
* mac-builder (R-release, arm64) — 0 errors, 0 warnings, 0 notes

## R CMD check results
0 errors | 1 warning | 2 notes

## Regarding the compiled code WARNING (sprintf, stderr, exit):
These calls originate exclusively from the bundled liblouis C library
(https://liblouis.io), a well-established open-source braille
translation library maintained independently of this package.
They are not called from any package R or wrapper C code.
Replacing these calls with R-safe equivalents is planned for a
future release.

## Regarding NOTE: unable to verify current time
This is a transient network issue on the local checking machine
and does not reflect a package problem.

## Regarding NOTE: non-standard top-level file 'cran-comments.md'
This file is intentionally included per CRAN submission conventions
to communicate check results and notes to reviewers.

## Downstream dependencies
None. This is a new submission.
