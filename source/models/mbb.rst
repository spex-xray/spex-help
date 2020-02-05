Mbb: modified blackbody model
=============================

This model describes the spectrum of a blackbody mdified by coherent
Compton scattering. This is in several instances a much better
description than a simple blackbody (for example accretion disk spectra
of AGN). The physical background is described for example by
`Rybicki & Lightman (1986) <https://doi.org/10.1002/9783527618170>`_,
pages 218â€“219. The formulae that we use here with a derivation are given by
`Kaastra & Barr (1989) <https://ui.adsabs.harvard.edu/abs/1989A%26A...226...59K/abstract>`_.
From that work we derive the spectrum (:math:`10^{44}`Â photons/s/keV):

.. math:: N(E) = 1358. \frac{A E^{0.25} }{ e^{E/T} (e^{E/T}-1)}

where :math:`E` is the photon energy in keV, :math:`T` the temperature
in keV and :math:`A` the normalisation in units of
:math:`10^{26}`Â m\ :math:`^{0.5}`, defined by

.. math:: A = n_{\mathrm e}^{0.5}O

with :math:`n_{\mathrm e}` the electron density (units:
:math:`10^{20}`Â :math:`\mathrm{m}^{-3}`) and :math:`O` the emitting source area
(units: :math:`10^{16}` m).

The parameters of the model are:

| ``norm`` : Normalisation :math:`A` (in units of
  :math:`10^{26}` :math:`\mathrm{m}^{0.5}`). Default value: 1.
| ``t`` : The temperature :math:`T` in keV. Default value: 1 keV.

*Recommended citation:* `Kaastra & Barr (1989)
<https://ui.adsabs.harvard.edu/abs/1989A%26A...226...59K/abstract>`_ and
`Rybicki & Lightman (1986) <https://doi.org/10.1002/9783527618170>`_.
