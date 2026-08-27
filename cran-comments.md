## Test environments
* macOS Sequoia 15.4.1 (local), R 4.4.3
* win-builder (R-devel)

## R CMD check results
0 errors | 1 warning | 3 notes

## Regarding the compiled code WARNING (sprintf, stderr, exit):
These calls originate from the bundled liblouis C library 
(https://liblouis.io), a well-established open-source braille 
translation library maintained independently of this package. 
Replacing these calls with R-safe equivalents is planned for 
a future release.

## Regarding NOTE: unable to verify current time
This appears to be a network issue on the checking system,
not a package issue.

## Regarding NOTE: data-raw at top level
This directory contains raw data processing scripts and is
excluded from the built package via .Rbuildignore.

## Regarding NOTE: .o object files in src/liblouis/
These are intermediate build artifacts from compiling the bundled 
liblouis C library. They are generated during package installation 
and are not intentionally distributed. We are unable to exclude them 
via .Rbuildignore as they reside within src/. This is a known 
limitation when bundling C libraries and does not affect package 
functionality or safety.


## Downstream dependencies
None. This is a new submission.
