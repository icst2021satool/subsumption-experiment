#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

# test if there is at least one argument: if not, return an error
if (length(args)==0) {
  stop("You should provide root directory (input file).n", call.=FALSE)
} else if (length(args)==1) {
        # set yourpath
	       print(args[1])
        yourpath=paste(args[1],"/", sep="")
	print(yourpath)
} else {
  stop("Too many arguments supplied (input file).n", call.=FALSE)
}

listprograms <- c( 'Csv', 'Cli', 'Codec',  'Jsoup', 'JacksonXml', 'Compress', 'Gson', 'Mockito',  'JacksonCore',  'JxPath',  'Lang', 'Time','Collections',  'JacksonDatabind', 'Math', 'Chart', 'Closure', 'elki-6465675', 'systemds-3.0.0-rc2',  'Weka', 'stanford-corenlp-4.4.0')

allmethodstot <- 0
allduastot <- 0

for (program in listprograms) {
#print(program)
file = paste(yourpath,"subsumption-experiment/subsumption-data/", program, "/nodesubsume/nodesubsume-", program, ".csv",sep="")
#print(file)
csvfile  <- read.csv(file.path(file), stringsAsFactors=FALSE)
#print(summary(csvfile))
totalduas=sum(csvfile$DUAs)
print(paste(program,"#Duas:",totalduas))
print(paste(program,"#Methods: ",nrow(csvfile)))
print(paste(program,  "Local DUA-node subsumption perc.:",round(100 * sum(csvfile$SubDUAs)/sum(csvfile$DUAs),1)))
allmethodstot <- allmethodstot+nrow(csvfile)
allduastot <- totalduas + allduastot
}

print(paste("Local DUA-node Total #Methods:", allmethodstot))
print(paste("Local DUA-node Total #DUAs:", allduastot))

listprograms <- c( 'Csv', 'Cli', 'Codec',  'Jsoup', 'JacksonXml', 'Compress', 'Gson', 'Mockito',  'JacksonCore',  'JxPath',  'Lang', 'Time','Collections',  'JacksonDatabind', 'Math', 'Chart', 'Closure', 'elki-6465675', 'systemds-3.0.0-rc2',  'Weka', 'stanford-corenlp-4.4.0')

allmethodstot <- 0
allduastot <- 0

for (program in listprograms) {

file = paste(yourpath,"subsumption-experiment/subsumption-data/", program, "/edgesubsume/edgesubsume-", program, ".csv",sep="")
#print(file)
csvfile  <- read.csv(file.path(file), stringsAsFactors=FALSE)
#print(summary(csvfile))
totalduas=sum(csvfile$DUAs)
#print(program)
print(paste(program,"#Duas:",totalduas))
print(paste(program,"#Methods: ",nrow(csvfile)))
print(paste(program,"Local DUA-edge subsumption perc.:",round(100 * sum(csvfile$SubDUAs)/sum(csvfile$DUAs),1)))
allmethodstot <- allmethodstot + nrow(csvfile)
allduastot <- totalduas + allduastot
}

print(paste("Local DUA-edge Total #Methods:", allmethodstot))
print(paste("Local DUA-edge Total #DUAs:", allduastot))

listprograms <- c( 'Csv', 'Cli', 'Codec',  'Jsoup', 'JacksonXml', 'Compress', 'Gson', 'Mockito',  'JacksonCore',  'JxPath',  'Lang', 'Time','Collections',  'JacksonDatabind', 'Math', 'Chart', 'Closure', 'elki-6465675', 'systemds-3.0.0-rc2',  'Weka', 'stanford-corenlp-4.4.0')

allmethodstot <- 0
allduastot <- 0
for (program in listprograms) {

file = paste(yourpath,"subsumption-experiment/subsumption-data/", program, "/duaduasubsume/duaduasubsume-", program, ".csv",sep="")
#print(file)
csvfile  <- read.csv(file.path(file), stringsAsFactors=FALSE)
#print(summary(csvfile))
totalduas=sum(csvfile$DUAs)
#print(program)
print(paste(program,"#Duas:",totalduas))
print(paste(program,"#Methods: ",nrow(csvfile)))
print(paste(program, "Local DUA-DUA subsumption perc.:",round(100 * sum(csvfile$UDUAs)/sum(csvfile$DUAs),1)))
allmethodstot <- allmethodstot+nrow(csvfile)
allduastot <- totalduas + allduastot  
}

print(paste("DUA-DUA Total #Methods:", allmethodstot))
print(paste("DUA-DUA Total #DUAs:", allduastot))
