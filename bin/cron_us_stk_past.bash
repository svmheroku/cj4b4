#!/bin/bash

# cron_us_stk_past.bash

# I use this script to copy data out of the DB into some partials.
# Then, it uses git to copy those partials to the Rails site.

# If the /tmp/cron_us_stk_past_is_busy.txt exists, I should exit.

if [ -e "/tmp/cron_us_stk_past_is_busy.txt" ]; then
   echo The /tmp/cron_us_stk_past_is_busy.txt exists.
   echo If the /tmp/cron_us_stk_past_is_busy.txt exists, I should exit.
   exit
else
  date > /tmp/cron_us_stk_past_is_busy.txt

  # Start with stocks, Copy data out of the DB into some partials:

  cd /pt/w/b4/cj4b4/predictions/us_stk_past/
  ./index_spec.bash

  cd /pt/w/b4/cj4b4/predictions/a1_us_stk_past/
  ./index_spec.bash

  # Now copy the new data to the Rails site:

  set -x

  cd /pt/w/b4/b4/
  git add .
  git commit -a -v -m cron_us_stk_past.bash-commit
  git push heroku master
  git push origin master &

  # Now, pull the new data into the Varnish-cache at the server:
  /pt/w/b4/cj4b4/bin/wgetit.bash

  rm -f /tmp/cron_us_stk_past_is_busy.txt
fi

exit 0
