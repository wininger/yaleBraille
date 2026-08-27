#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
# this helper function annotates axes on charts
# called by fn_plotTickr
fn_axisMakr=function(a,xLas=3,yLas=1){
  # ~~ set the font family
  f=ifelse(a$braille,"braillefont","sans")
  # ~~ imprint the horizontal axis
  axis(side 		= 1,
       at     		= a$xtl,
       labels 		= a$xtlab,
       las    		= xLas,
       lwd    		= 3,
       lwd.ticks	= 3,
       cex.axis	= a$cex.axis,
       font			= 2,
       family		= f)
  # ~~ imprint the vertical axis
  axis(side 		= 2,
       at     		= a$ytl,
       labels 		= a$ytlab,
       las    		= yLas,
       lwd    		= 3,
       lwd.ticks	= 3,
       cex.axis	= a$cex.axis,
       font			= 2,
       family		= f)
}
