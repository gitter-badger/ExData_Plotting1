# plot2.R Chart Baltimore, MD total annual PM2.5 emissions by year

readPM25 <- function (filename)
  {
  # read pm25 data
  readRDS (filename)
  }

aggregateAnnually <- function (nei)
  {
  #aggregate by year
  nei <- subset (nei, fips == '24510')
  annual <- aggregate (Emissions ~ year, data=nei, FUN=sum)
  annual
  }

plotView <- function (annual)
  {
  png (filename = "plot2.png",
       width = 480, height = 480, 
       units = "px", pointsize = 12,
       bg = "white",  res = NA) 
  
  barplot(annual$Emissions, 
          names.arg = annual$year, 
          main = "Baltimore, MD Total PM-2.5 Emissions",
          ylab = "Emissions (tons)",
          col  = 'red'
         )
  
  dev.off ()
  }

main <- function ()
  {
  nei <- readPM25 ('pm25.rds')
  plotView (aggregateAnnually (nei))
  }

main ()
