df.so <- df.clean %>% dplyr::filter(df.clean[[".St"]] == c("TX") & df.clean[["condition"]] == c(".Mortality.H.Failure"))
df.so <- df.so %>% arrange(-desc(rate))

numbers <- c(4,23,4,23,5,43,54,56,657,67,67,435,453,435,324,34,456,56,567,65,34,435)
 a <- rle(sort(numbers))

tt <- cbind(rank=round(rank(df.so$rate), 0), df.so)

