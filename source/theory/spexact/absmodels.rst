.. _sect:absmodels:

Absorption model theory
=======================

Introduction
------------

In most astrophysical situations we have to take into account
absorption of photons between the emitting region and the observer.
Apart from a few standard models like the ones by `Morrison & McCammon
(1983) <https://ui.adsabs.harvard.edu/abs/1983ApJ...270..119M/abstract>`_
(our ``absm`` model) and `Rumph et al.
(1994) <https://ui.adsabs.harvard.edu/abs/1994AJ....107.2108R/abstract>`_
(our ``euve`` model) we have constructed our own absorption models based
upon the atomic database used by SPEX.

Essentially, we adopt a few steps, which will be described below. First,
we produce a set of column densities, in different ways for the diferent
absorption models (see :ref:`sect:abs_models`). Next, using a dynamical
model for the absorber we calculate its transmission (:ref:`sect:abs_transm`).
For these calculations, we use our atomic database as described
in :ref:`sect:abs_database`.

A basic assumption in all the absorption models is that there is no
re-emission, i.e. we look through an absorbing nmedium that has a very
small solid angle as seen from the X-ray source. This allows essentially
to calculate the transmission simply as :math:`e^{-\tau(E)}` with
:math:`\tau(E)` the optical depth.

.. _sect:thomson_scattering:

Thomson scattering
------------------

The above approach also allows us to include Thomson-scattering in the
transmission. Any source photon aimed at the observer but that suffers
from Thomson scattering is scattered out of the line of sight and hanec
in this approximation is not seen by the observer. We have included not
simply the Thomson cross-section :math:`\sigma_T` but have taken the
Klein-Nishina correction into account (see `Rybicki & Lightman 1986
<https://doi.org/10.1002/9783527618170>`__, eqn. 7.5 (exact expression)
and 7.6 (approximations)). The evaluation of the exact formula for the cross
section is non-trivial, as terms up to the third power in
:math:`x=E/m_{\mathrm e}c^2` cancel; we have extended the low-energy
polynomial approximation (7.6.a) of Rybicki & Lightman by comparing to
quadruple precision calculations using the exact formula, and made the
following approximation that has a relative accuracy of better than
:math:`3\times 10^{-4}` for all energies, when evaluated using single
precision arithmetics:

