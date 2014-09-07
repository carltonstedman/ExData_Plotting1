# plot1.R

source("plots.R")

df <- select.data(load.data("household_power_consumption.txt"))
plot.png(df, "plot1.png", function(df) {
  # make a histogram
  hist(df$Global_active_power,
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       col="red")
})
