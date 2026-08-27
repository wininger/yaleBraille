#' @importFrom grDevices dev.off pdf
#' @importFrom graphics axis barplot hist mtext par
#' @importFrom stats model.frame na.omit
#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
# this helper function converts text into braille
# called by multiple functions
fn_toBraille = function(text, table="en-ueb-g2.ctb"){
  # Resolves to correct path on ANY machine at runtime
  tables_dir = system.file("tables", package = "yaleBraille")
  full_table_path = file.path(tables_dir, table)
  .Call("r_translate", text, full_table_path)
}
