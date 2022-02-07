\encoding{latin1}
\name{spams.simpleGroupTree}
\alias{spams.simpleGroupTree}
\title{
spams.simpleGroupTree
}
\description{
    makes a structure representing a tree given the
  degree of each level.
}
\usage{
spams.simpleGroupTree(degrees)
}
\arguments{
\item{degrees}{%
int vector; degrees(i) is the number of children of each node at level i
\preformatted{%
}}
}
\value{
\item{group_struct}{%
list, one element for each node
\preformatted{%
an element is itsel a 4 elements list :
nodeid (int >= 0), weight (double), array of vars attached to the node
(here equal to [nodeid]), array of children (nodeid's)
}}
}
\author{
Jean-Paul CHIEZE, 2012
}
