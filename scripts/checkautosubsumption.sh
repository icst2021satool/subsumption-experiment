#!/bin/bash
#set -x
# Check autosubsumption and non-null subsumption vector properties
for v in `cat ../subsumption-data/project-identifiers.txt `
do
  echo "==> $v <==";
  # Autosubsumption property
  cat ../subsumption-data/checks-output/autosubsumption/autosubsumption-$v | grep "Warning: dua does not subsume itself"

  # non-null subsumption vector
  cat ../subsumption-data/checks-output/autosubsumption/autosubsumption-$v | grep "Warning: Subsumption vector is null for"

  cat ../subsumption-data/checks-output/autosubsumption/autosubsumption-$v | grep "has incoming edges."

  cat ../subsumption-data/checks-output/autosubsumption/autosubsumption-$v | grep "has auto edges."

  cat ../subsumption-data/checks-output/autosubsumption/autosubsumption-$v | grep "Fail to analyze: "
done
