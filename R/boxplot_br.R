#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
#' @title Braile on Box Plot
#' @description Create Braille-enabled Box Plot
#'
#' @param ... plot parameters as would typically be used in boxplot()
#'
#' @returns two-page .pdf file
#' @export
#'
#' @examples
#' \dontrun{
#' yale = data.frame(yaleSports)
#' boxplot_br(Height~Sport,data=yale,
#'       over="Box Plot",
#'       main="Yale Athletics Dataset",
#'       xlab="x-axis = Sport",
#'       ylab="y-axis = Height (inches)",
#'       stem="newBox")
#' }
#' @examples
#' \dontrun{
#' air = airquality
#' air$Month = as.factor(air$Month)
#' boxplot_br(Ozone~Month,data=air,
#'       lwd=2,pch=16,las=3,lty=1,
#'       over="Box Plot",
#'       main="Air Quality: NYC (1973)",
#'       xlab="x-axis = Month (numeric)",
#'       ylab="y-axis = Ozone (ppb)",
#'       stem="airBox",
#'       cex.main=1.5,
#'       cex.axis=1.5,
#'       col="chocolate1")
#' }
boxplot_br = function(...){
  # suppress warnings on plot due to unconventional arguments

  # extract the arguments for informing the boxplot
  args = list(...)

  # flag chart type
  args$chart = "boxplot"

  # extract x- and y-vectors for plotting (args$x, args$y)
  args = fn_formulaExtractr(args)

  # exchange parameter names for annotation strings (args_$m/x/y]_text)
  args=fn_annoExchange(args)

  # anticipate the plot limits (args$[x/y]lim)
  args=fn_limFindr(args)
  args$x=NULL

  # axis size (args$cex.axis)
  if (is.null(args$cex.axis)){args$cex.axis=2.5}
  if (is.null(args$col)){args$col="white"}

  # initialize a plot written to .pdf
  args=fn_plotInitializr(args)

  # plot as braille
  args$braille=TRUE
  b=suppressWarnings(do.call(graphics::boxplot,args))
  args$xtl=seq_along(b$names)
  args$xtlab=b$names
  fn_plotTickr(args)
  fn_titleMakr(args)

  # plot as text
  args$braille=FALSE
  b=suppressWarnings(do.call(graphics::boxplot,args))
  fn_plotTickr(args)
  fn_titleMakr(args)

  # close to plotting
  dev.off()
}
