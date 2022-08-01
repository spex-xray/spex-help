.. _pyspex_plot:

Plot commands
-------------

Next to the PGPLOT plotting system of SPEX, the python interface can also be used for plotting.
In this section, we provide a list of commands for plotting spectral models, the effective area and
spectral data (including residuals).

Plot spectral model
^^^^^^^^^^^^^^^^^^^

The SPEX plot type 'model' plots the model spectrum as a function of energy or wavelength.
In PYSPEX there is a function to obtain the same plot using matplotlib:

  .. automethod:: pyspex.spex.Session.plot_model

This function plots the model spectrum as a function of energy (keV) by default. If the ``wave=True``
parameter is set, then the spectrum will be plotted as a function of wavelength (:math:`\AA`).
The axis can be made logarithmic by setting ``xlog=True`` and ``ylog=True`` for the x and y axis,
respectively.

  .. warning:: Due to a bug in pyspex 3.06.01, the unit on the y axis is not photons/s/m**2/keV,
               but photons/s/m**2. So it shows the spectra without dividing by the bin width.
               This issue will be fixed in pyspex 3.07.00.

Examples::

    >>> s.plot_model()
    >>> s.plot_model(xlog=True, ylog=True)
    >>> s.plot_model(wave=True)

Obtain the raw plot data
""""""""""""""""""""""""

It is possible to get the raw plot data through the pyspex interface. The ``plot_model`` command
can return an object containing the plot data organised by model sector. Per sector, the data
is available in two formats: an `Astropy QTable <https://docs.astropy.org/en/stable/api/astropy.table.QTable.html>`_
and individual numpy arrays.

The data object ``pl`` can be returned as follows::

    >>> pl = s.plot_model()
    >>> data = pl.sector[0].tabmodel

Please be reminded that Python starts counting at 0, while SPEX starts counting at 1, so sector[0]
in Python corresponds to sector 1 in SPEX.

The table ``tabmodel`` contains the following columns:

    * ``X_ctr``: The central value of the X-axis bin (in energy or wavelength)
    * ``X_upp``: The value of the upper bin edge of the X-axis bin (in energy or wavelength)
    * ``Model``: The model value for that bin.

Since ``tabmodel`` is an `Astropy QTable <https://docs.astropy.org/en/stable/api/astropy.table.QTable.html>`_
the units of the values are included in the table data and all the features of a QTable can be used.

Some examples to try::

    >>> pl = s.plot_model()
    >>> data = pl.sector[0].tabmodel
    >>> x = data['X_ctr']         # extract a column from the table
    >>> print(data['Model'].unit) # see the unit of the Model column
    >>> print(data)               # Print the table nicely formatted

See :ref:`class_plot_model` for a description of the individual numpy arrays available within
the sector object.

Plot data
^^^^^^^^^

The SPEX data plot type plots the observed spectrum, the folded model and background spectrum.
In PYSPEX, this is done with one command called ``plot_data``:

  .. automethod:: pyspex.spex.Session.plot_data

This function plots the observed spectra in black, the convolved model in red, and the background
spectrum as a dashed blue line. The axis can be made logarithmic by setting ``xlog=True``
and ``ylog=True`` for the x and y axis, respectively.

With the parameter ``wave=True``, the data and model will be plotted versus wavelength (:math:`\AA`).

  .. warning:: Due to a bug in pyspex 3.06.01, the unit on the y axis is not counts/s/keV,
               but counts/s. So it shows the spectra without dividing by the bin width.
               This issue will be fixed in pyspex 3.07.00.

Examples::

    >>> s.plot_data()
    >>> s.plot_data(xlog=True, ylog=True)
    >>> s.plot_data(wave=True)

Plot data with residuals
""""""""""""""""""""""""

It is also possible to attach a subplot with residuals to the main data plot. To do this,
one uses the ``plot_chi`` command:

  .. automethod:: pyspex.spex.Session.plot_chi

In addition to the xlog and ylog parameter, this function can also set the residual type.
Currently, ``dchi`` and ``rel`` are implemented. Also, with the parameter ``wave=True``, the
values will be plotted as a function of wavelength (:math:`\AA`).

Examples::

    >>> s.plot_chi()
    >>> s.plot_chi(chi='rel')
    >>> s.plot_chi(wave=True)

Plot data with model components
"""""""""""""""""""""""""""""""

For models with multiple additive components, it is possible in PYSPEX to plot the total model and
the contributions from the individual additive components with the ``plot_comp`` method.

  .. automethod:: pyspex.spex.Session.plot_comp

Examples::

    >>> s.plot_comp()
    >>> s.plot_comp(ylog=True, title='Spectral components')
    >>> s.plot_comp(wave=True)

Obtain the raw plot data
""""""""""""""""""""""""

It is possible to get the raw plot data through the pyspex interface. The ``plot_data`` command
can return an object containing the plot data organised by instrument and region. Per region, the data
is available in two formats: an `Astropy QTable <https://docs.astropy.org/en/stable/api/astropy.table.QTable.html>`_
and individual numpy arrays.

