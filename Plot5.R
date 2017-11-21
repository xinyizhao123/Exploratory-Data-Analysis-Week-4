### Exploratory Data Analysis - Week 4 Assignment
## Question 5

library(data.table)
library(ggplot2)

setwd("U:/Coursera/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# select emissions from coal combustion-related sources
SCC.vhc <- SCC[grep("[Vv]eh",SCC$Short.Name),]
NEI.vhc <- subset(NEI, NEI$SCC %in% SCC.vhc$SCC & fips == "24510")
NEI.vhc <- merge(x=NEI.vhc, y=SCC, by="SCC")

# calculate total PM2.5 emissions
q5 <- setDT(NEI.vhc)[, .(total.pm25=sum(Emissions, na.rm=T)), by=year]

# plot the data
png("Plot5.png", width=650, height=480)
ggplot(q5, aes(year, total.pm25))+ 
  geom_point(size=3) + 
  xlab("Year") +
  ylab("Total PM2.5 Emissions")
dev.off()