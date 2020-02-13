Model related commands
----------------------

A SPEX model is organised in sectors and components. Sectors are groups of components that model
a particular source of radiation. Below, the basic commands for building the model and change its
parameters are listed.

Abundance
^^^^^^^^^

The solar abundance table used is set in SPEX using the ``abundance`` command. In PYSPEX, this
is abbreviated to ``abun``. The desired abundance table should be loaded by providing the
abbreviation for the table (``abunset``):

  .. automethod:: pyspex.spex.Session.abun

The possible abundance tables are:

* ``reset``: Lodders et al. (2009)
* ``allen``: Allen (1973)
* ``ra``: Ross & Aller (1976)
* ``grevesse``: Grevesse et al. (1992)
* ``gs``: Grevesse & Sauval (1998)
* ``lodders``: Lodders proto-Solar (2003)
* ``solar``: Lodders Solar Photospheric (2003)
* ``ag``: Anders & Grevesse (1989)
* ``asplund``: Asplund et al. (2009)

The ``abun`` command returns an object with the abundance information, which can optionally
be assigned to a parameter and be accessed through Python. See the advanced class descriptions
for details.

For example::

    >>> a = s.abun('asplund')
    >>> dir(a)
    ['__doc__', '__init__', '__module__', 'get', 'index', 'list', 'ref', 'set', 'update']

Abundance show
""""""""""""""
To show the current abundance table, use the ``abun_show`` method:

  .. automethod:: pyspex.spex.Session.abun_show

The method returns the reference as a text string::

    >>> ab = s.abun_show()
    Lodders et al. (2009)
    >>> print(ab)
    Lodders et al. (2009)

Ascdump
^^^^^^^

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

Ionic column densities in absorption
""""""""""""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_col

Example::

    >>> asc = s.ascdump_col(1,2)
    >>> dir(asc)
    ['__doc__', '__init__', '__module__', 'atom', 'column', 'get', 'ion', 'logcol', 'name', 'nline', 'roman']

Properties of the warm model
""""""""""""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump_warm

Example::

    >>> asc = s.ascdump_warm(1,2)
    >>> dir(asc)
    ['__doc__', '__init__', '__module__', 'atom', 'col', 'dndlnxi', 'get', 'ion', 'name', 'nline', 'nxil', 'roman', 't', 'xi', 'xilgrid']

Calculate
^^^^^^^^^

Once the model sectors and components are set-up and the parameters are set, the model spectrum
can be calculated using the SPEX ``calculate`` command. For convenience, this command has been
abbreviated to ``calc`` in PYSPEX.

  .. automethod:: pyspex.spex.Session.calc

Example::

    >>> s.calc()

Components
^^^^^^^^^^

Spectral components, like power laws, thermal and absorption models are loaded using the
SPEX ``comp`` command. Since the command is often typed simply as ``com`` in practice, the
PYSPEX command is also ``com``:

  .. automethod:: pyspex.spex.Session.com

The command adds a component by default to sector 1. If the component should be added to a
different sector, then please use the optional ``isect`` parameter to specify the target sector.

For example::

    >>> s.com('cie')
    >>> s.com('po', isect=2)

See the SPEX reference manual for a list of spectral components.

Component delete
""""""""""""""""
Deleting a component from the model is done using the sector and component number of the component.

  .. automethod:: pyspex.spex.Session.com_del

For example::

    >>> s.com_del(1,1)

The command above deletes the first component in sector number 1.

Component relate
""""""""""""""""
The relation between the additive and multiplicative components is set with a ``com rel`` command
in SPEX. In PYSPEX this is:

  .. automethod:: pyspex.spex.Session.com_rel

The relations are set per component (so no ranges, unfortunately) and the related multiplicative
models should be entered (in the right order) using a numpy array. For example::

    >>> s.com('reds')
    >>> s.com('hot')
    >>> s.com('cie')
    >>> s.com_rel(1, 3, numpy.array([1,2]))


Distance
^^^^^^^^

To calculate fluxes and luminosities, SPEX needs an assumed distance of the source. In SPEX this
is done with the ``distance`` command. In PYSPEX this is abbreviated to ``dist`` for convenience.

The distance can be set with the dist command:

  .. automethod:: pyspex.spex.Session.dist

