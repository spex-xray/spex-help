.. _sect:hot:

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
refer to :ref:`sect:absmodels`. By default, the model mimics
the transmission of a neutral plasma by setting the default
temperature to 8E-3 eV (:math:`8 \times 10^{-6}` keV).

Please note that since SPEXACT updates 3.06.00 and 3.06.01, the
behaviour of the hot model at low temperatures changed. Since these
versions, SPEX includes also charge exchange processes in the hot
model and these change the ionisation balance at low temperature.
While for previous SPEX versions, setting a temperature of
:math:`5 \times 10^{-4}` was enough to obtain a neutral gas,
now, the temperature needs to be set to :math:`8 \times 10^{-6}` keV
to obtain the same result.

Since the hot model is mostly used to model neutral gas in the ISM,
we decided to set the default temperature to the minimum temperature
of :math:`8 \times 10^{-6}` keV. This should result in a neutral gas
and give the user the result most users expect.

The parameters of the model are:

| ``nh`` : Hydrogen column density in :math:`10^{28}` :math:`\mathrm{m}^{-2}`.
  Default value: :math:`10^{-4}` (corresponding to
  :math:`10^{24}` :math:`\mathrm{m}^{-2}`, a typical value at low Galactic
  latitudes).
| ``t`` : the electron temperature :math:`T_{\mathrm e}` in keV. Default
  value: :math:`8 \times 10^{-6}` keV.
| ``rt`` : the ratio of ionization balance to electron temperature,
  :math:`R_{\mathrm b} = T_{\mathrm b} / T_{\mathrm e}` in keV. Default
  value: 1.
| ``hden`` : Hydrogen density in :math:`10^{20}` :math:`\mathrm{m}^{-3}`.
  Default value: :math:`10^{-14}` (corresponding to
  :math:`10^{6}` :math:`\mathrm{m}^{-3}`, a typical value for the ISM).

The following parameters are common to all our absorption models:

| ``f`` : The covering factor of the absorber. Default value: 1 (full
  covering)
| ``v`` : Root mean square velocity :math:`\sigma_{\mathrm v}`
| ``rms`` : Rms velocity :math:`\sigma_{\mathrm b}` of line blend
  components
| ``dv`` : Velocity distance :math:`\Delta v` between different blend
  components
| ``zv`` : Average systematic velocity :math:`v` of the absorber

The following parameters are the same as for the cie-model (:ref:`sect:cie`):

| ``ref`` : Reference element
| ``01...30`` : Abundances of H to Zn
| ``file`` : Filename for the nonthermal electron distribution
| ``b`` : External magnetic field strength in Gauss. See *cie* section. Default value: 0

*Recommended citation:* `de Plaa et al. (2004)
<https://ui.adsabs.harvard.edu/abs/2004A%26A...423...49D/abstract>`_ and
`Steenbrugge et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005A%26A...434..569S/abstract>`_.
