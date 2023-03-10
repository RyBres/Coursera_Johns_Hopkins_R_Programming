rm(list = ls())
library(dplyr)

pollutantmean <- function(directory, pollutant, id = 1:332) {
        path <- paste0(getwd(), "/", directory)
        data <- data.frame()
        for(i in id) {
                if (i < 10) {
                        dat <- read.csv(paste(path, "/00", as.character(i), ".csv", sep = ""),
                                         as.is = TRUE,
                                         header = TRUE)
                        data <- rbind(data, dat)
                }
                else if(i < 100) {
                        dat <- read.csv(paste(path, "/0", as.character(i), ".csv", sep = ""),
                                         as.is = TRUE,
                                         header = TRUE)
                        data <- rbind(data, dat)
                }
                else {
                        dat <- read.csv(paste(path, "/", as.character(i), ".csv", sep = ""),
                                         as.is = TRUE,
                                         header = TRUE)
                        data <- rbind(data, dat)
                }
        }
        return(mean(data[, pollutant], na.rm = TRUE))
}

pollutantmean("specdata", "sulfate", 1:332)
