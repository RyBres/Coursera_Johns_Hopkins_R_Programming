str(split)

x <- c(rnorm(10), runif(10), rnorm(10, 1))
fact <- gl(3, 10)
split(x, fact)

lapply(split(x, fact), mean)

rm(list = ls())
library(datasets)
head(airquality)

#within month mean
#split df into separate pieces for each months

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

#sapply to return vector and deal with na
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

rm(list = ls())

x <- rnorm(10)
gen <- gl(2, 5)         #factor1 (name arbitrary)
race <- gl(5, 2)        #factor2

interaction(gen, race)

str(split(x, list(gen, race)))



