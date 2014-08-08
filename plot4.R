# plot4.R - 4 graphs on one device for Feb 1-2, 2007

cols <- c ("character", "character", rep ('numeric', 7))
df   <- read.csv ('power.txt', sep = ';', na.strings = '?', colClasses=cols)
df   <- within (df, time <- strptime (paste (df$Date, df$Time), '%d/%m/%Y %T'))

df$Date <- NULL
df$Time <- NULL


png(filename = "plot4.png",
    width = 480, height = 480, 
    units = "px", pointsize = 12,
    bg = "white",  res = NA) 

par (mfrow=c(2,2))

plot  (
      df$time,
      df$Global_active_power, 
      type = 'l',
      xlab = '',
      ylab = 'Global Active Power (kilowatts)',
      )

plot  (
      df$time,
      df$Voltage, 
      type = 'l',
      ylab = 'Voltage',
      xlab = 'datetime',
      )

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
       lwd = 2,
       bty = 'n',
       cex = 0.99,
       )

plot  (
      df$time,
      df$Global_reactive_power, 
      type = 'l',
      ylab = 'Global_reactive_power',
      xlab = 'datetime',
      )

dev.off ()
