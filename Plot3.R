### Exploratory Data Analysis - Week 4 Assignment
## Question 3

library(data.table)
library(ggplot2)

setwd("U:/Coursera/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# calculate the total PM2.5 emissions
q3 <- setDT(NEI[NEI$fips == "24510",])[, .(total.pm25=sum(Emissions, na.rm=T)), by=list(year,type)]

# plot the data
png("Plot3.png", width=650, height=480)
ggplot(data = q3, aes(year, total.pm25))+ 
  geom_point(size=2) + 
  geom_path() +
  facet_grid(. ~type) +
  xlab("Year") +
  ylab("Total PM2.5 Emissions")
dev.off()