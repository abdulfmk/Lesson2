function(k) {
  if(k<10) {
    paste("00",k,".csv",sep="")
  }else if(k>9 & k<100){
    paste("0",k,".csv",sep="")
  }else{
    paste(k,".csv",sep="") 
  }
}