x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)
apply(x, 1, mean)

apply(x, 1, quantile, probs = c(0.25, 0.50, 0.75))