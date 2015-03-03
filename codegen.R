# The purpose of codegen is to generate all space-time block codes 
# (STBC) used as training data for communication systems.
# the result generated will be an stbc object with four vectors
codegen <- function (type='prbs', length=0){
  a1=NULL; b1=NULL; a2=NULL; b2=NULL ##init
  
  # --- Generate STBC code for type = prbs ---
  if (type=='prbs'){
    a1<-(rbinom(length,1,0.5)*2-1)+1i*(rbinom(length,1,0.5)*2-1)
    b1<-vector("numeric",length);
    a2<-a1;
    b2<-b1;
  }
  
  # --- Generate STBC code for type = mseq ---
  if (type=='mseq'){
    shiftRegLgth <- log2(length)
    shiftReg <- rbinom(shiftRegLgth, 1, 0.5)
    for (i in 1:length-1){
      
    }
  }
  
  if (type=='prbs'){
    
  }
  if (type=='prbs'){
    
  }
  if (type=='prbs'){
    
  }
  stbc<-list(a1=a1,b1=b1,a2=a2,b2=b2)
  return(stbc)
}