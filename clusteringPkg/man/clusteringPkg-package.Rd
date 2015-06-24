\name{clusteringPkg-package}
\alias{clusteringPkg-package}
\alias{clusteringPkg}
\docType{package}

\title{Generate cluster memberships}

\description{Estimate the clustering memberships for colmns and rows of a given matrix respectively. Data are clustered based on hierarchical clustering algorithm from the vegan R package or bi-clustering from the blockcluster R package. }

\details{
\tabular{ll}{
Package: \tab clusteringPkg\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-05-14\cr
License: \tab GPL-2\cr
}
Estimate cluster memberships for a given data matrix. Important functions are generate.biclust.model and generate.hierar.model.
}

\author{
Georgia Tsiliki

Maintainer: Georgia Tsiliki <gtsiliki@central.ntua.gr>
}

\references{Help files of blockcluster and vegan packages }

\keyword{ package }


\examples{

data("dat11")

predF<- list()

required.param<- list(xID="proteins", yID=list(), distMethod="manhattan",
hclustMethod="ward.D2",nORh="mean")

hierar1<- generate.hierar.model(dat11,predF,required.param)

}
