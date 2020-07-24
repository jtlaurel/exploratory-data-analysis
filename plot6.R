##This function plots Los Angeles and Baltimore motor vehicle emissions by year.

##Load ggplot library
library(ggplot2)

##Read data
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

##Subset data by city and type
LAbalemissions <- subset(NEI, NEI$fips %in% c("24510", "06037"))
LAbalmotor <- subset(LAbalemissions, type == "ON-ROAD")

#Aggregate data
totalLAbalemissions <- aggregate(Emissions ~ fips + year, LAbalmotor, sum)

##Save plot as PNG
png(file = "./plot6.png", width=600, height=480)
ggplot(totalLAbalemissions, aes(year, Emissions, color = fips)) +
  geom_point() +
  geom_line() +
  xlab("Year") +
  ylab("Total Emissions") +
  ggtitle("Total Motor Vehicle Emissions of PM2.5 in Los Angeles and Baltimore") +
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore"))
dev.off()