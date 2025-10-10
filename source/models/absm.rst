.. _sect:absm:

Absm: Morrison & McCammon absorption model
==========================================

This model calculates the transmission of neutral gas with cosmic
abundances as published first by `Morrison & McCammon (1983)
<https://ui.adsabs.harvard.edu/abs/1983ApJ...270..119M/abstract>`_. It
is a widely used model. The following is useful to know when this model
is applied:

#. The location of the absorption edges is not always fully correct;
   this can be seen with high resolution grating spectra

#. The model fails in the optical/UV band (i.e., it does not become
   transparent in the optical)

#. No absorption lines are taken into account

#. The abundances cannot be adjusted

If all the above is of no concern (as is the case in many situations),
then the Morrison & McCammon model is very useful. In case higher
precision or more detail is needed, the user is advised to use the :ref:`sect:hot`
model with low temperature in SPEX, which gives the transmission of a
slab in collisional ionisation equilibrium.

The parameters of the model are:

:nh: Hydrogen column density in :math:`10^{28}` :math:`\mathrm{m}^{-2}`.
  Default value: :math:`10^{-4}` (corresponding to :math:`10^{24}` 
  :math:`\mathrm{m}^{-2}`, a typical value at low Galactic latitudes).
:icov: Type of the covering fraction. Default value: 2 (constant,
  set by *fcov*). If icov=1, full covering is applied. If icov=3, covering fraction follows a
  tangent function that increases with energy. If icov=4, covering fraction follows an inverse
  tangent function that decreases with energy. See description in ``pion``.
:fcov: The covering factor of the absorber if icov=2. Default value: 1 (full
  covering). If icov=3 or 4, it sets the covering factor at the high energy end.
:lcov: The covering factor of the absorber at the low energy end. Default value: 1.
  lcov is applied only when icov=3 or 4. See description in ``pion``.
:ecov: The energy when the covering factor changes from lcov to fcov. Only applied if icov=3 or 4.
:acov: The width of the transit on covering factor. Only applied if icov=3 or 4.


*Recommended citation:* `Morrison & McCammon (1983) <https://ui.adsabs.harvard.edu/abs/1983ApJ...270..119M/abstract>`_.
