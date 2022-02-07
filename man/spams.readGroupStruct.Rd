\encoding{latin1}
\name{spams.readGroupStruct}
\alias{spams.readGroupStruct}
\title{
spams.readGroupStruct
}
\description{
    reads a text file describing "simply" the structure of groups
   of variables needed by spams.proximalGraph, spams.proximalTree, spams.fistaGraph,
   spams.fistaTree and spams.structTrainDL and builds the corresponding group structure.
}
\usage{
spams.readGroupStruct(file)
}
\arguments{
\item{file}{%
the file name
\preformatted{%
}}
}
\details{
\preformatted{%

    weight is a float
    variables-list : a space separated list of integers, maybe empty,
        but '[' and '] must be present. Numbers in the range (0 - Nv-1)
    children-list : a space separated list of node-id's
        If the list is empty, '->' may be omitted.
    The data must obey some rules : 
        - A group contains the variables of the corresponding node and of the whole subtree.
        - Variables attached to a node are those that are not int the subtree.
        - If the data destination is a Graph, there may be several independant trees,
           and a varibale may appear in several trees.
    If the destination is a Tree, there must be only one tree, the root node
        must have id == 0 and each variable must appear only once.
}
}
\value{
\item{groups}{%
list, one element for each node
\preformatted{%
an element is itsel a 4 elements list:
nodeid (int >= 0), weight (double), array of vars of the node,
array of children (nodeid's)
}}
}
\author{
Jean-Paul CHIEZE, 2012
}
