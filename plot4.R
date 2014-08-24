# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Coal combustion related sources
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
# Merge two data sets
MD_NEI <- merge(x=NEI, y=SCC.coal, by='SCC')


PM2.5_EM<-c(sum(MD_NEI[(MD_NEI$year==1999),]$Emissions),
sum(MD_NEI[(MD_NEI$year==2002),]$Emissions),
sum(MD_NEI[(MD_NEI$year==2005),]$Emissions),
sum(MD_NEI[(MD_NEI$year==2008),]$Emissions))

names(PM2.5_EM)<-c("1999","2002","2005","2008")
png("plot4.png",width=480,height=480)
plot(1:4, PM2.5_EM/1000,'o',main=expression('Total Coal Emission of PM'[2.5]),
xaxt="n",xlab=NA, ylab=expression(paste('PM', ''[2.5],' in Kilotons')))
axis(1,at=c(1,2,3,4),c("1999","2002","2005","2008"))
dev.off()

