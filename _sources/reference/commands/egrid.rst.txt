.. _sec:egrid:

Egrid: define model energy grids
================================

Overview
~~~~~~~~

SPEX operates essentially in two modes: with an observational data set
(read using the data commands), or without data, i.e. theoretical model
spectra. In the first case, the energy grid neede to evaluate the
spectra is taken directly from the data set. In the second case, the
user can choose his own energy grid.

The energy grid can be a linear grid, a logarithmic grid or an arbitrary
grid read from an ascii-file. It is also possible to save the current
energy grid, whatever that may be. In case of a linear or logarithmic
grid, the lower and upper limit, as well as the number of bins or the
step size must be given.

The following units can be used for the energy or wavelength: keV (the
default), eV, Ryd, J, Hz, Å, nm.

When the energy grid is read or written from an ascii-file, the file
must have the extension ".egr", and contains the bin boundaries in keV,
starting from the lower limit of the first bin and ending with the upper
limit for the last bin. Thus, the file has 1 entry more than the number
of bins! In general, the energy grid must be increasing in energy and it
is not allowed that two neighbouring boundaries have the same value.

Finally, the default energy grid at startup of SPEX is a logarithmic
grid between 0.001 and 100 keV, with 8192 energy bins.

Syntax
~~~~~~

The following syntax rules apply:

| ``egrid lin #r1:#r2 #i [#a]`` : Create a linear energy grid between
  #r1 and #r2, in units given by #a (as listed above). If no unit is
  given, it is assumed that the limits are in keV. The number of energy
  bins is given by #i
| ``egrid lin #r1:#r2 step #r3 [#a]`` : as above, but do not prescribe
  the number of bins, but the bin width #r3. In case the difference
  between upper and lower energy is not a multiple of the bin width, the
  upper boundary of the last bin will be taken as close as possible to
  the upper boundary (but cannot be equal to it).
| ``egrid log #r1:#r2 #i [#a]`` : Create a logarithmic energy grid
  between #r1 and #r2, in units given by #a (as listed above). If no
  unit is given, it is assumed that the limits are in keV. The number of
  energy bins is given by #i
| ``egrid log #r1:#r2 step #r3 [#a]`` : as above, but do not prescribe
  the number of bins, but the bin width (in log :math:`E`) #r3.
| ``egrid read #a`` : Read the energy grid from file #a.egr
| ``egrid save #a`` : Save the current energy grid to file #a.egr

.. warning:: The lower limit of the energy grid must be positive, and
             the upper limit must always be larger than the lower limit.

Examples
~~~~~~~~

| ``egrid lin 5:38 step 0.02 a`` : create a linear energy grid between
  :math:`5 -
  38` Å, with a step size of 0.02 Å.
| ``egrid log 2:10 1000`` : create a logarithmic energy grid with 1000
  bins between :math:`2-10` keV.
| ``egrid log 2:10 1000 ev`` : create a logarithmic energy grid with
  1000 bins between :math:`0.002-0.010` keV.
| ``egrid read mygrid`` : read the energy grid from the file mygrid.egr.
| ``egrid save mygrid`` : save the current energy grid to file
  mygrid.egr.
