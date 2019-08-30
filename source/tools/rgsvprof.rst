.. _sect:rgsvprof:

Rgsvprof
========

In SPEX, the *lpro* component (see :ref:`sec:lpro`) can be used to fold
the spectrum with a user defined broadening profile. This is
particularly useful for the analysis of extended sources with grating
spectrometers, like RGS aboard XMM-Newton. The rgsvprof program creates
an input file (usually called vprof.dat) for the *lpro* component from a
MOS1 detector image.

The program will ask for the following input:

-  MOS1 detector image. In order to obtain a profile along the
   dispersion direction of RGS within the same field of view, the
   program asks for a MOS1 image of the source in detector coordinates
   (DETX,DETY) created by, for example, the XMM-Newton SAS task
   *evselect*. Rgsvprof does not require a particular resolution for the
   image, but a resolution of about 1/3 of the XMM-Newton PSF, i.e.
   :math:`4^{\prime\prime}`, is recommended. It is recommended to
   extract an image using events with energies falling in the RGS band:
   :math:`\sim`\ 0.3-2.0 keV.

-  Cross-dispersion selection region. If the RGS spectrum is extracted
   from a certain area in the cross-dispersion direction, then provide
   the lower and upper boundary here in arcminutes with respect to the
   centre of the field of view. The full RGS strip corresponds to a
   range between -2.5 and 2.5 arcminutes.

-  Source width in the dispersion direction. This parameter determines
   the boundaries of the resulting profile in wavelength space. Rgsvprof
   asks for the width of the source in arcmin centred on the peak of the
   emission. Choose this width to be somewhat larger than the actual
   width of the source to be sure that the brightest parts are included
   in the profile. A width of :math:`>`\ 10 arcmin is typically enough,
   but a larger width will increase the size of the vprof.dat file and
   increase processing times.

-  Output file name. The name of the output file (usually vprof.dat).
   Note that rgsvprof does not overwrite files that already exist.

Rgsvprof creates an ASCII file with two columns. The left column
consists of the grid of wavelengths that the profile is based upon and
the right column gives the normalised cumulative profile over this range
starting with 0 and ending at 1. The profile will be centred on the peak
of the emission.

Note: The cross-dispersion axis in RGS is parallel to the DETX
coordinate axis in MOS1 and has the same direction. This is particularly
helpful when one extracts spatial regions in the cross-dispersion
direction of RGS.

.. warning::
   This program works best for bright extended sources,
   where the background contribution is negligible. For sources with a low
   surface brightness, in principle a background subtracted image should be
   used. This program, however, cannot deal with negative values in the
   MOS1 image.

.. warning::
   This program does not take into account vignetting and
   chip gaps. For offset observations or very extended sources, this may
   start to play a role.

Theory
------

The wavelength scale corresponding to the angular width of the source in
RGS can be calculated using the dispersion equation defined in e.g.
`Peterson et al. (2004) <https://ui.adsabs.harvard.edu/abs/2004ApJ...615..545P/abstract>`_:

.. math:: m\lambda = d ( \mathrm{cos} \beta - \mathrm{cos} \alpha ),

where :math:`m` is the spectral order, :math:`\lambda` the wavelength,
:math:`d` the grating spacing, :math:`\alpha` the incidence angle of a
photon, and :math:`\beta` the diffracted angle. The wavelength shift
:math:`\Delta\lambda` due to an offset angle :math:`\Delta\theta`
relative to the telescope boresight can be derived by differentiating
the equation above with respect to
:math:`\theta = \frac{F}{L} (\alpha - \alpha_{0})`, where :math:`F` is
the distance between the gratings (RGA) and the camera (RFC), :math:`L`
the focal length of the telescope, and :math:`\alpha_{0}` the incidence
angle corresponding to the telescope boresight. The resulting relation
for :math:`\Delta\lambda` is:

.. math:: \Delta\lambda = \frac{dL}{mF} \mathrm{sin}(\alpha_{0}) \Delta\theta.

We then use the following numbers from `den Herder et al. (2001)
<https://ui.adsabs.harvard.edu/abs/2001A%26A...365L...7D/abstract>`_:
:math:`d` is 1/645.6 mm, :math:`L` is 7.5 m, :math:`F` is 6.7 m, and
:math:`\alpha_{0}` is 1.5762\ :math:`^{\circ}` to calculate the
typical conversion factor from :math:`\Delta\theta` in arcmin:

.. math:: \Delta\lambda = 0.1387~\mathrm{\AA} \ \Delta\theta

Note that the value in `Peterson et al. (2004)
<https://ui.adsabs.harvard.edu/abs/2004ApJ...615..545P/abstract>`_ is not
correct, because the factor :math:`\frac{L}{F}` was not applied. The
value in the above equation is used in rgsvprof to convert the spatial
profile from arcminute scales to wavelength scales.
