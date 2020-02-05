.. _sec:pion:

Pion: SPEX†photoionised plasma model
====================================

The *pion* model calculates the transmission and emission of a slab of
photo-ionized plasma, where all ionic column densities are linked
through a photoionisation model. The relevant parameter is the
ionization parameter :math:`\xi = L/nr^2`, with :math:`L` the source
luminosity, :math:`n` the hydrogen density and :math:`r` the distance
from the ionizing source. The major difference is that while for the
*xabs* model the photoionisation equilibrium is pre-calculated for a
grid of :math:`\xi`-values by an external code, for instances Cloudy or
XSTAR (or even with the present *pion* model :math:`\ldots`), in the
present *pion* model the photoionisation equilibrium is calculated
self-consistently using the available plasma routines of SPEX.

.. Warning:: The default energy grid in SPEX†has 8192 bins between
   0.001 and 100†keV. This may not be sufficient for the pion model when
   you use it without data. Recommended is a logarithmic grid between
   :math:`10^{-6}-10^{6}`¬†keV with a step size of 0.005. You can get this
   by issuing the following command: ‚ÄùEgrid log 1E-6 : 1E6 step 0.005 keV".
   Note that if you have read in data, SPEX automatically uses the resolution
   of the response matrix within its energy range and expands the
   total energy grid to :math:`10^{-6}-10^{6}`¬†keV.

.. Warning:: This model is still under development and not all atomic
   data is fully updated. For instance, no cooling by collisional
   excitation for ions of the K- to Zn-isolelectronic sequences is taken
   into account yet. So use with care!

.. Warning:: When setting up the model, be aware that the pion model is
   both additive and multiplicative (even if you put the emission to zero).
   Therefore, the pion model needs the same com rel sequence as you use for
   your absorption component. Example: ``com pow`` ‚Äî ``com reds`` ‚Äî ``com
   pion`` ‚Äî ``com rel 1 3,2`` (a powerlaw that powers a pion model and is then redshifted)
   needs as next command ``com rel 3 2``, telling SPEX¬†that the pion emission
   model is also redshifted.

.. Warning:: Please note that all PION components must be multiplied by
   at least one continuum component (using the usual comp rel command).
   Otherwise, photoionisation cannot be calculated and SPEX may crash. A
   typical AGN SED spanning optical to X-ray energies can be set up with
   three continuum components in SPEX: pow (primary hard X-ray power-law
   emission), refl (reflected power-law emission), comt (thermal optical/UV
   disk continuum + the soft X-ray excess). See the SED of NGC 5548 derived
   in `Mehdipour et al. (2015) <https://ui.adsabs.harvard.edu/abs/2015A%26A...575A..22M/abstract>`_.

The main advantage, however, is that the user can define his own
ionising continuum by combining any additive components of SPEX, and
that ionising spectrum is fed through the *pion* component to get the
transmitted spectrum. In addition, multiple *pion* components can be
used, with the light leaking from one layer to the next. And it allows
for spectral fitting, where the parameters of the ionising continuum are
determined simultaneously with the parameters of the absorbing layer.
The number of parameters is therefore unlimited (well, the memory and
cpu speed of the computer will be the true limiting factors).

Prior to fitting a PION component, it is best to first calculate the
model spectrum with your initial parameter values (see ``calculate``
command). This helps to see if the initial values are reasonable numbers
and the model is not too far off the data.

Emission from the *pion* model
------------------------------

We have now incorporated a first version of emission
from the same layer. We cannot give you any guarantee at the moment that
it is bug-free. We know at the moment that the source has probelms when
the density gets too high; this is different for each ion; so unless you
limit the density in fitting, SPEX may encounter a situation where you
surpass the critical density and you may get a warning message. Here is
an example. For a photoionised case, with :math:`\log \xi = 3`
(resulting :math:`kT=0.64`¬†keV) the nominal occupation of the ground
state of H‚ÄÜ becomes negative for a density
:math:`>0.15\times 10^{20}` :math:`\mathrm{m}^{-3}`. This can be traced down to
incomplete atomic data. For H‚ÄÜ, we include collisional excitation and
de-excitation up to principal quantum number :math:`n=5` but not above.
As a result, in this example the 1s‚Äì5s levels are mainly
populated/depopulated by collisions, while 6s‚Äì16s are mainly populated
by radiative recombination and depopulated by radiative cascades
downward or photon absorption. The nominal occupation of 1s‚Äì5s then
decreases from 0.035 (1s) to 0.0024 (5s), while for 6s‚Äì16s they increase
slowly from 0.020 to 0.027. This is of course physically unacceptable.
It causes the lower levels to leak to the higher levels, with eventually
the catastrophe of negative occupation for the ground state. We mitigate
this by replacing the level populations by the LTE populations and
issueing a warning. Without this mitigation, SPEX would crash.

.. Warning:: You can get the emission by putting the covering factor
   (omeg) to a non-zero value; it will slow down the calculations compared
   to absorption-only calculations, so be aware.

