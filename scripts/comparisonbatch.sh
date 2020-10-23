#!/bin/bash

subsumptiondir=.. # Assumiing you're running in the scripts directory

./comparison.py $subsumptiondir/jaguar-data/jfreechart/1b/ $subsumptiondir/subsumption-data/Chart/ | grep NOK

./comparison.py $subsumptiondir/jaguar-data/commons-cli/1b $subsumptiondir/subsumption-data/Cli/ | grep NOK

./comparison.py $subsumptiondir/jaguar-data/closure-compiler/1b/ $subsumptiondir/subsumption-data/Closure/ | grep NOK

./comparison.py $subsumptiondir/jaguar-data/commons-codec/1b  $subsumptiondir/subsumption-data/Codec/ | grep NOK

./comparison.py $subsumptiondir/jaguar-data/commons-collections/25b  $subsumptiondir/subsumption-data/Collections/ | grep NOK

./comparison.py $subsumptiondir/jaguar-data/commons-compress/1b  $subsumptiondir/subsumption-data/Compress/ | grep NOK

./comparison.py $subsumptiondir/jaguar-data/commons-csv/1b  $subsumptiondir/subsumption-data/Csv  | grep NOK

./comparison.py $subsumptiondir/jaguar-data/gson/1b  $subsumptiondir/subsumption-data/Gson/ | grep NOK

./comparison.py $subsumptiondir/jaguar-data/jackson-core/1b/  $subsumptiondir/subsumption-data/JacksonCore/  | grep NOK

./comparison.py $subsumptiondir/jaguar-data/jackson-databind/1b/  $subsumptiondir/subsumption-data/JacksonDatabind/ | grep NOK

./comparison.py $subsumptiondir/jaguar-data/jackson-dataformat-xml/1b  $subsumptiondir/subsumption-data/JacksonXml/ | grep NOK

./comparison.py $subsumptiondir/jaguar-data/jsoup/1b  $subsumptiondir/subsumption-data/Jsoup/ | grep NOK

./comparison.py $subsumptiondir/jaguar-data/commons-jxpath/1b  $subsumptiondir/subsumption-data/JxPath/ | grep NOK

# We could not generate dynamic data for Lang. So this check will be enabled in the future
# ./comparison.py $subsumptiondir/jaguar-data/commons-lang/1b  $subsumptiondir/subsumption-data/Lang/ | grep NOK

./comparison.py $subsumptiondir/jaguar-data/commons-math/1b  $subsumptiondir/subsumption-data/Math/ | grep NOK

# We could not generate dynamic data for Mockito. So this check will be enabled in the future
# ./comparison.py $subsumptiondir/jaguar-data/mockito/1b  $subsumptiondir/subsumption-data/Mockito/

./comparison.py $subsumptiondir/jaguar-data/joda-time/1b  $subsumptiondir/subsumption-data/Time/ | grep NOK

# For Weka 66 class will fail the comparison test
./comparison.py $subsumptiondir/jaguar-data/Weka/output/weka/  $subsumptiondir/subsumption-data/Weka/ | grep NOK
