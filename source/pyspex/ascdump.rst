Ascdump classes
===============

Running an ascdump command to retrieve internal model parameters will return an object with the
desired values. On this page, the structure of the object returned for a certain ascdump type is
explained. Each section shows the variable names of the parameters such that the numbers can
be accessed.

PLAS: Basic plasma properties
-----------------------------

   .. autoclass:: pyspex.ascdump.Plas
      :members:

ABUN: Elemental abundances
--------------------------

   .. autoclass:: pyspex.ascdump.Abun
      :members:

ICON: Ion concentrations
------------------------

   .. autoclass:: pyspex.ascdump.Icon
      :members:

RATE: Total ionisation, recombination and charge transfer rates
---------------------------------------------------------------

   .. autoclass:: pyspex.ascdump.Rate
      :members:

RION: Ionisation rates per atomic subshell
------------------------------------------

   .. autoclass:: pyspex.ascdump.Rion
      :members:

POP: Occupation numbers and loss and gain rates
-----------------------------------------------

   .. autoclass:: pyspex.ascdump.Pop
      :members:

ELEX: Electron collisional excitation and de-excitation
-------------------------------------------------------

   .. autoclass:: pyspex.ascdump.Elex
      :members:

PREX: Proton collisional excitation and de-excitation
-----------------------------------------------------

   .. autoclass:: pyspex.ascdump.Prex
      :members:

RAD: Radiative transition rates for each level
----------------------------------------------

  .. autoclass:: pyspex.ascdump.Rad
     :members:

TWO: Two-photon emission transition rates
-----------------------------------------

   .. autoclass:: pyspex.ascdump.Two
      :members:

TIME: Ionisation/recombination time scale
-----------------------------------------

   .. autoclass:: pyspex.ascdump.Time
      :members:

REC: Recombination rates per level
----------------------------------

   .. autoclass:: pyspex.ascdump.Rec
      :members:

GRID: Energy and wavelength grid
--------------------------------

   .. autoclass:: pyspex.ascdump.Grid
      :members:

CLIN: Continuum, line and total spectrum
----------------------------------------

   .. autoclass:: pyspex.ascdump.Clin
      :members:

LINE: Line energies, wavelengths and total line emission
--------------------------------------------------------

   .. autoclass:: pyspex.ascdump.Line
      :members:

EBAL: Energy balance contributions
----------------------------------

   .. autoclass:: pyspex.ascdump.Ebal
      :members:

CON: Ions contributing to the continuum
---------------------------------------

   .. autoclass:: pyspex.ascdump.Con
      :members:

TCL: Layer added continuum, line and total spectrum
---------------------------------------------------

   .. autoclass:: pyspex.ascdump.Tcl
      :members:

TCON: Ions contributing to the continuum (added layers)
-------------------------------------------------------

   .. autoclass:: pyspex.ascdump.Tcon
      :members:

POP: Level populations
----------------------

   .. autoclass:: pyspex.ascdump.Pop
      :members:

ELEX: Electron collision excitation and de-excitation
-----------------------------------------------------

   .. autoclass:: pyspex.ascdump.Elex
      :members:

PREX: Proton collision excitation and de-excitation
---------------------------------------------------

   .. autoclass:: pyspex.ascdump.Prex
      :members:

RAD: Radiative transition rates
-------------------------------

   .. autoclass:: pyspex.ascdump.Rad
      :members:

TWO: Two-photon emission
------------------------

   .. autoclass:: pyspex.ascdump.Two
      :members:

TIME: Recombination timescale per ion
-------------------------------------

   .. autoclass:: pyspex.ascdump.Time
      :members:

REC: Recombination and inner-shell ionisation for each level
------------------------------------------------------------

   .. autoclass:: pyspex.ascdump.Rec

NEI: History of ionisation parameter and temperature
----------------------------------------------------

   .. autoclass:: pyspex.ascdump.Nei
      :members:

HEAT: Plasma heating rates
--------------------------

   .. autoclass:: pyspex.ascdump.Heat
      :members:

EBAL: Energy balance calculation
--------------------------------

   .. autoclass:: pyspex.ascdump.Ebal
      :members:

COL: Ionic column densities
---------------------------

   .. autoclass:: pyspex.ascdump.Col
      :members:

TRAN: Transmission and equivalent width of absorption lines and edges
---------------------------------------------------------------------

   .. autoclass:: pyspex.ascdump.Tran
      :members:

Transmission and equivalent width of absorption lines (only)
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

  .. autoclass:: pyspex.ascdump.Tranline
     :members:

Transmission and equivalent width of absorption edges (only)
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

  .. autoclass:: pyspex.ascdump.Tranedge
     :members:

WARM: Column densities, ionisation parameters and temperatures
--------------------------------------------------------------

   .. autoclass:: pyspex.ascdump.Warm
      :members:
