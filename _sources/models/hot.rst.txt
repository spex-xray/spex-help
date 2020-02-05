Hot: collisional ionisation equilibrium absorption model
========================================================

This model calculates the transmission of a plasma in collisional
ionisation equilibrium with cosmic abundances.

For a given temperature and set of abundances, the model calculates the
ionisation balance and then determines all ionic column densities by
scaling to the prescribed total hydrogen column density. Using this set
of column densities, the transmission of the plasma is calculated by
multiplying the transmission of the individual ions.

The transmission includes both continuum and line opacity. For a
description of what is currently in the absorption line database, we
refer to Section `Absorption models <#sect:absmodels>`__. You can mimick
the transmission of a neutral plasma very easy by putting the
temperature to 0.5 eV (5 :math:`10^{-4}` keV).

.. warning:: For solar abundances, do not take the temperature much
   lower than 0.0005 keV, because if the plasma is completely neutral, the
   code will crash; a tiny fraction of ions such as Fe  or Na  will help to
   keep a few free electrons in the gas without affecting the transmission
   too much. You can check the ion concentrations by giving an "asc ter
   :math:`\ldots` icon" command. Fill in the sector and component number of
   the hot component for the … in the "asc ter … icon" command to get the
   values for the right component.

The parameters of the model are:

| ``nh`` : Hydrogen column density in :math:`10^{28}` :math:`\mathrm{m}^{-2}`.
  Default value: :math:`10^{-4}` (corresponding to
  :math:`10^{24}` :math:`\mathrm{m}^{-2}`, a typical value at low Galactic
  latitudes).
| ``t`` : the electron temperature :math:`T_{\mathrm e}` in keV. Default
  value: 1.
| ``rt`` : the ratio of ionization balance to electron temperature,
  :math:`R_{\mathrm b} = T_{\mathrm b} / T_{\mathrm e}` in keV. Default
  value: 1.
| The following parameters are common to all our absorption models:
  ``f`` : The covering factor of the absorber. Default value: 1 (full
  covering)
| ``v`` : Root mean square velocity :math:`\sigma_{\mathrm v}`
| ``rms`` : Rms velocity :math:`\sigma_{\mathrm b}` of line blend
  components
| ``dv`` : Velocity distance :math:`\Delta v` between different blend
  components
| ``zv`` : Average systematic velocity :math:`v` of the absorber
| The following parameters are the same as for the cie-model (see there
  for a description): ``ref`` : Reference element
| ``01...30`` : Abundances of H to Zn
| ``file`` : Filename for the nonthermal electron distribution

*Recommended citation:* `de Plaa et al. (2004)
<https://ui.adsabs.harvard.edu/abs/2004A%26A...423...49D/abstract>`_ and
`Steenbrugge et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005A%26A...434..569S/abstract>`_.
