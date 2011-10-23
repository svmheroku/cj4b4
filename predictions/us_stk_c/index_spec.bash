#!/bin/bash

# index_spec.bash

# I use this script as a shell wrapper for index_spec.rb

. /pt/w/b4/cj4b4/.cj

# cd to the right place
echo 'cd $CJ4B4/predictions/us_stk_c/'
cd $CJ4B4/predictions/us_stk_c/
echo now at:
pwd

echo 'bundle exec rspec index_spec.rb'
bundle exec rspec index_spec.rb

exit 0
