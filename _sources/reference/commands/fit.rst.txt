.. _sec:fit:

Fit: spectral fitting
=====================

Overview
~~~~~~~~

With this command one fits the spectral model to the data. Only
parameters that are thawn are changed during the fitting process.
Options allow you to do a weighted fit (according to the model or the
data), have the fit parameters and plot printed and updated during the
fit, and limit the number of iterations done.

At the moment SPEX uses two types of fit statistic, :math:`\chi^2` and
C-stat. We first treat the :math:`\chi^2` statistic, because
historically that has been most widely used. However, in the present
version of SPEX  C-stat is the default because in the far majority of
the cases it gives more robust results.

Chi-squared fitting
~~~~~~~~~~~~~~~~~~~

First we make a few remarks about proper data weighting. :math:`\chi^2`
is usually calculated as the sum over all data bins :math:`i` of
:math:`(N_i - s_i)^2 / \sigma_i^2`, i.e.

.. math:: \chi^2 = \sum_{i=1}^{n} \frac{(N_i - s_i)^2}{\sigma_i^2},

where :math:`N_i` is the observed number of source plus background
counts, :math:`s_i` the expected number of source plus background counts
of the fitted model, and for Poissonian statistics usually one takes
:math:`\sigma_i^2=N_i`. Take care that the spectral bins contain
sufficient counts (either source or background), recommended is e.g. to
use at least :math:`\sim`\ 10 counts per bin. If this is not the case,
first rebin the data set whenever you have a "continuum" spectrum. For
line spectra you cannot do this of course without loosing important
information! Note however that this method has inaccuracies if
:math:`N_i` is less than :math:`\sim`\ 100.

`Wheaton et al. (1995) <https://ui.adsabs.harvard.edu/abs/1995ApJ...438..322W/abstract>`_
have shown that the classical :math:`\chi^2` method becomes inaccurate
for spectra with less than :math:`\sim 100` counts per bin. This is *not*
due to the approximation of the Poisson statistic by a normal distribution,
but due to using the *observed* number of counts :math:`N_i` as weights
in the calculation of :math:`\chi^2`. `Wheaton et al. (1995)
<https://ui.adsabs.harvard.edu/abs/1995ApJ...438..322W/abstract>`_
showed that the problem can be resolved by using instead
:math:`\sigma_i^2 = s_i`, i.e. the *expected* number of counts
from the best fit model.

The option "fit weight model" allows to use these modified weights. By
selecting it, the expected number of counts (both source plus
background) of the current spectral model is used onwards in calculating
the fit statistic. `Wheaton et al. (1995) <https://ui.adsabs.harvard.edu/abs/1995ApJ...438..322W/abstract>`_
suggest to do the following 3-step process, which we also recommend to the user of
SPEX who uses this option:

#. first fit the spectrum using the data errors as weights (the default
   of SPEX).

#. After completing this fit, select the "fit weight model" option and
   do again a fit

#. then repeat this step once more by again selecting "fit weight model"
   in order to replace :math:`s_i` of the first step by :math:`s_i` of
   the second step in the weights. The result should now have been
   converged (under the assumption that the fitted model gives a
   reasonable description of the data, if your spectral model is way off
   you are in trouble anyway!).

C-stat
~~~~~~

There is yet another option to try for spectral fitting with low count
rate statistics and that is maximum likelyhood fitting. It can be shown
that a good alternative to :math:`\chi^2` in that limit is

.. math:: C = 2 \sum_{i=1}^{n} s_i - N_i + N_i \ln (N_i/s_i).

This is strictly valid in the limit of Poissonian statistics. If you
have a background subtracted spectrum, take care that the subtracted
number of background counts is properly stored in the spectral data
file, so that raw number of counts can be reconstructed.

This statistic was originally proposed in some other form by
`Cash (1979) <https://ui.adsabs.harvard.edu/abs/1979ApJ...228..939C/abstract>`_
and in the present form sometimes attributed to Castor. However, it appears
that it was already introduced and well explained by
`Baker et al. (1994) <https://ui.adsabs.harvard.edu/abs/1984NIMPR.221..437B/abstract>`_ .

.. warning:: Note that for a spectrum with many counts per bin
   :math:`C\rightarrow\chi^2`, but if the predicted number of counts per
   bin is small, the expected value for :math:`C` can be substantially
   smaller than the number of bins :math:`n`.

To help the user to see if a :math:`C`-value corresponds to an
acceptable fit, SPEX gives, after spectral fitting, the expected value
of :math:`C` and its r.m.s. spread, based on the best-fit model. Both
quantities are simply determined by adding the expected contributions
and their variances over all bins. See `Kaastra et al. (2017)
<https://ui.adsabs.harvard.edu/abs/2017A&A...605A..51K/abstract>`_
for more details.

.. figure:: cstat.png
   :alt: Expected value of the contribution per bin to :math:`C`, and its r.m.s. uncertainty, as a function of the mean expected number of counts :math:`\mu`.
   :name: fig:cstat

   Expected value of the contribution per bin to :math:`C`, and its
   r.m.s. uncertainty, as a function of the mean expected number of
   counts :math:`\mu`.

