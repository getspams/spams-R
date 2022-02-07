\encoding{latin1}
\name{spams.lassoMask}
\alias{spams.lassoMask}
\title{
spams.lassoMask
}
\description{
    spams.lasso is a variant of spams.lasso that handles
    binary masks. It aims at addressing the following problems
    for all columns x of X, and beta of B, it computes one column alpha of A
    that solves
      1) when mode=0
        min_{alpha} ||diag(beta)(x-Dalpha)||_2^2 s.t. ||alpha||_1 <= lambda1
      2) when mode=1
        min_{alpha} ||alpha||_1 s.t. ||diag(beta)(x-Dalpha)||_2^2 
                                                             <= lambda1*||beta||_0/m
      3) when mode=2
        min_{alpha} 0.5||diag(beta)(x-Dalpha)||_2^2 +
                                                lambda1*(||beta||_0/m)*||alpha||_1 +
                                                (lambda2/2)||alpha||_2^2
    Possibly, when pos=true, it solves the previous problems
    with positivity constraints on the vectors alpha
}
\usage{
spams.lassoMask(X,D,B,L= -1,lambda1= NULL,lambda2= 0.,mode= 'PENALTY',pos= FALSE,
                numThreads= -1,verbose=FALSE)
}
\arguments{
\item{X}{%
double m x n matrix   (input signals)
\preformatted{%
m is the signal size
n is the number of signals to decompose
}}
\item{D}{%
double m x p matrix   (dictionary)
\preformatted{%
p is the number of elements in the dictionary
}}
\item{B}{%
boolean m x n matrix   (mask)
\preformatted{%
p is the number of elements in the dictionary
}}
\item{verbose}{%
verbose mode
\preformatted{%
}}
\item{lambda1}{%
(parameter)
\preformatted{%
}}
\item{L}{%
(optional, maximum number of elements of each 
\preformatted{%
decomposition)
}}
\item{pos}{%
(optional, adds positivity constraints on the
\preformatted{%
coefficients, false by default)
}}
\item{mode}{%
(see above, by default: 2)
\preformatted{%
}}
\item{lambda2}{%
(optional parameter for solving the Elastic-Net)
\preformatted{%
for mode=0 and mode=1, it adds a ridge on the Gram Matrix
}}
\item{numThreads}{%
(optional, number of threads for exploiting
\preformatted{%
multi-core / multi-cpus. By default, it takes the value -1,
which automatically selects all the available CPUs/cores).
}}
}
\value{
\item{A}{%
double sparse p x n matrix (output coefficients)
\preformatted{%
}}
}
\author{
Julien MAIRAL, 2010 (spams, matlab interface and documentation)
Jean-Paul CHIEZE 2011-2012 (R interface)
}
\note{
    this function admits a few experimental usages, which have not
    been extensively tested:
        - single precision setting (even though the output alpha is double 
          precision)
}
