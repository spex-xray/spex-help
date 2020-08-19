.. _sect:cie:

Cie: collisional ionisation equilibrium model
=============================================

This model calculates the spectrum of a plasma in collisional ionisation
equilibrium (CIE). It consists essentially of two steps, first a
calculation of the ionisation balance and then the calculation of the
X-ray spectrum. The basis for this model is formed by the mekal model,
but several updates have been included (see :ref:`chap:plasmamodel`).

Temperatures
------------

Some remarks should be made about the temperatures. SPEX knows three
temperatures that are used for this model.

First there is the electron temperature :math:`T_{\mathrm e}`. This is
usually referred to as "the" temperature of the plasma. It determines
the continuum shape and line emissivities and the resulting spectrum is
most sensitive to this.

Secondly, there is the ion temperature :math:`T_{\mathrm i}`. This is
only important for determining the line broadening, since this depends
upon the thermal velocity of the ions (which is determined both by
:math:`T_{\mathrm i}` and the atomic mass of the ion). Only in high
resolution spectra the effects of the ion temperature can be seen.

Finally, we have introduced here the ionization balance temperature
:math:`T_{\mathrm b}` that is used in the determination of the ionization equilibrium. It
is the temperature that goes into the calculation of ionization and
recombination coefficients. In equilibrium plasmas, the ratio
:math:`R_{\mathrm b} \equiv
T_{\mathrm b} / T_{\mathrm e}` is 1 by definition. It is unphysical to
have :math:`R_{\mathrm b}` not equal to 1. Nevertheless we allow for the
possibility of different values of :math:`R_{\mathrm b}`, in order to
mimick out of equilibrium plasmas. For :math:`R_{\mathrm b}<1`, we have
an ionizing plasma, for :math:`R_{\mathrm b}>1` a recombining plasma.
Note that for ionizing plasmas SPEX has also the ``nei`` model
(:ref:`sect:nei`), which takes into account explicitly the effects of
transient (time dependent) ionization.

It is also possible to mimic the effects of non-isothermality in a
simple way. SPEX allows for a Gaussian emission measure distribution:

.. math:: Y(x) = \frac{Y_0}{\sqrt{2\pi} \sigma_T} e^{\displaystyle{-(x-x0)^2/2\sigma_T^2}}

where :math:`Y_0` is the total, integrated emission measure. By default
:math:`x\equiv \log T` and :math:`x_0\equiv \log T_0` with :math:`T_0`
the average temperature of the plasma (this is entered at the "T" value
in SPEX). However, this can be changed to :math:`x\equiv T` and
:math:`x_0\equiv T_0` by setting logt to 0. If the parameter ``sup`` is set
:math:`> 10^{-5}`, then the Gaussian emission measure distribution model
becomes asymmetric. The ``sig`` parameter determines the slope of the
low-temperature part of the Gaussian and sup determines the
high-temperature side. Usually (default) :math:`\sigma_T = 0` and in
that case the normal isothermal spectrum is chosen. Note that for larger
values of :math:`\sigma_T` the cpu time may become larger due to the
fact that the code has to evaluate many isothermal spectra.

Line broadening
---------------

Apart from line broadening due to the thermal velocity of the ions
(caused by :math:`T_{\mathrm i} > 0`) it is also possible to get line
broadening due to (micro)turbulence. Since SPEX version 3.06, we use
the RMS velocity broadening in km/s in our models. For more information
about this change see: :ref:`sect:turbulence`.

Density effects
---------------

It is also possible to vary the electron density :math:`n_{\mathrm e}`
of the plasma. This does not affect the overall shape of the spectrum
(i.e., by changing :math:`n_{\mathrm e}` only SPEX still uses the
previous value of the emission measure
:math:`Y \equiv n_{\mathrm H} n_{\mathrm e} V`), but spectral lines that
are sensitive to the electron density will get different intensities.
Usually this occurs for higher densities, for example under typical ISM
conditions (:math:`n_{\mathrm e}` = 1 cm\ :math:`^{-3}`) this is not an
important effect.

Non-thermal electron distributions
----------------------------------

The effects of non-thermal electron distribution on the spectrum can be
included. See :ref:`sec:nonthermal` for more details.

Abundances
----------

The abundances are given in Solar units. Which set of solar units is
being used can be set using the ``abun`` command (:ref:`sec:abundance`).
For spectral fitting purposes it is important to distinguish two situations.

In the first case there is a strong thermal continuum. Since in most
circumstances the continuum is determined mainly by hydrogen and helium,
and the X-ray lines are due to the other elements, the line to continuum
ratio is a direct measurement of the metal abundances compared to H/He.
In this situation, it is most natural to have the hydrogen abundance
fixed and allow only for fitting of the other abundances (as well as the
emission measure).

In the other case the thermal continuum is weak, but there are strong
spectral lines. Measuring for example the Fe abundance will give large
formal error bars, not because the iron lines are weak but because the
continuum is weak. Therefore, all abundances will get rather large error
bars, and despite the fact of strong O and Fe lines, the formal error
bars on the O/Fe ratio becomes large. This can be avoided by choosing
another reference element, preferentially the one with the strongest
lines (for example Fe). Then the O/Fe ratio will be well constrained,
and it is now only the H abundance relative to Fe that is poorly
constrained. In this case it is important to keep the nominal abundance
of the reference element to unity. Also keep in mind that in general we
write for the normalisation :math:`n_{\mathrm e}n_{\mathrm X}V` in this
case; when the reference element is H, you mays substitute X=H; however
when it is another element, like O, the normalisation is still the
product of :math:`n_{\mathrm e}n_{\mathrm X}V` where X stands for the
fictitious hydrogen density derived from the solar O/H ratio.

