#!/bin/bash

CLASSES=`./comparison.py $1 $2 | grep -v NOK`
echo $CLASSES

for clazz in $CLASSES
do
  echo $clazz
  ./verification.py $1 $2 $clazz
done
