.. _sect:etau:

Etau: simple transmission model
===============================

This model calculates the transmission :math:`T(E)` between energies
:math:`E1` and :math:`E_2` for a simple (often unphysical!) case:

.. math:: T(E) = e^{-\tau(E)},

with the optical depth :math:`\tau(E)` given by:

.. math:: \tau(E) = \tau_0 E^a.

In addition, we put here :math:`T\equiv 1` for :math:`E<E_1` and
:math:`E>E_2`, where :math:`E_1` and :math:`E_2` are adjustable
parameters. This allows the user for example to mimick an edge. Note
however, that in most circumstances there are more physical models
present in SPEX that contain realistic transmissions of edges! If you do
not want or need edges, simply keep :math:`E_1` and :math:`E_2` at their
default values.

Note that :math:`\tau_0` should be non-negative. For :math:`a>0` the
spectrum has a high-energy cut-off, for :math:`a<0` it has a low-energy
cut-off, and for :math:`a=0` the transmission is flat. The larger the
value of :math:`a`, the sharper the cut-off is.

The model can be used as a basis for more complicated continuum
absorption models. For example, if the optical depth is given as a
polynomial in the photon energy :math:`E`, say for example
:math:`\tau = 2 + 3E + 4E^2`, one may define three *etau* components,
with :math:`\tau_0` values of 2, 3, and 4, and indices :math:`a` of 0, 1
and 2. This is because of the mathematical identity
:math:`e^{-(\tau_1+\tau_2)}
= e^{-\tau1}\times e^{-\tau2}`.

The parameters of the model are:

| ``tau0`` : Optical depth :math:`\tau_0` at :math:`E=1` keV. Default
  value: 1.
| ``a`` : The index :math:`a` defined above. Default value: 1.
| ``e1`` : Lower energy :math:`E_1` (keV). Default value:
  :math:`10^{-20}`.
| ``e2`` : Upper energy :math:`E_2` (keV). Default value:
  :math:`10^{20}`.
| ``icov`` : Type of the covering fraction. Default value: 2 (constant,
set by *fcov*). If icov=1, full covering is applied. If icov=3, covering fraction follows a
tangent function that increases with energy. If icov=4, covering fraction follows an inverse
tangent function that decreases with energy. See description in ``pion``.
| ``fcov`` : The covering factor of the absorber if icov=2. Default value: 1 (full
  covering). If icov=3 or 4, it sets the covering factor at the high energy end.
| ``lcov`` : The covering factor of the absorber at the low energy end. Default value: 1.
lcov is applied only when icov=3 or 4. See description in ``pion``.
| ``ecov`` : The energy when the covering factor changes from lcov to fcov. Only applied
if icov=3 or 4.
| ``acov`` : The width of the transit on covering factor. Only applied
if icov=3 or 4.
