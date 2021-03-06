\name{plot.predict.gradientForest}
\alias{plot.predict.gradientForest}
\alias{plot.predict.combinedGradientForest}

\title{
Plot a \code{gradientForest} prediction in geographical space
}
\description{
Plot method for \code{\link{predict.gradientForest}} and 
\code{\link{predict.combinedGradientForest}} objects. A colour representation of 
the biologically transformed space is plotted on geographical space. 
}
\usage{
\method{plot}{predict.gradientForest}(x, X, Y, palette = "rg", col3 = 127, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
an object of class \code{predict.gradientForest} generated by \code{\link{predict.gradientForest}} 
or \code{\link{predict.combinedGradientForest}} 
}
  \item{X}{
vector of positions in the X direction, having same length as \code{nrow(x)}
}
  \item{Y}{
vector of positions in the X direction, having same length as \code{nrow(x)}
}
  \item{palette}{
controls the colour key of the map. 
}
  \item{col3}{
controls the amount (\code{0-255}) of the third colour in the palette. By default there is no \code{blue}.
}
  \item{\dots}{further arguments passed to or from other methods.}
}

\details{
The first and second principal components of \code{x} are plotted on \code{X} and \code{Y} as a
colour, with, by default (\code{palette="rg"}), the red component proportional to the first PC
and green proportional to the second PC. Other choices of \code{palette},
are: \code{"gr"}, \code{"br"}, \code{"rb"}, \code{"bg"} and \code{"gb"}. 
}
\value{
The command is used for its side-effect of generating a plot  
}
\references{
Ellis, N., Smith, S.J., and Pitcher, C.R. (2012). Gradient Forests: calculating importance
gradients on physical predictors. \emph{Ecology}, \bold{93}, 156--168.}
\author{
N. Ellis, CSIRO, Cleveland, Australia. <Nick.Ellis@csiro.au>
}

\seealso{
\code{\link{predict.gradientForest}}, \code{\link{gradientForest}}
}
\examples{
data(GBRexample)

# transform the predictors using predict() on a fine-scale grid
predictors <- names(importance(gf.GBR))
gf.pred <- predict(gf.GBR, Phys_grid[,predictors])
plot(gf.pred, Phys_grid[,c("EAST")], Phys_grid[,c("NORTH")], asp=1, palette="gr", pch=15, 
main="Biological composition in Far North Great Barrier Reef")

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ methods }
\keyword{ hplot }% __ONLY ONE__ keyword per line
