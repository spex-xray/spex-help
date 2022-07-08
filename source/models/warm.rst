Warm: continuous photoionised absorption model
==============================================

The *warm* model is a multi-component version of the *xabs* model. In
the *warm* model, we construct a model for a continuous distribution of
column density :math:`N_{\mathrm H}` as a function of :math:`\xi`. It is
in some sense comparable to the differential emission measure models
used to model the emission from multi-temperature gas. Here we have
absorption from multi-ionization gas. Depending upon the physics of the
source, this may be a better approximation than just the sum of a few
*xabs* components. A disadvantage of the model may be (but this also
depends upon the physics of the source), that all dynamical parameters
for each value of :math:`\xi` are the same, like the outflow velocity
and turbulent broadening. If this appears to be the case in a given
source, one may of course avoid this problem by taking multiple,
non-overlapping *warm* components.

The model assumes a logarithmic grid of :math:`n` equidistant values of
:math:`\log\xi`, between a lower limit :math:`\xi_1` and an upper limit
:math:`\xi_2`. For each of the grid points :math:`\xi_i`, a value of
:math:`f_i` can be adjusted; here :math:`f_i` is given as
:math:`f_i={\mathrm d}N_{\mathrm H}/{\mathrm d}\ln\xi` evaluated at
:math:`\xi_i`, where the differential column density is assumed to be a
continuous function of :math:`\xi`. At each intermediate point, the
value of :math:`{\mathrm d}N_{\mathrm H}/{\mathrm
d}\ln\xi` is then determined by doing cubic spline interpolation in the
:math:`\ln f` – :math:`\ln\xi` space. In order not to consume too much
computer time, the step size for numerical integration
:math:`\Delta\log\xi` can be set. A typical, recommended value for this
(the default) is 0.2.

For more information on this model, the atomic data and parameters we
refer to :ref:`sect:abs_models`.

The parameters of the model are:

| ``xil1`` : :math:`\log\xi_1` of the lower limit of the ionisation
  parameter range in units of :math:`10^{-9}` W m. Default value: -4.
| ``xil2`` : :math:`\log\xi_2` of the upper limit of the ionisation
  parameter range in units of :math:`10^{-9}` W m. Default value: 5.
| ``npol`` : The number of grid points for the :math:`\log\xi` grid,
  including the end points for :math:`\xi_1`. Default value: 19; lower
  values are generally recommended; minimum value is 2.
| ``dxi`` : step size for numerical integration :math:`\Delta\log\xi`.
  Default value: 0.2.
| ``f01...f19`` : Values of
  :math:`f_i={\mathrm d}N_{\mathrm H}/{\mathrm
  d}\ln\xi` at the grid points. Default values :math:`10^{-6}`. When
  npol\ :math:`<19`, the remaining values of :math:`f_i` are simply
  ignored.

The following parameters are common to all our absorption models:

| ``fcov`` : The covering factor of the absorber. Default value: 1 (full
  covering)
| ``v`` : Root mean square velocity :math:`\sigma_{\mathrm v}`
| ``rms`` : Rms velocity :math:`\sigma_{\mathrm b}` of line blend
  components
| ``dv`` : Velocity distance :math:`\Delta v` between different blend
  components
| ``zv`` : Average systematic velocity :math:`v` of the absorber (using relativistic Doppler shift)
| The following parameter is the same as for the xabs-model (see there
  for a description): 
| ``col`` : File name for the photoionisation
  balance parameters

*Recommended citation:* `Steenbrugge et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005A%26A...432..453S/abstract>`_
