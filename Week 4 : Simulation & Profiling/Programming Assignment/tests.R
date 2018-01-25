
## removing columms
cleanHospitalData <- hospitalData[, -grep(paste("Address.2", "Address.3", sep = "|"), names(hospitalData))]

cleanOutcome <- outcome[, -grep(paste("Address.1", "Address.2", "Address.3", "Footnote", "Lower", "Upper", 
                                      "Comparison", "Number.of.Patients", "Phone.Number", "ZIP.Code", 
                                      "Provider.Number", sep = "|"), 
                                      names(outcome))]

longerData <- cleanOutcome %>% gather(Mortality/Readmission, Rates, 5:10 )

longerData <- longerData[ longerData == "Not Available" ] <- NA

colnames(cleanOutcome) <- c(".Hospital", ".City",  ".St", ".County", ".Mortality.H.Attack", 
                            ".Mortality.H.Failure", ".Mortality.Pneumonia", ".Read.H.Attack", 
                            ".Read.H.Failure", ".Read.Pneumonia" )




## getting NA's

transform(hospitaData, Provider.Number = as.numeric(Provider.Number), ZIP.Code = as.numeric(ZIP.Code), 
          Phone.Number = as.numeric(Phone.Number))

cleanOutcome <- transform(cleanOutcome, .Mortality.H.Attack = as.numeric(.Mortality.H.Attack),
                          .Mortality.H.Failure = as.numeric(.Mortality.H.Failure), .Mortality.Pneumonia = as.numeric(.Mortality.Pneumonia))


cleanOutcome <- transform(cleanOutcome, .Read.H.Attack = as.numeric(.Read.H.Attack),
                          .Read.H.Failure = as.numeric(.Read.H.Failure), .Read.Pneumonia = as.numeric(.Read.Pneumonia))

## organizing the results and removing NA's with dplyr

cleanOutcome %>%
    na.omit()%>%
    select(.Hospital, .St, .Mortality.H.Attack)%>%
    arrange(desc(.Mortality.H.Attack))%>%
    head()

cleanOutcome %>%
    na.omit()%>%
    group_by(.Hospital, .St) %>%
    arrange(asc(.Mortality.H.Attack))%>%
    des


