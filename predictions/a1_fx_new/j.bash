#!/bin/bash

# index_spec.bash

# I use this script as a shell wrapper for index_spec.rb

. /pt/w/b4/cj4b4/.cj

# cd to the right place
cd $CJ4B4/predictions/a1_fx_new/
echo now at:
pwd

# bundle exec rspec -e a1_fx_new.sql index_spec.rb
bundle exec rspec -e Nokogiri index_spec.rb
