.. _sec:ions:

Ion: select ions for the plasma models
======================================

Overview
~~~~~~~~

For the plasma models, it is possible to include or exclude specific
groups of ions from the line calulations. This is helpful if a better
physical understanding of the (atomic) physics behind the spectrum is
requested.

Currently these settings *only* affect the line emission; in the
calculation of the ionisation balance as well as the continuum always
all ions are taken into account (unless of course the abundance is put
to zero).

A new quicklook mode is introduced in SPEX 3.0. This mode can greatly
reduce computation time by excluding the atomic levels of outer shells
that barely affect the obtained spectrum. The maximum quantum numbers
:math:`n` and :math:`l` of Hydrogen-like ions are provided in
`the table below <#tab:presetnl>`__.

.. warning:: This mode will not work for CX model, since electron
             captured by charge exchange usually populate the outer shells.

.. table:: Preset maximum :math:`n` and :math:`l` for quicklook mode (H-like)

   ======== ============== ============== ========= ============== ============== ======= ============== ==============
   Ion      max. :math:`n` max. :math:`l` Ion       max. :math:`n` max. :math:`l` Ion     max. :math:`n` max. :math:`l`
   ======== ============== ============== ========= ============== ============== ======= ============== ==============
   C VI     16             3              N VII     16             3              O VIII  16             5
   F IX     2              1              Ne X      16             4              Na XI   9              2
   Mg XII   16             4              Al XIII   9              2              Si XIV  16             4
   P XV     5              1              S XVI     16             4              Cl XVII 4              1
   Ar XVIII 13             2              K XIX     4              1              Ca XX   9              2
   Sc XXI   2              1              Ti XXII   4              1              V XXIII 2              1
   Cr XXIV  5              1              Mn XXV    4              1              Fe XXVI 16             4
   Co XXVII 2              1              Ni XXVIII 8              2              Cu XXIX 2              1
   Zn XXX   2              1                                                                            
   ======== ============== ============== ========= ============== ============== ======= ============== ==============

Syntax
~~~~~~

The following syntax rules apply:

| ``ions show`` : Display the list of ions currently taken into account
| ``ions use all`` : Use all possible ions in the line spectrum
| ``ions use iso #i:`` : Use ions of the isoelectronic sequences
  indicated by #i: in the line spectrum
| ``ions use z #i:`` : Use ions with the atomic numbers indicated by #i:
  in the line spectrum
| ``ions use ion #i1 #i2:`` : Use ions with the atomic number indicated
  by #i1 and ionisation stage indicated by #i2: in the line spectrum
| ``ions ignore all`` : Ignore all possible ions in the line spectrum
| ``ions ignore iso #i:`` : Ignore ions of the isoelectronic sequences
  indicated by #i: in the line spectrum
| ``ions ignore z #i:`` : Ignore ions with the atomic numbers indicated
  by #i: in the line spectrum
| ``ions ignore ion #i1 #i2:`` : Ignore ions with the atomic number
  indicated by #i1 and ionisation stage indicated by #i2: in the line
  spectrum
| ``ions nmax all #i:`` : Set maximum :math:`n` for all ions
| ``ions nmax iso #i1: #i2`` : Set maximum :math:`n` to #i2 for
  isoelectronic sequence indicated by #i1
| ``ions nmax z #i1: #i2`` : Set maximum :math:`n` to #i2 for atomic
  number indicated by #i1
| ``ions nmax ion #i1 #i2: #i3`` : Set maximum :math:`n` to #i3 for
  atomic number indicated by #i1 and ionisation stage indicated by #i2.
| ``ions lmax all #i:`` : Set maximum :math:`l` for all ions
| ``ions lmax iso #i1: #i2`` : Set maximum :math:`l` to #i2 for
  isoelectronic sequence indicated by #i1
| ``ions lmax z #i1: #i2`` : Set maximum :math:`l` to #i2 for atomic
  number indicated by #i1
| ``ions lmax ion #i1 #i2: #i3`` : Set maximum :math:`l` to #i3 for
  atomic number indicated by #i1 and ionisation stage indicated by #i2.
| ``ions old all`` : Force the old calculation for all ions
| ``ions old iso #i1:`` : Force the old calculation for the
  isoelectronic sequence indicated by #i1
| ``ions old z #i1:`` : Force the old calculation for atomic number
  indicated by #i1
| ``ions old ion #i1 #i2:`` : Force the old calculation for atomic
  number indicated by #i1 and ionisation stage indicated by #i2.
| ``ions new all`` : Force the new calculation for all ions
| ``ions new iso #i1:`` : Force the new calculation for the
  isoelectronic sequence indicated by #i1
| ``ions new z #i1:`` : Force the new calculation for atomic number
  indicated by #i1
| ``ions new ion #i1 #i2:`` : Force the new calculation for atomic
  number indicated by #i1 and ionisation stage indicated by #i2.

Examples
~~~~~~~~

| ``ions ignore all`` : Do not take any line calculation into account
| ``ions use iso 3`` : Use ions from the :math:`Z=3` (Li) isoelectronic
  sequence
| ``ions use iso 1:2`` : Use ions from the H-like and He-like
  isoelectronic sequences
| ``ions ignore z 26`` : Ignore all iron (:math:`Z=26`) ions
| ``ions use ion 6 5:6`` : Use C V to C VI
| ``ions show`` : Display the list of ions that are used
| ``ions ql`` : Quicklook mode on
| ``ions old ion 6 6`` : Use old calculation for C VI
| ``ions nmax ion 26 25 5`` : Set maximum principal quantum number for
  Fe XXV to :math:`n=5`.
| ``ions lmax ion 26 25 3`` : Set maximum angular momentum quantum
  number for Fe XXV to :math:`\ell=3`.
