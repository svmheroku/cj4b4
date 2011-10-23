#!/bin/bash

# ibs5min_cpy.bash

# I use this script to create ibs5min_cpy and then keep it up to date.

cd /pt/w/b4/cj4b4/predictions/us_stk_past/

# Start by initially creating ibs5min_cpy.
# Creation of ibs5min_cpy needs to be done very rarely but it does need to be done at least once.
sqt<<EOF
CREATE TABLE ibs5min_cpy COMPRESS AS SELECT * FROM ibs5min;
EOF

# Next, I need to keep ibs5min_cpy up to date.

# data-pump recent rows from ibs5min into ibs5min_cpy.
rm -f ~/dpdump/ibs5min_cpy.dpdmp
expdp trade/t parfile=ibs5min_cpy.par
impdp trade/t dumpfile=ibs5min_cpy.dpdmp table_exists_action=append remap_table=ibs5min:ibs5min_cpy
# Now get recent rows from z2:
scp ibs5min_cpy.par z2:/tmp/
ssh z2 rm -f dpdump/ibs5min_cpy.dpdmp
ssh z2 expdp trade/t parfile=/tmp/ibs5min_cpy.par
rm -f ~/dpdump/ibs5min_cpy.dpdmp
scp z2:dpdump/ibs5min_cpy.dpdmp ~/dpdump/
impdp trade/t dumpfile=ibs5min_cpy.dpdmp table_exists_action=append remap_table=ibs5min:ibs5min_cpy

exit 0
