# Loader.R
#
# Useful functions for loading the household power consumption data
#

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
                        start = as.Date("2007-02-01", "%Y-%m-%d"),
                        end   = as.Date("2007-02-02", "%Y-%m-%d")) {
    # predicate returns true when date is between range
    p <- function(date) {
        d <- as.Date(date, "%d/%m/%Y")
        d >= start & d <= end
    }
    subset(df, p(Date))
}

df <- load.data("household_power_consumption.txt")
ss <- select.data(df)

names(ss)

hist(ss$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
