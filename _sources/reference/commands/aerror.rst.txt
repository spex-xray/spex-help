.. _sec:aerror:

Aerror: Estimate atomic data errors for model parameters
========================================================

Overview
~~~~~~~~

This command calculates the atomic error on a certain parameter of the {\it cie}
model. 1 :math:`$\sigma$` error (68% confidence level) is calculated. The atomic error
is estimated based on the approach in `Gu et al. (2022) <https://doi.org/10.3390/s22030752>`_.
In this paper, the uncertainties on the line emissivities of the *cie* model are
estimated by comparing the model with the observed spectra of stellar coronae and
a cluster of galaxies.

The current estimation is based on a pre-calculation of atomic errors as a function
of electron temperature and Fe abundance. The value is obtained with a two-dimensional
interpolation of the temperature and Fe abundance grids defined in the pre-calculation.

Note that the current estimation does not cover notable error sources including in
particular the ion concentration and wavelength uncertainties. These components can
be assessed by comparing the fits with different balance standards, and by shifting
the line centers manually in the model.

For the Fe abundance, there are three types of atomic errors available: error with the Fe-L
shell, the K shell, and using the entire band. Users can switch between the three bandpasses
by setting the *Shell* value. If the target parameters (e.g., abundances) are determined
by few isolated lines, it is also possible to calculate the atomic error manually using the
analytic emissivity-uncertainty relation introduced in `Gu et al. (2022) <https://doi.org/10.3390/s22030752>`_.

 .. note:: This command only works for the CIE model.

Syntax
~~~~~~

| ``aerror #i1 #i2 #a shell #i3``: Determine the atomic error for the parameter specified
  by the sector #i1 (optional), component #i2 (optional)
  and parameter #a (optional). If not specified, the range
  for the last call will be used. On startup, this is the first parameter
  of the first component of the first sector. Shell #i3 (0: full band, 1:L-shell, 2:K-shell)
  sets the band used to calculate the Fe abundance error.

Examples
~~~~~~~~

| ``aerror norm``: Give the atomic error for the emission measure of the
  current component.
| ``aerror 2 26 shell 1``: Calculate the error for the Fe abundance
  of component 2 using the L-shell part.

Recommended citation: `Gu et al. (2022) <https://doi.org/10.3390/s22030752>`_