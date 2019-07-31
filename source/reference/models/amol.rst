Amol: oxygen edge molecules absorption model
============================================

This model calculates the transmission of various molecules.

The following compounds are presently taken into account (see
Table \ `[tab:amol] <#tab:amol>`__).

.. table:: Molecules present in the amol model.

   ========== =================== ========================================================================================================================================= =============== =====
   \                                                                                                                                                                                       
   [tab:amol]                                                                                                                                                                              
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   108        molecular oxygen    O\ :math:`_2`                                                                                                                             O 1s            a
   114        silicon crystal     Si                                                                                                                                        Si 1s           h
   126        metallic iron       Fe                                                                                                                                        Fe 1s,2p        i,j
   2001       water               H\ :math:`_2`\ O                                                                                                                          O 1s            c
   2002       crystalline ice     H\ :math:`_2`\ O                                                                                                                          O 1s            d
   2003       amorphous ice       H\ :math:`_2`\ O                                                                                                                          O 1s            d
   2010       carbon monoxide     CO                                                                                                                                        O 1s            a
   2011       carbon dioxide      CO\ :math:`_2`                                                                                                                            O 1s            a
   2020       laughing gas        N\ :math:`_2`\ O                                                                                                                          O 1s            a,b
   2100       silicon carbide     SiC                                                                                                                                       Si 1s           h
   2101       silicon nitrite     Si\ :math:`_3`\ N\ :math:`_4`                                                                                                             Si 1s           h
   2102       silicon monoxide    SiO                                                                                                                                       Si 1s           h
   2103       quartz              SiO\ :math:`_2`                                                                                                                           Si 1s           h
   2104       silica              SiO\ :math:`_2`                                                                                                                           Si 1s           h
   2200       eskolaite           Cr\ :math:`_2`\ O\ :math:`_3`                                                                                                             O 1s            e
   2300       iron monoxide       FeO                                                                                                                                       Fe 1s           i
   2301       iron oxide          Fe\ :math:`_{1-x}`\ O                                                                                                                     O 1s            e
   2302       magnetite           Fe\ :math:`_3`\ O\ :math:`_4`                                                                                                             O, Fe 1s        e,i
   2303       hematite            Fe\ :math:`_2`\ O\ :math:`_3`                                                                                                             O, Fe 1s; Fe 2p e,i,j
   2304       iron sulfite        FeS\ :math:`_2`                                                                                                                           Fe 1s           i
   2400       nickel monoxide     NiO                                                                                                                                       O 1s            e
   2500       cupric oxide        CuO                                                                                                                                       O 1s            e
   3001       adenine             C\ :math:`_5`\ H\ :math:`_5`\ N\ :math:`_5`                                                                                               O 1s            f
   3100       enstatite           MgSiO\ :math:`_3`                                                                                                                         Si 1s           h
   3101       enstatite_alfa      MgSiO\ :math:`_3`                                                                                                                         Si 1s           h
   3102       enstatite_chondrite Mg\ :math:`_2`\ Si\ :math:`_2`\ O\ :math:`_6`                                                                                             Si 1s           h
   3103       pyroxene            MgSiO\ :math:`_3`                                                                                                                         O 1s            k
   3200       calcite             CaCO\ :math:`_3`                                                                                                                          Ca 1s           g
   3201       aragonite           CaCO\ :math:`_3`                                                                                                                          Ca 1s           g
   3202       vaterite            CaCO\ :math:`_3`                                                                                                                          Ca 1s           g
   3203       perovskite          CaTiO\ :math:`_3`                                                                                                                         O 1s            e
   3300       hercynite           FeAl\ :math:`_2`\ O\ :math:`_4`                                                                                                           O 1s            e
   3301       lepidocrocite       FeO(OH)                                                                                                                                   Fe 2p           j
   3302       fayalite            Fe\ :math:`_2`\ SiO\ :math:`_4`                                                                                                           Fe 1s, 2p       i,j
   3303       iron sulfate        FeSO\ :math:`_4`                                                                                                                          Fe 2p           j
   3304       ilmenite            FeTiO\ :math:`_3`                                                                                                                         O 1s            e
   3305       chromite            FeCr\ :math:`_2`\ O\ :math:`_4`                                                                                                           O 1s            e
   4001       guanine             C\ :math:`_5`\ H\ :math:`_5`\ N\ :math:`_5`\ O                                                                                            O,N 1s          f
   4002       cytosine            C\ :math:`_4`\ H\ :math:`_5`\ N\ :math:`_3`\ O                                                                                            O,N 1s          f
   4003       thymine             C\ :math:`_5`\ H\ :math:`_6`\ N\ :math:`_2`\ O\ :math:`_2`                                                                                O,N 1s          f
   4004       uracil              C\ :math:`_4`\ H\ :math:`_4`\ N\ :math:`_2`\ O\ :math:`_2`                                                                                O,N 1s          f
   4100       andradite           Ca\ :math:`_3`\ Fe\ :math:`_2`\ Si\ :math:`_3`\ O\ :math:`_{12}`                                                                          O 1s            e
   4101       acmite              NaFeSi\ :math:`_2`\ O\ :math:`_6`                                                                                                         O 1s            e
   4102       franklinite         Zn\ :math:`_{0.6}`\ Mn\ :math:`_{0.8}`\ Fe\ :math:`_{1.6}`\ O\ :math:`_4`                                                                 O 1s            e
   4103       olivine             Mg\ :math:`_{1.6}`\ Fe\ :math:`_{0.4}`\ SiO\ :math:`_4`                                                                                   O 1s            e
   4104       almandine           Fe\ :math:`_3`\ Al\ :math:`_2`\ (SiO:math:`_4`)\ :math:`_3`                                                                               O 1s            e
   4105       hedenbergite        CaFeSi\ :math:`_2`\ O\ :math:`_6`                                                                                                         O 1s            e
   5001       dna (herring sperm) C\ :math:`_{39}`\ H\ :math:`_{61}`\ N\ :math:`_{15}`\ O\ :math:`_{36}`\ P\ :math:`_4`                                                     O,N 1s          f
   6001       montmorillonite     Na\ :math:`_{0.2}`\ Ca\ :math:`_{0.1}`\ Al\ :math:`_2`\ Si\ :math:`_4`\ O\ :math:`_{10}`\ (OH):math:`_2`\ (H:math:`_2`\ O)\ :math:`_{10}` Si 1s           h
   6002       nontronite          Na\ :math:`_{0.3}`\ Fe\ :math:`^{3+}_2`\ Si\ :math:`_3`\ AlO\ :math:`_{10}`\ (OH):math:`_2` :math:`\bullet` (H:math:`_2`\ O)              Si 1s           h
   7001       enstatite_paulite   Ca\ :math:`_2`\ Mg\ :math:`_4`\ Al\ :math:`_{0.75}`\ Fe\ :math:`_{0.25}`\ (Si:math:`_7`\ AlO\ :math:`_{22}`)(OH)\ :math:`_2`              Si 1s           h
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   \                                                                                                                                                                                       
   ========== =================== ========================================================================================================================================= =============== =====

