.. _sec:bin:

Bin: rebin the spectrum
=======================

Overview
~~~~~~~~

This command rebins the data (thus both the spectrum file and the
response file) in a manner as described in
Section `Data <#sec:data>`__. The range to be rebinned can be
specified either as a channel range (no units required) or in eiter any
of the following units: keV, eV, Rydberg, Joule, Hertz, Å, nanometer,
with the following abbrevations: kev, ev, ryd, j, hz, ang, nm.

Syntax
~~~~~~

The following syntax rules apply:

| ``bin #r #i`` : This is the simplest syntax allowed. One needs to give
  the range, #r, over at least the input data channels one wants to
  rebin. If one wants to rebin the whole input file the range must be at
  least the whole range over data channels (but a greater number is also
  allowed). #i is then the factor by which the data will be rebinned.
| ``bin [instrument #i1] [region #i2] #r #i`` : Here one can also
  specify the instrument and region to be used in the binning. This
  syntax is necessary if multiple instruments or regions are used in the
  data input.
| ``bin [instrument #i1] [region #i2] #r #i [unit #a]`` : In addition to
  the above here one can also specify the units in which the binning
  range is given. The units can be eV, Å, or any of the other units
  specified above.

Examples
~~~~~~~~

| ``bin 1:10000 10`` : Rebins the input data channel 1:10000 by a factor
  of 10.
| ``bin instrument 1 1:10000 10`` : Rebins the data from the first
  instrument as above.
| ``bin 1:40 10 unit a`` : Rebins the input data between 1 and 40 Å by a
  factor of 10.
