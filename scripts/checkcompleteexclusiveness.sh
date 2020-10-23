#!/bin/bash

# Check completeness and mutual exclusiveness properties

for v in `cat ../subsumption-data/project-identifiers.txt `
do
  echo "==> $v <==";
  # Completeness property
  cat ../subsumption-data/checks-output/completeexclusiveness/completeexclusiveness-$v | grep "Subsumption is not covering all duas for"
  # Mutual exclusiveness property
  cat ../subsumption-data/checks-output/completeexclusiveness/completeexclusiveness-$v | grep "Unconstrained leaves are not mutually exclusive for testcase"
done