where ``isect`` is the sector number, ``dist`` the distance (float) and ``unit`` the unit of the
distance that is put in. The function returns an object containing the distance in all available
units.

Examples::

    >>> d = s.dist(1,0.5,'z')     # Redshift of z=0.5
    >>> d = s.dist(1,2.0,'kpc')   # Distance of 2 kiloparsec
    >>> dir(d)
    ['__doc__', '__init__', '__module__', 'age', 'au', 'cz', 'get', 'h0', 'kpc', 'ly', 'm', 'mpc', 'omega_l', 'omega_m', 'omega_r', 'pc', 'set', 'set_cosmo', 'z']

If you do not want to set the distance, but just get the current parameters, the ``dist_get``
command can be used:

  .. automethod:: pyspex.spex.Session.dist_get

Like the dist command, this method returns an object with the distances in all available units.

Cosmology
"""""""""

Next to the distance, the cosmology used by SPEX can also be specified. In SPEX all parameters
should be provided through seperate lines, but in PYSPEX this has been combined in one command:

  .. automethod:: pyspex.spex.Session.dist_cosmo

The commands needs values for the Hubble constant ``h0`` (70 km/s/Mpc), Omega Matter ``omega_m``
(0.3), Omega Lambda ``omega_l`` (0.7) and Omega R ``omega_r`` (0.0). For example::

    >>> s.dist_cosmo(75,0.33,0.67,0.0)

(The command will write the distances 4 times to the terminal since in the background all
SPEX commands are executed separately...)

Energy grid
^^^^^^^^^^^

The model energy grid can be manipulated with the SPEX ``egrid`` command. In PYSPEX, this command
has been splitted into two varieties:

  .. automethod:: pyspex.spex.Session.egrid
  .. automethod:: pyspex.spex.Session.egrid_step

For the first method, ``egrid``, the number of spectral bins ``nbins`` is known, while for
``egrid_step`` the step size (``step``) is an input value. The lowest and highest energy of
the grid needs to be provided using the ``elow`` and ``ehigh`` input values. The unit is a
text string and the grid can be logarithmic if the ``log`` parameter is set to ``True``.

Examples::

    >>> s.egrid(0.1,10.,9990,'kev',True)
    >>> s.egrid_step(0.1,10.,0.01,'kev',False)

Reading & saving grids
""""""""""""""""""""""
Grids can also be save and read from a text file. The two methods below save and read a ``.egr``
file, respectively:

  .. automethod:: pyspex.spex.Session.egrid_save
  .. automethod:: pyspex.spex.Session.egrid_read

The ``savefile`` or ``readfile`` parameter should provide the method with the filename to save
or read, including the ``.egr`` extension! If necessary, the full path to the file can be included.

Examples::

    >>> s.egrid_save('mygrid.egr')
    >>> s.egrid_read('mygrid.egr')

Get & set custom grids
""""""""""""""""""""""
If the grid needs to be transfered from or to Python memory, then the ``get`` and ``set`` methods
can be used:

  .. automethod:: pyspex.spex.Session.egrid_get
  .. automethod:: pyspex.spex.Session.egrid_set

The ``get`` routine returns a Python object with the egrid arrays. The ``set`` routine requires
an ``ebounds`` numpy array containing the energies of the bin boundaries. Note that the number
of elements of this array would be of length n + 1, where n is the number of bins in the array.

Examples::

    >>> grid = s.egrid_get()
    >>> ebounds = 0.1 + 0.01 * numpy.arange(9991, dtype=float)
    >>> s.egrid_set(ebounds)

Flux & Luminosity
^^^^^^^^^^^^^^^^^

For each component, the fluxes and luminosities are calculated using the set distance and energy
boundaries. These energy limits for the flux and luminosity can be set using the ``elim`` command:

  .. automethod:: pyspex.spex.Session.elim

where ``elow`` is the lower boundary of the flux and ``ehigh`` the higher boundary. The ``unit``
determines the units of the input values, for example 'kev' for keV.

Examples::

    >>> s.elim(13.6E-3,13.6,'kev')

Get flux
""""""""
The fluxes and luminosities calculated in SPEX can be extracted using the ``flux_get`` method.

  .. automethod:: pyspex.spex.Session.flux_get

The values are returned in a python object so that they can be accessed easily::

    >>> flx = s.flux_get(1,1)
    >>> print flx.enerflux
    1.51011622912e-18

For the details about the contents of the object, see the advanced class description of the
Fluxes class.

Ionisation balance
^^^^^^^^^^^^^^^^^^

There are several ionisation balances available in SPEX. The Urdampilleta ionisation balance
is the current default set.

The ionisation balance can be set using the ``ibal`` method:

  .. automethod:: pyspex.spex.Session.ibal

The ``ref`` is the short text string describing the paper reference for the ionisation balance:

* ``ar92``: Arnaud & Raymond (1992) for Fe, Arnaud & Rothenflug (1985) for other elements.
* ``ar85``: Arnaud & Rothenflug (1985).
* ``oldbryans``: Old Bryans et al. data (NOT recommended).
* ``bryans09``: Bryans et al. (2009).
* ``u17``: Urdampilleta et al. (2017).

Examples::

    >>> s.ibal('u17')

Show
""""

