.. _sec:xabs:

Xabs: photoionised absorption model
===================================

The *xabs* model calculates the transmission of a slab of material,
where all ionic column densities are linked through a photoionisation
model. The relevant parameter is the ionization parameter
:math:`\xi = L/nr^2`, with :math:`L` the source luminosity, :math:`n`
the hydrogen density and :math:`r` the distance from the ionizing
source. The advantage of the *xabs* model over the *slab* model is that
all relevant ions are taken into account, also those which would be
detected only with marginal significance using the *slab* model. In some
circumstances, the combined effect of many weak absorption features
still can be significant. A disadvantage of the *xabs* model happens of
course when the ionization balance of the source is different from the
ionization balance that was used to produce the set of runs with the
photo ionization code. In that case the *xabs* model may fail to give an
acceptable fit, while the *slab* model may perform better.

The *xabs* model needs an ascii-file as input. The user can provide such
a file (see parameter "col" in the parameter list), but there is also a
default file in SPEX that is read if the user does not provide a
separate file. The default is based on a run with Cloudy, using the
spectral energy distribution of NGCÂ 5548 as used in `Steenbrugge et al. (2005)
<https://ui.adsabs.harvard.edu/abs/2005A%26A...434..569S/abstract>`_.
Such an ascii-files contains a pre-calculated list of ionic column
densities versus ionisation parameter, as well as electron temperatures
versus ionisation parameter (needed for the thermal line broadening).
If you want to produce such a file, you can use the auxiliary program
*xabsinput*, that will run Cloudy for you and make the file to be used
in SPEX. See SectionÂ `Xabsinput <#sect:xabsinput>`__ for more details how to
use that program.

For more information on this model, the atomic data and parameters we
refer to SectionÂ `Absorption models <#sect:abs_models>`__.

The parameters of the model are:

| ``nh`` : Hydrogen column density in :math:`10^{28}` :math:`\mathrm{m}^{-2}`.
  Default value: :math:`10^{-4}` (corresponding to
  :math:`10^{24}` :math:`\mathrm{m}^{-2}`, a typical value at low Galactic
  latitudes).
| ``xi`` : the :math:`{ }^{10}`log of the ionisation parameter
  :math:`\log\xi` in units of :math:`10^{-9}` Wm. Default value: 1.
| The following parameters are common to all our absorption models:
  ``fcov`` : The covering factor of the absorber. Default value: 1 (full
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
| The following parameter is unique for the xabs-model and the warm
  model: ``col`` : File name for the photoionisation balance parameters

*Recommended citation:* `Steenbrugge et al. (2003)
<https://ui.adsabs.harvard.edu/abs/2003A%26A...402..477S/abstract>`_.
