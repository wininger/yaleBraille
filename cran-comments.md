## Resubmission

This is a resubmission. Per feedback from CRAN (Uwe Ligges), 
'liblouis' is now single-quoted in the Description field.

## Summary

This is a bug-fix release (0.2.2 -> 0.2.3). It removes an `on.exit()` 
call that was inadvertently corrupting plot output. No new features 
were added and no exported function signatures were changed.

## Test environments

* local macOS, R 4.4.3 (R CMD check --as-cran): 0 errors | 0 warnings | 1 note
* R-hub v2 (via GitHub Actions): Linux, macOS, macOS (arm64), Windows -- 
  all passed with no errors or warnings

## R CMD check results

0 errors | 0 warnings | 1 note

* checking for future file timestamps ... NOTE
  unable to verify current time

  This NOTE is a known, environment-related false positive caused by 
  an external time-verification service and is unrelated to the 
  package code.

## Downstream dependencies

This package has no reverse dependencies on CRAN 
(confirmed via tools::package_dependencies("yaleBraille", reverse = TRUE)).

## Additional notes

This is a backward-compatible bug fix; no breaking changes to the API.
