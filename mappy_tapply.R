str(mapply)

noise <- function(n, mean, sd) {
        rnorm(n, mean, sd)
}

noise(5, 1, 2)
noise(1:5, 1:5, 2)
mapply(noise, 1:5, 1:5, 2)

str(tapply)

y <- c(rnorm(10), runif(10), rnorm(10, 1))
fact <- gl(3, 10)

tapply(y, fact, mean)
tapply(y, fact, mean, simplify = FALSE)
tapply(y, fact, range)