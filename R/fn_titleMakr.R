#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
# this helper function annotates all labels as titles onto charts
# called by plotting functions
fn_titleMakr = function(a){
  # ~~ set the font family
  f = ifelse(a$braille,"braillefont","sans")
  # ~~ extract the main title, x-label and y-label
  o = ifelse(a$braille,fn_toBraille(a$over),a$over)
  m = ifelse(a$braille,fn_toBraille(a$m_text),a$m_text)
  x = ifelse(a$braille,fn_toBraille(a$x_text),a$x_text)
  y = ifelse(a$braille,fn_toBraille(a$y_text),a$y_text)
  # ~~ imprint the title texts
  mtext(o, side = 3, line= 7.5, family = f, cex = a$cex.main)
  mtext(m, side = 3, line= 5.5, family = f, cex = a$cex.main)
  mtext(x, side = 3, line= 3.5, family = f, cex = a$cex.main)
  mtext(y, side = 3, line= 1.5, family = f, cex = a$cex.main)
}
