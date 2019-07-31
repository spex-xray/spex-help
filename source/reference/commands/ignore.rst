.. _sec:ignore:

Ignore: ignoring part of the spectrum
=====================================

Overview
~~~~~~~~

If one wants to ignore part of a data set in fitting the input model, as
well as in plotting this command should be used. The spectral range one
wants to ignore can be specified as a range in data channels or a range
in wavelength or energy. Note that the first number in the range must
always be smaller or equal to the second number given. If multiple
instruments are used, one must specify the instrument as well. If the
data set contains multiple regions, one must specify the region as well.
So per instrument/region one needs to specify which range to ignore. The
standard unit chosen for the range of data to ignore is data channels.
To undo ignore, see the use command (see
section \ `[sec:use] <#sec:use>`__).

The range to be ignored can be specified either as a channel range (no
units required) or in either any of the following units: keV, eV,
Rydberg, Joule, Hertz, Å, nanometer, with the following abbrevations:
kev, ev, ryd, j, hz, ang, nm.

Syntax
~~~~~~

The following syntax rules apply:

| ``ignore [instrument #i1] [region #i2] #r`` : Ignore a certain range
  #r given in data channels of instrument #i1 and region #i2. The
  instrument and region need to be specified if there are more than 1
  data sets in one instrument data set or if there are more than 1 data
  set from different instruments.
| ``ignore [instrument #i1] [region #i2] #r unit #a`` : Same as the
  above, but now one also specifies the unites #a in which the range #r
  of data points to be ignored are given. The units can be either Å(ang)
  or (k)eV.

Examples
~~~~~~~~

| ``ignore 1000:1500`` : Ignores data channels 1000 till 1500.
| ``ignore region 1 1000:1500`` : Ignore data channels 1000 till 1500
  for region 1.
| ``ignore instrument 1 region 1 1000:1500`` : Ignores the data channels
  1000 till 1500 of region 1 from the first instrument.
| ``ignore instrument 1 region 1 1:8 unit ang`` : Same as the above
  example, but now the range is specified in units of Å instead of in
  data channels.
| ``ignore 1:8 unit ang`` : Ignores the data from 1 to 8 Å, only works
  if there is only one instrument and one region included in the data
  sets.
