#!/bin/bash

## Casino Monthly Cleaning

## For Pdl directory

cd /department/gld/casino/pdl/

find . -type f -mtime +1095 -printf "%p|%u|%t\n" | grep -v "time_period.sas7bdat" | grep -v "outputForCasino" | grep -v "inputFromCasino" | grep -v "seg" > old_files.txt

echo "no. of files to e deleted"

set -x #Echo on

wc -l old_files.txt

set +x #Echo off

echo "Running Python script"

python Casino_pdl_cleaning.py

cd /department/gld/casino/pdl/

cat ReqOut1.txt | sed -e 's/^"//' -e 's/"$//' >> ReqOut.txt

while read -r row; do
rm -f "$row"
done < ReqOut.txt

## For Prep directory

cd /department/gld/casino/prep/
find . -type f -mtime +1095 -printf "%p|%u|%t\n" | grep -v "./sasprogs" | grep -v "cm.sh" | grep -v "cm_EUR.sh" | grep -v "sas_grid/macros" > old_files.txt

echo "no. of files to e deleted"

set -x #Echo on

wc -l old_files.txt

set +x #Echo off

echo "Running Python script"

python Casino_prep_cleaning.py

cd /department/gld/casino/prep/

cat ReqOut1.txt | sed -e 's/^"//' -e 's/"$//' >> ReqOut.txt

while read -r row; do
rm -f "$row"
done < ReqOut.txt

## Delete files after cleaning is done
##Keeping the old_files.txt file for the reference
## And will get overwrite next month

rm ReqOut1.txt
rm ReqOut.txt

cd /department/gld/casino/pdl/
rm ReqOut1.txt
rm ReqOut.txt
