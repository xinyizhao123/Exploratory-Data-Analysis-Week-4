### Exploratory Data Analysis - Week 4 Assignment
## Question 2

library(data.table)

setwd("U:/Coursera/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

# calculate the total PM2.5 emissions
q2 <- setDT(NEI[NEI$fips == "24510",])[, .(total.pm25=sum(Emissions, na.rm=T)), by=year]

# plot the data
png("Plot2.png", width=480, height=480)
plot(q2$year, q2$total.pm25, xlab="Year", ylab="Total PM2.5 Emissions", pch=8, cex=2)
dev.off()