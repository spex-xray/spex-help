Reds: redshift model
====================

This multiplicative model applies a redshift :math:`z` to an arbitrary
additive component. If a photon is emitted at energy :math:`E`, the
redshift model will put it at energy :math:`(1+z)E`. In addition, a time
dilatation correction is applied such that the spectrum :math:`S(E)`
(expressed as photons/s per bin) is divided by :math:`1+z`.

However, it is necessary to distinguish two different cases:

case 1 (flag=0): the redshift component can be used to calculate the
effects of the cosmological redshift. The cosmological redshift has the
effect of the energy shift and the time dilatation as outlined above.
Therefore, the above procedure is essentially correct and this is what
was used in older versions of SPEX (before version 2.00.10). However,
what was overlooked there is that in the determination of the finally
observed spectrum/flux as seen on Earth, a division by :math:`4\pi d^2`
is necessary. For this distance :math:`d`, we took the luminosity
distance. However, the factors :math:`(1+z)^2` are absorbed into the
definition of the luminosity distance. Therefore, in the older versions
all fluxes were too small by a factor of :math:`(1+z)^2`. Since we want
to retain the luminosity distance as the natural distance measure for
spectra, it appears necessary to multiply the spectrum as calculated by
the original subroutine by a factor of :math:`(1+z)^2`. But in the other
case (redshifts caused by the motion of a source at any distance), this
re-correction should not be done, reason why we introduce the other
option. *in summary, for redshift components corresponding to
cosmological redshifts, the option flag=0 (default) must be used*.

case 2 (flag=1): this is the old case for a source with a redshift
caused by motion away from us. It should be used for any velocity fields
other than the Hubble flow.

**Warning:** *Note that this component should be used in tandem with the
distance command (Section *\ `[sec:distance] <#sec:distance>`__\ *) to
take into account the cosmological redshift and its influence on the
flux completely.*

The parameters of the model are:

| ``z`` : Redshift :math:`z`. Default value: 0.
| ``flag`` : Flag: 0 (cosmological redshift) or 1 (velocity redshift).
  Default value: 0.
