Gaus: gaussian line model
=========================

The Gaussian line model is the simplest model for a broadened emission
line.

The spectrum is given by:

.. math:: F(E) = A e^{\displaystyle{(E-E_0)^2/2\sigma^2}},

where :math:`E` is the photon energy in keV, :math:`F` the photon flux
in units of :math:`10^{44}` ph s\ :math:`^{-1}\,`\ keV\ :math:`^{-1}`,
:math:`E_0` is the average line energy of the spectral line (in keV) and
:math:`A` is the line normalisation (in units of
:math:`10^{44}` ph s\ :math:`^{-1}`). The total line flux is simply given
by :math:`A`. Further :math:`\sigma` is the Gaussian width, which is
related to the full width at half maximum :math:`FWHM` by
:math:`FWHM=\sigma \sqrt{\ln 256}` or approximately
:math:`FWHM = 2.3548\sigma`.

To ease the use for dispersive spectrometers (gratings) there is an
option to define the wavelength instead of the energy as the basic
parameter. The parameter *type* determines which case applies: type=0
(default) corresponding to energy, type=1 corresponding to wavelength
units.

.. warning:: Do not confuse :math:`\sigma` with :math:`FWHM` when
   interpreting your fit results with other data.

.. Warning:: When changing from energy to wavelength units, take care
   about the frozen/thawn status of the line centroid and FWHM.

.. Warning:: You need to do a "calc" or "fit" command to get an update
   of the wavelength (for type=0) or energy (type=1).

The parameters of the model are:

| ``norm`` : Normalisation :math:`A`, in units of
  :math:`10^{44}` ph s\ :math:`^{-1}`. Default value: 1.
| ``e`` : The line energy :math:`E_0` in keV. Default value: 6.4 keV.
| ``fwhm`` : The line :math:`FWHM`, in keV.
| ``type`` : The type: 0 for energy units, 1 for wavelength units.
| ``w`` : The line wavelength :math:`\lambda` in Å. Default value: 20 Å.
| ``awid`` : The line :math:`FWHM`, in Å.

*Recommended citation:* `Gauss (1809) <https://ui.adsabs.harvard.edu/abs/1809tmcc.book.....G/abstract>`_.
