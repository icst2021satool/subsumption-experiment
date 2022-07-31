#!/bin/bash
#set -x

timesubdir=../subsumption-data/checks-output/timedata

programsdir=../programs
subsumptiondir=../subsumption-data

dataflowsubsumptions="nodesubsume edgesubsume reduce"

Identifiers="Csv Cli Codec Jsoup JacksonXml Compress Gson Mockito JacksonCore JxPath Lang Time Collections JacksonDatabind Math Chart Closure elki-6465675 systemds-3.0.0-rc2 Weka stanford-corenlp-4.4.0"  

for project in $Identifiers
do

for subsumption in $dataflowsubsumptions
do
rm -f $timesubdir/Time-Data-$subsumption-$project.txt
touch $timesubdir/Time-Data-$subsumption-$project.txt
for i in {1..10}
do
#cat $timesubdir/$subsumption-$i-$project | grep "@@" | grep -v "Local DUA-"| grep -v "DUA-DUA subsumption" > $timesubdir/$subsumption-$i-$project.csv
TIME=`cat $timesubdir/$subsumption-$i-$project | grep "time (ms)"`
echo "$i:$TIME" >> $timesubdir/Time-Data-$subsumption-$project.txt
#rm -f $timesubdir/$subsumption-$i-$project
done
AVGTIME=`cat $timesubdir/Time-Data-$subsumption-$project.txt | awk -F: 'BEGIN{time=0} {time=time+$3} END{avgtime=time/10; print avgtime}'`
echo "$project:$subsumption:average time:$AVGTIME"
done
done
