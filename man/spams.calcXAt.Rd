\encoding{latin1}
\name{spams.calcXAt}
\alias{spams.calcXAt}
\title{
spams.calcXAt
}
\description{
    Compute efficiently XAt = X*A', when A is sparse and has a 
  lot more columns than rows. In some cases, it is up to 20 times 
  faster than the equivalent R expression;
}
\usage{
spams.calcXAt(X,A)
}
\arguments{
\item{X}{%
double m x n matrix
\preformatted{%
}}
\item{A}{%
double sparse p x n matrix   
\preformatted{%
}}
}
\value{
\item{XAt}{%
double m x p matrix 
\preformatted{%
}}
}
\author{
Julien MAIRAL, 2009 (spams, matlab interface and documentation)
Jean-Paul CHIEZE 2011-2012 (R interface)
}
