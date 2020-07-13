.. _sect:plotadum:

Plot asciidump file format
==========================

If one decides to save the plot as a file, then the ``plot adum`` command (:ref:`sec:plot`)
is used. This will save the spectrum in the `QDP file format <https://wwwastro.msfc.nasa.gov/qdp/>`_.
Depending on the plot type, the number of columns and their content in the output QDP file changes.
Note that the units of the output are the same as the ones that you set for the plot.

Plot type data
--------------

The ``plot adum`` output for the ``data`` plot type is:

+--------+---------------------------------------------------------+
| Column | Value                                                   |
+========+=========================================================+
| 1      | Energy/wavelength center                                |
+--------+---------------------------------------------------------+
| 2      | Energy/wavelength negative distance until bin boundary  |
+--------+---------------------------------------------------------+
| 3      | Energy/wavelength positive distance until bin boundary  |
+--------+---------------------------------------------------------+
| 4      | Count rate center                                       |
+--------+---------------------------------------------------------+
| 5      | Count rate negative error                               |
+--------+---------------------------------------------------------+
| 6      | Count rate positive error                               |
+--------+---------------------------------------------------------+
| 7      | Model value                                             |
+--------+---------------------------------------------------------+
| 8      | Background value                                        |
+--------+---------------------------------------------------------+

Plot type chi
-------------

The ``plot adum`` output for the ``chi`` plot type is:

+--------+---------------------------------------------------------+
| Column | Value                                                   |
+========+=========================================================+
| 1      | Energy/wavelength center                                |
+--------+---------------------------------------------------------+
| 2      | Energy/wavelength negative distance until bin boundary  |
+--------+---------------------------------------------------------+
| 3      | Energy/wavelength positive distance until bin boundary  |
+--------+---------------------------------------------------------+
| 4      | Difference                                              |
+--------+---------------------------------------------------------+
| 5      | Difference negative error                               |
+--------+---------------------------------------------------------+
| 6      | Difference positive error                               |
+--------+---------------------------------------------------------+
| 7      | Zero level                                              |
+--------+---------------------------------------------------------+

Plot type model
---------------

The ``plot adum`` output for the ``model`` plot type is:

+--------+---------------------------------------------------------+
| Column | Value                                                   |
+========+=========================================================+
| 1      | Energy/wavelength center                                |
+--------+---------------------------------------------------------+
| 2      | Energy/wavelength negative distance until bin boundary  |
+--------+---------------------------------------------------------+
| 3      | Energy/wavelength positive distance until bin boundary  |
+--------+---------------------------------------------------------+
| 4      | Model value                                             |
+--------+---------------------------------------------------------+

Plot type area
--------------

The ``plot adum`` output for the ``area`` plot type is:

+--------+---------------------------------------------------------+
| Column | Value                                                   |
+========+=========================================================+
| 1      | Energy/wavelength center                                |
+--------+---------------------------------------------------------+
| 2      | Energy/wavelength negative distance until bin boundary  |
+--------+---------------------------------------------------------+
| 3      | Energy/wavelength positive distance until bin boundary  |
+--------+---------------------------------------------------------+
| 4      | Effective area                                          |
+--------+---------------------------------------------------------+

Plot type fwhm
--------------

The ``plot adum`` output for the ``fwhm`` plot type is:

+--------+---------------------------------------------------------+
| Column | Value                                                   |
+========+=========================================================+
| 1      | Energy/wavelength center                                |
+--------+---------------------------------------------------------+
| 2      | Energy/wavelength negative distance until bin boundary  |
+--------+---------------------------------------------------------+
| 3      | Energy/wavelength positive distance until bin boundary  |
+--------+---------------------------------------------------------+
| 4      | Center value of FWHM limits                             |
+--------+---------------------------------------------------------+
| 5      | Negative half maximum                                   |
+--------+---------------------------------------------------------+
| 6      | Positive half maximum                                   |
+--------+---------------------------------------------------------+
| 7      | Peak energy of the response                             |
+--------+---------------------------------------------------------+


