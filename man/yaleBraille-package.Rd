\name{yaleBraille-package}
\alias{yaleBraille-package}
\alias{yaleBraille}
\docType{package}
\title{
  Data visualization tools for low-vision and blind end-users
}
\description{
  This package provides plotting functions similar to those found in Base R, but with `_br` suffixes, indicating Braille-functionality. These functions deliver as output a two-page .pdf file: first page is a braille-annotated graph; second page is the text-based graph. Coding occurs via conventional syntax (i.e. text); translation is executed by the liblouis package. Graphical standards are adapted to facilitate printing onto swell-paper.
}
%\details{
%  This section should provide a more detailed overview of how to use the
%  package, including the most important functions.
%}
\author{
Mike Wininger, michael.wininger@yale.edu
}
\references{
  None
}
\keyword{ package, accessibility, vision, graphics, visualization, braille, blind, biostatistcs, biostats}
\examples{
  \dontrun{
     data(yaleSports)
     fn_toBraille(yaleSports$Sport[1])
     plot_br(Weight~Height,data=yaleSports)
  }
  \dontrun{
    ?yaleBraille
    # or
    help(package = "yaleBraille")
  }
}