To show the current ionisation balance, the ``ibal_show`` method can be used:

  .. automethod:: pyspex.spex.Session.ibal_show

This method returns the reference of the ionisation balance as a string.

Example::

    >>> ib = s.ibal_show()
    Urdampilleta et al. (2017)

Ion selection
^^^^^^^^^^^^^

In original SPEX models that use the SPEX atomic data, ions can be turned on or off, or can be
calculated using the old SPEX version 2 or the new SPEX version 3. In addition, the maximum
principle quantum number (nmax) and the maximum angular momentum (lmax) can be set.

The functions have been created such that each function selects the ions either by atomic number,
iso-electronic sequence or ion.

.. automethod:: pyspex.spex.Session.ions_all

.. automethod:: pyspex.spex.Session.ions_iso

.. automethod:: pyspex.spex.Session.ions_z

.. automethod:: pyspex.spex.Session.ions_ion

Show
""""

The ion selections can be shown by calling the ``ions_show`` function below:

.. automethod:: pyspex.spex.Session.ions_show


Setting parameters
^^^^^^^^^^^^^^^^^^

Model parameters in SPEX are set using the ``par`` command. Since this command has subcommands,
there are a number of methods to cover most of the functionality in PYSPEX. The most basic function
is to set a parameter value and determine whether it should be free in the fit or thawn. These
functions have been combined into one:

  .. automethod:: pyspex.spex.Session.par
  .. automethod:: pyspex.spex.Session.par_text

The ``par`` method is used for setting numerical values. It needs the sector number (isect),
component number (icomp) and the name of the parameter (name) to set. Optionally, the
parameter can be set free by setting ``thawn`` to True.

For text values, like filenames of model input files, the ``par_text`` method is used. The
usage is very similar to the ``par`` method, but just with the difference a text string is
passed instead of a value. Text parameters cannot be free parameters as well.

Examples::

    >>> s.par(1, 1, 'norm', 1E+8, thawn=True)
    >>> s.par_text(1, 1, file, 'dist.dat')

Fix & Free parameters
"""""""""""""""""""""
Many times, we want to fix and free parameters without changing the values. For this purpose,
two convenience functions have been created:

  .. automethod:: pyspex.spex.Session.par_fix
  .. automethod:: pyspex.spex.Session.par_free

``par_fix`` and ``par_free`` fix and free the parameter with name (``name``) in sector (``isect``)
and component (``icomp``).

Examples::

    >>> s.par_free(1,1,'26')
    >>> s.par_fix(1,1,'t')

Parameter range
"""""""""""""""
Parameters have ranges in which they can be safely varied without causing undesired errors or
unphysical results. These ranges can be set using the ``par_range`` method:

  .. automethod:: pyspex.spex.Session.par_range

In addition to the sector number (``isect``), component number (``icomp``), and the parameter
name (``name``), this function needs the lower (``rlow``) and upper range (``rupp``) limits of
the parameter.

Example::

    >>> s.par_range(1,1,'t',0.1,10.)

Couple parameters
"""""""""""""""""
Parameters can be coupled to each other such they have the same values in the fit. Or, optionally,
remain coupled with a given multiplication factor. The PYSPEX method for this is ``par_couple``:

  .. automethod:: pyspex.spex.Session.par_couple

The parameter located in ``isect``, ``icomp`` and with ``iname`` will be coupled to the parameter
in ``csect``, ``ccomp``, and ``cname``. The ``factor`` sets the multiplication factor for the
coupling.

