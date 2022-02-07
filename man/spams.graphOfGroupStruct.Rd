\encoding{latin1}
\name{spams.graphOfGroupStruct}
\alias{spams.graphOfGroupStruct}
\title{
spams.graphOfGroupStruct
}
\description{
    converts a group structure into the graph structure
   used by spams.proximalGraph, spams.fistaGraph or spams.structTrainDL
}
\usage{
spams.graphOfGroupStruct(gstruct)
}
\arguments{
\item{gstruct}{%
the structure of groups as a list, one element per node
\preformatted{%
an element is itself a 4 elements list:
nodeid (>= 0), weight (double), array of vars associated to the node,
array of children (nodeis's)
}}
}
\value{
\item{graph}{%
struct (see documentation of spams.proximalGraph)
\preformatted{%
}}
}
\author{
Jean-Paul CHIEZE, 2012
}
