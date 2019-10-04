Delt: delta line model
======================

The delta line model is a simple model for an infinitely narrow emission
line.

The spectrum is given by:

.. math:: F(E) = A \delta(E-E_0),

where :math:`E` is the photon energy in keV, :math:`F` the photon flux
in units of :math:`10^{44}` ph s\ :math:`^{-1}\,`\ keV\ :math:`^{-1}`,
:math:`E_0` is the line energy of the spectral line (in keV) and
:math:`A` is the line normalisation (in units of
:math:`10^{44}` ph s\ :math:`^{-1}`). The total line flux is simply given
by :math:`A`.

To ease the use for dispersive spectrometers (gratings) there is an
option to define the wavelength instead of the energy as the basic
parameter. The parameter *type* determines which case applies: type=0
(default) corresponding to energy, type=1 corresponding to wavelength
units.

.. Warning:: When changing from energy to wavelength units, take care
   about the frozen/thawn status of the line centroid and FWHM.

.. Warning:: You need to do a "calc" or "fit" command to get an update
   of the wavelength (for type=0) or energy (type=1).

The parameters of the model are:

| ``norm`` : Normalisation :math:`A`, in units of
  :math:`10^{44}` ph s\ :math:`^{-1}`. Default value: 1.
| ``e`` : The line energy :math:`E_0` in keV. Default value: 6.4 keV.
| ``type`` : The type: 0 for energy units, 1 for wavelength units.
| ``w`` : The line wavelength :math:`\lambda` in Å. Default value: 20 Å.
