Euve: EUVE absorption model
===========================

This model calculates the transmission of gas with cosmic abundances as
published first by `Rumph et al. (1994)
<https://ui.adsabs.harvard.edu/abs/1994AJ....107.2108R/abstract>`_.
It is a widely used model for the transmission at wavelenghts covered by the EUVE satellite
(:math:`\lambda > 70` Å). As it these wavelengths metals are relatively unimportant, it
only takes into account hydrogen and helium, but for these elements it
takes into account resonances. However it is not recommended to use the
model for harder X-rays, due to the neglect of metals such as oxygen
etc.

Otherwise the user is advised to use the "absm" model or the "hot" model
with low temperature in SPEX, which gives the transmission of a slab in
collisional ionisation equilibrium.

The parameters of the model are:

| ``nh`` : Hydrogen column density in :math:`10^{28}` :math:`\mathrm{m}^{-2}`.
  Default value: :math:`10^{-4}` (corresponding to
  :math:`10^{24}` :math:`\mathrm{m}^{-2}`, a typical value at low Galactic
  latitudes).
| ``he1`` : The He  / H  ratio. Default value: 0.1.
| ``he2`` : The He  / H  ratio. Default value: 0.01.
| ``f`` : The covering factor of the absorber. Default value: 1 (full
  covering)

*Recommended citation:* `Rumph et al. (1994)
<https://ui.adsabs.harvard.edu/abs/1994AJ....107.2108R/abstract>`_.
