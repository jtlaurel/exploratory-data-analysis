##This function plots total Baltimore emissions by year.

##Load ggplot library
library(ggplot2)

##Read data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

##Subset data by city
baltimore_emissions <- subset(NEI, fips == "24510")

##Aggregate data
baltimore_yearlyemissions <- aggregate(Emissions ~ year, baltimore_emissions, sum)

##Save plot as PNG
png(file = "./plot2.png", width=600, height=480)
plot(baltimore_yearlyemissions$year, baltimore_yearlyemissions$Emissions, main = "Total Emissions of PM2.5 in Baltimore by Year", xlab = "Year", ylab = "Total Emissions", type = 'b', col = 'red')
dev.off()