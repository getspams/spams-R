\encoding{latin1}
\name{spams.structTrainDL}
\alias{spams.structTrainDL}
\title{
spams.structTrainDL
}
\description{
    spams.structTrainDL is an efficient implementation of the
    dictionary learning technique presented in
    
}
\usage{
spams.structTrainDL(X,return_model= FALSE,model= NULL,D = NULL,graph = NULL,tree = NULL,
                    numThreads = -1,tol = 0.000001,fixed_step = TRUE,ista = FALSE,
                    batchsize = -1,K= -1,lambda1= NULL,lambda2= 10e-10,lambda3 = 0.,
                    iter=-1,t0=1e-5,regul='none',posAlpha=FALSE,posD=FALSE,expand=FALSE,
                    modeD='L2',whiten=FALSE,clean=TRUE,verbose=TRUE,gamma1=0.,gamma2=0.,
                    rho=1.0,iter_updateD=NULL,stochastic_deprecated=FALSE,modeParam=0,
                    batch=FALSE,log_deprecated=FALSE,logName='')
}
\arguments{
\item{X}{%
double m x n matrix   (input signals)
\preformatted{%
m is the signal size
n is the number of signals to decompose
}}
\item{return_model}{%
\preformatted{%
if true the function will return the model
as a named list ('A' = A, 'B' = B, 'iter' = n)
}}
\item{model}{%
NULL or model (as A,B,iter) to use as initialisation
\preformatted{%
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
\item{lambda2}{%
(optional, by default 0)
\preformatted{%
}}
\item{lambda3}{%
(optional, regularization parameter, 0 by default)
\preformatted{%
}}
\item{iter}{%
(number of iterations).  If a negative number is 
\preformatted{%
provided it will perform the computation during the
corresponding number of seconds. For instance iter=-5
learns the dictionary during 5 seconds.
}}
\item{regul}{%
choice of regularization : one of
\preformatted{%
'l0' 'l1' 'l2' 'linf' 'none' 'elastic-net' 'fused-lasso'
'graph' 'graph-ridge' 'graph-l2' 'tree-l0' 'tree-l2' 'tree-linf' 
}}
\item{tree}{%
struct (see documentation of spams.proximalTree);
\preformatted{%
needed for regul of graph kind.
}}
\item{graph}{%
struct (see documentation of spams.proximalGraph);
\preformatted{%
needed for regul of tree kind.
}}
\item{posAlpha}{%
(optional, adds positivity constraints on the
\preformatted{%
coefficients, false by default.
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
\item{ista}{%
(optional, use ista instead of fista, false by default).
\preformatted{%
}}
\item{tol}{%
(optional, tolerance for stopping criteration, which is a relative duality gap
\preformatted{%
}}
\item{fixed_step}{%
(deactive the line search for L in fista and use K instead)
\preformatted{%
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
\item{verbose}{%
(optional, true by default, increase verbosity)
\preformatted{%
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
    
    
    It addresses the dictionary learning problems
       min_{D in C} (1/n) sum_{i=1}^n 0.5||x_i-Dalpha_i||_2^2 + lambda1 psi(alpha)
       where the regularization function psi depends on regul
       (see spams.proximalFlat for the description of psi,
        and regul below for allowed values of regul)
        
    C is a convex set verifying
       1) if modeD=0
          C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 <= 1 }
       2) if modeD=1
          C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 + ... 
                                                 gamma1||d_j||_1 <= 1 }
       3) if modeD=2
          C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 + ... 
                                 gamma1||d_j||_1 + gamma2 FL(d_j) <= 1 }
       4) if modeD=3
          C={  D in Real^{m x p}  s.t.  forall j,  (1-gamma1)||d_j||_2^2 + ... 
                                 gamma1||d_j||_1 <= 1 }
                                 
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
D <- spams.structTrainDL(X,return_model = FALSE,...)
v <- spams.structTrainDL(X,return_model = TRUE,...)
D <- v[[1]]
model <- v[[2]]
A = model[['A']]
B = model[['B']]
iter = model[['iter']]
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
