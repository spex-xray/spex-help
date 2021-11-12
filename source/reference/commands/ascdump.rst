.. _sec:ascdump:

Ascdump: ascii output of plasma and spectral properties
=======================================================

.. highlight :: none

Overview
~~~~~~~~

One of the drivers in developing SPEX is the desire to be able to get
insight into the astrophysics of X-ray sources, beyond merely deriving a
set of best-fit parameters like temperature or abundances. The general
user might be interested to know ionic concentrations, recombination
rates, individual line fluxes etc. In order to facilitate this SPEX contains options for
output of these properties.

Output of plasma and spectral properties can be obtained for any spectral
component that uses the basic plasma code of SPEX; for all other
components (like power law spectra, gaussian lines, etc.) this
sophistication is not needed and therefore not included. There is a
broad choice of properties that can be displayed.

The user can either display these properties on the screen or write it to a file.

The user can also sort entries according to any column, make selections or provide additional
formatting options.

.. _asc-output-types:

Output types
~~~~~~~~~~~~

The possible output types are listed below. Depending on the specific
spectral model, not all types are allowed for each spectral component.
The keyword in front of each item is the one that should be used for the
appropriate syntax.

Most options give output as a table with several columns. They are labeled here below with T1 after the keyword.
A few options provide only a list of parameters. They are labeled below with T0 after the keyword.

General
'''''''

plas (T0):
   basic plasma properties like temperatures, densities, sound speed, etc.
   (:ref:`Output table properties <tabout:plas>`)

abun (T1):
   elemental abundances and average charge per element.
   (:ref:`Output table properties <tabout:abun>`)

Ionisation balance & rates, timescales
''''''''''''''''''''''''''''''''''''''

icon (T1):
   ion concentrations, both with respect to Hydrogen and the relevant
   elemental abundance. (:ref:`Output table properties <tabout:icon>`)

rion (T1):
   ionization rates per atomic subshell, specified according to the
   different contributing processes. (:ref:`Output table properties <tabout:rion>`)

rate (T1):
   total ionization, recombination and charge-transfer rates specified
   per ion. (:ref:`Output table properties <tabout:rate>`)

time (T1):
   recombination time scale per ion according to Bottorf et al. (2000) definition, and relative
   ion concentrations. Note that the recombination time scale depends upon the
   hydrogen density, so do not forget to set the relevant density in the model.
   (:ref:`Output table properties <tabout:time>`)

Energy level populations and processes contributing to it
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''

pop (T1):
   the occupation numbers as well as upwards/downwards loss and gain
   rates to all quantum levels included. (:ref:`Output table properties <tabout:pop>`)

lev (T1):
   the contributions to the population of the energy levels by various
   processes: positive for gain, negative for loss (:ref:`Output table properties <tabout:lev>`)

elex (T1):
   the collisional excitation and de-excitation rates for each level,
   due to collisions with electrons. (:ref:`Output table properties <tabout:elex>`)

prex (T1):
   the collisional excitation and de-excitation rates for each level,
   due to collisions with protons. (:ref:`Output table properties <tabout:prex>`)

rad (T1):
   the radiative transition rates from each level. (:ref:`Output table properties <tabout:rad>`)

two (T1):
   the two-photon emission transition rates from each level. (:ref:`Output table properties <tabout:two>`)

rec (T1):
   the populating contributions from radiative, dielectronic and
   charge exchange recombination, as well as inner-shell ionisation (:ref:`Output table properties <tabout:rec>`)

Emitted spectrum with continuum and line emission contributions
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

grid (T1):
   the energy and wavelength grid used in the last evaluation of the
   spectrum. (:ref:`Output table properties <tabout:grid>`)

con (T1):
   the free-free, free-bound,
   two-photon and total continuum spectrum, for the last plasma layer of
   the model. (:ref:`Output table properties <tabout:con>`)

tcon (T1):
   the free-free, free-bound,
   two-photon and total continuum spectrum, added for all plasma layers of
   the model. (:ref:`Output table properties <tabout:tcon>`)
   
ccon (T1):
   list of the ions that contribute to the free-free, free-bound and
   two-photon continuum emission, for the last plasma layer of
   the model. (:ref:`Output table properties <tabout:ccon>`)
   
