Refl: reflection model
======================

This model was kindly provided by Piotr Zycki. The related programs in
XSPEC are felipl ans ferfschw. The first one gives the reflected
continuum (i.e. pexrav/pexriv) plus the line with correct energy and
intensity, the second one is the first one with the relativistic
smearing added. Both are combined into the single refl model in SPEX.

It is a model of reflection from a constant density X-ray illuminated
atmosphere. It computes the Compton-reflected continuum
(`Magdziarz & Zdziarski (1995) <https://ui.adsabs.harvard.edu/abs/1995MNRAS.273..837M/abstract>`_;
and the iron K alpha line `Zycki & Czerny (1994)
<https://ui.adsabs.harvard.edu/abs/1994MNRAS.266..653Z/abstract>`_,
as described in `Zicky et al. (1999)
<https://ui.adsabs.harvard.edu/abs/1999MNRAS.305..231Z/abstract>`_
In addition, it can be convolved with a relativistic diskline model
(for Schwarzschild geometry).

Chemical elements taken into account in this model are H, He, C, N, O,
Ne, Mg, Si, S and Fe. The standard abundances are taken from
`Morrison & McCammon (1983) <https://ui.adsabs.harvard.edu/abs/1983ApJ...270..119M/abstract>`_.

The incoming spectrum is characterized by:

.. math:: N_i(E) = A E^{-\Gamma}\exp \left[ -E/E_c \right],

where :math:`E` is the photon energy in keV, :math:`N_i(E)` the number
of photons per per second per keV, :math:`\Gamma` is the photon index
and :math:`E_c` a cut-off energy. The normalisation :math:`A` is in
units of :math:`10^{44}` photons :math:`\mathrm{s}^{-1}` :math:`\mathrm{keV}^{-1}` at
1 keV, just the same as in the standard power law model. The total
spectrum :math:`N(E)` is then given by

.. math:: N(E) = N_i(E) + s R(E),

where :math:`R(E)` is the reflected spectrum and :math:`s` is a scaling
factor.

The parameters of the model are:

| ``norm`` : Normalisation :math:`A` of the power law.
| ``gamm`` : The photon index :math:`\Gamma` of the ionising spectrum.
| ``ecut`` : The cut-off energy (keV) of the ionising spectrum. If no
  cut-off is desired, take this parameter zero (and keep it frozen!).
| ``pow`` : If pow=1, the incoming power law is added to the spectrum
  (default); if pow=0, only the reflected spectrum is given.
| ``disk`` : If disk=1, the spectrum will be convolved with an accretion
  disk profile (default); if disk=0, this is not done.
| ``fgr`` : Full general relativity used (default, for fgr=1).
| ``t`` : Temperature of the reflector (disk) in keV.
| ``xi`` : Ionisation parameter :math:`\xi=L/nr^2` in the usual (c.g.s.
  based) units of :math:`10^{-9}` W m.
| ``abun`` : The abundance of all metals excluding H and He, in solar
  units
| ``feab`` : The iron abundance with respect to the other metals
| ``cosi`` : The cosine of the inclination angle of the disk.
  :math:`\cos i=0` (:math:`i=\pi/2`) corresponds to edge-on
| ``scal`` : Scale :math:`s` for reflection. For an isotropic source
  above the disk :math:`s=1`. This value corresponds to seeing equal
  contributions from the reflected and direct spectra.
| ``q`` : Emissivity index for the accretion disk; default value -3 (the
  emissivity scales with :math:`r^{+q}` at large radii, so :math:`q=-3`
  means :math:`r^-3`. Note the sign difference with the Laor model.
| ``r1`` : Inner radius of the disk in units of :math:`GM/c^2`. Default:
  10.
| ``r2`` : Outer radius of the disk in units of :math:`GM/c^2`. Default:
  :math:`10^4`.

*Recommended citation:* `Magdziarz & Zdziarski (1995)
<https://ui.adsabs.harvard.edu/abs/1995MNRAS.273..837M/abstract>`_ and
`Zicky et al. (1999) <https://ui.adsabs.harvard.edu/abs/1999MNRAS.305..231Z/abstract>`_
