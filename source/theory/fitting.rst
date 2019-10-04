Spectral fitting
================

This chapter explains the procedure used in SPEX for the spectral modelling.
In the following paragraphs we deal with the necessary information
needed to start with the spectral modellinzation about first, sectors
and regions and then different spectral components.

Spectral Modelling
------------------

.. _label: fig:1
.. figure:: trpb01.png
   :alt: Processing Flow Diagram for Spectral Modelling of optically thin plasmas (from Mewe 1992).
   :width: 80.0%

To infer relevant physical parameters from observed X-ray spectra,
physical models are needed. The models need to calculate the expected
X-ray spectrum based on physical parameters, like the electron
temperature, emission measure and density distributions, ion and
elemental abundances, mass motions, and the nature of the ambient
radiation field. Unfortunately, the physical models cannot be compared
directly to the measured spectra, because the instruments used to obtain
the spectra change the spectrum for example by adding background
components (instrument noise), change the continuum shape due to the
sensitivity of the mirror (effective area), and blur spectral lines due
to the instruments spectral resolution.

To take these instrumental components into account, the usual procedure
is to apply a forward modelling technique by convolving theoretical
model spectra with the instrumental response and to vary the model
parameters in order to optimize the fit of the model to the
observational data. A common approach is to consider first a simplified
plasma model for the X-ray source, neglecting much of the complexity of
the temperature and density structure and of the effects of opacity, and
to synthesize such models into successively more sophisticated
approximations of the source model.

In Figure `1 <#fig:1>`__ we give in a processing flow diagram
schematically the process of spectral modelling for the case of
optically thin coronal plasmas. The synthetic spectra program is fed
with input parameters from the spectral model (atomic data for
ionization and line and continuum excitation), the instrumental model,
and from the assumed plasma model for the source. The synthetic spectra
code generates spectra which can be compared to the observations and
tested by means of statistical fitting procedures.


.. _sec:sectorsandregions:

Sectors and regions
-------------------

Introduction
""""""""""""

In many cases an observer analysis the observed spectrum of a single
X-ray source. There are however situations with more complex geometries.

Example 1: An extended source, where the spectrum may be extracted from
different regions of the detector, but where these spectra need to be
analysed simultaneously due to the overlap in point-spread function from
one region to the other. This situation is e.g. encountered in the
analysis of cluster data with ASCA or BeppoSAX.

Example 2: For the RGS detector of XMM-Newton, the actual data-space in
the dispersion direction is actually two-dimensional: the position
:math:`z` where a photon lands on the detector and its energy or pulse
height :math:`E` as measured with the CCD detector. X-ray sources that
are extended in the direction of the dispersion axis :math:`\phi` are
characterised by spectra that are a function of both the energy
:math:`E` and off-axis angle :math:`\phi`. The sky photon distribution
as a function of (:math:`\phi`,\ :math:`E`) is then mapped onto the
(:math:`z`,\ :math:`E`)-plane. By defining appropriate regions in both
planes and evaluating the correct (overlapping) responses, one may
analyse extended sources.

Example 3: One may also fit simultaneously several time-dependent
spectra using the same response, e.g. data obtained during a stellar
flare.

It is relatively easy to model all these situations (provided that the
instrument is understood sufficiently, of course), as we show below.

Sky sectors
"""""""""""

First, the relevant part of the sky is subdivided into sectors, each
sector corresponding to a particular region of the source, for example a
circular annulus centered around the core of a cluster, or an
arbitrarily shaped piece of a supernova remnant, etc.

A sector may also be a point-like region on the sky. For example if
there is a bright point source superimposed upon the diffuse emission of
the cluster, we can define two sectors: an extended sector for the
cluster emission, and a point-like sector for the point source. Both
sectors might even overlap, as this example shows!

Another example: the two nearby components of the close binary
:math:`\alpha` Centauri observed with the XMM-Newton instruments, with
overlapping point-spread-functions of both components. In that case we
would have two point-like sky sectors, each sector corresponding to one
of the double star’s components.

The model spectrum for each sky sector may and will be different in
general. For example, in the case of an AGN superimposed upon a cluster
of galaxies, one might model the spectrum of the point-like AGN sector
using a power law, and the spectrum from the surrounding cluster
emission using a thermal plasma model.

Detector regions
""""""""""""""""

The observed count rate spectra are extracted in practice in different
regions of the detector. It is necessary here to distinguish clearly the
(sky) sectors and (detector) regions. A detector region for the XMM EPIC
camera would be for example a rectangular box, spanning a certain number
of pixels in the :math:`x`- and :math:`y`-directions. It may also be a
circular or annular extraction region centered around a particular pixel
of the detector, or whatever spatial filter is desired. For the XMM RGS
it could be a specific "banana" part of the detector-coordinate CCD
pulse-height plane (:math:`z`,\ :math:`E`).

Note that the detector regions need not to coincide with the sky
sectors, neither should their number to be equal! A good example of this
is again the example of an AGN superimposed upon a cluster of galaxies.
The sky sector corresponding to the AGN is simply a point, while, for a
finite instrumental psf, its extraction region at the detector is for
example a circular region centered around the pixel corresponding to the
sky position of the source.

Also, one could observe the same source with a number of different
instruments and analyse the data simultaneously. In this case one would
have only one sky sector but more detector regions, namely one for each
participating instrument.

.. _sec:modeltypes:

Different types of spectral components
--------------------------------------

In a spectral model  uses three different types of components, called
*additive*, *multiplicative*, and *hybrid* components respectively.
Additive components have a normalisation that determines the flux level.
Multiplicative components operate on additive components. The pion model
is a hybrid model that models both the absorption and emission from an
intervening slab of plasma. A delta line or a power law are typical
examples of additive components. Interstellar absorption is a typical
example of a multiplicative component.

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

