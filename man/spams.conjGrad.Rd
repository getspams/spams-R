\encoding{latin1}
\name{spams.conjGrad}
\alias{spams.conjGrad}
\title{
spams.conjGrad
}
\description{
    Conjugate gradient algorithm, sometimes faster than the 
   equivalent R function solve. In order to solve Ax=b;
}
\usage{
spams.conjGrad(A,b,x0 = NULL,tol = 1e-10,itermax = NULL)
}
\arguments{
\item{A}{%
double square n x n matrix. HAS TO BE POSITIVE DEFINITE
\preformatted{%
}}
\item{b}{%
double vector of length n.
\preformatted{%
}}
\item{x0}{%
double vector of length n. (optional) initial guess.
\preformatted{%
}}
\item{tol}{%
(optional) tolerance.
\preformatted{%
}}
\item{itermax}{%
(optional) maximum number of iterations.
\preformatted{%
}}
}
\value{
\item{x}{%
double vector of length n.
\preformatted{%
}}
}
\author{
Julien MAIRAL, 2009 (spams, matlab interface and documentation)
Jean-Paul CHIEZE 2011-2012 (R interface)
}
