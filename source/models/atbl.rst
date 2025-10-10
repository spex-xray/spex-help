.. _sect:atbl:

Atbl: Additive table model
==========================

The atbl model provides an interface to apply an additive model component directly
from a FITS table. The required FITS table format follows the specifications given on the
`the XSPEC page. <https://heasarc.gsfc.nasa.gov/docs/heasarc/ofwg/docs/summary/ogip_92_009_summary.html>`_
Conceptually, the atbl component works in the same way as the atable model in XSPEC: the program
reads the input file and computes the model spectrum for each energy bin on the grid.

Despite of the similarity between this model and the XSPEC *atable*,
the underlying algorithm to interpolate the table model is unlikely to be identical.
This design allows direct comparison between SPEX and XSPEC implementations of the
same table model, providing insight into the systematic uncertainties introduced by interpolation.

A special extension of atbl is its ability to read 
`APEC tables <http://www.atomdb.org/download.php>`_. The procedure for loading APEC into
SPEX is described in the analysis thread. Comparing the APEC implementations in SPEX and
XSPEC helps quantify interpolation uncertainties. It can also be instructive to compare
APEC with the SPEX cie model. The APEC-NEI is not yet supported in the current version of atbl.

At present, the program does not support multiplicative components. For the current workaround,
please refer to :ref:`sect:musr`.


Model parameters
----------------

The parameters of the model are:

:file: full name and location of the table fits file.
:norm: normalization applied globally in the calculation.
