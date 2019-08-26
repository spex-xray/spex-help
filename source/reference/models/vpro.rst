Vpro: velocity profile broadening model
=======================================

This multiplicative model broadens an arbitrary additive component with
an arbitrarily shaped Doppler profile, characterized by the half-width
:math:`v` and a profile shape :math:`f(x)`. The resulting spectrum
:math:`S_c(E)` is calculated from the original spectrum :math:`S(E)` as

.. math::
   S_c(E) = \int f \bigl( \frac{E-E_0}{E_0} \frac{v}{c}  \bigr)
   S(E_0) {\mathrm d}E_0.

The function :math:`f(x)` must correspond to a probability function,
i.e. for all values of :math:`x` we have

.. math:: f(x)\ge 0

and furthermore

.. math:: \int_{-\infty}^{\infty} f(x) {\mathrm d}x = 1.

In our implementation, we do not use :math:`f(x)` but instead the
cumulative probability density function :math:`F(x)`, which is related
to :math:`f(x)` by

.. math:: F(x)\equiv \int_{-\infty}^{x} f(y){\mathrm d}y,

where obviously :math:`F(-\infty)=0` and :math:`F(\infty)=1`. The reason
for using the cumulative distribution is that this allows easier
interpolation and conservation of photons in the numerical integrations.

If this component is used, you must have a file available which we call
here ``vprof.dat`` (but any name is allowed). This is a simple ascii file,
with :math:`n` lines, and at each line two numbers: a value for
:math:`x` and the corresponding :math:`F(x)`. The lines must be sorted
in ascending order in :math:`x`, and for :math:`F(x)` to be a proper
probability distribution, it must be a non-decreasing function i.e. if
:math:`F(x_{i})\le F(x_{i+1})` for all values of :math:`i` between 1 and
:math:`n-1`. Furthermore, we demand that :math:`F(x_1)\equiv 0` and
:math:`F(x_n)\equiv 1`.

Note that both :math:`x` and :math:`F(x)` are dimensionless. The
parameter :math:`v` serves as a scaling parameter for the total amount
of broadening. Of course for a given profile there is freedom for the
choice of both the :math:`x`-scale as well as the value of :math:`v`, as
long as e.g. :math:`x_n v` remains constant. In practice it is better to
make a logical choice. For example, for a rectangular velocity
broadening (equivalent to the *vblo* broadening model) one would choose
:math:`n=2` with :math:`x_1=-1`, :math:`x_2=1`, :math:`F(x_1)=0` and
:math:`F(x_2)=1`, and then let :math:`v` do the scaling (this also
allows you to have :math:`v` as a free parameter in spectral fits). If
one would instead want to describe a Gaussian profile (for which of
course also the *vgau* model exists), one could for example approximate
the profile by taking the :math:`x`-scale in units of the standard
deviation; an example with a resolution of 0.1 standard deviation and a
cut-off approximation at 5 standard deviations would be :math:`x=`-5,
-4.9, -4.8, :math:`\ldots`, 4.8, 4.9, 5.0 with corresponding values for
:math:`F` given by :math:`F=` 0, 0.00000048, 0.00000079, :math:`\ldots`,
0.99999921, 0.99999952, 1.

The parameters of the model are:

| ``v`` : Velocity broadening parameter :math:`v`, in km/s. Default
  value: 1 km/s.
| ``file`` : Ascii character string, containing the actual name of the
  vprof.dat file
