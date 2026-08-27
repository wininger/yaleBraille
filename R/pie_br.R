#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
#' @title Braile on Pie Chart
#' @description Create Braille-enabled Pie Chart
#'
#' @param ... plot parameters as would typically be used in pie()
#'
#' @returns two-page .pdf file
#' @export
#'
#' @examples
#' \dontrun{
#' yale = data.frame(yaleSports)
#' tbl = table(yale$Sport)
#' pie_br(tbl,
#'        over="Pie Chart",
#'        main="Yale Athletics Dataset",
#'        xlab=" ",
#'        ylab=" ",
#'        stem="newPie")
#' }
#' @examples
#' \dontrun{
#' air = airquality
#' air$Feel = cut(air$Temp,breaks=c(0,65,80,1000),labels=c("cool","warm","hot"))
#' tbl = table(air$Feel)
#' pie_br(tbl,
#'        over="Pie Chart",
#'        main="Air Quality: NYC (1973)",
#'        xlab="",
#'        ylab="",
#'        stem="airPie",
#'        cex.main=2,
#'        cex=1)
#' }
pie_br = function(...){
  # suppress warnings on plot due to unconventional arguments

  # extract the arguments for informing the boxplot
  args = list(...)

  # flag chart type
  args$chart="pie chart"

  # extract x- and y-vectors for plotting (args$x, args$y)
  #	args = fn_vectorExtractr(args,x,y,data)

  # exchange parameter names for annotation strings (args_$m/x/y]_text)
  args=fn_annoExchange(args)

  # anticipate the plot limits (args$[x/y]lim)
  #	args=fn_limFindr(args)

  # axis size (args$cex.axis)
  if (is.null(args$cex.axis)){args$cex.axis=2.5}
  if (is.null(args$col)){args$col="white"}
  if (is.null(args$border)){args$border="black"}

  # initialize a plot written to .pdf
  args=fn_plotInitializr(args)
  # plot as braille
  args$braille=TRUE
  args$labels=sapply(names(args[[1]]),fn_toBraille)
  args$family="braillefont"
  suppressWarnings(do.call(graphics::pie,args))
  #	fn_plotTickr(args)
  fn_titleMakr(args)

  # plot as text
  args$braille=FALSE
  args$labels=names(args[[1]])
  args$family="sans"
  suppressWarnings(do.call(graphics::pie,args))
  #	fn_plotTickr(args)
  fn_titleMakr(args)

  # close to plotting
  dev.off()

}
