\encoding{latin1}
\name{spams.somp}
\alias{spams.somp}
\title{
spams.somp
(this function has not been intensively tested).
}
\description{
    spams.somp is an efficient implementation of a
    Simultaneous Orthogonal Matching Pursuit algorithm. It is optimized
    for solving a large number of small or medium-sized 
    decomposition problem (and not for a single large one).
}
\usage{
spams.somp(X,D,list_groups,L = NULL,eps = 0.,numThreads = -1)
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
All the columns of D should have unit-norm !
}}
\item{list_groups}{%
int32 vector containing the indices (starting at 0)
\preformatted{%
of the first elements of each groups.
}}
\item{L}{%
(maximum number of elements in each decomposition)
\preformatted{%
}}
\item{eps}{%
(threshold on the squared l2-norm of the residual
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
    It aims at addressing the following NP-hard problem
    
    X is a matrix structured in groups of signals, which we denote
    by X=[X_1,...,X_n]
    
    for all matrices X_i of X, 
        min_{A_i} ||A_i||_{0,infty}  s.t  ||X_i-D A_i||_2^2 <= eps*n_i
        where n_i is the number of columns of X_i
        
        or
        
        min_{A_i} ||X_i-D A_i||_2^2  s.t. ||A_i||_{0,infty} <= L
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
