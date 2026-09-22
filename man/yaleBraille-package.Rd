\name{yaleBraille-package}
\alias{yaleBraille-package}
\alias{yaleBraille}
\docType{package}
\title{
  Data visualization tools for low-vision and blind end-users
}
\description{
  This package provides plotting functions similar to those found in Base R,
  but with _br suffixes, indicating Braille-functionality. These functions
  deliver as output a two-page .pdf file: first page is a braille-annotated
  graph; second page is the text-based graph. Coding occurs via conventional
  syntax (i.e. text); translation is executed by the liblouis package.
  Graphical standards are adapted to facilitate printing onto swell-paper.
  For more information see <https://github.com/wininger/yaleBraille>.
}
\author{
Mike Wininger, michael.wininger@yale.edu
}
\keyword{package}
\keyword{accessibility}
\keyword{graphics}
\examples{
  \donttest{
    library(yaleBraille)
    data(yaleSports)
    translateToBraille(yaleSports$Sport[1], table = "en-ueb-g2.ctb")
    plot_br(Weight~Height, data=yaleSports)
  }
}
