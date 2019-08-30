.. _sect:rgsfluxcombine:

RGS_fluxcombine
===============

Program *RGS_fluxcombine* combines fluxed spectra, created by the
XMM-Newton SAS task *rgsfluxer*. It has two options:

#. Option 1: combine RGS spectra of the same detector and spectral order.

#. Option 2: combine spectra of RGS1, RGS2 and first and second order of
   both (4 spectra) into one spectrum.

This is not a trivial task, due to the presence of bad pixels, CCD gaps
etc, that for each individual spectrum can be slightly different, for
instance because of the use of the multi-pointing mode (MPM) of the RGS,
so that the same bad pixel falls at a different wavelength for each
individual spectrum, or due to the transient nature of some bad
pixels/columns.

We discuss both options separately. In general, if you have RGS data for
multiple epochs of a source, you may have to run this program first four
times with option 1 (RGS1 and 2, orders 1 and 2), and then run it ones
with option 2 to get a single stacked RGS spectrum.

.. warning::
   You must run the SAS task rgsfluxer with 3600 wavelength
   bins between 4–40 Å. Thus, do not use the former :math:`\beta`-bins!
   Also, do not change these wavelength limits or number of bins.

The program needs an input file, basically telling it how many spectra
should be combined, followed by one line for each spectrum (fixed
format, in fortran (F9.2,1X,A) for option 1), containing the exposure
time in s (unfortunately not contained in the output of *rgsfluxer*, but
you can get it from the spectral files) and the name of the relevant
output file of *rgsfluxer*. For option 2 there are two additional
numbers, namely the RGS (1 or 2 for RGS1 and RGS2), and the spectral
order (1 or 2 for first and second spectral order), in such a way that
the format is (I1,1X,I1,1X,F11.2,1X,A).

Option 1: combining RGS spectra of the same detector and spectral order
-----------------------------------------------------------------------

It is important to realise that when data of a time-variable source are
combined, artifacts due to missing data (bad pixels) will arise. This
can be simply illustrated by an example. Suppose that source X is
observed twice with RGS, with exactly the same exposure time, the first
time with 100 counts/bin, the second time with 20 counts/bin. Suppose
that at wavelength bin :math:`j` the first observation has a bad pixel,
hence no counts, while the second observation has no bad pixel at bin
:math:`j`. The averaged spectrum will have (100+20)/2=60 counts per bin,
except for bin :math:`j` where the average value is (0+20)/2=10. Now
since both exposure times are the same, the model will predict 60 counts
for all bins (as required), except for bin :math:`j` where it will
predict 30 counts (the pixel is dead for half of the exposure). Thus,
the model has 30 counts while the data have only 10 counts. An innocent
observeer might therefore think there is an absorption line at bin
:math:`j` taking awat 20 counts, but it is obvious that that is not
true.

For this reason, when we combine spectra, we will weigh with the
exposure time for all “normal” bins, but when in some of the datasets
there is a bad pixel :math:`j`, we will use a different procedure. In
that case, we look to the neighbouring pixels, and *assume that the
spectral shape in this local neighbourhoud remains the same*. From the
neighbours with complete data we can estimate how much flux the spectra
with good data contribute to the total flux, and we use this fraction to
estimate with what factor we should scale the flux measured at pixel
:math:`j` in these good data sets, to obtain the best estimate of the
flux at pixel :math:`j` for the total spectrum.

This procedure gives reliable results as long as the spectral shape does
not change locally; as there is less exposure at pixel :math:`j`, only
the error bar on the flux will be larger.

When there is reason to suspect that the bad pixel is at the location of
a spectral line that changes in equivalent width, this procedure cannot
be applied!

To alleviate this problem, the user has to enter a minimum exposure
fraction. If this value is zero, for spectra with constant shape the
best result is obtained. On the other hand, if this value is 1, only
bins will be included that have no bad pixel in any of the observations
that are combined. Advantage in that case is that there is no bias in
the stacked spectrum, but a disadvantage may be that a significant part
of the spectrum may be lost near important diagnostic lines (in
particular for the multi-pointing mode).

Due to the binning and randomisation procedures within the SAS task
*rgsfluxer*, it is still possible that despite careful screening on bad
pixels, a few bad pixels remain in the fluxed spectrum, often adjacent
or close to discarded pixels. For this reason, the present program
checks for any bins that are more than 3\ :math:`\sigma` below their
right or left neighbouring bin (taking the statistical errors in both
into account). Typically, the algorithm finds a few additional bad
pixels in an individual observation that is discarded for combination.

The program further allows to apply two other corrections (both are done
in the same step). The first correction is an effective area correction.
In very high signal to noise data, there are broadband flux differences
between RGS1 and RGS2 and first and second order spectra, in some parts
of the spectrum, at the few percent level. A simpel model has been
produced to correct for this, in the sense that when RGS1 and RGS2 are
combined, the true spectrum is assumed to be the average of both. The
correction is based on the monitoring campaign on Mrk 509, taken in
2009, and is found to be consistent with a large data set of Mrk 421
spectra that are present in the archive.

Local continuum fits to spectral bands that are poor of lines yield in
general :math:`\chi^2` values that are too low. This is an artifact of
the SAS procedures related to the rebinning of the data. Data have to be
binned from the detector pixel grid to the fixed wavelength grid that we
use in our analysis. The bin boundaries of both grids do not match. As a
consequence of this process, the natural Poissonian fluctuations on the
spectrum as a function of detector pixel are distributed over the
wavelength bin coinciding most with the detector pixel and its
neighbours. In addition, there is a small smoothing effect caused by
pointing fluctuations of the satellite. Due to this tempering of the
Poissonian fluctuations, :math:`chi^2` values will be lower for a
“perfect” spectral fit.

We have quantified the effect by fitting a linear model
:math:`F_\lambda = a + b\lambda` to fluxed spectra in relatively line-poor
spectral regions, in 1 Å wide bins in the 7–10, 17–18 and 35–38 Å ranges.
The median reduced :math:`\chi^2` is 0.72, with a 67 % confidence range
between 0.65 and 0.79.

The rebinning process conserves the number of counts, hence the nominal
error bars (square root of the number of counts) are properly
determined. The lower reduced :math:`\chi^2` is caused by the smoothing
effect on the data. For correct inferences about the spectrum, such a
bias in :math:`\chi^2` is not appropriate. As we cannot change the
observed flux values, we opt to multiply the nominal errors on the
fluxes by :math:`\sqrt(0.72) = 0.85`, in order to get get acceptable
fits for ideal data and models.

Option 2: combine spectra of RGS1, RGS2 and first and second order of both (4 spectra) into one spectrum
--------------------------------------------------------------------------------------------------------

This procedure is similar to option 1, but with some differences.

No corrections for effective area or binning bias are allowed here, as
this should be taken into account in the steps that use option 1. In
case there is only one observation, the present program can also be run
with only one spectrum for option 1, to get the efective area and
binning corrections in.

Further, the spectra are not combined according to exposure time (that
should be in general almost the same for RGS1 and RGS2), but according
to signal to noise ratio at each bin. Reason is that ofteh the second
order spectra have poorer statistics than the first order spectra, hence
they should be weighted less in the combined spectra.

Spectra created with rgsfluxcombine can only be fitted using
:math:`\chi^2` statistics. C-statistics will produce wrong values.