.. math::

   \sigma = \left\{
   {
   \begin{array}{ll}
   \sigma_T (1-2x+5.2x^2-13.3x^3+32.685x^4) & \qquad x < 0.05;\\
   0.75\sigma_T 
   \left[
   \frac{1+x}{x^3}
   \left\{
   \frac{2x(1+x)}{1+2x} - \ln (1+2x)
   \right\}
   + \frac{\ln (1+2x)}{2x} - \frac{1+3x}{(1+2x)^2}
   \right]
    & \qquad 0.05 < x < 5000;\\
   0.375\sigma_T (\ln(2x) + 0.5)/x & \qquad x>5000.
   \end{array} 
   } 
   \right.

.. _sect:covering factor:

Covering factor
---------------

Most users would be happy with a model where an absorbing medium covers the full emitting source.
However, there are situations where the background source is larger than the absorbing medium.
In that case the covering factor :math:`f<1`. This option has been implemented in older versions
of our software through the parameter ``fcov``.
However, there can be more complex situations. This occurs for example in active galactic nuclei,
where the X-ray continuum source may be smaller than the UV continuum source. In that case, for spectral
lines from the same ion, the covering factor of the X-ray absorption lines may be larger that the covering
factor of the UV lines. In order to model this situation, in the later versions (from 3.08.03 onwards)
we include the option of energy-dependent covering factors. Instead of the single parameter ``fcov`` we now
use five parameters, described below.

.. _sect:abs_models:

Different types of absorption models
------------------------------------

We have a set of spectral models available with different levels of
sophistication and applicability, that we list below.

Slab model
~~~~~~~~~~

The *slab* model calculates the transmission of a slab of material,
where all ionic column densities can be chosen independently. This has
the advantage that a spectrum can be fit without any knowledge of the
ionisation balance of the slab. After a spectral fit has been made, one
may try to explain the observed column densities by comparing the with
predictions from any model (as calculated by , Cloudy, XSTAR, ION or any
other existing (photo)ionization code).

Xabs model
~~~~~~~~~~

In the *xabs* model, the ionic column densities are not independent
quantities, but are linked through a set of runs using a photo
ionization code. See the description of the *xabs* model for more
details about this. The relevant parameter is the ionization parameter
:math:`\xi = L/nr^2`, with :math:`L` the source luminosity, :math:`n`
the hydrogen density and :math:`r` the distance from the ionizing
source. The advantage of the *xabs* model over the *slab* model is that
all relevant ions are taken into account, also those which would be
detected only with marginal significance using the *slab* model. In some
circumstances, the combined effect of many weak absorption features
still can be significant. A disadvantage of the *xabs* model happens of
course when the ionization balance of the source is different from the
ionization balance that was used to produce the set of runs with the
photo ionization code. In that case the *xabs* model may fail to give an
acceptable fit, while the *slab* model may perform better.

Warm model
~~~~~~~~~~

In the *warm* model, we construct a model for a continuous distribution
of column density :math:`N_{\mathrm H}` as a function of :math:`\xi`. It
is in some sense comparable to the differential emission measure models
used to model the emission from multi-temperature gas. Here we have
absorption from multi-ionization gas. Depending upon the physics of the
source, this may be a better approximation than just the sum of a few
*xabs* components. A disadvantage of the model may be (but this also
depends upon the physics of the source), that all dynamical parameters
for each value of :math:`\xi` are the same, like the outflow velocity
and turbulent broadening. If this appears to be the case in a given
source, one may of course avoid this problem by taking multiple,
non-overlapping *warm* components.

Hot model
~~~~~~~~~

In the *hot* model, we link the different ionic column densities simply
by using a collisional ionsation (CIE) plasma. It may be useful in
situations where photoionisation is relatively unimportant but the
source has a non-negligible optical depth. A special application is of
course the case for a low temperature, where it can be used to mimick
the absorption of (almost) neutral gas.

Pion model
~~~~~~~~~~

Finally we have in the pion model, which does a self-consistent photo
ionization calculation of the slab of material.

.. _sect:abs_transm:

Dynamical model for the absorbers
---------------------------------

For each of the absorption models described in the previous section, we
have the freedom to prescribe the dynamics of the source. The way we
have implemented this in is described below.

The transmission :math:`T(\lambda)` of the slab is simply calculated as

.. math:: T(\lambda)=\exp[{-\tau_c(\lambda)-\tau_l(\lambda)}]

with :math:`\tau_c` and :math:`\tau_l` the total continuum and line
optical depth, respectively. As long as the thickness of the slab is not
too large, this most simple approximation allows a fast computation of
the spectrum, which is desirable for spectral fitting.

In particular UV observations of AGN show that the absorption lines can
often be decomposed into multiple velocity components. In the X-ray band
these are not always fully resolvable, which led us to the following
approach. Each absorption line is split into different velocity
components, using

.. math::

   \tau_l(v) = \sum_{i}^{}\tau_i \exp\left[
   -(v-v_i)^2/2\sigma_{\mathrm v}^2
      \right]

(or the equivalent generalisation to the Voigt profile). Further, we
take

.. math:: v_i = v_0 + i\,\Delta v,

.. math::

   \label{eqn:taui}
   \tau_i = K \exp\left[ -v_i^2/2 \sigma_{\mathrm b}^2 \right],

where :math:`v_0` is the average velocity of the blend (a negative value
corresponds to a blue-shift or outflow), :math:`\Delta v` is the
separation between the velocity components, and the r.m.s. width of the
blend :math:`\sigma_{\mathrm b}` is in general larger than the intrinsic
width :math:`\sigma_{\mathrm v}` of the components (do never confuse
both :math:`\sigma`\ ’s!). The normalization :math:`K` is defined in
such a way that :math:`\sum \tau_i = \tau_0`. Finally, the total optical
depth :math:`\tau_0` is given by

.. math::

   \label{eqn:tau}
   \tau_0 = 0.106 f N_{20} \lambda / \sigma_{\mathrm v,100}.

Here :math:`f` is the oscillator strength, :math:`\lambda` the
wavelength in Å, :math:`\sigma_{\mathrm v,100}` the velocity dispersion in
units of :math:`100` km/s and :math:`N_{20}` the total column density of
the ion in units of :math:`10^{20}` :math:`\mathrm{m}^{-2}`.

This dynamical structure offers the user a broad range of applicability.
However, we advise the user to use the extension with
:math:`\sigma_{\mathrm b}` with caution! Always start with the most
simple case. The default values for are defined in such a way that
:math:`\sigma_{\mathrm b} = 0`. This will produce the “normal” case of
single absorption lines. In that case, the velocity separation
:math:`\Delta v` is an irrelevant parameter.

Finally, we make a remark on the r.m.s. line width of individual lines,
:math:`\sigma_{\mathrm v}`. In our code, this *only* includes the
turbulent broadening of the lines. The thermal broadening due to motion
of the ions is included by adding it in quadrature to the turbulent
broadening. The only exception is the *slab* model, where of course due
to the lack of underlying physics the thermal broadening is unknown, and
therefore in using the slab model one should be aware that
:math:`\sigma_{\mathrm v}` also includes a thermal contribution.

