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

| ``nh`` : Hydrogen column density in :math:`10^{28}` :math:`\mathrm{m}^{-2}`.
  Default value: :math:`10^{-4}` (corresponding to
  :math:`10^{24}` :math:`\mathrm{m}^{-2}`, a typical value at low Galactic
  latitudes).
|  ``icov`` : The shape type of the covering factor. Default value 2 (constant). See :ref:`sect:abs_models` for details.
|  ``fcov`` : The covering factor (at high energy) of the absorber. Default value: 1 (full covering)
|  ``lcov`` : The covering factor (at low energy) of the absorber. Default value: 1 (full
  covering)
|  ``ecov`` : The energy parameter of the transition from low-energy to high-energy covering factor (keV). Default value: 1 (full
  covering)
|  ``acov`` : The width parameter of the covering factor transition from low to high energies. Default value: 1

*Recommended citation:* `Morrison & McCammon (1983) <https://ui.adsabs.harvard.edu/abs/1983ApJ...270..119M/abstract>`_.
