
    # ddply example from library plyr
set.seed(3)

d <- data.frame(year = rep(2000:2002, each = 3), count = round(runif(9,0,20)))

ddply(d, "year", function(x){
    
    mean.count <- mean(x$count)
    sd.count <- sd(x$count)
    cv <- sd.count/mean.count
    data.frame(cv.count = cv)
      })

ddply(d, "year", summarise, mean.count = mean(count))

ddply(d,  "year", transform, total.count = sum(count))