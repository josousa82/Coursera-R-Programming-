## Script  that loads the csv
## file and clean the data.
## Also checks if the data 
## cleaned is cached, in 
## cache function, if not 
## will cache the data, for 
## time reduction on access
## will return data frame ready 
## to work for itch function


test.gat.df.g <- gather(test.gat.df, condition, value, .Mortality.H.Attack:.Mortality.Pneumonia, factor_key = TRUE)
