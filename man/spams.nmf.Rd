\encoding{latin1}
\name{spams.nmf}
\alias{spams.nmf}
\title{
nmf
}
\description{
    spams.trainDL is an efficient implementation of the
    non-negative matrix factorization technique presented in 
    
}
\usage{
spams.nmf(X,return_lasso= FALSE,model= NULL,numThreads = -1,batchsize = -1,K= -1,iter=-1,
          t0=1e-5,clean=TRUE,rho=1.0,modeParam=0,batch=FALSE)
}
\arguments{
\item{X}{%
double m x n matrix   (input signals)
\preformatted{%
m is the signal size
n is the number of signals to decompose
}}
\item{return_lasso}{%
\preformatted{%
if true the function will return 2 matrices in a list.
}}
\item{K}{%
(number of required factors)
\preformatted{%
}}
\item{iter}{%
(number of iterations).  If a negative number 
\preformatted{%
is provided it will perform the computation during the
corresponding number of seconds. For instance iter=-5
learns the dictionary during 5 seconds.
}}
\item{batchsize}{%
(optional, size of the minibatch, by default 
\preformatted{%
512)
}}
\item{modeParam}{%
(optimization mode).
\preformatted{%
1) if modeParam=0, the optimization uses the 
parameter free strategy of the ICML paper
2) if modeParam=1, the optimization uses the 
parameters rho as in arXiv:0908.0050
3) if modeParam=2, the optimization uses exponential 
decay weights with updates of the form  
A_{t} <- rho A_{t-1} + alpha_t alpha_t^T
}}
\item{rho}{%
(optional) tuning parameter (see paper 
\preformatted{%
arXiv:0908.0050)
}}
\item{t0}{%
(optional) tuning parameter (see paper 
\preformatted{%
arXiv:0908.0050)
}}
\item{clean}{%
(optional, true by default. prunes automatically 
\preformatted{%
the dictionary from unused elements).
}}
\item{batch}{%
(optional, false by default, use batch learning 
\preformatted{%
instead of online learning)
}}
\item{numThreads}{%
(optional, number of threads for exploiting
\preformatted{%
multi-core / multi-cpus. By default, it takes the value -1,
which automatically selects all the available CPUs/cores).
}}
\item{model}{%
struct (optional) learned model for "retraining" the data.
\preformatted{%
}}
}
\details{
\preformatted{%

    "Online Learning for Matrix Factorization and Sparse Coding"
    by Julien Mairal, Francis Bach, Jean Ponce and Guillermo Sapiro
    arXiv:0908.0050
    
    "Online Dictionary Learning for Sparse Coding"      
    by Julien Mairal, Francis Bach, Jean Ponce and Guillermo Sapiro
    ICML 2009.
    
    Potentially, n can be very large with this algorithm.
}
}
\value{
\item{U}{%
double m x p matrix   
\preformatted{%
}}
\item{V}{%
double p x n matrix   (optional)
\preformatted{%
}}
\item{model}{%
struct (optional) learned model to be used for 
\preformatted{%
"retraining" the data.
U <- spams.nmf(X,return_lasso = FALSE,...)
v <- spams.nmf(X,return_lasso = TRUE,...)
U <- v[[1]]
V <- v[[2]]
}}
}
\author{
Julien MAIRAL, 2009 (spams, matlab interface and documentation)
Jean-Paul CHIEZE 2011-2012 (R interface)
}
