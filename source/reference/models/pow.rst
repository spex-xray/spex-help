Pow: power law model
====================

The power law spectrum as given here is a generalization of a simple
power law with the possibility of a break, such that the resultant
spectrum in the :math:`\log F - \log E` plane is a hyperbola.

The spectrum is given by:

.. math:: F(E) = A E^{-\Gamma}e^{\eta(E)},

where :math:`E` is the photon energy in keV, :math:`F` the photon flux
in units of :math:`10^{44}` ph s:math:`^{-1}\,`\ keV\ :math:`^{-1}`, and
the function :math:`\eta(E)` is given by

.. math:: \eta(E) = {r\xi + \sqrt{r^2\xi^2+b^2(1-r^2)} \over 1-r^2},

with :math:`\xi \equiv \ln (E/E_0)`, and :math:`E_0`, :math:`r` and
:math:`b` adjustable parameters. For high energies, :math:`\xi` becomes
large and then :math:`\eta` approaches :math:`2r\xi/(1-r^2)`, while for
low energies :math:`\xi` approaches :math:`-\infty` and as a consequence
:math:`\eta` goes to zero. Therefore the break :math:`\Delta\Gamma` in
the spectrum is :math:`\Delta\Gamma=2r\xi/(1-r^2)`. Inverting this we
have

.. math:: r = {\sqrt{1+(\Delta\Gamma)^2} - 1\over \vert \Delta\Gamma \vert}.

The parameter :math:`b` gives the distance (in logarithmic units) from
the interception point of the asymptotes of the hyperbola to the
hyperbola. A value of :math:`b=0` therefore means a sharp break, while
for larger values of :math:`b` the break gets smoother.

The simple power law model is obtained by having :math:`\Delta\Gamma=0`,
or the break energy :math:`E_0` put to a very large value.

**Warning:** *By default, the allowed range for the photon index
:math:`\Gamma` is (-10,10). If you manually increase the limits, you may
run the risk that SPEX crashes due to overflow for very large photon
indices.*

**Warning:** *Note the sign of :math:`\Gamma`: positive values
correspond to spectra decreasing with energy. A spectrum with
:math:`\Delta\Gamma>0` therefore steepens/softens at high energies, for
:math:`\Delta\Gamma<0` it hardens.*

As an extension, we allow for a different normalisation, namely the
integrated luminosity :math:`L` in a given energy band
:math:`E_1`–:math:`E_2`. If you choose this option, the parameter "type"
should be set to 1. The reason for introducing this option is that in
several cases you may have a spectrum that does not include energies
around 1 keV. In that case the energy at which the normalisation
:math:`A` is determined is outside your fit range, and the nominal error
bars on :math:`A` can be much larger than the actual flux uncertainty
over the fitted range. Note that the parameters :math:`E_1` and
:math:`E_2` act independently from whatever range you specify using the
"elim" command. Also, the luminosity is purely the luminosity of the
power law, not corrected for any transmission effects that you may have
specified in other spectral components.

**Warning:** *When you do spectral fitting, you **must** keep either
:math:`A` or :math:`L` a fixed parameter! The other parameter will then
be calculated automatically whenever you give the calculate or fit
command. SPEX does not check this for you! If you do not do this, you
may get unexpected results / crashes.*

**Warning:** *The conversion factor between :math:`L` and :math:`A` is
calculated numerically and not analytically (because of the possible
break). In the power law model, photon fluxes above the nominal limit
(currently :math:`e^{34}=5.8\times 10^{14}` in unscaled units) are put
to the maximum value in order to prevent numerical overflow. This
implies that you get inaccurate results for low energies, for example
for a simple power law with :math:`\Gamma=2` the results (including
conversion factors) for :math:`E<10^{-7}` keV become inaccurate.*

**Warning:** *Note that when you include a break, the value of
:math:`\Gamma` is the photon index at energies below the break. Also,
the normalisation :math:`A` is the nominal normalisation of this
low-energy part. In such a case of a break, the true flux at 1 keV may
be different from the value of A! Of course, you can always calculate
the flux in a given band separately.*

The parameters of the model are:

| ``norm`` : Normalisation :math:`A` of the power law, in units of
  :math:`10^{44}` ph s:math:`^{-1}\,`\ keV\ :math:`^{-1}` at 1 keV.
  Default value: 1. When :math:`\Delta\Gamma` is not equal to 0, it is
  the asymptotic value at 1 keV of the low-energy branch.
| ``gamm`` : The photon index :math:`\Gamma` of the spectrum. Default
  value: 2. When :math:`\Delta\Gamma` is not equal to 0, it is the slope
  of the low-energy branch.
| ``dgam`` : The photon index break :math:`\Delta\Gamma` of the
  spectrum. Default value: 0. and frozen. If no break is desired, keep
  this parameter 0 (and frozen!).
| ``e0`` : The break energy :math:`E_0` (keV) of the spectrum. Default
  value: :math:`10^{10}` and frozen.
| ``b`` : Smoothness of the break :math:`b`. Default: 0.
| ``type`` : Type of normalisation. Type\ :math:`=0` (default): use
  :math:`A`; type\ :math:`=1`: use :math:`L`.
| ``elow`` : :math:`E_1` in keV, the lower limit for the luminosity
  calculation. Default value: 2 keV.
| ``eupp`` : :math:`E_2` in keV, the upper limit for the luminosity
  calculation. Default value: 10 keV. Take care that :math:`E_2>E_1`.
| ``lum`` : Luminosity :math:`L` between :math:`E_1` and :math:`E_2`, in
  units of :math:`10^{30}` W.
