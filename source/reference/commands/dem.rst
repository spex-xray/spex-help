DEM: differential emission measure analysis
===========================================

Overview
~~~~~~~~

SPEX offers the opportunity to do a differential emission measure
analysis. This is an effective way to model multi-temperature plasmas in
the case of continuous temperature distributions or a large number of
discrete temperature components.

The spectral model can only have one additive component: the DEM
component that corresponds to a multi-temperature structure. There are
no restrictions to the number of multiplicative components. For a
description of the DEM analysis method see document SRON/SPEX/TRPB05 (in
the documentation for version 1.0 of SPEX),
`Mewe et al. (1994) <https://ui.adsabs.harvard.edu/abs/1994ASPC...64...41M/abstract>`_,
`Mewe et al. (1995) <https://ui.adsabs.harvard.edu/abs/1995A&A...296..477M/abstract>`_
and `Kaastra et al. (1996) <https://ui.adsabs.harvard.edu/abs/1996A&A...314..547K/abstract>`_.

SPEX has 5 different dem analysis methods implemented, as listed shortly
below. We refer to the above papers for more details.

#. reg – Regularization method (minimizes second order derivative of the
   DEM; advantage: produces error bars; disadvantage: needs fine-tuning
   with a regularization parameter and can produce negative emission
   measures.

#. clean – Clean method: uses the clean method that is widely used in
   radio astronomy. Useful for "spiky emission measure distributions.

#. poly – Polynomial method: approximates the DEM by a polynomial in the
   :math:`\log T -- \log Y` plane, where :math:`Y` is the emission
   measure. Works well if the DEM is smooth.

#. mult – Multi-temperature method: tries to fit the DEM to the sum of
   Gaussian components as a function of :math:`\log T`. Good for
   discrete and slightly broadened components, but may not always
   converge.

#. gene – Genetic algorithm: using a genetic algorithm try to find the
   best solution. Advantage: rather robust for avoiding local
   subminima.Disadvantage: may require a lot of cpu time, and each run
   produces slightly different results (due to randomization).

In practice to use the DEM methods the user should do the following
steps:

#. Read and prepare the spectral data that should be analysed

#. Define the dem model with the "comp dem" command

#. Define any multiplicative models (absorption, redshifts, etc.) that
   should be applied to the additive model

#. Define the parameters of the dem model: number of temperature bins,
   temperature range, abundances etc.

#. give the "dem lib" command to create a library of isothermal spectra.

#. do the dem method of choice (each one of the five methods outlined
   above)

#. For different abundances or parameters of any of the spectral
   components, first the "dem lib" command must be re-issued!

Syntax
~~~~~~

The following syntax rules apply:

| ``dem lib`` : Create the basic DEM library of isothermal spectra
| ``dem reg auto`` : Do DEM analysis using the regularization method,
  using an automatic search of the optimum regularization parameter. It
  determines the regularisation parameter :math:`R` in such a way that
  :math:`\chi^2(R) =
   \chi^2(0) [1 + s \sqrt{2/(n-n_{\mathrm T}}]` where the scaling factor
  :math:`s=1`, :math:`n` is the number of spectral bins in the data set
  and :math:`n_{\mathrm T}` is the number of temperature components in
  the DEM library.
| ``dem reg auto #r`` : As above, but for the scaling factor :math:`s`
  set to #r.
| ``dem reg #r`` : Do DEM analysis using the regularization method,
  using a fixed regularization parameter :math:`R =`\ #r.
| ``dem chireg #r1:#r2 #i`` : Do a grid search over the regularization
  parameter :math:`R`, with #i steps and :math:`R` distributed
  logarithmically between #r1 and #r2. Useful to scan the
  :math:`\chi^2(R)` curve whenever it is complicated and to see how much
  "penalty’ (negative DEM values) there are for each value of :math:`R`.
| ``dem clean`` : Do DEM analysis using the clean method
| ``dem poly #i`` : Do DEM analysis using the polynomial method, where
  #i is the degree of the polynomial
| ``dem mult #i`` : Do DEM analysis using the multi-temperature method,
  where #i is the number of broad components
| ``dem gene #i1 #i2`` : Do DEM analysis using the genetic algorithm,
  using a population size given by #i1 (maximum value 1024) and #i2 is
  the number of generations (no limit, in practice after
  :math:`\sim`\ 100 generations not much change in the solution.
  Experiment with these numbers for your practical case.
| ``dem read #a`` : Read a DEM distribution from a file named #a which
  automatically gets the extension ".dem". It is an ascii file with at
  least two columns, the first column is the temperature in keV and the
  second column the differential emission measure, in units of
  :math:`10^{64}` m:math:`^{-3}` keV:math:`^{-1}`. The maximum number of
  data points in this file is 8192. Temperature should be in increasing
  order. The data will be interpolated to match the temperature grid
  defined in the dem model (which is set by the user).
| ``dem save #a`` : Save the DEM to a file #a with extension ".dem". The
  same format as above is used for the file. A third column has the
  corresponding error bars on the DEM as determined by the DEM method
  used (not always relevant or well defined, exept for the
  regularization method).
| ``dem smooth #r`` : Smoothes a DEM previously determined by any DEM
  method using a block filter/ Here #r is the full width of the filter
  expressed in :math:`^{10}\log T`. Note that this smoothing will in
  principle worsen the :math:`\chi^2` of the solution, but it is
  sometimes useful to "wash out" some residual noise in the DEM
  distribution, preserving total emission measure.

Examples
~~~~~~~~

| ``dem lib`` : create the DEM library
| ``dem reg auto`` : use the automatic regularization method
| ``dem reg 10.`` : use a regularization parameter of :math:`R=10` in
  the regularization method
| ``dem chireg 1.e-5:1.e5 11`` : do a grid search using 11
  regularisation parameters :math:`R` given by :math:`10^{-5}`,
  :math:`10^{-4}`, 0.001, 0.01, 0.1, 1, 10, 100, 1000, :math:`10^4`,
  :math:`10^5`.
| ``dem clean`` : use the clean method
| ``dem poly 7`` : use a 7th degree polynomial method
| ``dem gene 512 128`` : use the genetic algorithm with a population of
  512 and 128 generations
| ``dem save mydem`` : save the current dem on a file named mydem.dem
| ``dem read modeldem`` : read the dem from a file named modeldem.dem
| ``dem smooth 0.3`` : smooth the DEM to a temperature width of 0.3 in
  :math:`^{10}\log T` (approximately a factor of 2 in temperature
  range).
| Recommended citation: `Mewe et al. (1995) <https://ui.adsabs.harvard.edu/abs/1995A&A...296..477M/abstract>`_.
