rm(list = ls())
library(dplyr)

best <- function(state, outcome) {
        require(dplyr)
        dat <- data.frame(read.csv("outcome-of-care-measures.csv", colClasses = "character"))
        dat <- dat[ grep(state, dat$State, invert = FALSE) , ]
        data <- data.frame()
        if (dim(dat)[1] == 0) {
                stop("invalid state")
        }
        if (outcome == "heart attack") {
                data <- dat[, c(2, 11)]
        } else if (outcome == "heart failure") {
                data <- dat[, c(2, 17)]
        } else if (outcome == "pneumonia") {
                data <- dat[, c(2, 23)]
        } else if (outcome != "heart attack" || outcome != "heart failure" || outcome != "pneumonia") {
                stop("invalid outcome")
        }
        data[data == "Not Available"] <- NA
        data[which.min(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), ]
                
}
