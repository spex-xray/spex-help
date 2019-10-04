.. _sect:rgsfmat:

RGS_fmat
========

Program *RGS_fmat* produces a response matrix for a fluxed spectrum
created by the XMM-Newton SAS task *rgsfluxer*.

The user should provide an FITS file that is the output of the
*rgsfluxer* program. That program *must* be run with 3600 equidistant
wavelength bins between 4 and 40 Å. The program takes this fluxed
spectrum, and creates a response matrix with effective area
1 :math:`\mathrm{m}^2` for each wavelength, and a redistribution function
normalised to unity for each wavelength.

This redistribution function is slightly different for RGS1 and RGS2,
and also different for the second order spectra. Hence, the user must
provide *RGS_fmat* the information about which RGS and spectral order
is used.

In addition, it is also possible to make a single response matrix for
combined RGS1 and RGS2 data, first and second order. In this case, first
the program *RGS_fluxcombine* must have been run with option=2. That
program then creates the *rgsfluxer*-compatible file, with the addition
of four extra columns, containing for each wavelength the relative
weight of the different instrument/order to the total spectrum. These
weights are used to weigh the redistribution functions in the combined
spectra.

The redistribution function has been parametrised as the sum of three
(first order) or 4 (second order) Gaussians, with wavelength-dependent
width and relative normalisations. These parametrisations have been
obtained by fitting the “true” redistribution function as it is in SAS
in 2014 after having re-investigated the RGS line-spread-function by the
RGS consortium.

The model energy grid used for the matrix has a uniform spacing of 1/9th
of the instrumental FWHM, approxinmated here simply by
0.06/\ :math:`\vert m\vert`, where :math:`m` is the spectral order. The
matrix is fully -compatible, in the sense that it also uses the
derivatives of the matrix with respect to energy to get the most
accurate results. There is no way back from this to OGIP-typs spectra!

.. warning::
   The redistribution function is limited to
   :math:`\pm`\ 1 Å around the central wavelength. For most continuum and
   absorption line spectra this is sufficient. In a few rare cases of very
   bright emission line sources, the user is advised to compare the
   resulting fit with a direct fit using the original SAS response matrices
   and spectral files.

The matrix is much smaller: the combined RGS matrix has a size of 8.2
Mbyte. This should be compared to the total size of the four matrices in
OGIP format, which is over 200 Mbyte.
