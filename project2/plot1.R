# plot1.R Chart US total annual PM 2.5 emissions by year

readPM25 <- function (filename)
  {
  # read pm2.5 data
  readRDS (filename)
  }

aggregateAnnually <- function (nei)
  {
  #aggregate by year and scale in millions of tons
  annual <- aggregate (Emissions ~ year, data=nei, FUN=sum)
  annual$Emissions <- annual$Emissions / 1000000.0
  annual
  }

plotView <- function (annual)
  {
  png (filename = "plot1.png",
       width = 480, height = 480, 
       units = "px", pointsize = 12,
       bg = "white",  res = NA) 
  
  barplot(annual$Emissions, 
          names.arg = annual$year, 
          main = "United States Total PM-2.5 Emissions",
          ylab = "Emissions (millions of tons)",
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
