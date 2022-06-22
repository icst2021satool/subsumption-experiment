#!/usr/bin/env bash
set -x
Identifiers="Chart Cli Closure Codec Collections Compress Csv Gson JacksonCore JacksonDatabind JacksonXml Jsoup JxPath Lang Math Mockito Time Weka"

for project in $Identifiers
do
  echo $project
  ./expand_project.sh $project
done