Normally, to calculate the emission from a full thin shell surrounding
an ionising source, you should set the parameter *omeg* to unity (a full
shell of 4\ :math:`\pi` steradians). Smaller factors could be associated
e.g. to ionisation cones; values larger than unity make physically no
sense but you can formally play around with it (for very large values,
the emitted spectrum would start dominating the absorbed primary
continuum, but if you want to suppress the primary continuum in the
observed spectrum, it is better to define your model like the example
below as::

  SPEX> com pow
  SPEX> com pion
  SPEX> com etau
  SPEX> com rel 1 2,3
  SPEX> com rel 2 0
  SPEX> par 3 tau v 1e10
  SPEX> par 3 a v 0

In this example, the powerlaw goes through the *pion* component and is
killed afterwards by the *etau* component, while the emission from the
*pion* component is not attenuated by *etau*.

You can vary the new parameter *mix* to get a different ratio of
forwards to backwards emission. Putting it to 1 (default) means you get
the forward emission, putting it to 0 the backwards emission, and
intermediate values give you a mix.

.. Warning:: The emission model uses currently only one layer. When the
   continuum optical depth of the absorbed continuum, weighted with the
   incoming flux, becomes of order unity, the layer will become
   inhomogeneous in terms of temperature structure, and our single-layer
   approximation will break down.

In order to make a PION component produce emission only, fix the
covering fraction (cf) parameter to zero so that no absorption is
produced. Then fit the omega parameter. Note that any PION component
with a non-zero omega acts as an additive component in SPEX. Therefore,
multiply these components with your multiplicative components (like the
Galactic absorption) using the ``comp rel`` command.

For more information on this model, the atomic data and parameters we
refer to Section `Absorption models <#sect:abs_models>`__.

More options
------------

No energy balance solution needed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The default option (*tmod=0*) for the *pion* model is to solve
simultaneously for the ionisation balance and the energy balance
equations. This option is useful for e.g. photoionised winds of AGN or
X-ray binaries.

However, there are situations where photo-ionisation or photo-excitation
play a role but do not determine the thermal structure. Examples are
winds of hot stars, where shocks heat the wind but UV radiation from the
star can affect He-like triplet line emission ratios. Another example
are the most teneous parts of the WHIM, where photoionisation by the
cosmic background can be important compared to collisional ionisations.

For such cases, the user can set the parameter *tmod=1*; in that case,
the user should also provide the temperature *tinp* of the plasma. In
this case, only the ionisation balance equation is solved, and there is
in general no energy balance (this can be checked by using the
ascii-output option *heat*). Do not forget to set the parameter *omeg*
to a finite value (the default is zero), otherwise the emitted spectrum
is zero.

External heat sources
~~~~~~~~~~~~~~~~~~~~~

In some cases there may be an other external heat or cooling source,
like shock heating, magnetic reconnection, adiabatic expansion etc. If
one wishes to solve for the photoionisation equilibrium, then this
additional heat source can be used by putting the parameter *exth* to
the proper value (units: W :math:`\mathrm{m}^{-3}`. A negative value would mean
a cooling contribution.

Multiple solutions
~~~~~~~~~~~~~~~~~~

There are situations where there is not a unique solution to the energy
balance equations. A simple example can be obtained as follows: take a
logarithmic energy grid between :math:`10^{-6}-10^6`¬†keV, use a powerlaw
with photon index 1.5, apply the pion model to it and put *exth* to
:math:`5\times 10^{-25}`¬†W :math:`\mathrm{m}^{-3}`. In this case there are 3
solutions. SPEX†chooses by default the hottest solution. You can see all
solutions by putting the parameter *fmod=1* and using the *heat* ascii
output option. Or check the behaviour of the hating balance by issuing
the *ebal* ascii output option. You can select which solution you want
to use in SPEX†by setting the *soln* parameter. Default is 0 (hottest
solution), and for the above case of 3 solutions values of 1, 2 and 3
renders you the coldest, second ant hottest solution. Test this with the
*heat* or *plas* output options.

.. Warning:: When you set soln to a non-zero value, use fmod=1,
   otherwise SPEX†may crash.

No equilibrium solution
~~~~~~~~~~~~~~~~~~~~~~~

There are also situations where there is no equilibrium solution to the
energy balance equations. This may happen for instance if you put so
much heat in the plasma that it cannot be balanced anymore by cooling.
Another example is a too hard powerlaw without high energy cut-off,
where Compton-heating might be very strong. In this case SPEX†renders an
error message, and you cannot trust the result of the calculation
anymore. The only remedie is to adjust your model parameters or the
allowed range for them in case of spectral fitting or error searches.

Adiabatic cooling
~~~~~~~~~~~~~~~~~

The effects of adiabatic cooling can be taken into account by setting
the parameter *tadi*. This represents the adiabatic cooling time
:math:`t_{\mathrm adi}`. The associated cooling rate is calculated as
:math:`R_{\mathrm adi}= \frac{3}{2} nkT / t_{\mathrm adi}`, where :math:`n` is
the total particle density (electrons and ions). The default setting is
such that this process can be neglected. If the user takes this process
into account, it should be verified afterwards that the physlical
conditions for adiabatic cooling are met, i.e. energy losses by
radiation or heat conduction must be small compared with those by the
adiabatic expansion. Check this for example by running the ``asc ter
... heat`` output.

Radiative acceleration
~~~~~~~~~~~~~~~~~~~~~~

The radiative acceleration caused by the absorption or scattering of the
incoming radiation on the layer is calculated, and given as output
parameter *acc*. Physically, it is given by the following equation,
which can be easily derived:

.. math:: a =F_{\mathrm abs}/c f m_{\mathrm p} N_{\mathrm H},

where :math:`F_{\mathrm abs}=\int F(E)(1-T(E)){\mathrm d}E` is the absorbed flux
(:math:`F(E)` is the incoming flux in W :math:`\mathrm{m}^{-2}` keV and
:math:`T(E)` the transmission of the layer), :math:`c` the speed of
light, :math:`m_{\mathrm p}` the proton mass, :math:`N_{\mathrm H}` the hydrogen
column density and :math:`f` is a dimension less quantity determined
from :math:`\rho = f n_{\mathrm H} m_{\mathrm p}` with :math:`n_{\mathrm H}` the
hydrogen density and :math:`\rho` the mass density (kg :math:`\mathrm{m}^{-3}`)
of the plasma, for example :math:`f=1.4287` for the present default
abundances of SPEX (you can check this number from the ``asc ter
... plas`` ascii output option).

Model parameters
----------------

The parameters of the model are:

| ``nh`` : Hydrogen column density in :math:`10^{28}`†:math:`\mathrm{m}^{-2}`.
  Default value: :math:`10^{-4}` (corresponding to
  :math:`10^{24}`†:math:`\mathrm{m}^{-2}`, a typical value at low Galactic
  latitudes).
| ``xi`` : the :math:`^{10}`\ log of the ionisation parameter
  :math:`\log\xi` in units of :math:`10^{-9}`†W m. Default value: 1.
| ``u`` : the Davidson (Cloudy) ionisation parameter :math:`U`
  (dimensionless). This is calculated from the SED and the value of
  :math:`\xi`. Not fittable, just output.

The following parameters are common to all our absorption models:

| ``fcov`` : The covering factor of the absorber. Default value: 1 (full
  covering)
| ``v`` : Root mean square velocity :math:`\sigma_{\mathrm v}`
| ``rms`` : Rms velocity :math:`\sigma_{\mathrm b}` of line blend
  components
| ``dv`` : Velocity distance :math:`\Delta v` between different blend
  components
| ``zv`` : Average systematic velocity :math:`v` of the absorber
| The following parameters are the same as for the cie-model (see there
  for a description): ``ref`` : Reference element
| ``01...28`` : Abundances of H to Ni; only here we take H, He, C,
  N, O, Ne, Na, Mg, Al, Si, S, Ar, Ca, Fe, Ni.
| ``file`` : File name for the electron distribution (in case of a sum
  of Maxwellians distribution)
| The following parameters are unique for the *pion* model: ``type`` :
  If type equals 0 (default value), it uses :math:`\xi` as its main
  parameter; if type equals 1, it uses lixi (see next parameter) as its
  main parameter
| ``lixi`` : Optional alternative ionisation parameter, defines as
  :math:`L_{\mathrm
  {ion}}/\xi` in units of :math:`10^{39}` :math:`\mathrm{m}^{-1}`. This is useful
  for time-variable spectra where :math:`\xi` has been determined from
  one spectrum and where one wants to calculated the transmitted
  spectrum for fixed :math:`nr^2` for a different ionising spectrum; in
  that case lixi can be kept constant.
| ``omeg`` : Covering factor :math:`\Omega/4\pi`, needed for emission.
  At this stage, keep it to zero, please.
| ``mix`` : Fraction of emitted spectrum to the forward direction
  relative to the total. default value: 1 (all emission forward). A
  value of 0 means SPEX gives all backwards emission.
| ``exth`` : External heating in W :math:`\mathrm{m}^{-3}`. default value: 0.
| ``fmod`` : Show all solutions in ascii output of the heating (fmod=1).
  Default is fmod=0. Set fmod=1 also when you set soln\ :math:`>0`.
| ``soln`` : The temperature solution to be used, from low to high
  values. Default value is 0 (hottest solution). If this parameter is
  larger than the hootest solution, it adopts the hottest solution
  instead. Should be used with fmod=1 in case soln\ :math:`>0`.
| ``tmod`` : Temperature mode. Default value: 0 (solve for the
  temperature that provides energy balance). If tmod=1, use *tinp*
  instead as temperature and do not solve for energy balance.
| ``tinp`` : Temperature of the plasma in keV. Default: 1†keV. Only
  relevant if *tmod=1*.
| ``tadi`` : Adiabatic cooling time scale (s). See description above.
  Default value: :math:`10^{30}`†s.
| ``acc`` : Radiative acceleration. See description above. Note: only
  output.

*Recommended citation:* `Mehdipour et al. (2015)
<https://ui.adsabs.harvard.edu/abs/2015A%26A...575A..22M/abstract>`_
and `Miller et al. (2015) <https://ui.adsabs.harvard.edu/abs/2015Natur.526..542M/abstract>`_
