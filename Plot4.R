### Exploratory Data Analysis - Week 4 Assignment
## Question 4

library(data.table)
library(ggplot2)

setwd("U:/Coursera/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# select emissions from coal combustion-related sources
SCC.coal <- SCC[grep("[Cc]oal",SCC$EI.Sector),]
NEI.coal <- subset(NEI,NEI$SCC %in% SCC.coal$SCC)
NEI.coal <- merge(x=NEI.coal, y=SCC, by="SCC")

# calculate total PM2.5 emissions
q4 <- setDT(NEI.coal)[, .(total.pm25=sum(Emissions, na.rm=T)), by=year]

# plot the data
png("Plot4.png", width=650, height=480)
ggplot(q4, aes(year, total.pm25))+ 
  geom_point(size=3) + 
  xlab("Year") +
  ylab("Total PM2.5 Emissions")
dev.off()