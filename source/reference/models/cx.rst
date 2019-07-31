CX: model for charge exchange plasmas
=====================================

This model calculates the spectrum emitted from a hot plasma when it
recombines with cold neutral materials. This model is based on three key
assumptions: (1) it considers only single electron capture in
ion-neutral collision; (2) all cross section data are obtained only with
atomic hydrogen target, (3) electronic collisional excitation and
recombination are ignored in the spectral calculation. More informations
can be found in :raw-latex:`\citet{gu2016}`.

Charge exchange cross sections
------------------------------

The CX cross section data used in the model are partly taken from
literatures, including quantum molecular-orbital close-coupling
calculations for :math:`\rm C^{5+}` and :math:`\rm O^{6+}` by
:raw-latex:`\citet{wu2012}` and :raw-latex:`\citet{nolte2012}`,
multi-channel Laudau-Zener results for :math:`\rm Fe^{25+}` and
:math:`\rm Fe^{26+}` by :raw-latex:`\citet{mullen2016}`, other data
compilations for :math:`\rm C^{6+}` and :math:`\rm O^{8+}` by
:raw-latex:`\citet{janev1993}`, and NIFS Charge Transfer Database
(CHART)  [1]_ for :math:`\rm Be^{4+}`, :math:`\rm B^{5+}`,
:math:`\rm N^{7+}`, and :math:`\rm Ne^{10+}`. For CHART database, we
extracted all the data, from both theoretical calculations and
experiments (see a full list in Table 1 of :raw-latex:`\citet{gu2016}`),
and fitted them with Eq.2 of :raw-latex:`\citet{gu2016}` in the energy
range of interests. In typical astrophysical velocity range
(:math:`\sim 100-5000` km s\ :math:`^{-1}`), the useful CHART data are
usually from molecular-orbital and atomic-orbital close-coupling
methods, and a few classical trajectory Monte Carlo calculations. All
the above data are dependent on collision energy, and resolved to levels
described by quantum number :math:`n` and :math:`l`.

For ions not available in public sources, we developed a new method to
interpolate by analyzing the known ions. First we used a scaling law to
determine total cross section for each ion, and applied another scaling
law to represent the :math:`n-` selectivity. The :math:`l-` dependence
is approximated by one of the five empirical weighting functions
presented in Eqs.\ :math:`4-8` of :raw-latex:`\citet{gu2016}`.

**Warning:** *CX model only works with the updated atomic database set
through the command “var calc new”.*

**Warning:** *All Beryllium-like sequence ions are not included in the
current version; will be available later.*

**Warning:** *We will keep updating the CX model when new data
(especially for molecular targets) from theoretical calculations and
experiments become available.*

Parameter description
---------------------

The parameters of the CX model are:

| ``norm`` : the normalisation, which is the emission measure
  :math:`Y \equiv n_{\mathrm
  H} n_{\rm nh} V` in units of :math:`10^{64}` m:math:`^{-3}`, where
  :math:`n_{\mathrm H}` and :math:`n_{\rm nh}` are the Hydrogen
  densities of the ionized and neutral materials, respectively, and
  :math:`V` is the effective interaction volume. Default value: 1.
| ``hden`` : Hydrogen density of the neutral materials in units of
  :math:`10^{20}` m:math:`^{-3}` (or :math:`10^{14}` cm:math:`^{-3}`).
  Default value: :math:`10^{-14}`.
| ``mode`` : Switch between a hot-cold interaction driven by thermal
  motion of hot plasma, and the one dominated by flow velocity. Default
  value: 2 (kinematic).
| ``t`` : the ionization temperature of hot matter in keV. It is also
  used to approximate the thermal motion when mode is set to 1. Default
  value: 1.
| ``sig`` : the width :math:`\sigma_T` of the gaussian emission measure
  profile. Default value: 0. (no temperature distribution i.e.
  isothermal)
| ``sup`` : the width :math:`\sigma_T` of the high-temperature part of
  the gaussian emission measure profile. If larger than :math:`10^{-5}`
  keV, the sig parameter becomes the sigma value for the low-temperature
  end. Default value: 0
| ``logt`` : Switch between linear and logarithmic temperature scale for
  the gaussian emission measure profile. Default value: 1 (logarithmic)
| ``zv`` : Collision velocity in unit of km s\ :math:`^{-1}`, used when
  mode is set to 2. Default value: 100
| ``op`` : Switch between single and multiple collisions for each ion.
  In multiple collision case, one ion would continuously undergo CX and
  produce various emission lines, until it becomes neutral. Default: 1
  (single)
| ``wt`` : Weighting functions for subshell :math:`l-` population. When
  wt is set to 1, the :math:`l-` population is approximated by a series
  of empirical functions that switchs from one to another as a function
  of collision velocity. See :raw-latex:`\citet{gu2016}` for details.
  These empirical functions are defined in Eqs.\ :math:`4-8` of
  :raw-latex:`\citet{gu2016}`, and will be selected when wt is set to
  :math:`2-6`, respectively. Default: 1
| ``vmic`` : the (micro)turbulent velocity :math:`v_{\mathrm{micro}}`,
  in km/s. Default value 0.
| ``ref`` : reference element. Default value 1 (hydrogen). See above for
  more details. The value corresponds to the atomic number of the
  reference element.
| ``01`` : Abundance of hydrogen (H, Z=1) in Solar units. Default 1.
| ``02`` : Abundance of helium (He, Z=2) in Solar units. Default 1.
| :math:`\ldots` ``30`` : Abundance of zinc (Zn, Z=30) in Solar units.
  Default 1.
| ``file`` : Filename for the nonthermal distribution. If not present,
  nonthermal effects are not taken into account (default).
| *Recommended citation:* :raw-latex:`\citet{gu2016}`.

.. [1]
   http://dbshino.nifs.ac.jp/
