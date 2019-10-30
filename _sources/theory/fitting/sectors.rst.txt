.. _sec:sectorsandregions:

Sectors and regions
===================

Introduction
------------

In many cases an observer analyses the observed spectrum of a single
X-ray source with a single instrument. There are however situations
with more complex geometries or multiple instruments involved that
require a more complicated setup of model components and data.

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

Example 4: When one wants to fit the instrumental and/or particle
background simultaneously with the source spectrum, the particle
background needs to be folded with a different response function.

These examples can be modeled and fitted using the SPEX concept
of sectors and regions.

Sectors
-------

Sectors are a way in SPEX to organize or group model components
that are related to each other. For example, we may put components
related to the source spectrum and components related to the
(particle) background into separate sectors.

A sector may also contain the components for different sources on the sky.
For example if there is a bright point source superimposed upon the
diffuse emission of the cluster, we can define two sectors: an
sector for the cluster emission, and sector for the point source. Both
sectors might even overlap, as this example shows!

Another example: the two nearby components of the close binary
:math:`\alpha` Centauri observed with the XMM-Newton instruments, with
overlapping point-spread-functions of both components. In that case we
would have two sectors that each describe one of the double star’s
components.

The model spectrum for each sector may and will be different in
general. For example, in the case of an AGN superimposed upon a cluster
of galaxies, one might model the spectrum of the point-like AGN sector
using a power law, and the spectrum from the surrounding cluster
emission using a thermal plasma model.

Sectors can be defined using the command :ref:`sec:sector` in combination
with the :ref:`sec:comp` command.

Regions and instruments
-----------------------

The observed count rate spectra are extracted in practice in different
regions of the detector. It is necessary here to distinguish clearly the
model sectors and detector regions. A detector region for the XMM EPIC
camera would be for example a rectangular box, spanning a certain number
of pixels in the :math:`x`- and :math:`y`-directions. It may also be a
circular or annular extraction region centered around a particular pixel
of the detector, or whatever spatial filter is desired. For the XMM RGS
it could be a specific "banana" part of the detector-coordinate CCD
pulse-height plane (:math:`z`,\ :math:`E`).

Note that the detector regions need not to coincide with the
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

Regions and instruments have a very similar role in SPEX. The subtle
difference is that regions usually have the same or similar response
properties, while different instruments have different responses.
Although this difference exists, in practice instruments and regions
are often mixed.

Including sectors and regions in trafo
--------------------------------------

If certain model components need to be applied to particular spectra,
the ``trafo`` program (:ref:`sect:trafo`) can be used to predefine
the sector and region numbers in the .res and .spo files. This can be
helpful in the case of modelling particle background simultaneously with
the source spectrum. In trafo, two sectors can be defined to contain the
source and background components, to make sure that the background
components are folded with a different response than the source
components. In addition, model spectra from both sectors can be
added and applied to one detector region. This example is explained in
more detail in :ref:`sec:modpartbkg`.
