rm(list = ls())

rankall <- function(outcome, num = "best") {
        require(dplyr)
        dat <- data.frame(read.csv("outcome-of-care-measures.csv", colClasses = "character"))
        data <- data.frame()
        if (outcome == "heart attack") {
                data <- dat[, c(2, 11, 7)]
                colnames(data) <- c("hospital", "thirtydaymort_heartattack", "state")
                data[data == "Not Available"] <- NA
                data <- data[!is.na(data$thirtydaymort_heartattack), ]
                data <- data %>%
                        arrange(data$state, data$thirtydaymort_heartattack, data$hospital) %>%
                        group_by(state) %>%
                        mutate(rank = 1:n()) %>%
                        ungroup()
        } else if (outcome == "heart failure") {
                data <- dat[, c(2, 17, 7)]
                colnames(data) <- c("hospital", "thirtydaymort_heartfailure", "state")
                data[data == "Not Available"] <- NA
                data <- data[!is.na(data$thirtydaymort_heartfailure), ]
                data <- data %>%
                        arrange(data$state, data$thirtydaymort_heartfailure, data$hospital) %>%
                        group_by(state) %>%
                        mutate(rank = 1:n()) %>%
                        ungroup()
        } else if (outcome == "pneumonia") {
                data <- dat[, c(2, 23, 7)]
                colnames(data) <- c("hospital", "thirtydaymort_pneumonia", "state")
                data[data == "Not Available"] <- NA
                data <- data[!is.na(data$thirtydaymort_pneumonia), ]
                data <- data %>%
                        arrange(data$state, data$thirtydaymort_pneumonia, data$hospital) %>%
                        group_by(state) %>%
                        mutate(rank = 1:n()) %>%
                        ungroup()
        } else if (outcome != "heart attack" || outcome != "heart failure" || outcome != "pneumonia") {
                stop("invalid outcome")
        }
        if (num == "best") {
                b <- data.frame()
                b <- data[which(data$rank == 1), ]
                print(b)
        } else if (num == "worst") {
                w <- data.frame()
                w <- data %>%
                        group_by(state) %>%
                        slice(which.max(rank))
                print(w)
        } else {
                r <- data.frame()
                r <- data %>%
                        group_by(state) %>%
                        slice(which(rank == num))
                print(r)
        }
}
