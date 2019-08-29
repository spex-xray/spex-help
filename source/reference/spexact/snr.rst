Supernova remnant (SNR) models
==============================

For the calculation of SNR models we follow `Kaastra & Jansen (1993)
<https://ui.adsabs.harvard.edu/abs/1993A%26AS...97..873K/abstract>`_.
But also here we make some modifications in the implementation.

The X-ray spectrum of a SNR is characterised in lowest order by its
average temperature :math:`T`, ionisation parameter :math:`U` and
emission measure :math:`Y`. If one calculates a specific model however,
these average values are not known a priori. A relevant set of input
parameters could be the interstellar density, the shock radius and the
explosion energy. These are the parameters used by KJ. A disadvantage is
that this choice is not suitable for spectral fitting: changing one of
the parameters gives correlated changes in :math:`T`, :math:`U` and
:math:`Y`, which is an undesirable feature in spectral fitting. KJ
solved this by inputting a guess of :math:`T`, :math:`U`, and :math:`Y`
and using these guess parameters as the fitting parameters. After
fitting, the model had to be calculated another time in order to find
the relation between guessed and true parameters. here we take another
choice. We will select input parameters which scale with :math:`T`,
:math:`U` and :math:`Y` respectively but are connected to the SNR
parameters independent of the hydrodynamical model. The first parameter
is the shock temperature

.. math:: T_s,

the second the shock ionisation parameter defined by

.. math:: U_s\equiv n_{\mathrm e}t

where :math:`n_{\mathrm e}` is the electron density before the shock (for a
completely ionised gas), and :math:`t` the age of the remnant. Further
we define the shock reduced emission measure by

.. math:: Y_s\equiv n_{\mathrm e}n_{\mathrm H}r_s^3/d^2

where :math:`r_s` is the main shock radius, and :math:`d` the distance
to the source. We have introduced here also the electron density
:math:`n_e` instead of the more natural Hydrogen density, because this
allows an efficient use of the model for spectral fitting: if one fits a
spectrum with variable chemical abundances, then using the current
scaling we need to calculate (for a given :math:`T_s`, :math:`U_s` and
:math:`Y_s`) the relative ion concentrations only once; for other
abundances, the relative concentrations may be simply scaled without a
need to redo completely the ionisation balance calculations. Finally we
introduced the distance in the definition of :math:`Y_s` in order to
allow an easy comparison with spectra observed at earth. These 3 input
parameters :math:`T_s`, :math:`U_s` and :math:`Y_s` will serve as input
parameters for all hydrodynamical models. They are linked to other
parameters as follows:

.. math::
   f_{\mathrm p} kT_s = f_{\mathrm T} \epsilon_\rho m_{\mathrm p}r_s^2/t^2
   :label: snr:eqn4

where :math:`\epsilon_\rho` is a dimensionless factor representing the
average mass in units of a proton mass per Hydrogen atom (:math:`\rho =
\epsilon_\rho m_{\mathrm p}n_{\mathrm H}` with :math:`m_{\mathrm p}` the proton
mass), and :math:`f_{\mathrm p}` is another dimensionless factor,
representing the ratio of electron plus ion density over the Hydrogen
density. Further, :math:`f_{\mathrm T}` is a model-dependent dimensionless
scaling factor which is given by

.. math:: f_{\mathrm T} = \frac{f_v^2}{\eta - 1}

with :math:`f_v` the velocity scaling discussed below and :math:`\eta`
the density jump at the main shock front, which depends upon the
Hydrodynamical model. Another scaling law links the gas velocity to the
temperature:

.. math:: v_2 = f_v r_s/t

with :math:`v_2` the post-shock gas velocity (not to be confused with
the shock velocity!). The velocity scaling factor is given by

.. math:: f_v \equiv \frac{(n-3)(\eta - 1)}{(n-s) \eta}

with the understatement that for the Sedov and Solinger model one should
take formally the limit :math:`n=5`.

The explosion energy :math:`E_0` is linked to the other parameters by

.. math:: E_0 = \frac{\alpha r_s^5 \rho}{t^2},

where :math:`\alpha` is the dimensionless energy integral introduced by
Sedov. The value of :math:`\alpha` depends both upon the hydrodynamical
model and the value for :math:`s` and :math:`n`, the density gradient
scale heights of the interstellar medium and the stellar ejecta.

If we express :math:`T_s` in keV, :math:`U_s` in
:math:`10^{20}` :math:`\mathrm{m}^{-3}`\ s, :math:`Y_s` in
:math:`10^{20}` :math:`\mathrm{m}^{-5}`, :math:`r_s` in units of :math:`10^8` m,
:math:`n_{\mathrm H}` in :math:`10^{20}` :math:`\mathrm{m}^{-3}`, :math:`d` in units
of :math:`10^{22}` m and :math:`t` in s, we obtain from :eq:`snr:eqn4` the
value for the proton mass of :math:`m_{\mathrm p}` =
:math:`1.043969\times 10^5` :math:`\mathrm{keV}^2`\ (:math:`10^{16}` :math:`\mathrm{m}^{2}`)\ :math:`^{-1}`.
Using this value and defining
:math:`f_m = f_T\epsilon_\rho m_{\mathrm p}/f_{\mathrm p}`, the scaling laws for
SNRs may be written as

.. math:: n_{\mathrm e} = \frac{T_s^{1.5}U_s^3}{f_m^{1.5}Y_s d^2}

.. math:: t = \frac{f_m^{1.5}Y_s d^2 n_{\mathrm e}}{ T_s^{1.5}U_s^2 n_{\mathrm H}}

.. math:: r = \frac{f_mY_s d^2 n_{\mathrm e}}{U_s^2T_s n_{\mathrm H}}

.. math:: v = \frac{f_vT_s^{0.5}}{f_m^{0.5}}

.. math::

   E_0 = [1.6726231\times 10^{33}\ {\mathrm J}] \frac{\alpha \epsilon_\rho
   f_m^{0.5}Y_s^2d^4 n_{\mathrm e}}{U_s^3T_s^{0.5}n_{\mathrm H}}

.. math::

   M = [8.409\times 10^{-14}\ \mathrm{M_{\odot}} ] \frac{\epsilon_\rho \beta \eta
   f_m^{1.5}Y_s^2 d^4 n_{\mathrm e}}{ U_s^3T_s^{1.5} n_{\mathrm H}}

where :math:`M` is the mass integral, and :math:`\beta` is the
dimensionless mass integral (defined by
:math:`\beta = 4\pi\int \frac{\rho}{\rho_s}(\frac{r}{r_s})^2{\mathrm d}\frac{r}{r_s}`).
