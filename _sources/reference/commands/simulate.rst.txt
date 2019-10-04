.. _sec:simulate:

Simulate: Simulation of data
============================

Overview
~~~~~~~~

This command is used for spectral simulations. The user should start
with a spectral model and a spectral data set (both matrix and
spectrum). After giving the "simulate" command, the observed spectrum
will be replaced by the simulated spectrum in SPEX. Note that the
original spectrum file (with the .spo extension) is not overwritten by
this command, so no fear to destroy your input data!

Different options exist and several parameters can be set:

-  Instrument, region: the instrument(s) and region(s) for which the
   simulation should be done (i.e., if you have more instruments you can
   do the simulation only for one or a few instruments)

-  time: set the exposure time :math:`t` (s) of the source spectrum as
   well as the background error scale factor :math:`f_b`. This last
   option allows you to see what happens if for example the background
   would have a ten times higher accuracy (for :math:`f_b=0.1`).

-  syserr: add a systematic error to both the source and background
   spectrum. An alternative way to introduce systematic errors is of
   course to use the syserr command
   (Section `Syserr <#sec:syserr>`__). Take care not to set the
   systematic errors twice, and remember that rebinning your spectrum
   later will reduce the systematic errors, as these will be added in
   quadrature to the statistical errors. So first rebin and then add
   systematics!

-  noise: either randomize your data or just calculate the expected
   values

-  bnoise: randomize your background model (generally not recommended to
   do)

-  seed: set the random seed either to a specific number or generate it
   from the system clock. By default, SPEX initializes the random number
   generator based on the system clock, but through this command a
   specific seed can be set. The command will show the seeds used for
   the maximum number of expected threads.

.. Warning:: A response matrix and spectrum of the region and the
   instrument you want to simulate are necessary, because SPEX needs the
   response matrix as well as the background to be subtracted for the
   simulations.

.. Warning:: When you include systematic errors in the simulation (by
   putting the "syserr" to non-zero values), you cannot use anymore
   Poissonian statistics hence the C-stat for fitting, but you have to use
   the "fit meth chi" to use Gaussian errors and :math:`\chi^2`-fitting,
   with all thr disadvantages of that.

.. Warning:: When you use bnoise\ :math:`=`\ true, your subtracted
   background (the scaled background from the background region) will be
   randomized, and the pure C-stat cannot be used; the W-stat can be used
   as alternative but has serious drawbacks and is not recommended to be
   used).

.. Warning:: (obsolete) If your background is taken from the same
   observation as your source, and you multiply the original exposure time
   with a factor of :math:`S`, you should put :math:`f_b` to
   :math:`S^{-0.5}`, reflecting the fact that with increasing source
   statistics the background statistics also improves. This is the case for
   an imaging observation where a part of the image is used to determine
   the background. If instead you use a deep field to subtract the
   background, then the exposure time of your background will probably not
   change and you can safely put :math:`f_b=1` for any exposure time
   :math:`t`.

.. Warning:: (obsolete) If your subtracted background (one of the
   columns in the .spo file) is derived from a low statistics Poissonian
   variable (for example a measured count rate with few counts per
   channel), then scaling the background is slightly inaccurate as it takes
   the observed instead of expected number of background counts as the
   starting point for the simulation.

Syntax
~~~~~~

Note that only the "simulate" keyword followed by a number (the exposure
time will do the actual simulation. All other syntax rules just set some
parameters. The following syntax rules apply:

| ``simulate #r`` : Does the simulation, with #r the exposure time
  :math:`t` in seconds.
| ``simulate instrument #i1`` : Specify the instrument (range) to be
  used in the simulation. Default values are 1 (just the first
  instrument).
| ``simulate region #i1`` : Specify the region (range) to be used in the
  simulation. Default values are 1 (just the first region). For
  simulating everything you have, you can put this range to a large
  value: the simulation will simply ignore non-existent regions. If you
  use complex settings, like only region 3 for instrument 1 and region 2
  for instrument 2, you may have to run the simulation separately for
  each entity.
| ``simulate syserr #r1 #r2`` : Specify the systematic errors as a
  fraction of the source and background spectrum, respectively; both
  should be specified together. Default values are 0.
| ``simulate noise #l`` : If #l is true, Poissonian noise will be added
  (this is the default).
| ``simulate bnoise #l`` : If #l is false, no Poissonian noise will be
  added to the model background (this is the default).
| ``simulate seed #i`` : Set random seed to a particular number.
| ``simulate seed random`` : Set random seed randomly based on system
  clock.

Examples
~~~~~~~~

| ``simulate 10000.`` : This simulates a new spectrum/dataset with
  10 000 s exposure time.
| ``simulate noise f`` : Set simulation flag to simulate without
  Poissonian noise. The nominal error bars will still plotted.
| ``simulate syserr 0.1 0.2`` : Set simulation for a systematic error of
  10 % of the source spectrum and 20 % of the subtracted background
  spectrum added in quadrature.
| ``simulate instrument 2:4`` : Set simulation for a spectrum for
  instruments 2–4 only
| ``simulate region 2`` : Set simulation for only region 2 (of every
  instrument involved
| ``simulate seed 2`` : Set random number seed to 2.
