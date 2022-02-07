\encoding{latin1}
\name{spams.calcXtY}
\alias{spams.calcXtY}
\title{
spams.calcXtY
}
\description{
    Compute Z=X'Y using the BLAS library used by SPAMS.
}
\usage{
spams.calcXtY(X,Y)
}
\arguments{
\item{X}{%
double n x m matrix
\preformatted{%
}}
\item{Y}{%
double n x p matrix   
\preformatted{%
}}
}
\value{
\item{Z}{%
double m x p matrix 
\preformatted{%
}}
}
\author{
Julien MAIRAL, 2009 (spams, matlab interface and documentation)
Jean-Paul CHIEZE 2011-2012 (R interface)
}
