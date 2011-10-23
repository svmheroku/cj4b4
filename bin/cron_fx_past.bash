#!/bin/bash

# cron_fx_past.bash

# I use this script to copy data out of the DB into some partials.
# Then, it uses git to copy those partials to the Rails site.

# If the /tmp/cron_fx_past_is_busy.txt exists, I should exit.

if [ -e "/tmp/cron_fx_past_is_busy.txt" ]; then
   echo The /tmp/cron_fx_past_is_busy.txt exists.
   echo If the /tmp/cron_fx_past_is_busy.txt exists, I should exit.
   exit
else
  date > /tmp/cron_fx_past_is_busy.txt

  cd /pt/w/b4/cj4b4/
  . ./.cj

  # Now for Forex,
  # use expdp to copy data from active-fx-db into local-db:
  ssh z /pt/w/b4/cj4b4/bin/expdp_fx.bash

  rsync z:dpdump/fx.dpdmp ~/dpdump/
  impdp trade/t table_exists_action=replace dumpfile=fx.dpdmp

  # Copy data out of the DB into some partials:
  cd ${CJ4B4}/predictions/fx_past/
  ./index_spec.bash
  cd ${CJ4B4}/predictions/a1_fx_past/
  ./index_spec.bash

  # Now copy the new data to the Rails site:

  set -x

  cd $B4
  git add .
  git commit -a -v -m cron_fx_past.bash-commit
  git push heroku master
  git push origin master &

  # Now, pull the new data into the Varnish-cache at the server:
  ${CJ4B4}/bin/wgetit.bash &

  rm -f /tmp/cron_fx_past_is_busy.txt

fi
exit 0
