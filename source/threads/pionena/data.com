# Simulated data
#---------------
# RGS (inst 1)
data rgs rgs
# EPIC-pn (inst 2)
data pn pn
# OM (inst 3:8)
data om_UVW2 om_UVW2
data om_UVM2 om_UVM2
data om_UVW1 om_UVW1
data om_U om_U
data om_B om_B
data om_V om_V
# ign/use, binning
# RGS (inst 1)
bin inst 2 reg 1 0:1000 2 unit ang
ign inst 1 reg 1 0:7 unit ang
ign inst 1 reg 1 37:1000 unit ang
# EPIC-pn (inst 2)
obin inst 2 reg 1 1:100000
ign inst 2 reg 1 0:0.3 unit kev
ign inst 2 reg 1 8:1000 unit ang
ign inst 2 reg 1 10:1000 unit kev
