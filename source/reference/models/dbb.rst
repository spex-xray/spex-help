Dbb: disk blackbody model
=========================

We take the model for a standard Shakura-Sunyaev accretion disk. The
radiative losses from such a disk are given by

.. math:: Q = {3GM\dot{M}(1-\sqrt{r_i/r}) \over 8\pi r^3},

where :math:`Q` is the loss term in W m\ :math:`^{-2}` at radius
:math:`r`, :math:`M` the mass of the central object, :math:`\dot{M}` the
accretion rate through the disk and :math:`r_i` the inner radius. If
this energy loss is radiated as a blackbody, we have

.. math:: Q = \sigma T^4

with :math:`\sigma` the constant of Stefan-Boltzmann and :math:`T(r)`
the local temperature of the blackbody. The total spectrum of such a
disk is then obtained by integration over all radii. We do this
integration numerically. Note that for large :math:`r`,
:math:`T\sim r^{-3/4}`.

**Warning:** *A popular disk model (diskbb in XSPEC) assumes this
temperature dependence over the full disk. However, we correct it using
the factor :math:`(1-\sqrt{r_i/r})` in :math:`Q` which corresponds to
the torque-free condition at the inner boundary of the disk.*

The photon spectrum of the disk is now given by

.. math:: N(E) = {8\pi^2E^2r_i^2\cos i \over h^3c^2} f_d(E/kT_i,r_o/r_i),

where :math:`i` is the inclination of the disk (0 degrees for face-on
disk, 90 degrees for an edge-on disk), :math:`E` the photon energy,
:math:`r_o` the outer edge of the disk, and :math:`T_i` is defined by

.. math::

   T_i^4 = 3GM\dot{M}/8\pi r_i^3\sigma
   \label{eqn:tidisk}

and further the function :math:`f_d(y,r)` is defined by

.. math:: f_d(y,r) = \int\limits_{1}^{r} {x{\mathrm d}x \over e^{y/\tau} - 1}

where :math:`\tau(x)` is defined by
:math:`\tau^4(x) = (1-1/\sqrt{x})/x^3`.

In addition to calculating the spectrum, the model also allows to
calculate the average radius of emission :math:`R_e` at a specified
energy :math:`E_r`. This is sometimes useful for time variability
studies (softer photons emerging from the outer parts of the disk).

Given the fit parameters :math:`T_i` and :math:`r_i`, using
(`[eqn:tidisk] <#eqn:tidisk>`__) it is straightforward to calculate the
product :math:`M\dot{M}`. Further note that if :math:`r_i=6GM/c^2`, it
is possible to find both :math:`M` and :math:`\dot{M}`, provided the
inclination angle :math:`i` is known.

The parameters of the model are:

| ``norm`` : Normalisation :math:`A` (:math:`=r_i^2\cos i`), in units of
  :math:`10^{16}` m:math:`^2`. Default value: 1.
| ``t`` : The nominal temperature :math:`T_i` in keV. Default value: 1
  keV.
| ``ro`` : The ratio of outer to inner disk radius, :math:`r_o/r_i`
| ``ener`` : Energy :math:`E_r` at which the average radius of emission
  will be calculated
| ``rav`` : Average radius :math:`R_e` of all emission at energy
  :math:`E_r` specified by the parameter above. Note that this is not a
  free parameter, it is calculated each time the model is evaluated.
| *Recommended citation:* :raw-latex:`\citet{shakura1973}`.
