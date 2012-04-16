#!/bin/bash

# us_stk_past_png_yr.bash
# Demo:
# ./us_stk_past_png_yr.bash 2012

# I use this script to create a png file for the splash page.
# The png file shows a weekly summary of DanBot performance.

# Using 2012 as a pattern,
# assume that us_stk_past_yr.sql 2012 has been run and CSV data landed here:
# /tmp/us_stk_sunday_l_2012.lst
# /tmp/us_stk_sunday_s_2012.lst

. /pt/w/b4/cj4b4/.cj
# Start by running us_stk_past_yr.sql to fill 2 txt files:
# /tmp/us_stk_sunday_l_${1}.lst
# /tmp/us_stk_sunday_s_${1}.lst

# cd to the right place
cd /pt/w/b4/cj/predictions/us_stk_past/
echo Running this sql script from $0:
echo @us_stk_past_yr.sql $1
sqt>/tmp/us_stk_past_yr_sql_out.txt<<EOF
@us_stk_past_yr.sql $1
EOF

echo 'WK, WEEK_OF, RROWNUM, PREDICTION_COUNT, SUM_G24HR, CUM_SUM' > /tmp/us_stk_sunday_l_${1}.csv
echo 'WK, WEEK_OF, RROWNUM, PREDICTION_COUNT, SUM_G24HR, CUM_SUM' > /tmp/us_stk_sunday_l_${1}.csv

grep '^201' /tmp/us_stk_sunday_l_${1}.lst >> /tmp/us_stk_sunday_l_${1}.csv
grep '^201' /tmp/us_stk_sunday_s_${1}.lst >> /tmp/us_stk_sunday_l_${1}.csv

/usr/bin/R -f us_stk_past_png_yr.r $1
cp /tmp/us_stk_sunday${1}.png /pt/w/b4/b4/public/images/

exit 0


