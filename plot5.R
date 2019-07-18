## Reading in emmisions data and classification code
getwd()
setwd("C:/Users/Chris/Documents/")
emissions <- readRDS("summarySCC_PM25.rds")
SC <- readRDS("Source_Classification_Code.rds")

mrg <- merge(emissions, SC, by ="SCC")
baltimore_city <- subset(emissions, fips == "24510")
data <- subset(baltimore_city, type == "ON-ROAD")
total_by_year <- aggregate(Emissions ~ year, data, sum)

library(ggplot2)
png("plot5.png")
g = ggplot(total_by_year, aes(year, Emissions))
g <- g + geom_line(aes(year, Emissions)) 
g + labs(title = "Pm2.5 Emissions from motor vehiclies (ON-ROAD) in Baltimore City")
dev.off()
