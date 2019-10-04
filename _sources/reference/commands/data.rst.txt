.. _sec:data:

Data: read response file and spectrum
=====================================

Overview
~~~~~~~~

In order to fit an observed spectrum, SPEX needs a spectral data file
and a response matrix. These data are stored in FITS format, tailored
for SPEX (see section `Response formats <#sec:resp:formats>`__). The
data files need not necessarily be located in the same directory, one
can also give a pathname plus filename in this command.

.. warning:: Filenames should be entered in the data command without their
             extension. For the files response.res and spectrum.spo, the
             data command would look like: data response spectrum.

Syntax
~~~~~~

| The following syntax rules apply:
| ``data #a1 #a2`` : Read response matrix #a1 and spectrum #a2
| ``data delete instrument #i`` : Remove instrument #i from the data set
| ``data merge sum #i:`` : Merge instruments in range #i: to a single
  spectrum and response matrix, by adding the data and matrices
| ``data merge aver #i:`` : Merge instruments in range #i: to a single
  spectrum and response matrix, by averaging the data and matrices
| ``data save #i #a [overwrite]`` : Save data #a from instrument #i with
  the option to overwrite the existent file. SPEX automatically tags the
  .spo extension to the given file name. No response file is saved.
| ``data show`` : Shows the data input given, as well as the count
  (rates) for source and background, the energy range for which there is
  data the response groups and data channels. Also the integration time
  and the standard plotting options are given.

Examples
~~~~~~~~

| ``data mosresp mosspec`` : read a spectral response file named
  mosresp.res and the corresponding spectral file mosspec.spo. Hint,
  although 2 different names are used here for ease of understanding, it
  is eased if the spectrum and response file have the same name, with
  the appropriate extension.
| ``data delete instrument 1`` : delete the first instrument
| ``data merge aver 3:5`` : merge instruments 3–5 into a single new
  instrument 3 (replacing the old instrument 3), by averaging the
  spectra. Spectra 3–5 could be spectra taken with the same instrument
  at different epochs.
| ``data merge sum 1:2`` : add spectra of instruments 1–2 into a single
  new instrument 1 (replacing the old instrument 1), by adding the
  spectra. Useful for example in combining XMM-Newton MOS1 and MOS2
  spectra.
| ``data save 1 mydata`` : Saves the data from instrument 1 in the
  working directory under the filename of mydata.spo
| ``data /mydir/data/mosresp /mydir/data/mosspec`` : read the spectrum
  and response from the directory /mydir/data/
