#!/bin/bash

# png.bash

cd /pt/w/b4/cj/predictions/fx_past/
./fx_past_png.bash

cd /pt/w/b4/cj/predictions/us_stk_past/
./us_stk_past_png.bash

# Now copy the new data to the Rails site:

cd /pt/w/b4/b4/
git add .
git commit -a -v -m png.bash-commit
git push heroku master
git push origin master &




