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

As of version 3.08.00 a new option has been added to use an
input transmission spectrum instead of an analytical description.
The file has a similar structure as the file model for emission spectra.
The first line must contain the number of energies in the file.
The next lines contain two numbers for each entry: the energy in keV,
and the scaled optical depth :math:`t` (dimensionless).
The entries must be in increasing energy order.
The transmission T(E) is then computed as :math:`\mathrm{T(E)} = e^{(-\tau_0  t(E))}`
where :math:`\tau_0` is the first parameter of the model ``tau0``.

The parameters of the model are:

| ``tau0`` : Optical depth :math:`\tau_0` at :math:`E=1` keV. Default
  value: 1.
| ``a`` : The index :math:`a` defined above. Default value: 1.
| ``e1`` : Lower energy :math:`E_1` (keV). Default value:
  :math:`10^{-20}`.
| ``e2`` : Upper energy :math:`E_2` (keV). Default value:
  :math:`10^{20}`.
| ``f`` : The covering factor of the absorber. Default value: 1 (full
  covering)
| ``mode``: ``mode=0``: Default etau model (analytical description).
            ``mode=1``: Input of the optical depth of the absorber as a file model.
| ``file``: The name of the file that provides the transmission.
