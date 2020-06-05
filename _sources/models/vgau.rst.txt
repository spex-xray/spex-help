.. _sec:vgau:

Vgau: gaussian velocity broadening model
========================================

This multiplicative model broadens an arbitrary additive component with
a Gaussian Doppler profile, characterized by the Gaussian
:math:`\sigma`. The broadening kernel is therefore proportional to
:math:`e^{\displaystyle{-(c^2/2\sigma^2)(E-E_0)^2/E_0^2}}`.

The parameters of the model are:

| ``sig`` : Gaussian velocity broadening :math:`\sigma`, in km/s.
  Default value: 1 km/s
