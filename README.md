# Real-Life-projects
This repository consists of some of the real life usage of Python and Unix scripts.
## Conversion of sas7bdat dataset to parquet file
Convert to Parquet With Maven package.ipynb code convert all the sas7bdat files in a particular directory to .parquet file.

## Automation of house keeping 
It consists of multiple codes in following order
* 1. Casino_cleaning.sh 
  * 1.1 Casino_pdl_cleaning.py
  * 1.2 Casino_prep_cleaning.py
* 2. Casino_Weekly_cleaning.sh

Casino_cleaning.sh is a monthly housekeeping script that take cares of mainly 2 folder pdl and prep and uses python's pandas functionality in it.
Casino_weekly_cleaning.sh is a weekly house keeping and it purely uses Unix to do the same.
