.. _sec:use:

Use: reuse part of the spectrum
===============================

Overview
~~~~~~~~

This command can only be used after the ignore command was used to block
out part of the data set in the fitting. The command re-includes thus
(part of) the data set for fitting. As it undoes what the ignore command
did (see :ref:`sec:ignore`) the syntax and use of
both are very similar. Again one can/must specify the instrument and
region for one wants the data to be re-included. Further can one specify
the units chosen to give the range of data points to be included. The
standard unit is that of data channels and does not need to be
specified. The data points re-included with use will automatically also
be plotted again.

The range to be reused can be specified either as a channel range (no
units required) or in eiter any of the following units: keV, eV,
Rydberg, Joule, Hertz, Å, nanometer, with the following abbrevations:
kev, ev, ryd, j, hz, ang, nm. Note that spectra that were binned before
using the bin command are not binned anymore after the spectrum is
ignored and reused again. In this case, the bin command should be
applied again to restore the desired spectral binning.

Syntax
~~~~~~

The following syntax rules apply:

| ``use [instrument #i1] [region #i2] #r`` : Use the range #r in fitting
  the data. The instrument #i1 and the region #i2 must be specified if
  either there are more than 1 instrument or more than 1 region used in
  the data sets.
| ``use [instrument #i1] [region #i2] #r unit #a`` : Same as the above,
  but now the units #a in which the range #r of data points to be used
  is specified in any of the units mentioned above.

Examples
~~~~~~~~

| ``use 1000:1500`` : Re-include the data channels 1000:1500 for fitting
  the data.
| ``use instrument 1 region 1 1000:1500`` : Re-include the data channels
  1000:1500 of the first instrument and the first region in the data set
  for fitting the data and plotting.
| ``use instrument 1 region 1 1:1.5 unit kev`` : Same as the above, but
  now the unites are specified as keV instead of in data channels.
| ``use 1000:1500 unit ev`` : Re-include the data points between 1000 and
  1500 eV for fitting and plotting. Note that in this case the input
  data should come from only one instrument and should contain no
  regions.
