Ascdump commands
----------------

The SPEX ascdump command is designed to return internal model parameters in SPEX through terminal
output or an ASCII file. With pyspex we can return these numbers in a python object, making them
directly available in your script. The outputs below have currently been implemented. Each command
returns a specific object with the parameters. A link to the object structure is provided with
every command (see return type).

Basic plasma parameters
"""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_plas

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump_plas(1, 1)
     number of layer lines :        4156           0
    >>> print(asc.cs)
    507.26305074069296      # Sound speed in km/s

Abundances
""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_abun

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump_abun(1,1)
     number of layer lines :        4156           0
    >>> print(asc.name)
    ['H' 'He' 'C' 'N' 'O' 'Ne' 'Na' 'Mg' 'Al' 'Si' 'S' 'Ar' 'Ca' 'Fe' 'Ni']

.. note:: For some versions of numpy, returning a character array leads to a ValueError.

Ion concentrations
""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_icon

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump_icon(1,1)
     number of layer lines :        4156           0
    >>> print(asc.conrel[0])
    1.70394098831e-08

.. note:: For some versions of numpy, returning a character array leads to a ValueError.

Rates per ion
"""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_rate

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump_rate(1,1)
     number of layer lines :        4156           0
    >>> print(asc.irate[0])
    2.12289918977e-08

Rates per process
"""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_rion

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump_rion(1,1)
     number of layer lines :        4156           0
    >>> print(asc.elion[0])
    2.12289912301e-08

Level populations
"""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_pop

Example::

    >>> s.com('cie')
    >>> s.var_calc(True)
    >>> asc = s.ascdump_pop(1,1)
     number of layer lines :     3511799           0
    >>> print(asc.nlev)
    111262

Electron collision excitation and de-excitation rates
"""""""""""""""""""""""""""""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_elex

Example::

    >>> s.com('cie')
    >>> s.var_calc(True)
    >>> asc = s.ascdump_elex(1,1)
     number of layer lines :     3511799           0
    >>> print(asc.exrate)
    [8.35325837e-09 1.08863779e-09 1.68747116e-08 ... 4.41492557e-10
     2.50513539e-10 6.16963868e-12]

Proton collision excitation and de-excitation rates
"""""""""""""""""""""""""""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_prex

Example::

    >>> s.com('cie')
    >>> s.var_calc(True)
    >>> asc = s.ascdump_prex(1,1)
     number of layer lines :     3511799           0
    >>> print(asc.exrate)
    [1.01738931e-10 4.81612313e-12 2.07581551e-10 1.92587482e-11
     ...
     7.49964952e-17 7.82087768e-17 1.67573062e-16 2.56251319e-17]

Radiative transition rates
""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_rad

Example::

    >>> s.com('cie')
    >>> s.var_calc(True)
    >>> asc = s.ascdump_rad(1,1)
     number of layer lines :     3511799           0

Two-photon emission
"""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_two

Example::

    >>> s.com('cie')
    >>> s.var_calc(True)
    >>> asc = s.ascdump_two(1,1)
     number of layer lines :     3511799           0
    >>> print(asc.prob)
    [8.22910023e+00 5.09000015e+01 5.26599976e+02 1.94000000e+03
     ...
     4.76030003e+09 9.88000051e+09 5.82309990e+09]

Recombination timescale
"""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_time

Example::

    >>> s.com('cie')
    >>> s.var_calc(True)
    >>> asc = s.ascdump_time(1,1)
    >>> print(asc.texp)
    [39107415.99632238 -2295115632800309.5 -196243868063781.56
     ...
     -155719028701.42026]

