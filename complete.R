complete<-function(directory,id=1:332){
  setwd(directory)
  dat<-data.frame()
  id<-as.vector(id)
  dat1_final<-data.frame()
  n<-length(id)
 # j<-vector(n)
  files<-list.files()
  for(i in 1:n)
  {
    f<-id[i]
    # dat<-read.csv(files[f])
    dat<-rbind(dat,read.csv(files[f]))
    
    
  }
  dat_na<-na.omit(dat)
  dat_na
  # c<-data.frame(table(dat_na$ID))
  c<-aggregate(dat_na$ID,by=list(dat_na$ID), FUN=length)
  colnames(c)<-c("ID","NOBS")
  c
}