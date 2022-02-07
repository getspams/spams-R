\encoding{latin1}
\name{spams.l1L2BCD}
\alias{spams.l1L2BCD}
\title{
spams.l1L2BCD
(this function has not been intensively tested).
}
\description{
    spams.l1L2BCD is a solver for a 
    Simultaneous signal decomposition formulation based on block 
    coordinate descent.
}
\usage{
spams.l1L2BCD(X,D,alpha0,list_groups,lambda1 = NULL,mode= 'PENALTY',itermax = 100,
              tol = 1e-3,numThreads = -1)
}
\arguments{
\item{X}{%
double m x N matrix   (input signals)
\preformatted{%
m is the signal size
N is the total number of signals 
}}
\item{D}{%
double m x p matrix   (dictionary)
\preformatted{%
p is the number of elements in the dictionary
}}
\item{alpha0}{%
double dense p x N matrix (initial solution)
\preformatted{%
}}
\item{list_groups}{%
int32 vector containing the indices (starting at 0)
\preformatted{%
of the first elements of each groups.
}}
\item{lambda1}{%
(regularization parameter)
\preformatted{%
}}
\item{mode}{%
(see above, by default 2)
\preformatted{%
}}
\item{itermax}{%
(maximum number of iterations, by default 100)
\preformatted{%
}}
\item{tol}{%
(tolerance parameter, by default 0.001)
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

    
    X is a matrix structured in groups of signals, which we denote
    by X=[X_1,...,X_n]
    
    if mode=2, it solves
        for all matrices X_i of X, 
        min_{A_i} 0.5||X_i-D A_i||_2^2 + lambda1/sqrt(n_i)||A_i||_{1,2}  
        where n_i is the number of columns of X_i
    if mode=1, it solves
        min_{A_i} ||A_i||_{1,2} s.t. ||X_i-D A_i||_2^2  <= n_i lambda1
}
}
\value{
\item{alpha}{%
double sparse p x N matrix (output coefficients)
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
