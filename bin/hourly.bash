#!/bin/bash

# hourly.bash

# I use this script to copy data out of the DB into some partials.
# Then, it uses git to copy those partials to the Rails site.

cd /pt/w/b4/cj4b4/bin/
./hourly_fx.bash
./hourly_us_stk.bash

exit 0
