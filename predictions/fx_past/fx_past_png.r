# fx_past_png.r

# I use this script to plot some data generated by this sql script:
# fx_past.sql
# Which should be here:
# /tmp/fx_sunday_l.csv
# /tmp/fx_sunday_s.csv
# I intend to run this script on each Sunday.

# Define the .png file which will hold the output:
png("/tmp/fx_sunday.png",width = 900, height = 700)

# Get the bearish data:
fx_sunday_s = read.csv("/tmp/fx_sunday_s.csv")
# Get the bullish data:
fx_sunday_l = read.csv("/tmp/fx_sunday_l.csv")

# Tick labels perp to each axis
ytl_perp = 2
xtl_perp = 2

# Control the margin:
par()$mar
par(mar=c(6.2, 4.1, 4.1, 2.1))

plot(fx_sunday_s$WEEK_OF, fx_sunday_s$CUM_SUM
  ,main = "Weekly Performance of DanBot Forex Predictions (Green = Bullish, Red = Bearish)"
  ,ylab = "Raw Percentage"
  ,ylim = c(-13.0, 12.0)
  ,las = ytl_perp
  ,type = "n"
)

# Connect the dots:
lines(fx_sunday_s$WEEK_OF, fx_sunday_s$CUM_SUM
  ,type = "o"
  ,col="red"
)

# Now overlay another plot:
# http://pj.freefaculty.org/R/Rtips.html#5.11
par(new = TRUE) 

# Now I plot the bullish predictions.

plot(fx_sunday_l$WEEK_OF, fx_sunday_l$CUM_SUM
  ,xaxt = 'n'
  ,yaxt = 'n'
  ,type = "n"
  ,ylab = " "
  ,xlab = " "
  ,ylim = c(-13.0, 12.0)
)

# Connect the dots:
lines(fx_sunday_l$WEEK_OF, fx_sunday_l$CUM_SUM
  ,type = "o"
  ,col="green"
)

grid(nx = 10, col = "blue")

dev.off()
