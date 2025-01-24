Dust: dust scattering model
===========================

This model calculates the effective transmission of dust that scatters
photons out of the line of sight. No re-emission is taken into account,
i.e. it is assumed that all scattered photons are lost from the line of
sight. This makes the model useful for instruments with a high spatial
resolution (i.e, the spatial resolution is much better than the typical
size of the dust scattering halo).

Dust scattering is described for example by `Draine et al. (2003)
<https://ui.adsabs.harvard.edu/abs/2003ApJ...598.1026D/abstract>`_
In that paper, a link is given to the
`website of Draine <https://www.astro.princeton.edu/~draine/dust/dustmix.html>`_.
This website contains slightly updated cross sections for three cases as listed
below. The scattering is computed for a Carbonaceous - Silicate Model
for Interstellar Dust. The cases are:

#. set=1: for :math:`R_V=3.1`;

#. set=2: for :math:`R_V=4.0`;

#. set=3: for :math:`R_V=5.5`.

.. warning:: For any instrument where the extraction region has a size
   comparable to the size of the dust scattering halo, this model should
   not be used, as the scattered X-rays will fall within the extraction
   region. Take care when fitting data from different instruments
   simultaneously.

.. Warning:: This model only calculates the dust scattering, not the
   dust absorption.

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
| ``set`` : The set of cross sections being used. See table above.

*Recommended citation:* `Draine et al. (2003)
<https://ui.adsabs.harvard.edu/abs/2003ApJ...598.1026D/abstract>`_.
