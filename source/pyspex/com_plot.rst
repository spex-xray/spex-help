Plot commands
-------------

Next to the PGPLOT plotting system of SPEX, the python interface can also be used for plotting.
In this section, we provide a list of commands for plotting spectral models, the effective area and
spectral data (including residuals).

Plot spectral model
^^^^^^^^^^^^^^^^^^^

The SPEX plot type 'model' plots the model spectrum as a function of energy. In PYSPEX there is a
function to obtain the same plot using matplotlib:

  .. automethod:: pyspex.spex.Session.plot_model

This function plots the model spectrum as a function of energy (keV). The axis can be made
logarithmic by setting ``xlog=True`` and ``ylog=True`` for the x and y axis, respectively.

  .. warning:: Due to a bug in pyspex 3.06.01, the unit on the y axis is not photons/s/m**2/keV,
               but photons/s/m**2. So it shows the spectra without dividing by the bin width.
               This issue will be fixed in pyspex 3.07.00.

Examples::

    >>> s.plot_model()
    >>> s.plot_model(xlog=True, ylog=True)

Plot data
^^^^^^^^^

The SPEX data plot type plots the observed spectrum, the folded model and background spectrum.
In PYSPEX, this is done with one command called ``plot_data``:

  .. automethod:: pyspex.spex.Session.plot_data

This function plots the observed spectra in black, the convolved model in red, and the background
spectrum as a dashed blue line. The axis can be made logarithmic by setting ``xlog=True``
and ``ylog=True`` for the x and y axis, respectively.

  .. warning:: Due to a bug in pyspex 3.06.01, the unit on the y axis is not counts/s/keV,
               but counts/s. So it shows the spectra without dividing by the bin width.
               This issue will be fixed in pyspex 3.07.00.

Examples::

    >>> s.plot_data()
    >>> s.plot_data(xlog=True, ylog=True)

Plot data with residuals
""""""""""""""""""""""""

It is also possible to attach a subplot with residuals to the main data plot. To do this,
one uses the ``plot_chi`` command:

  .. automethod:: pyspex.spex.Session.plot_chi

In addition to the xlog and ylog parameter, this function can also set the residual type.
Currently, ``dchi`` and ``rel`` are implemented.

Examples::

    >>> s.plot_chi()
    >>> s.plot_chi(chi='rel')

Plot data with model components
"""""""""""""""""""""""""""""""

For models with multiple additive components, it is possible in PYSPEX to plot the total model and
the contributions from the individual additive components with the ``plot_comp`` method.

  .. automethod:: pyspex.spex.Session.plot_comp

Examples::

    >>> s.plot_comp()
    >>> s.plot_comp(ylog=True, title='Spectral components')

Plot effective area
^^^^^^^^^^^^^^^^^^^

The SPEX plot type 'area' plots the effective area as a function of energy. In PYSPEX there is a
function to obtain the same plot using matplotlib:

  .. automethod:: pyspex.spex.Session.plot_area

This function plots the effective area as a function of energy (keV). The axis can be made
logarithmic by setting ``xlog=True`` and ``ylog=True`` for the x and y axis, respectively.

Examples::

    >>> s.plot_area()
    >>> s.plot_area(xlog=True, ylog=True)
