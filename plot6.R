## Reading in emmisions data and classification code
setwd("C:/Users/Chris/Documents/")
emissions <- readRDS("summarySCC_PM25.rds")
SC <- readRDS("Source_Classification_Code.rds")

## Gathering data for motor vehicle emissions in Baltimore and Los Angeles County
## See plot5.R for subsetting Baltimore data
total_balt <- total_by_year
LA <- subset(emissions, fips == "06037")
data_LA <- subset(LA, type == "ON-ROAD")
total_LA <- aggregate(Emissions ~ year, data_LA, sum)
head(total_LA)
LA_emissions <- c(total_LA$Emissions)
both <- cbind(total_LA, total_balt)
both_sum <- both[, c(1,2, 4)]
both_sum

## Creating Plot- Emissions by Year in Baltimore and LA
png("plot6.png")
plot(both_sum[,'year'] , both_sum[, 2], type = 'l', col = "blue",
     ylim = c(0, 5000), xlab = "Year", ylab = "Total Emissions", main = "Total Emissions in Baltimore and LA")
points(both_sum[, 'year'], both_sum[, 3], type = 'l', col = "green")
dev.off()