# Simulated data
#---------------
# HRC/LETGS DATA
data ./data_simu/chl ./data_simu/chl
bin inst 1 reg 1 0:10000 2 unit ang
ignore inst 1 reg 1 0:1.5 unit ang
ignore inst 1 reg 1 60:1000 unit ang
