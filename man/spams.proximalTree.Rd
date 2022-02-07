\encoding{latin1}
\name{spams.proximalTree}
\alias{spams.proximalTree}
\title{
spams.proximalTree
}
\description{
    spams.proximalTree computes a proximal operator. Depending
        on the value of regul, it computes 
        
}
\usage{
spams.proximalTree(U,tree,return_val_loss = FALSE,numThreads =-1,lambda1=1.0,lambda2=0.,
                   lambda3=0.,intercept=FALSE,resetflow=FALSE,regul="",verbose=FALSE,
                   pos=FALSE,clever=TRUE,size_group=1,transpose=FALSE)
}
\arguments{
\item{U}{%
double m x n matrix   (input signals)
\preformatted{%
m is the signal size
}}
\item{tree}{%
named list 
\preformatted{%
with four fields, eta_g, groups, own_variables and N_own_variables.

The tree structure requires a particular organization of groups and variables
* Let us denote by N = |T|, the number of groups.
the groups should be ordered T={g1,g2,\ldots,gN} such that if gi is included
in gj, then j <= i. g1 should be the group at the root of the tree 
and contains every variable.
* Every group is a set of  contiguous indices for instance 
gi={3,4,5} or gi={4,5,6,7} or gi={4}, but not {3,5};
* We define root(gi) as the indices of the variables that are in gi,
but not in its descendants. For instance for
T={ g1={1,2,3,4},g2={2,3},g3={4} }, then, root(g1)={1}, 
root(g2)={2,3}, root(g3)={4},
We assume that for all i, root(gi) is a set of contigous variables
* We assume that the smallest of root(gi) is also the smallest index of gi.

For instance, 
T={ g1={1,2,3,4},g2={2,3},g3={4} }, is a valid set of groups.
but we can not have
T={ g1={1,2,3,4},g2={1,2},g3={3} }, since root(g1)={4} and 4 is not the
smallest element in g1.

We do not lose generality with these assumptions since they can be fullfilled for any
tree-structured set of groups after a permutation of variables and a correct ordering of the
groups.
see more examples in test_ProximalTree.m of valid tree-structured sets of groups.

The first fields sets the weights for every group
tree[['eta_g']]            double N vector 

The next field sets inclusion relations between groups 
(but not between groups and variables):
tree[['groups']]           sparse (double or boolean) N x N matrix  
the (i,j) entry is non-zero if and only if i is different than j and 
gi is included in gj.
the first column corresponds to the group at the root of the tree.

The next field define the smallest index of each group gi, 
which is also the smallest index of root(gi)
tree[['own_variables']]    int32 N vector

The next field define for each group gi, the size of root(gi)
tree[['N_own_variables']]  int32 N vector 

examples are given in test_ProximalTree.m

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

    Given an input matrix U=[u^1,\ldots,u^n], and a tree-structured set of groups T,
    it returns a matrix V=[v^1,\ldots,v^n]:
    
    when the regularization function is for vectors,
    for every column u of U, it compute a column v of V solving
    if regul='tree-l0'
        argmin 0.5||u-v||_2^2 + lambda1 \sum_{g \in T} \delta^g(v)
    if regul='tree-l2'
      for all i, v^i = 
        argmin 0.5||u-v||_2^2 + lambda1\sum_{g \in T} \eta_g||v_g||_2
    if regul='tree-linf'
      for all i, v^i = 
        argmin 0.5||u-v||_2^2 + lambda1\sum_{g \in T} \eta_g||v_g||_inf
        
    when the regularization function is for matrices:
    if regul='multi-task-tree'
       V=argmin 0.5||U-V||_F^2 + lambda1 \sum_{i=1}^n\sum_{g \in T} \eta_g||v^i_g||_inf + ...
                                           lambda1_2 \sum_{g \in T} \eta_g max_{j in g}||V_j||_{inf}
                                           
    it can also be used with any non-tree-structured regularization addressed by spams.proximalFlat
    
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
alpha <- spams.proximalTree(U,tree,return_val_loss = FALSE, ...)
v <- spams.proximalTree(U,tree,return_val_loss = TRUE, ...)
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
