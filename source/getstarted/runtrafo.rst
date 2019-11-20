.. _sect:runtrafo:

How to convert spectra to SPEX format
=====================================

.. highlight :: none

Trafo is a program to convert OGIP spectra and responses into SPEX format.
Before trafo is started, you need the OGIP spectra and responses
first. Please read the documentation regarding your dataset for
more information on how to create OGIP files. The minimum that
trafo needs is a spectrum (.pi or .pha) and a response matrix
(.rmf or .rsp). If you want to subtract background spectra or if
you have an additional arf file, then please also collect these
files in your working directory.

.. note:: There is also an alternative for the trafo program called
          ogip2spex. This program is part of the SPEX Python tools
          (PYSPEX). This program takes the necessary input from the
          command line and is easy for scripting. More information
          about ogip2spex can be found on the `Pyspex Github
          documentation page <https://spex-xray.github.io/pyspextools/tutorials/ogip2spex.html>`__.

Starting trafo
--------------

It is best to run trafo in the directory where your OGIP files
are. It is an interactive program, so it will ask the user for
information when the program is run.

:: 
   
    user@linux:~> trafo  
    Program trafo: transform data to SPEX 2.0 format
    This is version 1.04, of trafo

    Are your data in OGIP format            : type=1
    Old (Version 1.10 and below) SPEX format: type=2
    New (Version 2.00 and above) SPEX format: type=3

    Enter the type: 
                   

The first questions are quite straightforward. In the case of OGIP
spectra, the type is always 1. In principle, it is possible to put
more than one spectrum in a spo and res file, but for most simple
cases transforming a single spectrum is sufficient.

::

    Enter the type: 1  
    Enter the number of spectra you want to transform: 1  
    Enter the maximum number of response groups per energy per spectrum: 100000
                     
The maximum number of response groups should just be a large
number in nearly all cases. In special cases, it can put a limit
on the number of response groups that will be saved in the .res
file.

Optimizing the response matrix
------------------------------

The following feature is present in trafo since version 1.02 (SPEX
version 2.02). It allows the user to re-arrange the response
matrix to make more optimal use of parallel processing. There are
three options: 1. Keep the matrix as provided. 2. Try to
re-arrange the matrix into contiguous groups. The program tries to
identify physically distinctive components and avoids overlapping
data. 3. Split the matrix into N equal-sized components. This is
particularly useful for grating spectra (RGS) and allows for
efficient matrix multiplication on multi-core processors. Any
power of 2 between 8 and 32 should provide a fast response matrix.
In the terminal, this option is provided in the following way:

::
                
    How should the matrix be partioned?  
    Option 1: keep as provided (1 component, no re-arrangements)  
    Option 2: rearrange into contiguous groups  
    Option 3: split into N roughly equal-sized components  
    Enter your preferred option (1,2,3): 1

Option number 1 is the safest option to choose, but also the
slowest. Option 2 and 3 can provide a significant increase in
performance, but results should be carefully checked. More
information about re-arranging response matrices can be found in
the SPEX Manual.

Reading the spectra
-------------------

Then, trafo asks for the filenames of the source and background
spectra. First, provide the file name of the source spectrum.
trafo will return some of the basic properties of the spectral
file, like exposure time and values of the most important FITS
keywords.

::
               
    Enter filename spectrum to be read: PN-source.pi  
    Exposure time (s): 2.10571992E+04  
    Assuming Poissonian Errors  
    Areascal: 1.00000000E+00  
    Backscal: 1.00000000E+00  
    No BACKFILE keyword found  
    Corrscal: 1.00000000E+00  
    No CORRFILE keyword found  
    No RESPFILE keyword found  
    No ANCRFILE keyword found  
    No background specified in pha-file.

A background spectrum can be provided (optional), which will be
subtracted from the source spectrum. If a background file is
already specified in the FITS header of the source spectrum, this
question will not be asked.

::
               
    Read nevertheless a background file? (y/n) [no]: y  
    Enter filename background spectrum to be read: PN-background.pi  
    Exposure time (s): 2.10572832E+04  
    Assuming Poissonian Errors  
    Areascal: 1.00000000E+00  
    Backscal: 1.00000000E+00  
    No BACKFILE keyword found  
    Corrscal: 1.00000000E+00  
    No CORRFILE keyword found  
    No RESPFILE keyword found  
    No ANCRFILE keyword found

Bad channels and grouping
-------------------------

Depending on the instrument used, there is a chance that the
spectrum contains bad channels. This is especially true for
grating spectra. Sometimes the background spectrum can have a
different number of bad channels than the source spectrum. It is
therefore important that a particular bad channel in either of the
two spectra is ignored. In this example, there are no bad
channels, so either yes or no will do.

::
               
    Checking data quality and grouping ...  
    Ogip files have quality flags. Quality 0 means okay  
    Your spectrum file has          0 bins with bad quality  
    Your background file has        0 bins with bad quality  
    Your combined file has          0 bins with bad quality  
    Shall we ignore bad channels? (y/n) [no]:y

If grppha has been used on the spectrum, trafo will also ask
whether the spectra should be binned according to the groups
defined in the PHA file.

**Important note:** We do not recommend the use of grppha for
binning spectra. For spectra with Poisson statistics (most X-ray
spectra), it is much better to use C-statistics and use an optimal
binning algorithm in SPEX based on the spectral resolution of the
instrument.

Read response and effective area files
--------------------------------------

In the next step, the response matrix is read. Sometimes, the
response matrices start at channel 0, which can be somewhat
confusing. Especially when some arrays start at channel 0 and
others at channel 1. If both data sets start at zero, it is best
to shift the channel numbers with 1 unit. For most instruments
this is fine, however, there are situations when this does not
apply. In that case, please check your energy grid by loading a
delta line component in SPEX and check the energy of the line
manually. Then, compare the output with a delta line defined in
XSPEC.

::
               
     Determining background subtracted spectra ...  
     No response matrix file specified in pha-file.  
     Enter filename response matrix to be read: PN.rmf  
     Reading response matrix ...  
     Warning, ebounds data started at channel    0  
     Warning, response data started at channel 0  
     Possible response conflict; check xspec/spex with delta line!  
     Enter shift to response array (1 recommended, but some cases may be 0):1  
     No effective area file specified in pha-file.
               
             

Sometimes, also an effective area file needs to be provided
separately:

::
             
     Read nevertheless an effective area file? (y/n) [no]: y  
     Enter filename arf-file to be read: PN.arf  
     Reading effective area ...  
     Determining zero response data  ...  
     Total number of channels with zero response:      373  
     Original number of data channels                               :         4096  
     Channels after passing mask and omitting zero response channels:         3723  
     Rebinning data where necessary ...  
     Rebinning response where necessary ...  
     old number of response elements:       435950  
     new number of response elements:       435950  
     old number of response groups  :         1481  
     new number of response groups  :         1481  
     Correcting for effective area ...  
     
     Determine number of components ...  
     Found     1 components  
     Enter any shift in bins (0 recommended): 0  
     order will not be swapped ...
               
             

If there are bins with zero response, then they are excluded from
the resulting file. Also here a shift in bins can be set, but the
recommended value is 0.

Writing res and spo files
-------------------------

The final step is writing the spectra in SPEX format. The file
names should be provided without an extension. The .spo and .res
extension will be added automatically.

::
               
     Enter filename spectrum to be saved (without .spo): PN  
     Enter filename response to be saved (without .res): PN  
     Final number of response elements:   435950
               
             

The PN.spo and PN.res file have been saved in the current
directory.

