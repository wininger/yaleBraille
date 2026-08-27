#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
# this helper function prepares a .pdf file for plotting
# called by plotting functions
fn_plotInitializr=function(a){
  # ~~ plotting parameters
  if (is.null(a$cex.main)){a$cex.main=2}
  if (is.null(a$cex)){a$cex=2}
  if (is.null(a$pch)){a$pch=16}
  if (is.null(a$col)){a$col="black"}
  if (is.null(a$lwd)){a$lwd=5}

#  # ~~ ensure braille font is enabled
  #font_path = "/System/Library/Fonts/Apple Symbols.ttf"
  #sysfonts::font_add("braillefont", regular = font_path)
  #showtext::showtext_auto()
  font_path <- system.file("fonts", "Swell-Braille.ttf", package = "yaleBraille")
  sysfonts::font_add("braillefont", regular = font_path)
  showtext::showtext_auto()
  # ~~ open a .pdf for plotting, and set margins
  writename = paste0(a$dir,a$stem,".pdf")
  pdf(writename, width=8.5, height=11)
  par(mai = c(3.5, 2, 3, 1), xpd = NA,lwd=3)

  # ~~ return updated arguments set
  return(a)
}
