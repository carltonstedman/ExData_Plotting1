# plot2.R

source("plots.R")

df <- select.data(load.data("household_power_consumption.txt"))
df$DateTime <- date.times(df)
plot.png(df, "plot2.png", plot2)
