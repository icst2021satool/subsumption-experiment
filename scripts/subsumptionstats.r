

listprograms <- c('Chart','Cli','Closure', 'Codec','Collections', 'Compress', 'Csv', 'Gson', 'JacksonCore', 'JacksonDatabind', 'JacksonXml', 'Jsoup', 'JxPath', 'Lang', 'Math','Mockito', 'Time', 'Weka')
yourpath="add you path here"

for (program in listprograms) {
print(program)
file = paste(yourpath,"subsumption-experiment/subsumption-data/", program, "/nodesubsume/nodesubsume-", program, ".csv",sep="")
#print(file)
csvfile  <- read.csv(file.path(file), stringsAsFactors=FALSE)
print(summary(csvfile))
totalduas=sum(csvfile$DUAs)
print(paste("#Duas:",totalduas))
print(paste("#Methods: ",nrow(csvfile)))
print(paste("Local DUA-node subsumption perc.:",round(100 * sum(csvfile$SubDUAs)/sum(csvfile$DUAs),1)))
}


listprograms <- c('Chart','Cli','Closure', 'Codec','Collections', 'Compress', 'Csv', 'Gson', 'JacksonCore', 'JacksonDatabind', 'JacksonXml', 'Jsoup', 'JxPath', 'Lang', 'Math','Mockito', 'Time', 'Weka')

for (program in listprograms) {

file = paste(yourpath,"subsumption-experiment/subsumption-data/", program, "/edgesubsume/edgesubsume-", program, ".csv",sep="")
#print(file)
csvfile  <- read.csv(file.path(file), stringsAsFactors=FALSE)
print(summary(csvfile))
totalduas=sum(csvfile$DUAs)
print(program)
print(paste("#Duas:",totalduas))
print(paste("#Methods: ",nrow(csvfile)))
print(paste("Local DUA-edge subsumption perc.:",round(100 * sum(csvfile$SubDUAs)/sum(csvfile$DUAs),1)))
}

listprograms <- c('Chart','Cli','Closure', 'Codec','Collections', 'Compress', 'Csv', 'Gson', 'JacksonCore', 'JacksonDatabind', 'JacksonXml', 'Jsoup', 'JxPath', 'Lang', 'Math','Mockito', 'Time', 'Weka')

for (program in listprograms) {

file = paste(yourpath,"subsumption-experiment/subsumption-data/", program, "/duaduasubsume/duaduasubsume-", program, ".csv",sep="")
#print(file)
csvfile  <- read.csv(file.path(file), stringsAsFactors=FALSE)
print(summary(csvfile))
totalduas=sum(csvfile$DUAs)
print(program)
print(paste("#Duas:",totalduas))
print(paste("#Methods: ",nrow(csvfile)))
print(paste("Local DUA-DUA subsumption perc.:",round(100 * sum(csvfile$UDUAs)/sum(csvfile$DUAs),1)))
}
