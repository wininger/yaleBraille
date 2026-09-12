## Resubmission (v0.2.1)

This is a resubmission addressing all issues raised in the CRAN review.

### Changes made:

1. **Compiled code warnings (sprintf, stderr, exit)**
   - Replaced `vfprintf(stderr,...)` in `logging.c` with `REvprintf()` 
   - Replaced `exit()` in `utils.c` with R's `error()`
   - Added `-D_FORTIFY_SOURCE=0` to `PKG_CFLAGS` in `src/Makevars` to 
     suppress GCC's automatic `sprintf` -> `__sprintf_chk` substitution

2. **Examples**
   - Replaced `\dontrun{}` with `\donttest{}` in all 5 plotting functions
   - Fixed `data(yaleSports)` -> `data.frame(yaleSports)` in `plot_br.R`
   - Consolidated multiple `@examples` blocks into single blocks

3. **Graphics parameter restore**
   - Added `oldpar <- par(no.readonly = TRUE)` and `on.exit(par(oldpar))`
     in `fn_plotInitializr()`

4. **Output files**
   - PDF output now defaults to `tempdir()` instead of working directory

5. **DESCRIPTION**
   - Added liblouis contributors as `ctb/cph` in `Authors@R`
   - Removed `| file LICENSE` from License field
   - Removed `LICENSE` file

## Test environments

- macOS aarch64 (local), R 4.4.3
- r-hub: linux (R-devel), macos x86 (R-devel), macos-arm64 (R-devel), 
  windows (R-devel)
- win-builder: R-release, R-devel, R-oldrelease

## R CMD check results

0 errors | 0 warnings | 1 note

* checking for future file timestamps: unable to verify current time
  (network issue on check server, not package-related)

