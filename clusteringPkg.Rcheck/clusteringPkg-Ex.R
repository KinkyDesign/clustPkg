pkgname <- "clusteringPkg"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('clusteringPkg')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("clusteringPkg-package")
### * clusteringPkg-package

flush(stderr()); flush(stdout())

### Name: clusteringPkg-package
### Title: Generate cluster memberships
### Aliases: clusteringPkg-package clusteringPkg
### Keywords: package

### ** Examples


data("dat11")

predF<- list()

required.param<- list(xID="proteins", yID=list(), distMethod="manhattan",
hclustMethod="ward.D2",nORh="mean")

hierar1<- generate.hierar.model(dat11,predF,required.param)




cleanEx()
nameEx("dat1")
### * dat1

flush(stderr()); flush(stdout())

### Name: dat1
### Title: A sample data object
### Aliases: dat1
### Keywords: datasets

### ** Examples

data(dat1)
## maybe str(dat1) ; plot(dat1) ...



cleanEx()
nameEx("dat11")
### * dat11

flush(stderr()); flush(stdout())

### Name: dat11
### Title: A sample data object
### Aliases: dat11
### Keywords: datasets

### ** Examples

data(dat11)
## maybe str(dat11) ; plot(dat11) ...



cleanEx()
nameEx("dat11i")
### * dat11i

flush(stderr()); flush(stdout())

### Name: dat11i
### Title: Information for hierarchical clustering
### Aliases: dat11i
### Keywords: datasetsi2

### ** Examples

data(dat11i)
## maybe str(dat11i) ; plot(dat11i) ...



cleanEx()
nameEx("dat11m")
### * dat11m

flush(stderr()); flush(stdout())

### Name: dat11m
### Title: Serialized hierarchical clustering model file
### Aliases: dat11m
### Keywords: datasetsm2

### ** Examples

data(dat11m)
## maybe str(dat11m) ; plot(dat11m) ...



cleanEx()
nameEx("dat11p")
### * dat11p

flush(stderr()); flush(stdout())

### Name: dat11p
### Title: A sample data object
### Aliases: dat11p
### Keywords: datasetsp2

### ** Examples

data(dat11p)
## maybe str(dat11p) ; plot(dat11p) ...



cleanEx()
nameEx("dat1i")
### * dat1i

flush(stderr()); flush(stdout())

### Name: dat1i
### Title: Information for bi-clustering
### Aliases: dat1i
### Keywords: datasetsi

### ** Examples

data(dat1i)
## maybe str(dat1i) ; plot(dat1i) ...



cleanEx()
nameEx("dat1m")
### * dat1m

flush(stderr()); flush(stdout())

### Name: dat1m
### Title: Serialized bi-clust model file
### Aliases: dat1m
### Keywords: datasetsm

### ** Examples

data(dat1m)
## maybe str(dat1m) ; plot(dat1m) ...



cleanEx()
nameEx("dat1p")
### * dat1p

flush(stderr()); flush(stdout())

### Name: dat1p
### Title: A sample data object
### Aliases: dat1p
### Keywords: datasetsp

### ** Examples

data(dat1p)
## maybe str(dat1p) ; plot(dat1p) ...



cleanEx()
nameEx("generate.biclust.model")
### * generate.biclust.model

flush(stderr()); flush(stdout())

### Name: generate.biclust.model
### Title: Generate bi-clustering model based on blockcluster package.
### Aliases: generate.biclust.model
### Keywords: generateBiclustModel

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1")

predF<- list()

required.param<- list(xID='proteins',yID='NPs',datatype='categorical',nclust=c(1,2))

biclust1<- generate.biclust.model(dat1,predF,required.param)




cleanEx()
nameEx("generate.hierar.model")
### * generate.hierar.model

flush(stderr()); flush(stdout())

### Name: generate.hierar.model
### Title: Generate bi-clustering model based on vegan package.
### Aliases: generate.hierar.model
### Keywords: generateHierarClustGOdescrModel

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat11")

predF<- list()

required.param<- list(xID="proteins", yID=list(), distMethod="manhattan",
hclustMethod="ward.D2",nORh="mean")

hierar1<- generate.hierar.model(dat11,predF,required.param)




cleanEx()
nameEx("pred.clusters")
### * pred.clusters

flush(stderr()); flush(stdout())

### Name: pred.clusters
### Title: Returns clustermemberships
### Aliases: pred.clusters
### Keywords: predclust

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

data("dat1p")
data("dat1m")
data("dat1i")

pred.res<- pred.clusters(dat1p, dat1m, dat1i) 




### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
