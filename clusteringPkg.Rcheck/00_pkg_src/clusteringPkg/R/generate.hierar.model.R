generate.hierar.model <-
function(dataset,predictionFeature,parameters){
    #returns clustering classes for proteins or NPs
    
    #dataset:= list of 2 objects - 
    #datasetURI:= character sring, code name of dataset
    #dataEntry:= data.frame with 2 columns, 
    #1st:name of compound,2nd:data.frame with values (colnames are feature names)
    #predictionFeature:= irrelevant here
    #parameters:= a list of 5 objects: 
    #xID:= character sring to identify what are the column features
    #yID:= character string to identify what are the row features
    #distMethod:= distance method, could be "manhattan", "euclidean", "canberra", "bray", "kulczynski", 
    #"jaccard", "gower", "altGower", "morisita", "horn", "mountford", "raup" , "binomial", "chao", "cao" 
    #or "mahalanobis"
    #hclustMethod:=hierarchical clustering method, the agglomeration method to be used.
    #This should be (an unambiguous abbreviation of) one of "ward.D", "ward.D2", "single", "complete", 
    #"average" (= UPGMA), "mcquitty" (= WPGMA), "median" (= WPGMC) or "centroid" (= UPGMC).
    #nORh:= either numeric or character giving number of clusters or a function to define height respectively.
    #RETURN:
    #rawModel:= ? 
    #returns in additionalInfo the system names of properties (proteins)
    #additionalInfo:= FOR LM MODEL what are the features used for setting the model,
    #data frame with 2 columns: 1st  ModelCoef giving the dummy coefficient names produced for independent
    #features in the model, and 2nd RealFeatureNames which are ambit's feature names
    
    
    prot.data<- dataset$dataEntry[,2]#d1$x.mat
    prot.n<- colnames(prot.data)
    
    names1<- lapply(strsplit(prot.n,'/'),unlist)
    names2<- unlist(lapply(names1,function(x)(return(x[length(x)]))))
    rm(names1)
    
    colnames(prot.data)<- names2
    prot.ids<- names2
    
    set.seed(15)
    d <- vegdist(prot.data,method = parameters$distMethod,binary=TRUE)#"euclidean"#manhattan
    
    fit <- hclust(d, method=parameters$hclustMethod)#"ward.D2")
    q1<- parameters$nORh
    if(is.numeric(q1)==TRUE){
        class.cprot.Hlabels<- as.vector(cutree(fit,k=q1))
    }else{
        class.cprot.Hlabels<- as.vector(cutree(fit,h=get(q1)(fit$height)))#mean
    }
    
    
    
    clust.go.colclass<- class.cprot.Hlabels
    #names(clust.go.colclass)<- colnames(prot.data)
    
    jpeg.address<- paste(getwd(),'/graphHierar.jpg',sep='')
    jpeg(jpeg.address)#("C:/Users/graph4.pdf")#paste("/var/www/html/images/","graph4.pdf",sep='')
    plot(fit)
    dev.off()
    jpg1<- readJPEG(jpeg.address)
    jpg.ser<- serialize(jpg1,connection=NULL)	
    
    
    clust.go.colclass.ser<- serialize(clust.go.colclass,connection=NULL)
    #p1.pmml<- pmml(p1)
    #p1.pmml<- toString(p1.pmml)
    
    pred.name<- 'clusterMemberships'#paste('')#paste('cluster',1:length(unique(clust.go.colclass)),sep=' ')
    
    m1.ser.list<- list(rawModel=clust.go.colclass.ser,pmmlModel=NULL,independentFeatures=prot.n,
                       predictedFeatures=pred.name,#NULL,
                       additionalInfo=list(Summary=summary(fit),modelImage=jpg.ser,predictedFeatures=pred.name))
    rm(d,fit)
    
    return(m1.ser.list)
    
}
