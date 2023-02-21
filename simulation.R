#normal random

x <- rnorm(10)
x
y <- rnorm(10, 20, 2)
y
summary(x)
summary(y)

set.seed(1)
rnorm(5)
rnorm(5) #then
set.seed(1)
rnorm(5)

#poisson random
rpois(10, 1)
rpois(10, 2)
rpois(10, 20)

#cumulative distribution
ppois(2, 2)    #Pr(x <= 2)
ppois(4, 2)     #Pr(x <= 4)
ppois(6, 2)     #Pr(x <= 6)