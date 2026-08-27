#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
#' @title Braile on Histogram
#' @description Create Braille-enabled Histogram
#'
#' @param ... plot parameters as would typically be used in hist()
#' @param x numerical data for summarizing in histogram
#' @param breaks number (plus one) of bins in the histogram
#'
#'
#' @returns two-page .pdf file
#' @export
#'
#' @examples
#' \dontrun{
#' yale = data.frame(yaleSports)
#' hist_br(yale$Weight,
#'         over="Histogram",
#'         main="Yale Athletics Dataset",
#'         xlab="x-axis = Bodyweight (pounds)",
#'         ylab="y-axis = Count (n athletes)",
#'         stem="newHist")
#' }
#' @examples
#' \dontrun{
#' air=airquality
#' hist_br(air$Temp,
#'        over="Histogram",
#'        main="Air Quality: NYC (1973)",
#'        xlab="x-axis = Temperature (deg)",
#'        ylab="y-axis = Count (n days)",
#'        stem="airHist",
#'        cex.main=2,
#'        cex.axis=2,
#'        col="deeppink1")
#' }
hist_br=function(x,breaks=20,...){
  # suppress warnings on plot due to unconventional arguments

  # extract the arguments for informing the boxplot
  args = list(...)

  # flag chart type
  args$chart = "hist"
  args$breaks = breaks

  # extract x- and y-vectors for plotting (args$x, args$y)
  args$y = x

  # exchange parameter names for annotation strings (args_$m/x/y]_text)
  args=fn_annoExchange(args)

  # anticipate the plot limits (args$[x/y]lim)
  args=fn_limFindr(args)

  # axis size (args$cex.axis)
  if (is.null(args$cex.axis)){args$cex.axis=2.5}
  if (is.null(args$col)){args$col="black"}
  if (is.null(args$border)){args$border="white"}


  # initialize a plot written to .pdf
  args=fn_plotInitializr(args)
  args$x=args$y
  args$y=NULL
  # plot as braille
  args$braille=TRUE
  suppressWarnings(do.call(graphics::hist,args))
  axis(1,labels=FALSE)
  axis(2,labels=FALSE)
  fn_plotTickr(args)
  fn_titleMakr(args)

  # plot as text
  args$braille=FALSE
  suppressWarnings(do.call(graphics::hist,args))
  axis(1,labels=FALSE)
  axis(2,labels=FALSE)
  fn_plotTickr(args)
  fn_titleMakr(args)

  # close to plotting
  dev.off()

}
