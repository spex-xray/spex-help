Astropy units and tables
========================

Since SPEX 3.07.00, pyspex returns Astropy Quantities and Tables for many numerical output functions.
On this page, we explain how to make optimal use of these new features.

Why Astropy units and tables?
-----------------------------

Astropy has done a great job developing a framework to work with and convert physical units often used
in Astrophysics. The ``Quantity`` object from Astropy couples the number and unit of a parameter at the
same time. By providing a Quantity as PYSPEX output instead of a number, it is immediately clear which
unit the number is in.

While SPEX uses SI units, which are actually recommended to use for the physical sciences, many astronomers
are still thinking in CGS. Using Astropy units, the output numbers can be easily converted to CGS units
if necessary.

The output can be organised in Astropy Tables or Qtables, which have a lot of helpful features. Tables
can be easily be sorted, written to FITS files or converted to Pandas, for example. Offering Astropy
units and tables can make the SPEX output much easier to use in follow-up analysis.

How to use Astropy units
------------------------

Let's get an Astropy unit from one of the more simple SPEX outputs to show how it works. If we define
a spectral model, SPEX will also calculate the flux and luminosity of the spectrum in a certain band.
These fluxes and luminosities are now returned with a unit attached::

    user@linux:~> python
    >>> from pyspex.spex import Session
    >>> s=Session()             # Starts the SPEX session
    ...
    >>> s.com('cie')            # Add model component CIE
    >>> s.calc()                # Calculate the model
    >>> flx = s.flux_get(1,1)   # Get the calculated fluxes and luminosities
    >>> print(flx.enerlum)      # Print the luminosity in energy units
    1.8976663101053723e+27 W

One of the parameters available in the ``flx`` object that ``s.flux_get()`` returns is the luminosity
in energy, called ``enerlum`` (see class_flux_ for a full description of the available numbers). When
we print this number, we see a ``W`` behind it, which means unit Watt.

The unit is explicitly encoded into the ``flx.enerlum`` object. The type of ``flx.enerlum`` is not a
float, but a Quantity::

    >>> print(type(flx.enerlum))
    <class 'astropy.units.quantity.Quantity'>

Getting numbers from a Quantity object
''''''''''''''''''''''''''''''''''''''

If we only want the number itself, then it can be obtained by adding ``.value`` after the parameter
like this::

    >>> print(flx.enerlum.value)
    1.8976663101053723e+27

We can also get the unit from the object in a similar way::

    >>> print(flx.enerlum.unit)
    W

Converting the units
''''''''''''''''''''

One of the reasons for using Astropy Quantities is that they are easily converted to other units.
For example, many astronomers would like to know the luminosity in erg/s instead of W, because they
are used to the CGS system. To get our luminosity in CGS units, the only thing we need to do is::

    >>> print(flx.enerlum.cgs)
    1.8976663101053722e+34 erg / s

Just appending ``.cgs`` at the end of the variable name is enough to return a converted number. As we
can see, the unit is erg/s now, which we would expect.

More examples about how to use Astropy units and how to use them in calculations can be found in the
`Astropy units documentation <https://docs.astropy.org/en/stable/units/index.html>`_.

Astropy Tables
--------------

When we continue our example of the previous section, we can get the plot data for a plot
of the CIE model as follows from PYSPEX::

    >>> (pl, plt) = s.plot_model(show=False)
    >>> print(pl.sector[0].tabmodel)
            X_ctr                 X_upp               Model
             keV                   keV           ph / (keV m2 s)
    --------------------- --------------------- ------------------
    0.0010007031872137865 0.0010014063744275728  149.9039074938181
    0.0010021105505858743  0.001002814726744176 149.66520271469315
                      ...                   ...                ...
        99.78943871942874     99.85956006837118                0.0
         99.9297800341856                 100.0                0.0
    Length = 8192 rows

Because the spectral models are organised by sector, we need to get the data for the first sector.
In Python indices start at 0, so we select sector[0] to get the tabmodel table for sector 1. When we
print the table, it clearly consists of three columns with the names ``X_ctr``, ``X_upp`` and ``Model``.
Each column also has a unit associated to it, so these columns are effectively Astropy Quantities.

Suppose that we are interested in the ``Model`` column, then we can extract that from the table quite
easily. For convenience, we first make a reference to the table in a separate variable::

    >>> table = pl.sector[0].tabmodel
    >>> print(table['Model'])
    [149.90390749 149.66520271 149.42688589 ...   0.           0.
       0.        ] ph / (keV m2 s)

The ``table['Model']`` array has the same properties as a well known numpy array and can be manipulated
using the same functions.

More examples and information about Astropy QTables can be found in the
`Astropy Tables documentation <https://docs.astropy.org/en/stable/table/index.html>`_.

Plotting Quantities and QTables
-------------------------------

Since Astropy Quantities and QTables have a slightly different structure than regular numpy arrays,
matplotlib cannot handle these arrays by default. Luckily, the compatibility can be added easily by
importing and running the following at the start of your python session or script::

    from astropy.visualization import quantity_support
    quantity_support()

If you do not want to have Quantity support throughout your script, you can also add it locally before
the plot commands::

    with quantity_support():
        plt.plot(table['X_ctr'], table['Model'], '-r')

