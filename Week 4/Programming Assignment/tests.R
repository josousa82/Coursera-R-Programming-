
## removing columms
cleanHospitalData <- hospitalData[, -grep(paste("Address.2", "Address.3", sep = "|"), names(hospitalData))]

cleanOutcome <- outcome[, -grep(paste("Address.1", "Address.2", "Address.3", "Footnote", "Lower", "Upper", 
                                      "Comparison", "Number.of.Patients", "Phone.Number", "ZIP.Code", 
                                      "Provider.Number", sep = "|"), 
                                      names(outcome))]

longerData <- cleanOutcome %>% gather(Mortality/Readmission, Rates, 5:10 )

longerData <- longerData[ longerData == "Not Available" ] <- NA

colnames(cleanOutcome) <- c(".Hospital", ".City",  ".St", ".County", ".Mortality.H.Attack", ".Mortality.H.Failure", ".Mortality.Pneumonia", ".Read.H.Attack", ".Read.H.Failure", ".Read.Pneumonia" )
head(cleanOutcome)