The data object ``pl`` can be returned as follows::

    >>> pl = s.plot_data()
    >>> data = pl.inst[0].reg[0].tabdata

Please be reminded that Python starts counting at 0, while SPEX starts counting at 1, so inst[0]
and reg[0] in Python correspond to instrument 1 and region 1, respectively.

The table ``tabdata`` contains the following columns:

    * ``X_ctr``: The central value of the X-axis bin (in energy or wavelength).
    * ``X_low``: The value of the lower bin edge of the X-axis bin (in energy or wavelength).
    * ``X_upp``: The value of the upper bin edge of the X-axis bin (in energy or wavelength).
    * ``Data``: The data value for every bin.
    * ``Error``: The error value for every data point.
    * ``Model``: The model value for every bin.
    * ``Bkg``: The background value for every bin.
    * ``Exposure``: The exposure time for each bin (SPEX stores effective area corrections
      as effective exposure times per bin).
    * ``1/Area``: The inverse of the effective area. This array is used internally in SPEX.
    * ``Chi``: The residuals for every bin.
    * ``Chi_err``: The error on the residual for every bin.

Since ``tabdata`` is an `Astropy QTable <https://docs.astropy.org/en/stable/api/astropy.table.QTable.html>`_
the units of the values are included in the table data and all the features of a QTable can be used.

Some examples to try::

    >>> pl = s.plot_data()
    >>> data = pl.sector[0].tabdata
    >>> x = data['X_ctr']          # extract a column from the table
    >>> print(data['Model'].unit)  # Print the unit of the Model column
    >>> print(data)                # Print the table nicely formatted

See :ref:`class_plot_data` for a description of the individual numpy arrays available within
the region object.


Plot effective area
^^^^^^^^^^^^^^^^^^^

The SPEX plot type 'area' plots the effective area as a function of energy. In PYSPEX there is a
function to obtain the same plot using matplotlib:

  .. automethod:: pyspex.spex.Session.plot_area

This function plots the effective area as a function of energy (keV) by default. To plot the effective
area as function of wavelength (:math:`\AA`), one can set ``wave=True`` as one of the function arguments.

The plot axes can be made logarithmic by setting ``xlog=True`` and ``ylog=True`` for the x and y axis,
respectively.

Examples::

    >>> s.plot_area()
    >>> s.plot_area(xlog=True, ylog=True)
    >>> s.plot_area(wave=True)

Obtain the raw plot data
""""""""""""""""""""""""

It is possible to get the raw plot data through the pyspex interface. The ``plot_area`` command
can return an object containing the plot data organised by instrument and region. Per region, the data
is available in two formats: an `Astropy QTable <https://docs.astropy.org/en/stable/api/astropy.table.QTable.html>`_
and individual numpy arrays.

The data object ``pl`` can be returned as follows::

    >>> pl = s.plot_area()
    >>> data = pl.inst[0].reg[0].tabarea

Please be reminded that Python starts counting at 0, while SPEX starts counting at 1, so ``inst[0]`` and
``reg[0]`` in Python correspond to instrument 1 and region 1, respectively.

The table ``tabarea`` contains the following columns:

    * ``X_ctr``: The central value of the X-axis bin (in energy or wavelength)
    * ``X_upp``: The value of the upper bin edge of the X-axis bin (in energy or wavelength)
    * ``Area``:  The effective area value for that bin.

Since ``tabarea`` is an `Astropy QTable <https://docs.astropy.org/en/stable/api/astropy.table.QTable.html>`_
the units of the values are included in the table data and all the features of a QTable can be used.

Some examples to try::

    >>> pl = s.plot_area()
    >>> data = pl.inst[0].reg[0].tabarea
    >>> x = data['X_ctr']         # extract a column from the table
    >>> print(data['Area'].unit)  # see the unit of the Area column
    >>> print(data)               # Print the table nicely formatted

See :ref:`class_plot_area` for a description of the individual numpy arrays available within
the region object.

Plotting Astropy Table data
^^^^^^^^^^^^^^^^^^^^^^^^^^^

There are some caveats to keep in mind when plotting Astropy QTable data with Matplotlib. First,
matplotlib cannot plot columns directly, since they are in a non-standard format. It needs some
information to decode the arrays. Luckily, the Astropy module provides those. At the beginning
of your program, you can add the following lines to make it work::

    from astropy.visualization import quantity_support
    quantity_support()

The above will enable quantity support for the entire file. If you do not want that, you can
also enable it for a single or series of commands::

    from astropy.visualization import quantity_support
    ...

    def main():
        ...
        with quantity_support():
            plt.plot(data['X_ctr'],data['Model'])

More information about `Astropy Tables <https://docs.astropy.org/en/stable/table/index.html>`_ and
`Astropy Units <https://docs.astropy.org/en/stable/units/index.html>`_.
