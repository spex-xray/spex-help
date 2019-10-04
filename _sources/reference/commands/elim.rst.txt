.. _sec:elim:

Elim: set flux energy limits
============================

Overview
~~~~~~~~

SPEX offers the opportunity to calculate the model flux in a given
energy interval for the current spectral model. This information can be
viewed when the model parameters are shown (see
section `Par <#sec:par>`__).

For each additive component of the model, the following quantities are
listed:

- the observed photon number flux (:math:`\mathrm{photons}` :math:`\mathrm{m}^{-2}` :math:`\mathrm{s}^{-1}`)
  at earth, including any effects of galactic absorption etc.

- the observed energy flux (:math:`\mathrm{W} \mathrm{m}^{-2}`) at earth, including any
  effects of galactic absorption etc.

- the intrinsic number of photons emitted at the source, not diluted by
  any absorption etc., in :math:`\mathrm{photons}` :math:`\mathrm{s}^{-1}`.

- the intrinsic luminosity emitted at the source, not diluted by any
  absorption etc., in W.

The following units can be used to designate the energy or wavelength
range: keV (the default), eV, Ryd, J, Hz, Å, nm.

Syntax
~~~~~~

The following syntax rules apply:

| ``elim #r1:#r2 [#a]`` : Determine the flux between #r1 #r2, in units
  given by #a, and as listed above. The default at startup is
  :math:`2 - 10` keV. If no unit is given, it is assumed that the limits
  are in keV.

.. warning:: When new units or limits are chosen, the spectrum must
   be re-evaluated (e.g. by giving the "calc" comand) in order to
   determine the new fluxes.

.. warning:: The lower limit must be positive, and the upper limit must
   always be larger than the lower limit.

Examples
~~~~~~~~

| ``elim 0.5:4.5`` : give fluxes between 0.5 and 4.5 keV
| ``elim 500:4500 ev`` : give fluxes between 500 and 4500 eV (same
  result as above)
| ``elim 5:38 a`` : give fluxes in the 5 to 38 Å wavelength band
