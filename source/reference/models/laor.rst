Laor: relativistic line broadening model
========================================

This multiplicative model broadens an arbitrary additive component with
a relativistic line profile. The relativistic line profile is
interpolated from tables produced by :raw-latex:`\citet{laor1991}`. In
his model, the line transfer function is determined for emission from
the equatorial plane around a Kerr black hole, assuming an emissivity
law :math:`I(\cos\theta) \sim 1. +
2.06\cos\theta`. The transfer function is calculated at a grid of 35
radii (:math:`r_n = 1600 / (n+1)^2` for :math:`n=1,\ldots,35`, in units
of :math:`GM/c^2`), 31 inclinations uniformly spaced in :math:`\cos i`,
and 300 frequencies, logarithmically spaced between 0.1 and 5 times the
emission frequency, respectively.

Using these numbers, a radial integration is done using an emissivity
law

.. math:: I(r) \sim 1 / (r^2 + h^2)^{q/2},

where :math:`h` is a characteristic scale height and :math:`q` an
asymptotic power law index (for large :math:`r`,
:math:`I(r)\sim r^{-q}`). The integration is done between an inner
radius :math:`r_1` and an outer radius :math:`r_2`. Given the radial
grid that is provided in Laor’s data, the outer radius extends out to at
most :math:`400GM/c^2`.

**Warning:** *Of course, any line or continuum emission component can be
convolved with the this broadening model; for continuum components the
computational time may be very large, however, due to the convolution
involved.*

**Warning:** *The outer radius cannot be larger than :math:`400GM/c^2`*

The parameters of the model are:

| ``r1`` : Inner radius of the disk, in units of :math:`GM/c^2`. The
  minimum allowed value is 1.234 (for a maximally rotating Kerr black
  hole). For a Schwarzschild black hole, one should take
  :math:`r_i = 6`. Default value: 1.234.
| ``r2`` : Outer radius of the disk, in units of :math:`GM/c^2`. Keep
  this radius less than 400 (default value)
| ``q`` : Emissivity slope :math:`q` as described above. Default value:
  2.
| ``h`` : Emissivity scale height. Default value: 0.
| ``i`` : Inclination angle (in degrees) of the disk (angle between line
  of sight and the rotation axis of the disk). Default value: 45
  degrees.
| *Recommended citation:* :raw-latex:`\citet{laor1991}`.
