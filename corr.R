rm(list = ls())
library(dplyr)
library(data.table)
library(tidyr)

specdata <- "~/Coursera/Johns_Hopkins_R/2_r_programming/assignment/rprog_data_specdata/specdata"


corr <- function(directory, threshold = 0) {
        ldf <- list()                                                   #creates empty list ldf
        directory <- dir(pattern = "*.csv")                             #connects directory with data folder
        for(i in 1:length(directory)) {
                ldf[[i]] <- read.csv(directory[i])                      #populates ldf as parent df by reading in selected csv
        }
        
        ldf <- subset(ldf, sapply(ldf, function(x, threshold) sum(complete.cases(x))) > threshold)
        correlations <- lapply(ldf, function(y) {
                cor(y$sulfate, y$nitrate, use = "complete.obs")
        })
        correlations_df <- as.data.frame(transpose(correlations))
        colnames(correlations_df) <- c("coeff")
        print(correlations_df)
}

cr <- corr("specdata", 0)

head(cr)
summary(cr)


cr <- corr("specdata")
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)