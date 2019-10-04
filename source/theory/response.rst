.. _sect:matrices:

Optimal definition of respons matrices
======================================

The SPEX FITS format allows us to bin spectra and response matrices on
arbitrary grids, which enables us to bin spectra and responses in an optimal way.
In `Kaastra & Bleeker (2016)
<https://ui.adsabs.harvard.edu/abs/2016A%26A...587A.151K/abstract>`_
a theoretical framework is developed in order
to estimate the optimum binning of X-ray spectra. Expressions are
derived for the optimum bin size for the model spectra as well as
for the observed data using different levels of sophistication.
It is shown that by not only taking into account the number of
photons in a given spectral model bin but also its average energy
(not necessarily equal to the bin center)
the number of model energy bins and the size of the response matrix
can be reduced by a factor of 10-100. The response matrix should then
not only contain the response at the bin center, but also its derivative
with respect to the incoming photon energy. In the coming sections
we describe practical guidelines how to construct the optimum energy
grids as well as how to structure the response matrix. Finally a few
examples are given to illustrate the present methods.

Proposed file formats
---------------------

In `Kaastra & Bleeker (2016) <https://ui.adsabs.harvard.edu/abs/2016A%26A...587A.151K/abstract>`_
it was shown how the optimum data
and model binning can be determined, and what the corresponding optimum
way to create the instrumental response is. Now I focus upon the
possible data formats for these files.

For large data sets, the fastest and most transparant way to save a
response matrix to a file would be to use direct fortran or C write
statements. Unfortunately not all computer systems use the same binary
data representation. Therefore the FITS-format has become the *de facto*
standard in many fields of astronomical data analysis. For that reason I
propose here to save the response matrix in FITS-format.

A widely used response matrix format is NASAs OGIP format. This is used
e.g. as the data format for XSPEC. There are a few reasons that we
propose *not* to adhere to the OGIP format here, as listed below:

#. The OGIP response file format as it is currently defined does not
   account for the possibility of response derivatives. As was shown in
   the previous sections, these derivatives are needed for the optimum
   binning. Thus, the OGIP format would need to be updated.

#. In the later versions of OGIP new possibilities of defining the
   energy grid have been introduced that are prone to errors. In
   particular the possibility of letting grids start at another index
   than 1 may (and has led) often to errors. The software also becomes
   unncessarily complicated, having to account for different possible
   starting indices. Moreover, the splitting into arf and rmf files
   makes it necessary to check if the indexing in both files is
   consistent, and also if the indexing in the corresponding spectra is
   consistent.

#. There are some redundant quantities in the OGIP format, like the
   âareascalâ keyword. When the effective area should be scaled by a
   given factor, this can be done explicitly in the matrix.

#. As was shown in this work, it is more efficient to do the grouping
   within the response matrix differently, splitting the matrix into
   components where each component may have its own energy grid. This is
   not possible within the present OGIP format.

Proposed response format
""""""""""""""""""""""""

I propose to give all response files the extension ``.res``, in order not
to confuse with the ``.rmf`` or ``.arf`` files used within the OGIP format.

The file consists of the mandatory primary array that will remain empty,
plus a number of extensions. In principle, we could define an extension
for each response component. However, this may result into practical
problems. For example, the fitsio-package allows a maximum of 1000
extensions. The documentation of fitsio says that this number can be
increased, but that the access time to later extensions in the file may
become very long.

In principle we want to allow for data sets with an unlimited number of
response components. For example, when a cluster spectrum is analysed in
4 quadrants and 10 radial annuli, one might want to extract the spectrum
in 40 detector regions and model the spectrum in 40 sky sectors,
resulting in principle in at least 1600 response components (this may be
more if the response for each sky sector and detector region has more
components).

Therefore I propose to use only three additional and mandatory
extensions.

The first extension is a binary table with 4 columns and contains for
each component the number of data channels, model energy bins, sky
sector number and detector region number (see table below).

