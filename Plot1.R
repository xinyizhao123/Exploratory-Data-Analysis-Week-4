### Exploratory Data Analysis - Week 4 Assignment
## Question 1

library(data.table)

setwd("U:/Coursera/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# calculate the total PM2.5 emissions
q1 <- setDT(NEI)[, .(total.pm25=sum(Emissions, na.rm=T)), by=year]

# plot the data
png("Plot1.png", width=480, height=480)
plot(q1$year, q1$total.pm25, xlab="Year", ylab="Total PM2.5 Emissions", pch=8, cex=2)
dev.off()
