pred.clusters <-
function(dataset,rawModel,additionalInfo){
    #dataset:= list of 2 objects - 
    #datasetURI:= character sring, code name of dataset
    #dataEntry:= data.frame with 2 columns, 
    #1st:name of compound,2nd:data.frame with values (colnames are feature names)
    #rawModel:= numeric vector showing cluster memberships   
    #additionalInfo:= list with summary clustering statistisc and graphs
    #returns array with cluster memberships per dimension
    
    
    #d1<- read.in.json.for.pred(dataset,rawModel,additionalInfo)
    #prot.data<- d1$x.mat
    #clust.classes<- d1$model#
    #adInfo<- d1$additionalInfo
    dat1.m<- rawModel
    dat1.m<- base64Decode(dat1.m,'raw')
    clust.classes<- unserialize(dat1.m)
    
    if(is.list(clust.classes)==FALSE){
        clust.name<- additionalInfo$predictedFeatures#paste('cluster',1:length(unique(clust.classes)),sep=' ')
        
    }else{
        clust.name<- additionalInfo$predictedFeatures
        #clust.name<- paste('rowClust',1:length(unique(clust.classes[[2]])),sep=' ')
        #clust.name<- c(clust.name,paste('colClust',1:length(unique(clust.classes[[1]])),sep=' '))
        
        clust.classes<- unlist(clust.classes)
        names(clust.classes)<- NULL # ! until we solve the issue! 
    }
    
    #clust.classes<- as.data.frame(clust.classes)
    #colnames(clust.classes)<- clust.name
    for(i in 1:length(clust.classes)){
        w1<- data.frame(clust.classes[i])
        colnames(w1)<- clust.name
        if(i==1){p7.1<- list(unbox(w1))
        }else{
            p7.1[[i]]<- unbox(w1)
        }
    }
    p7.2<- list(predictions=p7.1)
    
    
    return(p7.2)#clust.classes)#as.data.frame(as.array())
}
