Mbb: modified blackbody model
=============================

This model describes the spectrum of a blackbody mdified by coherent
Compton scattering. This is in several instances a much better
description than a simple blackbody (for example accretion disk spectra
of AGN). The physical background is described for example by
:raw-latex:`\citet{rybicki1986}`, pages 218–219. The formulae that we
use here with a derivation are given by
:raw-latex:`\citet{kaastra1989}`. From that work we derive the spectrum
(:math:`10^{44}` photons/s/keV):

.. math:: N(E) = 1358. {A E^{0.25}\over e^{E/T} (e^{E/T}-1)}

where :math:`E` is the photon energy in keV, :math:`T` the temperature
in keV and :math:`A` the normalisation in units of
:math:`10^{26}` m:math:`^{0.5}`, defined by

.. math:: A = n_{\rm e}^{0.5}O

with :math:`n_{\rm e}` the electron density (units:
:math:`10^{20}` m:math:`^{-3}`) and :math:`O` the emitting source area
(units: :math:`10^{16}` m).

The parameters of the model are:

| ``norm`` : Normalisation :math:`A` (in units of
  :math:`10^{26}` m:math:`^{0.5}`). Default value: 1.
| ``t`` : The temperature :math:`T` in keV. Default value: 1 keV.
| *Recommended citation:* :raw-latex:`\citet{kaastra1989}` and
  :raw-latex:`\citet{rybicki1986}`.
