# plot4.R

source("plots.R")

# plot to the top right
plot.tr <- function(df) {
    plot(df$DateTime,
         df$Voltage,
         xlab="datetime",
         ylab="Voltage",
         type="l")
}

# plot to the bottom right
plot.br <- function(df) {
    plot(df$DateTime,
         df$Global_reactive_power,
         xlab="datetime",
         ylab="Global_reactive_power",
         type="l")
}

df <- select.data(load.data("household_power_consumption.txt"))
df$DateTime <- date.times(df)

plot.png(df, "plot4.png", function(df) {
    # set up grid of plots
    par(mfrow=c(2, 2))

    # top left, top right, bottom left, bottom right
    plot2(df)
    plot.tr(df)
    plot3(df)
    plot.br(df)
})
