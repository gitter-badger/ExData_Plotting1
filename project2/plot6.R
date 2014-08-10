# plot6.R PM-2.5 Comparison of emissions from Baltimore MD motor vehicles and LA county


readPM25 <- function (filename)
  {
  # read pm25 data
  readRDS (filename)
  }

aggregateAnnually <- function (nei)
  {
  # Use Baltimore ON-ROAD data and LA ON-ROAD data
  # aggregate by year
  # scale 1000s of tons
  baltimore <- nei[(nei$fips == '24510' & nei$type == 'ON-ROAD'),]
  baltimore <- aggregate (Emissions ~ year, data = baltimore, FUN=sum)  
  la        <- nei[(nei$fips == '06037' & nei$type == 'ON-ROAD'),]
  la        <- aggregate (Emissions ~ year, data = la,        FUN=sum)  
  baltimore$County <- 'Baltimore, MD'
  la$County        <- 'Los Angeles, CA'
  rbind (baltimore, la)
  }

plotView <- function (annual)
  {
  library (ggplot2)
  png (filename = "plot6.png",
       width = 480, height = 480, 
       units = "px", pointsize = 12,
       bg = "white",  res = NA) 

  print (
        ggplot (annual, 
                aes(x=factor(year), y=Emissions)) +
                geom_bar(stat='identity', fill='red') +
                facet_grid (. ~ County) +
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
