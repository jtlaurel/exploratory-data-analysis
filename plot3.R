##This function plots Baltimore emissions by year sorted by source type.

##Load ggplot library
library(ggplot2)

##Read data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

##Subset data by city
baltimore_emissions <- subset(NEI, fips == "24510")

##Aggregate data
baltimore_typeemissions <- aggregate(Emissions ~ type + year, baltimore_emissions, sum)

##Save plot as PNG
png(file = "./plot3.png", width=600, height=480)
ggplot(baltimore_typeemissions, aes(year, Emissions, color = type))+
  geom_point() +
  geom_line() +
  xlab("Year") +
  ylab("Total Emissions") +
  ggtitle("Total Emissions of PM2.5 in Baltimore by Year sorted by Source Type") +
  scale_colour_discrete(name = "Source")
dev.off()