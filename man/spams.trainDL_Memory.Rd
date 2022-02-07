\encoding{latin1}
\name{spams.trainDL_Memory}
\alias{spams.trainDL_Memory}
\title{
spams.trainDL_Memory
}
\description{
    spams.trainDL_Memory is an efficient but memory consuming 
    variant of the dictionary learning technique presented in
    
}
\usage{
spams.trainDL_Memory(X,D = NULL,numThreads = -1,batchsize = -1,K= -1,lambda1= NULL,iter=-1,
                     t0=1e-5,mode='PENALTY',posD=FALSE,expand=FALSE,modeD='L2',
                     whiten=FALSE,clean=TRUE,gamma1=0.,gamma2=0.,rho=1.0,iter_updateD=1,
                     stochastic_deprecated=FALSE,modeParam=0,batch=FALSE,
                     log_deprecated=FALSE,logName='')
}
\arguments{
\item{X}{%
double m x n matrix   (input signals)
\preformatted{%
m is the signal size
n is the number of signals to decompose
}}
\item{D}{%
(optional) double m x p matrix   (dictionary)
\preformatted{%
p is the number of elements in the dictionary
When D is not provided, the dictionary is initialized 
with random elements from the training set.
}}
\item{K}{%
(size of the dictionary, optional is D is provided)
\preformatted{%
}}
\item{lambda1}{%
(parameter)
\preformatted{%
}}
\item{iter}{%
(number of iterations).  If a negative number is 
\preformatted{%
provided it will perform the computation during the
corresponding number of seconds. For instance iter=-5
learns the dictionary during 5 seconds.
}}
\item{mode}{%
(optional, see above, by default 2) 
\preformatted{%
}}
\item{modeD}{%
(optional, see above, by default 0)
\preformatted{%
}}
\item{posD}{%
(optional, adds positivity constraints on the 
\preformatted{%
dictionary, false by default, not compatible with 
modeD=2)
}}
\item{gamma1}{%
(optional parameter for modeD >= 1)
\preformatted{%
}}
\item{gamma2}{%
(optional parameter for modeD = 2)
\preformatted{%
}}
\item{batchsize}{%
(optional, size of the minibatch, by default 
\preformatted{%
512)
}}
\item{iter_updateD}{%
(optional, number of BCD iterations for the dictionary 
\preformatted{%
update step, by default 1)
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
(optional) tuning parameter (see paper arXiv:0908.0050)
\preformatted{%
}}
\item{t0}{%
(optional) tuning parameter (see paper arXiv:0908.0050)
\preformatted{%
}}
\item{clean}{%
(optional, true by default. prunes 
\preformatted{%
automatically the dictionary from unused elements).
}}
\item{numThreads}{%
(optional, number of threads for exploiting
\preformatted{%
multi-core / multi-cpus. By default, it takes the value -1,
which automatically selects all the available CPUs/cores).
}}
\item{expand}{%
undocumented; modify at your own risks!
\preformatted{%
}}
\item{whiten}{%
undocumented; modify at your own risks!
\preformatted{%
}}
\item{stochastic_deprecated}{%
undocumented; modify at your own risks!
\preformatted{%
}}
\item{batch}{%
undocumented; modify at your own risks!
\preformatted{%
}}
\item{log_deprecated}{%
undocumented; modify at your own risks!
\preformatted{%
}}
\item{logName}{%
undocumented; modify at your own risks!
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
    
    Contrary to the approaches above, the algorithm here 
       does require to store all the coefficients from all the training
       signals. For this reason this variant can not be used with large
       training sets, but is more efficient than the regular online
       approach for training sets of reasonable size.
       
    It addresses the dictionary learning problems
       1) if mode=1
    min_{D in C} (1/n) sum_{i=1}^n  ||alpha_i||_1  s.t.  ...
                                        ||x_i-Dalpha_i||_2^2 <= lambda1
       2) if mode=2
    min_{D in C} (1/n) sum_{i=1}^n (1/2)||x_i-Dalpha_i||_2^2 + ... 
                                                     lambda1||alpha_i||_1  
                                                     
    C is a convex set verifying
       1) if modeD=0
          C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 <= 1 }
       1) if modeD=1
          C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 + ... 
                                                 gamma1||d_j||_1 <= 1 }
       1) if modeD=2
          C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 + ... 
                                 gamma1||d_j||_1 + gamma2 FL(d_j) <= 1 }
                                 
    Potentially, n can be very large with this algorithm.
}
}
\value{
\item{D}{%
double m x p matrix   (dictionary)
\preformatted{%
}}
\item{model}{%
the model as A B iter
\preformatted{%
D <- spams.trainDL_Memory(X,...)
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
