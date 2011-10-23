#!/bin/bash

# wgetit.bash

# I use this script to load the Varnish-cache with some links.

cd /tmp/

rm -f index.html index.html.*
rm -f predictions fx us_stk fx_new fx_past us_stk_new us_stk_past contact blog site_map leadership_team glossary faq
rm -f books tos about index disclaimer
rm -f predictions.? fx.? us_stk.? fx_new.? fx_past.? us_stk_new.? us_stk_past.? contact.? blog.? site_map.?
rm -f glossary.?  leadership_team.? books.? tos.? about.? index.? a1_fx_past.* faq.* disclaimer.*

wget http://bot4.herokuapp.com

wget http://bot4.herokuapp.com/predictions

wget http://bot4.herokuapp.com/predictions/fx
wget http://bot4.herokuapp.com/predictions/us_stk

wget http://bot4.herokuapp.com/fx_new
wget http://bot4.herokuapp.com/fx_past

wget http://bot4.herokuapp.com/us_stk_new
wget http://bot4.herokuapp.com/us_stk_c
wget http://bot4.herokuapp.com/us_stk_past

wget http://bot4.herokuapp.com/blog
wget http://bot4.herokuapp.com/books
wget http://bot4.herokuapp.com/contact
wget http://bot4.herokuapp.com/glossary
wget http://bot4.herokuapp.com/leadership_team
wget http://bot4.herokuapp.com/site_map
wget http://bot4.herokuapp.com/tos
wget http://bot4.herokuapp.com/disclaimer

wget http://bot4.herokuapp.com/a1/
wget http://bot4.herokuapp.com/a1/about
wget http://bot4.herokuapp.com/a1/blog
wget http://bot4.herokuapp.com/a1/fx
wget http://bot4.herokuapp.com/a1/faq
wget http://bot4.herokuapp.com/a1/us_stk
wget http://bot4.herokuapp.com/a1/books
wget http://bot4.herokuapp.com/a1/contact
wget http://bot4.herokuapp.com/a1/glossary
wget http://bot4.herokuapp.com/a1/leadership_team
wget http://bot4.herokuapp.com/a1/predictions
wget http://bot4.herokuapp.com/a1/tos
wget http://bot4.herokuapp.com/a1/disclaimer
wget http://bot4.herokuapp.com/a1_fx_past

exit 0
