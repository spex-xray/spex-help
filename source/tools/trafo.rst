.. _sect:trafo:

Trafo
=====

Program *trafo* allows you to transform spectra and response matrices
from standard OGIP format (or from SPEX version 1 format) to the format
used by SPEX. It also gives you some options to combine data sets for
simultaneous spectral fitting, and to optimises the spectral data set for
speed, We discuss here first the different file formats, and then
explain the use of *trafo*.

Some theoretical background and technical details on the SPEX file
format are given in :ref:`sect:matrices` and we refer the interested
reader to that page for full details. Here we summarise some of the
basics.

The basic philosophy behind the SPEX file format is:

.. note::
   Keep things as simple as possible unless there is absolutely no
   alternative.

Therefore, SPEX uses one file containing all the information on the
spectrum, including subtracted background, that must have the extension
*.spo* and has FITS format with well-defined extensions and columns.
Also, there is only a single file containing all the information on the
response matrix, including effective area information, that must have
the extension *.res* and also has FITS format with well-defined
extensions and columns.

.. note::
  *Trafo* always produces the .spo and the .res files at the same time,
  as both are linked together tightly.


**Examples** of the usage of *trafo* can be found in :ref:`chap:threads` and
:ref:`sect:runtrafo`.

File formats spectra
--------------------

There are a number of differences between OGIP and SPEX spectral file
formats. See the `OGIP Spectral file format specification
<https://heasarc.gsfc.nasa.gov/docs/heasarc/ofwg/docs/spectra/ogip_92_007/ogip_92_007.html>`_.

.. _tab_ogipspex_spec:

