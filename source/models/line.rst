Line: transmission model for a single spectral line
===================================================

This model calculates the transmission :math:`T(E)` for a single
spectral emission or absorption model. It is used as a multiplicative
component, and can be used both for absorption and emission lines. The
line profile is a Voigt profile (the convolution between a Gaussian and
a Lorentzian profile):

.. math:: T(E) = e^{-\tau(E)},

with the optical depth :math:`\tau(E)` given by:

.. math:: \tau(E) = \tau_0 K(x,y),

where :math:`K(x,y)` is the Voigt profile given by

.. math::

   K(x,y) = \frac{y}{\pi} \int_{-\infty}^{\infty}
   \frac{e^{\displaystyle{-t^2}}}{y^2+(x-t)^2} \mathrm{d}t,

with

.. math:: x = \frac{2\sqrt{\ln{2}}}{F_{\mathrm g}}  (E-E_0)

and

.. math:: y = \sqrt{\ln{2}} \frac{F_{\mathrm l}}{F_{\mathrm d}}

where :math:`F_{\mathrm g}` and :math:`F_{\mathrm l}` are the Full Width at Half
Maximum of the Gaussian and Lorentzian components, respectively.
Further, :math:`E_0` is the line centroid.

The program also calculates the equivalent width of the line.

The model can be used both in energy (keV) mode or wavelength (Å) mode.
In each case, the quantities for the other scaling (centroid, equivalent
width, and FWHMs of the Gaussian and Lorentzian components) are
calculated. In addition, like all SPEX absorption models, also the
covering factor can be varied.

.. Warning:: The equivalent width is calculated at the energy grid in
   use for SPEX. Line flux outside this range is not taken into account.
   That may be important in the case of strong Lorentzian wings.

.. Warning:: The parameter :math:`\tau_0` only represents the optical
   depth at the line centre for a pure Gaussian case. When the Lorentzian
   component becomes important, the "true" depth at line center is
   smaller.

.. Warning:: When changing from energy to wavelength units, take care
   about the frozen/thawn status of the line centroid and FWHM.

.. Warning:: You need to do a ``calc`` or ``fit`` command to get an update
   of the wavelength (for ``type=0``) or energy (``type=1``).

The parameters of the model are:

| ``tau0`` : Optical depth :math:`\tau_0` at line center. Default value:
  1. Positive values correspond to absorption lines, negative values to
  emission lines.
| ``el`` : Line center energy :math:`E_0` (keV). Default value: 6.4 keV.
| ``fwhg`` : FWHM of the Gaussian component :math:`F_g` in keV. Default
  value: 0.1 keV.
| ``fwhl`` : FWHM of the Lorentzian component :math:`F_l` in keV.
  Default value: 0.1 keV.
| ``type`` : Type of calculation. Type=0: energy units; type=1:
  wavelength units.
| ``wl`` : Line center wavelength :math:`E_0` (Å). Default value: 20 Å.
| ``awhg`` : FWHM of the Gaussian component :math:`F_g` in Å. Default
  value: 0.1 Å.
| ``awhl`` : FWHM of the Lorentzian component :math:`F_l` in Å. Default
  value: 0.1 Å.
| ``ewk`` : Equivalent width of the line in keV. Calculated by the
  program, not an input variable.
| ``ewa`` : Equivalent width of the line in Å. Calculated by the
  program, not an input variable.
|  ``icov`` : The shape type of the covering factor. Default value 2 (constant). See :ref:`sect:abs_models` for details.
|  ``fcov`` : The covering factor (at high energy) of the absorber. Default value: 1 (full covering)
|  ``lcov`` : The covering factor (at low energy) of the absorber. Default value: 1 (full
  covering)
|  ``ecov`` : The energy parameter of the transition from low-energy to high-energy covering factor (keV). Default value: 1 (full
  covering)
|  ``acov`` : The width parameter of the covering factor transition from low to high energies. Default value: 1
