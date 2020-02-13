Data related commands
---------------------

The commands in this section are all related to the data structures within SPEX. They deal with
spectral data and responses, simulation of data, etc.

Data
^^^^

Loading spectral data and responses in SPEX is done with the ``data`` command. Data can be added
by loading a .res and .spo file that contain the response and spectral information for an
instrument. The PYSPEX command is:

  .. automethod:: pyspex.spex.Session.data

where resfile is the response file and spofile the spectrum file. Note that this command needs
the full filename (and if necessary the path to the file) including the extension. This
is the only difference with the SPEX syntax. Example::

    >>> s.data('xifu.res','xifu.spo')

Data delete
"""""""""""
Deleting a loaded spectrum and response is done in SPEX with the ``data delete instrument #i``
command. In PYSPEX, this command is:

  .. automethod:: pyspex.spex.Session.data_del

where ``ins`` is the instrument number to be deleted. For example::

    >>> s.data_del(1)

Data save
"""""""""
Simulated spectra can be saved as a .spo file. In SPEX, this is done using the
``data save #i <spofile>`` command. In PYSPEX, the command is:

  .. automethod:: pyspex.spex.Session.data_save

where ``ins`` is the instrument number of the data to be saved, ``spofile`` is the name of
the output .spo file. Again note that you should give the full file name, including the .spo
extension. Optionally, you can tell the command that existing files may be overwritten.
For example::

    >>> s.data_save(1,'sim.spo',overwrite=True)

or simply::

    >>> s.data_save(1,'sim.spo')

if the file does not exist yet.

Binning and data selection
^^^^^^^^^^^^^^^^^^^^^^^^^^

Unlike some other fitting packages, SPEX rebins the spectra within the program. The easiest binning
method is to just rebin with a certain integer factor. This is the ``bin`` command in SPEX. In
addition, SPEX contains a binning method based on the bin statistics (``vbin``) and an optimal
binning algorithm (``obin``) which takes the instrument resolution into account.

**Binning with factor**

Binning with an integer factor is done with the bin command:

  .. automethod:: pyspex.spex.Session.bin

In this example, we bin the spectrum with a factor of 5 between 0.3 and 10 keV::

    >>> s.bin(1,1,0.3,10.,5,'kev')

**Variable binning**

Variable binning is done with the vbin command:

  .. automethod:: pyspex.spex.Session.vbin

In this example, we bin the spectrum with a minimum factor of 3 and a minimum signal-to-noise
ratio of 25 between 0.3 and 10 keV::

    >>> s.vbin(1,1,0.3,10.,3,25.,'kev')

**Optimal binning**

The optimal binning algorithm bins based on the instrument resolution and statistics:

  .. automethod:: pyspex.spex.Session.obin

In this example, we optimally bin the spectrum between 0.3 and 10 keV::

    >>> s.obin(1,1,0.3,10.,'kev')

Data selection
""""""""""""""

Selecting data is done using the ``use`` and ``ignore`` commands. By default, the bin selection
in the ``.spo`` file is loaded, which should use all the good bins.

**Use function**

  .. automethod:: pyspex.spex.Session.use

Example::

    >>> s.use(1,1,0.3,10.,'kev')

**Ignore function**

  .. automethod:: pyspex.spex.Session.ignore

Example::

    >>> s.ignore(1,1,0.0,0.3,'kev')
    >>> s.ignore(1,1,10.,100.,'kev')

Systematic errors
"""""""""""""""""

If needed, the error bars on the source and background spectrum can be enlarged by the ``syserr``
command:

  .. automethod:: pyspex.spex.Session.syserr

.. warning::

    To use this function, you need to know what you are doing statistically. In many cases, this
    function would produce wrong results.

Simulate
^^^^^^^^

Based on an instrument response and a model spectrum, SPEX can simulate an observed spectrum
using the ``simulate`` commands. In SPEX, the options can be set by giving multiple commands,
but in PYSPEX this is done in a single command with optional parameters:

  .. automethod:: pyspex.spex.Session.simulate

The only required parameter is ``extime``, which is the desired exposure time (float) for the simulation.

The optional parameters are:

* ``inst`` The instrument number range to simulate (string). Just like in SPEX, the range can
  be provided by giving two numbers with a ``:`` in between, like ``1:3``.
* ``reg`` The region number range to simulate (string). This has the same behaviour as ``inst``.
* ``ssys`` Adds a systematic error to the source spectrum (float, default is 0.).
* ``bsys`` Adds a systematic error to the background spectrum (float, default is 0.).
* ``noise`` Adds Poisson noise to the simulated spectrum (default is True).
* ``bnoise`` Adds Poisson noise the the background spectrum (default is False).
* ``seed`` Provide a random seed for the simulation (by default the seed is randomly generated
  using the system clock).

For example::

    >>> s.simulate(1E+5, inst='1:3', bnoise=True, seed=42)