The chemical composition of these minerals was mainly taken from the
Mineralogy Database of David Barthelmy [1]_. For DNA we assume equal
contributions of adenine, cytosine, guanine and thymine, plus for each
of these on average one phosphate and one 2-deoxyribose molecule. We
take the cross-sections from the references as listed in
Table \ `[tab:amol] <#tab:amol>`__ in the energy interval where these
are given, and use the cross section for free atoms
:raw-latex:`\citep{verner1995}` outside this range.

:raw-latex:`\citet{vanaken1998}` do not list the precise composition of
iron oxide. We assume here that :math:`x=0.5`.

Some remarks about the data from :raw-latex:`\citet{barrus1979}`: not
all lines are given in their tables, because they suffered from
instrumental effects (finite thickness absorber combined with finite
spectral resolution). However, :raw-latex:`\citet{barrus1979}` have
estimated the peak intensities of the lines based on measurements with
different column densities, and they also list the FWHM of these
transitions. We have included these lines in the table of cross sections
and joined smoothly with the tabulated values.

For N\ :math:`_2`\ O, the fine structure lines are not well resolved by
:raw-latex:`\citet{barrus1979}` Instead we take here the relative peaks
from :raw-latex:`\citet{wight1974}`, that have a relative ratio of 1.00
: 0.23 : 0.38 : 0.15 for peaks 1, 2, 3, and 4, respectively. We adopted
equal FWHMs of 1.2 eV for these lines, as measured typically for line 1
from the plot of Wight. We scale the intensities to the peak listed by
:raw-latex:`\citet{barrus1979}`.

