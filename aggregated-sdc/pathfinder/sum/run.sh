#!/bin/bash


if [ "$#" -ne 1 ]; then
   echo "please provide per-inst-sdc-llfi folder and exec-count folder path as inputs"
   exit 1
fi

perInstSDCFile="$1"
$EXEC_PATH="$2"

mkdir Result
mkdir Input

#python3 getFailureRates.py $LLFI_PATH 30000
#mv Result/per-inst-sdc-rates.csv Input/
python3 calcSum.py exec-count $perInstSDCFile

