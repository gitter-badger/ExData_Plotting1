# plot3.R Chart Baltimore, MD total annual PM25 emissions by year and source

library (ggplot2)

readPM25 <- function (filename)
  {
  # read pm25 data
  readRDS (filename)
  }

aggregateAnnually <- function (nei)
  {
  #aggregate by year
  nei <- subset (nei, fips == '24510')
  annual <- aggregate (nei$Emissions, by = list (nei$type, nei$year), FUN=sum)
  colnames(annual) <- c('Source', 'Year', 'Emissions')
  annual$Source <- factor (annual$Source, 
                           levels = c("NON-ROAD", "NONPOINT", 'ON-ROAD', 'POINT'), 
                           labels = c('Non-road', 'Non-point', 'Road', 'Point'))  
  annual
  }

plotView <- function (annual)
  {
  library (ggplot2)

  png (filename = "plot3.png",
       width = 480, height = 480, 
       units = "px", pointsize = 12,
       bg = "white",  res = NA) 
  
  print (
        ggplot (annual, 
                aes(x=factor(Year), y=Emissions)) +
                geom_bar(stat="identity", fill='blue') +
                facet_grid (. ~ Source) +
                xlab ("Year") +
                ylab ("PM 2.5 Emissions in tons") +
                ggtitle ("'Baltimore MD PM-25 Emissions by Source'") 
  
        ) 
 
  dev.off ()
  }

main <- function ()
  {
  nei <- readPM25 ('pm25.rds')
  plotView (aggregateAnnually (nei))
  }

main ()
