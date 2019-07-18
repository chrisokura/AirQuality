## Reading in emmisions data and classification code
emissions_data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Data for Baltimore
subset_by_type <- subset(baltimore, by = 'type')
sum_by_type <- aggregate(baltimore$Emissions, by = list(baltimore$type, baltimore$year),
                   FUN = sum)
head(sum_by_type)
  
## Using ggplot2 to plot changes in PM2.5 in Baltimore by 'type'
library(ggplot2)
qplot(Group.2, x, data = sum_by_type, geom = "line", color = Group.1) +
   xlab("Year") + ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions in Baltimore by type")
