\encoding{latin1}
\name{spams.omp}
\alias{spams.omp}
\title{
spams.omp
}
\description{
    spams.omp is an efficient implementation of the
    Orthogonal Matching Pursuit algorithm. It is optimized
    for solving a large number of small or medium-sized 
    decomposition problem (and not for a single large one).
}
\usage{
spams.omp(X,D,L = NULL,eps = NULL,lambda1 = NULL,return_reg_path = FALSE,numThreads = -1)
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
All the columns of D should have unit-norm !
}}
\item{return_reg_path}{%
\preformatted{%
if true the function will return 2 matrices in a list.
}}
\item{L}{%
(optional, maximum number of elements in each decomposition, 
\preformatted{%
min(m,p) by default)
}}
\item{eps}{%
(optional, threshold on the squared l2-norm of the residual,
\preformatted{%
0 by default
}}
\item{lambda1}{%
(optional, penalty parameter, 0 by default
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
    X=[x^1,...,x^n] is a matrix of signals, and it returns
    a matrix A=[alpha^1,...,alpha^n] of coefficients.
    
    it addresses for all columns x of X, 
        min_{alpha} ||alpha||_0  s.t  ||x-Dalpha||_2^2 <= eps
        or
        min_{alpha} ||x-Dalpha||_2^2  s.t. ||alpha||_0 <= L
        or
        min_{alpha} 0.5||x-Dalpha||_2^2 + lambda1||alpha||_0 
}
}
\value{
\item{A}{%
double sparse p x n matrix (output coefficients)
\preformatted{%
path (optional): double dense p x L matrix (regularization path of the first signal)
A <- spams.omp(X,D,L,eps,return_reg_path = FALSE,...)
v <- spams.omp(X,D,L,eps,return_reg_path = TRUE,...)
A <- v[[1]]
path <- v[[2]]
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
     - Passing an int32 vector of length n to L provides
       a different parameter L for each input signal x_i
     - Passing a double vector of length n to eps and or lambda1 
       provides a different parameter eps (or lambda1) for each input signal x_i
}
