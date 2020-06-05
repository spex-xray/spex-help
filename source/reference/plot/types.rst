.. _sect:plottypes:

Plot types
==========

There are several plot types available in SPEX. Below we list them together
with the acronym that should be used when defining this plot type (in a
``plot type`` command).

-  ``data`` – a spectrum observed with an instrument plus optionally the
   folded (predicted) model spectrum and/or the subtracted background
   spectrum.

-  ``model`` – the model spectrum, not convolved by any instrumental profile

-  ``area`` – the effective area of the instrument. If the response matrix
   of the instrument contains more components, also the contribution of
   each component is plotted separately.

-  ``fwhm`` – the peak energy of the response matrix (as the model) as well
   as the FWHM limits (as the data) are plotted. The FWHM limits are the
   energies at which the response reaches half of its maximum value. If
   for the y-axis the option “de/e” is chosen, all calculated energies
   are divided by the energy of the incoming photon.

-  ``chi`` – the fit residuals, either expressed in units such as counts/s
   or the same units as the spectrum, or expressed in terms of number of
   standard deviations, or as a relative error.

-  ``dem`` – a differential emission measure distribution.
