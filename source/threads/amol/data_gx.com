# Simulated data
#---------------
# HETG DATA
data data_sim data_sim
bin inst 1 reg 1:2 0:10000 2 unit ang
ignore inst 1 reg 1:2 0:3 unit ang
ignore inst 1 reg 1:2 11:1000 unit ang