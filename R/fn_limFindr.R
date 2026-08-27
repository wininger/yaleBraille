#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
# this helper function provides optimized tick parameters
# called by plotting functions
fn_limFindr=function(a){
  # ~~ histograms: prepare axes based on demo plot
  if (a$chart=="hist"){
    h = hist(a$y,breaks=a$breaks,plot=FALSE)
    a$xtl = pretty(h$mids)
    a$xlim = range(a$xtl)
    a$ytl = pretty(c(h$counts,0))
    a$ylim = range(a$ytl)
    # ~~ barplots: prepare axes based on demo plot
  }else if (a$chart=="barplot"){
    b = barplot(a[[1]],plot=FALSE)
    a$xtl = b
    a$xlim = range(a$xtl)+c(-1,1)
    a$ytl = pretty(c(max(a[[1]]),0))
    a$ylim = range(a$ytl)
    # ~~ numerical plots: prepare axes based on data properties
  }else{
    if (is.numeric(a$x) || is.integer(a$x)){
      a$xtl = pretty(a$x)
      a$xlim = range(a$xtl)
    }
    a$ytl = pretty(a$y)
    a$ylim = range(a$ytl)
  }
  # ~~ return updated arguments set
  return(a)
}
