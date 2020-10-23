# Create the function.
getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

file1 = paste("../subsumption-data/checks-output/allprograms/", "nodesubsume", ".csv",sep="")
node = read.csv(file.path(file1), stringsAsFactors=FALSE)

file2 = paste("../subsumption-data/checks-output/allprograms/", "edgesubsume", ".csv",sep="")
edge  <- read.csv(file.path(file2), stringsAsFactors=FALSE)

file3 = paste("../subsumption-data/checks-output/allprograms/", "duaduasubsume", ".csv",sep="")
dua  <- read.csv(file.path(file3), stringsAsFactors=FALSE)

edge100 = subset(edge, DUAs >= 100)
node100 = subset(node, DUAs >= 100)
dua100 = subset(dua, DUAs >= 100)

pnode <- hist(node100$Perc,plot=FALSE)
pedge <- hist(edge100$Perc,plot=FALSE)
pdua <- hist(dua100$UPerc,plot=FALSE)

plot(0,0,type="n",xlim=c(0,100),ylim=c(0,300),xlab="Percentage",ylab="Frequency",main="")
plot(pnode,col="gray",add=TRUE)
plot(pedge,col="black",density=10,angle=135,add=TRUE)
text(pedge$mids,pedge$counts,labels=pedge$counts, adj=c(0.5, -0.5))
text(pnode$mids,pnode$counts,labels=pnode$counts, adj=c(0.5, -0.5))
#legend("topright", c("DUA-node", "DUA-edge"), col=c("gray", "black"), lwd=10)
legend(x=70,y=300,"DUA-edge", col="black",density=10,angle=135, lwd=0)
legend(x=0,y=300,"DUA-node", col="gray", lwd=4)

# Scripts to generate figures

png(file="../figures/nodeedge100.png")
plot(0,0,type="n",xlim=c(0,100),ylim=c(0,300),xlab="Percentage",ylab="Frequency",main="")
plot(pnode,col="gray",add=TRUE)
plot(pedge,col="black",density=10,angle=135,add=TRUE)
text(pedge$mids,pedge$counts,labels=pedge$counts, adj=c(0.5, -0.5))
text(pnode$mids,pnode$counts,labels=pnode$counts, adj=c(0.5, -0.5))
#legend("topright", c("DUA-node", "DUA-edge"), col=c("gray", "black"), lwd=10)
legend(x=70,y=300,"DUA-edge", col="black",density=10,angle=135, lwd=1)
legend(x=0,y=300,"DUA-node", col="gray", lwd=4)
dev.off()

png(file="../figures/edge100.png")
plot(0,0,type="n",xlim=c(0,100),ylim=c(0,250),xlab="Percentage",ylab="Frequency",main="")
plot(pedge,col="gray",density=10,angle=135,add=TRUE)
text(pedge$mids,pedge$counts,labels=pedge$counts, adj=c(0.5, -0.5))
dev.off()

png(file="../figures/node100.png")
plot(0,0,type="n",xlim=c(0,100),ylim=c(0,250),xlab="Percentage",ylab="Frequency",main="")
plot(pnode,col="gray",density=10,angle=135,add=TRUE)
text(pnode$mids,pnode$counts,labels=pnode$counts, adj=c(0.5, -0.5))
dev.off()

png(file="../figures/dua100.png")
plot(0,0,type="n",xlim=c(0,100),ylim=c(0,550),xlab="Percentage",ylab="Frequency",main="")
plot(pdua,col="gray",add=TRUE)
text(pdua$mids,pdua$counts,labels=pdua$counts, adj=c(0.5, -0.5))
legend("topright", c("Unc. DUAs Perc."), col=c("gray"), lwd=10)
dev.off()
