\name{generate.biclust.model}
\alias{generate.biclust.model}

\title{Generate bi-clustering model based on blockcluster package.}

\description{Estimate the clustering memberships for colmns an drows of a given matrix respectively. Data are clustered based on bi-clustering algorithm from the blockcluster R package using default values. The user needs to specify the number of clusters for each axes. }

\usage{
generate.biclust.model(dataset, predictionFeature, parameters)
}

\arguments{
  \item{dataset}{list of 2 objects, datasetURI:= character sring, code name of dataset, dataEntry:= data frame with 2 columns }
  \item{predictionFeature}{ character string specifying which is the prediction feature in dataEntry }
  \item{parameters}{list with parameter values for biclustering. 4 objects should be included, i.e. 'xID' the ID of values in x axis, 'yID' the ID of values in y axis, 'datatype' the data type of the dataset (one of "binary" , "contingency", "continuous" or
"categorical".), 'nclust' a numeric vector indicating the number of clusters for x axis and y axis (e.g. c(5,4)).
}
}

\details{ No details required }

\value{A List 
  \item{rawModel}{ A serialized GO descriptors object (class raw) giving the cluster memberships of proteins/genes in the data.}
  \item{pmmlModel}{ A pmml object - now empty}
  \item{predictedFeatures}{A character vector with names for the new descriptors}
  \item{independentFeatures}{ A list with Ambit names for all genes/ proteins features included in the model }
  \item{additionalInfo}{ A list including the following: ICL (Integrated complete likelihood value as returned by blockcluster package), Summary (Summary of bi-clust model), modelImages (A serialized jpeg file of a heatmap produced by blockcluster), predictedFeatures (The character string 'clusterMemberships' to indicate the new vector created including all predicted clustering memberships).}
}

\references{The help file of blockcluster package }

\author{ Georgia Tsiliki }

\note{ No notes for this function }

\seealso{
\code{\link{generate.hierar.model}}
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1")

predF<- list()

required.param<- list(xID='proteins',yID='NPs',datatype='categorical',nclust=c(1,2))

biclust1<- generate.biclust.model(dat1,predF,required.param)

}

\keyword{ generateBiclustModel }
