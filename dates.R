
rm(list = ls())

x <- as.Date("1970-01-01")
x

unclass(x)

unclass(as.Date(x))


#POSIXlt
rm(list = ls())

x <- Sys.time()
p <- as.POSIXlt(x) #must convert to POSIXlt to get list wise elements of time, see below
names(unclass(p))

p$sec

#dealing with different date formats
rm(list = ls())

datestring <- c("January 10, 2012 10:40", "December 9, 2010 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x