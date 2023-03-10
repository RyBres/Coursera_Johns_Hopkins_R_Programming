rm(list = ls())
library(dplyr)

complete <- function(directory, id = 1:332) {
        path <- paste0(getwd(), "/", directory)
        data <- data.frame()
        for(i in id) {
                if (i < 10) {
                        dat <- read.csv(paste(path, "/00", as.character(i), ".csv", sep = ""),
                                        as.is = TRUE,
                                        header = TRUE)
                }
                else if(i < 100) {
                        dat <- read.csv(paste(path, "/0", as.character(i), ".csv", sep = ""),
                                        as.is = TRUE,
                                        header = TRUE)
                }
                else {
                        dat <- read.csv(paste(path, "/", as.character(i), ".csv", sep = ""),
                                        as.is = TRUE,
                                        header = TRUE)
                }
                nobs <- sum(complete.cases(dat))
                predata <- data.frame(i, nobs)
                data <- rbind(data, predata)
        }
        return(data)
}

complete("specdata", 1:2)