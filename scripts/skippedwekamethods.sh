#!/bin/bash

# Shell to find methods whose data were not used in Weka

./comparison.py ../jaguar-data/Weka/output/weka/ ../subsumption-data/Weka/ \
| grep NOK | awk -F ":" '{print $1}' > skippedwekaclasses.txt
for v in `cat skippedwekaclasses.txt `; do cat ../subsumption-data/checks-output/allprograms/nodesubsume.csv | grep $v; done | wc
rm -f skippedwekaclasses.txt
