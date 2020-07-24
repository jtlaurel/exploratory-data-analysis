##This function plots total US emissions by year.

##Load ggplot library
library(ggplot2)

##Read data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

##Aggregate data
yearlyemissions <- aggregate(Emissions ~ year, NEI, sum)

##Save plot as PNG
png(file = "./plot1.png", width=600, height=480)
plot(yearlyemissions$year, yearlyemissions$Emissions, main = "Total Emissions of PM2.5 in the United States by Year", xlab = "Year", ylab = "Total Emissions", type = 'b', col = 'red')
dev.off()