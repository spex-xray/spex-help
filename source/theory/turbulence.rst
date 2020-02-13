.. _sect:turbulence:

Definition of the micro-turbulent velocity in SPEX
==================================================

As of SPEX version 3.06.00, we are using a different definition of velocity broadening
for emission models. Regarding parameter name, we moved from :math:`V_{mic}`, or
micro-turbulent velocity, to root-mean-square velocity :math:`V_{rms}`. The two
definitions are related to each other as follows:

:math:`V_{mic} = \sqrt{2} V_{rms}`

.. Warning:: The change of definition means that the :math:`V_{rms}` that you measure
  with SPEX 3.06 will be a factor of :math:`\sqrt(2)` smaller than the :math:`V_{mic}`
  that you previously measured with earlier SPEX versions.

Why change the definition?
--------------------------

The :math:`V_{rms}` is defined such that it is equivalent to the Gaussian :math:`\sigma`,
which makes it a more intuitive quantity for most colleagues in the field. This new
definition makes the emission models consistent with the velocity broadening parameters
in the SPEX absorption models. In addition, this definition is also used by the APEC
code in XSPEC. To avoid confusion when results from the two codes are compared, we
decided to change the :math:`V_{mic}` parameter to :math:`V_{rms}`.

Microturbulent velocity in SPEX versions <=3.05.00
--------------------------------------------------

In previous versions of SPEX before 3.06.00 the turbulent velocity was called ``vmic``.
The micro-turbulent velocity (:math:`V_{mic}`) was defined following a definition
historically used often in spectroscopy. In this definition, the Doppler broadening
(:math:`\Delta E_D`) is defined as:

:math:`\Delta E_D = \frac{E_0}{c} \sqrt{\left( \frac{2 k T_{ion}}{A m_p} + V_{mic}^2 \right)}`

As is shown in `Zhuravleva et al. (2012; Section 7.2, Eq. 24) <https://ui.adsabs.harvard.edu/abs/2012MNRAS.422.2712Z/abstract>`_,
this relation can be written also in terms of Gaussian :math:`\sigma`:

:math:`\Delta E_D = \frac{E_0}{c} \sqrt{2( \sigma_{therm}^2 + \sigma_{turb}^2)}`,

where :math:`\sigma_{therm} = \sqrt{\frac{kT}{A m_p}}` is the thermal line broadening.
From these equations, it is easy to see that :math:`V_{mic} = \sqrt{2} \sigma_{turb}`,
where we call :math:`\sigma_{turb}` the root-mean square (RMS) of the line-of-sight
velocity (called `vrms` in the current SPEX version).

Historic note
-------------

The definition :math:`V_{mic} = \sqrt{2} \sigma_{turb}` historically originates from
spectroscopy. It was chosen because it made the Maxwellian function and Gaussian function
easier to calculate. It may also be related to the definition of the error function (ERF),
in which the width is also a factor :math:`\sqrt{2}` different from the Gaussian :math:`\sigma`.
Still, SPEX internally calculates the line broadening using the error function which uses the
:math:`V_{mic}` definition, but the number that is reported changed to :math:`V_{rms}`.

In the early days of MEKAL and SPEX (from the '70s onward), this :math:`V_{mic}`
definition was probably chosen to speed up the calculations. This definition is still
used often in theoretical work, so be prepared to convert your measured :math:`V_{rms}`
to :math:`\Delta E_D` or :math:`V_{mic}` if you want to do a meaningful comparison.



