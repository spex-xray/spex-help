.. _sect:nei:

Neij: non-equilibrium ionisation jump model
===========================================

This model calculates the spectrum of a plasma in non-equilibrium
ionisation (NEI). For more details about NEI calculations, see
:ref:`sect:neijtheory`.

The present model calculates the spectrum of a collisional ionisation
equilibrium (CIE) plasma with uniform electron density
:math:`n_{\mathrm e}` and temperature :math:`T_1`, that is
instantaneously heated or cooled to a temperature :math:`T_2`. It then
calculates the ionisation state and spectrum after a time :math:`t`.
Obviously, if :math:`t` becomes large the plasma tends to an equilibrium
plasma again at temperature :math:`T_2`.

The ionisation history can be traced by defining an ionisation
parameter,

.. math:: u \equiv \int n_{\mathrm e} {\mathrm d}t

with :math:`u=0` defined at the start of the shock.

By default the model describes a classical NEI condition with a flat
temperature profile:

.. math::

   \begin{aligned}
   u<0&:& \ \ \ T = T_1,\\
   u>0&:& \ \ \ T = T_2.\end{aligned}

For the case the user wands to calculate more complex situations, SPEX
offers two modes to treat a temperature profile :math:`T(u)`: analytic
expression (mode 1) or ascii-file input (mode 2).

The temperature profile in mode=1 (analytic case) is given by

.. math::

   \begin{aligned}
   u<0&:& \ \ \ T = T_1,\\
   0<u<U&:& \ \ \ T = T_2,\\
   U<u<U+dU&:& \ \ \ T = T(u).\end{aligned}

By setting a non-zero value for :math:`dU`, this model offers the
opportunity to calculate more complex evolution in the last epoch
(:math:`U<u<U+dU`); e.g. with secondary heating/cooling process and/or
change in density. We introduce parameters :math:`\alpha` and
:math:`\beta`, which describe a power-law like evolution respectively
for temperature and density of the plasma after the “break” of constancy
at time :math:`t_{\rm br}`:

.. math::
   \begin{aligned}
   T(t) &=& T_2~(t/t_{\mathrm br})^{\alpha} \\
   n_{\mathrm e}(t) &=& n_{\mathrm e}~(t/t_{\mathrm br})^{\beta}, \end{aligned}
   :label: tevo

An immediate application of this break feature would be a recombining
plasma due to rarefaction (adiabatic expansion). Such a condition can be
realised with :math:`\alpha=-2` and :math:`\beta = -3`. Note that we
include the effect of the density change here in the NEI calculation for
the ion concentration, but of course the line emission is calculated at
the density prescribed by the parameter *ed* of the model, which
represents the true density at the epoch of emission of the spectrum.

.. figure:: neibreak.png
   :alt: The temperature profile with mode=1.
   :name: fig:neibreak
   :width: 12cm

   The temperature profile with mode=1.

To get the expression for :math:`T(u)`, we first calculate the increase
of the ionisation parameter after :math:`t=t_{\mathrm br}` as follows:

.. math::
   \begin{aligned}
   u-U &=& \int_{t_{\mathrm br}} n(t) dt = \int_{t_{\mathrm br}} n_{\mathrm e} (t/t_{\mathrm br})^{\beta} dt \\
   &=& n_{\mathrm e} t_{\mathrm br} ~\int_{1} (t/t_{\mathrm br})^{\beta} ~d(t/t_{\mathrm br}) \\
   &=& U / (\beta+1) \cdot [(t/t_{\mathrm br})^{\beta+1} - 1], \end{aligned}
   :label: tauevo

Then, by combining equations :eq:`tevo` and
:eq:`tauevo`, we obtain:

.. math::

   \begin{aligned}
   T(u) = T_2 \cdot [1 + (\beta+1) \cdot (u-U)/U]^{\alpha/(\beta+1)},\end{aligned}

and we get the final temperature at :math:`u=U+dU` to be

.. math::

   \begin{aligned}
   T_3 = T_2 \cdot [1 + (\beta+1) \cdot dU/U]^{\alpha/(\beta+1)}.\end{aligned}

It should be noted that, for fixed values of :math:`\alpha` and
:math:`\beta`, the temperature change after the break is determined by
the ratio :math:`dU/U` rather than :math:`dU` itself. The user can check
:math:`T_3` with the ``ascdump plas`` command (see  :ref:`sec:ascdump`)
and also the histories of :math:`u` and :math:`T(u)` with the
``ascdump nei`` command (see :ref:`sec:ascdump`).

In some rare cases with a large negative :math:`\beta`, :math:`T_3` can
get an unphysical value (:math:`T_3 < 0`). In such a case the
calculation will automatically be stopped at a lower-limit of
:math:`T(u) = 10^{-4}` keV.

For mode 2, the user may enter an ascii-file with :math:`u`- and
:math:`T`-values. The format of this file is as follows: the first line
contains the number of data pairs (:math:`u`, :math:`T`). The next lines
contain the values of :math:`u` (in the SPEX units of
:math:`10^{20}` s :math:`\mathrm{m}^{-3}`) and :math:`T` (in keV). Note that
:math:`u_1=0` is a requirement, all :math:`T_i` should be positive, and
the array of :math:`u`-values should be in ascending order. The pairs
(:math:`u`, :math:`T`) determine the ionisation history, starting from
:math:`T=T_1` (the pre-shock temperature), and the final (radiation)
temperature is the temperature of the last bin.

The parameters of the model are:

| ``t1`` : Temperature :math:`T_1`
  before the sudden change in temperature, in keV. Default: 0.002 keV.
| ``t2`` : Temperature :math:`T_2` after the sudden change in
  temperature, in keV. Default: 1 keV.
| ``u`` : Ionization parameter :math:`U=n_{\mathrm e}t` before the
  “break”, in :math:`10^{20}` m\ :math:`^{-3}` s. Default:
  :math:`10^{-4}`.
| ``du`` : Ionization parameter :math:`dU` after the “break” in
  :math:`10^{20}` :math:`\mathrm{m}^{-3}` s. Default value is 0 (no break).
| ``alfa`` : Slope :math:`\alpha` of the :math:`T(t)` curve after the
  “break”. Default value is 0 (constant :math:`T`).
| ``beta`` : Slope :math:`\beta` of the :math:`n(t)` curve after the
  “break”. Default value is 0 (constant :math:`n`).
| ``mode`` : Mode of the model. Mode=1: analytical case; mode=2:
  :math:`T(u)` read from a file. In the latter case, also the parameter
  ``hisu`` needs to be specified.
| ``hisu`` : Filename with the :math:`T(u)` values. Only used when
  mode=2.

The following parameters are the same as for the cie-model (:ref:`sect:cie`):

| ``ed`` : Electron density in :math:`10^{20}` :math:`\mathrm{m}^{-3}`
| ``it`` : Ion temperature in keV
| ``vrms`` : RMS Velocity broadening in km/s (see :ref:`sect:turbulence`)
| ``ref`` : Reference element
| ``01...30`` : Abundances of H to Zn
| ``file`` : Filename for the nonthermal electron distribution

*Recommended citation:* `Kaastra & Jansen (1993)
<https://ui.adsabs.harvard.edu/abs/1993A%26AS...97..873K/abstract>`_.
