Knak: segmented power law transmission model
============================================

The knak model is used to model the transmission of any spectrum using a
set of contiguous segments with a power-law transmission at each
segment.

This component can be useful for new instruments, in order to test large
scale calibration errors (effective area errors for example), but other
applications can also be made, of course. For example, if the spectrum
of the source has an unknown continuum shape with a superimposed
absorption model, it is a good trick to model the continuum by a power
law, modify that by a knak model with adjustable or fixed transmission
at some relevant energies, and then apply the absorption. An example of
this last application can be found in :raw-latex:`\citet{porquet2004}`.

The Transmission is given by:

.. math:: T(E) = c_iE^{\displaystyle{a_i}}\qquad {\mbox{if $E_i<E<E_{i+1}$}}

for each value of :math:`i` between 0 and :math:`n`, the number of grid
points. The transmission is 1 for :math:`E<E_1` and :math:`E>E_2`.
Further, instead of using the constants :math:`c_i` and :math:`a_i`, we
use instead the values of the transmission at :math:`E_i`, i.e.
:math:`T_i \equiv T(E_i) = c_i E_i^{\displaystyle{a_i}}`. This allows
for a continuous connection between neighbouring segments.

Finally, for historical reasons we use here a wavelength grid instead of
an energy grid; the corresponding nodes :math:`\lambda_i` should
therefore be in strictly increasing order.

**Warning:** *When applying this model, take care that at least one of
the :math:`n` transmission values is kept fixed (otherwise you may run
the risk that your model is unconstrained, for example if the
normalisation of the continuum is also a free parameter).*

The parameters of the model are:

| ``n`` : The number of grid points. Maximum value is 9.
| ``w1`` : Wavelength :math:`\lambda_1` (Å) of the first grid point
| ``f1`` : Transmission :math:`T(\lambda_1)` at :math:`\lambda_1`.
| ``w2`` : Wavelength :math:`\lambda_2` (Å) of the second grid point
| ``f1`` : Transmission :math:`T(\lambda_2)` at :math:`\lambda_2`.
| ```` : :math:`\ldots`
| ``w9`` : Wavelength :math:`\lambda_9` (Å) of the last grid point
| ``f9`` : Transmission :math:`T(\lambda_9)` at :math:`\lambda_9`.
| Note that if :math:`n<9`, the values of :math:`T_i` and
  :math:`\lambda_i` will be ignored for :math:`i>n`.

*Recommended citation:* :raw-latex:`\citet{porquet2004}`.
