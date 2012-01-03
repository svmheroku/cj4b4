#!/bin/bash

# wgetit.bash

# I use this script to load the Varnish-cache with some links.

cd /tmp/

rm -f index.html index.html.*
rm -f predictions fx us_stk fx_new fx_past us_stk_new us_stk_past contact blog site_map leadership_team glossary faq
rm -f books tos about index disclaimer
rm -f predictions.? fx.? us_stk.? fx_new.? fx_past.? us_stk_new.? us_stk_past.? contact.? blog.? site_map.?
rm -f glossary.?  leadership_team.? books.? tos.? about.? index.? a1_fx_past.* faq.* disclaimer.*
rm -f us_stk_c*


rm -f danbikle.jpg*
rm -f dan_ops_mgr.jpg*
rm -f engmgr.jpg*
rm -f fx_sunday.png*
rm -f gdist2.png*
rm -f gdist.png*
rm -f goog_indicators.png*
rm -f kalman_filter_tank.png*
rm -f marketingmgr.jpg*
rm -f masg004.png*
rm -f masg_tkrs.png*
rm -f masr3.png*
rm -f productmgr.jpg*
rm -f qry_spy_clse.png*
rm -f rails.png*
rm -f scatter_plot_demo.jpeg*
rm -f svm3d.png*
rm -f us_stk_sunday.png*

wget http://bot4.herokuapp.com/images/danbikle.jpg
wget http://bot4.herokuapp.com/images/dan_ops_mgr.jpg
wget http://bot4.herokuapp.com/images/engmgr.jpg
wget http://bot4.herokuapp.com/images/fx_sunday.png
wget http://bot4.herokuapp.com/images/gdist2.png
wget http://bot4.herokuapp.com/images/gdist.png
wget http://bot4.herokuapp.com/images/goog_indicators.png
wget http://bot4.herokuapp.com/images/kalman_filter_tank.png
wget http://bot4.herokuapp.com/images/marketingmgr.jpg
wget http://bot4.herokuapp.com/images/masg004.png
wget http://bot4.herokuapp.com/images/masg_tkrs.png
wget http://bot4.herokuapp.com/images/masr3.png
wget http://bot4.herokuapp.com/images/productmgr.jpg
wget http://bot4.herokuapp.com/images/qry_spy_clse.png
wget http://bot4.herokuapp.com/images/rails.png
wget http://bot4.herokuapp.com/images/scatter_plot_demo.jpeg
wget http://bot4.herokuapp.com/images/svm3d.png
wget http://bot4.herokuapp.com/images/us_stk_sunday.png

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
# wget http://bot4.herokuapp.com/a1/blog
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