Example
"""""""

Suppose the Solar O abundance is 1E-3 (i.e. there is 0.001
oxygen atom per hydrogen atom in the Sun). Take the reference atom
oxygen (:math:`Z=8`). Fix the oxygen abundance to 1. Fit your spectrum
with a free hydrogen abundance. Suppose the outcome of this fit is a
hydrogen abundance of 0.2 and an emission measure 3 (in SPEX units).
This means :math:`n_{\mathrm e}n_{\mathrm X}V` = :math:`3\times 10^{64}`
:math:`\mathrm{m}^{-3}`. Then the "true" emission measure
:math:`n_{\mathrm e}n_{\mathrm H}V` = :math:`0.2 \times 3\times 10^{64}`
:math:`\mathrm{m}^{-3}`.
The nominal oxygen emission measure is
:math:`n_{\mathrm e}n_{\mathrm O}V` = :math:`0.001 \times 3\times
10^{64}` :math:`\mathrm{m}^{-3}`, and nominally oxygen would have 5 times
overabundance as compared to hydrogen, in terms of solar ratios.

Parameter description
---------------------

.. Warning:: When you make the temperature too low such that the plasma
   becomes completely neutral, the model will crash. This is because in
   that case the electron density becomes zero, and the emission measure is
   undefined. The nominal temperature limits that are implemented in
   SPEX usually avoid that condition, but the results may depend somewhat
   upon the metallicity because of the charge exchange processes in the
   ionisation balance.

.. Warning:: In high resolution spectra, do not forget to couple the
   ion temperature to the electron temperature, as otherwise the ion
   temperature might keep its default value of 1 keV during spectral
   fitting and the line widths may be wrong.

.. Warning:: Some people use instead of the emission measure
   :math:`Y \equiv n_{\mathrm H} n_{\mathrm e} V`, the quantity
   :math:`Y^\prime = n_{\mathrm e}^2 V` as
   normalisation. This use should be avoided as the emission is
   proportional to the product of electron and ion densities, and therefore
   use of :math:`Y^\prime` makes the spectrum to depend nonlinear on the
   elemental abundances (since an increase in abundances also affects the
   :math:`n_{\mathrm e} / n_{\mathrm H}` ratio).

.. Warning:: The default line broadening is just Doppler broadening.
   This is fine and self-consistent for the ‘old’ line calculation. To
   incorporate the natural line broadening for the ‘new’ calculations, the
   user must use the ``var dopp 4`` option to get Voigt profiles. This is
   physically better but takes more computation time.

The parameters of the model are:

| ``norm`` : the normalisation, which is the emission measure
  :math:`Y \equiv n_{\mathrm H} n_{\mathrm e} V` in units of
  :math:`10^{64}` :math:`\mathrm{m}^{-3}`, where
  :math:`n_{\mathrm e}` and :math:`n_{\mathrm H}` are the electron and
  Hydrogen densities and :math:`V` the volume of the source. Default
  value: 1.
| ``t`` : the electron temperature :math:`T_{\mathrm e}` in keV. Default
  value: 1.
| ``sig`` : the width :math:`\sigma_T` of the gaussian emission measure
  profile. Default value: 0. (no temperature distribution i.e.
  isothermal)
| ``sup`` : the width :math:`\sigma_T` of the high-temperature part of
  the gaussian emission measure profile. If larger than :math:`10^{-5}`
  keV, the sig parameter becomes the sigma value for the low-temperature
  end. Default value: 0
| ``logt`` : Switch between linear and logarithmic temperature scale for
  the gaussian emission measure profile. Default value: 1 (logarithmic)
| ``hden`` : the Hydrogen density :math:`n_{\mathrm e}` in units of
  :math:`10^{20}` :math:`\mathrm{m}^{-3}` (or :math:`10^{14}` :math:`\mathrm{cm}^{-3}`).
  Default value: :math:`10^{-14}`, i.e. typical ISM conditions, or the
  low density limit.
| ``it`` : the ion temperature :math:`T_{\mathrm i}` in keV. Default
  value: 1
| ``rt`` : the ratio of ionization balance to electron temperature,
  :math:`R_{\mathrm b} = T_{\mathrm b} / T_{\mathrm e}` in keV. Default
  value: 1.
| ``vrms`` : RMS Velocity broadening in km/s (see :ref:`sect:turbulence`)
| ``ref`` : reference element. Default value 1 (hydrogen). See above for
  more details. The value corresponds to the atomic number of the
  reference element.
| ``01`` : Abundance of hydrogen (H, Z=1) in Solar units. Default 1.
| ``02`` : Abundance of helium (He, Z=2) in Solar units. Default 1.
| :math:`\ldots` ``30`` : Abundance of zinc (Zn, Z=30) in Solar units.
  Default 1.
| ``file`` : Filename for the non-thermal electron distribution. If not
  present, non-thermal effects are not taken into account (default).

*Recommended citation:* `Kaastra et al. (1996) <https://ui.adsabs.harvard.edu/abs/1996uxsa.conf..411K/abstract>`_.
