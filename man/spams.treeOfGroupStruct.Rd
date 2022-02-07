\encoding{latin1}
\name{spams.treeOfGroupStruct}
\alias{spams.treeOfGroupStruct}
\title{
spams.treeOfGroupStruct
}
\description{
    converts a group structure into the tree structure
   used by spams.proximalTree, spams.fistaTree or spams.structTrainDL
}
\usage{
spams.treeOfGroupStruct(gstruct)
}
\arguments{
\item{gstruct}{%
the structure of groups as a list, one element per node
\preformatted{%
an element is itself a 4 lements list:
nodeid (>= 0), weight (double), array of vars associated to the node,
array of children (nodeis's)
}}
}
\value{
\item{permutations}{%
permutation vector that must be applied to the result of the
\preformatted{%
programm using the tree. Empty if no permutation is needed.
}}
\item{tree}{%
named list (see documentation of spams.proximalTree)
\preformatted{%
}}
\item{nbvars}{%
number of variables in the tree
\preformatted{%
res <- spams.treeOfGroupStruct(gstruct)
permutations = res[[1]]
tree = res[[2]]
nbvars = res[[3]]
}}
}
\author{
Jean-Paul CHIEZE, 2012
}
