\encoding{latin1}
\name{spams.lassoWeighted}
\alias{spams.lassoWeighted}
\title{
spams.lassoWeighted.  
}
\description{
    spams.lassoWeighted is an efficient implementation of the
    LARS algorithm for solving the weighted Lasso. It is optimized
    for solving a large number of small or medium-sized 
    decomposition problem (and not for a single large one).
}
\usage{
spams.lassoWeighted(X,D,W,L= -1,lambda1= NULL,mode= 'PENALTY',pos= FALSE,numThreads= -1,
                    verbose=FALSE)
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
\item{W}{%
double p x n matrix   (weights)
\preformatted{%
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
\item{numThreads}{%
(optional, number of threads for exploiting
\preformatted{%
multi-core / multi-cpus. By default, it takes the value -1,
which automatically selects all the available CPUs/cores).
}}
}
\details{
\preformatted{%

    It first computes the Gram matrix D'D and then perform
    a Cholesky-based OMP of the input signals in parallel.
    For all columns x of X, and w of W, it computes one column alpha of A
    which is the solution of
      1) when mode=0
        min_{alpha} ||x-Dalpha||_2^2   s.t.  
                                    ||diag(w)alpha||_1 <= lambda1
      2) when mode=1
        min_{alpha} ||diag(w)alpha||_1  s.t.
                                       ||x-Dalpha||_2^2 <= lambda1
      3) when mode=2
        min_{alpha} 0.5||x-Dalpha||_2^2  +  
                                        lambda1||diag(w)alpha||_1 
    Possibly, when pos=true, it solves the previous problems
    with positivity constraints on the vectors alpha
}
}
\value{
\item{A}{%
double sparse p x n matrix (output coefficients)
\preformatted{%
}}
}
\author{
Julien MAIRAL, 2009 (spams, matlab interface and documentation)
Jean-Paul CHIEZE 2011-2012 (R interface)
}
\note{
    this function admits a few experimental usages, which have not
    been extensively tested:
        - single precision setting (even though the output alpha is double 
          precision)
}
