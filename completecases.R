rm(list = ls())
library(dplyr)
library(data.table)
library(tidyr)

specdata <- "~/Coursera/Johns_Hopkins_R/2_r_programming/assignment/rprog_data_specdata/specdata"
setwd(specdata)

complete <- function(directory, id = 1:322) {
        ldf <- list()                                                   #creates empty list ldf
        directory <- dir(pattern = "*.csv")                             #connects directory with data folder
        for(i in 1:length(id)) {
                ldf[[i]] <- read.csv(directory[i])                      #populates ldf as parent df by reading in selected csv
        }
        compcases <- as.data.frame(sapply(ldf, function(x) sum(complete.cases(x))))
                idvar <- id
                compcases['id'] <- idvar
                colnames(compcases) <- c("nobs", "id")
                compcases <- compcases %>%
                                relocate(id) %>%
                                        head()
        print(compcases)
}


complete("specdata", c(1, 3))

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[, "nobs"])
