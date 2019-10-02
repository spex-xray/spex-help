Cf: isobaric cooling flow differential emission measure model
=============================================================

This model calculates the spectrum of a standard isobaric cooling flow.
The differential emission measure distribution
:math:`\mathrm{d}Y(T)/\mathrm{d}T` for the isobaric cooling flow model can be
written as

.. math::
   D(T)\equiv \mathrm{d}Y(T)/\mathrm{d}T = \frac{5\dot{M}k}{2\mu m_{\mathrm{H}} \Lambda(T)},

where :math:`\dot{M}` is the mass deposition rate, :math:`k` is
Boltzmann’s constant, :math:`\mu` the mean molecular weight (0.618 for a
plasma with 0.5 times solar abundances), :math:`m_{\mathrm{H}}` is the mass
of a hydrogen atom, and :math:`\Lambda(T)` is the cooling function. We
have calculated the cooling function :math:`\Lambda` using our own
SPEX code for a grid of temperatures and for 0.5 times solar abundances.
The spectrum is evaluated by integrating the above differential emission
measure distribution between a lower temperature boundary :math:`T_1`
and a high temperature boundary :math:`T_n`. We do this by creating a
temperature grid with :math:`n` bins and calculating the spectrum for
each temperature.

.. Warning:: Take care that :math:`n` is not too small in case the
   relevant temperature is large; on the other hand if :math:`n` is large,
   the computational time increases. Usually a spacing with temperature
   differences between adjacent bins of 0.1 (in :math:`\log`) is sufficient
   and optimal.

.. Warning:: The physical relevance of this model is a matter of debate.

The parameters of the model are:

| ``norm`` : The mass deposition rate :math:`\dot{M}` in
  :math:`\mathrm{M}_{\odot}` :math:`\mathrm{yr}^{-1}`.
| ``t1`` : Lower temperature cut-off temperature :math:`T_1`. Default:
  0.1 keV.
| ``tn`` : Upper temperature cut-off temperature :math:`T_n`. Default:
  1 keV.
| ``nr`` : Number of temperature bins :math:`n` used in the integration.
  Default value: 16
| ``p`` : Slope :math:`p=1/\alpha`. Default: 0.25 (:math:`\alpha = 4`).
| ``cut`` : Lower temperature cut-off, in units of :math:`T_{\max}`.
  Default value: 0.1.
| The following parameters are the same as for the cie-model: ``ed`` :
  Electron density in :math:`10^{20}` m:math:`^{-3}`
| ``it`` : Ion temperature in keV
| ``vmic`` : Micro turbulent velocity in km/s
| ``ref`` : Reference element
| ``01...30`` : Abundances of H to Zn
| ``file`` : Filename for the nonthermal electron distribution

*Recommended citation:* `Kaastra et al. (2004) <https://ui.adsabs.harvard.edu/abs/2004A%26A...413..415K/abstract>`_
and `Fabian et al. (1984) <https://ui.adsabs.harvard.edu/abs/1984Natur.310..733F/abstract>`_.

