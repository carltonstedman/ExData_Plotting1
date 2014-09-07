# plots.R
#
# Useful functions for loading the household power consumption data and
# functions defining plots.
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

# returns calculated vector of date times for a data frame
date.times <- function(df) {
    dmy(df$Date)+hms(df$Time)
}

# plot2.R plotter
plot2 <- function(df) {
    # make a plot
    plot(df$DateTime,
         df$Global_active_power,
         ylab="Global Active Power (kilowatts)",
         xlab="",
         type="l")
}

# plot3.R plotter
plot3 <- function(df) {
    # make a plot
    plot(df$DateTime,
         df$Sub_metering_1,
         ylab="Energy sub metering",
         xlab="",
         type="l")

    # add the other submetering lines
    lines(df$DateTime, df$Sub_metering_2, col="red")
    lines(df$DateTime, df$Sub_metering_3, col="blue")

    # add a legend
    legend("topright",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"),
           lty="solid")
}

# function to plot to a PNG file using plot.fn
plot.png <- function(df, filename, plot.fn) {
    # write to png
    png(filename=filename, height=480, width=480)

    plot.fn(df)

    # close png, writing it
    dev.off()
}
