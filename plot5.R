# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

MD_NEI <- subset(NEI, fips=='24510' & type == 'ON-ROAD')

PM2.5_EM<-c(sum(MD_NEI[(MD_NEI$year==1999),]$Emissions),
sum(MD_NEI[(MD_NEI$year==2002),]$Emissions),
sum(MD_NEI[(MD_NEI$year==2005),]$Emissions),
sum(MD_NEI[(MD_NEI$year==2008),]$Emissions))

names(PM2.5_EM)<-c("1999","2002","2005","2008")
png("plot5.png",width=480,height=480)
barplot(PM2.5_EM, las=2,main=expression('Baltimore Total ON-ROAD Emission of PM'[2.5]),
xlab='Year', ylab=expression(paste('PM', ''[2.5])))
dev.off()
