corr<-function(directory,threshold=0){
  D<-complete(directory,1:332)
  E<-(subset(D,D$NOBS>threshold,select=c("ID")))
  F<-as.vector(t(E))
  #print(E)
  g<-select(directory,F)
  print(g)
  
}
