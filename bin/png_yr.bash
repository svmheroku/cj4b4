#!/bin/bash

# png_yr.bash

echo cd /pt/w/b4/cj/predictions/fx_past/
cd /pt/w/b4/cj/predictions/fx_past/
echo ./fx_past_png_yr.bash $1
./fx_past_png_yr.bash $1

exit

cd /pt/w/b4/cj/predictions/us_stk_past/
./us_stk_past_png_yr.bash $1

# Now copy the new data to the Rails site:

cd /pt/w/b4/b4/
git add .
git commit -a -v -m png.bash-commit
git push heroku master
git push origin master &




