\encoding{latin1}
\name{spams.proximalGraph}
\alias{spams.proximalGraph}
\title{
spams.proximalGraph
}
\description{
    spams.proximalGraph computes a proximal operator. Depending
        on the value of regul, it computes 
        
}
\usage{
spams.proximalGraph(U,graph,return_val_loss = FALSE,numThreads =-1,lambda1=1.0,lambda2=0.,
                    lambda3=0.,intercept=FALSE,resetflow=FALSE,regul="",verbose=FALSE,
                    pos=FALSE,clever=TRUE,size_group=1,transpose=FALSE)
}
\arguments{
\item{U}{%
double p x n matrix   (input signals)
\preformatted{%
m is the signal size
}}
\item{graph}{%
struct
\preformatted{%
with three fields, eta_g, groups, and groups_var

The first fields sets the weights for every group
graph.eta_g            double N vector 

The next field sets inclusion relations between groups 
(but not between groups and variables):
graph.groups           sparse (double or boolean) N x N matrix  
the (i,j) entry is non-zero if and only if i is different than j and 
gi is included in gj.

The next field sets inclusion relations between groups and variables
graph.groups_var       sparse (double or boolean) p x N matrix
the (i,j) entry is non-zero if and only if the variable i is included 
in gj, but not in any children of gj.

examples are given in test_ProximalGraph.m

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
\item{size_group}{%
undocumented; modify at your own risks!
\preformatted{%
}}
\item{transpose}{%
undocumented; modify at your own risks!
\preformatted{%
}}
}
\details{
\preformatted{%

    Given an input matrix U=[u^1,\ldots,u^n], and a set of groups G,
    it computes a matrix V=[v^1,\ldots,v^n] such that
    
    if regul='graph'
    for every column u of U, it computes a column v of V solving
        argmin 0.5||u-v||_2^2 + lambda1\sum_{g \in G} \eta_g||v_g||_inf
        
    if regul='graph+ridge'
    for every column u of U, it computes a column v of V solving
        argmin 0.5||u-v||_2^2 + lambda1\sum_{g \in G} \eta_g||v_g||_inf + lambda1_2||v||_2^2
        
        
    if regul='multi-task-graph'
       V=argmin 0.5||U-V||_F^2 + lambda1 \sum_{i=1}^n\sum_{g \in G} \eta_g||v^i_g||_inf + ...
                                           lambda1_2 \sum_{g \in G} \eta_g max_{j in g}||V_j||_{inf}
                                           
    it can also be used with any regularization addressed by spams.proximalFlat
    
    for all these regularizations, it is possible to enforce non-negativity constraints
    with the option pos, and to prevent the last row of U to be regularized, with
    the option intercept
}
}
\value{
\item{V}{%
double p x n matrix (output coefficients)
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
alpha <- spams.proximalGraph(U,graph,return_val_loss = FALSE, ...)
v <- spams.proximalGraph(U,graph,return_val_loss = TRUE, ...)
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
