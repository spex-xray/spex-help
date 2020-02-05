Spln: spline continuum model
============================

Sometimes the continuum of an X-ray source may be too complex to model
with known physical components. A situation like that may be found in
AGN continua, which are a complex superposition of hard power law, soft
continuum excess, relativistically broadened and "normal" broad lines
with a priori unknown line shape, etc., while in addition a superimposed
warm absorber may have well defined narrow absorption lines. In that
case it might be useful to fit the continuum with an arbitrary profile
in order to get first an accurate description of the absorber, and then
after having "removed" the absorber try to understand the underlying
continuum spectrum.

For these situations the *spln* model introduced here is useful. It
allows the user to model the continuum within two boundaries :math:`b_1`
and :math:`b_2` with a cubic spline.

The algorithm works as follows. The user selects the limits :math:`b_1`
and :math:`b_2` as well as the number of grid points :math:`n`.
SPEX then creates a grid :math:`x_1,\,x_2,\,\ldots,\,x_n` with uniform
spacing in :math:`b` (see below for details). The spectrum at these grid
points is contained in the corresponding array
:math:`y_1,\,y_2,\,\ldots,\,y_n`. These have the usual units of
:math:`10^{44}` photons :math:`\mathrm{s}^{-1}` :math:`\mathrm{keV}^{-1}` used throughout
SPEX, and is the spectrum emitted at the source. The parameters
:math:`y_i` can be adjusted during the spectral fitting, but
:math:`b_1`, :math:`b_2` and :math:`n` and thereby :math:`x_i` remain
fixed. At intermediate points between the :math:`x_i`, the photon
spectrum is determined by cubic spline interpolation on the
:math:`(x_i,y_i)` data pairs. We take a natural spline, i.e. at
:math:`x_1` and :math:`x_n` the second derivative of the spline is zero.

Outside of the range :math:`b_1`–:math:`b_2` however, the photon
spectrum is put to zero, i.e. no extrapolation is made!

Finally note that we have chosen to define the spline in logarithmic
space of :math:`y`, i.e. the :math:`\log` of the photon spectrum is fit
by a spline. This is done in order to guarantee that the spectrum
remains non-negative everywhere. However, the :math:`y`-values listed is
the (linear) photon spectrum itself.

There are four different options for the energy grid :math:`x_i`,
indicated by the parameter *type*:

-  *type*\ =1: :math:`b_1` is the lower energy in keV, :math:`b_2` is
   the upper energy in keV, and the grid is linear in energy in between.

-  *type*\ =2: :math:`b_1` is the lower energy in keV, :math:`b_2` is
   the upper energy in keV, and the grid is logarithmic in energy in
   between.

-  *type*\ =3: :math:`b_1` is the lower wavelength in Å, :math:`b_2` is
   the upper wavelength in Å, and the grid is linear in wavelength in
   between.

-  *type*\ =4: :math:`b_1` is the lower wavelength in Å, :math:`b_2` is
   the upper wavelength in Å, and the grid is logarithmic in wavelength
   in between.

Note that the logarithmic grids can also be used if one wants to keep a
fixed velocity resolution (for broadened line features for example).
Further, each time that the model is being evaluated, the relevant
values of the :math:`x_i` grid points are evaluated.

.. Warning:: Be aware that if you just set :math:`b_1`, :math:`b_2` and
   :math:`n` but do not issue the "calc" command or the "fit" command, the
   :math:`x_i` values have not yet been calculated and any listed values
   that you get with the ``par show`` command will be wrong. After the first
   calculation, they are right.

.. Warning:: If at any time you change one of the parameters
   :math:`type`, :math:`b_1`, :math:`b_2` or :math:`n`, the :math:`y_i`
   values will not be appropriate anymore as they correspond to the
   previous set of :math:`x_i` values.

The maximum number :math:`n` of grid points that is allowed is 999, for
practical reasons. Should you wish to have a larger number, then you
must define multiple *spln* components, each spanning its own (disjunct)
:math:`b_1`–:math:`b_2` range.

It should be noted, however, that if you take :math:`n` very large,
spectral fitting may become slow, in particular if you take your initial
guesses of the :math:`y_i` parameters not too close to the true values.
The reason for the slowness is two-fold; first, the computational time
for each fitting step is proportional to the number of free parameters
(if the number of free parameters is large). The second reason is
unavoidable due to our spectral fitting algorithm: our splines are
defined in :math:`\log` photon spectrum space; if you start for example
with the same value for each :math:`y_i`, the fitting algorithm will
start to vary each parameter in turn; if it changes for example
parameter :math:`x_j` by 1, this means a factor of 10; since the
neighbouring points (like :math:`x_{j-1}` and :math:`x_{j+1}` however
are not adjusted in thid step, the photon spectrum has to be drawn as a
cubic spline through this very sharp function, and it will show the
well-known over-and undershooting at the intermediate x-values between
:math:`x_{j-1}` and :math:`x_j` and between :math:`x_j` and
:math:`x_{j+1}`; as the data do not show this strong oscillation,
:math:`\chi^2` will be poor and the fitting algorithm will decide to
adjust the parameter :math:`y_j` only with a tiny amount; the big
improvement in :math:`\chi^2` would only come if *all* values of
:math:`y_i` were adjusted simultaneously.

The parameters of the model are:

| ``type`` : The parameter *type* defined above; allowed values are 1–4.
  Default value: 1.
| ``n`` : The number of grid points :math:`n`. Should be at least 2.
| ``low`` : Lower x-value :math:`b_1`.
| ``upp`` : Upper x-value :math:`b_2`. Take care to take
  :math:`b_2>b_1`.
| ``x001`` : First x-value, by definition equal to :math:`b_1`.
  :math:`x`-values are not allowed to vary (i.e. you may not fit them).
| ``x002`` : Second x-value
| ``x003`` : Third x-value
| ``...`` : Other x-values
| ``x999`` : last x-value, by definition equal to :math:`b_n`. If
  :math:`n<999`, replace the 999 by the relevant value (for example, if
  :math:`n=237`, then the last :math:`x`-value is x237).
| ``y001`` : First y-value. This is a fittable parameter.
| ``y002`` : Second y-value
| ``y003`` : Third y-value
| ``...`` : Other y-values
| ``y999`` : last y-value. If :math:`n<999`, replace the 999 by the
  relevant value (for example, if :math:`n=237`, then the last
  :math:`y`-value is 237).
