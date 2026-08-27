#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
# this helper function prepares x- and y-data for plotting
# called by plotting functions
fn_vectorExtractr=function(a,x,y=NULL,data=NULL){
  # ~~ if formula: extract x- and y vectors
  if (inherits(x, "formula")) {
    y = data[[all.vars(x)[1]]]
    x = data[[all.vars(x)[2]]]
    df=na.omit(data.frame(x,y))
    a$x = df$x
    a$y = df$y
    # ~~ if vectors: extract and prepare for plotting
  }else{
    if (!is.null(y)){
      df = na.omit(data.frame(x,y))
      a$x = df$x
      a$y = df$y
    }else{
      a$y = na.omit(x)
      a$x = 1:length(a$y)
    }
  }
  # ~~ return updated arguments set
  return(a)
}
