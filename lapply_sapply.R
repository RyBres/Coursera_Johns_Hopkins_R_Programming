x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)
sapply(x, mean)

y <- list(a = 1:4, b = rnorm(10), c = rnorm(100, 1), d = rnorm(200, 2))
lapply(y, mean)

z <- 1:4
lapply(z, runif, min = 100, max = 2000)

m <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
m
lapply(m, function(firstcol) firstcol[, 1])