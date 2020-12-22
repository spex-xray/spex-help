.. _sec:ions:

Ion: select ions for the plasma models
======================================

.. highlight:: none

Overview
--------

For the plasma models, it is possible to include or exclude specific
groups of ions from the line calculations. This is helpful if a better
physical understanding of the (atomic) physics behind the spectrum is
requested.

In addition, there is an option to mute particular lines in the spectrum
for specific analysis purposes.

There are two main reasons why the user may use this option: computational speed
and educational reasons. 

Computational speed
'''''''''''''''''''

The first reason is **accelerating the calculations**. For complex spectral models, 
the computational time may be long due to the large number of ions and transitions
that need to be taken into account, in particular for the line calculations.

By reducing the number of ions in the calculation, or using a maximum principal
quantum number, or other reductions, allow to make the calculations faster by simply
skipping the line emission from those transitions. Note that obviously this leads
to less accurate spectra as compared to the full calculation. Technically,
it is done by using the "ions ignore ..." or "ions use ..." commands (for getting
rid of, or including line emission from specific ions), or the "ions nmax ..." or 
"ions lmax ..." commands, to reduce the maximum principal quantum number 
:math:`n` and the maximum orbital quantum number :math:`l`, respectively.
Also, by using the "ions old ..." and "ions new ..." commands one may switch between
the default (new) spex calculations and the (old) *mekal* calculations.
See :ref:`sect:performance` for more details.

A minor note must be made here: when excluding a single ion, the calculations
becomes less accurate, because level populations of ions depend also on how many
ionisations or recombinations occur from levels of neighbouring ions. By ignoring
an ion, it also cannot contribute to its neighbours.

Currently these settings *only* affect the line emission; in the
calculation of the ionisation balance as well as the continuum always
all ions are taken into account (unless of course the abundance is put
to zero).

Diagnostics & education
'''''''''''''''''''''''

The second reason to include or exclude ions is for 
**diagnostic or educational reasons**. It may be of interest to know how the spectrum
of a single ion looks, or how the total spectrum would look without an ion.
For such cases, SPEX has the "ions mute ..." or its inverse "ions unmute ..."
commands. 

Contrary to the use/ignore commands, with this command the full spectrum
is calculated, and only at the last step the contribution of the ion is muted or
unmuted. Also, contrary to the use/ignore commands, this option works on the
full spectrum (continuum and lines, both in emission and absorption). Finally,
take care when combining the use/ignore with the mute/unmute commands.
Whenever you ignore an ion, it will not be calculated and in those cases the
mute or unmute commands are not effective.

Finally, when you use the mute/unmute commands, it will also affect the ascii
output for a few important output options, like the "line" and "tra" options for
line emission or absorption.

.. warning:: When using the pion model with this option, you will get a different
   solution, because it affects the heating and cooling rates, and thus the
   ionisation balance (equilibrium temperature).
   Exception is when you use the tmod=1 option for pion, which forces the
   temperature to be equal to what you prescribe through parameter tinp.
   For diagnosing the heating/cooling contributions of ions or elements, it is
   therefore recommended to run first the model with all ions,
   make an ascii-output of the plasma parameters, take the temperature from
   there as the "tinp" parameter, and set tmod=1.
   You can play then with the mute/unmute command.

Quicklook
'''''''''

A new **quicklook mode** is introduced in SPEX 3.0. This mode can greatly
reduce computation time by excluding the atomic levels of outer shells
that barely affect the obtained spectrum. The maximum quantum numbers
:math:`n` and :math:`l` of Hydrogen-like ions are provided in
the table below.

The quicklook mode is enabled by the command::

    SPEX> ions ql

To undo the quicklook mode, just type ``ions use all``.

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

