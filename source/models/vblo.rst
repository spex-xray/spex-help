Vblo: rectangular velocity broadening model
===========================================

This multiplicative model broadens an arbitrary additive component with
a rectangular Doppler profile, characterized by the half-width
:math:`v`. Therefore if a delta-line at energy :math:`E` is convolved
with this component, its full energy width will be :math:`2Ev/c`, and
line photons get a rectangular distribution between :math:`E-Ev/c` and
:math:`E+Ev/c`. Of course, any line or continuum emission component can
be convolved with the this broadening model.

The parameters of the model are:

| ``vblo`` : Velocity broadening half-width :math:`v`, in km/s. Default
  value: 3000 km/s.
