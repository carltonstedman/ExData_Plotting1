# plot2.R

source("loader.R")

df <- load.data("household_power_consumption.txt")
ss <- select.data(df)

# add date times
ss$DateTime <- date.times(ss)

# write to png
png(filename="plot2.png",
    height=480,
    width=480)

# make a plot
plot(ss$DateTime,
     ss$Global_active_power,
     ylab="Global Active Power (kilowatts)",
     xlab="",
     type="l")

# close png, writing it
dev.off()