The expected value :math:`C_{\rm e}` for :math:`C` in a bin :math:`i`
and its variance :math:`C_{\rm v}` are given by:

.. math:: C_{e} = 2 \sum_{k=0}^\infty P_k(\mu) (\mu - k + k \ln (k/\mu)),

.. math:: S_{v} = 4 \sum_{k=0}^\infty P_k(\mu) (\mu - k + k \ln (k/\mu))^2,

.. math:: C_{v} = S_{v} - C_{e}^2,

with :math:`P_k(\mu)` the Poisson distribution:

.. math:: P_k(\mu) = {e}^{\displaystyle{-\mu}} \mu^k / k!

and :math:`\mu` the expected number of counts. We show both quantities
in Fig. \ `1 <#fig:cstat>`__.

.. warning:: For a proper use of C-stat, it is needed that the
   background (if present) is also a model for the background, not a scaled
   background observation. Unfortunately, the fast majority of instrument
   software packeges provide spectra with such a scaled (and therefore
   noisy) background). By experimenting it can be shown that in situations
   where the source is (much) weaker that the subtracted background, this
   can give bias in the fitted flux (it will be over-estimated). Rebinning
   the spectrum resolves the problem (because it is some kind of smoothing)
   but at the expense of spectral resolution. This is undesired. We
   therefore offer an auxiliary program called backfilter that can filter
   the subtracted background. It works on a .spo file and creates an
   improved .spo file. See the documentation of backfilter for more
   details.

W-stat
~~~~~~

The above problem is mitigated in the Xspec package by introducing the
so-called W-statistic. See the Xspec manual for more details. We provide
here the option to fit using W-stat for compatibility reasons,

.. warning:: But we do not recommend to use it, but instead use C-stat
   with background filtering (see above) where needed.

The W-stat first calculates a background estimate for each bin using
maximum likelihood techniques. This background depends on the number of
counts in the background region, the number of counts in the source
region, the predicted number of source counts from the spectral model,
and the exposure times of the source region and background region (or,
equivalently, incorporating any background area scaling ratio). Using
these background estimates, W-stat is then evaluated, and this can be
used in the algorithm to find the best-fit set of source parameters.

The Xspec manual notes that for weak sources it can generate an
obviously wrong best fit", and they advice to rebin to at least one
count per bin to mitigate. This however may degrade the spectral
resolution too much. Moreover, for a simple case (blackbody fit to an
isolated neutron star), we found that the fitting procedure can show
non-monotonous behaviour of W-stat versus iteration, with annoying
oscillatory behaviour. Also, a full fit with error search of that
spectrum required four times more model evaluations compared with C-stat
fitting with filtered background.

Syntax
~~~~~~

The following syntax rules apply:

| ``fit`` : Execute a spectral fit to the data.
| ``fit print #i`` : Printing the intermediate results during the
  fitting to the screen for every :math:`n`-th step, with :math:`n`\ =#i
  (most useful for :math:`n=1`). Default value: 0 which implies no
  printing of intermediate steps.
| ``fit iter #i`` : Stop the fitting process after #i iterations,
  regardless convergence or not. This is useful to get a first
  impression for very cpu-intensive models. To return to the default
  stop criterion, type fit iter 0.
| ``fit weight model`` : Use the current spectral model as a basis for
  the statistical weight in all subsequent spectral fitting.
| ``fit weight data`` : Use the errors in the spectral data file as a
  basis for the statistical weight in all subsequent spectral fitting.
  This is the default at the start of SPEX.
| ``fit method classical`` : Use the classical Levenberg-Marquardt
  minimisation as the fitting method.
| ``fit statistic chi2`` : Use the :math:`\chi^2` statistic for the
  minimisation.
| ``fit statistic cstat`` : Use the C-statistics for the minimisation.
  This is the default at start-up.
| ``fit statistic wstat`` : Use the W-statistics for the minimisation.

Examples
~~~~~~~~

| ``fit`` : Performs a spectral fit. At the end the list of best fit
  parameters is printed, and if there is a plot this will be updated.
| ``fit print 1`` : If followed by the above fit command, the
  intermediate fit results are printed to the screen, and the plot of
  spectrum, model or residuals is updated (provided a plot is selected).
| ``fit iter 10`` : Stop the after 10 iterations or earlier if
  convergence is reached before ten iterations are completed.
| ``fit iter 0`` : Stop fitting only after full convergence (default).
| ``fit weight model`` : Instead of using the data for the statistical
  weights in the fit, use the current model.
| ``fit weight data`` : Use the data instead for the statistical weights
  in the fit.
| ``fit method clas`` : Use the classical Leveberg-Marquardt method to
  find minima. At this moment the only option.
| ``fit statistic chi2`` : Switch from C-statistics to :math:`\chi^2`.
| ``fit statistic cstat`` : Switch back to C-statistics.
