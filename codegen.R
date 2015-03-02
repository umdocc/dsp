# The purpose of codegen is to generate all space-time block codes 
# (STBC) used as training data for communication systems.
# the result generated will be an stbc object with four vectors
codegen <- function (type='prbs', length=0){
  if (type=='prbs'){
    a1<-(rbinom(length,1,0.5)*2-1)+1i*(rbinom(length,1,0.5)*2-1)
    b1<-vector("numeric",length);
    a2<-a1;
    b2<-b1;
  }
  stbc<-list(a1=a1,b1=b1,a2=a2,b2=b2)
  return(stbc)
}