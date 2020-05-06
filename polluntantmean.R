pollutantname<-function(directory,pollutant,id){
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
