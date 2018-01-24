best <- function(state, outcome){
    
    ## 1 read outcome data
    ## 2 
    txtExcl <- c("Comparison", "Lower", "Upper", "Number.of.Patients", "Footnote")
    txtExcl <- c("Comparison", "Lower", "Upper", "Number.of.Patients", "Footnote", "Readmission", "Address.2", "Address.3")
    
    outcome[, -grep(paste(txtExcl, collapse = "|"), names(outcome))]
    
    
    
}