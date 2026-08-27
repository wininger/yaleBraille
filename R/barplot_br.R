#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
#' @title Braile on Bar Plot
#' @description Create Braille-enabled Bar Plot
#'
#' @param ... plot parameters as would typically be used in barplot()
#'
#' @returns two-page .pdf file
#' @export
#'
#' @examples
#' \dontrun{
#' yale = data.frame(yaleSports)
#' tbl = table(yale$Sport)
#' barplot_br(tbl,
#'            over="Bar Chart",
#'            main="Yale Athletics Dataset",
#'            xlab="x-axis = Sport",
#'            ylab="y-axis = Count (n athletes)",
#'            stem="newBar")
#' }
#' @examples
#' \dontrun{
#' air = airquality
#' air$Feel = cut(air$Temp,breaks=c(0,65,80,1000),labels=c("cool","warm","hot"))
#' tbl = table(air$Feel)
#' barplot_br(tbl,
#'            over="Bar Chart",
#'            main="Air Quality: NYC (1973)",
#'            xlab="x-axis = Temperature Feel",
#'            ylab="y-axis = Count (n days)",
#'            stem="airBar",
#'            cex.main=1.5,
#'            cex.axis=3.5,
#'            col="purple")
#' }
barplot_br = function(...){
  # suppress warnings on plot due to unconventional arguments

  # extract the arguments for informing the boxplot
  args = list(...)

  # flag chart type
  args$chart="barplot"

  # extract x- and y-vectors for plotting (args$x, args$y)
  #	args = fn_vectorExtractr(args,x,y,data)

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
  # plot as braille
  args$braille=TRUE
  args$xtlab=names(args[[1]])
  suppressWarnings(do.call(graphics::barplot,args))
  axis(2,labels=FALSE)
  fn_plotTickr(args)
  fn_titleMakr(args)

  # plot as text
  args$braille=FALSE
  suppressWarnings(do.call(graphics::barplot,args))
  axis(2,labels=FALSE)
  fn_plotTickr(args)
  fn_titleMakr(args)

  # close to plotting
  dev.off()

}