The second extension is a binary table with 5 columns and contains for
each model energy bin for each component the lower model energy bin
boundary (keV), the upper model energy bin boundary (keV), the starting
data channel, end data channel and total number of data channels for the
response group (see table below).

The third extension is a binary table with 2 columns and contains for
each data channel, for each model energy bin for each component the
value of the response at the bin center and its derivative with respect
to energy (see table below). SI units are mandatory (i.e.
:math:`\mathrm{m}^2` for the response, :math:`\mathrm{m}^2`
:math:`\mathrm{keV}^{-1}` for the response derivative).

**First extension to the response file**

+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| keyword                  | description                                                                                                                                                                                                            |
+==========================+========================================================================================================================================================================================================================+
| EXTNAME (=RESP_INDEX)    | Contains the basic indices for the components in the form of a binary table                                                                                                                                            |
+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NAXIS1 = 16              | There are 16 bytes in one row                                                                                                                                                                                          |
+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NAXIS2 =                 | This number corresponds to the total number of components (the number of rows in the table)                                                                                                                            |
+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NSECTOR =                | This 4-byte integer is the number of sky sectors used.                                                                                                                                                                 |
+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NREGION =                | This 4-byte integer is the number of detector regions used.                                                                                                                                                            |
+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NCOMP =                  | This 4-byte integer is the totalnumber of response components used (should be equal to NAXIS2).                                                                                                                        |
+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TFIELDS = 4              | The table has 4 columns; all columns are written as 4-byte integers (TFORM=1J)                                                                                                                                         |
+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE1 = NCHAN           | First column contains the number of data channels for each component. Not necessarily the same for all components, but it must agree with the number of data channels as present in the corresponding spectrum file.   |
+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE2 = NEG             | Second column contains the number of model energy grid bins for each component. Not necessarily the same for all components.                                                                                           |
+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE3 = SECTOR          | Third column contains the sky sector number as defined by the user for this component. In case of simple spectra, this number should be 1.                                                                             |
+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE4 = REGION          | Fourth column contains the detector region number as defined by the user for this component. In case of simple spectra, this number should be 1.                                                                       |
+--------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

**Second extension to the response file**

+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| keyword                 | description                                                                                                                                                                                                                                         |
+=========================+=====================================================================================================================================================================================================================================================+
| EXTNAME (=RESP_COMP)    | Binary table with for each row relevant index information for a single energy of a component; stored sequentially, starting at the lowest component and within each component at the lowest energy.                                                 |
+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NAXIS1 = 20             | There are 20 bytes in one row                                                                                                                                                                                                                       |
+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NAXIS2 =                | This number must be the sum of the number of model energy bins added for all components (the number of rows in the table).                                                                                                                          |
+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TFIELDS = 5             | The table has 5 columns                                                                                                                                                                                                                             |
+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE1 = EG1            | The lower energy (keV) as a 4-byte real of the relevant model energy bin                                                                                                                                                                            |
+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE2 = EG2            | The upper energy (keV) as a 4-byte real of the relevant model energy bin                                                                                                                                                                            |
+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE3 = IC1            | The lowest data channel number (as a 4-byte integer) for which the response at this model energy bin will be given. The response for all data channels below IC1 is zero. Note that IC1 should be at least 1 (i.e. start counting at channel 1!).   |
+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE4 = IC2            | The highest data channel number (as a 4-byte integer) for which the response at this model energy bin will be given. The response for all data channels above IC2 is zero.                                                                          |
+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE5 = NC             | The total number of non-zero response elements for this model energy bin (as a 4-byte integer). NC is redundant, and should equal IC2-IC1+1, but it is convenient to have directly available in order to allocate memory for the response group.    |
+-------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

**Third extension to the response file**

