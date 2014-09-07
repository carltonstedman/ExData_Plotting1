# plot2.R

source("plots.R")

df <- select.data(load.data("household_power_consumption.txt"))
plot.png(df, "plot2.png", plot2)
