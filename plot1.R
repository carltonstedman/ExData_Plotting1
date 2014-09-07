# plot1.R

source("loader.R")

df <- load.data("household_power_consumption.txt")
ss <- select.data(df)

# write to png
png(filename="plot1.png",
    height=480,
    width=480)

# make a histogram
hist(ss$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

# close png, writing it
dev.off()
