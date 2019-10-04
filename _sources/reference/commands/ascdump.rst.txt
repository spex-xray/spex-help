.. _sec:ascdump:

Ascdump: ascii output of plasma properties
==========================================

Overview
~~~~~~~~

One of the drivers in developing SPEX is the desire to be able to get
insight into the astrophysics of X-ray sources, beyond merely deriving a
set of best-fit parameters like temperature or abundances. The general
user might be interested to know ionic concentrations, recombination
rates etc. In order to facilitate this SPEX contains options for
ascii-output.

Ascii-output of plasma properties can be obtained for any spectral
component that uses the basic plasma code of SPEX; for all other
components (like power law spectra, gaussian lines, etc.) this
sophistication is not needed and therefore not included. There is a
choice of properties that can be displayed, and the user can either
display these properties on the screen or write it to file.

The possible output types are listed below. Depending on the specific
spectral model, not all types are allowed for each spectral component.
The keyword in front of each item is the one that should be used for the
appropriate syntax.

plas:
   basic plasma properties like temperature, electron density etc.

abun:
   elemental abundances and average charge per element.

icon:
   ion concentrations, both with respect to Hydrogen and the relevant
   elemental abundance.

rate:
   total ionization, recombination and charge-transfer rates specified
   per ion.

rion:
   ionization rates per atomic subshell, specified according to the
   different contributing processes.

pop:
   the occupation numbers as well as upwards/downwards loss and gain
   rates to all quantum levels included.

lev:
   the contributions to the pouplation of the energy levels by various
   processes: positive for gain, negative for loss

elex:
   the collisional excitation and de-excitation rates for each level,
   due to collisions with electrons.

prex:
   the collisional excitation and de-excitation rates for each level,
   due to collisions with protons.

rad:
   the radiative transition rates from each level.

two:
   the two-photon emission transition rates from each level.

grid:
   the energy and wavelength grid used in the last evaluation of the
   spectrum.

clin:
   the continuum, line and total spectrum for each energy bin for the
   last plasma layer of the model.

line:
   the line energy and wavelength, as well as the total line emission
   (photons/s) for each line contributing to the spectrum, for the last
   plasma layer of the model. Also given is the natural line width and
   the Doppler broadening (including thermal and turbulent broadening),
   expressed as a FWHM in keV. Optionally, the results can be sorted
   according to various columns as follows (first description, between
   brackets the acronym): energy (ener), wavelength (wav), ion (ion),
   line power (powe), natural line width (wid).

con:
   list of the ions that contribute to the free-free, free-bound and
   two-photon continuum emission, followed by the free-free, free-bound,
   two-photon and total continuum spectrum, for the last plasma layer of
   the model.

tcl:
   the continuum, line and total spectrum for each energy bin added for
   all plasma layers of the model.

tlin:
   the line energy and wavelength, as well as the total line emission
   (photons/s) for each line contributing to the spectrum, added for all
   plasma layers of the model.

tcon:
   list of the ions that contribute to the free-free, free-bound and
   two-photon continuum emission, followed by the free-free, free-bound,
   two-photon and total continuum spectrum, added for all plasma layers
   of the model.

cnts:
   the number of counts produced by each line. Needs an instrument to be
   defined before.

nei:
   the history of ionisation parameter and temperature in NEI
   calculations.

snr:
   hydrodynamical and other properties of the supernova remnant (only
   for supernova remnant models such as Sedov, Chevalier etc.).

heat:
   plasma heating rates (only for photoionized plasmas).

ebal:
   the energy balance contributions of each layer (only for photoionized
   plasmas).

dem:
   the emission measure distribution (for the pdem model)

col:
   the ionic column densities for the hot, pion, slab, xabs and warm
   models

tran:
   the transmission and equivalent width of absorption lines and
   absorption edges for the hot, pion, slab, xabs and warm models.
   Optionally, the results (lines only) can be sorted according to
   various columns as follows (first description, between brackets the
   acronym): energy (ener), wavelength (wav), ion (ion), optical depth
   at line center (tau), equivalent width in keV (ewk), equivalent width
   in Å (ewa), Voigt a parameter (avo).

warm:
   the column densities, effective ionization parameters and
   temperatures of the *warm* model

Syntax
~~~~~~

The following syntax rules apply for ascii output:

| ``ascdump terminal #i1 #i2 #a`` : Dump the output for sky sector #i1
  and component #i2 to the terminal screen; the type of output is
  described by the parameter #a which is listed in the table above.
| ``ascdump file #a1 #i1 #i2 #a2`` : As above, but output written to a
  file with its name given by the parameter #a1. The suffix ".asc" will
  be appended automatically to this filename.
| ``ascdump terminal #i1 #i2 #a1 sort #a2`` : Dump the output for sky
  sector #i1 and component #i2 to the terminal screen; the type of
  output is described by the parameter #a1 which is listed in the table
  above; the results are sorted according to parameter #a2. Sorting is
  only possible for the "line" and "tran" options; see there for allowed
  entries.
| ``ascdump file #a1 #i1 #i2 #a2`` : As above, but output written to a
  file with its name given by the parameter #a1. The suffix ".asc" will
  be appended automatically to this filename.

.. warning:: Any existing files with the same name will be overwritten.
.. warning:: Sorting only possible for the line and tran options.

Examples
~~~~~~~~

| ``ascdump terminal 3 2 icon`` : dumps the ion concentrations of
  component 2 of sky sector 3 to the terminal screen.
| ``ascdump file mydump 3 2 icon`` : dumps the ion concentrations of
  component 2 of sky sector 3 to a file named mydump.asc.
| ``ascdump terminal 3 2 line sort pow`` : dumps the emission line power
  of component 2 of sky sector 3 to the terminal screen, sorted
  according to line strength.
