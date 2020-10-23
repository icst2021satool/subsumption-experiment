#!/bin/bash
# Counts the number of methods executed by the tests of Defects4J programs versions 1b and 25b and Weka 3.8 for the experiment


#set -x

verificationfile="../subsumption-data/checks-output/verification/verification-"

# Mockit and Lang have no testing data
PROJECTS="Chart Cli Closure Codec Collections Compress Csv Gson JacksonCore JacksonDatabind JacksonXml Jsoup JxPath Math Time Weka"

rm -f count.txt
touch count.txt
for projectid in $PROJECTS
do
  echo "===> $projectid <==="
  MCOUNT=`cat $verificationfile$projectid | grep "Methods executed" |  awk -F: 'BEGIN {counter = 0} {counter = counter + $2} END {print counter}'`
  echo $MCOUNT
  echo $MCOUNT >> count.txt
done
cat count.txt | awk 'BEGIN {counter = 0} {counter = counter + $1} END {print "Total of executed methods:" counter}'
rm -f count.txt
