Dem: differential emission measure model
========================================

This model calculates a set of isothermal CIE spectra, that can be used
later in one of the DEM analysis tools (see the "dem" commands of the
syntax). The CIE spectra are evaluated for a logarithmic grid of
temperatures between :math:`T_1` and :math:`T_2`, with :math:`n` bins.

.. warning:: For the DEM methods to work, the dem model is the only
   allowed additive component that can be present. No other additive
   components are allowed. But of course the spectrum of the dem model may
   be modified by applying any combination of multiplicative models
   (redshifts, absorptions, line broadening, etc.).

.. warning:: Because of the above, do not use the ``fit`` commands when
   you have a dem model. If you really need to fit, use the ``pdem`` model
   (:ref:`sect:pdem`) instead.

.. Warning:: In general, the spacing between the different temperature
   components should not be smaller than 0.10 in :math:`\log T`. Smaller
   step sizes will produce unstable solutions.

The parameters of the model are:

| ``t1`` : Lower temperature :math:`T_1` in keV. Default value: 0.001
  keV.
| ``t2`` : Upper temperature :math:`T_2` in keV. Default value: 100 keV.
| ``nr`` : Number of temperature bins. Default value: 64.
| The following parameters are the same as for the cie-model:
| ``ed`` : Electron density in :math:`10^{20}` :math:`\mathrm{m}^{-3}`.
| ``it`` : Ion temperature in keV.
| ``vrms`` : RMS Velocity broadening in km/s (see :ref:`sect:turbulence`).
| ``ref`` : Reference element.
| ``01...30`` : Abundances of H to Zn.
| ``file`` : Filename for the non-thermal electron distribution.

*Recommended citation:* `Mewe et al. (1995)
<https://ui.adsabs.harvard.edu/abs/1995A%26A...296..477M/abstract>`_
