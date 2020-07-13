.. _sec:compile:

Compile SPEX from source
------------------------

  .. highlight:: none

Table of Contents:

- Getting started
- Library dependencies
- MacOS instructions
- General compilation instructions
- Optional features
- Create install packages

Getting started
^^^^^^^^^^^^^^^

The SPEX source code can be compiled using the multi-platform Cmake build system. See `<http://www.cmake.org/>`_
for more information and downloads, or check the package manager of your Linux distribution. The SPEX install
needs CMake version 3.0 or higher.

Since SPEX is programmed mostly in Fortran 90, it is recommended to use a recent Fortran compiler. SPEX has
been tested with GFortran (version 4 and above) and the Intel Fortran Compiler.

This Zenodo contains a tar.bz2 file containing the source code of SPEX:
`spex-3.06.00-Source.tar.bz2 <https://zenodo.org/record/3939056/files/spex-3.06.00-Source.tar.bz2?download=1>`_.
Unpack it in a convenient directory::

    unix:~/Software> tar xvfj spex-3.06.00-Source.tar.bz2

In the top-level directory, a script called ``compile.py`` is available to guide the user through the compilation
process. Please read the section about library dependencies first and install what is needed. Otherwise, the script
will tell you what is missing. To run the script call::

    unix:~/Software/spex> python compile.py

Please note that the compile script requires Python 3 to be installed.


Library dependencies
^^^^^^^^^^^^^^^^^^^^

SPEX depends on a few external libraries to function. For some of those, the library source code has been included
in the SPEX source code package. By default, CMake will look for system libraries to link to. If they are not there,
then the version in the source package will be used.

The following libraries and packages are required to compile SPEX:

- CMake
- X11
- Readline
- CFITSIO (*)
- BLAS (*)
- LAPACK (*)
- PGPLOT (*)

(*) The SPEX source tree also contains the library if necessary.

All these libraries are commonly available in Linux distributions, so please read the documentation of your distribution
to find out how to install these libraries. Please note that some distributions require you to also install the
'development' package of a library to be able to use them during compilation. In the Debian repository, for example,
the development package of readline is called 'libreadline-dev'.

Below, we list some library-specific comments that can be helpful in case of problems.

Readline
""""""""

Note for Mac OSX users: The OSX readline library is NOT compatible with the GNU readline library. You need to compile
your own readline library from source or find a GNU readline library elsewhere on your system to link to. Compilation
may work in, for example, a MacPorts environment, although this has not been tested. The official Mac version of SPEX
statically links to a compiled version of readline downloaded from:

`<https://tiswww.case.edu/php/chet/readline/rltop.html>`_

CFITSIO
"""""""

The SPEX source tree contains an old fortran version of fitsio, which is sufficient for the vast majority of applications.
However, in exceptional cases, the old library cannot handle very large fits files. In those cases, it is better to link
to a system CFITSIO library.

BLAS and LAPACK
"""""""""""""""

Some of the SPEX models depend heavily on the BLAS and LAPACK linear algebra packages. The default routines are available
in the SPEX source tree, but compiling those will not provide the best performance. The performance improves substantially
if an optimized BLAS or LAPACK library is used. There are two tested options:

- Intel Math Kernel Library (MKL)
- OpenBLAS

When compiling with the Intel Fortran compiler, using MKL is quite obvious. To link the MKL library, add the following
option to the cmake command::

   cmake . -DMKL=YES

If MKL is not set, cmake will look for other options, like OpenBLAS, if they are installed on your machine. If nothing
is found, the non-optimized code in the SPEX source tree is used. On Mac, CMake could find the MacOS Accelerator framework.

MacOS instructions
^^^^^^^^^^^^^^^^^^

The compilation of SPEX on MacOS is slightly more demanding. SPEX can run natively on MacOS (without ports), but then it
needs a few pre-installed programs:

- Xcode (Through the App store)
- `CMake <https://cmake.org/download/>`_
- `XQuartz <https://www.xquartz.org/>`_
- `GNU readline <https://tiswww.case.edu/php/chet/readline/rltop.html>`_ Compile and install readline with 'clang' and install in /usr/local.
- Fortran compiler. For example `GCC/GFORTRAN <http://hpc.sourceforge.net/>`_.

General Compilation Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When all library dependencies are installed, the compilation process can begin. Execute cmake in the root directory of the SPEX source tree,
where CMakeLists.txt is located (mind the dot)::

    unix:~/Software/SPEX-3.06.00-Source> cmake .

If no errors occured and all libraries were found, then type 'make'::

    unix:~/Software/SPEX-3.06.00-Source> make

When the program needs to be installed system wide, then execute::

    unix:~/Software/SPEX-3.06.00-Source> sudo make install

The program will be installed to /opt/spex by default. Usually, administrator rights are necessary to copy the files to the right location.

Before you can run SPEX, the environment needs to be set. This can be done with the source command::

    source /opt/spex/spexdist.sh (bash shell)
    source /opt/spex/spexdist.csh (C-type shell)

In case you used another prefix for the SPEX installation directory, you can find spexdist.sh or spexdist.csh in the prefix directory
that you set. To load the SPEX environment automatically, add the relevant source line to your ~/.cshrc or ~/.bashrc file.

Optional features
^^^^^^^^^^^^^^^^^

There are several options that can be passed to CMake to influence the build process through the -D operator. Of course,
all options can be combined in a single cmake call. See the cmake documentation and the CMakeLists.txt file for details.

Compiler selection
""""""""""""""""""

Select a different fortran compiler::

    unix:~/Software/SPEX-3.06.00-Source> cmake . -DCMAKE_Fortran_COMPILER=ifort

Install prefix
""""""""""""""

Install SPEX at a different location in the 'make install' step::

    unix:~/Software/SPEX-3.06.00-Source> cmake . -DCMAKE_INSTALL_PREFIX=/home/user/software

Force use of SPEX libraries
"""""""""""""""""""""""""""

The use of the SPEX libraries in the source tree can be forced::

    unix:~/Software/SPEX-3.06.00-Source> cmake . -DCFITSIO=YES -DPGPLOT=YES

The command above will compile these libraries from the SPEX source tree. See the CMakeLists.txt file for more options.

