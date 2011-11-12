#!/bin/bash

# past_new_loop.bash

# I use this script to push past predictions and then new predictions to bot4.us

cd /pt/w/b4/cj4b4/
. .cj

# Now for Forex,
# use expdp to copy data from active-fx-db into local-db:
echo 'echo scp -p ${CJ4B4}/bin/expdp_fx.bash z:${CJ4B4}/bin/expdp_fx.bash'
scp -p ${CJ4B4}/bin/expdp_fx.bash z:${CJ4B4}/bin/expdp_fx.bash

echo 'echo ssh z ${CJ4B4}/bin/expdp_fx.bash'
ssh z ${CJ4B4}/bin/expdp_fx.bash

echo 'echo rsync z:dpdump/fx.dpdmp ~/dpdump/'
rsync z:dpdump/fx.dpdmp ~/dpdump/

echo 'echo impdp trade/t table_exists_action=replace dumpfile=fx.dpdmp'
impdp trade/t table_exists_action=replace dumpfile=fx.dpdmp



# Copy data out of the DB into some partials:
echo 'echo cd ${CJ4B4}/predictions/fx_past/'
cd ${CJ4B4}/predictions/fx_past/

echo 'echo ./index_spec.bash'
./index_spec.bash

exit

cd ${CJ4B4}/predictions/a1_fx_past/
./index_spec.bash


# Copy data out of the DB into some partials:
cd /pt/w/b4/cj4b4/predictions/fx_new/
./index_spec.bash
cd /pt/w/b4/cj4b4/predictions/a1_fx_new/
./index_spec.bash



# Start with stocks, Copy data out of the DB into some partials:

cd /pt/w/b4/cj4b4/predictions/us_stk_past/
./index_spec.bash

cd /pt/w/b4/cj4b4/predictions/a1_us_stk_past/
./index_spec.bash

# Then, copy data out of local DB into some partials:
cd /pt/w/b4/cj4b4/predictions/us_stk_new/
./index_spec.bash
cd /pt/w/b4/cj4b4/predictions/us_stk_c/
./index_spec.bash
cd /pt/w/b4/cj4b4/predictions/a1_us_stk_new/
./index_spec.bash


# Now copy the new data to the Rails site:

cd /pt/w/b4/b4/
git add .
git commit -a -v -m past_new_loop.bash-commit
git push heroku master
git push origin master &

# Now, pull the new data into the Varnish-cache at the server:
/pt/w/b4/cj4b4/bin/wgetit.bash
