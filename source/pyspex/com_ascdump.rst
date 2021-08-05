Ascdump commands
----------------

The SPEX ascdump command is designed to return internal model parameters in SPEX through terminal
output, an ASCII file or a FITS file. With pyspex we can return these numbers in a python object, making them
directly available in your script as an `Astropy table <https://docs.astropy.org/en/stable/table/index.html>`_.

An overview of the different ascdump outputs and an explanation about the acronyms in the output table can be
found in the section :ref:`sec:ascdump`.

The ascdump command
"""""""""""""""""""

  .. automethod:: pyspex.spex.Session.ascdump

Example::

    >>> s.com('cie')
    >>> asc = s.ascdump(1, 1, 'plas')
     number of layer lines :        4156           0
    No selection file used
    >>> print(asc.cs)
         te          tion         tiba         vmic          cs          eden         hden         eide         rho           ed          eid          denm         epla
        keV          keV          keV         km / s       km / s       1 / m3       1 / m3       1 / m3      kg / m3                                               keV
    ------------ ------------ ------------ ------------ ------------ ------------ ------------ ------------ ------------ ------------ ------------ ------------ ------------
    1.000000E+00 1.000000E+00 1.000000E+00 0.000000E+00 5.072631E+02 1.204480E+06 1.000000E+06 2.302763E+06 2.389693E-21 1.204480E+00 2.302763E+00 1.428711E+00 4.075277E-14

