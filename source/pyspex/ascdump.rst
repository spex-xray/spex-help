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

TWO: Two-photon emission transition rates
-----------------------------------------

   .. autoclass:: pyspex.ascdump.Two
      :members:

GRID: Energy and wavelength grid
--------------------------------

   .. autoclass:: pyspex.ascdump.Grid
      :members:

CLIN: Continuum, line and total spectrum
----------------------------------------

   .. autoclass:: pyspex.ascdump.Clin
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

WARM: Column densities, ionisation parameters and temperatures
--------------------------------------------------------------

   .. autoclass:: pyspex.ascdump.Warm
      :members:
