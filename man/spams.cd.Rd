\encoding{latin1}
\name{spams.cd}
\alias{spams.cd}
\title{
spams.cd
}
\description{
    spams.cd addresses l1-decomposition problem with a 
    coordinate descent type of approach.
}
\usage{
spams.cd(X,D,A0,lambda1 = NULL,mode= 'PENALTY',itermax=100,tol = 0.001,numThreads =-1)
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
\item{A0}{%
double sparse p x n matrix   (initial guess)
\preformatted{%
}}
\item{lambda1}{%
(parameter)
\preformatted{%
}}
\item{mode}{%
(optional, see above, by default 2)
\preformatted{%
}}
\item{itermax}{%
(maximum number of iterations)
\preformatted{%
}}
\item{tol}{%
(tolerance parameter)
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

    It is optimized for solving a large number of small or medium-sized 
    decomposition problem (and not for a single large one).
    It first computes the Gram matrix D'D.
    This method is particularly well adapted when there is low 
    correlation between the dictionary elements and when one can benefit 
    from a warm restart.
    It aims at addressing the two following problems
    for all columns x of X, it computes a column alpha of A such that
      2) when mode=1
        min_{alpha} ||alpha||_1 s.t. ||x-Dalpha||_2^2 <= lambda1
        For this constraint setting, the method solves a sequence of 
        penalized problems (corresponding to mode=2) and looks
        for the corresponding Lagrange multplier with a simple but
        efficient heuristic.
      3) when mode=2
        min_{alpha} 0.5||x-Dalpha||_2^2 + lambda1||alpha||_1 
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
        - single precision setting (even though the output alpha 
          is double precision)
}
