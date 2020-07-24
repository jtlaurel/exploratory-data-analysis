##This function plots US coal emissions by year.

##Load ggplot library
library(ggplot2)

##Read data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

##Subset data by SCC
coal <- SCC[grep("Coal|coal", SCC$Short.Name),]
coalemissions <- subset(NEI, NEI$SCC %in% coal$SCC)

##Aggregate data
totalcoalemissions <- aggregate(Emissions ~ year, coalemissions, sum)

##Save plot as PNG
png(file = "./plot4.png", width=600, height=480)
plot(totalcoalemissions$year, totalcoalemissions$Emissions, main = "Total Coal Emissions of PM2.5 in the United States by Year", xlab = "Year", ylab = "Total Emissions", type = 'b', col = 'red')
dev.off()