.. _chap:specmod:

Overview of spectral components
===============================

For more information on the definition of spectral components and the
different types, see Section `Model types <#sec:modeltypes>`__.
Currently the following models are implemented in SPEX, see
`Table <#tab:specmodels>`__.

.. table:: Available spectral components

   ======= ===================================================================
   acronym description
   ======= ===================================================================
   pow     Power law
   delt    Delta line
   gaus    Gaussian line
   bb      Blackbody
   mbb     Modified blackbody
   dbb     Accretion disk blackbody
   cie     Collisional ionisation equilibrium spectrum
   comt    Comptonisation model Titarchuk
   cx      Charge exchange model
   neij    Non-equilibrium ionisation spectrum
   sed     Sedov adiabatic SNR model
   chev    Chevalier adiabatic SNR model with reverse shock
   soli    Solinger isothermal SNR model
   band    Band isothermal SNR model with reverse shock
   pdem    Differential emission measure model, polynomials
   cf      Isobaric cooling flow model
   wdem    Power law differential emission measure with high :math:`T` cut-off
   dem     Differential emission measure model, for DEM analysis
   refl    Reflection model of Zycki
   file    Table model from file
   \      
   reds    Redshift model
   \      
   vgau    Gaussian velocity profile
   vblo    Square velocity profile
   vpro    Arbitrary velocity profile (needs input file)
   lpro    Spatial profile modeling for RGS (needs input file)
   laor    Laor relativistic line profile
   \      
   absm    Morrison & McCammon ISM absorption
   euve    EUVE absorption model (Rumph et al. 1994) (H+He)
   ebv     Galactic interstellar extinction model
   hot     SPEX absorption by plasma in CIE
   slab    Absorption by a slab with adjustable ionic columns
   xabs    Absorption by a slab in photoionization equilibrium
   pion    Photoionised absorption model
   warm    Absorption by a slab with continuous distribution in ionization
   knak    Transmission piecewise power law
   etau    Transmission for optical depth :math:`\tau(E)` a power law
   dust    Dust scattering model
   amol    Absorption by molecular oxygen
   ======= ===================================================================
