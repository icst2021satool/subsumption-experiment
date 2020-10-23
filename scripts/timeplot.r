file="../figures/subsumptiontimeplot.csv"
time.frame  <- read.csv(file.path(file), stringsAsFactors=FALSE)

mydata <- time.frame[c(2,3,4,6)]
mynames <- time.frame[1]
mydata.matrix <- data.matrix(mydata, rownames.force = NA)
mynames.matrix <- data.matrix(t(mynames),rownames.force = NA)

png(file="../figures/timeplot.png")
barplot(t(mydata.matrix), names.arg= mynames.matrix, ylim=c(0,350000), col=c("red", "green","blue","black"),beside=TRUE,las=2)
legend("top", c("Methods","DUAs", "t-DUA-node","t-Unc. DUAs(ms)"), col=c("red", "green","blue","black"), lwd=10)
dev.off()


file="../figures/subsumptiontimeplot.csv"
time.frame  <- read.csv(file.path(file), stringsAsFactors=FALSE)

mydata <- time.frame[c(3,6)]
mynames <- time.frame[1]
mydata.matrix <- data.matrix(mydata, rownames.force = NA)
mynames.matrix <- data.matrix(t(mynames),rownames.force = NA)

png(file="../figures/timeplot.png")
barplot(t(mydata.matrix), names.arg= mynames.matrix, ylim=c(0,350000), col=c("gray", "black"),beside=TRUE,las=2)
legend("top", c("DUAs","t-Unc. DUAs(ms)"),col=c("gray", "black"), lwd=10)
dev.off()
