require(dplyr)

best <- function(state, outcome2 = c("heart failure", "heart attack", "pneumonia")){
    
    print(paste0("primeiro resultado outcome arg:  ", outcome2))

    outcome2 <-  try_default(match.arg(outcome2), " " ,  quiet = FALSE) 
    
    
    if(outcome2 == "heart attack"){
        
        outcome2 <- c(".Mortality.H.Attack")
        
    }else if(outcome2 == "heart failure" ){
        
        outcome2 <- (".Mortality.H.Failure")
        
    }else if( outcome2 == "pneumonia"){ outcome2 <- c(".Mortality.Pneumonia")}
    print(paste0("segundo resultado outcome arg:  ", outcome2))
    result <- cleanOutcome %>% select(.Hospital,.St, outcome2) %>% na.omit(outcome2)
    
    ##esult %>% arrange(desc(.Mortality.H.Failure))
    
    ##resul,min(result[ ,outcome2])]
    
    head(result)
    
}


