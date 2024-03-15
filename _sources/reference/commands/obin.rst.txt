.. _sec:obin:

Obin: optimal rebinning of the data
===================================

Overview
~~~~~~~~

This command rebins (a part of) the data (thus both the spectrum and the
response) to the optimal bin size given the statistics of the source as
well as the instrumental resolution. This is recommended to do in
**all** cases, in order to avoid oversampling of the data. The theory
and algorithms used for this rebinning are described in detail in
:ref:`sect:matrices`. A simple cartoon of this is:
binning to 1/3 of the FWHM, but the factor of 1/3 depends weakly upon
the local count rate at the given energy and the number of resolution
elements. The better the statistics, the smaller the bin size.

.. Note:: Usually, the ignore command and the obin command are used around
   the same time. The safest order is to ignore parts of the spectrum first
   and then re-bin it. If the bin command is done first and then parts of
   the spectrum are ignored using a different energy range, then bins at the
   edges of the energy range could end up being reduced in width.

Syntax
~~~~~~

The following syntax rules apply:

| ``obin #i1:`` : Simplest command allowed. #i1: is the range in data
  channels over which the binning needs to take place.
| ``obin #r1: #i: unit #a`` : The same command as above, except that now
  the ranges over which the data is to be binned (#r1:) are specified in
  units (#a) different from data channels. These units can be eV, keV,
  Å, as well as in units of Rydberg (ryd), Joules (j), Hertz (hz) and
  nanometers (nm).
| ``obin [instrument #i1:] [region #i2:] #i3:`` : Here #i3: is the same
  as #i1: in the first command. However, here one can specify the
  instrument range #i1: and the region range #i2: as well, so that the
  binning is done only for one given data set.
| ``obin [instrument #i1:] [region #i2:] #r1: [unit #a]`` : This command
  is the same as the above, except that here one can specify the range
  over which the binning should occur in the units specified by #a.
  These units can be eV, Å, keV, as well as in units of Rydberg (ryd),
  Joules (j), Hertz (hz) and nanometers (nm).

Examples
~~~~~~~~

| ``obin 1:10000`` : Optimally bins the data channels 1:10000.
| ``obin 1:4000 unit ev`` : Does the same as the above, but now the data
  range to be binned is given in eV, from 1\ :math:`-`\ 4000 eV, instead
  of in data channels.
| ``obin instrument 1 region 1 1:19 unit a`` : Bins the data from
  instrument 1 and region 1 between 1 and 19 Å.
