## Resubmission (v0.2.2)

This is a resubmission addressing issues raised in the second CRAN review.

### Changes made:

1. **\dontrun{} -> \donttest{}**
   - Replaced remaining \dontrun{} with \donttest{} in
     man/yaleBraille-package.Rd

2. **References in DESCRIPTION**
   - Added GitHub URL to Description field:
     <https://github.com/wininger/yaleBraille>
   - No formal publication exists yet for this package

3. **Fixed example in man/yaleBraille-package.Rd**
   - Corrected function name from fn_toBraille() to translateToBraille()
   - Added required table argument to translateToBraille() call
   - Removed \references{None} entry
   - Fixed escaped underscore in description text

## Test environments
- macOS aarch64 (local), R 4.4.3
- win-builder: R-release, R-devel, R-oldrelease
- r-hub: linux (R-devel), macos-arm64 (R-devel), windows (R-devel)

## R CMD check results
0 errors | 0 warnings | 1 note

* checking for future file timestamps: unable to verify current time
  - This is a local network issue and does not occur on CRAN servers