tcco (T1):
   list of the ions that contribute to the free-free, free-bound and
   two-photon continuum emission, combined for all plasma layers of
   the model.

clin (T1):
   the continuum, line and total spectrum for each energy bin for the
   last plasma layer of the model. (:ref:`Output table properties <tabout:clin>`)
   
tcl (T1):
   the continuum, line and total spectrum for each energy bin added for all
   plasma layers of the model. (:ref:`Output table properties <tabout:tcl>`)
   
line (T1):
   emission line energies, fluxes, identifications and various other line properties 
   for each line contributing to the spectrum, for the last
   plasma layer of the model. (:ref:`Output table properties <tabout:line>`)

tlin (T1):
   emission line energies, fluxes, identifications and various other line properties 
   for each line contributing to the spectrum, combined for all
   plasma layers of the model. (:ref:`Output table properties <tabout:tlin>`)

Absorbed spectrum with continuum and line contributions
'''''''''''''''''''''''''''''''''''''''''''''''''''''''

tral (T1):
   absorption line properties (energies, equivalent widths, optical depths, etc) 
   are listed for the hot, pion, slab, xabs and warm models.
   (:ref:`Output table properties for the lines <tabout:tral>`)

trac (T1):
   absorption edge properties (energies, equivalent widths. optical depths, etc)  
   are listed for the hot, pion, slab, xabs and warm models.
   (:ref:`Output table properties for the lines <tabout:trac>`)

col (T1):
   the ionic column densities for the hot, pion, slab, xabs and warm
   models (:ref:`Output table properties for the lines <tabout:col>`)

wcol (T1):
   similar to the *col* option, but in addition the effective ionization parameters and
   temperatures of the *warm* model only.

warm (T1):
   the column densities and ionisation parameters of the *warm* model

Energy balance for photoionized plasmas only
''''''''''''''''''''''''''''''''''''''''''''

heat (T0):
   heating and cooling rates for various processes
   (:ref:`Output table properties <tabout:heat>`)

ebal (T1):
   the energy balance contributions of each layer (only for photoionized
   plasmas). (:ref:`Output table properties <tabout:ebal>`)

Non-equilibrium ionisation, supernova remnant and cluster models
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

nei (T1):
   the history of ionisation parameter and temperature in NEI
   calculations. (:ref:`Output table properties <tabout:nei>`)

snr (T0):
   hydrodynamical and other properties of the supernova remnant (only
   for supernova remnant models such as Sedov, Chevalier etc.).
   (:ref:`Output table properties <tabout:snr>`)

clus (T1):
   the hydrodynamical parameters of the cluster as a function of radius.

clup (T1):
   projected radial profile (photon and energy flux) within specified energy bands, as a function of projected radius.


Differential emission measure models
''''''''''''''''''''''''''''''''''''

dem (T1):
   the emission measure distribution (for the pdem model)
   (:ref:`Output table properties <tabout:dem>`)

Output devices
~~~~~~~~~~~~~~

The following output options are currently implemented:

ter:
   output to the screen of the terminal

file:
   output to an ascii-file; the file name has to beprovided by the user, without exttension (.asc will be appended)

fits:
   output to a file in fits-format; the full file name has to be provided by the user, including any extensions, if desired.

Selection, sorting and formatting of the data
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The data can be sorted according to any column of the table, and the user can make selections of which data
to display in the output. Further, for ascii-type of output, more formatting options of the data are possible.
The information on sorting, selection and formatting should be provided by the user, in an ascii-file.
The user then provides the name of this ascii-file after the "key" word in the command (see the syntax below).
Note that this file must be in the directory where you run SPEX, or you should add the relevant path to the file
in the name that you provide to SPEX. The file is read each time that you issue the output-option, so if you would
like to investigate more output options for the same model, you can use separate files for each item, e.g. a file
myplas.dat for the plasma output, and myline.dat for the emission line properties.

The selection file contains a number of lines with on each line one and only one instruction for the selection,
sorting and formatting. Each line hast to start with one of the words *sel*, *sor* or *for* for selection,
sorting and formatting respectively. The order od these lines is arbitrary. After the first keyword the acronym
for the relevant column should be given, followed, if relevant, by the numerical range. We specify this
in more detail below:

