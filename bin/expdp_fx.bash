#!/bin/bash

# expdp_fx.bash

# I use this script to expdp a table full of fx data.

. /pt/w/b4/cj4b4/.cj

mv ~/dpdump/fx.dpdmp /tmp/
expdp trade/t dumpfile=fx.dpdmp tables=di5min,svm62scores
