# The purpose of codegen is to generate all space-time block codes 
# (STBC) used as training data for communication systems.
# the result generated will be an stbc object with four vectors
library(pracma)
codegen <- function (type='prbs', length=0){
  a1=NULL; b1=NULL; a2=NULL; b2=NULL ##init
  
  # --- Generate STBC code for type = 'prbs' ---
  if (type=='prbs'){
    a1<-(rbinom(length,1,0.5)*2-1)+1i*(rbinom(length,1,0.5)*2-1)
    b1<-vector("numeric",length);
    a2<-a1;
    b2<-b1;
  }
  
  # --- Generate STBC code for type = 'mseq' ---
  if (type=='mseq'){
    outputSeq<-vector("numeric",(length-1))
    shiftRegLgth <- log2(length)
    shiftReg <- rbinom(shiftRegLgth, 1, 0.5)
    for (i in 1:(length-1)){
      #pull the output out of shift register
      outputSeq[i]<-shiftReg[shiftRegLgth]
      #feed back mechanism
      c <- xor(shiftReg(shiftRegLgth),shiftReg(shiftRegLgth-1))
      shiftReg <- c(c, shiftReg[1:(shiftRegLgth-1)])
    }
    a1 <- outputSeq
    b1 <- vector("numeric",length);
    a2 <- a1; b2 <- b1
  }
  
  # --- Generate STBC code for type = 'chu' ---
  if (type=='chu'){
    Q1 <- vector("numeric",length)
    for (k in 0:(length-1)){
      Q1[(k+1)] <- pi*k^2/length
    }
    I <- cos(Q1); Q <- sin(Q1)
    a1 <- 1i*Q+I
    b1 <- circshift(a1,length/2)
    a2 <- Conj((fliplr(as.matrix(a1))))
    b2 <- -Conj(fliplr(as.matrix(b1)))
  }
  if (type=='prbs'){
    
  }
  if (type=='prbs'){
    
  }
  stbc<-list(a1=a1,b1=b1,a2=a2,b2=b2)
  return(stbc)
}