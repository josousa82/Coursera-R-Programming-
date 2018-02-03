## Script  that loads the csv
## file and clean the data.
## Also checks if the data 
## cleaned is cached, in 
## cache function, if not 
## will cache the data, for 
## time reduction on access
## will return data frame ready 
## to work for itch function

read.dataset <- function(directory = c("Data"), file){
  
     path.to.file <- file.path(directory, file)
     dataset <- read.csv(path.to.file)
     dataset 
}


##best function
clean.best <- function(path = as.character(), filecsv= as.character()){
    
dataset.b <- read.dataset(path, filecsv)
 
colnames.df <- c(".Hospital", ".St", ".Mortality.H.Attack", 
                ".Mortality.H.Failure", ".Mortality.Pneumonia")

names.hosp.30day.state <- c("Hospital.Name", "State", 
                            "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                            "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
                            "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
                            )
attach(dataset.b)

df.final <- dataset.b %>% select(names.hosp.30day.state)

colnames(df.final) <- c(".Hospital", ".St", ".Mortality.H.Attack", 
                       ".Mortality.H.Failure", ".Mortality.Pneumonia")

df.final <- df.final %>% 
            transform(.Mortality.H.Attack = as.numeric(.Mortality.H.Attack),
                                   .Mortality.H.Failure = as.numeric(.Mortality.H.Failure), 
                                   .Mortality.Pneumonia = as.numeric(.Mortality.Pneumonia), 
                                   .St = as.factor(.St)) %>%
            gather(condition, rate, .Mortality.H.Attack:.Mortality.Pneumonia)%>%
            na.omit()

df.final
}


##sub.df.final <- subset(x = df.final, subset = .St == "TX")

##test.gat.df.g <- gather(test.gat.df, condition, value, .Mortality.H.Attack:.Mortality.Pneumonia, factor_key = TRUE)
##test.gat.df.g <- transform(test.gat.df.g, .St = as.factor(.St))
##vect.states <- levels(factor(test.gat.df.g$.St))

## df.clean[df.clean$.St == "TX" & condition == ".Mortality.H.Attack",  ]%>%
## arrange(-desc(rate))%>%
## head()