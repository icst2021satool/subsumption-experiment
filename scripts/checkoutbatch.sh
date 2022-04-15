#!/usr/bin/env bash
set -x
Identifiers="Chart Cli Closure Codec Compress Csv Gson JacksonCore JacksonDatabind JacksonXml Jsoup JxPath Lang Math Mockito Time"

for project in $Identifiers
do
  echo $project
  ./checkout_project.sh $project 1b
done

./checkout_project.sh Collections 25b
