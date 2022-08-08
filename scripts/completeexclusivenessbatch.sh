#!/bin/bash

# Checks the completeness and mutual exclusiveness properties for all programs
#
#set -x
subsumptiondir="../subsumption-data/"

file="../subsumption-data/checks-output/completeexclusiveness/completeexclusiveness-"

Identifiers="Chart Cli Closure Codec Collections Compress Csv Gson JacksonCore JacksonDatabind JacksonXml Jsoup JxPath Lang Math Mockito Time Weka systemds-3.0.0-rc2 elki-6465675 stanford-corenlp-4.4.0"

for project in $Identifiers
do
  echo $project
  echo ${subsumptiondir}${project}
  echo ${jaguardir}${program}

  if test -d ${subsumptiondir}${project}
  then
    ./completeexclusiveness.py ${subsumptiondir}${project} >& $file$project
  else
    echo "Dir ${subsumptiondir}${project} does not exist"
  fi
done
