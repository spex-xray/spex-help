.. _sec:lpro:

Lpro: spatial broadening model
==============================

This multiplicative model broadens an arbitrary additive component with
an arbitrarily shaped spatial profile, in the case of dispersive
spectrometers such as the RGS of XMM-Newton. In many instances, the
effects of a spatially extended source can be approximated by making use
of the fact that for small off-axis angles :math:`\theta` the expression
:math:`{\mathrm d}\lambda / {\mathrm d}\theta` is almost independent of
wavelength :math:`\lambda`. This holds for example for the RGS of
XMM-Newton (for which
:math:`{\mathrm d}\lambda / {\mathrm d}\theta = 0.138 /
m` Å/arcmin, with :math:`m` the spectral order).

We can utilize this for a grating spectrum as follows. Make an image
:math:`I(\Delta\theta)` of your source projected onto the dispersion
axis, as a function of the off-axis angle :math:`\Delta\theta`. From the
properties of your instrument, this can be transformed into an intensity
:math:`I(\Delta\lambda)` as function of wavelength using
:math:`\Delta\lambda = \Delta\theta {\mathrm d}\lambda /
{\mathrm d}\theta`. Assume that the spatial profile :math:`I(\theta)` is
only non-zero within a given angular range (i.e. the source has a finite
extent). Then we can transform :math:`I(\Delta\lambda)` into a
probability distribution :math:`f(x)` with :math:`f=0` for very small or
large values of :math:`x` (here and further we put
:math:`x=\Delta\lambda`). The auxilliary task rgsvprof (see
Section \ `[sect:rgsvprof] <#sect:rgsvprof>`__) is able to create an
input file for the lpro component from a MOS1 image.

The resulting spatially convolved spectrum :math:`S_c(\lambda)` is
calculated from the original spectrum :math:`S(\lambda)` as

.. math::

   S_c(\lambda) = \int f(\lambda-\lambda_0)
   S(\lambda_0) {\mathrm d}\lambda_0.

The function :math:`f(x)` must correspond to a probability function,
i.e. for all values of :math:`x` we have

.. math:: f(x)\ge 0

and furthermore

.. math:: \int\limits_{-\infty}^{\infty} f(x) {\mathrm d}x = 1.

In our implementation, we do not use :math:`f(x)` but instead the
cumulative probability density function :math:`F(x)`, which is related
to :math:`f(x)` by

.. math:: F(x)\equiv \int\limits_{-\infty}^{x} f(y){\mathrm d}y,

where obviously :math:`F(-\infty)=0` and :math:`F(\infty)=1`. The reason
for using the cumulative distribution is that this allows easier
interpolation and conservation of photons in the numerical integrations.

If this component is used, you must have a file available which we call
here "vprof.dat" (but any name is allowed). This is a simple ascii file,
with :math:`n` lines, and at each line two numbers: a value for
:math:`x` and the corresponding :math:`F(x)`. The lines must be sorted
in ascending order in :math:`x`, and for :math:`F(x)` to be a proper
probability distribution, it must be a non-decreasing function i.e. if
:math:`F(x_{i})\le F(x_{i+1})` for all values of :math:`i` between 1 and
:math:`n-1`. Furthermore, we demand that :math:`F(x_1)\equiv 0` and
:math:`F(x_n)\equiv 1`.

Note that :math:`F(x)` is dimensionless. In addition, we allow for two
other parameters: a scale factor :math:`s` and an offset
:math:`\lambda_o`. Usually, :math:`s=1`, but if :math:`s` is varied the
resulting broadening scales proportional to :math:`s`. This is useful if
for example one has an idea of the shape of the spatial profile, but
wants to measure its width directly from the observed grating spectrum.
In addition, the parameter :math:`\lambda_o` can be varied if the
absolute position of the source is unknown and a small linear shift in
wavelength is necessary.

**Warning:** *This model can be applied to grating spectra (like RGS),
but if you include in your fit also other data (for example EPIC), the
same broadening will also be applied to that other data SET. This can be
avoided by using a separate sector for each detector type.*

**Warning:** *The above approximation of spatially extended sources
assumes that there are no intrinsic spectral variations over the surface
area of the X-ray source. Only total intensity variations over the
surface area are taken into account. Whenever there are spatial
variations in spectral shape (not in intensity) our method is strictly
speaking not valid, but still gives more accurate results than a
point-source approximation. In principle in those cases a more
complicated analysis is needed.*

The parameters of the model are:

| ``s`` : Scale parameter :math:`s`, dimensionless. Default value: 1.
| ``dlam`` : Offset parameter :math:`\lambda_o`, in Å. Default value:
  0 Å.
| ``file`` : Ascii character string, containing the actual name of the
  vprof.dat file
| *Recommended citation:* :raw-latex:`\citet{tamura2004}`.
