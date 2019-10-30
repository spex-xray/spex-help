.. _sec:modeltypes:

Different types of spectral components
======================================

SPEX distinguishes three different types of model components, called
*additive*, *multiplicative*, and *hybrid* components respectively.
Additive components have a normalisation that determines the flux level,
for example power-law, CIE, and other emission models.
Multiplicative components operate on additive components, for example
absorption models like HOT, XABS and AMOL. The pion model
is a hybrid model that models both the absorption and emission from an
intervening slab of plasma.

The redshift component is treated as a multiplicative component, since
it operates on additive components.

Additive components can be divided into two classes: simple components
(like power law, blackbody etc.) and plasma components, that use our
atomic code. For the plasma components it is possible to plot or list
specific properties, while for the simple models this is not applicable.

Multiplicative components can be divided into 3 classes. First, there
are the absorption-type components, like interstellar absorption. These
components simply are an energy-dependent multiplication of the original
source spectrum.  has both simple absorption components as well as
absorption components based upon our plasma code. The second class
consists of shifts: redshift (either due to Doppler shifts or due to
cosmology) is the prototype of this. The third class consists of
convolution-type operators. An example is Gaussian velocity broadening.

For more information about the currently defined spectral components in,
see Chapter :ref:`chap:specmod`.