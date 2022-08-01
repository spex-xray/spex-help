.. _sect:reds:

Reds: redshift model
====================

This multiplicative model applies a redshift :math:`z` to an arbitrary
additive component. If a photon is emitted at energy :math:`E`, the
redshift model will put it at energy :math:`(1+z)E`. In addition, a time
dilatation correction is applied such that the spectrum :math:`S(E)`
(expressed as photons/s per bin) is divided by :math:`1+z`.

However, it is necessary to distinguish two different cases:

Case 1 (flag=0): In this case, the time dilatation correction described 
above is applied to the spectrum, which makes this the (default) option
to be used for cosmological redshifts.

Case 2 (flag=1): By setting this flag, the time dilatation correction 
to the flux is not applied. This is used for a redshift caused by motion 
away from us. It should be used for any velocity fields other than the 
Hubble flow. Make sure that you limit z to a range -1<z<1 to remain within
physical limits.

.. Warning:: Note that this component should be used in tandem with the
   distance command (:ref:`sec:distance`) to
   take into account the cosmological redshift and its influence on the
   flux completely.


The parameters of the model are:

| ``z`` : Redshift :math:`z`. Default value: 0. Dimensionless. Redshifts are 
  positive, blueshifts negative.
| ``flag`` : Flag: 0 (cosmological redshift) or 1 (velocity redshift).
  Default value: 0.
