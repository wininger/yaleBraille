#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
#'
#' @title Braile on Scatter or Line Plots
#' @description Create Braille-enabled Scatter or Line Plot
#' @param ... plot parameters as would typically be used in plot()
#' @param x variable for plotting (independent variable, if y is not NULL)
#' @param y dependent variable for plotting
#' @param data data-frame in case formula argument utilized
#'
#' @returns two-page .pdf file
#' @export
#'
#' @examples
#' \dontrun{
#' yale = data.frame(yaleSports)
#' plot_br(Weight~Height,data=yale,
#'         over="Scatter Plot",
#'         main="Yale Athletics Dataset",
#'         xlab="x-axis = Height (inches)",
#'         ylab="y-axis = Weight (pounds)",
#'         stem="plotScatter")
#' }
#' @examples
#' \dontrun{
#' yale = data(yaleSports)
#' plot_br(sort(yale$Weight[1:20]),
#'         over="Scatter Plot",
#'         main="Yale Athletics Dataset",
#'         xlab="Athlete (sorted)",
#'         ylab="y-axis = Weight (pounds)",
#'         type="b",
#'         stem="plotLine")
#' }
#' @examples
#' \dontrun{
#' air = airquality
#' plot_br(air$Temp,air$Ozone,
#'         over="Scatter Plot",
#'         main="Air Quality: NYC (1973)",
#'         xlab="x-axis = Temperature (deg)",
#'         ylab="y-axis = Ozone (ppb)",
#'         stem="airPlot",
#'         cex.main=1.5,
#'         cex.axis=1.5,
#'         col="red",
#'         pch=16)
#' }
plot_br=function(x,y=NULL,data=NULL,...){
  # suppress warnings on plot due to unconventional arguments

  # extract the arguments for informing the boxplot
  args = list(...)

  # flag chart type
  if (is.null(args$type) || args$type=="p"){
    args$chart = "scatter plot"
  }else if (args$type=="l" || args$type=="b"){
    args$chart = "line plot"
  }else{
    args$chart = "generic plot"
  }


  # extract x- and y-vectors for plotting (args$x, args$y)
  args = fn_vectorExtractr(args,x,y,data)

  # exchange parameter names for annotation strings (args_$m/x/y]_text)
  args=fn_annoExchange(args)

  # anticipate the plot limits (args$[x/y]lim)
  args=fn_limFindr(args)

  # axis size (args$cex.axis)
  if (is.null(args$cex.axis)){args$cex.axis=2.5}

  # initialize a plot written to .pdf
  args=fn_plotInitializr(args)

  # plot as braille
  args$braille=TRUE
  suppressWarnings(do.call(graphics::plot,args))
  fn_plotTickr(args)
  fn_titleMakr(args)

  # plot as text
  args$braille=FALSE
  suppressWarnings(do.call(graphics::plot,args))
  fn_plotTickr(args)
  fn_titleMakr(args)

  # close to plotting
  dev.off()
}
