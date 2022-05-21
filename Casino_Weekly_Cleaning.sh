#!/bin/bash

## Casino weekly cleaning

## for Trans directory

cd /department/gld/casino/pdl/trans/

##Setting up the parameter

var=$(ls itm_ex*| awk '{print substr($1,8,6)}' | head -1)
var1=$(echo $var | sed 's/ //g')
echo $var1

echo "Files to be deleted"

set -x #Echo on
ls itm_ex_${var1}.sas7bdat
ls itm_${var1}.sas7bdat
ls bas_ex_${var1}.sas7bdat
ls bas_${var1}.sas7bdat
set +x #Echo off

echo "Deleting the files"

set -x #Echo on
rm itm_ex_${var1}.sas7bdat
rm itm_${var1}.sas7bdat
rm bas_ex_${var1}.sas7bdat
rm bas_${var1}.sas7bdat
set +x #Echo off

## for CRM directory

cd /department/gld/casino/pdl/crm/

##Setting up the parameter



echo "Files to be deleted"

set -x #Echo on
ls reward_${var1}.sas7bdat
ls emis_redem_${var1}.sas7bdat
ls ach_${var1}.sas7bdat
set +x #Echo off

echo "Deleting the files"

set -x
rm reward_${var1}.sas7bdat
rm emis_redem_${var1}.sas7bdat
rm ach_${var1}.sas7bdat
set +x

#Casino Bi-Weekly

cd /department/gld/casino
currday=$(date +%Y%m%d)
du -ch --time --max-depth 2 > space_check_${currday}.txt
