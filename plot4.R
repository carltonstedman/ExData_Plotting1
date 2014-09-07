# plot3.R

source("loader.R")

df <- load.data("household_power_consumption.txt")
ss <- select.data(df)

# add date times
ss$DateTime <- date.times(ss)

# write to png
png(filename="plot3.png",
    height=480,
    width=480)

# make a plot
plot(ss$DateTime,
     ss$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="",
     type="l")

# add the other submetering lines
lines(ss$DateTime, ss$Sub_metering_2, col="red")
lines(ss$DateTime, ss$Sub_metering_3, col="blue")

# add a legend
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty="solid")

# close png, writing it
dev.off()