.. table:: Spectral format comparison

    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Property             | OGIP                                                                                                                                              | SPEX                                                                                                            |
    +======================+===================================================================================================================================================+=================================================================================================================+
    | Files                | Separate files for source & optionally background and correction file                                                                             | One file for all                                                                                                |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Channel              | 2-byte or 4-byte column in spectral file                                                                                                          | Not used (should be by definition the row number of the table, starting to count at 1 without gaps)             |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Bin boundaries       | Real, but not in spectral file but in *ebounds* extension matrix                                                                                  | Double precision (for high-res spectra), and in spectral file                                                   |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Data                 | Counts (2-byte or 4-byte integer) or count rate (real, in counts  :math:`\mathrm{s}^{-1}`)                                                        | Only count rate (real, in counts :math:`\mathrm{s}^{-1}`)                                                       |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Errors               | Either explicitly given, or calculated using Poissonian statistics if *poiserr* keyword is given                                                  | Always explicitly given                                                                                         |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Exposure (s)         | One value for full spectrum                                                                                                                       | Can differ for each bin                                                                                         |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Background           | Unscaled value in separate file; needs *backscal* keyword or column in source & background file to determine scaling for source region            | Background subtracted value in one column; subtracted background (and its statistical error) in other columns   |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Quality flag         | 2-byte integer with 4 different values (0:math:`=`\ good, 1\ :math:`=`\ bad by s/w, 2\ :math:`=`\ dubious by s/w, 5\ :math:`=`\ set bad by user   | “no-nonsense” logical, bin is either to be used (true) or not (false)                                           |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Grouping             | 2-byte integer, :math:`+1` for start channel, :math:`-1` for continuation bin, :math:`0` if no grouping defined                                   | Two logicals: true/false is bin is first/last of a group (i.e., for no grouping, both are true)                 |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Area scaling         | *Areascal* keyword or column                                                                                                                      | Not allowed (can be handled with exposure time or response matrix)                                              |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Background scaling   | *Backscal* keyword or column                                                                                                                      | Worked out through explicit background subtraction in the spectrum                                              |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
    | Systematic error     | Keyword or column *sys\_err* in both source & background files                                                                                    | Two columns: one for fraction of source, one for fraction of background                                         |
    +----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+

Table: Differences between OGIP and SPEX in spectral file structure

In Table :ref:`tab_ogipspex_spec` we show the difference in structure
between the OGIP spectral file format and the format used by SPEX. In
addition to that, we make the following remarks.

For the energy grids, only energy (keV) units are allowed (not
wavelength units), as there is a one-to-one relation between both. This
number should be in double precision: for high-resolution spectra the
difference between upper- and lower energy can be small, and close
enough to the machine precision for single precision to cause some
annoying numerical problems.

In the error column, it is essential to give real Poissonian errors (in
case the spectrum is based on counts), and the use of e.g. Gehrels
statistics must be avoided; in those cases, it is better to calculate
the formal errors just from the square root of the number of raw counts.
Chandra grating spectra are sometimes delivered with Gehrels errors, but
this gives problems when the data need to be re-binned, and this is
usually the case as the Chandra-data are delivered over-sampled. Also,
never use 90 % errors, but always r.m.s. (“:math:`1\sigma`”) errors.

For the same reasons, the use of systematic errors should be avoided in
the spectral file, because after rebinning they would become smaller. It
is better to use no systematic errors in the spectral file, but in case
you really need them, within SPEX you can set them after you have done
the proper binning.

Also the use of quality flags should be avoided. It is better to provide
the user either with only “good” data, or to make the user aware of any
systematic limitations of the dats. When needed (either for instrumental
or astrophysical reasons), within SPEX it is possible to ignore data
ranges.

The usefulness of the *areascal* keywords is not very clear; the
XMM-Newton RGS software uses the *arescal* for some dead-time
corrections, but SPEX solves this in a more elegant way by allowing the
exposure time to be different for each data bin. Whenever *trafo*
encounters the arescal, it uses it to adjust the exposure time per bin.
If you give the “show data” command in , you see for each data set some
statistics, including mean, minimum and maximum exposure time per bin.

Finally, OGIP uses three columns (the background count rate, and the
backscal for the source and background region) to determine the
background that needs to be subtracted. In SPEX, this reduces to two
columns containing essentially the same information, namely the scaled
background count rate and its statistical error. Actually, what is
important in this is only the ratio of the backscal columns, not their
individual values.

In summary, whenever possible we recommend to use only the first seven
columns (bin boundaries, exposure time, source and background count
rates with their errors), and leave the other columns empty / default
(first/last channel flags, used, systematic errors).

File formats responses
----------------------

The OGIP standard is described `on this page
<https://heasarc.gsfc.nasa.gov/docs/heasarc/caldb/docs/memos/cal_gen_92_002/cal_gen_92_002.html>`_.

.. _tab_ogipspex_resp:

.. table:: Response format comparison

    +---------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | Property                                                                                          | OGIP                                                                                                                                                       | SPEX                                                                                                                                                                                             |
    +===================================================================================================+============================================================================================================================================================+==================================================================================================================================================================================================+
    | **Response:**                                                                                     |                                                                                                                                                            |                                                                                                                                                                                                  |
    +---------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | Files                                                                                             | Separate files for response (.rmf) & ancillary response file (.arf)                                                                                        | One file for all                                                                                                                                                                                 |
    +---------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | **Rmf extension:**                                                                                |                                                                                                                                                            |                                                                                                                                                                                                  |
    +---------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | Components                                                                                        | 1 component only                                                                                                                                           | Matrix may have multiple components                                                                                                                                                              |
    +---------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | Energy grid                                                                                       | One grid for the matrix, single precision                                                                                                                  | Each component can have its own grid, double precision                                                                                                                                           |
    +---------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | Response groups (:math:`\equiv` contiguous row of non-zero matrix elements for the same energy)   | Multiple groups per row; specify number of groups (2-byte), first channel & number of channels (2-byte or 4-byte) and the matrix elements for each group   | In extension “spex\_resp\_group” specify bin lower and upper energy, first channel, last channel and number of channels for the group; in extension "spex\_resp\_resp give the matrix elements   |
    |                                                                                                   |                                                                                                                                                            | Optimalisation & No & Matrix may also contain derivatives of the matrix with respect to photon energy                                                                                            |
    |                                                                                                   |                                                                                                                                                            | **Ebounds extension:** & &                                                                                                                                                                       |
    |                                                                                                   |                                                                                                                                                            | Channel energies & Single precision & Not here, but in spectral file and double precision                                                                                                        |
    |                                                                                                   |                                                                                                                                                            | **Arf extension:** & &                                                                                                                                                                           |
    |                                                                                                   |                                                                                                                                                            | Columns & Contains lower, upper energy and area (in cm\ :math:`^2`) & N/A (included in matrix; but note units are SI, i.e. m\ :math:`^2`)                                                        |
    +---------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

Table: Differences between OGIP and SPEX in response matrix structure

In Table :ref:`tab_ogipspex_resp` we show the difference in structure
between the OGIP response file format and the format used by SPEX.

Multiple spectra
----------------

With *trafo*, you can combine different datasets into one combined
spectrum and response file. There can be various reasons to do so:

#. You may want to combine different, similar instruments from the same
   observation (e.g. RGS1 and RGS2) or different spectral orders (e.g.
   RGS1 :math:`-1` and RGS1 :math:`-2` spectral order), or even combine
   pn with RGS. However, in these cases you may prefer to have the
   spectra in separate files, as that allows you easier to use only part
   of the data.

#. You may have time-resolved spectra of the same source taken with the
   same instrument

#. You may have multiple spatial regions of the same source, observed
   with the same instruments.

For more info, we refer to :ref:`sec:sectorsandregions`. *Trafo* allows
you to achieve this.

How to use *trafo*
------------------

*Trafo* is an interactive program. It asks a few questions, which are
usually self-explanatory. However, here we give a brief overview.

#. The first question *trafo* asks if you want to transform data from
   OGIP format (option 1), the now abandoned SPEX version 1 binary
   format (option 2) or the new SPEX format (option 3).

#. The next question is how many spectra you want to transform. Usually
   you will enter here the number 1, but if you want to create
   concantinated spectra (see previous section) you should enter here
   the number of spectra. In that case, the next questions will be
   repeated for each spectrum.

#. Now you are asked to enter the maximum number of response groups per
   energy per spectrum. This is needed in order to allocate scratch
   memory; for almost any “sane” spectrum that we have seen sofar, a
   large number like 10000 is always sufficent here. Anyway, *trafo*
   will warn you and quit whenever you will reach this limit.

#. Optional: for multiple spectra, you are asked how many sectors you
   want to create. See the description in Sect. [sec:sectorsandregions]
   for more info on sectors and regions.

#. Optional: if you have more than 1 spectrum, *trafo* asks you to enter
   the sector and region number that you want to assign to the spectrum
   that you will enter next. If The sector or region number are out of
   the allowed range as specified before, *trafo* will keep repeating
   this question until you have entered valid numbers.

#. Next a question is asked about partitioning of the matrix. You have
   here basically three options. Option 1: keep the structure of the
   matrix essentially as provided by the software package that created
   the OGIP files. The SPEX matrix will have 1 component, with no
   re-arrangements. Option 2: rearrange the matrix into contiguous
   groups. Your matrix may have been splitted into multiple regions, and
   for one photon energy you might have multiple regions (for instance,
   higher spectral orders for grating spectrometers without
   energy-sensitive detectors like the LETG/HRC-S or EUVE
   spectrometers); or a main diagonal and a fluorescence component, etc.
   *Trafo* will attempt to sort your response matrix accrding to these
   physically distinct components, by checking if for a given energy a
   response group has overlap in energy with an already existing group.
   Option 3: split into N roughly equal-sized components. This option is
   recommended for large matrices of high-resolution instruments such as
   RGS. It allows for the optimal usage of multiple processors during
   spectral fitting, provided your machine has of course more than one
   processor.

   Note that if you combine spectra that are already in SPEX version 2.0
   or higher format, you do not have this option because we assume you
   have already optimised your matrix when creating the original version
   2.0 files.

#. Optional: if you have selected option 3 above, *trafo* ask you the
   number of components. This can be any number, but experience has
   shown that a power of 2, typically between 8 and 32 works best (even
   on dual core processors).

#. Now you must enter the file name of the OGIP-type spectrum.
   Alternatively, if you combine SPEX version 2.0 files, you are
   prompted for the .spo file and you do not need to answer some of the
   questions below.

#. If the OGIP spectral file does not provide you the name of a
   background spectrum, you are prompted if you want to subtract a
   background spectrum. Be aware that sometimes background subtraction
   has already been taken into account in OGIP-spectra. Check carefully.
   If you answer “yes” to this question, then *trafo* will ask you for
   the filename of the background file.

#. In a few rare cases (e.g. Einstein SSS data), there is a second
   background file needed, the so-called “correction file”. If such a
   file is to be used, *tarfo* will read it but it *must* be indicated
   then as the corfil extension in the spectral file.

#. *Trafo* now makes a few sanity checks. If there is some problem,
   *trafo* will report it and stop. It checks for the same number of
   data channels in source and background (or correction) file. Further,
   and this is important to know, data bins that are being qualified as
   “bad” in the background or correction files, but “good” in the source
   file, will end up as “bad” bins in the final, background subtracted
   spectrum.

#. *Trafo* reports the total number of bad channels. You now can decide
   if you want to ignore the bad channels. Default is no (keep data; why
   would you otherwise have taken the burden to keep them in your
   datasets), but if you answer “yes”, the bad channels will be ignored
   by *trafo* (well, flaged as not to be used in the .spo file).

#. Optional: if the OGIP-spectrum contains grouping information, *trafo*
   asks if that grouping should be used or ignored in the final
   spectrum.

#. Optional: if there is no response matrix file specified in the
   spectral pha-file, *trafo* asks for the name of the matrix.

#. Optional: while reading the response matrix, *trafo* makes some
   sanity checks. For instance, if the lower bin boundary of an energy
   bin is not smaller than the upper bin boundary, the user can correct
   this manually (some matrices are provided erroneously with zero width
   bins). But be sure that you understand here whjat you are doing!

#. Optional: also, some instruments assign an energy 0 to the lower
   energy boundary of the first bin. SPEX does not like this (as it
   gives trouble if you convert to a wavelength scale, for instance), so
   you can change the lower boundary manually to a small, non-zero
   number here.

#. Optional: in a few rare cases, matrices/data are poorly designed,
   such that the spectrum starts with a channel 0, but the matrix starts
   with channel 1. It is then not always clear which spectral element
   corresponds to which response element. *Trafo* tests for occurrences
   where the “flchan” keyword in the matrix equals 1, but the first
   channel in the data is 0. In this case it is possible to shift the
   response array by 1 channel, although this should be done as a last
   resort, and needs careefull checking if no mistakes are made! *Trafo*
   also tests for occurrences where the “flchan” keyword in the matrix
   does not equal 1 (usually 0), but the first channel in the data is 0.
   In this case it is advisable and possible to shift the response array
   by 1 channel, but again care should be taken!

#. Optional: if there is no ancillary (effective area) file specified in
   the spectrum, *trafo* reports this and asks if the user wants to use
   such an arf-file nevertheless. Default is “no”, but if “yes” is
   entered, the name of the arf-file is prompted for.

#. As a next step, model energy bins with zero effective area are
   deleted from the file. Such bins usually occur at the low and
   high-energy side of the matrix. Deleting them saves computing time.
   Further, any necessary rebinning (if indicated by the grouping falgs)
   is done.

#. *Trafo* will tell you how many components it has found or created. It
   now asks you if you want to apply a shift to your spectra. Usually
   you should enter here 0. Useful cases to enter a non-zero shift
   :math:`s` are situations where for instance your energy or wavelength
   scale is not yet sufficiently well calibrated. *trafo* then in that
   case puts the data of bin nr :math:`k+s` into bin :math:`s`.

#. *Trafo* reports if the spectrum and matrix will be swapped (in case
   the original OGIP data were in wavelength order). Remember that SPEX
   *always* uses energy order.

#. The pre-last question is the filename for the spectrum that has been
   created (without the .spo extension, that *trafo* will add
   automatically).

#. Finally the filename for the response matrix that has been created is
   asked (without the .res extension, that *trafo* will add
   automatically).

Alternatives for trafo
----------------------

Since we provide a package with Python tools for SPEX, there are a few
scripts available that perform conversions from OGIP to SPEX format.
`ogip2spex <https://spex-xray.github.io/pyspextools/tutorials/ogip2spex.html>`_
is the program closest to the trafo program and can convert one spectrum
from OGIP to SPEX format using only command line arguments.
