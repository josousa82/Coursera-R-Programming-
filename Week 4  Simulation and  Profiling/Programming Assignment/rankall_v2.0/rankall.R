rankall <- function(outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
}




# The function should check the validity of its arguments. If an invalid outcome value is passed to rankall,
# the function should throw an error via the stop function with the exact message “invalid outcome”. The num
# variable can take values “best”, “worst”, or an integer indicating the ranking (smaller numbers are better).
# If the number given by num is larger than the number of hospitals in that state, then the function should
# return NA.
# Here is some sample output from the function.
# > source("rankall.R")
# > head(rankall("heart attack", 20), 10)
# AK
# AL
# AR
# hospital state
# <NA>
#     AK
# D W MCMILLAN MEMORIAL HOSPITAL
# AL
# ARKANSAS METHODIST MEDICAL CENTER
# AR
# 4AZ JOHN C LINCOLN DEER VALLEY HOSPITAL
# CA
# SHERMAN OAKS HOSPITAL
# CO
# SKY RIDGE MEDICAL CENTER
# CT
# MIDSTATE MEDICAL CENTER
# DC
# <NA>
#     DE
# <NA>
#     FL
# SOUTH FLORIDA BAPTIST HOSPITAL
# AZ
# CA
# CO
# CT
# DC
# DE
# FL
# > tail(rankall("pneumonia", "worst"), 3)
# hospital state
# WI MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC
# WI
# WV
# PLATEAU MEDICAL CENTER
# WV
# WY
# NORTH BIG HORN HOSPITAL DISTRICT
# WY
# > tail(rankall("heart failure"), 10)
# hospital state
# TN
# WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL
# TN
# TX
# FORT DUNCAN MEDICAL CENTER
# TX
# UT VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER
# UT
# VA
# SENTARA POTOMAC HOSPITAL
# VA
# VI
# GOV JUAN F LUIS HOSPITAL & MEDICAL CTR
# VI
# VT
# SPRINGFIELD HOSPITAL
# VT
# WA
# HARBORVIEW MEDICAL CENTER
# WA
# WI
# AURORA ST LUKES MEDICAL CENTER
# WI
# WV
# FAIRMONT GENERAL HOSPITAL
# WV
# WY
# CHEYENNE VA MEDICAL CENTER
# WY
# Save your code for this function to a file named rankall.R.