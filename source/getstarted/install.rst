.. _sec:install:

How to install SPEX
===================

  .. highlight:: none

Download
--------

SPEX install files can be downloaded from our Zenodo page.

We provide several options for installing SPEX. They all have their own install file:

+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Download type	           |Linux	                                                                                                               |Mac OS                                                                                                     |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Binary (Administrator)	   |	                                                                                                                       |`SPEX-3.05.00-MacOS.dmg <https://zenodo.org/record/2419563/files/spex-3.05.00-MacOS.dmg?download=1>`_      |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Binary (Non-Administrator)|`SPEX-3.05.00-Linux-x86_64.tar.gz <https://zenodo.org/record/2419563/files/spex-3.05.00-Linux-x86_64.tar.gz?download=1>`_  |`SPEX-3.05.00-MacOS.tar.gz <https://zenodo.org/record/2419563/files/spex-3.05.00-MacOS.tar.gz?download=1>`_|
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Windows 10	           |`spex-3.05.00-Linux-gfortran.tar.gz <ftp://ftp.sron.nl/pub/jellep/spex/v3.05/spex-3.05.00-Linux-gfortran.tar.gz>`_         |	                                                                                                   |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Source code	           |                    `SPEX-3.05.00-Source.tar.bz2 <https://zenodo.org/record/2419563/files/spex-3.05.00-Source.tar.bz2?download=1>`_                                                                                                    |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Docker image	           |                    `SPEX-3.05.00-docker.tar.gz <https://zenodo.org/record/2419563/files/spex-3.05.00-docker.tar.gz?download=1>`_                                                                                                      |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+

Linux
-----

Unpack the tar file in the destination directory (for example /usr/local/):: 

    tar xvfz spex-3.05.00-Linux-x86_64.tar.gz

The tar file will create a directory called SPEX-3.05.00-Linux in which the program will be installed.

Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.05.00-Linux)::
 
    export SPEX90=/usr/local/SPEX-3.05.00-Linux (bash shell)
    setenv SPEX90 /usr/local/SPEX-3.05.00-Linux (C-type shell)

Source the script provided by the distribution::
 
    source $SPEX90/spexdist.sh (bash shell)
    source $SPEX90/spexdist.csh (C-type shell)

Remove the tar file: rm SPEX-3.05.00-Linux-x86_64.tar.gz


Mac OS
------

Administrator install
^^^^^^^^^^^^^^^^^^^^^

If you have administrator rights on your Mac, this option is the easiest one. Download the DMG file from Zenodo (SPEX-3.05.00-MacOS.dmg), 
open it in Mac OS and follow the instructions on the screen.

Non-administrator install
^^^^^^^^^^^^^^^^^^^^^^^^^

Unpack the tar file in the destination directory (for example /usr/local/):: 

    tar xvfz spex-3.05.00-MacOS.tar.gz

The tar file will create a directory called SPEX-3.05.00-MacOS in which the program will be installed.

Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.05.00-MacOS)::
 
    export SPEX90=/usr/local/SPEX-3.05.00-MacOS (bash shell)
    setenv SPEX90 /usr/local/SPEX-3.05.00-MacOS (C-type shell)

Source the script provided by the distribution::
 
    source $SPEX90/spexdist.sh (bash shell)
    source $SPEX90/spexdist.csh (C-type shell)

Remove the tar file: rm SPEX-3.05.00-MacOS.tar.gz

Windows 10
^^^^^^^^^^

SPEX can be installed in Windows 10 using the new linux subsystem in Windows. SPEX can run in an Ubuntu Linux 
environment that can be installed through the Microsoft Store.

`How to install Ubuntu in Windows 10 <https://tutorials.ubuntu.com/tutorial/tutorial-ubuntu-on-windows#0>`_

In addition to the Ubuntu terminal, you also need a graphical X server. We recommend the XMING server. 
This will make sure that you can plot in SPEX.

Install SPEX in the Ubuntu environment
""""""""""""""""""""""""""""""""""""""

1. On the Ubuntu terminal, first install the OpenBlas library: apt-get install libopenblas-base

2. Download `spex-3.05.00-Linux-gfortran.tar.gz <ftp://ftp.sron.nl/pub/jellep/spex/v3.05/spex-3.05.00-Linux-gfortran.tar.gz>`_ 
   from our FTP server. This file is not (yet) available on Zenodo.
   Unpack the tar file in the destination directory (for example /usr/local/):: 

       tar xvfz spex-3.05.00-Linux-gfortran.tar.gz

   The tar file will create a directory called SPEX-3.05.00-Linux in which the program will be installed.

3. Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.05.00-Linux)::
 
       export SPEX90=/usr/local/SPEX-3.05.00-Linux (bash shell)
       setenv SPEX90 /usr/local/SPEX-3.05.00-Linux (C-type shell)

4. Source the script provided by the distribution::
 
       source $SPEX90/spexdist.sh (bash shell)
       source $SPEX90/spexdist.csh (C-type shell)

5. Remove the tar file: rm SPEX-3.05.00-Linux-gfortran.tar.gz


Source code
-----------

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

This Zenodo contains a tar.bz2 file containing the source code of SPEX: spex-3.05.00-Source.tar.bz2. Unpack it in a convenient directory::

    unix:~/Software> tar xvfj spex-3.05.00-Source.tar.bz2

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

    unix:~/Software/SPEX-3.05.00-Source> cmake .

