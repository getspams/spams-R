\encoding{latin1}
\name{spams.sparseProject}
\alias{spams.sparseProject}
\title{
spams.sparseProject
}
\description{
    spams.sparseProject solves various optimization 
    problems, including projections on a few convex sets.
}
\usage{
spams.sparseProject(U,thrs = 1.0,mode = 1,lambda1 = 0.0,lambda2 = 0.0,lambda3 = 0.0,
                    pos = FALSE,numThreads = -1)
}
\arguments{
\item{U}{%
double m x n matrix   (input signals)
\preformatted{%
m is the signal size
n is the number of signals to project
}}
\item{thrs}{%
(parameter)
\preformatted{%
}}
\item{lambda1}{%
(parameter)
\preformatted{%
}}
\item{lambda2}{%
(parameter)
\preformatted{%
}}
\item{lambda3}{%
(parameter)
\preformatted{%
}}
\item{mode}{%
(see above)
\preformatted{%
}}
\item{pos}{%
(optional, false by default)
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

    It aims at addressing the following problems
    for all columns u of U in parallel
      1) when mode=1 (projection on the l1-ball)
          min_v ||u-v||_2^2  s.t.  ||v||_1 <= thrs
      2) when mode=2
          min_v ||u-v||_2^2  s.t. ||v||_2^2 + lamuda1||v||_1 <= thrs
      3) when mode=3
          min_v ||u-v||_2^2  s.t  ||v||_1 + 0.5lamuda1||v||_2^2 <= thrs 
      4) when mode=4
          min_v 0.5||u-v||_2^2 + lamuda1||v||_1  s.t  ||v||_2^2 <= thrs
      5) when mode=5
          min_v 0.5||u-v||_2^2 + lamuda1||v||_1 +lamuda2 FL(v) + ... 
                                                  0.5lamuda_3 ||v||_2^2
         where FL denotes a "fused lasso" regularization term.
      6) when mode=6
         min_v ||u-v||_2^2 s.t lamuda1||v||_1 +lamuda2 FL(v) + ...
                                            0.5lamuda3||v||_2^2 <= thrs
                                            
       When pos=true and mode <= 4,
       it solves the previous problems with positivity constraints 
}
}
\value{
\item{V}{%
double m x n matrix (output matrix)
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
        - single precision setting 
}
