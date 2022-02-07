\encoding{latin1}
\name{spams.groupStructOfString}
\alias{spams.groupStructOfString}
\title{
spams.groupStructOfString
}
\description{
    decode a multi-line string describing "simply" the structure of groups
   of variables needed by spams.proximalGraph, spams.proximalTree, spams.fistaGraph,
   spams.fistaTree and spams.structTrainDL and builds the corresponding group structure.
}
\usage{
spams.groupStructOfString(s)
}
\arguments{
\item{s}{%
the multi-lines string
\preformatted{%
}}
}
\details{
\preformatted{%

    Each line describes a group of variables as a node of a tree.
    It has up to 4 fields separated by spaces:
        node-id node-weight [variables-list] -> children-list
    Let's define Ng = number of groups, and Nv = number of variables.
    node-id must be in the range (0 - Ng-1), and there must be Ng nodes
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
