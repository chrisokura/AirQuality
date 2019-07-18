## Reading in emmisions data and classification code
emissions <- readRDS("summarySCC_PM25.rds")
SC <- readRDS("Source_Classification_Code.rds")

## How have emissions from coal combustion related sources changed
## from 1998 to 2008? Obtaining observations with coal in name
head(emissions_data)
coal <- grepl('coal', SC$Short.Name, ignore.case = TRUE)
SC_coal <- SC[coal,]
merge <- merge(emissions, SC_coal, by = "SCC")
coal_emissions <- tapply(merge$Emissions, merge$year, sum)
head(coal_emissions)

## Creating plot
library(grDevices)
library(RColorBrewer)
cols <- brewer.pal(4, "BuGn")
barplot(coal_emissions, col = cols,
        xlab = "year", ylab = "PM2.5 emission",
        main = "Emissions by Year")

