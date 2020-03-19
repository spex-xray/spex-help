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
# AGN SED above the Lyman limit along line-of-sight #1, cidx = 3 to 5
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
# PION obscuring wind components, cidx = 8 to 9
com pion
com pion
par 1 8:9 nh range 1.E-7:1.E1
par 1 8:9 xil range -5:5
par 1 8 nh val 5.E-02
par 1 8 xil val 0.0
par 1 8 zv val -3000
par 1 8 zv s t
par 1 8 v val 1100
par 1 8 v s t
par 1 9 nh val 1.E-7
par 1 9 nh s f
par 1 9 xil val 0
par 1 9 xil s f
par 1 9 fcov val 0
par 1 9 omeg val 0
#===========================================================
# PION warm absorber components, cidx = 10 to 12
com pion
com pion
com pion
par 1 10:12 nh range 1.E-7:1.E1
par 1 10:12 xil range -5:5
par 1 10:12 omeg range 0:1
par 1 10 nh val 5.E-03
par 1 10 xil val 2.7
par 1 10 zv val -500
par 1 10 zv s t
par 1 10 v val 100
par 1 10 v s t
par 1 10 omeg val 1.E-7
par 1 11 nh val 2.E-03
par 1 11 xil val 1.6
par 1 11 zv val -100
par 1 11 zv s t
par 1 11 v val 50
par 1 11 v s t
par 1 11 omeg val 1.E-7
# inactive PION absorption component(s)
par 1 12 nh val 1.E-7
par 1 12 nh s f
par 1 12 xil val 0
par 1 12 xil s f
par 1 12 fcov val 0
############################################################
# AGN SED above the Lyman limit along line-of-sights #2a and #2b, cidx = 13 to 16
com comt
par 1 13 norm:type couple 1 3 norm:type
com pow
par 1 14 norm:lum couple 1 4 norm:lum
com comt
par 1 15 norm val 1.E12
par 1 15 norm s f
par 1 15 t0 val 3.E-4
par 1 15 t0 s f
par 1 15 t1 val 0.125
par 1 15 t1 s f
par 1 15 tau val 20
par 1 15 tau s f
com pow
par 1 16 norm val 6.E9
par 1 16 norm s f
par 1 16 gamm val 1.6
par 1 16 gamm s f
############################################################
# all-energy cut off, cidx = 17
com etau
par 1 17 tau val 1.E3
par 1 17 tau s f
par 1 17 a val 0
par 1 17 a s f
#===========================================================
# PION emission components, cidx = 18 to 20
com pion
com pion
com pion
par 1 18:20 nh range 1.E-7:1.E1
par 1 18:20 xil range -5:5
par 1 18:20 omeg range 0:1
par 1 18 nh val 8.E-02
par 1 18 xil val 0.8
par 1 18 zv val 0
par 1 18 zv s f
par 1 18 v val 100
par 1 18 v s f
par 1 18 fcov val 0
par 1 18 fcov s f
par 1 18 omeg val 3.E-2
par 1 18 omeg s t
par 1 19 nh val 5.E-2
par 1 19 xil val 2.3
par 1 19 zv val 0
par 1 19 zv s f
par 1 19 v val 240
par 1 19 v s t
par 1 19 fcov val 0
par 1 19 fcov s f
par 1 19 omeg val 1.E-2
par 1 19 omeg s t
# inactive PION emission component
par 1 20 nh val 1.E-7
par 1 20 nh s f
par 1 20 xil val 0
par 1 20 xil s f
par 1 20 fcov val 0
par 1 20 omeg val 0
# Broadening due to macroscopic motion for the PION emission components, cidx = 21 to 23
com vgau
par 1 21 sig val 7.E3
par 1 21 sig s t
com vgau
com vgau
#===========================================================
# AGN SED below the Lyman limit along line-of-sights #1, cidx = 24 to 25
com comt
par 1 24 norm:type couple 1 3 norm:type
com pow
par 1 25 norm:lum couple 1 4 norm:lum
#===========================================================
# Prevent the X-ray absorption models to apply the optical/UV data, cidx = 26 to 27
com etau
par 1 26 tau0 val 1.E3
par 1 26 tau0 s f
par 1 26 a val 0
par 1 26 a s f
par 1 26 e2 val 1.3605700E-02
par 1 26 e2 s f
com etau
par 1 27 tau0 val 1.E3
par 1 27 tau0 s f
par 1 27 a val 0
par 1 27 a s f
par 1 27 e1 val 1.3605700E-02
par 1 27 e1 s f
#===========================================================
# Host galaxy emission model, cidx = 28
com file
par 1 28 norm val 0.3
par 1 28 file aval bulge_host_galaxy.dat
#===========================================================
# BLR/NLR emission lines in optical, cidx = 29
com file
par 1 29 norm val 0.4
par 1 29 file aval BLR_NLR_BalmerC_FeII.dat
#===========================================================
# De-reddening model for the host galaxy, cidx = 30
com ebv
par 1 30 ebv val 0.10
#===========================================================
# De-reddening model for Milky Way, cidx = 31
com ebv
par 1 31 ebv val 0.12
############################################################
# Component relation for line-of-sight #1
#-----------------------------------------------------------
# AGN SED above the Lyman limit along line-of-sight #1
com rel 3 8,9,10,11,12,1,2,26
com rel 4 6,7,8,9,10,11,12,1,2,26
com rel 5 1,2,26
#-----------------------------------------------------------
# PION absorption components:
com rel 8 9,10,11,12,1,2,26
com rel 9 10,11,12,1,2,26
com rel 10 11,12,1,2,26
com rel 11 12,1,2,26
com rel 12 1,2,26
############################################################
# Component relation for line-of-sight #2
#-----------------------------------------------------------
# AGN SED above the Lyman limit along line-of-sight #2a
com rel 13 18,1,17
com rel 14 6,7,18,1,17
#-----------------------------------------------------------
# AGN SED above the Lyman limit along line-of-sight #3a
com rel 15 19,20,1,17
com rel 16 6,7,19,20,1,17
#-----------------------------------------------------------
# PION emission component along line-of-sight #2b:
com rel 18 21,8,9,1,2,26
#-----------------------------------------------------------
# PION emission components along line-of-sight #3b:
com rel 19 22,1,2,26
com rel 20 23,1,2,26
############################################################
# AGN SED below the Lyman limit (optical/UV) along line-of-sight #1
com rel 24 30,1,31,27
com rel 25 6,7,30,1,31,27
# host galaxy
com rel 28 1
# BEL/NEL in optical
com rel 29 1
############################################################
# check models
model show
# check parameters
#elim 1.E0:1.E3 ryd
#calc
#par show free
