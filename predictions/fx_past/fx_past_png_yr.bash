#!/bin/bash

# fx_past_png_yr.bash
# Demo:
# ./fx_past_png_yr.bash 2011

# I use this script to create a png file for the splash page for a specific year.
# The png file shows a weekly summary of fx-DanBot performance.

. /pt/w/b4/cj4b4/.cj
# Start by running fx_past_yr.sql to fill 2 txt files:
# /tmp/fx_sunday_l_${1}.lst
# /tmp/fx_sunday_s_${1}.lst

# cd to the right place
cd /pt/w/b4/cj/predictions/fx_past/
echo Running this sql script from $0:
echo @fx_past_yr.sql $1
sqt>/tmp/fx_past_yr_sql_out.txt<<EOF
@fx_past_yr.sql $1
EOF

echo 'WK, WEEK_OF, RROWNUM, PREDICTION_COUNT, SUM_G5N, CUM_SUM' > /tmp/fx_sunday_l_${1}.csv
echo 'WK, WEEK_OF, RROWNUM, PREDICTION_COUNT, SUM_G5N, CUM_SUM' > /tmp/fx_sunday_s_${1}.csv

grep '^201' /tmp/fx_sunday_l_${1}.lst >> /tmp/fx_sunday_l_${1}.csv
grep '^201' /tmp/fx_sunday_s_${1}.lst >> /tmp/fx_sunday_s_${1}.csv

/usr/bin/R -f fx_past_png_yr.r $1

set -x
cp /tmp/fx_sunday${1}.png /pt/w/b4/b4/public/images/

exit 0