To decouple a parameter again, simply use:

  .. automethod:: pyspex.spex.Session.par_decouple

Examples::

    >>> s.par_couple(1, 2, 't', 1, 1, 't', 0.5)  # Couple the temperature in component 2 to 0.5 times the temperature in component 1
    >>> s.par_decouple(1, 2, 't')

Set instrument normalisation
""""""""""""""""""""""""""""
With SPEX the instrument normalisations can be set with the par command, but then with negative
sector numbers. Since that can be confusing, there is a separate command to set the instrument
normalisation, which has a similar syntax as the ``par`` method:

  .. automethod:: pyspex.spex.Session.par_norm

This methods sets the instrument normalisation to ``value`` for the instrument with number
``ins`` and region number ``reg``. The ``status`` parameter is a logical/boolean where
``True`` means thawn or free and ``False`` frozen.

Example::

    >>> s.par_norm(1,2, 0.95, True)

Write parameters to .com file
"""""""""""""""""""""""""""""
The current parameter settings can be saved to a command file (.com) and be loaded later by
the ``log_exe`` command. The ``par_write`` method in pyspex is called like this:

  .. automethod:: pyspex.spex.Session.par_write

Example::

    >>> s.par_write('myparam.com', overwrite=True)

Sectors
^^^^^^^

Sectors group spectral components to form the model for a particular source or phenomenon.
If the sectors need a different response, the sectors should also be defined in the .spo and
.res files. When starting SPEX, the number of sectors is 1 by default, even if loaded
data files contain more sectors. Sectors can be added to SPEX with the ``sector`` command.

In PYSPEX a new sector is created easily with the ``sector`` method:

  .. automethod:: pyspex.spex.Session.sector

This creates an empty sector. Sometimes, the new sector needs to have the same components as
a previous one. In this case, the sector can be copied:

  .. automethod:: pyspex.spex.Session.sector_copy

If a sector is no longer needed, it can be deleted:

  .. automethod:: pyspex.spex.Session.sector_del

Examples::

    >>> s.sector()
    There are 2 sectors
    >>> s.sector_copy(1)
     You have defined    1 component.
    There are 3 sectors
    >>> s.sector_del(2)

Plasma model parameters
^^^^^^^^^^^^^^^^^^^^^^^

There are a number of settings for the SPEX plasma models that can be changed by the user. In
SPEX these are done using the ``var`` command. The ``var`` commands have been implemented in
pyspex through the methods below. The current settings can be obtained using the
:ref:`Var class <class_var>` which is referenced in the SPEX session as ``s.mod_var``.

Free-bound accuracy
"""""""""""""""""""

   .. automethod:: pyspex.spex.Session.var_gacc

Example::

    >>> s.var_gacc(1.0E-2)

Line emission contributions
"""""""""""""""""""""""""""

   .. automethod:: pyspex.spex.Session.var_line

Example::

    >>> s.var_line('ex', False)

Doppler broadening
""""""""""""""""""

   .. automethod:: pyspex.spex.Session.var_doppler

Example::

    >>> s.var_doppler(1)

SPEXACT version 3 calculations
""""""""""""""""""""""""""""""

   .. automethod:: pyspex.spex.Session.var_calc

Example::

    >>> s.var_calc(True)

Occupation numbers starting values
""""""""""""""""""""""""""""""""""

   .. automethod:: pyspex.spex.Session.var_occstart

Example::

    >>> s.var_occstart('ground')

SPEXACT version 2 settings (MEKAL)
""""""""""""""""""""""""""""""""""

   .. automethod:: pyspex.spex.Session.var_mekal

Examples::

    >>> s.var_mekal('wav', False)
    >>> s.var_mekal('fe17', False)

Multi-Maxwellians for the ionisation balance
""""""""""""""""""""""""""""""""""""""""""""

   .. automethod:: pyspex.spex.Session.var_ibalmaxw

Example::

    >>> s.var_ibalmaxw(False)

SPEXACT version 3 cooling
"""""""""""""""""""""""""

   .. automethod:: pyspex.spex.Session.var_newcoolexc

Example::

    >>> s.var_newcoolexc(False)

And for the cooling by di-electronic recombination:

   .. automethod:: pyspex.spex.Session.var_newcooldr

Example::

    >>> s.var_newcooldr(False)
