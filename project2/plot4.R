# plot4.R PM-2.5 Emissions from Coal Combustion Sources



readPM25 <- function (filename)
  {
  # read pm25 data
  readRDS (filename)
  }



aggregateAnnually <- function (nei, scc)
  {
  # determine the coal source codes
  # select that data
  # aggregate by year
  # scale 1000s of tons
  coal <- grepl("Fuel Comb.*Coal", scc$EI.Sector)
  srcs <- scc [coal,]
  nei  <- nei [(nei$SCC %in% srcs$SCC), ]
  annual <- aggregate (Emissions ~ year, data = nei, FUN=sum)  
  annual$Emissions <- annual$Emissions / 1000.0
  annual
  }

plotView <- function (annual)
  {
  library (ggplot2)
  png (filename = "plot4.png",
       width = 480, height = 480, 
       units = "px", pointsize = 12,
       bg = "white",  res = NA) 

  print (
        ggplot (annual, 
                aes(x=factor(year), y=Emissions)) +
                geom_bar(stat="identity", fill='blue') +
                xlab ("year") +
                ylab ("PM 2.5 emissions (thousands of tons)") +
                ggtitle ("Emissions from Coal Combustion Related Sources") 
        )
   
  dev.off ()
  }

main <- function ()
  {
  nei <- readPM25 ('pm25.rds')
  scc <- readPM25 ('scc.rds')
  plotView (aggregateAnnually (nei, scc))
  }

main ()
