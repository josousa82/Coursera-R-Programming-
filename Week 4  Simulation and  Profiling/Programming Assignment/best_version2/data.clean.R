## Script  that loads the csv
## file and clean the data.
## Also checks if the data 
## cleaned is cached, in 
## cache function, if not 
## will cache the data, for 
## time reduction on access
## will return data frame ready 
## to work for itch function




## Dataset cleaning for best function
clean.best <- function(path , filecsv, tf = as.character(), ch.df, ...){
    
    
    cleandf <- ch.df$get.df
    
    if(!is.null(cleandf)) 
        message("Getting Data")
        return(cleandf)
    ## call function that reads the csv file
    
    dataset.b <- read.dataset(path, filecsv)
    
    ## col names rename vector
    colnames.df <- c(".Hospital", ".St", ".Mortality.H.Attack", 
                     ".Mortality.H.Failure", ".Mortality.Pneumonia")
    
    
    ## col to select from the data frame for function best.R
    
    names.hosp.30day.state <- c("Hospital.Name", "State", 
                                "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                                "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
                                "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    )
    
    ## attach dataset to R search path
    attach(dataset.b)
    
    ## select col for final df for function best
    
    df.final <- dataset.b %>% select(names.hosp.30day.state)
    
    ## rename col names in final data frame
    
    colnames(df.final) <- c(".Hospital", ".St", ".Mortality.H.Attack", 
                            ".Mortality.H.Failure", ".Mortality.Pneumonia")
    
    
    suppressWarnings(df.final <- df.final %>% 
                         transform(.Mortality.H.Attack = as.numeric(.Mortality.H.Attack),
                                   .Mortality.H.Failure = as.numeric(.Mortality.H.Failure), 
                                   .Mortality.Pneumonia = as.numeric(.Mortality.Pneumonia), 
                                   .St = as.factor(.St)) %>%
                         gather(condition, rate, .Mortality.H.Attack:.Mortality.Pneumonia)%>%
                         na.omit())
    
    
    if(tf == "best"){
        
        df.final <- dplyr::mutate(df.final, condition =  recode(condition, .Mortality.H.Attack = "heart attack",
                                                                .Mortality.H.Failure = "heart failure",
                                                                .Mortality.Pneumonia = "pneumonia"))
        
    }
    detach(dataset.b)
    df.final
    
}