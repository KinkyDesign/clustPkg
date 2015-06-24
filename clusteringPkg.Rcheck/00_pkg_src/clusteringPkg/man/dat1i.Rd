\name{dat1i}
\alias{dat1i}
\docType{data}

\title{Information for bi-clustering }

\description{A list with information for bi-clustering given by blockcluser package}

\usage{data("dat1i")}

\format{
  A list with 4 objects:
  \describe{
  \item{\code{ICL}}{Integrated complete likelihood value as returned by blockcluster package}
  \item{\code{Summary}}{Summary of bi-clust model}
  \item{\code{modelImages}}{A serialized jpeg file of a heatmap produced by blockcluster}
  \item{\code{predictedFeatures}}{The character string 'clusterMemberships' to indicate the new vector created including all predicted clustering memberships}
  }
}

\details{Example dataset to predict with dat1p, dat1m}

\source{The source of this function is in the}

\references{There are no references}

\examples{
data(dat1i)
## maybe str(dat1i) ; plot(dat1i) ...
}

\keyword{datasetsi}
