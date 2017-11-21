### Exploratory Data Analysis - Week 4 Assignment
## Question 6

library(data.table)
library(ggplot2)

setwd("U:/Coursera/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# select emissions from coal combustion-related sources
SCC.vhc <- SCC[grep("[Vv]eh",SCC$Short.Name),]
NEI.vhc <- subset(NEI, NEI$SCC %in% SCC.vhc$SCC & NEI$fips %in% c("24510","06037"))
NEI.vhc <- merge(x=NEI.vhc, y=SCC, by="SCC")
NEI.vhc$City[NEI.vhc$fips == "24510"] <- "Baltimore"
NEI.vhc$City[NEI.vhc$fips == "06037"] <- "Los Angeles"

# calculate total PM2.5 emissions
q6 <- setDT(NEI.vhc)[, .(total.pm25=sum(Emissions, na.rm=T)), by=list(City, year)]

# plot the data
png("Plot6.png", width=650, height=480)
ggplot(q6, aes(year, total.pm25, col=City))+ 
  geom_point(size=3) + 
  xlab("Year") +
  ylab("Total PM2.5 Emissions")
dev.off()
