.. _sect:hydrodriver:

Hydro driver
============

Some users run complex and computationally expensive hydrodynamical
simulations, and want to be able to calculate the corresponding X-ray
spectrum. Without having to implement these hydro-codes into it is now
possible to do this.

For that purpose we offer the fortran90 subroutine *hydro_driver*. The
source code of that routine is available in the SPEX distribution.
Basically, it does the following:

#. It reads the needed parameters as subroutine arguments.

#. It does a few sanity checks (ion concentrations should be
   non-negative, and the total H+H column density must be 1.

#. It then creates a file called “spexicon.dat” containing the ion
   concentrations.

#. It also creates a file called “spexgrid.egr” containing the energy
   grid.

#. It then creates a file called “spexdriver.com” that contains the
   commands to run in batch mode.

#. This file is executed, and creates a file “spexoutput.asc”
   containing the emitted spectrum.

#. SPEX terminates.

#. The subroutine reads the file “spexoutput.asc” and puts the spectrum
   in the appropriate output array of the subroutine.

The input arguments of the subroutine are as follows:

| ``hden`` : The Hydrogen density in units of :math:`10^{20}` :math:`\mathrm{m}^{-3}`. Real number.
| ``t`` : The electron temperature in keV. Real number.
| ``it`` : The ion temperature in keV, used for line broadening. Real number.
| ``vmic`` : The microturbulence velocity, in :math:`\mathrm{km}\  \mathrm{s}^{-1}`, used for line broadening. Real number.
| ``volume`` : The emitting volume, in units of :math:`10^{24}` :math:`\mathrm{m}^3`. Real number.
| ``con(31,30)`` : Array with ion concentrations relative to hydrogen (number densities).
  The abundances of the metals should be taken into
  account in this; thus, for example, for cosmic abundances, oxygen has a
  number density of about 0.001 per hydrogen atom, hence the sum of all
  oxygen ion concentrations should then be 0.001. The array con(jz,iz)
  contains for each element (labeled with atomic number :math:`iz`, H=1,
  He=2 etc.) the concentration; :math:`jz` indicates the ionisation stage
  (1=I=neutral, 2=II=singly ionized, etc.; do not forget to include the
  bare nucleus as the last one. Array elements with :math:`jz>iz+1` will
  be ignored. Note that as things are normalised to hydrogen,
  :math:`con(1,1) + con(2,1) = 1` is obligatory! Real array.

| ``neg`` : Number of energy bins. Integer number.
| ``eg(0:neg)`` : Energy bin boundaries in keV; the boundaries of the
  first bin are stored in eg(0) and eg(1); the second bin in eg(1) and
  eg(2); etc. Real array.

The output arguments of the subroutine are as follows:

| ``spec(neg)`` : The emitted spectrum in units of :math:`10^{44}`
  photons/s/keV. Divide this number by :math:`4\pi d^2` with :math:`d` the
  source distance to get the flux at Earth. Real array.