If no errors occured and all libraries were found, then type 'make'::

    unix:~/Software/SPEX-3.05.00-Source> make
    
When the program needs to be installed system wide, then execute::

    unix:~/Software/SPEX-3.05.00-Source> sudo make install
    
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

    unix:~/Software/SPEX-3.05.00-Source> cmake . -DCMAKE_Fortran_COMPILER=ifort

Install prefix
""""""""""""""

Install SPEX at a different location in the 'make install' step::

    unix:~/Software/SPEX-3.05.00-Source> cmake . -DCMAKE_INSTALL_PREFIX=/home/user/software

Force use of SPEX libraries
"""""""""""""""""""""""""""

The use of the SPEX libraries in the source tree can be forced::

    unix:~/Software/SPEX-3.05.00-Source> cmake . -DCFITSIO=YES -DPGPLOT=YES
    
The command above will compile these libraries from the SPEX source tree. See the CMakeLists.txt file for more options.

Docker
------

SPEX is written mostly in Fortran 90 and depends on a few system libraries. This makes it difficult to provide a few 
binary versions that will continue to run on multiple platforms over many years. Therefore, we have also created a 
Docker image for SPEX that can be run on the Docker platform, which is available for Linux, Mac OS and Windows.

Step 1: Download and install Docker on your computer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To run a Docker image, please install Docker on your computer. See the `Docker website <https://www.docker.com/>`_ for details and look for the 
Docker Engine community edition. Once you have downloaded and installed Docker, you can continue with this tutorial.

Step 2: Download the SPEX docker image from Zenodo
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The SPEX Docker image is available on this Zenodo page as a tar.gz file. Please download the file called spex-[version]-docker.tar.gz, for example::

    spex-3.05.00-docker.tar.gz

Step 3: Import the SPEX image into Docker
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Before you can run the docker file, it should be imported into the docker system. This can be done on the command line::

    user@linux:~> docker load -i spex-3.05.00-docker.tar.gz

The image will be named spexxray/spex with the tag 3.05.00 and can be found with the command::

    user@linux:~> docker images
    REPOSITORY TAG IMAGE ID CREATED SIZE
    spexxray/spex 3.05.00 0a0a0a0a0a0 1 minute ago 311MB

Step 4: Run SPEX on Docker
^^^^^^^^^^^^^^^^^^^^^^^^^^

Using the docker run command, the image can be executed and SPEX can be run in a so-called container. To enjoy all the 
capabilities of SPEX, two things need to be arranged in the docker run command: access to local directories and a graphical 
X11 connection. To arrange this, additional flags need to be specified on the command line.

Mounting local directories to the container
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you would like to mount your own home directory into the SPEX container such that you can use some spo and res files there 
or save the output files, then you need the following flags::

    -e LOCAL_USER_ID=`id -u $USER`
    -v /home/myusername:/home/user

The first flag arranges that the user in the container will have the same user ID as you. This will allow you to read and 
write to your home directory from within the container.

The second flag arranges that your true local home directory called /home/myusername is mounted to /home/user inside the SPEX container.

MAC users: Please note that on OSX your home directory is in /Users/myusername.

Arranging the X11 connection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To make sure PGPLOT can connect to the X11 server on the host, we need to make a few connections from the container to the host machine. 
This is done with the following flags::

    -e DISPLAY=$DISPLAY
    -v /tmp/.X11-unix:/tmp/.X11-unix

The first flag sets the DISPLAY variable inside the container to the DISPLAY variable of the host machine. The second flag mounts the X11 
temporary directory of the host to the same directory inside the container.

MAC users: To use X11 on Mac, you need to install XQuartz (or a similar X11 server) and set it to 'Allow connections from network clients' 
in the XQuartz settings. In addition, the X server should be set to allow incoming connections from localhost on the command line::

    user@macos:~> xhost +127.0.0.1
    
Then the DISPLAY variable on the docker run line should be set to host.docker.internal:0

The complete docker run command
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The full run commands for docker now look like below, where -w means that the container will start in working directory /home/user.

For Linux::

    docker run -it \
    -e DISPLAY=$DISPLAY \
    -e LOCAL_USER_ID=`id -u $USER` \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /home/myusername:/home/user \
    -w /home/user \
    spexxray/spex:3.05.00

For Mac::

    docker run -it \
    -e DISPLAY=host.docker.internal:0 \
    -e LOCAL_USER_ID=`id -u $USER` \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /Users/myusername:/home/user \
    -w /home/user \
    spexxray/spex:3.05.00
    
The docker run command above will provide you with a prompt that will allow you to run spex::

    user@linux:~> docker run -it -e DISPLAY=$DISPLAY -e LOCAL_USER_ID=`id -u $USER` \ 
    -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/myusername:/home/user -w /home/user \
    spexxray/spex:3.05.00

    Welcome to the SPEX Docker Container!
    Just type 'spex' to start the program.
    user@0922f2e4ff85:~>

In this environment, you can just run spex or trafo::

    user@0922f2e4ff85:~> spex
    Welcome user to SPEX version 3.05.00

    NEW in this version of SPEX:
    11-06-2018 Added Ext_Rate column to new spo files
    18-12-2018 SPEX is now using the GPL license
    18-12-2018 Release of version 3.05.00

    SPEX>
    
