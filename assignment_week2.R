corr<-function(directory,threshold=0){
  D<-complete(directory)
  E<-(subset(D,D$NOBS>threshold,select=c("ID")))
  F<-as.vector(t(E))
  #print(E)
  g<-select(directory,F)
  print(g)
  
}

select<-function(directory,file_num){
  n<-length(file_num)
  if(n>0){
  z<-as.vector(n)
  dat<-data.frame()
  setwd(directory)
  files<-list.files()
  for(i in 1:n){
    file<-file_num[i]
    dat<-read.csv(files[file])
    dat1<-na.omit(dat)
    z[i]<-as.vector(cor(dat1$sulfate,dat1$nitrate))
  }
  z
  }
  else{
    NULL
  }
}

complete<-function(directory,id=1:332){
  setwd(directory)
  dat<-data.frame()
  dat1_final<-data.frame()
  files<-list.files()
  for(i in min(id):max(id))
  {
    # dat<-read.csv(files[i])
    dat<-rbind(dat,read.csv(files[i]))
    
    
  }
  dat_na<-na.omit(dat)
  dat_na
  # c<-data.frame(table(dat_na$ID))
  c<-aggregate(dat_na$ID,by=list(dat_na$ID), FUN=length)
  colnames(c)<-c("ID","NOBS")
  c
}


pollutantname<-function(directory,pollutant,id=1:332){
  dir<-as.character(directory)
  dat<-data.frame()
  setwd(dir)
  files<-list.files()
  for(i in min(id):max(id)){
    # {file2<- as.list(files[id])}
    dat<-rbind(dat,read.csv(files[i]))
  }
  if(pollutant=="sulfate"){
    dat1<-dat[,c("sulfate")]
    pollutant<-mean(dat1,na.rm=TRUE)
  }else {
    dat1<-dat[,c("nitrate")]
    pollutant<-mean(dat1,na.rm=TRUE)
  }
  pollutant
}