Further, we subtract the C and N parts of the cross section as well as
the oxygen 2s/2p part, using the cross sections of
:raw-latex:`\citet{verner1995}`. At low energy, a very small residual
remains, that we corrected for by subtracting a constant fitted to the
510–520 eV range of the residuals. The remaining cross section at 600 eV
is about 10 % above the Verner cross section; it rapidly decreases; we
approximate the high-E behaviour by extrapolating linearly the average
slope of the ratio between 580 and 600 eV to the point where it becomes
1. The remaining cross section at 600 eV is about 10% above the
:raw-latex:`\citet{verner1995}` cross section; it rapidly decreases; we
approximate the high-E behaviour therefore by extrapolating linearly the
average slope of the ratio between 580 and 600 eV to the point where it
becomes 1.

**Warning:** *The normalisation is the total *molecular* column density.
Thus, a value of :math:`10^{-7}` for CO\ :math:`_2` means
:math:`10^{21}` CO:math:`_2` molecules m\ :math:`^{-2}`, but of course
:math:`2\times 10^{21}` O atoms m\ :math:`^{-2}`, because each
CO\ :math:`_2` molecule contains 2 oxygen atoms.*

**Warning:** *The Table above shows for which edges and atoms the XAFS
are taken into account. For all other edges and atoms not listed there,
we simply use the pure atomic cross-section (without absorption lines).
Note that for almost all constituents this may give completely wrong
cross sections in the optical/UV band, as at these low energies the
effects of chemical binding, crystal structure etc. are very important
for the optical transmission constants. This is contrary to the
SPEX models for pure atomic or ionised gas, where our models can be used
in the optical band.*

**Warning:** *It is possible to change the values of the output atomic
column densities of H–Zn, that are shown when you issue the "show par"
command of SPEX. However, SPEX completely ignores this and when you
issue the "calc" or "fit" commands, they will be reset to the proper
values. Morale: just read of those parameters, don’t touch them!*

The parameters of the model are:

| ``n1--n4`` : Molecular column density in
  :math:`10^{28}` m:math:`^{-2}` for molecules 1–4. Default value:
  :math:`10^{-6}` for molecule 1, and zero for the others.
| ``i1--i4`` : the molecule numbers for molecules 1–4 in the list
  (Table `[tab:amol] <#tab:amol>`__). Default value: 108 (O:math:`_2`)
  for molecule 1, zero for the others. A value of zero indicates that
  for that number no molecule will be taken into account. Thus, for only
  1 molecule, keep *i2–i4* :math:`=0`.
| The following parameters are common to all our absorption models:
  ``f`` : The covering factor of the absorber. Default value: 1 (full
  covering)
| ``zv`` : Average systematic velocity :math:`v` of the absorber
| The following parameters are *only* output parameters:

| ``h--zn`` : The column densities in :math:`10^{28}` m:math:`^{-2}` for
  all *atoms* added together for the all molecules that are present in
  this component.
| *Recommended citation:* :raw-latex:`\citet{pinto2010}`.

.. [1]
   http://webmineral.com/
