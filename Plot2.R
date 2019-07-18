## Reading in emmisions data and classification code
emissions_data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Total emissions in Baltimore by year
baltimore <- subset(emissions_data, fips == "24510")
baltimore_by_year <- aggregate(baltimore$Emissions, by = list(baltimore$year), FUN = sum)
year <- c(baltimore_by_year$Group.1)
emissions_by_year <- c(baltimore_by_year$x)


## Plotting total emissions by year in Baltimore
head(baltimore_by_year)
par(mar = c(4,4,2,1))
plot(year, emissions_by_year, pch = 20, col = 'blue',
     main = "Emissions in Baltimore by Year",
     xlab = 'year', ylab= 'PM2.5')

        