+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| keyword                    | description                                                                                                                                                                                                                                                              |
+============================+==========================================================================================================================================================================================================================================================================+
| EXTNAME (=RESP_RESP)       | Contains the response matrix elements and their derivatives with respect to model energy. The data are stored sequentially, starting at the lowest component, within each component at the lowest energy bin, and within each energy bin at the lowest channel number.   |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NAXIS1 = 8                 | There are 8 bytes in one row                                                                                                                                                                                                                                             |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NAXIS2 =                   | This number must be the sum of the NC values, added for all model energy bins and all components (the number of rows in the table).                                                                                                                                      |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TFIELDS = 2                | The table has 2 columns                                                                                                                                                                                                                                                  |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE1 = Response          | The response values :math:`R_{ij,0}`, stored as a 4-byte real **in SI units** i.e. in units of :math:`m^{2}`.                                                                                                                                                            |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE1 = Response_Der      | The response derivative values :math:`R_{ij,1}`, stored as a 4-byte real **in SI units** i.e. in units of :math:`m^{2}` :math:`keV^{-1}`.                                                                                                                                |
+----------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Any other information that is not needed for the spectral analysis may
be put into additional file extensions, but will be ignored by the
spectral analysis program.

Finally I note that the proposed response format is used as the standard
format by version 2.0 of the SPEX spectral analysis package.

