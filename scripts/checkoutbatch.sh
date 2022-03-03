#!/usr/bin/env bash
set -x
Identifiers="Chart Cli Closure Codec Collections Compress Csv Gson JacksonCore JacksonDatabind JacksonXml Jsoup JxPath Math Time"

for project in $Identifiers
do
  echo $project
  ./checkout_project.sh $project 1b
done
