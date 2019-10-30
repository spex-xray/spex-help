.. _sec:calcmodel:

Calculating models on grids
===========================

Model spectra are generally calculated for an energy or wavelength grid. In SPEX,
the default energy grid has 8192 bins between 0.001 and 100 keV. This grid is used
when calculating models without an instrument defined, for example, when you
plot a model spectrum using the ``plot type model`` command (:ref:`sect:plottypes`).
The resolution of this grid is usually enough, but when it is not, the egrid command
can help to increase the resolution or broaden the energy range (:ref:`sec:egrid`).

Energy grids when loading data
------------------------------

When data is loaded into SPEX, then the energy grid is automatically adapted to
the loaded response matrix. Because response matrices already contain a model
energy grid and a channel grid, the SPEX energy grid should match the one from
the response, at least within the energy range defined in the response matrix.
This way, the model is always calculated at a resolution that is set by the
response matrix.

Special cases
-------------

For some models, like PION, the broad-band spectrum is very important for the
calculation. In those cases, the energy band should be extended. Recommended
is a logarithmic grid between :math:`10^{-6}-10^{6}` keV with a step size of 0.005
(see :ref:`sec:pion`). Thus, the default grid has 200 bins per decade. Which energy
grid should be used depends on your settings and wishes. The range (lower and upper
energy) matter for the physical outcome of the PION model, due to the effects of
(inverse) Compton scattering of high- and low energy photons.

When an observed spectrum and response are loaded, we could stick with just the
energies contained in the matrix. However, for the PION model also energies outside
this range are relevant, because the photons there contribute to heating/cooling/ionisation
etc. That is the reason why the energy grid is extended for this model to span the full
1E-6 to 1E6 range. We realise that the 200 bins per decade of that extension is an
arbitrary choice, but we think for most cases that is accurate enough to represent
the IR or gamma-ray range.

This extension of the energy grid happens in SPEX always, as soon as you read data,
even if you do not have the PION model. This is because SPEX cannot anticipate what
model components the user may want to add or delete to the full model that is being
used. But of course it is harmless for all other models.

You might argue that sometimes you may also want to have higher resolution than
200 bins per decade in the optical or UV range, for instance in those cases where
you might have joint HST/COS data with high resolution. Fortunately, whenever
the corresponding UV data (response & spectrum) is added, the way SPEX determines
its energy grid as described above would include the high-resolution UV part
automatically at the desirable high resolution.

Checking the energy grid
------------------------

Whenever you read data (a single spectrum, or from multiple instruments), SPEX
creates a new energy grid on which the model is evaluated, before folding with
the response matrices. This energy grid is the combination of all energies on
the photon axis (not to be confused with the count axis) of the response matrices
of all instruments involved, supplemented with a grid with a spacing of 0.005 in
log energy spanning between 1E-6 and 1E6 keV.

To see what happens in a specific case, you can plot the model spectrum, put on the x-axis
the energy in keV, and choose ``plot uy bin`` which gives you the bin number. Also
issue the command ``plot ux kev`` to re-determine the min/max energies of the grid.
This should show the binning of your response matrix/matrices as well as the extension.

Another method to inspect the energy grid is running the ``egrid save`` command
(:ref:`sec:egrid`). This will save the full energy grid to file.
