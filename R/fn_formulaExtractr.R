#' @useDynLib yaleBraille, .registration=TRUE
NULL
#'
# this helper function extracts x- and y-values from formulae
# called by plotting functions
fn_formulaExtractr=function(a){
  # ~~ extract the factors in the model
  f  = a[[1]]
  # ~~ extract the data-frame
  df = a[[2]]
  # ~~  reconstruct the model
  mf = model.frame(f, data = a$data, na.action = na.omit)
  # ~~ extract as y- and x values
  a$y = mf[[1]]
  a$x = mf[[2]]
  # ~~ return updated arguments set
  return(a)
}
