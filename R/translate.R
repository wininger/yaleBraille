#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
#' Translate text to Braille
#'
#' @param text A character string to translate.
#' @param table The Braille table to use (e.g., "en-ueb-g2.ctb").
#' @return A character string of translated Braille.
#' @export
translateToBraille <- function(text, table) {
  # Resolves to correct path on ANY machine at runtime
  tables_dir <- system.file("tables", package = "yaleBraille")
  full_table_path <- file.path(tables_dir, table)
  .Call("r_translate", text, full_table_path)
}
