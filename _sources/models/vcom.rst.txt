Vcom: Compton shoulder broadening model
=======================================

This multiplicative model broadens an arbitrary additive component with
a Compton shoulder.

The profile shape is given by :math:`(1+x^2)(1+ax)`

Here :math:`x` is a dimensionless parameter between -2 and 0.
A value of -1 corresponds to an energy offset of E/mc^2 with E the energy
of the original photon.

The parameter :math:`a` is introduced to allow some empirical skewness of 
the line profile. 

The profile can be scaled in the energy direction by :math:`s`. For truly 
Compton scattering, this parameter should be kept to 1, otherwise it is
not physical. However, if the user wants to mimic a double-horned profile
(without the physics of Compton scattering), they may use this parameter
for scaling.


:math:`v`. Therefore if a delta-line at energy :math:`E` is convolved
with this component, its full energy width will be :math:`2Ev/c`, and
line photons get a rectangular distribution between :math:`E-Ev/c` and
:math:`E+Ev/c`. Of course, any line or continuum emission component can
be convolved with the this broadening model.

The parameters of the model are:

| ``s`` : Scaling of the profile in energy space :math:`s`, dimensionless. Default
  value: 1.

| ``a`` : Skewness parameter :math:`a`, dimensionless. Default
  value: 0.