| sel: the user can make up to 10 selections simultaneously. After the *sel* word, 
  the acronym of the relevant column should be given, followed by two numbers: 
  the minimum and maximum value of the entry in this column that should be used for the selection;
  all entries with column values below this minimum and above this maximum will be omitted from the final output.
  If the user wants only one value, for example only atomic number 26, then simply use this number for both the
  minimum and maximum value. See also the example below. Selection only works for columns with logical, integer
  or real numbers; you cannot make selection on ascii-columns, but for almost all ascii-type columns, there is
  an equivalent numerical column that can be used for selection.
| sor: the user can sort on any column. Only one sorting instruction is allowed. Like for the selection option,
  only non-ascii columns can be used
  for sorting.
| for: for ascii-type of output (both on the terminal and on an ascii-file), the number of significant digits
  to be displayed can be changed by the user. In general the standard settings are fine, but this option allows
  to show more, less or no digits at all. It is explained best in the example below.
|

**Example:** We use here the "line" output option on the terminal for sector 1, component 1. We issue the following
command for SPEX::

    asc ter 1 1 line key mysel.dat

And the file mysel.dat (in the current working directory) contains the following text lines::

    sel iz 26 26
    sel jz 16 18
    sel ener 0.5 2.0
    sor watt
    for flux 1
    for wave 15
    for ion 0

What you will see then on your screen is the following:

- only lines with atomic number 26 (the acronym for that is "iz")
- only lines with ionistion stage between 16-18 (i.e., Fe XVI to Fe XVIII)
- only lines with energy between 0.5 and 2.0 keV
- the lines are sorted according to their energy flux (as contained in the column labeled "watt")
- the column flux is displayed with only 1 significant digit behind the period, i.e. you get a number like 2.3E+32,
  rather than the default for this column of 2.349E+32
- the column with the wavelength (acronym "wave") will display with 15 signifcant digits, rather than the default
  6 digits for this column.
- the column with acronym "ion" representing the ion number will not be displayed at all (width 0).

See the relevant subsection of :ref:`asc_output-types` for the column acronyms to be used in the file for the selection, sorting and formatting of the data.

Syntax
~~~~~~

The following syntax rules apply for ascii output:

| ``ascdump terminal #i1 #i2 #a`` : Dump the output for sky sector #i1
  and component #i2 to the terminal screen; the type of output is
  described by the parameter #a which is listed in the table above.
| ``ascdump terminal #i1 #i2 #a1 key #a2`` : As above, but argument #a2 that follows the mandatory word "key"
  is the name of a the file setting the sorting, selection and formatting of the columns
| ``ascdump file #a1 #i1 #i2 #a2`` : As above, but output written to an ascii
  file with its name given by the parameter #a1. The suffix ".asc" will
  be appended automatically to this filename.
| ``ascdump file #a1 #i1 #i2 #a2 key #a3`` : As above, but argument #a3 that follows the mandatory word "key"
  is the name of a the file setting the sorting, selection and formatting of the columns
| ``ascdump fits #a1 #i1 #i2 #a2`` : As above, but output written to a fits-format
  file with its name given by the parameter #a1. Contrary to the *file* option, no suffix is
  appended to this filename.
| ``ascdump fits #a1 #i1 #i2 #a2 key #a3`` : As above, but argument #a3 that follows the mandatory word "key"
  is the name of a the file setting the sorting, selection and formatting of the columns

.. warning:: Any existing files with the same name will be overwritten.

Examples
~~~~~~~~

| ``ascdump terminal 3 2 icon`` : dumps the ion concentrations of
  component 2 of sky sector 3 to the terminal screen.
| ``ascdump file mydump 3 2 icon`` : dumps the ion concentrations of
  component 2 of sky sector 3 to an ascii-file named mydump.asc.
| ``ascdump fits mydump.fits 3 2 icon`` : dumps the ion concentrations of
  component 2 of sky sector 3 to a fits-file named mydump.fits.
| ``ascdump terminal 3 2 line key mysel.sel`` : dumps the emission line properties
  of component 2 of sky sector 3 to the terminal screen, using selections, sorting and formatting
  options as described in the file mysel.sel

