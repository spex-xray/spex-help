Bb: blackbody model
===================

The surface *energy* flux of a blackbody emitter is given by

.. math:: F_\nu = \pi B_\nu = \frac{2\pi h\nu^3/c^2}{e^{h\nu/kT}-1}

(`Chapter 1 of Rybicki & Lightman 1986 <https://doi.org/10.1002/9783527618170>`_).
We transform this into a spectrum with energy units (conversion from Hz to keV) and
obtain for the total *photon* flux:

.. math:: S(E){\mathrm d}E = 2\pi c [10^3e/hc]^3 \frac{E^2}{e^{E/T}-1} {\mathrm d}E

where now :math:`E` is the photon energy in keV, :math:`T` the
temperature in keV and :math:`e` is the elementary charge in Coulomb.
Inserting numerical values and multiplying by the emitting area
:math:`A`, we get

.. math:: N(E) = 9.883280\times 10^{7}\, E^2A/(e^{E/T}-1)

where N(E) is the photon spectrum in units of
:math:`10^{44}` photons/s/keV and :math:`A` the emitting area in
:math:`10^{16}` :math:`\mathrm{m}^2`.

The parameters of the model are:

| ``norm`` : Normalisation :math:`A` (the emitting area, in units of
  :math:`10^{16}` :math:`\mathrm{m}^2`. Default value: 1.
| ``t`` : The temperature :math:`T` in keV. Default value: 1 keV.

*Recommended citation:* `Kirchhoff (1860) <https://doi.org/10.1002/andp.18601850205>`_.
