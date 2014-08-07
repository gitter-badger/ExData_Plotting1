#! /bin/ksh

datafile=household_power_consumption.txt
filtered=power.txt

# copy the column headings and extract Feb 1,2 2007 data
# Note: the data spec for the date is a lie.
# It shows the date as dd/mm/yyyy. Apparently it is d/m/yyyy

head -1              $datafile  > $filtered
grep "^[1-2]/2/2007" $datafile  >> $filtered
wc -l $filtered

## time filter.sh
##     2881 power.txt
## 
## real	0m1.968s
## user	0m1.941s
## sys	0m0.027s
