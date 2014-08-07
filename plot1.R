# plot1.R - Global Active Power frequency for Feb 1-2, 2007

cols <- c ("character", "character", rep ('numeric', 7))
df   <- read.csv ('power.txt', sep = ';', na.strings = '?', colClasses=cols)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA) 

hist  (
      df$Global_active_power, 
      main = 'Global Active Power',
      xlab = 'Global Active Power (kilowatts)',
      col = 'red'
      )

dev.off ()
