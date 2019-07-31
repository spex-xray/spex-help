Sector: creating, copying and deleting of a sector[sec:sector]
==============================================================

Overview
~~~~~~~~

This allows one to create, delete, copy, and show the number of sectors,
used for the analysis of the data. Sectors are designed to allow
modeling of different sources of radiation with its own spectral model.
This way, common components can be fit simultaneously, while the
observed spectra are of a different origin. One can create a sector for
another (unresolved) source in the spectrum, for modeling particle
background, or for spectra extracted in a different time interval for a
time variable source. See for more details about sectors and regions
section \ `[sec:sectorsandregions] <#sec:sectorsandregions>`__.

For doing spectral fitting of data sets, the sectors need to be
specified in the response matrix of the data: the response file should
tell which sector number corresponds to a given part of the matrix.

The sector command features also a spectral dump mode (adump) that
writes the model spectrum to an ascii file, formatted such that it is
suited for the SPEX file model. The first line of the output file is an
integer showing the number of bins, and the following lines show the
energy bin centroid and the luminosity in 10\ :math:`^{44}` ph/s/keV.

Syntax
~~~~~~

The following syntax rules apply:

| ``sector new`` : Creates a new sector, which can have its own model.
| ``sector show`` : Gives the number of sectors that are currently used.
| ``sector copy #i`` : Copies the model for sector #i to a new sector.
| ``sector delete #i`` : Deletes sector #i.
| ``sector adump #i #a overwrite`` : Writes the model spectrum of sector
  number #i to an ASCII file with name #a.

Examples
~~~~~~~~

| ``sector new`` : Creates a new sector.
| ``sector copy 2`` : Creates a new sector, with the same spectral model
  as used in sector 2. This can be useful if the spectra of the
  different sectors are very similar in composition.
| ``sector delete 3`` : Deletes sector number 3.
| ``sector adump 1 model.txt`` : Dumps the spectrum in sector 1 to
  model.txt
