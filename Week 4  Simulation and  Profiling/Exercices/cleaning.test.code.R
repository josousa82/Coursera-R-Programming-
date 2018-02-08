filePath <- file.path("Data", "outcome-of-care-measures.csv")
outcome.df <- read.csv(filePath, colClasses = "character")
colnames.df <- c(".Hospital", ".St", ".Mortality.H.Attack", 
                 ".Mortality.H.Failure", ".Mortality.Pneumonia")

names.hosp.30day.state <- c("Hospital.Name", "State", 
                            "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
                            "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", 
                            "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
df.final <- outcome.df %>% select(names.hosp.30day.state)
colnames(df.final) <- c(".Hospital", ".St", ".Mortality.H.Attack", 
                        ".Mortality.H.Failure", ".Mortality.Pneumonia")
suppressWarnings(df.final <- df.final %>% 
                     transform(.Mortality.H.Attack = as.numeric(.Mortality.H.Attack),
                               .Mortality.H.Failure = as.numeric(.Mortality.H.Failure), 
                               .Mortality.Pneumonia = as.numeric(.Mortality.Pneumonia), 
                               .St = as.factor(.St)) %>%
                     gather(condition, rate, .Mortality.H.Attack:.Mortality.Pneumonia)%>%
                     na.omit()%>%
                     mutate(condition = recode(condition,
                             .Mortality.H.Attack = "heart attack",
                             .Mortality.H.Failure = "heart failure",
                             .Mortality.Pneumonia = "pneumonia"))%>%
                     arrange(-desc(rate))
