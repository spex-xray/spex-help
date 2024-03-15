.. _sec:rbin:

Rbin: optimal rebinning of the data and response, including saving
==================================================================

Overview
~~~~~~~~

This command rebins (a part of) the data (thus both the spectrum and the
response) to the optimal bin size given the statistics of the source as
well as the instrumental resolution. This is recommended to do in
**all** cases, in order to avoid oversampling of the data. The theory
and algorithms used for this rebinning are described in detail in
:ref:`sect:matrices`.

It does essentially the same as the obin command as far as binning of the
data channels is concerned, but in addition it also optimally bins the
model energy grid. All prescriptions for this are given in the paper of
Kaastra and Bleeker (2016). In addition, it stores the newly binned
spectrum and response, with a different name, in the same directory where
the original data are. If the original data rea named data.spo and data.res,
the new names will be databin0.spo and databin0.res.

It is highly recommended to apply the binning to the full data set, and to do 
one instrument at a time, to reduce the use of memory, especially in cases with
very large matrices. In those cases, the compression may take several minutes.

Further, it is best practice to quit spex after the creation of the reduced
dataset, and to load the reduced data in a new session. If you want to see the difference,
you can load the original and the binned data as two separate instruments in spex,
apply a simple model and see the differences in a plot.

Syntax
~~~~~~

The following syntax rules apply:

| ``rbin #i1:`` : Simplest command allowed. #i1: is the range in data
  channels over which the binning needs to take place.
| ``rbin #r1: #i: unit #a`` : The same command as above, except that now
  the ranges over which the data is to be binned (#r1:) are specified in
  units (#a) different from data channels. These units can be eV, keV,
  Å, as well as in units of Rydberg (ryd), Joules (j), Hertz (hz) and
  nanometers (nm).
| ``rbin [instrument #i1:] [region #i2:] #i3:`` : Here #i3: is the same
  as #i1: in the first command. However, here one can specify the
  instrument range #i1: and the region range #i2: as well, so that the
  binning is done only for one given data set.
| ``rbin [instrument #i1:] [region #i2:] #r1: [unit #a]`` : This command
  is the same as the above, except that here one can specify the range
  over which the binning should occur in the units specified by #a.
  These units can be eV, Å, keV, as well as in units of Rydberg (ryd),
  Joules (j), Hertz (hz) and nanometers (nm).

Examples
~~~~~~~~

| ``rbin 1:10000`` : Optimally bins the data channels 1:10000.
