Hyd: model with user-own hydrodynamical simulation
==================================================

This model calculates the spectrum of a plasma with a given set of ion
concentrations. It allows users to calculate the X-ray spectrum
corresponding to his own hydrodynamical simulation results. The basic
usage is that the user first runs own calculations to obtain the ion
concentrations, and stores them in an ascii file. The name should be
either of ``spexicon_abs.dat`` or ``spexicon_rel.dat``. Then the user runs
SPEX and loads the Hyd model to calculate the spectrum.

For users who are familiar with Fortran, we offer the supporting
fortran90 subroutine, :download:`hydro_driver.f90 </_static/user/hydro_driver.f90>`,
to make the ion concentration file conveniently. The usage of the
*hydro_driver* is described in :ref:`sect:hydrodriver`.

For more general cases users can directly load the Hyd model and just
calculate the spectrum. The model has two modes to specify the format
for the ion concentrations: absolute (mode 1) or relative (mode 2). For
mode 1, the input file must have the name ``spexicon_abs.dat``, and the
values are treated as absolute ion concentrations (relative to
hydrogen). In this mode the parameters of the elemental abundances do
not affect the ion concentration nor the spectrum at all (they are
ignored). For the case that users wish to treat elemental abundances as
fitting parameters, mode=2 can be used. In this mode the input file must
have the name ``spexicon_rel.dat``, which contains the ion concentrations
relative to the concentration of the relevant chemical element.

The parameters of the model are:

| ``hyd`` : Hydrogen density in
  :math:`10^{20}` :math:`\mathrm{m}^{-3}`
| ``mode`` : Mode of the model. Mode=1: read absolute ion concentration
  from spexicon_abs.dat. mode=2: read relative ion concentration from
  spexicon_rel.dat.

The following parameters are the same as for the cie-model:

| ``norm`` : the normalisation, which is the emission measure
  :math:`Y \equiv  n_{\mathrm e} n_{\mathrm H} V` in units of
  :math:`10^{64}` :math:`\mathrm{m}^{-3}`, where :math:`n_{\mathrm e}` and
  :math:`n_{\mathrm H}` are the electron and Hydrogen densities and
  :math:`V` the volume of the source. Default value: 1.
| ``t`` : the electron temperature :math:`T_{\mathrm e}` in keV. Default
  value: 1.
| ``it`` : Ion temperature in keV.
| ``vrms`` : RMS Velocity broadening in km/s (see :ref:`sect:turbulence`).
| ``ref`` : Reference element.
| ``01...30`` : Abundances of H to Zn.
| ``file`` : Filename for the non-thermal electron distribution.

.. warning:: By default, SPEX starts with ``var calc old`` (see the var
   menu for explanation). If you want to use this model with the latest
   atomic database, you should set the ionisation balance to U17. Note
   that this is only used to calculate inner-shell ionisation rates for
   the spectral evaluation, it will not affect the ion concentrations
   that the user provides.

*Recommended citation (first use):* `Kosenko et al. (2015)
<https://ui.adsabs.harvard.edu/abs/2015MNRAS.449.1441K/abstract>`_.
