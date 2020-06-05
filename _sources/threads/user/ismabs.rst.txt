Use local Xspec model ismabs in SPEX
====================================

In this example, we include the Xspec local model called ismabs `(Gatuzz et al., 2015)
<https://ui.adsabs.harvard.edu/abs/2015ApJ...800...29G/abstract>`_ into a SPEX user model
executable. The local model consists of a FITS file with atomic data, a ``ismabs.f90`` Fortran file, and a parameter
definition file called ``lmodel_ismabs.dat`` where the parameters of the model are defined. Since the local model
is written in Fortran 90, the easiest way to use it in a SPEX user model is to write a Fortran 90 program that will be
the interface between SPEX and the model.

In this case, we need the following files and libraries:

 - The cfitsio library should be installed on the system.
 - Module `moduser.f90 <https://github.com/spex-xray/spex-help/blob/master/moduser/module/moduser.f90>`_ from our
   Github site.
 - Example program `loc-xspec.f90 <https://github.com/spex-xray/spex-help/blob/master/moduser/examples/local/loc-xspec.f90>`_
   as provided by our Github site.
 - The `ismabs <https://heasarc.gsfc.nasa.gov/xanadu/xspec/models/ismabs.html>`_ local model files as provided on the
   XSPEC web site.

Write a small user program
--------------------------

The ``moduser.f90`` file is a library with user callable functions to make it easy to write a user model. This file does
not need any editing. The user should only edit the example program ``loc-xspec.f90`` and sometimes also the local XSPEC
model, which will be explained later. The example program ``loc-xspec.f90`` looks like this::

      program locxspec
      use moduser
      implicit none

      integer             :: i

      ! Get input and output filenames
      call getfilenames(fin,fout,ier)

      ! Read input file
      call readprm(trim(fin))

      ! Allocate output arrays
      call allopar()

      ! Call local XSPEC model
      call ismabs(ipar%eg,ipar%neg,ipar%par,1,opar%sener)

      ! Do not use wener values for now
      do i=1,opar%neg
        opar%wener(i)=0.0
      enddo

      ! Write result to output file
      call writespc(fout)

      ! Clean up memory
      call deallpar()

      end program

Explanation of the called routines
----------------------------------

**getfilenames(fin,fout,ier)** is a routine to read the file names from the command line. The format of the files and the
order on the command line is defined by the user model in SPEX. This routine returns the file names the program needs
to read the input parameters and write the result.

**readprm(trim(fin))** is the routine that reads the input parameters and the input energy grid. It allocates and fills
the structure ipar with the needed numbers.

**allopar()** allocates the memory for the output arrays based on the input file.

**ismabs(ipar%eg,ipar%neg,ipar%par,1,opar%sener)** is the actual call of the XSPEC local model. The parameters from the
ipar structure contain the input parameters and the opar structure contains the output spectrum. For other local models
than ismabs, simply change the name of the routine on this line.

**writespc(fout)** writes the resulting spectrum to the output file.

**deallpar()** deallocates all the allocated variables from the moduser module.

Compile the executable
----------------------

In principle, the source files can now be compiled into an executable that the SPEX user model can use. Make sure you
have all the necessary files in one directory (see above) and execute the following commands in a terminal::

    linux:~/lmodel>  gfortran -g -c -o moduser.o moduser.f90
    linux:~/lmodel>  gfortran -g -c -o ismabs.o ismabs.f90
    linux:~/lmodel>  gfortran -g -c -o loc-xspec.o loc-xspec.f90
    linux:~/lmodel>  gfortran -g -o loc-xspec loc-xspec.o ismabs.o moduser.o

In the last step, it will be clear whether the executable has access to all the necessary functions. In this case, the
ismabs model needs cfitsio to read the fits file with atomic data. It also needs a few XSPEC internal functions to read
the path for the FITS file. The cfitsio library can be easily linked by adding -lcfitsio to the last command in the
sequence above. For the internal Xspec calls, we need to adapt ismabs.f90 slightly. The few calls to the XSPEC routines
can be removed and with a slight modification we can also make sure it finds the fits file. This step needs a little
programming experience to do it right. Always keep a backup of the original routine.

When you are done, repeat the following commands to create the executable::

    linux:~/lmodel>  gfortran -g -c -o ismabs.o ismabs.f90
    linux:~/lmodel>  gfortran -g -o loc-xspec loc-xspec.o ismabs.o
                        moduser.o -L/path/to/cfitsio -lcfitsio

The ’-L/path/to/cfitsio’ is optional. You may need to adapt it in case the compiler cannot find libcfitsio.so in the
library path. In this flag, you can specify the correct path to libcfitsio.so.

Use the Xspec local model in SPEX
---------------------------------

Start SPEX in a directory where the loc-xspec executable that we just made is located. Since the ismabs model is a
multiplicative model, we need to load the ``musr`` component. In the example below, we show how a power-law model is
absorbed by ismabs in SPEX::

    SPEX> com po
    SPEX> com musr
    SPEX> com rel 1 2
    # Link the new loc-xspec executable to the musr component
    SPEX> par 1 2 exec av ./loc-xspec
    # The number of parameters is found in ’local_ismabs.dat’, supplied by the Xspec model
    SPEX> par 1 2 npar v 31

The file ``local_ismabs.dat`` also describes the parameters and their limits in order. It is advisable to write a SPEX
command file to set the parameters and their ranges to their default values. The order of the parameters should be
the same in the ``musr`` model and in the ``local_ismabs.dat`` file. If the bookkeeping is right, you should be able to
issue a calculate command in SPEX and show the absorbed power law in a plot.
