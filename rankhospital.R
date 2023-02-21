rm(list = ls())
library(dplyr)

rankhospital <- function(state, outcome, num = "best") {
        require(dplyr)
        dat <- data.frame(read.csv("outcome-of-care-measures.csv", colClasses = "character"))
        dat <- dat[ grep(state, dat$State, invert = FALSE) , ]
        data <- data.frame()
        if (dim(dat)[1] == 0) {
                stop("invalid state")
        }
        if (outcome == "heart attack") {
                data <- dat[, c(2, 11)]
                colnames(data) <- c("hospital", "thirtydaymort_heartattack")
                data[data == "Not Available"] <- NA
                data <- data[!is.na(data$thirtydaymort_heartattack), ]
        } else if (outcome == "heart failure") {
                data <- dat[, c(2, 17)]
                colnames(data) <- c("hospital", "thirtydaymort_heartfailure")
                data[data == "Not Available"] <- NA
                data <- data[!is.na(data$thirtydaymort_heartfailure), ]
        } else if (outcome == "pneumonia") {
                data <- dat[, c(2, 23)]
                colnames(data) <- c("hospital", "thirtydaymort_pneumonia")
                data[data == "Not Available"] <- NA
                data <- data[!is.na(data$thirtydaymort_pneumonia), ]
        } else if (outcome != "heart attack" || outcome != "heart failure" || outcome != "pneumonia") {
                stop("invalid outcome")
        }
        data <- data[order(data[, 2], data[, 1]), ]
        data$rank <- 1:nrow(data)
        if (num == "best") {
                b <- head(data, n = 1)
                print(b)
        } else if (num == "worst") {
                w <- tail(data, n = 1)
                print(w)
        } else {
                r <- data %>%
                        slice(which(rank == num))
                print(r)
        }
        sum(is.na(data[, 2]))
}