Proposed spectral file format
"""""""""""""""""""""""""""""

There exists also a standard OGIP FITS-type format for spectra. As for
the OGIP response file format, this format has a few redundant
parameters and not absolutely necessary options.

There is some information that is absolutely necessary to have. In the
first place the *net source count rate* :math:`S_i` (counts/s) and *its
statistical uncertainty* :math:`\Delta S_i` (counts/s) are needed. These
quantities are used e.g. in a classical :math:`\chi^2`-minimization
procedure during spectral fitting.

In some cases the count rate may be rather low; for example, in a
thermal plasma model at high energies the source flux is low, resulting
in only a few counts per data channel. In such cases it is often
desirable to use different statistics for the spectral fitting, for
example maximum likelihood fitting. Such methods are often based upon
the number of counts; in particular the difference between Poissonian
and Gaussian statistics might be taken into account. In order to allow
for these situations, also the *exposure time* :math:`t_i` per data
channel is needed. This exposure time needs not to be the same for all
data channels; for example, a part of the detector might be switched off
during a part of the observation, or the observer might want to use only
a part of the data for some reason.

Further, in several situations the spectrum will contain a contribution
from background events. The observed spectrum can be corrected for this
by subtracting the *background spectrum* :math:`B_i` scaled at the
source position. In cases where one needs to use Poissonian statistics,
including the background level, this subtracted background :math:`B_i`
must be available to the spectral fitting program. Also for spectral
simulations it is necessary to include the background in the statistics.

The background can be determined in different ways, depending upon the
instrument. For the spectrum of a point-source obtained by an imaging
detector one could extract the spectrum for example from a circular
region, and the background from a surrounding annulus and scale the
background to be subtracted using the area fractions. Alternatively, one
could take an observation of an `empty` field, and using a similar
extraction region as for ther source spectrum, one could use the empty
field observation scaled by the exposure times to estimate the
background.

The background level :math:`B_i` may also contain noise, e.g. due to
Poissonion noise in the background observation. In some cases (e.g. when
the raw background count rate is low) it is sometimes desirable to
smooth the background to be subtracted first; in this case the *nominal
background uncertainty* :math:`\Delta
B_i` no longer has a Poissonian distribution, but its value can
nevertheless be determined. In spectral simulations one may account for
the background uncertainty by e.g. simply assuming that the square of
the background signal-to-noise ratio :math:`(B_i/\Delta B_i)^2` has a
Poissonian distribution.

For spectral simulations, however, one should be able to know the
*expected* background. This cannot be derived from the observed
(Poissonian) background if by chance a data channel has zero background
counts. To alleviate that problem, we have introduced an additional
column in the spectral file that represents the exposure ratio of the
background region divided by that of the source region, where the
exposure is the product of exposure time times extraction area.

Furthermore, there may be systematic calibration uncertainties, for
example in the instrumental effective area or in the background
subtraction. These systematic errors may be expressed as a fraction of
the source count rate (such that the total *systematic source
uncertainty* is :math:`\epsilon_{si}S_i`) and/or as a fraction of the
subtracted background (such that the total *systematic background
uncertainty* is :math:`\epsilon_{bi}B_i`). Again, these systematic
errors may vary from data channel to data channel. They should also be
treated different than the statistical errors in spectral simulations:
they must be applied to the simulated spectra *after* that the
statistical errors have been taken into account by drawing random
realisations. Also, whenever spectral rebinning is done, the systematic
errors should be averaged and applied to the rebinned spectrum: a 10%
systematic uncertainty over a given spectral range may not become 1% by
just rebinning by a factor of 100, but remains 10%, while a statistical
error of 10% becomes 1% after rebinning by a factor of 100.

In the previous sections we have shown how to choose the optimal data
binning. The observer may want to rebin further in order to increase the
significance of some low-statistics regions in the spectrum, or may want
to inspect the unbinned spectrum. Also, during spectral analysis or
beforehand the observer may wish to discard certain parts of the
spectrum, e.g. data with bad quality or parts of the spectrum that he is
not interested in. For these reasons it is also usefull to have the
proposed rebinning scheme available in the spectral file.

I propose to add to each data channel three logical flags (either true
or false): first, if the data channel is the *first channel* of a group
(:math:`f_i`); next, if the data channel is the *last channel* of a
group (:math:`l_i`); and finally, if the data channel is *to be used*
(:math:`u_i`). A channel may be both first and last of a rebinning group
(:math:`f_i` and :math:`l_i` both true) in the case of no rebinning. The
first data channel :math:`i=1` always *must* have :math:`f_i` true, and
the last data channel :math:`l_i` true. Whenever there are data channels
that are not used (:math:`u_i` false), the programmer should check that
the first data channel after this bin that is used gets :math:`f_i` true
and the last data channel before this bin taht is used gets :math:`l_i`
true. The spectral analysis package needs also to check for these
conditions upon reading a data set, and to return an error condition
whenever this is violated.

Finally, I propose to add the nominal energies of the data bin
boundaries :math:`c_{i1}` and :math:`c_{i2}` to the data file. This is
very useful if for example the observed spectrum is plotted outside the
spectral fitting program. In the OGIP format, this information is
contained in the response matrix. I know that sometimes objections are
made against the use of these data bin boundaries, expressed as
energies. Of course, formally speaking the observed data bin boundaries
often do not have energy units; it may be for example a detector
voltage, or for grating spectra a detector position. However, given a
proper response. However given a corresponding response matrix there is
a one-to-one mapping of photon energy to data channel with maximum
response, and it is this mapping that needs to be given here. In the
case of only a single data channel (e.g. the DS detector of EUVE) one
might simply put here the energies corresponding to the FWHM of the
response. Another reason to put the data bin boundaries in the spectral
file and not in the response file is that the response file might
contain several components, all of which relate to the same data bins.
And finally, it is impossible to analyse a spectrum without knowing
simultaneously the response. Therefore, the spectral analysis program
should read the spectrum and response together.

As a last step we must deal with multiple spectra, i.e. spectra of
different detector regions that are related through the response matrix.
In this case the maximum number of FITS-file extensions of 1000 is a
much smaller problem then for the response matrix. It is hard to imagine
that anybody might wish to fit more than 1000 spectra simultaneously;
but maybe future will prove me to be wrong. An example could be the
following. The supernova remnant Cas A has a radius of about 3". With a
spatial resolution of 10", this would offer the possibility of analysing
XMM-EPIC spectra of 1018 detector regions. At the scale of 10" the
responses of neighbouring regions overlap so fitting all spectra
simultaneously could be an option.

Therefore it is wise to stay here on the conservative side, and to write
the all spectra of different detector regions into one extension. As a
result we propose the following spectral file format.

After the null primary array the first extension contains the number of
regions for the spectra, as well as a binary table with the number of
data channels per region (see table below). This helps to allocate
memory for the spectra, that are stored as one continuous block in the
second extension (see table below).

**First extension to the spectrum file**

+----------------------------+----------------------------------------------------------------------------------------------------------------------------+
| keyword                    | description                                                                                                                |
+============================+============================================================================================================================+
| EXTNAME (=SPEC\_REGIONS)   | Contains the spectral regions in the form of a binary table                                                                |
+----------------------------+----------------------------------------------------------------------------------------------------------------------------+
| NAXIS1 = 4                 | There are 4 bytes in one row                                                                                               |
+----------------------------+----------------------------------------------------------------------------------------------------------------------------+
| NAXIS2 =                   | This number corresponds to the total number of regions (spectra) contained in the file (the number of rows in the table)   |
+----------------------------+----------------------------------------------------------------------------------------------------------------------------+
| TFIELDS = 1                | The table has 1 column, written as 4-byte integer (TFORM=1J).                                                              |
+----------------------------+----------------------------------------------------------------------------------------------------------------------------+
| TTYPE1 = NCHAN             | Number of data channels for this spectrum.                                                                                 |
+----------------------------+----------------------------------------------------------------------------------------------------------------------------+

**Second extension to the spectrum file**

+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| keyword                        | description                                                                                                                                                                 |
+================================+=============================================================================================================================================================================+
| EXTNAME (=SPEC\_SPECTRUM)      | Contains the basic spectral data in the form of a binary table                                                                                                              |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NAXIS1 = 28                    | There are 28 bytes in one row                                                                                                                                               |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| NAXIS2 =                       | This number corresponds to the total number of data channels as added over all regions (the number of rows in the table)                                                    |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TFIELDS = 12                   | The table has 12 columns.                                                                                                                                                   |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE1 = Lower_Energy          | Nominal lower energy of the data channel :math:`c_{i1}` in keV; 4-byte real.                                                                                                |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE2 = Upper_Energy          | Nominal upper energy of the data channel :math:`c_{i2}` in keV; 4-byte real.                                                                                                |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE3 = Exposure_Time         | Net exposure time :math:`t_i` in s; 4-byte real.                                                                                                                            |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE4 = Source_Rate           | Background-subtracted source count rate :math:`S_i` of the data channel in counts/s; 4-byte real.                                                                           |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE5 = Err_Source_Rate       | Background-subtracted source count rate error :math:`\Delta S_i` of the data channel in counts/s (i.e. the statistical error on Source_Rate); 4-byte real.                  |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE6 = Back_Rate             | The background count rate :math:`B_i` that was subtracted from the raw source count rate in order to get the net source count rate :math:`S_i`; in counts/s; 4-byte real.   |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE7 = Err_Back_Rate         | The statistical uncertainty :math:`\Delta B_i` of Back_Rate in counts/s; 4-byte real.                                                                                       |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE8 = Exp_Rate              | ratio of the exposures (time :math:`\times` area) for the background region divided by that of the source region; dimensionless; 4-byte real.                               |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE9 = Sys_Source            | Systematic uncertainty :math:`\epsilon_{si}` as a fraction of the net source count rate :math:`S_i`; dimensionless; 4-byte real.                                            |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE10 = Sys_Back             | Systematic uncertainty :math:`\epsilon_{bi}` as a fraction of the subtracted background count rate :math:`B_i`; dimensionless; 4-byte real.                                 |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE11 = First                | True if it is the first channel of a group; otherwise false. 4-byte logical.                                                                                                |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE12 = Last                 | True if it is the last channel of a group; otherwise false. 4-byte logical.                                                                                                 |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| TTYPE13 = Used                 | True if the channel is to be used; otherwise false. 4-byte logical.                                                                                                         |
+--------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
