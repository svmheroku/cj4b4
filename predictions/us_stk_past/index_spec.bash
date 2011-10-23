#!/bin/bash

# index_spec.bash

# I use this script as a shell wrapper for index_spec.rb

. /pt/w/b4/cj4b4/.cj

# cd to the right place
cd $CJ4B4/predictions/us_stk_past/
echo now at:
pwd

./ibs5min_cpy.bash

bundle exec rspec index_spec.rb

exit 0
