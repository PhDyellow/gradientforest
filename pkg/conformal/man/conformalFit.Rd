\name{conformalFit}
\alias{conformalFit}
\title{Conformal mapping}
\description{
Solve the Schwartz-Christoffel equations for transforming a polygon plus point 
to the unit circle plus origin.
}
\usage{
conformalFit(xypoly, wc = c(mean(xypoly$x), mean(xypoly$y)), nptsq = 12)
}
\arguments{
  \item{xypoly}{a list with components named `x' and `y' representing the polygon 
   to be transformed to the unit circle. It should be in anticlockwise order.}
  \item{wc}{a vector of length 2 representing the complex value to be transformed to 0.}
  \item{nptsq}{the number of points to be used per subinterval in Gauss-Jacobi quadrature. 
  Recommended value is equal to one more than the number of digits of accuracy desired in the answer. 
  Default 12.}
}
\details{
  The solution of the Schwartz-Christoffel equations involves finding the prevertices \eqn{z},
  which are the points on the unit circle mapping to the vertices of the polygon,
  normalized so that \code{z[length(z)] == 1}. The formula for the mapping is as follows,
  where \eqn{betam_k} is the external angle in the polygon at vertex \eqn{k} divided by \eqn{-pi}.
\deqn{
w=w_c+c\int_0^z \prod_{k=1}^n (1-z/z_k)^{\beta_k}dz
}
}
\value{
  A list containing the prevertices and other information required to perform the
  transformation.
}
\references{Trefethen, LN (1980) Numerical computation of the
Schwarz-Christoffel transformation, Siam J. Sci. Stat. Comp. 1, 82-102.  }
\author{Nick Ellis, nick.ellis@csiro.au}
\seealso{\code{\link{conformalPredict}}}
\examples{
CircleGrid <- function(nradial) { # create a random pattern to fill a disk
  r <- seq(0,1,len=nradial)
  nth <- pmax(1,ceiling(2*pi*r*(nradial-1)))
  th0 <- runif(nth,-pi/nth,pi/nth)
  list(
    x=unlist(lapply(1:nradial, function(i,r,nth,th0)
      r[i]*cos(th0[i]+seq(0,2*pi,len=nth[i]+1)[-nth[i]-1]),r=r,nth=nth,th0=th0)),
    y=unlist(lapply(1:nradial, function(i,r,nth,th0)
      r[i]*sin(th0[i]+seq(0,2*pi,len=nth[i]+1)[-nth[i]-1]),r=r,nth=nth,th0=th0))
  )
}
disk <- listxy2R(CircleGrid(30))
poly <- list(
  x=c(0.81,0.00,-0.73,-0.72,0.07,0.59,0.90),
  y=c(0.26,0.52,0.18,-0.44,-0.75,-0.39,0.01)
)
#poly <- locator(type='l')
fit <- conformalFit(poly)
pred <- conformalPredict(fit, disk, polygon2disk=FALSE)
cDisk <- R2C(disk)
cPred <- R2C(pred)
cols <- hsv(h=Arg(cDisk)/2/pi+0.5,s=pmin(1,Mod(cDisk)))
par(mfrow=c(1,2))
plot(cDisk, col=cols, asp=1, pch=16, main="Colour wheel")
lines(poly)
plot(cDisk, type='n', asp=1, main="Colour wheel\nmapped to polygon")
points(cPred, col=cols,pch=16)
circ <- abs(Mod(cDisk)-1) < 1e-6
segments(Re(cDisk[circ]),Im(cDisk[circ]),Re(cPred[circ]),Im(cPred[circ]), col=cols[circ])
lines(poly)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
