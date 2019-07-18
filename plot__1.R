## Reading in emmisions data and classification code
setwd("C:/Users/Chris/Documents/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(grDevices)
cols <- rgb(.5, 0, .9, .9)

## Extracting total emissions by year in the United States then plotting
total_emissions <- tapply(NEI$Emissions, NEI$year, sum)
plot_data <- data.frame(total_emissions)
is.data.frame(plot_data)
cbind(cnn)

## Creating Plot "Total Emissions by Year in the United States"
png("plot__1.R", width = 500, height = 375)
plot1 <- barplot(total_emissions, col = cols,
     main = "Total Emissions by Year in the United States",
     xlab = "Year", ylab = 'Total PM2.5 Emissions (tons)')
dev.off()


