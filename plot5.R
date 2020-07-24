##This function plots Baltimore motor vehicle emissions by year.

##Load ggplot library
library(ggplot2)

#Read data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

##Subset data by city and type
baltimore_emissions <- subset(NEI, fips == "24510")
baltimore_motor <- subset(baltimore_emissions, type == "ON-ROAD")

##Aggregate data
totalmotoremissions <- aggregate(Emissions ~ year, baltimore_motor, sum)

##Save plot as PNG
png(file = "./plot5.png", width=600, height=480)
plot(totalmotoremissions$year, totalmotoremissions$Emissions, main = "Total Motor Vehicle Emissions of PM2.5 in Baltimore by Year", xlab = "Year", ylab = "Total Emissions", type = 'b', col = 'red')
dev.off()