\encoding{latin1}
\name{spams.archetypalAnalysis}
\alias{spams.archetypalAnalysis}
\title{
spams.archetypalAnalysis
}
\description{
    documentation to appear soon
}
\usage{
spams.archetypalAnalysis(X,p = 10,Z0 = NULL,returnAB = FALSE,robust=FALSE,epsilon=1e-3,
                         computeXtX=TRUE,stepsFISTA=3,stepsAS=50,randominit=TRUE,
                         numThreads=-1)
}
\arguments{
\item{X}{%
double m x n matrix   (input signals)
\preformatted{%
m is the signal size
n is the number of signals to decompose
}}
}
\value{
\item{Z}{%
double %
\preformatted{%
}}
}
\author{
Yuansi Chen and Julien MAIRAL, 2014 (spams, matlab interface and documentation)
Jean-Paul CHIEZE 2011-2012 (R interface)
}
