\encoding{latin1}
\name{spams.calcAAt}
\alias{spams.calcAAt}
\title{
spams.calcAAt
}
\description{
    Compute efficiently AAt = A*A', when A is sparse 
  and has a lot more columns than rows. In some cases, it is
  up to 20 times faster than the equivalent R expression
  AAt=A*A';
}
\usage{
spams.calcAAt(A)
}
\arguments{
\item{A}{%
double sparse m x n matrix   
\preformatted{%
}}
}
\value{
\item{AAt}{%
double m x m matrix 
\preformatted{%
}}
}
\author{
Julien MAIRAL, 2009 (spams, matlab interface and documentation)
Jean-Paul CHIEZE 2011-2012 (R interface)
}
