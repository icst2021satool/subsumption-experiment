#!/bin/bash

# Weka has another format

set -x
subsumptiondir="../subsumption-data/"
jaguardir="../jaguar-data/"
verificationfile="../subsumption-data/checks-output/verification/verification-"

Identifiers="Chart Cli Closure Codec Collections Compress Csv Gson JacksonCore JacksonDatabind JacksonXml Jsoup JxPath Lang Math Mockito Time Weka"

for project in $Identifiers
do
  echo $project
  program=""
  if test $project == "Chart"
  then
     program="jfreechart/1b"
  fi
  if test $project == "Cli"
  then
     program="commons-cli/1b"
  fi
  if test $project == "Closure"
  then
     program="closure-compiler/1b"
  fi
  if test $project == "Codec"
  then
     program="commons-codec/1b"
  fi
  if test $project == "Collections"
  then
     program="commons-collections/25b"
  fi
  if test $project == "Compress"
  then
     program="commons-compress/1b"
  fi
  if test $project == "Csv"
  then
     program="commons-csv/1b"
  fi
  if test $project == "Gson"
  then
     program="gson/1b"
  fi
  if test $project == "JacksonCore"
  then
     program="jackson-core/1b"
  fi
  if test $project == "JacksonDatabind"
  then
     program="jackson-databind/1b"
  fi
  if test $project == "JacksonXml"
  then
     program="jackson-dataformat-xml/1b"
  fi
  if test $project == "Jsoup"
  then
     program="jsoup/1b"
  fi
  if test $project == "JxPath"
  then
     program="commons-jxpath/1b"
  fi
  if test $project == "Lang"
  then
     program="commons-lang/1b"
  fi
  if test $project == "Math"
  then
     program="commons-math/1b"
  fi
  if test $project == "Mockito"
  then
     program="mockito/1b"
  fi
  if test $project == "Time"
  then
     program="joda-time/1b"
  fi

  if test $project == "Weka"
  then
     program="Weka/output/weka/"
  fi

  echo ${subsumptiondir}${project}
  echo ${jaguardir}${program}

  if test -d ${subsumptiondir}${project}
  then
    if test -d  ${jaguardir}${program}
    then
      ./verificationallclasses.sh ${jaguardir}${program} ${subsumptiondir}${project} >& $verificationfile$project
    else
      echo "Dir ${jaguardir}${program} does not exist"
    fi
  else
    echo "Dir ${subsumptiondir}${project} does not exist"
  fi
done
