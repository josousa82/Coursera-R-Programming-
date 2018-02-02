if(outcome2 == "heart attack"){
  
  outcome2 <- c(".Mortality.H.Attack")
  
}else if(outcome2 == "heart failure" ){
  
  outcome2 <- (".Mortality.H.Failure")
  
}else if( outcome2 == "pneumonia"){ outcome2 <- c(".Mortality.Pneumonia")}

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


testC <- cleanOutcome %>%
       na.omit()%>%
       select(.Hospital, .St, .Mortality.Pneumonia)%>%
       arrange(-desc(.Mortality.Pneumonia))


testC <- cleanOutcome %>%
      na.omit()%>%
      select(.Hospital, .St, argT)%>%
      arrange(-desc(3))
  
  
a[order(a$.Mortality.H.Attack),]

a <- cleanOutcome%>%
    arrange(desc(.Mortality.H.Attack))%>%
    select(.Hospital,.St, .Mortality.H.Attack)%>%
    na.omit(.Mortality.H.Attack)

a[order(a$.Mortality.H.Attack),]

a[order(-a$.Mortality.H.Attack, a$.St),]
>>>>>>> v1.0
