#!/bin/bash

# Shell to find methods whose data were not used in Weka

./comparison.py ~/experimentos/subsumption-experiment/jaguar-data/Weka/output/weka/ ~/experimentos/subsumption-experiment/subsumption-data/Weka/ \
| grep NOK | awk -F ":" '{print $1}' > skippedwekaclasses.txt
for v in `cat skippedwekaclasses.txt `; do cat ~/experimentos/subsumption-experiment/subsumption-data/nodesubsume.csv | grep $v; done | wc
