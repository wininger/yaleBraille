#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
# this helper function prepares labels for axis ticks
# called by plotting functions
fn_plotTickr=function(a){
  # ~~ if x-labels already known (boxplot, barplot): enforce character
  if (is.null(a$xtlab)){a$xtlab = as.character(a$xtl)}
  # ~~ y-labels will always be numeric; enforce character
  a$ytlab = as.character(a$ytl)
  # ~~ translate to braille
  if (a$braille){
    a$xtlab = sapply(a$xtlab,fn_toBraille)
    a$ytlab = sapply(a$ytlab,fn_toBraille)
  }
  # ~~ imprint the axes
  fn_axisMakr(a,3,1)
  # ~~ grid lines
  #	if (a$ygrid){grid(nx = NA, ny = NULL, lty = 2, lwd = 1)}

}
