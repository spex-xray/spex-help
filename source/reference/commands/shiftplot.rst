.. _sec:shiftplot:

Shiftplot: shift the plotted spectrum for display purposes
==========================================================

Overview
~~~~~~~~

This command shifts the observed spectrum as well as the model spectrum
by adding a constant or by multiplying a constant, as far as plots are
concerned. The true data files do not change, so the shift is only for
representational purposes.

There are basically two options, indicated by the mode variable
*plotshift*: For *plotshift*\ =1, a constant *shift* is added to the
plotted spectrum of a given part of the data, for *plotshift*\ =2 the
plotted spectrum is multiplied by the constant *shift*.

The multiplicative constant shift (*plotshift*\ =2) is generally
preferred for log-log plots, while for linear plots a constant additive
shift (*plotshift*\ =1) is preferred.

**Warning:** *In the case of addition (*plotshift*\ =1), the addition
constant is given in counts/s. This thus leads to a different
(energy-dependent) constant being added to the plotted spectrum if the
units are not in counts/s. For the multiplicative case this is of course
not the case.*

Syntax
~~~~~~

The following syntax rules apply:

| ``shiftplot #i #r`` : #i indicates whether a constant should be added
  (#i=1) or multiplied (#i=2) to the spectrum and model. #r is then the
  constant to be added or multiplied by.
| ``shiftplot [instrument #i1:]  [region #i2:]  #i3 #r`` : Shift the
  plot using a factor #r. Here #i3 (*= plotshift*) determines whether
  the constant is added (*plotshift=1*) or multiplied (*plotshift=2*).
  The optional instrument range #i1: can be used to select a single
  instrument or range of instruments for which the shift needs to be
  applied, and the optional region range #i2: the region for these
  instruments.

Examples
~~~~~~~~

| ``shiftplot 1 2.0`` : Adds 2 counts/s to the plotted spectrum. Since
  no instrument or region is specified, this applies for all spectra.
| ``shiftplot 2 10.0`` : Multiplies the plotted spectrum by a factor of
  10.0
| ``shiftplot instrument 1 region 2 1 2`` : Adds 2 counts/s to the
  plotted spectrum for the data from instrument 1 and region 2.
| ``shiftplot region 2:3 1 2`` : Adds 2 counts/s to the plotted spectrum
  for the data for all instruments and regions 2\ :math:`-`\ 3.
