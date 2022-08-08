#!/bin/bash

for v in `cat ../subsumption-data/project-identifiers.txt `
do
  echo "==> $v <==";
# Completeness property
echo "Completeness property"
cat ../subsumption-data/checks-output/verification/verification-$v | grep "Subsumption is not"

# Subsumption property
echo "Subsumption property"
cat ../subsumption-data/checks-output/verification/verification-$v | grep "Wrong subsumption:"

# Mutual exclusiveness property
echo "Mutual exclusiveness property"
cat ../subsumption-data/checks-output/verification/verification-$v | grep "Unconstrained leaves are not mutually"

# Fail to cover Unconstrained DUAs
echo "Fail to cover unconstrained DUAs property"
cat ../subsumption-data/checks-output/verification/verification-$v | grep "Unconstrained method"
done
