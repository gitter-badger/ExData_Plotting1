# plot5.R PM-2.5 Emissions from Baltimore MD motor vehicles

readPM25 <- function (filename)
  {
  # read pm25 data
  readRDS (filename)
  }

aggregateAnnually <- function (nei)
  {
  # Use Baltimore ON-ROAD data
  # aggregate by year
  # scale 1000s of tons
  nei <- nei[(nei$fips == '24510' & nei$type == 'ON-ROAD'),]
  annual <- aggregate (Emissions ~ year, data = nei, FUN=sum)  
  annual
  }

plotView <- function (annual)
  {
  library (ggplot2)
  png (filename = "plot5.png",
       width = 480, height = 480, 
       units = "px", pointsize = 12,
       bg = "white",  res = NA) 

  print (
        ggplot (annual, 
                aes(x=factor(year), y=Emissions)) +
                geom_bar(stat='identity', fill='red') +
                xlab ("year") +
                ylab ("PM 2.5 emissions (tons)") +
                ggtitle ("Baltimore MD PM-2.5 On-road Emissions") 
        )
   
  dev.off ()
  }

main <- function ()
  {
  nei <- readPM25 ('pm25.rds')
  plotView (aggregateAnnually (nei))
  }

main ()
