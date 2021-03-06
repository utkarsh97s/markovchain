\name{predictiveDistribution}
\alias{predictiveDistribution}
\title{
Function to compute the probability of observing a new data set, given a data set
}
\description{
The function computes the probability of observing a new data set using information from a given data set. Additionally, hyperparameters can be provided.
}
\usage{
predictiveDistribution(stringchar, newData, hyperparam = matrix())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{stringchar}{
This is the data using which the Bayesian inference is performed.
}
  \item{newData}{
This is the data whose predictive probability is computed.  
}
  \item{hyperparam}{
This determines the shape of the prior distribution of the parameters. If none is provided, default value of 1 is assigned to each parameter. This must be of size kxk where k is the number of states in the chain and the values should typically be non-negative integers.
}
}
\details{
The underlying method is Bayesian inference. The probability is computed by averaging the likelihood of the new data with respect to the posterior. Since the method assumes conjugate priors, the result can be represented in a closed form (see the vignette for more details), which is what is returned.
}
\value{
The log of the probability is returned.
}
\references{
Inferring Markov Chains: Bayesian Estimation, Model Comparison, Entropy Rate, and Out-of-Class Modeling, Christopher C. Strelioff, James P. Crutchfield, Alfred Hubler, Santa Fe Institute

Yalamanchi SB, Spedicato GA (2015). Bayesian Inference of First Order Markov Chains. R
package version 0.2.5
}
\author{
Sai Bhargav Yalamanchi
}

\seealso{
\code{\link{markovchainFit}}
}
\examples{
sequence<-c("a", "b", "a", "a", "a", "a", "b", "a", "b", "a", "b", "a", "a", 
"b", "b", "b", "a")
hyperMatrix<-matrix(c(1, 2, 1, 4), nrow = 2,dimnames=list(c("a","b"),c("a","b")))
predProb <- predictiveDistribution(sequence[1:10], sequence[11:17], hyperparam =hyperMatrix )
hyperMatrix2<-hyperMatrix[c(2,1),c(2,1)]
predProb2 <- predictiveDistribution(sequence[1:10], sequence[11:17], hyperparam =hyperMatrix2 )
predProb2==predProb
}