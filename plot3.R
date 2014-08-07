# plot2.R - plot Sub_metering vs time for Feb 1-2, 2007

cols <- c ("character", "character", rep ('numeric', 7))
df   <- read.csv ('power.txt', sep = ';', na.strings = '?', colClasses=cols)
df   <- within (df, time <- strptime (paste (df$Date, df$Time), '%d/%m/%Y %T'))

df$Date <- NULL
df$Time <- NULL

png(filename = "plot3.png",
    width = 480, height = 480, 
    units = "px", pointsize = 12,
    bg = "white",  res = NA) 

plot  (
      df$time,
      df$Sub_metering_1, 
      type = 'l',
      xlab = '',
      ylab = 'Energy sub metering',
      )

lines (df$time, df$Sub_metering_2, col='red')
lines (df$time, df$Sub_metering_3, col='blue')

legend ('topright', 
       c( 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c( 'black', 'red', 'blue'),
       lty = 1,
       cex = 0.99,
       )

dev.off ()
