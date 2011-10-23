#!/bin/bash

# hourly_us_stk.bash

# Although this script is called "hourly" it loads the host too much.
# I want to run it once or twice at night after the market closes.

# I use this script to copy data out of the DB into some partials.
# Then, it uses git to copy those partials to the Rails site.


# If the /tmp/script_hourly_us_stk_busy.txt exists, I should exit.

if [ -e "/tmp/script_hourly_us_stk_busy.txt" ]; then
   echo The /tmp/script_hourly_us_stk_busy.txt exists.
   echo If the /tmp/script_hourly_us_stk_busy.txt exists, I should exit.
   exit
else
  date > /tmp/script_hourly_us_stk_busy.txt

  # Start with stocks, Copy data out of the DB into some partials:

  cd /pt/w/b4/cj4b4/predictions/us_stk_past/
  ./index_spec.bash

  cd /pt/w/b4/cj4b4/predictions/a1_us_stk_past/
  ./index_spec.bash

  # Now copy the new data to the Rails site:

  set -x

  cd /pt/w/b4/b4/
  git add .
  git commit -a -v -m hourly.bash-commit
  git push heroku master
  git push origin master &

  # Now, pull the new data into the Varnish-cache at the server:
  /pt/w/b4/cj4b4/bin/wgetit.bash

  rm -f /tmp/script_hourly_us_stk_busy.txt
fi

exit 0
