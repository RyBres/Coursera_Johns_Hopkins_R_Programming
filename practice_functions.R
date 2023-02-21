add2 <- function(x, y) {
  x+y
}

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n) {
  use <- x > n
  x[use]
}

x <- 1:20

above(x, 12)

columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}


make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)

cube(3)
square(2)
square(1:5)