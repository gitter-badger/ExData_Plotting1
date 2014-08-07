# plot2.R - plot Global Active Power vs time for Feb 1-2, 2007

cols <- c ("character", "character", rep ('numeric', 7))
df   <- read.csv ('power.txt', sep = ';', na.strings = '?', colClasses=cols)
df   <- within (df, time <- strptime (paste (df$Date, df$Time), '%d/%m/%Y %T'))

df$Date <- NULL
df$Time <- NULL

png(filename = "plot2.png",
    width = 480, height = 480, 
    units = "px", pointsize = 12,
    bg = "white",  res = NA) 

plot  (
      df$time,
      df$Global_active_power, 
      type = 'l',
      xlab = '',
      ylab = 'Global Active Power (kilowatts)',
      )

dev.off ()
