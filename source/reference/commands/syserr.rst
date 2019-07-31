.. _sec:syserr:

Syserr: systematic errors
=========================

Overview
~~~~~~~~

This command calculates a new error, adding the systematic error of the
source and the background to the Poissonian error in quadrature. One
must specify both the systematic error as a fraction of the source
spectrum as well as of the subtracted background spectrum. The total of
these fractions can either be less or greater than 1.

| **Warning:** *This command mixes two fundamentally different types of
  errors: statistical (random fluctuations) and systematic (offset). The
  resulting uncertainties are unjustly treated as being statistical,
  which can lead to wrong results when the systematic offsets are
  substantial. Syserr should therefore be used with extreme caution.*
| **Warning:** *One should first rebin the data, before running syserr.
  Run syserr however before fitting the data or finding errors on the
  fit.*
| **Warning:** *Running syserr multiple times will increase the error
  every time. If the input to syserr is wrong one should restart
  SPEX and rerun syserr with the correct values to calculate the total
  error correctly.*

Syntax
~~~~~~

The following syntax rules apply:

| ``syserr #i: #r1 #r2`` : The shortest version of this command. #i: is
  the range in data channels for which the systematic error is to be
  calculated and added (in quadrature) to the Poissonian error. #r1 is
  then the the relative systematic error due to the source and #r2 the
  relative systematic error due to the background.
| ``syserr [instrument #i1:] [region #i2:] #i3: #r1 #r2`` : In this
  syntax one can also specify the instrument and the region one wants to
  calculate the combined error for. Both can be ranges as well. #i3: has
  the same role as #i: in the above command, and #r1 and #r2 are the
  same as above.
| ``syserr [instrument #i1:] [region #i2:] #i3: #r1 #r2 [unit #a]`` :
  Exact same command as above, except that now the data range (#i3:) for
  which the errors are to be calculated are given in units different
  than data channels. These units can be Å (ang), eV (ev), keV (kev),
  Rydbergs (ryd), Joules (j), Hertz (hz) and nanometers (nm). This is
  the most general command.

Examples
~~~~~~~~

| ``syserr 1:100000 0.3 0.5`` : Calculates the combined Poissonian and
  systematic error for data channels 1:100000, where the fraction of the
  systematic error of the source is 0.3 and the background is 0.5.
| ``syserr 0:2000 0.3 0.5 unit ev`` : The same as the above command,
  expect that now the error calculation is performed between 0 and 2000
  eV instead of data channels.
| ``syserr instrument 2 region 1 0:2000 0.3 0.5 unit ev`` : The same as
  the above command, but now the error calculation is only performed for
  the data set from the second instrument and the first region thereof.