Mute lines
''''''''''

A new feature since version 3.06.01 is the line mute command. In some cases,
when users what to study a particular line, they want to remove the line
from the spectrum to replace it, for example, with a delta line or Gaussian.

The ``ions mute line`` command allows to mute up to 10 spectral lines
identified from the ``asc ter line`` output. Please note that this command
only works for SPEXACT v3 (``var calc new``). When SPEXACT v3 is enabled, the
``ascdump line`` command (:ref:`sec:ascdump`) will show a line list with line
id numbers::

      1   O  VIII   1s 2S1/2                         - 2p 2P1/2                        0.6534939       18.97252      1.418E+42  1.689E-06  3.957E-04
      2   O  VIII   1s 2S1/2                         - 2s 2S1/2                        0.6535030       18.97225      1.011E+39  1.419E-12  3.957E-04
      3   O  VIII   1s 2S1/2                         - 2p 2P3/2                        0.6536802       18.96711      2.834E+42  1.691E-06  3.958E-04

In the example of O VIII above, the line id is listed as an integer in the first
column before O VIII. To not show the O VIII Lya lines in the spectrum, they can
be muted with the command::

    SPEX> ions mute line 1 ion 8 8
    SPEX> ions mute line 3 ion 8 8

Where the number behind ``line`` is the line id, and the numbers behind ``ion``
are the atomic number and ionisation stage, respectively. If necessary, the
lines can be unmuted with the ``ions unmute line`` command which has a very
similar syntax.

Syntax
------

The following syntax rules apply:

| ``ions show`` : Display the list of ions currently taken into account
| ``ions use all`` : Use all possible ions in the calculation of the
  line spectrum. This is the default at startup of the program.
| ``ions use iso #i:`` : Use ions of the iso-electronic sequences
  indicated by #i: in the line spectrum
| ``ions use z #i:`` : Use ions with the atomic numbers indicated by #i:
  in the line spectrum
| ``ions use ion #i1 #i2:`` : Use ions with the atomic number indicated
  by #i1 and ionisation stage indicated by #i2: in the line spectrum
| ``ions ignore all`` : Ignore all possible ions in the calculation of the 
  line spectrum
| ``ions ignore iso #i:`` : Ignore ions of the iso-electronic sequences
  indicated by #i: in the line spectrum
| ``ions ignore z #i:`` : Ignore ions with the atomic numbers indicated
  by #i: in the line spectrum
| ``ions ignore ion #i1 #i2:`` : Ignore ions with the atomic number
  indicated by #i1 and ionisation stage indicated by #i2: in the line
  spectrum
| ``ions unmute all`` : Display the contributions of all possible ions 
  in the final spectrum. This is the default at startup of the program.
| ``ions unmute iso #i:`` : Display ions of the iso-electronic sequences
  indicated by #i: in the spectrum
| ``ions unmute z #i:`` : Display ions with the atomic numbers indicated by #i:
  in the spectrum
| ``ions unmute ion #i1 #i2:`` : Display ions with the atomic number indicated
  by #i1 and ionisation stage indicated by #i2: in the spectrum
| ``ions mute all`` : Ignore all possible ions in the display of the 
  spectrum; will create a zero emission or transmission spectrum! Most useful
  when followed immieditately by a "ions unmute ..." command
| ``ions mute iso #i:`` : Do not display ions of the iso-electronic sequences
  indicated by #i: in the spectrum
| ``ions ignore z #i:`` : Do not display ions with the atomic numbers indicated
  by #i: in the spectrum
| ``ions ignore ion #i1 #i2:`` : Do not display ions with the atomic number
  indicated by #i1 and ionisation stage indicated by #i2: in the 
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
| ``ions mute line #i1 ion #i2 #i3`` : Mute a line with id #i1 for
  element #i2 at ionisation stage #i3.
| ``ions unmute line #i1 ion #i2 #i3`` : Unmute a line with id #i1 for
  element #i2 at ionisation stage #i3.

Examples
--------

| ``ions ignore all`` : Do not take any line calculation into account
| ``ions use iso 3`` : Use ions from the :math:`Z=3` (Li) iso-electronic
  sequence
| ``ions use iso 1:2`` : Use ions from the H-like and He-like
  isoelectronic sequences
| ``ions ignore z 26`` : Ignore all iron (:math:`Z=26`) ions
| ``ions use ion 6 5:6`` : Use C V to C VI
| ``ions mute ion 8 7`` : does eliminate the O VII continuum and lines from
  the displayed spectrum
| ``ions unmute iso 2`` : shows the emission from all He-like ions (again).
| ``ions show`` : Display the list of ions that are used
| ``ions ql`` : Quicklook mode on
| ``ions old ion 6 6`` : Use old calculation for C VI
| ``ions nmax ion 26 25 5`` : Set maximum principal quantum number for
  Fe XXV to :math:`n=5`.
| ``ions lmax ion 26 25 3`` : Set maximum angular momentum quantum
  number for Fe XXV to :math:`\ell=3`.
| ``ions mute line 1 ion 8 8`` : Mute line id 1 for O VIII.
| ``ions unmute line 1 ion 8 8`` : Unmute line id 1 for O VIII.
