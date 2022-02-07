\encoding{latin1}
\name{spams.proximalFlat}
\alias{spams.proximalFlat}
\title{
spams.proximalFlat
}
\description{
    spams.proximalFlat computes proximal operators. Depending
        on the value of regul, it computes 
        
}
\usage{
spams.proximalFlat(U,return_val_loss = FALSE,numThreads =-1,lambda1=1.0,lambda2=0.,
                   lambda3=0.,intercept=FALSE,resetflow=FALSE,regul="",verbose=FALSE,
                   pos=FALSE,clever=TRUE,size_group=1,groups = NULL,transpose=FALSE)
}
\arguments{
\item{U}{%
double m x n matrix   (input signals)
\preformatted{%
m is the signal size
}}
\item{return_val_loss}{%
\preformatted{%
if true the function will return 2 matrices in a list.
}}
\item{lambda1}{%
(regularization parameter)
\preformatted{%
}}
\item{regul}{%
(choice of regularization, see above)
\preformatted{%
}}
\item{lambda2}{%
(optional, regularization parameter)
\preformatted{%
}}
\item{lambda3}{%
(optional, regularization parameter)
\preformatted{%
}}
\item{verbose}{%
(optional, verbosity level, false by default)
\preformatted{%
}}
\item{intercept}{%
(optional, last row of U is not regularized,
\preformatted{%
false by default)
}}
\item{transpose}{%
(optional, transpose the matrix in the regularization function)
\preformatted{%
}}
\item{size_group}{%
(optional, for regularization functions assuming a group
\preformatted{%
structure). It is a scalar. When groups is not specified, it assumes
that the groups are the sets of consecutive elements of size size_group
}}
\item{groups}{%
(int32, optional, for regularization functions assuming a group
\preformatted{%
structure. It is an int32 vector of size m containing the group indices of the
variables (first group is 1).
}}
\item{pos}{%
(optional, adds positivity constraints on the
\preformatted{%
coefficients, false by default)
}}
\item{numThreads}{%
(optional, number of threads for exploiting
\preformatted{%
multi-core / multi-cpus. By default, it takes the value -1,
which automatically selects all the available CPUs/cores).
}}
\item{resetflow}{%
undocumented; modify at your own risks!
\preformatted{%
}}
\item{clever}{%
undocumented; modify at your own risks!
\preformatted{%
}}
}
\details{
\preformatted{%

    Given an input matrix U=[u^1,\ldots,u^n], it computes a matrix 
    V=[v^1,\ldots,v^n] such that
    if one chooses a regularization functions on vectors, it computes
    for each column u of U, a column v of V solving
    if regul='l0'
        argmin 0.5||u-v||_2^2 + lambda1||v||_0
    if regul='l1'
        argmin 0.5||u-v||_2^2 + lambda1||v||_1
    if regul='l2'
        argmin 0.5||u-v||_2^2 + 0.5lambda1||v||_2^2
    if regul='elastic-net'
        argmin 0.5||u-v||_2^2 + lambda1||v||_1 + lambda1_2||v||_2^2
    if regul='fused-lasso'
        argmin 0.5||u-v||_2^2 + lambda1 FL(v) + ...
                          ...  lambda1_2||v||_1 + lambda1_3||v||_2^2
    if regul='linf'
        argmin 0.5||u-v||_2^2 + lambda1||v||_inf
    if regul='l1-constraint'
        argmin 0.5||u-v||_2^2 s.t. ||v||_1 <= lambda1
    if regul='l2-not-squared'
        argmin 0.5||u-v||_2^2 + lambda1||v||_2
    if regul='group-lasso-l2'  
        argmin 0.5||u-v||_2^2 + lambda1 sum_g ||v_g||_2 
        where the groups are either defined by groups or by size_group,
    if regul='group-lasso-linf'
        argmin 0.5||u-v||_2^2 + lambda1 sum_g ||v_g||_inf
    if regul='sparse-group-lasso-l2'  
        argmin 0.5||u-v||_2^2 + lambda1 sum_g ||v_g||_2 + lambda1_2 ||v||_1
        where the groups are either defined by groups or by size_group,
    if regul='sparse-group-lasso-linf'
        argmin 0.5||u-v||_2^2 + lambda1 sum_g ||v_g||_inf + lambda1_2 ||v||_1
    if regul='trace-norm-vec' 
        argmin 0.5||u-v||_2^2 + lambda1 ||mat(v)||_* 
       where mat(v) has size_group rows
       
    if one chooses a regularization function on matrices
    if regul='l1l2',  V= 
        argmin 0.5||U-V||_F^2 + lambda1||V||_{1/2}
    if regul='l1linf',  V= 
        argmin 0.5||U-V||_F^2 + lambda1||V||_{1/inf}
    if regul='l1l2+l1',  V= 
        argmin 0.5||U-V||_F^2 + lambda1||V||_{1/2} + lambda1_2||V||_{1/1}
    if regul='l1linf+l1',  V= 
        argmin 0.5||U-V||_F^2 + lambda1||V||_{1/inf} + lambda1_2||V||_{1/1}
    if regul='l1linf+row-column',  V= 
        argmin 0.5||U-V||_F^2 + lambda1||V||_{1/inf} + lambda1_2||V'||_{1/inf}
    if regul='trace-norm',  V= 
        argmin 0.5||U-V||_F^2 + lambda1||V||_*
    if regul='rank',  V= 
        argmin 0.5||U-V||_F^2 + lambda1 rank(V)
    if regul='none',  V= 
        argmin 0.5||U-V||_F^2 
        
    for all these regularizations, it is possible to enforce non-negativity constraints
    with the option pos, and to prevent the last row of U to be regularized, with
    the option intercept
}
}
\value{
\item{V}{%
double m x n matrix (output coefficients)
\preformatted{%
}}
\item{val_regularizer}{%
double 1 x n vector (value of the regularization
\preformatted{%
term at the optimum).
}}
\item{val_loss}{%
vector of size ncol(U)
\preformatted{%
alpha <- spams.proximalFlat(U,return_val_loss = FALSE, ...)
v <- spams.proximalFlat(U,return_val_loss = TRUE, ...)
alpha <- v[[1]]
val_loss <- v[[2]]
}}
}
\author{
Julien MAIRAL, 2010 (spams, matlab interface and documentation)
Jean-Paul CHIEZE 2011-2012 (R interface)
}
\note{
    Valid values for the regularization parameter (regul) are:
      "l0", "l1", "l2", "linf", "l2-not-squared", "elastic-net", "fused-lasso",
      "group-lasso-l2", "group-lasso-linf", "sparse-group-lasso-l2",
      "sparse-group-lasso-linf", "l1l2", "l1linf", "l1l2+l1", "l1linf+l1",
      "tree-l0", "tree-l2", "tree-linf", "graph", "graph-ridge", "graph-l2",
      "multi-task-tree", "multi-task-graph", "l1linf-row-column", "trace-norm",
      "trace-norm-vec", "rank", "rank-vec", "none"
}
