#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
# this helper re-configures titles and labels for plotting
# called by plotting functions
fn_annoExchange=function(a){
  # ~~ empty strings
  if (is.null(a$over)){a$over = a$chart}
  if (is.null(a$main)){a$main=""}
  if (is.null(a$xlab)){a$xlab=""}
  if (is.null(a$ylab)){a$ylab=""}
  # ~~ extract label annotations for separate incorporation
  a$m_text = a$main
  a$x_text = a$xlab
  a$y_text = a$ylab
  # ~~ turn off annotations for clean plotting
  a$main = ""
  a$xlab = ""
  a$ylab = ""
  a$xaxt = "n"
  a$yaxt = "n"
  # ~~ return updated arguments set
  return(a)
}
