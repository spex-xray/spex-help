.. _sect:file:

File: model read from a file
============================

This model reads a spectrum from a file. The user inputs a spectrum at
:math:`n` energy bins (:math:`n>1`). The file containing the spectrum
should have the follwing format:

-  first line: :math:`n`

-  second line: :math:`E_1`, :math:`S_1`

-  third line: :math:`E_2`, :math:`S_2`

-  :math:`\ldots`

-  last line: :math:`E_n`, :math:`S_n`

Here :math:`E_i` is the energy of a photon in keV, and :math:`S_i` is
the spectrum in units of :math:`10^{44}`
photons :math:`\mathrm{s}^{-1}` :math:`\mathrm{keV}^{-1}`. All energies :math:`E_i` must
be positive, and the grid must be monotonically increasing (two
subsequent energies may not have the same value). Also, the spectrum
:math:`S_i` must be strictly positive (i.e. :math:`S_i=0` is not
allowed).

SPEX then calculates the spectrum by linear interpolation in the
:math:`\log E - \log S` plane (this is why fluxes must be positive). For :math:`E<E_1`
and :math:`E>E_n` however, the spectrum is put to zero. Finally, the
spectrum is multiplied by the scale factor :math:`N` prescribed by the
user.

The parameters of the model are:

| ``norm`` : Normalisation factor :math:`N`. Default value: 1.
| ``file`` : The file name of the file containing the spectrum
