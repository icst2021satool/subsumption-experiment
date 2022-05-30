#!/usr/bin/env bash
#set -x
Identifiers="Chart Cli Closure Codec Compress Csv Gson JacksonCore JacksonDatabind JacksonXml Jsoup JxPath Math Time"

for project in $Identifiers
do
  echo $project
  ./assert_project.sh $project 1b
done

./assert_project.sh Collections 25b
./assert_jaguar.py Weka 3.8 ../jaguar-data/Weka/output/weka/jaguar
