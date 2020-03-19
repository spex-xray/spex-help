# Latest update: March 19, 2020 by Junjie Mao
#===========================================================
# Distance
dist 0.07 z
#===========================================================
# Redshift of the source, cidx = 1
com reds
par 1 1 z val 0.07
#===========================================================
# Galactic absorption, cidx = 2
com hot
par 1 2 nh val 2.0e-4
par 1 2 t val 5E-4
par 1 2 t s f
par 1 2 nh s f
#===========================================================
# AGN SED above the Lyman limit along the line-of-sight, cidx = 3 to 5
# COMT, cidx = 3
com comt
par 1 3 norm val 3.E12
par 1 3 norm s t
par 1 3 t0 val 5e-4
par 1 3 t0 s t
par 1 3 t1 val 0.15
par 1 3 t1 s t
par 1 3 tau val 20
par 1 3 tau s t
# Power-law, cidx = 4
com pow
par 1 4 norm val 1.E+09
par 1 4 norm s t
par 1 4 gamm val 1.7
par 1 4 gamm s t
# Reflection, cidx = 5
# High-energy cut-off assumed to be 300 keV
com refl
par 1 5 norm couple 1 4 norm
par 1 5 gamm couple 1 4 gamm
par 1 5 ecut val 300
par 1 5 ecut s f
par 1 5 pow:fgr v 0
par 1 5 scal val 1.
par 1 5 scal s f
#===========================================================
# Low-energy cut-off, cidx = 6
# Assumed to be at 1 Ryd
com etau
par 1 6 a val -1
par 1 6 a s f
par 1 6 tau val 1.3605E-2
par 1 6 tau s f
#===========================================================
# High-energy cut-off, cidx = 7
com etau
par 1 7 a val 1
par 1 7 a s f
par 1 7 tau val 3.3333E-3
par 1 7 tau s f
#===========================================================
# PION absorption components, cidx = 8 o 10
com pion
com pion
com pion
par 1 8:10 nh range 1.E-7:1.E1
par 1 8:10 xil range -5:5
par 1 8:10 omeg range 0:1
par 1 8 nh val 5.E-03
par 1 8 xil val 2.7
par 1 8 zv val -500
par 1 8 zv s t
par 1 8 v val 100
par 1 8 v s t
par 1 8 omeg val 1.E-7
par 1 9 nh val 2.E-03
par 1 9 xil val 1.6
par 1 9 zv val -100
par 1 9 zv s t
par 1 9 v val 50
par 1 9 v s t
par 1 9 omeg val 1.E-7
# inactive PION absorption component
par 1 10 nh val 1.E-7
par 1 10 nh s f
par 1 10 xil val 0
par 1 10 xil s f
par 1 10 zv val 0
par 1 10 zv s f
par 1 10 fcov val 0
par 1 10 fcov s f
############################################################
# Component relation along the line of sight
#-----------------------------------------------------------
# AGN SED above the Lyman limit along the line of sight
com rel 3 8,9,10,1,2
com rel 4 6,7,8,9,10,1,2
com rel 5 1,2
#-----------------------------------------------------------
# PION absorption components:
com rel 8 9,10,1,2
com rel 9 10,1,2
com rel 10 1,2
############################################################
# check models
model show
# check parameters
elim 1.E0:1.E3 ryd
calc
par show free
