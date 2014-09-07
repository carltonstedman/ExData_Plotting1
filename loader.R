# Loader.R
#
# Useful functions for loading the household power consumption data
#

# use lubridate
library(lubridate)

load.data <- function(file) {
    # get inital 10 rows to determine column classes
    initial <- read.table(file,
                          header=TRUE,
                          na.strings=c('?'),
                          nrows=10,
                          sep=";")
    classes <- sapply(initial, class)

    # now, use classes to read in all data, faster
    read.table(file,
               colClasses=classes,
               header=TRUE,
               na.strings=c('?'),
               sep=";")
}

# subsets data by start and end dates
select.data <- function(df,
                        start = ymd("2007-02-01"),
                        end   = ymd("2007-02-02")) {
    # predicate returns true when date is between range
    p <- function(date) {
        d <- dmy(date)
        d >= start & d <= end
    }
    subset(df, p(Date))
}

date.times <- function(df) {
    dmy(df$Date)+hms(df$Time)
}
