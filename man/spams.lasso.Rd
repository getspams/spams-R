\encoding{latin1}
\name{spams.lasso}
\alias{spams.lasso}
\title{
spams.lasso
}
\description{
    spams.lasso is an efficient implementation of the
    homotopy-LARS algorithm for solving the Lasso. 
    
}
\usage{
spams.lasso(X,D= NULL,Q = NULL,q = NULL,return_reg_path = FALSE,L= -1,lambda1= NULL,
            lambda2= 0.,mode= 'PENALTY',pos= FALSE,ols= FALSE,numThreads= -1,
            max_length_path= -1,verbose=FALSE,cholesky= FALSE)
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
\item{Q}{%
p x p double matrix (Q = D'D)
\preformatted{%
}}
\item{q}{%
p x n double matrix (q = D'X)
\preformatted{%
}}
\item{verbose}{%
verbose mode
\preformatted{%
}}
\item{return_reg_path}{%
\preformatted{%
if true the function will return 2 matrices in a list.
}}
\item{lambda1}{%
(parameter)
\preformatted{%
}}
\item{lambda2}{%
(optional parameter for solving the Elastic-Net)
\preformatted{%
for mode=0 and mode=1, it adds a ridge on the Gram Matrix
}}
\item{L}{%
(optional), maximum number of steps of the homotopy algorithm (can
\preformatted{%
be used as a stopping criterion)
}}
\item{pos}{%
(optional, adds non-negativity constraints on the
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
\item{cholesky}{%
(optional, default false),  choose between Cholesky 
\preformatted{%
implementation or one based on the matrix inversion Lemma
}}
\item{ols}{%
(optional, default false), perform an orthogonal projection
\preformatted{%
before returning the solution.
}}
\item{max_length_path}{%
(optional) maximum length of the path, by default 4*p
\preformatted{%
}}
}
\details{
\preformatted{%

    If the function is called this way spams.lasso(X,D = D, Q = NULL,...),
    it aims at addressing the following problems
    for all columns x of X, it computes one column alpha of A
    that solves
      1) when mode=0
        min_{alpha} ||x-Dalpha||_2^2 s.t. ||alpha||_1 <= lambda1
      2) when mode=1
        min_{alpha} ||alpha||_1 s.t. ||x-Dalpha||_2^2 <= lambda1
      3) when mode=2
        min_{alpha} 0.5||x-Dalpha||_2^2 + lambda1||alpha||_1 +0.5 lambda2||alpha||_2^2
        
    If the function is called this way spams.lasso(X,D = NULL, Q = Q, q = q,...),
    it solves the above optimisation problem, when Q=D'D and q=D'x.
    
    Possibly, when pos=true, it solves the previous problems
    with positivity constraints on the vectors alpha
}
}
\value{
\item{A}{%
double sparse p x n matrix (output coefficients)
\preformatted{%
}}
\item{path}{%
optional,  returns the regularisation path for the first signal
\preformatted{%
A <- spams.lasso(X,return_reg_path = FALSE,...)
v <- spams.lasso(X,return_reg_path = TRUE,...)
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
}
\examples{
      m <- 5;n <- 10;nD <- 5
      set.seed(0)
      X = matrix(rnorm(m * n),nrow = m,ncol = n,byrow = FALSE)
      X = X / matrix(rep(sqrt(colSums(X*X)),nrow(X)),nrow(X),ncol(X),byrow=TRUE)
      D = matrix(rnorm(m * nD),nrow = m,ncol = nD,byrow = FALSE)
      D = D / matrix(rep(sqrt(colSums(D*D)),nrow(D)),nrow(D),ncol(D),byrow=TRUE)
      alpha = spams.lasso(X,D = D,return_reg_path = FALSE,lambda1 = 0.15)
}
