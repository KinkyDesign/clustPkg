generate.biclust.model <-
function(dataset,predictionFeature,parameters){
    #returns clustering classes for proteins and NPs
    
    #dataset:= list of 2 objects - 
    #datasetURI:= character sring, code name of dataset
    #dataEntry:= data.frame with 2 columns, 
    #1st:name of compound,2nd:data.frame with values (colnames are feature names)
    #predictionFeature:= irrelevant here
    #parameters:= a list of 4 objects: 
    #xID:= character sring to identify what are the column features
    #yID:= character string to identify what are the row features
    #datatype:= This is the type of data which can be "binary" , "contingency", "continuous" or "categorical".
    #nclust:= numeric vector indicating the number of clusters for GOs(x axis) and proteins (y axis). Default value c(5,4).	
    #RETURN:
    #rawModel:= serialized list with classes for xID (colClasses) and yID (rowClasses) 
    #pmmlModel:= null
    #independentFeatures:= names of independent features (ambit)
    #predictedFeatures:= names of predicted features - here null
    #additionalInfo:= a list with 3 objects: ICL (ICL), summary of bicluster (Summary),
    #jpeg file with biclustering of the data (modelImage)
    
    
    
    prot.data<- dataset$dataEntry[,2]#d1$x.mat
    prot.n<- colnames(prot.data)
    #parameters<- d1$model#key='UNIPROT',onto=c('GO','MF'),pvalCutoff=0.05,nclust=c(5,4),FUN=mean)
    
    #prot.data:=data frame with proteomics data, columns are proteins, rows are NPs
    
    names1<- lapply(strsplit(prot.n,'/'),unlist)
    names2<- unlist(lapply(names1,function(x)(return(x[length(x)]))))
    rm(names1)
    
    colnames(prot.data)<- names2
    prot.ids<- names2
    
    
    set.seed(1)
    newstrategy <- cocluststrategy (nbtry =5, nbxem =10 , algo =' XCEMStrategy ',stopcriteria='Likelihood')
    clust.mod<- cocluster(as.matrix(prot.data),parameters$datatype,nbcocluster=parameters$nclust)
    #NA KOITAKSW AN SUNEXIZEI KAI VGAZEI DIAFORETIKA CLUSTERS ANA RUN- isws an aukshsw ton arithmo twn iterations
    
    clust.rowclass<- clust.mod@rowclass
    clust.colclass<- clust.mod@colclass
    clust.go.ICL<- clust.mod@ICLvalue
    jpeg.address<- paste(getwd(),'/graphBiclust.jpg',sep='')
    jpeg(jpeg.address)#("C:/Users/graph4.pdf")#paste("/var/www/html/images/","graph4.pdf",sep='')
    plot(clust.mod)
    dev.off()
    jpg1<- readJPEG(jpeg.address)
    jpg.ser<- serialize(jpg1,connection=NULL)	
    
    clust.class.ser<- serialize(list(colClasses=clust.colclass,rowClasses=clust.rowclass),connection=NULL)
    #p1.pmml<- pmml(p1)
    #p1.pmml<- toString(p1.pmml)
    #pdfLink<- paste('http://147.102.82.122/images/',)
    
    #pred.name<- paste('rowClust',1:length(unique(clust.rowclass)),sep=' ')
    #pred.name<- c(pred.name,paste('colClust',1:length(unique(clust.colclass)),sep=' '))
    pred.name<- 'clusterMemberships'
    
    m1.ser.list<- list(rawModel=clust.class.ser,pmmlModel=NULL,independentFeatures=prot.n,
                       predictedFeatures=pred.name,#NULL,
                       additionalInfo=list(ICL=clust.go.ICL,Summary=summary(clust.mod),#,PDFlink=''
                                           modelImages=jpg.ser,predictedFeatures=pred.name))
    
    rm(newstrategy, clust.mod)
    
    return(m1.ser.list)
    
}
