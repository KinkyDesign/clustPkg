\name{generate.hierar.model}
\alias{generate.hierar.model}

\title{Generate bi-clustering model based on vegan package.}

\description{Estimate the clustering memberships for colmns and rows of a given matrix respectively. Data are clustered based on hierarchical clustering algorithm from the vegan R package using default values. The user needs to specify the number of clusters or the height of the dendrogram. 
}

\usage{
generate.hierar.model(dataset, predictionFeature, parameters)
}

\arguments{
  \item{dataset}{list of 2 objects, datasetURI:= character sring, code name of dataset, dataEntry:= data frame with 2 columns }
  \item{predictionFeature}{ character string specifying which is the prediction feature in dataEntry }
  \item{parameters}{list with parameter values for hierarchical clustering. 5 objects should be included, i.e. 'xID' the ID of values in x axis, 'yID' the ID of values in y axis, distance method (could be one of those provided via vegan R package), 'hclustMethod' (could be one of those provided via vegan R package), 'nORh' either a numeric value or character giving number of clusters or a function to define height respectively.
}
}

\details{ No details required }

\value{A List 
  \item{rawModel}{ A serialized GO descriptors object (class raw) giving the cluster memberships of proteins/genes in the data.}
  \item{pmmlModel}{ A pmml object - now empty}
  \item{independentFeatures}{ A list with Ambit names for all genes/ proteins features included in the model }
    \item{predictedFeatures}{A character vector with names for the new descriptors}
  \item{additionalInfo}{ A list including the following: ICL (Integrated complete likelihood value as returned by blockcluster package), Summary (Summary of hierarchical clustering model), modelImages (A serialized jpeg file of a dedrogram), predictedFeatures (The character string 'clusterMemberships' to indicate the new vector created including all predicted clustering memberships).}
}

\references{ The help file of skeleton }

\author{Georgia Tsiliki}

\note{ No notes for this function }

\seealso{
\code{\link{generate.biclust.model}}
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat11")

predF<- list()

required.param<- list(xID="proteins", yID=list(), distMethod="manhattan",
hclustMethod="ward.D2",nORh="mean")

hierar1<- generate.hierar.model(dat11,predF,required.param)

}


\keyword{ generateHierarClustGOdescrModel }
