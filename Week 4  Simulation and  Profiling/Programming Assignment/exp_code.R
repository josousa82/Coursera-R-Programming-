##  experiment code2n

out.sym <- sym(outcome2)
attach(df.clean)


##detach(f.df)
##head(result)
##final.df[final.df$.St == state & condition == outcome2, ]

## final.df[1,]

##test.gat.df.g[test.gat.df.g$.St =="MN",]


# data clean

e <- function(){
df.final <- cl.best %>% mutate(condition= recode(condition,
                                           .Mortality.H.Attack = "heart attack",
                                           .Mortality.H.Failure = "heart failure",
                                           .Mortality.Pneumonia = "pneumonia"))



sub.df.final <- subset(x = df.final, subset = .St == "TX")
test.gat.df.g <- gather(test.gat.df, condition, value, .Mortality.H.Attack:.Mortality.Pneumonia, factor_key = TRUE)
test.gat.df.g <- transform(test.gat.df.g, .St = as.factor(.St))
vect.states <- levels(factor(test.gat.df.g$.St))

df.clean[df.clean$.St == "TX" & condition == ".Mortality.H.Attack",  ]%>%
arrange(-desc(rate))%>%
head()
}