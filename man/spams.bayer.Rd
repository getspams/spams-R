\encoding{latin1}
\name{spams.bayer}
\alias{spams.bayer}
\title{
spams.bayer
}
\description{
    spams.bayer applies a Bayer pattern to an image X.
      There are four possible offsets.
}
\usage{
spams.bayer(X,offset)
}
\arguments{
\item{X}{%
double m x n matrix   
\preformatted{%
}}
\item{offset}{%
scalar, 0,1,2 or 3   
\preformatted{%
}}
}
\value{
\item{Y}{%
double m x m matrix 
\preformatted{%
}}
}
\author{
Julien MAIRAL, 2009 (spams, matlab interface and documentation)
Jean-Paul CHIEZE 2011-2012 (R interface)
}
