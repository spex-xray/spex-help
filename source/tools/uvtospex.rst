.. _sec:uvtospex:

Uvtospex
========

Many optical/UV spectra are delivered without a response matrix. Hubble COS spectra, for example,
are delivered as data/error points on a wavelength grid. To include these spectra in a SPEX fit,
a response matrix with a given spectral resolution should be created. ``Uvtospex`` is a tool to
transform such optical spectra into SPEX format.

.. note::
    Some UV/optical instruments do provide response matrices, for example XMM-Newton OM and
    Swift UVOT. Please see this thread to import :ref:`sec:uvoptdata`.

To create a spectrum in SPEX format from UV/Optical grating data, the spectrum needs to be
stored in a text file with three columns. The ``uvtospex`` program shows the format when
opening::

    Your input spectral file should have 3 columns:
    Column 1: wavelength in Angstrom
    Column 2: flux in ergs/cm^2/s/Angstrom
    Column 3: flux error in same units

    Enter input file name spectrum: cos.txt

The program first asks for the ascii file name containing the spectrum. Then the output file
name of the spo file needs to be provided::

    Enter file name output spectrum (with .spo): cos.spo

To be able to create a response matrix for the spectrum, the spectral resolution of the
instrument needs to be known. Uvtospex asks for the resolution in units of km/s (FWHM)::

    Enter spectral resolution (km/s):

It is assumed that this resolution in km/s is constant over the entire spectral range.
Finally, the name of the output response file should be entered::

    Enter file name output response (with .res):

The result should be a .res and .spo file containing the UV spectrum that can be read into
SPEX.
