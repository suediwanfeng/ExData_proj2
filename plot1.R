# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

PM2.5_EM<-c(sum(NEI[(NEI$year==1999),]$Emissions),
sum(NEI[(NEI$year==2002),]$Emissions),
sum(NEI[(NEI$year==2005),]$Emissions),
sum(NEI[(NEI$year==2008),]$Emissions))

names(PM2.5_EM)<-c("1999","2002","2005","2008")
png("plot1.png",width=480,height=480)
barplot(PM2.5_EM/1000, las=2,main=expression('Total Emission of PM'[2.5]),
xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()