Recombination and inner-shell ionisation
""""""""""""""""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_rec

Example::

    >>> s.com('cie')
    >>> s.var_calc(True)
    >>> asc = s.ascdump_rec(1,1)
    >>> print(asc.arr)
    [1.88556293e-08 3.16058547e-10 2.52684149e-09 ... 0.00000000e+00
     0.00000000e+00 0.00000000e+00]

Energy and wavelength grid
""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_grid

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump_grid(1,1)
     number of layer lines :        4156           0
    >>> print(asc.emean[0])
    0.00100070331246

Continuum and line spectra
""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_clin

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump_clin(1,1)
     number of layer lines :        4156           0
    >>> dir(asc)
    ['__doc__', '__init__', '__module__', 'emean', 'flux', 'fluxcon', 'fluxlin', 'get', 'ibin', 'nbin']

And the total for all the plasma layers:

  .. automethod:: pyspex.spex.Session.ascdump_tcl

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump_tcl(1,1)
     number of layer lines :        4156           0
    >>> dir(asc)
    ['__doc__', '__init__', '__module__', 'emean', 'flux', 'fluxcon', 'fluxlin', 'get', 'ibin', 'nbin']

Line emission
"""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_line

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump_line(1,1)
    >>> asc = s.ascdump_line(1,1)
     number of layer lines :     3511799           0
    --------------------------------------------------------------------
    The following selection criteria were used to generate this output:
    Energy range between   0.100000     and    10.0000     keV.
    Minimum flux level:   1.000000E+35
    See the ascdump set command to change the criteria.
    >>> print(asc.flux)
    [3.40979220e+35 1.99786227e+35 1.76156817e+37 ... 1.33953384e+35
     1.85409623e+35 1.08065805e+35]

Ion contribution to the continuum
"""""""""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_con

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump_con(1,1)

The total contribution for all plasma layers:

  .. automethod:: pyspex.spex.Session.ascdump_tcon

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump_tcon(1,1)

History of ionisation and temperature in NEI
""""""""""""""""""""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_nei

Example::

    >>> s.com('nei')
    >>> asc = s.ascdump_nei(1,1)
     number of layer lines :        4269           0
    >>> dir(asc)
    ['__doc__', '__init__', '__module__', 'get', 'kt', 'nbin', 'u']

Plasma heating rates (photo-ionized)
""""""""""""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_heat

Example::

    >>> s.com('po')
     You have defined    1 component.
    >>> s.com('pion')
     You have defined    2 components.
     ** Pion model: take care about proper COM REL use: check manual!
    >>> s.com_rel(1, 1, numpy.array([2]))
    >>> asc = s.ascdump_heat(1,2)
    >>> dir(asc)
    ['__doc__', '__init__', '__module__', 'cool', 'cooladi', 'coolcom', 'cooldr', 'coolexc', 'coolffe', 'coolion', 'coolrec', 'get', 'heat', 'heataug', 'heatcio', 'heatcom', 'heatdex', 'heatext', 'heatffa', 'heatphi']

Energy balance
""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_ebal

Example::

    >>> s.com('po')
     You have defined    1 component.
    >>> s.com('pion')
     You have defined    2 components.
     ** Pion model: take care about proper COM REL use: check manual!
    >>> s.com_rel(1, 1, numpy.array([2]))
    >>> asc = s.ascdump_ebal(1,2)
    >>> print(asc.cooladi)
    [5.51856103e-44 9.20874021e-44 1.53654277e-43 2.56369787e-43
     ...
     2.17232976e-42 2.17207890e-42]


Ionic column densities in absorption
""""""""""""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_col

Example::

    >>> asc = s.ascdump_col(1,2)
    >>> dir(asc)
    ['__doc__', '__init__', '__module__', 'atom', 'column', 'get', 'ion', 'logcol', 'name', 'nline', 'roman']

Transmission of absorption lines and edges
""""""""""""""""""""""""""""""""""""""""""

For both lines and edges:

  .. automethod:: pyspex.spex.Session.ascdump_tran

For lines only:

  .. automethod:: pyspex.spex.Session.ascdump_tranline

For edges only:

  .. automethod:: pyspex.spex.Session.ascdump_tranedge

Example::

    >>> s.com('po')
    >>> s.com('pion')
    >>> s.com_rel(1,1,numpy.array([2]))
    >>> asc = s.ascdump_tranedge(1,2)
    >>> print(asc.ew)
    [7.63924345e-06 2.29914061e-04 7.08947133e-04 1.54622412e-05
     ...
     4.60384717e-06 7.68042719e-06]

Properties of the warm model
""""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_warm

Example::

    >>> asc = s.ascdump_warm(1,2)
    >>> dir(asc)
    ['__doc__', '__init__', '__module__', 'atom', 'col', 'dndlnxi', 'get', 'ion', 'name', 'nline', 'nxil', 'roman', 't', 'xi', 'xilgrid']
