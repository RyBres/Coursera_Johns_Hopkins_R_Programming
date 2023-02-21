rm(list = ls())
library(dplyr)
library(data.table)

specdata <- "~/Coursera/Johns_Hopkins_R/2_r_programming/assignment/rprog_data_specdata/specdata"

pollutantmean <- function(directory, pollutant, id = 1:332) {
        ldf <- list()                                                   #creates empty list ldf
        directory <- dir(pattern = "*.csv")                             #connects directory with data folder
        for(i in 1:length(id)) {
                ldf[[i]] <- read.csv(directory[i])                      #populates ldf as parent df by reading in selected csv
        }
        means <- lapply(ldf, function(x) {
                colMeans(x[, c("sulfate","nitrate")], na.rm = TRUE)     #loops over each child df 
        })
        vals <- as.data.frame(transpose(means))                         #transposes vals as a df
        colnames(vals) <- c('sulfate', 'nitrate')                       #renames columns of vals transpose
        mean <- mean(vals[,pollutant], na.rm = TRUE)                    #sample mean for pollutant
        print(c(pollutant, mean))                                       #prints pollutant type and sample mean
}

pollutantmean("specdata", "nitrate", 1:50)
