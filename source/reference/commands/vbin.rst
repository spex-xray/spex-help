.. _sec:vbin:

Vbin: variable rebinning of the data
====================================

Overview
~~~~~~~~

This command rebins (a part of) the data (thus both the spectrum and the
response) such that the signal to noise ratio in that part of the
spectrum is at least a given constant. Thus instead of taking a fixed
number of data channels for binning, the number of data channels binned
is here variable as is the bin width. On top of specifying the S/N
ratio, you also specify the minimal bin width. This is useful for
rebinning low count data, which have no strong or sharp features or
lines in it.

**Warning:** *For high resolution spectra with sharp and strong lines,
this binning can lead to very wrong results. In this case either the
emission lines or the continuum (in case of absorption lines) have a
much higher signal to noise ratio than the other component. As a result
this function will try to bin the line and continuum together, resulting
in a smoothing out of the lines.*

**Warning:** *It is not always guaranteed that the minimum
signal-to-noise ratio is obtained in all channels. This is an effect of
the applied algorithm. Channels with the highest S/N ratio and
neighboring bins are merged until sufficient S/N ratio is obtained. This
process is continued for the remaining number of bins. At the end of the
process a few bins with a low S/N ratio will remain. These are merged
with their neighbors, resulting in a possibly lower S/N ratio for that
bin.*

Syntax
~~~~~~

The following syntax rules apply:

| ``vbin #i1: #i2 #r`` : Simplest command allowed. #i1: is the range in
  data channels over which the binning needs to take place. #i2 in the
  minimum amount of data channels that need to be binned, and #r is the
  minimal S/N ratio one wants the complete data set to have.
| ``vbin #r1: #i #r2 unit #a`` : The same command as above, except that
  now the ranges over which the data is to be binned (#r1:) are
  specified in units (#a) different from data channels. These units can
  be eV, keV, Å, as well as in units of Rydberg (ryd), Joules (j), Hertz
  (hz) and nanometers (nm).
| ``vbin [instrument #i1:] [region #i2:] #i3: #i4 #r`` : Here #i3: and
  #i4 are the same as #i1: and #i2 in the first command, also #r is the
  minimal S/N ratio required. However, here one can specify the
  instrument range #i1: and the region range #i2: as well, so that the
  binning only is performed for a certain data set.
| ``vbin [instrument #i1:] [region #i2:] #r1: #i2 #r2 [unit #a]`` : This
  command is the same as the above, except that here one can specify the
  range over which the binning should occur in the units specified by
  #a. These units can be eV, Å, keV, as well as in units of Rydberg
  (ryd), Joules (j), Hertz (hz) and nanometers (nm).

Examples
~~~~~~~~

| ``vbin 1:10000 3 10`` : Bins the data channels 1:10000 with a minimal
  bin width of 3 data channels, and a minimum S/N ratio of 10.
| ``vbin 1:4000 3 10 unit ev`` : Does the same as the above, but now the
  data range to be binned is given in eV, from 1\ :math:`-`\ 4000 eV,
  instead of in data channels.
| ``vbin instrument 1 region 1 1:19 3 10 unit a`` : Bins the data from
  instrument 1 and region 1 between 1 and 19 Å with the same minimum bin
  width and S/N as above.
